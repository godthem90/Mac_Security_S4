#include "stdafx.h"

void CDisassembler::WriteOperandTypeMASM( CTextFileBuffer *out_file, uint32 type ) {
    // Write type override before operand, e.g. "dword ", MASM syntax
    if (type & 0xF00) {
        type &= 0xF00;                             // Ignore element type for vectors
    }
    else {
        type &= 0xFF;                              // Use operand type only
    }

    switch (type) {
    case 1:  // 8 bits
        out_file->Put("byte ");  break;
    case 2:  // 16 bits
        out_file->Put("word ");  break;
    case 3:  // 32 bits
        out_file->Put("dword ");  break;
    case 4:  // 64 bits
        out_file->Put("qword ");  break;
    case 5:  // 80 bits
        if ((s.OpcodeDef->Destination & 0xFF) == 0xD) {
            // 64+16 bit far pointer. Not supported by MASM
            out_file->Put("fword ");
            s.OpComment = "64+16 bit. Need REX.W prefix";
        }
        else { 
            out_file->Put("tbyte ");}
        break;
    case 6: case 0x40: case 0x48: case 0:
        // Other size. Write nothing
        break;
    case 7: case 0x0D: // 48 bits or far
        out_file->Put("fword ");  
        if ((s.OpcodeDef->Destination & 0xFF) == 0xD && WordSize == 64) {
            // All assemblers I have tried forget the REX.W prefix here. Make a notice
            s.OpComment = "32+16 bit. Possibly forgot REX.W prefix"; 
        }      
        break;
    case 0x4A: // 16 bits float
        out_file->Put("word ");  break;
    case 0x43: // 32 bits float (x87)
    case 0x4B: // 32 bits float (SSE2)
        out_file->Put("dword ");  break;
    case 0x44: // 64 bits float
    case 0x4C: // 64 bits float (SSE2)
        out_file->Put("qword ");  break;
    case 0x45: // 80 bits float
        out_file->Put("tbyte ");  break;
    case 0x84: case 0x85: // far call
        out_file->Put("far ");  break;
    case 0x95: // 16 bits mask register
        out_file->Put("word ");  break;
    case 0x300:  // MMX
        out_file->Put("qword ");  break;
    case 0x400:  // XMM
        out_file->Put("xmmword ");  break;
    case 0x500:  // YMM
        out_file->Put("ymmword ");  break;
    case 0x600:  // ZMM
        out_file->Put("zmmword ");  break;
    case 0x700:  // future 1024 bit
        out_file->Put("?mmword ");  break;
    }
    out_file->Put("ptr ");
}

void CDisassembler::WriteOperandTypeYASM( CTextFileBuffer *out_file, uint32 type ) {
    // Write type override before operand, e.g. "dword", NASM/YASM syntax
    if (type & 0xF00) {
        type &= 0xF00;                             // Ignore element type for vectors
    }
    else {
        type &= 0xFF;                              // Use operand type only
    }
    uint32 Dest = s.OpcodeDef->Destination & 0xFF;// Destination operand
    if (Dest >= 0xB && Dest < 0x10) {
        // This is a pointer
        if (Dest < 0x0D) {
            out_file->Put("near ");                   // Near indirect jump/call
        }
        else {
            // Far pointer
            if ((WordSize == 16 && type == 3) || (WordSize == 32 && type == 7)) {
                out_file->Put("far ");
            }
            else {
                // Size currently not supported by YASM
                switch (type) {
                case 3: out_file->Put("far ");
                    s.OpComment = "16+16 bit. Needs 66H prefix";
                    break;
                case 7: out_file->Put("far ");  
                    s.OpComment = "32+16 bit. Possibly forgot REX.W prefix";
                    break;
                case 5: out_file->Put("far ");  
                    s.OpComment = "64+16 bit. Needs REX.W prefix";
                    break;
                }
            }
        }
        return;
    }
    switch (type) {
    case 1:  // 8 bits
        out_file->Put("byte ");  break;
    case 2:  // 16 bits
        out_file->Put("word ");  break;
    case 3:  // 32 bits
        out_file->Put("dword ");  break;
    case 4:  // 64 bits
        out_file->Put("qword ");  break;
    case 5:  // 80 bits
        out_file->Put("tbyte ");  break;
    case 7:  // 48 bits
        out_file->Put("fword ");  break;
    case 0x4A: // 16 bits float
        out_file->Put("word ");  break;
    case 0x43: // 32 bits float (x87)
    case 0x4B: // 32 bits float (SSE2)
        out_file->Put("dword ");  break;
    case 0x44: // 64 bits float
    case 0x4C: // 64 bits float (SSE2)
        out_file->Put("qword ");  break;
    case 0x45: // 80 bits float
        out_file->Put("tbyte ");  break;
    case 0x84: case 0x85: // far call
        out_file->Put("far ");  break;
    case 0x95: // 16 bits mask register
        out_file->Put("word ");  break;
    case 0x300:  // MMX
        out_file->Put("qword ");  break;
    case 0x400:  // XMM
        out_file->Put("oword ");  break;
    case 0x500:  // YMM
        out_file->Put("yword ");  break;
    case 0x600:  // ZMM
        out_file->Put("zword ");  break;
    case 0x700:  // Future 128 bytes
        out_file->Put("?word ");  break;
    default:; // Anything else: write nothing
    }
}

void CDisassembler::WriteOperandTypeGASM( CTextFileBuffer *out_file, uint32 type ) {
    // Write type override before operand, e.g. "dword ", GAS syntax
    if (type & 0xF00) {
        type &= 0xF00;                             // Ignore element type for vectors
    }
    else {
        type &= 0xFF;                              // Use operand type only
    }

    switch (type) {
    case 1:  // 8 bits
        out_file->Put("byte ");  break;
    case 2:  // 16 bits
        out_file->Put("word ");  break;
    case 3:  // 32 bits
        out_file->Put("dword ");  break;
    case 4:  // 64 bits
        out_file->Put("qword ");  break;
    case 5:  // 80 bits
        if ((s.OpcodeDef->Destination & 0xFF) == 0xD) {
            // 64+16 bit far pointer. Not supported by Gas
            out_file->Put("fword ");
            s.OpComment = "64+16 bit. Needs REX.W prefix";
        }
        else { 
            out_file->Put("tbyte ");}
        break;
    case 6: case 0x40: case 0x48: case 0:
        // Other size. Write nothing
        break;
    case 7:    // 48 bits
        out_file->Put("fword ");  
        if ((s.OpcodeDef->Destination & 0xFF) == 0xD && WordSize == 64) {
            // All assemblers I have tried forget the REX.W prefix here. Make a notice
            s.OpComment = "32+16 bit. Possibly forgot REX.W prefix"; 
        }      
        break;
    case 0x4A: // 16 bits float
        out_file->Put("word ");  break;
    case 0x43: // 32 bits float (x87)
    case 0x4B: // 32 bits float (SSE2)
        out_file->Put("dword ");  break;
    case 0x44: // 64 bits float
    case 0x4C: // 64 bits float (SSE2)
        out_file->Put("qword ");  break;
    case 0x45: // 80 bits float
        out_file->Put("tbyte ");  break;
    case 0x84: case 0x85: // far call
        out_file->Put("far ");  break;
    case 0x95: // 16 bits mask register
        out_file->Put("word ");  break;
    case 0x300:  // MMX
        out_file->Put("qword ");  break;
    case 0x400:  // XMM
        out_file->Put("xmmword ");  break;
    case 0x500:  // YMM
        out_file->Put("ymmword ");  break;
    case 0x600:  // ZMM
        out_file->Put("zmmword ");  break;
    case 0x700:  // future 1024 bit
        out_file->Put("?mmword ");  break;
    }
}

