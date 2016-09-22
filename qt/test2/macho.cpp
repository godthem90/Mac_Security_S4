/****************************    macho.cpp    *******************************
* Author:        Agner Fog
* Date created:  2007-01-06
* Last modified: 2008-06-02
* Project:       objconv
* Module:        macho.cpp
* Description:
* Module for reading Mach-O files
*
* Class MACHOParser is used for reading, interpreting and dumping Mach-O files.
*
* Copyright 2007-2008 GNU General Public License http://www.gnu.org/licenses
*****************************************************************************/

#include <stdio.h>
#include <string.h>
#include "macho.h"
#include "parser.h"

// Machine names
SIntTxt MacMachineNames[] = {
   {MAC_CPU_TYPE_I386,      "Intel 32 bit"},
   {MAC_CPU_TYPE_X86_64,    "Intel 64 bit"},
   {MAC_CPU_TYPE_ARM,       "Arm"},
   {MAC_CPU_TYPE_SPARC,     "Sparc"},
   {MAC_CPU_TYPE_POWERPC,   "Power PC 32 bit"},
   {MAC_CPU_TYPE_POWERPC64, "Power PC 64 bit"}
};

// CPU subtype names
SIntTxt MacCPUSubtypeNames[] = {
   {MAC_CPU_SUBTYPE_POWERPC_ALL,  "Power PC All"},
   {MAC_CPU_SUBTYPE_I386_ALL,     "Intel All"}
};

// File type names
SIntTxt MacFileTypeNames[] = {
   {MAC_OBJECT,     "Relocatable object file"},
   {MAC_EXECUTE,    "demand paged executable file"},
   {MAC_FVMLIB,     "fixed VM shared library file"},
   {MAC_CORE,       "core file"},
   {MAC_PRELOAD,    "preloaded executable file"},
   {MAC_DYLIB,      "dynamicly bound shared library file"},
   {MAC_DYLINKER,   "dynamic link editor"},
   {MAC_BUNDLE,     "dynamicly bound bundle file"}
};

// Command type names
SIntTxt MacCommandTypeNames[] = {
   {MAC_LC_SEGMENT,        "Segment"},
   {MAC_LC_SYMTAB,         "Symbol table"},
   {MAC_LC_SYMSEG,         "gdb symbol table info (obsolete)"},
   {MAC_LC_THREAD,         "thread"},
   {MAC_LC_UNIXTHREAD,     "unix thread"},
   {MAC_LC_LOADFVMLIB,     "load a specified fixed VM shared library"},
   {MAC_LC_IDFVMLIB,       "fixed VM shared library identification"},
   {MAC_LC_IDENT,          "object identification info (obsolete)"},
   {MAC_LC_FVMFILE,        "fixed VM file inclusion (internal use)"},
   {MAC_LC_PREPAGE,        "prepage command (internal use)"},
   {MAC_LC_DYSYMTAB,       "dynamic link-edit symbol table info"},
   {MAC_LC_LOAD_DYLIB,     "load a dynamicly linked shared library"},
   {MAC_LC_ID_DYLIB,       "dynamicly linked shared lib identification"},
   {MAC_LC_LOAD_DYLINKER,  "load a dynamic linker"},
   {MAC_LC_ID_DYLINKER,    "dynamic linker identification"},
   {MAC_LC_PREBOUND_DYLIB, "modules prebound for a dynamicly linked shared library"},
   {MAC_LC_ROUTINES,       "image routines"},
   {MAC_LC_SUB_FRAMEWORK,  "sub framework"},
   {MAC_LC_SUB_UMBRELLA,   "sub umbrella"},
   {MAC_LC_SUB_CLIENT,     "sub client"},
   {MAC_LC_SUB_LIBRARY,    "sub library"},
   {MAC_LC_TWOLEVEL_HINTS, "two-level namespace lookup hints"},
   {MAC_LC_PREBIND_CKSUM,  "prebind checksum"},
   {MAC_LC_LOAD_WEAK_DYLIB&0xFF, "load a dynamically linked shared library, all symbols weak"},
   {MAC_LC_SEGMENT_64,     "64-bit segment"},
   {MAC_LC_ROUTINES_64,    "64-bit image routine"},
   {MAC_LC_UUID,           "uuid"}
};

// Relocation type names, 32 bit
SIntTxt Mac32RelocationTypeNames[] = {
   {MAC32_RELOC_VANILLA,        "Generic"},
   {MAC32_RELOC_PAIR,           "Second entry of a pair"},
   {MAC32_RELOC_SECTDIFF,       "Section diff"},
   {MAC32_RELOC_PB_LA_PTR,      "Prebound lazy "},
   {MAC32_RELOC_LOCAL_SECTDIFF, "SectDif local"}
};

// Relocation type names, 64 bit
SIntTxt Mac64RelocationTypeNames[] = {
   {MAC64_RELOC_UNSIGNED,    "absolute address"},
   {MAC64_RELOC_SIGNED,      "signed 32-bit displ."},
   {MAC64_RELOC_BRANCH,      "Rel. jump 32-bit displ."},
   {MAC64_RELOC_GOT_LOAD,    "MOVQ load of a GOT entry"},
   {MAC64_RELOC_GOT,         "other GOT reference"},
   {MAC64_RELOC_SUBTRACTOR,  "Subtractor"},
   {MAC64_RELOC_SIGNED_1,    "signed 32-bit displacement with -1 addend"},
   {MAC64_RELOC_SIGNED_2,    "signed 32-bit displacement with -2 addend"},
   {MAC64_RELOC_SIGNED_4,    "signed 32-bit displacement with -4 addend"}
};

// Symbol type names
SIntTxt MacSymbolTypeNames[] = {
   {MAC_N_UNDF,    "Undefined, no section"},
   {MAC_N_ABS,     "Absolute, no section"},
   {MAC_N_SECT,    "Defined"},
   {MAC_N_PBUD,    "Prebound undefined (defined in a dylib)"},
   {MAC_N_INDR,    "Indirect"}
};

// Symbol reference type names
SIntTxt MacSymbolReferenceTypeNames[] = {
   {MAC_REF_FLAG_UNDEFINED_NON_LAZY,         "External non lazy"},
   {MAC_REF_FLAG_UNDEFINED_LAZY,             "External lazy (function call)"},
   {MAC_REF_FLAG_DEFINED,                    "Defined public"},
   {MAC_REF_FLAG_PRIVATE_DEFINED,            "Defined private"},
   {MAC_REF_FLAG_PRIVATE_UNDEFINED_NON_LAZY, "Private undefined non lazy"},
   {MAC_REF_FLAG_PRIVATE_UNDEFINED_LAZY,     "Private undefined lazy"}
};

