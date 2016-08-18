#include "stdafx.h"
#include "data.hpp"

char *input_file_name = 0;
char *input_file_name1 = 0;
char *input_file_name2 = 0;
char *output_file_name = 0;

vector<myGraph> graph;
vector< pair<string, registerSet> > res;

map<string, myGraph> mapper;
map<string, int> visit;

bool CorrectIntegerTypes() {
   if (
      sizeof(uint8) != 1 ||
      sizeof(int16) != 2 ||
      sizeof(int32) != 4 ||
      sizeof(int64) != 8) {
	   return false;
   }

   return true;
}

bool CorrectEndianness() {
   static uint8 bytes[4] = {1, 2, 3, 4};
   if (*(uint32*)bytes != 0x04030201) {
      return false;
   }
   return true;
}

void usage()
{
	printf("./efi-mapper inputfile1 inputfile2\n");
}

struct MappedBlock
{
	int idx1;
	int idx2;
};

/*class BlockMapper
{
public:
	BlockMapper(Disassembler *d1, Disassembler *d2);
	void MapCodeBlock();
	void MappedBlockDump();
	void Dump();

private:
	Disassembler *dis1;
	Disassembler *dis2;
	CSList<MappedBlock> MappedBlockList;

	int DiffBlock(int i, int j);
};

BlockMapper::BlockMapper(Disassembler *d1, Disassembler *d2)
{
	dis1 = d1;
	dis2 = d2;
}

int BlockMapper::DiffBlock(int block_idx1, int block_idx2)
{
	int op1, op2;
	int op_idx1 = 0, op_idx2 = 0;
	int op_num1 = dis1->GetOpcodeNumInBlock(block_idx1);
	int op_num2 = dis2->GetOpcodeNumInBlock(block_idx2);
	bool *matched = new bool[op_num2];
	for( int i = 0; i < op_num2; i++ )
		matched[i] = false;

	int all_insn = 0, match_insn = 0;
	all_insn = (op_num1 > op_num2 ? op_num1 : op_num2);

	while( (op1 = dis1->GetOpcodeInBlock(block_idx1, op_idx1++)) != -1 )
	{
		while( (op2 = dis2->GetOpcodeInBlock(block_idx2, op_idx2++)) != -1 )
		{
			if( op1 == op2 && !matched[op_idx2] )
			{
				matched[op_idx2] = true;
				match_insn++;
				break;
			}
		}
		op_idx2 = 0;
	}
	delete[] matched;

	return match_insn * 100 / all_insn;
}

void BlockMapper::MapCodeBlock()
{
	int block_num1 = dis1->GetCodeBlockNum();
	int block_num2 = dis2->GetCodeBlockNum();
	int mapped_block_idx;
	int max_percentage = 0;

	int i, j;
	for( i = 1; i <= block_num1; i++ )
	{
		for( j = 1; j <= block_num2; j++ )
		{
			int percentage = DiffBlock(i, j);
			if( percentage >= max_percentage )
			{
				mapped_block_idx = j;
				max_percentage = percentage;
			}
		}
		if( max_percentage >= 50 )
		{
			struct MappedBlock mapped_block;
			mapped_block.idx1 = i;
			mapped_block.idx2 = mapped_block_idx;
			MappedBlockList.Push(mapped_block);
		}
	}
}

void BlockMapper::Dump()
{
	int block_num1 = dis1->GetCodeBlockNum();

	int block_idx;
	for( block_idx = 1; block_idx <= block_num1; block_idx++ )
	{
		int op_num1 = dis1->GetOpcodeNumInBlock(block_idx);
		printf("op num #%d :  ",op_num1);

		short op1;
		int op_idx1 = 0;
		while( (op1 = dis1->GetOpcodeInBlock(block_idx, op_idx1++)) != -1 )
		{
			printf("%x  ",op1);
		}
		printf("\n");
	}
}*/

