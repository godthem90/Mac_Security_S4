#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "opentwofiles.h"
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
    int ret = dialog.exec();
    if(ret == openTwoFiles::Accepted){
        filename1 = dialog.getFilename1();
        filename2 = dialog.getFilename2();
    }
    else{
        filename1 = "";
        filename2 = "";
    }
  //  qDebug() << filename1 << filename2;
}
