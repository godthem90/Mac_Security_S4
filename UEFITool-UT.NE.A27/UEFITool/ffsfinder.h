/* fssfinder.h

Copyright (c) 2015, Nikolaj Schlej. All rights reserved.
This program and the accompanying materials
are licensed and made available under the terms and conditions of the BSD License
which accompanies this distribution.  The full text of the license may be found at
http://opensource.org/licenses/bsd-license.php

THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.

*/

#ifndef FFSFINDER_H
#define FFSFINDER_H

#include <vector>

#include <QObject>
#include <QByteArray>
#include <QString>
#include <QModelIndex>
#include <QRegExp>

#include "../common/basetypes.h"
#include "../common/treemodel.h"

class FfsFinder
{
public:
    FfsFinder(const TreeModel * treeModel) : model(treeModel) {}
    ~FfsFinder() {}

    std::vector<std::pair<QString, QModelIndex> > getMessages() const { return messagesVector; }
    void clearMessages() { messagesVector.clear(); }

    STATUS findHexPattern(const QModelIndex & index, const QByteArray & hexPattern, const UINT8 mode);
    STATUS findGuidPattern(const QModelIndex & index, const QByteArray & guidPattern, const UINT8 mode);
    STATUS findTextPattern(const QModelIndex & index, const QString & pattern, const UINT8 mode, const bool unicode, const Qt::CaseSensitivity caseSensitive);

private:
    const TreeModel* model;
    std::vector<std::pair<QString, QModelIndex> > messagesVector;

    void msg(const QString & message, const QModelIndex &index = QModelIndex()) {
        messagesVector.push_back(std::pair<QString, QModelIndex>(message, index));
    }
};

#endif // FFSFINDER_H
