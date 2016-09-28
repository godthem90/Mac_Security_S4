#include <stdio.h>
#include "lib1.h"
#include "containers.h"
#include "disasm.h"
#include "parser.h"
#include "data.h"
#include "virtual_machine.h"
#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "opentwofiles.h"

#define UNMATCH						0
#define OPCODE_MATCH				1
#define OPERAND_MATCH				2
#define OPERAND_IMMEDIATE_MATCH		3

char *input_file_name1 = 0;
char *input_file_name2 = 0;
char *output_file_name = 0;
int threshold_percentage;

void usage()
{
    printf("./efi-mapper inputfile1 inputfile2\n");
}

typedef struct MappedInstruction
{
    int credit;
    int idx1;
    int idx2;
} MappedInstruction;

typedef struct MappedBlock
{
    int percentage;
    int idx1;
    int idx2;
} MappedBlock;

typedef struct MappedFunction
{
    int idx1;
    int idx2;
    vector<MappedBlock> SameBlockList;
    vector<MappedBlock> SimilarBlockList;
} MappedFunction;

typedef struct MappedAddr
{
   uint64_t addr1;
   uint64_t addr2;
   uint32_t num1;
   uint32_t num2;
} MappedAddr;

typedef struct CheckFunction
{
    uint64_t addr1;
    uint64_t addr2;
} CheckFunction;

class BlockMapper
{
public:
    vector<MappedAddr> MappedAddrList;
    vector<MappedAddr> notMappedAddrList;

    BlockMapper(Program &p1, Program &p2) : prog1(p1), prog2(p2) {};
    void MapBlock(uint64_t func_addr1, uint64_t func_addr2);
    void Dump();

private:
    Program &prog1;
    Program &prog2;
    VirtualMachine vm;
    vector<MappedFunction> MappedFunctionList;

    bool IsAttributeEqual(OperandAttribute attr1, OperandAttribute attr2);
    bool IsInsnDependent(Instruction &insn1, Instruction &insn2);
    void GetDependencyTable(BlockNode &block, int *dep_table);

    void GetMappedInsn(vector<int> &cmp_idx_list, vector<MappedInstruction> &insn_list, int idx1, int idx2);
    void SortMappedInstruction(vector<MappedInstruction> &insn_list);
    void UpdateCredit(vector<MappedInstruction> &insn_list);
    int InsertMappedInstruction(vector<MappedInstruction> &insn_list, MappedInstruction &mapped_insn);
    vector<MappedBlock> SelectCandidates(vector<MappedBlock> &candidates_table);
    MappedBlock *InsertMappedBlock(MappedFunction &mapped_func, vector<MappedBlock> &candidates);

    int DiffOperand( char *operand1, char *operand2 );
    int DiffInstruction(Instruction &insn1, Instruction &insn2);
    int DiffBlock(BlockNode &block1, BlockNode &block2, vector<MappedAddr> *notmapped_addr_list, vector<MappedAddr> *mapped_addr_list, vector<CheckFunction> *func_checklist);
};

vector<MappedBlock> BlockMapper::SelectCandidates(vector<MappedBlock> &candidates_table)
{
    int max_percentage = 0;
    for(int i = 0; i < candidates_table.size(); i++)
    {
        if( max_percentage < candidates_table[i].percentage )
            max_percentage = candidates_table[i].percentage;
    }

    vector<MappedBlock> candidates;
    for(int i = 0; i < candidates_table.size(); i++)
    {
        if(max_percentage == candidates_table[i].percentage)
            candidates.push_back(candidates_table[i]);
    }

    return candidates;
}

MappedBlock *BlockMapper::InsertMappedBlock(MappedFunction &mapped_func, vector<MappedBlock> &candidates)
{
    for(int i = 0; i < candidates.size(); i++)
    {
        int continue_check = 0;
        for(int j = 0; j < mapped_func.SameBlockList.size(); j++)
        {
            if(candidates[i].idx2 == mapped_func.SameBlockList[j].idx2)
            {
                continue_check = 1;
                break;
            }
        }
        for(int j = 0; j < mapped_func.SimilarBlockList.size(); j++)
        {
            if(candidates[i].idx2 == mapped_func.SimilarBlockList[j].idx2)
            {
                if(candidates[i].percentage == 100)
                    mapped_func.SimilarBlockList.erase(mapped_func.SimilarBlockList.begin() + j);
                else if(candidates[i].percentage >= 70)
                {
                    if(candidates[i].percentage > mapped_func.SimilarBlockList[i].percentage)
                        mapped_func.SimilarBlockList.erase(mapped_func.SimilarBlockList.begin() + j);
                    else
                    {
                        continue_check = 1;
                        break;
                    }
                }
            }
        }
        if(continue_check)
            continue;

        if(candidates[i].percentage >= 100)
        {
            mapped_func.SameBlockList.push_back(candidates[i]);
            return &candidates[i];
        }
        else if(candidates[i].percentage >= 70)
        {
            mapped_func.SimilarBlockList.push_back(candidates[i]);
            return &candidates[i];
        }
    }

    return NULL;
}

