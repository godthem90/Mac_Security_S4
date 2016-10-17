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
		void PushBinary(char bin);

		uint64_t GetAddr();
		uint32_t GetOpcode();
		char * GetMnemonic();
		char * GetOperand1();
		char * GetOperand2();
		uint32_t GetSize();

		void Print();

		void Free();

		char & operator [](uint32_t i);

	private :
		uint64_t addr;
		uint32_t opcode;
		String mnemonic;
		String operand1;
		String operand2;
		vector<char> binary;
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

typedef struct Symbol
{
	uint64_t addr;
	String name;
} Symbol;

class Program
{
	public :
		uint64_t EntryAddr;

		Program();
		~Program();
		void SetFileName(const char *file_name);
		void SetEntryAddr(uint64_t addr);
		void SetEntryAddr(const char *symbol);
		void Insert(FunctionNode func);
		void AddSymbol(uint64_t addr, const char *name);

		int GetFuncIndex(uint64_t addr);
		uint64_t GetFuncAddr(uint32_t idx);
		uint32_t GetFuncNum();
		const char *GetFileName();
		const char *GetSymbolName(uint64_t addr);
		uint64_t GetSymbolAddr(const char *symbol_name);

		void PrintFunctions();

		void Free();

		FunctionNode & operator [](uint32_t i);

	private :
		vector<FunctionNode> Functions;
		String FileName;
		vector<Symbol> SymbolTable;
};

#endif

