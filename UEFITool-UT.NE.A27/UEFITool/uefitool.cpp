/* uefitool.cpp

  Copyright (c) 2016, Nikolaj Schlej. All rights reserved.
  This program and the accompanying materials
  are licensed and made available under the terms and conditions of the BSD License
  which accompanies this distribution.  The full text of the license may be found at
  http://opensource.org/licenses/bsd-license.php

  THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
  WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.

  */

#include "uefitool.h"
#include "ui_uefitool.h"

UEFITool::UEFITool(QWidget *parent) :
QMainWindow(parent),
ui(new Ui::UEFITool), 
version(tr("0.30.0_alpha27"))
{
    clipboard = QApplication::clipboard();

    // Create UI
    ui->setupUi(this);
    searchDialog = new SearchDialog(this);
    model = NULL;
    ffsParser = NULL;
    fitParser = NULL;
    ffsFinder = NULL;
    ffsOps = NULL;
    ffsBuilder = NULL;

    // Connect signals to slots
    connect(ui->actionOpenImageFile, SIGNAL(triggered()), this, SLOT(openImageFile()));
    connect(ui->actionOpenImageFileInNewWindow, SIGNAL(triggered()), this, SLOT(openImageFileInNewWindow()));
    connect(ui->actionSaveImageFile, SIGNAL(triggered()), this, SLOT(saveImageFile()));
    connect(ui->actionSearch, SIGNAL(triggered()), this, SLOT(search()));
    connect(ui->actionExtract, SIGNAL(triggered()), this, SLOT(extractAsIs()));
    connect(ui->actionExtractBody, SIGNAL(triggered()), this, SLOT(extractBody()));
    connect(ui->actionExtractBodyUncompressed, SIGNAL(triggered()), this, SLOT(extractBodyUncompressed()));
    connect(ui->actionInsertInto, SIGNAL(triggered()), this, SLOT(insertInto()));
    connect(ui->actionInsertBefore, SIGNAL(triggered()), this, SLOT(insertBefore()));
    connect(ui->actionInsertAfter, SIGNAL(triggered()), this, SLOT(insertAfter()));
    connect(ui->actionReplace, SIGNAL(triggered()), this, SLOT(replaceAsIs()));
    connect(ui->actionReplaceBody, SIGNAL(triggered()), this, SLOT(replaceBody()));
    connect(ui->actionRemove, SIGNAL(triggered()), this, SLOT(remove()));
    connect(ui->actionRebuild, SIGNAL(triggered()), this, SLOT(rebuild()));
    connect(ui->actionMessagesCopy, SIGNAL(triggered()), this, SLOT(copyMessage()));
    connect(ui->actionMessagesCopyAll, SIGNAL(triggered()), this, SLOT(copyAllMessages()));
    connect(ui->actionMessagesClear, SIGNAL(triggered()), this, SLOT(clearMessages()));
    connect(ui->actionAbout, SIGNAL(triggered()), this, SLOT(about()));
    connect(ui->actionAboutQt, SIGNAL(triggered()), this, SLOT(aboutQt()));
    connect(ui->actionQuit, SIGNAL(triggered()), this, SLOT(exit()));
    connect(ui->actionGoToData, SIGNAL(triggered()), this, SLOT(goToData()));
    connect(QCoreApplication::instance(), SIGNAL(aboutToQuit()), this, SLOT(writeSettings()));

    // Enable Drag-and-Drop actions
    setAcceptDrops(true);

    // Set current directory
    currentDir = ".";

    // Set monospace font for some controls
    QFont font("Courier New", 10);
#if defined Q_OS_OSX
    font = QFont("Menlo", 10);
#elif defined Q_OS_WIN
    font = QFont("Consolas", 9);
#endif
    ui->infoEdit->setFont(font);
    ui->parserMessagesListWidget->setFont(font);
    ui->fitMessagesListWidget->setFont(font);
    ui->finderMessagesListWidget->setFont(font);
    ui->builderMessagesListWidget->setFont(font);
    ui->fitTableWidget->setFont(font);
    ui->structureTreeView->setFont(font);
    searchDialog->ui->guidEdit->setFont(font);
    searchDialog->ui->hexEdit->setFont(font);

    // Initialize non-persistent data
    init();

    // Read stored settings
    readSettings();
}

UEFITool::~UEFITool()
{
    delete ffsBuilder;
    delete ffsOps;
    delete ffsFinder;
    delete fitParser;
    delete ffsParser;
    delete model;
    delete searchDialog;
    delete ui;
}

void UEFITool::init()
{
    // Clear components
    ui->parserMessagesListWidget->clear();
    ui->finderMessagesListWidget->clear();
    ui->fitTableWidget->clear();
    ui->fitTableWidget->setRowCount(0);
    ui->fitTableWidget->setColumnCount(0);
    ui->infoEdit->clear();
    ui->messagesTabWidget->setTabEnabled(1, false);

    // Set window title
    setWindowTitle(tr("UEFITool %1").arg(version));

    // Disable menus
    ui->menuCapsuleActions->setDisabled(true);
    ui->menuImageActions->setDisabled(true);
    ui->menuRegionActions->setDisabled(true);
    ui->menuPaddingActions->setDisabled(true);
    ui->menuVolumeActions->setDisabled(true);
    ui->menuFileActions->setDisabled(true);
    ui->menuSectionActions->setDisabled(true);
    ui->menuStoreActions->setDisabled(true);
    ui->menuVariableActions->setDisabled(true);

    ui->actionMessagesCopy->setDisabled(true);
    ui->actionMessagesCopyAll->setDisabled(true);

    // Create new model ...
    delete model;
    model = new TreeModel();
    ui->structureTreeView->setModel(model);
    // ... and ffsParser
    delete ffsParser;
    ffsParser = new FfsParser(model);
    // ... and fitParser
    delete fitParser;
    fitParser = new FitParser(model);

    // Connect
    connect(ui->structureTreeView->selectionModel(), SIGNAL(currentChanged(const QModelIndex &, const QModelIndex &)),
        this, SLOT(populateUi(const QModelIndex &)));
    connect(ui->parserMessagesListWidget,  SIGNAL(itemDoubleClicked(QListWidgetItem*)), this, SLOT(scrollTreeView(QListWidgetItem*)));
    connect(ui->parserMessagesListWidget,  SIGNAL(itemEntered(QListWidgetItem*)),       this, SLOT(enableMessagesCopyActions(QListWidgetItem*)));
    connect(ui->fitMessagesListWidget,     SIGNAL(itemDoubleClicked(QListWidgetItem*)), this, SLOT(scrollTreeView(QListWidgetItem*)));
    connect(ui->fitMessagesListWidget,     SIGNAL(itemEntered(QListWidgetItem*)),       this, SLOT(enableMessagesCopyActions(QListWidgetItem*)));
    connect(ui->finderMessagesListWidget,  SIGNAL(itemDoubleClicked(QListWidgetItem*)), this, SLOT(scrollTreeView(QListWidgetItem*)));
    connect(ui->finderMessagesListWidget,  SIGNAL(itemEntered(QListWidgetItem*)),       this, SLOT(enableMessagesCopyActions(QListWidgetItem*)));
    connect(ui->builderMessagesListWidget, SIGNAL(itemDoubleClicked(QListWidgetItem*)), this, SLOT(scrollTreeView(QListWidgetItem*)));
    connect(ui->builderMessagesListWidget, SIGNAL(itemEntered(QListWidgetItem*)),       this, SLOT(enableMessagesCopyActions(QListWidgetItem*)));
}