void CDisassembler::WriteOperandType( CTextFileBuffer *out_file, uint32 type ) {
    switch (Syntax) {
    case SUBTYPE_MASM:
        WriteOperandTypeMASM( out_file, type );  break;
    case SUBTYPE_YASM:
        WriteOperandTypeYASM( out_file, type );  break;
    case SUBTYPE_GASM:
        WriteOperandTypeGASM( out_file, type );  break;
    }
}

void CDisassembler::WriteStringInstruction( CTextFileBuffer *out_file ) {
    // Write string instruction or xlat instruction
    uint32 NumOperands = 0;                       // Number of operands written
    uint32 i;                                     // Loop index
    uint32 Segment;                               // Possible segment prefix

    if (!(s.OpcodeDef->AllowedPrefixes & 0x1100)) {
        // Operand size is 8 if operand size prefixes not allowed
        s.OperandSize = 8;
    }

    out_file->Tabulate(AsmTab1);                    // Tabulate

    if (Syntax != SUBTYPE_MASM && s.Prefixes[0] && (s.OpcodeDef->AllowedPrefixes & 4)) {
        // Get segment prefix
        Segment = GetSegmentRegisterFromPrefix();  // Interpret segment prefix
        // Write segment override
        out_file->Put(RegisterNamesSeg[Segment]);
        out_file->Put(" ");
    }     

    // Check repeat prefix
    if (s.OpcodeDef->AllowedPrefixes & 0x20) {
        if (s.Prefixes[3]) {
            // Repeat prefix
            out_file->Put("rep ");
        }
    }
    else if (s.OpcodeDef->AllowedPrefixes & 0x40) {
        if (s.Prefixes[3] == 0xF2) {
            // repne prefix
            out_file->Put("repne ");
        }
        else if (s.Prefixes[3] == 0xF3) {
            // repe prefix
            out_file->Put("repe ");
        }
    }

    // Write opcode name
    out_file->Put(s.OpcodeDef->Name);               // Opcode name

    if (Syntax == SUBTYPE_MASM
        && (((s.OpcodeDef->AllowedPrefixes & 4) && s.Prefixes[0]) 
        || ((s.OpcodeDef->AllowedPrefixes & 1) && s.Prefixes[1]))) {
            // Has segment or address size prefix. Must write operands explicitly
            out_file->Put(" ");                          // Space before operands

            // Check address size for pointer registers
            const char * * PointerRegisterNames;
            switch (s.AddressSize) {
            case 16:
                PointerRegisterNames = RegisterNames16;  break;
            case 32:
                PointerRegisterNames = RegisterNames32;  break;
            case 64:
                PointerRegisterNames = RegisterNames64;  break;
            default: 
                PointerRegisterNames = 0;  // should not occur
            }

            // Loop for possibly two operands
            for (i = 0; i < 2; i++) {
                if (s.Operands[i]) {
                    // Operand i defined
                    if (NumOperands++) {
                        // An operand before this one. Separate by ", "
                        out_file->Put(", ");
                    }
                    if (NumOperands == 1) {
                        // Write operand size for first operand
                        switch (s.OperandSize) {
                        case 8:
                            out_file->Put("byte  ");  break;
                        case 16:
                            out_file->Put("word  ");  break;
                        case 32:
                            out_file->Put("dword  ");  break;
                        case 64:
                            out_file->Put("qword  ");  break;
                        }
                    }
                    // Get segment
                    Segment = 1;                        // Default segment is DS
                    if (s.Prefixes[0]) {
                        Segment = GetSegmentRegisterFromPrefix(); // Interpret segment prefix
                    }
                    if ((s.Operands[i] & 0xCF) == 0xC2) {
                        Segment = 0;                      // Segment is ES regardless of prefix for [edi] operand
                    }
                    // Write segment override
                    out_file->Put(RegisterNamesSeg[Segment]);
                    out_file->Put(":");
                    // Opening "["
                    out_file->Put("[");

                    // Write pointer register
                    switch (s.Operands[i] & 0xCF) {
                    case 0xC0:  // [bx], [ebx] or [rbx]
                        out_file->Put(PointerRegisterNames[3]);  
                        break;
                    case 0xC1:  // [si], [esi] or [rsi]
                        out_file->Put(PointerRegisterNames[6]);  
                        break;
                    case 0xC2:  // [di], [edi] or [rdi]
                        out_file->Put(PointerRegisterNames[7]);  
                        break;
                    }
                    // Closing "]"
                    out_file->Put("]");
                }
            }
    }
    else {
        // We don't have to write the operands
        // Append suffix for operand size, except for xlat
        if ((s.Operands[1] & 0xCF) != 0xC0) {

            // Suffix for operand size
            uint32 i = s.OperandSize / 8;
            if (i <= 8) {
                static const char SizeSuffixes[] = " bw d   q"; // Table of suffixes
                out_file->Put(SizeSuffixes[i]);
            }
        }
    }
}

