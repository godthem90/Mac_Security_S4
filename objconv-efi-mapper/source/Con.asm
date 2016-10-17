; Disassembly of file: 
; Sun Oct 16 22:48:56 2016
; Mode: 64 bits
; Syntax: MASM/ML64
; Instruction set: BMI etc., x64, privileged instructions

; Error: symbol names contain illegal characters,
; 11 Symbol names not changed

public _GetDebugPrintErrorLevel
public _BasePrintLibValueToString
public _BasePrintLibSPrintMarker
public _BasePrintLibSPrint
public _UnicodeVSPrintAsciiFormat
public _UnicodeSPrintAsciiFormat
public _InternalAssertJumpBuffer
public _DivU64x32Remainder
public _CpuDeadLoop
public _StrLen
public _StrSize
public _AsciiStrSize
public _AsciiStrLen
public _AsciiStrnCmp
public _m16Start
public _InternalAsmThunk16
public _InternalMathDivRemU64x32
public _ReadUnaligned16
public _ReadUnaligned24
public _ReadUnaligned32
public _CpuBreakpoint
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
public _DebugPrint
public _DebugAssertEnabled
public _DebugAssert
public _DebugPrintEnabled
public _DebugPrintLevelEnabled
public _CompareMem
public _CopyMem
public _InternalMemCompareMem
public _InternalMemCopyMem
public _UefiBootServicesTableLibConstructor
public _InternalAllocatePool
public _AllocatePool
public _InternalAllocateCopyPool
public _AllocateCopyPool
public _FreePool
public _UefiRuntimeServicesTableLibConstructor
public _IsDevicePathValid
public _IsDevicePathEnd
public _DevicePathNodeLength
public _NextDevicePathNode
public _DevicePathType
public _DevicePathSubType
public _IsDevicePathEndType
public _UefiDevicePathLibGetDevicePathSize
public _UefiDevicePathLibDuplicateDevicePath
public _UefiDevicePathLibAppendDevicePathInstance
public _UefiDevicePathLibGetNextDevicePathInstance
public _GetDevicePathSize
public _DuplicateDevicePath
public _AppendDevicePathInstance
public _GetNextDevicePathInstance
public _EfiLibInstallDriverBindingComponentName2
public _UefiLibConstructor
public _LookupUnicodeString2
public __DriverUnloadHandler
public __ModuleEntryPoint
public _ConPlatformComponentNameGetDriverName
public _ConPlatformComponentNameGetControllerName
public _ConPlatformTextInDriverBindingSupported
public _ConPlatformTextInDriverBindingStart
public _ConPlatformTextInDriverBindingStop
public _ConPlatformTextOutDriverBindingSupported
public _ConPlatformTextOutDriverBindingStart
public _ConPlatformTextOutDriverBindingStop
public _InitializeConPlatform
public _ConPlatformDriverBindingSupported
public _ConPlatformUpdateDeviceVariable
public _IsHotPlugDevice
public _ConPlatformUpdateGopCandidate
public _ConPlatformUnInstallProtocol
public _ConPlatformGetVariable
public _IsGopSibling
public _ConPlatformMatchDevicePaths
public _ProcessLibraryConstructorList
public _ProcessLibraryDestructorList
public _ProcessModuleEntryPointList
public _ProcessModuleUnloadList
public _mHexStr
public __gPcd_FixedAtBuild_PcdDebugPrintErrorLevel
public __gPcd_FixedAtBuild_PcdMaximumAsciiStringLength
public __gPcd_FixedAtBuild_PcdMaximumUnicodeStringLength
public __gPcd_FixedAtBuild_PcdDebugPropertyMask
public __gPcd_FixedAtBuild_PcdFixedDebugPrintErrorLevel
public __gPcd_FixedAtBuild_PcdMaximumDevicePathNodeCount
public __gPcd_FixedAtBuild_PcdComponentNameDisable
public __gPcd_FixedAtBuild_PcdComponentName2Disable
public __gUefiDriverRevision
public __gDriverUnloadImageCount
public _mStatusString
public _m16Size
public _mThunk16Attr
public _m16Gdt
public _m16GdtrBase
public _mTransition
public _gConPlatformComponentName
public _gConPlatformComponentName2
public _mConPlatformDriverNameTable
public _gConPlatformTextInDriverBinding
public _gConPlatformTextOutDriverBinding
public _gEfiCallerBaseName
public _gEfiGlobalVariableGuid
public _gEfiStandardErrorDeviceGuid
public _gEfiConsoleOutDeviceGuid
public _gEfiConsoleInDeviceGuid
public _gEfiDevicePathProtocolGuid
public _gEfiSimpleTextInProtocolGuid
public _gEfiSimpleTextOutProtocolGuid
public _gEfiPciIoProtocolGuid
public _gEfiGraphicsOutputProtocolGuid
public _gEfiDriverBindingProtocolGuid
public _gEfiComponentNameProtocolGuid
public _gEfiComponentName2ProtocolGuid
public _gEfiLoadedImageProtocolGuid
public _gImageHandle
public _gST
public _gBS
public _gRT


__TEXT.__text SEGMENT ALIGN(8) 'CODE'                   ; section number 1

_GetDebugPrintErrorLevel PROC
00000240        mov     eax, dword ptr [__gPcd_FixedAtBuild_PcdDebugPrintErrorLevel]; 0240 _ 8B. 05, 0000371A(rel)
00000246        ret                                     ; 0246 _ C3
_GetDebugPrintErrorLevel ENDP

00000247        nop                                     ; 0247 _ 90

_BasePrintLibValueToString PROC
00000248        push    rbp                             ; 0248 _ 55
00000249        mov     rbp, rsp                        ; 0249 _ 48: 89. E5
0000024C        push    r14                             ; 024C _ 41: 56
0000024E        push    rsi                             ; 024E _ 56
0000024F        push    rdi                             ; 024F _ 57
00000250        push    rbx                             ; 0250 _ 53
00000251        sub     rsp, 48                         ; 0251 _ 48: 83. EC, 30
00000255        mov     rsi, r8                         ; 0255 _ 4C: 89. C6
00000258        mov     rax, rdx                        ; 0258 _ 48: 89. D0
0000025B        mov     rdi, rcx                        ; 025B _ 48: 89. CF
0000025E        mov     byte ptr [rdi], 0               ; 025E _ C6. 07, 00
00000261        lea     r14, ptr [rbp-24H]              ; 0261 _ 4C: 8D. 75, DC
00000265        lea     rbx, ptr [_mHexStr]             ; 0265 _ 48: 8D. 1D, 000036E4(rel)
?_001:
0000026C        mov     rcx, rax                        ; 026C _ 48: 89. C1
0000026F        mov     edx, esi                        ; 026F _ 89. F2
00000271        mov     r8, r14                         ; 0271 _ 4D: 89. F0
00000274        call    _DivU64x32Remainder             ; 0274 _ E8, 00001300
00000279        mov     ecx, dword ptr [rbp-24H]        ; 0279 _ 8B. 4D, DC
0000027C        mov     cl, byte ptr [rcx+rbx]          ; 027C _ 8A. 0C 19
0000027F        mov     byte ptr [rdi+1H], cl           ; 027F _ 88. 4F, 01
00000282        inc     rdi                             ; 0282 _ 48: FF. C7
00000285        test    rax, rax                        ; 0285 _ 48: 85. C0
00000288        jnz     ?_001                           ; 0288 _ 75, E2
0000028A        mov     rax, rdi                        ; 028A _ 48: 89. F8
0000028D        add     rsp, 48                         ; 028D _ 48: 83. C4, 30
00000291        pop     rbx                             ; 0291 _ 5B
00000292        pop     rdi                             ; 0292 _ 5F
00000293        pop     rsi                             ; 0293 _ 5E
00000294        pop     r14                             ; 0294 _ 41: 5E
00000296        pop     rbp                             ; 0296 _ 5D
00000297        ret                                     ; 0297 _ C3
_BasePrintLibValueToString ENDP

_BasePrintLibSPrintMarker PROC
00000298        push    rbp                             ; 0298 _ 55
00000299        mov     rbp, rsp                        ; 0299 _ 48: 89. E5
0000029C        push    r15                             ; 029C _ 41: 57
0000029E        push    r14                             ; 029E _ 41: 56
000002A0        push    r13                             ; 02A0 _ 41: 55
000002A2        push    r12                             ; 02A2 _ 41: 54
000002A4        push    rsi                             ; 02A4 _ 56
000002A5        push    rdi                             ; 02A5 _ 57
000002A6        push    rbx                             ; 02A6 _ 53
000002A7        sub     rsp, 376                        ; 02A7 _ 48: 81. EC, 00000178
000002AE        mov     rdi, r9                         ; 02AE _ 4C: 89. CF
000002B1        mov     r14, r8                         ; 02B1 _ 4D: 89. C6
000002B4        mov     rsi, rdx                        ; 02B4 _ 48: 89. D6
000002B7        mov     rbx, rcx                        ; 02B7 _ 48: 89. CB
000002BA        mov     rax, r14                        ; 02BA _ 4C: 89. F0
000002BD        mov     rcx, qword ptr [rbp+38H]        ; 02BD _ 48: 8B. 4D, 38
000002C1        mov     qword ptr [rbp-0A8H], rcx       ; 02C1 _ 48: 89. 8D, FFFFFF58
000002C8        test    ah, 20H                         ; 02C8 _ F6. C4, 20
000002CB        jz      ?_002                           ; 02CB _ 74, 0B
000002CD        xor     eax, eax                        ; 02CD _ 31. C0
000002CF        test    rsi, rsi                        ; 02CF _ 48: 85. F6
000002D2        cmove   rbx, rax                        ; 02D2 _ 48: 0F 44. D8
000002D6        jmp     ?_003                           ; 02D6 _ EB, 31

?_002:
000002D8        xor     eax, eax                        ; 02D8 _ 31. C0
000002DA        test    rsi, rsi                        ; 02DA _ 48: 85. F6
000002DD        je      ?_133                           ; 02DD _ 0F 84, 000010B3
000002E3        call    _DebugAssertEnabled             ; 02E3 _ E8, 00001B12
000002E8        test    al, al                          ; 02E8 _ 84. C0
000002EA        jz      ?_003                           ; 02EA _ 74, 1D
000002EC        test    rbx, rbx                        ; 02EC _ 48: 85. DB
000002EF        jnz     ?_003                           ; 02EF _ 75, 18
000002F1        lea     rcx, ptr [?_324]                ; 02F1 _ 48: 8D. 0D, 000038BE(rel)
000002F8        lea     r8, ptr [?_325]                 ; 02F8 _ 4C: 8D. 05, 00003919(rel)
000002FF        mov     edx, 366                        ; 02FF _ BA, 0000016E
00000304        call    _DebugAssert                    ; 0304 _ E8, 00001AFC
?_003:
00000309        mov     rax, r14                        ; 0309 _ 4C: 89. F0
0000030C        and     rax, 40H                        ; 030C _ 48: 83. E0, 40
00000310        mov     qword ptr [rbp-78H], rax        ; 0310 _ 48: 89. 45, 88
00000314        shr     rax, 6                          ; 0314 _ 48: C1. E8, 06
00000318        mov     qword ptr [rbp-90H], rax        ; 0318 _ 48: 89. 85, FFFFFF70
0000031F        lea     rax, ptr [rax+1H]               ; 031F _ 48: 8D. 40, 01
00000323        xor     edx, edx                        ; 0323 _ 31. D2
00000325        test    rbx, rbx                        ; 0325 _ 48: 85. DB
00000328        mov     ecx, 0                          ; 0328 _ B9, 00000000
0000032D        jz      ?_004                           ; 032D _ 74, 10
0000032F        dec     rsi                             ; 032F _ 48: FF. CE
00000332        imul    rsi, rax                        ; 0332 _ 48: 0F AF. F0
00000336        add     rsi, rbx                        ; 0336 _ 48: 01. DE
00000339        mov     rdx, rsi                        ; 0339 _ 48: 89. F2
0000033C        mov     rcx, rbx                        ; 033C _ 48: 89. D9
?_004:
0000033F        mov     qword ptr [rbp-0C0H], rbx       ; 033F _ 48: 89. 9D, FFFFFF40
00000346        mov     rsi, rdx                        ; 0346 _ 48: 89. D6
00000349        mov     qword ptr [rbp-108H], rcx       ; 0349 _ 48: 89. 8D, FFFFFEF8
00000350        mov     qword ptr [rbp-98H], rax        ; 0350 _ 48: 89. 85, FFFFFF68
00000357        mov     rbx, r14                        ; 0357 _ 4C: 89. F3
0000035A        call    _DebugAssertEnabled             ; 035A _ E8, 00001A9B
0000035F        test    bh, 1H                          ; 035F _ F6. C7, 01
00000362        jz      ?_007                           ; 0362 _ 74, 6A
00000364        test    al, al                          ; 0364 _ 84. C0
00000366        mov     rdx, rdi                        ; 0366 _ 48: 89. FA
00000369        jnz     ?_005                           ; 0369 _ 75, 17
0000036B        mov     eax, 65535                      ; 036B _ B8, 0000FFFF
00000370        mov     qword ptr [rbp-0D8H], rax       ; 0370 _ 48: 89. 85, FFFFFF28
00000377        mov     r13d, 2                         ; 0377 _ 41: BD, 00000002
0000037D        jmp     ?_012                           ; 037D _ E9, 000000B8

?_005:
00000382        mov     rcx, rdx                        ; 0382 _ 48: 89. D1
00000385        mov     rdi, rdx                        ; 0385 _ 48: 89. D7
00000388        call    _StrSize                        ; 0388 _ E8, 00001306
0000038D        test    rax, rax                        ; 038D _ 48: 85. C0
00000390        jz      ?_006                           ; 0390 _ 74, 17
00000392        mov     eax, 65535                      ; 0392 _ B8, 0000FFFF
00000397        mov     qword ptr [rbp-0D8H], rax       ; 0397 _ 48: 89. 85, FFFFFF28
0000039E        mov     r13d, 2                         ; 039E _ 41: BD, 00000002
000003A4        jmp     ?_011                           ; 03A4 _ E9, 0000008E

?_006:
000003A9        lea     rcx, ptr [?_324]                ; 03A9 _ 48: 8D. 0D, 00003806(rel)
000003B0        lea     r8, ptr [?_326]                 ; 03B0 _ 4C: 8D. 05, 00003878(rel)
000003B7        mov     edx, 397                        ; 03B7 _ BA, 0000018D
000003BC        call    _DebugAssert                    ; 03BC _ E8, 00001A44
000003C1        mov     r13d, 2                         ; 03C1 _ 41: BD, 00000002
000003C7        mov     eax, 65535                      ; 03C7 _ B8, 0000FFFF
000003CC        jmp     ?_010                           ; 03CC _ EB, 62

?_007:
000003CE        test    al, al                          ; 03CE _ 84. C0
000003D0        mov     rdx, rdi                        ; 03D0 _ 48: 89. FA
000003D3        jnz     ?_008                           ; 03D3 _ 75, 14
000003D5        mov     eax, 255                        ; 03D5 _ B8, 000000FF
000003DA        mov     qword ptr [rbp-0D8H], rax       ; 03DA _ 48: 89. 85, FFFFFF28
000003E1        mov     r13d, 1                         ; 03E1 _ 41: BD, 00000001
000003E7        jmp     ?_012                           ; 03E7 _ EB, 51

?_008:
000003E9        mov     rcx, rdx                        ; 03E9 _ 48: 89. D1
000003EC        mov     rdi, rdx                        ; 03EC _ 48: 89. D7
000003EF        call    _AsciiStrSize                   ; 03EF _ E8, 000012B7
000003F4        test    rax, rax                        ; 03F4 _ 48: 85. C0
000003F7        jz      ?_009                           ; 03F7 _ 74, 14
000003F9        mov     eax, 255                        ; 03F9 _ B8, 000000FF
000003FE        mov     qword ptr [rbp-0D8H], rax       ; 03FE _ 48: 89. 85, FFFFFF28
00000405        mov     r13d, 1                         ; 0405 _ 41: BD, 00000001
0000040B        jmp     ?_011                           ; 040B _ EB, 2A

?_009:
0000040D        lea     rcx, ptr [?_324]                ; 040D _ 48: 8D. 0D, 000037A2(rel)
00000414        lea     r8, ptr [?_327]                 ; 0414 _ 4C: 8D. 05, 00003835(rel)
0000041B        mov     edx, 405                        ; 041B _ BA, 00000195
00000420        call    _DebugAssert                    ; 0420 _ E8, 000019E0
00000425        mov     r13d, 1                         ; 0425 _ 41: BD, 00000001
0000042B        mov     eax, 255                        ; 042B _ B8, 000000FF
?_010:
00000430        mov     qword ptr [rbp-0D8H], rax       ; 0430 _ 48: 89. 85, FFFFFF28
?_011:
00000437        mov     rdx, rdi                        ; 0437 _ 48: 89. FA
?_012:
0000043A        movzx   ecx, byte ptr [rdx]             ; 043A _ 0F B6. 0A
0000043D        movzx   edi, byte ptr [rdx+1H]          ; 043D _ 0F B6. 7A, 01
00000441        mov     rbx, rdx                        ; 0441 _ 48: 89. D3
00000444        shl     rdi, 8                          ; 0444 _ 48: C1. E7, 08
00000448        or      rdi, rcx                        ; 0448 _ 48: 09. CF
0000044B        mov     rcx, r13                        ; 044B _ 4C: 89. E9
0000044E        neg     rcx                             ; 044E _ 48: F7. D9
00000451        mov     qword ptr [rbp-0C8H], rcx       ; 0451 _ 48: 89. 8D, FFFFFF38
00000458        lea     rcx, ptr [r13+1H]               ; 0458 _ 49: 8D. 4D, 01
0000045C        mov     qword ptr [rbp-0B0H], rcx       ; 045C _ 48: 89. 8D, FFFFFF50
00000463        xor     eax, eax                        ; 0463 _ 31. C0
00000465        mov     r9, rsi                         ; 0465 _ 49: 89. F1
00000468        mov     qword ptr [rbp-0F8H], r9        ; 0468 _ 4C: 89. 8D, FFFFFF08
0000046F        jmp     ?_018                           ; 046F _ E9, 00000086

?_013:
00000474        test    rsi, rsi                        ; 0474 _ 48: 85. F6
00000477        mov     rdx, qword ptr [rbp-0E0H]       ; 0477 _ 48: 8B. 95, FFFFFF20
0000047E        je      ?_126                           ; 047E _ 0F 84, 00000E28
00000484        sub     rcx, rdx                        ; 0484 _ 48: 29. D1
00000487        test    rcx, rcx                        ; 0487 _ 48: 85. C9
0000048A        jle     ?_126                           ; 048A _ 0F 8E, 00000E1C
00000490        cmp     rsi, r9                         ; 0490 _ 4C: 39. CE
00000493        jnc     ?_126                           ; 0493 _ 0F 83, 00000E13
00000499        inc     rsi                             ; 0499 _ 48: FF. C6
0000049C        mov     ebx, 1                          ; 049C _ BB, 00000001
?_014:
000004A1        mov     byte ptr [rsi-1H], 32           ; 04A1 _ C6. 46, FF, 20
000004A5        cmp     qword ptr [rbp-78H], 0          ; 04A5 _ 48: 83. 7D, 88, 00
000004AA        jz      ?_015                           ; 04AA _ 74, 03
000004AC        mov     byte ptr [rsi], 0               ; 04AC _ C6. 06, 00
?_015:
000004AF        lea     rdx, ptr [rsi+r10]              ; 04AF _ 4A: 8D. 14 16
000004B3        cmp     rbx, rcx                        ; 04B3 _ 48: 39. CB
000004B6        jge     ?_016                           ; 04B6 _ 7D, 12
000004B8        add     rsi, qword ptr [rbp-90H]        ; 04B8 _ 48: 03. B5, FFFFFF70
000004BF        inc     rbx                             ; 04BF _ 48: FF. C3
000004C2        cmp     rsi, r9                         ; 04C2 _ 4C: 39. CE
000004C5        mov     rsi, rdx                        ; 04C5 _ 48: 89. D6
000004C8        jc      ?_014                           ; 04C8 _ 72, D7
?_016:
000004CA        dec     rdx                             ; 04CA _ 48: FF. CA
000004CD        mov     qword ptr [rbp-0C0H], rdx       ; 04CD _ 48: 89. 95, FFFFFF40
?_017:
000004D4        mov     qword ptr [rbp-98H], r10        ; 04D4 _ 4C: 89. 95, FFFFFF68
000004DB        mov     rdx, qword ptr [rbp-0E8H]       ; 04DB _ 48: 8B. 95, FFFFFF18
000004E2        movzx   ecx, byte ptr [rdx+r13]         ; 04E2 _ 42: 0F B6. 0C 2A
000004E7        movzx   edi, byte ptr [rdx+r13+1H]      ; 04E7 _ 42: 0F B6. 7C 2A, 01
000004ED        shl     rdi, 8                          ; 04ED _ 48: C1. E7, 08
000004F1        or      rdi, rcx                        ; 04F1 _ 48: 09. CF
000004F4        add     rdx, r13                        ; 04F4 _ 4C: 01. EA
000004F7        mov     rbx, rdx                        ; 04F7 _ 48: 89. D3
?_018:
000004FA        and     rdi, qword ptr [rbp-0D8H]       ; 04FA _ 48: 23. BD, FFFFFF28
00000501        mov     qword ptr [rbp-68H], rdi        ; 0501 _ 48: 89. 7D, 98
00000505        test    rdi, rdi                        ; 0505 _ 48: 85. FF
00000508        je      ?_127                           ; 0508 _ 0F 84, 00000DAA
0000050E        cmp     qword ptr [rbp-0C0H], 0         ; 050E _ 48: 83. BD, FFFFFF40, 00
00000516        jz      ?_019                           ; 0516 _ 74, 0D
00000518        cmp     qword ptr [rbp-0C0H], r9        ; 0518 _ 4C: 39. 8D, FFFFFF40
0000051F        jnc     ?_127                           ; 051F _ 0F 83, 00000D93
?_019:
00000525        mov     qword ptr [rbp-0F0H], rax       ; 0525 _ 48: 89. 85, FFFFFF10
0000052C        and     r14, 2140H                      ; 052C _ 49: 81. E6, 00002140
00000533        cmp     rdi, 10                         ; 0533 _ 48: 83. FF, 0A
00000537        je      ?_083                           ; 0537 _ 0F 84, 000008D7
0000053D        cmp     rdi, 13                         ; 053D _ 48: 83. FF, 0D
00000541        mov     r9, qword ptr [rbp-0D8H]        ; 0541 _ 4C: 8B. 8D, FFFFFF28
00000548        je      ?_082                           ; 0548 _ 0F 84, 00000871
0000054E        cmp     rdi, 37                         ; 054E _ 48: 83. FF, 25
00000552        jne     ?_084                           ; 0552 _ 0F 85, 0000090D
00000558        xor     r11d, r11d                      ; 0558 _ 45: 31. DB
0000055B        mov     r12d, 1                         ; 055B _ 41: BC, 00000001
00000561        mov     rax, rbx                        ; 0561 _ 48: 89. D8
00000564        mov     r15, r11                        ; 0564 _ 4D: 89. DF
00000567        mov     rsi, qword ptr [rbp+30H]        ; 0567 _ 48: 8B. 75, 30
0000056B        mov     r8, rsi                         ; 056B _ 49: 89. F0
0000056E        mov     rsi, qword ptr [rbp-0A8H]       ; 056E _ 48: 8B. B5, FFFFFF58
00000575        lea     r10, ptr [?_134]                ; 0575 _ 4C: 8D. 15, 00000E30(rel)
0000057C        jmp     ?_024                           ; 057C _ E9, 00000098

?_020:
00000581        cmp     rcx, 107                        ; 0581 _ 48: 83. F9, 6B
00000585        jg      ?_034                           ; 0585 _ 0F 8F, 000001BD
0000058B        cmp     rcx, 75                         ; 058B _ 48: 83. F9, 4B
0000058F        jg      ?_027                           ; 058F _ 0F 8F, 00000138
00000595        lea     rdx, ptr [rcx-20H]              ; 0595 _ 48: 8D. 51, E0
00000599        cmp     rdx, 25                         ; 0599 _ 48: 83. FA, 19
0000059D        ja      ?_035                           ; 059D _ 0F 87, 000001AB
000005A3        jmp     ?_026                           ; 05A3 _ E9, 000000DD

000005A8        lea     rdx, ptr [rcx-30H]              ; 05A8 _ 48: 8D. 51, D0
; Note: No jump seems to point here
000005AC        xor     r15d, r15d                      ; 05AC _ 45: 31. FF
000005AF        cmp     rdx, 9                          ; 05AF _ 48: 83. FA, 09
000005B3        ja      ?_023                           ; 05B3 _ 77, 38
?_021:
000005B5        xor     r15d, r15d                      ; 05B5 _ 45: 31. FF
?_022:
000005B8        movzx   ebx, byte ptr [rax+r13*2]       ; 05B8 _ 42: 0F B6. 1C 68
000005BD        movzx   edx, byte ptr [rax+r13*2+1H]    ; 05BD _ 42: 0F B6. 54 68, 01
000005C3        shl     rdx, 8                          ; 05C3 _ 48: C1. E2, 08
000005C7        or      edx, ebx                        ; 05C7 _ 09. DA
000005C9        and     rdx, r9                         ; 05C9 _ 4C: 21. CA
000005CC        mov     qword ptr [rbp-68H], rdx        ; 05CC _ 48: 89. 55, 98
000005D0        lea     rbx, ptr [rdx-30H]              ; 05D0 _ 48: 8D. 5A, D0
000005D4        add     rax, r13                        ; 05D4 _ 4C: 01. E8
000005D7        lea     rdi, ptr [r15+r15*4]            ; 05D7 _ 4B: 8D. 3C BF
000005DB        lea     r15, ptr [rcx+rdi*2-30H]        ; 05DB _ 4C: 8D. 7C 79, D0
000005E0        cmp     rbx, 10                         ; 05E0 _ 48: 83. FB, 0A
000005E4        mov     rcx, rdx                        ; 05E4 _ 48: 89. D1
000005E7        jc      ?_022                           ; 05E7 _ 72, CF
000005E9        lea     rbx, ptr [rax+r13]              ; 05E9 _ 4A: 8D. 1C 28
?_023:
000005ED        mov     rcx, r14                        ; 05ED _ 4C: 89. F1
000005F0        or      rcx, 200H                       ; 05F0 _ 48: 81. C9, 00000200
000005F7        mov     rax, r14                        ; 05F7 _ 4C: 89. F0
000005FA        and     rax, 800H                       ; 05FA _ 48: 25, 00000800
00000600        cmove   r14, rcx                        ; 0600 _ 4C: 0F 44. F1
00000604        cmovne  r12, r15                        ; 0604 _ 4D: 0F 45. E7
00000608        test    rax, rax                        ; 0608 _ 48: 85. C0
0000060B        cmove   r11, r15                        ; 060B _ 4D: 0F 44. DF
0000060F        add     rbx, qword ptr [rbp-0C8H]       ; 060F _ 48: 03. 9D, FFFFFF38
00000616        mov     rax, rbx                        ; 0616 _ 48: 89. D8
?_024:
00000619        movzx   edx, byte ptr [rax+r13]         ; 0619 _ 42: 0F B6. 14 28
0000061E        mov     rcx, qword ptr [rbp-0B0H]       ; 061E _ 48: 8B. 8D, FFFFFF50
00000625        movzx   ecx, byte ptr [rax+rcx]         ; 0625 _ 0F B6. 0C 08
00000629        shl     rcx, 8                          ; 0629 _ 48: C1. E1, 08
0000062D        or      ecx, edx                        ; 062D _ 09. D1
0000062F        and     rcx, r9                         ; 062F _ 4C: 21. C9
00000632        mov     qword ptr [rbp-68H], rcx        ; 0632 _ 48: 89. 4D, 98
00000636        lea     rbx, ptr [rax+r13]              ; 0636 _ 4A: 8D. 1C 28
0000063A        cmp     rcx, 31                         ; 063A _ 48: 83. F9, 1F
0000063E        jg      ?_020                           ; 063E _ 0F 8F, FFFFFF3D
00000644        test    rcx, rcx                        ; 0644 _ 48: 85. C9
00000647        jne     ?_035                           ; 0647 _ 0F 85, 00000101
0000064D        mov     qword ptr [rbp-0D0H], r11       ; 064D _ 4C: 89. 9D, FFFFFF30
00000654        mov     qword ptr [rbp-0A0H], 0         ; 0654 _ 48: C7. 85, FFFFFF60, 00000000
0000065F        mov     rbx, rax                        ; 065F _ 48: 89. C3

?_025   LABEL NEAR
00000662        mov     qword ptr [rbp-0A8H], rsi       ; 0662 _ 48: 89. B5, FFFFFF58
00000669        or      r14, 400H                       ; 0669 _ 49: 81. CE, 00000400
00000670        xor     al, al                          ; 0670 _ 30. C0
00000672        mov     dword ptr [rbp-7CH], eax        ; 0672 _ 89. 45, 84
00000675        xor     edi, edi                        ; 0675 _ 31. FF
00000677        xor     r10b, r10b                      ; 0677 _ 45: 30. D2
0000067A        xor     cl, cl                          ; 067A _ 30. C9
0000067C        lea     r12, ptr [rbp-68H]              ; 067C _ 4C: 8D. 65, 98
00000680        jmp     ?_086                           ; 0680 _ E9, 0000080F

?_026:
00000685        movsxd  rdx, dword ptr [r10+rdx*4]      ; 0685 _ 49: 63. 14 92
00000689        add     rdx, r10                        ; 0689 _ 4C: 01. D2
0000068C        jmp     rdx                             ; 068C _ FF. E2

0000068E        or      r14, 800H                       ; 068E _ 49: 81. CE, 00000800
; Note: No jump seems to point here
00000695        mov     rax, rbx                        ; 0695 _ 48: 89. D8
00000698        jmp     ?_024                           ; 0698 _ E9, FFFFFF7C

0000069D        or      r14, 1H                         ; 069D _ 49: 83. CE, 01
; Note: No jump seems to point here
000006A1        mov     rax, rbx                        ; 06A1 _ 48: 89. D8
000006A4        jmp     ?_024                           ; 06A4 _ E9, FFFFFF70

000006A9        or      r14, 2H                         ; 06A9 _ 49: 83. CE, 02
; Note: No jump seems to point here
000006AD        mov     rax, rbx                        ; 06AD _ 48: 89. D8
000006B0        jmp     ?_024                           ; 06B0 _ E9, FFFFFF64

000006B5        or      r14, 4H                         ; 06B5 _ 49: 83. CE, 04
; Note: No jump seems to point here
000006B9        mov     rax, rbx                        ; 06B9 _ 48: 89. D8
000006BC        jmp     ?_024                           ; 06BC _ E9, FFFFFF58

000006C1        or      r14, 8H                         ; 06C1 _ 49: 83. CE, 08
; Note: No jump seems to point here
000006C5        mov     rax, rbx                        ; 06C5 _ 48: 89. D8
000006C8        jmp     ?_024                           ; 06C8 _ E9, FFFFFF4C

?_027:
000006CD        cmp     rcx, 76                         ; 06CD _ 48: 83. F9, 4C
000006D1        jnz     ?_035                           ; 06D1 _ 75, 7B
?_028:
000006D3        or      r14, 10H                        ; 06D3 _ 49: 83. CE, 10
000006D7        mov     rax, rbx                        ; 06D7 _ 48: 89. D8
000006DA        jmp     ?_024                           ; 06DA _ E9, FFFFFF3A

000006DF        mov     rax, r14                        ; 06DF _ 4C: 89. F0
; Note: No jump seems to point here
000006E2        test    ah, 8H                          ; 06E2 _ F6. C4, 08
000006E5        jnz     ?_032                           ; 06E5 _ 75, 32
000006E7        or      r14, 200H                       ; 06E7 _ 49: 81. CE, 00000200
000006EE        test    rsi, rsi                        ; 06EE _ 48: 85. F6
000006F1        jnz     ?_030                           ; 06F1 _ 75, 17
000006F3        mov     rax, qword ptr [r8]             ; 06F3 _ 49: 8B. 00
000006F6        lea     rcx, ptr [rax+8H]               ; 06F6 _ 48: 8D. 48, 08
000006FA        mov     qword ptr [r8], rcx             ; 06FA _ 49: 89. 08
000006FD        mov     r11, qword ptr [rax]            ; 06FD _ 4C: 8B. 18
?_029:
00000700        xor     esi, esi                        ; 0700 _ 31. F6
00000702        mov     rax, rbx                        ; 0702 _ 48: 89. D8
00000705        jmp     ?_024                           ; 0705 _ E9, FFFFFF0F

?_030:
0000070A        mov     r11, qword ptr [rsi]            ; 070A _ 4C: 8B. 1E
?_031:
0000070D        add     rsi, 8                          ; 070D _ 48: 83. C6, 08
00000711        mov     rax, rbx                        ; 0711 _ 48: 89. D8
00000714        jmp     ?_024                           ; 0714 _ E9, FFFFFF00

?_032:
00000719        test    rsi, rsi                        ; 0719 _ 48: 85. F6
0000071C        jnz     ?_033                           ; 071C _ 75, 0F
0000071E        mov     rax, qword ptr [r8]             ; 071E _ 49: 8B. 00
00000721        lea     rcx, ptr [rax+8H]               ; 0721 _ 48: 8D. 48, 08
00000725        mov     qword ptr [r8], rcx             ; 0725 _ 49: 89. 08
00000728        mov     r12, qword ptr [rax]            ; 0728 _ 4C: 8B. 20
0000072B        jmp     ?_029                           ; 072B _ EB, D3

?_033:
0000072D        mov     r12, qword ptr [rsi]            ; 072D _ 4C: 8B. 26
00000730        jmp     ?_031                           ; 0730 _ EB, DB

00000732        mov     rdx, r14                        ; 0732 _ 4C: 89. F2
; Note: No jump seems to point here
00000735        or      rdx, 20H                        ; 0735 _ 48: 83. CA, 20
00000739        mov     rbx, r14                        ; 0739 _ 4C: 89. F3
0000073C        test    bh, 8H                          ; 073C _ F6. C7, 08
0000073F        cmove   r14, rdx                        ; 073F _ 4C: 0F 44. F2
00000743        jmp     ?_021                           ; 0743 _ E9, FFFFFE6D

?_034:
00000748        cmp     rcx, 108                        ; 0748 _ 48: 83. F9, 6C
0000074C        jz      ?_028                           ; 074C _ 74, 85
?_035:
0000074E        mov     qword ptr [rbp-0A0H], r12       ; 074E _ 4C: 89. A5, FFFFFF60
00000755        mov     qword ptr [rbp-0D0H], r11       ; 0755 _ 4C: 89. 9D, FFFFFF30
0000075C        cmp     rcx, 82                         ; 075C _ 48: 83. F9, 52
00000760        jg      ?_036                           ; 0760 _ 7F, 69
00000762        cmp     rcx, 10                         ; 0762 _ 48: 83. F9, 0A
00000766        je      ?_081                           ; 0766 _ 0F 84, 00000604
0000076C        cmp     rcx, 13                         ; 076C _ 48: 83. F9, 0D
00000770        jne     ?_025                           ; 0770 _ 0F 85, FFFFFEEC
00000776        mov     qword ptr [rbp-0A8H], rsi       ; 0776 _ 48: 89. B5, FFFFFF58
0000077D        movzx   edx, byte ptr [rax+r13*2]       ; 077D _ 42: 0F B6. 14 68
00000782        mov     rcx, qword ptr [rbp-0B0H]       ; 0782 _ 48: 8B. 8D, FFFFFF50
00000789        lea     rcx, ptr [r13+rcx]              ; 0789 _ 49: 8D. 4C 0D, 00
0000078E        movzx   ecx, byte ptr [rax+rcx]         ; 078E _ 0F B6. 0C 08
00000792        shl     rcx, 8                          ; 0792 _ 48: C1. E1, 08
00000796        or      ecx, edx                        ; 0796 _ 09. D1
00000798        xor     dl, dl                          ; 0798 _ 30. D2
0000079A        xor     edi, edi                        ; 079A _ 31. FF
0000079C        lea     rax, ptr [rax+r13*2]            ; 079C _ 4A: 8D. 04 68
000007A0        and     rcx, r9                         ; 07A0 _ 4C: 21. C9
000007A3        mov     qword ptr [rbp-68H], rcx        ; 07A3 _ 48: 89. 4D, 98
000007A7        cmp     rcx, 10                         ; 07A7 _ 48: 83. F9, 0A
000007AB        cmove   rbx, rax                        ; 07AB _ 48: 0F 44. D8
000007AF        lea     r12, ptr [?_335]                ; 07AF _ 4C: 8D. 25, 0000352E(rel)
000007B6        lea     rax, ptr [?_334]                ; 07B6 _ 48: 8D. 05, 00003524(rel)
000007BD        cmove   r12, rax                        ; 07BD _ 4C: 0F 44. E0
000007C1        mov     r10b, dl                        ; 07C1 _ 41: 88. D2
000007C4        mov     cl, dl                          ; 07C4 _ 88. D1
000007C6        jmp     ?_079                           ; 07C6 _ E9, 00000568

?_036:
000007CB        cmp     rcx, 111                        ; 07CB _ 48: 83. F9, 6F
000007CF        jg      ?_038                           ; 07CF _ 7F, 3A
000007D1        cmp     rcx, 96                         ; 07D1 _ 48: 83. F9, 60
000007D5        jg      ?_037                           ; 07D5 _ 7F, 16
000007D7        cmp     rcx, 83                         ; 07D7 _ 48: 83. F9, 53
000007DB        je      ?_057                           ; 07DB _ 0F 84, 00000256
000007E1        cmp     rcx, 88                         ; 07E1 _ 48: 83. F9, 58
000007E5        jne     ?_025                           ; 07E5 _ 0F 85, FFFFFE77
000007EB        jmp     ?_040                           ; 07EB _ EB, 44

?_037:
000007ED        add     rcx, -97                        ; 07ED _ 48: 83. C1, 9F
000007F1        cmp     rcx, 6                          ; 07F1 _ 48: 83. F9, 06
000007F5        ja      ?_025                           ; 07F5 _ 0F 87, FFFFFE67
000007FB        lea     rdx, ptr [?_136]                ; 07FB _ 48: 8D. 15, 00000C36(rel)
00000802        movsxd  rax, dword ptr [rdx+rcx*4]      ; 0802 _ 48: 63. 04 8A
00000806        add     rax, rdx                        ; 0806 _ 48: 01. D0
00000809        jmp     rax                             ; 0809 _ FF. E0

?_038:
0000080B        add     rcx, -112                       ; 080B _ 48: 83. C1, 90
0000080F        cmp     rcx, 8                          ; 080F _ 48: 83. F9, 08
00000813        ja      ?_025                           ; 0813 _ 0F 87, FFFFFE49
00000819        lea     rdx, ptr [?_135]                ; 0819 _ 48: 8D. 15, 00000BF4(rel)
00000820        movsxd  rax, dword ptr [rdx+rcx*4]      ; 0820 _ 48: 63. 04 8A
00000824        add     rax, rdx                        ; 0824 _ 48: 01. D0
00000827        jmp     rax                             ; 0827 _ FF. E0

?_039   LABEL NEAR
00000829        and     r14, 0FFFFFFC9H                 ; 0829 _ 49: 83. E6, C9
0000082D        or      r14, 10H                        ; 082D _ 49: 83. CE, 10
?_040:
00000831        or      r14, 20H                        ; 0831 _ 49: 83. CE, 20

?_041   LABEL NEAR
00000835        or      r14, 80H                        ; 0835 _ 49: 81. CE, 00000080

?_042   LABEL NEAR
0000083C        test    r14b, 0FFFFFF80H                ; 083C _ 41: F6. C6, 80
00000840        jnz     ?_043                           ; 0840 _ 75, 0E
00000842        and     r14, 0FFFFBFFDH                 ; 0842 _ 49: 81. E6, FFFFBFFD
00000849        or      r14, 4000H                      ; 0849 _ 49: 81. CE, 00004000

?_043   LABEL NEAR
00000850        mov     rcx, r14                        ; 0850 _ 4C: 89. F1
00000853        mov     r12, r9                         ; 0853 _ 4D: 89. CC
00000856        and     rcx, 10H                        ; 0856 _ 48: 83. E1, 10
0000085A        jnz     ?_045                           ; 085A _ 75, 1B
0000085C        test    rsi, rsi                        ; 085C _ 48: 85. F6
0000085F        jnz     ?_044                           ; 085F _ 75, 11
00000861        mov     rax, qword ptr [r8]             ; 0861 _ 49: 8B. 00
00000864        lea     rdx, ptr [rax+8H]               ; 0864 _ 48: 8D. 50, 08
00000868        mov     qword ptr [r8], rdx             ; 0868 _ 49: 89. 10
0000086B        movsxd  rax, dword ptr [rax]            ; 086B _ 48: 63. 00
0000086E        xor     esi, esi                        ; 086E _ 31. F6
00000870        jmp     ?_048                           ; 0870 _ EB, 22

?_044:
00000872        movsxd  rax, dword ptr [rsi]            ; 0872 _ 48: 63. 06
00000875        jmp     ?_047                           ; 0875 _ EB, 19

?_045:
00000877        test    rsi, rsi                        ; 0877 _ 48: 85. F6
0000087A        jnz     ?_046                           ; 087A _ 75, 11
0000087C        mov     rax, qword ptr [r8]             ; 087C _ 49: 8B. 00
0000087F        lea     rdx, ptr [rax+8H]               ; 087F _ 48: 8D. 50, 08
00000883        mov     qword ptr [r8], rdx             ; 0883 _ 49: 89. 10
00000886        mov     rax, qword ptr [rax]            ; 0886 _ 48: 8B. 00
00000889        xor     esi, esi                        ; 0889 _ 31. F6
0000088B        jmp     ?_048                           ; 088B _ EB, 07

?_046:
0000088D        mov     rax, qword ptr [rsi]            ; 088D _ 48: 8B. 06
?_047:
00000890        add     rsi, 8                          ; 0890 _ 48: 83. C6, 08
?_048:
00000894        test    r14b, 2H                        ; 0894 _ 41: F6. C6, 02
00000898        jnz     ?_049                           ; 0898 _ 75, 0B
0000089A        mov     edx, r14d                       ; 089A _ 44: 89. F2
0000089D        and     edx, 4H                         ; 089D _ 83. E2, 04
000008A0        shl     dl, 3                           ; 08A0 _ C0. E2, 03
000008A3        jmp     ?_050                           ; 08A3 _ EB, 02

?_049:
000008A5        mov     dl, 43                          ; 08A5 _ B2, 2B
?_050:
000008A7        mov     dword ptr [rbp-0B4H], edx       ; 08A7 _ 89. 95, FFFFFF4C
000008AD        mov     qword ptr [rbp-0A8H], rsi       ; 08AD _ 48: 89. B5, FFFFFF58
000008B4        test    r14b, 0FFFFFF80H                ; 08B4 _ 41: F6. C6, 80
000008B8        jne     ?_052                           ; 08B8 _ 0F 85, 00000083
000008BE        mov     rcx, r14                        ; 08BE _ 4C: 89. F1
000008C1        and     rcx, 8H                         ; 08C1 _ 48: 83. E1, 08
000008C5        mov     edx, ecx                        ; 08C5 _ 89. CA
000008C7        shr     edx, 3                          ; 08C7 _ C1. EA, 03
000008CA        xor     edx, 1H                         ; 08CA _ 83. F2, 01
000008CD        xor     dl, 1H                          ; 08CD _ 80. F2, 01
000008D0        mov     dword ptr [rbp-7CH], edx        ; 08D0 _ 89. 55, 84
000008D3        mov     rdx, r14                        ; 08D3 _ 4C: 89. F2
000008D6        and     rdx, 0FFFFFFDFH                 ; 08D6 _ 48: 83. E2, DF
000008DA        test    rcx, rcx                        ; 08DA _ 48: 85. C9
000008DD        cmove   rdx, r14                        ; 08DD _ 49: 0F 44. D6
000008E1        mov     r14, rdx                        ; 08E1 _ 49: 89. D6
000008E4        mov     ecx, 1                          ; 08E4 _ B9, 00000001
000008E9        mov     rdx, qword ptr [rbp-0A0H]       ; 08E9 _ 48: 8B. 95, FFFFFF60
000008F0        cmovne  rdx, rcx                        ; 08F0 _ 48: 0F 45. D1
000008F4        mov     qword ptr [rbp-0A0H], rdx       ; 08F4 _ 48: 89. 95, FFFFFF60
000008FB        test    rax, rax                        ; 08FB _ 48: 85. C0
000008FE        jns     ?_051                           ; 08FE _ 79, 22
00000900        mov     rcx, r14                        ; 0900 _ 4C: 89. F1
00000903        test    ch, 40H                         ; 0903 _ F6. C5, 40
00000906        jnz     ?_051                           ; 0906 _ 75, 1A
00000908        neg     rax                             ; 0908 _ 48: F7. D8
0000090B        or      r14, 2H                         ; 090B _ 49: 83. CE, 02
0000090F        mov     cl, 45                          ; 090F _ B1, 2D
00000911        mov     dword ptr [rbp-0B4H], ecx       ; 0911 _ 89. 8D, FFFFFF4C
00000917        mov     r8d, 10                         ; 0917 _ 41: B8, 0000000A
0000091D        mov     rsi, rax                        ; 091D _ 48: 89. C6
00000920        jmp     ?_053                           ; 0920 _ EB, 3E

?_051:
00000922        mov     esi, eax                        ; 0922 _ 89. C6
00000924        mov     rcx, r14                        ; 0924 _ 4C: 89. F1
00000927        and     rcx, 4010H                      ; 0927 _ 48: 81. E1, 00004010
0000092E        cmp     rcx, 16384                      ; 092E _ 48: 81. F9, 00004000
00000935        cmovne  rsi, rax                        ; 0935 _ 48: 0F 45. F0
00000939        mov     r8d, 10                         ; 0939 _ 41: B8, 0000000A
0000093F        jmp     ?_053                           ; 093F _ EB, 1F

?_052:
00000941        mov     esi, eax                        ; 0941 _ 89. C6
00000943        test    rax, rax                        ; 0943 _ 48: 85. C0
00000946        sets    dl                              ; 0946 _ 0F 98. C2
00000949        test    rcx, rcx                        ; 0949 _ 48: 85. C9
0000094C        sete    cl                              ; 094C _ 0F 94. C1
0000094F        test    dl, cl                          ; 094F _ 84. CA
00000951        cmove   rsi, rax                        ; 0951 _ 48: 0F 44. F0
00000955        xor     al, al                          ; 0955 _ 30. C0
00000957        mov     dword ptr [rbp-7CH], eax        ; 0957 _ 89. 45, 84
0000095A        mov     r8d, 16                         ; 095A _ 41: B8, 00000010
?_053:
00000960        lea     rdi, ptr [rbp-60H]              ; 0960 _ 48: 8D. 7D, A0
00000964        mov     rcx, rdi                        ; 0964 _ 48: 89. F9
00000967        mov     rdx, rsi                        ; 0967 _ 48: 89. F2
0000096A        call    _BasePrintLibValueToString      ; 096A _ E8, FFFFF8D9
0000096F        mov     rcx, rax                        ; 096F _ 48: 89. C1
00000972        sub     rcx, rdi                        ; 0972 _ 48: 29. F9
00000975        or      rsi, qword ptr [rbp-0A0H]       ; 0975 _ 48: 0B. B5, FFFFFF60
0000097C        mov     esi, 0                          ; 097C _ BE, 00000000
00000981        cmove   rcx, rsi                        ; 0981 _ 48: 0F 44. CE
00000985        mov     rax, rcx                        ; 0985 _ 48: 89. C8
00000988        mov     rdx, 0AAAAAAABH                 ; 0988 _ 48: BA, AAAAAAAAAAAAAAAB
00000992        mul     rdx                             ; 0992 _ 48: F7. E2
00000995        shr     rdx, 1                          ; 0995 _ 48: D1. EA
00000998        lea     rax, ptr [rdx+rdx*2]            ; 0998 _ 48: 8D. 04 52
0000099C        mov     rdi, rcx                        ; 099C _ 48: 89. CF
0000099F        sub     rdi, rax                        ; 099F _ 48: 29. C7
000009A2        xor     rdi, 3H                         ; 09A2 _ 48: 83. F7, 03
000009A6        mov     rdx, rcx                        ; 09A6 _ 48: 89. CA
000009A9        sub     rdx, rax                        ; 09A9 _ 48: 29. C2
000009AC        cmove   rdi, rsi                        ; 09AC _ 48: 0F 44. FE
000009B0        mov     eax, dword ptr [rbp-7CH]        ; 09B0 _ 8B. 45, 84
000009B3        test    al, al                          ; 09B3 _ 84. C0
000009B5        mov     r15, rcx                        ; 09B5 _ 49: 89. CF
000009B8        jz      ?_054                           ; 09B8 _ 74, 22
000009BA        test    rcx, rcx                        ; 09BA _ 48: 85. C9
000009BD        mov     r15, rcx                        ; 09BD _ 49: 89. CF
000009C0        jz      ?_054                           ; 09C0 _ 74, 1A
000009C2        lea     rax, ptr [rcx-1H]               ; 09C2 _ 48: 8D. 41, FF
000009C6        mov     rdx, 0AAAAAAABH                 ; 09C6 _ 48: BA, AAAAAAAAAAAAAAAB
000009D0        mul     rdx                             ; 09D0 _ 48: F7. E2
000009D3        mov     r15, rdx                        ; 09D3 _ 49: 89. D7
000009D6        shr     r15, 1                          ; 09D6 _ 49: D1. EF
000009D9        add     r15, rcx                        ; 09D9 _ 49: 01. CF
?_054:
000009DC        mov     eax, dword ptr [rbp-0B4H]       ; 09DC _ 8B. 85, FFFFFF4C
000009E2        test    al, al                          ; 09E2 _ 84. C0
000009E4        mov     r9, r12                         ; 09E4 _ 4D: 89. E1
000009E7        jnz     ?_055                           ; 09E7 _ 75, 09
000009E9        mov     rdx, qword ptr [rbp-0A0H]       ; 09E9 _ 48: 8B. 95, FFFFFF60
000009F0        jmp     ?_056                           ; 09F0 _ EB, 0D

?_055:
000009F2        mov     rdx, qword ptr [rbp-0A0H]       ; 09F2 _ 48: 8B. 95, FFFFFF60
000009F9        inc     rdx                             ; 09F9 _ 48: FF. C2
000009FC        inc     r15                             ; 09FC _ 49: FF. C7
?_056:
000009FF        lea     r12, ptr [rbp+rcx-60H]          ; 09FF _ 4C: 8D. 64 0D, A0
00000A04        mov     rax, r14                        ; 0A04 _ 4C: 89. F0
00000A07        and     rax, 0A21H                      ; 0A07 _ 48: 25, 00000A21
00000A0D        cmp     rax, 544                        ; 0A0D _ 48: 3D, 00000220
00000A13        cmove   rdx, qword ptr [rbp-0D0H]       ; 0A13 _ 48: 0F 44. 95, FFFFFF30
00000A1B        mov     qword ptr [rbp-0A0H], rdx       ; 0A1B _ 48: 89. 95, FFFFFF60
00000A22        or      r14, 1000H                      ; 0A22 _ 49: 81. CE, 00001000
00000A29        mov     r10b, 1                         ; 0A29 _ 41: B2, 01
00000A2C        mov     ecx, dword ptr [rbp-0B4H]       ; 0A2C _ 8B. 8D, FFFFFF4C
00000A32        jmp     ?_086                           ; 0A32 _ E9, 0000045D

?_057   LABEL NEAR
00000A37        or      r14, 400H                       ; 0A37 _ 49: 81. CE, 00000400

?_058   LABEL NEAR
00000A3E        test    rsi, rsi                        ; 0A3E _ 48: 85. F6
00000A41        jnz     ?_059                           ; 0A41 _ 75, 17
00000A43        mov     rax, qword ptr [r8]             ; 0A43 _ 49: 8B. 00
00000A46        lea     rcx, ptr [rax+8H]               ; 0A46 _ 48: 8D. 48, 08
00000A4A        mov     qword ptr [r8], rcx             ; 0A4A _ 49: 89. 08
00000A4D        mov     qword ptr [rbp-0A8H], 0         ; 0A4D _ 48: C7. 85, FFFFFF58, 00000000
00000A58        jmp     ?_060                           ; 0A58 _ EB, 0E

?_059:
00000A5A        lea     rcx, ptr [rsi+8H]               ; 0A5A _ 48: 8D. 4E, 08
00000A5E        mov     rax, rsi                        ; 0A5E _ 48: 89. F0
00000A61        mov     qword ptr [rbp-0A8H], rcx       ; 0A61 _ 48: 89. 8D, FFFFFF58
?_060:
00000A68        mov     rcx, r14                        ; 0A68 _ 4C: 89. F1
00000A6B        and     rcx, 0FFFFFBFFH                 ; 0A6B _ 48: 81. E1, FFFFFBFF
00000A72        mov     r12, qword ptr [rax]            ; 0A72 _ 4C: 8B. 20
00000A75        test    r12, r12                        ; 0A75 _ 4D: 85. E4
00000A78        lea     rax, ptr [?_328]                ; 0A78 _ 48: 8D. 05, 000031EC(rel)
00000A7F        cmove   r12, rax                        ; 0A7F _ 4C: 0F 44. E0
00000A83        cmove   r14, rcx                        ; 0A83 _ 4C: 0F 44. F1
00000A87        mov     rax, r14                        ; 0A87 _ 4C: 89. F0
00000A8A        shl     rax, 52                         ; 0A8A _ 48: C1. E0, 34
00000A8E        sar     rax, 63                         ; 0A8E _ 48: C1. F8, 3F
00000A92        and     qword ptr [rbp-0A0H], rax       ; 0A92 _ 48: 21. 85, FFFFFF60
00000A99        xor     al, al                          ; 0A99 _ 30. C0
00000A9B        xor     edi, edi                        ; 0A9B _ 31. FF
00000A9D        jmp     ?_078                           ; 0A9D _ E9, 0000028C

?_061   LABEL NEAR
00000AA2        test    rsi, rsi                        ; 0AA2 _ 48: 85. F6
00000AA5        jnz     ?_062                           ; 0AA5 _ 75, 17
00000AA7        mov     rax, qword ptr [r8]             ; 0AA7 _ 49: 8B. 00
00000AAA        lea     rcx, ptr [rax+8H]               ; 0AAA _ 48: 8D. 48, 08
00000AAE        mov     qword ptr [r8], rcx             ; 0AAE _ 49: 89. 08
00000AB1        mov     qword ptr [rbp-0A8H], 0         ; 0AB1 _ 48: C7. 85, FFFFFF58, 00000000
00000ABC        jmp     ?_063                           ; 0ABC _ EB, 0E

?_062:
00000ABE        lea     rcx, ptr [rsi+8H]               ; 0ABE _ 48: 8D. 4E, 08
00000AC2        mov     rax, rsi                        ; 0AC2 _ 48: 89. F0
00000AC5        mov     qword ptr [rbp-0A8H], rcx       ; 0AC5 _ 48: 89. 8D, FFFFFF58
?_063:
00000ACC        mov     rax, qword ptr [rax]            ; 0ACC _ 48: 8B. 00
00000ACF        mov     ecx, 65535                      ; 0ACF _ B9, 0000FFFF
00000AD4        and     rax, rcx                        ; 0AD4 _ 48: 21. C8
00000AD7        mov     qword ptr [rbp-70H], rax        ; 0AD7 _ 48: 89. 45, 90
00000ADB        or      r14, 400H                       ; 0ADB _ 49: 81. CE, 00000400
00000AE2        xor     al, al                          ; 0AE2 _ 30. C0
00000AE4        xor     edi, edi                        ; 0AE4 _ 31. FF
00000AE6        mov     r10b, al                        ; 0AE6 _ 41: 88. C2
00000AE9        mov     cl, al                          ; 0AE9 _ 88. C1
00000AEB        xor     al, al                          ; 0AEB _ 30. C0
00000AED        mov     dword ptr [rbp-7CH], eax        ; 0AED _ 89. 45, 84
00000AF0        lea     r12, ptr [rbp-70H]              ; 0AF0 _ 4C: 8D. 65, 90
00000AF4        jmp     ?_086                           ; 0AF4 _ E9, 0000039B

?_064   LABEL NEAR
00000AF9        test    rsi, rsi                        ; 0AF9 _ 48: 85. F6
00000AFC        jnz     ?_065                           ; 0AFC _ 75, 0E
00000AFE        mov     rsi, qword ptr [r8]             ; 0AFE _ 49: 8B. 30
00000B01        lea     rax, ptr [rsi+8H]               ; 0B01 _ 48: 8D. 46, 08
00000B05        mov     qword ptr [r8], rax             ; 0B05 _ 49: 89. 00
00000B08        xor     eax, eax                        ; 0B08 _ 31. C0
00000B0A        jmp     ?_066                           ; 0B0A _ EB, 04

?_065:
00000B0C        lea     rax, ptr [rsi+8H]               ; 0B0C _ 48: 8D. 46, 08
?_066:
00000B10        mov     qword ptr [rbp-88H], rax        ; 0B10 _ 48: 89. 85, FFFFFF78
00000B17        mov     r12, qword ptr [rsi]            ; 0B17 _ 4C: 8B. 26
00000B1A        test    r12, r12                        ; 0B1A _ 4D: 85. E4
00000B1D        jnz     ?_068                           ; 0B1D _ 75, 28
00000B1F        xor     edi, edi                        ; 0B1F _ 31. FF
00000B21        xor     al, al                          ; 0B21 _ 30. C0
00000B23        mov     r10b, al                        ; 0B23 _ 41: 88. C2
00000B26        mov     cl, al                          ; 0B26 _ 88. C1
00000B28        xor     al, al                          ; 0B28 _ 30. C0
00000B2A        mov     dword ptr [rbp-7CH], eax        ; 0B2A _ 89. 45, 84
00000B2D        lea     r12, ptr [?_329]                ; 0B2D _ 4C: 8D. 25, 00003145(rel)
?_067:
00000B34        mov     rax, qword ptr [rbp-88H]        ; 0B34 _ 48: 8B. 85, FFFFFF78
00000B3B        mov     qword ptr [rbp-0A8H], rax       ; 0B3B _ 48: 89. 85, FFFFFF58
00000B42        jmp     ?_086                           ; 0B42 _ E9, 0000034D

?_068:
00000B47        mov     rcx, r12                        ; 0B47 _ 4C: 89. E1
00000B4A        mov     qword ptr [rbp-0E8H], rbx       ; 0B4A _ 48: 89. 9D, FFFFFF18
00000B51        call    _ReadUnaligned32                ; 0B51 _ E8, 00000F7E
00000B56        mov     dword ptr [rbp-7CH], eax        ; 0B56 _ 89. 45, 84
00000B59        lea     rcx, ptr [r12+4H]               ; 0B59 _ 49: 8D. 4C 24, 04
00000B5E        call    _ReadUnaligned16                ; 0B5E _ E8, 00000EF5
00000B63        mov     word ptr [rbp-0A8H], ax         ; 0B63 _ 66: 89. 85, FFFFFF58
00000B6A        lea     rcx, ptr [r12+6H]               ; 0B6A _ 49: 8D. 4C 24, 06
00000B6F        call    _ReadUnaligned16                ; 0B6F _ E8, 00000EE4
00000B74        movzx   r8d, byte ptr [r12+8H]          ; 0B74 _ 45: 0F B6. 44 24, 08
00000B7A        movzx   r9d, byte ptr [r12+9H]          ; 0B7A _ 45: 0F B6. 4C 24, 09
00000B80        movzx   r10d, byte ptr [r12+0AH]        ; 0B80 _ 45: 0F B6. 54 24, 0A
00000B86        movzx   edi, byte ptr [r12+0BH]         ; 0B86 _ 41: 0F B6. 7C 24, 0B
00000B8C        movzx   esi, byte ptr [r12+0CH]         ; 0B8C _ 41: 0F B6. 74 24, 0C
00000B92        movzx   ecx, byte ptr [r12+0DH]         ; 0B92 _ 41: 0F B6. 4C 24, 0D
00000B98        movzx   edx, byte ptr [r12+0EH]         ; 0B98 _ 41: 0F B6. 54 24, 0E
00000B9E        movzx   ebx, byte ptr [r12+0FH]         ; 0B9E _ 41: 0F B6. 5C 24, 0F
00000BA4        mov     dword ptr [rsp+70H], ebx        ; 0BA4 _ 89. 5C 24, 70
00000BA8        mov     dword ptr [rsp+68H], edx        ; 0BA8 _ 89. 54 24, 68
00000BAC        mov     dword ptr [rsp+60H], ecx        ; 0BAC _ 89. 4C 24, 60
00000BB0        mov     dword ptr [rsp+58H], esi        ; 0BB0 _ 89. 74 24, 58
00000BB4        mov     dword ptr [rsp+50H], edi        ; 0BB4 _ 89. 7C 24, 50
00000BB8        xor     edi, edi                        ; 0BB8 _ 31. FF
00000BBA        mov     dword ptr [rsp+48H], r10d       ; 0BBA _ 44: 89. 54 24, 48
00000BBF        mov     dword ptr [rsp+40H], r9d        ; 0BBF _ 44: 89. 4C 24, 40
00000BC4        mov     dword ptr [rsp+38H], r8d        ; 0BC4 _ 44: 89. 44 24, 38
00000BC9        movzx   eax, ax                         ; 0BC9 _ 0F B7. C0
00000BCC        mov     dword ptr [rsp+30H], eax        ; 0BCC _ 89. 44 24, 30
00000BD0        movzx   eax, word ptr [rbp-0A8H]        ; 0BD0 _ 0F B7. 85, FFFFFF58
00000BD7        mov     dword ptr [rsp+28H], eax        ; 0BD7 _ 89. 44 24, 28
00000BDB        mov     eax, dword ptr [rbp-7CH]        ; 0BDB _ 8B. 45, 84
00000BDE        mov     dword ptr [rsp+20H], eax        ; 0BDE _ 89. 44 24, 20
00000BE2        lea     rsi, ptr [rbp-60H]              ; 0BE2 _ 48: 8D. 75, A0
00000BE6        mov     rcx, rsi                        ; 0BE6 _ 48: 89. F1
00000BE9        mov     edx, 38                         ; 0BE9 _ BA, 00000026
00000BEE        xor     r8d, r8d                        ; 0BEE _ 45: 31. C0
00000BF1        lea     r9, ptr [?_330]                 ; 0BF1 _ 4C: 8D. 0D, 0000308D(rel)
00000BF8        call    _BasePrintLibSPrint             ; 0BF8 _ E8, 00000857
00000BFD        mov     r9, qword ptr [rbp-0D8H]        ; 0BFD _ 4C: 8B. 8D, FFFFFF28
00000C04        mov     rbx, qword ptr [rbp-0E8H]       ; 0C04 _ 48: 8B. 9D, FFFFFF18
00000C0B        xor     al, al                          ; 0C0B _ 30. C0
00000C0D        mov     r10b, al                        ; 0C0D _ 41: 88. C2
00000C10        mov     cl, al                          ; 0C10 _ 88. C1
00000C12        xor     al, al                          ; 0C12 _ 30. C0
00000C14        mov     dword ptr [rbp-7CH], eax        ; 0C14 _ 89. 45, 84
00000C17        mov     r12, rsi                        ; 0C17 _ 49: 89. F4
00000C1A        jmp     ?_067                           ; 0C1A _ E9, FFFFFF15

?_069   LABEL NEAR
00000C1F        test    rsi, rsi                        ; 0C1F _ 48: 85. F6
00000C22        jnz     ?_070                           ; 0C22 _ 75, 0E
00000C24        mov     rsi, qword ptr [r8]             ; 0C24 _ 49: 8B. 30
00000C27        lea     rax, ptr [rsi+8H]               ; 0C27 _ 48: 8D. 46, 08
00000C2B        mov     qword ptr [r8], rax             ; 0C2B _ 49: 89. 00
00000C2E        xor     eax, eax                        ; 0C2E _ 31. C0
00000C30        jmp     ?_071                           ; 0C30 _ EB, 04

?_070:
00000C32        lea     rax, ptr [rsi+8H]               ; 0C32 _ 48: 8D. 46, 08
?_071:
00000C36        mov     qword ptr [rbp-88H], rax        ; 0C36 _ 48: 89. 85, FFFFFF78
00000C3D        mov     rdx, qword ptr [rsi]            ; 0C3D _ 48: 8B. 16
00000C40        test    rdx, rdx                        ; 0C40 _ 48: 85. D2
00000C43        jnz     ?_072                           ; 0C43 _ 75, 1A
00000C45        xor     edi, edi                        ; 0C45 _ 31. FF
00000C47        xor     al, al                          ; 0C47 _ 30. C0
00000C49        mov     r10b, al                        ; 0C49 _ 41: 88. C2
00000C4C        mov     cl, al                          ; 0C4C _ 88. C1
00000C4E        xor     al, al                          ; 0C4E _ 30. C0
00000C50        mov     dword ptr [rbp-7CH], eax        ; 0C50 _ 89. 45, 84
00000C53        lea     r12, ptr [?_331]                ; 0C53 _ 4C: 8D. 25, 0000305C(rel)
00000C5A        jmp     ?_067                           ; 0C5A _ E9, FFFFFED5

?_072:
00000C5F        movzx   eax, byte ptr [rdx+2H]          ; 0C5F _ 0F B6. 42, 02
00000C63        movzx   ecx, byte ptr [rdx+3H]          ; 0C63 _ 0F B6. 4A, 03
00000C67        movzx   esi, word ptr [rdx]             ; 0C67 _ 0F B7. 32
00000C6A        movzx   edi, byte ptr [rdx+4H]          ; 0C6A _ 0F B6. 7A, 04
00000C6E        movzx   edx, byte ptr [rdx+5H]          ; 0C6E _ 0F B6. 52, 05
00000C72        mov     dword ptr [rsp+40H], edx        ; 0C72 _ 89. 54 24, 40
00000C76        mov     dword ptr [rsp+38H], edi        ; 0C76 _ 89. 7C 24, 38
00000C7A        mov     dword ptr [rsp+30H], esi        ; 0C7A _ 89. 74 24, 30
00000C7E        mov     dword ptr [rsp+28H], ecx        ; 0C7E _ 89. 4C 24, 28
00000C82        mov     dword ptr [rsp+20H], eax        ; 0C82 _ 89. 44 24, 20
00000C86        lea     rdi, ptr [rbp-60H]              ; 0C86 _ 48: 8D. 7D, A0
00000C8A        mov     rcx, rdi                        ; 0C8A _ 48: 89. F9
00000C8D        mov     edx, 38                         ; 0C8D _ BA, 00000026
00000C92        xor     r8d, r8d                        ; 0C92 _ 45: 31. C0
00000C95        mov     rsi, r9                         ; 0C95 _ 4C: 89. CE
00000C98        lea     r9, ptr [?_332]                 ; 0C98 _ 4C: 8D. 0D, 00003023(rel)
00000C9F        call    _BasePrintLibSPrint             ; 0C9F _ E8, 000007B0
00000CA4        mov     r9, rsi                         ; 0CA4 _ 49: 89. F1
00000CA7        xor     al, al                          ; 0CA7 _ 30. C0
00000CA9        mov     r10b, al                        ; 0CA9 _ 41: 88. C2
00000CAC        mov     cl, al                          ; 0CAC _ 88. C1
00000CAE        xor     al, al                          ; 0CAE _ 30. C0
00000CB0        mov     dword ptr [rbp-7CH], eax        ; 0CB0 _ 89. 45, 84
00000CB3        mov     r12, rdi                        ; 0CB3 _ 49: 89. FC
00000CB6        xor     edi, edi                        ; 0CB6 _ 31. FF
00000CB8        jmp     ?_067                           ; 0CB8 _ E9, FFFFFE77

?_073   LABEL NEAR
00000CBD        test    rsi, rsi                        ; 0CBD _ 48: 85. F6
00000CC0        jnz     ?_074                           ; 0CC0 _ 75, 0E
00000CC2        mov     rax, qword ptr [r8]             ; 0CC2 _ 49: 8B. 00
00000CC5        lea     rcx, ptr [rax+8H]               ; 0CC5 _ 48: 8D. 48, 08
00000CC9        mov     qword ptr [r8], rcx             ; 0CC9 _ 49: 89. 08
00000CCC        xor     ecx, ecx                        ; 0CCC _ 31. C9
00000CCE        jmp     ?_075                           ; 0CCE _ EB, 07

?_074:
00000CD0        lea     rcx, ptr [rsi+8H]               ; 0CD0 _ 48: 8D. 4E, 08
00000CD4        mov     rax, rsi                        ; 0CD4 _ 48: 89. F0
?_075:
00000CD7        lea     rdx, ptr [rbp-60H]              ; 0CD7 _ 48: 8D. 55, A0
00000CDB        mov     qword ptr [rbp-0A8H], rcx       ; 0CDB _ 48: 89. 8D, FFFFFF58
00000CE2        mov     rax, qword ptr [rax]            ; 0CE2 _ 48: 8B. 00
00000CE5        test    rax, rax                        ; 0CE5 _ 48: 85. C0
00000CE8        jns     ?_076                           ; 0CE8 _ 79, 24
00000CEA        mov     rcx, rax                        ; 0CEA _ 48: 89. C1
00000CED        mov     rdi, 0FFFFFFFFH                 ; 0CED _ 48: BF, 7FFFFFFFFFFFFFFF
00000CF7        and     rcx, rdi                        ; 0CF7 _ 48: 21. F9
00000CFA        mov     r12, rdx                        ; 0CFA _ 49: 89. D4
00000CFD        jz      ?_080                           ; 0CFD _ 74, 3E
00000CFF        cmp     rcx, 33                         ; 0CFF _ 48: 83. F9, 21
00000D03        mov     r12, rdx                        ; 0D03 _ 49: 89. D4
00000D06        ja      ?_080                           ; 0D06 _ 77, 35
00000D08        add     rcx, 5                          ; 0D08 _ 48: 83. C1, 05
00000D0C        jmp     ?_077                           ; 0D0C _ EB, 0C

?_076:
00000D0E        cmp     rax, 5                          ; 0D0E _ 48: 83. F8, 05
00000D12        mov     rcx, rax                        ; 0D12 _ 48: 89. C1
00000D15        mov     r12, rdx                        ; 0D15 _ 49: 89. D4
00000D18        ja      ?_080                           ; 0D18 _ 77, 23
?_077:
00000D1A        lea     rdi, ptr [_mStatusString]       ; 0D1A _ 48: 8D. 3D, 0000495F(rel)
00000D21        mov     r12, qword ptr [rdi+rcx*8]      ; 0D21 _ 4C: 8B. 24 CF
00000D25        cmp     r12, rdx                        ; 0D25 _ 49: 39. D4
00000D28        jz      ?_080                           ; 0D28 _ 74, 13
00000D2A        xor     edi, edi                        ; 0D2A _ 31. FF
00000D2C        xor     al, al                          ; 0D2C _ 30. C0
?_078:
00000D2E        mov     r10b, al                        ; 0D2E _ 41: 88. C2
00000D31        mov     cl, al                          ; 0D31 _ 88. C1
?_079:
00000D33        xor     al, al                          ; 0D33 _ 30. C0
00000D35        mov     dword ptr [rbp-7CH], eax        ; 0D35 _ 89. 45, 84
00000D38        jmp     ?_086                           ; 0D38 _ E9, 00000157

?_080:
00000D3D        mov     qword ptr [rsp+20H], rax        ; 0D3D _ 48: 89. 44 24, 20
00000D42        xor     edi, edi                        ; 0D42 _ 31. FF
00000D44        mov     rcx, rdx                        ; 0D44 _ 48: 89. D1
00000D47        mov     edx, 38                         ; 0D47 _ BA, 00000026
00000D4C        xor     r8d, r8d                        ; 0D4C _ 45: 31. C0
00000D4F        mov     rsi, r9                         ; 0D4F _ 4C: 89. CE
00000D52        lea     r9, ptr [?_333]                 ; 0D52 _ 4C: 8D. 0D, 00002F83(rel)
00000D59        call    _BasePrintLibSPrint             ; 0D59 _ E8, 000006F6
00000D5E        mov     r9, rsi                         ; 0D5E _ 49: 89. F1
00000D61        xor     al, al                          ; 0D61 _ 30. C0
00000D63        mov     dword ptr [rbp-7CH], eax        ; 0D63 _ 89. 45, 84
00000D66        xor     r10b, r10b                      ; 0D66 _ 45: 30. D2
00000D69        xor     cl, cl                          ; 0D69 _ 30. C9
00000D6B        jmp     ?_086                           ; 0D6B _ E9, 00000124

?_081:
00000D70        mov     qword ptr [rbp-0A8H], rsi       ; 0D70 _ 48: 89. B5, FFFFFF58
00000D77        movzx   edx, byte ptr [rax+r13*2]       ; 0D77 _ 42: 0F B6. 14 68
00000D7C        mov     rcx, qword ptr [rbp-0B0H]       ; 0D7C _ 48: 8B. 8D, FFFFFF50
00000D83        lea     rcx, ptr [r13+rcx]              ; 0D83 _ 49: 8D. 4C 0D, 00
00000D88        movzx   ecx, byte ptr [rax+rcx]         ; 0D88 _ 0F B6. 0C 08
00000D8C        shl     rcx, 8                          ; 0D8C _ 48: C1. E1, 08
00000D90        or      ecx, edx                        ; 0D90 _ 09. D1
00000D92        xor     dl, dl                          ; 0D92 _ 30. D2
00000D94        xor     edi, edi                        ; 0D94 _ 31. FF
00000D96        lea     rax, ptr [rax+r13*2]            ; 0D96 _ 4A: 8D. 04 68
00000D9A        and     rcx, r9                         ; 0D9A _ 4C: 21. C9
00000D9D        mov     qword ptr [rbp-68H], rcx        ; 0D9D _ 48: 89. 4D, 98
00000DA1        cmp     rcx, 13                         ; 0DA1 _ 48: 83. F9, 0D
00000DA5        cmove   rbx, rax                        ; 0DA5 _ 48: 0F 44. D8
00000DA9        mov     r10b, dl                        ; 0DA9 _ 41: 88. D2
00000DAC        mov     cl, dl                          ; 0DAC _ 88. D1
00000DAE        xor     al, al                          ; 0DAE _ 30. C0
00000DB0        mov     dword ptr [rbp-7CH], eax        ; 0DB0 _ 89. 45, 84
00000DB3        lea     r12, ptr [?_334]                ; 0DB3 _ 4C: 8D. 25, 00002F27(rel)
00000DBA        jmp     ?_086                           ; 0DBA _ E9, 000000D5

?_082:
00000DBF        movzx   ecx, byte ptr [rbx+r13]         ; 0DBF _ 42: 0F B6. 0C 2B
00000DC4        movzx   eax, byte ptr [rbx+r13+1H]      ; 0DC4 _ 42: 0F B6. 44 2B, 01
00000DCA        shl     rax, 8                          ; 0DCA _ 48: C1. E0, 08
00000DCE        or      eax, ecx                        ; 0DCE _ 09. C8
00000DD0        and     rax, r9                         ; 0DD0 _ 4C: 21. C8
00000DD3        mov     qword ptr [rbp-68H], rax        ; 0DD3 _ 48: 89. 45, 98
00000DD7        lea     rcx, ptr [rbx+r13]              ; 0DD7 _ 4A: 8D. 0C 2B
00000DDB        mov     edx, 1                          ; 0DDB _ BA, 00000001
00000DE0        mov     qword ptr [rbp-0A0H], rdx       ; 0DE0 _ 48: 89. 95, FFFFFF60
00000DE7        xor     dl, dl                          ; 0DE7 _ 30. D2
00000DE9        xor     edi, edi                        ; 0DE9 _ 31. FF
00000DEB        cmp     rax, 10                         ; 0DEB _ 48: 83. F8, 0A
00000DEF        cmove   rbx, rcx                        ; 0DEF _ 48: 0F 44. D9
00000DF3        lea     r12, ptr [?_335]                ; 0DF3 _ 4C: 8D. 25, 00002EEA(rel)
00000DFA        lea     rax, ptr [?_334]                ; 0DFA _ 48: 8D. 05, 00002EE0(rel)
00000E01        cmove   r12, rax                        ; 0E01 _ 4C: 0F 44. E0
00000E05        mov     r10b, dl                        ; 0E05 _ 41: 88. D2
00000E08        mov     cl, dl                          ; 0E08 _ 88. D1
00000E0A        xor     al, al                          ; 0E0A _ 30. C0
00000E0C        mov     dword ptr [rbp-7CH], eax        ; 0E0C _ 89. 45, 84
00000E0F        mov     r15, rdi                        ; 0E0F _ 49: 89. FF
00000E12        jmp     ?_085                           ; 0E12 _ EB, 79

?_083:
00000E14        movzx   ecx, byte ptr [rbx+r13]         ; 0E14 _ 42: 0F B6. 0C 2B
00000E19        movzx   eax, byte ptr [rbx+r13+1H]      ; 0E19 _ 42: 0F B6. 44 2B, 01
00000E1F        shl     rax, 8                          ; 0E1F _ 48: C1. E0, 08
00000E23        or      eax, ecx                        ; 0E23 _ 09. C8
00000E25        mov     r9, qword ptr [rbp-0D8H]        ; 0E25 _ 4C: 8B. 8D, FFFFFF28
00000E2C        and     rax, r9                         ; 0E2C _ 4C: 21. C8
00000E2F        mov     ecx, 1                          ; 0E2F _ B9, 00000001
00000E34        mov     qword ptr [rbp-0A0H], rcx       ; 0E34 _ 48: 89. 8D, FFFFFF60
00000E3B        mov     qword ptr [rbp-68H], rax        ; 0E3B _ 48: 89. 45, 98
00000E3F        lea     rcx, ptr [rbx+r13]              ; 0E3F _ 4A: 8D. 0C 2B
00000E43        xor     dl, dl                          ; 0E43 _ 30. D2
00000E45        xor     edi, edi                        ; 0E45 _ 31. FF
00000E47        cmp     rax, 13                         ; 0E47 _ 48: 83. F8, 0D
00000E4B        cmove   rbx, rcx                        ; 0E4B _ 48: 0F 44. D9
00000E4F        mov     r10b, dl                        ; 0E4F _ 41: 88. D2
00000E52        mov     cl, dl                          ; 0E52 _ 88. D1
00000E54        xor     al, al                          ; 0E54 _ 30. C0
00000E56        mov     dword ptr [rbp-7CH], eax        ; 0E56 _ 89. 45, 84
00000E59        mov     r15, rdi                        ; 0E59 _ 49: 89. FF
00000E5C        lea     r12, ptr [?_334]                ; 0E5C _ 4C: 8D. 25, 00002E7E(rel)
00000E63        jmp     ?_085                           ; 0E63 _ EB, 28

?_084:
00000E65        mov     eax, 1                          ; 0E65 _ B8, 00000001
00000E6A        mov     qword ptr [rbp-0A0H], rax       ; 0E6A _ 48: 89. 85, FFFFFF60
00000E71        or      r14, 400H                       ; 0E71 _ 49: 81. CE, 00000400
00000E78        xor     al, al                          ; 0E78 _ 30. C0
00000E7A        xor     edi, edi                        ; 0E7A _ 31. FF
00000E7C        mov     r10b, al                        ; 0E7C _ 41: 88. C2
00000E7F        mov     cl, al                          ; 0E7F _ 88. C1
00000E81        xor     al, al                          ; 0E81 _ 30. C0
00000E83        mov     dword ptr [rbp-7CH], eax        ; 0E83 _ 89. 45, 84
00000E86        mov     r15, rdi                        ; 0E86 _ 49: 89. FF
00000E89        lea     r12, ptr [rbp-68H]              ; 0E89 _ 4C: 8D. 65, 98
?_085:
00000E8D        mov     qword ptr [rbp-0D0H], rdi       ; 0E8D _ 48: 89. BD, FFFFFF30
?_086:
00000E94        mov     dword ptr [rbp-0B4H], ecx       ; 0E94 _ 89. 8D, FFFFFF4C
00000E9A        mov     qword ptr [rbp-88H], rdi        ; 0E9A _ 48: 89. BD, FFFFFF78
00000EA1        mov     qword ptr [rbp-0D8H], r9        ; 0EA1 _ 4C: 89. 8D, FFFFFF28
00000EA8        mov     qword ptr [rbp-0E8H], rbx       ; 0EA8 _ 48: 89. 9D, FFFFFF18
00000EAF        mov     r8, r14                         ; 0EAF _ 4D: 89. F0
00000EB2        and     r8, 400H                        ; 0EB2 _ 49: 81. E0, 00000400
00000EB9        mov     r11d, 65535                     ; 0EB9 _ 41: BB, 0000FFFF
00000EBF        mov     eax, 255                        ; 0EBF _ B8, 000000FF
00000EC4        cmove   r11, rax                        ; 0EC4 _ 4C: 0F 44. D8
00000EC8        shr     r8, 10                          ; 0EC8 _ 49: C1. E8, 0A
00000ECC        mov     rax, r14                        ; 0ECC _ 4C: 89. F0
00000ECF        test    ah, 10H                         ; 0ECF _ F6. C4, 10
00000ED2        jnz     ?_090                           ; 0ED2 _ 75, 4E
00000ED4        lea     rax, ptr [r12+1H]               ; 0ED4 _ 49: 8D. 44 24, 01
00000ED9        mov     rdi, r14                        ; 0ED9 _ 4C: 89. F7
00000EDC        and     rdi, 800H                       ; 0EDC _ 48: 81. E7, 00000800
00000EE3        lea     rdx, ptr [r8+1H]                ; 0EE3 _ 49: 8D. 50, 01
00000EE7        inc     r8                              ; 0EE7 _ 49: FF. C0
00000EEA        xor     r15d, r15d                      ; 0EEA _ 45: 31. FF
00000EED        mov     r9, qword ptr [rbp-0F8H]        ; 0EED _ 4C: 8B. 8D, FFFFFF08
00000EF4        jmp     ?_088                           ; 0EF4 _ EB, 19

?_087:
00000EF6        movzx   ebx, byte ptr [rax-1H]          ; 0EF6 _ 0F B6. 58, FF
00000EFA        movzx   ecx, byte ptr [rax]             ; 0EFA _ 0F B6. 08
00000EFD        shl     rcx, 8                          ; 0EFD _ 48: C1. E1, 08
00000F01        or      rcx, rbx                        ; 0F01 _ 48: 09. D9
00000F04        test    r11, rcx                        ; 0F04 _ 49: 85. CB
00000F07        jz      ?_089                           ; 0F07 _ 74, 14
00000F09        add     rax, r8                         ; 0F09 _ 4C: 01. C0
00000F0C        inc     r15                             ; 0F0C _ 49: FF. C7
?_088:
00000F0F        cmp     r15, qword ptr [rbp-0A0H]       ; 0F0F _ 4C: 3B. BD, FFFFFF60
00000F16        jc      ?_087                           ; 0F16 _ 72, DE
00000F18        test    rdi, rdi                        ; 0F18 _ 48: 85. FF
00000F1B        jz      ?_087                           ; 0F1B _ 74, D9
?_089:
00000F1D        mov     r8, rdx                         ; 0F1D _ 49: 89. D0
00000F20        jmp     ?_091                           ; 0F20 _ EB, 0A

?_090:
00000F22        not     r8                              ; 0F22 _ 49: F7. D0
00000F25        mov     r9, qword ptr [rbp-0F8H]        ; 0F25 _ 4C: 8B. 8D, FFFFFF08
?_091:
00000F2C        mov     rax, qword ptr [rbp-0A0H]       ; 0F2C _ 48: 8B. 85, FFFFFF60
00000F33        cmp     rax, r15                        ; 0F33 _ 4C: 39. F8
00000F36        mov     rcx, rax                        ; 0F36 _ 48: 89. C1
00000F39        cmovc   rcx, r15                        ; 0F39 _ 49: 0F 42. CF
00000F3D        mov     rax, r14                        ; 0F3D _ 4C: 89. F0
00000F40        and     rax, 201H                       ; 0F40 _ 48: 25, 00000201
00000F46        mov     qword ptr [rbp-100H], rax       ; 0F46 _ 48: 89. 85, FFFFFF00
00000F4D        cmp     rax, 512                        ; 0F4D _ 48: 3D, 00000200
00000F53        mov     rsi, qword ptr [rbp-0C0H]       ; 0F53 _ 48: 8B. B5, FFFFFF40
00000F5A        jz      ?_092                           ; 0F5A _ 74, 10
00000F5C        mov     qword ptr [rbp-0E0H], rcx       ; 0F5C _ 48: 89. 8D, FFFFFF20
00000F63        mov     rdx, qword ptr [rbp-0F0H]       ; 0F63 _ 48: 8B. 95, FFFFFF10
00000F6A        jmp     ?_093                           ; 0F6A _ EB, 2B

?_092:
00000F6C        mov     rax, qword ptr [rbp-0D0H]       ; 0F6C _ 48: 8B. 85, FFFFFF30
00000F73        sub     rax, rcx                        ; 0F73 _ 48: 29. C8
00000F76        mov     qword ptr [rbp-0E0H], rcx       ; 0F76 _ 48: 89. 8D, FFFFFF20
00000F7D        mov     rdx, rax                        ; 0F7D _ 48: 89. C2
00000F80        imul    rdx, qword ptr [rbp-98H]        ; 0F80 _ 48: 0F AF. 95, FFFFFF68
00000F88        add     rdx, qword ptr [rbp-0F0H]       ; 0F88 _ 48: 03. 95, FFFFFF10
00000F8F        mov     rcx, r14                        ; 0F8F _ 4C: 89. F1
00000F92        test    ch, 20H                         ; 0F92 _ F6. C5, 20
00000F95        jz      ?_094                           ; 0F95 _ 74, 05
?_093:
00000F97        mov     rdi, rsi                        ; 0F97 _ 48: 89. F7
00000F9A        jmp     ?_098                           ; 0F9A _ EB, 4A

?_094:
00000F9C        test    rsi, rsi                        ; 0F9C _ 48: 85. F6
00000F9F        jz      ?_093                           ; 0F9F _ 74, F6
00000FA1        test    rax, rax                        ; 0FA1 _ 48: 85. C0
00000FA4        jle     ?_093                           ; 0FA4 _ 7E, F1
00000FA6        cmp     rsi, r9                         ; 0FA6 _ 4C: 39. CE
00000FA9        jnc     ?_093                           ; 0FA9 _ 73, EC
00000FAB        inc     rsi                             ; 0FAB _ 48: FF. C6
00000FAE        mov     ecx, 1                          ; 0FAE _ B9, 00000001
?_095:
00000FB3        mov     byte ptr [rsi-1H], 32           ; 0FB3 _ C6. 46, FF, 20
00000FB7        cmp     qword ptr [rbp-78H], 0          ; 0FB7 _ 48: 83. 7D, 88, 00
00000FBC        jz      ?_096                           ; 0FBC _ 74, 03
00000FBE        mov     byte ptr [rsi], 0               ; 0FBE _ C6. 06, 00
?_096:
00000FC1        mov     rbx, qword ptr [rbp-98H]        ; 0FC1 _ 48: 8B. 9D, FFFFFF68
00000FC8        lea     rdi, ptr [rsi+rbx]              ; 0FC8 _ 48: 8D. 3C 1E
00000FCC        cmp     rcx, rax                        ; 0FCC _ 48: 39. C1
00000FCF        jge     ?_097                           ; 0FCF _ 7D, 12
00000FD1        add     rsi, qword ptr [rbp-90H]        ; 0FD1 _ 48: 03. B5, FFFFFF70
00000FD8        inc     rcx                             ; 0FD8 _ 48: FF. C1
00000FDB        cmp     rsi, r9                         ; 0FDB _ 4C: 39. CE
00000FDE        mov     rsi, rdi                        ; 0FDE _ 48: 89. FE
00000FE1        jc      ?_095                           ; 0FE1 _ 72, D0
?_097:
00000FE3        dec     rdi                             ; 0FE3 _ 48: FF. CF
?_098:
00000FE6        test    r10b, r10b                      ; 0FE6 _ 45: 84. D2
00000FE9        je      ?_107                           ; 0FE9 _ 0F 84, 000000C7
00000FEF        mov     eax, dword ptr [rbp-0B4H]       ; 0FEF _ 8B. 85, FFFFFF4C
00000FF5        test    al, al                          ; 0FF5 _ 84. C0
00000FF7        jnz     ?_099                           ; 0FF7 _ 75, 13
00000FF9        mov     rsi, r14                        ; 0FF9 _ 4C: 89. F6
00000FFC        and     rsi, 2000H                      ; 0FFC _ 48: 81. E6, 00002000
00001003        mov     r10, qword ptr [rbp-98H]        ; 1003 _ 4C: 8B. 95, FFFFFF68
0000100A        jmp     ?_101                           ; 100A _ EB, 3B

?_099:
0000100C        mov     r10, qword ptr [rbp-98H]        ; 100C _ 4C: 8B. 95, FFFFFF68
00001013        add     rdx, r10                        ; 1013 _ 4C: 01. D2
00001016        mov     rsi, r14                        ; 1016 _ 4C: 89. F6
00001019        and     rsi, 2000H                      ; 1019 _ 48: 81. E6, 00002000
00001020        test    rdi, rdi                        ; 1020 _ 48: 85. FF
00001023        jz      ?_101                           ; 1023 _ 74, 22
00001025        test    rsi, rsi                        ; 1025 _ 48: 85. F6
00001028        jnz     ?_101                           ; 1028 _ 75, 1D
0000102A        cmp     rdi, r9                         ; 102A _ 4C: 39. CF
0000102D        jnc     ?_101                           ; 102D _ 73, 18
0000102F        mov     eax, dword ptr [rbp-0B4H]       ; 102F _ 8B. 85, FFFFFF4C
00001035        mov     byte ptr [rdi], al              ; 1035 _ 88. 07
00001037        cmp     qword ptr [rbp-78H], 0          ; 1037 _ 48: 83. 7D, 88, 00
0000103C        jz      ?_100                           ; 103C _ 74, 04
0000103E        mov     byte ptr [rdi+1H], 0            ; 103E _ C6. 47, 01, 00
?_100:
00001042        add     rdi, r10                        ; 1042 _ 4C: 01. D7
00001045        xor     esi, esi                        ; 1045 _ 31. F6
?_101:
00001047        mov     rax, qword ptr [rbp-0E0H]       ; 1047 _ 48: 8B. 85, FFFFFF20
0000104E        sub     rax, r15                        ; 104E _ 4C: 29. F8
00001051        mov     rcx, rax                        ; 1051 _ 48: 89. C1
00001054        imul    rcx, r10                        ; 1054 _ 49: 0F AF. CA
00001058        add     rdx, rcx                        ; 1058 _ 48: 01. CA
0000105B        test    rsi, rsi                        ; 105B _ 48: 85. F6
0000105E        jz      ?_103                           ; 105E _ 74, 0B
?_102:
00001060        mov     rbx, r9                         ; 1060 _ 4C: 89. CB
00001063        mov     rsi, rdi                        ; 1063 _ 48: 89. FE
00001066        jmp     ?_118                           ; 1066 _ E9, 00000119

?_103:
0000106B        test    rdi, rdi                        ; 106B _ 48: 85. FF
0000106E        jz      ?_102                           ; 106E _ 74, F0
00001070        test    rax, rax                        ; 1070 _ 48: 85. C0
00001073        jle     ?_102                           ; 1073 _ 7E, EB
00001075        cmp     rdi, r9                         ; 1075 _ 4C: 39. CF
00001078        jnc     ?_102                           ; 1078 _ 73, E6
0000107A        inc     rdi                             ; 107A _ 48: FF. C7
0000107D        mov     ecx, 1                          ; 107D _ B9, 00000001
?_104:
00001082        mov     byte ptr [rdi-1H], 48           ; 1082 _ C6. 47, FF, 30
00001086        cmp     qword ptr [rbp-78H], 0          ; 1086 _ 48: 83. 7D, 88, 00
0000108B        jz      ?_105                           ; 108B _ 74, 03
0000108D        mov     byte ptr [rdi], 0               ; 108D _ C6. 07, 00
?_105:
00001090        lea     rsi, ptr [rdi+r10]              ; 1090 _ 4A: 8D. 34 17
00001094        cmp     rcx, rax                        ; 1094 _ 48: 39. C1
00001097        jge     ?_106                           ; 1097 _ 7D, 12
00001099        add     rdi, qword ptr [rbp-90H]        ; 1099 _ 48: 03. BD, FFFFFF70
000010A0        inc     rcx                             ; 10A0 _ 48: FF. C1
000010A3        cmp     rdi, r9                         ; 10A3 _ 4C: 39. CF
000010A6        mov     rdi, rsi                        ; 10A6 _ 48: 89. F7
000010A9        jc      ?_104                           ; 10A9 _ 72, D7
?_106:
000010AB        mov     rbx, r9                         ; 10AB _ 4C: 89. CB
000010AE        dec     rsi                             ; 10AE _ 48: FF. CE
000010B1        jmp     ?_118                           ; 10B1 _ E9, 000000CE

?_107:
000010B6        mov     rax, qword ptr [rbp-0E0H]       ; 10B6 _ 48: 8B. 85, FFFFFF20
000010BD        sub     rax, r15                        ; 10BD _ 4C: 29. F8
000010C0        mov     r10, r14                        ; 10C0 _ 4D: 89. F2
000010C3        and     r10, 2000H                      ; 10C3 _ 49: 81. E2, 00002000
000010CA        jz      ?_109                           ; 10CA _ 74, 05
?_108:
000010CC        mov     rsi, rdi                        ; 10CC _ 48: 89. FE
000010CF        jmp     ?_113                           ; 10CF _ EB, 51

?_109:
000010D1        test    rdi, rdi                        ; 10D1 _ 48: 85. FF
000010D4        jz      ?_108                           ; 10D4 _ 74, F6
000010D6        test    rax, rax                        ; 10D6 _ 48: 85. C0
000010D9        jle     ?_108                           ; 10D9 _ 7E, F1
000010DB        cmp     rdi, r9                         ; 10DB _ 4C: 39. CF
000010DE        jnc     ?_108                           ; 10DE _ 73, EC
000010E0        mov     rbx, r9                         ; 10E0 _ 4C: 89. CB
000010E3        inc     rdi                             ; 10E3 _ 48: FF. C7
000010E6        mov     r9d, 1                          ; 10E6 _ 41: B9, 00000001
?_110:
000010EC        mov     byte ptr [rdi-1H], 32           ; 10EC _ C6. 47, FF, 20
000010F0        cmp     qword ptr [rbp-78H], 0          ; 10F0 _ 48: 83. 7D, 88, 00
000010F5        jz      ?_111                           ; 10F5 _ 74, 03
000010F7        mov     byte ptr [rdi], 0               ; 10F7 _ C6. 07, 00
?_111:
000010FA        mov     rcx, qword ptr [rbp-98H]        ; 10FA _ 48: 8B. 8D, FFFFFF68
00001101        lea     rsi, ptr [rdi+rcx]              ; 1101 _ 48: 8D. 34 0F
00001105        cmp     r9, rax                         ; 1105 _ 49: 39. C1
00001108        jge     ?_112                           ; 1108 _ 7D, 12
0000110A        add     rdi, qword ptr [rbp-90H]        ; 110A _ 48: 03. BD, FFFFFF70
00001111        inc     r9                              ; 1111 _ 49: FF. C1
00001114        cmp     rdi, rbx                        ; 1114 _ 48: 39. DF
00001117        mov     rdi, rsi                        ; 1117 _ 48: 89. F7
0000111A        jc      ?_110                           ; 111A _ 72, D0
?_112:
0000111C        dec     rsi                             ; 111C _ 48: FF. CE
0000111F        mov     r9, rbx                         ; 111F _ 49: 89. D9
?_113:
00001122        mov     rcx, qword ptr [rbp-98H]        ; 1122 _ 48: 8B. 8D, FFFFFF68
00001129        imul    rax, rcx                        ; 1129 _ 48: 0F AF. C1
0000112D        add     rdx, rax                        ; 112D _ 48: 01. C2
00001130        mov     eax, dword ptr [rbp-0B4H]       ; 1130 _ 8B. 85, FFFFFF4C
00001136        test    al, al                          ; 1136 _ 84. C0
00001138        jnz     ?_114                           ; 1138 _ 75, 08
0000113A        mov     rbx, r9                         ; 113A _ 4C: 89. CB
0000113D        mov     r10, rcx                        ; 113D _ 49: 89. CA
00001140        jmp     ?_118                           ; 1140 _ EB, 42

?_114:
00001142        add     rdx, rcx                        ; 1142 _ 48: 01. CA
00001145        mov     rdi, rcx                        ; 1145 _ 48: 89. CF
00001148        test    rsi, rsi                        ; 1148 _ 48: 85. F6
0000114B        setne   al                              ; 114B _ 0F 95. C0
0000114E        test    r10, r10                        ; 114E _ 4D: 85. D2
00001151        sete    cl                              ; 1151 _ 0F 94. C1
00001154        cmp     rsi, r9                         ; 1154 _ 4C: 39. CE
00001157        jc      ?_116                           ; 1157 _ 72, 08
?_115:
00001159        mov     rbx, r9                         ; 1159 _ 4C: 89. CB
0000115C        mov     r10, rdi                        ; 115C _ 49: 89. FA
0000115F        jmp     ?_118                           ; 115F _ EB, 23

?_116:
00001161        and     cl, al                          ; 1161 _ 20. C1
00001163        cmp     cl, 1                           ; 1163 _ 80. F9, 01
00001166        jnz     ?_115                           ; 1166 _ 75, F1
00001168        mov     rbx, r9                         ; 1168 _ 4C: 89. CB
0000116B        mov     eax, dword ptr [rbp-0B4H]       ; 116B _ 8B. 85, FFFFFF4C
00001171        mov     byte ptr [rsi], al              ; 1171 _ 88. 06
00001173        cmp     qword ptr [rbp-78H], 0          ; 1173 _ 48: 83. 7D, 88, 00
00001178        mov     r10, rdi                        ; 1178 _ 49: 89. FA
0000117B        jz      ?_117                           ; 117B _ 74, 04
0000117D        mov     byte ptr [rsi+1H], 0            ; 117D _ C6. 46, 01, 00
?_117:
00001181        add     rsi, r10                        ; 1181 _ 4C: 01. D6
?_118:
00001184        mov     rdi, r14                        ; 1184 _ 4C: 89. F7
00001187        and     rdi, 2000H                      ; 1187 _ 48: 81. E7, 00002000
0000118E        mov     eax, dword ptr [rbp-0B4H]       ; 118E _ 8B. 85, FFFFFF4C
00001194        test    al, al                          ; 1194 _ 84. C0
00001196        setne   al                              ; 1196 _ 0F 95. C0
00001199        movzx   eax, al                         ; 1199 _ 0F B6. C0
0000119C        jmp     ?_123                           ; 119C _ E9, 000000C2

?_119:
000011A1        test    rsi, rsi                        ; 11A1 _ 48: 85. F6
000011A4        setne   cl                              ; 11A4 _ 0F 95. C1
000011A7        test    rdi, rdi                        ; 11A7 _ 48: 85. FF
000011AA        sete    bl                              ; 11AA _ 0F 94. C3
000011AD        cmp     rsi, r9                         ; 11AD _ 4C: 39. CE
000011B0        jnc     ?_121                           ; 11B0 _ 73, 27
000011B2        and     bl, cl                          ; 11B2 _ 20. CB
000011B4        cmp     bl, 1                           ; 11B4 _ 80. FB, 01
000011B7        jnz     ?_121                           ; 11B7 _ 75, 20
000011B9        movzx   ecx, byte ptr [r12+1H]          ; 11B9 _ 41: 0F B6. 4C 24, 01
000011BF        mov     bl, byte ptr [r12]              ; 11BF _ 41: 8A. 1C 24
000011C3        mov     byte ptr [rsi], bl              ; 11C3 _ 88. 1E
000011C5        cmp     qword ptr [rbp-78H], 0          ; 11C5 _ 48: 83. 7D, 88, 00
000011CA        jz      ?_120                           ; 11CA _ 74, 0A
000011CC        shl     rcx, 8                          ; 11CC _ 48: C1. E1, 08
000011D0        and     ecx, r11d                       ; 11D0 _ 44: 21. D9
000011D3        mov     byte ptr [rsi+1H], ch           ; 11D3 _ 88. 6E, 01
?_120:
000011D6        add     rsi, r10                        ; 11D6 _ 4C: 01. D6
?_121:
000011D9        add     rdx, r10                        ; 11D9 _ 4C: 01. D2
000011DC        add     r12, r8                         ; 11DC _ 4D: 01. C4
000011DF        inc     rax                             ; 11DF _ 48: FF. C0
000011E2        mov     ecx, dword ptr [rbp-7CH]        ; 11E2 _ 8B. 4D, 84
000011E5        test    cl, cl                          ; 11E5 _ 84. C9
000011E7        jz      ?_124                           ; 11E7 _ 74, 7D
000011E9        mov     rbx, r9                         ; 11E9 _ 4C: 89. CB
000011EC        mov     rcx, qword ptr [rbp-88H]        ; 11EC _ 48: 8B. 8D, FFFFFF78
000011F3        inc     rcx                             ; 11F3 _ 48: FF. C1
000011F6        mov     qword ptr [rbp-88H], rcx        ; 11F6 _ 48: 89. 8D, FFFFFF78
000011FD        cmp     rcx, 3                          ; 11FD _ 48: 83. F9, 03
00001201        jnz     ?_123                           ; 1201 _ 75, 60
00001203        inc     rax                             ; 1203 _ 48: FF. C0
00001206        mov     qword ptr [rbp-88H], 0          ; 1206 _ 48: C7. 85, FFFFFF78, 00000000
00001211        cmp     rax, r15                        ; 1211 _ 4C: 39. F8
00001214        jnc     ?_123                           ; 1214 _ 73, 4D
00001216        test    rsi, rsi                        ; 1216 _ 48: 85. F6
00001219        mov     rcx, qword ptr [rbp-90H]        ; 1219 _ 48: 8B. 8D, FFFFFF70
00001220        lea     rdx, ptr [rcx+rdx+1H]           ; 1220 _ 48: 8D. 54 11, 01
00001225        setne   r9b                             ; 1225 _ 41: 0F 95. C1
00001229        test    rdi, rdi                        ; 1229 _ 48: 85. FF
0000122C        sete    cl                              ; 122C _ 0F 94. C1
0000122F        mov     qword ptr [rbp-88H], 0          ; 122F _ 48: C7. 85, FFFFFF78, 00000000
0000123A        cmp     rsi, rbx                        ; 123A _ 48: 39. DE
0000123D        jnc     ?_123                           ; 123D _ 73, 24
0000123F        and     cl, r9b                         ; 123F _ 44: 20. C9
00001242        cmp     cl, 1                           ; 1242 _ 80. F9, 01
00001245        jnz     ?_123                           ; 1245 _ 75, 1C
00001247        mov     byte ptr [rsi], 44              ; 1247 _ C6. 06, 2C
0000124A        cmp     qword ptr [rbp-78H], 0          ; 124A _ 48: 83. 7D, 88, 00
0000124F        jz      ?_122                           ; 124F _ 74, 04
00001251        mov     byte ptr [rsi+1H], 0            ; 1251 _ C6. 46, 01, 00
?_122:
00001255        add     rsi, r10                        ; 1255 _ 4C: 01. D6
00001258        mov     qword ptr [rbp-88H], 0          ; 1258 _ 48: C7. 85, FFFFFF78, 00000000
?_123:
00001263        mov     r9, rbx                         ; 1263 _ 49: 89. D9
?_124:
00001266        cmp     rax, r15                        ; 1266 _ 4C: 39. F8
00001269        jc      ?_119                           ; 1269 _ 0F 82, FFFFFF32
0000126F        cmp     qword ptr [rbp-100H], 513       ; 126F _ 48: 81. BD, FFFFFF00, 00000201
0000127A        jz      ?_125                           ; 127A _ 74, 05
0000127C        mov     rax, rdx                        ; 127C _ 48: 89. D0
0000127F        jmp     ?_126                           ; 127F _ EB, 2B

?_125:
00001281        mov     rax, qword ptr [rbp-0A0H]       ; 1281 _ 48: 8B. 85, FFFFFF60
00001288        cmp     rax, r15                        ; 1288 _ 4C: 39. F8
0000128B        cmova   r15, rax                        ; 128B _ 4C: 0F 47. F8
0000128F        mov     rcx, qword ptr [rbp-0D0H]       ; 128F _ 48: 8B. 8D, FFFFFF30
00001296        mov     rax, rcx                        ; 1296 _ 48: 89. C8
00001299        sub     rax, r15                        ; 1299 _ 4C: 29. F8
0000129C        imul    rax, r10                        ; 129C _ 49: 0F AF. C2
000012A0        add     rax, rdx                        ; 12A0 _ 48: 01. D0
000012A3        test    rdi, rdi                        ; 12A3 _ 48: 85. FF
000012A6        je      ?_013                           ; 12A6 _ 0F 84, FFFFF1C8
?_126:
000012AC        mov     qword ptr [rbp-0C0H], rsi       ; 12AC _ 48: 89. B5, FFFFFF40
000012B3        jmp     ?_017                           ; 12B3 _ E9, FFFFF21C

?_127:
000012B8        mov     rcx, r14                        ; 12B8 _ 4C: 89. F1
000012BB        test    ch, 20H                         ; 12BB _ F6. C5, 20
000012BE        jz      ?_128                           ; 12BE _ 74, 0E
000012C0        xor     edx, edx                        ; 12C0 _ 31. D2
000012C2        div     qword ptr [rbp-98H]             ; 12C2 _ 48: F7. B5, FFFFFF68
000012C9        jmp     ?_133                           ; 12C9 _ E9, 000000C8

?_128:
000012CE        mov     rsi, r9                         ; 12CE _ 4C: 89. CE
000012D1        call    _DebugAssertEnabled             ; 12D1 _ E8, 00000B24
000012D6        test    al, al                          ; 12D6 _ 84. C0
000012D8        mov     rdi, qword ptr [rbp-0C0H]       ; 12D8 _ 48: 8B. BD, FFFFFF40
000012DF        jz      ?_129                           ; 12DF _ 74, 1D
000012E1        test    rdi, rdi                        ; 12E1 _ 48: 85. FF
000012E4        jnz     ?_129                           ; 12E4 _ 75, 18
000012E6        lea     rcx, ptr [?_324]                ; 12E6 _ 48: 8D. 0D, 000028C9(rel)
000012ED        lea     r8, ptr [?_325]                 ; 12ED _ 4C: 8D. 05, 00002924(rel)
000012F4        mov     edx, 973                        ; 12F4 _ BA, 000003CD
000012F9        call    _DebugAssert                    ; 12F9 _ E8, 00000B07
?_129:
000012FE        add     rsi, qword ptr [rbp-98H]        ; 12FE _ 48: 03. B5, FFFFFF68
00001305        cmp     rdi, rsi                        ; 1305 _ 48: 39. F7
00001308        mov     rsi, qword ptr [rbp-108H]       ; 1308 _ 48: 8B. B5, FFFFFEF8
0000130F        jnc     ?_130                           ; 130F _ 73, 0E
00001311        mov     byte ptr [rdi], 0               ; 1311 _ C6. 07, 00
00001314        cmp     qword ptr [rbp-78H], 0          ; 1314 _ 48: 83. 7D, 88, 00
00001319        jz      ?_130                           ; 1319 _ 74, 04
0000131B        mov     byte ptr [rdi+1H], 0            ; 131B _ C6. 47, 01, 00
?_130:
0000131F        call    _DebugAssertEnabled             ; 131F _ E8, 00000AD6
00001324        test    al, al                          ; 1324 _ 84. C0
00001326        jz      ?_131                           ; 1326 _ 74, 2B
00001328        test    r14b, 40H                       ; 1328 _ 41: F6. C6, 40
0000132C        jz      ?_131                           ; 132C _ 74, 25
0000132E        mov     rcx, rsi                        ; 132E _ 48: 89. F1
00001331        call    _StrSize                        ; 1331 _ E8, 0000035D
00001336        test    rax, rax                        ; 1336 _ 48: 85. C0
00001339        jnz     ?_131                           ; 1339 _ 75, 18
0000133B        lea     rcx, ptr [?_324]                ; 133B _ 48: 8D. 0D, 00002874(rel)
00001342        lea     r8, ptr [?_336]                 ; 1342 _ 4C: 8D. 05, 0000299D(rel)
00001349        mov     edx, 982                        ; 1349 _ BA, 000003D6
0000134E        call    _DebugAssert                    ; 134E _ E8, 00000AB2
?_131:
00001353        call    _DebugAssertEnabled             ; 1353 _ E8, 00000AA2
00001358        test    al, al                          ; 1358 _ 84. C0
0000135A        jz      ?_132                           ; 135A _ 74, 2B
0000135C        test    r14b, 40H                       ; 135C _ 41: F6. C6, 40
00001360        jnz     ?_132                           ; 1360 _ 75, 25
00001362        mov     rcx, rsi                        ; 1362 _ 48: 89. F1
00001365        call    _AsciiStrSize                   ; 1365 _ E8, 00000341
0000136A        test    rax, rax                        ; 136A _ 48: 85. C0
0000136D        jnz     ?_132                           ; 136D _ 75, 18
0000136F        lea     rcx, ptr [?_324]                ; 136F _ 48: 8D. 0D, 00002840(rel)
00001376        lea     r8, ptr [?_337]                 ; 1376 _ 4C: 8D. 05, 000029B5(rel)
0000137D        mov     edx, 987                        ; 137D _ BA, 000003DB
00001382        call    _DebugAssert                    ; 1382 _ E8, 00000A7E
?_132:
00001387        sub     rdi, rsi                        ; 1387 _ 48: 29. F7
0000138A        mov     rax, rdi                        ; 138A _ 48: 89. F8
0000138D        cqo                                     ; 138D _ 48: 99
0000138F        idiv    qword ptr [rbp-98H]             ; 138F _ 48: F7. BD, FFFFFF68
?_133:
00001396        add     rsp, 376                        ; 1396 _ 48: 81. C4, 00000178
0000139D        pop     rbx                             ; 139D _ 5B
0000139E        pop     rdi                             ; 139E _ 5F
0000139F        pop     rsi                             ; 139F _ 5E
000013A0        pop     r12                             ; 13A0 _ 41: 5C
000013A2        pop     r13                             ; 13A2 _ 41: 5D
000013A4        pop     r14                             ; 13A4 _ 41: 5E
000013A6        pop     r15                             ; 13A6 _ 41: 5F
000013A8        pop     rbp                             ; 13A8 _ 5D
000013A9        ret                                     ; 13A9 _ C3
_BasePrintLibSPrintMarker ENDP

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   4

?_134   label byte
        db 09H, 0F3H, 0FFH, 0FFH, 0A2H, 0F3H, 0FFH, 0FFH; 13AC _ ........
        db 0A2H, 0F3H, 0FFH, 0FFH, 0A2H, 0F3H, 0FFH, 0FFH; 13B4 _ ........
        db 0A2H, 0F3H, 0FFH, 0FFH, 0A2H, 0F3H, 0FFH, 0FFH; 13BC _ ........
        db 0A2H, 0F3H, 0FFH, 0FFH, 0A2H, 0F3H, 0FFH, 0FFH; 13C4 _ ........
        db 0A2H, 0F3H, 0FFH, 0FFH, 0A2H, 0F3H, 0FFH, 0FFH; 13CC _ ........
        db 33H, 0F3H, 0FFH, 0FFH, 0FDH, 0F2H, 0FFH, 0FFH; 13D4 _ 3.......
        db 15H, 0F3H, 0FFH, 0FFH, 0F1H, 0F2H, 0FFH, 0FFH; 13DC _ ........
        db 0E2H, 0F2H, 0FFH, 0FFH, 0A2H, 0F3H, 0FFH, 0FFH; 13E4 _ ........
        db 86H, 0F3H, 0FFH, 0FFH, 0FCH, 0F1H, 0FFH, 0FFH; 13EC _ ........
        db 0FCH, 0F1H, 0FFH, 0FFH, 0FCH, 0F1H, 0FFH, 0FFH; 13F4 _ ........
        db 0FCH, 0F1H, 0FFH, 0FFH, 0FCH, 0F1H, 0FFH, 0FFH; 13FC _ ........
        db 0FCH, 0F1H, 0FFH, 0FFH, 0FCH, 0F1H, 0FFH, 0FFH; 1404 _ ........
        db 0FCH, 0F1H, 0FFH, 0FFH, 0FCH, 0F1H, 0FFH, 0FFH; 140C _ ........

?_135   label dword                                     ; switch/case jump table
        dd ?_039-?_135                                  ; 1414 _ FFFFF415 dd ?_025-?_135; 1418 _ FFFFF24E dd ?_073-?_135; 141C _ FFFFF8A9 dd ?_057-?_135; 1420 _ FFFFF623 dd ?_069-?_135; 1424 _ FFFFF80B dd ?_042-?_135; 1428 _ FFFFF428 dd ?_025-?_135; 142C _ FFFFF24E dd ?_025-?_135; 1430 _ FFFFF24E dd ?_041-?_135; 1434 _ FFFFF421 
?_136   label dword                                     ; switch/case jump table
        dd ?_058-?_136                                  ; 1438 _ FFFFF606 dd ?_025-?_136; 143C _ FFFFF22A dd ?_061-?_136; 1440 _ FFFFF66A dd ?_043-?_136; 1444 _ FFFFF418 dd ?_025-?_136; 1448 _ FFFFF22A dd ?_025-?_136; 144C _ FFFFF22A dd ?_064-?_136; 1450 _ FFFFF6C1 

_BasePrintLibSPrint LABEL NEAR
00001454        push    rbp                             ; 1454 _ 55
00001455        mov     rbp, rsp                        ; 1455 _ 48: 89. E5
00001458        sub     rsp, 80                         ; 1458 _ 48: 83. EC, 50
0000145C        lea     rax, ptr [rbp+30H]              ; 145C _ 48: 8D. 45, 30
00001460        mov     qword ptr [rbp-20H], rax        ; 1460 _ 48: 89. 45, E0
00001464        lea     rax, ptr [rbp-20H]              ; 1464 _ 48: 8D. 45, E0
00001468        mov     qword ptr [rsp+20H], rax        ; 1468 _ 48: 89. 44 24, 20
0000146D        mov     qword ptr [rsp+28H], 0          ; 146D _ 48: C7. 44 24, 28, 00000000
00001476        call    _BasePrintLibSPrintMarker       ; 1476 _ E8, FFFFEE1D
0000147B        add     rsp, 80                         ; 147B _ 48: 83. C4, 50
0000147F        pop     rbp                             ; 147F _ 5D
00001480        ret                                     ; 1480 _ C3

_UnicodeVSPrintAsciiFormat PROC
00001481        push    rbp                             ; 1481 _ 55
00001482        mov     rbp, rsp                        ; 1482 _ 48: 89. E5
00001485        push    r14                             ; 1485 _ 41: 56
00001487        push    rsi                             ; 1487 _ 56
00001488        push    rdi                             ; 1488 _ 57
00001489        push    rbx                             ; 1489 _ 53
0000148A        sub     rsp, 48                         ; 148A _ 48: 83. EC, 30
0000148E        mov     rsi, r9                         ; 148E _ 4C: 89. CE
00001491        mov     r14, r8                         ; 1491 _ 4D: 89. C6
00001494        mov     rdi, rdx                        ; 1494 _ 48: 89. D7
00001497        mov     rbx, rcx                        ; 1497 _ 48: 89. CB
0000149A        call    _DebugAssertEnabled             ; 149A _ E8, 0000095B
0000149F        test    al, al                          ; 149F _ 84. C0
000014A1        jz      ?_137                           ; 14A1 _ 74, 1D
000014A3        test    bl, 1H                          ; 14A3 _ F6. C3, 01
000014A6        jz      ?_137                           ; 14A6 _ 74, 18
000014A8        lea     rcx, ptr [?_338]                ; 14A8 _ 48: 8D. 0D, 000028C9(rel)
000014AF        lea     r8, ptr [?_339]                 ; 14AF _ 4C: 8D. 05, 0000291C(rel)
000014B6        mov     edx, 218                        ; 14B6 _ BA, 000000DA
000014BB        call    _DebugAssert                    ; 14BB _ E8, 00000945
?_137:
000014C0        mov     qword ptr [rsp+20H], rsi        ; 14C0 _ 48: 89. 74 24, 20
000014C5        mov     qword ptr [rsp+28H], 0          ; 14C5 _ 48: C7. 44 24, 28, 00000000
000014CE        shr     rdi, 1                          ; 14CE _ 48: D1. EF
000014D1        mov     rcx, rbx                        ; 14D1 _ 48: 89. D9
000014D4        mov     rdx, rdi                        ; 14D4 _ 48: 89. FA
000014D7        mov     r8d, 64                         ; 14D7 _ 41: B8, 00000040
000014DD        mov     r9, r14                         ; 14DD _ 4D: 89. F1
000014E0        call    _BasePrintLibSPrintMarker       ; 14E0 _ E8, FFFFEDB3
000014E5        add     rsp, 48                         ; 14E5 _ 48: 83. C4, 30
000014E9        pop     rbx                             ; 14E9 _ 5B
000014EA        pop     rdi                             ; 14EA _ 5F
000014EB        pop     rsi                             ; 14EB _ 5E
000014EC        pop     r14                             ; 14EC _ 41: 5E
000014EE        pop     rbp                             ; 14EE _ 5D
000014EF        ret                                     ; 14EF _ C3
_UnicodeVSPrintAsciiFormat ENDP

_UnicodeSPrintAsciiFormat PROC
000014F0        push    rbp                             ; 14F0 _ 55
000014F1        mov     rbp, rsp                        ; 14F1 _ 48: 89. E5
000014F4        sub     rsp, 64                         ; 14F4 _ 48: 83. EC, 40
000014F8        mov     qword ptr [rbp+28H], r9         ; 14F8 _ 4C: 89. 4D, 28
000014FC        lea     rax, ptr [rbp+28H]              ; 14FC _ 48: 8D. 45, 28
00001500        mov     qword ptr [rbp-20H], rax        ; 1500 _ 48: 89. 45, E0
00001504        lea     r9, ptr [rbp-20H]               ; 1504 _ 4C: 8D. 4D, E0
00001508        call    _UnicodeVSPrintAsciiFormat      ; 1508 _ E8, FFFFFF74
0000150D        add     rsp, 64                         ; 150D _ 48: 83. C4, 40
00001511        pop     rbp                             ; 1511 _ 5D
00001512        ret                                     ; 1512 _ C3
_UnicodeSPrintAsciiFormat ENDP

_InternalAssertJumpBuffer PROC
00001513        push    rbp                             ; 1513 _ 55
00001514        mov     rbp, rsp                        ; 1514 _ 48: 89. E5
00001517        push    rsi                             ; 1517 _ 56
00001518        sub     rsp, 40                         ; 1518 _ 48: 83. EC, 28
0000151C        mov     rsi, rcx                        ; 151C _ 48: 89. CE
0000151F        call    _DebugAssertEnabled             ; 151F _ E8, 000008D6
00001524        test    al, al                          ; 1524 _ 84. C0
00001526        jz      ?_138                           ; 1526 _ 74, 1D
00001528        test    rsi, rsi                        ; 1528 _ 48: 85. F6
0000152B        jnz     ?_138                           ; 152B _ 75, 18
0000152D        lea     rcx, ptr [?_340]                ; 152D _ 48: 8D. 0D, 000028C6(rel)
00001534        lea     r8, ptr [?_341]                 ; 1534 _ 4C: 8D. 05, 00002913(rel)
0000153B        mov     edx, 37                         ; 153B _ BA, 00000025
00001540        call    _DebugAssert                    ; 1540 _ E8, 000008C0
?_138:
00001545        call    _DebugAssertEnabled             ; 1545 _ E8, 000008B0
0000154A        test    al, al                          ; 154A _ 84. C0
0000154C        jz      ?_139                           ; 154C _ 74, 06
0000154E        test    sil, 7H                         ; 154E _ 40: F6. C6, 07
00001552        jnz     ?_140                           ; 1552 _ 75, 07
?_139:
00001554        add     rsp, 40                         ; 1554 _ 48: 83. C4, 28
00001558        pop     rsi                             ; 1558 _ 5E
00001559        pop     rbp                             ; 1559 _ 5D
0000155A        ret                                     ; 155A _ C3
_InternalAssertJumpBuffer ENDP

?_140   LABEL NEAR
0000155B        lea     rcx, ptr [?_340]                ; 155B _ 48: 8D. 0D, 00002898(rel)
00001562        lea     r8, ptr [?_342]                 ; 1562 _ 4C: 8D. 05, 00002900(rel)
00001569        mov     edx, 39                         ; 1569 _ BA, 00000027
0000156E        add     rsp, 40                         ; 156E _ 48: 83. C4, 28
00001572        pop     rsi                             ; 1572 _ 5E
00001573        pop     rbp                             ; 1573 _ 5D
00001574        jmp     _DebugAssert                    ; 1574 _ E9, 0000088C

_DivU64x32Remainder PROC
00001579        push    rbp                             ; 1579 _ 55
0000157A        mov     rbp, rsp                        ; 157A _ 48: 89. E5
0000157D        push    rsi                             ; 157D _ 56
0000157E        push    rdi                             ; 157E _ 57
0000157F        push    rbx                             ; 157F _ 53
00001580        sub     rsp, 40                         ; 1580 _ 48: 83. EC, 28
00001584        mov     rsi, r8                         ; 1584 _ 4C: 89. C6
00001587        mov     edi, edx                        ; 1587 _ 89. D7
00001589        mov     rbx, rcx                        ; 1589 _ 48: 89. CB
0000158C        call    _DebugAssertEnabled             ; 158C _ E8, 00000869
00001591        test    al, al                          ; 1591 _ 84. C0
00001593        jz      ?_141                           ; 1593 _ 74, 1C
00001595        test    edi, edi                        ; 1595 _ 85. FF
00001597        jnz     ?_141                           ; 1597 _ 75, 18
00001599        lea     rcx, ptr [?_344]                ; 1599 _ 48: 8D. 0D, 000028F9(rel)
000015A0        lea     r8, ptr [?_343]                 ; 15A0 _ 4C: 8D. 05, 000028E5(rel)
000015A7        mov     edx, 47                         ; 15A7 _ BA, 0000002F
000015AC        call    _DebugAssert                    ; 15AC _ E8, 00000854
?_141:
000015B1        mov     rcx, rbx                        ; 15B1 _ 48: 89. D9
000015B4        mov     edx, edi                        ; 15B4 _ 89. FA
000015B6        mov     r8, rsi                         ; 15B6 _ 49: 89. F0
000015B9        add     rsp, 40                         ; 15B9 _ 48: 83. C4, 28
000015BD        pop     rbx                             ; 15BD _ 5B
000015BE        pop     rdi                             ; 15BE _ 5F
000015BF        pop     rsi                             ; 15BF _ 5E
000015C0        pop     rbp                             ; 15C0 _ 5D
000015C1        jmp     _InternalMathDivRemU64x32       ; 15C1 _ E9, 00000476
_DivU64x32Remainder ENDP

_CpuDeadLoop PROC
000015C6        push    rax                             ; 15C6 _ 50
000015C7        mov     qword ptr [rsp], 0              ; 15C7 _ 48: C7. 04 24, 00000000
?_142:
000015CF        cmp     qword ptr [rsp], 0              ; 15CF _ 48: 83. 3C 24, 00
000015D4        jz      ?_142                           ; 15D4 _ 74, F9
000015D6        pop     rax                             ; 15D6 _ 58
000015D7        ret                                     ; 15D7 _ C3
_CpuDeadLoop ENDP

_StrLen PROC
000015D8        push    rbp                             ; 15D8 _ 55
000015D9        mov     rbp, rsp                        ; 15D9 _ 48: 89. E5
000015DC        push    r15                             ; 15DC _ 41: 57
000015DE        push    r14                             ; 15DE _ 41: 56
000015E0        push    rsi                             ; 15E0 _ 56
000015E1        push    rdi                             ; 15E1 _ 57
000015E2        push    rbx                             ; 15E2 _ 53
000015E3        sub     rsp, 40                         ; 15E3 _ 48: 83. EC, 28
000015E7        mov     rsi, rcx                        ; 15E7 _ 48: 89. CE
000015EA        call    _DebugAssertEnabled             ; 15EA _ E8, 0000080B
000015EF        test    al, al                          ; 15EF _ 84. C0
000015F1        jz      ?_143                           ; 15F1 _ 74, 1D
000015F3        test    rsi, rsi                        ; 15F3 _ 48: 85. F6
000015F6        jnz     ?_143                           ; 15F6 _ 75, 18
000015F8        lea     rcx, ptr [?_347]                ; 15F8 _ 48: 8D. 0D, 00002931(rel)
000015FF        lea     r8, ptr [?_348]                 ; 15FF _ 4C: 8D. 05, 0000297D(rel)
00001606        mov     edx, 172                        ; 1606 _ BA, 000000AC
0000160B        call    _DebugAssert                    ; 160B _ E8, 000007F5
?_143:
00001610        call    _DebugAssertEnabled             ; 1610 _ E8, 000007E5
00001615        test    al, al                          ; 1615 _ 84. C0
00001617        jz      ?_144                           ; 1617 _ 74, 1E
00001619        test    sil, 1H                         ; 1619 _ 40: F6. C6, 01
0000161D        jz      ?_144                           ; 161D _ 74, 18
0000161F        lea     rcx, ptr [?_347]                ; 161F _ 48: 8D. 0D, 0000290A(rel)
00001626        lea     r8, ptr [?_346]                 ; 1626 _ 4C: 8D. 05, 000028E0(rel)
0000162D        mov     edx, 173                        ; 162D _ BA, 000000AD
00001632        call    _DebugAssert                    ; 1632 _ E8, 000007CE
?_144:
00001637        xor     edi, edi                        ; 1637 _ 31. FF
00001639        cmp     word ptr [rsi], 0               ; 1639 _ 66: 83. 3E, 00
0000163D        jz      ?_147                           ; 163D _ 74, 44
0000163F        xor     edi, edi                        ; 163F _ 31. FF
00001641        mov     ebx, dword ptr [__gPcd_FixedAtBuild_PcdMaximumUnicodeStringLength]; 1641 _ 8B. 1D, 00002321(rel)
00001647        lea     r14, ptr [?_347]                ; 1647 _ 4C: 8D. 35, 000028E2(rel)
0000164E        lea     r15, ptr [?_349]                ; 164E _ 4C: 8D. 3D, 00002945(rel)
?_145:
00001655        test    ebx, ebx                        ; 1655 _ 85. DB
00001657        jz      ?_146                           ; 1657 _ 74, 1E
00001659        call    _DebugAssertEnabled             ; 1659 _ E8, 0000079C
0000165E        test    al, al                          ; 165E _ 84. C0
00001660        jz      ?_146                           ; 1660 _ 74, 15
00001662        cmp     rdi, rbx                        ; 1662 _ 48: 39. DF
00001665        jc      ?_146                           ; 1665 _ 72, 10
00001667        mov     rcx, r14                        ; 1667 _ 4C: 89. F1
0000166A        mov     edx, 181                        ; 166A _ BA, 000000B5
0000166F        mov     r8, r15                         ; 166F _ 4D: 89. F8
00001672        call    _DebugAssert                    ; 1672 _ E8, 0000078E
?_146:
00001677        cmp     word ptr [rsi+rdi*2+2H], 0      ; 1677 _ 66: 83. 7C 7E, 02, 00
0000167D        lea     rdi, ptr [rdi+1H]               ; 167D _ 48: 8D. 7F, 01
00001681        jnz     ?_145                           ; 1681 _ 75, D2
?_147:
00001683        mov     rax, rdi                        ; 1683 _ 48: 89. F8
00001686        add     rsp, 40                         ; 1686 _ 48: 83. C4, 28
0000168A        pop     rbx                             ; 168A _ 5B
0000168B        pop     rdi                             ; 168B _ 5F
0000168C        pop     rsi                             ; 168C _ 5E
0000168D        pop     r14                             ; 168D _ 41: 5E
0000168F        pop     r15                             ; 168F _ 41: 5F
00001691        pop     rbp                             ; 1691 _ 5D
00001692        ret                                     ; 1692 _ C3
_StrLen ENDP

_StrSize PROC
00001693        push    rbp                             ; 1693 _ 55
00001694        mov     rbp, rsp                        ; 1694 _ 48: 89. E5
00001697        sub     rsp, 32                         ; 1697 _ 48: 83. EC, 20
0000169B        call    _StrLen                         ; 169B _ E8, FFFFFF38
000016A0        lea     rax, ptr [rax+rax+2H]           ; 16A0 _ 48: 8D. 44 00, 02
000016A5        add     rsp, 32                         ; 16A5 _ 48: 83. C4, 20
000016A9        pop     rbp                             ; 16A9 _ 5D
000016AA        ret                                     ; 16AA _ C3
_StrSize ENDP

_AsciiStrSize PROC
000016AB        push    rbp                             ; 16AB _ 55
000016AC        mov     rbp, rsp                        ; 16AC _ 48: 89. E5
000016AF        sub     rsp, 32                         ; 16AF _ 48: 83. EC, 20
000016B3        call    _AsciiStrLen                    ; 16B3 _ E8, 00000009
000016B8        inc     rax                             ; 16B8 _ 48: FF. C0
000016BB        add     rsp, 32                         ; 16BB _ 48: 83. C4, 20
000016BF        pop     rbp                             ; 16BF _ 5D
000016C0        ret                                     ; 16C0 _ C3
_AsciiStrSize ENDP

_AsciiStrLen PROC
000016C1        push    rbp                             ; 16C1 _ 55
000016C2        mov     rbp, rsp                        ; 16C2 _ 48: 89. E5
000016C5        push    r15                             ; 16C5 _ 41: 57
000016C7        push    r14                             ; 16C7 _ 41: 56
000016C9        push    rsi                             ; 16C9 _ 56
000016CA        push    rdi                             ; 16CA _ 57
000016CB        push    rbx                             ; 16CB _ 53
000016CC        sub     rsp, 40                         ; 16CC _ 48: 83. EC, 28
000016D0        mov     rsi, rcx                        ; 16D0 _ 48: 89. CE
000016D3        call    _DebugAssertEnabled             ; 16D3 _ E8, 00000722
000016D8        test    al, al                          ; 16D8 _ 84. C0
000016DA        jz      ?_148                           ; 16DA _ 74, 1D
000016DC        test    rsi, rsi                        ; 16DC _ 48: 85. F6
000016DF        jnz     ?_148                           ; 16DF _ 75, 18
000016E1        lea     rcx, ptr [?_347]                ; 16E1 _ 48: 8D. 0D, 00002848(rel)
000016E8        lea     r8, ptr [?_348]                 ; 16E8 _ 4C: 8D. 05, 00002894(rel)
000016EF        mov     edx, 1231                       ; 16EF _ BA, 000004CF
000016F4        call    _DebugAssert                    ; 16F4 _ E8, 0000070C
?_148:
000016F9        xor     edi, edi                        ; 16F9 _ 31. FF
000016FB        cmp     byte ptr [rsi], 0               ; 16FB _ 80. 3E, 00
000016FE        jz      ?_151                           ; 16FE _ 74, 43
00001700        xor     edi, edi                        ; 1700 _ 31. FF
00001702        mov     ebx, dword ptr [__gPcd_FixedAtBuild_PcdMaximumAsciiStringLength]; 1702 _ 8B. 1D, 0000225C(rel)
00001708        lea     r14, ptr [?_347]                ; 1708 _ 4C: 8D. 35, 00002821(rel)
0000170F        lea     r15, ptr [?_351]                ; 170F _ 4C: 8D. 3D, 000028F7(rel)
?_149:
00001716        test    ebx, ebx                        ; 1716 _ 85. DB
00001718        jz      ?_150                           ; 1718 _ 74, 1E
0000171A        call    _DebugAssertEnabled             ; 171A _ E8, 000006DB
0000171F        test    al, al                          ; 171F _ 84. C0
00001721        jz      ?_150                           ; 1721 _ 74, 15
00001723        cmp     rdi, rbx                        ; 1723 _ 48: 39. DF
00001726        jc      ?_150                           ; 1726 _ 72, 10
00001728        mov     rcx, r14                        ; 1728 _ 4C: 89. F1
0000172B        mov     edx, 1239                       ; 172B _ BA, 000004D7
00001730        mov     r8, r15                         ; 1730 _ 4D: 89. F8
00001733        call    _DebugAssert                    ; 1733 _ E8, 000006CD
?_150:
00001738        cmp     byte ptr [rsi+rdi+1H], 0        ; 1738 _ 80. 7C 3E, 01, 00
0000173D        lea     rdi, ptr [rdi+1H]               ; 173D _ 48: 8D. 7F, 01
00001741        jnz     ?_149                           ; 1741 _ 75, D3
?_151:
00001743        mov     rax, rdi                        ; 1743 _ 48: 89. F8
00001746        add     rsp, 40                         ; 1746 _ 48: 83. C4, 28
0000174A        pop     rbx                             ; 174A _ 5B
0000174B        pop     rdi                             ; 174B _ 5F
0000174C        pop     rsi                             ; 174C _ 5E
0000174D        pop     r14                             ; 174D _ 41: 5E
0000174F        pop     r15                             ; 174F _ 41: 5F
00001751        pop     rbp                             ; 1751 _ 5D
00001752        ret                                     ; 1752 _ C3
_AsciiStrLen ENDP

_AsciiStrnCmp PROC
00001753        push    rbp                             ; 1753 _ 55
00001754        mov     rbp, rsp                        ; 1754 _ 48: 89. E5
00001757        push    r14                             ; 1757 _ 41: 56
00001759        push    rsi                             ; 1759 _ 56
0000175A        push    rdi                             ; 175A _ 57
0000175B        push    rbx                             ; 175B _ 53
0000175C        sub     rsp, 32                         ; 175C _ 48: 83. EC, 20
00001760        mov     rsi, r8                         ; 1760 _ 4C: 89. C6
00001763        mov     rdi, rdx                        ; 1763 _ 48: 89. D7
00001766        mov     rbx, rcx                        ; 1766 _ 48: 89. CB
00001769        xor     eax, eax                        ; 1769 _ 31. C0
0000176B        test    rsi, rsi                        ; 176B _ 48: 85. F6
0000176E        je      ?_157                           ; 176E _ 0F 84, 000000B3
00001774        call    _DebugAssertEnabled             ; 1774 _ E8, 00000681
00001779        test    al, al                          ; 1779 _ 84. C0
0000177B        jz      ?_152                           ; 177B _ 74, 26
0000177D        mov     rcx, rbx                        ; 177D _ 48: 89. D9
00001780        call    _AsciiStrLen                    ; 1780 _ E8, FFFFFF3C
00001785        cmp     rax, -1                         ; 1785 _ 48: 83. F8, FF
00001789        jnz     ?_152                           ; 1789 _ 75, 18
0000178B        lea     rcx, ptr [?_347]                ; 178B _ 48: 8D. 0D, 0000279E(rel)
00001792        lea     r8, ptr [?_352]                 ; 1792 _ 4C: 8D. 05, 000028AC(rel)
00001799        mov     edx, 1469                       ; 1799 _ BA, 000005BD
0000179E        call    _DebugAssert                    ; 179E _ E8, 00000662
?_152:
000017A3        call    _DebugAssertEnabled             ; 17A3 _ E8, 00000652
000017A8        test    al, al                          ; 17A8 _ 84. C0
000017AA        jz      ?_153                           ; 17AA _ 74, 26
000017AC        mov     rcx, rdi                        ; 17AC _ 48: 89. F9
000017AF        call    _AsciiStrLen                    ; 17AF _ E8, FFFFFF0D
000017B4        cmp     rax, -1                         ; 17B4 _ 48: 83. F8, FF
000017B8        jnz     ?_153                           ; 17B8 _ 75, 18
000017BA        lea     rcx, ptr [?_347]                ; 17BA _ 48: 8D. 0D, 0000276F(rel)
000017C1        lea     r8, ptr [?_353]                 ; 17C1 _ 4C: 8D. 05, 00002898(rel)
000017C8        mov     edx, 1470                       ; 17C8 _ BA, 000005BE
000017CD        call    _DebugAssert                    ; 17CD _ E8, 00000633
?_153:
000017D2        mov     r14d, dword ptr [__gPcd_FixedAtBuild_PcdMaximumAsciiStringLength]; 17D2 _ 44: 8B. 35, 0000218B(rel)
000017D9        test    r14, r14                        ; 17D9 _ 4D: 85. F6
000017DC        jz      ?_155                           ; 17DC _ 74, 31
000017DE        call    _DebugAssertEnabled             ; 17DE _ E8, 00000617
000017E3        test    al, al                          ; 17E3 _ 84. C0
000017E5        jz      ?_155                           ; 17E5 _ 74, 28
000017E7        cmp     r14, rsi                        ; 17E7 _ 49: 39. F6
000017EA        jnc     ?_155                           ; 17EA _ 73, 23
000017EC        lea     rcx, ptr [?_347]                ; 17EC _ 48: 8D. 0D, 0000273D(rel)
000017F3        lea     r8, ptr [?_350]                 ; 17F3 _ 4C: 8D. 05, 000027DA(rel)
000017FA        mov     edx, 1473                       ; 17FA _ BA, 000005C1
000017FF        call    _DebugAssert                    ; 17FF _ E8, 00000601
00001804        jmp     ?_155                           ; 1804 _ EB, 09

?_154:
00001806        dec     rsi                             ; 1806 _ 48: FF. CE
00001809        inc     rdi                             ; 1809 _ 48: FF. C7
0000180C        inc     rbx                             ; 180C _ 48: FF. C3
?_155:
0000180F        movzx   ecx, byte ptr [rdi]             ; 180F _ 0F B6. 0F
00001812        movzx   eax, byte ptr [rbx]             ; 1812 _ 0F B6. 03
00001815        test    rax, rax                        ; 1815 _ 48: 85. C0
00001818        jz      ?_156                           ; 1818 _ 74, 0A
0000181A        cmp     al, cl                          ; 181A _ 38. C8
0000181C        jnz     ?_156                           ; 181C _ 75, 06
0000181E        cmp     rsi, 2                          ; 181E _ 48: 83. FE, 02
00001822        jnc     ?_154                           ; 1822 _ 73, E2
?_156:
00001824        sub     rax, rcx                        ; 1824 _ 48: 29. C8
?_157:
00001827        add     rsp, 32                         ; 1827 _ 48: 83. C4, 20
0000182B        pop     rbx                             ; 182B _ 5B
0000182C        pop     rdi                             ; 182C _ 5F
0000182D        pop     rsi                             ; 182D _ 5E
0000182E        pop     r14                             ; 182E _ 41: 5E
00001830        pop     rbp                             ; 1830 _ 5D
00001831        ret                                     ; 1831 _ C3
_AsciiStrnCmp ENDP

00001832        nop                                     ; 1832 _ 90
00001833        nop                                     ; 1833 _ 90
00001834        nop                                     ; 1834 _ 90
00001835        nop                                     ; 1835 _ 90
00001836        nop                                     ; 1836 _ 90
00001837        nop                                     ; 1837 _ 90

_m16Start label byte
SavedGdt label byte
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 1838 _ ........
        db 00H, 00H                                     ; 1840 _ ..

_BackFromUserCode LABEL NEAR
00001842;       push ss                                 ; 1842 _ 16
; Error: This instruction is not allowed in 64 bit mode
        db 16H00001843; push cs                         ; 1843 _ 0E
; Error: This instruction is not allowed in 64 bit mode
        db 0EH00001844; call_BackFromUserCode.Base      ; 1844 _ 66: E8, 00000000
; Note: Prefix bit or byte has no meaning in this context
        db 66H, 0E8H, 00H, 00H, 00H, 00H

_BackFromUserCode.Base LABEL NEAR
0000184A        push    word ptr 0                      ; 184A _ 66: 6A, 00
; Note: Non-default size for stack operation
0000184D        pushf                                   ; 184D _ 66: 9C
; Note: Non-default size for stack operation
0000184F        cli                                     ; 184F _ FA
00001850        push gs                                 ; 1850 _ 0F A8
00001852        push fs                                 ; 1852 _ 0F A0
00001854;       push es                                 ; 1854 _ 06
; Error: This instruction is not allowed in 64 bit mode
        db 06H00001855; push ds                         ; 1855 _ 1E
; Error: This instruction is not allowed in 64 bit mode
        db 1EH00001856; pushaw                          ; 1856 _ 66: 60
; Error: This instruction is not allowed in 64 bit mode
; Note: Non-default size for stack operation
        db 66H, 60H
00001858;       mov     dx, 0                           ; 1858 _ 66: BA, 0000
; Note: Length-changing prefix causes delay on Intel processors
        db 66H, 0BAH, 00H, 00H
0000185C;       add     byte ptr [rax], al              ; 185C _ 00. 00
; Error: This is unlikely to be code

        db 00H, 00H                                     ; 185C _ ..

_BackFromUserCode.ThunkAttrEnd LABEL NEAR
0000185E        test    dl, 2H                          ; 185E _ F6. C2, 02
00001861        jz      _BackFromUserCode.1             ; 1861 _ 74, 08
00001863        mov     eax, 365765633                  ; 1863 _ B8, 15CD2401
00001868        cli                                     ; 1868 _ FA
00001869        jnc     _BackFromUserCode.2             ; 1869 _ 73, 0B

_BackFromUserCode.1 LABEL NEAR
0000186B        test    dl, 4H                          ; 186B _ F6. C2, 04
0000186E        jz      _BackFromUserCode.2             ; 186E _ 74, 06
00001870        in      al, -110                        ; 1870 _ E4, 92
00001872        or      al, 2H                          ; 1872 _ 0C, 02
00001874        out     0FFFFFF92H, al                  ; 1874 _ E6, 92

_BackFromUserCode.2 LABEL NEAR
00001876        xor     ax, ax                          ; 1876 _ 66: 31. C0
00001879        mov     eax, ss                         ; 1879 _ 8C. D0
0000187B        lea     bp, ptr [esp+38H]               ; 187B _ 66 67: 8D. 6C 24, 38
; Note: Address size prefix should be avoided
00001881        mov     word ptr [rsi-2CH], bp          ; 1881 _ 66: 89. 6E, D4
00001885        mov     bx, word ptr [rsi-8H]           ; 1885 _ 66: 8B. 5E, F8
00001889        shl     ax, 4                           ; 1889 _ 66: C1. E0, 04
0000188D        add     bp, ax                          ; 188D _ 66: 01. C5
00001890        mov     ax, cs                          ; 1890 _ 66: 8C. C8
00001893        shl     ax, 4                           ; 1893 _ 66: C1. E0, 04
00001897        lea     ax, ptr [eax+ebx+89H]           ; 1897 _ 66 67: 8D. 84 18, 00000089
; Note: Address size prefix should be avoided
000018A0        mov     word ptr cs:[rdi-4799FF7DH], ax ; 18A0 _ 2E 66: 89. 87, B8660083
; Note: Prefix bit or byte has no meaning in this context
000018A8;       add     byte ptr [rax], al              ; 18A8 _ 00. 00
; Error: This is unlikely to be code
        db 00H, 00H
000018AA;       add     byte ptr [rax], al              ; 18AA _ 00. 00
; Error: This is unlikely to be code

        db 00H, 00H                                     ; 18AA _ ..

_BackFromUserCode.SavedCr4End LABEL NEAR
000018AC        mov     cr4, rax                        ; 18AC _ 0F 22. E0
000018AF        lgdt    dword ptr cs:[rdi-12H]          ; 18AF _ 2E 66: 0F 01. 57, EE
; Note: Prefix bit or byte has no meaning in this context
000018B5        mov     cx, 128                         ; 18B5 _ 66: B9, 0080
; Note: Length-changing prefix causes delay on Intel processors
000018B9        add     al, al                          ; 18B9 _ 00. C0
000018BB        rdmsr                                   ; 18BB _ 0F 32
000018BD        or      ah, 1H                          ; 18BD _ 80. CC, 01
000018C0        wrmsr                                   ; 18C0 _ 0F 30
000018C2        mov     ax, 0                           ; 18C2 _ 66: B8, 0000
; Note: Length-changing prefix causes delay on Intel processors
000018C6;       add     byte ptr [rax], al              ; 18C6 _ 00. 00
; Error: This is unlikely to be code
        db 00H, 00H

_BackFromUserCode.SavedCr0End LABEL NEAR
000018C8        mov     cr0, rax                        ; 18C8 _ 0F 22. C0
000018CB;       jmp     far ptr 0000H:0H                ; 18CB _ 66: EA, 0000 0000
; Error: This instruction is not allowed in 64 bit mode
; Note: Prefix bit or byte has no meaning in this context
        db 66H, 0EAH, 00H, 00H, 00H, 00H
000018D1;       add     byte ptr [rax], al              ; 18D1 _ 00. 00
; Error: This is unlikely to be code

        db 00H, 00H                                     ; 18D1 _ ..

_BackFromUserCode.X64JmpEnd LABEL NEAR
000018D3        nop                                     ; 18D3 _ 90
000018D4        mov     rsp, 0                          ; 18D4 _ 48: BC, 0000000000000000
; Note: Immediate operand could be made smaller by zero extension

_BackFromUserCode.SavedSpEnd LABEL NEAR
000018DE        nop                                     ; 18DE _ 90
000018DF        ret                                     ; 18DF _ C3

_EntryPoint LABEL NEAR
000018E0        mov     esi, 134217728                  ; 18E0 _ BE, 08000000
000018E5        add     byte ptr [rdi], bl              ; 18E5 _ 00. 1F
; Warning: Label out of phase with instruction. Possibly spurious
; _16Gdtr; Misplaced symbol at address 000016A6
000018E7        add     byte ptr [rax], al              ; 18E7 _ 00. 00
; Warning: Label out of phase with instruction. Possibly spurious
; _16GdtrBase; Misplaced symbol at address 000016A8
000018E9;       add     byte ptr [rax], al              ; 18E9 _ 00. 00
; Error: This is unlikely to be code
        db 00H, 00H
000018EB;       add     byte ptr [rax], al              ; 18EB _ 00. 00
; Error: This is unlikely to be code

        db 00H, 00H, 00H, 00H, 00H                      ; 18EB _ .....

_16Idtr LABEL NEAR
000018F0        inc     dword ptr [rbx]                 ; 18F0 _ FF. 03
000018F2;       add     byte ptr [rax], al              ; 18F2 _ 00. 00
; Error: This is unlikely to be code
        db 00H, 00H
000018F4;       add     byte ptr [rax], al              ; 18F4 _ 00. 00
; Error: This is unlikely to be code

        db 00H, 00H                                     ; 18F4 _ ..

_ToUserCode LABEL NEAR
000018F6        mov     ss, edx                         ; 18F6 _ 8E. D2
000018F8        mov     ds, edx                         ; 18F8 _ 8E. DA
000018FA        mov     es, edx                         ; 18FA _ 8E. C2
000018FC        mov     fs, edx                         ; 18FC _ 8E. E2
000018FE        mov     gs, edx                         ; 18FE _ 8E. EA
00001900        mov     cx, 128                         ; 1900 _ 66: B9, 0080
; Note: Length-changing prefix causes delay on Intel processors
00001904        add     al, al                          ; 1904 _ 00. C0
00001906        mov     cr0, rax                        ; 1906 _ 0F 22. C0
00001909        rdmsr                                   ; 1909 _ 0F 32
0000190B        and     ah, 0FFFFFFFEH                  ; 190B _ 80. E4, FE
0000190E        wrmsr                                   ; 190E _ 0F 30
00001910        mov     cr4, rbp                        ; 1910 _ 0F 22. E5
00001913        mov     ss, esi                         ; 1913 _ 8E. D6
00001915        mov     sp, bx                          ; 1915 _ 66: 89. DC
00001918        DB      66H                             ; Prefix coded explicitly
                call    _ToUserCode.Base                ; 1918 _ 66: E8, 00000000
; Note: Prefix bit or byte has no meaning in this context

_ToUserCode.Base LABEL NEAR
0000191E        pop     bp                              ; 191E _ 66: 5D
; Note: Non-default size for stack operation
00001920        push    qword ptr [esp+3AH]             ; 1920 _ 67: FF. B4 24, 0000003A
; Note: Displacement could be made smaller by sign extension
; Note: Address size prefix should be avoided
; Note: Stack pointer truncated by address size prefix
00001928        lea     eax, ptr [rsi+0FH]              ; 1928 _ 8D. 46, 0F
0000192B        push    rax                             ; 192B _ 50
0000192C        retf                                    ; 192C _ CB

_ToUserCode.RealMode LABEL NEAR
0000192D        lidt    dword ptr cs:[rsi-2EH]          ; 192D _ 2E 66: 0F 01. 5E, D2
; Note: Prefix bit or byte has no meaning in this context
00001933;       popaw                                   ; 1933 _ 66: 61
; Error: This instruction is not allowed in 64 bit mode
; Note: Non-default size for stack operation
        db 66H, 61H
00001935;       pop  ds                                 ; 1935 _ 1F
; Error: This instruction is not allowed in 64 bit mode
        db 1FH00001936; pop  es                         ; 1936 _ 07
; Error: This instruction is not allowed in 64 bit mode
        db 07H00001937; pop  fs                         ; 1937 _ 0F A1
        db 0FH, 0A1H
00001939;       pop  gs                                 ; 1939 _ 0F A9
        db 0FH, 0A9H
0000193B;       popf                                    ; 193B _ 66: 9D
; Note: Non-default size for stack operation
        db 66H, 9DH
0000193D;       lea     sp, ptr [esp+4H]                ; 193D _ 66 67: 8D. 64 24, 04
; Note: Address size prefix should be avoided
        db 66H, 67H, 8DH, 64H, 24H, 04H
00001943;       retf                                    ; 1943 _ 66: CB
; Note: Prefix bit or byte has no meaning in this context
; Note: Non-default size for stack operation
        db 66H, 0CBH
00001945;       nop                                     ; 1945 _ 90
        db 90H00001946; nop                             ; 1946 _ 90
        db 90H00001947; nop                             ; 1947 _ 90
        db 90H

_NullSeg LABEL NEAR
00001948;       add     byte ptr [rax], al              ; 1948 _ 00. 00
; Error: This is unlikely to be code
        db 00H, 00H
0000194A;       add     byte ptr [rax], al              ; 194A _ 00. 00
; Error: This is unlikely to be code

        db 00H, 00H, 00H, 00H, 00H, 00H                 ; 194A _ ......

_16Code LABEL NEAR
00001950;       UNDEFINEDedi                            ; 1950 _ FF. FF
; Error: This is unlikely to be code
        db 0FFH, 0FFH
00001952;       add     byte ptr [rax], al              ; 1952 _ 00. 00
; Error: This is unlikely to be code

        db 00H, 00H, 00H, 9BH, 8FH, 00H                 ; 1952 _ ......

_16Data LABEL NEAR
00001958;       UNDEFINEDedi                            ; 1958 _ FF. FF
; Error: This is unlikely to be code
        db 0FFH, 0FFH
0000195A;       add     byte ptr [rax], al              ; 195A _ 00. 00
; Error: This is unlikely to be code

        db 00H, 00H, 00H, 93H, 8FH, 00H                 ; 195A _ ......

_32Data LABEL NEAR
00001960;       UNDEFINEDedi                            ; 1960 _ FF. FF
; Error: This is unlikely to be code
        db 0FFH, 0FFH
00001962;       add     byte ptr [rax], al              ; 1962 _ 00. 00
; Error: This is unlikely to be code

        db 00H, 00H, 00H, 93H, 0CFH, 00H                ; 1962 _ ......

_InternalAsmThunk16 LABEL NEAR
00001968        push    rbp                             ; 1968 _ 55
00001969        push    rbx                             ; 1969 _ 53
0000196A        push    rsi                             ; 196A _ 56
0000196B        push    rdi                             ; 196B _ 57
0000196C        mov     ebx, ds                         ; 196C _ 8C. DB
0000196E        push    rbx                             ; 196E _ 53
0000196F        mov     ebx, es                         ; 196F _ 8C. C3
00001971        push    rbx                             ; 1971 _ 53
00001972        mov     ebx, ss                         ; 1972 _ 8C. D3
00001974        push    rbx                             ; 1974 _ 53
00001975        push fs                                 ; 1975 _ 0F A0
00001977        push gs                                 ; 1977 _ 0F A8
00001979        mov     rsi, rcx                        ; 1979 _ 48: 89. CE
0000197C        movzx   r8d, word ptr [rsi+36H]         ; 197C _ 44: 0F B7. 46, 36
00001981        mov     edi, dword ptr [rsi+0CH]        ; 1981 _ 8B. 7E, 0C
00001984        lea     rdi, ptr [edi-3CH]              ; 1984 _ 67 48: 8D. 7F, C4
; Note: Address size prefix should be avoided
00001989        imul    eax, r8d, 16                    ; 1989 _ 41: 6B. C0, 10
0000198D        mov     ebx, edi                        ; 198D _ 89. FB
0000198F        push    14                              ; 198F _ 6A, 0E
00001991        add     edi, eax                        ; 1991 _ 01. C7
00001993        pop     rcx                             ; 1993 _ 59
00001994rep movsd                                       ; 1994 _ F3: A5
00001996        lea     ecx, ptr [rdx+74H]              ; 1996 _ 8D. 4A, 74
00001999        mov     eax, edx                        ; 1999 _ 89. D0
0000199B        and     edx, 0FH                        ; 199B _ 83. E2, 0F
0000199E        shl     eax, 12                         ; 199E _ C1. E0, 0C
000019A1        lea     ax, ptr [rdx+0AH]               ; 19A1 _ 66: 8D. 42, 0A
000019A5stosd                                           ; 19A5 _ AB
000019A6        sgdt    fword ptr [rsp+60H]             ; 19A6 _ 0F 01. 44 24, 60
000019AB        movzx   r10, word ptr [rsp+60H]         ; 19AB _ 4C: 0F B7. 54 24, 60
000019B1        lea     r11, ptr [rcx+0CBH]             ; 19B1 _ 4C: 8D. 99, 000000CB
000019B8        and     r11, 0FFFFFFF0H                 ; 19B8 _ 49: 83. E3, F0
000019BC        mov     word ptr [rcx-74H], r10w        ; 19BC _ 66 44: 89. 51, 8C
000019C1        mov     qword ptr [rcx-72H], r11        ; 19C1 _ 4C: 89. 59, 8E
000019C5        mov     rsi, qword ptr [rsp+62H]        ; 19C5 _ 48: 8B. 74 24, 62
000019CA        xchg    r10, rcx                        ; 19CA _ 49: 87. CA
000019CD        inc     rcx                             ; 19CD _ 48: FF. C1
000019D0        xchg    r11, rdi                        ; 19D0 _ 49: 87. FB
000019D3rep movsb                                       ; 19D3 _ F3: A4
000019D5        mov     rcx, r10                        ; 19D5 _ 4C: 89. D1
000019D8        mov     rdi, r11                        ; 19D8 _ 4C: 89. DF
000019DB        sidt    fword ptr [rsp+50H]             ; 19DB _ 0F 01. 4C 24, 50
000019E0        mov     rax, cr0                        ; 19E0 _ 0F 20. C0
000019E3        mov     dword ptr [rcx+18H], eax        ; 19E3 _ 89. 41, 18
000019E6        and     eax, 7FFFFFFEH                  ; 19E6 _ 25, 7FFFFFFE
000019EB        mov     rbp, cr4                        ; 19EB _ 0F 20. E5
000019EE        mov     dword ptr [rcx-4H], ebp         ; 19EE _ 89. 69, FC
000019F1        and     ebp, 0FFFFFFCFH                 ; 19F1 _ 83. E5, CF
000019F4        mov     esi, r8d                        ; 19F4 _ 44: 89. C6
000019F7        push    24                              ; 19F7 _ 6A, 18
000019F9        pop     rdx                             ; 19F9 _ 5A
000019FA        lgdt    fword ptr [rcx+3AH]             ; 19FA _ 0F 01. 51, 3A
000019FE        mov     ss, edx                         ; 19FE _ 8E. D2
00001A00        pushfd                                  ; 1A00 _ 9C
00001A01        lea     edx, ptr [rdx-8H]               ; 1A01 _ 8D. 52, F8
00001A04        lea     r8, ptr [_InternalAsmThunk16.RetFromRealMode]; 1A04 _ 4C: 8D. 05, 00000011(rel)
00001A0B        push    r8                              ; 1A0B _ 41: 50
00001A0D        mov     r8d, cs                         ; 1A0D _ 41: 8C. C8
00001A10        mov     word ptr [rcx+25H], r8w         ; 1A10 _ 66 44: 89. 41, 25
00001A15        mov     qword ptr [rcx+2AH], rsp        ; 1A15 _ 48: 89. 61, 2A
00001A19        jmp     fword ptr [rcx+34H]             ; 1A19 _ FF. 69, 34

_InternalAsmThunk16.RetFromRealMode LABEL NEAR
00001A1C        popfd                                   ; 1A1C _ 9D
00001A1D        lgdt    fword ptr [rsp+60H]             ; 1A1D _ 0F 01. 54 24, 60
00001A22        lidt    fword ptr [rsp+50H]             ; 1A22 _ 0F 01. 5C 24, 50
00001A27        lea     eax, ptr [rbp-38H]              ; 1A27 _ 8D. 45, C8
00001A2A        pop  gs                                 ; 1A2A _ 0F A9
00001A2C        pop  fs                                 ; 1A2C _ 0F A1
00001A2E        pop     rbx                             ; 1A2E _ 5B
00001A2F        mov     ss, ebx                         ; 1A2F _ 8E. D3
00001A31        pop     rbx                             ; 1A31 _ 5B
00001A32        mov     es, ebx                         ; 1A32 _ 8E. C3
00001A34        pop     rbx                             ; 1A34 _ 5B
00001A35        mov     ds, ebx                         ; 1A35 _ 8E. DB
00001A37        pop     rdi                             ; 1A37 _ 5F
00001A38        pop     rsi                             ; 1A38 _ 5E
00001A39        pop     rbx                             ; 1A39 _ 5B
00001A3A        pop     rbp                             ; 1A3A _ 5D
00001A3B        ret                                     ; 1A3B _ C3

_InternalMathDivRemU64x32 PROC
00001A3C        mov     r9d, edx                        ; 1A3C _ 41: 89. D1
00001A3F        test    r8, r8                          ; 1A3F _ 4D: 85. C0
00001A42        jz      ?_158                           ; 1A42 _ 74, 0B
00001A44        mov     rax, rcx                        ; 1A44 _ 48: 89. C8
00001A47        xor     edx, edx                        ; 1A47 _ 31. D2
00001A49        div     r9                              ; 1A49 _ 49: F7. F1
00001A4C        mov     dword ptr [r8], edx             ; 1A4C _ 41: 89. 10
?_158:
00001A4F        mov     rax, rcx                        ; 1A4F _ 48: 89. C8
00001A52        xor     edx, edx                        ; 1A52 _ 31. D2
00001A54        div     r9                              ; 1A54 _ 49: F7. F1
00001A57        ret                                     ; 1A57 _ C3
_InternalMathDivRemU64x32 ENDP

_ReadUnaligned16 PROC
00001A58        push    rbp                             ; 1A58 _ 55
00001A59        mov     rbp, rsp                        ; 1A59 _ 48: 89. E5
00001A5C        push    rsi                             ; 1A5C _ 56
00001A5D        sub     rsp, 40                         ; 1A5D _ 48: 83. EC, 28
00001A61        mov     rsi, rcx                        ; 1A61 _ 48: 89. CE
00001A64        call    _DebugAssertEnabled             ; 1A64 _ E8, 00000391
00001A69        test    al, al                          ; 1A69 _ 84. C0
00001A6B        jz      ?_159                           ; 1A6B _ 74, 1D
00001A6D        test    rsi, rsi                        ; 1A6D _ 48: 85. F6
00001A70        jnz     ?_159                           ; 1A70 _ 75, 18
00001A72        lea     rcx, ptr [?_354]                ; 1A72 _ 48: 8D. 0D, 00002603(rel)
00001A79        lea     r8, ptr [?_325]                 ; 1A79 _ 4C: 8D. 05, 00002198(rel)
00001A80        mov     edx, 38                         ; 1A80 _ BA, 00000026
00001A85        call    _DebugAssert                    ; 1A85 _ E8, 0000037B
?_159:
00001A8A        movzx   eax, word ptr [rsi]             ; 1A8A _ 0F B7. 06
00001A8D        add     rsp, 40                         ; 1A8D _ 48: 83. C4, 28
00001A91        pop     rsi                             ; 1A91 _ 5E
00001A92        pop     rbp                             ; 1A92 _ 5D
00001A93        ret                                     ; 1A93 _ C3
_ReadUnaligned16 ENDP

_ReadUnaligned24 PROC
00001A94        push    rbp                             ; 1A94 _ 55
00001A95        mov     rbp, rsp                        ; 1A95 _ 48: 89. E5
00001A98        push    rsi                             ; 1A98 _ 56
00001A99        sub     rsp, 40                         ; 1A99 _ 48: 83. EC, 28
00001A9D        mov     rsi, rcx                        ; 1A9D _ 48: 89. CE
00001AA0        call    _DebugAssertEnabled             ; 1AA0 _ E8, 00000355
00001AA5        test    al, al                          ; 1AA5 _ 84. C0
00001AA7        jz      ?_160                           ; 1AA7 _ 74, 1D
00001AA9        test    rsi, rsi                        ; 1AA9 _ 48: 85. F6
00001AAC        jnz     ?_160                           ; 1AAC _ 75, 18
00001AAE        lea     rcx, ptr [?_354]                ; 1AAE _ 48: 8D. 0D, 000025C7(rel)
00001AB5        lea     r8, ptr [?_325]                 ; 1AB5 _ 4C: 8D. 05, 0000215C(rel)
00001ABC        mov     edx, 89                         ; 1ABC _ BA, 00000059
00001AC1        call    _DebugAssert                    ; 1AC1 _ E8, 0000033F
?_160:
00001AC6        mov     eax, 16777215                   ; 1AC6 _ B8, 00FFFFFF
00001ACB        and     eax, dword ptr [rsi]            ; 1ACB _ 23. 06
00001ACD        add     rsp, 40                         ; 1ACD _ 48: 83. C4, 28
00001AD1        pop     rsi                             ; 1AD1 _ 5E
00001AD2        pop     rbp                             ; 1AD2 _ 5D
00001AD3        ret                                     ; 1AD3 _ C3
_ReadUnaligned24 ENDP

_ReadUnaligned32 PROC
00001AD4        push    rbp                             ; 1AD4 _ 55
00001AD5        mov     rbp, rsp                        ; 1AD5 _ 48: 89. E5
00001AD8        push    rsi                             ; 1AD8 _ 56
00001AD9        sub     rsp, 40                         ; 1AD9 _ 48: 83. EC, 28
00001ADD        mov     rsi, rcx                        ; 1ADD _ 48: 89. CE
00001AE0        call    _DebugAssertEnabled             ; 1AE0 _ E8, 00000315
00001AE5        test    al, al                          ; 1AE5 _ 84. C0
00001AE7        jz      ?_161                           ; 1AE7 _ 74, 1D
00001AE9        test    rsi, rsi                        ; 1AE9 _ 48: 85. F6
00001AEC        jnz     ?_161                           ; 1AEC _ 75, 18
00001AEE        lea     rcx, ptr [?_354]                ; 1AEE _ 48: 8D. 0D, 00002587(rel)
00001AF5        lea     r8, ptr [?_325]                 ; 1AF5 _ 4C: 8D. 05, 0000211C(rel)
00001AFC        mov     edx, 141                        ; 1AFC _ BA, 0000008D
00001B01        call    _DebugAssert                    ; 1B01 _ E8, 000002FF
?_161:
00001B06        mov     eax, dword ptr [rsi]            ; 1B06 _ 8B. 06
00001B08        add     rsp, 40                         ; 1B08 _ 48: 83. C4, 28
00001B0C        pop     rsi                             ; 1B0C _ 5E
00001B0D        pop     rbp                             ; 1B0D _ 5D
00001B0E        ret                                     ; 1B0E _ C3
_ReadUnaligned32 ENDP

_CpuBreakpoint PROC
00001B0F        int 3                                   ; 1B0F _ CC
00001B10        ret                                     ; 1B10 _ C3
_CpuBreakpoint ENDP

_InternalSwitchStack PROC
00001B11        push    rbp                             ; 1B11 _ 55
00001B12        mov     rbp, rsp                        ; 1B12 _ 48: 89. E5
00001B15        mov     rax, rcx                        ; 1B15 _ 48: 89. C8
00001B18        mov     rcx, rdx                        ; 1B18 _ 48: 89. D1
00001B1B        mov     rdx, r8                         ; 1B1B _ 4C: 89. C2
00001B1E        lea     rsp, ptr [r9-20H]               ; 1B1E _ 49: 8D. 61, E0
00001B22        push    0                               ; 1B22 _ 6A, 00
00001B24        jmp     rax                             ; 1B24 _ FF. E0
_InternalSwitchStack ENDP

_SetJump PROC
00001B26        push    rcx                             ; 1B26 _ 51
00001B27        add     rsp, -32                        ; 1B27 _ 48: 83. C4, E0
00001B2B        call    _InternalAssertJumpBuffer       ; 1B2B _ E8, FFFFF9E3
00001B30        add     rsp, 32                         ; 1B30 _ 48: 83. C4, 20
00001B34        pop     rcx                             ; 1B34 _ 59
00001B35        pop     rdx                             ; 1B35 _ 5A
00001B36        mov     qword ptr [rcx], rbx            ; 1B36 _ 48: 89. 19
00001B39        mov     qword ptr [rcx+8H], rsp         ; 1B39 _ 48: 89. 61, 08
00001B3D        mov     qword ptr [rcx+10H], rbp        ; 1B3D _ 48: 89. 69, 10
00001B41        mov     qword ptr [rcx+18H], rdi        ; 1B41 _ 48: 89. 79, 18
00001B45        mov     qword ptr [rcx+20H], rsi        ; 1B45 _ 48: 89. 71, 20
00001B49        mov     qword ptr [rcx+28H], r12        ; 1B49 _ 4C: 89. 61, 28
00001B4D        mov     qword ptr [rcx+30H], r13        ; 1B4D _ 4C: 89. 69, 30
00001B51        mov     qword ptr [rcx+38H], r14        ; 1B51 _ 4C: 89. 71, 38
00001B55        mov     qword ptr [rcx+40H], r15        ; 1B55 _ 4C: 89. 79, 40
00001B59        mov     qword ptr [rcx+48H], rdx        ; 1B59 _ 48: 89. 51, 48
00001B5D        stmxcsr dword ptr [rcx+50H]             ; 1B5D _ 0F AE. 59, 50
00001B61        movdqu  xmmword ptr [rcx+58H], xmm6     ; 1B61 _ F3: 0F 7F. 71, 58
00001B66        movdqu  xmmword ptr [rcx+68H], xmm7     ; 1B66 _ F3: 0F 7F. 79, 68
00001B6B        movdqu  xmmword ptr [rcx+78H], xmm8     ; 1B6B _ F3 44: 0F 7F. 41, 78
00001B71        movdqu  xmmword ptr [rcx+88H], xmm9     ; 1B71 _ F3 44: 0F 7F. 89, 00000088
00001B7A        movdqu  xmmword ptr [rcx+98H], xmm10    ; 1B7A _ F3 44: 0F 7F. 91, 00000098
00001B83        movdqu  xmmword ptr [rcx+0A8H], xmm11   ; 1B83 _ F3 44: 0F 7F. 99, 000000A8
00001B8C        movdqu  xmmword ptr [rcx+0B8H], xmm12   ; 1B8C _ F3 44: 0F 7F. A1, 000000B8
00001B95        movdqu  xmmword ptr [rcx+0C8H], xmm13   ; 1B95 _ F3 44: 0F 7F. A9, 000000C8
00001B9E        movdqu  xmmword ptr [rcx+0D8H], xmm14   ; 1B9E _ F3 44: 0F 7F. B1, 000000D8
00001BA7        movdqu  xmmword ptr [rcx+0E8H], xmm15   ; 1BA7 _ F3 44: 0F 7F. B9, 000000E8
00001BB0        xor     rax, rax                        ; 1BB0 _ 48: 31. C0
00001BB3        jmp     rdx                             ; 1BB3 _ FF. E2
_SetJump ENDP

_InternalLongJump PROC
00001BB5        mov     rbx, qword ptr [rcx]            ; 1BB5 _ 48: 8B. 19
00001BB8        mov     rsp, qword ptr [rcx+8H]         ; 1BB8 _ 48: 8B. 61, 08
00001BBC        mov     rbp, qword ptr [rcx+10H]        ; 1BBC _ 48: 8B. 69, 10
00001BC0        mov     rdi, qword ptr [rcx+18H]        ; 1BC0 _ 48: 8B. 79, 18
00001BC4        mov     rsi, qword ptr [rcx+20H]        ; 1BC4 _ 48: 8B. 71, 20
00001BC8        mov     r12, qword ptr [rcx+28H]        ; 1BC8 _ 4C: 8B. 61, 28
00001BCC        mov     r13, qword ptr [rcx+30H]        ; 1BCC _ 4C: 8B. 69, 30
00001BD0        mov     r14, qword ptr [rcx+38H]        ; 1BD0 _ 4C: 8B. 71, 38
00001BD4        mov     r15, qword ptr [rcx+40H]        ; 1BD4 _ 4C: 8B. 79, 40
00001BD8        ldmxcsr dword ptr [rcx+50H]             ; 1BD8 _ 0F AE. 51, 50
00001BDC        movdqu  xmm6, xmmword ptr [rcx+58H]     ; 1BDC _ F3: 0F 6F. 71, 58
00001BE1        movdqu  xmm7, xmmword ptr [rcx+68H]     ; 1BE1 _ F3: 0F 6F. 79, 68
00001BE6        movdqu  xmm8, xmmword ptr [rcx+78H]     ; 1BE6 _ F3 44: 0F 6F. 41, 78
00001BEC        movdqu  xmm9, xmmword ptr [rcx+88H]     ; 1BEC _ F3 44: 0F 6F. 89, 00000088
00001BF5        movdqu  xmm10, xmmword ptr [rcx+98H]    ; 1BF5 _ F3 44: 0F 6F. 91, 00000098
00001BFE        movdqu  xmm11, xmmword ptr [rcx+0A8H]   ; 1BFE _ F3 44: 0F 6F. 99, 000000A8
00001C07        movdqu  xmm12, xmmword ptr [rcx+0B8H]   ; 1C07 _ F3 44: 0F 6F. A1, 000000B8
00001C10        movdqu  xmm13, xmmword ptr [rcx+0C8H]   ; 1C10 _ F3 44: 0F 6F. A9, 000000C8
00001C19        movdqu  xmm14, xmmword ptr [rcx+0D8H]   ; 1C19 _ F3 44: 0F 6F. B1, 000000D8
00001C22        movdqu  xmm15, xmmword ptr [rcx+0E8H]   ; 1C22 _ F3 44: 0F 6F. B9, 000000E8
00001C2B        mov     rax, rdx                        ; 1C2B _ 48: 89. D0
00001C2E        jmp     qword ptr [rcx+48H]             ; 1C2E _ FF. 61, 48
_InternalLongJump ENDP

_EnableDisableInterrupts PROC
00001C31        sti                                     ; 1C31 _ FB
00001C32        cli                                     ; 1C32 _ FA
00001C33        ret                                     ; 1C33 _ C3
_EnableDisableInterrupts ENDP

_InternalX86DisablePaging64 PROC
00001C34        cli                                     ; 1C34 _ FA
00001C35        lea     rsi, ptr [?_162]                ; 1C35 _ 48: 8D. 35, 00000032(rel)
00001C3C        mov     edi, dword ptr [rsp+28H]        ; 1C3C _ 8B. 7C 24, 28
00001C40        lea     rax, ptr [_AsmCpuid]            ; 1C40 _ 48: 8D. 05, 0000004F(rel)
00001C47        sub     rax, rsi                        ; 1C47 _ 48: 29. F0
00001C4A        add     rax, 4                          ; 1C4A _ 48: 83. C0, 04
00001C4E        and     al, 0FFFFFFFCH                  ; 1C4E _ 24, FC
00001C50        sub     rdi, rax                        ; 1C50 _ 48: 29. C7
00001C53        mov     r10d, edi                       ; 1C53 _ 41: 89. FA
00001C56        push    rcx                             ; 1C56 _ 51
00001C57        mov     rcx, rax                        ; 1C57 _ 48: 89. C1
00001C5Arep movsb                                       ; 1C5A _ F3: A4
00001C5C        pop     rcx                             ; 1C5C _ 59
00001C5D        mov     esi, r8d                        ; 1C5D _ 44: 89. C6
00001C60        mov     edi, r9d                        ; 1C60 _ 44: 89. CF
00001C63        mov     eax, r10d                       ; 1C63 _ 44: 89. D0
00001C66        sub     eax, 4                          ; 1C66 _ 83. E8, 04
00001C69        push    rcx                             ; 1C69 _ 51
00001C6A        push    r10                             ; 1C6A _ 41: 52
00001C6C        retf                                    ; 1C6C _ 48: CB
; Note: Prefix valid but unnecessary
; Note: Prefix bit or byte has no meaning in this context
_InternalX86DisablePaging64 ENDP

?_162   LABEL NEAR
00001C6E        mov     esp, eax                        ; 1C6E _ 89. C4
00001C70        mov     rax, cr0                        ; 1C70 _ 0F 20. C0
00001C73        btr     eax, 31                         ; 1C73 _ 0F BA. F0, 1F
00001C77        mov     cr0, rax                        ; 1C77 _ 0F 22. C0
00001C7A        mov     ebx, edx                        ; 1C7A _ 89. D3
00001C7C        mov     ecx, 3221225600                 ; 1C7C _ B9, C0000080
00001C81        rdmsr                                   ; 1C81 _ 0F 32
00001C83        and     ah, 0FFFFFFFEH                  ; 1C83 _ 80. E4, FE
00001C86        wrmsr                                   ; 1C86 _ 0F 30
00001C88        mov     rax, cr4                        ; 1C88 _ 0F 20. E0
00001C8B        and     al, 0FFFFFFDFH                  ; 1C8B _ 24, DF
00001C8D        mov     cr4, rax                        ; 1C8D _ 0F 22. E0
00001C90        push    rdi                             ; 1C90 _ 57
00001C91        push    rsi                             ; 1C91 _ 56
00001C92        call    rbx                             ; 1C92 _ FF. D3
?_163:
00001C94        jmp     ?_163                           ; 1C94 _ EB, FE

_AsmCpuid PROC

_mTransitionEnd LABEL NEAR
00001C96        push    rbx                             ; 1C96 _ 53
00001C97        mov     eax, ecx                        ; 1C97 _ 89. C8
00001C99        push    rax                             ; 1C99 _ 50
00001C9A        push    rdx                             ; 1C9A _ 52
00001C9B        cpuid                                   ; 1C9B _ 0F A2
00001C9D        test    r9, r9                          ; 1C9D _ 4D: 85. C9
00001CA0        jz      ?_164                           ; 1CA0 _ 74, 03
00001CA2        mov     dword ptr [r9], ecx             ; 1CA2 _ 41: 89. 09
?_164:
00001CA5        pop     rcx                             ; 1CA5 _ 59
00001CA6        jrcxz   ?_165                           ; 1CA6 _ E3, 02
00001CA8        mov     dword ptr [rcx], eax            ; 1CA8 _ 89. 01
?_165:
00001CAA        mov     rcx, r8                         ; 1CAA _ 4C: 89. C1
00001CAD        jrcxz   ?_166                           ; 1CAD _ E3, 02
00001CAF        mov     dword ptr [rcx], ebx            ; 1CAF _ 89. 19
?_166:
00001CB1        mov     rcx, qword ptr [rsp+38H]        ; 1CB1 _ 48: 8B. 4C 24, 38
00001CB6        jrcxz   ?_167                           ; 1CB6 _ E3, 02
00001CB8        mov     dword ptr [rcx], edx            ; 1CB8 _ 89. 11
?_167:
00001CBA        pop     rax                             ; 1CBA _ 58
00001CBB        pop     rbx                             ; 1CBB _ 5B
00001CBC        ret                                     ; 1CBC _ C3
_AsmCpuid ENDP

_AsmCpuidEx PROC
00001CBD        push    rbx                             ; 1CBD _ 53
00001CBE        mov     eax, ecx                        ; 1CBE _ 89. C8
00001CC0        mov     ecx, edx                        ; 1CC0 _ 89. D1
00001CC2        push    rax                             ; 1CC2 _ 50
00001CC3        cpuid                                   ; 1CC3 _ 0F A2
00001CC5        mov     r10, qword ptr [rsp+38H]        ; 1CC5 _ 4C: 8B. 54 24, 38
00001CCA        test    r10, r10                        ; 1CCA _ 4D: 85. D2
00001CCD        jz      ?_168                           ; 1CCD _ 74, 03
00001CCF        mov     dword ptr [r10], ecx            ; 1CCF _ 41: 89. 0A
?_168:
00001CD2        mov     rcx, r8                         ; 1CD2 _ 4C: 89. C1
00001CD5        jrcxz   ?_169                           ; 1CD5 _ E3, 02
00001CD7        mov     dword ptr [rcx], eax            ; 1CD7 _ 89. 01
?_169:
00001CD9        mov     rcx, r9                         ; 1CD9 _ 4C: 89. C9
00001CDC        jrcxz   ?_170                           ; 1CDC _ E3, 02
00001CDE        mov     dword ptr [rcx], ebx            ; 1CDE _ 89. 19
?_170:
00001CE0        mov     rcx, qword ptr [rsp+40H]        ; 1CE0 _ 48: 8B. 4C 24, 40
00001CE5        jrcxz   ?_171                           ; 1CE5 _ E3, 02
00001CE7        mov     dword ptr [rcx], edx            ; 1CE7 _ 89. 11
?_171:
00001CE9        pop     rax                             ; 1CE9 _ 58
00001CEA        pop     rbx                             ; 1CEA _ 5B
00001CEB        ret                                     ; 1CEB _ C3
_AsmCpuidEx ENDP

_AsmEnableCache PROC
00001CEC        wbinvd                                  ; 1CEC _ 0F 09
00001CEE        mov     rax, cr0                        ; 1CEE _ 0F 20. C0
00001CF1        btr     rax, 30                         ; 1CF1 _ 48: 0F BA. F0, 1E
00001CF6        btr     rax, 29                         ; 1CF6 _ 48: 0F BA. F0, 1D
00001CFB        mov     cr0, rax                        ; 1CFB _ 0F 22. C0
00001CFE        ret                                     ; 1CFE _ C3
_AsmEnableCache ENDP

_AsmDisableCache PROC
00001CFF        mov     rax, cr0                        ; 1CFF _ 0F 20. C0
00001D02        bts     rax, 30                         ; 1D02 _ 48: 0F BA. E8, 1E
00001D07        btr     rax, 29                         ; 1D07 _ 48: 0F BA. F0, 1D
00001D0C        mov     cr0, rax                        ; 1D0C _ 0F 22. C0
00001D0F        wbinvd                                  ; 1D0F _ 0F 09
00001D11        ret                                     ; 1D11 _ C3
_AsmDisableCache ENDP

_AsmRdRand16 PROC
00001D12        rdrand  eax                             ; 1D12 _ 0F C7. F0
00001D15        jc      rn16_ok                         ; 1D15 _ 0F 82, 00000004
; Note: Immediate operand could be made smaller by sign extension
00001D1B        xor     rax, rax                        ; 1D1B _ 48: 31. C0
00001D1E        ret                                     ; 1D1E _ C3
_AsmRdRand16 ENDP

rn16_ok LABEL NEAR
00001D1F        mov     word ptr [rcx], ax              ; 1D1F _ 66: 89. 01
00001D22        mov     rax, 1                          ; 1D22 _ 48: C7. C0, 00000001
00001D29        ret                                     ; 1D29 _ C3

_AsmRdRand32 PROC
00001D2A        rdrand  eax                             ; 1D2A _ 0F C7. F0
00001D2D        jc      rn32_ok                         ; 1D2D _ 0F 82, 00000004
; Note: Immediate operand could be made smaller by sign extension
00001D33        xor     rax, rax                        ; 1D33 _ 48: 31. C0
00001D36        ret                                     ; 1D36 _ C3
_AsmRdRand32 ENDP

rn32_ok LABEL NEAR
00001D37        mov     dword ptr [rcx], eax            ; 1D37 _ 89. 01
00001D39        mov     rax, 1                          ; 1D39 _ 48: C7. C0, 00000001
00001D40        ret                                     ; 1D40 _ C3

_AsmRdRand64 PROC
00001D41        rdrand  rax                             ; 1D41 _ 48: 0F C7. F0
00001D45        jc      rn64_ok                         ; 1D45 _ 0F 82, 00000004
; Note: Immediate operand could be made smaller by sign extension
00001D4B        xor     rax, rax                        ; 1D4B _ 48: 31. C0
00001D4E        ret                                     ; 1D4E _ C3
_AsmRdRand64 ENDP

rn64_ok LABEL NEAR
00001D4F        mov     qword ptr [rcx], rax            ; 1D4F _ 48: 89. 01
00001D52        mov     rax, 1                          ; 1D52 _ 48: C7. C0, 00000001
00001D59        ret                                     ; 1D59 _ C3

_DebugPrint PROC
00001D5A        push    rbp                             ; 1D5A _ 55
00001D5B        mov     rbp, rsp                        ; 1D5B _ 48: 89. E5
00001D5E        push    rsi                             ; 1D5E _ 56
00001D5F        push    rdi                             ; 1D5F _ 57
00001D60        sub     rsp, 576                        ; 1D60 _ 48: 81. EC, 00000240
00001D67        mov     rsi, rdx                        ; 1D67 _ 48: 89. D6
00001D6A        mov     rdi, rcx                        ; 1D6A _ 48: 89. CF
00001D6D        mov     qword ptr [rbp+28H], r9         ; 1D6D _ 4C: 89. 4D, 28
00001D71        mov     qword ptr [rbp+20H], r8         ; 1D71 _ 4C: 89. 45, 20
00001D75        test    byte ptr [__gPcd_FixedAtBuild_PcdDebugPropertyMask], 1H; 1D75 _ F6. 05, 00001BF0(rel), 01
00001D7C        jz      ?_172                           ; 1D7C _ 74, 1D
00001D7E        test    rsi, rsi                        ; 1D7E _ 48: 85. F6
00001D81        jnz     ?_172                           ; 1D81 _ 75, 18
00001D83        lea     rcx, ptr [?_355]                ; 1D83 _ 48: 8D. 0D, 00002348(rel)
00001D8A        lea     r8, ptr [?_356]                 ; 1D8A _ 4C: 8D. 05, 000023A1(rel)
00001D91        mov     edx, 59                         ; 1D91 _ BA, 0000003B
00001D96        call    _DebugAssert                    ; 1D96 _ E8, 0000006A
?_172:
00001D9B        call    _GetDebugPrintErrorLevel        ; 1D9B _ E8, FFFFE4A0
00001DA0        mov     eax, eax                        ; 1DA0 _ 89. C0
00001DA2        test    rdi, rax                        ; 1DA2 _ 48: 85. C7
00001DA5        jz      ?_173                           ; 1DA5 _ 74, 48
00001DA7        lea     rax, ptr [rbp+20H]              ; 1DA7 _ 48: 8D. 45, 20
00001DAB        mov     qword ptr [rbp-230H], rax       ; 1DAB _ 48: 89. 85, FFFFFDD0
00001DB2        lea     rcx, ptr [rbp-210H]             ; 1DB2 _ 48: 8D. 8D, FFFFFDF0
00001DB9        lea     r9, ptr [rbp-230H]              ; 1DB9 _ 4C: 8D. 8D, FFFFFDD0
00001DC0        mov     edx, 256                        ; 1DC0 _ BA, 00000100
00001DC5        mov     r8, rsi                         ; 1DC5 _ 49: 89. F0
00001DC8        call    _UnicodeVSPrintAsciiFormat      ; 1DC8 _ E8, FFFFF6B4
00001DCD        mov     rax, qword ptr [_gST]           ; 1DCD _ 48: 8B. 05, 00003B8C(rel)
00001DD4        test    rax, rax                        ; 1DD4 _ 48: 85. C0
00001DD7        jz      ?_173                           ; 1DD7 _ 74, 16
00001DD9        mov     rax, qword ptr [rax+40H]        ; 1DD9 _ 48: 8B. 40, 40
00001DDD        test    rax, rax                        ; 1DDD _ 48: 85. C0
00001DE0        jz      ?_173                           ; 1DE0 _ 74, 0D
00001DE2        lea     rdx, ptr [rbp-210H]             ; 1DE2 _ 48: 8D. 95, FFFFFDF0
00001DE9        mov     rcx, rax                        ; 1DE9 _ 48: 89. C1
00001DEC        call    qword ptr [rax+8H]              ; 1DEC _ FF. 50, 08
?_173:
00001DEF        add     rsp, 576                        ; 1DEF _ 48: 81. C4, 00000240
00001DF6        pop     rdi                             ; 1DF6 _ 5F
00001DF7        pop     rsi                             ; 1DF7 _ 5E
00001DF8        pop     rbp                             ; 1DF8 _ 5D
00001DF9        ret                                     ; 1DF9 _ C3
_DebugPrint ENDP

_DebugAssertEnabled PROC
00001DFA        movzx   eax, byte ptr [__gPcd_FixedAtBuild_PcdDebugPropertyMask]; 1DFA _ 0F B6. 05, 00001B6B(rel)
00001E01        and     eax, 1H                         ; 1E01 _ 83. E0, 01
00001E04        ret                                     ; 1E04 _ C3
_DebugAssertEnabled ENDP

_DebugAssert PROC
00001E05        push    rbp                             ; 1E05 _ 55
00001E06        mov     rbp, rsp                        ; 1E06 _ 48: 89. E5
00001E09        sub     rsp, 576                        ; 1E09 _ 48: 81. EC, 00000240
00001E10        mov     r9, qword ptr [_gEfiCallerBaseName]; 1E10 _ 4C: 8B. 0D, 00003A69(rel)
00001E17        mov     qword ptr [rsp+30H], r8         ; 1E17 _ 4C: 89. 44 24, 30
00001E1C        mov     qword ptr [rsp+28H], rdx        ; 1E1C _ 48: 89. 54 24, 28
00001E21        mov     qword ptr [rsp+20H], rcx        ; 1E21 _ 48: 89. 4C 24, 20
00001E26        lea     rcx, ptr [rbp-200H]             ; 1E26 _ 48: 8D. 8D, FFFFFE00
00001E2D        lea     r8, ptr [?_357]                 ; 1E2D _ 4C: 8D. 05, 00002315(rel)
00001E34        mov     edx, 512                        ; 1E34 _ BA, 00000200
00001E39        call    _UnicodeSPrintAsciiFormat       ; 1E39 _ E8, FFFFF6B2
00001E3E        mov     rax, qword ptr [_gST]           ; 1E3E _ 48: 8B. 05, 00003B1B(rel)
00001E45        test    rax, rax                        ; 1E45 _ 48: 85. C0
00001E48        jz      ?_174                           ; 1E48 _ 74, 16
00001E4A        mov     rax, qword ptr [rax+40H]        ; 1E4A _ 48: 8B. 40, 40
00001E4E        test    rax, rax                        ; 1E4E _ 48: 85. C0
00001E51        jz      ?_174                           ; 1E51 _ 74, 0D
00001E53        lea     rdx, ptr [rbp-200H]             ; 1E53 _ 48: 8D. 95, FFFFFE00
00001E5A        mov     rcx, rax                        ; 1E5A _ 48: 89. C1
00001E5D        call    qword ptr [rax+8H]              ; 1E5D _ FF. 50, 08
?_174:
00001E60        movzx   eax, byte ptr [__gPcd_FixedAtBuild_PcdDebugPropertyMask]; 1E60 _ 0F B6. 05, 00001B05(rel)
00001E67        test    al, 10H                         ; 1E67 _ A8, 10
00001E69        jz      ?_175                           ; 1E69 _ 74, 07
00001E6B        call    _CpuBreakpoint                  ; 1E6B _ E8, FFFFFC9F
00001E70        jmp     ?_176                           ; 1E70 _ EB, 09

?_175:
00001E72        test    al, 20H                         ; 1E72 _ A8, 20
00001E74        jz      ?_176                           ; 1E74 _ 74, 05
00001E76        call    _CpuDeadLoop                    ; 1E76 _ E8, FFFFF74B
?_176:
00001E7B        add     rsp, 576                        ; 1E7B _ 48: 81. C4, 00000240
00001E82        pop     rbp                             ; 1E82 _ 5D
00001E83        ret                                     ; 1E83 _ C3
_DebugAssert ENDP

_DebugPrintEnabled PROC
00001E84        mov     al, byte ptr [__gPcd_FixedAtBuild_PcdDebugPropertyMask]; 1E84 _ 8A. 05, 00001AE2(rel)
00001E8A        shr     al, 1                           ; 1E8A _ D0. E8
00001E8C        and     al, 1H                          ; 1E8C _ 24, 01
00001E8E        movzx   eax, al                         ; 1E8E _ 0F B6. C0
00001E91        ret                                     ; 1E91 _ C3
_DebugPrintEnabled ENDP

_DebugPrintLevelEnabled PROC
00001E92        mov     eax, dword ptr [__gPcd_FixedAtBuild_PcdFixedDebugPrintErrorLevel]; 1E92 _ 8B. 05, 00001AD8(rel)
00001E98        test    rcx, rax                        ; 1E98 _ 48: 85. C1
00001E9B        setne   al                              ; 1E9B _ 0F 95. C0
00001E9E        movzx   eax, al                         ; 1E9E _ 0F B6. C0
00001EA1        ret                                     ; 1EA1 _ C3
_DebugPrintLevelEnabled ENDP

_CompareMem PROC
00001EA2        push    rbp                             ; 1EA2 _ 55
00001EA3        mov     rbp, rsp                        ; 1EA3 _ 48: 89. E5
00001EA6        push    rsi                             ; 1EA6 _ 56
00001EA7        push    rdi                             ; 1EA7 _ 57
00001EA8        push    rbx                             ; 1EA8 _ 53
00001EA9        sub     rsp, 40                         ; 1EA9 _ 48: 83. EC, 28
00001EAD        mov     rsi, r8                         ; 1EAD _ 4C: 89. C6
00001EB0        mov     rdi, rdx                        ; 1EB0 _ 48: 89. D7
00001EB3        mov     rbx, rcx                        ; 1EB3 _ 48: 89. CB
00001EB6        test    rsi, rsi                        ; 1EB6 _ 48: 85. F6
00001EB9        je      ?_181                           ; 1EB9 _ 0F 84, 000000CB
00001EBF        cmp     rbx, rdi                        ; 1EBF _ 48: 39. FB
00001EC2        je      ?_181                           ; 1EC2 _ 0F 84, 000000C2
00001EC8        call    _DebugAssertEnabled             ; 1EC8 _ E8, FFFFFF2D
00001ECD        test    al, al                          ; 1ECD _ 84. C0
00001ECF        jz      ?_177                           ; 1ECF _ 74, 1D
00001ED1        test    rbx, rbx                        ; 1ED1 _ 48: 85. DB
00001ED4        jnz     ?_177                           ; 1ED4 _ 75, 18
00001ED6        lea     rcx, ptr [?_358]                ; 1ED6 _ 48: 8D. 0D, 00002284(rel)
00001EDD        lea     r8, ptr [?_359]                 ; 1EDD _ 4C: 8D. 05, 000022E1(rel)
00001EE4        mov     edx, 60                         ; 1EE4 _ BA, 0000003C
00001EE9        call    _DebugAssert                    ; 1EE9 _ E8, FFFFFF17
?_177:
00001EEE        call    _DebugAssertEnabled             ; 1EEE _ E8, FFFFFF07
00001EF3        test    al, al                          ; 1EF3 _ 84. C0
00001EF5        jz      ?_178                           ; 1EF5 _ 74, 1D
00001EF7        test    rdi, rdi                        ; 1EF7 _ 48: 85. FF
00001EFA        jnz     ?_178                           ; 1EFA _ 75, 18
00001EFC        lea     rcx, ptr [?_358]                ; 1EFC _ 48: 8D. 0D, 0000225E(rel)
00001F03        lea     r8, ptr [?_360]                 ; 1F03 _ 4C: 8D. 05, 000022DD(rel)
00001F0A        mov     edx, 61                         ; 1F0A _ BA, 0000003D
00001F0F        call    _DebugAssert                    ; 1F0F _ E8, FFFFFEF1
?_178:
00001F14        call    _DebugAssertEnabled             ; 1F14 _ E8, FFFFFEE1
00001F19        test    al, al                          ; 1F19 _ 84. C0
00001F1B        jz      ?_179                           ; 1F1B _ 74, 27
00001F1D        mov     rax, rbx                        ; 1F1D _ 48: 89. D8
00001F20        not     rax                             ; 1F20 _ 48: F7. D0
00001F23        lea     rcx, ptr [rsi-1H]               ; 1F23 _ 48: 8D. 4E, FF
00001F27        cmp     rcx, rax                        ; 1F27 _ 48: 39. C1
00001F2A        jbe     ?_179                           ; 1F2A _ 76, 18
00001F2C        lea     rcx, ptr [?_358]                ; 1F2C _ 48: 8D. 0D, 0000222E(rel)
00001F33        lea     r8, ptr [?_361]                 ; 1F33 _ 4C: 8D. 05, 000022CA(rel)
00001F3A        mov     edx, 62                         ; 1F3A _ BA, 0000003E
00001F3F        call    _DebugAssert                    ; 1F3F _ E8, FFFFFEC1
?_179:
00001F44        call    _DebugAssertEnabled             ; 1F44 _ E8, FFFFFEB1
00001F49        test    al, al                          ; 1F49 _ 84. C0
00001F4B        jz      ?_180                           ; 1F4B _ 74, 27
00001F4D        mov     rax, rdi                        ; 1F4D _ 48: 89. F8
00001F50        not     rax                             ; 1F50 _ 48: F7. D0
00001F53        lea     rcx, ptr [rsi-1H]               ; 1F53 _ 48: 8D. 4E, FF
00001F57        cmp     rcx, rax                        ; 1F57 _ 48: 39. C1
00001F5A        jbe     ?_180                           ; 1F5A _ 76, 18
00001F5C        lea     rcx, ptr [?_358]                ; 1F5C _ 48: 8D. 0D, 000021FE(rel)
00001F63        lea     r8, ptr [?_362]                 ; 1F63 _ 4C: 8D. 05, 000022DD(rel)
00001F6A        mov     edx, 63                         ; 1F6A _ BA, 0000003F
00001F6F        call    _DebugAssert                    ; 1F6F _ E8, FFFFFE91
?_180:
00001F74        mov     rcx, rbx                        ; 1F74 _ 48: 89. D9
00001F77        mov     rdx, rdi                        ; 1F77 _ 48: 89. FA
00001F7A        mov     r8, rsi                         ; 1F7A _ 49: 89. F0
00001F7D        add     rsp, 40                         ; 1F7D _ 48: 83. C4, 28
00001F81        pop     rbx                             ; 1F81 _ 5B
00001F82        pop     rdi                             ; 1F82 _ 5F
00001F83        pop     rsi                             ; 1F83 _ 5E
00001F84        pop     rbp                             ; 1F84 _ 5D
00001F85        jmp     _InternalMemCompareMem          ; 1F85 _ E9, 000000AB
_CompareMem ENDP

?_181   LABEL NEAR
00001F8A        xor     eax, eax                        ; 1F8A _ 31. C0
00001F8C        add     rsp, 40                         ; 1F8C _ 48: 83. C4, 28
00001F90        pop     rbx                             ; 1F90 _ 5B
00001F91        pop     rdi                             ; 1F91 _ 5F
00001F92        pop     rsi                             ; 1F92 _ 5E
00001F93        pop     rbp                             ; 1F93 _ 5D
00001F94        ret                                     ; 1F94 _ C3

_CopyMem PROC
00001F95        push    rbp                             ; 1F95 _ 55
00001F96        mov     rbp, rsp                        ; 1F96 _ 48: 89. E5
00001F99        push    rsi                             ; 1F99 _ 56
00001F9A        push    rdi                             ; 1F9A _ 57
00001F9B        push    rbx                             ; 1F9B _ 53
00001F9C        sub     rsp, 40                         ; 1F9C _ 48: 83. EC, 28
00001FA0        mov     rsi, r8                         ; 1FA0 _ 4C: 89. C6
00001FA3        mov     rdi, rdx                        ; 1FA3 _ 48: 89. D7
00001FA6        mov     rbx, rcx                        ; 1FA6 _ 48: 89. CB
00001FA9        test    rsi, rsi                        ; 1FA9 _ 48: 85. F6
00001FAC        jz      ?_184                           ; 1FAC _ 74, 65
00001FAE        call    _DebugAssertEnabled             ; 1FAE _ E8, FFFFFE47
00001FB3        test    al, al                          ; 1FB3 _ 84. C0
00001FB5        jz      ?_182                           ; 1FB5 _ 74, 27
00001FB7        mov     rax, rbx                        ; 1FB7 _ 48: 89. D8
00001FBA        not     rax                             ; 1FBA _ 48: F7. D0
00001FBD        lea     rcx, ptr [rsi-1H]               ; 1FBD _ 48: 8D. 4E, FF
00001FC1        cmp     rcx, rax                        ; 1FC1 _ 48: 39. C1
00001FC4        jbe     ?_182                           ; 1FC4 _ 76, 18
00001FC6        lea     rcx, ptr [?_363]                ; 1FC6 _ 48: 8D. 0D, 000022B8(rel)
00001FCD        lea     r8, ptr [?_361]                 ; 1FCD _ 4C: 8D. 05, 00002230(rel)
00001FD4        mov     edx, 56                         ; 1FD4 _ BA, 00000038
00001FD9        call    _DebugAssert                    ; 1FD9 _ E8, FFFFFE27
?_182:
00001FDE        call    _DebugAssertEnabled             ; 1FDE _ E8, FFFFFE17
00001FE3        test    al, al                          ; 1FE3 _ 84. C0
00001FE5        jz      ?_183                           ; 1FE5 _ 74, 27
00001FE7        mov     rax, rdi                        ; 1FE7 _ 48: 89. F8
00001FEA        not     rax                             ; 1FEA _ 48: F7. D0
00001FED        lea     rcx, ptr [rsi-1H]               ; 1FED _ 48: 8D. 4E, FF
00001FF1        cmp     rcx, rax                        ; 1FF1 _ 48: 39. C1
00001FF4        jbe     ?_183                           ; 1FF4 _ 76, 18
00001FF6        lea     rcx, ptr [?_363]                ; 1FF6 _ 48: 8D. 0D, 00002288(rel)
00001FFD        lea     r8, ptr [?_362]                 ; 1FFD _ 4C: 8D. 05, 00002243(rel)
00002004        mov     edx, 57                         ; 2004 _ BA, 00000039
00002009        call    _DebugAssert                    ; 2009 _ E8, FFFFFDF7
?_183:
0000200E        cmp     rbx, rdi                        ; 200E _ 48: 39. FB
00002011        jnz     ?_185                           ; 2011 _ 75, 0C
?_184:
00002013        mov     rax, rbx                        ; 2013 _ 48: 89. D8
00002016        add     rsp, 40                         ; 2016 _ 48: 83. C4, 28
0000201A        pop     rbx                             ; 201A _ 5B
0000201B        pop     rdi                             ; 201B _ 5F
0000201C        pop     rsi                             ; 201C _ 5E
0000201D        pop     rbp                             ; 201D _ 5D
0000201E        ret                                     ; 201E _ C3
_CopyMem ENDP

?_185   LABEL NEAR
0000201F        mov     rcx, rbx                        ; 201F _ 48: 89. D9
00002022        mov     rdx, rdi                        ; 2022 _ 48: 89. FA
00002025        mov     r8, rsi                         ; 2025 _ 49: 89. F0
00002028        add     rsp, 40                         ; 2028 _ 48: 83. C4, 28
0000202C        pop     rbx                             ; 202C _ 5B
0000202D        pop     rdi                             ; 202D _ 5F
0000202E        pop     rsi                             ; 202E _ 5E
0000202F        pop     rbp                             ; 202F _ 5D
00002030        jmp     _InternalMemCopyMem             ; 2030 _ E9, 0000002E
; Note: Immediate operand could be made smaller by sign extension

_InternalMemCompareMem PROC
00002035        mov     r9d, 1                          ; 2035 _ 41: B9, 00000001
0000203B        sub     r9, r8                          ; 203B _ 4D: 29. C1
0000203E        jmp     ?_187                           ; 203E _ EB, 09

?_186:
00002040        inc     r9                              ; 2040 _ 49: FF. C1
00002043        inc     rdx                             ; 2043 _ 48: FF. C2
00002046        inc     rcx                             ; 2046 _ 48: FF. C1
?_187:
00002049        mov     al, byte ptr [rdx]              ; 2049 _ 8A. 02
0000204B        mov     r8b, byte ptr [rcx]             ; 204B _ 44: 8A. 01
0000204E        test    r9, r9                          ; 204E _ 4D: 85. C9
00002051        jz      ?_188                           ; 2051 _ 74, 05
00002053        cmp     r8b, al                         ; 2053 _ 41: 38. C0
00002056        jz      ?_186                           ; 2056 _ 74, E8
?_188:
00002058        movzx   ecx, al                         ; 2058 _ 0F B6. C8
0000205B        movzx   eax, r8b                        ; 205B _ 41: 0F B6. C0
0000205F        sub     rax, rcx                        ; 205F _ 48: 29. C8
00002062        ret                                     ; 2062 _ C3
_InternalMemCompareMem ENDP

_InternalMemCopyMem PROC
00002063        cmp     rdx, rcx                        ; 2063 _ 48: 39. CA
00002066        jbe     ?_190                           ; 2066 _ 76, 1A
00002068        test    r8, r8                          ; 2068 _ 4D: 85. C0
0000206B        jz      ?_192                           ; 206B _ 74, 2B
0000206D        mov     r9, rcx                         ; 206D _ 49: 89. C9
?_189:
00002070        mov     al, byte ptr [rdx]              ; 2070 _ 8A. 02
00002072        mov     byte ptr [r9], al               ; 2072 _ 41: 88. 01
00002075        inc     r9                              ; 2075 _ 49: FF. C1
00002078        inc     rdx                             ; 2078 _ 48: FF. C2
0000207B        dec     r8                              ; 207B _ 49: FF. C8
0000207E        jnz     ?_189                           ; 207E _ 75, F0
00002080        jmp     ?_192                           ; 2080 _ EB, 16

?_190:
00002082        jnc     ?_192                           ; 2082 _ 73, 14
00002084        test    r8, r8                          ; 2084 _ 4D: 85. C0
00002087        jz      ?_192                           ; 2087 _ 74, 0F
?_191:
00002089        mov     al, byte ptr [rdx+r8-1H]        ; 2089 _ 42: 8A. 44 02, FF
0000208E        mov     byte ptr [rcx+r8-1H], al        ; 208E _ 42: 88. 44 01, FF
00002093        dec     r8                              ; 2093 _ 49: FF. C8
00002096        jnz     ?_191                           ; 2096 _ 75, F1
?_192:
00002098        mov     rax, rcx                        ; 2098 _ 48: 89. C8
0000209B        ret                                     ; 209B _ C3
_InternalMemCopyMem ENDP

_UefiBootServicesTableLibConstructor PROC
0000209C        push    rbp                             ; 209C _ 55
0000209D        mov     rbp, rsp                        ; 209D _ 48: 89. E5
000020A0        push    rsi                             ; 20A0 _ 56
000020A1        sub     rsp, 40                         ; 20A1 _ 48: 83. EC, 28
000020A5        mov     rsi, rdx                        ; 20A5 _ 48: 89. D6
000020A8        mov     qword ptr [_gImageHandle], rcx  ; 20A8 _ 48: 89. 0D, 000038A9(rel)
000020AF        call    _DebugAssertEnabled             ; 20AF _ E8, FFFFFD46
000020B4        test    al, al                          ; 20B4 _ 84. C0
000020B6        jz      ?_193                           ; 20B6 _ 74, 24
000020B8        mov     rax, qword ptr [_gImageHandle]  ; 20B8 _ 48: 8B. 05, 00003899(rel)
000020BF        test    rax, rax                        ; 20BF _ 48: 85. C0
000020C2        jnz     ?_193                           ; 20C2 _ 75, 18
000020C4        lea     rcx, ptr [?_364]                ; 20C4 _ 48: 8D. 0D, 0000221B(rel)
000020CB        lea     r8, ptr [?_365]                 ; 20CB _ 4C: 8D. 05, 0000228A(rel)
000020D2        mov     edx, 51                         ; 20D2 _ BA, 00000033
000020D7        call    _DebugAssert                    ; 20D7 _ E8, FFFFFD29
?_193:
000020DC        mov     qword ptr [_gST], rsi           ; 20DC _ 48: 89. 35, 0000387D(rel)
000020E3        call    _DebugAssertEnabled             ; 20E3 _ E8, FFFFFD12
000020E8        test    al, al                          ; 20E8 _ 84. C0
000020EA        jz      ?_194                           ; 20EA _ 74, 24
000020EC        mov     rax, qword ptr [_gST]           ; 20EC _ 48: 8B. 05, 0000386D(rel)
000020F3        test    rax, rax                        ; 20F3 _ 48: 85. C0
000020F6        jnz     ?_194                           ; 20F6 _ 75, 18
000020F8        lea     rcx, ptr [?_364]                ; 20F8 _ 48: 8D. 0D, 000021E7(rel)
000020FF        lea     r8, ptr [?_366]                 ; 20FF _ 4C: 8D. 05, 00002273(rel)
00002106        mov     edx, 57                         ; 2106 _ BA, 00000039
0000210B        call    _DebugAssert                    ; 210B _ E8, FFFFFCF5
?_194:
00002110        mov     rax, qword ptr [rsi+60H]        ; 2110 _ 48: 8B. 46, 60
00002114        mov     qword ptr [_gBS], rax           ; 2114 _ 48: 89. 05, 0000384D(rel)
0000211B        call    _DebugAssertEnabled             ; 211B _ E8, FFFFFCDA
00002120        test    al, al                          ; 2120 _ 84. C0
00002122        jz      ?_195                           ; 2122 _ 74, 24
00002124        mov     rax, qword ptr [_gBS]           ; 2124 _ 48: 8B. 05, 0000383D(rel)
0000212B        test    rax, rax                        ; 212B _ 48: 85. C0
0000212E        jnz     ?_195                           ; 212E _ 75, 18
00002130        lea     rcx, ptr [?_364]                ; 2130 _ 48: 8D. 0D, 000021AF(rel)
00002137        lea     r8, ptr [?_367]                 ; 2137 _ 4C: 8D. 05, 0000224F(rel)
0000213E        mov     edx, 63                         ; 213E _ BA, 0000003F
00002143        call    _DebugAssert                    ; 2143 _ E8, FFFFFCBD
?_195:
00002148        xor     eax, eax                        ; 2148 _ 31. C0
0000214A        add     rsp, 40                         ; 214A _ 48: 83. C4, 28
0000214E        pop     rsi                             ; 214E _ 5E
0000214F        pop     rbp                             ; 214F _ 5D
00002150        ret                                     ; 2150 _ C3
_UefiBootServicesTableLibConstructor ENDP

_InternalAllocatePool PROC
00002151        push    rbp                             ; 2151 _ 55
00002152        mov     rbp, rsp                        ; 2152 _ 48: 89. E5
00002155        sub     rsp, 48                         ; 2155 _ 48: 83. EC, 30
00002159        mov     rax, qword ptr [_gBS]           ; 2159 _ 48: 8B. 05, 00003808(rel)
00002160        lea     r8, ptr [rbp-8H]                ; 2160 _ 4C: 8D. 45, F8
00002164        call    qword ptr [rax+40H]             ; 2164 _ FF. 50, 40
00002167        test    rax, rax                        ; 2167 _ 48: 85. C0
0000216A        js      ?_196                           ; 216A _ 78, 06
0000216C        mov     rax, qword ptr [rbp-8H]         ; 216C _ 48: 8B. 45, F8
00002170        jmp     ?_197                           ; 2170 _ EB, 0A

?_196:
00002172        mov     qword ptr [rbp-8H], 0           ; 2172 _ 48: C7. 45, F8, 00000000
0000217A        xor     eax, eax                        ; 217A _ 31. C0
?_197:
0000217C        add     rsp, 48                         ; 217C _ 48: 83. C4, 30
00002180        pop     rbp                             ; 2180 _ 5D
00002181        ret                                     ; 2181 _ C3
_InternalAllocatePool ENDP

_AllocatePool PROC
00002182        mov     rax, rcx                        ; 2182 _ 48: 89. C8
00002185        mov     ecx, 4                          ; 2185 _ B9, 00000004
0000218A        mov     rdx, rax                        ; 218A _ 48: 89. C2
0000218D        jmp     _InternalAllocatePool           ; 218D _ E9, FFFFFFBF
; Note: Immediate operand could be made smaller by sign extension
_AllocatePool ENDP

_InternalAllocateCopyPool PROC
00002192        push    rbp                             ; 2192 _ 55
00002193        mov     rbp, rsp                        ; 2193 _ 48: 89. E5
00002196        push    rsi                             ; 2196 _ 56
00002197        push    rdi                             ; 2197 _ 57
00002198        push    rbx                             ; 2198 _ 53
00002199        sub     rsp, 40                         ; 2199 _ 48: 83. EC, 28
0000219D        mov     rsi, r8                         ; 219D _ 4C: 89. C6
000021A0        mov     rdi, rdx                        ; 21A0 _ 48: 89. D7
000021A3        mov     ebx, ecx                        ; 21A3 _ 89. CB
000021A5        call    _DebugAssertEnabled             ; 21A5 _ E8, FFFFFC50
000021AA        test    al, al                          ; 21AA _ 84. C0
000021AC        jz      ?_198                           ; 21AC _ 74, 1D
000021AE        test    rsi, rsi                        ; 21AE _ 48: 85. F6
000021B1        jnz     ?_198                           ; 21B1 _ 75, 18
000021B3        lea     rcx, ptr [?_368]                ; 21B3 _ 48: 8D. 0D, 000021E7(rel)
000021BA        lea     r8, ptr [?_325]                 ; 21BA _ 4C: 8D. 05, 00001A57(rel)
000021C1        mov     edx, 569                        ; 21C1 _ BA, 00000239
000021C6        call    _DebugAssert                    ; 21C6 _ E8, FFFFFC3A
?_198:
000021CB        call    _DebugAssertEnabled             ; 21CB _ E8, FFFFFC2A
000021D0        test    al, al                          ; 21D0 _ 84. C0
000021D2        jz      ?_199                           ; 21D2 _ 74, 23
000021D4        mov     rax, rsi                        ; 21D4 _ 48: 89. F0
000021D7        neg     rax                             ; 21D7 _ 48: F7. D8
000021DA        cmp     rdi, rax                        ; 21DA _ 48: 39. C7
000021DD        jbe     ?_199                           ; 21DD _ 76, 18
000021DF        lea     rcx, ptr [?_368]                ; 21DF _ 48: 8D. 0D, 000021BB(rel)
000021E6        lea     r8, ptr [?_371]                 ; 21E6 _ 4C: 8D. 05, 00002259(rel)
000021ED        mov     edx, 570                        ; 21ED _ BA, 0000023A
000021F2        call    _DebugAssert                    ; 21F2 _ E8, FFFFFC0E
?_199:
000021F7        mov     ecx, ebx                        ; 21F7 _ 89. D9
000021F9        mov     rdx, rdi                        ; 21F9 _ 48: 89. FA
000021FC        call    _InternalAllocatePool           ; 21FC _ E8, FFFFFF50
00002201        test    rax, rax                        ; 2201 _ 48: 85. C0
00002204        jnz     ?_200                           ; 2204 _ 75, 0B
00002206        xor     eax, eax                        ; 2206 _ 31. C0
00002208        add     rsp, 40                         ; 2208 _ 48: 83. C4, 28
0000220C        pop     rbx                             ; 220C _ 5B
0000220D        pop     rdi                             ; 220D _ 5F
0000220E        pop     rsi                             ; 220E _ 5E
0000220F        pop     rbp                             ; 220F _ 5D
00002210        ret                                     ; 2210 _ C3
_InternalAllocateCopyPool ENDP

?_200   LABEL NEAR
00002211        mov     rcx, rax                        ; 2211 _ 48: 89. C1
00002214        mov     rdx, rsi                        ; 2214 _ 48: 89. F2
00002217        mov     r8, rdi                         ; 2217 _ 49: 89. F8
0000221A        add     rsp, 40                         ; 221A _ 48: 83. C4, 28
0000221E        pop     rbx                             ; 221E _ 5B
0000221F        pop     rdi                             ; 221F _ 5F
00002220        pop     rsi                             ; 2220 _ 5E
00002221        pop     rbp                             ; 2221 _ 5D
00002222        jmp     _CopyMem                        ; 2222 _ E9, FFFFFD6E

_AllocateCopyPool PROC
00002227        mov     rax, rdx                        ; 2227 _ 48: 89. D0
0000222A        mov     rdx, rcx                        ; 222A _ 48: 89. CA
0000222D        mov     ecx, 4                          ; 222D _ B9, 00000004
00002232        mov     r8, rax                         ; 2232 _ 49: 89. C0
00002235        jmp     _InternalAllocateCopyPool       ; 2235 _ E9, FFFFFF58
_AllocateCopyPool ENDP

_FreePool PROC
0000223A        push    rbp                             ; 223A _ 55
0000223B        mov     rbp, rsp                        ; 223B _ 48: 89. E5
0000223E        push    rsi                             ; 223E _ 56
0000223F        sub     rsp, 40                         ; 223F _ 48: 83. EC, 28
00002243        mov     rax, qword ptr [_gBS]           ; 2243 _ 48: 8B. 05, 0000371E(rel)
0000224A        call    qword ptr [rax+48H]             ; 224A _ FF. 50, 48
0000224D        mov     rsi, rax                        ; 224D _ 48: 89. C6
00002250        call    _DebugAssertEnabled             ; 2250 _ E8, FFFFFBA5
00002255        test    al, al                          ; 2255 _ 84. C0
00002257        jz      ?_202                           ; 2257 _ 74, 4E
00002259        test    rsi, rsi                        ; 2259 _ 48: 85. F6
0000225C        jns     ?_202                           ; 225C _ 79, 49
0000225E        call    _DebugPrintEnabled              ; 225E _ E8, FFFFFC21
00002263        test    al, al                          ; 2263 _ 84. C0
00002265        jz      ?_201                           ; 2265 _ 74, 22
00002267        mov     ecx, 2147483648                 ; 2267 _ B9, 80000000
0000226C        call    _DebugPrintLevelEnabled         ; 226C _ E8, FFFFFC21
00002271        test    al, al                          ; 2271 _ 84. C0
00002273        jz      ?_201                           ; 2273 _ 74, 14
00002275        lea     rdx, ptr [?_369]                ; 2275 _ 48: 8D. 15, 00002195(rel)
0000227C        mov     ecx, 2147483648                 ; 227C _ B9, 80000000
00002281        mov     r8, rsi                         ; 2281 _ 49: 89. F0
00002284        call    _DebugPrint                     ; 2284 _ E8, FFFFFAD1
?_201:
00002289        lea     rcx, ptr [?_368]                ; 2289 _ 48: 8D. 0D, 00002111(rel)
00002290        lea     r8, ptr [?_370]                 ; 2290 _ 4C: 8D. 05, 0000219B(rel)
00002297        mov     edx, 819                        ; 2297 _ BA, 00000333
0000229C        add     rsp, 40                         ; 229C _ 48: 83. C4, 28
000022A0        pop     rsi                             ; 22A0 _ 5E
000022A1        pop     rbp                             ; 22A1 _ 5D
000022A2        jmp     _DebugAssert                    ; 22A2 _ E9, FFFFFB5E
_FreePool ENDP

?_202   LABEL NEAR
000022A7        add     rsp, 40                         ; 22A7 _ 48: 83. C4, 28
000022AB        pop     rsi                             ; 22AB _ 5E
000022AC        pop     rbp                             ; 22AC _ 5D
000022AD        ret                                     ; 22AD _ C3

_UefiRuntimeServicesTableLibConstructor PROC
000022AE        push    rbp                             ; 22AE _ 55
000022AF        mov     rbp, rsp                        ; 22AF _ 48: 89. E5
000022B2        sub     rsp, 32                         ; 22B2 _ 48: 83. EC, 20
000022B6        mov     rax, qword ptr [rdx+58H]        ; 22B6 _ 48: 8B. 42, 58
000022BA        mov     qword ptr [_gRT], rax           ; 22BA _ 48: 89. 05, 000036AF(rel)
000022C1        call    _DebugAssertEnabled             ; 22C1 _ E8, FFFFFB34
000022C6        test    al, al                          ; 22C6 _ 84. C0
000022C8        jz      ?_203                           ; 22C8 _ 74, 24
000022CA        mov     rax, qword ptr [_gRT]           ; 22CA _ 48: 8B. 05, 0000369F(rel)
000022D1        test    rax, rax                        ; 22D1 _ 48: 85. C0
000022D4        jnz     ?_203                           ; 22D4 _ 75, 18
000022D6        lea     rcx, ptr [?_372]                ; 22D6 _ 48: 8D. 0D, 000021A8(rel)
000022DD        lea     r8, ptr [?_373]                 ; 22DD _ 4C: 8D. 05, 0000221D(rel)
000022E4        mov     edx, 47                         ; 22E4 _ BA, 0000002F
000022E9        call    _DebugAssert                    ; 22E9 _ E8, FFFFFB17
?_203:
000022EE        xor     eax, eax                        ; 22EE _ 31. C0
000022F0        add     rsp, 32                         ; 22F0 _ 48: 83. C4, 20
000022F4        pop     rbp                             ; 22F4 _ 5D
000022F5        ret                                     ; 22F5 _ C3
_UefiRuntimeServicesTableLibConstructor ENDP

_IsDevicePathValid PROC
000022F6        push    rbp                             ; 22F6 _ 55
000022F7        mov     rbp, rsp                        ; 22F7 _ 48: 89. E5
000022FA        push    r15                             ; 22FA _ 41: 57
000022FC        push    r14                             ; 22FC _ 41: 56
000022FE        push    r12                             ; 22FE _ 41: 54
00002300        push    rsi                             ; 2300 _ 56
00002301        push    rdi                             ; 2301 _ 57
00002302        push    rbx                             ; 2302 _ 53
00002303        sub     rsp, 32                         ; 2303 _ 48: 83. EC, 20
00002307        mov     r14, rdx                        ; 2307 _ 49: 89. D6
0000230A        mov     rdi, rcx                        ; 230A _ 48: 89. CF
0000230D        call    _DebugAssertEnabled             ; 230D _ E8, FFFFFAE8
00002312        test    al, al                          ; 2312 _ 84. C0
00002314        jz      ?_204                           ; 2314 _ 74, 1D
00002316        test    rdi, rdi                        ; 2316 _ 48: 85. FF
00002319        jnz     ?_204                           ; 2319 _ 75, 18
0000231B        lea     rcx, ptr [?_374]                ; 231B _ 48: 8D. 0D, 000021F3(rel)
00002322        lea     r8, ptr [?_375]                 ; 2322 _ 4C: 8D. 05, 00002256(rel)
00002329        mov     edx, 62                         ; 2329 _ BA, 0000003E
0000232E        call    _DebugAssert                    ; 232E _ E8, FFFFFAD2
?_204:
00002333        xor     esi, esi                        ; 2333 _ 31. F6
00002335        mov     r15d, dword ptr [__gPcd_FixedAtBuild_PcdMaximumDevicePathNodeCount]; 2335 _ 44: 8B. 3D, 00001638(rel)
0000233C        mov     r12, rsi                        ; 233C _ 49: 89. F4
0000233F        jmp     ?_208                           ; 233F _ EB, 36

?_205:
00002341        xor     cl, cl                          ; 2341 _ 30. C9
00002343        cmp     rax, 4                          ; 2343 _ 48: 83. F8, 04
00002347        jc      ?_209                           ; 2347 _ 72, 4B
00002349        test    r14, r14                        ; 2349 _ 4D: 85. F6
0000234C        jz      ?_206                           ; 234C _ 74, 0F
0000234E        lea     rdx, ptr [rax+r12+4H]           ; 234E _ 4A: 8D. 54 20, 04
00002353        xor     cl, cl                          ; 2353 _ 30. C9
00002355        cmp     rdx, r14                        ; 2355 _ 4C: 39. F2
00002358        ja      ?_209                           ; 2358 _ 77, 3A
0000235A        add     r12, rax                        ; 235A _ 49: 01. C4
?_206:
0000235D        test    r15d, r15d                      ; 235D _ 45: 85. FF
00002360        jz      ?_207                           ; 2360 _ 74, 0A
00002362        inc     rsi                             ; 2362 _ 48: FF. C6
00002365        xor     cl, cl                          ; 2365 _ 30. C9
00002367        cmp     rsi, r15                        ; 2367 _ 4C: 39. FE
0000236A        jnc     ?_209                           ; 236A _ 73, 28
?_207:
0000236C        mov     rcx, rdi                        ; 236C _ 48: 89. F9
0000236F        call    _NextDevicePathNode             ; 236F _ E8, 000000D1
00002374        mov     rdi, rax                        ; 2374 _ 48: 89. C7
?_208:
00002377        mov     rcx, rdi                        ; 2377 _ 48: 89. F9
0000237A        call    _IsDevicePathEnd                ; 237A _ E8, 00000027
0000237F        mov     bl, al                          ; 237F _ 88. C3
00002381        mov     rcx, rdi                        ; 2381 _ 48: 89. F9
00002384        call    _DevicePathNodeLength           ; 2384 _ E8, 00000074
00002389        test    bl, bl                          ; 2389 _ 84. DB
0000238B        jz      ?_205                           ; 238B _ 74, B4
0000238D        cmp     rax, 4                          ; 238D _ 48: 83. F8, 04
00002391        sete    cl                              ; 2391 _ 0F 94. C1
?_209:
00002394        movzx   eax, cl                         ; 2394 _ 0F B6. C1
00002397        add     rsp, 32                         ; 2397 _ 48: 83. C4, 20
0000239B        pop     rbx                             ; 239B _ 5B
0000239C        pop     rdi                             ; 239C _ 5F
0000239D        pop     rsi                             ; 239D _ 5E
0000239E        pop     r12                             ; 239E _ 41: 5C
000023A0        pop     r14                             ; 23A0 _ 41: 5E
000023A2        pop     r15                             ; 23A2 _ 41: 5F
000023A4        pop     rbp                             ; 23A4 _ 5D
000023A5        ret                                     ; 23A5 _ C3
_IsDevicePathValid ENDP

_IsDevicePathEnd PROC
000023A6        push    rbp                             ; 23A6 _ 55
000023A7        mov     rbp, rsp                        ; 23A7 _ 48: 89. E5
000023AA        push    rsi                             ; 23AA _ 56
000023AB        sub     rsp, 40                         ; 23AB _ 48: 83. EC, 28
000023AF        mov     rsi, rcx                        ; 23AF _ 48: 89. CE
000023B2        call    _DebugAssertEnabled             ; 23B2 _ E8, FFFFFA43
000023B7        test    al, al                          ; 23B7 _ 84. C0
000023B9        jz      ?_210                           ; 23B9 _ 74, 1D
000023BB        test    rsi, rsi                        ; 23BB _ 48: 85. F6
000023BE        jnz     ?_210                           ; 23BE _ 75, 18
000023C0        lea     rcx, ptr [?_374]                ; 23C0 _ 48: 8D. 0D, 0000214E(rel)
000023C7        lea     r8, ptr [?_345]                 ; 23C7 _ 4C: 8D. 05, 00001B2A(rel)
000023CE        mov     edx, 237                        ; 23CE _ BA, 000000ED
000023D3        call    _DebugAssert                    ; 23D3 _ E8, FFFFFA2D
?_210:
000023D8        mov     rcx, rsi                        ; 23D8 _ 48: 89. F1
000023DB        call    _IsDevicePathEndType            ; 23DB _ E8, 00000122
000023E0        xor     cl, cl                          ; 23E0 _ 30. C9
000023E2        test    al, al                          ; 23E2 _ 84. C0
000023E4        jz      ?_211                           ; 23E4 _ 74, 0D
000023E6        mov     rcx, rsi                        ; 23E6 _ 48: 89. F1
000023E9        call    _DevicePathSubType              ; 23E9 _ E8, 000000D7
000023EE        cmp     al, -1                          ; 23EE _ 3C, FF
000023F0        sete    cl                              ; 23F0 _ 0F 94. C1
?_211:
000023F3        movzx   eax, cl                         ; 23F3 _ 0F B6. C1
000023F6        add     rsp, 40                         ; 23F6 _ 48: 83. C4, 28
000023FA        pop     rsi                             ; 23FA _ 5E
000023FB        pop     rbp                             ; 23FB _ 5D
000023FC        ret                                     ; 23FC _ C3
_IsDevicePathEnd ENDP

_DevicePathNodeLength PROC
000023FD        push    rbp                             ; 23FD _ 55
000023FE        mov     rbp, rsp                        ; 23FE _ 48: 89. E5
00002401        push    rsi                             ; 2401 _ 56
00002402        sub     rsp, 40                         ; 2402 _ 48: 83. EC, 28
00002406        mov     rsi, rcx                        ; 2406 _ 48: 89. CE
00002409        call    _DebugAssertEnabled             ; 2409 _ E8, FFFFF9EC
0000240E        test    al, al                          ; 240E _ 84. C0
00002410        jz      ?_212                           ; 2410 _ 74, 1D
00002412        test    rsi, rsi                        ; 2412 _ 48: 85. F6
00002415        jnz     ?_212                           ; 2415 _ 75, 18
00002417        lea     rcx, ptr [?_374]                ; 2417 _ 48: 8D. 0D, 000020F7(rel)
0000241E        lea     r8, ptr [?_345]                 ; 241E _ 4C: 8D. 05, 00001AD3(rel)
00002425        mov     edx, 156                        ; 2425 _ BA, 0000009C
0000242A        call    _DebugAssert                    ; 242A _ E8, FFFFF9D6
?_212:
0000242F        add     rsi, 2                          ; 242F _ 48: 83. C6, 02
00002433        mov     rcx, rsi                        ; 2433 _ 48: 89. F1
00002436        call    _ReadUnaligned16                ; 2436 _ E8, FFFFF61D
0000243B        movzx   eax, ax                         ; 243B _ 0F B7. C0
0000243E        add     rsp, 40                         ; 243E _ 48: 83. C4, 28
00002442        pop     rsi                             ; 2442 _ 5E
00002443        pop     rbp                             ; 2443 _ 5D
00002444        ret                                     ; 2444 _ C3
_DevicePathNodeLength ENDP

_NextDevicePathNode PROC
00002445        push    rbp                             ; 2445 _ 55
00002446        mov     rbp, rsp                        ; 2446 _ 48: 89. E5
00002449        push    rsi                             ; 2449 _ 56
0000244A        sub     rsp, 40                         ; 244A _ 48: 83. EC, 28
0000244E        mov     rsi, rcx                        ; 244E _ 48: 89. CE
00002451        call    _DebugAssertEnabled             ; 2451 _ E8, FFFFF9A4
00002456        test    al, al                          ; 2456 _ 84. C0
00002458        jz      ?_213                           ; 2458 _ 74, 1D
0000245A        test    rsi, rsi                        ; 245A _ 48: 85. F6
0000245D        jnz     ?_213                           ; 245D _ 75, 18
0000245F        lea     rcx, ptr [?_374]                ; 245F _ 48: 8D. 0D, 000020AF(rel)
00002466        lea     r8, ptr [?_345]                 ; 2466 _ 4C: 8D. 05, 00001A8B(rel)
0000246D        mov     edx, 180                        ; 246D _ BA, 000000B4
00002472        call    _DebugAssert                    ; 2472 _ E8, FFFFF98E
?_213:
00002477        mov     rcx, rsi                        ; 2477 _ 48: 89. F1
0000247A        call    _DevicePathNodeLength           ; 247A _ E8, FFFFFF7E
0000247F        add     rax, rsi                        ; 247F _ 48: 01. F0
00002482        add     rsp, 40                         ; 2482 _ 48: 83. C4, 28
00002486        pop     rsi                             ; 2486 _ 5E
00002487        pop     rbp                             ; 2487 _ 5D
00002488        ret                                     ; 2488 _ C3
_NextDevicePathNode ENDP

_DevicePathType PROC
00002489        push    rbp                             ; 2489 _ 55
0000248A        mov     rbp, rsp                        ; 248A _ 48: 89. E5
0000248D        push    rsi                             ; 248D _ 56
0000248E        sub     rsp, 40                         ; 248E _ 48: 83. EC, 28
00002492        mov     rsi, rcx                        ; 2492 _ 48: 89. CE
00002495        call    _DebugAssertEnabled             ; 2495 _ E8, FFFFF960
0000249A        test    al, al                          ; 249A _ 84. C0
0000249C        jz      ?_214                           ; 249C _ 74, 1D
0000249E        test    rsi, rsi                        ; 249E _ 48: 85. F6
000024A1        jnz     ?_214                           ; 24A1 _ 75, 18
000024A3        lea     rcx, ptr [?_374]                ; 24A3 _ 48: 8D. 0D, 0000206B(rel)
000024AA        lea     r8, ptr [?_345]                 ; 24AA _ 4C: 8D. 05, 00001A47(rel)
000024B1        mov     edx, 109                        ; 24B1 _ BA, 0000006D
000024B6        call    _DebugAssert                    ; 24B6 _ E8, FFFFF94A
?_214:
000024BB        movzx   eax, byte ptr [rsi]             ; 24BB _ 0F B6. 06
000024BE        add     rsp, 40                         ; 24BE _ 48: 83. C4, 28
000024C2        pop     rsi                             ; 24C2 _ 5E
000024C3        pop     rbp                             ; 24C3 _ 5D
000024C4        ret                                     ; 24C4 _ C3
_DevicePathType ENDP

_DevicePathSubType PROC
000024C5        push    rbp                             ; 24C5 _ 55
000024C6        mov     rbp, rsp                        ; 24C6 _ 48: 89. E5
000024C9        push    rsi                             ; 24C9 _ 56
000024CA        sub     rsp, 40                         ; 24CA _ 48: 83. EC, 28
000024CE        mov     rsi, rcx                        ; 24CE _ 48: 89. CE
000024D1        call    _DebugAssertEnabled             ; 24D1 _ E8, FFFFF924
000024D6        test    al, al                          ; 24D6 _ 84. C0
000024D8        jz      ?_215                           ; 24D8 _ 74, 1D
000024DA        test    rsi, rsi                        ; 24DA _ 48: 85. F6
000024DD        jnz     ?_215                           ; 24DD _ 75, 18
000024DF        lea     rcx, ptr [?_374]                ; 24DF _ 48: 8D. 0D, 0000202F(rel)
000024E6        lea     r8, ptr [?_345]                 ; 24E6 _ 4C: 8D. 05, 00001A0B(rel)
000024ED        mov     edx, 131                        ; 24ED _ BA, 00000083
000024F2        call    _DebugAssert                    ; 24F2 _ E8, FFFFF90E
?_215:
000024F7        movzx   eax, byte ptr [rsi+1H]          ; 24F7 _ 0F B6. 46, 01
000024FB        add     rsp, 40                         ; 24FB _ 48: 83. C4, 28
000024FF        pop     rsi                             ; 24FF _ 5E
00002500        pop     rbp                             ; 2500 _ 5D
00002501        ret                                     ; 2501 _ C3
_DevicePathSubType ENDP

_IsDevicePathEndType PROC
00002502        push    rbp                             ; 2502 _ 55
00002503        mov     rbp, rsp                        ; 2503 _ 48: 89. E5
00002506        push    rsi                             ; 2506 _ 56
00002507        sub     rsp, 40                         ; 2507 _ 48: 83. EC, 28
0000250B        mov     rsi, rcx                        ; 250B _ 48: 89. CE
0000250E        call    _DebugAssertEnabled             ; 250E _ E8, FFFFF8E7
00002513        test    al, al                          ; 2513 _ 84. C0
00002515        jz      ?_216                           ; 2515 _ 74, 1D
00002517        test    rsi, rsi                        ; 2517 _ 48: 85. F6
0000251A        jnz     ?_216                           ; 251A _ 75, 18
0000251C        lea     rcx, ptr [?_374]                ; 251C _ 48: 8D. 0D, 00001FF2(rel)
00002523        lea     r8, ptr [?_345]                 ; 2523 _ 4C: 8D. 05, 000019CE(rel)
0000252A        mov     edx, 210                        ; 252A _ BA, 000000D2
0000252F        call    _DebugAssert                    ; 252F _ E8, FFFFF8D1
?_216:
00002534        mov     rcx, rsi                        ; 2534 _ 48: 89. F1
00002537        call    _DevicePathType                 ; 2537 _ E8, FFFFFF4D
0000253C        cmp     al, 127                         ; 253C _ 3C, 7F
0000253E        sete    al                              ; 253E _ 0F 94. C0
00002541        movzx   eax, al                         ; 2541 _ 0F B6. C0
00002544        add     rsp, 40                         ; 2544 _ 48: 83. C4, 28
00002548        pop     rsi                             ; 2548 _ 5E
00002549        pop     rbp                             ; 2549 _ 5D
0000254A        ret                                     ; 254A _ C3
_IsDevicePathEndType ENDP

_UefiDevicePathLibGetDevicePathSize PROC
0000254B        push    rbp                             ; 254B _ 55
0000254C        mov     rbp, rsp                        ; 254C _ 48: 89. E5
0000254F        push    rsi                             ; 254F _ 56
00002550        push    rdi                             ; 2550 _ 57
00002551        push    rbx                             ; 2551 _ 53
00002552        sub     rsp, 40                         ; 2552 _ 48: 83. EC, 28
00002556        mov     rsi, rcx                        ; 2556 _ 48: 89. CE
00002559        xor     edi, edi                        ; 2559 _ 31. FF
0000255B        test    rsi, rsi                        ; 255B _ 48: 85. F6
0000255E        jz      ?_219                           ; 255E _ 74, 4F
00002560        xor     edi, edi                        ; 2560 _ 31. FF
00002562        mov     rcx, rsi                        ; 2562 _ 48: 89. F1
00002565        xor     edx, edx                        ; 2565 _ 31. D2
00002567        call    _IsDevicePathValid              ; 2567 _ E8, FFFFFD8A
0000256C        test    al, al                          ; 256C _ 84. C0
0000256E        jz      ?_219                           ; 256E _ 74, 3F
00002570        mov     rcx, rsi                        ; 2570 _ 48: 89. F1
00002573        call    _IsDevicePathEnd                ; 2573 _ E8, FFFFFE2E
00002578        mov     rdi, rsi                        ; 2578 _ 48: 89. F7
0000257B        test    al, al                          ; 257B _ 84. C0
0000257D        jz      ?_217                           ; 257D _ 74, 05
0000257F        mov     rbx, rsi                        ; 257F _ 48: 89. F3
00002582        jmp     ?_218                           ; 2582 _ EB, 1A

?_217:
00002584        mov     rcx, rdi                        ; 2584 _ 48: 89. F9
00002587        call    _NextDevicePathNode             ; 2587 _ E8, FFFFFEB9
0000258C        mov     rdi, rax                        ; 258C _ 48: 89. C7
0000258F        mov     rcx, rdi                        ; 258F _ 48: 89. F9
00002592        call    _IsDevicePathEnd                ; 2592 _ E8, FFFFFE0F
00002597        test    al, al                          ; 2597 _ 84. C0
00002599        mov     rbx, rdi                        ; 2599 _ 48: 89. FB
0000259C        jz      ?_217                           ; 259C _ 74, E6
?_218:
0000259E        sub     rbx, rsi                        ; 259E _ 48: 29. F3
000025A1        mov     rcx, rdi                        ; 25A1 _ 48: 89. F9
000025A4        call    _DevicePathNodeLength           ; 25A4 _ E8, FFFFFE54
000025A9        mov     rdi, rax                        ; 25A9 _ 48: 89. C7
000025AC        add     rdi, rbx                        ; 25AC _ 48: 01. DF
?_219:
000025AF        mov     rax, rdi                        ; 25AF _ 48: 89. F8
000025B2        add     rsp, 40                         ; 25B2 _ 48: 83. C4, 28
000025B6        pop     rbx                             ; 25B6 _ 5B
000025B7        pop     rdi                             ; 25B7 _ 5F
000025B8        pop     rsi                             ; 25B8 _ 5E
000025B9        pop     rbp                             ; 25B9 _ 5D
000025BA        ret                                     ; 25BA _ C3
_UefiDevicePathLibGetDevicePathSize ENDP

_UefiDevicePathLibDuplicateDevicePath PROC
000025BB        push    rbp                             ; 25BB _ 55
000025BC        mov     rbp, rsp                        ; 25BC _ 48: 89. E5
000025BF        push    rsi                             ; 25BF _ 56
000025C0        sub     rsp, 40                         ; 25C0 _ 48: 83. EC, 28
000025C4        mov     rsi, rcx                        ; 25C4 _ 48: 89. CE
000025C7        call    _GetDevicePathSize              ; 25C7 _ E8, 000001E4
000025CC        test    rax, rax                        ; 25CC _ 48: 85. C0
000025CF        jnz     ?_220                           ; 25CF _ 75, 04
000025D1        xor     eax, eax                        ; 25D1 _ 31. C0
000025D3        jmp     ?_221                           ; 25D3 _ EB, 0B

?_220:
000025D5        mov     rcx, rax                        ; 25D5 _ 48: 89. C1
000025D8        mov     rdx, rsi                        ; 25D8 _ 48: 89. F2
000025DB        call    _AllocateCopyPool               ; 25DB _ E8, FFFFFC47
?_221:
000025E0        add     rsp, 40                         ; 25E0 _ 48: 83. C4, 28
000025E4        pop     rsi                             ; 25E4 _ 5E
000025E5        pop     rbp                             ; 25E5 _ 5D
000025E6        ret                                     ; 25E6 _ C3
_UefiDevicePathLibDuplicateDevicePath ENDP

_UefiDevicePathLibAppendDevicePathInstance PROC
000025E7        push    rbp                             ; 25E7 _ 55
000025E8        mov     rbp, rsp                        ; 25E8 _ 48: 89. E5
000025EB        push    r15                             ; 25EB _ 41: 57
000025ED        push    r14                             ; 25ED _ 41: 56
000025EF        push    rsi                             ; 25EF _ 56
000025F0        push    rdi                             ; 25F0 _ 57
000025F1        push    rbx                             ; 25F1 _ 53
000025F2        sub     rsp, 40                         ; 25F2 _ 48: 83. EC, 28
000025F6        mov     r15, rdx                        ; 25F6 _ 49: 89. D7
000025F9        mov     rbx, rcx                        ; 25F9 _ 48: 89. CB
000025FC        test    rbx, rbx                        ; 25FC _ 48: 85. DB
000025FF        je      ?_225                           ; 25FF _ 0F 84, 000000BC
00002605        xor     edi, edi                        ; 2605 _ 31. FF
00002607        test    r15, r15                        ; 2607 _ 4D: 85. FF
0000260A        je      ?_224                           ; 260A _ 0F 84, 000000A1
00002610        xor     edi, edi                        ; 2610 _ 31. FF
00002612        mov     rcx, rbx                        ; 2612 _ 48: 89. D9
00002615        xor     edx, edx                        ; 2615 _ 31. D2
00002617        call    _IsDevicePathValid              ; 2617 _ E8, FFFFFCDA
0000261C        test    al, al                          ; 261C _ 84. C0
0000261E        je      ?_224                           ; 261E _ 0F 84, 0000008D
00002624        xor     edi, edi                        ; 2624 _ 31. FF
00002626        mov     rcx, r15                        ; 2626 _ 4C: 89. F9
00002629        xor     edx, edx                        ; 2629 _ 31. D2
0000262B        call    _IsDevicePathValid              ; 262B _ E8, FFFFFCC6
00002630        test    al, al                          ; 2630 _ 84. C0
00002632        jz      ?_224                           ; 2632 _ 74, 7D
00002634        mov     rcx, rbx                        ; 2634 _ 48: 89. D9
00002637        call    _GetDevicePathSize              ; 2637 _ E8, 00000174
0000263C        mov     rsi, rax                        ; 263C _ 48: 89. C6
0000263F        mov     rcx, r15                        ; 263F _ 4C: 89. F9
00002642        call    _GetDevicePathSize              ; 2642 _ E8, 00000169
00002647        mov     r14, rax                        ; 2647 _ 49: 89. C6
0000264A        lea     rcx, ptr [r14+rsi]              ; 264A _ 49: 8D. 0C 36
0000264E        call    _AllocatePool                   ; 264E _ E8, FFFFFB2F
00002653        mov     rdi, rax                        ; 2653 _ 48: 89. C7
00002656        test    rdi, rdi                        ; 2656 _ 48: 85. FF
00002659        jz      ?_224                           ; 2659 _ 74, 56
0000265B        mov     rcx, rdi                        ; 265B _ 48: 89. F9
0000265E        mov     rdx, rbx                        ; 265E _ 48: 89. DA
00002661        mov     r8, rsi                         ; 2661 _ 49: 89. F0
00002664        call    _CopyMem                        ; 2664 _ E8, FFFFF92C
00002669        mov     rbx, rax                        ; 2669 _ 48: 89. C3
0000266C        mov     rcx, rbx                        ; 266C _ 48: 89. D9
0000266F        call    _IsDevicePathEnd                ; 266F _ E8, FFFFFD32
00002674        test    al, al                          ; 2674 _ 84. C0
00002676        jz      ?_222                           ; 2676 _ 74, 05
00002678        mov     rax, rbx                        ; 2678 _ 48: 89. D8
0000267B        jmp     ?_223                           ; 267B _ EB, 1A

?_222:
0000267D        mov     rcx, rbx                        ; 267D _ 48: 89. D9
00002680        call    _NextDevicePathNode             ; 2680 _ E8, FFFFFDC0
00002685        mov     rbx, rax                        ; 2685 _ 48: 89. C3
00002688        mov     rcx, rbx                        ; 2688 _ 48: 89. D9
0000268B        call    _IsDevicePathEnd                ; 268B _ E8, FFFFFD16
00002690        test    al, al                          ; 2690 _ 84. C0
00002692        mov     rax, rbx                        ; 2692 _ 48: 89. D8
00002695        jz      ?_222                           ; 2695 _ 74, E6
?_223:
00002697        mov     byte ptr [rax+1H], 1            ; 2697 _ C6. 40, 01, 01
0000269B        mov     rcx, rbx                        ; 269B _ 48: 89. D9
0000269E        call    _NextDevicePathNode             ; 269E _ E8, FFFFFDA2
000026A3        mov     rcx, rax                        ; 26A3 _ 48: 89. C1
000026A6        mov     rdx, r15                        ; 26A6 _ 4C: 89. FA
000026A9        mov     r8, r14                         ; 26A9 _ 4D: 89. F0
000026AC        call    _CopyMem                        ; 26AC _ E8, FFFFF8E4
?_224:
000026B1        mov     rax, rdi                        ; 26B1 _ 48: 89. F8
000026B4        add     rsp, 40                         ; 26B4 _ 48: 83. C4, 28
000026B8        pop     rbx                             ; 26B8 _ 5B
000026B9        pop     rdi                             ; 26B9 _ 5F
000026BA        pop     rsi                             ; 26BA _ 5E
000026BB        pop     r14                             ; 26BB _ 41: 5E
000026BD        pop     r15                             ; 26BD _ 41: 5F
000026BF        pop     rbp                             ; 26BF _ 5D
000026C0        ret                                     ; 26C0 _ C3
_UefiDevicePathLibAppendDevicePathInstance ENDP

?_225   LABEL NEAR
000026C1        mov     rcx, r15                        ; 26C1 _ 4C: 89. F9
000026C4        add     rsp, 40                         ; 26C4 _ 48: 83. C4, 28
000026C8        pop     rbx                             ; 26C8 _ 5B
000026C9        pop     rdi                             ; 26C9 _ 5F
000026CA        pop     rsi                             ; 26CA _ 5E
000026CB        pop     r14                             ; 26CB _ 41: 5E
000026CD        pop     r15                             ; 26CD _ 41: 5F
000026CF        pop     rbp                             ; 26CF _ 5D
000026D0        jmp     _DuplicateDevicePath            ; 26D0 _ E9, 000000E0

_UefiDevicePathLibGetNextDevicePathInstance PROC
000026D5        push    rbp                             ; 26D5 _ 55
000026D6        mov     rbp, rsp                        ; 26D6 _ 48: 89. E5
000026D9        push    r15                             ; 26D9 _ 41: 57
000026DB        push    r14                             ; 26DB _ 41: 56
000026DD        push    rsi                             ; 26DD _ 56
000026DE        push    rdi                             ; 26DE _ 57
000026DF        push    rbx                             ; 26DF _ 53
000026E0        sub     rsp, 40                         ; 26E0 _ 48: 83. EC, 28
000026E4        mov     r14, rdx                        ; 26E4 _ 49: 89. D6
000026E7        mov     r15, rcx                        ; 26E7 _ 49: 89. CF
000026EA        call    _DebugAssertEnabled             ; 26EA _ E8, FFFFF70B
000026EF        test    al, al                          ; 26EF _ 84. C0
000026F1        jz      ?_226                           ; 26F1 _ 74, 1D
000026F3        test    r14, r14                        ; 26F3 _ 4D: 85. F6
000026F6        jnz     ?_226                           ; 26F6 _ 75, 18
000026F8        lea     rcx, ptr [?_374]                ; 26F8 _ 48: 8D. 0D, 00001E16(rel)
000026FF        lea     r8, ptr [?_376]                 ; 26FF _ 4C: 8D. 05, 00001E94(rel)
00002706        mov     edx, 655                        ; 2706 _ BA, 0000028F
0000270B        call    _DebugAssert                    ; 270B _ E8, FFFFF6F5
?_226:
00002710        test    r15, r15                        ; 2710 _ 4D: 85. FF
00002713        jz      ?_227                           ; 2713 _ 74, 08
00002715        mov     rcx, qword ptr [r15]            ; 2715 _ 49: 8B. 0F
00002718        test    rcx, rcx                        ; 2718 _ 48: 85. C9
0000271B        jnz     ?_228                           ; 271B _ 75, 0B
?_227:
0000271D        mov     qword ptr [r14], 0              ; 271D _ 49: C7. 06, 00000000
00002724        xor     edi, edi                        ; 2724 _ 31. FF
00002726        jmp     ?_232                           ; 2726 _ EB, 78

?_228:
00002728        xor     edi, edi                        ; 2728 _ 31. FF
0000272A        xor     edx, edx                        ; 272A _ 31. D2
0000272C        call    _IsDevicePathValid              ; 272C _ E8, FFFFFBC5
00002731        test    al, al                          ; 2731 _ 84. C0
00002733        jz      ?_232                           ; 2733 _ 74, 6B
00002735        mov     rsi, qword ptr [r15]            ; 2735 _ 49: 8B. 37
00002738        mov     rcx, rsi                        ; 2738 _ 48: 89. F1
0000273B        call    _IsDevicePathEndType            ; 273B _ E8, FFFFFDC2
00002740        test    al, al                          ; 2740 _ 84. C0
00002742        jz      ?_229                           ; 2742 _ 74, 05
00002744        mov     rbx, rsi                        ; 2744 _ 48: 89. F3
00002747        jmp     ?_230                           ; 2747 _ EB, 1A

?_229:
00002749        mov     rcx, rsi                        ; 2749 _ 48: 89. F1
0000274C        call    _NextDevicePathNode             ; 274C _ E8, FFFFFCF4
00002751        mov     rsi, rax                        ; 2751 _ 48: 89. C6
00002754        mov     rcx, rsi                        ; 2754 _ 48: 89. F1
00002757        call    _IsDevicePathEndType            ; 2757 _ E8, FFFFFDA6
0000275C        test    al, al                          ; 275C _ 84. C0
0000275E        mov     rbx, rsi                        ; 275E _ 48: 89. F3
00002761        jz      ?_229                           ; 2761 _ 74, E6
?_230:
00002763        lea     rax, ptr [rbx+4H]               ; 2763 _ 48: 8D. 43, 04
00002767        sub     rax, qword ptr [r15]            ; 2767 _ 49: 2B. 07
0000276A        mov     qword ptr [r14], rax            ; 276A _ 49: 89. 06
0000276D        mov     r14b, byte ptr [rbx+1H]         ; 276D _ 44: 8A. 73, 01
00002771        mov     byte ptr [rbx+1H], -1           ; 2771 _ C6. 43, 01, FF
00002775        mov     rcx, qword ptr [r15]            ; 2775 _ 49: 8B. 0F
00002778        call    _DuplicateDevicePath            ; 2778 _ E8, 00000038
0000277D        mov     rdi, rax                        ; 277D _ 48: 89. C7
00002780        mov     byte ptr [rbx+1H], r14b         ; 2780 _ 44: 88. 73, 01
00002784        mov     rcx, rsi                        ; 2784 _ 48: 89. F1
00002787        call    _DevicePathSubType              ; 2787 _ E8, FFFFFD39
0000278C        mov     cl, al                          ; 278C _ 88. C1
0000278E        xor     eax, eax                        ; 278E _ 31. C0
00002790        cmp     cl, -1                          ; 2790 _ 80. F9, FF
00002793        jz      ?_231                           ; 2793 _ 74, 08
00002795        mov     rcx, rsi                        ; 2795 _ 48: 89. F1
00002798        call    _NextDevicePathNode             ; 2798 _ E8, FFFFFCA8
?_231:
0000279D        mov     qword ptr [r15], rax            ; 279D _ 49: 89. 07
?_232:
000027A0        mov     rax, rdi                        ; 27A0 _ 48: 89. F8
000027A3        add     rsp, 40                         ; 27A3 _ 48: 83. C4, 28
000027A7        pop     rbx                             ; 27A7 _ 5B
000027A8        pop     rdi                             ; 27A8 _ 5F
000027A9        pop     rsi                             ; 27A9 _ 5E
000027AA        pop     r14                             ; 27AA _ 41: 5E
000027AC        pop     r15                             ; 27AC _ 41: 5F
000027AE        pop     rbp                             ; 27AE _ 5D
000027AF        ret                                     ; 27AF _ C3
_UefiDevicePathLibGetNextDevicePathInstance ENDP

_GetDevicePathSize PROC
000027B0        jmp     _UefiDevicePathLibGetDevicePathSize; 27B0 _ E9, FFFFFD96
_GetDevicePathSize ENDP

_DuplicateDevicePath PROC
000027B5        jmp     _UefiDevicePathLibDuplicateDevicePath; 27B5 _ E9, FFFFFE01
_DuplicateDevicePath ENDP

_AppendDevicePathInstance PROC
000027BA        jmp     _UefiDevicePathLibAppendDevicePathInstance; 27BA _ E9, FFFFFE28
_AppendDevicePathInstance ENDP

_GetNextDevicePathInstance PROC
000027BF        jmp     _UefiDevicePathLibGetNextDevicePathInstance; 27BF _ E9, FFFFFF11
_GetNextDevicePathInstance ENDP

_EfiLibInstallDriverBindingComponentName2 PROC
000027C4        push    rbp                             ; 27C4 _ 55
000027C5        mov     rbp, rsp                        ; 27C5 _ 48: 89. E5
000027C8        push    rsi                             ; 27C8 _ 56
000027C9        push    rdi                             ; 27C9 _ 57
000027CA        push    rbx                             ; 27CA _ 53
000027CB        sub     rsp, 72                         ; 27CB _ 48: 83. EC, 48
000027CF        mov     rdi, r9                         ; 27CF _ 4C: 89. CF
000027D2        mov     rsi, r8                         ; 27D2 _ 4C: 89. C6
000027D5        mov     rbx, rcx                        ; 27D5 _ 48: 89. CB
000027D8        call    _DebugAssertEnabled             ; 27D8 _ E8, FFFFF61D
000027DD        test    al, al                          ; 27DD _ 84. C0
000027DF        jz      ?_233                           ; 27DF _ 74, 1D
000027E1        test    rsi, rsi                        ; 27E1 _ 48: 85. F6
000027E4        jnz     ?_233                           ; 27E4 _ 75, 18
000027E6        lea     rcx, ptr [?_377]                ; 27E6 _ 48: 8D. 0D, 00001DC2(rel)
000027ED        lea     r8, ptr [?_378]                 ; 27ED _ 4C: 8D. 05, 00001E17(rel)
000027F4        mov     edx, 242                        ; 27F4 _ BA, 000000F2
000027F9        call    _DebugAssert                    ; 27F9 _ E8, FFFFF607
?_233:
000027FE        mov     r8, qword ptr [rbp+38H]         ; 27FE _ 4C: 8B. 45, 38
00002802        mov     r9, qword ptr [rbp+30H]         ; 2802 _ 4C: 8B. 4D, 30
00002806        mov     qword ptr [rsi+20H], rbx        ; 2806 _ 48: 89. 5E, 20
0000280A        mov     qword ptr [rsi+28H], rdi        ; 280A _ 48: 89. 7E, 28
0000280E        cmp     byte ptr [__gPcd_FixedAtBuild_PcdComponentName2Disable], 0; 280E _ 80. 3D, 00001166(rel), 00
00002815        sete    al                              ; 2815 _ 0F 94. C0
00002818        test    r8, r8                          ; 2818 _ 4D: 85. C0
0000281B        setne   bl                              ; 281B _ 0F 95. C3
0000281E        and     bl, al                          ; 281E _ 20. C3
00002820        lea     rcx, ptr [rsi+28H]              ; 2820 _ 48: 8D. 4E, 28
00002824        mov     rax, qword ptr [_gBS]           ; 2824 _ 48: 8B. 05, 0000313D(rel)
0000282B        mov     rax, qword ptr [rax+148H]       ; 282B _ 48: 8B. 80, 00000148
00002832        test    r9, r9                          ; 2832 _ 4D: 85. C9
00002835        jz      ?_234                           ; 2835 _ 74, 0A
00002837        mov     dl, byte ptr [__gPcd_FixedAtBuild_PcdComponentNameDisable]; 2837 _ 8A. 15, 0000113C(rel)
0000283D        test    dl, dl                          ; 283D _ 84. D2
0000283F        jz      ?_236                           ; 283F _ 74, 31
?_234:
00002841        test    bl, bl                          ; 2841 _ 84. DB
00002843        jnz     ?_235                           ; 2843 _ 75, 0F
00002845        lea     rdx, ptr [_gEfiDriverBindingProtocolGuid]; 2845 _ 48: 8D. 15, 000030CC(rel)
0000284C        mov     r8, rsi                         ; 284C _ 49: 89. F0
0000284F        xor     r9d, r9d                        ; 284F _ 45: 31. C9
00002852        jmp     ?_240                           ; 2852 _ EB, 62

?_235:
00002854        mov     qword ptr [rsp+20H], r8         ; 2854 _ 4C: 89. 44 24, 20
00002859        mov     qword ptr [rsp+28H], 0          ; 2859 _ 48: C7. 44 24, 28, 00000000
00002862        lea     rdx, ptr [_gEfiDriverBindingProtocolGuid]; 2862 _ 48: 8D. 15, 000030AF(rel)
00002869        lea     r9, ptr [_gEfiComponentName2ProtocolGuid]; 2869 _ 4C: 8D. 0D, 000030C8(rel)
00002870        jmp     ?_239                           ; 2870 _ EB, 41

?_236:
00002872        test    bl, bl                          ; 2872 _ 84. DB
00002874        jnz     ?_237                           ; 2874 _ 75, 10
00002876        mov     qword ptr [rsp+20H], r9         ; 2876 _ 4C: 89. 4C 24, 20
0000287B        mov     qword ptr [rsp+28H], 0          ; 287B _ 48: C7. 44 24, 28, 00000000
00002884        jmp     ?_238                           ; 2884 _ EB, 1F

?_237:
00002886        lea     rbx, ptr [_gEfiComponentName2ProtocolGuid]; 2886 _ 48: 8D. 1D, 000030AB(rel)
0000288D        mov     qword ptr [rsp+30H], r8         ; 288D _ 4C: 89. 44 24, 30
00002892        mov     qword ptr [rsp+28H], rbx        ; 2892 _ 48: 89. 5C 24, 28
00002897        mov     qword ptr [rsp+20H], r9         ; 2897 _ 4C: 89. 4C 24, 20
0000289C        mov     qword ptr [rsp+38H], 0          ; 289C _ 48: C7. 44 24, 38, 00000000
?_238:
000028A5        lea     rdx, ptr [_gEfiDriverBindingProtocolGuid]; 28A5 _ 48: 8D. 15, 0000306C(rel)
000028AC        lea     r9, ptr [_gEfiComponentNameProtocolGuid]; 28AC _ 4C: 8D. 0D, 00003075(rel)
?_239:
000028B3        mov     r8, rsi                         ; 28B3 _ 49: 89. F0
?_240:
000028B6        call    rax                             ; 28B6 _ FF. D0
000028B8        mov     rsi, rax                        ; 28B8 _ 48: 89. C6
000028BB        call    _DebugAssertEnabled             ; 28BB _ E8, FFFFF53A
000028C0        test    al, al                          ; 28C0 _ 84. C0
000028C2        jz      ?_242                           ; 28C2 _ 74, 48
000028C4        test    rsi, rsi                        ; 28C4 _ 48: 85. F6
000028C7        jns     ?_242                           ; 28C7 _ 79, 43
000028C9        call    _DebugPrintEnabled              ; 28C9 _ E8, FFFFF5B6
000028CE        test    al, al                          ; 28CE _ 84. C0
000028D0        jz      ?_241                           ; 28D0 _ 74, 22
000028D2        mov     ecx, 2147483648                 ; 28D2 _ B9, 80000000
000028D7        call    _DebugPrintLevelEnabled         ; 28D7 _ E8, FFFFF5B6
000028DC        test    al, al                          ; 28DC _ 84. C0
000028DE        jz      ?_241                           ; 28DE _ 74, 14
000028E0        lea     rdx, ptr [?_369]                ; 28E0 _ 48: 8D. 15, 00001B2A(rel)
000028E7        mov     ecx, 2147483648                 ; 28E7 _ B9, 80000000
000028EC        mov     r8, rsi                         ; 28EC _ 49: 89. F0
000028EF        call    _DebugPrint                     ; 28EF _ E8, FFFFF466
?_241:
000028F4        lea     rcx, ptr [?_377]                ; 28F4 _ 48: 8D. 0D, 00001CB4(rel)
000028FB        lea     r8, ptr [?_370]                 ; 28FB _ 4C: 8D. 05, 00001B30(rel)
00002902        mov     edx, 287                        ; 2902 _ BA, 0000011F
00002907        call    _DebugAssert                    ; 2907 _ E8, FFFFF4F9
?_242:
0000290C        mov     rax, rsi                        ; 290C _ 48: 89. F0
0000290F        add     rsp, 72                         ; 290F _ 48: 83. C4, 48
00002913        pop     rbx                             ; 2913 _ 5B
00002914        pop     rdi                             ; 2914 _ 5F
00002915        pop     rsi                             ; 2915 _ 5E
00002916        pop     rbp                             ; 2916 _ 5D
00002917        ret                                     ; 2917 _ C3
_EfiLibInstallDriverBindingComponentName2 ENDP

_UefiLibConstructor PROC
00002918        xor     eax, eax                        ; 2918 _ 31. C0
0000291A        ret                                     ; 291A _ C3
_UefiLibConstructor ENDP

_LookupUnicodeString2 PROC
0000291B        push    rbp                             ; 291B _ 55
0000291C        mov     rbp, rsp                        ; 291C _ 48: 89. E5
0000291F        push    r15                             ; 291F _ 41: 57
00002921        push    r14                             ; 2921 _ 41: 56
00002923        push    r13                             ; 2923 _ 41: 55
00002925        push    r12                             ; 2925 _ 41: 54
00002927        push    rsi                             ; 2927 _ 56
00002928        push    rdi                             ; 2928 _ 57
00002929        push    rbx                             ; 2929 _ 53
0000292A        sub     rsp, 40                         ; 292A _ 48: 83. EC, 28
0000292E        mov     r14, r9                         ; 292E _ 4D: 89. CE
00002931        mov     r15, r8                         ; 2931 _ 4D: 89. C7
00002934        mov     rsi, rdx                        ; 2934 _ 48: 89. D6
00002937        mov     r13, rcx                        ; 2937 _ 49: 89. CD
0000293A        mov     rax, 2H                         ; 293A _ 48: B8, 8000000000000002
00002944        test    r13, r13                        ; 2944 _ 4D: 85. ED
00002947        je      ?_257                           ; 2947 _ 0F 84, 00000105
0000294D        test    r14, r14                        ; 294D _ 4D: 85. F6
00002950        je      ?_257                           ; 2950 _ 0F 84, 000000FC
00002956        mov     rax, 3H                         ; 2956 _ 48: B8, 8000000000000003
00002960        test    rsi, rsi                        ; 2960 _ 48: 85. F6
00002963        je      ?_257                           ; 2963 _ 0F 84, 000000E9
00002969        test    r15, r15                        ; 2969 _ 4D: 85. FF
0000296C        je      ?_257                           ; 296C _ 0F 84, 000000E0
00002972        mov     r12b, byte ptr [rbp+30H]        ; 2972 _ 44: 8A. 65, 30
00002976        jmp     ?_248                           ; 2976 _ EB, 3D

?_243:
00002978        mov     cl, byte ptr [rsi+rdi+1H]       ; 2978 _ 8A. 4C 3E, 01
0000297C        inc     rdi                             ; 297C _ 48: FF. C7
?_244:
0000297F        test    cl, cl                          ; 297F _ 84. C9
00002981        jz      ?_245                           ; 2981 _ 74, 05
00002983        cmp     cl, 59                          ; 2983 _ 80. F9, 3B
00002986        jnz     ?_243                           ; 2986 _ 75, F0
?_245:
00002988        mov     rcx, rsi                        ; 2988 _ 48: 89. F1
0000298B        mov     rdx, r13                        ; 298B _ 4C: 89. EA
0000298E        mov     r8, rdi                         ; 298E _ 49: 89. F8
00002991        call    _AsciiStrnCmp                   ; 2991 _ E8, FFFFEDBD
00002996        test    rax, rax                        ; 2996 _ 48: 85. C0
00002999        jnz     ?_246                           ; 2999 _ 75, 08
0000299B        cmp     byte ptr [r13+rdi], 0           ; 299B _ 41: 80. 7C 3D, 00, 00
000029A1        jz      ?_250                           ; 29A1 _ 74, 4D
?_246:
000029A3        add     rsi, rdi                        ; 29A3 _ 48: 01. FE
000029A6        cmp     byte ptr [rsi], 59              ; 29A6 _ 80. 3E, 3B
000029A9        jnz     ?_248                           ; 29A9 _ 75, 0A
?_247:
000029AB        cmp     byte ptr [rsi+1H], 59           ; 29AB _ 80. 7E, 01, 3B
000029AF        lea     rsi, ptr [rsi+1H]               ; 29AF _ 48: 8D. 76, 01
000029B3        jz      ?_247                           ; 29B3 _ 74, F6
?_248:
000029B5        mov     cl, byte ptr [rsi]              ; 29B5 _ 8A. 0E
000029B7        mov     rax, 3H                         ; 29B7 _ 48: B8, 8000000000000003
000029C1        test    cl, cl                          ; 29C1 _ 84. C9
000029C3        je      ?_257                           ; 29C3 _ 0F 84, 00000089
000029C9        xor     edi, edi                        ; 29C9 _ 31. FF
000029CB        test    r12b, r12b                      ; 29CB _ 45: 84. E4
000029CE        jz      ?_244                           ; 29CE _ 74, AF
000029D0        mov     rcx, r13                        ; 29D0 _ 4C: 89. E9
000029D3        call    _ReadUnaligned24                ; 29D3 _ E8, FFFFF0BC
000029D8        mov     edi, eax                        ; 29D8 _ 89. C7
000029DA        mov     rcx, rsi                        ; 29DA _ 48: 89. F1
000029DD        call    _ReadUnaligned24                ; 29DD _ E8, FFFFF0B2
000029E2        cmp     edi, eax                        ; 29E2 _ 39. C7
000029E4        jz      ?_250                           ; 29E4 _ 74, 0A
000029E6        add     rsi, 3                          ; 29E6 _ 48: 83. C6, 03
000029EA        jmp     ?_248                           ; 29EA _ EB, C9

?_249:
000029EC        add     r15, 16                         ; 29EC _ 49: 83. C7, 10
?_250:
000029F0        mov     rsi, qword ptr [r15]            ; 29F0 _ 49: 8B. 37
000029F3        mov     rax, 3H                         ; 29F3 _ 48: B8, 8000000000000003
000029FD        test    rsi, rsi                        ; 29FD _ 48: 85. F6
00002A00        jz      ?_257                           ; 2A00 _ 74, 50
00002A02        mov     al, byte ptr [rsi]              ; 2A02 _ 8A. 06
00002A04        jmp     ?_253                           ; 2A04 _ EB, 12

?_251:
00002A06        add     rsi, rdi                        ; 2A06 _ 48: 01. FE
00002A09        mov     al, byte ptr [rsi]              ; 2A09 _ 8A. 06
00002A0B        cmp     al, 59                          ; 2A0B _ 3C, 3B
00002A0D        jnz     ?_253                           ; 2A0D _ 75, 09
?_252:
00002A0F        cmp     byte ptr [rbx], 59              ; 2A0F _ 80. 3B, 3B
00002A12        lea     rbx, ptr [rbx+1H]               ; 2A12 _ 48: 8D. 5B, 01
00002A16        jz      ?_252                           ; 2A16 _ 74, F7
?_253:
00002A18        test    al, al                          ; 2A18 _ 84. C0
00002A1A        jz      ?_249                           ; 2A1A _ 74, D0
00002A1C        lea     rbx, ptr [rsi+1H]               ; 2A1C _ 48: 8D. 5E, 01
00002A20        xor     edi, edi                        ; 2A20 _ 31. FF
00002A22        jmp     ?_255                           ; 2A22 _ EB, 0A

?_254:
00002A24        mov     al, byte ptr [rsi+rdi+1H]       ; 2A24 _ 8A. 44 3E, 01
00002A28        inc     rbx                             ; 2A28 _ 48: FF. C3
00002A2B        inc     rdi                             ; 2A2B _ 48: FF. C7
?_255:
00002A2E        test    al, al                          ; 2A2E _ 84. C0
00002A30        jz      ?_256                           ; 2A30 _ 74, 04
00002A32        cmp     al, 59                          ; 2A32 _ 3C, 3B
00002A34        jnz     ?_254                           ; 2A34 _ 75, EE
?_256:
00002A36        mov     rcx, rsi                        ; 2A36 _ 48: 89. F1
00002A39        mov     rdx, r13                        ; 2A39 _ 4C: 89. EA
00002A3C        mov     r8, rdi                         ; 2A3C _ 49: 89. F8
00002A3F        call    _AsciiStrnCmp                   ; 2A3F _ E8, FFFFED0F
00002A44        test    rax, rax                        ; 2A44 _ 48: 85. C0
00002A47        jnz     ?_251                           ; 2A47 _ 75, BD
00002A49        mov     rax, qword ptr [r15+8H]         ; 2A49 _ 49: 8B. 47, 08
00002A4D        mov     qword ptr [r14], rax            ; 2A4D _ 49: 89. 06
00002A50        xor     eax, eax                        ; 2A50 _ 31. C0
?_257:
00002A52        add     rsp, 40                         ; 2A52 _ 48: 83. C4, 28
00002A56        pop     rbx                             ; 2A56 _ 5B
00002A57        pop     rdi                             ; 2A57 _ 5F
00002A58        pop     rsi                             ; 2A58 _ 5E
00002A59        pop     r12                             ; 2A59 _ 41: 5C
00002A5B        pop     r13                             ; 2A5B _ 41: 5D
00002A5D        pop     r14                             ; 2A5D _ 41: 5E
00002A5F        pop     r15                             ; 2A5F _ 41: 5F
00002A61        pop     rbp                             ; 2A61 _ 5D
00002A62        ret                                     ; 2A62 _ C3
_LookupUnicodeString2 ENDP

__DriverUnloadHandler PROC
00002A63        push    rbp                             ; 2A63 _ 55
00002A64        mov     rbp, rsp                        ; 2A64 _ 48: 89. E5
00002A67        push    rsi                             ; 2A67 _ 56
00002A68        push    rdi                             ; 2A68 _ 57
00002A69        sub     rsp, 32                         ; 2A69 _ 48: 83. EC, 20
00002A6D        mov     rsi, rcx                        ; 2A6D _ 48: 89. CE
00002A70        call    _ProcessModuleUnloadList        ; 2A70 _ E8, 00000ED6
00002A75        mov     rdi, rax                        ; 2A75 _ 48: 89. C7
00002A78        test    rdi, rdi                        ; 2A78 _ 48: 85. FF
00002A7B        js      ?_258                           ; 2A7B _ 78, 0F
00002A7D        mov     rdx, qword ptr [_gST]           ; 2A7D _ 48: 8B. 15, 00002EDC(rel)
00002A84        mov     rcx, rsi                        ; 2A84 _ 48: 89. F1
00002A87        call    _ProcessLibraryDestructorList   ; 2A87 _ E8, 00000EB9
?_258:
00002A8C        mov     rax, rdi                        ; 2A8C _ 48: 89. F8
00002A8F        add     rsp, 32                         ; 2A8F _ 48: 83. C4, 20
00002A93        pop     rdi                             ; 2A93 _ 5F
00002A94        pop     rsi                             ; 2A94 _ 5E
00002A95        pop     rbp                             ; 2A95 _ 5D
00002A96        ret                                     ; 2A96 _ C3
__DriverUnloadHandler ENDP

__ModuleEntryPoint PROC
00002A97        push    rbp                             ; 2A97 _ 55
00002A98        mov     rbp, rsp                        ; 2A98 _ 48: 89. E5
00002A9B        push    rsi                             ; 2A9B _ 56
00002A9C        push    rdi                             ; 2A9C _ 57
00002A9D        push    rbx                             ; 2A9D _ 53
00002A9E        sub     rsp, 40                         ; 2A9E _ 48: 83. EC, 28
00002AA2        mov     rsi, rdx                        ; 2AA2 _ 48: 89. D6
00002AA5        mov     rdi, rcx                        ; 2AA5 _ 48: 89. CF
00002AA8        mov     eax, dword ptr [__gUefiDriverRevision]; 2AA8 _ 8B. 05, 00000ECE(rel)
00002AAE        test    eax, eax                        ; 2AAE _ 85. C0
00002AB0        jz      ?_259                           ; 2AB0 _ 74, 13
00002AB2        mov     rbx, 19H                        ; 2AB2 _ 48: BB, 8000000000000019
00002ABC        cmp     dword ptr [rsi+8H], eax         ; 2ABC _ 39. 46, 08
00002ABF        jc      ?_263                           ; 2ABF _ 0F 82, 000000B0
?_259:
00002AC5        mov     rcx, rdi                        ; 2AC5 _ 48: 89. F9
00002AC8        mov     rdx, rsi                        ; 2AC8 _ 48: 89. F2
00002ACB        call    _ProcessLibraryConstructorList  ; 2ACB _ E8, 00000D3C
00002AD0        cmp     byte ptr [__gDriverUnloadImageCount], 0; 2AD0 _ 80. 3D, 00000EA9(rel), 00
00002AD7        jz      ?_262                           ; 2AD7 _ 74, 7E
00002AD9        mov     rax, qword ptr [_gBS]           ; 2AD9 _ 48: 8B. 05, 00002E88(rel)
00002AE0        lea     rdx, ptr [_gEfiLoadedImageProtocolGuid]; 2AE0 _ 48: 8D. 15, 00002E61(rel)
00002AE7        lea     r8, ptr [rbp-20H]               ; 2AE7 _ 4C: 8D. 45, E0
00002AEB        mov     rcx, rdi                        ; 2AEB _ 48: 89. F9
00002AEE        call    qword ptr [rax+98H]             ; 2AEE _ FF. 90, 00000098
00002AF4        mov     rbx, rax                        ; 2AF4 _ 48: 89. C3
00002AF7        call    _DebugAssertEnabled             ; 2AF7 _ E8, FFFFF2FE
00002AFC        test    al, al                          ; 2AFC _ 84. C0
00002AFE        jz      ?_261                           ; 2AFE _ 74, 48
00002B00        test    rbx, rbx                        ; 2B00 _ 48: 85. DB
00002B03        jns     ?_261                           ; 2B03 _ 79, 43
00002B05        call    _DebugPrintEnabled              ; 2B05 _ E8, FFFFF37A
00002B0A        test    al, al                          ; 2B0A _ 84. C0
00002B0C        jz      ?_260                           ; 2B0C _ 74, 22
00002B0E        mov     ecx, 2147483648                 ; 2B0E _ B9, 80000000
00002B13        call    _DebugPrintLevelEnabled         ; 2B13 _ E8, FFFFF37A
00002B18        test    al, al                          ; 2B18 _ 84. C0
00002B1A        jz      ?_260                           ; 2B1A _ 74, 14
00002B1C        lea     rdx, ptr [?_369]                ; 2B1C _ 48: 8D. 15, 000018EE(rel)
00002B23        mov     ecx, 2147483648                 ; 2B23 _ B9, 80000000
00002B28        mov     r8, rbx                         ; 2B28 _ 49: 89. D8
00002B2B        call    _DebugPrint                     ; 2B2B _ E8, FFFFF22A
?_260:
00002B30        lea     rcx, ptr [?_379]                ; 2B30 _ 48: 8D. 0D, 00001AF2(rel)
00002B37        lea     r8, ptr [?_370]                 ; 2B37 _ 4C: 8D. 05, 000018F4(rel)
00002B3E        mov     edx, 126                        ; 2B3E _ BA, 0000007E
00002B43        call    _DebugAssert                    ; 2B43 _ E8, FFFFF2BD
?_261:
00002B48        mov     rax, qword ptr [rbp-20H]        ; 2B48 _ 48: 8B. 45, E0
00002B4C        lea     rcx, ptr [__DriverUnloadHandler]; 2B4C _ 48: 8D. 0D, FFFFFF10(rel)
00002B53        mov     qword ptr [rax+58H], rcx        ; 2B53 _ 48: 89. 48, 58
?_262:
00002B57        mov     rcx, rdi                        ; 2B57 _ 48: 89. F9
00002B5A        mov     rdx, rsi                        ; 2B5A _ 48: 89. F2
00002B5D        call    _ProcessModuleEntryPointList    ; 2B5D _ E8, 00000DE4
00002B62        mov     rbx, rax                        ; 2B62 _ 48: 89. C3
00002B65        test    rbx, rbx                        ; 2B65 _ 48: 85. DB
00002B68        jns     ?_263                           ; 2B68 _ 79, 0B
00002B6A        mov     rcx, rdi                        ; 2B6A _ 48: 89. F9
00002B6D        mov     rdx, rsi                        ; 2B6D _ 48: 89. F2
00002B70        call    _ProcessLibraryDestructorList   ; 2B70 _ E8, 00000DD0
?_263:
00002B75        mov     rax, rbx                        ; 2B75 _ 48: 89. D8
00002B78        add     rsp, 40                         ; 2B78 _ 48: 83. C4, 28
00002B7C        pop     rbx                             ; 2B7C _ 5B
00002B7D        pop     rdi                             ; 2B7D _ 5F
00002B7E        pop     rsi                             ; 2B7E _ 5E
00002B7F        pop     rbp                             ; 2B7F _ 5D
00002B80        ret                                     ; 2B80 _ C3
__ModuleEntryPoint ENDP

_ConPlatformComponentNameGetDriverName PROC
00002B81        push    rbp                             ; 2B81 _ 55
00002B82        mov     rbp, rsp                        ; 2B82 _ 48: 89. E5
00002B85        sub     rsp, 48                         ; 2B85 _ 48: 83. EC, 30
00002B89        mov     r9, r8                          ; 2B89 _ 4D: 89. C1
00002B8C        lea     rax, ptr [_gConPlatformComponentName]; 2B8C _ 48: 8D. 05, 00002C3D(rel)
00002B93        cmp     rcx, rax                        ; 2B93 _ 48: 39. C1
00002B96        sete    al                              ; 2B96 _ 0F 94. C0
00002B99        movzx   eax, al                         ; 2B99 _ 0F B6. C0
00002B9C        mov     r10, qword ptr [rcx+10H]        ; 2B9C _ 4C: 8B. 51, 10
00002BA0        mov     dword ptr [rsp+20H], eax        ; 2BA0 _ 89. 44 24, 20
00002BA4        lea     r8, ptr [_mConPlatformDriverNameTable]; 2BA4 _ 4C: 8D. 05, 00002C55(rel)
00002BAB        mov     rcx, rdx                        ; 2BAB _ 48: 89. D1
00002BAE        mov     rdx, r10                        ; 2BAE _ 4C: 89. D2
00002BB1        call    _LookupUnicodeString2           ; 2BB1 _ E8, FFFFFD65
00002BB6        add     rsp, 48                         ; 2BB6 _ 48: 83. C4, 30
00002BBA        pop     rbp                             ; 2BBA _ 5D
00002BBB        ret                                     ; 2BBB _ C3
_ConPlatformComponentNameGetDriverName ENDP

_ConPlatformComponentNameGetControllerName PROC
00002BBC        mov     rax, 3H                         ; 2BBC _ 48: B8, 8000000000000003
00002BC6        ret                                     ; 2BC6 _ C3
_ConPlatformComponentNameGetControllerName ENDP

_ConPlatformTextInDriverBindingSupported PROC
00002BC7        lea     r8, ptr [_gEfiSimpleTextInProtocolGuid]; 2BC7 _ 4C: 8D. 05, 00002D0A(rel)
00002BCE        jmp     _ConPlatformDriverBindingSupported; 2BCE _ E9, 00000591
_ConPlatformTextInDriverBindingSupported ENDP

_ConPlatformTextInDriverBindingStart PROC
00002BD3        push    rbp                             ; 2BD3 _ 55
00002BD4        mov     rbp, rsp                        ; 2BD4 _ 48: 89. E5
00002BD7        push    rsi                             ; 2BD7 _ 56
00002BD8        push    rdi                             ; 2BD8 _ 57
00002BD9        push    rbx                             ; 2BD9 _ 53
00002BDA        sub     rsp, 72                         ; 2BDA _ 48: 83. EC, 48
00002BDE        mov     rbx, rdx                        ; 2BDE _ 48: 89. D3
00002BE1        mov     rsi, rcx                        ; 2BE1 _ 48: 89. CE
00002BE4        mov     qword ptr [rbp-20H], rbx        ; 2BE4 _ 48: 89. 5D, E0
00002BE8        mov     r9, qword ptr [rsi+28H]         ; 2BE8 _ 4C: 8B. 4E, 28
00002BEC        mov     rax, qword ptr [_gBS]           ; 2BEC _ 48: 8B. 05, 00002D75(rel)
00002BF3        mov     qword ptr [rsp+20H], rbx        ; 2BF3 _ 48: 89. 5C 24, 20
00002BF8        mov     dword ptr [rsp+28H], 2          ; 2BF8 _ C7. 44 24, 28, 00000002
00002C00        lea     rdx, ptr [_gEfiDevicePathProtocolGuid]; 2C00 _ 48: 8D. 15, 00002CC1(rel)
00002C07        lea     r8, ptr [rbp-28H]               ; 2C07 _ 4C: 8D. 45, D8
00002C0B        mov     rcx, rbx                        ; 2C0B _ 48: 89. D9
00002C0E        call    qword ptr [rax+118H]            ; 2C0E _ FF. 90, 00000118
00002C14        mov     rdi, rax                        ; 2C14 _ 48: 89. C7
00002C17        test    rdi, rdi                        ; 2C17 _ 48: 85. FF
00002C1A        js      ?_267                           ; 2C1A _ 0F 88, 000000EF
00002C20        mov     r9, qword ptr [rsi+28H]         ; 2C20 _ 4C: 8B. 4E, 28
00002C24        mov     rax, qword ptr [_gBS]           ; 2C24 _ 48: 8B. 05, 00002D3D(rel)
00002C2B        mov     qword ptr [rsp+20H], rbx        ; 2C2B _ 48: 89. 5C 24, 20
00002C30        mov     dword ptr [rsp+28H], 16         ; 2C30 _ C7. 44 24, 28, 00000010
00002C38        lea     rdx, ptr [_gEfiSimpleTextInProtocolGuid]; 2C38 _ 48: 8D. 15, 00002C99(rel)
00002C3F        lea     r8, ptr [rbp-30H]               ; 2C3F _ 4C: 8D. 45, D0
00002C43        mov     rcx, rbx                        ; 2C43 _ 48: 89. D9
00002C46        call    qword ptr [rax+118H]            ; 2C46 _ FF. 90, 00000118
00002C4C        mov     rdi, rax                        ; 2C4C _ 48: 89. C7
00002C4F        test    rdi, rdi                        ; 2C4F _ 48: 85. FF
00002C52        js      ?_267                           ; 2C52 _ 0F 88, 000000B7
00002C58        mov     rdx, qword ptr [rbp-28H]        ; 2C58 _ 48: 8B. 55, D8
00002C5C        lea     rcx, ptr [?_382]                ; 2C5C _ 48: 8D. 0D, 00001BA3(rel)
00002C63        xor     r8d, r8d                        ; 2C63 _ 45: 31. C0
00002C66        call    _ConPlatformUpdateDeviceVariable; 2C66 _ E8, 0000058F
00002C6B        mov     rbx, rax                        ; 2C6B _ 48: 89. C3
00002C6E        mov     rcx, qword ptr [rbp-28H]        ; 2C6E _ 48: 8B. 4D, D8
00002C72        call    _IsHotPlugDevice                ; 2C72 _ E8, 00000684
00002C77        test    al, al                          ; 2C77 _ 84. C0
00002C79        jz      ?_264                           ; 2C79 _ 74, 3D
00002C7B        mov     rax, qword ptr [_gBS]           ; 2C7B _ 48: 8B. 05, 00002CE6(rel)
00002C82        lea     rcx, ptr [rbp-20H]              ; 2C82 _ 48: 8D. 4D, E0
00002C86        lea     rdx, ptr [_gEfiConsoleInDeviceGuid]; 2C86 _ 48: 8D. 15, 00002C2B(rel)
00002C8D        xor     edi, edi                        ; 2C8D _ 31. FF
00002C8F        xor     r8d, r8d                        ; 2C8F _ 45: 31. C0
00002C92        xor     r9d, r9d                        ; 2C92 _ 45: 31. C9
00002C95        call    qword ptr [rax+148H]            ; 2C95 _ FF. 90, 00000148
00002C9B        test    rbx, rbx                        ; 2C9B _ 48: 85. DB
00002C9E        js      ?_267                           ; 2C9E _ 78, 6F
00002CA0        mov     rdx, qword ptr [rbp-28H]        ; 2CA0 _ 48: 8B. 55, D8
00002CA4        lea     rcx, ptr [?_385]                ; 2CA4 _ 48: 8D. 0D, 00001B83(rel)
00002CAB        mov     r8d, 1                          ; 2CAB _ 41: B8, 00000001
00002CB1        call    _ConPlatformUpdateDeviceVariable; 2CB1 _ E8, 00000544
00002CB6        jmp     ?_266                           ; 2CB6 _ EB, 55

?_264:
00002CB8        mov     rdx, qword ptr [rbp-28H]        ; 2CB8 _ 48: 8B. 55, D8
00002CBC        lea     rcx, ptr [?_385]                ; 2CBC _ 48: 8D. 0D, 00001B6B(rel)
00002CC3        mov     r8d, 1                          ; 2CC3 _ 41: B8, 00000001
00002CC9        call    _ConPlatformUpdateDeviceVariable; 2CC9 _ E8, 0000052C
00002CCE        mov     rax, qword ptr [_gBS]           ; 2CCE _ 48: 8B. 05, 00002C93(rel)
00002CD5        test    rbx, rbx                        ; 2CD5 _ 48: 85. DB
00002CD8        js      ?_265                           ; 2CD8 _ 78, 1B
00002CDA        lea     rcx, ptr [rbp-20H]              ; 2CDA _ 48: 8D. 4D, E0
00002CDE        lea     rdx, ptr [_gEfiConsoleInDeviceGuid]; 2CDE _ 48: 8D. 15, 00002BD3(rel)
00002CE5        xor     edi, edi                        ; 2CE5 _ 31. FF
00002CE7        xor     r8d, r8d                        ; 2CE7 _ 45: 31. C0
00002CEA        xor     r9d, r9d                        ; 2CEA _ 45: 31. C9
00002CED        call    qword ptr [rax+148H]            ; 2CED _ FF. 90, 00000148
00002CF3        jmp     ?_267                           ; 2CF3 _ EB, 1A

?_265:
00002CF5        mov     r8, qword ptr [rsi+28H]         ; 2CF5 _ 4C: 8B. 46, 28
00002CF9        mov     r9, qword ptr [rbp-20H]         ; 2CF9 _ 4C: 8B. 4D, E0
00002CFD        lea     rdx, ptr [_gEfiSimpleTextInProtocolGuid]; 2CFD _ 48: 8D. 15, 00002BD4(rel)
00002D04        mov     rcx, r9                         ; 2D04 _ 4C: 89. C9
00002D07        call    qword ptr [rax+120H]            ; 2D07 _ FF. 90, 00000120
?_266:
00002D0D        xor     edi, edi                        ; 2D0D _ 31. FF
?_267:
00002D0F        mov     rax, rdi                        ; 2D0F _ 48: 89. F8
00002D12        add     rsp, 72                         ; 2D12 _ 48: 83. C4, 48
00002D16        pop     rbx                             ; 2D16 _ 5B
00002D17        pop     rdi                             ; 2D17 _ 5F
00002D18        pop     rsi                             ; 2D18 _ 5E
00002D19        pop     rbp                             ; 2D19 _ 5D
00002D1A        ret                                     ; 2D1A _ C3
_ConPlatformTextInDriverBindingStart ENDP

_ConPlatformTextInDriverBindingStop PROC
00002D1B        push    rbp                             ; 2D1B _ 55
00002D1C        mov     rbp, rsp                        ; 2D1C _ 48: 89. E5
00002D1F        push    rsi                             ; 2D1F _ 56
00002D20        push    rdi                             ; 2D20 _ 57
00002D21        sub     rsp, 64                         ; 2D21 _ 48: 83. EC, 40
00002D25        mov     rsi, rdx                        ; 2D25 _ 48: 89. D6
00002D28        mov     rdi, rcx                        ; 2D28 _ 48: 89. CF
00002D2B        mov     r9, qword ptr [rdi+28H]         ; 2D2B _ 4C: 8B. 4F, 28
00002D2F        mov     rax, qword ptr [_gBS]           ; 2D2F _ 48: 8B. 05, 00002C32(rel)
00002D36        mov     qword ptr [rsp+20H], rsi        ; 2D36 _ 48: 89. 74 24, 20
00002D3B        mov     dword ptr [rsp+28H], 2          ; 2D3B _ C7. 44 24, 28, 00000002
00002D43        lea     rdx, ptr [_gEfiDevicePathProtocolGuid]; 2D43 _ 48: 8D. 15, 00002B7E(rel)
00002D4A        lea     r8, ptr [rbp-18H]               ; 2D4A _ 4C: 8D. 45, E8
00002D4E        mov     rcx, rsi                        ; 2D4E _ 48: 89. F1
00002D51        call    qword ptr [rax+118H]            ; 2D51 _ FF. 90, 00000118
00002D57        test    rax, rax                        ; 2D57 _ 48: 85. C0
00002D5A        js      ?_268                           ; 2D5A _ 78, 16
00002D5C        mov     rdx, qword ptr [rbp-18H]        ; 2D5C _ 48: 8B. 55, E8
00002D60        lea     rcx, ptr [?_385]                ; 2D60 _ 48: 8D. 0D, 00001AC7(rel)
00002D67        mov     r8d, 2                          ; 2D67 _ 41: B8, 00000002
00002D6D        call    _ConPlatformUpdateDeviceVariable; 2D6D _ E8, 00000488
?_268:
00002D72        lea     r8, ptr [_gEfiConsoleInDeviceGuid]; 2D72 _ 4C: 8D. 05, 00002B3F(rel)
00002D79        mov     rcx, rdi                        ; 2D79 _ 48: 89. F9
00002D7C        mov     rdx, rsi                        ; 2D7C _ 48: 89. F2
00002D7F        call    _ConPlatformUnInstallProtocol   ; 2D7F _ E8, 0000073E
00002D84        mov     r8, qword ptr [rdi+28H]         ; 2D84 _ 4C: 8B. 47, 28
00002D88        mov     rax, qword ptr [_gBS]           ; 2D88 _ 48: 8B. 05, 00002BD9(rel)
00002D8F        lea     rdx, ptr [_gEfiSimpleTextInProtocolGuid]; 2D8F _ 48: 8D. 15, 00002B42(rel)
00002D96        mov     rcx, rsi                        ; 2D96 _ 48: 89. F1
00002D99        mov     r9, rsi                         ; 2D99 _ 49: 89. F1
00002D9C        call    qword ptr [rax+120H]            ; 2D9C _ FF. 90, 00000120
00002DA2        xor     eax, eax                        ; 2DA2 _ 31. C0
00002DA4        add     rsp, 64                         ; 2DA4 _ 48: 83. C4, 40
00002DA8        pop     rdi                             ; 2DA8 _ 5F
00002DA9        pop     rsi                             ; 2DA9 _ 5E
00002DAA        pop     rbp                             ; 2DAA _ 5D
00002DAB        ret                                     ; 2DAB _ C3
_ConPlatformTextInDriverBindingStop ENDP

_ConPlatformTextOutDriverBindingSupported PROC
00002DAC        lea     r8, ptr [_gEfiSimpleTextOutProtocolGuid]; 2DAC _ 4C: 8D. 05, 00002B35(rel)
00002DB3        jmp     _ConPlatformDriverBindingSupported; 2DB3 _ E9, 000003AC
_ConPlatformTextOutDriverBindingSupported ENDP

_ConPlatformTextOutDriverBindingStart PROC
00002DB8        push    rbp                             ; 2DB8 _ 55
00002DB9        mov     rbp, rsp                        ; 2DB9 _ 48: 89. E5
00002DBC        push    r14                             ; 2DBC _ 41: 56
00002DBE        push    rsi                             ; 2DBE _ 56
00002DBF        push    rdi                             ; 2DBF _ 57
00002DC0        push    rbx                             ; 2DC0 _ 53
00002DC1        sub     rsp, 80                         ; 2DC1 _ 48: 83. EC, 50
00002DC5        mov     rdi, rdx                        ; 2DC5 _ 48: 89. D7
00002DC8        mov     r14, rcx                        ; 2DC8 _ 49: 89. CE
00002DCB        mov     qword ptr [rbp-28H], rdi        ; 2DCB _ 48: 89. 7D, D8
00002DCF        mov     r9, qword ptr [r14+28H]         ; 2DCF _ 4D: 8B. 4E, 28
00002DD3        mov     rax, qword ptr [_gBS]           ; 2DD3 _ 48: 8B. 05, 00002B8E(rel)
00002DDA        mov     qword ptr [rsp+20H], rdi        ; 2DDA _ 48: 89. 7C 24, 20
00002DDF        mov     dword ptr [rsp+28H], 2          ; 2DDF _ C7. 44 24, 28, 00000002
00002DE7        lea     rdx, ptr [_gEfiDevicePathProtocolGuid]; 2DE7 _ 48: 8D. 15, 00002ADA(rel)
00002DEE        lea     r8, ptr [rbp-30H]               ; 2DEE _ 4C: 8D. 45, D0
00002DF2        mov     rcx, rdi                        ; 2DF2 _ 48: 89. F9
00002DF5        call    qword ptr [rax+118H]            ; 2DF5 _ FF. 90, 00000118
00002DFB        mov     rsi, rax                        ; 2DFB _ 48: 89. C6
00002DFE        test    rsi, rsi                        ; 2DFE _ 48: 85. F6
00002E01        js      ?_275                           ; 2E01 _ 0F 88, 0000017E
00002E07        mov     r9, qword ptr [r14+28H]         ; 2E07 _ 4D: 8B. 4E, 28
00002E0B        mov     rax, qword ptr [_gBS]           ; 2E0B _ 48: 8B. 05, 00002B56(rel)
00002E12        mov     qword ptr [rsp+20H], rdi        ; 2E12 _ 48: 89. 7C 24, 20
00002E17        mov     dword ptr [rsp+28H], 16         ; 2E17 _ C7. 44 24, 28, 00000010
00002E1F        lea     rdx, ptr [_gEfiSimpleTextOutProtocolGuid]; 2E1F _ 48: 8D. 15, 00002AC2(rel)
00002E26        lea     r8, ptr [rbp-38H]               ; 2E26 _ 4C: 8D. 45, C8
00002E2A        mov     rcx, rdi                        ; 2E2A _ 48: 89. F9
00002E2D        call    qword ptr [rax+118H]            ; 2E2D _ FF. 90, 00000118
00002E33        mov     rsi, rax                        ; 2E33 _ 48: 89. C6
00002E36        test    rsi, rsi                        ; 2E36 _ 48: 85. F6
00002E39        js      ?_275                           ; 2E39 _ 0F 88, 00000146
00002E3F        mov     rdx, qword ptr [rbp-30H]        ; 2E3F _ 48: 8B. 55, D0
00002E43        lea     rcx, ptr [?_383]                ; 2E43 _ 48: 8D. 0D, 000019C8(rel)
00002E4A        xor     r8d, r8d                        ; 2E4A _ 45: 31. C0
00002E4D        call    _ConPlatformUpdateDeviceVariable; 2E4D _ E8, 000003A8
00002E52        mov     rbx, rax                        ; 2E52 _ 48: 89. C3
00002E55        mov     rdx, qword ptr [rbp-30H]        ; 2E55 _ 48: 8B. 55, D0
00002E59        lea     rcx, ptr [?_384]                ; 2E59 _ 48: 8D. 0D, 000019C0(rel)
00002E60        xor     r8d, r8d                        ; 2E60 _ 45: 31. C0
00002E63        call    _ConPlatformUpdateDeviceVariable; 2E63 _ E8, 00000392
00002E68        mov     rdi, rax                        ; 2E68 _ 48: 89. C7
00002E6B        mov     rcx, qword ptr [rbp-30H]        ; 2E6B _ 48: 8B. 4D, D0
00002E6F        call    _IsHotPlugDevice                ; 2E6F _ E8, 00000487
00002E74        test    al, al                          ; 2E74 _ 84. C0
00002E76        jz      ?_270                           ; 2E76 _ 74, 5F
00002E78        mov     rax, qword ptr [_gBS]           ; 2E78 _ 48: 8B. 05, 00002AE9(rel)
00002E7F        lea     rcx, ptr [rbp-28H]              ; 2E7F _ 48: 8D. 4D, D8
00002E83        lea     rdx, ptr [_gEfiConsoleOutDeviceGuid]; 2E83 _ 48: 8D. 15, 00002A1E(rel)
00002E8A        xor     esi, esi                        ; 2E8A _ 31. F6
00002E8C        xor     r8d, r8d                        ; 2E8C _ 45: 31. C0
00002E8F        xor     r9d, r9d                        ; 2E8F _ 45: 31. C9
00002E92        call    qword ptr [rax+148H]            ; 2E92 _ FF. 90, 00000148
00002E98        test    rbx, rbx                        ; 2E98 _ 48: 85. DB
00002E9B        js      ?_269                           ; 2E9B _ 78, 16
00002E9D        mov     rdx, qword ptr [rbp-30H]        ; 2E9D _ 48: 8B. 55, D0
00002EA1        lea     rcx, ptr [?_386]                ; 2EA1 _ 48: 8D. 0D, 00001998(rel)
00002EA8        mov     r8d, 1                          ; 2EA8 _ 41: B8, 00000001
00002EAE        call    _ConPlatformUpdateDeviceVariable; 2EAE _ E8, 00000347
?_269:
00002EB3        test    rdi, rdi                        ; 2EB3 _ 48: 85. FF
00002EB6        js      ?_275                           ; 2EB6 _ 0F 88, 000000C9
00002EBC        mov     rdx, qword ptr [rbp-30H]        ; 2EBC _ 48: 8B. 55, D0
00002EC0        lea     rcx, ptr [?_387]                ; 2EC0 _ 48: 8D. 0D, 0000198D(rel)
00002EC7        mov     r8d, 1                          ; 2EC7 _ 41: B8, 00000001
00002ECD        call    _ConPlatformUpdateDeviceVariable; 2ECD _ E8, 00000328
00002ED2        jmp     ?_274                           ; 2ED2 _ E9, 000000AC

?_270:
00002ED7        mov     rcx, qword ptr [rbp-30H]        ; 2ED7 _ 48: 8B. 4D, D0
00002EDB        call    _ConPlatformUpdateGopCandidate  ; 2EDB _ E8, 0000049C
00002EE0        test    al, al                          ; 2EE0 _ 84. C0
00002EE2        jnz     ?_271                           ; 2EE2 _ 75, 2C
00002EE4        mov     rdx, qword ptr [rbp-30H]        ; 2EE4 _ 48: 8B. 55, D0
00002EE8        lea     rcx, ptr [?_386]                ; 2EE8 _ 48: 8D. 0D, 00001951(rel)
00002EEF        mov     r8d, 1                          ; 2EEF _ 41: B8, 00000001
00002EF5        call    _ConPlatformUpdateDeviceVariable; 2EF5 _ E8, 00000300
00002EFA        mov     rdx, qword ptr [rbp-30H]        ; 2EFA _ 48: 8B. 55, D0
00002EFE        lea     rcx, ptr [?_387]                ; 2EFE _ 48: 8D. 0D, 0000194F(rel)
00002F05        mov     r8d, 1                          ; 2F05 _ 41: B8, 00000001
00002F0B        call    _ConPlatformUpdateDeviceVariable; 2F0B _ E8, 000002EA
?_271:
00002F10        mov     al, 1                           ; 2F10 _ B0, 01
00002F12        test    rbx, rbx                        ; 2F12 _ 48: 85. DB
00002F15        js      ?_272                           ; 2F15 _ 78, 20
00002F17        mov     rax, qword ptr [_gBS]           ; 2F17 _ 48: 8B. 05, 00002A4A(rel)
00002F1E        lea     rcx, ptr [rbp-28H]              ; 2F1E _ 48: 8D. 4D, D8
00002F22        lea     rdx, ptr [_gEfiConsoleOutDeviceGuid]; 2F22 _ 48: 8D. 15, 0000297F(rel)
00002F29        xor     r8d, r8d                        ; 2F29 _ 45: 31. C0
00002F2C        xor     r9d, r9d                        ; 2F2C _ 45: 31. C9
00002F2F        call    qword ptr [rax+148H]            ; 2F2F _ FF. 90, 00000148
00002F35        xor     al, al                          ; 2F35 _ 30. C0
?_272:
00002F37        test    rdi, rdi                        ; 2F37 _ 48: 85. FF
00002F3A        js      ?_273                           ; 2F3A _ 78, 22
00002F3C        mov     rax, qword ptr [_gBS]           ; 2F3C _ 48: 8B. 05, 00002A25(rel)
00002F43        lea     rcx, ptr [rbp-28H]              ; 2F43 _ 48: 8D. 4D, D8
00002F47        lea     rdx, ptr [_gEfiStandardErrorDeviceGuid]; 2F47 _ 48: 8D. 15, 0000294A(rel)
00002F4E        xor     esi, esi                        ; 2F4E _ 31. F6
00002F50        xor     r8d, r8d                        ; 2F50 _ 45: 31. C0
00002F53        xor     r9d, r9d                        ; 2F53 _ 45: 31. C9
00002F56        call    qword ptr [rax+148H]            ; 2F56 _ FF. 90, 00000148
00002F5C        jmp     ?_275                           ; 2F5C _ EB, 27

?_273:
00002F5E        xor     esi, esi                        ; 2F5E _ 31. F6
00002F60        test    al, al                          ; 2F60 _ 84. C0
00002F62        jz      ?_275                           ; 2F62 _ 74, 21
00002F64        mov     r8, qword ptr [r14+28H]         ; 2F64 _ 4D: 8B. 46, 28
00002F68        mov     r9, qword ptr [rbp-28H]         ; 2F68 _ 4C: 8B. 4D, D8
00002F6C        mov     rax, qword ptr [_gBS]           ; 2F6C _ 48: 8B. 05, 000029F5(rel)
00002F73        lea     rdx, ptr [_gEfiSimpleTextOutProtocolGuid]; 2F73 _ 48: 8D. 15, 0000296E(rel)
00002F7A        mov     rcx, r9                         ; 2F7A _ 4C: 89. C9
00002F7D        call    qword ptr [rax+120H]            ; 2F7D _ FF. 90, 00000120
?_274:
00002F83        xor     esi, esi                        ; 2F83 _ 31. F6
?_275:
00002F85        mov     rax, rsi                        ; 2F85 _ 48: 89. F0
00002F88        add     rsp, 80                         ; 2F88 _ 48: 83. C4, 50
00002F8C        pop     rbx                             ; 2F8C _ 5B
00002F8D        pop     rdi                             ; 2F8D _ 5F
00002F8E        pop     rsi                             ; 2F8E _ 5E
00002F8F        pop     r14                             ; 2F8F _ 41: 5E
00002F91        pop     rbp                             ; 2F91 _ 5D
00002F92        ret                                     ; 2F92 _ C3
_ConPlatformTextOutDriverBindingStart ENDP

_ConPlatformTextOutDriverBindingStop PROC
00002F93        push    rbp                             ; 2F93 _ 55
00002F94        mov     rbp, rsp                        ; 2F94 _ 48: 89. E5
00002F97        push    rsi                             ; 2F97 _ 56
00002F98        push    rdi                             ; 2F98 _ 57
00002F99        sub     rsp, 64                         ; 2F99 _ 48: 83. EC, 40
00002F9D        mov     rsi, rdx                        ; 2F9D _ 48: 89. D6
00002FA0        mov     rdi, rcx                        ; 2FA0 _ 48: 89. CF
00002FA3        mov     r9, qword ptr [rdi+28H]         ; 2FA3 _ 4C: 8B. 4F, 28
00002FA7        mov     rax, qword ptr [_gBS]           ; 2FA7 _ 48: 8B. 05, 000029BA(rel)
00002FAE        mov     qword ptr [rsp+20H], rsi        ; 2FAE _ 48: 89. 74 24, 20
00002FB3        mov     dword ptr [rsp+28H], 2          ; 2FB3 _ C7. 44 24, 28, 00000002
00002FBB        lea     rdx, ptr [_gEfiDevicePathProtocolGuid]; 2FBB _ 48: 8D. 15, 00002906(rel)
00002FC2        lea     r8, ptr [rbp-18H]               ; 2FC2 _ 4C: 8D. 45, E8
00002FC6        mov     rcx, rsi                        ; 2FC6 _ 48: 89. F1
00002FC9        call    qword ptr [rax+118H]            ; 2FC9 _ FF. 90, 00000118
00002FCF        test    rax, rax                        ; 2FCF _ 48: 85. C0
00002FD2        js      ?_276                           ; 2FD2 _ 78, 2C
00002FD4        mov     rdx, qword ptr [rbp-18H]        ; 2FD4 _ 48: 8B. 55, E8
00002FD8        lea     rcx, ptr [?_386]                ; 2FD8 _ 48: 8D. 0D, 00001861(rel)
00002FDF        mov     r8d, 2                          ; 2FDF _ 41: B8, 00000002
00002FE5        call    _ConPlatformUpdateDeviceVariable; 2FE5 _ E8, 00000210
00002FEA        mov     rdx, qword ptr [rbp-18H]        ; 2FEA _ 48: 8B. 55, E8
00002FEE        lea     rcx, ptr [?_387]                ; 2FEE _ 48: 8D. 0D, 0000185F(rel)
00002FF5        mov     r8d, 2                          ; 2FF5 _ 41: B8, 00000002
00002FFB        call    _ConPlatformUpdateDeviceVariable; 2FFB _ E8, 000001FA
?_276:
00003000        lea     r8, ptr [_gEfiConsoleOutDeviceGuid]; 3000 _ 4C: 8D. 05, 000028A1(rel)
00003007        mov     rcx, rdi                        ; 3007 _ 48: 89. F9
0000300A        mov     rdx, rsi                        ; 300A _ 48: 89. F2
0000300D        call    _ConPlatformUnInstallProtocol   ; 300D _ E8, 000004B0
00003012        lea     r8, ptr [_gEfiStandardErrorDeviceGuid]; 3012 _ 4C: 8D. 05, 0000287F(rel)
00003019        mov     rcx, rdi                        ; 3019 _ 48: 89. F9
0000301C        mov     rdx, rsi                        ; 301C _ 48: 89. F2
0000301F        call    _ConPlatformUnInstallProtocol   ; 301F _ E8, 0000049E
00003024        mov     r8, qword ptr [rdi+28H]         ; 3024 _ 4C: 8B. 47, 28
00003028        mov     rax, qword ptr [_gBS]           ; 3028 _ 48: 8B. 05, 00002939(rel)
0000302F        lea     rdx, ptr [_gEfiSimpleTextOutProtocolGuid]; 302F _ 48: 8D. 15, 000028B2(rel)
00003036        mov     rcx, rsi                        ; 3036 _ 48: 89. F1
00003039        mov     r9, rsi                         ; 3039 _ 49: 89. F1
0000303C        call    qword ptr [rax+120H]            ; 303C _ FF. 90, 00000120
00003042        xor     eax, eax                        ; 3042 _ 31. C0
00003044        add     rsp, 64                         ; 3044 _ 48: 83. C4, 40
00003048        pop     rdi                             ; 3048 _ 5F
00003049        pop     rsi                             ; 3049 _ 5E
0000304A        pop     rbp                             ; 304A _ 5D
0000304B        ret                                     ; 304B _ C3
_ConPlatformTextOutDriverBindingStop ENDP

_InitializeConPlatform PROC
0000304C        push    rbp                             ; 304C _ 55
0000304D        mov     rbp, rsp                        ; 304D _ 48: 89. E5
00003050        push    rsi                             ; 3050 _ 56
00003051        push    rdi                             ; 3051 _ 57
00003052        push    rbx                             ; 3052 _ 53
00003053        sub     rsp, 56                         ; 3053 _ 48: 83. EC, 38
00003057        mov     rsi, rdx                        ; 3057 _ 48: 89. D6
0000305A        mov     rdi, rcx                        ; 305A _ 48: 89. CF
0000305D        lea     rax, ptr [_gConPlatformComponentName2]; 305D _ 48: 8D. 05, 00002784(rel)
00003064        mov     qword ptr [rsp+28H], rax        ; 3064 _ 48: 89. 44 24, 28
00003069        lea     rax, ptr [_gConPlatformComponentName]; 3069 _ 48: 8D. 05, 00002760(rel)
00003070        mov     qword ptr [rsp+20H], rax        ; 3070 _ 48: 89. 44 24, 20
00003075        lea     r8, ptr [_gConPlatformTextInDriverBinding]; 3075 _ 4C: 8D. 05, 000027A4(rel)
0000307C        mov     r9, rdi                         ; 307C _ 49: 89. F9
0000307F        call    _EfiLibInstallDriverBindingComponentName2; 307F _ E8, FFFFF740
00003084        mov     rbx, rax                        ; 3084 _ 48: 89. C3
00003087        call    _DebugAssertEnabled             ; 3087 _ E8, FFFFED6E
0000308C        test    al, al                          ; 308C _ 84. C0
0000308E        jz      ?_278                           ; 308E _ 74, 48
00003090        test    rbx, rbx                        ; 3090 _ 48: 85. DB
00003093        jns     ?_278                           ; 3093 _ 79, 43
00003095        call    _DebugPrintEnabled              ; 3095 _ E8, FFFFEDEA
0000309A        test    al, al                          ; 309A _ 84. C0
0000309C        jz      ?_277                           ; 309C _ 74, 22
0000309E        mov     ecx, 2147483648                 ; 309E _ B9, 80000000
000030A3        call    _DebugPrintLevelEnabled         ; 30A3 _ E8, FFFFEDEA
000030A8        test    al, al                          ; 30A8 _ 84. C0
000030AA        jz      ?_277                           ; 30AA _ 74, 14
000030AC        lea     rdx, ptr [?_369]                ; 30AC _ 48: 8D. 15, 0000135E(rel)
000030B3        mov     ecx, 2147483648                 ; 30B3 _ B9, 80000000
000030B8        mov     r8, rbx                         ; 30B8 _ 49: 89. D8
000030BB        call    _DebugPrint                     ; 30BB _ E8, FFFFEC9A
?_277:
000030C0        lea     rcx, ptr [?_380]                ; 30C0 _ 48: 8D. 0D, 000015DA(rel)
000030C7        lea     r8, ptr [?_370]                 ; 30C7 _ 4C: 8D. 05, 00001364(rel)
000030CE        mov     edx, 66                         ; 30CE _ BA, 00000042
000030D3        call    _DebugAssert                    ; 30D3 _ E8, FFFFED2D
?_278:
000030D8        lea     rax, ptr [_gConPlatformComponentName2]; 30D8 _ 48: 8D. 05, 00002709(rel)
000030DF        mov     qword ptr [rsp+28H], rax        ; 30DF _ 48: 89. 44 24, 28
000030E4        lea     rax, ptr [_gConPlatformComponentName]; 30E4 _ 48: 8D. 05, 000026E5(rel)
000030EB        mov     qword ptr [rsp+20H], rax        ; 30EB _ 48: 89. 44 24, 20
000030F0        lea     r8, ptr [_gConPlatformTextOutDriverBinding]; 30F0 _ 4C: 8D. 05, 00002759(rel)
000030F7        mov     rcx, rdi                        ; 30F7 _ 48: 89. F9
000030FA        mov     rdx, rsi                        ; 30FA _ 48: 89. F2
000030FD        xor     r9d, r9d                        ; 30FD _ 45: 31. C9
00003100        call    _EfiLibInstallDriverBindingComponentName2; 3100 _ E8, FFFFF6BF
00003105        mov     rsi, rax                        ; 3105 _ 48: 89. C6
00003108        call    _DebugAssertEnabled             ; 3108 _ E8, FFFFECED
0000310D        test    al, al                          ; 310D _ 84. C0
0000310F        jz      ?_280                           ; 310F _ 74, 48
00003111        test    rsi, rsi                        ; 3111 _ 48: 85. F6
00003114        jns     ?_280                           ; 3114 _ 79, 43
00003116        call    _DebugPrintEnabled              ; 3116 _ E8, FFFFED69
0000311B        test    al, al                          ; 311B _ 84. C0
0000311D        jz      ?_279                           ; 311D _ 74, 22
0000311F        mov     ecx, 2147483648                 ; 311F _ B9, 80000000
00003124        call    _DebugPrintLevelEnabled         ; 3124 _ E8, FFFFED69
00003129        test    al, al                          ; 3129 _ 84. C0
0000312B        jz      ?_279                           ; 312B _ 74, 14
0000312D        lea     rdx, ptr [?_369]                ; 312D _ 48: 8D. 15, 000012DD(rel)
00003134        mov     ecx, 2147483648                 ; 3134 _ B9, 80000000
00003139        mov     r8, rsi                         ; 3139 _ 49: 89. F0
0000313C        call    _DebugPrint                     ; 313C _ E8, FFFFEC19
?_279:
00003141        lea     rcx, ptr [?_380]                ; 3141 _ 48: 8D. 0D, 00001559(rel)
00003148        lea     r8, ptr [?_370]                 ; 3148 _ 4C: 8D. 05, 000012E3(rel)
0000314F        mov     edx, 76                         ; 314F _ BA, 0000004C
00003154        call    _DebugAssert                    ; 3154 _ E8, FFFFECAC
?_280:
00003159        xor     eax, eax                        ; 3159 _ 31. C0
0000315B        add     rsp, 56                         ; 315B _ 48: 83. C4, 38
0000315F        pop     rbx                             ; 315F _ 5B
00003160        pop     rdi                             ; 3160 _ 5F
00003161        pop     rsi                             ; 3161 _ 5E
00003162        pop     rbp                             ; 3162 _ 5D
00003163        ret                                     ; 3163 _ C3
_InitializeConPlatform ENDP

_ConPlatformDriverBindingSupported PROC
00003164        push    rbp                             ; 3164 _ 55
00003165        mov     rbp, rsp                        ; 3165 _ 48: 89. E5
00003168        push    rsi                             ; 3168 _ 56
00003169        push    rdi                             ; 3169 _ 57
0000316A        push    rbx                             ; 316A _ 53
0000316B        sub     rsp, 56                         ; 316B _ 48: 83. EC, 38
0000316F        mov     rdi, r8                         ; 316F _ 4C: 89. C7
00003172        mov     rsi, rdx                        ; 3172 _ 48: 89. D6
00003175        mov     rbx, rcx                        ; 3175 _ 48: 89. CB
00003178        mov     r9, qword ptr [rbx+28H]         ; 3178 _ 4C: 8B. 4B, 28
0000317C        mov     rax, qword ptr [_gBS]           ; 317C _ 48: 8B. 05, 000027E5(rel)
00003183        mov     qword ptr [rsp+20H], rsi        ; 3183 _ 48: 89. 74 24, 20
00003188        mov     dword ptr [rsp+28H], 4          ; 3188 _ C7. 44 24, 28, 00000004
00003190        lea     rdx, ptr [_gEfiDevicePathProtocolGuid]; 3190 _ 48: 8D. 15, 00002731(rel)
00003197        mov     rcx, rsi                        ; 3197 _ 48: 89. F1
0000319A        xor     r8d, r8d                        ; 319A _ 45: 31. C0
0000319D        call    qword ptr [rax+118H]            ; 319D _ FF. 90, 00000118
000031A3        test    rax, rax                        ; 31A3 _ 48: 85. C0
000031A6        js      ?_281                           ; 31A6 _ 78, 49
000031A8        mov     r9, qword ptr [rbx+28H]         ; 31A8 _ 4C: 8B. 4B, 28
000031AC        mov     rax, qword ptr [_gBS]           ; 31AC _ 48: 8B. 05, 000027B5(rel)
000031B3        mov     qword ptr [rsp+20H], rsi        ; 31B3 _ 48: 89. 74 24, 20
000031B8        mov     dword ptr [rsp+28H], 16         ; 31B8 _ C7. 44 24, 28, 00000010
000031C0        lea     r8, ptr [rbp-20H]               ; 31C0 _ 4C: 8D. 45, E0
000031C4        mov     rcx, rsi                        ; 31C4 _ 48: 89. F1
000031C7        mov     rdx, rdi                        ; 31C7 _ 48: 89. FA
000031CA        call    qword ptr [rax+118H]            ; 31CA _ FF. 90, 00000118
000031D0        test    rax, rax                        ; 31D0 _ 48: 85. C0
000031D3        js      ?_281                           ; 31D3 _ 78, 1C
000031D5        mov     r8, qword ptr [rbx+28H]         ; 31D5 _ 4C: 8B. 43, 28
000031D9        mov     rax, qword ptr [_gBS]           ; 31D9 _ 48: 8B. 05, 00002788(rel)
000031E0        mov     rcx, rsi                        ; 31E0 _ 48: 89. F1
000031E3        mov     rdx, rdi                        ; 31E3 _ 48: 89. FA
000031E6        mov     r9, rsi                         ; 31E6 _ 49: 89. F1
000031E9        call    qword ptr [rax+120H]            ; 31E9 _ FF. 90, 00000120
000031EF        xor     eax, eax                        ; 31EF _ 31. C0
?_281:
000031F1        add     rsp, 56                         ; 31F1 _ 48: 83. C4, 38
000031F5        pop     rbx                             ; 31F5 _ 5B
000031F6        pop     rdi                             ; 31F6 _ 5F
000031F7        pop     rsi                             ; 31F7 _ 5E
000031F8        pop     rbp                             ; 31F8 _ 5D
000031F9        ret                                     ; 31F9 _ C3
_ConPlatformDriverBindingSupported ENDP

_ConPlatformUpdateDeviceVariable PROC
000031FA        push    rbp                             ; 31FA _ 55
000031FB        mov     rbp, rsp                        ; 31FB _ 48: 89. E5
000031FE        push    r15                             ; 31FE _ 41: 57
00003200        push    r14                             ; 3200 _ 41: 56
00003202        push    rsi                             ; 3202 _ 56
00003203        push    rdi                             ; 3203 _ 57
00003204        push    rbx                             ; 3204 _ 53
00003205        sub     rsp, 56                         ; 3205 _ 48: 83. EC, 38
00003209        mov     r15d, r8d                       ; 3209 _ 45: 89. C7
0000320C        mov     rsi, rdx                        ; 320C _ 48: 89. D6
0000320F        mov     r14, rcx                        ; 320F _ 49: 89. CE
00003212        mov     qword ptr [rbp-30H], 0          ; 3212 _ 48: C7. 45, D0, 00000000
0000321A        call    _ConPlatformGetVariable         ; 321A _ E8, 00000300
0000321F        mov     rdi, rax                        ; 321F _ 48: 89. C7
00003222        cmp     r15d, 2                         ; 3222 _ 41: 83. FF, 02
00003226        jz      ?_284                           ; 3226 _ 74, 56
00003228        mov     rcx, rdi                        ; 3228 _ 48: 89. F9
0000322B        mov     rdx, rsi                        ; 322B _ 48: 89. F2
0000322E        xor     r8d, r8d                        ; 322E _ 45: 31. C0
00003231        xor     r9d, r9d                        ; 3231 _ 45: 31. C9
00003234        call    _ConPlatformMatchDevicePaths    ; 3234 _ E8, 000004CB
00003239        mov     rbx, rax                        ; 3239 _ 48: 89. C3
0000323C        test    r15d, r15d                      ; 323C _ 45: 85. FF
0000323F        jz      ?_282                           ; 323F _ 74, 05
00003241        test    rbx, rbx                        ; 3241 _ 48: 85. DB
00003244        js      ?_283                           ; 3244 _ 78, 11
?_282:
00003246        test    rdi, rdi                        ; 3246 _ 48: 85. FF
00003249        je      ?_288                           ; 3249 _ 0F 84, 0000009C
0000324F        mov     rcx, rdi                        ; 324F _ 48: 89. F9
00003252        jmp     ?_287                           ; 3252 _ E9, 0000008F

?_283:
00003257        mov     rcx, rdi                        ; 3257 _ 48: 89. F9
0000325A        mov     rdx, rsi                        ; 325A _ 48: 89. F2
0000325D        call    _AppendDevicePathInstance       ; 325D _ E8, FFFFF558
00003262        mov     qword ptr [rbp-30H], rax        ; 3262 _ 48: 89. 45, D0
00003266        mov     rcx, 9H                         ; 3266 _ 48: B9, 8000000000000009
00003270        test    rax, rax                        ; 3270 _ 48: 85. C0
00003273        mov     ebx, 0                          ; 3273 _ BB, 00000000
00003278        cmove   rbx, rcx                        ; 3278 _ 48: 0F 44. D9
0000327C        jmp     ?_285                           ; 327C _ EB, 18

?_284:
0000327E        lea     r8, ptr [rbp-30H]               ; 327E _ 4C: 8D. 45, D0
00003282        mov     rcx, rdi                        ; 3282 _ 48: 89. F9
00003285        mov     rdx, rsi                        ; 3285 _ 48: 89. F2
00003288        mov     r9d, 1                          ; 3288 _ 41: B9, 00000001
0000328E        call    _ConPlatformMatchDevicePaths    ; 328E _ E8, 00000471
00003293        mov     rbx, rax                        ; 3293 _ 48: 89. C3
?_285:
00003296        test    rdi, rdi                        ; 3296 _ 48: 85. FF
00003299        jz      ?_286                           ; 3299 _ 74, 08
0000329B        mov     rcx, rdi                        ; 329B _ 48: 89. F9
0000329E        call    _FreePool                       ; 329E _ E8, FFFFEF97
?_286:
000032A3        test    rbx, rbx                        ; 32A3 _ 48: 85. DB
000032A6        js      ?_288                           ; 32A6 _ 78, 43
000032A8        mov     rcx, qword ptr [rbp-30H]        ; 32A8 _ 48: 8B. 4D, D0
000032AC        test    rcx, rcx                        ; 32AC _ 48: 85. C9
000032AF        jz      ?_288                           ; 32AF _ 74, 3A
000032B1        mov     rax, qword ptr [_gRT]           ; 32B1 _ 48: 8B. 05, 000026B8(rel)
000032B8        mov     rsi, qword ptr [rax+58H]        ; 32B8 _ 48: 8B. 70, 58
000032BC        call    _GetDevicePathSize              ; 32BC _ E8, FFFFF4EF
000032C1        mov     rcx, qword ptr [rbp-30H]        ; 32C1 _ 48: 8B. 4D, D0
000032C5        lea     rdx, ptr [_gEfiGlobalVariableGuid]; 32C5 _ 48: 8D. 15, 000025BC(rel)
000032CC        mov     qword ptr [rsp+20H], rcx        ; 32CC _ 48: 89. 4C 24, 20
000032D1        mov     rcx, r14                        ; 32D1 _ 4C: 89. F1
000032D4        mov     r8d, 6                          ; 32D4 _ 41: B8, 00000006
000032DA        mov     r9, rax                         ; 32DA _ 49: 89. C1
000032DD        call    rsi                             ; 32DD _ FF. D6
000032DF        mov     rbx, rax                        ; 32DF _ 48: 89. C3
000032E2        mov     rcx, qword ptr [rbp-30H]        ; 32E2 _ 48: 8B. 4D, D0
?_287:
000032E6        call    _FreePool                       ; 32E6 _ E8, FFFFEF4F
?_288:
000032EB        mov     rax, rbx                        ; 32EB _ 48: 89. D8
000032EE        add     rsp, 56                         ; 32EE _ 48: 83. C4, 38
000032F2        pop     rbx                             ; 32F2 _ 5B
000032F3        pop     rdi                             ; 32F3 _ 5F
000032F4        pop     rsi                             ; 32F4 _ 5E
000032F5        pop     r14                             ; 32F5 _ 41: 5E
000032F7        pop     r15                             ; 32F7 _ 41: 5F
000032F9        pop     rbp                             ; 32F9 _ 5D
000032FA        ret                                     ; 32FA _ C3
_ConPlatformUpdateDeviceVariable ENDP

_IsHotPlugDevice PROC
000032FB        push    rbp                             ; 32FB _ 55
000032FC        mov     rbp, rsp                        ; 32FC _ 48: 89. E5
000032FF        push    rsi                             ; 32FF _ 56
00003300        sub     rsp, 40                         ; 3300 _ 48: 83. EC, 28
00003304        mov     rsi, rcx                        ; 3304 _ 48: 89. CE
00003307        jmp     ?_290                           ; 3307 _ EB, 0B

?_289:
00003309        mov     rcx, rsi                        ; 3309 _ 48: 89. F1
0000330C        call    _NextDevicePathNode             ; 330C _ E8, FFFFF134
00003311        mov     rsi, rax                        ; 3311 _ 48: 89. C6
?_290:
00003314        mov     rcx, rsi                        ; 3314 _ 48: 89. F1
00003317        call    _IsDevicePathEnd                ; 3317 _ E8, FFFFF08A
0000331C        xor     cl, cl                          ; 331C _ 30. C9
0000331E        test    al, al                          ; 331E _ 84. C0
00003320        jnz     ?_292                           ; 3320 _ 75, 50
00003322        mov     rcx, rsi                        ; 3322 _ 48: 89. F1
00003325        call    _DevicePathType                 ; 3325 _ E8, FFFFF15F
0000332A        cmp     al, 3                           ; 332A _ 3C, 03
0000332C        jnz     ?_291                           ; 332C _ 75, 2A
0000332E        mov     rcx, rsi                        ; 332E _ 48: 89. F1
00003331        call    _DevicePathSubType              ; 3331 _ E8, FFFFF18F
00003336        mov     cl, 1                           ; 3336 _ B1, 01
00003338        cmp     al, 5                           ; 3338 _ 3C, 05
0000333A        jz      ?_292                           ; 333A _ 74, 36
0000333C        mov     rcx, rsi                        ; 333C _ 48: 89. F1
0000333F        call    _DevicePathSubType              ; 333F _ E8, FFFFF181
00003344        mov     cl, 1                           ; 3344 _ B1, 01
00003346        cmp     al, 15                          ; 3346 _ 3C, 0F
00003348        jz      ?_292                           ; 3348 _ 74, 28
0000334A        mov     rcx, rsi                        ; 334A _ 48: 89. F1
0000334D        call    _DevicePathSubType              ; 334D _ E8, FFFFF173
00003352        mov     cl, 1                           ; 3352 _ B1, 01
00003354        cmp     al, 16                          ; 3354 _ 3C, 10
00003356        jz      ?_292                           ; 3356 _ 74, 1A
?_291:
00003358        mov     rcx, rsi                        ; 3358 _ 48: 89. F1
0000335B        call    _DevicePathType                 ; 335B _ E8, FFFFF129
00003360        cmp     al, 1                           ; 3360 _ 3C, 01
00003362        jnz     ?_289                           ; 3362 _ 75, A5
00003364        mov     rcx, rsi                        ; 3364 _ 48: 89. F1
00003367        call    _DevicePathSubType              ; 3367 _ E8, FFFFF159
0000336C        mov     cl, 1                           ; 336C _ B1, 01
0000336E        cmp     al, 2                           ; 336E _ 3C, 02
00003370        jnz     ?_289                           ; 3370 _ 75, 97
?_292:
00003372        movzx   eax, cl                         ; 3372 _ 0F B6. C1
00003375        add     rsp, 40                         ; 3375 _ 48: 83. C4, 28
00003379        pop     rsi                             ; 3379 _ 5E
0000337A        pop     rbp                             ; 337A _ 5D
0000337B        ret                                     ; 337B _ C3
_IsHotPlugDevice ENDP

_ConPlatformUpdateGopCandidate PROC
0000337C        push    rbp                             ; 337C _ 55
0000337D        mov     rbp, rsp                        ; 337D _ 48: 89. E5
00003380        push    r15                             ; 3380 _ 41: 57
00003382        push    r14                             ; 3382 _ 41: 56
00003384        push    r12                             ; 3384 _ 41: 54
00003386        push    rsi                             ; 3386 _ 56
00003387        push    rdi                             ; 3387 _ 57
00003388        push    rbx                             ; 3388 _ 53
00003389        sub     rsp, 112                        ; 3389 _ 48: 83. EC, 70
0000338D        mov     qword ptr [rbp-38H], rcx        ; 338D _ 48: 89. 4D, C8
00003391        mov     qword ptr [rbp-68H], rcx        ; 3391 _ 48: 89. 4D, 98
00003395        mov     rax, qword ptr [_gBS]           ; 3395 _ 48: 8B. 05, 000025CC(rel)
0000339C        lea     rcx, ptr [_gEfiGraphicsOutputProtocolGuid]; 339C _ 48: 8D. 0D, 00002565(rel)
000033A3        lea     rdx, ptr [rbp-68H]              ; 33A3 _ 48: 8D. 55, 98
000033A7        lea     r8, ptr [rbp-48H]               ; 33A7 _ 4C: 8D. 45, B8
000033AB        call    qword ptr [rax+0B8H]            ; 33AB _ FF. 90, 000000B8
000033B1        xor     cl, cl                          ; 33B1 _ 30. C9
000033B3        test    rax, rax                        ; 33B3 _ 48: 85. C0
000033B6        js      ?_296                           ; 33B6 _ 0F 88, 000000F4
000033BC        mov     rax, qword ptr [_gBS]           ; 33BC _ 48: 8B. 05, 000025A5(rel)
000033C3        lea     rcx, ptr [_gEfiPciIoProtocolGuid]; 33C3 _ 48: 8D. 0D, 0000252E(rel)
000033CA        lea     rdx, ptr [rbp-38H]              ; 33CA _ 48: 8D. 55, C8
000033CE        lea     r8, ptr [rbp-40H]               ; 33CE _ 4C: 8D. 45, C0
000033D2        call    qword ptr [rax+0B8H]            ; 33D2 _ FF. 90, 000000B8
000033D8        xor     cl, cl                          ; 33D8 _ 30. C9
000033DA        test    rax, rax                        ; 33DA _ 48: 85. C0
000033DD        js      ?_296                           ; 33DD _ 0F 88, 000000CD
000033E3        mov     rcx, qword ptr [rbp-40H]        ; 33E3 _ 48: 8B. 4D, C0
000033E7        mov     rax, qword ptr [_gBS]           ; 33E7 _ 48: 8B. 05, 0000257A(rel)
000033EE        lea     rdx, ptr [_gEfiPciIoProtocolGuid]; 33EE _ 48: 8D. 15, 00002503(rel)
000033F5        lea     r8, ptr [rbp-50H]               ; 33F5 _ 4C: 8D. 45, B0
000033F9        lea     r9, ptr [rbp-58H]               ; 33F9 _ 4C: 8D. 4D, A8
000033FD        call    qword ptr [rax+128H]            ; 33FD _ FF. 90, 00000128
00003403        xor     cl, cl                          ; 3403 _ 30. C9
00003405        test    rax, rax                        ; 3405 _ 48: 85. C0
00003408        js      ?_296                           ; 3408 _ 0F 88, 000000A2
0000340E        mov     rcx, qword ptr [rbp-50H]        ; 340E _ 48: 8B. 4D, B0
00003412        cmp     qword ptr [rbp-58H], 0          ; 3412 _ 48: 83. 7D, A8, 00
00003417        je      ?_295                           ; 3417 _ 0F 84, 0000008C
0000341D        xor     edi, edi                        ; 341D _ 31. FF
0000341F        mov     ebx, 16                         ; 341F _ BB, 00000010
00003424        lea     r14, ptr [_gEfiDevicePathProtocolGuid]; 3424 _ 4C: 8D. 35, 0000249D(rel)
0000342B        lea     r15, ptr [rbp-60H]              ; 342B _ 4C: 8D. 7D, A0
0000342F        lea     r12, ptr [?_386]                ; 342F _ 4C: 8D. 25, 0000140A(rel)
00003436        lea     rsi, ptr [?_387]                ; 3436 _ 48: 8D. 35, 00001417(rel)
?_293:
0000343D        test    byte ptr [rcx+rbx], 8H          ; 343D _ F6. 04 19, 08
00003441        jz      ?_294                           ; 3441 _ 74, 55
00003443        mov     rcx, qword ptr [rcx+rbx-8H]     ; 3443 _ 48: 8B. 4C 19, F8
00003448        mov     rax, qword ptr [_gBS]           ; 3448 _ 48: 8B. 05, 00002519(rel)
0000344F        mov     dword ptr [rsp+28H], 2          ; 344F _ C7. 44 24, 28, 00000002
00003457        mov     qword ptr [rsp+20H], 0          ; 3457 _ 48: C7. 44 24, 20, 00000000
00003460        mov     rdx, r14                        ; 3460 _ 4C: 89. F2
00003463        mov     r8, r15                         ; 3463 _ 4D: 89. F8
00003466        xor     r9d, r9d                        ; 3466 _ 45: 31. C9
00003469        call    qword ptr [rax+118H]            ; 3469 _ FF. 90, 00000118
0000346F        test    rax, rax                        ; 346F _ 48: 85. C0
00003472        js      ?_294                           ; 3472 _ 78, 24
00003474        mov     rdx, qword ptr [rbp-60H]        ; 3474 _ 48: 8B. 55, A0
00003478        mov     rcx, r12                        ; 3478 _ 4C: 89. E1
0000347B        mov     r8d, 1                          ; 347B _ 41: B8, 00000001
00003481        call    _ConPlatformUpdateDeviceVariable; 3481 _ E8, FFFFFD74
00003486        mov     rdx, qword ptr [rbp-60H]        ; 3486 _ 48: 8B. 55, A0
0000348A        mov     rcx, rsi                        ; 348A _ 48: 89. F1
0000348D        mov     r8d, 1                          ; 348D _ 41: B8, 00000001
00003493        call    _ConPlatformUpdateDeviceVariable; 3493 _ E8, FFFFFD62
?_294:
00003498        add     rbx, 24                         ; 3498 _ 48: 83. C3, 18
0000349C        inc     rdi                             ; 349C _ 48: FF. C7
0000349F        mov     rcx, qword ptr [rbp-50H]        ; 349F _ 48: 8B. 4D, B0
000034A3        cmp     rdi, qword ptr [rbp-58H]        ; 34A3 _ 48: 3B. 7D, A8
000034A7        jc      ?_293                           ; 34A7 _ 72, 94
?_295:
000034A9        call    _FreePool                       ; 34A9 _ E8, FFFFED8C
000034AE        mov     cl, 1                           ; 34AE _ B1, 01
?_296:
000034B0        movzx   eax, cl                         ; 34B0 _ 0F B6. C1
000034B3        add     rsp, 112                        ; 34B3 _ 48: 83. C4, 70
000034B7        pop     rbx                             ; 34B7 _ 5B
000034B8        pop     rdi                             ; 34B8 _ 5F
000034B9        pop     rsi                             ; 34B9 _ 5E
000034BA        pop     r12                             ; 34BA _ 41: 5C
000034BC        pop     r14                             ; 34BC _ 41: 5E
000034BE        pop     r15                             ; 34BE _ 41: 5F
000034C0        pop     rbp                             ; 34C0 _ 5D
000034C1        ret                                     ; 34C1 _ C3
_ConPlatformUpdateGopCandidate ENDP

_ConPlatformUnInstallProtocol PROC
000034C2        push    rbp                             ; 34C2 _ 55
000034C3        mov     rbp, rsp                        ; 34C3 _ 48: 89. E5
000034C6        push    rsi                             ; 34C6 _ 56
000034C7        push    rdi                             ; 34C7 _ 57
000034C8        sub     rsp, 48                         ; 34C8 _ 48: 83. EC, 30
000034CC        mov     rsi, r8                         ; 34CC _ 4C: 89. C6
000034CF        mov     rdi, rdx                        ; 34CF _ 48: 89. D7
000034D2        mov     r9, qword ptr [rcx+28H]         ; 34D2 _ 4C: 8B. 49, 28
000034D6        mov     rax, qword ptr [_gBS]           ; 34D6 _ 48: 8B. 05, 0000248B(rel)
000034DD        mov     qword ptr [rsp+20H], rdi        ; 34DD _ 48: 89. 7C 24, 20
000034E2        mov     dword ptr [rsp+28H], 4          ; 34E2 _ C7. 44 24, 28, 00000004
000034EA        mov     rcx, rdi                        ; 34EA _ 48: 89. F9
000034ED        mov     rdx, rsi                        ; 34ED _ 48: 89. F2
000034F0        xor     r8d, r8d                        ; 34F0 _ 45: 31. C0
000034F3        call    qword ptr [rax+118H]            ; 34F3 _ FF. 90, 00000118
000034F9        test    rax, rax                        ; 34F9 _ 48: 85. C0
000034FC        js      ?_297                           ; 34FC _ 78, 19
000034FE        mov     rax, qword ptr [_gBS]           ; 34FE _ 48: 8B. 05, 00002463(rel)
00003505        mov     rcx, rdi                        ; 3505 _ 48: 89. F9
00003508        mov     rdx, rsi                        ; 3508 _ 48: 89. F2
0000350B        xor     r8d, r8d                        ; 350B _ 45: 31. C0
0000350E        xor     r9d, r9d                        ; 350E _ 45: 31. C9
00003511        call    qword ptr [rax+150H]            ; 3511 _ FF. 90, 00000150
?_297:
00003517        add     rsp, 48                         ; 3517 _ 48: 83. C4, 30
0000351B        pop     rdi                             ; 351B _ 5F
0000351C        pop     rsi                             ; 351C _ 5E
0000351D        pop     rbp                             ; 351D _ 5D
0000351E        ret                                     ; 351E _ C3
_ConPlatformUnInstallProtocol ENDP

_ConPlatformGetVariable PROC
0000351F        push    rbp                             ; 351F _ 55
00003520        mov     rbp, rsp                        ; 3520 _ 48: 89. E5
00003523        push    rsi                             ; 3523 _ 56
00003524        push    rdi                             ; 3524 _ 57
00003525        push    rbx                             ; 3525 _ 53
00003526        sub     rsp, 56                         ; 3526 _ 48: 83. EC, 38
0000352A        mov     rsi, rcx                        ; 352A _ 48: 89. CE
0000352D        mov     qword ptr [rbp-20H], 0          ; 352D _ 48: C7. 45, E0, 00000000
00003535        mov     rax, qword ptr [_gRT]           ; 3535 _ 48: 8B. 05, 00002434(rel)
0000353C        mov     qword ptr [rsp+20H], 0          ; 353C _ 48: C7. 44 24, 20, 00000000
00003545        lea     rdx, ptr [_gEfiGlobalVariableGuid]; 3545 _ 48: 8D. 15, 0000233C(rel)
0000354C        xor     edi, edi                        ; 354C _ 31. FF
0000354E        lea     r9, ptr [rbp-20H]               ; 354E _ 4C: 8D. 4D, E0
00003552        xor     r8d, r8d                        ; 3552 _ 45: 31. C0
00003555        call    qword ptr [rax+48H]             ; 3555 _ FF. 50, 48
00003558        mov     rcx, 5H                         ; 3558 _ 48: B9, 8000000000000005
00003562        cmp     rax, rcx                        ; 3562 _ 48: 39. C8
00003565        jnz     ?_299                           ; 3565 _ 75, 47
00003567        mov     rcx, qword ptr [rbp-20H]        ; 3567 _ 48: 8B. 4D, E0
0000356B        call    _AllocatePool                   ; 356B _ E8, FFFFEC12
00003570        mov     rbx, rax                        ; 3570 _ 48: 89. C3
00003573        xor     edi, edi                        ; 3573 _ 31. FF
00003575        test    rbx, rbx                        ; 3575 _ 48: 85. DB
00003578        jz      ?_299                           ; 3578 _ 74, 34
0000357A        mov     rax, qword ptr [_gRT]           ; 357A _ 48: 8B. 05, 000023EF(rel)
00003581        mov     qword ptr [rsp+20H], rbx        ; 3581 _ 48: 89. 5C 24, 20
00003586        lea     rdx, ptr [_gEfiGlobalVariableGuid]; 3586 _ 48: 8D. 15, 000022FB(rel)
0000358D        xor     edi, edi                        ; 358D _ 31. FF
0000358F        lea     r9, ptr [rbp-20H]               ; 358F _ 4C: 8D. 4D, E0
00003593        mov     rcx, rsi                        ; 3593 _ 48: 89. F1
00003596        xor     r8d, r8d                        ; 3596 _ 45: 31. C0
00003599        call    qword ptr [rax+48H]             ; 3599 _ FF. 50, 48
0000359C        test    rax, rax                        ; 359C _ 48: 85. C0
0000359F        js      ?_298                           ; 359F _ 78, 05
000035A1        mov     rdi, rbx                        ; 35A1 _ 48: 89. DF
000035A4        jmp     ?_299                           ; 35A4 _ EB, 08

?_298:
000035A6        mov     rcx, rbx                        ; 35A6 _ 48: 89. D9
000035A9        call    _FreePool                       ; 35A9 _ E8, FFFFEC8C
?_299:
000035AE        mov     rax, rdi                        ; 35AE _ 48: 89. F8
000035B1        add     rsp, 56                         ; 35B1 _ 48: 83. C4, 38
000035B5        pop     rbx                             ; 35B5 _ 5B
000035B6        pop     rdi                             ; 35B6 _ 5F
000035B7        pop     rsi                             ; 35B7 _ 5E
000035B8        pop     rbp                             ; 35B8 _ 5D
000035B9        ret                                     ; 35B9 _ C3
_ConPlatformGetVariable ENDP

_IsGopSibling PROC
000035BA        push    rbp                             ; 35BA _ 55
000035BB        mov     rbp, rsp                        ; 35BB _ 48: 89. E5
000035BE        push    r14                             ; 35BE _ 41: 56
000035C0        push    rsi                             ; 35C0 _ 56
000035C1        push    rdi                             ; 35C1 _ 57
000035C2        push    rbx                             ; 35C2 _ 53
000035C3        sub     rsp, 32                         ; 35C3 _ 48: 83. EC, 20
000035C7        mov     r14, rdx                        ; 35C7 _ 49: 89. D6
000035CA        mov     rdi, rcx                        ; 35CA _ 48: 89. CF
000035CD        mov     rbx, rdi                        ; 35CD _ 48: 89. FB
000035D0        jmp     ?_301                           ; 35D0 _ EB, 0B

?_300:
000035D2        mov     rcx, rbx                        ; 35D2 _ 48: 89. D9
000035D5        call    _NextDevicePathNode             ; 35D5 _ E8, FFFFEE6B
000035DA        mov     rbx, rax                        ; 35DA _ 48: 89. C3
?_301:
000035DD        mov     rcx, rbx                        ; 35DD _ 48: 89. D9
000035E0        call    _IsDevicePathEndType            ; 35E0 _ E8, FFFFEF1D
000035E5        test    al, al                          ; 35E5 _ 84. C0
000035E7        jnz     ?_303                           ; 35E7 _ 75, 58
000035E9        mov     rcx, rbx                        ; 35E9 _ 48: 89. D9
000035EC        call    _DevicePathType                 ; 35EC _ E8, FFFFEE98
000035F1        cmp     al, 2                           ; 35F1 _ 3C, 02
000035F3        jnz     ?_302                           ; 35F3 _ 75, 0C
000035F5        mov     rcx, rbx                        ; 35F5 _ 48: 89. D9
000035F8        call    _DevicePathSubType              ; 35F8 _ E8, FFFFEEC8
000035FD        cmp     al, 3                           ; 35FD _ 3C, 03
000035FF        jz      ?_303                           ; 35FF _ 74, 40
?_302:
00003601        mov     rcx, rbx                        ; 3601 _ 48: 89. D9
00003604        call    _DevicePathType                 ; 3604 _ E8, FFFFEE80
00003609        cmp     al, 1                           ; 3609 _ 3C, 01
0000360B        jnz     ?_300                           ; 360B _ 75, C5
0000360D        mov     rcx, rbx                        ; 360D _ 48: 89. D9
00003610        call    _DevicePathSubType              ; 3610 _ E8, FFFFEEB0
00003615        cmp     al, 5                           ; 3615 _ 3C, 05
00003617        jnz     ?_300                           ; 3617 _ 75, B9
00003619        mov     rcx, rbx                        ; 3619 _ 48: 89. D9
0000361C        call    _NextDevicePathNode             ; 361C _ E8, FFFFEE24
00003621        mov     rcx, rax                        ; 3621 _ 48: 89. C1
00003624        call    _DevicePathType                 ; 3624 _ E8, FFFFEE60
00003629        cmp     al, 2                           ; 3629 _ 3C, 02
0000362B        jnz     ?_300                           ; 362B _ 75, A5
0000362D        mov     rcx, rbx                        ; 362D _ 48: 89. D9
00003630        call    _NextDevicePathNode             ; 3630 _ E8, FFFFEE10
00003635        mov     rcx, rax                        ; 3635 _ 48: 89. C1
00003638        call    _DevicePathSubType              ; 3638 _ E8, FFFFEE88
0000363D        cmp     al, 3                           ; 363D _ 3C, 03
0000363F        jnz     ?_300                           ; 363F _ 75, 91
?_303:
00003641        mov     rcx, rbx                        ; 3641 _ 48: 89. D9
00003644        call    _IsDevicePathEndType            ; 3644 _ E8, FFFFEEB9
00003649        xor     cl, cl                          ; 3649 _ 30. C9
0000364B        test    al, al                          ; 364B _ 84. C0
0000364D        jne     ?_308                           ; 364D _ 0F 85, 000000A3
00003653        mov     rsi, r14                        ; 3653 _ 4C: 89. F6
00003656        jmp     ?_305                           ; 3656 _ EB, 0B

?_304:
00003658        mov     rcx, rsi                        ; 3658 _ 48: 89. F1
0000365B        call    _NextDevicePathNode             ; 365B _ E8, FFFFEDE5
00003660        mov     rsi, rax                        ; 3660 _ 48: 89. C6
?_305:
00003663        mov     rcx, rsi                        ; 3663 _ 48: 89. F1
00003666        call    _IsDevicePathEndType            ; 3666 _ E8, FFFFEE97
0000366B        test    al, al                          ; 366B _ 84. C0
0000366D        jnz     ?_307                           ; 366D _ 75, 58
0000366F        mov     rcx, rsi                        ; 366F _ 48: 89. F1
00003672        call    _DevicePathType                 ; 3672 _ E8, FFFFEE12
00003677        cmp     al, 2                           ; 3677 _ 3C, 02
00003679        jnz     ?_306                           ; 3679 _ 75, 0C
0000367B        mov     rcx, rsi                        ; 367B _ 48: 89. F1
0000367E        call    _DevicePathSubType              ; 367E _ E8, FFFFEE42
00003683        cmp     al, 3                           ; 3683 _ 3C, 03
00003685        jz      ?_307                           ; 3685 _ 74, 40
?_306:
00003687        mov     rcx, rsi                        ; 3687 _ 48: 89. F1
0000368A        call    _DevicePathType                 ; 368A _ E8, FFFFEDFA
0000368F        cmp     al, 1                           ; 368F _ 3C, 01
00003691        jnz     ?_304                           ; 3691 _ 75, C5
00003693        mov     rcx, rsi                        ; 3693 _ 48: 89. F1
00003696        call    _DevicePathSubType              ; 3696 _ E8, FFFFEE2A
0000369B        cmp     al, 5                           ; 369B _ 3C, 05
0000369D        jnz     ?_304                           ; 369D _ 75, B9
0000369F        mov     rcx, rsi                        ; 369F _ 48: 89. F1
000036A2        call    _NextDevicePathNode             ; 36A2 _ E8, FFFFED9E
000036A7        mov     rcx, rax                        ; 36A7 _ 48: 89. C1
000036AA        call    _DevicePathType                 ; 36AA _ E8, FFFFEDDA
000036AF        cmp     al, 2                           ; 36AF _ 3C, 02
000036B1        jnz     ?_304                           ; 36B1 _ 75, A5
000036B3        mov     rcx, rsi                        ; 36B3 _ 48: 89. F1
000036B6        call    _NextDevicePathNode             ; 36B6 _ E8, FFFFED8A
000036BB        mov     rcx, rax                        ; 36BB _ 48: 89. C1
000036BE        call    _DevicePathSubType              ; 36BE _ E8, FFFFEE02
000036C3        cmp     al, 3                           ; 36C3 _ 3C, 03
000036C5        jnz     ?_304                           ; 36C5 _ 75, 91
?_307:
000036C7        mov     rcx, rsi                        ; 36C7 _ 48: 89. F1
000036CA        call    _IsDevicePathEndType            ; 36CA _ E8, FFFFEE33
000036CF        xor     cl, cl                          ; 36CF _ 30. C9
000036D1        test    al, al                          ; 36D1 _ 84. C0
000036D3        jnz     ?_308                           ; 36D3 _ 75, 21
000036D5        sub     rbx, rdi                        ; 36D5 _ 48: 29. FB
000036D8        sub     rsi, r14                        ; 36D8 _ 4C: 29. F6
000036DB        xor     cl, cl                          ; 36DB _ 30. C9
000036DD        cmp     rbx, rsi                        ; 36DD _ 48: 39. F3
000036E0        jnz     ?_308                           ; 36E0 _ 75, 14
000036E2        mov     rcx, rdi                        ; 36E2 _ 48: 89. F9
000036E5        mov     rdx, r14                        ; 36E5 _ 4C: 89. F2
000036E8        mov     r8, rbx                         ; 36E8 _ 49: 89. D8
000036EB        call    _CompareMem                     ; 36EB _ E8, FFFFE7B2
000036F0        test    rax, rax                        ; 36F0 _ 48: 85. C0
000036F3        sete    cl                              ; 36F3 _ 0F 94. C1
?_308:
000036F6        movzx   eax, cl                         ; 36F6 _ 0F B6. C1
000036F9        add     rsp, 32                         ; 36F9 _ 48: 83. C4, 20
000036FD        pop     rbx                             ; 36FD _ 5B
000036FE        pop     rdi                             ; 36FE _ 5F
000036FF        pop     rsi                             ; 36FF _ 5E
00003700        pop     r14                             ; 3700 _ 41: 5E
00003702        pop     rbp                             ; 3702 _ 5D
00003703        ret                                     ; 3703 _ C3
_IsGopSibling ENDP

_ConPlatformMatchDevicePaths PROC
00003704        push    rbp                             ; 3704 _ 55
00003705        mov     rbp, rsp                        ; 3705 _ 48: 89. E5
00003708        push    r15                             ; 3708 _ 41: 57
0000370A        push    r14                             ; 370A _ 41: 56
0000370C        push    r13                             ; 370C _ 41: 55
0000370E        push    r12                             ; 370E _ 41: 54
00003710        push    rsi                             ; 3710 _ 56
00003711        push    rdi                             ; 3711 _ 57
00003712        push    rbx                             ; 3712 _ 53
00003713        sub     rsp, 56                         ; 3713 _ 48: 83. EC, 38
00003717        mov     edi, r9d                        ; 3717 _ 44: 89. CF
0000371A        mov     r13, rdx                        ; 371A _ 49: 89. D5
0000371D        mov     rax, 2H                         ; 371D _ 48: B8, 8000000000000002
00003727        test    rcx, rcx                        ; 3727 _ 48: 85. C9
0000372A        je      ?_317                           ; 372A _ 0F 84, 000000CB
00003730        test    r13, r13                        ; 3730 _ 4D: 85. ED
00003733        je      ?_317                           ; 3733 _ 0F 84, 000000C2
00003739        test    dil, dil                        ; 3739 _ 40: 84. FF
0000373C        jz      ?_309                           ; 373C _ 74, 13
0000373E        mov     rax, 2H                         ; 373E _ 48: B8, 8000000000000002
00003748        test    r8, r8                          ; 3748 _ 4D: 85. C0
0000374B        je      ?_317                           ; 374B _ 0F 84, 000000AA
?_309:
00003751        mov     qword ptr [rbp-50H], r8         ; 3751 _ 4C: 89. 45, B0
00003755        mov     qword ptr [rbp-40H], rcx        ; 3755 _ 48: 89. 4D, C0
00003759        lea     r15, ptr [rbp-40H]              ; 3759 _ 4C: 8D. 7D, C0
0000375D        lea     r12, ptr [rbp-48H]              ; 375D _ 4C: 8D. 65, B8
00003761        mov     rcx, r15                        ; 3761 _ 4C: 89. F9
00003764        mov     rdx, r12                        ; 3764 _ 4C: 89. E2
00003767        call    _GetNextDevicePathInstance      ; 3767 _ E8, FFFFF053
0000376C        mov     rbx, rax                        ; 376C _ 48: 89. C3
0000376F        xor     esi, esi                        ; 376F _ 31. F6
00003771        jmp     ?_313                           ; 3771 _ EB, 39

?_310:
00003773        test    dil, dil                        ; 3773 _ 40: 84. FF
00003776        jz      ?_312                           ; 3776 _ 74, 1E
00003778        mov     rcx, rsi                        ; 3778 _ 48: 89. F1
0000377B        mov     rdx, rbx                        ; 377B _ 48: 89. DA
0000377E        call    _AppendDevicePathInstance       ; 377E _ E8, FFFFF037
00003783        mov     r14, rax                        ; 3783 _ 49: 89. C6
00003786        test    rsi, rsi                        ; 3786 _ 48: 85. F6
00003789        jz      ?_311                           ; 3789 _ 74, 08
0000378B        mov     rcx, rsi                        ; 378B _ 48: 89. F1
0000378E        call    _FreePool                       ; 378E _ E8, FFFFEAA7
?_311:
00003793        mov     rsi, r14                        ; 3793 _ 4C: 89. F6
?_312:
00003796        mov     rcx, rbx                        ; 3796 _ 48: 89. D9
00003799        call    _FreePool                       ; 3799 _ E8, FFFFEA9C
0000379E        mov     rcx, r15                        ; 379E _ 4C: 89. F9
000037A1        mov     rdx, r12                        ; 37A1 _ 4C: 89. E2
000037A4        call    _GetNextDevicePathInstance      ; 37A4 _ E8, FFFFF016
000037A9        mov     rbx, rax                        ; 37A9 _ 48: 89. C3
?_313:
000037AC        test    rbx, rbx                        ; 37AC _ 48: 85. DB
000037AF        jz      ?_315                           ; 37AF _ 74, 32
000037B1        mov     r8, qword ptr [rbp-48H]         ; 37B1 _ 4C: 8B. 45, B8
000037B5        mov     rcx, r13                        ; 37B5 _ 4C: 89. E9
000037B8        mov     rdx, rbx                        ; 37B8 _ 48: 89. DA
000037BB        call    _CompareMem                     ; 37BB _ E8, FFFFE6E2
000037C0        test    rax, rax                        ; 37C0 _ 48: 85. C0
000037C3        jz      ?_314                           ; 37C3 _ 74, 0F
000037C5        mov     rcx, r13                        ; 37C5 _ 4C: 89. E9
000037C8        mov     rdx, rbx                        ; 37C8 _ 48: 89. DA
000037CB        call    _IsGopSibling                   ; 37CB _ E8, FFFFFDEA
000037D0        test    al, al                          ; 37D0 _ 84. C0
000037D2        jz      ?_310                           ; 37D2 _ 74, 9F
?_314:
000037D4        test    dil, dil                        ; 37D4 _ 40: 84. FF
000037D7        jnz     ?_312                           ; 37D7 _ 75, BD
000037D9        mov     rcx, rbx                        ; 37D9 _ 48: 89. D9
000037DC        call    _FreePool                       ; 37DC _ E8, FFFFEA59
000037E1        jmp     ?_316                           ; 37E1 _ EB, 16

?_315:
000037E3        mov     rax, 0EH                        ; 37E3 _ 48: B8, 800000000000000E
000037ED        test    dil, dil                        ; 37ED _ 40: 84. FF
000037F0        mov     rcx, qword ptr [rbp-50H]        ; 37F0 _ 48: 8B. 4D, B0
000037F4        jz      ?_317                           ; 37F4 _ 74, 05
000037F6        mov     qword ptr [rcx], rsi            ; 37F6 _ 48: 89. 31
?_316:
000037F9        xor     eax, eax                        ; 37F9 _ 31. C0
?_317:
000037FB        add     rsp, 56                         ; 37FB _ 48: 83. C4, 38
000037FF        pop     rbx                             ; 37FF _ 5B
00003800        pop     rdi                             ; 3800 _ 5F
00003801        pop     rsi                             ; 3801 _ 5E
00003802        pop     r12                             ; 3802 _ 41: 5C
00003804        pop     r13                             ; 3804 _ 41: 5D
00003806        pop     r14                             ; 3806 _ 41: 5E
00003808        pop     r15                             ; 3808 _ 41: 5F
0000380A        pop     rbp                             ; 380A _ 5D
0000380B        ret                                     ; 380B _ C3
_ConPlatformMatchDevicePaths ENDP

_ProcessLibraryConstructorList PROC
0000380C        push    rbp                             ; 380C _ 55
0000380D        mov     rbp, rsp                        ; 380D _ 48: 89. E5
00003810        push    rsi                             ; 3810 _ 56
00003811        push    rdi                             ; 3811 _ 57
00003812        push    rbx                             ; 3812 _ 53
00003813        sub     rsp, 40                         ; 3813 _ 48: 83. EC, 28
00003817        mov     rsi, rdx                        ; 3817 _ 48: 89. D6
0000381A        mov     rdi, rcx                        ; 381A _ 48: 89. CF
0000381D        call    _UefiBootServicesTableLibConstructor; 381D _ E8, FFFFE87A
00003822        mov     rbx, rax                        ; 3822 _ 48: 89. C3
00003825        call    _DebugAssertEnabled             ; 3825 _ E8, FFFFE5D0
0000382A        test    al, al                          ; 382A _ 84. C0
0000382C        jz      ?_319                           ; 382C _ 74, 48
0000382E        test    rbx, rbx                        ; 382E _ 48: 85. DB
00003831        jns     ?_319                           ; 3831 _ 79, 43
00003833        call    _DebugPrintEnabled              ; 3833 _ E8, FFFFE64C
00003838        test    al, al                          ; 3838 _ 84. C0
0000383A        jz      ?_318                           ; 383A _ 74, 22
0000383C        mov     ecx, 2147483648                 ; 383C _ B9, 80000000
00003841        call    _DebugPrintLevelEnabled         ; 3841 _ E8, FFFFE64C
00003846        test    al, al                          ; 3846 _ 84. C0
00003848        jz      ?_318                           ; 3848 _ 74, 14
0000384A        lea     rdx, ptr [?_369]                ; 384A _ 48: 8D. 15, 00000BC0(rel)
00003851        mov     ecx, 2147483648                 ; 3851 _ B9, 80000000
00003856        mov     r8, rbx                         ; 3856 _ 49: 89. D8
00003859        call    _DebugPrint                     ; 3859 _ E8, FFFFE4FC
?_318:
0000385E        lea     rcx, ptr [?_381]                ; 385E _ 48: 8D. 0D, 00000EBA(rel)
00003865        lea     r8, ptr [?_370]                 ; 3865 _ 4C: 8D. 05, 00000BC6(rel)
0000386C        mov     edx, 225                        ; 386C _ BA, 000000E1
00003871        call    _DebugAssert                    ; 3871 _ E8, FFFFE58F
?_319:
00003876        mov     rcx, rdi                        ; 3876 _ 48: 89. F9
00003879        mov     rdx, rsi                        ; 3879 _ 48: 89. F2
0000387C        call    _UefiRuntimeServicesTableLibConstructor; 387C _ E8, FFFFEA2D
00003881        mov     rbx, rax                        ; 3881 _ 48: 89. C3
00003884        call    _DebugAssertEnabled             ; 3884 _ E8, FFFFE571
00003889        test    al, al                          ; 3889 _ 84. C0
0000388B        jz      ?_321                           ; 388B _ 74, 48
0000388D        test    rbx, rbx                        ; 388D _ 48: 85. DB
00003890        jns     ?_321                           ; 3890 _ 79, 43
00003892        call    _DebugPrintEnabled              ; 3892 _ E8, FFFFE5ED
00003897        test    al, al                          ; 3897 _ 84. C0
00003899        jz      ?_320                           ; 3899 _ 74, 22
0000389B        mov     ecx, 2147483648                 ; 389B _ B9, 80000000
000038A0        call    _DebugPrintLevelEnabled         ; 38A0 _ E8, FFFFE5ED
000038A5        test    al, al                          ; 38A5 _ 84. C0
000038A7        jz      ?_320                           ; 38A7 _ 74, 14
000038A9        lea     rdx, ptr [?_369]                ; 38A9 _ 48: 8D. 15, 00000B61(rel)
000038B0        mov     ecx, 2147483648                 ; 38B0 _ B9, 80000000
000038B5        mov     r8, rbx                         ; 38B5 _ 49: 89. D8
000038B8        call    _DebugPrint                     ; 38B8 _ E8, FFFFE49D
?_320:
000038BD        lea     rcx, ptr [?_381]                ; 38BD _ 48: 8D. 0D, 00000E5B(rel)
000038C4        lea     r8, ptr [?_370]                 ; 38C4 _ 4C: 8D. 05, 00000B67(rel)
000038CB        mov     edx, 228                        ; 38CB _ BA, 000000E4
000038D0        call    _DebugAssert                    ; 38D0 _ E8, FFFFE530
?_321:
000038D5        mov     rcx, rdi                        ; 38D5 _ 48: 89. F9
000038D8        mov     rdx, rsi                        ; 38D8 _ 48: 89. F2
000038DB        call    _UefiLibConstructor             ; 38DB _ E8, FFFFF038
000038E0        mov     rsi, rax                        ; 38E0 _ 48: 89. C6
000038E3        call    _DebugAssertEnabled             ; 38E3 _ E8, FFFFE512
000038E8        test    al, al                          ; 38E8 _ 84. C0
000038EA        jz      ?_323                           ; 38EA _ 74, 50
000038EC        test    rsi, rsi                        ; 38EC _ 48: 85. F6
000038EF        jns     ?_323                           ; 38EF _ 79, 4B
000038F1        call    _DebugPrintEnabled              ; 38F1 _ E8, FFFFE58E
000038F6        test    al, al                          ; 38F6 _ 84. C0
000038F8        jz      ?_322                           ; 38F8 _ 74, 22
000038FA        mov     ecx, 2147483648                 ; 38FA _ B9, 80000000
000038FF        call    _DebugPrintLevelEnabled         ; 38FF _ E8, FFFFE58E
00003904        test    al, al                          ; 3904 _ 84. C0
00003906        jz      ?_322                           ; 3906 _ 74, 14
00003908        lea     rdx, ptr [?_369]                ; 3908 _ 48: 8D. 15, 00000B02(rel)
0000390F        mov     ecx, 2147483648                 ; 390F _ B9, 80000000
00003914        mov     r8, rsi                         ; 3914 _ 49: 89. F0
00003917        call    _DebugPrint                     ; 3917 _ E8, FFFFE43E
?_322:
0000391C        lea     rcx, ptr [?_381]                ; 391C _ 48: 8D. 0D, 00000DFC(rel)
00003923        lea     r8, ptr [?_370]                 ; 3923 _ 4C: 8D. 05, 00000B08(rel)
0000392A        mov     edx, 231                        ; 392A _ BA, 000000E7
0000392F        add     rsp, 40                         ; 392F _ 48: 83. C4, 28
00003933        pop     rbx                             ; 3933 _ 5B
00003934        pop     rdi                             ; 3934 _ 5F
00003935        pop     rsi                             ; 3935 _ 5E
00003936        pop     rbp                             ; 3936 _ 5D
00003937        jmp     _DebugAssert                    ; 3937 _ E9, FFFFE4C9
_ProcessLibraryConstructorList ENDP

?_323   LABEL NEAR
0000393C        add     rsp, 40                         ; 393C _ 48: 83. C4, 28
00003940        pop     rbx                             ; 3940 _ 5B
00003941        pop     rdi                             ; 3941 _ 5F
00003942        pop     rsi                             ; 3942 _ 5E
00003943        pop     rbp                             ; 3943 _ 5D
00003944        ret                                     ; 3944 _ C3

_ProcessLibraryDestructorList PROC
00003945        ret                                     ; 3945 _ C3
_ProcessLibraryDestructorList ENDP

_ProcessModuleEntryPointList PROC
00003946        jmp     _InitializeConPlatform          ; 3946 _ E9, FFFFF701
_ProcessModuleEntryPointList ENDP

_ProcessModuleUnloadList PROC
0000394B        xor     eax, eax                        ; 394B _ 31. C0
0000394D        ret                                     ; 394D _ C3
_ProcessModuleUnloadList ENDP

__TEXT.__text ENDS

__TEXT.__const SEGMENT PARA 'DATA'                      ; section number 2

_mHexStr label byte
        db 30H, 31H, 32H, 33H, 34H, 35H, 36H, 37H       ; 3950 _ 01234567
        db 38H, 39H, 41H, 42H, 43H, 44H, 45H, 46H       ; 3958 _ 89ABCDEF

__gPcd_FixedAtBuild_PcdDebugPrintErrorLevel label dword
        dd 80000000H                                    ; 3960 _ -2147483648 
__gPcd_FixedAtBuild_PcdMaximumAsciiStringLength label dword
        dd 000F4240H                                    ; 3964 _ 1000000 
__gPcd_FixedAtBuild_PcdMaximumUnicodeStringLength label dword
        dd 000F4240H                                    ; 3968 _ 1000000 
__gPcd_FixedAtBuild_PcdDebugPropertyMask label byte
        db 0FH, 00H, 00H, 00H                           ; 396C _ ....

__gPcd_FixedAtBuild_PcdFixedDebugPrintErrorLevel label dword
        dd 0FFFFFFFFH                                   ; 3970 _ -1 
__gPcd_FixedAtBuild_PcdMaximumDevicePathNodeCount label dword
        dd 00000000H, 01000000H                         ; 3974 _ 0 16777216 

__gPcd_FixedAtBuild_PcdComponentNameDisable label byte
        db 00H, 00H                                     ; 3979 _ ..

__gPcd_FixedAtBuild_PcdComponentName2Disable label byte
        db 01H                                          ; 397B _ .
__gUefiDriverRevision label dword
        dd 00000000H                                    ; 397C _ 0 
__gDriverUnloadImageCount label byte
        db 00H                                          ; 3980 _ .
__TEXT.__const ENDS

__TEXT.__cstring SEGMENT BYTE 'DATA'                    ; section number 3

        db 53H, 75H, 63H, 63H, 65H, 73H, 73H, 00H       ; 3981 _ Success.
        db 57H, 61H, 72H, 6EH, 69H, 6EH, 67H, 20H       ; 3989 _ Warning 
        db 55H, 6EH, 6BH, 6EH, 6FH, 77H, 6EH, 20H       ; 3991 _ Unknown 
        db 47H, 6CH, 79H, 70H, 68H, 00H, 57H, 61H       ; 3999 _ Glyph.Wa
        db 72H, 6EH, 69H, 6EH, 67H, 20H, 44H, 65H       ; 39A1 _ rning De
        db 6CH, 65H, 74H, 65H, 20H, 46H, 61H, 69H       ; 39A9 _ lete Fai
        db 6CH, 75H, 72H, 65H, 00H, 57H, 61H, 72H       ; 39B1 _ lure.War
        db 6EH, 69H, 6EH, 67H, 20H, 57H, 72H, 69H       ; 39B9 _ ning Wri
        db 74H, 65H, 20H, 46H, 61H, 69H, 6CH, 75H       ; 39C1 _ te Failu
        db 72H, 65H, 00H, 57H, 61H, 72H, 6EH, 69H       ; 39C9 _ re.Warni
        db 6EH, 67H, 20H, 42H, 75H, 66H, 66H, 65H       ; 39D1 _ ng Buffe
        db 72H, 20H, 54H, 6FH, 6FH, 20H, 53H, 6DH       ; 39D9 _ r Too Sm
        db 61H, 6CH, 6CH, 00H, 57H, 61H, 72H, 6EH       ; 39E1 _ all.Warn
        db 69H, 6EH, 67H, 20H, 53H, 74H, 61H, 6CH       ; 39E9 _ ing Stal
        db 65H, 20H, 44H, 61H, 74H, 61H, 00H, 4CH       ; 39F1 _ e Data.L
        db 6FH, 61H, 64H, 20H, 45H, 72H, 72H, 6FH       ; 39F9 _ oad Erro
        db 72H, 00H, 49H, 6EH, 76H, 61H, 6CH, 69H       ; 3A01 _ r.Invali
        db 64H, 20H, 50H, 61H, 72H, 61H, 6DH, 65H       ; 3A09 _ d Parame
        db 74H, 65H, 72H, 00H, 55H, 6EH, 73H, 75H       ; 3A11 _ ter.Unsu
        db 70H, 70H, 6FH, 72H, 74H, 65H, 64H, 00H       ; 3A19 _ pported.
        db 42H, 61H, 64H, 20H, 42H, 75H, 66H, 66H       ; 3A21 _ Bad Buff
        db 65H, 72H, 20H, 53H, 69H, 7AH, 65H, 00H       ; 3A29 _ er Size.
        db 42H, 75H, 66H, 66H, 65H, 72H, 20H, 54H       ; 3A31 _ Buffer T
        db 6FH, 6FH, 20H, 53H, 6DH, 61H, 6CH, 6CH       ; 3A39 _ oo Small
        db 00H, 4EH, 6FH, 74H, 20H, 52H, 65H, 61H       ; 3A41 _ .Not Rea
        db 64H, 79H, 00H, 44H, 65H, 76H, 69H, 63H       ; 3A49 _ dy.Devic
        db 65H, 20H, 45H, 72H, 72H, 6FH, 72H, 00H       ; 3A51 _ e Error.
        db 57H, 72H, 69H, 74H, 65H, 20H, 50H, 72H       ; 3A59 _ Write Pr
        db 6FH, 74H, 65H, 63H, 74H, 65H, 64H, 00H       ; 3A61 _ otected.
        db 4FH, 75H, 74H, 20H, 6FH, 66H, 20H, 52H       ; 3A69 _ Out of R
        db 65H, 73H, 6FH, 75H, 72H, 63H, 65H, 73H       ; 3A71 _ esources
        db 00H, 56H, 6FH, 6CH, 75H, 6DH, 65H, 20H       ; 3A79 _ .Volume 
        db 43H, 6FH, 72H, 72H, 75H, 70H, 74H, 00H       ; 3A81 _ Corrupt.
        db 56H, 6FH, 6CH, 75H, 6DH, 65H, 20H, 46H       ; 3A89 _ Volume F
        db 75H, 6CH, 6CH, 00H, 4EH, 6FH, 20H, 4DH       ; 3A91 _ ull.No M
        db 65H, 64H, 69H, 61H, 00H, 4DH, 65H, 64H       ; 3A99 _ edia.Med
        db 69H, 61H, 20H, 63H, 68H, 61H, 6EH, 67H       ; 3AA1 _ ia chang
        db 65H, 64H, 00H, 4EH, 6FH, 74H, 20H, 46H       ; 3AA9 _ ed.Not F
        db 6FH, 75H, 6EH, 64H, 00H, 41H, 63H, 63H       ; 3AB1 _ ound.Acc
        db 65H, 73H, 73H, 20H, 44H, 65H, 6EH, 69H       ; 3AB9 _ ess Deni
        db 65H, 64H, 00H, 4EH, 6FH, 20H, 52H, 65H       ; 3AC1 _ ed.No Re
        db 73H, 70H, 6FH, 6EH, 73H, 65H, 00H, 4EH       ; 3AC9 _ sponse.N
        db 6FH, 20H, 6DH, 61H, 70H, 70H, 69H, 6EH       ; 3AD1 _ o mappin
        db 67H, 00H, 54H, 69H, 6DH, 65H, 20H, 6FH       ; 3AD9 _ g.Time o
        db 75H, 74H, 00H, 4EH, 6FH, 74H, 20H, 73H       ; 3AE1 _ ut.Not s
        db 74H, 61H, 72H, 74H, 65H, 64H, 00H, 41H       ; 3AE9 _ tarted.A
        db 6CH, 72H, 65H, 61H, 64H, 79H, 20H, 73H       ; 3AF1 _ lready s
        db 74H, 61H, 72H, 74H, 65H, 64H, 00H, 41H       ; 3AF9 _ tarted.A
        db 62H, 6FH, 72H, 74H, 65H, 64H, 00H, 49H       ; 3B01 _ borted.I
        db 43H, 4DH, 50H, 20H, 45H, 72H, 72H, 6FH       ; 3B09 _ CMP Erro
        db 72H, 00H, 54H, 46H, 54H, 50H, 20H, 45H       ; 3B11 _ r.TFTP E
        db 72H, 72H, 6FH, 72H, 00H, 50H, 72H, 6FH       ; 3B19 _ rror.Pro
        db 74H, 6FH, 63H, 6FH, 6CH, 20H, 45H, 72H       ; 3B21 _ tocol Er
        db 72H, 6FH, 72H, 00H, 49H, 6EH, 63H, 6FH       ; 3B29 _ ror.Inco
        db 6DH, 70H, 61H, 74H, 69H, 62H, 6CH, 65H       ; 3B31 _ mpatible
        db 20H, 56H, 65H, 72H, 73H, 69H, 6FH, 6EH       ; 3B39 _  Version
        db 00H, 53H, 65H, 63H, 75H, 72H, 69H, 74H       ; 3B41 _ .Securit
        db 79H, 20H, 56H, 69H, 6FH, 6CH, 61H, 74H       ; 3B49 _ y Violat
        db 69H, 6FH, 6EH, 00H, 43H, 52H, 43H, 20H       ; 3B51 _ ion.CRC 
        db 45H, 72H, 72H, 6FH, 72H, 00H, 45H, 6EH       ; 3B59 _ Error.En
        db 64H, 20H, 6FH, 66H, 20H, 4DH, 65H, 64H       ; 3B61 _ d of Med
        db 69H, 61H, 00H, 52H, 65H, 73H, 65H, 72H       ; 3B69 _ ia.Reser
        db 76H, 65H, 64H, 20H, 28H, 32H, 39H, 29H       ; 3B71 _ ved (29)
        db 00H, 52H, 65H, 73H, 65H, 72H, 76H, 65H       ; 3B79 _ .Reserve
        db 64H, 20H, 28H, 33H, 30H, 29H, 00H, 45H       ; 3B81 _ d (30).E
        db 6EH, 64H, 20H, 6FH, 66H, 20H, 46H, 69H       ; 3B89 _ nd of Fi
        db 6CH, 65H, 00H, 49H, 6EH, 76H, 61H, 6CH       ; 3B91 _ le.Inval
        db 69H, 64H, 20H, 4CH, 61H, 6EH, 67H, 75H       ; 3B99 _ id Langu
        db 61H, 67H, 65H, 00H, 43H, 6FH, 6DH, 70H       ; 3BA1 _ age.Comp
        db 72H, 6FH, 6DH, 69H, 73H, 65H, 64H, 20H       ; 3BA9 _ romised 
        db 44H, 61H, 74H, 61H, 00H                      ; 3BB1 _ Data.
?_324   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 3BB6 _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 3BBE _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 3BC6 _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 3BCE _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 3BD6 _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 3BDE _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 50H, 6BH       ; 3BE6 _ er/MdePk
        db 67H, 2FH, 4CH, 69H, 62H, 72H, 61H, 72H       ; 3BEE _ g/Librar
        db 79H, 2FH, 42H, 61H, 73H, 65H, 50H, 72H       ; 3BF6 _ y/BasePr
        db 69H, 6EH, 74H, 4CH, 69H, 62H, 2FH, 50H       ; 3BFE _ intLib/P
        db 72H, 69H, 6EH, 74H, 4CH, 69H, 62H, 49H       ; 3C06 _ rintLibI
        db 6EH, 74H, 65H, 72H, 6EH, 61H, 6CH, 2EH       ; 3C0E _ nternal.
        db 63H, 00H                                     ; 3C16 _ c.

?_325   label byte
        db 42H, 75H, 66H, 66H, 65H, 72H, 20H, 21H       ; 3C18 _ Buffer !
        db 3DH, 20H, 28H, 28H, 76H, 6FH, 69H, 64H       ; 3C20 _ = ((void
        db 20H, 2AH, 29H, 20H, 30H, 29H, 00H            ; 3C28 _  *) 0).
?_326   label byte
        db 53H, 74H, 72H, 53H, 69H, 7AH, 65H, 20H       ; 3C2F _ StrSize 
        db 28H, 28H, 43H, 48H, 41H, 52H, 31H, 36H       ; 3C37 _ ((CHAR16
        db 20H, 2AH, 29H, 20H, 46H, 6FH, 72H, 6DH       ; 3C3F _  *) Form
        db 61H, 74H, 29H, 20H, 21H, 3DH, 20H, 30H       ; 3C47 _ at) != 0
        db 00H                                          ; 3C4F _ .
?_327   label byte
        db 41H, 73H, 63H, 69H, 69H, 53H, 74H, 72H       ; 3C50 _ AsciiStr
        db 53H, 69H, 7AH, 65H, 20H, 28H, 46H, 6FH       ; 3C58 _ Size (Fo
        db 72H, 6DH, 61H, 74H, 29H, 20H, 21H, 3DH       ; 3C60 _ rmat) !=
        db 20H, 30H, 00H                                ; 3C68 _  0.
?_328   label byte
        db 3CH, 6EH, 75H, 6CH, 6CH, 20H, 73H, 74H       ; 3C6B _ <null st
        db 72H, 69H, 6EH, 67H, 3EH, 00H                 ; 3C73 _ ring>.

?_329   label byte
        db 3CH, 6EH, 75H, 6CH, 6CH, 20H, 67H, 75H       ; 3C79 _ <null gu
        db 69H, 64H, 3EH, 00H                           ; 3C81 _ id>.

?_330   label byte
        db 25H, 30H, 38H, 78H, 2DH, 25H, 30H, 34H       ; 3C85 _ %08x-%04
        db 78H, 2DH, 25H, 30H, 34H, 78H, 2DH, 25H       ; 3C8D _ x-%04x-%
        db 30H, 32H, 78H, 25H, 30H, 32H, 78H, 2DH       ; 3C95 _ 02x%02x-
        db 25H, 30H, 32H, 78H, 25H, 30H, 32H, 78H       ; 3C9D _ %02x%02x
        db 25H, 30H, 32H, 78H, 25H, 30H, 32H, 78H       ; 3CA5 _ %02x%02x
        db 25H, 30H, 32H, 78H, 25H, 30H, 32H, 78H       ; 3CAD _ %02x%02x
        db 00H                                          ; 3CB5 _ .
?_331   label byte
        db 3CH, 6EH, 75H, 6CH, 6CH, 20H, 74H, 69H       ; 3CB6 _ <null ti
        db 6DH, 65H, 3EH, 00H                           ; 3CBE _ me>.

?_332   label byte
        db 25H, 30H, 32H, 64H, 2FH, 25H, 30H, 32H       ; 3CC2 _ %02d/%02
        db 64H, 2FH, 25H, 30H, 34H, 64H, 20H, 20H       ; 3CCA _ d/%04d  
        db 25H, 30H, 32H, 64H, 3AH, 25H, 30H, 32H       ; 3CD2 _ %02d:%02
        db 64H, 00H                                     ; 3CDA _ d.

?_333   label byte
        db 25H, 30H, 38H, 58H, 00H                      ; 3CDC _ %08X.
?_334   label byte
        db 0DH, 0AH, 00H                                ; 3CE1 _ ...
?_335   label byte
        db 0DH, 00H                                     ; 3CE4 _ ..

?_336   label byte
        db 28H, 28H, 28H, 46H, 6CH, 61H, 67H, 73H       ; 3CE6 _ (((Flags
        db 20H, 26H, 20H, 30H, 78H, 30H, 30H, 30H       ; 3CEE _  & 0x000
        db 30H, 30H, 30H, 34H, 30H, 29H, 20H, 3DH       ; 3CF6 _ 00040) =
        db 3DH, 20H, 30H, 29H, 29H, 20H, 7CH, 7CH       ; 3CFE _ = 0)) ||
        db 20H, 28H, 53H, 74H, 72H, 53H, 69H, 7AH       ; 3D06 _  (StrSiz
        db 65H, 20H, 28H, 28H, 43H, 48H, 41H, 52H       ; 3D0E _ e ((CHAR
        db 31H, 36H, 20H, 2AH, 29H, 20H, 4FH, 72H       ; 3D16 _ 16 *) Or
        db 69H, 67H, 69H, 6EH, 61H, 6CH, 42H, 75H       ; 3D1E _ iginalBu
        db 66H, 66H, 65H, 72H, 29H, 20H, 21H, 3DH       ; 3D26 _ ffer) !=
        db 20H, 30H, 29H, 00H                           ; 3D2E _  0).

?_337   label byte
        db 28H, 28H, 28H, 46H, 6CH, 61H, 67H, 73H       ; 3D32 _ (((Flags
        db 20H, 26H, 20H, 30H, 78H, 30H, 30H, 30H       ; 3D3A _  & 0x000
        db 30H, 30H, 30H, 34H, 30H, 29H, 20H, 21H       ; 3D42 _ 00040) !
        db 3DH, 20H, 30H, 29H, 29H, 20H, 7CH, 7CH       ; 3D4A _ = 0)) ||
        db 20H, 28H, 41H, 73H, 63H, 69H, 69H, 53H       ; 3D52 _  (AsciiS
        db 74H, 72H, 53H, 69H, 7AH, 65H, 20H, 28H       ; 3D5A _ trSize (
        db 4FH, 72H, 69H, 67H, 69H, 6EH, 61H, 6CH       ; 3D62 _ Original
        db 42H, 75H, 66H, 66H, 65H, 72H, 29H, 20H       ; 3D6A _ Buffer) 
        db 21H, 3DH, 20H, 30H, 29H, 00H                 ; 3D72 _ != 0).

?_338   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 3D78 _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 3D80 _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 3D88 _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 3D90 _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 3D98 _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 3DA0 _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 50H, 6BH       ; 3DA8 _ er/MdePk
        db 67H, 2FH, 4CH, 69H, 62H, 72H, 61H, 72H       ; 3DB0 _ g/Librar
        db 79H, 2FH, 42H, 61H, 73H, 65H, 50H, 72H       ; 3DB8 _ y/BasePr
        db 69H, 6EH, 74H, 4CH, 69H, 62H, 2FH, 50H       ; 3DC0 _ intLib/P
        db 72H, 69H, 6EH, 74H, 4CH, 69H, 62H, 2EH       ; 3DC8 _ rintLib.
        db 63H, 00H                                     ; 3DD0 _ c.

?_339   label byte
        db 28H, 28H, 28H, 55H, 49H, 4EH, 54H, 4EH       ; 3DD2 _ (((UINTN
        db 29H, 20H, 28H, 53H, 74H, 61H, 72H, 74H       ; 3DDA _ ) (Start
        db 4FH, 66H, 42H, 75H, 66H, 66H, 65H, 72H       ; 3DE2 _ OfBuffer
        db 29H, 29H, 20H, 26H, 20H, 30H, 78H, 30H       ; 3DEA _ )) & 0x0
        db 31H, 29H, 20H, 3DH, 3DH, 20H, 30H, 00H       ; 3DF2 _ 1) == 0.

?_340   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 3DFA _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 3E02 _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 3E0A _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 3E12 _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 3E1A _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 3E22 _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 50H, 6BH       ; 3E2A _ er/MdePk
        db 67H, 2FH, 4CH, 69H, 62H, 72H, 61H, 72H       ; 3E32 _ g/Librar
        db 79H, 2FH, 42H, 61H, 73H, 65H, 4CH, 69H       ; 3E3A _ y/BaseLi
        db 62H, 2FH, 53H, 65H, 74H, 4AH, 75H, 6DH       ; 3E42 _ b/SetJum
        db 70H, 2EH, 63H, 00H                           ; 3E4A _ p.c.

?_341   label byte
        db 4AH, 75H, 6DH, 70H, 42H, 75H, 66H, 66H       ; 3E4E _ JumpBuff
        db 65H, 72H, 20H, 21H, 3DH, 20H, 28H, 28H       ; 3E56 _ er != ((
        db 76H, 6FH, 69H, 64H, 20H, 2AH, 29H, 20H       ; 3E5E _ void *) 
        db 30H, 29H, 00H                                ; 3E66 _ 0).
?_342   label byte
        db 28H, 28H, 55H, 49H, 4EH, 54H, 4EH, 29H       ; 3E69 _ ((UINTN)
        db 4AH, 75H, 6DH, 70H, 42H, 75H, 66H, 66H       ; 3E71 _ JumpBuff
        db 65H, 72H, 20H, 26H, 20H, 28H, 38H, 20H       ; 3E79 _ er & (8 
        db 2DH, 20H, 31H, 29H, 29H, 20H, 3DH, 3DH       ; 3E81 _ - 1)) ==
        db 20H, 30H, 00H                                ; 3E89 _  0.
?_343   label byte
        db 44H, 69H, 76H, 69H, 73H, 6FH, 72H, 20H       ; 3E8C _ Divisor 
        db 21H, 3DH, 20H, 30H, 00H                      ; 3E94 _ != 0.
?_344   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 3E99 _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 3EA1 _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 3EA9 _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 3EB1 _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 3EB9 _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 3EC1 _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 50H, 6BH       ; 3EC9 _ er/MdePk
        db 67H, 2FH, 4CH, 69H, 62H, 72H, 61H, 72H       ; 3ED1 _ g/Librar
        db 79H, 2FH, 42H, 61H, 73H, 65H, 4CH, 69H       ; 3ED9 _ y/BaseLi
        db 62H, 2FH, 44H, 69H, 76H, 55H, 36H, 34H       ; 3EE1 _ b/DivU64
        db 78H, 33H, 32H, 52H, 65H, 6DH, 61H, 69H       ; 3EE9 _ x32Remai
        db 6EH, 64H, 65H, 72H, 2EH, 63H, 00H            ; 3EF1 _ nder.c.
?_345   label byte
        db 4EH, 6FH, 64H, 65H, 20H, 21H, 3DH, 20H       ; 3EF8 _ Node != 
        db 28H, 28H, 76H, 6FH, 69H, 64H, 20H, 2AH       ; 3F00 _ ((void *
        db 29H, 20H, 30H, 29H, 00H                      ; 3F08 _ ) 0).
?_346   label byte
        db 28H, 28H, 55H, 49H, 4EH, 54H, 4EH, 29H       ; 3F0D _ ((UINTN)
        db 20H, 53H, 74H, 72H, 69H, 6EH, 67H, 20H       ; 3F15 _  String 
        db 26H, 20H, 30H, 78H, 30H, 30H, 30H, 30H       ; 3F1D _ & 0x0000
        db 30H, 30H, 30H, 31H, 29H, 20H, 3DH, 3DH       ; 3F25 _ 0001) ==
        db 20H, 30H, 00H                                ; 3F2D _  0.
?_347   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 3F30 _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 3F38 _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 3F40 _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 3F48 _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 3F50 _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 3F58 _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 50H, 6BH       ; 3F60 _ er/MdePk
        db 67H, 2FH, 4CH, 69H, 62H, 72H, 61H, 72H       ; 3F68 _ g/Librar
        db 79H, 2FH, 42H, 61H, 73H, 65H, 4CH, 69H       ; 3F70 _ y/BaseLi
        db 62H, 2FH, 53H, 74H, 72H, 69H, 6EH, 67H       ; 3F78 _ b/String
        db 2EH, 63H, 00H                                ; 3F80 _ .c.
?_348   label byte
        db 53H, 74H, 72H, 69H, 6EH, 67H, 20H, 21H       ; 3F83 _ String !
        db 3DH, 20H, 28H, 28H, 76H, 6FH, 69H, 64H       ; 3F8B _ = ((void
        db 20H, 2AH, 29H, 20H, 30H, 29H, 00H            ; 3F93 _  *) 0).
?_349   label byte
        db 4CH, 65H, 6EH, 67H, 74H, 68H, 20H, 3CH       ; 3F9A _ Length <
        db 20H, 5FH, 67H, 50H, 63H, 64H, 5FH, 46H       ; 3FA2 _  _gPcd_F
        db 69H, 78H, 65H, 64H, 41H, 74H, 42H, 75H       ; 3FAA _ ixedAtBu
        db 69H, 6CH, 64H, 5FH, 50H, 63H, 64H, 4DH       ; 3FB2 _ ild_PcdM
        db 61H, 78H, 69H, 6DH, 75H, 6DH, 55H, 6EH       ; 3FBA _ aximumUn
        db 69H, 63H, 6FH, 64H, 65H, 53H, 74H, 72H       ; 3FC2 _ icodeStr
        db 69H, 6EH, 67H, 4CH, 65H, 6EH, 67H, 74H       ; 3FCA _ ingLengt
        db 68H, 00H                                     ; 3FD2 _ h.

?_350   label byte
        db 4CH, 65H, 6EH, 67H, 74H, 68H, 20H, 3CH       ; 3FD4 _ Length <
        db 3DH, 20H, 5FH, 67H, 50H, 63H, 64H, 5FH       ; 3FDC _ = _gPcd_
        db 46H, 69H, 78H, 65H, 64H, 41H, 74H, 42H       ; 3FE4 _ FixedAtB
        db 75H, 69H, 6CH, 64H, 5FH, 50H, 63H, 64H       ; 3FEC _ uild_Pcd
        db 4DH, 61H, 78H, 69H, 6DH, 75H, 6DH, 41H       ; 3FF4 _ MaximumA
        db 73H, 63H, 69H, 69H, 53H, 74H, 72H, 69H       ; 3FFC _ sciiStri
        db 6EH, 67H, 4CH, 65H, 6EH, 67H, 74H, 68H       ; 4004 _ ngLength
        db 00H                                          ; 400C _ .
?_351   label byte
        db 4CH, 65H, 6EH, 67H, 74H, 68H, 20H, 3CH       ; 400D _ Length <
        db 20H, 5FH, 67H, 50H, 63H, 64H, 5FH, 46H       ; 4015 _  _gPcd_F
        db 69H, 78H, 65H, 64H, 41H, 74H, 42H, 75H       ; 401D _ ixedAtBu
        db 69H, 6CH, 64H, 5FH, 50H, 63H, 64H, 4DH       ; 4025 _ ild_PcdM
        db 61H, 78H, 69H, 6DH, 75H, 6DH, 41H, 73H       ; 402D _ aximumAs
        db 63H, 69H, 69H, 53H, 74H, 72H, 69H, 6EH       ; 4035 _ ciiStrin
        db 67H, 4CH, 65H, 6EH, 67H, 74H, 68H, 00H       ; 403D _ gLength.

?_352   label byte
        db 41H, 73H, 63H, 69H, 69H, 53H, 74H, 72H       ; 4045 _ AsciiStr
        db 53H, 69H, 7AH, 65H, 20H, 28H, 46H, 69H       ; 404D _ Size (Fi
        db 72H, 73H, 74H, 53H, 74H, 72H, 69H, 6EH       ; 4055 _ rstStrin
        db 67H, 29H, 00H                                ; 405D _ g).
?_353   label byte
        db 41H, 73H, 63H, 69H, 69H, 53H, 74H, 72H       ; 4060 _ AsciiStr
        db 53H, 69H, 7AH, 65H, 20H, 28H, 53H, 65H       ; 4068 _ Size (Se
        db 63H, 6FH, 6EH, 64H, 53H, 74H, 72H, 69H       ; 4070 _ condStri
        db 6EH, 67H, 29H, 00H                           ; 4078 _ ng).

?_354   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 407C _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 4084 _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 408C _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 4094 _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 409C _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 40A4 _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 50H, 6BH       ; 40AC _ er/MdePk
        db 67H, 2FH, 4CH, 69H, 62H, 72H, 61H, 72H       ; 40B4 _ g/Librar
        db 79H, 2FH, 42H, 61H, 73H, 65H, 4CH, 69H       ; 40BC _ y/BaseLi
        db 62H, 2FH, 55H, 6EH, 61H, 6CH, 69H, 67H       ; 40C4 _ b/Unalig
        db 6EH, 65H, 64H, 2EH, 63H, 00H                 ; 40CC _ ned.c.

?_355   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 40D2 _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 40DA _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 40E2 _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 40EA _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 40F2 _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 40FA _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 50H, 6BH       ; 4102 _ er/MdePk
        db 67H, 2FH, 4CH, 69H, 62H, 72H, 61H, 72H       ; 410A _ g/Librar
        db 79H, 2FH, 55H, 65H, 66H, 69H, 44H, 65H       ; 4112 _ y/UefiDe
        db 62H, 75H, 67H, 4CH, 69H, 62H, 43H, 6FH       ; 411A _ bugLibCo
        db 6EH, 4FH, 75H, 74H, 2FH, 44H, 65H, 62H       ; 4122 _ nOut/Deb
        db 75H, 67H, 4CH, 69H, 62H, 2EH, 63H, 00H       ; 412A _ ugLib.c.

?_356   label byte
        db 46H, 6FH, 72H, 6DH, 61H, 74H, 20H, 21H       ; 4132 _ Format !
        db 3DH, 20H, 28H, 28H, 76H, 6FH, 69H, 64H       ; 413A _ = ((void
        db 20H, 2AH, 29H, 20H, 30H, 29H, 00H            ; 4142 _  *) 0).
?_357   label byte
        db 41H, 53H, 53H, 45H, 52H, 54H, 20H, 5BH       ; 4149 _ ASSERT [
        db 25H, 61H, 5DH, 20H, 25H, 61H, 28H, 25H       ; 4151 _ %a] %a(%
        db 64H, 29H, 3AH, 20H, 25H, 61H, 0AH, 00H       ; 4159 _ d): %a..

?_358   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 4161 _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 4169 _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 4171 _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 4179 _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 4181 _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 4189 _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 50H, 6BH       ; 4191 _ er/MdePk
        db 67H, 2FH, 4CH, 69H, 62H, 72H, 61H, 72H       ; 4199 _ g/Librar
        db 79H, 2FH, 42H, 61H, 73H, 65H, 4DH, 65H       ; 41A1 _ y/BaseMe
        db 6DH, 6FH, 72H, 79H, 4CH, 69H, 62H, 2FH       ; 41A9 _ moryLib/
        db 43H, 6FH, 6DH, 70H, 61H, 72H, 65H, 4DH       ; 41B1 _ CompareM
        db 65H, 6DH, 57H, 72H, 61H, 70H, 70H, 65H       ; 41B9 _ emWrappe
        db 72H, 2EH, 63H, 00H                           ; 41C1 _ r.c.

?_359   label byte
        db 44H, 65H, 73H, 74H, 69H, 6EH, 61H, 74H       ; 41C5 _ Destinat
        db 69H, 6FH, 6EH, 42H, 75H, 66H, 66H, 65H       ; 41CD _ ionBuffe
        db 72H, 20H, 21H, 3DH, 20H, 28H, 28H, 76H       ; 41D5 _ r != ((v
        db 6FH, 69H, 64H, 20H, 2AH, 29H, 20H, 30H       ; 41DD _ oid *) 0
        db 29H, 00H                                     ; 41E5 _ ).

?_360   label byte
        db 53H, 6FH, 75H, 72H, 63H, 65H, 42H, 75H       ; 41E7 _ SourceBu
        db 66H, 66H, 65H, 72H, 20H, 21H, 3DH, 20H       ; 41EF _ ffer != 
        db 28H, 28H, 76H, 6FH, 69H, 64H, 20H, 2AH       ; 41F7 _ ((void *
        db 29H, 20H, 30H, 29H, 00H                      ; 41FF _ ) 0).
?_361   label byte
        db 28H, 4CH, 65H, 6EH, 67H, 74H, 68H, 20H       ; 4204 _ (Length 
        db 2DH, 20H, 31H, 29H, 20H, 3CH, 3DH, 20H       ; 420C _ - 1) <= 
        db 28H, 30H, 78H, 46H, 46H, 46H, 46H, 46H       ; 4214 _ (0xFFFFF
        db 46H, 46H, 46H, 46H, 46H, 46H, 46H, 46H       ; 421C _ FFFFFFFF
        db 46H, 46H, 46H, 55H, 4CH, 4CH, 20H, 2DH       ; 4224 _ FFFULL -
        db 20H, 28H, 55H, 49H, 4EH, 54H, 4EH, 29H       ; 422C _  (UINTN)
        db 44H, 65H, 73H, 74H, 69H, 6EH, 61H, 74H       ; 4234 _ Destinat
        db 69H, 6FH, 6EH, 42H, 75H, 66H, 66H, 65H       ; 423C _ ionBuffe
        db 72H, 29H, 00H                                ; 4244 _ r).
?_362   label byte
        db 28H, 4CH, 65H, 6EH, 67H, 74H, 68H, 20H       ; 4247 _ (Length 
        db 2DH, 20H, 31H, 29H, 20H, 3CH, 3DH, 20H       ; 424F _ - 1) <= 
        db 28H, 30H, 78H, 46H, 46H, 46H, 46H, 46H       ; 4257 _ (0xFFFFF
        db 46H, 46H, 46H, 46H, 46H, 46H, 46H, 46H       ; 425F _ FFFFFFFF
        db 46H, 46H, 46H, 55H, 4CH, 4CH, 20H, 2DH       ; 4267 _ FFFULL -
        db 20H, 28H, 55H, 49H, 4EH, 54H, 4EH, 29H       ; 426F _  (UINTN)
        db 53H, 6FH, 75H, 72H, 63H, 65H, 42H, 75H       ; 4277 _ SourceBu
        db 66H, 66H, 65H, 72H, 29H, 00H                 ; 427F _ ffer).

?_363   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 4285 _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 428D _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 4295 _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 429D _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 42A5 _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 42AD _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 50H, 6BH       ; 42B5 _ er/MdePk
        db 67H, 2FH, 4CH, 69H, 62H, 72H, 61H, 72H       ; 42BD _ g/Librar
        db 79H, 2FH, 42H, 61H, 73H, 65H, 4DH, 65H       ; 42C5 _ y/BaseMe
        db 6DH, 6FH, 72H, 79H, 4CH, 69H, 62H, 2FH       ; 42CD _ moryLib/
        db 43H, 6FH, 70H, 79H, 4DH, 65H, 6DH, 57H       ; 42D5 _ CopyMemW
        db 72H, 61H, 70H, 70H, 65H, 72H, 2EH, 63H       ; 42DD _ rapper.c
        db 00H                                          ; 42E5 _ .
?_364   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 42E6 _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 42EE _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 42F6 _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 42FE _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 4306 _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 430E _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 50H, 6BH       ; 4316 _ er/MdePk
        db 67H, 2FH, 4CH, 69H, 62H, 72H, 61H, 72H       ; 431E _ g/Librar
        db 79H, 2FH, 55H, 65H, 66H, 69H, 42H, 6FH       ; 4326 _ y/UefiBo
        db 6FH, 74H, 53H, 65H, 72H, 76H, 69H, 63H       ; 432E _ otServic
        db 65H, 73H, 54H, 61H, 62H, 6CH, 65H, 4CH       ; 4336 _ esTableL
        db 69H, 62H, 2FH, 55H, 65H, 66H, 69H, 42H       ; 433E _ ib/UefiB
        db 6FH, 6FH, 74H, 53H, 65H, 72H, 76H, 69H       ; 4346 _ ootServi
        db 63H, 65H, 73H, 54H, 61H, 62H, 6CH, 65H       ; 434E _ cesTable
        db 4CH, 69H, 62H, 2EH, 63H, 00H                 ; 4356 _ Lib.c.

?_365   label byte
        db 67H, 49H, 6DH, 61H, 67H, 65H, 48H, 61H       ; 435C _ gImageHa
        db 6EH, 64H, 6CH, 65H, 20H, 21H, 3DH, 20H       ; 4364 _ ndle != 
        db 28H, 28H, 76H, 6FH, 69H, 64H, 20H, 2AH       ; 436C _ ((void *
        db 29H, 20H, 30H, 29H, 00H                      ; 4374 _ ) 0).
?_366   label byte
        db 67H, 53H, 54H, 20H, 21H, 3DH, 20H, 28H       ; 4379 _ gST != (
        db 28H, 76H, 6FH, 69H, 64H, 20H, 2AH, 29H       ; 4381 _ (void *)
        db 20H, 30H, 29H, 00H                           ; 4389 _  0).

?_367   label byte
        db 67H, 42H, 53H, 20H, 21H, 3DH, 20H, 28H       ; 438D _ gBS != (
        db 28H, 76H, 6FH, 69H, 64H, 20H, 2AH, 29H       ; 4395 _ (void *)
        db 20H, 30H, 29H, 00H                           ; 439D _  0).

?_368   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 43A1 _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 43A9 _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 43B1 _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 43B9 _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 43C1 _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 43C9 _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 50H, 6BH       ; 43D1 _ er/MdePk
        db 67H, 2FH, 4CH, 69H, 62H, 72H, 61H, 72H       ; 43D9 _ g/Librar
        db 79H, 2FH, 55H, 65H, 66H, 69H, 4DH, 65H       ; 43E1 _ y/UefiMe
        db 6DH, 6FH, 72H, 79H, 41H, 6CH, 6CH, 6FH       ; 43E9 _ moryAllo
        db 63H, 61H, 74H, 69H, 6FH, 6EH, 4CH, 69H       ; 43F1 _ cationLi
        db 62H, 2FH, 4DH, 65H, 6DH, 6FH, 72H, 79H       ; 43F9 _ b/Memory
        db 41H, 6CH, 6CH, 6FH, 63H, 61H, 74H, 69H       ; 4401 _ Allocati
        db 6FH, 6EH, 4CH, 69H, 62H, 2EH, 63H, 00H       ; 4409 _ onLib.c.

?_369   label byte
        db 0AH, 41H, 53H, 53H, 45H, 52H, 54H, 5FH       ; 4411 _ .ASSERT_
        db 45H, 46H, 49H, 5FH, 45H, 52H, 52H, 4FH       ; 4419 _ EFI_ERRO
        db 52H, 20H, 28H, 53H, 74H, 61H, 74H, 75H       ; 4421 _ R (Statu
        db 73H, 20H, 3DH, 20H, 25H, 72H, 29H, 0AH       ; 4429 _ s = %r).
        db 00H                                          ; 4431 _ .
?_370   label byte
        db 21H, 45H, 46H, 49H, 5FH, 45H, 52H, 52H       ; 4432 _ !EFI_ERR
        db 4FH, 52H, 20H, 28H, 53H, 74H, 61H, 74H       ; 443A _ OR (Stat
        db 75H, 73H, 29H, 00H                           ; 4442 _ us).

?_371   label byte
        db 41H, 6CH, 6CH, 6FH, 63H, 61H, 74H, 69H       ; 4446 _ Allocati
        db 6FH, 6EH, 53H, 69H, 7AH, 65H, 20H, 3CH       ; 444E _ onSize <
        db 3DH, 20H, 28H, 30H, 78H, 46H, 46H, 46H       ; 4456 _ = (0xFFF
        db 46H, 46H, 46H, 46H, 46H, 46H, 46H, 46H       ; 445E _ FFFFFFFF
        db 46H, 46H, 46H, 46H, 46H, 55H, 4CH, 4CH       ; 4466 _ FFFFFULL
        db 20H, 2DH, 20H, 28H, 55H, 49H, 4EH, 54H       ; 446E _  - (UINT
        db 4EH, 29H, 20H, 42H, 75H, 66H, 66H, 65H       ; 4476 _ N) Buffe
        db 72H, 20H, 2BH, 20H, 31H, 29H, 00H            ; 447E _ r + 1).
?_372   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 4485 _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 448D _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 4495 _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 449D _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 44A5 _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 44AD _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 50H, 6BH       ; 44B5 _ er/MdePk
        db 67H, 2FH, 4CH, 69H, 62H, 72H, 61H, 72H       ; 44BD _ g/Librar
        db 79H, 2FH, 55H, 65H, 66H, 69H, 52H, 75H       ; 44C5 _ y/UefiRu
        db 6EH, 74H, 69H, 6DH, 65H, 53H, 65H, 72H       ; 44CD _ ntimeSer
        db 76H, 69H, 63H, 65H, 73H, 54H, 61H, 62H       ; 44D5 _ vicesTab
        db 6CH, 65H, 4CH, 69H, 62H, 2FH, 55H, 65H       ; 44DD _ leLib/Ue
        db 66H, 69H, 52H, 75H, 6EH, 74H, 69H, 6DH       ; 44E5 _ fiRuntim
        db 65H, 53H, 65H, 72H, 76H, 69H, 63H, 65H       ; 44ED _ eService
        db 73H, 54H, 61H, 62H, 6CH, 65H, 4CH, 69H       ; 44F5 _ sTableLi
        db 62H, 2EH, 63H, 00H                           ; 44FD _ b.c.

?_373   label byte
        db 67H, 52H, 54H, 20H, 21H, 3DH, 20H, 28H       ; 4501 _ gRT != (
        db 28H, 76H, 6FH, 69H, 64H, 20H, 2AH, 29H       ; 4509 _ (void *)
        db 20H, 30H, 29H, 00H                           ; 4511 _  0).

?_374   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 4515 _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 451D _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 4525 _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 452D _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 4535 _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 453D _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 50H, 6BH       ; 4545 _ er/MdePk
        db 67H, 2FH, 4CH, 69H, 62H, 72H, 61H, 72H       ; 454D _ g/Librar
        db 79H, 2FH, 55H, 65H, 66H, 69H, 44H, 65H       ; 4555 _ y/UefiDe
        db 76H, 69H, 63H, 65H, 50H, 61H, 74H, 68H       ; 455D _ vicePath
        db 4CH, 69H, 62H, 2FH, 44H, 65H, 76H, 69H       ; 4565 _ Lib/Devi
        db 63H, 65H, 50H, 61H, 74H, 68H, 55H, 74H       ; 456D _ cePathUt
        db 69H, 6CH, 69H, 74H, 69H, 65H, 73H, 2EH       ; 4575 _ ilities.
        db 63H, 00H                                     ; 457D _ c.

?_375   label byte
        db 44H, 65H, 76H, 69H, 63H, 65H, 50H, 61H       ; 457F _ DevicePa
        db 74H, 68H, 20H, 21H, 3DH, 20H, 28H, 28H       ; 4587 _ th != ((
        db 76H, 6FH, 69H, 64H, 20H, 2AH, 29H, 20H       ; 458F _ void *) 
        db 30H, 29H, 00H                                ; 4597 _ 0).
?_376   label byte
        db 53H, 69H, 7AH, 65H, 20H, 21H, 3DH, 20H       ; 459A _ Size != 
        db 28H, 28H, 76H, 6FH, 69H, 64H, 20H, 2AH       ; 45A2 _ ((void *
        db 29H, 20H, 30H, 29H, 00H                      ; 45AA _ ) 0).
?_377   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 45AF _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 45B7 _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 45BF _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 45C7 _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 45CF _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 45D7 _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 50H, 6BH       ; 45DF _ er/MdePk
        db 67H, 2FH, 4CH, 69H, 62H, 72H, 61H, 72H       ; 45E7 _ g/Librar
        db 79H, 2FH, 55H, 65H, 66H, 69H, 4CH, 69H       ; 45EF _ y/UefiLi
        db 62H, 2FH, 55H, 65H, 66H, 69H, 44H, 72H       ; 45F7 _ b/UefiDr
        db 69H, 76H, 65H, 72H, 4DH, 6FH, 64H, 65H       ; 45FF _ iverMode
        db 6CH, 2EH, 63H, 00H                           ; 4607 _ l.c.

?_378   label byte
        db 44H, 72H, 69H, 76H, 65H, 72H, 42H, 69H       ; 460B _ DriverBi
        db 6EH, 64H, 69H, 6EH, 67H, 20H, 21H, 3DH       ; 4613 _ nding !=
        db 20H, 28H, 28H, 76H, 6FH, 69H, 64H, 20H       ; 461B _  ((void 
        db 2AH, 29H, 20H, 30H, 29H, 00H                 ; 4623 _ *) 0).

?_379   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 4629 _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 4631 _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 4639 _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 4641 _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 4649 _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 4651 _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 50H, 6BH       ; 4659 _ er/MdePk
        db 67H, 2FH, 4CH, 69H, 62H, 72H, 61H, 72H       ; 4661 _ g/Librar
        db 79H, 2FH, 55H, 65H, 66H, 69H, 44H, 72H       ; 4669 _ y/UefiDr
        db 69H, 76H, 65H, 72H, 45H, 6EH, 74H, 72H       ; 4671 _ iverEntr
        db 79H, 50H, 6FH, 69H, 6EH, 74H, 2FH, 44H       ; 4679 _ yPoint/D
        db 72H, 69H, 76H, 65H, 72H, 45H, 6EH, 74H       ; 4681 _ riverEnt
        db 72H, 79H, 50H, 6FH, 69H, 6EH, 74H, 2EH       ; 4689 _ ryPoint.
        db 63H, 00H, 65H, 6EH, 67H, 00H, 65H, 6EH       ; 4691 _ c.eng.en
        db 00H, 65H, 6EH, 67H, 3BH, 65H, 6EH, 00H       ; 4699 _ .eng;en.

?_380   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 46A1 _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 46A9 _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 46B1 _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 46B9 _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 46C1 _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 46C9 _ dk2-mast
        db 65H, 72H, 2FH, 4DH, 64H, 65H, 4DH, 6FH       ; 46D1 _ er/MdeMo
        db 64H, 75H, 6CH, 65H, 50H, 6BH, 67H, 2FH       ; 46D9 _ dulePkg/
        db 55H, 6EH, 69H, 76H, 65H, 72H, 73H, 61H       ; 46E1 _ Universa
        db 6CH, 2FH, 43H, 6FH, 6EH, 73H, 6FH, 6CH       ; 46E9 _ l/Consol
        db 65H, 2FH, 43H, 6FH, 6EH, 50H, 6CH, 61H       ; 46F1 _ e/ConPla
        db 74H, 66H, 6FH, 72H, 6DH, 44H, 78H, 65H       ; 46F9 _ tformDxe
        db 2FH, 43H, 6FH, 6EH, 50H, 6CH, 61H, 74H       ; 4701 _ /ConPlat
        db 66H, 6FH, 72H, 6DH, 2EH, 63H, 00H, 43H       ; 4709 _ form.c.C
        db 6FH, 6EH, 50H, 6CH, 61H, 74H, 66H, 6FH       ; 4711 _ onPlatfo
        db 72H, 6DH, 44H, 78H, 65H, 00H                 ; 4719 _ rmDxe.

?_381   label byte
        db 2FH, 55H, 73H, 65H, 72H, 73H, 2FH, 6AH       ; 471F _ /Users/j
        db 6AH, 68H, 2FH, 44H, 65H, 73H, 6BH, 74H       ; 4727 _ jh/Deskt
        db 6FH, 70H, 2FH, 4AH, 4AH, 48H, 2FH, 4DH       ; 472F _ op/JJH/M
        db 61H, 63H, 5FH, 53H, 65H, 63H, 75H, 72H       ; 4737 _ ac_Secur
        db 69H, 74H, 79H, 5FH, 53H, 34H, 2FH, 65H       ; 473F _ ity_S4/e
        db 64H, 6BH, 32H, 2DH, 6DH, 61H, 73H, 74H       ; 4747 _ dk2-mast
        db 65H, 72H, 2FH, 42H, 75H, 69H, 6CH, 64H       ; 474F _ er/Build
        db 2FH, 4DH, 64H, 65H, 4DH, 6FH, 64H, 75H       ; 4757 _ /MdeModu
        db 6CH, 65H, 2FH, 44H, 45H, 42H, 55H, 47H       ; 475F _ le/DEBUG
        db 5FH, 58H, 43H, 4FH, 44H, 45H, 35H, 2FH       ; 4767 _ _XCODE5/
        db 58H, 36H, 34H, 2FH, 4DH, 64H, 65H, 4DH       ; 476F _ X64/MdeM
        db 6FH, 64H, 75H, 6CH, 65H, 50H, 6BH, 67H       ; 4777 _ odulePkg
        db 2FH, 55H, 6EH, 69H, 76H, 65H, 72H, 73H       ; 477F _ /Univers
        db 61H, 6CH, 2FH, 43H, 6FH, 6EH, 73H, 6FH       ; 4787 _ al/Conso
        db 6CH, 65H, 2FH, 43H, 6FH, 6EH, 50H, 6CH       ; 478F _ le/ConPl
        db 61H, 74H, 66H, 6FH, 72H, 6DH, 44H, 78H       ; 4797 _ atformDx
        db 65H, 2FH, 43H, 6FH, 6EH, 50H, 6CH, 61H       ; 479F _ e/ConPla
        db 74H, 66H, 6FH, 72H, 6DH, 44H, 78H, 65H       ; 47A7 _ tformDxe
        db 2FH, 44H, 45H, 42H, 55H, 47H, 2FH, 41H       ; 47AF _ /DEBUG/A
        db 75H, 74H, 6FH, 47H, 65H, 6EH, 2EH, 63H       ; 47B7 _ utoGen.c
        db 00H                                          ; 47BF _ .
__TEXT.__cstring ENDS

__TEXT.__ustring SEGMENT WORD 'DATA'                    ; section number 4

        db 50H, 00H, 6CH, 00H, 61H, 00H, 74H, 00H       ; 47C0 _ P.l.a.t.
        db 66H, 00H, 6FH, 00H, 72H, 00H, 6DH, 00H       ; 47C8 _ f.o.r.m.
        db 20H, 00H, 43H, 00H, 6FH, 00H, 6EH, 00H       ; 47D0 _  .C.o.n.
        db 73H, 00H, 6FH, 00H, 6CH, 00H, 65H, 00H       ; 47D8 _ s.o.l.e.
        db 20H, 00H, 4DH, 00H, 61H, 00H, 6EH, 00H       ; 47E0 _  .M.a.n.
        db 61H, 00H, 67H, 00H, 65H, 00H, 6DH, 00H       ; 47E8 _ a.g.e.m.
        db 65H, 00H, 6EH, 00H, 74H, 00H, 20H, 00H       ; 47F0 _ e.n.t. .
        db 44H, 00H, 72H, 00H, 69H, 00H, 76H, 00H       ; 47F8 _ D.r.i.v.
        db 65H, 00H, 72H, 00H, 00H, 00H                 ; 4800 _ e.r...

?_382   label byte
        db 43H, 00H, 6FH, 00H, 6EH, 00H, 49H, 00H       ; 4806 _ C.o.n.I.
        db 6EH, 00H, 00H, 00H                           ; 480E _ n...

?_383   label byte
        db 43H, 00H, 6FH, 00H, 6EH, 00H, 4FH, 00H       ; 4812 _ C.o.n.O.
        db 75H, 00H, 74H, 00H, 00H, 00H                 ; 481A _ u.t...

?_384   label byte
        db 45H, 00H, 72H, 00H, 72H, 00H, 4FH, 00H       ; 4820 _ E.r.r.O.
        db 75H, 00H, 74H, 00H, 00H, 00H                 ; 4828 _ u.t...

?_385   label byte
        db 43H, 00H, 6FH, 00H, 6EH, 00H, 49H, 00H       ; 482E _ C.o.n.I.
        db 6EH, 00H, 44H, 00H, 65H, 00H, 76H, 00H       ; 4836 _ n.D.e.v.
        db 00H, 00H                                     ; 483E _ ..

?_386   label byte
        db 43H, 00H, 6FH, 00H, 6EH, 00H, 4FH, 00H       ; 4840 _ C.o.n.O.
        db 75H, 00H, 74H, 00H, 44H, 00H, 65H, 00H       ; 4848 _ u.t.D.e.
        db 76H, 00H, 00H, 00H                           ; 4850 _ v...

?_387   label byte
        db 45H, 00H, 72H, 00H, 72H, 00H, 4FH, 00H       ; 4854 _ E.r.r.O.
        db 75H, 00H, 74H, 00H, 44H, 00H, 65H, 00H       ; 485C _ u.t.D.e.
        db 76H, 00H, 00H, 00H                           ; 4864 _ v...

__TEXT.__ustring ENDS

__TEXT.__eh_frame SEGMENT ALIGN(8) 'DATA'               ; section number 5

        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4868 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 4870 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 4878 _ ........
        db 1CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 4880 _ ........
        db 0B8H, 0B9H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 4888 _ ........
        db 07H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4890 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4898 _ ........
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 48A0 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 48A8 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 48B0 _ ........
        db 2CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 48B8 _ ,.......
        db 88H, 0B9H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 48C0 _ ........
        db 50H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 48C8 _ P.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 48D0 _ .A....C.
        db 06H, 49H, 83H, 06H, 85H, 05H, 84H, 04H       ; 48D8 _ .I......
        db 8EH, 03H, 00H, 00H, 00H, 00H, 00H, 00H       ; 48E0 _ ........
        db 2CH, 00H, 00H, 00H, 4CH, 00H, 00H, 00H       ; 48E8 _ ,...L...
        db 0A8H, 0B9H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 48F0 _ ........
        db 12H, 11H, 00H, 00H, 00H, 00H, 00H, 00H       ; 48F8 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 4900 _ .A....C.
        db 06H, 52H, 83H, 09H, 85H, 08H, 84H, 07H       ; 4908 _ .R......
        db 8CH, 06H, 8DH, 05H, 8EH, 04H, 8FH, 03H       ; 4910 _ ........
        db 24H, 00H, 00H, 00H, 7CH, 00H, 00H, 00H       ; 4918 _ $...|...
        db 34H, 0CBH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 4920 _ 4.......
        db 2DH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4928 _ -.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 4930 _ .A....C.
        db 06H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4938 _ ........
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4940 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 4948 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 4950 _ ........
        db 2CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 4958 _ ,.......
        db 21H, 0CBH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 4960 _ !.......
        db 6FH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4968 _ o.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 4970 _ .A....C.
        db 06H, 49H, 83H, 06H, 85H, 05H, 84H, 04H       ; 4978 _ .I......
        db 8EH, 03H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4980 _ ........
        db 24H, 00H, 00H, 00H, 4CH, 00H, 00H, 00H       ; 4988 _ $...L...
        db 60H, 0CBH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 4990 _ `.......
        db 23H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4998 _ #.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 49A0 _ .A....C.
        db 06H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 49A8 _ ........
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 49B0 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 49B8 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 49C0 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 49C8 _ $.......
        db 43H, 0CBH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 49D0 _ C.......
        db 66H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 49D8 _ f.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 49E0 _ .A....C.
        db 06H, 45H, 84H, 03H, 00H, 00H, 00H, 00H       ; 49E8 _ .E......
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 49F0 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 49F8 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 4A00 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 4A08 _ $.......
        db 69H, 0CBH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 4A10 _ i.......
        db 4DH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4A18 _ M.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 4A20 _ .A....C.
        db 06H, 47H, 83H, 05H, 85H, 04H, 84H, 03H       ; 4A28 _ .G......
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4A30 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 4A38 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 4A40 _ ........
        db 1CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 4A48 _ ........
        db 76H, 0CBH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 4A50 _ v.......
        db 12H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4A58 _ ........
        db 00H, 41H, 0EH, 10H, 00H, 00H, 00H, 00H       ; 4A60 _ .A......
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4A68 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 4A70 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 4A78 _ ........
        db 2CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 4A80 _ ,.......
        db 50H, 0CBH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 4A88 _ P.......
        db 0BBH, 00H, 00H, 00H, 00H, 00H, 00H, 00H      ; 4A90 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 4A98 _ .A....C.
        db 06H, 4BH, 83H, 07H, 85H, 06H, 84H, 05H       ; 4AA0 _ .K......
        db 8EH, 04H, 8FH, 03H, 00H, 00H, 00H, 00H       ; 4AA8 _ ........
        db 24H, 00H, 00H, 00H, 4CH, 00H, 00H, 00H       ; 4AB0 _ $...L...
        db 0DBH, 0CBH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 4AB8 _ ........
        db 18H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4AC0 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 4AC8 _ .A....C.
        db 06H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4AD0 _ ........
        db 24H, 00H, 00H, 00H, 74H, 00H, 00H, 00H       ; 4AD8 _ $...t...
        db 0CBH, 0CBH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 4AE0 _ ........
        db 16H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4AE8 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 4AF0 _ .A....C.
        db 06H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4AF8 _ ........
        db 2CH, 00H, 00H, 00H, 9CH, 00H, 00H, 00H       ; 4B00 _ ,.......
        db 0B9H, 0CBH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 4B08 _ ........
        db 92H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4B10 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 4B18 _ .A....C.
        db 06H, 4BH, 83H, 07H, 85H, 06H, 84H, 05H       ; 4B20 _ .K......
        db 8EH, 04H, 8FH, 03H, 00H, 00H, 00H, 00H       ; 4B28 _ ........
        db 2CH, 00H, 00H, 00H, 0CCH, 00H, 00H, 00H      ; 4B30 _ ,.......
        db 1BH, 0CCH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 4B38 _ ........
        db 0DFH, 00H, 00H, 00H, 00H, 00H, 00H, 00H      ; 4B40 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 4B48 _ .A....C.
        db 06H, 49H, 83H, 06H, 85H, 05H, 84H, 04H       ; 4B50 _ .I......
        db 8EH, 03H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4B58 _ ........
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4B60 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 4B68 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 4B70 _ ........
        db 1CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 4B78 _ ........
        db 0BCH, 0CEH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 4B80 _ ........
        db 1CH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4B88 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4B90 _ ........
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4B98 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 4BA0 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 4BA8 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 4BB0 _ $.......
        db 0A0H, 0CEH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 4BB8 _ ........
        db 3CH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4BC0 _ <.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 4BC8 _ .A....C.
        db 06H, 45H, 84H, 03H, 00H, 00H, 00H, 00H       ; 4BD0 _ .E......
        db 24H, 00H, 00H, 00H, 44H, 00H, 00H, 00H       ; 4BD8 _ $...D...
        db 0B4H, 0CEH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 4BE0 _ ........
        db 40H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4BE8 _ @.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 4BF0 _ .A....C.
        db 06H, 45H, 84H, 03H, 00H, 00H, 00H, 00H       ; 4BF8 _ .E......
        db 24H, 00H, 00H, 00H, 6CH, 00H, 00H, 00H       ; 4C00 _ $...l...
        db 0CCH, 0CEH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 4C08 _ ........
        db 3BH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4C10 _ ;.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 4C18 _ .A....C.
        db 06H, 45H, 84H, 03H, 00H, 00H, 00H, 00H       ; 4C20 _ .E......
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4C28 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 4C30 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 4C38 _ ........
        db 1CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 4C40 _ ........
        db 0C7H, 0CEH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 4C48 _ ........
        db 02H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4C50 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4C58 _ ........
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4C60 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 4C68 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 4C70 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 4C78 _ $.......
        db 0DAH, 0D0H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 4C80 _ ........
        db 0A0H, 00H, 00H, 00H, 00H, 00H, 00H, 00H      ; 4C88 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 4C90 _ .A....C.
        db 06H, 49H, 85H, 04H, 84H, 03H, 00H, 00H       ; 4C98 _ .I......
        db 1CH, 00H, 00H, 00H, 44H, 00H, 00H, 00H       ; 4CA0 _ ....D...
        db 52H, 0D1H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 4CA8 _ R.......
        db 0BH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4CB0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4CB8 _ ........
        db 24H, 00H, 00H, 00H, 64H, 00H, 00H, 00H       ; 4CC0 _ $...d...
        db 3DH, 0D1H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 4CC8 _ =.......
        db 7FH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4CD0 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 4CD8 _ .A....C.
        db 06H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4CE0 _ ........
        db 1CH, 00H, 00H, 00H, 8CH, 00H, 00H, 00H       ; 4CE8 _ ........
        db 94H, 0D1H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 4CF0 _ ........
        db 0EH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4CF8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4D00 _ ........
        db 1CH, 00H, 00H, 00H, 0ACH, 00H, 00H, 00H      ; 4D08 _ ........
        db 82H, 0D1H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 4D10 _ ........
        db 10H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4D18 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4D20 _ ........
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4D28 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 4D30 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 4D38 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 4D40 _ $.......
        db 5AH, 0D1H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 4D48 _ Z.......
        db 0F3H, 00H, 00H, 00H, 00H, 00H, 00H, 00H      ; 4D50 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 4D58 _ .A....C.
        db 06H, 47H, 83H, 05H, 85H, 04H, 84H, 03H       ; 4D60 _ .G......
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4D68 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 4D70 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 4D78 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 4D80 _ $.......
        db 0DH, 0D2H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 4D88 _ ........
        db 0A0H, 00H, 00H, 00H, 00H, 00H, 00H, 00H      ; 4D90 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 4D98 _ .A....C.
        db 06H, 47H, 83H, 05H, 85H, 04H, 84H, 03H       ; 4DA0 _ .G......
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4DA8 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 4DB0 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 4DB8 _ ........
        db 1CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 4DC0 _ ........
        db 6DH, 0D2H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 4DC8 _ m.......
        db 2EH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4DD0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4DD8 _ ........
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4DE0 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 4DE8 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 4DF0 _ ........
        db 1CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 4DF8 _ ........
        db 63H, 0D2H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 4E00 _ c.......
        db 39H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4E08 _ 9.......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4E10 _ ........
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4E18 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 4E20 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 4E28 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 4E30 _ $.......
        db 64H, 0D2H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 4E38 _ d.......
        db 0B5H, 00H, 00H, 00H, 00H, 00H, 00H, 00H      ; 4E40 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 4E48 _ .A....C.
        db 06H, 45H, 84H, 03H, 00H, 00H, 00H, 00H       ; 4E50 _ .E......
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4E58 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 4E60 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 4E68 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 4E70 _ $.......
        db 0D9H, 0D2H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 4E78 _ ........
        db 31H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4E80 _ 1.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 4E88 _ .A....C.
        db 06H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4E90 _ ........
        db 1CH, 00H, 00H, 00H, 44H, 00H, 00H, 00H       ; 4E98 _ ....D...
        db 0E2H, 0D2H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 4EA0 _ ........
        db 10H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4EA8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4EB0 _ ........
        db 24H, 00H, 00H, 00H, 64H, 00H, 00H, 00H       ; 4EB8 _ $...d...
        db 0D2H, 0D2H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 4EC0 _ ........
        db 95H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4EC8 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 4ED0 _ .A....C.
        db 06H, 47H, 83H, 05H, 85H, 04H, 84H, 03H       ; 4ED8 _ .G......
        db 1CH, 00H, 00H, 00H, 8CH, 00H, 00H, 00H       ; 4EE0 _ ........
        db 3FH, 0D3H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 4EE8 _ ?.......
        db 13H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4EF0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4EF8 _ ........
        db 24H, 00H, 00H, 00H, 0ACH, 00H, 00H, 00H      ; 4F00 _ $.......
        db 32H, 0D3H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 4F08 _ 2.......
        db 74H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4F10 _ t.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 4F18 _ .A....C.
        db 06H, 45H, 84H, 03H, 00H, 00H, 00H, 00H       ; 4F20 _ .E......
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4F28 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 4F30 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 4F38 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 4F40 _ $.......
        db 66H, 0D3H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 4F48 _ f.......
        db 48H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4F50 _ H.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 4F58 _ .A....C.
        db 06H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4F60 _ ........
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4F68 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 4F70 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 4F78 _ ........
        db 2CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 4F80 _ ,.......
        db 6EH, 0D3H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 4F88 _ n.......
        db 0B0H, 00H, 00H, 00H, 00H, 00H, 00H, 00H      ; 4F90 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 4F98 _ .A....C.
        db 06H, 4DH, 83H, 08H, 85H, 07H, 84H, 06H       ; 4FA0 _ .M......
        db 8CH, 05H, 8EH, 04H, 8FH, 03H, 00H, 00H       ; 4FA8 _ ........
        db 24H, 00H, 00H, 00H, 4CH, 00H, 00H, 00H       ; 4FB0 _ $...L...
        db 0EEH, 0D3H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 4FB8 _ ........
        db 57H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4FC0 _ W.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 4FC8 _ .A....C.
        db 06H, 45H, 84H, 03H, 00H, 00H, 00H, 00H       ; 4FD0 _ .E......
        db 24H, 00H, 00H, 00H, 74H, 00H, 00H, 00H       ; 4FD8 _ $...t...
        db 1DH, 0D4H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 4FE0 _ ........
        db 48H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 4FE8 _ H.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 4FF0 _ .A....C.
        db 06H, 45H, 84H, 03H, 00H, 00H, 00H, 00H       ; 4FF8 _ .E......
        db 24H, 00H, 00H, 00H, 9CH, 00H, 00H, 00H       ; 5000 _ $.......
        db 3DH, 0D4H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 5008 _ =.......
        db 44H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5010 _ D.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 5018 _ .A....C.
        db 06H, 45H, 84H, 03H, 00H, 00H, 00H, 00H       ; 5020 _ .E......
        db 24H, 00H, 00H, 00H, 0C4H, 00H, 00H, 00H      ; 5028 _ $.......
        db 59H, 0D4H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 5030 _ Y.......
        db 3CH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5038 _ <.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 5040 _ .A....C.
        db 06H, 45H, 84H, 03H, 00H, 00H, 00H, 00H       ; 5048 _ .E......
        db 24H, 00H, 00H, 00H, 0ECH, 00H, 00H, 00H      ; 5050 _ $.......
        db 6DH, 0D4H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 5058 _ m.......
        db 3DH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5060 _ =.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 5068 _ .A....C.
        db 06H, 45H, 84H, 03H, 00H, 00H, 00H, 00H       ; 5070 _ .E......
        db 24H, 00H, 00H, 00H, 14H, 01H, 00H, 00H       ; 5078 _ $.......
        db 82H, 0D4H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 5080 _ ........
        db 49H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5088 _ I.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 5090 _ .A....C.
        db 06H, 45H, 84H, 03H, 00H, 00H, 00H, 00H       ; 5098 _ .E......
        db 24H, 00H, 00H, 00H, 3CH, 01H, 00H, 00H       ; 50A0 _ $...<...
        db 0A3H, 0D4H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 50A8 _ ........
        db 70H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 50B0 _ p.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 50B8 _ .A....C.
        db 06H, 47H, 83H, 05H, 85H, 04H, 84H, 03H       ; 50C0 _ .G......
        db 24H, 00H, 00H, 00H, 64H, 01H, 00H, 00H       ; 50C8 _ $...d...
        db 0EBH, 0D4H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 50D0 _ ........
        db 2CH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 50D8 _ ,.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 50E0 _ .A....C.
        db 06H, 45H, 84H, 03H, 00H, 00H, 00H, 00H       ; 50E8 _ .E......
        db 2CH, 00H, 00H, 00H, 8CH, 01H, 00H, 00H       ; 50F0 _ ,.......
        db 0EFH, 0D4H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 50F8 _ ........
        db 0EEH, 00H, 00H, 00H, 00H, 00H, 00H, 00H      ; 5100 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 5108 _ .A....C.
        db 06H, 4BH, 83H, 07H, 85H, 06H, 84H, 05H       ; 5110 _ .K......
        db 8EH, 04H, 8FH, 03H, 00H, 00H, 00H, 00H       ; 5118 _ ........
        db 2CH, 00H, 00H, 00H, 0BCH, 01H, 00H, 00H      ; 5120 _ ,.......
        db 0ADH, 0D5H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 5128 _ ........
        db 0DBH, 00H, 00H, 00H, 00H, 00H, 00H, 00H      ; 5130 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 5138 _ .A....C.
        db 06H, 4BH, 83H, 07H, 85H, 06H, 84H, 05H       ; 5140 _ .K......
        db 8EH, 04H, 8FH, 03H, 00H, 00H, 00H, 00H       ; 5148 _ ........
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5150 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 5158 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 5160 _ ........
        db 1CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 5168 _ ........
        db 40H, 0D6H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 5170 _ @.......
        db 05H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5178 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5180 _ ........
        db 1CH, 00H, 00H, 00H, 3CH, 00H, 00H, 00H       ; 5188 _ ....<...
        db 25H, 0D6H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 5190 _ %.......
        db 05H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5198 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 51A0 _ ........
        db 1CH, 00H, 00H, 00H, 5CH, 00H, 00H, 00H       ; 51A8 _ ....\...
        db 0AH, 0D6H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 51B0 _ ........
        db 05H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 51B8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 51C0 _ ........
        db 1CH, 00H, 00H, 00H, 7CH, 00H, 00H, 00H       ; 51C8 _ ....|...
        db 0EFH, 0D5H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 51D0 _ ........
        db 05H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 51D8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 51E0 _ ........
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 51E8 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 51F0 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 51F8 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 5200 _ $.......
        db 0BCH, 0D5H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 5208 _ ........
        db 54H, 01H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5210 _ T.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 5218 _ .A....C.
        db 06H, 47H, 83H, 05H, 85H, 04H, 84H, 03H       ; 5220 _ .G......
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5228 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 5230 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 5238 _ ........
        db 1CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 5240 _ ........
        db 0D0H, 0D6H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 5248 _ ........
        db 03H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5250 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5258 _ ........
        db 2CH, 00H, 00H, 00H, 3CH, 00H, 00H, 00H       ; 5260 _ ,...<...
        db 0B3H, 0D6H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 5268 _ ........
        db 48H, 01H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5270 _ H.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 5278 _ .A....C.
        db 06H, 4FH, 83H, 09H, 85H, 08H, 84H, 07H       ; 5280 _ .O......
        db 8CH, 06H, 8DH, 05H, 8EH, 04H, 8FH, 03H       ; 5288 _ ........
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5290 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 5298 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 52A0 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 52A8 _ $.......
        db 0B3H, 0D7H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 52B0 _ ........
        db 34H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 52B8 _ 4.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 52C0 _ .A....C.
        db 06H, 46H, 85H, 04H, 84H, 03H, 00H, 00H       ; 52C8 _ .F......
        db 24H, 00H, 00H, 00H, 44H, 00H, 00H, 00H       ; 52D0 _ $...D...
        db 0BFH, 0D7H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 52D8 _ ........
        db 0EAH, 00H, 00H, 00H, 00H, 00H, 00H, 00H      ; 52E0 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 52E8 _ .A....C.
        db 06H, 47H, 83H, 05H, 85H, 04H, 84H, 03H       ; 52F0 _ .G......
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 52F8 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 5300 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 5308 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 5310 _ $.......
        db 69H, 0D8H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 5318 _ i.......
        db 3BH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5320 _ ;.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 5328 _ .A....C.
        db 06H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5330 _ ........
        db 1CH, 00H, 00H, 00H, 44H, 00H, 00H, 00H       ; 5338 _ ....D...
        db 7CH, 0D8H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 5340 _ |.......
        db 0BH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5348 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5350 _ ........
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5358 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 5360 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 5368 _ ........
        db 1CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 5370 _ ........
        db 4FH, 0D8H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 5378 _ O.......
        db 0CH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5380 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5388 _ ........
        db 24H, 00H, 00H, 00H, 3CH, 00H, 00H, 00H       ; 5390 _ $...<...
        db 3BH, 0D8H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 5398 _ ;.......
        db 48H, 01H, 00H, 00H, 00H, 00H, 00H, 00H       ; 53A0 _ H.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 53A8 _ .A....C.
        db 06H, 47H, 83H, 05H, 85H, 04H, 84H, 03H       ; 53B0 _ .G......
        db 24H, 00H, 00H, 00H, 64H, 00H, 00H, 00H       ; 53B8 _ $...d...
        db 5BH, 0D9H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 53C0 _ [.......
        db 91H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 53C8 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 53D0 _ .A....C.
        db 06H, 46H, 85H, 04H, 84H, 03H, 00H, 00H       ; 53D8 _ .F......
        db 1CH, 00H, 00H, 00H, 8CH, 00H, 00H, 00H       ; 53E0 _ ........
        db 0C4H, 0D9H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 53E8 _ ........
        db 0CH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 53F0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 53F8 _ ........
        db 2CH, 00H, 00H, 00H, 0ACH, 00H, 00H, 00H      ; 5400 _ ,.......
        db 0B0H, 0D9H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 5408 _ ........
        db 0DBH, 01H, 00H, 00H, 00H, 00H, 00H, 00H      ; 5410 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 5418 _ .A....C.
        db 06H, 49H, 83H, 06H, 85H, 05H, 84H, 04H       ; 5420 _ .I......
        db 8EH, 03H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5428 _ ........
        db 24H, 00H, 00H, 00H, 0DCH, 00H, 00H, 00H      ; 5430 _ $.......
        db 5BH, 0DBH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 5438 _ [.......
        db 0B9H, 00H, 00H, 00H, 00H, 00H, 00H, 00H      ; 5440 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 5448 _ .A....C.
        db 06H, 46H, 85H, 04H, 84H, 03H, 00H, 00H       ; 5450 _ .F......
        db 24H, 00H, 00H, 00H, 04H, 01H, 00H, 00H       ; 5458 _ $.......
        db 0ECH, 0DBH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 5460 _ ........
        db 18H, 01H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5468 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 5470 _ .A....C.
        db 06H, 47H, 83H, 05H, 85H, 04H, 84H, 03H       ; 5478 _ .G......
        db 24H, 00H, 00H, 00H, 2CH, 01H, 00H, 00H       ; 5480 _ $...,...
        db 0DCH, 0DCH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 5488 _ ........
        db 96H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5490 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 5498 _ .A....C.
        db 06H, 47H, 83H, 05H, 85H, 04H, 84H, 03H       ; 54A0 _ .G......
        db 2CH, 00H, 00H, 00H, 54H, 01H, 00H, 00H       ; 54A8 _ ,...T...
        db 4AH, 0DDH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 54B0 _ J.......
        db 01H, 01H, 00H, 00H, 00H, 00H, 00H, 00H       ; 54B8 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 54C0 _ .A....C.
        db 06H, 4BH, 83H, 07H, 85H, 06H, 84H, 05H       ; 54C8 _ .K......
        db 8EH, 04H, 8FH, 03H, 00H, 00H, 00H, 00H       ; 54D0 _ ........
        db 24H, 00H, 00H, 00H, 84H, 01H, 00H, 00H       ; 54D8 _ $.......
        db 1BH, 0DEH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 54E0 _ ........
        db 81H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 54E8 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 54F0 _ .A....C.
        db 06H, 45H, 84H, 03H, 00H, 00H, 00H, 00H       ; 54F8 _ .E......
        db 2CH, 00H, 00H, 00H, 0ACH, 01H, 00H, 00H      ; 5500 _ ,.......
        db 74H, 0DEH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 5508 _ t.......
        db 46H, 01H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5510 _ F.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 5518 _ .A....C.
        db 06H, 4DH, 83H, 08H, 85H, 07H, 84H, 06H       ; 5520 _ .M......
        db 8CH, 05H, 8EH, 04H, 8FH, 03H, 00H, 00H       ; 5528 _ ........
        db 24H, 00H, 00H, 00H, 0DCH, 01H, 00H, 00H      ; 5530 _ $.......
        db 8AH, 0DFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 5538 _ ........
        db 5DH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5540 _ ].......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 5548 _ .A....C.
        db 06H, 46H, 85H, 04H, 84H, 03H, 00H, 00H       ; 5550 _ .F......
        db 24H, 00H, 00H, 00H, 04H, 02H, 00H, 00H       ; 5558 _ $.......
        db 0BFH, 0DFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 5560 _ ........
        db 9BH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5568 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 5570 _ .A....C.
        db 06H, 47H, 83H, 05H, 85H, 04H, 84H, 03H       ; 5578 _ .G......
        db 2CH, 00H, 00H, 00H, 2CH, 02H, 00H, 00H       ; 5580 _ ,...,...
        db 32H, 0E0H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 5588 _ 2.......
        db 4AH, 01H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5590 _ J.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 5598 _ .A....C.
        db 06H, 49H, 83H, 06H, 85H, 05H, 84H, 04H       ; 55A0 _ .I......
        db 8EH, 03H, 00H, 00H, 00H, 00H, 00H, 00H       ; 55A8 _ ........
        db 2CH, 00H, 00H, 00H, 5CH, 02H, 00H, 00H       ; 55B0 _ ,...\...
        db 4CH, 0E1H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 55B8 _ L.......
        db 08H, 01H, 00H, 00H, 00H, 00H, 00H, 00H       ; 55C0 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 55C8 _ .A....C.
        db 06H, 4FH, 83H, 09H, 85H, 08H, 84H, 07H       ; 55D0 _ .O......
        db 8CH, 06H, 8DH, 05H, 8EH, 04H, 8FH, 03H       ; 55D8 _ ........
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 55E0 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 55E8 _ .zR..x..
        db 10H, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 55F0 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 55F8 _ $.......
        db 0CH, 0E2H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 5600 _ ........
        db 39H, 01H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5608 _ 9.......
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 5610 _ .A....C.
        db 06H, 47H, 83H, 05H, 85H, 04H, 84H, 03H       ; 5618 _ .G......
        db 1CH, 00H, 00H, 00H, 44H, 00H, 00H, 00H       ; 5620 _ ....D...
        db 1DH, 0E3H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 5628 _ ........
        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5630 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5638 _ ........
        db 1CH, 00H, 00H, 00H, 64H, 00H, 00H, 00H       ; 5640 _ ....d...
        db 0FEH, 0E2H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 5648 _ ........
        db 05H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5650 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5658 _ ........
        db 1CH, 00H, 00H, 00H, 84H, 00H, 00H, 00H       ; 5660 _ ........
        db 0E3H, 0E2H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 5668 _ ........
        db 03H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5670 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5678 _ ........

__TEXT.__eh_frame ENDS

__DATA.__const SEGMENT PARA 'DATA'                      ; section number 6

_mStatusString label byte
        db 81H, 39H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5680 _ .9......
        db 89H, 39H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5688 _ .9......
        db 9FH, 39H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5690 _ .9......
        db 0B6H, 39H, 00H, 00H, 00H, 00H, 00H, 00H      ; 5698 _ .9......
        db 0CCH, 39H, 00H, 00H, 00H, 00H, 00H, 00H      ; 56A0 _ .9......
        db 0E5H, 39H, 00H, 00H, 00H, 00H, 00H, 00H      ; 56A8 _ .9......
        db 0F8H, 39H, 00H, 00H, 00H, 00H, 00H, 00H      ; 56B0 _ .9......
        db 03H, 3AH, 00H, 00H, 00H, 00H, 00H, 00H       ; 56B8 _ .:......
        db 15H, 3AH, 00H, 00H, 00H, 00H, 00H, 00H       ; 56C0 _ .:......
        db 21H, 3AH, 00H, 00H, 00H, 00H, 00H, 00H       ; 56C8 _ !:......
        db 31H, 3AH, 00H, 00H, 00H, 00H, 00H, 00H       ; 56D0 _ 1:......
        db 42H, 3AH, 00H, 00H, 00H, 00H, 00H, 00H       ; 56D8 _ B:......
        db 4CH, 3AH, 00H, 00H, 00H, 00H, 00H, 00H       ; 56E0 _ L:......
        db 59H, 3AH, 00H, 00H, 00H, 00H, 00H, 00H       ; 56E8 _ Y:......
        db 69H, 3AH, 00H, 00H, 00H, 00H, 00H, 00H       ; 56F0 _ i:......
        db 7AH, 3AH, 00H, 00H, 00H, 00H, 00H, 00H       ; 56F8 _ z:......
        db 89H, 3AH, 00H, 00H, 00H, 00H, 00H, 00H       ; 5700 _ .:......
        db 95H, 3AH, 00H, 00H, 00H, 00H, 00H, 00H       ; 5708 _ .:......
        db 9EH, 3AH, 00H, 00H, 00H, 00H, 00H, 00H       ; 5710 _ .:......
        db 0ACH, 3AH, 00H, 00H, 00H, 00H, 00H, 00H      ; 5718 _ .:......
        db 0B6H, 3AH, 00H, 00H, 00H, 00H, 00H, 00H      ; 5720 _ .:......
        db 0C4H, 3AH, 00H, 00H, 00H, 00H, 00H, 00H      ; 5728 _ .:......
        db 0D0H, 3AH, 00H, 00H, 00H, 00H, 00H, 00H      ; 5730 _ .:......
        db 0DBH, 3AH, 00H, 00H, 00H, 00H, 00H, 00H      ; 5738 _ .:......
        db 0E4H, 3AH, 00H, 00H, 00H, 00H, 00H, 00H      ; 5740 _ .:......
        db 0F0H, 3AH, 00H, 00H, 00H, 00H, 00H, 00H      ; 5748 _ .:......
        db 00H, 3BH, 00H, 00H, 00H, 00H, 00H, 00H       ; 5750 _ .;......
        db 08H, 3BH, 00H, 00H, 00H, 00H, 00H, 00H       ; 5758 _ .;......
        db 13H, 3BH, 00H, 00H, 00H, 00H, 00H, 00H       ; 5760 _ .;......
        db 1EH, 3BH, 00H, 00H, 00H, 00H, 00H, 00H       ; 5768 _ .;......
        db 2DH, 3BH, 00H, 00H, 00H, 00H, 00H, 00H       ; 5770 _ -;......
        db 42H, 3BH, 00H, 00H, 00H, 00H, 00H, 00H       ; 5778 _ B;......
        db 55H, 3BH, 00H, 00H, 00H, 00H, 00H, 00H       ; 5780 _ U;......
        db 5FH, 3BH, 00H, 00H, 00H, 00H, 00H, 00H       ; 5788 _ _;......
        db 6CH, 3BH, 00H, 00H, 00H, 00H, 00H, 00H       ; 5790 _ l;......
        db 7AH, 3BH, 00H, 00H, 00H, 00H, 00H, 00H       ; 5798 _ z;......
        db 88H, 3BH, 00H, 00H, 00H, 00H, 00H, 00H       ; 57A0 _ .;......
        db 94H, 3BH, 00H, 00H, 00H, 00H, 00H, 00H       ; 57A8 _ .;......
        db 0A5H, 3BH, 00H, 00H, 00H, 00H, 00H, 00H      ; 57B0 _ .;......

__DATA.__const ENDS

__DATA.__data SEGMENT PARA 'DATA'                       ; section number 7

_m16Size label byte
        db 30H, 01H                                     ; 57C0 _ 0.

_mThunk16Attr label byte
        db 22H, 00H                                     ; 57C2 _ ".

_m16Gdt label byte
        db 10H, 01H                                     ; 57C4 _ ..

_m16GdtrBase label byte
        db 0B0H, 00H                                    ; 57C6 _ ..

_mTransition label byte
        db 0A8H, 00H, 00H, 00H, 00H, 00H, 00H, 00H      ; 57C8 _ ........

_gConPlatformComponentName label byte
        db 81H, 2BH, 00H, 00H, 00H, 00H, 00H, 00H       ; 57D0 _ .+......
        db 0BCH, 2BH, 00H, 00H, 00H, 00H, 00H, 00H      ; 57D8 _ .+......
        db 93H, 46H, 00H, 00H, 00H, 00H, 00H, 00H       ; 57E0 _ .F......

_gConPlatformComponentName2 label byte
        db 81H, 2BH, 00H, 00H, 00H, 00H, 00H, 00H       ; 57E8 _ .+......
        db 0BCH, 2BH, 00H, 00H, 00H, 00H, 00H, 00H      ; 57F0 _ .+......
        db 97H, 46H, 00H, 00H, 00H, 00H, 00H, 00H       ; 57F8 _ .F......

_mConPlatformDriverNameTable label byte
        db 9AH, 46H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5800 _ .F......
        db 0C0H, 47H, 00H, 00H, 00H, 00H, 00H, 00H      ; 5808 _ .G......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5810 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5818 _ ........

_gConPlatformTextInDriverBinding label byte
        db 0C7H, 2BH, 00H, 00H, 00H, 00H, 00H, 00H      ; 5820 _ .+......
        db 0D3H, 2BH, 00H, 00H, 00H, 00H, 00H, 00H      ; 5828 _ .+......
        db 1BH, 2DH, 00H, 00H, 00H, 00H, 00H, 00H       ; 5830 _ .-......
        db 0AH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5838 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5840 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5848 _ ........

_gConPlatformTextOutDriverBinding label byte
        db 0ACH, 2DH, 00H, 00H, 00H, 00H, 00H, 00H      ; 5850 _ .-......
        db 0B8H, 2DH, 00H, 00H, 00H, 00H, 00H, 00H      ; 5858 _ .-......
        db 93H, 2FH, 00H, 00H, 00H, 00H, 00H, 00H       ; 5860 _ ./......
        db 0AH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5868 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5870 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 5878 _ ........

_gEfiCallerBaseName label qword
        dq 0000000000004710H                            ; 5880 _ 0000000000004710 
_gEfiGlobalVariableGuid label byte
        db 61H, 0DFH, 0E4H, 8BH, 0CAH, 93H, 0D2H, 11H   ; 5888 _ a.......
        db 0AAH, 0DH, 00H, 0E0H, 98H, 03H, 2BH, 8CH     ; 5890 _ ......+.

_gEfiStandardErrorDeviceGuid label byte
        db 2DH, 6FH, 0B3H, 0D3H, 51H, 0D5H, 0D4H, 11H   ; 5898 _ -o..Q...
        db 9AH, 46H, 00H, 90H, 27H, 3FH, 0C1H, 4DH      ; 58A0 _ .F..'?.M

_gEfiConsoleOutDeviceGuid label byte
        db 2CH, 6FH, 0B3H, 0D3H, 51H, 0D5H, 0D4H, 11H   ; 58A8 _ ,o..Q...
        db 9AH, 46H, 00H, 90H, 27H, 3FH, 0C1H, 4DH      ; 58B0 _ .F..'?.M

_gEfiConsoleInDeviceGuid label byte
        db 2BH, 6FH, 0B3H, 0D3H, 51H, 0D5H, 0D4H, 11H   ; 58B8 _ +o..Q...
        db 9AH, 46H, 00H, 90H, 27H, 3FH, 0C1H, 4DH      ; 58C0 _ .F..'?.M

_gEfiDevicePathProtocolGuid label byte
        db 91H, 6EH, 57H, 09H, 3FH, 6DH, 0D2H, 11H      ; 58C8 _ .nW.?m..
        db 8EH, 39H, 00H, 0A0H, 0C9H, 69H, 72H, 3BH     ; 58D0 _ .9...ir;

_gEfiSimpleTextInProtocolGuid label byte
        db 0C1H, 77H, 74H, 38H, 0C7H, 69H, 0D2H, 11H    ; 58D8 _ .wt8.i..
        db 8EH, 39H, 00H, 0A0H, 0C9H, 69H, 72H, 3BH     ; 58E0 _ .9...ir;

_gEfiSimpleTextOutProtocolGuid label byte
        db 0C2H, 77H, 74H, 38H, 0C7H, 69H, 0D2H, 11H    ; 58E8 _ .wt8.i..
        db 8EH, 39H, 00H, 0A0H, 0C9H, 69H, 72H, 3BH     ; 58F0 _ .9...ir;

_gEfiPciIoProtocolGuid label byte
        db 00H, 0B2H, 0F5H, 4CH, 0B8H, 68H, 0A5H, 4CH   ; 58F8 _ ...L.h.L
        db 9EH, 0ECH, 0B2H, 3EH, 3FH, 50H, 02H, 9AH     ; 5900 _ ...>?P..

_gEfiGraphicsOutputProtocolGuid label byte
        db 0DEH, 0A9H, 42H, 90H, 0DCH, 23H, 38H, 4AH    ; 5908 _ ..B..#8J
        db 96H, 0FBH, 7AH, 0DEH, 0D0H, 80H, 51H, 6AH    ; 5910 _ ..z...Qj

_gEfiDriverBindingProtocolGuid label byte
        db 0ABH, 31H, 0A0H, 18H, 43H, 0B4H, 1AH, 4DH    ; 5918 _ .1..C..M
        db 0A5H, 0C0H, 0CH, 09H, 26H, 1EH, 9FH, 71H     ; 5920 _ ....&..q

_gEfiComponentNameProtocolGuid label byte
        db 2CH, 77H, 7AH, 10H, 0E1H, 0D5H, 0D4H, 11H    ; 5928 _ ,wz.....
        db 9AH, 46H, 00H, 90H, 27H, 3FH, 0C1H, 4DH      ; 5930 _ .F..'?.M

_gEfiComponentName2ProtocolGuid label byte
        db 0FFH, 5CH, 7AH, 6AH, 0D9H, 0E8H, 70H, 4FH    ; 5938 _ .\zj..pO
        db 0BAH, 0DAH, 75H, 0ABH, 30H, 25H, 0CEH, 14H   ; 5940 _ ..u.0%..

_gEfiLoadedImageProtocolGuid label byte
        db 0A1H, 31H, 1BH, 5BH, 62H, 95H, 0D2H, 11H     ; 5948 _ .1.[b...
        db 8EH, 3FH, 00H, 0A0H, 0C9H, 69H, 72H, 3BH     ; 5950 _ .?...ir;

__DATA.__data ENDS

__DATA.__common SEGMENT ALIGN(8) 'BSS'                  ; section number 8

_gImageHandle label qword
        dq      ?                                       ; 5958

_gST    label qword
        dq      ?                                       ; 5960

_gBS    label qword
        dq      ?                                       ; 5968

_gRT    label qword
        dq      ?                                       ; 5970

__DATA.__common ENDS

END