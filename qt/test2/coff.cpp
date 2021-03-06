/****************************   coff.cpp   ***********************************
* Author:        Agner Fog
* Date created:  2006-07-15
* Last modified: 2009-01-22
* Project:       objconv
* Module:        coff.cpp
* Description:
* Module for reading PE/COFF files
*
* Class COFFParser is used for reading, interpreting and dumping PE/COFF files.
*
* Copyright 2006-2009 GNU General Public License http://www.gnu.org/licenses
*****************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "parser.h"
#include "coff.h"

// Relocation type names

SIntTxt COFF32RelNames[] = {
   {COFF32_RELOC_ABS,     "Absolute"},         // Ignored
   {COFF32_RELOC_DIR32,   "Direct32"},         // 32-bit absolute virtual address
   {COFF32_RELOC_IMGREL,  "Image relative"},   // 32-bit image relative virtual address
   {COFF32_RELOC_SECTION, "Section16"},        // 16-bit section index in file
   {COFF32_RELOC_SECREL,  "Section relative"}, // 32-bit section-relative
   {COFF32_RELOC_SECREL7, "7 bit section relative"}, // 7-bit section-relative
   {COFF32_RELOC_TOKEN,   "CLR token"},        // CLR token
   {COFF32_RELOC_REL32,   "EIP relative"}      // 32-bit relative to end of address field
};

SIntTxt COFF64RelNames[] = {
   {COFF64_RELOC_ABS,     "Ignore"},           // Ignored
   {COFF64_RELOC_ABS64,   "64 bit absolute"},  // 64 bit absolute virtual address
   {COFF64_RELOC_ABS32,   "32 bit absolute"},  // 32 bit absolute virtual address
   {COFF64_RELOC_IMGREL,  "Image relative"},   // 32 bit image-relative
   {COFF64_RELOC_REL32,   "RIP relative"},     // 32 bit, RIP-relative
   {COFF64_RELOC_REL32_1, "RIP relative-1"},   // 32 bit, relative to RIP - 1. For instruction with immediate byte operand
   {COFF64_RELOC_REL32_2, "RIP relative-2"},   // 32 bit, relative to RIP - 2. For instruction with immediate word operand
   {COFF64_RELOC_REL32_3, "RIP relative-3"},   // 32 bit, relative to RIP - 3. Useless 
   {COFF64_RELOC_REL32_4, "RIP relative-4"},   // 32 bit, relative to RIP - 4. For instruction with immediate dword operand
   {COFF64_RELOC_REL32_5, "RIP relative-5"},   // 32 bit, relative to RIP - 5. Useless
   {COFF32_RELOC_SECTION, "Section index"},    // 16-bit section index in file
   {COFF64_RELOC_SECREL,  "Section relative"}, // 32-bit section-relative
   {COFF64_RELOC_SECREL7, "7 bit section rel"},//  7-bit section-relative
   {COFF64_RELOC_TOKEN,   "CLR token"},        // 64 bit absolute virtual address without inline addend
   {COFF64_RELOC_SREL32,  "32b span dependent"},        // 
   {COFF64_RELOC_PAIR,    "pair after span dependent"}, // 
   {COFF64_RELOC_PPC_REFHI,"high 16 of 32 bit abs"},    // 
   {COFF64_RELOC_PPC_REFLO,"low 16 of 32 bit abs"},     // 
   {COFF64_RELOC_PPC_PAIR, "pair after high 16"},       // 
   {COFF64_RELOC_PPC_SECRELO,"low 16 of 32 bit section relative"},
   {COFF64_RELOC_PPC_GPREL,  "16 bit GP relative"},     // 
   {COFF64_RELOC_PPC_TOKEN,  "CLR token"}               // 
};

// Machine names

SIntTxt COFFMachineNames[] = {
   {0,     "Any/unknown"},     // Any machine/unknown
   {0x184, "Alpha"},           // Alpha AXP
   {0x1C0, "Arm"},             // Arm
   {0x284, "Alpha 64 bit"},    // Alpha AXP 64 bit
   {0x14C, "I386"},            // x86, 32 bit
   {0x200, "IA64"},            // Intel Itanium
   {0x268, "Motorola68000"},   // Motorola 68000 series
   {0x266, "MIPS16"},  
   {0x366, "MIPSwFPU"},
   {0x466, "MIPS16wFPU"},
   {0x1F0, "PowerPC"},
   {0x1F1, "PowerPC"},
   {0x162, "R3000"},
   {0x166, "R4000MIPS"},
   {0x168, "R10000"},
   {0x1A2, "SH3"},
   {0x1A6, "SH4"},
   {0x1C2, "Thumb"},
   {0x8664, "x86-64"}      // x86-64 / AMD64 / Intel EM64T
};

// Storage class names
SIntTxt COFFStorageClassNames[] = {
   {COFF_CLASS_END_OF_FUNCTION, "EndOfFunc"},
   {COFF_CLASS_AUTOMATIC, "AutoVariable"},
   {COFF_CLASS_EXTERNAL, "External/Public"},
   {COFF_CLASS_STATIC, "Static/Nonpublic"},
   {COFF_CLASS_REGISTER, "Register"},
   {COFF_CLASS_EXTERNAL_DEF, "ExternalDef"},
   {COFF_CLASS_LABEL, "Label"},
   {COFF_CLASS_UNDEFINED_LABEL, "UndefLabel"},
   {COFF_CLASS_MEMBER_OF_STRUCTURE, "StructMem"},
   {COFF_CLASS_ARGUMENT, "FuncArgument"},
   {COFF_CLASS_STRUCTURE_TAG, "StructTag"},
   {COFF_CLASS_MEMBER_OF_UNION, "UnionMember"},
   {COFF_CLASS_UNION_TAG, "UnionTag"},
   {COFF_CLASS_TYPE_DEFINITION, "TypeDef"},
   {COFF_CLASS_UNDEFINED_STATIC, "UndefStatic"},
   {COFF_CLASS_ENUM_TAG, "EnumTag"},
   {COFF_CLASS_MEMBER_OF_ENUM, "EnumMem"},
   {COFF_CLASS_REGISTER_PARAM, "RegisterParameter"},
   {COFF_CLASS_BIT_FIELD, "BitField"},
   {COFF_CLASS_AUTO_ARGUMENT, "AutoArgument"},
   {COFF_CLASS_LASTENTRY, "DummyLastEntry"},
   {COFF_CLASS_BLOCK, "bb/eb_block"},
   {COFF_CLASS_FUNCTION, "Function_bf/ef"},
   {COFF_CLASS_END_OF_STRUCT, "EndOfStruct"},
   {COFF_CLASS_FILE, "FileName"},
   {COFF_CLASS_LINE, "LineNumber"},
   {COFF_CLASS_SECTION, "SectionLineNumber"},
   {COFF_CLASS_ALIAS, "Alias"},
   {COFF_CLASS_WEAK_EXTERNAL, "WeakExternal"},
   {COFF_CLASS_HIDDEN, "Hidden"}
};

// Names of section characteristics
SIntTxt COFFSectionFlagNames[] = {
   {PE_SCN_CNT_CODE,        "Text"},
   {PE_SCN_CNT_INIT_DATA,   "Data"},
   {PE_SCN_CNT_UNINIT_DATA, "BSS"},
   {PE_SCN_LNK_INFO,        "Comments"},
   {PE_SCN_LNK_REMOVE,      "Remove"},
   {PE_SCN_LNK_COMDAT,      "Comdat"},
/* {PE_SCN_ALIGN_1,         "Align by 1"},
   {PE_SCN_ALIGN_2,         "Align by 2"},
   {PE_SCN_ALIGN_4,         "Align by 4"},
   {PE_SCN_ALIGN_8,         "Align by 8"},
   {PE_SCN_ALIGN_16,        "Align by 16"},
   {PE_SCN_ALIGN_32,        "Align by 32"},
   {PE_SCN_ALIGN_64,        "Align by 64"},
   {PE_SCN_ALIGN_128,       "Align by 128"},
   {PE_SCN_ALIGN_256,       "Align by 256"},
   {PE_SCN_ALIGN_512,       "Align by 512"},
   {PE_SCN_ALIGN_1024,      "Align by 1024"},
   {PE_SCN_ALIGN_2048,      "Align by 2048"},
   {PE_SCN_ALIGN_4096,      "Align by 4096"},
   {PE_SCN_ALIGN_8192,      "Align by 8192"}, */
   {PE_SCN_LNK_NRELOC_OVFL, "extended relocations"},
   {PE_SCN_MEM_DISCARDABLE, "Discardable"},
   {PE_SCN_MEM_NOT_CACHED,  "Cannot be cached"},
   {PE_SCN_MEM_NOT_PAGED,   "Not pageable"},
   {PE_SCN_MEM_SHARED,      "Can be shared"},
   {PE_SCN_MEM_EXECUTE,     "Executable"},
   {PE_SCN_MEM_READ,        "Readable"},
   {PE_SCN_MEM_WRITE,       "Writeable"}
};

