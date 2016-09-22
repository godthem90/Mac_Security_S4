#include "disasm.h"

int CDisassembler::GetFunctionIndex( uint32_t addr )
{
	int functioni;
	for( functioni = 1; functioni < FunctionList.GetNumEntries(); functioni++ )
	{
		int section = FunctionList[functioni].Section;
		int function_offset = FunctionList[functioni].Start;
		int section_addr = Sections[section].SectionAddress;

		if( section_addr + function_offset == addr )
			return functioni;
	}
	return -1;
}

int CDisassembler::GetBlockIndex( uint32_t addr )
{
	int blocki;
	for( blocki = 1; blocki < BlockList.GetNumEntries(); blocki++ )
	{
		int section = BlockList[blocki].Section;
		int block_offset = BlockList[blocki].Start;
		int section_addr = Sections[section].SectionAddress;

		if( section_addr + block_offset == addr )
			return blocki;
	}
	return -1;
}

int CDisassembler::GetBlockAssembly( uint32_t blocki, vector<Instruction> *insns, uint64_t *start_addr, uint64_t *end_addr )
{
	int opnum = 0;

	Section = BlockList[blocki].Section;
	Buffer     = Sections[Section].Start;
	SectionEnd = Sections[Section].TotalSize;
	LabelInaccessible = Sections[Section].InitSize;
	WordSize   = Sections[Section].WordSize;
	SectionAddress = Sections[Section].SectionAddress;
	IBegin = IEnd = LabelEnd = BlockList[blocki].Start;

	//CodeMode = (SectionType & 1) ? 1 : 4;
	CodeMode = 1;

	*start_addr = SectionAddress + IBegin;
	while( IEnd < BlockList[blocki].End )
	{
		CTextFileBuffer temp_file;
		Instruction insn;
		uint32_t opcode = 0;

		s.Reset();
		ParseInstruction();
		s.AddressRelocation = 0;
		s.ImmediateRelocation = 0;
		WriteInstruction( &temp_file );

		for( int i = 0; i <= s.OpcodeStart2 - s.OpcodeStart1; i++ )
		{
			opcode = opcode << 8;
			opcode += Buffer[s.OpcodeStart1 + i];
		}
		insn.SetOpcode( opcode );
		insn.SetAddr( SectionAddress + IBegin );
		insn.SetInstruction( temp_file.Buf() );
		insns->push_back( insn );

		IBegin = IEnd;
		opnum++;
	}
	*end_addr = SectionAddress + IEnd;
	return opnum;
}

uint32_t CDisassembler::GetNextBlockAddress( uint32_t block_addr )
{
	int blocki;
	if( (blocki = GetBlockIndex( block_addr )) == -1 ) return 0;
	if( blocki + 1 >= BlockList.GetNumEntries() ) return 0;

	return BlockList[blocki+1].Start;
}

int CDisassembler::GetBlockInFunction( vector<Instruction> *insns, uint64_t *start_addr, uint64_t *end_addr )
{
	if( FunctionDescriptor <= 1 || FunctionDescriptor >= FunctionList.GetNumEntries() )
	{
		FunctionDescriptor = 0;
		return -1;
	}
	if( BlockDescriptor <= 1 || BlockDescriptor >= BlockList.GetNumEntries() )
	{
		BlockDescriptor = 0;
		return -1;
	}

	int IsBlockInFunc = ( FunctionList[FunctionDescriptor].Start <= BlockList[BlockDescriptor].Start
						&& BlockList[BlockDescriptor].End <= FunctionList[FunctionDescriptor].End );
	if( !IsBlockInFunc )
	{
		BlockDescriptor = 0;
		return -1;
	}

	return GetBlockAssembly( BlockDescriptor++, insns, start_addr, end_addr );
}

int CDisassembler::SetFunctionDescriptor( uint32_t func_addr )
{
	int functioni, blocki;
	if( (functioni = GetFunctionIndex( func_addr )) == -1 ) return -1;
	FunctionDescriptor = functioni;
	if( (blocki = GetBlockIndex( func_addr )) == -1 ) return -1;
	BlockDescriptor = blocki;

	return 0;
}

void CDisassembler::ParseProgram(Program *prog)
{
	int functioni;
	for( functioni = 1; functioni < FunctionList.GetNumEntries(); functioni++ )
	{
		int section = FunctionList[functioni].Section;
		uint64_t func_start_offset = FunctionList[functioni].Start;
		uint64_t func_end_offset = FunctionList[functioni].End;
		uint64_t section_addr = Sections[section].SectionAddress;

		FunctionNode func;
		func.StartAddress = section_addr + func_start_offset;
		func.EndAddress = section_addr + func_end_offset;

		vector<Instruction> insns;
		uint64_t start_addr, end_addr;
		SetFunctionDescriptor(func.StartAddress);
		while( GetBlockInFunction( &insns, &start_addr, &end_addr ) != -1 )
		{
			BlockNode node;
			node.Init( insns, start_addr, end_addr );
			func.Insert( node );
			insns.clear();
		}
		//flow_graph1.PrintAllPath();

		prog->Insert(func);
	}
}
