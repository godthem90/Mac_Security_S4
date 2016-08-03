#include "stdafx.h"

char *input_file_name = 0;
char *input_file_name1 = 0;
char *input_file_name2 = 0;
char *output_file_name = 0;

bool CorrectIntegerTypes() {
   if (
      sizeof(uint8) != 1 ||
      sizeof(int16) != 2 ||
      sizeof(int32) != 4 ||
      sizeof(int64) != 8) {
	   return false;
   }

   return true;
}

bool CorrectEndianness() {
   static uint8 bytes[4] = {1, 2, 3, 4};
   if (*(uint32*)bytes != 0x04030201) {
      return false;
   }
   return true;
}

void usage()
{
	printf("./efi-mapper inputfile1 inputfile2\n");
}

struct MappedBlock
{
	int idx1;
	int idx2;
};

/*class BlockMapper
{
public:
	BlockMapper(Disassembler *d1, Disassembler *d2);
	void MapCodeBlock();
	void MappedBlockDump();
	void Dump();

private:
	Disassembler *dis1;
	Disassembler *dis2;
	CSList<MappedBlock> MappedBlockList;

	int DiffBlock(int i, int j);
};

BlockMapper::BlockMapper(Disassembler *d1, Disassembler *d2)
{
	dis1 = d1;
	dis2 = d2;
}

int BlockMapper::DiffBlock(int block_idx1, int block_idx2)
{
	int op1, op2;
	int op_idx1 = 0, op_idx2 = 0;
	int op_num1 = dis1->GetOpcodeNumInBlock(block_idx1);
	int op_num2 = dis2->GetOpcodeNumInBlock(block_idx2);
	bool *matched = new bool[op_num2];
	for( int i = 0; i < op_num2; i++ )
		matched[i] = false;

	int all_insn = 0, match_insn = 0;
	all_insn = (op_num1 > op_num2 ? op_num1 : op_num2);

	while( (op1 = dis1->GetOpcodeInBlock(block_idx1, op_idx1++)) != -1 )
	{
		while( (op2 = dis2->GetOpcodeInBlock(block_idx2, op_idx2++)) != -1 )
		{
			if( op1 == op2 && !matched[op_idx2] )
			{
				matched[op_idx2] = true;
				match_insn++;
				break;
			}
		}
		op_idx2 = 0;
	}
	delete[] matched;

	return match_insn * 100 / all_insn;
}

void BlockMapper::MapCodeBlock()
{
	int block_num1 = dis1->GetCodeBlockNum();
	int block_num2 = dis2->GetCodeBlockNum();
	int mapped_block_idx;
	int max_percentage = 0;

	int i, j;
	for( i = 1; i <= block_num1; i++ )
	{
		for( j = 1; j <= block_num2; j++ )
		{
			int percentage = DiffBlock(i, j);
			if( percentage >= max_percentage )
			{
				mapped_block_idx = j;
				max_percentage = percentage;
			}
		}
		if( max_percentage >= 50 )
		{
			struct MappedBlock mapped_block;
			mapped_block.idx1 = i;
			mapped_block.idx2 = mapped_block_idx;
			MappedBlockList.Push(mapped_block);
		}
	}
}

void BlockMapper::Dump()
{
	int block_num1 = dis1->GetCodeBlockNum();

	int block_idx;
	for( block_idx = 1; block_idx <= block_num1; block_idx++ )
	{
		int op_num1 = dis1->GetOpcodeNumInBlock(block_idx);
		printf("op num #%d :  ",op_num1);

		short op1;
		int op_idx1 = 0;
		while( (op1 = dis1->GetOpcodeInBlock(block_idx, op_idx1++)) != -1 )
		{
			printf("%x  ",op1);
		}
		printf("\n");
	}
}*/

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

	if(argc != 3)
	{
		fprintf(stderr, "[error] Wrong Usage\n");
		usage();
		return -1;
	}

	input_file_name1 = argv[1];
	input_file_name2 = argv[2];

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

	char *buf = new char[1000];
	disasm_engine1.SetFunctionDescriptor( 0x2af8 );
	while( disasm_engine1.GetBlockInFunction( buf ) != -1 )
		printf("%s\n", buf);

	disasm_engine2.SetFunctionDescriptor( 0x4010 );
	while( disasm_engine2.GetBlockInFunction( buf ) != -1 )
		printf("%s\n", buf);

	delete[] buf;
	//BlockMapper block_mapper( &disassembler1, &disassembler2 );
	//block_mapper.Dump();

	parser1.Free();
	parser2.Free();

	return 0;
}