void CDisassembler::WriteRelocationTarget( CTextFileBuffer *out_file, uint32 irel, uint32 Context, int64 Addend ) {
    // Write cross reference, including addend, but not including segment override and []
    // irel = index into Relocations
    // Context:
    // 1      = Data definition
    // 2      = Immediate data field in instruction
    // 4      = Data address in instruction
    // 8      = Near jump/call destination
    // 0x10   = Far  jump/call destination
    // 0x100  = Self-relative address expected
    // Addend:  inline addend
    // Implicit parameters:
    // IBegin:  value of '$' operator
    // IEnd:    reference point for self-relative addressing
    // BaseReg, IndexReg

    uint32 RefFrame;                    // Target segment
    int32  Addend2 = 0;                 // Difference between '$' and reference point

    // Get relocation type
    uint32 RelType = Relocations[irel].Type;

    if (RelType & 0x60) {
        // Inline addend is already relocated. 
        // Ignore addend and treat as direct relocation
        RelType = 1;
        Addend = 0;
    }

    // Get relocation size
    uint32 RelSize = Relocations[irel].Size;

    // Get relocation addend
    Addend += Relocations[irel].Addend;

    // Get relocation target
    uint32 Target = Relocations[irel].TargetOldIndex;

    // Is offset operand needed?
    if (Syntax != SUBTYPE_YASM && (
        ((RelType & 0xB) && (Context & 2)) 
        || ((RelType & 8) && (Context & 0x108)))) {
            // offset operator needed to convert memory operand to immediate address
            out_file->Put("offset ");
    }

    // Is seg operand needed?
    if (RelType & 0x200) {
        // seg operator needed to convert memory operand to its segment
        out_file->Put("seg ");
    }

    // Is explicit segment or frame needed?
    if ((RelType & 0x408) && (Context & 0x11B)) {
        // Write name of segment/group frame
        RefFrame = Relocations[irel].RefOldIndex;
        if (!RefFrame) {
            // No frame. Use segment of symbol
            RefFrame = Symbols[Symbols.Old2NewIndex(Target)].Section;
        }
        if (RefFrame && RefFrame < Sections.GetNumEntries()) {
            // Write segment or group name
            const char * SecName = NameBuffer.Buf()+Sections[RefFrame].Name;
            out_file->Put(SecName);
            out_file->Put(":");
        }
    }

    // Is imagerel operator needed?
    if (RelType & 4) {
        // imagerel operator needed to get image-relative address
        out_file->Put("imagerel(");
    }

    // Adjust addend
    // Adjust offset if self-relative relocation expected and found
    if ((RelType & 2) && (Context & 0x108)) {
        // Self-relative relocation expected and found
        // Adjust by size of address field and immediate field
        Addend += IEnd - Relocations[irel].Offset;
    }
    // Subtract self-reference if unexpected self-relative relocation
    if ((RelType & 2) && !(Context & 0x108)) {
        // Self-relative relocation found but not expected
        // Fix difference between '$' and reference point
        Addend2 = Relocations[irel].Offset - IBegin;
        Addend -= Addend2;
    }
    // Add self-reference if self-relative relocation expected but not found
    if (!(RelType & 2) && (Context & 0x108)) {
        // Self-relative relocation expected but not found
        // Fix difference between '$' and reference point
        Addend += IEnd - IBegin;
    }

    if (RelType & 0x100) {
        // Target is a segment
        RefFrame = Symbols[Symbols.Old2NewIndex(Target)].Section;
        if (RefFrame && RefFrame < Sections.GetNumEntries()) {
            const char * SecName = NameBuffer.Buf()+Sections[RefFrame].Name;
            out_file->Put(SecName);
        }
        else {
            out_file->Put("undefined segment");
        }
    }
    else {
        // Target is a symbol

        // Find target symbol
        uint32 TargetSym = Symbols.Old2NewIndex(Target);

        // Check if Target is appropriate
        if (((Symbols[TargetSym].Type & 0x80000000) || (int32)Addend)
            && !(CodeMode == 1 && s.BaseReg)) {
                // Symbol is a start-of-section entry in symbol table, or has an addend
                // Look for a more appropriate symbol, except if code with base register
                uint32 sym, sym1, sym2 = 0;
                sym1 = Symbols.FindByAddress(Symbols[TargetSym].Section, Symbols[TargetSym].Offset + (int32)Addend, &sym2);
                for (sym = sym1; sym && sym <= sym2; sym++) {
                    if (Symbols[sym].Scope && !(Symbols[sym].Type & 0x80000000)) {
                        // Found a better symbol name for target address
                        TargetSym = sym;
                        Addend = Addend2;
                    }
                }
        }
        // Write name of target symbol
        out_file->Put(Symbols.GetName(TargetSym));

        if (Syntax == SUBTYPE_GASM && (
            RelType == 0x41 || RelType == 0x81 || RelType == 0x2002)) {
                // make PLT entry
                out_file->Put("@PLT");
        }
    }

    // End parenthesis if we started one
    if (RelType & 4) {
        out_file->Put(")");
    }

    // Subtract reference point, if any
    if (RelType & 0x10) {
        out_file->Put("-");
        // Write name of segment/group frame
        uint32 RefPoint = Relocations[irel].RefOldIndex;
        if (RefPoint) {
            // Reference point name valid
            out_file->Put(Symbols.GetNameO(RefPoint));
        }
        else {
            out_file->Put("Reference_Point_Missing");
        }
    }

    // Subtract self-reference if unexpected self-relative relocation
    if ((RelType & 2) && !(Context & 0x108)) {
        // Self-relative relocation found but not expected
        out_file->Put("-"); out_file->Put(HereOperator);
    }

    // Add self-reference if self-relative relocation expected but not found
    if (!(RelType & 2) && (Context & 0x108)) {
        // Self-relative relocation expected but not found
        out_file->Put("+"); out_file->Put(HereOperator);
    }

    // Write addend, if not zero
    if (Addend) {
        if (Addend < 0) {
            // Negative, write "-"
            out_file->Put("-");
            Addend = -Addend;
        }
        else {
            // Positive, write "+"
            out_file->Put("+");
        }

        // Write value as hexadecimal
        switch (RelSize) {
        case 1:
            out_file->PutHex((uint8)Addend, 1);
            break;
        case 2:
            out_file->PutHex((uint16)Addend, 2);
            break;
        case 4:
            out_file->PutHex((uint32)Addend, 2);
            break;
        case 6:
            out_file->PutHex((uint16)(Addend >> 32), 1);
            out_file->Put(":");
            out_file->PutHex((uint32)Addend, 1);
            break;
        case 8:
            out_file->PutHex((uint64)Addend, 2);
            break;
        default:
            out_file->Put("??"); // Should not occur
            break;
        }
    }
}


