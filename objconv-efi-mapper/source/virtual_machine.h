#include <cstdio>
#include <inttypes.h>
#include <vector>

#include "data.h"

#define INVALID		0
#define VALID		1

#define BYTE		8
#define WORD		16
#define DWORD		32
#define QWORD		64

#define RAX		0
#define RCX		1
#define RDX		2
#define RBX		3
#define RSP		4
#define RBP		5
#define RSI		6
#define RDI		7
#define R8		8
#define R9		9
#define R10		10
#define R11		11
#define R12		12
#define R13		13
#define R14		14
#define R15		15

#define REG			0
#define MEM			1
#define IMMEDIATE	2
#define ETC			3

#define MNEMONIC_MAX_SIZE	7

using namespace std;

const char reg_table[64][5] = {"rax", "rcx", "rdx", "rbx", "rsp", "rbp", "rsi", "rdi", "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15", 
							"eax", "ecx", "edx", "ebx", "esp", "ebp", "esi", "edi", "r8d", "r9d", "r10d", "r11d", "r12d", "r13d", "r14d", "r15d", 
							"ax", "cx", "dx", "bx", "sp", "bp", "si", "di", "r8w", "r9w", "r10w", "r11w", "r12w", "r13w", "r14w", "r15w", 
							"al", "cl", "dl", "bl", "spl", "bpl", "sil", "dil", "r8b", "r9b", "r10b", "r11b", "r12b", "r13b", "r14b", "r15b"};

const char operand2_source_insn[][MNEMONIC_MAX_SIZE] = {"mov", "movsx", "movzx", "movsxd", "cmovc", "lea", "add", "sub", "cmp", "and", "xor", "or", "test"};
const char operand1_source_insn[][MNEMONIC_MAX_SIZE] = {"inc", "dec", "add", "sub", "shl", "sar", "cmp", "and", "xor", "or", "push", "test", "not", "neg"};
const char operand1_dest_insn[][MNEMONIC_MAX_SIZE] = {"mov", "movsx", "movzx", "movsxd", "cmovc", "lea", "add", "sub", "shl", "sar", "and", "xor", "or", "not", "neg", "sete", "setne", "pop"};
const char always_dependent_insn[][MNEMONIC_MAX_SIZE] = {"nop", "call", "jmp", "ret", "jo", "jno", "jc", "jnc", "jz", "jnz", "jbe", "ja", "je", "js", "jns", "jne", "jpe", "jpo", "jl", "jge", "jle", "jg", "jcxz", "jecxz", "jrcxz"};

typedef struct VMAttribute
{
	bool state;
	int64_t value;
} VMAttribute;

typedef struct OperandAttribute
{
	public :
		int8_t op_class;
		int8_t reg_num;
		uint64_t mem_addr;
		bool state;
		int64_t value;
		int8_t word_size;
} OperandAttribute;

class VMemoryTable
{
	public :
		uint64_t addr;
		uint32_t size;
		int8_t *buffer;
		bool *state;

		VMemoryTable();
		//VMemoryTable( const &VMemoryTable &copy );	// todo
		//~VMemoryTAble();
		void VMemoryMerge( VMemoryTable &merge_table );
};

class VMemory
{
	public :
		VMemory();
		void SetMem( uint64_t addr, VMAttribute attr, int8_t word_size );
		template <typename T> void SetMem( uint64_t addr, VMAttribute attr );
		VMAttribute GetMem( uint64_t addr, int8_t word_size );
		template <typename T> VMAttribute GetMem( uint64_t addr );

	private :
		vector<VMemoryTable> vmemory_tables;

		bool IsAllocated( uint64_t addr, int size );
		void Allocate( uint64_t addr, int size );
		template <typename T> T & Buffer( uint64_t addr );
		bool & State( uint64_t addr );
};

class Register
{
	public :
		Register();
		bool state;
		int64_t value;
};

class VirtualMachine
{
	public :
		VirtualMachine();
		//~VirtualMachine();
		void Step( Instruction insn );
		bool IsAlwaysDependent(Instruction &insn);
		vector<OperandAttribute> GetSourceAttribute(Instruction &insn);
		vector<OperandAttribute> GetDestAttribute(Instruction &insn);
		void PrintReg();

	private :
		VMemory vmemory;
		Register reg_set[16];

		int64_t Atoi( char *operand );

		bool IsReg( char *operand );
		bool IsData( char *operand );
		bool IsLocal( char *operand );
		bool IsMem( char *operand );
		bool IsDecimal( char *operand );
		bool IsHex( char *operand );
		bool IsImmediate( char *operand );

		bool CheckDependencyTable(char *mnemonic);
		vector<OperandAttribute> GetDependencyAttribute( char *operand );

		void AssignAttribute( OperandAttribute dest_attr, OperandAttribute source_attr );
		OperandAttribute GetAttribute( char *operand );
		OperandAttribute GetRegAttribute( char *operand );
		int8_t GetRegNum( char *operand );
		int8_t GetRegWordsize( char *operand );
		OperandAttribute GetMemAttribute( char *operand );
		uint64_t GetMemAddr( char *opernad );
		int8_t GetMemWordsize(char *operand );
		OperandAttribute GetImmediateAttribute( char *operand );

		void StepPush(Instruction insn);
		void StepMov(Instruction insn);
		void StepLea(Instruction insn);

};
