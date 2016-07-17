/****************************  cmdline.cpp  **********************************
* Author:        Agner Fog
* Date created:  2006-07-25
* Last modified: 2015-09-11
* Project:       objconv
* Module:        cmdline.cpp
* Description:
* This module is for interpretation of command line options
* Also contains symbol change function
*
* Copyright 2006-2015 GNU General Public License http://www.gnu.org/licenses
*****************************************************************************/

#include "stdafx.h"

// List of recognized output file type options
static SIntTxt TypeOptionNames[] = {
    {CMDL_OUTPUT_PE,    "pe"},
    {CMDL_OUTPUT_PE,    "coff"},
    {CMDL_OUTPUT_PE,    "cof"},
    {CMDL_OUTPUT_PE,    "win"},
    {CMDL_OUTPUT_MACHO, "mac"},
    {CMDL_OUTPUT_MACHO, "macho"},
    {CMDL_OUTPUT_MACHO, "mach-o"},
    {CMDL_OUTPUT_MACHO, "mach"},
    {CMDL_OUTPUT_MASM,  "asm"},
    {CMDL_OUTPUT_MASM,  "masm"},
    {CMDL_OUTPUT_MASM,  "tasm"},
    {CMDL_OUTPUT_MASM,  "nasm"},
    {CMDL_OUTPUT_MASM,  "yasm"},
    {CMDL_OUTPUT_MASM,  "gasm"},
    {CMDL_OUTPUT_MASM,  "gas"}
};

// List of subtype names
static SIntTxt SubtypeNames[] = {
    {SUBTYPE_MASM,  "asm"},
    {SUBTYPE_MASM,  "masm"},
    {SUBTYPE_MASM,  "tasm"},
    {SUBTYPE_YASM,  "nasm"},
    {SUBTYPE_YASM,  "yasm"},
    {SUBTYPE_GASM,  "gasm"},
    {SUBTYPE_GASM,  "gas"}
};

// List of standard names that are always translated
const uint32 MaxType = FILETYPE_MACHO_LE;

// Standard names in 32-bit mode
const char * StandardNames32[][MaxType+1] = {
    //  0,    COFF,          OMF,           ELF,                MACHO
    {0,"___ImageBase","___ImageBase","__executable_start","__mh_execute_header"}
};

// Standard names in 64-bit mode
// COFF removes an underscore in 32-bit. There is no 64-bit OMF 
const char * StandardNames64[][MaxType+1] = {
    //  0,    COFF,       OMF,         ELF,                MACHO
    {0,"__ImageBase",  "",    "__executable_start","__mh_execute_header"}
};

const int NumStandardNames = sizeof(StandardNames32) / sizeof(StandardNames32[0]);


// Command line interpreter
CCommandLineInterpreter cmd;                  // Instantiate command line interpreter

CCommandLineInterpreter::CCommandLineInterpreter() {
    // Default constructor
    memset(this, 0, sizeof(*this));            // Set all to zero
    DumpOptions    = DUMP_NONE;                // Dump options
}


CCommandLineInterpreter::~CCommandLineInterpreter() { // Destructor
}


void CCommandLineInterpreter::ReadCommandLine(int argc, char * argv[]) {

	// Read command line
	for (int i = 1; i < argc; i++) {
		ReadCommandItem(argv[i]);
	}
	if (ShowHelp || (InputFile == 0 && OutputFile == 0) /* || !OutputType */) {
		// No useful command found. Print help
		Help();  ShowHelp = 1;
		return;
	}
	if(InputFile && OutputFile && !SpecifiedOption)
	{	
		DumpOptions |= DUMP_FILEHDR;
		DumpOptions |= DUMP_SECTHDR;
		/*DumpOptions |= DUMP_SYMTAB;
		DumpOptions |= DUMP_RELTAB;
		DumpOptions |= DUMP_STRINGTB;
		DumpOptions |= DUMP_COMMENT;*/

		OutputType = CMDL_OUTPUT_MASM;
		SubType = SUBTYPE_YASM;
	}
	// Output file required
	FileOptions |= CMDL_FILE_OUTPUT;
}


void CCommandLineInterpreter::ReadCommandItem(char * string) {
    // Read one option from command line
    // Skip leading whitespace
    while (*string != 0 && *string <= ' ') string++;
    if (*string == 0) return;  // Empty string

    // Look for option prefix and response file prefix
    const char OptionPrefix1 = '-';  // Option must begin with '-'
    if (*string == OptionPrefix1) {
        // Option prefix found. This is a command line option
		SpecifiedOption = 1;
        InterpretCommandOption(string+1);
    }
    else {
        // No prefix found. This is an input or output file name
        InterpretFileName(string);
    }
}


