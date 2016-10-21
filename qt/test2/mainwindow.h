#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QVector>
#include <QFileDialog>
#include <QTextBlock>
#include <QTextCursor>
#include <QDebug>
#include <QPalette>
#include <QDir>
#include <QDirIterator>
#include <QTableView>
#include <QStandardItemModel>
namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

private slots:
    void on_actionOpen_triggered();

    void on_textEdit_cursorPositionChanged();

    void on_tableView_2_pressed(const QModelIndex &index);

    void on_tableView_pressed(const QModelIndex &index);

private:
    Ui::MainWindow *ui;
    QString filename1;
    QString filename2;
    uint64_t entry_addr1;
    uint64_t entry_addr2;
    QMap<QString, QPair<int, int> > map1;
    QMap<QString, QString> map12;
    QMap<QString, QPair<int, int> > map2;
    QMap<QString, QString> map21;
    QVector<int> functionmapped;
    QVector<int> functionmapped2;

    QStandardItemModel *model;
    QStandardItemModel *model2;
    QColor tc;
};

#endif // MAINWINDOW_H
