#ifndef _DATA_H_
#define _DATA_H_

#include <vector>
#include "containers.h"

using namespace std;

uint64_t htoi( char *hex_str );

class Instruction
{
	public :
		Instruction();
		~Instruction();

		void SetAddr( uint64_t addr );
		void SetOpcode( uint32_t opcode );
		void SetMnemonic( char *str, int len );
		void SetOperand1( char *str, int len );
		void SetOperand2( char *str, int len );

		uint64_t GetAddr();
		uint32_t GetOpcode();
		char * GetMnemonic();
		char * GetOperand1();
		char * GetOperand2();

		void SplitInstruction( char *buf );

		void Print();

	private :
		uint64_t addr;
		uint32_t opcode;
		String mnemonic;
		String operand1;
		String operand2;
};

/*#define UNKNOWN		0
#define PARAM		1
#define LOCAL		2
#define GLOBAL		3
#define CODE		4
#define IMMEDIATE	5

#define BIT_X		'X'
#define BIT_0		'0'
#define BIT_1		'1'*/

class Register
{
	public :
		int state;
		int operation;
		char value[64];

		void SetValue( int64_t val );
		int64_t GetValue();
};

typedef struct registerSet{
	Register Reg[16];
	//rax, rbx, rcx, rdx, rsi, rdi, rbp, rsp, r8, r9, r10, r11, r12, r13, r14, r15
}RegisterSet;

class BlockNode
{
	public :
		BlockNode();
		void Init( vector<Instruction> insns, uint64_t start_addr, uint64_t end_addr );
		uint64_t GetBlockAddr();
		uint32_t GetNextBlockNum();
		uint64_t GetNextBlockAddr( int idx );
		uint32_t GetOpNum();
		uint32_t GetOpcode( uint32_t op_idx );
		char *GetOperand1( uint32_t op_idx );
		char *GetOperand2( uint32_t op_idx );
		void PrintBlockAssembly();

	private :
		uint64_t StartAddress;
		uint64_t EndAddress;
		vector<uint64_t> NextBlockAddress;
		vector<Instruction> BlockAssembly;	// Block Code Flow -> Register Check
		RegisterSet reg_set;

		void SplitBlock( char *buf );
		void SetNextBlockInfo();
};

class FlowGraph
{
	public :
		FlowGraph();
		void Insert( BlockNode *block );
		uint32_t GetBlockNum();
		uint64_t GetBlockAddr( uint32_t block_idx );
		uint32_t GetOpNumInBlock( uint32_t block_idx );
		uint32_t GetOpcodeInBlock( uint32_t block_idx, uint32_t op_idx );
		char * GetOperand1InBlock( uint32_t block_idx, uint32_t op_idx );
		char * GetOperand2InBlock( uint32_t block_idx, uint32_t op_idx );
		void PrintAllPath();
		void PrintBlockAssembly( uint32_t block_idx );

	private :
		void RecursiveSearch( int block_idx );
		int GetBlockIndex( uint64_t block_addr );
		vector<BlockNode *> Blocks;
		vector<int> Path;
};

#endif

