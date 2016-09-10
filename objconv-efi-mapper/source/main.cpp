#include <stdio.h>
#include "lib.h"
#include "containers.h"
#include "disasm.h"
#include "parser.h"
#include "data.h"
#include "virtual_machine.h"

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

typedef struct OperandClass
{
	int op_class;
	int64_t value;
} OperandClass;

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

	bool IsAttributeEqual(OperandAttribute attr1, OperandAttribute attr2);
	bool IsInsnDependent(Instruction &insn1, Instruction &insn2);
	void GetDependencyTable(BlockNode &block, int *dep_table);
	int DiffBlock(BlockNode &block1, BlockNode &block2, vector<CheckFunction> &check_func_list);
	bool CmpOperand( char *operand1, char *operand2 );
};

/*bool BlockMapper::CmpOperand( char *operand1, char *operand2 )
{
	if( operand1 == NULL && operand2 == NULL )
		return true;
	else if( operand1 == NULL && operand2 != NULL )
		return false;
	else if( operand1 != NULL && operand2 == NULL )
		return false;
	else
	{
		OperandClass opclass1, opclass2;

		if( IsReg(operand1) )
			opclass1.op_class = REG;
		else if( IsData(operand1) )
			opclass1.op_class = DATA;
		else if( IsLocal(operand1) )
			opclass1.op_class = LOCAL;
		else if( IsAddr(operand1) )
			opclass1.op_class = ADDR;
		else if( IsImmediate(operand1) )
		{
			opclass1.op_class = IMMEDIATE;
			opclass1.value = atoi(operand1);
		}
		else
			opclass1.op_class = ETC;

		if( IsReg(operand2) )
			opclass2.op_class = REG;
		else if( IsData(operand2) )
			opclass2.op_class = DATA;
		else if( IsLocal(operand2) )
			opclass2.op_class = LOCAL;
		else if( IsAddr(operand2) )
			opclass2.op_class = ADDR;
		else if( IsImmediate(operand2) )
		{
			opclass2.op_class = IMMEDIATE;
			opclass2.value = atoi(operand2);
		}
		else
			opclass2.op_class = ETC;

		if( opclass1.op_class == opclass2.op_class )
		{
			if( opclass1.op_class == IMMEDIATE )
			{
				if( opclass1.value == opclass2.value )
					return true;
				else
					return false;
			}
			else
				return true;
		}
	}

	return false;
}*/

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

int BlockMapper::DiffBlock(BlockNode &block1, BlockNode &block2, vector<CheckFunction> &check_func_list)
{
	uint32_t opcode1, opcode2;
	char *operand1_1, *operand1_2, *operand2_1, *operand2_2;
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
			opcode1 = block1[op_idx1].GetOpcode();
			opcode2 = block2[op_idx2].GetOpcode();

			if( opcode1 == opcode2 && matched2[op_idx2] == -1 /*&& CmpOperand(operand1_1, operand2_1) && CmpOperand(operand1_2, operand2_2)*/ )
			{
				matched1[op_idx1] = op_idx2;
				matched2[op_idx2] = op_idx1;
				match_insn1++;
				match_insn2++;

				if( opcode1 == 232 && opcode2 == 232 )
				{
					CheckFunction check_func;
					check_func.addr1 = htoi(block1[op_idx1].GetOperand1());
					check_func.addr2 = htoi(block2[op_idx2].GetOperand1());
					check_func_list.push_back(check_func);
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

	vector<CheckFunction> check_func_list;
	for( int i = 0; i < block_num1; i++ )
	{
		MappedBlock mapped_block;
		memset( &mapped_block, 0, sizeof(MappedBlock) );
		for( int j = 0; j < block_num2; j++ )
		{
			int prev_checklist_idx = check_func_list.size();
			int percentage = DiffBlock(func1[i], func2[j], check_func_list);
			if( percentage < 70 && prev_checklist_idx != check_func_list.size() )
			{
				check_func_list.erase(check_func_list.begin() + prev_checklist_idx,
								check_func_list.begin() + check_func_list.size());
			}
			if( percentage >= mapped_block.percentage )
			{
				mapped_block.percentage = percentage;
				mapped_block.idx1 = i;
				mapped_block.idx2 = j;
			}
		}
		if( mapped_block.percentage == 100 )
			mapped_function.SameBlockList.push_back(mapped_block);
		else if( mapped_block.percentage >= 70 )
			mapped_function.SimilarBlockList.push_back(mapped_block);
	}

	MappedFunctionList.push_back(mapped_function);

	for( int i = 0; i < check_func_list.size(); i++ )
		MapBlock(check_func_list[i].addr1, check_func_list[i].addr2);
}

void BlockMapper::Dump()
{
	for( int i = 0; i < MappedFunctionList.size(); i++ )
	{
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

			printf("--------------------------------------------------------------------------\n\n");
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
			printf("--------------------------------------------------------------------------\n\n");
		}
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
		usage();
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