void CDisassembler::WriteImmediateOperand( CTextFileBuffer *out_file, uint32 Type ) {
    // Write immediate operand or direct jump/call address
    int    WriteFormat;                 // 0: unsigned, 1: signed, 2: hexadecimal
    int    Components = 0;              // Number of components in immediate operand       
    uint32 OSize;                       // Operand size
    uint32 FieldPointer;                // Pointer to field containing value
    uint32 FieldSize;                   // Size of field containing value
    int64  Value = 0;                   // Value of immediate operand

    // Check if far
    if ((Type & 0xFE) == 0x84) {
        // Write far 
        WriteOperandType( out_file, Type );
    }

    // Check if type override needed
    if ((s.OpcodeDef->AllowedPrefixes & 2) && s.Prefixes[4] == 0x66
        && (Opcodei == 0x68 || Opcodei == 0x6A)) {
            // Push immediate with non-default operand size needs type override
            WriteOperandType( out_file, s.OperandSize == 16 ? 2 : 3 );
    }

    FieldPointer = s.ImmediateField;
    FieldSize    = s.ImmediateFieldSize;

    if (Syntax == SUBTYPE_YASM && (Type & 0x0F) == 4 && FieldSize == 8) {
        // Write type override to make sure we get 8 bytes address in case there is a relocation here
        WriteOperandType( out_file, 4 );
    }

    if (Type & 0x200000) {
        if (FieldSize > 1) {
            // Uses second part of field. Single byte only
            FieldPointer += FieldSize-1;
            FieldSize = 1;
        }
        else {
            // Uses half a byte
            FieldSize = 0;
        }
    }

    // Get inline value
    switch (FieldSize) {
    case 0:  // 4 bits
        Value = Get<uint8>(FieldPointer) & 0x0F;
        break;

    case 1:  // 8 bits
        Value = Get<int8>(FieldPointer);  
        break;

    case 2:  // 16 bits
        Value = Get<int16>(FieldPointer);  break;

    case 6:  // 48 bits
        Value  = Get<int32>(FieldPointer);  
        Value += (uint64)Get<uint16>(FieldPointer + 4) << 32;  
        break;

    case 4:  // 32 bits
        Value = Get<int32>(FieldPointer);  break;

    case 8:  // 64 bits
        Value = Get<int64>(FieldPointer);  break;

    case 3:  // 16+8 bits ("Enter" instruction)
        if ((Type & 0xFF) == 0x12) {
            // First 16 bits
            FieldSize = 2; Value = Get<int16>(FieldPointer);  break;
        }
        // else continue in default case to get error message

    default:  // Other sizes should not occur
        err.submit(3000);  Value = -1;
    }

    // Check if relocation
    if (s.ImmediateRelocation) {
        // Write relocation target name
        uint32 Context = 2;
        if ((Type & 0xFC) == 0x80) Context = 8;     // Near jump/call destination
        if ((Type & 0xFC) == 0x84) Context = 0x10;  // Far jump/call destination

        // Write cross reference
        WriteRelocationTarget( out_file, s.ImmediateRelocation, Context, Value );

        // Remember that Value has been written
        Value = 0;
        Components++;
    }
    // Check if AAM or AAD
    if (Value == 10 && (Opcodei & 0xFE) == 0xD4) {
        // Don't write operand for AAM or AAD if = 10
        return;
    }

    // Write as unsigned, signed or hexadecimal:
    if ((Type & 0xF0) == 0x30 || (Type & 0xF0) == 0x80) {
        // Hexadecimal
        WriteFormat = 2;
    }
    else if (s.ImmediateFieldSize == 8) {
        // 64 bit constant
        if (Value == (int32)Value) {
            // Signed
            WriteFormat = 1;
        }
        else {
            // Hexadecimal
            WriteFormat = 2;
        }
    }
    else if ((Type & 0xF0) == 0x20) {
        // Signed
        WriteFormat = 1;
    }
    else {
        // Unsigned
        WriteFormat = 0;
    }

    if ((Type & 0xFC) == 0x80 && !s.ImmediateRelocation) {
        // Self-relative jump or call without relocation. Adjust immediate value
        Value += IEnd;                             // Get absolute address of target
		Value += SectionAddress; // jjh

		// jjh
		/*
        // Look for symbol at target address
        uint32 ISymbol = Symbols.FindByAddress(Section, (uint32)Value);
        if (ISymbol && (Symbols[ISymbol].Name || CodeMode == 1)) {
            // Symbol found. Write its name
            out_file->Put(Symbols.GetName(ISymbol));
            // No offset to write
            return;
        }
		*/
        // Target address has no name
        Type |= 0x4000;                            // Write target as hexadecimal
    }

    // Operand size
    if ((s.Operands[0] & 0xFFF) <= 0xA || (s.Operands[0] & 0xF0) == 0xA0) {
        // Destination is general purpose register
        OSize = s.OperandSize;
    }
    else {
        // Constant probably unrelated to destination size
        OSize = 8;
    }
    // Check if destination is 8 bit operand
    //if ((s.Operands[0] & 0xFF) == 1 || (s.Operands[0] & 0xFF) == 0xA1) OSize = 8;

    // Check if sign extended
    if (OSize > s.ImmediateFieldSize * 8) {
        if (WriteFormat == 2 && Value >= 0) {
            // Hexadecimal sign extended, not negative:
            // Does not need full length
            OSize = s.ImmediateFieldSize * 8;
        }
        else if (WriteFormat == 0) {
            // Unsigned and sign extended, change to signed
            WriteFormat = 1;
        }
    }

    OSize = 32; //jjh
    if (Components) {
        // There was a relocated name
        if (Value) {
            // Addend to relocation is not zero
            if (Value > 0 || WriteFormat != 1) {
                out_file->Put("+");                  // Put "+" between name and addend
            }
            else {
                out_file->Put("-");                  // Put "-" between name and addend
                Value = - Value;                  // Change sign to avoid another "-"
            }
        }
        else {
            // No addend to relocated name
            return;
        }
    }
    // Write value
    if (WriteFormat == 2) {
        // Write with hexadecimal number appropriate size
        switch (OSize) {
        case 8:  // 8 bits
            out_file->PutHex((uint8)Value, 1);  break;
        case 16:  // 16 bits
            if ((Type & 0xFC) == 0x84) {
                // Segment of far call
                out_file->PutHex((uint16)(Value >> 16), 1);
                out_file->Put(':');
            }
            out_file->PutHex((uint16)Value, 2);  break;
        case 32:  // 32 bits
        default:  // Should not occur
            if ((Type & 0xFC) == 0x84) {
                // Segment of far call
                out_file->PutHex((uint16)(Value >> 32), 1);
                out_file->Put(':');
            }
            out_file->PutHex((uint32)Value, 2);  break;
        case 64:  // 64 bits
            out_file->PutHex((uint64)Value, 2);  break;
        }
    }
    else {
        // Write as signed or unsigned decimal
        if (WriteFormat == 0) { // unsigned
            switch (OSize) {
            case 8:  // 8 bits
                Value &= 0x00FF;  break;
            case 16:  // 16 bits
                Value &= 0xFFFF;  break;
            }
        }
        out_file->PutDecimal((int32)Value, WriteFormat);  // Write value. Signed or usigned decimal
    }
}

void CDisassembler::WriteOtherOperand( CTextFileBuffer *out_file, uint32 Type ) {
    // Write other type of operand
    const char * * OpRegisterNames;               // Pointer to list of register names
    uint32 RegI = 0;                              // Index into list of register names

    switch (Type & 0x8FF) {
    case 0xA1:  // AL
        OpRegisterNames = RegisterNames8;
        break;
    case 0xA2:  // AX
        OpRegisterNames = RegisterNames16;
        break;
    case 0xA3:  // EAX
        OpRegisterNames = RegisterNames32;
        break;
    case 0xA4:  // RAX
        OpRegisterNames = RegisterNames64;
        break;
    case 0xAE:  // xmm0
        out_file->Put("xmm0");
        return;
    case 0xAF:  // ST(0)
        out_file->Put("st(0)");
        return;
    case 0xB1:  // 1
        out_file->Put("1");
        return;
    case 0xB2:  // DX
        OpRegisterNames = RegisterNames16;
        RegI = 2;
        break;
    case 0xB3: // CL
        OpRegisterNames = RegisterNames8;
        RegI = 1;
        break;
    default:
        out_file->Put("unknown operand");
        err.submit(3000);
        return;
    }
    // Write register name
    out_file->Put(OpRegisterNames[RegI]);
}

void CDisassembler::WriteRegOperand( CTextFileBuffer *out_file, uint32 Type ) {
    // Write register operand from reg bits
    uint32 Num = s.Reg;                           // Register number

    // Write register name
    WriteRegisterName( out_file, Num, Type );
}