bool BlockMapper::IsAttributeEqual(OperandAttribute attr1, OperandAttribute attr2)
{
    if(attr1.op_class != attr2.op_class)
        return false;
    else
    {
        if(attr1.op_class == REG)
            return (attr1.reg_num == attr2.reg_num);
        else
            return false;
    }
}

bool BlockMapper::IsInsnDependent(Instruction &insn1, Instruction &insn2)
{
    if(vm.IsAlwaysDependent(insn1) || vm.IsAlwaysDependent(insn2))
        return true;

    vector<OperandAttribute> current_source_attr = vm.GetSourceAttribute(insn1);
    vector<OperandAttribute> current_dest_attr = vm.GetDestAttribute(insn1);
    vector<OperandAttribute> source_attr = vm.GetSourceAttribute(insn2);
    vector<OperandAttribute> dest_attr = vm.GetDestAttribute(insn2);

    // TODO dest equal to dest casue dependency break??
    for( int i = 0; i < current_dest_attr.size(); i++ )
    {
        for( int j = 0; j < dest_attr.size(); j++ )
        {
            if(IsAttributeEqual(current_dest_attr[i], dest_attr[j]))
                return true;
        }
    }
    for( int i = 0; i < current_source_attr.size(); i++ )
    {
        for( int j = 0; j < dest_attr.size(); j++ )
        {
            if(IsAttributeEqual(current_source_attr[i], dest_attr[j]))
                return true;
        }
    }
    for( int i = 0; i < source_attr.size(); i++ )
    {
        for( int j = 0; j < current_dest_attr.size(); j++ )
        {
            if(IsAttributeEqual(source_attr[i], current_dest_attr[j]))
                return true;
        }
    }

    return false;
}

void BlockMapper::GetDependencyTable(BlockNode &block, int *dep_table)
{
    uint32_t op_num = block.GetInsnNum();
    for(int i = 0; i < op_num; i++)
        dep_table[i] = 0;
    for(int i = 0; i < op_num; i++)
    {
        for(int j = i - 1; j >= 0; j--)
        {
            if(IsInsnDependent(block[i], block[j]))
                dep_table[i] = j;
        }
    }
}

// TODO function pointer match
int BlockMapper::DiffOperand( char *operand1, char *operand2 )
{
    if( operand1 == NULL && operand2 == NULL )
        return 1;
    else if( operand1 == NULL && operand2 != NULL )
        return 0;
    else if( operand1 != NULL && operand2 == NULL )
        return 0;
    else
    {
        OperandAttribute attr1 = vm.GetAttribute(operand1);
        OperandAttribute attr2 = vm.GetAttribute(operand2);

        if( attr1.op_class == attr2.op_class )
        {
            if( attr1.op_class == IMMEDIATE )
            {
                if( attr1.value == attr2.value )
                    return 10;
                else
                    return 1;
            }
            else
                return 1;
        }
    }

    return 0;
}

int BlockMapper::DiffInstruction(Instruction &insn1, Instruction &insn2)
{
    uint32_t opcode1 = insn1.GetOpcode();
    char *operand1_1 = insn1.GetOperand1();
    char *operand1_2 = insn1.GetOperand2();
    uint32_t opcode2 = insn2.GetOpcode();
    char *operand2_1 = insn2.GetOperand1();
    char *operand2_2 = insn2.GetOperand2();

    if(opcode1 == opcode2)
    {
        int credit1 = DiffOperand(operand1_1, operand2_1);
        int credit2 = DiffOperand(operand1_2, operand2_2);
        if(credit1 && credit2)
            return credit1 + credit2;
        else
            return 0;
    }
    else
        return 0;
}

void BlockMapper::GetMappedInsn(vector<int> &cmp_idx_list, vector<MappedInstruction> &insn_list, int idx1, int idx2)
{
    for(int i = 0; i < insn_list.size(); i++)
    {
        if(insn_list[i].idx1 == idx1 || insn_list[i].idx2 == idx2)
            cmp_idx_list.push_back(i);
    }
}

