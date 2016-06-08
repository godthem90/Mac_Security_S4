﻿/* ffsparser.cpp

Copyright (c) 2016, Nikolaj Schlej. All rights reserved.
This program and the accompanying materials
are licensed and made available under the terms and conditions of the BSD License
which accompanies this distribution.  The full text of the license may be found at
http://opensource.org/licenses/bsd-license.php

THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
WITHWARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
*/

#include "ffsparser.h"

#include <cmath>
#include <algorithm>

// Region info structure definition
struct REGION_INFO {
    UINT32 offset;
    UINT32 length;
    UINT8  type;
    QByteArray data;
    friend bool operator< (const REGION_INFO & lhs, const REGION_INFO & rhs){ return lhs.offset < rhs.offset; }
};

// Firmware image parsing functions
STATUS FfsParser::parse(const QByteArray & buffer) 
{
    QModelIndex root;
    STATUS result = performFirstPass(buffer, root);
    addOffsetsRecursive(root);
    if (result)
        return result;

    if (lastVtf.isValid()) 
        result = performSecondPass(root);
    else 
        msg(QObject::tr("parse: not a single Volume Top File is found, the image may be corrupted"));

    return result;
}

STATUS FfsParser::performFirstPass(const QByteArray & buffer, QModelIndex & index)
{
    // Reset capsule offset fixup value
    capsuleOffsetFixup = 0;

    // Check buffer size to be more than or equal to size of EFI_CAPSULE_HEADER
    if ((UINT32)buffer.size() <= sizeof(EFI_CAPSULE_HEADER)) {
        msg(QObject::tr("performFirstPass: image file is smaller than minimum size of %1h (%2) bytes").hexarg(sizeof(EFI_CAPSULE_HEADER)).arg(sizeof(EFI_CAPSULE_HEADER)));
        return ERR_INVALID_PARAMETER;
    }

    UINT32 capsuleHeaderSize = 0;
    // Check buffer for being normal EFI capsule header
    if (buffer.startsWith(EFI_CAPSULE_GUID)
        || buffer.startsWith(INTEL_CAPSULE_GUID)
        || buffer.startsWith(LENOVO_CAPSULE_GUID)
        || buffer.startsWith(LENOVO2_CAPSULE_GUID)) {
        // Get info
        const EFI_CAPSULE_HEADER* capsuleHeader = (const EFI_CAPSULE_HEADER*)buffer.constData();

        // Check sanity of HeaderSize and CapsuleImageSize values
        if (capsuleHeader->HeaderSize == 0 || capsuleHeader->HeaderSize > (UINT32)buffer.size() || capsuleHeader->HeaderSize > capsuleHeader->CapsuleImageSize) {
            msg(QObject::tr("performFirstPass: UEFI capsule header size of %1h (%2) bytes is invalid")
                .hexarg(capsuleHeader->HeaderSize).arg(capsuleHeader->HeaderSize));
            return ERR_INVALID_CAPSULE;
        }
        if (capsuleHeader->CapsuleImageSize == 0 || capsuleHeader->CapsuleImageSize > (UINT32)buffer.size()) {
            msg(QObject::tr("performFirstPass: UEFI capsule image size of %1h (%2) bytes is invalid")
                .hexarg(capsuleHeader->CapsuleImageSize).arg(capsuleHeader->CapsuleImageSize));
            return ERR_INVALID_CAPSULE;
        }

        capsuleHeaderSize = capsuleHeader->HeaderSize;
        QByteArray header = buffer.left(capsuleHeaderSize);
        QByteArray body = buffer.mid(capsuleHeaderSize);
        QString name = QObject::tr("UEFI capsule");
        QString info = QObject::tr("Capsule GUID: %1\nFull size: %2h (%3)\nHeader size: %4h (%5)\nImage size: %6h (%7)\nFlags: %8h")
            .arg(guidToQString(capsuleHeader->CapsuleGuid))
            .hexarg(buffer.size()).arg(buffer.size())
            .hexarg(capsuleHeaderSize).arg(capsuleHeaderSize)
            .hexarg(capsuleHeader->CapsuleImageSize - capsuleHeaderSize).arg(capsuleHeader->CapsuleImageSize - capsuleHeaderSize)
            .hexarg2(capsuleHeader->Flags, 8);

        // Set capsule offset fixup for correct volume allignment warnings
        capsuleOffsetFixup = capsuleHeaderSize;

        // Add tree item
        index = model->addItem(Types::Capsule, Subtypes::UefiCapsule, name, QString(), info, header, body, QByteArray(), true);
    }
    // Check buffer for being Toshiba capsule header
    else if (buffer.startsWith(TOSHIBA_CAPSULE_GUID)) {
        // Get info
        const TOSHIBA_CAPSULE_HEADER* capsuleHeader = (const TOSHIBA_CAPSULE_HEADER*)buffer.constData();

        // Check sanity of HeaderSize and FullSize values
        if (capsuleHeader->HeaderSize == 0 || capsuleHeader->HeaderSize > (UINT32)buffer.size() || capsuleHeader->HeaderSize > capsuleHeader->FullSize) {
            msg(QObject::tr("performFirstPass: Toshiba capsule header size of %1h (%2) bytes is invalid")
                .hexarg(capsuleHeader->HeaderSize).arg(capsuleHeader->HeaderSize));
            return ERR_INVALID_CAPSULE;
        }
        if (capsuleHeader->FullSize == 0 || capsuleHeader->FullSize > (UINT32)buffer.size()) {
            msg(QObject::tr("performFirstPass: Toshiba capsule full size of %1h (%2) bytes is invalid")
                .hexarg(capsuleHeader->FullSize).arg(capsuleHeader->FullSize));
            return ERR_INVALID_CAPSULE;
        }

        capsuleHeaderSize = capsuleHeader->HeaderSize;
        QByteArray header = buffer.left(capsuleHeaderSize);
        QByteArray body = buffer.right(buffer.size() - capsuleHeaderSize);
        QString name = QObject::tr("Toshiba capsule");
        QString info = QObject::tr("Capsule GUID: %1\nFull size: %2h (%3)\nHeader size: %4h (%5)\nImage size: %6h (%7)\nFlags: %8h")
            .arg(guidToQString(capsuleHeader->CapsuleGuid))
            .hexarg(buffer.size()).arg(buffer.size())
            .hexarg(capsuleHeaderSize).arg(capsuleHeaderSize)
            .hexarg(capsuleHeader->FullSize - capsuleHeaderSize).arg(capsuleHeader->FullSize - capsuleHeaderSize)
            .hexarg2(capsuleHeader->Flags, 8);

        // Set capsule offset fixup for correct volume allignment warnings
        capsuleOffsetFixup = capsuleHeaderSize;

        // Add tree item
        index = model->addItem(Types::Capsule, Subtypes::ToshibaCapsule, name, QString(), info, header, body, QByteArray(), true);
    }
    // Check buffer for being extended Aptio capsule header
    else if (buffer.startsWith(APTIO_SIGNED_CAPSULE_GUID) || buffer.startsWith(APTIO_UNSIGNED_CAPSULE_GUID)) {
        bool signedCapsule = buffer.startsWith(APTIO_SIGNED_CAPSULE_GUID);

        if ((UINT32)buffer.size() <= sizeof(APTIO_CAPSULE_HEADER)) {
            msg(QObject::tr("performFirstPass: AMI capsule image file is smaller than minimum size of %1h (%2) bytes").hexarg(sizeof(APTIO_CAPSULE_HEADER)).arg(sizeof(APTIO_CAPSULE_HEADER)));
            return ERR_INVALID_PARAMETER;
        }

        // Get info
        const APTIO_CAPSULE_HEADER* capsuleHeader = (const APTIO_CAPSULE_HEADER*)buffer.constData();

        // Check sanity of RomImageOffset and CapsuleImageSize values
        if (capsuleHeader->RomImageOffset == 0 || capsuleHeader->RomImageOffset > (UINT32)buffer.size() || capsuleHeader->RomImageOffset > capsuleHeader->CapsuleHeader.CapsuleImageSize) {
            msg(QObject::tr("performFirstPass: AMI capsule image offset of %1h (%2) bytes is invalid").hexarg(capsuleHeader->RomImageOffset).arg(capsuleHeader->RomImageOffset));
            return ERR_INVALID_CAPSULE;
        }
        if (capsuleHeader->CapsuleHeader.CapsuleImageSize == 0 || capsuleHeader->CapsuleHeader.CapsuleImageSize > (UINT32)buffer.size()) {
            msg(QObject::tr("performFirstPass: AMI capsule image size of %1h (%2) bytes is invalid").hexarg(capsuleHeader->CapsuleHeader.CapsuleImageSize).arg(capsuleHeader->CapsuleHeader.CapsuleImageSize));
            return ERR_INVALID_CAPSULE;
        }

        capsuleHeaderSize = capsuleHeader->RomImageOffset;
        QByteArray header = buffer.left(capsuleHeaderSize);
        QByteArray body = buffer.mid(capsuleHeaderSize);
        QString name = QObject::tr("AMI Aptio capsule");
        QString info = QObject::tr("Capsule GUID: %1\nFull size: %2h (%3)\nHeader size: %4h (%5)\nImage size: %6h (%7)\nFlags: %8h")
            .arg(guidToQString(capsuleHeader->CapsuleHeader.CapsuleGuid))
            .hexarg(buffer.size()).arg(buffer.size())
            .hexarg(capsuleHeaderSize).arg(capsuleHeaderSize)
            .hexarg(capsuleHeader->CapsuleHeader.CapsuleImageSize - capsuleHeaderSize).arg(capsuleHeader->CapsuleHeader.CapsuleImageSize - capsuleHeaderSize)
            .hexarg2(capsuleHeader->CapsuleHeader.Flags, 8);

        // Set capsule offset fixup for correct volume allignment warnings
        capsuleOffsetFixup = capsuleHeaderSize;

        // Add tree item
        index = model->addItem(Types::Capsule, signedCapsule ? Subtypes::AptioSignedCapsule : Subtypes::AptioUnsignedCapsule, name, QString(), info, header, body, QByteArray(), true);

        // Show message about possible Aptio signature break
        if (signedCapsule) {
            msg(QObject::tr("performFirstPass: Aptio capsule signature may become invalid after image modifications"), index);
        }
    }

    // Skip capsule header to have flash chip image
    QByteArray flashImage = buffer.mid(capsuleHeaderSize);

    // Check for Intel flash descriptor presence
    const FLASH_DESCRIPTOR_HEADER* descriptorHeader = (const FLASH_DESCRIPTOR_HEADER*)flashImage.constData();

    // Check descriptor signature
    STATUS result;
    if (descriptorHeader->Signature == FLASH_DESCRIPTOR_SIGNATURE) {
        // Parse as Intel image
        QModelIndex imageIndex;
        result = parseIntelImage(flashImage, capsuleHeaderSize, index, imageIndex);
        if (result != ERR_INVALID_FLASH_DESCRIPTOR) {
            if (!index.isValid())
                index = imageIndex;
            return result;
        }
    }

    // Get info
    QString name = QObject::tr("UEFI image");
    QString info = QObject::tr("Full size: %1h (%2)").hexarg(flashImage.size()).arg(flashImage.size());

    // Construct parsing data
    PARSING_DATA pdata = parsingDataFromQModelIndex(index);
    pdata.offset = capsuleHeaderSize;

    // Add tree item
    QModelIndex biosIndex = model->addItem(Types::Image, Subtypes::UefiImage, name, QString(), info, QByteArray(), flashImage, QByteArray(), true, parsingDataToQByteArray(pdata), index);

    // Parse the image
    result = parseRawArea(biosIndex);
    if (!index.isValid())
        index = biosIndex;
    return result;
}

STATUS FfsParser::parseIntelImage(const QByteArray & intelImage, const UINT32 parentOffset, const QModelIndex & parent, QModelIndex & index)
{
    // Sanity check
    if (intelImage.isEmpty())
        return EFI_INVALID_PARAMETER;

    // Get parent's parsing data
    PARSING_DATA pdata = parsingDataFromQModelIndex(parent);

    // Store the beginning of descriptor as descriptor base address
    const UINT8* descriptor = (const UINT8*)intelImage.constData();

    // Check for buffer size to be greater or equal to descriptor region size
    if (intelImage.size() < FLASH_DESCRIPTOR_SIZE) {
        msg(QObject::tr("parseIntelImage: input file is smaller than minimum descriptor size of %1h (%2) bytes").hexarg(FLASH_DESCRIPTOR_SIZE).arg(FLASH_DESCRIPTOR_SIZE));
        return ERR_INVALID_FLASH_DESCRIPTOR;
    }

    // Parse descriptor map
    const FLASH_DESCRIPTOR_MAP* descriptorMap = (const FLASH_DESCRIPTOR_MAP*)(descriptor + sizeof(FLASH_DESCRIPTOR_HEADER));
    const FLASH_DESCRIPTOR_UPPER_MAP* upperMap = (const FLASH_DESCRIPTOR_UPPER_MAP*)(descriptor + FLASH_DESCRIPTOR_UPPER_MAP_BASE);

    // Check sanity of base values
    if (descriptorMap->MasterBase > FLASH_DESCRIPTOR_MAX_BASE
        || descriptorMap->MasterBase == descriptorMap->RegionBase
        || descriptorMap->MasterBase == descriptorMap->ComponentBase) {
        msg(QObject::tr("parseIntelImage: invalid descriptor master base %1h").hexarg2(descriptorMap->MasterBase, 2));
        return ERR_INVALID_FLASH_DESCRIPTOR;
    }
    if (descriptorMap->RegionBase > FLASH_DESCRIPTOR_MAX_BASE
        || descriptorMap->RegionBase == descriptorMap->ComponentBase) {
        msg(QObject::tr("parseIntelImage: invalid descriptor region base %1h").hexarg2(descriptorMap->RegionBase, 2));
        return ERR_INVALID_FLASH_DESCRIPTOR;
    }
    if (descriptorMap->ComponentBase > FLASH_DESCRIPTOR_MAX_BASE) {
        msg(QObject::tr("parseIntelImage: invalid descriptor component base %1h").hexarg2(descriptorMap->ComponentBase, 2));
        return ERR_INVALID_FLASH_DESCRIPTOR;
    }

    const FLASH_DESCRIPTOR_REGION_SECTION* regionSection = (const FLASH_DESCRIPTOR_REGION_SECTION*)calculateAddress8(descriptor, descriptorMap->RegionBase);
    const FLASH_DESCRIPTOR_COMPONENT_SECTION* componentSection = (const FLASH_DESCRIPTOR_COMPONENT_SECTION*)calculateAddress8(descriptor, descriptorMap->ComponentBase);

    // Check descriptor version by getting hardcoded value of FlashParameters.ReadClockFrequency
    UINT8 descriptorVersion = 0;
    if (componentSection->FlashParameters.ReadClockFrequency == FLASH_FREQUENCY_20MHZ)      // Old descriptor
        descriptorVersion = 1;
    else if (componentSection->FlashParameters.ReadClockFrequency == FLASH_FREQUENCY_17MHZ) // Skylake+ descriptor
        descriptorVersion = 2;
    else {
        msg(QObject::tr("parseIntelImage: unknown descriptor version with ReadClockFrequency %1h").hexarg(componentSection->FlashParameters.ReadClockFrequency));
        return ERR_INVALID_FLASH_DESCRIPTOR;
    }

    // Regions
    std::vector<REGION_INFO> regions;

    // ME region
    REGION_INFO me;
    me.type = Subtypes::MeRegion;
    me.offset = 0;
    me.length = 0;
    if (regionSection->MeLimit) {
        me.offset = calculateRegionOffset(regionSection->MeBase);
        me.length = calculateRegionSize(regionSection->MeBase, regionSection->MeLimit);
        me.data = intelImage.mid(me.offset, me.length);
        regions.push_back(me);
    }

    // BIOS region
    REGION_INFO bios;
    bios.type = Subtypes::BiosRegion;
    bios.offset = 0;
    bios.length = 0;
    if (regionSection->BiosLimit) {
        bios.offset = calculateRegionOffset(regionSection->BiosBase);
        bios.length = calculateRegionSize(regionSection->BiosBase, regionSection->BiosLimit);

        // Check for Gigabyte specific descriptor map
        if (bios.length == (UINT32)intelImage.size()) {
            if (!me.offset) {
                msg(QObject::tr("parseIntelImage: can't determine BIOS region start from Gigabyte-specific descriptor"));
                return ERR_INVALID_FLASH_DESCRIPTOR;
            }
            // Use ME region end as BIOS region offset
            bios.offset = me.offset + me.length;
            bios.length = (UINT32)intelImage.size() - bios.offset;
            bios.data = intelImage.mid(bios.offset, bios.length);
        }
        // Normal descriptor map
        else {
            bios.data = intelImage.mid(bios.offset, bios.length);
        }

        regions.push_back(bios);
    }
    else {
        msg(QObject::tr("parseIntelImage: descriptor parsing failed, BIOS region not found in descriptor"));
        return ERR_INVALID_FLASH_DESCRIPTOR;
    }

    // GbE region
    REGION_INFO gbe;
    gbe.type = Subtypes::GbeRegion;
    gbe.offset = 0;
    gbe.length = 0;
    if (regionSection->GbeLimit) {
        gbe.offset = calculateRegionOffset(regionSection->GbeBase);
        gbe.length = calculateRegionSize(regionSection->GbeBase, regionSection->GbeLimit);
        gbe.data = intelImage.mid(gbe.offset, gbe.length);
        regions.push_back(gbe);
    }

    // PDR region
    REGION_INFO pdr;
    pdr.type = Subtypes::PdrRegion;
    pdr.offset = 0;
    pdr.length = 0;
    if (regionSection->PdrLimit) {
        pdr.offset = calculateRegionOffset(regionSection->PdrBase);
        pdr.length = calculateRegionSize(regionSection->PdrBase, regionSection->PdrLimit);
        pdr.data = intelImage.mid(pdr.offset, pdr.length);
        regions.push_back(pdr);
    }

    // Reserved1 region
    REGION_INFO reserved1;
    reserved1.type = Subtypes::Reserved1Region;
    reserved1.offset = 0;
    reserved1.length = 0;
    if (regionSection->Reserved1Limit && regionSection->Reserved1Base != 0xFFFF && regionSection->Reserved1Limit != 0xFFFF) {
        reserved1.offset = calculateRegionOffset(regionSection->Reserved1Base);
        reserved1.length = calculateRegionSize(regionSection->Reserved1Base, regionSection->Reserved1Limit);
        reserved1.data = intelImage.mid(reserved1.offset, reserved1.length);
        regions.push_back(reserved1);
    }

    // Reserved2 region
    REGION_INFO reserved2;
    reserved2.type = Subtypes::Reserved2Region;
    reserved2.offset = 0;
    reserved2.length = 0;
    if (regionSection->Reserved2Limit && regionSection->Reserved2Base != 0xFFFF && regionSection->Reserved2Limit != 0xFFFF) {
        reserved2.offset = calculateRegionOffset(regionSection->Reserved2Base);
        reserved2.length = calculateRegionSize(regionSection->Reserved2Base, regionSection->Reserved2Limit);
        reserved2.data = intelImage.mid(reserved2.offset, reserved2.length);
        regions.push_back(reserved2);
    }

    // Reserved3 region
    REGION_INFO reserved3;
    reserved3.type = Subtypes::Reserved3Region;
    reserved3.offset = 0;
    reserved3.length = 0;

    // EC region
    REGION_INFO ec;
    ec.type = Subtypes::EcRegion;
    ec.offset = 0;
    ec.length = 0;

    // Reserved4 region
    REGION_INFO reserved4;
    reserved3.type = Subtypes::Reserved4Region;
    reserved4.offset = 0;
    reserved4.length = 0;

    // Check for EC and reserved region 4 only for v2 descriptor
    if (descriptorVersion == 2) {
        if (regionSection->Reserved3Limit) {
            reserved3.offset = calculateRegionOffset(regionSection->Reserved3Base);
            reserved3.length = calculateRegionSize(regionSection->Reserved3Base, regionSection->Reserved3Limit);
            reserved3.data = intelImage.mid(reserved3.offset, reserved3.length);
            regions.push_back(reserved3);
        }

        if (regionSection->EcLimit) {
            ec.offset = calculateRegionOffset(regionSection->EcBase);
            ec.length = calculateRegionSize(regionSection->EcBase, regionSection->EcLimit);
            ec.data = intelImage.mid(ec.offset, ec.length);
            regions.push_back(ec);
        }
    
        if (regionSection->Reserved4Limit) {
            reserved4.offset = calculateRegionOffset(regionSection->Reserved4Base);
            reserved4.length = calculateRegionSize(regionSection->Reserved4Base, regionSection->Reserved4Limit);
            reserved4.data = intelImage.mid(reserved4.offset, reserved4.length);
            regions.push_back(reserved4);
        }
    }

    // Sort regions in ascending order
    std::sort(regions.begin(), regions.end());

    // Check for intersections and paddings between regions
    REGION_INFO region;
    // Check intersection with the descriptor
    if (regions.front().offset < FLASH_DESCRIPTOR_SIZE) {
        msg(QObject::tr("parseIntelImage: %1 region has intersection with flash descriptor").arg(itemSubtypeToQString(Types::Region, regions.front().type)), index);
        return ERR_INVALID_FLASH_DESCRIPTOR;
    }
    // Check for padding between descriptor and the first region 
    else if (regions.front().offset > FLASH_DESCRIPTOR_SIZE) {
        region.offset = FLASH_DESCRIPTOR_SIZE;
        region.length = regions.front().offset - FLASH_DESCRIPTOR_SIZE;
        region.data = intelImage.mid(region.offset, region.length);
        region.type = getPaddingType(region.data);
        regions.insert(regions.begin(), region);
    }
    // Check for intersections/paddings between regions
    for (size_t i = 1; i < regions.size(); i++) {
        UINT32 previousRegionEnd = regions[i-1].offset + regions[i-1].length;
        // Check that current region is fully present in the image
        if (regions[i].offset + regions[i].length > (UINT32)intelImage.size()) {
            msg(QObject::tr("parseIntelImage: %1 region is located outside of opened image, if your system uses dual-chip storage, please append another part to the opened image")
                .arg(itemSubtypeToQString(Types::Region, regions[i].type)), index);
            return ERR_TRUNCATED_IMAGE;
        }

        // Check for intersection with previous region
        if (regions[i].offset < previousRegionEnd) {
            msg(QObject::tr("parseIntelImage: %1 region has intersection with %2 region")
                .arg(itemSubtypeToQString(Types::Region, regions[i].type))
                .arg(itemSubtypeToQString(Types::Region, regions[i-1].type)), index);
            return ERR_INVALID_FLASH_DESCRIPTOR;
        }
        // Check for padding between current and previous regions
        else if (regions[i].offset > previousRegionEnd) {
            region.offset = previousRegionEnd;
            region.length = regions[i].offset - previousRegionEnd;
            region.data = intelImage.mid(region.offset, region.length);
            region.type = getPaddingType(region.data);
            std::vector<REGION_INFO>::iterator iter = regions.begin();
            std::advance(iter, i - 1);
            regions.insert(iter, region);
        }
    }
    // Check for padding after the last region
    if (regions.back().offset + regions.back().length < (UINT32)intelImage.size()) {
        region.offset = regions.back().offset + regions.back().length;
        region.length = intelImage.size() - region.offset;
        region.data = intelImage.mid(region.offset, region.length);
        region.type = getPaddingType(region.data);
        regions.push_back(region);
    }
    
    // Region map is consistent

    // Intel image
    QString name = QObject::tr("Intel image");
    QString info = QObject::tr("Full size: %1h (%2)\nFlash chips: %3\nRegions: %4\nMasters: %5\nPCH straps: %6\nPROC straps: %7")
        .hexarg(intelImage.size()).arg(intelImage.size())
        .arg(descriptorMap->NumberOfFlashChips + 1) //
        .arg(descriptorMap->NumberOfRegions + 1)    // Zero-based numbers in storage
        .arg(descriptorMap->NumberOfMasters + 1)    //
        .arg(descriptorMap->NumberOfPchStraps)
        .arg(descriptorMap->NumberOfProcStraps);

    // Construct parsing data
    pdata.offset = parentOffset;

    // Add Intel image tree item
    index = model->addItem(Types::Image, Subtypes::IntelImage, name, QString(), info, QByteArray(), intelImage, QByteArray(), true, parsingDataToQByteArray(pdata), parent);

    // Descriptor
    // Get descriptor info
    QByteArray body = intelImage.left(FLASH_DESCRIPTOR_SIZE);
    name = QObject::tr("Descriptor region");
    info = QObject::tr("Full size: %1h (%2)").hexarg(FLASH_DESCRIPTOR_SIZE).arg(FLASH_DESCRIPTOR_SIZE);
    
    // Add offsets of actual regions
    for (size_t i = 0; i < regions.size(); i++) {
        if (regions[i].type != Subtypes::ZeroPadding && regions[i].type != Subtypes::OnePadding && regions[i].type != Subtypes::DataPadding)
            info += QObject::tr("\n%1 region offset: %2h").arg(itemSubtypeToQString(Types::Region, regions[i].type)).hexarg(regions[i].offset + parentOffset);
    }

    // Region access settings
    if (descriptorVersion == 1) {
        const FLASH_DESCRIPTOR_MASTER_SECTION* masterSection = (const FLASH_DESCRIPTOR_MASTER_SECTION*)calculateAddress8(descriptor, descriptorMap->MasterBase);
        info += QObject::tr("\nRegion access settings:");
        info += QObject::tr("\nBIOS: %1h %2h ME: %3h %4h\nGbE:  %5h %6h")
            .hexarg2(masterSection->BiosRead, 2)
            .hexarg2(masterSection->BiosWrite, 2)
            .hexarg2(masterSection->MeRead, 2)
            .hexarg2(masterSection->MeWrite, 2)
            .hexarg2(masterSection->GbeRead, 2)
            .hexarg2(masterSection->GbeWrite, 2);

        // BIOS access table
        info += QObject::tr("\nBIOS access table:");
        info += QObject::tr("\n      Read  Write");
        info += QObject::tr("\nDesc  %1  %2")
            .arg(masterSection->BiosRead  & FLASH_DESCRIPTOR_REGION_ACCESS_DESC ? "Yes " : "No  ")
            .arg(masterSection->BiosWrite & FLASH_DESCRIPTOR_REGION_ACCESS_DESC ? "Yes " : "No  ");
        info += QObject::tr("\nBIOS  Yes   Yes");
        info += QObject::tr("\nME    %1  %2")
            .arg(masterSection->BiosRead  & FLASH_DESCRIPTOR_REGION_ACCESS_ME ? "Yes " : "No  ")
            .arg(masterSection->BiosWrite & FLASH_DESCRIPTOR_REGION_ACCESS_ME ? "Yes " : "No  ");
        info += QObject::tr("\nGbE   %1  %2")
            .arg(masterSection->BiosRead  & FLASH_DESCRIPTOR_REGION_ACCESS_GBE ? "Yes " : "No  ")
            .arg(masterSection->BiosWrite & FLASH_DESCRIPTOR_REGION_ACCESS_GBE ? "Yes " : "No  ");
        info += QObject::tr("\nPDR   %1  %2")
            .arg(masterSection->BiosRead  & FLASH_DESCRIPTOR_REGION_ACCESS_PDR ? "Yes " : "No  ")
            .arg(masterSection->BiosWrite & FLASH_DESCRIPTOR_REGION_ACCESS_PDR ? "Yes " : "No  ");
    }
    else if (descriptorVersion == 2) {
        const FLASH_DESCRIPTOR_MASTER_SECTION_V2* masterSection = (const FLASH_DESCRIPTOR_MASTER_SECTION_V2*)calculateAddress8(descriptor, descriptorMap->MasterBase);
        info += QObject::tr("\nRegion access settings:");
        info += QObject::tr("\nBIOS: %1h %2h ME: %3h %4h\nGbE:  %5h %6h EC: %7h %8h")
            .hexarg2(masterSection->BiosRead, 3)
            .hexarg2(masterSection->BiosWrite, 3)
            .hexarg2(masterSection->MeRead, 3)
            .hexarg2(masterSection->MeWrite, 3)
            .hexarg2(masterSection->GbeRead, 3)
            .hexarg2(masterSection->GbeWrite, 3)
            .hexarg2(masterSection->EcRead, 3)
            .hexarg2(masterSection->EcWrite, 3);

        // BIOS access table
        info += QObject::tr("\nBIOS access table:");
        info += QObject::tr("\n      Read  Write");
        info += QObject::tr("\nDesc  %1  %2")
            .arg(masterSection->BiosRead  & FLASH_DESCRIPTOR_REGION_ACCESS_DESC ? "Yes " : "No  ")
            .arg(masterSection->BiosWrite & FLASH_DESCRIPTOR_REGION_ACCESS_DESC ? "Yes " : "No  ");
        info += QObject::tr("\nBIOS  Yes   Yes");
        info += QObject::tr("\nME    %1  %2")
            .arg(masterSection->BiosRead  & FLASH_DESCRIPTOR_REGION_ACCESS_ME ? "Yes " : "No  ")
            .arg(masterSection->BiosWrite & FLASH_DESCRIPTOR_REGION_ACCESS_ME ? "Yes " : "No  ");
        info += QObject::tr("\nGbE   %1  %2")
            .arg(masterSection->BiosRead  & FLASH_DESCRIPTOR_REGION_ACCESS_GBE ? "Yes " : "No  ")
            .arg(masterSection->BiosWrite & FLASH_DESCRIPTOR_REGION_ACCESS_GBE ? "Yes " : "No  ");
        info += QObject::tr("\nPDR   %1  %2")
            .arg(masterSection->BiosRead  & FLASH_DESCRIPTOR_REGION_ACCESS_PDR ? "Yes " : "No  ")
            .arg(masterSection->BiosWrite & FLASH_DESCRIPTOR_REGION_ACCESS_PDR ? "Yes " : "No  ");
        info += QObject::tr("\nEC    %1  %2")
            .arg(masterSection->BiosRead  & FLASH_DESCRIPTOR_REGION_ACCESS_EC ? "Yes " : "No  ")
            .arg(masterSection->BiosWrite & FLASH_DESCRIPTOR_REGION_ACCESS_EC ? "Yes " : "No  ");
    }

    // VSCC table
    const VSCC_TABLE_ENTRY* vsccTableEntry = (const VSCC_TABLE_ENTRY*)(descriptor + ((UINT16)upperMap->VsccTableBase << 4));
    info += QObject::tr("\nFlash chips in VSCC table:");
    UINT8 vsscTableSize = upperMap->VsccTableSize * sizeof(UINT32) / sizeof(VSCC_TABLE_ENTRY);
    for (int i = 0; i < vsscTableSize; i++) {
        info += QObject::tr("\n%1%2%3h")
            .hexarg2(vsccTableEntry->VendorId, 2)
            .hexarg2(vsccTableEntry->DeviceId0, 2)
            .hexarg2(vsccTableEntry->DeviceId1, 2);
        vsccTableEntry++;
    }

    // Add descriptor tree item
    QModelIndex regionIndex = model->addItem(Types::Region, Subtypes::DescriptorRegion, name, QString(), info, QByteArray(), body, QByteArray(), true, parsingDataToQByteArray(pdata), index);
    
    // Parse regions
    UINT8 result = ERR_SUCCESS;
    UINT8 parseResult = ERR_SUCCESS;
    for (size_t i = 0; i < regions.size(); i++) {
        region = regions[i];
        switch (region.type) {
        case Subtypes::BiosRegion:
            result = parseBiosRegion(region.data, region.offset, index, regionIndex);
            break;
        case Subtypes::MeRegion:
            result = parseMeRegion(region.data, region.offset, index, regionIndex);
            break;
        case Subtypes::GbeRegion:
            result = parseGbeRegion(region.data, region.offset, index, regionIndex);
            break;
        case Subtypes::PdrRegion:
            result = parsePdrRegion(region.data, region.offset, index, regionIndex);
            break;
        case Subtypes::Reserved1Region:
        case Subtypes::Reserved2Region:
        case Subtypes::Reserved3Region:
        case Subtypes::EcRegion:
        case Subtypes::Reserved4Region:
            result = parseGeneralRegion(region.type, region.data, region.offset, index, regionIndex);
            break;
        case Subtypes::ZeroPadding:
        case Subtypes::OnePadding:
        case Subtypes::DataPadding: {
            // Add padding between regions
            QByteArray padding = intelImage.mid(region.offset, region.length);

            // Get parent's parsing data
            PARSING_DATA pdata = parsingDataFromQModelIndex(index);

            // Get info
            name = QObject::tr("Padding");
            info = QObject::tr("Full size: %1h (%2)")
                .hexarg(padding.size()).arg(padding.size());

            // Construct parsing data
            pdata.offset = parentOffset + region.offset;

            // Add tree item
            regionIndex = model->addItem(Types::Padding, getPaddingType(padding), name, QString(), info, QByteArray(), padding, QByteArray(), true, parsingDataToQByteArray(pdata), index);
            result = ERR_SUCCESS;
            } break;
        default:
            msg(QObject::tr("parseIntelImage: region of unknown type found"), index);
            result = ERR_INVALID_FLASH_DESCRIPTOR;
        }
        // Store the first failed result as a final result
        if (!parseResult && result)
            parseResult = result;
    }

    return parseResult;
}