void CDisassembler::WriteRMOperand( CTextFileBuffer *out_file, uint32 Type ) {
    // Write memory or register operand from mod/rm bits of mod/reg/rm byte 
    // and possibly SIB byte or direct memory operand to out_file->
    // Also used for writing direct memory operand

    if ((Type & 0xFF) == 0) {
        // No explicit operand
        return;
    }

    uint32 Components = 0;                        // Count number of addends inside []
    int64  Addend = 0;                            // Inline displacement or addend
    int AddressingMode = 0;                       // 0: 16- or 32 bit addressing mode
    // 1: 64-bit pointer
    // 2: 32-bit absolute in 64-bit mode
    // 4: 64-bit rip-relative
    // 8: 64-bit absolute
    // Check if register or memory
    if (s.Mod == 3) {
        // Register operand
        WriteRegisterName( out_file, s.RM, Type );
        return;
    }

    // Find addend, if any
    switch (s.AddressFieldSize) {
    case 1:  // 1 byte displacement
        Addend = Get<int8>(s.AddressField);
        break;
    case 2:  // 2 bytes displacement
        Addend = Get<int16>(s.AddressField);
        break;
    case 4:  // 4 bytes displacement
        Addend = Get<int32>(s.AddressField);
        if ((s.MFlags & 0x100) && !s.AddressRelocation) {
            // rip-relative
            Addend += ImageBase + uint64(SectionAddress + IEnd);
        }
        break;
    case 8:  // 8 bytes address
        Addend = Get<int64>(s.AddressField);
        break;
    }
    // Get AddressingMode
    if (s.AddressSize > 32) {
        if (s.MFlags & 0x100) {
            AddressingMode = 4;                     // 64-bit rip-relative
        }
        else if (s.AddressFieldSize == 8) {
            AddressingMode = 8;                     // 64-bit absolute
        }
        else if (s.AddressRelocation || (s.BaseReg==0 && s.IndexReg==0)) {
            AddressingMode = 2;                     // 32-bit absolute in 64-bit mode
        }
        else {
            AddressingMode = 1;                     // 64-bit pointer
        }
    }

    // Make exception for LEA with no type
    if (Opcodei == 0x8D) {
        Type = 0;
    }
    // Write type override
    if ((s.OpcodeDef->InstructionFormat & 0x1F) == 0x1E) {    
        WriteOperandType( out_file, Type & 0xFF );    // has vsib address: write element type rather than vector type
    }
    else if (!(s.OpcodeDef->Options & 0x800)) {
        WriteOperandType( out_file, Type );           // write operand type
    }

    if (Syntax != SUBTYPE_MASM) {
        // Write "[" around memory operands, before segment
        out_file->Put("[");
    }

    // Write segment prefix, if any
    if (s.Prefixes[0]) {
        out_file->Put(RegisterNamesSeg[GetSegmentRegisterFromPrefix()]);
        out_file->Put(":");
    }
    else if (!s.BaseReg && !s.IndexReg && (!s.AddressRelocation || (s.Warnings1 & 0x10000)) && Syntax != SUBTYPE_YASM) { 
        // No pointer register and no memory reference or wrong type of memory reference.
        // Write segment register to indicate that we have a memory operand
        out_file->Put("DS:");
    }

    if (Syntax == SUBTYPE_MASM) {
        // Write "[" around memory operands, after segment
        out_file->Put("[");
    }

    if (Syntax == SUBTYPE_YASM && (AddressingMode & 0x0E)) {
        // Specify absolute or relative addressing mode
        switch (AddressingMode) {
        case 2: out_file->Put("abs ");  break;
        case 4: out_file->Put("rel ");  break;
        case 8: out_file->Put("abs qword ");  break;
        }
    }

    // Write relocation target, if any
    if (s.AddressRelocation) {
        // Write cross reference
        WriteRelocationTarget( out_file, s.AddressRelocation, 4 | (s.MFlags & 0x100), Addend );
        // Addend has been written, don't write it again
        Addend = 0;
        // Remember that something has been written
        Components++;
    }

    // Check address size for pointer registers
    //const char * * PointerRegisterNames;
    uint32 RegisterType = 0;
    switch (s.AddressSize) {
    case 16:
        RegisterType = 2;  break;
    case 32:
        RegisterType = 3;  break;
    case 64:
        RegisterType = 4;  break;
    }

    // Write base register, if any
    if (s.BaseReg) {
        if (Components++) out_file->Put("+");      // Put "+" if anything before
        WriteRegisterName( out_file, s.BaseReg - 1, RegisterType ); 
    }

    // Write index register, if any
    if (s.IndexReg) {
        if (Components++) out_file->Put("+");        // Put "+" if anything before
        if ((s.OpcodeDef->InstructionFormat & 0x1F) != 0x1E) {
            // normal index register
            WriteRegisterName( out_file, s.IndexReg - 1, RegisterType ); 
        }
        else {
            // VSIB byte specifies vector index register
            WriteRegisterName( out_file, s.IndexReg - 1, Type & 0xF00 ); 
        }
        // Write scale factor, if any
        if (s.Scale) {
            out_file->Put("*");
            out_file->PutDecimal(1 << s.Scale);
        }
    }

    // Write +/- before addend
    if (Components && Addend) {
        // Displacement comes after base/index registers
        if (Addend >= 0 || s.AddressFieldSize == 8) {
            // Positive. Write +
            out_file->Put("+");
        }
        else {
            // Negative. Write -
            out_file->Put("-");
            Addend = -Addend;
        }
    }

    if (Addend || Components == 0) {
        // Find minimum number of digits needed
        uint32 AddendSize = s.AddressFieldSize;
        if ((uint64)Addend < 0x100 && AddendSize > 1) AddendSize = 1;
        else if ((uint64)Addend < 0x10000 && AddendSize > 2) AddendSize = 2;

        // Write address or addend as hexadecimal
        out_file->PutHex((uint64)Addend, 2);

        // Check if offset multiplier needed
        if (s.OffsetMultiplier && s.AddressFieldSize == 1 && Addend) {
            out_file->Put("*");
            out_file->PutHex(s.OffsetMultiplier, 2);
        }
    }

    if (Syntax == SUBTYPE_GASM && (AddressingMode == 4)) {
        // Need to specify rip-relative address
        out_file->Put("+rip");
    }

    // End with "]"
    out_file->Put("]");
}

