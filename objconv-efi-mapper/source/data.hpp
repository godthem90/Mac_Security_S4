#ifndef _DATA_H_
#define _DATA_H_

#include<iostream>
#include<cstdio>
#include<cstdlib>
#include<vector>
#include<string>
#include<cstring>
#include<map>

using namespace std;

typedef struct graphInData{
	string address;
	string opcode;
	vector<string> operand;
}graphInData;

typedef struct registerSet{
	string reg[16];
	//rax, rbx, rcx, rdx, rsi, rdi, rbp, rsp, r8, r9, r10, r11, r12, r13, r14, r15
}registerSet;

class myGraph{
	private:
		string blockStartAddress;	// Block Split
		vector<graphInData> inData;	// Block Code Flow -> Register Check
		vector<myGraph> flow;		// Graph Flow -> Using all search
	public:
		registerSet reg;
		void pushData(vector<string> data); // Insert Block Data ex) opcode, operand, address
		void printGraph();
		void setBlockStart(string address);
		vector<graphInData> getInData();
		string getBlockStart();
		vector<myGraph> getFlowGraph();
		void printFlowGraph();
		void init(myGraph g, map<string, myGraph> temp); // Insert next Block and Jmp Block
};

#endif

