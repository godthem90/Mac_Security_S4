#include <stdio.h>
#include <time.h>

#include "lib.h"

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