STATUS FfsParser::parseGbeRegion(const QByteArray & gbe, const UINT32 parentOffset, const QModelIndex & parent, QModelIndex & index)
{
    // Check sanity
    if (gbe.isEmpty())
        return ERR_EMPTY_REGION;
    if ((UINT32)gbe.size() < GBE_VERSION_OFFSET + sizeof(GBE_VERSION))
        return ERR_INVALID_REGION;

    // Get parent's parsing data
    PARSING_DATA pdata = parsingDataFromQModelIndex(parent);

    // Get info
    QString name = QObject::tr("GbE region");
    const GBE_MAC_ADDRESS* mac = (const GBE_MAC_ADDRESS*)gbe.constData();
    const GBE_VERSION* version = (const GBE_VERSION*)(gbe.constData() + GBE_VERSION_OFFSET);
    QString info = QObject::tr("Full size: %1h (%2)\nMAC: %3:%4:%5:%6:%7:%8\nVersion: %9.%10")
        .hexarg(gbe.size()).arg(gbe.size())
        .hexarg2(mac->vendor[0], 2)
        .hexarg2(mac->vendor[1], 2)
        .hexarg2(mac->vendor[2], 2)
        .hexarg2(mac->device[0], 2)
        .hexarg2(mac->device[1], 2)
        .hexarg2(mac->device[2], 2)
        .arg(version->major)
        .arg(version->minor);

    // Construct parsing data
    pdata.offset += parentOffset;

    // Add tree item
    index = model->addItem(Types::Region, Subtypes::GbeRegion, name, QString(), info, QByteArray(), gbe, QByteArray(), true, parsingDataToQByteArray(pdata), parent);

    return ERR_SUCCESS;
}

STATUS FfsParser::parseMeRegion(const QByteArray & me, const UINT32 parentOffset, const QModelIndex & parent, QModelIndex & index)
{
    // Check sanity
    if (me.isEmpty())
        return ERR_EMPTY_REGION;

    // Get parent's parsing data
    PARSING_DATA pdata = parsingDataFromQModelIndex(parent);

    // Get info
    QString name = QObject::tr("ME region");
    QString info = QObject::tr("Full size: %1h (%2)").
        hexarg(me.size()).arg(me.size());

    // Parse region
    bool versionFound = true;
    bool emptyRegion = false;
    // Check for empty region
    if (me.count() == me.count('\xFF') || me.count() == me.count('\x00')) {
        // Further parsing not needed
        emptyRegion = true;
        info += QObject::tr("\nState: empty");
    }
    else {
        // Search for new signature
        INT32 versionOffset = me.indexOf(ME_VERSION_SIGNATURE2);
        if (versionOffset < 0){ // New signature not found
            // Search for old signature
            versionOffset = me.indexOf(ME_VERSION_SIGNATURE);
            if (versionOffset < 0){
                info += QObject::tr("\nVersion: unknown");
                versionFound = false;
            }
        }

        // Check sanity
        if ((UINT32)me.size() < (UINT32)versionOffset + sizeof(ME_VERSION))
            return ERR_INVALID_REGION;

        // Add version information
        if (versionFound) {
            const ME_VERSION* version = (const ME_VERSION*)(me.constData() + versionOffset);
            info += QObject::tr("\nVersion: %1.%2.%3.%4")
                .arg(version->major)
                .arg(version->minor)
                .arg(version->bugfix)
                .arg(version->build);
        }
    }

    // Construct parsing data
    pdata.offset += parentOffset;

    // Add tree item
    index = model->addItem(Types::Region, Subtypes::MeRegion, name, QString(), info, QByteArray(), me, QByteArray(), true, parsingDataToQByteArray(pdata), parent);

    // Show messages
    if (emptyRegion) {
        msg(QObject::tr("parseMeRegion: ME region is empty"), index);
    }
    else if (!versionFound) {
        msg(QObject::tr("parseMeRegion: ME version is unknown, it can be damaged"), index);
    }

    return ERR_SUCCESS;
}

STATUS FfsParser::parsePdrRegion(const QByteArray & pdr, const UINT32 parentOffset, const QModelIndex & parent, QModelIndex & index)
{
    // Check sanity
    if (pdr.isEmpty())
        return ERR_EMPTY_REGION;

    // Get parent's parsing data
    PARSING_DATA pdata = parsingDataFromQModelIndex(parent);

    // Get info
    QString name = QObject::tr("PDR region");
    QString info = QObject::tr("Full size: %1h (%2)").
        hexarg(pdr.size()).arg(pdr.size());

    // Construct parsing data
    pdata.offset += parentOffset;

    // Add tree item
    index = model->addItem(Types::Region, Subtypes::PdrRegion, name, QString(), info, QByteArray(), pdr, QByteArray(), true, parsingDataToQByteArray(pdata), parent);

    // Parse PDR region as BIOS space
    UINT8 result = parseRawArea(index);
    if (result && result != ERR_VOLUMES_NOT_FOUND && result != ERR_INVALID_VOLUME)
        return result;

    return ERR_SUCCESS;
}

STATUS FfsParser::parseGeneralRegion(const UINT8 subtype, const QByteArray & region, const UINT32 parentOffset, const QModelIndex & parent, QModelIndex & index)
{
    // Check sanity
    if (region.isEmpty())
        return ERR_EMPTY_REGION;

    // Get parent's parsing data
    PARSING_DATA pdata = parsingDataFromQModelIndex(parent);

    // Get info
    QString name = QObject::tr("%1 region").arg(itemSubtypeToQString(Types::Region, subtype));
    QString info = QObject::tr("Full size: %1h (%2)").
        hexarg(region.size()).arg(region.size());

    // Construct parsing data
    pdata.offset += parentOffset;

    // Add tree item
    index = model->addItem(Types::Region, subtype, name, QString(), info, QByteArray(), region, QByteArray(), true, parsingDataToQByteArray(pdata), parent);

    return ERR_SUCCESS;
}

STATUS FfsParser::parseBiosRegion(const QByteArray & bios, const UINT32 parentOffset, const QModelIndex & parent, QModelIndex & index)
{
    // Sanity check
    if (bios.isEmpty())
        return ERR_EMPTY_REGION;

    // Get parent's parsing data
    PARSING_DATA pdata = parsingDataFromQModelIndex(parent);

    // Get info
    QString name = QObject::tr("BIOS region");
    QString info = QObject::tr("Full size: %1h (%2)").
        hexarg(bios.size()).arg(bios.size());

    // Construct parsing data
    pdata.offset += parentOffset;

    // Add tree item
    index = model->addItem(Types::Region, Subtypes::BiosRegion, name, QString(), info, QByteArray(), bios, QByteArray(), true, parsingDataToQByteArray(pdata), parent);

    return parseRawArea(index);
}

UINT8 FfsParser::getPaddingType(const QByteArray & padding)
{
    if (padding.count('\x00') == padding.count())
        return Subtypes::ZeroPadding;
    if (padding.count('\xFF') == padding.count())
        return Subtypes::OnePadding;
    return Subtypes::DataPadding;
}

STATUS FfsParser::parseRawArea(const QModelIndex & index)
{
    // Sanity check
    if (!index.isValid())
        return ERR_INVALID_PARAMETER;

    // Get parsing data
    PARSING_DATA pdata = parsingDataFromQModelIndex(index);
    UINT32 headerSize = model->header(index).size();
    UINT32 offset = pdata.offset + headerSize;

    // Get item data
    QByteArray data = model->body(index);

    // Search for first volume
    STATUS result;
    UINT32 prevVolumeOffset;

    result = findNextVolume(index, data, offset, 0, prevVolumeOffset);
    if (result)
        return result;

    // First volume is not at the beginning of RAW area
    QString name;
    QString info;
    if (prevVolumeOffset > 0) {
        // Get info
        QByteArray padding = data.left(prevVolumeOffset);
        name = QObject::tr("Padding");
        info = QObject::tr("Full size: %1h (%2)")
            .hexarg(padding.size()).arg(padding.size());

        // Construct parsing data
        pdata.offset = offset;

        // Add tree item
        model->addItem(Types::Padding, getPaddingType(padding), name, QString(), info, QByteArray(), padding, QByteArray(), true, parsingDataToQByteArray(pdata), index);
    }

    // Search for and parse all volumes
    UINT32 volumeOffset = prevVolumeOffset;
    UINT32 prevVolumeSize = 0;

    while (!result)
    {
        // Padding between volumes
        if (volumeOffset > prevVolumeOffset + prevVolumeSize) {
            UINT32 paddingOffset = prevVolumeOffset + prevVolumeSize;
            UINT32 paddingSize = volumeOffset - paddingOffset;
            QByteArray padding = data.mid(paddingOffset, paddingSize);

            // Get info
            name = QObject::tr("Padding");
            info = QObject::tr("Full size: %1h (%2)")
                .hexarg(padding.size()).arg(padding.size());

            // Construct parsing data
            pdata.offset = offset + paddingOffset;

            // Add tree item
            model->addItem(Types::Padding, getPaddingType(padding), name, QString(), info, QByteArray(), padding, QByteArray(), true, parsingDataToQByteArray(pdata), index);
        }

        // Get volume size
        UINT32 volumeSize = 0;
        UINT32 bmVolumeSize = 0;
        result = getVolumeSize(data, volumeOffset, volumeSize, bmVolumeSize);
        if (result) {
            msg(QObject::tr("parseRawArea: getVolumeSize failed with error \"%1\"").arg(errorCodeToQString(result)), index);
            return result;
        }
        
        // Check that volume is fully present in input
        if (volumeSize > (UINT32)data.size() || volumeOffset + volumeSize > (UINT32)data.size()) {
            msg(QObject::tr("parseRawArea: one of volumes inside overlaps the end of data"), index);
            return ERR_INVALID_VOLUME;
        }
        
        QByteArray volume = data.mid(volumeOffset, volumeSize);
        if (volumeSize > (UINT32)volume.size()) {
            // Mark the rest as padding and finish the parsing
            QByteArray padding = data.right(volume.size());

            // Get info
            name = QObject::tr("Padding");
            info = QObject::tr("Full size: %1h (%2)")
                .hexarg(padding.size()).arg(padding.size());

            // Construct parsing data
            pdata.offset = offset + volumeOffset;

            // Add tree item
            QModelIndex paddingIndex = model->addItem(Types::Padding, getPaddingType(padding), name, QString(), info, QByteArray(), padding, QByteArray(), true, parsingDataToQByteArray(pdata), index);
            msg(QObject::tr("parseRawArea: one of volumes inside overlaps the end of data"), paddingIndex);

            // Update variables
            prevVolumeOffset = volumeOffset;
            prevVolumeSize = padding.size();
            break;
        }

        // Parse current volume's header
        QModelIndex volumeIndex;
        result = parseVolumeHeader(volume, headerSize + volumeOffset, index, volumeIndex);
        if (result)
            msg(QObject::tr("parseRawArea: volume header parsing failed with error \"%1\"").arg(errorCodeToQString(result)), index);
        else {
            // Show messages
            if (volumeSize != bmVolumeSize)
                msg(QObject::tr("parseRawArea: volume size stored in header %1h (%2) differs from calculated using block map %3h (%4)")
                .hexarg(volumeSize).arg(volumeSize)
                .hexarg(bmVolumeSize).arg(bmVolumeSize),
                volumeIndex);
        }

        // Go to next volume
        prevVolumeOffset = volumeOffset;
        prevVolumeSize = volumeSize;
        result = findNextVolume(index, data, offset, volumeOffset + prevVolumeSize, volumeOffset);
    }

    // Padding at the end of RAW area
    volumeOffset = prevVolumeOffset + prevVolumeSize;
    if ((UINT32)data.size() > volumeOffset) {
        QByteArray padding = data.mid(volumeOffset);

        // Get info
        name = QObject::tr("Padding");
        info = QObject::tr("Full size: %1h (%2)")
            .hexarg(padding.size()).arg(padding.size());

        // Construct parsing data
        pdata.offset = offset + headerSize + volumeOffset;

        // Add tree item
        model->addItem(Types::Padding, getPaddingType(padding), name, QString(), info, QByteArray(), padding, QByteArray(), true, parsingDataToQByteArray(pdata), index);
    }

    // Parse bodies
    for (int i = 0; i < model->rowCount(index); i++) {
        QModelIndex current = index.child(i, 0);
        switch (model->type(current)) {
        case Types::Volume:
            parseVolumeBody(current);
            break;
        case Types::Padding:
            // No parsing required
            break;
        default:
            return ERR_UNKNOWN_ITEM_TYPE;
        }
    }

    return ERR_SUCCESS;
}

STATUS FfsParser::parseVolumeHeader(const QByteArray & volume, const UINT32 parentOffset, const QModelIndex & parent, QModelIndex & index)
{
    // Sanity check
    if (volume.isEmpty())
        return ERR_INVALID_PARAMETER;

    // Get parent's parsing data
    PARSING_DATA pdata = parsingDataFromQModelIndex(parent);

    // Check that there is space for the volume header
        if ((UINT32)volume.size() < sizeof(EFI_FIRMWARE_VOLUME_HEADER)) {
        msg(QObject::tr("parseVolumeHeader: input volume size %1h (%2) is smaller than volume header size 40h (64)").hexarg(volume.size()).arg(volume.size()));
        return ERR_INVALID_VOLUME;
    }

    // Populate volume header
    const EFI_FIRMWARE_VOLUME_HEADER* volumeHeader = (const EFI_FIRMWARE_VOLUME_HEADER*)(volume.constData());

    // Check sanity of HeaderLength value
    if ((UINT32)ALIGN8(volumeHeader->HeaderLength) > (UINT32)volume.size()) {
        msg(QObject::tr("parseVolumeHeader: volume header overlaps the end of data"));
        return ERR_INVALID_VOLUME;
    }
    // Check sanity of ExtHeaderOffset value
    if (volumeHeader->Revision > 1 && volumeHeader->ExtHeaderOffset
        && (UINT32)ALIGN8(volumeHeader->ExtHeaderOffset + sizeof(EFI_FIRMWARE_VOLUME_EXT_HEADER)) > (UINT32)volume.size()) {
        msg(QObject::tr("parseVolumeHeader: extended volume header overlaps the end of data"));
        return ERR_INVALID_VOLUME;
    }

    // Calculate volume header size
    UINT32 headerSize;
    EFI_GUID extendedHeaderGuid = {{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }};
    bool hasExtendedHeader = false;
    if (volumeHeader->Revision > 1 && volumeHeader->ExtHeaderOffset) {
        hasExtendedHeader = true;
        const EFI_FIRMWARE_VOLUME_EXT_HEADER* extendedHeader = (const EFI_FIRMWARE_VOLUME_EXT_HEADER*)(volume.constData() + volumeHeader->ExtHeaderOffset);
        headerSize = volumeHeader->ExtHeaderOffset + extendedHeader->ExtHeaderSize;
        extendedHeaderGuid = extendedHeader->FvName;
    }
    else
        headerSize = volumeHeader->HeaderLength;

    // Extended header end can be unaligned
    headerSize = ALIGN8(headerSize);

    // Check for volume structure to be known
    bool isUnknown = true;
    bool isNvramVolume = false;
    UINT8 ffsVersion = 0;

    // Check for FFS v2 volume
    QByteArray guid = QByteArray((const char*)volumeHeader->FileSystemGuid.Data, sizeof(EFI_GUID));
    if (std::find(FFSv2Volumes.begin(), FFSv2Volumes.end(), guid) != FFSv2Volumes.end()) {
        isUnknown = false;
        ffsVersion = 2;
    }

    // Check for FFS v3 volume
    if (std::find(FFSv3Volumes.begin(), FFSv3Volumes.end(), guid) != FFSv3Volumes.end()) {
        isUnknown = false;
        ffsVersion = 3;
    }

    // Check for VSS NVRAM volume
    if (guid == NVRAM_MAIN_STORE_VOLUME_GUID || guid == NVRAM_ADDITIONAL_STORE_VOLUME_GUID) {
        isUnknown = false;
        isNvramVolume = true;
    }

    // Check volume revision and alignment
    bool msgAlignmentBitsSet = false;
    bool msgUnaligned = false;
    bool msgUnknownRevision = false;
    UINT32 alignment = 65536; // Default volume alignment is 64K
    if (volumeHeader->Revision == 1) {
        // Acquire alignment capability bit
        bool alignmentCap = volumeHeader->Attributes & EFI_FVB_ALIGNMENT_CAP;
        if (!alignmentCap) {
            if ((volumeHeader->Attributes & 0xFFFF0000))
                msgAlignmentBitsSet = true;
        }
        // Do not check for volume alignment on revision 1 volumes
        // No one gives a single crap about setting it correctly
        /*else {
            if (volumeHeader->Attributes & EFI_FVB_ALIGNMENT_2) alignment = 2;
            if (volumeHeader->Attributes & EFI_FVB_ALIGNMENT_4) alignment = 4;
            if (volumeHeader->Attributes & EFI_FVB_ALIGNMENT_8) alignment = 8;
            if (volumeHeader->Attributes & EFI_FVB_ALIGNMENT_16) alignment = 16;
            if (volumeHeader->Attributes & EFI_FVB_ALIGNMENT_32) alignment = 32;
            if (volumeHeader->Attributes & EFI_FVB_ALIGNMENT_64) alignment = 64;
            if (volumeHeader->Attributes & EFI_FVB_ALIGNMENT_128) alignment = 128;
            if (volumeHeader->Attributes & EFI_FVB_ALIGNMENT_256) alignment = 256;
            if (volumeHeader->Attributes & EFI_FVB_ALIGNMENT_512) alignment = 512;
            if (volumeHeader->Attributes & EFI_FVB_ALIGNMENT_1K) alignment = 1024;
            if (volumeHeader->Attributes & EFI_FVB_ALIGNMENT_2K) alignment = 2048;
            if (volumeHeader->Attributes & EFI_FVB_ALIGNMENT_4K) alignment = 4096;
            if (volumeHeader->Attributes & EFI_FVB_ALIGNMENT_8K) alignment = 8192;
            if (volumeHeader->Attributes & EFI_FVB_ALIGNMENT_16K) alignment = 16384;
            if (volumeHeader->Attributes & EFI_FVB_ALIGNMENT_32K) alignment = 32768;
            if (volumeHeader->Attributes & EFI_FVB_ALIGNMENT_64K) alignment = 65536;
        }*/
    }
    else if (volumeHeader->Revision == 2) {
        // Acquire alignment
        alignment = (UINT32)pow(2.0, (int)(volumeHeader->Attributes & EFI_FVB2_ALIGNMENT) >> 16);
        // Check alignment
        if (!isUnknown && !model->compressed(parent) && ((pdata.offset + parentOffset - capsuleOffsetFixup) % alignment))
            msgUnaligned = true;
    }
    else
        msgUnknownRevision = true;

    // Check attributes
    // Determine value of empty byte
    UINT8 emptyByte = volumeHeader->Attributes & EFI_FVB_ERASE_POLARITY ? '\xFF' : '\x00';

    // Check for AppleCRC32 and AppleFreeSpaceOffset in ZeroVector
    bool hasAppleCrc32 = false;
    bool hasAppleFSO = false;
    UINT32 volumeSize = volume.size();
    UINT32 appleCrc32 = *(UINT32*)(volume.constData() + 8);
    UINT32 appleFSO = *(UINT32*)(volume.constData() + 12);
    if (appleCrc32 != 0) {
        // Calculate CRC32 of the volume body
        UINT32 crc = crc32(0, (const UINT8*)(volume.constData() + volumeHeader->HeaderLength), volumeSize - volumeHeader->HeaderLength);
        if (crc == appleCrc32) {
            hasAppleCrc32 = true;
        }

        // Check if FreeSpaceOffset is non-zero
        if (appleFSO != 0) {
            hasAppleFSO = true;
        }
    }

    // Check header checksum by recalculating it
    bool msgInvalidChecksum = false;
    QByteArray tempHeader((const char*)volumeHeader, volumeHeader->HeaderLength);
    ((EFI_FIRMWARE_VOLUME_HEADER*)tempHeader.data())->Checksum = 0;
    UINT16 calculated = calculateChecksum16((const UINT16*)tempHeader.constData(), volumeHeader->HeaderLength);
    if (volumeHeader->Checksum != calculated)
        msgInvalidChecksum = true;

    // Get info
    QByteArray header = volume.left(headerSize);
    QByteArray body = volume.mid(headerSize);
    QString name = guidToQString(volumeHeader->FileSystemGuid);
    QString info = QObject::tr("Signature: _FVH\nZeroVector:\n%1 %2 %3 %4 %5 %6 %7 %8\n%9 %10 %11 %12 %13 %14 %15 %16\nFileSystem GUID: %17\nFull size: %18h (%19)\n"
        "Header size: %20h (%21)\nBody size: %22h (%23)\nRevision: %24\nAttributes: %25h\nErase polarity: %26\nChecksum: %27h, %28")
        .hexarg2(volumeHeader->ZeroVector[0], 2).hexarg2(volumeHeader->ZeroVector[1], 2).hexarg2(volumeHeader->ZeroVector[2], 2).hexarg2(volumeHeader->ZeroVector[3], 2)
        .hexarg2(volumeHeader->ZeroVector[4], 2).hexarg2(volumeHeader->ZeroVector[5], 2).hexarg2(volumeHeader->ZeroVector[6], 2).hexarg2(volumeHeader->ZeroVector[7], 2)
        .hexarg2(volumeHeader->ZeroVector[8], 2).hexarg2(volumeHeader->ZeroVector[9], 2).hexarg2(volumeHeader->ZeroVector[10], 2).hexarg2(volumeHeader->ZeroVector[11], 2)
        .hexarg2(volumeHeader->ZeroVector[12], 2).hexarg2(volumeHeader->ZeroVector[13], 2).hexarg2(volumeHeader->ZeroVector[14], 2).hexarg2(volumeHeader->ZeroVector[15], 2)
        .arg(guidToQString(volumeHeader->FileSystemGuid))
        .hexarg(volumeSize).arg(volumeSize)
        .hexarg(headerSize).arg(headerSize)
        .hexarg(volumeSize - headerSize).arg(volumeSize - headerSize)
        .arg(volumeHeader->Revision)
        .hexarg2(volumeHeader->Attributes, 8)
        .arg(emptyByte ? "1" : "0")
        .hexarg2(volumeHeader->Checksum, 4)
        .arg(msgInvalidChecksum ? QObject::tr("invalid, should be %1h").hexarg2(calculated, 4) : QObject::tr("valid"));

    // Extended header present
    if (volumeHeader->Revision > 1 && volumeHeader->ExtHeaderOffset) {
        const EFI_FIRMWARE_VOLUME_EXT_HEADER* extendedHeader = (const EFI_FIRMWARE_VOLUME_EXT_HEADER*)(volume.constData() + volumeHeader->ExtHeaderOffset);
        info += QObject::tr("\nExtended header size: %1h (%2)\nVolume GUID: %3")
            .hexarg(extendedHeader->ExtHeaderSize).arg(extendedHeader->ExtHeaderSize)
            .arg(guidToQString(extendedHeader->FvName));
    }

    // Construct parsing data
    pdata.offset += parentOffset;
    pdata.emptyByte = emptyByte;
    pdata.ffsVersion = ffsVersion;
    pdata.volume.hasExtendedHeader = hasExtendedHeader ? TRUE : FALSE;
    pdata.volume.extendedHeaderGuid = extendedHeaderGuid;
    pdata.volume.alignment = alignment;
    pdata.volume.revision = volumeHeader->Revision;
    pdata.volume.hasAppleCrc32 = hasAppleCrc32;
    pdata.volume.hasAppleFSO = hasAppleFSO;
    pdata.volume.isWeakAligned = (volumeHeader->Revision > 1 && (volumeHeader->Attributes & EFI_FVB2_WEAK_ALIGNMENT));

    // Add text
    QString text;
    if (hasAppleCrc32)
        text += QObject::tr("AppleCRC32 ");
    if (hasAppleFSO)
        text += QObject::tr("AppleFSO ");

    // Add tree item
    UINT8 subtype = Subtypes::UnknownVolume;
    if (!isUnknown) {
        if (ffsVersion == 2)
            subtype = Subtypes::Ffs2Volume;
        else if (ffsVersion == 3)
            subtype = Subtypes::Ffs3Volume;
        else if (isNvramVolume)
            subtype = Subtypes::NvramVolume;
    }
    index = model->addItem(Types::Volume, subtype, name, text, info, header, body, QByteArray(), true, parsingDataToQByteArray(pdata), parent);

    // Show messages
    if (isUnknown)
        msg(QObject::tr("parseVolumeHeader: unknown file system %1").arg(guidToQString(volumeHeader->FileSystemGuid)), index);
    if (msgInvalidChecksum)
        msg(QObject::tr("parseVolumeHeader: volume header checksum is invalid"), index);
    if (msgAlignmentBitsSet)
        msg(QObject::tr("parseVolumeHeader: alignment bits set on volume without alignment capability"), index);
    if (msgUnaligned)
        msg(QObject::tr("parseVolumeHeader: unaligned volume"), index);
    if (msgUnknownRevision)
        msg(QObject::tr("parseVolumeHeader: unknown volume revision %1").arg(volumeHeader->Revision), index);

    return ERR_SUCCESS;
}