void CDisassembler::WriteRegisterName( CTextFileBuffer *out_file, uint32 Value, uint32 Type ) {
    // Write name of register to OutFile
    if (Type & 0xF00) {
        // vector register
        Type &= 0xF00;
    }
    else {
        // Other register
        Type &= 0xFF;                              // Remove irrelevant bits
    }

    // Check fixed registers (do not depend on Value)
    switch (Type) {
    case 0xA1:  // al
        Type = 1;  Value = 0;
        break;

    case 0xA2:  // ax
        Type = 2;  Value = 0;
        break;

    case 0xA3:  // eax
        Type = 3;  Value = 0;
        break;

    case 0xA4:  // rax
        Type = 4;  Value = 0;
        break;

    case 0xAE:  // xmm0
        Type = 0x400;  Value = 0;
        break;

    case 0xAF:  // st(0)
        Type = 0x40;  Value = 0;
        break;

    case 0xB2:  // dx
        Type = 2;  Value = 2;
        break;

    case 0xB3:  // cl
        Type = 1;  Value = 1;
        break;
    }

    // Get register number limit
    uint32 RegNumLimit = 7;    // largest register number
    if (WordSize >= 64) {
        RegNumLimit = 15;
        if ((s.Prefixes[6] & 0x40) && (Type & 0xF40)) {
            // EVEX or MVEX prefix and vector
            RegNumLimit = 31;
        }
    }

    switch (Type) {
    case 0x91:     // segment register
        RegNumLimit = 5;
        break;
    case 0x300:  // mmx
    case 0x40:   // st register         
    case 0x95:   // k mask register
        RegNumLimit = 7;
        break;
    case 0x98:   // bounds register
        RegNumLimit = 3;
        break;
    }
    if (Value > RegNumLimit) {
        // register number out of range
        out_file->Put("unknown register ");
        switch (Type) {
        case 1:
            out_file->Put("(8 bit) ");  break;
        case 2:
            out_file->Put("(16 bit) ");  break;
        case 3:
            out_file->Put("(32 bit) ");  break;
        case 4:
            out_file->Put("(64 bit) ");  break;
        case 0x40:   // st register
            out_file->Put("st");  break;
        case 0x91:  // Segment register
            out_file->Put("seg");  break;
        case 0x92:  // Control register
            out_file->Put("cr");  break;
        case 0x95:  // k mask register
            out_file->Put("k");  break;
        case 0x300:  // mmx register
            out_file->Put("mm");  break;
        case 0x400:  // xmm register
            out_file->Put("xmm");  break;
        case 0x500:  // ymm register
            out_file->Put("ymm");  break;
        case 0x600:  // zmm register
            out_file->Put("zmm");  break;
        case 0x700:  // future 1024 bit register
            out_file->Put("?mm");  break;
        }
        out_file->PutDecimal(Value);
    }
    else {
        // Write register name depending on type
        switch (Type) {
        case 1:  // 8 bit register. Depends on any REX prefix
            out_file->Put(s.Prefixes[7] ? RegisterNames8x[Value] : RegisterNames8[Value & 7]);
            break;

        case 2:  // 16 bit register
            out_file->Put(RegisterNames16[Value]);
            break;

        case 3:  // 32 bit register
            out_file->Put(RegisterNames32[Value]);
            break;

        case 4:  // 64 bit register
            out_file->Put(RegisterNames64[Value]);
            break;

        case 0x300:  // mmx register
            out_file->Put("mm");
            out_file->PutDecimal(Value);
            break;

        case 0x400:  // xmm register (packed integer or float)
        case 0x48: case 0x4B: case 0x4C: // xmm register (scalar float)
            out_file->Put("xmm");
            out_file->PutDecimal(Value);
            break;

        case 0x500:  // ymm register (packed)
            out_file->Put("ymm");
            out_file->PutDecimal(Value);
            break;

        case 0x600:  // zmm register (packed)
            out_file->Put("zmm");
            out_file->PutDecimal(Value);
            break;

        case 0x700:  // future 1024 bit register
            out_file->Put("?mm");
            out_file->PutDecimal(Value);
            break;

        case 0x40:  // st register
            if (Syntax == SUBTYPE_YASM) {
                // NASM, YASM and GAS-AT&T use st0
                out_file->Put("st");
                out_file->PutDecimal(Value);
            }
            else {
                // MASM and GAS-Intel use st(0), 
                out_file->Put("st(");
                out_file->PutDecimal(Value);
                out_file->Put(")");
            }
            break;

        case 0x91:  // Segment register
            out_file->Put(RegisterNamesSeg[Value & 7]);
            break;

        case 0x92:  // Control register
            out_file->Put(RegisterNamesCR[Value]);
            break;

        case 0x93:  // Debug register
            out_file->Put("dr");
            out_file->PutDecimal(Value);
            break;

        case 0x94:  // Test register (obsolete)
            out_file->Put("tr");
            out_file->PutDecimal(Value);
            break;

        case 0x95:  // k mask register
            out_file->Put("k");
            out_file->PutDecimal(Value);
            break;

        case 0x98:  // bounds register
            out_file->Put("bnd");
            out_file->PutDecimal(Value);
            break;

        case 0xB1:  // 1
            out_file->Put("1");
            break;

        default:    // Unexpected
            out_file->Put("UNKNOWN REGISTER TYPE ");
            out_file->PutDecimal(Value);
            break;
        }
    }
}

void CDisassembler::WriteShortRegOperand( CTextFileBuffer *out_file, uint32 Type ) {
    // Write register operand from lower 3 bits of opcode byte to OutFile
    uint32 rnum = Get<uint8>(s.OpcodeStart2) & 7;
    // Check REX.B prefix
    if (s.Prefixes[7] & 1) rnum |= 8;             // Add 8 if REX.B prefix
    // Write register name
    WriteRegisterName( out_file, rnum, Type );
}

void CDisassembler::WriteDREXOperand( CTextFileBuffer *out_file, uint32 Type ) {
    // Write register operand from dest bits of DREX byte (AMD only)
    uint32 Num = s.Vreg >> 4;                    // Register number
    // Write register name
    WriteRegisterName( out_file, Num, Type );
}

void CDisassembler::WriteVEXOperand( CTextFileBuffer *out_file, uint32 Type, int i ) {
    // Write register operand from VEX.vvvv bits or immediate bits
    uint32 Num;                                   // Register number
    switch (i) {
    case 0:  // Use VEX.vvvv bits
        Num = s.Vreg & 0x1F;  break;
    case 1:  // Use immediate bits 4-7
        Num = Get<uint8>(s.ImmediateField) >> 4;  break;
    case 2:  // Use immediate bits 0-3 (Unused. For possible future use)
        Num = Get<uint8>(s.ImmediateField) & 0x0F;  break;
    default:
        Num = 0;
    }
    // Write register name
    WriteRegisterName( out_file, Num, Type );
}

