#include <time.h>
#include "disasm.h"

// Define error texts. 
SIntTxt AsmErrorTexts[] = {
	{1,         "Instruction longer than 15 bytes"},
	{2,         "Lock prefix not allowed for this opcode"},
	{4,         "Illegal opcode"},
	{8,         "Illegal operands for this opcode"},
	{0x10,      "Instruction extends beyond end of code block"},
	{0x20,      "Prefix after REX prefix not allowed"},
	{0x40,      "This instruction is not allowed in 64 bit mode"},
	{0x80,      "Instruction out of phase with next label"},
	{0x100,     "Attempt to use R13 as base register without displacement"},
	{0x200,     "Register 8 - 15 only allowed in 64 bit mode (Ignored)."},
	{0x400,     "REX prefix not allowed on instruction with DREX byte"},
	{0x800,     "VEX has X bit but no SIB byte (Probably ignored)"},
	{0x1000,    "Relocation source does not match address or operand field"},
	{0x2000,    "Overlapping relocations"},
	{0x4000,    "This is unlikely to be code"}, // Consecutive bytes of 0 found
	{0x8000,    "VEX.L bit not allowed here"},
	{0x10000,   "VEX.mmmm bits out of range"},
	{0x80000,   "Internal error in opcode table in opcodes.cpp"}
};

// Warning texts 1: Warnings about conditions that could be intentional and suboptimal code
SIntTxt AsmWarningTexts1[] = {
	{1,          "Immediate operand could be made smaller by sign extension"},
	{2,          "Immediate operand could be made smaller by zero extension"},
	{4,          "Zero displacement could be omitted"},
	{8,          "Displacement could be made smaller by sign extension"},
	{0x10,       "SIB byte unnecessary here"},
	{0x20,       "A shorter instruction exists for register operand"},
	{0x40,       "Length-changing prefix causes delay on Intel processors"},
	{0x80,       "Address size prefix should be avoided"},
	{0x100,      "Same prefix occurs more than once"},
	{0x200,      "Prefix valid but unnecessary"},
	{0x400,      "Prefix bit or byte has no meaning in this context"},
	{0x800,      "Contradicting prefixes"},
	{0x1000,     "Required prefix missing"},
	{0x2000,     "Address has scale factor but no index register"},
	{0x4000,     "Address is not rip-relative"},
	{0x8000,     "Absolute memory address without relocation"},
	{0x10000,    "Unusual relocation type for this operand"},
	{0x20000,    "Instruction pointer truncated by operand size prefix"},
	{0x40000,    "Stack pointer truncated by address size prefix"},
	{0x80000,    "Jump or call to data segment not allowed"},
	{0x100000,   "Undocumented opcode"},
	{0x200000,   "Unknown opcode reserved for future extensions"},
	{0x400000,   "Memory operand is misaligned. Performance penalty"},
	{0x800000,   "Alignment fault. Memory operand must be aligned"},
	{0x1000000,  "Multi-byte NOP. Replace with ALIGN"},
	{0x2000000,  "Bogus length-changing prefix causes delay on Intel processors here"},
	{0x4000000,  "Non-default size for stack operation"},
	{0x8000000,  "Function does not end with ret or jmp"},
	{0x10000000, "No jump seems to point here"},
	{0x20000000, "Full 64-bit address"},
	{0x40000000, "VEX prefix bits not allowed here"}
};

// Warning texts 2: Warnings about possible misinterpretation; serious warnings
SIntTxt AsmWarningTexts2[] = {
	{1,          "Label out of phase with instruction. Possibly spurious"},
	{2,          "Planned future instruction, according to preliminary specification"},
	{4,          "This instruction has been planned but never implemented because plans were changed. Will not work"},
	{0x10,       "EVEX prefix not allowed for this instruction"},
	{0x20,       "MVEX prefix not allowed for this instruction"},
	{0x40,       "EVEX prefix option bits not allowed here"},
	{0x80,       "MVEX prefix option bits not allowed here"},
	{0x100,      "Mask register must be nonzero"},
	{0x200,      "Broadcasting to scalar not allowd"},
};


// Indication of relocation types in comments:
SIntTxt RelocationTypeNames[] = {
	{0x001,  "(d)" },                   // Direct address in flat address space
	{0x002,  "(rel)" },                 // Self-relative
	{0x004,  "(imgrel)" },              // Image-relative
	{0x008,  "(segrel)" },              // Segment-relative
	{0x010,  "(refpoint)" },            // Relative to arbitrary point (position-independent code in Mach-O)
	{0x021,  "(d)" },                   // Direct (adjust by image base)
	{0x041,  "(d)" },                   // Direct (make procecure linkage table entry)
	{0x081,  "(indirect)" },            // Gnu indirect function dispatcher (make procecure linkage table entry?)
	{0x100,  "(seg)" },                 // Segment address or descriptor
	{0x200,  "(sseg)" },                // Segment of symbol
	{0x400,  "(far)" },                 // Far segment:offset address
	{0x1001, "(GOT)" },                 // GOT entry
	{0x1002, "(GOT r)" },               // self-relative to GOT entry
	{0x2002, "(PLT r)" }                // self-relative to PLT entry
};

// Instruction set names
const char * InstructionSetNames[] = {
	"8086", "80186", "80286", "80386",               // 0 - 3
	"80486", "Pentium", "Pentium Pro", "MMX",        // 4 - 7
	"Pentium II", "", "", "",                        // 8 - B
	"", "", "", "",                                  // C - F
	"", "SSE", "SSE2", "SSE3",                       // 10 - 13
	"Supplementary SSE3", "SSE4.1", "SSE4.2", "AES", // 14 - 17
	"CLMUL", "AVX", "FMA3", "?",                     // 18 - 1B
	"AVX2", "BMI etc.", "?", "?",                    // 1C - 1F
	"AVX-512", "AVX512PF/ER/CD", "MPX,SHA,TBD", "AVX512IFMA/VBMI", // 20 - 23
	"?", "?", "?", "?",                              // 24 - 27
	"?", "?", "?", "?",                              // 28 - 2B
	"?", "?", "?", "?",                              // 2C - 2F
	"?", "?", "?", "?",                              // 30 - 33
	"?", "?", "?", "?",                              // 34 - 37
	"?", "?", "?", "?",                              // 38 - 3B
	"?", "?", "?", "?",                              // 3C - 3F
	"?", "?", "?", "?",                              // 40 - 43
	"?", "?", "?", "?",                              // 44 - 47
	"?", "?", "?", "?",                              // 48 - 4B
	"?", "?", "?", "?",                              // 4C - 4F
	"?", "?", "?", "?",                              // 50 - 53
	"?", "?", "?", "?",                              // 54 - 57
	"?", "?", "?", "?",                              // 58 - 5B
	"?", "?", "?", "?",                              // 5C - 5F
	"?", "?", "?", "?",                              // 60 - 63
	"?", "?", "?", "?",                              // 64 - 67
	"?", "?", "?", "?",                              // 68 - 6B
	"?", "?", "?", "?",                              // 6C - 6F
	"?", "?", "?", "?",                              // 70 - 73
	"?", "?", "?", "?",                              // 74 - 77
	"?", "?", "?", "?",                              // 78 - 7B
	"?", "?", "?", "?",                              // 7C - 7F
	"Knights Corner", "?", "?", "?",                 // 80 - 83
	"?", "?", "?", "?"                               // 84 - 87
};

const int InstructionSetNamesLen = TableSize(InstructionSetNames);

void CDisassembler::WritePublicsAndExternals( CTextFileBuffer *out_file )
{
	// Write public and external symbol definitions
	uint32 i;                                     // Loop counter
	uint32 LinesWritten = 0;                      // Count lines written
	const char * XName;                           // Name of external symbols

	// Loop through public symbols
	for (i = 0; i < Symbols.GetNumEntries(); i++) {
		if (Symbols[i].Scope & 0x1C) {
			// Symbol is public
			out_file->Put("public ");
			// Write name
			out_file->Put(Symbols.GetName(i));
			// Check if weak or communal
			if (Symbols[i].Scope & 0x18) {
				// Scope is weak or communal
				out_file->Tabulate(AsmTab4);
				out_file->Put(CommentSeparator);
				if (Symbols[i].Scope & 8) out_file->Put("Note: Weak. Not supported by MASM ");
				if (Symbols[i].Scope & 0x10) out_file->Put("Note: Communal. Not supported by MASM");
			}
			out_file->NewLine();  LinesWritten++;
		}
	}
	// Blank line if anything written
	if (LinesWritten) {
		out_file->NewLine();
		LinesWritten = 0;
	}
	// Loop through external symbols
	for (i = 0; i < Symbols.GetNumEntries(); i++) {

		if (Symbols[i].Scope & 0x20) {
			// Symbol is external
			out_file->Put("extern ");
			// Get name
			XName = Symbols.GetName(i);
			// Check for dynamic import
			if (Symbols[i].DLLName && strncmp(XName, Symbols.ImportTablePrefix, (uint32)strlen(Symbols.ImportTablePrefix)) == 0) {
				// Remove "_imp" prefix from name
				XName += (uint32)strlen(Symbols.ImportTablePrefix);
			}

			// Write name
			out_file->Put(XName);
			out_file->Put(": ");

			// Write type
			if ((Symbols[i].Type & 0xFE) == 0x84) {
				// Far
				out_file->Put("far");
			}
			else if ((Symbols[i].Type & 0xF0) == 0x80 || Symbols[i].DLLName) {
				// Near
				out_file->Put("near");
			}
			else {
				// Data. Write size
				switch (GetDataItemSize(Symbols[i].Type)) {
					case 1: default: out_file->Put("byte");  break;
					case 2: out_file->Put("word");  break;
					case 4: out_file->Put("dword");  break;
					case 6: out_file->Put("fword");  break;
					case 8: out_file->Put("qword");  break;
					case 10: out_file->Put("tbyte");  break;
					case 16: out_file->Put("xmmword");  break;
					case 32: out_file->Put("ymmword");  break;
				}
			}
			// Add comment if DLL import
			if (Symbols[i].DLLName) {
				out_file->Tabulate(AsmTab4);
				out_file->Put(CommentSeparator);
				out_file->Put(Symbols.GetDLLName(i));
			}
			// Finished line
			out_file->NewLine();  LinesWritten++;
		}
	}
	// Blank line if anything written
	if (LinesWritten) {
		out_file->NewLine();
		LinesWritten = 0;
	}
	// Write the value of any constants
	// Loop through symbols
	for (i = 0; i < Symbols.GetNumEntries(); i++) {
		// Local symbols included because there might be a rip-relative address to a named constant = 0
		if (Symbols[i].Section == ASM_SEGMENT_ABSOLUTE /*&& (Symbols[i].Scope & 0x1C)*/) {
			// Symbol is constant
			// Write name
			out_file->Put(Symbols.GetName(i));
			out_file->Put(" equ ");
			// Write value as hexadecimal
			out_file->PutHex(Symbols[i].Offset, 1);
			// Write decimal value as comment
			out_file->Tabulate(AsmTab4);
			out_file->Put(CommentSeparator);
			out_file->PutDecimal(Symbols[i].Offset, 1);
			out_file->NewLine();  LinesWritten++;
		}
	}
	// Blank line if anything written
	if (LinesWritten) {
		out_file->NewLine();
		LinesWritten = 0;
	}
	// Write any group definitions
	int32 GroupId, SegmentId;
	// Loop through sections to search for group definitions
	for (GroupId = 1; GroupId < (int32)Sections.GetNumEntries(); GroupId++) {

		// Get section type
		uint32 SectionType = Sections[GroupId].Type;
		if (SectionType & 0x800) {
			// This is a segment group definition
			// Count number of members
			uint32 NumMembers = 0;
			// Write group name
			WriteSectionName( out_file, GroupId );
			// Write "group"
			out_file->Put(" ");  out_file->Tabulate(AsmTab1);  out_file->Put("GROUP ");
			// Search for group members
			for (SegmentId = 1; SegmentId < (int32)Sections.GetNumEntries(); SegmentId++) {
				if (Sections[SegmentId].Group == GroupId && !(Sections[SegmentId].Type & 0x800)) {
					// is this first member?
					if (NumMembers++) {
						// Not first member. Write comma
						out_file->Put(", ");
					}
					// Write group member
					WriteSectionName( out_file, SegmentId );
				}
			}
			// End line
			out_file->NewLine();  LinesWritten++;
		}
	}
	// Blank line if anything written
	if (LinesWritten) {
		out_file->NewLine();
		LinesWritten = 0;
	}
}

