/****************************  containers.cpp  **********************************
* Author:        Agner Fog
* Date created:  2006-07-15
* Last modified: 2007-01-27
* Project:       objconv
* Module:        containers.cpp
* Description:
* Objconv is a portable C++ program for converting object file formats.
* Compile for console mode on any platform.
*
* This module contains container classes CMemoryBuffer and CFileBuffer for
* dynamic memory allocation and file read/write. See containers.h for
* further description.
*
* Copyright 2006-2008 GNU General Public License http://www.gnu.org/licenses
*****************************************************************************/

#include <stdio.h>
#include <string.h>
#include "lib1.h"
#include "containers.h"

// Names of file formats
SIntTxt FileFormatNames[] = {
    {FILETYPE_COFF,         "COFF"},
    {FILETYPE_OMF,          "OMF"},
    {FILETYPE_ELF,          "ELF"},
    {FILETYPE_MACHO_LE,     "Mach-O Little Endian"},
    {FILETYPE_MACHO_BE,     "Mach-O Big Endian"},
    {FILETYPE_DOS,          "DOS executable"},
    {FILETYPE_WIN3X,        "Windows 3.x executable"},
    {FILETYPE_LIBRARY,      "Function library"},
    {FILETYPE_OMFLIBRARY,   "Function library (OMF)"},
    {IMPORT_LIBRARY_MEMBER, "Windows import library member"},
    {FILETYPE_MAC_UNIVBIN,  "MacIntosh universal binary"},   
    {FILETYPE_MS_WPO,       "Whole program optimization intermediate file, Microsoft specific"},
    {FILETYPE_INTEL_WPO,    "Whole program optimization intermediate file, Intel specific"},
    {FILETYPE_WIN_UNKNOWN,  "Unknown subtype, Windows"},   
    {FILETYPE_ASM,          "Disassembly"}
};


// Members of class CMemoryBuffer
CMemoryBuffer::CMemoryBuffer() {  
    // Constructor
    buffer = 0;
    NumEntries = DataSize = BufferSize = 0;
}

CMemoryBuffer::~CMemoryBuffer() {
    // Destructor
    SetSize(0);                         // De-allocate buffer
}

void CMemoryBuffer::SetSize(uint32_t size) {
    // Allocate, reallocate or deallocate buffer of specified size.
    // DataSize is initially zero. It is increased by Push or PushString.
    // Setting size > DataSize will allocate more buffer and fill it with zeroes but not increase DataSize.
    // Setting size < DataSize will decrease DataSize so that some of the data are discarded.
    // Setting size = 0 will discard all data and de-allocate the buffer.
    if (size == 0) {
        // Deallocate
        if (buffer) delete[] buffer;     // De-allocate buffer
        buffer = 0;
        NumEntries = DataSize = BufferSize = 0;
        return;
    }
    if (size < DataSize) {
        // Request to delete some data
        DataSize = size;
        return;
    }
    if (size <= BufferSize) {
        // Request to reduce size but not delete it
        return;                          // Ignore
    }
//  size = (size + 15) & uint32_t(-16);   // Round up size to value divisible by 16
    size = (size + BufferSize + 15) & uint32_t(-16);   // Double size and round up to value divisible by 16
    char * buffer2 = 0;                 // New buffer
    buffer2 = new char[size];           // Allocate new buffer
    if (buffer2 == 0) {err.submit(9006); return;} // Error can't allocate
    memset (buffer2, 0, size);          // Initialize to all zeroes
    if (buffer) {
        // A smaller buffer is previously allocated
        memcpy (buffer2, buffer, BufferSize); // Copy contents of old buffer into new
        delete[] buffer;                 // De-allocate old buffer
    }
    buffer = buffer2;                   // Save pointer to buffer
    BufferSize = size;                  // Save size
}