STATUS FfsParser::findNextVolume(const QModelIndex & index, const QByteArray & bios, const UINT32 parentOffset, const UINT32 volumeOffset, UINT32 & nextVolumeOffset)
{
    int nextIndex = bios.indexOf(EFI_FV_SIGNATURE, volumeOffset);
    if (nextIndex < EFI_FV_SIGNATURE_OFFSET)
        return ERR_VOLUMES_NOT_FOUND;

    // Check volume header to be sane
    for (; nextIndex > 0; nextIndex = bios.indexOf(EFI_FV_SIGNATURE, nextIndex + 1)) {
        const EFI_FIRMWARE_VOLUME_HEADER* volumeHeader = (const EFI_FIRMWARE_VOLUME_HEADER*)(bios.constData() + nextIndex - EFI_FV_SIGNATURE_OFFSET);
        if (volumeHeader->FvLength < sizeof(EFI_FIRMWARE_VOLUME_HEADER) + 2 * sizeof(EFI_FV_BLOCK_MAP_ENTRY) || volumeHeader->FvLength >= 0xFFFFFFFFUL) {
            msg(QObject::tr("findNextVolume: volume candidate at offset %1h skipped, has invalid FvLength %2h").hexarg(parentOffset + (nextIndex - EFI_FV_SIGNATURE_OFFSET)).hexarg2(volumeHeader->FvLength, 16), index);
            continue;
        }
        if (volumeHeader->Reserved != 0xFF && volumeHeader->Reserved != 0x00) {
            msg(QObject::tr("findNextVolume: volume candidate at offset %1h skipped, has invalid Reserved byte value %2").hexarg(parentOffset + (nextIndex - EFI_FV_SIGNATURE_OFFSET)).hexarg2(volumeHeader->Reserved, 2), index);
            continue;
        }
        if (volumeHeader->Revision != 1 && volumeHeader->Revision != 2) {
            msg(QObject::tr("findNextVolume: volume candidate at offset %1h skipped, has invalid Revision byte value %2").hexarg(parentOffset + (nextIndex - EFI_FV_SIGNATURE_OFFSET)).hexarg2(volumeHeader->Revision, 2), index);
            continue;
        }
        // All checks passed, volume found
        break;
    }
    // No more volumes found
    if (nextIndex < EFI_FV_SIGNATURE_OFFSET)
        return ERR_VOLUMES_NOT_FOUND;

    nextVolumeOffset = nextIndex - EFI_FV_SIGNATURE_OFFSET;
    return ERR_SUCCESS;
}

STATUS FfsParser::getVolumeSize(const QByteArray & bios, UINT32 volumeOffset, UINT32 & volumeSize, UINT32 & bmVolumeSize)
{
    // Check that there is space for the volume header and at least two block map entries.
    if ((UINT32)bios.size() < volumeOffset + sizeof(EFI_FIRMWARE_VOLUME_HEADER) + 2 * sizeof(EFI_FV_BLOCK_MAP_ENTRY))
        return ERR_INVALID_VOLUME;

    // Populate volume header
    const EFI_FIRMWARE_VOLUME_HEADER* volumeHeader = (const EFI_FIRMWARE_VOLUME_HEADER*)(bios.constData() + volumeOffset);

    // Check volume signature
    if (QByteArray((const char*)&volumeHeader->Signature, sizeof(volumeHeader->Signature)) != EFI_FV_SIGNATURE)
        return ERR_INVALID_VOLUME;

    // Calculate volume size using BlockMap
    const EFI_FV_BLOCK_MAP_ENTRY* entry = (const EFI_FV_BLOCK_MAP_ENTRY*)(bios.constData() + volumeOffset + sizeof(EFI_FIRMWARE_VOLUME_HEADER));
    UINT32 calcVolumeSize = 0;
    while (entry->NumBlocks != 0 && entry->Length != 0) {
        if ((void*)entry > bios.constData() + bios.size())
            return ERR_INVALID_VOLUME;

        calcVolumeSize += entry->NumBlocks * entry->Length;
        entry += 1;
    }

    volumeSize = volumeHeader->FvLength;
    bmVolumeSize = calcVolumeSize;

    if (volumeSize == 0)
        return ERR_INVALID_VOLUME;

    return ERR_SUCCESS;
}

STATUS FfsParser::parseVolumeNonUefiData(const QByteArray & data, const UINT32 parentOffset, const QModelIndex & index)
{
    // Sanity check
    if (!index.isValid())
        return ERR_INVALID_PARAMETER;

    // Get parsing data
    PARSING_DATA pdata = parsingDataFromQModelIndex(index);

    // Modify it
    pdata.offset += parentOffset;

    // Search for VTF GUID backwards in received data
    QByteArray padding = data;
    QByteArray vtf;
    INT32 vtfIndex = data.lastIndexOf(EFI_FFS_VOLUME_TOP_FILE_GUID);
    if (vtfIndex >= 0) { // VTF candidate found inside non-UEFI data
        padding = data.left(vtfIndex);
        vtf = data.mid(vtfIndex);
        const EFI_FFS_FILE_HEADER* fileHeader = (const EFI_FFS_FILE_HEADER*)vtf.constData();
        if ((UINT32)vtf.size() < sizeof(EFI_FFS_FILE_HEADER) // VTF candidate is too small to be a real VTF in FFSv1/v2 volume
            || (pdata.ffsVersion == 3
                && (fileHeader->Attributes & FFS_ATTRIB_LARGE_FILE)
                && (UINT32)vtf.size() < sizeof(EFI_FFS_FILE_HEADER2))) { // VTF candidate is too small to be a real VTF in FFSv3 volume
            vtfIndex = -1;
            padding = data;
            vtf.clear();
        }
    }

    // Add non-UEFI data first
    // Get info
    QString info = QObject::tr("Full size: %1h (%2)").hexarg(padding.size()).arg(padding.size());

    // Add padding tree item
    QModelIndex paddingIndex = model->addItem(Types::Padding, Subtypes::DataPadding, QObject::tr("Non-UEFI data"), "", info, QByteArray(), padding, QByteArray(), true, parsingDataToQByteArray(pdata), index);
    msg(QObject::tr("parseVolumeNonUefiData: non-UEFI data found in volume's free space"), paddingIndex);

    if (vtfIndex >= 0) {
        // Get VTF file header
        QByteArray header = vtf.left(sizeof(EFI_FFS_FILE_HEADER));
        const EFI_FFS_FILE_HEADER* fileHeader = (const EFI_FFS_FILE_HEADER*)header.constData();
        if (pdata.ffsVersion == 3 && (fileHeader->Attributes & FFS_ATTRIB_LARGE_FILE)) {
            header = vtf.left(sizeof(EFI_FFS_FILE_HEADER2));
        }

        //Parse VTF file header
        QModelIndex fileIndex;
        STATUS result = parseFileHeader(vtf, parentOffset + vtfIndex, index, fileIndex);
        if (result) {
            msg(QObject::tr("parseVolumeNonUefiData: VTF file header parsing failed with error \"%1\"").arg(errorCodeToQString(result)), index);
            
            // Add the rest as non-UEFI data too
            pdata.offset += vtfIndex;
            // Get info
            QString info = QObject::tr("Full size: %1h (%2)").hexarg(vtf.size()).arg(vtf.size());

            // Add padding tree item
            QModelIndex paddingIndex = model->addItem(Types::Padding, Subtypes::DataPadding, QObject::tr("Non-UEFI data"), "", info, QByteArray(), vtf, QByteArray(), true, parsingDataToQByteArray(pdata), index);
            msg(QObject::tr("parseVolumeNonUefiData: non-UEFI data found in volume's free space"), paddingIndex);
        }
    }

    return ERR_SUCCESS;
}

STATUS FfsParser::parseVolumeBody(const QModelIndex & index)
{
    // Sanity check
    if (!index.isValid())
        return ERR_INVALID_PARAMETER;

    // Get volume header size and body
    QByteArray volumeBody = model->body(index);
    UINT32 volumeHeaderSize = model->header(index).size();

    // Get parsing data
    PARSING_DATA pdata = parsingDataFromQModelIndex(index);
    UINT32 offset = pdata.offset;

    // Parse VSS NVRAM volumes with a dedicated function
    if (model->subtype(index) == Subtypes::NvramVolume)
        return parseNvramVolumeBody(index);

    if (pdata.ffsVersion != 2 && pdata.ffsVersion != 3) // Don't parse unknown volumes
        return ERR_SUCCESS;

    // Search for and parse all files
    UINT32 volumeBodySize = volumeBody.size();
    UINT32 fileOffset = 0;
    
    while (fileOffset < volumeBodySize) {
        UINT32 fileSize = getFileSize(volumeBody, fileOffset, pdata.ffsVersion);
        // Check file size 
        if (fileSize < sizeof(EFI_FFS_FILE_HEADER) || fileSize > volumeBodySize - fileOffset) {
            // Check that we are at the empty space
            QByteArray header = volumeBody.mid(fileOffset, sizeof(EFI_FFS_FILE_HEADER));
            if (header.count(pdata.emptyByte) == header.size()) { //Empty space
                // Check free space to be actually free
                QByteArray freeSpace = volumeBody.mid(fileOffset);
                if (freeSpace.count(pdata.emptyByte) != freeSpace.count()) {
                    // Search for the first non-empty byte
                    UINT32 i;
                    UINT32 size = freeSpace.size();
                    const UINT8* current = (UINT8*)freeSpace.constData();
                    for (i = 0; i < size; i++) {
                        if (*current++ != pdata.emptyByte)
                            break;
                    }

                    // Align found index to file alignment
                    // It must be possible because minimum 16 bytes of empty were found before
                    if (i != ALIGN8(i))
                        i = ALIGN8(i) - 8;

                    // Construct parsing data
                    pdata.offset = offset + volumeHeaderSize + fileOffset;

                    // Add all bytes before as free space
                    if (i > 0) {
                        QByteArray free = freeSpace.left(i);

                        // Get info
                        QString info = QObject::tr("Full size: %1h (%2)").hexarg(free.size()).arg(free.size());

                        // Add free space item
                        model->addItem(Types::FreeSpace, 0, QObject::tr("Volume free space"), "", info, QByteArray(), free, QByteArray(), false, parsingDataToQByteArray(pdata), index);
                    }

                    // Parse non-UEFI data 
                    parseVolumeNonUefiData(freeSpace.mid(i), volumeHeaderSize + fileOffset + i, index);
                }
                else {
                    // Construct parsing data
                    pdata.offset = offset + volumeHeaderSize + fileOffset;

                    // Get info
                    QString info = QObject::tr("Full size: %1h (%2)").hexarg(freeSpace.size()).arg(freeSpace.size());

                    // Add free space item
                    model->addItem(Types::FreeSpace, 0, QObject::tr("Volume free space"), "", info, QByteArray(), freeSpace, QByteArray(), false, parsingDataToQByteArray(pdata), index);
                }
                break; // Exit from parsing loop
            }
            else { //File space
                // Parse non-UEFI data 
                parseVolumeNonUefiData(volumeBody.mid(fileOffset), volumeHeaderSize + fileOffset, index);
                break; // Exit from parsing loop
            }
        }

        // Get file header
        QByteArray file = volumeBody.mid(fileOffset, fileSize);
        QByteArray header = file.left(sizeof(EFI_FFS_FILE_HEADER));
        const EFI_FFS_FILE_HEADER* fileHeader = (const EFI_FFS_FILE_HEADER*)header.constData();
        if (pdata.ffsVersion == 3 && (fileHeader->Attributes & FFS_ATTRIB_LARGE_FILE)) {
            header = file.left(sizeof(EFI_FFS_FILE_HEADER2));
        }

        //Parse current file's header
        QModelIndex fileIndex;
        STATUS result = parseFileHeader(file, volumeHeaderSize + fileOffset, index, fileIndex);
        if (result)
            msg(QObject::tr("parseVolumeBody: file header parsing failed with error \"%1\"").arg(errorCodeToQString(result)), index);

        // Move to next file
        fileOffset += fileSize;
        fileOffset = ALIGN8(fileOffset);
    }

    // Check for duplicate GUIDs
    for (int i = 0; i < model->rowCount(index); i++) {
        QModelIndex current = index.child(i, 0);
        // Skip non-file entries and pad files
        if (model->type(current) != Types::File || model->subtype(current) == EFI_FV_FILETYPE_PAD)
            continue;
        
        // Get current file parsing data
        PARSING_DATA currentPdata = parsingDataFromQModelIndex(current);
        QByteArray currentGuid((const char*)&currentPdata.file.guid, sizeof(EFI_GUID));

        // Check files after current for having an equal GUID
        for (int j = i + 1; j < model->rowCount(index); j++) {
            QModelIndex another = index.child(j, 0);

            // Skip non-file entries
            if (model->type(another) != Types::File)
                continue;
            
            // Get another file parsing data
            PARSING_DATA anotherPdata = parsingDataFromQModelIndex(another);
            QByteArray anotherGuid((const char*)&anotherPdata.file.guid, sizeof(EFI_GUID));

            // Check GUIDs for being equal
            if (currentGuid == anotherGuid) {
                msg(QObject::tr("parseVolumeBody: file with duplicate GUID %1").arg(guidToQString(anotherPdata.file.guid)), another);
            }
        }
    }

    //Parse bodies
    for (int i = 0; i < model->rowCount(index); i++) {
        QModelIndex current = index.child(i, 0);
        switch (model->type(current)) {
        case Types::File:
            parseFileBody(current);
            break;
        case Types::Padding:
        case Types::FreeSpace:
            // No parsing required
            break;
        default:
            return ERR_UNKNOWN_ITEM_TYPE;
        }
    }

    return ERR_SUCCESS;
}

UINT32 FfsParser::getFileSize(const QByteArray & volume, const UINT32 fileOffset, const UINT8 ffsVersion)
{
    if (ffsVersion == 2) {
        if ((UINT32)volume.size() < fileOffset + sizeof(EFI_FFS_FILE_HEADER))
            return 0;
        const EFI_FFS_FILE_HEADER* fileHeader = (const EFI_FFS_FILE_HEADER*)(volume.constData() + fileOffset);
        return uint24ToUint32(fileHeader->Size);
    }
    else if (ffsVersion == 3) {
        if ((UINT32)volume.size() < fileOffset + sizeof(EFI_FFS_FILE_HEADER2))
            return 0;
        const EFI_FFS_FILE_HEADER2* fileHeader = (const EFI_FFS_FILE_HEADER2*)(volume.constData() + fileOffset);
        if (fileHeader->Attributes & FFS_ATTRIB_LARGE_FILE)
            return fileHeader->ExtendedSize;
        else
            return uint24ToUint32(fileHeader->Size);
    }
    else
        return 0;
}

STATUS FfsParser::parseFileHeader(const QByteArray & file, const UINT32 parentOffset, const QModelIndex & parent, QModelIndex & index)
{
    // Sanity check
    if (file.isEmpty())
        return ERR_INVALID_PARAMETER;

    if ((UINT32)file.size() < sizeof(EFI_FFS_FILE_HEADER))
        return ERR_INVALID_FILE;

    // Get parent's parsing data
    PARSING_DATA pdata = parsingDataFromQModelIndex(parent);

    // Get file header
    QByteArray header = file.left(sizeof(EFI_FFS_FILE_HEADER));
    const EFI_FFS_FILE_HEADER* fileHeader = (const EFI_FFS_FILE_HEADER*)header.constData();
    if (pdata.ffsVersion == 3 && (fileHeader->Attributes & FFS_ATTRIB_LARGE_FILE)) {
        if ((UINT32)file.size() < sizeof(EFI_FFS_FILE_HEADER2))
            return ERR_INVALID_FILE;
        header = file.left(sizeof(EFI_FFS_FILE_HEADER2));
    }

    // Check file alignment
    bool msgUnalignedFile = false;
    UINT8 alignmentPower = ffsAlignmentTable[(fileHeader->Attributes & FFS_ATTRIB_DATA_ALIGNMENT) >> 3];
    UINT32 alignment = (UINT32)pow(2.0, alignmentPower);
    if ((parentOffset + header.size()) % alignment)
        msgUnalignedFile = true;

    // Check file alignment agains volume alignment
    bool msgFileAlignmentIsGreaterThanVolumes = false;
    if (!pdata.volume.isWeakAligned && pdata.volume.alignment < alignment)
        msgFileAlignmentIsGreaterThanVolumes = true;

    // Check header checksum
    QByteArray tempHeader = header;
    EFI_FFS_FILE_HEADER* tempFileHeader = (EFI_FFS_FILE_HEADER*)(tempHeader.data());
    tempFileHeader->IntegrityCheck.Checksum.Header = 0;
    tempFileHeader->IntegrityCheck.Checksum.File = 0;
    UINT8 calculatedHeader = calculateChecksum8((const UINT8*)tempFileHeader, header.size() - 1);
    bool msgInvalidHeaderChecksum = false;
    if (fileHeader->IntegrityCheck.Checksum.Header != calculatedHeader)
        msgInvalidHeaderChecksum = true;

    // Check data checksum
    // Data checksum must be calculated
    bool msgInvalidDataChecksum = false;
    UINT8 calculatedData = 0;
    if (fileHeader->Attributes & FFS_ATTRIB_CHECKSUM) {
        UINT32 bufferSize = file.size() - header.size();
        // Exclude file tail from data checksum calculation
        if (pdata.volume.revision == 1 && (fileHeader->Attributes & FFS_ATTRIB_TAIL_PRESENT))
            bufferSize -= sizeof(UINT16);
        calculatedData = calculateChecksum8((const UINT8*)(file.constData() + header.size()), bufferSize);
        if (fileHeader->IntegrityCheck.Checksum.File != calculatedData)
            msgInvalidDataChecksum = true;
    }
    // Data checksum must be one of predefined values
    else if (pdata.volume.revision == 1 && fileHeader->IntegrityCheck.Checksum.File != FFS_FIXED_CHECKSUM) {
        calculatedData = FFS_FIXED_CHECKSUM;
        msgInvalidDataChecksum = true;
    }
    else if (pdata.volume.revision == 2 && fileHeader->IntegrityCheck.Checksum.File != FFS_FIXED_CHECKSUM2) {
        calculatedData = FFS_FIXED_CHECKSUM2;
        msgInvalidDataChecksum = true;
    }

    // Check file type
    bool msgUnknownType = false;
    if (fileHeader->Type > EFI_FV_FILETYPE_SMM_CORE && fileHeader->Type != EFI_FV_FILETYPE_PAD) {
        msgUnknownType = true;
    };

    // Get file body
    QByteArray body = file.mid(header.size());

    // Check for file tail presence
    QByteArray tail;
    bool msgInvalidTailValue = false;
    if (pdata.volume.revision == 1 && (fileHeader->Attributes & FFS_ATTRIB_TAIL_PRESENT))
    {
        //Check file tail;
        UINT16 tailValue = *(UINT16*)body.right(sizeof(UINT16)).constData();
        if (fileHeader->IntegrityCheck.TailReference != (UINT16)~tailValue)
            msgInvalidTailValue = true;

        // Get tail and remove it from file body
        tail = body.right(sizeof(UINT16));
        body = body.left(body.size() - sizeof(UINT16));
    }

    // Get info
    QString name;
    QString info;
    if (fileHeader->Type != EFI_FV_FILETYPE_PAD)
        name = guidToQString(fileHeader->Name);
    else
        name = QObject::tr("Pad-file");

    info = QObject::tr("File GUID: %1\nType: %2h\nAttributes: %3h\nFull size: %4h (%5)\nHeader size: %6h (%7)\nBody size: %8h (%9)\nTail size: %10h (%11)\n"
                       "State: %12h\nHeader checksum: %13h, %14\nData checksum: %15h, %16")
        .arg(guidToQString(fileHeader->Name))
        .hexarg2(fileHeader->Type, 2)
        .hexarg2(fileHeader->Attributes, 2)
        .hexarg(header.size() + body.size() + tail.size()).arg(header.size() + body.size() + tail.size())
        .hexarg(header.size()).arg(header.size())
        .hexarg(body.size()).arg(body.size())
        .hexarg(tail.size()).arg(tail.size())
        .hexarg2(fileHeader->State, 2)
        .hexarg2(fileHeader->IntegrityCheck.Checksum.Header, 2)
        .arg(msgInvalidHeaderChecksum ? QObject::tr("invalid, should be %1h").hexarg2(calculatedHeader, 2) : QObject::tr("valid"))
        .hexarg2(fileHeader->IntegrityCheck.Checksum.File, 2)
        .arg(msgInvalidDataChecksum ? QObject::tr("invalid, should be %1h").hexarg2(calculatedData, 2) : QObject::tr("valid"));

    // Add file GUID to parsing data
    pdata.file.guid = fileHeader->Name;

    QString text;
    bool isVtf = false;
    // Check if the file is a Volume Top File
    if (QByteArray((const char*)&fileHeader->Name, sizeof(EFI_GUID)) == EFI_FFS_VOLUME_TOP_FILE_GUID) {
        // Mark it as the last VTF
        // This information will later be used to determine memory addresses of uncompressed image elements
        // Because the last byte of the last VFT is mapped to 0xFFFFFFFF physical memory address 
        isVtf = true;
        text = QObject::tr("Volume Top File");
    }

    // Construct parsing data
    bool fixed = fileHeader->Attributes & FFS_ATTRIB_FIXED;
    pdata.offset += parentOffset;
    

    // Add tree item
    index = model->addItem(Types::File, fileHeader->Type, name, text, info, header, body, tail, fixed, parsingDataToQByteArray(pdata), parent);

    // Overwrite lastVtf, if needed
    if (isVtf) {
        lastVtf = index;
    }

    // Show messages
    if (msgUnalignedFile)
        msg(QObject::tr("parseFileHeader: unaligned file"), index);
    if (msgFileAlignmentIsGreaterThanVolumes)
        msg(QObject::tr("parseFileHeader: file alignment %1h is greater than parent volume alignment %2h").hexarg(alignment).hexarg(pdata.volume.alignment), index);
    if (msgInvalidHeaderChecksum)
        msg(QObject::tr("parseFileHeader: invalid header checksum"), index);
    if (msgInvalidDataChecksum)
        msg(QObject::tr("parseFileHeader: invalid data checksum"), index);
    if (msgInvalidTailValue)
        msg(QObject::tr("parseFileHeader: invalid tail value"), index);
    if (msgUnknownType)
        msg(QObject::tr("parseFileHeader: unknown file type %1h").hexarg2(fileHeader->Type, 2), index);

    return ERR_SUCCESS;
}

UINT32 FfsParser::getSectionSize(const QByteArray & file, const UINT32 sectionOffset, const UINT8 ffsVersion)
{
    if (ffsVersion == 2) {
        if ((UINT32)file.size() < sectionOffset + sizeof(EFI_COMMON_SECTION_HEADER))
            return 0;
        const EFI_COMMON_SECTION_HEADER* sectionHeader = (const EFI_COMMON_SECTION_HEADER*)(file.constData() + sectionOffset);
        return uint24ToUint32(sectionHeader->Size);
    }
    else if (ffsVersion == 3) {
        if ((UINT32)file.size() < sectionOffset + sizeof(EFI_COMMON_SECTION_HEADER2))
            return 0;
        const EFI_COMMON_SECTION_HEADER2* sectionHeader = (const EFI_COMMON_SECTION_HEADER2*)(file.constData() + sectionOffset);
        UINT32 size = uint24ToUint32(sectionHeader->Size);
        if (size == EFI_SECTION2_IS_USED)
            return sectionHeader->ExtendedSize;
        else
            return size;
    }
    else
        return 0;
}

STATUS FfsParser::parseFileBody(const QModelIndex & index)
{
    // Sanity check
    if (!index.isValid())
        return ERR_INVALID_PARAMETER;

    // Do not parse non-file bodies
    if (model->type(index) != Types::File)
        return ERR_SUCCESS;

    // Parse pad-file body
    if (model->subtype(index) == EFI_FV_FILETYPE_PAD)
        return parsePadFileBody(index);

    // Parse raw files as raw areas
    if (model->subtype(index) == EFI_FV_FILETYPE_RAW || model->subtype(index) == EFI_FV_FILETYPE_ALL) {
        // Get data from parsing data
        PARSING_DATA pdata = parsingDataFromQModelIndex(index);

        // Parse NVAR store
        if (QByteArray((const char*)&pdata.file.guid, sizeof(EFI_GUID)) == NVRAM_NVAR_STORE_FILE_GUID)
            return parseNvarStore(index);

        return parseRawArea(index);
    }

    // Parse sections
    return parseSections(model->body(index), index);
}

STATUS FfsParser::parsePadFileBody(const QModelIndex & index)
{
    // Sanity check
    if (!index.isValid())
        return ERR_INVALID_PARAMETER;

    // Get data from parsing data
    PARSING_DATA pdata = parsingDataFromQModelIndex(index);

    // Check if all bytes of the file are empty
    QByteArray body = model->body(index);
    if (body.size() == body.count(pdata.emptyByte))
        return ERR_SUCCESS;

    // Search for the first non-empty byte
    UINT32 i;
    UINT32 size = body.size();
    const UINT8* current = (const UINT8*)body.constData();
    for (i = 0; i < size; i++) {
        if (*current++ != pdata.emptyByte)
            break;
    }

    // Add all bytes before as free space...
    if (i >= 8) {
        // Align free space to 8 bytes boundary
        if (i != ALIGN8(i))
            i = ALIGN8(i) - 8;

        QByteArray free = body.left(i);

        // Get info
        QString info = QObject::tr("Full size: %1h (%2)").hexarg(free.size()).arg(free.size());

        // Constuct parsing data
        pdata.offset += model->header(index).size();

        // Add tree item
        model->addItem(Types::FreeSpace, 0, QObject::tr("Free space"), QString(), info, QByteArray(), free, QByteArray(), false, parsingDataToQByteArray(pdata), index);
    }
    else 
        i = 0;

    // ... and all bytes after as a padding
    QByteArray padding = body.mid(i);

    // Get info
    QString info = QObject::tr("Full size: %1h (%2)").hexarg(padding.size()).arg(padding.size());

    // Constuct parsing data
    pdata.offset += i;

    // Add tree item
    QModelIndex dataIndex = model->addItem(Types::Padding, Subtypes::DataPadding, QObject::tr("Non-UEFI data"), "", info, QByteArray(), padding, QByteArray(), true, parsingDataToQByteArray(pdata), index);

    // Show message
    msg(QObject::tr("parsePadFileBody: non-UEFI data found in pad-file"), dataIndex);

    // Rename the file
    model->setName(index, QObject::tr("Non-empty pad-file"));

    return ERR_SUCCESS;
}