// Names of image data directories in optional header
SIntTxt COFFImageDirNames[] = {
   {0,   "Export_table"},
   {1,   "Import_table"},
   {2,   "Resource_table"},
   {3,   "Exception_table"},
   {4,   "Certificate_table"},
   {5,   "Base_relocation_table"},
   {6,   "Debug_table"},
   {7,   "Architecture_table"},
   {8,   "Global_pointer"},
   {9,   "Thread_local_storage_table"},
   {10,  "Load_configuration_table"},
   {11,  "Bound_import_table"},
   {12,  "Import_address_table"},
   {13,  "Delay_import_descriptor"},
   {14,  "Common_language_runtime_header"},
   {15,  "Reserved_table"}
};

// Class COFFParser members:
// Constructor
COFFParser::COFFParser() {
   // TODO memset except COF2ASM member
   //memset(this, 0, sizeof(*this));
}

int COFFParser::ParseFile(CDisassembler *Disasm){
   // Load and parse file buffer
   // Get offset to file header
   uint32_t FileHeaderOffset = 0;
   if ((Get<uint16_t>(0) & 0xFFF9) == 0x5A49) {
      // File has DOS stub
      uint32_t Signature = Get<uint32_t>(0x3C);
      if (Signature + 8 < DataSize && Get<uint16_t>(Signature) == 0x4550) {
         // Executable PE file
         FileHeaderOffset = Signature + 4;
      }
      else {
         err.submit(9000);
         return -1;
      }
   }
   // Find file header
   FileHeader = &Get<SCOFF_FileHeader>(FileHeaderOffset);
   NSections = FileHeader->NumberOfSections;

   // Find optional header if executable file
   if (FileHeader->SizeOfOptionalHeader && FileHeaderOffset) {
      OptionalHeader = &Get<SCOFF_OptionalHeader>(FileHeaderOffset + sizeof(SCOFF_FileHeader));
      // Find image data directories
      if (OptionalHeader) {
         if (OptionalHeader->h64.Magic == COFF_Magic_PE64) {
            // 64 bit version
            pImageDirs = &(OptionalHeader->h64.ExportTable);
            NumImageDirs = OptionalHeader->h64.NumberOfRvaAndSizes;
            EntryPoint = OptionalHeader->h64.AddressOfEntryPoint;
            ImageBase = OptionalHeader->h64.ImageBase;
         }
         else {
            // 32 bit version
            pImageDirs = &(OptionalHeader->h32.ExportTable);
            NumImageDirs = OptionalHeader->h32.NumberOfRvaAndSizes;
            EntryPoint = OptionalHeader->h32.AddressOfEntryPoint;
            ImageBase = OptionalHeader->h32.ImageBase;
         }
      }
   }

   // Allocate buffer for section headers
   SectionHeaders.SetNum(NSections);
   SectionHeaders.SetZero();

   // Find section headers
   uint32_t SectionOffset = FileHeaderOffset + sizeof(SCOFF_FileHeader) + FileHeader->SizeOfOptionalHeader;
   for (int i = 0; i < NSections; i++) {
      SectionHeaders[i] = Get<SCOFF_SectionHeader>(SectionOffset);
      SectionOffset += sizeof(SCOFF_SectionHeader);
      // Check for _ILDATA section
      if (strcmp(SectionHeaders[i].Name, "_ILDATA") == 0) {
         // This is an intermediate file for Intel compiler
         err.submit(2114);
      }
   }
   if (SectionOffset > GetDataSize()) {
      err.submit(2110);  return -1;             // Section table points to outside file
   }
   // Find symbol table
   SymbolTable = &Get<SCOFF_SymTableEntry>(FileHeader->PSymbolTable);
   NumberOfSymbols = FileHeader->NumberOfSymbols;

   // Find string table
   StringTable = (Buf() + FileHeader->PSymbolTable + NumberOfSymbols * SIZE_SCOFF_SymTableEntry);
   StringTableSize = *(int*)StringTable; // First 4 bytes of string table contains its size

   if (ImageBase) Disasm->Init(2, ImageBase);     // Executable file or DLL. Set image base
   Disasm->SetOutType(OutSubType);
   MakeSectionList(Disasm);                            // Make Sections list and Relocations list in Disasm
   MakeSymbolList(Disasm);                             // Make Symbols list in Disasm
   if (ImageBase) {
      // Executable file
      MakeDynamicRelocations(Disasm);                  // Make dynamic base relocations for executable files
      MakeImportList(Disasm);                          // Make imported symbols for executable files
      MakeExportList(Disasm);                          // Make exported symbols for executable files
      MakeListLabels(Disasm);                          // Put labels on all image directory tables
   }
   Disasm->EntryAddr = EntryPoint;
   Disasm->Go();                                  // Disassemble

   return 0;
}