void CDisassembler::WriteOperandAttributeEVEX( CTextFileBuffer *out_file, int i, int isMem ) {
    // Write operand attributes and instruction attributes from EVEX z, LL, b and aaa bits
    // i = operand number (0 = destination, 1 = first source, 2 = second source, 
    // 98 = after last SIMD operand, 99 = after last operand)
    // isMem: true if memory operand, false if register operand
    uint32 swiz = s.OpcodeDef->EVEX;   // indicates meaning of EVEX attribute bits

    if ((swiz & 0x30) && (i == 0 || (s.OpcodeDef->Destination == 0 && i == 1))) {  // first operand
        // write mask
        if (s.Kreg || (swiz & 0xC0)) {
            out_file->Put(" {k");
            out_file->PutDecimal(s.Kreg);
            out_file->Put("}");
            if ((swiz & 0x20) && (s.Esss & 8)) {
                // zeroing
                out_file->Put("{z}");
            }
        }
    }
    if (swiz & 0x07) {
        // broadcast, rounding or sae allowed
        if (isMem && i < 8) {
            // memory operand
            if ((swiz & 0x01) && (s.Esss & 1)) {            
                // write memory broadcast
                // calculate broadcast factor
                uint32 op = s.Operands[i];  // operand
                uint32 elementsize = GetDataElementSize(op); // element size
                uint32 opv = s.Operands[0];  // any vector operand
                if (!(opv & 0xF00)) opv = s.Operands[1]; // first operand is not a vector, use next
                uint32 vectorsize  = GetDataItemSize(opv); // vector size
                if (vectorsize > elementsize) { // avoid broadcasting to scalar
                    if (elementsize) { // avoid division by zero
                        out_file->Put(" {1to");
                        out_file->PutDecimal(vectorsize/elementsize);
                        out_file->Put("}");
                    }
                    else {
                        out_file->Put("{unknown broadcast}");
                    }
                }
            }
        }
        if (i == 98 && s.Mod == 3) {   // after last SIMD operand. no memory operand
            // NASM has rounding mode and sae decoration after last SIMD operand with a comma.
            // No spec. for other assemblers available yet (2014). 
            // use i == 99 if it should be placed after last operand.
            // Perhaps the comma should be removed for other assemblers?
            if ((swiz & 0x4) && (s.Esss & 1)) {
                // write rounding mode
                uint32 rounding = (s.Esss >> 1) & 3;
                out_file->Put(", {");
                out_file->Put(EVEXRoundingNames[rounding]);
                out_file->Put("}");
            }
            else if ((swiz & 0x2) && (s.Esss & 1)) {
                // no rounding mode. write sae
                out_file->Put(", {");
                out_file->Put(EVEXRoundingNames[4]);
                out_file->Put("}");
            }
        }
    }
}

void CDisassembler::WriteOperandAttributeMVEX( CTextFileBuffer *out_file, int i, int isMem ) {
    // Write operand attributes and instruction attributes from MVEX sss, e and kkk bits.
    // i = operand number (0 = destination, 1 = first source, 2 = second source, 99 = after last operand)
    // isMem: true if memory operand, false if register operand
    uint32 swiz = s.OpcodeDef->MVEX;   // indicates meaning of MVEX attribute bits
    const int R_sae_syntax = 0;   // syntax alternatives for rounding mode + sae
                                  // 0: {rn-sae}, 1: {rn}{sae}
    const char * text = 0;        // temporary text pointer

    if ((swiz & 0x1000) && (i == 0 || (s.OpcodeDef->Destination == 0 && i == 1))) {  // first operand
        // write mask
        if (s.Kreg || (swiz & 0x2000)) {
            out_file->Put(" {k");
            out_file->PutDecimal(s.Kreg);
            out_file->Put("}");
        }
    }
    if (swiz & 0x1F) {
        // swizzle allowed    
        if (isMem && i < 90) {
            // write memory broadcast/up/down conversion
            text = s.SwizRecord->name;
            if (text && *text) {
                out_file->Put(" {");  out_file->Put(text);  out_file->Put("}");
            }
        }
        //if (i == 2 || ((s.OpcodeDef->Source2 & 0xF0F00) == 0 && i == 1)) {
        if (i == 98) {   // after last SIMD operand
            // last register or memory operand
            if (s.Mod == 3 && !((swiz & 0x700) && (s.Esss & 8))) { // skip alternative meaning of sss field for register operand when E=1
                // write register swizzle
                text = s.SwizRecord->name;
                if (text && *text) {
                    out_file->Put(" {");  out_file->Put(text);  out_file->Put("}");
                }
            }
        }
        if (i == 99) {   // after last operand
            if (s.Mod == 3 && (swiz & 0x300) && (s.Esss & 8)) {            
                // alternative meaning of sss field for register operand when E=1
                switch (swiz & 0x300) {
                case 0x100:  // rounding mode and not sae
                    text = SwizRoundTables[0][0][s.Esss & 3].name;
                    break;
                case 0x200:  // suppress all exceptions
                    if ((s.Esss & 4) && !(swiz & 0x800)) text = "sae";
                    break;
                case 0x300:  // rounding mode and sae
                    text = SwizRoundTables[0][R_sae_syntax][s.Esss & 7].name;
                    break;
                }
            }
            if (text && *text) {
                out_file->Put(", {");  out_file->Put(text);  out_file->Put("}");
            }
        }
    }
    if (isMem && (s.Esss & 8) && !(swiz & 0x800)) {
        // cache eviction hint after memory operand
        out_file->Put(" {eh}");
    }
}

