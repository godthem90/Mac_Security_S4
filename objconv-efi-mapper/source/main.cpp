#include <stdio.h>
#include "lib.h"
#include "containers.h"
#include "disasm.h"
#include "parser.h"
#include "data.h"
#include "virtual_machine.h"

#define UNMATCH						0
#define OPCODE_MATCH				1
#define OPERAND_MATCH				2
#define OPERAND_IMMEDIATE_MATCH		3

char *input_file_name1 = 0;
char *input_file_name2 = 0;
char *output_file_name = 0;
int threshold_percentage;

void usage()
{
	printf("./efi-mapper inputfile1 inputfile2\n");
}

typedef struct MappedBlock
{
	int percentage;
	int idx1;
	int idx2;
} MappedBlock;

typedef struct MappedFunction
{
	int idx1;
	int idx2;
	vector<MappedBlock> SameBlockList;
	vector<MappedBlock> SimilarBlockList;
} MappedFunction;

typedef struct CheckFunction
{
	uint64_t addr1;
	uint64_t addr2;
} CheckFunction;

class BlockMapper
{
public:
	BlockMapper(Program &p1, Program &p2) : prog1(p1), prog2(p2) {};
	void MapBlock(uint64_t func_addr1, uint64_t func_addr2);
	void Dump();

private:
	Program &prog1;
	Program &prog2;
	VirtualMachine vm;
	vector<MappedFunction> MappedFunctionList;

	vector<MappedBlock> SelectCandidates(vector<MappedBlock> &candidates_table);
	MappedBlock *InsertMappedBlock(MappedFunction &mapped_func, vector<MappedBlock> &candidates);
	bool IsAttributeEqual(OperandAttribute attr1, OperandAttribute attr2);
	bool IsInsnDependent(Instruction &insn1, Instruction &insn2);
	void GetDependencyTable(BlockNode &block, int *dep_table);
	int DiffBlock(BlockNode &block1, BlockNode &block2, vector<CheckFunction> *func_checklist);
	int IsOperandEqual( char *operand1, char *operand2 );
	int IsInstructionEqual(Instruction &insn1, Instruction &insn2);
};

// TODO function pointer match
int BlockMapper::IsOperandEqual( char *operand1, char *operand2 )
{
	if( operand1 == NULL && operand2 == NULL )
		return true;
	else if( operand1 == NULL && operand2 != NULL )
		return false;
	else if( operand1 != NULL && operand2 == NULL )
		return false;
	else
	{
		OperandAttribute attr1 = vm.GetAttribute(operand1);
		OperandAttribute attr2 = vm.GetAttribute(operand2);

		if( attr1.op_class == attr2.op_class )
		{
			/*if( attr1.op_class == IMMEDIATE )
			{
				if( attr1.value == attr2.value )
					return true;
				else
					return false;
			}
			else*/
				return true;
		}
	}

	return false;
}

int BlockMapper::IsInstructionEqual(Instruction &insn1, Instruction &insn2)
{
	uint32_t opcode1 = insn1.GetOpcode();
	char *operand1_1 = insn1.GetOperand1();
	char *operand1_2 = insn1.GetOperand2();
	uint32_t opcode2 = insn2.GetOpcode();
	char *operand2_1 = insn2.GetOperand1();
	char *operand2_2 = insn2.GetOperand2();

	if(opcode1 == opcode2)
	{
		// if(branch_insn)	// TODO
		if(IsOperandEqual(operand1_1, operand2_1) && IsOperandEqual(operand1_2, operand2_2))
			return true;
		else
			return false;
	}
	else
		return false;
}

vector<MappedBlock> BlockMapper::SelectCandidates(vector<MappedBlock> &candidates_table)
{
	int max_percentage = 0;
	for(int i = 0; i < candidates_table.size(); i++)
	{
		if( max_percentage < candidates_table[i].percentage )
			max_percentage = candidates_table[i].percentage;
	}

	vector<MappedBlock> candidates;
	for(int i = 0; i < candidates_table.size(); i++)
	{
		if(max_percentage == candidates_table[i].percentage)
			candidates.push_back(candidates_table[i]);
	}

	return candidates;
}