// Symbol descriptor flag names
SIntTxt MacSymbolDescriptorFlagNames[] = {
   {MAC_REFERENCED_DYNAMICALLY, "Referenced dynamically"},
// {MAC_N_DESC_DISCARDED,       "Discarded"},
   {MAC_N_NO_DEAD_STRIP,        "Don't dead-strip"},
   {MAC_N_WEAK_REF,             "Weak external"},
   {MAC_N_WEAK_DEF,             "Weak public"}
};



// Class MACHOParser members:
// Constructor
template <class TMAC_header, class TMAC_segment_command, class TMAC_section, class TMAC_nlist, class MInt>
MACHOParser<MACSTRUCTURES>::MACHOParser() {
   // TODO memset except MAC2ASM member
   //memset(this, 0, sizeof(*this));
}

template <class TMAC_header, class TMAC_segment_command, class TMAC_section, class TMAC_nlist, class MInt>
int MACHOParser<MACSTRUCTURES>::ParseFile(CDisassembler *Disasm){
   // Load and parse file buffer
   FileHeader = *(TMAC_header*)Buf();   // Copy file header

   // Loop through file commands
   uint32_t cmd, cmdsize;
   uint32_t currentoffset = sizeof(TMAC_header);
   for (uint32_t i = 1; i <= FileHeader.ncmds; i++) {
      if (currentoffset >= this->GetDataSize()) {
         err.submit(2016); return -1;
      }
      uint8_t * currentp = (uint8_t*)(Buf() + currentoffset);
      cmd     = ((MAC_load_command*)currentp) -> cmd;
      cmdsize = ((MAC_load_command*)currentp) -> cmdsize;
      // Interpret specific command type
      switch(cmd) {
         case MAC_LC_SEGMENT: {
            if (WordSize != 32) err.submit(2320); // mixed segment size
            MAC_segment_command_32 * sh = (MAC_segment_command_32*)currentp;
            SegmentOffset = sh->fileoff;              // File offset of segment
            SegmentSize = sh->filesize;               // Size of segment
            NumSections = sh->nsects;                 // Number of sections
            SectionHeaderOffset = currentoffset + sizeof(TMAC_segment_command); // File offset of section headers
            if (!ImageBase && strcmp(sh->segname, "__TEXT")==0) ImageBase = sh->vmaddr; // Find image base
            break;}

         case MAC_LC_SEGMENT_64: {
            if (WordSize != 64) err.submit(2320); // mixed segment size
            MAC_segment_command_64 * sh = (MAC_segment_command_64*)currentp;
            SegmentOffset = (uint32_t)sh->fileoff;      // File offset of segment
            SegmentSize = (uint32_t)sh->filesize;       // Size of segment
            NumSections = sh->nsects;                 // Number of sections
            SectionHeaderOffset = currentoffset + sizeof(TMAC_segment_command); // File offset of section headers
            if (!ImageBase && strcmp(sh->segname, "__TEXT")==0) ImageBase = sh->vmaddr; // Find image base
            break;}

         case MAC_LC_SYMTAB: {
            MAC_symtab_command * sh = (MAC_symtab_command*)currentp;
            SymTabOffset = sh->symoff;                // File offset of symbol table
            SymTabNumber = sh->nsyms;                 // Number of entries in symbol table
            StringTabOffset = sh->stroff;             // File offset of string table
            StringTabSize = sh->strsize;              // Size of string table
            break;}

         case MAC_LC_DYSYMTAB: {
            MAC_dysymtab_command * sh = (MAC_dysymtab_command*)currentp;
            ilocalsym = sh->ilocalsym;	               // index to local symbols
            nlocalsym = sh->nlocalsym;	               // number of local symbols 
            iextdefsym = sh->iextdefsym;	            // index to externally defined symbols
            nextdefsym = sh->nextdefsym;	            // number of externally defined symbols 
            iundefsym = sh->iundefsym;	               // index to undefined symbols
            nundefsym = sh->nundefsym;	               // number of undefined symbols
            IndirectSymTabOffset = sh->indirectsymoff;// file offset to the indirect symbol table
            IndirectSymTabNumber = sh->nindirectsyms; // number of indirect symbol table entries
            break;}
      }
      currentoffset += cmdsize;
   }

   // Check cpu type
   switch (this->FileHeader.cputype) {
   case MAC_CPU_TYPE_I386:
      this->WordSize = 32;  break;

   case MAC_CPU_TYPE_X86_64:
      this->WordSize = 64;  break;

   default:
      // Wrong type
      err.submit(2011, "");  return -1;
   }

   // check object/executable file type
   uint32_t ExeType;                     // File type: 0 = object, 1 = position independent shared object, 2 = executable

   switch (this->FileHeader.filetype) {
   case MAC_OBJECT:   // Relocatable object file
      ExeType = 0;  break;

   case MAC_FVMLIB:   // fixed VM shared library file
   case MAC_DYLIB:    // dynamicly bound shared library file
   case MAC_BUNDLE:   // part of universal binary
      ExeType = 1;  break;

   case MAC_EXECUTE:  // demand paged executable file
   case MAC_CORE:     // core file
   case MAC_PRELOAD:  // preloaded executable file
      ExeType = 2;  break;

   default:  // Other types
      err.submit(2011, "");  return -1;
   }

   // Tell disassembler
   // Disasm.Init(ExeType, this->ImageBase);
   Disasm->Init(ExeType, 0);

   // Make Sections list and relocations list
   MakeSectionList(Disasm);

   // Make Symbols list in Disasm
   MakeSymbolList(Disasm);

   // Make relocations list in Disasm
   MakeRelocations(Disasm);

   // Make symbol entries for imported symbols
   MakeImports(Disasm);

   Disasm->Go();

   return 0;
}