void BlockMapper::SortMappedInstruction(vector<MappedInstruction> &insn_list)
{
    int size = insn_list.size();
    for(int i = 0; i < size; i++)
    {
        int max_idx = 0;
        for(int j = 1; j < size - i; j++)
        {
            if(insn_list[j].idx1 > insn_list[max_idx].idx1)
                max_idx = j;
            else if(insn_list[j].idx1 == insn_list[max_idx].idx1)
            {
                if(insn_list[j].idx2 > insn_list[max_idx].idx2)
                    max_idx = j;
            }
        }

        MappedInstruction temp;
        temp = insn_list[size - i - 1];
        insn_list[size - i - 1] = insn_list[max_idx];
        insn_list[max_idx] = temp;
    }
}

void BlockMapper::UpdateCredit(vector<MappedInstruction> &insn_list)
{
    int size = insn_list.size();
    int cont_idx = size - 1;
    for(; cont_idx > 0; cont_idx--)
    {
        if(insn_list[cont_idx].idx1 == insn_list[cont_idx-1].idx1 - 1
            && insn_list[cont_idx].idx2 == insn_list[cont_idx-1].idx2 - 1)
            break;
    }

    if(cont_idx == size - 1)
        return;
    else
    {
        int group_credit = insn_list[size-1].credit + insn_list[size-2].credit;
        for(int i = cont_idx; i < size; i++)
            insn_list[i].credit = group_credit;
    }
}

int BlockMapper::InsertMappedInstruction(vector<MappedInstruction> &insn_list, MappedInstruction &mapped_insn)
{
    if(mapped_insn.credit)
    {
        vector<int> cmp_idx_list;
        GetMappedInsn(cmp_idx_list, insn_list, mapped_insn.idx1, mapped_insn.idx2);

        int credit_sum = 0;
        for(int i = 0; i < cmp_idx_list.size(); i++)
            credit_sum += insn_list[cmp_idx_list[i]].credit;

        if(mapped_insn.credit > credit_sum)
        {
            for(int i = cmp_idx_list.size() - 1; i >= 0; i--)
                insn_list.erase(insn_list.begin() + cmp_idx_list[i]);
            insn_list.push_back(mapped_insn);
            SortMappedInstruction(insn_list);
            UpdateCredit(insn_list);
            return 1;
        }
    }

    return 0;
}

int GetIdx2(vector<MappedInstruction> &insn_list, int idx1)
{
    int size = insn_list.size();
    for(int i = 0; i < size; i++)
    {
        if(insn_list[i].idx1 == idx1)
            return insn_list[i].idx2;
    }

    return -1;
}

int BlockMapper::DiffBlock(BlockNode &block1, BlockNode &block2, vector<MappedAddr> *notmapped_addr_list, vector<MappedAddr> *mapped_addr_list, vector<CheckFunction> *func_checklist)
{
    uint32_t op_num1 = block1.GetInsnNum();
    uint32_t op_num2 = block2.GetInsnNum();

    int *dependency_table1 = new int[op_num1];
    int *dependency_table2 = new int[op_num2];
    GetDependencyTable(block1, dependency_table1);
    GetDependencyTable(block2, dependency_table2);

    vector<MappedInstruction> mapped_insn_list;
    for( int op_idx1 = 0; op_idx1 < op_num1; op_idx1++ )
    {
        int op_idx2 = GetIdx2(mapped_insn_list, dependency_table1[op_idx1]) + 1;
        for( /*int op_idx2 = 0*/; op_idx2 < op_num2; op_idx2++ )
        {
            MappedInstruction mapped_insn;
            mapped_insn.idx1 = op_idx1;
            mapped_insn.idx2 = op_idx2;
            mapped_insn.credit = DiffInstruction(block1[op_idx1], block2[op_idx2]);

            if(InsertMappedInstruction(mapped_insn_list, mapped_insn))
                break;
        }
    }

    for(int i = 0; i < mapped_insn_list.size(); i++)
    {
        uint32_t opcode1 = block1[mapped_insn_list[i].idx1].GetOpcode();
        uint32_t opcode2 = block2[mapped_insn_list[i].idx2].GetOpcode();
        if(func_checklist && opcode1 == 232 && opcode2 == 232)
        {
            CheckFunction check_func;
            check_func.addr1 = htoi(block1[mapped_insn_list[i].idx1].GetOperand1());
            check_func.addr2 = htoi(block2[mapped_insn_list[i].idx2].GetOperand1());
            func_checklist->push_back(check_func);
        }
        if(notmapped_addr_list){
            MappedAddr addr;
            addr.addr1=block1[mapped_insn_list[i].idx1].GetAddr();
            addr.addr2=block2[mapped_insn_list[i].idx2].GetAddr();
            notmapped_addr_list->push_back(addr);
        }

    }
    if(mapped_addr_list){
        MappedAddr start_addr;
        start_addr.addr1 = block1.StartAddress;
        start_addr.addr2 = block2.StartAddress;
        start_addr.num1 = block1.GetInsnNum();
        start_addr.num2 = block2.GetInsnNum();
        mapped_addr_list->push_back(start_addr);
    }
    delete[] dependency_table1;
    delete[] dependency_table2;

    return mapped_insn_list.size() * 2 * 100 / (op_num1 + op_num2);
}

