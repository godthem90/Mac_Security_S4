/********************************************************************************
** Form generated from reading UI file 'opentwofiles.ui'
**
** Created by: Qt User Interface Compiler version 5.7.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_OPENTWOFILES_H
#define UI_OPENTWOFILES_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QDialog>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QTextBrowser>

QT_BEGIN_NAMESPACE

class Ui_openTwoFiles
{
public:
    QGridLayout *gridLayout_8;
    QGridLayout *gridLayout_4;
    QTextBrowser *textBrowser;
    QTextBrowser *textBrowser_2;
    QGridLayout *gridLayout_7;
    QGridLayout *gridLayout;
    QPushButton *pushButton;
    QGridLayout *gridLayout_2;
    QPushButton *pushButton_2;
    QHBoxLayout *horizontalLayout;
    QPushButton *pushButton_3;
    QPushButton *pushButton_4;

    void setupUi(QDialog *openTwoFiles)
    {
        if (openTwoFiles->objectName().isEmpty())
            openTwoFiles->setObjectName(QStringLiteral("openTwoFiles"));
        openTwoFiles->resize(360, 250);
        openTwoFiles->setMinimumSize(QSize(360, 250));
        openTwoFiles->setMaximumSize(QSize(360, 250));
        gridLayout_8 = new QGridLayout(openTwoFiles);
        gridLayout_8->setObjectName(QStringLiteral("gridLayout_8"));
        gridLayout_4 = new QGridLayout();
        gridLayout_4->setObjectName(QStringLiteral("gridLayout_4"));
        textBrowser = new QTextBrowser(openTwoFiles);
        textBrowser->setObjectName(QStringLiteral("textBrowser"));

        gridLayout_4->addWidget(textBrowser, 0, 0, 1, 1);

        textBrowser_2 = new QTextBrowser(openTwoFiles);
        textBrowser_2->setObjectName(QStringLiteral("textBrowser_2"));

        gridLayout_4->addWidget(textBrowser_2, 1, 0, 1, 1);


        gridLayout_8->addLayout(gridLayout_4, 0, 0, 1, 1);

        gridLayout_7 = new QGridLayout();
        gridLayout_7->setObjectName(QStringLiteral("gridLayout_7"));
        gridLayout = new QGridLayout();
        gridLayout->setObjectName(QStringLiteral("gridLayout"));
        pushButton = new QPushButton(openTwoFiles);
        pushButton->setObjectName(QStringLiteral("pushButton"));

        gridLayout->addWidget(pushButton, 0, 0, 1, 1);


        gridLayout_7->addLayout(gridLayout, 0, 0, 1, 1);

        gridLayout_2 = new QGridLayout();
        gridLayout_2->setObjectName(QStringLiteral("gridLayout_2"));
        pushButton_2 = new QPushButton(openTwoFiles);
        pushButton_2->setObjectName(QStringLiteral("pushButton_2"));

        gridLayout_2->addWidget(pushButton_2, 0, 0, 1, 1);


        gridLayout_7->addLayout(gridLayout_2, 1, 0, 1, 1);


        gridLayout_8->addLayout(gridLayout_7, 0, 1, 1, 1);

        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setObjectName(QStringLiteral("horizontalLayout"));
        pushButton_3 = new QPushButton(openTwoFiles);
        pushButton_3->setObjectName(QStringLiteral("pushButton_3"));

        horizontalLayout->addWidget(pushButton_3);

        pushButton_4 = new QPushButton(openTwoFiles);
        pushButton_4->setObjectName(QStringLiteral("pushButton_4"));

        horizontalLayout->addWidget(pushButton_4);


        gridLayout_8->addLayout(horizontalLayout, 1, 0, 1, 2);


        retranslateUi(openTwoFiles);

        QMetaObject::connectSlotsByName(openTwoFiles);
    } // setupUi

    void retranslateUi(QDialog *openTwoFiles)
    {
        openTwoFiles->setWindowTitle(QApplication::translate("openTwoFiles", "Dialog", 0));
        pushButton->setText(QApplication::translate("openTwoFiles", "FirstFolder", 0));
        pushButton_2->setText(QApplication::translate("openTwoFiles", "SecondFolder", 0));
        pushButton_3->setText(QApplication::translate("openTwoFiles", "OK", 0));
        pushButton_4->setText(QApplication::translate("openTwoFiles", "Cancel", 0));
    } // retranslateUi

};

namespace Ui {
    class openTwoFiles: public Ui_openTwoFiles {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_OPENTWOFILES_H