void CDisassembler::WriteInstruction( CTextFileBuffer *out_file ) {
    // Write instruction and operands
    uint32 NumOperands = 0;                       // Number of operands written
    uint32 i;                                     // Loop index
    const char * OpName;                          // Opcode name

    if (CodeMode & 6) {
        // Code is dubious. Show as comment only
        out_file->Put(CommentSeparator);             // Start comment
    }
    else if ((s.OpcodeDef->Options & 0x20) && s.OpcodeStart1 > IBegin) {
        // Write prefixes explicitly. 
        // This is used for rare cases where the assembler cannot generate the prefix
        out_file->Tabulate(AsmTab1);                 // Tabulate
        out_file->Put(Syntax == SUBTYPE_GASM ? ".byte " : "DB ");
        out_file->Tabulate(AsmTab2);                 // Tabulate
        for (i = IBegin; i < s.OpcodeStart1; i++) {
            if (i > IBegin) out_file->Put(", ");
            out_file->PutHex(Get<uint8>(i), 1);
        }
        out_file->Tabulate(AsmTab3);                 // Tabulate
        out_file->Put(CommentSeparator);
        if ((s.OpcodeDef->AllowedPrefixes & 8) && Get<uint8>(IBegin) == 0xF2) {
            out_file->Put("BND prefix coded explicitly");    // Comment
        }
        else {        
            out_file->Put("Prefix coded explicitly");    // Comment
        }
        out_file->NewLine();
    }

    if ((s.Operands[0] & 0xF0) == 0xC0 || (s.Operands[1] & 0xF0) == 0xC0) {
        // String instruction or xlat instruction
        WriteStringInstruction( out_file );
        return;
    }

    //out_file->Tabulate(AsmTab1);                     // Tabulate
	out_file->Put(" ");	// jjh

    if ((s.OpcodeDef->AllowedPrefixes & 0xC40) == 0xC40) {
        switch (s.Prefixes[5]) {
        case 0xF2:
            out_file->Put("xacquire ");  break;      // xacquire prefix
        case 0xF3:
            out_file->Put("xrelease ");  break;      // xrelease prefix
        }
    }
    if (s.Prefixes[2]) {
        out_file->Put("lock ");                      // Lock prefix
    }

    // Get opcode name
    if (s.OpcodeDef->Name) {
        // Opcode name
        OpName = s.OpcodeDef->Name;
        // Search for opcode comment
        s.OpComment = strchr(OpName, ';');
        if (s.OpComment) s.OpComment++;            // Point to after ';'
    }
    else {
        OpName = "UNDEFINED";                      // Undefined code with no name
        s.OpComment = 0;
    }

    // Check prefix option
    if ((s.OpcodeDef->Options & 2) && (s.Prefixes[7] & 0x30)) {
        // Put prefix 'v' for VEX-prefixed instruction
        out_file->Put('v');
    }

    // Write opcode name
    if (s.OpComment) {
        // OpName string contains opcode name and comment, separated by ';'
        while (*OpName != ';' && *OpName != 0) {   // Write opcode name until comment
            out_file->Put(*(OpName++));
        }
    }
    else {
        out_file->Put(OpName);                       // Write normal opcode name
    }

    // Check suffix option
    if (s.OpcodeDef->Options & 1) {
        // Append suffix for operand size or type to name
        if ((s.OpcodeDef->AllowedPrefixes & 0x7000) == 0x1000) {
            // F.P. operand size defined by W prefix bit
            i = s.Prefixes[7] & 8;  // W prefix bit
            out_file->Put(i ? 'd' : 's');
        }
        else if ((s.OpcodeDef->AllowedPrefixes & 0x7000) == 0x3000) {
            // Integer or f.p. operand size defined by W prefix bit
            bool f = false;
            // Find out if operands are integer or f.p.
            for (i = 0; i < s.MaxNumOperands; i++) {
                if ((s.Operands[i] & 0xF0) == 0x40) {
                    f = true; break;
                }
            }
            i = s.Prefixes[7] & 8;  // W prefix bit
            if (f) {
                out_file->Put(i ? 'd' : 's');  // float precision suffix
            }
            else {            
                out_file->Put(i ? 'q' : 'd');  // integer size suffix
            }
        }
        else if ((s.OpcodeDef->AllowedPrefixes & 0x7000) == 0x4000) {
            // Integer operand size defined by W prefix bit
            i = s.Prefixes[7] & 8;  // W prefix bit
            out_file->Put(i ? 'w' : 'b');
        }
        else if ((s.OpcodeDef->AllowedPrefixes & 0x7000) == 0x5000) {
            // mask register operand size defined by W prefix bit and 66 prefix
            i  = (s.Prefixes[7] & 8) >> 2;      // W prefix bit
            i |= s.Prefixes[5] != 0x66;         // 66 prefix bit
            out_file->Put("bwdq"[i]);
        }
        else if (s.OpcodeDef->AllowedPrefixes & 0xE00) {
            // F.P. operand type and size defined by prefixes
            switch (s.Prefixes[5]) {
            case 0:     // No prefix = ps
                out_file->Put("ps");  break;
            case 0x66:  // 66 prefix = pd
                out_file->Put("pd");  break;
            case 0xF3:  // F3 prefix = ss
                out_file->Put("ss");  break;
            case 0xF2:  // F2 prefix = sd
                out_file->Put("sd");  break;
            default:
                err.submit(9000); // Should not occur
            }
        }
        else if (s.OpcodeDef->AllowedPrefixes & 0x100){
            // Integer operand size defined by prefixes
            // Suffix for operand size
            i = s.OperandSize / 8;
            if (i <= 8) {
                static const char SizeSuffixes[] = " bw d f q"; // Table of suffixes
                out_file->Put(SizeSuffixes[i]);
            }
        }
    }
    // Alternative suffix option
    if (s.OpcodeDef->Options & 0x1000) {
        // Append alternative suffix for vector element size to name
        if ((s.OpcodeDef->AllowedPrefixes & 0x7000) == 0x3000) {
            // Integer operand size defined by W prefix bit
            i = ((s.Prefixes[7] & 8) + 8) * 4;  // W prefix bit -> 8 / 16
            out_file->PutDecimal(i);
        }
        if ((s.OpcodeDef->AllowedPrefixes & 0x7000) == 0x4000) { // 32 / 64
            i = (s.Prefixes[7] & 8) + 8;  // W prefix bit -> 8 / 16
            out_file->PutDecimal(i);
        }
    }
    // More suffix option
    if ((s.OpcodeDef->Options & 0x400) && s.ImmediateFieldSize == 8) {
        // 64 bit immediate mov
        if (Syntax == SUBTYPE_GASM) out_file->Put("abs");
    }   

    // Space between opcode name and operands
    out_file->Put(" "); //out_file->Tabulate(AsmTab2);  // Tabulate. At least one space // jjh

    // Loop for all operands to write
    for (i = 0; i < s.MaxNumOperands; i++) {
        if (s.Operands[i] & 0xFFFF) {

            // Write operand i
            if (NumOperands++) {
                // At least one operand before this one. Separate by ", "
                out_file->Put(", ");
            }

            // Write constant and jump operands
            switch (s.Operands[i] & 0xF0) {
            case 0x10: case 0x20: case 0x30: case 0x80:
                WriteImmediateOperand( out_file, s.Operands[i] );
                continue;
            }

            // Write register and memory operands
            uint32 optype = (s.Operands[i] >> 16) & 0x0F;
            switch (optype) {
            case 0:        // Other type of operand
                WriteOtherOperand( out_file, s.Operands[i] );  break;

            case 0x1:  // Direct memory operand
                WriteRMOperand( out_file, s.Operands[i] );  break;

            case 0x2:  // Register operand indicated by last bits of opcode
                WriteShortRegOperand( out_file, s.Operands[i] );  break;

            case 0x3:  // Register or memory operand indicated by mod/rm bits
                WriteRMOperand( out_file, s.Operands[i] );  break;

            case 0x4:  // Register operand indicated by reg bits
                WriteRegOperand( out_file, s.Operands[i] );  break;

            case 0x5:  // Register operand indicated by dest bits of DREX byte
                WriteDREXOperand( out_file, s.Operands[i] );  break;

            case 0x6:  // Register operand indicated by VEX.vvvv bits
                WriteVEXOperand( out_file, s.Operands[i], 0 );  break;

            case 0x7:  // Register operand indicated by bits 4-7 of immediate operand
                WriteVEXOperand( out_file, s.Operands[i], 1 );  break;

            case 0x8:  // Register operand indicated by bits 0-3 of immediate operand
                WriteVEXOperand( out_file, s.Operands[i], 2 );  break; // Unused. For future use
            }
            int isMem = optype == 3 && s.Mod != 3;
            if (s.Prefixes[3] == 0x62) { // EVEX and MVEX prefix can have extra operand attributes
                if (s.Prefixes[6] & 0x20) {                
                    WriteOperandAttributeEVEX( out_file, i, isMem );
                }
                else {
                    WriteOperandAttributeMVEX( out_file, i, isMem );
                }
            }
            if (s.Prefixes[3] == 0x62 && (i == s.MaxNumOperands - 1 || (s.Operands[i+1] & 0xFFF) < 0x40)) {
                // This is the last SIMD operand
                if (!(s.Operands[4] & 0x80000000)) {
                    s.Operands[4] |= 0x80000000;  // Make sure we don't write this twice
                    if (s.Prefixes[6] & 0x20) {                
                        WriteOperandAttributeEVEX( out_file, 98, isMem );
                    }
                    else {
                        WriteOperandAttributeMVEX( out_file, 98, isMem );
                    }
                }
            }
        }
    }
    if (s.Prefixes[3] == 0x62) { // EVEX and MVEX prefix can have extra attributes after operands
        if (s.Prefixes[6] & 0x20) {                
            WriteOperandAttributeEVEX( out_file, 99, 0 );
        }
        else {
            WriteOperandAttributeMVEX( out_file, 99, 0 );
        }
    }
}

