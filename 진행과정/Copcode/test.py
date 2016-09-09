from __future__ import print_function
from capstone import *
from capstone.x86 import *
from xprint import to_hex, to_x, to_x_32

splits = (
		"jmp", "ret", "ja", "jae", "jb", "jbe", "jc", "jcxz", "jecxz", "jrcxz", "je", "jg", "jge", "jl", "jle", "jna", "jnae", "jnb", "jnbe", "jnc", "jne", "jng", "jnge", "jnl", "jnle", "jno", "jnp", "jns", "jnz", "jo", "jp", "jpe", "jpo", "js", "jz", 
)
f1 = open("result1.txt", 'w')
count = 0

X86_CODE64 = "C74424280200000048C844242000000000488D15348C00004C8D45D84889F94989F9FF90180100004889C64885F60F8876030000"
def print_insn_detail(mode, insn):
	def print_string_hex(str):
		for c in str:
			f1.write("0x%02x" % c)
		f1.write("\n")
	if insn.id == 0:
		return
    # print instruction's opcode
	f1.write("%s\t%s\t" % (insn.mnemonic, insn.op_str))
	print_string_hex(insn.opcode)
	for split in splits:
		if insn.mnemonic == split:
			global count
			f1.write("\n%d" % count);
			count += 1
			f1.write("\n")			
			break



# ## Test class Cs
def test_class():
	CODE = X86_CODE64.decode("hex")	
#	f = open("X86_CODE64.txt", 'w')
#	f.write(CODE)
#	f.close()
	all_tests = (
   	    (CS_ARCH_X86, CS_MODE_64, CODE, "X86 64 (Intel syntax)", None),
	)

	for (arch, mode, code, comment, syntax) in all_tests:
		print("Code: %s" % to_hex(code))
		try:
			md = Cs(arch, mode)
			md.detail = True
			if syntax is not None:
				md.syntax = syntax
			for insn in md.disasm(code, 0x1000):
				print_insn_detail(mode, insn)
		except CsError as e:
			print("ERROR: %s" % e)


if __name__ == '__main__':
    test_class()