// Debug dump
template <class TMAC_header, class TMAC_segment_command, class TMAC_section, class TMAC_nlist, class MInt>
void MACHOParser<MACSTRUCTURES>::Dump(int options) {
   uint32_t icmd;                        // Command index
   int32_t  isec1;                       // Section index within segment
   int32_t  isec2;                       // Section index global
   int32_t  nsect;                        // Number of sections in segment

   if (options & DUMP_FILEHDR) {
      // File header
      printf("\nDump of Mach-O file %s", FileName);
      printf("\n-----------------------------------------------");
      printf("\nFile size: 0x%X", this->GetDataSize());
      printf("\nFile header:");
      printf("\n  CPU type: %s, subtype: %s",
         Lookup(MacMachineNames, FileHeader.cputype), 
         Lookup(MacCPUSubtypeNames, FileHeader.cpusubtype));
      
      printf("\n  File type: %s - %s", 
         GetFileFormatName(FileType), Lookup(MacFileTypeNames, FileHeader.filetype));

      printf("\n  Number of load commands: %i, Size of commands: 0x%X, Flags: %X",
         FileHeader.ncmds, FileHeader.sizeofcmds, FileHeader.flags);
   }

   uint32_t cmd;                         // Load command
   uint32_t cmdsize;                     // Command size
   // Pointer to current position
   uint8_t * currentp = (uint8_t*)(Buf() + sizeof(TMAC_header));

   // Loop through file commands
   for (icmd = 1; icmd <= FileHeader.ncmds; icmd++) {
      cmd     = ((MAC_load_command*)currentp) -> cmd;
      cmdsize = ((MAC_load_command*)currentp) -> cmdsize;

      if (options & DUMP_SECTHDR) {
         // Dump command header
         printf("\n\nCommand %i: %s, size: 0x%X", icmd,
         Lookup(MacCommandTypeNames, cmd), cmdsize);

         // Interpret specific command type
         switch(cmd) {
            case MAC_LC_SEGMENT: {
               MAC_segment_command_32 * sh = (MAC_segment_command_32*)currentp;
               printf("\n  Name: %s, Memory address 0x%X, Memory size 0x%X"
                  "\n  File offset 0x%X, File size 0x%X, Maxprot 0x%X, Initprot 0x%X"
                  "\n  Number of sections %i, Flags 0x%X",
                  sh->segname, sh->vmaddr, sh->vmsize,
                  sh->fileoff, sh->filesize, sh->maxprot, sh->initprot, 
                  sh->nsects, sh->flags);
               break;}

            case MAC_LC_SEGMENT_64: {
               MAC_segment_command_64 * sh = (MAC_segment_command_64*)currentp;
               printf("\n  Name: %s, \n  Memory address 0x%08X%08X, Memory size 0x%08X%08X"
                  "\n  File offset 0x%08X%08X, File size 0x%08X%08X\n  Maxprot 0x%X, Initprot 0x%X"
                  "\n  Number of sections %i, Flags 0x%X",
                  sh->segname, (uint32_t)(sh->vmaddr>>32), (uint32_t)sh->vmaddr, 
                  (uint32_t)(sh->vmsize>>32), (uint32_t)sh->vmsize,
                  (uint32_t)(sh->fileoff>>32), (uint32_t)sh->fileoff, 
                  (uint32_t)(sh->filesize>>32), (uint32_t)sh->filesize, 
                  sh->maxprot, sh->initprot, 
                  sh->nsects, sh->flags);
               break;}

            case MAC_LC_SYMTAB: {
               MAC_symtab_command * sh = (MAC_symtab_command*)currentp;
               printf("\n  Symbol table offset 0x%X, number of symbols %i,"
                  "\n  String table offset 0x%X, String table size 0x%X",
                  sh->symoff, sh->nsyms, sh->stroff, sh->strsize);
               break;}

            case MAC_LC_DYSYMTAB: {
               MAC_dysymtab_command * sh = (MAC_dysymtab_command*)currentp;
               printf("\n  Index to local symbols %i, number of local symbols %i,"
                  "\n  Index to external symbols %i, number of external symbols %i,"
                  "\n  Index to undefined symbols %i, number of undefined symbols %i,"
                  "\n  File offset to TOC 0x%X, number of entries in TOC %i,",
                  sh->ilocalsym, sh->nlocalsym, sh->iextdefsym, sh->nextdefsym, 
                  sh->iundefsym, sh->nundefsym, sh->tocoff, sh->ntoc);
               printf("\n  File offset to module table 0x%X, Number of module table entries %i,"
                  "\n  Offset to referenced symbol table 0x%X, Number of referenced symtab entries %i"
                  "\n  Offset to indirect symbol table 0x%X, Number of indirect symtab entries %i"
                  "\n  Offset to external relocation entries 0x%X, Number of external reloc. entries %i"
                  "\n  Offset to local relocation entries 0x%X, Number of local reloc. entries %i",
                  sh->modtaboff, sh->nmodtab, sh->extrefsymoff, sh->nextrefsyms, 
                  sh->indirectsymoff, sh->nindirectsyms, sh->extreloff, sh->nextrel,
                  sh->locreloff, sh->nlocrel);	
               break;}
         }

      }
      currentp += cmdsize;
   }

   // Dump section headers
   if (options & DUMP_SECTHDR) {
      printf("\n\nSections:");

      // Reset current pointer
      currentp = (uint8_t*)(Buf() + sizeof(TMAC_header));
      isec2 = 0;

      // Loop through load commands
      for (icmd = 1; icmd <= FileHeader.ncmds; icmd++) {
         cmd     = ((MAC_load_command*)currentp) -> cmd;
         cmdsize = ((MAC_load_command*)currentp) -> cmdsize;

         if (cmd == MAC_LC_SEGMENT) {
            // This is a 32-bit segment command
            // Number of sections in segment
            nsect   = ((MAC_segment_command_32*)currentp) -> nsects;

            // Find first section header
            MAC_section_32 * sectp = (MAC_section_32*)(currentp + sizeof(MAC_segment_command_32));

            // Loop through section headers
            for (isec1 = 1; isec1 <= nsect; isec1++, sectp++) {
               printf("\n\nSection %i: Name: %s, Segment: %s.", 
                  ++isec2, sectp->sectname, sectp->segname);
               printf("\n  Memory address 0x%X, Size 0x%X, File offset 0x%X"
                  "\n  Alignment %i, Reloc. ent. offset 0x%X, Num reloc. %i"
                  "\n  Flags 0x%X, reserved1 0x%X, reserved2 0x%X",
                  sectp->addr, sectp->size, sectp->offset, 1 << sectp->align,
                  sectp->reloff, sectp->nreloc, sectp->flags, 
                  sectp->reserved1, sectp->reserved2);

               if (sectp->nreloc && (options & DUMP_RELTAB)) {
                  // Dump relocations
                  printf("\n  Relocations:");
                  if (sectp->reloff >= this->GetDataSize()) {err.submit(2035); break;}
                  MAC_relocation_info * relp = (MAC_relocation_info*)(Buf() + sectp->reloff);
                  for (uint32_t r = 1; r <= sectp->nreloc; r++, relp++) {
                     if (relp->r_address & R_SCATTERED) {
                        // scattered relocation into
                        MAC_scattered_relocation_info * scatp = (MAC_scattered_relocation_info*)relp;

                        if (!(scatp->r_type & MAC32_RELOC_PAIR)) {
                           printf ("\n    Offset: 0x%X, Value: 0x%X, Length: %i, Scat. Type: %s",
                              scatp->r_address, scatp->r_value, 1 << scatp->r_length, 
                              Lookup(Mac32RelocationTypeNames, scatp->r_type));
                           if (scatp->r_address < sectp->size) {
                              printf(", Inline: 0x%X", *(int32_t*)(Buf()+sectp->offset+scatp->r_address));
                           }
                        }
                        else {
                           // Second entry of a pair
                           printf ("\n     Offset2: 0x%X, Value2: 0x%X, Length2: %i",
                              scatp->r_address, scatp->r_value, 1 << scatp->r_length);
                        }
                        if (scatp->r_pcrel) printf(", PC relative");
                     }
                     else {
                        // non-scattered
                        if (relp->r_extern) printf ("\n    Symbol number %i, ", relp->r_symbolnum);
                        else printf ("\n    Section: %i, ", relp->r_symbolnum);
                        printf ("Offset: 0x%X, ", relp->r_address);
                        if (relp->r_pcrel) printf ("PC relative, ");
                        printf ("\n     Length: %i, Extern: %i, Type: %s",
                           1 << relp->r_length, relp->r_extern,
                           Lookup(Mac32RelocationTypeNames, relp->r_type));
                        if (relp->r_address < sectp->size) {
                           printf(", Inline: 0x%X", *(int32_t*)(Buf()+sectp->offset+relp->r_address));
                        }
                     }
                  }
               }
            }
         }
         if (cmd == MAC_LC_SEGMENT_64) {
            // This is a 64-bit segment command
            // Number of sections in segment
            nsect   = ((MAC_segment_command_64*)currentp) -> nsects;

            // Find first section header
            MAC_section_64 * sectp = (MAC_section_64*)(currentp + sizeof(MAC_segment_command_64));

            // Loop through section headers
            for (isec1 = 1; isec1 <= nsect; isec1++, sectp++) {
               printf("\n\nSection %i: Name: %s, Segment: %s.", 
                  ++isec2, sectp->sectname, sectp->segname);
               printf("\n  Memory address 0x%X, Size 0x%X, File offset 0x%X"
                  "\n  Alignment %i, Reloc. ent. offset 0x%X, Num reloc. %i"
                  "\n  Flags 0x%X, reserved1 0x%X, reserved2 0x%X",
                  (uint32_t)sectp->addr, (uint32_t)sectp->size, sectp->offset, 1 << sectp->align,
                  sectp->reloff, sectp->nreloc, sectp->flags, 
                  sectp->reserved1, sectp->reserved2);

               if (sectp->nreloc && (options & DUMP_RELTAB)) {
                  // Dump relocations
                  printf("\n  Relocations:");
                  MAC_relocation_info * relp = (MAC_relocation_info*)(Buf() + sectp->reloff);
                  for (uint32_t r = 1; r <= sectp->nreloc; r++, relp++) {
                     if (relp->r_address & R_SCATTERED) {
                        // scattered relocation into (not used in 64-bit Mach-O)
                        MAC_scattered_relocation_info * scatp = (MAC_scattered_relocation_info*)relp;
                        if (!(scatp->r_type & MAC32_RELOC_PAIR)) {
                           printf ("\n    Unexpected scattered relocation. Offset: 0x%X, Value: 0x%X, Length: %i, Scat. Type: %s",
                              scatp->r_address, scatp->r_value, 1 << scatp->r_length, 
                              Lookup(Mac64RelocationTypeNames, scatp->r_type));
                           if (scatp->r_address < sectp->size) {
                              printf(", Inline: 0x%X", *(int32_t*)(Buf()+sectp->offset+scatp->r_address));
                           }
                        }
                        else {
                           // Second entry of a pair
                           printf ("\n     Offset2: 0x%X, Value2: 0x%X, Length2: %i",
                              scatp->r_address, scatp->r_value, 1 << scatp->r_length);
                        }
                        if (scatp->r_pcrel) printf(", PC relative");
                     }
                     else {
                        // non-scattered
                        if (relp->r_extern) printf ("\n    Symbol number %i, ", relp->r_symbolnum);
                        else printf ("\n    Section: %i, ", relp->r_symbolnum);
                        printf ("Offset: 0x%X, ", relp->r_address);
                        if (relp->r_pcrel) printf ("PC relative, ");
                        printf ("\n     Length: %i, Extern: %i, Type: %s",
                           1 << relp->r_length, relp->r_extern,
                           Lookup(Mac64RelocationTypeNames, relp->r_type));
                        if (relp->r_type != MAC64_RELOC_SUBTRACTOR && relp->r_address < sectp->size) {
                           // Print inline addend
                           if (relp->r_length == 3) {
                              // 8 bytes inline addend
                              printf(", Inline: 0x%08X%08X", *(int32_t*)(Buf()+sectp->offset+relp->r_address+4), *(int32_t*)(Buf()+sectp->offset+relp->r_address));
                           }
                           else {
                              // 4 bytes inline addend
                              printf(", Inline: 0x%08X", *(int32_t*)(Buf()+sectp->offset+relp->r_address));
                           }
                        }
                     }
                  }
               }
            }
         }
         currentp += cmdsize;
      }
   }

   // pointer to string table
   char * strtab = (char*)(Buf() + StringTabOffset); 
   // pointer to symbol table
   TMAC_nlist * symp0 = (TMAC_nlist*)(Buf() + SymTabOffset);

   // Dump symbol table
   if (options & DUMP_SYMTAB) {
      printf("\n\nSymbol table:");
      uint32_t i;
      TMAC_nlist * symp;

      // loop through symbol table
      for (i = 0, symp = symp0; i < SymTabNumber; i++, symp++) {

         // Header for first symbol of each category: (alphabetical within each category)
         if (i == ilocalsym && nlocalsym)   printf("\n\n  Local symbols:");
         if (i == iextdefsym && nextdefsym) printf("\n\n  Public symbols:");
         if (i == iundefsym && nundefsym)   printf("\n\n  External symbols:");

         if (symp->n_strx < StringTabSize && !(symp->n_type & MAC_N_STAB)) {
            printf("\n  %2i %s, Section %i, Value 0x%X\n    ",
               i, strtab + symp->n_strx, symp->n_sect, uint32_t(symp->n_value));
         }
         else {
            printf("\n  String table offset: 0x%X, Section %i, Value 0x%X\n    ",
               symp->n_strx, symp->n_sect, uint32_t(symp->n_value));
         }

         if (symp->n_type & MAC_N_STAB) {
            printf ("Debug symbol, stab = 0x%X, ", symp->n_type);
         }
         else {
            if (symp->n_type & MAC_N_PEXT) printf ("Private external (limited global scope), ");
            if (symp->n_type & MAC_N_EXT ) printf ("External, ");
            printf("%s", Lookup(MacSymbolTypeNames, symp->n_type & MAC_N_TYPE));
         }
         printf("\n    Reference type: %s,  Flags: ",
            Lookup(MacSymbolReferenceTypeNames, symp->n_desc & MAC_REF_TYPE));
         for (uint32_t f = MAC_REFERENCED_DYNAMICALLY; f <= MAC_N_WEAK_DEF; f <<= 1) {
            if (symp->n_desc & f) {
               printf("%s, ", Lookup(MacSymbolDescriptorFlagNames, f));
            }
         }
      }
      // Check if indirect symbol table is valid
      if (IndirectSymTabNumber && IndirectSymTabOffset + IndirectSymTabNumber*4 < this->GetDataSize()) {

         // Write indirect symbol table
         printf("\n\n  Indirect symbols:");

         // loop through indirect symbol table
         uint32_t * IndSymip = (uint32_t*)(Buf() + IndirectSymTabOffset);

         for (i = 0; i < IndirectSymTabNumber; i++, IndSymip++) {

            // Check if index within symbol table
            if (*IndSymip >= SymTabNumber) {
               //err.submit(2016); 
               printf("\n   Unknown(0x%X)", *IndSymip);
               continue;
            }
            // Find record
            TMAC_nlist * pIndSym = symp0 + *IndSymip;
            // Find name
            uint32_t StringIndex = pIndSym->n_strx;
            if (StringIndex >= StringTabSize) {
               err.submit(2035); continue;
            }
            // print name
            printf("\n   %s", strtab + StringIndex);
            // print type, etc.
            printf(", type 0x%X, sect %i, desc 0x%X, val 0x%X",
               pIndSym->n_type, pIndSym->n_sect, pIndSym->n_desc, uint32_t(pIndSym->n_value));
         }
      }
   }

   // Dump string table
   if (options & DUMP_STRINGTB) {
      printf("\n\nString table:");
      uint32_t str = 0, istr = 0;
      while (str < StringTabSize) {
         char * p = (char*)(Buf() + StringTabOffset + str);
         printf("\n  %3i: %s", str, p);
         istr++;  str += (uint32_t)strlen(p) + 1;
      }
   }

   printf("\n");
}