void UEFITool::populateUi(const QModelIndex &current)
{
    // Check sanity
    if (!current.isValid())
        return;

    UINT8 type = model->type(current);
    UINT8 subtype = model->subtype(current);

    // Set info text
    ui->infoEdit->setPlainText(model->info(current));

    // Enable menus
    ui->menuCapsuleActions->setEnabled(type == Types::Capsule);
    ui->menuImageActions->setEnabled(type == Types::Image);
    ui->menuRegionActions->setEnabled(type == Types::Region);
    ui->menuPaddingActions->setEnabled(type == Types::Padding);
    ui->menuVolumeActions->setEnabled(type == Types::Volume);
    ui->menuFileActions->setEnabled(type == Types::File);
    ui->menuSectionActions->setEnabled(type == Types::Section);
    ui->menuVariableActions->setEnabled(type == Types::NvarEntry 
        || type == Types::VssEntry 
        || type == Types::FsysEntry
        || type == Types::EvsaEntry 
        || type == Types::FlashMapEntry);
    ui->menuStoreActions->setEnabled(type == Types::VssStore 
        || type == Types::FdcStore 
        || type == Types::FsysStore
        || type == Types::EvsaStore 
        || type == Types::FtwStore 
        || type == Types::FlashMapStore 
        || type == Types::CmdbStore
        || type == Types::Microcode 
        || type == Types::SlicData);
    
    // Enable actions
    ui->actionExtract->setDisabled(model->hasEmptyHeader(current) && model->hasEmptyBody(current));
    ui->actionGoToData->setEnabled(type == Types::NvarEntry && subtype == Subtypes::LinkNvarEntry);

    // Disable rebuild for now
    //ui->actionRebuild->setDisabled(type == Types::Region && subtype == Subtypes::DescriptorRegion);
    //ui->actionReplace->setDisabled(type == Types::Region && subtype == Subtypes::DescriptorRegion);

    //ui->actionRebuild->setEnabled(type == Types::Volume || type == Types::File || type == Types::Section);
    ui->actionExtractBody->setDisabled(model->hasEmptyBody(current));
    ui->actionExtractBodyUncompressed->setEnabled(enableExtractBodyUncompressed(current));
    //ui->actionRemove->setEnabled(type == Types::Volume || type == Types::File || type == Types::Section);
    //ui->actionInsertInto->setEnabled((type == Types::Volume && subtype != Subtypes::UnknownVolume) ||
    //    (type == Types::File && subtype != EFI_FV_FILETYPE_ALL && subtype != EFI_FV_FILETYPE_RAW && subtype != EFI_FV_FILETYPE_PAD) ||
    //    (type == Types::Section && (subtype == EFI_SECTION_COMPRESSION || subtype == EFI_SECTION_GUID_DEFINED || subtype == EFI_SECTION_DISPOSABLE)));
    //ui->actionInsertBefore->setEnabled(type == Types::File || type == Types::Section);
    //ui->actionInsertAfter->setEnabled(type == Types::File || type == Types::Section);
    //ui->actionReplace->setEnabled((type == Types::Region && subtype != Subtypes::DescriptorRegion) || type == Types::Volume || type == Types::File || type == Types::Section);
    //ui->actionReplaceBody->setEnabled(type == Types::Volume || type == Types::File || type == Types::Section);
    ui->actionMessagesCopy->setEnabled(false);
}

bool UEFITool::enableExtractBodyUncompressed(const QModelIndex &current)
{
    if (current.isValid() && model->type(current) == Types::Section &&
       (model->subtype(current) == EFI_SECTION_COMPRESSION || model->subtype(current) == EFI_SECTION_GUID_DEFINED)) {
        // Get parsing data
        PARSING_DATA pdata = parsingDataFromQModelIndex(current);

        if (model->subtype(current) == EFI_SECTION_COMPRESSION && 
            pdata.section.compressed.algorithm != COMPRESSION_ALGORITHM_NONE &&
            pdata.section.compressed.algorithm != COMPRESSION_ALGORITHM_UNKNOWN &&
            pdata.section.compressed.algorithm != COMPRESSION_ALGORITHM_UNDECIDED) { //Compressed section
            return true;
        }
        else if (model->subtype(current) == EFI_SECTION_GUID_DEFINED) {
            QByteArray guid = QByteArray((const char*)&pdata.section.guidDefined.guid, sizeof(EFI_GUID));
            if (guid == EFI_GUIDED_SECTION_TIANO || guid == EFI_GUIDED_SECTION_LZMA) {
                return true;
            }
        }
    }
        
    return false;
}

