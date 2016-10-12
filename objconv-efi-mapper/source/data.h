#ifndef _DATA_H_
#define _DATA_H_

#include <vector>
#include "containers.h"

using namespace std;

class Instruction
{
	public :
		Instruction();
		~Instruction();

		void SetInstruction( char *buf );
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

		void Print();

	private :
		uint64_t addr;
		uint32_t opcode;
		String mnemonic;
		String operand1;
		String operand2;
};

class BlockNode
{
	public :
		uint64_t StartAddress;
		uint64_t EndAddress;

		BlockNode();
		~BlockNode();
		void Init( vector<Instruction> insns, uint64_t start_addr, uint64_t end_addr );
		uint32_t GetNextBlockNum();
		uint64_t GetNextBlockAddr( int idx );
		uint32_t GetInsnNum();
		void PrintBlockAssembly();
		void Free();

		Instruction & operator[](uint32_t i);

	private :
		vector<uint64_t> NextBlockAddress;
		vector<Instruction> BlockAssembly;
		//RegisterSet reg_set;

		void SplitBlock( char *buf );
		void SetNextBlockInfo();
};

class FunctionNode
{
	public :
		uint64_t StartAddress;
		uint64_t EndAddress;

		FunctionNode();
		~FunctionNode();
		void Insert( BlockNode block );
		uint32_t GetBlockNum();
		void PrintAllPath();
		void PrintFuncAssembly();
		void Free();

		BlockNode & operator [](uint32_t i);

	private :
		vector<BlockNode> Blocks;
		vector<int> Path;

		void RecursiveSearch( int block_idx );
		int GetBlockIndex( uint64_t block_addr );
};

class Program
{
	public :
		uint64_t EntryAddr;

		Program(char *file_name);
		void Insert(FunctionNode func);
		int GetFuncIndex(uint64_t addr);
		uint32_t GetFuncNum();
		char *GetFileName();
		void PrintFunctions();

		FunctionNode & operator [](uint32_t i);

	private :
		vector<FunctionNode> Functions;
		String FileName;
};

#endif

