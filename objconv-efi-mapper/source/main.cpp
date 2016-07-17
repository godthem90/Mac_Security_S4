#include "stdafx.h"

char *input_file_name = 0;
char *output_file_name = 0;

bool CorrectIntegerTypes() {
   if (
      sizeof(uint8) != 1 ||
      sizeof(int16) != 2 ||
      sizeof(int32) != 4 ||
      sizeof(int64) != 8) {
	   return false;
   }

   return true;
}

bool CorrectEndianness() {
   static uint8 bytes[4] = {1, 2, 3, 4};
   if (*(uint32*)bytes != 0x04030201) {
      return false;
   }
   return true;
}

void usage()
{
	printf("./efi-mapper inputfile\n");
}

int main(int argc, char * argv[]) {
	if(!CorrectIntegerTypes())
	{
		fprintf(stderr, "[error] Incorrect Integer Type\n");
		return -1;
	}
	if(!CorrectEndianness())
	{
		fprintf(stderr, "[error] Incorrect Endian (big-endian)\n");
		return -1;
	}

	if(argc != 2)
	{
		fprintf(stderr, "[error] Wrong Usage\n");
		usage();
		return -1;
	}

	input_file_name = argv[1];

	CFileBuffer input_buffer(input_file_name);
	input_buffer.Read();

	Disassembler disassembler;
	input_buffer >> disassembler;
	disassembler.Parse();
	disassembler.Dump();
	disassembler.Free();

	return 0;
}

/*
void CMain::Go() {
   if ((cmd.FileOptions & CMDL_FILE_OUTPUT) && OutputFileName) {
      // There is an output file to write
      FileName = OutputFileName;       // Output file name
      Write();                         // Write output file
   }
}

void CConverter::COF2ASM() {
   // Disassemble COFF file
   CCOF2ASM conv;                      // Make object for conversion 
   *this >> conv;                      // Give it my buffer
   conv.ParseFile();                   // Parse file buffer
   if (err.Number()) return;           // Return if error
   conv.Convert();                     // Convert
   *this << conv;                      // Take back converted buffer
}

void CConverter::MAC2ASM() {
   // Disassemble Mach-O file
   if (WordSize == 32) {
      // Make instance of converter, 32 bit template
      CMAC2ASM<MAC32STRUCTURES> conv;
      *this >> conv;                      // Give it my buffer
      conv.ParseFile();                   // Parse file buffer
      if (err.Number()) return;           // Return if error
      conv.Convert();                     // Convert
      *this << conv;                      // Take back converted buffer
   }
   else {
      // Make instance of converter, 64 bit template
      CMAC2ASM<MAC64STRUCTURES> conv;
      *this >> conv;                      // Give it my buffer
      conv.ParseFile();                   // Parse file buffer
      if (err.Number()) return;           // Return if error
      conv.Convert();                     // Convert
      *this << conv;                      // Take back converted buffer
   }
}

void CConverter::Go() {
	// File conversion requested
	if (cmd.DesiredWordSize == 0) cmd.DesiredWordSize = WordSize;
	if (WordSize && WordSize != cmd.DesiredWordSize) {
		err.submit(2012, WordSize, cmd.DesiredWordSize); // Cannot convert word size
		return;
	}
	if (err.Number()) return;        // Return if error

	// Choose conversion
	switch (FileType) {

		// Conversion from COFF
		case FILETYPE_COFF:
			COF2ASM();                 // Disassemble

			break;

			// Conversions from Mach-O
		case FILETYPE_MACHO_LE:

			MAC2ASM();                 // Disassemble

			break;

			// Conversion from other types
		default:
			err.submit(2006, FileName, GetFileFormatName(FileType));   // Conversion of this file type not supported
	}
}*/
