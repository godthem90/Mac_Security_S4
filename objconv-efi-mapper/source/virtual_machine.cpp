#include <cstring>
#include <cstdlib>

#include "lib.h"
#include "containers.h"
#include "virtual_machine.h"

using namespace std;


VMemoryTable::VMemoryTable()
{
	memset( this, 0, sizeof(*this) );
}

void VMemoryTable::VMemoryMerge( VMemoryTable &merge_table )
{
	int8_t *temp_buffer;
	bool *temp_state;

	uint64_t current_start = addr;
	uint64_t current_end = addr + size;
	uint64_t merge_start = merge_table.addr;
	uint64_t merge_end = merge_table.addr + merge_table.size;
	if( merge_start < current_start )
	{
		addr = merge_start;
		size += current_start - merge_start;

		temp_buffer = new int8_t[size];
		temp_state = new bool[size];
		memcpy( temp_buffer, merge_table.buffer, merge_table.size ); // bug
		memcpy( temp_state, merge_table.state, merge_table.size );
	}
	if( current_end < merge_end )
	{
		size += merge_end - current_end;

		temp_buffer = new int8_t[size];
		temp_state = new bool[size];
		memcpy( temp_buffer + merge_start - addr, merge_table.buffer, merge_table.size );
		memcpy( temp_state + merge_start - addr, merge_table.state, merge_table.size );
	}

	delete[] buffer;
	delete[] state;
	buffer = temp_buffer;
	state = temp_state;
}

VMemory::VMemory()
{
	memset( this, 0, sizeof(*this) );
}

bool VMemory::IsAllocated( uint64_t addr, int size )
{
	for( int i = 0; i < vmemory_tables.size(); i++ )
	{
		if( vmemory_tables[i].addr <= addr && addr + size < vmemory_tables[i].addr + vmemory_tables[i].size )
			return true;
	}
	return false;
}

void VMemory::Allocate( uint64_t addr, int size )
{
	VMemoryTable new_entry;
	new_entry.addr = addr;
	new_entry.size = size;
	new_entry.buffer = new int8_t[size];
	new_entry.state = new bool[size];

	int insert_idx = 0;
	for( int i = 0; i < vmemory_tables.size(); i++ )
	{
		uint64_t new_start = new_entry.addr;
		uint64_t new_end = new_entry.addr + new_entry.size;
		uint64_t old_start = vmemory_tables[i].addr;
		uint64_t old_end = vmemory_tables[i].addr + vmemory_tables[i].size;
		if( !( (old_end < new_start) || (new_end < old_start) ) )
		{
			new_entry.VMemoryMerge(vmemory_tables[i]);
			vmemory_tables.erase(vmemory_tables.begin()+i);
		}
		else if( old_start < new_start )
		{
			insert_idx = i + 1;
		}
	}

	vmemory_tables.insert(vmemory_tables.begin() + insert_idx, new_entry);
}

template <typename T>
T & VMemory::Buffer( uint64_t addr )
{
	int idx;
	for( idx = 0; idx < vmemory_tables.size(); idx++ )
	{
		if( vmemory_tables[idx].addr <= addr && addr < vmemory_tables[idx].addr + vmemory_tables[idx].size )
			break;
	}

	int offset = addr - vmemory_tables[idx].addr;
	T *ref = (T *)&(vmemory_tables[idx].buffer[offset]);
	return *ref;
}

bool & VMemory::State( uint64_t addr )
{
	int idx;
	for( idx = 0; idx < vmemory_tables.size(); idx++ )
	{
		if( vmemory_tables[idx].addr <= addr && addr < vmemory_tables[idx].addr + vmemory_tables[idx].size )
			break;
	}

	int offset = addr - vmemory_tables[idx].addr;
	bool &ref = vmemory_tables[idx].state[offset];
	return ref;
}
	
void VMemory::SetMem( uint64_t addr, VMAttribute vm_attr, int8_t word_size )
{
	if( word_size == BYTE )
		SetMem<int8_t>( addr, vm_attr );
	else if( word_size == WORD )
		SetMem<int16_t>( addr, vm_attr );
	else if( word_size == DWORD )
		SetMem<int32_t>( addr, vm_attr );
	else if( word_size == QWORD )
		SetMem<int64_t>( addr, vm_attr );
}

template <typename T>
void VMemory::SetMem( uint64_t addr, VMAttribute vm_attr )
{
	if( !IsAllocated(addr, sizeof(T)) )
		Allocate(addr, sizeof(T));

	Buffer<T>(addr) = (T)(vm_attr.value);
	for( int i = 0; i < sizeof(T); i++ )
		State(addr+i) = vm_attr.state;
}

