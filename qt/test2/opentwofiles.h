#ifndef OPENTWOFILES_H
#define OPENTWOFILES_H

#include <QDialog>
#include <QFileDialog>

namespace Ui {
class openTwoFiles;
}

class openTwoFiles : public QDialog
{
    Q_OBJECT

public:
    explicit openTwoFiles(QWidget *parent = 0);
    ~openTwoFiles();
    QString getFilename1();
    QString getFilename2();
private slots:
    void on_pushButton_2_clicked();
    void on_pushButton_clicked();
    void on_pushButton_3_clicked();
    void on_pushButton_4_clicked();


private:
    Ui::openTwoFiles *ui;
    QStringList filename1;
    QStringList filename2;
    QString entry_addr1;
    QString entry_addr2;
};

#endif // OPENTWOFILES_H
