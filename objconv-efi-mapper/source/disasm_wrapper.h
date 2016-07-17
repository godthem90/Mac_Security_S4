#define FILETYPE_COFF              1         // Windows COFF/PE file
#define FILETYPE_OMF               2         // Windows OMF file
#define FILETYPE_ELF               3         // Linux or BSD ELF file
#define FILETYPE_MACHO_LE          4         // Mach-O file, little endian
#define FILETYPE_MACHO_BE          5         // Mach-O file, big endian
#define FILETYPE_DOS               6         // DOS file
#define FILETYPE_WIN3X             7         // Windows 3.x file
#define IMPORT_LIBRARY_MEMBER   0x10         // Member of import library, Windows
#define FILETYPE_MAC_UNIVBIN    0x11         // Macintosh universal binary
#define FILETYPE_MS_WPO         0x20         // Object file for whole program optimization, MS
#define FILETYPE_INTEL_WPO      0x21         // Object file for whole program optimization, Intel
#define FILETYPE_WIN_UNKNOWN    0x29         // Unknown subtype, Windows
#define FILETYPE_ASM           0x100         // Disassembly output
#define FILETYPE_LIBRARY      0x1000         // UNIX-style library/archive
#define FILETYPE_OMFLIBRARY   0x2000         // OMF-style  library

// Constants for dump options
#define DUMP_NONE               0x0000     // Dump nothing
#define DUMP_FILEHDR            0x0001     // Dump file header
#define DUMP_SECTHDR            0x0002     // Dump section headers
#define DUMP_SYMTAB             0x0010     // Dump symbol table
#define DUMP_RELTAB             0x0020     // Dump relocation table
#define DUMP_STRINGTB           0x0040     // Dump string table
#define DUMP_COMMENT            0x0080     // Dump comment records

// Constants for subtypes
#define SUBTYPE_MASM                 0       // Disassembly MASM/TASM
#define SUBTYPE_YASM                 1       // Disassembly NASM/YASM
#define SUBTYPE_GASM                 2       // Disassembly GAS(Intel)

class Disassembler : public CFileBuffer
{
public:
	Disassembler();
	~Disassembler();
	void Parse();
	void Dump();
	void Disassemble();
	void Free();

private:
	int Parsed;
	COFFDisassembler *coff;
	MACHODisassembler<MAC32STRUCTURES> *macho32;
	MACHODisassembler<MAC64STRUCTURES> *macho64;
	
	int  GetFileType();
	void ParseCOF();
	void ParseMACHO();
	void DumpCOF();
	void DumpMACHO();
	void DisassembleCOF();
	void DisassembleMACHO();
};
