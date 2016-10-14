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

char *output_file_name = 0;
int threshold_percentage;

void usage()
{
	printf("./efi-mapper inputfile1 inputfile2\n");
}

typedef struct MappedInstruction
{
	int credit;
	int idx1;
	int idx2;
} MappedInstruction;

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

typedef struct MappedAddr
{
	uint64_t addr1;
	uint64_t addr2;
} MappedAddr;

typedef struct CheckFunction
{
	uint64_t addr1;
	uint64_t addr2;
} CheckFunction;

class BlockMapper
{
public:
	vector<MappedAddr> MappedAddrList;

	BlockMapper(Program &p1, Program &p2);
	void MapStart();
	int MapBlock(uint64_t func_addr1, uint64_t func_addr2);
	void DumpMapped();
	void DumpUnmapped();

private:
	Program &prog1;
	Program &prog2;
	VirtualMachine vm;
	vector<MappedFunction> MappedFunctionList;
	vector<int> MappedFunctionTable1;
	vector<int> MappedFunctionTable2;

	bool IsInstructionEqual(Instruction &insn1, Instruction &insn2);
	bool IsBlockEqual(BlockNode &block1, BlockNode &block2);
	bool IsFunctionEqual(FunctionNode &func1, FunctionNode &func2);

	bool IsMapped(uint64_t func_addr1, uint64_t func_addr2);
	bool IsAttributeEqual(OperandAttribute attr1, OperandAttribute attr2);
	bool IsInsnDependent(Instruction &insn1, Instruction &insn2);
	void GetDependencyTable(BlockNode &block, int *dep_table);

	void GetMappedInsn(vector<int> &cmp_idx_list, vector<MappedInstruction> &insn_list, int idx1, int idx2);
	void SortMappedInstruction(vector<MappedInstruction> &insn_list);
	void UpdateCredit(vector<MappedInstruction> &insn_list);
	int InsertMappedInstruction(vector<MappedInstruction> &insn_list, MappedInstruction &mapped_insn);
	vector<MappedBlock> SelectCandidates(vector<MappedBlock> &candidates_table);
	MappedBlock *InsertMappedBlock(MappedFunction &mapped_func, vector<MappedBlock> &candidates);

	int DiffOperand( char *operand1, char *operand2 );
	int DiffInstruction(Instruction &insn1, Instruction &insn2);
	int DiffBlock(BlockNode &block1, BlockNode &block2, vector<MappedAddr> *mapped_addr_list, vector<CheckFunction> *func_checklist);
};

BlockMapper::BlockMapper(Program &p1, Program &p2) : prog1(p1), prog2(p2)
{
	MappedFunctionTable1.assign(prog1.GetFuncNum(), -1);
	MappedFunctionTable2.assign(prog2.GetFuncNum(), -1);
}

bool BlockMapper::IsInstructionEqual(Instruction &insn1, Instruction &insn2)
{
	uint32_t insn_size1 = insn1.GetSize();
	uint32_t insn_size2 = insn2.GetSize();

	if(insn_size1 != insn_size2)
		return false;
	for(int i = 0; i < insn_size1; i++)
	{
		if(insn1[i] != insn2[i])
			return false;
	}

	return true;
}

bool BlockMapper::IsBlockEqual(BlockNode &block1, BlockNode &block2)
{
	uint32_t insn_num1 = block1.GetInsnNum();
	uint32_t insn_num2 = block2.GetInsnNum();

	if(insn_num1 != insn_num2)
		return false;
	for(int i = 0; i < insn_num1; i++)
	{
		if(!IsInstructionEqual(block1[i], block2[i]))
			return false;
	}

	return true;
}

bool BlockMapper::IsFunctionEqual(FunctionNode &func1, FunctionNode &func2)
{
	uint32_t block_num1 = func1.GetBlockNum();
	uint32_t block_num2 = func2.GetBlockNum();

	if(block_num1 != block_num2)
		return false;
	for(int i = 0; i < block_num1; i++)
	{
		if(!IsBlockEqual(func1[i], func2[i]))
			return false;
	}

	return true;
}