uint32_t CMemoryBuffer::Push(void const * obj, uint32_t size) {
    // Add object to buffer, return offset
    // Parameters: 
    // obj = pointer to object, 0 if fill with zeroes
    // size = size of object to push

    // Old offset will be offset to new object
    uint32_t OldOffset = DataSize;

    // New data size will be old data size plus size of new object
    uint32_t NewOffset = DataSize + size;

    if (NewOffset > BufferSize) {
        // Buffer too small, allocate more space.
        // We can use SetSize for this only if it is certain that obj is not 
        // pointing to an object previously allocated in the old buffer
        // because it would be deallocated before copied into the new buffer:
        // SetSize (NewOffset + NewOffset / 2 + 1024);

        // Allocate more space without using SetSize:
        // Double the size + 1 kB, and round up size to value divisible by 16
        uint32_t NewSize = (NewOffset * 2 + 1024 + 15) & uint32_t(-16);
        char * buffer2 = 0;                        // New buffer
        // Allocate new buffer
        buffer2 = new char[NewSize];
        if (buffer2 == 0) {
            // Error can't allocate
            err.submit(9006);  return 0;
        }
        // Initialize to all zeroes
        memset (buffer2, 0, NewSize);
        if (buffer) {
            // A smaller buffer is previously allocated
            // Copy contents of old buffer into new
            memcpy (buffer2, buffer, BufferSize);
        }
        BufferSize = NewSize;                      // Save size
        if (obj && size) {                         
            // Copy object to new buffer
            memcpy (buffer2 + OldOffset, obj, size);
            obj = 0;                                // Prevent copying once more
        }
        // Delete old buffer after copying object
        if (buffer) delete[] buffer;

        // Save pointer to new buffer
        buffer = buffer2;
    }
    // Copy object to buffer if nonzero
    if (obj && size) {
        memcpy (buffer + OldOffset, obj, size);
    }
    if (size) {
        // Adjust new offset
        DataSize = NewOffset;
        NumEntries++;
    }
    // Return offset to allocated object
    return OldOffset;
}

uint32_t CMemoryBuffer::PushString(char const * s) {
    // Add ASCIIZ string to buffer, return offset
    return Push (s, uint32_t(strlen(s))+1);
}

uint32_t CMemoryBuffer::GetLastIndex() {
    // Index of last object pushed (zero-based)
    return NumEntries - 1;
}

void CMemoryBuffer::Align(uint32_t a) {
    // Align next entry to address divisible by a
    uint32_t NewOffset = (DataSize + a - 1) / a * a;
    if (NewOffset > BufferSize) {
        // Allocate more space
        SetSize (NewOffset + 2048);
    }
    // Set DataSize to after alignment space
    DataSize = NewOffset;
}

// Members of class CFileBuffer
CFileBuffer::CFileBuffer() : CMemoryBuffer() {  
    // Default constructor
    FileName = 0;
    OutputFileName = 0;
    FileType = WordSize = Executable = 0;
}

CFileBuffer::CFileBuffer(char const * filename) : CMemoryBuffer() {  
    // Constructor
    FileName = filename;
    FileType = WordSize = 0;
}

void CFileBuffer::Read(int IgnoreError) {                   
    // Read file into buffer
    uint32_t status;                             // Error status

    FILE * fh = fopen(FileName, "rb");
    if (!fh) {
        // Cannot read file
        if (!IgnoreError) err.submit(2103, FileName); // Error. Input file must be read
        SetSize(0); return;                     // Make empty file buffer
    }
    // Find file size
    fseek(fh, 0, SEEK_END);
    long int fsize = ftell(fh);
    if (fsize <= 0 || (unsigned long)fsize >= 0xFFFFFFFF) {
        // File too big or zero size
        err.submit(2105, FileName); fclose(fh); return;
    }
    DataSize = (uint32_t)fsize;
    rewind(fh);
    // Allocate buffer
    SetSize(DataSize + 2048);                 // Allocate buffer, 2k extra
    // Read entire file
    status = (uint32_t)fread(Buf(), 1, DataSize, fh);
    if (status != DataSize) err.submit(2103, FileName);
    status = fclose(fh);
    if (status != 0) err.submit(2103, FileName);
}