void CDisassembler::WriteFileBegin( CTextFileBuffer *out_file )
{
	// Write begin of file

	out_file->SetFileType(FILETYPE_ASM);

	// Initial comment
	out_file->Put(CommentSeparator);
	out_file->Put("Disassembly of file: ");
	//out_file->Put(input_file_name);
	out_file->NewLine();
	// Date and time. 
	// Note: will fail after year 2038 on computers that use 32-bit time_t
	time_t time1 = time(0);
	char * timestring = ctime(&time1);
	if (timestring) {
		// Remove terminating '\n' in timestring
		for (char *c = timestring; *c; c++) {
			if (*c < ' ') *c = 0;
		}
		// Write date and time as comment
		out_file->Put(CommentSeparator);
		out_file->Put(timestring);
		out_file->NewLine();
	}

	// Write mode
	out_file->Put(CommentSeparator);
	out_file->Put("Mode: ");
	out_file->PutDecimal(WordSize);
	out_file->Put(" bits");
	out_file->NewLine();

	// Write syntax dialect
	out_file->Put(CommentSeparator);
	out_file->Put("Syntax: ");
	out_file->Put(WordSize < 64 ? "MASM/ML" : "MASM/ML64");
	out_file->NewLine();

	// Write instruction set as comment
	// Instruction set is at least .386 if 32 bit mode
	if (InstructionSetMax < 3 && (MasmOptions & 0x200)) InstructionSetMax = 3;

	// Get name of basic instruction set
	const char * set0 = "";
	if (InstructionSetMax < InstructionSetNamesLen) {
		set0 = InstructionSetNames[InstructionSetMax];
	}

	// Write as comment
	out_file->Put(CommentSeparator);
	out_file->Put("Instruction set: ");
	out_file->Put(set0);

	if (InstructionSetAMDMAX) {
		// Get name of any AMD-specific instruction set
		const char * setA = "";
		switch (InstructionSetAMDMAX) {
			case 1:  setA = "AMD 3DNow";   break;
			case 2:  setA = "AMD 3DNowE";  break;
			case 4:  setA = "AMD SSE4a";   break;
			case 5:  setA = "AMD XOP";     break;
			case 6:  setA = "AMD FMA4";    break;
			case 7:  setA = "AMD TBM";   break;
		}
		if (*setA) {
			out_file->Put(", ");
			out_file->Put(setA);
		}
	}
	// VIA instruction set:
	if (InstructionSetOR & 0x2000) out_file->Put(", VIA");

	// Additional instruction sets:
	if (WordSize > 32) out_file->Put(", x64");
	if (InstructionSetOR & 0x100) out_file->Put(", 80x87");
	if (InstructionSetOR & 0x800) out_file->Put(", privileged instructions");
	out_file->NewLine();

	if (NamesChanged) {
		// Tell that symbol names have been changed
		out_file->NewLine();
		out_file->Put(CommentSeparator);
		out_file->Put("Error: symbol names contain illegal characters,");
		out_file->NewLine(); out_file->Put(CommentSeparator);
		out_file->PutDecimal(NamesChanged);
#if ReplaceIllegalChars
		out_file->Put(" Symbol names changed");
#else
		out_file->Put(" Symbol names not changed");
#endif
		out_file->NewLine();
	}

	// Write MASM-specific file init
	if (WordSize < 64) {
		// Write instruction set directive, except for 64 bit assembler
		const char * set1 = "";
		switch (InstructionSetMax) {
			case 0:  set1 = ".8086";  break;
			case 1:  set1 = ".186";  break;
			case 2:  set1 = ".286";  break;
			case 3:  set1 = ".386";  break;
			case 4:  set1 = ".486";  break;
			case 5:  set1 = ".586";  break;
			case 6: default:
					 set1 = ".686";  break;
		}
		// Write basic instruction set
		out_file->NewLine();
		out_file->Put(set1);
		if (InstructionSetOR & 0x800) {
			// Privileged. Add "p"
			out_file->Put("p");
		}
		out_file->NewLine();
		// Write extended instruction set
		if (InstructionSetOR & 0x100) {
			// Floating point
			if (InstructionSetMax < 3) {
				out_file->Put(".8087");  out_file->NewLine();
			}
			else if (InstructionSetMax < 5) {
				out_file->Put(".387");  out_file->NewLine();
			}
		}
		if (InstructionSetMax >= 0x11) {
			// .xmm directive. Not differentiated between SSE, SSE2, etc.
			out_file->Put(".xmm");  out_file->NewLine();
		}
		else if (InstructionSetMax >= 7) {
			// .mmx directive
			out_file->Put(".mmx");  out_file->NewLine();
		}
	}
	if (MasmOptions & 1) {
		// Need dotname option
		out_file->Put("option dotname");  out_file->NewLine();
	}
	if (WordSize == 32) {
		// Write .model flat if 32 bit mode
		out_file->Put(".model flat");  out_file->NewLine();
	}
	// Initialize Assumes for segment registers
	if (!(MasmOptions & 0x100)) {
		// No 16-bit segments. Assume CS=DS=ES=SS=flat
		Assumes[0]=Assumes[1]=Assumes[2]=Assumes[3] = ASM_SEGMENT_FLAT;
	}
	else {
		// 16-bit segmented model. Segment register values unknown
		Assumes[0]=Assumes[1]=Assumes[2]=Assumes[3] = ASM_SEGMENT_UNKNOWN;
	}
	// FS and GS assumed to ERROR
	Assumes[4] = Assumes[5] = ASM_SEGMENT_ERROR;

	// Write assume if FS or GS used
	// This is superfluous because an assume directive will be written at first use of FS/GS
	if (MasmOptions & 2) {
		out_file->Put("assume fs:nothing");  out_file->NewLine();
	}
	if (MasmOptions & 4) {
		out_file->Put("assume gs:nothing");  out_file->NewLine();
	}
	out_file->NewLine();                            // Blank line

	WritePublicsAndExternals( out_file );
}

void CDisassembler::WriteFileEnd( CTextFileBuffer *out_file )
{
	// Write end of file
	out_file->NewLine();
	out_file->Put("END");
}

void CDisassembler::WriteSectionName( CTextFileBuffer *out_file, int32 SegIndex ) {
	// Write name of section, segment or group from section index
	const char * Name = 0;
	// Check for special index values
	switch (SegIndex) {
		case ASM_SEGMENT_UNKNOWN:   // Unknown segment. Typical for external symbols
			Name = "Unknown";  break;
		case ASM_SEGMENT_ABSOLUTE:  // No segment. Used for absolute symbols
			Name = "Absolute";  break;
		case ASM_SEGMENT_FLAT:      // Flat segment group
			Name = "flat";  break;
		case ASM_SEGMENT_NOTHING:   // No segment
			Name = "Nothing";  break;
		case ASM_SEGMENT_ERROR:     // Segment register assumed to error
			Name = "Error";  break;
		case ASM_SEGMENT_IMGREL:    // Segment unknown. Offset relative to image base or file base
			Name = "ImageBased";  break;
		default:                    // > 0 means normal segment index
			if ((uint32)SegIndex >= Sections.GetNumEntries()) {
				// Out of range
				Name = "IndexOutOfRange";
			}
			else {
				// Get index into NameBuffer
				uint32 NameIndex = Sections[SegIndex].Name;
				// Check if valid
				if (NameIndex == 0 || NameIndex >= NameBuffer.GetDataSize()) {
					Name = "ErrorNameMissing";
				}
				else {
					// Normal valid name of segment, section or group
					Name = NameBuffer.Buf() + NameIndex;
				}
			}
			break;
	}
	out_file->Put(Name);
}

void CDisassembler::WriteSegmentBegin( CTextFileBuffer *out_file ) {
	// Write begin of segment
	out_file->NewLine();                            // Blank line

	// Check if Section is valid
	if (Section == 0 || Section >= Sections.GetNumEntries()) {
		// Illegal segment entry
		out_file->Put("UNKNOWN SEGMENT");  out_file->NewLine(); 
		return;
	}

	// Write segment name
	WriteSectionName( out_file, Section );
	// Tabulate
	out_file->Put(" "); out_file->Tabulate(AsmTab1);
	// Write "segment"
	out_file->Put("SEGMENT ");

	// Write alignment
	switch (Sections[Section].Align) {
		case 0:  // 1
			out_file->Put("BYTE ");  break;
		case 1:  // 2
			out_file->Put("WORD ");  break;
		case 2:  // 4
			out_file->Put("DWORD ");  break;
		case 4:  // 16
			out_file->Put("PARA ");  break;
			//case 8:  // 256 or 4096. Definition is ambiguous!
			//   out_file->Put("PAGE ");  break;
		default:
			// Non-standard alignment
			out_file->Put("ALIGN("); 
			out_file->PutDecimal(1 << Sections[Section].Align); 
			out_file->Put(") "); 
			break;
	}
	if (WordSize != 64) {
		// "PUBLIC" not supported by ml64 assembler
		out_file->Put("PUBLIC ");
		// Write segment word size if necessary
		if (MasmOptions & 0x100) {
			// There is at least one 16-bit segment. Write segment word size
			out_file->Put("USE"); 
			out_file->PutDecimal(Sections[Section].WordSize);
			out_file->Put(" "); 
		}
	}
	// Write segment class
	switch (Sections[Section].Type & 0xFF) {
		case 1:
			out_file->Put("'CODE'");   break;
		case 2:
			out_file->Put("'DATA'");   break;
		case 3:
			out_file->Put("'BSS'");    break;
		case 4:
			out_file->Put("'CONST'");  break;
		default:;
				// Unknown class. Write nothing
	}

	// Tabulate to comment
	out_file->Put(" ");  out_file->Tabulate(AsmTab4);
	out_file->Put(CommentSeparator);
	// Write section number
	out_file->Put("section number ");  
	out_file->PutDecimal(Section);

	// New line
	out_file->NewLine();

	if (Sections[Section].Type & 0x1000) {
		// Communal
		out_file->Put(CommentSeparator);
		out_file->Put(" Communal section not supported by MASM");
		out_file->NewLine();
	}

	if (WordSize == 16 && Sections[Section].Type == 1) {
		// 16 bit code segment. Write ASSUME CS: SEGMENTNAME
		out_file->Put("ASSUME ");
		out_file->Tabulate(AsmTab1);
		out_file->Put("CS:");
		if (Sections[Section].Group) {
			// Group name takes precedence over segment name
			WriteSectionName( out_file, Sections[Section].Group );
		}
		else {
			WriteSectionName( out_file, Section );
		}
		out_file->NewLine();
		Assumes[1] = Section;
	}
}

void CDisassembler::WriteSegmentEnd( CTextFileBuffer *out_file )
{
	// Write end of segment
	out_file->NewLine();

	// Check if Section is valid
	if (Section == 0 || Section >= Sections.GetNumEntries()) {
		// Illegal segment entry
		out_file->Put("UNKNOWN ENDS");  out_file->NewLine(); 
		return;
	}

	// Write segment name
	const char * segname = NameBuffer.Buf() + Sections[Section].Name;
	out_file->Put(segname);

	// Tabulate
	out_file->Put(" "); out_file->Tabulate(AsmTab1);
	// Write "segment"
	out_file->Put("ENDS");
	// New line
	out_file->NewLine();
}

void CDisassembler::WriteAlign( CTextFileBuffer *out_file, uint32 a )
{
	// Write alignment directive
	out_file->Put("ALIGN");
	out_file->Tabulate(AsmTab1);
	out_file->PutDecimal(a);
	out_file->NewLine();
}

void CDisassembler::WriteSymbolName( CTextFileBuffer *out_file, uint32 symi )
{
	// Write symbol name. symi = new symbol index
	out_file->Put(Symbols.GetName(symi));
}

void CDisassembler::WriteFunctionBegin( CTextFileBuffer *out_file )
{
	// Write begin of function IFunction

	// Check if IFunction is valid
	if (IFunction == 0 || IFunction >= FunctionList.GetNumEntries()) {
		// Should not occur
		out_file->Put(CommentSeparator);
		out_file->Put("Internal error: undefined function begin");
		return;
	}

	// Get symbol old index
	uint32 symi = FunctionList[IFunction].OldSymbolIndex;

	// Get symbol record
	uint32 SymI = Symbols.Old2NewIndex(symi);

	out_file->NewLine();                        // Blank line

	// Remember that symbol has been written
	Symbols[SymI].Scope |= 0x100;

	// Check alignment if preceded by NOP
	if ((FlagPrevious & 1) && (IBegin & 0x0F) == 0 && Sections[Section].Align >= 4) {
		WriteAlign( out_file, 16 );
	}

	if (Symbols[SymI].Name == 0) {
		// Has no name. Probably only NOP fillers
		return;
	}

	symi = SymI;
	uint32 scope = Symbols[SymI].Scope;

	WriteSymbolName( out_file, symi );
	// Space
	out_file->Put(" "); out_file->Tabulate(AsmTab1);

	if (scope & 0x1C) {
		// Scope is public
		// Write "PROC"
		out_file->Put("PROC");
		// Write "NEAR" unless 64 bit mode
		if (WordSize < 64) out_file->Put(" NEAR");
		// Check if weak
		if (scope & 8) {
			out_file->NewLine();
			out_file->Put(CommentSeparator);
			out_file->Put(" WEAK ");
			WriteSymbolName( out_file, symi );
		}
		// Check if communal
		if (scope & 0x10) {
			out_file->NewLine();
			out_file->Put(CommentSeparator);
			out_file->Put(" COMDEF ");
			WriteSymbolName( out_file, symi );
		}
	}
	else {
		// Scope is local
		out_file->Put("LABEL NEAR");
	}
	// Check if Gnu indirect
	if (Symbols[symi].Type & 0x40000000) {
		out_file->Put(CommentSeparator);
		out_file->Put("Gnu indirect function"); // Cannot be represented in Masm syntax
	}
	// End line
	out_file->NewLine();

}

void CDisassembler::WriteFunctionEnd( CTextFileBuffer *out_file )
{
	// Write end of function

	// Check if IFunction is valid
	if (IFunction == 0 || IFunction >= FunctionList.GetNumEntries()) {
		// Should not occur
		out_file->Put(CommentSeparator);
		out_file->Put("Internal error: undefined function end");
		return;
	}

	// Get symbol index
	uint32 SymOldI = FunctionList[IFunction].OldSymbolIndex;
	uint32 SymNewI = Symbols.Old2NewIndex(SymOldI);

	// check scope
	if (Symbols[SymNewI].Scope & 0x1C) {
		uint32 symi = SymNewI;
		// Write end of function, MASM syntax
		// Write name
		WriteSymbolName( out_file, symi );

		// Space
		out_file->Put(" "); out_file->Tabulate(AsmTab1);
		// Write "ENDP"
		out_file->Put("ENDP");
		out_file->NewLine();

	}
}

void CDisassembler::WriteCodeLabel( CTextFileBuffer *out_file, uint32 symi )
{
	// Write private or public code label. symi is new symbol index

	// Get scope
	uint32 Scope = Symbols[symi].Scope;

	// Check scope
	if (Scope & 0x100) return;                    // Has been written as function begin

	if (Scope == 0) {
		// Inaccessible. No name. Make blank line
		out_file->NewLine();
		// Remember position for warning check
		LabelInaccessible = IBegin;
		return;
	}

	// Begin on new line if preceded by another symbol
	if (out_file->GetColumn()) out_file->NewLine(); 

	// Check alignment if preceded by NOP
	if ((Scope & 0xFF) > 1 && (FlagPrevious & 1) && (IBegin & 0x0F) == 0 && Sections[Section].Align >= 4) {
		WriteAlign( out_file, 16 );
	}

	uint32 scope = Symbols[symi].Scope;
	if ((scope & 0xFF) > 1) {
		// Scope > function local. Write as label near
		// Check if extra linefeed needed
		// if (!(IFunction && FunctionList[IFunction].Start == IBegin)) 
		// New line
		out_file->NewLine();

		// Write name
		WriteSymbolName( out_file, symi );
		// Space
		out_file->Put(" "); out_file->Tabulate(AsmTab1);
		// Write "LABEL"
		out_file->Put("LABEL");
		// Write "NEAR" even 64 bit mode
		out_file->Put(" NEAR");
		// New line
		out_file->NewLine();

		// Check if weak
		if (scope & 8) {
			out_file->Put(CommentSeparator);
			out_file->Put(" WEAK ");
			WriteSymbolName( out_file, symi );
			out_file->NewLine();
		}
		// Check if communal
		if (scope & 0x10) {
			out_file->Put(CommentSeparator);
			out_file->Put(" COMDEF ");
			WriteSymbolName( out_file, symi );
			out_file->NewLine();
		}
	}
	else {
		// Symbol is local to current function. Write name with colon
		if (FlagPrevious & 2) {
			// Insert blank line if previous instruction was unconditional jump or return
			out_file->NewLine();
		}
		// Write name
		WriteSymbolName( out_file, symi );
		// Write ":"
		out_file->Put(":");
		if (out_file->GetColumn() > AsmTab1) {
			// Past tabstop. Go to next line
			out_file->NewLine();                   // New line
		}
	}

	// Remember this has been written
	Symbols[symi].Scope |= 0x100;
}

