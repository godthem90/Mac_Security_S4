#include <stdio.h>
#include <iostream>
#include <memory>
#include <stdexcept>
#include <sstream>

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
	vector<MappedBlock> MappedBlockList;
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
	void MapStart(bool map_flag);
	int MapBlock(uint64_t func_addr1, uint64_t func_addr2);
	void DumpMapped();
	void DumpUnmapped();
	void PrintMappedFunc();

private:
	Program &prog1;
	Program &prog2;
	VirtualMachine vm;
	vector<MappedFunction> MappedFunctionList;
	vector<int> MappedFunctionTable1;
	vector<int> MappedFunctionTable2;

	void CheckEqualFunction(Instruction &insn1, Instruction &insn2, vector<CheckFunction> *func_checklist);
	bool IsInstructionEqual(Instruction &insn1, Instruction &insn2, vector<CheckFunction> *func_checklist);
	bool IsBlockEqual(BlockNode &block1, BlockNode &block2, vector<CheckFunction> *func_checklist);
	bool IsFunctionEqual(FunctionNode &func1, FunctionNode &func2, vector<CheckFunction> *func_checklist);

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

void BlockMapper::CheckEqualFunction(Instruction &insn1, Instruction &insn2, vector<CheckFunction> *func_checklist)
{
	if(!func_checklist)
		return;

	uint32_t opcode1 = insn1.GetOpcode();
	uint32_t opcode2 = insn2.GetOpcode();
	char *operand1_1 = insn1.GetOperand1();
	char *operand2_1 = insn2.GetOperand1();
	char *operand1_2 = insn1.GetOperand2();
	char *operand2_2 = insn2.GetOperand2();

	if(opcode1 == 232 && opcode2 == 232)
	{
		CheckFunction check_func;
		check_func.addr1 = htoi(operand1_1);
		check_func.addr2 = htoi(operand2_1);
		func_checklist->push_back(check_func);
	}
	else if(opcode1 == 233 && opcode2 == 233)
	{
		CheckFunction check_func;
		check_func.addr1 = htoi(operand1_1);
		check_func.addr2 = htoi(operand2_1);
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

bool BlockMapper::IsInstructionEqual(Instruction &insn1, Instruction &insn2, vector<CheckFunction> *func_checklist)
{
	uint32_t insn_size1 = insn1.GetSize();
	uint32_t insn_size2 = insn2.GetSize();

	if(insn_size1 != insn_size2)
		return false;
	for(int i = 0; i < insn_size1; i++)
	{
		if(insn1[i] != insn2[i])
			return false;
		else
			CheckEqualFunction(insn1, insn2, func_checklist);
	}

	return true;
}

bool BlockMapper::IsBlockEqual(BlockNode &block1, BlockNode &block2, vector<CheckFunction> *func_checklist)
{
	uint32_t insn_num1 = block1.GetInsnNum();
	uint32_t insn_num2 = block2.GetInsnNum();

	if(insn_num1 != insn_num2)
		return false;
	for(int i = 0; i < insn_num1; i++)
	{
		if(!IsInstructionEqual(block1[i], block2[i], func_checklist))
			return false;

	}

	return true;
}

bool BlockMapper::IsFunctionEqual(FunctionNode &func1, FunctionNode &func2, vector<CheckFunction> *func_checklist)
{
	uint32_t block_num1 = func1.GetBlockNum();
	uint32_t block_num2 = func2.GetBlockNum();

	if(block_num1 != block_num2)
		return false;
	for(int i = 0; i < block_num1; i++)
	{
		if(!IsBlockEqual(func1[i], func2[i], func_checklist))
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
		int idx = 0;
		int list_size = mapped_func.MappedBlockList.size();
		int continue_check = 0;
		for(; idx < list_size; idx++)
		{
			if(candidates[i].idx2 == mapped_func.MappedBlockList[idx].idx2)
				break;
		}
		if(idx != list_size)
		{
			if(candidates[i].percentage > mapped_func.MappedBlockList[idx].percentage)
			{
				mapped_func.MappedBlockList.erase(mapped_func.MappedBlockList.begin() + idx);
				mapped_func.MappedBlockList.push_back(candidates[i]);
				return &candidates[i];
			}
		}
		else
		{
			if(candidates[i].percentage >= 70)
			{
				mapped_func.MappedBlockList.push_back(candidates[i]);
				return &candidates[i];
			}
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
		Instruction &insn1 = block1[mapped_insn_list[i].idx1];
		Instruction &insn2 = block2[mapped_insn_list[i].idx2];

		if(func_checklist)
			CheckEqualFunction(insn1, insn2, func_checklist);

		if(mapped_addr_list)
		{
			MappedAddr mapped_addr;
			mapped_addr.addr1 = insn1.GetAddr();
			mapped_addr.addr2 = insn2.GetAddr();
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
		printf("%s:0x%x function not found\n", prog1.GetFileName(), func_addr1);
		return -1;
	}
	if(func_idx2 == -1)
	{
		printf("%s:0x%x function not found\n", prog2.GetFileName(), func_addr2);
		return - 1;
	}

	FunctionNode &func1 = prog1[func_idx1];
	FunctionNode &func2 = prog2[func_idx2];

	MappedFunction mapped_function;
	memset( &mapped_function, 0, sizeof(MappedFunction) );
	mapped_function.idx1 = func_idx1;
	mapped_function.idx2 = func_idx2;

	vector<CheckFunction> func_checklist;
	// TODO IsFunctionSame implement
	if(IsFunctionEqual(func1, func2, &func_checklist))
	{
		uint32_t block_num = func1.GetBlockNum();
		for(int i = 0; i < block_num; i++)
		{
			MappedBlock mapped_block = {100, i, i};
			mapped_function.MappedBlockList.push_back(mapped_block);
		}
		MappedFunctionList.push_back(mapped_function);
		MappedFunctionTable1[mapped_function.idx1] = mapped_function.idx2;
		MappedFunctionTable2[mapped_function.idx2] = mapped_function.idx1;
	}
	else
	{
		func_checklist.clear();
		uint32_t block_num1 = func1.GetBlockNum();
		uint32_t block_num2 = func2.GetBlockNum();

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
	}

	for( int i = 0; i < func_checklist.size(); i++ )
	{
		if(!IsMapped(func_checklist[i].addr1, func_checklist[i].addr2))
			MapBlock(func_checklist[i].addr1, func_checklist[i].addr2);
	}
}

void BlockMapper::MapStart(bool map_flag)
{
	if(prog1.EntryAddr && prog2.EntryAddr)
		MapBlock(prog1.EntryAddr, prog2.EntryAddr);
	else
		fprintf(stderr, "[error] entry point address not defined\n");

	// TODO map extra func
	if(!map_flag)
	{
		uint32_t func_num1 = prog1.GetFuncNum();
		uint32_t func_num2 = prog2.GetFuncNum();
		for(int i = 0; i < func_num1; i++)
		{
			if(MappedFunctionTable1[i] != -1)
				continue;
			for(int j = 0; j < func_num2; j++)
			{
				if(MappedFunctionTable1[i] != -1)
					continue;
				FunctionNode &func1 = prog1[i];
				FunctionNode &func2 = prog2[j];
				if(IsFunctionEqual(func1, func2, NULL))
				{
					MappedFunction mapped_function;
					memset( &mapped_function, 0, sizeof(MappedFunction) );
					mapped_function.idx1 = i;
					mapped_function.idx2 = j;
					uint32_t block_num = func1.GetBlockNum();
					for(int i = 0; i < block_num; i++)
					{
						MappedBlock mapped_block = {100, i, i};
						mapped_function.MappedBlockList.push_back(mapped_block);
					}
					MappedFunctionList.push_back(mapped_function);
					MappedFunctionTable1[mapped_function.idx1] = mapped_function.idx2;
					MappedFunctionTable2[mapped_function.idx2] = mapped_function.idx1;
				}
			}
		}
	}
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

		for(int j = 0; j < mapped_func.MappedBlockList.size(); j++)
		{
			struct MappedBlock &mapped_block = mapped_func.MappedBlockList[j];
			if(mapped_block.percentage == 100)
			{
				mapped_block_idx1[mapped_block.idx1] = true;
				mapped_block_idx2[mapped_block.idx2] = true;
			}
		}

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
		printf("total matched block : %lu\n", mapped_func.MappedBlockList.size());

		for( int j = 0; j < mapped_func.MappedBlockList.size(); j++ )
		{
			struct MappedBlock &mapped_block = mapped_func.MappedBlockList[j];
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

void BlockMapper::PrintMappedFunc()
{
	uint32_t mapped_func_num = MappedFunctionList.size();
	for(int i = 0; i < mapped_func_num; i++)
	{
		MappedFunction mapped_func = MappedFunctionList[i];
		uint64_t func_addr1 = prog1[mapped_func.idx1].StartAddress;
		uint64_t func_addr2 = prog2[mapped_func.idx2].StartAddress;

		const char *sym_name1 = prog1.GetSymbolName(func_addr1);
		const char *sym_name2 = prog2.GetSymbolName(func_addr2);
		if(sym_name1)
			printf("%s", sym_name1);
		else
			printf("0x%X", func_addr1);

		printf(" - ");

		if(sym_name2)
			printf("%s", sym_name2);
		else
			printf("0x%X", func_addr2);

		printf("\n");
	}
}

typedef struct EfiFile
{
	String GUID;
	String Path;
} EfiFile;

bool map_flag = true;

void ProcessArgument(vector<EfiFile> &file_list, const char *dir_path)
{
	string input_dir;
	input_dir.assign(dir_path);
	if(input_dir[input_dir.size()-1] == '/')
		input_dir.pop_back();

	char buffer[128];
	string cmd;
	cmd += "find ";
	cmd += input_dir;
	cmd += " -name \"*PE32 image section*\"";
	string result = "";
	shared_ptr<FILE> pipe(popen(cmd.c_str(), "r"), pclose);
	if (!pipe)
	{
		fprintf(stderr, "[error] popen() failed!\n");
		exit(1);
	}
	while (!feof(pipe.get())) {
		if (fgets(buffer, 128, pipe.get()) != NULL)
			result += buffer;
	}

	vector<String> internal;
	stringstream ss(result);
	string tok;

	while(getline(ss, tok, '\n')) {
		String token;
		token.SetString(tok.c_str());
		internal.push_back(token);
	}

	uint32_t file_num = internal.size();
	for(int i = 0; i < file_num; i++)
	{
		EfiFile efi_file;
		efi_file.Path = internal[i];
		vector<String> tokens;
		internal[i].Tokenize(tokens, '/');

		uint32_t guid_idx = 0;
		uint32_t token_num = tokens.size();
		for(int j = token_num - 1; j >= 0; j--)
		{
			if(tokens[j].Find("Compressed section"))
			{
				guid_idx = j - 1;
				break;
			}
		}

		vector<String> guid_tokens;
		tokens[guid_idx].Tokenize(guid_tokens, ' ');
		efi_file.GUID.SetString(guid_tokens.back().GetString());
		file_list.push_back(efi_file);
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

	if(argc != 2)
	{
		printf("need one argument\n");
		return 1;
	}

	vector<EfiFile> file_list;
	ProcessArgument(file_list, argv[1]);

	for(int i = 0; i < file_list.size(); i++)
		printf("GUID : %s\nPath : %s\n\n", file_list[i].GUID.GetString(), file_list[i].Path.GetString());
	// get guid name

	/*if(argc != 5)
	{
		fprintf(stderr, "[error] Wrong Usage\n");
		usage();
		return -1;
	}*/

	/*int j = 0;
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

	CFileBuffer input_buffer1(input_file_name[0].GetString());
	CFileBuffer input_buffer2(input_file_name[1].GetString());
	input_buffer1.Read();
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
	}*/

	/*CTextFileBuffer assembly1, assembly2;
	disasm_engine1.OutFile >> assembly1;
	disasm_engine2.OutFile >> assembly2;
	fwrite(assembly1.Buf(), 1, assembly1.GetBufSize(), stdout);
	fwrite(assembly2.Buf(), 1, assembly2.GetBufSize(), stdout);
	
	Program prog1, prog2;
	prog1.SetFileName(input_file_name[0].GetString());
	prog2.SetFileName(input_file_name[1].GetString());
	disasm_engine1.ParseProgram(&prog1);
	disasm_engine2.ParseProgram(&prog2);
	// TODO input entry addr process
	if(entry_point[0].GetString())
		prog1.SetEntryAddr(htoi(entry_point[0].GetString()));
	if(entry_point[1].GetString())
		prog2.SetEntryAddr(htoi(entry_point[1].GetString()));

	//prog1.PrintFunctions();

	BlockMapper block_mapper(prog1, prog2);
	block_mapper.MapStart(map_flag);
	if(map_flag)
		block_mapper.DumpMapped();
	else
		block_mapper.DumpUnmapped();
	block_mapper.PrintMappedFunc();
	for(int i = 0; i < block_mapper.MappedAddrList.size(); i++)
		printf("mapped addr : %llx %llx\n", block_mapper.MappedAddrList[i].addr1, block_mapper.MappedAddrList[i].addr2);*/

	/*input_file_name[0].Free();
	input_file_name[1].Free();
	entry_point[0].Free();
	entry_point[1].Free();
	parser1.Free();
	parser2.Free();*/

	return 0;
}

