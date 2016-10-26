#include <stdio.h>
#include <iostream>
#include <memory>
#include <stdexcept>
#include <sstream>
#include <fstream>

#include "lib.h"
#include "containers.h"
#include "disasm.h"
#include "parser.h"
#include "data.h"
#include "efi_mapper.h"

char *output_file_name = 0;
int threshold_percentage;

void usage()
{
	printf("./efi-mapper inputfile1 inputfile2\n");
}

typedef struct IndexPair
{
	int idx1;
	int idx2;
} IndexPair;

typedef struct EfiFile
{
	String GUID;
	String Path;
	String FileName;
} EfiFile;

typedef struct EdkInfo
{
	String BaseName;
	String GUID;
	String EntryPoint;
	String Path;
	String FileName;
} EdkInfo;

bool map_flag = true;
bool mac_ref_map;
bool mac_mac_map;
String edk_build_path;
vector<String> input;
vector<EfiFile> efi_file_list1;
vector<EfiFile> efi_file_list2;
vector<EdkInfo> edk_info_list;
vector<IndexPair> index_pair_list;

void ProcessMacFirmware(vector<EfiFile> &file_list, const char *dir_path)
{
	string input_dir;
	input_dir.assign(dir_path);
	if(input_dir[input_dir.size()-1] == '/')
		input_dir.pop_back();

	char buffer[128];
	string cmd;
	cmd += "find ";
	cmd += input_dir;
	cmd += " -name \"*PE32 image section*\"";
	string result = "";
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

	vector<String> internal;
	stringstream ss(result);
	string tok;

	while(getline(ss, tok, '\n')) {
		String token;
		token.SetString(tok.c_str());
		internal.push_back(token);
	}

	uint32_t file_num = internal.size();
	for(int i = 0; i < file_num; i++)
	{
		EfiFile efi_file;
		efi_file.Path = internal[i];
		efi_file.Path += "/body.bin";
		vector<String> tokens;
		internal[i].Tokenize(tokens, '/');

		uint32_t guid_idx = 0;
		uint32_t token_num = tokens.size();
		for(int j = token_num - 1; j >= 0; j--)
		{
			if(tokens[j].Find("Compressed section"))
			{
				guid_idx = j - 1;
				break;
			}
		}

		vector<String> guid_tokens;
		tokens[guid_idx].Tokenize(guid_tokens, ' ');
		efi_file.GUID.SetString(guid_tokens.back().GetString());
		efi_file.FileName = efi_file.GUID;
		efi_file.FileName += ".efi";
		file_list.push_back(efi_file);
	}
}

void ProcessEdkInfo(vector<EdkInfo> &edk_info_list, const char *build_path)
{
	string build_dir;
	build_dir.assign(build_path);
	if(build_dir[build_dir.size()-1] != '/')
		build_dir.push_back('/');

	string line;
	ifstream input("edk_info.txt");
	vector<string> info;

	int i = 0;
	while(getline(input, line))
	{
		if(i == 4)
		{
			EdkInfo edk_info;
			edk_info.BaseName =  info[0].c_str();
			edk_info.GUID = info[1].c_str();
			edk_info.EntryPoint = info[2].c_str();
			edk_info.Path = build_dir.c_str();
			edk_info.Path += info[3].c_str();
			edk_info.FileName = edk_info.BaseName;
			edk_info.FileName += ".dll";
			edk_info_list.push_back(edk_info);

			info.clear();
			i = 0;
		}
		string str;
		str.assign(line.c_str());
		info.push_back(str);
		i++;
	}
}

void GetGuidEqualList(vector<EfiFile> &efi_list, vector<EdkInfo> &edk_list, vector<IndexPair> &pair_list)
{
	uint32_t efi_file_num = efi_list.size();
	uint32_t edk_file_num = edk_list.size();
	for(int i = 0; i < efi_file_num; i++)
	{
		for(int j = 0; j < edk_file_num; j++)
		{
			if(!stricmp(efi_list[i].GUID.GetString(), edk_list[j].GUID.GetString()))
			{
				IndexPair pair;
				pair.idx1 = i;
				pair.idx2 = j;
				pair_list.push_back(pair);
				break;
			}
		}
	}
}

void GetGuidEqualList(vector<EfiFile> &efi_list1, vector<EfiFile> &efi_list2, vector<IndexPair> &pair_list)
{
	uint32_t efi_file_num1 = efi_list1.size();
	uint32_t efi_file_num2 = efi_list2.size();
	for(int i = 0; i < efi_file_num1; i++)
	{
		for(int j = 0; j < efi_file_num2; j++)
		{
			if(!stricmp(efi_list1[i].GUID.GetString(), efi_list2[j].GUID.GetString()))
			{
				IndexPair pair;
				pair.idx1 = i;
				pair.idx2 = j;
				pair_list.push_back(pair);
				break;
			}
		}
	}
}

