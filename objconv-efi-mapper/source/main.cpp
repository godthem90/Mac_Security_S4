#include <stdio.h>
#include "lib.h"
#include "containers.h"
#include "disasm.h"
#include "parser.h"
#include "data.h"

char *input_file_name1 = 0;
char *input_file_name2 = 0;
char *output_file_name = 0;

int threshold_percentage;

void usage()
{
	printf("./efi-mapper inputfile1 inputfile2\n");
}

struct MappedBlock
{
	int percentage;
	int idx1;
	int idx2;
};

#define REG			0
#define DATA		1
#define LOCAL		2
#define ADDR		3
#define IMMEDIATE	4
#define ETC			5

char reg64_table[16][4] = {"rax", "rcx", "rdx", "rbx", "rsp", "rbp", "rsi", "rdi", "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15"};
char reg32_table[16][5] = {"eax", "ecx", "edx", "ebx", "esp", "ebp", "esi", "edi", "r8d", "r9d", "r10d", "r11d", "r12d", "r13d", "r14d", "r15d"};
char reg16_table[16][5] = {"ax", "cx", "dx", "bx", "sp", "bp", "si", "di", "r8w", "r9w", "r10w", "r11w", "r12w", "r13w", "r14w", "r15w"};
char reg8_table[16][5] = {"al", "cl", "dl", "bl", "spl", "bpl", "sil", "dil", "r8b", "r9b", "r10b", "r11b", "r12b", "r13b", "r14b", "r15b"};

typedef struct OperandClass
{
	int op_class;
	int64_t value;
} OperandClass;

bool IsReg( char *operand )
{
	int i;
	for( i = 0; i < 16; i++ )
	{
		if( !strcmp( operand, reg64_table[i] ) )
			return true;
	}
	for( i = 0; i < 16; i++ )
	{
		if( !strcmp( operand, reg32_table[i] ) )
			return true;
	}
	for( i = 0; i < 16; i++ )
	{
		if( !strcmp( operand, reg16_table[i] ) )
			return true;
	}
	for( i = 0; i < 16; i++ )
	{
		if( !strcmp( operand, reg8_table[i] ) )
			return true;
	}
	return false;
}

bool IsData( char *operand )
{
	if( strstr(operand, "DS") )
		return true;
	return false;
}

bool IsLocal( char *operand )
{
	if( (strstr(operand, "rsp") || strstr(operand, "rbp")) && strstr(operand, "ptr") )
		return true;
	return false;
}

bool IsAddr( char *operand )
{
	if( operand[strlen(operand)-1] == 'H' || operand[strlen(operand)-1] == 'h' )
		return true;
	return false;
}

bool IsImmediate2( char *operand )
{
	for( int i = 0; i < strlen(operand); i++ )
	{
		if( operand[i] <= '0' || operand[i] >= '9' )
			return false;
	}
	return true;
}

bool CmpOperand( char *operand1, char *operand2 )
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
		else if( IsImmediate2(operand1) )
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
		else if( IsImmediate2(operand2) )
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
}

class BlockMapper
{
public:
	BlockMapper(FlowGraph *f1, FlowGraph *f2);
	void MapBlock();
	void Dump();

private:
	FlowGraph *flow1;
	FlowGraph *flow2;
	vector<MappedBlock> MappedBlockList;

	int DiffBlock(uint32_t block_idx1, uint32_t block_idx2);
};

BlockMapper::BlockMapper(FlowGraph *f1, FlowGraph *f2)
{
	flow1 = f1;
	flow2 = f2;
}

int BlockMapper::DiffBlock(uint32_t block_idx1, uint32_t block_idx2)
{
	uint32_t opcode1, opcode2;
	char *operand1_1, *operand1_2, *operand2_1, *operand2_2;
	uint32_t op_num1 = flow1->GetOpNumInBlock(block_idx1);
	uint32_t op_num2 = flow2->GetOpNumInBlock(block_idx2);
	bool *matched = new bool[op_num2];
	for( int i = 0; i < op_num2; i++ )
		matched[i] = false;

	int all_insn = 0, match_insn = 0;
	all_insn = (op_num1 > op_num2 ? op_num1 : op_num2);

	for( int op_idx1 = 0; op_idx1 < op_num1; op_idx1++ )
	{
		for( int op_idx2 = 0; op_idx2 < op_num2; op_idx2++ )
		{
			opcode1 = flow1->GetOpcodeInBlock(block_idx1, op_idx1);
			opcode2 = flow2->GetOpcodeInBlock(block_idx2, op_idx2);

			operand1_1 = flow1->GetOperand1InBlock(block_idx1, op_idx1);
			operand2_1 = flow2->GetOperand1InBlock(block_idx2, op_idx2);
			operand1_2 = flow1->GetOperand2InBlock(block_idx1, op_idx1);
			operand2_2 = flow2->GetOperand2InBlock(block_idx2, op_idx2);

			if( opcode1 == opcode2 && /*CmpOperand(operand1_1, operand2_1) && CmpOperand(operand1_2, operand2_2) &&*/ !matched[op_idx2] )
			{
				matched[op_idx2] = true;
				match_insn++;
				break;
			}
		}
	}
	delete[] matched;

	return match_insn * 100 / all_insn;
}