int CDisassembler::WriteFillers( CTextFileBuffer *out_file )
{
	// Check if code is a series of NOPs or other fillers. 
	// If so then write it as filler and return 1.
	// If not, then return 0.

	// Check if code is filler
	if (!(OpcodeOptions & 0x40)) {
		// This instruction can not be used as filler
		return 0;
	}
	uint32 FillerType;                            // Type of filler
	const char * FillerName = s.OpcodeDef->Name;  // Name of filler
	uint32 IFillerBegin = IBegin;                 // Start of filling space
	uint32 IFillerEnd;                            // End of filling space

	// check for CC = int 3 breakpoint, 3C00 = 90 NOP, 11F = multibyte NOP
	if (Opcodei == 0xCC || (Opcodei & 0xFFFE) == 0x3C00 || Opcodei == 0x11F) {
		// Instruction is a NOP or int 3 breakpoint
		FillerType = Opcodei;
	}
	else if (s.Warnings1 & 0x1000000) {
		// Instruction is a LEA, MOV, etc. with same source and destination
		// used as a multi-byte NOP
		FillerType = 0xFFFFFFFF;
	}
	else {
		// This instruction does something. Not a filler
		return 0;
	}
	// Save beginning position
	IFillerEnd = IEnd = IBegin;

	// Loop through instructions to find all consecutive fillers
	while (NextInstruction2()) {

		// Parse instruction
		ParseInstruction();

		// Check if code is filler
		if (!(OpcodeOptions & 0x40)) {
			// This instruction can not be a filler
			// Save position of this instruction
			IFillerEnd = IBegin;
			break;
		}
		if (Opcodei != 0xCC && (Opcodei & 0xFFFE) != 0x3C00 && Opcodei != 0x11F
				&& !(s.Warnings1 & 0x1000000)) {
			// Not a filler
			// Save position of this instruction
			IFillerEnd = IBegin;
			break;
		}
		// If loop exits here then fillers end at end of this instruction
		IFillerEnd = IEnd;
	}
	// Safety check
	if (IFillerEnd <= IFillerBegin) return 0;

	// Size of fillers
	uint32 FillerSize = IFillerEnd - IFillerBegin;

	// Write size of filling space
	out_file->Put(CommentSeparator);
	out_file->Put("Filling space: ");
	out_file->PutHex(FillerSize, 2);
	out_file->NewLine();
	// Write filler type
	out_file->Put(CommentSeparator);
	out_file->Put("Filler type: ");
	switch (FillerType) {
		case 0xCC:
			FillerName = "INT 3 Debug breakpoint"; break;
		case 0x3C00:
			FillerName = "NOP"; break;
		case 0x3C01:
			FillerName = "NOP with prefixes"; break;
		case 0x011F:
			FillerName = "Multi-byte NOP";break;
	}
	out_file->Put(FillerName);
	if (FillerType == 0xFFFFFFFF) {
		out_file->Put(" with same source and destination");
	}

	// Write as bytes
	uint32 Pos;
	for (Pos = IFillerBegin; Pos < IFillerEnd; Pos++) {
		if (((Pos - IFillerBegin) & 7) == 0) {
			// Start new line
			out_file->NewLine();
			out_file->Put(CommentSeparator);
			out_file->Tabulate(AsmTab1);
			out_file->Put("db ");
		}
		else {
			// Continue on same line
			out_file->Put(", ");
		}
		// Write byte value
		out_file->PutHex(Get<uint8>(Pos), 1);
	}
	// Blank line
	out_file->NewLine(); out_file->NewLine();

	// Find alignment
	uint32 Alignment = 4;                         // Limit to 2^4 = 16

	// Check if first non-filler is aligned by this value
	while (Alignment && (IFillerEnd & ((1 << Alignment) - 1))) {
		// Not aligned by 2^Alignment
		Alignment--;
	}
	if (Alignment) {

		// Check if smaller alignment would do
		if (Alignment > 3 && FillerSize < 1u << (Alignment-1)) {
			// End is aligned by 16, but there are less than 8 filler bytes.
			// Change to align 8
			Alignment--;
		}
		// Write align directive
		WriteAlign( out_file, 1 << Alignment );
		// Prevent writing ALIGN again
		FlagPrevious &= ~1;
	}

	// Restore IBegin and IEnd to beginning of first non-filler instruction
	IBegin = IEnd = IFillerEnd;

	if (LabelInaccessible == IFillerBegin && IFillerEnd < LabelEnd) {
		// Mark first instruction after filler as inaccessible
		LabelInaccessible = IFillerEnd;
	}

	// Return success. Fillers have been written. Don't write as normal instructions
	return 1;
}

void CDisassembler::WriteErrorsAndWarnings( CTextFileBuffer *out_file )
{
	// Write errors, warnings and comments, if any
	uint32 n;                                     // Error bit
	if (s.Errors) {
		// There are errors
		// Loop through all bits in s.Errors
		for (n = 1; n; n <<= 1) {
			if (s.Errors & n) {
				if (out_file->GetColumn()) out_file->NewLine(); 
				out_file->Put(CommentSeparator);       // Write "\n; "
				out_file->Put("Error: ");              // Write "Error: "
				out_file->Put(Lookup(AsmErrorTexts,n));// Write error text
				out_file->NewLine(); 
			}
		}
	}

	if (s.Warnings1) {
		// There are warnings 1
		// Loop through all bits in s.Warnings1
		for (n = 1; n; n <<= 1) {
			if (s.Warnings1 & n) {
				if (out_file->GetColumn()) out_file->NewLine(); 
				out_file->Put(CommentSeparator);       // Write "; "
				out_file->Put("Note: ");               // Write "Note: "
				out_file->Put(Lookup(AsmWarningTexts1, n));// Write warning text
				out_file->NewLine(); 
			}
		}
	}
	if (s.Warnings2) {
		// There are warnings 2
		// Loop through all bits in s.Warnings2
		for (n = 1; n; n <<= 1) {
			if (s.Warnings2 & n) {
				if (out_file->GetColumn()) out_file->NewLine(); 
				out_file->Put(CommentSeparator);            // Write "; "
				out_file->Put("Warning: ");                 // Write "Warning: "
				out_file->Put(Lookup(AsmWarningTexts2, n)); // Write warning text
				out_file->NewLine(); 
			}
		}
		if (s.Warnings2 & 1) {
			// Write spurious label
			uint32 sym1 = Symbols.FindByAddress(Section, LabelEnd);
			if (sym1) {
				const char * name = Symbols.GetName(sym1);
				out_file->Put(CommentSeparator);
				out_file->Put(name);
				out_file->Put("; Misplaced symbol at address ");
				out_file->PutHex(Symbols[sym1].Offset);
				out_file->NewLine();
			}
		}
	}

	if ((s.OpcodeDef->AllowedPrefixes & 8) && !s.Warnings1) {
		if (s.Prefixes[0]) {
			// Branch hint prefix. Write comment
			out_file->Put(CommentSeparator);             // Write "; "
			switch (s.Prefixes[0]) {
				case 0x2E:
					out_file->Put("Branch hint prefix for Pentium 4: Predict no jump");   
					break;
				case 0x3E:
					out_file->Put("Branch hint prefix for Pentium 4: Predict jump");   
					break;
				case 0x64:
					out_file->Put("Branch hint prefix for Pentium 4: Predict alternate");   
					break;
				default:
					out_file->Put("Note: Unrecognized branch hint prefix");   
			}
			out_file->NewLine(); 
		}
	}
}

void CDisassembler::WriteOperandType( CTextFileBuffer *out_file, uint32 type ) {
	// Write type override before operand, e.g. "dword ", MASM syntax
	if (type & 0xF00) {
		type &= 0xF00;                             // Ignore element type for vectors
	}
	else {
		type &= 0xFF;                              // Use operand type only
	}

	switch (type) {
		case 1:  // 8 bits
			out_file->Put("byte ");  break;
		case 2:  // 16 bits
			out_file->Put("word ");  break;
		case 3:  // 32 bits
			out_file->Put("dword ");  break;
		case 4:  // 64 bits
			out_file->Put("qword ");  break;
		case 5:  // 80 bits
			if ((s.OpcodeDef->Destination & 0xFF) == 0xD) {
				// 64+16 bit far pointer. Not supported by MASM
				out_file->Put("fword ");
				s.OpComment = "64+16 bit. Need REX.W prefix";
			}
			else { 
				out_file->Put("tbyte ");}
			break;
		case 6: case 0x40: case 0x48: case 0:
			// Other size. Write nothing
			break;
		case 7: case 0x0D: // 48 bits or far
			out_file->Put("fword ");  
			if ((s.OpcodeDef->Destination & 0xFF) == 0xD && WordSize == 64) {
				// All assemblers I have tried forget the REX.W prefix here. Make a notice
				s.OpComment = "32+16 bit. Possibly forgot REX.W prefix"; 
			}      
			break;
		case 0x4A: // 16 bits float
			out_file->Put("word ");  break;
		case 0x43: // 32 bits float (x87)
		case 0x4B: // 32 bits float (SSE2)
			out_file->Put("dword ");  break;
		case 0x44: // 64 bits float
		case 0x4C: // 64 bits float (SSE2)
			out_file->Put("qword ");  break;
		case 0x45: // 80 bits float
			out_file->Put("tbyte ");  break;
		case 0x84: case 0x85: // far call
			out_file->Put("far ");  break;
		case 0x95: // 16 bits mask register
			out_file->Put("word ");  break;
		case 0x300:  // MMX
			out_file->Put("qword ");  break;
		case 0x400:  // XMM
			out_file->Put("xmmword ");  break;
		case 0x500:  // YMM
			out_file->Put("ymmword ");  break;
		case 0x600:  // ZMM
			out_file->Put("zmmword ");  break;
		case 0x700:  // future 1024 bit
			out_file->Put("?mmword ");  break;
	}
	out_file->Put("ptr ");
}

void CDisassembler::WriteStringInstruction( CTextFileBuffer *out_file ) {
	// Write string instruction or xlat instruction
	uint32 NumOperands = 0;                       // Number of operands written
	uint32 i;                                     // Loop index
	uint32 Segment;                               // Possible segment prefix

	if (!(s.OpcodeDef->AllowedPrefixes & 0x1100)) {
		// Operand size is 8 if operand size prefixes not allowed
		s.OperandSize = 8;
	}

	out_file->Tabulate(AsmTab1);                    // Tabulate

	// Check repeat prefix
	if (s.OpcodeDef->AllowedPrefixes & 0x20) {
		if (s.Prefixes[3]) {
			// Repeat prefix
			out_file->Put("rep ");
		}
	}
	else if (s.OpcodeDef->AllowedPrefixes & 0x40) {
		if (s.Prefixes[3] == 0xF2) {
			// repne prefix
			out_file->Put("repne ");
		}
		else if (s.Prefixes[3] == 0xF3) {
			// repe prefix
			out_file->Put("repe ");
		}
	}

	// Write opcode name
	out_file->Put(s.OpcodeDef->Name);               // Opcode name

	if ( ((s.OpcodeDef->AllowedPrefixes & 4) && s.Prefixes[0]) 
				|| ((s.OpcodeDef->AllowedPrefixes & 1) && s.Prefixes[1]) ) {
		// Has segment or address size prefix. Must write operands explicitly
		out_file->Put(" ");                          // Space before operands

		// Check address size for pointer registers
		const char * * PointerRegisterNames;
		switch (s.AddressSize) {
			case 16:
				PointerRegisterNames = RegisterNames16;  break;
			case 32:
				PointerRegisterNames = RegisterNames32;  break;
			case 64:
				PointerRegisterNames = RegisterNames64;  break;
			default: 
				PointerRegisterNames = 0;  // should not occur
		}

		// Loop for possibly two operands
		for (i = 0; i < 2; i++) {
			if (s.Operands[i]) {
				// Operand i defined
				if (NumOperands++) {
					// An operand before this one. Separate by ", "
					out_file->Put(", ");
				}
				if (NumOperands == 1) {
					// Write operand size for first operand
					switch (s.OperandSize) {
						case 8:
							out_file->Put("byte  ");  break;
						case 16:
							out_file->Put("word  ");  break;
						case 32:
							out_file->Put("dword  ");  break;
						case 64:
							out_file->Put("qword  ");  break;
					}
				}
				// Get segment
				Segment = 1;                        // Default segment is DS
				if (s.Prefixes[0]) {
					Segment = GetSegmentRegisterFromPrefix(); // Interpret segment prefix
				}
				if ((s.Operands[i] & 0xCF) == 0xC2) {
					Segment = 0;                      // Segment is ES regardless of prefix for [edi] operand
				}
				// Write segment override
				out_file->Put(RegisterNamesSeg[Segment]);
				out_file->Put(":");
				// Opening "["
				out_file->Put("[");

				// Write pointer register
				switch (s.Operands[i] & 0xCF) {
					case 0xC0:  // [bx], [ebx] or [rbx]
						out_file->Put(PointerRegisterNames[3]);  
						break;
					case 0xC1:  // [si], [esi] or [rsi]
						out_file->Put(PointerRegisterNames[6]);  
						break;
					case 0xC2:  // [di], [edi] or [rdi]
						out_file->Put(PointerRegisterNames[7]);  
						break;
				}
				// Closing "]"
				out_file->Put("]");
			}
		}
	}
	else {
		// We don't have to write the operands
		// Append suffix for operand size, except for xlat
		if ((s.Operands[1] & 0xCF) != 0xC0) {

			// Suffix for operand size
			uint32 i = s.OperandSize / 8;
			if (i <= 8) {
				static const char SizeSuffixes[] = " bw d   q"; // Table of suffixes
				out_file->Put(SizeSuffixes[i]);
			}
		}
	}
}

