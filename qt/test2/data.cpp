#include "lib1.h"
#include "data.h"

Instruction::Instruction() { memset(this, 0, sizeof(*this)); }
Instruction::~Instruction() { mnemonic.Free(); operand1.Free(); operand2.Free(); memset(this, 0, sizeof(*this)); }

void Instruction::SetAddr( uint64_t addr ) {this->addr = addr;}
void Instruction::SetOpcode( uint32_t opcode ) {this->opcode = opcode;}
void Instruction::SetMnemonic( char *str, int len ) { mnemonic.SetString(str, len); }
void Instruction::SetOperand1( char *str, int len ) { operand1.SetString(str, len); }
void Instruction::SetOperand2( char *str, int len ) { operand2.SetString(str, len); }

uint64_t Instruction::GetAddr() { return addr; }
uint32_t Instruction::GetOpcode() { return opcode; }
char * Instruction::GetMnemonic() { return mnemonic.GetString(); }
char * Instruction::GetOperand1() { return operand1.GetString(); }
char * Instruction::GetOperand2() { return operand2.GetString(); }

void Instruction::SetInstruction( char *buf )
{
	int i = 0;
	int token_start;

	while( buf[i] == ' ' ) i++;
	token_start = i;
	while( buf[i] != ' ' && buf[i] != 0 ) i++;
	SetMnemonic( &buf[token_start], i - token_start );
	if( buf[i++] == 0 ) return;

	while( buf[i] == ' ' ) i++;
	token_start = i;
	while( buf[i] != ',' && buf[i] != 0 ) i++;
	SetOperand1( &buf[token_start], i - token_start );
	if( buf[i++] == 0 ) return;

	while( buf[i] == ' ' ) i++;
	token_start = i;
	while( buf[i] != 0 ) i++;
	SetOperand2( &buf[token_start], i - token_start );
	if( buf[i++] == 0 ) return;
}

void Instruction::Print()
{
	printf("0x%llx\t%s", addr, mnemonic.GetString() );
	if( operand1.GetString() )
		printf("\t\t%s", operand1.GetString() );
	if( operand2.GetString() )
		printf(", %s", operand2.GetString() );
	printf("\n");
}

BlockNode::BlockNode()
{
	memset( this, 0, sizeof(*this) );
}

BlockNode::~BlockNode()
{
	Free();
}

void BlockNode::Init( vector<Instruction> insns, uint64_t start_addr, uint64_t end_addr )
{
	BlockAssembly.assign( insns.begin(), insns.end() );
	StartAddress = start_addr;
	EndAddress = end_addr;
	SetNextBlockInfo();
}

uint32_t BlockNode::GetNextBlockNum()
{
	return NextBlockAddress.size();
}

uint64_t BlockNode::GetNextBlockAddr( int idx )
{
	return NextBlockAddress[idx];
}

uint32_t BlockNode::GetInsnNum()
{
	return BlockAssembly.size();
}

void BlockNode::SplitBlock( char *buf )
{
	char addr[20];

	int i = 0;
	while( buf[i] != 0 )
	{
		Instruction insn;
		int token_start;

		while( buf[i] == ' ' ) i++;
		token_start = i;
		while( buf[i] != ' ' ) i++;
		strncpy( addr, &buf[token_start], i - token_start );
		addr[i-token_start] = 0;
		insn.SetAddr( htoi(addr) );
		i++;

		while( buf[i] == ' ' ) i++;
		token_start = i;
		while( buf[i] != ' ' ) i++;
		insn.SetMnemonic( &buf[token_start], i - token_start );
		i++;

		while( buf[i] == ' ' ) i++;
		token_start = i;
		while( buf[i] != ',' && buf[i] != '\n' ) i++;
		insn.SetOperand1( &buf[token_start], i - token_start );
		if( buf[i++] == '\n' ) 
		{
			BlockAssembly.push_back( insn );
			continue;
		}

		while( buf[i] == ' ' ) i++;
		token_start = i;
		while( buf[i] != '\n' ) i++;
		insn.SetOperand2( &buf[token_start], i - token_start );
		i++;

		BlockAssembly.push_back( insn );
	}
}