void UEFITool::search()
{
    if (searchDialog->exec() != QDialog::Accepted)
        return;

    QModelIndex rootIndex = model->index(0, 0);

    int index = searchDialog->ui->tabWidget->currentIndex();
    if (index == 0) { // Hex pattern
        searchDialog->ui->hexEdit->setFocus();
        QByteArray pattern = searchDialog->ui->hexEdit->text().toLatin1().replace(" ", "");
        if (pattern.isEmpty())
            return;
        UINT8 mode;
        if (searchDialog->ui->hexScopeHeaderRadioButton->isChecked())
            mode = SEARCH_MODE_HEADER;
        else if (searchDialog->ui->hexScopeBodyRadioButton->isChecked())
            mode = SEARCH_MODE_BODY;
        else
            mode = SEARCH_MODE_ALL;
        ffsFinder->findHexPattern(rootIndex, pattern, mode);
        showFinderMessages();
    }
    else if (index == 1) { // GUID
        searchDialog->ui->guidEdit->setFocus();
        searchDialog->ui->guidEdit->setCursorPosition(0);
        QByteArray pattern = searchDialog->ui->guidEdit->text().toLatin1();
        if (pattern.isEmpty())
            return;
        UINT8 mode;
        if (searchDialog->ui->guidScopeHeaderRadioButton->isChecked())
            mode = SEARCH_MODE_HEADER;
        else if (searchDialog->ui->guidScopeBodyRadioButton->isChecked())
            mode = SEARCH_MODE_BODY;
        else
            mode = SEARCH_MODE_ALL;
        ffsFinder->findGuidPattern(rootIndex, pattern, mode);
        showFinderMessages();
    }
    else if (index == 2) { // Text string
        searchDialog->ui->textEdit->setFocus();
        QString pattern = searchDialog->ui->textEdit->text();
        if (pattern.isEmpty())
            return;
        UINT8 mode;
        if (searchDialog->ui->textScopeHeaderRadioButton->isChecked())
            mode = SEARCH_MODE_HEADER;
        else if (searchDialog->ui->textScopeBodyRadioButton->isChecked())
            mode = SEARCH_MODE_BODY;
        else
            mode = SEARCH_MODE_ALL;
        ffsFinder->findTextPattern(rootIndex, pattern, mode, searchDialog->ui->textUnicodeCheckBox->isChecked(),
            (Qt::CaseSensitivity) searchDialog->ui->textCaseSensitiveCheckBox->isChecked());
        showFinderMessages();
    }
}

void UEFITool::goToData()
{
    QModelIndex index = ui->structureTreeView->selectionModel()->currentIndex();
    if (!index.isValid() || model->type(index) != Types::NvarEntry || model->subtype(index) != Subtypes::LinkNvarEntry)
        return;

    // Get parent
    QModelIndex parent = model->parent(index);
    
    for (int i = index.row(); i < model->rowCount(parent); i++) {
        PARSING_DATA pdata = parsingDataFromQModelIndex(index);
        UINT32 lastVariableFlag = pdata.emptyByte ? 0xFFFFFF : 0;
        if (pdata.nvar.next == lastVariableFlag) {
            ui->structureTreeView->scrollTo(index, QAbstractItemView::PositionAtCenter);
            ui->structureTreeView->selectionModel()->select(index, QItemSelectionModel::Select | QItemSelectionModel::Rows | QItemSelectionModel::Clear);
        }
        
        for (int j = i + 1; j < model->rowCount(parent); j++) {
            QModelIndex currentIndex = parent.child(j, 0);
            PARSING_DATA currentPdata = parsingDataFromQModelIndex(currentIndex);
            if (currentPdata.offset == pdata.offset + pdata.nvar.next) {
                index = currentIndex;
                break;
            }
        }
    }
}

void UEFITool::insert(const UINT8 mode)
{
    /*QModelIndex index = ui->structureTreeView->selectionModel()->currentIndex();
    if (!index.isValid())
        return;

    UINT8 type;

    if (mode == CREATE_MODE_BEFORE || mode == CREATE_MODE_AFTER)
        type = model->type(index.parent());
    else
        type = model->type(index);

    QString path;
    switch (type) {
    case Types::Volume:
        path = QFileDialog::getOpenFileName(this, tr("Select FFS file to insert"), currentDir, "FFS files (*.ffs *.bin);;All files (*)");
        break;
    case Types::File:
    case Types::Section:
        path = QFileDialog::getOpenFileName(this, tr("Select section file to insert"), currentDir, "Section files (*.sct *.bin);;All files (*)");
        break;
    default:
        return;
    }

    if (path.trimmed().isEmpty())
        return;

    QFileInfo fileInfo = QFileInfo(path);
    if (!fileInfo.exists()) {
        ui->statusBar->showMessage(tr("Please select existing file"));
        return;
    }

    QFile inputFile;
    inputFile.setFileName(path);

    if (!inputFile.open(QFile::ReadOnly)) {
        QMessageBox::critical(this, tr("Insertion failed"), tr("Can't open output file for reading"), QMessageBox::Ok);
        return;
    }

    QByteArray buffer = inputFile.readAll();
    inputFile.close();

    UINT8 result = ffsEngine->insert(index, buffer, mode);
    if (result) {
        QMessageBox::critical(this, tr("Insertion failed"), errorMessage(result), QMessageBox::Ok);
        return;
    }
    ui->actionSaveImageFile->setEnabled(true);*/
}

void UEFITool::insertInto()
{
    insert(CREATE_MODE_PREPEND);
}

void UEFITool::insertBefore()
{
    insert(CREATE_MODE_BEFORE);
}

void UEFITool::insertAfter()
{
    insert(CREATE_MODE_AFTER);
}

void UEFITool::replaceAsIs()
{
    replace(REPLACE_MODE_AS_IS);
}

void UEFITool::replaceBody()
{
    replace(REPLACE_MODE_BODY);
}

