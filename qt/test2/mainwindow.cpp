#include <stdio.h>
#include <iostream>
#include <sstream>
#include <fstream>
#include <memory>
#include <stdexcept>

#include "lib1.h"
#include "containers.h"
#include "disasm.h"
#include "parser.h"
#include "data.h"
#include "efi_mapper.h"

#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "opentwofiles.h"

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
    QString path = QCoreApplication::applicationDirPath();
    qDebug() << path;
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
    /*if(map_flag)
        block_mapper.DumpMapped();
    else
        block_mapper.DumpUnmapped();*/
    block_mapper.PrintMappedFunc();
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

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    ui->textEdit->setReadOnly(true);
    ui->textEdit_2->setReadOnly(true);
    model = new QStandardItemModel(0, 2, this);
    model->setHorizontalHeaderItem(0, new QStandardItem(QString("")));
    model->setHorizontalHeaderItem(1, new QStandardItem(QString("")));
    ui->tableView->setModel(model);
    model2 = new QStandardItemModel(0, 2, this);
    model2->setHorizontalHeaderItem(0, new QStandardItem(QString("")));
    model2->setHorizontalHeaderItem(1, new QStandardItem(QString("")));
    ui->tableView_2->setModel(model2);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_actionOpen_triggered()
{
    openTwoFiles dialog(this);
    int ret = dialog.exec();
    delete model;
    delete model2;
    model = new QStandardItemModel(0, 2, this);
    model->setHorizontalHeaderItem(0, new QStandardItem(QString("MacFirmware")));
    model->setHorizontalHeaderItem(1, new QStandardItem(QString("Reference Code")));
    ui->tableView->setModel(model);
    model2 = new QStandardItemModel(0, 2, this);
    model2->setHorizontalHeaderItem(0, new QStandardItem(QString("MacFirmware")));
    model2->setHorizontalHeaderItem(1, new QStandardItem(QString("Reference Code")));
    ui->tableView_2->setModel(model2);
    if(ret == openTwoFiles::Accepted){
        ui->textEdit->clear();
        ui->textEdit_2->clear();
        mac_ref_map = true;
        mac_mac_map = false;
        filename1 = dialog.getFilename1();
        filename2 = dialog.getFilename2();
        qDebug() << filename1;
        qDebug() << filename2;
        ProcessMacFirmware(efi_file_list1, filename1.toStdString().c_str());
        ProcessEdkInfo(edk_info_list, filename2.toStdString().c_str());
        GetGuidEqualList(efi_file_list1, edk_info_list, index_pair_list);
        int size = index_pair_list.size();
        for(int i = 0; i < size; i++){
            String filename = efi_file_list1[index_pair_list[i].idx1].FileName;
            String filename2 = edk_info_list[index_pair_list[i].idx2].FileName;
            QStandardItem *item = new QStandardItem(QString(filename.GetString()));
            model2->appendRow(item);
            QStandardItem *item2 = new QStandardItem(QString(filename2.GetString()));
            model2->setItem(model2->rowCount()-1, 1, item2);
        }
        tc = ui->textEdit->textColor();
    }
}

void MainWindow::on_textEdit_cursorPositionChanged()
{
    QTextCursor cursor = ui->textEdit->textCursor();
    QTextCursor cursor2 = ui->textEdit_2->textCursor();
    int pos = cursor.position();
    for(auto it = map1.begin(); it!=map1.end(); it++){
        if((*it).first <= pos && (*it).second >= pos){
            cursor2.movePosition(QTextCursor::End);
            ui->textEdit_2->setTextCursor(cursor2);
            cursor2.setPosition(map2[map12[it.key()]].first);
            ui->textEdit_2->setTextCursor(cursor2);
            break;
        }
    }
}