void CDisassembler::WriteRelocationTarget( CTextFileBuffer *out_file, uint32 irel, uint32 Context, int64 Addend ) {
	// Write cross reference, including addend, but not including segment override and []
	// irel = index into Relocations
	// Context:
	// 1      = Data definition
	// 2      = Immediate data field in instruction
	// 4      = Data address in instruction
	// 8      = Near jump/call destination
	// 0x10   = Far  jump/call destination
	// 0x100  = Self-relative address expected
	// Addend:  inline addend
	// Implicit parameters:
	// IBegin:  value of '$' operator
	// IEnd:    reference point for self-relative addressing
	// BaseReg, IndexReg

	uint32 RefFrame;                    // Target segment
	int32  Addend2 = 0;                 // Difference between '$' and reference point

	// Get relocation type
	uint32 RelType = Relocations[irel].Type;

	if (RelType & 0x60) {
		// Inline addend is already relocated. 
		// Ignore addend and treat as direct relocation
		RelType = 1;
		Addend = 0;
	}

	// Get relocation size
	uint32 RelSize = Relocations[irel].Size;

	// Get relocation addend
	Addend += Relocations[irel].Addend;

	// Get relocation target
	uint32 Target = Relocations[irel].TargetOldIndex;

	// Is offset operand needed?
	if ( ((RelType & 0xB) && (Context & 2)) 
				|| ((RelType & 8) && (Context & 0x108)) ) {
		// offset operator needed to convert memory operand to immediate address
		out_file->Put("offset ");
	}

	// Is seg operand needed?
	if (RelType & 0x200) {
		// seg operator needed to convert memory operand to its segment
		out_file->Put("seg ");
	}

	// Is explicit segment or frame needed?
	if ((RelType & 0x408) && (Context & 0x11B)) {
		// Write name of segment/group frame
		RefFrame = Relocations[irel].RefOldIndex;
		if (!RefFrame) {
			// No frame. Use segment of symbol
			RefFrame = Symbols[Symbols.Old2NewIndex(Target)].Section;
		}
		if (RefFrame && RefFrame < Sections.GetNumEntries()) {
			// Write segment or group name
			const char * SecName = NameBuffer.Buf()+Sections[RefFrame].Name;
			out_file->Put(SecName);
			out_file->Put(":");
		}
	}

	// Is imagerel operator needed?
	if (RelType & 4) {
		// imagerel operator needed to get image-relative address
		out_file->Put("imagerel(");
	}

	// Adjust addend
	// Adjust offset if self-relative relocation expected and found
	if ((RelType & 2) && (Context & 0x108)) {
		// Self-relative relocation expected and found
		// Adjust by size of address field and immediate field
		Addend += IEnd - Relocations[irel].Offset;
	}
	// Subtract self-reference if unexpected self-relative relocation
	if ((RelType & 2) && !(Context & 0x108)) {
		// Self-relative relocation found but not expected
		// Fix difference between '$' and reference point
		Addend2 = Relocations[irel].Offset - IBegin;
		Addend -= Addend2;
	}
	// Add self-reference if self-relative relocation expected but not found
	if (!(RelType & 2) && (Context & 0x108)) {
		// Self-relative relocation expected but not found
		// Fix difference between '$' and reference point
		Addend += IEnd - IBegin;
	}

	if (RelType & 0x100) {
		// Target is a segment
		RefFrame = Symbols[Symbols.Old2NewIndex(Target)].Section;
		if (RefFrame && RefFrame < Sections.GetNumEntries()) {
			const char * SecName = NameBuffer.Buf()+Sections[RefFrame].Name;
			out_file->Put(SecName);
		}
		else {
			out_file->Put("undefined segment");
		}
	}
	else {
		// Target is a symbol

		// Find target symbol
		uint32 TargetSym = Symbols.Old2NewIndex(Target);

		// Check if Target is appropriate
		if (((Symbols[TargetSym].Type & 0x80000000) || (int32)Addend)
				&& !(CodeMode == 1 && s.BaseReg)) {
			// Symbol is a start-of-section entry in symbol table, or has an addend
			// Look for a more appropriate symbol, except if code with base register
			uint32 sym, sym1, sym2 = 0;
			sym1 = Symbols.FindByAddress(Symbols[TargetSym].Section, Symbols[TargetSym].Offset + (int32)Addend, &sym2);
			for (sym = sym1; sym && sym <= sym2; sym++) {
				if (Symbols[sym].Scope && !(Symbols[sym].Type & 0x80000000)) {
					// Found a better symbol name for target address
					TargetSym = sym;
					Addend = Addend2;
				}
			}
		}
		// Write name of target symbol
		out_file->Put(Symbols.GetName(TargetSym));
	}

	// End parenthesis if we started one
	if (RelType & 4) {
		out_file->Put(")");
	}

	// Subtract reference point, if any
	if (RelType & 0x10) {
		out_file->Put("-");
		// Write name of segment/group frame
		uint32 RefPoint = Relocations[irel].RefOldIndex;
		if (RefPoint) {
			// Reference point name valid
			out_file->Put(Symbols.GetNameO(RefPoint));
		}
		else {
			out_file->Put("Reference_Point_Missing");
		}
	}

	// Subtract self-reference if unexpected self-relative relocation
	if ((RelType & 2) && !(Context & 0x108)) {
		// Self-relative relocation found but not expected
		out_file->Put("-"); out_file->Put(HereOperator);
	}

	// Add self-reference if self-relative relocation expected but not found
	if (!(RelType & 2) && (Context & 0x108)) {
		// Self-relative relocation expected but not found
		out_file->Put("+"); out_file->Put(HereOperator);
	}

	// Write addend, if not zero
	if (Addend) {
		if (Addend < 0) {
			// Negative, write "-"
			out_file->Put("-");
			Addend = -Addend;
		}
		else {
			// Positive, write "+"
			out_file->Put("+");
		}

		// Write value as hexadecimal
		switch (RelSize) {
			case 1:
				out_file->PutHex((uint8)Addend, 1);
				break;
			case 2:
				out_file->PutHex((uint16)Addend, 2);
				break;
			case 4:
				out_file->PutHex((uint32)Addend, 2);
				break;
			case 6:
				out_file->PutHex((uint16)(Addend >> 32), 1);
				out_file->Put(":");
				out_file->PutHex((uint32)Addend, 1);
				break;
			case 8:
				out_file->PutHex((uint64)Addend, 2);
				break;
			default:
				out_file->Put("??"); // Should not occur
				break;
		}
	}
}

void CDisassembler::WriteImmediateOperand( CTextFileBuffer *out_file, uint32 Type ) {
	// Write immediate operand or direct jump/call address
	int    WriteFormat;                 // 0: unsigned, 1: signed, 2: hexadecimal
	int    Components = 0;              // Number of components in immediate operand       
	uint32 OSize;                       // Operand size
	uint32 FieldPointer;                // Pointer to field containing value
	uint32 FieldSize;                   // Size of field containing value
	int64  Value = 0;                   // Value of immediate operand

	// Check if far
	if ((Type & 0xFE) == 0x84) {
		// Write far 
		WriteOperandType( out_file, Type );
	}

	// Check if type override needed
	if ((s.OpcodeDef->AllowedPrefixes & 2) && s.Prefixes[4] == 0x66
			&& (Opcodei == 0x68 || Opcodei == 0x6A)) {
		// Push immediate with non-default operand size needs type override
		WriteOperandType( out_file, s.OperandSize == 16 ? 2 : 3 );
	}

	FieldPointer = s.ImmediateField;
	FieldSize    = s.ImmediateFieldSize;

	if (Type & 0x200000) {
		if (FieldSize > 1) {
			// Uses second part of field. Single byte only
			FieldPointer += FieldSize-1;
			FieldSize = 1;
		}
		else {
			// Uses half a byte
			FieldSize = 0;
		}
	}

	// Get inline value
	switch (FieldSize) {
		case 0:  // 4 bits
			Value = Get<uint8>(FieldPointer) & 0x0F;
			break;

		case 1:  // 8 bits
			Value = Get<int8>(FieldPointer);  
			break;

		case 2:  // 16 bits
			Value = Get<int16>(FieldPointer);  break;

		case 6:  // 48 bits
			Value  = Get<int32>(FieldPointer);  
			Value += (uint64)Get<uint16>(FieldPointer + 4) << 32;  
			break;

		case 4:  // 32 bits
			Value = Get<int32>(FieldPointer);  break;

		case 8:  // 64 bits
			Value = Get<int64>(FieldPointer);  break;

		case 3:  // 16+8 bits ("Enter" instruction)
			if ((Type & 0xFF) == 0x12) {
				// First 16 bits
				FieldSize = 2; Value = Get<int16>(FieldPointer);  break;
			}
			// else continue in default case to get error message

		default:  // Other sizes should not occur
			err.submit(3000);  Value = -1;
	}

	// Check if relocation
	if (s.ImmediateRelocation) {
		// Write relocation target name
		uint32 Context = 2;
		if ((Type & 0xFC) == 0x80) Context = 8;     // Near jump/call destination
		if ((Type & 0xFC) == 0x84) Context = 0x10;  // Far jump/call destination

		// Write cross reference
		WriteRelocationTarget( out_file, s.ImmediateRelocation, Context, Value );

		// Remember that Value has been written
		Value = 0;
		Components++;
	}
	// Check if AAM or AAD
	if (Value == 10 && (Opcodei & 0xFE) == 0xD4) {
		// Don't write operand for AAM or AAD if = 10
		return;
	}

	// Write as unsigned, signed or hexadecimal:
	if ((Type & 0xF0) == 0x30 || (Type & 0xF0) == 0x80) {
		// Hexadecimal
		WriteFormat = 2;
	}
	else if (s.ImmediateFieldSize == 8) {
		// 64 bit constant
		if (Value == (int32)Value) {
			// Signed
			WriteFormat = 1;
		}
		else {
			// Hexadecimal
			WriteFormat = 2;
		}
	}
	else if ((Type & 0xF0) == 0x20) {
		// Signed
		WriteFormat = 1;
	}
	else {
		// Unsigned
		WriteFormat = 0;
	}

	if ((Type & 0xFC) == 0x80 && !s.ImmediateRelocation) {
		// Self-relative jump or call without relocation. Adjust immediate value
		Value += IEnd;                             // Get absolute address of target
		Value += SectionAddress; // jjh

		// jjh
		/*
		// Look for symbol at target address
		uint32 ISymbol = Symbols.FindByAddress(Section, (uint32)Value);
		if (ISymbol && (Symbols[ISymbol].Name || CodeMode == 1)) {
		// Symbol found. Write its name
		out_file->Put(Symbols.GetName(ISymbol));
		// No offset to write
		return;
		}
		 */
		// Target address has no name
		Type |= 0x4000;                            // Write target as hexadecimal
	}

	// Operand size
	if ((s.Operands[0] & 0xFFF) <= 0xA || (s.Operands[0] & 0xF0) == 0xA0) {
		// Destination is general purpose register
		OSize = s.OperandSize;
	}
	else {
		// Constant probably unrelated to destination size
		OSize = 8;
	}
	// Check if destination is 8 bit operand
	//if ((s.Operands[0] & 0xFF) == 1 || (s.Operands[0] & 0xFF) == 0xA1) OSize = 8;

	// Check if sign extended
	if (OSize > s.ImmediateFieldSize * 8) {
		if (WriteFormat == 2 && Value >= 0) {
			// Hexadecimal sign extended, not negative:
			// Does not need full length
			OSize = s.ImmediateFieldSize * 8;
		}
		else if (WriteFormat == 0) {
			// Unsigned and sign extended, change to signed
			WriteFormat = 1;
		}
	}

	OSize = 32; //jjh
	if (Components) {
		// There was a relocated name
		if (Value) {
			// Addend to relocation is not zero
			if (Value > 0 || WriteFormat != 1) {
				out_file->Put("+");                  // Put "+" between name and addend
			}
			else {
				out_file->Put("-");                  // Put "-" between name and addend
				Value = - Value;                  // Change sign to avoid another "-"
			}
		}
		else {
			// No addend to relocated name
			return;
		}
	}
	// Write value
	if (WriteFormat == 2) {
		// Write with hexadecimal number appropriate size
		switch (OSize) {
			case 8:  // 8 bits
				out_file->PutHex((uint8)Value, 1);  break;
			case 16:  // 16 bits
				if ((Type & 0xFC) == 0x84) {
					// Segment of far call
					out_file->PutHex((uint16)(Value >> 16), 1);
					out_file->Put(':');
				}
				out_file->PutHex((uint16)Value, 2);  break;
			case 32:  // 32 bits
			default:  // Should not occur
				if ((Type & 0xFC) == 0x84) {
					// Segment of far call
					out_file->PutHex((uint16)(Value >> 32), 1);
					out_file->Put(':');
				}
				out_file->PutHex((uint32)Value, 2);  break;
			case 64:  // 64 bits
				out_file->PutHex((uint64)Value, 2);  break;
		}
	}
	else {
		// Write as signed or unsigned decimal
		if (WriteFormat == 0) { // unsigned
			switch (OSize) {
				case 8:  // 8 bits
					Value &= 0x00FF;  break;
				case 16:  // 16 bits
					Value &= 0xFFFF;  break;
			}
		}
		out_file->PutDecimal((int32)Value, WriteFormat);  // Write value. Signed or usigned decimal
	}
}

void CDisassembler::WriteOtherOperand( CTextFileBuffer *out_file, uint32 Type ) {
	// Write other type of operand
	const char * * OpRegisterNames;               // Pointer to list of register names
	uint32 RegI = 0;                              // Index into list of register names

	switch (Type & 0x8FF) {
		case 0xA1:  // AL
			OpRegisterNames = RegisterNames8;
			break;
		case 0xA2:  // AX
			OpRegisterNames = RegisterNames16;
			break;
		case 0xA3:  // EAX
			OpRegisterNames = RegisterNames32;
			break;
		case 0xA4:  // RAX
			OpRegisterNames = RegisterNames64;
			break;
		case 0xAE:  // xmm0
			out_file->Put("xmm0");
			return;
		case 0xAF:  // ST(0)
			out_file->Put("st(0)");
			return;
		case 0xB1:  // 1
			out_file->Put("1");
			return;
		case 0xB2:  // DX
			OpRegisterNames = RegisterNames16;
			RegI = 2;
			break;
		case 0xB3: // CL
			OpRegisterNames = RegisterNames8;
			RegI = 1;
			break;
		default:
			out_file->Put("unknown operand");
			err.submit(3000);
			return;
	}
	// Write register name
	out_file->Put(OpRegisterNames[RegI]);
}

void CDisassembler::WriteRegOperand( CTextFileBuffer *out_file, uint32 Type ) {
	// Write register operand from reg bits
	uint32 Num = s.Reg;                           // Register number

	// Write register name
	WriteRegisterName( out_file, Num, Type );
}

