#! /bin/python

import sys
import subprocess
import os
#import psutil
import signal
from os import listdir
from os.path import isfile, isdir, join, splitext, split

inputDir1 = sys.argv[1]
inputDir2 = sys.argv[2]
absInputDir1 = os.path.abspath(sys.argv[1])
absInputDir2 = os.path.abspath(sys.argv[2])

proc1 = subprocess.Popen( ["find", absInputDir1, "-name", "body.bin"], shell = False,\
		stdout = subprocess.PIPE, stderr = subprocess.PIPE)

proc2 = subprocess.Popen( ["find", absInputDir2, "-name", "body.bin"], shell = False,\
		stdout = subprocess.PIPE, stderr = subprocess.PIPE)

efiFilePath1 = proc1.stdout.readlines();
efiFilePath2 = proc2.stdout.readlines();

for line1 in efiFilePath1 :
	for line2 in efiFilePath2 :
		if line1.replace(absInputDir1, "") == line2.replace(absInputDir2, "") :
			print "**************************************************************************************************"
			print "mapper start : "
			print "input1 : " + line1
			print "input2 : " + line2
			efi1 = line1.replace("\n", "")
			efi2 = line2.replace("\n", "")
			print (["./efi-mapper", efi1, efi2, "--unmap"])
			proc = subprocess.Popen( "./efi-mapper" + '""' + efi1 + '"" ' + '""' + efi2 + '"" ' + "--unmap", shell = True,\
						stdout = subprocess.PIPE, stderr = subprocess.PIPE)
			print proc.stdout
			break