void BlockNode::SetNextBlockInfo()
{
	char *end_mnemonic = BlockAssembly.back().GetMnemonic();
	char *operand = BlockAssembly.back().GetOperand1();

	if( !strcmp( end_mnemonic, "ret" ) )
		return;
	else if( !strcmp( end_mnemonic, "jmp" ) )
		NextBlockAddress.push_back( htoi(operand) );
	else if( IsCondJump( end_mnemonic ) )
	{
		NextBlockAddress.push_back( EndAddress );
		NextBlockAddress.push_back( htoi(operand) );
	}
	else
		NextBlockAddress.push_back( EndAddress );
}

void BlockNode::PrintBlockAssembly()
{
	for( int i = 0; i < BlockAssembly.size(); i++ )
		BlockAssembly[i].Print();
}

void BlockNode::Free()
{
	NextBlockAddress.clear();
	BlockAssembly.clear();

	memset(this, 0, sizeof(*this));
}

Instruction & BlockNode::operator[](uint32_t i) 
{
	if(i >= BlockAssembly.size())
		i = 0;

	return BlockAssembly[i];
}

FunctionNode::FunctionNode()
{
	memset( this, 0, sizeof(*this) );
}

FunctionNode::~FunctionNode()
{
	Free();
}

void FunctionNode::Insert( BlockNode block )
{
	Blocks.push_back( block );
}

uint32_t FunctionNode::GetBlockNum()
{
	return Blocks.size();
}

int FunctionNode::GetBlockIndex( uint64_t block_addr )
{
	for( int i = 0; i < Blocks.size(); i++ )
	{
		if( block_addr == Blocks[i].StartAddress )
			return i;
	}

	return -1;
}

void FunctionNode::RecursiveSearch( int block_idx )
{
	for( int i = 0; i < Path.size(); i++ )
	{	
		if( block_idx == Path[i] )
		{
			for( int j = 0; j < Path.size(); j++ )
				printf("block %d (0x%llx) -> ", Path[j], Blocks[Path[j]].StartAddress);
			printf("cycle found!\n");
			return;
		}
	}
	Path.push_back( block_idx );

	uint32_t NextBlockNum = Blocks[block_idx].GetNextBlockNum();
	if( NextBlockNum == 0 )
	{
		for( int i = 0; i < Path.size(); i++ )
			printf("block %d (0x%llx) -> ", Path[i], Blocks[Path[i]].StartAddress);
		printf("end \n");
	}
	else
	{
		for( int i = 0 ; i < NextBlockNum; i++ )
			RecursiveSearch( GetBlockIndex( Blocks[block_idx].GetNextBlockAddr(i) ) );
	}
	Path.pop_back();
}

void FunctionNode::PrintAllPath()
{
	RecursiveSearch( 0 );
}

void FunctionNode::Free()
{
	for( int i = 0; i < Blocks.size(); i++ )
		Blocks[i].Free();
	Blocks.clear();
	Path.clear();
}

BlockNode & FunctionNode::operator [](uint32_t i)
{
	if(i >= Blocks.size())
		i = 0;

	return Blocks[i];
}

Program::Program()
{
	memset(this, 0, sizeof(*this));
}

void Program::Insert(FunctionNode func)
{
	Functions.push_back( func );
}

int Program::GetFuncIndex(uint64_t func_addr)
{
	for( int i = 0; i < Functions.size(); i++ )
	{
		if( func_addr == Functions[i].StartAddress )
			return i;
	}

	return -1;
}

FunctionNode & Program::operator [](uint32_t i)
{
	if(i >= Functions.size())
		i = 0;

	return Functions[i];
}