void CDisassembler::WriteRMOperand( CTextFileBuffer *out_file, uint32 Type ) {
	// Write memory or register operand from mod/rm bits of mod/reg/rm byte 
	// and possibly SIB byte or direct memory operand to out_file->
	// Also used for writing direct memory operand

	if ((Type & 0xFF) == 0) {
		// No explicit operand
		return;
	}

	uint32 Components = 0;                        // Count number of addends inside []
	int64  Addend = 0;                            // Inline displacement or addend
	int AddressingMode = 0;                       // 0: 16- or 32 bit addressing mode
	// 1: 64-bit pointer
	// 2: 32-bit absolute in 64-bit mode
	// 4: 64-bit rip-relative
	// 8: 64-bit absolute
	// Check if register or memory
	if (s.Mod == 3) {
		// Register operand
		WriteRegisterName( out_file, s.RM, Type );
		return;
	}

	// Find addend, if any
	switch (s.AddressFieldSize) {
		case 1:  // 1 byte displacement
			Addend = Get<int8>(s.AddressField);
			break;
		case 2:  // 2 bytes displacement
			Addend = Get<int16>(s.AddressField);
			break;
		case 4:  // 4 bytes displacement
			Addend = Get<int32>(s.AddressField);
			if ((s.MFlags & 0x100) && !s.AddressRelocation) {
				// rip-relative
				Addend += ImageBase + uint64(SectionAddress + IEnd);
			}
			break;
		case 8:  // 8 bytes address
			Addend = Get<int64>(s.AddressField);
			break;
	}
	// Get AddressingMode
	if (s.AddressSize > 32) {
		if (s.MFlags & 0x100) {
			AddressingMode = 4;                     // 64-bit rip-relative
		}
		else if (s.AddressFieldSize == 8) {
			AddressingMode = 8;                     // 64-bit absolute
		}
		else if (s.AddressRelocation || (s.BaseReg==0 && s.IndexReg==0)) {
			AddressingMode = 2;                     // 32-bit absolute in 64-bit mode
		}
		else {
			AddressingMode = 1;                     // 64-bit pointer
		}
	}

	// Make exception for LEA with no type
	if (Opcodei == 0x8D) {
		Type = 0;
	}
	// Write type override
	if ((s.OpcodeDef->InstructionFormat & 0x1F) == 0x1E) {    
		WriteOperandType( out_file, Type & 0xFF );    // has vsib address: write element type rather than vector type
	}
	else if (!(s.OpcodeDef->Options & 0x800)) {
		WriteOperandType( out_file, Type );           // write operand type
	}

	// Write segment prefix, if any
	if (s.Prefixes[0]) {
		out_file->Put(RegisterNamesSeg[GetSegmentRegisterFromPrefix()]);
		out_file->Put(":");
	}
	else if (!s.BaseReg && !s.IndexReg && (!s.AddressRelocation || (s.Warnings1 & 0x10000))) { 
		// No pointer register and no memory reference or wrong type of memory reference.
		// Write segment register to indicate that we have a memory operand
		out_file->Put("DS:");
	}

	out_file->Put("[");

	// Write relocation target, if any
	if (s.AddressRelocation) {
		// Write cross reference
		WriteRelocationTarget( out_file, s.AddressRelocation, 4 | (s.MFlags & 0x100), Addend );
		// Addend has been written, don't write it again
		Addend = 0;
		// Remember that something has been written
		Components++;
	}

	// Check address size for pointer registers
	//const char * * PointerRegisterNames;
	uint32 RegisterType = 0;
	switch (s.AddressSize) {
		case 16:
			RegisterType = 2;  break;
		case 32:
			RegisterType = 3;  break;
		case 64:
			RegisterType = 4;  break;
	}

	// Write base register, if any
	if (s.BaseReg) {
		if (Components++) out_file->Put("+");      // Put "+" if anything before
		WriteRegisterName( out_file, s.BaseReg - 1, RegisterType ); 
	}

	// Write index register, if any
	if (s.IndexReg) {
		if (Components++) out_file->Put("+");        // Put "+" if anything before
		if ((s.OpcodeDef->InstructionFormat & 0x1F) != 0x1E) {
			// normal index register
			WriteRegisterName( out_file, s.IndexReg - 1, RegisterType ); 
		}
		else {
			// VSIB byte specifies vector index register
			WriteRegisterName( out_file, s.IndexReg - 1, Type & 0xF00 ); 
		}
		// Write scale factor, if any
		if (s.Scale) {
			out_file->Put("*");
			out_file->PutDecimal(1 << s.Scale);
		}
	}

	// Write +/- before addend
	if (Components && Addend) {
		// Displacement comes after base/index registers
		if (Addend >= 0 || s.AddressFieldSize == 8) {
			// Positive. Write +
			out_file->Put("+");
		}
		else {
			// Negative. Write -
			out_file->Put("-");
			Addend = -Addend;
		}
	}

	if (Addend || Components == 0) {
		// Find minimum number of digits needed
		uint32 AddendSize = s.AddressFieldSize;
		if ((uint64)Addend < 0x100 && AddendSize > 1) AddendSize = 1;
		else if ((uint64)Addend < 0x10000 && AddendSize > 2) AddendSize = 2;

		// Write address or addend as hexadecimal
		out_file->PutHex((uint64)Addend, 2);

		// Check if offset multiplier needed
		if (s.OffsetMultiplier && s.AddressFieldSize == 1 && Addend) {
			out_file->Put("*");
			out_file->PutHex(s.OffsetMultiplier, 2);
		}
	}

	// End with "]"
	out_file->Put("]");
}

void CDisassembler::WriteRegisterName( CTextFileBuffer *out_file, uint32 Value, uint32 Type ) {
	// Write name of register to OutFile
	if (Type & 0xF00) {
		// vector register
		Type &= 0xF00;
	}
	else {
		// Other register
		Type &= 0xFF;                              // Remove irrelevant bits
	}

	// Check fixed registers (do not depend on Value)
	switch (Type) {
		case 0xA1:  // al
			Type = 1;  Value = 0;
			break;

		case 0xA2:  // ax
			Type = 2;  Value = 0;
			break;

		case 0xA3:  // eax
			Type = 3;  Value = 0;
			break;

		case 0xA4:  // rax
			Type = 4;  Value = 0;
			break;

		case 0xAE:  // xmm0
			Type = 0x400;  Value = 0;
			break;

		case 0xAF:  // st(0)
			Type = 0x40;  Value = 0;
			break;

		case 0xB2:  // dx
			Type = 2;  Value = 2;
			break;

		case 0xB3:  // cl
			Type = 1;  Value = 1;
			break;
	}

	// Get register number limit
	uint32 RegNumLimit = 7;    // largest register number
	if (WordSize >= 64) {
		RegNumLimit = 15;
		if ((s.Prefixes[6] & 0x40) && (Type & 0xF40)) {
			// EVEX or MVEX prefix and vector
			RegNumLimit = 31;
		}
	}

	switch (Type) {
		case 0x91:     // segment register
			RegNumLimit = 5;
			break;
		case 0x300:  // mmx
		case 0x40:   // st register         
		case 0x95:   // k mask register
			RegNumLimit = 7;
			break;
		case 0x98:   // bounds register
			RegNumLimit = 3;
			break;
	}
	if (Value > RegNumLimit) {
		// register number out of range
		out_file->Put("unknown register ");
		switch (Type) {
			case 1:
				out_file->Put("(8 bit) ");  break;
			case 2:
				out_file->Put("(16 bit) ");  break;
			case 3:
				out_file->Put("(32 bit) ");  break;
			case 4:
				out_file->Put("(64 bit) ");  break;
			case 0x40:   // st register
				out_file->Put("st");  break;
			case 0x91:  // Segment register
				out_file->Put("seg");  break;
			case 0x92:  // Control register
				out_file->Put("cr");  break;
			case 0x95:  // k mask register
				out_file->Put("k");  break;
			case 0x300:  // mmx register
				out_file->Put("mm");  break;
			case 0x400:  // xmm register
				out_file->Put("xmm");  break;
			case 0x500:  // ymm register
				out_file->Put("ymm");  break;
			case 0x600:  // zmm register
				out_file->Put("zmm");  break;
			case 0x700:  // future 1024 bit register
				out_file->Put("?mm");  break;
		}
		out_file->PutDecimal(Value);
	}
	else {
		// Write register name depending on type
		switch (Type) {
			case 1:  // 8 bit register. Depends on any REX prefix
				out_file->Put(s.Prefixes[7] ? RegisterNames8x[Value] : RegisterNames8[Value & 7]);
				break;

			case 2:  // 16 bit register
				out_file->Put(RegisterNames16[Value]);
				break;

			case 3:  // 32 bit register
				out_file->Put(RegisterNames32[Value]);
				break;

			case 4:  // 64 bit register
				out_file->Put(RegisterNames64[Value]);
				break;

			case 0x300:  // mmx register
				out_file->Put("mm");
				out_file->PutDecimal(Value);
				break;

			case 0x400:  // xmm register (packed integer or float)
			case 0x48: case 0x4B: case 0x4C: // xmm register (scalar float)
				out_file->Put("xmm");
				out_file->PutDecimal(Value);
				break;

			case 0x500:  // ymm register (packed)
				out_file->Put("ymm");
				out_file->PutDecimal(Value);
				break;

			case 0x600:  // zmm register (packed)
				out_file->Put("zmm");
				out_file->PutDecimal(Value);
				break;

			case 0x700:  // future 1024 bit register
				out_file->Put("?mm");
				out_file->PutDecimal(Value);
				break;

			case 0x40:  // st register
				// MASM and GAS-Intel use st(0), 
				out_file->Put("st(");
				out_file->PutDecimal(Value);
				out_file->Put(")");
				break;

			case 0x91:  // Segment register
				out_file->Put(RegisterNamesSeg[Value & 7]);
				break;

			case 0x92:  // Control register
				out_file->Put(RegisterNamesCR[Value]);
				break;

			case 0x93:  // Debug register
				out_file->Put("dr");
				out_file->PutDecimal(Value);
				break;

			case 0x94:  // Test register (obsolete)
				out_file->Put("tr");
				out_file->PutDecimal(Value);
				break;

			case 0x95:  // k mask register
				out_file->Put("k");
				out_file->PutDecimal(Value);
				break;

			case 0x98:  // bounds register
				out_file->Put("bnd");
				out_file->PutDecimal(Value);
				break;

			case 0xB1:  // 1
				out_file->Put("1");
				break;

			default:    // Unexpected
				out_file->Put("UNKNOWN REGISTER TYPE ");
				out_file->PutDecimal(Value);
				break;
		}
	}
}

void CDisassembler::WriteShortRegOperand( CTextFileBuffer *out_file, uint32 Type ) {
	// Write register operand from lower 3 bits of opcode byte to OutFile
	uint32 rnum = Get<uint8>(s.OpcodeStart2) & 7;
	// Check REX.B prefix
	if (s.Prefixes[7] & 1) rnum |= 8;             // Add 8 if REX.B prefix
	// Write register name
	WriteRegisterName( out_file, rnum, Type );
}

void CDisassembler::WriteDREXOperand( CTextFileBuffer *out_file, uint32 Type ) {
	// Write register operand from dest bits of DREX byte (AMD only)
	uint32 Num = s.Vreg >> 4;                    // Register number
	// Write register name
	WriteRegisterName( out_file, Num, Type );
}

void CDisassembler::WriteVEXOperand( CTextFileBuffer *out_file, uint32 Type, int i ) {
	// Write register operand from VEX.vvvv bits or immediate bits
	uint32 Num;                                   // Register number
	switch (i) {
		case 0:  // Use VEX.vvvv bits
			Num = s.Vreg & 0x1F;  break;
		case 1:  // Use immediate bits 4-7
			Num = Get<uint8>(s.ImmediateField) >> 4;  break;
		case 2:  // Use immediate bits 0-3 (Unused. For possible future use)
			Num = Get<uint8>(s.ImmediateField) & 0x0F;  break;
		default:
			Num = 0;
	}
	// Write register name
	WriteRegisterName( out_file, Num, Type );
}

void CDisassembler::WriteOperandAttributeEVEX( CTextFileBuffer *out_file, int i, int isMem ) {
	// Write operand attributes and instruction attributes from EVEX z, LL, b and aaa bits
	// i = operand number (0 = destination, 1 = first source, 2 = second source, 
	// 98 = after last SIMD operand, 99 = after last operand)
	// isMem: true if memory operand, false if register operand
	uint32 swiz = s.OpcodeDef->EVEX;   // indicates meaning of EVEX attribute bits

	if ((swiz & 0x30) && (i == 0 || (s.OpcodeDef->Destination == 0 && i == 1))) {  // first operand
		// write mask
		if (s.Kreg || (swiz & 0xC0)) {
			out_file->Put(" {k");
			out_file->PutDecimal(s.Kreg);
			out_file->Put("}");
			if ((swiz & 0x20) && (s.Esss & 8)) {
				// zeroing
				out_file->Put("{z}");
			}
		}
	}
	if (swiz & 0x07) {
		// broadcast, rounding or sae allowed
		if (isMem && i < 8) {
			// memory operand
			if ((swiz & 0x01) && (s.Esss & 1)) {            
				// write memory broadcast
				// calculate broadcast factor
				uint32 op = s.Operands[i];  // operand
				uint32 elementsize = GetDataElementSize(op); // element size
				uint32 opv = s.Operands[0];  // any vector operand
				if (!(opv & 0xF00)) opv = s.Operands[1]; // first operand is not a vector, use next
				uint32 vectorsize  = GetDataItemSize(opv); // vector size
				if (vectorsize > elementsize) { // avoid broadcasting to scalar
					if (elementsize) { // avoid division by zero
						out_file->Put(" {1to");
						out_file->PutDecimal(vectorsize/elementsize);
						out_file->Put("}");
					}
					else {
						out_file->Put("{unknown broadcast}");
					}
				}
			}
		}
		if (i == 98 && s.Mod == 3) {   // after last SIMD operand. no memory operand
			// NASM has rounding mode and sae decoration after last SIMD operand with a comma.
			// No spec. for other assemblers available yet (2014). 
			// use i == 99 if it should be placed after last operand.
			// Perhaps the comma should be removed for other assemblers?
			if ((swiz & 0x4) && (s.Esss & 1)) {
				// write rounding mode
				uint32 rounding = (s.Esss >> 1) & 3;
				out_file->Put(", {");
				out_file->Put(EVEXRoundingNames[rounding]);
				out_file->Put("}");
			}
			else if ((swiz & 0x2) && (s.Esss & 1)) {
				// no rounding mode. write sae
				out_file->Put(", {");
				out_file->Put(EVEXRoundingNames[4]);
				out_file->Put("}");
			}
		}
	}
}

void CDisassembler::WriteOperandAttributeMVEX( CTextFileBuffer *out_file, int i, int isMem ) {
	// Write operand attributes and instruction attributes from MVEX sss, e and kkk bits.
	// i = operand number (0 = destination, 1 = first source, 2 = second source, 99 = after last operand)
	// isMem: true if memory operand, false if register operand
	uint32 swiz = s.OpcodeDef->MVEX;   // indicates meaning of MVEX attribute bits
	const int R_sae_syntax = 0;   // syntax alternatives for rounding mode + sae
	// 0: {rn-sae}, 1: {rn}{sae}
	const char * text = 0;        // temporary text pointer

	if ((swiz & 0x1000) && (i == 0 || (s.OpcodeDef->Destination == 0 && i == 1))) {  // first operand
		// write mask
		if (s.Kreg || (swiz & 0x2000)) {
			out_file->Put(" {k");
			out_file->PutDecimal(s.Kreg);
			out_file->Put("}");
		}
	}
	if (swiz & 0x1F) {
		// swizzle allowed    
		if (isMem && i < 90) {
			// write memory broadcast/up/down conversion
			text = s.SwizRecord->name;
			if (text && *text) {
				out_file->Put(" {");  out_file->Put(text);  out_file->Put("}");
			}
		}
		//if (i == 2 || ((s.OpcodeDef->Source2 & 0xF0F00) == 0 && i == 1)) {
		if (i == 98) {   // after last SIMD operand
			// last register or memory operand
			if (s.Mod == 3 && !((swiz & 0x700) && (s.Esss & 8))) { // skip alternative meaning of sss field for register operand when E=1
				// write register swizzle
				text = s.SwizRecord->name;
				if (text && *text) {
					out_file->Put(" {");  out_file->Put(text);  out_file->Put("}");
				}
			}
		}
		if (i == 99) {   // after last operand
			if (s.Mod == 3 && (swiz & 0x300) && (s.Esss & 8)) {            
				// alternative meaning of sss field for register operand when E=1
				switch (swiz & 0x300) {
					case 0x100:  // rounding mode and not sae
						text = SwizRoundTables[0][0][s.Esss & 3].name;
						break;
					case 0x200:  // suppress all exceptions
						if ((s.Esss & 4) && !(swiz & 0x800)) text = "sae";
						break;
					case 0x300:  // rounding mode and sae
						text = SwizRoundTables[0][R_sae_syntax][s.Esss & 7].name;
						break;
				}
			}
			if (text && *text) {
				out_file->Put(", {");  out_file->Put(text);  out_file->Put("}");
			}
		}
	}
	if (isMem && (s.Esss & 8) && !(swiz & 0x800)) {
		// cache eviction hint after memory operand
		out_file->Put(" {eh}");
	}
}

