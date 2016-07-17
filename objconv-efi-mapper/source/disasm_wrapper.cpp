#include "stdafx.h"

Disassembler::Disassembler()
{
	memset(this, 0, sizeof(*this));
}

Disassembler::~Disassembler()
{
	Free();
}

int Disassembler::GetFileType() {
    if (FileType) return FileType;
    if (!DataSize) return -1;
    if (!Buf()) return -1;

    if (Get<uint32>(0) == MAC_MAGIC_32) {
        // Mach-O 32 little endian
        FileType = FILETYPE_MACHO_LE;
        WordSize = 32;
        Executable = Get<MAC_header_32>(0).filetype != MAC_OBJECT;
    }
    else if (Get<uint32>(0) == MAC_MAGIC_64) {
        // Mach-O 64 little endian
        FileType = FILETYPE_MACHO_LE;
        WordSize = 64;
        Executable = Get<MAC_header_64>(0).filetype != MAC_OBJECT;
    }
    else if (Get<uint32>(0) == MAC_CIGAM_32) {
        // Mach-O 32 big endian
        FileType = FILETYPE_MACHO_BE;
        WordSize = 32;
    }
    else if (Get<uint32>(0) == MAC_CIGAM_64) {
        // Mach-O 64 big endian
        FileType = FILETYPE_MACHO_BE;
        WordSize = 64;
    }
    else if (Get<uint16>(0) == PE_MACHINE_I386) {
        // COFF/PE 32
        FileType = FILETYPE_COFF;
        WordSize = 32;
        Executable = (Get<SCOFF_FileHeader>(0).Flags & PE_F_EXEC) != 0;
    }
    else if (Get<uint16>(0) == PE_MACHINE_X8664) {
        // COFF64/PE32+
        FileType = FILETYPE_COFF;
        WordSize = 64;
        Executable = (Get<SCOFF_FileHeader>(0).Flags & PE_F_EXEC) != 0;
    }
    else if ((Get<uint16>(0) & 0xFFF9) == 0x5A49) {
        // DOS file or file with DOS stub
        FileType = FILETYPE_DOS;
        WordSize = 16;
        Executable = 1;
        uint32 Signature = Get<uint32>(0x3C);
        if (Signature + 8 < DataSize) {
            if (Get<uint16>(Signature) == 0x454E) {
                // Windows 3.x file
                FileType = FILETYPE_WIN3X;
            }
            else if (Get<uint16>(Signature) == 0x4550) {
                // COFF file
                uint16 MachineType = Get<uint16>(Signature + 4);
                if (MachineType == PE_MACHINE_I386) {
                    FileType = FILETYPE_COFF;
                    WordSize = 32;
                }
                else if (MachineType == PE_MACHINE_X8664) {
                    FileType = FILETYPE_COFF;
                    WordSize = 64;
                }
            }
        }
    }
    else {
        int utype = Get<uint32>(0);        
		fprintf(stderr, "[error] Unknown Object Type\n");
        FileType = 0;
		return -1;
    }
    return FileType;
}

void Disassembler::Parse()
{
	if(Parsed)
		return;

	int obj_type = GetFileType();
	if(obj_type == -1)
	{
		fprintf(stderr,"[error] Determine Object Type Failed\n");
		return;
	}

	switch(obj_type) {
		case FILETYPE_COFF:
			ParseCOF();
			break;

		case FILETYPE_MACHO_LE:
			ParseMACHO();
			break;

		default:
			fprintf(stderr,"[error] Unsupported Object Type For Parsing\n");
	}
}

void Disassembler::ParseCOF() {
	coff = new COFFDisassembler();
	*this >> *coff;                       // Give it my buffer
	if(coff->ParseFile() == -1)
	{
		Parsed = 0;
		return;
	}
	Parsed = 1;
	//*this << *coff;                       // Take back my buffer
}

void Disassembler::ParseMACHO() {
	int ret;
	if (WordSize == 32) {
		macho32 = new MACHODisassembler<MAC32STRUCTURES>();
		*this >> *macho32;                     // Give it my buffer
		ret = macho32->ParseFile();                  // Parse file buffer
		//macho32.Dump(cmd.DumpOptions);        // Dump file
		//*this << macho;                     // Take back my buffer
	}
	else {
		macho64 = new MACHODisassembler<MAC64STRUCTURES>();
		*this >> *macho64;                     // Give it my buffer
		ret = macho64->ParseFile();                  // Parse file buffer
		//macho64.Dump(cmd.DumpOptions);        // Dump file
		//*this << *macho;                     // Take back my buffer
	}

	if(ret == -1)
	{
		Parsed = 0;
		return;
	}
	Parsed = 1;
}

void Disassembler::Dump()
{
	if(!Parsed)
	{
		fprintf(stderr, "[error] Dump Before Parse Can't be Executed\n");
		return;
	}

	int obj_type = GetFileType();
	if(obj_type == -1)
	{
		fprintf(stderr,"[error] Determine Object Type Failed\n");
		return;
	}

	switch(obj_type) {
		case FILETYPE_COFF:
			DumpCOF();
			break;

		case FILETYPE_MACHO_LE:
			DumpMACHO();
			break;

		default:
			fprintf(stderr,"[error] Unsupported Object Type For Dumping\n");
	}
}

void Disassembler::DumpCOF()
{
	int DumpOptions = 0;
	DumpOptions |= DUMP_FILEHDR;
	DumpOptions |= DUMP_SECTHDR;
	coff->Dump(DumpOptions);
}

void Disassembler::DumpMACHO()
{
	int DumpOptions = 0;
	DumpOptions |= DUMP_FILEHDR;
	DumpOptions |= DUMP_SECTHDR;

	if (WordSize == 32)
		macho32->Dump(DumpOptions);
	else
		macho64->Dump(DumpOptions);
}

void Disassembler::Free()
{
	if(Parsed)
	{
		if(coff) {delete coff; coff = 0;}
		if(macho32) {delete macho32; macho32 = 0;}
		if(macho64) {delete macho64; macho64 = 0;}
		Parsed = 0;
	}
}
