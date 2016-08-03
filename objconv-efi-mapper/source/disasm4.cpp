#include "stdafx.h"

int CDisassembler::GetFunctionIndex( uint32 addr )
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

int CDisassembler::GetBlockIndex( uint32 addr )
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

int CDisassembler::GetBlockAssembly( uint32 blocki, char *buf )
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

	while( IEnd < BlockList[blocki].End )
	{
		CTextFileBuffer temp_file;

		s.Reset();
		ParseInstruction();
		s.AddressRelocation = 0;
		s.ImmediateRelocation = 0;
		temp_file.PutHex( SectionAddress + IBegin );
		WriteInstruction( &temp_file );
		temp_file.NewLine();

		strncpy( buf, temp_file.Buf(), temp_file.GetDataSize() );
		buf += temp_file.GetDataSize();

		IBegin = IEnd;
		opnum++;
	}
	return opnum;
}

uint32 CDisassembler::GetNextBlockAddress( uint32 block_addr )
{
	int blocki;
	if( (blocki = GetBlockIndex( block_addr )) == -1 ) return 0;
	if( blocki + 1 >= BlockList.GetNumEntries() ) return 0;

	return BlockList[blocki+1].Start;
}

int CDisassembler::GetBlockInFunction( char * buf )
{
	memset( buf, 0, strlen(buf) );
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

	return GetBlockAssembly( BlockDescriptor++, buf );
}

int CDisassembler::SetFunctionDescriptor( uint32 func_addr )
{
	int functioni, blocki;
	if( (functioni = GetFunctionIndex( func_addr )) == -1 ) return -1;
	FunctionDescriptor = functioni;
	if( (blocki = GetBlockIndex( func_addr )) == -1 ) return -1;
	BlockDescriptor = blocki;

	return 0;
}