void CDisassembler::WriteAssume( CTextFileBuffer *out_file )
{
	// Write assume directive for segment register if MASM syntax
	if (!s.AddressField) return;

	int32 SegReg, PrefixSeg;                      // Segment register used
	uint32 symo;                                  // Target symbol old index
	uint32 symi;                                  // Target symbol new index
	int32 TargetSegment;                          // Target segment/section
	int32 TargetGroup;                            // Group containing target segment

	// Find which segment register is used for addressing memory operand
	SegReg = 3;  // DS is default
	if (s.BaseReg == 4+1 || s.BaseReg == 5+1) {
		// Base register is (E)BP or ESP
		SegReg = 2;     // SS register used unless there is a prefix
	}
	if (s.Prefixes[0]) {
		// There is a segment prefix
		PrefixSeg = GetSegmentRegisterFromPrefix();
		if (PrefixSeg >= 0 && PrefixSeg <= 5) {
			// Segment prefix is valid. Segment determined by segment prefix
			SegReg = PrefixSeg;
		}
	}
	// Default target segment is none
	TargetSegment = TargetGroup = 0;

	// Find symbol referenced by next instruction
	if (s.AddressRelocation && s.AddressRelocation < Relocations.GetNumEntries()) {
		symo = Relocations[s.AddressRelocation].TargetOldIndex; // Target symbol old index
		if (symo) {
			symi = Symbols.Old2NewIndex(symo);                   // Target symbol new index
			if (symi) {
				TargetSegment = Symbols[symi].Section;            // Target segment
				if (TargetSegment < 0 || TargetSegment >= (int32)Sections.GetNumEntries()) {
					TargetSegment = 0;
				}
				else {
					TargetGroup = Sections[TargetSegment].Group;   // Group containing target segment
					if (TargetGroup <= ASM_SEGMENT_ERROR || TargetGroup >= (int32)Sections.GetNumEntries()) {
						TargetGroup = 0;
					}
				}
			}
		}
	}
	if (TargetSegment) {
		// Target has a segment. Check if it is different from currently assumed segment
		if (TargetSegment != Assumes[SegReg] && TargetGroup != Assumes[SegReg]) {
			// Assume directive needed
			// If segment belongs to a group then the group takes precedence
			if (TargetGroup) TargetSegment = TargetGroup;
			// Write assume directive
			out_file->Put("ASSUME ");
			out_file->Tabulate(AsmTab1);
			out_file->Put(RegisterNamesSeg[SegReg]);  // Name of segment register used
			out_file->Put(":");
			WriteSectionName( out_file, TargetSegment );        // Name of segment or group referenced
			out_file->NewLine();
			Assumes[SegReg] = TargetSegment;
		}
	}
	else {
		// Target segment not specified. Assumed value may be anyting but 'error'
		if (Assumes[SegReg] <= ASM_SEGMENT_ERROR) {
			// Segment register is assumed to 'error'. Change assume to 'nothing'
			out_file->Put("ASSUME ");
			out_file->Tabulate(AsmTab1);
			out_file->Put(RegisterNamesSeg[SegReg]);  // Name of segment register used
			out_file->Put(":NOTHING");
			out_file->NewLine();
			Assumes[SegReg] = ASM_SEGMENT_NOTHING;
		}
	}
}

void CDisassembler::WriteInstruction( CTextFileBuffer *out_file ) {
	// Write instruction and operands
	uint32 NumOperands = 0;                       // Number of operands written
	uint32 i;                                     // Loop index
	const char * OpName;                          // Opcode name

	if ( s.AddressFieldSize ) {
		// There is a memory operand. Check if ASSUME directive needed
		WriteAssume( out_file );
	}

	if (CodeMode & 6) {
		// Code is dubious. Show as comment only
		out_file->Put(CommentSeparator);             // Start comment
	}
	else if ((s.OpcodeDef->Options & 0x20) && s.OpcodeStart1 > IBegin) {
		// Write prefixes explicitly. 
		// This is used for rare cases where the assembler cannot generate the prefix
		out_file->Tabulate(AsmTab1);                 // Tabulate
		out_file->Put("DB ");
		out_file->Tabulate(AsmTab2);                 // Tabulate
		for (i = IBegin; i < s.OpcodeStart1; i++) {
			if (i > IBegin) out_file->Put(", ");
			out_file->PutHex(Get<uint8>(i), 1);
		}
		out_file->Tabulate(AsmTab4);                 // Tabulate
		out_file->Put(CommentSeparator);
		if ((s.OpcodeDef->AllowedPrefixes & 8) && Get<uint8>(IBegin) == 0xF2) {
			out_file->Put("BND prefix coded explicitly");    // Comment
		}
		else {        
			out_file->Put("Prefix coded explicitly");    // Comment
		}
		out_file->NewLine();
	}

	if ((s.Operands[0] & 0xF0) == 0xC0 || (s.Operands[1] & 0xF0) == 0xC0) {
		// String instruction or xlat instruction
		WriteStringInstruction( out_file );
		return;
	}

	out_file->Tabulate(AsmTab1);                     // Tabulate
	//out_file->Put(" ");	// jjh

	if ((s.OpcodeDef->AllowedPrefixes & 0xC40) == 0xC40) {
		switch (s.Prefixes[5]) {
			case 0xF2:
				out_file->Put("xacquire ");  break;      // xacquire prefix
			case 0xF3:
				out_file->Put("xrelease ");  break;      // xrelease prefix
		}
	}
	if (s.Prefixes[2]) {
		out_file->Put("lock ");                      // Lock prefix
	}

	// Get opcode name
	if (s.OpcodeDef->Name) {
		// Opcode name
		OpName = s.OpcodeDef->Name;
		// Search for opcode comment
		s.OpComment = strchr(OpName, ';');
		if (s.OpComment) s.OpComment++;            // Point to after ';'
	}
	else {
		OpName = "UNDEFINED";                      // Undefined code with no name
		s.OpComment = 0;
	}

	// Check prefix option
	if ((s.OpcodeDef->Options & 2) && (s.Prefixes[7] & 0x30)) {
		// Put prefix 'v' for VEX-prefixed instruction
		out_file->Put('v');
	}

	// Write opcode name
	if (s.OpComment) {
		// OpName string contains opcode name and comment, separated by ';'
		while (*OpName != ';' && *OpName != 0) {   // Write opcode name until comment
			out_file->Put(*(OpName++));
		}
	}
	else {
		out_file->Put(OpName);                       // Write normal opcode name
	}

	// Check suffix option
	if (s.OpcodeDef->Options & 1) {
		// Append suffix for operand size or type to name
		if ((s.OpcodeDef->AllowedPrefixes & 0x7000) == 0x1000) {
			// F.P. operand size defined by W prefix bit
			i = s.Prefixes[7] & 8;  // W prefix bit
			out_file->Put(i ? 'd' : 's');
		}
		else if ((s.OpcodeDef->AllowedPrefixes & 0x7000) == 0x3000) {
			// Integer or f.p. operand size defined by W prefix bit
			bool f = false;
			// Find out if operands are integer or f.p.
			for (i = 0; i < s.MaxNumOperands; i++) {
				if ((s.Operands[i] & 0xF0) == 0x40) {
					f = true; break;
				}
			}
			i = s.Prefixes[7] & 8;  // W prefix bit
			if (f) {
				out_file->Put(i ? 'd' : 's');  // float precision suffix
			}
			else {            
				out_file->Put(i ? 'q' : 'd');  // integer size suffix
			}
		}
		else if ((s.OpcodeDef->AllowedPrefixes & 0x7000) == 0x4000) {
			// Integer operand size defined by W prefix bit
			i = s.Prefixes[7] & 8;  // W prefix bit
			out_file->Put(i ? 'w' : 'b');
		}
		else if ((s.OpcodeDef->AllowedPrefixes & 0x7000) == 0x5000) {
			// mask register operand size defined by W prefix bit and 66 prefix
			i  = (s.Prefixes[7] & 8) >> 2;      // W prefix bit
			i |= s.Prefixes[5] != 0x66;         // 66 prefix bit
			out_file->Put("bwdq"[i]);
		}
		else if (s.OpcodeDef->AllowedPrefixes & 0xE00) {
			// F.P. operand type and size defined by prefixes
			switch (s.Prefixes[5]) {
				case 0:     // No prefix = ps
					out_file->Put("ps");  break;
				case 0x66:  // 66 prefix = pd
					out_file->Put("pd");  break;
				case 0xF3:  // F3 prefix = ss
					out_file->Put("ss");  break;
				case 0xF2:  // F2 prefix = sd
					out_file->Put("sd");  break;
				default:
					err.submit(9000); // Should not occur
			}
		}
		else if (s.OpcodeDef->AllowedPrefixes & 0x100){
			// Integer operand size defined by prefixes
			// Suffix for operand size
			i = s.OperandSize / 8;
			if (i <= 8) {
				static const char SizeSuffixes[] = " bw d f q"; // Table of suffixes
				out_file->Put(SizeSuffixes[i]);
			}
		}
	}
	// Alternative suffix option
	if (s.OpcodeDef->Options & 0x1000) {
		// Append alternative suffix for vector element size to name
		if ((s.OpcodeDef->AllowedPrefixes & 0x7000) == 0x3000) {
			// Integer operand size defined by W prefix bit
			i = ((s.Prefixes[7] & 8) + 8) * 4;  // W prefix bit -> 8 / 16
			out_file->PutDecimal(i);
		}
		if ((s.OpcodeDef->AllowedPrefixes & 0x7000) == 0x4000) { // 32 / 64
			i = (s.Prefixes[7] & 8) + 8;  // W prefix bit -> 8 / 16
			out_file->PutDecimal(i);
		}
	}

	// Space between opcode name and operands
	//out_file->Put(" "); 
	out_file->Tabulate(AsmTab3);  // Tabulate. At least one space // jjh

	// Loop for all operands to write
	for (i = 0; i < s.MaxNumOperands; i++) {
		if (s.Operands[i] & 0xFFFF) {

			// Write operand i
			if (NumOperands++) {
				// At least one operand before this one. Separate by ", "
				out_file->Put(", ");
			}

			// Write constant and jump operands
			switch (s.Operands[i] & 0xF0) {
				case 0x10: case 0x20: case 0x30: case 0x80:
					WriteImmediateOperand( out_file, s.Operands[i] );
					continue;
			}

			// Write register and memory operands
			uint32 optype = (s.Operands[i] >> 16) & 0x0F;
			switch (optype) {
				case 0:        // Other type of operand
					WriteOtherOperand( out_file, s.Operands[i] );  break;

				case 0x1:  // Direct memory operand
					WriteRMOperand( out_file, s.Operands[i] );  break;

				case 0x2:  // Register operand indicated by last bits of opcode
					WriteShortRegOperand( out_file, s.Operands[i] );  break;

				case 0x3:  // Register or memory operand indicated by mod/rm bits
					WriteRMOperand( out_file, s.Operands[i] );  break;

				case 0x4:  // Register operand indicated by reg bits
					WriteRegOperand( out_file, s.Operands[i] );  break;

				case 0x5:  // Register operand indicated by dest bits of DREX byte
					WriteDREXOperand( out_file, s.Operands[i] );  break;

				case 0x6:  // Register operand indicated by VEX.vvvv bits
					WriteVEXOperand( out_file, s.Operands[i], 0 );  break;

				case 0x7:  // Register operand indicated by bits 4-7 of immediate operand
					WriteVEXOperand( out_file, s.Operands[i], 1 );  break;

				case 0x8:  // Register operand indicated by bits 0-3 of immediate operand
					WriteVEXOperand( out_file, s.Operands[i], 2 );  break; // Unused. For future use
			}
			int isMem = optype == 3 && s.Mod != 3;
			if (s.Prefixes[3] == 0x62) { // EVEX and MVEX prefix can have extra operand attributes
				if (s.Prefixes[6] & 0x20) {                
					WriteOperandAttributeEVEX( out_file, i, isMem );
				}
				else {
					WriteOperandAttributeMVEX( out_file, i, isMem );
				}
			}
			if (s.Prefixes[3] == 0x62 && (i == s.MaxNumOperands - 1 || (s.Operands[i+1] & 0xFFF) < 0x40)) {
				// This is the last SIMD operand
				if (!(s.Operands[4] & 0x80000000)) {
					s.Operands[4] |= 0x80000000;  // Make sure we don't write this twice
					if (s.Prefixes[6] & 0x20) {                
						WriteOperandAttributeEVEX( out_file, 98, isMem );
					}
					else {
						WriteOperandAttributeMVEX( out_file, 98, isMem );
					}
				}
			}
		}
	}
	if (s.Prefixes[3] == 0x62) { // EVEX and MVEX prefix can have extra attributes after operands
		if (s.Prefixes[6] & 0x20) {                
			WriteOperandAttributeEVEX( out_file, 99, 0 );
		}
		else {
			WriteOperandAttributeMVEX( out_file, 99, 0 );
		}
	}
}

