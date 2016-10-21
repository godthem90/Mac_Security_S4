#include "lib1.h"
#include "containers.h"
#include "data.h"
#include "virtual_machine.h"

#define UNMATCH						0
#define OPCODE_MATCH				1
#define OPERAND_MATCH				2
#define OPERAND_IMMEDIATE_MATCH		3

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
    uint32_t num1;
    uint32_t num2;
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
    vector<MappedAddr> notMappedAddrList;

	BlockMapper(Program &p1, Program &p2);
	void MapStart(bool map_flag);
	int MapBlock(uint64_t func_addr1, uint64_t func_addr2);
	void DumpMapped();
	void DumpUnmapped();
	void PrintMappedFunc();
    Program &prog1;
    Program &prog2;
    vector<MappedFunction> MappedFunctionList;

private:
    VirtualMachine vm;
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
    int DiffBlock(BlockNode &block1, BlockNode &block2, vector<MappedAddr> *notmapped_addr_list, vector<MappedAddr> *mapped_addr_list, vector<CheckFunction> *func_checklist);
};