STATUS FfsParser::parseSections(const QByteArray & sections, const QModelIndex & index, const bool preparse)
{
    // Sanity check
    if (!index.isValid())
        return ERR_INVALID_PARAMETER;

    // Get data from parsing data
    PARSING_DATA pdata = parsingDataFromQModelIndex(index);

    // Search for and parse all sections
    UINT32 bodySize = sections.size();
    UINT32 headerSize = model->header(index).size();
    UINT32 sectionOffset = 0;

    STATUS result = ERR_SUCCESS;
    while (sectionOffset < bodySize) {
        // Get section size
        UINT32 sectionSize = getSectionSize(sections, sectionOffset, pdata.ffsVersion);

        // Check section size
        if (sectionSize < sizeof(EFI_COMMON_SECTION_HEADER) || sectionSize > (bodySize - sectionOffset)) {
            // Add padding to fill the rest of sections
            QByteArray padding = sections.mid(sectionOffset);
            // Get info
            QString info = QObject::tr("Full size: %1h (%2)").hexarg(padding.size()).arg(padding.size());

            // Constuct parsing data
            pdata.offset += headerSize + sectionOffset;

            // Final parsing
            if (!preparse) {
                // Add tree item
                QModelIndex dataIndex = model->addItem(Types::Padding, Subtypes::DataPadding, QObject::tr("Non-UEFI data"), "", info, QByteArray(), padding, QByteArray(), true, parsingDataToQByteArray(pdata), index);

                // Show message
                msg(QObject::tr("parseSections: non-UEFI data found in sections area"), dataIndex);
            }
            // Preparsing
            else {
                return ERR_INVALID_SECTION;
            }
            break; // Exit from parsing loop
        }

        // Parse section header
        QModelIndex sectionIndex;
        result = parseSectionHeader(sections.mid(sectionOffset, sectionSize), headerSize + sectionOffset, index, sectionIndex, preparse);
        if (result) {
            if (!preparse)
                msg(QObject::tr("parseSections: section header parsing failed with error \"%1\"").arg(errorCodeToQString(result)), index);
            else
                return ERR_INVALID_SECTION;
        }
        // Move to next section
        sectionOffset += sectionSize;
        sectionOffset = ALIGN4(sectionOffset);
    }

    //Parse bodies, will be skipped on preparse phase
    for (int i = 0; i < model->rowCount(index); i++) {
        QModelIndex current = index.child(i, 0);
        switch (model->type(current)) {
        case Types::Section:
            parseSectionBody(current);
            break;
        case Types::Padding:
            // No parsing required
            break;
        default:
            return ERR_UNKNOWN_ITEM_TYPE;
        }
    }
    
    return ERR_SUCCESS;
}

STATUS FfsParser::parseSectionHeader(const QByteArray & section, const UINT32 parentOffset, const QModelIndex & parent, QModelIndex & index, const bool preparse)
{
    // Check sanity
    if ((UINT32)section.size() < sizeof(EFI_COMMON_SECTION_HEADER))
        return ERR_INVALID_SECTION;

    const EFI_COMMON_SECTION_HEADER* sectionHeader = (const EFI_COMMON_SECTION_HEADER*)(section.constData());
    switch (sectionHeader->Type) {
    // Special
    case EFI_SECTION_COMPRESSION:           return parseCompressedSectionHeader(section, parentOffset, parent, index, preparse);
    case EFI_SECTION_GUID_DEFINED:          return parseGuidedSectionHeader(section, parentOffset, parent, index, preparse);
    case EFI_SECTION_FREEFORM_SUBTYPE_GUID: return parseFreeformGuidedSectionHeader(section, parentOffset, parent, index, preparse);
    case EFI_SECTION_VERSION:               return parseVersionSectionHeader(section, parentOffset, parent, index, preparse);
    case PHOENIX_SECTION_POSTCODE:
    case INSYDE_SECTION_POSTCODE:           return parsePostcodeSectionHeader(section, parentOffset, parent, index, preparse);
    // Common
    case EFI_SECTION_DISPOSABLE:
    case EFI_SECTION_DXE_DEPEX:
    case EFI_SECTION_PEI_DEPEX:
    case EFI_SECTION_SMM_DEPEX:
    case EFI_SECTION_PE32:
    case EFI_SECTION_PIC:
    case EFI_SECTION_TE:
    case EFI_SECTION_COMPATIBILITY16:
    case EFI_SECTION_USER_INTERFACE:
    case EFI_SECTION_FIRMWARE_VOLUME_IMAGE:
    case EFI_SECTION_RAW:                   return parseCommonSectionHeader(section, parentOffset, parent, index, preparse);
    // Unknown
    default: 
        STATUS result = parseCommonSectionHeader(section, parentOffset, parent, index, preparse);
        msg(QObject::tr("parseSectionHeader: section with unknown type %1h").hexarg2(sectionHeader->Type, 2), index);
        return result;
    }
}

STATUS FfsParser::parseCommonSectionHeader(const QByteArray & section, const UINT32 parentOffset, const QModelIndex & parent, QModelIndex & index, const bool preparse)
{
    // Check sanity
    if ((UINT32)section.size() < sizeof(EFI_COMMON_SECTION_HEADER))
        return ERR_INVALID_SECTION;

    // Get data from parent's parsing data
    PARSING_DATA pdata = parsingDataFromQModelIndex(parent);

    // Obtain header fields
    const EFI_COMMON_SECTION_HEADER* sectionHeader = (const EFI_COMMON_SECTION_HEADER*)(section.constData());
    UINT32 headerSize = sizeof(EFI_COMMON_SECTION_HEADER);
    if (pdata.ffsVersion == 3 && uint24ToUint32(sectionHeader->Size) == EFI_SECTION2_IS_USED)
        headerSize = sizeof(EFI_COMMON_SECTION_HEADER2);

    QByteArray header = section.left(headerSize);
    QByteArray body = section.mid(headerSize);

    // Get info
    QString name = sectionTypeToQString(sectionHeader->Type) + QObject::tr(" section");
    QString info = QObject::tr("Type: %1h\nFull size: %2h (%3)\nHeader size: %4h (%5)\nBody size: %6h (%7)")
        .hexarg2(sectionHeader->Type, 2)
        .hexarg(section.size()).arg(section.size())
        .hexarg(headerSize).arg(headerSize)
        .hexarg(body.size()).arg(body.size());

    // Construct parsing data
    pdata.offset += parentOffset;

    // Add tree item
    if (!preparse) {
        index = model->addItem(Types::Section, sectionHeader->Type, name, QString(), info, header, body, QByteArray(), true, parsingDataToQByteArray(pdata), parent);
    } 
    return ERR_SUCCESS;
}

STATUS FfsParser::parseCompressedSectionHeader(const QByteArray & section, const UINT32 parentOffset, const QModelIndex & parent, QModelIndex & index, const bool preparse)
{
    // Check sanity
    if ((UINT32)section.size() < sizeof(EFI_COMPRESSION_SECTION))
        return ERR_INVALID_SECTION;

    // Get data from parent's parsing data
    PARSING_DATA pdata = parsingDataFromQModelIndex(parent);

    // Obtain header fields
    const EFI_COMMON_SECTION_HEADER* sectionHeader = (const EFI_COMMON_SECTION_HEADER*)(section.constData());
    const EFI_COMPRESSION_SECTION* compressedSectionHeader = (const EFI_COMPRESSION_SECTION*)sectionHeader;
    UINT32 headerSize = sizeof(EFI_COMPRESSION_SECTION);
    UINT8 compressionType = compressedSectionHeader->CompressionType;
    UINT32 uncompressedLength = compressedSectionHeader->UncompressedLength;
    if (pdata.ffsVersion == 3 && uint24ToUint32(sectionHeader->Size) == EFI_SECTION2_IS_USED) {
        if ((UINT32)section.size() < sizeof(EFI_COMPRESSION_SECTION2))
            return ERR_INVALID_SECTION;
        const EFI_COMPRESSION_SECTION2* compressedSectionHeader2 = (const EFI_COMPRESSION_SECTION2*)sectionHeader;
        headerSize = sizeof(EFI_COMPRESSION_SECTION2);
        compressionType = compressedSectionHeader2->CompressionType;
        uncompressedLength = compressedSectionHeader->UncompressedLength;
    }

    QByteArray header = section.left(headerSize);
    QByteArray body = section.mid(headerSize);

    // Get info
    QString name = sectionTypeToQString(sectionHeader->Type) + QObject::tr(" section");
    QString info = QObject::tr("Type: %1h\nFull size: %2h (%3)\nHeader size: %4h (%5)\nBody size: %6h (%7)\nCompression type: %8h\nDecompressed size: %9h (%10)")
        .hexarg2(sectionHeader->Type, 2)
        .hexarg(section.size()).arg(section.size())
        .hexarg(headerSize).arg(headerSize)
        .hexarg(body.size()).arg(body.size())
        .hexarg2(compressionType, 2)
        .hexarg(uncompressedLength).arg(uncompressedLength);

    // Construct parsing data
    pdata.offset += parentOffset;
    pdata.section.compressed.compressionType = compressionType;
    pdata.section.compressed.uncompressedSize = uncompressedLength;

    // Add tree item
    if (!preparse) {
        index = model->addItem(Types::Section, sectionHeader->Type, name, QString(), info, header, body, QByteArray(), true, parsingDataToQByteArray(pdata), parent);
    }
    return ERR_SUCCESS;
}

STATUS FfsParser::parseGuidedSectionHeader(const QByteArray & section, const UINT32 parentOffset, const QModelIndex & parent, QModelIndex & index, const bool preparse)
{
    // Check sanity
    if ((UINT32)section.size() < sizeof(EFI_GUID_DEFINED_SECTION))
        return ERR_INVALID_SECTION;

    // Get data from parent's parsing data
    PARSING_DATA pdata = parsingDataFromQModelIndex(parent);

    // Obtain header fields
    const EFI_COMMON_SECTION_HEADER* sectionHeader = (const EFI_COMMON_SECTION_HEADER*)(section.constData());
    const EFI_GUID_DEFINED_SECTION* guidDefinedSectionHeader = (const EFI_GUID_DEFINED_SECTION*)sectionHeader;
    EFI_GUID guid = guidDefinedSectionHeader->SectionDefinitionGuid;
    UINT16 dataOffset = guidDefinedSectionHeader->DataOffset;
    UINT16 attributes = guidDefinedSectionHeader->Attributes;
    UINT32 nextHeaderOffset = sizeof(EFI_GUID_DEFINED_SECTION);
    if (pdata.ffsVersion == 3 && uint24ToUint32(sectionHeader->Size) == EFI_SECTION2_IS_USED) {
        if ((UINT32)section.size() < sizeof(EFI_GUID_DEFINED_SECTION2))
            return ERR_INVALID_SECTION;
        const EFI_GUID_DEFINED_SECTION2* guidDefinedSectionHeader2 = (const EFI_GUID_DEFINED_SECTION2*)sectionHeader;
        guid = guidDefinedSectionHeader2->SectionDefinitionGuid;
        dataOffset = guidDefinedSectionHeader2->DataOffset;
        attributes = guidDefinedSectionHeader2->Attributes;
        nextHeaderOffset = sizeof(EFI_GUID_DEFINED_SECTION2);
    }

    // Check for special GUIDed sections
    QByteArray additionalInfo;
    QByteArray baGuid((const char*)&guid, sizeof(EFI_GUID));
    bool msgSignedSectionFound = false;
    bool msgNoAuthStatusAttribute = false;
    bool msgNoProcessingRequiredAttributeCompressed = false;
    bool msgNoProcessingRequiredAttributeSigned = false;
    bool msgInvalidCrc = false;
    bool msgUnknownCertType = false;
    bool msgUnknownCertSubtype = false;
    if (baGuid == EFI_GUIDED_SECTION_CRC32) {
        if ((attributes & EFI_GUIDED_SECTION_AUTH_STATUS_VALID) == 0) { // Check that AuthStatusValid attribute is set on compressed GUIDed sections
            msgNoAuthStatusAttribute = true;
        }

        if ((UINT32)section.size() < nextHeaderOffset + sizeof(UINT32))
            return ERR_INVALID_SECTION;

        UINT32 crc = *(UINT32*)(section.constData() + nextHeaderOffset);
        additionalInfo += QObject::tr("\nChecksum type: CRC32");
        // Calculate CRC32 of section data
        UINT32 calculated = crc32(0, (const UINT8*)section.constData() + dataOffset, section.size() - dataOffset);
        if (crc == calculated) {
            additionalInfo += QObject::tr("\nChecksum: %1h, valid").hexarg2(crc, 8);
        }
        else {
            additionalInfo += QObject::tr("\nChecksum: %1h, invalid, should be %2h").hexarg2(crc, 8).hexarg2(calculated, 8);
            msgInvalidCrc = true;
        }
        // No need to change dataOffset here
    }
    else if (baGuid == EFI_GUIDED_SECTION_LZMA || baGuid == EFI_GUIDED_SECTION_TIANO) {
        if ((attributes & EFI_GUIDED_SECTION_PROCESSING_REQUIRED) == 0) { // Check that ProcessingRequired attribute is set on compressed GUIDed sections
            msgNoProcessingRequiredAttributeCompressed = true;
        }
        // No need to change dataOffset here
    }
    else if (baGuid == EFI_FIRMWARE_CONTENTS_SIGNED_GUID) {
        if ((attributes & EFI_GUIDED_SECTION_PROCESSING_REQUIRED) == 0) { // Check that ProcessingRequired attribute is set on signed GUIDed sections
            msgNoProcessingRequiredAttributeSigned = true;
        }

        // Get certificate type and length
        if ((UINT32)section.size() < nextHeaderOffset + sizeof(WIN_CERTIFICATE))
            return ERR_INVALID_SECTION;

        const WIN_CERTIFICATE* winCertificate = (const WIN_CERTIFICATE*)(section.constData() + nextHeaderOffset);
        UINT32 certLength = winCertificate->Length;
        UINT16 certType = winCertificate->CertificateType;

        // Adjust dataOffset
        dataOffset += certLength;

        // Check section size once again
        if ((UINT32)section.size() < dataOffset)
            return ERR_INVALID_SECTION;

        // Check certificate type
        if (certType == WIN_CERT_TYPE_EFI_GUID) {
            additionalInfo += QObject::tr("\nCertificate type: UEFI");

            // Get certificate GUID
            const WIN_CERTIFICATE_UEFI_GUID* winCertificateUefiGuid = (const WIN_CERTIFICATE_UEFI_GUID*)(section.constData() + nextHeaderOffset);
            QByteArray certTypeGuid((const char*)&winCertificateUefiGuid->CertType, sizeof(EFI_GUID));

            if (certTypeGuid == EFI_CERT_TYPE_RSA2048_SHA256_GUID) {
                additionalInfo += QObject::tr("\nCertificate subtype: RSA2048/SHA256");
            }
            else {
                additionalInfo += QObject::tr("\nCertificate subtype: unknown, GUID %1").arg(guidToQString(winCertificateUefiGuid->CertType));
                msgUnknownCertSubtype = true;
            }
        }
        else {
            additionalInfo += QObject::tr("\nCertificate type: unknown (%1h)").hexarg2(certType, 4);
            msgUnknownCertType = true;
        }
        msgSignedSectionFound = true;
    }

    QByteArray header = section.left(dataOffset);
    QByteArray body = section.mid(dataOffset);

    // Get info
    QString name = guidToQString(guid);
    QString info = QObject::tr("Section GUID: %1\nType: %2h\nFull size: %3h (%4)\nHeader size: %5h (%6)\nBody size: %7h (%8)\nData offset: %9h\nAttributes: %10h")
        .arg(name)
        .hexarg2(sectionHeader->Type, 2)
        .hexarg(section.size()).arg(section.size())
        .hexarg(header.size()).arg(header.size())
        .hexarg(body.size()).arg(body.size())
        .hexarg(dataOffset)
        .hexarg2(attributes, 4);

    // Append additional info
    info.append(additionalInfo);

    // Construct parsing data
    pdata.offset += parentOffset;
    pdata.section.guidDefined.guid = guid;

    // Add tree item
    if (!preparse) {
        index = model->addItem(Types::Section, sectionHeader->Type, name, QString(), info, header, body, QByteArray(), false, parsingDataToQByteArray(pdata), parent);

        // Show messages
        if (msgSignedSectionFound)
            msg(QObject::tr("parseGuidedSectionHeader: section signature may become invalid after any modification"), index);
        if (msgNoAuthStatusAttribute)
            msg(QObject::tr("parseGuidedSectionHeader: CRC32 GUIDed section without AuthStatusValid attribute"), index);
        if (msgNoProcessingRequiredAttributeCompressed)
            msg(QObject::tr("parseGuidedSectionHeader: compressed GUIDed section without ProcessingRequired attribute"), index);
        if (msgNoProcessingRequiredAttributeSigned)
            msg(QObject::tr("parseGuidedSectionHeader: signed GUIDed section without ProcessingRequired attribute"), index);
        if (msgInvalidCrc)
            msg(QObject::tr("parseGuidedSectionHeader: GUID defined section with invalid CRC32"), index);
        if (msgUnknownCertType)
            msg(QObject::tr("parseGuidedSectionHeader: signed GUIDed section with unknown type"), index);
        if (msgUnknownCertSubtype)
            msg(QObject::tr("parseGuidedSectionHeader: signed GUIDed section with unknown subtype"), index);
    }

    return ERR_SUCCESS;
}

STATUS FfsParser::parseFreeformGuidedSectionHeader(const QByteArray & section, const UINT32 parentOffset, const QModelIndex & parent, QModelIndex & index, const bool preparse)
{
    // Check sanity
    if ((UINT32)section.size() < sizeof(EFI_FREEFORM_SUBTYPE_GUID_SECTION))
        return ERR_INVALID_SECTION;

    // Get data from parent's parsing data
    PARSING_DATA pdata = parsingDataFromQModelIndex(parent);

    // Obtain header fields
    const EFI_COMMON_SECTION_HEADER* sectionHeader = (const EFI_COMMON_SECTION_HEADER*)(section.constData());
    const EFI_FREEFORM_SUBTYPE_GUID_SECTION* fsgHeader = (const EFI_FREEFORM_SUBTYPE_GUID_SECTION*)sectionHeader;
    UINT32 headerSize = sizeof(EFI_FREEFORM_SUBTYPE_GUID_SECTION);
    EFI_GUID guid = fsgHeader->SubTypeGuid;
    if (pdata.ffsVersion == 3 && uint24ToUint32(sectionHeader->Size) == EFI_SECTION2_IS_USED) {
        if ((UINT32)section.size() < sizeof(EFI_FREEFORM_SUBTYPE_GUID_SECTION2))
            return ERR_INVALID_SECTION;
        const EFI_FREEFORM_SUBTYPE_GUID_SECTION2* fsgHeader2 = (const EFI_FREEFORM_SUBTYPE_GUID_SECTION2*)sectionHeader;
        headerSize = sizeof(EFI_FREEFORM_SUBTYPE_GUID_SECTION2);
        guid = fsgHeader2->SubTypeGuid;
    }

    QByteArray header = section.left(headerSize);
    QByteArray body = section.mid(headerSize);

    // Get info
    QString name = sectionTypeToQString(sectionHeader->Type) + QObject::tr(" section");
    QString info = QObject::tr("Type: %1h\nFull size: %2h (%3)\nHeader size: %4h (%5)\nBody size: %6h (%7)\nSubtype GUID: %8")
        .hexarg2(fsgHeader->Type, 2)
        .hexarg(section.size()).arg(section.size())
        .hexarg(header.size()).arg(header.size())
        .hexarg(body.size()).arg(body.size())
        .arg(guidToQString(guid));

    // Construct parsing data
    pdata.offset += parentOffset;
    pdata.section.freeformSubtypeGuid.guid = guid;

    // Add tree item
    if (!preparse) {
        index = model->addItem(Types::Section, sectionHeader->Type, name, QString(), info, header, body, QByteArray(), false, parsingDataToQByteArray(pdata), parent);

        // Rename section
        model->setName(index, guidToQString(guid));
    }
    return ERR_SUCCESS;
}

STATUS FfsParser::parseVersionSectionHeader(const QByteArray & section, const UINT32 parentOffset, const QModelIndex & parent, QModelIndex & index, const bool preparse)
{
    // Check sanity
    if ((UINT32)section.size() < sizeof(EFI_VERSION_SECTION))
        return ERR_INVALID_SECTION;

    // Get data from parent's parsing data
    PARSING_DATA pdata = parsingDataFromQModelIndex(parent);

    // Obtain header fields
    const EFI_COMMON_SECTION_HEADER* sectionHeader = (const EFI_COMMON_SECTION_HEADER*)(section.constData());
    const EFI_VERSION_SECTION* versionHeader = (const EFI_VERSION_SECTION*)sectionHeader;
    UINT32 headerSize = sizeof(EFI_VERSION_SECTION);
    UINT16 buildNumber = versionHeader->BuildNumber;
    if (pdata.ffsVersion == 3 && uint24ToUint32(sectionHeader->Size) == EFI_SECTION2_IS_USED) {
        if ((UINT32)section.size() < sizeof(EFI_VERSION_SECTION2))
            return ERR_INVALID_SECTION;
        const EFI_VERSION_SECTION2* versionHeader2 = (const EFI_VERSION_SECTION2*)sectionHeader;
        headerSize = sizeof(EFI_VERSION_SECTION2);
        buildNumber = versionHeader2->BuildNumber;
    }

    QByteArray header = section.left(headerSize);
    QByteArray body = section.mid(headerSize);
    
    // Get info
    QString name = sectionTypeToQString(sectionHeader->Type) + QObject::tr(" section");
    QString info = QObject::tr("Type: %1h\nFull size: %2h (%3)\nHeader size: %4h (%5)\nBody size: %6h (%7)\nBuild number: %8")
        .hexarg2(versionHeader->Type, 2)
        .hexarg(section.size()).arg(section.size())
        .hexarg(header.size()).arg(header.size())
        .hexarg(body.size()).arg(body.size())
        .arg(buildNumber);

    // Construct parsing data
    pdata.offset += parentOffset;

    // Add tree item
    if (!preparse) {
        index = model->addItem(Types::Section, sectionHeader->Type, name, QString(), info, header, body, QByteArray(), false, parsingDataToQByteArray(pdata), parent);
    }
    return ERR_SUCCESS;
}

STATUS FfsParser::parsePostcodeSectionHeader(const QByteArray & section, const UINT32 parentOffset, const QModelIndex & parent, QModelIndex & index, const bool preparse)
{
    // Check sanity
    if ((UINT32)section.size() < sizeof(POSTCODE_SECTION))
        return ERR_INVALID_SECTION;

    // Get data from parent's parsing data
    PARSING_DATA pdata = parsingDataFromQModelIndex(parent);

    // Obtain header fields
    const EFI_COMMON_SECTION_HEADER* sectionHeader = (const EFI_COMMON_SECTION_HEADER*)(section.constData());
    const POSTCODE_SECTION* postcodeHeader = (const POSTCODE_SECTION*)sectionHeader;
    UINT32 headerSize = sizeof(POSTCODE_SECTION);
    UINT32 postCode = postcodeHeader->Postcode;
    if (pdata.ffsVersion == 3 && uint24ToUint32(sectionHeader->Size) == EFI_SECTION2_IS_USED) {
        if ((UINT32)section.size() < sizeof(POSTCODE_SECTION2))
            return ERR_INVALID_SECTION;
        const POSTCODE_SECTION2* postcodeHeader2 = (const POSTCODE_SECTION2*)sectionHeader;
        headerSize = sizeof(POSTCODE_SECTION2);
        postCode = postcodeHeader2->Postcode;
    }

    QByteArray header = section.left(headerSize);
    QByteArray body = section.mid(headerSize);

    // Get info
    QString name = sectionTypeToQString(sectionHeader->Type) + QObject::tr(" section");
    QString info = QObject::tr("Type: %1h\nFull size: %2h (%3)\nHeader size: %4h (%5)\nBody size: %6h (%7)\nPostcode: %8h")
        .hexarg2(postcodeHeader->Type, 2)
        .hexarg(section.size()).arg(section.size())
        .hexarg(header.size()).arg(header.size())
        .hexarg(body.size()).arg(body.size())
        .hexarg(postCode);

    // Construct parsing data
    pdata.offset += parentOffset;

    // Add tree item
    if (!preparse) {
        index = model->addItem(Types::Section, sectionHeader->Type, name, QString(), info, header, body, QByteArray(), false, parsingDataToQByteArray(pdata), parent);
    }
    return ERR_SUCCESS;
}


STATUS FfsParser::parseSectionBody(const QModelIndex & index)
{
    // Sanity check
    if (!index.isValid())
        return ERR_INVALID_PARAMETER;
    QByteArray header = model->header(index);
    if ((UINT32)header.size() < sizeof(EFI_COMMON_SECTION_HEADER))
        return ERR_INVALID_SECTION;
    
    const EFI_COMMON_SECTION_HEADER* sectionHeader = (const EFI_COMMON_SECTION_HEADER*)(header.constData());

    switch (sectionHeader->Type) {
    // Encapsulation
    case EFI_SECTION_COMPRESSION:           return parseCompressedSectionBody(index);
    case EFI_SECTION_GUID_DEFINED:          return parseGuidedSectionBody(index);
    case EFI_SECTION_DISPOSABLE:            return parseSections(model->body(index), index);
    // Leaf
    case EFI_SECTION_FREEFORM_SUBTYPE_GUID: return parseRawArea(index);
    case EFI_SECTION_VERSION:               return parseVersionSectionBody(index);
    case EFI_SECTION_DXE_DEPEX:
    case EFI_SECTION_PEI_DEPEX:
    case EFI_SECTION_SMM_DEPEX:             return parseDepexSectionBody(index);
    case EFI_SECTION_TE:                    return parseTeImageSectionBody(index);
    case EFI_SECTION_PE32:
    case EFI_SECTION_PIC:                   return parsePeImageSectionBody(index);
    case EFI_SECTION_USER_INTERFACE:        return parseUiSectionBody(index);
    case EFI_SECTION_FIRMWARE_VOLUME_IMAGE: return parseRawArea(index);
    case EFI_SECTION_RAW:                   return parseRawSectionBody(index);
    // No parsing needed
    case EFI_SECTION_COMPATIBILITY16:
    case PHOENIX_SECTION_POSTCODE:
    case INSYDE_SECTION_POSTCODE:
    default:
        return ERR_SUCCESS;
    }
}

STATUS FfsParser::parseCompressedSectionBody(const QModelIndex & index)
{
    // Sanity check
    if (!index.isValid())
        return ERR_INVALID_PARAMETER;

    // Get data from parsing data
    PARSING_DATA pdata = parsingDataFromQModelIndex(index);
    UINT8 algorithm = pdata.section.compressed.compressionType;

    // Decompress section
    QByteArray decompressed;
    QByteArray efiDecompressed;
    STATUS result = decompress(model->body(index), algorithm, decompressed, efiDecompressed);
    if (result) {
        msg(QObject::tr("parseCompressedSectionBody: decompression failed with error \"%1\"").arg(errorCodeToQString(result)), index);
        return ERR_SUCCESS;
    }
    
    // Check reported uncompressed size
    if (pdata.section.compressed.uncompressedSize != (UINT32)decompressed.size()) {
        msg(QObject::tr("parseCompressedSectionBody: decompressed size stored in header %1h (%2) differs from actual %3h (%4)")
            .hexarg(pdata.section.compressed.uncompressedSize)
            .arg(pdata.section.compressed.uncompressedSize)
            .hexarg(decompressed.size())
            .arg(decompressed.size()), index);
        model->addInfo(index, QObject::tr("\nActual decompressed size: %1h (%2)").hexarg(decompressed.size()).arg(decompressed.size()));
    }

    // Check for undecided compression algorithm, this is a special case
    if (algorithm == COMPRESSION_ALGORITHM_UNDECIDED) {
        // Try preparse of sections decompressed with Tiano algorithm
        if (ERR_SUCCESS == parseSections(decompressed, index, true)) {
            algorithm = COMPRESSION_ALGORITHM_TIANO;
        }
        // Try preparse of sections decompressed with EFI 1.1 algorithm
        else if (ERR_SUCCESS == parseSections(efiDecompressed, index, true)) {
            algorithm = COMPRESSION_ALGORITHM_EFI11;
            decompressed = efiDecompressed;
        }
        else {
            msg(QObject::tr("parseCompressedSectionBody: can't guess the correct decompression algorithm, both preparse steps are failed"), index);
        }
    }

    // Add info
    model->addInfo(index, QObject::tr("\nCompression algorithm: %1").arg(compressionTypeToQString(algorithm)));

    // Update data
    pdata.section.compressed.algorithm = algorithm;
    if (algorithm != COMPRESSION_ALGORITHM_NONE)
        model->setCompressed(index, true);
    model->setParsingData(index, parsingDataToQByteArray(pdata));
    
    // Parse decompressed data
    return parseSections(decompressed, index);
}