template <class TMAC_nlist, class MInt>
void MacSymbolTableBuilder<TMAC_nlist, MInt>::SortList() {
   // Sort the list
   if (sorted) return; // allready sorted

   MacSymbolRecord<TMAC_nlist> * p = (MacSymbolRecord<TMAC_nlist>*)Buf();     // Point to list

   // Simple Bubble sort:
   int i, j;  const char * s1, * s2;
   MacSymbolRecord<TMAC_nlist> temp;
   for (i = 0; i < (int)GetNumEntries(); i++) {
      for (j = 0; j < (int)GetNumEntries() - i - 1; j++) {
         s1 = StringBuffer.Buf() + p[j].Name;
         s2 = StringBuffer.Buf() + p[j+1].Name;
         if (strcmp(s1, s2) > 0) {
            // Swap records
            temp = p[j];
            p[j] = p[j+1];
            p[j+1] = temp;
         }
      }
   }
   sorted = 1;
}

template <class TMAC_nlist, class MInt>
int MacSymbolTableBuilder<TMAC_nlist, MInt>::TranslateIndex(int OldIndex) {
   // Translate old index to new index (0-based)
   // Returns -1 if not found

   // Don't sort list. This would change indices if __mh_executer_header added later
   // if (!sorted) SortList();

   MacSymbolRecord<TMAC_nlist> * p = (MacSymbolRecord<TMAC_nlist>*)Buf();     // Point to list

   // Search through list for OldIndex
   for (int i = 0; i < (int)GetNumEntries(); i++) {
      if (p[i].OldIndex == OldIndex) {
         // Match found
         return i;
      }
   }
   // Not found
   return -1;
}

