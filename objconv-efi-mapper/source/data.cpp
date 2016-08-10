#include "data.hpp"

void myGraph::pushData(vector<string> data){
	graphInData *temp = new graphInData;
	temp->address = data[0];
	temp->opcode = data[1];
	vector<string>::iterator it = data.begin();
	advance(it, 2);
	for(it; it != data.end(); it++){
		temp->operand.push_back(*it);
	}
	inData.push_back(*temp);
/*	Check Right variable
	cout << temp->address << endl;
	cout << temp->opcode << endl;
	it = temp->operand.begin();
	for(it; it!= temp->operand.end(); it++){
		cout << *it << endl;
	}
*/
	delete temp;
}
void myGraph::setBlockStart(string address){
	blockStartAddress = address;
/* Check Right address
	cout << address << endl;
*/
}
string myGraph::getBlockStart(){
	return blockStartAddress;
}
void myGraph::printGraph(){
	vector<graphInData>::iterator it = inData.begin();
	for(it; it!=inData.end(); it++){
		cout << it->address << " " << it->opcode << endl;
	}
}

void myGraph::init(myGraph g, map<string, myGraph> temp){
//	for(map<string, myGraph>::iterator it = temp.begin(); it != temp.end(); it++){
//		cout << it->first << "a" << endl;
//		cout << it->second.getBlockStart() << "a" << endl;
//	}
	bool check = false;
	string condJmp[] = { "jmp", "ja", "jae", "jb", "jbe", "jc", "jcxz", "jecxz", "jrcxz", "je", "jg", "jge", "jl", "jle", "jna", "jnae", "jnb", "jnbe", "jnc", "jne", "jng", "jnge", "jnl", "jnle", "jno", "jnp", "jns", "jnz", "jo", "jp", "jpe", "jpo", "js", "jz", };
	int size = inData.size();
	int compareSize = sizeof(condJmp)/sizeof(string);
	for(int i = 0; i < size; i++){
		for(int j = 0; j < compareSize; j++){
			if(inData[i].opcode == condJmp[j]){
//				/*
//					Check Opcode
//					cout << "opcode" << inData[i].opcode << "operand" << inData[i].operand[0] << endl;
//				*/
//				cout << temp[inData[i].operand[0]].getBlockStart() << endl;
				if(inData[i].opcode == "jmp") check = true;
				flow.push_back(temp[inData[i].operand[0]]);
//				cout << "flow size : " << flow.size() << endl;
			}
		}
	}
	if(!check) flow.push_back(g);	
}
void myGraph::printRegisterSet(){
}
void myGraph::printFlowGraph(){
	int size = flow.size();
	for(int i = 0; i < size; i++){
		cout << flow[i].getBlockStart() << endl;
	}
	cout << endl;
}
vector<myGraph> myGraph::getFlowGraph(){
	return flow;
}

vector<graphInData> myGraph::getInData(){
	return inData;
}
void myGraph::printResult(){
	for(int i = 0; i<16; i++){
		for(set<string>::iterator it=result[i].begin(); it!=result[i].end(); it++){
		cout << *it << "\t\t\t\t";
	}
		cout << endl;
	}
}