void UEFITool::replace(const UINT8 mode)
{
    QModelIndex index = ui->structureTreeView->selectionModel()->currentIndex();
    if (!index.isValid())
        return;

    QString path;
    if (model->type(index) == Types::Region) {
        if (mode == REPLACE_MODE_AS_IS) {
            path = QFileDialog::getOpenFileName(this, tr("Select region file to replace %1").arg(model->name(index)), currentDir, "Region files (*.rgn *.bin);;All files (*)");
        }
        else
            return;
    }
    else if (model->type(index) == Types::Volume) {
        if (mode == REPLACE_MODE_AS_IS) {
            path = QFileDialog::getOpenFileName(this, tr("Select volume file to replace selected volume"), currentDir, "Volume files (*.vol *.bin);;All files (*)");
        }
        else if (mode == REPLACE_MODE_BODY) {
            path = QFileDialog::getOpenFileName(this, tr("Select volume body file to replace the body of selected volume"), currentDir, "Volume body files (*.vbd *.bin);;All files (*)");
        }
        else
            return;
    }
    else if (model->type(index) == Types::File) {
        if (mode == REPLACE_MODE_AS_IS) {
            path = QFileDialog::getOpenFileName(this, tr("Select FFS file to replace %1 file").arg(model->text(index).isEmpty() ? model->name(index) : model->text(index)), 
                currentDir, "FFS files (*.ffs *.bin);;All files (*)");
        }
        else if (mode == REPLACE_MODE_BODY) {
            if (model->subtype(index) == EFI_FV_FILETYPE_ALL || model->subtype(index) == EFI_FV_FILETYPE_RAW)
                path = QFileDialog::getOpenFileName(this, tr("Select raw file to replace the body of %1 file").arg(model->text(index).isEmpty() ? model->name(index) : model->text(index)),
                currentDir, "Raw files (*.raw *.bin);;All files (*)");
            else if (model->subtype(index) == EFI_FV_FILETYPE_PAD) // Pad file body can't be replaced
                //!TODO: handle non-empty pad files
                return;
            else
                path = QFileDialog::getOpenFileName(this, tr("Select FFS file body to replace the body of %1 file").arg(model->text(index).isEmpty() ? model->name(index) : model->text(index)),
                currentDir, "FFS file body files (*.fbd *.bin);;All files (*)");
        }
        else
            return;
    }
    else if (model->type(index) == Types::Section) {
        if (mode == REPLACE_MODE_AS_IS) {
            path = QFileDialog::getOpenFileName(this, tr("Select section file to replace selected section"), currentDir, "Section files (*.sct *.bin);;All files (*)");
        }
        else if (mode == REPLACE_MODE_BODY) {
            if (model->subtype(index) == EFI_SECTION_COMPRESSION || model->subtype(index) == EFI_SECTION_GUID_DEFINED || model->subtype(index) == EFI_SECTION_DISPOSABLE)
                path = QFileDialog::getOpenFileName(this, tr("Select FFS file body file to replace the body of selected section"), currentDir, "FFS file body files (*.fbd *.bin);;All files (*)");
            else if (model->subtype(index) == EFI_SECTION_FIRMWARE_VOLUME_IMAGE)
                path = QFileDialog::getOpenFileName(this, tr("Select volume file to replace the body of selected section"), currentDir, "Volume files (*.vol *.bin);;All files (*)");
            else if (model->subtype(index) == EFI_SECTION_RAW)
                path = QFileDialog::getOpenFileName(this, tr("Select raw file to replace the body of selected section"), currentDir, "Raw files (*.raw *.bin);;All files (*)");
            else if (model->subtype(index) == EFI_SECTION_PE32 || model->subtype(index) == EFI_SECTION_TE || model->subtype(index) == EFI_SECTION_PIC)
                path = QFileDialog::getOpenFileName(this, tr("Select EFI executable file to replace the body of selected section"), currentDir, "EFI executable files (*.efi *.dxe *.pei *.bin);;All files (*)");
            else
                path = QFileDialog::getOpenFileName(this, tr("Select file to replace the body of selected section"), currentDir, "Binary files (*.bin);;All files (*)");
        }
        else
            return;
    }
    else
        return;

    if (path.trimmed().isEmpty())
        return;

    QFileInfo fileInfo = QFileInfo(path);
    if (!fileInfo.exists()) {
        ui->statusBar->showMessage(tr("Please select an existing file"));
        return;
    }

    QFile inputFile;
    inputFile.setFileName(path);

    if (!inputFile.open(QFile::ReadOnly)) {
        QMessageBox::critical(this, tr("Replacing failed"), tr("Can't open input file for reading"), QMessageBox::Ok);
        return;
    }

    QByteArray buffer = inputFile.readAll();
    inputFile.close();

    UINT8 result = ffsOps->replace(index, buffer, mode);
    if (result) {
        QMessageBox::critical(this, tr("Replacing failed"), errorCodeToQString(result), QMessageBox::Ok);
        return;
    }
    ui->actionSaveImageFile->setEnabled(true);
}

void UEFITool::extractAsIs()
{
    extract(EXTRACT_MODE_AS_IS);
}

void UEFITool::extractBody()
{
    extract(EXTRACT_MODE_BODY);
}

void UEFITool::extractBodyUncompressed()
{
    extract(EXTRACT_MODE_BODY_UNCOMPRESSED);
}

