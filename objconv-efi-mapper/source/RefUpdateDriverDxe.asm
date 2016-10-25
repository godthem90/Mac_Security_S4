; Disassembly of file: 
; Tue Oct 25 10:11:02 2016
; Mode: 64 bits
; Syntax: MASM/ML64
; Instruction set: BMI etc., x64, privileged instructions

; Error: symbol names contain illegal characters,
; 11 Symbol names not changed

public _DebugPrint
public _DebugAssert
public _DebugAssertEnabled
public _DebugPrintEnabled
public _DebugPrintLevelEnabled
public _InternalMemSetMem
public _ZeroMem
public _CompareMem
public _SetMem
public _CopyMem
public _InternalMemZeroMem
public _InternalMemCompareMem
public _CopyGuid
public _CompareGuid
public _InternalMemCopyMem
public _InternalAssertJumpBuffer
public _DivU64x32Remainder
public _AsciiStrCpyS
public _StrLen
public _StrSize
public _AsciiStrSize
public _AsciiStrLen
public _AsciiStrCmp
public _AsciiStriCmp
public _AsciiStrnCmp
public _AsciiStrHexToUintn
public _m16Start
public _InternalAsmThunk16
public _InternalMathDivRemU64x32
public _ReadUnaligned16
public _ReadUnaligned32
public _ReadUnaligned64
public _WriteUnaligned64
public _InternalSwitchStack
public _SetJump
public _InternalLongJump
public _EnableDisableInterrupts
public _InternalX86DisablePaging64
public _AsmCpuid
public _AsmCpuidEx
public _AsmEnableCache
public _AsmDisableCache
public _AsmRdRand16
public _AsmRdRand32
public _AsmRdRand64
public _UefiBootServicesTableLibConstructor
public _InternalAllocateAlignedPages
public _AllocateAlignedPages
public _InternalAllocatePool
public _AllocatePool
public _InternalAllocateZeroPool
public _AllocateZeroPool
public _InternalAllocateCopyPool
public _AllocateCopyPool
public _FreePool
public _BasePrintLibValueToString
public _BasePrintLibSPrintMarker
public _BasePrintLibSPrint
public _UnicodeVSPrint
public _IsDevicePathEnd
public _DevicePathNodeLength
public _NextDevicePathNode
public _DevicePathType
public _DevicePathSubType
public _IsDevicePathEndType
public _UefiRuntimeServicesTableLibConstructor
public _UefiHiiServicesLibConstructor
public _InternalPrint
public _Print
public _EfiGetNameGuidFromFwVolDevicePathNode
public _UefiLibConstructor
public _EfiGetSystemConfigurationTable
public _GetVariable2
public _GetEfiGlobalVariable2
public _GetBestLanguage
public _HiiAddPackages
public _HiiGetString
public _HiiGetSupportedLanguages
public _DxeServicesTableLibConstructor
public __DriverUnloadHandler
public __ModuleEntryPoint
public _PerformUpdateOnFirmwareVolume
public _PerformUpdateOnFlashArea
public _PerformUpdate
public _ProcessUpdateImage
public _InitializeUpdateDriver
public _ProfileGetLine
public _ProfileTrim
public _ProfileGetComments
public _ProfileGetSection
public _ProfileGetEntry
public _FreeAllList
public _UpdateGetProfileString
public _UpdateAtoi
public _UpdateValueToString
public _UpdateStringToGuid
public _PreProcessDataFile
public _ParseUpdateDataFile
public _UpdateOneBlock
public _UpdateBufferInOneBlock
public _RetrieveLastWrite
public _FaultTolerantUpdateOnWholeFv
public _NonFaultTolerantUpdateOnWholeFv
public _PerformUpdateOnWholeFv
public _PerformUpdateOnFvFile
public _FaultTolerantUpdateOnPartFv
public _NonFaultTolerantUpdateOnPartFv
public _ProcessLibraryConstructorList
public _ProcessLibraryDestructorList
public _ProcessModuleEntryPointList
public _ProcessModuleUnloadList
public _mHexStr
public _mEndOfPakageList
public __gPcd_FixedAtBuild_PcdMaximumAsciiStringLength
public __gPcd_FixedAtBuild_PcdMaximumUnicodeStringLength
public __gPcd_FixedAtBuild_PcdUefiLibMaxPrintBufferSize
public __gUefiDriverRevision
public __gDriverUnloadImageCount
public _mStatusString
public _m16Size
public _mThunk16Attr
public _m16Gdt
public _m16GdtrBase
public _mTransition
public _gEfiCallerIdGuid
public _gEfiConfigFileNameGuid
public _gEfiUpdateDataFileGuid
public _gEfiGlobalVariableGuid
public _gEfiDxeServicesTableGuid
public _gEfiFaultTolerantWriteProtocolGuid
public _gEfiFirmwareVolume2ProtocolGuid
public _gEfiFirmwareVolumeBlockProtocolGuid
public _gEfiLoadedImageProtocolGuid
public _gEfiHiiFontProtocolGuid
public _gEfiHiiStringProtocolGuid
public _gEfiHiiImageProtocolGuid
public _gEfiHiiDatabaseProtocolGuid
public _gEfiHiiConfigRoutingProtocolGuid
public _UpdateDriverDxeStrings
public _gImageHandle
public _gST
public _gBS
public _gRT
public _gHiiFont
public _gHiiString
public _gHiiImage
public _gHiiDatabase
public _gHiiConfigRouting
public _gDS
public _gHiiHandle


__TEXT.__text SEGMENT ALIGN(8) 'CODE'                   ; section number 1

_DebugPrint PROC
00000240        mov     qword ptr [rsp+20H], r9         ; 0240 _ 4C: 89. 4C 24, 20
00000245        mov     qword ptr [rsp+18H], r8         ; 0245 _ 4C: 89. 44 24, 18
0000024A        ret                                     ; 024A _ C3
_DebugPrint ENDP

_DebugAssert PROC
0000024B        ret                                     ; 024B _ C3
_DebugAssert ENDP

_DebugAssertEnabled PROC
0000024C        xor     eax, eax                        ; 024C _ 31. C0
0000024E        ret                                     ; 024E _ C3
_DebugAssertEnabled ENDP

_DebugPrintEnabled PROC
0000024F        xor     eax, eax                        ; 024F _ 31. C0
00000251        ret                                     ; 0251 _ C3
_DebugPrintEnabled ENDP

_DebugPrintLevelEnabled PROC
00000252        xor     eax, eax                        ; 0252 _ 31. C0
00000254        ret                                     ; 0254 _ C3
_DebugPrintLevelEnabled ENDP

_InternalMemSetMem PROC
00000255        test    rdx, rdx                        ; 0255 _ 48: 85. D2
00000258        jz      ?_002                           ; 0258 _ 74, 0E
0000025A        mov     rax, rcx                        ; 025A _ 48: 89. C8
?_001:
0000025D        mov     byte ptr [rax], r8b             ; 025D _ 44: 88. 00
00000260        inc     rax                             ; 0260 _ 48: FF. C0
00000263        dec     rdx                             ; 0263 _ 48: FF. CA
00000266        jnz     ?_001                           ; 0266 _ 75, F5
?_002:
00000268        mov     rax, rcx                        ; 0268 _ 48: 89. C8
0000026B        ret                                     ; 026B _ C3
_InternalMemSetMem ENDP

_ZeroMem PROC
0000026C        push    rbp                             ; 026C _ 55
0000026D        mov     rbp, rsp                        ; 026D _ 48: 89. E5
00000270        push    rsi                             ; 0270 _ 56
00000271        push    rdi                             ; 0271 _ 57
00000272        sub     rsp, 32                         ; 0272 _ 48: 83. EC, 20
00000276        mov     rsi, rdx                        ; 0276 _ 48: 89. D6
00000279        mov     rdi, rcx                        ; 0279 _ 48: 89. CF
0000027C        call    _DebugAssertEnabled             ; 027C _ E8, FFFFFFCB
00000281        test    rdi, rdi                        ; 0281 _ 48: 85. FF
00000284        jnz     ?_003                           ; 0284 _ 75, 21
00000286        test    al, al                          ; 0286 _ 84. C0
00000288        jz      ?_003                           ; 0288 _ 74, 1D
0000028A        test    rsi, rsi                        ; 028A _ 48: 85. F6
0000028D        jz      ?_003                           ; 028D _ 74, 18
0000028F        lea     rcx, ptr [?_565]                ; 028F _ 48: 8D. 0D, 000060BB(rel)
00000296        lea     r8, ptr [?_566]                 ; 0296 _ 4C: 8D. 05, 00006115(rel)
0000029D        mov     edx, 49                         ; 029D _ BA, 00000031
000002A2        call    _DebugAssert                    ; 02A2 _ E8, FFFFFFA4
?_003:
000002A7        call    _DebugAssertEnabled             ; 02A7 _ E8, FFFFFFA0
000002AC        test    al, al                          ; 02AC _ 84. C0
000002AE        jz      ?_004                           ; 02AE _ 74, 23
000002B0        mov     rax, rdi                        ; 02B0 _ 48: 89. F8
000002B3        neg     rax                             ; 02B3 _ 48: F7. D8
000002B6        cmp     rsi, rax                        ; 02B6 _ 48: 39. C6
000002B9        jbe     ?_004                           ; 02B9 _ 76, 18
000002BB        lea     rcx, ptr [?_565]                ; 02BB _ 48: 8D. 0D, 0000608F(rel)
000002C2        lea     r8, ptr [?_567]                 ; 02C2 _ 4C: 8D. 05, 00006111(rel)
000002C9        mov     edx, 50                         ; 02C9 _ BA, 00000032
000002CE        call    _DebugAssert                    ; 02CE _ E8, FFFFFF78
?_004:
000002D3        mov     rcx, rdi                        ; 02D3 _ 48: 89. F9
000002D6        mov     rdx, rsi                        ; 02D6 _ 48: 89. F2
000002D9        add     rsp, 32                         ; 02D9 _ 48: 83. C4, 20
000002DD        pop     rdi                             ; 02DD _ 5F
000002DE        pop     rsi                             ; 02DE _ 5E
000002DF        pop     rbp                             ; 02DF _ 5D
000002E0        jmp     _InternalMemZeroMem             ; 02E0 _ E9, 000001FF
_ZeroMem ENDP

_CompareMem PROC
000002E5        push    rbp                             ; 02E5 _ 55
000002E6        mov     rbp, rsp                        ; 02E6 _ 48: 89. E5
000002E9        push    rsi                             ; 02E9 _ 56
000002EA        push    rdi                             ; 02EA _ 57
000002EB        push    rbx                             ; 02EB _ 53
000002EC        sub     rsp, 40                         ; 02EC _ 48: 83. EC, 28
000002F0        mov     rsi, r8                         ; 02F0 _ 4C: 89. C6
000002F3        mov     rdi, rdx                        ; 02F3 _ 48: 89. D7
000002F6        mov     rbx, rcx                        ; 02F6 _ 48: 89. CB
000002F9        test    rsi, rsi                        ; 02F9 _ 48: 85. F6
000002FC        je      ?_009                           ; 02FC _ 0F 84, 000000CB
00000302        cmp     rbx, rdi                        ; 0302 _ 48: 39. FB
00000305        je      ?_009                           ; 0305 _ 0F 84, 000000C2
0000030B        call    _DebugAssertEnabled             ; 030B _ E8, FFFFFF3C
00000310        test    al, al                          ; 0310 _ 84. C0
00000312        jz      ?_005                           ; 0312 _ 74, 1D
00000314        test    rbx, rbx                        ; 0314 _ 48: 85. DB
00000317        jnz     ?_005                           ; 0317 _ 75, 18
00000319        lea     rcx, ptr [?_568]                ; 0319 _ 48: 8D. 0D, 000060F0(rel)
00000320        lea     r8, ptr [?_569]                 ; 0320 _ 4C: 8D. 05, 0000614D(rel)
00000327        mov     edx, 60                         ; 0327 _ BA, 0000003C
0000032C        call    _DebugAssert                    ; 032C _ E8, FFFFFF1A
?_005:
00000331        call    _DebugAssertEnabled             ; 0331 _ E8, FFFFFF16
00000336        test    al, al                          ; 0336 _ 84. C0
00000338        jz      ?_006                           ; 0338 _ 74, 1D
0000033A        test    rdi, rdi                        ; 033A _ 48: 85. FF
0000033D        jnz     ?_006                           ; 033D _ 75, 18
0000033F        lea     rcx, ptr [?_568]                ; 033F _ 48: 8D. 0D, 000060CA(rel)
00000346        lea     r8, ptr [?_570]                 ; 0346 _ 4C: 8D. 05, 00006149(rel)
0000034D        mov     edx, 61                         ; 034D _ BA, 0000003D
00000352        call    _DebugAssert                    ; 0352 _ E8, FFFFFEF4
?_006:
00000357        call    _DebugAssertEnabled             ; 0357 _ E8, FFFFFEF0
0000035C        test    al, al                          ; 035C _ 84. C0
0000035E        jz      ?_007                           ; 035E _ 74, 27
00000360        mov     rax, rbx                        ; 0360 _ 48: 89. D8
00000363        not     rax                             ; 0363 _ 48: F7. D0
00000366        lea     rcx, ptr [rsi-1H]               ; 0366 _ 48: 8D. 4E, FF
0000036A        cmp     rcx, rax                        ; 036A _ 48: 39. C1
0000036D        jbe     ?_007                           ; 036D _ 76, 18
0000036F        lea     rcx, ptr [?_568]                ; 036F _ 48: 8D. 0D, 0000609A(rel)
00000376        lea     r8, ptr [?_571]                 ; 0376 _ 4C: 8D. 05, 00006136(rel)
0000037D        mov     edx, 62                         ; 037D _ BA, 0000003E
00000382        call    _DebugAssert                    ; 0382 _ E8, FFFFFEC4
?_007:
00000387        call    _DebugAssertEnabled             ; 0387 _ E8, FFFFFEC0
0000038C        test    al, al                          ; 038C _ 84. C0
0000038E        jz      ?_008                           ; 038E _ 74, 27
00000390        mov     rax, rdi                        ; 0390 _ 48: 89. F8
00000393        not     rax                             ; 0393 _ 48: F7. D0
00000396        lea     rcx, ptr [rsi-1H]               ; 0396 _ 48: 8D. 4E, FF
0000039A        cmp     rcx, rax                        ; 039A _ 48: 39. C1
0000039D        jbe     ?_008                           ; 039D _ 76, 18
0000039F        lea     rcx, ptr [?_568]                ; 039F _ 48: 8D. 0D, 0000606A(rel)
000003A6        lea     r8, ptr [?_572]                 ; 03A6 _ 4C: 8D. 05, 00006149(rel)
000003AD        mov     edx, 63                         ; 03AD _ BA, 0000003F
000003B2        call    _DebugAssert                    ; 03B2 _ E8, FFFFFE94
?_008:
000003B7        mov     rcx, rbx                        ; 03B7 _ 48: 89. D9
000003BA        mov     rdx, rdi                        ; 03BA _ 48: 89. FA
000003BD        mov     r8, rsi                         ; 03BD _ 49: 89. F0
000003C0        add     rsp, 40                         ; 03C0 _ 48: 83. C4, 28
000003C4        pop     rbx                             ; 03C4 _ 5B
000003C5        pop     rdi                             ; 03C5 _ 5F
000003C6        pop     rsi                             ; 03C6 _ 5E
000003C7        pop     rbp                             ; 03C7 _ 5D
000003C8        jmp     _InternalMemCompareMem          ; 03C8 _ E9, 0000011F
_CompareMem ENDP

?_009   LABEL NEAR
000003CD        xor     eax, eax                        ; 03CD _ 31. C0
000003CF        add     rsp, 40                         ; 03CF _ 48: 83. C4, 28
000003D3        pop     rbx                             ; 03D3 _ 5B
000003D4        pop     rdi                             ; 03D4 _ 5F
000003D5        pop     rsi                             ; 03D5 _ 5E
000003D6        pop     rbp                             ; 03D6 _ 5D
000003D7        ret                                     ; 03D7 _ C3

_SetMem PROC
000003D8        push    rbp                             ; 03D8 _ 55
000003D9        mov     rbp, rsp                        ; 03D9 _ 48: 89. E5
000003DC        push    rsi                             ; 03DC _ 56
000003DD        push    rdi                             ; 03DD _ 57
000003DE        push    rbx                             ; 03DE _ 53
000003DF        sub     rsp, 40                         ; 03DF _ 48: 83. EC, 28
000003E3        mov     ebx, r8d                        ; 03E3 _ 44: 89. C3
000003E6        mov     rsi, rdx                        ; 03E6 _ 48: 89. D6
000003E9        mov     rdi, rcx                        ; 03E9 _ 48: 89. CF
000003EC        test    rsi, rsi                        ; 03EC _ 48: 85. F6
000003EF        jz      ?_011                           ; 03EF _ 74, 47
000003F1        call    _DebugAssertEnabled             ; 03F1 _ E8, FFFFFE56
000003F6        test    al, al                          ; 03F6 _ 84. C0
000003F8        jz      ?_010                           ; 03F8 _ 74, 27
000003FA        mov     rax, rdi                        ; 03FA _ 48: 89. F8
000003FD        not     rax                             ; 03FD _ 48: F7. D0
00000400        lea     rcx, ptr [rsi-1H]               ; 0400 _ 48: 8D. 4E, FF
00000404        cmp     rcx, rax                        ; 0404 _ 48: 39. C1
00000407        jbe     ?_010                           ; 0407 _ 76, 18
00000409        lea     rcx, ptr [?_573]                ; 0409 _ 48: 8D. 0D, 00006124(rel)
00000410        lea     r8, ptr [?_564]                 ; 0410 _ 4C: 8D. 05, 00005F02(rel)
00000417        mov     edx, 54                         ; 0417 _ BA, 00000036
0000041C        call    _DebugAssert                    ; 041C _ E8, FFFFFE2A
?_010:
00000421        movzx   r8d, bl                         ; 0421 _ 44: 0F B6. C3
00000425        mov     rcx, rdi                        ; 0425 _ 48: 89. F9
00000428        mov     rdx, rsi                        ; 0428 _ 48: 89. F2
0000042B        add     rsp, 40                         ; 042B _ 48: 83. C4, 28
0000042F        pop     rbx                             ; 042F _ 5B
00000430        pop     rdi                             ; 0430 _ 5F
00000431        pop     rsi                             ; 0431 _ 5E
00000432        pop     rbp                             ; 0432 _ 5D
00000433        jmp     _InternalMemSetMem              ; 0433 _ E9, FFFFFE1D
_SetMem ENDP

?_011   LABEL NEAR
00000438        mov     rax, rdi                        ; 0438 _ 48: 89. F8
0000043B        add     rsp, 40                         ; 043B _ 48: 83. C4, 28
0000043F        pop     rbx                             ; 043F _ 5B
00000440        pop     rdi                             ; 0440 _ 5F
00000441        pop     rsi                             ; 0441 _ 5E
00000442        pop     rbp                             ; 0442 _ 5D
00000443        ret                                     ; 0443 _ C3

_CopyMem PROC
00000444        push    rbp                             ; 0444 _ 55
00000445        mov     rbp, rsp                        ; 0445 _ 48: 89. E5
00000448        push    rsi                             ; 0448 _ 56
00000449        push    rdi                             ; 0449 _ 57
0000044A        push    rbx                             ; 044A _ 53
0000044B        sub     rsp, 40                         ; 044B _ 48: 83. EC, 28
0000044F        mov     rsi, r8                         ; 044F _ 4C: 89. C6
00000452        mov     rdi, rdx                        ; 0452 _ 48: 89. D7
00000455        mov     rbx, rcx                        ; 0455 _ 48: 89. CB
00000458        test    rsi, rsi                        ; 0458 _ 48: 85. F6
0000045B        jz      ?_014                           ; 045B _ 74, 65
0000045D        call    _DebugAssertEnabled             ; 045D _ E8, FFFFFDEA
00000462        test    al, al                          ; 0462 _ 84. C0
00000464        jz      ?_012                           ; 0464 _ 74, 27
00000466        mov     rax, rbx                        ; 0466 _ 48: 89. D8
00000469        not     rax                             ; 0469 _ 48: F7. D0
0000046C        lea     rcx, ptr [rsi-1H]               ; 046C _ 48: 8D. 4E, FF
00000470        cmp     rcx, rax                        ; 0470 _ 48: 39. C1
00000473        jbe     ?_012                           ; 0473 _ 76, 18
00000475        lea     rcx, ptr [?_574]                ; 0475 _ 48: 8D. 0D, 00006118(rel)
0000047C        lea     r8, ptr [?_571]                 ; 047C _ 4C: 8D. 05, 00006030(rel)
00000483        mov     edx, 56                         ; 0483 _ BA, 00000038
00000488        call    _DebugAssert                    ; 0488 _ E8, FFFFFDBE
?_012:
0000048D        call    _DebugAssertEnabled             ; 048D _ E8, FFFFFDBA
00000492        test    al, al                          ; 0492 _ 84. C0
00000494        jz      ?_013                           ; 0494 _ 74, 27
00000496        mov     rax, rdi                        ; 0496 _ 48: 89. F8
00000499        not     rax                             ; 0499 _ 48: F7. D0
0000049C        lea     rcx, ptr [rsi-1H]               ; 049C _ 48: 8D. 4E, FF
000004A0        cmp     rcx, rax                        ; 04A0 _ 48: 39. C1
000004A3        jbe     ?_013                           ; 04A3 _ 76, 18
000004A5        lea     rcx, ptr [?_574]                ; 04A5 _ 48: 8D. 0D, 000060E8(rel)
000004AC        lea     r8, ptr [?_572]                 ; 04AC _ 4C: 8D. 05, 00006043(rel)
000004B3        mov     edx, 57                         ; 04B3 _ BA, 00000039
000004B8        call    _DebugAssert                    ; 04B8 _ E8, FFFFFD8E
?_013:
000004BD        cmp     rbx, rdi                        ; 04BD _ 48: 39. FB
000004C0        jnz     ?_015                           ; 04C0 _ 75, 0C
?_014:
000004C2        mov     rax, rbx                        ; 04C2 _ 48: 89. D8
000004C5        add     rsp, 40                         ; 04C5 _ 48: 83. C4, 28
000004C9        pop     rbx                             ; 04C9 _ 5B
000004CA        pop     rdi                             ; 04CA _ 5F
000004CB        pop     rsi                             ; 04CB _ 5E
000004CC        pop     rbp                             ; 04CC _ 5D
000004CD        ret                                     ; 04CD _ C3
_CopyMem ENDP

?_015   LABEL NEAR
000004CE        mov     rcx, rbx                        ; 04CE _ 48: 89. D9
000004D1        mov     rdx, rdi                        ; 04D1 _ 48: 89. FA
000004D4        mov     r8, rsi                         ; 04D4 _ 49: 89. F0
000004D7        add     rsp, 40                         ; 04D7 _ 48: 83. C4, 28
000004DB        pop     rbx                             ; 04DB _ 5B
000004DC        pop     rdi                             ; 04DC _ 5F
000004DD        pop     rsi                             ; 04DD _ 5E
000004DE        pop     rbp                             ; 04DE _ 5D
000004DF        jmp     _InternalMemCopyMem             ; 04DF _ E9, 000000CC

_InternalMemZeroMem PROC
000004E4        xor     r8d, r8d                        ; 04E4 _ 45: 31. C0
000004E7        jmp     _InternalMemSetMem              ; 04E7 _ E9, FFFFFD69
_InternalMemZeroMem ENDP

_InternalMemCompareMem PROC
000004EC        mov     r9d, 1                          ; 04EC _ 41: B9, 00000001
000004F2        sub     r9, r8                          ; 04F2 _ 4D: 29. C1
000004F5        jmp     ?_017                           ; 04F5 _ EB, 09

?_016:
000004F7        inc     r9                              ; 04F7 _ 49: FF. C1
000004FA        inc     rdx                             ; 04FA _ 48: FF. C2
000004FD        inc     rcx                             ; 04FD _ 48: FF. C1
?_017:
00000500        mov     al, byte ptr [rdx]              ; 0500 _ 8A. 02
00000502        mov     r8b, byte ptr [rcx]             ; 0502 _ 44: 8A. 01
00000505        test    r9, r9                          ; 0505 _ 4D: 85. C9
00000508        jz      ?_018                           ; 0508 _ 74, 05
0000050A        cmp     r8b, al                         ; 050A _ 41: 38. C0
0000050D        jz      ?_016                           ; 050D _ 74, E8
?_018:
0000050F        movzx   ecx, al                         ; 050F _ 0F B6. C8
00000512        movzx   eax, r8b                        ; 0512 _ 41: 0F B6. C0
00000516        sub     rax, rcx                        ; 0516 _ 48: 29. C8
00000519        ret                                     ; 0519 _ C3
_InternalMemCompareMem ENDP

_CopyGuid PROC
0000051A        push    rbp                             ; 051A _ 55
0000051B        mov     rbp, rsp                        ; 051B _ 48: 89. E5
0000051E        push    rsi                             ; 051E _ 56
0000051F        push    rdi                             ; 051F _ 57
00000520        sub     rsp, 32                         ; 0520 _ 48: 83. EC, 20
00000524        mov     rdi, rdx                        ; 0524 _ 48: 89. D7
00000527        mov     rsi, rcx                        ; 0527 _ 48: 89. CE
0000052A        mov     rcx, rdi                        ; 052A _ 48: 89. F9
0000052D        call    _ReadUnaligned64                ; 052D _ E8, 00000B6D
00000532        mov     rcx, rsi                        ; 0532 _ 48: 89. F1
00000535        mov     rdx, rax                        ; 0535 _ 48: 89. C2
00000538        call    _WriteUnaligned64               ; 0538 _ E8, 00000B9E
0000053D        lea     rcx, ptr [rdi+8H]               ; 053D _ 48: 8D. 4F, 08
00000541        call    _ReadUnaligned64                ; 0541 _ E8, 00000B59
00000546        lea     rcx, ptr [rsi+8H]               ; 0546 _ 48: 8D. 4E, 08
0000054A        mov     rdx, rax                        ; 054A _ 48: 89. C2
0000054D        call    _WriteUnaligned64               ; 054D _ E8, 00000B89
00000552        mov     rax, rsi                        ; 0552 _ 48: 89. F0
00000555        add     rsp, 32                         ; 0555 _ 48: 83. C4, 20
00000559        pop     rdi                             ; 0559 _ 5F
0000055A        pop     rsi                             ; 055A _ 5E
0000055B        pop     rbp                             ; 055B _ 5D
0000055C        ret                                     ; 055C _ C3
_CopyGuid ENDP

_CompareGuid PROC
0000055D        push    rbp                             ; 055D _ 55
0000055E        mov     rbp, rsp                        ; 055E _ 48: 89. E5
00000561        push    rsi                             ; 0561 _ 56
00000562        push    rdi                             ; 0562 _ 57
00000563        push    rbx                             ; 0563 _ 53
00000564        sub     rsp, 40                         ; 0564 _ 48: 83. EC, 28
00000568        mov     rsi, rdx                        ; 0568 _ 48: 89. D6
0000056B        mov     rdi, rcx                        ; 056B _ 48: 89. CF
0000056E        call    _ReadUnaligned64                ; 056E _ E8, 00000B2C
00000573        mov     rbx, rax                        ; 0573 _ 48: 89. C3
00000576        mov     rcx, rsi                        ; 0576 _ 48: 89. F1
00000579        call    _ReadUnaligned64                ; 0579 _ E8, 00000B21
0000057E        cmp     rbx, rax                        ; 057E _ 48: 39. C3
00000581        sete    bl                              ; 0581 _ 0F 94. C3
00000584        add     rdi, 8                          ; 0584 _ 48: 83. C7, 08
00000588        mov     rcx, rdi                        ; 0588 _ 48: 89. F9
0000058B        call    _ReadUnaligned64                ; 058B _ E8, 00000B0F
00000590        mov     rdi, rax                        ; 0590 _ 48: 89. C7
00000593        lea     rcx, ptr [rsi+8H]               ; 0593 _ 48: 8D. 4E, 08
00000597        call    _ReadUnaligned64                ; 0597 _ E8, 00000B03
0000059C        cmp     rdi, rax                        ; 059C _ 48: 39. C7
0000059F        sete    al                              ; 059F _ 0F 94. C0
000005A2        and     al, bl                          ; 05A2 _ 20. D8
000005A4        movzx   eax, al                         ; 05A4 _ 0F B6. C0
000005A7        add     rsp, 40                         ; 05A7 _ 48: 83. C4, 28
000005AB        pop     rbx                             ; 05AB _ 5B
000005AC        pop     rdi                             ; 05AC _ 5F
000005AD        pop     rsi                             ; 05AD _ 5E
000005AE        pop     rbp                             ; 05AE _ 5D
000005AF        ret                                     ; 05AF _ C3
_CompareGuid ENDP

_InternalMemCopyMem PROC
000005B0        cmp     rdx, rcx                        ; 05B0 _ 48: 39. CA
000005B3        jbe     ?_020                           ; 05B3 _ 76, 1A
000005B5        test    r8, r8                          ; 05B5 _ 4D: 85. C0
000005B8        jz      ?_022                           ; 05B8 _ 74, 2B
000005BA        mov     r9, rcx                         ; 05BA _ 49: 89. C9
?_019:
000005BD        mov     al, byte ptr [rdx]              ; 05BD _ 8A. 02
000005BF        mov     byte ptr [r9], al               ; 05BF _ 41: 88. 01
000005C2        inc     r9                              ; 05C2 _ 49: FF. C1
000005C5        inc     rdx                             ; 05C5 _ 48: FF. C2
000005C8        dec     r8                              ; 05C8 _ 49: FF. C8
000005CB        jnz     ?_019                           ; 05CB _ 75, F0
000005CD        jmp     ?_022                           ; 05CD _ EB, 16

?_020:
000005CF        jnc     ?_022                           ; 05CF _ 73, 14
000005D1        test    r8, r8                          ; 05D1 _ 4D: 85. C0
000005D4        jz      ?_022                           ; 05D4 _ 74, 0F
?_021:
000005D6        mov     al, byte ptr [rdx+r8-1H]        ; 05D6 _ 42: 8A. 44 02, FF
000005DB        mov     byte ptr [rcx+r8-1H], al        ; 05DB _ 42: 88. 44 01, FF
000005E0        dec     r8                              ; 05E0 _ 49: FF. C8
000005E3        jnz     ?_021                           ; 05E3 _ 75, F1
?_022:
000005E5        mov     rax, rcx                        ; 05E5 _ 48: 89. C8
000005E8        ret                                     ; 05E8 _ C3
_InternalMemCopyMem ENDP

_InternalAssertJumpBuffer PROC
000005E9        push    rbp                             ; 05E9 _ 55
000005EA        mov     rbp, rsp                        ; 05EA _ 48: 89. E5
000005ED        push    rsi                             ; 05ED _ 56
000005EE        sub     rsp, 40                         ; 05EE _ 48: 83. EC, 28
000005F2        mov     rsi, rcx                        ; 05F2 _ 48: 89. CE
000005F5        call    _DebugAssertEnabled             ; 05F5 _ E8, FFFFFC52
000005FA        test    al, al                          ; 05FA _ 84. C0
000005FC        jz      ?_023                           ; 05FC _ 74, 1D
000005FE        test    rsi, rsi                        ; 05FE _ 48: 85. F6
00000601        jnz     ?_023                           ; 0601 _ 75, 18
00000603        lea     rcx, ptr [?_575]                ; 0603 _ 48: 8D. 0D, 00005FEB(rel)
0000060A        lea     r8, ptr [?_576]                 ; 060A _ 4C: 8D. 05, 00006038(rel)
00000611        mov     edx, 37                         ; 0611 _ BA, 00000025
00000616        call    _DebugAssert                    ; 0616 _ E8, FFFFFC30
?_023:
0000061B        call    _DebugAssertEnabled             ; 061B _ E8, FFFFFC2C
00000620        test    al, al                          ; 0620 _ 84. C0
00000622        jz      ?_024                           ; 0622 _ 74, 06
00000624        test    sil, 7H                         ; 0624 _ 40: F6. C6, 07
00000628        jnz     ?_025                           ; 0628 _ 75, 07
?_024:
0000062A        add     rsp, 40                         ; 062A _ 48: 83. C4, 28
0000062E        pop     rsi                             ; 062E _ 5E
0000062F        pop     rbp                             ; 062F _ 5D
00000630        ret                                     ; 0630 _ C3
_InternalAssertJumpBuffer ENDP

?_025   LABEL NEAR
00000631        lea     rcx, ptr [?_575]                ; 0631 _ 48: 8D. 0D, 00005FBD(rel)
00000638        lea     r8, ptr [?_577]                 ; 0638 _ 4C: 8D. 05, 00006025(rel)
0000063F        mov     edx, 39                         ; 063F _ BA, 00000027
00000644        add     rsp, 40                         ; 0644 _ 48: 83. C4, 28
00000648        pop     rsi                             ; 0648 _ 5E
00000649        pop     rbp                             ; 0649 _ 5D
0000064A        jmp     _DebugAssert                    ; 064A _ E9, FFFFFBFC

_DivU64x32Remainder PROC
0000064F        push    rbp                             ; 064F _ 55
00000650        mov     rbp, rsp                        ; 0650 _ 48: 89. E5
00000653        push    rsi                             ; 0653 _ 56
00000654        push    rdi                             ; 0654 _ 57
00000655        push    rbx                             ; 0655 _ 53
00000656        sub     rsp, 40                         ; 0656 _ 48: 83. EC, 28
0000065A        mov     rsi, r8                         ; 065A _ 4C: 89. C6
0000065D        mov     edi, edx                        ; 065D _ 89. D7
0000065F        mov     rbx, rcx                        ; 065F _ 48: 89. CB
00000662        call    _DebugAssertEnabled             ; 0662 _ E8, FFFFFBE5
00000667        test    al, al                          ; 0667 _ 84. C0
00000669        jz      ?_026                           ; 0669 _ 74, 1C
0000066B        test    edi, edi                        ; 066B _ 85. FF
0000066D        jnz     ?_026                           ; 066D _ 75, 18
0000066F        lea     rcx, ptr [?_579]                ; 066F _ 48: 8D. 0D, 0000601E(rel)
00000676        lea     r8, ptr [?_578]                 ; 0676 _ 4C: 8D. 05, 0000600A(rel)
0000067D        mov     edx, 47                         ; 067D _ BA, 0000002F
00000682        call    _DebugAssert                    ; 0682 _ E8, FFFFFBC4
?_026:
00000687        mov     rcx, rbx                        ; 0687 _ 48: 89. D9
0000068A        mov     edx, edi                        ; 068A _ 89. FA
0000068C        mov     r8, rsi                         ; 068C _ 49: 89. F0
0000068F        add     rsp, 40                         ; 068F _ 48: 83. C4, 28
00000693        pop     rbx                             ; 0693 _ 5B
00000694        pop     rdi                             ; 0694 _ 5F
00000695        pop     rsi                             ; 0695 _ 5E
00000696        pop     rbp                             ; 0696 _ 5D
00000697        jmp     _InternalMathDivRemU64x32       ; 0697 _ E9, 00000970
_DivU64x32Remainder ENDP

_AsciiStrCpyS PROC
0000069C        push    rbp                             ; 069C _ 55
0000069D        mov     rbp, rsp                        ; 069D _ 48: 89. E5
000006A0        push    r14                             ; 06A0 _ 41: 56
000006A2        push    rsi                             ; 06A2 _ 56
000006A3        push    rdi                             ; 06A3 _ 57
000006A4        push    rbx                             ; 06A4 _ 53
000006A5        sub     rsp, 32                         ; 06A5 _ 48: 83. EC, 20
000006A9        mov     rdi, r8                         ; 06A9 _ 4C: 89. C7
000006AC        mov     r14, rdx                        ; 06AC _ 49: 89. D6
000006AF        mov     rsi, rcx                        ; 06AF _ 48: 89. CE
000006B2        call    _DebugAssertEnabled             ; 06B2 _ E8, FFFFFB95
000006B7        test    al, al                          ; 06B7 _ 84. C0
000006B9        jz      ?_027                           ; 06B9 _ 74, 1D
000006BB        test    rsi, rsi                        ; 06BB _ 48: 85. F6
000006BE        jnz     ?_027                           ; 06BE _ 75, 18
000006C0        lea     rcx, ptr [?_581]                ; 06C0 _ 48: 8D. 0D, 00006041(rel)
000006C7        lea     r8, ptr [?_583]                 ; 06C7 _ 4C: 8D. 05, 000060B4(rel)
000006CE        mov     edx, 618                        ; 06CE _ BA, 0000026A
000006D3        call    _DebugAssert                    ; 06D3 _ E8, FFFFFB73
?_027:
000006D8        mov     rax, 2H                         ; 06D8 _ 48: B8, 8000000000000002
000006E2        test    rsi, rsi                        ; 06E2 _ 48: 85. F6
000006E5        je      ?_043                           ; 06E5 _ 0F 84, 0000018B
000006EB        call    _DebugAssertEnabled             ; 06EB _ E8, FFFFFB5C
000006F0        test    al, al                          ; 06F0 _ 84. C0
000006F2        jz      ?_028                           ; 06F2 _ 74, 1D
000006F4        test    rdi, rdi                        ; 06F4 _ 48: 85. FF
000006F7        jnz     ?_028                           ; 06F7 _ 75, 18
000006F9        lea     rcx, ptr [?_581]                ; 06F9 _ 48: 8D. 0D, 00006008(rel)
00000700        lea     r8, ptr [?_584]                 ; 0700 _ 4C: 8D. 05, 00006099(rel)
00000707        mov     edx, 619                        ; 0707 _ BA, 0000026B
0000070C        call    _DebugAssert                    ; 070C _ E8, FFFFFB3A
?_028:
00000711        mov     rax, 2H                         ; 0711 _ 48: B8, 8000000000000002
0000071B        test    rdi, rdi                        ; 071B _ 48: 85. FF
0000071E        je      ?_043                           ; 071E _ 0F 84, 00000152
00000724        mov     ebx, dword ptr [__gPcd_FixedAtBuild_PcdMaximumAsciiStringLength]; 0724 _ 8B. 1D, 000072CA(rel)
0000072A        test    rbx, rbx                        ; 072A _ 48: 85. DB
0000072D        jz      ?_030                           ; 072D _ 74, 39
0000072F        call    _DebugAssertEnabled             ; 072F _ E8, FFFFFB18
00000734        test    al, al                          ; 0734 _ 84. C0
00000736        jz      ?_029                           ; 0736 _ 74, 1D
00000738        cmp     rbx, r14                        ; 0738 _ 4C: 39. F3
0000073B        jnc     ?_029                           ; 073B _ 73, 18
0000073D        lea     rcx, ptr [?_581]                ; 073D _ 48: 8D. 0D, 00005FC4(rel)
00000744        lea     r8, ptr [?_587]                 ; 0744 _ 4C: 8D. 05, 00006093(rel)
0000074B        mov     edx, 625                        ; 074B _ BA, 00000271
00000750        call    _DebugAssert                    ; 0750 _ E8, FFFFFAF6
?_029:
00000755        mov     rax, 2H                         ; 0755 _ 48: B8, 8000000000000002
0000075F        cmp     rbx, r14                        ; 075F _ 4C: 39. F3
00000762        jc      ?_043                           ; 0762 _ 0F 82, 0000010E
?_030:
00000768        call    _DebugAssertEnabled             ; 0768 _ E8, FFFFFADF
0000076D        test    al, al                          ; 076D _ 84. C0
0000076F        jz      ?_031                           ; 076F _ 74, 1D
00000771        test    r14, r14                        ; 0771 _ 4D: 85. F6
00000774        jnz     ?_031                           ; 0774 _ 75, 18
00000776        lea     rcx, ptr [?_581]                ; 0776 _ 48: 8D. 0D, 00005F8B(rel)
0000077D        lea     r8, ptr [?_585]                 ; 077D _ 4C: 8D. 05, 00006035(rel)
00000784        mov     edx, 631                        ; 0784 _ BA, 00000277
00000789        call    _DebugAssert                    ; 0789 _ E8, FFFFFABD
?_031:
0000078E        mov     rax, 2H                         ; 078E _ 48: B8, 8000000000000002
00000798        test    r14, r14                        ; 0798 _ 4D: 85. F6
0000079B        je      ?_043                           ; 079B _ 0F 84, 000000D5
000007A1        xor     ebx, ebx                        ; 07A1 _ 31. DB
000007A3        jmp     ?_033                           ; 07A3 _ EB, 03

?_032:
000007A5        inc     rbx                             ; 07A5 _ 48: FF. C3
?_033:
000007A8        cmp     rbx, r14                        ; 07A8 _ 4C: 39. F3
000007AB        jnc     ?_034                           ; 07AB _ 73, 06
000007AD        cmp     byte ptr [rdi+rbx], 0           ; 07AD _ 80. 3C 1F, 00
000007B1        jnz     ?_032                           ; 07B1 _ 75, F2
?_034:
000007B3        call    _DebugAssertEnabled             ; 07B3 _ E8, FFFFFA94
000007B8        test    al, al                          ; 07B8 _ 84. C0
000007BA        jz      ?_035                           ; 07BA _ 74, 1D
000007BC        cmp     rbx, r14                        ; 07BC _ 4C: 39. F3
000007BF        jc      ?_035                           ; 07BF _ 72, 18
000007C1        lea     rcx, ptr [?_581]                ; 07C1 _ 48: 8D. 0D, 00005F40(rel)
000007C8        lea     r8, ptr [?_586]                 ; 07C8 _ 4C: 8D. 05, 00005FF9(rel)
000007CF        mov     edx, 637                        ; 07CF _ BA, 0000027D
000007D4        call    _DebugAssert                    ; 07D4 _ E8, FFFFFA72
?_035:
000007D9        mov     rax, 5H                         ; 07D9 _ 48: B8, 8000000000000005
000007E3        cmp     rbx, r14                        ; 07E3 _ 4C: 39. F3
000007E6        jnc     ?_043                           ; 07E6 _ 0F 83, 0000008A
000007EC        call    _DebugAssertEnabled             ; 07EC _ E8, FFFFFA5B
000007F1        test    al, al                          ; 07F1 _ 84. C0
000007F3        jz      ?_038                           ; 07F3 _ 74, 35
000007F5        cmp     rsi, rdi                        ; 07F5 _ 48: 39. FE
000007F8        jc      ?_036                           ; 07F8 _ 72, 0A
000007FA        lea     rax, ptr [rdi+rbx+1H]           ; 07FA _ 48: 8D. 44 1F, 01
000007FF        cmp     rsi, rax                        ; 07FF _ 48: 39. C6
00000802        jc      ?_037                           ; 0802 _ 72, 0E
?_036:
00000804        cmp     rdi, rsi                        ; 0804 _ 48: 39. F7
00000807        jc      ?_038                           ; 0807 _ 72, 21
00000809        lea     rax, ptr [rsi+r14]              ; 0809 _ 4A: 8D. 04 36
0000080D        cmp     rdi, rax                        ; 080D _ 48: 39. C7
00000810        jnc     ?_038                           ; 0810 _ 73, 18
?_037:
00000812        lea     rcx, ptr [?_581]                ; 0812 _ 48: 8D. 0D, 00005EEF(rel)
00000819        lea     r8, ptr [?_588]                 ; 0819 _ 4C: 8D. 05, 00005FFC(rel)
00000820        mov     edx, 642                        ; 0820 _ BA, 00000282
00000825        call    _DebugAssert                    ; 0825 _ E8, FFFFFA21
?_038:
0000082A        cmp     rsi, rdi                        ; 082A _ 48: 39. FE
0000082D        jc      ?_039                           ; 082D _ 72, 14
0000082F        lea     rcx, ptr [rdi+rbx+1H]           ; 082F _ 48: 8D. 4C 1F, 01
00000834        mov     rax, 0FH                        ; 0834 _ 48: B8, 800000000000000F
0000083E        cmp     rsi, rcx                        ; 083E _ 48: 39. CE
00000841        jc      ?_043                           ; 0841 _ 72, 33
?_039:
00000843        cmp     rdi, rsi                        ; 0843 _ 48: 39. F7
00000846        jc      ?_040                           ; 0846 _ 72, 12
00000848        add     r14, rsi                        ; 0848 _ 49: 01. F6
0000084B        mov     rax, 0FH                        ; 084B _ 48: B8, 800000000000000F
00000855        cmp     rdi, r14                        ; 0855 _ 4C: 39. F7
00000858        jc      ?_043                           ; 0858 _ 72, 1C
?_040:
0000085A        mov     al, byte ptr [rdi]              ; 085A _ 8A. 07
0000085C        test    al, al                          ; 085C _ 84. C0
0000085E        jz      ?_042                           ; 085E _ 74, 11
00000860        inc     rdi                             ; 0860 _ 48: FF. C7
?_041:
00000863        mov     byte ptr [rsi], al              ; 0863 _ 88. 06
00000865        inc     rsi                             ; 0865 _ 48: FF. C6
00000868        mov     al, byte ptr [rdi]              ; 0868 _ 8A. 07
0000086A        inc     rdi                             ; 086A _ 48: FF. C7
0000086D        test    al, al                          ; 086D _ 84. C0
0000086F        jnz     ?_041                           ; 086F _ 75, F2
?_042:
00000871        mov     byte ptr [rsi], 0               ; 0871 _ C6. 06, 00
00000874        xor     eax, eax                        ; 0874 _ 31. C0
?_043:
00000876        add     rsp, 32                         ; 0876 _ 48: 83. C4, 20
0000087A        pop     rbx                             ; 087A _ 5B
0000087B        pop     rdi                             ; 087B _ 5F
0000087C        pop     rsi                             ; 087C _ 5E
0000087D        pop     r14                             ; 087D _ 41: 5E
0000087F        pop     rbp                             ; 087F _ 5D
00000880        ret                                     ; 0880 _ C3
_AsciiStrCpyS ENDP

_StrLen PROC
00000881        push    rbp                             ; 0881 _ 55
00000882        mov     rbp, rsp                        ; 0882 _ 48: 89. E5
00000885        push    r15                             ; 0885 _ 41: 57
00000887        push    r14                             ; 0887 _ 41: 56
00000889        push    rsi                             ; 0889 _ 56
0000088A        push    rdi                             ; 088A _ 57
0000088B        push    rbx                             ; 088B _ 53
0000088C        sub     rsp, 40                         ; 088C _ 48: 83. EC, 28
00000890        mov     rsi, rcx                        ; 0890 _ 48: 89. CE
00000893        call    _DebugAssertEnabled             ; 0893 _ E8, FFFFF9B4
00000898        test    al, al                          ; 0898 _ 84. C0
0000089A        jz      ?_044                           ; 089A _ 74, 1D
0000089C        test    rsi, rsi                        ; 089C _ 48: 85. F6
0000089F        jnz     ?_044                           ; 089F _ 75, 18
000008A1        lea     rcx, ptr [?_589]                ; 08A1 _ 48: 8D. 0D, 00005FCF(rel)
000008A8        lea     r8, ptr [?_590]                 ; 08A8 _ 4C: 8D. 05, 0000601B(rel)
000008AF        mov     edx, 172                        ; 08AF _ BA, 000000AC
000008B4        call    _DebugAssert                    ; 08B4 _ E8, FFFFF992
?_044:
000008B9        call    _DebugAssertEnabled             ; 08B9 _ E8, FFFFF98E
000008BE        test    al, al                          ; 08BE _ 84. C0
000008C0        jz      ?_045                           ; 08C0 _ 74, 1E
000008C2        test    sil, 1H                         ; 08C2 _ 40: F6. C6, 01
000008C6        jz      ?_045                           ; 08C6 _ 74, 18
000008C8        lea     rcx, ptr [?_589]                ; 08C8 _ 48: 8D. 0D, 00005FA8(rel)
000008CF        lea     r8, ptr [?_582]                 ; 08CF _ 4C: 8D. 05, 00005E89(rel)
000008D6        mov     edx, 173                        ; 08D6 _ BA, 000000AD
000008DB        call    _DebugAssert                    ; 08DB _ E8, FFFFF96B
?_045:
000008E0        xor     edi, edi                        ; 08E0 _ 31. FF
000008E2        cmp     word ptr [rsi], 0               ; 08E2 _ 66: 83. 3E, 00
000008E6        jz      ?_048                           ; 08E6 _ 74, 44
000008E8        xor     edi, edi                        ; 08E8 _ 31. FF
000008EA        mov     ebx, dword ptr [__gPcd_FixedAtBuild_PcdMaximumUnicodeStringLength]; 08EA _ 8B. 1D, 00007108(rel)
000008F0        lea     r14, ptr [?_589]                ; 08F0 _ 4C: 8D. 35, 00005F80(rel)
000008F7        lea     r15, ptr [?_591]                ; 08F7 _ 4C: 8D. 3D, 00005FE3(rel)
?_046:
000008FE        test    ebx, ebx                        ; 08FE _ 85. DB
00000900        jz      ?_047                           ; 0900 _ 74, 1E
00000902        call    _DebugAssertEnabled             ; 0902 _ E8, FFFFF945
00000907        test    al, al                          ; 0907 _ 84. C0
00000909        jz      ?_047                           ; 0909 _ 74, 15
0000090B        cmp     rdi, rbx                        ; 090B _ 48: 39. DF
0000090E        jc      ?_047                           ; 090E _ 72, 10
00000910        mov     rcx, r14                        ; 0910 _ 4C: 89. F1
00000913        mov     edx, 181                        ; 0913 _ BA, 000000B5
00000918        mov     r8, r15                         ; 0918 _ 4D: 89. F8
0000091B        call    _DebugAssert                    ; 091B _ E8, FFFFF92B
?_047:
00000920        cmp     word ptr [rsi+rdi*2+2H], 0      ; 0920 _ 66: 83. 7C 7E, 02, 00
00000926        lea     rdi, ptr [rdi+1H]               ; 0926 _ 48: 8D. 7F, 01
0000092A        jnz     ?_046                           ; 092A _ 75, D2
?_048:
0000092C        mov     rax, rdi                        ; 092C _ 48: 89. F8
0000092F        add     rsp, 40                         ; 092F _ 48: 83. C4, 28
00000933        pop     rbx                             ; 0933 _ 5B
00000934        pop     rdi                             ; 0934 _ 5F
00000935        pop     rsi                             ; 0935 _ 5E
00000936        pop     r14                             ; 0936 _ 41: 5E
00000938        pop     r15                             ; 0938 _ 41: 5F
0000093A        pop     rbp                             ; 093A _ 5D
0000093B        ret                                     ; 093B _ C3
_StrLen ENDP

_StrSize PROC
0000093C        push    rbp                             ; 093C _ 55
0000093D        mov     rbp, rsp                        ; 093D _ 48: 89. E5
00000940        sub     rsp, 32                         ; 0940 _ 48: 83. EC, 20
00000944        call    _StrLen                         ; 0944 _ E8, FFFFFF38
00000949        lea     rax, ptr [rax+rax+2H]           ; 0949 _ 48: 8D. 44 00, 02
0000094E        add     rsp, 32                         ; 094E _ 48: 83. C4, 20
00000952        pop     rbp                             ; 0952 _ 5D
00000953        ret                                     ; 0953 _ C3
_StrSize ENDP

_AsciiStrSize PROC
00000954        push    rbp                             ; 0954 _ 55
00000955        mov     rbp, rsp                        ; 0955 _ 48: 89. E5
00000958        sub     rsp, 32                         ; 0958 _ 48: 83. EC, 20
0000095C        call    _AsciiStrLen                    ; 095C _ E8, 00000009
00000961        inc     rax                             ; 0961 _ 48: FF. C0
00000964        add     rsp, 32                         ; 0964 _ 48: 83. C4, 20
00000968        pop     rbp                             ; 0968 _ 5D
00000969        ret                                     ; 0969 _ C3
_AsciiStrSize ENDP

_AsciiStrLen PROC
0000096A        push    rbp                             ; 096A _ 55
0000096B        mov     rbp, rsp                        ; 096B _ 48: 89. E5
0000096E        push    r15                             ; 096E _ 41: 57
00000970        push    r14                             ; 0970 _ 41: 56
00000972        push    rsi                             ; 0972 _ 56
00000973        push    rdi                             ; 0973 _ 57
00000974        push    rbx                             ; 0974 _ 53
00000975        sub     rsp, 40                         ; 0975 _ 48: 83. EC, 28
00000979        mov     rsi, rcx                        ; 0979 _ 48: 89. CE
0000097C        call    _DebugAssertEnabled             ; 097C _ E8, FFFFF8CB
00000981        test    al, al                          ; 0981 _ 84. C0
00000983        jz      ?_049                           ; 0983 _ 74, 1D
00000985        test    rsi, rsi                        ; 0985 _ 48: 85. F6
00000988        jnz     ?_049                           ; 0988 _ 75, 18
0000098A        lea     rcx, ptr [?_589]                ; 098A _ 48: 8D. 0D, 00005EE6(rel)
00000991        lea     r8, ptr [?_590]                 ; 0991 _ 4C: 8D. 05, 00005F32(rel)
00000998        mov     edx, 1231                       ; 0998 _ BA, 000004CF
0000099D        call    _DebugAssert                    ; 099D _ E8, FFFFF8A9
?_049:
000009A2        xor     edi, edi                        ; 09A2 _ 31. FF
000009A4        cmp     byte ptr [rsi], 0               ; 09A4 _ 80. 3E, 00
000009A7        jz      ?_052                           ; 09A7 _ 74, 43
000009A9        xor     edi, edi                        ; 09A9 _ 31. FF
000009AB        mov     ebx, dword ptr [__gPcd_FixedAtBuild_PcdMaximumAsciiStringLength]; 09AB _ 8B. 1D, 00007043(rel)
000009B1        lea     r14, ptr [?_589]                ; 09B1 _ 4C: 8D. 35, 00005EBF(rel)
000009B8        lea     r15, ptr [?_594]                ; 09B8 _ 4C: 8D. 3D, 00005FD8(rel)
?_050:
000009BF        test    ebx, ebx                        ; 09BF _ 85. DB
000009C1        jz      ?_051                           ; 09C1 _ 74, 1E
000009C3        call    _DebugAssertEnabled             ; 09C3 _ E8, FFFFF884
000009C8        test    al, al                          ; 09C8 _ 84. C0
000009CA        jz      ?_051                           ; 09CA _ 74, 15
000009CC        cmp     rdi, rbx                        ; 09CC _ 48: 39. DF
000009CF        jc      ?_051                           ; 09CF _ 72, 10
000009D1        mov     rcx, r14                        ; 09D1 _ 4C: 89. F1
000009D4        mov     edx, 1239                       ; 09D4 _ BA, 000004D7
000009D9        mov     r8, r15                         ; 09D9 _ 4D: 89. F8
000009DC        call    _DebugAssert                    ; 09DC _ E8, FFFFF86A
?_051:
000009E1        cmp     byte ptr [rsi+rdi+1H], 0        ; 09E1 _ 80. 7C 3E, 01, 00
000009E6        lea     rdi, ptr [rdi+1H]               ; 09E6 _ 48: 8D. 7F, 01
000009EA        jnz     ?_050                           ; 09EA _ 75, D3
?_052:
000009EC        mov     rax, rdi                        ; 09EC _ 48: 89. F8
000009EF        add     rsp, 40                         ; 09EF _ 48: 83. C4, 28
000009F3        pop     rbx                             ; 09F3 _ 5B
000009F4        pop     rdi                             ; 09F4 _ 5F
000009F5        pop     rsi                             ; 09F5 _ 5E
000009F6        pop     r14                             ; 09F6 _ 41: 5E
000009F8        pop     r15                             ; 09F8 _ 41: 5F
000009FA        pop     rbp                             ; 09FA _ 5D
000009FB        ret                                     ; 09FB _ C3
_AsciiStrLen ENDP

_AsciiStrCmp PROC
000009FC        push    rbp                             ; 09FC _ 55
000009FD        mov     rbp, rsp                        ; 09FD _ 48: 89. E5
00000A00        push    rsi                             ; 0A00 _ 56
00000A01        push    rdi                             ; 0A01 _ 57
00000A02        sub     rsp, 32                         ; 0A02 _ 48: 83. EC, 20
00000A06        mov     rsi, rdx                        ; 0A06 _ 48: 89. D6
00000A09        mov     rdi, rcx                        ; 0A09 _ 48: 89. CF
00000A0C        call    _DebugAssertEnabled             ; 0A0C _ E8, FFFFF83B
00000A11        test    al, al                          ; 0A11 _ 84. C0
00000A13        jz      ?_053                           ; 0A13 _ 74, 26
00000A15        mov     rcx, rdi                        ; 0A15 _ 48: 89. F9
00000A18        call    _AsciiStrLen                    ; 0A18 _ E8, FFFFFF4D
00000A1D        cmp     rax, -1                         ; 0A1D _ 48: 83. F8, FF
00000A21        jnz     ?_053                           ; 0A21 _ 75, 18
00000A23        lea     rcx, ptr [?_589]                ; 0A23 _ 48: 8D. 0D, 00005E4D(rel)
00000A2A        lea     r8, ptr [?_595]                 ; 0A2A _ 4C: 8D. 05, 00005F9E(rel)
00000A31        mov     edx, 1307                       ; 0A31 _ BA, 0000051B
00000A36        call    _DebugAssert                    ; 0A36 _ E8, FFFFF810
?_053:
00000A3B        call    _DebugAssertEnabled             ; 0A3B _ E8, FFFFF80C
00000A40        test    al, al                          ; 0A40 _ 84. C0
00000A42        jz      ?_055                           ; 0A42 _ 74, 2E
00000A44        mov     rcx, rsi                        ; 0A44 _ 48: 89. F1
00000A47        call    _AsciiStrLen                    ; 0A47 _ E8, FFFFFF1E
00000A4C        cmp     rax, -1                         ; 0A4C _ 48: 83. F8, FF
00000A50        jnz     ?_055                           ; 0A50 _ 75, 20
00000A52        lea     rcx, ptr [?_589]                ; 0A52 _ 48: 8D. 0D, 00005E1E(rel)
00000A59        lea     r8, ptr [?_596]                 ; 0A59 _ 4C: 8D. 05, 00005F8A(rel)
00000A60        mov     edx, 1308                       ; 0A60 _ BA, 0000051C
00000A65        call    _DebugAssert                    ; 0A65 _ E8, FFFFF7E1
00000A6A        jmp     ?_055                           ; 0A6A _ EB, 06

?_054:
00000A6C        inc     rsi                             ; 0A6C _ 48: FF. C6
00000A6F        inc     rdi                             ; 0A6F _ 48: FF. C7
?_055:
00000A72        movzx   eax, byte ptr [rdi]             ; 0A72 _ 0F B6. 07
00000A75        mov     cl, byte ptr [rsi]              ; 0A75 _ 8A. 0E
00000A77        test    rax, rax                        ; 0A77 _ 48: 85. C0
00000A7A        jz      ?_056                           ; 0A7A _ 74, 04
00000A7C        cmp     al, cl                          ; 0A7C _ 38. C8
00000A7E        jz      ?_054                           ; 0A7E _ 74, EC
?_056:
00000A80        movzx   ecx, cl                         ; 0A80 _ 0F B6. C9
00000A83        sub     rax, rcx                        ; 0A83 _ 48: 29. C8
00000A86        add     rsp, 32                         ; 0A86 _ 48: 83. C4, 20
00000A8A        pop     rdi                             ; 0A8A _ 5F
00000A8B        pop     rsi                             ; 0A8B _ 5E
00000A8C        pop     rbp                             ; 0A8C _ 5D
00000A8D        ret                                     ; 0A8D _ C3
_AsciiStrCmp ENDP

_AsciiStriCmp PROC
00000A8E        push    rbp                             ; 0A8E _ 55
00000A8F        mov     rbp, rsp                        ; 0A8F _ 48: 89. E5
00000A92        push    rsi                             ; 0A92 _ 56
00000A93        push    rdi                             ; 0A93 _ 57
00000A94        sub     rsp, 32                         ; 0A94 _ 48: 83. EC, 20
00000A98        mov     rsi, rdx                        ; 0A98 _ 48: 89. D6
00000A9B        mov     rdi, rcx                        ; 0A9B _ 48: 89. CF
00000A9E        call    _DebugAssertEnabled             ; 0A9E _ E8, FFFFF7A9
00000AA3        test    al, al                          ; 0AA3 _ 84. C0
00000AA5        jz      ?_057                           ; 0AA5 _ 74, 26
00000AA7        mov     rcx, rdi                        ; 0AA7 _ 48: 89. F9
00000AAA        call    _AsciiStrLen                    ; 0AAA _ E8, FFFFFEBB
00000AAF        cmp     rax, -1                         ; 0AAF _ 48: 83. F8, FF
00000AB3        jnz     ?_057                           ; 0AB3 _ 75, 18
00000AB5        lea     rcx, ptr [?_589]                ; 0AB5 _ 48: 8D. 0D, 00005DBB(rel)
00000ABC        lea     r8, ptr [?_595]                 ; 0ABC _ 4C: 8D. 05, 00005F0C(rel)
00000AC3        mov     edx, 1409                       ; 0AC3 _ BA, 00000581
00000AC8        call    _DebugAssert                    ; 0AC8 _ E8, FFFFF77E
?_057:
00000ACD        call    _DebugAssertEnabled             ; 0ACD _ E8, FFFFF77A
00000AD2        test    al, al                          ; 0AD2 _ 84. C0
00000AD4        jz      ?_058                           ; 0AD4 _ 74, 26
00000AD6        mov     rcx, rsi                        ; 0AD6 _ 48: 89. F1
00000AD9        call    _AsciiStrLen                    ; 0AD9 _ E8, FFFFFE8C
00000ADE        cmp     rax, -1                         ; 0ADE _ 48: 83. F8, FF
00000AE2        jnz     ?_058                           ; 0AE2 _ 75, 18
00000AE4        lea     rcx, ptr [?_589]                ; 0AE4 _ 48: 8D. 0D, 00005D8C(rel)
00000AEB        lea     r8, ptr [?_596]                 ; 0AEB _ 4C: 8D. 05, 00005EF8(rel)
00000AF2        mov     edx, 1410                       ; 0AF2 _ BA, 00000582
00000AF7        call    _DebugAssert                    ; 0AF7 _ E8, FFFFF74F
?_058:
00000AFC        mov     al, byte ptr [rsi]              ; 0AFC _ 8A. 06
00000AFE        mov     cl, al                          ; 0AFE _ 88. C1
00000B00        add     cl, -97                         ; 0B00 _ 80. C1, 9F
00000B03        cmp     cl, 26                          ; 0B03 _ 80. F9, 1A
00000B06        jnc     ?_059                           ; 0B06 _ 73, 02
00000B08        add     al, -32                         ; 0B08 _ 04, E0
?_059:
00000B0A        mov     dl, byte ptr [rdi]              ; 0B0A _ 8A. 17
00000B0C        mov     cl, dl                          ; 0B0C _ 88. D1
00000B0E        add     cl, -97                         ; 0B0E _ 80. C1, 9F
00000B11        cmp     cl, 26                          ; 0B11 _ 80. F9, 1A
00000B14        jnc     ?_060                           ; 0B14 _ 73, 07
00000B16        mov     cl, dl                          ; 0B16 _ 88. D1
00000B18        add     cl, -32                         ; 0B18 _ 80. C1, E0
00000B1B        jmp     ?_061                           ; 0B1B _ EB, 02

?_060:
00000B1D        mov     cl, dl                          ; 0B1D _ 88. D1
?_061:
00000B1F        test    dl, dl                          ; 0B1F _ 84. D2
00000B21        jz      ?_066                           ; 0B21 _ 74, 3B
00000B23        cmp     cl, al                          ; 0B23 _ 38. C1
00000B25        jnz     ?_066                           ; 0B25 _ 75, 37
00000B27        inc     rsi                             ; 0B27 _ 48: FF. C6
00000B2A        inc     rdi                             ; 0B2A _ 48: FF. C7
?_062:
00000B2D        mov     dl, byte ptr [rdi]              ; 0B2D _ 8A. 17
00000B2F        mov     al, byte ptr [rsi]              ; 0B2F _ 8A. 06
00000B31        mov     cl, al                          ; 0B31 _ 88. C1
00000B33        add     cl, -97                         ; 0B33 _ 80. C1, 9F
00000B36        cmp     cl, 26                          ; 0B36 _ 80. F9, 1A
00000B39        jnc     ?_063                           ; 0B39 _ 73, 02
00000B3B        add     al, -32                         ; 0B3B _ 04, E0
?_063:
00000B3D        mov     cl, dl                          ; 0B3D _ 88. D1
00000B3F        add     cl, -97                         ; 0B3F _ 80. C1, 9F
00000B42        cmp     cl, 26                          ; 0B42 _ 80. F9, 1A
00000B45        jnc     ?_064                           ; 0B45 _ 73, 07
00000B47        mov     cl, dl                          ; 0B47 _ 88. D1
00000B49        add     cl, -32                         ; 0B49 _ 80. C1, E0
00000B4C        jmp     ?_065                           ; 0B4C _ EB, 02

?_064:
00000B4E        mov     cl, dl                          ; 0B4E _ 88. D1
?_065:
00000B50        test    dl, dl                          ; 0B50 _ 84. D2
00000B52        jz      ?_066                           ; 0B52 _ 74, 0A
00000B54        inc     rsi                             ; 0B54 _ 48: FF. C6
00000B57        inc     rdi                             ; 0B57 _ 48: FF. C7
00000B5A        cmp     cl, al                          ; 0B5A _ 38. C1
00000B5C        jz      ?_062                           ; 0B5C _ 74, CF
?_066:
00000B5E        movzx   edx, al                         ; 0B5E _ 0F B6. D0
00000B61        movzx   eax, cl                         ; 0B61 _ 0F B6. C1
00000B64        sub     rax, rdx                        ; 0B64 _ 48: 29. D0
00000B67        add     rsp, 32                         ; 0B67 _ 48: 83. C4, 20
00000B6B        pop     rdi                             ; 0B6B _ 5F
00000B6C        pop     rsi                             ; 0B6C _ 5E
00000B6D        pop     rbp                             ; 0B6D _ 5D
00000B6E        ret                                     ; 0B6E _ C3
_AsciiStriCmp ENDP

_AsciiStrnCmp PROC
00000B6F        push    rbp                             ; 0B6F _ 55
00000B70        mov     rbp, rsp                        ; 0B70 _ 48: 89. E5
00000B73        push    r14                             ; 0B73 _ 41: 56
00000B75        push    rsi                             ; 0B75 _ 56
00000B76        push    rdi                             ; 0B76 _ 57
00000B77        push    rbx                             ; 0B77 _ 53
00000B78        sub     rsp, 32                         ; 0B78 _ 48: 83. EC, 20
00000B7C        mov     rsi, r8                         ; 0B7C _ 4C: 89. C6
00000B7F        mov     rdi, rdx                        ; 0B7F _ 48: 89. D7
00000B82        mov     rbx, rcx                        ; 0B82 _ 48: 89. CB
00000B85        xor     eax, eax                        ; 0B85 _ 31. C0
00000B87        test    rsi, rsi                        ; 0B87 _ 48: 85. F6
00000B8A        je      ?_072                           ; 0B8A _ 0F 84, 000000B3
00000B90        call    _DebugAssertEnabled             ; 0B90 _ E8, FFFFF6B7
00000B95        test    al, al                          ; 0B95 _ 84. C0
00000B97        jz      ?_067                           ; 0B97 _ 74, 26
00000B99        mov     rcx, rbx                        ; 0B99 _ 48: 89. D9
00000B9C        call    _AsciiStrLen                    ; 0B9C _ E8, FFFFFDC9
00000BA1        cmp     rax, -1                         ; 0BA1 _ 48: 83. F8, FF
00000BA5        jnz     ?_067                           ; 0BA5 _ 75, 18
00000BA7        lea     rcx, ptr [?_589]                ; 0BA7 _ 48: 8D. 0D, 00005CC9(rel)
00000BAE        lea     r8, ptr [?_595]                 ; 0BAE _ 4C: 8D. 05, 00005E1A(rel)
00000BB5        mov     edx, 1469                       ; 0BB5 _ BA, 000005BD
00000BBA        call    _DebugAssert                    ; 0BBA _ E8, FFFFF68C
?_067:
00000BBF        call    _DebugAssertEnabled             ; 0BBF _ E8, FFFFF688
00000BC4        test    al, al                          ; 0BC4 _ 84. C0
00000BC6        jz      ?_068                           ; 0BC6 _ 74, 26
00000BC8        mov     rcx, rdi                        ; 0BC8 _ 48: 89. F9
00000BCB        call    _AsciiStrLen                    ; 0BCB _ E8, FFFFFD9A
00000BD0        cmp     rax, -1                         ; 0BD0 _ 48: 83. F8, FF
00000BD4        jnz     ?_068                           ; 0BD4 _ 75, 18
00000BD6        lea     rcx, ptr [?_589]                ; 0BD6 _ 48: 8D. 0D, 00005C9A(rel)
00000BDD        lea     r8, ptr [?_596]                 ; 0BDD _ 4C: 8D. 05, 00005E06(rel)
00000BE4        mov     edx, 1470                       ; 0BE4 _ BA, 000005BE
00000BE9        call    _DebugAssert                    ; 0BE9 _ E8, FFFFF65D
?_068:
00000BEE        mov     r14d, dword ptr [__gPcd_FixedAtBuild_PcdMaximumAsciiStringLength]; 0BEE _ 44: 8B. 35, 00006DFF(rel)
00000BF5        test    r14, r14                        ; 0BF5 _ 4D: 85. F6
00000BF8        jz      ?_070                           ; 0BF8 _ 74, 31
00000BFA        call    _DebugAssertEnabled             ; 0BFA _ E8, FFFFF64D
00000BFF        test    al, al                          ; 0BFF _ 84. C0
00000C01        jz      ?_070                           ; 0C01 _ 74, 28
00000C03        cmp     r14, rsi                        ; 0C03 _ 49: 39. F6
00000C06        jnc     ?_070                           ; 0C06 _ 73, 23
00000C08        lea     rcx, ptr [?_589]                ; 0C08 _ 48: 8D. 0D, 00005C68(rel)
00000C0F        lea     r8, ptr [?_593]                 ; 0C0F _ 4C: 8D. 05, 00005D48(rel)
00000C16        mov     edx, 1473                       ; 0C16 _ BA, 000005C1
00000C1B        call    _DebugAssert                    ; 0C1B _ E8, FFFFF62B
00000C20        jmp     ?_070                           ; 0C20 _ EB, 09

?_069:
00000C22        dec     rsi                             ; 0C22 _ 48: FF. CE
00000C25        inc     rdi                             ; 0C25 _ 48: FF. C7
00000C28        inc     rbx                             ; 0C28 _ 48: FF. C3
?_070:
00000C2B        movzx   ecx, byte ptr [rdi]             ; 0C2B _ 0F B6. 0F
00000C2E        movzx   eax, byte ptr [rbx]             ; 0C2E _ 0F B6. 03
00000C31        test    rax, rax                        ; 0C31 _ 48: 85. C0
00000C34        jz      ?_071                           ; 0C34 _ 74, 0A
00000C36        cmp     al, cl                          ; 0C36 _ 38. C8
00000C38        jnz     ?_071                           ; 0C38 _ 75, 06
00000C3A        cmp     rsi, 2                          ; 0C3A _ 48: 83. FE, 02
00000C3E        jnc     ?_069                           ; 0C3E _ 73, E2
?_071:
00000C40        sub     rax, rcx                        ; 0C40 _ 48: 29. C8
?_072:
00000C43        add     rsp, 32                         ; 0C43 _ 48: 83. C4, 20
00000C47        pop     rbx                             ; 0C47 _ 5B
00000C48        pop     rdi                             ; 0C48 _ 5F
00000C49        pop     rsi                             ; 0C49 _ 5E
00000C4A        pop     r14                             ; 0C4A _ 41: 5E
00000C4C        pop     rbp                             ; 0C4C _ 5D
00000C4D        ret                                     ; 0C4D _ C3
_AsciiStrnCmp ENDP

_AsciiStrHexToUintn PROC
00000C4E        push    rbp                             ; 0C4E _ 55
00000C4F        mov     rbp, rsp                        ; 0C4F _ 48: 89. E5
00000C52        push    r15                             ; 0C52 _ 41: 57
00000C54        push    r14                             ; 0C54 _ 41: 56
00000C56        push    r12                             ; 0C56 _ 41: 54
00000C58        push    rsi                             ; 0C58 _ 56
00000C59        push    rdi                             ; 0C59 _ 57
00000C5A        push    rbx                             ; 0C5A _ 53
00000C5B        sub     rsp, 32                         ; 0C5B _ 48: 83. EC, 20
00000C5F        mov     rsi, rcx                        ; 0C5F _ 48: 89. CE
00000C62        call    _DebugAssertEnabled             ; 0C62 _ E8, FFFFF5E5
00000C67        test    al, al                          ; 0C67 _ 84. C0
00000C69        jz      ?_075                           ; 0C69 _ 74, 35
00000C6B        mov     rcx, rsi                        ; 0C6B _ 48: 89. F1
00000C6E        call    _AsciiStrLen                    ; 0C6E _ E8, FFFFFCF7
00000C73        cmp     rax, -1                         ; 0C73 _ 48: 83. F8, FF
00000C77        jnz     ?_075                           ; 0C77 _ 75, 27
00000C79        lea     rcx, ptr [?_589]                ; 0C79 _ 48: 8D. 0D, 00005BF7(rel)
00000C80        lea     r8, ptr [?_597]                 ; 0C80 _ 4C: 8D. 05, 00005D7F(rel)
00000C87        mov     edx, 1855                       ; 0C87 _ BA, 0000073F
00000C8C        call    _DebugAssert                    ; 0C8C _ E8, FFFFF5BA
00000C91        jmp     ?_075                           ; 0C91 _ EB, 0D

?_073:
00000C93        cmp     cl, 32                          ; 0C93 _ 80. F9, 20
00000C96        jz      ?_074                           ; 0C96 _ 74, 05
00000C98        cmp     cl, 9                           ; 0C98 _ 80. F9, 09
00000C9B        jnz     ?_077                           ; 0C9B _ 75, 15
?_074:
00000C9D        inc     rsi                             ; 0C9D _ 48: FF. C6
?_075:
00000CA0        mov     cl, byte ptr [rsi]              ; 0CA0 _ 8A. 0E
00000CA2        cmp     cl, 48                          ; 0CA2 _ 80. F9, 30
00000CA5        jnz     ?_073                           ; 0CA5 _ 75, EC
?_076:
00000CA7        mov     cl, byte ptr [rsi+1H]           ; 0CA7 _ 8A. 4E, 01
00000CAA        inc     rsi                             ; 0CAA _ 48: FF. C6
00000CAD        cmp     cl, 48                          ; 0CAD _ 80. F9, 30
00000CB0        jz      ?_076                           ; 0CB0 _ 74, F5
?_077:
00000CB2        mov     al, cl                          ; 0CB2 _ 88. C8
00000CB4        add     al, -97                         ; 0CB4 _ 04, 9F
00000CB6        cmp     al, 26                          ; 0CB6 _ 3C, 1A
00000CB8        jnc     ?_078                           ; 0CB8 _ 73, 06
00000CBA        mov     al, cl                          ; 0CBA _ 88. C8
00000CBC        add     al, -32                         ; 0CBC _ 04, E0
00000CBE        jmp     ?_079                           ; 0CBE _ EB, 02

?_078:
00000CC0        mov     al, cl                          ; 0CC0 _ 88. C8
?_079:
00000CC2        cmp     al, 88                          ; 0CC2 _ 3C, 58
00000CC4        jnz     ?_081                           ; 0CC4 _ 75, 39
00000CC6        call    _DebugAssertEnabled             ; 0CC6 _ E8, FFFFF581
00000CCB        test    al, al                          ; 0CCB _ 84. C0
00000CCD        jz      ?_080                           ; 0CCD _ 74, 1E
00000CCF        cmp     byte ptr [rsi-1H], 48           ; 0CCF _ 80. 7E, FF, 30
00000CD3        jz      ?_080                           ; 0CD3 _ 74, 18
00000CD5        lea     rcx, ptr [?_589]                ; 0CD5 _ 48: 8D. 0D, 00005B9B(rel)
00000CDC        lea     r8, ptr [?_598]                 ; 0CDC _ 4C: 8D. 05, 00005D3E(rel)
00000CE3        mov     edx, 1872                       ; 0CE3 _ BA, 00000750
00000CE8        call    _DebugAssert                    ; 0CE8 _ E8, FFFFF55E
?_080:
00000CED        xor     eax, eax                        ; 0CED _ 31. C0
00000CEF        cmp     byte ptr [rsi-1H], 48           ; 0CEF _ 80. 7E, FF, 30
00000CF3        jne     ?_090                           ; 0CF3 _ 0F 85, 000000FB
00000CF9        mov     cl, byte ptr [rsi+1H]           ; 0CF9 _ 8A. 4E, 01
00000CFC        inc     rsi                             ; 0CFC _ 48: FF. C6
?_081:
00000CFF        mov     al, cl                          ; 0CFF _ 88. C8
00000D01        add     al, -48                         ; 0D01 _ 04, D0
00000D03        cmp     al, 10                          ; 0D03 _ 3C, 0A
00000D05        jc      ?_082                           ; 0D05 _ 72, 16
00000D07        mov     al, cl                          ; 0D07 _ 88. C8
00000D09        add     al, -65                         ; 0D09 _ 04, BF
00000D0B        cmp     al, 6                           ; 0D0B _ 3C, 06
00000D0D        jc      ?_082                           ; 0D0D _ 72, 0E
00000D0F        add     cl, -97                         ; 0D0F _ 80. C1, 9F
00000D12        xor     eax, eax                        ; 0D12 _ 31. C0
00000D14        cmp     cl, 5                           ; 0D14 _ 80. F9, 05
00000D17        ja      ?_090                           ; 0D17 _ 0F 87, 000000D7
?_082:
00000D1D        inc     rsi                             ; 0D1D _ 48: FF. C6
00000D20        xor     edi, edi                        ; 0D20 _ 31. FF
00000D22        mov     r14, 0FFFFFFFFH                 ; 0D22 _ 49: BE, 0FFFFFFFFFFFFFFF
00000D2C        lea     r15, ptr [?_589]                ; 0D2C _ 4C: 8D. 3D, 00005B44(rel)
00000D33        lea     r12, ptr [?_592]                ; 0D33 _ 4C: 8D. 25, 00005BE1(rel)
?_083:
00000D3A        call    _DebugAssertEnabled             ; 0D3A _ E8, FFFFF50D
00000D3F        test    al, al                          ; 0D3F _ 84. C0
00000D41        jz      ?_086                           ; 0D41 _ 74, 4C
00000D43        movzx   eax, byte ptr [rsi-1H]          ; 0D43 _ 0F B6. 46, FF
00000D47        mov     ecx, eax                        ; 0D47 _ 89. C1
00000D49        add     ecx, -48                        ; 0D49 _ 83. C1, D0
00000D4C        cmp     cx, 9                           ; 0D4C _ 66: 83. F9, 09
00000D50        ja      ?_084                           ; 0D50 _ 77, 09
00000D52        movzx   eax, ax                         ; 0D52 _ 0F B7. C0
00000D55        add     rax, -48                        ; 0D55 _ 48: 83. C0, D0
00000D59        jmp     ?_085                           ; 0D59 _ EB, 18

?_084:
00000D5B        movzx   edx, ax                         ; 0D5B _ 0F B7. D0
00000D5E        lea     ecx, ptr [rdx-20H]              ; 0D5E _ 8D. 4A, E0
00000D61        add     edx, -97                        ; 0D61 _ 83. C2, 9F
00000D64        cmp     dx, 26                          ; 0D64 _ 66: 83. FA, 1A
00000D68        cmovnc  cx, ax                          ; 0D68 _ 66: 0F 43. C8
00000D6C        movzx   eax, cx                         ; 0D6C _ 0F B7. C1
00000D6F        add     rax, -55                        ; 0D6F _ 48: 83. C0, C9
?_085:
00000D73        shr     rax, 4                          ; 0D73 _ 48: C1. E8, 04
00000D77        xor     rax, r14                        ; 0D77 _ 4C: 31. F0
00000D7A        cmp     rdi, rax                        ; 0D7A _ 48: 39. C7
00000D7D        jbe     ?_086                           ; 0D7D _ 76, 10
00000D7F        mov     rcx, r15                        ; 0D7F _ 4C: 89. F9
00000D82        mov     edx, 1889                       ; 0D82 _ BA, 00000761
00000D87        mov     r8, r12                         ; 0D87 _ 4D: 89. E0
00000D8A        call    _DebugAssert                    ; 0D8A _ E8, FFFFF4BC
?_086:
00000D8F        shl     rdi, 4                          ; 0D8F _ 48: C1. E7, 04
00000D93        movzx   eax, byte ptr [rsi-1H]          ; 0D93 _ 0F B6. 46, FF
00000D97        mov     ecx, eax                        ; 0D97 _ 89. C1
00000D99        add     ecx, -48                        ; 0D99 _ 83. C1, D0
00000D9C        cmp     cx, 9                           ; 0D9C _ 66: 83. F9, 09
00000DA0        ja      ?_087                           ; 0DA0 _ 77, 06
00000DA2        lea     rax, ptr [rax-30H]              ; 0DA2 _ 48: 8D. 40, D0
00000DA6        jmp     ?_089                           ; 0DA6 _ EB, 13

?_087:
00000DA8        mov     cl, al                          ; 0DA8 _ 88. C1
00000DAA        add     cl, -97                         ; 0DAA _ 80. C1, 9F
00000DAD        cmp     cl, 26                          ; 0DAD _ 80. F9, 1A
00000DB0        jnc     ?_088                           ; 0DB0 _ 73, 02
00000DB2        add     al, -32                         ; 0DB2 _ 04, E0
?_088:
00000DB4        movzx   eax, al                         ; 0DB4 _ 0F B6. C0
00000DB7        add     rax, -55                        ; 0DB7 _ 48: 83. C0, C9
?_089:
00000DBB        add     rax, rdi                        ; 0DBB _ 48: 01. F8
00000DBE        mov     cl, byte ptr [rsi]              ; 0DBE _ 8A. 0E
00000DC0        inc     rsi                             ; 0DC0 _ 48: FF. C6
00000DC3        mov     bl, cl                          ; 0DC3 _ 88. CB
00000DC5        add     bl, -97                         ; 0DC5 _ 80. C3, 9F
00000DC8        mov     dl, cl                          ; 0DC8 _ 88. CA
00000DCA        add     dl, -65                         ; 0DCA _ 80. C2, BF
00000DCD        add     cl, -48                         ; 0DCD _ 80. C1, D0
00000DD0        cmp     cl, 10                          ; 0DD0 _ 80. F9, 0A
00000DD3        mov     rdi, rax                        ; 0DD3 _ 48: 89. C7
00000DD6        jc      ?_083                           ; 0DD6 _ 0F 82, FFFFFF5E
00000DDC        cmp     dl, 6                           ; 0DDC _ 80. FA, 06
00000DDF        mov     rdi, rax                        ; 0DDF _ 48: 89. C7
00000DE2        jc      ?_083                           ; 0DE2 _ 0F 82, FFFFFF52
00000DE8        cmp     bl, 6                           ; 0DE8 _ 80. FB, 06
00000DEB        mov     rdi, rax                        ; 0DEB _ 48: 89. C7
00000DEE        jc      ?_083                           ; 0DEE _ 0F 82, FFFFFF46
?_090:
00000DF4        add     rsp, 32                         ; 0DF4 _ 48: 83. C4, 20
00000DF8        pop     rbx                             ; 0DF8 _ 5B
00000DF9        pop     rdi                             ; 0DF9 _ 5F
00000DFA        pop     rsi                             ; 0DFA _ 5E
00000DFB        pop     r12                             ; 0DFB _ 41: 5C
00000DFD        pop     r14                             ; 0DFD _ 41: 5E
00000DFF        pop     r15                             ; 0DFF _ 41: 5F
00000E01        pop     rbp                             ; 0E01 _ 5D
00000E02        ret                                     ; 0E02 _ C3
_AsciiStrHexToUintn ENDP

00000E03        nop                                     ; 0E03 _ 90
00000E04        nop                                     ; 0E04 _ 90
00000E05        nop                                     ; 0E05 _ 90
00000E06        nop                                     ; 0E06 _ 90
00000E07        nop                                     ; 0E07 _ 90

_m16Start label byte
SavedGdt label byte
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0E08 _ ........
        db 00H, 00H                                     ; 0E10 _ ..

_BackFromUserCode LABEL NEAR
00000E12;       push ss                                 ; 0E12 _ 16
; Error: This instruction is not allowed in 64 bit mode
        db 16H00000E13; push cs                         ; 0E13 _ 0E
; Error: This instruction is not allowed in 64 bit mode
        db 0EH00000E14; call_BackFromUserCode.Base      ; 0E14 _ 66: E8, 00000000
; Note: Prefix bit or byte has no meaning in this context
        db 66H, 0E8H, 00H, 00H, 00H, 00H

_BackFromUserCode.Base LABEL NEAR
00000E1A        push    word ptr 0                      ; 0E1A _ 66: 6A, 00
; Note: Non-default size for stack operation
00000E1D        pushf                                   ; 0E1D _ 66: 9C
; Note: Non-default size for stack operation
00000E1F        cli                                     ; 0E1F _ FA
00000E20        push gs                                 ; 0E20 _ 0F A8
00000E22        push fs                                 ; 0E22 _ 0F A0
00000E24;       push es                                 ; 0E24 _ 06
; Error: This instruction is not allowed in 64 bit mode
        db 06H00000E25; push ds                         ; 0E25 _ 1E
; Error: This instruction is not allowed in 64 bit mode
        db 1EH00000E26; pushaw                          ; 0E26 _ 66: 60
; Error: This instruction is not allowed in 64 bit mode
; Note: Non-default size for stack operation
        db 66H, 60H
00000E28;       mov     dx, 0                           ; 0E28 _ 66: BA, 0000
; Note: Length-changing prefix causes delay on Intel processors
        db 66H, 0BAH, 00H, 00H
00000E2C;       add     byte ptr [rax], al              ; 0E2C _ 00. 00
; Error: This is unlikely to be code

        db 00H, 00H                                     ; 0E2C _ ..

_BackFromUserCode.ThunkAttrEnd LABEL NEAR
00000E2E        test    dl, 2H                          ; 0E2E _ F6. C2, 02
00000E31        jz      _BackFromUserCode.1             ; 0E31 _ 74, 08
00000E33        mov     eax, 365765633                  ; 0E33 _ B8, 15CD2401
00000E38        cli                                     ; 0E38 _ FA
00000E39        jnc     _BackFromUserCode.2             ; 0E39 _ 73, 0B

_BackFromUserCode.1 LABEL NEAR
00000E3B        test    dl, 4H                          ; 0E3B _ F6. C2, 04
00000E3E        jz      _BackFromUserCode.2             ; 0E3E _ 74, 06
00000E40        in      al, -110                        ; 0E40 _ E4, 92
00000E42        or      al, 2H                          ; 0E42 _ 0C, 02
00000E44        out     0FFFFFF92H, al                  ; 0E44 _ E6, 92

_BackFromUserCode.2 LABEL NEAR
00000E46        xor     ax, ax                          ; 0E46 _ 66: 31. C0
00000E49        mov     eax, ss                         ; 0E49 _ 8C. D0
00000E4B        lea     bp, ptr [esp+38H]               ; 0E4B _ 66 67: 8D. 6C 24, 38
; Note: Address size prefix should be avoided
00000E51        mov     word ptr [rsi-2CH], bp          ; 0E51 _ 66: 89. 6E, D4
00000E55        mov     bx, word ptr [rsi-8H]           ; 0E55 _ 66: 8B. 5E, F8
00000E59        shl     ax, 4                           ; 0E59 _ 66: C1. E0, 04
00000E5D        add     bp, ax                          ; 0E5D _ 66: 01. C5
00000E60        mov     ax, cs                          ; 0E60 _ 66: 8C. C8
00000E63        shl     ax, 4                           ; 0E63 _ 66: C1. E0, 04
00000E67        lea     ax, ptr [eax+ebx+89H]           ; 0E67 _ 66 67: 8D. 84 18, 00000089
; Note: Address size prefix should be avoided
00000E70        mov     word ptr cs:[rdi-4799FF7DH], ax ; 0E70 _ 2E 66: 89. 87, B8660083
; Note: Prefix bit or byte has no meaning in this context
00000E78;       add     byte ptr [rax], al              ; 0E78 _ 00. 00
; Error: This is unlikely to be code
        db 00H, 00H
00000E7A;       add     byte ptr [rax], al              ; 0E7A _ 00. 00
; Error: This is unlikely to be code

        db 00H, 00H                                     ; 0E7A _ ..

_BackFromUserCode.SavedCr4End LABEL NEAR
00000E7C        mov     cr4, rax                        ; 0E7C _ 0F 22. E0
00000E7F        lgdt    dword ptr cs:[rdi-12H]          ; 0E7F _ 2E 66: 0F 01. 57, EE
; Note: Prefix bit or byte has no meaning in this context
00000E85        mov     cx, 128                         ; 0E85 _ 66: B9, 0080
; Note: Length-changing prefix causes delay on Intel processors
00000E89        add     al, al                          ; 0E89 _ 00. C0
00000E8B        rdmsr                                   ; 0E8B _ 0F 32
00000E8D        or      ah, 1H                          ; 0E8D _ 80. CC, 01
00000E90        wrmsr                                   ; 0E90 _ 0F 30
00000E92        mov     ax, 0                           ; 0E92 _ 66: B8, 0000
; Note: Length-changing prefix causes delay on Intel processors
00000E96;       add     byte ptr [rax], al              ; 0E96 _ 00. 00
; Error: This is unlikely to be code
        db 00H, 00H

_BackFromUserCode.SavedCr0End LABEL NEAR
00000E98        mov     cr0, rax                        ; 0E98 _ 0F 22. C0
00000E9B;       jmp     far ptr 0000H:0H                ; 0E9B _ 66: EA, 0000 0000
; Error: This instruction is not allowed in 64 bit mode
; Note: Prefix bit or byte has no meaning in this context
        db 66H, 0EAH, 00H, 00H, 00H, 00H
00000EA1;       add     byte ptr [rax], al              ; 0EA1 _ 00. 00
; Error: This is unlikely to be code

        db 00H, 00H                                     ; 0EA1 _ ..

_BackFromUserCode.X64JmpEnd LABEL NEAR
00000EA3        nop                                     ; 0EA3 _ 90
00000EA4        mov     rsp, 0                          ; 0EA4 _ 48: BC, 0000000000000000
; Note: Immediate operand could be made smaller by zero extension

_BackFromUserCode.SavedSpEnd LABEL NEAR
00000EAE        nop                                     ; 0EAE _ 90
00000EAF        ret                                     ; 0EAF _ C3

_EntryPoint LABEL NEAR
00000EB0        mov     esi, 134217728                  ; 0EB0 _ BE, 08000000
00000EB5        add     byte ptr [rdi], bl              ; 0EB5 _ 00. 1F
; Warning: Label out of phase with instruction. Possibly spurious
; _16Gdtr; Misplaced symbol at address 00000C76
00000EB7        add     byte ptr [rax], al              ; 0EB7 _ 00. 00
; Warning: Label out of phase with instruction. Possibly spurious
; _16GdtrBase; Misplaced symbol at address 00000C78
00000EB9;       add     byte ptr [rax], al              ; 0EB9 _ 00. 00
; Error: This is unlikely to be code
        db 00H, 00H
00000EBB;       add     byte ptr [rax], al              ; 0EBB _ 00. 00
; Error: This is unlikely to be code

        db 00H, 00H, 00H, 00H, 00H                      ; 0EBB _ .....

_16Idtr LABEL NEAR
00000EC0        inc     dword ptr [rbx]                 ; 0EC0 _ FF. 03
00000EC2;       add     byte ptr [rax], al              ; 0EC2 _ 00. 00
; Error: This is unlikely to be code
        db 00H, 00H
00000EC4;       add     byte ptr [rax], al              ; 0EC4 _ 00. 00
; Error: This is unlikely to be code

        db 00H, 00H                                     ; 0EC4 _ ..

_ToUserCode LABEL NEAR
00000EC6        mov     ss, edx                         ; 0EC6 _ 8E. D2
00000EC8        mov     ds, edx                         ; 0EC8 _ 8E. DA
00000ECA        mov     es, edx                         ; 0ECA _ 8E. C2
00000ECC        mov     fs, edx                         ; 0ECC _ 8E. E2
00000ECE        mov     gs, edx                         ; 0ECE _ 8E. EA
00000ED0        mov     cx, 128                         ; 0ED0 _ 66: B9, 0080
; Note: Length-changing prefix causes delay on Intel processors
00000ED4        add     al, al                          ; 0ED4 _ 00. C0
00000ED6        mov     cr0, rax                        ; 0ED6 _ 0F 22. C0
00000ED9        rdmsr                                   ; 0ED9 _ 0F 32
00000EDB        and     ah, 0FFFFFFFEH                  ; 0EDB _ 80. E4, FE
00000EDE        wrmsr                                   ; 0EDE _ 0F 30
00000EE0        mov     cr4, rbp                        ; 0EE0 _ 0F 22. E5
00000EE3        mov     ss, esi                         ; 0EE3 _ 8E. D6
00000EE5        mov     sp, bx                          ; 0EE5 _ 66: 89. DC
00000EE8        DB      66H                             ; Prefix coded explicitly
                call    _ToUserCode.Base                ; 0EE8 _ 66: E8, 00000000
; Note: Prefix bit or byte has no meaning in this context

_ToUserCode.Base LABEL NEAR
00000EEE        pop     bp                              ; 0EEE _ 66: 5D
; Note: Non-default size for stack operation
00000EF0        push    qword ptr [esp+3AH]             ; 0EF0 _ 67: FF. B4 24, 0000003A
; Note: Displacement could be made smaller by sign extension
; Note: Address size prefix should be avoided
; Note: Stack pointer truncated by address size prefix
00000EF8        lea     eax, ptr [rsi+0FH]              ; 0EF8 _ 8D. 46, 0F
00000EFB        push    rax                             ; 0EFB _ 50
00000EFC        retf                                    ; 0EFC _ CB

_ToUserCode.RealMode LABEL NEAR
00000EFD        lidt    dword ptr cs:[rsi-2EH]          ; 0EFD _ 2E 66: 0F 01. 5E, D2
; Note: Prefix bit or byte has no meaning in this context
00000F03;       popaw                                   ; 0F03 _ 66: 61
; Error: This instruction is not allowed in 64 bit mode
; Note: Non-default size for stack operation
        db 66H, 61H
00000F05;       pop  ds                                 ; 0F05 _ 1F
; Error: This instruction is not allowed in 64 bit mode
        db 1FH00000F06; pop  es                         ; 0F06 _ 07
; Error: This instruction is not allowed in 64 bit mode
        db 07H00000F07; pop  fs                         ; 0F07 _ 0F A1
        db 0FH, 0A1H
00000F09;       pop  gs                                 ; 0F09 _ 0F A9
        db 0FH, 0A9H
00000F0B;       popf                                    ; 0F0B _ 66: 9D
; Note: Non-default size for stack operation
        db 66H, 9DH
00000F0D;       lea     sp, ptr [esp+4H]                ; 0F0D _ 66 67: 8D. 64 24, 04
; Note: Address size prefix should be avoided
        db 66H, 67H, 8DH, 64H, 24H, 04H
00000F13;       retf                                    ; 0F13 _ 66: CB
; Note: Prefix bit or byte has no meaning in this context
; Note: Non-default size for stack operation
        db 66H, 0CBH
00000F15;       nop                                     ; 0F15 _ 90
        db 90H00000F16; nop                             ; 0F16 _ 90
        db 90H00000F17; nop                             ; 0F17 _ 90
        db 90H

_NullSeg LABEL NEAR
00000F18;       add     byte ptr [rax], al              ; 0F18 _ 00. 00
; Error: This is unlikely to be code
        db 00H, 00H
00000F1A;       add     byte ptr [rax], al              ; 0F1A _ 00. 00
; Error: This is unlikely to be code

        db 00H, 00H, 00H, 00H, 00H, 00H                 ; 0F1A _ ......

_16Code LABEL NEAR
00000F20;       UNDEFINEDedi                            ; 0F20 _ FF. FF
; Error: This is unlikely to be code
        db 0FFH, 0FFH
00000F22;       add     byte ptr [rax], al              ; 0F22 _ 00. 00
; Error: This is unlikely to be code

        db 00H, 00H, 00H, 9BH, 8FH, 00H                 ; 0F22 _ ......

_16Data LABEL NEAR
00000F28;       UNDEFINEDedi                            ; 0F28 _ FF. FF
; Error: This is unlikely to be code
        db 0FFH, 0FFH
00000F2A;       add     byte ptr [rax], al              ; 0F2A _ 00. 00
; Error: This is unlikely to be code

        db 00H, 00H, 00H, 93H, 8FH, 00H                 ; 0F2A _ ......

_32Data LABEL NEAR
00000F30;       UNDEFINEDedi                            ; 0F30 _ FF. FF
; Error: This is unlikely to be code
        db 0FFH, 0FFH
00000F32;       add     byte ptr [rax], al              ; 0F32 _ 00. 00
; Error: This is unlikely to be code

        db 00H, 00H, 00H, 93H, 0CFH, 00H                ; 0F32 _ ......

_InternalAsmThunk16 LABEL NEAR
00000F38        push    rbp                             ; 0F38 _ 55
00000F39        push    rbx                             ; 0F39 _ 53
00000F3A        push    rsi                             ; 0F3A _ 56
00000F3B        push    rdi                             ; 0F3B _ 57
00000F3C        mov     ebx, ds                         ; 0F3C _ 8C. DB
00000F3E        push    rbx                             ; 0F3E _ 53
00000F3F        mov     ebx, es                         ; 0F3F _ 8C. C3
00000F41        push    rbx                             ; 0F41 _ 53
00000F42        mov     ebx, ss                         ; 0F42 _ 8C. D3
00000F44        push    rbx                             ; 0F44 _ 53
00000F45        push fs                                 ; 0F45 _ 0F A0
00000F47        push gs                                 ; 0F47 _ 0F A8
00000F49        mov     rsi, rcx                        ; 0F49 _ 48: 89. CE
00000F4C        movzx   r8d, word ptr [rsi+36H]         ; 0F4C _ 44: 0F B7. 46, 36
00000F51        mov     edi, dword ptr [rsi+0CH]        ; 0F51 _ 8B. 7E, 0C
00000F54        lea     rdi, ptr [edi-3CH]              ; 0F54 _ 67 48: 8D. 7F, C4
; Note: Address size prefix should be avoided
00000F59        imul    eax, r8d, 16                    ; 0F59 _ 41: 6B. C0, 10
00000F5D        mov     ebx, edi                        ; 0F5D _ 89. FB
00000F5F        push    14                              ; 0F5F _ 6A, 0E
00000F61        add     edi, eax                        ; 0F61 _ 01. C7
00000F63        pop     rcx                             ; 0F63 _ 59
00000F64rep movsd                                       ; 0F64 _ F3: A5
00000F66        lea     ecx, ptr [rdx+74H]              ; 0F66 _ 8D. 4A, 74
00000F69        mov     eax, edx                        ; 0F69 _ 89. D0
00000F6B        and     edx, 0FH                        ; 0F6B _ 83. E2, 0F
00000F6E        shl     eax, 12                         ; 0F6E _ C1. E0, 0C
00000F71        lea     ax, ptr [rdx+0AH]               ; 0F71 _ 66: 8D. 42, 0A
00000F75stosd                                           ; 0F75 _ AB
00000F76        sgdt    fword ptr [rsp+60H]             ; 0F76 _ 0F 01. 44 24, 60
00000F7B        movzx   r10, word ptr [rsp+60H]         ; 0F7B _ 4C: 0F B7. 54 24, 60
00000F81        lea     r11, ptr [rcx+0CBH]             ; 0F81 _ 4C: 8D. 99, 000000CB
00000F88        and     r11, 0FFFFFFF0H                 ; 0F88 _ 49: 83. E3, F0
00000F8C        mov     word ptr [rcx-74H], r10w        ; 0F8C _ 66 44: 89. 51, 8C
00000F91        mov     qword ptr [rcx-72H], r11        ; 0F91 _ 4C: 89. 59, 8E
00000F95        mov     rsi, qword ptr [rsp+62H]        ; 0F95 _ 48: 8B. 74 24, 62
00000F9A        xchg    r10, rcx                        ; 0F9A _ 49: 87. CA
00000F9D        inc     rcx                             ; 0F9D _ 48: FF. C1
00000FA0        xchg    r11, rdi                        ; 0FA0 _ 49: 87. FB
00000FA3rep movsb                                       ; 0FA3 _ F3: A4
00000FA5        mov     rcx, r10                        ; 0FA5 _ 4C: 89. D1
00000FA8        mov     rdi, r11                        ; 0FA8 _ 4C: 89. DF
00000FAB        sidt    fword ptr [rsp+50H]             ; 0FAB _ 0F 01. 4C 24, 50
00000FB0        mov     rax, cr0                        ; 0FB0 _ 0F 20. C0
00000FB3        mov     dword ptr [rcx+18H], eax        ; 0FB3 _ 89. 41, 18
00000FB6        and     eax, 7FFFFFFEH                  ; 0FB6 _ 25, 7FFFFFFE
00000FBB        mov     rbp, cr4                        ; 0FBB _ 0F 20. E5
00000FBE        mov     dword ptr [rcx-4H], ebp         ; 0FBE _ 89. 69, FC
00000FC1        and     ebp, 0FFFFFFCFH                 ; 0FC1 _ 83. E5, CF
00000FC4        mov     esi, r8d                        ; 0FC4 _ 44: 89. C6
00000FC7        push    24                              ; 0FC7 _ 6A, 18
00000FC9        pop     rdx                             ; 0FC9 _ 5A
00000FCA        lgdt    fword ptr [rcx+3AH]             ; 0FCA _ 0F 01. 51, 3A
00000FCE        mov     ss, edx                         ; 0FCE _ 8E. D2
00000FD0        pushfd                                  ; 0FD0 _ 9C
00000FD1        lea     edx, ptr [rdx-8H]               ; 0FD1 _ 8D. 52, F8
00000FD4        lea     r8, ptr [_InternalAsmThunk16.RetFromRealMode]; 0FD4 _ 4C: 8D. 05, 00000011(rel)
00000FDB        push    r8                              ; 0FDB _ 41: 50
00000FDD        mov     r8d, cs                         ; 0FDD _ 41: 8C. C8
00000FE0        mov     word ptr [rcx+25H], r8w         ; 0FE0 _ 66 44: 89. 41, 25
00000FE5        mov     qword ptr [rcx+2AH], rsp        ; 0FE5 _ 48: 89. 61, 2A
00000FE9        jmp     fword ptr [rcx+34H]             ; 0FE9 _ FF. 69, 34
_m16Start ENDP

_InternalAsmThunk16.RetFromRealMode LABEL NEAR
00000FEC        popfd                                   ; 0FEC _ 9D
00000FED        lgdt    fword ptr [rsp+60H]             ; 0FED _ 0F 01. 54 24, 60
00000FF2        lidt    fword ptr [rsp+50H]             ; 0FF2 _ 0F 01. 5C 24, 50
00000FF7        lea     eax, ptr [rbp-38H]              ; 0FF7 _ 8D. 45, C8
00000FFA        pop  gs                                 ; 0FFA _ 0F A9
00000FFC        pop  fs                                 ; 0FFC _ 0F A1
00000FFE        pop     rbx                             ; 0FFE _ 5B
00000FFF        mov     ss, ebx                         ; 0FFF _ 8E. D3
00001001        pop     rbx                             ; 1001 _ 5B
00001002        mov     es, ebx                         ; 1002 _ 8E. C3
00001004        pop     rbx                             ; 1004 _ 5B
00001005        mov     ds, ebx                         ; 1005 _ 8E. DB
00001007        pop     rdi                             ; 1007 _ 5F
00001008        pop     rsi                             ; 1008 _ 5E
00001009        pop     rbx                             ; 1009 _ 5B
0000100A        pop     rbp                             ; 100A _ 5D
0000100B        ret                                     ; 100B _ C3

_InternalMathDivRemU64x32 PROC
0000100C        mov     r9d, edx                        ; 100C _ 41: 89. D1
0000100F        test    r8, r8                          ; 100F _ 4D: 85. C0
00001012        jz      ?_091                           ; 1012 _ 74, 0B
00001014        mov     rax, rcx                        ; 1014 _ 48: 89. C8
00001017        xor     edx, edx                        ; 1017 _ 31. D2
00001019        div     r9                              ; 1019 _ 49: F7. F1
0000101C        mov     dword ptr [r8], edx             ; 101C _ 41: 89. 10
?_091:
0000101F        mov     rax, rcx                        ; 101F _ 48: 89. C8
00001022        xor     edx, edx                        ; 1022 _ 31. D2
00001024        div     r9                              ; 1024 _ 49: F7. F1
00001027        ret                                     ; 1027 _ C3
_InternalMathDivRemU64x32 ENDP

_ReadUnaligned16 PROC
00001028        push    rbp                             ; 1028 _ 55
00001029        mov     rbp, rsp                        ; 1029 _ 48: 89. E5
0000102C        push    rsi                             ; 102C _ 56
0000102D        sub     rsp, 40                         ; 102D _ 48: 83. EC, 28
00001031        mov     rsi, rcx                        ; 1031 _ 48: 89. CE
00001034        call    _DebugAssertEnabled             ; 1034 _ E8, FFFFF213
00001039        test    al, al                          ; 1039 _ 84. C0
0000103B        jz      ?_092                           ; 103B _ 74, 1D
0000103D        test    rsi, rsi                        ; 103D _ 48: 85. F6
00001040        jnz     ?_092                           ; 1040 _ 75, 18
00001042        lea     rcx, ptr [?_599]                ; 1042 _ 48: 8D. 0D, 000059ED(rel)
00001049        lea     r8, ptr [?_563]                 ; 1049 _ 4C: 8D. 05, 000052B2(rel)
00001050        mov     edx, 38                         ; 1050 _ BA, 00000026
00001055        call    _DebugAssert                    ; 1055 _ E8, FFFFF1F1
?_092:
0000105A        movzx   eax, word ptr [rsi]             ; 105A _ 0F B7. 06
0000105D        add     rsp, 40                         ; 105D _ 48: 83. C4, 28
00001061        pop     rsi                             ; 1061 _ 5E
00001062        pop     rbp                             ; 1062 _ 5D
00001063        ret                                     ; 1063 _ C3
_ReadUnaligned16 ENDP

_ReadUnaligned32 PROC
00001064        push    rbp                             ; 1064 _ 55
00001065        mov     rbp, rsp                        ; 1065 _ 48: 89. E5
00001068        push    rsi                             ; 1068 _ 56
00001069        sub     rsp, 40                         ; 1069 _ 48: 83. EC, 28
0000106D        mov     rsi, rcx                        ; 106D _ 48: 89. CE
00001070        call    _DebugAssertEnabled             ; 1070 _ E8, FFFFF1D7
00001075        test    al, al                          ; 1075 _ 84. C0
00001077        jz      ?_093                           ; 1077 _ 74, 1D
00001079        test    rsi, rsi                        ; 1079 _ 48: 85. F6
0000107C        jnz     ?_093                           ; 107C _ 75, 18
0000107E        lea     rcx, ptr [?_599]                ; 107E _ 48: 8D. 0D, 000059B1(rel)
00001085        lea     r8, ptr [?_563]                 ; 1085 _ 4C: 8D. 05, 00005276(rel)
0000108C        mov     edx, 141                        ; 108C _ BA, 0000008D
00001091        call    _DebugAssert                    ; 1091 _ E8, FFFFF1B5
?_093:
00001096        mov     eax, dword ptr [rsi]            ; 1096 _ 8B. 06
00001098        add     rsp, 40                         ; 1098 _ 48: 83. C4, 28
0000109C        pop     rsi                             ; 109C _ 5E
0000109D        pop     rbp                             ; 109D _ 5D
0000109E        ret                                     ; 109E _ C3
_ReadUnaligned32 ENDP

_ReadUnaligned64 PROC
0000109F        push    rbp                             ; 109F _ 55
000010A0        mov     rbp, rsp                        ; 10A0 _ 48: 89. E5
000010A3        push    rsi                             ; 10A3 _ 56
000010A4        sub     rsp, 40                         ; 10A4 _ 48: 83. EC, 28
000010A8        mov     rsi, rcx                        ; 10A8 _ 48: 89. CE
000010AB        call    _DebugAssertEnabled             ; 10AB _ E8, FFFFF19C
000010B0        test    al, al                          ; 10B0 _ 84. C0
000010B2        jz      ?_094                           ; 10B2 _ 74, 1D
000010B4        test    rsi, rsi                        ; 10B4 _ 48: 85. F6
000010B7        jnz     ?_094                           ; 10B7 _ 75, 18
000010B9        lea     rcx, ptr [?_599]                ; 10B9 _ 48: 8D. 0D, 00005976(rel)
000010C0        lea     r8, ptr [?_563]                 ; 10C0 _ 4C: 8D. 05, 0000523B(rel)
000010C7        mov     edx, 192                        ; 10C7 _ BA, 000000C0
000010CC        call    _DebugAssert                    ; 10CC _ E8, FFFFF17A
?_094:
000010D1        mov     rax, qword ptr [rsi]            ; 10D1 _ 48: 8B. 06
000010D4        add     rsp, 40                         ; 10D4 _ 48: 83. C4, 28
000010D8        pop     rsi                             ; 10D8 _ 5E
000010D9        pop     rbp                             ; 10D9 _ 5D
000010DA        ret                                     ; 10DA _ C3
_ReadUnaligned64 ENDP

_WriteUnaligned64 PROC
000010DB        push    rbp                             ; 10DB _ 55
000010DC        mov     rbp, rsp                        ; 10DC _ 48: 89. E5
000010DF        push    rsi                             ; 10DF _ 56
000010E0        push    rdi                             ; 10E0 _ 57
000010E1        sub     rsp, 32                         ; 10E1 _ 48: 83. EC, 20
000010E5        mov     rsi, rdx                        ; 10E5 _ 48: 89. D6
000010E8        mov     rdi, rcx                        ; 10E8 _ 48: 89. CF
000010EB        call    _DebugAssertEnabled             ; 10EB _ E8, FFFFF15C
000010F0        test    al, al                          ; 10F0 _ 84. C0
000010F2        jz      ?_095                           ; 10F2 _ 74, 1D
000010F4        test    rdi, rdi                        ; 10F4 _ 48: 85. FF
000010F7        jnz     ?_095                           ; 10F7 _ 75, 18
000010F9        lea     rcx, ptr [?_599]                ; 10F9 _ 48: 8D. 0D, 00005936(rel)
00001100        lea     r8, ptr [?_563]                 ; 1100 _ 4C: 8D. 05, 000051FB(rel)
00001107        mov     edx, 219                        ; 1107 _ BA, 000000DB
0000110C        call    _DebugAssert                    ; 110C _ E8, FFFFF13A
?_095:
00001111        mov     qword ptr [rdi], rsi            ; 1111 _ 48: 89. 37
00001114        mov     rax, rsi                        ; 1114 _ 48: 89. F0
00001117        add     rsp, 32                         ; 1117 _ 48: 83. C4, 20
0000111B        pop     rdi                             ; 111B _ 5F
0000111C        pop     rsi                             ; 111C _ 5E
0000111D        pop     rbp                             ; 111D _ 5D
0000111E        ret                                     ; 111E _ C3
_WriteUnaligned64 ENDP

_InternalSwitchStack PROC
0000111F        push    rbp                             ; 111F _ 55
00001120        mov     rbp, rsp                        ; 1120 _ 48: 89. E5
00001123        mov     rax, rcx                        ; 1123 _ 48: 89. C8
00001126        mov     rcx, rdx                        ; 1126 _ 48: 89. D1
00001129        mov     rdx, r8                         ; 1129 _ 4C: 89. C2
0000112C        lea     rsp, ptr [r9-20H]               ; 112C _ 49: 8D. 61, E0
00001130        push    0                               ; 1130 _ 6A, 00
00001132        jmp     rax                             ; 1132 _ FF. E0
_InternalSwitchStack ENDP

_SetJump PROC
00001134        push    rcx                             ; 1134 _ 51
00001135        add     rsp, -32                        ; 1135 _ 48: 83. C4, E0
00001139        call    _InternalAssertJumpBuffer       ; 1139 _ E8, FFFFF4AB
0000113E        add     rsp, 32                         ; 113E _ 48: 83. C4, 20
00001142        pop     rcx                             ; 1142 _ 59
00001143        pop     rdx                             ; 1143 _ 5A
00001144        mov     qword ptr [rcx], rbx            ; 1144 _ 48: 89. 19
00001147        mov     qword ptr [rcx+8H], rsp         ; 1147 _ 48: 89. 61, 08
0000114B        mov     qword ptr [rcx+10H], rbp        ; 114B _ 48: 89. 69, 10
0000114F        mov     qword ptr [rcx+18H], rdi        ; 114F _ 48: 89. 79, 18
00001153        mov     qword ptr [rcx+20H], rsi        ; 1153 _ 48: 89. 71, 20
00001157        mov     qword ptr [rcx+28H], r12        ; 1157 _ 4C: 89. 61, 28
0000115B        mov     qword ptr [rcx+30H], r13        ; 115B _ 4C: 89. 69, 30
0000115F        mov     qword ptr [rcx+38H], r14        ; 115F _ 4C: 89. 71, 38
00001163        mov     qword ptr [rcx+40H], r15        ; 1163 _ 4C: 89. 79, 40
00001167        mov     qword ptr [rcx+48H], rdx        ; 1167 _ 48: 89. 51, 48
0000116B        stmxcsr dword ptr [rcx+50H]             ; 116B _ 0F AE. 59, 50
0000116F        movdqu  xmmword ptr [rcx+58H], xmm6     ; 116F _ F3: 0F 7F. 71, 58
00001174        movdqu  xmmword ptr [rcx+68H], xmm7     ; 1174 _ F3: 0F 7F. 79, 68
00001179        movdqu  xmmword ptr [rcx+78H], xmm8     ; 1179 _ F3 44: 0F 7F. 41, 78
0000117F        movdqu  xmmword ptr [rcx+88H], xmm9     ; 117F _ F3 44: 0F 7F. 89, 00000088
00001188        movdqu  xmmword ptr [rcx+98H], xmm10    ; 1188 _ F3 44: 0F 7F. 91, 00000098
00001191        movdqu  xmmword ptr [rcx+0A8H], xmm11   ; 1191 _ F3 44: 0F 7F. 99, 000000A8
0000119A        movdqu  xmmword ptr [rcx+0B8H], xmm12   ; 119A _ F3 44: 0F 7F. A1, 000000B8
000011A3        movdqu  xmmword ptr [rcx+0C8H], xmm13   ; 11A3 _ F3 44: 0F 7F. A9, 000000C8
000011AC        movdqu  xmmword ptr [rcx+0D8H], xmm14   ; 11AC _ F3 44: 0F 7F. B1, 000000D8
000011B5        movdqu  xmmword ptr [rcx+0E8H], xmm15   ; 11B5 _ F3 44: 0F 7F. B9, 000000E8
000011BE        xor     rax, rax                        ; 11BE _ 48: 31. C0
000011C1        jmp     rdx                             ; 11C1 _ FF. E2
_SetJump ENDP

_InternalLongJump PROC
000011C3        mov     rbx, qword ptr [rcx]            ; 11C3 _ 48: 8B. 19
000011C6        mov     rsp, qword ptr [rcx+8H]         ; 11C6 _ 48: 8B. 61, 08
000011CA        mov     rbp, qword ptr [rcx+10H]        ; 11CA _ 48: 8B. 69, 10
000011CE        mov     rdi, qword ptr [rcx+18H]        ; 11CE _ 48: 8B. 79, 18
000011D2        mov     rsi, qword ptr [rcx+20H]        ; 11D2 _ 48: 8B. 71, 20
000011D6        mov     r12, qword ptr [rcx+28H]        ; 11D6 _ 4C: 8B. 61, 28
000011DA        mov     r13, qword ptr [rcx+30H]        ; 11DA _ 4C: 8B. 69, 30
000011DE        mov     r14, qword ptr [rcx+38H]        ; 11DE _ 4C: 8B. 71, 38
000011E2        mov     r15, qword ptr [rcx+40H]        ; 11E2 _ 4C: 8B. 79, 40
000011E6        ldmxcsr dword ptr [rcx+50H]             ; 11E6 _ 0F AE. 51, 50
000011EA        movdqu  xmm6, xmmword ptr [rcx+58H]     ; 11EA _ F3: 0F 6F. 71, 58
000011EF        movdqu  xmm7, xmmword ptr [rcx+68H]     ; 11EF _ F3: 0F 6F. 79, 68
000011F4        movdqu  xmm8, xmmword ptr [rcx+78H]     ; 11F4 _ F3 44: 0F 6F. 41, 78
000011FA        movdqu  xmm9, xmmword ptr [rcx+88H]     ; 11FA _ F3 44: 0F 6F. 89, 00000088
00001203        movdqu  xmm10, xmmword ptr [rcx+98H]    ; 1203 _ F3 44: 0F 6F. 91, 00000098
0000120C        movdqu  xmm11, xmmword ptr [rcx+0A8H]   ; 120C _ F3 44: 0F 6F. 99, 000000A8
00001215        movdqu  xmm12, xmmword ptr [rcx+0B8H]   ; 1215 _ F3 44: 0F 6F. A1, 000000B8
0000121E        movdqu  xmm13, xmmword ptr [rcx+0C8H]   ; 121E _ F3 44: 0F 6F. A9, 000000C8
00001227        movdqu  xmm14, xmmword ptr [rcx+0D8H]   ; 1227 _ F3 44: 0F 6F. B1, 000000D8
00001230        movdqu  xmm15, xmmword ptr [rcx+0E8H]   ; 1230 _ F3 44: 0F 6F. B9, 000000E8
00001239        mov     rax, rdx                        ; 1239 _ 48: 89. D0
0000123C        jmp     qword ptr [rcx+48H]             ; 123C _ FF. 61, 48
_InternalLongJump ENDP

_EnableDisableInterrupts PROC
0000123F        sti                                     ; 123F _ FB
00001240        cli                                     ; 1240 _ FA
00001241        ret                                     ; 1241 _ C3
_EnableDisableInterrupts ENDP

_InternalX86DisablePaging64 PROC
00001242        cli                                     ; 1242 _ FA
00001243        lea     rsi, ptr [?_096]                ; 1243 _ 48: 8D. 35, 00000032(rel)
0000124A        mov     edi, dword ptr [rsp+28H]        ; 124A _ 8B. 7C 24, 28
0000124E        lea     rax, ptr [_AsmCpuid]            ; 124E _ 48: 8D. 05, 0000004F(rel)
00001255        sub     rax, rsi                        ; 1255 _ 48: 29. F0
00001258        add     rax, 4                          ; 1258 _ 48: 83. C0, 04
0000125C        and     al, 0FFFFFFFCH                  ; 125C _ 24, FC
0000125E        sub     rdi, rax                        ; 125E _ 48: 29. C7
00001261        mov     r10d, edi                       ; 1261 _ 41: 89. FA
00001264        push    rcx                             ; 1264 _ 51
00001265        mov     rcx, rax                        ; 1265 _ 48: 89. C1
00001268rep movsb                                       ; 1268 _ F3: A4
0000126A        pop     rcx                             ; 126A _ 59
0000126B        mov     esi, r8d                        ; 126B _ 44: 89. C6
0000126E        mov     edi, r9d                        ; 126E _ 44: 89. CF
00001271        mov     eax, r10d                       ; 1271 _ 44: 89. D0
00001274        sub     eax, 4                          ; 1274 _ 83. E8, 04
00001277        push    rcx                             ; 1277 _ 51
00001278        push    r10                             ; 1278 _ 41: 52
0000127A        retf                                    ; 127A _ 48: CB
; Note: Prefix valid but unnecessary
; Note: Prefix bit or byte has no meaning in this context
_InternalX86DisablePaging64 ENDP

?_096   LABEL NEAR
0000127C        mov     esp, eax                        ; 127C _ 89. C4
0000127E        mov     rax, cr0                        ; 127E _ 0F 20. C0
00001281        btr     eax, 31                         ; 1281 _ 0F BA. F0, 1F
00001285        mov     cr0, rax                        ; 1285 _ 0F 22. C0
00001288        mov     ebx, edx                        ; 1288 _ 89. D3
0000128A        mov     ecx, 3221225600                 ; 128A _ B9, C0000080
0000128F        rdmsr                                   ; 128F _ 0F 32
00001291        and     ah, 0FFFFFFFEH                  ; 1291 _ 80. E4, FE
00001294        wrmsr                                   ; 1294 _ 0F 30
00001296        mov     rax, cr4                        ; 1296 _ 0F 20. E0
00001299        and     al, 0FFFFFFDFH                  ; 1299 _ 24, DF
0000129B        mov     cr4, rax                        ; 129B _ 0F 22. E0
0000129E        push    rdi                             ; 129E _ 57
0000129F        push    rsi                             ; 129F _ 56
000012A0        call    rbx                             ; 12A0 _ FF. D3
?_097:
000012A2        jmp     ?_097                           ; 12A2 _ EB, FE

_AsmCpuid PROC

_mTransitionEnd LABEL NEAR
000012A4        push    rbx                             ; 12A4 _ 53
000012A5        mov     eax, ecx                        ; 12A5 _ 89. C8
000012A7        push    rax                             ; 12A7 _ 50
000012A8        push    rdx                             ; 12A8 _ 52
000012A9        cpuid                                   ; 12A9 _ 0F A2
000012AB        test    r9, r9                          ; 12AB _ 4D: 85. C9
000012AE        jz      ?_098                           ; 12AE _ 74, 03
000012B0        mov     dword ptr [r9], ecx             ; 12B0 _ 41: 89. 09
?_098:
000012B3        pop     rcx                             ; 12B3 _ 59
000012B4        jrcxz   ?_099                           ; 12B4 _ E3, 02
000012B6        mov     dword ptr [rcx], eax            ; 12B6 _ 89. 01
?_099:
000012B8        mov     rcx, r8                         ; 12B8 _ 4C: 89. C1
000012BB        jrcxz   ?_100                           ; 12BB _ E3, 02
000012BD        mov     dword ptr [rcx], ebx            ; 12BD _ 89. 19
?_100:
000012BF        mov     rcx, qword ptr [rsp+38H]        ; 12BF _ 48: 8B. 4C 24, 38
000012C4        jrcxz   ?_101                           ; 12C4 _ E3, 02
000012C6        mov     dword ptr [rcx], edx            ; 12C6 _ 89. 11
?_101:
000012C8        pop     rax                             ; 12C8 _ 58
000012C9        pop     rbx                             ; 12C9 _ 5B
000012CA        ret                                     ; 12CA _ C3
_AsmCpuid ENDP

_AsmCpuidEx PROC
000012CB        push    rbx                             ; 12CB _ 53
000012CC        mov     eax, ecx                        ; 12CC _ 89. C8
000012CE        mov     ecx, edx                        ; 12CE _ 89. D1
000012D0        push    rax                             ; 12D0 _ 50
000012D1        cpuid                                   ; 12D1 _ 0F A2
000012D3        mov     r10, qword ptr [rsp+38H]        ; 12D3 _ 4C: 8B. 54 24, 38
000012D8        test    r10, r10                        ; 12D8 _ 4D: 85. D2
000012DB        jz      ?_102                           ; 12DB _ 74, 03
000012DD        mov     dword ptr [r10], ecx            ; 12DD _ 41: 89. 0A
?_102:
000012E0        mov     rcx, r8                         ; 12E0 _ 4C: 89. C1
000012E3        jrcxz   ?_103                           ; 12E3 _ E3, 02
000012E5        mov     dword ptr [rcx], eax            ; 12E5 _ 89. 01
?_103:
000012E7        mov     rcx, r9                         ; 12E7 _ 4C: 89. C9
000012EA        jrcxz   ?_104                           ; 12EA _ E3, 02
000012EC        mov     dword ptr [rcx], ebx            ; 12EC _ 89. 19
?_104:
000012EE        mov     rcx, qword ptr [rsp+40H]        ; 12EE _ 48: 8B. 4C 24, 40
000012F3        jrcxz   ?_105                           ; 12F3 _ E3, 02
000012F5        mov     dword ptr [rcx], edx            ; 12F5 _ 89. 11
?_105:
000012F7        pop     rax                             ; 12F7 _ 58
000012F8        pop     rbx                             ; 12F8 _ 5B
000012F9        ret                                     ; 12F9 _ C3
_AsmCpuidEx ENDP

_AsmEnableCache PROC
000012FA        wbinvd                                  ; 12FA _ 0F 09
000012FC        mov     rax, cr0                        ; 12FC _ 0F 20. C0
000012FF        btr     rax, 30                         ; 12FF _ 48: 0F BA. F0, 1E
00001304        btr     rax, 29                         ; 1304 _ 48: 0F BA. F0, 1D
00001309        mov     cr0, rax                        ; 1309 _ 0F 22. C0
0000130C        ret                                     ; 130C _ C3
_AsmEnableCache ENDP

_AsmDisableCache PROC
0000130D        mov     rax, cr0                        ; 130D _ 0F 20. C0
00001310        bts     rax, 30                         ; 1310 _ 48: 0F BA. E8, 1E
00001315        btr     rax, 29                         ; 1315 _ 48: 0F BA. F0, 1D
0000131A        mov     cr0, rax                        ; 131A _ 0F 22. C0
0000131D        wbinvd                                  ; 131D _ 0F 09
0000131F        ret                                     ; 131F _ C3
_AsmDisableCache ENDP

_AsmRdRand16 PROC
00001320        rdrand  eax                             ; 1320 _ 0F C7. F0
00001323        jc      rn16_ok                         ; 1323 _ 0F 82, 00000004
; Note: Immediate operand could be made smaller by sign extension
00001329        xor     rax, rax                        ; 1329 _ 48: 31. C0
0000132C        ret                                     ; 132C _ C3
_AsmRdRand16 ENDP

rn16_ok LABEL NEAR
0000132D        mov     word ptr [rcx], ax              ; 132D _ 66: 89. 01
00001330        mov     rax, 1                          ; 1330 _ 48: C7. C0, 00000001
00001337        ret                                     ; 1337 _ C3

_AsmRdRand32 PROC
00001338        rdrand  eax                             ; 1338 _ 0F C7. F0
0000133B        jc      rn32_ok                         ; 133B _ 0F 82, 00000004
; Note: Immediate operand could be made smaller by sign extension
00001341        xor     rax, rax                        ; 1341 _ 48: 31. C0
00001344        ret                                     ; 1344 _ C3
_AsmRdRand32 ENDP

rn32_ok LABEL NEAR
00001345        mov     dword ptr [rcx], eax            ; 1345 _ 89. 01
00001347        mov     rax, 1                          ; 1347 _ 48: C7. C0, 00000001
0000134E        ret                                     ; 134E _ C3

_AsmRdRand64 PROC
0000134F        rdrand  rax                             ; 134F _ 48: 0F C7. F0
00001353        jc      rn64_ok                         ; 1353 _ 0F 82, 00000004
; Note: Immediate operand could be made smaller by sign extension
00001359        xor     rax, rax                        ; 1359 _ 48: 31. C0
0000135C        ret                                     ; 135C _ C3
_AsmRdRand64 ENDP

rn64_ok LABEL NEAR
0000135D        mov     qword ptr [rcx], rax            ; 135D _ 48: 89. 01
00001360        mov     rax, 1                          ; 1360 _ 48: C7. C0, 00000001
00001367        ret                                     ; 1367 _ C3

_UefiBootServicesTableLibConstructor PROC
00001368        push    rbp                             ; 1368 _ 55
00001369        mov     rbp, rsp                        ; 1369 _ 48: 89. E5
0000136C        push    rsi                             ; 136C _ 56
0000136D        sub     rsp, 40                         ; 136D _ 48: 83. EC, 28
00001371        mov     rsi, rdx                        ; 1371 _ 48: 89. D6
00001374        mov     qword ptr [_gImageHandle], rcx  ; 1374 _ 48: 89. 0D, 00007DBD(rel)
0000137B        call    _DebugAssertEnabled             ; 137B _ E8, FFFFEECC
00001380        test    al, al                          ; 1380 _ 84. C0
00001382        jz      ?_106                           ; 1382 _ 74, 24
00001384        mov     rax, qword ptr [_gImageHandle]  ; 1384 _ 48: 8B. 05, 00007DAD(rel)
0000138B        test    rax, rax                        ; 138B _ 48: 85. C0
0000138E        jnz     ?_106                           ; 138E _ 75, 18
00001390        lea     rcx, ptr [?_600]                ; 1390 _ 48: 8D. 0D, 000056F5(rel)
00001397        lea     r8, ptr [?_601]                 ; 1397 _ 4C: 8D. 05, 00005764(rel)
0000139E        mov     edx, 51                         ; 139E _ BA, 00000033
000013A3        call    _DebugAssert                    ; 13A3 _ E8, FFFFEEA3
?_106:
000013A8        mov     qword ptr [_gST], rsi           ; 13A8 _ 48: 89. 35, 00007D91(rel)
000013AF        call    _DebugAssertEnabled             ; 13AF _ E8, FFFFEE98
000013B4        test    al, al                          ; 13B4 _ 84. C0
000013B6        jz      ?_107                           ; 13B6 _ 74, 24
000013B8        mov     rax, qword ptr [_gST]           ; 13B8 _ 48: 8B. 05, 00007D81(rel)
000013BF        test    rax, rax                        ; 13BF _ 48: 85. C0
000013C2        jnz     ?_107                           ; 13C2 _ 75, 18
000013C4        lea     rcx, ptr [?_600]                ; 13C4 _ 48: 8D. 0D, 000056C1(rel)
000013CB        lea     r8, ptr [?_602]                 ; 13CB _ 4C: 8D. 05, 0000574D(rel)
000013D2        mov     edx, 57                         ; 13D2 _ BA, 00000039
000013D7        call    _DebugAssert                    ; 13D7 _ E8, FFFFEE6F
?_107:
000013DC        mov     rax, qword ptr [rsi+60H]        ; 13DC _ 48: 8B. 46, 60
000013E0        mov     qword ptr [_gBS], rax           ; 13E0 _ 48: 89. 05, 00007D61(rel)
000013E7        call    _DebugAssertEnabled             ; 13E7 _ E8, FFFFEE60
000013EC        test    al, al                          ; 13EC _ 84. C0
000013EE        jz      ?_108                           ; 13EE _ 74, 24
000013F0        mov     rax, qword ptr [_gBS]           ; 13F0 _ 48: 8B. 05, 00007D51(rel)
000013F7        test    rax, rax                        ; 13F7 _ 48: 85. C0
000013FA        jnz     ?_108                           ; 13FA _ 75, 18
000013FC        lea     rcx, ptr [?_600]                ; 13FC _ 48: 8D. 0D, 00005689(rel)
00001403        lea     r8, ptr [?_603]                 ; 1403 _ 4C: 8D. 05, 00005729(rel)
0000140A        mov     edx, 63                         ; 140A _ BA, 0000003F
0000140F        call    _DebugAssert                    ; 140F _ E8, FFFFEE37
?_108:
00001414        xor     eax, eax                        ; 1414 _ 31. C0
00001416        add     rsp, 40                         ; 1416 _ 48: 83. C4, 28
0000141A        pop     rsi                             ; 141A _ 5E
0000141B        pop     rbp                             ; 141B _ 5D
0000141C        ret                                     ; 141C _ C3
_UefiBootServicesTableLibConstructor ENDP

_InternalAllocateAlignedPages PROC
0000141D        push    rbp                             ; 141D _ 55
0000141E        mov     rbp, rsp                        ; 141E _ 48: 89. E5
00001421        push    r15                             ; 1421 _ 41: 57
00001423        push    r14                             ; 1423 _ 41: 56
00001425        push    rsi                             ; 1425 _ 56
00001426        push    rdi                             ; 1426 _ 57
00001427        push    rbx                             ; 1427 _ 53
00001428        sub     rsp, 40                         ; 1428 _ 48: 83. EC, 28
0000142C        mov     rsi, r8                         ; 142C _ 4C: 89. C6
0000142F        mov     r15, rdx                        ; 142F _ 49: 89. D7
00001432        mov     r14d, ecx                       ; 1432 _ 41: 89. CE
00001435        call    _DebugAssertEnabled             ; 1435 _ E8, FFFFEE12
0000143A        test    al, al                          ; 143A _ 84. C0
0000143C        jz      ?_109                           ; 143C _ 74, 21
0000143E        lea     rax, ptr [rsi-1H]               ; 143E _ 48: 8D. 46, FF
00001442        test    rsi, rax                        ; 1442 _ 48: 85. C6
00001445        jz      ?_109                           ; 1445 _ 74, 18
00001447        lea     rcx, ptr [?_604]                ; 1447 _ 48: 8D. 0D, 000056F9(rel)
0000144E        lea     r8, ptr [?_605]                 ; 144E _ 4C: 8D. 05, 00005762(rel)
00001455        mov     edx, 190                        ; 1455 _ BA, 000000BE
0000145A        call    _DebugAssert                    ; 145A _ E8, FFFFEDEC
?_109:
0000145F        xor     eax, eax                        ; 145F _ 31. C0
00001461        test    r15, r15                        ; 1461 _ 4D: 85. FF
00001464        je      ?_116                           ; 1464 _ 0F 84, 000001A4
0000146A        cmp     rsi, 4097                       ; 146A _ 48: 81. FE, 00001001
00001471        jc      ?_114                           ; 1471 _ 0F 82, 00000170
00001477        mov     rbx, rsi                        ; 1477 _ 48: 89. F3
0000147A        shr     rbx, 12                         ; 147A _ 48: C1. EB, 0C
0000147E        mov     rax, rsi                        ; 147E _ 48: 89. F0
00001481        and     rax, 0FFFH                      ; 1481 _ 48: 25, 00000FFF
00001487        cmp     rax, 1                          ; 1487 _ 48: 83. F8, 01
0000148B        sbb     rbx, -1                         ; 148B _ 48: 83. DB, FF
0000148F        lea     rdi, ptr [rbx+r15]              ; 148F _ 4A: 8D. 3C 3B
00001493        call    _DebugAssertEnabled             ; 1493 _ E8, FFFFEDB4
00001498        test    al, al                          ; 1498 _ 84. C0
0000149A        jz      ?_110                           ; 149A _ 74, 1D
0000149C        cmp     rdi, r15                        ; 149C _ 4C: 39. FF
0000149F        ja      ?_110                           ; 149F _ 77, 18
000014A1        lea     rcx, ptr [?_604]                ; 14A1 _ 48: 8D. 0D, 0000569F(rel)
000014A8        lea     r8, ptr [?_606]                 ; 14A8 _ 4C: 8D. 05, 0000572B(rel)
000014AF        mov     edx, 204                        ; 14AF _ BA, 000000CC
000014B4        call    _DebugAssert                    ; 14B4 _ E8, FFFFED92
?_110:
000014B9        mov     rax, qword ptr [_gBS]           ; 14B9 _ 48: 8B. 05, 00007C88(rel)
000014C0        lea     r9, ptr [rbp-30H]               ; 14C0 _ 4C: 8D. 4D, D0
000014C4        xor     ecx, ecx                        ; 14C4 _ 31. C9
000014C6        mov     edx, r14d                       ; 14C6 _ 44: 89. F2
000014C9        mov     r8, rdi                         ; 14C9 _ 49: 89. F8
000014CC        call    qword ptr [rax+28H]             ; 14CC _ FF. 50, 28
000014CF        mov     rcx, rax                        ; 14CF _ 48: 89. C1
000014D2        xor     eax, eax                        ; 14D2 _ 31. C0
000014D4        test    rcx, rcx                        ; 14D4 _ 48: 85. C9
000014D7        js      ?_116                           ; 14D7 _ 0F 88, 00000131
000014DD        mov     rcx, qword ptr [rbp-30H]        ; 14DD _ 48: 8B. 4D, D0
000014E1        lea     rax, ptr [rsi+rcx-1H]           ; 14E1 _ 48: 8D. 44 0E, FF
000014E6        neg     rsi                             ; 14E6 _ 48: F7. DE
000014E9        and     rsi, rax                        ; 14E9 _ 48: 21. C6
000014EC        mov     rdx, rsi                        ; 14EC _ 48: 89. F2
000014EF        sub     rdx, rcx                        ; 14EF _ 48: 29. CA
000014F2        mov     rax, rdx                        ; 14F2 _ 48: 89. D0
000014F5        shr     rax, 12                         ; 14F5 _ 48: C1. E8, 0C
000014F9        test    dx, 0FFFH                       ; 14F9 _ 66: F7. C2, 0FFF
; Note: Length-changing prefix causes delay on Intel processors
000014FE        setne   dl                              ; 14FE _ 0F 95. C2
00001501        movzx   edi, dl                         ; 1501 _ 0F B6. FA
00001504        add     rdi, rax                        ; 1504 _ 48: 01. C7
00001507        jz      ?_112                           ; 1507 _ 74, 61
00001509        mov     rax, qword ptr [_gBS]           ; 1509 _ 48: 8B. 05, 00007C38(rel)
00001510        mov     rdx, rdi                        ; 1510 _ 48: 89. FA
00001513        call    qword ptr [rax+30H]             ; 1513 _ FF. 50, 30
00001516        mov     r14, rax                        ; 1516 _ 49: 89. C6
00001519        call    _DebugAssertEnabled             ; 1519 _ E8, FFFFED2E
0000151E        test    al, al                          ; 151E _ 84. C0
00001520        jz      ?_112                           ; 1520 _ 74, 48
00001522        test    r14, r14                        ; 1522 _ 4D: 85. F6
00001525        jns     ?_112                           ; 1525 _ 79, 43
00001527        call    _DebugPrintEnabled              ; 1527 _ E8, FFFFED23
0000152C        test    al, al                          ; 152C _ 84. C0
0000152E        jz      ?_111                           ; 152E _ 74, 22
00001530        mov     ecx, 2147483648                 ; 1530 _ B9, 80000000
00001535        call    _DebugPrintLevelEnabled         ; 1535 _ E8, FFFFED18
0000153A        test    al, al                          ; 153A _ 84. C0
0000153C        jz      ?_111                           ; 153C _ 74, 14
0000153E        lea     rdx, ptr [?_561]                ; 153E _ 48: 8D. 15, 00004D88(rel)
00001545        mov     ecx, 2147483648                 ; 1545 _ B9, 80000000
0000154A        mov     r8, r14                         ; 154A _ 4D: 89. F0
0000154D        call    _DebugPrint                     ; 154D _ E8, FFFFECEE
?_111:
00001552        lea     rcx, ptr [?_604]                ; 1552 _ 48: 8D. 0D, 000055EE(rel)
00001559        lea     r8, ptr [?_562]                 ; 1559 _ 4C: 8D. 05, 00004D8E(rel)
00001560        mov     edx, 217                        ; 1560 _ BA, 000000D9
00001565        call    _DebugAssert                    ; 1565 _ E8, FFFFECE1
?_112:
0000156A        shl     r15, 12                         ; 156A _ 49: C1. E7, 0C
0000156E        add     r15, rsi                        ; 156E _ 49: 01. F7
00001571        mov     qword ptr [rbp-30H], r15        ; 1571 _ 4C: 89. 7D, D0
00001575        cmp     rbx, rdi                        ; 1575 _ 48: 39. FB
00001578        je      ?_115                           ; 1578 _ 0F 84, 0000008D
0000157E        sub     rbx, rdi                        ; 157E _ 48: 29. FB
00001581        mov     rax, qword ptr [_gBS]           ; 1581 _ 48: 8B. 05, 00007BC0(rel)
00001588        mov     rcx, r15                        ; 1588 _ 4C: 89. F9
0000158B        mov     rdx, rbx                        ; 158B _ 48: 89. DA
0000158E        call    qword ptr [rax+30H]             ; 158E _ FF. 50, 30
00001591        mov     rdi, rax                        ; 1591 _ 48: 89. C7
00001594        call    _DebugAssertEnabled             ; 1594 _ E8, FFFFECB3
00001599        test    al, al                          ; 1599 _ 84. C0
0000159B        jz      ?_115                           ; 159B _ 74, 6E
0000159D        test    rdi, rdi                        ; 159D _ 48: 85. FF
000015A0        jns     ?_115                           ; 15A0 _ 79, 69
000015A2        call    _DebugPrintEnabled              ; 15A2 _ E8, FFFFECA8
000015A7        test    al, al                          ; 15A7 _ 84. C0
000015A9        jz      ?_113                           ; 15A9 _ 74, 22
000015AB        mov     ecx, 2147483648                 ; 15AB _ B9, 80000000
000015B0        call    _DebugPrintLevelEnabled         ; 15B0 _ E8, FFFFEC9D
000015B5        test    al, al                          ; 15B5 _ 84. C0
000015B7        jz      ?_113                           ; 15B7 _ 74, 14
000015B9        lea     rdx, ptr [?_561]                ; 15B9 _ 48: 8D. 15, 00004D0D(rel)
000015C0        mov     ecx, 2147483648                 ; 15C0 _ B9, 80000000
000015C5        mov     r8, rdi                         ; 15C5 _ 49: 89. F8
000015C8        call    _DebugPrint                     ; 15C8 _ E8, FFFFEC73
?_113:
000015CD        lea     rcx, ptr [?_604]                ; 15CD _ 48: 8D. 0D, 00005573(rel)
000015D4        lea     r8, ptr [?_562]                 ; 15D4 _ 4C: 8D. 05, 00004D13(rel)
000015DB        mov     edx, 226                        ; 15DB _ BA, 000000E2
000015E0        call    _DebugAssert                    ; 15E0 _ E8, FFFFEC66
000015E5        jmp     ?_115                           ; 15E5 _ EB, 24

?_114:
000015E7        mov     rax, qword ptr [_gBS]           ; 15E7 _ 48: 8B. 05, 00007B5A(rel)
000015EE        lea     r9, ptr [rbp-30H]               ; 15EE _ 4C: 8D. 4D, D0
000015F2        xor     ecx, ecx                        ; 15F2 _ 31. C9
000015F4        mov     edx, r14d                       ; 15F4 _ 44: 89. F2
000015F7        mov     r8, r15                         ; 15F7 _ 4D: 89. F8
000015FA        call    qword ptr [rax+28H]             ; 15FA _ FF. 50, 28
000015FD        mov     rcx, rax                        ; 15FD _ 48: 89. C1
00001600        xor     eax, eax                        ; 1600 _ 31. C0
00001602        test    rcx, rcx                        ; 1602 _ 48: 85. C9
00001605        js      ?_116                           ; 1605 _ 78, 07
00001607        mov     rsi, qword ptr [rbp-30H]        ; 1607 _ 48: 8B. 75, D0
?_115:
0000160B        mov     rax, rsi                        ; 160B _ 48: 89. F0
?_116:
0000160E        add     rsp, 40                         ; 160E _ 48: 83. C4, 28
00001612        pop     rbx                             ; 1612 _ 5B
00001613        pop     rdi                             ; 1613 _ 5F
00001614        pop     rsi                             ; 1614 _ 5E
00001615        pop     r14                             ; 1615 _ 41: 5E
00001617        pop     r15                             ; 1617 _ 41: 5F
00001619        pop     rbp                             ; 1619 _ 5D
0000161A        ret                                     ; 161A _ C3
_InternalAllocateAlignedPages ENDP

_AllocateAlignedPages PROC
0000161B        mov     rax, rdx                        ; 161B _ 48: 89. D0
0000161E        mov     rdx, rcx                        ; 161E _ 48: 89. CA
00001621        mov     ecx, 4                          ; 1621 _ B9, 00000004
00001626        mov     r8, rax                         ; 1626 _ 49: 89. C0
00001629        jmp     _InternalAllocateAlignedPages   ; 1629 _ E9, FFFFFDEF
_AllocateAlignedPages ENDP

_InternalAllocatePool PROC
0000162E        push    rbp                             ; 162E _ 55
0000162F        mov     rbp, rsp                        ; 162F _ 48: 89. E5
00001632        sub     rsp, 48                         ; 1632 _ 48: 83. EC, 30
00001636        mov     rax, qword ptr [_gBS]           ; 1636 _ 48: 8B. 05, 00007B0B(rel)
0000163D        lea     r8, ptr [rbp-8H]                ; 163D _ 4C: 8D. 45, F8
00001641        call    qword ptr [rax+40H]             ; 1641 _ FF. 50, 40
00001644        test    rax, rax                        ; 1644 _ 48: 85. C0
00001647        js      ?_117                           ; 1647 _ 78, 06
00001649        mov     rax, qword ptr [rbp-8H]         ; 1649 _ 48: 8B. 45, F8
0000164D        jmp     ?_118                           ; 164D _ EB, 0A

?_117:
0000164F        mov     qword ptr [rbp-8H], 0           ; 164F _ 48: C7. 45, F8, 00000000
00001657        xor     eax, eax                        ; 1657 _ 31. C0
?_118:
00001659        add     rsp, 48                         ; 1659 _ 48: 83. C4, 30
0000165D        pop     rbp                             ; 165D _ 5D
0000165E        ret                                     ; 165E _ C3
_InternalAllocatePool ENDP

_AllocatePool PROC
0000165F        mov     rax, rcx                        ; 165F _ 48: 89. C8
00001662        mov     ecx, 4                          ; 1662 _ B9, 00000004
00001667        mov     rdx, rax                        ; 1667 _ 48: 89. C2
0000166A        jmp     _InternalAllocatePool           ; 166A _ E9, FFFFFFBF
; Note: Immediate operand could be made smaller by sign extension
_AllocatePool ENDP

_InternalAllocateZeroPool PROC
0000166F        push    rbp                             ; 166F _ 55
00001670        mov     rbp, rsp                        ; 1670 _ 48: 89. E5
00001673        push    rsi                             ; 1673 _ 56
00001674        sub     rsp, 40                         ; 1674 _ 48: 83. EC, 28
00001678        mov     rsi, rdx                        ; 1678 _ 48: 89. D6
0000167B        call    _InternalAllocatePool           ; 167B _ E8, FFFFFFAE
00001680        test    rax, rax                        ; 1680 _ 48: 85. C0
00001683        jnz     ?_119                           ; 1683 _ 75, 09
00001685        xor     eax, eax                        ; 1685 _ 31. C0
00001687        add     rsp, 40                         ; 1687 _ 48: 83. C4, 28
0000168B        pop     rsi                             ; 168B _ 5E
0000168C        pop     rbp                             ; 168C _ 5D
0000168D        ret                                     ; 168D _ C3
_InternalAllocateZeroPool ENDP

?_119   LABEL NEAR
0000168E        mov     rcx, rax                        ; 168E _ 48: 89. C1
00001691        mov     rdx, rsi                        ; 1691 _ 48: 89. F2
00001694        add     rsp, 40                         ; 1694 _ 48: 83. C4, 28
00001698        pop     rsi                             ; 1698 _ 5E
00001699        pop     rbp                             ; 1699 _ 5D
0000169A        jmp     _ZeroMem                        ; 169A _ E9, FFFFEBCD

_AllocateZeroPool PROC
0000169F        mov     rax, rcx                        ; 169F _ 48: 89. C8
000016A2        mov     ecx, 4                          ; 16A2 _ B9, 00000004
000016A7        mov     rdx, rax                        ; 16A7 _ 48: 89. C2
000016AA        jmp     _InternalAllocateZeroPool       ; 16AA _ E9, FFFFFFC0
; Note: Immediate operand could be made smaller by sign extension
_AllocateZeroPool ENDP

_InternalAllocateCopyPool PROC
000016AF        push    rbp                             ; 16AF _ 55
000016B0        mov     rbp, rsp                        ; 16B0 _ 48: 89. E5
000016B3        push    rsi                             ; 16B3 _ 56
000016B4        push    rdi                             ; 16B4 _ 57
000016B5        push    rbx                             ; 16B5 _ 53
000016B6        sub     rsp, 40                         ; 16B6 _ 48: 83. EC, 28
000016BA        mov     rsi, r8                         ; 16BA _ 4C: 89. C6
000016BD        mov     rdi, rdx                        ; 16BD _ 48: 89. D7
000016C0        mov     ebx, ecx                        ; 16C0 _ 89. CB
000016C2        call    _DebugAssertEnabled             ; 16C2 _ E8, FFFFEB85
000016C7        test    al, al                          ; 16C7 _ 84. C0
000016C9        jz      ?_120                           ; 16C9 _ 74, 1D
000016CB        test    rsi, rsi                        ; 16CB _ 48: 85. F6
000016CE        jnz     ?_120                           ; 16CE _ 75, 18
000016D0        lea     rcx, ptr [?_604]                ; 16D0 _ 48: 8D. 0D, 00005470(rel)
000016D7        lea     r8, ptr [?_563]                 ; 16D7 _ 4C: 8D. 05, 00004C24(rel)
000016DE        mov     edx, 569                        ; 16DE _ BA, 00000239
000016E3        call    _DebugAssert                    ; 16E3 _ E8, FFFFEB63
?_120:
000016E8        call    _DebugAssertEnabled             ; 16E8 _ E8, FFFFEB5F
000016ED        test    al, al                          ; 16ED _ 84. C0
000016EF        jz      ?_121                           ; 16EF _ 74, 23
000016F1        mov     rax, rsi                        ; 16F1 _ 48: 89. F0
000016F4        neg     rax                             ; 16F4 _ 48: F7. D8
000016F7        cmp     rdi, rax                        ; 16F7 _ 48: 39. C7
000016FA        jbe     ?_121                           ; 16FA _ 76, 18
000016FC        lea     rcx, ptr [?_604]                ; 16FC _ 48: 8D. 0D, 00005444(rel)
00001703        lea     r8, ptr [?_607]                 ; 1703 _ 4C: 8D. 05, 000054E2(rel)
0000170A        mov     edx, 570                        ; 170A _ BA, 0000023A
0000170F        call    _DebugAssert                    ; 170F _ E8, FFFFEB37
?_121:
00001714        mov     ecx, ebx                        ; 1714 _ 89. D9
00001716        mov     rdx, rdi                        ; 1716 _ 48: 89. FA
00001719        call    _InternalAllocatePool           ; 1719 _ E8, FFFFFF10
0000171E        test    rax, rax                        ; 171E _ 48: 85. C0
00001721        jnz     ?_122                           ; 1721 _ 75, 0B
00001723        xor     eax, eax                        ; 1723 _ 31. C0
00001725        add     rsp, 40                         ; 1725 _ 48: 83. C4, 28
00001729        pop     rbx                             ; 1729 _ 5B
0000172A        pop     rdi                             ; 172A _ 5F
0000172B        pop     rsi                             ; 172B _ 5E
0000172C        pop     rbp                             ; 172C _ 5D
0000172D        ret                                     ; 172D _ C3
_InternalAllocateCopyPool ENDP

?_122   LABEL NEAR
0000172E        mov     rcx, rax                        ; 172E _ 48: 89. C1
00001731        mov     rdx, rsi                        ; 1731 _ 48: 89. F2
00001734        mov     r8, rdi                         ; 1734 _ 49: 89. F8
00001737        add     rsp, 40                         ; 1737 _ 48: 83. C4, 28
0000173B        pop     rbx                             ; 173B _ 5B
0000173C        pop     rdi                             ; 173C _ 5F
0000173D        pop     rsi                             ; 173D _ 5E
0000173E        pop     rbp                             ; 173E _ 5D
0000173F        jmp     _CopyMem                        ; 173F _ E9, FFFFED00

_AllocateCopyPool PROC
00001744        mov     rax, rdx                        ; 1744 _ 48: 89. D0
00001747        mov     rdx, rcx                        ; 1747 _ 48: 89. CA
0000174A        mov     ecx, 4                          ; 174A _ B9, 00000004
0000174F        mov     r8, rax                         ; 174F _ 49: 89. C0
00001752        jmp     _InternalAllocateCopyPool       ; 1752 _ E9, FFFFFF58
_AllocateCopyPool ENDP

_FreePool PROC
00001757        push    rbp                             ; 1757 _ 55
00001758        mov     rbp, rsp                        ; 1758 _ 48: 89. E5
0000175B        push    rsi                             ; 175B _ 56
0000175C        sub     rsp, 40                         ; 175C _ 48: 83. EC, 28
00001760        mov     rax, qword ptr [_gBS]           ; 1760 _ 48: 8B. 05, 000079E1(rel)
00001767        call    qword ptr [rax+48H]             ; 1767 _ FF. 50, 48
0000176A        mov     rsi, rax                        ; 176A _ 48: 89. C6
0000176D        call    _DebugAssertEnabled             ; 176D _ E8, FFFFEADA
00001772        test    al, al                          ; 1772 _ 84. C0
00001774        jz      ?_124                           ; 1774 _ 74, 4E
00001776        test    rsi, rsi                        ; 1776 _ 48: 85. F6
00001779        jns     ?_124                           ; 1779 _ 79, 49
0000177B        call    _DebugPrintEnabled              ; 177B _ E8, FFFFEACF
00001780        test    al, al                          ; 1780 _ 84. C0
00001782        jz      ?_123                           ; 1782 _ 74, 22
00001784        mov     ecx, 2147483648                 ; 1784 _ B9, 80000000
00001789        call    _DebugPrintLevelEnabled         ; 1789 _ E8, FFFFEAC4
0000178E        test    al, al                          ; 178E _ 84. C0
00001790        jz      ?_123                           ; 1790 _ 74, 14
00001792        lea     rdx, ptr [?_561]                ; 1792 _ 48: 8D. 15, 00004B34(rel)
00001799        mov     ecx, 2147483648                 ; 1799 _ B9, 80000000
0000179E        mov     r8, rsi                         ; 179E _ 49: 89. F0
000017A1        call    _DebugPrint                     ; 17A1 _ E8, FFFFEA9A
?_123:
000017A6        lea     rcx, ptr [?_604]                ; 17A6 _ 48: 8D. 0D, 0000539A(rel)
000017AD        lea     r8, ptr [?_562]                 ; 17AD _ 4C: 8D. 05, 00004B3A(rel)
000017B4        mov     edx, 819                        ; 17B4 _ BA, 00000333
000017B9        add     rsp, 40                         ; 17B9 _ 48: 83. C4, 28
000017BD        pop     rsi                             ; 17BD _ 5E
000017BE        pop     rbp                             ; 17BE _ 5D
000017BF        jmp     _DebugAssert                    ; 17BF _ E9, FFFFEA87
_FreePool ENDP

?_124   LABEL NEAR
000017C4        add     rsp, 40                         ; 17C4 _ 48: 83. C4, 28
000017C8        pop     rsi                             ; 17C8 _ 5E
000017C9        pop     rbp                             ; 17C9 _ 5D
000017CA        ret                                     ; 17CA _ C3

000017CB        nop                                     ; 17CB _ 90

_BasePrintLibValueToString PROC
000017CC        push    rbp                             ; 17CC _ 55
000017CD        mov     rbp, rsp                        ; 17CD _ 48: 89. E5
000017D0        push    r14                             ; 17D0 _ 41: 56
000017D2        push    rsi                             ; 17D2 _ 56
000017D3        push    rdi                             ; 17D3 _ 57
000017D4        push    rbx                             ; 17D4 _ 53
000017D5        sub     rsp, 48                         ; 17D5 _ 48: 83. EC, 30
000017D9        mov     rsi, r8                         ; 17D9 _ 4C: 89. C6
000017DC        mov     rax, rdx                        ; 17DC _ 48: 89. D0
000017DF        mov     rdi, rcx                        ; 17DF _ 48: 89. CF
000017E2        mov     byte ptr [rdi], 0               ; 17E2 _ C6. 07, 00
000017E5        lea     r14, ptr [rbp-24H]              ; 17E5 _ 4C: 8D. 75, DC
000017E9        lea     rbx, ptr [_mHexStr]             ; 17E9 _ 48: 8D. 1D, 000061F0(rel)
?_125:
000017F0        mov     rcx, rax                        ; 17F0 _ 48: 89. C1
000017F3        mov     edx, esi                        ; 17F3 _ 89. F2
000017F5        mov     r8, r14                         ; 17F5 _ 4D: 89. F0
000017F8        call    _DivU64x32Remainder             ; 17F8 _ E8, FFFFEE52
000017FD        mov     ecx, dword ptr [rbp-24H]        ; 17FD _ 8B. 4D, DC
00001800        mov     cl, byte ptr [rcx+rbx]          ; 1800 _ 8A. 0C 19
00001803        mov     byte ptr [rdi+1H], cl           ; 1803 _ 88. 4F, 01
00001806        inc     rdi                             ; 1806 _ 48: FF. C7
00001809        test    rax, rax                        ; 1809 _ 48: 85. C0
0000180C        jnz     ?_125                           ; 180C _ 75, E2
0000180E        mov     rax, rdi                        ; 180E _ 48: 89. F8
00001811        add     rsp, 48                         ; 1811 _ 48: 83. C4, 30
00001815        pop     rbx                             ; 1815 _ 5B
00001816        pop     rdi                             ; 1816 _ 5F
00001817        pop     rsi                             ; 1817 _ 5E
00001818        pop     r14                             ; 1818 _ 41: 5E
0000181A        pop     rbp                             ; 181A _ 5D
0000181B        ret                                     ; 181B _ C3
_BasePrintLibValueToString ENDP

_BasePrintLibSPrintMarker PROC
0000181C        push    rbp                             ; 181C _ 55
0000181D        mov     rbp, rsp                        ; 181D _ 48: 89. E5
00001820        push    r15                             ; 1820 _ 41: 57
00001822        push    r14                             ; 1822 _ 41: 56
00001824        push    r13                             ; 1824 _ 41: 55
00001826        push    r12                             ; 1826 _ 41: 54
00001828        push    rsi                             ; 1828 _ 56
00001829        push    rdi                             ; 1829 _ 57
0000182A        push    rbx                             ; 182A _ 53
0000182B        sub     rsp, 376                        ; 182B _ 48: 81. EC, 00000178
00001832        mov     rdi, r9                         ; 1832 _ 4C: 89. CF
00001835        mov     r14, r8                         ; 1835 _ 4D: 89. C6
00001838        mov     rsi, rdx                        ; 1838 _ 48: 89. D6
0000183B        mov     rbx, rcx                        ; 183B _ 48: 89. CB
0000183E        mov     rax, r14                        ; 183E _ 4C: 89. F0
00001841        mov     rcx, qword ptr [rbp+38H]        ; 1841 _ 48: 8B. 4D, 38
00001845        mov     qword ptr [rbp-0A8H], rcx       ; 1845 _ 48: 89. 8D, FFFFFF58
0000184C        test    ah, 20H                         ; 184C _ F6. C4, 20
0000184F        jz      ?_126                           ; 184F _ 74, 0B
00001851        xor     eax, eax                        ; 1851 _ 31. C0
00001853        test    rsi, rsi                        ; 1853 _ 48: 85. F6
00001856        cmove   rbx, rax                        ; 1856 _ 48: 0F 44. D8
0000185A        jmp     ?_127                           ; 185A _ EB, 31

?_126:
0000185C        xor     eax, eax                        ; 185C _ 31. C0
0000185E        test    rsi, rsi                        ; 185E _ 48: 85. F6
00001861        je      ?_257                           ; 1861 _ 0F 84, 000010B3
00001867        call    _DebugAssertEnabled             ; 1867 _ E8, FFFFE9E0
0000186C        test    al, al                          ; 186C _ 84. C0
0000186E        jz      ?_127                           ; 186E _ 74, 1D
00001870        test    rbx, rbx                        ; 1870 _ 48: 85. DB
00001873        jnz     ?_127                           ; 1873 _ 75, 18
00001875        lea     rcx, ptr [?_608]                ; 1875 _ 48: 8D. 0D, 000055E4(rel)
0000187C        lea     r8, ptr [?_563]                 ; 187C _ 4C: 8D. 05, 00004A7F(rel)
00001883        mov     edx, 366                        ; 1883 _ BA, 0000016E
00001888        call    _DebugAssert                    ; 1888 _ E8, FFFFE9BE
?_127:
0000188D        mov     rax, r14                        ; 188D _ 4C: 89. F0
00001890        and     rax, 40H                        ; 1890 _ 48: 83. E0, 40
00001894        mov     qword ptr [rbp-78H], rax        ; 1894 _ 48: 89. 45, 88
00001898        shr     rax, 6                          ; 1898 _ 48: C1. E8, 06
0000189C        mov     qword ptr [rbp-90H], rax        ; 189C _ 48: 89. 85, FFFFFF70
000018A3        lea     rax, ptr [rax+1H]               ; 18A3 _ 48: 8D. 40, 01
000018A7        xor     edx, edx                        ; 18A7 _ 31. D2
000018A9        test    rbx, rbx                        ; 18A9 _ 48: 85. DB
000018AC        mov     ecx, 0                          ; 18AC _ B9, 00000000
000018B1        jz      ?_128                           ; 18B1 _ 74, 10
000018B3        dec     rsi                             ; 18B3 _ 48: FF. CE
000018B6        imul    rsi, rax                        ; 18B6 _ 48: 0F AF. F0
000018BA        add     rsi, rbx                        ; 18BA _ 48: 01. DE
000018BD        mov     rdx, rsi                        ; 18BD _ 48: 89. F2
000018C0        mov     rcx, rbx                        ; 18C0 _ 48: 89. D9
?_128:
000018C3        mov     qword ptr [rbp-0C0H], rbx       ; 18C3 _ 48: 89. 9D, FFFFFF40
000018CA        mov     rsi, rdx                        ; 18CA _ 48: 89. D6
000018CD        mov     qword ptr [rbp-108H], rcx       ; 18CD _ 48: 89. 8D, FFFFFEF8
000018D4        mov     qword ptr [rbp-98H], rax        ; 18D4 _ 48: 89. 85, FFFFFF68
000018DB        mov     rbx, r14                        ; 18DB _ 4C: 89. F3
000018DE        call    _DebugAssertEnabled             ; 18DE _ E8, FFFFE969
000018E3        test    bh, 1H                          ; 18E3 _ F6. C7, 01
000018E6        jz      ?_131                           ; 18E6 _ 74, 6A
000018E8        test    al, al                          ; 18E8 _ 84. C0
000018EA        mov     rdx, rdi                        ; 18EA _ 48: 89. FA
000018ED        jnz     ?_129                           ; 18ED _ 75, 17
000018EF        mov     eax, 65535                      ; 18EF _ B8, 0000FFFF
000018F4        mov     qword ptr [rbp-0D8H], rax       ; 18F4 _ 48: 89. 85, FFFFFF28
000018FB        mov     r13d, 2                         ; 18FB _ 41: BD, 00000002
00001901        jmp     ?_136                           ; 1901 _ E9, 000000B8

?_129:
00001906        mov     rcx, rdx                        ; 1906 _ 48: 89. D1
00001909        mov     rdi, rdx                        ; 1909 _ 48: 89. D7
0000190C        call    _StrSize                        ; 190C _ E8, FFFFF02B
00001911        test    rax, rax                        ; 1911 _ 48: 85. C0
00001914        jz      ?_130                           ; 1914 _ 74, 17
00001916        mov     eax, 65535                      ; 1916 _ B8, 0000FFFF
0000191B        mov     qword ptr [rbp-0D8H], rax       ; 191B _ 48: 89. 85, FFFFFF28
00001922        mov     r13d, 2                         ; 1922 _ 41: BD, 00000002
00001928        jmp     ?_135                           ; 1928 _ E9, 0000008E

?_130:
0000192D        lea     rcx, ptr [?_608]                ; 192D _ 48: 8D. 0D, 0000552C(rel)
00001934        lea     r8, ptr [?_609]                 ; 1934 _ 4C: 8D. 05, 00005587(rel)
0000193B        mov     edx, 397                        ; 193B _ BA, 0000018D
00001940        call    _DebugAssert                    ; 1940 _ E8, FFFFE906
00001945        mov     r13d, 2                         ; 1945 _ 41: BD, 00000002
0000194B        mov     eax, 65535                      ; 194B _ B8, 0000FFFF
00001950        jmp     ?_134                           ; 1950 _ EB, 62

?_131:
00001952        test    al, al                          ; 1952 _ 84. C0
00001954        mov     rdx, rdi                        ; 1954 _ 48: 89. FA
00001957        jnz     ?_132                           ; 1957 _ 75, 14
00001959        mov     eax, 255                        ; 1959 _ B8, 000000FF
0000195E        mov     qword ptr [rbp-0D8H], rax       ; 195E _ 48: 89. 85, FFFFFF28
00001965        mov     r13d, 1                         ; 1965 _ 41: BD, 00000001
0000196B        jmp     ?_136                           ; 196B _ EB, 51

?_132:
0000196D        mov     rcx, rdx                        ; 196D _ 48: 89. D1
00001970        mov     rdi, rdx                        ; 1970 _ 48: 89. D7
00001973        call    _AsciiStrSize                   ; 1973 _ E8, FFFFEFDC
00001978        test    rax, rax                        ; 1978 _ 48: 85. C0
0000197B        jz      ?_133                           ; 197B _ 74, 14
0000197D        mov     eax, 255                        ; 197D _ B8, 000000FF
00001982        mov     qword ptr [rbp-0D8H], rax       ; 1982 _ 48: 89. 85, FFFFFF28
00001989        mov     r13d, 1                         ; 1989 _ 41: BD, 00000001
0000198F        jmp     ?_135                           ; 198F _ EB, 2A

?_133:
00001991        lea     rcx, ptr [?_608]                ; 1991 _ 48: 8D. 0D, 000054C8(rel)
00001998        lea     r8, ptr [?_610]                 ; 1998 _ 4C: 8D. 05, 00005544(rel)
0000199F        mov     edx, 405                        ; 199F _ BA, 00000195
000019A4        call    _DebugAssert                    ; 19A4 _ E8, FFFFE8A2
000019A9        mov     r13d, 1                         ; 19A9 _ 41: BD, 00000001
000019AF        mov     eax, 255                        ; 19AF _ B8, 000000FF
?_134:
000019B4        mov     qword ptr [rbp-0D8H], rax       ; 19B4 _ 48: 89. 85, FFFFFF28
?_135:
000019BB        mov     rdx, rdi                        ; 19BB _ 48: 89. FA
?_136:
000019BE        movzx   ecx, byte ptr [rdx]             ; 19BE _ 0F B6. 0A
000019C1        movzx   edi, byte ptr [rdx+1H]          ; 19C1 _ 0F B6. 7A, 01
000019C5        mov     rbx, rdx                        ; 19C5 _ 48: 89. D3
000019C8        shl     rdi, 8                          ; 19C8 _ 48: C1. E7, 08
000019CC        or      rdi, rcx                        ; 19CC _ 48: 09. CF
000019CF        mov     rcx, r13                        ; 19CF _ 4C: 89. E9
000019D2        neg     rcx                             ; 19D2 _ 48: F7. D9
000019D5        mov     qword ptr [rbp-0C8H], rcx       ; 19D5 _ 48: 89. 8D, FFFFFF38
000019DC        lea     rcx, ptr [r13+1H]               ; 19DC _ 49: 8D. 4D, 01
000019E0        mov     qword ptr [rbp-0B0H], rcx       ; 19E0 _ 48: 89. 8D, FFFFFF50
000019E7        xor     eax, eax                        ; 19E7 _ 31. C0
000019E9        mov     r9, rsi                         ; 19E9 _ 49: 89. F1
000019EC        mov     qword ptr [rbp-0F8H], r9        ; 19EC _ 4C: 89. 8D, FFFFFF08
000019F3        jmp     ?_142                           ; 19F3 _ E9, 00000086

?_137:
000019F8        test    rsi, rsi                        ; 19F8 _ 48: 85. F6
000019FB        mov     rdx, qword ptr [rbp-0E0H]       ; 19FB _ 48: 8B. 95, FFFFFF20
00001A02        je      ?_250                           ; 1A02 _ 0F 84, 00000E28
00001A08        sub     rcx, rdx                        ; 1A08 _ 48: 29. D1
00001A0B        test    rcx, rcx                        ; 1A0B _ 48: 85. C9
00001A0E        jle     ?_250                           ; 1A0E _ 0F 8E, 00000E1C
00001A14        cmp     rsi, r9                         ; 1A14 _ 4C: 39. CE
00001A17        jnc     ?_250                           ; 1A17 _ 0F 83, 00000E13
00001A1D        inc     rsi                             ; 1A1D _ 48: FF. C6
00001A20        mov     ebx, 1                          ; 1A20 _ BB, 00000001
?_138:
00001A25        mov     byte ptr [rsi-1H], 32           ; 1A25 _ C6. 46, FF, 20
00001A29        cmp     qword ptr [rbp-78H], 0          ; 1A29 _ 48: 83. 7D, 88, 00
00001A2E        jz      ?_139                           ; 1A2E _ 74, 03
00001A30        mov     byte ptr [rsi], 0               ; 1A30 _ C6. 06, 00
?_139:
00001A33        lea     rdx, ptr [rsi+r10]              ; 1A33 _ 4A: 8D. 14 16
00001A37        cmp     rbx, rcx                        ; 1A37 _ 48: 39. CB
00001A3A        jge     ?_140                           ; 1A3A _ 7D, 12
00001A3C        add     rsi, qword ptr [rbp-90H]        ; 1A3C _ 48: 03. B5, FFFFFF70
00001A43        inc     rbx                             ; 1A43 _ 48: FF. C3
00001A46        cmp     rsi, r9                         ; 1A46 _ 4C: 39. CE
00001A49        mov     rsi, rdx                        ; 1A49 _ 48: 89. D6
00001A4C        jc      ?_138                           ; 1A4C _ 72, D7
?_140:
00001A4E        dec     rdx                             ; 1A4E _ 48: FF. CA
00001A51        mov     qword ptr [rbp-0C0H], rdx       ; 1A51 _ 48: 89. 95, FFFFFF40
?_141:
00001A58        mov     qword ptr [rbp-98H], r10        ; 1A58 _ 4C: 89. 95, FFFFFF68
00001A5F        mov     rdx, qword ptr [rbp-0E8H]       ; 1A5F _ 48: 8B. 95, FFFFFF18
00001A66        movzx   ecx, byte ptr [rdx+r13]         ; 1A66 _ 42: 0F B6. 0C 2A
00001A6B        movzx   edi, byte ptr [rdx+r13+1H]      ; 1A6B _ 42: 0F B6. 7C 2A, 01
00001A71        shl     rdi, 8                          ; 1A71 _ 48: C1. E7, 08
00001A75        or      rdi, rcx                        ; 1A75 _ 48: 09. CF
00001A78        add     rdx, r13                        ; 1A78 _ 4C: 01. EA
00001A7B        mov     rbx, rdx                        ; 1A7B _ 48: 89. D3
?_142:
00001A7E        and     rdi, qword ptr [rbp-0D8H]       ; 1A7E _ 48: 23. BD, FFFFFF28
00001A85        mov     qword ptr [rbp-68H], rdi        ; 1A85 _ 48: 89. 7D, 98
00001A89        test    rdi, rdi                        ; 1A89 _ 48: 85. FF
00001A8C        je      ?_251                           ; 1A8C _ 0F 84, 00000DAA
00001A92        cmp     qword ptr [rbp-0C0H], 0         ; 1A92 _ 48: 83. BD, FFFFFF40, 00
00001A9A        jz      ?_143                           ; 1A9A _ 74, 0D
00001A9C        cmp     qword ptr [rbp-0C0H], r9        ; 1A9C _ 4C: 39. 8D, FFFFFF40
00001AA3        jnc     ?_251                           ; 1AA3 _ 0F 83, 00000D93
?_143:
00001AA9        mov     qword ptr [rbp-0F0H], rax       ; 1AA9 _ 48: 89. 85, FFFFFF10
00001AB0        and     r14, 2140H                      ; 1AB0 _ 49: 81. E6, 00002140
00001AB7        cmp     rdi, 10                         ; 1AB7 _ 48: 83. FF, 0A
00001ABB        je      ?_207                           ; 1ABB _ 0F 84, 000008D7
00001AC1        cmp     rdi, 13                         ; 1AC1 _ 48: 83. FF, 0D
00001AC5        mov     r9, qword ptr [rbp-0D8H]        ; 1AC5 _ 4C: 8B. 8D, FFFFFF28
00001ACC        je      ?_206                           ; 1ACC _ 0F 84, 00000871
00001AD2        cmp     rdi, 37                         ; 1AD2 _ 48: 83. FF, 25
00001AD6        jne     ?_208                           ; 1AD6 _ 0F 85, 0000090D
00001ADC        xor     r11d, r11d                      ; 1ADC _ 45: 31. DB
00001ADF        mov     r12d, 1                         ; 1ADF _ 41: BC, 00000001
00001AE5        mov     rax, rbx                        ; 1AE5 _ 48: 89. D8
00001AE8        mov     r15, r11                        ; 1AE8 _ 4D: 89. DF
00001AEB        mov     rsi, qword ptr [rbp+30H]        ; 1AEB _ 48: 8B. 75, 30
00001AEF        mov     r8, rsi                         ; 1AEF _ 49: 89. F0
00001AF2        mov     rsi, qword ptr [rbp-0A8H]       ; 1AF2 _ 48: 8B. B5, FFFFFF58
00001AF9        lea     r10, ptr [?_258]                ; 1AF9 _ 4C: 8D. 15, 00000E30(rel)
00001B00        jmp     ?_148                           ; 1B00 _ E9, 00000098

?_144:
00001B05        cmp     rcx, 107                        ; 1B05 _ 48: 83. F9, 6B
00001B09        jg      ?_158                           ; 1B09 _ 0F 8F, 000001BD
00001B0F        cmp     rcx, 75                         ; 1B0F _ 48: 83. F9, 4B
00001B13        jg      ?_151                           ; 1B13 _ 0F 8F, 00000138
00001B19        lea     rdx, ptr [rcx-20H]              ; 1B19 _ 48: 8D. 51, E0
00001B1D        cmp     rdx, 25                         ; 1B1D _ 48: 83. FA, 19
00001B21        ja      ?_159                           ; 1B21 _ 0F 87, 000001AB
00001B27        jmp     ?_150                           ; 1B27 _ E9, 000000DD

00001B2C        lea     rdx, ptr [rcx-30H]              ; 1B2C _ 48: 8D. 51, D0
; Note: No jump seems to point here
00001B30        xor     r15d, r15d                      ; 1B30 _ 45: 31. FF
00001B33        cmp     rdx, 9                          ; 1B33 _ 48: 83. FA, 09
00001B37        ja      ?_147                           ; 1B37 _ 77, 38
?_145:
00001B39        xor     r15d, r15d                      ; 1B39 _ 45: 31. FF
?_146:
00001B3C        movzx   ebx, byte ptr [rax+r13*2]       ; 1B3C _ 42: 0F B6. 1C 68
00001B41        movzx   edx, byte ptr [rax+r13*2+1H]    ; 1B41 _ 42: 0F B6. 54 68, 01
00001B47        shl     rdx, 8                          ; 1B47 _ 48: C1. E2, 08
00001B4B        or      edx, ebx                        ; 1B4B _ 09. DA
00001B4D        and     rdx, r9                         ; 1B4D _ 4C: 21. CA
00001B50        mov     qword ptr [rbp-68H], rdx        ; 1B50 _ 48: 89. 55, 98
00001B54        lea     rbx, ptr [rdx-30H]              ; 1B54 _ 48: 8D. 5A, D0
00001B58        add     rax, r13                        ; 1B58 _ 4C: 01. E8
00001B5B        lea     rdi, ptr [r15+r15*4]            ; 1B5B _ 4B: 8D. 3C BF
00001B5F        lea     r15, ptr [rcx+rdi*2-30H]        ; 1B5F _ 4C: 8D. 7C 79, D0
00001B64        cmp     rbx, 10                         ; 1B64 _ 48: 83. FB, 0A
00001B68        mov     rcx, rdx                        ; 1B68 _ 48: 89. D1
00001B6B        jc      ?_146                           ; 1B6B _ 72, CF
00001B6D        lea     rbx, ptr [rax+r13]              ; 1B6D _ 4A: 8D. 1C 28
?_147:
00001B71        mov     rcx, r14                        ; 1B71 _ 4C: 89. F1
00001B74        or      rcx, 200H                       ; 1B74 _ 48: 81. C9, 00000200
00001B7B        mov     rax, r14                        ; 1B7B _ 4C: 89. F0
00001B7E        and     rax, 800H                       ; 1B7E _ 48: 25, 00000800
00001B84        cmove   r14, rcx                        ; 1B84 _ 4C: 0F 44. F1
00001B88        cmovne  r12, r15                        ; 1B88 _ 4D: 0F 45. E7
00001B8C        test    rax, rax                        ; 1B8C _ 48: 85. C0
00001B8F        cmove   r11, r15                        ; 1B8F _ 4D: 0F 44. DF
00001B93        add     rbx, qword ptr [rbp-0C8H]       ; 1B93 _ 48: 03. 9D, FFFFFF38
00001B9A        mov     rax, rbx                        ; 1B9A _ 48: 89. D8
?_148:
00001B9D        movzx   edx, byte ptr [rax+r13]         ; 1B9D _ 42: 0F B6. 14 28
00001BA2        mov     rcx, qword ptr [rbp-0B0H]       ; 1BA2 _ 48: 8B. 8D, FFFFFF50
00001BA9        movzx   ecx, byte ptr [rax+rcx]         ; 1BA9 _ 0F B6. 0C 08
00001BAD        shl     rcx, 8                          ; 1BAD _ 48: C1. E1, 08
00001BB1        or      ecx, edx                        ; 1BB1 _ 09. D1
00001BB3        and     rcx, r9                         ; 1BB3 _ 4C: 21. C9
00001BB6        mov     qword ptr [rbp-68H], rcx        ; 1BB6 _ 48: 89. 4D, 98
00001BBA        lea     rbx, ptr [rax+r13]              ; 1BBA _ 4A: 8D. 1C 28
00001BBE        cmp     rcx, 31                         ; 1BBE _ 48: 83. F9, 1F
00001BC2        jg      ?_144                           ; 1BC2 _ 0F 8F, FFFFFF3D
00001BC8        test    rcx, rcx                        ; 1BC8 _ 48: 85. C9
00001BCB        jne     ?_159                           ; 1BCB _ 0F 85, 00000101
00001BD1        mov     qword ptr [rbp-0D0H], r11       ; 1BD1 _ 4C: 89. 9D, FFFFFF30
00001BD8        mov     qword ptr [rbp-0A0H], 0         ; 1BD8 _ 48: C7. 85, FFFFFF60, 00000000
00001BE3        mov     rbx, rax                        ; 1BE3 _ 48: 89. C3

?_149   LABEL NEAR
00001BE6        mov     qword ptr [rbp-0A8H], rsi       ; 1BE6 _ 48: 89. B5, FFFFFF58
00001BED        or      r14, 400H                       ; 1BED _ 49: 81. CE, 00000400
00001BF4        xor     al, al                          ; 1BF4 _ 30. C0
00001BF6        mov     dword ptr [rbp-7CH], eax        ; 1BF6 _ 89. 45, 84
00001BF9        xor     edi, edi                        ; 1BF9 _ 31. FF
00001BFB        xor     r10b, r10b                      ; 1BFB _ 45: 30. D2
00001BFE        xor     cl, cl                          ; 1BFE _ 30. C9
00001C00        lea     r12, ptr [rbp-68H]              ; 1C00 _ 4C: 8D. 65, 98
00001C04        jmp     ?_210                           ; 1C04 _ E9, 0000080F

?_150:
00001C09        movsxd  rdx, dword ptr [r10+rdx*4]      ; 1C09 _ 49: 63. 14 92
00001C0D        add     rdx, r10                        ; 1C0D _ 4C: 01. D2
00001C10        jmp     rdx                             ; 1C10 _ FF. E2

00001C12        or      r14, 800H                       ; 1C12 _ 49: 81. CE, 00000800
; Note: No jump seems to point here
00001C19        mov     rax, rbx                        ; 1C19 _ 48: 89. D8
00001C1C        jmp     ?_148                           ; 1C1C _ E9, FFFFFF7C

00001C21        or      r14, 1H                         ; 1C21 _ 49: 83. CE, 01
; Note: No jump seems to point here
00001C25        mov     rax, rbx                        ; 1C25 _ 48: 89. D8
00001C28        jmp     ?_148                           ; 1C28 _ E9, FFFFFF70

00001C2D        or      r14, 2H                         ; 1C2D _ 49: 83. CE, 02
; Note: No jump seems to point here
00001C31        mov     rax, rbx                        ; 1C31 _ 48: 89. D8
00001C34        jmp     ?_148                           ; 1C34 _ E9, FFFFFF64

00001C39        or      r14, 4H                         ; 1C39 _ 49: 83. CE, 04
; Note: No jump seems to point here
00001C3D        mov     rax, rbx                        ; 1C3D _ 48: 89. D8
00001C40        jmp     ?_148                           ; 1C40 _ E9, FFFFFF58

00001C45        or      r14, 8H                         ; 1C45 _ 49: 83. CE, 08
; Note: No jump seems to point here
00001C49        mov     rax, rbx                        ; 1C49 _ 48: 89. D8
00001C4C        jmp     ?_148                           ; 1C4C _ E9, FFFFFF4C

?_151:
00001C51        cmp     rcx, 76                         ; 1C51 _ 48: 83. F9, 4C
00001C55        jnz     ?_159                           ; 1C55 _ 75, 7B
?_152:
00001C57        or      r14, 10H                        ; 1C57 _ 49: 83. CE, 10
00001C5B        mov     rax, rbx                        ; 1C5B _ 48: 89. D8
00001C5E        jmp     ?_148                           ; 1C5E _ E9, FFFFFF3A

00001C63        mov     rax, r14                        ; 1C63 _ 4C: 89. F0
; Note: No jump seems to point here
00001C66        test    ah, 8H                          ; 1C66 _ F6. C4, 08
00001C69        jnz     ?_156                           ; 1C69 _ 75, 32
00001C6B        or      r14, 200H                       ; 1C6B _ 49: 81. CE, 00000200
00001C72        test    rsi, rsi                        ; 1C72 _ 48: 85. F6
00001C75        jnz     ?_154                           ; 1C75 _ 75, 17
00001C77        mov     rax, qword ptr [r8]             ; 1C77 _ 49: 8B. 00
00001C7A        lea     rcx, ptr [rax+8H]               ; 1C7A _ 48: 8D. 48, 08
00001C7E        mov     qword ptr [r8], rcx             ; 1C7E _ 49: 89. 08
00001C81        mov     r11, qword ptr [rax]            ; 1C81 _ 4C: 8B. 18
?_153:
00001C84        xor     esi, esi                        ; 1C84 _ 31. F6
00001C86        mov     rax, rbx                        ; 1C86 _ 48: 89. D8
00001C89        jmp     ?_148                           ; 1C89 _ E9, FFFFFF0F

?_154:
00001C8E        mov     r11, qword ptr [rsi]            ; 1C8E _ 4C: 8B. 1E
?_155:
00001C91        add     rsi, 8                          ; 1C91 _ 48: 83. C6, 08
00001C95        mov     rax, rbx                        ; 1C95 _ 48: 89. D8
00001C98        jmp     ?_148                           ; 1C98 _ E9, FFFFFF00

?_156:
00001C9D        test    rsi, rsi                        ; 1C9D _ 48: 85. F6
00001CA0        jnz     ?_157                           ; 1CA0 _ 75, 0F
00001CA2        mov     rax, qword ptr [r8]             ; 1CA2 _ 49: 8B. 00
00001CA5        lea     rcx, ptr [rax+8H]               ; 1CA5 _ 48: 8D. 48, 08
00001CA9        mov     qword ptr [r8], rcx             ; 1CA9 _ 49: 89. 08
00001CAC        mov     r12, qword ptr [rax]            ; 1CAC _ 4C: 8B. 20
00001CAF        jmp     ?_153                           ; 1CAF _ EB, D3

?_157:
00001CB1        mov     r12, qword ptr [rsi]            ; 1CB1 _ 4C: 8B. 26
00001CB4        jmp     ?_155                           ; 1CB4 _ EB, DB

00001CB6        mov     rdx, r14                        ; 1CB6 _ 4C: 89. F2
; Note: No jump seems to point here
00001CB9        or      rdx, 20H                        ; 1CB9 _ 48: 83. CA, 20
00001CBD        mov     rbx, r14                        ; 1CBD _ 4C: 89. F3
00001CC0        test    bh, 8H                          ; 1CC0 _ F6. C7, 08
00001CC3        cmove   r14, rdx                        ; 1CC3 _ 4C: 0F 44. F2
00001CC7        jmp     ?_145                           ; 1CC7 _ E9, FFFFFE6D

?_158:
00001CCC        cmp     rcx, 108                        ; 1CCC _ 48: 83. F9, 6C
00001CD0        jz      ?_152                           ; 1CD0 _ 74, 85
?_159:
00001CD2        mov     qword ptr [rbp-0A0H], r12       ; 1CD2 _ 4C: 89. A5, FFFFFF60
00001CD9        mov     qword ptr [rbp-0D0H], r11       ; 1CD9 _ 4C: 89. 9D, FFFFFF30
00001CE0        cmp     rcx, 82                         ; 1CE0 _ 48: 83. F9, 52
00001CE4        jg      ?_160                           ; 1CE4 _ 7F, 69
00001CE6        cmp     rcx, 10                         ; 1CE6 _ 48: 83. F9, 0A
00001CEA        je      ?_205                           ; 1CEA _ 0F 84, 00000604
00001CF0        cmp     rcx, 13                         ; 1CF0 _ 48: 83. F9, 0D
00001CF4        jne     ?_149                           ; 1CF4 _ 0F 85, FFFFFEEC
00001CFA        mov     qword ptr [rbp-0A8H], rsi       ; 1CFA _ 48: 89. B5, FFFFFF58
00001D01        movzx   edx, byte ptr [rax+r13*2]       ; 1D01 _ 42: 0F B6. 14 68
00001D06        mov     rcx, qword ptr [rbp-0B0H]       ; 1D06 _ 48: 8B. 8D, FFFFFF50
00001D0D        lea     rcx, ptr [r13+rcx]              ; 1D0D _ 49: 8D. 4C 0D, 00
00001D12        movzx   ecx, byte ptr [rax+rcx]         ; 1D12 _ 0F B6. 0C 08
00001D16        shl     rcx, 8                          ; 1D16 _ 48: C1. E1, 08
00001D1A        or      ecx, edx                        ; 1D1A _ 09. D1
00001D1C        xor     dl, dl                          ; 1D1C _ 30. D2
00001D1E        xor     edi, edi                        ; 1D1E _ 31. FF
00001D20        lea     rax, ptr [rax+r13*2]            ; 1D20 _ 4A: 8D. 04 68
00001D24        and     rcx, r9                         ; 1D24 _ 4C: 21. C9
00001D27        mov     qword ptr [rbp-68H], rcx        ; 1D27 _ 48: 89. 4D, 98
00001D2B        cmp     rcx, 10                         ; 1D2B _ 48: 83. F9, 0A
00001D2F        cmove   rbx, rax                        ; 1D2F _ 48: 0F 44. D8
00001D33        lea     r12, ptr [?_618]                ; 1D33 _ 4C: 8D. 25, 0000523D(rel)
00001D3A        lea     rax, ptr [?_617]                ; 1D3A _ 48: 8D. 05, 00005233(rel)
00001D41        cmove   r12, rax                        ; 1D41 _ 4C: 0F 44. E0
00001D45        mov     r10b, dl                        ; 1D45 _ 41: 88. D2
00001D48        mov     cl, dl                          ; 1D48 _ 88. D1
00001D4A        jmp     ?_203                           ; 1D4A _ E9, 00000568

?_160:
00001D4F        cmp     rcx, 111                        ; 1D4F _ 48: 83. F9, 6F
00001D53        jg      ?_162                           ; 1D53 _ 7F, 3A
00001D55        cmp     rcx, 96                         ; 1D55 _ 48: 83. F9, 60
00001D59        jg      ?_161                           ; 1D59 _ 7F, 16
00001D5B        cmp     rcx, 83                         ; 1D5B _ 48: 83. F9, 53
00001D5F        je      ?_181                           ; 1D5F _ 0F 84, 00000256
00001D65        cmp     rcx, 88                         ; 1D65 _ 48: 83. F9, 58
00001D69        jne     ?_149                           ; 1D69 _ 0F 85, FFFFFE77
00001D6F        jmp     ?_164                           ; 1D6F _ EB, 44

?_161:
00001D71        add     rcx, -97                        ; 1D71 _ 48: 83. C1, 9F
00001D75        cmp     rcx, 6                          ; 1D75 _ 48: 83. F9, 06
00001D79        ja      ?_149                           ; 1D79 _ 0F 87, FFFFFE67
00001D7F        lea     rdx, ptr [?_260]                ; 1D7F _ 48: 8D. 15, 00000C36(rel)
00001D86        movsxd  rax, dword ptr [rdx+rcx*4]      ; 1D86 _ 48: 63. 04 8A
00001D8A        add     rax, rdx                        ; 1D8A _ 48: 01. D0
00001D8D        jmp     rax                             ; 1D8D _ FF. E0

?_162:
00001D8F        add     rcx, -112                       ; 1D8F _ 48: 83. C1, 90
00001D93        cmp     rcx, 8                          ; 1D93 _ 48: 83. F9, 08
00001D97        ja      ?_149                           ; 1D97 _ 0F 87, FFFFFE49
00001D9D        lea     rdx, ptr [?_259]                ; 1D9D _ 48: 8D. 15, 00000BF4(rel)
00001DA4        movsxd  rax, dword ptr [rdx+rcx*4]      ; 1DA4 _ 48: 63. 04 8A
00001DA8        add     rax, rdx                        ; 1DA8 _ 48: 01. D0
00001DAB        jmp     rax                             ; 1DAB _ FF. E0

?_163   LABEL NEAR
00001DAD        and     r14, 0FFFFFFC9H                 ; 1DAD _ 49: 83. E6, C9
00001DB1        or      r14, 10H                        ; 1DB1 _ 49: 83. CE, 10
?_164:
00001DB5        or      r14, 20H                        ; 1DB5 _ 49: 83. CE, 20

?_165   LABEL NEAR
00001DB9        or      r14, 80H                        ; 1DB9 _ 49: 81. CE, 00000080

?_166   LABEL NEAR
00001DC0        test    r14b, 0FFFFFF80H                ; 1DC0 _ 41: F6. C6, 80
00001DC4        jnz     ?_167                           ; 1DC4 _ 75, 0E
00001DC6        and     r14, 0FFFFBFFDH                 ; 1DC6 _ 49: 81. E6, FFFFBFFD
00001DCD        or      r14, 4000H                      ; 1DCD _ 49: 81. CE, 00004000

?_167   LABEL NEAR
00001DD4        mov     rcx, r14                        ; 1DD4 _ 4C: 89. F1
00001DD7        mov     r12, r9                         ; 1DD7 _ 4D: 89. CC
00001DDA        and     rcx, 10H                        ; 1DDA _ 48: 83. E1, 10
00001DDE        jnz     ?_169                           ; 1DDE _ 75, 1B
00001DE0        test    rsi, rsi                        ; 1DE0 _ 48: 85. F6
00001DE3        jnz     ?_168                           ; 1DE3 _ 75, 11
00001DE5        mov     rax, qword ptr [r8]             ; 1DE5 _ 49: 8B. 00
00001DE8        lea     rdx, ptr [rax+8H]               ; 1DE8 _ 48: 8D. 50, 08
00001DEC        mov     qword ptr [r8], rdx             ; 1DEC _ 49: 89. 10
00001DEF        movsxd  rax, dword ptr [rax]            ; 1DEF _ 48: 63. 00
00001DF2        xor     esi, esi                        ; 1DF2 _ 31. F6
00001DF4        jmp     ?_172                           ; 1DF4 _ EB, 22

?_168:
00001DF6        movsxd  rax, dword ptr [rsi]            ; 1DF6 _ 48: 63. 06
00001DF9        jmp     ?_171                           ; 1DF9 _ EB, 19

?_169:
00001DFB        test    rsi, rsi                        ; 1DFB _ 48: 85. F6
00001DFE        jnz     ?_170                           ; 1DFE _ 75, 11
00001E00        mov     rax, qword ptr [r8]             ; 1E00 _ 49: 8B. 00
00001E03        lea     rdx, ptr [rax+8H]               ; 1E03 _ 48: 8D. 50, 08
00001E07        mov     qword ptr [r8], rdx             ; 1E07 _ 49: 89. 10
00001E0A        mov     rax, qword ptr [rax]            ; 1E0A _ 48: 8B. 00
00001E0D        xor     esi, esi                        ; 1E0D _ 31. F6
00001E0F        jmp     ?_172                           ; 1E0F _ EB, 07

?_170:
00001E11        mov     rax, qword ptr [rsi]            ; 1E11 _ 48: 8B. 06
?_171:
00001E14        add     rsi, 8                          ; 1E14 _ 48: 83. C6, 08
?_172:
00001E18        test    r14b, 2H                        ; 1E18 _ 41: F6. C6, 02
00001E1C        jnz     ?_173                           ; 1E1C _ 75, 0B
00001E1E        mov     edx, r14d                       ; 1E1E _ 44: 89. F2
00001E21        and     edx, 4H                         ; 1E21 _ 83. E2, 04
00001E24        shl     dl, 3                           ; 1E24 _ C0. E2, 03
00001E27        jmp     ?_174                           ; 1E27 _ EB, 02

?_173:
00001E29        mov     dl, 43                          ; 1E29 _ B2, 2B
?_174:
00001E2B        mov     dword ptr [rbp-0B4H], edx       ; 1E2B _ 89. 95, FFFFFF4C
00001E31        mov     qword ptr [rbp-0A8H], rsi       ; 1E31 _ 48: 89. B5, FFFFFF58
00001E38        test    r14b, 0FFFFFF80H                ; 1E38 _ 41: F6. C6, 80
00001E3C        jne     ?_176                           ; 1E3C _ 0F 85, 00000083
00001E42        mov     rcx, r14                        ; 1E42 _ 4C: 89. F1
00001E45        and     rcx, 8H                         ; 1E45 _ 48: 83. E1, 08
00001E49        mov     edx, ecx                        ; 1E49 _ 89. CA
00001E4B        shr     edx, 3                          ; 1E4B _ C1. EA, 03
00001E4E        xor     edx, 1H                         ; 1E4E _ 83. F2, 01
00001E51        xor     dl, 1H                          ; 1E51 _ 80. F2, 01
00001E54        mov     dword ptr [rbp-7CH], edx        ; 1E54 _ 89. 55, 84
00001E57        mov     rdx, r14                        ; 1E57 _ 4C: 89. F2
00001E5A        and     rdx, 0FFFFFFDFH                 ; 1E5A _ 48: 83. E2, DF
00001E5E        test    rcx, rcx                        ; 1E5E _ 48: 85. C9
00001E61        cmove   rdx, r14                        ; 1E61 _ 49: 0F 44. D6
00001E65        mov     r14, rdx                        ; 1E65 _ 49: 89. D6
00001E68        mov     ecx, 1                          ; 1E68 _ B9, 00000001
00001E6D        mov     rdx, qword ptr [rbp-0A0H]       ; 1E6D _ 48: 8B. 95, FFFFFF60
00001E74        cmovne  rdx, rcx                        ; 1E74 _ 48: 0F 45. D1
00001E78        mov     qword ptr [rbp-0A0H], rdx       ; 1E78 _ 48: 89. 95, FFFFFF60
00001E7F        test    rax, rax                        ; 1E7F _ 48: 85. C0
00001E82        jns     ?_175                           ; 1E82 _ 79, 22
00001E84        mov     rcx, r14                        ; 1E84 _ 4C: 89. F1
00001E87        test    ch, 40H                         ; 1E87 _ F6. C5, 40
00001E8A        jnz     ?_175                           ; 1E8A _ 75, 1A
00001E8C        neg     rax                             ; 1E8C _ 48: F7. D8
00001E8F        or      r14, 2H                         ; 1E8F _ 49: 83. CE, 02
00001E93        mov     cl, 45                          ; 1E93 _ B1, 2D
00001E95        mov     dword ptr [rbp-0B4H], ecx       ; 1E95 _ 89. 8D, FFFFFF4C
00001E9B        mov     r8d, 10                         ; 1E9B _ 41: B8, 0000000A
00001EA1        mov     rsi, rax                        ; 1EA1 _ 48: 89. C6
00001EA4        jmp     ?_177                           ; 1EA4 _ EB, 3E

?_175:
00001EA6        mov     esi, eax                        ; 1EA6 _ 89. C6
00001EA8        mov     rcx, r14                        ; 1EA8 _ 4C: 89. F1
00001EAB        and     rcx, 4010H                      ; 1EAB _ 48: 81. E1, 00004010
00001EB2        cmp     rcx, 16384                      ; 1EB2 _ 48: 81. F9, 00004000
00001EB9        cmovne  rsi, rax                        ; 1EB9 _ 48: 0F 45. F0
00001EBD        mov     r8d, 10                         ; 1EBD _ 41: B8, 0000000A
00001EC3        jmp     ?_177                           ; 1EC3 _ EB, 1F

?_176:
00001EC5        mov     esi, eax                        ; 1EC5 _ 89. C6
00001EC7        test    rax, rax                        ; 1EC7 _ 48: 85. C0
00001ECA        sets    dl                              ; 1ECA _ 0F 98. C2
00001ECD        test    rcx, rcx                        ; 1ECD _ 48: 85. C9
00001ED0        sete    cl                              ; 1ED0 _ 0F 94. C1
00001ED3        test    dl, cl                          ; 1ED3 _ 84. CA
00001ED5        cmove   rsi, rax                        ; 1ED5 _ 48: 0F 44. F0
00001ED9        xor     al, al                          ; 1ED9 _ 30. C0
00001EDB        mov     dword ptr [rbp-7CH], eax        ; 1EDB _ 89. 45, 84
00001EDE        mov     r8d, 16                         ; 1EDE _ 41: B8, 00000010
?_177:
00001EE4        lea     rdi, ptr [rbp-60H]              ; 1EE4 _ 48: 8D. 7D, A0
00001EE8        mov     rcx, rdi                        ; 1EE8 _ 48: 89. F9
00001EEB        mov     rdx, rsi                        ; 1EEB _ 48: 89. F2
00001EEE        call    _BasePrintLibValueToString      ; 1EEE _ E8, FFFFF8D9
00001EF3        mov     rcx, rax                        ; 1EF3 _ 48: 89. C1
00001EF6        sub     rcx, rdi                        ; 1EF6 _ 48: 29. F9
00001EF9        or      rsi, qword ptr [rbp-0A0H]       ; 1EF9 _ 48: 0B. B5, FFFFFF60
00001F00        mov     esi, 0                          ; 1F00 _ BE, 00000000
00001F05        cmove   rcx, rsi                        ; 1F05 _ 48: 0F 44. CE
00001F09        mov     rax, rcx                        ; 1F09 _ 48: 89. C8
00001F0C        mov     rdx, 0AAAAAAABH                 ; 1F0C _ 48: BA, AAAAAAAAAAAAAAAB
00001F16        mul     rdx                             ; 1F16 _ 48: F7. E2
00001F19        shr     rdx, 1                          ; 1F19 _ 48: D1. EA
00001F1C        lea     rax, ptr [rdx+rdx*2]            ; 1F1C _ 48: 8D. 04 52
00001F20        mov     rdi, rcx                        ; 1F20 _ 48: 89. CF
00001F23        sub     rdi, rax                        ; 1F23 _ 48: 29. C7
00001F26        xor     rdi, 3H                         ; 1F26 _ 48: 83. F7, 03
00001F2A        mov     rdx, rcx                        ; 1F2A _ 48: 89. CA
00001F2D        sub     rdx, rax                        ; 1F2D _ 48: 29. C2
00001F30        cmove   rdi, rsi                        ; 1F30 _ 48: 0F 44. FE
00001F34        mov     eax, dword ptr [rbp-7CH]        ; 1F34 _ 8B. 45, 84
00001F37        test    al, al                          ; 1F37 _ 84. C0
00001F39        mov     r15, rcx                        ; 1F39 _ 49: 89. CF
00001F3C        jz      ?_178                           ; 1F3C _ 74, 22
00001F3E        test    rcx, rcx                        ; 1F3E _ 48: 85. C9
00001F41        mov     r15, rcx                        ; 1F41 _ 49: 89. CF
00001F44        jz      ?_178                           ; 1F44 _ 74, 1A
00001F46        lea     rax, ptr [rcx-1H]               ; 1F46 _ 48: 8D. 41, FF
00001F4A        mov     rdx, 0AAAAAAABH                 ; 1F4A _ 48: BA, AAAAAAAAAAAAAAAB
00001F54        mul     rdx                             ; 1F54 _ 48: F7. E2
00001F57        mov     r15, rdx                        ; 1F57 _ 49: 89. D7
00001F5A        shr     r15, 1                          ; 1F5A _ 49: D1. EF
00001F5D        add     r15, rcx                        ; 1F5D _ 49: 01. CF
?_178:
00001F60        mov     eax, dword ptr [rbp-0B4H]       ; 1F60 _ 8B. 85, FFFFFF4C
00001F66        test    al, al                          ; 1F66 _ 84. C0
00001F68        mov     r9, r12                         ; 1F68 _ 4D: 89. E1
00001F6B        jnz     ?_179                           ; 1F6B _ 75, 09
00001F6D        mov     rdx, qword ptr [rbp-0A0H]       ; 1F6D _ 48: 8B. 95, FFFFFF60
00001F74        jmp     ?_180                           ; 1F74 _ EB, 0D

?_179:
00001F76        mov     rdx, qword ptr [rbp-0A0H]       ; 1F76 _ 48: 8B. 95, FFFFFF60
00001F7D        inc     rdx                             ; 1F7D _ 48: FF. C2
00001F80        inc     r15                             ; 1F80 _ 49: FF. C7
?_180:
00001F83        lea     r12, ptr [rbp+rcx-60H]          ; 1F83 _ 4C: 8D. 64 0D, A0
00001F88        mov     rax, r14                        ; 1F88 _ 4C: 89. F0
00001F8B        and     rax, 0A21H                      ; 1F8B _ 48: 25, 00000A21
00001F91        cmp     rax, 544                        ; 1F91 _ 48: 3D, 00000220
00001F97        cmove   rdx, qword ptr [rbp-0D0H]       ; 1F97 _ 48: 0F 44. 95, FFFFFF30
00001F9F        mov     qword ptr [rbp-0A0H], rdx       ; 1F9F _ 48: 89. 95, FFFFFF60
00001FA6        or      r14, 1000H                      ; 1FA6 _ 49: 81. CE, 00001000
00001FAD        mov     r10b, 1                         ; 1FAD _ 41: B2, 01
00001FB0        mov     ecx, dword ptr [rbp-0B4H]       ; 1FB0 _ 8B. 8D, FFFFFF4C
00001FB6        jmp     ?_210                           ; 1FB6 _ E9, 0000045D

?_181   LABEL NEAR
00001FBB        or      r14, 400H                       ; 1FBB _ 49: 81. CE, 00000400

?_182   LABEL NEAR
00001FC2        test    rsi, rsi                        ; 1FC2 _ 48: 85. F6
00001FC5        jnz     ?_183                           ; 1FC5 _ 75, 17
00001FC7        mov     rax, qword ptr [r8]             ; 1FC7 _ 49: 8B. 00
00001FCA        lea     rcx, ptr [rax+8H]               ; 1FCA _ 48: 8D. 48, 08
00001FCE        mov     qword ptr [r8], rcx             ; 1FCE _ 49: 89. 08
00001FD1        mov     qword ptr [rbp-0A8H], 0         ; 1FD1 _ 48: C7. 85, FFFFFF58, 00000000
00001FDC        jmp     ?_184                           ; 1FDC _ EB, 0E

?_183:
00001FDE        lea     rcx, ptr [rsi+8H]               ; 1FDE _ 48: 8D. 4E, 08
00001FE2        mov     rax, rsi                        ; 1FE2 _ 48: 89. F0
00001FE5        mov     qword ptr [rbp-0A8H], rcx       ; 1FE5 _ 48: 89. 8D, FFFFFF58
?_184:
00001FEC        mov     rcx, r14                        ; 1FEC _ 4C: 89. F1
00001FEF        and     rcx, 0FFFFFBFFH                 ; 1FEF _ 48: 81. E1, FFFFFBFF
00001FF6        mov     r12, qword ptr [rax]            ; 1FF6 _ 4C: 8B. 20
00001FF9        test    r12, r12                        ; 1FF9 _ 4D: 85. E4
00001FFC        lea     rax, ptr [?_611]                ; 1FFC _ 48: 8D. 05, 00004EFB(rel)
00002003        cmove   r12, rax                        ; 2003 _ 4C: 0F 44. E0
00002007        cmove   r14, rcx                        ; 2007 _ 4C: 0F 44. F1
0000200B        mov     rax, r14                        ; 200B _ 4C: 89. F0
0000200E        shl     rax, 52                         ; 200E _ 48: C1. E0, 34
00002012        sar     rax, 63                         ; 2012 _ 48: C1. F8, 3F
00002016        and     qword ptr [rbp-0A0H], rax       ; 2016 _ 48: 21. 85, FFFFFF60
0000201D        xor     al, al                          ; 201D _ 30. C0
0000201F        xor     edi, edi                        ; 201F _ 31. FF
00002021        jmp     ?_202                           ; 2021 _ E9, 0000028C

?_185   LABEL NEAR
00002026        test    rsi, rsi                        ; 2026 _ 48: 85. F6
00002029        jnz     ?_186                           ; 2029 _ 75, 17
0000202B        mov     rax, qword ptr [r8]             ; 202B _ 49: 8B. 00
0000202E        lea     rcx, ptr [rax+8H]               ; 202E _ 48: 8D. 48, 08
00002032        mov     qword ptr [r8], rcx             ; 2032 _ 49: 89. 08
00002035        mov     qword ptr [rbp-0A8H], 0         ; 2035 _ 48: C7. 85, FFFFFF58, 00000000
00002040        jmp     ?_187                           ; 2040 _ EB, 0E

?_186:
00002042        lea     rcx, ptr [rsi+8H]               ; 2042 _ 48: 8D. 4E, 08
00002046        mov     rax, rsi                        ; 2046 _ 48: 89. F0
00002049        mov     qword ptr [rbp-0A8H], rcx       ; 2049 _ 48: 89. 8D, FFFFFF58
?_187:
00002050        mov     rax, qword ptr [rax]            ; 2050 _ 48: 8B. 00
00002053        mov     ecx, 65535                      ; 2053 _ B9, 0000FFFF
00002058        and     rax, rcx                        ; 2058 _ 48: 21. C8
0000205B        mov     qword ptr [rbp-70H], rax        ; 205B _ 48: 89. 45, 90
0000205F        or      r14, 400H                       ; 205F _ 49: 81. CE, 00000400
00002066        xor     al, al                          ; 2066 _ 30. C0
00002068        xor     edi, edi                        ; 2068 _ 31. FF
0000206A        mov     r10b, al                        ; 206A _ 41: 88. C2
0000206D        mov     cl, al                          ; 206D _ 88. C1
0000206F        xor     al, al                          ; 206F _ 30. C0
00002071        mov     dword ptr [rbp-7CH], eax        ; 2071 _ 89. 45, 84
00002074        lea     r12, ptr [rbp-70H]              ; 2074 _ 4C: 8D. 65, 90
00002078        jmp     ?_210                           ; 2078 _ E9, 0000039B

?_188   LABEL NEAR
0000207D        test    rsi, rsi                        ; 207D _ 48: 85. F6
00002080        jnz     ?_189                           ; 2080 _ 75, 0E
00002082        mov     rsi, qword ptr [r8]             ; 2082 _ 49: 8B. 30
00002085        lea     rax, ptr [rsi+8H]               ; 2085 _ 48: 8D. 46, 08
00002089        mov     qword ptr [r8], rax             ; 2089 _ 49: 89. 00
0000208C        xor     eax, eax                        ; 208C _ 31. C0
0000208E        jmp     ?_190                           ; 208E _ EB, 04

?_189:
00002090        lea     rax, ptr [rsi+8H]               ; 2090 _ 48: 8D. 46, 08
?_190:
00002094        mov     qword ptr [rbp-88H], rax        ; 2094 _ 48: 89. 85, FFFFFF78
0000209B        mov     r12, qword ptr [rsi]            ; 209B _ 4C: 8B. 26
0000209E        test    r12, r12                        ; 209E _ 4D: 85. E4
000020A1        jnz     ?_192                           ; 20A1 _ 75, 28
000020A3        xor     edi, edi                        ; 20A3 _ 31. FF
000020A5        xor     al, al                          ; 20A5 _ 30. C0
000020A7        mov     r10b, al                        ; 20A7 _ 41: 88. C2
000020AA        mov     cl, al                          ; 20AA _ 88. C1
000020AC        xor     al, al                          ; 20AC _ 30. C0
000020AE        mov     dword ptr [rbp-7CH], eax        ; 20AE _ 89. 45, 84
000020B1        lea     r12, ptr [?_612]                ; 20B1 _ 4C: 8D. 25, 00004E54(rel)
?_191:
000020B8        mov     rax, qword ptr [rbp-88H]        ; 20B8 _ 48: 8B. 85, FFFFFF78
000020BF        mov     qword ptr [rbp-0A8H], rax       ; 20BF _ 48: 89. 85, FFFFFF58
000020C6        jmp     ?_210                           ; 20C6 _ E9, 0000034D

?_192:
000020CB        mov     rcx, r12                        ; 20CB _ 4C: 89. E1
000020CE        mov     qword ptr [rbp-0E8H], rbx       ; 20CE _ 48: 89. 9D, FFFFFF18
000020D5        call    _ReadUnaligned32                ; 20D5 _ E8, FFFFEF8A
000020DA        mov     dword ptr [rbp-7CH], eax        ; 20DA _ 89. 45, 84
000020DD        lea     rcx, ptr [r12+4H]               ; 20DD _ 49: 8D. 4C 24, 04
000020E2        call    _ReadUnaligned16                ; 20E2 _ E8, FFFFEF41
000020E7        mov     word ptr [rbp-0A8H], ax         ; 20E7 _ 66: 89. 85, FFFFFF58
000020EE        lea     rcx, ptr [r12+6H]               ; 20EE _ 49: 8D. 4C 24, 06
000020F3        call    _ReadUnaligned16                ; 20F3 _ E8, FFFFEF30
000020F8        movzx   r8d, byte ptr [r12+8H]          ; 20F8 _ 45: 0F B6. 44 24, 08
000020FE        movzx   r9d, byte ptr [r12+9H]          ; 20FE _ 45: 0F B6. 4C 24, 09
00002104        movzx   r10d, byte ptr [r12+0AH]        ; 2104 _ 45: 0F B6. 54 24, 0A
0000210A        movzx   edi, byte ptr [r12+0BH]         ; 210A _ 41: 0F B6. 7C 24, 0B
00002110        movzx   esi, byte ptr [r12+0CH]         ; 2110 _ 41: 0F B6. 74 24, 0C
00002116        movzx   ecx, byte ptr [r12+0DH]         ; 2116 _ 41: 0F B6. 4C 24, 0D
0000211C        movzx   edx, byte ptr [r12+0EH]         ; 211C _ 41: 0F B6. 54 24, 0E
00002122        movzx   ebx, byte ptr [r12+0FH]         ; 2122 _ 41: 0F B6. 5C 24, 0F
00002128        mov     dword ptr [rsp+70H], ebx        ; 2128 _ 89. 5C 24, 70
0000212C        mov     dword ptr [rsp+68H], edx        ; 212C _ 89. 54 24, 68
00002130        mov     dword ptr [rsp+60H], ecx        ; 2130 _ 89. 4C 24, 60
00002134        mov     dword ptr [rsp+58H], esi        ; 2134 _ 89. 74 24, 58
00002138        mov     dword ptr [rsp+50H], edi        ; 2138 _ 89. 7C 24, 50
0000213C        xor     edi, edi                        ; 213C _ 31. FF
0000213E        mov     dword ptr [rsp+48H], r10d       ; 213E _ 44: 89. 54 24, 48
00002143        mov     dword ptr [rsp+40H], r9d        ; 2143 _ 44: 89. 4C 24, 40
00002148        mov     dword ptr [rsp+38H], r8d        ; 2148 _ 44: 89. 44 24, 38
0000214D        movzx   eax, ax                         ; 214D _ 0F B7. C0
00002150        mov     dword ptr [rsp+30H], eax        ; 2150 _ 89. 44 24, 30
00002154        movzx   eax, word ptr [rbp-0A8H]        ; 2154 _ 0F B7. 85, FFFFFF58
0000215B        mov     dword ptr [rsp+28H], eax        ; 215B _ 89. 44 24, 28
0000215F        mov     eax, dword ptr [rbp-7CH]        ; 215F _ 8B. 45, 84
00002162        mov     dword ptr [rsp+20H], eax        ; 2162 _ 89. 44 24, 20
00002166        lea     rsi, ptr [rbp-60H]              ; 2166 _ 48: 8D. 75, A0
0000216A        mov     rcx, rsi                        ; 216A _ 48: 89. F1
0000216D        mov     edx, 38                         ; 216D _ BA, 00000026
00002172        xor     r8d, r8d                        ; 2172 _ 45: 31. C0
00002175        lea     r9, ptr [?_613]                 ; 2175 _ 4C: 8D. 0D, 00004D9C(rel)
0000217C        call    _BasePrintLibSPrint             ; 217C _ E8, 00000857
00002181        mov     r9, qword ptr [rbp-0D8H]        ; 2181 _ 4C: 8B. 8D, FFFFFF28
00002188        mov     rbx, qword ptr [rbp-0E8H]       ; 2188 _ 48: 8B. 9D, FFFFFF18
0000218F        xor     al, al                          ; 218F _ 30. C0
00002191        mov     r10b, al                        ; 2191 _ 41: 88. C2
00002194        mov     cl, al                          ; 2194 _ 88. C1
00002196        xor     al, al                          ; 2196 _ 30. C0
00002198        mov     dword ptr [rbp-7CH], eax        ; 2198 _ 89. 45, 84
0000219B        mov     r12, rsi                        ; 219B _ 49: 89. F4
0000219E        jmp     ?_191                           ; 219E _ E9, FFFFFF15

?_193   LABEL NEAR
000021A3        test    rsi, rsi                        ; 21A3 _ 48: 85. F6
000021A6        jnz     ?_194                           ; 21A6 _ 75, 0E
000021A8        mov     rsi, qword ptr [r8]             ; 21A8 _ 49: 8B. 30
000021AB        lea     rax, ptr [rsi+8H]               ; 21AB _ 48: 8D. 46, 08
000021AF        mov     qword ptr [r8], rax             ; 21AF _ 49: 89. 00
000021B2        xor     eax, eax                        ; 21B2 _ 31. C0
000021B4        jmp     ?_195                           ; 21B4 _ EB, 04

?_194:
000021B6        lea     rax, ptr [rsi+8H]               ; 21B6 _ 48: 8D. 46, 08
?_195:
000021BA        mov     qword ptr [rbp-88H], rax        ; 21BA _ 48: 89. 85, FFFFFF78
000021C1        mov     rdx, qword ptr [rsi]            ; 21C1 _ 48: 8B. 16
000021C4        test    rdx, rdx                        ; 21C4 _ 48: 85. D2
000021C7        jnz     ?_196                           ; 21C7 _ 75, 1A
000021C9        xor     edi, edi                        ; 21C9 _ 31. FF
000021CB        xor     al, al                          ; 21CB _ 30. C0
000021CD        mov     r10b, al                        ; 21CD _ 41: 88. C2
000021D0        mov     cl, al                          ; 21D0 _ 88. C1
000021D2        xor     al, al                          ; 21D2 _ 30. C0
000021D4        mov     dword ptr [rbp-7CH], eax        ; 21D4 _ 89. 45, 84
000021D7        lea     r12, ptr [?_614]                ; 21D7 _ 4C: 8D. 25, 00004D6B(rel)
000021DE        jmp     ?_191                           ; 21DE _ E9, FFFFFED5

?_196:
000021E3        movzx   eax, byte ptr [rdx+2H]          ; 21E3 _ 0F B6. 42, 02
000021E7        movzx   ecx, byte ptr [rdx+3H]          ; 21E7 _ 0F B6. 4A, 03
000021EB        movzx   esi, word ptr [rdx]             ; 21EB _ 0F B7. 32
000021EE        movzx   edi, byte ptr [rdx+4H]          ; 21EE _ 0F B6. 7A, 04
000021F2        movzx   edx, byte ptr [rdx+5H]          ; 21F2 _ 0F B6. 52, 05
000021F6        mov     dword ptr [rsp+40H], edx        ; 21F6 _ 89. 54 24, 40
000021FA        mov     dword ptr [rsp+38H], edi        ; 21FA _ 89. 7C 24, 38
000021FE        mov     dword ptr [rsp+30H], esi        ; 21FE _ 89. 74 24, 30
00002202        mov     dword ptr [rsp+28H], ecx        ; 2202 _ 89. 4C 24, 28
00002206        mov     dword ptr [rsp+20H], eax        ; 2206 _ 89. 44 24, 20
0000220A        lea     rdi, ptr [rbp-60H]              ; 220A _ 48: 8D. 7D, A0
0000220E        mov     rcx, rdi                        ; 220E _ 48: 89. F9
00002211        mov     edx, 38                         ; 2211 _ BA, 00000026
00002216        xor     r8d, r8d                        ; 2216 _ 45: 31. C0
00002219        mov     rsi, r9                         ; 2219 _ 4C: 89. CE
0000221C        lea     r9, ptr [?_615]                 ; 221C _ 4C: 8D. 0D, 00004D32(rel)
00002223        call    _BasePrintLibSPrint             ; 2223 _ E8, 000007B0
00002228        mov     r9, rsi                         ; 2228 _ 49: 89. F1
0000222B        xor     al, al                          ; 222B _ 30. C0
0000222D        mov     r10b, al                        ; 222D _ 41: 88. C2
00002230        mov     cl, al                          ; 2230 _ 88. C1
00002232        xor     al, al                          ; 2232 _ 30. C0
00002234        mov     dword ptr [rbp-7CH], eax        ; 2234 _ 89. 45, 84
00002237        mov     r12, rdi                        ; 2237 _ 49: 89. FC
0000223A        xor     edi, edi                        ; 223A _ 31. FF
0000223C        jmp     ?_191                           ; 223C _ E9, FFFFFE77

?_197   LABEL NEAR
00002241        test    rsi, rsi                        ; 2241 _ 48: 85. F6
00002244        jnz     ?_198                           ; 2244 _ 75, 0E
00002246        mov     rax, qword ptr [r8]             ; 2246 _ 49: 8B. 00
00002249        lea     rcx, ptr [rax+8H]               ; 2249 _ 48: 8D. 48, 08
0000224D        mov     qword ptr [r8], rcx             ; 224D _ 49: 89. 08
00002250        xor     ecx, ecx                        ; 2250 _ 31. C9
00002252        jmp     ?_199                           ; 2252 _ EB, 07

?_198:
00002254        lea     rcx, ptr [rsi+8H]               ; 2254 _ 48: 8D. 4E, 08
00002258        mov     rax, rsi                        ; 2258 _ 48: 89. F0
?_199:
0000225B        lea     rdx, ptr [rbp-60H]              ; 225B _ 48: 8D. 55, A0
0000225F        mov     qword ptr [rbp-0A8H], rcx       ; 225F _ 48: 89. 8D, FFFFFF58
00002266        mov     rax, qword ptr [rax]            ; 2266 _ 48: 8B. 00
00002269        test    rax, rax                        ; 2269 _ 48: 85. C0
0000226C        jns     ?_200                           ; 226C _ 79, 24
0000226E        mov     rcx, rax                        ; 226E _ 48: 89. C1
00002271        mov     rdi, 0FFFFFFFFH                 ; 2271 _ 48: BF, 7FFFFFFFFFFFFFFF
0000227B        and     rcx, rdi                        ; 227B _ 48: 21. F9
0000227E        mov     r12, rdx                        ; 227E _ 49: 89. D4
00002281        jz      ?_204                           ; 2281 _ 74, 3E
00002283        cmp     rcx, 33                         ; 2283 _ 48: 83. F9, 21
00002287        mov     r12, rdx                        ; 2287 _ 49: 89. D4
0000228A        ja      ?_204                           ; 228A _ 77, 35
0000228C        add     rcx, 5                          ; 228C _ 48: 83. C1, 05
00002290        jmp     ?_201                           ; 2290 _ EB, 0C

?_200:
00002292        cmp     rax, 5                          ; 2292 _ 48: 83. F8, 05
00002296        mov     rcx, rax                        ; 2296 _ 48: 89. C1
00002299        mov     r12, rdx                        ; 2299 _ 49: 89. D4
0000229C        ja      ?_204                           ; 229C _ 77, 23
?_201:
0000229E        lea     rdi, ptr [_mStatusString]       ; 229E _ 48: 8D. 3D, 00006A5B(rel)
000022A5        mov     r12, qword ptr [rdi+rcx*8]      ; 22A5 _ 4C: 8B. 24 CF
000022A9        cmp     r12, rdx                        ; 22A9 _ 49: 39. D4
000022AC        jz      ?_204                           ; 22AC _ 74, 13
000022AE        xor     edi, edi                        ; 22AE _ 31. FF
000022B0        xor     al, al                          ; 22B0 _ 30. C0
?_202:
000022B2        mov     r10b, al                        ; 22B2 _ 41: 88. C2
000022B5        mov     cl, al                          ; 22B5 _ 88. C1
?_203:
000022B7        xor     al, al                          ; 22B7 _ 30. C0
000022B9        mov     dword ptr [rbp-7CH], eax        ; 22B9 _ 89. 45, 84
000022BC        jmp     ?_210                           ; 22BC _ E9, 00000157

?_204:
000022C1        mov     qword ptr [rsp+20H], rax        ; 22C1 _ 48: 89. 44 24, 20
000022C6        xor     edi, edi                        ; 22C6 _ 31. FF
000022C8        mov     rcx, rdx                        ; 22C8 _ 48: 89. D1
000022CB        mov     edx, 38                         ; 22CB _ BA, 00000026
000022D0        xor     r8d, r8d                        ; 22D0 _ 45: 31. C0
000022D3        mov     rsi, r9                         ; 22D3 _ 4C: 89. CE
000022D6        lea     r9, ptr [?_616]                 ; 22D6 _ 4C: 8D. 0D, 00004C92(rel)
000022DD        call    _BasePrintLibSPrint             ; 22DD _ E8, 000006F6
000022E2        mov     r9, rsi                         ; 22E2 _ 49: 89. F1
000022E5        xor     al, al                          ; 22E5 _ 30. C0
000022E7        mov     dword ptr [rbp-7CH], eax        ; 22E7 _ 89. 45, 84
000022EA        xor     r10b, r10b                      ; 22EA _ 45: 30. D2
000022ED        xor     cl, cl                          ; 22ED _ 30. C9
000022EF        jmp     ?_210                           ; 22EF _ E9, 00000124

?_205:
000022F4        mov     qword ptr [rbp-0A8H], rsi       ; 22F4 _ 48: 89. B5, FFFFFF58
000022FB        movzx   edx, byte ptr [rax+r13*2]       ; 22FB _ 42: 0F B6. 14 68
00002300        mov     rcx, qword ptr [rbp-0B0H]       ; 2300 _ 48: 8B. 8D, FFFFFF50
00002307        lea     rcx, ptr [r13+rcx]              ; 2307 _ 49: 8D. 4C 0D, 00
0000230C        movzx   ecx, byte ptr [rax+rcx]         ; 230C _ 0F B6. 0C 08
00002310        shl     rcx, 8                          ; 2310 _ 48: C1. E1, 08
00002314        or      ecx, edx                        ; 2314 _ 09. D1
00002316        xor     dl, dl                          ; 2316 _ 30. D2
00002318        xor     edi, edi                        ; 2318 _ 31. FF
0000231A        lea     rax, ptr [rax+r13*2]            ; 231A _ 4A: 8D. 04 68
0000231E        and     rcx, r9                         ; 231E _ 4C: 21. C9
00002321        mov     qword ptr [rbp-68H], rcx        ; 2321 _ 48: 89. 4D, 98
00002325        cmp     rcx, 13                         ; 2325 _ 48: 83. F9, 0D
00002329        cmove   rbx, rax                        ; 2329 _ 48: 0F 44. D8
0000232D        mov     r10b, dl                        ; 232D _ 41: 88. D2
00002330        mov     cl, dl                          ; 2330 _ 88. D1
00002332        xor     al, al                          ; 2332 _ 30. C0
00002334        mov     dword ptr [rbp-7CH], eax        ; 2334 _ 89. 45, 84
00002337        lea     r12, ptr [?_617]                ; 2337 _ 4C: 8D. 25, 00004C36(rel)
0000233E        jmp     ?_210                           ; 233E _ E9, 000000D5

?_206:
00002343        movzx   ecx, byte ptr [rbx+r13]         ; 2343 _ 42: 0F B6. 0C 2B
00002348        movzx   eax, byte ptr [rbx+r13+1H]      ; 2348 _ 42: 0F B6. 44 2B, 01
0000234E        shl     rax, 8                          ; 234E _ 48: C1. E0, 08
00002352        or      eax, ecx                        ; 2352 _ 09. C8
00002354        and     rax, r9                         ; 2354 _ 4C: 21. C8
00002357        mov     qword ptr [rbp-68H], rax        ; 2357 _ 48: 89. 45, 98
0000235B        lea     rcx, ptr [rbx+r13]              ; 235B _ 4A: 8D. 0C 2B
0000235F        mov     edx, 1                          ; 235F _ BA, 00000001
00002364        mov     qword ptr [rbp-0A0H], rdx       ; 2364 _ 48: 89. 95, FFFFFF60
0000236B        xor     dl, dl                          ; 236B _ 30. D2
0000236D        xor     edi, edi                        ; 236D _ 31. FF
0000236F        cmp     rax, 10                         ; 236F _ 48: 83. F8, 0A
00002373        cmove   rbx, rcx                        ; 2373 _ 48: 0F 44. D9
00002377        lea     r12, ptr [?_618]                ; 2377 _ 4C: 8D. 25, 00004BF9(rel)
0000237E        lea     rax, ptr [?_617]                ; 237E _ 48: 8D. 05, 00004BEF(rel)
00002385        cmove   r12, rax                        ; 2385 _ 4C: 0F 44. E0
00002389        mov     r10b, dl                        ; 2389 _ 41: 88. D2
0000238C        mov     cl, dl                          ; 238C _ 88. D1
0000238E        xor     al, al                          ; 238E _ 30. C0
00002390        mov     dword ptr [rbp-7CH], eax        ; 2390 _ 89. 45, 84
00002393        mov     r15, rdi                        ; 2393 _ 49: 89. FF
00002396        jmp     ?_209                           ; 2396 _ EB, 79

?_207:
00002398        movzx   ecx, byte ptr [rbx+r13]         ; 2398 _ 42: 0F B6. 0C 2B
0000239D        movzx   eax, byte ptr [rbx+r13+1H]      ; 239D _ 42: 0F B6. 44 2B, 01
000023A3        shl     rax, 8                          ; 23A3 _ 48: C1. E0, 08
000023A7        or      eax, ecx                        ; 23A7 _ 09. C8
000023A9        mov     r9, qword ptr [rbp-0D8H]        ; 23A9 _ 4C: 8B. 8D, FFFFFF28
000023B0        and     rax, r9                         ; 23B0 _ 4C: 21. C8
000023B3        mov     ecx, 1                          ; 23B3 _ B9, 00000001
000023B8        mov     qword ptr [rbp-0A0H], rcx       ; 23B8 _ 48: 89. 8D, FFFFFF60
000023BF        mov     qword ptr [rbp-68H], rax        ; 23BF _ 48: 89. 45, 98
000023C3        lea     rcx, ptr [rbx+r13]              ; 23C3 _ 4A: 8D. 0C 2B
000023C7        xor     dl, dl                          ; 23C7 _ 30. D2
000023C9        xor     edi, edi                        ; 23C9 _ 31. FF
000023CB        cmp     rax, 13                         ; 23CB _ 48: 83. F8, 0D
000023CF        cmove   rbx, rcx                        ; 23CF _ 48: 0F 44. D9
000023D3        mov     r10b, dl                        ; 23D3 _ 41: 88. D2
000023D6        mov     cl, dl                          ; 23D6 _ 88. D1
000023D8        xor     al, al                          ; 23D8 _ 30. C0
000023DA        mov     dword ptr [rbp-7CH], eax        ; 23DA _ 89. 45, 84
000023DD        mov     r15, rdi                        ; 23DD _ 49: 89. FF
000023E0        lea     r12, ptr [?_617]                ; 23E0 _ 4C: 8D. 25, 00004B8D(rel)
000023E7        jmp     ?_209                           ; 23E7 _ EB, 28

?_208:
000023E9        mov     eax, 1                          ; 23E9 _ B8, 00000001
000023EE        mov     qword ptr [rbp-0A0H], rax       ; 23EE _ 48: 89. 85, FFFFFF60
000023F5        or      r14, 400H                       ; 23F5 _ 49: 81. CE, 00000400
000023FC        xor     al, al                          ; 23FC _ 30. C0
000023FE        xor     edi, edi                        ; 23FE _ 31. FF
00002400        mov     r10b, al                        ; 2400 _ 41: 88. C2
00002403        mov     cl, al                          ; 2403 _ 88. C1
00002405        xor     al, al                          ; 2405 _ 30. C0
00002407        mov     dword ptr [rbp-7CH], eax        ; 2407 _ 89. 45, 84
0000240A        mov     r15, rdi                        ; 240A _ 49: 89. FF
0000240D        lea     r12, ptr [rbp-68H]              ; 240D _ 4C: 8D. 65, 98
?_209:
00002411        mov     qword ptr [rbp-0D0H], rdi       ; 2411 _ 48: 89. BD, FFFFFF30
?_210:
00002418        mov     dword ptr [rbp-0B4H], ecx       ; 2418 _ 89. 8D, FFFFFF4C
0000241E        mov     qword ptr [rbp-88H], rdi        ; 241E _ 48: 89. BD, FFFFFF78
00002425        mov     qword ptr [rbp-0D8H], r9        ; 2425 _ 4C: 89. 8D, FFFFFF28
0000242C        mov     qword ptr [rbp-0E8H], rbx       ; 242C _ 48: 89. 9D, FFFFFF18
00002433        mov     r8, r14                         ; 2433 _ 4D: 89. F0
00002436        and     r8, 400H                        ; 2436 _ 49: 81. E0, 00000400
0000243D        mov     r11d, 65535                     ; 243D _ 41: BB, 0000FFFF
00002443        mov     eax, 255                        ; 2443 _ B8, 000000FF
00002448        cmove   r11, rax                        ; 2448 _ 4C: 0F 44. D8
0000244C        shr     r8, 10                          ; 244C _ 49: C1. E8, 0A
00002450        mov     rax, r14                        ; 2450 _ 4C: 89. F0
00002453        test    ah, 10H                         ; 2453 _ F6. C4, 10
00002456        jnz     ?_214                           ; 2456 _ 75, 4E
00002458        lea     rax, ptr [r12+1H]               ; 2458 _ 49: 8D. 44 24, 01
0000245D        mov     rdi, r14                        ; 245D _ 4C: 89. F7
00002460        and     rdi, 800H                       ; 2460 _ 48: 81. E7, 00000800
00002467        lea     rdx, ptr [r8+1H]                ; 2467 _ 49: 8D. 50, 01
0000246B        inc     r8                              ; 246B _ 49: FF. C0
0000246E        xor     r15d, r15d                      ; 246E _ 45: 31. FF
00002471        mov     r9, qword ptr [rbp-0F8H]        ; 2471 _ 4C: 8B. 8D, FFFFFF08
00002478        jmp     ?_212                           ; 2478 _ EB, 19

?_211:
0000247A        movzx   ebx, byte ptr [rax-1H]          ; 247A _ 0F B6. 58, FF
0000247E        movzx   ecx, byte ptr [rax]             ; 247E _ 0F B6. 08
00002481        shl     rcx, 8                          ; 2481 _ 48: C1. E1, 08
00002485        or      rcx, rbx                        ; 2485 _ 48: 09. D9
00002488        test    r11, rcx                        ; 2488 _ 49: 85. CB
0000248B        jz      ?_213                           ; 248B _ 74, 14
0000248D        add     rax, r8                         ; 248D _ 4C: 01. C0
00002490        inc     r15                             ; 2490 _ 49: FF. C7
?_212:
00002493        cmp     r15, qword ptr [rbp-0A0H]       ; 2493 _ 4C: 3B. BD, FFFFFF60
0000249A        jc      ?_211                           ; 249A _ 72, DE
0000249C        test    rdi, rdi                        ; 249C _ 48: 85. FF
0000249F        jz      ?_211                           ; 249F _ 74, D9
?_213:
000024A1        mov     r8, rdx                         ; 24A1 _ 49: 89. D0
000024A4        jmp     ?_215                           ; 24A4 _ EB, 0A

?_214:
000024A6        not     r8                              ; 24A6 _ 49: F7. D0
000024A9        mov     r9, qword ptr [rbp-0F8H]        ; 24A9 _ 4C: 8B. 8D, FFFFFF08
?_215:
000024B0        mov     rax, qword ptr [rbp-0A0H]       ; 24B0 _ 48: 8B. 85, FFFFFF60
000024B7        cmp     rax, r15                        ; 24B7 _ 4C: 39. F8
000024BA        mov     rcx, rax                        ; 24BA _ 48: 89. C1
000024BD        cmovc   rcx, r15                        ; 24BD _ 49: 0F 42. CF
000024C1        mov     rax, r14                        ; 24C1 _ 4C: 89. F0
000024C4        and     rax, 201H                       ; 24C4 _ 48: 25, 00000201
000024CA        mov     qword ptr [rbp-100H], rax       ; 24CA _ 48: 89. 85, FFFFFF00
000024D1        cmp     rax, 512                        ; 24D1 _ 48: 3D, 00000200
000024D7        mov     rsi, qword ptr [rbp-0C0H]       ; 24D7 _ 48: 8B. B5, FFFFFF40
000024DE        jz      ?_216                           ; 24DE _ 74, 10
000024E0        mov     qword ptr [rbp-0E0H], rcx       ; 24E0 _ 48: 89. 8D, FFFFFF20
000024E7        mov     rdx, qword ptr [rbp-0F0H]       ; 24E7 _ 48: 8B. 95, FFFFFF10
000024EE        jmp     ?_217                           ; 24EE _ EB, 2B

?_216:
000024F0        mov     rax, qword ptr [rbp-0D0H]       ; 24F0 _ 48: 8B. 85, FFFFFF30
000024F7        sub     rax, rcx                        ; 24F7 _ 48: 29. C8
000024FA        mov     qword ptr [rbp-0E0H], rcx       ; 24FA _ 48: 89. 8D, FFFFFF20
00002501        mov     rdx, rax                        ; 2501 _ 48: 89. C2
00002504        imul    rdx, qword ptr [rbp-98H]        ; 2504 _ 48: 0F AF. 95, FFFFFF68
0000250C        add     rdx, qword ptr [rbp-0F0H]       ; 250C _ 48: 03. 95, FFFFFF10
00002513        mov     rcx, r14                        ; 2513 _ 4C: 89. F1
00002516        test    ch, 20H                         ; 2516 _ F6. C5, 20
00002519        jz      ?_218                           ; 2519 _ 74, 05
?_217:
0000251B        mov     rdi, rsi                        ; 251B _ 48: 89. F7
0000251E        jmp     ?_222                           ; 251E _ EB, 4A

?_218:
00002520        test    rsi, rsi                        ; 2520 _ 48: 85. F6
00002523        jz      ?_217                           ; 2523 _ 74, F6
00002525        test    rax, rax                        ; 2525 _ 48: 85. C0
00002528        jle     ?_217                           ; 2528 _ 7E, F1
0000252A        cmp     rsi, r9                         ; 252A _ 4C: 39. CE
0000252D        jnc     ?_217                           ; 252D _ 73, EC
0000252F        inc     rsi                             ; 252F _ 48: FF. C6
00002532        mov     ecx, 1                          ; 2532 _ B9, 00000001
?_219:
00002537        mov     byte ptr [rsi-1H], 32           ; 2537 _ C6. 46, FF, 20
0000253B        cmp     qword ptr [rbp-78H], 0          ; 253B _ 48: 83. 7D, 88, 00
00002540        jz      ?_220                           ; 2540 _ 74, 03
00002542        mov     byte ptr [rsi], 0               ; 2542 _ C6. 06, 00
?_220:
00002545        mov     rbx, qword ptr [rbp-98H]        ; 2545 _ 48: 8B. 9D, FFFFFF68
0000254C        lea     rdi, ptr [rsi+rbx]              ; 254C _ 48: 8D. 3C 1E
00002550        cmp     rcx, rax                        ; 2550 _ 48: 39. C1
00002553        jge     ?_221                           ; 2553 _ 7D, 12
00002555        add     rsi, qword ptr [rbp-90H]        ; 2555 _ 48: 03. B5, FFFFFF70
0000255C        inc     rcx                             ; 255C _ 48: FF. C1
0000255F        cmp     rsi, r9                         ; 255F _ 4C: 39. CE
00002562        mov     rsi, rdi                        ; 2562 _ 48: 89. FE
00002565        jc      ?_219                           ; 2565 _ 72, D0
?_221:
00002567        dec     rdi                             ; 2567 _ 48: FF. CF
?_222:
0000256A        test    r10b, r10b                      ; 256A _ 45: 84. D2
0000256D        je      ?_231                           ; 256D _ 0F 84, 000000C7
00002573        mov     eax, dword ptr [rbp-0B4H]       ; 2573 _ 8B. 85, FFFFFF4C
00002579        test    al, al                          ; 2579 _ 84. C0
0000257B        jnz     ?_223                           ; 257B _ 75, 13
0000257D        mov     rsi, r14                        ; 257D _ 4C: 89. F6
00002580        and     rsi, 2000H                      ; 2580 _ 48: 81. E6, 00002000
00002587        mov     r10, qword ptr [rbp-98H]        ; 2587 _ 4C: 8B. 95, FFFFFF68
0000258E        jmp     ?_225                           ; 258E _ EB, 3B

?_223:
00002590        mov     r10, qword ptr [rbp-98H]        ; 2590 _ 4C: 8B. 95, FFFFFF68
00002597        add     rdx, r10                        ; 2597 _ 4C: 01. D2
0000259A        mov     rsi, r14                        ; 259A _ 4C: 89. F6
0000259D        and     rsi, 2000H                      ; 259D _ 48: 81. E6, 00002000
000025A4        test    rdi, rdi                        ; 25A4 _ 48: 85. FF
000025A7        jz      ?_225                           ; 25A7 _ 74, 22
000025A9        test    rsi, rsi                        ; 25A9 _ 48: 85. F6
000025AC        jnz     ?_225                           ; 25AC _ 75, 1D
000025AE        cmp     rdi, r9                         ; 25AE _ 4C: 39. CF
000025B1        jnc     ?_225                           ; 25B1 _ 73, 18
000025B3        mov     eax, dword ptr [rbp-0B4H]       ; 25B3 _ 8B. 85, FFFFFF4C
000025B9        mov     byte ptr [rdi], al              ; 25B9 _ 88. 07
000025BB        cmp     qword ptr [rbp-78H], 0          ; 25BB _ 48: 83. 7D, 88, 00
000025C0        jz      ?_224                           ; 25C0 _ 74, 04
000025C2        mov     byte ptr [rdi+1H], 0            ; 25C2 _ C6. 47, 01, 00
?_224:
000025C6        add     rdi, r10                        ; 25C6 _ 4C: 01. D7
000025C9        xor     esi, esi                        ; 25C9 _ 31. F6
?_225:
000025CB        mov     rax, qword ptr [rbp-0E0H]       ; 25CB _ 48: 8B. 85, FFFFFF20
000025D2        sub     rax, r15                        ; 25D2 _ 4C: 29. F8
000025D5        mov     rcx, rax                        ; 25D5 _ 48: 89. C1
000025D8        imul    rcx, r10                        ; 25D8 _ 49: 0F AF. CA
000025DC        add     rdx, rcx                        ; 25DC _ 48: 01. CA
000025DF        test    rsi, rsi                        ; 25DF _ 48: 85. F6
000025E2        jz      ?_227                           ; 25E2 _ 74, 0B
?_226:
000025E4        mov     rbx, r9                         ; 25E4 _ 4C: 89. CB
000025E7        mov     rsi, rdi                        ; 25E7 _ 48: 89. FE
000025EA        jmp     ?_242                           ; 25EA _ E9, 00000119

?_227:
000025EF        test    rdi, rdi                        ; 25EF _ 48: 85. FF
000025F2        jz      ?_226                           ; 25F2 _ 74, F0
000025F4        test    rax, rax                        ; 25F4 _ 48: 85. C0
000025F7        jle     ?_226                           ; 25F7 _ 7E, EB
000025F9        cmp     rdi, r9                         ; 25F9 _ 4C: 39. CF
000025FC        jnc     ?_226                           ; 25FC _ 73, E6
000025FE        inc     rdi                             ; 25FE _ 48: FF. C7
00002601        mov     ecx, 1                          ; 2601 _ B9, 00000001
?_228:
00002606        mov     byte ptr [rdi-1H], 48           ; 2606 _ C6. 47, FF, 30
0000260A        cmp     qword ptr [rbp-78H], 0          ; 260A _ 48: 83. 7D, 88, 00
0000260F        jz      ?_229                           ; 260F _ 74, 03
00002611        mov     byte ptr [rdi], 0               ; 2611 _ C6. 07, 00
?_229:
00002614        lea     rsi, ptr [rdi+r10]              ; 2614 _ 4A: 8D. 34 17
00002618        cmp     rcx, rax                        ; 2618 _ 48: 39. C1
0000261B        jge     ?_230                           ; 261B _ 7D, 12
0000261D        add     rdi, qword ptr [rbp-90H]        ; 261D _ 48: 03. BD, FFFFFF70
00002624        inc     rcx                             ; 2624 _ 48: FF. C1
00002627        cmp     rdi, r9                         ; 2627 _ 4C: 39. CF
0000262A        mov     rdi, rsi                        ; 262A _ 48: 89. F7
0000262D        jc      ?_228                           ; 262D _ 72, D7
?_230:
0000262F        mov     rbx, r9                         ; 262F _ 4C: 89. CB
00002632        dec     rsi                             ; 2632 _ 48: FF. CE
00002635        jmp     ?_242                           ; 2635 _ E9, 000000CE

?_231:
0000263A        mov     rax, qword ptr [rbp-0E0H]       ; 263A _ 48: 8B. 85, FFFFFF20
00002641        sub     rax, r15                        ; 2641 _ 4C: 29. F8
00002644        mov     r10, r14                        ; 2644 _ 4D: 89. F2
00002647        and     r10, 2000H                      ; 2647 _ 49: 81. E2, 00002000
0000264E        jz      ?_233                           ; 264E _ 74, 05
?_232:
00002650        mov     rsi, rdi                        ; 2650 _ 48: 89. FE
00002653        jmp     ?_237                           ; 2653 _ EB, 51

?_233:
00002655        test    rdi, rdi                        ; 2655 _ 48: 85. FF
00002658        jz      ?_232                           ; 2658 _ 74, F6
0000265A        test    rax, rax                        ; 265A _ 48: 85. C0
0000265D        jle     ?_232                           ; 265D _ 7E, F1
0000265F        cmp     rdi, r9                         ; 265F _ 4C: 39. CF
00002662        jnc     ?_232                           ; 2662 _ 73, EC
00002664        mov     rbx, r9                         ; 2664 _ 4C: 89. CB
00002667        inc     rdi                             ; 2667 _ 48: FF. C7
0000266A        mov     r9d, 1                          ; 266A _ 41: B9, 00000001
?_234:
00002670        mov     byte ptr [rdi-1H], 32           ; 2670 _ C6. 47, FF, 20
00002674        cmp     qword ptr [rbp-78H], 0          ; 2674 _ 48: 83. 7D, 88, 00
00002679        jz      ?_235                           ; 2679 _ 74, 03
0000267B        mov     byte ptr [rdi], 0               ; 267B _ C6. 07, 00
?_235:
0000267E        mov     rcx, qword ptr [rbp-98H]        ; 267E _ 48: 8B. 8D, FFFFFF68
00002685        lea     rsi, ptr [rdi+rcx]              ; 2685 _ 48: 8D. 34 0F
00002689        cmp     r9, rax                         ; 2689 _ 49: 39. C1
0000268C        jge     ?_236                           ; 268C _ 7D, 12
0000268E        add     rdi, qword ptr [rbp-90H]        ; 268E _ 48: 03. BD, FFFFFF70
00002695        inc     r9                              ; 2695 _ 49: FF. C1
00002698        cmp     rdi, rbx                        ; 2698 _ 48: 39. DF
0000269B        mov     rdi, rsi                        ; 269B _ 48: 89. F7
0000269E        jc      ?_234                           ; 269E _ 72, D0
?_236:
000026A0        dec     rsi                             ; 26A0 _ 48: FF. CE
000026A3        mov     r9, rbx                         ; 26A3 _ 49: 89. D9
?_237:
000026A6        mov     rcx, qword ptr [rbp-98H]        ; 26A6 _ 48: 8B. 8D, FFFFFF68
000026AD        imul    rax, rcx                        ; 26AD _ 48: 0F AF. C1
000026B1        add     rdx, rax                        ; 26B1 _ 48: 01. C2
000026B4        mov     eax, dword ptr [rbp-0B4H]       ; 26B4 _ 8B. 85, FFFFFF4C
000026BA        test    al, al                          ; 26BA _ 84. C0
000026BC        jnz     ?_238                           ; 26BC _ 75, 08
000026BE        mov     rbx, r9                         ; 26BE _ 4C: 89. CB
000026C1        mov     r10, rcx                        ; 26C1 _ 49: 89. CA
000026C4        jmp     ?_242                           ; 26C4 _ EB, 42

?_238:
000026C6        add     rdx, rcx                        ; 26C6 _ 48: 01. CA
000026C9        mov     rdi, rcx                        ; 26C9 _ 48: 89. CF
000026CC        test    rsi, rsi                        ; 26CC _ 48: 85. F6
000026CF        setne   al                              ; 26CF _ 0F 95. C0
000026D2        test    r10, r10                        ; 26D2 _ 4D: 85. D2
000026D5        sete    cl                              ; 26D5 _ 0F 94. C1
000026D8        cmp     rsi, r9                         ; 26D8 _ 4C: 39. CE
000026DB        jc      ?_240                           ; 26DB _ 72, 08
?_239:
000026DD        mov     rbx, r9                         ; 26DD _ 4C: 89. CB
000026E0        mov     r10, rdi                        ; 26E0 _ 49: 89. FA
000026E3        jmp     ?_242                           ; 26E3 _ EB, 23

?_240:
000026E5        and     cl, al                          ; 26E5 _ 20. C1
000026E7        cmp     cl, 1                           ; 26E7 _ 80. F9, 01
000026EA        jnz     ?_239                           ; 26EA _ 75, F1
000026EC        mov     rbx, r9                         ; 26EC _ 4C: 89. CB
000026EF        mov     eax, dword ptr [rbp-0B4H]       ; 26EF _ 8B. 85, FFFFFF4C
000026F5        mov     byte ptr [rsi], al              ; 26F5 _ 88. 06
000026F7        cmp     qword ptr [rbp-78H], 0          ; 26F7 _ 48: 83. 7D, 88, 00
000026FC        mov     r10, rdi                        ; 26FC _ 49: 89. FA
000026FF        jz      ?_241                           ; 26FF _ 74, 04
00002701        mov     byte ptr [rsi+1H], 0            ; 2701 _ C6. 46, 01, 00
?_241:
00002705        add     rsi, r10                        ; 2705 _ 4C: 01. D6
?_242:
00002708        mov     rdi, r14                        ; 2708 _ 4C: 89. F7
0000270B        and     rdi, 2000H                      ; 270B _ 48: 81. E7, 00002000
00002712        mov     eax, dword ptr [rbp-0B4H]       ; 2712 _ 8B. 85, FFFFFF4C
00002718        test    al, al                          ; 2718 _ 84. C0
0000271A        setne   al                              ; 271A _ 0F 95. C0
0000271D        movzx   eax, al                         ; 271D _ 0F B6. C0
00002720        jmp     ?_247                           ; 2720 _ E9, 000000C2

?_243:
00002725        test    rsi, rsi                        ; 2725 _ 48: 85. F6
00002728        setne   cl                              ; 2728 _ 0F 95. C1
0000272B        test    rdi, rdi                        ; 272B _ 48: 85. FF
0000272E        sete    bl                              ; 272E _ 0F 94. C3
00002731        cmp     rsi, r9                         ; 2731 _ 4C: 39. CE
00002734        jnc     ?_245                           ; 2734 _ 73, 27
00002736        and     bl, cl                          ; 2736 _ 20. CB
00002738        cmp     bl, 1                           ; 2738 _ 80. FB, 01
0000273B        jnz     ?_245                           ; 273B _ 75, 20
0000273D        movzx   ecx, byte ptr [r12+1H]          ; 273D _ 41: 0F B6. 4C 24, 01
00002743        mov     bl, byte ptr [r12]              ; 2743 _ 41: 8A. 1C 24
00002747        mov     byte ptr [rsi], bl              ; 2747 _ 88. 1E
00002749        cmp     qword ptr [rbp-78H], 0          ; 2749 _ 48: 83. 7D, 88, 00
0000274E        jz      ?_244                           ; 274E _ 74, 0A
00002750        shl     rcx, 8                          ; 2750 _ 48: C1. E1, 08
00002754        and     ecx, r11d                       ; 2754 _ 44: 21. D9
00002757        mov     byte ptr [rsi+1H], ch           ; 2757 _ 88. 6E, 01
?_244:
0000275A        add     rsi, r10                        ; 275A _ 4C: 01. D6
?_245:
0000275D        add     rdx, r10                        ; 275D _ 4C: 01. D2
00002760        add     r12, r8                         ; 2760 _ 4D: 01. C4
00002763        inc     rax                             ; 2763 _ 48: FF. C0
00002766        mov     ecx, dword ptr [rbp-7CH]        ; 2766 _ 8B. 4D, 84
00002769        test    cl, cl                          ; 2769 _ 84. C9
0000276B        jz      ?_248                           ; 276B _ 74, 7D
0000276D        mov     rbx, r9                         ; 276D _ 4C: 89. CB
00002770        mov     rcx, qword ptr [rbp-88H]        ; 2770 _ 48: 8B. 8D, FFFFFF78
00002777        inc     rcx                             ; 2777 _ 48: FF. C1
0000277A        mov     qword ptr [rbp-88H], rcx        ; 277A _ 48: 89. 8D, FFFFFF78
00002781        cmp     rcx, 3                          ; 2781 _ 48: 83. F9, 03
00002785        jnz     ?_247                           ; 2785 _ 75, 60
00002787        inc     rax                             ; 2787 _ 48: FF. C0
0000278A        mov     qword ptr [rbp-88H], 0          ; 278A _ 48: C7. 85, FFFFFF78, 00000000
00002795        cmp     rax, r15                        ; 2795 _ 4C: 39. F8
00002798        jnc     ?_247                           ; 2798 _ 73, 4D
0000279A        test    rsi, rsi                        ; 279A _ 48: 85. F6
0000279D        mov     rcx, qword ptr [rbp-90H]        ; 279D _ 48: 8B. 8D, FFFFFF70
000027A4        lea     rdx, ptr [rcx+rdx+1H]           ; 27A4 _ 48: 8D. 54 11, 01
000027A9        setne   r9b                             ; 27A9 _ 41: 0F 95. C1
000027AD        test    rdi, rdi                        ; 27AD _ 48: 85. FF
000027B0        sete    cl                              ; 27B0 _ 0F 94. C1
000027B3        mov     qword ptr [rbp-88H], 0          ; 27B3 _ 48: C7. 85, FFFFFF78, 00000000
000027BE        cmp     rsi, rbx                        ; 27BE _ 48: 39. DE
000027C1        jnc     ?_247                           ; 27C1 _ 73, 24
000027C3        and     cl, r9b                         ; 27C3 _ 44: 20. C9
000027C6        cmp     cl, 1                           ; 27C6 _ 80. F9, 01
000027C9        jnz     ?_247                           ; 27C9 _ 75, 1C
000027CB        mov     byte ptr [rsi], 44              ; 27CB _ C6. 06, 2C
000027CE        cmp     qword ptr [rbp-78H], 0          ; 27CE _ 48: 83. 7D, 88, 00
000027D3        jz      ?_246                           ; 27D3 _ 74, 04
000027D5        mov     byte ptr [rsi+1H], 0            ; 27D5 _ C6. 46, 01, 00
?_246:
000027D9        add     rsi, r10                        ; 27D9 _ 4C: 01. D6
000027DC        mov     qword ptr [rbp-88H], 0          ; 27DC _ 48: C7. 85, FFFFFF78, 00000000
?_247:
000027E7        mov     r9, rbx                         ; 27E7 _ 49: 89. D9
?_248:
000027EA        cmp     rax, r15                        ; 27EA _ 4C: 39. F8
000027ED        jc      ?_243                           ; 27ED _ 0F 82, FFFFFF32
000027F3        cmp     qword ptr [rbp-100H], 513       ; 27F3 _ 48: 81. BD, FFFFFF00, 00000201
000027FE        jz      ?_249                           ; 27FE _ 74, 05
00002800        mov     rax, rdx                        ; 2800 _ 48: 89. D0
00002803        jmp     ?_250                           ; 2803 _ EB, 2B

?_249:
00002805        mov     rax, qword ptr [rbp-0A0H]       ; 2805 _ 48: 8B. 85, FFFFFF60
0000280C        cmp     rax, r15                        ; 280C _ 4C: 39. F8
0000280F        cmova   r15, rax                        ; 280F _ 4C: 0F 47. F8
00002813        mov     rcx, qword ptr [rbp-0D0H]       ; 2813 _ 48: 8B. 8D, FFFFFF30
0000281A        mov     rax, rcx                        ; 281A _ 48: 89. C8
0000281D        sub     rax, r15                        ; 281D _ 4C: 29. F8
00002820        imul    rax, r10                        ; 2820 _ 49: 0F AF. C2
00002824        add     rax, rdx                        ; 2824 _ 48: 01. D0
00002827        test    rdi, rdi                        ; 2827 _ 48: 85. FF
0000282A        je      ?_137                           ; 282A _ 0F 84, FFFFF1C8
?_250:
00002830        mov     qword ptr [rbp-0C0H], rsi       ; 2830 _ 48: 89. B5, FFFFFF40
00002837        jmp     ?_141                           ; 2837 _ E9, FFFFF21C

?_251:
0000283C        mov     rcx, r14                        ; 283C _ 4C: 89. F1
0000283F        test    ch, 20H                         ; 283F _ F6. C5, 20
00002842        jz      ?_252                           ; 2842 _ 74, 0E
00002844        xor     edx, edx                        ; 2844 _ 31. D2
00002846        div     qword ptr [rbp-98H]             ; 2846 _ 48: F7. B5, FFFFFF68
0000284D        jmp     ?_257                           ; 284D _ E9, 000000C8

?_252:
00002852        mov     rsi, r9                         ; 2852 _ 4C: 89. CE
00002855        call    _DebugAssertEnabled             ; 2855 _ E8, FFFFD9F2
0000285A        test    al, al                          ; 285A _ 84. C0
0000285C        mov     rdi, qword ptr [rbp-0C0H]       ; 285C _ 48: 8B. BD, FFFFFF40
00002863        jz      ?_253                           ; 2863 _ 74, 1D
00002865        test    rdi, rdi                        ; 2865 _ 48: 85. FF
00002868        jnz     ?_253                           ; 2868 _ 75, 18
0000286A        lea     rcx, ptr [?_608]                ; 286A _ 48: 8D. 0D, 000045EF(rel)
00002871        lea     r8, ptr [?_563]                 ; 2871 _ 4C: 8D. 05, 00003A8A(rel)
00002878        mov     edx, 973                        ; 2878 _ BA, 000003CD
0000287D        call    _DebugAssert                    ; 287D _ E8, FFFFD9C9
?_253:
00002882        add     rsi, qword ptr [rbp-98H]        ; 2882 _ 48: 03. B5, FFFFFF68
00002889        cmp     rdi, rsi                        ; 2889 _ 48: 39. F7
0000288C        mov     rsi, qword ptr [rbp-108H]       ; 288C _ 48: 8B. B5, FFFFFEF8
00002893        jnc     ?_254                           ; 2893 _ 73, 0E
00002895        mov     byte ptr [rdi], 0               ; 2895 _ C6. 07, 00
00002898        cmp     qword ptr [rbp-78H], 0          ; 2898 _ 48: 83. 7D, 88, 00
0000289D        jz      ?_254                           ; 289D _ 74, 04
0000289F        mov     byte ptr [rdi+1H], 0            ; 289F _ C6. 47, 01, 00
?_254:
000028A3        call    _DebugAssertEnabled             ; 28A3 _ E8, FFFFD9A4
000028A8        test    al, al                          ; 28A8 _ 84. C0
000028AA        jz      ?_255                           ; 28AA _ 74, 2B
000028AC        test    r14b, 40H                       ; 28AC _ 41: F6. C6, 40
000028B0        jz      ?_255                           ; 28B0 _ 74, 25
000028B2        mov     rcx, rsi                        ; 28B2 _ 48: 89. F1
000028B5        call    _StrSize                        ; 28B5 _ E8, FFFFE082
000028BA        test    rax, rax                        ; 28BA _ 48: 85. C0
000028BD        jnz     ?_255                           ; 28BD _ 75, 18
000028BF        lea     rcx, ptr [?_608]                ; 28BF _ 48: 8D. 0D, 0000459A(rel)
000028C6        lea     r8, ptr [?_619]                 ; 28C6 _ 4C: 8D. 05, 000046AC(rel)
000028CD        mov     edx, 982                        ; 28CD _ BA, 000003D6
000028D2        call    _DebugAssert                    ; 28D2 _ E8, FFFFD974
?_255:
000028D7        call    _DebugAssertEnabled             ; 28D7 _ E8, FFFFD970
000028DC        test    al, al                          ; 28DC _ 84. C0
000028DE        jz      ?_256                           ; 28DE _ 74, 2B
000028E0        test    r14b, 40H                       ; 28E0 _ 41: F6. C6, 40
000028E4        jnz     ?_256                           ; 28E4 _ 75, 25
000028E6        mov     rcx, rsi                        ; 28E6 _ 48: 89. F1
000028E9        call    _AsciiStrSize                   ; 28E9 _ E8, FFFFE066
000028EE        test    rax, rax                        ; 28EE _ 48: 85. C0
000028F1        jnz     ?_256                           ; 28F1 _ 75, 18
000028F3        lea     rcx, ptr [?_608]                ; 28F3 _ 48: 8D. 0D, 00004566(rel)
000028FA        lea     r8, ptr [?_620]                 ; 28FA _ 4C: 8D. 05, 000046C4(rel)
00002901        mov     edx, 987                        ; 2901 _ BA, 000003DB
00002906        call    _DebugAssert                    ; 2906 _ E8, FFFFD940
?_256:
0000290B        sub     rdi, rsi                        ; 290B _ 48: 29. F7
0000290E        mov     rax, rdi                        ; 290E _ 48: 89. F8
00002911        cqo                                     ; 2911 _ 48: 99
00002913        idiv    qword ptr [rbp-98H]             ; 2913 _ 48: F7. BD, FFFFFF68
?_257:
0000291A        add     rsp, 376                        ; 291A _ 48: 81. C4, 00000178
00002921        pop     rbx                             ; 2921 _ 5B
00002922        pop     rdi                             ; 2922 _ 5F
00002923        pop     rsi                             ; 2923 _ 5E
00002924        pop     r12                             ; 2924 _ 41: 5C
00002926        pop     r13                             ; 2926 _ 41: 5D
00002928        pop     r14                             ; 2928 _ 41: 5E
0000292A        pop     r15                             ; 292A _ 41: 5F
0000292C        pop     rbp                             ; 292C _ 5D
0000292D        ret                                     ; 292D _ C3
_BasePrintLibSPrintMarker ENDP

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8

?_258   label byte
        db 09H, 0F3H, 0FFH, 0FFH, 0A2H, 0F3H, 0FFH, 0FFH; 2930 _ ........
        db 0A2H, 0F3H, 0FFH, 0FFH, 0A2H, 0F3H, 0FFH, 0FFH; 2938 _ ........
        db 0A2H, 0F3H, 0FFH, 0FFH, 0A2H, 0F3H, 0FFH, 0FFH; 2940 _ ........
        db 0A2H, 0F3H, 0FFH, 0FFH, 0A2H, 0F3H, 0FFH, 0FFH; 2948 _ ........
        db 0A2H, 0F3H, 0FFH, 0FFH, 0A2H, 0F3H, 0FFH, 0FFH; 2950 _ ........
        db 33H, 0F3H, 0FFH, 0FFH, 0FDH, 0F2H, 0FFH, 0FFH; 2958 _ 3.......
        db 15H, 0F3H, 0FFH, 0FFH, 0F1H, 0F2H, 0FFH, 0FFH; 2960 _ ........
        db 0E2H, 0F2H, 0FFH, 0FFH, 0A2H, 0F3H, 0FFH, 0FFH; 2968 _ ........
        db 86H, 0F3H, 0FFH, 0FFH, 0FCH, 0F1H, 0FFH, 0FFH; 2970 _ ........
        db 0FCH, 0F1H, 0FFH, 0FFH, 0FCH, 0F1H, 0FFH, 0FFH; 2978 _ ........
        db 0FCH, 0F1H, 0FFH, 0FFH, 0FCH, 0F1H, 0FFH, 0FFH; 2980 _ ........
        db 0FCH, 0F1H, 0FFH, 0FFH, 0FCH, 0F1H, 0FFH, 0FFH; 2988 _ ........
        db 0FCH, 0F1H, 0FFH, 0FFH, 0FCH, 0F1H, 0FFH, 0FFH; 2990 _ ........

?_259   label dword                                     ; switch/case jump table
        dd ?_163-?_259                                  ; 2998 _ FFFFF415 dd ?_149-?_259; 299C _ FFFFF24E dd ?_197-?_259; 29A0 _ FFFFF8A9 dd ?_181-?_259; 29A4 _ FFFFF623 dd ?_193-?_259; 29A8 _ FFFFF80B dd ?_166-?_259; 29AC _ FFFFF428 dd ?_149-?_259; 29B0 _ FFFFF24E dd ?_149-?_259; 29B4 _ FFFFF24E dd ?_165-?_259; 29B8 _ FFFFF421 
?_260   label dword                                     ; switch/case jump table
        dd ?_182-?_260                                  ; 29BC _ FFFFF606 dd ?_149-?_260; 29C0 _ FFFFF22A dd ?_185-?_260; 29C4 _ FFFFF66A dd ?_167-?_260; 29C8 _ FFFFF418 dd ?_149-?_260; 29CC _ FFFFF22A dd ?_149-?_260; 29D0 _ FFFFF22A dd ?_188-?_260; 29D4 _ FFFFF6C1 

_BasePrintLibSPrint LABEL NEAR
000029D8        push    rbp                             ; 29D8 _ 55
000029D9        mov     rbp, rsp                        ; 29D9 _ 48: 89. E5
000029DC        sub     rsp, 80                         ; 29DC _ 48: 83. EC, 50
000029E0        lea     rax, ptr [rbp+30H]              ; 29E0 _ 48: 8D. 45, 30
000029E4        mov     qword ptr [rbp-20H], rax        ; 29E4 _ 48: 89. 45, E0
000029E8        lea     rax, ptr [rbp-20H]              ; 29E8 _ 48: 8D. 45, E0
000029EC        mov     qword ptr [rsp+20H], rax        ; 29EC _ 48: 89. 44 24, 20
000029F1        mov     qword ptr [rsp+28H], 0          ; 29F1 _ 48: C7. 44 24, 28, 00000000
000029FA        call    _BasePrintLibSPrintMarker       ; 29FA _ E8, FFFFEE1D
000029FF        add     rsp, 80                         ; 29FF _ 48: 83. C4, 50
00002A03        pop     rbp                             ; 2A03 _ 5D
00002A04        ret                                     ; 2A04 _ C3

_UnicodeVSPrint PROC
00002A05        push    rbp                             ; 2A05 _ 55
00002A06        mov     rbp, rsp                        ; 2A06 _ 48: 89. E5
00002A09        push    r14                             ; 2A09 _ 41: 56
00002A0B        push    rsi                             ; 2A0B _ 56
00002A0C        push    rdi                             ; 2A0C _ 57
00002A0D        push    rbx                             ; 2A0D _ 53
00002A0E        sub     rsp, 48                         ; 2A0E _ 48: 83. EC, 30
00002A12        mov     r14, r9                         ; 2A12 _ 4D: 89. CE
00002A15        mov     rsi, r8                         ; 2A15 _ 4C: 89. C6
00002A18        mov     rdi, rdx                        ; 2A18 _ 48: 89. D7
00002A1B        mov     rbx, rcx                        ; 2A1B _ 48: 89. CB
00002A1E        call    _DebugAssertEnabled             ; 2A1E _ E8, FFFFD829
00002A23        test    al, al                          ; 2A23 _ 84. C0
00002A25        jz      ?_261                           ; 2A25 _ 74, 1D
00002A27        test    bl, 1H                          ; 2A27 _ F6. C3, 01
00002A2A        jz      ?_261                           ; 2A2A _ 74, 18
00002A2C        lea     rcx, ptr [?_621]                ; 2A2C _ 48: 8D. 0D, 000045D8(rel)
00002A33        lea     r8, ptr [?_622]                 ; 2A33 _ 4C: 8D. 05, 0000462B(rel)
00002A3A        mov     edx, 71                         ; 2A3A _ BA, 00000047
00002A3F        call    _DebugAssert                    ; 2A3F _ E8, FFFFD807
?_261:
00002A44        call    _DebugAssertEnabled             ; 2A44 _ E8, FFFFD803
00002A49        test    al, al                          ; 2A49 _ 84. C0
00002A4B        jz      ?_262                           ; 2A4B _ 74, 1E
00002A4D        test    sil, 1H                         ; 2A4D _ 40: F6. C6, 01
00002A51        jz      ?_262                           ; 2A51 _ 74, 18
00002A53        lea     rcx, ptr [?_621]                ; 2A53 _ 48: 8D. 0D, 000045B1(rel)
00002A5A        lea     r8, ptr [?_623]                 ; 2A5A _ 4C: 8D. 05, 0000462C(rel)
00002A61        mov     edx, 72                         ; 2A61 _ BA, 00000048
00002A66        call    _DebugAssert                    ; 2A66 _ E8, FFFFD7E0
?_262:
00002A6B        mov     qword ptr [rsp+20H], r14        ; 2A6B _ 4C: 89. 74 24, 20
00002A70        mov     qword ptr [rsp+28H], 0          ; 2A70 _ 48: C7. 44 24, 28, 00000000
00002A79        shr     rdi, 1                          ; 2A79 _ 48: D1. EF
00002A7C        mov     rcx, rbx                        ; 2A7C _ 48: 89. D9
00002A7F        mov     rdx, rdi                        ; 2A7F _ 48: 89. FA
00002A82        mov     r8d, 320                        ; 2A82 _ 41: B8, 00000140
00002A88        mov     r9, rsi                         ; 2A88 _ 49: 89. F1
00002A8B        call    _BasePrintLibSPrintMarker       ; 2A8B _ E8, FFFFED8C
00002A90        add     rsp, 48                         ; 2A90 _ 48: 83. C4, 30
00002A94        pop     rbx                             ; 2A94 _ 5B
00002A95        pop     rdi                             ; 2A95 _ 5F
00002A96        pop     rsi                             ; 2A96 _ 5E
00002A97        pop     r14                             ; 2A97 _ 41: 5E
00002A99        pop     rbp                             ; 2A99 _ 5D
00002A9A        ret                                     ; 2A9A _ C3
_UnicodeVSPrint ENDP

_IsDevicePathEnd PROC
00002A9B        push    rbp                             ; 2A9B _ 55
00002A9C        mov     rbp, rsp                        ; 2A9C _ 48: 89. E5
00002A9F        push    rsi                             ; 2A9F _ 56
00002AA0        sub     rsp, 40                         ; 2AA0 _ 48: 83. EC, 28
00002AA4        mov     rsi, rcx                        ; 2AA4 _ 48: 89. CE
00002AA7        call    _DebugAssertEnabled             ; 2AA7 _ E8, FFFFD7A0
00002AAC        test    al, al                          ; 2AAC _ 84. C0
00002AAE        jz      ?_263                           ; 2AAE _ 74, 1D
00002AB0        test    rsi, rsi                        ; 2AB0 _ 48: 85. F6
00002AB3        jnz     ?_263                           ; 2AB3 _ 75, 18
00002AB5        lea     rcx, ptr [?_624]                ; 2AB5 _ 48: 8D. 0D, 000045F8(rel)
00002ABC        lea     r8, ptr [?_580]                 ; 2ABC _ 4C: 8D. 05, 00003C30(rel)
00002AC3        mov     edx, 237                        ; 2AC3 _ BA, 000000ED
00002AC8        call    _DebugAssert                    ; 2AC8 _ E8, FFFFD77E
?_263:
00002ACD        mov     rcx, rsi                        ; 2ACD _ 48: 89. F1
00002AD0        call    _IsDevicePathEndType            ; 2AD0 _ E8, 00000122
00002AD5        xor     cl, cl                          ; 2AD5 _ 30. C9
00002AD7        test    al, al                          ; 2AD7 _ 84. C0
00002AD9        jz      ?_264                           ; 2AD9 _ 74, 0D
00002ADB        mov     rcx, rsi                        ; 2ADB _ 48: 89. F1
00002ADE        call    _DevicePathSubType              ; 2ADE _ E8, 000000D7
00002AE3        cmp     al, -1                          ; 2AE3 _ 3C, FF
00002AE5        sete    cl                              ; 2AE5 _ 0F 94. C1
?_264:
00002AE8        movzx   eax, cl                         ; 2AE8 _ 0F B6. C1
00002AEB        add     rsp, 40                         ; 2AEB _ 48: 83. C4, 28
00002AEF        pop     rsi                             ; 2AEF _ 5E
00002AF0        pop     rbp                             ; 2AF0 _ 5D
00002AF1        ret                                     ; 2AF1 _ C3
_IsDevicePathEnd ENDP

_DevicePathNodeLength PROC
00002AF2        push    rbp                             ; 2AF2 _ 55
00002AF3        mov     rbp, rsp                        ; 2AF3 _ 48: 89. E5
00002AF6        push    rsi                             ; 2AF6 _ 56
00002AF7        sub     rsp, 40                         ; 2AF7 _ 48: 83. EC, 28
00002AFB        mov     rsi, rcx                        ; 2AFB _ 48: 89. CE
00002AFE        call    _DebugAssertEnabled             ; 2AFE _ E8, FFFFD749
00002B03        test    al, al                          ; 2B03 _ 84. C0
00002B05        jz      ?_265                           ; 2B05 _ 74, 1D
00002B07        test    rsi, rsi                        ; 2B07 _ 48: 85. F6
00002B0A        jnz     ?_265                           ; 2B0A _ 75, 18
00002B0C        lea     rcx, ptr [?_624]                ; 2B0C _ 48: 8D. 0D, 000045A1(rel)
00002B13        lea     r8, ptr [?_580]                 ; 2B13 _ 4C: 8D. 05, 00003BD9(rel)
00002B1A        mov     edx, 156                        ; 2B1A _ BA, 0000009C
00002B1F        call    _DebugAssert                    ; 2B1F _ E8, FFFFD727
?_265:
00002B24        add     rsi, 2                          ; 2B24 _ 48: 83. C6, 02
00002B28        mov     rcx, rsi                        ; 2B28 _ 48: 89. F1
00002B2B        call    _ReadUnaligned16                ; 2B2B _ E8, FFFFE4F8
00002B30        movzx   eax, ax                         ; 2B30 _ 0F B7. C0
00002B33        add     rsp, 40                         ; 2B33 _ 48: 83. C4, 28
00002B37        pop     rsi                             ; 2B37 _ 5E
00002B38        pop     rbp                             ; 2B38 _ 5D
00002B39        ret                                     ; 2B39 _ C3
_DevicePathNodeLength ENDP

_NextDevicePathNode PROC
00002B3A        push    rbp                             ; 2B3A _ 55
00002B3B        mov     rbp, rsp                        ; 2B3B _ 48: 89. E5
00002B3E        push    rsi                             ; 2B3E _ 56
00002B3F        sub     rsp, 40                         ; 2B3F _ 48: 83. EC, 28
00002B43        mov     rsi, rcx                        ; 2B43 _ 48: 89. CE
00002B46        call    _DebugAssertEnabled             ; 2B46 _ E8, FFFFD701
00002B4B        test    al, al                          ; 2B4B _ 84. C0
00002B4D        jz      ?_266                           ; 2B4D _ 74, 1D
00002B4F        test    rsi, rsi                        ; 2B4F _ 48: 85. F6
00002B52        jnz     ?_266                           ; 2B52 _ 75, 18
00002B54        lea     rcx, ptr [?_624]                ; 2B54 _ 48: 8D. 0D, 00004559(rel)
00002B5B        lea     r8, ptr [?_580]                 ; 2B5B _ 4C: 8D. 05, 00003B91(rel)
00002B62        mov     edx, 180                        ; 2B62 _ BA, 000000B4
00002B67        call    _DebugAssert                    ; 2B67 _ E8, FFFFD6DF
?_266:
00002B6C        mov     rcx, rsi                        ; 2B6C _ 48: 89. F1
00002B6F        call    _DevicePathNodeLength           ; 2B6F _ E8, FFFFFF7E
00002B74        add     rax, rsi                        ; 2B74 _ 48: 01. F0
00002B77        add     rsp, 40                         ; 2B77 _ 48: 83. C4, 28
00002B7B        pop     rsi                             ; 2B7B _ 5E
00002B7C        pop     rbp                             ; 2B7C _ 5D
00002B7D        ret                                     ; 2B7D _ C3
_NextDevicePathNode ENDP

_DevicePathType PROC
00002B7E        push    rbp                             ; 2B7E _ 55
00002B7F        mov     rbp, rsp                        ; 2B7F _ 48: 89. E5
00002B82        push    rsi                             ; 2B82 _ 56
00002B83        sub     rsp, 40                         ; 2B83 _ 48: 83. EC, 28
00002B87        mov     rsi, rcx                        ; 2B87 _ 48: 89. CE
00002B8A        call    _DebugAssertEnabled             ; 2B8A _ E8, FFFFD6BD
00002B8F        test    al, al                          ; 2B8F _ 84. C0
00002B91        jz      ?_267                           ; 2B91 _ 74, 1D
00002B93        test    rsi, rsi                        ; 2B93 _ 48: 85. F6
00002B96        jnz     ?_267                           ; 2B96 _ 75, 18
00002B98        lea     rcx, ptr [?_624]                ; 2B98 _ 48: 8D. 0D, 00004515(rel)
00002B9F        lea     r8, ptr [?_580]                 ; 2B9F _ 4C: 8D. 05, 00003B4D(rel)
00002BA6        mov     edx, 109                        ; 2BA6 _ BA, 0000006D
00002BAB        call    _DebugAssert                    ; 2BAB _ E8, FFFFD69B
?_267:
00002BB0        movzx   eax, byte ptr [rsi]             ; 2BB0 _ 0F B6. 06
00002BB3        add     rsp, 40                         ; 2BB3 _ 48: 83. C4, 28
00002BB7        pop     rsi                             ; 2BB7 _ 5E
00002BB8        pop     rbp                             ; 2BB8 _ 5D
00002BB9        ret                                     ; 2BB9 _ C3
_DevicePathType ENDP

_DevicePathSubType PROC
00002BBA        push    rbp                             ; 2BBA _ 55
00002BBB        mov     rbp, rsp                        ; 2BBB _ 48: 89. E5
00002BBE        push    rsi                             ; 2BBE _ 56
00002BBF        sub     rsp, 40                         ; 2BBF _ 48: 83. EC, 28
00002BC3        mov     rsi, rcx                        ; 2BC3 _ 48: 89. CE
00002BC6        call    _DebugAssertEnabled             ; 2BC6 _ E8, FFFFD681
00002BCB        test    al, al                          ; 2BCB _ 84. C0
00002BCD        jz      ?_268                           ; 2BCD _ 74, 1D
00002BCF        test    rsi, rsi                        ; 2BCF _ 48: 85. F6
00002BD2        jnz     ?_268                           ; 2BD2 _ 75, 18
00002BD4        lea     rcx, ptr [?_624]                ; 2BD4 _ 48: 8D. 0D, 000044D9(rel)
00002BDB        lea     r8, ptr [?_580]                 ; 2BDB _ 4C: 8D. 05, 00003B11(rel)
00002BE2        mov     edx, 131                        ; 2BE2 _ BA, 00000083
00002BE7        call    _DebugAssert                    ; 2BE7 _ E8, FFFFD65F
?_268:
00002BEC        movzx   eax, byte ptr [rsi+1H]          ; 2BEC _ 0F B6. 46, 01
00002BF0        add     rsp, 40                         ; 2BF0 _ 48: 83. C4, 28
00002BF4        pop     rsi                             ; 2BF4 _ 5E
00002BF5        pop     rbp                             ; 2BF5 _ 5D
00002BF6        ret                                     ; 2BF6 _ C3
_DevicePathSubType ENDP

_IsDevicePathEndType PROC
00002BF7        push    rbp                             ; 2BF7 _ 55
00002BF8        mov     rbp, rsp                        ; 2BF8 _ 48: 89. E5
00002BFB        push    rsi                             ; 2BFB _ 56
00002BFC        sub     rsp, 40                         ; 2BFC _ 48: 83. EC, 28
00002C00        mov     rsi, rcx                        ; 2C00 _ 48: 89. CE
00002C03        call    _DebugAssertEnabled             ; 2C03 _ E8, FFFFD644
00002C08        test    al, al                          ; 2C08 _ 84. C0
00002C0A        jz      ?_269                           ; 2C0A _ 74, 1D
00002C0C        test    rsi, rsi                        ; 2C0C _ 48: 85. F6
00002C0F        jnz     ?_269                           ; 2C0F _ 75, 18
00002C11        lea     rcx, ptr [?_624]                ; 2C11 _ 48: 8D. 0D, 0000449C(rel)
00002C18        lea     r8, ptr [?_580]                 ; 2C18 _ 4C: 8D. 05, 00003AD4(rel)
00002C1F        mov     edx, 210                        ; 2C1F _ BA, 000000D2
00002C24        call    _DebugAssert                    ; 2C24 _ E8, FFFFD622
?_269:
00002C29        mov     rcx, rsi                        ; 2C29 _ 48: 89. F1
00002C2C        call    _DevicePathType                 ; 2C2C _ E8, FFFFFF4D
00002C31        cmp     al, 127                         ; 2C31 _ 3C, 7F
00002C33        sete    al                              ; 2C33 _ 0F 94. C0
00002C36        movzx   eax, al                         ; 2C36 _ 0F B6. C0
00002C39        add     rsp, 40                         ; 2C39 _ 48: 83. C4, 28
00002C3D        pop     rsi                             ; 2C3D _ 5E
00002C3E        pop     rbp                             ; 2C3E _ 5D
00002C3F        ret                                     ; 2C3F _ C3
_IsDevicePathEndType ENDP

_UefiRuntimeServicesTableLibConstructor PROC
00002C40        push    rbp                             ; 2C40 _ 55
00002C41        mov     rbp, rsp                        ; 2C41 _ 48: 89. E5
00002C44        sub     rsp, 32                         ; 2C44 _ 48: 83. EC, 20
00002C48        mov     rax, qword ptr [rdx+58H]        ; 2C48 _ 48: 8B. 42, 58
00002C4C        mov     qword ptr [_gRT], rax           ; 2C4C _ 48: 89. 05, 000064FD(rel)
00002C53        call    _DebugAssertEnabled             ; 2C53 _ E8, FFFFD5F4
00002C58        test    al, al                          ; 2C58 _ 84. C0
00002C5A        jz      ?_270                           ; 2C5A _ 74, 24
00002C5C        mov     rax, qword ptr [_gRT]           ; 2C5C _ 48: 8B. 05, 000064ED(rel)
00002C63        test    rax, rax                        ; 2C63 _ 48: 85. C0
00002C66        jnz     ?_270                           ; 2C66 _ 75, 18
00002C68        lea     rcx, ptr [?_625]                ; 2C68 _ 48: 8D. 0D, 000044AF(rel)
00002C6F        lea     r8, ptr [?_626]                 ; 2C6F _ 4C: 8D. 05, 00004524(rel)
00002C76        mov     edx, 47                         ; 2C76 _ BA, 0000002F
00002C7B        call    _DebugAssert                    ; 2C7B _ E8, FFFFD5CB
?_270:
00002C80        xor     eax, eax                        ; 2C80 _ 31. C0
00002C82        add     rsp, 32                         ; 2C82 _ 48: 83. C4, 20
00002C86        pop     rbp                             ; 2C86 _ 5D
00002C87        ret                                     ; 2C87 _ C3
_UefiRuntimeServicesTableLibConstructor ENDP

_UefiHiiServicesLibConstructor PROC
00002C88        push    rbp                             ; 2C88 _ 55
00002C89        mov     rbp, rsp                        ; 2C89 _ 48: 89. E5
00002C8C        push    rsi                             ; 2C8C _ 56
00002C8D        sub     rsp, 40                         ; 2C8D _ 48: 83. EC, 28
00002C91        mov     rax, qword ptr [_gBS]           ; 2C91 _ 48: 8B. 05, 000064B0(rel)
00002C98        lea     rcx, ptr [_gEfiHiiStringProtocolGuid]; 2C98 _ 48: 8D. 0D, 00006259(rel)
00002C9F        lea     r8, ptr [_gHiiString]           ; 2C9F _ 4C: 8D. 05, 000064BA(rel)
00002CA6        xor     edx, edx                        ; 2CA6 _ 31. D2
00002CA8        call    qword ptr [rax+140H]            ; 2CA8 _ FF. 90, 00000140
00002CAE        mov     rsi, rax                        ; 2CAE _ 48: 89. C6
00002CB1        call    _DebugAssertEnabled             ; 2CB1 _ E8, FFFFD596
00002CB6        test    al, al                          ; 2CB6 _ 84. C0
00002CB8        jz      ?_272                           ; 2CB8 _ 74, 48
00002CBA        test    rsi, rsi                        ; 2CBA _ 48: 85. F6
00002CBD        jns     ?_272                           ; 2CBD _ 79, 43
00002CBF        call    _DebugPrintEnabled              ; 2CBF _ E8, FFFFD58B
00002CC4        test    al, al                          ; 2CC4 _ 84. C0
00002CC6        jz      ?_271                           ; 2CC6 _ 74, 22
00002CC8        mov     ecx, 2147483648                 ; 2CC8 _ B9, 80000000
00002CCD        call    _DebugPrintLevelEnabled         ; 2CCD _ E8, FFFFD580
00002CD2        test    al, al                          ; 2CD2 _ 84. C0
00002CD4        jz      ?_271                           ; 2CD4 _ 74, 14
00002CD6        lea     rdx, ptr [?_561]                ; 2CD6 _ 48: 8D. 15, 000035F0(rel)
00002CDD        mov     ecx, 2147483648                 ; 2CDD _ B9, 80000000
00002CE2        mov     r8, rsi                         ; 2CE2 _ 49: 89. F0
00002CE5        call    _DebugPrint                     ; 2CE5 _ E8, FFFFD556
?_271:
00002CEA        lea     rcx, ptr [?_627]                ; 2CEA _ 48: 8D. 0D, 000044BD(rel)
00002CF1        lea     r8, ptr [?_562]                 ; 2CF1 _ 4C: 8D. 05, 000035F6(rel)
00002CF8        mov     edx, 88                         ; 2CF8 _ BA, 00000058
00002CFD        call    _DebugAssert                    ; 2CFD _ E8, FFFFD549
?_272:
00002D02        mov     rax, qword ptr [_gBS]           ; 2D02 _ 48: 8B. 05, 0000643F(rel)
00002D09        lea     rcx, ptr [_gEfiHiiDatabaseProtocolGuid]; 2D09 _ 48: 8D. 0D, 00006208(rel)
00002D10        lea     r8, ptr [_gHiiDatabase]         ; 2D10 _ 4C: 8D. 05, 00006459(rel)
00002D17        xor     edx, edx                        ; 2D17 _ 31. D2
00002D19        call    qword ptr [rax+140H]            ; 2D19 _ FF. 90, 00000140
00002D1F        mov     rsi, rax                        ; 2D1F _ 48: 89. C6
00002D22        call    _DebugAssertEnabled             ; 2D22 _ E8, FFFFD525
00002D27        test    al, al                          ; 2D27 _ 84. C0
00002D29        jz      ?_274                           ; 2D29 _ 74, 48
00002D2B        test    rsi, rsi                        ; 2D2B _ 48: 85. F6
00002D2E        jns     ?_274                           ; 2D2E _ 79, 43
00002D30        call    _DebugPrintEnabled              ; 2D30 _ E8, FFFFD51A
00002D35        test    al, al                          ; 2D35 _ 84. C0
00002D37        jz      ?_273                           ; 2D37 _ 74, 22
00002D39        mov     ecx, 2147483648                 ; 2D39 _ B9, 80000000
00002D3E        call    _DebugPrintLevelEnabled         ; 2D3E _ E8, FFFFD50F
00002D43        test    al, al                          ; 2D43 _ 84. C0
00002D45        jz      ?_273                           ; 2D45 _ 74, 14
00002D47        lea     rdx, ptr [?_561]                ; 2D47 _ 48: 8D. 15, 0000357F(rel)
00002D4E        mov     ecx, 2147483648                 ; 2D4E _ B9, 80000000
00002D53        mov     r8, rsi                         ; 2D53 _ 49: 89. F0
00002D56        call    _DebugPrint                     ; 2D56 _ E8, FFFFD4E5
?_273:
00002D5B        lea     rcx, ptr [?_627]                ; 2D5B _ 48: 8D. 0D, 0000444C(rel)
00002D62        lea     r8, ptr [?_562]                 ; 2D62 _ 4C: 8D. 05, 00003585(rel)
00002D69        mov     edx, 94                         ; 2D69 _ BA, 0000005E
00002D6E        call    _DebugAssert                    ; 2D6E _ E8, FFFFD4D8
?_274:
00002D73        mov     rax, qword ptr [_gBS]           ; 2D73 _ 48: 8B. 05, 000063CE(rel)
00002D7A        lea     rcx, ptr [_gEfiHiiConfigRoutingProtocolGuid]; 2D7A _ 48: 8D. 0D, 000061A7(rel)
00002D81        lea     r8, ptr [_gHiiConfigRouting]    ; 2D81 _ 4C: 8D. 05, 000063F0(rel)
00002D88        xor     edx, edx                        ; 2D88 _ 31. D2
00002D8A        call    qword ptr [rax+140H]            ; 2D8A _ FF. 90, 00000140
00002D90        mov     rsi, rax                        ; 2D90 _ 48: 89. C6
00002D93        call    _DebugAssertEnabled             ; 2D93 _ E8, FFFFD4B4
00002D98        test    al, al                          ; 2D98 _ 84. C0
00002D9A        jz      ?_276                           ; 2D9A _ 74, 48
00002D9C        test    rsi, rsi                        ; 2D9C _ 48: 85. F6
00002D9F        jns     ?_276                           ; 2D9F _ 79, 43
00002DA1        call    _DebugPrintEnabled              ; 2DA1 _ E8, FFFFD4A9
00002DA6        test    al, al                          ; 2DA6 _ 84. C0
00002DA8        jz      ?_275                           ; 2DA8 _ 74, 22
00002DAA        mov     ecx, 2147483648                 ; 2DAA _ B9, 80000000
00002DAF        call    _DebugPrintLevelEnabled         ; 2DAF _ E8, FFFFD49E
00002DB4        test    al, al                          ; 2DB4 _ 84. C0
00002DB6        jz      ?_275                           ; 2DB6 _ 74, 14
00002DB8        lea     rdx, ptr [?_561]                ; 2DB8 _ 48: 8D. 15, 0000350E(rel)
00002DBF        mov     ecx, 2147483648                 ; 2DBF _ B9, 80000000
00002DC4        mov     r8, rsi                         ; 2DC4 _ 49: 89. F0
00002DC7        call    _DebugPrint                     ; 2DC7 _ E8, FFFFD474
?_275:
00002DCC        lea     rcx, ptr [?_627]                ; 2DCC _ 48: 8D. 0D, 000043DB(rel)
00002DD3        lea     r8, ptr [?_562]                 ; 2DD3 _ 4C: 8D. 05, 00003514(rel)
00002DDA        mov     edx, 100                        ; 2DDA _ BA, 00000064
00002DDF        call    _DebugAssert                    ; 2DDF _ E8, FFFFD467
?_276:
00002DE4        mov     rax, qword ptr [_gBS]           ; 2DE4 _ 48: 8B. 05, 0000635D(rel)
00002DEB        lea     rcx, ptr [_gEfiHiiFontProtocolGuid]; 2DEB _ 48: 8D. 0D, 000060F6(rel)
00002DF2        lea     r8, ptr [_gHiiFont]             ; 2DF2 _ 4C: 8D. 05, 0000635F(rel)
00002DF9        xor     edx, edx                        ; 2DF9 _ 31. D2
00002DFB        call    qword ptr [rax+140H]            ; 2DFB _ FF. 90, 00000140
00002E01        mov     rax, qword ptr [_gBS]           ; 2E01 _ 48: 8B. 05, 00006340(rel)
00002E08        lea     rcx, ptr [_gEfiHiiImageProtocolGuid]; 2E08 _ 48: 8D. 0D, 000060F9(rel)
00002E0F        lea     r8, ptr [_gHiiImage]            ; 2E0F _ 4C: 8D. 05, 00006352(rel)
00002E16        xor     edx, edx                        ; 2E16 _ 31. D2
00002E18        call    qword ptr [rax+140H]            ; 2E18 _ FF. 90, 00000140
00002E1E        xor     eax, eax                        ; 2E1E _ 31. C0
00002E20        add     rsp, 40                         ; 2E20 _ 48: 83. C4, 28
00002E24        pop     rsi                             ; 2E24 _ 5E
00002E25        pop     rbp                             ; 2E25 _ 5D
00002E26        ret                                     ; 2E26 _ C3
_UefiHiiServicesLibConstructor ENDP

_InternalPrint PROC
00002E27        push    rbp                             ; 2E27 _ 55
00002E28        mov     rbp, rsp                        ; 2E28 _ 48: 89. E5
00002E2B        push    r15                             ; 2E2B _ 41: 57
00002E2D        push    r14                             ; 2E2D _ 41: 56
00002E2F        push    rsi                             ; 2E2F _ 56
00002E30        push    rdi                             ; 2E30 _ 57
00002E31        push    rbx                             ; 2E31 _ 53
00002E32        sub     rsp, 40                         ; 2E32 _ 48: 83. EC, 28
00002E36        mov     r14, r8                         ; 2E36 _ 4D: 89. C6
00002E39        mov     rsi, rdx                        ; 2E39 _ 48: 89. D6
00002E3C        mov     r15, rcx                        ; 2E3C _ 49: 89. CF
00002E3F        call    _DebugAssertEnabled             ; 2E3F _ E8, FFFFD408
00002E44        test    al, al                          ; 2E44 _ 84. C0
00002E46        jz      ?_277                           ; 2E46 _ 74, 1D
00002E48        test    r15, r15                        ; 2E48 _ 4D: 85. FF
00002E4B        jnz     ?_277                           ; 2E4B _ 75, 18
00002E4D        lea     rcx, ptr [?_628]                ; 2E4D _ 48: 8D. 0D, 000043CA(rel)
00002E54        lea     r8, ptr [?_629]                 ; 2E54 _ 4C: 8D. 05, 0000441C(rel)
00002E5B        mov     edx, 67                         ; 2E5B _ BA, 00000043
00002E60        call    _DebugAssert                    ; 2E60 _ E8, FFFFD3E6
?_277:
00002E65        call    _DebugAssertEnabled             ; 2E65 _ E8, FFFFD3E2
00002E6A        test    al, al                          ; 2E6A _ 84. C0
00002E6C        jz      ?_278                           ; 2E6C _ 74, 1E
00002E6E        test    r15b, 1H                        ; 2E6E _ 41: F6. C7, 01
00002E72        jz      ?_278                           ; 2E72 _ 74, 18
00002E74        lea     rcx, ptr [?_628]                ; 2E74 _ 48: 8D. 0D, 000043A3(rel)
00002E7B        lea     r8, ptr [?_630]                 ; 2E7B _ 4C: 8D. 05, 0000440C(rel)
00002E82        mov     edx, 68                         ; 2E82 _ BA, 00000044
00002E87        call    _DebugAssert                    ; 2E87 _ E8, FFFFD3BF
?_278:
00002E8C        call    _DebugAssertEnabled             ; 2E8C _ E8, FFFFD3BB
00002E91        test    al, al                          ; 2E91 _ 84. C0
00002E93        jz      ?_279                           ; 2E93 _ 74, 1D
00002E95        test    rsi, rsi                        ; 2E95 _ 48: 85. F6
00002E98        jnz     ?_279                           ; 2E98 _ 75, 18
00002E9A        lea     rcx, ptr [?_628]                ; 2E9A _ 48: 8D. 0D, 0000437D(rel)
00002EA1        lea     r8, ptr [?_631]                 ; 2EA1 _ 4C: 8D. 05, 00004409(rel)
00002EA8        mov     edx, 69                         ; 2EA8 _ BA, 00000045
00002EAD        call    _DebugAssert                    ; 2EAD _ E8, FFFFD399
?_279:
00002EB2        mov     ebx, dword ptr [__gPcd_FixedAtBuild_PcdUefiLibMaxPrintBufferSize]; 2EB2 _ 8B. 1D, 00004B44(rel)
00002EB8        inc     ebx                             ; 2EB8 _ FF. C3
00002EBA        add     rbx, rbx                        ; 2EBA _ 48: 01. DB
00002EBD        mov     rcx, rbx                        ; 2EBD _ 48: 89. D9
00002EC0        call    _AllocatePool                   ; 2EC0 _ E8, FFFFE79A
00002EC5        mov     rdi, rax                        ; 2EC5 _ 48: 89. C7
00002EC8        call    _DebugAssertEnabled             ; 2EC8 _ E8, FFFFD37F
00002ECD        test    al, al                          ; 2ECD _ 84. C0
00002ECF        jz      ?_280                           ; 2ECF _ 74, 1D
00002ED1        test    rdi, rdi                        ; 2ED1 _ 48: 85. FF
00002ED4        jnz     ?_280                           ; 2ED4 _ 75, 18
00002ED6        lea     rcx, ptr [?_628]                ; 2ED6 _ 48: 8D. 0D, 00004341(rel)
00002EDD        lea     r8, ptr [?_563]                 ; 2EDD _ 4C: 8D. 05, 0000341E(rel)
00002EE4        mov     edx, 74                         ; 2EE4 _ BA, 0000004A
00002EE9        call    _DebugAssert                    ; 2EE9 _ E8, FFFFD35D
?_280:
00002EEE        mov     rcx, rdi                        ; 2EEE _ 48: 89. F9
00002EF1        mov     rdx, rbx                        ; 2EF1 _ 48: 89. DA
00002EF4        mov     r8, r15                         ; 2EF4 _ 4D: 89. F8
00002EF7        mov     r9, r14                         ; 2EF7 _ 4D: 89. F1
00002EFA        call    _UnicodeVSPrint                 ; 2EFA _ E8, FFFFFB06
00002EFF        mov     rbx, rax                        ; 2EFF _ 48: 89. C3
00002F02        test    rsi, rsi                        ; 2F02 _ 48: 85. F6
00002F05        jz      ?_281                           ; 2F05 _ 74, 17
00002F07        test    rbx, rbx                        ; 2F07 _ 48: 85. DB
00002F0A        jz      ?_281                           ; 2F0A _ 74, 12
00002F0C        mov     rcx, rsi                        ; 2F0C _ 48: 89. F1
00002F0F        mov     rdx, rdi                        ; 2F0F _ 48: 89. FA
00002F12        call    qword ptr [rsi+8H]              ; 2F12 _ FF. 56, 08
00002F15        xor     ecx, ecx                        ; 2F15 _ 31. C9
00002F17        test    rax, rax                        ; 2F17 _ 48: 85. C0
00002F1A        cmovs   rbx, rcx                        ; 2F1A _ 48: 0F 48. D9
?_281:
00002F1E        mov     rcx, rdi                        ; 2F1E _ 48: 89. F9
00002F21        call    _FreePool                       ; 2F21 _ E8, FFFFE831
00002F26        mov     rax, rbx                        ; 2F26 _ 48: 89. D8
00002F29        add     rsp, 40                         ; 2F29 _ 48: 83. C4, 28
00002F2D        pop     rbx                             ; 2F2D _ 5B
00002F2E        pop     rdi                             ; 2F2E _ 5F
00002F2F        pop     rsi                             ; 2F2F _ 5E
00002F30        pop     r14                             ; 2F30 _ 41: 5E
00002F32        pop     r15                             ; 2F32 _ 41: 5F
00002F34        pop     rbp                             ; 2F34 _ 5D
00002F35        ret                                     ; 2F35 _ C3
_InternalPrint ENDP

_Print  PROC
00002F36        push    rbp                             ; 2F36 _ 55
00002F37        mov     rbp, rsp                        ; 2F37 _ 48: 89. E5
00002F3A        sub     rsp, 64                         ; 2F3A _ 48: 83. EC, 40
00002F3E        mov     qword ptr [rbp+28H], r9         ; 2F3E _ 4C: 89. 4D, 28
00002F42        mov     qword ptr [rbp+20H], r8         ; 2F42 _ 4C: 89. 45, 20
00002F46        mov     qword ptr [rbp+18H], rdx        ; 2F46 _ 48: 89. 55, 18
00002F4A        lea     rax, ptr [rbp+18H]              ; 2F4A _ 48: 8D. 45, 18
00002F4E        mov     qword ptr [rbp-20H], rax        ; 2F4E _ 48: 89. 45, E0
00002F52        mov     rax, qword ptr [_gST]           ; 2F52 _ 48: 8B. 05, 000061E7(rel)
00002F59        mov     rdx, qword ptr [rax+40H]        ; 2F59 _ 48: 8B. 50, 40
00002F5D        lea     r8, ptr [rbp-20H]               ; 2F5D _ 4C: 8D. 45, E0
00002F61        call    _InternalPrint                  ; 2F61 _ E8, FFFFFEC1
00002F66        add     rsp, 64                         ; 2F66 _ 48: 83. C4, 40
00002F6A        pop     rbp                             ; 2F6A _ 5D
00002F6B        ret                                     ; 2F6B _ C3
_Print  ENDP

_EfiGetNameGuidFromFwVolDevicePathNode PROC
00002F6C        push    rbp                             ; 2F6C _ 55
00002F6D        mov     rbp, rsp                        ; 2F6D _ 48: 89. E5
00002F70        push    rsi                             ; 2F70 _ 56
00002F71        sub     rsp, 40                         ; 2F71 _ 48: 83. EC, 28
00002F75        mov     rsi, rcx                        ; 2F75 _ 48: 89. CE
00002F78        call    _DebugAssertEnabled             ; 2F78 _ E8, FFFFD2CF
00002F7D        test    al, al                          ; 2F7D _ 84. C0
00002F7F        jz      ?_282                           ; 2F7F _ 74, 1D
00002F81        test    rsi, rsi                        ; 2F81 _ 48: 85. F6
00002F84        jnz     ?_282                           ; 2F84 _ 75, 18
00002F86        lea     rcx, ptr [?_632]                ; 2F86 _ 48: 8D. 0D, 0000433C(rel)
00002F8D        lea     r8, ptr [?_633]                 ; 2F8D _ 4C: 8D. 05, 0000438E(rel)
00002F94        mov     edx, 290                        ; 2F94 _ BA, 00000122
00002F99        call    _DebugAssert                    ; 2F99 _ E8, FFFFD2AD
?_282:
00002F9E        mov     rcx, rsi                        ; 2F9E _ 48: 89. F1
00002FA1        call    _DevicePathType                 ; 2FA1 _ E8, FFFFFBD8
00002FA6        cmp     al, 4                           ; 2FA6 _ 3C, 04
00002FA8        jnz     ?_283                           ; 2FA8 _ 75, 19
00002FAA        mov     rcx, rsi                        ; 2FAA _ 48: 89. F1
00002FAD        call    _DevicePathSubType              ; 2FAD _ E8, FFFFFC08
00002FB2        add     rsi, 4                          ; 2FB2 _ 48: 83. C6, 04
00002FB6        cmp     al, 6                           ; 2FB6 _ 3C, 06
00002FB8        mov     eax, 0                          ; 2FB8 _ B8, 00000000
00002FBD        cmove   rax, rsi                        ; 2FBD _ 48: 0F 44. C6
00002FC1        jmp     ?_284                           ; 2FC1 _ EB, 02

?_283:
00002FC3        xor     eax, eax                        ; 2FC3 _ 31. C0
?_284:
00002FC5        add     rsp, 40                         ; 2FC5 _ 48: 83. C4, 28
00002FC9        pop     rsi                             ; 2FC9 _ 5E
00002FCA        pop     rbp                             ; 2FCA _ 5D
00002FCB        ret                                     ; 2FCB _ C3
_EfiGetNameGuidFromFwVolDevicePathNode ENDP

_UefiLibConstructor PROC
00002FCC        xor     eax, eax                        ; 2FCC _ 31. C0
00002FCE        ret                                     ; 2FCE _ C3
_UefiLibConstructor ENDP

_EfiGetSystemConfigurationTable PROC
00002FCF        push    rbp                             ; 2FCF _ 55
00002FD0        mov     rbp, rsp                        ; 2FD0 _ 48: 89. E5
00002FD3        push    r15                             ; 2FD3 _ 41: 57
00002FD5        push    r14                             ; 2FD5 _ 41: 56
00002FD7        push    r12                             ; 2FD7 _ 41: 54
00002FD9        push    rsi                             ; 2FD9 _ 56
00002FDA        push    rdi                             ; 2FDA _ 57
00002FDB        push    rbx                             ; 2FDB _ 53
00002FDC        sub     rsp, 32                         ; 2FDC _ 48: 83. EC, 20
00002FE0        mov     r14, rdx                        ; 2FE0 _ 49: 89. D6
00002FE3        mov     r15, rcx                        ; 2FE3 _ 49: 89. CF
00002FE6        call    _DebugAssertEnabled             ; 2FE6 _ E8, FFFFD261
00002FEB        test    al, al                          ; 2FEB _ 84. C0
00002FED        jz      ?_285                           ; 2FED _ 74, 1D
00002FEF        test    r15, r15                        ; 2FEF _ 4D: 85. FF
00002FF2        jnz     ?_285                           ; 2FF2 _ 75, 18
00002FF4        lea     rcx, ptr [?_634]                ; 2FF4 _ 48: 8D. 0D, 00004348(rel)
00002FFB        lea     r8, ptr [?_635]                 ; 2FFB _ 4C: 8D. 05, 00004395(rel)
00003002        mov     edx, 97                         ; 3002 _ BA, 00000061
00003007        call    _DebugAssert                    ; 3007 _ E8, FFFFD23F
?_285:
0000300C        call    _DebugAssertEnabled             ; 300C _ E8, FFFFD23B
00003011        test    al, al                          ; 3011 _ 84. C0
00003013        jz      ?_286                           ; 3013 _ 74, 1D
00003015        test    r14, r14                        ; 3015 _ 4D: 85. F6
00003018        jnz     ?_286                           ; 3018 _ 75, 18
0000301A        lea     rcx, ptr [?_634]                ; 301A _ 48: 8D. 0D, 00004322(rel)
00003021        lea     r8, ptr [?_636]                 ; 3021 _ 4C: 8D. 05, 00004389(rel)
00003028        mov     edx, 98                         ; 3028 _ BA, 00000062
0000302D        call    _DebugAssert                    ; 302D _ E8, FFFFD219
?_286:
00003032        mov     r12, qword ptr [_gST]           ; 3032 _ 4C: 8B. 25, 00006107(rel)
00003039        mov     qword ptr [r14], 0              ; 3039 _ 49: C7. 06, 00000000
00003040        xor     ebx, ebx                        ; 3040 _ 31. DB
00003042        mov     rsi, -1                         ; 3042 _ 48: C7. C6, FFFFFFFF
?_287:
00003049        mov     rdi, rbx                        ; 3049 _ 48: 89. DF
0000304C        inc     rsi                             ; 304C _ 48: FF. C6
0000304F        mov     rax, 0EH                        ; 304F _ 48: B8, 800000000000000E
00003059        cmp     rsi, qword ptr [r12+68H]        ; 3059 _ 49: 3B. 74 24, 68
0000305E        jnc     ?_288                           ; 305E _ 73, 27
00003060        lea     rbx, ptr [rdi+18H]              ; 3060 _ 48: 8D. 5F, 18
00003064        mov     rdx, qword ptr [r12+70H]        ; 3064 _ 49: 8B. 54 24, 70
00003069        add     rdx, rdi                        ; 3069 _ 48: 01. FA
0000306C        mov     rcx, r15                        ; 306C _ 4C: 89. F9
0000306F        call    _CompareGuid                    ; 306F _ E8, FFFFD4E9
00003074        test    al, al                          ; 3074 _ 84. C0
00003076        jz      ?_287                           ; 3076 _ 74, D1
00003078        mov     rax, qword ptr [r12+70H]        ; 3078 _ 49: 8B. 44 24, 70
0000307D        mov     rax, qword ptr [rax+rdi+10H]    ; 307D _ 48: 8B. 44 38, 10
00003082        mov     qword ptr [r14], rax            ; 3082 _ 49: 89. 06
00003085        xor     eax, eax                        ; 3085 _ 31. C0
?_288:
00003087        add     rsp, 32                         ; 3087 _ 48: 83. C4, 20
0000308B        pop     rbx                             ; 308B _ 5B
0000308C        pop     rdi                             ; 308C _ 5F
0000308D        pop     rsi                             ; 308D _ 5E
0000308E        pop     r12                             ; 308E _ 41: 5C
00003090        pop     r14                             ; 3090 _ 41: 5E
00003092        pop     r15                             ; 3092 _ 41: 5F
00003094        pop     rbp                             ; 3094 _ 5D
00003095        ret                                     ; 3095 _ C3
_EfiGetSystemConfigurationTable ENDP

_GetVariable2 PROC
00003096        push    rbp                             ; 3096 _ 55
00003097        mov     rbp, rsp                        ; 3097 _ 48: 89. E5
0000309A        push    r15                             ; 309A _ 41: 57
0000309C        push    r14                             ; 309C _ 41: 56
0000309E        push    rsi                             ; 309E _ 56
0000309F        push    rdi                             ; 309F _ 57
000030A0        push    rbx                             ; 30A0 _ 53
000030A1        sub     rsp, 56                         ; 30A1 _ 48: 83. EC, 38
000030A5        mov     rsi, r9                         ; 30A5 _ 4C: 89. CE
000030A8        mov     rdi, r8                         ; 30A8 _ 4C: 89. C7
000030AB        mov     r14, rdx                        ; 30AB _ 49: 89. D6
000030AE        mov     r15, rcx                        ; 30AE _ 49: 89. CF
000030B1        call    _DebugAssertEnabled             ; 30B1 _ E8, FFFFD196
000030B6        test    al, al                          ; 30B6 _ 84. C0
000030B8        jz      ?_290                           ; 30B8 _ 74, 27
000030BA        test    r15, r15                        ; 30BA _ 4D: 85. FF
000030BD        jz      ?_289                           ; 30BD _ 74, 0A
000030BF        test    r14, r14                        ; 30BF _ 4D: 85. F6
000030C2        jz      ?_289                           ; 30C2 _ 74, 05
000030C4        test    rdi, rdi                        ; 30C4 _ 48: 85. FF
000030C7        jnz     ?_290                           ; 30C7 _ 75, 18
?_289:
000030C9        lea     rcx, ptr [?_634]                ; 30C9 _ 48: 8D. 0D, 00004273(rel)
000030D0        lea     r8, ptr [?_637]                 ; 30D0 _ 4C: 8D. 05, 000042F0(rel)
000030D7        mov     edx, 1383                       ; 30D7 _ BA, 00000567
000030DC        call    _DebugAssert                    ; 30DC _ E8, FFFFD16A
?_290:
000030E1        mov     qword ptr [rbp-30H], 0          ; 30E1 _ 48: C7. 45, D0, 00000000
000030E9        mov     qword ptr [rdi], 0              ; 30E9 _ 48: C7. 07, 00000000
000030F0        test    rsi, rsi                        ; 30F0 _ 48: 85. F6
000030F3        jz      ?_291                           ; 30F3 _ 74, 07
000030F5        mov     qword ptr [rsi], 0              ; 30F5 _ 48: C7. 06, 00000000
?_291:
000030FC        mov     rax, qword ptr [_gRT]           ; 30FC _ 48: 8B. 05, 0000604D(rel)
00003103        mov     qword ptr [rsp+20H], 0          ; 3103 _ 48: C7. 44 24, 20, 00000000
0000310C        lea     r9, ptr [rbp-30H]               ; 310C _ 4C: 8D. 4D, D0
00003110        mov     rcx, r15                        ; 3110 _ 4C: 89. F9
00003113        mov     rdx, r14                        ; 3113 _ 4C: 89. F2
00003116        xor     r8d, r8d                        ; 3116 _ 45: 31. C0
00003119        call    qword ptr [rax+48H]             ; 3119 _ FF. 50, 48
0000311C        mov     rbx, rax                        ; 311C _ 48: 89. C3
0000311F        mov     rax, 5H                         ; 311F _ 48: B8, 8000000000000005
00003129        cmp     rbx, rax                        ; 3129 _ 48: 39. C3
0000312C        jne     ?_295                           ; 312C _ 0F 85, 00000086
00003132        mov     rcx, qword ptr [rbp-30H]        ; 3132 _ 48: 8B. 4D, D0
00003136        call    _AllocatePool                   ; 3136 _ E8, FFFFE524
0000313B        mov     qword ptr [rdi], rax            ; 313B _ 48: 89. 07
0000313E        call    _DebugAssertEnabled             ; 313E _ E8, FFFFD109
00003143        test    al, al                          ; 3143 _ 84. C0
00003145        jz      ?_292                           ; 3145 _ 74, 20
00003147        mov     rax, qword ptr [rdi]            ; 3147 _ 48: 8B. 07
0000314A        test    rax, rax                        ; 314A _ 48: 85. C0
0000314D        jnz     ?_293                           ; 314D _ 75, 2A
0000314F        lea     rcx, ptr [?_634]                ; 314F _ 48: 8D. 0D, 000041ED(rel)
00003156        lea     r8, ptr [?_638]                 ; 3156 _ 4C: 8D. 05, 000042B0(rel)
0000315D        mov     edx, 1403                       ; 315D _ BA, 0000057B
00003162        call    _DebugAssert                    ; 3162 _ E8, FFFFD0E4
?_292:
00003167        mov     rax, qword ptr [rdi]            ; 3167 _ 48: 8B. 07
0000316A        mov     rbx, 9H                         ; 316A _ 48: BB, 8000000000000009
00003174        test    rax, rax                        ; 3174 _ 48: 85. C0
00003177        jz      ?_295                           ; 3177 _ 74, 3F
?_293:
00003179        mov     rbx, qword ptr [_gRT]           ; 3179 _ 48: 8B. 1D, 00005FD0(rel)
00003180        mov     qword ptr [rsp+20H], rax        ; 3180 _ 48: 89. 44 24, 20
00003185        lea     r9, ptr [rbp-30H]               ; 3185 _ 4C: 8D. 4D, D0
00003189        mov     rcx, r15                        ; 3189 _ 4C: 89. F9
0000318C        mov     rdx, r14                        ; 318C _ 4C: 89. F2
0000318F        xor     r8d, r8d                        ; 318F _ 45: 31. C0
00003192        call    qword ptr [rbx+48H]             ; 3192 _ FF. 53, 48
00003195        mov     rbx, rax                        ; 3195 _ 48: 89. C3
00003198        test    rbx, rbx                        ; 3198 _ 48: 85. DB
0000319B        jns     ?_294                           ; 319B _ 79, 0F
0000319D        mov     rcx, qword ptr [rdi]            ; 319D _ 48: 8B. 0F
000031A0        call    _FreePool                       ; 31A0 _ E8, FFFFE5B2
000031A5        mov     qword ptr [rdi], 0              ; 31A5 _ 48: C7. 07, 00000000
?_294:
000031AC        test    rsi, rsi                        ; 31AC _ 48: 85. F6
000031AF        jz      ?_295                           ; 31AF _ 74, 07
000031B1        mov     rax, qword ptr [rbp-30H]        ; 31B1 _ 48: 8B. 45, D0
000031B5        mov     qword ptr [rsi], rax            ; 31B5 _ 48: 89. 06
?_295:
000031B8        mov     rax, rbx                        ; 31B8 _ 48: 89. D8
000031BB        add     rsp, 56                         ; 31BB _ 48: 83. C4, 38
000031BF        pop     rbx                             ; 31BF _ 5B
000031C0        pop     rdi                             ; 31C0 _ 5F
000031C1        pop     rsi                             ; 31C1 _ 5E
000031C2        pop     r14                             ; 31C2 _ 41: 5E
000031C4        pop     r15                             ; 31C4 _ 41: 5F
000031C6        pop     rbp                             ; 31C6 _ 5D
000031C7        ret                                     ; 31C7 _ C3
_GetVariable2 ENDP

_GetEfiGlobalVariable2 PROC
000031C8        mov     r9, r8                          ; 31C8 _ 4D: 89. C1
000031CB        mov     rax, rdx                        ; 31CB _ 48: 89. D0
000031CE        lea     rdx, ptr [_gEfiGlobalVariableGuid]; 31CE _ 48: 8D. 15, 00005CB3(rel)
000031D5        mov     r8, rax                         ; 31D5 _ 49: 89. C0
000031D8        jmp     _GetVariable2                   ; 31D8 _ E9, FFFFFEB9
_GetEfiGlobalVariable2 ENDP

_GetBestLanguage PROC
000031DD        push    rbp                             ; 31DD _ 55
000031DE        mov     rbp, rsp                        ; 31DE _ 48: 89. E5
000031E1        push    r15                             ; 31E1 _ 41: 57
000031E3        push    r14                             ; 31E3 _ 41: 56
000031E5        push    r12                             ; 31E5 _ 41: 54
000031E7        push    rsi                             ; 31E7 _ 56
000031E8        push    rdi                             ; 31E8 _ 57
000031E9        push    rbx                             ; 31E9 _ 53
000031EA        sub     rsp, 64                         ; 31EA _ 48: 83. EC, 40
000031EE        mov     esi, edx                        ; 31EE _ 89. D6
000031F0        mov     r14, rcx                        ; 31F0 _ 49: 89. CE
000031F3        mov     qword ptr [rbp+28H], r9         ; 31F3 _ 4C: 89. 4D, 28
000031F7        mov     qword ptr [rbp+20H], r8         ; 31F7 _ 4C: 89. 45, 20
000031FB        call    _DebugAssertEnabled             ; 31FB _ E8, FFFFD04C
00003200        test    al, al                          ; 3200 _ 84. C0
00003202        jz      ?_296                           ; 3202 _ 74, 1D
00003204        test    r14, r14                        ; 3204 _ 4D: 85. F6
00003207        jnz     ?_296                           ; 3207 _ 75, 18
00003209        lea     rcx, ptr [?_634]                ; 3209 _ 48: 8D. 0D, 00004133(rel)
00003210        lea     r8, ptr [?_639]                 ; 3210 _ 4C: 8D. 05, 0000420D(rel)
00003217        mov     edx, 1510                       ; 3217 _ BA, 000005E6
0000321C        call    _DebugAssert                    ; 321C _ E8, FFFFD02A
?_296:
00003221        lea     rax, ptr [rbp+20H]              ; 3221 _ 48: 8D. 45, 20
00003225        mov     qword ptr [rbp-50H], rax        ; 3225 _ 48: 89. 45, B0
00003229        jmp     ?_300                           ; 3229 _ EB, 2D

?_297:
0000322B        xor     eax, eax                        ; 322B _ 31. C0
0000322D        test    sil, sil                        ; 322D _ 40: 84. F6
00003230        jnz     ?_299                           ; 3230 _ 75, 1B
?_298:
00003232        lea     rcx, ptr [r12-1H]               ; 3232 _ 49: 8D. 4C 24, FF
00003237        xor     eax, eax                        ; 3237 _ 31. C0
00003239        cmp     r12, 1                          ; 3239 _ 49: 83. FC, 01
0000323D        jz      ?_299                           ; 323D _ 74, 0E
0000323F        cmp     byte ptr [r15+r12-1H], 45       ; 323F _ 43: 80. 7C 27, FF, 2D
00003245        mov     r12, rcx                        ; 3245 _ 49: 89. CC
00003248        jnz     ?_298                           ; 3248 _ 75, E8
0000324A        mov     rax, rcx                        ; 324A _ 48: 89. C8
?_299:
0000324D        mov     r12, rax                        ; 324D _ 49: 89. C4
00003250        test    r12, r12                        ; 3250 _ 4D: 85. E4
00003253        mov     rbx, r14                        ; 3253 _ 4C: 89. F3
00003256        jnz     ?_307                           ; 3256 _ 75, 5B
?_300:
00003258        mov     rax, qword ptr [rbp-50H]        ; 3258 _ 48: 8B. 45, B0
0000325C        lea     rcx, ptr [rax+8H]               ; 325C _ 48: 8D. 48, 08
00003260        mov     qword ptr [rbp-50H], rcx        ; 3260 _ 48: 89. 4D, B0
00003264        mov     r15, qword ptr [rax]            ; 3264 _ 4C: 8B. 38
00003267        test    r15, r15                        ; 3267 _ 4D: 85. FF
0000326A        je      ?_314                           ; 326A _ 0F 84, 000000A9
00003270        mov     rcx, r15                        ; 3270 _ 4C: 89. F9
00003273        call    _AsciiStrLen                    ; 3273 _ E8, FFFFD6F2
00003278        mov     rcx, rax                        ; 3278 _ 48: 89. C1
0000327B        mov     eax, 3                          ; 327B _ B8, 00000003
00003280        cmp     rcx, 3                          ; 3280 _ 48: 83. F9, 03
00003284        ja      ?_301                           ; 3284 _ 77, 08
00003286        mov     rcx, r15                        ; 3286 _ 4C: 89. F9
00003289        call    _AsciiStrLen                    ; 3289 _ E8, FFFFD6DC
?_301:
0000328E        xor     ecx, ecx                        ; 328E _ 31. C9
00003290        test    sil, sil                        ; 3290 _ 40: 84. F6
00003293        jnz     ?_305                           ; 3293 _ 75, 14
00003295        jmp     ?_303                           ; 3295 _ EB, 07

?_302:
00003297        cmp     al, 59                          ; 3297 _ 3C, 3B
00003299        jz      ?_304                           ; 3299 _ 74, 0B
0000329B        inc     rcx                             ; 329B _ 48: FF. C1
?_303:
0000329E        mov     al, byte ptr [r15+rcx]          ; 329E _ 41: 8A. 04 0F
000032A2        test    al, al                          ; 32A2 _ 84. C0
000032A4        jnz     ?_302                           ; 32A4 _ 75, F1
?_304:
000032A6        mov     rax, rcx                        ; 32A6 _ 48: 89. C8
?_305:
000032A9        mov     edi, 3                          ; 32A9 _ BF, 00000003
000032AE        jmp     ?_299                           ; 32AE _ EB, 9D

?_306:
000032B0        add     rbx, rdi                        ; 32B0 _ 48: 01. FB
?_307:
000032B3        mov     al, byte ptr [rbx]              ; 32B3 _ 8A. 03
000032B5        test    al, al                          ; 32B5 _ 84. C0
000032B7        je      ?_297                           ; 32B7 _ 0F 84, FFFFFF6E
000032BD        test    sil, sil                        ; 32BD _ 40: 84. F6
000032C0        jz      ?_309                           ; 32C0 _ 74, 08
000032C2        jmp     ?_313                           ; 32C2 _ EB, 22

?_308:
000032C4        mov     al, byte ptr [rbx+1H]           ; 32C4 _ 8A. 43, 01
000032C7        inc     rbx                             ; 32C7 _ 48: FF. C3
?_309:
000032CA        cmp     al, 59                          ; 32CA _ 3C, 3B
000032CC        jz      ?_308                           ; 32CC _ 74, F6
000032CE        xor     edi, edi                        ; 32CE _ 31. FF
000032D0        jmp     ?_311                           ; 32D0 _ EB, 07

?_310:
000032D2        mov     al, byte ptr [rbx+rdi+1H]       ; 32D2 _ 8A. 44 3B, 01
000032D6        inc     rdi                             ; 32D6 _ 48: FF. C7
?_311:
000032D9        test    al, al                          ; 32D9 _ 84. C0
000032DB        jz      ?_312                           ; 32DB _ 74, 04
000032DD        cmp     al, 59                          ; 32DD _ 3C, 3B
000032DF        jnz     ?_310                           ; 32DF _ 75, F1
?_312:
000032E1        cmp     r12, rdi                        ; 32E1 _ 49: 39. FC
000032E4        ja      ?_306                           ; 32E4 _ 77, CA
?_313:
000032E6        mov     rcx, rbx                        ; 32E6 _ 48: 89. D9
000032E9        mov     rdx, r15                        ; 32E9 _ 4C: 89. FA
000032EC        mov     r8, r12                         ; 32EC _ 4D: 89. E0
000032EF        call    _AsciiStrnCmp                   ; 32EF _ E8, FFFFD87B
000032F4        test    rax, rax                        ; 32F4 _ 48: 85. C0
000032F7        jnz     ?_306                           ; 32F7 _ 75, B7
000032F9        lea     rcx, ptr [rdi+1H]               ; 32F9 _ 48: 8D. 4F, 01
000032FD        call    _AllocateZeroPool               ; 32FD _ E8, FFFFE39D
00003302        mov     rcx, rax                        ; 3302 _ 48: 89. C1
00003305        xor     eax, eax                        ; 3305 _ 31. C0
00003307        test    rcx, rcx                        ; 3307 _ 48: 85. C9
0000330A        jz      ?_315                           ; 330A _ 74, 0F
0000330C        mov     rdx, rbx                        ; 330C _ 48: 89. DA
0000330F        mov     r8, rdi                         ; 330F _ 49: 89. F8
00003312        call    _CopyMem                        ; 3312 _ E8, FFFFD12D
00003317        jmp     ?_315                           ; 3317 _ EB, 02

?_314:
00003319        xor     eax, eax                        ; 3319 _ 31. C0
?_315:
0000331B        add     rsp, 64                         ; 331B _ 48: 83. C4, 40
0000331F        pop     rbx                             ; 331F _ 5B
00003320        pop     rdi                             ; 3320 _ 5F
00003321        pop     rsi                             ; 3321 _ 5E
00003322        pop     r12                             ; 3322 _ 41: 5C
00003324        pop     r14                             ; 3324 _ 41: 5E
00003326        pop     r15                             ; 3326 _ 41: 5F
00003328        pop     rbp                             ; 3328 _ 5D
00003329        ret                                     ; 3329 _ C3
_GetBestLanguage ENDP

0000332A        nop                                     ; 332A _ 90
0000332B        nop                                     ; 332B _ 90

_HiiAddPackages PROC
0000332C        push    rbp                             ; 332C _ 55
0000332D        mov     rbp, rsp                        ; 332D _ 48: 89. E5
00003330        push    r15                             ; 3330 _ 41: 57
00003332        push    r14                             ; 3332 _ 41: 56
00003334        push    r12                             ; 3334 _ 41: 54
00003336        push    rsi                             ; 3336 _ 56
00003337        push    rdi                             ; 3337 _ 57
00003338        push    rbx                             ; 3338 _ 53
00003339        sub     rsp, 80                         ; 3339 _ 48: 83. EC, 50
0000333D        mov     r14, rdx                        ; 333D _ 49: 89. D6
00003340        mov     rbx, rcx                        ; 3340 _ 48: 89. CB
00003343        mov     qword ptr [rbp+28H], r9         ; 3343 _ 4C: 89. 4D, 28
00003347        mov     qword ptr [rbp+20H], r8         ; 3347 _ 4C: 89. 45, 20
0000334B        call    _DebugAssertEnabled             ; 334B _ E8, FFFFCEFC
00003350        test    al, al                          ; 3350 _ 84. C0
00003352        jz      ?_316                           ; 3352 _ 74, 1D
00003354        test    rbx, rbx                        ; 3354 _ 48: 85. DB
00003357        jnz     ?_316                           ; 3357 _ 75, 18
00003359        lea     rcx, ptr [?_640]                ; 3359 _ 48: 8D. 0D, 000040E7(rel)
00003360        lea     r8, ptr [?_641]                 ; 3360 _ 4C: 8D. 05, 0000413C(rel)
00003367        mov     edx, 160                        ; 3367 _ BA, 000000A0
0000336C        call    _DebugAssert                    ; 336C _ E8, FFFFCEDA
?_316:
00003371        lea     r12, ptr [rbp+20H]              ; 3371 _ 4C: 8D. 65, 20
00003375        mov     qword ptr [rbp-50H], r12        ; 3375 _ 4C: 89. 65, B0
00003379        lea     rdi, ptr [rbp+28H]              ; 3379 _ 48: 8D. 7D, 28
0000337D        mov     qword ptr [rbp-50H], rdi        ; 337D _ 48: 89. 7D, B0
00003381        mov     rcx, qword ptr [rbp+20H]        ; 3381 _ 48: 8B. 4D, 20
00003385        test    rcx, rcx                        ; 3385 _ 48: 85. C9
00003388        je      ?_322                           ; 3388 _ 0F 84, 000000EC
0000338E        xor     esi, esi                        ; 338E _ 31. F6
?_317:
00003390        call    _ReadUnaligned32                ; 3390 _ E8, FFFFDCCF
00003395        mov     rcx, qword ptr [rbp-50H]        ; 3395 _ 48: 8B. 4D, B0
00003399        lea     rdx, ptr [rcx+8H]               ; 3399 _ 48: 8D. 51, 08
0000339D        mov     qword ptr [rbp-50H], rdx        ; 339D _ 48: 89. 55, B0
000033A1        lea     esi, ptr [rsi+rax-4H]           ; 33A1 _ 8D. 74 06, FC
000033A5        mov     rcx, qword ptr [rcx]            ; 33A5 _ 48: 8B. 09
000033A8        test    rcx, rcx                        ; 33A8 _ 48: 85. C9
000033AB        jnz     ?_317                           ; 33AB _ 75, E3
000033AD        xor     eax, eax                        ; 33AD _ 31. C0
000033AF        test    esi, esi                        ; 33AF _ 85. F6
000033B1        je      ?_321                           ; 33B1 _ 0F 84, 000000B4
000033B7        add     esi, 24                         ; 33B7 _ 83. C6, 18
000033BA        mov     rcx, rsi                        ; 33BA _ 48: 89. F1
000033BD        call    _AllocateZeroPool               ; 33BD _ E8, FFFFE2DD
000033C2        mov     r15, rax                        ; 33C2 _ 49: 89. C7
000033C5        xor     eax, eax                        ; 33C5 _ 31. C0
000033C7        test    r15, r15                        ; 33C7 _ 4D: 85. FF
000033CA        je      ?_321                           ; 33CA _ 0F 84, 0000009B
000033D0        mov     rcx, r15                        ; 33D0 _ 4C: 89. F9
000033D3        mov     rdx, rbx                        ; 33D3 _ 48: 89. DA
000033D6        call    _CopyGuid                       ; 33D6 _ E8, FFFFD13F
000033DB        mov     dword ptr [r15+10H], esi        ; 33DB _ 41: 89. 77, 10
000033DF        mov     qword ptr [rbp-50H], r12        ; 33DF _ 4C: 89. 65, B0
000033E3        mov     qword ptr [rbp-50H], rdi        ; 33E3 _ 48: 89. 7D, B0
000033E7        lea     rsi, ptr [r15+14H]              ; 33E7 _ 49: 8D. 77, 14
000033EB        mov     rbx, qword ptr [rbp+20H]        ; 33EB _ 48: 8B. 5D, 20
000033EF        jmp     ?_319                           ; 33EF _ EB, 31

?_318:
000033F1        mov     rcx, rbx                        ; 33F1 _ 48: 89. D9
000033F4        call    _ReadUnaligned32                ; 33F4 _ E8, FFFFDC6B
000033F9        mov     edi, eax                        ; 33F9 _ 89. C7
000033FB        add     rbx, 4                          ; 33FB _ 48: 83. C3, 04
000033FF        add     edi, -4                         ; 33FF _ 83. C7, FC
00003402        mov     rcx, rsi                        ; 3402 _ 48: 89. F1
00003405        mov     rdx, rbx                        ; 3405 _ 48: 89. DA
00003408        mov     r8, rdi                         ; 3408 _ 49: 89. F8
0000340B        call    _CopyMem                        ; 340B _ E8, FFFFD034
00003410        mov     rax, qword ptr [rbp-50H]        ; 3410 _ 48: 8B. 45, B0
00003414        lea     rcx, ptr [rax+8H]               ; 3414 _ 48: 8D. 48, 08
00003418        mov     qword ptr [rbp-50H], rcx        ; 3418 _ 48: 89. 4D, B0
0000341C        add     rsi, rdi                        ; 341C _ 48: 01. FE
0000341F        mov     rbx, qword ptr [rax]            ; 341F _ 48: 8B. 18
?_319:
00003422        test    rbx, rbx                        ; 3422 _ 48: 85. DB
00003425        jnz     ?_318                           ; 3425 _ 75, CA
00003427        lea     rdx, ptr [_mEndOfPakageList]    ; 3427 _ 48: 8D. 15, 000045C2(rel)
0000342E        mov     rcx, rsi                        ; 342E _ 48: 89. F1
00003431        mov     r8d, 4                          ; 3431 _ 41: B8, 00000004
00003437        call    _CopyMem                        ; 3437 _ E8, FFFFD008
0000343C        mov     rax, qword ptr [_gHiiDatabase]  ; 343C _ 48: 8B. 05, 00005D2D(rel)
00003443        lea     r9, ptr [rbp-58H]               ; 3443 _ 4C: 8D. 4D, A8
00003447        mov     rcx, rax                        ; 3447 _ 48: 89. C1
0000344A        mov     rdx, r15                        ; 344A _ 4C: 89. FA
0000344D        mov     r8, r14                         ; 344D _ 4D: 89. F0
00003450        call    qword ptr [rax]                 ; 3450 _ FF. 10
00003452        test    rax, rax                        ; 3452 _ 48: 85. C0
00003455        jns     ?_320                           ; 3455 _ 79, 08
00003457        mov     qword ptr [rbp-58H], 0          ; 3457 _ 48: C7. 45, A8, 00000000
?_320:
0000345F        mov     rcx, r15                        ; 345F _ 4C: 89. F9
00003462        call    _FreePool                       ; 3462 _ E8, FFFFE2F0
00003467        mov     rax, qword ptr [rbp-58H]        ; 3467 _ 48: 8B. 45, A8
?_321:
0000346B        add     rsp, 80                         ; 346B _ 48: 83. C4, 50
0000346F        pop     rbx                             ; 346F _ 5B
00003470        pop     rdi                             ; 3470 _ 5F
00003471        pop     rsi                             ; 3471 _ 5E
00003472        pop     r12                             ; 3472 _ 41: 5C
00003474        pop     r14                             ; 3474 _ 41: 5E
00003476        pop     r15                             ; 3476 _ 41: 5F
00003478        pop     rbp                             ; 3478 _ 5D
00003479        ret                                     ; 3479 _ C3
_HiiAddPackages ENDP

?_322   LABEL NEAR
0000347A        xor     eax, eax                        ; 347A _ 31. C0
0000347C        jmp     ?_321                           ; 347C _ EB, ED

_HiiGetString PROC
0000347E        push    rbp                             ; 347E _ 55
0000347F        mov     rbp, rsp                        ; 347F _ 48: 89. E5
00003482        push    r15                             ; 3482 _ 41: 57
00003484        push    r14                             ; 3484 _ 41: 56
00003486        push    r13                             ; 3486 _ 41: 55
00003488        push    r12                             ; 3488 _ 41: 54
0000348A        push    rsi                             ; 348A _ 56
0000348B        push    rdi                             ; 348B _ 57
0000348C        push    rbx                             ; 348C _ 53
0000348D        sub     rsp, 88                         ; 348D _ 48: 83. EC, 58
00003491        mov     r12, r8                         ; 3491 _ 4D: 89. C4
00003494        mov     ebx, edx                        ; 3494 _ 89. D3
00003496        mov     r14, rcx                        ; 3496 _ 49: 89. CE
00003499        call    _DebugAssertEnabled             ; 3499 _ E8, FFFFCDAE
0000349E        test    al, al                          ; 349E _ 84. C0
000034A0        jz      ?_323                           ; 34A0 _ 74, 1D
000034A2        test    r14, r14                        ; 34A2 _ 4D: 85. F6
000034A5        jnz     ?_323                           ; 34A5 _ 75, 18
000034A7        lea     rcx, ptr [?_643]                ; 34A7 _ 48: 8D. 0D, 0000402F(rel)
000034AE        lea     r8, ptr [?_642]                 ; 34AE _ 4C: 8D. 05, 0000400E(rel)
000034B5        mov     edx, 238                        ; 34B5 _ BA, 000000EE
000034BA        call    _DebugAssert                    ; 34BA _ E8, FFFFCD8C
?_323:
000034BF        call    _DebugAssertEnabled             ; 34BF _ E8, FFFFCD88
000034C4        test    al, al                          ; 34C4 _ 84. C0
000034C6        jz      ?_324                           ; 34C6 _ 74, 1D
000034C8        test    bx, bx                          ; 34C8 _ 66: 85. DB
000034CB        jnz     ?_324                           ; 34CB _ 75, 18
000034CD        lea     rcx, ptr [?_643]                ; 34CD _ 48: 8D. 0D, 00004009(rel)
000034D4        lea     r8, ptr [?_644]                 ; 34D4 _ 4C: 8D. 05, 00004061(rel)
000034DB        mov     edx, 239                        ; 34DB _ BA, 000000EF
000034E0        call    _DebugAssert                    ; 34E0 _ E8, FFFFCD66
?_324:
000034E5        mov     qword ptr [rbp-50H], 0          ; 34E5 _ 48: C7. 45, B0, 00000000
000034ED        mov     rcx, r14                        ; 34ED _ 4C: 89. F1
000034F0        call    _HiiGetSupportedLanguages       ; 34F0 _ E8, 0000013F
000034F5        mov     r15, rax                        ; 34F5 _ 49: 89. C7
000034F8        xor     r13d, r13d                      ; 34F8 _ 45: 31. ED
000034FB        test    r15, r15                        ; 34FB _ 4D: 85. FF
000034FE        mov     edi, 0                          ; 34FE _ BF, 00000000
00003503        je      ?_327                           ; 3503 _ 0F 84, 000000FC
00003509        lea     rcx, ptr [?_670]                ; 3509 _ 48: 8D. 0D, 000044F6(rel)
00003510        lea     rdx, ptr [rbp-50H]              ; 3510 _ 48: 8D. 55, B0
00003514        xor     r13d, r13d                      ; 3514 _ 45: 31. ED
00003517        xor     r8d, r8d                        ; 3517 _ 45: 31. C0
0000351A        call    _GetEfiGlobalVariable2          ; 351A _ E8, FFFFFCA9
0000351F        mov     rax, qword ptr [rbp-50H]        ; 351F _ 48: 8B. 45, B0
00003523        mov     qword ptr [rsp+20H], r15        ; 3523 _ 4C: 89. 7C 24, 20
00003528        mov     qword ptr [rsp+28H], 0          ; 3528 _ 48: C7. 44 24, 28, 00000000
00003531        lea     r9, ptr [?_645]                 ; 3531 _ 4C: 8D. 0D, 00004012(rel)
00003538        test    r12, r12                        ; 3538 _ 4D: 85. E4
0000353B        cmove   r12, r9                         ; 353B _ 4D: 0F 44. E1
0000353F        test    rax, rax                        ; 353F _ 48: 85. C0
00003542        cmovne  r9, rax                         ; 3542 _ 4C: 0F 45. C8
00003546        mov     rcx, r15                        ; 3546 _ 4C: 89. F9
00003549        xor     edx, edx                        ; 3549 _ 31. D2
0000354B        mov     r8, r12                         ; 354B _ 4D: 89. E0
0000354E        call    _GetBestLanguage                ; 354E _ E8, FFFFFC8A
00003553        mov     rsi, rax                        ; 3553 _ 48: 89. C6
00003556        test    rsi, rsi                        ; 3556 _ 48: 85. F6
00003559        mov     edi, 0                          ; 3559 _ BF, 00000000
0000355E        je      ?_326                           ; 355E _ 0F 84, 00000099
00003564        mov     qword ptr [rbp-40H], 0          ; 3564 _ 48: C7. 45, C0, 00000000
0000356C        mov     rax, qword ptr [_gHiiString]    ; 356C _ 48: 8B. 05, 00005BED(rel)
00003573        lea     r12, ptr [rbp-40H]              ; 3573 _ 4C: 8D. 65, C0
00003577        mov     qword ptr [rsp+28H], r12        ; 3577 _ 4C: 89. 64 24, 28
0000357C        lea     rcx, ptr [rbp-42H]              ; 357C _ 48: 8D. 4D, BE
00003580        mov     qword ptr [rsp+20H], rcx        ; 3580 _ 48: 89. 4C 24, 20
00003585        mov     qword ptr [rsp+30H], 0          ; 3585 _ 48: C7. 44 24, 30, 00000000
0000358E        movzx   ebx, bx                         ; 358E _ 0F B7. DB
00003591        mov     rcx, rax                        ; 3591 _ 48: 89. C1
00003594        mov     rdx, rsi                        ; 3594 _ 48: 89. F2
00003597        mov     r8, r14                         ; 3597 _ 4D: 89. F0
0000359A        mov     r9d, ebx                        ; 359A _ 41: 89. D9
0000359D        call    qword ptr [rax+8H]              ; 359D _ FF. 50, 08
000035A0        xor     edi, edi                        ; 35A0 _ 31. FF
000035A2        mov     rcx, 5H                         ; 35A2 _ 48: B9, 8000000000000005
000035AC        cmp     rax, rcx                        ; 35AC _ 48: 39. C8
000035AF        jnz     ?_325                           ; 35AF _ 75, 49
000035B1        mov     rcx, qword ptr [rbp-40H]        ; 35B1 _ 48: 8B. 4D, C0
000035B5        call    _AllocateZeroPool               ; 35B5 _ E8, FFFFE0E5
000035BA        mov     rdi, rax                        ; 35BA _ 48: 89. C7
000035BD        test    rdi, rdi                        ; 35BD _ 48: 85. FF
000035C0        jz      ?_325                           ; 35C0 _ 74, 38
000035C2        mov     rax, qword ptr [_gHiiString]    ; 35C2 _ 48: 8B. 05, 00005B97(rel)
000035C9        mov     qword ptr [rsp+28H], r12        ; 35C9 _ 4C: 89. 64 24, 28
000035CE        mov     qword ptr [rsp+20H], rdi        ; 35CE _ 48: 89. 7C 24, 20
000035D3        mov     qword ptr [rsp+30H], 0          ; 35D3 _ 48: C7. 44 24, 30, 00000000
000035DC        mov     rcx, rax                        ; 35DC _ 48: 89. C1
000035DF        mov     rdx, rsi                        ; 35DF _ 48: 89. F2
000035E2        mov     r8, r14                         ; 35E2 _ 4D: 89. F0
000035E5        mov     r9d, ebx                        ; 35E5 _ 41: 89. D9
000035E8        call    qword ptr [rax+8H]              ; 35E8 _ FF. 50, 08
000035EB        test    rax, rax                        ; 35EB _ 48: 85. C0
000035EE        jns     ?_325                           ; 35EE _ 79, 0A
000035F0        mov     rcx, rdi                        ; 35F0 _ 48: 89. F9
000035F3        call    _FreePool                       ; 35F3 _ E8, FFFFE15F
000035F8        xor     edi, edi                        ; 35F8 _ 31. FF
?_325:
000035FA        mov     r13, rsi                        ; 35FA _ 49: 89. F5
?_326:
000035FD        mov     rcx, r15                        ; 35FD _ 4C: 89. F9
00003600        call    _FreePool                       ; 3600 _ E8, FFFFE152
?_327:
00003605        mov     rcx, qword ptr [rbp-50H]        ; 3605 _ 48: 8B. 4D, B0
00003609        test    rcx, rcx                        ; 3609 _ 48: 85. C9
0000360C        jz      ?_328                           ; 360C _ 74, 05
0000360E        call    _FreePool                       ; 360E _ E8, FFFFE144
?_328:
00003613        test    r13, r13                        ; 3613 _ 4D: 85. ED
00003616        jz      ?_329                           ; 3616 _ 74, 08
00003618        mov     rcx, r13                        ; 3618 _ 4C: 89. E9
0000361B        call    _FreePool                       ; 361B _ E8, FFFFE137
?_329:
00003620        mov     rax, rdi                        ; 3620 _ 48: 89. F8
00003623        add     rsp, 88                         ; 3623 _ 48: 83. C4, 58
00003627        pop     rbx                             ; 3627 _ 5B
00003628        pop     rdi                             ; 3628 _ 5F
00003629        pop     rsi                             ; 3629 _ 5E
0000362A        pop     r12                             ; 362A _ 41: 5C
0000362C        pop     r13                             ; 362C _ 41: 5D
0000362E        pop     r14                             ; 362E _ 41: 5E
00003630        pop     r15                             ; 3630 _ 41: 5F
00003632        pop     rbp                             ; 3632 _ 5D
00003633        ret                                     ; 3633 _ C3
_HiiGetString ENDP

_HiiGetSupportedLanguages PROC
00003634        push    rbp                             ; 3634 _ 55
00003635        mov     rbp, rsp                        ; 3635 _ 48: 89. E5
00003638        push    rsi                             ; 3638 _ 56
00003639        push    rdi                             ; 3639 _ 57
0000363A        sub     rsp, 48                         ; 363A _ 48: 83. EC, 30
0000363E        mov     rsi, rcx                        ; 363E _ 48: 89. CE
00003641        call    _DebugAssertEnabled             ; 3641 _ E8, FFFFCC06
00003646        test    al, al                          ; 3646 _ 84. C0
00003648        jz      ?_330                           ; 3648 _ 74, 1D
0000364A        test    rsi, rsi                        ; 364A _ 48: 85. F6
0000364D        jnz     ?_330                           ; 364D _ 75, 18
0000364F        lea     rcx, ptr [?_646]                ; 364F _ 48: 8D. 0D, 00003EF5(rel)
00003656        lea     r8, ptr [?_642]                 ; 3656 _ 4C: 8D. 05, 00003E66(rel)
0000365D        mov     edx, 47                         ; 365D _ BA, 0000002F
00003662        call    _DebugAssert                    ; 3662 _ E8, FFFFCBE4
?_330:
00003667        mov     qword ptr [rbp-18H], 0          ; 3667 _ 48: C7. 45, E8, 00000000
0000366F        mov     rax, qword ptr [_gHiiString]    ; 366F _ 48: 8B. 05, 00005AEA(rel)
00003676        lea     r8, ptr [rbp-19H]               ; 3676 _ 4C: 8D. 45, E7
0000367A        lea     r9, ptr [rbp-18H]               ; 367A _ 4C: 8D. 4D, E8
0000367E        mov     rcx, rax                        ; 367E _ 48: 89. C1
00003681        mov     rdx, rsi                        ; 3681 _ 48: 89. F2
00003684        call    qword ptr [rax+18H]             ; 3684 _ FF. 50, 18
00003687        mov     rcx, rax                        ; 3687 _ 48: 89. C1
0000368A        xor     eax, eax                        ; 368A _ 31. C0
0000368C        mov     rdx, 5H                         ; 368C _ 48: BA, 8000000000000005
00003696        cmp     rcx, rdx                        ; 3696 _ 48: 39. D1
00003699        jnz     ?_332                           ; 3699 _ 75, 3E
0000369B        mov     rcx, qword ptr [rbp-18H]        ; 369B _ 48: 8B. 4D, E8
0000369F        call    _AllocateZeroPool               ; 369F _ E8, FFFFDFFB
000036A4        mov     rdi, rax                        ; 36A4 _ 48: 89. C7
000036A7        xor     eax, eax                        ; 36A7 _ 31. C0
000036A9        test    rdi, rdi                        ; 36A9 _ 48: 85. FF
000036AC        jz      ?_332                           ; 36AC _ 74, 2B
000036AE        mov     rax, qword ptr [_gHiiString]    ; 36AE _ 48: 8B. 05, 00005AAB(rel)
000036B5        lea     r9, ptr [rbp-18H]               ; 36B5 _ 4C: 8D. 4D, E8
000036B9        mov     rcx, rax                        ; 36B9 _ 48: 89. C1
000036BC        mov     rdx, rsi                        ; 36BC _ 48: 89. F2
000036BF        mov     r8, rdi                         ; 36BF _ 49: 89. F8
000036C2        call    qword ptr [rax+18H]             ; 36C2 _ FF. 50, 18
000036C5        test    rax, rax                        ; 36C5 _ 48: 85. C0
000036C8        js      ?_331                           ; 36C8 _ 78, 05
000036CA        mov     rax, rdi                        ; 36CA _ 48: 89. F8
000036CD        jmp     ?_332                           ; 36CD _ EB, 0A

?_331:
000036CF        mov     rcx, rdi                        ; 36CF _ 48: 89. F9
000036D2        call    _FreePool                       ; 36D2 _ E8, FFFFE080
000036D7        xor     eax, eax                        ; 36D7 _ 31. C0
?_332:
000036D9        add     rsp, 48                         ; 36D9 _ 48: 83. C4, 30
000036DD        pop     rdi                             ; 36DD _ 5F
000036DE        pop     rsi                             ; 36DE _ 5E
000036DF        pop     rbp                             ; 36DF _ 5D
000036E0        ret                                     ; 36E0 _ C3
_HiiGetSupportedLanguages ENDP

_DxeServicesTableLibConstructor PROC
000036E1        push    rbp                             ; 36E1 _ 55
000036E2        mov     rbp, rsp                        ; 36E2 _ 48: 89. E5
000036E5        push    rsi                             ; 36E5 _ 56
000036E6        sub     rsp, 40                         ; 36E6 _ 48: 83. EC, 28
000036EA        lea     rcx, ptr [_gEfiDxeServicesTableGuid]; 36EA _ 48: 8D. 0D, 000057A7(rel)
000036F1        lea     rdx, ptr [_gDS]                 ; 36F1 _ 48: 8D. 15, 00005A88(rel)
000036F8        call    _EfiGetSystemConfigurationTable ; 36F8 _ E8, FFFFF8D2
000036FD        mov     rsi, rax                        ; 36FD _ 48: 89. C6
00003700        call    _DebugAssertEnabled             ; 3700 _ E8, FFFFCB47
00003705        test    al, al                          ; 3705 _ 84. C0
00003707        jz      ?_334                           ; 3707 _ 74, 48
00003709        test    rsi, rsi                        ; 3709 _ 48: 85. F6
0000370C        jns     ?_334                           ; 370C _ 79, 43
0000370E        call    _DebugPrintEnabled              ; 370E _ E8, FFFFCB3C
00003713        test    al, al                          ; 3713 _ 84. C0
00003715        jz      ?_333                           ; 3715 _ 74, 22
00003717        mov     ecx, 2147483648                 ; 3717 _ B9, 80000000
0000371C        call    _DebugPrintLevelEnabled         ; 371C _ E8, FFFFCB31
00003721        test    al, al                          ; 3721 _ 84. C0
00003723        jz      ?_333                           ; 3723 _ 74, 14
00003725        lea     rdx, ptr [?_561]                ; 3725 _ 48: 8D. 15, 00002BA1(rel)
0000372C        mov     ecx, 2147483648                 ; 372C _ B9, 80000000
00003731        mov     r8, rsi                         ; 3731 _ 49: 89. F0
00003734        call    _DebugPrint                     ; 3734 _ E8, FFFFCB07
?_333:
00003739        lea     rcx, ptr [?_647]                ; 3739 _ 48: 8D. 0D, 00003E6C(rel)
00003740        lea     r8, ptr [?_562]                 ; 3740 _ 4C: 8D. 05, 00002BA7(rel)
00003747        mov     edx, 64                         ; 3747 _ BA, 00000040
0000374C        call    _DebugAssert                    ; 374C _ E8, FFFFCAFA
?_334:
00003751        call    _DebugAssertEnabled             ; 3751 _ E8, FFFFCAF6
00003756        test    al, al                          ; 3756 _ 84. C0
00003758        jz      ?_335                           ; 3758 _ 74, 24
0000375A        mov     rax, qword ptr [_gDS]           ; 375A _ 48: 8B. 05, 00005A1F(rel)
00003761        test    rax, rax                        ; 3761 _ 48: 85. C0
00003764        jnz     ?_335                           ; 3764 _ 75, 18
00003766        lea     rcx, ptr [?_647]                ; 3766 _ 48: 8D. 0D, 00003E3F(rel)
0000376D        lea     r8, ptr [?_648]                 ; 376D _ 4C: 8D. 05, 00003EA4(rel)
00003774        mov     edx, 65                         ; 3774 _ BA, 00000041
00003779        call    _DebugAssert                    ; 3779 _ E8, FFFFCACD
?_335:
0000377E        mov     rax, rsi                        ; 377E _ 48: 89. F0
00003781        add     rsp, 40                         ; 3781 _ 48: 83. C4, 28
00003785        pop     rsi                             ; 3785 _ 5E
00003786        pop     rbp                             ; 3786 _ 5D
00003787        ret                                     ; 3787 _ C3
_DxeServicesTableLibConstructor ENDP

__DriverUnloadHandler PROC
00003788        push    rbp                             ; 3788 _ 55
00003789        mov     rbp, rsp                        ; 3789 _ 48: 89. E5
0000378C        push    rsi                             ; 378C _ 56
0000378D        push    rdi                             ; 378D _ 57
0000378E        sub     rsp, 32                         ; 378E _ 48: 83. EC, 20
00003792        mov     rsi, rcx                        ; 3792 _ 48: 89. CE
00003795        call    _ProcessModuleUnloadList        ; 3795 _ E8, 00002B30
0000379A        mov     rdi, rax                        ; 379A _ 48: 89. C7
0000379D        test    rdi, rdi                        ; 379D _ 48: 85. FF
000037A0        js      ?_336                           ; 37A0 _ 78, 0F
000037A2        mov     rdx, qword ptr [_gST]           ; 37A2 _ 48: 8B. 15, 00005997(rel)
000037A9        mov     rcx, rsi                        ; 37A9 _ 48: 89. F1
000037AC        call    _ProcessLibraryDestructorList   ; 37AC _ E8, 00002B13
?_336:
000037B1        mov     rax, rdi                        ; 37B1 _ 48: 89. F8
000037B4        add     rsp, 32                         ; 37B4 _ 48: 83. C4, 20
000037B8        pop     rdi                             ; 37B8 _ 5F
000037B9        pop     rsi                             ; 37B9 _ 5E
000037BA        pop     rbp                             ; 37BA _ 5D
000037BB        ret                                     ; 37BB _ C3
__DriverUnloadHandler ENDP

__ModuleEntryPoint PROC
000037BC        push    rbp                             ; 37BC _ 55
000037BD        mov     rbp, rsp                        ; 37BD _ 48: 89. E5
000037C0        push    rsi                             ; 37C0 _ 56
000037C1        push    rdi                             ; 37C1 _ 57
000037C2        push    rbx                             ; 37C2 _ 53
000037C3        sub     rsp, 40                         ; 37C3 _ 48: 83. EC, 28
000037C7        mov     rsi, rdx                        ; 37C7 _ 48: 89. D6
000037CA        mov     rdi, rcx                        ; 37CA _ 48: 89. CF
000037CD        mov     eax, dword ptr [__gUefiDriverRevision]; 37CD _ 8B. 05, 0000422D(rel)
000037D3        test    eax, eax                        ; 37D3 _ 85. C0
000037D5        jz      ?_337                           ; 37D5 _ 74, 13
000037D7        mov     rbx, 19H                        ; 37D7 _ 48: BB, 8000000000000019
000037E1        cmp     dword ptr [rsi+8H], eax         ; 37E1 _ 39. 46, 08
000037E4        jc      ?_341                           ; 37E4 _ 0F 82, 000000B0
?_337:
000037EA        mov     rcx, rdi                        ; 37EA _ 48: 89. F9
000037ED        mov     rdx, rsi                        ; 37ED _ 48: 89. F2
000037F0        call    _ProcessLibraryConstructorList  ; 37F0 _ E8, 000028D8
000037F5        cmp     byte ptr [__gDriverUnloadImageCount], 0; 37F5 _ 80. 3D, 00004208(rel), 00
000037FC        jz      ?_340                           ; 37FC _ 74, 7E
000037FE        mov     rax, qword ptr [_gBS]           ; 37FE _ 48: 8B. 05, 00005943(rel)
00003805        lea     rdx, ptr [_gEfiLoadedImageProtocolGuid]; 3805 _ 48: 8D. 15, 000056CC(rel)
0000380C        lea     r8, ptr [rbp-20H]               ; 380C _ 4C: 8D. 45, E0
00003810        mov     rcx, rdi                        ; 3810 _ 48: 89. F9
00003813        call    qword ptr [rax+98H]             ; 3813 _ FF. 90, 00000098
00003819        mov     rbx, rax                        ; 3819 _ 48: 89. C3
0000381C        call    _DebugAssertEnabled             ; 381C _ E8, FFFFCA2B
00003821        test    al, al                          ; 3821 _ 84. C0
00003823        jz      ?_339                           ; 3823 _ 74, 48
00003825        test    rbx, rbx                        ; 3825 _ 48: 85. DB
00003828        jns     ?_339                           ; 3828 _ 79, 43
0000382A        call    _DebugPrintEnabled              ; 382A _ E8, FFFFCA20
0000382F        test    al, al                          ; 382F _ 84. C0
00003831        jz      ?_338                           ; 3831 _ 74, 22
00003833        mov     ecx, 2147483648                 ; 3833 _ B9, 80000000
00003838        call    _DebugPrintLevelEnabled         ; 3838 _ E8, FFFFCA15
0000383D        test    al, al                          ; 383D _ 84. C0
0000383F        jz      ?_338                           ; 383F _ 74, 14
00003841        lea     rdx, ptr [?_561]                ; 3841 _ 48: 8D. 15, 00002A85(rel)
00003848        mov     ecx, 2147483648                 ; 3848 _ B9, 80000000
0000384D        mov     r8, rbx                         ; 384D _ 49: 89. D8
00003850        call    _DebugPrint                     ; 3850 _ E8, FFFFC9EB
?_338:
00003855        lea     rcx, ptr [?_649]                ; 3855 _ 48: 8D. 0D, 00003DD0(rel)
0000385C        lea     r8, ptr [?_562]                 ; 385C _ 4C: 8D. 05, 00002A8B(rel)
00003863        mov     edx, 126                        ; 3863 _ BA, 0000007E
00003868        call    _DebugAssert                    ; 3868 _ E8, FFFFC9DE
?_339:
0000386D        mov     rax, qword ptr [rbp-20H]        ; 386D _ 48: 8B. 45, E0
00003871        lea     rcx, ptr [__DriverUnloadHandler]; 3871 _ 48: 8D. 0D, FFFFFF10(rel)
00003878        mov     qword ptr [rax+58H], rcx        ; 3878 _ 48: 89. 48, 58
?_340:
0000387C        mov     rcx, rdi                        ; 387C _ 48: 89. F9
0000387F        mov     rdx, rsi                        ; 387F _ 48: 89. F2
00003882        call    _ProcessModuleEntryPointList    ; 3882 _ E8, 00002A3E
00003887        mov     rbx, rax                        ; 3887 _ 48: 89. C3
0000388A        test    rbx, rbx                        ; 388A _ 48: 85. DB
0000388D        jns     ?_341                           ; 388D _ 79, 0B
0000388F        mov     rcx, rdi                        ; 388F _ 48: 89. F9
00003892        mov     rdx, rsi                        ; 3892 _ 48: 89. F2
00003895        call    _ProcessLibraryDestructorList   ; 3895 _ E8, 00002A2A
?_341:
0000389A        mov     rax, rbx                        ; 389A _ 48: 89. D8
0000389D        add     rsp, 40                         ; 389D _ 48: 83. C4, 28
000038A1        pop     rbx                             ; 38A1 _ 5B
000038A2        pop     rdi                             ; 38A2 _ 5F
000038A3        pop     rsi                             ; 38A3 _ 5E
000038A4        pop     rbp                             ; 38A4 _ 5D
000038A5        ret                                     ; 38A5 _ C3
__ModuleEntryPoint ENDP

_PerformUpdateOnFirmwareVolume PROC
000038A6        push    rbp                             ; 38A6 _ 55
000038A7        mov     rbp, rsp                        ; 38A7 _ 48: 89. E5
000038AA        push    r15                             ; 38AA _ 41: 57
000038AC        push    r14                             ; 38AC _ 41: 56
000038AE        push    r13                             ; 38AE _ 41: 55
000038B0        push    r12                             ; 38B0 _ 41: 54
000038B2        push    rsi                             ; 38B2 _ 56
000038B3        push    rdi                             ; 38B3 _ 57
000038B4        push    rbx                             ; 38B4 _ 53
000038B5        sub     rsp, 120                        ; 38B5 _ 48: 83. EC, 78
000038B9        mov     dword ptr [rbp-74H], r9d        ; 38B9 _ 44: 89. 4D, 8C
000038BD        mov     qword ptr [rbp-70H], r8         ; 38BD _ 4C: 89. 45, 90
000038C1        mov     qword ptr [rbp-68H], rdx        ; 38C1 _ 48: 89. 55, 98
000038C5        mov     rdi, rcx                        ; 38C5 _ 48: 89. CF
000038C8        mov     qword ptr [rbp-50H], 0          ; 38C8 _ 48: C7. 45, B0, 00000000
000038D0        mov     rax, qword ptr [_gBS]           ; 38D0 _ 48: 8B. 05, 00005871(rel)
000038D7        lea     rcx, ptr [rbp-50H]              ; 38D7 _ 48: 8D. 4D, B0
000038DB        mov     qword ptr [rsp+20H], rcx        ; 38DB _ 48: 89. 4C 24, 20
000038E0        lea     rdx, ptr [_gEfiFirmwareVolumeBlockProtocolGuid]; 38E0 _ 48: 8D. 15, 000055E1(rel)
000038E7        lea     r9, ptr [rbp-48H]               ; 38E7 _ 4C: 8D. 4D, B8
000038EB        mov     ecx, 2                          ; 38EB _ B9, 00000002
000038F0        xor     r8d, r8d                        ; 38F0 _ 45: 31. C0
000038F3        call    qword ptr [rax+138H]            ; 38F3 _ FF. 90, 00000138
000038F9        mov     rcx, qword ptr [rbp-50H]        ; 38F9 _ 48: 8B. 4D, B0
000038FD        test    rax, rax                        ; 38FD _ 48: 85. C0
00003900        js      ?_342                           ; 3900 _ 78, 0E
00003902        mov     rax, qword ptr [rbp-48H]        ; 3902 _ 48: 8B. 45, B8
00003906        test    rax, rax                        ; 3906 _ 48: 85. C0
00003909        jz      ?_342                           ; 3909 _ 74, 05
0000390B        test    rcx, rcx                        ; 390B _ 48: 85. C9
0000390E        jnz     ?_343                           ; 390E _ 75, 27
?_342:
00003910        mov     rbx, 0EH                        ; 3910 _ 48: BB, 800000000000000E
0000391A        test    rcx, rcx                        ; 391A _ 48: 85. C9
0000391D        je      ?_352                           ; 391D _ 0F 84, 00000158
00003923        call    _FreePool                       ; 3923 _ E8, FFFFDE2F
00003928        mov     rbx, 0EH                        ; 3928 _ 48: BB, 800000000000000E
00003932        jmp     ?_352                           ; 3932 _ E9, 00000144

?_343:
00003937        mov     qword ptr [rbp-40H], 0          ; 3937 _ 48: C7. 45, C0, 00000000
0000393F        xor     r12d, r12d                      ; 393F _ 45: 31. E4
00003942        lea     r13, ptr [_gEfiFirmwareVolumeBlockProtocolGuid]; 3942 _ 4C: 8D. 2D, 0000557F(rel)
00003949        lea     rsi, ptr [rbp-40H]              ; 3949 _ 48: 8D. 75, C0
0000394D        lea     r14, ptr [rbp-5CH]              ; 394D _ 4C: 8D. 75, A4
00003951        lea     r15, ptr [rbp-58H]              ; 3951 _ 4C: 8D. 7D, A8
00003955        jmp     ?_346                           ; 3955 _ EB, 15

?_344:
00003957        mov     rax, qword ptr [rbp-58H]        ; 3957 _ 48: 8B. 45, A8
0000395B        cmp     rax, qword ptr [rdi+10H]        ; 395B _ 48: 3B. 47, 10
0000395F        je      ?_348                           ; 395F _ 0F 84, 0000008B
?_345:
00003965        inc     r12                             ; 3965 _ 49: FF. C4
00003968        mov     rax, qword ptr [rbp-48H]        ; 3968 _ 48: 8B. 45, B8
?_346:
0000396C        cmp     r12, rax                        ; 396C _ 49: 39. C4
0000396F        jnc     ?_347                           ; 396F _ 73, 4C
00003971        mov     rax, qword ptr [rbp-50H]        ; 3971 _ 48: 8B. 45, B0
00003975        mov     rcx, qword ptr [rax+r12*8]      ; 3975 _ 4A: 8B. 0C E0
00003979        mov     rax, qword ptr [_gBS]           ; 3979 _ 48: 8B. 05, 000057C8(rel)
00003980        mov     rdx, r13                        ; 3980 _ 4C: 89. EA
00003983        mov     r8, rsi                         ; 3983 _ 49: 89. F0
00003986        call    qword ptr [rax+98H]             ; 3986 _ FF. 90, 00000098
0000398C        test    rax, rax                        ; 398C _ 48: 85. C0
0000398F        js      ?_347                           ; 398F _ 78, 2C
00003991        mov     rax, qword ptr [rbp-40H]        ; 3991 _ 48: 8B. 45, C0
00003995        mov     rcx, rax                        ; 3995 _ 48: 89. C1
00003998        mov     rdx, r14                        ; 3998 _ 4C: 89. F2
0000399B        call    qword ptr [rax]                 ; 399B _ FF. 10
0000399D        test    rax, rax                        ; 399D _ 48: 85. C0
000039A0        js      ?_345                           ; 39A0 _ 78, C3
000039A2        test    byte ptr [rbp-5CH], 20H         ; 39A2 _ F6. 45, A4, 20
000039A6        jz      ?_345                           ; 39A6 _ 74, BD
000039A8        mov     rax, qword ptr [rbp-40H]        ; 39A8 _ 48: 8B. 45, C0
000039AC        mov     rcx, rax                        ; 39AC _ 48: 89. C1
000039AF        mov     rdx, r15                        ; 39AF _ 4C: 89. FA
000039B2        call    qword ptr [rax+10H]             ; 39B2 _ FF. 50, 10
000039B5        mov     rbx, rax                        ; 39B5 _ 48: 89. C3
000039B8        test    rbx, rbx                        ; 39B8 _ 48: 85. DB
000039BB        jns     ?_344                           ; 39BB _ 79, 9A
?_347:
000039BD        mov     rbx, 0EH                        ; 39BD _ 48: BB, 800000000000000E
000039C7        mov     rcx, qword ptr [rbp-50H]        ; 39C7 _ 48: 8B. 4D, B0
000039CB        test    rcx, rcx                        ; 39CB _ 48: 85. C9
000039CE        je      ?_352                           ; 39CE _ 0F 84, 000000A7
000039D4        call    _FreePool                       ; 39D4 _ E8, FFFFDD7E
000039D9        mov     qword ptr [rbp-50H], 0          ; 39D9 _ 48: C7. 45, B0, 00000000
000039E1        mov     rbx, 0EH                        ; 39E1 _ 48: BB, 800000000000000E
000039EB        jmp     ?_352                           ; 39EB _ E9, 0000008B

?_348:
000039F0        mov     eax, dword ptr [rdi+8H]         ; 39F0 _ 8B. 47, 08
000039F3        cmp     eax, 1                          ; 39F3 _ 83. F8, 01
000039F6        jz      ?_349                           ; 39F6 _ 74, 38
000039F8        test    eax, eax                        ; 39F8 _ 85. C0
000039FA        jnz     ?_351                           ; 39FA _ 75, 69
000039FC        mov     rbx, 2H                         ; 39FC _ 48: BB, 8000000000000002
00003A06        mov     eax, dword ptr [rbp-74H]        ; 3A06 _ 8B. 45, 8C
00003A09        cmp     al, 11                          ; 3A09 _ 3C, 0B
00003A0B        jnz     ?_351                           ; 3A0B _ 75, 58
00003A0D        mov     rax, qword ptr [rbp-50H]        ; 3A0D _ 48: 8B. 45, B0
00003A11        mov     rcx, qword ptr [rax+r12*8]      ; 3A11 _ 4A: 8B. 0C E0
00003A15        mov     rdx, qword ptr [rbp-40H]        ; 3A15 _ 48: 8B. 55, C0
00003A19        mov     rax, qword ptr [rbp-70H]        ; 3A19 _ 48: 8B. 45, 90
00003A1D        mov     qword ptr [rsp+20H], rax        ; 3A1D _ 48: 89. 44 24, 20
00003A22        mov     r8, rdi                         ; 3A22 _ 49: 89. F8
00003A25        mov     r9, qword ptr [rbp-68H]         ; 3A25 _ 4C: 8B. 4D, 98
00003A29        call    _PerformUpdateOnWholeFv         ; 3A29 _ E8, 00001C3B
00003A2E        jmp     ?_350                           ; 3A2E _ EB, 32

?_349:
00003A30        mov     rax, qword ptr [rbp-50H]        ; 3A30 _ 48: 8B. 45, B0
00003A34        mov     rcx, qword ptr [rax+r12*8]      ; 3A34 _ 4A: 8B. 0C E0
00003A38        mov     rdx, qword ptr [rbp-40H]        ; 3A38 _ 48: 8B. 55, C0
00003A3C        mov     eax, dword ptr [rbp+30H]        ; 3A3C _ 8B. 45, 30
00003A3F        mov     dword ptr [rsp+30H], eax        ; 3A3F _ 89. 44 24, 30
00003A43        mov     eax, dword ptr [rbp-74H]        ; 3A43 _ 8B. 45, 8C
00003A46        movzx   eax, al                         ; 3A46 _ 0F B6. C0
00003A49        mov     dword ptr [rsp+28H], eax        ; 3A49 _ 89. 44 24, 28
00003A4D        mov     rax, qword ptr [rbp-70H]        ; 3A4D _ 48: 8B. 45, 90
00003A51        mov     qword ptr [rsp+20H], rax        ; 3A51 _ 48: 89. 44 24, 20
00003A56        mov     r8, rdi                         ; 3A56 _ 49: 89. F8
00003A59        mov     r9, qword ptr [rbp-68H]         ; 3A59 _ 4C: 8B. 4D, 98
00003A5D        call    _PerformUpdateOnFvFile          ; 3A5D _ E8, 00001D73
?_350:
00003A62        mov     rbx, rax                        ; 3A62 _ 48: 89. C3
?_351:
00003A65        mov     rcx, qword ptr [rbp-50H]        ; 3A65 _ 48: 8B. 4D, B0
00003A69        test    rcx, rcx                        ; 3A69 _ 48: 85. C9
00003A6C        jz      ?_352                           ; 3A6C _ 74, 0D
00003A6E        call    _FreePool                       ; 3A6E _ E8, FFFFDCE4
00003A73        mov     qword ptr [rbp-50H], 0          ; 3A73 _ 48: C7. 45, B0, 00000000
?_352:
00003A7B        mov     rax, rbx                        ; 3A7B _ 48: 89. D8
00003A7E        add     rsp, 120                        ; 3A7E _ 48: 83. C4, 78
00003A82        pop     rbx                             ; 3A82 _ 5B
00003A83        pop     rdi                             ; 3A83 _ 5F
00003A84        pop     rsi                             ; 3A84 _ 5E
00003A85        pop     r12                             ; 3A85 _ 41: 5C
00003A87        pop     r13                             ; 3A87 _ 41: 5D
00003A89        pop     r14                             ; 3A89 _ 41: 5E
00003A8B        pop     r15                             ; 3A8B _ 41: 5F
00003A8D        pop     rbp                             ; 3A8D _ 5D
00003A8E        ret                                     ; 3A8E _ C3
_PerformUpdateOnFirmwareVolume ENDP

_PerformUpdateOnFlashArea PROC
00003A8F        push    rbp                             ; 3A8F _ 55
00003A90        mov     rbp, rsp                        ; 3A90 _ 48: 89. E5
00003A93        push    r15                             ; 3A93 _ 41: 57
00003A95        push    r14                             ; 3A95 _ 41: 56
00003A97        push    r13                             ; 3A97 _ 41: 55
00003A99        push    r12                             ; 3A99 _ 41: 54
00003A9B        push    rsi                             ; 3A9B _ 56
00003A9C        push    rdi                             ; 3A9C _ 57
00003A9D        push    rbx                             ; 3A9D _ 53
00003A9E        sub     rsp, 120                        ; 3A9E _ 48: 83. EC, 78
00003AA2        mov     rdi, r8                         ; 3AA2 _ 4C: 89. C7
00003AA5        mov     qword ptr [rbp-70H], rdx        ; 3AA5 _ 48: 89. 55, 90
00003AA9        mov     qword ptr [rbp-78H], rcx        ; 3AA9 _ 48: 89. 4D, 88
00003AAD        mov     r14, qword ptr [rcx+10H]        ; 3AAD _ 4C: 8B. 71, 10
00003AB1        mov     qword ptr [rbp-50H], 0          ; 3AB1 _ 48: C7. 45, B0, 00000000
00003AB9        mov     rcx, qword ptr [_gHiiHandle]    ; 3AB9 _ 48: 8B. 0D, 000056C8(rel)
00003AC0        mov     edx, 4                          ; 3AC0 _ BA, 00000004
00003AC5        xor     r8d, r8d                        ; 3AC5 _ 45: 31. C0
00003AC8        call    _HiiGetString                   ; 3AC8 _ E8, FFFFF9B1
00003ACD        mov     rsi, rax                        ; 3ACD _ 48: 89. C6
00003AD0        test    rsi, rsi                        ; 3AD0 _ 48: 85. F6
00003AD3        jz      ?_353                           ; 3AD3 _ 74, 17
00003AD5        lea     r8, ptr [r14+rdi]               ; 3AD5 _ 4D: 8D. 04 3E
00003AD9        mov     rcx, rsi                        ; 3AD9 _ 48: 89. F1
00003ADC        mov     rdx, r14                        ; 3ADC _ 4C: 89. F2
00003ADF        call    _Print                          ; 3ADF _ E8, FFFFF452
00003AE4        mov     rcx, rsi                        ; 3AE4 _ 48: 89. F1
00003AE7        call    _FreePool                       ; 3AE7 _ E8, FFFFDC6B
?_353:
00003AEC        mov     rsi, rdi                        ; 3AEC _ 48: 89. FE
00003AEF        mov     rax, qword ptr [_gBS]           ; 3AEF _ 48: 8B. 05, 00005652(rel)
00003AF6        lea     rcx, ptr [rbp-50H]              ; 3AF6 _ 48: 8D. 4D, B0
00003AFA        mov     qword ptr [rsp+20H], rcx        ; 3AFA _ 48: 89. 4C 24, 20
00003AFF        lea     rdx, ptr [_gEfiFirmwareVolumeBlockProtocolGuid]; 3AFF _ 48: 8D. 15, 000053C2(rel)
00003B06        lea     r9, ptr [rbp-48H]               ; 3B06 _ 4C: 8D. 4D, B8
00003B0A        mov     ecx, 2                          ; 3B0A _ B9, 00000002
00003B0F        xor     r8d, r8d                        ; 3B0F _ 45: 31. C0
00003B12        call    qword ptr [rax+138H]            ; 3B12 _ FF. 90, 00000138
00003B18        mov     r15, rax                        ; 3B18 _ 49: 89. C7
00003B1B        mov     rcx, qword ptr [rbp-50H]        ; 3B1B _ 48: 8B. 4D, B0
00003B1F        test    r15, r15                        ; 3B1F _ 4D: 85. FF
00003B22        js      ?_360                           ; 3B22 _ 0F 88, 00000169
00003B28        mov     rax, qword ptr [rbp-48H]        ; 3B28 _ 48: 8B. 45, B8
00003B2C        test    rax, rax                        ; 3B2C _ 48: 85. C0
00003B2F        je      ?_360                           ; 3B2F _ 0F 84, 0000015C
00003B35        test    rcx, rcx                        ; 3B35 _ 48: 85. C9
00003B38        je      ?_360                           ; 3B38 _ 0F 84, 00000153
00003B3E        lea     r13, ptr [_gEfiFirmwareVolumeBlockProtocolGuid]; 3B3E _ 4C: 8D. 2D, 00005383(rel)
00003B45        lea     rdi, ptr [rbp-40H]              ; 3B45 _ 48: 8D. 7D, C0
00003B49        lea     r12, ptr [rbp-64H]              ; 3B49 _ 4C: 8D. 65, 9C
00003B4D        jmp     ?_356                           ; 3B4D _ EB, 67

?_354:
00003B4F        mov     qword ptr [rsp+28H], r12        ; 3B4F _ 4C: 89. 64 24, 28
00003B54        mov     qword ptr [rsp+20H], rax        ; 3B54 _ 48: 89. 44 24, 20
00003B59        mov     rcx, qword ptr [rbp-70H]        ; 3B59 _ 48: 8B. 4D, 90
00003B5D        mov     rsi, r15                        ; 3B5D _ 4C: 89. FE
00003B60        mov     rdx, rsi                        ; 3B60 _ 48: 89. F2
00003B63        lea     r8, ptr [rbp-60H]               ; 3B63 _ 4C: 8D. 45, A0
00003B67        mov     r9, r14                         ; 3B67 _ 4D: 89. F1
00003B6A        call    _NonFaultTolerantUpdateOnPartFv ; 3B6A _ E8, 00002357
?_355:
00003B6F        mov     r15, rax                        ; 3B6F _ 49: 89. C7
00003B72        test    r15, r15                        ; 3B72 _ 4D: 85. FF
00003B75        js      ?_363                           ; 3B75 _ 0F 88, 00000178
00003B7B        mov     r9, qword ptr [rbp-40H]         ; 3B7B _ 4C: 8B. 4D, C0
00003B7F        mov     rax, qword ptr [_gBS]           ; 3B7F _ 48: 8B. 05, 000055C2(rel)
00003B86        mov     rcx, r12                        ; 3B86 _ 4C: 89. E1
00003B89        mov     rdx, r13                        ; 3B89 _ 4C: 89. EA
00003B8C        mov     r8, r9                          ; 3B8C _ 4D: 89. C8
00003B8F        call    qword ptr [rax+88H]             ; 3B8F _ FF. 90, 00000088
00003B95        mov     r15, rax                        ; 3B95 _ 49: 89. C7
00003B98        test    r15, r15                        ; 3B98 _ 4D: 85. FF
00003B9B        lea     rdi, ptr [rbp-40H]              ; 3B9B _ 48: 8D. 7D, C0
00003B9F        js      ?_363                           ; 3B9F _ 0F 88, 0000014E
00003BA5        mov     rax, qword ptr [rbp-60H]        ; 3BA5 _ 48: 8B. 45, A0
00003BA9        add     qword ptr [rbp-70H], rax        ; 3BA9 _ 48: 01. 45, 90
00003BAD        add     r14, rax                        ; 3BAD _ 49: 01. C6
00003BB0        sub     rsi, rax                        ; 3BB0 _ 48: 29. C6
00003BB3        mov     r12, rbx                        ; 3BB3 _ 49: 89. DC
?_356:
00003BB6        lea     rbx, ptr [rbp-58H]              ; 3BB6 _ 48: 8D. 5D, A8
00003BBA        test    rsi, rsi                        ; 3BBA _ 48: 85. F6
00003BBD        je      ?_362                           ; 3BBD _ 0F 84, 0000011A
00003BC3        mov     r15, rsi                        ; 3BC3 _ 49: 89. F7
00003BC6        mov     qword ptr [rbp-40H], 0          ; 3BC6 _ 48: C7. 45, C0, 00000000
00003BCE        xor     esi, esi                        ; 3BCE _ 31. F6
?_357:
00003BD0        cmp     rsi, qword ptr [rbp-48H]        ; 3BD0 _ 48: 3B. 75, B8
00003BD4        jnc     ?_361                           ; 3BD4 _ 0F 83, 000000D7
00003BDA        mov     rax, qword ptr [rbp-50H]        ; 3BDA _ 48: 8B. 45, B0
00003BDE        mov     rcx, qword ptr [rax+rsi*8]      ; 3BDE _ 48: 8B. 0C F0
00003BE2        mov     rax, qword ptr [_gBS]           ; 3BE2 _ 48: 8B. 05, 0000555F(rel)
00003BE9        mov     rdx, r13                        ; 3BE9 _ 4C: 89. EA
00003BEC        mov     r8, rdi                         ; 3BEC _ 49: 89. F8
00003BEF        call    qword ptr [rax+98H]             ; 3BEF _ FF. 90, 00000098
00003BF5        test    rax, rax                        ; 3BF5 _ 48: 85. C0
00003BF8        js      ?_361                           ; 3BF8 _ 0F 88, 000000B3
00003BFE        mov     rax, qword ptr [rbp-40H]        ; 3BFE _ 48: 8B. 45, C0
00003C02        mov     rcx, rax                        ; 3C02 _ 48: 89. C1
00003C05        mov     rdx, r12                        ; 3C05 _ 4C: 89. E2
00003C08        call    qword ptr [rax]                 ; 3C08 _ FF. 10
00003C0A        test    rax, rax                        ; 3C0A _ 48: 85. C0
00003C0D        js      ?_358                           ; 3C0D _ 78, 2E
00003C0F        test    byte ptr [rbp-64H], 20H         ; 3C0F _ F6. 45, 9C, 20
00003C13        jz      ?_358                           ; 3C13 _ 74, 28
00003C15        mov     rax, qword ptr [rbp-40H]        ; 3C15 _ 48: 8B. 45, C0
00003C19        mov     rcx, rax                        ; 3C19 _ 48: 89. C1
00003C1C        mov     rdx, rbx                        ; 3C1C _ 48: 89. DA
00003C1F        call    qword ptr [rax+10H]             ; 3C1F _ FF. 50, 10
00003C22        test    rax, rax                        ; 3C22 _ 48: 85. C0
00003C25        js      ?_361                           ; 3C25 _ 0F 88, 00000086
00003C2B        mov     rax, qword ptr [rbp-58H]        ; 3C2B _ 48: 8B. 45, A8
00003C2F        cmp     r14, rax                        ; 3C2F _ 49: 39. C6
00003C32        jc      ?_358                           ; 3C32 _ 72, 09
00003C34        add     rax, qword ptr [rax+20H]        ; 3C34 _ 48: 03. 40, 20
00003C38        cmp     r14, rax                        ; 3C38 _ 49: 39. C6
00003C3B        jc      ?_359                           ; 3C3B _ 72, 05
?_358:
00003C3D        inc     rsi                             ; 3C3D _ 48: FF. C6
00003C40        jmp     ?_357                           ; 3C40 _ EB, 8E

?_359:
00003C42        mov     rbx, r12                        ; 3C42 _ 4C: 89. E3
00003C45        mov     rax, qword ptr [rbp-50H]        ; 3C45 _ 48: 8B. 45, B0
00003C49        mov     r12, qword ptr [rax+rsi*8]      ; 3C49 _ 4C: 8B. 24 F0
00003C4D        mov     qword ptr [rbp-60H], 0          ; 3C4D _ 48: C7. 45, A0, 00000000
00003C55        mov     rax, qword ptr [rbp-40H]        ; 3C55 _ 48: 8B. 45, C0
00003C59        mov     rdi, qword ptr [rbp-78H]        ; 3C59 _ 48: 8B. 7D, 88
00003C5D        cmp     byte ptr [rdi+30H], 0           ; 3C5D _ 80. 7F, 30, 00
00003C61        je      ?_354                           ; 3C61 _ 0F 84, FFFFFEE8
00003C67        mov     qword ptr [rsp+30H], r12        ; 3C67 _ 4C: 89. 64 24, 30
00003C6C        mov     qword ptr [rsp+28H], rax        ; 3C6C _ 48: 89. 44 24, 28
00003C71        mov     qword ptr [rsp+20H], r14        ; 3C71 _ 4C: 89. 74 24, 20
00003C76        mov     rcx, qword ptr [rbp-70H]        ; 3C76 _ 48: 8B. 4D, 90
00003C7A        mov     rsi, r15                        ; 3C7A _ 4C: 89. FE
00003C7D        mov     rdx, rsi                        ; 3C7D _ 48: 89. F2
00003C80        lea     r8, ptr [rbp-60H]               ; 3C80 _ 4C: 8D. 45, A0
00003C84        mov     r9, rdi                         ; 3C84 _ 49: 89. F9
00003C87        call    _FaultTolerantUpdateOnPartFv    ; 3C87 _ E8, 00001C4E
00003C8C        jmp     ?_355                           ; 3C8C _ E9, FFFFFEDE

?_360:
00003C91        mov     r15, 0EH                        ; 3C91 _ 49: BF, 800000000000000E
00003C9B        test    rcx, rcx                        ; 3C9B _ 48: 85. C9
00003C9E        jz      ?_363                           ; 3C9E _ 74, 53
00003CA0        call    _FreePool                       ; 3CA0 _ E8, FFFFDAB2
00003CA5        mov     r15, 0EH                        ; 3CA5 _ 49: BF, 800000000000000E
00003CAF        jmp     ?_363                           ; 3CAF _ EB, 42

?_361:
00003CB1        mov     r15, 0EH                        ; 3CB1 _ 49: BF, 800000000000000E
00003CBB        mov     rcx, qword ptr [rbp-50H]        ; 3CBB _ 48: 8B. 4D, B0
00003CBF        test    rcx, rcx                        ; 3CBF _ 48: 85. C9
00003CC2        jz      ?_363                           ; 3CC2 _ 74, 2F
00003CC4        call    _FreePool                       ; 3CC4 _ E8, FFFFDA8E
00003CC9        mov     qword ptr [rbp-50H], 0          ; 3CC9 _ 48: C7. 45, B0, 00000000
00003CD1        mov     r15, 0EH                        ; 3CD1 _ 49: BF, 800000000000000E
00003CDB        jmp     ?_363                           ; 3CDB _ EB, 16

?_362:
00003CDD        mov     rcx, qword ptr [rbp-50H]        ; 3CDD _ 48: 8B. 4D, B0
00003CE1        test    rcx, rcx                        ; 3CE1 _ 48: 85. C9
00003CE4        jz      ?_363                           ; 3CE4 _ 74, 0D
00003CE6        call    _FreePool                       ; 3CE6 _ E8, FFFFDA6C
00003CEB        mov     qword ptr [rbp-50H], 0          ; 3CEB _ 48: C7. 45, B0, 00000000
?_363:
00003CF3        mov     rax, r15                        ; 3CF3 _ 4C: 89. F8
00003CF6        add     rsp, 120                        ; 3CF6 _ 48: 83. C4, 78
00003CFA        pop     rbx                             ; 3CFA _ 5B
00003CFB        pop     rdi                             ; 3CFB _ 5F
00003CFC        pop     rsi                             ; 3CFC _ 5E
00003CFD        pop     r12                             ; 3CFD _ 41: 5C
00003CFF        pop     r13                             ; 3CFF _ 41: 5D
00003D01        pop     r14                             ; 3D01 _ 41: 5E
00003D03        pop     r15                             ; 3D03 _ 41: 5F
00003D05        pop     rbp                             ; 3D05 _ 5D
00003D06        ret                                     ; 3D06 _ C3
_PerformUpdateOnFlashArea ENDP

_PerformUpdate PROC
00003D07        push    rbp                             ; 3D07 _ 55
00003D08        mov     rbp, rsp                        ; 3D08 _ 48: 89. E5
00003D0B        push    r15                             ; 3D0B _ 41: 57
00003D0D        push    r14                             ; 3D0D _ 41: 56
00003D0F        push    r13                             ; 3D0F _ 41: 55
00003D11        push    r12                             ; 3D11 _ 41: 54
00003D13        push    rsi                             ; 3D13 _ 56
00003D14        push    rdi                             ; 3D14 _ 57
00003D15        push    rbx                             ; 3D15 _ 53
00003D16        sub     rsp, 88                         ; 3D16 _ 48: 83. EC, 58
00003D1A        mov     rdi, rdx                        ; 3D1A _ 48: 89. D7
00003D1D        mov     rbx, rcx                        ; 3D1D _ 48: 89. CB
00003D20        mov     qword ptr [rbp-40H], 0          ; 3D20 _ 48: C7. 45, C0, 00000000
00003D28        mov     qword ptr [rbp-48H], 0          ; 3D28 _ 48: C7. 45, B8, 00000000
00003D30        lea     rax, ptr [rbp-50H]              ; 3D30 _ 48: 8D. 45, B0
00003D34        lea     r13, ptr [rbp-54H]              ; 3D34 _ 4C: 8D. 6D, AC
00003D38        mov     qword ptr [rsp+30H], r13        ; 3D38 _ 4C: 89. 6C 24, 30
00003D3D        mov     qword ptr [rsp+28H], rax        ; 3D3D _ 48: 89. 44 24, 28
00003D42        lea     rax, ptr [rbp-49H]              ; 3D42 _ 48: 8D. 45, B7
00003D46        mov     qword ptr [rsp+20H], rax        ; 3D46 _ 48: 89. 44 24, 20
00003D4B        lea     r14, ptr [rdi+18H]              ; 3D4B _ 4C: 8D. 77, 18
00003D4F        lea     r15, ptr [rbp-40H]              ; 3D4F _ 4C: 8D. 7D, C0
00003D53        lea     r12, ptr [rbp-48H]              ; 3D53 _ 4C: 8D. 65, B8
00003D57        mov     rdx, r14                        ; 3D57 _ 4C: 89. F2
00003D5A        mov     r8, r15                         ; 3D5A _ 4D: 89. F8
00003D5D        mov     r9, r12                         ; 3D5D _ 4D: 89. E1
00003D60        call    qword ptr [rbx+10H]             ; 3D60 _ FF. 53, 10
00003D63        mov     rsi, rax                        ; 3D63 _ 48: 89. C6
00003D66        test    rsi, rsi                        ; 3D66 _ 48: 85. F6
00003D69        js      ?_374                           ; 3D69 _ 0F 88, 000001C0
00003D6F        mov     eax, dword ptr [rdi+8H]         ; 3D6F _ 8B. 47, 08
00003D72        cmp     eax, 2                          ; 3D72 _ 83. F8, 02
00003D75        je      ?_367                           ; 3D75 _ 0F 84, 000000F4
00003D7B        cmp     eax, 1                          ; 3D7B _ 83. F8, 01
00003D7E        je      ?_369                           ; 3D7E _ 0F 84, 0000013E
00003D84        mov     rsi, 2H                         ; 3D84 _ 48: BE, 8000000000000002
00003D8E        test    eax, eax                        ; 3D8E _ 85. C0
00003D90        jne     ?_373                           ; 3D90 _ 0F 85, 00000183
00003D96        cmp     byte ptr [rbp-49H], 11          ; 3D96 _ 80. 7D, B7, 0B
00003D9A        jz      ?_365                           ; 3D9A _ 74, 53
00003D9C        call    _DebugPrintEnabled              ; 3D9C _ E8, FFFFC4AE
00003DA1        mov     rsi, 2H                         ; 3DA1 _ 48: BE, 8000000000000002
00003DAB        test    al, al                          ; 3DAB _ 84. C0
00003DAD        je      ?_373                           ; 3DAD _ 0F 84, 00000166
00003DB3        mov     ecx, 2147483648                 ; 3DB3 _ B9, 80000000
00003DB8        call    _DebugPrintLevelEnabled         ; 3DB8 _ E8, FFFFC495
00003DBD        mov     rsi, 2H                         ; 3DBD _ 48: BE, 8000000000000002
00003DC7        test    al, al                          ; 3DC7 _ 84. C0
00003DC9        je      ?_373                           ; 3DC9 _ 0F 84, 0000014A
00003DCF        lea     rdx, ptr [?_650]                ; 3DCF _ 48: 8D. 15, 000038C0(rel)
?_364:
00003DD6        mov     ecx, 2147483648                 ; 3DD6 _ B9, 80000000
00003DDB        call    _DebugPrint                     ; 3DDB _ E8, FFFFC460
00003DE0        mov     rsi, 2H                         ; 3DE0 _ 48: BE, 8000000000000002
00003DEA        jmp     ?_373                           ; 3DEA _ E9, 0000012A

?_365:
00003DEF        mov     rcx, qword ptr [rbp-40H]        ; 3DEF _ 48: 8B. 4D, C0
00003DF3        test    rcx, rcx                        ; 3DF3 _ 48: 85. C9
00003DF6        jz      ?_366                           ; 3DF6 _ 74, 05
00003DF8        call    _FreePool                       ; 3DF8 _ E8, FFFFD95A
?_366:
00003DFD        mov     qword ptr [rbp-40H], 0          ; 3DFD _ 48: C7. 45, C0, 00000000
00003E05        mov     qword ptr [rbp-48H], 0          ; 3E05 _ 48: C7. 45, B8, 00000000
00003E0D        mov     qword ptr [rsp+30H], r13        ; 3E0D _ 4C: 89. 6C 24, 30
00003E12        mov     qword ptr [rsp+28H], r12        ; 3E12 _ 4C: 89. 64 24, 28
00003E17        mov     qword ptr [rsp+20H], r15        ; 3E17 _ 4C: 89. 7C 24, 20
00003E1C        mov     rcx, rbx                        ; 3E1C _ 48: 89. D9
00003E1F        mov     rdx, r14                        ; 3E1F _ 4C: 89. F2
00003E22        mov     r8d, 23                         ; 3E22 _ 41: B8, 00000017
00003E28        xor     r9d, r9d                        ; 3E28 _ 45: 31. C9
00003E2B        call    qword ptr [rbx+18H]             ; 3E2B _ FF. 53, 18
00003E2E        mov     rsi, rax                        ; 3E2E _ 48: 89. C6
00003E31        test    rsi, rsi                        ; 3E31 _ 48: 85. F6
00003E34        jns     ?_369                           ; 3E34 _ 0F 89, 00000088
00003E3A        call    _DebugPrintEnabled              ; 3E3A _ E8, FFFFC410
00003E3F        test    al, al                          ; 3E3F _ 84. C0
00003E41        je      ?_373                           ; 3E41 _ 0F 84, 000000D2
00003E47        mov     ecx, 2147483648                 ; 3E47 _ B9, 80000000
00003E4C        call    _DebugPrintLevelEnabled         ; 3E4C _ E8, FFFFC401
00003E51        test    al, al                          ; 3E51 _ 84. C0
00003E53        je      ?_373                           ; 3E53 _ 0F 84, 000000C0
00003E59        lea     rdx, ptr [?_651]                ; 3E59 _ 48: 8D. 15, 00003887(rel)
00003E60        mov     ecx, 2147483648                 ; 3E60 _ B9, 80000000
00003E65        call    _DebugPrint                     ; 3E65 _ E8, FFFFC3D6
00003E6A        jmp     ?_373                           ; 3E6A _ E9, 000000AA

?_367:
00003E6F        cmp     byte ptr [rbp-49H], 1           ; 3E6F _ 80. 7D, B7, 01
00003E73        jz      ?_368                           ; 3E73 _ 74, 3B
00003E75        call    _DebugPrintEnabled              ; 3E75 _ E8, FFFFC3D5
00003E7A        mov     rsi, 2H                         ; 3E7A _ 48: BE, 8000000000000002
00003E84        test    al, al                          ; 3E84 _ 84. C0
00003E86        je      ?_373                           ; 3E86 _ 0F 84, 0000008D
00003E8C        mov     ecx, 2147483648                 ; 3E8C _ B9, 80000000
00003E91        call    _DebugPrintLevelEnabled         ; 3E91 _ E8, FFFFC3BC
00003E96        mov     rsi, 2H                         ; 3E96 _ 48: BE, 8000000000000002
00003EA0        test    al, al                          ; 3EA0 _ 84. C0
00003EA2        jz      ?_373                           ; 3EA2 _ 74, 75
00003EA4        lea     rdx, ptr [?_652]                ; 3EA4 _ 48: 8D. 15, 00003895(rel)
00003EAB        jmp     ?_364                           ; 3EAB _ E9, FFFFFF26

?_368:
00003EB0        mov     r8, qword ptr [rbp-48H]         ; 3EB0 _ 4C: 8B. 45, B8
00003EB4        mov     rdx, qword ptr [rbp-40H]        ; 3EB4 _ 48: 8B. 55, C0
00003EB8        mov     rcx, rdi                        ; 3EB8 _ 48: 89. F9
00003EBB        call    _PerformUpdateOnFlashArea       ; 3EBB _ E8, FFFFFBCF
00003EC0        jmp     ?_370                           ; 3EC0 _ EB, 1C

?_369:
00003EC2        movzx   r9d, byte ptr [rbp-49H]         ; 3EC2 _ 44: 0F B6. 4D, B7
00003EC7        mov     r8, qword ptr [rbp-48H]         ; 3EC7 _ 4C: 8B. 45, B8
00003ECB        mov     rdx, qword ptr [rbp-40H]        ; 3ECB _ 48: 8B. 55, C0
00003ECF        mov     eax, dword ptr [rbp-50H]        ; 3ECF _ 8B. 45, B0
00003ED2        mov     dword ptr [rsp+20H], eax        ; 3ED2 _ 89. 44 24, 20
00003ED6        mov     rcx, rdi                        ; 3ED6 _ 48: 89. F9
00003ED9        call    _PerformUpdateOnFirmwareVolume  ; 3ED9 _ E8, FFFFF9C8
?_370:
00003EDE        mov     rsi, rax                        ; 3EDE _ 48: 89. C6
00003EE1        mov     rcx, qword ptr [_gHiiHandle]    ; 3EE1 _ 48: 8B. 0D, 000052A0(rel)
00003EE8        test    rsi, rsi                        ; 3EE8 _ 48: 85. F6
00003EEB        jns     ?_371                           ; 3EEB _ 79, 07
00003EED        mov     edx, 5                          ; 3EED _ BA, 00000005
00003EF2        jmp     ?_372                           ; 3EF2 _ EB, 05

?_371:
00003EF4        mov     edx, 3                          ; 3EF4 _ BA, 00000003
?_372:
00003EF9        xor     r8d, r8d                        ; 3EF9 _ 45: 31. C0
00003EFC        call    _HiiGetString                   ; 3EFC _ E8, FFFFF57D
00003F01        mov     rdi, rax                        ; 3F01 _ 48: 89. C7
00003F04        test    rdi, rdi                        ; 3F04 _ 48: 85. FF
00003F07        jz      ?_373                           ; 3F07 _ 74, 10
00003F09        mov     rcx, rdi                        ; 3F09 _ 48: 89. F9
00003F0C        call    _Print                          ; 3F0C _ E8, FFFFF025
00003F11        mov     rcx, rdi                        ; 3F11 _ 48: 89. F9
00003F14        call    _FreePool                       ; 3F14 _ E8, FFFFD83E
?_373:
00003F19        mov     rcx, qword ptr [rbp-40H]        ; 3F19 _ 48: 8B. 4D, C0
00003F1D        test    rcx, rcx                        ; 3F1D _ 48: 85. C9
00003F20        jz      ?_374                           ; 3F20 _ 74, 0D
00003F22        call    _FreePool                       ; 3F22 _ E8, FFFFD830
00003F27        mov     qword ptr [rbp-40H], 0          ; 3F27 _ 48: C7. 45, C0, 00000000
?_374:
00003F2F        mov     rax, rsi                        ; 3F2F _ 48: 89. F0
00003F32        add     rsp, 88                         ; 3F32 _ 48: 83. C4, 58
00003F36        pop     rbx                             ; 3F36 _ 5B
00003F37        pop     rdi                             ; 3F37 _ 5F
00003F38        pop     rsi                             ; 3F38 _ 5E
00003F39        pop     r12                             ; 3F39 _ 41: 5C
00003F3B        pop     r13                             ; 3F3B _ 41: 5D
00003F3D        pop     r14                             ; 3F3D _ 41: 5E
00003F3F        pop     r15                             ; 3F3F _ 41: 5F
00003F41        pop     rbp                             ; 3F41 _ 5D
00003F42        ret                                     ; 3F42 _ C3
_PerformUpdate ENDP

_ProcessUpdateImage PROC
00003F43        push    rbp                             ; 3F43 _ 55
00003F44        mov     rbp, rsp                        ; 3F44 _ 48: 89. E5
00003F47        push    r14                             ; 3F47 _ 41: 56
00003F49        push    rsi                             ; 3F49 _ 56
00003F4A        push    rdi                             ; 3F4A _ 57
00003F4B        push    rbx                             ; 3F4B _ 53
00003F4C        sub     rsp, 48                         ; 3F4C _ 48: 83. EC, 30
00003F50        mov     r14, r8                         ; 3F50 _ 4D: 89. C6
00003F53        mov     rdi, rdx                        ; 3F53 _ 48: 89. D7
00003F56        mov     rbx, rcx                        ; 3F56 _ 48: 89. CB
00003F59        mov     rax, 0AH                        ; 3F59 _ 48: B8, 800000000000000A
00003F63        cmp     qword ptr [rbx+20H], rdi        ; 3F63 _ 48: 39. 7B, 20
00003F67        jne     ?_376                           ; 3F67 _ 0F 85, 00000098
00003F6D        mov     cl, byte ptr [rbx+2EH]          ; 3F6D _ 8A. 4B, 2E
00003F70        mov     eax, 1                          ; 3F70 _ B8, 00000001
00003F75        shl     eax, cl                         ; 3F75 _ D3. E0
00003F77        cmp     eax, 8                          ; 3F77 _ 83. F8, 08
00003F7A        mov     esi, 8                          ; 3F7A _ BE, 00000008
00003F7F        cmovnc  rsi, rax                        ; 3F7F _ 48: 0F 43. F0
00003F83        mov     rax, rbx                        ; 3F83 _ 48: 89. D8
00003F86        xor     edx, edx                        ; 3F86 _ 31. D2
00003F88        div     rsi                             ; 3F88 _ 48: F7. F6
00003F8B        test    rdx, rdx                        ; 3F8B _ 48: 85. D2
00003F8E        jz      ?_375                           ; 3F8E _ 74, 43
00003F90        mov     rcx, rdi                        ; 3F90 _ 48: 89. F9
00003F93        shr     rcx, 12                         ; 3F93 _ 48: C1. E9, 0C
00003F97        mov     rax, rdi                        ; 3F97 _ 48: 89. F8
00003F9A        and     rax, 0FFFH                      ; 3F9A _ 48: 25, 00000FFF
00003FA0        cmp     rax, 1                          ; 3FA0 _ 48: 83. F8, 01
00003FA4        sbb     rcx, -1                         ; 3FA4 _ 48: 83. D9, FF
00003FA8        mov     rdx, rsi                        ; 3FA8 _ 48: 89. F2
00003FAB        call    _AllocateAlignedPages           ; 3FAB _ E8, FFFFD66B
00003FB0        mov     rsi, rax                        ; 3FB0 _ 48: 89. C6
00003FB3        mov     rax, 9H                         ; 3FB3 _ 48: B8, 8000000000000009
00003FBD        test    rsi, rsi                        ; 3FBD _ 48: 85. F6
00003FC0        jz      ?_376                           ; 3FC0 _ 74, 43
00003FC2        mov     rcx, rsi                        ; 3FC2 _ 48: 89. F1
00003FC5        mov     rdx, rbx                        ; 3FC5 _ 48: 89. DA
00003FC8        mov     r8, rdi                         ; 3FC8 _ 49: 89. F8
00003FCB        call    _CopyMem                        ; 3FCB _ E8, FFFFC474
00003FD0        mov     rbx, rsi                        ; 3FD0 _ 48: 89. F3
?_375:
00003FD3        mov     rax, qword ptr [_gDS]           ; 3FD3 _ 48: 8B. 05, 000051A6(rel)
00003FDA        lea     r8, ptr [rbp-28H]               ; 3FDA _ 4C: 8D. 45, D8
00003FDE        mov     rcx, rbx                        ; 3FDE _ 48: 89. D9
00003FE1        mov     rdx, rdi                        ; 3FE1 _ 48: 89. FA
00003FE4        call    qword ptr [rax+98H]             ; 3FE4 _ FF. 90, 00000098
00003FEA        mov     rcx, qword ptr [rbp-28H]        ; 3FEA _ 48: 8B. 4D, D8
00003FEE        mov     rax, qword ptr [_gBS]           ; 3FEE _ 48: 8B. 05, 00005153(rel)
00003FF5        lea     rdx, ptr [_gEfiFirmwareVolume2ProtocolGuid]; 3FF5 _ 48: 8D. 15, 00004EBC(rel)
00003FFC        mov     r8, r14                         ; 3FFC _ 4D: 89. F0
00003FFF        call    qword ptr [rax+98H]             ; 3FFF _ FF. 90, 00000098
?_376:
00004005        add     rsp, 48                         ; 4005 _ 48: 83. C4, 30
00004009        pop     rbx                             ; 4009 _ 5B
0000400A        pop     rdi                             ; 400A _ 5F
0000400B        pop     rsi                             ; 400B _ 5E
0000400C        pop     r14                             ; 400C _ 41: 5E
0000400E        pop     rbp                             ; 400E _ 5D
0000400F        ret                                     ; 400F _ C3
_ProcessUpdateImage ENDP

_InitializeUpdateDriver PROC
00004010        push    rbp                             ; 4010 _ 55
00004011        mov     rbp, rsp                        ; 4011 _ 48: 89. E5
00004014        push    r14                             ; 4014 _ 41: 56
00004016        push    rsi                             ; 4016 _ 56
00004017        push    rdi                             ; 4017 _ 57
00004018        push    rbx                             ; 4018 _ 53
00004019        sub     rsp, 128                        ; 4019 _ 48: 81. EC, 00000080
00004020        mov     rsi, rcx                        ; 4020 _ 48: 89. CE
00004023        mov     rax, qword ptr [_gST]           ; 4023 _ 48: 8B. 05, 00005116(rel)
0000402A        mov     rax, qword ptr [rax+40H]        ; 402A _ 48: 8B. 40, 40
0000402E        test    rax, rax                        ; 402E _ 48: 85. C0
00004031        jz      ?_377                           ; 4031 _ 74, 2F
00004033        mov     rcx, rax                        ; 4033 _ 48: 89. C1
00004036        call    qword ptr [rax+30H]             ; 4036 _ FF. 50, 30
00004039        mov     rax, qword ptr [_gST]           ; 4039 _ 48: 8B. 05, 00005100(rel)
00004040        mov     rax, qword ptr [rax+40H]        ; 4040 _ 48: 8B. 40, 40
00004044        mov     rcx, rax                        ; 4044 _ 48: 89. C1
00004047        mov     edx, 14                         ; 4047 _ BA, 0000000E
0000404C        call    qword ptr [rax+28H]             ; 404C _ FF. 50, 28
0000404F        mov     rax, qword ptr [_gST]           ; 404F _ 48: 8B. 05, 000050EA(rel)
00004056        mov     rax, qword ptr [rax+40H]        ; 4056 _ 48: 8B. 40, 40
0000405A        mov     rcx, rax                        ; 405A _ 48: 89. C1
0000405D        xor     edx, edx                        ; 405D _ 31. D2
0000405F        call    qword ptr [rax+40H]             ; 405F _ FF. 50, 40
?_377:
00004062        lea     rcx, ptr [_gEfiCallerIdGuid]    ; 4062 _ 48: 8D. 0D, 00004DE7(rel)
00004069        lea     r8, ptr [_UpdateDriverDxeStrings]; 4069 _ 4C: 8D. 05, 00004ED0(rel)
00004070        xor     edx, edx                        ; 4070 _ 31. D2
00004072        xor     r9d, r9d                        ; 4072 _ 45: 31. C9
00004075        call    _HiiAddPackages                 ; 4075 _ E8, FFFFF2B2
0000407A        mov     qword ptr [_gHiiHandle], rax    ; 407A _ 48: 89. 05, 00005107(rel)
00004081        call    _DebugAssertEnabled             ; 4081 _ E8, FFFFC1C6
00004086        test    al, al                          ; 4086 _ 84. C0
00004088        jz      ?_378                           ; 4088 _ 74, 24
0000408A        mov     rax, qword ptr [_gHiiHandle]    ; 408A _ 48: 8B. 05, 000050F7(rel)
00004091        test    rax, rax                        ; 4091 _ 48: 85. C0
00004094        jnz     ?_378                           ; 4094 _ 75, 18
00004096        lea     rcx, ptr [?_653]                ; 4096 _ 48: 8D. 0D, 000036DF(rel)
0000409D        lea     r8, ptr [?_654]                 ; 409D _ 4C: 8D. 05, 0000375F(rel)
000040A4        mov     edx, 635                        ; 40A4 _ BA, 0000027B
000040A9        call    _DebugAssert                    ; 40A9 _ E8, FFFFC19D
?_378:
000040AE        mov     rax, qword ptr [_gBS]           ; 40AE _ 48: 8B. 05, 00005093(rel)
000040B5        mov     dword ptr [rsp+28H], 2          ; 40B5 _ C7. 44 24, 28, 00000002
000040BD        mov     qword ptr [rsp+20H], 0          ; 40BD _ 48: C7. 44 24, 20, 00000000
000040C6        lea     rdx, ptr [_gEfiLoadedImageProtocolGuid]; 40C6 _ 48: 8D. 15, 00004E0B(rel)
000040CD        lea     r8, ptr [rbp-28H]               ; 40CD _ 4C: 8D. 45, D8
000040D1        mov     rcx, rsi                        ; 40D1 _ 48: 89. F1
000040D4        mov     r9, rsi                         ; 40D4 _ 49: 89. F1
000040D7        call    qword ptr [rax+118H]            ; 40D7 _ FF. 90, 00000118
000040DD        mov     rsi, rax                        ; 40DD _ 48: 89. C6
000040E0        test    rsi, rsi                        ; 40E0 _ 48: 85. F6
000040E3        js      ?_391                           ; 40E3 _ 0F 88, 0000031E
000040E9        mov     rax, qword ptr [rbp-28H]        ; 40E9 _ 48: 8B. 45, D8
000040ED        mov     rcx, qword ptr [rax+18H]        ; 40ED _ 48: 8B. 48, 18
000040F1        mov     rax, qword ptr [_gBS]           ; 40F1 _ 48: 8B. 05, 00005050(rel)
000040F8        lea     rdx, ptr [_gEfiFirmwareVolume2ProtocolGuid]; 40F8 _ 48: 8D. 15, 00004DB9(rel)
000040FF        lea     r8, ptr [rbp-30H]               ; 40FF _ 4C: 8D. 45, D0
00004103        call    qword ptr [rax+98H]             ; 4103 _ FF. 90, 00000098
00004109        mov     rsi, 0EH                        ; 4109 _ 48: BE, 800000000000000E
00004113        test    rax, rax                        ; 4113 _ 48: 85. C0
00004116        js      ?_391                           ; 4116 _ 0F 88, 000002EB
0000411C        mov     rax, qword ptr [rbp-28H]        ; 411C _ 48: 8B. 45, D8
00004120        mov     rdi, qword ptr [rax+20H]        ; 4120 _ 48: 8B. 78, 20
00004124        mov     rsi, 0EH                        ; 4124 _ 48: BE, 800000000000000E
0000412E        jmp     ?_380                           ; 412E _ EB, 0B

?_379:
00004130        mov     rcx, rdi                        ; 4130 _ 48: 89. F9
00004133        call    _NextDevicePathNode             ; 4133 _ E8, FFFFEA02
00004138        mov     rdi, rax                        ; 4138 _ 48: 89. C7
?_380:
0000413B        mov     rcx, rdi                        ; 413B _ 48: 89. F9
0000413E        call    _IsDevicePathEnd                ; 413E _ E8, FFFFE958
00004143        test    al, al                          ; 4143 _ 84. C0
00004145        jne     ?_391                           ; 4145 _ 0F 85, 000002BC
0000414B        mov     rcx, rdi                        ; 414B _ 48: 89. F9
0000414E        call    _EfiGetNameGuidFromFwVolDevicePathNode; 414E _ E8, FFFFEE19
00004153        test    rax, rax                        ; 4153 _ 48: 85. C0
00004156        jz      ?_379                           ; 4156 _ 74, D8
00004158        mov     rsi, 0EH                        ; 4158 _ 48: BE, 800000000000000E
00004162        test    rdi, rdi                        ; 4162 _ 48: 85. FF
00004165        je      ?_391                           ; 4165 _ 0F 84, 0000029C
0000416B        mov     rcx, rdi                        ; 416B _ 48: 89. F9
0000416E        call    _DevicePathNodeLength           ; 416E _ E8, FFFFE97F
00004173        mov     rcx, rax                        ; 4173 _ 48: 89. C1
00004176        mov     rdx, rdi                        ; 4176 _ 48: 89. FA
00004179        call    _AllocateCopyPool               ; 4179 _ E8, FFFFD5C6
0000417E        mov     rdi, rax                        ; 417E _ 48: 89. C7
00004181        mov     qword ptr [rbp-40H], 0          ; 4181 _ 48: C7. 45, C0, 00000000
00004189        mov     qword ptr [rbp-48H], 0          ; 4189 _ 48: C7. 45, B8, 00000000
00004191        mov     rax, qword ptr [rbp-30H]        ; 4191 _ 48: 8B. 45, D0
00004195        lea     rbx, ptr [rdi+4H]               ; 4195 _ 48: 8D. 5F, 04
00004199        lea     rcx, ptr [rbp-40H]              ; 4199 _ 48: 8D. 4D, C0
0000419D        lea     rdx, ptr [rbp-48H]              ; 419D _ 48: 8D. 55, B8
000041A1        lea     r14, ptr [rbp-54H]              ; 41A1 _ 4C: 8D. 75, AC
000041A5        mov     qword ptr [rsp+30H], r14        ; 41A5 _ 4C: 89. 74 24, 30
000041AA        mov     qword ptr [rsp+28H], rdx        ; 41AA _ 48: 89. 54 24, 28
000041AF        mov     qword ptr [rsp+20H], rcx        ; 41AF _ 48: 89. 4C 24, 20
000041B4        mov     rcx, rax                        ; 41B4 _ 48: 89. C1
000041B7        mov     rdx, rbx                        ; 41B7 _ 48: 89. DA
000041BA        mov     r8d, 16                         ; 41BA _ 41: B8, 00000010
000041C0        xor     r9d, r9d                        ; 41C0 _ 45: 31. C9
000041C3        call    qword ptr [rax+18H]             ; 41C3 _ FF. 50, 18
000041C6        mov     rsi, rax                        ; 41C6 _ 48: 89. C6
000041C9        test    rsi, rsi                        ; 41C9 _ 48: 85. F6
000041CC        jns     ?_381                           ; 41CC _ 79, 0D
000041CE        mov     rcx, rdi                        ; 41CE _ 48: 89. F9
000041D1        call    _FreePool                       ; 41D1 _ E8, FFFFD581
000041D6        jmp     ?_391                           ; 41D6 _ E9, 0000022C

?_381:
000041DB        mov     rcx, qword ptr [rbp-40H]        ; 41DB _ 48: 8B. 4D, C0
000041DF        test    rcx, rcx                        ; 41DF _ 48: 85. C9
000041E2        jz      ?_382                           ; 41E2 _ 74, 0D
000041E4        call    _FreePool                       ; 41E4 _ E8, FFFFD56E
000041E9        mov     qword ptr [rbp-40H], 0          ; 41E9 _ 48: C7. 45, C0, 00000000
?_382:
000041F1        lea     rcx, ptr [_gEfiCallerIdGuid]    ; 41F1 _ 48: 8D. 0D, 00004C58(rel)
000041F8        mov     rdx, rbx                        ; 41F8 _ 48: 89. DA
000041FB        call    _CompareGuid                    ; 41FB _ E8, FFFFC35D
00004200        mov     bl, al                          ; 4200 _ 88. C3
00004202        mov     rcx, rdi                        ; 4202 _ 48: 89. F9
00004205        call    _FreePool                       ; 4205 _ E8, FFFFD54D
0000420A        mov     rsi, 0EH                        ; 420A _ 48: BE, 800000000000000E
00004214        test    bl, bl                          ; 4214 _ 84. DB
00004216        je      ?_391                           ; 4216 _ 0F 84, 000001EB
0000421C        mov     qword ptr [rbp-40H], 0          ; 421C _ 48: C7. 45, C0, 00000000
00004224        mov     qword ptr [rbp-48H], 0          ; 4224 _ 48: C7. 45, B8, 00000000
0000422C        mov     rax, qword ptr [rbp-30H]        ; 422C _ 48: 8B. 45, D0
00004230        mov     qword ptr [rsp+30H], r14        ; 4230 _ 4C: 89. 74 24, 30
00004235        lea     rdi, ptr [rbp-50H]              ; 4235 _ 48: 8D. 7D, B0
00004239        mov     qword ptr [rsp+28H], rdi        ; 4239 _ 48: 89. 7C 24, 28
0000423E        lea     rbx, ptr [rbp-49H]              ; 423E _ 48: 8D. 5D, B7
00004242        mov     qword ptr [rsp+20H], rbx        ; 4242 _ 48: 89. 5C 24, 20
00004247        lea     rdx, ptr [_gEfiConfigFileNameGuid]; 4247 _ 48: 8D. 15, 00004C1A(rel)
0000424E        lea     r8, ptr [rbp-40H]               ; 424E _ 4C: 8D. 45, C0
00004252        lea     r9, ptr [rbp-48H]               ; 4252 _ 4C: 8D. 4D, B8
00004256        mov     rcx, rax                        ; 4256 _ 48: 89. C1
00004259        call    qword ptr [rax+10H]             ; 4259 _ FF. 50, 10
0000425C        mov     rsi, rax                        ; 425C _ 48: 89. C6
0000425F        test    rsi, rsi                        ; 425F _ 48: 85. F6
00004262        js      ?_391                           ; 4262 _ 0F 88, 0000019F
00004268        mov     rsi, 0EH                        ; 4268 _ 48: BE, 800000000000000E
00004272        cmp     byte ptr [rbp-49H], 1           ; 4272 _ 80. 7D, B7, 01
00004276        jne     ?_391                           ; 4276 _ 0F 85, 0000018B
0000427C        mov     qword ptr [rbp-60H], 0          ; 427C _ 48: C7. 45, A0, 00000000
00004284        mov     qword ptr [rbp-68H], 0          ; 4284 _ 48: C7. 45, 98, 00000000
0000428C        mov     rdx, qword ptr [rbp-48H]        ; 428C _ 48: 8B. 55, B8
00004290        mov     rcx, qword ptr [rbp-40H]        ; 4290 _ 48: 8B. 4D, C0
00004294        lea     r8, ptr [rbp-68H]               ; 4294 _ 4C: 8D. 45, 98
00004298        lea     r9, ptr [rbp-60H]               ; 4298 _ 4C: 8D. 4D, A0
0000429C        call    _ParseUpdateDataFile            ; 429C _ E8, 00000A31
000042A1        mov     rsi, rax                        ; 42A1 _ 48: 89. C6
000042A4        mov     rcx, qword ptr [rbp-40H]        ; 42A4 _ 48: 8B. 4D, C0
000042A8        test    rcx, rcx                        ; 42A8 _ 48: 85. C9
000042AB        jz      ?_383                           ; 42AB _ 74, 0D
000042AD        call    _FreePool                       ; 42AD _ E8, FFFFD4A5
000042B2        mov     qword ptr [rbp-40H], 0          ; 42B2 _ 48: C7. 45, C0, 00000000
?_383:
000042BA        test    rsi, rsi                        ; 42BA _ 48: 85. F6
000042BD        js      ?_391                           ; 42BD _ 0F 88, 00000144
000042C3        call    _DebugAssertEnabled             ; 42C3 _ E8, FFFFBF84
000042C8        test    al, al                          ; 42C8 _ 84. C0
000042CA        jz      ?_384                           ; 42CA _ 74, 1F
000042CC        cmp     qword ptr [rbp-60H], 0          ; 42CC _ 48: 83. 7D, A0, 00
000042D1        jnz     ?_384                           ; 42D1 _ 75, 18
000042D3        lea     rcx, ptr [?_653]                ; 42D3 _ 48: 8D. 0D, 000034A2(rel)
000042DA        lea     r8, ptr [?_655]                 ; 42DA _ 4C: 8D. 05, 0000353D(rel)
000042E1        mov     edx, 758                        ; 42E1 _ BA, 000002F6
000042E6        call    _DebugAssert                    ; 42E6 _ E8, FFFFBF60
?_384:
000042EB        mov     qword ptr [rbp-40H], 0          ; 42EB _ 48: C7. 45, C0, 00000000
000042F3        mov     qword ptr [rbp-48H], 0          ; 42F3 _ 48: C7. 45, B8, 00000000
000042FB        mov     rax, qword ptr [rbp-30H]        ; 42FB _ 48: 8B. 45, D0
000042FF        mov     qword ptr [rsp+30H], r14        ; 42FF _ 4C: 89. 74 24, 30
00004304        mov     qword ptr [rsp+28H], rdi        ; 4304 _ 48: 89. 7C 24, 28
00004309        mov     qword ptr [rsp+20H], rbx        ; 4309 _ 48: 89. 5C 24, 20
0000430E        lea     rdx, ptr [_gEfiUpdateDataFileGuid]; 430E _ 48: 8D. 15, 00004B63(rel)
00004315        lea     r8, ptr [rbp-40H]               ; 4315 _ 4C: 8D. 45, C0
00004319        lea     r9, ptr [rbp-48H]               ; 4319 _ 4C: 8D. 4D, B8
0000431D        mov     rcx, rax                        ; 431D _ 48: 89. C1
00004320        call    qword ptr [rax+10H]             ; 4320 _ FF. 50, 10
00004323        mov     rsi, rax                        ; 4323 _ 48: 89. C6
00004326        test    rsi, rsi                        ; 4326 _ 48: 85. F6
00004329        js      ?_391                           ; 4329 _ 0F 88, 000000D8
0000432F        mov     rsi, 0EH                        ; 432F _ 48: BE, 800000000000000E
00004339        cmp     byte ptr [rbp-49H], 1           ; 4339 _ 80. 7D, B7, 01
0000433D        jne     ?_391                           ; 433D _ 0F 85, 000000C4
00004343        mov     qword ptr [rbp-38H], 0          ; 4343 _ 48: C7. 45, C8, 00000000
0000434B        mov     rdx, qword ptr [rbp-48H]        ; 434B _ 48: 8B. 55, B8
0000434F        mov     rcx, qword ptr [rbp-40H]        ; 434F _ 48: 8B. 4D, C0
00004353        lea     r8, ptr [rbp-38H]               ; 4353 _ 4C: 8D. 45, C8
00004357        call    _ProcessUpdateImage             ; 4357 _ E8, FFFFFBE7
0000435C        mov     rsi, rax                        ; 435C _ 48: 89. C6
0000435F        test    rsi, rsi                        ; 435F _ 48: 85. F6
00004362        jns     ?_385                           ; 4362 _ 79, 0E
00004364        mov     rcx, qword ptr [rbp-40H]        ; 4364 _ 48: 8B. 4D, C0
00004368        call    _FreePool                       ; 4368 _ E8, FFFFD3EA
0000436D        jmp     ?_391                           ; 436D _ E9, 00000095

?_385:
00004372        mov     rcx, qword ptr [_gHiiHandle]    ; 4372 _ 48: 8B. 0D, 00004E0F(rel)
00004379        mov     edx, 2                          ; 4379 _ BA, 00000002
0000437E        xor     r8d, r8d                        ; 437E _ 45: 31. C0
00004381        call    _HiiGetString                   ; 4381 _ E8, FFFFF0F8
00004386        mov     rdi, rax                        ; 4386 _ 48: 89. C7
00004389        test    rdi, rdi                        ; 4389 _ 48: 85. FF
0000438C        jz      ?_386                           ; 438C _ 74, 10
0000438E        mov     rcx, rdi                        ; 438E _ 48: 89. F9
00004391        call    _Print                          ; 4391 _ E8, FFFFEBA0
00004396        mov     rcx, rdi                        ; 4396 _ 48: 89. F9
00004399        call    _FreePool                       ; 4399 _ E8, FFFFD3B9
?_386:
0000439E        mov     rbx, -1                         ; 439E _ 48: C7. C3, FFFFFFFF
000043A5        mov     rdi, qword ptr [rbp-60H]        ; 43A5 _ 48: 8B. 7D, A0
000043A9        jmp     ?_388                           ; 43A9 _ EB, 18

?_387:
000043AB        mov     rcx, qword ptr [rbp-38H]        ; 43AB _ 48: 8B. 4D, C8
000043AF        mov     rdx, rdi                        ; 43AF _ 48: 89. FA
000043B2        lea     rdi, ptr [rdi+38H]              ; 43B2 _ 48: 8D. 7F, 38
000043B6        call    _PerformUpdate                  ; 43B6 _ E8, FFFFF94C
000043BB        mov     rsi, rax                        ; 43BB _ 48: 89. C6
000043BE        test    rsi, rsi                        ; 43BE _ 48: 85. F6
000043C1        js      ?_389                           ; 43C1 _ 78, 0E
?_388:
000043C3        inc     rbx                             ; 43C3 _ 48: FF. C3
000043C6        cmp     rbx, qword ptr [rbp-68H]        ; 43C6 _ 48: 3B. 5D, 98
000043CA        jc      ?_387                           ; 43CA _ 72, DF
000043CC        test    rsi, rsi                        ; 43CC _ 48: 85. F6
000043CF        jns     ?_390                           ; 43CF _ 79, 18
?_389:
000043D1        mov     rcx, qword ptr [rbp-60H]        ; 43D1 _ 48: 8B. 4D, A0
000043D5        test    rcx, rcx                        ; 43D5 _ 48: 85. C9
000043D8        jz      ?_391                           ; 43D8 _ 74, 2D
000043DA        call    _FreePool                       ; 43DA _ E8, FFFFD378
000043DF        mov     qword ptr [rbp-60H], 0          ; 43DF _ 48: C7. 45, A0, 00000000
000043E7        jmp     ?_391                           ; 43E7 _ EB, 1E

?_390:
000043E9        mov     rax, qword ptr [_gRT]           ; 43E9 _ 48: 8B. 05, 00004D60(rel)
000043F0        xor     ecx, ecx                        ; 43F0 _ 31. C9
000043F2        xor     edx, edx                        ; 43F2 _ 31. D2
000043F4        xor     r8d, r8d                        ; 43F4 _ 45: 31. C0
000043F7        xor     r9d, r9d                        ; 43F7 _ 45: 31. C9
000043FA        call    qword ptr [rax+68H]             ; 43FA _ FF. 50, 68
000043FD        mov     rsi, 15H                        ; 43FD _ 48: BE, 8000000000000015
?_391:
00004407        mov     rax, rsi                        ; 4407 _ 48: 89. F0
0000440A        add     rsp, 128                        ; 440A _ 48: 81. C4, 00000080
00004411        pop     rbx                             ; 4411 _ 5B
00004412        pop     rdi                             ; 4412 _ 5F
00004413        pop     rsi                             ; 4413 _ 5E
00004414        pop     r14                             ; 4414 _ 41: 5E
00004416        pop     rbp                             ; 4416 _ 5D
00004417        ret                                     ; 4417 _ C3
_InitializeUpdateDriver ENDP

_ProfileGetLine PROC
00004418        push    rbp                             ; 4418 _ 55
00004419        mov     rbp, rsp                        ; 4419 _ 48: 89. E5
0000441C        push    r14                             ; 441C _ 41: 56
0000441E        push    rsi                             ; 441E _ 56
0000441F        push    rdi                             ; 441F _ 57
00004420        push    rbx                             ; 4420 _ 53
00004421        sub     rsp, 32                         ; 4421 _ 48: 83. EC, 20
00004425        mov     rdi, r9                         ; 4425 _ 4C: 89. CF
00004428        mov     r14, r8                         ; 4428 _ 4D: 89. C6
0000442B        mov     rsi, rdx                        ; 442B _ 48: 89. D6
0000442E        mov     rbx, rcx                        ; 442E _ 48: 89. CB
00004431        lea     rcx, ptr [rbx+rsi]              ; 4431 _ 48: 8D. 0C 33
00004435        mov     rax, rbx                        ; 4435 _ 48: 89. D8
00004438        jmp     ?_393                           ; 4438 _ EB, 03

?_392:
0000443A        inc     rax                             ; 443A _ 48: FF. C0
?_393:
0000443D        cmp     rax, rcx                        ; 443D _ 48: 39. C8
00004440        jnc     ?_394                           ; 4440 _ 73, 05
00004442        cmp     byte ptr [rax], 13              ; 4442 _ 80. 38, 0D
00004445        jnz     ?_392                           ; 4445 _ 75, F3
?_394:
00004447        dec     rcx                             ; 4447 _ 48: FF. C9
0000444A        cmp     rax, rcx                        ; 444A _ 48: 39. C8
0000444D        jnc     ?_396                           ; 444D _ 73, 15
0000444F        mov     rsi, rax                        ; 444F _ 48: 89. C6
00004452        sub     rsi, rbx                        ; 4452 _ 48: 29. DE
00004455        cmp     byte ptr [rax+1H], 10           ; 4455 _ 80. 78, 01, 0A
00004459        jnz     ?_395                           ; 4459 _ 75, 06
0000445B        add     rsi, 2                          ; 445B _ 48: 83. C6, 02
0000445F        jmp     ?_396                           ; 445F _ EB, 03

?_395:
00004461        inc     rsi                             ; 4461 _ 48: FF. C6
?_396:
00004464        mov     rdx, qword ptr [rdi]            ; 4464 _ 48: 8B. 17
00004467        cmp     rsi, rdx                        ; 4467 _ 48: 39. D6
0000446A        jbe     ?_397                           ; 446A _ 76, 0F
0000446C        mov     qword ptr [rdi], rsi            ; 446C _ 48: 89. 37
0000446F        mov     rax, 5H                         ; 446F _ 48: B8, 8000000000000005
00004479        jmp     ?_398                           ; 4479 _ EB, 1E

?_397:
0000447B        mov     rcx, r14                        ; 447B _ 4C: 89. F1
0000447E        xor     r8d, r8d                        ; 447E _ 45: 31. C0
00004481        call    _SetMem                         ; 4481 _ E8, FFFFBF52
00004486        mov     qword ptr [rdi], rsi            ; 4486 _ 48: 89. 37
00004489        mov     rcx, r14                        ; 4489 _ 4C: 89. F1
0000448C        mov     rdx, rbx                        ; 448C _ 48: 89. DA
0000448F        mov     r8, rsi                         ; 448F _ 49: 89. F0
00004492        call    _CopyMem                        ; 4492 _ E8, FFFFBFAD
00004497        xor     eax, eax                        ; 4497 _ 31. C0
?_398:
00004499        add     rsp, 32                         ; 4499 _ 48: 83. C4, 20
0000449D        pop     rbx                             ; 449D _ 5B
0000449E        pop     rdi                             ; 449E _ 5F
0000449F        pop     rsi                             ; 449F _ 5E
000044A0        pop     r14                             ; 44A0 _ 41: 5E
000044A2        pop     rbp                             ; 44A2 _ 5D
000044A3        ret                                     ; 44A3 _ C3
_ProfileGetLine ENDP

_ProfileTrim PROC
000044A4        push    rsi                             ; 44A4 _ 56
000044A5        mov     rax, qword ptr [rdx]            ; 44A5 _ 48: 8B. 02
000044A8        test    rax, rax                        ; 44A8 _ 48: 85. C0
000044AB        je      ?_408                           ; 44AB _ 0F 84, 0000008D
000044B1        lea     r8, ptr [rcx+rax-1H]            ; 44B1 _ 4C: 8D. 44 01, FF
000044B6        mov     rax, 2600H                      ; 44B6 _ 48: B8, 0000000100002600
000044C0        jmp     ?_400                           ; 44C0 _ EB, 13

?_399:
000044C2        movzx   esi, byte ptr [r8]              ; 44C2 _ 41: 0F B6. 30
000044C6        cmp     rsi, 32                         ; 44C6 _ 48: 83. FE, 20
000044CA        ja      ?_401                           ; 44CA _ 77, 17
000044CC        bt      rax, rsi                        ; 44CC _ 48: 0F A3. F0
000044D0        jnc     ?_401                           ; 44D0 _ 73, 11
000044D2        dec     r8                              ; 44D2 _ 49: FF. C8
?_400:
000044D5        cmp     r8, rcx                         ; 44D5 _ 49: 39. C8
000044D8        jnc     ?_399                           ; 44D8 _ 73, E8
000044DA        mov     qword ptr [rdx], 0              ; 44DA _ 48: C7. 02, 00000000
000044E1        jmp     ?_408                           ; 44E1 _ EB, 5B

?_401:
000044E3        mov     r9d, 1                          ; 44E3 _ 41: B9, 00000001
000044E9        sub     r9, rcx                         ; 44E9 _ 49: 29. C9
000044EC        add     r9, r8                          ; 44EC _ 4D: 01. C1
000044EF        xor     r10d, r10d                      ; 44EF _ 45: 31. D2
000044F2        mov     r11, 2600H                      ; 44F2 _ 49: BB, 0000000100002600
000044FC        jmp     ?_403                           ; 44FC _ EB, 03

?_402:
000044FE        inc     r10                             ; 44FE _ 49: FF. C2
?_403:
00004501        lea     rax, ptr [rcx+r10]              ; 4501 _ 4A: 8D. 04 11
00004505        cmp     rax, r8                         ; 4505 _ 4C: 39. C0
00004508        ja      ?_404                           ; 4508 _ 77, 0F
0000450A        movzx   esi, byte ptr [rax]             ; 450A _ 0F B6. 30
0000450D        cmp     rsi, 32                         ; 450D _ 48: 83. FE, 20
00004511        ja      ?_404                           ; 4511 _ 77, 06
00004513        bt      r11, rsi                        ; 4513 _ 49: 0F A3. F3
00004517        jc      ?_402                           ; 4517 _ 72, E5
?_404:
00004519        test    r10, r10                        ; 4519 _ 4D: 85. D2
0000451C        jnz     ?_405                           ; 451C _ 75, 05
0000451E        mov     qword ptr [rdx], r9             ; 451E _ 4C: 89. 0A
00004521        jmp     ?_408                           ; 4521 _ EB, 1B

?_405:
00004523        lea     rsi, ptr [r8+1H]                ; 4523 _ 49: 8D. 70, 01
00004527        sub     rsi, rax                        ; 4527 _ 48: 29. C6
0000452A        mov     qword ptr [rdx], rsi            ; 452A _ 48: 89. 32
0000452D        jmp     ?_407                           ; 452D _ EB, 0A

?_406:
0000452F        mov     dl, byte ptr [rax]              ; 452F _ 8A. 10
00004531        mov     byte ptr [rcx], dl              ; 4531 _ 88. 11
00004533        inc     rcx                             ; 4533 _ 48: FF. C1
00004536        inc     rax                             ; 4536 _ 48: FF. C0
?_407:
00004539        cmp     rax, r8                         ; 4539 _ 4C: 39. C0
0000453C        jbe     ?_406                           ; 453C _ 76, F1
?_408:
0000453E        pop     rsi                             ; 453E _ 5E
0000453F        ret                                     ; 453F _ C3
_ProfileTrim ENDP

_ProfileGetComments PROC
00004540        push    rbp                             ; 4540 _ 55
00004541        mov     rbp, rsp                        ; 4541 _ 48: 89. E5
00004544        push    r14                             ; 4544 _ 41: 56
00004546        push    rsi                             ; 4546 _ 56
00004547        push    rdi                             ; 4547 _ 57
00004548        push    rbx                             ; 4548 _ 53
00004549        sub     rsp, 32                         ; 4549 _ 48: 83. EC, 20
0000454D        mov     rbx, r8                         ; 454D _ 4C: 89. C3
00004550        mov     rsi, rdx                        ; 4550 _ 48: 89. D6
00004553        mov     r14, rcx                        ; 4553 _ 49: 89. CE
00004556        mov     ecx, 16                         ; 4556 _ B9, 00000010
0000455B        call    _AllocatePool                   ; 455B _ E8, FFFFD0FF
00004560        mov     rdi, rax                        ; 4560 _ 48: 89. C7
00004563        mov     rax, 9H                         ; 4563 _ 48: B8, 8000000000000009
0000456D        test    rdi, rdi                        ; 456D _ 48: 85. FF
00004570        jz      ?_410                           ; 4570 _ 74, 46
00004572        mov     rax, qword ptr [rbx]            ; 4572 _ 48: 8B. 03
00004575        mov     qword ptr [rdi+8H], rax         ; 4575 _ 48: 89. 47, 08
00004579        mov     qword ptr [rbx], rdi            ; 4579 _ 48: 89. 3B
0000457C        lea     rcx, ptr [rsi+1H]               ; 457C _ 48: 8D. 4E, 01
00004580        call    _AllocatePool                   ; 4580 _ E8, FFFFD0DA
00004585        mov     qword ptr [rdi], rax            ; 4585 _ 48: 89. 07
00004588        test    rax, rax                        ; 4588 _ 48: 85. C0
0000458B        jnz     ?_409                           ; 458B _ 75, 14
0000458D        mov     rcx, rdi                        ; 458D _ 48: 89. F9
00004590        call    _FreePool                       ; 4590 _ E8, FFFFD1C2
00004595        mov     rax, 9H                         ; 4595 _ 48: B8, 8000000000000009
0000459F        jmp     ?_410                           ; 459F _ EB, 17

?_409:
000045A1        mov     rcx, rax                        ; 45A1 _ 48: 89. C1
000045A4        mov     rdx, r14                        ; 45A4 _ 4C: 89. F2
000045A7        mov     r8, rsi                         ; 45A7 _ 49: 89. F0
000045AA        call    _CopyMem                        ; 45AA _ E8, FFFFBE95
000045AF        mov     rax, qword ptr [rdi]            ; 45AF _ 48: 8B. 07
000045B2        mov     byte ptr [rax+rsi], 0           ; 45B2 _ C6. 04 30, 00
000045B6        xor     eax, eax                        ; 45B6 _ 31. C0
?_410:
000045B8        add     rsp, 32                         ; 45B8 _ 48: 83. C4, 20
000045BC        pop     rbx                             ; 45BC _ 5B
000045BD        pop     rdi                             ; 45BD _ 5F
000045BE        pop     rsi                             ; 45BE _ 5E
000045BF        pop     r14                             ; 45BF _ 41: 5E
000045C1        pop     rbp                             ; 45C1 _ 5D
000045C2        ret                                     ; 45C2 _ C3
_ProfileGetComments ENDP

_ProfileGetSection PROC
000045C3        push    rbp                             ; 45C3 _ 55
000045C4        mov     rbp, rsp                        ; 45C4 _ 48: 89. E5
000045C7        push    r14                             ; 45C7 _ 41: 56
000045C9        push    rsi                             ; 45C9 _ 56
000045CA        push    rdi                             ; 45CA _ 57
000045CB        push    rbx                             ; 45CB _ 53
000045CC        sub     rsp, 48                         ; 45CC _ 48: 83. EC, 30
000045D0        mov     r14, r8                         ; 45D0 _ 4D: 89. C6
000045D3        mov     rsi, rcx                        ; 45D3 _ 48: 89. CE
000045D6        lea     rcx, ptr [rdx+rsi-1H]           ; 45D6 _ 48: 8D. 4C 32, FF
000045DB        xor     eax, eax                        ; 45DB _ 31. C0
000045DD        jmp     ?_412                           ; 45DD _ EB, 03

?_411:
000045DF        dec     rcx                             ; 45DF _ 48: FF. C9
?_412:
000045E2        cmp     rcx, rsi                        ; 45E2 _ 48: 39. F1
000045E5        jbe     ?_413                           ; 45E5 _ 0F 86, 0000009F
000045EB        cmp     byte ptr [rcx], 93              ; 45EB _ 80. 39, 5D
000045EE        jnz     ?_411                           ; 45EE _ 75, EF
000045F0        mov     rax, rsi                        ; 45F0 _ 48: 89. F0
000045F3        not     rax                             ; 45F3 _ 48: F7. D0
000045F6        add     rcx, rax                        ; 45F6 _ 48: 01. C1
000045F9        mov     qword ptr [rbp-28H], rcx        ; 45F9 _ 48: 89. 4D, D8
000045FD        inc     rsi                             ; 45FD _ 48: FF. C6
00004600        lea     rdx, ptr [rbp-28H]              ; 4600 _ 48: 8D. 55, D8
00004604        mov     rcx, rsi                        ; 4604 _ 48: 89. F1
00004607        call    _ProfileTrim                    ; 4607 _ E8, FFFFFE98
0000460C        xor     eax, eax                        ; 460C _ 31. C0
0000460E        mov     rbx, qword ptr [rbp-28H]        ; 460E _ 48: 8B. 5D, D8
00004612        test    rbx, rbx                        ; 4612 _ 48: 85. DB
00004615        jz      ?_413                           ; 4615 _ 74, 73
00004617        mov     ecx, 40                         ; 4617 _ B9, 00000028
0000461C        call    _AllocatePool                   ; 461C _ E8, FFFFD03E
00004621        mov     rdi, rax                        ; 4621 _ 48: 89. C7
00004624        mov     rax, 9H                         ; 4624 _ 48: B8, 8000000000000009
0000462E        test    rdi, rdi                        ; 462E _ 48: 85. FF
00004631        jz      ?_413                           ; 4631 _ 74, 57
00004633        mov     qword ptr [rdi], 0              ; 4633 _ 48: C7. 07, 00000000
0000463A        mov     qword ptr [rdi+8H], rbx         ; 463A _ 48: 89. 5F, 08
0000463E        mov     qword ptr [rdi+10H], 0          ; 463E _ 48: C7. 47, 10, 00000000
00004646        mov     qword ptr [rdi+18H], 0          ; 4646 _ 48: C7. 47, 18, 00000000
0000464E        mov     rax, qword ptr [r14]            ; 464E _ 49: 8B. 06
00004651        mov     qword ptr [rdi+20H], rax        ; 4651 _ 48: 89. 47, 20
00004655        mov     qword ptr [r14], rdi            ; 4655 _ 49: 89. 3E
00004658        lea     rcx, ptr [rbx+1H]               ; 4658 _ 48: 8D. 4B, 01
0000465C        call    _AllocatePool                   ; 465C _ E8, FFFFCFFE
00004661        mov     rcx, rax                        ; 4661 _ 48: 89. C1
00004664        mov     rax, 9H                         ; 4664 _ 48: B8, 8000000000000009
0000466E        mov     qword ptr [rdi], rcx            ; 466E _ 48: 89. 0F
00004671        test    rcx, rcx                        ; 4671 _ 48: 85. C9
00004674        jz      ?_413                           ; 4674 _ 74, 14
00004676        mov     rdx, rsi                        ; 4676 _ 48: 89. F2
00004679        mov     r8, rbx                         ; 4679 _ 49: 89. D8
0000467C        call    _CopyMem                        ; 467C _ E8, FFFFBDC3
00004681        mov     rax, qword ptr [rdi]            ; 4681 _ 48: 8B. 07
00004684        mov     byte ptr [rax+rbx], 0           ; 4684 _ C6. 04 18, 00
00004688        xor     eax, eax                        ; 4688 _ 31. C0
?_413:
0000468A        add     rsp, 48                         ; 468A _ 48: 83. C4, 30
0000468E        pop     rbx                             ; 468E _ 5B
0000468F        pop     rdi                             ; 468F _ 5F
00004690        pop     rsi                             ; 4690 _ 5E
00004691        pop     r14                             ; 4691 _ 41: 5E
00004693        pop     rbp                             ; 4693 _ 5D
00004694        ret                                     ; 4694 _ C3
_ProfileGetSection ENDP

_ProfileGetEntry PROC
00004695        push    rbp                             ; 4695 _ 55
00004696        mov     rbp, rsp                        ; 4696 _ 48: 89. E5
00004699        push    r15                             ; 4699 _ 41: 57
0000469B        push    r14                             ; 469B _ 41: 56
0000469D        push    r13                             ; 469D _ 41: 55
0000469F        push    r12                             ; 469F _ 41: 54
000046A1        push    rsi                             ; 46A1 _ 56
000046A2        push    rdi                             ; 46A2 _ 57
000046A3        push    rbx                             ; 46A3 _ 53
000046A4        sub     rsp, 40                         ; 46A4 _ 48: 83. EC, 28
000046A8        mov     r15, r8                         ; 46A8 _ 4D: 89. C7
000046AB        mov     r14, rcx                        ; 46AB _ 49: 89. CE
000046AE        lea     rbx, ptr [rdx+r14-1H]           ; 46AE _ 4A: 8D. 5C 32, FF
000046B3        mov     rsi, r14                        ; 46B3 _ 4C: 89. F6
000046B6        xor     eax, eax                        ; 46B6 _ 31. C0
000046B8        jmp     ?_415                           ; 46B8 _ EB, 03

?_414:
000046BA        inc     rsi                             ; 46BA _ 48: FF. C6
?_415:
000046BD        cmp     rsi, rbx                        ; 46BD _ 48: 39. DE
000046C0        ja      ?_419                           ; 46C0 _ 0F 87, 00000151
000046C6        cmp     byte ptr [rsi], 61              ; 46C6 _ 80. 3E, 3D
000046C9        jnz     ?_414                           ; 46C9 _ 75, EF
000046CB        mov     rax, rsi                        ; 46CB _ 48: 89. F0
000046CE        sub     rax, r14                        ; 46CE _ 4C: 29. F0
000046D1        mov     qword ptr [rbp-40H], rax        ; 46D1 _ 48: 89. 45, C0
000046D5        lea     rdx, ptr [rbp-40H]              ; 46D5 _ 48: 8D. 55, C0
000046D9        mov     rcx, r14                        ; 46D9 _ 4C: 89. F1
000046DC        call    _ProfileTrim                    ; 46DC _ E8, FFFFFDC3
000046E1        xor     eax, eax                        ; 46E1 _ 31. C0
000046E3        mov     r12, qword ptr [rbp-40H]        ; 46E3 _ 4C: 8B. 65, C0
000046E7        test    r12, r12                        ; 46E7 _ 4D: 85. E4
000046EA        je      ?_419                           ; 46EA _ 0F 84, 00000127
000046F0        mov     r13, qword ptr [r15]            ; 46F0 _ 4D: 8B. 2F
000046F3        xor     eax, eax                        ; 46F3 _ 31. C0
000046F5        test    r13, r13                        ; 46F5 _ 4D: 85. ED
000046F8        je      ?_419                           ; 46F8 _ 0F 84, 00000119
000046FE        mov     ecx, 40                         ; 46FE _ B9, 00000028
00004703        call    _AllocatePool                   ; 4703 _ E8, FFFFCF57
00004708        mov     rdi, rax                        ; 4708 _ 48: 89. C7
0000470B        mov     rax, 9H                         ; 470B _ 48: B8, 8000000000000009
00004715        test    rdi, rdi                        ; 4715 _ 48: 85. FF
00004718        je      ?_419                           ; 4718 _ 0F 84, 000000F9
0000471E        mov     qword ptr [rdi], 0              ; 471E _ 48: C7. 07, 00000000
00004725        mov     qword ptr [rdi+10H], 0          ; 4725 _ 48: C7. 47, 10, 00000000
0000472D        mov     qword ptr [rdi+18H], 0          ; 472D _ 48: C7. 47, 18, 00000000
00004735        mov     rax, qword ptr [r13+8H]         ; 4735 _ 49: 8B. 45, 08
00004739        mov     qword ptr [rdi+8H], rax         ; 4739 _ 48: 89. 47, 08
0000473D        mov     rax, qword ptr [r15]            ; 473D _ 49: 8B. 07
00004740        mov     qword ptr [rdi+20H], rax        ; 4740 _ 48: 89. 47, 20
00004744        mov     qword ptr [r15], rdi            ; 4744 _ 49: 89. 3F
00004747        mov     rcx, qword ptr [r13+8H]         ; 4747 _ 49: 8B. 4D, 08
0000474B        inc     rcx                             ; 474B _ 48: FF. C1
0000474E        call    _AllocatePool                   ; 474E _ E8, FFFFCF0C
00004753        mov     rcx, rax                        ; 4753 _ 48: 89. C1
00004756        mov     rax, 9H                         ; 4756 _ 48: B8, 8000000000000009
00004760        mov     qword ptr [rdi], rcx            ; 4760 _ 48: 89. 0F
00004763        test    rcx, rcx                        ; 4763 _ 48: 85. C9
00004766        je      ?_419                           ; 4766 _ 0F 84, 000000AB
0000476C        mov     rdx, qword ptr [r13]            ; 476C _ 49: 8B. 55, 00
00004770        mov     r8, qword ptr [r13+8H]          ; 4770 _ 4D: 8B. 45, 08
00004774        inc     r8                              ; 4774 _ 49: FF. C0
00004777        call    _CopyMem                        ; 4777 _ E8, FFFFBCC8
0000477C        lea     rcx, ptr [r12+1H]               ; 477C _ 49: 8D. 4C 24, 01
00004781        call    _AllocatePool                   ; 4781 _ E8, FFFFCED9
00004786        mov     rcx, rax                        ; 4786 _ 48: 89. C1
00004789        mov     qword ptr [rdi+10H], rcx        ; 4789 _ 48: 89. 4F, 10
0000478D        mov     rax, 9H                         ; 478D _ 48: B8, 8000000000000009
00004797        test    rcx, rcx                        ; 4797 _ 48: 85. C9
0000479A        jz      ?_419                           ; 479A _ 74, 7B
0000479C        mov     rdx, r14                        ; 479C _ 4C: 89. F2
0000479F        mov     r8, r12                         ; 479F _ 4D: 89. E0
000047A2        call    _CopyMem                        ; 47A2 _ E8, FFFFBC9D
000047A7        mov     rax, qword ptr [rdi+10H]        ; 47A7 _ 48: 8B. 47, 10
000047AB        mov     byte ptr [rax+r12], 0           ; 47AB _ 42: C6. 04 20, 00
000047B0        inc     rsi                             ; 47B0 _ 48: FF. C6
000047B3        mov     rax, rsi                        ; 47B3 _ 48: 89. F0
000047B6        jmp     ?_417                           ; 47B6 _ EB, 03

?_416:
000047B8        inc     rax                             ; 47B8 _ 48: FF. C0
?_417:
000047BB        cmp     rax, rbx                        ; 47BB _ 48: 39. D8
000047BE        ja      ?_418                           ; 47BE _ 77, 05
000047C0        cmp     byte ptr [rax], 35              ; 47C0 _ 80. 38, 23
000047C3        jnz     ?_416                           ; 47C3 _ 75, F3
?_418:
000047C5        sub     rax, rsi                        ; 47C5 _ 48: 29. F0
000047C8        mov     qword ptr [rbp-40H], rax        ; 47C8 _ 48: 89. 45, C0
000047CC        lea     rdx, ptr [rbp-40H]              ; 47CC _ 48: 8D. 55, C0
000047D0        mov     rcx, rsi                        ; 47D0 _ 48: 89. F1
000047D3        call    _ProfileTrim                    ; 47D3 _ E8, FFFFFCCC
000047D8        xor     eax, eax                        ; 47D8 _ 31. C0
000047DA        mov     rbx, qword ptr [rbp-40H]        ; 47DA _ 48: 8B. 5D, C0
000047DE        test    rbx, rbx                        ; 47DE _ 48: 85. DB
000047E1        jz      ?_419                           ; 47E1 _ 74, 34
000047E3        lea     rcx, ptr [rbx+1H]               ; 47E3 _ 48: 8D. 4B, 01
000047E7        call    _AllocatePool                   ; 47E7 _ E8, FFFFCE73
000047EC        mov     rcx, rax                        ; 47EC _ 48: 89. C1
000047EF        mov     qword ptr [rdi+18H], rcx        ; 47EF _ 48: 89. 4F, 18
000047F3        mov     rax, 9H                         ; 47F3 _ 48: B8, 8000000000000009
000047FD        test    rcx, rcx                        ; 47FD _ 48: 85. C9
00004800        jz      ?_419                           ; 4800 _ 74, 15
00004802        mov     rdx, rsi                        ; 4802 _ 48: 89. F2
00004805        mov     r8, rbx                         ; 4805 _ 49: 89. D8
00004808        call    _CopyMem                        ; 4808 _ E8, FFFFBC37
0000480D        mov     rax, qword ptr [rdi+18H]        ; 480D _ 48: 8B. 47, 18
00004811        mov     byte ptr [rax+rbx], 0           ; 4811 _ C6. 04 18, 00
00004815        xor     eax, eax                        ; 4815 _ 31. C0
?_419:
00004817        add     rsp, 40                         ; 4817 _ 48: 83. C4, 28
0000481B        pop     rbx                             ; 481B _ 5B
0000481C        pop     rdi                             ; 481C _ 5F
0000481D        pop     rsi                             ; 481D _ 5E
0000481E        pop     r12                             ; 481E _ 41: 5C
00004820        pop     r13                             ; 4820 _ 41: 5D
00004822        pop     r14                             ; 4822 _ 41: 5E
00004824        pop     r15                             ; 4824 _ 41: 5F
00004826        pop     rbp                             ; 4826 _ 5D
00004827        ret                                     ; 4827 _ C3
_ProfileGetEntry ENDP

_FreeAllList PROC
00004828        push    rbp                             ; 4828 _ 55
00004829        mov     rbp, rsp                        ; 4829 _ 48: 89. E5
0000482C        push    rsi                             ; 482C _ 56
0000482D        push    rdi                             ; 482D _ 57
0000482E        push    rbx                             ; 482E _ 53
0000482F        sub     rsp, 40                         ; 482F _ 48: 83. EC, 28
00004833        mov     rsi, rdx                        ; 4833 _ 48: 89. D6
00004836        mov     rdi, rcx                        ; 4836 _ 48: 89. CF
00004839        test    rdi, rdi                        ; 4839 _ 48: 85. FF
0000483C        jnz     ?_424                           ; 483C _ 75, 2F
?_420:
0000483E        test    rsi, rsi                        ; 483E _ 48: 85. F6
00004841        jz      ?_423                           ; 4841 _ 74, 21
?_421:
00004843        mov     rcx, qword ptr [rsi]            ; 4843 _ 48: 8B. 0E
00004846        mov     rdi, qword ptr [rsi+8H]         ; 4846 _ 48: 8B. 7E, 08
0000484A        test    rcx, rcx                        ; 484A _ 48: 85. C9
0000484D        jz      ?_422                           ; 484D _ 74, 05
0000484F        call    _FreePool                       ; 484F _ E8, FFFFCF03
?_422:
00004854        mov     rcx, rsi                        ; 4854 _ 48: 89. F1
00004857        call    _FreePool                       ; 4857 _ E8, FFFFCEFB
0000485C        test    rdi, rdi                        ; 485C _ 48: 85. FF
0000485F        mov     rsi, rdi                        ; 485F _ 48: 89. FE
00004862        jnz     ?_421                           ; 4862 _ 75, DF
?_423:
00004864        add     rsp, 40                         ; 4864 _ 48: 83. C4, 28
00004868        pop     rbx                             ; 4868 _ 5B
00004869        pop     rdi                             ; 4869 _ 5F
0000486A        pop     rsi                             ; 486A _ 5E
0000486B        pop     rbp                             ; 486B _ 5D
0000486C        ret                                     ; 486C _ C3
_FreeAllList ENDP

?_424   LABEL NEAR
0000486D        mov     rcx, qword ptr [rdi+10H]        ; 486D _ 48: 8B. 4F, 10
00004871        mov     rbx, qword ptr [rdi+20H]        ; 4871 _ 48: 8B. 5F, 20
00004875        test    rcx, rcx                        ; 4875 _ 48: 85. C9
00004878        jz      ?_425                           ; 4878 _ 74, 05
0000487A        call    _FreePool                       ; 487A _ E8, FFFFCED8
?_425:
0000487F        mov     rcx, qword ptr [rdi]            ; 487F _ 48: 8B. 0F
00004882        test    rcx, rcx                        ; 4882 _ 48: 85. C9
00004885        jz      ?_426                           ; 4885 _ 74, 05
00004887        call    _FreePool                       ; 4887 _ E8, FFFFCECB
?_426:
0000488C        mov     rcx, qword ptr [rdi+18H]        ; 488C _ 48: 8B. 4F, 18
00004890        test    rcx, rcx                        ; 4890 _ 48: 85. C9
00004893        jz      ?_427                           ; 4893 _ 74, 05
00004895        call    _FreePool                       ; 4895 _ E8, FFFFCEBD
?_427:
0000489A        mov     rcx, rdi                        ; 489A _ 48: 89. F9
0000489D        call    _FreePool                       ; 489D _ E8, FFFFCEB5
000048A2        test    rbx, rbx                        ; 48A2 _ 48: 85. DB
000048A5        mov     rdi, rbx                        ; 48A5 _ 48: 89. DF
000048A8        jz      ?_420                           ; 48A8 _ 74, 94
000048AA        jmp     ?_424                           ; 48AA _ EB, C1

_UpdateGetProfileString PROC
000048AC        push    rbp                             ; 48AC _ 55
000048AD        mov     rbp, rsp                        ; 48AD _ 48: 89. E5
000048B0        push    r14                             ; 48B0 _ 41: 56
000048B2        push    rsi                             ; 48B2 _ 56
000048B3        push    rdi                             ; 48B3 _ 57
000048B4        push    rbx                             ; 48B4 _ 53
000048B5        sub     rsp, 32                         ; 48B5 _ 48: 83. EC, 20
000048B9        mov     r14, r9                         ; 48B9 _ 4D: 89. CE
000048BC        mov     rdi, r8                         ; 48BC _ 4C: 89. C7
000048BF        mov     rsi, rdx                        ; 48BF _ 48: 89. D6
000048C2        mov     rbx, rcx                        ; 48C2 _ 48: 89. CB
000048C5        mov     qword ptr [r14], 0              ; 48C5 _ 49: C7. 06, 00000000
000048CC        jmp     ?_429                           ; 48CC _ EB, 04

?_428:
000048CE        mov     rbx, qword ptr [rbx+20H]        ; 48CE _ 48: 8B. 5B, 20
?_429:
000048D2        mov     rax, 0EH                        ; 48D2 _ 48: B8, 800000000000000E
000048DC        test    rbx, rbx                        ; 48DC _ 48: 85. DB
000048DF        jz      ?_430                           ; 48DF _ 74, 2F
000048E1        mov     rcx, qword ptr [rbx]            ; 48E1 _ 48: 8B. 0B
000048E4        mov     rdx, rsi                        ; 48E4 _ 48: 89. F2
000048E7        call    _AsciiStrCmp                    ; 48E7 _ E8, FFFFC110
000048EC        test    rax, rax                        ; 48EC _ 48: 85. C0
000048EF        jnz     ?_428                           ; 48EF _ 75, DD
000048F1        mov     rcx, qword ptr [rbx+10H]        ; 48F1 _ 48: 8B. 4B, 10
000048F5        test    rcx, rcx                        ; 48F5 _ 48: 85. C9
000048F8        jz      ?_428                           ; 48F8 _ 74, D4
000048FA        mov     rdx, rdi                        ; 48FA _ 48: 89. FA
000048FD        call    _AsciiStrCmp                    ; 48FD _ E8, FFFFC0FA
00004902        test    rax, rax                        ; 4902 _ 48: 85. C0
00004905        jnz     ?_428                           ; 4905 _ 75, C7
00004907        mov     rax, qword ptr [rbx+18H]        ; 4907 _ 48: 8B. 43, 18
0000490B        mov     qword ptr [r14], rax            ; 490B _ 49: 89. 06
0000490E        xor     eax, eax                        ; 490E _ 31. C0
?_430:
00004910        add     rsp, 32                         ; 4910 _ 48: 83. C4, 20
00004914        pop     rbx                             ; 4914 _ 5B
00004915        pop     rdi                             ; 4915 _ 5F
00004916        pop     rsi                             ; 4916 _ 5E
00004917        pop     r14                             ; 4917 _ 41: 5E
00004919        pop     rbp                             ; 4919 _ 5D
0000491A        ret                                     ; 491A _ C3
_UpdateGetProfileString ENDP

_UpdateAtoi PROC
0000491B        inc     rcx                             ; 491B _ 48: FF. C1
0000491E        xor     eax, eax                        ; 491E _ 31. C0
00004920        jmp     ?_432                           ; 4920 _ EB, 03

?_431:
00004922        inc     rcx                             ; 4922 _ 48: FF. C1
?_432:
00004925        mov     r10b, byte ptr [rcx-1H]         ; 4925 _ 44: 8A. 51, FF
00004929        test    r10b, r10b                      ; 4929 _ 45: 84. D2
0000492C        jz      ?_433                           ; 492C _ 74, 22
0000492E        cmp     r10b, 32                        ; 492E _ 41: 80. FA, 20
00004932        jz      ?_431                           ; 4932 _ 74, EE
00004934        cmp     r10b, 48                        ; 4934 _ 41: 80. FA, 30
00004938        jz      ?_434                           ; 4938 _ 74, 17
0000493A        mov     r9b, r10b                       ; 493A _ 45: 88. D1
0000493D        add     r9b, -48                        ; 493D _ 41: 80. C1, D0
00004941        xor     eax, eax                        ; 4941 _ 31. C0
00004943        mov     r8, -48                         ; 4943 _ 49: C7. C0, FFFFFFD0
0000494A        cmp     r9b, 10                         ; 494A _ 41: 80. F9, 0A
0000494E        jc      ?_435                           ; 494E _ 72, 13
?_433:
00004950        ret                                     ; 4950 _ C3

?_434:
00004951        mov     al, byte ptr [rcx]              ; 4951 _ 8A. 01
00004953        or      al, 20H                         ; 4953 _ 0C, 20
00004955        cmp     al, 120                         ; 4955 _ 3C, 78
00004957        jz      ?_436                           ; 4957 _ 74, 2D
00004959        mov     r10b, 48                        ; 4959 _ 41: B2, 30
0000495C        mov     r8, -48                         ; 495C _ 49: C7. C0, FFFFFFD0
?_435:
00004963        movzx   eax, r10b                       ; 4963 _ 41: 0F B6. C2
00004967        add     rax, r8                         ; 4967 _ 4C: 01. C0
0000496A        mov     r10b, byte ptr [rcx]            ; 496A _ 44: 8A. 11
0000496D        mov     dl, r10b                        ; 496D _ 44: 88. D2
00004970        add     dl, -48                         ; 4970 _ 80. C2, D0
00004973        cmp     dl, 9                           ; 4973 _ 80. FA, 09
00004976        ja      ?_433                           ; 4976 _ 77, D8
00004978        inc     rcx                             ; 4978 _ 48: FF. C1
0000497B        lea     rax, ptr [rax+rax*4]            ; 497B _ 48: 8D. 04 80
0000497F        lea     r8, ptr [rax+rax-30H]           ; 497F _ 4C: 8D. 44 00, D0
00004984        jmp     ?_435                           ; 4984 _ EB, DD
_UpdateAtoi ENDP

?_436   LABEL NEAR
00004986        dec     rcx                             ; 4986 _ 48: FF. C9
00004989        jmp     _AsciiStrHexToUintn             ; 4989 _ E9, FFFFC2C0

_UpdateValueToString PROC
0000498E        push    rbp                             ; 498E _ 55
0000498F        mov     rbp, rsp                        ; 498F _ 48: 89. E5
00004992        push    r14                             ; 4992 _ 41: 56
00004994        push    rsi                             ; 4994 _ 56
00004995        push    rdi                             ; 4995 _ 57
00004996        push    rbx                             ; 4996 _ 53
00004997        sub     rsp, 80                         ; 4997 _ 48: 83. EC, 50
0000499B        mov     rax, rdx                        ; 499B _ 48: 89. D0
0000499E        mov     rsi, rcx                        ; 499E _ 48: 89. CE
000049A1        xor     r14d, r14d                      ; 49A1 _ 45: 31. F6
000049A4        test    rax, rax                        ; 49A4 _ 48: 85. C0
000049A7        jns     ?_437                           ; 49A7 _ 79, 0F
000049A9        mov     byte ptr [rsi], 45              ; 49A9 _ C6. 06, 2D
000049AC        neg     rax                             ; 49AC _ 48: F7. D8
000049AF        inc     rsi                             ; 49AF _ 48: FF. C6
000049B2        mov     r14d, 1                         ; 49B2 _ 41: BE, 00000001
?_437:
000049B8        mov     ebx, 1                          ; 49B8 _ BB, 00000001
000049BD        lea     rdi, ptr [rbp-44H]              ; 49BD _ 48: 8D. 7D, BC
?_438:
000049C1        mov     rcx, rax                        ; 49C1 _ 48: 89. C1
000049C4        mov     edx, 10                         ; 49C4 _ BA, 0000000A
000049C9        mov     r8, rdi                         ; 49C9 _ 49: 89. F8
000049CC        call    _DivU64x32Remainder             ; 49CC _ E8, FFFFBC7E
000049D1        mov     ecx, dword ptr [rbp-44H]        ; 49D1 _ 8B. 4D, BC
000049D4        add     ecx, 48                         ; 49D4 _ 83. C1, 30
000049D7        mov     byte ptr [rbp+rbx-40H], cl      ; 49D7 _ 88. 4C 1D, C0
000049DB        inc     rbx                             ; 49DB _ 48: FF. C3
000049DE        test    rax, rax                        ; 49DE _ 48: 85. C0
000049E1        jnz     ?_438                           ; 49E1 _ 75, DE
000049E3        cmp     rbx, 1                          ; 49E3 _ 48: 83. FB, 01
000049E7        jz      ?_441                           ; 49E7 _ 74, 1F
000049E9        lea     rax, ptr [rsi+rbx-1H]           ; 49E9 _ 48: 8D. 44 1E, FF
000049EE        lea     rdx, ptr [rbx-2H]               ; 49EE _ 48: 8D. 53, FE
000049F2        jmp     ?_440                           ; 49F2 _ EB, 0A

?_439:
000049F4        mov     cl, byte ptr [rbp+rdx-40H]      ; 49F4 _ 8A. 4C 15, C0
000049F8        dec     rdx                             ; 49F8 _ 48: FF. CA
000049FB        inc     rsi                             ; 49FB _ 48: FF. C6
?_440:
000049FE        mov     byte ptr [rsi], cl              ; 49FE _ 88. 0E
00004A00        test    rdx, rdx                        ; 4A00 _ 48: 85. D2
00004A03        jnz     ?_439                           ; 4A03 _ 75, EF
00004A05        mov     rsi, rax                        ; 4A05 _ 48: 89. C6
?_441:
00004A08        lea     rax, ptr [r14+rbx-1H]           ; 4A08 _ 49: 8D. 44 1E, FF
00004A0D        mov     byte ptr [rsi], 0               ; 4A0D _ C6. 06, 00
00004A10        add     rsp, 80                         ; 4A10 _ 48: 83. C4, 50
00004A14        pop     rbx                             ; 4A14 _ 5B
00004A15        pop     rdi                             ; 4A15 _ 5F
00004A16        pop     rsi                             ; 4A16 _ 5E
00004A17        pop     r14                             ; 4A17 _ 41: 5E
00004A19        pop     rbp                             ; 4A19 _ 5D
00004A1A        ret                                     ; 4A1A _ C3
_UpdateValueToString ENDP

_UpdateStringToGuid PROC
00004A1B        push    rbp                             ; 4A1B _ 55
00004A1C        mov     rbp, rsp                        ; 4A1C _ 48: 89. E5
00004A1F        push    r15                             ; 4A1F _ 41: 57
00004A21        push    r14                             ; 4A21 _ 41: 56
00004A23        push    rsi                             ; 4A23 _ 56
00004A24        push    rdi                             ; 4A24 _ 57
00004A25        push    rbx                             ; 4A25 _ 53
00004A26        sub     rsp, 40                         ; 4A26 _ 48: 83. EC, 28
00004A2A        mov     rsi, rdx                        ; 4A2A _ 48: 89. D6
00004A2D        mov     rdi, rcx                        ; 4A2D _ 48: 89. CF
00004A30        call    _AsciiStrLen                    ; 4A30 _ E8, FFFFBF35
00004A35        lea     rcx, ptr [rax+1H]               ; 4A35 _ 48: 8D. 48, 01
00004A39        mov     rdx, rdi                        ; 4A39 _ 48: 89. FA
00004A3C        call    _AllocateCopyPool               ; 4A3C _ E8, FFFFCD03
00004A41        mov     r14, rax                        ; 4A41 _ 49: 89. C6
00004A44        mov     rax, 9H                         ; 4A44 _ 48: B8, 8000000000000009
00004A4E        test    r14, r14                        ; 4A4E _ 4D: 85. F6
00004A51        je      ?_454                           ; 4A51 _ 0F 84, 00000115
00004A57        lea     rdi, ptr [r14+1H]               ; 4A57 _ 49: 8D. 7E, 01
00004A5B        jmp     ?_443                           ; 4A5B _ EB, 03

?_442:
00004A5D        inc     rdi                             ; 4A5D _ 48: FF. C7
?_443:
00004A60        mov     al, byte ptr [rdi-1H]           ; 4A60 _ 8A. 47, FF
00004A63        test    al, al                          ; 4A63 _ 84. C0
00004A65        je      ?_452                           ; 4A65 _ 0F 84, 000000E3
00004A6B        cmp     al, 45                          ; 4A6B _ 3C, 2D
00004A6D        jnz     ?_442                           ; 4A6D _ 75, EE
00004A6F        mov     byte ptr [rdi-1H], 0            ; 4A6F _ C6. 47, FF, 00
00004A73        mov     rcx, r14                        ; 4A73 _ 4C: 89. F1
00004A76        call    _AsciiStrHexToUintn             ; 4A76 _ E8, FFFFC1D3
00004A7B        mov     dword ptr [rsi], eax            ; 4A7B _ 89. 06
00004A7D        lea     rbx, ptr [rdi+1H]               ; 4A7D _ 48: 8D. 5F, 01
00004A81        jmp     ?_445                           ; 4A81 _ EB, 03

?_444:
00004A83        inc     rbx                             ; 4A83 _ 48: FF. C3
?_445:
00004A86        mov     al, byte ptr [rbx-1H]           ; 4A86 _ 8A. 43, FF
00004A89        test    al, al                          ; 4A89 _ 84. C0
00004A8B        je      ?_452                           ; 4A8B _ 0F 84, 000000BD
00004A91        cmp     al, 45                          ; 4A91 _ 3C, 2D
00004A93        jnz     ?_444                           ; 4A93 _ 75, EE
00004A95        mov     byte ptr [rbx-1H], 0            ; 4A95 _ C6. 43, FF, 00
00004A99        mov     rcx, rdi                        ; 4A99 _ 48: 89. F9
00004A9C        call    _AsciiStrHexToUintn             ; 4A9C _ E8, FFFFC1AD
00004AA1        mov     word ptr [rsi+4H], ax           ; 4AA1 _ 66: 89. 46, 04
00004AA5        lea     rdi, ptr [rbx+3H]               ; 4AA5 _ 48: 8D. 7B, 03
00004AA9        jmp     ?_447                           ; 4AA9 _ EB, 03

?_446:
00004AAB        inc     rdi                             ; 4AAB _ 48: FF. C7
?_447:
00004AAE        mov     al, byte ptr [rdi-3H]           ; 4AAE _ 8A. 47, FD
00004AB1        test    al, al                          ; 4AB1 _ 84. C0
00004AB3        je      ?_452                           ; 4AB3 _ 0F 84, 00000095
00004AB9        cmp     al, 45                          ; 4AB9 _ 3C, 2D
00004ABB        jnz     ?_446                           ; 4ABB _ 75, EE
00004ABD        mov     byte ptr [rdi-3H], 0            ; 4ABD _ C6. 47, FD, 00
00004AC1        mov     rcx, rbx                        ; 4AC1 _ 48: 89. D9
00004AC4        call    _AsciiStrHexToUintn             ; 4AC4 _ E8, FFFFC185
00004AC9        mov     word ptr [rsi+6H], ax           ; 4AC9 _ 66: 89. 46, 06
00004ACD        xor     ebx, ebx                        ; 4ACD _ 31. DB
00004ACF        lea     r15, ptr [rbp-2BH]              ; 4ACF _ 4C: 8D. 7D, D5
00004AD3        jmp     ?_449                           ; 4AD3 _ EB, 2A

?_448:
00004AD5        test    cl, cl                          ; 4AD5 _ 84. C9
00004AD7        jz      ?_452                           ; 4AD7 _ 74, 75
00004AD9        cmp     byte ptr [rdi-1H], 0            ; 4AD9 _ 80. 7F, FF, 00
00004ADD        jz      ?_452                           ; 4ADD _ 74, 6F
00004ADF        mov     byte ptr [rbp-2BH], cl          ; 4ADF _ 88. 4D, D5
00004AE2        mov     al, byte ptr [rdi-1H]           ; 4AE2 _ 8A. 47, FF
00004AE5        mov     byte ptr [rbp-2AH], al          ; 4AE5 _ 88. 45, D6
00004AE8        mov     byte ptr [rbp-29H], 0           ; 4AE8 _ C6. 45, D7, 00
00004AEC        mov     rcx, r15                        ; 4AEC _ 4C: 89. F9
00004AEF        call    _AsciiStrHexToUintn             ; 4AEF _ E8, FFFFC15A
00004AF4        add     rdi, 2                          ; 4AF4 _ 48: 83. C7, 02
00004AF8        mov     byte ptr [rsi+rbx+8H], al       ; 4AF8 _ 88. 44 1E, 08
00004AFC        inc     rbx                             ; 4AFC _ 48: FF. C3
?_449:
00004AFF        mov     cl, byte ptr [rdi-2H]           ; 4AFF _ 8A. 4F, FE
00004B02        cmp     rbx, 1                          ; 4B02 _ 48: 83. FB, 01
00004B06        jbe     ?_448                           ; 4B06 _ 76, CD
00004B08        mov     rax, 0EH                        ; 4B08 _ 48: B8, 800000000000000E
00004B12        cmp     cl, 45                          ; 4B12 _ 80. F9, 2D
00004B15        jnz     ?_454                           ; 4B15 _ 75, 55
00004B17        lea     r15, ptr [rbp-2BH]              ; 4B17 _ 4C: 8D. 7D, D5
00004B1B        jmp     ?_451                           ; 4B1B _ EB, 1F

?_450:
00004B1D        mov     byte ptr [rbp-2BH], al          ; 4B1D _ 88. 45, D5
00004B20        mov     al, byte ptr [rdi]              ; 4B20 _ 8A. 07
00004B22        mov     byte ptr [rbp-2AH], al          ; 4B22 _ 88. 45, D6
00004B25        mov     byte ptr [rbp-29H], 0           ; 4B25 _ C6. 45, D7, 00
00004B29        mov     rcx, r15                        ; 4B29 _ 4C: 89. F9
00004B2C        call    _AsciiStrHexToUintn             ; 4B2C _ E8, FFFFC11D
00004B31        add     rdi, 2                          ; 4B31 _ 48: 83. C7, 02
00004B35        mov     byte ptr [rsi+rbx+8H], al       ; 4B35 _ 88. 44 1E, 08
00004B39        inc     rbx                             ; 4B39 _ 48: FF. C3
?_451:
00004B3C        cmp     rbx, 7                          ; 4B3C _ 48: 83. FB, 07
00004B40        ja      ?_453                           ; 4B40 _ 77, 20
00004B42        mov     al, byte ptr [rdi-1H]           ; 4B42 _ 8A. 47, FF
00004B45        test    al, al                          ; 4B45 _ 84. C0
00004B47        jz      ?_452                           ; 4B47 _ 74, 05
00004B49        cmp     byte ptr [rdi], 0               ; 4B49 _ 80. 3F, 00
00004B4C        jnz     ?_450                           ; 4B4C _ 75, CF
?_452:
00004B4E        mov     rcx, r14                        ; 4B4E _ 4C: 89. F1
00004B51        call    _FreePool                       ; 4B51 _ E8, FFFFCC01
00004B56        mov     rax, 0EH                        ; 4B56 _ 48: B8, 800000000000000E
00004B60        jmp     ?_454                           ; 4B60 _ EB, 0A

?_453:
00004B62        mov     rcx, r14                        ; 4B62 _ 4C: 89. F1
00004B65        call    _FreePool                       ; 4B65 _ E8, FFFFCBED
00004B6A        xor     eax, eax                        ; 4B6A _ 31. C0
?_454:
00004B6C        add     rsp, 40                         ; 4B6C _ 48: 83. C4, 28
00004B70        pop     rbx                             ; 4B70 _ 5B
00004B71        pop     rdi                             ; 4B71 _ 5F
00004B72        pop     rsi                             ; 4B72 _ 5E
00004B73        pop     r14                             ; 4B73 _ 41: 5E
00004B75        pop     r15                             ; 4B75 _ 41: 5F
00004B77        pop     rbp                             ; 4B77 _ 5D
00004B78        ret                                     ; 4B78 _ C3
_UpdateStringToGuid ENDP

_PreProcessDataFile PROC
00004B79        push    rbp                             ; 4B79 _ 55
00004B7A        mov     rbp, rsp                        ; 4B7A _ 48: 89. E5
00004B7D        push    r15                             ; 4B7D _ 41: 57
00004B7F        push    r14                             ; 4B7F _ 41: 56
00004B81        push    r13                             ; 4B81 _ 41: 55
00004B83        push    r12                             ; 4B83 _ 41: 54
00004B85        push    rsi                             ; 4B85 _ 56
00004B86        push    rdi                             ; 4B86 _ 57
00004B87        push    rbx                             ; 4B87 _ 53
00004B88        sub     rsp, 56                         ; 4B88 _ 48: 83. EC, 38
00004B8C        mov     qword ptr [rbp-48H], r9         ; 4B8C _ 4C: 89. 4D, B8
00004B90        mov     r15, r8                         ; 4B90 _ 4D: 89. C7
00004B93        mov     r13, rdx                        ; 4B93 _ 49: 89. D5
00004B96        mov     rbx, rcx                        ; 4B96 _ 48: 89. CB
00004B99        mov     qword ptr [r15], 0              ; 4B99 _ 49: C7. 07, 00000000
00004BA0        mov     qword ptr [r9], 0               ; 4BA0 _ 49: C7. 01, 00000000
00004BA7        mov     r12d, 512                       ; 4BA7 _ 41: BC, 00000200
00004BAD        mov     ecx, 512                        ; 4BAD _ B9, 00000200
00004BB2        call    _AllocatePool                   ; 4BB2 _ E8, FFFFCAA8
00004BB7        mov     rsi, rax                        ; 4BB7 _ 48: 89. C6
00004BBA        mov     rdi, 9H                         ; 4BBA _ 48: BF, 8000000000000009
00004BC4        test    rsi, rsi                        ; 4BC4 _ 48: 85. F6
00004BC7        je      ?_462                           ; 4BC7 _ 0F 84, 000000E3
00004BCD        add     r13, rbx                        ; 4BCD _ 49: 01. DD
00004BD0        xor     edi, edi                        ; 4BD0 _ 31. FF
?_455:
00004BD2        cmp     rbx, r13                        ; 4BD2 _ 4C: 39. EB
00004BD5        jnc     ?_461                           ; 4BD5 _ 0F 83, 000000CD
00004BDB        mov     qword ptr [rbp-40H], r12        ; 4BDB _ 4C: 89. 65, C0
00004BDF        mov     rdx, r13                        ; 4BDF _ 4C: 89. EA
00004BE2        sub     rdx, rbx                        ; 4BE2 _ 48: 29. DA
00004BE5        mov     rcx, rbx                        ; 4BE5 _ 48: 89. D9
00004BE8        mov     r8, rsi                         ; 4BE8 _ 49: 89. F0
00004BEB        lea     r9, ptr [rbp-40H]               ; 4BEB _ 4C: 8D. 4D, C0
00004BEF        call    _ProfileGetLine                 ; 4BEF _ E8, FFFFF824
00004BF4        mov     rdi, rax                        ; 4BF4 _ 48: 89. C7
00004BF7        test    rdi, rdi                        ; 4BF7 _ 48: 85. FF
00004BFA        js      ?_456                           ; 4BFA _ 78, 06
00004BFC        mov     r14, qword ptr [rbp-40H]        ; 4BFC _ 4C: 8B. 75, C0
00004C00        jmp     ?_457                           ; 4C00 _ EB, 54

?_456:
00004C02        mov     rax, 5H                         ; 4C02 _ 48: B8, 8000000000000005
00004C0C        cmp     rdi, rax                        ; 4C0C _ 48: 39. C7
00004C0F        jne     ?_461                           ; 4C0F _ 0F 85, 00000093
00004C15        mov     rcx, rsi                        ; 4C15 _ 48: 89. F1
00004C18        call    _FreePool                       ; 4C18 _ E8, FFFFCB3A
00004C1D        mov     rdi, qword ptr [rbp-40H]        ; 4C1D _ 48: 8B. 7D, C0
00004C21        mov     rcx, rdi                        ; 4C21 _ 48: 89. F9
00004C24        call    _AllocatePool                   ; 4C24 _ E8, FFFFCA36
00004C29        mov     rsi, rax                        ; 4C29 _ 48: 89. C6
00004C2C        test    rsi, rsi                        ; 4C2C _ 48: 85. F6
00004C2F        je      ?_463                           ; 4C2F _ 0F 84, 0000008F
00004C35        mov     rcx, rbx                        ; 4C35 _ 48: 89. D9
00004C38        mov     rdx, rdi                        ; 4C38 _ 48: 89. FA
00004C3B        mov     r8, rsi                         ; 4C3B _ 49: 89. F0
00004C3E        lea     r9, ptr [rbp-40H]               ; 4C3E _ 4C: 8D. 4D, C0
00004C42        call    _ProfileGetLine                 ; 4C42 _ E8, FFFFF7D1
00004C47        mov     rdi, rax                        ; 4C47 _ 48: 89. C7
00004C4A        test    rdi, rdi                        ; 4C4A _ 48: 85. FF
00004C4D        js      ?_461                           ; 4C4D _ 78, 59
00004C4F        mov     r14, qword ptr [rbp-40H]        ; 4C4F _ 4C: 8B. 75, C0
00004C53        mov     r12, r14                        ; 4C53 _ 4D: 89. F4
?_457:
00004C56        mov     rcx, rsi                        ; 4C56 _ 48: 89. F1
00004C59        lea     rdx, ptr [rbp-40H]              ; 4C59 _ 48: 8D. 55, C0
00004C5D        call    _ProfileTrim                    ; 4C5D _ E8, FFFFF842
00004C62        add     rbx, r14                        ; 4C62 _ 4C: 01. F3
00004C65        mov     rdx, qword ptr [rbp-40H]        ; 4C65 _ 48: 8B. 55, C0
00004C69        test    rdx, rdx                        ; 4C69 _ 48: 85. D2
00004C6C        je      ?_455                           ; 4C6C _ 0F 84, FFFFFF60
00004C72        mov     al, byte ptr [rsi]              ; 4C72 _ 8A. 06
00004C74        mov     rcx, rsi                        ; 4C74 _ 48: 89. F1
00004C77        cmp     al, 91                          ; 4C77 _ 3C, 5B
00004C79        jz      ?_458                           ; 4C79 _ 74, 0F
00004C7B        cmp     al, 35                          ; 4C7B _ 3C, 23
00004C7D        jnz     ?_459                           ; 4C7D _ 75, 15
00004C7F        mov     r8, qword ptr [rbp-48H]         ; 4C7F _ 4C: 8B. 45, B8
00004C83        call    _ProfileGetComments             ; 4C83 _ E8, FFFFF8B8
00004C88        jmp     ?_460                           ; 4C88 _ EB, 12

?_458:
00004C8A        mov     r8, r15                         ; 4C8A _ 4D: 89. F8
00004C8D        call    _ProfileGetSection              ; 4C8D _ E8, FFFFF931
00004C92        jmp     ?_460                           ; 4C92 _ EB, 08

?_459:
00004C94        mov     r8, r15                         ; 4C94 _ 4D: 89. F8
00004C97        call    _ProfileGetEntry                ; 4C97 _ E8, FFFFF9F9
?_460:
00004C9C        mov     rdi, rax                        ; 4C9C _ 48: 89. C7
00004C9F        test    rdi, rdi                        ; 4C9F _ 48: 85. FF
00004CA2        jns     ?_455                           ; 4CA2 _ 0F 89, FFFFFF2A
?_461:
00004CA8        mov     rcx, rsi                        ; 4CA8 _ 48: 89. F1
00004CAB        call    _FreePool                       ; 4CAB _ E8, FFFFCAA7
?_462:
00004CB0        mov     rax, rdi                        ; 4CB0 _ 48: 89. F8
00004CB3        add     rsp, 56                         ; 4CB3 _ 48: 83. C4, 38
00004CB7        pop     rbx                             ; 4CB7 _ 5B
00004CB8        pop     rdi                             ; 4CB8 _ 5F
00004CB9        pop     rsi                             ; 4CB9 _ 5E
00004CBA        pop     r12                             ; 4CBA _ 41: 5C
00004CBC        pop     r13                             ; 4CBC _ 41: 5D
00004CBE        pop     r14                             ; 4CBE _ 41: 5E
00004CC0        pop     r15                             ; 4CC0 _ 41: 5F
00004CC2        pop     rbp                             ; 4CC2 _ 5D
00004CC3        ret                                     ; 4CC3 _ C3
_PreProcessDataFile ENDP

?_463   LABEL NEAR
00004CC4        mov     rdi, 9H                         ; 4CC4 _ 48: BF, 8000000000000009
00004CCE        xor     esi, esi                        ; 4CCE _ 31. F6
00004CD0        jmp     ?_461                           ; 4CD0 _ EB, D6

_ParseUpdateDataFile PROC
00004CD2        push    rbp                             ; 4CD2 _ 55
00004CD3        mov     rbp, rsp                        ; 4CD3 _ 48: 89. E5
00004CD6        push    r15                             ; 4CD6 _ 41: 57
00004CD8        push    r14                             ; 4CD8 _ 41: 56
00004CDA        push    r13                             ; 4CDA _ 41: 55
00004CDC        push    r12                             ; 4CDC _ 41: 54
00004CDE        push    rsi                             ; 4CDE _ 56
00004CDF        push    rdi                             ; 4CDF _ 57
00004CE0        push    rbx                             ; 4CE0 _ 53
00004CE1        sub     rsp, 600                        ; 4CE1 _ 48: 81. EC, 00000258
00004CE8        mov     rsi, r9                         ; 4CE8 _ 4C: 89. CE
00004CEB        mov     qword ptr [rbp-270H], rsi       ; 4CEB _ 48: 89. B5, FFFFFD90
00004CF2        mov     qword ptr [rbp-268H], r8        ; 4CF2 _ 4C: 89. 85, FFFFFD98
00004CF9        mov     qword ptr [rbp-248H], 0         ; 4CF9 _ 48: C7. 85, FFFFFDB8, 00000000
00004D04        mov     qword ptr [rbp-250H], 0         ; 4D04 _ 48: C7. 85, FFFFFDB0, 00000000
00004D0F        lea     r8, ptr [rbp-248H]              ; 4D0F _ 4C: 8D. 85, FFFFFDB8
00004D16        lea     r9, ptr [rbp-250H]              ; 4D16 _ 4C: 8D. 8D, FFFFFDB0
00004D1D        call    _PreProcessDataFile             ; 4D1D _ E8, FFFFFE57
00004D22        mov     r14, rax                        ; 4D22 _ 49: 89. C6
00004D25        test    r14, r14                        ; 4D25 _ 4D: 85. F6
00004D28        jns     ?_465                           ; 4D28 _ 79, 18
?_464:
00004D2A        mov     rdx, qword ptr [rbp-250H]       ; 4D2A _ 48: 8B. 95, FFFFFDB0
00004D31        mov     rcx, qword ptr [rbp-248H]       ; 4D31 _ 48: 8B. 8D, FFFFFDB8
00004D38        call    _FreeAllList                    ; 4D38 _ E8, FFFFFAEB
00004D3D        jmp     ?_476                           ; 4D3D _ E9, 000002FA

?_465:
00004D42        mov     qword ptr [rbp-40H], 0          ; 4D42 _ 48: C7. 45, C0, 00000000
00004D4A        mov     rcx, qword ptr [rbp-248H]       ; 4D4A _ 48: 8B. 8D, FFFFFDB8
00004D51        lea     rdx, ptr [?_656]                ; 4D51 _ 48: 8D. 15, 00002AE1(rel)
00004D58        lea     r8, ptr [?_657]                 ; 4D58 _ 4C: 8D. 05, 00002ADF(rel)
00004D5F        lea     r9, ptr [rbp-40H]               ; 4D5F _ 4C: 8D. 4D, C0
00004D63        call    _UpdateGetProfileString         ; 4D63 _ E8, FFFFFB44
00004D68        mov     rcx, qword ptr [rbp-40H]        ; 4D68 _ 48: 8B. 4D, C0
00004D6C        test    rcx, rcx                        ; 4D6C _ 48: 85. C9
00004D6F        jnz     ?_467                           ; 4D6F _ 75, 22
?_466:
00004D71        mov     rdx, qword ptr [rbp-250H]       ; 4D71 _ 48: 8B. 95, FFFFFDB0
00004D78        mov     rcx, qword ptr [rbp-248H]       ; 4D78 _ 48: 8B. 8D, FFFFFDB8
00004D7F        call    _FreeAllList                    ; 4D7F _ E8, FFFFFAA4
00004D84        mov     r14, 0EH                        ; 4D84 _ 49: BE, 800000000000000E
00004D8E        jmp     ?_476                           ; 4D8E _ E9, 000002A9

?_467:
00004D93        call    _UpdateAtoi                     ; 4D93 _ E8, FFFFFB83
00004D98        test    rax, rax                        ; 4D98 _ 48: 85. C0
00004D9B        jz      ?_466                           ; 4D9B _ 74, D4
00004D9D        mov     rcx, qword ptr [rbp-268H]       ; 4D9D _ 48: 8B. 8D, FFFFFD98
00004DA4        mov     qword ptr [rcx], rax            ; 4DA4 _ 48: 89. 01
00004DA7        imul    rcx, rax, 56                    ; 4DA7 _ 48: 6B. C8, 38
00004DAB        call    _AllocatePool                   ; 4DAB _ E8, FFFFC8AF
00004DB0        mov     qword ptr [rsi], rax            ; 4DB0 _ 48: 89. 06
00004DB3        test    rax, rax                        ; 4DB3 _ 48: 85. C0
00004DB6        je      ?_477                           ; 4DB6 _ 0F 84, 00000297
00004DBC        xor     esi, esi                        ; 4DBC _ 31. F6
00004DBE        lea     rbx, ptr [rbp-240H]             ; 4DBE _ 48: 8D. 9D, FFFFFDC0
00004DC5        lea     r14, ptr [rbp-40H]              ; 4DC5 _ 4C: 8D. 75, C0
00004DC9        lea     r13, ptr [rbp-260H]             ; 4DC9 _ 4C: 8D. AD, FFFFFDA0
00004DD0        jmp     ?_471                           ; 4DD0 _ EB, 72

?_468:
00004DD2        mov     rcx, qword ptr [rbp-40H]        ; 4DD2 _ 48: 8B. 4D, C0
00004DD6        lea     rdx, ptr [?_664]                ; 4DD6 _ 48: 8D. 15, 00002AA9(rel)
00004DDD        call    _AsciiStriCmp                   ; 4DDD _ E8, FFFFBCAC
00004DE2        test    rax, rax                        ; 4DE2 _ 48: 85. C0
00004DE5        mov     r14, rsi                        ; 4DE5 _ 49: 89. F6
00004DE8        jnz     ?_469                           ; 4DE8 _ 75, 08
00004DEA        mov     rax, qword ptr [rbx]            ; 4DEA _ 48: 8B. 03
00004DED        mov     byte ptr [rax+rdi+30H], 0       ; 4DED _ C6. 44 38, 30, 00
?_469:
00004DF2        mov     rax, qword ptr [rbx]            ; 4DF2 _ 48: 8B. 03
00004DF5        cmp     dword ptr [rax+rdi+8H], 2       ; 4DF5 _ 83. 7C 38, 08, 02
00004DFA        jnz     ?_470                           ; 4DFA _ 75, 3B
00004DFC        mov     qword ptr [rbp-40H], 0          ; 4DFC _ 48: C7. 45, C0, 00000000
00004E04        mov     rcx, qword ptr [rbp-248H]       ; 4E04 _ 48: 8B. 8D, FFFFFDB8
00004E0B        mov     rdx, r15                        ; 4E0B _ 4C: 89. FA
00004E0E        lea     r8, ptr [?_665]                 ; 4E0E _ 4C: 8D. 05, 00002A77(rel)
00004E15        mov     r9, r14                         ; 4E15 _ 4D: 89. F1
00004E18        call    _UpdateGetProfileString         ; 4E18 _ E8, FFFFFA8F
00004E1D        mov     rcx, qword ptr [rbp-40H]        ; 4E1D _ 48: 8B. 4D, C0
00004E21        test    rcx, rcx                        ; 4E21 _ 48: 85. C9
00004E24        je      ?_466                           ; 4E24 _ 0F 84, FFFFFF47
00004E2A        call    _AsciiStrHexToUintn             ; 4E2A _ E8, FFFFBE1F
00004E2F        mov     rcx, qword ptr [rbx]            ; 4E2F _ 48: 8B. 0B
00004E32        mov     qword ptr [rcx+rdi+28H], rax    ; 4E32 _ 48: 89. 44 39, 28
?_470:
00004E37        mov     rsi, r12                        ; 4E37 _ 4C: 89. E6
00004E3A        inc     rsi                             ; 4E3A _ 48: FF. C6
00004E3D        lea     rbx, ptr [rbp-240H]             ; 4E3D _ 48: 8D. 9D, FFFFFDC0
?_471:
00004E44        mov     rax, qword ptr [rbp-268H]       ; 4E44 _ 48: 8B. 85, FFFFFD98
00004E4B        cmp     rsi, qword ptr [rax]            ; 4E4B _ 48: 3B. 30
00004E4E        jnc     ?_475                           ; 4E4E _ 0F 83, 000001D2
00004E54        mov     rcx, rbx                        ; 4E54 _ 48: 89. D9
00004E57        mov     edx, 512                        ; 4E57 _ BA, 00000200
00004E5C        lea     r8, ptr [?_658]                 ; 4E5C _ 4C: 8D. 05, 000029E7(rel)
00004E63        call    _AsciiStrCpyS                   ; 4E63 _ E8, FFFFB834
00004E68        cmp     byte ptr [rbp-240H], 0          ; 4E68 _ 80. BD, FFFFFDC0, 00
00004E6F        mov     rdi, rbx                        ; 4E6F _ 48: 89. DF
00004E72        jz      ?_473                           ; 4E72 _ 74, 0A
?_472:
00004E74        cmp     byte ptr [rdi+1H], 0            ; 4E74 _ 80. 7F, 01, 00
00004E78        lea     rdi, ptr [rdi+1H]               ; 4E78 _ 48: 8D. 7F, 01
00004E7C        jnz     ?_472                           ; 4E7C _ 75, F6
?_473:
00004E7E        mov     rcx, rdi                        ; 4E7E _ 48: 89. F9
00004E81        mov     rdx, rsi                        ; 4E81 _ 48: 89. F2
00004E84        mov     r12, rsi                        ; 4E84 _ 49: 89. F4
00004E87        call    _UpdateValueToString            ; 4E87 _ E8, FFFFFB02
00004E8C        mov     byte ptr [rdi+rax], 0           ; 4E8C _ C6. 04 07, 00
00004E90        mov     qword ptr [rbp-40H], 0          ; 4E90 _ 48: C7. 45, C0, 00000000
00004E98        mov     rcx, qword ptr [rbp-248H]       ; 4E98 _ 48: 8B. 8D, FFFFFDB8
00004E9F        lea     rdx, ptr [?_656]                ; 4E9F _ 48: 8D. 15, 00002993(rel)
00004EA6        mov     r8, rbx                         ; 4EA6 _ 49: 89. D8
00004EA9        mov     r9, r14                         ; 4EA9 _ 4D: 89. F1
00004EAC        call    _UpdateGetProfileString         ; 4EAC _ E8, FFFFF9FB
00004EB1        mov     r15, qword ptr [rbp-40H]        ; 4EB1 _ 4C: 8B. 7D, C0
00004EB5        test    r15, r15                        ; 4EB5 _ 4D: 85. FF
00004EB8        je      ?_466                           ; 4EB8 _ 0F 84, FFFFFEB3
00004EBE        mov     qword ptr [rbp-40H], 0          ; 4EBE _ 48: C7. 45, C0, 00000000
00004EC6        mov     rcx, qword ptr [rbp-248H]       ; 4EC6 _ 48: 8B. 8D, FFFFFDB8
00004ECD        mov     rdx, r15                        ; 4ECD _ 4C: 89. FA
00004ED0        lea     r8, ptr [?_659]                 ; 4ED0 _ 4C: 8D. 05, 0000297A(rel)
00004ED7        mov     r9, r14                         ; 4ED7 _ 4D: 89. F1
00004EDA        mov     rsi, r14                        ; 4EDA _ 4C: 89. F6
00004EDD        call    _UpdateGetProfileString         ; 4EDD _ E8, FFFFF9CA
00004EE2        mov     r14, rax                        ; 4EE2 _ 49: 89. C6
00004EE5        mov     rcx, qword ptr [rbp-40H]        ; 4EE5 _ 48: 8B. 4D, C0
00004EE9        test    rcx, rcx                        ; 4EE9 _ 48: 85. C9
00004EEC        je      ?_466                           ; 4EEC _ 0F 84, FFFFFE7F
00004EF2        call    _UpdateAtoi                     ; 4EF2 _ E8, FFFFFA24
00004EF7        cmp     rax, 3                          ; 4EF7 _ 48: 83. F8, 03
00004EFB        jnc     ?_464                           ; 4EFB _ 0F 83, FFFFFE29
00004F01        mov     rbx, qword ptr [rbp-270H]       ; 4F01 _ 48: 8B. 9D, FFFFFD90
00004F08        mov     rcx, qword ptr [rbx]            ; 4F08 _ 48: 8B. 0B
00004F0B        imul    rdi, r12, 56                    ; 4F0B _ 49: 6B. FC, 38
00004F0F        mov     qword ptr [rcx+rdi], r12        ; 4F0F _ 4C: 89. 24 39
00004F13        mov     dword ptr [rcx+rdi+8H], eax     ; 4F13 _ 89. 44 39, 08
00004F17        mov     qword ptr [rbp-40H], 0          ; 4F17 _ 48: C7. 45, C0, 00000000
00004F1F        mov     rcx, qword ptr [rbp-248H]       ; 4F1F _ 48: 8B. 8D, FFFFFDB8
00004F26        mov     rdx, r15                        ; 4F26 _ 4C: 89. FA
00004F29        lea     r8, ptr [?_660]                 ; 4F29 _ 4C: 8D. 05, 0000292C(rel)
00004F30        mov     r9, rsi                         ; 4F30 _ 49: 89. F1
00004F33        call    _UpdateGetProfileString         ; 4F33 _ E8, FFFFF974
00004F38        mov     rcx, qword ptr [rbp-40H]        ; 4F38 _ 48: 8B. 4D, C0
00004F3C        test    rcx, rcx                        ; 4F3C _ 48: 85. C9
00004F3F        je      ?_466                           ; 4F3F _ 0F 84, FFFFFE2C
00004F45        call    _AsciiStrHexToUintn             ; 4F45 _ E8, FFFFBD04
00004F4A        mov     rcx, qword ptr [rbx]            ; 4F4A _ 48: 8B. 0B
00004F4D        mov     qword ptr [rcx+rdi+10H], rax    ; 4F4D _ 48: 89. 44 39, 10
00004F52        mov     qword ptr [rbp-40H], 0          ; 4F52 _ 48: C7. 45, C0, 00000000
00004F5A        mov     rcx, qword ptr [rbp-248H]       ; 4F5A _ 48: 8B. 8D, FFFFFDB8
00004F61        mov     rdx, r15                        ; 4F61 _ 4C: 89. FA
00004F64        lea     r8, ptr [?_661]                 ; 4F64 _ 4C: 8D. 05, 000028FF(rel)
00004F6B        mov     r9, rsi                         ; 4F6B _ 49: 89. F1
00004F6E        call    _UpdateGetProfileString         ; 4F6E _ E8, FFFFF939
00004F73        mov     rcx, qword ptr [rbp-40H]        ; 4F73 _ 48: 8B. 4D, C0
00004F77        test    rcx, rcx                        ; 4F77 _ 48: 85. C9
00004F7A        je      ?_466                           ; 4F7A _ 0F 84, FFFFFDF1
00004F80        mov     rdx, r13                        ; 4F80 _ 4C: 89. EA
00004F83        call    _UpdateStringToGuid             ; 4F83 _ E8, FFFFFA93
00004F88        mov     r14, rax                        ; 4F88 _ 49: 89. C6
00004F8B        test    r14, r14                        ; 4F8B _ 4D: 85. F6
00004F8E        js      ?_464                           ; 4F8E _ 0F 88, FFFFFD96
00004F94        mov     rax, qword ptr [rbx]            ; 4F94 _ 48: 8B. 03
00004F97        lea     rcx, ptr [rax+rdi+18H]          ; 4F97 _ 48: 8D. 4C 38, 18
00004F9C        mov     rdx, r13                        ; 4F9C _ 4C: 89. EA
00004F9F        mov     r8d, 16                         ; 4F9F _ 41: B8, 00000010
00004FA5        call    _CopyMem                        ; 4FA5 _ E8, FFFFB49A
00004FAA        mov     qword ptr [rbp-40H], 0          ; 4FAA _ 48: C7. 45, C0, 00000000
00004FB2        mov     rax, qword ptr [rbx]            ; 4FB2 _ 48: 8B. 03
00004FB5        mov     byte ptr [rax+rdi+30H], 0       ; 4FB5 _ C6. 44 38, 30, 00
00004FBA        mov     rcx, qword ptr [rbp-248H]       ; 4FBA _ 48: 8B. 8D, FFFFFDB8
00004FC1        mov     rdx, r15                        ; 4FC1 _ 4C: 89. FA
00004FC4        lea     r8, ptr [?_662]                 ; 4FC4 _ 4C: 8D. 05, 000028A8(rel)
00004FCB        mov     r9, rsi                         ; 4FCB _ 49: 89. F1
00004FCE        call    _UpdateGetProfileString         ; 4FCE _ E8, FFFFF8D9
00004FD3        mov     r14, rax                        ; 4FD3 _ 49: 89. C6
00004FD6        test    r14, r14                        ; 4FD6 _ 4D: 85. F6
00004FD9        jns     ?_474                           ; 4FD9 _ 79, 13
00004FDB        mov     rax, 0EH                        ; 4FDB _ 48: B8, 800000000000000E
00004FE5        cmp     r14, rax                        ; 4FE5 _ 49: 39. C6
00004FE8        jne     ?_464                           ; 4FE8 _ 0F 85, FFFFFD3C
?_474:
00004FEE        mov     rcx, qword ptr [rbp-40H]        ; 4FEE _ 48: 8B. 4D, C0
00004FF2        test    rcx, rcx                        ; 4FF2 _ 48: 85. C9
00004FF5        mov     r14, rsi                        ; 4FF5 _ 49: 89. F6
00004FF8        je      ?_469                           ; 4FF8 _ 0F 84, FFFFFDF4
00004FFE        mov     rsi, r14                        ; 4FFE _ 4C: 89. F6
00005001        lea     rdx, ptr [?_663]                ; 5001 _ 48: 8D. 15, 00002879(rel)
00005008        call    _AsciiStriCmp                   ; 5008 _ E8, FFFFBA81
0000500D        test    rax, rax                        ; 500D _ 48: 85. C0
00005010        jne     ?_468                           ; 5010 _ 0F 85, FFFFFDBC
00005016        mov     rax, qword ptr [rbx]            ; 5016 _ 48: 8B. 03
00005019        mov     byte ptr [rax+rdi+30H], 1       ; 5019 _ C6. 44 38, 30, 01
0000501E        mov     r14, rsi                        ; 501E _ 49: 89. F6
00005021        jmp     ?_469                           ; 5021 _ E9, FFFFFDCC

?_475:
00005026        mov     rdx, qword ptr [rbp-250H]       ; 5026 _ 48: 8B. 95, FFFFFDB0
0000502D        mov     rcx, qword ptr [rbp-248H]       ; 502D _ 48: 8B. 8D, FFFFFDB8
00005034        call    _FreeAllList                    ; 5034 _ E8, FFFFF7EF
00005039        xor     r14d, r14d                      ; 5039 _ 45: 31. F6
?_476:
0000503C        mov     rax, r14                        ; 503C _ 4C: 89. F0
0000503F        add     rsp, 600                        ; 503F _ 48: 81. C4, 00000258
00005046        pop     rbx                             ; 5046 _ 5B
00005047        pop     rdi                             ; 5047 _ 5F
00005048        pop     rsi                             ; 5048 _ 5E
00005049        pop     r12                             ; 5049 _ 41: 5C
0000504B        pop     r13                             ; 504B _ 41: 5D
0000504D        pop     r14                             ; 504D _ 41: 5E
0000504F        pop     r15                             ; 504F _ 41: 5F
00005051        pop     rbp                             ; 5051 _ 5D
00005052        ret                                     ; 5052 _ C3
_ParseUpdateDataFile ENDP

?_477   LABEL NEAR
00005053        mov     rdx, qword ptr [rbp-250H]       ; 5053 _ 48: 8B. 95, FFFFFDB0
0000505A        mov     rcx, qword ptr [rbp-248H]       ; 505A _ 48: 8B. 8D, FFFFFDB8
00005061        call    _FreeAllList                    ; 5061 _ E8, FFFFF7C2
00005066        mov     r14, 9H                         ; 5066 _ 49: BE, 8000000000000009
00005070        jmp     ?_476                           ; 5070 _ EB, CA

_UpdateOneBlock PROC
00005072        push    rbp                             ; 5072 _ 55
00005073        mov     rbp, rsp                        ; 5073 _ 48: 89. E5
00005076        push    r14                             ; 5076 _ 41: 56
00005078        push    rsi                             ; 5078 _ 56
00005079        push    rdi                             ; 5079 _ 57
0000507A        push    rbx                             ; 507A _ 53
0000507B        sub     rsp, 48                         ; 507B _ 48: 83. EC, 30
0000507F        mov     r14, r9                         ; 507F _ 4D: 89. CE
00005082        mov     rsi, r8                         ; 5082 _ 4C: 89. C6
00005085        mov     rbx, rdx                        ; 5085 _ 48: 89. D3
00005088        mov     rdi, rcx                        ; 5088 _ 48: 89. CF
0000508B        mov     r8d, 1                          ; 508B _ 41: B8, 00000001
00005091        mov     r9, -1                          ; 5091 _ 49: C7. C1, FFFFFFFF
00005098        call    qword ptr [rdi+30H]             ; 5098 _ FF. 57, 30
0000509B        test    rax, rax                        ; 509B _ 48: 85. C0
0000509E        js      ?_478                           ; 509E _ 78, 2F
000050A0        mov     qword ptr [rbp-28H], rsi        ; 50A0 _ 48: 89. 75, D8
000050A4        mov     qword ptr [rsp+20H], r14        ; 50A4 _ 4C: 89. 74 24, 20
000050A9        xor     r14d, r14d                      ; 50A9 _ 45: 31. F6
000050AC        lea     r9, ptr [rbp-28H]               ; 50AC _ 4C: 8D. 4D, D8
000050B0        mov     rcx, rdi                        ; 50B0 _ 48: 89. F9
000050B3        mov     rdx, rbx                        ; 50B3 _ 48: 89. DA
000050B6        xor     r8d, r8d                        ; 50B6 _ 45: 31. C0
000050B9        call    qword ptr [rdi+28H]             ; 50B9 _ FF. 57, 28
000050BC        test    rax, rax                        ; 50BC _ 48: 85. C0
000050BF        setns   cl                              ; 50BF _ 0F 99. C1
000050C2        cmp     qword ptr [rbp-28H], rsi        ; 50C2 _ 48: 39. 75, D8
000050C6        sete    dl                              ; 50C6 _ 0F 94. C2
000050C9        test    dl, cl                          ; 50C9 _ 84. CA
000050CB        cmovne  rax, r14                        ; 50CB _ 49: 0F 45. C6
?_478:
000050CF        add     rsp, 48                         ; 50CF _ 48: 83. C4, 30
000050D3        pop     rbx                             ; 50D3 _ 5B
000050D4        pop     rdi                             ; 50D4 _ 5F
000050D5        pop     rsi                             ; 50D5 _ 5E
000050D6        pop     r14                             ; 50D6 _ 41: 5E
000050D8        pop     rbp                             ; 50D8 _ 5D
000050D9        ret                                     ; 50D9 _ C3
_UpdateOneBlock ENDP

_UpdateBufferInOneBlock PROC
000050DA        push    rbp                             ; 50DA _ 55
000050DB        mov     rbp, rsp                        ; 50DB _ 48: 89. E5
000050DE        push    r15                             ; 50DE _ 41: 57
000050E0        push    r14                             ; 50E0 _ 41: 56
000050E2        push    r13                             ; 50E2 _ 41: 55
000050E4        push    r12                             ; 50E4 _ 41: 54
000050E6        push    rsi                             ; 50E6 _ 56
000050E7        push    rdi                             ; 50E7 _ 57
000050E8        push    rbx                             ; 50E8 _ 53
000050E9        sub     rsp, 56                         ; 50E9 _ 48: 83. EC, 38
000050ED        mov     r13, r9                         ; 50ED _ 4D: 89. CD
000050F0        mov     rdi, r8                         ; 50F0 _ 4C: 89. C7
000050F3        mov     r12, rdx                        ; 50F3 _ 49: 89. D4
000050F6        mov     rbx, rcx                        ; 50F6 _ 48: 89. CB
000050F9        mov     r9, qword ptr [rbp+38H]         ; 50F9 _ 4C: 8B. 4D, 38
000050FD        mov     r14, qword ptr [rbp+30H]        ; 50FD _ 4C: 8B. 75, 30
00005101        test    rdi, rdi                        ; 5101 _ 48: 85. FF
00005104        jnz     ?_479                           ; 5104 _ 75, 18
00005106        cmp     r13, r14                        ; 5106 _ 4D: 39. F5
00005109        jnz     ?_479                           ; 5109 _ 75, 13
0000510B        mov     rcx, rbx                        ; 510B _ 48: 89. D9
0000510E        mov     rdx, r12                        ; 510E _ 4C: 89. E2
00005111        mov     r8, r13                         ; 5111 _ 4D: 89. E8
00005114        call    _UpdateOneBlock                 ; 5114 _ E8, FFFFFF59
00005119        mov     r15, rax                        ; 5119 _ 49: 89. C7
0000511C        jmp     ?_481                           ; 511C _ EB, 72

?_479:
0000511E        mov     rcx, r14                        ; 511E _ 4C: 89. F1
00005121        call    _AllocatePool                   ; 5121 _ E8, FFFFC539
00005126        mov     rsi, rax                        ; 5126 _ 48: 89. C6
00005129        mov     r15, 9H                         ; 5129 _ 49: BF, 8000000000000009
00005133        test    rsi, rsi                        ; 5133 _ 48: 85. F6
00005136        jz      ?_481                           ; 5136 _ 74, 58
00005138        mov     qword ptr [rbp-40H], r14        ; 5138 _ 4C: 89. 75, C0
0000513C        mov     qword ptr [rsp+20H], rsi        ; 513C _ 48: 89. 74 24, 20
00005141        lea     r9, ptr [rbp-40H]               ; 5141 _ 4C: 8D. 4D, C0
00005145        mov     rcx, rbx                        ; 5145 _ 48: 89. D9
00005148        mov     rdx, r12                        ; 5148 _ 4C: 89. E2
0000514B        xor     r8d, r8d                        ; 514B _ 45: 31. C0
0000514E        call    qword ptr [rbx+20H]             ; 514E _ FF. 53, 20
00005151        mov     r15, rax                        ; 5151 _ 49: 89. C7
00005154        test    r15, r15                        ; 5154 _ 4D: 85. FF
00005157        js      ?_480                           ; 5157 _ 78, 2F
00005159        mov     rax, qword ptr [rbp-40H]        ; 5159 _ 48: 8B. 45, C0
0000515D        cmp     rax, r14                        ; 515D _ 4C: 39. F0
00005160        jnz     ?_480                           ; 5160 _ 75, 26
00005162        add     rdi, rsi                        ; 5162 _ 48: 01. F7
00005165        mov     rcx, rdi                        ; 5165 _ 48: 89. F9
00005168        mov     rdx, qword ptr [rbp+38H]        ; 5168 _ 48: 8B. 55, 38
0000516C        mov     r8, r13                         ; 516C _ 4D: 89. E8
0000516F        call    _CopyMem                        ; 516F _ E8, FFFFB2D0
00005174        mov     rcx, rbx                        ; 5174 _ 48: 89. D9
00005177        mov     rdx, r12                        ; 5177 _ 4C: 89. E2
0000517A        mov     r8, r14                         ; 517A _ 4D: 89. F0
0000517D        mov     r9, rsi                         ; 517D _ 49: 89. F1
00005180        call    _UpdateOneBlock                 ; 5180 _ E8, FFFFFEED
00005185        mov     r15, rax                        ; 5185 _ 49: 89. C7
?_480:
00005188        mov     rcx, rsi                        ; 5188 _ 48: 89. F1
0000518B        call    _FreePool                       ; 518B _ E8, FFFFC5C7
?_481:
00005190        mov     rax, r15                        ; 5190 _ 4C: 89. F8
00005193        add     rsp, 56                         ; 5193 _ 48: 83. C4, 38
00005197        pop     rbx                             ; 5197 _ 5B
00005198        pop     rdi                             ; 5198 _ 5F
00005199        pop     rsi                             ; 5199 _ 5E
0000519A        pop     r12                             ; 519A _ 41: 5C
0000519C        pop     r13                             ; 519C _ 41: 5D
0000519E        pop     r14                             ; 519E _ 41: 5E
000051A0        pop     r15                             ; 51A0 _ 41: 5F
000051A2        pop     rbp                             ; 51A2 _ 5D
000051A3        ret                                     ; 51A3 _ C3
_UpdateBufferInOneBlock ENDP

_RetrieveLastWrite PROC
000051A4        push    rbp                             ; 51A4 _ 55
000051A5        mov     rbp, rsp                        ; 51A5 _ 48: 89. E5
000051A8        push    r15                             ; 51A8 _ 41: 57
000051AA        push    r14                             ; 51AA _ 41: 56
000051AC        push    r13                             ; 51AC _ 41: 55
000051AE        push    r12                             ; 51AE _ 41: 54
000051B0        push    rsi                             ; 51B0 _ 56
000051B1        push    rdi                             ; 51B1 _ 57
000051B2        push    rbx                             ; 51B2 _ 53
000051B3        sub     rsp, 104                        ; 51B3 _ 48: 83. EC, 68
000051B7        mov     r12, r9                         ; 51B7 _ 4D: 89. CC
000051BA        mov     rbx, r8                         ; 51BA _ 4C: 89. C3
000051BD        mov     rsi, rdx                        ; 51BD _ 48: 89. D6
000051C0        mov     qword ptr [rbp-60H], rcx        ; 51C0 _ 48: 89. 4D, A0
000051C4        mov     rax, qword ptr [rbp+50H]        ; 51C4 _ 48: 8B. 45, 50
000051C8        mov     byte ptr [rax], 0               ; 51C8 _ C6. 00, 00
000051CB        mov     qword ptr [rbp-50H], r12        ; 51CB _ 4C: 89. 65, B0
000051CF        lea     rdx, ptr [rbp-50H]              ; 51CF _ 48: 8D. 55, B0
000051D3        mov     rcx, qword ptr [rbp+30H]        ; 51D3 _ 48: 8B. 4D, 30
000051D7        lea     rax, ptr [rbp-51H]              ; 51D7 _ 48: 8D. 45, AF
000051DB        mov     qword ptr [rsp+38H], rax        ; 51DB _ 48: 89. 44 24, 38
000051E0        mov     qword ptr [rsp+30H], rcx        ; 51E0 _ 48: 89. 4C 24, 30
000051E5        mov     qword ptr [rsp+28H], rdx        ; 51E5 _ 48: 89. 54 24, 28
000051EA        mov     rax, qword ptr [rbp+48H]        ; 51EA _ 48: 8B. 45, 48
000051EE        mov     qword ptr [rsp+20H], rax        ; 51EE _ 48: 89. 44 24, 20
000051F3        lea     rdx, ptr [rbp-48H]              ; 51F3 _ 48: 8D. 55, B8
000051F7        mov     rdi, qword ptr [rbp+38H]        ; 51F7 _ 48: 8B. 7D, 38
000051FB        mov     rax, qword ptr [rbp+40H]        ; 51FB _ 48: 8B. 45, 40
000051FF        mov     rcx, rsi                        ; 51FF _ 48: 89. F1
00005202        mov     r8, rdi                         ; 5202 _ 49: 89. F8
00005205        mov     r14, rdi                        ; 5205 _ 49: 89. FE
00005208        mov     r9, rax                         ; 5208 _ 49: 89. C1
0000520B        mov     r13, rax                        ; 520B _ 49: 89. C5
0000520E        call    qword ptr [rsi+28H]             ; 520E _ FF. 56, 28
00005211        mov     rdi, rax                        ; 5211 _ 48: 89. C7
00005214        test    rdi, rdi                        ; 5214 _ 48: 85. FF
00005217        jns     ?_484                           ; 5217 _ 0F 89, 000000BE
0000521D        mov     rax, 0EH                        ; 521D _ 48: B8, 800000000000000E
00005227        cmp     rdi, rax                        ; 5227 _ 48: 39. C7
0000522A        jnz     ?_482                           ; 522A _ 75, 0D
0000522C        mov     cl, byte ptr [rbp-51H]          ; 522C _ 8A. 4D, AF
0000522F        xor     eax, eax                        ; 522F _ 31. C0
00005231        test    cl, cl                          ; 5231 _ 84. C9
00005233        jne     ?_485                           ; 5233 _ 0F 85, 00000120
?_482:
00005239        mov     rax, 15H                        ; 5239 _ 48: B8, 8000000000000015
00005243        mov     rcx, 5H                         ; 5243 _ 48: B9, 8000000000000005
0000524D        cmp     rdi, rcx                        ; 524D _ 48: 39. CF
00005250        jne     ?_485                           ; 5250 _ 0F 85, 00000103
00005256        mov     rcx, qword ptr [rbp-50H]        ; 5256 _ 48: 8B. 4D, B0
0000525A        call    _AllocatePool                   ; 525A _ E8, FFFFC400
0000525F        mov     r15, rax                        ; 525F _ 49: 89. C7
00005262        mov     rax, 9H                         ; 5262 _ 48: B8, 8000000000000009
0000526C        test    r15, r15                        ; 526C _ 4D: 85. FF
0000526F        je      ?_485                           ; 526F _ 0F 84, 000000E4
00005275        lea     rax, ptr [rbp-51H]              ; 5275 _ 48: 8D. 45, AF
00005279        mov     qword ptr [rsp+38H], rax        ; 5279 _ 48: 89. 44 24, 38
0000527E        mov     qword ptr [rsp+30H], r15        ; 527E _ 4C: 89. 7C 24, 30
00005283        lea     rax, ptr [rbp-50H]              ; 5283 _ 48: 8D. 45, B0
00005287        mov     qword ptr [rsp+28H], rax        ; 5287 _ 48: 89. 44 24, 28
0000528C        mov     rax, qword ptr [rbp+48H]        ; 528C _ 48: 8B. 45, 48
00005290        mov     qword ptr [rsp+20H], rax        ; 5290 _ 48: 89. 44 24, 20
00005295        lea     rdx, ptr [rbp-48H]              ; 5295 _ 48: 8D. 55, B8
00005299        mov     rcx, rsi                        ; 5299 _ 48: 89. F1
0000529C        mov     r8, r14                         ; 529C _ 4D: 89. F0
0000529F        mov     r9, r13                         ; 529F _ 4D: 89. E9
000052A2        call    qword ptr [rsi+28H]             ; 52A2 _ FF. 56, 28
000052A5        mov     rdi, rax                        ; 52A5 _ 48: 89. C7
000052A8        test    rdi, rdi                        ; 52A8 _ 48: 85. FF
000052AB        jns     ?_483                           ; 52AB _ 79, 17
000052AD        mov     rcx, r15                        ; 52AD _ 4C: 89. F9
000052B0        call    _FreePool                       ; 52B0 _ E8, FFFFC4A2
000052B5        mov     rax, 15H                        ; 52B5 _ 48: B8, 8000000000000015
000052BF        jmp     ?_485                           ; 52BF _ E9, 00000095

?_483:
000052C4        mov     rcx, qword ptr [rbp+30H]        ; 52C4 _ 48: 8B. 4D, 30
000052C8        mov     rdx, r15                        ; 52C8 _ 4C: 89. FA
000052CB        mov     r8, r12                         ; 52CB _ 4D: 89. E0
000052CE        call    _CopyMem                        ; 52CE _ E8, FFFFB171
000052D3        mov     rcx, r15                        ; 52D3 _ 4C: 89. F9
000052D6        call    _FreePool                       ; 52D6 _ E8, FFFFC47C
?_484:
000052DB        mov     rax, qword ptr [rbp+50H]        ; 52DB _ 48: 8B. 45, 50
000052DF        mov     byte ptr [rax], 1               ; 52DF _ C6. 00, 01
000052E2        lea     rcx, ptr [rbp-48H]              ; 52E2 _ 48: 8D. 4D, B8
000052E6        lea     rdx, ptr [_gEfiCallerIdGuid]    ; 52E6 _ 48: 8D. 15, 00003B63(rel)
000052ED        mov     r8d, 16                         ; 52ED _ 41: B8, 00000010
000052F3        call    _CompareMem                     ; 52F3 _ E8, FFFFAFED
000052F8        mov     rcx, rax                        ; 52F8 _ 48: 89. C1
000052FB        mov     rax, 0EH                        ; 52FB _ 48: B8, 800000000000000E
00005305        test    rcx, rcx                        ; 5305 _ 48: 85. C9
00005308        jnz     ?_485                           ; 5308 _ 75, 4F
0000530A        add     rbx, 24                         ; 530A _ 48: 83. C3, 18
0000530E        mov     rcx, qword ptr [rbp+30H]        ; 530E _ 48: 8B. 4D, 30
00005312        mov     rdx, rbx                        ; 5312 _ 48: 89. DA
00005315        mov     r8d, 16                         ; 5315 _ 41: B8, 00000010
0000531B        call    _CompareMem                     ; 531B _ E8, FFFFAFC5
00005320        mov     rcx, rax                        ; 5320 _ 48: 89. C1
00005323        mov     rax, 0EH                        ; 5323 _ 48: B8, 800000000000000E
0000532D        test    rcx, rcx                        ; 532D _ 48: 85. C9
00005330        jnz     ?_485                           ; 5330 _ 75, 27
00005332        cmp     byte ptr [rbp-51H], 0           ; 5332 _ 80. 7D, AF, 00
00005336        mov     rax, rdi                        ; 5336 _ 48: 89. F8
00005339        jnz     ?_485                           ; 5339 _ 75, 1E
0000533B        mov     rcx, rsi                        ; 533B _ 48: 89. F1
0000533E        mov     rdx, qword ptr [rbp-60H]        ; 533E _ 48: 8B. 55, A0
00005342        call    qword ptr [rsi+18H]             ; 5342 _ FF. 56, 18
00005345        test    rax, rax                        ; 5345 _ 48: 85. C0
00005348        jns     ?_485                           ; 5348 _ 79, 0F
0000534A        mov     rcx, rsi                        ; 534A _ 48: 89. F1
0000534D        call    qword ptr [rsi+20H]             ; 534D _ FF. 56, 20
00005350        mov     rax, qword ptr [rbp+50H]        ; 5350 _ 48: 8B. 45, 50
00005354        mov     byte ptr [rax], 0               ; 5354 _ C6. 00, 00
00005357        xor     eax, eax                        ; 5357 _ 31. C0
?_485:
00005359        add     rsp, 104                        ; 5359 _ 48: 83. C4, 68
0000535D        pop     rbx                             ; 535D _ 5B
0000535E        pop     rdi                             ; 535E _ 5F
0000535F        pop     rsi                             ; 535F _ 5E
00005360        pop     r12                             ; 5360 _ 41: 5C
00005362        pop     r13                             ; 5362 _ 41: 5D
00005364        pop     r14                             ; 5364 _ 41: 5E
00005366        pop     r15                             ; 5366 _ 41: 5F
00005368        pop     rbp                             ; 5368 _ 5D
00005369        ret                                     ; 5369 _ C3
_RetrieveLastWrite ENDP

_FaultTolerantUpdateOnWholeFv PROC
0000536A        push    rbp                             ; 536A _ 55
0000536B        mov     rbp, rsp                        ; 536B _ 48: 89. E5
0000536E        push    r15                             ; 536E _ 41: 57
00005370        push    r14                             ; 5370 _ 41: 56
00005372        push    r13                             ; 5372 _ 41: 55
00005374        push    r12                             ; 5374 _ 41: 54
00005376        push    rsi                             ; 5376 _ 56
00005377        push    rdi                             ; 5377 _ 57
00005378        push    rbx                             ; 5378 _ 53
00005379        sub     rsp, 152                        ; 5379 _ 48: 81. EC, 00000098
00005380        mov     r15, r9                         ; 5380 _ 4D: 89. CF
00005383        mov     rsi, r8                         ; 5383 _ 4C: 89. C6
00005386        mov     qword ptr [rbp-80H], rcx        ; 5386 _ 48: 89. 4D, 80
0000538A        mov     rax, 2H                         ; 538A _ 48: B8, 8000000000000002
00005394        cmp     dword ptr [r15+8H], 0           ; 5394 _ 41: 83. 7F, 08, 00
00005399        jne     ?_498                           ; 5399 _ 0F 85, 0000021C
0000539F        mov     rax, 2H                         ; 539F _ 48: B8, 8000000000000002
000053A9        cmp     byte ptr [r15+30H], 0           ; 53A9 _ 41: 80. 7F, 30, 00
000053AE        je      ?_498                           ; 53AE _ 0F 84, 00000207
000053B4        mov     rax, qword ptr [_gBS]           ; 53B4 _ 48: 8B. 05, 00003D8D(rel)
000053BB        lea     rcx, ptr [_gEfiFaultTolerantWriteProtocolGuid]; 53BB _ 48: 8D. 0D, 00003AE6(rel)
000053C2        xor     ebx, ebx                        ; 53C2 _ 31. DB
000053C4        lea     r8, ptr [rbp-40H]               ; 53C4 _ 4C: 8D. 45, C0
000053C8        xor     edx, edx                        ; 53C8 _ 31. D2
000053CA        call    qword ptr [rax+140H]            ; 53CA _ FF. 90, 00000140
000053D0        mov     rcx, rax                        ; 53D0 _ 48: 89. C1
000053D3        mov     rax, 0EH                        ; 53D3 _ 48: B8, 800000000000000E
000053DD        test    rcx, rcx                        ; 53DD _ 48: 85. C9
000053E0        js      ?_498                           ; 53E0 _ 0F 88, 000001D5
000053E6        mov     r14, qword ptr [rbp+30H]        ; 53E6 _ 4C: 8B. 75, 30
000053EA        mov     rax, rsi                        ; 53EA _ 48: 89. F0
000053ED        xor     edi, edi                        ; 53ED _ 31. FF
000053EF        jmp     ?_487                           ; 53EF _ EB, 0E

?_486:
000053F1        cmp     rbx, rdx                        ; 53F1 _ 48: 39. D3
000053F4        cmovc   rbx, rdx                        ; 53F4 _ 48: 0F 42. DA
000053F8        add     rdi, rcx                        ; 53F8 _ 48: 01. CF
000053FB        add     rax, 8                          ; 53FB _ 48: 83. C0, 08
?_487:
000053FF        mov     ecx, dword ptr [rax]            ; 53FF _ 8B. 08
00005401        test    rcx, rcx                        ; 5401 _ 48: 85. C9
00005404        jz      ?_488                           ; 5404 _ 74, 08
00005406        mov     edx, dword ptr [rax+4H]         ; 5406 _ 8B. 50, 04
00005409        test    rdx, rdx                        ; 5409 _ 48: 85. D2
0000540C        jnz     ?_486                           ; 540C _ 75, E3
?_488:
0000540E        mov     r13, rsi                        ; 540E _ 49: 89. F5
00005411        mov     rax, qword ptr [rbp-40H]        ; 5411 _ 48: 8B. 45, C0
00005415        lea     rdx, ptr [rbp-48H]              ; 5415 _ 48: 8D. 55, B8
00005419        mov     rcx, rax                        ; 5419 _ 48: 89. C1
0000541C        call    qword ptr [rax]                 ; 541C _ FF. 10
0000541E        mov     rax, 9H                         ; 541E _ 48: B8, 8000000000000009
00005428        cmp     qword ptr [rbp-48H], rbx        ; 5428 _ 48: 39. 5D, B8
0000542C        jc      ?_498                           ; 542C _ 0F 82, 00000189
00005432        mov     qword ptr [rbp-68H], 0          ; 5432 _ 48: C7. 45, 98, 00000000
0000543A        mov     qword ptr [rbp-70H], 0          ; 543A _ 48: C7. 45, 90, 00000000
00005442        mov     qword ptr [rbp-78H], 0          ; 5442 _ 48: C7. 45, 88, 00000000
0000544A        mov     byte ptr [rbp-49H], 0           ; 544A _ C6. 45, B7, 00
0000544E        mov     rdx, qword ptr [rbp-40H]        ; 544E _ 48: 8B. 55, C0
00005452        lea     rsi, ptr [rbp-60H]              ; 5452 _ 48: 8D. 75, A0
00005456        lea     r8, ptr [rbp-68H]               ; 5456 _ 4C: 8D. 45, 98
0000545A        lea     rcx, ptr [rbp-70H]              ; 545A _ 48: 8D. 4D, 90
0000545E        lea     rbx, ptr [rbp-78H]              ; 545E _ 48: 8D. 5D, 88
00005462        lea     rax, ptr [rbp-49H]              ; 5462 _ 48: 8D. 45, B7
00005466        mov     qword ptr [rsp+40H], rax        ; 5466 _ 48: 89. 44 24, 40
0000546B        mov     qword ptr [rsp+38H], rbx        ; 546B _ 48: 89. 5C 24, 38
00005470        mov     qword ptr [rsp+30H], rcx        ; 5470 _ 48: 89. 4C 24, 30
00005475        mov     qword ptr [rsp+28H], r8         ; 5475 _ 4C: 89. 44 24, 28
0000547A        mov     qword ptr [rsp+20H], rsi        ; 547A _ 48: 89. 74 24, 20
0000547F        mov     rcx, qword ptr [rbp-80H]        ; 547F _ 48: 8B. 4D, 80
00005483        mov     r8, r15                         ; 5483 _ 4D: 89. F8
00005486        mov     r9d, 16                         ; 5486 _ 41: B9, 00000010
0000548C        call    _RetrieveLastWrite              ; 548C _ E8, FFFFFD13
00005491        mov     rbx, rax                        ; 5491 _ 48: 89. C3
00005494        mov     rax, 15H                        ; 5494 _ 48: B8, 8000000000000015
0000549E        mov     rcx, 0EH                        ; 549E _ 48: B9, 800000000000000E
000054A8        cmp     rbx, rcx                        ; 54A8 _ 48: 39. CB
000054AB        sete    cl                              ; 54AB _ 0F 94. C1
000054AE        mov     r12b, byte ptr [rbp-49H]        ; 54AE _ 44: 8A. 65, B7
000054B2        test    r12b, r12b                      ; 54B2 _ 45: 84. E4
000054B5        setne   dl                              ; 54B5 _ 0F 95. C2
000054B8        test    cl, dl                          ; 54B8 _ 84. D1
000054BA        jne     ?_498                           ; 54BA _ 0F 85, 000000FB
000054C0        test    rbx, rbx                        ; 54C0 _ 48: 85. DB
000054C3        js      ?_498                           ; 54C3 _ 0F 88, 000000F2
000054C9        test    r12b, r12b                      ; 54C9 _ 45: 84. E4
000054CC        jnz     ?_489                           ; 54CC _ 75, 26
000054CE        mov     rax, qword ptr [rbp-40H]        ; 54CE _ 48: 8B. 45, C0
000054D2        lea     rdx, ptr [_gEfiCallerIdGuid]    ; 54D2 _ 48: 8D. 15, 00003977(rel)
000054D9        mov     rcx, rax                        ; 54D9 _ 48: 89. C1
000054DC        mov     r8d, 16                         ; 54DC _ 41: B8, 00000010
000054E2        mov     r9, rdi                         ; 54E2 _ 49: 89. F9
000054E5        call    qword ptr [rax+8H]              ; 54E5 _ FF. 50, 08
000054E8        mov     rbx, rax                        ; 54E8 _ 48: 89. C3
000054EB        test    rbx, rbx                        ; 54EB _ 48: 85. DB
000054EE        js      ?_498                           ; 54EE _ 0F 88, 000000C7
?_489:
000054F4        add     r15, 24                         ; 54F4 _ 49: 83. C7, 18
000054F8        lea     rcx, ptr [rbp-60H]              ; 54F8 _ 48: 8D. 4D, A0
000054FC        mov     rdx, r15                        ; 54FC _ 4C: 89. FA
000054FF        mov     r8d, 16                         ; 54FF _ 41: B8, 00000010
00005505        call    _CopyMem                        ; 5505 _ E8, FFFFAF3A
0000550A        xor     r15d, r15d                      ; 550A _ 45: 31. FF
0000550D        mov     rcx, r13                        ; 550D _ 4C: 89. E9
00005510        jmp     ?_496                           ; 5510 _ E9, 00000099

?_490:
00005515        mov     edi, dword ptr [rcx+4H]         ; 5515 _ 8B. 79, 04
00005518        test    rdi, rdi                        ; 5518 _ 48: 85. FF
0000551B        je      ?_497                           ; 551B _ 0F 84, 00000097
00005521        xor     r13d, r13d                      ; 5521 _ 45: 31. ED
00005524        jmp     ?_495                           ; 5524 _ EB, 71

?_491:
00005526        mov     rsi, rcx                        ; 5526 _ 48: 89. CE
00005529        test    r12b, r12b                      ; 5529 _ 45: 84. E4
0000552C        jz      ?_493                           ; 552C _ 74, 2F
0000552E        mov     rcx, qword ptr [rbp-68H]        ; 552E _ 48: 8B. 4D, 98
00005532        cmp     rdx, rcx                        ; 5532 _ 48: 39. CA
00005535        jnz     ?_492                           ; 5535 _ 75, 21
00005537        mov     rax, 15H                        ; 5537 _ 48: B8, 8000000000000015
00005541        cmp     qword ptr [rbp-70H], 0          ; 5541 _ 48: 83. 7D, 90, 00
00005546        jnz     ?_498                           ; 5546 _ 75, 73
00005548        mov     rax, 15H                        ; 5548 _ 48: B8, 8000000000000015
00005552        cmp     qword ptr [rbp-78H], rdi        ; 5552 _ 48: 39. 7D, 88
00005556        jnz     ?_498                           ; 5556 _ 75, 63
?_492:
00005558        cmp     rdx, rcx                        ; 5558 _ 48: 39. CA
0000555B        jc      ?_494                           ; 555B _ 72, 2A
?_493:
0000555D        mov     rax, qword ptr [rbp-40H]        ; 555D _ 48: 8B. 45, C0
00005561        mov     qword ptr [rsp+30H], r14        ; 5561 _ 4C: 89. 74 24, 30
00005566        mov     rcx, qword ptr [rbp-80H]        ; 5566 _ 48: 8B. 4D, 80
0000556A        mov     qword ptr [rsp+28H], rcx        ; 556A _ 48: 89. 4C 24, 28
0000556F        lea     rcx, ptr [rbp-60H]              ; 556F _ 48: 8D. 4D, A0
00005573        mov     qword ptr [rsp+20H], rcx        ; 5573 _ 48: 89. 4C 24, 20
00005578        mov     rcx, rax                        ; 5578 _ 48: 89. C1
0000557B        xor     r8d, r8d                        ; 557B _ 45: 31. C0
0000557E        mov     r9, rdi                         ; 557E _ 49: 89. F9
00005581        call    qword ptr [rax+10H]             ; 5581 _ FF. 50, 10
00005584        mov     rbx, rax                        ; 5584 _ 48: 89. C3
?_494:
00005587        test    rbx, rbx                        ; 5587 _ 48: 85. DB
0000558A        js      ?_497                           ; 558A _ 78, 2C
0000558C        add     r14, rdi                        ; 558C _ 49: 01. FE
0000558F        mov     rcx, rsi                        ; 558F _ 48: 89. F1
00005592        mov     eax, dword ptr [rcx]            ; 5592 _ 8B. 01
00005594        inc     r13                             ; 5594 _ 49: FF. C5
?_495:
00005597        lea     rdx, ptr [r15+r13]              ; 5597 _ 4B: 8D. 14 2F
0000559B        mov     eax, eax                        ; 559B _ 89. C0
0000559D        cmp     r13, rax                        ; 559D _ 49: 39. C5
000055A0        jc      ?_491                           ; 55A0 _ 72, 84
000055A2        test    rbx, rbx                        ; 55A2 _ 48: 85. DB
000055A5        js      ?_497                           ; 55A5 _ 78, 11
000055A7        add     rcx, 8                          ; 55A7 _ 48: 83. C1, 08
000055AB        mov     r15, rdx                        ; 55AB _ 49: 89. D7
?_496:
000055AE        mov     eax, dword ptr [rcx]            ; 55AE _ 8B. 01
000055B0        test    eax, eax                        ; 55B0 _ 85. C0
000055B2        jne     ?_490                           ; 55B2 _ 0F 85, FFFFFF5D
?_497:
000055B8        mov     rax, rbx                        ; 55B8 _ 48: 89. D8
?_498:
000055BB        add     rsp, 152                        ; 55BB _ 48: 81. C4, 00000098
000055C2        pop     rbx                             ; 55C2 _ 5B
000055C3        pop     rdi                             ; 55C3 _ 5F
000055C4        pop     rsi                             ; 55C4 _ 5E
000055C5        pop     r12                             ; 55C5 _ 41: 5C
000055C7        pop     r13                             ; 55C7 _ 41: 5D
000055C9        pop     r14                             ; 55C9 _ 41: 5E
000055CB        pop     r15                             ; 55CB _ 41: 5F
000055CD        pop     rbp                             ; 55CD _ 5D
000055CE        ret                                     ; 55CE _ C3
_FaultTolerantUpdateOnWholeFv ENDP

_NonFaultTolerantUpdateOnWholeFv PROC
000055CF        push    rbp                             ; 55CF _ 55
000055D0        mov     rbp, rsp                        ; 55D0 _ 48: 89. E5
000055D3        push    r15                             ; 55D3 _ 41: 57
000055D5        push    r14                             ; 55D5 _ 41: 56
000055D7        push    r12                             ; 55D7 _ 41: 54
000055D9        push    rsi                             ; 55D9 _ 56
000055DA        push    rdi                             ; 55DA _ 57
000055DB        push    rbx                             ; 55DB _ 53
000055DC        sub     rsp, 32                         ; 55DC _ 48: 83. EC, 20
000055E0        mov     r15, r8                         ; 55E0 _ 4D: 89. C7
000055E3        mov     r14, rdx                        ; 55E3 _ 49: 89. D6
000055E6        mov     rax, 2H                         ; 55E6 _ 48: B8, 8000000000000002
000055F0        cmp     dword ptr [r9+8H], 0            ; 55F0 _ 41: 83. 79, 08, 00
000055F5        jnz     ?_503                           ; 55F5 _ 75, 63
000055F7        mov     rax, 2H                         ; 55F7 _ 48: B8, 8000000000000002
00005601        cmp     byte ptr [r9+30H], 0            ; 5601 _ 41: 80. 79, 30, 00
00005606        jnz     ?_503                           ; 5606 _ 75, 52
00005608        mov     rbx, qword ptr [rbp+30H]        ; 5608 _ 48: 8B. 5D, 30
0000560C        xor     eax, eax                        ; 560C _ 31. C0
0000560E        mov     r12, rax                        ; 560E _ 49: 89. C4
00005611        jmp     ?_500                           ; 5611 _ EB, 07

?_499:
00005613        add     r15, 8                          ; 5613 _ 49: 83. C7, 08
00005617        mov     r12, rdx                        ; 5617 _ 49: 89. D4
?_500:
0000561A        mov     ecx, dword ptr [r15]            ; 561A _ 41: 8B. 0F
0000561D        test    ecx, ecx                        ; 561D _ 85. C9
0000561F        jz      ?_503                           ; 561F _ 74, 39
00005621        mov     edi, dword ptr [r15+4H]         ; 5621 _ 41: 8B. 7F, 04
00005625        test    rdi, rdi                        ; 5625 _ 48: 85. FF
00005628        jz      ?_503                           ; 5628 _ 74, 30
0000562A        xor     esi, esi                        ; 562A _ 31. F6
0000562C        jmp     ?_502                           ; 562C _ EB, 1C

?_501:
0000562E        mov     rcx, r14                        ; 562E _ 4C: 89. F1
00005631        mov     r8, rdi                         ; 5631 _ 49: 89. F8
00005634        mov     r9, rbx                         ; 5634 _ 49: 89. D9
00005637        call    _UpdateOneBlock                 ; 5637 _ E8, FFFFFA36
0000563C        test    rax, rax                        ; 563C _ 48: 85. C0
0000563F        js      ?_503                           ; 563F _ 78, 19
00005641        add     rbx, rdi                        ; 5641 _ 48: 01. FB
00005644        mov     ecx, dword ptr [r15]            ; 5644 _ 41: 8B. 0F
00005647        inc     rsi                             ; 5647 _ 48: FF. C6
?_502:
0000564A        lea     rdx, ptr [r12+rsi]              ; 564A _ 49: 8D. 14 34
0000564E        mov     ecx, ecx                        ; 564E _ 89. C9
00005650        cmp     rsi, rcx                        ; 5650 _ 48: 39. CE
00005653        jc      ?_501                           ; 5653 _ 72, D9
00005655        test    rax, rax                        ; 5655 _ 48: 85. C0
00005658        jns     ?_499                           ; 5658 _ 79, B9
?_503:
0000565A        add     rsp, 32                         ; 565A _ 48: 83. C4, 20
0000565E        pop     rbx                             ; 565E _ 5B
0000565F        pop     rdi                             ; 565F _ 5F
00005660        pop     rsi                             ; 5660 _ 5E
00005661        pop     r12                             ; 5661 _ 41: 5C
00005663        pop     r14                             ; 5663 _ 41: 5E
00005665        pop     r15                             ; 5665 _ 41: 5F
00005667        pop     rbp                             ; 5667 _ 5D
00005668        ret                                     ; 5668 _ C3
_NonFaultTolerantUpdateOnWholeFv ENDP

_PerformUpdateOnWholeFv PROC
00005669        push    rbp                             ; 5669 _ 55
0000566A        mov     rbp, rsp                        ; 566A _ 48: 89. E5
0000566D        push    r15                             ; 566D _ 41: 57
0000566F        push    r14                             ; 566F _ 41: 56
00005671        push    r12                             ; 5671 _ 41: 54
00005673        push    rsi                             ; 5673 _ 56
00005674        push    rdi                             ; 5674 _ 57
00005675        push    rbx                             ; 5675 _ 53
00005676        sub     rsp, 48                         ; 5676 _ 48: 83. EC, 30
0000567A        mov     r15, r9                         ; 567A _ 4D: 89. CF
0000567D        mov     rdi, r8                         ; 567D _ 4C: 89. C7
00005680        mov     r12, rdx                        ; 5680 _ 49: 89. D4
00005683        mov     r14, rcx                        ; 5683 _ 49: 89. CE
00005686        mov     rsi, 2H                         ; 5686 _ 48: BE, 8000000000000002
00005690        cmp     dword ptr [rdi+8H], 0           ; 5690 _ 83. 7F, 08, 00
00005694        jne     ?_509                           ; 5694 _ 0F 85, 000000FB
0000569A        mov     rax, qword ptr [rdi+10H]        ; 569A _ 48: 8B. 47, 10
0000569E        movzx   ecx, word ptr [rax+30H]         ; 569E _ 0F B7. 48, 30
000056A2        call    _AllocatePool                   ; 56A2 _ E8, FFFFBFB8
000056A7        mov     rbx, rax                        ; 56A7 _ 48: 89. C3
000056AA        mov     rsi, 9H                         ; 56AA _ 48: BE, 8000000000000009
000056B4        test    rbx, rbx                        ; 56B4 _ 48: 85. DB
000056B7        je      ?_509                           ; 56B7 _ 0F 84, 000000D8
000056BD        mov     rsi, qword ptr [rbp+30H]        ; 56BD _ 48: 8B. 75, 30
000056C1        mov     rdx, qword ptr [rdi+10H]        ; 56C1 _ 48: 8B. 57, 10
000056C5        movzx   r8d, word ptr [rdx+30H]         ; 56C5 _ 44: 0F B7. 42, 30
000056CA        mov     rcx, rbx                        ; 56CA _ 48: 89. D9
000056CD        call    _CopyMem                        ; 56CD _ E8, FFFFAD72
000056D2        cmp     qword ptr [rbx+20H], rsi        ; 56D2 _ 48: 39. 73, 20
000056D6        jz      ?_504                           ; 56D6 _ 74, 17
000056D8        mov     rcx, rbx                        ; 56D8 _ 48: 89. D9
000056DB        call    _FreePool                       ; 56DB _ E8, FFFFC077
000056E0        mov     rsi, 2H                         ; 56E0 _ 48: BE, 8000000000000002
000056EA        jmp     ?_509                           ; 56EA _ E9, 000000A6

?_504:
000056EF        mov     rcx, qword ptr [_gHiiHandle]    ; 56EF _ 48: 8B. 0D, 00003A92(rel)
000056F6        mov     edx, 7                          ; 56F6 _ BA, 00000007
000056FB        xor     r8d, r8d                        ; 56FB _ 45: 31. C0
000056FE        call    _HiiGetString                   ; 56FE _ E8, FFFFDD7B
00005703        mov     rsi, rax                        ; 5703 _ 48: 89. C6
00005706        test    rsi, rsi                        ; 5706 _ 48: 85. F6
00005709        jz      ?_505                           ; 5709 _ 74, 1B
0000570B        mov     rdx, qword ptr [rdi+10H]        ; 570B _ 48: 8B. 57, 10
0000570F        mov     r8, qword ptr [rbx+20H]         ; 570F _ 4C: 8B. 43, 20
00005713        add     r8, rdx                         ; 5713 _ 49: 01. D0
00005716        mov     rcx, rsi                        ; 5716 _ 48: 89. F1
00005719        call    _Print                          ; 5719 _ E8, FFFFD818
0000571E        mov     rcx, rsi                        ; 571E _ 48: 89. F1
00005721        call    _FreePool                       ; 5721 _ E8, FFFFC031
?_505:
00005726        call    _DebugPrintEnabled              ; 5726 _ E8, FFFFAB24
0000572B        test    al, al                          ; 572B _ 84. C0
0000572D        jz      ?_506                           ; 572D _ 74, 2A
0000572F        mov     ecx, 2147483648                 ; 572F _ B9, 80000000
00005734        call    _DebugPrintLevelEnabled         ; 5734 _ E8, FFFFAB19
00005739        test    al, al                          ; 5739 _ 84. C0
0000573B        jz      ?_506                           ; 573B _ 74, 1C
0000573D        mov     r8, qword ptr [rdi+10H]         ; 573D _ 4C: 8B. 47, 10
00005741        mov     r9, qword ptr [rbx+20H]         ; 5741 _ 4C: 8B. 4B, 20
00005745        add     r9, r8                          ; 5745 _ 4D: 01. C1
00005748        lea     rdx, ptr [?_666]                ; 5748 _ 48: 8D. 15, 00002144(rel)
0000574F        mov     ecx, 2147483648                 ; 574F _ B9, 80000000
00005754        call    _DebugPrint                     ; 5754 _ E8, FFFFAAE7
?_506:
00005759        lea     r8, ptr [rbx+38H]               ; 5759 _ 4C: 8D. 43, 38
0000575D        cmp     byte ptr [rdi+30H], 0           ; 575D _ 80. 7F, 30, 00
00005761        jz      ?_507                           ; 5761 _ 74, 12
00005763        mov     qword ptr [rsp+20H], r15        ; 5763 _ 4C: 89. 7C 24, 20
00005768        mov     rcx, r14                        ; 5768 _ 4C: 89. F1
0000576B        mov     r9, rdi                         ; 576B _ 49: 89. F9
0000576E        call    _FaultTolerantUpdateOnWholeFv   ; 576E _ E8, FFFFFBF7
00005773        jmp     ?_508                           ; 5773 _ EB, 10

?_507:
00005775        mov     qword ptr [rsp+20H], r15        ; 5775 _ 4C: 89. 7C 24, 20
0000577A        mov     rdx, r12                        ; 577A _ 4C: 89. E2
0000577D        mov     r9, rdi                         ; 577D _ 49: 89. F9
00005780        call    _NonFaultTolerantUpdateOnWholeFv; 5780 _ E8, FFFFFE4A
?_508:
00005785        mov     rsi, rax                        ; 5785 _ 48: 89. C6
00005788        mov     rcx, rbx                        ; 5788 _ 48: 89. D9
0000578B        call    _FreePool                       ; 578B _ E8, FFFFBFC7
00005790        test    rsi, rsi                        ; 5790 _ 48: 85. F6
00005793        jns     ?_510                           ; 5793 _ 79, 12
?_509:
00005795        mov     rax, rsi                        ; 5795 _ 48: 89. F0
00005798        add     rsp, 48                         ; 5798 _ 48: 83. C4, 30
0000579C        pop     rbx                             ; 579C _ 5B
0000579D        pop     rdi                             ; 579D _ 5F
0000579E        pop     rsi                             ; 579E _ 5E
0000579F        pop     r12                             ; 579F _ 41: 5C
000057A1        pop     r14                             ; 57A1 _ 41: 5E
000057A3        pop     r15                             ; 57A3 _ 41: 5F
000057A5        pop     rbp                             ; 57A5 _ 5D
000057A6        ret                                     ; 57A6 _ C3
_PerformUpdateOnWholeFv ENDP

?_510   LABEL NEAR
000057A7        mov     rax, qword ptr [_gBS]           ; 57A7 _ 48: 8B. 05, 0000399A(rel)
000057AE        mov     rax, qword ptr [rax+88H]        ; 57AE _ 48: 8B. 80, 00000088
000057B5        lea     rdx, ptr [_gEfiFirmwareVolumeBlockProtocolGuid]; 57B5 _ 48: 8D. 15, 0000370C(rel)
000057BC        mov     rcx, r14                        ; 57BC _ 4C: 89. F1
000057BF        mov     r8, r12                         ; 57BF _ 4D: 89. E0
000057C2        mov     r9, r12                         ; 57C2 _ 4D: 89. E1
000057C5        add     rsp, 48                         ; 57C5 _ 48: 83. C4, 30
000057C9        pop     rbx                             ; 57C9 _ 5B
000057CA        pop     rdi                             ; 57CA _ 5F
000057CB        pop     rsi                             ; 57CB _ 5E
000057CC        pop     r12                             ; 57CC _ 41: 5C
000057CE        pop     r14                             ; 57CE _ 41: 5E
000057D0        pop     r15                             ; 57D0 _ 41: 5F
000057D2        pop     rbp                             ; 57D2 _ 5D
000057D3        jmp     rax                             ; 57D3 _ FF. E0

_PerformUpdateOnFvFile PROC
000057D5        push    rbp                             ; 57D5 _ 55
000057D6        mov     rbp, rsp                        ; 57D6 _ 48: 89. E5
000057D9        push    r14                             ; 57D9 _ 41: 56
000057DB        push    rsi                             ; 57DB _ 56
000057DC        push    rdi                             ; 57DC _ 57
000057DD        push    rbx                             ; 57DD _ 53
000057DE        sub     rsp, 80                         ; 57DE _ 48: 83. EC, 50
000057E2        mov     r14, r9                         ; 57E2 _ 4D: 89. CE
000057E5        mov     rsi, r8                         ; 57E5 _ 4C: 89. C6
000057E8        mov     rbx, rcx                        ; 57E8 _ 48: 89. CB
000057EB        mov     rax, 2H                         ; 57EB _ 48: B8, 8000000000000002
000057F5        cmp     dword ptr [rsi+8H], 1           ; 57F5 _ 83. 7E, 08, 01
000057F9        jne     ?_514                           ; 57F9 _ 0F 85, 000000D0
000057FF        mov     rcx, qword ptr [_gHiiHandle]    ; 57FF _ 48: 8B. 0D, 00003982(rel)
00005806        mov     edx, 6                          ; 5806 _ BA, 00000006
0000580B        xor     r8d, r8d                        ; 580B _ 45: 31. C0
0000580E        call    _HiiGetString                   ; 580E _ E8, FFFFDC6B
00005813        mov     rdi, rax                        ; 5813 _ 48: 89. C7
00005816        test    rdi, rdi                        ; 5816 _ 48: 85. FF
00005819        jz      ?_511                           ; 5819 _ 74, 14
0000581B        lea     rdx, ptr [rsi+18H]              ; 581B _ 48: 8D. 56, 18
0000581F        mov     rcx, rdi                        ; 581F _ 48: 89. F9
00005822        call    _Print                          ; 5822 _ E8, FFFFD70F
00005827        mov     rcx, rdi                        ; 5827 _ 48: 89. F9
0000582A        call    _FreePool                       ; 582A _ E8, FFFFBF28
?_511:
0000582F        call    _DebugPrintEnabled              ; 582F _ E8, FFFFAA1B
00005834        test    al, al                          ; 5834 _ 84. C0
00005836        jz      ?_512                           ; 5836 _ 74, 23
00005838        mov     ecx, 2147483648                 ; 5838 _ B9, 80000000
0000583D        call    _DebugPrintLevelEnabled         ; 583D _ E8, FFFFAA10
00005842        test    al, al                          ; 5842 _ 84. C0
00005844        jz      ?_512                           ; 5844 _ 74, 15
00005846        lea     r8, ptr [rsi+18H]               ; 5846 _ 4C: 8D. 46, 18
0000584A        lea     rdx, ptr [?_667]                ; 584A _ 48: 8D. 15, 00002077(rel)
00005851        mov     ecx, 2147483648                 ; 5851 _ B9, 80000000
00005856        call    _DebugPrint                     ; 5856 _ E8, FFFFA9E5
?_512:
0000585B        mov     rax, qword ptr [_gBS]           ; 585B _ 48: 8B. 05, 000038E6(rel)
00005862        lea     rdx, ptr [_gEfiFirmwareVolume2ProtocolGuid]; 5862 _ 48: 8D. 15, 0000364F(rel)
00005869        lea     r8, ptr [rbp-28H]               ; 5869 _ 4C: 8D. 45, D8
0000586D        mov     rcx, rbx                        ; 586D _ 48: 89. D9
00005870        call    qword ptr [rax+98H]             ; 5870 _ FF. 90, 00000098
00005876        test    rax, rax                        ; 5876 _ 48: 85. C0
00005879        js      ?_514                           ; 5879 _ 78, 54
0000587B        mov     cl, byte ptr [rbp+38H]          ; 587B _ 8A. 4D, 38
0000587E        cmp     cl, 8                           ; 587E _ 80. F9, 08
00005881        ja      ?_513                           ; 5881 _ 77, 18
00005883        movzx   edx, cl                         ; 5883 _ 0F B6. D1
00005886        mov     rax, 3H                         ; 5886 _ 48: B8, 8000000000000003
00005890        mov     ebx, 336                        ; 5890 _ BB, 00000150
00005895        bt      rbx, rdx                        ; 5895 _ 48: 0F A3. D3
00005899        jc      ?_514                           ; 5899 _ 72, 34
?_513:
0000589B        mov     edx, dword ptr [rbp+40H]        ; 589B _ 8B. 55, 40
0000589E        mov     rax, qword ptr [rbp+30H]        ; 589E _ 48: 8B. 45, 30
000058A2        lea     rbx, ptr [rsi+18H]              ; 58A2 _ 48: 8D. 5E, 18
000058A6        mov     qword ptr [rbp-48H], rbx        ; 58A6 _ 48: 89. 5D, B8
000058AA        mov     byte ptr [rbp-40H], cl          ; 58AA _ 88. 4D, C0
000058AD        mov     dword ptr [rbp-3CH], edx        ; 58AD _ 89. 55, C4
000058B0        mov     qword ptr [rbp-38H], r14        ; 58B0 _ 4C: 89. 75, C8
000058B4        mov     dword ptr [rbp-30H], eax        ; 58B4 _ 89. 45, D0
000058B7        lea     r9, ptr [rbp-48H]               ; 58B7 _ 4C: 8D. 4D, B8
000058BB        movzx   r8d, byte ptr [rsi+30H]         ; 58BB _ 44: 0F B6. 46, 30
000058C0        mov     rax, qword ptr [rbp-28H]        ; 58C0 _ 48: 8B. 45, D8
000058C4        mov     rcx, rax                        ; 58C4 _ 48: 89. C1
000058C7        mov     edx, 1                          ; 58C7 _ BA, 00000001
000058CC        call    qword ptr [rax+20H]             ; 58CC _ FF. 50, 20
?_514:
000058CF        add     rsp, 80                         ; 58CF _ 48: 83. C4, 50
000058D3        pop     rbx                             ; 58D3 _ 5B
000058D4        pop     rdi                             ; 58D4 _ 5F
000058D5        pop     rsi                             ; 58D5 _ 5E
000058D6        pop     r14                             ; 58D6 _ 41: 5E
000058D8        pop     rbp                             ; 58D8 _ 5D
000058D9        ret                                     ; 58D9 _ C3
_PerformUpdateOnFvFile ENDP

_FaultTolerantUpdateOnPartFv PROC
000058DA        push    rbp                             ; 58DA _ 55
000058DB        mov     rbp, rsp                        ; 58DB _ 48: 89. E5
000058DE        push    r15                             ; 58DE _ 41: 57
000058E0        push    r14                             ; 58E0 _ 41: 56
000058E2        push    r13                             ; 58E2 _ 41: 55
000058E4        push    r12                             ; 58E4 _ 41: 54
000058E6        push    rsi                             ; 58E6 _ 56
000058E7        push    rdi                             ; 58E7 _ 57
000058E8        push    rbx                             ; 58E8 _ 53
000058E9        sub     rsp, 248                        ; 58E9 _ 48: 81. EC, 000000F8
000058F0        mov     qword ptr [rbp-0C0H], r9        ; 58F0 _ 4C: 89. 8D, FFFFFF40
000058F7        mov     qword ptr [rbp-0E8H], r8        ; 58F7 _ 4C: 89. 85, FFFFFF18
000058FE        mov     qword ptr [rbp-0E0H], rdx       ; 58FE _ 48: 89. 95, FFFFFF20
00005905        mov     qword ptr [rbp-98H], rcx        ; 5905 _ 48: 89. 8D, FFFFFF68
0000590C        lea     rdx, ptr [rbp-40H]              ; 590C _ 48: 8D. 55, C0
00005910        mov     rax, qword ptr [rbp+38H]        ; 5910 _ 48: 8B. 45, 38
00005914        mov     rcx, rax                        ; 5914 _ 48: 89. C1
00005917        call    qword ptr [rax+10H]             ; 5917 _ FF. 50, 10
0000591A        mov     rdi, rax                        ; 591A _ 48: 89. C7
0000591D        test    rdi, rdi                        ; 591D _ 48: 85. FF
00005920        js      ?_537                           ; 5920 _ 0F 88, 00000580
00005926        mov     rbx, qword ptr [rbp+30H]        ; 5926 _ 48: 8B. 5D, 30
0000592A        mov     rdi, 2H                         ; 592A _ 48: BF, 8000000000000002
00005934        mov     rdx, qword ptr [rbp-40H]        ; 5934 _ 48: 8B. 55, C0
00005938        cmp     rdx, rbx                        ; 5938 _ 48: 39. DA
0000593B        ja      ?_537                           ; 593B _ 0F 87, 00000565
00005941        mov     rax, qword ptr [rdx+20H]        ; 5941 _ 48: 8B. 42, 20
00005945        add     rax, rdx                        ; 5945 _ 48: 01. D0
00005948        mov     rdi, 2H                         ; 5948 _ 48: BF, 8000000000000002
00005952        cmp     rax, rbx                        ; 5952 _ 48: 39. D8
00005955        jc      ?_537                           ; 5955 _ 0F 82, 0000054B
0000595B        movzx   ecx, word ptr [rdx+30H]         ; 595B _ 0F B7. 4A, 30
0000595F        mov     rsi, rbx                        ; 595F _ 48: 89. DE
00005962        call    _AllocateCopyPool               ; 5962 _ E8, FFFFBDDD
00005967        mov     rcx, rsi                        ; 5967 _ 48: 89. F1
0000596A        mov     rdi, 9H                         ; 596A _ 48: BF, 8000000000000009
00005974        test    rax, rax                        ; 5974 _ 48: 85. C0
00005977        je      ?_537                           ; 5977 _ 0F 84, 00000529
0000597D        lea     rdx, ptr [rax+38H]              ; 597D _ 48: 8D. 50, 38
00005981        mov     qword ptr [rbp-0B0H], rdx       ; 5981 _ 48: 89. 95, FFFFFF50
00005988        mov     qword ptr [rbp-0D8H], rax       ; 5988 _ 48: 89. 85, FFFFFF28
0000598F        xor     r15d, r15d                      ; 598F _ 45: 31. FF
00005992        mov     r10, qword ptr [rbp-40H]        ; 5992 _ 4C: 8B. 55, C0
00005996        mov     rsi, qword ptr [rbp-0E0H]       ; 5996 _ 48: 8B. B5, FFFFFF20
0000599D        mov     r9, rcx                         ; 599D _ 49: 89. C9
000059A0        mov     qword ptr [rbp-88H], r15        ; 59A0 _ 4C: 89. BD, FFFFFF78
000059A7        mov     qword ptr [rbp-0A8H], 0         ; 59A7 _ 48: C7. 85, FFFFFF58, 00000000
000059B2        jmp     ?_518                           ; 59B2 _ E9, 000000EE

?_515:
000059B7        mov     qword ptr [rbp-0B8H], rdx       ; 59B7 _ 48: 89. 95, FFFFFF48
000059BE        mov     rax, r15                        ; 59BE _ 4C: 89. F8
000059C1        not     rax                             ; 59C1 _ 48: F7. D0
000059C4        mov     qword ptr [rbp-0A0H], rax       ; 59C4 _ 48: 89. 85, FFFFFF60
000059CB        lea     rax, ptr [r10-1H]               ; 59CB _ 49: 8D. 42, FF
000059CF        mov     r8, r10                         ; 59CF _ 4D: 89. D0
000059D2        neg     r8                              ; 59D2 _ 49: F7. D8
000059D5        mov     r11, -1                         ; 59D5 _ 49: C7. C3, FFFFFFFF
000059DC        mov     rdi, r10                        ; 59DC _ 4C: 89. D7
?_516:
000059DF        mov     rdx, rax                        ; 59DF _ 48: 89. C2
000059E2        mov     r13, r8                         ; 59E2 _ 4D: 89. C5
000059E5        mov     r10, rdi                        ; 59E5 _ 49: 89. FA
000059E8        inc     r11                             ; 59E8 _ 49: FF. C3
000059EB        cmp     r11, qword ptr [rbp-90H]        ; 59EB _ 4C: 3B. 9D, FFFFFF70
000059F2        jnc     ?_517                           ; 59F2 _ 0F 83, 000000A2
000059F8        lea     rax, ptr [rdx+r15]              ; 59F8 _ 4A: 8D. 04 3A
000059FC        mov     r8, r13                         ; 59FC _ 4D: 89. E8
000059FF        sub     r8, r15                         ; 59FF _ 4D: 29. F8
00005A02        lea     rdi, ptr [r10+r15]              ; 5A02 _ 4B: 8D. 3C 3A
00005A06        cmp     r9, r10                         ; 5A06 _ 4D: 39. D1
00005A09        jc      ?_516                           ; 5A09 _ 72, D4
00005A0B        lea     rcx, ptr [r15+r10]              ; 5A0B _ 4B: 8D. 0C 17
00005A0F        cmp     r9, rcx                         ; 5A0F _ 49: 39. C9
00005A12        jnc     ?_516                           ; 5A12 _ 73, CB
00005A14        sub     rdx, r9                         ; 5A14 _ 4C: 29. CA
00005A17        mov     r12, rsi                        ; 5A17 _ 49: 89. F4
00005A1A        sub     rdx, r12                        ; 5A1A _ 4C: 29. E2
00005A1D        mov     rcx, qword ptr [rbp-0A0H]       ; 5A1D _ 48: 8B. 8D, FFFFFF60
00005A24        cmp     rdx, rcx                        ; 5A24 _ 48: 39. CA
00005A27        mov     rsi, rcx                        ; 5A27 _ 48: 89. CE
00005A2A        cmova   rsi, rdx                        ; 5A2A _ 48: 0F 47. F2
00005A2E        mov     r14, r8                         ; 5A2E _ 4D: 89. C6
00005A31        mov     r8, r10                         ; 5A31 _ 4D: 89. D0
00005A34        sub     r8, rsi                         ; 5A34 _ 49: 29. F0
00005A37        mov     rcx, r8                         ; 5A37 _ 4C: 89. C1
00005A3A        sub     rcx, r9                         ; 5A3A _ 4C: 29. C9
00005A3D        add     rsi, r13                        ; 5A3D _ 4C: 01. EE
00005A40        mov     rbx, r9                         ; 5A40 _ 4C: 89. CB
00005A43        add     rbx, r12                        ; 5A43 _ 4C: 01. E3
00005A46        lea     r9, ptr [rsi+rbx+1H]            ; 5A46 _ 4C: 8D. 4C 1E, 01
00005A4B        dec     r8                              ; 5A4B _ 49: FF. C8
00005A4E        dec     rcx                             ; 5A4E _ 48: FF. C9
00005A51        mov     rsi, qword ptr [rbp-88H]        ; 5A51 _ 48: 8B. B5, FFFFFF78
00005A58        cmp     rsi, r15                        ; 5A58 _ 4C: 39. FE
00005A5B        cmovc   rsi, r15                        ; 5A5B _ 49: 0F 42. F7
00005A5F        mov     qword ptr [rbp-88H], rsi        ; 5A5F _ 48: 89. B5, FFFFFF78
00005A66        inc     qword ptr [rbp-0A8H]            ; 5A66 _ 48: FF. 85, FFFFFF58
00005A6D        cmp     rcx, r12                        ; 5A6D _ 4C: 39. E1
00005A70        mov     rsi, r9                         ; 5A70 _ 4C: 89. CE
00005A73        mov     r9, r8                          ; 5A73 _ 4D: 89. C1
00005A76        mov     r8, r14                         ; 5A76 _ 4D: 89. F0
00005A79        jne     ?_516                           ; 5A79 _ 0F 85, FFFFFF60
00005A7F        not     r15                             ; 5A7F _ 49: F7. D7
00005A82        cmp     rdx, r15                        ; 5A82 _ 4C: 39. FA
00005A85        cmova   r15, rdx                        ; 5A85 _ 4C: 0F 47. FA
00005A89        add     rbx, r15                        ; 5A89 _ 4C: 01. FB
00005A8C        lea     rsi, ptr [r13+rbx+1H]           ; 5A8C _ 49: 8D. 74 1D, 01
00005A91        mov     r9, r10                         ; 5A91 _ 4D: 89. D1
00005A94        sub     r9, r15                         ; 5A94 _ 4D: 29. F9
00005A97        dec     r9                              ; 5A97 _ 49: FF. C9
?_517:
00005A9A        mov     rdx, qword ptr [rbp-0B8H]       ; 5A9A _ 48: 8B. 95, FFFFFF48
00005AA1        add     rdx, 8                          ; 5AA1 _ 48: 83. C2, 08
?_518:
00005AA5        test    rsi, rsi                        ; 5AA5 _ 48: 85. F6
00005AA8        jz      ?_519                           ; 5AA8 _ 74, 1B
00005AAA        mov     eax, dword ptr [rdx]            ; 5AAA _ 8B. 02
00005AAC        mov     qword ptr [rbp-90H], rax        ; 5AAC _ 48: 89. 85, FFFFFF70
00005AB3        test    rax, rax                        ; 5AB3 _ 48: 85. C0
00005AB6        jz      ?_519                           ; 5AB6 _ 74, 0D
00005AB8        mov     r15d, dword ptr [rdx+4H]        ; 5AB8 _ 44: 8B. 7A, 04
00005ABC        test    r15, r15                        ; 5ABC _ 4D: 85. FF
00005ABF        jne     ?_515                           ; 5ABF _ 0F 85, FFFFFEF2
?_519:
00005AC5        mov     rax, qword ptr [_gBS]           ; 5AC5 _ 48: 8B. 05, 0000367C(rel)
00005ACC        lea     rcx, ptr [_gEfiFaultTolerantWriteProtocolGuid]; 5ACC _ 48: 8D. 0D, 000033D5(rel)
00005AD3        lea     r8, ptr [rbp-48H]               ; 5AD3 _ 4C: 8D. 45, B8
00005AD7        xor     edx, edx                        ; 5AD7 _ 31. D2
00005AD9        call    qword ptr [rax+140H]            ; 5AD9 _ FF. 90, 00000140
00005ADF        test    rax, rax                        ; 5ADF _ 48: 85. C0
00005AE2        jns     ?_520                           ; 5AE2 _ 79, 1B
00005AE4        mov     rcx, qword ptr [rbp-0D8H]       ; 5AE4 _ 48: 8B. 8D, FFFFFF28
00005AEB        call    _FreePool                       ; 5AEB _ E8, FFFFBC67
00005AF0        mov     rdi, 0EH                        ; 5AF0 _ 48: BF, 800000000000000E
00005AFA        jmp     ?_537                           ; 5AFA _ E9, 000003A7

?_520:
00005AFF        mov     rax, qword ptr [rbp-48H]        ; 5AFF _ 48: 8B. 45, B8
00005B03        lea     rdx, ptr [rbp-50H]              ; 5B03 _ 48: 8D. 55, B0
00005B07        mov     rcx, rax                        ; 5B07 _ 48: 89. C1
00005B0A        call    qword ptr [rax]                 ; 5B0A _ FF. 10
00005B0C        mov     rax, qword ptr [rbp-88H]        ; 5B0C _ 48: 8B. 85, FFFFFF78
00005B13        cmp     qword ptr [rbp-50H], rax        ; 5B13 _ 48: 39. 45, B0
00005B17        jnc     ?_521                           ; 5B17 _ 73, 1B
00005B19        mov     rcx, qword ptr [rbp-0D8H]       ; 5B19 _ 48: 8B. 8D, FFFFFF28
00005B20        call    _FreePool                       ; 5B20 _ E8, FFFFBC32
00005B25        mov     rdi, 9H                         ; 5B25 _ 48: BF, 8000000000000009
00005B2F        jmp     ?_537                           ; 5B2F _ E9, 00000372

?_521:
00005B34        mov     qword ptr [rbp-70H], 0          ; 5B34 _ 48: C7. 45, 90, 00000000
00005B3C        mov     qword ptr [rbp-78H], 0          ; 5B3C _ 48: C7. 45, 88, 00000000
00005B44        mov     qword ptr [rbp-80H], 0          ; 5B44 _ 48: C7. 45, 80, 00000000
00005B4C        mov     byte ptr [rbp-51H], 0           ; 5B4C _ C6. 45, AF, 00
00005B50        mov     rdx, qword ptr [rbp-48H]        ; 5B50 _ 48: 8B. 55, B8
00005B54        lea     rsi, ptr [rbp-68H]              ; 5B54 _ 48: 8D. 75, 98
00005B58        lea     rax, ptr [rbp-70H]              ; 5B58 _ 48: 8D. 45, 90
00005B5C        lea     rcx, ptr [rbp-78H]              ; 5B5C _ 48: 8D. 4D, 88
00005B60        lea     rbx, ptr [rbp-80H]              ; 5B60 _ 48: 8D. 5D, 80
00005B64        lea     rdi, ptr [rbp-51H]              ; 5B64 _ 48: 8D. 7D, AF
00005B68        mov     qword ptr [rsp+40H], rdi        ; 5B68 _ 48: 89. 7C 24, 40
00005B6D        mov     qword ptr [rsp+38H], rbx        ; 5B6D _ 48: 89. 5C 24, 38
00005B72        mov     qword ptr [rsp+30H], rcx        ; 5B72 _ 48: 89. 4C 24, 30
00005B77        mov     qword ptr [rsp+28H], rax        ; 5B77 _ 48: 89. 44 24, 28
00005B7C        mov     qword ptr [rsp+20H], rsi        ; 5B7C _ 48: 89. 74 24, 20
00005B81        mov     rcx, qword ptr [rbp+40H]        ; 5B81 _ 48: 8B. 4D, 40
00005B85        mov     r8, qword ptr [rbp-0C0H]        ; 5B85 _ 4C: 8B. 85, FFFFFF40
00005B8C        mov     r9d, 16                         ; 5B8C _ 41: B9, 00000010
00005B92        call    _RetrieveLastWrite              ; 5B92 _ E8, FFFFF60D
00005B97        mov     cl, byte ptr [rbp-51H]          ; 5B97 _ 8A. 4D, AF
00005B9A        mov     byte ptr [rbp-0C9H], cl         ; 5B9A _ 88. 8D, FFFFFF37
00005BA0        test    cl, cl                          ; 5BA0 _ 84. C9
00005BA2        jz      ?_523                           ; 5BA2 _ 74, 2A
00005BA4        mov     rcx, 0EH                        ; 5BA4 _ 48: B9, 800000000000000E
00005BAE        cmp     rax, rcx                        ; 5BAE _ 48: 39. C8
00005BB1        jnz     ?_523                           ; 5BB1 _ 75, 1B
?_522:
00005BB3        mov     rcx, qword ptr [rbp-0D8H]       ; 5BB3 _ 48: 8B. 8D, FFFFFF28
00005BBA        call    _FreePool                       ; 5BBA _ E8, FFFFBB98
00005BBF        mov     rdi, 15H                        ; 5BBF _ 48: BF, 8000000000000015
00005BC9        jmp     ?_537                           ; 5BC9 _ E9, 000002D8

?_523:
00005BCE        test    rax, rax                        ; 5BCE _ 48: 85. C0
00005BD1        js      ?_522                           ; 5BD1 _ 78, E0
00005BD3        cmp     byte ptr [rbp-0C9H], 0          ; 5BD3 _ 80. BD, FFFFFF37, 00
00005BDA        jnz     ?_524                           ; 5BDA _ 75, 3A
00005BDC        mov     rax, qword ptr [rbp-48H]        ; 5BDC _ 48: 8B. 45, B8
00005BE0        lea     rdx, ptr [_gEfiCallerIdGuid]    ; 5BE0 _ 48: 8D. 15, 00003269(rel)
00005BE7        mov     rcx, rax                        ; 5BE7 _ 48: 89. C1
00005BEA        mov     r8d, 16                         ; 5BEA _ 41: B8, 00000010
00005BF0        mov     r9, qword ptr [rbp-0A8H]        ; 5BF0 _ 4C: 8B. 8D, FFFFFF58
00005BF7        call    qword ptr [rax+8H]              ; 5BF7 _ FF. 50, 08
00005BFA        test    rax, rax                        ; 5BFA _ 48: 85. C0
00005BFD        jns     ?_524                           ; 5BFD _ 79, 17
00005BFF        mov     rcx, qword ptr [rbp-0D8H]       ; 5BFF _ 48: 8B. 8D, FFFFFF28
00005C06        mov     rsi, rax                        ; 5C06 _ 48: 89. C6
00005C09        call    _FreePool                       ; 5C09 _ E8, FFFFBB49
00005C0E        mov     rdi, rsi                        ; 5C0E _ 48: 89. F7
00005C11        jmp     ?_537                           ; 5C11 _ E9, 00000290

?_524:
00005C16        mov     rdi, qword ptr [rbp-40H]        ; 5C16 _ 48: 8B. 7D, C0
00005C1A        mov     rdx, qword ptr [rbp-0C0H]       ; 5C1A _ 48: 8B. 95, FFFFFF40
00005C21        add     rdx, 24                         ; 5C21 _ 48: 83. C2, 18
00005C25        lea     rcx, ptr [rbp-68H]              ; 5C25 _ 48: 8D. 4D, 98
00005C29        mov     r8d, 16                         ; 5C29 _ 41: B8, 00000010
00005C2F        mov     rsi, rax                        ; 5C2F _ 48: 89. C6
00005C32        call    _CopyMem                        ; 5C32 _ E8, FFFFA80D
00005C37        mov     r9, rdi                         ; 5C37 _ 49: 89. F9
00005C3A        mov     rax, rsi                        ; 5C3A _ 48: 89. F0
00005C3D        mov     rcx, qword ptr [rbp-0E0H]       ; 5C3D _ 48: 8B. 8D, FFFFFF20
00005C44        mov     qword ptr [rbp-88H], rcx        ; 5C44 _ 48: 89. 8D, FFFFFF78
00005C4B        mov     qword ptr [rbp-0B8H], 0         ; 5C4B _ 48: C7. 85, FFFFFF48, 00000000
00005C56        mov     rdx, qword ptr [rbp+30H]        ; 5C56 _ 48: 8B. 55, 30
00005C5A        mov     r8, qword ptr [rbp-0B0H]        ; 5C5A _ 4C: 8B. 85, FFFFFF50
00005C61        jmp     ?_535                           ; 5C61 _ E9, 00000207

?_525:
00005C66        mov     edi, dword ptr [r8+4H]          ; 5C66 _ 41: 8B. 78, 04
00005C6A        mov     qword ptr [rbp-0C0H], rdi       ; 5C6A _ 48: 89. BD, FFFFFF40
00005C71        test    rdi, rdi                        ; 5C71 _ 48: 85. FF
00005C74        je      ?_538                           ; 5C74 _ 0F 84, 00000243
00005C7A        mov     r15, rdi                        ; 5C7A _ 49: 89. FF
00005C7D        not     r15                             ; 5C7D _ 49: F7. D7
00005C80        mov     r10, r9                         ; 5C80 _ 4D: 89. CA
00005C83        neg     r10                             ; 5C83 _ 49: F7. DA
00005C86        dec     r9                              ; 5C86 _ 49: FF. C9
00005C89        xor     r11d, r11d                      ; 5C89 _ 45: 31. DB
00005C8C        jmp     ?_529                           ; 5C8C _ EB, 45

?_526:
00005C8E        mov     ebx, dword ptr [r8]             ; 5C8E _ 41: 8B. 18
00005C91        test    ebx, ebx                        ; 5C91 _ 85. DB
00005C93        jnz     ?_525                           ; 5C93 _ 75, D1
00005C95        jmp     ?_538                           ; 5C95 _ E9, 00000223

?_527:
00005C9A        lea     rdx, ptr [rbx+r10]              ; 5C9A _ 4A: 8D. 14 13
00005C9E        lea     rcx, ptr [rdx+rcx+1H]           ; 5C9E _ 48: 8D. 4C 0A, 01
00005CA3        mov     qword ptr [rbp-88H], rcx        ; 5CA3 _ 48: 89. 8D, FFFFFF78
00005CAA        mov     rcx, r9                         ; 5CAA _ 4C: 89. C9
00005CAD        sub     rcx, rbx                        ; 5CAD _ 48: 29. D9
00005CB0        mov     rdx, rcx                        ; 5CB0 _ 48: 89. CA
00005CB3        sub     rdx, rsi                        ; 5CB3 _ 48: 29. F2
00005CB6        add     qword ptr [rbp-98H], rdx        ; 5CB6 _ 48: 01. 95, FFFFFF68
00005CBD        mov     ebx, dword ptr [r8]             ; 5CBD _ 41: 8B. 18
00005CC0        mov     rdx, rcx                        ; 5CC0 _ 48: 89. CA
00005CC3        mov     rdi, qword ptr [rbp-0C0H]       ; 5CC3 _ 48: 8B. BD, FFFFFF40
?_528:
00005CCA        sub     r10, rdi                        ; 5CCA _ 49: 29. FA
00005CCD        add     r9, rdi                         ; 5CCD _ 49: 01. F9
00005CD0        inc     r11                             ; 5CD0 _ 49: FF. C3
?_529:
00005CD3        mov     rcx, qword ptr [rbp-0B8H]       ; 5CD3 _ 48: 8B. 8D, FFFFFF48
00005CDA        lea     r12, ptr [rcx+r11]              ; 5CDA _ 4E: 8D. 24 19
00005CDE        lea     rsi, ptr [r9+1H]                ; 5CDE _ 49: 8D. 71, 01
00005CE2        mov     ecx, ebx                        ; 5CE2 _ 89. D9
00005CE4        cmp     r11, rcx                        ; 5CE4 _ 49: 39. CB
00005CE7        jnc     ?_534                           ; 5CE7 _ 0F 83, 0000016D
00005CED        cmp     rdx, rsi                        ; 5CED _ 48: 39. F2
00005CF0        jc      ?_528                           ; 5CF0 _ 72, D8
00005CF2        lea     rcx, ptr [rdi+r9+1H]            ; 5CF2 _ 4A: 8D. 4C 0F, 01
00005CF7        cmp     rdx, rcx                        ; 5CF7 _ 48: 39. CA
00005CFA        jnc     ?_528                           ; 5CFA _ 73, CE
00005CFC        mov     qword ptr [rbp-0C8H], rsi       ; 5CFC _ 48: 89. B5, FFFFFF38
00005D03        mov     qword ptr [rbp-0A8H], r11       ; 5D03 _ 4C: 89. 9D, FFFFFF58
00005D0A        mov     rdi, r9                         ; 5D0A _ 4C: 89. CF
00005D0D        sub     rdi, rdx                        ; 5D0D _ 48: 29. D7
00005D10        sub     rdi, qword ptr [rbp-88H]        ; 5D10 _ 48: 2B. BD, FFFFFF78
00005D17        cmp     rdi, r15                        ; 5D17 _ 4C: 39. FF
00005D1A        mov     rcx, r15                        ; 5D1A _ 4C: 89. F9
00005D1D        cmova   rcx, rdi                        ; 5D1D _ 48: 0F 47. CF
00005D21        mov     r13, r9                         ; 5D21 _ 4D: 89. CD
00005D24        mov     qword ptr [rbp-90H], r9         ; 5D24 _ 4C: 89. 8D, FFFFFF70
00005D2B        sub     r13, rcx                        ; 5D2B _ 49: 29. CD
00005D2E        sub     r13, rdx                        ; 5D2E _ 49: 29. D5
00005D31        lea     r14, ptr [rdx+r10]              ; 5D31 _ 4E: 8D. 34 12
00005D35        mov     qword ptr [rbp-0A0H], r10       ; 5D35 _ 4C: 89. 95, FFFFFF60
00005D3C        mov     rsi, rdx                        ; 5D3C _ 48: 89. D6
00005D3F        cmp     byte ptr [rbp-0C9H], 0          ; 5D3F _ 80. BD, FFFFFF37, 00
00005D46        jz      ?_531                           ; 5D46 _ 74, 22
00005D48        mov     rcx, qword ptr [rbp-70H]        ; 5D48 _ 48: 8B. 4D, 90
00005D4C        cmp     r12, rcx                        ; 5D4C _ 49: 39. CC
00005D4F        jnz     ?_530                           ; 5D4F _ 75, 14
00005D51        cmp     r14, qword ptr [rbp-78H]        ; 5D51 _ 4C: 3B. 75, 88
00005D55        jne     ?_538                           ; 5D55 _ 0F 85, 00000162
00005D5B        cmp     r13, qword ptr [rbp-80H]        ; 5D5B _ 4C: 3B. 6D, 80
00005D5F        jne     ?_538                           ; 5D5F _ 0F 85, 00000158
?_530:
00005D65        cmp     r12, rcx                        ; 5D65 _ 49: 39. CC
00005D68        jc      ?_533                           ; 5D68 _ 72, 79
?_531:
00005D6A        call    _DebugPrintEnabled              ; 5D6A _ E8, FFFFA4E0
00005D6F        test    al, al                          ; 5D6F _ 84. C0
00005D71        jz      ?_532                           ; 5D71 _ 74, 36
00005D73        mov     ecx, 2147483648                 ; 5D73 _ B9, 80000000
00005D78        call    _DebugPrintLevelEnabled         ; 5D78 _ E8, FFFFA4D5
00005D7D        test    al, al                          ; 5D7D _ 84. C0
00005D7F        jz      ?_532                           ; 5D7F _ 74, 28
00005D81        cmp     rdi, r15                        ; 5D81 _ 4C: 39. FF
00005D84        mov     rax, r15                        ; 5D84 _ 4C: 89. F8
00005D87        cmova   rax, rdi                        ; 5D87 _ 48: 0F 47. C7
00005D8B        mov     r9, qword ptr [rbp-90H]         ; 5D8B _ 4C: 8B. 8D, FFFFFF70
00005D92        sub     r9, rax                         ; 5D92 _ 49: 29. C1
00005D95        mov     ecx, 2147483648                 ; 5D95 _ B9, 80000000
00005D9A        lea     rdx, ptr [?_668]                ; 5D9A _ 48: 8D. 15, 00001B48(rel)
00005DA1        mov     r8, rsi                         ; 5DA1 _ 49: 89. F0
00005DA4        call    _DebugPrint                     ; 5DA4 _ E8, FFFFA497
?_532:
00005DA9        mov     rax, qword ptr [rbp-48H]        ; 5DA9 _ 48: 8B. 45, B8
00005DAD        mov     rcx, qword ptr [rbp-98H]        ; 5DAD _ 48: 8B. 8D, FFFFFF68
00005DB4        mov     qword ptr [rsp+30H], rcx        ; 5DB4 _ 48: 89. 4C 24, 30
00005DB9        mov     rcx, qword ptr [rbp+40H]        ; 5DB9 _ 48: 8B. 4D, 40
00005DBD        mov     qword ptr [rsp+28H], rcx        ; 5DBD _ 48: 89. 4C 24, 28
00005DC2        lea     rcx, ptr [rbp-68H]              ; 5DC2 _ 48: 8D. 4D, 98
00005DC6        mov     qword ptr [rsp+20H], rcx        ; 5DC6 _ 48: 89. 4C 24, 20
00005DCB        mov     rcx, rax                        ; 5DCB _ 48: 89. C1
00005DCE        mov     rdx, r12                        ; 5DCE _ 4C: 89. E2
00005DD1        mov     r8, r14                         ; 5DD1 _ 4D: 89. F0
00005DD4        mov     r9, r13                         ; 5DD4 _ 4D: 89. E9
00005DD7        call    qword ptr [rax+10H]             ; 5DD7 _ FF. 50, 10
00005DDA        test    rax, rax                        ; 5DDA _ 48: 85. C0
00005DDD        js      ?_538                           ; 5DDD _ 0F 88, 000000DA
?_533:
00005DE3        cmp     rdi, r15                        ; 5DE3 _ 4C: 39. FF
00005DE6        mov     rbx, r15                        ; 5DE6 _ 4C: 89. FB
00005DE9        cmova   rbx, rdi                        ; 5DE9 _ 48: 0F 47. DF
00005DED        mov     rdx, qword ptr [rbp-88H]        ; 5DED _ 48: 8B. 95, FFFFFF78
00005DF4        lea     rcx, ptr [rsi+rdx]              ; 5DF4 _ 48: 8D. 0C 16
00005DF8        cmp     r13, rdx                        ; 5DF8 _ 49: 39. D5
00005DFB        mov     r8, qword ptr [rbp-0B0H]        ; 5DFB _ 4C: 8B. 85, FFFFFF50
00005E02        mov     r9, qword ptr [rbp-90H]         ; 5E02 _ 4C: 8B. 8D, FFFFFF70
00005E09        mov     r10, qword ptr [rbp-0A0H]       ; 5E09 _ 4C: 8B. 95, FFFFFF60
00005E10        mov     r11, qword ptr [rbp-0A8H]       ; 5E10 _ 4C: 8B. 9D, FFFFFF58
00005E17        jne     ?_527                           ; 5E17 _ 0F 85, FFFFFE7D
00005E1D        cmp     rdi, r15                        ; 5E1D _ 4C: 39. FF
00005E20        cmova   r15, rdi                        ; 5E20 _ 4C: 0F 47. FF
00005E24        mov     rdx, r9                         ; 5E24 _ 4C: 89. CA
00005E27        sub     rdx, r15                        ; 5E27 _ 4C: 29. FA
00005E2A        add     rcx, r15                        ; 5E2A _ 4C: 01. F9
00005E2D        lea     rcx, ptr [r10+rcx+1H]           ; 5E2D _ 49: 8D. 4C 0A, 01
00005E32        mov     qword ptr [rbp-88H], rcx        ; 5E32 _ 48: 89. 8D, FFFFFF78
00005E39        neg     r15                             ; 5E39 _ 49: F7. DF
00005E3C        sub     r15, rsi                        ; 5E3C _ 49: 29. F7
00005E3F        mov     rcx, qword ptr [rbp-98H]        ; 5E3F _ 48: 8B. 8D, FFFFFF68
00005E46        add     rcx, r15                        ; 5E46 _ 4C: 01. F9
00005E49        add     rcx, r9                         ; 5E49 _ 4C: 01. C9
00005E4C        mov     qword ptr [rbp-98H], rcx        ; 5E4C _ 48: 89. 8D, FFFFFF68
00005E53        mov     rsi, qword ptr [rbp-0C8H]       ; 5E53 _ 48: 8B. B5, FFFFFF38
?_534:
00005E5A        test    rax, rax                        ; 5E5A _ 48: 85. C0
00005E5D        js      ?_538                           ; 5E5D _ 78, 5E
00005E5F        add     r8, 8                           ; 5E5F _ 49: 83. C0, 08
00005E63        mov     r9, rsi                         ; 5E63 _ 49: 89. F1
00005E66        mov     qword ptr [rbp-0B8H], r12       ; 5E66 _ 4C: 89. A5, FFFFFF48
?_535:
00005E6D        mov     qword ptr [rbp-0B0H], r8        ; 5E6D _ 4C: 89. 85, FFFFFF50
00005E74        cmp     qword ptr [rbp-88H], 0          ; 5E74 _ 48: 83. BD, FFFFFF78, 00
00005E7C        jne     ?_526                           ; 5E7C _ 0F 85, FFFFFE0C
00005E82        xor     esi, esi                        ; 5E82 _ 31. F6
?_536:
00005E84        mov     rcx, qword ptr [rbp-0D8H]       ; 5E84 _ 48: 8B. 8D, FFFFFF28
00005E8B        call    _FreePool                       ; 5E8B _ E8, FFFFB8C7
00005E90        mov     rcx, qword ptr [rbp-0E0H]       ; 5E90 _ 48: 8B. 8D, FFFFFF20
00005E97        sub     rcx, rsi                        ; 5E97 _ 48: 29. F1
00005E9A        mov     rax, qword ptr [rbp-0E8H]       ; 5E9A _ 48: 8B. 85, FFFFFF18
00005EA1        mov     qword ptr [rax], rcx            ; 5EA1 _ 48: 89. 08
00005EA4        xor     edi, edi                        ; 5EA4 _ 31. FF
?_537:
00005EA6        mov     rax, rdi                        ; 5EA6 _ 48: 89. F8
00005EA9        add     rsp, 248                        ; 5EA9 _ 48: 81. C4, 000000F8
00005EB0        pop     rbx                             ; 5EB0 _ 5B
00005EB1        pop     rdi                             ; 5EB1 _ 5F
00005EB2        pop     rsi                             ; 5EB2 _ 5E
00005EB3        pop     r12                             ; 5EB3 _ 41: 5C
00005EB5        pop     r13                             ; 5EB5 _ 41: 5D
00005EB7        pop     r14                             ; 5EB7 _ 41: 5E
00005EB9        pop     r15                             ; 5EB9 _ 41: 5F
00005EBB        pop     rbp                             ; 5EBB _ 5D
00005EBC        ret                                     ; 5EBC _ C3
_FaultTolerantUpdateOnPartFv ENDP

?_538   LABEL NEAR
00005EBD        mov     rsi, qword ptr [rbp-88H]        ; 5EBD _ 48: 8B. B5, FFFFFF78
00005EC4        jmp     ?_536                           ; 5EC4 _ EB, BE

_NonFaultTolerantUpdateOnPartFv PROC
00005EC6        push    rbp                             ; 5EC6 _ 55
00005EC7        mov     rbp, rsp                        ; 5EC7 _ 48: 89. E5
00005ECA        push    r15                             ; 5ECA _ 41: 57
00005ECC        push    r14                             ; 5ECC _ 41: 56
00005ECE        push    r13                             ; 5ECE _ 41: 55
00005ED0        push    r12                             ; 5ED0 _ 41: 54
00005ED2        push    rsi                             ; 5ED2 _ 56
00005ED3        push    rdi                             ; 5ED3 _ 57
00005ED4        push    rbx                             ; 5ED4 _ 53
00005ED5        sub     rsp, 120                        ; 5ED5 _ 48: 83. EC, 78
00005ED9        mov     rbx, r9                         ; 5ED9 _ 4C: 89. CB
00005EDC        mov     qword ptr [rbp-78H], r8         ; 5EDC _ 4C: 89. 45, 88
00005EE0        mov     r14, rdx                        ; 5EE0 _ 49: 89. D6
00005EE3        mov     rsi, rcx                        ; 5EE3 _ 48: 89. CE
00005EE6        lea     rdx, ptr [rbp-40H]              ; 5EE6 _ 48: 8D. 55, C0
00005EEA        mov     rax, qword ptr [rbp+30H]        ; 5EEA _ 48: 8B. 45, 30
00005EEE        mov     rcx, rax                        ; 5EEE _ 48: 89. C1
00005EF1        call    qword ptr [rax+10H]             ; 5EF1 _ FF. 50, 10
00005EF4        test    rax, rax                        ; 5EF4 _ 48: 85. C0
00005EF7        js      ?_550                           ; 5EF7 _ 0F 88, 000001BF
00005EFD        mov     rdi, rax                        ; 5EFD _ 48: 89. C7
00005F00        mov     rax, 2H                         ; 5F00 _ 48: B8, 8000000000000002
00005F0A        mov     rdx, qword ptr [rbp-40H]        ; 5F0A _ 48: 8B. 55, C0
00005F0E        cmp     rdx, rbx                        ; 5F0E _ 48: 39. DA
00005F11        ja      ?_550                           ; 5F11 _ 0F 87, 000001A5
00005F17        mov     rcx, qword ptr [rdx+20H]        ; 5F17 _ 48: 8B. 4A, 20
00005F1B        add     rcx, rdx                        ; 5F1B _ 48: 01. D1
00005F1E        mov     rax, 2H                         ; 5F1E _ 48: B8, 8000000000000002
00005F28        cmp     rcx, rbx                        ; 5F28 _ 48: 39. D9
00005F2B        jc      ?_550                           ; 5F2B _ 0F 82, 0000018B
00005F31        movzx   ecx, word ptr [rdx+30H]         ; 5F31 _ 0F B7. 4A, 30
00005F35        call    _AllocateCopyPool               ; 5F35 _ E8, FFFFB80A
00005F3A        mov     rcx, rax                        ; 5F3A _ 48: 89. C1
00005F3D        mov     rax, 9H                         ; 5F3D _ 48: B8, 8000000000000009
00005F47        test    rcx, rcx                        ; 5F47 _ 48: 85. C9
00005F4A        je      ?_550                           ; 5F4A _ 0F 84, 0000016C
00005F50        lea     r8, ptr [rcx+38H]               ; 5F50 _ 4C: 8D. 41, 38
00005F54        mov     qword ptr [rbp-70H], rcx        ; 5F54 _ 48: 89. 4D, 90
00005F58        mov     rdx, r14                        ; 5F58 _ 4C: 89. F2
00005F5B        mov     qword ptr [rbp-80H], r14        ; 5F5B _ 4C: 89. 75, 80
00005F5F        mov     qword ptr [rbp-68H], 0          ; 5F5F _ 48: C7. 45, 98, 00000000
00005F67        mov     rax, rdi                        ; 5F67 _ 48: 89. F8
00005F6A        jmp     ?_547                           ; 5F6A _ E9, 0000010E

?_539:
00005F6F        mov     rdx, rcx                        ; 5F6F _ 48: 89. CA
00005F72        mov     r8, qword ptr [rbp-60H]         ; 5F72 _ 4C: 8B. 45, A0
00005F76        jmp     ?_546                           ; 5F76 _ E9, 000000FA

?_540:
00005F7B        mov     qword ptr [rbp-48H], rsi        ; 5F7B _ 48: 89. 75, B8
00005F7F        mov     r9d, dword ptr [r8]             ; 5F7F _ 45: 8B. 08
00005F82        test    r9d, r9d                        ; 5F82 _ 45: 85. C9
00005F85        je      ?_548                           ; 5F85 _ 0F 84, 00000104
00005F8B        mov     r14d, dword ptr [r8+4H]         ; 5F8B _ 45: 8B. 70, 04
00005F8F        test    r14, r14                        ; 5F8F _ 4D: 85. F6
00005F92        je      ?_548                           ; 5F92 _ 0F 84, 000000F7
00005F98        xor     edi, edi                        ; 5F98 _ 31. FF
00005F9A        jmp     ?_543                           ; 5F9A _ EB, 2E

?_541:
00005F9C        mov     rcx, r13                        ; 5F9C _ 4C: 89. E9
00005F9F        sub     rcx, r12                        ; 5F9F _ 4C: 29. E1
00005FA2        add     rsi, r12                        ; 5FA2 _ 4C: 01. E6
00005FA5        add     rbx, r12                        ; 5FA5 _ 4C: 01. E3
00005FA8        cmp     r13, r12                        ; 5FA8 _ 4D: 39. E5
00005FAB        mov     rdi, qword ptr [rbp-50H]        ; 5FAB _ 48: 8B. 7D, B0
00005FAF        jz      ?_539                           ; 5FAF _ 74, BE
00005FB1        mov     qword ptr [rbp-48H], rsi        ; 5FB1 _ 48: 89. 75, B8
00005FB5        mov     r8, qword ptr [rbp-60H]         ; 5FB5 _ 4C: 8B. 45, A0
00005FB9        mov     r9d, dword ptr [r8]             ; 5FB9 _ 45: 8B. 08
00005FBC        mov     rdx, rcx                        ; 5FBC _ 48: 89. CA
00005FBF        mov     rsi, qword ptr [rbp-58H]        ; 5FBF _ 48: 8B. 75, A8
?_542:
00005FC3        mov     qword ptr [rbp-40H], rsi        ; 5FC3 _ 48: 89. 75, C0
00005FC7        inc     rdi                             ; 5FC7 _ 48: FF. C7
?_543:
00005FCA        mov     rcx, qword ptr [rbp-68H]        ; 5FCA _ 48: 8B. 4D, 98
00005FCE        lea     r15, ptr [rcx+rdi]              ; 5FCE _ 4C: 8D. 3C 39
00005FD2        mov     ecx, r9d                        ; 5FD2 _ 44: 89. C9
00005FD5        cmp     rdi, rcx                        ; 5FD5 _ 48: 39. CF
00005FD8        jnc     ?_545                           ; 5FD8 _ 0F 83, 0000008E
00005FDE        mov     rcx, qword ptr [rbp-40H]        ; 5FDE _ 48: 8B. 4D, C0
00005FE2        lea     rsi, ptr [rcx+r14]              ; 5FE2 _ 4A: 8D. 34 31
00005FE6        cmp     rbx, rcx                        ; 5FE6 _ 48: 39. CB
00005FE9        jc      ?_542                           ; 5FE9 _ 72, D8
00005FEB        cmp     rbx, rsi                        ; 5FEB _ 48: 39. F3
00005FEE        jnc     ?_542                           ; 5FEE _ 73, D3
00005FF0        mov     qword ptr [rbp-58H], rsi        ; 5FF0 _ 48: 89. 75, A8
00005FF4        mov     qword ptr [rbp-50H], rdi        ; 5FF4 _ 48: 89. 7D, B0
00005FF8        mov     rdi, rbx                        ; 5FF8 _ 48: 89. DF
00005FFB        sub     rdi, rcx                        ; 5FFB _ 48: 29. CF
00005FFE        mov     r12, r14                        ; 5FFE _ 4D: 89. F4
00006001        sub     r12, rdi                        ; 6001 _ 49: 29. FC
00006004        lea     rax, ptr [rdi+rdx]              ; 6004 _ 48: 8D. 04 17
00006008        cmp     rax, r14                        ; 6008 _ 4C: 39. F0
0000600B        cmovbe  r12, rdx                        ; 600B _ 4C: 0F 46. E2
0000600F        mov     r13, rdx                        ; 600F _ 49: 89. D5
00006012        call    _DebugPrintEnabled              ; 6012 _ E8, FFFFA238
00006017        test    al, al                          ; 6017 _ 84. C0
00006019        jz      ?_544                           ; 6019 _ 74, 26
0000601B        mov     ecx, 2147483648                 ; 601B _ B9, 80000000
00006020        call    _DebugPrintLevelEnabled         ; 6020 _ E8, FFFFA22D
00006025        test    al, al                          ; 6025 _ 84. C0
00006027        jz      ?_544                           ; 6027 _ 74, 18
00006029        lea     r9, ptr [r12+rbx]               ; 6029 _ 4D: 8D. 0C 1C
0000602D        mov     ecx, 2147483648                 ; 602D _ B9, 80000000
00006032        lea     rdx, ptr [?_668]                ; 6032 _ 48: 8D. 15, 000018B0(rel)
00006039        mov     r8, rbx                         ; 6039 _ 49: 89. D8
0000603C        call    _DebugPrint                     ; 603C _ E8, FFFFA1FF
?_544:
00006041        mov     rsi, qword ptr [rbp-48H]        ; 6041 _ 48: 8B. 75, B8
00006045        mov     qword ptr [rsp+28H], rsi        ; 6045 _ 48: 89. 74 24, 28
0000604A        mov     qword ptr [rsp+20H], r14        ; 604A _ 4C: 89. 74 24, 20
0000604F        mov     rcx, qword ptr [rbp+30H]        ; 604F _ 48: 8B. 4D, 30
00006053        mov     rdx, r15                        ; 6053 _ 4C: 89. FA
00006056        mov     r8, rdi                         ; 6056 _ 49: 89. F8
00006059        mov     r9, r12                         ; 6059 _ 4D: 89. E1
0000605C        call    _UpdateBufferInOneBlock         ; 605C _ E8, FFFFF079
00006061        test    rax, rax                        ; 6061 _ 48: 85. C0
00006064        jns     ?_541                           ; 6064 _ 0F 89, FFFFFF32
0000606A        jmp     ?_549                           ; 606A _ EB, 41

?_545:
0000606C        test    rax, rax                        ; 606C _ 48: 85. C0
0000606F        mov     rsi, qword ptr [rbp-48H]        ; 606F _ 48: 8B. 75, B8
00006073        js      ?_548                           ; 6073 _ 78, 1A
?_546:
00006075        add     r8, 8                           ; 6075 _ 49: 83. C0, 08
00006079        mov     qword ptr [rbp-68H], r15        ; 6079 _ 4C: 89. 7D, 98
?_547:
0000607D        mov     qword ptr [rbp-60H], r8         ; 607D _ 4C: 89. 45, A0
00006081        test    rdx, rdx                        ; 6081 _ 48: 85. D2
00006084        jne     ?_540                           ; 6084 _ 0F 85, FFFFFEF1
0000608A        xor     eax, eax                        ; 608A _ 31. C0
0000608C        mov     rdx, rax                        ; 608C _ 48: 89. C2
?_548:
0000608F        mov     rcx, qword ptr [rbp-70H]        ; 608F _ 48: 8B. 4D, 90
00006093        mov     rsi, rdx                        ; 6093 _ 48: 89. D6
00006096        call    _FreePool                       ; 6096 _ E8, FFFFB6BC
0000609B        mov     rcx, qword ptr [rbp-80H]        ; 609B _ 48: 8B. 4D, 80
0000609F        sub     rcx, rsi                        ; 609F _ 48: 29. F1
000060A2        mov     rax, qword ptr [rbp-78H]        ; 60A2 _ 48: 8B. 45, 88
000060A6        mov     qword ptr [rax], rcx            ; 60A6 _ 48: 89. 08
000060A9        xor     eax, eax                        ; 60A9 _ 31. C0
000060AB        jmp     ?_550                           ; 60AB _ EB, 0F

?_549:
000060AD        mov     rcx, qword ptr [rbp-70H]        ; 60AD _ 48: 8B. 4D, 90
000060B1        mov     rsi, rax                        ; 60B1 _ 48: 89. C6
000060B4        call    _FreePool                       ; 60B4 _ E8, FFFFB69E
000060B9        mov     rax, rsi                        ; 60B9 _ 48: 89. F0
?_550:
000060BC        add     rsp, 120                        ; 60BC _ 48: 83. C4, 78
000060C0        pop     rbx                             ; 60C0 _ 5B
000060C1        pop     rdi                             ; 60C1 _ 5F
000060C2        pop     rsi                             ; 60C2 _ 5E
000060C3        pop     r12                             ; 60C3 _ 41: 5C
000060C5        pop     r13                             ; 60C5 _ 41: 5D
000060C7        pop     r14                             ; 60C7 _ 41: 5E
000060C9        pop     r15                             ; 60C9 _ 41: 5F
000060CB        pop     rbp                             ; 60CB _ 5D
000060CC        ret                                     ; 60CC _ C3
_NonFaultTolerantUpdateOnPartFv ENDP

_ProcessLibraryConstructorList PROC
000060CD        push    rbp                             ; 60CD _ 55
000060CE        mov     rbp, rsp                        ; 60CE _ 48: 89. E5
000060D1        push    rsi                             ; 60D1 _ 56
000060D2        push    rdi                             ; 60D2 _ 57
000060D3        push    rbx                             ; 60D3 _ 53
000060D4        sub     rsp, 40                         ; 60D4 _ 48: 83. EC, 28
000060D8        mov     rsi, rdx                        ; 60D8 _ 48: 89. D6
000060DB        mov     rdi, rcx                        ; 60DB _ 48: 89. CF
000060DE        call    _UefiBootServicesTableLibConstructor; 60DE _ E8, FFFFB285
000060E3        mov     rbx, rax                        ; 60E3 _ 48: 89. C3
000060E6        call    _DebugAssertEnabled             ; 60E6 _ E8, FFFFA161
000060EB        test    al, al                          ; 60EB _ 84. C0
000060ED        jz      ?_552                           ; 60ED _ 74, 48
000060EF        test    rbx, rbx                        ; 60EF _ 48: 85. DB
000060F2        jns     ?_552                           ; 60F2 _ 79, 43
000060F4        call    _DebugPrintEnabled              ; 60F4 _ E8, FFFFA156
000060F9        test    al, al                          ; 60F9 _ 84. C0
000060FB        jz      ?_551                           ; 60FB _ 74, 22
000060FD        mov     ecx, 2147483648                 ; 60FD _ B9, 80000000
00006102        call    _DebugPrintLevelEnabled         ; 6102 _ E8, FFFFA14B
00006107        test    al, al                          ; 6107 _ 84. C0
00006109        jz      ?_551                           ; 6109 _ 74, 14
0000610B        lea     rdx, ptr [?_561]                ; 610B _ 48: 8D. 15, 000001BB(rel)
00006112        mov     ecx, 2147483648                 ; 6112 _ B9, 80000000
00006117        mov     r8, rbx                         ; 6117 _ 49: 89. D8
0000611A        call    _DebugPrint                     ; 611A _ E8, FFFFA121
?_551:
0000611F        lea     rcx, ptr [?_669]                ; 611F _ 48: 8D. 0D, 000017EA(rel)
00006126        lea     r8, ptr [?_562]                 ; 6126 _ 4C: 8D. 05, 000001C1(rel)
0000612D        mov     edx, 222                        ; 612D _ BA, 000000DE
00006132        call    _DebugAssert                    ; 6132 _ E8, FFFFA114
?_552:
00006137        mov     rcx, rdi                        ; 6137 _ 48: 89. F9
0000613A        mov     rdx, rsi                        ; 613A _ 48: 89. F2
0000613D        call    _UefiRuntimeServicesTableLibConstructor; 613D _ E8, FFFFCAFE
00006142        mov     rbx, rax                        ; 6142 _ 48: 89. C3
00006145        call    _DebugAssertEnabled             ; 6145 _ E8, FFFFA102
0000614A        test    al, al                          ; 614A _ 84. C0
0000614C        jz      ?_554                           ; 614C _ 74, 48
0000614E        test    rbx, rbx                        ; 614E _ 48: 85. DB
00006151        jns     ?_554                           ; 6151 _ 79, 43
00006153        call    _DebugPrintEnabled              ; 6153 _ E8, FFFFA0F7
00006158        test    al, al                          ; 6158 _ 84. C0
0000615A        jz      ?_553                           ; 615A _ 74, 22
0000615C        mov     ecx, 2147483648                 ; 615C _ B9, 80000000
00006161        call    _DebugPrintLevelEnabled         ; 6161 _ E8, FFFFA0EC
00006166        test    al, al                          ; 6166 _ 84. C0
00006168        jz      ?_553                           ; 6168 _ 74, 14
0000616A        lea     rdx, ptr [?_561]                ; 616A _ 48: 8D. 15, 0000015C(rel)
00006171        mov     ecx, 2147483648                 ; 6171 _ B9, 80000000
00006176        mov     r8, rbx                         ; 6176 _ 49: 89. D8
00006179        call    _DebugPrint                     ; 6179 _ E8, FFFFA0C2
?_553:
0000617E        lea     rcx, ptr [?_669]                ; 617E _ 48: 8D. 0D, 0000178B(rel)
00006185        lea     r8, ptr [?_562]                 ; 6185 _ 4C: 8D. 05, 00000162(rel)
0000618C        mov     edx, 225                        ; 618C _ BA, 000000E1
00006191        call    _DebugAssert                    ; 6191 _ E8, FFFFA0B5
?_554:
00006196        mov     rcx, rdi                        ; 6196 _ 48: 89. F9
00006199        mov     rdx, rsi                        ; 6199 _ 48: 89. F2
0000619C        call    _UefiHiiServicesLibConstructor  ; 619C _ E8, FFFFCAE7
000061A1        mov     rbx, rax                        ; 61A1 _ 48: 89. C3
000061A4        call    _DebugAssertEnabled             ; 61A4 _ E8, FFFFA0A3
000061A9        test    al, al                          ; 61A9 _ 84. C0
000061AB        jz      ?_556                           ; 61AB _ 74, 48
000061AD        test    rbx, rbx                        ; 61AD _ 48: 85. DB
000061B0        jns     ?_556                           ; 61B0 _ 79, 43
000061B2        call    _DebugPrintEnabled              ; 61B2 _ E8, FFFFA098
000061B7        test    al, al                          ; 61B7 _ 84. C0
000061B9        jz      ?_555                           ; 61B9 _ 74, 22
000061BB        mov     ecx, 2147483648                 ; 61BB _ B9, 80000000
000061C0        call    _DebugPrintLevelEnabled         ; 61C0 _ E8, FFFFA08D
000061C5        test    al, al                          ; 61C5 _ 84. C0
000061C7        jz      ?_555                           ; 61C7 _ 74, 14
000061C9        lea     rdx, ptr [?_561]                ; 61C9 _ 48: 8D. 15, 000000FD(rel)
000061D0        mov     ecx, 2147483648                 ; 61D0 _ B9, 80000000
000061D5        mov     r8, rbx                         ; 61D5 _ 49: 89. D8
000061D8        call    _DebugPrint                     ; 61D8 _ E8, FFFFA063
?_555:
000061DD        lea     rcx, ptr [?_669]                ; 61DD _ 48: 8D. 0D, 0000172C(rel)
000061E4        lea     r8, ptr [?_562]                 ; 61E4 _ 4C: 8D. 05, 00000103(rel)
000061EB        mov     edx, 228                        ; 61EB _ BA, 000000E4
000061F0        call    _DebugAssert                    ; 61F0 _ E8, FFFFA056
?_556:
000061F5        mov     rcx, rdi                        ; 61F5 _ 48: 89. F9
000061F8        mov     rdx, rsi                        ; 61F8 _ 48: 89. F2
000061FB        call    _UefiLibConstructor             ; 61FB _ E8, FFFFCDCC
00006200        mov     rbx, rax                        ; 6200 _ 48: 89. C3
00006203        call    _DebugAssertEnabled             ; 6203 _ E8, FFFFA044
00006208        test    al, al                          ; 6208 _ 84. C0
0000620A        jz      ?_558                           ; 620A _ 74, 48
0000620C        test    rbx, rbx                        ; 620C _ 48: 85. DB
0000620F        jns     ?_558                           ; 620F _ 79, 43
00006211        call    _DebugPrintEnabled              ; 6211 _ E8, FFFFA039
00006216        test    al, al                          ; 6216 _ 84. C0
00006218        jz      ?_557                           ; 6218 _ 74, 22
0000621A        mov     ecx, 2147483648                 ; 621A _ B9, 80000000
0000621F        call    _DebugPrintLevelEnabled         ; 621F _ E8, FFFFA02E
00006224        test    al, al                          ; 6224 _ 84. C0
00006226        jz      ?_557                           ; 6226 _ 74, 14
00006228        lea     rdx, ptr [?_561]                ; 6228 _ 48: 8D. 15, 0000009E(rel)
0000622F        mov     ecx, 2147483648                 ; 622F _ B9, 80000000
00006234        mov     r8, rbx                         ; 6234 _ 49: 89. D8
00006237        call    _DebugPrint                     ; 6237 _ E8, FFFFA004
?_557:
0000623C        lea     rcx, ptr [?_669]                ; 623C _ 48: 8D. 0D, 000016CD(rel)
00006243        lea     r8, ptr [?_562]                 ; 6243 _ 4C: 8D. 05, 000000A4(rel)
0000624A        mov     edx, 231                        ; 624A _ BA, 000000E7
0000624F        call    _DebugAssert                    ; 624F _ E8, FFFF9FF7
?_558:
00006254        mov     rcx, rdi                        ; 6254 _ 48: 89. F9
00006257        mov     rdx, rsi                        ; 6257 _ 48: 89. F2
0000625A        call    _DxeServicesTableLibConstructor ; 625A _ E8, FFFFD482
0000625F        mov     rsi, rax                        ; 625F _ 48: 89. C6
00006262        call    _DebugAssertEnabled             ; 6262 _ E8, FFFF9FE5
00006267        test    al, al                          ; 6267 _ 84. C0
00006269        jz      ?_560                           ; 6269 _ 74, 50
0000626B        test    rsi, rsi                        ; 626B _ 48: 85. F6
0000626E        jns     ?_560                           ; 626E _ 79, 4B
00006270        call    _DebugPrintEnabled              ; 6270 _ E8, FFFF9FDA
00006275        test    al, al                          ; 6275 _ 84. C0
00006277        jz      ?_559                           ; 6277 _ 74, 22
00006279        mov     ecx, 2147483648                 ; 6279 _ B9, 80000000
0000627E        call    _DebugPrintLevelEnabled         ; 627E _ E8, FFFF9FCF
00006283        test    al, al                          ; 6283 _ 84. C0
00006285        jz      ?_559                           ; 6285 _ 74, 14
00006287        lea     rdx, ptr [?_561]                ; 6287 _ 48: 8D. 15, 0000003F(rel)
0000628E        mov     ecx, 2147483648                 ; 628E _ B9, 80000000
00006293        mov     r8, rsi                         ; 6293 _ 49: 89. F0
00006296        call    _DebugPrint                     ; 6296 _ E8, FFFF9FA5
?_559:
0000629B        lea     rcx, ptr [?_669]                ; 629B _ 48: 8D. 0D, 0000166E(rel)
000062A2        lea     r8, ptr [?_562]                 ; 62A2 _ 4C: 8D. 05, 00000045(rel)
000062A9        mov     edx, 234                        ; 62A9 _ BA, 000000EA
000062AE        add     rsp, 40                         ; 62AE _ 48: 83. C4, 28
000062B2        pop     rbx                             ; 62B2 _ 5B
000062B3        pop     rdi                             ; 62B3 _ 5F
000062B4        pop     rsi                             ; 62B4 _ 5E
000062B5        pop     rbp                             ; 62B5 _ 5D
000062B6        jmp     _DebugAssert                    ; 62B6 _ E9, FFFF9F90
_ProcessLibraryConstructorList ENDP

?_560   LABEL NEAR
000062BB        add     rsp, 40                         ; 62BB _ 48: 83. C4, 28
000062BF        pop     rbx                             ; 62BF _ 5B
000062C0        pop     rdi                             ; 62C0 _ 5F
000062C1        pop     rsi                             ; 62C1 _ 5E
000062C2        pop     rbp                             ; 62C2 _ 5D
000062C3        ret                                     ; 62C3 _ C3

_ProcessLibraryDestructorList PROC
000062C4        ret                                     ; 62C4 _ C3
_ProcessLibraryDestructorList ENDP

_ProcessModuleEntryPointList PROC
000062C5        jmp     _InitializeUpdateDriver         ; 62C5 _ E9, FFFFDD46
_ProcessModuleEntryPointList ENDP

_ProcessModuleUnloadList PROC
000062CA        xor     eax, eax                        ; 62CA _ 31. C0
000062CC        ret                                     ; 62CC _ C3
_ProcessModuleUnloadList ENDP

__TEXT.__text ENDS

__TEXT.__cstring SEGMENT BYTE 'DATA'                    ; section number 2

?_561   label byte
        db 0AH, 41H, 53H, 53H, 45H, 52H, 54H, 5FH       ; 62CD _ .ASSERT_
        db 45H, 46H, 49H, 5FH, 45H, 52H, 52H, 4FH       ; 62D5 _ EFI_ERRO
        db 52H, 20H, 28H, 53H, 74H, 61H, 74H, 75H       ; 62DD _ R (Statu
        db 73H, 20H, 3DH, 20H, 25H, 72H, 29H, 0AH       ; 62E5 _ s = %r).
        db 00H                                          ; 62ED _ .
?_562   label byte
        db 21H, 45H, 46H, 49H, 5FH, 45H, 52H, 52H       ; 62EE _ !EFI_ERR
        db 4FH, 52H, 20H, 28H, 53H, 74H, 61H, 74H       ; 62F6 _ OR (Stat
        db 75H, 73H, 29H, 00H                           ; 62FE _ us).

?_563   label byte
        db 42H, 75H, 66H, 66H, 65H, 72H, 20H, 21H       ; 6302 _ Buffer !
        db 3DH, 20H, 28H, 28H, 76H, 6FH, 69H, 64H       ; 630A _ = ((void
        db 20H, 2AH, 29H, 20H, 30H, 29H, 00H            ; 6312 _  *) 0).
?_564   label byte
        db 28H, 4CH, 65H, 6EH, 67H, 74H, 68H, 20H       ; 6319 _ (Length 
        db 2DH, 20H, 31H, 29H, 20H, 3CH, 3DH, 20H       ; 6321 _ - 1) <= 
        db 28H, 30H, 78H, 46H, 46H, 46H, 46H, 46H       ; 6329 _ (0xFFFFF
        db 46H, 46H, 46H, 46H, 46H, 46H, 46H, 46H       ; 6331 _ FFFFFFFF
        db 46H, 46H, 46H, 55H, 4CH, 4CH, 20H, 2DH       ; 6339 _ FFFULL -
        db 20H, 28H, 55H, 49H, 4EH, 54H, 4EH, 29H       ; 6341 _  (UINTN)
        db 42H, 75H, 66H, 66H, 65H, 72H, 29H, 00H       ; 6349 _ Buffer).

?_565   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 6351 _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 6359 _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 6361 _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 6369 _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 6371 _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 6379 _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 50H, 6BH       ; 6381 _ er/MdePk
        db 67H, 2FH, 4CH, 69H, 62H, 72H, 61H, 72H       ; 6389 _ g/Librar
        db 79H, 2FH, 42H, 61H, 73H, 65H, 4DH, 65H       ; 6391 _ y/BaseMe
        db 6DH, 6FH, 72H, 79H, 4CH, 69H, 62H, 2FH       ; 6399 _ moryLib/
        db 5AH, 65H, 72H, 6FH, 4DH, 65H, 6DH, 57H       ; 63A1 _ ZeroMemW
        db 72H, 61H, 70H, 70H, 65H, 72H, 2EH, 63H       ; 63A9 _ rapper.c
        db 00H                                          ; 63B1 _ .
?_566   label byte
        db 21H, 28H, 42H, 75H, 66H, 66H, 65H, 72H       ; 63B2 _ !(Buffer
        db 20H, 3DH, 3DH, 20H, 28H, 28H, 76H, 6FH       ; 63BA _  == ((vo
        db 69H, 64H, 20H, 2AH, 29H, 20H, 30H, 29H       ; 63C2 _ id *) 0)
        db 20H, 26H, 26H, 20H, 4CH, 65H, 6EH, 67H       ; 63CA _  && Leng
        db 74H, 68H, 20H, 3EH, 20H, 30H, 29H, 00H       ; 63D2 _ th > 0).

?_567   label byte
        db 4CH, 65H, 6EH, 67H, 74H, 68H, 20H, 3CH       ; 63DA _ Length <
        db 3DH, 20H, 28H, 30H, 78H, 46H, 46H, 46H       ; 63E2 _ = (0xFFF
        db 46H, 46H, 46H, 46H, 46H, 46H, 46H, 46H       ; 63EA _ FFFFFFFF
        db 46H, 46H, 46H, 46H, 46H, 55H, 4CH, 4CH       ; 63F2 _ FFFFFULL
        db 20H, 2DH, 20H, 28H, 55H, 49H, 4EH, 54H       ; 63FA _  - (UINT
        db 4EH, 29H, 42H, 75H, 66H, 66H, 65H, 72H       ; 6402 _ N)Buffer
        db 20H, 2BH, 20H, 31H, 29H, 00H                 ; 640A _  + 1).

?_568   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 6410 _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 6418 _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 6420 _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 6428 _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 6430 _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 6438 _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 50H, 6BH       ; 6440 _ er/MdePk
        db 67H, 2FH, 4CH, 69H, 62H, 72H, 61H, 72H       ; 6448 _ g/Librar
        db 79H, 2FH, 42H, 61H, 73H, 65H, 4DH, 65H       ; 6450 _ y/BaseMe
        db 6DH, 6FH, 72H, 79H, 4CH, 69H, 62H, 2FH       ; 6458 _ moryLib/
        db 43H, 6FH, 6DH, 70H, 61H, 72H, 65H, 4DH       ; 6460 _ CompareM
        db 65H, 6DH, 57H, 72H, 61H, 70H, 70H, 65H       ; 6468 _ emWrappe
        db 72H, 2EH, 63H, 00H                           ; 6470 _ r.c.

?_569   label byte
        db 44H, 65H, 73H, 74H, 69H, 6EH, 61H, 74H       ; 6474 _ Destinat
        db 69H, 6FH, 6EH, 42H, 75H, 66H, 66H, 65H       ; 647C _ ionBuffe
        db 72H, 20H, 21H, 3DH, 20H, 28H, 28H, 76H       ; 6484 _ r != ((v
        db 6FH, 69H, 64H, 20H, 2AH, 29H, 20H, 30H       ; 648C _ oid *) 0
        db 29H, 00H                                     ; 6494 _ ).

?_570   label byte
        db 53H, 6FH, 75H, 72H, 63H, 65H, 42H, 75H       ; 6496 _ SourceBu
        db 66H, 66H, 65H, 72H, 20H, 21H, 3DH, 20H       ; 649E _ ffer != 
        db 28H, 28H, 76H, 6FH, 69H, 64H, 20H, 2AH       ; 64A6 _ ((void *
        db 29H, 20H, 30H, 29H, 00H                      ; 64AE _ ) 0).
?_571   label byte
        db 28H, 4CH, 65H, 6EH, 67H, 74H, 68H, 20H       ; 64B3 _ (Length 
        db 2DH, 20H, 31H, 29H, 20H, 3CH, 3DH, 20H       ; 64BB _ - 1) <= 
        db 28H, 30H, 78H, 46H, 46H, 46H, 46H, 46H       ; 64C3 _ (0xFFFFF
        db 46H, 46H, 46H, 46H, 46H, 46H, 46H, 46H       ; 64CB _ FFFFFFFF
        db 46H, 46H, 46H, 55H, 4CH, 4CH, 20H, 2DH       ; 64D3 _ FFFULL -
        db 20H, 28H, 55H, 49H, 4EH, 54H, 4EH, 29H       ; 64DB _  (UINTN)
        db 44H, 65H, 73H, 74H, 69H, 6EH, 61H, 74H       ; 64E3 _ Destinat
        db 69H, 6FH, 6EH, 42H, 75H, 66H, 66H, 65H       ; 64EB _ ionBuffe
        db 72H, 29H, 00H                                ; 64F3 _ r).
?_572   label byte
        db 28H, 4CH, 65H, 6EH, 67H, 74H, 68H, 20H       ; 64F6 _ (Length 
        db 2DH, 20H, 31H, 29H, 20H, 3CH, 3DH, 20H       ; 64FE _ - 1) <= 
        db 28H, 30H, 78H, 46H, 46H, 46H, 46H, 46H       ; 6506 _ (0xFFFFF
        db 46H, 46H, 46H, 46H, 46H, 46H, 46H, 46H       ; 650E _ FFFFFFFF
        db 46H, 46H, 46H, 55H, 4CH, 4CH, 20H, 2DH       ; 6516 _ FFFULL -
        db 20H, 28H, 55H, 49H, 4EH, 54H, 4EH, 29H       ; 651E _  (UINTN)
        db 53H, 6FH, 75H, 72H, 63H, 65H, 42H, 75H       ; 6526 _ SourceBu
        db 66H, 66H, 65H, 72H, 29H, 00H                 ; 652E _ ffer).

?_573   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 6534 _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 653C _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 6544 _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 654C _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 6554 _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 655C _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 50H, 6BH       ; 6564 _ er/MdePk
        db 67H, 2FH, 4CH, 69H, 62H, 72H, 61H, 72H       ; 656C _ g/Librar
        db 79H, 2FH, 42H, 61H, 73H, 65H, 4DH, 65H       ; 6574 _ y/BaseMe
        db 6DH, 6FH, 72H, 79H, 4CH, 69H, 62H, 2FH       ; 657C _ moryLib/
        db 53H, 65H, 74H, 4DH, 65H, 6DH, 57H, 72H       ; 6584 _ SetMemWr
        db 61H, 70H, 70H, 65H, 72H, 2EH, 63H, 00H       ; 658C _ apper.c.

?_574   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 6594 _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 659C _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 65A4 _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 65AC _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 65B4 _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 65BC _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 50H, 6BH       ; 65C4 _ er/MdePk
        db 67H, 2FH, 4CH, 69H, 62H, 72H, 61H, 72H       ; 65CC _ g/Librar
        db 79H, 2FH, 42H, 61H, 73H, 65H, 4DH, 65H       ; 65D4 _ y/BaseMe
        db 6DH, 6FH, 72H, 79H, 4CH, 69H, 62H, 2FH       ; 65DC _ moryLib/
        db 43H, 6FH, 70H, 79H, 4DH, 65H, 6DH, 57H       ; 65E4 _ CopyMemW
        db 72H, 61H, 70H, 70H, 65H, 72H, 2EH, 63H       ; 65EC _ rapper.c
        db 00H                                          ; 65F4 _ .
?_575   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 65F5 _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 65FD _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 6605 _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 660D _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 6615 _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 661D _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 50H, 6BH       ; 6625 _ er/MdePk
        db 67H, 2FH, 4CH, 69H, 62H, 72H, 61H, 72H       ; 662D _ g/Librar
        db 79H, 2FH, 42H, 61H, 73H, 65H, 4CH, 69H       ; 6635 _ y/BaseLi
        db 62H, 2FH, 53H, 65H, 74H, 4AH, 75H, 6DH       ; 663D _ b/SetJum
        db 70H, 2EH, 63H, 00H                           ; 6645 _ p.c.

?_576   label byte
        db 4AH, 75H, 6DH, 70H, 42H, 75H, 66H, 66H       ; 6649 _ JumpBuff
        db 65H, 72H, 20H, 21H, 3DH, 20H, 28H, 28H       ; 6651 _ er != ((
        db 76H, 6FH, 69H, 64H, 20H, 2AH, 29H, 20H       ; 6659 _ void *) 
        db 30H, 29H, 00H                                ; 6661 _ 0).
?_577   label byte
        db 28H, 28H, 55H, 49H, 4EH, 54H, 4EH, 29H       ; 6664 _ ((UINTN)
        db 4AH, 75H, 6DH, 70H, 42H, 75H, 66H, 66H       ; 666C _ JumpBuff
        db 65H, 72H, 20H, 26H, 20H, 28H, 38H, 20H       ; 6674 _ er & (8 
        db 2DH, 20H, 31H, 29H, 29H, 20H, 3DH, 3DH       ; 667C _ - 1)) ==
        db 20H, 30H, 00H                                ; 6684 _  0.
?_578   label byte
        db 44H, 69H, 76H, 69H, 73H, 6FH, 72H, 20H       ; 6687 _ Divisor 
        db 21H, 3DH, 20H, 30H, 00H                      ; 668F _ != 0.
?_579   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 6694 _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 669C _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 66A4 _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 66AC _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 66B4 _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 66BC _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 50H, 6BH       ; 66C4 _ er/MdePk
        db 67H, 2FH, 4CH, 69H, 62H, 72H, 61H, 72H       ; 66CC _ g/Librar
        db 79H, 2FH, 42H, 61H, 73H, 65H, 4CH, 69H       ; 66D4 _ y/BaseLi
        db 62H, 2FH, 44H, 69H, 76H, 55H, 36H, 34H       ; 66DC _ b/DivU64
        db 78H, 33H, 32H, 52H, 65H, 6DH, 61H, 69H       ; 66E4 _ x32Remai
        db 6EH, 64H, 65H, 72H, 2EH, 63H, 00H            ; 66EC _ nder.c.
?_580   label byte
        db 4EH, 6FH, 64H, 65H, 20H, 21H, 3DH, 20H       ; 66F3 _ Node != 
        db 28H, 28H, 76H, 6FH, 69H, 64H, 20H, 2AH       ; 66FB _ ((void *
        db 29H, 20H, 30H, 29H, 00H                      ; 6703 _ ) 0).
?_581   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 6708 _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 6710 _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 6718 _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 6720 _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 6728 _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 6730 _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 50H, 6BH       ; 6738 _ er/MdePk
        db 67H, 2FH, 4CH, 69H, 62H, 72H, 61H, 72H       ; 6740 _ g/Librar
        db 79H, 2FH, 42H, 61H, 73H, 65H, 4CH, 69H       ; 6748 _ y/BaseLi
        db 62H, 2FH, 53H, 61H, 66H, 65H, 53H, 74H       ; 6750 _ b/SafeSt
        db 72H, 69H, 6EH, 67H, 2EH, 63H, 00H            ; 6758 _ ring.c.
?_582   label byte
        db 28H, 28H, 55H, 49H, 4EH, 54H, 4EH, 29H       ; 675F _ ((UINTN)
        db 20H, 53H, 74H, 72H, 69H, 6EH, 67H, 20H       ; 6767 _  String 
        db 26H, 20H, 30H, 78H, 30H, 30H, 30H, 30H       ; 676F _ & 0x0000
        db 30H, 30H, 30H, 31H, 29H, 20H, 3DH, 3DH       ; 6777 _ 0001) ==
        db 20H, 30H, 00H                                ; 677F _  0.
?_583   label byte
        db 28H, 44H, 65H, 73H, 74H, 69H, 6EH, 61H       ; 6782 _ (Destina
        db 74H, 69H, 6FH, 6EH, 20H, 21H, 3DH, 20H       ; 678A _ tion != 
        db 28H, 28H, 76H, 6FH, 69H, 64H, 20H, 2AH       ; 6792 _ ((void *
        db 29H, 20H, 30H, 29H, 29H, 00H                 ; 679A _ ) 0)).

?_584   label byte
        db 28H, 53H, 6FH, 75H, 72H, 63H, 65H, 20H       ; 67A0 _ (Source 
        db 21H, 3DH, 20H, 28H, 28H, 76H, 6FH, 69H       ; 67A8 _ != ((voi
        db 64H, 20H, 2AH, 29H, 20H, 30H, 29H, 29H       ; 67B0 _ d *) 0))
        db 00H                                          ; 67B8 _ .
?_585   label byte
        db 28H, 44H, 65H, 73H, 74H, 4DH, 61H, 78H       ; 67B9 _ (DestMax
        db 20H, 21H, 3DH, 20H, 30H, 29H, 00H            ; 67C1 _  != 0).
?_586   label byte
        db 28H, 44H, 65H, 73H, 74H, 4DH, 61H, 78H       ; 67C8 _ (DestMax
        db 20H, 3EH, 20H, 53H, 6FH, 75H, 72H, 63H       ; 67D0 _  > Sourc
        db 65H, 4CH, 65H, 6EH, 29H, 00H                 ; 67D8 _ eLen).

?_587   label byte
        db 28H, 44H, 65H, 73H, 74H, 4DH, 61H, 78H       ; 67DE _ (DestMax
        db 20H, 3CH, 3DH, 20H, 28H, 5FH, 67H, 50H       ; 67E6 _  <= (_gP
        db 63H, 64H, 5FH, 46H, 69H, 78H, 65H, 64H       ; 67EE _ cd_Fixed
        db 41H, 74H, 42H, 75H, 69H, 6CH, 64H, 5FH       ; 67F6 _ AtBuild_
        db 50H, 63H, 64H, 4DH, 61H, 78H, 69H, 6DH       ; 67FE _ PcdMaxim
        db 75H, 6DH, 41H, 73H, 63H, 69H, 69H, 53H       ; 6806 _ umAsciiS
        db 74H, 72H, 69H, 6EH, 67H, 4CH, 65H, 6EH       ; 680E _ tringLen
        db 67H, 74H, 68H, 29H, 29H, 00H                 ; 6816 _ gth)).

?_588   label byte
        db 49H, 6EH, 74H, 65H, 72H, 6EH, 61H, 6CH       ; 681C _ Internal
        db 53H, 61H, 66H, 65H, 53H, 74H, 72H, 69H       ; 6824 _ SafeStri
        db 6EH, 67H, 4EH, 6FH, 41H, 73H, 63H, 69H       ; 682C _ ngNoAsci
        db 69H, 53H, 74H, 72H, 4FH, 76H, 65H, 72H       ; 6834 _ iStrOver
        db 6CH, 61H, 70H, 20H, 28H, 44H, 65H, 73H       ; 683C _ lap (Des
        db 74H, 69H, 6EH, 61H, 74H, 69H, 6FH, 6EH       ; 6844 _ tination
        db 2CH, 20H, 44H, 65H, 73H, 74H, 4DH, 61H       ; 684C _ , DestMa
        db 78H, 2CH, 20H, 28H, 43H, 48H, 41H, 52H       ; 6854 _ x, (CHAR
        db 38H, 20H, 2AH, 29H, 53H, 6FH, 75H, 72H       ; 685C _ 8 *)Sour
        db 63H, 65H, 2CH, 20H, 53H, 6FH, 75H, 72H       ; 6864 _ ce, Sour
        db 63H, 65H, 4CH, 65H, 6EH, 20H, 2BH, 20H       ; 686C _ ceLen + 
        db 31H, 29H, 00H                                ; 6874 _ 1).
?_589   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 6877 _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 687F _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 6887 _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 688F _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 6897 _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 689F _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 50H, 6BH       ; 68A7 _ er/MdePk
        db 67H, 2FH, 4CH, 69H, 62H, 72H, 61H, 72H       ; 68AF _ g/Librar
        db 79H, 2FH, 42H, 61H, 73H, 65H, 4CH, 69H       ; 68B7 _ y/BaseLi
        db 62H, 2FH, 53H, 74H, 72H, 69H, 6EH, 67H       ; 68BF _ b/String
        db 2EH, 63H, 00H                                ; 68C7 _ .c.
?_590   label byte
        db 53H, 74H, 72H, 69H, 6EH, 67H, 20H, 21H       ; 68CA _ String !
        db 3DH, 20H, 28H, 28H, 76H, 6FH, 69H, 64H       ; 68D2 _ = ((void
        db 20H, 2AH, 29H, 20H, 30H, 29H, 00H            ; 68DA _  *) 0).
?_591   label byte
        db 4CH, 65H, 6EH, 67H, 74H, 68H, 20H, 3CH       ; 68E1 _ Length <
        db 20H, 5FH, 67H, 50H, 63H, 64H, 5FH, 46H       ; 68E9 _  _gPcd_F
        db 69H, 78H, 65H, 64H, 41H, 74H, 42H, 75H       ; 68F1 _ ixedAtBu
        db 69H, 6CH, 64H, 5FH, 50H, 63H, 64H, 4DH       ; 68F9 _ ild_PcdM
        db 61H, 78H, 69H, 6DH, 75H, 6DH, 55H, 6EH       ; 6901 _ aximumUn
        db 69H, 63H, 6FH, 64H, 65H, 53H, 74H, 72H       ; 6909 _ icodeStr
        db 69H, 6EH, 67H, 4CH, 65H, 6EH, 67H, 74H       ; 6911 _ ingLengt
        db 68H, 00H                                     ; 6919 _ h.

?_592   label byte
        db 52H, 65H, 73H, 75H, 6CH, 74H, 20H, 3CH       ; 691B _ Result <
        db 3DH, 20H, 28H, 28H, 28H, 28H, 55H, 49H       ; 6923 _ = ((((UI
        db 4EH, 54H, 4EH, 29H, 20H, 7EH, 30H, 29H       ; 692B _ NTN) ~0)
        db 20H, 2DH, 20H, 49H, 6EH, 74H, 65H, 72H       ; 6933 _  - Inter
        db 6EH, 61H, 6CH, 48H, 65H, 78H, 43H, 68H       ; 693B _ nalHexCh
        db 61H, 72H, 54H, 6FH, 55H, 69H, 6EH, 74H       ; 6943 _ arToUint
        db 6EH, 20H, 28H, 2AH, 53H, 74H, 72H, 69H       ; 694B _ n (*Stri
        db 6EH, 67H, 29H, 29H, 20H, 3EH, 3EH, 20H       ; 6953 _ ng)) >> 
        db 34H, 29H, 00H                                ; 695B _ 4).
?_593   label byte
        db 4CH, 65H, 6EH, 67H, 74H, 68H, 20H, 3CH       ; 695E _ Length <
        db 3DH, 20H, 5FH, 67H, 50H, 63H, 64H, 5FH       ; 6966 _ = _gPcd_
        db 46H, 69H, 78H, 65H, 64H, 41H, 74H, 42H       ; 696E _ FixedAtB
        db 75H, 69H, 6CH, 64H, 5FH, 50H, 63H, 64H       ; 6976 _ uild_Pcd
        db 4DH, 61H, 78H, 69H, 6DH, 75H, 6DH, 41H       ; 697E _ MaximumA
        db 73H, 63H, 69H, 69H, 53H, 74H, 72H, 69H       ; 6986 _ sciiStri
        db 6EH, 67H, 4CH, 65H, 6EH, 67H, 74H, 68H       ; 698E _ ngLength
        db 00H                                          ; 6996 _ .
?_594   label byte
        db 4CH, 65H, 6EH, 67H, 74H, 68H, 20H, 3CH       ; 6997 _ Length <
        db 20H, 5FH, 67H, 50H, 63H, 64H, 5FH, 46H       ; 699F _  _gPcd_F
        db 69H, 78H, 65H, 64H, 41H, 74H, 42H, 75H       ; 69A7 _ ixedAtBu
        db 69H, 6CH, 64H, 5FH, 50H, 63H, 64H, 4DH       ; 69AF _ ild_PcdM
        db 61H, 78H, 69H, 6DH, 75H, 6DH, 41H, 73H       ; 69B7 _ aximumAs
        db 63H, 69H, 69H, 53H, 74H, 72H, 69H, 6EH       ; 69BF _ ciiStrin
        db 67H, 4CH, 65H, 6EH, 67H, 74H, 68H, 00H       ; 69C7 _ gLength.

?_595   label byte
        db 41H, 73H, 63H, 69H, 69H, 53H, 74H, 72H       ; 69CF _ AsciiStr
        db 53H, 69H, 7AH, 65H, 20H, 28H, 46H, 69H       ; 69D7 _ Size (Fi
        db 72H, 73H, 74H, 53H, 74H, 72H, 69H, 6EH       ; 69DF _ rstStrin
        db 67H, 29H, 00H                                ; 69E7 _ g).
?_596   label byte
        db 41H, 73H, 63H, 69H, 69H, 53H, 74H, 72H       ; 69EA _ AsciiStr
        db 53H, 69H, 7AH, 65H, 20H, 28H, 53H, 65H       ; 69F2 _ Size (Se
        db 63H, 6FH, 6EH, 64H, 53H, 74H, 72H, 69H       ; 69FA _ condStri
        db 6EH, 67H, 29H, 00H                           ; 6A02 _ ng).

?_597   label byte
        db 41H, 73H, 63H, 69H, 69H, 53H, 74H, 72H       ; 6A06 _ AsciiStr
        db 53H, 69H, 7AH, 65H, 20H, 28H, 53H, 74H       ; 6A0E _ Size (St
        db 72H, 69H, 6EH, 67H, 29H, 20H, 21H, 3DH       ; 6A16 _ ring) !=
        db 20H, 30H, 00H                                ; 6A1E _  0.
?_598   label byte
        db 2AH, 28H, 53H, 74H, 72H, 69H, 6EH, 67H       ; 6A21 _ *(String
        db 20H, 2DH, 20H, 31H, 29H, 20H, 3DH, 3DH       ; 6A29 _  - 1) ==
        db 20H, 27H, 30H, 27H, 00H                      ; 6A31 _  '0'.
?_599   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 6A36 _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 6A3E _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 6A46 _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 6A4E _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 6A56 _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 6A5E _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 50H, 6BH       ; 6A66 _ er/MdePk
        db 67H, 2FH, 4CH, 69H, 62H, 72H, 61H, 72H       ; 6A6E _ g/Librar
        db 79H, 2FH, 42H, 61H, 73H, 65H, 4CH, 69H       ; 6A76 _ y/BaseLi
        db 62H, 2FH, 55H, 6EH, 61H, 6CH, 69H, 67H       ; 6A7E _ b/Unalig
        db 6EH, 65H, 64H, 2EH, 63H, 00H                 ; 6A86 _ ned.c.

?_600   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 6A8C _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 6A94 _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 6A9C _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 6AA4 _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 6AAC _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 6AB4 _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 50H, 6BH       ; 6ABC _ er/MdePk
        db 67H, 2FH, 4CH, 69H, 62H, 72H, 61H, 72H       ; 6AC4 _ g/Librar
        db 79H, 2FH, 55H, 65H, 66H, 69H, 42H, 6FH       ; 6ACC _ y/UefiBo
        db 6FH, 74H, 53H, 65H, 72H, 76H, 69H, 63H       ; 6AD4 _ otServic
        db 65H, 73H, 54H, 61H, 62H, 6CH, 65H, 4CH       ; 6ADC _ esTableL
        db 69H, 62H, 2FH, 55H, 65H, 66H, 69H, 42H       ; 6AE4 _ ib/UefiB
        db 6FH, 6FH, 74H, 53H, 65H, 72H, 76H, 69H       ; 6AEC _ ootServi
        db 63H, 65H, 73H, 54H, 61H, 62H, 6CH, 65H       ; 6AF4 _ cesTable
        db 4CH, 69H, 62H, 2EH, 63H, 00H                 ; 6AFC _ Lib.c.

?_601   label byte
        db 67H, 49H, 6DH, 61H, 67H, 65H, 48H, 61H       ; 6B02 _ gImageHa
        db 6EH, 64H, 6CH, 65H, 20H, 21H, 3DH, 20H       ; 6B0A _ ndle != 
        db 28H, 28H, 76H, 6FH, 69H, 64H, 20H, 2AH       ; 6B12 _ ((void *
        db 29H, 20H, 30H, 29H, 00H                      ; 6B1A _ ) 0).
?_602   label byte
        db 67H, 53H, 54H, 20H, 21H, 3DH, 20H, 28H       ; 6B1F _ gST != (
        db 28H, 76H, 6FH, 69H, 64H, 20H, 2AH, 29H       ; 6B27 _ (void *)
        db 20H, 30H, 29H, 00H                           ; 6B2F _  0).

?_603   label byte
        db 67H, 42H, 53H, 20H, 21H, 3DH, 20H, 28H       ; 6B33 _ gBS != (
        db 28H, 76H, 6FH, 69H, 64H, 20H, 2AH, 29H       ; 6B3B _ (void *)
        db 20H, 30H, 29H, 00H                           ; 6B43 _  0).

?_604   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 6B47 _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 6B4F _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 6B57 _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 6B5F _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 6B67 _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 6B6F _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 50H, 6BH       ; 6B77 _ er/MdePk
        db 67H, 2FH, 4CH, 69H, 62H, 72H, 61H, 72H       ; 6B7F _ g/Librar
        db 79H, 2FH, 55H, 65H, 66H, 69H, 4DH, 65H       ; 6B87 _ y/UefiMe
        db 6DH, 6FH, 72H, 79H, 41H, 6CH, 6CH, 6FH       ; 6B8F _ moryAllo
        db 63H, 61H, 74H, 69H, 6FH, 6EH, 4CH, 69H       ; 6B97 _ cationLi
        db 62H, 2FH, 4DH, 65H, 6DH, 6FH, 72H, 79H       ; 6B9F _ b/Memory
        db 41H, 6CH, 6CH, 6FH, 63H, 61H, 74H, 69H       ; 6BA7 _ Allocati
        db 6FH, 6EH, 4CH, 69H, 62H, 2EH, 63H, 00H       ; 6BAF _ onLib.c.

?_605   label byte
        db 28H, 41H, 6CH, 69H, 67H, 6EH, 6DH, 65H       ; 6BB7 _ (Alignme
        db 6EH, 74H, 20H, 26H, 20H, 28H, 41H, 6CH       ; 6BBF _ nt & (Al
        db 69H, 67H, 6EH, 6DH, 65H, 6EH, 74H, 20H       ; 6BC7 _ ignment 
        db 2DH, 20H, 31H, 29H, 29H, 20H, 3DH, 3DH       ; 6BCF _ - 1)) ==
        db 20H, 30H, 00H                                ; 6BD7 _  0.
?_606   label byte
        db 52H, 65H, 61H, 6CH, 50H, 61H, 67H, 65H       ; 6BDA _ RealPage
        db 73H, 20H, 3EH, 20H, 50H, 61H, 67H, 65H       ; 6BE2 _ s > Page
        db 73H, 00H                                     ; 6BEA _ s.

?_607   label byte
        db 41H, 6CH, 6CH, 6FH, 63H, 61H, 74H, 69H       ; 6BEC _ Allocati
        db 6FH, 6EH, 53H, 69H, 7AH, 65H, 20H, 3CH       ; 6BF4 _ onSize <
        db 3DH, 20H, 28H, 30H, 78H, 46H, 46H, 46H       ; 6BFC _ = (0xFFF
        db 46H, 46H, 46H, 46H, 46H, 46H, 46H, 46H       ; 6C04 _ FFFFFFFF
        db 46H, 46H, 46H, 46H, 46H, 55H, 4CH, 4CH       ; 6C0C _ FFFFFULL
        db 20H, 2DH, 20H, 28H, 55H, 49H, 4EH, 54H       ; 6C14 _  - (UINT
        db 4EH, 29H, 20H, 42H, 75H, 66H, 66H, 65H       ; 6C1C _ N) Buffe
        db 72H, 20H, 2BH, 20H, 31H, 29H, 00H, 53H       ; 6C24 _ r + 1).S
        db 75H, 63H, 63H, 65H, 73H, 73H, 00H, 57H       ; 6C2C _ uccess.W
        db 61H, 72H, 6EH, 69H, 6EH, 67H, 20H, 55H       ; 6C34 _ arning U
        db 6EH, 6BH, 6EH, 6FH, 77H, 6EH, 20H, 47H       ; 6C3C _ nknown G
        db 6CH, 79H, 70H, 68H, 00H, 57H, 61H, 72H       ; 6C44 _ lyph.War
        db 6EH, 69H, 6EH, 67H, 20H, 44H, 65H, 6CH       ; 6C4C _ ning Del
        db 65H, 74H, 65H, 20H, 46H, 61H, 69H, 6CH       ; 6C54 _ ete Fail
        db 75H, 72H, 65H, 00H, 57H, 61H, 72H, 6EH       ; 6C5C _ ure.Warn
        db 69H, 6EH, 67H, 20H, 57H, 72H, 69H, 74H       ; 6C64 _ ing Writ
        db 65H, 20H, 46H, 61H, 69H, 6CH, 75H, 72H       ; 6C6C _ e Failur
        db 65H, 00H, 57H, 61H, 72H, 6EH, 69H, 6EH       ; 6C74 _ e.Warnin
        db 67H, 20H, 42H, 75H, 66H, 66H, 65H, 72H       ; 6C7C _ g Buffer
        db 20H, 54H, 6FH, 6FH, 20H, 53H, 6DH, 61H       ; 6C84 _  Too Sma
        db 6CH, 6CH, 00H, 57H, 61H, 72H, 6EH, 69H       ; 6C8C _ ll.Warni
        db 6EH, 67H, 20H, 53H, 74H, 61H, 6CH, 65H       ; 6C94 _ ng Stale
        db 20H, 44H, 61H, 74H, 61H, 00H, 4CH, 6FH       ; 6C9C _  Data.Lo
        db 61H, 64H, 20H, 45H, 72H, 72H, 6FH, 72H       ; 6CA4 _ ad Error
        db 00H, 49H, 6EH, 76H, 61H, 6CH, 69H, 64H       ; 6CAC _ .Invalid
        db 20H, 50H, 61H, 72H, 61H, 6DH, 65H, 74H       ; 6CB4 _  Paramet
        db 65H, 72H, 00H, 55H, 6EH, 73H, 75H, 70H       ; 6CBC _ er.Unsup
        db 70H, 6FH, 72H, 74H, 65H, 64H, 00H, 42H       ; 6CC4 _ ported.B
        db 61H, 64H, 20H, 42H, 75H, 66H, 66H, 65H       ; 6CCC _ ad Buffe
        db 72H, 20H, 53H, 69H, 7AH, 65H, 00H, 42H       ; 6CD4 _ r Size.B
        db 75H, 66H, 66H, 65H, 72H, 20H, 54H, 6FH       ; 6CDC _ uffer To
        db 6FH, 20H, 53H, 6DH, 61H, 6CH, 6CH, 00H       ; 6CE4 _ o Small.
        db 4EH, 6FH, 74H, 20H, 52H, 65H, 61H, 64H       ; 6CEC _ Not Read
        db 79H, 00H, 44H, 65H, 76H, 69H, 63H, 65H       ; 6CF4 _ y.Device
        db 20H, 45H, 72H, 72H, 6FH, 72H, 00H, 57H       ; 6CFC _  Error.W
        db 72H, 69H, 74H, 65H, 20H, 50H, 72H, 6FH       ; 6D04 _ rite Pro
        db 74H, 65H, 63H, 74H, 65H, 64H, 00H, 4FH       ; 6D0C _ tected.O
        db 75H, 74H, 20H, 6FH, 66H, 20H, 52H, 65H       ; 6D14 _ ut of Re
        db 73H, 6FH, 75H, 72H, 63H, 65H, 73H, 00H       ; 6D1C _ sources.
        db 56H, 6FH, 6CH, 75H, 6DH, 65H, 20H, 43H       ; 6D24 _ Volume C
        db 6FH, 72H, 72H, 75H, 70H, 74H, 00H, 56H       ; 6D2C _ orrupt.V
        db 6FH, 6CH, 75H, 6DH, 65H, 20H, 46H, 75H       ; 6D34 _ olume Fu
        db 6CH, 6CH, 00H, 4EH, 6FH, 20H, 4DH, 65H       ; 6D3C _ ll.No Me
        db 64H, 69H, 61H, 00H, 4DH, 65H, 64H, 69H       ; 6D44 _ dia.Medi
        db 61H, 20H, 63H, 68H, 61H, 6EH, 67H, 65H       ; 6D4C _ a change
        db 64H, 00H, 4EH, 6FH, 74H, 20H, 46H, 6FH       ; 6D54 _ d.Not Fo
        db 75H, 6EH, 64H, 00H, 41H, 63H, 63H, 65H       ; 6D5C _ und.Acce
        db 73H, 73H, 20H, 44H, 65H, 6EH, 69H, 65H       ; 6D64 _ ss Denie
        db 64H, 00H, 4EH, 6FH, 20H, 52H, 65H, 73H       ; 6D6C _ d.No Res
        db 70H, 6FH, 6EH, 73H, 65H, 00H, 4EH, 6FH       ; 6D74 _ ponse.No
        db 20H, 6DH, 61H, 70H, 70H, 69H, 6EH, 67H       ; 6D7C _  mapping
        db 00H, 54H, 69H, 6DH, 65H, 20H, 6FH, 75H       ; 6D84 _ .Time ou
        db 74H, 00H, 4EH, 6FH, 74H, 20H, 73H, 74H       ; 6D8C _ t.Not st
        db 61H, 72H, 74H, 65H, 64H, 00H, 41H, 6CH       ; 6D94 _ arted.Al
        db 72H, 65H, 61H, 64H, 79H, 20H, 73H, 74H       ; 6D9C _ ready st
        db 61H, 72H, 74H, 65H, 64H, 00H, 41H, 62H       ; 6DA4 _ arted.Ab
        db 6FH, 72H, 74H, 65H, 64H, 00H, 49H, 43H       ; 6DAC _ orted.IC
        db 4DH, 50H, 20H, 45H, 72H, 72H, 6FH, 72H       ; 6DB4 _ MP Error
        db 00H, 54H, 46H, 54H, 50H, 20H, 45H, 72H       ; 6DBC _ .TFTP Er
        db 72H, 6FH, 72H, 00H, 50H, 72H, 6FH, 74H       ; 6DC4 _ ror.Prot
        db 6FH, 63H, 6FH, 6CH, 20H, 45H, 72H, 72H       ; 6DCC _ ocol Err
        db 6FH, 72H, 00H, 49H, 6EH, 63H, 6FH, 6DH       ; 6DD4 _ or.Incom
        db 70H, 61H, 74H, 69H, 62H, 6CH, 65H, 20H       ; 6DDC _ patible 
        db 56H, 65H, 72H, 73H, 69H, 6FH, 6EH, 00H       ; 6DE4 _ Version.
        db 53H, 65H, 63H, 75H, 72H, 69H, 74H, 79H       ; 6DEC _ Security
        db 20H, 56H, 69H, 6FH, 6CH, 61H, 74H, 69H       ; 6DF4 _  Violati
        db 6FH, 6EH, 00H, 43H, 52H, 43H, 20H, 45H       ; 6DFC _ on.CRC E
        db 72H, 72H, 6FH, 72H, 00H, 45H, 6EH, 64H       ; 6E04 _ rror.End
        db 20H, 6FH, 66H, 20H, 4DH, 65H, 64H, 69H       ; 6E0C _  of Medi
        db 61H, 00H, 52H, 65H, 73H, 65H, 72H, 76H       ; 6E14 _ a.Reserv
        db 65H, 64H, 20H, 28H, 32H, 39H, 29H, 00H       ; 6E1C _ ed (29).
        db 52H, 65H, 73H, 65H, 72H, 76H, 65H, 64H       ; 6E24 _ Reserved
        db 20H, 28H, 33H, 30H, 29H, 00H, 45H, 6EH       ; 6E2C _  (30).En
        db 64H, 20H, 6FH, 66H, 20H, 46H, 69H, 6CH       ; 6E34 _ d of Fil
        db 65H, 00H, 49H, 6EH, 76H, 61H, 6CH, 69H       ; 6E3C _ e.Invali
        db 64H, 20H, 4CH, 61H, 6EH, 67H, 75H, 61H       ; 6E44 _ d Langua
        db 67H, 65H, 00H, 43H, 6FH, 6DH, 70H, 72H       ; 6E4C _ ge.Compr
        db 6FH, 6DH, 69H, 73H, 65H, 64H, 20H, 44H       ; 6E54 _ omised D
        db 61H, 74H, 61H, 00H                           ; 6E5C _ ata.

?_608   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 6E60 _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 6E68 _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 6E70 _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 6E78 _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 6E80 _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 6E88 _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 50H, 6BH       ; 6E90 _ er/MdePk
        db 67H, 2FH, 4CH, 69H, 62H, 72H, 61H, 72H       ; 6E98 _ g/Librar
        db 79H, 2FH, 42H, 61H, 73H, 65H, 50H, 72H       ; 6EA0 _ y/BasePr
        db 69H, 6EH, 74H, 4CH, 69H, 62H, 2FH, 50H       ; 6EA8 _ intLib/P
        db 72H, 69H, 6EH, 74H, 4CH, 69H, 62H, 49H       ; 6EB0 _ rintLibI
        db 6EH, 74H, 65H, 72H, 6EH, 61H, 6CH, 2EH       ; 6EB8 _ nternal.
        db 63H, 00H                                     ; 6EC0 _ c.

?_609   label byte
        db 53H, 74H, 72H, 53H, 69H, 7AH, 65H, 20H       ; 6EC2 _ StrSize 
        db 28H, 28H, 43H, 48H, 41H, 52H, 31H, 36H       ; 6ECA _ ((CHAR16
        db 20H, 2AH, 29H, 20H, 46H, 6FH, 72H, 6DH       ; 6ED2 _  *) Form
        db 61H, 74H, 29H, 20H, 21H, 3DH, 20H, 30H       ; 6EDA _ at) != 0
        db 00H                                          ; 6EE2 _ .
?_610   label byte
        db 41H, 73H, 63H, 69H, 69H, 53H, 74H, 72H       ; 6EE3 _ AsciiStr
        db 53H, 69H, 7AH, 65H, 20H, 28H, 46H, 6FH       ; 6EEB _ Size (Fo
        db 72H, 6DH, 61H, 74H, 29H, 20H, 21H, 3DH       ; 6EF3 _ rmat) !=
        db 20H, 30H, 00H                                ; 6EFB _  0.
?_611   label byte
        db 3CH, 6EH, 75H, 6CH, 6CH, 20H, 73H, 74H       ; 6EFE _ <null st
        db 72H, 69H, 6EH, 67H, 3EH, 00H                 ; 6F06 _ ring>.

?_612   label byte
        db 3CH, 6EH, 75H, 6CH, 6CH, 20H, 67H, 75H       ; 6F0C _ <null gu
        db 69H, 64H, 3EH, 00H                           ; 6F14 _ id>.

?_613   label byte
        db 25H, 30H, 38H, 78H, 2DH, 25H, 30H, 34H       ; 6F18 _ %08x-%04
        db 78H, 2DH, 25H, 30H, 34H, 78H, 2DH, 25H       ; 6F20 _ x-%04x-%
        db 30H, 32H, 78H, 25H, 30H, 32H, 78H, 2DH       ; 6F28 _ 02x%02x-
        db 25H, 30H, 32H, 78H, 25H, 30H, 32H, 78H       ; 6F30 _ %02x%02x
        db 25H, 30H, 32H, 78H, 25H, 30H, 32H, 78H       ; 6F38 _ %02x%02x
        db 25H, 30H, 32H, 78H, 25H, 30H, 32H, 78H       ; 6F40 _ %02x%02x
        db 00H                                          ; 6F48 _ .
?_614   label byte
        db 3CH, 6EH, 75H, 6CH, 6CH, 20H, 74H, 69H       ; 6F49 _ <null ti
        db 6DH, 65H, 3EH, 00H                           ; 6F51 _ me>.

?_615   label byte
        db 25H, 30H, 32H, 64H, 2FH, 25H, 30H, 32H       ; 6F55 _ %02d/%02
        db 64H, 2FH, 25H, 30H, 34H, 64H, 20H, 20H       ; 6F5D _ d/%04d  
        db 25H, 30H, 32H, 64H, 3AH, 25H, 30H, 32H       ; 6F65 _ %02d:%02
        db 64H, 00H                                     ; 6F6D _ d.

?_616   label byte
        db 25H, 30H, 38H, 58H, 00H                      ; 6F6F _ %08X.
?_617   label byte
        db 0DH, 0AH, 00H                                ; 6F74 _ ...
?_618   label byte
        db 0DH, 00H                                     ; 6F77 _ ..

?_619   label byte
        db 28H, 28H, 28H, 46H, 6CH, 61H, 67H, 73H       ; 6F79 _ (((Flags
        db 20H, 26H, 20H, 30H, 78H, 30H, 30H, 30H       ; 6F81 _  & 0x000
        db 30H, 30H, 30H, 34H, 30H, 29H, 20H, 3DH       ; 6F89 _ 00040) =
        db 3DH, 20H, 30H, 29H, 29H, 20H, 7CH, 7CH       ; 6F91 _ = 0)) ||
        db 20H, 28H, 53H, 74H, 72H, 53H, 69H, 7AH       ; 6F99 _  (StrSiz
        db 65H, 20H, 28H, 28H, 43H, 48H, 41H, 52H       ; 6FA1 _ e ((CHAR
        db 31H, 36H, 20H, 2AH, 29H, 20H, 4FH, 72H       ; 6FA9 _ 16 *) Or
        db 69H, 67H, 69H, 6EH, 61H, 6CH, 42H, 75H       ; 6FB1 _ iginalBu
        db 66H, 66H, 65H, 72H, 29H, 20H, 21H, 3DH       ; 6FB9 _ ffer) !=
        db 20H, 30H, 29H, 00H                           ; 6FC1 _  0).

?_620   label byte
        db 28H, 28H, 28H, 46H, 6CH, 61H, 67H, 73H       ; 6FC5 _ (((Flags
        db 20H, 26H, 20H, 30H, 78H, 30H, 30H, 30H       ; 6FCD _  & 0x000
        db 30H, 30H, 30H, 34H, 30H, 29H, 20H, 21H       ; 6FD5 _ 00040) !
        db 3DH, 20H, 30H, 29H, 29H, 20H, 7CH, 7CH       ; 6FDD _ = 0)) ||
        db 20H, 28H, 41H, 73H, 63H, 69H, 69H, 53H       ; 6FE5 _  (AsciiS
        db 74H, 72H, 53H, 69H, 7AH, 65H, 20H, 28H       ; 6FED _ trSize (
        db 4FH, 72H, 69H, 67H, 69H, 6EH, 61H, 6CH       ; 6FF5 _ Original
        db 42H, 75H, 66H, 66H, 65H, 72H, 29H, 20H       ; 6FFD _ Buffer) 
        db 21H, 3DH, 20H, 30H, 29H, 00H                 ; 7005 _ != 0).

?_621   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 700B _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 7013 _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 701B _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 7023 _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 702B _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 7033 _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 50H, 6BH       ; 703B _ er/MdePk
        db 67H, 2FH, 4CH, 69H, 62H, 72H, 61H, 72H       ; 7043 _ g/Librar
        db 79H, 2FH, 42H, 61H, 73H, 65H, 50H, 72H       ; 704B _ y/BasePr
        db 69H, 6EH, 74H, 4CH, 69H, 62H, 2FH, 50H       ; 7053 _ intLib/P
        db 72H, 69H, 6EH, 74H, 4CH, 69H, 62H, 2EH       ; 705B _ rintLib.
        db 63H, 00H                                     ; 7063 _ c.

?_622   label byte
        db 28H, 28H, 28H, 55H, 49H, 4EH, 54H, 4EH       ; 7065 _ (((UINTN
        db 29H, 20H, 28H, 53H, 74H, 61H, 72H, 74H       ; 706D _ ) (Start
        db 4FH, 66H, 42H, 75H, 66H, 66H, 65H, 72H       ; 7075 _ OfBuffer
        db 29H, 29H, 20H, 26H, 20H, 30H, 78H, 30H       ; 707D _ )) & 0x0
        db 31H, 29H, 20H, 3DH, 3DH, 20H, 30H, 00H       ; 7085 _ 1) == 0.

?_623   label byte
        db 28H, 28H, 28H, 55H, 49H, 4EH, 54H, 4EH       ; 708D _ (((UINTN
        db 29H, 20H, 28H, 46H, 6FH, 72H, 6DH, 61H       ; 7095 _ ) (Forma
        db 74H, 53H, 74H, 72H, 69H, 6EH, 67H, 29H       ; 709D _ tString)
        db 29H, 20H, 26H, 20H, 30H, 78H, 30H, 31H       ; 70A5 _ ) & 0x01
        db 29H, 20H, 3DH, 3DH, 20H, 30H, 00H            ; 70AD _ ) == 0.
?_624   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 70B4 _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 70BC _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 70C4 _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 70CC _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 70D4 _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 70DC _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 50H, 6BH       ; 70E4 _ er/MdePk
        db 67H, 2FH, 4CH, 69H, 62H, 72H, 61H, 72H       ; 70EC _ g/Librar
        db 79H, 2FH, 55H, 65H, 66H, 69H, 44H, 65H       ; 70F4 _ y/UefiDe
        db 76H, 69H, 63H, 65H, 50H, 61H, 74H, 68H       ; 70FC _ vicePath
        db 4CH, 69H, 62H, 2FH, 44H, 65H, 76H, 69H       ; 7104 _ Lib/Devi
        db 63H, 65H, 50H, 61H, 74H, 68H, 55H, 74H       ; 710C _ cePathUt
        db 69H, 6CH, 69H, 74H, 69H, 65H, 73H, 2EH       ; 7114 _ ilities.
        db 63H, 00H                                     ; 711C _ c.

?_625   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 711E _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 7126 _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 712E _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 7136 _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 713E _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 7146 _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 50H, 6BH       ; 714E _ er/MdePk
        db 67H, 2FH, 4CH, 69H, 62H, 72H, 61H, 72H       ; 7156 _ g/Librar
        db 79H, 2FH, 55H, 65H, 66H, 69H, 52H, 75H       ; 715E _ y/UefiRu
        db 6EH, 74H, 69H, 6DH, 65H, 53H, 65H, 72H       ; 7166 _ ntimeSer
        db 76H, 69H, 63H, 65H, 73H, 54H, 61H, 62H       ; 716E _ vicesTab
        db 6CH, 65H, 4CH, 69H, 62H, 2FH, 55H, 65H       ; 7176 _ leLib/Ue
        db 66H, 69H, 52H, 75H, 6EH, 74H, 69H, 6DH       ; 717E _ fiRuntim
        db 65H, 53H, 65H, 72H, 76H, 69H, 63H, 65H       ; 7186 _ eService
        db 73H, 54H, 61H, 62H, 6CH, 65H, 4CH, 69H       ; 718E _ sTableLi
        db 62H, 2EH, 63H, 00H                           ; 7196 _ b.c.

?_626   label byte
        db 67H, 52H, 54H, 20H, 21H, 3DH, 20H, 28H       ; 719A _ gRT != (
        db 28H, 76H, 6FH, 69H, 64H, 20H, 2AH, 29H       ; 71A2 _ (void *)
        db 20H, 30H, 29H, 00H                           ; 71AA _  0).

?_627   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 71AE _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 71B6 _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 71BE _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 71C6 _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 71CE _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 71D6 _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 4DH, 6FH       ; 71DE _ er/MdeMo
        db 64H, 75H, 6CH, 65H, 50H, 6BH, 67H, 2FH       ; 71E6 _ dulePkg/
        db 4CH, 69H, 62H, 72H, 61H, 72H, 79H, 2FH       ; 71EE _ Library/
        db 55H, 65H, 66H, 69H, 48H, 69H, 69H, 53H       ; 71F6 _ UefiHiiS
        db 65H, 72H, 76H, 69H, 63H, 65H, 73H, 4CH       ; 71FE _ ervicesL
        db 69H, 62H, 2FH, 55H, 65H, 66H, 69H, 48H       ; 7206 _ ib/UefiH
        db 69H, 69H, 53H, 65H, 72H, 76H, 69H, 63H       ; 720E _ iiServic
        db 65H, 73H, 4CH, 69H, 62H, 2EH, 63H, 00H       ; 7216 _ esLib.c.

?_628   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 721E _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 7226 _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 722E _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 7236 _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 723E _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 7246 _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 50H, 6BH       ; 724E _ er/MdePk
        db 67H, 2FH, 4CH, 69H, 62H, 72H, 61H, 72H       ; 7256 _ g/Librar
        db 79H, 2FH, 55H, 65H, 66H, 69H, 4CH, 69H       ; 725E _ y/UefiLi
        db 62H, 2FH, 55H, 65H, 66H, 69H, 4CH, 69H       ; 7266 _ b/UefiLi
        db 62H, 50H, 72H, 69H, 6EH, 74H, 2EH, 63H       ; 726E _ bPrint.c
        db 00H                                          ; 7276 _ .
?_629   label byte
        db 46H, 6FH, 72H, 6DH, 61H, 74H, 20H, 21H       ; 7277 _ Format !
        db 3DH, 20H, 28H, 28H, 76H, 6FH, 69H, 64H       ; 727F _ = ((void
        db 20H, 2AH, 29H, 20H, 30H, 29H, 00H            ; 7287 _  *) 0).
?_630   label byte
        db 28H, 28H, 55H, 49H, 4EH, 54H, 4EH, 29H       ; 728E _ ((UINTN)
        db 20H, 46H, 6FH, 72H, 6DH, 61H, 74H, 20H       ; 7296 _  Format 
        db 26H, 20H, 30H, 78H, 30H, 30H, 30H, 30H       ; 729E _ & 0x0000
        db 30H, 30H, 30H, 31H, 29H, 20H, 3DH, 3DH       ; 72A6 _ 0001) ==
        db 20H, 30H, 00H                                ; 72AE _  0.
?_631   label byte
        db 43H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 20H       ; 72B1 _ Console 
        db 21H, 3DH, 20H, 28H, 28H, 76H, 6FH, 69H       ; 72B9 _ != ((voi
        db 64H, 20H, 2AH, 29H, 20H, 30H, 29H, 00H       ; 72C1 _ d *) 0).

?_632   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 72C9 _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 72D1 _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 72D9 _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 72E1 _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 72E9 _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 72F1 _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 50H, 6BH       ; 72F9 _ er/MdePk
        db 67H, 2FH, 4CH, 69H, 62H, 72H, 61H, 72H       ; 7301 _ g/Librar
        db 79H, 2FH, 55H, 65H, 66H, 69H, 4CH, 69H       ; 7309 _ y/UefiLi
        db 62H, 2FH, 55H, 65H, 66H, 69H, 4EH, 6FH       ; 7311 _ b/UefiNo
        db 74H, 54H, 69H, 61H, 6EH, 6FH, 2EH, 63H       ; 7319 _ tTiano.c
        db 00H                                          ; 7321 _ .
?_633   label byte
        db 46H, 76H, 44H, 65H, 76H, 69H, 63H, 65H       ; 7322 _ FvDevice
        db 50H, 61H, 74H, 68H, 4EH, 6FH, 64H, 65H       ; 732A _ PathNode
        db 20H, 21H, 3DH, 20H, 28H, 28H, 76H, 6FH       ; 7332 _  != ((vo
        db 69H, 64H, 20H, 2AH, 29H, 20H, 30H, 29H       ; 733A _ id *) 0)
        db 00H                                          ; 7342 _ .
?_634   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 7343 _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 734B _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 7353 _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 735B _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 7363 _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 736B _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 50H, 6BH       ; 7373 _ er/MdePk
        db 67H, 2FH, 4CH, 69H, 62H, 72H, 61H, 72H       ; 737B _ g/Librar
        db 79H, 2FH, 55H, 65H, 66H, 69H, 4CH, 69H       ; 7383 _ y/UefiLi
        db 62H, 2FH, 55H, 65H, 66H, 69H, 4CH, 69H       ; 738B _ b/UefiLi
        db 62H, 2EH, 63H, 00H                           ; 7393 _ b.c.

?_635   label byte
        db 54H, 61H, 62H, 6CH, 65H, 47H, 75H, 69H       ; 7397 _ TableGui
        db 64H, 20H, 21H, 3DH, 20H, 28H, 28H, 76H       ; 739F _ d != ((v
        db 6FH, 69H, 64H, 20H, 2AH, 29H, 20H, 30H       ; 73A7 _ oid *) 0
        db 29H, 00H                                     ; 73AF _ ).

?_636   label byte
        db 54H, 61H, 62H, 6CH, 65H, 20H, 21H, 3DH       ; 73B1 _ Table !=
        db 20H, 28H, 28H, 76H, 6FH, 69H, 64H, 20H       ; 73B9 _  ((void 
        db 2AH, 29H, 20H, 30H, 29H, 00H                 ; 73C1 _ *) 0).

?_637   label byte
        db 4EH, 61H, 6DH, 65H, 20H, 21H, 3DH, 20H       ; 73C7 _ Name != 
        db 28H, 28H, 76H, 6FH, 69H, 64H, 20H, 2AH       ; 73CF _ ((void *
        db 29H, 20H, 30H, 29H, 20H, 26H, 26H, 20H       ; 73D7 _ ) 0) && 
        db 47H, 75H, 69H, 64H, 20H, 21H, 3DH, 20H       ; 73DF _ Guid != 
        db 28H, 28H, 76H, 6FH, 69H, 64H, 20H, 2AH       ; 73E7 _ ((void *
        db 29H, 20H, 30H, 29H, 20H, 26H, 26H, 20H       ; 73EF _ ) 0) && 
        db 56H, 61H, 6CH, 75H, 65H, 20H, 21H, 3DH       ; 73F7 _ Value !=
        db 20H, 28H, 28H, 76H, 6FH, 69H, 64H, 20H       ; 73FF _  ((void 
        db 2AH, 29H, 20H, 30H, 29H, 00H                 ; 7407 _ *) 0).

?_638   label byte
        db 2AH, 56H, 61H, 6CH, 75H, 65H, 20H, 21H       ; 740D _ *Value !
        db 3DH, 20H, 28H, 28H, 76H, 6FH, 69H, 64H       ; 7415 _ = ((void
        db 20H, 2AH, 29H, 20H, 30H, 29H, 00H            ; 741D _  *) 0).
?_639   label byte
        db 53H, 75H, 70H, 70H, 6FH, 72H, 74H, 65H       ; 7424 _ Supporte
        db 64H, 4CH, 61H, 6EH, 67H, 75H, 61H, 67H       ; 742C _ dLanguag
        db 65H, 73H, 20H, 21H, 3DH, 20H, 28H, 28H       ; 7434 _ es != ((
        db 76H, 6FH, 69H, 64H, 20H, 2AH, 29H, 20H       ; 743C _ void *) 
        db 30H, 29H, 00H                                ; 7444 _ 0).
?_640   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 7447 _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 744F _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 7457 _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 745F _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 7467 _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 746F _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 4DH, 6FH       ; 7477 _ er/MdeMo
        db 64H, 75H, 6CH, 65H, 50H, 6BH, 67H, 2FH       ; 747F _ dulePkg/
        db 4CH, 69H, 62H, 72H, 61H, 72H, 79H, 2FH       ; 7487 _ Library/
        db 55H, 65H, 66H, 69H, 48H, 69H, 69H, 4CH       ; 748F _ UefiHiiL
        db 69H, 62H, 2FH, 48H, 69H, 69H, 4CH, 69H       ; 7497 _ ib/HiiLi
        db 62H, 2EH, 63H, 00H                           ; 749F _ b.c.

?_641   label byte
        db 50H, 61H, 63H, 6BH, 61H, 67H, 65H, 4CH       ; 74A3 _ PackageL
        db 69H, 73H, 74H, 47H, 75H, 69H, 64H, 20H       ; 74AB _ istGuid 
        db 21H, 3DH, 20H, 28H, 28H, 76H, 6FH, 69H       ; 74B3 _ != ((voi
        db 64H, 20H, 2AH, 29H, 20H, 30H, 29H, 00H       ; 74BB _ d *) 0).

?_642   label byte
        db 48H, 69H, 69H, 48H, 61H, 6EH, 64H, 6CH       ; 74C3 _ HiiHandl
        db 65H, 20H, 21H, 3DH, 20H, 28H, 28H, 76H       ; 74CB _ e != ((v
        db 6FH, 69H, 64H, 20H, 2AH, 29H, 20H, 30H       ; 74D3 _ oid *) 0
        db 29H, 00H                                     ; 74DB _ ).

?_643   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 74DD _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 74E5 _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 74ED _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 74F5 _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 74FD _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 7505 _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 4DH, 6FH       ; 750D _ er/MdeMo
        db 64H, 75H, 6CH, 65H, 50H, 6BH, 67H, 2FH       ; 7515 _ dulePkg/
        db 4CH, 69H, 62H, 72H, 61H, 72H, 79H, 2FH       ; 751D _ Library/
        db 55H, 65H, 66H, 69H, 48H, 69H, 69H, 4CH       ; 7525 _ UefiHiiL
        db 69H, 62H, 2FH, 48H, 69H, 69H, 53H, 74H       ; 752D _ ib/HiiSt
        db 72H, 69H, 6EH, 67H, 2EH, 63H, 00H            ; 7535 _ ring.c.
?_644   label byte
        db 53H, 74H, 72H, 69H, 6EH, 67H, 49H, 64H       ; 753C _ StringId
        db 20H, 21H, 3DH, 20H, 30H, 00H                 ; 7544 _  != 0.

?_645   label byte
        db 00H                                          ; 754A _ .
?_646   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 754B _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 7553 _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 755B _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 7563 _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 756B _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 7573 _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 4DH, 6FH       ; 757B _ er/MdeMo
        db 64H, 75H, 6CH, 65H, 50H, 6BH, 67H, 2FH       ; 7583 _ dulePkg/
        db 4CH, 69H, 62H, 72H, 61H, 72H, 79H, 2FH       ; 758B _ Library/
        db 55H, 65H, 66H, 69H, 48H, 69H, 69H, 4CH       ; 7593 _ UefiHiiL
        db 69H, 62H, 2FH, 48H, 69H, 69H, 4CH, 61H       ; 759B _ ib/HiiLa
        db 6EH, 67H, 75H, 61H, 67H, 65H, 2EH, 63H       ; 75A3 _ nguage.c
        db 00H                                          ; 75AB _ .
?_647   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 75AC _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 75B4 _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 75BC _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 75C4 _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 75CC _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 75D4 _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 50H, 6BH       ; 75DC _ er/MdePk
        db 67H, 2FH, 4CH, 69H, 62H, 72H, 61H, 72H       ; 75E4 _ g/Librar
        db 79H, 2FH, 44H, 78H, 65H, 53H, 65H, 72H       ; 75EC _ y/DxeSer
        db 76H, 69H, 63H, 65H, 73H, 54H, 61H, 62H       ; 75F4 _ vicesTab
        db 6CH, 65H, 4CH, 69H, 62H, 2FH, 44H, 78H       ; 75FC _ leLib/Dx
        db 65H, 53H, 65H, 72H, 76H, 69H, 63H, 65H       ; 7604 _ eService
        db 73H, 54H, 61H, 62H, 6CH, 65H, 4CH, 69H       ; 760C _ sTableLi
        db 62H, 2EH, 63H, 00H                           ; 7614 _ b.c.

?_648   label byte
        db 67H, 44H, 53H, 20H, 21H, 3DH, 20H, 28H       ; 7618 _ gDS != (
        db 28H, 76H, 6FH, 69H, 64H, 20H, 2AH, 29H       ; 7620 _ (void *)
        db 20H, 30H, 29H, 00H                           ; 7628 _  0).

?_649   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 762C _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 7634 _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 763C _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 7644 _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 764C _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 7654 _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 50H, 6BH       ; 765C _ er/MdePk
        db 67H, 2FH, 4CH, 69H, 62H, 72H, 61H, 72H       ; 7664 _ g/Librar
        db 79H, 2FH, 55H, 65H, 66H, 69H, 44H, 72H       ; 766C _ y/UefiDr
        db 69H, 76H, 65H, 72H, 45H, 6EH, 74H, 72H       ; 7674 _ iverEntr
        db 79H, 50H, 6FH, 69H, 6EH, 74H, 2FH, 44H       ; 767C _ yPoint/D
        db 72H, 69H, 76H, 65H, 72H, 45H, 6EH, 74H       ; 7684 _ riverEnt
        db 72H, 79H, 50H, 6FH, 69H, 6EH, 74H, 2EH       ; 768C _ ryPoint.
        db 63H, 00H                                     ; 7694 _ c.

?_650   label byte
        db 55H, 70H, 64H, 61H, 74H, 65H, 44H, 72H       ; 7696 _ UpdateDr
        db 69H, 76H, 65H, 72H, 3AH, 20H, 44H, 61H       ; 769E _ iver: Da
        db 74H, 61H, 20H, 66H, 69H, 6CH, 65H, 20H       ; 76A6 _ ta file 
        db 73H, 68H, 6FH, 75H, 6CH, 64H, 20H, 62H       ; 76AE _ should b
        db 65H, 20H, 6FH, 66H, 20H, 54H, 59H, 50H       ; 76B6 _ e of TYP
        db 45H, 20H, 45H, 46H, 49H, 5FH, 46H, 56H       ; 76BE _ E EFI_FV
        db 5FH, 46H, 49H, 4CH, 45H, 54H, 59H, 50H       ; 76C6 _ _FILETYP
        db 45H, 5FH, 46H, 49H, 52H, 4DH, 57H, 41H       ; 76CE _ E_FIRMWA
        db 52H, 45H, 5FH, 56H, 4FH, 4CH, 55H, 4DH       ; 76D6 _ RE_VOLUM
        db 45H, 5FH, 49H, 4DH, 41H, 47H, 45H, 0AH       ; 76DE _ E_IMAGE.
        db 00H                                          ; 76E6 _ .
?_651   label byte
        db 55H, 70H, 64H, 61H, 74H, 65H, 44H, 72H       ; 76E7 _ UpdateDr
        db 69H, 76H, 65H, 72H, 3AH, 20H, 44H, 61H       ; 76EF _ iver: Da
        db 74H, 61H, 20H, 66H, 69H, 6CH, 65H, 20H       ; 76F7 _ ta file 
        db 73H, 68H, 6FH, 75H, 6CH, 64H, 20H, 62H       ; 76FF _ should b
        db 65H, 20H, 73H, 65H, 63H, 74H, 69H, 6FH       ; 7707 _ e sectio
        db 6EH, 65H, 64H, 20H, 77H, 69H, 74H, 68H       ; 770F _ ned with
        db 20H, 54H, 59H, 50H, 45H, 20H, 45H, 46H       ; 7717 _  TYPE EF
        db 49H, 5FH, 53H, 45H, 43H, 54H, 49H, 4FH       ; 771F _ I_SECTIO
        db 4EH, 5FH, 46H, 49H, 52H, 4DH, 57H, 41H       ; 7727 _ N_FIRMWA
        db 52H, 45H, 5FH, 56H, 4FH, 4CH, 55H, 4DH       ; 772F _ RE_VOLUM
        db 45H, 5FH, 49H, 4DH, 41H, 47H, 45H, 0AH       ; 7737 _ E_IMAGE.
        db 00H                                          ; 773F _ .
?_652   label byte
        db 55H, 70H, 64H, 61H, 74H, 65H, 44H, 72H       ; 7740 _ UpdateDr
        db 69H, 76H, 65H, 72H, 3AH, 20H, 44H, 61H       ; 7748 _ iver: Da
        db 74H, 61H, 20H, 66H, 69H, 6CH, 65H, 20H       ; 7750 _ ta file 
        db 73H, 68H, 6FH, 75H, 6CH, 64H, 20H, 6FH       ; 7758 _ should o
        db 66H, 20H, 54H, 59H, 50H, 45H, 20H, 45H       ; 7760 _ f TYPE E
        db 46H, 49H, 5FH, 46H, 56H, 5FH, 46H, 49H       ; 7768 _ FI_FV_FI
        db 4CH, 45H, 54H, 59H, 50H, 45H, 5FH, 52H       ; 7770 _ LETYPE_R
        db 41H, 57H, 0AH, 00H                           ; 7778 _ AW..

?_653   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 777C _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 7784 _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 778C _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 7794 _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 779C _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 77A4 _ dk2-mast
        db 65H, 72H, 2FH, 49H, 6EH, 74H, 65H, 6CH       ; 77AC _ er/Intel
        db 46H, 72H, 61H, 6DH, 65H, 77H, 6FH, 72H       ; 77B4 _ Framewor
        db 6BH, 4DH, 6FH, 64H, 75H, 6CH, 65H, 50H       ; 77BC _ kModuleP
        db 6BH, 67H, 2FH, 55H, 6EH, 69H, 76H, 65H       ; 77C4 _ kg/Unive
        db 72H, 73H, 61H, 6CH, 2FH, 46H, 69H, 72H       ; 77CC _ rsal/Fir
        db 6DH, 77H, 61H, 72H, 65H, 56H, 6FH, 6CH       ; 77D4 _ mwareVol
        db 75H, 6DH, 65H, 2FH, 55H, 70H, 64H, 61H       ; 77DC _ ume/Upda
        db 74H, 65H, 44H, 72H, 69H, 76H, 65H, 72H       ; 77E4 _ teDriver
        db 44H, 78H, 65H, 2FH, 55H, 70H, 64H, 61H       ; 77EC _ Dxe/Upda
        db 74H, 65H, 44H, 69H, 73H, 70H, 61H, 74H       ; 77F4 _ teDispat
        db 63H, 68H, 65H, 72H, 2EH, 63H, 00H            ; 77FC _ cher.c.
?_654   label byte
        db 67H, 48H, 69H, 69H, 48H, 61H, 6EH, 64H       ; 7803 _ gHiiHand
        db 6CH, 65H, 20H, 21H, 3DH, 20H, 28H, 28H       ; 780B _ le != ((
        db 76H, 6FH, 69H, 64H, 20H, 2AH, 29H, 20H       ; 7813 _ void *) 
        db 30H, 29H, 00H                                ; 781B _ 0).
?_655   label byte
        db 43H, 6FH, 6EH, 66H, 69H, 67H, 44H, 61H       ; 781E _ ConfigDa
        db 74H, 61H, 20H, 21H, 3DH, 20H, 28H, 28H       ; 7826 _ ta != ((
        db 76H, 6FH, 69H, 64H, 20H, 2AH, 29H, 20H       ; 782E _ void *) 
        db 30H, 29H, 00H                                ; 7836 _ 0).
?_656   label byte
        db 48H, 65H, 61H, 64H, 00H                      ; 7839 _ Head.
?_657   label byte
        db 4EH, 75H, 6DH, 4FH, 66H, 55H, 70H, 64H       ; 783E _ NumOfUpd
        db 61H, 74H, 65H, 00H                           ; 7846 _ ate.

?_658   label byte
        db 55H, 70H, 64H, 61H, 74H, 65H, 00H            ; 784A _ Update.
?_659   label byte
        db 55H, 70H, 64H, 61H, 74H, 65H, 54H, 79H       ; 7851 _ UpdateTy
        db 70H, 65H, 00H                                ; 7859 _ pe.
?_660   label byte
        db 46H, 76H, 42H, 61H, 73H, 65H, 41H, 64H       ; 785C _ FvBaseAd
        db 64H, 72H, 65H, 73H, 73H, 00H                 ; 7864 _ dress.

?_661   label byte
        db 46H, 69H, 6CH, 65H, 47H, 75H, 69H, 64H       ; 786A _ FileGuid
        db 00H                                          ; 7872 _ .
?_662   label byte
        db 46H, 61H, 75H, 6CH, 74H, 54H, 6FH, 6CH       ; 7873 _ FaultTol
        db 65H, 72H, 61H, 6EH, 74H, 00H                 ; 787B _ erant.

?_663   label byte
        db 54H, 52H, 55H, 45H, 00H                      ; 7881 _ TRUE.
?_664   label byte
        db 46H, 41H, 4CH, 53H, 45H, 00H                 ; 7886 _ FALSE.

?_665   label byte
        db 4CH, 65H, 6EH, 67H, 74H, 68H, 00H            ; 788C _ Length.
?_666   label byte
        db 55H, 70H, 64H, 61H, 74H, 65H, 44H, 72H       ; 7893 _ UpdateDr
        db 69H, 76H, 65H, 72H, 3AH, 20H, 75H, 70H       ; 789B _ iver: up
        db 64H, 61H, 74H, 69H, 6EH, 67H, 20H, 77H       ; 78A3 _ dating w
        db 68H, 6FH, 6CH, 65H, 20H, 46H, 56H, 20H       ; 78AB _ hole FV 
        db 66H, 72H, 6FH, 6DH, 20H, 25H, 30H, 38H       ; 78B3 _ from %08
        db 4CH, 58H, 20H, 74H, 6FH, 20H, 25H, 30H       ; 78BB _ LX to %0
        db 38H, 4CH, 58H, 0AH, 00H                      ; 78C3 _ 8LX..
?_667   label byte
        db 55H, 70H, 64H, 61H, 74H, 65H, 44H, 72H       ; 78C8 _ UpdateDr
        db 69H, 76H, 65H, 72H, 3AH, 20H, 75H, 70H       ; 78D0 _ iver: up
        db 64H, 61H, 74H, 69H, 6EH, 67H, 20H, 66H       ; 78D8 _ dating f
        db 69H, 6CH, 65H, 3AH, 20H, 25H, 67H, 0AH       ; 78E0 _ ile: %g.
        db 00H                                          ; 78E8 _ .
?_668   label byte
        db 55H, 70H, 64H, 61H, 74H, 65H, 20H, 46H       ; 78E9 _ Update F
        db 6CH, 61H, 73H, 68H, 20H, 61H, 72H, 65H       ; 78F1 _ lash are
        db 61H, 20H, 66H, 72H, 6FH, 6DH, 20H, 25H       ; 78F9 _ a from %
        db 30H, 38H, 4CH, 58H, 20H, 74H, 6FH, 20H       ; 7901 _ 08LX to 
        db 25H, 30H, 38H, 4CH, 58H, 0AH, 00H            ; 7909 _ %08LX..
?_669   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 7910 _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 7918 _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 7920 _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 7928 _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 7930 _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 7938 _ dk2-mast
        db 65H, 72H, 2FH, 42H, 75H, 69H, 6CH, 64H       ; 7940 _ er/Build
        db 2FH, 49H, 6EH, 74H, 65H, 6CH, 46H, 72H       ; 7948 _ /IntelFr
        db 61H, 6DH, 65H, 77H, 6FH, 72H, 6BH, 4DH       ; 7950 _ ameworkM
        db 6FH, 64H, 75H, 6CH, 65H, 41H, 6CH, 6CH       ; 7958 _ oduleAll
        db 2FH, 44H, 45H, 42H, 55H, 47H, 5FH, 58H       ; 7960 _ /DEBUG_X
        db 43H, 4FH, 44H, 45H, 35H, 2FH, 58H, 36H       ; 7968 _ CODE5/X6
        db 34H, 2FH, 49H, 6EH, 74H, 65H, 6CH, 46H       ; 7970 _ 4/IntelF
        db 72H, 61H, 6DH, 65H, 77H, 6FH, 72H, 6BH       ; 7978 _ ramework
        db 4DH, 6FH, 64H, 75H, 6CH, 65H, 50H, 6BH       ; 7980 _ ModulePk
        db 67H, 2FH, 55H, 6EH, 69H, 76H, 65H, 72H       ; 7988 _ g/Univer
        db 73H, 61H, 6CH, 2FH, 46H, 69H, 72H, 6DH       ; 7990 _ sal/Firm
        db 77H, 61H, 72H, 65H, 56H, 6FH, 6CH, 75H       ; 7998 _ wareVolu
        db 6DH, 65H, 2FH, 55H, 70H, 64H, 61H, 74H       ; 79A0 _ me/Updat
        db 65H, 44H, 72H, 69H, 76H, 65H, 72H, 44H       ; 79A8 _ eDriverD
        db 78H, 65H, 2FH, 55H, 70H, 64H, 61H, 74H       ; 79B0 _ xe/Updat
        db 65H, 44H, 72H, 69H, 76H, 65H, 72H, 44H       ; 79B8 _ eDriverD
        db 78H, 65H, 2FH, 44H, 45H, 42H, 55H, 47H       ; 79C0 _ xe/DEBUG
        db 2FH, 41H, 75H, 74H, 6FH, 47H, 65H, 6EH       ; 79C8 _ /AutoGen
        db 2EH, 63H, 00H                                ; 79D0 _ .c.
__TEXT.__cstring ENDS

__TEXT.__const SEGMENT PARA 'DATA'                      ; section number 3

_mHexStr label byte
        db 30H, 31H, 32H, 33H, 34H, 35H, 36H, 37H       ; 79E0 _ 01234567
        db 38H, 39H, 41H, 42H, 43H, 44H, 45H, 46H       ; 79E8 _ 89ABCDEF

_mEndOfPakageList label byte
        db 04H, 00H, 00H, 0DFH                          ; 79F0 _ ....

__gPcd_FixedAtBuild_PcdMaximumAsciiStringLength label dword
        dd 000F4240H                                    ; 79F4 _ 1000000 
__gPcd_FixedAtBuild_PcdMaximumUnicodeStringLength label dword
        dd 000F4240H                                    ; 79F8 _ 1000000 
__gPcd_FixedAtBuild_PcdUefiLibMaxPrintBufferSize label dword
        dd 00000140H                                    ; 79FC _ 320 
__gUefiDriverRevision label dword
        dd 00000000H                                    ; 7A00 _ 0 
__gDriverUnloadImageCount label byte
        db 00H                                          ; 7A04 _ .
__TEXT.__const ENDS

__TEXT.__ustring SEGMENT WORD 'DATA'                    ; section number 4

?_670   label byte
        db 50H, 00H, 6CH, 00H, 61H, 00H, 74H, 00H       ; 7A06 _ P.l.a.t.
        db 66H, 00H, 6FH, 00H, 72H, 00H, 6DH, 00H       ; 7A0E _ f.o.r.m.
        db 4CH, 00H, 61H, 00H, 6EH, 00H, 67H, 00H       ; 7A16 _ L.a.n.g.
        db 00H, 00H                                     ; 7A1E _ ..

__TEXT.__ustring ENDS

__TEXT.__eh_frame SEGMENT ALIGN(8) 'DATA'               ; section number 5

        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7A20 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 7A28 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 7A30 _ ........
        db 1CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 7A38 _ ........
        db 00H, 88H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 7A40 _ ........
        db 0BH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7A48 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7A50 _ ........
        db 1CH, 00H, 00H, 00H, 3CH, 00H, 00H, 00H       ; 7A58 _ ....<...
        db 0EBH, 87H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 7A60 _ ........
        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7A68 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7A70 _ ........
        db 1CH, 00H, 00H, 00H, 5CH, 00H, 00H, 00H       ; 7A78 _ ....\...
        db 0CCH, 87H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 7A80 _ ........
        db 03H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7A88 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7A90 _ ........
        db 1CH, 00H, 00H, 00H, 7CH, 00H, 00H, 00H       ; 7A98 _ ....|...
        db 0AFH, 87H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 7AA0 _ ........
        db 03H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7AA8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7AB0 _ ........
        db 1CH, 00H, 00H, 00H, 9CH, 00H, 00H, 00H       ; 7AB8 _ ........
        db 92H, 87H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 7AC0 _ ........
        db 03H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7AC8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7AD0 _ ........
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7AD8 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 7AE0 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 7AE8 _ ........
        db 1CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 7AF0 _ ........
        db 5DH, 87H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 7AF8 _ ].......
        db 17H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7B00 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7B08 _ ........
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7B10 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 7B18 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 7B20 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 7B28 _ $.......
        db 3CH, 87H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 7B30 _ <.......
        db 79H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7B38 _ y.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 7B40 _ .A....C.
        db 06H, 46H, 85H, 04H, 84H, 03H, 00H, 00H       ; 7B48 _ .F......
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7B50 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 7B58 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 7B60 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 7B68 _ $.......
        db 75H, 87H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 7B70 _ u.......
        db 0F3H, 00H, 00H, 00H, 00H, 00H, 00H, 00H      ; 7B78 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 7B80 _ .A....C.
        db 06H, 47H, 83H, 05H, 85H, 04H, 84H, 03H       ; 7B88 _ .G......
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7B90 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 7B98 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 7BA0 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 7BA8 _ $.......
        db 28H, 88H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 7BB0 _ (.......
        db 6CH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7BB8 _ l.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 7BC0 _ .A....C.
        db 06H, 47H, 83H, 05H, 85H, 04H, 84H, 03H       ; 7BC8 _ .G......
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7BD0 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 7BD8 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 7BE0 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 7BE8 _ $.......
        db 54H, 88H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 7BF0 _ T.......
        db 0A0H, 00H, 00H, 00H, 00H, 00H, 00H, 00H      ; 7BF8 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 7C00 _ .A....C.
        db 06H, 47H, 83H, 05H, 85H, 04H, 84H, 03H       ; 7C08 _ .G......
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7C10 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 7C18 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 7C20 _ ........
        db 1CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 7C28 _ ........
        db 0B4H, 88H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 7C30 _ ........
        db 08H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7C38 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7C40 _ ........
        db 1CH, 00H, 00H, 00H, 3CH, 00H, 00H, 00H       ; 7C48 _ ....<...
        db 9CH, 88H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 7C50 _ ........
        db 2EH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7C58 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7C60 _ ........
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7C68 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 7C70 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 7C78 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 7C80 _ $.......
        db 92H, 88H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 7C88 _ ........
        db 43H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7C90 _ C.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 7C98 _ .A....C.
        db 06H, 46H, 85H, 04H, 84H, 03H, 00H, 00H       ; 7CA0 _ .F......
        db 24H, 00H, 00H, 00H, 44H, 00H, 00H, 00H       ; 7CA8 _ $...D...
        db 0ADH, 88H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 7CB0 _ ........
        db 53H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7CB8 _ S.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 7CC0 _ .A....C.
        db 06H, 47H, 83H, 05H, 85H, 04H, 84H, 03H       ; 7CC8 _ .G......
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7CD0 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 7CD8 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 7CE0 _ ........
        db 1CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 7CE8 _ ........
        db 0C0H, 88H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 7CF0 _ ........
        db 39H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7CF8 _ 9.......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7D00 _ ........
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7D08 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 7D10 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 7D18 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 7D20 _ $.......
        db 0C1H, 88H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 7D28 _ ........
        db 66H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7D30 _ f.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 7D38 _ .A....C.
        db 06H, 45H, 84H, 03H, 00H, 00H, 00H, 00H       ; 7D40 _ .E......
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7D48 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 7D50 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 7D58 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 7D60 _ $.......
        db 0E7H, 88H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 7D68 _ ........
        db 4DH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7D70 _ M.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 7D78 _ .A....C.
        db 06H, 47H, 83H, 05H, 85H, 04H, 84H, 03H       ; 7D80 _ .G......
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7D88 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 7D90 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 7D98 _ ........
        db 2CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 7DA0 _ ,.......
        db 0F4H, 88H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 7DA8 _ ........
        db 0E5H, 01H, 00H, 00H, 00H, 00H, 00H, 00H      ; 7DB0 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 7DB8 _ .A....C.
        db 06H, 49H, 83H, 06H, 85H, 05H, 84H, 04H       ; 7DC0 _ .I......
        db 8EH, 03H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7DC8 _ ........
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7DD0 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 7DD8 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 7DE0 _ ........
        db 2CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 7DE8 _ ,.......
        db 91H, 8AH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 7DF0 _ ........
        db 0BBH, 00H, 00H, 00H, 00H, 00H, 00H, 00H      ; 7DF8 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 7E00 _ .A....C.
        db 06H, 4BH, 83H, 07H, 85H, 06H, 84H, 05H       ; 7E08 _ .K......
        db 8EH, 04H, 8FH, 03H, 00H, 00H, 00H, 00H       ; 7E10 _ ........
        db 24H, 00H, 00H, 00H, 4CH, 00H, 00H, 00H       ; 7E18 _ $...L...
        db 1CH, 8BH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 7E20 _ ........
        db 18H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7E28 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 7E30 _ .A....C.
        db 06H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7E38 _ ........
        db 24H, 00H, 00H, 00H, 74H, 00H, 00H, 00H       ; 7E40 _ $...t...
        db 0CH, 8BH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 7E48 _ ........
        db 16H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7E50 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 7E58 _ .A....C.
        db 06H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7E60 _ ........
        db 2CH, 00H, 00H, 00H, 9CH, 00H, 00H, 00H       ; 7E68 _ ,.......
        db 0FAH, 8AH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 7E70 _ ........
        db 92H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7E78 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 7E80 _ .A....C.
        db 06H, 4BH, 83H, 07H, 85H, 06H, 84H, 05H       ; 7E88 _ .K......
        db 8EH, 04H, 8FH, 03H, 00H, 00H, 00H, 00H       ; 7E90 _ ........
        db 24H, 00H, 00H, 00H, 0CCH, 00H, 00H, 00H      ; 7E98 _ $.......
        db 5CH, 8BH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 7EA0 _ \.......
        db 92H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7EA8 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 7EB0 _ .A....C.
        db 06H, 46H, 85H, 04H, 84H, 03H, 00H, 00H       ; 7EB8 _ .F......
        db 24H, 00H, 00H, 00H, 0F4H, 00H, 00H, 00H      ; 7EC0 _ $.......
        db 0C6H, 8BH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 7EC8 _ ........
        db 0E1H, 00H, 00H, 00H, 00H, 00H, 00H, 00H      ; 7ED0 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 7ED8 _ .A....C.
        db 06H, 46H, 85H, 04H, 84H, 03H, 00H, 00H       ; 7EE0 _ .F......
        db 2CH, 00H, 00H, 00H, 1CH, 01H, 00H, 00H       ; 7EE8 _ ,.......
        db 7FH, 8CH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 7EF0 _ ........
        db 0DFH, 00H, 00H, 00H, 00H, 00H, 00H, 00H      ; 7EF8 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 7F00 _ .A....C.
        db 06H, 49H, 83H, 06H, 85H, 05H, 84H, 04H       ; 7F08 _ .I......
        db 8EH, 03H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7F10 _ ........
        db 2CH, 00H, 00H, 00H, 4CH, 01H, 00H, 00H       ; 7F18 _ ,...L...
        db 2EH, 8DH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 7F20 _ ........
        db 0B5H, 01H, 00H, 00H, 00H, 00H, 00H, 00H      ; 7F28 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 7F30 _ .A....C.
        db 06H, 4DH, 83H, 08H, 85H, 07H, 84H, 06H       ; 7F38 _ .M......
        db 8CH, 05H, 8EH, 04H, 8FH, 03H, 00H, 00H       ; 7F40 _ ........
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7F48 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 7F50 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 7F58 _ ........
        db 1CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 7F60 _ ........
        db 0A4H, 90H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 7F68 _ ........
        db 1CH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7F70 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7F78 _ ........
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7F80 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 7F88 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 7F90 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 7F98 _ $.......
        db 88H, 90H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 7FA0 _ ........
        db 3CH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7FA8 _ <.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 7FB0 _ .A....C.
        db 06H, 45H, 84H, 03H, 00H, 00H, 00H, 00H       ; 7FB8 _ .E......
        db 24H, 00H, 00H, 00H, 44H, 00H, 00H, 00H       ; 7FC0 _ $...D...
        db 9CH, 90H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 7FC8 _ ........
        db 3BH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7FD0 _ ;.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 7FD8 _ .A....C.
        db 06H, 45H, 84H, 03H, 00H, 00H, 00H, 00H       ; 7FE0 _ .E......
        db 24H, 00H, 00H, 00H, 6CH, 00H, 00H, 00H       ; 7FE8 _ $...l...
        db 0AFH, 90H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 7FF0 _ ........
        db 3CH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 7FF8 _ <.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8000 _ .A....C.
        db 06H, 45H, 84H, 03H, 00H, 00H, 00H, 00H       ; 8008 _ .E......
        db 24H, 00H, 00H, 00H, 94H, 00H, 00H, 00H       ; 8010 _ $.......
        db 0C3H, 90H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8018 _ ........
        db 44H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8020 _ D.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8028 _ .A....C.
        db 06H, 46H, 85H, 04H, 84H, 03H, 00H, 00H       ; 8030 _ .F......
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8038 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 8040 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 8048 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 8050 _ $.......
        db 10H, 93H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 8058 _ ........
        db 0B5H, 00H, 00H, 00H, 00H, 00H, 00H, 00H      ; 8060 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8068 _ .A....C.
        db 06H, 45H, 84H, 03H, 00H, 00H, 00H, 00H       ; 8070 _ .E......
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8078 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 8080 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 8088 _ ........
        db 2CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 8090 _ ,.......
        db 85H, 93H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 8098 _ ........
        db 0FEH, 01H, 00H, 00H, 00H, 00H, 00H, 00H      ; 80A0 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 80A8 _ .A....C.
        db 06H, 4BH, 83H, 07H, 85H, 06H, 84H, 05H       ; 80B0 _ .K......
        db 8EH, 04H, 8FH, 03H, 00H, 00H, 00H, 00H       ; 80B8 _ ........
        db 1CH, 00H, 00H, 00H, 4CH, 00H, 00H, 00H       ; 80C0 _ ....L...
        db 53H, 95H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 80C8 _ S.......
        db 13H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 80D0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 80D8 _ ........
        db 24H, 00H, 00H, 00H, 6CH, 00H, 00H, 00H       ; 80E0 _ $...l...
        db 46H, 95H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 80E8 _ F.......
        db 31H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 80F0 _ 1.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 80F8 _ .A....C.
        db 06H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8100 _ ........
        db 1CH, 00H, 00H, 00H, 94H, 00H, 00H, 00H       ; 8108 _ ........
        db 4FH, 95H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 8110 _ O.......
        db 10H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8118 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8120 _ ........
        db 24H, 00H, 00H, 00H, 0B4H, 00H, 00H, 00H      ; 8128 _ $.......
        db 3FH, 95H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 8130 _ ?.......
        db 30H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8138 _ 0.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8140 _ .A....C.
        db 06H, 45H, 84H, 03H, 00H, 00H, 00H, 00H       ; 8148 _ .E......
        db 1CH, 00H, 00H, 00H, 0DCH, 00H, 00H, 00H      ; 8150 _ ........
        db 47H, 95H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 8158 _ G.......
        db 10H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8160 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8168 _ ........
        db 24H, 00H, 00H, 00H, 0FCH, 00H, 00H, 00H      ; 8170 _ $.......
        db 37H, 95H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 8178 _ 7.......
        db 95H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8180 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8188 _ .A....C.
        db 06H, 47H, 83H, 05H, 85H, 04H, 84H, 03H       ; 8190 _ .G......
        db 1CH, 00H, 00H, 00H, 24H, 01H, 00H, 00H       ; 8198 _ ....$...
        db 0A4H, 95H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 81A0 _ ........
        db 13H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 81A8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 81B0 _ ........
        db 24H, 00H, 00H, 00H, 44H, 01H, 00H, 00H       ; 81B8 _ $...D...
        db 97H, 95H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 81C0 _ ........
        db 74H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 81C8 _ t.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 81D0 _ .A....C.
        db 06H, 45H, 84H, 03H, 00H, 00H, 00H, 00H       ; 81D8 _ .E......
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 81E0 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 81E8 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 81F0 _ ........
        db 2CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 81F8 _ ,.......
        db 0CCH, 95H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8200 _ ........
        db 50H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8208 _ P.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8210 _ .A....C.
        db 06H, 49H, 83H, 06H, 85H, 05H, 84H, 04H       ; 8218 _ .I......
        db 8EH, 03H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8220 _ ........
        db 2CH, 00H, 00H, 00H, 4CH, 00H, 00H, 00H       ; 8228 _ ,...L...
        db 0ECH, 95H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8230 _ ........
        db 12H, 11H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8238 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8240 _ .A....C.
        db 06H, 52H, 83H, 09H, 85H, 08H, 84H, 07H       ; 8248 _ .R......
        db 8CH, 06H, 8DH, 05H, 8EH, 04H, 8FH, 03H       ; 8250 _ ........
        db 24H, 00H, 00H, 00H, 7CH, 00H, 00H, 00H       ; 8258 _ $...|...
        db 78H, 0A7H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8260 _ x.......
        db 2DH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8268 _ -.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8270 _ .A....C.
        db 06H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8278 _ ........
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8280 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 8288 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 8290 _ ........
        db 2CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 8298 _ ,.......
        db 65H, 0A7H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 82A0 _ e.......
        db 96H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 82A8 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 82B0 _ .A....C.
        db 06H, 49H, 83H, 06H, 85H, 05H, 84H, 04H       ; 82B8 _ .I......
        db 8EH, 03H, 00H, 00H, 00H, 00H, 00H, 00H       ; 82C0 _ ........
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 82C8 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 82D0 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 82D8 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 82E0 _ $.......
        db 0B3H, 0A7H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 82E8 _ ........
        db 57H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 82F0 _ W.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 82F8 _ .A....C.
        db 06H, 45H, 84H, 03H, 00H, 00H, 00H, 00H       ; 8300 _ .E......
        db 24H, 00H, 00H, 00H, 44H, 00H, 00H, 00H       ; 8308 _ $...D...
        db 0E2H, 0A7H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8310 _ ........
        db 48H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8318 _ H.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8320 _ .A....C.
        db 06H, 45H, 84H, 03H, 00H, 00H, 00H, 00H       ; 8328 _ .E......
        db 24H, 00H, 00H, 00H, 6CH, 00H, 00H, 00H       ; 8330 _ $...l...
        db 02H, 0A8H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8338 _ ........
        db 44H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8340 _ D.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8348 _ .A....C.
        db 06H, 45H, 84H, 03H, 00H, 00H, 00H, 00H       ; 8350 _ .E......
        db 24H, 00H, 00H, 00H, 94H, 00H, 00H, 00H       ; 8358 _ $.......
        db 1EH, 0A8H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8360 _ ........
        db 3CH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8368 _ <.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8370 _ .A....C.
        db 06H, 45H, 84H, 03H, 00H, 00H, 00H, 00H       ; 8378 _ .E......
        db 24H, 00H, 00H, 00H, 0BCH, 00H, 00H, 00H      ; 8380 _ $.......
        db 32H, 0A8H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8388 _ 2.......
        db 3DH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8390 _ =.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8398 _ .A....C.
        db 06H, 45H, 84H, 03H, 00H, 00H, 00H, 00H       ; 83A0 _ .E......
        db 24H, 00H, 00H, 00H, 0E4H, 00H, 00H, 00H      ; 83A8 _ $.......
        db 47H, 0A8H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 83B0 _ G.......
        db 49H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 83B8 _ I.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 83C0 _ .A....C.
        db 06H, 45H, 84H, 03H, 00H, 00H, 00H, 00H       ; 83C8 _ .E......
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 83D0 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 83D8 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 83E0 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 83E8 _ $.......
        db 50H, 0A8H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 83F0 _ P.......
        db 48H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 83F8 _ H.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8400 _ .A....C.
        db 06H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8408 _ ........
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8410 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 8418 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 8420 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 8428 _ $.......
        db 58H, 0A8H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8430 _ X.......
        db 9FH, 01H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8438 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8440 _ .A....C.
        db 06H, 45H, 84H, 03H, 00H, 00H, 00H, 00H       ; 8448 _ .E......
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8450 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 8458 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 8460 _ ........
        db 2CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 8468 _ ,.......
        db 0B7H, 0A9H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8470 _ ........
        db 0FH, 01H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8478 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8480 _ .A....C.
        db 06H, 4BH, 83H, 07H, 85H, 06H, 84H, 05H       ; 8488 _ .K......
        db 8EH, 04H, 8FH, 03H, 00H, 00H, 00H, 00H       ; 8490 _ ........
        db 24H, 00H, 00H, 00H, 4CH, 00H, 00H, 00H       ; 8498 _ $...L...
        db 96H, 0AAH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 84A0 _ ........
        db 36H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 84A8 _ 6.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 84B0 _ .A....C.
        db 06H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 84B8 _ ........
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 84C0 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 84C8 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 84D0 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 84D8 _ $.......
        db 8CH, 0AAH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 84E0 _ ........
        db 60H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 84E8 _ `.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 84F0 _ .A....C.
        db 06H, 45H, 84H, 03H, 00H, 00H, 00H, 00H       ; 84F8 _ .E......
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8500 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 8508 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 8510 _ ........
        db 1CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 8518 _ ........
        db 0ACH, 0AAH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8520 _ ........
        db 03H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8528 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8530 _ ........
        db 2CH, 00H, 00H, 00H, 3CH, 00H, 00H, 00H       ; 8538 _ ,...<...
        db 8FH, 0AAH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8540 _ ........
        db 0C7H, 00H, 00H, 00H, 00H, 00H, 00H, 00H      ; 8548 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8550 _ .A....C.
        db 06H, 4DH, 83H, 08H, 85H, 07H, 84H, 06H       ; 8558 _ .M......
        db 8CH, 05H, 8EH, 04H, 8FH, 03H, 00H, 00H       ; 8560 _ ........
        db 2CH, 00H, 00H, 00H, 6CH, 00H, 00H, 00H       ; 8568 _ ,...l...
        db 26H, 0ABH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8570 _ &.......
        db 32H, 01H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8578 _ 2.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8580 _ .A....C.
        db 06H, 4BH, 83H, 07H, 85H, 06H, 84H, 05H       ; 8588 _ .K......
        db 8EH, 04H, 8FH, 03H, 00H, 00H, 00H, 00H       ; 8590 _ ........
        db 1CH, 00H, 00H, 00H, 9CH, 00H, 00H, 00H       ; 8598 _ ........
        db 28H, 0ACH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 85A0 _ (.......
        db 15H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 85A8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 85B0 _ ........
        db 2CH, 00H, 00H, 00H, 0BCH, 00H, 00H, 00H      ; 85B8 _ ,.......
        db 1DH, 0ACH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 85C0 _ ........
        db 4DH, 01H, 00H, 00H, 00H, 00H, 00H, 00H       ; 85C8 _ M.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 85D0 _ .A....C.
        db 06H, 4DH, 83H, 08H, 85H, 07H, 84H, 06H       ; 85D8 _ .M......
        db 8CH, 05H, 8EH, 04H, 8FH, 03H, 00H, 00H       ; 85E0 _ ........
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 85E8 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 85F0 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 85F8 _ ........
        db 2CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 8600 _ ,.......
        db 24H, 0ADH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8608 _ $.......
        db 52H, 01H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8610 _ R.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8618 _ .A....C.
        db 06H, 4DH, 83H, 08H, 85H, 07H, 84H, 06H       ; 8620 _ .M......
        db 8CH, 05H, 8EH, 04H, 8FH, 03H, 00H, 00H       ; 8628 _ ........
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8630 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 8638 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 8640 _ ........
        db 2CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 8648 _ ,.......
        db 2EH, 0AEH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8650 _ ........
        db 0B6H, 01H, 00H, 00H, 00H, 00H, 00H, 00H      ; 8658 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8660 _ .A....C.
        db 06H, 4FH, 83H, 09H, 85H, 08H, 84H, 07H       ; 8668 _ .O......
        db 8CH, 06H, 8DH, 05H, 8EH, 04H, 8FH, 03H       ; 8670 _ ........
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8678 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 8680 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 8688 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 8690 _ $.......
        db 9CH, 0AFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8698 _ ........
        db 0ADH, 00H, 00H, 00H, 00H, 00H, 00H, 00H      ; 86A0 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 86A8 _ .A....C.
        db 06H, 46H, 85H, 04H, 84H, 03H, 00H, 00H       ; 86B0 _ .F......
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 86B8 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 86C0 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 86C8 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 86D0 _ $.......
        db 09H, 0B0H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 86D8 _ ........
        db 0A7H, 00H, 00H, 00H, 00H, 00H, 00H, 00H      ; 86E0 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 86E8 _ .A....C.
        db 06H, 45H, 84H, 03H, 00H, 00H, 00H, 00H       ; 86F0 _ .E......
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 86F8 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 8700 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 8708 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 8710 _ $.......
        db 70H, 0B0H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8718 _ p.......
        db 34H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8720 _ 4.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8728 _ .A....C.
        db 06H, 46H, 85H, 04H, 84H, 03H, 00H, 00H       ; 8730 _ .F......
        db 24H, 00H, 00H, 00H, 44H, 00H, 00H, 00H       ; 8738 _ $...D...
        db 7CH, 0B0H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8740 _ |.......
        db 0EAH, 00H, 00H, 00H, 00H, 00H, 00H, 00H      ; 8748 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8750 _ .A....C.
        db 06H, 47H, 83H, 05H, 85H, 04H, 84H, 03H       ; 8758 _ .G......
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8760 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 8768 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 8770 _ ........
        db 2CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 8778 _ ,.......
        db 26H, 0B1H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8780 _ &.......
        db 0E9H, 01H, 00H, 00H, 00H, 00H, 00H, 00H      ; 8788 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8790 _ .A....C.
        db 06H, 4FH, 83H, 09H, 85H, 08H, 84H, 07H       ; 8798 _ .O......
        db 8CH, 06H, 8DH, 05H, 8EH, 04H, 8FH, 03H       ; 87A0 _ ........
        db 2CH, 00H, 00H, 00H, 4CH, 00H, 00H, 00H       ; 87A8 _ ,...L...
        db 0DFH, 0B2H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 87B0 _ ........
        db 78H, 02H, 00H, 00H, 00H, 00H, 00H, 00H       ; 87B8 _ x.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 87C0 _ .A....C.
        db 06H, 4FH, 83H, 09H, 85H, 08H, 84H, 07H       ; 87C8 _ .O......
        db 8CH, 06H, 8DH, 05H, 8EH, 04H, 8FH, 03H       ; 87D0 _ ........
        db 2CH, 00H, 00H, 00H, 7CH, 00H, 00H, 00H       ; 87D8 _ ,...|...
        db 27H, 0B5H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 87E0 _ '.......
        db 3CH, 02H, 00H, 00H, 00H, 00H, 00H, 00H       ; 87E8 _ <.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 87F0 _ .A....C.
        db 06H, 4FH, 83H, 09H, 85H, 08H, 84H, 07H       ; 87F8 _ .O......
        db 8CH, 06H, 8DH, 05H, 8EH, 04H, 8FH, 03H       ; 8800 _ ........
        db 2CH, 00H, 00H, 00H, 0ACH, 00H, 00H, 00H      ; 8808 _ ,.......
        db 33H, 0B7H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8810 _ 3.......
        db 0CDH, 00H, 00H, 00H, 00H, 00H, 00H, 00H      ; 8818 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8820 _ .A....C.
        db 06H, 49H, 83H, 06H, 85H, 05H, 84H, 04H       ; 8828 _ .I......
        db 8EH, 03H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8830 _ ........
        db 2CH, 00H, 00H, 00H, 0DCH, 00H, 00H, 00H      ; 8838 _ ,.......
        db 0D0H, 0B7H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8840 _ ........
        db 08H, 04H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8848 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8850 _ .A....C.
        db 06H, 4CH, 83H, 06H, 85H, 05H, 84H, 04H       ; 8858 _ .L......
        db 8EH, 03H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8860 _ ........
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8868 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 8870 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 8878 _ ........
        db 2CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 8880 _ ,.......
        db 90H, 0BBH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8888 _ ........
        db 8CH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8890 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8898 _ .A....C.
        db 06H, 49H, 83H, 06H, 85H, 05H, 84H, 04H       ; 88A0 _ .I......
        db 8EH, 03H, 00H, 00H, 00H, 00H, 00H, 00H       ; 88A8 _ ........
        db 1CH, 00H, 00H, 00H, 4CH, 00H, 00H, 00H       ; 88B0 _ ....L...
        db 0ECH, 0BBH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 88B8 _ ........
        db 9CH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 88C0 _ ........
        db 00H, 41H, 0EH, 10H, 84H, 02H, 00H, 00H       ; 88C8 _ .A......
        db 2CH, 00H, 00H, 00H, 6CH, 00H, 00H, 00H       ; 88D0 _ ,...l...
        db 68H, 0BCH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 88D8 _ h.......
        db 83H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 88E0 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 88E8 _ .A....C.
        db 06H, 49H, 83H, 06H, 85H, 05H, 84H, 04H       ; 88F0 _ .I......
        db 8EH, 03H, 00H, 00H, 00H, 00H, 00H, 00H       ; 88F8 _ ........
        db 2CH, 00H, 00H, 00H, 9CH, 00H, 00H, 00H       ; 8900 _ ,.......
        db 0BBH, 0BCH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8908 _ ........
        db 0D2H, 00H, 00H, 00H, 00H, 00H, 00H, 00H      ; 8910 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8918 _ .A....C.
        db 06H, 49H, 83H, 06H, 85H, 05H, 84H, 04H       ; 8920 _ .I......
        db 8EH, 03H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8928 _ ........
        db 2CH, 00H, 00H, 00H, 0CCH, 00H, 00H, 00H      ; 8930 _ ,.......
        db 5DH, 0BDH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8938 _ ].......
        db 93H, 01H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8940 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8948 _ .A....C.
        db 06H, 4FH, 83H, 09H, 85H, 08H, 84H, 07H       ; 8950 _ .O......
        db 8CH, 06H, 8DH, 05H, 8EH, 04H, 8FH, 03H       ; 8958 _ ........
        db 24H, 00H, 00H, 00H, 0FCH, 00H, 00H, 00H      ; 8960 _ $.......
        db 0C0H, 0BEH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8968 _ ........
        db 84H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8970 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8978 _ .A....C.
        db 06H, 47H, 83H, 05H, 85H, 04H, 84H, 03H       ; 8980 _ .G......
        db 2CH, 00H, 00H, 00H, 24H, 01H, 00H, 00H       ; 8988 _ ,...$...
        db 1CH, 0BFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8990 _ ........
        db 6FH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8998 _ o.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 89A0 _ .A....C.
        db 06H, 49H, 83H, 06H, 85H, 05H, 84H, 04H       ; 89A8 _ .I......
        db 8EH, 03H, 00H, 00H, 00H, 00H, 00H, 00H       ; 89B0 _ ........
        db 1CH, 00H, 00H, 00H, 54H, 01H, 00H, 00H       ; 89B8 _ ....T...
        db 5BH, 0BFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 89C0 _ [.......
        db 73H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 89C8 _ s.......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 89D0 _ ........
        db 2CH, 00H, 00H, 00H, 74H, 01H, 00H, 00H       ; 89D8 _ ,...t...
        db 0AEH, 0BFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 89E0 _ ........
        db 8DH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 89E8 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 89F0 _ .A....C.
        db 06H, 49H, 83H, 06H, 85H, 05H, 84H, 04H       ; 89F8 _ .I......
        db 8EH, 03H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8A00 _ ........
        db 2CH, 00H, 00H, 00H, 0A4H, 01H, 00H, 00H      ; 8A08 _ ,.......
        db 0BH, 0C0H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8A10 _ ........
        db 5EH, 01H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8A18 _ ^.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8A20 _ .A....C.
        db 06H, 4BH, 83H, 07H, 85H, 06H, 84H, 05H       ; 8A28 _ .K......
        db 8EH, 04H, 8FH, 03H, 00H, 00H, 00H, 00H       ; 8A30 _ ........
        db 2CH, 00H, 00H, 00H, 0D4H, 01H, 00H, 00H      ; 8A38 _ ,.......
        db 39H, 0C1H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8A40 _ 9.......
        db 59H, 01H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8A48 _ Y.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8A50 _ .A....C.
        db 06H, 4FH, 83H, 09H, 85H, 08H, 84H, 07H       ; 8A58 _ .O......
        db 8CH, 06H, 8DH, 05H, 8EH, 04H, 8FH, 03H       ; 8A60 _ ........
        db 2CH, 00H, 00H, 00H, 04H, 02H, 00H, 00H       ; 8A68 _ ,.......
        db 62H, 0C2H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8A70 _ b.......
        db 0A0H, 03H, 00H, 00H, 00H, 00H, 00H, 00H      ; 8A78 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8A80 _ .A....C.
        db 06H, 52H, 83H, 09H, 85H, 08H, 84H, 07H       ; 8A88 _ .R......
        db 8CH, 06H, 8DH, 05H, 8EH, 04H, 8FH, 03H       ; 8A90 _ ........
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8A98 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 8AA0 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 8AA8 _ ........
        db 2CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 8AB0 _ ,.......
        db 0BAH, 0C5H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8AB8 _ ........
        db 68H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8AC0 _ h.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8AC8 _ .A....C.
        db 06H, 49H, 83H, 06H, 85H, 05H, 84H, 04H       ; 8AD0 _ .I......
        db 8EH, 03H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8AD8 _ ........
        db 2CH, 00H, 00H, 00H, 4CH, 00H, 00H, 00H       ; 8AE0 _ ,...L...
        db 0F2H, 0C5H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8AE8 _ ........
        db 0CAH, 00H, 00H, 00H, 00H, 00H, 00H, 00H      ; 8AF0 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8AF8 _ .A....C.
        db 06H, 4FH, 83H, 09H, 85H, 08H, 84H, 07H       ; 8B00 _ .O......
        db 8CH, 06H, 8DH, 05H, 8EH, 04H, 8FH, 03H       ; 8B08 _ ........
        db 2CH, 00H, 00H, 00H, 7CH, 00H, 00H, 00H       ; 8B10 _ ,...|...
        db 8CH, 0C6H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8B18 _ ........
        db 0C6H, 01H, 00H, 00H, 00H, 00H, 00H, 00H      ; 8B20 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8B28 _ .A....C.
        db 06H, 4FH, 83H, 09H, 85H, 08H, 84H, 07H       ; 8B30 _ .O......
        db 8CH, 06H, 8DH, 05H, 8EH, 04H, 8FH, 03H       ; 8B38 _ ........
        db 2CH, 00H, 00H, 00H, 0ACH, 00H, 00H, 00H      ; 8B40 _ ,.......
        db 22H, 0C8H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8B48 _ ".......
        db 65H, 02H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8B50 _ e.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8B58 _ .A....C.
        db 06H, 52H, 83H, 09H, 85H, 08H, 84H, 07H       ; 8B60 _ .R......
        db 8CH, 06H, 8DH, 05H, 8EH, 04H, 8FH, 03H       ; 8B68 _ ........
        db 2CH, 00H, 00H, 00H, 0DCH, 00H, 00H, 00H      ; 8B70 _ ,.......
        db 57H, 0CAH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8B78 _ W.......
        db 9AH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8B80 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8B88 _ .A....C.
        db 06H, 4DH, 83H, 08H, 85H, 07H, 84H, 06H       ; 8B90 _ .M......
        db 8CH, 05H, 8EH, 04H, 8FH, 03H, 00H, 00H       ; 8B98 _ ........
        db 2CH, 00H, 00H, 00H, 0CH, 01H, 00H, 00H       ; 8BA0 _ ,.......
        db 0C1H, 0CAH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8BA8 _ ........
        db 6CH, 01H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8BB0 _ l.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8BB8 _ .A....C.
        db 06H, 4DH, 83H, 08H, 85H, 07H, 84H, 06H       ; 8BC0 _ .M......
        db 8CH, 05H, 8EH, 04H, 8FH, 03H, 00H, 00H       ; 8BC8 _ ........
        db 2CH, 00H, 00H, 00H, 3CH, 01H, 00H, 00H       ; 8BD0 _ ,...<...
        db 0FDH, 0CBH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8BD8 _ ........
        db 05H, 01H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8BE0 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8BE8 _ .A....C.
        db 06H, 49H, 83H, 06H, 85H, 05H, 84H, 04H       ; 8BF0 _ .I......
        db 8EH, 03H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8BF8 _ ........
        db 2CH, 00H, 00H, 00H, 6CH, 01H, 00H, 00H       ; 8C00 _ ,...l...
        db 0D2H, 0CCH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8C08 _ ........
        db 0ECH, 05H, 00H, 00H, 00H, 00H, 00H, 00H      ; 8C10 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8C18 _ .A....C.
        db 06H, 52H, 83H, 09H, 85H, 08H, 84H, 07H       ; 8C20 _ .R......
        db 8CH, 06H, 8DH, 05H, 8EH, 04H, 8FH, 03H       ; 8C28 _ ........
        db 2CH, 00H, 00H, 00H, 9CH, 01H, 00H, 00H       ; 8C30 _ ,.......
        db 8EH, 0D2H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8C38 _ ........
        db 07H, 02H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8C40 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8C48 _ .A....C.
        db 06H, 4FH, 83H, 09H, 85H, 08H, 84H, 07H       ; 8C50 _ .O......
        db 8CH, 06H, 8DH, 05H, 8EH, 04H, 8FH, 03H       ; 8C58 _ ........
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8C60 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 8C68 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 8C70 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 8C78 _ $.......
        db 4DH, 0D4H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8C80 _ M.......
        db 0F7H, 01H, 00H, 00H, 00H, 00H, 00H, 00H      ; 8C88 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 8C90 _ .A....C.
        db 06H, 47H, 83H, 05H, 85H, 04H, 84H, 03H       ; 8C98 _ .G......
        db 1CH, 00H, 00H, 00H, 44H, 00H, 00H, 00H       ; 8CA0 _ ....D...
        db 1CH, 0D6H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8CA8 _ ........
        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8CB0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8CB8 _ ........
        db 1CH, 00H, 00H, 00H, 64H, 00H, 00H, 00H       ; 8CC0 _ ....d...
        db 0FDH, 0D5H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8CC8 _ ........
        db 05H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8CD0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8CD8 _ ........
        db 1CH, 00H, 00H, 00H, 84H, 00H, 00H, 00H       ; 8CE0 _ ........
        db 0E2H, 0D5H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 8CE8 _ ........
        db 03H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8CF0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8CF8 _ ........

__TEXT.__eh_frame ENDS

__DATA.__const SEGMENT PARA 'DATA'                      ; section number 6

_mStatusString label byte
        db 2BH, 6CH, 00H, 00H, 00H, 00H, 00H, 00H       ; 8D00 _ +l......
        db 33H, 6CH, 00H, 00H, 00H, 00H, 00H, 00H       ; 8D08 _ 3l......
        db 49H, 6CH, 00H, 00H, 00H, 00H, 00H, 00H       ; 8D10 _ Il......
        db 60H, 6CH, 00H, 00H, 00H, 00H, 00H, 00H       ; 8D18 _ `l......
        db 76H, 6CH, 00H, 00H, 00H, 00H, 00H, 00H       ; 8D20 _ vl......
        db 8FH, 6CH, 00H, 00H, 00H, 00H, 00H, 00H       ; 8D28 _ .l......
        db 0A2H, 6CH, 00H, 00H, 00H, 00H, 00H, 00H      ; 8D30 _ .l......
        db 0ADH, 6CH, 00H, 00H, 00H, 00H, 00H, 00H      ; 8D38 _ .l......
        db 0BFH, 6CH, 00H, 00H, 00H, 00H, 00H, 00H      ; 8D40 _ .l......
        db 0CBH, 6CH, 00H, 00H, 00H, 00H, 00H, 00H      ; 8D48 _ .l......
        db 0DBH, 6CH, 00H, 00H, 00H, 00H, 00H, 00H      ; 8D50 _ .l......
        db 0ECH, 6CH, 00H, 00H, 00H, 00H, 00H, 00H      ; 8D58 _ .l......
        db 0F6H, 6CH, 00H, 00H, 00H, 00H, 00H, 00H      ; 8D60 _ .l......
        db 03H, 6DH, 00H, 00H, 00H, 00H, 00H, 00H       ; 8D68 _ .m......
        db 13H, 6DH, 00H, 00H, 00H, 00H, 00H, 00H       ; 8D70 _ .m......
        db 24H, 6DH, 00H, 00H, 00H, 00H, 00H, 00H       ; 8D78 _ $m......
        db 33H, 6DH, 00H, 00H, 00H, 00H, 00H, 00H       ; 8D80 _ 3m......
        db 3FH, 6DH, 00H, 00H, 00H, 00H, 00H, 00H       ; 8D88 _ ?m......
        db 48H, 6DH, 00H, 00H, 00H, 00H, 00H, 00H       ; 8D90 _ Hm......
        db 56H, 6DH, 00H, 00H, 00H, 00H, 00H, 00H       ; 8D98 _ Vm......
        db 60H, 6DH, 00H, 00H, 00H, 00H, 00H, 00H       ; 8DA0 _ `m......
        db 6EH, 6DH, 00H, 00H, 00H, 00H, 00H, 00H       ; 8DA8 _ nm......
        db 7AH, 6DH, 00H, 00H, 00H, 00H, 00H, 00H       ; 8DB0 _ zm......
        db 85H, 6DH, 00H, 00H, 00H, 00H, 00H, 00H       ; 8DB8 _ .m......
        db 8EH, 6DH, 00H, 00H, 00H, 00H, 00H, 00H       ; 8DC0 _ .m......
        db 9AH, 6DH, 00H, 00H, 00H, 00H, 00H, 00H       ; 8DC8 _ .m......
        db 0AAH, 6DH, 00H, 00H, 00H, 00H, 00H, 00H      ; 8DD0 _ .m......
        db 0B2H, 6DH, 00H, 00H, 00H, 00H, 00H, 00H      ; 8DD8 _ .m......
        db 0BDH, 6DH, 00H, 00H, 00H, 00H, 00H, 00H      ; 8DE0 _ .m......
        db 0C8H, 6DH, 00H, 00H, 00H, 00H, 00H, 00H      ; 8DE8 _ .m......
        db 0D7H, 6DH, 00H, 00H, 00H, 00H, 00H, 00H      ; 8DF0 _ .m......
        db 0ECH, 6DH, 00H, 00H, 00H, 00H, 00H, 00H      ; 8DF8 _ .m......
        db 0FFH, 6DH, 00H, 00H, 00H, 00H, 00H, 00H      ; 8E00 _ .m......
        db 09H, 6EH, 00H, 00H, 00H, 00H, 00H, 00H       ; 8E08 _ .n......
        db 16H, 6EH, 00H, 00H, 00H, 00H, 00H, 00H       ; 8E10 _ .n......
        db 24H, 6EH, 00H, 00H, 00H, 00H, 00H, 00H       ; 8E18 _ $n......
        db 32H, 6EH, 00H, 00H, 00H, 00H, 00H, 00H       ; 8E20 _ 2n......
        db 3EH, 6EH, 00H, 00H, 00H, 00H, 00H, 00H       ; 8E28 _ >n......
        db 4FH, 6EH, 00H, 00H, 00H, 00H, 00H, 00H       ; 8E30 _ On......

__DATA.__const ENDS

__DATA.__data SEGMENT PARA 'DATA'                       ; section number 7

_m16Size label byte
        db 30H, 01H                                     ; 8E40 _ 0.

_mThunk16Attr label byte
        db 22H, 00H                                     ; 8E42 _ ".

_m16Gdt label byte
        db 10H, 01H                                     ; 8E44 _ ..

_m16GdtrBase label byte
        db 0B0H, 00H                                    ; 8E46 _ ..

_mTransition label byte
        db 0A8H, 00H, 00H, 00H, 00H, 00H, 00H, 00H      ; 8E48 _ ........

_gEfiCallerIdGuid label byte
        db 69H, 0FCH, 84H, 0EH, 0CCH, 29H, 6DH, 4CH     ; 8E50 _ i....)mL
        db 92H, 0ACH, 6DH, 47H, 69H, 21H, 85H, 0FH      ; 8E58 _ ..mGi!..
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8E60 _ ........

_gEfiConfigFileNameGuid label byte
        db 9BH, 0D5H, 0B8H, 98H, 0BAH, 0E8H, 0EEH, 48H  ; 8E68 _ .......H
        db 98H, 0DDH, 0C2H, 95H, 39H, 2FH, 1EH, 0DBH    ; 8E70 _ ....9/..

_gEfiUpdateDataFileGuid label byte
        db 0EEH, 0A2H, 3FH, 28H, 2CH, 53H, 4DH, 48H     ; 8E78 _ ..?(,SMH
        db 93H, 83H, 9FH, 93H, 0B3H, 6FH, 0BH, 7EH      ; 8E80 _ .....o.~

_gEfiGlobalVariableGuid label byte
        db 61H, 0DFH, 0E4H, 8BH, 0CAH, 93H, 0D2H, 11H   ; 8E88 _ a.......
        db 0AAH, 0DH, 00H, 0E0H, 98H, 03H, 2BH, 8CH     ; 8E90 _ ......+.

_gEfiDxeServicesTableGuid label byte
        db 0BAH, 34H, 0ADH, 05H, 02H, 6FH, 14H, 42H     ; 8E98 _ .4...o.B
        db 95H, 2EH, 4DH, 0A0H, 39H, 8EH, 2BH, 0B9H     ; 8EA0 _ ..M.9.+.

_gEfiFaultTolerantWriteProtocolGuid label byte
        db 82H, 9EH, 0BDH, 3EH, 78H, 2CH, 0E6H, 4DH     ; 8EA8 _ ...>x,.M
        db 97H, 86H, 8DH, 4BH, 0FCH, 0B7H, 0C8H, 81H    ; 8EB0 _ ...K....

_gEfiFirmwareVolume2ProtocolGuid label byte
        db 0B6H, 73H, 0EH, 22H, 0DBH, 6BH, 13H, 44H     ; 8EB8 _ .s.".k.D
        db 84H, 05H, 0B9H, 74H, 0B1H, 08H, 61H, 9AH     ; 8EC0 _ ...t..a.

_gEfiFirmwareVolumeBlockProtocolGuid label byte
        db 0A9H, 4FH, 64H, 8FH, 50H, 0E8H, 0B1H, 4DH    ; 8EC8 _ .Od.P..M
        db 9CH, 0E2H, 0BH, 44H, 69H, 8EH, 8DH, 0A4H     ; 8ED0 _ ...Di...

_gEfiLoadedImageProtocolGuid label byte
        db 0A1H, 31H, 1BH, 5BH, 62H, 95H, 0D2H, 11H     ; 8ED8 _ .1.[b...
        db 8EH, 3FH, 00H, 0A0H, 0C9H, 69H, 72H, 3BH     ; 8EE0 _ .?...ir;

_gEfiHiiFontProtocolGuid label byte
        db 75H, 47H, 0CAH, 0E9H, 57H, 86H, 0FCH, 47H    ; 8EE8 _ uG..W..G
        db 97H, 0E7H, 7EH, 0D6H, 5AH, 08H, 43H, 24H     ; 8EF0 _ ..~.Z.C$

_gEfiHiiStringProtocolGuid label byte
        db 74H, 69H, 0D9H, 0FH, 0AAH, 23H, 0DCH, 4CH    ; 8EF8 _ ti...#.L
        db 0B9H, 0CBH, 98H, 0D1H, 77H, 50H, 32H, 2AH    ; 8F00 _ ....wP2*

_gEfiHiiImageProtocolGuid label byte
        db 6AH, 40H, 0A6H, 31H, 0DFH, 6BH, 46H, 4EH     ; 8F08 _ j@.1.kFN
        db 0B2H, 0A2H, 0EBH, 0AAH, 89H, 0C4H, 09H, 20H  ; 8F10 _ ....... 

_gEfiHiiDatabaseProtocolGuid label byte
        db 72H, 0C1H, 9FH, 0EFH, 0B2H, 0A1H, 93H, 46H   ; 8F18 _ r......F
        db 0B3H, 27H, 6DH, 32H, 0FCH, 41H, 60H, 42H     ; 8F20 _ .'m2.A`B

_gEfiHiiConfigRoutingProtocolGuid label byte
        db 0D7H, 72H, 7EH, 58H, 50H, 0CCH, 79H, 4FH     ; 8F28 _ .r~XP.yO
        db 82H, 09H, 0CAH, 29H, 1FH, 0C1H, 0A1H, 0FH    ; 8F30 _ ...)....
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8F38 _ ........

_UpdateDriverDxeStrings label byte
        db 0F2H, 01H, 00H, 00H, 0EEH, 01H, 00H, 04H     ; 8F40 _ ........
        db 34H, 00H, 00H, 00H, 34H, 00H, 00H, 00H       ; 8F48 _ 4...4...
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8F50 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8F58 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8F60 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 8F68 _ ........
        db 01H, 00H, 65H, 6EH, 2DH, 55H, 53H, 00H       ; 8F70 _ ..en-US.
        db 14H, 45H, 00H, 6EH, 00H, 67H, 00H, 6CH       ; 8F78 _ .E.n.g.l
        db 00H, 69H, 00H, 73H, 00H, 68H, 00H, 00H       ; 8F80 _ .i.s.h..
        db 00H, 14H, 55H, 00H, 70H, 00H, 64H, 00H       ; 8F88 _ ..U.p.d.
        db 61H, 00H, 74H, 00H, 65H, 00H, 20H, 00H       ; 8F90 _ a.t.e. .
        db 64H, 00H, 72H, 00H, 69H, 00H, 76H, 00H       ; 8F98 _ d.r.i.v.
        db 65H, 00H, 72H, 00H, 20H, 00H, 6CH, 00H       ; 8FA0 _ e.r. .l.
        db 6FH, 00H, 61H, 00H, 64H, 00H, 65H, 00H       ; 8FA8 _ o.a.d.e.
        db 64H, 00H, 2CH, 00H, 20H, 00H, 70H, 00H       ; 8FB0 _ d.,. .p.
        db 72H, 00H, 6FH, 00H, 63H, 00H, 65H, 00H       ; 8FB8 _ r.o.c.e.
        db 73H, 00H, 73H, 00H, 69H, 00H, 6EH, 00H       ; 8FC0 _ s.s.i.n.
        db 67H, 00H, 20H, 00H, 75H, 00H, 70H, 00H       ; 8FC8 _ g. .u.p.
        db 64H, 00H, 61H, 00H, 74H, 00H, 65H, 00H       ; 8FD0 _ d.a.t.e.
        db 20H, 00H, 69H, 00H, 6DH, 00H, 61H, 00H       ; 8FD8 _  .i.m.a.
        db 67H, 00H, 65H, 00H, 0DH, 00H, 0AH, 00H       ; 8FE0 _ g.e.....
        db 0DH, 00H, 00H, 00H, 14H, 44H, 00H, 6FH       ; 8FE8 _ .....D.o
        db 00H, 6EH, 00H, 65H, 00H, 0DH, 00H, 0AH       ; 8FF0 _ .n.e....
        db 00H, 0DH, 00H, 00H, 00H, 14H, 55H, 00H       ; 8FF8 _ ......U.
        db 70H, 00H, 64H, 00H, 61H, 00H, 74H, 00H       ; 9000 _ p.d.a.t.
        db 69H, 00H, 6EH, 00H, 67H, 00H, 20H, 00H       ; 9008 _ i.n.g. .
        db 66H, 00H, 6CH, 00H, 61H, 00H, 73H, 00H       ; 9010 _ f.l.a.s.
        db 68H, 00H, 20H, 00H, 61H, 00H, 72H, 00H       ; 9018 _ h. .a.r.
        db 65H, 00H, 61H, 00H, 20H, 00H, 66H, 00H       ; 9020 _ e.a. .f.
        db 72H, 00H, 6FH, 00H, 6DH, 00H, 20H, 00H       ; 9028 _ r.o.m. .
        db 25H, 00H, 30H, 00H, 38H, 00H, 4CH, 00H       ; 9030 _ %.0.8.L.
        db 58H, 00H, 20H, 00H, 74H, 00H, 6FH, 00H       ; 9038 _ X. .t.o.
        db 20H, 00H, 25H, 00H, 30H, 00H, 38H, 00H       ; 9040 _  .%.0.8.
        db 4CH, 00H, 58H, 00H, 20H, 00H, 2EH, 00H       ; 9048 _ L.X. ...
        db 2EH, 00H, 2EH, 00H, 0DH, 00H, 0AH, 00H       ; 9050 _ ........
        db 0DH, 00H, 00H, 00H, 14H, 41H, 00H, 62H       ; 9058 _ .....A.b
        db 00H, 6FH, 00H, 72H, 00H, 74H, 00H, 65H       ; 9060 _ .o.r.t.e
        db 00H, 64H, 00H, 0DH, 00H, 0AH, 00H, 0DH       ; 9068 _ .d......
        db 00H, 00H, 00H, 14H, 55H, 00H, 70H, 00H       ; 9070 _ ....U.p.
        db 64H, 00H, 61H, 00H, 74H, 00H, 65H, 00H       ; 9078 _ d.a.t.e.
        db 20H, 00H, 66H, 00H, 69H, 00H, 72H, 00H       ; 9080 _  .f.i.r.
        db 6DH, 00H, 77H, 00H, 61H, 00H, 72H, 00H       ; 9088 _ m.w.a.r.
        db 65H, 00H, 20H, 00H, 76H, 00H, 6FH, 00H       ; 9090 _ e. .v.o.
        db 6CH, 00H, 75H, 00H, 6DH, 00H, 65H, 00H       ; 9098 _ l.u.m.e.
        db 20H, 00H, 66H, 00H, 69H, 00H, 6CH, 00H       ; 90A0 _  .f.i.l.
        db 65H, 00H, 20H, 00H, 25H, 00H, 67H, 00H       ; 90A8 _ e. .%.g.
        db 20H, 00H, 2EH, 00H, 2EH, 00H, 0DH, 00H       ; 90B0 _  .......
        db 0AH, 00H, 0DH, 00H, 00H, 00H, 14H, 55H       ; 90B8 _ .......U
        db 00H, 70H, 00H, 64H, 00H, 61H, 00H, 74H       ; 90C0 _ .p.d.a.t
        db 00H, 69H, 00H, 6EH, 00H, 67H, 00H, 20H       ; 90C8 _ .i.n.g. 
        db 00H, 77H, 00H, 68H, 00H, 6FH, 00H, 6CH       ; 90D0 _ .w.h.o.l
        db 00H, 65H, 00H, 20H, 00H, 66H, 00H, 69H       ; 90D8 _ .e. .f.i
        db 00H, 72H, 00H, 6DH, 00H, 77H, 00H, 61H       ; 90E0 _ .r.m.w.a
        db 00H, 72H, 00H, 65H, 00H, 20H, 00H, 76H       ; 90E8 _ .r.e. .v
        db 00H, 6FH, 00H, 6CH, 00H, 75H, 00H, 6DH       ; 90F0 _ .o.l.u.m
        db 00H, 65H, 00H, 20H, 00H, 66H, 00H, 72H       ; 90F8 _ .e. .f.r
        db 00H, 6FH, 00H, 6DH, 00H, 20H, 00H, 25H       ; 9100 _ .o.m. .%
        db 00H, 30H, 00H, 38H, 00H, 4CH, 00H, 58H       ; 9108 _ .0.8.L.X
        db 00H, 20H, 00H, 74H, 00H, 6FH, 00H, 20H       ; 9110 _ . .t.o. 
        db 00H, 25H, 00H, 30H, 00H, 38H, 00H, 4CH       ; 9118 _ .%.0.8.L
        db 00H, 58H, 00H, 20H, 00H, 2EH, 00H, 2EH       ; 9120 _ .X. ....
        db 00H, 0DH, 00H, 0AH, 00H, 0DH, 00H, 00H       ; 9128 _ ........
        db 00H, 00H                                     ; 9130 _ ..

__DATA.__data ENDS

__DATA.__common SEGMENT ALIGN(8) 'BSS'                  ; section number 8

_gImageHandle label qword
        dq      ?                                       ; 9138

_gST    label qword
        dq      ?                                       ; 9140

_gBS    label qword
        dq      ?                                       ; 9148

_gRT    label qword
        dq      ?                                       ; 9150

_gHiiFont label byte
        db      8 dup (?)                               ; 9158

_gHiiString label qword
        dq      ?                                       ; 9160

_gHiiImage label byte
        db      8 dup (?)                               ; 9168

_gHiiDatabase label qword
        dq      ?                                       ; 9170

_gHiiConfigRouting label byte
        db      8 dup (?)                               ; 9178

_gDS    label qword
        dq      ?                                       ; 9180

_gHiiHandle label qword
        dq      ?                                       ; 9188

__DATA.__common ENDS

END240 - 24B
24B - 24C
24C - 24F
24F - 252
252 - 255
255 - 26C
26C - 2E5
2E5 - 3CD
3CD - 3D8
3D8 - 438
438 - 444
444 - 4CE
4CE - 4E4
4E4 - 4EC
4EC - 51A
51A - 55D
55D - 5B0
5B0 - 5E9
5E9 - 631
631 - 64F
64F - 69C
69C - 881
881 - 93C
93C - 954
954 - 96A
96A - 9FC
9FC - A8E
A8E - B6F
B6F - C4E
C4E - E03
E03 - E03
E08 - FEC
FEC - 100C
100C - 1028
1028 - 1064
1064 - 109F
109F - 10DB
10DB - 111F
111F - 1134
1134 - 11C3
11C3 - 123F
123F - 1242
1242 - 127C
127C - 12A4
12A4 - 12CB
12CB - 12FA
12FA - 130D
130D - 1320
1320 - 132D
132D - 1338
1338 - 1345
1345 - 134F
134F - 135D
135D - 1368
1368 - 141D
141D - 161B
161B - 162E
162E - 165F
165F - 166F
166F - 168E
168E - 169F
169F - 16AF
16AF - 172E
172E - 1744
1744 - 1757
1757 - 17C4
17C4 - 17CB
17CB - 17CB
17CC - 181C
181C - 292E
292E - 292E
2930 - 2A05
2A05 - 2A9B
2A9B - 2AF2
2AF2 - 2B3A
2B3A - 2B7E
2B7E - 2BBA
2BBA - 2BF7
2BF7 - 2C40
2C40 - 2C88
2C88 - 2E27
2E27 - 2F36
2F36 - 2F6C
2F6C - 2FCC
2FCC - 2FCF
2FCF - 3096
3096 - 31C8
31C8 - 31DD
31DD - 332A
332A - 332A
332C - 347A
347A - 347E
347E - 3634
3634 - 36E1
36E1 - 3788
3788 - 37BC
37BC - 38A6
38A6 - 3A8F
3A8F - 3D07
3D07 - 3F43
3F43 - 4010
4010 - 4418
4418 - 44A4
44A4 - 4540
4540 - 45C3
45C3 - 4695
4695 - 4828
4828 - 486D
486D - 48AC
48AC - 491B
491B - 4986
4986 - 498E
498E - 4A1B
4A1B - 4B79
4B79 - 4CC4
4CC4 - 4CD2
4CD2 - 5053
5053 - 5072
5072 - 50DA
50DA - 51A4
51A4 - 536A
536A - 55CF
55CF - 5669
5669 - 57A7
57A7 - 57D5
57D5 - 58DA
58DA - 5EBD
5EBD - 5EC6
5EC6 - 60CD
60CD - 62BB
62BB - 62C4
62C4 - 62C5
62C5 - 62CA
62CA - 62CD