void BlockMapper::MapBlock(uint64_t func_addr1, uint64_t func_addr2)
{
    int func_idx1 = prog1.GetFuncIndex(func_addr1);
    int func_idx2 = prog2.GetFuncIndex(func_addr2);
    FunctionNode &func1 = prog1[func_idx1];
    FunctionNode &func2 = prog2[func_idx2];

    uint32_t block_num1 = func1.GetBlockNum();
    uint32_t block_num2 = func2.GetBlockNum();

    MappedFunction mapped_function;
    memset( &mapped_function, 0, sizeof(MappedFunction) );
    mapped_function.idx1 = func_idx1;
    mapped_function.idx2 = func_idx2;

    vector<CheckFunction> func_checklist;
    for( int i = 0; i < block_num1; i++ )
    {
        vector<MappedBlock> candidates_table;
        for( int j = 0; j < block_num2; j++ )
        {
            MappedBlock candidate_block;
            candidate_block.idx1 = i;
            candidate_block.idx2 = j;
            candidate_block.percentage = DiffBlock(func1[i], func2[j], NULL, NULL, NULL);
            candidates_table.push_back(candidate_block);
        }
        vector<MappedBlock> candidates = SelectCandidates(candidates_table);
        MappedBlock *inserted_block = InsertMappedBlock(mapped_function, candidates);
        if(inserted_block)
            DiffBlock(func1[inserted_block->idx1], func2[inserted_block->idx2],&notMappedAddrList, &MappedAddrList, &func_checklist);
    }

    MappedFunctionList.push_back(mapped_function);
    for( int i = 0; i < func_checklist.size(); i++ )
        MapBlock(func_checklist[i].addr1, func_checklist[i].addr2);
}

