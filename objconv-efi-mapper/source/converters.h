/****************************  converters.h   ********************************
* Author:        Agner Fog
* Date created:  2006-07-15
* Last modified: 2008-05-25
* Project:       objconv
* Module:        converters.h
* Description:
* Header file for file conversion classes.
*
* Copyright 2006-2008 GNU General Public License http://www.gnu.org/licenses
*****************************************************************************/

/*******************************   Classes   ********************************

This header file declares various classes for interpreting and converting
different types of object files. These classes are all derived from the 
container class CFileBuffer, declared in containers.h.

See containers.h for an explanation of the container classes and the 
operators >> and << which can transfer a data buffer from an object of one
class to an object of another class.

*****************************************************************************/

#ifndef CONVERTERS_H
#define CONVERTERS_H


// Class for deciding what to do with input file
// Its memory buffer contains the input file and later the output file
class CMain : public CFileBuffer {
public:
   CMain();                            // Constructor
   void Go();                          // Do whatever the command line parameters say
};


// Class CConverter is used for converting or dumping a file of any type
class CConverter : public CFileBuffer {
public:
   CConverter();                       // Constructor
   void Go();                          // Do whatever the command line parameters say
protected:
   void DumpCOF();                     // Dump PE/COFF file
   void DumpMACHO();                   // Dump Mach-O file
   void COF2COF();                     // Make changes in PE file
   void COF2ASM();                     // Disassemble PE/COFF file
   void MAC2MAC();                     // Make changes in Mach-O file
   void MAC2ASM();                     // Disassemble Mach-O file
};

// Class for interpreting and dumping PE/COFF files
class CCOFF : public CFileBuffer {
public:
   CCOFF();                                      // Default constructor
   void ParseFile();                             // Parse file buffer
   void Dump(int options);                       // Dump file
   void PrintSymbolTable(int symnum);            // Dump symbol table entries
   void PrintImportExport();                     // Print imported and exported symbols
   static void PrintSegmentCharacteristics(uint32 flags); // Print segment characteristics
   char const * GetSymbolName(int8* Symbol);     // Get symbol name from 8 byte entry
   char const * GetSectionName(int8* Symbol);    // Get section name from 8 byte entry
   const char * GetFileName(SCOFF_SymTableEntry *);    // Get file name from records in symbol table
   const char * GetShortFileName(SCOFF_SymTableEntry*);// Same as above. Strips path before filename
   char const * GetStorageClassName(uint8 sc);   // Get storage class name
   int  GetImageDir(uint32 n, SCOFF_ImageDirAddress * dir); // Find address of image directory for executable files
protected:
   CArrayBuf<SCOFF_SectionHeader> SectionHeaders;// Copy of section headers
   int NSections;                                // Number of sections
   SCOFF_FileHeader * FileHeader;                // File header
   SCOFF_SymTableEntry * SymbolTable;            // Pointer to symbol table (for object files)
   char * StringTable;                           // Pointer to string table (for object files)
   uint32 StringTableSize;                       // Size of string table (for object files)
   int NumberOfSymbols;                          // Number of symbol table entries (for object files)
   uint64 ImageBase;                             // Image base (for executable files)
   SCOFF_OptionalHeader * OptionalHeader;        // Optional header (for executable files)
   SCOFF_IMAGE_DATA_DIRECTORY * pImageDirs;      // Pointer to image directories (for executable files)
   uint32 NumImageDirs;                          // Number of image directories (for executable files)
   uint32 EntryPoint;                            // Entry point (for executable files)
};



// Class for interpreting and dumping Mach-O files. Has templates for 32 and 64 bit version
template <class TMAC_header, class TMAC_segment_command, class TMAC_section, class TMAC_nlist, class MInt>
class CMACHO : public CFileBuffer {
public:
   CMACHO();                                     // Default constructor
   void ParseFile();                             // Parse file buffer
   void Dump(int options);                       // Dump file
protected:
   TMAC_header FileHeader;                       // Copy of file header
   uint64 ImageBase;                             // Image base for executable file
   uint32 SegmentOffset;                         // File offset of segment
   uint32 SegmentSize;                           // Size of segment
   uint32 SectionHeaderOffset;                   // File offset of section headers
   uint32 NumSections;                           // Number of sections
   uint32 SymTabOffset;                          // File offset of symbol table
   uint32 SymTabNumber;                          // Number of entries in symbol table
   uint32 StringTabOffset;                       // File offset of string table
   uint32 StringTabSize;                         // Size of string table
   uint32 ilocalsym;	                            // index to local symbols
   uint32 nlocalsym;	                            // number of local symbols 
   uint32 iextdefsym;	                         // index to public symbols
   uint32 nextdefsym;	                         // number of public symbols 
   uint32 iundefsym;	                            // index to external symbols
   uint32 nundefsym;	                            // number of external symbols
   uint32 IndirectSymTabOffset;                  // file offset to the indirect symbol table
   uint32 IndirectSymTabNumber;                  // number of indirect symbol table entries
};

// class CCOF2ASM handles disassembly of PE/COFF file
class CCOF2ASM : public CCOFF {
public:
   CCOF2ASM();                                   // Constructor
   void Convert();                               // Do the conversion
protected:
   CDisassembler Disasm;                         // Disassembler
   void MakeSectionList();                       // Make Sections list and Relocations list in Disasm
   void MakeSymbolList();                        // Make Symbols list in Disasm
   void MakeDynamicRelocations();                // Make dynamic base relocations for executable files
   void MakeImportList();                        // Make imported symbols for executable files
   void MakeExportList();                        // Make exported symbols for executable files
   void MakeListLabels();                        // Attach names to all image directories
};

// class CMAC2ASM handles disassembly of Mach-O file
template <class TMAC_header, class TMAC_segment_command, class TMAC_section, class TMAC_nlist, class MInt>
class CMAC2ASM : public CMACHO<MACSTRUCTURES> {
public:
   CMAC2ASM();                                   // Constructor
   void Convert();                               // Do the conversion
protected:
   void MakeSectionList();                       // Make Sections list in Disasm
   void MakeSymbolList();                        // Make Symbols list in Disasm
   void MakeRelocations();                       // Make relocation list in Disasm
   void MakeImports();                           // Make symbol entries for imported symbols
   CDisassembler Disasm;                         // Disassembler
   CMemoryBuffer StringBuffer;                   // Buffer for making section names
   CSList<MAC_SECT_WITH_RELOC> RelocationQueue;  // List of relocation tables
   CSList<TMAC_section*> ImportSections;          // List of sections needing extra symbols: import tables, literals, etc.
};

#endif // #ifndef CONVERTERS_H
