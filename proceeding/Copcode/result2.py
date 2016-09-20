from __future__ import print_function
from capstone import *
from capstone.x86 import *
from xprint import to_hex, to_x, to_x_32

count = 0
splits = (
		"jmp", "ret", "ja", "jae", "jb", "jbe", "jc", "jcxz", "jecxz", "jrcxz", "je", "jg", "jge", "jl", "jle", "jna", "jnae", "jnb", "jnbe", "jnc", "jne", "jng", "jnge", "jnl", "jnle", "jno", "jnp", "jns", "jnz", "jo", "jp", "jpe", "jpo", "js", "jz", 
)
f1 = open("result2.txt", 'w')
X86_CODE64 = "554889E541565657534881EC800000004889CE488B05CD4F0000488B48404885C97426FF5130488B05BA4F0000488B4840BA0E000000FF5128488B05A74F0000488B484031D2FF5140488D0D674B00004C8D05504C000031D24531C9E87CF3FFFF488905C74F0000E8E6C1FFFF84C07424488B05B74F00004885C07518488D0DD93500004C8D054B360000BA7B020000E8BDC1FFFF488B05534F0000C74424280200000048C744242000000000488D158B4B00004C8D45D84889F14989F1FF90180100004889C64885F60F88DD020000488B45D8488B4818488B05104F0000488D15394B00004C8D45D0FF909800000048BE0E000000000000804885C00F88A0020000488B45D8488B78204889F9E82FEAFFFF84C00F85880200004889F9E8F0EEFFFF4885C0751C4889F9E8B1EAFFFF4889C74889F9E807EAFFFF84C074DCE9690200004885FF0F84560200004889F9E844EAFFFF4889C14889FAE8FDD5FFFF4889C748C745C00000000048C745B800000000488B4DD0488D5F04488D45C0488D55B84C8D75AC4C89742430488954242848894424204889DA41B8100000004531C9FF51184889C64885F60F880D020000488B4DC04885C9740DE8B1D5FFFF48C745C000000000488D0DE94900004889DAE882C3FFFF88C34889F9E890D5FFFF84DB0F84BB01000048C745C00000000048C745B800000000488B4DD04C89742430488D7DB048897C2428488D5DB748895C2420488D15B54900004C8D45C04C8D4DB8FF51104889C64885F60F887C010000807DB7010F856801000048C745A00000000048C7459800000000488B55B8488B4DC04C8D45984C8D4DA0E8430A00004889C6488B4DC04885C9740DE8FFD4FFFF48C745C0000000004885F60F882B010000E8CCBFFFFF84C0741F48837DA0007518488D0DC43300004C8D0551340000BAF6020000E8A8BFFFFF48C745C00000000048C745B800000000488B4DD04C8974243048897C242848895C2420488D150B4900004C8D45C04C8D4DB8FF51104889C64885F60F88C2000000807DB70148BE0E000000000000800F85AE00000048C745C800000000488B55B8488B4DC04C8D45C8E81BFCFFFF4889C64885F60F88A4000000488B0D044D0000BA020000004531C0E8FBF1FFFF4889C74885FF74104889F9E895ECFFFF4889F9E820D4FFFF48837D9800742731DB488B7DA0488B4DC84889FAE8E7F9FFFF4889C64885F678624883C73848FFC3483B5D9872DF4885F67850488B056D4C000031C931D24531C04531C9FF506848BE1500000000000080EB0A48BE0E000000000000804889F04881C4800000005B5F5E415E5DC34889F9E8AAD3FFFFEBE5488B4DC0E89FD3FFFFEBDA488B4DA04885C974D1E88FD3FFFF48C745A000000000EB"
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
			f1.write("\n%d" % count)
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