template <class TMAC_nlist, class MInt>
void MacSymbolTableBuilder<TMAC_nlist, MInt>::StoreList(CMemoryBuffer * SymbolTable, CMemoryBuffer * StringTable) {
   // Store sorted list in buffers

   // Don't sort list unless commanded to do so. Will mess up indices
   // if (!sorted) SortList();                           // Make sure list is sorted

   MacSymbolRecord<TMAC_nlist> * p = (MacSymbolRecord<TMAC_nlist>*)Buf();     // Point to list

   for (uint32_t i = 0; i < GetNumEntries(); i++, p++) {
      p->n_strx = StringTable->PushString(StringBuffer.Buf()+p->Name);   // Put name in string table
      SymbolTable->Push(p, sizeof(TMAC_nlist));        // Store only the TMAC_nlist part of the record in SymbolTable
   }
}

template <class TMAC_nlist, class MInt>
int MacSymbolTableBuilder<TMAC_nlist, MInt>::Search(const char * name) {
   // Search for name. Return -1 if not found.
   MacSymbolRecord<TMAC_nlist> * p = (MacSymbolRecord<TMAC_nlist>*)Buf();     // Point to list
   for (int i = 0; i < (int)GetNumEntries(); i++) {
      if (strcmp(StringBuffer.Buf()+p[i].Name, name) == 0) {
         return i;  // Found
      }
   }
   return -1;   // Not found
}

template <class TMAC_nlist, class MInt>
MacSymbolRecord<TMAC_nlist> & MacSymbolTableBuilder<TMAC_nlist, MInt>::operator[] (uint32_t i) {
   // Access member
   uint32_t Offset = i * sizeof(MacSymbolRecord<TMAC_nlist>);
   if (i + sizeof(MacSymbolRecord<TMAC_nlist>) > this->GetDataSize()) {
      err.submit(9003);  Offset = 0;
   }
   return Get<MacSymbolRecord<TMAC_nlist> >(Offset);
}

// Convert
/*template <class TMAC_header, class TMAC_segment_command, class TMAC_section, class TMAC_nlist, class MInt>
void MACHOParser<MACSTRUCTURES>::Disassemble() {
   // Do the conversion

   // Check cpu type
   switch (this->FileHeader.cputype) {
   case MAC_CPU_TYPE_I386:
      this->WordSize = 32;  break;

   case MAC_CPU_TYPE_X86_64:
      this->WordSize = 64;  break;

   default:
      // Wrong type
      err.submit(2011, "");  return;
   }

   // check object/executable file type
   uint32_t ExeType;                     // File type: 0 = object, 1 = position independent shared object, 2 = executable

   switch (this->FileHeader.filetype) {
   case MAC_OBJECT:   // Relocatable object file
      ExeType = 0;  break;

   case MAC_FVMLIB:   // fixed VM shared library file
   case MAC_DYLIB:    // dynamicly bound shared library file
   case MAC_BUNDLE:   // part of universal binary
      ExeType = 1;  break;

   case MAC_EXECUTE:  // demand paged executable file
   case MAC_CORE:     // core file
   case MAC_PRELOAD:  // preloaded executable file
      ExeType = 2;  break;

   default:  // Other types
      err.submit(2011, "");  return;
   }

   // Tell disassembler
   // Disasm.Init(ExeType, this->ImageBase);
   Disasm.Init(ExeType, 0);

   Disasm.SetOutType(OutSubType);

   // Make Sections list and relocations list
   MakeSectionList();

   // Make Symbols list in Disasm
   MakeSymbolList();

   // Make relocations list in Disasm
   MakeRelocations();

   // Make symbol entries for imported symbols
   MakeImports();

   Disasm.Go();                                  // Disassemble

   *this << Disasm.OutFile;                      // Take over output file from Disasm
}*/

