#include "opentwofiles.h"
#include "ui_opentwofiles.h"

openTwoFiles::openTwoFiles(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::openTwoFiles)
{
    ui->setupUi(this);
}

openTwoFiles::~openTwoFiles()
{
    delete ui;
}

void openTwoFiles::on_pushButton_2_clicked()
{
    QFileDialog dialog(this);
//    dialog.setFileMode(QFileDialog::DirectoryOnly);
    if(dialog.exec()){
        filename2 = dialog.selectedFiles();
        this->ui->textBrowser_2->setText(filename2.at(0));
    }
}

void openTwoFiles::on_pushButton_clicked()
{
    QFileDialog dialog(this);
//    dialog.setFileMode(QFileDialog::DirectoryOnly);
    if(dialog.exec()){
        filename1 = dialog.selectedFiles();
        this->ui->textBrowser->setText(filename1.at(0));
    }
}
QString openTwoFiles::getFilename1(){
    return filename1.at(0);
}
QString openTwoFiles::getFilename2(){
    return filename2.at(0);
}

void openTwoFiles::on_pushButton_3_clicked()
{
    openTwoFiles::accept();
}

void openTwoFiles::on_pushButton_4_clicked()
{
    openTwoFiles::reject();
}