STATUS FfsParser::parseGuidedSectionBody(const QModelIndex & index)
{
    // Sanity check
    if (!index.isValid())
        return ERR_INVALID_PARAMETER;

    // Get data from parsing data
    PARSING_DATA pdata = parsingDataFromQModelIndex(index);
    EFI_GUID guid = pdata.section.guidDefined.guid;

    // Check if section requires processing
    QByteArray processed = model->body(index);
    QByteArray efiDecompressed;
    QString info;
    bool parseCurrentSection = true;
    UINT8 algorithm = COMPRESSION_ALGORITHM_NONE;
    // Tiano compressed section
    if (QByteArray((const char*)&guid, sizeof(EFI_GUID)) == EFI_GUIDED_SECTION_TIANO) {
        algorithm = EFI_STANDARD_COMPRESSION;
        STATUS result = decompress(model->body(index), algorithm, processed, efiDecompressed);
        if (result) {
            parseCurrentSection = false;
            msg(QObject::tr("parseGuidedSectionBody: decompression failed with error \"%1\"").arg(errorCodeToQString(result)), index);
            return ERR_SUCCESS;
        }

        // Check for undecided compression algorithm, this is a special case
        if (algorithm == COMPRESSION_ALGORITHM_UNDECIDED) {
            // Try preparse of sections decompressed with Tiano algorithm
            if (ERR_SUCCESS == parseSections(processed, index, true)) {
                algorithm = COMPRESSION_ALGORITHM_TIANO;
            }
            // Try preparse of sections decompressed with EFI 1.1 algorithm
            else if (ERR_SUCCESS == parseSections(efiDecompressed, index, true)) {
                algorithm = COMPRESSION_ALGORITHM_EFI11;
                processed = efiDecompressed;
            }
            else {
                msg(QObject::tr("parseGuidedSectionBody: can't guess the correct decompression algorithm, both preparse steps are failed"), index);
				parseCurrentSection = false;
            }
        }
        
        info += QObject::tr("\nCompression algorithm: %1").arg(compressionTypeToQString(algorithm));
        info += QObject::tr("\nDecompressed size: %1h (%2)").hexarg(processed.length()).arg(processed.length());
    }
    // LZMA compressed section
    else if (QByteArray((const char*)&guid, sizeof(EFI_GUID)) == EFI_GUIDED_SECTION_LZMA) {
        algorithm = EFI_CUSTOMIZED_COMPRESSION;
        STATUS result = decompress(model->body(index), algorithm, processed, efiDecompressed);
        if (result) {
            parseCurrentSection = false;
            msg(QObject::tr("parseGuidedSectionBody: decompression failed with error \"%1\"").arg(errorCodeToQString(result)), index);
            return ERR_SUCCESS;
        }

        if (algorithm == COMPRESSION_ALGORITHM_LZMA) {
            info += QObject::tr("\nCompression algorithm: LZMA");
            info += QObject::tr("\nDecompressed size: %1h (%2)").hexarg(processed.length()).arg(processed.length());
        }
        else {
            info += QObject::tr("\nCompression algorithm: unknown");
			parseCurrentSection = false;
		}
    }

    // Add info
    model->addInfo(index, info);

    // Update data
    if (algorithm != COMPRESSION_ALGORITHM_NONE)
        model->setCompressed(index, true);
    model->setParsingData(index, parsingDataToQByteArray(pdata));

    if (!parseCurrentSection) {
        msg(QObject::tr("parseGuidedSectionBody: GUID defined section can not be processed"), index);
        return ERR_SUCCESS;
    }

    return parseSections(processed, index);
}

STATUS FfsParser::parseVersionSectionBody(const QModelIndex & index)
{
    // Sanity check
    if (!index.isValid())
        return ERR_INVALID_PARAMETER;

    // Add info
    model->addInfo(index, QObject::tr("\nVersion string: %1").arg(QString::fromUtf16((const CHAR16*)model->body(index).constData())));

    return ERR_SUCCESS;
}

STATUS FfsParser::parseDepexSectionBody(const QModelIndex & index)
{
    // Sanity check
    if (!index.isValid())
        return ERR_INVALID_PARAMETER;

    QByteArray body = model->body(index);
    QString parsed;

    // Check data to be present
    if (body.size() < 2) { // 2 is a minimal sane value, i.e TRUE + END
        msg(QObject::tr("parseDepexSectionBody: DEPEX section too short"), index);
        return ERR_DEPEX_PARSE_FAILED;
    }

    const EFI_GUID * guid;
    const UINT8* current = (const UINT8*)body.constData();

    // Special cases of first opcode
    switch (*current) {
    case EFI_DEP_BEFORE:
        if (body.size() != 2 * EFI_DEP_OPCODE_SIZE + sizeof(EFI_GUID)) {
            msg(QObject::tr("parseDepexSectionBody: DEPEX section too long for a section starting with BEFORE opcode"), index);
            return ERR_SUCCESS;
        }
        guid = (const EFI_GUID*)(current + EFI_DEP_OPCODE_SIZE);
        parsed += QObject::tr("\nBEFORE %1").arg(guidToQString(*guid));
        current += EFI_DEP_OPCODE_SIZE + sizeof(EFI_GUID);
        if (*current != EFI_DEP_END){
            msg(QObject::tr("parseDepexSectionBody: DEPEX section ends with non-END opcode"), index);
            return ERR_SUCCESS;
        }
        return ERR_SUCCESS;
    case EFI_DEP_AFTER:
        if (body.size() != 2 * EFI_DEP_OPCODE_SIZE + sizeof(EFI_GUID)){
            msg(QObject::tr("parseDepexSectionBody: DEPEX section too long for a section starting with AFTER opcode"), index);
            return ERR_SUCCESS;
        }
        guid = (const EFI_GUID*)(current + EFI_DEP_OPCODE_SIZE);
        parsed += QObject::tr("\nAFTER %1").arg(guidToQString(*guid));
        current += EFI_DEP_OPCODE_SIZE + sizeof(EFI_GUID);
        if (*current != EFI_DEP_END) {
            msg(QObject::tr("parseDepexSectionBody: DEPEX section ends with non-END opcode"), index);
            return ERR_SUCCESS;
        }
        return ERR_SUCCESS;
    case EFI_DEP_SOR:
        if (body.size() <= 2 * EFI_DEP_OPCODE_SIZE) {
            msg(QObject::tr("parseDepexSectionBody: DEPEX section too short for a section starting with SOR opcode"), index);
            return ERR_SUCCESS;
        }
        parsed += QObject::tr("\nSOR");
        current += EFI_DEP_OPCODE_SIZE;
        break;
    }

    // Parse the rest of depex 
    while (current - (const UINT8*)body.constData() < body.size()) {
        switch (*current) {
        case EFI_DEP_BEFORE: {
            msg(QObject::tr("parseDepexSectionBody: misplaced BEFORE opcode"), index);
            return ERR_SUCCESS;
        }
        case EFI_DEP_AFTER: {
            msg(QObject::tr("parseDepexSectionBody: misplaced AFTER opcode"), index);
            return ERR_SUCCESS;
        }
        case EFI_DEP_SOR: {
            msg(QObject::tr("parseDepexSectionBody: misplaced SOR opcode"), index);
            return ERR_SUCCESS;
        }
        case EFI_DEP_PUSH:
            // Check that the rest of depex has correct size
            if ((UINT32)body.size() - (UINT32)(current - (const UINT8*)body.constData()) <= EFI_DEP_OPCODE_SIZE + sizeof(EFI_GUID)) {
                parsed.clear();
                msg(QObject::tr("parseDepexSectionBody: remains of DEPEX section too short for PUSH opcode"), index);
                return ERR_SUCCESS;
            }
            guid = (const EFI_GUID*)(current + EFI_DEP_OPCODE_SIZE);
            parsed += QObject::tr("\nPUSH %1").arg(guidToQString(*guid));
            current += EFI_DEP_OPCODE_SIZE + sizeof(EFI_GUID);
            break;
        case EFI_DEP_AND:
            parsed += QObject::tr("\nAND");
            current += EFI_DEP_OPCODE_SIZE;
            break;
        case EFI_DEP_OR:
            parsed += QObject::tr("\nOR");
            current += EFI_DEP_OPCODE_SIZE;
            break;
        case EFI_DEP_NOT:
            parsed += QObject::tr("\nNOT");
            current += EFI_DEP_OPCODE_SIZE;
            break;
        case EFI_DEP_TRUE:
            parsed += QObject::tr("\nTRUE");
            current += EFI_DEP_OPCODE_SIZE;
            break;
        case EFI_DEP_FALSE:
            parsed += QObject::tr("\nFALSE");
            current += EFI_DEP_OPCODE_SIZE;
            break;
        case EFI_DEP_END:
            parsed += QObject::tr("\nEND");
            current += EFI_DEP_OPCODE_SIZE;
            // Check that END is the last opcode
            if (current - (const UINT8*)body.constData() < body.size()) {
                parsed.clear();
                msg(QObject::tr("parseDepexSectionBody: DEPEX section ends with non-END opcode"), index);
            }
            break;
        default:
            msg(QObject::tr("parseDepexSectionBody: unknown opcode"), index);
            return ERR_SUCCESS;
            break;
        }
    }
    
    // Add info
    model->addInfo(index, QObject::tr("\nParsed expression:%1").arg(parsed));

    return ERR_SUCCESS;
}

STATUS FfsParser::parseUiSectionBody(const QModelIndex & index)
{
    // Sanity check
    if (!index.isValid())
        return ERR_INVALID_PARAMETER;

    QString text = QString::fromUtf16((const CHAR16*)model->body(index).constData());

    // Add info
    model->addInfo(index, QObject::tr("\nText: %1").arg(text));

    // Rename parent file
    model->setText(model->findParentOfType(index, Types::File), text);

    return ERR_SUCCESS;
}

STATUS FfsParser::parseAprioriRawSection(const QByteArray & body, QString & parsed)
{
    // Sanity check
    if (body.size() % sizeof(EFI_GUID)) {
        msg(QObject::tr("parseAprioriRawSection: apriori file has size is not a multiple of 16"));
    }
    parsed.clear();
    UINT32 count = body.size() / sizeof(EFI_GUID);
    if (count > 0) {
        for (UINT32 i = 0; i < count; i++) {
            const EFI_GUID* guid = (const EFI_GUID*)body.constData() + i;
            parsed += QObject::tr("\n%1").arg(guidToQString(*guid));
        }
    }

    return ERR_SUCCESS;
}

STATUS FfsParser::parseRawSectionBody(const QModelIndex & index)
{
    // Sanity check
    if (!index.isValid())
        return ERR_INVALID_PARAMETER;

    // Check for apriori file
    QModelIndex parentFile = model->findParentOfType(index, Types::File);

    // Get parent file parsing data
    PARSING_DATA pdata = parsingDataFromQModelIndex(parentFile);
    QByteArray parentFileGuid((const char*)&pdata.file.guid, sizeof(EFI_GUID));

    if (parentFileGuid == EFI_PEI_APRIORI_FILE_GUID) { // PEI apriori file
        // Parse apriori file list
        QString str;
        STATUS result = parseAprioriRawSection(model->body(index), str);
        if (!result && !str.isEmpty())
            model->addInfo(index, QObject::tr("\nFile list:%1").arg(str));

        // Set parent file text
        model->setText(parentFile, QObject::tr("PEI apriori file"));

        return ERR_SUCCESS;
    }
    else if (parentFileGuid == EFI_DXE_APRIORI_FILE_GUID) { // DXE apriori file
        // Parse apriori file list
        QString str;
        STATUS result = parseAprioriRawSection(model->body(index), str);
        if (!result && !str.isEmpty())
            model->addInfo(index, QObject::tr("\nFile list:%1").arg(str));

        // Set parent file text
        model->setText(parentFile, QObject::tr("DXE apriori file"));

        return ERR_SUCCESS;
    }
    else if (parentFileGuid == NVRAM_NVAR_EXTERNAL_DEFAULTS_FILE_GUID) {
        // Parse NVAR area
        parseNvarStore(index);

        // Set parent file text
        model->setText(parentFile, QObject::tr("NVRAM external defaults"));
    }

    // Parse as raw area
    return parseRawArea(index);
}


STATUS FfsParser::parsePeImageSectionBody(const QModelIndex & index)
{
    // Sanity check
    if (!index.isValid())
        return ERR_INVALID_PARAMETER;

    // Get section body
    QByteArray body = model->body(index);
    if ((UINT32)body.size() < sizeof(EFI_IMAGE_DOS_HEADER)) {
        msg(QObject::tr("parsePeImageSectionBody: section body size is smaller than DOS header size"), index);
        return ERR_SUCCESS;
    }

    QByteArray info;
    const EFI_IMAGE_DOS_HEADER* dosHeader = (const EFI_IMAGE_DOS_HEADER*)body.constData();
    if (dosHeader->e_magic != EFI_IMAGE_DOS_SIGNATURE) {
        info += QObject::tr("\nDOS signature: %1h, invalid").hexarg2(dosHeader->e_magic, 4);
        msg(QObject::tr("parsePeImageSectionBody: PE32 image with invalid DOS signature"), index);
        model->addInfo(index, info);
        return ERR_SUCCESS;
    }

    const EFI_IMAGE_PE_HEADER* peHeader = (EFI_IMAGE_PE_HEADER*)(body.constData() + dosHeader->e_lfanew);
    if (body.size() < (UINT8*)peHeader - (UINT8*)dosHeader) {
        info += QObject::tr("\nDOS header: invalid");
        msg(QObject::tr("parsePeImageSectionBody: PE32 image with invalid DOS header"), index);
        model->addInfo(index, info);
        return ERR_SUCCESS;
    }

    if (peHeader->Signature != EFI_IMAGE_PE_SIGNATURE) {
        info += QObject::tr("\nPE signature: %1h, invalid").hexarg2(peHeader->Signature, 8);
        msg(QObject::tr("parsePeImageSectionBody: PE32 image with invalid PE signature"), index);
        model->addInfo(index, info);
        return ERR_SUCCESS;
    }

    const EFI_IMAGE_FILE_HEADER* imageFileHeader = (const EFI_IMAGE_FILE_HEADER*)(peHeader + 1);
    if (body.size() < (UINT8*)imageFileHeader - (UINT8*)dosHeader) {
        info += QObject::tr("\nPE header: invalid");
        msg(QObject::tr("parsePeImageSectionBody: PE32 image with invalid PE header"), index);
        model->addInfo(index, info);
        return ERR_SUCCESS;
    }

    info += QObject::tr("\nDOS signature: %1h\nPE signature: %2h\nMachine type: %3\nNumber of sections: %4\nCharacteristics: %5h")
        .hexarg2(dosHeader->e_magic, 4)
        .hexarg2(peHeader->Signature, 8)
        .arg(machineTypeToQString(imageFileHeader->Machine))
        .arg(imageFileHeader->NumberOfSections)
        .hexarg2(imageFileHeader->Characteristics, 4);

    EFI_IMAGE_OPTIONAL_HEADER_POINTERS_UNION optionalHeader;
    optionalHeader.H32 = (const EFI_IMAGE_OPTIONAL_HEADER32*)(imageFileHeader + 1);
    if (body.size() < (UINT8*)optionalHeader.H32 - (UINT8*)dosHeader) {
        info += QObject::tr("\nPE optional header: invalid");
        msg(QObject::tr("parsePeImageSectionBody: PE32 image with invalid PE optional header"), index);
        model->addInfo(index, info);
        return ERR_SUCCESS;
    }

    if (optionalHeader.H32->Magic == EFI_IMAGE_PE_OPTIONAL_HDR32_MAGIC) {
        info += QObject::tr("\nOptional header signature: %1h\nSubsystem: %2h\nAddress of entry point: %3h\nBase of code: %4h\nImage base: %5h")
            .hexarg2(optionalHeader.H32->Magic, 4)
            .hexarg2(optionalHeader.H32->Subsystem, 4)
            .hexarg(optionalHeader.H32->AddressOfEntryPoint)
            .hexarg(optionalHeader.H32->BaseOfCode)
            .hexarg(optionalHeader.H32->ImageBase);
    }
    else if (optionalHeader.H32->Magic == EFI_IMAGE_PE_OPTIONAL_HDR64_MAGIC) {
        info += QObject::tr("\nOptional header signature: %1h\nSubsystem: %2h\nAddress of entry point: %3h\nBase of code: %4h\nImage base: %5h")
            .hexarg2(optionalHeader.H64->Magic, 4)
            .hexarg2(optionalHeader.H64->Subsystem, 4)
            .hexarg(optionalHeader.H64->AddressOfEntryPoint)
            .hexarg(optionalHeader.H64->BaseOfCode)
            .hexarg(optionalHeader.H64->ImageBase);
    }
    else {
        info += QObject::tr("\nOptional header signature: %1h, unknown").hexarg2(optionalHeader.H32->Magic, 4);
        msg(QObject::tr("parsePeImageSectionBody: PE32 image with invalid optional PE header signature"), index);
    }

    model->addInfo(index, info);
    return ERR_SUCCESS;
}


STATUS FfsParser::parseTeImageSectionBody(const QModelIndex & index)
{
    // Check sanity
    if (!index.isValid())
        return ERR_INVALID_PARAMETER;

    // Get section body
    QByteArray body = model->body(index);
    if ((UINT32)body.size() < sizeof(EFI_IMAGE_TE_HEADER)) {
        msg(QObject::tr("parsePeImageSectionBody: section body size is smaller than TE header size"), index);
        return ERR_SUCCESS;
    }

    QByteArray info;
    const EFI_IMAGE_TE_HEADER* teHeader = (const EFI_IMAGE_TE_HEADER*)body.constData();
    if (teHeader->Signature != EFI_IMAGE_TE_SIGNATURE) {
        info += QObject::tr("\nSignature: %1h, invalid").hexarg2(teHeader->Signature, 4);
        msg(QObject::tr("parseTeImageSectionBody: TE image with invalid TE signature"), index);
    }
    else {
        info += QObject::tr("\nSignature: %1h\nMachine type: %2\nNumber of sections: %3\nSubsystem: %4h\nStripped size: %5h (%6)\nBase of code: %7h\nAddress of entry point: %8h\nImage base: %9h\nAdjusted image base: %10h")
            .hexarg2(teHeader->Signature, 4)
            .arg(machineTypeToQString(teHeader->Machine))
            .arg(teHeader->NumberOfSections)
            .hexarg2(teHeader->Subsystem, 2)
            .hexarg(teHeader->StrippedSize).arg(teHeader->StrippedSize)
            .hexarg(teHeader->BaseOfCode)
            .hexarg(teHeader->AddressOfEntryPoint)
            .hexarg(teHeader->ImageBase)
            .hexarg(teHeader->ImageBase + teHeader->StrippedSize - sizeof(EFI_IMAGE_TE_HEADER));
    }

    // Get data from parsing data
    PARSING_DATA pdata = parsingDataFromQModelIndex(index);
    pdata.section.teImage.imageBase = teHeader->ImageBase;
    pdata.section.teImage.adjustedImageBase = teHeader->ImageBase + teHeader->StrippedSize - sizeof(EFI_IMAGE_TE_HEADER);
    
    // Update parsing data
    model->setParsingData(index, parsingDataToQByteArray(pdata));

    // Add TE info
    model->addInfo(index, info);

    return ERR_SUCCESS;
}


STATUS FfsParser::performSecondPass(const QModelIndex & index)
{
    // Sanity check
    if (!index.isValid() || !lastVtf.isValid())
        return ERR_INVALID_PARAMETER;

    // Check for compressed lastVtf
    if (model->compressed(lastVtf)) {
        msg(QObject::tr("performSecondPass: the last VTF appears inside compressed item, the image may be damaged"), lastVtf);
        return ERR_SUCCESS;
    }

    // Get parsing data for the last VTF
    PARSING_DATA pdata = parsingDataFromQModelIndex(lastVtf);

    // Calculate address difference
    const UINT32 vtfSize = model->header(lastVtf).size() + model->body(lastVtf).size() + model->tail(lastVtf).size();
    const UINT32 diff = 0xFFFFFFFFUL - pdata.offset - vtfSize + 1;

    // Apply address information to index and all it's child items
    addMemoryAddressesRecursive(index, diff);

    return ERR_SUCCESS;
}

STATUS FfsParser::addMemoryAddressesRecursive(const QModelIndex & index, const UINT32 diff)
{
    // Sanity check
    if (!index.isValid())
        return ERR_SUCCESS;
    
    // Set address value for non-compressed data
    if (!model->compressed(index)) {
        // Get parsing data for the current item
        PARSING_DATA pdata = parsingDataFromQModelIndex(index);

        // Check address sanity
        if ((const UINT64)diff + pdata.offset <= 0xFFFFFFFFUL)  {
            // Update info
            pdata.address = diff + pdata.offset;
            UINT32 headerSize = model->header(index).size();
            if (headerSize) {
                model->addInfo(index, QObject::tr("\nHeader memory address: %1h").hexarg2(pdata.address, 8));
                model->addInfo(index, QObject::tr("\nData memory address: %1h").hexarg2(pdata.address + headerSize, 8));
            }
            else {
                model->addInfo(index, QObject::tr("\nMemory address: %1h").hexarg2(pdata.address, 8));
            }

            // Special case of uncompressed TE image sections
            if (model->type(index) == Types::Section && model->subtype(index) == EFI_SECTION_TE) {
                // Check data memory address to be equal to either ImageBase or AdjustedImageBase
                if (pdata.section.teImage.imageBase == pdata.address + headerSize) {
                    pdata.section.teImage.revision = 1;
                }
                else if (pdata.section.teImage.adjustedImageBase == pdata.address + headerSize) {
                    pdata.section.teImage.revision = 2;
                }
                else {
                    msg(QObject::tr("addMemoryAddressesRecursive: image base is nether original nor adjusted, it's likely a part of backup PEI volume or DXE volume, but can also be damaged"), index);
                    pdata.section.teImage.revision = 0;
                }
            }

            // Set modified parsing data
            model->setParsingData(index, parsingDataToQByteArray(pdata));
        }
    }

    // Process child items
    for (int i = 0; i < model->rowCount(index); i++) {
        addMemoryAddressesRecursive(index.child(i, 0), diff);
    }

    return ERR_SUCCESS;
}

STATUS FfsParser::addOffsetsRecursive(const QModelIndex & index)
{
    // Sanity check
    if (!index.isValid())
        return ERR_INVALID_PARAMETER;
    
    // Get parsing data for the current item
    PARSING_DATA pdata = parsingDataFromQModelIndex(index);

    // Add current offset if the element is not compressed
    // or it's compressed, but it's parent isn't
    if ((!model->compressed(index)) || (index.parent().isValid() && !model->compressed(index.parent()))) {
        model->addInfo(index, QObject::tr("Offset: %1h\n").hexarg(pdata.offset), false);
    }

    //TODO: show FIT file fixed attribute correctly
    model->addInfo(index, QObject::tr("\nCompressed: %1").arg(model->compressed(index) ? QObject::tr("Yes") : QObject::tr("No")));
    model->addInfo(index, QObject::tr("\nFixed: %1").arg(model->fixed(index) ? QObject::tr("Yes") : QObject::tr("No")));

    // Process child items
    for (int i = 0; i < model->rowCount(index); i++) {
        addOffsetsRecursive(index.child(i, 0));
    }

    return ERR_SUCCESS;
}