// MakeSectionList

template <class TMAC_header, class TMAC_segment_command, class TMAC_section, class TMAC_nlist, class MInt>
void MACHOParser<MACSTRUCTURES>::MakeSectionList(CDisassembler *Disasm) {
   // Make Sections list and Relocations list in Disasm

   uint32_t icmd;                        // Command index
   int32_t  isec1;                       // Section index within segment
   int32_t  isec2 = 0;                   // Section index global
   int32_t  nsect;                       // Number of sections in segment
   uint32_t cmd;                         // Load command
   uint32_t cmdsize;                     // Command size

   StringBuffer.Push(0, 1);            // Initialize string buffer

   // Pointer to current position
   uint8_t * currentp = (uint8_t*)(this->Buf() + sizeof(TMAC_header));

   // Loop through file commands
   for (icmd = 1; icmd <= this->FileHeader.ncmds; icmd++) {
      cmd     = ((MAC_load_command*)currentp) -> cmd;
      cmdsize = ((MAC_load_command*)currentp) -> cmdsize;

      if (cmd == MAC_LC_SEGMENT || cmd == MAC_LC_SEGMENT_64) {
         // This is a segment command
         if ((this->WordSize == 64) ^ (cmd == MAC_LC_SEGMENT_64)) {
            // Inconsistent word size
            err.submit(2320);  break;
         }

         // Number of sections in segment
         nsect   = ((TMAC_segment_command*)currentp) -> nsects;

         // Find first section header
         TMAC_section * sectp = (TMAC_section*)(currentp + sizeof(TMAC_segment_command));

         // Loop through section headers
         for (isec1 = 1; isec1 <= nsect; isec1++, sectp++) {

            if (sectp->offset >= this->GetDataSize()) {
               // points outside file
               err.submit(2035);  break;
            }

            // Get section properties
            isec2++;                   // Section number
            uint32_t MacSectionType = sectp->flags & MAC_SECTION_TYPE;
            uint8_t * Buffer = (uint8_t*)(this->Buf()) + sectp->offset;
            uint32_t TotalSize = (uint32_t)sectp->size;
            uint32_t InitSize = TotalSize;
            if (MacSectionType == MAC_S_ZEROFILL) InitSize = 0;
            uint32_t SectionAddress = (uint32_t)sectp->addr;
            uint32_t Align = sectp->align;

            // Get section type
            // 0 = unknown, 1 = code, 2 = data, 3 = uninitialized data, 4 = constant data
            uint32_t Type = 0;
            if (sectp->flags & (MAC_S_ATTR_PURE_INSTRUCTIONS | MAC_S_ATTR_SOME_INSTRUCTIONS)) {
               Type = 1; // code
            }
            else if (MacSectionType == MAC_S_ZEROFILL) {
               Type = 3; // uninitialized data
            }
            else {
               Type = 2; // data or anything else
            }

            // Make section name by combining segment name and section name
            uint32_t NameOffset = StringBuffer.Push(sectp->segname, (uint32_t)strlen(sectp->segname)); // Segment name
            StringBuffer.Push(".", 1);  // Separate by dot
            StringBuffer.PushString(sectp->sectname);  // Section name
            char * Name = StringBuffer.Buf() + NameOffset;

            // Save section record
            Disasm->AddSection(Buffer, InitSize, TotalSize, SectionAddress, Type, Align, this->WordSize, Name);

            // Save information about relocation list for this section
            if (sectp->nreloc) {
               MAC_SECT_WITH_RELOC RelList = {isec2, sectp->offset, sectp->nreloc, sectp->reloff};
               RelocationQueue.Push(RelList);
            }

            // Find import tables
            if (MacSectionType >= MAC_S_NON_LAZY_SYMBOL_POINTERS && MacSectionType <= MAC_S_LAZY_SYMBOL_POINTERS /*?*/) {
               // This is an import table
               ImportSections.Push(sectp);
            }
            // Find literals sections
            if (MacSectionType == MAC_S_4BYTE_LITERALS || MacSectionType == MAC_S_8BYTE_LITERALS) {
               // This is a literals section
               ImportSections.Push(sectp);
            }
         }
      }
      currentp += cmdsize;
   }
}

