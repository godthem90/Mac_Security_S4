from __future__ import print_function
from capstone import *
from capstone.x86 import *
from xprint import to_hex, to_x, to_x_32

splits = (
		"jmp", "ret", "ja", "jae", "jb", "jbe", "jc", "jcxz", "jecxz", "jrcxz", "je", "jg", "jge", "jl", "jle", "jna", "jnae", "jnb", "jnbe", "jnc", "jne", "jng", "jnge", "jnl", "jnle", "jno", "jnp", "jns", "jnz", "jo", "jp", "jpe", "jpo", "js", "jz", 
)
f1 = open("result1.txt", 'w')
#count = 0
X86_CODE64 = "554889E541565657534881ECB00000004889CF488B05795A0000488945A8488B05665A0000488945A0488B05735A000048894598488B05605A0000488945904889F9E83494FFFF4889F931D2E813320000488D0D535A0000E85BE1FFFFE8D115000048BE150000000000008084C00F84B1030000488B0588940000C74424280200000048C744242000000000488D15348C00004C8D45D84889F94989F9FF90180100004889C64885F60F8876030000488B45D8488B4818488B0545940000488D15828B00004C8D45D0FF909800000048BE0E000000000000804885C00F8843030000488B45D8488B4820E8470300004889C748BE0E00000000000080EB203C7F750A807F01FF0F84190300000FB64F020FB6470348C1E0084809C84801C78A07247F3C0475D8807F010675E048BE0E000000000000804885FF0F84E602000048C745C00000000048C745B800000000488B45D0488D4DB84C8D75884C8974243048894C2428488D4DC048894C24204883C7044889C14889FA41B8100000004531C9FF50184889C64885F60F8895020000488B056C930000488D0DAD9300004889FA41B810000000FF9060010000488B4DC04885C97412488B0546930000FF504848C745C00000000048C745C00000000048C745B800000000488B45D04C89742430488D7D8C48897C2428488D5DB748895C2420488D55A04C8D45C04C8D4DB84889C1FF50104889C64885F60F881402000048BE0E00000000000080807DB7010F850002000048C745800000000048C78578FFFFFF00000000488B55B8488B4DC0488D458048894424204C8D8570FFFFFF4C8D8D78FFFFFFE8592800004889C6488B4DC04885C97412488B0594920000FF504848C745C0000000004885F60F88A2010000E86E1D000048BE1900000000000080483B8570FFFFFF0F828601000048C745C00000000048C745B800000000488B45D04C8974243048897C242848895C2420488D55904C8D45C04C8D4DB84889C1FF50104889C64885F60F884501000048BE0E00000000000080807DB7010F853101000048C745C800000000488B55B8488B4DC04C8D45C8E8112C00004889C64885F67913488B4DC0488B05E3910000FF5048E9FD000000E85219000031C9488B8578FFFFFF4885C07416488B55804883C22831C948030A4883C26848FFC875F4E874150000488B05A6910000B910000000FF5018B901000000E8E71A0000B901000000E8EA130000E850140000E8D33700004885C07505E88C140000E800150000E8CB39000031FF48C7C3FFFFFFFFEB1C488B55804801FA488D7F68488B4DC8E86FF9FFFF4889C64885F6781148FFC3483B9D78FFFFFF72D84885F6791D488B4D804885C9744D488B0524910000FF504848C7458000000000EB3931C9E87013000031C9E85C1A0000B9A0860100E8DF2E0000488B05F8900000B940420F00FF90F8000000E88019000048BE15000000000000804889F04881C4B00000005B5F5E415E5D"
def print_insn_detail(mode, insn):
	def print_string_hex(str):
		for c in str:
			f1.write("0x%02x" % c)
		f1.write("\n")
	if insn.id == 0:
		return
    # print instruction's opcode
#	f1.write("%s\t%s\t" % (insn.mnemonic, insn.op_str))
	print_string_hex(insn.opcode)
	for split in splits:
		if insn.mnemonic == split:
			global count
#			f1.write("\n%d" % count);
#			count += 1
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
