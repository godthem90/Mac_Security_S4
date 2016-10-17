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

void ExecFind(string &result2, const char *input_dir, const char *base_name)
{
	char buffer[128];
	string cmd;
	cmd += "find ";
	cmd += input_dir;
	cmd += " -name ";
	cmd += base_name;
	cmd += ".dll";
	string result;
	shared_ptr<FILE> pipe(popen(cmd.c_str(), "r"), pclose);
	if (!pipe)
	{
		fprintf(stderr, "[error] popen() failed!\n");
		exit(1);
	}
	while (!feof(pipe.get())) {
		if (fgets(buffer, 128, pipe.get()) != NULL)
			result += buffer;
	}

	stringstream ss(result);
	string tok;

	vector<string> internal;
	while(getline(ss, tok, '\n')) {
		internal.push_back(tok);
	}

	if(internal.size() > 0)
	{
		int build_dir_len = strlen(input_dir) + 1;
		for(int i = 0; i < build_dir_len; i++)
			internal[0].erase(internal[0].begin());
		result2 = internal[0];
	}
	if(internal.size() > 1)
		fprintf(stderr, "there is more than one dlls of %s\n",base_name);
}

int main(int argc, char *argv[])
{

	string input_dir;
	input_dir.assign(argv[1]);
	if(input_dir[input_dir.size()-1] == '/')
		input_dir.pop_back();

	string line;
	ifstream input("edk_inf_extract.txt");
	vector<string> info;

	int i = 0;
	while(getline(input, line))
	{
		if(i == 3)
		{
			printf("%s\n", info[0].c_str());
			printf("%s\n", info[1].c_str());
			printf("%s\n", info[2].c_str());
			string dll_path;
			ExecFind(dll_path, input_dir.c_str(), info[0].c_str());
			printf("%s\n",dll_path.c_str());
			info.clear();
			i = 0;
			continue;
		}
		string str;
		str.assign(line.c_str());
		info.push_back(str);
		i++;
	}
}