void UEFITool::extract(const UINT8 mode)
{
    QModelIndex index = ui->structureTreeView->selectionModel()->currentIndex();
    if (!index.isValid())
        return;

    QByteArray extracted;
    QString name;
    UINT8 result = ffsOps->extract(index, name, extracted, mode);
    if (result) {
        QMessageBox::critical(this, tr("Extraction failed"), errorCodeToQString(result), QMessageBox::Ok);
        return;
    }
    
    name = QDir::toNativeSeparators(currentDir + QDir::separator() + name);

    //ui->statusBar->showMessage(name);

    UINT8 type = model->type(index);
    UINT8 subtype = model->subtype(index);
    QString path;
    if (mode == EXTRACT_MODE_AS_IS) {
        switch (type) {
        case Types::Capsule:       path = QFileDialog::getSaveFileName(this, tr("Save capsule to file"),          name + ".cap",  "Capsule files (*.cap *.bin);;All files (*)");          break;
        case Types::Image:         path = QFileDialog::getSaveFileName(this, tr("Save image to file"),            name + ".rom",  "Image files (*.rom *.bin);;All files (*)");            break;
        case Types::Region:        path = QFileDialog::getSaveFileName(this, tr("Save region to file"),           name + ".rgn",  "Region files (*.rgn *.bin);;All files (*)");           break;
        case Types::Padding:       path = QFileDialog::getSaveFileName(this, tr("Save padding to file"),          name + ".pad",  "Padding files (*.pad *.bin);;All files (*)");          break;
        case Types::Volume:        path = QFileDialog::getSaveFileName(this, tr("Save volume to file"),           name + ".vol",  "Volume files (*.vol *.bin);;All files (*)");           break;
        case Types::File:          path = QFileDialog::getSaveFileName(this, tr("Save FFS file to file"),         name + ".ffs",  "FFS files (*.ffs *.bin);;All files (*)");              break;
        case Types::Section:       path = QFileDialog::getSaveFileName(this, tr("Save section to file"),          name + ".sct",  "Section files (*.sct *.bin);;All files (*)");          break;
        case Types::NvarEntry:     path = QFileDialog::getSaveFileName(this, tr("Save NVAR entry to file"),       name + ".nvar", "NVAR entry files (*.nvar *.bin);;All files (*)");      break;
        case Types::VssEntry:      path = QFileDialog::getSaveFileName(this, tr("Save VSS entry to file"),        name + ".vss",  "VSS entry files (*.vss *.bin);;All files (*)");        break;
        case Types::FsysEntry:     path = QFileDialog::getSaveFileName(this, tr("Save Fsys entry to file"),       name + ".fse",  "Fsys entry files (*.fse *.bin);;All files (*)");       break;
        case Types::EvsaEntry:     path = QFileDialog::getSaveFileName(this, tr("Save EVSA entry to file"),       name + ".evse", "EVSA entry files (*.evse *.bin);;All files (*)");      break;
        case Types::FlashMapEntry: path = QFileDialog::getSaveFileName(this, tr("Save FlashMap entry to file"),   name + ".fme",  "FlashMap entry files (*.fme *.bin);;All files (*)");   break;
        case Types::VssStore:      path = QFileDialog::getSaveFileName(this, tr("Save VSS store to file"),        name + ".vss",  "VSS store files (*.vss *.bin);;All files (*)");        break;
        case Types::FdcStore:      path = QFileDialog::getSaveFileName(this, tr("Save FDC store to file"),        name + ".fdc",  "FDC store files (*.fdc *.bin);;All files (*)");        break;
        case Types::FsysStore:     path = QFileDialog::getSaveFileName(this, tr("Save Fsys store to file"),       name + ".fsys", "Fsys store files (*.fsys *.bin);;All files (*)");      break;
        case Types::EvsaStore:     path = QFileDialog::getSaveFileName(this, tr("Save EVSA store to file"),       name + ".evsa", "EVSA store files (*.evsa *.bin);;All files (*)");      break;
        case Types::FtwStore:      path = QFileDialog::getSaveFileName(this, tr("Save FTW store to file"),        name + ".ftw",  "FTW store files (*.ftw *.bin);;All files (*)");        break;
        case Types::FlashMapStore: path = QFileDialog::getSaveFileName(this, tr("Save FlashMap store to file"),   name + ".fmap", "FlashMap store files (*.fmap *.bin);;All files (*)");  break;
        case Types::CmdbStore:     path = QFileDialog::getSaveFileName(this, tr("Save CMDB store to file"),       name + ".cmdb", "CMDB store files (*.cmdb *.bin);;All files (*)");      break;
        case Types::Microcode:     path = QFileDialog::getSaveFileName(this, tr("Save microcode binary to file"), name + ".ucd",  "Microcode binary files (*.ucd *.bin);;All files (*)"); break;
        case Types::SlicData:
            if (subtype == Subtypes::PubkeySlicData) path = QFileDialog::getSaveFileName(this, tr("Save SLIC pubkey to file"), name + ".spk", "SLIC pubkey files (*.spk *.bin);;All files (*)");
            else                                     path = QFileDialog::getSaveFileName(this, tr("Save SLIC marker to file"), name + ".smk", "SLIC marker files (*.smk *.bin);;All files (*)");
            break;
        default:                   path = QFileDialog::getSaveFileName(this, tr("Save object to file"), name + ".bin", "Binary files (*.bin);;All files (*)");
        }
    }
    else if (mode == EXTRACT_MODE_BODY || mode == EXTRACT_MODE_BODY_UNCOMPRESSED) {
        switch (type) {
        case Types::Capsule:                         path = QFileDialog::getSaveFileName(this, tr("Save capsule body to image file"), name + ".rom", "Image files (*.rom *.bin);;All files (*)");       break;
        case Types::Volume:                          path = QFileDialog::getSaveFileName(this, tr("Save volume body to file"),        name + ".vbd", "Volume body files (*.vbd *.bin);;All files (*)"); break;
        case Types::File: 
            if (subtype    == EFI_FV_FILETYPE_ALL
                || subtype == EFI_FV_FILETYPE_RAW)   path = QFileDialog::getSaveFileName(this, tr("Save FFS file body to raw file"),  name + ".raw", "Raw files (*.raw *.bin);;All files (*)");
            else                                     path = QFileDialog::getSaveFileName(this, tr("Save FFS file body to file"),      name + ".fbd", "FFS file body files (*.fbd *.bin);;All files (*)");
            break;
        case Types::Section: 
            if (subtype    == EFI_SECTION_COMPRESSION
                || subtype == EFI_SECTION_GUID_DEFINED
                || subtype == EFI_SECTION_DISPOSABLE)              path = QFileDialog::getSaveFileName(this, tr("Save encapsulation section body to FFS body file"), name + ".fbd", "FFS file body files (*.fbd *.bin);;All files (*)");
            else if (subtype == EFI_SECTION_FIRMWARE_VOLUME_IMAGE) path = QFileDialog::getSaveFileName(this, tr("Save section body to volume file"),                 name + ".vol", "Volume files (*.vol *.bin);;All files (*)");
            else if (subtype == EFI_SECTION_RAW)                   path = QFileDialog::getSaveFileName(this, tr("Save section body to raw file"),                    name + ".raw", "Raw files (*.raw *.bin);;All files (*)");
            else if (subtype == EFI_SECTION_PE32
                || subtype == EFI_SECTION_TE
                || subtype == EFI_SECTION_PIC)                     path = QFileDialog::getSaveFileName(this, tr("Save section body to EFI executable file"),         name + ".efi", "EFI executable files (*.efi *.bin);;All files (*)");
            else                                                   path = QFileDialog::getSaveFileName(this, tr("Save section body to file"),                        name + ".bin", "Binary files (*.bin);;All files (*)");
           break;
        case Types::NvarEntry:
        case Types::VssEntry:
        case Types::EvsaEntry:
        case Types::FlashMapEntry:
        case Types::FsysEntry:                       path = QFileDialog::getSaveFileName(this, tr("Save entry body to file"),       name + ".bin", "Binary files (*.bin);;All files (*)"); break;
        case Types::VssStore:
        case Types::FtwStore:
        case Types::FdcStore:
        case Types::FsysStore:
        case Types::FlashMapStore:
        case Types::CmdbStore:                       path = QFileDialog::getSaveFileName(this, tr("Save store body to file"),       name + ".bin", "Binary files (*.bin);;All files (*)");                   break;
        case Types::Microcode:                       path = QFileDialog::getSaveFileName(this, tr("Save microcode body to file"),   name + ".ucb", "Microcode body files (*.ucb *.bin);;All files (*)"); break;
        case Types::SlicData:
            if (subtype == Subtypes::PubkeySlicData) path = QFileDialog::getSaveFileName(this, tr("Save SLIC pubkey body to file"), name + ".spb", "SLIC pubkey body files (*.spb *.bin);;All files (*)");
            else                                     path = QFileDialog::getSaveFileName(this, tr("Save SLIC marker body to file"), name + ".smb", "SLIC marker body files (*.smb *.bin);;All files (*)");
            break;
        default:                                     path = QFileDialog::getSaveFileName(this, tr("Save object to file"),           name + ".bin", "Binary files (*.bin);;All files (*)");
        }
    }
    else                                             path = QFileDialog::getSaveFileName(this, tr("Save object to file"),           name + ".bin", "Binary files (*.bin);;All files (*)");

    if (path.trimmed().isEmpty())
        return;

    QFile outputFile;
    outputFile.setFileName(path);
    if (!outputFile.open(QFile::WriteOnly)) {
        QMessageBox::critical(this, tr("Extraction failed"), tr("Can't open output file for rewriting"), QMessageBox::Ok);
        return;
    }
    outputFile.resize(0);
    outputFile.write(extracted);
    outputFile.close();
}