// Debug dump
void COFFParser::Dump(int options) {
   uint32_t i, j;

   if (options & DUMP_FILEHDR) {
      // File header
      printf("\nDump of PE/COFF file %s", FileName);
      printf("\n-----------------------------------------------");
      printf("\nFile size: %i", GetDataSize());
      printf("\nFile header:");
      printf("\nMachine: %s", Lookup(COFFMachineNames,FileHeader->Machine));
      printf("\nTimeDate: 0x%08X", FileHeader->TimeDateStamp);
      printf(" - %s", timestring(FileHeader->TimeDateStamp));
      printf("\nNumber of sections: %2i", FileHeader->NumberOfSections);
      printf("\nNumber of symbols:  %2i", FileHeader->NumberOfSymbols);
      printf("\nOptional header size: %i", FileHeader->SizeOfOptionalHeader);
      printf("\nFlags: 0x%04X", FileHeader->Flags);

      // May be removed:
      printf("\nSymbol table offset: 0x%X", FileHeader->PSymbolTable);
      printf("\nString table offset: 0x%X", FileHeader->PSymbolTable + FileHeader->NumberOfSymbols * SIZE_SCOFF_SymTableEntry);
      printf("\nSection headers offset: 0x%X", (uint32_t)sizeof(SCOFF_FileHeader) + FileHeader->SizeOfOptionalHeader);

      // Optional header
      if (OptionalHeader) {
         printf("\n\nOptional header:");
         if (OptionalHeader->h32.Magic != COFF_Magic_PE64) {
            // 32 bit optional header
            printf("\nMagic number: 0x%X", OptionalHeader->h32.Magic);
            printf("\nSize of code: 0x%X", OptionalHeader->h32.SizeOfCode);
            printf("\nSize of uninitialized data: 0x%X", OptionalHeader->h32.SizeOfInitializedData);
            printf("\nAddress of entry point: 0x%X", OptionalHeader->h32.AddressOfEntryPoint);
            printf("\nBase of code: 0x%X", OptionalHeader->h32.BaseOfCode);
            printf("\nBase of data: 0x%X", OptionalHeader->h32.BaseOfData);
            printf("\nImage base: 0x%X", OptionalHeader->h32.ImageBase);
            printf("\nSection alignment: 0x%X", OptionalHeader->h32.SectionAlignment);
            printf("\nFile alignment: 0x%X", OptionalHeader->h32.FileAlignment);
            printf("\nSize of image: 0x%X", OptionalHeader->h32.SizeOfImage);
            printf("\nSize of headers: 0x%X", OptionalHeader->h32.SizeOfHeaders);
            printf("\nDll characteristics: 0x%X", OptionalHeader->h32.DllCharacteristics);
            printf("\nSize of stack reserve: 0x%X", OptionalHeader->h32.SizeOfStackReserve);
            printf("\nSize of stack commit: 0x%X", OptionalHeader->h32.SizeOfStackCommit);
            printf("\nSize of heap reserve: 0x%X", OptionalHeader->h32.SizeOfHeapReserve);
            printf("\nSize of heap commit: 0x%X", OptionalHeader->h32.SizeOfHeapCommit);
         }
         else {
            // 64 bit optional header
            printf("\nMagic number: 0x%X", OptionalHeader->h64.Magic);
            printf("\nSize of code: 0x%X", OptionalHeader->h64.SizeOfCode);
            printf("\nSize of uninitialized data: 0x%X", OptionalHeader->h64.SizeOfInitializedData);
            printf("\nAddress of entry point: 0x%X", OptionalHeader->h64.AddressOfEntryPoint);
            printf("\nBase of code: 0x%X", OptionalHeader->h64.BaseOfCode);
            printf("\nImage base: 0x%08X%08X", HighDWord(OptionalHeader->h64.ImageBase), uint32_t(OptionalHeader->h64.ImageBase));
            printf("\nSection alignment: 0x%X", OptionalHeader->h64.SectionAlignment);
            printf("\nFile alignment: 0x%X", OptionalHeader->h64.FileAlignment);
            printf("\nSize of image: 0x%X", OptionalHeader->h64.SizeOfImage);
            printf("\nSize of headers: 0x%X", OptionalHeader->h64.SizeOfHeaders);
            printf("\nDll characteristics: 0x%X", OptionalHeader->h64.DllCharacteristics);
            printf("\nSize of stack reserve: 0x%08X%08X", HighDWord(OptionalHeader->h64.SizeOfStackReserve), uint32_t(OptionalHeader->h64.SizeOfStackReserve));
            printf("\nSize of stack commit: 0x%08X%08X", HighDWord(OptionalHeader->h64.SizeOfStackCommit), uint32_t(OptionalHeader->h64.SizeOfStackCommit));
            printf("\nSize of heap reserve: 0x%08X%08X", HighDWord(OptionalHeader->h64.SizeOfHeapReserve), uint32_t(OptionalHeader->h64.SizeOfHeapReserve));
            printf("\nSize of heap commit: 0x%08X%08X", HighDWord(OptionalHeader->h64.SizeOfHeapCommit), uint32_t(OptionalHeader->h64.SizeOfHeapCommit));
         }
         // Data directories
         SCOFF_ImageDirAddress dir;

         for (i = 0; i < NumImageDirs; i++) {
            if (GetImageDir(i, &dir)) {
               printf("\nDirectory %2i, %s:\n  Address 0x%04X, Size 0x%04X, Section %i, Offset 0x%04X", 
                  i, dir.Name,
                  dir.VirtualAddress, dir.Size, dir.Section, dir.SectionOffset);
            }
         }
      }
   }

   if ((options & DUMP_STRINGTB) && FileHeader->PSymbolTable && StringTableSize > 4) {
      // String table
      char * p = StringTable + 4;
      uint32_t nread = 4, len;
      printf("\n\nString table:");
      while (nread < StringTableSize) {
         len = (int)strlen(p);
         if (len > 0) {
            printf("\n>>%s<<", p);
            nread += len + 1;
            p += len + 1;
         }
      }
   }
   // Symbol tables
   if (options & DUMP_SYMTAB) {
      // Symbol table (object file)
      if (NumberOfSymbols) PrintSymbolTable(-1);

      // Import and export tables (executable file)
      if (OptionalHeader) PrintImportExport();
   }

   // Section headers
   if (options & (DUMP_SECTHDR | DUMP_SYMTAB | DUMP_RELTAB)) {
      for (j = 0; j < (uint32_t)NSections; j++) {
         SCOFF_SectionHeader * SectionHeader = &SectionHeaders[j];
         printf("\n\n%2i Section %s", j+1, GetSectionName(SectionHeader->Name));

         //printf("\nFile offset of header: 0x%X", (int)((char*)SectionHeader-buffer));
         printf("\nVirtual size: 0x%X", SectionHeader->VirtualSize);
         if (SectionHeader->VirtualAddress) {
            printf("\nVirtual address: 0x%X", SectionHeader->VirtualAddress);}
         if (SectionHeader->PRawData || SectionHeader->SizeOfRawData) {
            printf("\nSize of raw data: 0x%X", SectionHeader->SizeOfRawData);
            printf("\nRaw data pointer: 0x%X", SectionHeader->PRawData);
         }
         printf("\nCharacteristics: ");
         PrintSegmentCharacteristics(SectionHeader->Flags);

         // print relocations
         if ((options & DUMP_RELTAB) && SectionHeader->NRelocations > 0) {
            printf("\nRelocation entries: %i", SectionHeader->NRelocations);
            printf("\nRelocation entries pointer: 0x%X", SectionHeader->PRelocations);

            // Pointer to relocation entry
            union {
               SCOFF_Relocation * p;  // pointer to record
               char * b;              // used for address calculation and incrementing
            } Reloc;
            Reloc.b = Buf() + SectionHeader->PRelocations;

            printf("\nRelocations:");
            for (i = 0; i < SectionHeader->NRelocations; i++) {
               printf("\nAddr: 0x%X, symi: %i, type: %s",
                  Reloc.p->VirtualAddress,
                  Reloc.p->SymbolTableIndex,
                  (WordSize == 32) ? Lookup(COFF32RelNames,Reloc.p->Type) : Lookup(COFF64RelNames,Reloc.p->Type));
               if (Reloc.p->Type < COFF32_RELOC_SEG12) 
               {
                  // Check if address is within file
                  if (SectionHeader->PRawData + Reloc.p->VirtualAddress < GetDataSize()) {
                     int32_t addend = *(int32_t*)(Buf() + SectionHeader->PRawData + Reloc.p->VirtualAddress);
                     if (addend) printf(", Implicit addend: %i", addend);
                  }
                  else {
                     printf(". Error: Address is outside file");
                  }
               }
               
               PrintSymbolTable(Reloc.p->SymbolTableIndex);
               Reloc.b += SIZE_SCOFF_Relocation; // Next relocation record
            }
         }
         // print line numbers
         if (SectionHeader->NLineNumbers > 0) {
            printf("\nLine number entries: %i", SectionHeader->NLineNumbers);
            printf("  Line number pointer: %i\nLines:", SectionHeader->PLineNumbers);
            
            // Pointer to line number entry
            union {
               SCOFF_LineNumbers * p;  // pointer to record
               char * b;              // used for address calculation and incrementing
            } Linnum;
            Linnum.b = Buf() + SectionHeader->PLineNumbers;
            for (i = 0; i < SectionHeader->NLineNumbers; i++) {
               if (Linnum.p->Line) {  // Record contains line number
                  printf(" %i:%i", Linnum.p->Line, Linnum.p->Addr);
               }
               else { // Record contains function name
               }
               Linnum.b += SIZE_SCOFF_LineNumbers;  // Next line number record
            }         
         }
      }
   }
   printf("\n");
}