void MainWindow::on_tableView_2_pressed(const QModelIndex &index)
{
    ui->textEdit->setTextColor(tc);
    ui->textEdit_2->setTextColor(tc);
    map1.clear();
    map12.clear();
    map2.clear();
    map21.clear();
    functionmapped.clear();
    functionmapped2.clear();
    ui->textEdit->clear();
    ui->textEdit_2->clear();
    model->clear();
    String input_path1, input_path2;
    if(mac_mac_map){
        input_path1 = efi_file_list1[index_pair_list[index.row()].idx1].Path;
        input_path2 = efi_file_list2[index_pair_list[index.row()].idx2].Path;
    }
    else{
        input_path1 = efi_file_list1[index_pair_list[index.row()].idx1].Path;
        input_path2 = edk_info_list[index_pair_list[index.row()].idx2].Path;
    }
    CFileBuffer input_buffer1(input_path1.GetString());
    CFileBuffer input_buffer2(input_path2.GetString());
    Parser parser1, parser2;
    CDisassembler disasm_engine1, disasm_engine2;
    input_buffer1.Read();
    input_buffer2.Read();
    input_buffer1 >> parser1;
    input_buffer2 >> parser2;
    parser1.Parse(&disasm_engine1);
    parser2.Parse(&disasm_engine2);

    CTextFileBuffer assembly1, assembly2;
    disasm_engine1.OutFile >> assembly1;
    disasm_engine2.OutFile >> assembly2;

    char *assem1 = assembly1.Buf();
    char *assem2 = assembly2.Buf();
    QString assem1Q(assem1);
    QString assem2Q(assem2);
    QStringList assem1_list = assem1Q.split("\n");
    QStringList assem2_list = assem2Q.split("\n");

    Program prog1, prog2;
    prog1.SetFileName(input_path1.GetString());
    prog2.SetFileName(input_path2.GetString());

    disasm_engine1.ParseProgram(&prog1);
    disasm_engine2.ParseProgram(&prog2);

    if(mac_ref_map){
        prog2.SetEntryAddr(edk_info_list[index_pair_list[index.row()].idx2].EntryPoint.GetString());
    }


    BlockMapper block_mapper(prog1, prog2);
    block_mapper.MapStart(true);

    uint32_t mapped_func_num = block_mapper.MappedFunctionList.size();
    for(int i = 0; i < mapped_func_num; i++){
        MappedFunction mapped_func = block_mapper.MappedFunctionList[i];
        uint64_t func_addr1 = block_mapper.prog1[mapped_func.idx1].StartAddress;
        uint64_t func_addr2 = block_mapper.prog2[mapped_func.idx2].StartAddress;

        const char *sym_name1 = block_mapper.prog1.GetSymbolName(func_addr1);
        const char *sym_name2 = block_mapper.prog2.GetSymbolName(func_addr2);
        if(sym_name1){
            QStandardItem *item = new QStandardItem(QString(sym_name1));
            model->appendRow(item);
        }
        else{
            QString temp;
            temp.sprintf("%08llx", func_addr1);
            QStandardItem *item = new QStandardItem(temp);
            model->appendRow(item);
        }
        if(sym_name2){
            QStandardItem *item = new QStandardItem(QString(sym_name2));
            model->setItem(model->rowCount()-1, 1, item);
        }
        else{
            QString temp;
            temp.sprintf("%08llx", func_addr2);
            QStandardItem *item = new QStandardItem(temp);
            model->setItem(model->rowCount()-1, 1, item);
        }
    }
    qDebug() << block_mapper.MappedAddrList.size();
    qDebug() << block_mapper.notMappedAddrList.size();

    for(int i = 0; i < assem1_list.size(); i++){
        QString temp;
        bool check = false;

        for(int j = 0; j<block_mapper.MappedAddrList.size(); j++){
            temp.sprintf("%08llx", block_mapper.MappedAddrList[j].addr1);
            if(assem1_list[i].contains(temp, Qt::CaseInsensitive)){
                check = true;
                uint32_t count = block_mapper.MappedAddrList[j].num1;
                ui->textEdit->setTextColor(QColor("green"));
                QString countMatch;
                QString temp2;
                temp2.sprintf("%08llx", block_mapper.MappedAddrList[j].addr2);
                map12[temp] = temp2;
                map1[temp].first = ui->textEdit->textCursor().position();
                countMatch.sprintf("%d", j+1);
                ui->textEdit->append("\n"+countMatch);
                while(count--){
                    bool check1 = false;
                    for(int k = 0; k < block_mapper.notMappedAddrList.size(); k++){
                        QString addr;
                        addr.sprintf("%08llx", block_mapper.notMappedAddrList[k].addr1);
                        if(assem1_list[i].contains(addr, Qt::CaseInsensitive)){
                            check1 = true;
                            ui->textEdit->append(assem1_list[i++]);
                            break;
                        }
                    }
                    if(!check1){
                        ui->textEdit->setTextColor(QColor("red"));
                        ui->textEdit->append(assem1_list[i++]);
                        ui->textEdit->setTextColor(QColor("green"));
                    }
                }
                i-=1;
                ui->textEdit->setTextColor(tc);
                ui->textEdit->append("");
                map1[temp].second = ui->textEdit->textCursor().position();
            }
        }
        if(!check) ui->textEdit->append(assem1_list[i]);
    }

    for(int k = 0; k < mapped_func_num; k++){
        QString temp;
        ui->textEdit->moveCursor(QTextCursor::Start);
        MappedFunction mapped_func = block_mapper.MappedFunctionList[k];
        temp.sprintf("%08llx", block_mapper.prog1[mapped_func.idx1].StartAddress);
        if(ui->textEdit->find(temp)){
            functionmapped.push_back(ui->textEdit->textCursor().position());
        }
    }
    for(int i = 0; i < assem2_list.size(); i++){
        QString temp;
        bool check = false;

        for(int j = 0; j<block_mapper.MappedAddrList.size(); j++){
            temp.sprintf("%08llx", block_mapper.MappedAddrList[j].addr2);
            if(assem2_list[i].contains(temp, Qt::CaseInsensitive)){
                check = true;
                uint32_t count = block_mapper.MappedAddrList[j].num2;
                ui->textEdit_2->setTextColor(QColor("green"));
                QString countMatch;
                QString temp2;
                temp2.sprintf("%08llx", block_mapper.MappedAddrList[j].addr1);
                map21[temp] = temp2;
                map2[temp].first = ui->textEdit_2->textCursor().position();
                countMatch.sprintf("%d", j+1);
                ui->textEdit_2->append("\n"+countMatch);
                while(count--){
                    bool check1 = false;
                    for(int k = 0; k < block_mapper.notMappedAddrList.size(); k++){
                        QString addr;
                        addr.sprintf("%08llx", block_mapper.notMappedAddrList[k].addr2);
                        if(assem2_list[i].contains(addr, Qt::CaseInsensitive)){
                            check1 = true;
                            ui->textEdit_2->append(assem2_list[i++]);
                            break;
                        }
                    }
                    if(!check1){
                        ui->textEdit_2->setTextColor(QColor("red"));
                        ui->textEdit_2->append(assem2_list[i++]);
                        ui->textEdit_2->setTextColor(QColor("green"));
                    }
                }
                i-=1;
                ui->textEdit_2->setTextColor(tc);
                ui->textEdit_2->append("");
                map2[temp].second = ui->textEdit_2->textCursor().position();
            }
        }
        if(!check) ui->textEdit_2->append(assem2_list[i]);
    }
    for(int k = 0; k < mapped_func_num; k++){
        ui->textEdit_2->moveCursor(QTextCursor::Start);
        MappedFunction mapped_func = block_mapper.MappedFunctionList[k];
        if(mac_ref_map){
            const char *str = block_mapper.prog2.GetSymbolName(block_mapper.prog2[mapped_func.idx2].StartAddress);
            QString temp = QString(str) + " PROC";
            if(ui->textEdit_2->find(temp, QTextDocument::FindWholeWords)){
                functionmapped2.push_back(ui->textEdit_2->textCursor().position());
            }
        }
        else{
            QString temp;
            ui->textEdit->moveCursor(QTextCursor::Start);
            MappedFunction mapped_func = block_mapper.MappedFunctionList[k];
            temp.sprintf("%08llx", block_mapper.prog2[mapped_func.idx2].StartAddress);
            if(ui->textEdit_2->find(temp)){
                functionmapped2.push_back(ui->textEdit_2->textCursor().position());
            }
        }
    }
    QTextCursor cursor = ui->textEdit->textCursor();
    QTextCursor cursor2 = ui->textEdit_2->textCursor();
    cursor.movePosition(QTextCursor::Start);
    cursor2.movePosition(QTextCursor::Start);
    ui->textEdit->setTextCursor(cursor);
    ui->textEdit_2->setTextCursor(cursor2);
    parser1.Free();
    parser2.Free();
}