void UEFITool::rebuild()
{
    QModelIndex index = ui->structureTreeView->selectionModel()->currentIndex();
    if (!index.isValid())
        return;

    if (ERR_SUCCESS == ffsOps->rebuild(index))
        ui->actionSaveImageFile->setEnabled(true);
}

void UEFITool::remove()
{
    QModelIndex index = ui->structureTreeView->selectionModel()->currentIndex();
    if (!index.isValid())
        return;

    if (ERR_SUCCESS == ffsOps->remove(index))
        ui->actionSaveImageFile->setEnabled(true);
}

void UEFITool::about()
{
    QMessageBox::about(this, tr("About UEFITool"), tr(
        "Copyright (c) 2016, Nikolaj Schlej aka <b>CodeRush</b>.<br>"
        "Program icon made by <a href=https://www.behance.net/alzhidkov>Alexander Zhidkov</a>.<br><br>"
        "The program is dedicated to <b>RevoGirl</b>. Rest in peace, young genius.<br><br>"
        "The program and the accompanying materials are licensed and made available under the terms and conditions of the BSD License.<br>"
        "The full text of the license may be found at <a href=http://opensource.org/licenses/bsd-license.php>OpenSource.org</a>.<br><br>"
        "<b>THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN \"AS IS\" BASIS, "
        "WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, "
        "EITHER EXPRESS OR IMPLIED.</b>"));
}

void UEFITool::aboutQt()
{
    QMessageBox::aboutQt(this, tr("About Qt"));
}

void UEFITool::exit()
{
    QCoreApplication::exit(0);
}

void UEFITool::saveImageFile()
{
    QString path = QFileDialog::getSaveFileName(this, tr("Save BIOS image file"), currentDir, "BIOS image files (*.rom *.bin *.cap *.scap *.bio *.fd *.wph *.dec);;All files (*)");

    if (path.isEmpty())
        return;

    QByteArray reconstructed;
    // Create ffsBuilder
    delete ffsBuilder;
    ffsBuilder = new FfsBuilder(model);
    STATUS result = ffsBuilder->build(model->index(0,0), reconstructed);
    showBuilderMessages();
    if (result) {
        QMessageBox::critical(this, tr("Image build failed"), errorCodeToQString(result), QMessageBox::Ok);
        return;
    }

    QFile outputFile;
    outputFile.setFileName(path);
    if (!outputFile.open(QFile::WriteOnly)) {
        QMessageBox::critical(this, tr("Image build failed"), tr("Can't open output file for rewriting"), QMessageBox::Ok);
        return;
    }

    outputFile.resize(0);
    outputFile.write(reconstructed);
    outputFile.close();
    if (QMessageBox::Yes == QMessageBox::information(this, tr("Image build successful"), tr("Open the resulting file?"), QMessageBox::Yes, QMessageBox::No))
        openImageFile(path);
}

void UEFITool::openImageFile()
{
    QString path = QFileDialog::getOpenFileName(this, tr("Open BIOS image file"), currentDir, "BIOS image files (*.rom *.bin *.cap *scap *.bio *.fd *.wph *.dec);;All files (*)");
    openImageFile(path);
}

void UEFITool::openImageFileInNewWindow()
{
    QString path = QFileDialog::getOpenFileName(this, tr("Open BIOS image file in new window"), currentDir, "BIOS image files (*.rom *.bin *.cap *scap *.bio *.fd *.wph *.dec);;All files (*)");
    if (path.trimmed().isEmpty())
        return;
    QProcess::startDetached(currentProgramPath, QStringList(path));
}