MappedBlock *BlockMapper::InsertMappedBlock(MappedFunction &mapped_func, vector<MappedBlock> &candidates)
{
	for(int i = 0; i < candidates.size(); i++)
	{
		int continue_check = 0;
		for(int j = 0; j < mapped_func.SameBlockList.size(); j++)
		{
			if(candidates[i].idx2 == mapped_func.SameBlockList[j].idx2)
			{
				continue_check = 1;
				break;
			}
		}
		for(int j = 0; j < mapped_func.SimilarBlockList.size(); j++)
		{
			if(candidates[i].idx2 == mapped_func.SimilarBlockList[j].idx2)
			{
				if(candidates[i].percentage == 100)
					mapped_func.SimilarBlockList.erase(mapped_func.SimilarBlockList.begin() + j);
				else if(candidates[i].percentage >= 70)
				{
					if(candidates[i].percentage > mapped_func.SimilarBlockList[i].percentage)
						mapped_func.SimilarBlockList.erase(mapped_func.SimilarBlockList.begin() + j);
					else
					{
						continue_check = 1;
						break;
					}
				}
			}
		}
		if(continue_check)
			continue;

		if(candidates[i].percentage >= 100)
		{
			mapped_func.SameBlockList.push_back(candidates[i]);
			return &candidates[i];
		}
		else if(candidates[i].percentage >= 70)
		{
			mapped_func.SimilarBlockList.push_back(candidates[i]);
			return &candidates[i];
		}
	}

	return NULL;
}

bool BlockMapper::IsAttributeEqual(OperandAttribute attr1, OperandAttribute attr2)
{
	if(attr1.op_class != attr2.op_class)
		return false;
	else
	{
		if(attr1.op_class == REG)
			return (attr1.reg_num == attr2.reg_num);
		else
			return false;
	}
}

bool BlockMapper::IsInsnDependent(Instruction &insn1, Instruction &insn2)
{
	if(vm.IsAlwaysDependent(insn1) || vm.IsAlwaysDependent(insn2))
		return true;

	vector<OperandAttribute> current_source_attr = vm.GetSourceAttribute(insn1);
	vector<OperandAttribute> current_dest_attr = vm.GetDestAttribute(insn1);
	vector<OperandAttribute> source_attr = vm.GetSourceAttribute(insn2);
	vector<OperandAttribute> dest_attr = vm.GetDestAttribute(insn2);

	// TODO dest equal to dest casue dependency break??
	for( int i = 0; i < current_dest_attr.size(); i++ )
	{
		for( int j = 0; j < dest_attr.size(); j++ )
		{
			if(IsAttributeEqual(current_dest_attr[i], dest_attr[j]))
				return true;
		}
	}
	for( int i = 0; i < current_source_attr.size(); i++ )
	{
		for( int j = 0; j < dest_attr.size(); j++ )
		{
			if(IsAttributeEqual(current_source_attr[i], dest_attr[j]))
				return true;
		}
	}
	for( int i = 0; i < source_attr.size(); i++ )
	{
		for( int j = 0; j < current_dest_attr.size(); j++ )
		{
			if(IsAttributeEqual(source_attr[i], current_dest_attr[j]))
				return true;
		}
	}

	return false;
}

void BlockMapper::GetDependencyTable(BlockNode &block, int *dep_table)
{
	uint32_t op_num = block.GetInsnNum();
	for(int i = 0; i < op_num; i++)
		dep_table[i] = 0;
	for(int i = 0; i < op_num; i++)
	{
		for(int j = i - 1; j >= 0; j--)
		{
			if(IsInsnDependent(block[i], block[j]))
				dep_table[i] = j;
		}
	}
}

