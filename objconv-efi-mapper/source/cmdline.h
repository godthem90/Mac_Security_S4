/****************************  cmdline.h   ***********************************
* Author:        Agner Fog
* Date created:  2006-07-25
* Last modified: 2006-07-25
* Project:       objconv
* Module:        cmdline.h
* Description:
* Header file for command line interpreter cmdline.cpp
*
* Copyright 2006-2008 GNU General Public License http://www.gnu.org/licenses
*****************************************************************************/
#ifndef CMDLINE_H
#define CMDLINE_H

/**************************  Define constants  ******************************/
// Max number of response files on command line
#define MAX_COMMAND_FILES  10

// Constants for output file type
#define CMDL_OUTPUT_DUMP          0x80       // No output file, just dump contents
#define CMDL_OUTPUT_PE     FILETYPE_COFF     // MS-COFF/PE file
#define CMDL_OUTPUT_MACHO  FILETYPE_MACHO_LE // Mach-O file, little endian
#define CMDL_OUTPUT_MASM   FILETYPE_ASM      // Disassembly

// Constants for subtypes
#define SUBTYPE_MASM                 0       // Disassembly MASM/TASM
#define SUBTYPE_YASM                 1       // Disassembly NASM/YASM
#define SUBTYPE_GASM                 2       // Disassembly GAS(Intel)

// Constants for dump options
#define DUMP_NONE               0x0000     // Dump nothing
#define DUMP_FILEHDR            0x0001     // Dump file header
#define DUMP_SECTHDR            0x0002     // Dump section headers
#define DUMP_SYMTAB             0x0010     // Dump symbol table
#define DUMP_RELTAB             0x0020     // Dump relocation table
#define DUMP_STRINGTB           0x0040     // Dump string table
#define DUMP_COMMENT            0x0080     // Dump comment records

// Constants for file input/output options
#define CMDL_FILE_INPUT              1     // Input file required
#define CMDL_FILE_IN_IF_EXISTS       2     // Read input file if it exists
#define CMDL_FILE_OUTPUT          0x10     // Write output file required
#define CMDL_FILE_IN_OUT_SAME     0x20     // Input and output files may have the same name

#define MAXSYMBOLLENGTH           1024     // Maximum length of symbols for changing underscore or dot

// Class for interpreting command line
class CCommandLineInterpreter {
public:
   CCommandLineInterpreter();                // Default constructor
   ~CCommandLineInterpreter();               // Destructor
   void ReadCommandLine(int argc, char * argv[]);     // Read and interpret command line
   char * InputFile;                         // Input file name
   char * OutputFile;                        // Output file name
   int	  OutputType;
   int	  SubType;
   int    DesiredWordSize;                   // Desired word size for output file
   uint32 DumpOptions;                       // Options for dumping file
   uint32 FileOptions;                       // Options for input and output files
   int    ShowHelp;                          // Help screen printed
protected:
   int	SpecifiedOption;
   void ReadCommandItem(char *);             // Read one option from command line
   void ReadCommandFile(char *);             // Read commands from file
   void InterpretFileName(char *);           // Interpret input or output filename from command line
   void InterpretCommandOption(char *);      // Interpret one option from command line
   void InterpretOutputTypeOption(char *);   // Interpret output type option from command line
   void InterpretDumpOption(char *);         // Interpret dump option from command line
   void Help();                              // Print help message
};

extern CCommandLineInterpreter cmd;          // Command line interpreter

#endif // #ifndef CMDLINE_H