// MakeRelocations
template <class TMAC_header, class TMAC_segment_command, class TMAC_section, class TMAC_nlist, class MInt>
void MACHOParser<MACSTRUCTURES>::MakeRelocations(CDisassembler *Disasm) {
   // Make relocations for object and executable files
   uint32_t iqq;                         // Index into RelocationQueue = table of relocation tables
   uint32_t irel;                        // Index into relocation table
   int32_t  Section;                     // Section index
   uint32_t SectOffset;                  // File offset of section binary data
   uint32_t NumReloc;                    // Number of relocations records for this section
   uint32_t ReltabOffset;                // File offset of relocation table for this section
   uint32_t SourceOffset;                // Section-relative offset of relocation source
   uint32_t SourceSize;                  // Size of relocation source
   int32_t  Inline = 0;                  // Inline addend at relocation source
   uint32_t TargetAddress;               // Base-relative address of relocation target
   uint32_t TargetSymbol;                // Symbol index of target
   //int32_t  TargetSection;             // Target section
   int32_t  Addend;                      // Offset to add to target
   uint32_t ReferenceAddress;            // Base-relative address of reference point
   uint32_t ReferenceSymbol;             // Symbol index of reference point
   uint32_t R_Type;                      // Relocation type in Mach-O record
   uint32_t R_Type2;                     // Relocation type of second entry of a pair
   uint32_t R_PCRel;                     // Relocation is self-relative
   uint32_t RelType = 0;                 // Relocation type translated to disasm record

   // Loop through RelocationQueue. There is one entry for each relocation table
   for (iqq = 0; iqq < RelocationQueue.GetNumEntries(); iqq++) {
      Section = RelocationQueue[iqq].Section;              // Section index
      SectOffset = RelocationQueue[iqq].SectOffset;        // File offset of section binary data
      NumReloc = RelocationQueue[iqq].NumReloc;            // Number of relocations records for this section
      ReltabOffset = RelocationQueue[iqq].ReltabOffset;    // File offset of relocation table for this section

      if (NumReloc == 0) continue;

      if (ReltabOffset == 0 || ReltabOffset >= this->GetDataSize() || ReltabOffset + NumReloc*sizeof(MAC_relocation_info) >= this->GetDataSize()) {
         // Pointer out of range
         err.submit(2035);  return;
      }

      // pointer to relocation info
      union {
         MAC_relocation_info * r;
         MAC_scattered_relocation_info * s;
         char * b;
      } relp;
      // Point to first relocation entry
      relp.b = this->Buf() + ReltabOffset;

      // Loop through relocation table
      for (irel = 0; irel < NumReloc; irel++, relp.r++) {

         // Set defaults
         ReferenceAddress = ReferenceSymbol = TargetSymbol = Addend = 0;

         if (relp.s->r_scattered) {
            // scattered relocation entry
            SourceOffset  = relp.s->r_address;
            SourceSize    = 1 << relp.s->r_length;
            R_PCRel       = relp.s->r_pcrel;
            R_Type        = relp.s->r_type;
            TargetAddress = relp.s->r_value;
            TargetSymbol  = 0;
         }
         else {
            // non-scattered relocation entry
            SourceOffset  = relp.r->r_address;
            SourceSize    = 1 << relp.r->r_length;
            R_PCRel       = relp.r->r_pcrel;
            R_Type        = relp.r->r_type;
            if (relp.r->r_extern) {
               TargetSymbol = relp.r->r_symbolnum + 1;
            }
            else {
               //TargetSection = relp.r->r_symbolnum;
            }
            TargetAddress = 0;
         }

         if (this->WordSize == 32 && (R_Type == MAC32_RELOC_SECTDIFF || R_Type == MAC32_RELOC_LOCAL_SECTDIFF)) {
            // This is the first of a pair of relocation entries.
            // Get second entry containing reference point
            irel++;  relp.r++;
            if (irel >= NumReloc) {err.submit(2050); break;}

            if (relp.s->r_scattered) {
               // scattered relocation entry
               R_Type2          = relp.s->r_type;
               ReferenceAddress = relp.s->r_value;
               ReferenceSymbol  = 0;
            }
            else {
               // non-scattered relocation entry
               ReferenceSymbol  = relp.r->r_symbolnum + 1;
               R_Type2          = relp.r->r_type;
               ReferenceAddress = 0;
            }
            if (R_Type2 != MAC32_RELOC_PAIR) {err.submit(2050); break;}

            if (ReferenceSymbol == 0) {
               // Reference point has no symbol index. Make one
               ReferenceSymbol = Disasm->AddSymbol(ASM_SEGMENT_IMGREL, ReferenceAddress, 0, 0, 2, 0, 0);
            }
         }

         if (this->WordSize == 64 && R_Type == MAC64_RELOC_SUBTRACTOR) {
            // This is the first of a pair of relocation entries.
            // The first entry contains reference point to subtract
            irel++;  relp.r++;
            if (irel >= NumReloc || relp.s->r_scattered || relp.r->r_type != MAC64_RELOC_UNSIGNED) {
               err.submit(2050); break;
            }
            ReferenceSymbol = TargetSymbol;
            R_PCRel       = relp.r->r_pcrel;
            if (relp.r->r_extern) {
               TargetSymbol = relp.r->r_symbolnum + 1;
            }
            else {
               //TargetSection = relp.r->r_symbolnum;
            }
            TargetAddress = 0;
         }

         // Get inline addend or address
         if (SectOffset + SourceOffset < this->GetDataSize()) {
            switch (SourceSize) {
            case 1:
               Inline = CMemoryBuffer::Get<char>(SectOffset+SourceOffset);
               // (this->Get<char> doesn't work on Gnu compiler 4.0.1)
               break;
            case 2:
               Inline = CMemoryBuffer::Get<int16_t>(SectOffset+SourceOffset);
               break;
            case 4: case 8:
               Inline = CMemoryBuffer::Get<int32_t>(SectOffset+SourceOffset);
               break;
            default:
               Inline = 0;
            }
         }

         if (this->WordSize == 32) {
            // Calculate target address and addend, 32 bit system
            if (R_Type == MAC32_RELOC_SECTDIFF || R_Type == MAC32_RELOC_LOCAL_SECTDIFF) {
               // Relative to reference point
               // Compensate for inline value = TargetAddress - ReferenceAddress;
               Addend = ReferenceAddress - TargetAddress;
            }
            else if (R_PCRel) {
               // Self-relative
               TargetAddress += Inline + SourceOffset + SourceSize;
               Addend = -4 - Inline;
            }
            else {
               // Direct
               TargetAddress += Inline;
               Addend = -Inline;
            }
         }

         if (TargetSymbol == 0) {
            // Target has no symbol index. Make one
            TargetSymbol = Disasm->AddSymbol(ASM_SEGMENT_IMGREL, TargetAddress, 0, 0, 2, 0, 0);
         }

         // Find type
         if (this->WordSize == 32) {
            switch (R_Type) {
            case MAC32_RELOC_VANILLA:
               // Direct or self-relative
               RelType = R_PCRel ? 2 : 1;
               break;

            case MAC32_RELOC_SECTDIFF: case MAC32_RELOC_LOCAL_SECTDIFF:
               // Relative to reference point
               RelType = 0x10;
               break;

            case MAC32_RELOC_PB_LA_PTR:
               // Lazy pointer
               RelType = 0x41; //??
               break;

            default:
               // Unknown type
               err.submit(2030, R_Type);
               break;
            }
         }
         else { // 64-bit relocation types
            switch (R_Type) {
            case MAC64_RELOC_UNSIGNED:
               // Absolute address
               RelType = 1;  
               break;
            case MAC64_RELOC_BRANCH:
               // Signed 32-bit displacement with implicit -4 addend
            case MAC64_RELOC_SIGNED:
               // Signed 32-bit displacement with implicit -4 addend
            case MAC64_RELOC_SIGNED_1:
               // Signed 32-bit displacement with implicit -4 addend and explicit -1 addend
            case MAC64_RELOC_SIGNED_2:
               // Signed 32-bit displacement with implicit -4 addend and explicit -2 addend
            case MAC64_RELOC_SIGNED_4:
               // Signed 32-bit displacement with implicit -4 addend and explicit -4 addend
               RelType = 2;  Addend -= 4;  
               break;
            case MAC64_RELOC_GOT:
               // Absolute or relative reference to GOT?
               // RelType = 0x1001; break;
            case MAC64_RELOC_GOT_LOAD: 
               // Signed 32-bit displacement to GOT
               RelType = 0x1002;  Addend -= 4;  
               break;
            case MAC64_RELOC_SUBTRACTOR:
               // 32 or 64 bit relative to arbitrary reference point
               RelType = 0x10;  
               break;
            default:
               // Unknown type
               err.submit(2030, R_Type);
               break;
            }
         }

         // Make relocation record
         Disasm->AddRelocation(Section, SourceOffset, Addend, 
            RelType, SourceSize, TargetSymbol, ReferenceSymbol);
      }
   }
}