void UEFITool::openImageFile(QString path)
{
    if (path.trimmed().isEmpty())
        return;

    QFileInfo fileInfo = QFileInfo(path);

    if (!fileInfo.exists()) {
        ui->statusBar->showMessage(tr("Please select existing file"));
        return;
    }

    QFile inputFile;
    inputFile.setFileName(path);

    if (!inputFile.open(QFile::ReadOnly)) {
        QMessageBox::critical(this, tr("Image parsing failed"), tr("Can't open input file for reading"), QMessageBox::Ok);
        return;
    }

    QByteArray buffer = inputFile.readAll();
    inputFile.close();

    init();
    setWindowTitle(tr("UEFITool %1 - %2").arg(version).arg(fileInfo.fileName()));

    UINT8 result = ffsParser->parse(buffer);
    showParserMessages();
    if (result) {
        QMessageBox::critical(this, tr("Image parsing failed"), errorCodeToQString(result), QMessageBox::Ok);
        return;
    }
    else
        ui->statusBar->showMessage(tr("Opened: %1").arg(fileInfo.fileName()));

    // Parse FIT
    result = fitParser->parse(model->index(0, 0), ffsParser->getLastVtf());
    showFitMessages();
    if (!result) {
        showFitTable();
    }

    // Enable search ...
    delete ffsFinder;
    ffsFinder = new FfsFinder(model);
    ui->actionSearch->setEnabled(true);
    // ... and other operations
    delete ffsOps;
    ffsOps = new FfsOperations(model);

    // Set current directory
    currentDir = fileInfo.absolutePath();
}

void UEFITool::copyMessage()
{
    clipboard->clear();
    if (ui->messagesTabWidget->currentIndex() == 0) // Parser tab
      clipboard->setText(ui->parserMessagesListWidget->currentItem()->text());
    else if (ui->messagesTabWidget->currentIndex() == 1) // FIT tab
        clipboard->setText(ui->fitMessagesListWidget->currentItem()->text());
    else if (ui->messagesTabWidget->currentIndex() == 2) // Search tab
        clipboard->setText(ui->finderMessagesListWidget->currentItem()->text());
    else if (ui->messagesTabWidget->currentIndex() == 3) // Builder tab
        clipboard->setText(ui->builderMessagesListWidget->currentItem()->text());
}

void UEFITool::copyAllMessages()
{
    QString text;
    clipboard->clear();
    if (ui->messagesTabWidget->currentIndex() == 0) { // Parser tab 
        for (INT32 i = 0; i < ui->parserMessagesListWidget->count(); i++)
            text.append(ui->parserMessagesListWidget->item(i)->text()).append("\n");
        clipboard->setText(text);
    }
    else if (ui->messagesTabWidget->currentIndex() == 1) {  // FIT tab
        for (INT32 i = 0; i < ui->fitMessagesListWidget->count(); i++)
            text.append(ui->fitMessagesListWidget->item(i)->text()).append("\n");
        clipboard->setText(text);
    }
    else if (ui->messagesTabWidget->currentIndex() == 2) {  // Search tab
        for (INT32 i = 0; i < ui->finderMessagesListWidget->count(); i++)
            text.append(ui->finderMessagesListWidget->item(i)->text()).append("\n");
        clipboard->setText(text);
    }
    else if (ui->messagesTabWidget->currentIndex() == 3) {  // Builder tab
        for (INT32 i = 0; i < ui->builderMessagesListWidget->count(); i++)
            text.append(ui->builderMessagesListWidget->item(i)->text()).append("\n");
        clipboard->setText(text);
    }
}

void UEFITool::enableMessagesCopyActions(QListWidgetItem* item)
{
    ui->actionMessagesCopy->setEnabled(item != NULL);
    ui->actionMessagesCopyAll->setEnabled(item != NULL);
}

void UEFITool::clearMessages()
{
    if (ui->messagesTabWidget->currentIndex() == 0) { // Parser tab 
        if (ffsParser) ffsParser->clearMessages();
        ui->parserMessagesListWidget->clear();
    }
    else if (ui->messagesTabWidget->currentIndex() == 1) {  // FIT tab
        if (fitParser) fitParser->clearMessages();
        ui->fitMessagesListWidget->clear();
    }
    else if (ui->messagesTabWidget->currentIndex() == 2) {  // Search tab
        if (ffsFinder) ffsFinder->clearMessages();
        ui->finderMessagesListWidget->clear();
    }
    else if (ui->messagesTabWidget->currentIndex() == 3) {  // Builder tab
        if (ffsBuilder) ffsBuilder->clearMessages();
        ui->builderMessagesListWidget->clear();
    }
    
    ui->actionMessagesCopy->setEnabled(false);
    ui->actionMessagesCopyAll->setEnabled(false);
}

void UEFITool::dragEnterEvent(QDragEnterEvent* event)
{
    if (event->mimeData()->hasFormat("text/uri-list"))
        event->acceptProposedAction();
}

void UEFITool::dropEvent(QDropEvent* event)
{
    QString path = event->mimeData()->urls().at(0).toLocalFile();
    openImageFile(path);
}

void UEFITool::showParserMessages()
{
    ui->parserMessagesListWidget->clear();
    if (!ffsParser)
        return;

    std::vector<std::pair<QString, QModelIndex> > messages = ffsParser->getMessages();
    std::pair<QString, QModelIndex> msg;
    foreach (msg, messages) {
        ui->parserMessagesListWidget->addItem(new MessageListItem(msg.first, NULL, 0, msg.second));
    }

    ui->messagesTabWidget->setCurrentIndex(0);
    ui->parserMessagesListWidget->scrollToBottom();
}

void UEFITool::showFitMessages()
{
    ui->fitMessagesListWidget->clear();
    if (!fitParser)
        return;

    std::vector<std::pair<QString, QModelIndex> > messages = fitParser->getMessages();
    std::pair<QString, QModelIndex> msg;
    foreach (msg, messages) {
        ui->fitMessagesListWidget->addItem(new MessageListItem(msg.first, NULL, 0, msg.second));
    }

    ui->fitMessagesListWidget->scrollToBottom();
}

void UEFITool::showFinderMessages()
{
    ui->finderMessagesListWidget->clear();
    if (!ffsParser)
        return;

    std::vector<std::pair<QString, QModelIndex> > messages = ffsFinder->getMessages();
    std::pair<QString, QModelIndex> msg;
    foreach (msg, messages) {
        ui->finderMessagesListWidget->addItem(new MessageListItem(msg.first, NULL, 0, msg.second));
    }

    ui->messagesTabWidget->setCurrentIndex(2);
    ui->finderMessagesListWidget->scrollToBottom();
}

void UEFITool::showBuilderMessages()
{
    ui->builderMessagesListWidget->clear();
    if (!ffsBuilder)
        return;

    std::vector<std::pair<QString, QModelIndex> > messages = ffsBuilder->getMessages();
    std::pair<QString, QModelIndex> msg;
    foreach (msg, messages) {
        ui->builderMessagesListWidget->addItem(new MessageListItem(msg.first, NULL, 0, msg.second));
    }

    ui->messagesTabWidget->setCurrentIndex(3);
    ui->builderMessagesListWidget->scrollToBottom();
}