void ProcessArgument(int argc, char *argv[])
{
	/*if(argc != 5)
	{
		fprintf(stderr, "[error] Wrong Usage\n");
		usage();
		return -1;
	}*/

	for(int i = 1; i < argc; i++)
	{
		if(!strcmp(argv[i], "--map"))
			map_flag = true;
		else if(!strcmp(argv[i], "--unmap"))
			map_flag = false;
		else if(!strcmp(argv[i], "--edk_build_path"))
			edk_build_path = argv[++i];
		else
			input.push_back(String(argv[i]));
	}

	int input_num = input.size();
	if(input_num == 0)
	{
		fprintf(stderr, "[error] no input\n");
		exit(1);
	}
	else if(input_num == 1)
	{
		if(edk_build_path.Length() == 0)
		{
			fprintf(stderr, "[error] edk build path not specified\n");
			exit(1);
		}
		mac_ref_map = true;
		mac_mac_map = false;
		ProcessMacFirmware(efi_file_list1, input[0].GetString());
		ProcessEdkInfo(edk_info_list, edk_build_path.GetString());
		GetGuidEqualList(efi_file_list1, edk_info_list, index_pair_list);
	}
	else if(input_num == 2)
	{
		mac_ref_map = false;
		mac_mac_map = true;
		ProcessMacFirmware(efi_file_list1, input[0].GetString());
		ProcessMacFirmware(efi_file_list2, input[1].GetString());
		GetGuidEqualList(efi_file_list1, efi_file_list2, index_pair_list);
	}
	else
	{
		fprintf(stderr, "[error] too many input\n");
		exit(1);
	}
}

void PrintMappingList()
{
	uint32_t index_pair_size = index_pair_list.size();
	if(mac_ref_map)
	{
		printf("[n] : MacFirmware-EFI-file\t\t\t\tReference-EFI-file\n");
		for(int i = 0; i < index_pair_size; i++)
		{
			uint32_t mac_idx = index_pair_list[i].idx1;
			uint32_t ref_idx = index_pair_list[i].idx2;
			const char *mac_file_name = efi_file_list1[mac_idx].FileName.GetString();
			const char *ref_file_name = edk_info_list[ref_idx].FileName.GetString();
			printf("[%d] : %s\t\t%s\n", i, mac_file_name, ref_file_name);
		}
	}
	else if(mac_mac_map)
	{
		printf("[n] : MacFirmware-EFI-file\t\t\t\tMacFirmware-EFI-file\n");
		for(int i = 0; i < index_pair_size; i++)
		{
			uint32_t mac_idx1 = index_pair_list[i].idx1;
			uint32_t mac_idx2 = index_pair_list[i].idx2;
			const char *mac_file_name1 = efi_file_list1[mac_idx1].FileName.GetString();
			const char *mac_file_name2 = efi_file_list2[mac_idx2].FileName.GetString();
			printf("[%d] : %s\t\t%s\n", i, mac_file_name1, mac_file_name2);
		}
	}
}

void StartMapper(int target_idx)
{
	uint32_t target_idx1 = index_pair_list[target_idx].idx1;
	uint32_t target_idx2 = index_pair_list[target_idx].idx2;
	char *input_path1;
	char *input_path2;
	if(mac_ref_map)
	{
		input_path1 = efi_file_list1[target_idx1].Path.GetString();
		input_path2 = edk_info_list[target_idx2].Path.GetString();
	}
	else if(mac_mac_map)
	{
		input_path1 = efi_file_list1[target_idx1].Path.GetString();
		input_path2 = efi_file_list2[target_idx2].Path.GetString();
	}

	CFileBuffer input_buffer1(input_path1);
	CFileBuffer input_buffer2(input_path2);
	input_buffer1.Read();
	input_buffer2.Read();
	Parser parser1, parser2;
	CDisassembler disasm_engine1, disasm_engine2;
	input_buffer1 >> parser1;
	input_buffer2 >> parser2;
	if(!parser1.Parse(&disasm_engine1))
	{
		printf("parse failed with %s\n", input_path1);
		return;
	}
	if(!parser2.Parse(&disasm_engine2))
	{
		printf("parse failed with %s\n", input_path2);
		return;
	}

	CTextFileBuffer assembly1, assembly2;
	disasm_engine1.OutFile >> assembly1;
	disasm_engine2.OutFile >> assembly2;
	/*fwrite(assembly1.Buf(), 1, assembly1.GetBufSize(), stdout);
	fwrite(assembly2.Buf(), 1, assembly2.GetBufSize(), stdout);*/
	
	Program prog1, prog2;
	prog1.SetFileName(input_path1);
	prog2.SetFileName(input_path2);
	disasm_engine1.ParseProgram(&prog1);
	disasm_engine2.ParseProgram(&prog2);
	if(mac_ref_map)
		prog2.SetEntryAddr(edk_info_list[target_idx2].EntryPoint.GetString());

	BlockMapper block_mapper(prog1, prog2);
	block_mapper.MapStart(map_flag);
	if(map_flag)
		block_mapper.DumpMapped();
	else
		block_mapper.DumpUnmapped();
	//block_mapper.PrintMappedFunc();
	/*for(int i = 0; i < block_mapper.MappedAddrList.size(); i++)
		printf("mapped addr : %llx %llx\n", block_mapper.MappedAddrList[i].addr1, block_mapper.MappedAddrList[i].addr2);*/

	parser1.Free();
	parser2.Free();
}

