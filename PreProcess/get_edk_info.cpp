#include <stdio.h>
#include <string.h>
#include <vector>
#include <string>
#include <iostream>
#include <memory>
#include <stdexcept>
#include <sstream>
#include <fstream>

using namespace std;

int main(int argc, char *argv[])
{
	if(argc != 2)
	{
		printf("need one argument\n");
		return 1;
	}

	string input_dir;
	input_dir.assign(argv[1]);
	if(input_dir[input_dir.size()-1] == '/')
		input_dir.pop_back();

	char buffer[128];
	string cmd;
	cmd += "find ";
	cmd += input_dir;
	cmd += " -name \"*.inf\"";
	string result = "";
	shared_ptr<FILE> pipe(popen(cmd.c_str(), "r"), pclose);
	if (!pipe) throw runtime_error("popen() failed!");
	while (!feof(pipe.get())) {
		if (fgets(buffer, 128, pipe.get()) != NULL)
			result += buffer;
	}

	vector<string> internal;
	stringstream ss(result);
	string tok;

	while(getline(ss, tok, '\n')) {
		internal.push_back(tok);
	}

	uint32_t file_num = internal.size();
	for(int i = 0; i < file_num; i++)
	{
		string line;
		ifstream input(internal[i].c_str());
		vector<string> info;
		while(getline(input, line))
		{
			if(strstr(line.c_str(), "BASE_NAME"))
			{
				string str;
				str.assign(line.c_str());
				info.push_back(str);
			}
			if(strstr(line.c_str(), "FILE_GUID"))
			{
				string str;
				str.assign(line.c_str());
				info.push_back(str);
			}
			if(strstr(line.c_str(), "ENTRY_POINT"))
			{
				string str;
				str.assign(line.c_str());
				info.push_back(str);
			}
			if(info.size() == 3)
			{
				printf("%s\n", info[0].c_str());
				printf("%s\n", info[1].c_str());
				printf("%s\n\n", info[2].c_str());
				break;
			}
		}
	}
}