bool BlockMapper::IsMapped(uint64_t func_addr1, uint64_t func_addr2)
{
	uint32_t func_idx1 = prog1.GetFuncIndex(func_addr1);
	uint32_t func_idx2 = prog2.GetFuncIndex(func_addr2);
	uint32_t mapped_num = MappedFunctionList.size();
	for(int i = 0; i < mapped_num; i++)
	{
		if(MappedFunctionList[i].idx1 == func_idx1)
			return true;
		if(MappedFunctionList[i].idx2 == func_idx2)
			return true;
	}

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

// TODO function pointer match
int BlockMapper::DiffOperand( char *operand1, char *operand2 )
{
	if( operand1 == NULL && operand2 == NULL )
		return 1;
	else if( operand1 == NULL && operand2 != NULL )
		return 0;
	else if( operand1 != NULL && operand2 == NULL )
		return 0;
	else
	{
		OperandAttribute attr1 = vm.GetAttribute(operand1);
		OperandAttribute attr2 = vm.GetAttribute(operand2);

		if( attr1.op_class == attr2.op_class )
		{
			if( attr1.op_class == IMMEDIATE )
			{
				if( attr1.value == attr2.value )
					return 10;
				else
					return 1;
			}
			else
				return 1;
		}
	}

	return 0;
}

int BlockMapper::DiffInstruction(Instruction &insn1, Instruction &insn2)
{
	uint32_t opcode1 = insn1.GetOpcode();
	char *operand1_1 = insn1.GetOperand1();
	char *operand1_2 = insn1.GetOperand2();
	uint32_t opcode2 = insn2.GetOpcode();
	char *operand2_1 = insn2.GetOperand1();
	char *operand2_2 = insn2.GetOperand2();

	if(opcode1 == opcode2)
	{
		int credit1 = DiffOperand(operand1_1, operand2_1);
		int credit2 = DiffOperand(operand1_2, operand2_2);
		if(credit1 && credit2)
			return credit1 + credit2;
		else
			return 0;
	}
	else
		return 0;
}

void BlockMapper::GetMappedInsn(vector<int> &cmp_idx_list, vector<MappedInstruction> &insn_list, int idx1, int idx2)
{
	for(int i = 0; i < insn_list.size(); i++)
	{
		if(insn_list[i].idx1 == idx1 || insn_list[i].idx2 == idx2)
			cmp_idx_list.push_back(i);
	}
}

void BlockMapper::SortMappedInstruction(vector<MappedInstruction> &insn_list)
{
	int size = insn_list.size();
	for(int i = 0; i < size; i++)
	{
		int max_idx = 0;
		for(int j = 1; j < size - i; j++)
		{
			if(insn_list[j].idx1 > insn_list[max_idx].idx1)
				max_idx = j;
			else if(insn_list[j].idx1 == insn_list[max_idx].idx1)
			{
				if(insn_list[j].idx2 > insn_list[max_idx].idx2)
					max_idx = j;
			}
		}

		MappedInstruction temp;
		temp = insn_list[size - i - 1];
		insn_list[size - i - 1] = insn_list[max_idx];
		insn_list[max_idx] = temp;
	}
}

void BlockMapper::UpdateCredit(vector<MappedInstruction> &insn_list)
{
	int size = insn_list.size();
	int cont_idx = size - 1;
	for(; cont_idx > 0; cont_idx--)
	{
		if(insn_list[cont_idx].idx1 == insn_list[cont_idx-1].idx1 - 1 
			&& insn_list[cont_idx].idx2 == insn_list[cont_idx-1].idx2 - 1)
			break;
	}

	if(cont_idx == size - 1)
		return;
	else
	{
		int group_credit = insn_list[size-1].credit + insn_list[size-2].credit;
		for(int i = cont_idx; i < size; i++)
			insn_list[i].credit = group_credit;
	}
}

int BlockMapper::InsertMappedInstruction(vector<MappedInstruction> &insn_list, MappedInstruction &mapped_insn)
{
	if(mapped_insn.credit)
	{
		vector<int> cmp_idx_list;
		GetMappedInsn(cmp_idx_list, insn_list, mapped_insn.idx1, mapped_insn.idx2);

		int credit_sum = 0;
		for(int i = 0; i < cmp_idx_list.size(); i++)
			credit_sum += insn_list[cmp_idx_list[i]].credit;

		if(mapped_insn.credit > credit_sum)
		{
			for(int i = cmp_idx_list.size() - 1; i >= 0; i--)
				insn_list.erase(insn_list.begin() + cmp_idx_list[i]);
			insn_list.push_back(mapped_insn);
			SortMappedInstruction(insn_list);
			UpdateCredit(insn_list);
			return 1;
		}
	}

	return 0;
}

int GetIdx2(vector<MappedInstruction> &insn_list, int idx1)
{
	int size = insn_list.size();
	for(int i = 0; i < size; i++)
	{
		if(insn_list[i].idx1 == idx1)
			return insn_list[i].idx2;
	}

	return -1;
}

int BlockMapper::DiffBlock(BlockNode &block1, BlockNode &block2, vector<MappedAddr> *mapped_addr_list, vector<CheckFunction> *func_checklist)
{
	uint32_t op_num1 = block1.GetInsnNum();
	uint32_t op_num2 = block2.GetInsnNum();

	int *dependency_table1 = new int[op_num1];
	int *dependency_table2 = new int[op_num2];
	GetDependencyTable(block1, dependency_table1);
	GetDependencyTable(block2, dependency_table2);

	vector<MappedInstruction> mapped_insn_list;
	for( int op_idx1 = 0; op_idx1 < op_num1; op_idx1++ )
	{
		//int op_idx2 = GetIdx2(mapped_insn_list, dependency_table1[op_idx1]) + 1;
		for( int op_idx2 = 0; op_idx2 < op_num2; op_idx2++ )
		{
			MappedInstruction mapped_insn;
			mapped_insn.idx1 = op_idx1;
			mapped_insn.idx2 = op_idx2;
			mapped_insn.credit = DiffInstruction(block1[op_idx1], block2[op_idx2]);

			if(InsertMappedInstruction(mapped_insn_list, mapped_insn))
				break;
		}
	}

	for(int i = 0; i < mapped_insn_list.size(); i++)
	{
		uint32_t opcode1 = block1[mapped_insn_list[i].idx1].GetOpcode();
		uint32_t opcode2 = block2[mapped_insn_list[i].idx2].GetOpcode();
		char *operand1_2 = block1[mapped_insn_list[i].idx1].GetOperand2();
		char *operand2_2 = block2[mapped_insn_list[i].idx2].GetOperand2();

		if(func_checklist)
		{
			if(opcode1 == 232 && opcode2 == 232)
			{
				CheckFunction check_func;
				check_func.addr1 = htoi(block1[mapped_insn_list[i].idx1].GetOperand1());
				check_func.addr2 = htoi(block2[mapped_insn_list[i].idx2].GetOperand1());
				func_checklist->push_back(check_func);
			}
			else if(opcode1 == 233 && opcode2 == 233)
			{
				CheckFunction check_func;
				check_func.addr1 = htoi(block1[mapped_insn_list[i].idx1].GetOperand1());
				check_func.addr2 = htoi(block2[mapped_insn_list[i].idx2].GetOperand1());
				if(prog1.GetFuncIndex(check_func.addr1) != -1
					&& prog2.GetFuncIndex(check_func.addr2) != -1)
					func_checklist->push_back(check_func);
			}
			else if(operand1_2 && operand2_2)
			{
				if(vm.IsData(operand1_2) && vm.IsData(operand2_2))
				{
					String addr_token1;
					String addr_token2;
					vm.GetMemAddrToken(operand1_2, addr_token1);
					vm.GetMemAddrToken(operand2_2, addr_token2);

					CheckFunction check_func;
					check_func.addr1 = htoi(addr_token1.GetString());
					check_func.addr2 = htoi(addr_token2.GetString());
					if(prog1.GetFuncIndex(check_func.addr1) != -1
						&& prog2.GetFuncIndex(check_func.addr2) != -1)
						func_checklist->push_back(check_func);
				}
			}
		}

		if(mapped_addr_list)
		{
			MappedAddr mapped_addr;
			mapped_addr.addr1 = block1[mapped_insn_list[i].idx1].GetAddr();
			mapped_addr.addr2 = block2[mapped_insn_list[i].idx2].GetAddr();
			mapped_addr_list->push_back(mapped_addr);
		}
	}

	delete[] dependency_table1;
	delete[] dependency_table2;

	return mapped_insn_list.size() * 2 * 100 / (op_num1 + op_num2);
}

int BlockMapper::MapBlock(uint64_t func_addr1, uint64_t func_addr2)
{
	int func_idx1 = prog1.GetFuncIndex(func_addr1);
	int func_idx2 = prog2.GetFuncIndex(func_addr2);
	if(func_idx1 == -1)
	{
		fprintf(stderr, "%s:0x%x function not found\n", prog1.GetFileName(), func_addr1);
		return -1;
	}
	if(func_idx2 == -1)
	{
		fprintf(stderr, "%s:0x%x function not found\n", prog2.GetFileName(), func_addr2);
		return - 1;
	}

	FunctionNode &func1 = prog1[func_idx1];
	FunctionNode &func2 = prog2[func_idx2];

	MappedFunction mapped_function;
	memset( &mapped_function, 0, sizeof(MappedFunction) );
	mapped_function.idx1 = func_idx1;
	mapped_function.idx2 = func_idx2;

	// TODO IsFunctionSame implement
	if(IsFunctionEqual(func1, func2))
	{
		/*uint32_t block_num = func1.GetBlockNum();
		for(int i = 0; i < block_num; i++)
			mapped_function.MappedBlockList.push_back()
		MappedFunctionList.push_back(mapped_function);
		MappedFunctionTable1[mapped_function.idx1] = mapped_function.idx2;
		MappedFunctionTable2[mapped_function.idx2] = mapped_function.idx1;*/
		return 100;
	}

	uint32_t block_num1 = func1.GetBlockNum();
	uint32_t block_num2 = func2.GetBlockNum();

	vector<CheckFunction> func_checklist;
	for( int i = 0; i < block_num1; i++ )
	{
		vector<MappedBlock> candidates_table;
		for( int j = 0; j < block_num2; j++ )
		{
			MappedBlock candidate_block;
			candidate_block.idx1 = i;
			candidate_block.idx2 = j;
			candidate_block.percentage = DiffBlock(func1[i], func2[j], NULL, NULL);
			candidates_table.push_back(candidate_block);
		}
		// TODO need some clean code
		vector<MappedBlock> candidates = SelectCandidates(candidates_table);
		MappedBlock *inserted_block = InsertMappedBlock(mapped_function, candidates);
		if(inserted_block)
			DiffBlock(func1[inserted_block->idx1], func2[inserted_block->idx2], &MappedAddrList, &func_checklist);
	}

	MappedFunctionList.push_back(mapped_function);
	MappedFunctionTable1[mapped_function.idx1] = mapped_function.idx2;
	MappedFunctionTable2[mapped_function.idx2] = mapped_function.idx1;
	for( int i = 0; i < func_checklist.size(); i++ )
	{
		if(!IsMapped(func_checklist[i].addr1, func_checklist[i].addr2))
			MapBlock(func_checklist[i].addr1, func_checklist[i].addr2);
	}
}

void BlockMapper::MapStart()
{
	if(prog1.EntryAddr && prog2.EntryAddr)
		MapBlock(prog1.EntryAddr, prog2.EntryAddr);
	else
		fprintf(stderr, "[error] entry point address not defined\n");

	// TODO map extra func
	/*uint32_t func_num1 = prog1.GetFuncNum();
	uint32_t func_num2 = prog2.GetFuncNum();
	for(int i = 0; (i < func_num1) && !MappedFunctionTable1[i]; i++)
	{
		for(int j = 0; (j < func_num2) !MappedFunctionTable2[j]; j++)
		{
			FunctionNode &func1 = prog1[i];
			FunctionNode &func2 = prog2[j];
			if(IsFunctionEqual(func1, func2))
			{
			}
		}
	}*/
}


void BlockMapper::DumpUnmapped()
{
	uint32_t func_num1 = prog1.GetFuncNum();
	uint32_t func_num2 = prog2.GetFuncNum();
	vector<bool> mapped_func_idx1(func_num1, false);
	vector<bool> mapped_func_idx2(func_num2, false);

	for(int i = 0; i < MappedFunctionList.size(); i++)
	{
		struct MappedFunction &mapped_func = MappedFunctionList[i];
		mapped_func_idx1[mapped_func.idx1] = true;
		mapped_func_idx2[mapped_func.idx2] = true;
		FunctionNode &func1 = prog1[mapped_func.idx1];
		FunctionNode &func2 = prog2[mapped_func.idx2];

		uint32_t block_num1 = func1.GetBlockNum();
		uint32_t block_num2 = func2.GetBlockNum();
		vector<bool> mapped_block_idx1(block_num1, false);
		vector<bool> mapped_block_idx2(block_num2, false);

		for(int j = 0; j < mapped_func.SameBlockList.size(); j++)
		{
			struct MappedBlock &mapped_block = mapped_func.SameBlockList[j];
			mapped_block_idx1[mapped_block.idx1] = true;
			mapped_block_idx2[mapped_block.idx2] = true;
		}

		/*for(int j = 0; j < mapped_func.SimilarBlockList.size(); j++)
		{
			struct MappedBlock &mapped_block = mapped_func.SimilarBlockList[j];
			mapped_block_idx1[mapped_block.idx1] = true;
			mapped_block_idx2[mapped_block.idx2] = true;
		}*/

		for(int j = 0; j < block_num1; j++)
		{
			if(!mapped_block_idx1[j])
			{
				printf("\n%s:0x%llx - %s:0x%llx unmapped block\n", prog1.GetFileName(), func1.StartAddress, prog2.GetFileName(), func2.StartAddress);
				BlockNode &block1 = func1[j];
				printf("%s :\n", prog1.GetFileName());
				block1.PrintBlockAssembly();
				printf("\n");
			}
		}

		for(int j = 0; j < block_num2; j++)
		{
			if(!mapped_block_idx2[j])
			{
				printf("\n%s:0x%llx - %s:0x%llx unmapped block\n", prog1.GetFileName(), func1.StartAddress, prog2.GetFileName(), func2.StartAddress);
				BlockNode &block2 = func2[j];
				printf("%s :\n", prog2.GetFileName());
				block2.PrintBlockAssembly();
				printf("\n");
			}
		}
	}

	for(int i = 0; i < func_num1; i++)
	{
		if(!mapped_func_idx1[i])
		{
			FunctionNode &func1 = prog1[i];
			printf("\n%s:0x%llx unmapped function\n", prog1.GetFileName(), func1.StartAddress);
			/*printf("%s :\n", prog1.GetFileName());
			func1.PrintFuncAssembly();
			printf("\n");*/
		}
	}

	for(int i = 0; i < func_num2; i++)
	{
		if(!mapped_func_idx2[i])
		{
			FunctionNode &func2 = prog2[i];
			printf("\n%s:0x%llx unmapped function\n", prog2.GetFileName(), func2.StartAddress);
			/*printf("%s :\n", prog2.GetFileName());
			func2.PrintFuncAssembly();
			printf("\n");*/
		}
	}
}

void BlockMapper::DumpMapped()
{
	for( int i = 0; i < MappedFunctionList.size(); i++ )
	{
		printf("*******************************************************************\n");
		struct MappedFunction &mapped_func = MappedFunctionList[i];
		FunctionNode &func1 = prog1[mapped_func.idx1];
		FunctionNode &func2 = prog2[mapped_func.idx2];
		uint32_t block_num1 = func1.GetBlockNum();
		uint32_t block_num2 = func2.GetBlockNum();
		printf("%s:0x%llx func total block : %d\n", prog1.GetFileName(), func1.StartAddress, block_num1);
		printf("%s:0x%llx func total block : %d\n", prog2.GetFileName(), func2.StartAddress, block_num2);
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
			printf("%s :\n", prog1.GetFileName());
			block1.PrintBlockAssembly();
			printf("\n");
			printf("%s :\n", prog2.GetFileName());
			block2.PrintBlockAssembly();
			printf("\n");
			printf("---------------------------------------------------------------\n");
		}
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
			printf("%s :\n", prog1.GetFileName());
			block1.PrintBlockAssembly();
			printf("\n");
			printf("%s :\n", prog2.GetFileName());
			block2.PrintBlockAssembly();
			printf("\n");
			printf("---------------------------------------------------------------\n");
		}
		printf("\n");
	}
}