void BlockMapper::MapBlock()
{
	uint32_t block_num1 = flow1->GetBlockNum();
	uint32_t block_num2 = flow2->GetBlockNum();
	int mapped_block_idx;
	int max_percentage = 0;

	int i, j;
	for( i = 0; i < block_num1; i++ )
	{
		for( j = 0; j < block_num2; j++ )
		{
			int percentage = DiffBlock(i, j);
			if( percentage >= threshold_percentage )
			{
				struct MappedBlock mapped_block;
				mapped_block.percentage = percentage;
				mapped_block.idx1 = i;
				mapped_block.idx2 = j;
				MappedBlockList.push_back(mapped_block);
			}
			/*if( percentage >= max_percentage )
			{
				mapped_block_idx = j;
				max_percentage = percentage;
			}*/
		}
	}
}

void BlockMapper::Dump()
{
	uint32_t block_num1 = flow1->GetBlockNum();
	uint32_t block_num2 = flow2->GetBlockNum();
	printf("%s total block : %d\n", input_file_name1, block_num1);
	printf("%s total block : %d\n", input_file_name2, block_num2);
	printf("total matched block : %d\n", MappedBlockList.size());
	for( int i = 0; i < MappedBlockList.size(); i++ )
	{
		printf("--------------------------------------------------------------------------\n\n");
		int percentage = MappedBlockList[i].percentage;
		uint32_t block_idx1 = MappedBlockList[i].idx1;
		uint32_t block_idx2 = MappedBlockList[i].idx2;
		uint64_t block_addr1 = flow1->GetBlockAddr( block_idx1 );
		uint64_t block_addr2 = flow2->GetBlockAddr( block_idx2 );
		printf("Block 0x%x and Block 0x%x matched with %d%%\n\n", block_addr1, block_addr2, percentage);

		printf("%s :\n", input_file_name1);
		flow1->PrintBlockAssembly( block_idx1 );
		printf("\n");
		printf("%s :\n", input_file_name2);
		flow2->PrintBlockAssembly( block_idx2 );
		printf("\n");
		printf("--------------------------------------------------------------------------\n\n");
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

	if(argc != 6)
	{
		fprintf(stderr, "[error] Wrong Usage\n");
		usage();
		return -1;
	}

	input_file_name1 = argv[1];
	uint32_t entry_addr1 = htoi(argv[2]);
	input_file_name2 = argv[3];
	uint32_t entry_addr2 = htoi(argv[4]);
	threshold_percentage = atoi(argv[5]);

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

	FlowGraph flow_graph1, flow_graph2;

	vector<Instruction> insns;
	uint64_t start_addr, end_addr;

	disasm_engine1.SetFunctionDescriptor( entry_addr1 );
	while( disasm_engine1.GetBlockInFunction( &insns, &start_addr, &end_addr ) != -1 )
	{
		BlockNode *node = new BlockNode();
		node->Init( insns, start_addr, end_addr );
		flow_graph1.Insert( node );
		insns.clear();
	}
	//flow_graph1.PrintAllPath();

	//printf("-----------------------------------------------------------------\n\n\n");
	disasm_engine2.SetFunctionDescriptor( entry_addr2 );
	while( disasm_engine2.GetBlockInFunction( &insns, &start_addr, &end_addr ) != -1 )
	{
		BlockNode *node = new BlockNode();
		node->Init( insns, start_addr, end_addr );
		flow_graph2.Insert( node );
		insns.clear();
	}
	//flow_graph2.PrintAllPath();

	BlockMapper block_mapper( &flow_graph1, &flow_graph2 );
	block_mapper.MapBlock();
	block_mapper.Dump();

	parser1.Free();
	parser2.Free();

	return 0;
}

