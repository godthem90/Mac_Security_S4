#include "data.h"

bool IsCondJump( char *mnemonic )
{
	const char *CondJumpTable[] ={
		"jo", "jno", "jc", "jnc", "jz", "jnz", "jbe", "ja", "je", "js",
		"jns", "jpe", "jpo", "jl", "jge", "jle", "jg", "jcxz", "jecxz", "jrcxz"
	};

	for( int i = 0; i < 20; i++ )
	{
		if( !strcmp( mnemonic, CondJumpTable[i]) )
			return true;
	}

	return false;
}

uint64_t htoi( char *hex_str )
{
	char hex_table[33] = "0123456789abcdef0123456789ABCDEF";

	uint64_t shift_num = 0, res = 0;
	int i;
	for( i = 0; hex_str[i] != 0; i++ )
	{
		if( (hex_str[i] == 'H' || hex_str[i] == 'h') && hex_str[i+1] == 0 )
			break;

		int j;
		res = res << 4;
		for( j = 0; hex_table[j] != 0; j++ )
		{
			if( hex_str[i] == hex_table[j] )
			{
				shift_num = j % 16;
				break;
			}
		}
		if( j == 33 )
			return 0;
		res += shift_num;
	}

	return res;
}

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

void Instruction::SplitInstruction( char *buf )
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
	printf("0x%x\t%s", addr, mnemonic.GetString() );
	if( operand1.GetString() )
		printf("\t\t%s", operand1.GetString() );
	if( operand2.GetString() )
		printf(", %s", operand2.GetString() );
	printf("\n");
}

/*Expr::Expr()
{
	state = UNKNOWN;
	operation = 0;
	memset( value, BIT_X, sizeof(value) );
}

void Expr::SetState( int s )
{
	state = s;
}

void Expr::SetOperation( int o )
{
	operation = o;
}

void Expr::SetValue( int64_t val )
{
	for( int i = 0; i < 64; i++ )
	{
		value[i] = (val % 2) ? 1 : 0;
		val /= 2;
	}
}

int64_t Expr::GetValue( )*/

BlockNode::BlockNode()
{
	memset( this, 0, sizeof(*this) );
}

void BlockNode::Init( vector<Instruction> insns, uint64_t start_addr, uint64_t end_addr )
{
	BlockAssembly.assign( insns.begin(), insns.end() );
	StartAddress = start_addr;
	EndAddress = end_addr;
	SetNextBlockInfo();
}

uint64_t BlockNode::GetBlockAddr()
{
	return StartAddress;
}

uint32_t BlockNode::GetNextBlockNum()
{
	return NextBlockAddress.size();
}

uint64_t BlockNode::GetNextBlockAddr( int idx )
{
	return NextBlockAddress[idx];
}

uint32_t BlockNode::GetOpNum()
{
	return BlockAssembly.size();
}

uint32_t BlockNode::GetOpcode( uint32_t op_idx )
{
	return BlockAssembly[op_idx].GetOpcode();
}

char * BlockNode::GetOperand1( uint32_t op_idx )
{
	return BlockAssembly[op_idx].GetOperand1();
}

char * BlockNode::GetOperand2( uint32_t op_idx )
{
	return BlockAssembly[op_idx].GetOperand2();
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

FlowGraph::FlowGraph()
{
	memset( this, 0, sizeof(*this) );
}

void FlowGraph::Insert( BlockNode *new_block )
{
	Blocks.push_back( new_block );
}

uint32_t FlowGraph::GetBlockNum()
{
	return Blocks.size();
}

uint64_t FlowGraph::GetBlockAddr( uint32_t block_idx )
{
	return Blocks[block_idx]->GetBlockAddr();
}

uint32_t FlowGraph::GetOpNumInBlock( uint32_t block_idx )
{
	return Blocks[block_idx]->GetOpNum();
}

uint32_t FlowGraph::GetOpcodeInBlock( uint32_t block_idx, uint32_t op_idx )
{
	return Blocks[block_idx]->GetOpcode( op_idx );
}

char * FlowGraph::GetOperand1InBlock( uint32_t block_idx, uint32_t op_idx )
{
	return Blocks[block_idx]->GetOperand1( op_idx );
}

char * FlowGraph::GetOperand2InBlock( uint32_t block_idx, uint32_t op_idx )
{
	return Blocks[block_idx]->GetOperand2( op_idx );
}

int FlowGraph::GetBlockIndex( uint64_t block_addr )
{
	for( int i = 0; i < Blocks.size(); i++ )
	{
		if( block_addr == Blocks[i]->GetBlockAddr() )
			return i;
	}

	return -1;
}

void FlowGraph::RecursiveSearch( int block_idx )
{
	for( int i = 0; i < Path.size(); i++ )
	{	
		if( block_idx == Path[i] )
		{
			for( int j = 0; j < Path.size(); j++ )
				printf("block %d (0x%x) -> ", Path[j], Blocks[Path[j]]->GetBlockAddr());
			printf("cycle found!\n");
			return;
		}
	}
	Path.push_back( block_idx );

	uint32_t NextBlockNum = Blocks[block_idx]->GetNextBlockNum();
	if( NextBlockNum == 0 )
	{
		for( int i = 0; i < Path.size(); i++ )
			printf("block %d (0x%x) -> ", Path[i], Blocks[Path[i]]->GetBlockAddr());
		printf("end \n");
	}
	else
	{
		for( int i = 0 ; i < NextBlockNum; i++ )
			RecursiveSearch( GetBlockIndex( Blocks[block_idx]->GetNextBlockAddr(i) ) );
	}
	Path.pop_back();
}

void FlowGraph::PrintAllPath()
{
	RecursiveSearch( 0 );
}

void FlowGraph::PrintBlockAssembly( uint32_t block_idx )
{
	Blocks[block_idx]->PrintBlockAssembly();
}