bool map_flag = true;

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

	/*if(argc != 5)
	{
		fprintf(stderr, "[error] Wrong Usage\n");
		usage();
		return -1;
	}*/

	int j = 0;
	String input_file_name[2];
	String entry_point[2];
	for(int i = 1; i < argc; i++)
	{
		if(!strcmp(argv[i], "--map"))
			map_flag = true;
		else if(!strcmp(argv[i], "--unmap"))
			map_flag = false;
		else
		{
			char *dup = strdup(argv[i]);
			char *token = strtok(dup, ":");
			input_file_name[j].SetString(token);
			token = strtok(NULL, ":");
			entry_point[j].SetString(token);
			free(dup);
			j++;
		}
	}
	if(!input_file_name[0].GetString() && !input_file_name[1].GetString())
	{
		fprintf(stderr, "[error] no input file name\n");
		return 1;
	}
	// TODO input entry addr process

	CFileBuffer input_buffer1(input_file_name[0].GetString());
	input_buffer1.Read();
	CFileBuffer input_buffer2(input_file_name[1].GetString());
	input_buffer2.Read();

	Parser parser1, parser2;
	CDisassembler disasm_engine1, disasm_engine2;
	input_buffer1 >> parser1;
	input_buffer2 >> parser2;
	if(!parser1.Parse(&disasm_engine1) || !parser2.Parse(&disasm_engine2))
	{
		printf("parse failed with %s\n", input_file_name[0].GetString());
		printf("parse failed with %s\n", input_file_name[1].GetString());
		return 1;
	}

	CTextFileBuffer assembly1, assembly2;
	disasm_engine1.OutFile >> assembly1;
	disasm_engine2.OutFile >> assembly2;
	/*fwrite(assembly1.Buf(), 1, assembly1.GetBufSize(), stdout);
	fwrite(assembly2.Buf(), 1, assembly2.GetBufSize(), stdout);*/
	
	Program prog1(input_file_name[0].GetString()), prog2(input_file_name[1].GetString());
	disasm_engine1.ParseProgram(&prog1);
	disasm_engine2.ParseProgram(&prog2);

	//prog1.PrintFunctions();

	BlockMapper block_mapper(prog1, prog2);
	block_mapper.MapStart();
	if(map_flag)
		block_mapper.DumpMapped();
	else
		block_mapper.DumpUnmapped();
	/*for(int i = 0; i < block_mapper.MappedAddrList.size(); i++)
		printf("mapped addr : %llx %llx\n", block_mapper.MappedAddrList[i].addr1, block_mapper.MappedAddrList[i].addr2);*/

	input_file_name[0].Free();
	input_file_name[1].Free();
	entry_point[0].Free();
	entry_point[1].Free();
	parser1.Free();
	parser2.Free();

	return 0;
}