VMAttribute VMemory::GetMem( uint64_t addr, int8_t word_size )
{
	if( word_size == BYTE )
		return GetMem<int8_t>( addr );
	else if( word_size == WORD )
		return GetMem<int16_t>( addr );
	else if( word_size == DWORD )
		return GetMem<int32_t>( addr );
	else if( word_size == QWORD )
		return GetMem<int64_t>( addr );
}

template <typename T>
VMAttribute VMemory::GetMem( uint64_t addr )
{
	if( !IsAllocated(addr, sizeof(T)) )
		Allocate( addr, sizeof(T) );

	VMAttribute vm_attr;
	vm_attr.value = Buffer<T>(addr);
	vm_attr.state = State(addr);
	return vm_attr;
}

Register::Register()
{
	state = INVALID;
	value = 0;
}

VirtualMachine::VirtualMachine()
{
	reg_set[RSP].state = VALID;
	reg_set[RSP].value = 0xfffffffffffffff0;
}

int64_t VirtualMachine::Atoi( char *operand )
{
	if(IsDecimal(operand))
		return atoi(operand);
	else if(IsHex(operand))
		return htoi(operand);
}

bool VirtualMachine::IsReg( char *operand )
{
	for( int i = 0; i < 64; i++ )
	{
		if( !strcmp( operand, reg_table[i] ) )
			return true;
	}
	return false;
}

bool VirtualMachine::IsData( char *operand )
{
	if( strstr(operand, "DS") )
		return true;
	return false;
}

bool VirtualMachine::IsLocal( char *operand )
{
	if(strstr(operand, "rbp") && strstr(operand, "ptr"))
		return true;
	else
		return false;
}

bool VirtualMachine::IsParam( char *operand )
{
	if(strstr(operand, "rsp") && strstr(operand, "ptr"))
		return true;
	else
		return false;
}

bool VirtualMachine::IsMem( char *operand )
{
	if( strstr(operand, "ptr") )
		return true;
	return false;
	//return (IsData(operand) || IsLoca(operand));
}

bool VirtualMachine::IsDecimal( char *operand )
{
	for( int i = 0; i < strlen(operand); i++ )
	{
		if( i == 0 && operand[i] == '-')
			continue;
		if( operand[i] < '0' || operand[i] > '9' )
			return false;
	}
	return true;
}

bool VirtualMachine::IsHex( char *operand )
{
	for( int i = 0; i < strlen(operand); i++ )
	{
		if( (i == strlen(operand) - 1) && (operand[i] == 'H' || operand[i] == 'h') )
			continue;
		if( operand[i] < '0' ||
			('9' < operand[i] && operand[i] < 'A') ||
			('F' < operand[i] && operand[i] < 'a') ||
			'f' < operand[i] )
			return false;
	}
	return true;
}

bool VirtualMachine::IsImmediate( char *operand )
{
	return (IsDecimal(operand) || IsHex(operand));
}

bool VirtualMachine::CheckDependencyTable(char *mnemonic)
{
	for( int i = 0; i < sizeof(operand2_source_insn)/sizeof(char)/MNEMONIC_MAX_SIZE; i++ )
	{
		if(!strcmp(mnemonic, operand2_source_insn[i]))
			return true;
	}
	for( int i = 0; i < sizeof(operand1_source_insn)/sizeof(char)/MNEMONIC_MAX_SIZE; i++ )
	{
		if(!strcmp(mnemonic, operand1_source_insn[i]))
			return true;
	}
	for( int i = 0; i < sizeof(operand1_dest_insn)/sizeof(char)/MNEMONIC_MAX_SIZE; i++ )
	{
		if(!strcmp(mnemonic, operand1_dest_insn[i]))
			return true;
	}
	for( int i = 0; i < sizeof(always_dependent_insn)/sizeof(char)/MNEMONIC_MAX_SIZE; i++ )
	{
		if(!strcmp(mnemonic, always_dependent_insn[i]))
			return true;
	}
	return false;
}

bool VirtualMachine::IsAlwaysDependent(Instruction &insn)
{
	char *mnemonic = insn.GetMnemonic();
	for( int i = 0; i < sizeof(always_dependent_insn)/sizeof(char)/MNEMONIC_MAX_SIZE; i++ )
	{
		if(!strcmp(mnemonic, always_dependent_insn[i]))
			return true;
	}

	return false;
}