int BlockMapper::DiffBlock(BlockNode &block1, BlockNode &block2, vector<CheckFunction> *func_checklist)
{
	uint32_t op_num1 = block1.GetInsnNum();
	uint32_t op_num2 = block2.GetInsnNum();

	int *matched1 = new int[op_num1];
	int *matched2 = new int[op_num2];
	memset(matched1, -1, sizeof(int) * op_num1);
	memset(matched2, -1, sizeof(int) * op_num2);

	int *dependency_table1 = new int[op_num1];
	int *dependency_table2 = new int[op_num2];
	GetDependencyTable(block1, dependency_table1);
	GetDependencyTable(block2, dependency_table2);

	int all_insn = op_num1 + op_num2;
	int match_insn1 = 0, match_insn2 = 0;
	for( int op_idx1 = 0; op_idx1 < op_num1; op_idx1++ )
	{
		int op_idx2 = matched1[dependency_table1[op_idx1]] + 1;
		for( ; op_idx2 < op_num2; op_idx2++ )
		{
			if(IsInstructionEqual(block1[op_idx1], block2[op_idx2]) && matched2[op_idx2] == -1)
			{
				matched1[op_idx1] = op_idx2;
				matched2[op_idx2] = op_idx1;
				match_insn1++;
				match_insn2++;

				uint32_t opcode1 = block1[op_idx1].GetOpcode();
				uint32_t opcode2 = block2[op_idx2].GetOpcode();
				if( func_checklist && opcode1 == 232 && opcode2 == 232 )
				{
					CheckFunction check_func;
					check_func.addr1 = htoi(block1[op_idx1].GetOperand1());
					check_func.addr2 = htoi(block2[op_idx2].GetOperand1());
					func_checklist->push_back(check_func);
				}
				break;
			}
		}
	}
	delete[] matched1;
	delete[] matched2;
	delete[] dependency_table1;
	delete[] dependency_table2;

	return (match_insn1 + match_insn2) * 100 / all_insn;
}

void BlockMapper::MapBlock(uint64_t func_addr1, uint64_t func_addr2)
{
	int func_idx1 = prog1.GetFuncIndex(func_addr1);
	int func_idx2 = prog2.GetFuncIndex(func_addr2);
	FunctionNode &func1 = prog1[func_idx1];
	FunctionNode &func2 = prog2[func_idx2];

	uint32_t block_num1 = func1.GetBlockNum();
	uint32_t block_num2 = func2.GetBlockNum();

	MappedFunction mapped_function;
	memset( &mapped_function, 0, sizeof(MappedFunction) );
	mapped_function.idx1 = func_idx1;
	mapped_function.idx2 = func_idx2;

	vector<CheckFunction> func_checklist;
	for( int i = 0; i < block_num1; i++ )
	{
		vector<MappedBlock> candidates_table;
		for( int j = 0; j < block_num2; j++ )
		{
			MappedBlock candidate_block;
			candidate_block.idx1 = i;
			candidate_block.idx2 = j;
			candidate_block.percentage = DiffBlock(func1[i], func2[j], NULL);
			candidates_table.push_back(candidate_block);
		}
		vector<MappedBlock> candidates = SelectCandidates(candidates_table);
		MappedBlock *inserted_block = InsertMappedBlock(mapped_function, candidates);
		if(inserted_block)
			DiffBlock(func1[inserted_block->idx1], func2[inserted_block->idx2], &func_checklist);
	}

	MappedFunctionList.push_back(mapped_function);
	for( int i = 0; i < func_checklist.size(); i++ )
		MapBlock(func_checklist[i].addr1, func_checklist[i].addr2);
}