char const * COFFParser::GetSymbolName(char* Symbol) {
   // Get symbol name from 8 byte entry
   static char text[16];
   if (*(uint32_t*)Symbol != 0) {
      // Symbol name not more than 8 bytes
      memcpy(text, Symbol, 8);   // Copy to local buffer
      text[8] = 0;                    // Append terminating zero
      return text;                    // Return text
   }
   else {
      // Longer than 8 bytes. Get offset into string table
      uint32_t offset = *(uint32_t*)(Symbol + 4);
      char * s = StringTable + offset;
      if (*s) return s;               // Return string table entry
   }
   return "NULL";                     // String table entry was empty
}


char const * COFFParser::GetSectionName(char* Symbol) {
   // Get section name from 8 byte entry
   static char text[16];
   memcpy(text, Symbol, 8);        // Copy to local buffer
   text[8] = 0;                    // Append terminating zero
   if (text[0] == '/') {
      // Long name is in string table. 
      // Convert decimal ASCII number to string table index
      uint32_t sindex = atoi(text + 1);
      // Get name from string table
      if (sindex < StringTableSize) {
         char * s = StringTable + sindex;
         if (*s) return s;}                 // Return string table entry
   }
   else {
      // Short name is in text buffer
      return text;
   }
   return "NULL";                           // In case of error
}

char const * COFFParser::GetStorageClassName(uint8_t sc) {
   // Get storage class name
   return Lookup(COFFStorageClassNames, sc);
}

void COFFParser::PrintSegmentCharacteristics(uint32_t flags) {
   // Print segment characteristics
   int n = 0;
   // Loop through all bits of integer
   for (uint32_t i = 1; i != 0; i <<= 1) {
      if (i & flags & ~PE_SCN_ALIGN_MASK) {
         if (n++) printf(", ");
         printf("%s", Lookup(COFFSectionFlagNames, i));
      }
   }
   if (flags & PE_SCN_ALIGN_MASK) {
      int a = 1 << (((flags & PE_SCN_ALIGN_MASK) / PE_SCN_ALIGN_1) - 1);
      printf(", Align by 0x%X", a); n++;
   }
   if (n == 0) printf("None");
}

const char * COFFParser::GetFileName(SCOFF_SymTableEntry * syme) {
   // Get file name from records in symbol table
   if (syme->s.NumAuxSymbols < 1 || syme->s.StorageClass != COFF_CLASS_FILE) {
      return ""; // No file name found
   }
   // Set limit to file name length = 576
   const uint32_t MAXCOFFFILENAMELENGTH = 32 * SIZE_SCOFF_SymTableEntry;
   // Buffer to store file name. Must be static
   static char text[MAXCOFFFILENAMELENGTH+1];
   // length of name in record
   uint32_t len = syme->s.NumAuxSymbols * SIZE_SCOFF_SymTableEntry;
   if (len > MAXCOFFFILENAMELENGTH) len = MAXCOFFFILENAMELENGTH;
   // copy name from auxiliary records
   memcpy(text, (char*)syme + SIZE_SCOFF_SymTableEntry, len);
   // Terminate string
   text[len] = 0;
   // Return name
   return text;
}

const char * COFFParser::GetShortFileName(SCOFF_SymTableEntry * syme) {
   // Same as above. Strips path before filename
   // Full file name
   const char * fullname = GetFileName(syme);
   // Length
   uint32_t len = (uint32_t)strlen(fullname);
   if (len < 1) return fullname;
   // Scan backwards for '/', '\', ':'
   for (int scan = len-2; scan >= 0; scan--) {
      char c = fullname[scan];
      if (c == '/' || c == '\\' || c == ':') {
         // Path found. Short name starts after this character
         return fullname + scan + 1;
      }
   }
   // No path found. Return full name
   return fullname;
}

void COFFParser::PrintSymbolTable(int symnum) {
   // Print one or all public symbols for object file.
   // Dump symbol table if symnum = -1, or
   // Dump symbol number symnum (zero based) when symnum >= 0
   int isym = 0;  // current symbol table entry
   int jsym = 0;  // auxiliary entry number
   union {        // Pointer to symbol table
      SCOFF_SymTableEntry * p;  // Normal pointer
      char * b;                 // Used for address calculation
   } Symtab;

   Symtab.p = SymbolTable;      // Set pointer to begin of SymbolTable
   if (symnum == -1) printf("\n\nSymbol table:");
   if (symnum >= 0) {
      // Print one symbol only
      if (symnum >= NumberOfSymbols) {
         printf("\nSymbol %i not found", symnum);
         return;
      }
      isym = symnum;
      Symtab.b += SIZE_SCOFF_SymTableEntry * isym;
   }
   while (isym < NumberOfSymbols) {
      // Print symbol table entry
      SCOFF_SymTableEntry *s0;
      printf("\n");
      if (symnum >= 0) printf("  ");
      printf("Symbol %i - Name: %s\n  Value=%i, ", 
         isym, GetSymbolName(Symtab.p->s.Name), Symtab.p->s.Value);
      if (Symtab.p->s.SectionNumber > 0) {
         printf("Section=%i", Symtab.p->s.SectionNumber);
      }
      else { // Special section numbers
         switch (Symtab.p->s.SectionNumber) {
         case COFF_SECTION_UNDEF:
            printf("External"); break;
         case COFF_SECTION_ABSOLUTE:
            printf("Absolute"); break;
         case COFF_SECTION_DEBUG:
            printf("Debug"); break;
         case COFF_SECTION_N_TV:
            printf("Preload transfer"); break;
         case COFF_SECTION_P_TV:
            printf("Postload transfer"); break;
         }
      }
      printf(", Type=0x%X, StorClass=%s, NumAux=%i",
         Symtab.p->s.Type,
         GetStorageClassName(Symtab.p->s.StorageClass), Symtab.p->s.NumAuxSymbols);
      if (Symtab.p->s.StorageClass == COFF_CLASS_FILE && Symtab.p->s.NumAuxSymbols > 0) {
         printf("\n  File name: %s", GetFileName(Symtab.p));
      }
      // Increment point
      s0 = Symtab.p;
      Symtab.b += SIZE_SCOFF_SymTableEntry;
      isym++;  jsym = 0;
      // Get auxiliary records
      while (jsym < s0->s.NumAuxSymbols && isym + jsym < NumberOfSymbols) {
         // Print auxiliary symbol table entry
         SCOFF_SymTableEntry * sa = Symtab.p;
         // Detect auxiliary entry type
         if (s0->s.StorageClass == COFF_CLASS_EXTERNAL
            && s0->s.Type == COFF_TYPE_FUNCTION
            && s0->s.SectionNumber > 0) {
            // This is a function definition aux record
            printf("\n  Aux function definition:");
            printf("\n  .bf_tag_index: 0x%X, code_size: %i, PLineNumRec: %i, PNext: %i",
               sa->func.TagIndex, sa->func.TotalSize, sa->func.PointerToLineNumber,
               sa->func.PointerToNextFunction);
         }
         else if (strcmp(s0->s.Name,".bf")==0 || strcmp(s0->s.Name,".ef")==0) {
            // This is a .bf or .ef aux record
            printf("\n  Aux .bf/.ef definition:");
            printf("\n  Source line number: %i",
               sa->bfef.SourceLineNumber);
            if (strcmp(s0->s.Name,".bf")==0 ) {
               printf(", PNext: %i", sa->bfef.PointerToNextFunction);
            }
         }
         else if (s0->s.StorageClass == COFF_CLASS_EXTERNAL && 
            s0->s.SectionNumber == COFF_SECTION_UNDEF &&
            s0->s.Value == 0) {
            // This is a Weak external aux record
            printf("\n  Aux Weak external definition:");
            printf("\n  Symbol2 index: %i, Characteristics: 0x%X",
               sa->weak.TagIndex, sa->weak.Characteristics);
            }
         else if (s0->s.StorageClass == COFF_CLASS_FILE) {
            // This is filename aux record. Contents has already been printed
         }
         else if (s0->s.StorageClass == COFF_CLASS_STATIC) {
            // This is section definition aux record
            printf("\n  Aux section definition record:");
            printf("\n  Length: %i, Num. relocations: %i, Num linenums: %i, checksum 0x%X,"
               "\n  Number: %i, Selection: %i",
               sa->section.Length, sa->section.NumberOfRelocations, sa->section.NumberOfLineNumbers, 
               sa->section.CheckSum, sa->section.Number, sa->section.Selection);
         }
         else if (s0->s.StorageClass == COFF_CLASS_ALIAS) {
            // This is section definition aux record
            printf("\n  Aux alias definition record:");
            printf("\n  symbol index: %i, ", sa->weak.TagIndex);
            switch (sa->weak.Characteristics) {
            case IMAGE_WEAK_EXTERN_SEARCH_NOLIBRARY:
                printf("no library search"); break;
            case IMAGE_WEAK_EXTERN_SEARCH_LIBRARY:
                printf("library search"); break;
            case IMAGE_WEAK_EXTERN_SEARCH_ALIAS:
                printf("alias symbol"); break;
            default:
                printf("unknown characteristics 0x%X", sa->weak.Characteristics);
            }
         }         
         else {
            // Unknown aux record type
            printf("\n  Unknown Auxiliary record type %i", s0->s.StorageClass);
         }
         Symtab.b += SIZE_SCOFF_SymTableEntry;
         jsym++;
      }
      isym += jsym;
      if (symnum >= 0) break;
   }
}