vector<OperandAttribute> VirtualMachine::GetSourceAttribute(Instruction &insn)
{
	vector<OperandAttribute> source_attrs;
	char *mnemonic = insn.GetMnemonic();
	if( !CheckDependencyTable(insn.GetMnemonic()) )
	{
		fprintf(stderr, "[error] should update dependency table : ");
		fprintf(stderr, "%llx\t%s\n", insn.GetAddr(), insn.GetMnemonic());
		//insn.Print();
	}

	for( int i = 0; i < sizeof(operand2_source_insn)/sizeof(char)/MNEMONIC_MAX_SIZE; i++ )
	{
		if(!strcmp(mnemonic, operand2_source_insn[i]))
		{
			vector<OperandAttribute> attrs = GetDependencyAttribute(insn.GetOperand2());
			source_attrs.insert(source_attrs.end(), attrs.begin(), attrs.end());
		}
	}
	for( int i = 0; i < sizeof(operand1_source_insn)/sizeof(char)/MNEMONIC_MAX_SIZE; i++ )
	{
		if(!strcmp(mnemonic, operand1_source_insn[i]))
		{
			vector<OperandAttribute> attrs = GetDependencyAttribute(insn.GetOperand1());
			source_attrs.insert(source_attrs.end(), attrs.begin(), attrs.end());
		}
	}

	return source_attrs;
}

vector<OperandAttribute> VirtualMachine::GetDestAttribute(Instruction &insn)
{
	vector<OperandAttribute> dest_attrs;
	char *mnemonic = insn.GetMnemonic();
	for( int i = 0; i < sizeof(operand1_dest_insn)/sizeof(char)/MNEMONIC_MAX_SIZE; i++ )
	{
		if(!strcmp(mnemonic, operand1_dest_insn[i]))
		{
			vector<OperandAttribute> attrs = GetDependencyAttribute(insn.GetOperand1());
			dest_attrs.insert(dest_attrs.end(), attrs.begin(), attrs.end());
		}
	}

	return dest_attrs;
}

vector<OperandAttribute> VirtualMachine::GetDependencyAttribute( char *operand )
{
	vector<OperandAttribute> attrs;
	for( int i = 0; i < 64; i++ )
	{
		if( strstr( operand, reg_table[i] ) )
		{
			OperandAttribute attr;
			attr.op_class = REG;
			attr.reg_num = i % 16;
			attrs.push_back(attr);
		}
	}

	return attrs;
}

void VirtualMachine::AssignAttribute( OperandAttribute dest_attr, OperandAttribute source_attr )
{
	switch(dest_attr.op_class)
	{
		case REG:
			reg_set[dest_attr.reg_num].state = source_attr.state;
			reg_set[dest_attr.reg_num].value = source_attr.value;
			break;
		case MEM_DATA:
		case MEM_LOCAL:
		case MEM_PARAM:
			VMAttribute vm_attr;
			vm_attr.state = source_attr.state;
			vm_attr.value = source_attr.value;
			vmemory.SetMem(dest_attr.mem_addr, vm_attr, dest_attr.word_size);
			break;
		case IMMEDIATE:
			fprintf(stderr, "[error] can't assign to immediate value\n");
			break;
		default:
			fprintf(stderr, "[error] can't determine dest operand class\n");
			break;
	}
}

int8_t VirtualMachine::GetRegNum( char *reg )
{
	for( int i = 0; i < 64; i++ )
	{
		if( !strcmp( reg, reg_table[i] ) )
			return i % 16;
	}
	return -1;
}

int8_t VirtualMachine::GetRegWordsize( char *reg )
{
	int i;
	for( i = 0; i < 64; i++ )
	{
		if( !strcmp( reg, reg_table[i] ) )
			break;
	}
	switch(i/16)
	{
		case 0 :
			return QWORD;
		case 1 :
			return DWORD;
		case 2 :
			return WORD;
		case 3 :
			return BYTE;
		default :
			return -1;
	}

	return -1;
}

OperandAttribute VirtualMachine::GetRegAttribute( char *operand )
{
	OperandAttribute op_attr;
	op_attr.op_class = REG;
	op_attr.reg_num = GetRegNum(operand);
	op_attr.state = reg_set[op_attr.reg_num].state;
	op_attr.value = reg_set[op_attr.reg_num].value;
	op_attr.word_size = GetRegWordsize(operand);

	return op_attr;
}