void UEFITool::scrollTreeView(QListWidgetItem* item)
{
    MessageListItem* messageItem = static_cast<MessageListItem*>(item);
    QModelIndex index = messageItem->index();
    if (index.isValid()) {
        ui->structureTreeView->scrollTo(index, QAbstractItemView::PositionAtCenter);
        ui->structureTreeView->selectionModel()->select(index, QItemSelectionModel::Select | QItemSelectionModel::Rows | QItemSelectionModel::Clear);
    }
}

void UEFITool::contextMenuEvent(QContextMenuEvent* event)
{
    if (ui->parserMessagesListWidget->underMouse() ||
        ui->fitMessagesListWidget->underMouse() ||
        ui->finderMessagesListWidget->underMouse() ||
        ui->builderMessagesListWidget->underMouse()) {
        ui->menuMessages->exec(event->globalPos());
        return;
    }

    if (!ui->structureTreeView->underMouse())
        return;

    QPoint pt = event->pos();
    QModelIndex index = ui->structureTreeView->indexAt(ui->structureTreeView->viewport()->mapFrom(this, pt));
    if (!index.isValid())
        return;

    switch (model->type(index))
    {
    case Types::Capsule:        ui->menuCapsuleActions->exec(event->globalPos());        break;
    case Types::Image:          ui->menuImageActions->exec(event->globalPos());        break;
    case Types::Region:         ui->menuRegionActions->exec(event->globalPos());        break;
    case Types::Padding:        ui->menuPaddingActions->exec(event->globalPos());        break;
    case Types::Volume:         ui->menuVolumeActions->exec(event->globalPos());        break;
    case Types::File:           ui->menuFileActions->exec(event->globalPos());        break;
    case Types::Section:        ui->menuSectionActions->exec(event->globalPos());        break;
    case Types::NvarEntry:
    case Types::VssEntry:
    case Types::FsysEntry:
    case Types::EvsaEntry:
    case Types::FlashMapEntry:  ui->menuVariableActions->exec(event->globalPos());        break;
    case Types::VssStore:
    case Types::FdcStore:
    case Types::FsysStore:
    case Types::EvsaStore:
    case Types::FtwStore:
    case Types::FlashMapStore:
    case Types::CmdbStore:
    case Types::Microcode:
    case Types::SlicData:       ui->menuStoreActions->exec(event->globalPos());        break;
    }
}

void UEFITool::readSettings()
{
    QSettings settings(this);
    resize(settings.value("mainWindow/size", QSize(800, 600)).toSize());
    move(settings.value("mainWindow/position", QPoint(0, 0)).toPoint());
    QList<int> horList, vertList;
    horList.append(settings.value("mainWindow/treeWidth", 600).toInt());
    horList.append(settings.value("mainWindow/infoWidth", 180).toInt());
    vertList.append(settings.value("mainWindow/treeHeight", 400).toInt());
    vertList.append(settings.value("mainWindow/messageHeight", 180).toInt());
    ui->infoSplitter->setSizes(horList);
    ui->messagesSplitter->setSizes(vertList);
    ui->structureTreeView->setColumnWidth(0, settings.value("tree/columnWidth0", ui->structureTreeView->columnWidth(0)).toInt());
    ui->structureTreeView->setColumnWidth(1, settings.value("tree/columnWidth1", ui->structureTreeView->columnWidth(1)).toInt());
    ui->structureTreeView->setColumnWidth(2, settings.value("tree/columnWidth2", ui->structureTreeView->columnWidth(2)).toInt());
    ui->structureTreeView->setColumnWidth(3, settings.value("tree/columnWidth3", ui->structureTreeView->columnWidth(3)).toInt());
}

void UEFITool::writeSettings()
{
    QSettings settings(this);
    settings.setValue("mainWindow/size", size());
    settings.setValue("mainWindow/position", pos());
    settings.setValue("mainWindow/treeWidth", ui->structureGroupBox->width());
    settings.setValue("mainWindow/infoWidth", ui->infoGroupBox->width());
    settings.setValue("mainWindow/treeHeight", ui->structureGroupBox->height());
    settings.setValue("mainWindow/messageHeight", ui->messagesTabWidget->height());
    settings.setValue("tree/columnWidth0", ui->structureTreeView->columnWidth(0));
    settings.setValue("tree/columnWidth1", ui->structureTreeView->columnWidth(1));
    settings.setValue("tree/columnWidth2", ui->structureTreeView->columnWidth(2));
    settings.setValue("tree/columnWidth3", ui->structureTreeView->columnWidth(3));
}

void UEFITool::showFitTable()
{
    std::vector<std::vector<QString> > fitTable = fitParser->getFitTable();
    if (fitTable.empty()) {
        return;
    }
    // Enable FIT tab
    ui->messagesTabWidget->setTabEnabled(1, true);

    // Set up the FIT table
    ui->fitTableWidget->clear();
    ui->fitTableWidget->setRowCount(fitTable.size());
    ui->fitTableWidget->setColumnCount(5);
    ui->fitTableWidget->setHorizontalHeaderLabels(QStringList() << tr("Address") << tr("Size") << tr("Version") << tr("Type") << tr("Checksum"));
    ui->fitTableWidget->setEditTriggers(QAbstractItemView::NoEditTriggers);
    ui->fitTableWidget->setSelectionBehavior(QAbstractItemView::SelectRows);
    ui->fitTableWidget->setSelectionMode(QAbstractItemView::SingleSelection);
    ui->fitTableWidget->horizontalHeader()->setStretchLastSection(true);

    // Add all data to the table widget
    for (size_t i = 0; i < fitTable.size(); i++) {
        for (UINT8 j = 0; j < 5; j++) {
            ui->fitTableWidget->setItem(i, j, new QTableWidgetItem(fitTable[i][j]));
        }
    }

    ui->fitTableWidget->resizeColumnsToContents();
    ui->fitTableWidget->resizeRowsToContents();
    ui->messagesTabWidget->setCurrentIndex(1);
}