void MainWindow::on_tableView_pressed(const QModelIndex &index)
{
    QTextCursor cursor = ui->textEdit->textCursor();
    QTextCursor cursor2 = ui->textEdit_2->textCursor();
    cursor.movePosition(QTextCursor::End);
    cursor2.movePosition(QTextCursor::End);
    ui->textEdit->setTextCursor(cursor);
    ui->textEdit_2->setTextCursor(cursor2);
    cursor.setPosition(functionmapped[index.row()]);
    cursor2.setPosition(functionmapped2[index.row()]);
    ui->textEdit->setTextCursor(cursor);
    ui->textEdit_2->setTextCursor(cursor2);

}

void MainWindow::on_actionOpen_Firmware_Firmware_triggered()
{
    openTwoFiles dialog(this);
    int ret = dialog.exec();
    delete model;
    delete model2;
    model = new QStandardItemModel(0, 2, this);
    model->setHorizontalHeaderItem(0, new QStandardItem(QString("MacFirmware")));
    model->setHorizontalHeaderItem(1, new QStandardItem(QString("MacFirmware")));
    ui->tableView->setModel(model);
    model2 = new QStandardItemModel(0, 2, this);
    model2->setHorizontalHeaderItem(0, new QStandardItem(QString("MacFirmware")));
    model2->setHorizontalHeaderItem(1, new QStandardItem(QString("MacFirmware")));
    ui->tableView_2->setModel(model2);
    if(ret == openTwoFiles::Accepted){
        mac_mac_map = true;
        mac_ref_map = false;
        filename1 = dialog.getFilename1();
        filename2 = dialog.getFilename2();
        qDebug() << filename1;
        qDebug() << filename2;
        ProcessMacFirmware(efi_file_list1, filename1.toStdString().c_str());
        ProcessMacFirmware(efi_file_list2, filename2.toStdString().c_str());
        GetGuidEqualList(efi_file_list1, efi_file_list2, index_pair_list);
        int size = index_pair_list.size();
        ui->textEdit->clear();
        ui->textEdit_2->clear();
        for(int i = 0; i < size; i++){
            String filename = efi_file_list1[index_pair_list[i].idx1].FileName;
            String filename2 = efi_file_list2[index_pair_list[i].idx2].FileName;
            QStandardItem *item = new QStandardItem(QString(filename.GetString()));
            model2->appendRow(item);
            QStandardItem *item2 = new QStandardItem(QString(filename2.GetString()));
            model2->setItem(model2->rowCount()-1, 1, item2);
        }
        tc = ui->textEdit->textColor();
    }
}