int COFFParser::GetImageDir(uint32_t n, SCOFF_ImageDirAddress * dir) {
   // Find address of image directory for executable files
   int32_t  Section;
   uint32_t FileOffset;

   if (pImageDirs == 0 || n >= NumImageDirs || dir == 0) {
      // Failure
      return 0;
   }
   // Get virtual address and size of directory
   dir->VirtualAddress = pImageDirs[n].VirtualAddress;
   dir->Size           = pImageDirs[n].Size;
   dir->Name           = Lookup(COFFImageDirNames, n);

   // Check if nonzero
   if (dir->VirtualAddress == 0 || dir->Size == 0) {
      // Empty
      return 0;
   }

   // Search for section containing this address
   for (Section = 0; Section < NSections; Section++) {
      if (dir->VirtualAddress >= SectionHeaders[Section].VirtualAddress
      && dir->VirtualAddress < SectionHeaders[Section].VirtualAddress + SectionHeaders[Section].SizeOfRawData) {
         // Found section
         dir->Section = Section + 1;
         // Section-relative offset
         dir->SectionOffset = dir->VirtualAddress - SectionHeaders[Section].VirtualAddress;
         // Calculate file offset
         FileOffset = SectionHeaders[Section].PRawData + dir->SectionOffset;
         if (FileOffset == 0 || FileOffset >= DataSize) {
            // points outside file
            err.submit(2035);
            return 0;
         }
         // FileOffset is within range
         dir->FileOffset = FileOffset;

         // Maximum allowed offset
         dir->MaxOffset = SectionHeaders[Section].SizeOfRawData - dir->SectionOffset;

         // Return success
         return Section;
      }
   }
   // Import section not found
   return 0;
}

void COFFParser::PrintImportExport() {
   // Print imported and exported symbols

   // Table directory address
   SCOFF_ImageDirAddress dir;

   uint32_t i;                                     // Index into OrdinalTable and NamePointerTable
   uint32_t Ordinal;                               // Index into ExportAddressTable
   uint32_t Address;                               // Virtual address of exported symbol
   uint32_t NameOffset;                            // Section offset of symbol name
   uint32_t SectionOffset;                         // Section offset of table
   const char * Name;                            // Name of symbol

   // Check if 64 bit
   int Is64bit = OptionalHeader->h64.Magic == COFF_Magic_PE64;

   // Exported names
   if (GetImageDir(0, &dir)) {

      // Beginning of export section is export directory
      SCOFF_ExportDirectory * pExportDirectory = &Get<SCOFF_ExportDirectory>(dir.FileOffset);

      // Find ExportAddressTable
      SectionOffset = pExportDirectory->ExportAddressTableRVA - dir.VirtualAddress;
      if (SectionOffset == 0 || SectionOffset >= dir.MaxOffset) {
         // Points outside section
         err.submit(2035);  return;
      }
      uint32_t * pExportAddressTable = &Get<uint32_t>(dir.FileOffset + SectionOffset);

      // Find ExportNameTable
      SectionOffset = pExportDirectory->NamePointerTableRVA - dir.VirtualAddress;
      if (SectionOffset == 0 || SectionOffset >= dir.MaxOffset) {
         // Points outside section
         err.submit(2035);  return;
      }
      uint32_t * pExportNameTable = &Get<uint32_t>(dir.FileOffset + SectionOffset);

      // Find ExportOrdinalTable
      SectionOffset = pExportDirectory->OrdinalTableRVA - dir.VirtualAddress;
      if (SectionOffset == 0 || SectionOffset >= dir.MaxOffset) {
         // Points outside section
         err.submit(2035);  return;
      }
      uint16_t * pExportOrdinalTable = &Get<uint16_t>(dir.FileOffset + SectionOffset);

      // Get further properties
      uint32_t NumExports = pExportDirectory->AddressTableEntries;
      uint32_t NumExportNames = pExportDirectory->NamePointerEntries;
      uint32_t OrdinalBase = pExportDirectory->OrdinalBase;

      // Print exported names
      printf("\n\nExported symbols:");

      // Loop through export tables
      for (i = 0; i < NumExports; i++) {

         Address = 0;
         Name = "(None)";

         // Get ordinal from table
         Ordinal = pExportOrdinalTable[i];
         // Address table is indexed by ordinal
         if (Ordinal < NumExports) {
            Address = pExportAddressTable[Ordinal];
         }
         // Find name if there is a name list entry
         if (i < NumExportNames) {
            NameOffset = pExportNameTable[i] - dir.VirtualAddress;
            if (NameOffset && NameOffset < dir.MaxOffset) {
               Name = &Get<char>(dir.FileOffset + NameOffset);
            }
         }
         // Print ordinal, address and name
         printf("\n  Ordinal %3i, Address %6X, Name %s",
            Ordinal + OrdinalBase, Address, Name);
      }
   }
   // Imported names
   if (GetImageDir(1, &dir)) {

      // Print imported names
      printf("\n\nImported symbols:");

      // Pointer to current import directory entry
      SCOFF_ImportDirectory * ImportEntry = &Get<SCOFF_ImportDirectory>(dir.FileOffset);
      // Pointer to current import lookup table entry
      int32_t * LookupEntry = 0;
      // Pointer to current hint/name table entry
      SCOFF_ImportHintName * HintNameEntry;

      // Loop through import directory until null entry
      while (ImportEntry->DLLNameRVA) {
         // Get DLL name
         NameOffset = ImportEntry->DLLNameRVA - dir.VirtualAddress;
         if (NameOffset < dir.MaxOffset) {
            Name = &Get<char>(dir.FileOffset + NameOffset);
         }
         else {
            Name = "Error";
         }
         // Print DLL name
         printf("\nFrom %s", Name);

         // Get lookup table
         SectionOffset = ImportEntry->ImportLookupTableRVA;
         if (SectionOffset == 0) SectionOffset = ImportEntry->ImportAddressTableRVA;
         if (SectionOffset == 0) continue;
         SectionOffset -= dir.VirtualAddress;
         if (SectionOffset >= dir.MaxOffset) break;  // Out of range
         LookupEntry = &Get<int32_t>(dir.FileOffset + SectionOffset);

         // Loop through lookup table
         while (LookupEntry[0]) {
            if (LookupEntry[Is64bit] < 0) {
               // Imported by ordinal
               printf("\n  Ordinal %i", uint16_t(LookupEntry[0]));
            }
            else {
               // Find entry in hint/name table
               SectionOffset = (LookupEntry[0] & 0x7FFFFFFF) - dir.VirtualAddress;;
               if (SectionOffset >= dir.MaxOffset) continue;  // Out of range
               HintNameEntry = &Get<SCOFF_ImportHintName>(dir.FileOffset + SectionOffset);

               // Print name
               printf("\n  %04X  %s", HintNameEntry->Hint, HintNameEntry->Name);

               // Check if exported
               if (HintNameEntry->Hint) {
                 // printf(",  Export entry %i", HintNameEntry->Hint);
               }
            }
            // Loop next
            LookupEntry += Is64bit ? 2 : 1;
         }

         // Loop next
         ImportEntry++;
      }   
   }
}