void BlockMapper::Dump()
{
	for( int i = 0; i < MappedFunctionList.size(); i++ )
	{
		printf("*******************************************************************\n");
		printf("*******************************************************************\n");
		printf("*******************************************************************\n");
		struct MappedFunction &mapped_func = MappedFunctionList[i];
		FunctionNode &func1 = prog1[mapped_func.idx1];
		FunctionNode &func2 = prog2[mapped_func.idx2];
		uint32_t block_num1 = func1.GetBlockNum();
		uint32_t block_num2 = func2.GetBlockNum();
		printf("%s:0x%llx func total block : %d\n", input_file_name1, func1.StartAddress, block_num1);
		printf("%s:0x%llx func total block : %d\n", input_file_name2, func2.StartAddress, block_num2);
		printf("total matched block : %lu\n", mapped_func.SameBlockList.size());

		for( int j = 0; j < mapped_func.SameBlockList.size(); j++ )
		{
			struct MappedBlock &mapped_block = mapped_func.SameBlockList[j];
			BlockNode &block1 = func1[mapped_block.idx1];
			BlockNode &block2 = func2[mapped_block.idx2];

			printf("---------------------------------------------------------------\n");
			int percentage = mapped_block.percentage;
			uint64_t block_addr1 = block1.StartAddress;
			uint64_t block_addr2 = block2.StartAddress;
			printf("Block 0x%llx and Block 0x%llx matched with %d%%\n\n", block_addr1, block_addr2, percentage);
			printf("%s :\n", input_file_name1);
			block1.PrintBlockAssembly();
			printf("\n");
			printf("%s :\n", input_file_name2);
			block2.PrintBlockAssembly();
			printf("\n");
			printf("---------------------------------------------------------------\n");
		}
		printf("###################################################################\n");
		for( int j = 0; j < mapped_func.SimilarBlockList.size(); j++ )
		{
			struct MappedBlock &mapped_block = mapped_func.SimilarBlockList[j];
			BlockNode &block1 = func1[mapped_block.idx1];
			BlockNode &block2 = func2[mapped_block.idx2];

			printf("---------------------------------------------------------------\n");
			int percentage = mapped_block.percentage;
			uint64_t block_addr1 = block1.StartAddress;
			uint64_t block_addr2 = block2.StartAddress;
			printf("Block 0x%llx and Block 0x%llx matched with %d%%\n\n", block_addr1, block_addr2, percentage);
			printf("%s :\n", input_file_name1);
			block1.PrintBlockAssembly();
			printf("\n");
			printf("%s :\n", input_file_name2);
			block2.PrintBlockAssembly();
			printf("\n");
			printf("---------------------------------------------------------------\n");
		}
		printf("\n");
	}
}

int main(int argc, char * argv[]) {
	if(!CorrectIntegerTypes())
	{
		fprintf(stderr, "[error] Incorrect Integer Type\n");
		return -1;
	}
	if(!CorrectEndianness())
	{
		fprintf(stderr, "[error] Incorrect Endian (big-endian)\n");
		return -1;
	}

	if(argc != 5)
	{
		fprintf(stderr, "[error] Wrong Usage\n");
		//usage();
		return -1;
	}

	input_file_name1 = argv[1];
	uint32_t entry_addr1 = htoi(argv[2]);
	input_file_name2 = argv[3];
	uint32_t entry_addr2 = htoi(argv[4]);

	CFileBuffer input_buffer1(input_file_name1);
	input_buffer1.Read();
	CFileBuffer input_buffer2(input_file_name2);
	input_buffer2.Read();

	Parser parser1, parser2;
	CDisassembler disasm_engine1, disasm_engine2;
	input_buffer1 >> parser1;
	input_buffer2 >> parser2;
	parser1.Parse(&disasm_engine1);
	parser2.Parse(&disasm_engine2);

	Program prog1, prog2;
	disasm_engine1.ParseProgram(&prog1);
	disasm_engine2.ParseProgram(&prog2);

	BlockMapper block_mapper( prog1, prog2 );
	block_mapper.MapBlock( entry_addr1, entry_addr2 );
	block_mapper.Dump();

	parser1.Free();
	parser2.Free();

	return 0;
}