STATUS FfsParser::parseNvarStore(const QModelIndex & index)
{
    // Sanity check
    if (!index.isValid())
        return ERR_INVALID_PARAMETER;

    // Get parsing data for the current item
    PARSING_DATA pdata = parsingDataFromQModelIndex(index);
    UINT32 parentOffset = pdata.offset + model->header(index).size();

    // Get item data
    const QByteArray data = model->body(index);

    // Rename parent file
    model->setText(model->findParentOfType(index, Types::File), QObject::tr("NVAR store"));

    UINT32 offset = 0;
    UINT32 guidsInStore = 0;
    const UINT8 emptyByte = pdata.emptyByte;
    // Parse all entries
    while (1) {
        bool msgUnknownExtDataFormat = false;
        bool msgExtHeaderTooLong = false;
        bool msgExtDataTooShort = false;

        bool isInvalid = false;
        bool isInvalidLink = false;
        bool isDataOnly = false;
        bool hasExtendedHeader = false;
        bool hasChecksum = false;
        bool hasTimestampAndHash = false;
        bool hasGuidIndex = false;

        UINT32 guidIndex = 0;
        UINT8  storedChecksum = 0;
        UINT8  calculatedChecksum = 0;
        UINT32 extendedHeaderSize = 0;
        UINT8  extendedAttributes = 0;
        UINT64 timestamp = 0;
        QByteArray hash;

        UINT8 subtype = Subtypes::FullNvarEntry;
        QString name;
        QString text;
        QByteArray header;
        QByteArray body;
        QByteArray tail;
        
        UINT32 guidAreaSize = guidsInStore * sizeof(EFI_GUID);
        UINT32 unparsedSize = (UINT32)data.size() - offset - guidAreaSize;

        // Get entry header
        const NVAR_ENTRY_HEADER* entryHeader = (const NVAR_ENTRY_HEADER*)(data.constData() + offset);
        
        // Check header size and signature
        if (unparsedSize < sizeof(NVAR_ENTRY_HEADER) ||
            entryHeader->Signature != NVRAM_NVAR_ENTRY_SIGNATURE ||
            unparsedSize < entryHeader->Size) {

            // Check if the data left is a free space or a padding
            QByteArray padding = data.mid(offset, unparsedSize);
            UINT8 type;
            
            if ((UINT32)padding.count(emptyByte) == unparsedSize) {
                // It's a free space
                name = QObject::tr("Free space");
                type = Types::FreeSpace;
                subtype = 0;
            }
            else {
                // Nothing is parsed yet, but the file is not empty 
                if (!offset) {
                    msg(QObject::tr("parseNvarStore: file can't be parsed as NVAR variables store"), index);
                    return ERR_SUCCESS;
                }

                // It's a padding
                name = QObject::tr("Padding");
                type = Types::Padding;
                subtype = getPaddingType(padding);
            }
            // Get info
            QString info = QObject::tr("Full size: %1h (%2)")
                .hexarg(padding.size()).arg(padding.size());
            // Construct parsing data
            pdata.offset = parentOffset + offset;
            // Add tree item
            model->addItem(type, subtype, name, QString(), info, QByteArray(), padding, QByteArray(), false, parsingDataToQByteArray(pdata), index);

            // Add GUID store area
            QByteArray guidArea = data.right(guidAreaSize);
            // Get info
            name = QObject::tr("GUID store area");
            info = QObject::tr("Full size: %1h (%2)\nGUIDs in store: %3")
                .hexarg(guidArea.size()).arg(guidArea.size())
                .arg(guidsInStore);
            // Construct parsing data
            pdata.offset = parentOffset + offset + padding.size();
            // Add tree item
            model->addItem(Types::Padding, getPaddingType(guidArea), name, QString(), info, QByteArray(), guidArea, QByteArray(), false, parsingDataToQByteArray(pdata), index);

            return ERR_SUCCESS;
        }
        
        // Contruct generic header and body
        header = data.mid(offset, sizeof(NVAR_ENTRY_HEADER));
        body = data.mid(offset + sizeof(NVAR_ENTRY_HEADER), entryHeader->Size - sizeof(NVAR_ENTRY_HEADER));

        UINT32 lastVariableFlag = pdata.emptyByte ? 0xFFFFFF : 0;
        
        // Set default next to predefined last value
        pdata.nvar.next = lastVariableFlag;

        // Entry is marked as invalid
        if ((entryHeader->Attributes & NVRAM_NVAR_ENTRY_VALID) == 0) { // Valid attribute is not set
            isInvalid = true;
            // Do not parse further
            goto parsing_done;
        }

        // Add next node information to parsing data
        if (entryHeader->Next != lastVariableFlag) {
            subtype = Subtypes::LinkNvarEntry;
            pdata.nvar.next = entryHeader->Next;
        }
        
        // Entry with extended header
        if (entryHeader->Attributes & NVRAM_NVAR_ENTRY_EXT_HEADER) {
            hasExtendedHeader = true;
            msgUnknownExtDataFormat = true;

            extendedHeaderSize = *(UINT16*)(body.constData() + body.size() - sizeof(UINT16));
            if (extendedHeaderSize > (UINT32)body.size()) {
                msgExtHeaderTooLong = true;
                isInvalid = true;
                // Do not parse further
                goto parsing_done;
            }

            extendedAttributes = *(UINT8*)(body.constData() + body.size() - extendedHeaderSize);

            // Variable with checksum
            if (extendedAttributes & NVRAM_NVAR_ENTRY_EXT_CHECKSUM) {
                // Get stored checksum
                storedChecksum = *(UINT8*)(body.constData() + body.size() - sizeof(UINT16) - sizeof(UINT8));

                // Recalculate checksum for the variable
                calculatedChecksum = 0;
                // Include entry data
                UINT8* start = (UINT8*)(entryHeader + 1);
                for (UINT8* p = start; p < start + entryHeader->Size - sizeof(NVAR_ENTRY_HEADER); p++) {
                    calculatedChecksum += *p;
                }
                // Include entry size and flags
                start = (UINT8*)&entryHeader->Size;
                for (UINT8*p = start; p < start + sizeof(UINT16); p++) {
                    calculatedChecksum += *p;
                }
                // Include entry attributes
                calculatedChecksum += entryHeader->Attributes;
                
                hasChecksum = true;
                msgUnknownExtDataFormat = false;
            }

            tail = body.mid(body.size() - extendedHeaderSize);
            body = body.left(body.size() - extendedHeaderSize);

            // Entry with authenticated write (for SecureBoot)
            if (entryHeader->Attributes & NVRAM_NVAR_ENTRY_AUTH_WRITE) {
                if ((UINT32)tail.size() < sizeof(UINT64) + SHA256_HASH_SIZE) {
                    msgExtDataTooShort = true;
                    isInvalid = true;
                    // Do not parse further
                    goto parsing_done;
                }

                timestamp = *(UINT64*)(tail.constData() + sizeof(UINT8));
                hash = tail.mid(sizeof(UINT64) + sizeof(UINT8), SHA256_HASH_SIZE);
                hasTimestampAndHash = true;
                msgUnknownExtDataFormat = false;
            }
        }

        // Entry is data-only (nameless and GUIDless entry or link)
        if (entryHeader->Attributes & NVRAM_NVAR_ENTRY_DATA_ONLY) { // Data-only attribute is set
            isInvalidLink = true;
            QModelIndex nvarIndex;
            // Search prevously added entries for a link to this variable //TODO:replace with linked lists
            for (int i = 0; i < model->rowCount(index); i++) {
                nvarIndex = index.child(i, 0);
                PARSING_DATA nvarPdata = parsingDataFromQModelIndex(nvarIndex);
                if (nvarPdata.nvar.isValid && nvarPdata.nvar.next + nvarPdata.offset - parentOffset == offset) { // Previous link is present and valid
                    isInvalidLink = false;
                    break;
                }
            }
            // Check if the link is valid
            if (!isInvalidLink) {
                // Use the name and text of the previous link
                name = model->name(nvarIndex);
                text = model->text(nvarIndex);

                if (entryHeader->Next == lastVariableFlag)
                    subtype = Subtypes::DataNvarEntry;
            }

            isDataOnly = true;
            // Do not parse further
            goto parsing_done;
        }

        // Get entry name
        {
            UINT32 nameOffset = (entryHeader->Attributes & NVRAM_NVAR_ENTRY_GUID) ? sizeof(EFI_GUID) : sizeof(UINT8); // GUID can be stored with the variable or in a separate store, so there will only be an index of it
            CHAR8* namePtr = (CHAR8*)(entryHeader + 1) + nameOffset;
            UINT32 nameSize = 0;
            if (entryHeader->Attributes & NVRAM_NVAR_ENTRY_ASCII_NAME) { // Name is stored as ASCII string of CHAR8s
                text = QString(namePtr);
                nameSize = text.length() + 1;
            }
            else { // Name is stored as UCS2 string of CHAR16s
                text = QString::fromUtf16((CHAR16*)namePtr);
                nameSize = (text.length() + 1) * 2;
            }

            // Get entry GUID
            if (entryHeader->Attributes & NVRAM_NVAR_ENTRY_GUID) { // GUID is strored in the variable itself
                name = guidToQString(*(EFI_GUID*)(entryHeader + 1));
            }
            // GUID is stored in GUID list at the end of the store
            else {
                guidIndex = *(UINT8*)(entryHeader + 1);
                if (guidsInStore < guidIndex + 1)
                    guidsInStore = guidIndex + 1;

                // The list begins at the end of the store and goes backwards
                const EFI_GUID* guidPtr = (const EFI_GUID*)(data.constData() + data.size()) - 1 - guidIndex;
                name = guidToQString(*guidPtr);
                hasGuidIndex = true;
            }

            // Include name and GUID into the header and remove them from body
            header = data.mid(offset, sizeof(NVAR_ENTRY_HEADER) + nameOffset + nameSize);
            body = body.mid(nameOffset + nameSize);
        }
parsing_done:
        QString info;

        // Rename invalid entries according to their types
        pdata.nvar.isValid = TRUE;
        if (isInvalid) {
            name = QObject::tr("Invalid");
            subtype = Subtypes::InvalidNvarEntry;
            pdata.nvar.isValid = FALSE;
        }
        else if (isInvalidLink) {
            name = QObject::tr("Invalid link");
            subtype = Subtypes::InvalidLinkNvarEntry;
            pdata.nvar.isValid = FALSE;
        }
        else // Add GUID info for valid entries
            info += QObject::tr("Variable GUID: %1\n").arg(name);
        
        // Add GUID index information
        if (hasGuidIndex)
            info += QObject::tr("GUID index: %1\n").arg(guidIndex);

        // Add header, body and extended data info
        info += QObject::tr("Full size: %1h (%2)\nHeader size: %3h (%4)\nBody size: %5h (%6)")
            .hexarg(entryHeader->Size).arg(entryHeader->Size)
            .hexarg(header.size()).arg(header.size())
            .hexarg(body.size()).arg(body.size());
        
        // Add attributes info
        info += QObject::tr("\nAttributes: %1h").hexarg2(entryHeader->Attributes, 2);
        // Translate attributes to text
        if (entryHeader->Attributes && entryHeader->Attributes != 0xFF)
            info += QObject::tr(" (%1)").arg(nvarAttributesToQString(entryHeader->Attributes));


        // Add next node info
        if (!isInvalid && entryHeader->Next != lastVariableFlag)
            info += QObject::tr("\nNext node at offset: %1h").hexarg(parentOffset + offset + entryHeader->Next);

        // Add extended header info
        if (hasExtendedHeader) {
            info += QObject::tr("\nExtended header size: %1h (%2)\nExtended attributes: %3h (%4)")
                .hexarg(extendedHeaderSize).arg(extendedHeaderSize)
                .hexarg2(extendedAttributes, 2)
                .arg(nvarExtendedAttributesToQString(extendedAttributes));

            // Checksum
            if (hasChecksum)
                info += QObject::tr("\nChecksum: %1h%2").hexarg2(storedChecksum, 2)
                    .arg(calculatedChecksum ? QObject::tr(", invalid, should be %1h").hexarg2(0x100 - calculatedChecksum, 2) : QObject::tr(", valid"));
            // Authentication data
            if (hasTimestampAndHash) {
                info += QObject::tr("\nTimestamp: %1h\nHash: %2")
                    .hexarg(timestamp).arg(QString(hash.toHex().toUpper()));
            }
        }
        
        // Add correct offset to parsing data
        pdata.offset = parentOffset + offset;

        // Add tree item
        QModelIndex varIndex = model->addItem(Types::NvarEntry, subtype, name, text, info, header, body, tail, false, parsingDataToQByteArray(pdata), index);

        // Show messages
        if (msgUnknownExtDataFormat) msg(QObject::tr("parseNvarStore: unknown extended data format"), varIndex);
        if (msgExtHeaderTooLong)     msg(QObject::tr("parseNvarStore: extended header size (%1h) is greater than body size (%2h)")
                                         .hexarg(extendedHeaderSize).hexarg(body.size()), varIndex);
        if (msgExtDataTooShort)      msg(QObject::tr("parseNvarStore: extended header size (%1h) is too small for timestamp and hash")
                                         .hexarg(tail.size()), varIndex);

        // Try parsing the entry data as NVAR storage if it begins with NVAR signature
        if ((subtype == Subtypes::DataNvarEntry || subtype == Subtypes::FullNvarEntry) 
            && *(const UINT32*)body.constData() == NVRAM_NVAR_ENTRY_SIGNATURE)
            parseNvarStore(varIndex);
        
        // Move to next exntry
        offset += entryHeader->Size;
    }
    
    return ERR_SUCCESS;
}

STATUS FfsParser::parseNvramVolumeBody(const QModelIndex & index)
{
    // Sanity check
    if (!index.isValid())
        return ERR_INVALID_PARAMETER;

    // Get parsing data
    PARSING_DATA pdata = parsingDataFromQModelIndex(index);
    UINT32 parentOffset = pdata.offset + model->header(index).size();

    // Get item data
    QByteArray data = model->body(index);

    // Search for first store
    STATUS result;
    UINT32 prevStoreOffset;
    result = findNextStore(index, data, parentOffset, 0, prevStoreOffset);
    if (result)
        return result;

    // First store is not at the beginning of volume body
    QString name;
    QString info;
    if (prevStoreOffset > 0) {
        // Get info
        QByteArray padding = data.left(prevStoreOffset);
        name = QObject::tr("Padding");
        info = QObject::tr("Full size: %1h (%2)")
            .hexarg(padding.size()).arg(padding.size());

        // Construct parsing data
        pdata.offset = parentOffset;

        // Add tree item
        model->addItem(Types::Padding, getPaddingType(padding), name, QString(), info, QByteArray(), padding, QByteArray(), true, parsingDataToQByteArray(pdata), index);
    }

    // Search for and parse all stores
    UINT32 storeOffset = prevStoreOffset;
    UINT32 prevStoreSize = 0;

    while (!result)
    {
        // Padding between stores
        if (storeOffset > prevStoreOffset + prevStoreSize) {
            UINT32 paddingOffset = prevStoreOffset + prevStoreSize;
            UINT32 paddingSize = storeOffset - paddingOffset;
            QByteArray padding = data.mid(paddingOffset, paddingSize);

            // Get info
            name = QObject::tr("Padding");
            info = QObject::tr("Full size: %1h (%2)")
                .hexarg(padding.size()).arg(padding.size());

            // Construct parsing data
            pdata.offset = parentOffset + paddingOffset;

            // Add tree item
            model->addItem(Types::Padding, getPaddingType(padding), name, QString(), info, QByteArray(), padding, QByteArray(), true, parsingDataToQByteArray(pdata), index);
        }

        // Get store size
        UINT32 storeSize = 0;
        result = getStoreSize(data, storeOffset, storeSize);
        if (result) {
            msg(QObject::tr("parseNvramVolumeBody: getStoreSize failed with error \"%1\"").arg(errorCodeToQString(result)), index);
            return result;
        }

        // Check that current store is fully present in input
        if (storeSize > (UINT32)data.size() || storeOffset + storeSize > (UINT32)data.size()) {
            // Mark the rest as padding and finish parsing
            QByteArray padding = data.mid(storeOffset);

            // Get info
            name = QObject::tr("Padding");
            info = QObject::tr("Full size: %1h (%2)")
                .hexarg(padding.size()).arg(padding.size());

            // Construct parsing data
            pdata.offset = parentOffset + storeOffset;

            // Add tree item
            QModelIndex paddingIndex = model->addItem(Types::Padding, getPaddingType(padding), name, QString(), info, QByteArray(), padding, QByteArray(), true, parsingDataToQByteArray(pdata), index);
            msg(QObject::tr("parseNvramVolumeBody: one of stores inside overlaps the end of data"), paddingIndex);

            // Update variables
            prevStoreOffset = storeOffset;
            prevStoreSize = padding.size();
            break;
        }

        QByteArray store = data.mid(storeOffset, storeSize);
        // Parse current store header
        QModelIndex storeIndex;
        result = parseStoreHeader(store, parentOffset + storeOffset, index, storeIndex);
        if (result)
            msg(QObject::tr("parseNvramVolumeBody: store header parsing failed with error \"%1\"").arg(errorCodeToQString(result)), index);

        // Go to next store
        prevStoreOffset = storeOffset;
        prevStoreSize = storeSize;
        result = findNextStore(index, data, parentOffset, storeOffset + prevStoreSize, storeOffset);
    }

    // Padding/free space at the end
    storeOffset = prevStoreOffset + prevStoreSize;
    if ((UINT32)data.size() > storeOffset) {
        QByteArray padding = data.mid(storeOffset);
        UINT8 type;
        UINT8 subtype;
        if (padding.count(pdata.emptyByte) == padding.size()) {
            // It's a free space
            name = QObject::tr("Free space");
            type = Types::FreeSpace;
            subtype = 0;
        }
        else {
            // Nothing is parsed yet, but the file is not empty 
            if (!storeOffset) {
                msg(QObject::tr("parseNvramVolumeBody: can't be parsed as NVRAM volume"), index);
                return ERR_SUCCESS;
            }

            // It's a padding
            name = QObject::tr("Padding");
            type = Types::Padding;
            subtype = getPaddingType(padding);
        }

        // Add info
        info = QObject::tr("Full size: %1h (%2)")
            .hexarg(padding.size()).arg(padding.size());

        // Construct parsing data
        pdata.offset = parentOffset + storeOffset;
        
        // Add tree item
        model->addItem(type, subtype, name, QString(), info, QByteArray(), padding, QByteArray(), true, parsingDataToQByteArray(pdata), index);
    }

    // Parse bodies
    for (int i = 0; i < model->rowCount(index); i++) {
        QModelIndex current = index.child(i, 0);
        switch (model->type(current)) {
        case Types::VssStore:
        case Types::FdcStore:       parseVssStoreBody(current);  break;
        case Types::FsysStore:      parseFsysStoreBody(current); break;
        case Types::EvsaStore:      parseEvsaStoreBody(current); break;
        case Types::FlashMapStore:  parseFlashMapBody(current);  break;
        }
    }
    
    return ERR_SUCCESS;
}

STATUS FfsParser::findNextStore(const QModelIndex & index, const QByteArray & volume, const UINT32 parentOffset, const UINT32 storeOffset, UINT32 & nextStoreOffset)
{
    UINT32 dataSize = volume.size();

    if (dataSize < sizeof(UINT32))
        return ERR_STORES_NOT_FOUND;

    UINT32 offset = storeOffset;
    for (; offset < dataSize - sizeof(UINT32); offset++) {
        const UINT32* currentPos = (const UINT32*)(volume.constData() + offset);
        if (*currentPos == NVRAM_VSS_STORE_SIGNATURE || *currentPos == NVRAM_APPLE_SVS_STORE_SIGNATURE) { //$VSS or $SVS signatures found, perform checks
            const VSS_VARIABLE_STORE_HEADER* vssHeader = (const VSS_VARIABLE_STORE_HEADER*)currentPos;
            if (vssHeader->Format != NVRAM_VSS_VARIABLE_STORE_FORMATTED) {
                msg(QObject::tr("findNextStore: VSS store candidate at offset %1h skipped, has invalid format %2h").hexarg(parentOffset + offset).hexarg2(vssHeader->Format, 2), index);
                continue;
            }
            if (vssHeader->Size == 0 || vssHeader->Size == 0xFFFFFFFF) {
                msg(QObject::tr("findNextStore: VSS store candidate at offset %1h skipped, has invalid size %2h").hexarg(parentOffset + offset).hexarg2(vssHeader->Size, 8), index);
                continue;
            }
            // All checks passed, store found
            break;
        }
        else if (*currentPos == NVRAM_FDC_VOLUME_SIGNATURE) { //FDC signature found
            const FDC_VOLUME_HEADER* fdcHeader = (const FDC_VOLUME_HEADER*)currentPos;
            if (fdcHeader->Size == 0 || fdcHeader->Size == 0xFFFFFFFF) {
                msg(QObject::tr("findNextStore: FDC store candidate at offset %1h skipped, has invalid size %2h").hexarg(parentOffset + offset).hexarg2(fdcHeader->Size, 8), index);
                continue;
            }
            // All checks passed, store found
            break;
        }
        else if (*currentPos == NVRAM_APPLE_FSYS_STORE_SIGNATURE || *currentPos == NVRAM_APPLE_GAID_STORE_SIGNATURE) { //Fsys or Gaid signature found
            const APPLE_FSYS_STORE_HEADER* fsysHeader = (const APPLE_FSYS_STORE_HEADER*)currentPos;
            if (fsysHeader->Size == 0 || fsysHeader->Size == 0xFFFF) {
                msg(QObject::tr("findNextStore: Fsys store candidate at offset %1h skipped, has invalid size %2h").hexarg(parentOffset + offset).hexarg2(fsysHeader->Size, 4), index);
                continue;
            }
            // All checks passed, store found
            break;
        }
        else if (*currentPos == NVRAM_EVSA_STORE_SIGNATURE) { //EVSA signature found
            if (offset < sizeof(UINT32))
                continue;

            const EVSA_STORE_ENTRY* evsaHeader = (const EVSA_STORE_ENTRY*)(currentPos - 1);
            if (evsaHeader->Header.Type != NVRAM_EVSA_ENTRY_TYPE_STORE) {
                msg(QObject::tr("findNextStore: EVSA store candidate at offset %1h skipped, has invalid type %2h").hexarg(parentOffset + offset - 4).hexarg2(evsaHeader->Header.Type, 2), index);
                continue;
            }
            if (evsaHeader->StoreSize == 0 || evsaHeader->StoreSize == 0xFFFFFFFF) {
                msg(QObject::tr("findNextStore: EVSA store candidate at offset %1h skipped, has invalid size %2h").hexarg(parentOffset + offset).hexarg2(evsaHeader->StoreSize, 8), index);
                continue;
            }
            // All checks passed, store found
            offset -= sizeof(UINT32);
            break;
        }
        else if (*currentPos == NVRAM_MAIN_STORE_VOLUME_GUID_DATA1 || *currentPos == EDKII_WORKING_BLOCK_SIGNATURE_GUID_DATA1) { //Possible FTW block signature found
            QByteArray guid = QByteArray(volume.constData() + offset, sizeof(EFI_GUID));
            if (guid != NVRAM_MAIN_STORE_VOLUME_GUID && guid != EDKII_WORKING_BLOCK_SIGNATURE_GUID) // Check the whole signature
                continue;

            // Detect header variant based on WriteQueueSize
            const EFI_FAULT_TOLERANT_WORKING_BLOCK_HEADER32* ftwHeader = (const EFI_FAULT_TOLERANT_WORKING_BLOCK_HEADER32*)currentPos;
            if (ftwHeader->WriteQueueSize % 0x10 == 0x04) { // Header with 32 bit WriteQueueSize
                if (ftwHeader->WriteQueueSize == 0 || ftwHeader->WriteQueueSize == 0xFFFFFFFF) {
                    msg(QObject::tr("findNextStore: FTW block candidate at offset %1h skipped, has invalid body size %2h").hexarg(parentOffset + offset).hexarg2(ftwHeader->WriteQueueSize, 8), index);
                    continue;
                }
            }
            else if (ftwHeader->WriteQueueSize % 0x10 == 0x00) { // Header with 64 bit WriteQueueSize
                const EFI_FAULT_TOLERANT_WORKING_BLOCK_HEADER64* ftw64Header = (const EFI_FAULT_TOLERANT_WORKING_BLOCK_HEADER64*)currentPos;
                if (ftw64Header->WriteQueueSize == 0 || ftw64Header->WriteQueueSize >= 0xFFFFFFFF) {
                    msg(QObject::tr("findNextStore: FTW block candidate at offset %1h skipped, has invalid body size %2h").hexarg(parentOffset + offset).hexarg2(ftw64Header->WriteQueueSize, 16), index);
                    continue;
                }
            }
            else // Unknown header
                continue;

            // All checks passed, store found
            break;
        }
        else if (*currentPos == NVRAM_PHOENIX_FLASH_MAP_SIGNATURE_PART1) {// Phoenix SCT flash map
            QByteArray signature = QByteArray(volume.constData() + offset, NVRAM_PHOENIX_FLASH_MAP_SIGNATURE_LENGTH);
            if (signature != NVRAM_PHOENIX_FLASH_MAP_SIGNATURE) // Check the whole signature
                continue;

            // All checks passed, store found
            break;
        }
        else if (*currentPos == NVRAM_PHOENIX_CMDB_HEADER_SIGNATURE) { // Phoenix SCT CMDB store
            const PHOENIX_CMDB_HEADER* cmdbHeader = (const PHOENIX_CMDB_HEADER*)currentPos;

            // Check size
            if (cmdbHeader->HeaderSize != sizeof(PHOENIX_CMDB_HEADER))
                continue;

            // All checks passed, store found
            break;
        }
        else if (*currentPos == INTEL_MICROCODE_HEADER_VERSION) {// Intel microcode
            if (!INTEL_MICROCODE_HEADER_SIZES_VALID(currentPos)) // Check header sizes
                continue;

            // Check reserved bytes
            const INTEL_MICROCODE_HEADER* ucodeHeader = (const INTEL_MICROCODE_HEADER*)currentPos;
            bool reservedBytesValid = true;
            for (UINT32 i = 0; i < sizeof(ucodeHeader->Reserved); i++)
                if (ucodeHeader->Reserved[i] != INTEL_MICROCODE_HEADER_RESERVED_BYTE) {
                    reservedBytesValid = false;
                    break;
                }
            if (!reservedBytesValid)
                continue;

            // All checks passed, store found
            break;
        }
        else if (*currentPos == OEM_ACTIVATION_PUBKEY_MAGIC) { // SLIC pubkey
            if (offset < 4 * sizeof(UINT32))
                continue;

            const OEM_ACTIVATION_PUBKEY* pubkeyHeader = (const OEM_ACTIVATION_PUBKEY*)(currentPos - 4);
            // Check type
            if (pubkeyHeader->Type != OEM_ACTIVATION_PUBKEY_TYPE)
                continue;

            // All checks passed, store found
            offset -= 4 * sizeof(UINT32);
            break;
        }
        else if (*currentPos == OEM_ACTIVATION_MARKER_WINDOWS_FLAG_PART1) { // SLIC marker
            if (offset >= dataSize - sizeof(UINT64) || 
                *(const UINT64*)currentPos != OEM_ACTIVATION_MARKER_WINDOWS_FLAG ||
                offset < 26) // Check full windows flag and structure size
                continue;
            
            const OEM_ACTIVATION_MARKER* markerHeader = (const OEM_ACTIVATION_MARKER*)(volume.constData() + offset - 26);
            // Check reserved bytes
            bool reservedBytesValid = true;
            for (UINT32 i = 0; i < sizeof(markerHeader->Reserved); i++)
                if (markerHeader->Reserved[i] != OEM_ACTIVATION_MARKER_RESERVED_BYTE) {
                    reservedBytesValid = false;
                    break;
                }
            if (!reservedBytesValid)
                continue;

            // All checks passed, store found
            offset -= 26;
            break;
        }
    }
    // No more stores found
    if (offset >= dataSize - sizeof(UINT32))
        return ERR_STORES_NOT_FOUND;

    nextStoreOffset = offset;

    return ERR_SUCCESS;
}

STATUS FfsParser::getStoreSize(const QByteArray & data, const UINT32 storeOffset, UINT32 & storeSize)
{
    const UINT32* signature = (const UINT32*)(data.constData() + storeOffset);
    if (*signature == NVRAM_VSS_STORE_SIGNATURE || *signature == NVRAM_APPLE_SVS_STORE_SIGNATURE) {
        const VSS_VARIABLE_STORE_HEADER* vssHeader = (const VSS_VARIABLE_STORE_HEADER*)signature;
        storeSize = vssHeader->Size;
    }
    else if (*signature == NVRAM_FDC_VOLUME_SIGNATURE) {
        const FDC_VOLUME_HEADER* fdcHeader = (const FDC_VOLUME_HEADER*)signature;
        storeSize = fdcHeader->Size;
    }
    else if (*signature == NVRAM_APPLE_FSYS_STORE_SIGNATURE || *signature == NVRAM_APPLE_GAID_STORE_SIGNATURE) {
        const APPLE_FSYS_STORE_HEADER* fsysHeader = (const APPLE_FSYS_STORE_HEADER*)signature;
        storeSize = fsysHeader->Size;
    }
    else if (*(signature + 1) == NVRAM_EVSA_STORE_SIGNATURE) {
        const EVSA_STORE_ENTRY* evsaHeader = (const EVSA_STORE_ENTRY*)signature;
        storeSize = evsaHeader->StoreSize;
    }
    else if (*signature == NVRAM_MAIN_STORE_VOLUME_GUID_DATA1 || *signature == EDKII_WORKING_BLOCK_SIGNATURE_GUID_DATA1) {
        const EFI_FAULT_TOLERANT_WORKING_BLOCK_HEADER32* ftwHeader = (const EFI_FAULT_TOLERANT_WORKING_BLOCK_HEADER32*)signature;
        if (ftwHeader->WriteQueueSize % 0x10 == 0x04) { // Header with 32 bit WriteQueueSize
            storeSize = sizeof(EFI_FAULT_TOLERANT_WORKING_BLOCK_HEADER32) + ftwHeader->WriteQueueSize;
        }
        else { //  Header with 64 bit WriteQueueSize
            const EFI_FAULT_TOLERANT_WORKING_BLOCK_HEADER64* ftw64Header = (const EFI_FAULT_TOLERANT_WORKING_BLOCK_HEADER64*)signature;
            storeSize = sizeof(EFI_FAULT_TOLERANT_WORKING_BLOCK_HEADER64) + ftw64Header->WriteQueueSize;
        }
    }
    else if (*signature == NVRAM_PHOENIX_FLASH_MAP_SIGNATURE_PART1) { // Phoenix SCT flash map
        const PHOENIX_FLASH_MAP_HEADER* flashMapHeader = (const PHOENIX_FLASH_MAP_HEADER*)signature;
        storeSize = sizeof(PHOENIX_FLASH_MAP_HEADER) + sizeof(PHOENIX_FLASH_MAP_ENTRY) * flashMapHeader->NumEntries;
    }
    else if (*signature == NVRAM_PHOENIX_CMDB_HEADER_SIGNATURE) { // Phoenix SCT CMDB store
        storeSize = NVRAM_PHOENIX_CMDB_SIZE; // It's a predefined max size, no need to calculate
    }
    else if (*(signature + 4) == OEM_ACTIVATION_PUBKEY_MAGIC) { // SLIC pubkey
        const OEM_ACTIVATION_PUBKEY* pubkeyHeader = (const OEM_ACTIVATION_PUBKEY*)signature;
        storeSize = pubkeyHeader->Size;
    }
    else if (*(const UINT64*)(data.constData() + storeOffset + 26) == OEM_ACTIVATION_MARKER_WINDOWS_FLAG) { // SLIC marker
        const OEM_ACTIVATION_MARKER* markerHeader = (const OEM_ACTIVATION_MARKER*)signature;
        storeSize = markerHeader->Size;
    }
    else if (*signature == INTEL_MICROCODE_HEADER_VERSION) { // Intel microcode, must be checked after SLIC marker because of the same *signature values
        const INTEL_MICROCODE_HEADER* ucodeHeader = (const INTEL_MICROCODE_HEADER*)signature;
        storeSize = ucodeHeader->TotalSize;
    }
    return ERR_SUCCESS;
}