// Functions for manipulating COFF files

uint32_t COFF_PutNameInSymbolTable(SCOFF_SymTableEntry & sym, const char * name, CMemoryBuffer & StringTable) {
   // Function to put a name into SCOFF_SymTableEntry. 
   // Put name in string table if longer than 8 characters.
   // Returns index into StringTable if StringTable used
   int len = (int)strlen(name);                  // Length of name
   if (len <= 8) {
      // Short name. store in section header
      memcpy(sym.s.Name, name, len);
      // Pad with zeroes
      for (; len < 8; len++) sym.s.Name[len] = 0;
   }
   else {
      // Long name. store in string table
      sym.stringindex.zeroes = 0;
      sym.stringindex.offset = StringTable.PushString(name);     // Second integer = entry into string table
      return sym.stringindex.offset;
   }
   return 0;
}

void COFF_PutNameInSectionHeader(SCOFF_SectionHeader & sec, const char * name, CMemoryBuffer & StringTable) {
   // Function to put a name into SCOFF_SectionHeader. 
   // Put name in string table if longer than 8 characters
   int len = (int)strlen(name);                  // Length of name
   if (len <= 8) {
      // Short name. store in section header
      memcpy(sec.Name, name, len);
      // Pad with zeroes
      for (; len < 8; len++) sec.Name[len] = 0;
   }
   else {
      // Long name. store in string table
      sprintf(sec.Name, "/%i", StringTable.PushString(name));
   }
}

void COFFParser::MakeSectionList(CDisassembler *Disasm) {
   // Make Sections list and Relocations list in Disasm
   uint32_t isec;                                  // Section index
   uint32_t irel;                                  // Relocation index

   // Loop through sections
   for (isec = 0; isec < (uint32_t)NSections; isec++) {

      // Get section header
      SCOFF_SectionHeader * SectionHeader = &SectionHeaders[isec];

      // Section properties
      const char * Name  = GetSectionName(SectionHeader->Name);
      uint8_t * Buffer = (uint8_t*)Buf() + SectionHeader->PRawData;
      uint32_t InitSize = SectionHeader->SizeOfRawData;
      uint32_t TotalSize = SectionHeader->VirtualSize;

      uint32_t SectionAddress = SectionHeader->VirtualAddress;
      uint32_t Type  = (SectionHeader->Flags & PE_SCN_CNT_CODE) ? 1 : 2;
      if (SectionHeader->Flags & PE_SCN_CNT_UNINIT_DATA) {
         // BSS segment. No data in file
         Buffer = 0;
         Type = 3;
      }
      else if (!(SectionHeader->Flags & (PE_SCN_MEM_WRITE | PE_SCN_MEM_EXECUTE))) {
         // Constant segment
         Type = 4;
      }
      if (SectionHeader->Flags & PE_SCN_LNK_COMDAT) {
         // Communal section
         Type |= 0x1000;
      }
      if (strnicmp(Name,"debug",5) == 0 || strnicmp(Name+1,"debug",5) == 0) {
         // This is a debug section
         Type = 0x10;
      }
      if (strnicmp(Name,".pdata", 6) == 0) {
         // This section has exception information
         Type = 0x11;
      }

      uint32_t Align = (SectionHeader->Flags & PE_SCN_ALIGN_MASK) / PE_SCN_ALIGN_1;
      if (Align) Align--;

      // Save section record
      Disasm->AddSection(Buffer, InitSize, TotalSize, SectionAddress, Type, Align, WordSize, Name);

      // Get relocations 
      // Pointer to relocation entry
      union {
         SCOFF_Relocation * p;  // pointer to record
         char * b;              // used for address calculation and incrementing
      } Reloc;
      Reloc.b = Buf() + SectionHeader->PRelocations;

      for (irel = 0; irel < SectionHeader->NRelocations; irel++, Reloc.b += SIZE_SCOFF_Relocation) {

         // Relocation properties
         int32_t Section = isec + 1;
         uint32_t Offset = Reloc.p->VirtualAddress;
         int32_t Addend  = 0;
         uint32_t TargetIndex = Reloc.p->SymbolTableIndex;

         // Translate relocation type
         uint32_t Type = 0, Size = 0;
         if (WordSize == 32) {
            // 32 bit relocation types
            // 0 = unknown, 1 = direct, 2 = self-relative, 3 = image-relative, 4 = segment relative
            switch(Reloc.p->Type) {
            case COFF32_RELOC_ABS:  // Ignore
               continue;
            case COFF32_RELOC_DIR32: // Direct, 32 bits
               Type = 1;
               Size = 4;
               break;
            case COFF32_RELOC_REL32: // Self-relative, 32 bits
               Type = 2;
               Size = 4;
               Addend = -4;
               break;
            case COFF32_RELOC_IMGREL: // Image relative, 32 bits
               Type = 4;
               Size = 4;
               break;
            case COFF32_RELOC_SECREL: // Section relative, 32 bits
               Type = 8;
               Size = 4;
               break;
            case COFF32_RELOC_SECTION: // Section index of symbol, 16 bits
               Type = 0x200;
               Size = 2;
               break;
            default: // Other/unknown
               Type = 0;
               Size = 4;
            }
         }
         else { // WordSize = 64
            switch(Reloc.p->Type) {
            case COFF64_RELOC_ABS:  // Ignore
               continue;
            case COFF64_RELOC_ABS32: // Absolute 32 bit
               Type = 1;
               Size = 4;
               break;
            case COFF64_RELOC_ABS64: // Absolute 64 bit
               Type = 1;
               Size = 8;
               break;
            case COFF64_RELOC_IMGREL: // Image relative 32 bit
               Type = 4;
               Size = 4;
               break;
            case COFF64_RELOC_REL32:    // Self-relative, 32 bits
            case COFF64_RELOC_REL32_1:  // Self-relative + 1
            case COFF64_RELOC_REL32_2:  // Self-relative + 2
            case COFF64_RELOC_REL32_3:  // Self-relative + 3
            case COFF64_RELOC_REL32_4:  // Self-relative + 4
            case COFF64_RELOC_REL32_5:  // Self-relative + 5
               Type = 2;
               Size = 4;
               Addend = - (Reloc.p->Type + 4 - COFF64_RELOC_REL32);
               break;
            case COFF64_RELOC_SECREL:   // Section relative
               Type = 8;
               Size = 4;
               break;
            default: // Other/unknown
               Type = 0;
               Size = 4;
            }
         }
         // Save relocation record
         Disasm->AddRelocation(Section, Offset, Addend, Type, Size, TargetIndex);
      }
   }
}