void CDisassembler::WriteCodeComment( CTextFileBuffer *out_file )
{
    // Write hex listing of instruction as comment after instruction
    uint32 i;                                     // Index to current byte
    uint32 FieldSize;                             // Number of bytes in field
    const char * Spacer;                          // Space between fields

    out_file->Tabulate(AsmTab4);                    // Tabulate to comment field
    out_file->Put(CommentSeparator);                // Start comment

    // Write address
    if (SectionEnd + SectionAddress + (uint32)ImageBase > 0xFFFF) {
        // Write 32 bit address
        out_file->PutHex(IBegin + SectionAddress + (uint32)ImageBase);
    }
    else {
        // Write 16 bit address
        out_file->PutHex((uint16)(IBegin + SectionAddress));
    }

    // Space after address
    out_file->Put(" _");

    // Start of instruction
    i = IBegin;

    // Write bytes
    while (i < IEnd) {
        FieldSize = 1;                             // Size of field to write
        Spacer = " ";                              // Space between fields

        // Spacer and FieldSize depends on fields
        if (i == s.OpcodeStart1 && i > IBegin) {
            Spacer = ": ";                          // Space between prefixes and opcode
        }
        if (i == s.OpcodeStart2 + 1) {
            Spacer = ". ";                          // Space between opcode and mod/reg/rm bytes
        }
        if (i == s.AddressField && s.AddressFieldSize) {
            Spacer = ", ";                          // Space before address field
            FieldSize = s.AddressFieldSize;
        }
        if (i == s.ImmediateField && s.ImmediateFieldSize) {
            Spacer = ", ";                          // Space before immediate operand field
            FieldSize = s.ImmediateFieldSize;
        }
        // Write space
        out_file->Put(Spacer);

        // Write byte or bytes
        switch (FieldSize) {
        case 1:  // Write single byte
            out_file->PutHex(Get<uint8>(i));
            break;
        case 2:  // Write two bytes
            out_file->PutHex(Get<uint16>(i));
            break;
        case 3:  // Write three bytes (operands for "enter" instruction)
            out_file->PutHex(Get<uint16>(i));
            out_file->Put(", ");
            out_file->PutHex(Get<uint8>(i+2));
            break;
        case 4:  // Write four bytes
            if ((s.Operands[0] & 0xFE) == 0x84) {
                // Far jump/call address
                out_file->PutHex(Get<uint16>(i));
                out_file->Put(" ");
                out_file->PutHex(Get<uint16>(i+2));
            }
            else {
                // Any other 32 bit operand
                out_file->PutHex(Get<uint32>(i));
            }
            break;
        case 6:  // Write six bytes (far jump address)
            out_file->PutHex(Get<uint32>(i));
            out_file->Put(" ");
            out_file->PutHex(Get<uint16>(i+4));
            break;
        case 8:  // Write eight bytes
            out_file->PutHex(Get<uint64>(i));
            break;
        }
        // Search for relocation
        SARelocation rel1;                            // Make relocation records for searching
        rel1.Section = Section;
        rel1.Offset  = i;                             // rel1 marks current field in instruction

        // Is there a relocation source exactly here?
        int32 irel = Relocations.Exists(rel1);        // Finds relocation with source = i

        if (irel > 0) {
            // This field has a relocation. Indicate relocation type
            // 0 = unknown, 1 = direct, 2 = self-relative, 3 = image-relative, 
            // 4 = segment relative, 5 = relative to arbitrary ref. point, 8 = segment address/descriptor
            uint32 RelType = Relocations[irel].Type;
            if (RelType) {
                out_file->Put(Lookup(RelocationTypeNames, RelType));
            }
            if (Relocations[irel].Size > FieldSize) {
                // Relocation has wrong size
                out_file->Put(" Misplaced relocation.");
            }
        }

        // Point to next byte
        i += FieldSize;
    }
    // New line
    out_file->NewLine();
}

void CDisassembler::WriteDataLabel( CTextFileBuffer *out_file, const char * name, uint32 sym, int line ) {
	// Write label before data item, MASM syntax
	// name = name of data item(s)
	// sym  = symbol index
	// line = 1 if label is on separate line, 0 if data follows on same line
	// Write name
	out_file->Put(name);
	// At least one space
	out_file->Put(" ");
	// Tabulate
	out_file->Tabulate(AsmTab1);

	if (line) {
		// Write label and type on seperate line
		// Get size
		uint32 Symsize = Symbols[sym].Size;
		if (Symsize == 0) Symsize = DataSize;
		out_file->Put("label ");
		// Write type
		switch(Symsize) {
			case 1: default:
				out_file->Put("byte");  break;
			case 2:
				out_file->Put("word");  break;
			case 4:
				out_file->Put("dword");  break;
			case 6:
				out_file->Put("fword");  break;
			case 8:
				out_file->Put("qword");  break;
			case 10:
				out_file->Put("tbyte");  break;
			case 16:
				out_file->Put("xmmword");  break;
			case 32:
				out_file->Put("ymmword");  break;
		}
		// Check if jump table or call table
		if (((Symbols[sym].Type+1) & 0xFE) == 0x0C) {
			out_file->Tabulate(AsmTab4);
			out_file->Put(CommentSeparator);
			if (Symbols[sym].DLLName) {
				// DLL import
				out_file->Put("import from ");
				out_file->Put(Symbols.GetDLLName(sym));
			}
			else if (Symbols[sym].Type & 1) {
				out_file->Put("switch/case jump table");
			}
			else {
				out_file->Put("virtual table or function pointer");
			}
		}
		// New line
		out_file->NewLine();
	}
}

void CDisassembler::WriteUninitDataItems( CTextFileBuffer *out_file, uint32 size, uint32 count )
{
	// Write uninitialized (BSS) data, MASM syntax
	// size = size of each data element
	// count = number of data elements on each line

	// Write data definition directive for appropriate size
	switch (size) {
		case 1:
			out_file->Put("db ");  break;
		case 2:
			out_file->Put("dw ");  break;
		case 4:
			out_file->Put("dd ");  break;
		case 6:
			out_file->Put("df ");  break;
		case 8:
			out_file->Put("dq ");  break;
		case 10:
			out_file->Put("dt ");  break;
	}
	out_file->Tabulate(AsmTab2);
	if (count > 1) {
		// Write duplication operator
		out_file->PutDecimal(count);
		out_file->Put(" dup (?)");
	}
	else {
		// DataCount == 1
		out_file->Put("?");
	}
}

void CDisassembler::WriteDataDirective( CTextFileBuffer *out_file, uint32 size )
{
	// Write DB, etc., MASM syntax
	// Write data definition directive for appropriate size
	switch (size) {
		case 1:  out_file->Put("db ");  break;
		case 2:  out_file->Put("dw ");  break;
		case 4:  out_file->Put("dd ");  break;
		case 6:  out_file->Put("df ");  break;
		case 8:  out_file->Put("dq ");  break;
		case 10: out_file->Put("dt ");  break;
		case 16: out_file->Put("xmmword ");  break;
		case 32: out_file->Put("ymmword ");  break;
		default: out_file->Put("Error ");  break;
	}
}

void CDisassembler::WriteDataComment( CTextFileBuffer *out_file, uint32 ElementSize, uint32 LinePos, uint32 Pos, uint32 irel )
{
	// Write comment after data item
	uint32 pos1;                            // Position of data for comment
	uint32 RelType = 0;                     // Relocation type
	char TextBuffer[64];                    // Buffer for writing floating point number

	out_file->Tabulate(AsmTab4);              // Tabulate to comment field
	out_file->Put(CommentSeparator);          // Start comment

	// Write address
	if (SectionEnd + SectionAddress + (uint32)ImageBase > 0xFFFF) {
		// Write 32 bit address
		out_file->PutHex(LinePos + SectionAddress + (uint32)ImageBase);
	}
	else {
		// Write 16 bit address
		out_file->PutHex((uint16)(LinePos + SectionAddress));
	}

	if ((Sections[Section].Type & 0xFF) == 3 || Pos > Sections[Section].InitSize) {
		// Unitialized data. Write no data
		return;
	}

	if (irel && irel < Relocations.GetNumEntries() && Relocations[irel].Offset == LinePos) {
		// Value is relocated, get relocation type
		RelType = Relocations[irel].Type;
	}

	// Space after address
	out_file->Put(" _ ");

	// Comment type depends on ElementSize and DataType
	switch (ElementSize) {
		case 1:
			// Bytes. Write ASCII characters
			for (pos1 = LinePos; pos1 < Pos; pos1++) {
				// Get character
				int8 c = Get<int8>(pos1);
				// Avoid non-printable characters
				if (c < ' ' || c == 0x7F) c = '.';
				// Print ASCII character
				out_file->Put(c);
			}
			break;
		case 2:
			// Words. Write as decimal
			for (pos1 = LinePos; pos1 < Pos; pos1 += 2) {
				if (RelType) {
					out_file->PutHex(Get<uint16>(pos1), 1); // Write as hexadecimal
				}
				else {
					out_file->PutDecimal(Get<int16>(pos1), 1);// Write as signed decimal
				}
				out_file->Put(' ');
			}
			break;
		case 4:
			// Dwords      
			for (pos1 = LinePos; pos1 < Pos; pos1 += 4) {
				if ((DataType & 0x47) == 0x43) {
					// Write as float
					sprintf(TextBuffer, "%.8G", Get<float>(pos1));
					out_file->Put(TextBuffer);
					// Make sure the number has a . or E to indicate a floating point number
					if (!strchr(TextBuffer,'.') && !strchr(TextBuffer,'E')) out_file->Put(".0");
				}
				else if (((DataType + 1) & 0xFF) == 0x0C || RelType) {
					// jump/call address or offset. Write as hexadecimal
					out_file->PutHex(Get<uint32>(pos1));
				}
				else {
					// Other. Write as decimal
					out_file->PutDecimal(Get<int32>(pos1), 1);
				}
				out_file->Put(' ');
			}
			break;                 
		case 8:
			// Qwords
			for (pos1 = LinePos; pos1 < Pos; pos1 += 8) {
				if ((DataType & 0x47) == 0x44) {
					// Write as double
					sprintf(TextBuffer, "%.16G", Get<double>(pos1));
					out_file->Put(TextBuffer);
					// Make sure the number has a . or E to indicate a floating point number
					if (!strchr(TextBuffer,'.') && !strchr(TextBuffer,'E')) out_file->Put(".0");
				}
				else {
					// Write as hexadecimal
					out_file->PutHex(Get<uint64>(pos1));
				}
				out_file->Put(' ');
			}
			break;
		case 10:
			// tbyte. Many compilers do not support long doubles in sprintf. Write as bytes
			for (pos1 = LinePos; pos1 < Pos; pos1++) {
				out_file->PutHex(Get<uint8>(pos1), 1);
			}
			break;
	}
	if (RelType) {
		// Indicate relocation type
		out_file->Put(Lookup(RelocationTypeNames, RelType));
	}
}