// MakeSymbolList
template <class TMAC_header, class TMAC_segment_command, class TMAC_section, class TMAC_nlist, class MInt>
void MACHOParser<MACSTRUCTURES>::MakeSymbolList(CDisassembler *Disasm) {
   // Make Symbols list in Disasm
   uint32_t symi;                        // Symbol index, 0-based
   uint32_t symn = 0;                    // Symbol number, 1-based
   char * Name;                        // Symbol name
   int32_t  Section;                     // Section number (1-based). 0 = external, ASM_SEGMENT_ABSOLUTE = absolute, ASM_SEGMENT_IMGREL = image-relative
   uint32_t Offset;                      // Offset into section. (Value for absolute symbol)
   uint32_t Type;                        // Symbol type. Use values listed above for SOpcodeDef operands. 0 = unknown type
   uint32_t Scope;                       // 1 = function local, 2 = file local, 4 = public, 8 = weak public, 0x10 = communal, 0x20 = external

   // pointer to string table
   char * strtab = (char*)(this->Buf() + this->StringTabOffset); 

   // loop through symbol table
   TMAC_nlist * symp = (TMAC_nlist*)(this->Buf() + this->SymTabOffset);
   for (symi = 0; symi < this->SymTabNumber; symi++, symp++) {

      if (symp->n_type & MAC_N_STAB) {
         // Debug symbol. Ignore
         continue;
      }

      if (symp->n_strx < this->StringTabSize) {
         // Normal symbol
         Section = symp->n_sect;
         Offset  = (uint32_t)symp->n_value;
         Name    = strtab + symp->n_strx;
         symn    = symi + 1;           // Convert 0-based to 1-based index

         // Get scope
         if (symi < this->iextdefsym) {
            // Local
            Scope = 2;
         }
         else if (Section && (symp->n_type & MAC_N_TYPE) != MAC_N_UNDF) {
            // Public
            Scope = 4;
         }
         else {
            // External
            Scope = 0x20;
         }
         // Check if absolute
         if ((symp->n_type & MAC_N_TYPE) == MAC_N_ABS) {
            // Absolute
            Section = ASM_SEGMENT_ABSOLUTE;  Scope = 4;
         }
         // Check if weak/communal
         if (symp->n_type & MAC_N_PEXT) {
            // Communal?
            Scope = 0x10;
         }
         else if (symp->n_desc & MAC_N_WEAK_DEF) {
            // Weak public
            Scope = 8;
         }
         else if (symp->n_desc & MAC_N_WEAK_REF) {
            // Weak external (not supported by disassembler)
            Scope = 0x20;
         }
         // Get type
         Type = 0;

         // Offset is always based, not section-relative
         if (Section > 0) Section = ASM_SEGMENT_IMGREL;

         // Add symbol to diassembler
         Disasm->AddSymbol(Section, Offset, 0, Type, Scope, symn, Name);
      }
   }
}

template <class TMAC_header, class TMAC_segment_command, class TMAC_section, class TMAC_nlist, class MInt>
void MACHOParser<MACSTRUCTURES>::MakeImports(CDisassembler *Disasm) {
   // Make symbol entries for all import tables
   uint32_t isec;                        // Index into ImportSections list
   uint32_t SectionType;                 // Section type
   TMAC_section * sectp;                // Pointer to section
   TMAC_nlist * symp0 = (TMAC_nlist*)(this->Buf() + this->SymTabOffset); // Pointer to symbol table
   uint32_t * IndSymp = (uint32_t*)(this->Buf() + this->IndirectSymTabOffset); // Pointer to indirect symbol table
   uint32_t iimp;                        // Index into import table
   char * strtab = (char*)(this->Buf() + this->StringTabOffset);    // pointer to string table

   // Loop through import sections
   for (isec = 0; isec < ImportSections.GetNumEntries(); isec++) {
      // Pointer to section header
      sectp = ImportSections[isec];
      // Section type
      SectionType = sectp->flags & MAC_SECTION_TYPE;
      if (SectionType >= MAC_S_NON_LAZY_SYMBOL_POINTERS && SectionType <= MAC_S_MOD_INIT_FUNC_POINTERS) {

         // This section contains import tables
         // Entry size in import table
         uint32_t EntrySize = sectp->reserved2;
         // Entry size is 4 if not specified
         if (EntrySize == 0) EntrySize = 4;
         // Number of entries
         uint32_t NumEntries = (uint32_t)sectp->size / EntrySize;
         // Index into indirect symbol table entry of first entry in import table
         uint32_t Firsti = sectp->reserved1;
         // Check if within range
         if (Firsti + NumEntries > this->IndirectSymTabNumber) {
            // This occurs when disassembling 64-bit Mach-O executable
            // I don't know how to interpret the import table
            err.submit(1054);  continue;
         }
         // Loop through import table entries
         for (iimp = 0; iimp < NumEntries; iimp++) {
            // Address of import table entry
            uint32_t ImportAddress = (uint32_t)sectp->addr + iimp * EntrySize;
            // Get symbol table index from indirect symbol table
            uint32_t symi = IndSymp[iimp + Firsti];
            // Check index
            if (symi == 0x80000000) {
               // This value occurs. Maybe it means ignore?
               continue;
            }
            // Check if index within symbol table
            if (symi >= this->SymTabNumber) {
               err.submit(1052); continue;
            }
            // Find name
            uint32_t StringIndex = symp0[symi].n_strx;
            if (StringIndex >= this->StringTabSize) {
               err.submit(1052); continue;
            }
            const char * Name = strtab + StringIndex;
            // Name of .so to import from
            const char * DLLName = "?";

            // Symbol type
            uint32_t Type = 0;
            switch (SectionType) {
         case MAC_S_NON_LAZY_SYMBOL_POINTERS:
         case MAC_S_LAZY_SYMBOL_POINTERS:
            // pointer to symbol
            Type = 3;  break;
         case MAC_S_SYMBOL_STUBS:
            // jump to function
            Type = 0x83;  
            // Make appear as direct call
            DLLName = 0;
            break;
         case MAC_S_MOD_INIT_FUNC_POINTERS:
            // function pointer?
            Type = 0x0C;  break;
            }

            // Make symbol record for disassembler
            Disasm->AddSymbol(ASM_SEGMENT_IMGREL, ImportAddress, 4, Type, 2, 0, Name, DLLName);
         }
      }
      else if (SectionType == MAC_S_4BYTE_LITERALS) {
         // Section contains 4-byte float constants. 
         // Make symbol
         Disasm->AddSymbol(ASM_SEGMENT_IMGREL, (uint32_t)sectp->addr, 4, 0x43, 2, 0, "Float_constants");
      }
      else if (SectionType == MAC_S_8BYTE_LITERALS) {
         // Section contains 8-byte double constants. 
         // Make symbol
         Disasm->AddSymbol(ASM_SEGMENT_IMGREL, (uint32_t)sectp->addr, 8, 0x44, 2, 0, "Double_constants");
      }
   }
}

// Make template instances for 32 and 64 bits
template class MACHOParser<MAC32STRUCTURES>;
template class MACHOParser<MAC64STRUCTURES>;
template class MacSymbolTableBuilder<MAC_nlist_32, int32_t>;
template class MacSymbolTableBuilder<MAC_nlist_64, int64_t>;