void COFFParser::MakeSymbolList(CDisassembler *Disasm) {
   // Make Symbols list in Disasm
   uint32_t isym;                                  // Symbol index
   uint32_t naux = 0;                              // Number of auxiliary entries in old symbol table

   union {                                       // Pointer to old symbol table entries
      SCOFF_SymTableEntry * p;                   // Normal pointer
      char * b;                                  // Used for address calculation
   } Sym, SymAux;

   // Set pointer to old SymbolTable
   Sym.p = SymbolTable;

   // Loop through old symbol table
   for (isym = 0; isym < (uint32_t)NumberOfSymbols; isym += 1+naux, Sym.b += (1+naux) * SIZE_SCOFF_SymTableEntry) {

      // Number of auxiliary entries
      naux = Sym.p->s.NumAuxSymbols;

      if (Sym.p->s.SectionNumber != COFF_SECTION_ABSOLUTE
      && (Sym.p->s.SectionNumber < 0 
      || (Sym.p->s.StorageClass != COFF_CLASS_EXTERNAL && Sym.p->s.StorageClass != COFF_CLASS_STATIC && Sym.p->s.StorageClass != COFF_CLASS_LABEL))) {
         // Ignore irrelevant symbol table entries
         continue;
      }

      // Symbol properties
      uint32_t Index   = isym;
      int32_t  Section = Sym.p->s.SectionNumber;
      uint32_t Offset  = Sym.p->s.Value;
      uint32_t Size    = 0;
      uint32_t Type    = (Sym.p->s.Type == COFF_TYPE_FUNCTION) ? 0x83 : 0;

      // Identify segment entries in symbol table
      if (Sym.p->s.Value == 0 && Sym.p->s.StorageClass == COFF_CLASS_STATIC 
      && naux && Sym.p->s.Type != 0x20) {
         // Note: The official MS specification says that a symbol table entry 
         // is a section if the storage class is static and the value is 0,
         // but I have encountered static functions that meet these criteria.
         // Therefore, I am also checking Type and naux.
         Type = 0x80000082;
      }

      const char * Name = GetSymbolName(Sym.p->s.Name);

      // Get scope. Note that these values are different from the constants defined in maindef.h
      uint32_t Scope = 0;
      if (Sym.p->s.StorageClass == COFF_CLASS_STATIC || Sym.p->s.StorageClass == COFF_CLASS_LABEL) {
         Scope = 2;             // Local
      }
      else if (Sym.p->s.SectionNumber > 0 || (Sym.p->s.SectionNumber == -1 && Sym.p->s.StorageClass == COFF_CLASS_EXTERNAL)) {
         Scope = 4;             // Public
      }
      else {
         Scope = 0x20;          // External
      }

      // Check auxiliary symbol table entries
      if (naux && Sym.p->s.Type == COFF_TYPE_FUNCTION) {
         // Function symbol has auxiliary entry. Get information about size
         SymAux.b = Sym.b + SIZE_SCOFF_SymTableEntry;
         Size = SymAux.p->func.TotalSize;
      }
      // Check for special section values
      if (Section < 0) {
         if (Section == COFF_SECTION_ABSOLUTE) {
            // Symbol is an absolute constant
            Section = ASM_SEGMENT_ABSOLUTE;
         }
         else {
            // Debug symbols, etc
            Section = ASM_SEGMENT_ERROR;
         }
      }

      // Store new symbol record
      Disasm->AddSymbol(Section, Offset, Size, Type, Scope, Index, Name);
   }
}

void COFFParser::MakeDynamicRelocations(CDisassembler *Disasm) {
   // Make dynamic base relocations for executable files
   
   // Find base relocation table
   SCOFF_ImageDirAddress reldir;
   if (!GetImageDir(5, &reldir)) {
      // No base relocation table found
      return;
   }

   SCOFF_BaseRelocationBlock * pBaseRelocation;  // Start of dynamic base relocation section

   // Beginning of .reloc section is first base relocation block
   pBaseRelocation = &Get<SCOFF_BaseRelocationBlock>(reldir.FileOffset);

   uint32_t ROffset = 0;                        // Offset into .reloc section
   uint32_t BlockEnd;                           // Offset of end of current block
   uint32_t PageOffset;                         // Image-relative address of begin of page

   // Make pointer to header or entry in .reloc section
   union {
      SCOFF_BaseRelocationBlock * header;
      SCOFF_BaseRelocation * entry;
      char * b;
   } Pointer;

   // Loop throung .reloc section
   // while (ROffset < reldir.MaxOffset) {
   while (ROffset < reldir.Size) {
      // Set Pointer to current position
      Pointer.header = pBaseRelocation;
      Pointer.b += ROffset;

      // Read base relocation block
      PageOffset = Pointer.header->PageRVA;
      BlockEnd = ROffset + Pointer.header->BlockSize;

      // Read entries in this block
      ROffset   += sizeof(SCOFF_BaseRelocationBlock);
      Pointer.b += sizeof(SCOFF_BaseRelocationBlock);
      // Loop through entries
      while (ROffset < BlockEnd) {
         // Set Pointer to current position
         Pointer.header = pBaseRelocation;
         Pointer.b += ROffset;

         if (Pointer.entry->Type == COFF_REL_BASED_HIGHLOW) {
            // Add relocation record, 32 bit
            // Section = ASM_SEGMENT_IMGREL means offset is image-relative
            // Type = 0x20 means already relocated to image base
            Disasm->AddRelocation(ASM_SEGMENT_IMGREL, Pointer.entry->Offset + PageOffset, 0, 0x21, 4, 0);
         }
         else if (Pointer.entry->Type == COFF_REL_BASED_DIR64) {
            // Add relocation record, 64 bit
            Disasm->AddRelocation(ASM_SEGMENT_IMGREL, Pointer.entry->Offset + PageOffset, 0, 0x21, 8, 0);
         }

         // Go to next
         ROffset += sizeof(SCOFF_BaseRelocation);
         if (Pointer.entry->Type == COFF_REL_BASED_HIGHADJ) ROffset += sizeof(SCOFF_BaseRelocation);
      }
      // Finished block. Align by 4
      ROffset = (ROffset + 3) & uint32_t(-4);
   }
}