int Prompt()
{
	int target_idx;
	printf("select mapping target : ");
	scanf("%d", &target_idx);
	return target_idx;
}

void test(int argc, char *argv[])
{
	int j = 0;
	String input_file_name[2];
	String entry_point[2];
	for(int i = 1; i < argc; i++)
	{
		if(!strcmp(argv[i], "--map"))
			map_flag = true;
		else if(!strcmp(argv[i], "--unmap"))
			map_flag = false;
		else
		{
			char *dup = strdup(argv[i]);
			char *token = strtok(dup, ":");
			input_file_name[j].SetString(token);
			token = strtok(NULL, ":");
			entry_point[j].SetString(token);
			free(dup);
			j++;
		}
	}
	if(!input_file_name[0].GetString() && !input_file_name[1].GetString())
	{
		fprintf(stderr, "[error] no input file name\n");
		exit(1);
	}

	CFileBuffer input_buffer1(input_file_name[0].GetString());
	CFileBuffer input_buffer2(input_file_name[1].GetString());
	input_buffer1.Read();
	input_buffer2.Read();
	Parser parser1, parser2;
	CDisassembler disasm_engine1, disasm_engine2;
	input_buffer1 >> parser1;
	input_buffer2 >> parser2;
	if(!parser1.Parse(&disasm_engine1) || !parser2.Parse(&disasm_engine2))
	{
		printf("parse failed with %s\n", input_file_name[0].GetString());
		printf("parse failed with %s\n", input_file_name[1].GetString());
		exit(1);
	}

	CTextFileBuffer assembly1, assembly2;
	disasm_engine1.OutFile >> assembly1;
	disasm_engine2.OutFile >> assembly2;
	/*fwrite(assembly1.Buf(), 1, assembly1.GetBufSize(), stdout);
	fwrite(assembly2.Buf(), 1, assembly2.GetBufSize(), stdout);*/
	
	Program prog1, prog2;
	prog1.SetFileName(input_file_name[0].GetString());
	prog2.SetFileName(input_file_name[1].GetString());
	disasm_engine1.ParseProgram(&prog1);
	disasm_engine2.ParseProgram(&prog2);
	// TODO input entry addr process
	if(entry_point[0].GetString())
		prog1.SetEntryAddr(htoi(entry_point[0].GetString()));
	if(entry_point[1].GetString())
		prog2.SetEntryAddr(htoi(entry_point[1].GetString()));

	BlockMapper block_mapper(prog1, prog2);
	block_mapper.MapStart(map_flag);
	if(map_flag)
		block_mapper.DumpMapped();
	else
		block_mapper.DumpUnmapped();
	//block_mapper.PrintMappedFunc();
	/*for(int i = 0; i < block_mapper.MappedAddrList.size(); i++)
		printf("mapped addr : %llx %llx\n", block_mapper.MappedAddrList[i].addr1, block_mapper.MappedAddrList[i].addr2);*/

	input_file_name[0].Free();
	input_file_name[1].Free();
	entry_point[0].Free();
	entry_point[1].Free();
	parser1.Free();
	parser2.Free();
}

void disassemble(int argc, char *argv[])
{
	CFileBuffer input_buffer1(argv[1]);
	input_buffer1.Read();
	Parser parser1;
	CDisassembler disasm_engine1;
	input_buffer1 >> parser1;
	if(!parser1.Parse(&disasm_engine1))
	{
		printf("parse failed with %s\n", argv[1]);
		exit(1);
	}

	CTextFileBuffer assembly1;
	disasm_engine1.OutFile >> assembly1;
	fwrite(assembly1.Buf(), 1, assembly1.GetBufSize(), stdout);

	Program prog1;
	disasm_engine1.ParseProgram(&prog1);
	prog1.PrintFunctions();
}

int main(int argc, char * argv[]) {

	//disassemble(argc, argv);
	test(argc, argv);
	/*ProcessArgument(argc, argv);
	while(1)
	{
		PrintMappingList();
		int target_idx = Prompt();
		StartMapper(target_idx);
	}*/

	return 0;
}

