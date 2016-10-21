#-------------------------------------------------
#
# Project created by QtCreator 2016-09-21T16:37:22
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = test2
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
    opentwofiles.cpp\
    coff.cpp\
    containers.cpp\
    data.cpp\
    disasm1.cpp\
    disasm2.cpp\
    disasm3.cpp\
    error.cpp\
    macho.cpp\
    opcodes.cpp\
    parser.cpp\
    virtual_machine.cpp\
    lib1.cpp\
    efi_mapper.cpp\

HEADERS  += mainwindow.h \
    opentwofiles.h\
    coff.h\
    containers.h\
    data.h\
    disasm.h\
    error.h\
    macho.h\
    parser.h\
    stdafx.h\
    virtual_machine.h\
    lib1.h\
    efi_mapper.h\

FORMS    += mainwindow.ui \
    opentwofiles.ui