void BlockMapper::Dump()
{
    for( int i = 0; i < MappedFunctionList.size(); i++ )
    {
        printf("*******************************************************************\n");
        printf("*******************************************************************\n");
        printf("*******************************************************************\n");
        struct MappedFunction &mapped_func = MappedFunctionList[i];
        FunctionNode &func1 = prog1[mapped_func.idx1];
        FunctionNode &func2 = prog2[mapped_func.idx2];
        uint32_t block_num1 = func1.GetBlockNum();
        uint32_t block_num2 = func2.GetBlockNum();
        printf("%s:0x%llx func total block : %d\n", input_file_name1, func1.StartAddress, block_num1);
        printf("%s:0x%llx func total block : %d\n", input_file_name2, func2.StartAddress, block_num2);
        printf("total matched block : %lu\n", mapped_func.SameBlockList.size());

        for( int j = 0; j < mapped_func.SameBlockList.size(); j++ )
        {
            struct MappedBlock &mapped_block = mapped_func.SameBlockList[j];
            BlockNode &block1 = func1[mapped_block.idx1];
            BlockNode &block2 = func2[mapped_block.idx2];

            printf("---------------------------------------------------------------\n");
            int percentage = mapped_block.percentage;
            uint64_t block_addr1 = block1.StartAddress;
            uint64_t block_addr2 = block2.StartAddress;
            printf("Block 0x%llx and Block 0x%llx matched with %d%%\n\n", block_addr1, block_addr2, percentage);
            printf("%s :\n", input_file_name1);
            block1.PrintBlockAssembly();
            printf("\n");
            printf("%s :\n", input_file_name2);
            block2.PrintBlockAssembly();
            printf("\n");
            printf("---------------------------------------------------------------\n");
        }
        printf("###################################################################\n");
        for( int j = 0; j < mapped_func.SimilarBlockList.size(); j++ )
        {
            struct MappedBlock &mapped_block = mapped_func.SimilarBlockList[j];
            BlockNode &block1 = func1[mapped_block.idx1];
            BlockNode &block2 = func2[mapped_block.idx2];

            printf("---------------------------------------------------------------\n");
            int percentage = mapped_block.percentage;
            uint64_t block_addr1 = block1.StartAddress;
            uint64_t block_addr2 = block2.StartAddress;
            printf("Block 0x%llx and Block 0x%llx matched with %d%%\n\n", block_addr1, block_addr2, percentage);
            printf("%s :\n", input_file_name1);
            block1.PrintBlockAssembly();
            printf("\n");
            printf("%s :\n", input_file_name2);
            block2.PrintBlockAssembly();
            printf("\n");
            printf("---------------------------------------------------------------\n");
        }
        printf("\n");
    }
}
MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_actionOpen_triggered()
{
    openTwoFiles dialog(this);
    ui->textEdit->setReadOnly(true);
    ui->textEdit_2->setReadOnly(true);
    int ret = dialog.exec();
    if(ret == openTwoFiles::Accepted){
        filename1 = dialog.getFilename1();
        filename2 = dialog.getFilename2();
        QString temp1 = dialog.getEntryaddr1();
        QString temp2 = dialog.getEntryaddr2();
        qDebug() << temp1 << temp2;
        QByteArray byteaddr1 = temp1.toLocal8Bit();
        QByteArray byteaddr2 = temp2.toLocal8Bit();
        entry_addr1 = htoi(byteaddr1.data());
        entry_addr2 = htoi(byteaddr2.data());
        qDebug() << entry_addr1 << entry_addr2;
        QByteArray bytename1 = filename1.toLocal8Bit();
        QByteArray bytename2 = filename2.toLocal8Bit();
        qDebug() << bytename1.data() << bytename2.data();
        CFileBuffer input_buffer1(bytename1.data());
        input_buffer1.Read();
        CFileBuffer input_buffer2(bytename2.data());
        input_buffer2.Read();

        Parser parser1, parser2;
        CDisassembler disasm_engine1, disasm_engine2;
        input_buffer1 >> parser1;
        input_buffer2 >> parser2;
        parser1.Parse(&disasm_engine1);
        parser2.Parse(&disasm_engine2);

        CTextFileBuffer assembly1, assembly2;
        disasm_engine1.OutFile >> assembly1;
        disasm_engine2.OutFile >> assembly2;
        char *assem1 = assembly1.Buf();
        char *assem2 = assembly2.Buf();
        int assem1size = strlen(assem1);
        int assem2size = strlen(assem2);
        QString assem1Q(assem1);
        QString assem2Q(assem2);
        QStringList assem1_list = assem1Q.split("\n");
        QStringList assem2_list = assem2Q.split("\n");

        Program prog1, prog2;
        disasm_engine1.ParseProgram(&prog1);
        disasm_engine2.ParseProgram(&prog2);

        BlockMapper block_mapper(prog1, prog2);
        block_mapper.MapBlock(entry_addr1, entry_addr2);
        for(int i = 0; i < block_mapper.MappedAddrList.size(); i++){
            printf("%llx %d %llx %d\n", block_mapper.MappedAddrList[i].addr1, block_mapper.MappedAddrList[i].num1 ,block_mapper.MappedAddrList[i].addr2, block_mapper.MappedAddrList[i].num2);
        }
//      block_mapper.Dump();

        for(int i = 0; i < assem1_list.size(); i++){
            QString temp;
            bool check = false;
            for(int j = 0; j<block_mapper.MappedAddrList.size(); j++){
                temp.sprintf("%08llx", block_mapper.MappedAddrList[j].addr1);
                if(assem1_list[i].contains(temp, Qt::CaseInsensitive)){
                    check = true;
                    QColor tc = ui->textEdit->textColor();
                    uint32_t count = block_mapper.MappedAddrList[j].num1;
                    ui->textEdit->setTextColor(QColor("green"));
                    QString countMatch;
                    countMatch.sprintf("%d", j+1);
                    ui->textEdit->append(countMatch);
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
                }
            }
            if(!check) ui->textEdit->append(assem1_list[i]);
        }
        for(int i = 0; i < assem2_list.size(); i++){
            QString temp;
            bool check = false;
            for(int j = 0; j<block_mapper.MappedAddrList.size(); j++){
                temp.sprintf("%08llx", block_mapper.MappedAddrList[j].addr2);
                if(assem2_list[i].contains(temp, Qt::CaseInsensitive)){
                    check = true;
                    QColor tc = ui->textEdit_2->textColor();
                    uint32_t count = block_mapper.MappedAddrList[j].num2;
                    ui->textEdit_2->setTextColor(QColor("green"));
                    QString countMatch;
                    countMatch.sprintf("%d", j+1);
                    ui->textEdit_2->append(countMatch);
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
                }
            }
            if(!check) ui->textEdit_2->append(assem2_list[i]);
        }
        parser1.Free();
        parser2.Free();
    }
    else{
        filename1 = "";
        filename2 = "";
    }
  //  qDebug() << filename1 << filename2;
}
