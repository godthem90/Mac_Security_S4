/****************************   main.cpp   **********************************
* Author:        Agner Fog
* Date created:  2006-07-26
* Last modified: 2011-10-28
* Project:       objconv
* Module:        main.cpp
* Description:
* Objconv is a portable C++ program for converting object file formats.
* Compile for console mode on any platform.
*
* Module main contains the program entry
*
* Copyright 2006-2011 GNU General Public License http://www.gnu.org/licenses
*****************************************************************************/

#include "stdafx.h"

char *InputFile = 0;
char *OutputFile = 0;

// Check that integer type definitions are correct.
// Will generate an error message if the compiler makes the integer types 
// with wrong size.
static void CheckIntegerTypes() {
   if (
      sizeof(uint8) != 1 ||
      sizeof(int16) != 2 ||
      sizeof(int32) != 4 ||
      sizeof(int64) != 8) {
      err.submit(9001);                // Make error message if type definitions are wrong
   }
}

// Check that we are running on a machine with little-endian memory organization
static void CheckEndianness() {
   static uint8 bytes[4] = {1, 2, 3, 4};
   if (*(uint32*)bytes != 0x04030201) {
      // Big endian
      err.submit(9002);
   }
}

// Function to convert powers of 2 to index
int FloorLog2(uint32 x) {
   int i = -1;
   do {
      x >>= 1;
      i++;
   } while (x);
   return i;
}

const char * timestring(uint32 t) {
   // Convert 32 bit time stamp to string
   // Fix the problem that time_t may be 32 bit or 64 bit
   union {
      time_t t;
      uint32 t32;
   } utime;
   utime.t = 0;
   utime.t32 = t;
   const char * string = ctime(&utime.t);
   if (string == 0) string = "?";
   return string;
}

// Main. Program starts here
int main(int argc, char * argv[]) {
   CheckIntegerTypes();                // Check that compiler has the right integer sizes
   CheckEndianness();                  // Check that machine is little-endian

   cmd.ReadCommandLine(argc, argv);    // Read command line parameters   
   if (cmd.ShowHelp) return 0;         // Help screen has been printed. Do nothing else

   CMain maincvt;                      // This object takes care of all conversions etc.
   maincvt.Go();          

   return err.GetWorstError();         // Return with error code
}


// Class CMainConverter is used for control of the conversion process
CMain::CMain() : CFileBuffer() {
}

void CMain::Go() {
   // Do whatever the command line parameters say
   FileName = cmd.InputFile;           // Get input file name from command line
   // Ignore nonexisting filename when building library
   int IgnoreError = (cmd.FileOptions & CMDL_FILE_IN_IF_EXISTS) && !cmd.OutputFile;
   Read(IgnoreError);                  // Read input file
   GetFileType();                      // Determine file type

   if (err.Number()) return;           // Return if error
   CheckOutputFileName();              // Construct output file name with default extension
   if (err.Number()) return;

   // Input file is an object file
   CConverter conv;                 // Make converter object
   *this >> conv;                   // Transfer my file buffer to conv
   conv.Go();                       // Do conversion or dump
   *this << conv;                   // Get file buffer back

   if ((cmd.FileOptions & CMDL_FILE_OUTPUT) && OutputFileName) {
      // There is an output file to write
      FileName = OutputFileName;       // Output file name
      Write();                         // Write output file
   }
}

CConverter::CConverter() {
   // Constructor
}

void CConverter::DumpCOF() {
   // Dump COFF file
   CCOFF cof;                          // Make object for interpreting COFF file
   *this >> cof;                       // Give it my buffer
   cof.ParseFile();                    // Parse file buffer
   if (err.Number()) return;           // Return if error
   cof.Dump(cmd.DumpOptions);          // Dump file
   *this << cof;                       // Take back my buffer
}

void CConverter::DumpMACHO() {
   // Dump Mach-O file
   if (WordSize == 32) {
      // Make object for interpreting 32 bit Mach-O file
      CMACHO<MAC32STRUCTURES> macho;
      *this >> macho;                     // Give it my buffer
      macho.ParseFile();                  // Parse file buffer
      if (err.Number()) return;           // Return if error
      macho.Dump(cmd.DumpOptions);        // Dump file
      *this << macho;                     // Take back my buffer
   }
   else {
      // Make object for interpreting 64 bit Mach-O file
      CMACHO<MAC64STRUCTURES> macho;
      *this >> macho;                     // Give it my buffer
      macho.ParseFile();                  // Parse file buffer
      if (err.Number()) return;           // Return if error
      macho.Dump(cmd.DumpOptions);        // Dump file
      *this << macho;                     // Take back my buffer
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
	GetFileType();                      // Determine file type
	if (err.Number()) return;           // Return if error

	switch(FileType) {
		case FILETYPE_COFF:
			DumpCOF();
			break;

		case FILETYPE_MACHO_LE:
			DumpMACHO();
			break;

		default:
			err.submit(2010, GetFileFormatName(FileType));
	}
	printf("\n");

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
}