STATUS FfsParser::parseVssStoreHeader(const QByteArray & store, const UINT32 parentOffset, const QModelIndex & parent, QModelIndex & index)
{
    const UINT32 dataSize = (const UINT32)store.size();
    
    // Check store size
    if (dataSize < sizeof(VSS_VARIABLE_STORE_HEADER)) {
        msg(QObject::tr("parseVssStoreHeader: volume body is too small even for VSS store header"), parent);
        return ERR_SUCCESS;
    }

    // Get VSS store header
    const VSS_VARIABLE_STORE_HEADER* vssStoreHeader = (const VSS_VARIABLE_STORE_HEADER*)store.constData();

    // Check store size
    if (dataSize < vssStoreHeader->Size) {
        msg(QObject::tr("parseVssStoreHeader: VSS store size %1h (%2) is greater than volume body size %3h (%4)")
            .hexarg(vssStoreHeader->Size).arg(vssStoreHeader->Size)
            .hexarg(dataSize).arg(dataSize), parent);
        return ERR_SUCCESS;
    }

    // Get parsing data
    PARSING_DATA pdata = parsingDataFromQModelIndex(parent);

    // Construct header and body
    QByteArray header = store.left(sizeof(VSS_VARIABLE_STORE_HEADER));
    QByteArray body = store.mid(sizeof(VSS_VARIABLE_STORE_HEADER), vssStoreHeader->Size - sizeof(VSS_VARIABLE_STORE_HEADER));

    // Add info
    bool isSvsStore = (vssStoreHeader->Signature == NVRAM_APPLE_SVS_STORE_SIGNATURE);
    QString name = isSvsStore ? QObject::tr("SVS store") : QObject::tr("VSS store");
    QString info = QObject::tr("Signature: %1\nFull size: %2h (%3)\nHeader size: %4h (%5)\nBody size: %6h (%7)\nFormat: %8h\nState: %9h\nUnknown: %10h")
        .arg(isSvsStore ? QObject::tr("$SVS") : QObject::tr("$VSS"))
        .hexarg(vssStoreHeader->Size).arg(vssStoreHeader->Size)
        .hexarg(header.size()).arg(header.size())
        .hexarg(body.size()).arg(body.size())
        .hexarg2(vssStoreHeader->Format, 2)
        .hexarg2(vssStoreHeader->State, 2)
        .hexarg2(vssStoreHeader->Unknown, 4);

    // Add correct offset
    pdata.offset = parentOffset;

    // Add tree item
    index = model->addItem(Types::VssStore, 0, name, QString(), info, header, body, QByteArray(), true, parsingDataToQByteArray(pdata), parent);

    return ERR_SUCCESS;
}

STATUS FfsParser::parseFtwStoreHeader(const QByteArray & store, const UINT32 parentOffset, const QModelIndex & parent, QModelIndex & index)
{
    const UINT32 dataSize = (const UINT32)store.size();

    // Check store size
    if (dataSize < sizeof(EFI_FAULT_TOLERANT_WORKING_BLOCK_HEADER64)) {
        msg(QObject::tr("parseFtwStoreHeader: volume body is too small even for FTW store header"), parent);
        return ERR_SUCCESS;
    }

    // Get FTW block headers
    const EFI_FAULT_TOLERANT_WORKING_BLOCK_HEADER32* ftw32BlockHeader = (const EFI_FAULT_TOLERANT_WORKING_BLOCK_HEADER32*)store.constData();
    const EFI_FAULT_TOLERANT_WORKING_BLOCK_HEADER64* ftw64BlockHeader = (const EFI_FAULT_TOLERANT_WORKING_BLOCK_HEADER64*)store.constData();

    // Check store size
    UINT32 ftwBlockSize;
    bool has32bitHeader;
    if (ftw32BlockHeader->WriteQueueSize % 0x10 == 0x04) { // Header with 32 bit WriteQueueSize
        ftwBlockSize = sizeof(EFI_FAULT_TOLERANT_WORKING_BLOCK_HEADER32) + ftw32BlockHeader->WriteQueueSize;
        has32bitHeader = true;
    }
    else { // Header with 64 bit WriteQueueSize
        ftwBlockSize = sizeof(EFI_FAULT_TOLERANT_WORKING_BLOCK_HEADER64) + ftw64BlockHeader->WriteQueueSize;
        has32bitHeader = false;
    }
    if (dataSize < ftwBlockSize) {
        msg(QObject::tr("parseFtwStoreHeader: FTW store size %1h (%2) is greater than volume body size %3h (%4)")
            .hexarg(ftwBlockSize).arg(ftwBlockSize)
            .hexarg(dataSize).arg(dataSize), parent);
        return ERR_SUCCESS;
    }

    // Get parsing data
    PARSING_DATA pdata = parsingDataFromQModelIndex(parent);

    // Construct header and body
    UINT32 headerSize = has32bitHeader ? sizeof(EFI_FAULT_TOLERANT_WORKING_BLOCK_HEADER32) : sizeof(EFI_FAULT_TOLERANT_WORKING_BLOCK_HEADER64);
    QByteArray header = store.left(headerSize);
    QByteArray body = store.mid(headerSize, ftwBlockSize - headerSize);

    // Check block header checksum
    QByteArray crcHeader = header;
    EFI_FAULT_TOLERANT_WORKING_BLOCK_HEADER32* crcFtwBlockHeader = (EFI_FAULT_TOLERANT_WORKING_BLOCK_HEADER32*)header.data();
    crcFtwBlockHeader->Crc = pdata.emptyByte ? 0xFFFFFFFF : 0;
    crcFtwBlockHeader->State = pdata.emptyByte ? 0xFF : 0;
    UINT32 calculatedCrc = crc32(0, (const UINT8*)crcFtwBlockHeader, headerSize);

    // Add info
    QString name = QObject::tr("FTW store");
    QString info = QObject::tr("Signature: %1\nFull size: %2h (%3)\nHeader size: %4h (%5)\nBody size: %6h (%7)\nState: %8h\nHeader CRC32: %9")
        .arg(guidToQString(ftw32BlockHeader->Signature))
        .hexarg(ftwBlockSize).arg(ftwBlockSize)
        .hexarg(headerSize).arg(headerSize)
        .hexarg(body.size()).arg(body.size())
        .hexarg2(ftw32BlockHeader->State, 2)
        .arg(ftw32BlockHeader->Crc == calculatedCrc ?
            QObject::tr("%1h, valid").hexarg2(ftw32BlockHeader->Crc, 8) :
            QObject::tr("%1h, invalid, should be %2h").hexarg2(ftw32BlockHeader->Crc, 8).hexarg2(calculatedCrc, 8));

    // Add correct offset
    pdata.offset = parentOffset;

    // Add tree item
    index = model->addItem(Types::FtwStore, 0, name, QString(), info, header, body, QByteArray(), true, parsingDataToQByteArray(pdata), parent);

    return ERR_SUCCESS;
}

STATUS FfsParser::parseFdcStoreHeader(const QByteArray & store, const UINT32 parentOffset, const QModelIndex & parent, QModelIndex & index)
{
    const UINT32 dataSize = (const UINT32)store.size();

    // Check store size
    if (dataSize < sizeof(FDC_VOLUME_HEADER)) {
        msg(QObject::tr("parseFdcStoreHeader: volume body is too small even for FDC store header"), parent);
        return ERR_SUCCESS;
    }

    // Get Fdc store header
    const FDC_VOLUME_HEADER* fdcStoreHeader = (const FDC_VOLUME_HEADER*)store.constData();

    // Check store size
    if (dataSize < fdcStoreHeader->Size) {
        msg(QObject::tr("parseFdcStoreHeader: FDC store size %1h (%2) is greater than volume body size %3h (%4)")
            .hexarg(fdcStoreHeader->Size).arg(fdcStoreHeader->Size)
            .hexarg(dataSize).arg(dataSize), parent);
        return ERR_SUCCESS;
    }

    // Determine internal volume header size
    const EFI_FIRMWARE_VOLUME_HEADER* volumeHeader = (const EFI_FIRMWARE_VOLUME_HEADER*)(fdcStoreHeader + 1);
    UINT32 headerSize;
    if (volumeHeader->Revision > 1 && volumeHeader->ExtHeaderOffset) {
        const EFI_FIRMWARE_VOLUME_EXT_HEADER* extendedHeader = (const EFI_FIRMWARE_VOLUME_EXT_HEADER*)((const UINT8*)volumeHeader + volumeHeader->ExtHeaderOffset);
        headerSize = volumeHeader->ExtHeaderOffset + extendedHeader->ExtHeaderSize;
    }
    else
        headerSize = volumeHeader->HeaderLength;

    // Extended header end can be unaligned
    headerSize = ALIGN8(headerSize);

    // Add VSS store header
    headerSize += sizeof(VSS_VARIABLE_STORE_HEADER);

    // Add FDC header 
    headerSize += sizeof(FDC_VOLUME_HEADER);

    // Check sanity of combined header size
    if (dataSize < headerSize) {
        msg(QObject::tr("parseFdcStoreHeader: FDC store header size %1h (%2) is greater than volume body size %3h (%4)")
            .hexarg2(fdcStoreHeader->Size, 8).arg(fdcStoreHeader->Size)
            .hexarg2(dataSize, 8).arg(dataSize), parent);
        return ERR_SUCCESS;
    }

    // Get parsing data
    PARSING_DATA pdata = parsingDataFromQModelIndex(parent);

    // Construct header and body
    QByteArray header = store.left(headerSize);
    QByteArray body = store.mid(headerSize, fdcStoreHeader->Size - headerSize);

    // Add info
    QString name = QObject::tr("FDC store");
    QString info = QObject::tr("Signature: _FDC\nFull size: %1h (%2)\nHeader size: %3h (%4)\nBody size: %5h (%6)")
        .hexarg(fdcStoreHeader->Size).arg(fdcStoreHeader->Size)
        .hexarg(header.size()).arg(header.size())
        .hexarg(body.size()).arg(body.size());

    // TODO: add internal headers info

    // Add correct offset
    pdata.offset = parentOffset;

    // Add tree item
    index = model->addItem(Types::FdcStore, 0, name, QString(), info, header, body, QByteArray(), true, parsingDataToQByteArray(pdata), parent);

    return ERR_SUCCESS;
}

STATUS FfsParser::parseFsysStoreHeader(const QByteArray & store, const UINT32 parentOffset, const QModelIndex & parent, QModelIndex & index)
{
    const UINT32 dataSize = (const UINT32)store.size();

    // Check store size
    if (dataSize < sizeof(APPLE_FSYS_STORE_HEADER)) {
        msg(QObject::tr("parseFsysStoreHeader: volume body is too small even for Fsys store header"), parent);
        return ERR_SUCCESS;
    }

    // Get Fsys store header
    const APPLE_FSYS_STORE_HEADER* fsysStoreHeader = (const APPLE_FSYS_STORE_HEADER*)store.constData();

    // Check store size
    if (dataSize < fsysStoreHeader->Size) {
        msg(QObject::tr("parseFsysStoreHeader: Fsys store size %1h (%2) is greater than volume body size %3h (%4)")
            .hexarg(fsysStoreHeader->Size).arg(fsysStoreHeader->Size)
            .hexarg(dataSize).arg(dataSize), parent);
        return ERR_SUCCESS;
    }

    // Get parsing data
    PARSING_DATA pdata = parsingDataFromQModelIndex(parent);

    // Construct header and body
    QByteArray header = store.left(sizeof(APPLE_FSYS_STORE_HEADER));
    QByteArray body = store.mid(sizeof(APPLE_FSYS_STORE_HEADER), fsysStoreHeader->Size - sizeof(APPLE_FSYS_STORE_HEADER) - sizeof(UINT32));

    // Check store checksum
    UINT32 storedCrc = *(UINT32*)store.right(sizeof(UINT32)).constBegin();
    UINT32 calculatedCrc = crc32(0, (const UINT8*)store.constData(), (const UINT32)store.size() - sizeof(UINT32));

    // Add info
    bool isGaidStore = (fsysStoreHeader->Signature == NVRAM_APPLE_GAID_STORE_SIGNATURE);
    QString name = isGaidStore ? QObject::tr("Gaid store") : QObject::tr("Fsys store");
    QString info = QObject::tr("Signature: %1\nFull size: %2h (%3)\nHeader size: %4h (%5)\nBody size: %6h (%7)\nUnknown0: %9h\nUnknown1: %10h\nCRC32: %11")
        .arg(isGaidStore ? QObject::tr("Gaid") : QObject::tr("Fsys"))
        .hexarg(fsysStoreHeader->Size).arg(fsysStoreHeader->Size)
        .hexarg(header.size()).arg(header.size())
        .hexarg(body.size()).arg(body.size())
        .hexarg2(fsysStoreHeader->Unknown0, 2)
        .hexarg2(fsysStoreHeader->Unknown1, 8)
        .arg(storedCrc == calculatedCrc ? QObject::tr("%1h, valid").hexarg2(storedCrc, 8) : QObject::tr("%1h, invalid, should be %2h").hexarg2(storedCrc, 8).hexarg2(calculatedCrc, 8));

    // Add correct offset
    pdata.offset = parentOffset;

    // Add tree item
    index = model->addItem(Types::FsysStore, 0, name, QString(), info, header, body, QByteArray(), true, parsingDataToQByteArray(pdata), parent);

    return ERR_SUCCESS;
}

STATUS FfsParser::parseEvsaStoreHeader(const QByteArray & store, const UINT32 parentOffset, const QModelIndex & parent, QModelIndex & index)
{
    const UINT32 dataSize = (const UINT32)store.size();

    // Check dataSize
    if (dataSize < sizeof(EVSA_STORE_ENTRY)) {
        msg(QObject::tr("parseEvsaStoreHeader: volume body is too small even for EVSA store header"), parent);
        return ERR_SUCCESS;
    }

    // Get EVSA store header
    const EVSA_STORE_ENTRY* evsaStoreHeader = (const EVSA_STORE_ENTRY*)store.constData();

    // Check store size
    if (dataSize < evsaStoreHeader->StoreSize) {
        msg(QObject::tr("parseEvsaStoreHeader: EVSA store size %1h (%2) is greater than volume body size %3h (%4)")
            .hexarg(evsaStoreHeader->StoreSize).arg(evsaStoreHeader->StoreSize)
            .hexarg(dataSize).arg(dataSize), parent);
        return ERR_SUCCESS;
    }

    // Get parsing data
    PARSING_DATA pdata = parsingDataFromQModelIndex(parent);

    // Construct header and body
    QByteArray header = store.left(evsaStoreHeader->Header.Size);
    QByteArray body = store.mid(evsaStoreHeader->Header.Size, evsaStoreHeader->StoreSize - evsaStoreHeader->Header.Size);

    // Recalculate checksum
    UINT8 calculated = calculateChecksum8(((const UINT8*)evsaStoreHeader) + 2, evsaStoreHeader->Header.Size - 2);

    // Add info
    QString name = QObject::tr("EVSA store");
    QString info = QObject::tr("Signature: EVSA\nFull size: %1h (%2)\nHeader size: %3h (%4)\nBody size: %5h (%6)\nType: %7h\nChecksum: %8\nAttributes: %9h")
        .hexarg(evsaStoreHeader->StoreSize).arg(evsaStoreHeader->StoreSize)
        .hexarg(header.size()).arg(header.size())
        .hexarg(body.size()).arg(body.size())
        .hexarg2(evsaStoreHeader->Header.Type, 2)
        .arg(evsaStoreHeader->Header.Checksum == calculated ?
            QObject::tr("%1h, valid").hexarg2(calculated, 2) :
            QObject::tr("%1h, invalid, should be %2h").hexarg2(evsaStoreHeader->Header.Checksum, 2).hexarg2(calculated, 2))
        .hexarg2(evsaStoreHeader->Attributes, 8);

    // Add correct offset
    pdata.offset = parentOffset;

    // Add tree item
    index = model->addItem(Types::EvsaStore, 0, name, QString(), info, header, body, QByteArray(), true, parsingDataToQByteArray(pdata), parent);

    return ERR_SUCCESS;
}

STATUS FfsParser::parseFlashMapStoreHeader(const QByteArray & store, const UINT32 parentOffset, const QModelIndex & parent, QModelIndex & index)
{
    const UINT32 dataSize = (const UINT32)store.size();

    // Check data size
    if (dataSize < sizeof(PHOENIX_FLASH_MAP_HEADER)) {
        msg(QObject::tr("parseFlashMapStoreHeader: volume body is too small even for FlashMap block header"), parent);
        return ERR_SUCCESS;
    }

    // Get FlashMap block header
    const PHOENIX_FLASH_MAP_HEADER* flashMapHeader = (const PHOENIX_FLASH_MAP_HEADER*)store.constData();

    // Check store size
    UINT32 flashMapSize = sizeof(PHOENIX_FLASH_MAP_HEADER) + flashMapHeader->NumEntries * sizeof(PHOENIX_FLASH_MAP_ENTRY);
    if (dataSize < flashMapSize) {
        msg(QObject::tr("parseFlashMapStoreHeader: FlashMap block size %1h (%2) is greater than volume body size %3h (%4)")
            .hexarg(flashMapSize).arg(flashMapSize)
            .hexarg(dataSize).arg(dataSize), parent);
        return ERR_SUCCESS;
    }

    // Get parsing data
    PARSING_DATA pdata = parsingDataFromQModelIndex(parent);

    // Construct header and body
    QByteArray header = store.left(sizeof(PHOENIX_FLASH_MAP_HEADER));
    QByteArray body = store.mid(sizeof(PHOENIX_FLASH_MAP_HEADER), flashMapSize - sizeof(PHOENIX_FLASH_MAP_HEADER));

    // Add info
    QString name = QObject::tr("Phoenix SCT flash map");
    QString info = QObject::tr("Signature: _FLASH_MAP\nFull size: %1h (%2)\nHeader size: %3h (%4)\nBody size: %5h (%6)\nNumber of entries: %7")
        .hexarg(flashMapSize).arg(flashMapSize)
        .hexarg(header.size()).arg(header.size())
        .hexarg(body.size()).arg(body.size())
        .arg(flashMapHeader->NumEntries);

    // Add correct offset
    pdata.offset = parentOffset;

    // Add tree item
    index = model->addItem(Types::FlashMapStore, 0, name, QString(), info, header, body, QByteArray(), true, parsingDataToQByteArray(pdata), parent);

    return ERR_SUCCESS;
}

STATUS FfsParser::parseCmdbStoreHeader(const QByteArray & store, const UINT32 parentOffset, const QModelIndex & parent, QModelIndex & index)
{
    const UINT32 dataSize = (const UINT32)store.size();
    
    // Check store size
    if (dataSize < sizeof(PHOENIX_CMDB_HEADER)) {
        msg(QObject::tr("parseCmdbStoreHeader: volume body is too small even for CMDB store header"), parent);
        return ERR_SUCCESS;
    }

    UINT32 cmdbSize = NVRAM_PHOENIX_CMDB_SIZE;
    if (dataSize < cmdbSize) {
        msg(QObject::tr("parseCmdbStoreHeader: CMDB store size %1h (%2) is greater than volume body size %3h (%4)")
            .hexarg(cmdbSize).arg(cmdbSize)
            .hexarg(dataSize).arg(dataSize), parent);
        return ERR_SUCCESS;
    }

    // Get store header
    const PHOENIX_CMDB_HEADER* cmdbHeader = (const PHOENIX_CMDB_HEADER*)store.constData();

    // Get parsing data
    PARSING_DATA pdata = parsingDataFromQModelIndex(parent);

    // Construct header and body
    QByteArray header = store.left(cmdbHeader->TotalSize);
    QByteArray body = store.mid(cmdbHeader->TotalSize, cmdbSize - cmdbHeader->TotalSize);

    // Add info
    QString name = QObject::tr("CMDB store");
    QString info = QObject::tr("Signature: CMDB\nFull size: %1h (%2)\nHeader size: %3h (%4)\nBody size: %5h (%6)")
        .hexarg(cmdbSize).arg(cmdbSize)
        .hexarg(header.size()).arg(header.size())
        .hexarg(body.size()).arg(body.size());

    // Add correct offset
    pdata.offset = parentOffset;

    // Add tree item
    index = model->addItem(Types::CmdbStore, 0, name, QString(), info, header, body, QByteArray(), true, parsingDataToQByteArray(pdata), parent);

    return ERR_SUCCESS;
}

STATUS FfsParser::parseSlicPubkeyHeader(const QByteArray & store, const UINT32 parentOffset, const QModelIndex & parent, QModelIndex & index)
{
    const UINT32 dataSize = (const UINT32)store.size();

    // Check data size
    if (dataSize < sizeof(OEM_ACTIVATION_PUBKEY)) {
        msg(QObject::tr("parseSlicPubkeyHeader: volume body is too small even for SLIC pubkey header"), parent);
        return ERR_SUCCESS;
    }

    // Get SLIC pubkey header
    const OEM_ACTIVATION_PUBKEY* pubkeyHeader = (const OEM_ACTIVATION_PUBKEY*)store.constData();

    // Check store size
    if (dataSize < pubkeyHeader->Size) {
        msg(QObject::tr("parseSlicPubkeyHeader: SLIC pubkey size %1h (%2) is greater than volume body size %3h (%4)")
            .hexarg(pubkeyHeader->Size).arg(pubkeyHeader->Size)
            .hexarg(dataSize).arg(dataSize), parent);
        return ERR_SUCCESS;
    }

    // Get parsing data
    PARSING_DATA pdata = parsingDataFromQModelIndex(parent);

    // Construct header and body
    QByteArray header = store.left(sizeof(OEM_ACTIVATION_PUBKEY));

    // Add info
    QString name = QObject::tr("SLIC pubkey");
    QString info = QObject::tr("Type: 0h\nFull size: %1h (%2)\nHeader size: %3h (%4)\nBody size: 0h (0)\n"
        "Key type :%5h\nVersion: %6h\nAlgorithm: %7h\nMagic: RSA1\nBit length: %8h\nExponent:%9h")
        .hexarg(pubkeyHeader->Size).arg(pubkeyHeader->Size)
        .hexarg(header.size()).arg(header.size())
        .hexarg2(pubkeyHeader->KeyType, 2)
        .hexarg2(pubkeyHeader->Version, 2)
        .hexarg2(pubkeyHeader->Algorithm, 8)
        .hexarg2(pubkeyHeader->BitLength, 8)
        .hexarg2(pubkeyHeader->Exponent, 8);

    // Add correct offset
    pdata.offset = parentOffset;

    // Add tree item
    index = model->addItem(Types::SlicData, Subtypes::PubkeySlicData, name, QString(), info, header, QByteArray(), QByteArray(), true, parsingDataToQByteArray(pdata), parent);

    return ERR_SUCCESS;
}

STATUS FfsParser::parseSlicMarkerHeader(const QByteArray & store, const UINT32 parentOffset, const QModelIndex & parent, QModelIndex & index)
{
    const UINT32 dataSize = (const UINT32)store.size();

    // Check data size
    if (dataSize < sizeof(OEM_ACTIVATION_MARKER)) {
        msg(QObject::tr("parseSlicMarkerHeader: volume body is too small even for SLIC marker header"), parent);
        return ERR_SUCCESS;
    }

    // Get SLIC marker header
    const OEM_ACTIVATION_MARKER* markerHeader = (const OEM_ACTIVATION_MARKER*)store.constData();

    // Check store size
    if (dataSize < markerHeader->Size) {
        msg(QObject::tr("parseSlicMarkerHeader: SLIC marker size %1h (%2) is greater than volume body size %3h (%4)")
            .hexarg(markerHeader->Size).arg(markerHeader->Size)
            .hexarg(dataSize).arg(dataSize), parent);
        return ERR_SUCCESS;
    }

    // Get parsing data
    PARSING_DATA pdata = parsingDataFromQModelIndex(parent);

    // Construct header and body
    QByteArray header = store.left(sizeof(OEM_ACTIVATION_MARKER));

    // Add info
    QString name = QObject::tr("SLIC marker");
    QString info = QObject::tr("Type: 1h\nFull size: %1h (%2)\nHeader size: %3h (%4)\nBody size: 0h (0)\n"
        "Version :%5h\nOEM ID: %6\nOEM table ID: %7\nWindows flag: WINDOWS\nSLIC version: %8h")
        .hexarg(markerHeader->Size).arg(markerHeader->Size)
        .hexarg(header.size()).arg(header.size())
        .hexarg2(markerHeader->Version, 8)
        .arg(QString::fromLatin1((const char*)&(markerHeader->OemId), sizeof(markerHeader->OemId)))
        .arg(QString::fromLatin1((const char*)&(markerHeader->OemTableId), sizeof(markerHeader->OemTableId)))
        .hexarg2(markerHeader->SlicVersion, 8);

    // Add correct offset
    pdata.offset = parentOffset;

    // Add tree item
    index = model->addItem(Types::SlicData, Subtypes::MarkerSlicData, name, QString(), info, header, QByteArray(), QByteArray(), true, parsingDataToQByteArray(pdata), parent);

    return ERR_SUCCESS;
}

STATUS FfsParser::parseIntelMicrocodeHeader(const QByteArray & store, const UINT32 parentOffset, const QModelIndex & parent, QModelIndex & index)
{
    const UINT32 dataSize = (const UINT32)store.size();

    // Check data size
    if (dataSize < sizeof(INTEL_MICROCODE_HEADER)) {
        msg(QObject::tr("parseIntelMicrocodeHeader: volume body is too small even for Intel microcode header"), parent);
        return ERR_SUCCESS;
    }

    // Get Intel microcode header
    const INTEL_MICROCODE_HEADER* ucodeHeader = (const INTEL_MICROCODE_HEADER*)store.constData();

    // Check store size
    if (dataSize < ucodeHeader->TotalSize) {
        msg(QObject::tr("parseIntelMicrocodeHeader: Intel microcode size %1h (%2) is greater than volume body size %3h (%4)")
            .hexarg(ucodeHeader->TotalSize).arg(ucodeHeader->TotalSize)
            .hexarg(dataSize).arg(dataSize), parent);
        return ERR_SUCCESS;
    }

    // Get parsing data
    PARSING_DATA pdata = parsingDataFromQModelIndex(parent);

    // Construct header and body
    QByteArray header = store.left(sizeof(INTEL_MICROCODE_HEADER));
    QByteArray body = store.mid(sizeof(INTEL_MICROCODE_HEADER), ucodeHeader->DataSize);

    //TODO: recalculate checksum

    // Add info
    QString name = QObject::tr("Intel microcode");
    QString info = QObject::tr("Revision: 1h\nFull size: %1h (%2)\nHeader size: %3h (%4)\nBody size: %5h (%6)\n"
        "Date: %7h\nCPU signature: %8h\nChecksum: %9h\nLoader revision: %10h\nCPU flags: %11h")
        .hexarg(ucodeHeader->TotalSize).arg(ucodeHeader->TotalSize)
        .hexarg(header.size()).arg(header.size())
        .hexarg(body.size()).arg(body.size())
        .hexarg2(ucodeHeader->Date, 8)
        .hexarg2(ucodeHeader->CpuSignature, 8)
        .hexarg2(ucodeHeader->Checksum, 8)
        .hexarg2(ucodeHeader->LoaderRevision, 8)
        .hexarg2(ucodeHeader->CpuFlags, 8);

    // Add correct offset
    pdata.offset = parentOffset;

    // Add tree item
    index = model->addItem(Types::Microcode, Subtypes::IntelMicrocode, name, QString(), info, header, body, QByteArray(), true, parsingDataToQByteArray(pdata), parent);

    return ERR_SUCCESS;
}

STATUS FfsParser::parseStoreHeader(const QByteArray & store, const UINT32 parentOffset, const QModelIndex & parent, QModelIndex & index)
{
    const UINT32 dataSize = (const UINT32)store.size();
    const UINT32* signature = (const UINT32*)store.constData();
    // Check store size
    if (dataSize < sizeof(UINT32)) {
        msg(QObject::tr("parseStoreHeader: volume body is too small even for store signature"), parent);
        return ERR_SUCCESS;
    }

    // Check signature and run parser function needed
    // VSS/SVS store
    if (*signature == NVRAM_VSS_STORE_SIGNATURE || *signature == NVRAM_APPLE_SVS_STORE_SIGNATURE) 
        return parseVssStoreHeader(store, parentOffset, parent, index);
    // FTW store
    else if (*signature == NVRAM_MAIN_STORE_VOLUME_GUID_DATA1 || *signature == EDKII_WORKING_BLOCK_SIGNATURE_GUID_DATA1) 
        return parseFtwStoreHeader(store, parentOffset, parent, index);
    // FDC store
    else if (*signature == NVRAM_FDC_VOLUME_SIGNATURE) 
        return parseFdcStoreHeader(store, parentOffset, parent, index);
    // Apple Fsys/Gaid store
    else if (*signature == NVRAM_APPLE_FSYS_STORE_SIGNATURE || *signature == NVRAM_APPLE_GAID_STORE_SIGNATURE) 
        return parseFsysStoreHeader(store, parentOffset, parent, index);
    // EVSA store
    else if (*(signature + 1) == NVRAM_EVSA_STORE_SIGNATURE) 
        return parseEvsaStoreHeader(store, parentOffset, parent, index);
    // Phoenix SCT flash map
    else if (*signature == NVRAM_PHOENIX_FLASH_MAP_SIGNATURE_PART1) 
        return parseFlashMapStoreHeader(store, parentOffset, parent, index);
    // Phoenix CMDB store
    else if (*signature == NVRAM_PHOENIX_CMDB_HEADER_SIGNATURE) 
        return parseCmdbStoreHeader(store, parentOffset, parent, index);
    // SLIC pubkey
    else if (*(signature + 4) == OEM_ACTIVATION_PUBKEY_MAGIC)
        return parseSlicPubkeyHeader(store, parentOffset, parent, index);
    // SLIC marker
    else if (*(const UINT64*)(store.constData() + 26) == OEM_ACTIVATION_MARKER_WINDOWS_FLAG)
        return parseSlicMarkerHeader(store, parentOffset, parent, index);
    // Intel microcode
    // Must be checked after SLIC marker because of the same *signature values
    else if (*signature == INTEL_MICROCODE_HEADER_VERSION)
        return parseIntelMicrocodeHeader(store, parentOffset, parent, index);

    msg(QObject::tr("parseStoreHeader: don't know how to parse a header with signature %1h").hexarg2(*signature, 8), parent);
    return ERR_SUCCESS;
}