// TODO serious bug here
uint64_t VirtualMachine::GetMemAddr( char *operand )
{
	vector<OperandAttribute> ptr_operand_attrs;
	String opers;

	strtok(operand, "[]");
	char *ptr_token = strtok(NULL, "[]");
	char *operand_token = strtok(ptr_token, "+-*");
	while(operand_token)
	{
		OperandAttribute ptr_operand_attr = GetAttribute(operand_token);
		ptr_operand_attrs.push_back(ptr_operand_attr);
		operand_token = strtok(NULL, "+-*");
	}
	for( int i = 0; ptr_token[i]; i++ )
	{
		if(ptr_token[i] == '+' || ptr_token[i] == '-' || ptr_token[i] == '*')
			opers.Append(ptr_token[i]);
	}

	char operator_priority[4] = "*+-";
	for( int i = 0; operator_priority[i]; i++ )
	{
		OperandAttribute temp;
		char *opers_str = opers.GetString();
		if(!opers_str) break;
		for( int j = 0; opers_str[j]; j++ )
		{
			if(opers_str[j] == operator_priority[i])
			{
				if(operator_priority[i] == '*')
					temp.value = ptr_operand_attrs[i].value * ptr_operand_attrs[i+1].value;
				else if(operator_priority[i] == '+')
					temp.value = ptr_operand_attrs[i].value + ptr_operand_attrs[i+1].value;
				else if(operator_priority[i] == '-')
					temp.value = ptr_operand_attrs[i].value - ptr_operand_attrs[i+1].value;

				ptr_operand_attrs.erase(ptr_operand_attrs.begin()+i, ptr_operand_attrs.begin()+i+1);
				ptr_operand_attrs.insert(ptr_operand_attrs.begin()+i, temp);
				opers.Erase(i);
			}
		}
	}
	return ptr_operand_attrs[0].value;
}

int8_t VirtualMachine::GetMemWordsize( char *operand )
{
	if(strstr(operand, "byte ptr"))
		return BYTE;
	else if(strstr(operand, "word ptr"))
		return WORD;
	else if(strstr(operand, "dword ptr"))
		return DWORD;
	else if(strstr(operand, "qword ptr"))
		return QWORD;
}

OperandAttribute VirtualMachine::GetMemAttribute( char *operand )
{
	OperandAttribute op_attr;
	op_attr.op_class = MEM_DATA;
	/*if(IsData(operand)) op_attr.op_class = MEM_DATA;
	else if(IsLocal(operand)) op_attr.op_class = MEM_LOCAL;
	else if(IsParam(operand)) op_attr.op_class = MEM_PARAM;*/
	//op_attr.mem_addr = GetMemAddr(operand);
	op_attr.word_size = GetMemWordsize(operand);

	VMAttribute vm_attr = vmemory.GetMem(op_attr.mem_addr, op_attr.word_size);
	op_attr.state = vm_attr.state;
	op_attr.value = vm_attr.value;

	return op_attr;
}

OperandAttribute VirtualMachine::GetImmediateAttribute( char *operand )
{
	OperandAttribute op_attr;
	op_attr.op_class = IMMEDIATE;
	op_attr.state = VALID;
	op_attr.value = Atoi(operand);

	return op_attr;
}

OperandAttribute VirtualMachine::GetAttribute( char *operand )
{
	if( IsReg(operand) )
		return GetRegAttribute(operand);
	else if( IsMem(operand) )
		return GetMemAttribute(operand);
	else if( IsImmediate(operand) )
		return GetImmediateAttribute(operand);
	else
	{
		OperandAttribute attr;
		attr.op_class = UNKNOWN;
		return attr;
	}
}

void VirtualMachine::Step( Instruction insn )
{
	char *mnemonic = insn.GetMnemonic();
	if( !strcmp(mnemonic, "push") )
		StepPush(insn);
	else if( !strcmp(mnemonic, "mov") )
		StepMov(insn);
	//else if( !strcmp(mnemonic, "lea") )
	//	StepLea(insn);
}

void VirtualMachine::StepPush( Instruction insn )
{
	OperandAttribute op_attr = GetAttribute(insn.GetOperand1());
	VMAttribute vm_attr;
	vm_attr.state = op_attr.state;
	vm_attr.value = op_attr.value;
	vmemory.SetMem( reg_set[RSP].value, vm_attr, op_attr.word_size );
	reg_set[RSP].value -= 8;
}

void VirtualMachine::StepMov( Instruction insn )
{
	OperandAttribute dest_attr = GetAttribute(insn.GetOperand1());
	OperandAttribute source_attr = GetAttribute(insn.GetOperand2());
	AssignAttribute( dest_attr, source_attr );
}
