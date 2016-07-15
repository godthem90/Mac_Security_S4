#!/usr/bin/python

import sys
import re
import subprocess


f = open(sys.argv[1], 'r')
lines = f.readlines()
f.close()
#count = 0
for line in lines :
	if re.match('File GUID:', line) :
#		count = count + 1
		GUID = (line.split(":")[1]).strip()
		splitGUID = GUID.split("-")
		print( GUID )
		subprocess.call(["grep", "-ri", GUID, "/Users/jjh/Desktop/JJH/Mac_Security_S3/EDK2/edk2"])

'''		SearchGUID = "{ "
		SearchGUID += "0x" + splitGUID[0] + ", "
		SearchGUID += "0x" + splitGUID[1] + ", "
		SearchGUID += "0x" + splitGUID[2] + ", "
		SearchGUID += "0x" + splitGUID[3][0:2] + ", "
		SearchGUID += "0x" + splitGUID[3][2:4] + ", "
		SearchGUID += "0x" + splitGUID[4][0:2] + ", "
		SearchGUID += "0x" + splitGUID[4][2:4] + ", "
		SearchGUID += "0x" + splitGUID[4][4:6] + ", "
		SearchGUID += "0x" + splitGUID[4][6:8] + ", "
		SearchGUID += "0x" + splitGUID[4][8:10] + ", "
		SearchGUID += "0x" + splitGUID[4][10:12] + " }"
		print( GUID + " : " + SearchGUID )
'''
#print(count)

#C3E36D09-8294-4B97-A857-D5288FE33E28
#{ 0xC3E36D09, 0x8294, 0x4b97, 0xA8, 0x57, 0xD5, 0x28, 0x8F, 0xE3, 0x3E, 0x28 }