void CCommandLineInterpreter::InterpretFileName(char * string) {
    // Interpret input or output filename from command line

    if (!InputFile) {
        // Input file not specified yet
        InputFile = string;
    }
    else if (!OutputFile) {
        // Output file not specified yet
        OutputFile = string;
    }
    else {
        // Both input and output files already specified
        err.submit(2001);
    }
}

void CCommandLineInterpreter::InterpretCommandOption(char * string) {
    // Interpret one option from command line
    if (*string <= ' ') {
        err.submit(1001); return;    // Warning: empty option
    }

    // Detect option type
    switch(string[0]) {
    case 'f': case 'F':   // output file format
        InterpretOutputTypeOption(string+1);  break;

    case 'd': case 'D':   // dump option
        InterpretDumpOption(string+1);  break;
        // Debug info option
        //InterpretDebugInfoOption(string+1);  break;

    case 'h': case 'H': case '?':  // Help
        ShowHelp = 1;  break;

    default:    // Unknown option
        err.submit(1002, string);
    }
}

void CCommandLineInterpreter::InterpretOutputTypeOption(char * string) {
    // Interpret output file format option from command line

    int opt;
    for (opt = 0; opt < TableSize(TypeOptionNames); opt++) {
        int len = (int)strlen(TypeOptionNames[opt].b);
        if (strncmp(string, TypeOptionNames[opt].b, len) == 0) {
            // Match found
            if (OutputType)  err.submit(2003, string);  // More than one output type specified
            if (DumpOptions) err.submit(2007);          // Both dump and convert specified

            // Save desired output type
            OutputType = TypeOptionNames[opt].a;

            // Check if name is followed by a word size
            int wordsize = 0;
            if (string[len]) wordsize = atoi(string+len);
            switch (wordsize) {
            case 0:  // No word size specified
                break;

            case 32: case 64:  // Valid word size
                DesiredWordSize = wordsize;
                break;

            default:  // Illegal word size
                err.submit(2002, wordsize);
            }
            break;   // Finished searching
        }
    }

    // Check if found
    if (opt >= TableSize(TypeOptionNames)) err.submit(2004, string-1);

    if (OutputType == CMDL_OUTPUT_MASM) {
        // Get subtype
        for (opt = 0; opt < TableSize(SubtypeNames); opt++) {
            int len = (int)strlen(SubtypeNames[opt].b);
            if (strncmp(string, SubtypeNames[opt].b, len) == 0) {
                // Match found
                SubType = SubtypeNames[opt].a;  break;
            }
        }
    }
}


void CCommandLineInterpreter::InterpretDumpOption(char * string) {
    // Interpret dump option from command line
    if (OutputType || DumpOptions) err.submit(2007);          // Both dump and convert specified

	/*
    char * s1 = string;
    while (*s1) {
        switch (*(s1++)) {
        case 'f': case 'F':  // dump file header
            DumpOptions |= DUMP_FILEHDR;  break;
        case 'h': case 'H':  // dump section headers
            DumpOptions |= DUMP_SECTHDR;  break;
        case 's': case 'S':  // dump symbol table
            DumpOptions |= DUMP_SYMTAB;  break;
        case 'r': case 'R':  // dump relocations
            DumpOptions |= DUMP_RELTAB;  break;
        case 'n': case 'N':  // dump string table
            DumpOptions |= DUMP_STRINGTB;  break;
        case 'c': case 'C':  // dump comment records (currently only for OMF)
            DumpOptions |= DUMP_COMMENT;  break;         
        default:
            err.submit(2004, string-1);  // Unknown option
        }
    }	
	*/

	if (DumpOptions == 0)	
	{
		DumpOptions |= DUMP_FILEHDR;
		DumpOptions |= DUMP_SECTHDR;
		DumpOptions |= DUMP_SYMTAB;
		DumpOptions |= DUMP_RELTAB;
		DumpOptions |= DUMP_STRINGTB;
		DumpOptions |= DUMP_COMMENT;
	}
}


void CCommandLineInterpreter::Help() {
    // Print help message
    printf("\n\nUsage: objconv [options] inputfile outputfile");
    printf("\n\nOptions:");
    printf("\n-fXXX[SS]  Output file format XXX, word size SS. Supported formats:");
    printf("\n           PE, COFF, ELF, OMF, MACHO\n");
    printf("\n-fasm      Disassemble file (-fmasm, -fnasm, -fyasm, -fgasm)\n");
    printf("\n-dXXX      Dump file contents to console.");
    printf("\n           Values of XXX (can be combined):");
    printf("\n           f: File header, h: section Headers, s: Symbol table,");
    printf("\n           r: Relocation table, n: string table.\n");

}