void CFileBuffer::Write() {                  
    // Write buffer to file:
    if (OutputFileName) FileName = OutputFileName;
    // Two alternative ways to write a file:

    // Open file in binary mode
    FILE * ff = fopen(FileName, "wb");
    // Check if error
    if (!ff) {err.submit(2104, FileName);  return;}
    // Write file
    uint32_t n = (uint32_t)fwrite(Buf(), 1, DataSize, ff);
    // Check if error
    if (n != DataSize) err.submit(2104, FileName);
    // Close file
    n = fclose(ff);
    // Check if error
    if (n) {err.submit(2104, FileName);  return;}

}

char const * CFileBuffer::GetFileFormatName(int FileType) {
    // Get name of file format type
    return Lookup (FileFormatNames, FileType);
}


void CFileBuffer::SetFileType(int type) {
    // Set file format type
    FileType = type;
}

void CFileBuffer::Reset() {
    // Set all members to zero
    SetSize(0);                          // Deallocate memory buffer
    memset(this, 0, sizeof(*this));
}

void operator >> (CFileBuffer & a, CFileBuffer & b)
{ 
    // Transfer ownership of buffer and other properties from a to b
    b.SetSize(0);                            // De-allocate old buffer from target if it has one
    b.buffer = a.buffer;                     // Transfer buffer
    a.buffer = 0;                            // Remove buffer from source, so that buffer has only one owner

    // Copy properties
    b.DataSize   = a.GetDataSize();          // Size of data, offset to vacant space
    b.BufferSize = a.GetBufferSize();        // Size of allocated buffer
    b.NumEntries = a.GetNumEntries();        // Number of objects pushed
    b.Executable = a.Executable;             // File is executable
	b.OutSubType = a.OutSubType;
    if (a.WordSize) b.WordSize = a.WordSize; // Segment word size (16, 32, 64)
    if (a.FileType)  b.FileType = a.FileType;       // Object file type
    a.SetSize(0);     
}


// Class CTextFileBuffer is used for building text files
// Constructor
CTextFileBuffer::CTextFileBuffer() {
    column = 0;
}

void CTextFileBuffer::Put(const char * text) {
    // Write text string to buffer
    uint32_t len = (uint32_t)strlen(text);            // Length of text
    Push(text, len);                              // Add to buffer without terminating zero
    column += len;                                // Update column
}

void CTextFileBuffer::Put(const char character) {
    // Write single character to buffer
    Push(&character, 1);                          // Add to buffer
    column ++;                                    // Update column
}

void CTextFileBuffer::NewLine() {
    // Add linefeed
    Push("\n", 1);                             // UNIX style linefeed
    column = 0;                                   // Reset column
}

void CTextFileBuffer::Tabulate(uint32_t i) {
    // Insert spaces until column i
    uint32_t j;
    if (i > column) {                             // Only insert spaces if we are not already past i
        for (j = column; j < i; j++) Push(" ", 1); // Insert i - column spaces
        column = i;                                // Update column
    }
}

void CTextFileBuffer::PutDecimal(int32_t x, int IsSigned) {
    // Write decimal number to buffer, unsigned or signed
    char text[16];
    sprintf(text, IsSigned ? "%i" : "%u", x);
    Put(text);
}

void CTextFileBuffer::PutHex(uint8_t x, int MasmForm) {
    // Write hexadecimal 8 bit number to buffer
    // If MasmForm >= 1 then the function will write the number in a
    // way that can be read by the assembler, e.g. 0FFH or 0xFF
    char text[16];
    if (MasmForm && x >= 0xA0) {
        Put("0");                                  // Make sure it doesn't begin with a letter
    }
    sprintf(text, "%02X", x);
    Put(text);
    if (MasmForm) Put("H");
}

void CTextFileBuffer::PutHex(uint16_t x, int MasmForm) {
    // Write hexadecimal 16 bit number to buffer
    // If MasmForm >= 1 then the function will write the number in a
    // way that can be read by the assembler, e.g. 0FFH or 0xFF
    // If MasmForm == 2 then leading zeroes are stripped
    char text[16];
    sprintf(text, (MasmForm < 2) ? "%04X" : "%X", x);
    // Check if leading zero needed
    if (MasmForm && text[0] > '9') {
        Put("0");                                  // Leading zero needed
    }
    Put(text);
    if (MasmForm) Put("H");
}