void COFFParser::MakeImportList(CDisassembler *Disasm) {
   // Make imported symbols for executable files

   // Find import table
   SCOFF_ImageDirAddress impdir;
   if (!GetImageDir(1, &impdir)) {
      // No import table found
      return;
   }

   // Beginning of import section is import directory
   SCOFF_ImportDirectory * pImportDirectory = &Get<SCOFF_ImportDirectory>(impdir.FileOffset);

   // Check if 64 bit
   int Is64bit = OptionalHeader->h64.Magic == COFF_Magic_PE64; // 1 if 64 bit
   uint32_t EntrySize = Is64bit ? 8 : 4;           // Size of address table entries

   uint32_t NameOffset;                            // Offset to name
   const char * SymbolName;                      // Name of symbol
   const char * DLLName;                         // Name of DLL containing symbol
   char NameBuffer[64];                          // Buffer for creating name of ordinal symbols
   uint32_t SectionOffset;                         // Section-relative address of current entry
   uint32_t HintNameOffset;                        // Section-relative address of hint/name table
   uint32_t FirstHintNameOffset = 0;               // First HintNameOffset = start of hint/name table
   uint32_t AddressTableOffset;                    // Offset of import address table relative to import lookup table

   // Pointer to current import directory entry
   SCOFF_ImportDirectory * ImportEntry = pImportDirectory;
   // Pointer to current import lookup table entry
   int32_t * LookupEntry = 0;
   // Pointer to current hint/name table entry
   SCOFF_ImportHintName * HintNameEntry;

   // Loop through import directory until null entry
   while (ImportEntry->DLLNameRVA) {
      // Get DLL name
      NameOffset = ImportEntry->DLLNameRVA - impdir.VirtualAddress;
      if (NameOffset < impdir.MaxOffset) {
         DLLName = &Get<char>(impdir.FileOffset + NameOffset);
      }
      else {
         DLLName = "?";
      }

      // Get lookup table
      SectionOffset = ImportEntry->ImportLookupTableRVA;
      if (SectionOffset == 0) SectionOffset = ImportEntry->ImportAddressTableRVA;
      if (SectionOffset == 0) continue;
      // Get distance from import lookup table to import address table
      AddressTableOffset = ImportEntry->ImportAddressTableRVA - SectionOffset;
      // Section relative address
      SectionOffset -= impdir.VirtualAddress;
      if (SectionOffset >= impdir.MaxOffset) break;  // Out of range

      // Loop through lookup table
      while (1) {
         // Pointer to lookup table entry
         LookupEntry = &Get<int32_t>(impdir.FileOffset + SectionOffset);

         // End when entry is empty
         if (!LookupEntry[0]) break;

         if (LookupEntry[Is64bit] < 0) {
            // Imported by ordinal. Give it a name
            strncpy(NameBuffer, DLLName, 20);
            // Remove dot from name
            char * dot = strchr(NameBuffer,'.');
            if (dot) *dot = 0;
            // Add ordinal number to name
            sprintf(NameBuffer+strlen(NameBuffer), "_Ordinal_%i", uint16_t(LookupEntry[0]));
            SymbolName = NameBuffer;
         }
         else {
            // Find entry in hint/name table
            HintNameOffset = (LookupEntry[0] & 0x7FFFFFFF) - impdir.VirtualAddress;
            if (HintNameOffset >= impdir.MaxOffset) goto LOOPNEXT;  // Out of range
            if (!FirstHintNameOffset) FirstHintNameOffset = HintNameOffset;
            HintNameEntry = &Get<SCOFF_ImportHintName>(impdir.FileOffset + HintNameOffset);
            // Get name
            SymbolName = HintNameEntry->Name;
         }
         // Add symbol
         Disasm->AddSymbol(ASM_SEGMENT_IMGREL, impdir.VirtualAddress + SectionOffset + AddressTableOffset,
            EntrySize, 0xC, 0x20, 0, SymbolName, DLLName);

         // Loop next
         LOOPNEXT:
         SectionOffset += EntrySize;
      }

      // Loop next
      ImportEntry++;
   }

   // Make label for import name table
   if (FirstHintNameOffset) {
      Disasm->AddSymbol(ASM_SEGMENT_IMGREL, impdir.VirtualAddress + FirstHintNameOffset, 1, 1, 1, 0, "Import_name_table");
   }
}

void COFFParser::MakeExportList(CDisassembler *Disasm) {
   // Make exported symbols for executable files

   // Define entry point
   if (OptionalHeader->h32.AddressOfEntryPoint) {
      Disasm->AddSymbol(ASM_SEGMENT_IMGREL, OptionalHeader->h32.AddressOfEntryPoint, 0, 0x83, 4, 0, "Entry_point");
   }

   // Get export table directory address
   SCOFF_ImageDirAddress expdir;

   // Exported names
   if (!GetImageDir(0, &expdir)) {
      // No export directory
      return;
   }

   // Beginning of export section is export directory
   SCOFF_ExportDirectory * pExportDirectory = &Get<SCOFF_ExportDirectory>(expdir.FileOffset);

   // Find ExportAddressTable
   uint32_t ExportAddressTableOffset = pExportDirectory->ExportAddressTableRVA - expdir.VirtualAddress;
   if (ExportAddressTableOffset == 0 || ExportAddressTableOffset >= expdir.MaxOffset) {
      // Points outside section
      err.submit(2035);  return;
   }
   uint32_t * pExportAddressTable = &Get<uint32_t>(expdir.FileOffset + ExportAddressTableOffset);

   // Find ExportNameTable
   uint32_t ExportNameTableOffset = pExportDirectory->NamePointerTableRVA - expdir.VirtualAddress;
   if (ExportNameTableOffset == 0 || ExportNameTableOffset >= expdir.MaxOffset) {
      // Points outside section
      err.submit(2035);  return;
   }
   uint32_t * pExportNameTable = &Get<uint32_t>(expdir.FileOffset + ExportNameTableOffset);

   // Find ExportOrdinalTable
   uint32_t ExportOrdinalTableOffset = pExportDirectory->OrdinalTableRVA - expdir.VirtualAddress;
   if (ExportOrdinalTableOffset == 0 || ExportOrdinalTableOffset >= expdir.MaxOffset) {
      // Points outside section
      err.submit(2035);  return;
   }
   uint16_t * pExportOrdinalTable = &Get<uint16_t>(expdir.FileOffset + ExportOrdinalTableOffset);

   // Get further properties
   uint32_t NumExports = pExportDirectory->AddressTableEntries;
   uint32_t NumExportNames = pExportDirectory->NamePointerEntries;
   uint32_t OrdinalBase = pExportDirectory->OrdinalBase;

   uint32_t i;                                     // Index into pExportOrdinalTable and pExportNameTable
   uint32_t Ordinal;                               // Index into pExportAddressTable
   uint32_t Address;                               // Image-relative address of symbol
   uint32_t NameOffset;                            // Section-relative address of name
   uint32_t FirstName = 0;                         // Image-relative address of first name table entry
   const char * Name = 0;                        // Name of symbol
   char NameBuffer[64];                          // Buffer for making name

   // Loop through export tables
   for (i = 0; i < NumExports; i++) {

      Address = 0;
      Name = "?";

      // Get ordinal from table
      Ordinal = pExportOrdinalTable[i];
      // Address table is indexed by ordinal
      if (Ordinal < NumExports) {
         Address = pExportAddressTable[Ordinal];
      }
      // Find name if there is a name list entry
      if (i < NumExportNames) {
         NameOffset = pExportNameTable[i] - expdir.VirtualAddress;
         if (NameOffset && NameOffset < expdir.MaxOffset) {
            Name = &Get<char>(expdir.FileOffset + NameOffset);
            if (FirstName == 0) FirstName = pExportNameTable[i];
         }
      }
      else {
         // No name. Make name from ordinal number
         sprintf(NameBuffer, "Ordinal_%i", Ordinal + OrdinalBase);
         Name = NameBuffer;
      }

      // Define symbol
      Disasm->AddSymbol(ASM_SEGMENT_IMGREL, Address, 0, 0x83, 4, 0, Name);
   }

   // Make label for export section
   Disasm->AddSymbol(ASM_SEGMENT_IMGREL, expdir.VirtualAddress, 4, 3, 2, 0, "Export_tables");

   // Make labels for export tables
   Disasm->AddSymbol(ASM_SEGMENT_IMGREL, ExportAddressTableOffset - expdir.FileOffset + expdir.VirtualAddress, 4, 3, 2, 0, "Export_address_table");
   Disasm->AddSymbol(ASM_SEGMENT_IMGREL, ExportOrdinalTableOffset - expdir.FileOffset + expdir.VirtualAddress, 4, 3, 2, 0, "Export_ordinal_table");
   Disasm->AddSymbol(ASM_SEGMENT_IMGREL, ExportNameTableOffset - expdir.FileOffset + expdir.VirtualAddress, 4, 3, 2, 0, "Export_name_pointer_table");
   Disasm->AddSymbol(ASM_SEGMENT_IMGREL, FirstName, 1, 1, 2, 0, "Export_name_table");
}

void COFFParser::MakeListLabels(CDisassembler *Disasm) {
   // Attach names to all image directories
   SCOFF_ImageDirAddress dir;
   uint32_t i;

   for (i = 0; i < NumImageDirs; i++) {
      if (GetImageDir(i, &dir)) {
         // Found a directory. Make label for it
         Disasm->AddSymbol(ASM_SEGMENT_IMGREL, dir.VirtualAddress, 4, 0, 1, 0, dir.Name);
      }
   }
}