STATUS FfsParser::parseVssStoreBody(const QModelIndex & index)
{
    // Sanity check
    if (!index.isValid())
        return ERR_INVALID_PARAMETER;

    // Get parsing data for the current item
    PARSING_DATA pdata = parsingDataFromQModelIndex(index);
    UINT32 parentOffset = pdata.offset + model->header(index).size();
    const QByteArray data = model->body(index);

    // Check that the is enough space for variable header
    const UINT32 dataSize = (UINT32)data.size();
    if (dataSize < sizeof(VSS_VARIABLE_HEADER)) {
        msg(QObject::tr("parseVssStoreBody: store body is too small even for VSS variable header"), index);
        return ERR_SUCCESS;
    }
    
    UINT32 offset = 0;

    // Parse all variables
    while (1) {
        bool isInvalid = false;
        bool isAuthenticated = false;
        bool isAppleCrc32 = false;
        
        UINT32 storedCrc32 = 0;
        UINT32 calculatedCrc32 = 0;
        UINT64 monotonicCounter = 0;
        EFI_TIME timestamp = { 0, 0, 0, 0, 0, 0, 0, 0, 0 };
        UINT32 pubKeyIndex = 0;

        UINT8 subtype = 0;
        QString name;
        QString text;
        EFI_GUID* variableGuid;
        CHAR16*   variableName;
        QByteArray header;
        QByteArray body;

        UINT32 unparsedSize = dataSize - offset;

        // Get variable header
        const VSS_VARIABLE_HEADER* variableHeader = (const VSS_VARIABLE_HEADER*)(data.constData() + offset);

        // Check variable header to fit in still unparsed data
        UINT32 variableSize = 0;
        if (unparsedSize >= sizeof(VSS_VARIABLE_HEADER) 
            && variableHeader->StartId == NVRAM_VSS_VARIABLE_START_ID) {

            // Apple VSS variable with CRC32 of the data  
            if (variableHeader->Attributes & NVRAM_VSS_VARIABLE_APPLE_DATA_CHECKSUM) {
                isAppleCrc32 = true;
                if (unparsedSize < sizeof(VSS_APPLE_VARIABLE_HEADER)) {
                    variableSize = 0;
                }
                else {
                    const VSS_APPLE_VARIABLE_HEADER* appleVariableHeader = (const VSS_APPLE_VARIABLE_HEADER*)variableHeader;
                    variableSize = sizeof(VSS_APPLE_VARIABLE_HEADER) + appleVariableHeader->NameSize + appleVariableHeader->DataSize;
                    variableGuid = (EFI_GUID*)&appleVariableHeader->VendorGuid;
                    variableName = (CHAR16*)(appleVariableHeader + 1);

                    header = data.mid(offset, sizeof(VSS_APPLE_VARIABLE_HEADER) + appleVariableHeader->NameSize);
                    body = data.mid(offset + header.size(), appleVariableHeader->DataSize);

                    // Calculate CRC32 of the variable data
                    storedCrc32 = appleVariableHeader->DataCrc32;
                    calculatedCrc32 = crc32(0, (const UINT8*)body.constData(), body.size());
                }
            }

            // Authenticated variable
            else if ((variableHeader->Attributes & NVRAM_VSS_VARIABLE_AUTHENTICATED_WRITE_ACCESS)
                || (variableHeader->Attributes & NVRAM_VSS_VARIABLE_TIME_BASED_AUTHENTICATED_WRITE_ACCESS)
                || (variableHeader->Attributes & NVRAM_VSS_VARIABLE_APPEND_WRITE)
                || (variableHeader->NameSize == 0 && variableHeader->DataSize == 0)) { // If both NameSize and DataSize are zeros, it's auth variable with zero montonic counter
                isAuthenticated = true;
                if (unparsedSize < sizeof(VSS_AUTH_VARIABLE_HEADER)) {
                    variableSize = 0;
                }
                else {
                    const VSS_AUTH_VARIABLE_HEADER* authVariableHeader = (const VSS_AUTH_VARIABLE_HEADER*)variableHeader;
                    variableSize = sizeof(VSS_AUTH_VARIABLE_HEADER) + authVariableHeader->NameSize + authVariableHeader->DataSize;
                    variableGuid = (EFI_GUID*)&authVariableHeader->VendorGuid;
                    variableName = (CHAR16*)(authVariableHeader + 1);

                    header = data.mid(offset, sizeof(VSS_AUTH_VARIABLE_HEADER) + authVariableHeader->NameSize);
                    body = data.mid(offset + header.size(), authVariableHeader->DataSize);

                    monotonicCounter = authVariableHeader->MonotonicCounter;
                    timestamp = authVariableHeader->Timestamp;
                    pubKeyIndex = authVariableHeader->PubKeyIndex;
                }
            }
            
            // Normal VSS variable
            if (!isAuthenticated && !isAppleCrc32) {
                variableSize = sizeof(VSS_VARIABLE_HEADER) + variableHeader->NameSize + variableHeader->DataSize;
                variableGuid = (EFI_GUID*)&variableHeader->VendorGuid;
                variableName = (CHAR16*)(variableHeader + 1);

                header = data.mid(offset, sizeof(VSS_VARIABLE_HEADER) + variableHeader->NameSize);
                body = data.mid(offset + header.size(), variableHeader->DataSize);
            }

            // There is also a case of authenticated Apple variables, but I haven't seen one yet

            // Check variable state
            if (variableHeader->State != NVRAM_VSS_VARIABLE_ADDED && variableHeader->State != NVRAM_VSS_VARIABLE_HEADER_VALID) {
                isInvalid = true;
            }
        }

        // Can't parse further, add the last element and break the loop
        if (!variableSize) {
            // Check if the data left is a free space or a padding
            QByteArray padding = data.mid(offset, unparsedSize);
            UINT8 type;

            if (padding.count(pdata.emptyByte) == padding.size()) {
                // It's a free space
                name = QObject::tr("Free space");
                type = Types::FreeSpace;
                subtype = 0;
            }
            else {
                // Nothing is parsed yet, but the store is not empty 
                if (!offset) {
                    msg(QObject::tr("parseVssStoreBody: store can't be parsed as VSS store"), index);
                    return ERR_SUCCESS;
                }

                // It's a padding
                name = QObject::tr("Padding");
                type = Types::Padding;
                subtype = getPaddingType(padding);
            }

            // Get info
            QString info = QObject::tr("Full size: %1h (%2)")
                .hexarg(padding.size()).arg(padding.size());
            
            // Construct parsing data
            pdata.offset = parentOffset + offset;
            
            // Add tree item
            model->addItem(type, subtype, name, QString(), info, QByteArray(), padding, QByteArray(), false, parsingDataToQByteArray(pdata), index);

            return ERR_SUCCESS;
        }

        QString info;
        
        // Rename invalid variables
        if (isInvalid) {
            name = QObject::tr("Invalid");
        }
        else { // Add GUID and text for valid variables
            name = guidToQString(*variableGuid);
            info += QObject::tr("Variable GUID: %1\n").arg(name);
            text = QString::fromUtf16(variableName);
        }

        // Add header, body and extended data info
        info += QObject::tr("Full size: %1h (%2)\nHeader size %3h (%4)\nBody size: %5h (%6)")
            .hexarg(variableSize).arg(variableSize)
            .hexarg(header.size()).arg(header.size())
            .hexarg(body.size()).arg(body.size());

        // Add state info
        info += QObject::tr("\nState: %1h").hexarg2(variableHeader->State, 2);

        // Add attributes info
        info += QObject::tr("\nAttributes: %1h (%2)").hexarg2(variableHeader->Attributes, 8).arg(vssAttributesToQString(variableHeader->Attributes));

        // Set subtype and add related info
        if (isInvalid)
            subtype = Subtypes::InvalidVssEntry;
        else if (isAuthenticated) {
            subtype = Subtypes::AuthVssEntry;
            info += QObject::tr("\nMonotonic counter: %1h\nTimestamp: %2\nPubKey index: %3")
                .hexarg(monotonicCounter).arg(efiTimeToQString(timestamp)).arg(pubKeyIndex);

        }
        else if (isAppleCrc32) {
            subtype = Subtypes::AppleVssEntry;
            info += QObject::tr("\nData checksum: %1h%2").hexarg2(storedCrc32, 8)
                .arg(storedCrc32 == calculatedCrc32 ? QObject::tr(", valid") : QObject::tr(", invalid, should be %1h").hexarg2(calculatedCrc32,8));
        }
        else
            subtype = Subtypes::StandardVssEntry;

        // Add correct offset to parsing data
        pdata.offset = parentOffset + offset;

        // Add tree item
        model->addItem(Types::VssEntry, subtype, name, text, info, header, body, QByteArray(), false, parsingDataToQByteArray(pdata), index);

        // Move to next variable
        offset += variableSize;
    }

    return ERR_SUCCESS;
}

STATUS FfsParser::parseFsysStoreBody(const QModelIndex & index)
{
    // Sanity check
    if (!index.isValid())
        return ERR_INVALID_PARAMETER;

    // Get parsing data for the current item
    PARSING_DATA pdata = parsingDataFromQModelIndex(index);
    UINT32 parentOffset = pdata.offset + model->header(index).size();
    const QByteArray data = model->body(index);

    // Check that the is enough space for variable header
    const UINT32 dataSize = (UINT32)data.size();
    UINT32 offset = 0;

    // Parse all variables
    while (1) {
        UINT32 unparsedSize = dataSize - offset;
        UINT32 variableSize = 0;

        // Get nameSize and name of the variable
        const UINT8 nameSize = *(UINT8*)(data.constData() + offset);
        // Check sanity
        if (unparsedSize >= nameSize + sizeof(UINT8)) {
            variableSize = nameSize + sizeof(UINT8);
        }

        QByteArray name;
        if (variableSize) {
            name = data.mid(offset + sizeof(UINT8), nameSize);
            // Check for EOF variable
            if (nameSize == 3 && name[0] == 'E' && name[1] == 'O' && name[2] == 'F') {
                // There is no data afterward, add EOF variable and free space and return
                QByteArray header = data.mid(offset, sizeof(UINT8) + nameSize);
                QString info = QObject::tr("Full size: %1h (%2)")
                    .hexarg(header.size()).arg(header.size());
                
                // Add correct offset to parsing data
                pdata.offset = parentOffset + offset;
                
                // Add EOF tree item
                model->addItem(Types::FsysEntry, 0, name, QString(), info, header, QByteArray(), QByteArray(), false, parsingDataToQByteArray(pdata), index);

                // Add free space
                offset += header.size();
                unparsedSize = dataSize - offset;
                QByteArray body = data.mid(offset);
                info = QObject::tr("Full size: %1h (%2)")
                    .hexarg(body.size()).arg(body.size());

                // Add correct offset to parsing data
                pdata.offset = parentOffset + offset;

                // Add free space tree item
                model->addItem(Types::FreeSpace, 0, QObject::tr("Free space"), QString(), info, QByteArray(), body, QByteArray(), false, parsingDataToQByteArray(pdata), index);

                return ERR_SUCCESS;
            }
        }

        // Get dataSize and data of the variable
        const UINT16 dataSize = *(UINT16*)(data.constData() + offset + sizeof(UINT8) + nameSize);
        if (unparsedSize >= sizeof(UINT8) + nameSize + sizeof(UINT16) + dataSize) {
            variableSize = sizeof(UINT8) + nameSize + sizeof(UINT16) + dataSize;
        }
        else {
            // Last variable is bad, add the rest as padding and return
            QByteArray body = data.mid(offset);
            QString info = QObject::tr("Full size: %1h (%2)")
                .hexarg(body.size()).arg(body.size());

            // Add correct offset to parsing data
            pdata.offset = parentOffset + offset;

            // Add free space tree item
            model->addItem(Types::Padding, getPaddingType(body), QObject::tr("Padding"), QString(), info, QByteArray(), body, QByteArray(), false, parsingDataToQByteArray(pdata), index);
            
            // Show message
            msg(QObject::tr("parseFsysStoreBody: next variable appears too big, added as padding"), index);

            return ERR_SUCCESS;
        }

        // Construct header and body
        QByteArray header = data.mid(offset, sizeof(UINT8) + nameSize + sizeof(UINT16));
        QByteArray body = data.mid(offset + sizeof(UINT8) + nameSize + sizeof(UINT16), dataSize);

        // Add info
        QString info = QObject::tr("Full size: %1h (%2)\nHeader size %3h (%4)\nBody size: %5h (%6)")
            .hexarg(variableSize).arg(variableSize)
            .hexarg(header.size()).arg(header.size())
            .hexarg(body.size()).arg(body.size());

        // Add correct offset to parsing data
        pdata.offset = parentOffset + offset;

        // Add tree item
        model->addItem(Types::FsysEntry, 0, name, QString(), info, header, body, QByteArray(), false, parsingDataToQByteArray(pdata), index);

        // Move to next variable
        offset += variableSize;
    }
    
    return ERR_SUCCESS;
}

STATUS FfsParser::parseEvsaStoreBody(const QModelIndex & index)
{
    // Sanity check
    if (!index.isValid())
        return ERR_INVALID_PARAMETER;

    // Get parsing data for the current item
    PARSING_DATA pdata = parsingDataFromQModelIndex(index);
    UINT32 parentOffset = pdata.offset + model->header(index).size();
    const QByteArray data = model->body(index);

    // Check that the is enough space for entry header
    const UINT32 dataSize = (UINT32)data.size();
    UINT32 offset = 0;

    std::map<UINT16, EFI_GUID> guidMap;
    std::map<UINT16, QString> nameMap;

    // Parse all entries
    UINT32 unparsedSize = dataSize;
    while (unparsedSize) {
        UINT32 variableSize = 0;
        QString name;
        QString info;
        QByteArray header;
        QByteArray body;
        UINT8 subtype;
        UINT8 calculated;

        const EVSA_ENTRY_HEADER* entryHeader = (const EVSA_ENTRY_HEADER*)(data.constData() + offset);

        // Check entry size
        variableSize = sizeof(EVSA_ENTRY_HEADER);
        if (unparsedSize < variableSize || unparsedSize < entryHeader->Size) {
            QByteArray body = data.mid(offset);
            QString info = QObject::tr("Full size: %1h (%2)")
                .hexarg(body.size()).arg(body.size());

            // Checke type
            QString name = QObject::tr("Free space");
            UINT8 type = Types::FreeSpace;
            UINT8 subtype = 0;
            if (getPaddingType(body) == Subtypes::DataPadding) {
                name = QObject::tr("Padding");
                type = Types::Padding;
                subtype = Subtypes::DataPadding;
            }

            // Add correct offset to parsing data
            pdata.offset = parentOffset + offset;

            // Add free space tree item
            QModelIndex itemIndex = model->addItem(type, subtype, name, QString(), info, QByteArray(), body, QByteArray(), false, parsingDataToQByteArray(pdata), index);
            
            // Show message
            if (type == Types::Padding)
                msg(QObject::tr("parseEvsaStoreBody: variable parsing failed, rest of unparsed store added as padding"), itemIndex);
            
            break;
        }
        variableSize = entryHeader->Size;

        // Recalculate entry checksum
        calculated = calculateChecksum8(((const UINT8*)entryHeader) + 2, entryHeader->Size - 2);

        // GUID entry
        if (entryHeader->Type == NVRAM_EVSA_ENTRY_TYPE_GUID1 || 
            entryHeader->Type == NVRAM_EVSA_ENTRY_TYPE_GUID2) {
            const EVSA_GUID_ENTRY* guidHeader = (const EVSA_GUID_ENTRY*)entryHeader;
            header = data.mid(offset, sizeof(EVSA_GUID_ENTRY));
            body = data.mid(offset + sizeof(EVSA_GUID_ENTRY), guidHeader->Header.Size - sizeof(EVSA_GUID_ENTRY));
            EFI_GUID guid = *(EFI_GUID*)body.constData();
            name = guidToQString(guid);
            info = QObject::tr("GUID: %1\nFull size: %2h (%3)\nHeader size %4h (%5)\nBody size: %6h (%7)\nType: %8h\nChecksum: %9\nGuidId: %10h")
                .arg(name)
                .hexarg(variableSize).arg(variableSize)
                .hexarg(header.size()).arg(header.size())
                .hexarg(body.size()).arg(body.size())
                .hexarg2(guidHeader->Header.Type, 2)
                .arg(guidHeader->Header.Checksum == calculated ?
                    QObject::tr("%1h, valid").hexarg2(calculated, 2) :
                    QObject::tr("%1h, invalid, should be %2h").hexarg2(guidHeader->Header.Checksum, 2).hexarg2(calculated, 2))
                .hexarg2(guidHeader->GuidId, 4);
            subtype = Subtypes::GuidEvsaEntry;
            guidMap.insert(std::pair<UINT16, EFI_GUID>(guidHeader->GuidId, guid));
        }
        // Name entry
        else if (entryHeader->Type == NVRAM_EVSA_ENTRY_TYPE_NAME1 ||
            entryHeader->Type == NVRAM_EVSA_ENTRY_TYPE_NAME2) {
            const EVSA_NAME_ENTRY* nameHeader = (const EVSA_NAME_ENTRY*)entryHeader;
            header = data.mid(offset, sizeof(EVSA_NAME_ENTRY));
            body = data.mid(offset + sizeof(EVSA_NAME_ENTRY), nameHeader->Header.Size - sizeof(EVSA_NAME_ENTRY));
            name = QString::fromUtf16((const CHAR16*)body.constData());
            info = QObject::tr("Name: %1\nFull size: %2h (%3)\nHeader size %4h (%5)\nBody size: %6h (%7)\nType: %8h\nChecksum: %9\nVarId: %10h")
                .arg(name)
                .hexarg(variableSize).arg(variableSize)
                .hexarg(header.size()).arg(header.size())
                .hexarg(body.size()).arg(body.size())
                .hexarg2(nameHeader->Header.Type, 2)
                .arg(nameHeader->Header.Checksum == calculated ?
                    QObject::tr("%1h, valid").hexarg2(calculated, 2) :
                    QObject::tr("%1h, invalid, should be %2h").hexarg2(nameHeader->Header.Checksum, 2).hexarg2(calculated, 2))
                .hexarg2(nameHeader->VarId, 4);
            subtype = Subtypes::NameEvsaEntry;
            nameMap.insert(std::pair<UINT16, QString>(nameHeader->VarId, name));
        }
        // Data entry
        else if (entryHeader->Type == NVRAM_EVSA_ENTRY_TYPE_DATA1 ||
            entryHeader->Type == NVRAM_EVSA_ENTRY_TYPE_DATA2 ||
            entryHeader->Type == NVRAM_EVSA_ENTRY_TYPE_DATA_INVALID) {
            const EVSA_DATA_ENTRY* dataHeader = (const EVSA_DATA_ENTRY*)entryHeader;
            // Check for extended header
            UINT32 headerSize = sizeof(EVSA_DATA_ENTRY);
            UINT32 dataSize = dataHeader->Header.Size - sizeof(EVSA_DATA_ENTRY);
            if (dataHeader->Attributes & NVRAM_EVSA_DATA_EXTENDED_HEADER) {
                const EVSA_DATA_ENTRY_EXTENDED* dataHeaderExtended = (const EVSA_DATA_ENTRY_EXTENDED*)entryHeader;
                headerSize = sizeof(EVSA_DATA_ENTRY_EXTENDED);
                dataSize = dataHeaderExtended->DataSize;
                variableSize = headerSize + dataSize;
            }

            header = data.mid(offset, headerSize);
            body = data.mid(offset + headerSize, dataSize);
            name = QObject::tr("Data");
            info = QObject::tr("Full size: %1h (%2)\nHeader size %3h (%4)\nBody size: %5h (%6)\nType: %7h\nChecksum: %8\nVarId: %9h\nGuidId: %10h\nAttributes: %11h (%12)")
                .hexarg(variableSize).arg(variableSize)
                .hexarg(headerSize).arg(headerSize)
                .hexarg(dataSize).arg(dataSize)
                .hexarg2(dataHeader->Header.Type, 2)
                .arg(dataHeader->Header.Checksum == calculated ?
                    QObject::tr("%1h, valid").hexarg2(calculated, 2) :
                    QObject::tr("%1h, invalid, should be %2h").hexarg2(dataHeader->Header.Checksum, 2).hexarg2(calculated, 2))
                .hexarg2(dataHeader->VarId, 4)
                .hexarg2(dataHeader->GuidId, 4)
                .hexarg2(dataHeader->Attributes, 8).arg(evsaAttributesToQString(dataHeader->Attributes));
            subtype = Subtypes::DataEvsaEntry;
        }
        // Unknown entry or free space
        else {
            QByteArray body = data.mid(offset);
            QString info = QObject::tr("Full size: %1h (%2)")
                .hexarg(body.size()).arg(body.size());

            // Check type
            QString name = QObject::tr("Free space");
            UINT8 type = Types::FreeSpace;
            UINT8 subtype = 0;
            if (getPaddingType(body) == Subtypes::DataPadding) {
                name = QObject::tr("Padding");
                type = Types::Padding;
                subtype = Subtypes::DataPadding;
            }

            // Add correct offset to parsing data
            pdata.offset = parentOffset + offset;

            // Add free space tree item
            QModelIndex itemIndex = model->addItem(type, subtype, name, QString(), info, QByteArray(), body, QByteArray(), false, parsingDataToQByteArray(pdata), index);

            // Show message
            if (type == Types::Padding)
                msg(QObject::tr("parseEvsaStoreBody: unknown variable of type %1h found at offset %2h, the rest of unparsed store added as padding").hexarg2(entryHeader->Type, 2).hexarg(offset), itemIndex);
            break;
        }

        // Add correct offset to parsing data
        pdata.offset = parentOffset + offset;

        // Add tree item
        model->addItem(Types::EvsaEntry, subtype, name, QString(), info, header, body, QByteArray(), false, parsingDataToQByteArray(pdata), index);

        // Move to next variable
        offset += variableSize;
        unparsedSize = dataSize - offset;
    }

    // Reparse all data variables to detect invalid ones and assign name and test to valid ones
    for (int i = 0; i < model->rowCount(index); i++) {
        QModelIndex current = index.child(i, 0);
        if (model->subtype(current) == Subtypes::DataEvsaEntry) {
            QByteArray header = model->header(current);
            const EVSA_DATA_ENTRY* dataHeader = (const EVSA_DATA_ENTRY*)header.constData();
            QString guid;
            if (guidMap.count(dataHeader->GuidId)) 
                guid = guidToQString(guidMap[dataHeader->GuidId]);
            QString name;
            if (nameMap.count(dataHeader->VarId))
                name = nameMap[dataHeader->VarId];
            
            // Check for variable validity
            if (guid.isEmpty() && name.isEmpty()) { // Both name and guid aren't found
                model->setSubtype(current, Subtypes::InvalidEvsaEntry);
                model->setName(current, QObject::tr("Invalid"));
                msg(QObject::tr("parseEvsaStoreBody: data variable with invalid GuidId and invalid VarId"), current);
            }
            else if (guid.isEmpty()) { // Guid not found
                model->setSubtype(current, Subtypes::InvalidEvsaEntry);
                model->setName(current, QObject::tr("Invalid"));
                msg(QObject::tr("parseEvsaStoreBody: data variable with invalid GuidId"), current);
            }
            else if (name.isEmpty()) { // Name not found
                model->setSubtype(current, Subtypes::InvalidEvsaEntry);
                model->setName(current, QObject::tr("Invalid"));
                msg(QObject::tr("parseEvsaStoreBody: data variable with invalid VarId"), current);
            }
            else { // Variable is OK, rename it
                if (dataHeader->Header.Type == NVRAM_EVSA_ENTRY_TYPE_DATA_INVALID) {
                    model->setSubtype(current, Subtypes::InvalidEvsaEntry);
                    model->setName(current, QObject::tr("Invalid"));
                }
                else {
                    model->setName(current, guid);
                }
                model->setText(current, name);
                model->addInfo(current, QObject::tr("GUID: %1\nName: %2\n").arg(guid).arg(name), false);
            }
        }
    }

    return ERR_SUCCESS;
}


STATUS FfsParser::parseFlashMapBody(const QModelIndex & index)
{
    // Sanity check
    if (!index.isValid())
        return ERR_INVALID_PARAMETER;

    // Get parsing data for the current item
    PARSING_DATA pdata = parsingDataFromQModelIndex(index);
    UINT32 parentOffset = pdata.offset + model->header(index).size();
    const QByteArray data = model->body(index);

    
    const UINT32 dataSize = (UINT32)data.size();
    UINT32 offset = 0;
    UINT32 unparsedSize = dataSize;
    // Parse all entries
    while (unparsedSize) {
        const PHOENIX_FLASH_MAP_ENTRY* entryHeader = (const PHOENIX_FLASH_MAP_ENTRY*)(data.constData() + offset);

        // Check entry size
        if (unparsedSize < sizeof(PHOENIX_FLASH_MAP_ENTRY)) {
            // Last variable is bad, add the rest as padding and return
            QByteArray body = data.mid(offset);
            QString info = QObject::tr("Full size: %1h (%2)")
                .hexarg(body.size()).arg(body.size());

            // Add correct offset to parsing data
            pdata.offset = parentOffset + offset;

            // Add free space tree item
            model->addItem(Types::Padding, getPaddingType(body), QObject::tr("Padding"), QString(), info, QByteArray(), body, QByteArray(), false, parsingDataToQByteArray(pdata), index);

            // Show message
            if (unparsedSize < entryHeader->Size)
                msg(QObject::tr("parseFlashMapBody: next entry appears too big, added as padding"), index);

            break;
        }

        QString name = guidToQString(entryHeader->Guid);
        
        // Construct header
        QByteArray header = data.mid(offset, sizeof(PHOENIX_FLASH_MAP_ENTRY));

        // Add info
        QString info = QObject::tr("Entry GUID: %1\nFull size: 24h (36)\nHeader size: 24h (36)\nBody size: 0h (0)\nEntry type: %2h\nData type: %3h\nMemory address: %4h\nSize: %5h\nOffset: %6h")
            .arg(name)
            .hexarg2(entryHeader->EntryType, 4)
            .hexarg2(entryHeader->DataType, 4)
            .hexarg2(entryHeader->PhysicalAddress, 8)
            .hexarg2(entryHeader->Size, 8)
            .hexarg2(entryHeader->Offset, 8);

        // Add correct offset to parsing data
        pdata.offset = parentOffset + offset;

        // Determine subtype
        UINT8 subtype = 0;
        switch (entryHeader->DataType) {
        case NVRAM_PHOENIX_FLASH_MAP_ENTRY_TYPE_VOLUME:
            subtype = Subtypes::VolumeFlashMapEntry;
            break;
        case NVRAM_PHOENIX_FLASH_MAP_ENTRY_TYPE_DATA_BLOCK:
            subtype = Subtypes::DataFlashMapEntry;
            break;
        }

        // Add tree item
        model->addItem(Types::FlashMapEntry, subtype, name, flashMapGuidToQString(entryHeader->Guid), info, header, QByteArray(), QByteArray(), true, parsingDataToQByteArray(pdata), index);

        // Move to next variable
        offset += sizeof(PHOENIX_FLASH_MAP_ENTRY);
        unparsedSize = dataSize - offset;
    }

    return ERR_SUCCESS;
}