void CTextFileBuffer::PutHex(uint32_t x, int MasmForm) {
    // Write hexadecimal 32 bit number to buffer
    // If MasmForm >= 1 then the function will write the number in a
    // way that can be read by the assembler, e.g. 0FFH or 0xFF
    // If MasmForm == 2 then leading zeroes are stripped
    char text[16];
    sprintf(text, (MasmForm < 2) ? "%08X" : "%X", x);
    // Check if leading zero needed
    if (MasmForm && text[0] > '9') {
        Put("0");                                  // Leading zero needed
    }
    Put(text);
    if (MasmForm) Put("H");
}

void CTextFileBuffer::PutHex(uint64_t x, int MasmForm) {
	// Write unsigned hexadecimal 64 bit number to buffer
	// If MasmForm >= 1 then the function will write the number in a
	// way that can be read by the assembler, e.g. 0FFH or 0xFF
	// If MasmForm == 2 then leading zeroes are stripped
	char text[32];
	if (MasmForm < 2) {  // Print all digits
		sprintf(text, "%08X%08X", HighDWord(x), uint32_t(x));
	}
	else { // Skip leading zeroes
		if (HighDWord(x)) {
			sprintf(text, "%X%08X", HighDWord(x), uint32_t(x));
		}
		else {
			sprintf(text, "%X", uint32_t(x));
		}
	}
	if (MasmForm) {
		// use 0FFH form
		if (text[0] > '9')  Put("0");           // Leading zero needed
		Put(text);
		Put("H");
	}
	else {
		// write hexadecimal number only
		Put(text);
	}
}

void CTextFileBuffer::PutFloat(float x) {
    // Write floating point number to buffer
    char text[64];
    sprintf(text, "%.7G", x);
    Put(text);
}

void CTextFileBuffer::PutFloat(double x) {
    // Write floating point number to buffer
    char text[64];
    sprintf(text, "%.16G", x);
    Put(text);
}

String::String()
{
	memset( this, 0, sizeof(*this) );
}

String::String( const String& another )
{
	memset( this, 0, sizeof(*this) );
	size = another.size;
	if( size )
	{
		str = new char[size];
		strncpy( str, another.str, size );
	}
	else
		str = NULL;
}

void String::operator = ( const String& another )
{
	memset( this, 0, sizeof(*this) );
	size = another.size;
	if( size )
	{
		char* temp = new char[size];
		strncpy( temp, another.str, size );
		if( str )
			delete[] str;
		str = temp;
	}
	else
		str = NULL;
}

String::~String()
{
	Free();
}

void String::SetString( char *new_str )
{
	size = strlen(new_str) + 1;
	if( str )
		delete[] str;
	str = new char[size];
	strncpy( str, new_str, size );
}

void String::SetString( char *new_str, int len )
{
	size = len + 1;
	if( str )
		delete[] str;
	str = new char[size];
	strncpy( str, new_str, len );
	str[size - 1] = 0;
}

void String::Append( char append )
{
	char append_str[2];
	append_str[0] = append;
	append_str[1] = 0;
	Append(append_str);
}

void String::Append( char *append )
{
	if( str )
	{
		size += strlen(append);
		char *temp = new char[size];
		strncpy( temp, str, strlen(str) );
		strncpy( temp + strlen(str), append, strlen(append) + 1 );

		delete[] str;
		str = temp;
	}
	else
		SetString( append );
}

void String::Append( char *append, int len )
{
	if( str )
	{
		size += len;
		char *temp = new char[size];
		strncpy( temp, str, strlen(str) );
		strncpy( temp + strlen(str), append, len );
		temp[size - 1] = 0;

		delete[] str;
		str = temp;
	}
	else
		SetString( append, len );
}

void String::Erase( int idx )
{
	if(idx >= size - 1)
		return;

	char *temp = new char[--size];
	strncpy( temp, str, idx );
	strncpy( temp + idx, str + idx + 1, size - idx );

	delete[] str;
	str = temp;
}

char *String::GetString()
{
	return str;
}

void String::Free()
{
	size = 0;
	if( str )
		delete[] str;
	str = NULL;
}


