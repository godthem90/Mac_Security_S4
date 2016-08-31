#include<QVector>
#include<QString>
#include<QDir>
#include<QDirIterator>
#include<QDebug>
#include<QFile>
#include<iostream>
#include<fstream>
#include<string>
using namespace std;

QVector<QString> filePath;

void findFile(QString input){
	QStringList strFilters;
	strFilters += "*.inf";
	QDirIterator iterDir(input, strFilters, QDir::Files | QDir::NoSymLinks, QDirIterator::Subdirectories);
	while(iterDir.hasNext()){
		filePath.push_back(iterDir.next());
	}
}
void proc(QString guid){
	QFile *writeFile = new QFile;
	bool findFile = false;
	QString qguid = guid;
	QString entry = "ENTRY_POINT";
	for(auto it = filePath.begin(); it!=filePath.end(); it++){
		QFile *guidfile = new QFile;
		QString filename = *it;
//		qDebug() << filename;
		guidfile->setFileName(filename);
		guidfile->open(QIODevice::ReadOnly);
		
		QVector<QString> temp;
		QTextStream in(guidfile);
		while(!in.atEnd()){
			QString line = in.readLine();
			temp.push_back(line);
//			qDebug() << line;
			if(!findFile){
				bool find = line.contains(qguid, Qt::CaseInsensitive);
				if(find){
					findFile = true;
					qDebug() << line;
				}
			}
		}
		guidfile->close();
		if(findFile){
			writeFile->setFileName(qguid+".txt");
			writeFile->open(QIODevice::WriteOnly);
			QTextStream out(writeFile);
			for(auto it = temp.begin(); it!=temp.end(); it++){
				out << *it << endl;
			}
			temp.clear();
			break;
		}
	}
	writeFile->close();
}

int main(int argc, char *argv[]){
	QString path = "./edk2/";
	if(argc < 2){
		cout << "Error" << endl;
	}
	findFile(path);
	QFile *inFile = new QFile;
	inFile->setFileName(argv[1]);
	inFile->open(QIODevice::ReadOnly);
	QTextStream in(inFile);
	while(!in.atEnd()){
		QString guid = in.readLine();
		qDebug() << guid;
		proc(guid);
	}
	inFile->close();
}
