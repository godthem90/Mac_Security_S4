/****************************  maindef.h   **********************************
* Author:        Agner Fog
* Date created:  2006-08-26
* Last modified: 2015-12-10
* Project:       objconv
* Module:        maindef.h
* Description:
* Header file for type definitions and other main definitions.
*
* Copyright 2006-2015 GNU General Public License http://www.gnu.org/licenses
*****************************************************************************/
#ifndef EFIMAPPER_LIB_H
#define EFIMAPPER_LIB_H

#include <stdio.h>
#include <inttypes.h>

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

#define stricmp  strcasecmp    // Alternative function names
#define strnicmp strncasecmp

typedef char             int8;       // 8 bit  signed integer
typedef uint8_t          uint8;      // 8 bit  unsigned integer
typedef int16_t          int16;      // 16 bit signed integer
typedef uint16_t         uint16;     // 16 bit unsigned integer
typedef int32_t          int32;      // 32 bit signed integer
typedef uint32_t         uint32;     // 32 bit unsigned integer
typedef int64_t          int64;      // 64 bit signed integer
typedef uint64_t         uint64;     // 64 bit unsigned integer

// Check if compiling for big-endian machine 
// (__BIG_ENDIAN__ may not be defined even on big endian systems, so this check is not 
// sufficient. A further check is done in CheckEndianness() in main.cpp)
#if defined(__BIG_ENDIAN__) && (__BIG_ENDIAN__ != 4321)
   #error This machine has big-endian memory organization. Objconv program will not work
#endif

// Max file name length
#define MAXFILENAMELENGTH        256

// Macro to calculate the size of an array
#define TableSize(x) ((int)(sizeof(x)/sizeof(x[0])))

// Macro to get length of text list and call LookupText
#define Lookup(list,x)  LookupText(list, sizeof(list)/sizeof(list[0]), x)

// Structures and functions used for lookup tables:
// Structure of integers and char *, used for tables of text strings
struct SIntTxt {
   uint32_t a;
   const char * b;
};

// Get high part of a 64-bit integer
static inline uint32_t HighDWord (uint64_t x) {
   return (uint32_t)(x >> 32);
}

// Translate integer value to text string by looking up in table of SIntTxt.
// Parameters: p = table, n = length of table, x = value to find in table
static inline char const * LookupText(SIntTxt const * p, int n, uint32_t x) {
   for (int i=0; i<n; i++, p++) {
      if (p->a == x) return p->b;
   }
   // Not found
   static char utext[32];
   sprintf(utext, "unknown(0x%X)", x);
   return utext;
}

const char * timestring(uint32_t t);
bool CorrectIntegerTypes();
bool CorrectEndianness();
int MapRegister( char *reg );
bool IsCondJump( char *mnemonic );
bool IsHex(char *str);
uint64_t htoi( char *hex_str );
int pow( int a, int b );

#endif // #ifndef LIB_H