vector<string> split(string splitStr){
	int size = splitStr.size();
	int check = 0, pos = 0;
	vector<string> ret;
	for(int i = 0; i < size; i++){
	if((check == 0 || check == 1) && splitStr[i] == ' '){
			ret.push_back(splitStr.substr(pos, i-pos));
			pos = i+1;
			++check;
		}
		else if(check >= 2 && splitStr[i] == ','){
			ret.push_back(splitStr.substr(pos, i-pos));
			pos = i+2;
			++check;	
		}
		else if(i == size-1){
			ret.push_back(splitStr.substr(pos, i-pos+1));
		}
	}
	ret[0] = ret[0].substr(4, 4);
	ret[0] += 'H';
	return ret;
}
int operandCheck(string regi){
	if(regi.find("a")!=string::npos) return 1;
	else if(regi.find("bx")!=string::npos || regi.find("bl")!=string::npos) return 2;
	else if(regi.find("c")!=string::npos) return 3;
	else if(regi.find("dx")!=string::npos || regi.find("dl")!=string::npos) return 4;
	else if(regi.find("si")!=string::npos) return 5;
	else if(regi.find("di")!=string::npos) return 6;
	else if(regi.find("sp")!=string::npos) return 7;
	else if(regi.find("bp")!=string::npos) return 8;
	else if(regi.find("r8")!=string::npos) return 9;
	else if(regi.find("r9")!=string::npos) return 10;
	else if(regi.find("r10")!=string::npos) return 11;
	else if(regi.find("r11")!=string::npos) return 12;
	else if(regi.find("r12")!=string::npos) return 13;
	else if(regi.find("r13")!=string::npos) return 14;
	else if(regi.find("r14")!=string::npos) return 15;
	else if(regi.find("r15")!=string::npos) return 16;
	else return -1;
}
void depthFirstSearch(myGraph g, registerSet reg){
	visit[g.getBlockStart()] = 1;
	vector<graphInData> inData = g.getInData();
	int zeroRegister, oneRegister;
	g.reg = reg;
	for(vector<graphInData>::iterator it = inData.begin(); it != inData.end(); it++){
		if(it->opcode.find("mov")!=string::npos || it->opcode.find("lea")!=string::npos){
			zeroRegister = operandCheck(it->operand[0]);
			oneRegister = operandCheck(it->operand[1]);
			if(zeroRegister == -1) break;
			else if(oneRegister == -1){
				reg.sRegister[zeroRegister-1] = it->operand[1];
			}
			else{
				if(!reg.sRegister[oneRegister-1].empty()){
					reg.sRegister[zeroRegister-1] = reg.sRegister[oneRegister-1];
				}
				else reg.sRegister[zeroRegister-1] = "Unknown";
			}
			g.reg = reg;
		}
		else if(it->opcode.find("add")!=string::npos){
			zeroRegister = operandCheck(it->operand[0]);
			oneRegister = operandCheck(it->operand[1]);
			if(zeroRegister == -1) break;
			else if(oneRegister == -1){
				if(!reg.sRegister[zeroRegister-1].empty()){
					reg.sRegister[zeroRegister-1] = reg.sRegister[zeroRegister-1];
				}
				else g.reg.sRegister[zeroRegister-1] = "Unknown";
				reg.sRegister[zeroRegister-1] += "+";
				reg.sRegister[zeroRegister-1] += it->operand[1];
			}
			else{
				if(!reg.sRegister[zeroRegister-1].empty()){
					reg.sRegister[zeroRegister-1] = reg.sRegister[zeroRegister-1];
				}
				else reg.sRegister[zeroRegister-1] = "Unknown";
				reg.sRegister[zeroRegister-1] += "+";
				reg.sRegister[zeroRegister-1] += reg.sRegister[oneRegister-1];
			}
			g.reg = reg;
		}
		else if(it->opcode.find("sub")!=string::npos){
			zeroRegister = operandCheck(it->operand[0]);
			oneRegister = operandCheck(it->operand[1]);
			if(zeroRegister == -1) break;
			else if(oneRegister == -1){
				if(!reg.sRegister[zeroRegister-1].empty()){
					reg.sRegister[zeroRegister-1] = reg.sRegister[zeroRegister-1];
				}
				else reg.sRegister[zeroRegister-1] = "Unknown";
				reg.sRegister[zeroRegister-1] += "-";
				reg.sRegister[zeroRegister-1] += it->operand[1];
			}
			else{
				if(!reg.sRegister[zeroRegister-1].empty()){
					reg.sRegister[zeroRegister-1] = reg.sRegister[zeroRegister-1];
				}
				else reg.sRegister[zeroRegister-1] = "Unknown";
				reg.sRegister[zeroRegister-1] += "-";
				reg.sRegister[zeroRegister-1] += reg.sRegister[oneRegister-1];
			}
			g.reg = reg;
		}
		else if(it->opcode.find("inc")!=string::npos){
			zeroRegister = operandCheck(it->operand[0]);
			if(zeroRegister == -1) break;
			else{
				reg.sRegister[zeroRegister-1] = reg.sRegister[zeroRegister-1] + "+1";
			}
		}
		else if(it->opcode.find("dec")!=string::npos){
			zeroRegister = operandCheck(it->operand[0]);
			if(zeroRegister == -1) break;
			else{
				reg.sRegister[zeroRegister-1] = reg.sRegister[zeroRegister-1] + "-1";
			}
		}
		else if(it->opcode.find("xor")!=string::npos){
			zeroRegister = operandCheck(it->operand[0]);
			oneRegister = operandCheck(it->operand[1]);
			if(zeroRegister == -1) break;
			else if(zeroRegister == oneRegister) g.reg.sRegister[zeroRegister-1] = "0";
			else{
				if(!reg.sRegister[zeroRegister-1].empty()){
					reg.sRegister[zeroRegister-1] = reg.sRegister[zeroRegister-1];
					reg.sRegister[zeroRegister-1] += "XOR";
				}
				if(!reg.sRegister[oneRegister-1].empty()){
					reg.sRegister[zeroRegister-1] += reg.sRegister[oneRegister-1];
				}
				else reg.sRegister[zeroRegister-1] += it->operand[1];
			}
			g.reg = reg;
		}
		else if(it->opcode.find("or")!=string::npos){
			if(zeroRegister == -1) break;
			else if(oneRegister != -1){
				if(!reg.sRegister[zeroRegister-1].empty()){
					reg.sRegister[zeroRegister-1] += "OR";
				}
				if(!reg.sRegister[oneRegister-1].empty()){
					reg.sRegister[zeroRegister-1] += reg.sRegister[oneRegister-1];
				}
				else reg.sRegister[zeroRegister-1] += it->operand[1];
			}
			g.reg = reg;
		}
		else if(it->opcode.find("and")!=string::npos){
			if(zeroRegister == -1) break;
			else if(oneRegister != -1){
				if(!reg.sRegister[zeroRegister-1].empty()){
					reg.sRegister[zeroRegister-1] += "AND";
				}
				if(!reg.sRegister[oneRegister-1].empty()){
					reg.sRegister[zeroRegister-1] += reg.sRegister[oneRegister-1];
				}
				else reg.sRegister[zeroRegister-1] += it->operand[1];
			}
			g.reg = reg;
		}
		else if(it->opcode.find("call")!=string::npos){
			reg.sRegister[0] = "callUnknown";
			reg.sRegister[2] = "callUnknown";
			reg.sRegister[3] = "callUnknown";
			reg.sRegister[6]= "callUnknown";
			reg.sRegister[7] = "callUnknown";
			reg.sRegister[8] = "callUnknown";
			reg.sRegister[9] = "callUnknown";
			reg.sRegister[10] = "callUnknown";
			reg.sRegister[11] = "callUnknown";
			g.reg = reg;
		}	
	}
	vector<myGraph> temp = g.getFlowGraph();
	res.push_back(make_pair(g.getBlockStart(), reg));
	for(int i = 0; i < 16; i++){
			mapper[g.getBlockStart()].result[i].insert(reg.sRegister[i]);
	}
	if(temp.size() == 0){

		for(vector<pair<string, registerSet> >::iterator it = res.begin(); it != res.end(); it++){
			cout << it->first << " ";
			cout << "rax " << it->second.sRegister[0] << " ";
			cout << "rbx " << it->second.sRegister[1] << " ";
			cout << "rcx " << it->second.sRegister[2] << " ";
			cout << "rdx " << it->second.sRegister[3] << " ";
			cout << "rsi " << it->second.sRegister[4] << " ";
			cout << "rdi " << it->second.sRegister[5] << " ";
			cout << "rsp " << it->second.sRegister[6] << " ";
			cout << "rbp " << it->second.sRegister[7] << " ";
			cout << "r8 " << it->second.sRegister[8] << " ";
			cout << "r9 " << it->second.sRegister[9] << " ";
			cout << "r10 " << it->second.sRegister[10] << " ";
			cout << "r11 " << it->second.sRegister[11] << " ";
			cout << "r12 " << it->second.sRegister[12] << " ";
			cout << "r13 " << it->second.sRegister[13] << " ";
			cout << "r14 " << it->second.sRegister[14] << " ";
			cout << "r15 " << it->second.sRegister[15] << " ";
			cout << endl;
		}
		cout << endl;

		return;
	}
	else {
		int size = temp.size();
		for(int i = 0; i < size; i++){
			if(!visit[temp[i].getBlockStart()]){
				depthFirstSearch(mapper[temp[i].getBlockStart()], g.reg);
				res.pop_back();
				visit[temp[i].getBlockStart()] = 0;
			}
		}
	}
}
vector<string> splitBuf(char *buf){
	int size = strlen(buf);
	vector<string> ret;
	string temp;
	for(int i = 0; i < size; i++){
		if(buf[i] != '\n' && buf[i] !='\r') temp.push_back(buf[i]);
		else if(buf[i] == '\n'){
			ret.push_back(temp);
			temp.clear();
		}
		else if(i == size-1){
			ret.push_back(temp);
		}
	}
	return ret;
}
void initMapper(vector<myGraph> temp){
	for(vector<myGraph>::iterator it = temp.begin(); it != temp.end(); it++){
		mapper[it->getBlockStart()] = *it;
//		mapper[it->getBlockStart()].printGraph();
//		cout << endl;	
//		cout << "addr : " << it->getBlockStart() << endl;
	}
}
int main(int argc, char * argv[]) {
	if(!CorrectIntegerTypes())
	{
		fprintf(stderr, "[error] Incorrect Integer Type\n");
		return -1;
	}
	if(!CorrectEndianness())
	{
		fprintf(stderr, "[error] Incorrect Endian (big-endian)\n");
		return -1;
	}

	if(argc != 3)
	{
		fprintf(stderr, "[error] Wrong Usage\n");
		usage();
		return -1;
	}

	input_file_name1 = argv[1];
	input_file_name2 = argv[2];

	CFileBuffer input_buffer1(input_file_name1);
	input_buffer1.Read();
	CFileBuffer input_buffer2(input_file_name2);
	input_buffer2.Read();

	Parser parser1, parser2;
	CDisassembler disasm_engine1, disasm_engine2;
	input_buffer1 >> parser1;
	input_buffer2 >> parser2;
	parser1.Parse(&disasm_engine1);
	parser2.Parse(&disasm_engine2);

	char *buf = new char[1000];
	disasm_engine1.SetFunctionDescriptor( 0x2af8 );
	while( disasm_engine1.GetBlockInFunction( buf ) != -1 ){
		myGraph *block = new myGraph;
		vector<string> ret = splitBuf(buf);
		bool first = true;
		for(vector<string>::iterator it = ret.begin(); it != ret.end(); it++){
			vector<string> inputData = split(*it);
			if(first){
				block->setBlockStart(inputData[0]);
				first = false;
			}
			block->pushData(inputData);
		}
//		block->printGraph();
//		cout << endl;
		graph.push_back(*block);
		delete block;
	//	printf("%s\n", buf);
	}
	initMapper(graph);

//	for(map<string, myGraph>::iterator it = mapper.begin(); it!=mapper.end(); it++){
//		cout << "map value" << (it->first) << endl;
//	}
	for(vector<myGraph>::iterator it = graph.begin(); it != graph.end()-1; it++){
		it->init(*(it+1), mapper);
//		it->printFlowGraph();
//		cout << "------------------" << endl;
	}
	initMapper(graph);
	cout << "Insert Initial Register" << endl;
	cout << "rax, rbx, rcx, rdx, rsi, rdi, rbp, rsp, r8, r9, r10, r11, r12, r13, r14, r15" << endl;
	for(int i = 0; i < 16; i++){
		cin >> graph[0].reg.sRegister[i];
	}	
	depthFirstSearch(graph[0], graph[0].reg);
	for(map<string, myGraph>::iterator it = mapper.begin(); it != mapper.end(); it++){
		it->second.printResult();
		cout << endl;
	}
/*
	disasm_engine2.SetFunctionDescriptor( 0x4010 );
	while( disasm_engine2.GetBlockInFunction( buf ) != -1 ){
		myGraph *block = new myGraph;
		vector<string> ret = splitBuf(buf);
		bool first = true;
		for(vector<string>::iterator it = ret.begin(); it != ret.end(); it++){
			vector<string> inputData = split(*it);
			if(first){
				block->setBlockStart(inputData[0]);
				first = false;
			}
			block->pushData(inputData);
		}
		block->printGraph();
		cout << endl;
		graph.push_back(*block);
		delete block;
//		printf("%s\n", buf);
	}
*/
	delete[] buf;
	//BlockMapper block_mapper( &disassembler1, &disassembler2 );
	//block_mapper.Dump();

	parser1.Free();
	parser2.Free();

	return 0;
}

