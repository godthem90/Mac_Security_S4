#include<cstdio>
#include<cstdlib>
#include<string>
#include<cstring>
#include<iostream>
#include<fstream>

using namespace std;

class opcode{
	public:
		string op[100];
		bool match[100];
		int count;
		void printop();
};



int main(int argc, char* argv[]){
	int num1 = 0, num2 = 0, cnt = 0, all;
	ifstream file1(argv[1]);
	ifstream file2(argv[2]);
	ofstream file3("compareresult.txt");
	opcode compare1[1000], compare2[1000];
	while(!file1.eof()){
		getline(file1, compare1[num1].op[cnt++]);
		if(compare1[num1].op[cnt-1] == ""){
			compare1[num1].count = cnt-1;
			num1 += 1;
			cnt = 0;
		}
	}
	cnt = 0;
	while(!file2.eof()){
		getline(file2, compare2[num2].op[cnt++]);
		if(compare2[num2].op[cnt-1] == ""){
			compare2[num2].count = cnt-1;
			num2 += 1;
			cnt = 0;
		}
	}
	for(int i = 0; i < num1; i++){
		for(int j = 0; j < num2; j++){
			if(compare1[i].count > compare2[j].count){
				all = compare1[i].count;
			}
			else all = compare2[j].count;
			int match = 0;
			for(int k = 0; k < compare1[i].count; k++){
				for(int l = 0; l < compare2[j].count; l++){
					if(compare1[i].op[k] == compare2[j].op[l] && !compare2[j].match[l]){
						compare2[j].match[l] = true;
						match++;
						break;
					}
				}
			}
			if((match*100/all) > 50){
				file3 << i << " Block and " << j << " Block matching " << match*100/all << endl;
			}
			for(int k = 0; k < compare2[j].count; k++){
				compare2[j].match[k] = false;
			}
		}
	}
}