void CDisassembler::WriteDataItems( CTextFileBuffer *out_file )
{
	// Write data items to output file

	int LineState;  // 0: Start of new line, write label
	// 1: Label written if any, write data directive
	// 2: Data directive written, write data
	// 3: First data item written, write comma and more data
	// 4: Last data item written, write comment
	// 5: Comment written if any, start new line
	uint32 Pos = IBegin;                          // Current position
	uint32 LinePos = IBegin;                      // Position for beginning of output line
	uint32 BytesPerLine;                          // Number of bytes to write per line
	uint32 LineEnd;                               // Data position for end of line
	uint32 DataEnd;                               // End of data
	uint32 ElementSize, OldElementSize;           // Size of each data element
	uint32 RelOffset;                             // Offset of relocation
	uint32 irel, Oldirel;                         // Relocation index
	int64  Value;                                 // Inline value or addend
	const char * Symname;                         // Symbol name
	int    SeparateLine;                          // Label is on separate line

	SARelocation Rel;                             // Dummy relocation record

	// Check if size is valid
	if (DataSize == 0) DataSize = 1;
	if (DataSize > 32) DataSize = 32;  

	// Expected end position
	if (CodeMode & 3) {
		// Writing data for dubious code. Make same length as code instruction
		DataEnd = IEnd;
	}
	else {
		// Regular data. End at next label
		DataEnd = LabelEnd;
		if (DataEnd > FunctionEnd) DataEnd = FunctionEnd;
		if (DataEnd <= Pos) DataEnd = Pos + DataSize;
		if (DataEnd > Sections[Section].InitSize && Pos < Sections[Section].InitSize) {
			DataEnd = Sections[Section].InitSize;
		}
	}

	// Size of each data element
	ElementSize = DataSize;

	// Check if packed type
	if (DataType & 0xF00) {
		// This is a packed vector type. Get element size
		ElementSize = GetDataElementSize(DataType);
	}

	// Avoid sizes that are not powers of 2
	if (ElementSize == 6 || ElementSize == 10) ElementSize = 2;

	// Set maximum element size to 8
	if (ElementSize > 8)  ElementSize = 8;

	// Set minimum element size to 1
	if (ElementSize < 1)  ElementSize = 1;

	if (Pos + ElementSize > DataEnd) {
		// Make sure we end at DataEnd
		ElementSize = 1;  BytesPerLine = 8;
		LineEnd = DataEnd;
	}

	// Set number of bytes per line
	BytesPerLine = (DataSize == 10) ? 10 : 8;

	if (!(CodeMode & 3)) {
		// Begin new line for each data item (except in code segment)
		out_file->NewLine();
	}
	LineState = 0; irel = 0;

	// Check if alignment required
	if (DataSize >= 16 && (DataType & 0xC00) && (DataType & 0xFF) != 0x51 
			&& (FlagPrevious & 0x100) < (DataSize << 4) && !(IBegin & (DataSize-1))) {
		// Write align directive
		WriteAlign( out_file, DataSize );
		// Remember that data is aligned
		FlagPrevious |= (DataSize << 4);
	}

	// Get symbol name for label
	uint32 sym;                                   // Current symbol index
	uint32 sym1, sym2 = 0;                        // First and last symbol at current address

	sym1 = Symbols.FindByAddress(Section, Pos, &sym2);

	// Loop for one or more symbols at this address
	for (sym = sym1; sym <= sym2; sym++) {

		if (sym && Symbols[sym].Scope && !(Symbols[sym].Scope & 0x100) && !(Symbols[sym].Type & 0x80000000)) {

			// Prepare for writing symbol label
			Symname = Symbols.GetName(sym);         // Symbol name
			// Check if label needs a separate line
			SeparateLine = (ElementSize != DataSize 
					|| Symbols[sym].Size != DataSize 
					|| strlen(Symname) > AsmTab1
					|| sym < sym2 
					// || (Sections[Section].Type & 0xFF) == 3
					|| ((Symbols[sym].Type+1) & 0xFE) == 0x0C);

			// Write symbol label
			WriteDataLabel( out_file, Symname, sym, SeparateLine );
			LineState = 1;                          // Label written
			if (SeparateLine) {
				LineState = 0;
			}
		}
	}

	if ((Sections[Section].Type & 0xFF) == 3 || Pos >= Sections[Section].InitSize) {
		// This is an unitialized data (BSS) section
		// Data repeat count
		uint32 DataCount = (DataEnd - Pos) / ElementSize;
		if (DataCount) {
			out_file->Tabulate(AsmTab1);
			// Write data directives
			WriteUninitDataItems( out_file, ElementSize, DataCount );

			// Write comment
			WriteDataComment( out_file, ElementSize, Pos, Pos, 0 );
			out_file->NewLine();
			LineState = 0;
		}
		// Update data position
		Pos += DataCount * ElementSize;

		if (Pos < DataEnd) {
			// Some odd data remain. Write as bytes
			DataCount = DataEnd - Pos;
			ElementSize = 1;
			out_file->Tabulate(AsmTab1);

			WriteUninitDataItems( out_file, ElementSize, DataCount );
			// Write comment
			WriteDataComment( out_file, ElementSize, Pos, Pos, 0 );
			out_file->NewLine();
			Pos = DataEnd;
			LineState = 0;
		}
	}
	else {
		// Not a BSS section
		// Label has been written, write data

		// Loop for one or more elements
		LinePos = Pos;
		while (Pos < DataEnd) {

			// Find end of line position
			LineEnd = LinePos + BytesPerLine;

			// Remember element size and relocation
			OldElementSize = ElementSize;
			Oldirel = irel;

			// Check if relocation
			Rel.Section = Section;
			Rel.Offset  = Pos;
			uint32 irel = Relocations.FindFirst(Rel);
			if (irel >= Relocations.GetNumEntries() || Relocations[irel].Section != (int32)Section) {
				// No relevant relocation
				irel = 0;
			}
			if (irel) {
				// A relocation is found
				// Check relocation source
				RelOffset = Relocations[irel].Offset;
				if (RelOffset == Pos) {
					// Relocation source is here
					// Make sure the size fits and begin new line
					ElementSize = Relocations[irel].Size;  BytesPerLine = 8;
					if (ElementSize < 1) ElementSize = WordSize / 8;
					if (ElementSize < 1) ElementSize = 4;
					LineEnd = Pos + ElementSize;
					if (LineState > 2) LineState = 4; // Make sure we begin at new line
				}
				else if (RelOffset < Pos + ElementSize) {
					// Relocation source begins before end of element with current ElementSize
					// Change ElementSize to make sure a new element begins at relocation source
					ElementSize = 1;  BytesPerLine = 8;
					LineEnd = RelOffset;
					if (LineState > 2) LineState = 4; // Make sure we begin at new line
					irel = 0;
				}
				else {
					// Relocation is after this element
					irel = 0;
				}
				// Check for overlapping relocations
				if (irel && irel+1 < Relocations.GetNumEntries() 
						&& Relocations[irel+1].Section == (int32)Section
						&& Relocations[irel+1].Offset < RelOffset + ElementSize) {
					// Overlapping relocations
					s.Errors |= 0x2000;
					WriteErrorsAndWarnings( out_file );
					LineEnd = Relocations[irel+1].Offset;
					if (LineState > 2) LineState = 4; // Make sure we begin at new line
				}
				// Drop alignment
				FlagPrevious &= ~0xF00;
			}
			if (irel == 0) {
				// No relocation here
				// Check if DataEnd would be exceeded
				if (Pos + ElementSize > DataEnd) {
					// Make sure we end at DataEnd unless there is a relocation source here
					ElementSize = 1;  BytesPerLine = 8;
					LineEnd = DataEnd;
					if (LineState > 2) LineState = 4; // Make sure we begin at new line
					FlagPrevious &= ~0xF00;           // Drop alignment
				}
			}
			// Check if new line needed
			if (LineState == 4) {
				// Finish this line
				if (!(CodeMode & 3)) {
					WriteDataComment( out_file, OldElementSize, LinePos, Pos, Oldirel );
				}
				// Start new line
				out_file->NewLine();
				LineState = 0;
				LinePos = Pos;
				continue;
			}

			// Tabulate
			out_file->Tabulate(AsmTab1);

			if (LineState < 2) {
				// Write data definition directive for appropriate size
				WriteDataDirective( out_file, ElementSize );
				LineState = 2;
			}
			else if (LineState == 3) {
				// Not the first element, write comma
				out_file->Put(", ");
			}
			// Get inline value
			switch (ElementSize) {
				case 1:  Value = Get<int8>(Pos);  break;
				case 2:  Value = Get<int16>(Pos);  break;
				case 4:  Value = Get<int32>(Pos);  break;
				case 6:  Value = Get<uint32>(Pos) + ((uint64)Get<uint16>(Pos+4) << 32); break;
				case 8:  Value = Get<int64>(Pos);  break;
				case 10: Value = Get<int64>(Pos); break;
				default: Value = 0; // should not occur
			}
			if (irel) {
				// There is a relocation here. Write the name etc.
				WriteRelocationTarget( out_file, irel, 1, Value );
			}
			else {
				// Write value
				switch (ElementSize) {
					case 1:
						out_file->PutHex((uint8)Value, 1);  
						break;
					case 2:
						out_file->PutHex((uint16)Value, 1);  
						break;
					case 4:
						out_file->PutHex((uint32)Value, 1);  
						break;
					case 6:
						out_file->PutHex((uint16)(Value >> 32), 1);  
						out_file->Put(":");
						out_file->PutHex((uint32)Value, 1);  
						break;
					case 8:
						out_file->PutHex((uint64)Value, 1);  
						break;
					case 10:
						out_file->Put("??");
						break;
				}
			}
			LineState = 3;
			// Increment position
			Pos += ElementSize;

			// Check if end of line
			if (Pos >= LineEnd || Pos >= DataEnd) LineState = 4;

			if (LineState == 4) {
				// End of line

				// Finish this line
				if (!(CodeMode & 3)) {
					WriteDataComment( out_file, OldElementSize, LinePos, Pos, Oldirel );
				}

				LineState = 0;
				LinePos = Pos;
				continue;
			}

			// Tabulate
			out_file->Tabulate(AsmTab1);

			if (LineState < 2) {
				// Write data definition directive for appropriate size
				WriteDataDirective( out_file, ElementSize );
				LineState = 2;
			}
			else if (LineState == 3) {
				// Not the first element, write comma
				out_file->Put(", ");
			}
			// Get inline value
			switch (ElementSize) {
				case 1:  Value = Get<int8>(Pos);  break;
				case 2:  Value = Get<int16>(Pos);  break;
				case 4:  Value = Get<int32>(Pos);  break;
				case 6:  Value = Get<uint32>(Pos) + ((uint64)Get<uint16>(Pos+4) << 32); break;
				case 8:  Value = Get<int64>(Pos);  break;
				case 10: Value = Get<int64>(Pos); break;
				default: Value = 0; // should not occur
			}
			if (irel) {
				// There is a relocation here. Write the name etc.
				WriteRelocationTarget( out_file, irel, 1, Value );
			}
			else {
				// Write value
				switch (ElementSize) {
					case 1:
						out_file->PutHex((uint8)Value, 1);  
						break;
					case 2:
						out_file->PutHex((uint16)Value, 1);  
						break;
					case 4:
						out_file->PutHex((uint32)Value, 1);  
						break;
					case 6:
						out_file->PutHex((uint16)(Value >> 32), 1);  
						out_file->Put(":");
						out_file->PutHex((uint32)Value, 1);  
						break;
					case 8:
						out_file->PutHex((uint64)Value, 1);  
						break;
					case 10:
						out_file->Put("??");
						break;
				}
			}
			LineState = 3;
			// Increment position
			Pos += ElementSize;

			// Check if end of line
			if (Pos >= LineEnd || Pos >= DataEnd) LineState = 4;

			if (LineState == 4) {
				// End of line
				if (!(CodeMode & 3)) {
					// Write comment
					WriteDataComment( out_file, ElementSize, LinePos, Pos, irel );
				}
				out_file->NewLine();
				LinePos = Pos;
				LineState = 0;
			}
		}
	}

	// Indicate end
	if (IEnd < Pos) IEnd = Pos;
	if (IEnd > LabelEnd) IEnd = LabelEnd;
	if (IEnd > FunctionEnd && FunctionEnd) IEnd = FunctionEnd;

	// Reset FlagPrevious if not aligned
	if (DataSize < 16 || (DataType & 0xFF) == 0x28) FlagPrevious = 0;
}

void CDisassembler::CountInstructions() {
    // Count total number of instructions defined in opcodes.cpp
    // Two instructions are regarded as the same and counted as one if they 
    // have the same name and differ only in the bits that define register 
    // name, operand size, etc.

    uint32 map;                                   // Map number
    uint32 index;                                 // Index into map
    uint32 n;                                     // Number of instructions with same code
    uint32 iset;                                  // Instruction set
    uint32 instructions = 0;                      // Total number of instructions
    uint32 mmxinstr = 0;                          // Number of MMX instructions
    uint32 sseinstr = 0;                          // Number of SSE instructions
    uint32 sse2instr = 0;                         // Number of SSE2 instructions
    uint32 sse3instr = 0;                         // Number of SSE3 instructions
    uint32 ssse3instr = 0;                        // Number of SSSE3 instructions
    uint32 sse41instr = 0;                        // Number of SSE4.1 instructions
    uint32 sse42instr = 0;                        // Number of SSE4.2 instructions
    uint32 AVXinstr  = 0;                         // Number of AVX instructions
    uint32 FMAinstr  = 0;                         // Number of FMA3 and later instructions
    uint32 AVX2instr  = 0;                        // Number of AVX2 instructions
    uint32 BMIinstr  = 0;                         // Number of BMI instructions and other small instruction sets
    uint32 AVX512instr = 0;                       // Number of AVX-512 instructions
    uint32 MICinstr = 0;                          // Number of MIC instructions
    uint32 AMDinstr = 0;                          // Number of AMD instructions
    uint32 VIAinstr = 0;                          // Number of AMD instructions
    uint32 privilinstr = 0;                       // Number of privileged instructions
    uint32 undocinstr = 0;                        // Number of undocumented instructions
    uint32 droppedinstr = 0;                      // Number of opcodes planned but never implemented
    uint32 VEXdouble = 0;                         // Number of instructions that have both VEX and non-VEX version
    SOpcodeDef const * opcode;                    // Pointer to map entry

    // Loop through all maps
    for (map = 0; map < NumOpcodeTables1; map++) {
        // Loop through each map
        for (index = 0; index < OpcodeTableLength[map]; index++) {
            opcode = OpcodeTables[map] + index;
            if (opcode->InstructionFormat && opcode->Name 
            && !opcode->TableLink && !(opcode->InstructionFormat & 0x8000)) {
                // instruction is defined
                if ((opcode->InstructionFormat & 0xFFF) == 3
                && index > 0 && (opcode-1)->Name 
                && strcmp(opcode->Name, (opcode-1)->Name) == 0) {
                    // Same as previous instruction, just with another register
                    continue;                         // Don't count this
                }
                n = 1;                               // Default = one instruction per map entry
                // Check if we have multiple instructions with different prefixes
                if (opcode->Options & 1) {
                    if (opcode->AllowedPrefixes & 0x3000) {
                        n++;                           // Extra instruction with W prefix bit
                    }
                    else if (opcode->AllowedPrefixes & 0xE00) {               
                        if (opcode->AllowedPrefixes & 0x200) n++; // Extra instruction with 66 prefix
                        if (opcode->AllowedPrefixes & 0x400) n++; // Extra instruction with F3 prefix
                        if (opcode->AllowedPrefixes & 0x800) n++; // Extra instruction with F2 prefix
                    }
                    else if (opcode->AllowedPrefixes & 0x100) {
                        n++;                                      // Extra instruction with 66 prefix
                        if (opcode->AllowedPrefixes & 0x1000) n++;// Extra instruction with L prefix bit
                    }
                }
                if (opcode->Options & 2) VEXdouble += n; // Instructions that have both VEX and non-VEX version
                instructions += n;                   // Count total instructions

                iset = opcode->InstructionSet;       // Instruction set
                if (iset & 0x20000) {
                    droppedinstr += n; iset = 0;      // Opcodes planned but never implemented
                }
                if (iset & 0x800) privilinstr += n;  // Privileged instruction
                if (opcode->InstructionFormat & 0x4000) undocinstr += n; // Undocumented instruction

                switch (iset & 0x37FF) {
                case 7:  // MMX
                    mmxinstr += n;  break;
                case 0x11:  // SSE
                    sseinstr += n;  break;
                case 0x12:  // SSE2
                    sse2instr += n;  break;
                case 0x13: // SSE3
                    sse3instr += n;  break;
                case 0x14: // SSSE3
                    ssse3instr += n;  break;
                case 0x15: // SSE4.1
                    sse41instr += n;  break;
                case 0x16: // SSE4.2
                    sse42instr += n;  break;
                case 0x17: case 0x18: case 0x19: // VEX etc.
                    AVXinstr += n;  break;
                case 0x1A: case 0x1B:            // FMA and later instructions
                    FMAinstr += n;  break;
                case 0x1C:                       // AVX2 instructions
                    AVX2instr += n; break;
                case 0x1D: case 0x1E:            // BMI and other small instruction sets
                    BMIinstr += n; break;
                case 0x20:                       // AVX-512 instructions
                    AVX512instr += n; break;
                case 0x80:                       // MIC instructions
                    MICinstr += n; break;
                case 0x1001: case 0x1002: case 0x1004: case 0x1005: case 0x1006:  // AMD
                    AMDinstr += n;  break;
                case 0x2001: // VIA
                    VIAinstr += n;  break;               
                }
            }
        }
    }

    // output result
    printf("\n\nNumber of instruction opcodes supported by disassembler:\n%5i Total, including:", 
        instructions);
    printf("\n%5i Privileged instructions", privilinstr);
    printf("\n%5i MMX    instructions", mmxinstr);
    printf("\n%5i SSE    instructions", sseinstr);
    printf("\n%5i SSE2   instructions", sse2instr);
    printf("\n%5i SSE3   instructions", sse3instr);
    printf("\n%5i SSSE3  instructions", ssse3instr);
    printf("\n%5i SSE4.1 instructions", sse41instr);
    printf("\n%5i SSE4.2 instructions", sse42instr);
    printf("\n%5i AVX    instructions etc.", AVXinstr);
    printf("\n%5i AVX2   instructions", AVX2instr);
    printf("\n%5i FMA3   instructions", FMAinstr);
    printf("\n%5i BMI/micsellaneous instr.", BMIinstr);
    printf("\n%5i AVX-512 instructions", AVX512instr);
    printf("\n%5i MIC/Xeon Phi instructions", MICinstr);
    printf("\n%5i AMD    instructions", AMDinstr);
    printf("\n%5i VIA    instructions", VIAinstr);   
    printf("\n%5i instructions planned but never implemented in any CPU", droppedinstr);
    printf("\n%5i undocumented or illegal instructions", undocinstr);
    printf("\n%5i instructions have both VEX and non-VEX versions", VEXdouble);
    printf("\n");

#if 0   // temporary test code

    // find entries with 0x2000 prefix code
    printf("\n\nInstructions with operand swap flag:\n");
    // Loop through all maps
    for (map = 0; map < NumOpcodeTables1; map++) {
        // Loop through each map
        for (index = 0; index < OpcodeTableLength[map]; index++) {
            opcode = OpcodeTables[map] + index;
            if ((opcode->AllowedPrefixes & 0x2000) == 0x2000) {
                printf("\n%04X %02X  %s", map, index, opcode->Name);
            }
        }
    }

    /*
    printf("\n\nTables linked by type 0x0E:\n");
    // Loop through all maps
    for (map = 0; map < NumOpcodeTables1; map++) {
        // Loop through each map
        for (index = 0; index < OpcodeTableLength[map]; index++) {
            opcode = OpcodeTables[map] + index;
            if (opcode->TableLink == 0x0E) {
                printf("  0x%02X", opcode->InstructionSet);
            }
        }
    }*/

    printf("\n");

#endif
}
