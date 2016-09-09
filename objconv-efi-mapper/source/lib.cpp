#include <stdio.h>
#include <string.h>
#include <time.h>

#include "lib.h"

char reg_table[64][5] = {"rax", "rcx", "rdx", "rbx", "rsp", "rbp", "rsi", "rdi", "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15", 
					"eax", "ecx", "edx", "ebx", "esp", "ebp", "esi", "edi", "r8d", "r9d", "r10d", "r11d", "r12d", "r13d", "r14d", "r15d", 
					"ax", "cx", "dx", "bx", "sp", "bp", "si", "di", "r8w", "r9w", "r10w", "r11w", "r12w", "r13w", "r14w", "r15w", 
					"al", "cl", "dl", "bl", "spl", "bpl", "sil", "dil", "r8b", "r9b", "r10b", "r11b", "r12b", "r13b", "r14b", "r15b"};

const char * timestring(uint32_t t) {
	// Convert 32 bit time stamp to string
	// Fix the problem that time_t may be 32 bit or 64 bit
	union {
		time_t t;
		uint32_t t32;
	} utime;
	utime.t = 0;
	utime.t32 = t;
	const char * string = ctime(&utime.t);
	if (string == 0) string = "?";
	return string;
}    

bool CorrectIntegerTypes() {
   if (
      sizeof(uint8_t) != 1 ||
      sizeof(int16_t) != 2 ||
      sizeof(int32_t) != 4 ||
      sizeof(int64_t) != 8) {
	   return false;
   }

   return true;
}

bool CorrectEndianness() {
   static uint8_t bytes[4] = {1, 2, 3, 4};
   if (*(uint32_t*)bytes != 0x04030201) {
      return false;
   }
   return true;
}

int MapRegister( char *reg )
{
	for( int i = 0; i < 64; i++ )
	{
		if( !strcmp( reg, reg_table[i] ) )
			return i % 16;
	}
	return -1;
}

bool IsCondJump( char *mnemonic )
{
	const char *CondJumpTable[] ={
		"jo", "jno", "jc", "jnc", "jz", "jnz", "jbe", "ja", "je", "js",
		"jns", "jpe", "jpo", "jl", "jge", "jle", "jg", "jcxz", "jecxz", "jrcxz"
	};

	for( int i = 0; i < 20; i++ )
	{
		if( !strcmp( mnemonic, CondJumpTable[i]) )
			return true;
	}

	return false;
}

uint64_t htoi( char *hex_str )
{
	char hex_table[] = "0123456789abcdef0123456789ABCDEF";

	uint64_t shift_num = 0, res = 0;
	int i;
	for( i = 0; hex_str[i] != 0; i++ )
	{
		if( (hex_str[i] == 'H' || hex_str[i] == 'h') && hex_str[i+1] == 0 )
			break;

		int j;
		res = res << 4;
		for( j = 0; hex_table[j] != 0; j++ )
		{
			if( hex_str[i] == hex_table[j] )
			{
				shift_num = j % 16;
				break;
			}
		}
		if( j == 33 )
			return 0;
		res += shift_num;
	}

	return res;
}

int pow( int a, int b )
{
	int res = 1;
	for( int i = 0; i < b; i++ )
		res *= a;
	return res;
}

