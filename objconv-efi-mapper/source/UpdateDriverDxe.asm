; Disassembly of file: 
; Tue Oct 25 09:41:16 2016
; Mode: 64 bits
; Syntax: MASM/ML64
; Instruction set: Pentium Pro, x64, privileged instructions
option dotname


_text   SEGMENT BYTE 'CODE'                             ; section number 1

?_001   LABEL NEAR
00000240        mov     qword ptr [?_888], rdx          ; 0240 _ 48: 89. 15, 0000AA59(rel)
00000247        mov     rax, qword ptr [rdx+60H]        ; 0247 _ 48: 8B. 42, 60
0000024B        mov     qword ptr [?_889], rax          ; 024B _ 48: 89. 05, 0000AA56(rel)
00000252        mov     rax, qword ptr [rdx+58H]        ; 0252 _ 48: 8B. 42, 58
00000256        mov     qword ptr [?_890], rax          ; 0256 _ 48: 89. 05, 0000AA53(rel)
0000025D        xor     eax, eax                        ; 025D _ 31. C0
0000025F        ret                                     ; 025F _ C3

?_002   LABEL NEAR
00000260        push    rbp                             ; 0260 _ 55
00000261        mov     rbp, rsp                        ; 0261 _ 48: 89. E5
00000264        sub     rsp, 32                         ; 0264 _ 48: 83. EC, 20
00000268        call    ?_001                           ; 0268 _ E8, FFFFFFD3
0000026D        test    rax, rax                        ; 026D _ 48: 85. C0
00000270        jns     ?_003                           ; 0270 _ 79, 06
00000272        add     rsp, 32                         ; 0272 _ 48: 83. C4, 20
00000276        pop     rbp                             ; 0276 _ 5D
00000277        ret                                     ; 0277 _ C3

?_003:
00000278        lea     rcx, ptr [?_816]                ; 0278 _ 48: 8D. 0D, 0000A12D(rel)
0000027F        lea     rdx, ptr [?_891]                ; 027F _ 48: 8D. 15, 0000AA32(rel)
00000286        add     rsp, 32                         ; 0286 _ 48: 83. C4, 20
0000028A        pop     rbp                             ; 028A _ 5D
0000028B        jmp     ?_004                           ; 028B _ E9, 00000000
; Note: Immediate operand could be made smaller by sign extension

?_004   LABEL NEAR
00000290        push    rbp                             ; 0290 _ 55
00000291        mov     rbp, rsp                        ; 0291 _ 48: 89. E5
00000294        push    r15                             ; 0294 _ 41: 57
00000296        push    r14                             ; 0296 _ 41: 56
00000298        push    rsi                             ; 0298 _ 56
00000299        push    rdi                             ; 0299 _ 57
0000029A        push    rbx                             ; 029A _ 53
0000029B        sub     rsp, 40                         ; 029B _ 48: 83. EC, 28
0000029F        mov     r14, rdx                        ; 029F _ 49: 89. D6
000002A2        mov     r15, rcx                        ; 02A2 _ 49: 89. CF
000002A5        mov     qword ptr [r14], 0              ; 02A5 _ 49: C7. 06, 00000000
000002AC        xor     edi, edi                        ; 02AC _ 31. FF
000002AE        mov     rbx, -1                         ; 02AE _ 48: C7. C3, FFFFFFFF
?_005:
000002B5        mov     rsi, rdi                        ; 02B5 _ 48: 89. FE
000002B8        inc     rbx                             ; 02B8 _ 48: FF. C3
000002BB        mov     rax, 0EH                        ; 02BB _ 48: B8, 800000000000000E
000002C5        mov     rcx, qword ptr [?_888]          ; 02C5 _ 48: 8B. 0D, 0000A9D4(rel)
000002CC        cmp     rbx, qword ptr [rcx+68H]        ; 02CC _ 48: 3B. 59, 68
000002D0        jnc     ?_006                           ; 02D0 _ 73, 2C
000002D2        lea     rdi, ptr [rsi+18H]              ; 02D2 _ 48: 8D. 7E, 18
000002D6        mov     rdx, qword ptr [rcx+70H]        ; 02D6 _ 48: 8B. 51, 70
000002DA        add     rdx, rsi                        ; 02DA _ 48: 01. F2
000002DD        mov     rcx, r15                        ; 02DD _ 4C: 89. F9
000002E0        call    ?_018                           ; 02E0 _ E8, 00000158
000002E5        test    al, al                          ; 02E5 _ 84. C0
000002E7        jz      ?_005                           ; 02E7 _ 74, CC
000002E9        mov     rax, qword ptr [?_888]          ; 02E9 _ 48: 8B. 05, 0000A9B0(rel)
000002F0        mov     rax, qword ptr [rax+70H]        ; 02F0 _ 48: 8B. 40, 70
000002F4        mov     rax, qword ptr [rax+rsi+10H]    ; 02F4 _ 48: 8B. 44 30, 10
000002F9        mov     qword ptr [r14], rax            ; 02F9 _ 49: 89. 06
000002FC        xor     eax, eax                        ; 02FC _ 31. C0
?_006:
000002FE        add     rsp, 40                         ; 02FE _ 48: 83. C4, 28
00000302        pop     rbx                             ; 0302 _ 5B
00000303        pop     rdi                             ; 0303 _ 5F
00000304        pop     rsi                             ; 0304 _ 5E
00000305        pop     r14                             ; 0305 _ 41: 5E
00000307        pop     r15                             ; 0307 _ 41: 5F
00000309        pop     rbp                             ; 0309 _ 5D
0000030A        ret                                     ; 030A _ C3

?_007   LABEL NEAR
0000030B        push    rbp                             ; 030B _ 55
0000030C        mov     rbp, rsp                        ; 030C _ 48: 89. E5
0000030F        sub     rsp, 48                         ; 030F _ 48: 83. EC, 30
00000313        mov     rax, rcx                        ; 0313 _ 48: 89. C8
00000316        mov     qword ptr [rbp-8H], 0           ; 0316 _ 48: C7. 45, F8, 00000000
0000031E        mov     r9, qword ptr [?_889]           ; 031E _ 4C: 8B. 0D, 0000A983(rel)
00000325        lea     r8, ptr [rbp-8H]                ; 0325 _ 4C: 8D. 45, F8
00000329        mov     ecx, 4                          ; 0329 _ B9, 00000004
0000032E        mov     rdx, rax                        ; 032E _ 48: 89. C2
00000331        call    qword ptr [r9+40H]              ; 0331 _ 41: FF. 51, 40
00000335        mov     rax, qword ptr [rbp-8H]         ; 0335 _ 48: 8B. 45, F8
00000339        add     rsp, 48                         ; 0339 _ 48: 83. C4, 30
0000033D        pop     rbp                             ; 033D _ 5D
0000033E        ret                                     ; 033E _ C3

?_008   LABEL NEAR
0000033F        push    rbp                             ; 033F _ 55
00000340        mov     rbp, rsp                        ; 0340 _ 48: 89. E5
00000343        push    rsi                             ; 0343 _ 56
00000344        push    rdi                             ; 0344 _ 57
00000345        sub     rsp, 48                         ; 0345 _ 48: 83. EC, 30
00000349        mov     rsi, rcx                        ; 0349 _ 48: 89. CE
0000034C        mov     qword ptr [rbp-18H], 0          ; 034C _ 48: C7. 45, E8, 00000000
00000354        mov     rax, qword ptr [?_889]          ; 0354 _ 48: 8B. 05, 0000A94D(rel)
0000035B        lea     r8, ptr [rbp-18H]               ; 035B _ 4C: 8D. 45, E8
0000035F        mov     ecx, 4                          ; 035F _ B9, 00000004
00000364        mov     rdx, rsi                        ; 0364 _ 48: 89. F2
00000367        call    qword ptr [rax+40H]             ; 0367 _ FF. 50, 40
0000036A        mov     rdi, qword ptr [rbp-18H]        ; 036A _ 48: 8B. 7D, E8
0000036E        test    rdi, rdi                        ; 036E _ 48: 85. FF
00000371        jz      ?_009                           ; 0371 _ 74, 16
00000373        mov     rax, qword ptr [?_889]          ; 0373 _ 48: 8B. 05, 0000A92E(rel)
0000037A        mov     rcx, rdi                        ; 037A _ 48: 89. F9
0000037D        mov     rdx, rsi                        ; 037D _ 48: 89. F2
00000380        xor     r8d, r8d                        ; 0380 _ 45: 31. C0
00000383        call    qword ptr [rax+168H]            ; 0383 _ FF. 90, 00000168
?_009:
00000389        mov     rax, rdi                        ; 0389 _ 48: 89. F8
0000038C        add     rsp, 48                         ; 038C _ 48: 83. C4, 30
00000390        pop     rdi                             ; 0390 _ 5F
00000391        pop     rsi                             ; 0391 _ 5E
00000392        pop     rbp                             ; 0392 _ 5D
00000393        ret                                     ; 0393 _ C3

?_010   LABEL NEAR
00000394        push    rbp                             ; 0394 _ 55
00000395        mov     rbp, rsp                        ; 0395 _ 48: 89. E5
00000398        push    rsi                             ; 0398 _ 56
00000399        push    rdi                             ; 0399 _ 57
0000039A        sub     rsp, 48                         ; 039A _ 48: 83. EC, 30
0000039E        mov     rsi, rdx                        ; 039E _ 48: 89. D6
000003A1        mov     rdi, rcx                        ; 03A1 _ 48: 89. CF
000003A4        mov     qword ptr [rbp-18H], 0          ; 03A4 _ 48: C7. 45, E8, 00000000
000003AC        mov     rax, qword ptr [?_889]          ; 03AC _ 48: 8B. 05, 0000A8F5(rel)
000003B3        lea     r8, ptr [rbp-18H]               ; 03B3 _ 4C: 8D. 45, E8
000003B7        mov     ecx, 4                          ; 03B7 _ B9, 00000004
000003BC        mov     rdx, rdi                        ; 03BC _ 48: 89. FA
000003BF        call    qword ptr [rax+40H]             ; 03BF _ FF. 50, 40
000003C2        mov     rcx, qword ptr [rbp-18H]        ; 03C2 _ 48: 8B. 4D, E8
000003C6        test    rcx, rcx                        ; 03C6 _ 48: 85. C9
000003C9        jnz     ?_011                           ; 03C9 _ 75, 04
000003CB        xor     eax, eax                        ; 03CB _ 31. C0
000003CD        jmp     ?_012                           ; 03CD _ EB, 17

?_011:
000003CF        mov     rax, qword ptr [?_889]          ; 03CF _ 48: 8B. 05, 0000A8D2(rel)
000003D6        mov     rdx, rsi                        ; 03D6 _ 48: 89. F2
000003D9        mov     r8, rdi                         ; 03D9 _ 49: 89. F8
000003DC        call    qword ptr [rax+160H]            ; 03DC _ FF. 90, 00000160
000003E2        mov     rax, qword ptr [rbp-18H]        ; 03E2 _ 48: 8B. 45, E8
?_012:
000003E6        add     rsp, 48                         ; 03E6 _ 48: 83. C4, 30
000003EA        pop     rdi                             ; 03EA _ 5F
000003EB        pop     rsi                             ; 03EB _ 5E
000003EC        pop     rbp                             ; 03EC _ 5D
000003ED        ret                                     ; 03ED _ C3

?_013   LABEL NEAR
000003EE        wbinvd                                  ; 03EE _ 0F 09
000003F0        ret                                     ; 03F0 _ C3

?_014   LABEL NEAR
000003F1        push    rbp                             ; 03F1 _ 55
000003F2        mov     rbp, rsp                        ; 03F2 _ 48: 89. E5
000003F5        push    rsi                             ; 03F5 _ 56
000003F6        push    rdi                             ; 03F6 _ 57
000003F7        sub     rsp, 32                         ; 03F7 _ 48: 83. EC, 20
000003FB        mov     rsi, rdx                        ; 03FB _ 48: 89. D6
000003FE        mov     rdi, rcx                        ; 03FE _ 48: 89. CF
00000401        jmp     ?_016                           ; 0401 _ EB, 07

?_015:
00000403        movzx   eax, word ptr [rsi+2H]          ; 0403 _ 0F B7. 46, 02
00000407        add     rsi, rax                        ; 0407 _ 48: 01. C6
?_016:
0000040A        mov     cx, word ptr [rsi]              ; 040A _ 66: 8B. 0E
0000040D        xor     eax, eax                        ; 040D _ 31. C0
0000040F        cmp     cx, -1                          ; 040F _ 66: 83. F9, FF
00000413        jz      ?_017                           ; 0413 _ 74, 20
00000415        cmp     cx, 4                           ; 0415 _ 66: 83. F9, 04
00000419        jnz     ?_015                           ; 0419 _ 75, E8
0000041B        xor     eax, eax                        ; 041B _ 31. C0
0000041D        test    rsi, rsi                        ; 041D _ 48: 85. F6
00000420        jz      ?_017                           ; 0420 _ 74, 13
00000422        lea     rdx, ptr [rsi+8H]               ; 0422 _ 48: 8D. 56, 08
00000426        mov     rcx, rdi                        ; 0426 _ 48: 89. F9
00000429        call    ?_018                           ; 0429 _ E8, 0000000F
0000042E        test    al, al                          ; 042E _ 84. C0
00000430        jz      ?_015                           ; 0430 _ 74, D1
00000432        mov     rax, rsi                        ; 0432 _ 48: 89. F0
?_017:
00000435        add     rsp, 32                         ; 0435 _ 48: 83. C4, 20
00000439        pop     rdi                             ; 0439 _ 5F
0000043A        pop     rsi                             ; 043A _ 5E
0000043B        pop     rbp                             ; 043B _ 5D
0000043C        ret                                     ; 043C _ C3

?_018   LABEL NEAR
0000043D        mov     r8, rdx                         ; 043D _ 49: 89. D0
00000440        xor     edx, edx                        ; 0440 _ 31. D2
00000442        xor     r9d, r9d                        ; 0442 _ 45: 31. C9
?_019:
00000445        mov     eax, dword ptr [rcx+rdx*4]      ; 0445 _ 8B. 04 91
00000448        sub     eax, dword ptr [r8+rdx*4]       ; 0448 _ 41: 2B. 04 90
0000044C        or      r9d, eax                        ; 044C _ 41: 09. C1
0000044F        inc     rdx                             ; 044F _ 48: FF. C2
00000452        cmp     rdx, 4                          ; 0452 _ 48: 83. FA, 04
00000456        jnz     ?_019                           ; 0456 _ 75, ED
00000458        test    r9d, r9d                        ; 0458 _ 45: 85. C9
0000045B        sete    al                              ; 045B _ 0F 94. C0
0000045E        movzx   eax, al                         ; 045E _ 0F B6. C0
00000461        ret                                     ; 0461 _ C3

?_020   LABEL NEAR
00000462        mov     r9, rdx                         ; 0462 _ 49: 89. D1
00000465        mov     r10, rcx                        ; 0465 _ 49: 89. CA
00000468        test    r10b, 7H                        ; 0468 _ 41: F6. C2, 07
0000046C        jz      ?_022                           ; 046C _ 74, 05
?_021:
0000046E        mov     rdx, r8                         ; 046E _ 4C: 89. C2
00000471        jmp     ?_024                           ; 0471 _ EB, 29

?_022:
00000473        test    r9b, 7H                         ; 0473 _ 41: F6. C1, 07
00000477        jnz     ?_021                           ; 0477 _ 75, F5
00000479        test    r8b, 7H                         ; 0479 _ 41: F6. C0, 07
0000047D        jnz     ?_021                           ; 047D _ 75, EF
0000047F        test    r8, r8                          ; 047F _ 4D: 85. C0
00000482        jz      ?_021                           ; 0482 _ 74, EA
00000484        xor     edx, edx                        ; 0484 _ 31. D2
?_023:
00000486        mov     rax, qword ptr [r10]            ; 0486 _ 49: 8B. 02
00000489        cmp     rax, qword ptr [r9]             ; 0489 _ 49: 3B. 01
0000048C        jnz     ?_021                           ; 048C _ 75, E0
0000048E        add     r9, 8                           ; 048E _ 49: 83. C1, 08
00000492        add     r10, 8                          ; 0492 _ 49: 83. C2, 08
00000496        add     r8, -8                          ; 0496 _ 49: 83. C0, F8
0000049A        jnz     ?_023                           ; 049A _ 75, EA
?_024:
0000049C        inc     rdx                             ; 049C _ 48: FF. C2
0000049F        jmp     ?_026                           ; 049F _ EB, 06

?_025:
000004A1        inc     r9                              ; 04A1 _ 49: FF. C1
000004A4        inc     r10                             ; 04A4 _ 49: FF. C2
?_026:
000004A7        xor     eax, eax                        ; 04A7 _ 31. C0
000004A9        dec     rdx                             ; 04A9 _ 48: FF. CA
000004AC        jz      ?_027                           ; 04AC _ 74, 0F
000004AE        movsx   rcx, byte ptr [r9]              ; 04AE _ 49: 0F BE. 09
000004B2        movsx   rax, byte ptr [r10]             ; 04B2 _ 49: 0F BE. 02
000004B6        cmp     al, cl                          ; 04B6 _ 38. C8
000004B8        jz      ?_025                           ; 04B8 _ 74, E7
000004BA        sub     rax, rcx                        ; 04BA _ 48: 29. C8
?_027:
000004BD        ret                                     ; 04BD _ C3

?_028   LABEL NEAR
000004BE        mov     rax, rcx                        ; 04BE _ 48: 89. C8
000004C1        mov     cl, byte ptr [rdx]              ; 04C1 _ 8A. 0A
000004C3        test    cl, cl                          ; 04C3 _ 84. C9
000004C5        jz      ?_030                           ; 04C5 _ 74, 11
000004C7        inc     rdx                             ; 04C7 _ 48: FF. C2
?_029:
000004CA        mov     byte ptr [rax], cl              ; 04CA _ 88. 08
000004CC        inc     rax                             ; 04CC _ 48: FF. C0
000004CF        mov     cl, byte ptr [rdx]              ; 04CF _ 8A. 0A
000004D1        inc     rdx                             ; 04D1 _ 48: FF. C2
000004D4        test    cl, cl                          ; 04D4 _ 84. C9
000004D6        jnz     ?_029                           ; 04D6 _ 75, F2
?_030:
000004D8        mov     byte ptr [rax], 0               ; 04D8 _ C6. 00, 00
000004DB        inc     rax                             ; 04DB _ 48: FF. C0
000004DE        ret                                     ; 04DE _ C3

?_031   LABEL NEAR
000004DF        mov     r8, rcx                         ; 04DF _ 49: 89. C8
000004E2        mov     ax, word ptr [r8]               ; 04E2 _ 66 41: 8B. 00
000004E6        test    ax, ax                          ; 04E6 _ 66: 85. C0
000004E9        je      ?_047                           ; 04E9 _ 0F 84, 000000DE
000004EF        cmp     ax, dx                          ; 04EF _ 66: 39. D0
000004F2        mov     r10, r8                         ; 04F2 _ 4D: 89. C2
000004F5        jnz     ?_034                           ; 04F5 _ 75, 27
000004F7        xor     ecx, ecx                        ; 04F7 _ 31. C9
?_032:
000004F9        mov     r9w, word ptr [r8+rcx+2H]       ; 04F9 _ 66 45: 8B. 4C 08, 02
000004FF        add     rcx, 2                          ; 04FF _ 48: 83. C1, 02
00000503        test    r9w, r9w                        ; 0503 _ 66 45: 85. C9
00000507        jz      ?_033                           ; 0507 _ 74, 06
00000509        cmp     r9w, dx                         ; 0509 _ 66 41: 39. D1
0000050D        jz      ?_032                           ; 050D _ 74, EA
?_033:
0000050F        lea     r10, ptr [r8+rcx]               ; 050F _ 4D: 8D. 14 08
00000513        test    rcx, rcx                        ; 0513 _ 48: 85. C9
00000516        jnz     ?_036                           ; 0516 _ 75, 17
00000518        test    r9w, r9w                        ; 0518 _ 66 45: 85. C9
0000051C        jz      ?_039                           ; 051C _ 74, 42
?_034:
0000051E        add     r10, 2                          ; 051E _ 49: 83. C2, 02
?_035:
00000522        cmp     word ptr [r10], 0               ; 0522 _ 66 41: 83. 3A, 00
00000527        lea     r10, ptr [r10+2H]               ; 0527 _ 4D: 8D. 52, 02
0000052B        jnz     ?_035                           ; 052B _ 75, F5
0000052D        jmp     ?_039                           ; 052D _ EB, 31

?_036:
0000052F        test    r9w, r9w                        ; 052F _ 66 45: 85. C9
00000533        mov     rax, r8                         ; 0533 _ 4C: 89. C0
00000536        jz      ?_038                           ; 0536 _ 74, 1F
00000538        mov     ecx, 2                          ; 0538 _ B9, 00000002
0000053D        mov     rax, r8                         ; 053D _ 4C: 89. C0
?_037:
00000540        mov     word ptr [rax], r9w             ; 0540 _ 66 44: 89. 08
00000544        mov     r9w, word ptr [r10+rcx]         ; 0544 _ 66 45: 8B. 0C 0A
00000549        add     rax, 2                          ; 0549 _ 48: 83. C0, 02
0000054D        add     rcx, 2                          ; 054D _ 48: 83. C1, 02
00000551        test    r9w, r9w                        ; 0551 _ 66 45: 85. C9
00000555        jnz     ?_037                           ; 0555 _ 75, E9
?_038:
00000557        mov     word ptr [rax], 0               ; 0557 _ 66: C7. 00, 0000
; Note: Length-changing prefix causes delay on Intel processors
0000055C        movzx   eax, word ptr [r8]              ; 055C _ 41: 0F B7. 00
?_039:
00000560        mov     r9, -1                          ; 0560 _ 49: C7. C1, FFFFFFFF
00000567        test    ax, ax                          ; 0567 _ 66: 85. C0
0000056A        jz      ?_041                           ; 056A _ 74, 17
0000056C        mov     rcx, -1                         ; 056C _ 48: C7. C1, FFFFFFFF
?_040:
00000573        lea     r9, ptr [rcx+1H]                ; 0573 _ 4C: 8D. 49, 01
00000577        cmp     word ptr [r8+rcx*2+4H], 0       ; 0577 _ 66 41: 83. 7C 48, 04, 00
0000057E        mov     rcx, r9                         ; 057E _ 4C: 89. C9
00000581        jnz     ?_040                           ; 0581 _ 75, F0
?_041:
00000583        add     r9, r9                          ; 0583 _ 4D: 01. C9
00000586        jmp     ?_043                           ; 0586 _ EB, 04

?_042:
00000588        add     r9, -2                          ; 0588 _ 49: 83. C1, FE
?_043:
0000058C        lea     rcx, ptr [r8+r9]                ; 058C _ 4B: 8D. 0C 08
00000590        cmp     rcx, r8                         ; 0590 _ 4C: 39. C1
00000593        jc      ?_044                           ; 0593 _ 72, 05
00000595        cmp     word ptr [rcx], dx              ; 0595 _ 66: 39. 11
00000598        jz      ?_042                           ; 0598 _ 74, EE
?_044:
0000059A        mov     rdx, -1                         ; 059A _ 48: C7. C2, FFFFFFFF
000005A1        test    ax, ax                          ; 05A1 _ 66: 85. C0
000005A4        jz      ?_046                           ; 05A4 _ 74, 17
000005A6        mov     rax, -1                         ; 05A6 _ 48: C7. C0, FFFFFFFF
?_045:
000005AD        lea     rdx, ptr [rax+1H]               ; 05AD _ 48: 8D. 50, 01
000005B1        cmp     word ptr [r8+rax*2+4H], 0       ; 05B1 _ 66 41: 83. 7C 40, 04, 00
000005B8        mov     rax, rdx                        ; 05B8 _ 48: 89. D0
000005BB        jnz     ?_045                           ; 05BB _ 75, F0
?_046:
000005BD        add     rdx, rdx                        ; 05BD _ 48: 01. D2
000005C0        cmp     rdx, r9                         ; 05C0 _ 4C: 39. CA
000005C3        jz      ?_047                           ; 05C3 _ 74, 08
000005C5        mov     word ptr [r8+r9+2H], 0          ; 05C5 _ 66 43: C7. 44 08, 02, 0000
; Note: Length-changing prefix causes delay on Intel processors
?_047:
000005CD        ret                                     ; 05CD _ C3

?_048   LABEL NEAR
000005CE        imul    rcx, rdx                        ; 05CE _ 48: 0F AF. CA
000005D2        mov     rax, rcx                        ; 05D2 _ 48: 89. C8
000005D5        ret                                     ; 05D5 _ C3

?_049   LABEL NEAR
000005D6        mov     r9, r8                          ; 05D6 _ 4D: 89. C1
000005D9        mov     r8, rdx                         ; 05D9 _ 49: 89. D0
000005DC        test    r9, r9                          ; 05DC _ 4D: 85. C9
000005DF        jz      ?_050                           ; 05DF _ 74, 0B
000005E1        mov     rax, rcx                        ; 05E1 _ 48: 89. C8
000005E4        xor     edx, edx                        ; 05E4 _ 31. D2
000005E6        div     r8                              ; 05E6 _ 49: F7. F0
000005E9        mov     qword ptr [r9], rdx             ; 05E9 _ 49: 89. 11
?_050:
000005EC        mov     rax, rcx                        ; 05EC _ 48: 89. C8
000005EF        xor     edx, edx                        ; 05EF _ 31. D2
000005F1        div     r8                              ; 05F1 _ 49: F7. F0
000005F4        ret                                     ; 05F4 _ C3

?_051   LABEL NEAR
000005F5        push    rbp                             ; 05F5 _ 55
000005F6        mov     rbp, rsp                        ; 05F6 _ 48: 89. E5
000005F9        push    r15                             ; 05F9 _ 41: 57
000005FB        push    r14                             ; 05FB _ 41: 56
000005FD        push    r13                             ; 05FD _ 41: 55
000005FF        push    r12                             ; 05FF _ 41: 54
00000601        push    rsi                             ; 0601 _ 56
00000602        push    rdi                             ; 0602 _ 57
00000603        push    rbx                             ; 0603 _ 53
00000604        sub     rsp, 72                         ; 0604 _ 48: 83. EC, 48
00000608        mov     r12, r9                         ; 0608 _ 4D: 89. CC
0000060B        mov     r13, r8                         ; 060B _ 4D: 89. C5
0000060E        mov     qword ptr [rbp-50H], rdx        ; 060E _ 48: 89. 55, B0
00000612        mov     esi, ecx                        ; 0612 _ 89. CE
00000614        mov     qword ptr [rbp-48H], 65535      ; 0614 _ 48: C7. 45, B8, 0000FFFF
0000061C        mov     rax, qword ptr [?_889]          ; 061C _ 48: 8B. 05, 0000A685(rel)
00000623        lea     rcx, ptr [?_825]                ; 0623 _ 48: 8D. 0D, 00009E12(rel)
0000062A        lea     r8, ptr [rbp-40H]               ; 062A _ 4C: 8D. 45, C0
0000062E        xor     edx, edx                        ; 062E _ 31. D2
00000630        call    qword ptr [rax+140H]            ; 0630 _ FF. 90, 00000140
00000636        test    rax, rax                        ; 0636 _ 48: 85. C0
00000639        js      ?_066                           ; 0639 _ 0F 88, 000001E5
0000063F        mov     rcx, qword ptr [rbp-48H]        ; 063F _ 48: 8B. 4D, B8
00000643        call    ?_008                           ; 0643 _ E8, FFFFFCF7
00000648        mov     r15, rax                        ; 0648 _ 49: 89. C7
0000064B        mov     rax, 9H                         ; 064B _ 48: B8, 8000000000000009
00000655        test    r15, r15                        ; 0655 _ 4D: 85. FF
00000658        je      ?_066                           ; 0658 _ 0F 84, 000001C6
0000065E        mov     rax, qword ptr [rbp-40H]        ; 065E _ 48: 8B. 45, C0
00000662        mov     qword ptr [rsp+20H], r15        ; 0662 _ 4C: 89. 7C 24, 20
00000667        movzx   esi, si                         ; 0667 _ 0F B7. F6
0000066A        lea     r9, ptr [rbp-48H]               ; 066A _ 4C: 8D. 4D, B8
0000066E        mov     rcx, rax                        ; 066E _ 48: 89. C1
00000671        mov     edx, esi                        ; 0671 _ 89. F2
00000673        xor     r8d, r8d                        ; 0673 _ 45: 31. C0
00000676        call    qword ptr [rax+68H]             ; 0676 _ FF. 50, 68
00000679        test    rax, rax                        ; 0679 _ 48: 85. C0
0000067C        jns     ?_052                           ; 067C _ 79, 44
0000067E        mov     rax, qword ptr [?_889]          ; 067E _ 48: 8B. 05, 0000A623(rel)
00000685        mov     rcx, r15                        ; 0685 _ 4C: 89. F9
00000688        call    qword ptr [rax+48H]             ; 0688 _ FF. 50, 48
0000068B        mov     rcx, qword ptr [rbp-48H]        ; 068B _ 48: 8B. 4D, B8
0000068F        call    ?_008                           ; 068F _ E8, FFFFFCAB
00000694        mov     r15, rax                        ; 0694 _ 49: 89. C7
00000697        mov     rax, 9H                         ; 0697 _ 48: B8, 8000000000000009
000006A1        test    r15, r15                        ; 06A1 _ 4D: 85. FF
000006A4        je      ?_066                           ; 06A4 _ 0F 84, 0000017A
000006AA        mov     rax, qword ptr [rbp-40H]        ; 06AA _ 48: 8B. 45, C0
000006AE        mov     qword ptr [rsp+20H], r15        ; 06AE _ 4C: 89. 7C 24, 20
000006B3        lea     r9, ptr [rbp-48H]               ; 06B3 _ 4C: 8D. 4D, B8
000006B7        mov     rcx, rax                        ; 06B7 _ 48: 89. C1
000006BA        mov     edx, esi                        ; 06BA _ 89. F2
000006BC        xor     r8d, r8d                        ; 06BC _ 45: 31. C0
000006BF        call    qword ptr [rax+68H]             ; 06BF _ FF. 50, 68
?_052:
000006C2        mov     al, byte ptr [r15+6H]           ; 06C2 _ 41: 8A. 47, 06
000006C6        lea     rbx, ptr [r15+6H]               ; 06C6 _ 49: 8D. 5F, 06
000006CA        xor     esi, esi                        ; 06CA _ 31. F6
000006CC        cmp     al, 13                          ; 06CC _ 3C, 0D
000006CE        jnz     ?_055                           ; 06CE _ 75, 47
000006D0        mov     rax, qword ptr [?_889]          ; 06D0 _ 48: 8B. 05, 0000A5D1(rel)
?_053:
000006D7        mov     rcx, r13                        ; 06D7 _ 4C: 89. E9
000006DA        mov     rdx, rsi                        ; 06DA _ 48: 89. F2
000006DD        xor     r8d, r8d                        ; 06DD _ 45: 31. C0
000006E0        call    qword ptr [rax+168H]            ; 06E0 _ FF. 90, 00000168
000006E6        mov     al, byte ptr [rbx]              ; 06E6 _ 8A. 03
000006E8        cmp     al, 13                          ; 06E8 _ 3C, 0D
000006EA        je      ?_065                           ; 06EA _ 0F 84, 0000011E
000006F0        xor     edi, edi                        ; 06F0 _ 31. FF
000006F2        lea     r12, ptr [?_067]                ; 06F2 _ 4C: 8D. 25, 0000013F(rel)
000006F9        mov     rcx, rdi                        ; 06F9 _ 48: 89. F9
?_054:
000006FC        mov     r14, rcx                        ; 06FC _ 49: 89. CE
000006FF        movzx   eax, al                         ; 06FF _ 0F B6. C0
00000702        add     eax, -5                         ; 0702 _ 83. C0, FB
00000705        cmp     eax, 4                          ; 0705 _ 83. F8, 04
00000708        ja      ?_064                           ; 0708 _ 0F 87, 000000EC
0000070E        movsxd  rax, dword ptr [r12+rax*4]      ; 070E _ 49: 63. 04 84
00000712        add     rax, r12                        ; 0712 _ 4C: 01. E0
00000715        jmp     rax                             ; 0715 _ FF. E0

?_055:
00000717        mov     r14d, 469762528                 ; 0717 _ 41: BE, 1C0001E0
0000071D        mov     rcx, rsi                        ; 071D _ 48: 89. F1
?_056:
00000720        mov     rdi, rcx                        ; 0720 _ 48: 89. CF
00000723        cmp     al, 28                          ; 0723 _ 3C, 1C
00000725        ja      ?_058                           ; 0725 _ 77, 45
00000727        movzx   eax, al                         ; 0727 _ 0F B6. C0
0000072A        bt      r14d, eax                       ; 072A _ 41: 0F A3. C6
0000072E        jc      ?_057                           ; 072E _ 72, 22
00000730        cmp     eax, 14                         ; 0730 _ 83. F8, 0E
00000733        jnz     ?_058                           ; 0733 _ 75, 37
00000735        lea     rdx, ptr [rdi+rbx+2H]           ; 0735 _ 48: 8D. 54 1F, 02
0000073A        mov     rax, qword ptr [?_889]          ; 073A _ 48: 8B. 05, 0000A567(rel)
00000741        mov     rcx, r12                        ; 0741 _ 4C: 89. E1
00000744        mov     r8d, 16                         ; 0744 _ 41: B8, 00000010
0000074A        call    qword ptr [rax+160H]            ; 074A _ FF. 90, 00000160
00000750        jmp     ?_058                           ; 0750 _ EB, 1A

?_057:
00000752        movzx   ecx, byte ptr [rdi+rbx+4H]      ; 0752 _ 0F B6. 4C 1F, 04
00000757        test    rcx, rcx                        ; 0757 _ 48: 85. C9
0000075A        jz      ?_058                           ; 075A _ 74, 10
0000075C        movzx   eax, word ptr [rdi+rbx+2H]      ; 075C _ 0F B7. 44 1F, 02
00000761        add     rax, rcx                        ; 0761 _ 48: 01. C8
00000764        cmp     rsi, rax                        ; 0764 _ 48: 39. C6
00000767        jnc     ?_058                           ; 0767 _ 73, 03
00000769        mov     rsi, rax                        ; 0769 _ 48: 89. C6
?_058:
0000076C        movzx   ecx, byte ptr [rdi+rbx+1H]      ; 076C _ 0F B6. 4C 1F, 01
00000771        add     rcx, rdi                        ; 0771 _ 48: 01. F9
00000774        mov     al, byte ptr [rbx+rcx]          ; 0774 _ 8A. 04 0B
00000777        cmp     al, 13                          ; 0777 _ 3C, 0D
00000779        jnz     ?_056                           ; 0779 _ 75, A5
0000077B        mov     rax, qword ptr [rbp-50H]        ; 077B _ 48: 8B. 45, B0
0000077F        movzx   ecx, word ptr [rax]             ; 077F _ 0F B7. 08
00000782        mov     rax, qword ptr [?_889]          ; 0782 _ 48: 8B. 05, 0000A51F(rel)
00000789        cmp     rsi, rcx                        ; 0789 _ 48: 39. CE
0000078C        jbe     ?_053                           ; 078C _ 0F 86, FFFFFF45
00000792        mov     rcx, r15                        ; 0792 _ 4C: 89. F9
00000795        call    qword ptr [rax+48H]             ; 0795 _ FF. 50, 48
00000798        mov     rax, qword ptr [rbp-50H]        ; 0798 _ 48: 8B. 45, B0
0000079C        mov     word ptr [rax], si              ; 079C _ 66: 89. 30
0000079F        mov     rax, 5H                         ; 079F _ 48: B8, 8000000000000005
000007A9        jmp     ?_066                           ; 07A9 _ EB, 79

?_059   LABEL NEAR
000007AB        movzx   edi, word ptr [r14+rbx+2H]      ; 07AB _ 41: 0F B7. 7C 1E, 02
000007B1        jmp     ?_064                           ; 07B1 _ EB, 47

?_060   LABEL NEAR
000007B3        test    byte ptr [r14+rbx+6H], 1H       ; 07B3 _ 41: F6. 44 1E, 06, 01
000007B9        jz      ?_064                           ; 07B9 _ 74, 3F
000007BB        lea     rcx, ptr [r13+rdi]              ; 07BB _ 49: 8D. 4C 3D, 00
000007C0        lea     rdx, ptr [r14+rbx+4H]           ; 07C0 _ 49: 8D. 54 1E, 04
000007C5        jmp     ?_063                           ; 07C5 _ EB, 20

?_061   LABEL NEAR
000007C7        movzx   eax, word ptr [r14+rbx+2H]      ; 07C7 _ 41: 0F B7. 44 1E, 02
000007CD        mov     cl, byte ptr [r14+rbx+9H]       ; 07CD _ 41: 8A. 4C 1E, 09
000007D2        mov     byte ptr [r13+rax], cl          ; 07D2 _ 41: 88. 4C 05, 00
000007D7        jmp     ?_064                           ; 07D7 _ EB, 21

?_062   LABEL NEAR
000007D9        lea     rdx, ptr [r14+rbx+12H]          ; 07D9 _ 49: 8D. 54 1E, 12
000007DE        movzx   ecx, word ptr [r14+rbx+2H]      ; 07DE _ 41: 0F B7. 4C 1E, 02
000007E4        add     rcx, r13                        ; 07E4 _ 4C: 01. E9
?_063:
000007E7        mov     rax, qword ptr [?_889]          ; 07E7 _ 48: 8B. 05, 0000A4BA(rel)
000007EE        mov     r8d, 2                          ; 07EE _ 41: B8, 00000002
000007F4        call    qword ptr [rax+160H]            ; 07F4 _ FF. 90, 00000160

?_064   LABEL NEAR
000007FA        movzx   ecx, byte ptr [r14+rbx+1H]      ; 07FA _ 41: 0F B6. 4C 1E, 01
00000800        add     rcx, r14                        ; 0800 _ 4C: 01. F1
00000803        mov     al, byte ptr [rbx+rcx]          ; 0803 _ 8A. 04 0B
00000806        cmp     al, 13                          ; 0806 _ 3C, 0D
00000808        jne     ?_054                           ; 0808 _ 0F 85, FFFFFEEE
?_065:
0000080E        mov     rax, qword ptr [rbp-50H]        ; 080E _ 48: 8B. 45, B0
00000812        mov     word ptr [rax], si              ; 0812 _ 66: 89. 30
00000815        mov     rax, qword ptr [?_889]          ; 0815 _ 48: 8B. 05, 0000A48C(rel)
0000081C        mov     rcx, r15                        ; 081C _ 4C: 89. F9
0000081F        call    qword ptr [rax+48H]             ; 081F _ FF. 50, 48
00000822        xor     eax, eax                        ; 0822 _ 31. C0
?_066:
00000824        add     rsp, 72                         ; 0824 _ 48: 83. C4, 48
00000828        pop     rbx                             ; 0828 _ 5B
00000829        pop     rdi                             ; 0829 _ 5F
0000082A        pop     rsi                             ; 082A _ 5E
0000082B        pop     r12                             ; 082B _ 41: 5C
0000082D        pop     r13                             ; 082D _ 41: 5D
0000082F        pop     r14                             ; 082F _ 41: 5E
00000831        pop     r15                             ; 0831 _ 41: 5F
00000833        pop     rbp                             ; 0833 _ 5D
00000834        ret                                     ; 0834 _ C3
; Filling space: 3H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 00H

ALIGN   8

?_067   label dword                                     ; switch/case jump table
        dd ?_059-?_067                                  ; 0838 _ FFFFFF73 dd ?_061-?_067; 083C _ FFFFFF8F dd ?_062-?_067; 0840 _ FFFFFFA1 dd ?_064-?_067; 0844 _ FFFFFFC2 dd ?_060-?_067; 0848 _ FFFFFF7B 

?_068   LABEL NEAR
0000084C        push    rbp                             ; 084C _ 55
0000084D        mov     rbp, rsp                        ; 084D _ 48: 89. E5
00000850        push    r15                             ; 0850 _ 41: 57
00000852        push    r14                             ; 0852 _ 41: 56
00000854        push    r13                             ; 0854 _ 41: 55
00000856        push    r12                             ; 0856 _ 41: 54
00000858        push    rsi                             ; 0858 _ 56
00000859        push    rdi                             ; 0859 _ 57
0000085A        push    rbx                             ; 085A _ 53
0000085B        sub     rsp, 72                         ; 085B _ 48: 83. EC, 48
0000085F        mov     r14, rdx                        ; 085F _ 49: 89. D6
00000862        mov     rsi, rcx                        ; 0862 _ 48: 89. CE
00000865        test    rsi, rsi                        ; 0865 _ 48: 85. F6
00000868        jz      ?_069                           ; 0868 _ 74, 0E
0000086A        mov     rax, qword ptr [rsi]            ; 086A _ 48: 8B. 06
0000086D        test    rax, rax                        ; 086D _ 48: 85. C0
00000870        jz      ?_069                           ; 0870 _ 74, 06
00000872        mov     qword ptr [rbp-58H], rax        ; 0872 _ 48: 89. 45, A8
00000876        jmp     ?_070                           ; 0876 _ EB, 32

?_069:
00000878        mov     rax, qword ptr [?_889]          ; 0878 _ 48: 8B. 05, 0000A429(rel)
0000087F        lea     rcx, ptr [?_825]                ; 087F _ 48: 8D. 0D, 00009BB6(rel)
00000886        lea     r8, ptr [rbp-58H]               ; 0886 _ 4C: 8D. 45, A8
0000088A        xor     edx, edx                        ; 088A _ 31. D2
0000088C        call    qword ptr [rax+140H]            ; 088C _ FF. 90, 00000140
00000892        xor     r13d, r13d                      ; 0892 _ 45: 31. ED
00000895        mov     rax, qword ptr [rbp-58H]        ; 0895 _ 48: 8B. 45, A8
00000899        test    rax, rax                        ; 0899 _ 48: 85. C0
0000089C        je      ?_075                           ; 089C _ 0F 84, 000000C5
000008A2        test    rsi, rsi                        ; 08A2 _ 48: 85. F6
000008A5        jz      ?_070                           ; 08A5 _ 74, 03
000008A7        mov     qword ptr [rsi], rax            ; 08A7 _ 48: 89. 06
?_070:
000008AA        mov     word ptr [rbp-3AH], 10          ; 08AA _ 66: C7. 45, C6, 000A
; Note: Length-changing prefix causes delay on Intel processors
000008B0        mov     ecx, 10                         ; 08B0 _ B9, 0000000A
000008B5        call    ?_007                           ; 08B5 _ E8, FFFFFA51
000008BA        mov     rdi, rax                        ; 08BA _ 48: 89. C7
000008BD        mov     rax, qword ptr [rbp-58H]        ; 08BD _ 48: 8B. 45, A8
000008C1        lea     rdx, ptr [rbp-3AH]              ; 08C1 _ 48: 8D. 55, C6
000008C5        mov     rcx, rax                        ; 08C5 _ 48: 89. C1
000008C8        mov     r8, rdi                         ; 08C8 _ 49: 89. F8
000008CB        call    qword ptr [rax+10H]             ; 08CB _ FF. 50, 10
000008CE        mov     rcx, 5H                         ; 08CE _ 48: B9, 8000000000000005
000008D8        cmp     rax, rcx                        ; 08D8 _ 48: 39. C8
000008DB        jnz     ?_071                           ; 08DB _ 75, 2A
000008DD        mov     rax, qword ptr [?_889]          ; 08DD _ 48: 8B. 05, 0000A3C4(rel)
000008E4        mov     rcx, rdi                        ; 08E4 _ 48: 89. F9
000008E7        call    qword ptr [rax+48H]             ; 08E7 _ FF. 50, 48
000008EA        movzx   ecx, word ptr [rbp-3AH]         ; 08EA _ 0F B7. 4D, C6
000008EE        call    ?_007                           ; 08EE _ E8, FFFFFA18
000008F3        mov     rdi, rax                        ; 08F3 _ 48: 89. C7
000008F6        lea     rdx, ptr [rbp-3AH]              ; 08F6 _ 48: 8D. 55, C6
000008FA        mov     rax, qword ptr [rbp-58H]        ; 08FA _ 48: 8B. 45, A8
000008FE        mov     rcx, rax                        ; 08FE _ 48: 89. C1
00000901        mov     r8, rdi                         ; 0901 _ 49: 89. F8
00000904        call    qword ptr [rax+10H]             ; 0904 _ FF. 50, 10
?_071:
00000907        xor     r13d, r13d                      ; 0907 _ 45: 31. ED
0000090A        test    rax, rax                        ; 090A _ 48: 85. C0
0000090D        js      ?_074                           ; 090D _ 78, 4B
0000090F        movzx   r15d, word ptr [rbp-3AH]        ; 090F _ 44: 0F B7. 7D, C6
00000914        shr     r15d, 1                         ; 0914 _ 41: D1. EF
00000917        xor     ebx, ebx                        ; 0917 _ 31. DB
00000919        lea     r12, ptr [rbp-5AH]              ; 0919 _ 4C: 8D. 65, A6
0000091D        lea     rsi, ptr [rbp-50H]              ; 091D _ 48: 8D. 75, B0
00000921        jmp     ?_073                           ; 0921 _ EB, 03

?_072:
00000923        inc     rbx                             ; 0923 _ 48: FF. C3
?_073:
00000926        xor     r13d, r13d                      ; 0926 _ 45: 31. ED
00000929        cmp     ebx, r15d                       ; 0929 _ 44: 39. FB
0000092C        jnc     ?_074                           ; 092C _ 73, 2C
0000092E        mov     word ptr [rbp-5AH], 0           ; 092E _ 66: C7. 45, A6, 0000
; Note: Length-changing prefix causes delay on Intel processors
00000934        movzx   ecx, word ptr [rdi+rbx*2]       ; 0934 _ 0F B7. 0C 5F
00000938        mov     rdx, r12                        ; 0938 _ 4C: 89. E2
0000093B        xor     r8d, r8d                        ; 093B _ 45: 31. C0
0000093E        mov     r9, rsi                         ; 093E _ 49: 89. F1
00000941        call    ?_051                           ; 0941 _ E8, FFFFFCAF
00000946        mov     rcx, rsi                        ; 0946 _ 48: 89. F1
00000949        mov     rdx, r14                        ; 0949 _ 4C: 89. F2
0000094C        call    ?_018                           ; 094C _ E8, FFFFFAEC
00000951        test    al, al                          ; 0951 _ 84. C0
00000953        jz      ?_072                           ; 0953 _ 74, CE
00000955        movzx   r13d, word ptr [rdi+rbx*2]      ; 0955 _ 44: 0F B7. 2C 5F
?_074:
0000095A        mov     rax, qword ptr [?_889]          ; 095A _ 48: 8B. 05, 0000A347(rel)
00000961        mov     rcx, rdi                        ; 0961 _ 48: 89. F9
00000964        call    qword ptr [rax+48H]             ; 0964 _ FF. 50, 48
?_075:
00000967        movzx   eax, r13w                       ; 0967 _ 41: 0F B7. C5
0000096B        add     rsp, 72                         ; 096B _ 48: 83. C4, 48
0000096F        pop     rbx                             ; 096F _ 5B
00000970        pop     rdi                             ; 0970 _ 5F
00000971        pop     rsi                             ; 0971 _ 5E
00000972        pop     r12                             ; 0972 _ 41: 5C
00000974        pop     r13                             ; 0974 _ 41: 5D
00000976        pop     r14                             ; 0976 _ 41: 5E
00000978        pop     r15                             ; 0978 _ 41: 5F
0000097A        pop     rbp                             ; 097A _ 5D
0000097B        ret                                     ; 097B _ C3

?_076   LABEL NEAR
0000097C        push    rbp                             ; 097C _ 55
0000097D        mov     rbp, rsp                        ; 097D _ 48: 89. E5
00000980        sub     rsp, 48                         ; 0980 _ 48: 83. EC, 30
00000984        cmp     qword ptr [?_865], 0            ; 0984 _ 48: 83. 3D, 0000A274(rel), 00
0000098C        jnz     ?_077                           ; 098C _ 75, 22
0000098E        mov     rax, qword ptr [?_889]          ; 098E _ 48: 8B. 05, 0000A313(rel)
00000995        lea     rcx, ptr [?_848]                ; 0995 _ 48: 8D. 0D, 00009C04(rel)
0000099C        lea     r8, ptr [?_865]                 ; 099C _ 4C: 8D. 05, 0000A25D(rel)
000009A3        xor     edx, edx                        ; 09A3 _ 31. D2
000009A5        call    qword ptr [rax+140H]            ; 09A5 _ FF. 90, 00000140
000009AB        test    rax, rax                        ; 09AB _ 48: 85. C0
000009AE        jnz     ?_078                           ; 09AE _ 75, 6D
?_077:
000009B0        mov     rax, qword ptr [?_890]          ; 09B0 _ 48: 8B. 05, 0000A2F9(rel)
000009B7        lea     rcx, ptr [rbp-10H]              ; 09B7 _ 48: 8D. 4D, F0
000009BB        xor     edx, edx                        ; 09BB _ 31. D2
000009BD        call    qword ptr [rax+18H]             ; 09BD _ FF. 50, 18
000009C0        test    rax, rax                        ; 09C0 _ 48: 85. C0
000009C3        jnz     ?_078                           ; 09C3 _ 75, 58
000009C5        lea     rax, ptr [?_866]                ; 09C5 _ 48: 8D. 05, 0000A23C(rel)
000009CC        movzx   ecx, byte ptr [rbp-0AH]         ; 09CC _ 0F B6. 4D, F6
000009D0        add     rcx, rax                        ; 09D0 _ 48: 01. C1
000009D3        movzx   eax, byte ptr [rbp-0BH]         ; 09D3 _ 0F B6. 45, F5
000009D7        imul    rax, rax, 60                    ; 09D7 _ 48: 6B. C0, 3C
000009DB        add     rax, rcx                        ; 09DB _ 48: 01. C8
000009DE        movzx   ecx, byte ptr [rbp-0CH]         ; 09DE _ 0F B6. 4D, F4
000009E2        imul    rcx, rcx, 3600                  ; 09E2 _ 48: 69. C9, 00000E10
000009E9        add     rcx, rax                        ; 09E9 _ 48: 01. C1
000009EC        mov     qword ptr [?_866], rcx          ; 09EC _ 48: 89. 0D, 0000A215(rel)
000009F3        lea     rax, ptr [?_076]                ; 09F3 _ 48: 8D. 05, FFFFFF82(rel)
000009FA        mov     edx, eax                        ; 09FA _ 89. C2
000009FC        call    ?_048                           ; 09FC _ E8, FFFFFBCD
00000A01        lea     rdx, ptr [?_867]                ; 0A01 _ 48: 8D. 15, 0000A208(rel)
00000A08        mov     qword ptr [?_866], rax          ; 0A08 _ 48: 89. 05, 0000A1F9(rel)
00000A0F        mov     r8, qword ptr [?_865]           ; 0A0F _ 4C: 8B. 05, 0000A1EA(rel)
00000A16        mov     rcx, rax                        ; 0A16 _ 48: 89. C1
00000A19        call    qword ptr [r8+8H]               ; 0A19 _ 41: FF. 50, 08
?_078:
00000A1D        add     rsp, 48                         ; 0A1D _ 48: 83. C4, 30
00000A21        pop     rbp                             ; 0A21 _ 5D
00000A22        ret                                     ; 0A22 _ C3

?_079   LABEL NEAR
00000A23        mov     r8, rcx                         ; 0A23 _ 49: 89. C8
00000A26        mov     rcx, 13H                        ; 0A26 _ 48: B9, 8000000000000013
00000A30        mov     rax, qword ptr [?_865]          ; 0A30 _ 48: 8B. 05, 0000A1C9(rel)
00000A37        test    rax, rax                        ; 0A37 _ 48: 85. C0
00000A3A        jz      ?_080                           ; 0A3A _ 74, 25
00000A3C        mov     rcx, 13H                        ; 0A3C _ 48: B9, 8000000000000013
00000A46        mov     rdx, qword ptr [?_867]          ; 0A46 _ 48: 8B. 15, 0000A1C3(rel)
00000A4D        test    rdx, rdx                        ; 0A4D _ 48: 85. D2
00000A50        jz      ?_080                           ; 0A50 _ 74, 0F
00000A52        mov     rcx, 2H                         ; 0A52 _ 48: B9, 8000000000000002
00000A5C        test    r8, r8                          ; 0A5C _ 4D: 85. C0
00000A5F        jnz     ?_081                           ; 0A5F _ 75, 04
?_080:
00000A61        mov     rax, rcx                        ; 0A61 _ 48: 89. C8
00000A64        ret                                     ; 0A64 _ C3

?_081:
00000A65        mov     rax, qword ptr [rax+20H]        ; 0A65 _ 48: 8B. 40, 20
00000A69        mov     rcx, rdx                        ; 0A69 _ 48: 89. D1
00000A6C        mov     rdx, r8                         ; 0A6C _ 4C: 89. C2
00000A6F        jmp     rax                             ; 0A6F _ FF. E0

?_082   LABEL NEAR
00000A71        mov     rax, qword ptr [?_865]          ; 0A71 _ 48: 8B. 05, 0000A188(rel)
00000A78        test    rax, rax                        ; 0A78 _ 48: 85. C0
00000A7B        jnz     ?_083                           ; 0A7B _ 75, 0B
00000A7D        mov     rax, 13H                        ; 0A7D _ 48: B8, 8000000000000013
00000A87        ret                                     ; 0A87 _ C3

?_083:
00000A88        mov     rax, qword ptr [rax+28H]        ; 0A88 _ 48: 8B. 40, 28
00000A8C        mov     rax, qword ptr [rax+8H]         ; 0A8C _ 48: 8B. 40, 08
00000A90        jmp     rax                             ; 0A90 _ FF. E0

?_084   LABEL NEAR
00000A92        mov     r9, r8                          ; 0A92 _ 4D: 89. C1
00000A95        mov     r8, rdx                         ; 0A95 _ 49: 89. D0
00000A98        mov     rdx, rcx                        ; 0A98 _ 48: 89. CA
00000A9B        mov     rax, qword ptr [?_865]          ; 0A9B _ 48: 8B. 05, 0000A15E(rel)
00000AA2        test    rax, rax                        ; 0AA2 _ 48: 85. C0
00000AA5        jz      ?_085                           ; 0AA5 _ 74, 0C
00000AA7        mov     rcx, qword ptr [?_867]          ; 0AA7 _ 48: 8B. 0D, 0000A162(rel)
00000AAE        test    rcx, rcx                        ; 0AAE _ 48: 85. C9
00000AB1        jnz     ?_086                           ; 0AB1 _ 75, 0B
?_085:
00000AB3        mov     rax, 13H                        ; 0AB3 _ 48: B8, 8000000000000013
00000ABD        ret                                     ; 0ABD _ C3

?_086:
00000ABE        mov     rax, qword ptr [rax+28H]        ; 0ABE _ 48: 8B. 40, 28
00000AC2        mov     rax, qword ptr [rax+10H]        ; 0AC2 _ 48: 8B. 40, 10
00000AC6        jmp     rax                             ; 0AC6 _ FF. E0

?_087   LABEL NEAR
00000AC8        mov     rax, qword ptr [?_865]          ; 0AC8 _ 48: 8B. 05, 0000A131(rel)
00000ACF        test    rax, rax                        ; 0ACF _ 48: 85. C0
00000AD2        jnz     ?_088                           ; 0AD2 _ 75, 0B
00000AD4        mov     rax, 13H                        ; 0AD4 _ 48: B8, 8000000000000013
00000ADE        ret                                     ; 0ADE _ C3

?_088:
00000ADF        mov     rax, qword ptr [rax+28H]        ; 0ADF _ 48: 8B. 40, 28
00000AE3        jmp     qword ptr [rax+30H]             ; 0AE3 _ FF. 60, 30

?_089   LABEL NEAR
00000AE6        mov     rax, qword ptr [?_865]          ; 0AE6 _ 48: 8B. 05, 0000A113(rel)
00000AED        test    rax, rax                        ; 0AED _ 48: 85. C0
00000AF0        jnz     ?_090                           ; 0AF0 _ 75, 0B
00000AF2        mov     rax, 13H                        ; 0AF2 _ 48: B8, 8000000000000013
00000AFC        ret                                     ; 0AFC _ C3

?_090:
00000AFD        mov     rax, qword ptr [rax+28H]        ; 0AFD _ 48: 8B. 40, 28
00000B01        mov     rax, qword ptr [rax+60H]        ; 0B01 _ 48: 8B. 40, 60
00000B05        jmp     rax                             ; 0B05 _ FF. E0

?_091   LABEL NEAR
00000B07        mov     rax, qword ptr [?_865]          ; 0B07 _ 48: 8B. 05, 0000A0F2(rel)
00000B0E        test    rax, rax                        ; 0B0E _ 48: 85. C0
00000B11        jnz     ?_092                           ; 0B11 _ 75, 0B
00000B13        mov     rax, 13H                        ; 0B13 _ 48: B8, 8000000000000013
00000B1D        ret                                     ; 0B1D _ C3

?_092:
00000B1E        mov     rax, qword ptr [rax+28H]        ; 0B1E _ 48: 8B. 40, 28
00000B22        jmp     qword ptr [rax+90H]             ; 0B22 _ FF. A0, 00000090

?_093   LABEL NEAR
00000B28        mov     rax, qword ptr [?_865]          ; 0B28 _ 48: 8B. 05, 0000A0D1(rel)
00000B2F        test    rax, rax                        ; 0B2F _ 48: 85. C0
00000B32        jnz     ?_094                           ; 0B32 _ 75, 0B
00000B34        mov     rax, 13H                        ; 0B34 _ 48: B8, 8000000000000013
00000B3E        ret                                     ; 0B3E _ C3

?_094:
00000B3F        mov     rax, qword ptr [rax+28H]        ; 0B3F _ 48: 8B. 40, 28
00000B43        mov     rax, qword ptr [rax+98H]        ; 0B43 _ 48: 8B. 80, 00000098
00000B4A        jmp     rax                             ; 0B4A _ FF. E0

?_095   LABEL NEAR
00000B4C        mov     rax, qword ptr [?_865]          ; 0B4C _ 48: 8B. 05, 0000A0AD(rel)
00000B53        test    rax, rax                        ; 0B53 _ 48: 85. C0
00000B56        jnz     ?_096                           ; 0B56 _ 75, 0B
00000B58        mov     rax, 13H                        ; 0B58 _ 48: B8, 8000000000000013
00000B62        ret                                     ; 0B62 _ C3

?_096:
00000B63        mov     rax, qword ptr [rax+28H]        ; 0B63 _ 48: 8B. 40, 28
00000B67        mov     rax, qword ptr [rax+0E0H]       ; 0B67 _ 48: 8B. 80, 000000E0
00000B6E        jmp     rax                             ; 0B6E _ FF. E0

?_097   LABEL NEAR
00000B70        mov     rax, qword ptr [?_865]          ; 0B70 _ 48: 8B. 05, 0000A089(rel)
00000B77        test    rax, rax                        ; 0B77 _ 48: 85. C0
00000B7A        jnz     ?_098                           ; 0B7A _ 75, 0B
00000B7C        mov     rax, 13H                        ; 0B7C _ 48: B8, 8000000000000013
00000B86        ret                                     ; 0B86 _ C3

?_098:
00000B87        mov     rax, qword ptr [rax+30H]        ; 0B87 _ 48: 8B. 40, 30
00000B8B        mov     rax, qword ptr [rax+8H]         ; 0B8B _ 48: 8B. 40, 08
00000B8F        jmp     rax                             ; 0B8F _ FF. E0

?_099   LABEL NEAR
00000B91        mov     rax, qword ptr [?_865]          ; 0B91 _ 48: 8B. 05, 0000A068(rel)
00000B98        test    rax, rax                        ; 0B98 _ 48: 85. C0
00000B9B        jnz     ?_100                           ; 0B9B _ 75, 0B
00000B9D        mov     rax, 13H                        ; 0B9D _ 48: B8, 8000000000000013
00000BA7        ret                                     ; 0BA7 _ C3

?_100:
00000BA8        mov     rax, qword ptr [rax+30H]        ; 0BA8 _ 48: 8B. 40, 30
00000BAC        jmp     qword ptr [rax+10H]             ; 0BAC _ FF. 60, 10

?_101   LABEL NEAR
00000BAF        mov     rax, qword ptr [?_865]          ; 0BAF _ 48: 8B. 05, 0000A04A(rel)
00000BB6        test    rax, rax                        ; 0BB6 _ 48: 85. C0
00000BB9        jnz     ?_102                           ; 0BB9 _ 75, 0B
00000BBB        mov     rax, 13H                        ; 0BBB _ 48: B8, 8000000000000013
00000BC5        ret                                     ; 0BC5 _ C3

?_102:
00000BC6        mov     rax, qword ptr [rax+30H]        ; 0BC6 _ 48: 8B. 40, 30
00000BCA        mov     rax, qword ptr [rax+18H]        ; 0BCA _ 48: 8B. 40, 18
00000BCE        jmp     rax                             ; 0BCE _ FF. E0

?_103   LABEL NEAR
00000BD0        mov     rax, qword ptr [?_865]          ; 0BD0 _ 48: 8B. 05, 0000A029(rel)
00000BD7        test    rax, rax                        ; 0BD7 _ 48: 85. C0
00000BDA        jnz     ?_104                           ; 0BDA _ 75, 0B
00000BDC        mov     rax, 13H                        ; 0BDC _ 48: B8, 8000000000000013
00000BE6        ret                                     ; 0BE6 _ C3

?_104:
00000BE7        mov     rax, qword ptr [rax+30H]        ; 0BE7 _ 48: 8B. 40, 30
00000BEB        jmp     qword ptr [rax+48H]             ; 0BEB _ FF. 60, 48

?_105   LABEL NEAR
00000BEE        push    rbp                             ; 0BEE _ 55
00000BEF        mov     rbp, rsp                        ; 0BEF _ 48: 89. E5
00000BF2        sub     rsp, 48                         ; 0BF2 _ 48: 83. EC, 30
00000BF6        mov     r10, r9                         ; 0BF6 _ 4D: 89. CA
00000BF9        mov     r9, r8                          ; 0BF9 _ 4D: 89. C1
00000BFC        mov     r8, rdx                         ; 0BFC _ 49: 89. D0
00000BFF        mov     rdx, rcx                        ; 0BFF _ 48: 89. CA
00000C02        mov     rax, qword ptr [?_865]          ; 0C02 _ 48: 8B. 05, 00009FF7(rel)
00000C09        test    rax, rax                        ; 0C09 _ 48: 85. C0
00000C0C        jz      ?_106                           ; 0C0C _ 74, 1A
00000C0E        mov     rcx, qword ptr [?_867]          ; 0C0E _ 48: 8B. 0D, 00009FFB(rel)
00000C15        test    rcx, rcx                        ; 0C15 _ 48: 85. C9
00000C18        jz      ?_106                           ; 0C18 _ 74, 0E
00000C1A        mov     rax, qword ptr [rax+48H]        ; 0C1A _ 48: 8B. 40, 48
00000C1E        mov     qword ptr [rsp+20H], r10        ; 0C1E _ 4C: 89. 54 24, 20
00000C23        call    qword ptr [rax+8H]              ; 0C23 _ FF. 50, 08
00000C26        jmp     ?_107                           ; 0C26 _ EB, 0A

?_106:
00000C28        mov     rax, 13H                        ; 0C28 _ 48: B8, 8000000000000013
?_107:
00000C32        add     rsp, 48                         ; 0C32 _ 48: 83. C4, 30
00000C36        pop     rbp                             ; 0C36 _ 5D
00000C37        ret                                     ; 0C37 _ C3

?_108   LABEL NEAR
00000C38        mov     r8, rdx                         ; 0C38 _ 49: 89. D0
00000C3B        mov     rdx, rcx                        ; 0C3B _ 48: 89. CA
00000C3E        mov     rax, qword ptr [?_865]          ; 0C3E _ 48: 8B. 05, 00009FBB(rel)
00000C45        test    rax, rax                        ; 0C45 _ 48: 85. C0
00000C48        jz      ?_109                           ; 0C48 _ 74, 0C
00000C4A        mov     rcx, qword ptr [?_867]          ; 0C4A _ 48: 8B. 0D, 00009FBF(rel)
00000C51        test    rcx, rcx                        ; 0C51 _ 48: 85. C9
00000C54        jnz     ?_110                           ; 0C54 _ 75, 0B
?_109:
00000C56        mov     rax, 13H                        ; 0C56 _ 48: B8, 8000000000000013
00000C60        ret                                     ; 0C60 _ C3

?_110:
00000C61        mov     rax, qword ptr [rax+48H]        ; 0C61 _ 48: 8B. 40, 48
00000C65        mov     rax, qword ptr [rax+40H]        ; 0C65 _ 48: 8B. 40, 40
00000C69        jmp     rax                             ; 0C69 _ FF. E0

?_111   LABEL NEAR
00000C6B        push    rbp                             ; 0C6B _ 55
00000C6C        mov     rbp, rsp                        ; 0C6C _ 48: 89. E5
00000C6F        push    rsi                             ; 0C6F _ 56
00000C70        push    rdi                             ; 0C70 _ 57
00000C71        push    rbx                             ; 0C71 _ 53
00000C72        sub     rsp, 40                         ; 0C72 _ 48: 83. EC, 28
00000C76        mov     rsi, r8                         ; 0C76 _ 4C: 89. C6
00000C79        mov     rdi, rdx                        ; 0C79 _ 48: 89. D7
00000C7C        mov     rbx, rcx                        ; 0C7C _ 48: 89. CB
00000C7F        mov     rax, qword ptr [?_865]          ; 0C7F _ 48: 8B. 05, 00009F7A(rel)
00000C86        test    rax, rax                        ; 0C86 _ 48: 85. C0
00000C89        jnz     ?_112                           ; 0C89 _ 75, 29
00000C8B        mov     rax, qword ptr [?_889]          ; 0C8B _ 48: 8B. 05, 0000A016(rel)
00000C92        lea     rcx, ptr [?_848]                ; 0C92 _ 48: 8D. 0D, 00009907(rel)
00000C99        lea     r8, ptr [?_865]                 ; 0C99 _ 4C: 8D. 05, 00009F60(rel)
00000CA0        xor     edx, edx                        ; 0CA0 _ 31. D2
00000CA2        call    qword ptr [rax+140H]            ; 0CA2 _ FF. 90, 00000140
00000CA8        test    rax, rax                        ; 0CA8 _ 48: 85. C0
00000CAB        jnz     ?_113                           ; 0CAB _ 75, 22
00000CAD        mov     rax, qword ptr [?_865]          ; 0CAD _ 48: 8B. 05, 00009F4C(rel)
?_112:
00000CB4        mov     rax, qword ptr [rax+50H]        ; 0CB4 _ 48: 8B. 40, 50
00000CB8        mov     rax, qword ptr [rax+48H]        ; 0CB8 _ 48: 8B. 40, 48
00000CBC        mov     rcx, rbx                        ; 0CBC _ 48: 89. D9
00000CBF        mov     rdx, rdi                        ; 0CBF _ 48: 89. FA
00000CC2        mov     r8, rsi                         ; 0CC2 _ 49: 89. F0
00000CC5        add     rsp, 40                         ; 0CC5 _ 48: 83. C4, 28
00000CC9        pop     rbx                             ; 0CC9 _ 5B
00000CCA        pop     rdi                             ; 0CCA _ 5F
00000CCB        pop     rsi                             ; 0CCB _ 5E
00000CCC        pop     rbp                             ; 0CCC _ 5D
00000CCD        jmp     rax                             ; 0CCD _ FF. E0

?_113:
00000CCF        add     rsp, 40                         ; 0CCF _ 48: 83. C4, 28
00000CD3        pop     rbx                             ; 0CD3 _ 5B
00000CD4        pop     rdi                             ; 0CD4 _ 5F
00000CD5        pop     rsi                             ; 0CD5 _ 5E
00000CD6        pop     rbp                             ; 0CD6 _ 5D
00000CD7        ret                                     ; 0CD7 _ C3

?_114   LABEL NEAR
00000CD8        push    rbp                             ; 0CD8 _ 55
00000CD9        mov     rbp, rsp                        ; 0CD9 _ 48: 89. E5
00000CDC        push    r14                             ; 0CDC _ 41: 56
00000CDE        push    rsi                             ; 0CDE _ 56
00000CDF        push    rdi                             ; 0CDF _ 57
00000CE0        push    rbx                             ; 0CE0 _ 53
00000CE1        sub     rsp, 32                         ; 0CE1 _ 48: 83. EC, 20
00000CE5        mov     r14d, r9d                       ; 0CE5 _ 45: 89. CE
00000CE8        mov     edi, r8d                        ; 0CE8 _ 44: 89. C7
00000CEB        mov     esi, edx                        ; 0CEB _ 89. D6
00000CED        mov     rbx, rcx                        ; 0CED _ 48: 89. CB
00000CF0        mov     rax, qword ptr [?_865]          ; 0CF0 _ 48: 8B. 05, 00009F09(rel)
00000CF7        test    rax, rax                        ; 0CF7 _ 48: 85. C0
00000CFA        jnz     ?_115                           ; 0CFA _ 75, 29
00000CFC        mov     rax, qword ptr [?_889]          ; 0CFC _ 48: 8B. 05, 00009FA5(rel)
00000D03        lea     rcx, ptr [?_848]                ; 0D03 _ 48: 8D. 0D, 00009896(rel)
00000D0A        lea     r8, ptr [?_865]                 ; 0D0A _ 4C: 8D. 05, 00009EEF(rel)
00000D11        xor     edx, edx                        ; 0D11 _ 31. D2
00000D13        call    qword ptr [rax+140H]            ; 0D13 _ FF. 90, 00000140
00000D19        test    rax, rax                        ; 0D19 _ 48: 85. C0
00000D1C        jnz     ?_116                           ; 0D1C _ 75, 2A
00000D1E        mov     rax, qword ptr [?_865]          ; 0D1E _ 48: 8B. 05, 00009EDB(rel)
?_115:
00000D25        mov     rax, qword ptr [rax+50H]        ; 0D25 _ 48: 8B. 40, 50
00000D29        mov     rax, qword ptr [rax+70H]        ; 0D29 _ 48: 8B. 40, 70
00000D2D        movzx   edx, sil                        ; 0D2D _ 40: 0F B6. D6
00000D31        movzx   r8d, dil                        ; 0D31 _ 44: 0F B6. C7
00000D35        movzx   r9d, r14b                       ; 0D35 _ 45: 0F B6. CE
00000D39        mov     rcx, rbx                        ; 0D39 _ 48: 89. D9
00000D3C        add     rsp, 32                         ; 0D3C _ 48: 83. C4, 20
00000D40        pop     rbx                             ; 0D40 _ 5B
00000D41        pop     rdi                             ; 0D41 _ 5F
00000D42        pop     rsi                             ; 0D42 _ 5E
00000D43        pop     r14                             ; 0D43 _ 41: 5E
00000D45        pop     rbp                             ; 0D45 _ 5D
00000D46        jmp     rax                             ; 0D46 _ FF. E0

?_116:
00000D48        add     rsp, 32                         ; 0D48 _ 48: 83. C4, 20
00000D4C        pop     rbx                             ; 0D4C _ 5B
00000D4D        pop     rdi                             ; 0D4D _ 5F
00000D4E        pop     rsi                             ; 0D4E _ 5E
00000D4F        pop     r14                             ; 0D4F _ 41: 5E
00000D51        pop     rbp                             ; 0D51 _ 5D
00000D52        ret                                     ; 0D52 _ C3

?_117   LABEL NEAR
00000D53        mov     rax, qword ptr [?_865]          ; 0D53 _ 48: 8B. 05, 00009EA6(rel)
00000D5A        test    rax, rax                        ; 0D5A _ 48: 85. C0
00000D5D        jnz     ?_118                           ; 0D5D _ 75, 0B
00000D5F        mov     rax, 13H                        ; 0D5F _ 48: B8, 8000000000000013
00000D69        ret                                     ; 0D69 _ C3

?_118:
00000D6A        mov     rax, qword ptr [rax+58H]        ; 0D6A _ 48: 8B. 40, 58
00000D6E        mov     rax, qword ptr [rax+18H]        ; 0D6E _ 48: 8B. 40, 18
00000D72        jmp     rax                             ; 0D72 _ FF. E0

?_119   LABEL NEAR
00000D74        push    rbp                             ; 0D74 _ 55
00000D75        mov     rbp, rsp                        ; 0D75 _ 48: 89. E5
00000D78        push    r15                             ; 0D78 _ 41: 57
00000D7A        push    r14                             ; 0D7A _ 41: 56
00000D7C        push    rsi                             ; 0D7C _ 56
00000D7D        push    rdi                             ; 0D7D _ 57
00000D7E        push    rbx                             ; 0D7E _ 53
00000D7F        sub     rsp, 40                         ; 0D7F _ 48: 83. EC, 28
00000D83        mov     r14, r9                         ; 0D83 _ 4D: 89. CE
00000D86        mov     r15, r8                         ; 0D86 _ 4D: 89. C7
00000D89        mov     rbx, rdx                        ; 0D89 _ 48: 89. D3
00000D8C        mov     rsi, rcx                        ; 0D8C _ 48: 89. CE
00000D8F        mov     rax, qword ptr [?_889]          ; 0D8F _ 48: 8B. 05, 00009F12(rel)
00000D96        lea     rcx, ptr [?_819]                ; 0D96 _ 48: 8D. 0D, 0000963F(rel)
00000D9D        xor     edi, edi                        ; 0D9D _ 31. FF
00000D9F        lea     r8, ptr [rbp-30H]               ; 0D9F _ 4C: 8D. 45, D0
00000DA3        xor     edx, edx                        ; 0DA3 _ 31. D2
00000DA5        call    qword ptr [rax+140H]            ; 0DA5 _ FF. 90, 00000140
00000DAB        test    rax, rax                        ; 0DAB _ 48: 85. C0
00000DAE        js      ?_120                           ; 0DAE _ 78, 15
00000DB0        mov     rax, qword ptr [rbp-30H]        ; 0DB0 _ 48: 8B. 45, D0
00000DB4        mov     rcx, rsi                        ; 0DB4 _ 48: 89. F1
00000DB7        mov     rdx, rbx                        ; 0DB7 _ 48: 89. DA
00000DBA        mov     r8, r15                         ; 0DBA _ 4D: 89. F8
00000DBD        mov     r9, r14                         ; 0DBD _ 4D: 89. F1
00000DC0        call    qword ptr [rax]                 ; 0DC0 _ FF. 10
00000DC2        mov     rdi, rax                        ; 0DC2 _ 48: 89. C7
?_120:
00000DC5        mov     rax, rdi                        ; 0DC5 _ 48: 89. F8
00000DC8        add     rsp, 40                         ; 0DC8 _ 48: 83. C4, 28
00000DCC        pop     rbx                             ; 0DCC _ 5B
00000DCD        pop     rdi                             ; 0DCD _ 5F
00000DCE        pop     rsi                             ; 0DCE _ 5E
00000DCF        pop     r14                             ; 0DCF _ 41: 5E
00000DD1        pop     r15                             ; 0DD1 _ 41: 5F
00000DD3        pop     rbp                             ; 0DD3 _ 5D
00000DD4        ret                                     ; 0DD4 _ C3

?_121   LABEL NEAR
00000DD5        push    rbp                             ; 0DD5 _ 55
00000DD6        mov     rbp, rsp                        ; 0DD6 _ 48: 89. E5
00000DD9        push    rsi                             ; 0DD9 _ 56
00000DDA        sub     rsp, 696                        ; 0DDA _ 48: 81. EC, 000002B8
00000DE1        mov     rax, rcx                        ; 0DE1 _ 48: 89. C8
00000DE4        mov     qword ptr [rbp+28H], r9         ; 0DE4 _ 4C: 89. 4D, 28
00000DE8        mov     qword ptr [rbp+20H], r8         ; 0DE8 _ 4C: 89. 45, 20
00000DEC        mov     qword ptr [rbp+18H], rdx        ; 0DEC _ 48: 89. 55, 18
00000DF0        lea     rcx, ptr [rbp+18H]              ; 0DF0 _ 48: 8D. 4D, 18
00000DF4        mov     qword ptr [rbp-20H], rcx        ; 0DF4 _ 48: 89. 4D, E0
00000DF8        lea     rcx, ptr [rbp-2A0H]             ; 0DF8 _ 48: 8D. 8D, FFFFFD60
00000DFF        lea     r9, ptr [rbp-20H]               ; 0DFF _ 4C: 8D. 4D, E0
00000E03        mov     edx, 640                        ; 0E03 _ BA, 00000280
00000E08        mov     r8, rax                         ; 0E08 _ 49: 89. C0
00000E0B        call    ?_119                           ; 0E0B _ E8, FFFFFF64
00000E10        mov     rsi, rax                        ; 0E10 _ 48: 89. C6
00000E13        mov     rax, qword ptr [?_888]          ; 0E13 _ 48: 8B. 05, 00009E86(rel)
00000E1A        mov     rax, qword ptr [rax+40H]        ; 0E1A _ 48: 8B. 40, 40
00000E1E        test    rax, rax                        ; 0E1E _ 48: 85. C0
00000E21        jz      ?_122                           ; 0E21 _ 74, 0D
00000E23        lea     rdx, ptr [rbp-2A0H]             ; 0E23 _ 48: 8D. 95, FFFFFD60
00000E2A        mov     rcx, rax                        ; 0E2A _ 48: 89. C1
00000E2D        call    qword ptr [rax+8H]              ; 0E2D _ FF. 50, 08
?_122:
00000E30        mov     rax, rsi                        ; 0E30 _ 48: 89. F0
00000E33        add     rsp, 696                        ; 0E33 _ 48: 81. C4, 000002B8
00000E3A        pop     rsi                             ; 0E3A _ 5E
00000E3B        pop     rbp                             ; 0E3B _ 5D
00000E3C        ret                                     ; 0E3C _ C3

00000E3D        nop                                     ; 0E3D _ 90
00000E3E        nop                                     ; 0E3E _ 90
00000E3F        nop                                     ; 0E3F _ 90

?_123   LABEL NEAR
00000E40        push    rbp                             ; 0E40 _ 55
00000E41        mov     rbp, rsp                        ; 0E41 _ 48: 89. E5
00000E44        sub     rsp, 144                        ; 0E44 _ 48: 81. EC, 00000090
00000E4B        mov     rax, qword ptr [rbp+30H]        ; 0E4B _ 48: 8B. 45, 30
00000E4F        mov     qword ptr [rbp-8H], rcx         ; 0E4F _ 48: 89. 4D, F8
00000E53        mov     dword ptr [rbp-0CH], edx        ; 0E53 _ 89. 55, F4
00000E56        mov     qword ptr [rbp-18H], r8         ; 0E56 _ 4C: 89. 45, E8
00000E5A        mov     qword ptr [rbp-20H], r9         ; 0E5A _ 4C: 89. 4D, E0
00000E5E        mov     qword ptr [rbp-28H], rax        ; 0E5E _ 48: 89. 45, D8
00000E62        mov     qword ptr [rbp-38H], 0          ; 0E62 _ 48: C7. 45, C8, 00000000
00000E6A        mov     qword ptr [rbp-40H], 0          ; 0E6A _ 48: C7. 45, C0, 00000000
00000E72        cmp     qword ptr [rbp-8H], 0           ; 0E72 _ 48: 81. 7D, F8, 00000000
; Note: Immediate operand could be made smaller by sign extension
00000E7A        jne     ?_124                           ; 0E7A _ 0F 85, 00000013
; Note: Immediate operand could be made smaller by sign extension
00000E80        mov     rax, 2H                         ; 0E80 _ 48: B8, 8000000000000002
00000E8A        mov     qword ptr [rbp-30H], rax        ; 0E8A _ 48: 89. 45, D0
00000E8E        jmp     ?_135                           ; 0E8E _ E9, 000001DB

?_124:
00000E93        cmp     dword ptr [rbp-0CH], 18         ; 0E93 _ 81. 7D, F4, 00000012
; Note: Immediate operand could be made smaller by sign extension
00000E9A        jge     ?_125                           ; 0E9A _ 0F 8D, 00000013
; Note: Immediate operand could be made smaller by sign extension
00000EA0        mov     rax, 2H                         ; 0EA0 _ 48: B8, 8000000000000002
00000EAA        mov     qword ptr [rbp-30H], rax        ; 0EAA _ 48: 89. 45, D0
00000EAE        jmp     ?_135                           ; 0EAE _ E9, 000001BB

?_125:
00000EB3        mov     rax, qword ptr [rbp-28H]        ; 0EB3 _ 48: 8B. 45, D8
00000EB7        cmp     rax, qword ptr [rbp-20H]        ; 0EB7 _ 48: 3B. 45, E0
00000EBB        jle     ?_126                           ; 0EBB _ 0F 8E, 00000013
; Note: Immediate operand could be made smaller by sign extension
00000EC1        mov     rax, 2H                         ; 0EC1 _ 48: B8, 8000000000000002
00000ECB        mov     qword ptr [rbp-30H], rax        ; 0ECB _ 48: 89. 45, D0
00000ECF        jmp     ?_135                           ; 0ECF _ E9, 0000019A

?_126:
00000ED4        mov     rax, qword ptr [rbp-28H]        ; 0ED4 _ 48: 8B. 45, D8
00000ED8        cmp     rax, qword ptr [rbp-18H]        ; 0ED8 _ 48: 3B. 45, E8
00000EDC        jge     ?_127                           ; 0EDC _ 0F 8D, 00000013
; Note: Immediate operand could be made smaller by sign extension
00000EE2        mov     rax, 2H                         ; 0EE2 _ 48: B8, 8000000000000002
00000EEC        mov     qword ptr [rbp-30H], rax        ; 0EEC _ 48: 89. 45, D0
00000EF0        jmp     ?_135                           ; 0EF0 _ E9, 00000179

?_127:
00000EF5        mov     rax, qword ptr [rbp-18H]        ; 0EF5 _ 48: 8B. 45, E8
00000EF9        cmp     rax, qword ptr [rbp-20H]        ; 0EF9 _ 48: 3B. 45, E0
00000EFD        jl      ?_128                           ; 0EFD _ 0F 8C, 00000013
; Note: Immediate operand could be made smaller by sign extension
00000F03        mov     rax, 2H                         ; 0F03 _ 48: B8, 8000000000000002
00000F0D        mov     qword ptr [rbp-30H], rax        ; 0F0D _ 48: 89. 45, D0
00000F11        jmp     ?_135                           ; 0F11 _ E9, 00000158

?_128:
00000F16        lea     rcx, ptr [?_847]                ; 0F16 _ 48: 8D. 0D, 0000967F(rel)
00000F1D        call    ?_079                           ; 0F1D _ E8, FFFFFB01
00000F22        mov     qword ptr [rbp-30H], rax        ; 0F22 _ 48: 89. 45, D0
00000F26        mov     rax, 0                          ; 0F26 _ 48: B8, 0000000000000000
; Note: Immediate operand could be made smaller by zero extension
00000F30        cmp     rax, qword ptr [rbp-30H]        ; 0F30 _ 48: 3B. 45, D0
00000F34        je      ?_129                           ; 0F34 _ 0F 84, 00000005
; Note: Immediate operand could be made smaller by sign extension
00000F3A        jmp     ?_135                           ; 0F3A _ E9, 0000012F

?_129:
00000F3F        lea     rcx, ptr [rbp-40H]              ; 0F3F _ 48: 8D. 4D, C0
00000F43        lea     rax, ptr [rbp-50H]              ; 0F43 _ 48: 8D. 45, B0
00000F47        mov     dword ptr [rbp-50H], 0          ; 0F47 _ C7. 45, B0, 00000000
00000F4E        mov     dword ptr [rbp-4CH], 0          ; 0F4E _ C7. 45, B4, 00000000
00000F55        mov     edx, dword ptr [rbp-0CH]        ; 0F55 _ 8B. 55, F4
00000F58        mov     r8, qword ptr [rbp-18H]         ; 0F58 _ 4C: 8B. 45, E8
00000F5C        mov     r9, qword ptr [rbp-20H]         ; 0F5C _ 4C: 8B. 4D, E0
00000F60        mov     r10, qword ptr [rbp-28H]        ; 0F60 _ 4C: 8B. 55, D8
00000F64        add     rax, 8                          ; 0F64 _ 48: 05, 00000008
; Note: Immediate operand could be made smaller by sign extension
00000F6A        mov     qword ptr [rsp+20H], r10        ; 0F6A _ 4C: 89. 54 24, 20
00000F6F        mov     qword ptr [rsp+28H], rax        ; 0F6F _ 48: 89. 44 24, 28
00000F74        call    ?_138                           ; 0F74 _ E8, 00000147
00000F79        mov     qword ptr [rbp-30H], rax        ; 0F79 _ 48: 89. 45, D0
00000F7D        mov     rax, 0                          ; 0F7D _ 48: B8, 0000000000000000
; Note: Immediate operand could be made smaller by zero extension
00000F87        cmp     rax, qword ptr [rbp-30H]        ; 0F87 _ 48: 3B. 45, D0
00000F8B        je      ?_130                           ; 0F8B _ 0F 84, 00000005
; Note: Immediate operand could be made smaller by sign extension
00000F91        jmp     ?_135                           ; 0F91 _ E9, 000000D8

?_130:
00000F96        lea     rcx, ptr [rbp-38H]              ; 0F96 _ 48: 8D. 4D, C8
00000F9A        lea     rdx, ptr [rbp-50H]              ; 0F9A _ 48: 8D. 55, B0
00000F9E        call    ?_082                           ; 0F9E _ E8, FFFFFACE
00000FA3        mov     qword ptr [rbp-30H], rax        ; 0FA3 _ 48: 89. 45, D0
00000FA7        mov     rax, 0                          ; 0FA7 _ 48: B8, 0000000000000000
; Note: Immediate operand could be made smaller by zero extension
00000FB1        cmp     rax, qword ptr [rbp-30H]        ; 0FB1 _ 48: 3B. 45, D0
00000FB5        je      ?_131                           ; 0FB5 _ 0F 84, 00000005
; Note: Immediate operand could be made smaller by sign extension
00000FBB        jmp     ?_135                           ; 0FBB _ E9, 000000AE

?_131:
00000FC0        cmp     qword ptr [rbp-38H], 0          ; 0FC0 _ 48: 81. 7D, C8, 00000000
; Note: Immediate operand could be made smaller by sign extension
00000FC8        jne     ?_132                           ; 0FC8 _ 0F 85, 00000013
; Note: Immediate operand could be made smaller by sign extension
00000FCE        mov     rax, 9H                         ; 0FCE _ 48: B8, 8000000000000009
00000FD8        mov     qword ptr [rbp-30H], rax        ; 0FD8 _ 48: 89. 45, D0
00000FDC        jmp     ?_135                           ; 0FDC _ E9, 0000008D

?_132:
00000FE1        mov     edx, 7                          ; 0FE1 _ BA, 00000007
00000FE6        mov     rcx, qword ptr [rbp-38H]        ; 0FE6 _ 48: 8B. 4D, C8
00000FEA        call    ?_093                           ; 0FEA _ E8, FFFFFB39
00000FEF        mov     qword ptr [rbp-30H], rax        ; 0FEF _ 48: 89. 45, D0
00000FF3        mov     rax, 0                          ; 0FF3 _ 48: B8, 0000000000000000
; Note: Immediate operand could be made smaller by zero extension
00000FFD        cmp     rax, qword ptr [rbp-30H]        ; 0FFD _ 48: 3B. 45, D0
00001001        je      ?_133                           ; 1001 _ 0F 84, 00000005
; Note: Immediate operand could be made smaller by sign extension
00001007        jmp     ?_135                           ; 1007 _ E9, 00000062
; Note: Immediate operand could be made smaller by sign extension

?_133:
0000100C        lea     rdx, ptr [?_181]                ; 100C _ 48: 8D. 15, 000008DD(rel)
00001013        lea     r8, ptr [?_195]                 ; 1013 _ 4C: 8D. 05, 00000CE6(rel)
0000101A        mov     r9, 0                           ; 101A _ 49: B9, 0000000000000000
; Note: Immediate operand could be made smaller by zero extension
00001024        mov     rcx, qword ptr [rbp-38H]        ; 1024 _ 48: 8B. 4D, C8
00001028        mov     rax, qword ptr [rbp-40H]        ; 1028 _ 48: 8B. 45, C0
0000102C        mov     qword ptr [rsp+20H], rax        ; 102C _ 48: 89. 44 24, 20
00001031        call    ?_095                           ; 1031 _ E8, FFFFFB16
00001036        mov     qword ptr [rbp-30H], rax        ; 1036 _ 48: 89. 45, D0
0000103A        mov     rax, 0                          ; 103A _ 48: B8, 0000000000000000
; Note: Immediate operand could be made smaller by zero extension
00001044        cmp     rax, qword ptr [rbp-30H]        ; 1044 _ 48: 3B. 45, D0
00001048        je      ?_134                           ; 1048 _ 0F 84, 00000005
; Note: Immediate operand could be made smaller by sign extension
0000104E        jmp     ?_135                           ; 104E _ E9, 0000001B
; Note: Immediate operand could be made smaller by sign extension

?_134:
00001053        mov     qword ptr [rbp-40H], 0          ; 1053 _ 48: C7. 45, C0, 00000000
0000105B        mov     rax, qword ptr [rbp-38H]        ; 105B _ 48: 8B. 45, C8
0000105F        mov     rcx, qword ptr [rbp-8H]         ; 105F _ 48: 8B. 4D, F8
00001063        mov     qword ptr [rcx], rax            ; 1063 _ 48: 89. 01
00001066        mov     qword ptr [rbp-38H], 0          ; 1066 _ 48: C7. 45, C8, 00000000
?_135:
0000106E        cmp     qword ptr [rbp-38H], 0          ; 106E _ 48: 81. 7D, C8, 00000000
; Note: Immediate operand could be made smaller by sign extension
00001076        je      ?_136                           ; 1076 _ 0F 84, 0000000D
; Note: Immediate operand could be made smaller by sign extension
0000107C        mov     rcx, qword ptr [rbp-38H]        ; 107C _ 48: 8B. 4D, C8
00001080        call    ?_087                           ; 1080 _ E8, FFFFFA43
00001085        mov     qword ptr [rbp-58H], rax        ; 1085 _ 48: 89. 45, A8
?_136:
00001089        cmp     qword ptr [rbp-40H], 0          ; 1089 _ 48: 81. 7D, C0, 00000000
; Note: Immediate operand could be made smaller by sign extension
00001091        je      ?_137                           ; 1091 _ 0F 84, 0000000D
; Note: Immediate operand could be made smaller by sign extension
00001097        mov     rcx, qword ptr [rbp-40H]        ; 1097 _ 48: 8B. 4D, C0
0000109B        call    ?_199                           ; 109B _ E8, 00000CF0
000010A0        mov     qword ptr [rbp-60H], rax        ; 10A0 _ 48: 89. 45, A0
?_137:
000010A4        mov     rax, qword ptr [rbp-30H]        ; 10A4 _ 48: 8B. 45, D0
000010A8        add     rsp, 144                        ; 10A8 _ 48: 81. C4, 00000090
000010AF        pop     rbp                             ; 10AF _ 5D
000010B0        ret                                     ; 10B0 _ C3

; Filling space: 0FH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 66H, 66H, 66H, 66H, 2EH, 0FH
;       db 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16

?_138   LABEL NEAR
000010C0        push    rbp                             ; 10C0 _ 55
000010C1        mov     rbp, rsp                        ; 10C1 _ 48: 89. E5
000010C4        sub     rsp, 240                        ; 10C4 _ 48: 81. EC, 000000F0
000010CB        mov     rax, qword ptr [rbp+38H]        ; 10CB _ 48: 8B. 45, 38
000010CF        mov     r10, qword ptr [rbp+30H]        ; 10CF _ 4C: 8B. 55, 30
000010D3        mov     qword ptr [rbp-8H], rcx         ; 10D3 _ 48: 89. 4D, F8
000010D7        mov     dword ptr [rbp-0CH], edx        ; 10D7 _ 89. 55, F4
000010DA        mov     qword ptr [rbp-18H], r8         ; 10DA _ 4C: 89. 45, E8
000010DE        mov     qword ptr [rbp-20H], r9         ; 10DE _ 4C: 89. 4D, E0
000010E2        mov     qword ptr [rbp-28H], r10        ; 10E2 _ 4C: 89. 55, D8
000010E6        mov     qword ptr [rbp-30H], rax        ; 10E6 _ 48: 89. 45, D0
000010EA        mov     qword ptr [rbp-48H], 0          ; 10EA _ 48: C7. 45, B8, 00000000
000010F2        mov     qword ptr [rbp-50H], 0          ; 10F2 _ 48: C7. 45, B0, 00000000
000010FA        mov     qword ptr [rbp-58H], 0          ; 10FA _ 48: C7. 45, A8, 00000000
00001102        mov     qword ptr [rbp-60H], 0          ; 1102 _ 48: C7. 45, A0, 00000000
0000110A        mov     qword ptr [rbp-68H], 0          ; 110A _ 48: C7. 45, 98, 00000000
00001112        mov     qword ptr [rbp-70H], 0          ; 1112 _ 48: C7. 45, 90, 00000000
0000111A        mov     qword ptr [rbp-40H], 0          ; 111A _ 48: C7. 45, C0, 00000000
00001122        cmp     qword ptr [rbp-8H], 0           ; 1122 _ 48: 81. 7D, F8, 00000000
; Note: Immediate operand could be made smaller by sign extension
0000112A        jne     ?_139                           ; 112A _ 0F 85, 00000013
; Note: Immediate operand could be made smaller by sign extension
00001130        mov     rax, 2H                         ; 1130 _ 48: B8, 8000000000000002
0000113A        mov     qword ptr [rbp-38H], rax        ; 113A _ 48: 89. 45, C8
0000113E        jmp     ?_173                           ; 113E _ E9, 00000693

?_139:
00001143        cmp     qword ptr [rbp-30H], 0          ; 1143 _ 48: 81. 7D, D0, 00000000
; Note: Immediate operand could be made smaller by sign extension
0000114B        jne     ?_140                           ; 114B _ 0F 85, 00000013
; Note: Immediate operand could be made smaller by sign extension
00001151        mov     rax, 2H                         ; 1151 _ 48: B8, 8000000000000002
0000115B        mov     qword ptr [rbp-38H], rax        ; 115B _ 48: 89. 45, C8
0000115F        jmp     ?_173                           ; 115F _ E9, 00000672

?_140:
00001164        cmp     dword ptr [rbp-0CH], 18         ; 1164 _ 81. 7D, F4, 00000012
; Note: Immediate operand could be made smaller by sign extension
0000116B        jge     ?_141                           ; 116B _ 0F 8D, 00000013
; Note: Immediate operand could be made smaller by sign extension
00001171        mov     rax, 2H                         ; 1171 _ 48: B8, 8000000000000002
0000117B        mov     qword ptr [rbp-38H], rax        ; 117B _ 48: 89. 45, C8
0000117F        jmp     ?_173                           ; 117F _ E9, 00000652

?_141:
00001184        mov     rax, qword ptr [rbp-28H]        ; 1184 _ 48: 8B. 45, D8
00001188        cmp     rax, qword ptr [rbp-20H]        ; 1188 _ 48: 3B. 45, E0
0000118C        jle     ?_142                           ; 118C _ 0F 8E, 00000013
; Note: Immediate operand could be made smaller by sign extension
00001192        mov     rax, 2H                         ; 1192 _ 48: B8, 8000000000000002
0000119C        mov     qword ptr [rbp-38H], rax        ; 119C _ 48: 89. 45, C8
000011A0        jmp     ?_173                           ; 11A0 _ E9, 00000631

?_142:
000011A5        mov     rax, qword ptr [rbp-28H]        ; 11A5 _ 48: 8B. 45, D8
000011A9        cmp     rax, qword ptr [rbp-18H]        ; 11A9 _ 48: 3B. 45, E8
000011AD        jge     ?_143                           ; 11AD _ 0F 8D, 00000013
; Note: Immediate operand could be made smaller by sign extension
000011B3        mov     rax, 2H                         ; 11B3 _ 48: B8, 8000000000000002
000011BD        mov     qword ptr [rbp-38H], rax        ; 11BD _ 48: 89. 45, C8
000011C1        jmp     ?_173                           ; 11C1 _ E9, 00000610

?_143:
000011C6        mov     rax, qword ptr [rbp-18H]        ; 11C6 _ 48: 8B. 45, E8
000011CA        cmp     rax, qword ptr [rbp-20H]        ; 11CA _ 48: 3B. 45, E0
000011CE        jl      ?_144                           ; 11CE _ 0F 8C, 00000013
; Note: Immediate operand could be made smaller by sign extension
000011D4        mov     rax, 2H                         ; 11D4 _ 48: B8, 8000000000000002
000011DE        mov     qword ptr [rbp-38H], rax        ; 11DE _ 48: 89. 45, C8
000011E2        jmp     ?_173                           ; 11E2 _ E9, 000005EF

?_144:
000011E7        lea     rcx, ptr [rbp-48H]              ; 11E7 _ 48: 8D. 4D, B8
000011EB        lea     rdx, ptr [rbp-90H]              ; 11EB _ 48: 8D. 95, FFFFFF70
000011F2        lea     r8, ptr [rbp-78H]               ; 11F2 _ 4C: 8D. 45, 88
000011F6        lea     r9, ptr [?_840]                 ; 11F6 _ 4C: 8D. 0D, 0000932F(rel)
000011FD        call    ?_105                           ; 11FD _ E8, FFFFF9EC
00001202        mov     qword ptr [rbp-38H], rax        ; 1202 _ 48: 89. 45, C8
00001206        mov     rax, 0                          ; 1206 _ 48: B8, 0000000000000000
; Note: Immediate operand could be made smaller by zero extension
00001210        cmp     rax, qword ptr [rbp-38H]        ; 1210 _ 48: 3B. 45, C8
00001214        je      ?_145                           ; 1214 _ 0F 84, 00000005
; Note: Immediate operand could be made smaller by sign extension
0000121A        jmp     ?_173                           ; 121A _ E9, 000005B7

?_145:
0000121F        cmp     qword ptr [rbp-48H], 0          ; 121F _ 48: 81. 7D, B8, 00000000
; Note: Immediate operand could be made smaller by sign extension
00001227        jne     ?_146                           ; 1227 _ 0F 85, 00000013
; Note: Immediate operand could be made smaller by sign extension
0000122D        mov     rax, 9H                         ; 122D _ 48: B8, 8000000000000009
00001237        mov     qword ptr [rbp-38H], rax        ; 1237 _ 48: 89. 45, C8
0000123B        jmp     ?_173                           ; 123B _ E9, 00000596

?_146:
00001240        lea     rcx, ptr [rbp-50H]              ; 1240 _ 48: 8D. 4D, B0
00001244        lea     rdx, ptr [rbp-90H]              ; 1244 _ 48: 8D. 95, FFFFFF70
0000124B        lea     r8, ptr [rbp-80H]               ; 124B _ 4C: 8D. 45, 80
0000124F        lea     r9, ptr [?_841]                 ; 124F _ 4C: 8D. 0D, 000092E6(rel)
00001256        mov     eax, dword ptr [rbp-78H]        ; 1256 _ 8B. 45, 88
00001259        mov     dword ptr [rbp-84H], eax        ; 1259 _ 89. 85, FFFFFF7C
0000125F        call    ?_105                           ; 125F _ E8, FFFFF98A
00001264        mov     qword ptr [rbp-38H], rax        ; 1264 _ 48: 89. 45, C8
00001268        mov     rax, 0                          ; 1268 _ 48: B8, 0000000000000000
; Note: Immediate operand could be made smaller by zero extension
00001272        cmp     rax, qword ptr [rbp-38H]        ; 1272 _ 48: 3B. 45, C8
00001276        je      ?_147                           ; 1276 _ 0F 84, 00000005
; Note: Immediate operand could be made smaller by sign extension
0000127C        jmp     ?_173                           ; 127C _ E9, 00000555

?_147:
00001281        cmp     qword ptr [rbp-50H], 0          ; 1281 _ 48: 81. 7D, B0, 00000000
; Note: Immediate operand could be made smaller by sign extension
00001289        jne     ?_148                           ; 1289 _ 0F 85, 00000013
; Note: Immediate operand could be made smaller by sign extension
0000128F        mov     rax, 9H                         ; 128F _ 48: B8, 8000000000000009
00001299        mov     qword ptr [rbp-38H], rax        ; 1299 _ 48: 89. 45, C8
0000129D        jmp     ?_173                           ; 129D _ E9, 00000534

?_148:
000012A2        mov     eax, dword ptr [rbp-80H]        ; 12A2 _ 8B. 45, 80
000012A5        cmp     eax, dword ptr [rbp-84H]        ; 12A5 _ 3B. 85, FFFFFF7C
000012AB        je      ?_149                           ; 12AB _ 0F 84, 00000013
; Note: Immediate operand could be made smaller by sign extension
000012B1        mov     rax, 3H                         ; 12B1 _ 48: B8, 8000000000000003
000012BB        mov     qword ptr [rbp-38H], rax        ; 12BB _ 48: 89. 45, C8
000012BF        jmp     ?_173                           ; 12BF _ E9, 00000512

?_149:
000012C4        lea     rcx, ptr [rbp-58H]              ; 12C4 _ 48: 8D. 4D, A8
000012C8        lea     rdx, ptr [rbp-90H]              ; 12C8 _ 48: 8D. 95, FFFFFF70
000012CF        lea     r8, ptr [rbp-78H]               ; 12CF _ 4C: 8D. 45, 88
000012D3        lea     r9, ptr [?_842]                 ; 12D3 _ 4C: 8D. 0D, 00009272(rel)
000012DA        call    ?_105                           ; 12DA _ E8, FFFFF90F
000012DF        mov     qword ptr [rbp-38H], rax        ; 12DF _ 48: 89. 45, C8
000012E3        mov     rax, 0                          ; 12E3 _ 48: B8, 0000000000000000
; Note: Immediate operand could be made smaller by zero extension
000012ED        cmp     rax, qword ptr [rbp-38H]        ; 12ED _ 48: 3B. 45, C8
000012F1        je      ?_150                           ; 12F1 _ 0F 84, 00000005
; Note: Immediate operand could be made smaller by sign extension
000012F7        jmp     ?_173                           ; 12F7 _ E9, 000004DA

?_150:
000012FC        cmp     qword ptr [rbp-58H], 0          ; 12FC _ 48: 81. 7D, A8, 00000000
; Note: Immediate operand could be made smaller by sign extension
00001304        jne     ?_151                           ; 1304 _ 0F 85, 00000013
; Note: Immediate operand could be made smaller by sign extension
0000130A        mov     rax, 9H                         ; 130A _ 48: B8, 8000000000000009
00001314        mov     qword ptr [rbp-38H], rax        ; 1314 _ 48: 89. 45, C8
00001318        jmp     ?_173                           ; 1318 _ E9, 000004B9

?_151:
0000131D        mov     eax, dword ptr [rbp-78H]        ; 131D _ 8B. 45, 88
00001320        cmp     eax, dword ptr [rbp-84H]        ; 1320 _ 3B. 85, FFFFFF7C
00001326        je      ?_152                           ; 1326 _ 0F 84, 00000013
; Note: Immediate operand could be made smaller by sign extension
0000132C        mov     rax, 3H                         ; 132C _ 48: B8, 8000000000000003
00001336        mov     qword ptr [rbp-38H], rax        ; 1336 _ 48: 89. 45, C8
0000133A        jmp     ?_173                           ; 133A _ E9, 00000497

?_152:
0000133F        lea     rcx, ptr [rbp-60H]              ; 133F _ 48: 8D. 4D, A0
00001343        lea     rdx, ptr [rbp-90H]              ; 1343 _ 48: 8D. 95, FFFFFF70
0000134A        lea     r8, ptr [rbp-78H]               ; 134A _ 4C: 8D. 45, 88
0000134E        lea     r9, ptr [?_843]                 ; 134E _ 4C: 8D. 0D, 00009207(rel)
00001355        call    ?_105                           ; 1355 _ E8, FFFFF894
0000135A        mov     qword ptr [rbp-38H], rax        ; 135A _ 48: 89. 45, C8
0000135E        mov     rax, 0                          ; 135E _ 48: B8, 0000000000000000
; Note: Immediate operand could be made smaller by zero extension
00001368        cmp     rax, qword ptr [rbp-38H]        ; 1368 _ 48: 3B. 45, C8
0000136C        je      ?_153                           ; 136C _ 0F 84, 00000005
; Note: Immediate operand could be made smaller by sign extension
00001372        jmp     ?_173                           ; 1372 _ E9, 0000045F

?_153:
00001377        cmp     qword ptr [rbp-60H], 0          ; 1377 _ 48: 81. 7D, A0, 00000000
; Note: Immediate operand could be made smaller by sign extension
0000137F        jne     ?_154                           ; 137F _ 0F 85, 00000013
; Note: Immediate operand could be made smaller by sign extension
00001385        mov     rax, 9H                         ; 1385 _ 48: B8, 8000000000000009
0000138F        mov     qword ptr [rbp-38H], rax        ; 138F _ 48: 89. 45, C8
00001393        jmp     ?_173                           ; 1393 _ E9, 0000043E

?_154:
00001398        mov     eax, dword ptr [rbp-78H]        ; 1398 _ 8B. 45, 88
0000139B        cmp     eax, dword ptr [rbp-84H]        ; 139B _ 3B. 85, FFFFFF7C
000013A1        je      ?_155                           ; 13A1 _ 0F 84, 00000013
; Note: Immediate operand could be made smaller by sign extension
000013A7        mov     rax, 3H                         ; 13A7 _ 48: B8, 8000000000000003
000013B1        mov     qword ptr [rbp-38H], rax        ; 13B1 _ 48: 89. 45, C8
000013B5        jmp     ?_173                           ; 13B5 _ E9, 0000041C

?_155:
000013BA        lea     rcx, ptr [rbp-68H]              ; 13BA _ 48: 8D. 4D, 98
000013BE        lea     rdx, ptr [rbp-90H]              ; 13BE _ 48: 8D. 95, FFFFFF70
000013C5        lea     r8, ptr [rbp-80H]               ; 13C5 _ 4C: 8D. 45, 80
000013C9        lea     r9, ptr [?_844]                 ; 13C9 _ 4C: 8D. 0D, 0000919C(rel)
000013D0        call    ?_105                           ; 13D0 _ E8, FFFFF819
000013D5        mov     qword ptr [rbp-38H], rax        ; 13D5 _ 48: 89. 45, C8
000013D9        mov     rax, 0                          ; 13D9 _ 48: B8, 0000000000000000
; Note: Immediate operand could be made smaller by zero extension
000013E3        cmp     rax, qword ptr [rbp-38H]        ; 13E3 _ 48: 3B. 45, C8
000013E7        je      ?_156                           ; 13E7 _ 0F 84, 00000005
; Note: Immediate operand could be made smaller by sign extension
000013ED        jmp     ?_173                           ; 13ED _ E9, 000003E4

?_156:
000013F2        cmp     qword ptr [rbp-68H], 0          ; 13F2 _ 48: 81. 7D, 98, 00000000
; Note: Immediate operand could be made smaller by sign extension
000013FA        jne     ?_157                           ; 13FA _ 0F 85, 00000013
; Note: Immediate operand could be made smaller by sign extension
00001400        mov     rax, 9H                         ; 1400 _ 48: B8, 8000000000000009
0000140A        mov     qword ptr [rbp-38H], rax        ; 140A _ 48: 89. 45, C8
0000140E        jmp     ?_173                           ; 140E _ E9, 000003C3

?_157:
00001413        mov     eax, dword ptr [rbp-80H]        ; 1413 _ 8B. 45, 80
00001416        cmp     eax, dword ptr [rbp-84H]        ; 1416 _ 3B. 85, FFFFFF7C
0000141C        je      ?_158                           ; 141C _ 0F 84, 00000013
; Note: Immediate operand could be made smaller by sign extension
00001422        mov     rax, 3H                         ; 1422 _ 48: B8, 8000000000000003
0000142C        mov     qword ptr [rbp-38H], rax        ; 142C _ 48: 89. 45, C8
00001430        jmp     ?_173                           ; 1430 _ E9, 000003A1

?_158:
00001435        lea     rcx, ptr [rbp-70H]              ; 1435 _ 48: 8D. 4D, 90
00001439        lea     rdx, ptr [rbp-90H]              ; 1439 _ 48: 8D. 95, FFFFFF70
00001440        lea     r8, ptr [rbp-78H]               ; 1440 _ 4C: 8D. 45, 88
00001444        lea     r9, ptr [?_845]                 ; 1444 _ 4C: 8D. 0D, 00009131(rel)
0000144B        call    ?_105                           ; 144B _ E8, FFFFF79E
00001450        mov     qword ptr [rbp-38H], rax        ; 1450 _ 48: 89. 45, C8
00001454        mov     rax, 0                          ; 1454 _ 48: B8, 0000000000000000
; Note: Immediate operand could be made smaller by zero extension
0000145E        cmp     rax, qword ptr [rbp-38H]        ; 145E _ 48: 3B. 45, C8
00001462        je      ?_159                           ; 1462 _ 0F 84, 00000005
; Note: Immediate operand could be made smaller by sign extension
00001468        jmp     ?_173                           ; 1468 _ E9, 00000369

?_159:
0000146D        cmp     qword ptr [rbp-70H], 0          ; 146D _ 48: 81. 7D, 90, 00000000
; Note: Immediate operand could be made smaller by sign extension
00001475        jne     ?_160                           ; 1475 _ 0F 85, 00000013
; Note: Immediate operand could be made smaller by sign extension
0000147B        mov     rax, 9H                         ; 147B _ 48: B8, 8000000000000009
00001485        mov     qword ptr [rbp-38H], rax        ; 1485 _ 48: 89. 45, C8
00001489        jmp     ?_173                           ; 1489 _ E9, 00000348

?_160:
0000148E        mov     eax, dword ptr [rbp-78H]        ; 148E _ 8B. 45, 88
00001491        cmp     eax, dword ptr [rbp-84H]        ; 1491 _ 3B. 85, FFFFFF7C
00001497        je      ?_161                           ; 1497 _ 0F 84, 00000013
; Note: Immediate operand could be made smaller by sign extension
0000149D        mov     rax, 3H                         ; 149D _ 48: B8, 8000000000000003
000014A7        mov     qword ptr [rbp-38H], rax        ; 14A7 _ 48: 89. 45, C8
000014AB        jmp     ?_173                           ; 14AB _ E9, 00000326

?_161:
000014B0        mov     rcx, 40                         ; 14B0 _ 48: B9, 0000000000000028
; Note: Immediate operand could be made smaller by zero extension
000014BA        call    ?_008                           ; 14BA _ E8, FFFFEE80
000014BF        mov     qword ptr [rbp-40H], rax        ; 14BF _ 48: 89. 45, C0
000014C3        cmp     qword ptr [rbp-40H], 0          ; 14C3 _ 48: 81. 7D, C0, 00000000
; Note: Immediate operand could be made smaller by sign extension
000014CB        jne     ?_162                           ; 14CB _ 0F 85, 00000013
; Note: Immediate operand could be made smaller by sign extension
000014D1        mov     rax, 9H                         ; 14D1 _ 48: B8, 8000000000000009
000014DB        mov     qword ptr [rbp-38H], rax        ; 14DB _ 48: 89. 45, C8
000014DF        jmp     ?_173                           ; 14DF _ E9, 000002F2

?_162:
000014E4        mov     rax, qword ptr [rbp-18H]        ; 14E4 _ 48: 8B. 45, E8
000014E8        mov     rcx, qword ptr [rbp-40H]        ; 14E8 _ 48: 8B. 4D, C0
000014EC        mov     qword ptr [rcx+10H], rax        ; 14EC _ 48: 89. 41, 10
000014F0        mov     rax, qword ptr [rbp-20H]        ; 14F0 _ 48: 8B. 45, E0
000014F4        mov     rcx, qword ptr [rbp-40H]        ; 14F4 _ 48: 8B. 4D, C0
000014F8        mov     qword ptr [rcx+18H], rax        ; 14F8 _ 48: 89. 41, 18
000014FC        mov     rax, qword ptr [rbp-28H]        ; 14FC _ 48: 8B. 45, D8
00001500        mov     rcx, qword ptr [rbp-40H]        ; 1500 _ 48: 8B. 4D, C0
00001504        mov     qword ptr [rcx+20H], rax        ; 1504 _ 48: 89. 41, 20
00001508        mov     edx, dword ptr [rbp-0CH]        ; 1508 _ 8B. 55, F4
0000150B        imul    edx, dword ptr [rbp-84H]        ; 150B _ 0F AF. 95, FFFFFF7C
00001512        movsxd  rax, edx                        ; 1512 _ 48: 63. C2
00001515        shl     rax, 2                          ; 1515 _ 48: C1. E0, 02
00001519        mov     rcx, rax                        ; 1519 _ 48: 89. C1
0000151C        call    ?_008                           ; 151C _ E8, FFFFEE1E
00001521        mov     rcx, qword ptr [rbp-40H]        ; 1521 _ 48: 8B. 4D, C0
00001525        mov     qword ptr [rcx], rax            ; 1525 _ 48: 89. 01
00001528        mov     rax, qword ptr [rbp-40H]        ; 1528 _ 48: 8B. 45, C0
0000152C        cmp     qword ptr [rax], 0              ; 152C _ 48: 81. 38, 00000000
; Note: Immediate operand could be made smaller by sign extension
00001533        jne     ?_163                           ; 1533 _ 0F 85, 00000013
; Note: Immediate operand could be made smaller by sign extension
00001539        mov     rax, 9H                         ; 1539 _ 48: B8, 8000000000000009
00001543        mov     qword ptr [rbp-38H], rax        ; 1543 _ 48: 89. 45, C8
00001547        jmp     ?_173                           ; 1547 _ E9, 0000028A

?_163:
0000154C        mov     eax, dword ptr [rbp-0CH]        ; 154C _ 8B. 45, F4
0000154F        imul    eax, dword ptr [rbp-84H]        ; 154F _ 0F AF. 85, FFFFFF7C
00001556        movsxd  rcx, eax                        ; 1556 _ 48: 63. C8
00001559        shl     rcx, 2                          ; 1559 _ 48: C1. E1, 02
0000155D        call    ?_008                           ; 155D _ E8, FFFFEDDD
00001562        mov     rcx, qword ptr [rbp-40H]        ; 1562 _ 48: 8B. 4D, C0
00001566        mov     qword ptr [rcx+8H], rax         ; 1566 _ 48: 89. 41, 08
0000156A        mov     rax, qword ptr [rbp-40H]        ; 156A _ 48: 8B. 45, C0
0000156E        cmp     qword ptr [rax+8H], 0           ; 156E _ 48: 81. 78, 08, 00000000
; Note: Immediate operand could be made smaller by sign extension
00001576        jne     ?_164                           ; 1576 _ 0F 85, 00000013
; Note: Immediate operand could be made smaller by sign extension
0000157C        mov     rax, 9H                         ; 157C _ 48: B8, 8000000000000009
00001586        mov     qword ptr [rbp-38H], rax        ; 1586 _ 48: 89. 45, C8
0000158A        jmp     ?_173                           ; 158A _ E9, 00000247

?_164:
0000158F        mov     dword ptr [rbp-98H], 0          ; 158F _ C7. 85, FFFFFF68, 00000000
?_165:
00001599        mov     eax, dword ptr [rbp-98H]        ; 1599 _ 8B. 85, FFFFFF68
0000159F        cmp     eax, dword ptr [rbp-84H]        ; 159F _ 3B. 85, FFFFFF7C
000015A5        jge     ?_168                           ; 15A5 _ 0F 8D, 00000133
000015AB        mov     dword ptr [rbp-94H], 0          ; 15AB _ C7. 85, FFFFFF6C, 00000000
?_166:
000015B5        mov     eax, dword ptr [rbp-94H]        ; 15B5 _ 8B. 85, FFFFFF6C
000015BB        cmp     eax, dword ptr [rbp-74H]        ; 15BB _ 3B. 45, 8C
000015BE        jge     ?_167                           ; 15BE _ 0F 8D, 00000104
000015C4        mov     eax, dword ptr [rbp-98H]        ; 15C4 _ 8B. 85, FFFFFF68
000015CA        imul    eax, dword ptr [rbp-0CH]        ; 15CA _ 0F AF. 45, F4
000015CE        add     eax, dword ptr [rbp-94H]        ; 15CE _ 03. 85, FFFFFF6C
000015D4        movsxd  rcx, eax                        ; 15D4 _ 48: 63. C8
000015D7        mov     rdx, qword ptr [rbp-40H]        ; 15D7 _ 48: 8B. 55, C0
000015DB        mov     rdx, qword ptr [rdx]            ; 15DB _ 48: 8B. 12
000015DE        mov     eax, dword ptr [rbp-98H]        ; 15DE _ 8B. 85, FFFFFF68
000015E4        imul    eax, dword ptr [rbp-74H]        ; 15E4 _ 0F AF. 45, 8C
000015E8        add     eax, dword ptr [rbp-94H]        ; 15E8 _ 03. 85, FFFFFF6C
000015EE        movsxd  r8, eax                         ; 15EE _ 4C: 63. C0
000015F1        mov     r9, qword ptr [rbp-48H]         ; 15F1 _ 4C: 8B. 4D, B8
000015F5        mov     eax, dword ptr [r9+r8*4]        ; 15F5 _ 43: 8B. 04 81
000015F9        mov     dword ptr [rdx+rcx*4], eax      ; 15F9 _ 89. 04 8A
000015FC        mov     eax, dword ptr [rbp-98H]        ; 15FC _ 8B. 85, FFFFFF68
00001602        imul    eax, dword ptr [rbp-0CH]        ; 1602 _ 0F AF. 45, F4
00001606        add     eax, dword ptr [rbp-94H]        ; 1606 _ 03. 85, FFFFFF6C
0000160C        movsxd  rcx, eax                        ; 160C _ 48: 63. C8
0000160F        mov     rdx, qword ptr [rbp-40H]        ; 160F _ 48: 8B. 55, C0
00001613        mov     rdx, qword ptr [rdx+8H]         ; 1613 _ 48: 8B. 52, 08
00001617        mov     eax, dword ptr [rbp-98H]        ; 1617 _ 8B. 85, FFFFFF68
0000161D        imul    eax, dword ptr [rbp-74H]        ; 161D _ 0F AF. 45, 8C
00001621        add     eax, dword ptr [rbp-94H]        ; 1621 _ 03. 85, FFFFFF6C
00001627        movsxd  r8, eax                         ; 1627 _ 4C: 63. C0
0000162A        mov     r9, qword ptr [rbp-60H]         ; 162A _ 4C: 8B. 4D, A0
0000162E        mov     eax, dword ptr [r9+r8*4]        ; 162E _ 43: 8B. 04 81
00001632        mov     dword ptr [rdx+rcx*4], eax      ; 1632 _ 89. 04 8A
00001635        mov     eax, dword ptr [rbp-98H]        ; 1635 _ 8B. 85, FFFFFF68
0000163B        imul    eax, dword ptr [rbp-0CH]        ; 163B _ 0F AF. 45, F4
0000163F        add     eax, dword ptr [rbp-0CH]        ; 163F _ 03. 45, F4
00001642        sub     eax, dword ptr [rbp-74H]        ; 1642 _ 2B. 45, 8C
00001645        add     eax, dword ptr [rbp-94H]        ; 1645 _ 03. 85, FFFFFF6C
0000164B        movsxd  rcx, eax                        ; 164B _ 48: 63. C8
0000164E        mov     rdx, qword ptr [rbp-40H]        ; 164E _ 48: 8B. 55, C0
00001652        mov     rdx, qword ptr [rdx]            ; 1652 _ 48: 8B. 12
00001655        mov     eax, dword ptr [rbp-98H]        ; 1655 _ 8B. 85, FFFFFF68
0000165B        imul    eax, dword ptr [rbp-74H]        ; 165B _ 0F AF. 45, 8C
0000165F        add     eax, dword ptr [rbp-94H]        ; 165F _ 03. 85, FFFFFF6C
00001665        movsxd  r8, eax                         ; 1665 _ 4C: 63. C0
00001668        mov     r9, qword ptr [rbp-58H]         ; 1668 _ 4C: 8B. 4D, A8
0000166C        mov     eax, dword ptr [r9+r8*4]        ; 166C _ 43: 8B. 04 81
00001670        mov     dword ptr [rdx+rcx*4], eax      ; 1670 _ 89. 04 8A
00001673        mov     eax, dword ptr [rbp-98H]        ; 1673 _ 8B. 85, FFFFFF68
00001679        imul    eax, dword ptr [rbp-0CH]        ; 1679 _ 0F AF. 45, F4
0000167D        add     eax, dword ptr [rbp-0CH]        ; 167D _ 03. 45, F4
00001680        sub     eax, dword ptr [rbp-74H]        ; 1680 _ 2B. 45, 8C
00001683        add     eax, dword ptr [rbp-94H]        ; 1683 _ 03. 85, FFFFFF6C
00001689        movsxd  rcx, eax                        ; 1689 _ 48: 63. C8
0000168C        mov     rdx, qword ptr [rbp-40H]        ; 168C _ 48: 8B. 55, C0
00001690        mov     rdx, qword ptr [rdx+8H]         ; 1690 _ 48: 8B. 52, 08
00001694        mov     eax, dword ptr [rbp-98H]        ; 1694 _ 8B. 85, FFFFFF68
0000169A        imul    eax, dword ptr [rbp-74H]        ; 169A _ 0F AF. 45, 8C
0000169E        add     eax, dword ptr [rbp-94H]        ; 169E _ 03. 85, FFFFFF6C
000016A4        movsxd  r8, eax                         ; 16A4 _ 4C: 63. C0
000016A7        mov     r9, qword ptr [rbp-70H]         ; 16A7 _ 4C: 8B. 4D, 90
000016AB        mov     eax, dword ptr [r9+r8*4]        ; 16AB _ 43: 8B. 04 81
000016AF        mov     dword ptr [rdx+rcx*4], eax      ; 16AF _ 89. 04 8A
000016B2        mov     eax, dword ptr [rbp-94H]        ; 16B2 _ 8B. 85, FFFFFF6C
000016B8        add     eax, 1                          ; 16B8 _ 05, 00000001
; Note: Immediate operand could be made smaller by sign extension
000016BD        mov     dword ptr [rbp-94H], eax        ; 16BD _ 89. 85, FFFFFF6C
000016C3        jmp     ?_166                           ; 16C3 _ E9, FFFFFEED

?_167:
000016C8        mov     eax, dword ptr [rbp-98H]        ; 16C8 _ 8B. 85, FFFFFF68
000016CE        add     eax, 1                          ; 16CE _ 05, 00000001
; Note: Immediate operand could be made smaller by sign extension
000016D3        mov     dword ptr [rbp-98H], eax        ; 16D3 _ 89. 85, FFFFFF68
000016D9        jmp     ?_165                           ; 16D9 _ E9, FFFFFEBB

?_168:
000016DE        mov     eax, dword ptr [rbp-0CH]        ; 16DE _ 8B. 45, F4
000016E1        mov     ecx, dword ptr [rbp-74H]        ; 16E1 _ 8B. 4D, 8C
000016E4        shl     ecx, 1                          ; 16E4 _ C1. E1, 01
000016E7        cmp     eax, ecx                        ; 16E7 _ 39. C8
000016E9        jle     ?_172                           ; 16E9 _ 0F 8E, 000000BE
000016EF        mov     dword ptr [rbp-98H], 0          ; 16EF _ C7. 85, FFFFFF68, 00000000
?_169:
000016F9        mov     eax, dword ptr [rbp-98H]        ; 16F9 _ 8B. 85, FFFFFF68
000016FF        cmp     eax, dword ptr [rbp-84H]        ; 16FF _ 3B. 85, FFFFFF7C
00001705        jge     ?_172                           ; 1705 _ 0F 8D, 000000A2
0000170B        mov     eax, dword ptr [rbp-74H]        ; 170B _ 8B. 45, 8C
0000170E        mov     dword ptr [rbp-94H], eax        ; 170E _ 89. 85, FFFFFF6C
?_170:
00001714        mov     eax, dword ptr [rbp-94H]        ; 1714 _ 8B. 85, FFFFFF6C
0000171A        mov     ecx, dword ptr [rbp-0CH]        ; 171A _ 8B. 4D, F4
0000171D        sub     ecx, dword ptr [rbp-74H]        ; 171D _ 2B. 4D, 8C
00001720        cmp     eax, ecx                        ; 1720 _ 39. C8
00001722        jge     ?_171                           ; 1722 _ 0F 8D, 0000006F
; Note: Immediate operand could be made smaller by sign extension
00001728        mov     eax, dword ptr [rbp-98H]        ; 1728 _ 8B. 85, FFFFFF68
0000172E        imul    eax, dword ptr [rbp-0CH]        ; 172E _ 0F AF. 45, F4
00001732        add     eax, dword ptr [rbp-94H]        ; 1732 _ 03. 85, FFFFFF6C
00001738        movsxd  rcx, eax                        ; 1738 _ 48: 63. C8
0000173B        mov     rdx, qword ptr [rbp-40H]        ; 173B _ 48: 8B. 55, C0
0000173F        mov     rdx, qword ptr [rdx]            ; 173F _ 48: 8B. 12
00001742        movsxd  r8, dword ptr [rbp-98H]         ; 1742 _ 4C: 63. 85, FFFFFF68
00001749        mov     r9, qword ptr [rbp-50H]         ; 1749 _ 4C: 8B. 4D, B0
0000174D        mov     eax, dword ptr [r9+r8*4]        ; 174D _ 43: 8B. 04 81
00001751        mov     dword ptr [rdx+rcx*4], eax      ; 1751 _ 89. 04 8A
00001754        mov     eax, dword ptr [rbp-98H]        ; 1754 _ 8B. 85, FFFFFF68
0000175A        imul    eax, dword ptr [rbp-0CH]        ; 175A _ 0F AF. 45, F4
0000175E        add     eax, dword ptr [rbp-94H]        ; 175E _ 03. 85, FFFFFF6C
00001764        movsxd  rcx, eax                        ; 1764 _ 48: 63. C8
00001767        mov     rdx, qword ptr [rbp-40H]        ; 1767 _ 48: 8B. 55, C0
0000176B        mov     rdx, qword ptr [rdx+8H]         ; 176B _ 48: 8B. 52, 08
0000176F        movsxd  r8, dword ptr [rbp-98H]         ; 176F _ 4C: 63. 85, FFFFFF68
00001776        mov     r9, qword ptr [rbp-68H]         ; 1776 _ 4C: 8B. 4D, 98
0000177A        mov     eax, dword ptr [r9+r8*4]        ; 177A _ 43: 8B. 04 81
0000177E        mov     dword ptr [rdx+rcx*4], eax      ; 177E _ 89. 04 8A
00001781        mov     eax, dword ptr [rbp-94H]        ; 1781 _ 8B. 85, FFFFFF6C
00001787        add     eax, 1                          ; 1787 _ 05, 00000001
; Note: Immediate operand could be made smaller by sign extension
0000178C        mov     dword ptr [rbp-94H], eax        ; 178C _ 89. 85, FFFFFF6C
00001792        jmp     ?_170                           ; 1792 _ E9, FFFFFF7D

?_171:
00001797        mov     eax, dword ptr [rbp-98H]        ; 1797 _ 8B. 85, FFFFFF68
0000179D        add     eax, 1                          ; 179D _ 05, 00000001
; Note: Immediate operand could be made smaller by sign extension
000017A2        mov     dword ptr [rbp-98H], eax        ; 17A2 _ 89. 85, FFFFFF68
000017A8        jmp     ?_169                           ; 17A8 _ E9, FFFFFF4C

?_172:
000017AD        mov     eax, dword ptr [rbp-0CH]        ; 17AD _ 8B. 45, F4
000017B0        mov     rcx, qword ptr [rbp-30H]        ; 17B0 _ 48: 8B. 4D, D0
000017B4        mov     dword ptr [rcx+4H], eax         ; 17B4 _ 89. 41, 04
000017B7        mov     eax, dword ptr [rbp-84H]        ; 17B7 _ 8B. 85, FFFFFF7C
000017BD        mov     rcx, qword ptr [rbp-30H]        ; 17BD _ 48: 8B. 4D, D0
000017C1        mov     dword ptr [rcx], eax            ; 17C1 _ 89. 01
000017C3        mov     rcx, qword ptr [rbp-40H]        ; 17C3 _ 48: 8B. 4D, C0
000017C7        mov     rdx, qword ptr [rbp-8H]         ; 17C7 _ 48: 8B. 55, F8
000017CB        mov     qword ptr [rdx], rcx            ; 17CB _ 48: 89. 0A
000017CE        mov     qword ptr [rbp-40H], 0          ; 17CE _ 48: C7. 45, C0, 00000000
?_173:
000017D6        cmp     qword ptr [rbp-48H], 0          ; 17D6 _ 48: 81. 7D, B8, 00000000
; Note: Immediate operand could be made smaller by sign extension
000017DE        je      ?_174                           ; 17DE _ 0F 84, 00000018
; Note: Immediate operand could be made smaller by sign extension
000017E4        mov     rax, qword ptr [?_889]          ; 17E4 _ 48: 8B. 05, 000094BD(rel)
000017EB        mov     rax, qword ptr [rax+48H]        ; 17EB _ 48: 8B. 40, 48
000017EF        mov     rcx, qword ptr [rbp-48H]        ; 17EF _ 48: 8B. 4D, B8
000017F3        call    rax                             ; 17F3 _ FF. D0
000017F5        mov     qword ptr [rbp-0A0H], rax       ; 17F5 _ 48: 89. 85, FFFFFF60
?_174:
000017FC        cmp     qword ptr [rbp-50H], 0          ; 17FC _ 48: 81. 7D, B0, 00000000
; Note: Immediate operand could be made smaller by sign extension
00001804        je      ?_175                           ; 1804 _ 0F 84, 00000018
; Note: Immediate operand could be made smaller by sign extension
0000180A        mov     rax, qword ptr [?_889]          ; 180A _ 48: 8B. 05, 00009497(rel)
00001811        mov     rax, qword ptr [rax+48H]        ; 1811 _ 48: 8B. 40, 48
00001815        mov     rcx, qword ptr [rbp-50H]        ; 1815 _ 48: 8B. 4D, B0
00001819        call    rax                             ; 1819 _ FF. D0
0000181B        mov     qword ptr [rbp-0A8H], rax       ; 181B _ 48: 89. 85, FFFFFF58
?_175:
00001822        cmp     qword ptr [rbp-58H], 0          ; 1822 _ 48: 81. 7D, A8, 00000000
; Note: Immediate operand could be made smaller by sign extension
0000182A        je      ?_176                           ; 182A _ 0F 84, 00000018
; Note: Immediate operand could be made smaller by sign extension
00001830        mov     rax, qword ptr [?_889]          ; 1830 _ 48: 8B. 05, 00009471(rel)
00001837        mov     rax, qword ptr [rax+48H]        ; 1837 _ 48: 8B. 40, 48
0000183B        mov     rcx, qword ptr [rbp-58H]        ; 183B _ 48: 8B. 4D, A8
0000183F        call    rax                             ; 183F _ FF. D0
00001841        mov     qword ptr [rbp-0B0H], rax       ; 1841 _ 48: 89. 85, FFFFFF50
?_176:
00001848        cmp     qword ptr [rbp-60H], 0          ; 1848 _ 48: 81. 7D, A0, 00000000
; Note: Immediate operand could be made smaller by sign extension
00001850        je      ?_177                           ; 1850 _ 0F 84, 00000018
; Note: Immediate operand could be made smaller by sign extension
00001856        mov     rax, qword ptr [?_889]          ; 1856 _ 48: 8B. 05, 0000944B(rel)
0000185D        mov     rax, qword ptr [rax+48H]        ; 185D _ 48: 8B. 40, 48
00001861        mov     rcx, qword ptr [rbp-60H]        ; 1861 _ 48: 8B. 4D, A0
00001865        call    rax                             ; 1865 _ FF. D0
00001867        mov     qword ptr [rbp-0B8H], rax       ; 1867 _ 48: 89. 85, FFFFFF48
?_177:
0000186E        cmp     qword ptr [rbp-68H], 0          ; 186E _ 48: 81. 7D, 98, 00000000
; Note: Immediate operand could be made smaller by sign extension
00001876        je      ?_178                           ; 1876 _ 0F 84, 00000018
; Note: Immediate operand could be made smaller by sign extension
0000187C        mov     rax, qword ptr [?_889]          ; 187C _ 48: 8B. 05, 00009425(rel)
00001883        mov     rax, qword ptr [rax+48H]        ; 1883 _ 48: 8B. 40, 48
00001887        mov     rcx, qword ptr [rbp-68H]        ; 1887 _ 48: 8B. 4D, 98
0000188B        call    rax                             ; 188B _ FF. D0
0000188D        mov     qword ptr [rbp-0C0H], rax       ; 188D _ 48: 89. 85, FFFFFF40
?_178:
00001894        cmp     qword ptr [rbp-70H], 0          ; 1894 _ 48: 81. 7D, 90, 00000000
; Note: Immediate operand could be made smaller by sign extension
0000189C        je      ?_179                           ; 189C _ 0F 84, 00000018
; Note: Immediate operand could be made smaller by sign extension
000018A2        mov     rax, qword ptr [?_889]          ; 18A2 _ 48: 8B. 05, 000093FF(rel)
000018A9        mov     rax, qword ptr [rax+48H]        ; 18A9 _ 48: 8B. 40, 48
000018AD        mov     rcx, qword ptr [rbp-70H]        ; 18AD _ 48: 8B. 4D, 90
000018B1        call    rax                             ; 18B1 _ FF. D0
000018B3        mov     qword ptr [rbp-0C8H], rax       ; 18B3 _ 48: 89. 85, FFFFFF38
?_179:
000018BA        cmp     qword ptr [rbp-40H], 0          ; 18BA _ 48: 81. 7D, C0, 00000000
; Note: Immediate operand could be made smaller by sign extension
000018C2        je      ?_180                           ; 18C2 _ 0F 84, 00000010
; Note: Immediate operand could be made smaller by sign extension
000018C8        mov     rcx, qword ptr [rbp-40H]        ; 18C8 _ 48: 8B. 4D, C0
000018CC        call    ?_199                           ; 18CC _ E8, 000004BF
000018D1        mov     qword ptr [rbp-0D0H], rax       ; 18D1 _ 48: 89. 85, FFFFFF30
?_180:
000018D8        mov     rax, qword ptr [rbp-38H]        ; 18D8 _ 48: 8B. 45, C8
000018DC        add     rsp, 240                        ; 18DC _ 48: 81. C4, 000000F0
000018E3        pop     rbp                             ; 18E3 _ 5D
000018E4        ret                                     ; 18E4 _ C3

; Filling space: 0BH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H
;       db 00H, 00H, 00H

ALIGN   16

?_181   LABEL NEAR
000018F0        push    rbp                             ; 18F0 _ 55
000018F1        mov     rbp, rsp                        ; 18F1 _ 48: 89. E5
000018F4        push    rsi                             ; 18F4 _ 56
000018F5        push    rbx                             ; 18F5 _ 53
000018F6        sub     rsp, 192                        ; 18F6 _ 48: 81. EC, 000000C0
000018FD        mov     qword ptr [rbp-18H], rcx        ; 18FD _ 48: 89. 4D, E8
00001901        mov     qword ptr [rbp-20H], rdx        ; 1901 _ 48: 89. 55, E0
00001905        mov     qword ptr [rbp-28H], r8         ; 1905 _ 4C: 89. 45, D8
00001909        mov     qword ptr [rbp-30H], r9         ; 1909 _ 4C: 89. 4D, D0
0000190D        cmp     qword ptr [rbp-18H], 0          ; 190D _ 48: 81. 7D, E8, 00000000
; Note: Immediate operand could be made smaller by sign extension
00001915        jne     ?_182                           ; 1915 _ 0F 85, 00000013
; Note: Immediate operand could be made smaller by sign extension
0000191B        mov     rax, 2H                         ; 191B _ 48: B8, 8000000000000002
00001925        mov     qword ptr [rbp-38H], rax        ; 1925 _ 48: 89. 45, C8
00001929        jmp     ?_194                           ; 1929 _ E9, 000003BA

?_182:
0000192E        mov     rax, qword ptr [rbp-18H]        ; 192E _ 48: 8B. 45, E8
00001932        cmp     dword ptr [rax+58H], 7          ; 1932 _ 81. 78, 58, 00000007
; Note: Immediate operand could be made smaller by sign extension
00001939        je      ?_183                           ; 1939 _ 0F 84, 00000013
; Note: Immediate operand could be made smaller by sign extension
0000193F        mov     rax, 2H                         ; 193F _ 48: B8, 8000000000000002
00001949        mov     qword ptr [rbp-38H], rax        ; 1949 _ 48: 89. 45, C8
0000194D        jmp     ?_194                           ; 194D _ E9, 00000396

?_183:
00001952        cmp     qword ptr [rbp-20H], 0          ; 1952 _ 48: 81. 7D, E0, 00000000
; Note: Immediate operand could be made smaller by sign extension
0000195A        jne     ?_184                           ; 195A _ 0F 85, 00000013
; Note: Immediate operand could be made smaller by sign extension
00001960        mov     rax, 2H                         ; 1960 _ 48: B8, 8000000000000002
0000196A        mov     qword ptr [rbp-38H], rax        ; 196A _ 48: 89. 45, C8
0000196E        jmp     ?_194                           ; 196E _ E9, 00000375

?_184:
00001973        cmp     qword ptr [rbp-28H], 0          ; 1973 _ 48: 81. 7D, D8, 00000000
; Note: Immediate operand could be made smaller by sign extension
0000197B        jne     ?_185                           ; 197B _ 0F 85, 00000013
; Note: Immediate operand could be made smaller by sign extension
00001981        mov     rax, 2H                         ; 1981 _ 48: B8, 8000000000000002
0000198B        mov     qword ptr [rbp-38H], rax        ; 198B _ 48: 89. 45, C8
0000198F        jmp     ?_194                           ; 198F _ E9, 00000354

?_185:
00001994        cmp     qword ptr [rbp-30H], 0          ; 1994 _ 48: 81. 7D, D0, 00000000
; Note: Immediate operand could be made smaller by sign extension
0000199C        jne     ?_186                           ; 199C _ 0F 85, 00000013
; Note: Immediate operand could be made smaller by sign extension
000019A2        mov     rax, 2H                         ; 19A2 _ 48: B8, 8000000000000002
000019AC        mov     qword ptr [rbp-38H], rax        ; 19AC _ 48: 89. 45, C8
000019B0        jmp     ?_194                           ; 19B0 _ E9, 00000333

?_186:
000019B5        mov     rax, qword ptr [rbp-18H]        ; 19B5 _ 48: 8B. 45, E8
000019B9        mov     rax, qword ptr [rax+0A0H]       ; 19B9 _ 48: 8B. 80, 000000A0
000019C0        mov     qword ptr [rbp-40H], rax        ; 19C0 _ 48: 89. 45, C0
000019C4        cmp     qword ptr [rbp-40H], 0          ; 19C4 _ 48: 81. 7D, C0, 00000000
; Note: Immediate operand could be made smaller by sign extension
000019CC        jne     ?_187                           ; 19CC _ 0F 85, 00000013
; Note: Immediate operand could be made smaller by sign extension
000019D2        mov     rax, 2H                         ; 19D2 _ 48: B8, 8000000000000002
000019DC        mov     qword ptr [rbp-38H], rax        ; 19DC _ 48: 89. 45, C8
000019E0        jmp     ?_194                           ; 19E0 _ E9, 00000303

?_187:
000019E5        mov     rax, qword ptr [rbp-40H]        ; 19E5 _ 48: 8B. 45, C0
000019E9        mov     rax, qword ptr [rax+18H]        ; 19E9 _ 48: 8B. 40, 18
000019ED        mov     rcx, qword ptr [rbp-40H]        ; 19ED _ 48: 8B. 4D, C0
000019F1        sub     rax, qword ptr [rcx+10H]        ; 19F1 _ 48: 2B. 41, 10
000019F5        mov     qword ptr [rbp-48H], rax        ; 19F5 _ 48: 89. 45, B8
000019F9        mov     rax, qword ptr [rbp-40H]        ; 19F9 _ 48: 8B. 45, C0
000019FD        mov     rax, qword ptr [rax+20H]        ; 19FD _ 48: 8B. 40, 20
00001A01        mov     rcx, qword ptr [rbp-40H]        ; 1A01 _ 48: 8B. 4D, C0
00001A05        sub     rax, qword ptr [rcx+10H]        ; 1A05 _ 48: 2B. 41, 10
00001A09        mov     qword ptr [rbp-50H], rax        ; 1A09 _ 48: 89. 45, B0
00001A0D        mov     rax, qword ptr [rbp-18H]        ; 1A0D _ 48: 8B. 45, E8
00001A11        mov     edx, dword ptr [rax+38H]        ; 1A11 _ 8B. 50, 38
00001A14        mov     r8d, dword ptr [?_847]          ; 1A14 _ 44: 8B. 05, 00008B81(rel)
00001A1B        shl     r8d, 1                          ; 1A1B _ 41: C1. E0, 01
00001A1F        shl     r8d, 1                          ; 1A1F _ 41: C1. E0, 01
00001A23        sub     edx, r8d                        ; 1A23 _ 44: 29. C2
00001A26        movsxd  rax, edx                        ; 1A26 _ 48: 63. C2
00001A29        mov     qword ptr [rbp-58H], rax        ; 1A29 _ 48: 89. 45, A8
00001A2D        cmp     qword ptr [rbp-50H], 0          ; 1A2D _ 48: 81. 7D, B0, 00000000
; Note: Immediate operand could be made smaller by sign extension
00001A35        je      ?_188                           ; 1A35 _ 0F 84, 00000029
; Note: Immediate operand could be made smaller by sign extension
00001A3B        mov     rax, qword ptr [rbp-58H]        ; 1A3B _ 48: 8B. 45, A8
00001A3F        mov     rcx, qword ptr [rbp-50H]        ; 1A3F _ 48: 8B. 4D, B0
00001A43        imul    rcx, rax                        ; 1A43 _ 48: 0F AF. C8
00001A47        mov     rax, qword ptr [rbp-48H]        ; 1A47 _ 48: 8B. 45, B8
00001A4B        mov     qword ptr [rbp-70H], rax        ; 1A4B _ 48: 89. 45, 90
00001A4F        mov     rax, rcx                        ; 1A4F _ 48: 89. C8
00001A52        cqo                                     ; 1A52 _ 48: 99
00001A54        mov     rcx, qword ptr [rbp-70H]        ; 1A54 _ 48: 8B. 4D, 90
00001A58        idiv    rcx                             ; 1A58 _ 48: F7. F9
00001A5B        mov     qword ptr [rbp-58H], rax        ; 1A5B _ 48: 89. 45, A8
00001A5F        jmp     ?_189                           ; 1A5F _ E9, 00000008
; Note: Immediate operand could be made smaller by sign extension

?_188:
00001A64        mov     qword ptr [rbp-58H], 0          ; 1A64 _ 48: C7. 45, A8, 00000000
?_189:
00001A6C        lea     rax, ptr [rbp-68H]              ; 1A6C _ 48: 8D. 45, 98
00001A70        mov     r8, 16                          ; 1A70 _ 49: B8, 0000000000000010
; Note: Immediate operand could be made smaller by zero extension
00001A7A        mov     rcx, qword ptr [?_889]          ; 1A7A _ 48: 8B. 0D, 00009227(rel)
00001A81        mov     rcx, qword ptr [rcx+160H]       ; 1A81 _ 48: 8B. 89, 00000160
00001A88        mov     rdx, rax                        ; 1A88 _ 48: 89. C2
00001A8B        mov     r9, qword ptr [rbp-18H]         ; 1A8B _ 4C: 8B. 4D, E8
00001A8F        add     r9, 44                          ; 1A8F _ 49: 81. C1, 0000002C
; Note: Immediate operand could be made smaller by sign extension
00001A96        mov     qword ptr [rbp-78H], rcx        ; 1A96 _ 48: 89. 4D, 88
00001A9A        mov     rcx, rdx                        ; 1A9A _ 48: 89. D1
00001A9D        mov     rdx, r9                         ; 1A9D _ 4C: 89. CA
00001AA0        mov     r9, qword ptr [rbp-78H]         ; 1AA0 _ 4C: 8B. 4D, 88
00001AA4        mov     qword ptr [rbp-80H], rax        ; 1AA4 _ 48: 89. 45, 80
00001AA8        call    r9                              ; 1AA8 _ 41: FF. D1
00001AAB        mov     rax, qword ptr [rbp-58H]        ; 1AAB _ 48: 8B. 45, A8
00001AAF        mov     r10d, dword ptr [?_847]         ; 1AAF _ 44: 8B. 15, 00008AE6(rel)
00001AB6        shl     r10d, 1                         ; 1AB6 _ 41: C1. E2, 01
00001ABA        movsxd  rcx, r10d                       ; 1ABA _ 49: 63. CA
00001ABD        add     rcx, rax                        ; 1ABD _ 48: 01. C1
00001AC0        mov     r10d, ecx                       ; 1AC0 _ 41: 89. CA
00001AC3        mov     dword ptr [rbp-5CH], r10d       ; 1AC3 _ 44: 89. 55, A4
00001AC7        mov     r8, qword ptr [rbp-20H]         ; 1AC7 _ 4C: 8B. 45, E0
00001ACB        mov     rcx, qword ptr [rbp-80H]        ; 1ACB _ 48: 8B. 4D, 80
00001ACF        mov     rdx, qword ptr [rbp-80H]        ; 1ACF _ 48: 8B. 55, 80
00001AD3        call    ?_111                           ; 1AD3 _ E8, FFFFF193
00001AD8        mov     qword ptr [rbp-38H], rax        ; 1AD8 _ 48: 89. 45, C8
00001ADC        cmp     qword ptr [rbp-38H], 0          ; 1ADC _ 48: 81. 7D, C8, 00000000
; Note: Immediate operand could be made smaller by sign extension
00001AE4        je      ?_190                           ; 1AE4 _ 0F 84, 00000019
; Note: Immediate operand could be made smaller by sign extension
00001AEA        mov     rax, 0EH                        ; 1AEA _ 48: B8, 800000000000000E
00001AF4        cmp     qword ptr [rbp-38H], rax        ; 1AF4 _ 48: 39. 45, C8
00001AF8        je      ?_190                           ; 1AF8 _ 0F 84, 00000005
; Note: Immediate operand could be made smaller by sign extension
00001AFE        jmp     ?_194                           ; 1AFE _ E9, 000001E5

?_190:
00001B03        lea     r8, ptr [rbp-68H]               ; 1B03 _ 4C: 8D. 45, 98
00001B07        mov     rcx, qword ptr [rbp-28H]        ; 1B07 _ 48: 8B. 4D, D8
00001B0B        mov     rdx, qword ptr [rbp-30H]        ; 1B0B _ 48: 8B. 55, D0
00001B0F        mov     rax, qword ptr [rbp-40H]        ; 1B0F _ 48: 8B. 45, C0
00001B13        mov     r9, qword ptr [rax+8H]          ; 1B13 _ 4C: 8B. 48, 08
00001B17        mov     rax, qword ptr [rbp-18H]        ; 1B17 _ 48: 8B. 45, E8
00001B1B        add     rax, 32                         ; 1B1B _ 48: 05, 00000020
; Note: Immediate operand could be made smaller by sign extension
00001B21        mov     r10, qword ptr [rbp-18H]        ; 1B21 _ 4C: 8B. 55, E8
00001B25        add     r10, 44                         ; 1B25 _ 49: 81. C2, 0000002C
; Note: Immediate operand could be made smaller by sign extension
00001B2C        mov     r11, qword ptr [rbp-18H]        ; 1B2C _ 4C: 8B. 5D, E8
00001B30        mov     bl, byte ptr [r11+0A8H]         ; 1B30 _ 41: 8A. 9B, 000000A8
00001B37        mov     r11, qword ptr [rbp-18H]        ; 1B37 _ 4C: 8B. 5D, E8
00001B3B        add     r11, 176                        ; 1B3B _ 49: 81. C3, 000000B0
00001B42        mov     qword ptr [rsp+20H], rax        ; 1B42 _ 48: 89. 44 24, 20
00001B47        mov     qword ptr [rsp+28H], r10        ; 1B47 _ 4C: 89. 54 24, 28
00001B4C        movzx   esi, bl                         ; 1B4C _ 0F B6. F3
00001B4F        mov     dword ptr [rsp+30H], esi        ; 1B4F _ 89. 74 24, 30
00001B53        mov     qword ptr [rsp+38H], r11        ; 1B53 _ 4C: 89. 5C 24, 38
00001B58        call    ?_117                           ; 1B58 _ E8, FFFFF1F6
00001B5D        mov     qword ptr [rbp-38H], rax        ; 1B5D _ 48: 89. 45, C8
00001B61        cmp     qword ptr [rbp-38H], 0          ; 1B61 _ 48: 81. 7D, C8, 00000000
; Note: Immediate operand could be made smaller by sign extension
00001B69        je      ?_191                           ; 1B69 _ 0F 84, 00000019
; Note: Immediate operand could be made smaller by sign extension
00001B6F        mov     rax, 0EH                        ; 1B6F _ 48: B8, 800000000000000E
00001B79        cmp     qword ptr [rbp-38H], rax        ; 1B79 _ 48: 39. 45, C8
00001B7D        je      ?_191                           ; 1B7D _ 0F 84, 00000005
; Note: Immediate operand could be made smaller by sign extension
00001B83        jmp     ?_194                           ; 1B83 _ E9, 00000160

?_191:
00001B88        lea     rax, ptr [rbp-68H]              ; 1B88 _ 48: 8D. 45, 98
00001B8C        mov     r8, 16                          ; 1B8C _ 49: B8, 0000000000000010
; Note: Immediate operand could be made smaller by zero extension
00001B96        mov     rcx, qword ptr [?_889]          ; 1B96 _ 48: 8B. 0D, 0000910B(rel)
00001B9D        mov     rcx, qword ptr [rcx+160H]       ; 1B9D _ 48: 8B. 89, 00000160
00001BA4        mov     rdx, rax                        ; 1BA4 _ 48: 89. C2
00001BA7        mov     r9, qword ptr [rbp-18H]         ; 1BA7 _ 4C: 8B. 4D, E8
00001BAB        add     r9, 44                          ; 1BAB _ 49: 81. C1, 0000002C
; Note: Immediate operand could be made smaller by sign extension
00001BB2        mov     qword ptr [rbp-88H], rcx        ; 1BB2 _ 48: 89. 8D, FFFFFF78
00001BB9        mov     rcx, rdx                        ; 1BB9 _ 48: 89. D1
00001BBC        mov     rdx, r9                         ; 1BBC _ 4C: 89. CA
00001BBF        mov     r9, qword ptr [rbp-88H]         ; 1BBF _ 4C: 8B. 8D, FFFFFF78
00001BC6        mov     qword ptr [rbp-90H], rax        ; 1BC6 _ 48: 89. 85, FFFFFF70
00001BCD        call    r9                              ; 1BCD _ 41: FF. D1
00001BD0        mov     rax, qword ptr [rbp-18H]        ; 1BD0 _ 48: 8B. 45, E8
00001BD4        movsxd  rax, dword ptr [rax+38H]        ; 1BD4 _ 48: 63. 40, 38
00001BD8        mov     rcx, qword ptr [rbp-58H]        ; 1BD8 _ 48: 8B. 4D, A8
00001BDC        mov     r10d, dword ptr [?_847]         ; 1BDC _ 44: 8B. 15, 000089B9(rel)
00001BE3        shl     r10d, 1                         ; 1BE3 _ 41: C1. E2, 01
00001BE7        movsxd  rdx, r10d                       ; 1BE7 _ 49: 63. D2
00001BEA        add     rdx, rcx                        ; 1BEA _ 48: 01. CA
00001BED        sub     rax, rdx                        ; 1BED _ 48: 29. D0
00001BF0        mov     r10d, eax                       ; 1BF0 _ 41: 89. C2
00001BF3        mov     dword ptr [rbp-5CH], r10d       ; 1BF3 _ 44: 89. 55, A4
00001BF7        mov     rax, qword ptr [rbp-58H]        ; 1BF7 _ 48: 8B. 45, A8
00001BFB        mov     r10d, dword ptr [?_847]         ; 1BFB _ 44: 8B. 15, 0000899A(rel)
00001C02        shl     r10d, 1                         ; 1C02 _ 41: C1. E2, 01
00001C06        movsxd  rcx, r10d                       ; 1C06 _ 49: 63. CA
00001C09        add     rcx, rax                        ; 1C09 _ 48: 01. C1
00001C0C        mov     r10d, ecx                       ; 1C0C _ 41: 89. CA
00001C0F        mov     r11d, dword ptr [rbp-68H]       ; 1C0F _ 44: 8B. 5D, 98
00001C13        add     r11d, r10d                      ; 1C13 _ 45: 01. D3
00001C16        mov     dword ptr [rbp-68H], r11d       ; 1C16 _ 44: 89. 5D, 98
00001C1A        mov     r8, qword ptr [rbp-20H]         ; 1C1A _ 4C: 8B. 45, E0
00001C1E        mov     rcx, qword ptr [rbp-90H]        ; 1C1E _ 48: 8B. 8D, FFFFFF70
00001C25        mov     rdx, qword ptr [rbp-90H]        ; 1C25 _ 48: 8B. 95, FFFFFF70
00001C2C        call    ?_111                           ; 1C2C _ E8, FFFFF03A
00001C31        mov     qword ptr [rbp-38H], rax        ; 1C31 _ 48: 89. 45, C8
00001C35        cmp     qword ptr [rbp-38H], 0          ; 1C35 _ 48: 81. 7D, C8, 00000000
; Note: Immediate operand could be made smaller by sign extension
00001C3D        je      ?_192                           ; 1C3D _ 0F 84, 00000019
; Note: Immediate operand could be made smaller by sign extension
00001C43        mov     rax, 0EH                        ; 1C43 _ 48: B8, 800000000000000E
00001C4D        cmp     qword ptr [rbp-38H], rax        ; 1C4D _ 48: 39. 45, C8
00001C51        je      ?_192                           ; 1C51 _ 0F 84, 00000005
; Note: Immediate operand could be made smaller by sign extension
00001C57        jmp     ?_194                           ; 1C57 _ E9, 0000008C

?_192:
00001C5C        lea     r8, ptr [rbp-68H]               ; 1C5C _ 4C: 8D. 45, 98
00001C60        mov     rcx, qword ptr [rbp-28H]        ; 1C60 _ 48: 8B. 4D, D8
00001C64        mov     rdx, qword ptr [rbp-30H]        ; 1C64 _ 48: 8B. 55, D0
00001C68        mov     rax, qword ptr [rbp-40H]        ; 1C68 _ 48: 8B. 45, C0
00001C6C        mov     r9, qword ptr [rax]             ; 1C6C _ 4C: 8B. 08
00001C6F        mov     rax, qword ptr [rbp-18H]        ; 1C6F _ 48: 8B. 45, E8
00001C73        add     rax, 32                         ; 1C73 _ 48: 05, 00000020
; Note: Immediate operand could be made smaller by sign extension
00001C79        mov     r10, qword ptr [rbp-18H]        ; 1C79 _ 4C: 8B. 55, E8
00001C7D        add     r10, 44                         ; 1C7D _ 49: 81. C2, 0000002C
; Note: Immediate operand could be made smaller by sign extension
00001C84        mov     r11, qword ptr [rbp-18H]        ; 1C84 _ 4C: 8B. 5D, E8
00001C88        mov     bl, byte ptr [r11+0A8H]         ; 1C88 _ 41: 8A. 9B, 000000A8
00001C8F        mov     r11, qword ptr [rbp-18H]        ; 1C8F _ 4C: 8B. 5D, E8
00001C93        add     r11, 176                        ; 1C93 _ 49: 81. C3, 000000B0
00001C9A        mov     qword ptr [rsp+20H], rax        ; 1C9A _ 48: 89. 44 24, 20
00001C9F        mov     qword ptr [rsp+28H], r10        ; 1C9F _ 4C: 89. 54 24, 28
00001CA4        movzx   esi, bl                         ; 1CA4 _ 0F B6. F3
00001CA7        mov     dword ptr [rsp+30H], esi        ; 1CA7 _ 89. 74 24, 30
00001CAB        mov     qword ptr [rsp+38H], r11        ; 1CAB _ 4C: 89. 5C 24, 38
00001CB0        call    ?_117                           ; 1CB0 _ E8, FFFFF09E
00001CB5        mov     qword ptr [rbp-38H], rax        ; 1CB5 _ 48: 89. 45, C8
00001CB9        cmp     qword ptr [rbp-38H], 0          ; 1CB9 _ 48: 81. 7D, C8, 00000000
; Note: Immediate operand could be made smaller by sign extension
00001CC1        je      ?_193                           ; 1CC1 _ 0F 84, 00000019
; Note: Immediate operand could be made smaller by sign extension
00001CC7        mov     rax, 0EH                        ; 1CC7 _ 48: B8, 800000000000000E
00001CD1        cmp     qword ptr [rbp-38H], rax        ; 1CD1 _ 48: 39. 45, C8
00001CD5        je      ?_193                           ; 1CD5 _ 0F 84, 00000005
; Note: Immediate operand could be made smaller by sign extension
00001CDB        jmp     ?_194                           ; 1CDB _ E9, 00000008
; Note: Immediate operand could be made smaller by sign extension

?_193:
00001CE0        mov     qword ptr [rbp-38H], 0          ; 1CE0 _ 48: C7. 45, C8, 00000000
?_194:
00001CE8        mov     rax, qword ptr [rbp-38H]        ; 1CE8 _ 48: 8B. 45, C8
00001CEC        add     rsp, 192                        ; 1CEC _ 48: 81. C4, 000000C0
00001CF3        pop     rbx                             ; 1CF3 _ 5B
00001CF4        pop     rsi                             ; 1CF4 _ 5E
00001CF5        pop     rbp                             ; 1CF5 _ 5D
00001CF6        ret                                     ; 1CF6 _ C3

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16

?_195   LABEL NEAR
00001D00        push    rbp                             ; 1D00 _ 55
00001D01        mov     rbp, rsp                        ; 1D01 _ 48: 89. E5
00001D04        sub     rsp, 48                         ; 1D04 _ 48: 83. EC, 30
00001D08        mov     qword ptr [rbp-8H], rcx         ; 1D08 _ 48: 89. 4D, F8
00001D0C        cmp     qword ptr [rbp-8H], 0           ; 1D0C _ 48: 81. 7D, F8, 00000000
; Note: Immediate operand could be made smaller by sign extension
00001D14        jne     ?_196                           ; 1D14 _ 0F 85, 00000013
; Note: Immediate operand could be made smaller by sign extension
00001D1A        mov     rax, 2H                         ; 1D1A _ 48: B8, 8000000000000002
00001D24        mov     qword ptr [rbp-10H], rax        ; 1D24 _ 48: 89. 45, F0
00001D28        jmp     ?_198                           ; 1D28 _ E9, 0000004A
; Note: Immediate operand could be made smaller by sign extension

?_196:
00001D2D        mov     rax, qword ptr [rbp-8H]         ; 1D2D _ 48: 8B. 45, F8
00001D31        cmp     dword ptr [rax+58H], 7          ; 1D31 _ 81. 78, 58, 00000007
; Note: Immediate operand could be made smaller by sign extension
00001D38        je      ?_197                           ; 1D38 _ 0F 84, 00000013
; Note: Immediate operand could be made smaller by sign extension
00001D3E        mov     rax, 2H                         ; 1D3E _ 48: B8, 8000000000000002
00001D48        mov     qword ptr [rbp-10H], rax        ; 1D48 _ 48: 89. 45, F0
00001D4C        jmp     ?_198                           ; 1D4C _ E9, 00000026
; Note: Immediate operand could be made smaller by sign extension

?_197:
00001D51        mov     rax, qword ptr [rbp-8H]         ; 1D51 _ 48: 8B. 45, F8
00001D55        mov     rax, qword ptr [rax+0A0H]       ; 1D55 _ 48: 8B. 80, 000000A0
00001D5C        mov     rcx, rax                        ; 1D5C _ 48: 89. C1
00001D5F        call    ?_199                           ; 1D5F _ E8, 0000002C
00001D64        mov     qword ptr [rbp-10H], rax        ; 1D64 _ 48: 89. 45, F0
00001D68        mov     rax, qword ptr [rbp-8H]         ; 1D68 _ 48: 8B. 45, F8
00001D6C        mov     qword ptr [rax+0A0H], 0         ; 1D6C _ 48: C7. 80, 000000A0, 00000000
?_198:
00001D77        mov     rax, qword ptr [rbp-10H]        ; 1D77 _ 48: 8B. 45, F0
00001D7B        add     rsp, 48                         ; 1D7B _ 48: 83. C4, 30
00001D7F        pop     rbp                             ; 1D7F _ 5D
00001D80        ret                                     ; 1D80 _ C3

; Filling space: 0FH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 66H, 66H, 66H, 66H, 2EH, 0FH
;       db 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16

?_199   LABEL NEAR
00001D90        push    rbp                             ; 1D90 _ 55
00001D91        mov     rbp, rsp                        ; 1D91 _ 48: 89. E5
00001D94        sub     rsp, 80                         ; 1D94 _ 48: 83. EC, 50
00001D98        mov     qword ptr [rbp-8H], rcx         ; 1D98 _ 48: 89. 4D, F8
00001D9C        cmp     qword ptr [rbp-8H], 0           ; 1D9C _ 48: 81. 7D, F8, 00000000
; Note: Immediate operand could be made smaller by sign extension
00001DA4        jne     ?_200                           ; 1DA4 _ 0F 85, 00000013
; Note: Immediate operand could be made smaller by sign extension
00001DAA        mov     rax, 2H                         ; 1DAA _ 48: B8, 8000000000000002
00001DB4        mov     qword ptr [rbp-10H], rax        ; 1DB4 _ 48: 89. 45, F0
00001DB8        jmp     ?_203                           ; 1DB8 _ E9, 00000088

?_200:
00001DBD        mov     rax, qword ptr [rbp-8H]         ; 1DBD _ 48: 8B. 45, F8
00001DC1        cmp     qword ptr [rax], 0              ; 1DC1 _ 48: 81. 38, 00000000
; Note: Immediate operand could be made smaller by sign extension
00001DC8        je      ?_201                           ; 1DC8 _ 0F 84, 00000023
; Note: Immediate operand could be made smaller by sign extension
00001DCE        mov     rax, qword ptr [?_889]          ; 1DCE _ 48: 8B. 05, 00008ED3(rel)
00001DD5        mov     rax, qword ptr [rax+48H]        ; 1DD5 _ 48: 8B. 40, 48
00001DD9        mov     rcx, qword ptr [rbp-8H]         ; 1DD9 _ 48: 8B. 4D, F8
00001DDD        mov     rcx, qword ptr [rcx]            ; 1DDD _ 48: 8B. 09
00001DE0        call    rax                             ; 1DE0 _ FF. D0
00001DE2        mov     rcx, qword ptr [rbp-8H]         ; 1DE2 _ 48: 8B. 4D, F8
00001DE6        mov     qword ptr [rcx], 0              ; 1DE6 _ 48: C7. 01, 00000000
00001DED        mov     qword ptr [rbp-18H], rax        ; 1DED _ 48: 89. 45, E8
?_201:
00001DF1        mov     rax, qword ptr [rbp-8H]         ; 1DF1 _ 48: 8B. 45, F8
00001DF5        cmp     qword ptr [rax+8H], 0           ; 1DF5 _ 48: 81. 78, 08, 00000000
; Note: Immediate operand could be made smaller by sign extension
00001DFD        je      ?_202                           ; 1DFD _ 0F 84, 00000025
; Note: Immediate operand could be made smaller by sign extension
00001E03        mov     rax, qword ptr [?_889]          ; 1E03 _ 48: 8B. 05, 00008E9E(rel)
00001E0A        mov     rax, qword ptr [rax+48H]        ; 1E0A _ 48: 8B. 40, 48
00001E0E        mov     rcx, qword ptr [rbp-8H]         ; 1E0E _ 48: 8B. 4D, F8
00001E12        mov     rcx, qword ptr [rcx+8H]         ; 1E12 _ 48: 8B. 49, 08
00001E16        call    rax                             ; 1E16 _ FF. D0
00001E18        mov     rcx, qword ptr [rbp-8H]         ; 1E18 _ 48: 8B. 4D, F8
00001E1C        mov     qword ptr [rcx+8H], 0           ; 1E1C _ 48: C7. 41, 08, 00000000
00001E24        mov     qword ptr [rbp-20H], rax        ; 1E24 _ 48: 89. 45, E0
?_202:
00001E28        mov     rax, qword ptr [?_889]          ; 1E28 _ 48: 8B. 05, 00008E79(rel)
00001E2F        mov     rax, qword ptr [rax+48H]        ; 1E2F _ 48: 8B. 40, 48
00001E33        mov     rcx, qword ptr [rbp-8H]         ; 1E33 _ 48: 8B. 4D, F8
00001E37        call    rax                             ; 1E37 _ FF. D0
00001E39        mov     qword ptr [rbp-10H], 0          ; 1E39 _ 48: C7. 45, F0, 00000000
00001E41        mov     qword ptr [rbp-28H], rax        ; 1E41 _ 48: 89. 45, D8
?_203:
00001E45        mov     rax, qword ptr [rbp-10H]        ; 1E45 _ 48: 8B. 45, F0
00001E49        add     rsp, 80                         ; 1E49 _ 48: 83. C4, 50
00001E4D        pop     rbp                             ; 1E4D _ 5D
00001E4E        ret                                     ; 1E4E _ C3

00001E4F        nop                                     ; 1E4F _ 90
?_204:
00001E50        push    rbp                             ; 1E50 _ 55
00001E51        mov     rbp, rsp                        ; 1E51 _ 48: 89. E5
00001E54        sub     rsp, 64                         ; 1E54 _ 48: 83. EC, 40
00001E58        mov     qword ptr [rbp-8H], rcx         ; 1E58 _ 48: 89. 4D, F8
00001E5C        mov     qword ptr [rbp-10H], rdx        ; 1E5C _ 48: 89. 55, F0
00001E60        cmp     qword ptr [rbp-8H], 0           ; 1E60 _ 48: 81. 7D, F8, 00000000
; Note: Immediate operand could be made smaller by sign extension
00001E68        jne     ?_205                           ; 1E68 _ 0F 85, 00000013
; Note: Immediate operand could be made smaller by sign extension
00001E6E        mov     rax, 2H                         ; 1E6E _ 48: B8, 8000000000000002
00001E78        mov     qword ptr [rbp-18H], rax        ; 1E78 _ 48: 89. 45, E8
00001E7C        jmp     ?_211                           ; 1E7C _ E9, 000000F9

?_205:
00001E81        mov     rax, qword ptr [rbp-8H]         ; 1E81 _ 48: 8B. 45, F8
00001E85        cmp     dword ptr [rax+58H], 7          ; 1E85 _ 81. 78, 58, 00000007
; Note: Immediate operand could be made smaller by sign extension
00001E8C        je      ?_206                           ; 1E8C _ 0F 84, 00000013
; Note: Immediate operand could be made smaller by sign extension
00001E92        mov     rax, 2H                         ; 1E92 _ 48: B8, 8000000000000002
00001E9C        mov     qword ptr [rbp-18H], rax        ; 1E9C _ 48: 89. 45, E8
00001EA0        jmp     ?_211                           ; 1EA0 _ E9, 000000D5

?_206:
00001EA5        lea     rcx, ptr [?_847]                ; 1EA5 _ 48: 8D. 0D, 000086F0(rel)
00001EAC        call    ?_079                           ; 1EAC _ E8, FFFFEB72
00001EB1        mov     qword ptr [rbp-18H], rax        ; 1EB1 _ 48: 89. 45, E8
00001EB5        mov     rax, 0                          ; 1EB5 _ 48: B8, 0000000000000000
; Note: Immediate operand could be made smaller by zero extension
00001EBF        cmp     rax, qword ptr [rbp-18H]        ; 1EBF _ 48: 3B. 45, E8
00001EC3        je      ?_207                           ; 1EC3 _ 0F 84, 00000005
; Note: Immediate operand could be made smaller by sign extension
00001EC9        jmp     ?_211                           ; 1EC9 _ E9, 000000AC

?_207:
00001ECE        mov     rax, qword ptr [rbp-8H]         ; 1ECE _ 48: 8B. 45, F8
00001ED2        mov     rax, qword ptr [rax+0A0H]       ; 1ED2 _ 48: 8B. 80, 000000A0
00001ED9        mov     qword ptr [rbp-20H], rax        ; 1ED9 _ 48: 89. 45, E0
00001EDD        cmp     qword ptr [rbp-20H], 0          ; 1EDD _ 48: 81. 7D, E0, 00000000
; Note: Immediate operand could be made smaller by sign extension
00001EE5        jne     ?_208                           ; 1EE5 _ 0F 85, 00000013
; Note: Immediate operand could be made smaller by sign extension
00001EEB        mov     rax, 2H                         ; 1EEB _ 48: B8, 8000000000000002
00001EF5        mov     qword ptr [rbp-18H], rax        ; 1EF5 _ 48: 89. 45, E8
00001EF9        jmp     ?_211                           ; 1EF9 _ E9, 0000007C
; Note: Immediate operand could be made smaller by sign extension

?_208:
00001EFE        mov     rax, qword ptr [rbp-10H]        ; 1EFE _ 48: 8B. 45, F0
00001F02        mov     rcx, qword ptr [rbp-20H]        ; 1F02 _ 48: 8B. 4D, E0
00001F06        cmp     rax, qword ptr [rcx+18H]        ; 1F06 _ 48: 3B. 41, 18
00001F0A        jle     ?_209                           ; 1F0A _ 0F 8E, 00000013
; Note: Immediate operand could be made smaller by sign extension
00001F10        mov     rax, 2H                         ; 1F10 _ 48: B8, 8000000000000002
00001F1A        mov     qword ptr [rbp-18H], rax        ; 1F1A _ 48: 89. 45, E8
00001F1E        jmp     ?_211                           ; 1F1E _ E9, 00000057
; Note: Immediate operand could be made smaller by sign extension

?_209:
00001F23        mov     rax, qword ptr [rbp-10H]        ; 1F23 _ 48: 8B. 45, F0
00001F27        mov     rcx, qword ptr [rbp-20H]        ; 1F27 _ 48: 8B. 4D, E0
00001F2B        cmp     rax, qword ptr [rcx+10H]        ; 1F2B _ 48: 3B. 41, 10
00001F2F        jge     ?_210                           ; 1F2F _ 0F 8D, 00000013
; Note: Immediate operand could be made smaller by sign extension
00001F35        mov     rax, 2H                         ; 1F35 _ 48: B8, 8000000000000002
00001F3F        mov     qword ptr [rbp-18H], rax        ; 1F3F _ 48: 89. 45, E8
00001F43        jmp     ?_211                           ; 1F43 _ E9, 00000032
; Note: Immediate operand could be made smaller by sign extension

?_210:
00001F48        mov     rax, qword ptr [rbp-10H]        ; 1F48 _ 48: 8B. 45, F0
00001F4C        mov     rcx, qword ptr [rbp-20H]        ; 1F4C _ 48: 8B. 4D, E0
00001F50        mov     qword ptr [rcx+20H], rax        ; 1F50 _ 48: 89. 41, 20
00001F54        mov     rcx, qword ptr [rbp-8H]         ; 1F54 _ 48: 8B. 4D, F8
00001F58        call    ?_091                           ; 1F58 _ E8, FFFFEBAA
00001F5D        mov     qword ptr [rbp-18H], rax        ; 1F5D _ 48: 89. 45, E8
00001F61        mov     rax, 0                          ; 1F61 _ 48: B8, 0000000000000000
; Note: Immediate operand could be made smaller by zero extension
00001F6B        cmp     rax, qword ptr [rbp-18H]        ; 1F6B _ 48: 3B. 45, E8
00001F6F        je      ?_211                           ; 1F6F _ 0F 84, 00000005
; Note: Immediate operand could be made smaller by sign extension
00001F75        jmp     ?_211                           ; 1F75 _ E9, 00000000
; Note: Immediate operand could be made smaller by sign extension

?_211:
00001F7A        mov     rax, qword ptr [rbp-18H]        ; 1F7A _ 48: 8B. 45, E8
00001F7E        add     rsp, 64                         ; 1F7E _ 48: 83. C4, 40
00001F82        pop     rbp                             ; 1F82 _ 5D
00001F83        ret                                     ; 1F83 _ C3

?_212   LABEL NEAR
00001F84        push    rbp                             ; 1F84 _ 55
00001F85        mov     rbp, rsp                        ; 1F85 _ 48: 89. E5
00001F88        push    r15                             ; 1F88 _ 41: 57
00001F8A        push    r14                             ; 1F8A _ 41: 56
00001F8C        push    r13                             ; 1F8C _ 41: 55
00001F8E        push    r12                             ; 1F8E _ 41: 54
00001F90        push    rsi                             ; 1F90 _ 56
00001F91        push    rdi                             ; 1F91 _ 57
00001F92        push    rbx                             ; 1F92 _ 53
00001F93        sub     rsp, 120                        ; 1F93 _ 48: 83. EC, 78
00001F97        mov     dword ptr [rbp-64H], r9d        ; 1F97 _ 44: 89. 4D, 9C
00001F9B        mov     qword ptr [rbp-70H], r8         ; 1F9B _ 4C: 89. 45, 90
00001F9F        mov     qword ptr [rbp-78H], rdx        ; 1F9F _ 48: 89. 55, 88
00001FA3        mov     rdi, rcx                        ; 1FA3 _ 48: 89. CF
00001FA6        mov     qword ptr [rbp-40H], 0          ; 1FA6 _ 48: C7. 45, C0, 00000000
00001FAE        lea     rcx, ptr [?_817]                ; 1FAE _ 48: 8D. 0D, 00008407(rel)
00001FB5        lea     rdx, ptr [rbp-40H]              ; 1FB5 _ 48: 8D. 55, C0
00001FB9        call    ?_004                           ; 1FB9 _ E8, FFFFE2D2
00001FBE        mov     rbx, rax                        ; 1FBE _ 48: 89. C3
00001FC1        test    rbx, rbx                        ; 1FC1 _ 48: 85. DB
00001FC4        js      ?_226                           ; 1FC4 _ 0F 88, 00000297
00001FCA        mov     rax, qword ptr [rbp-40H]        ; 1FCA _ 48: 8B. 45, C0
00001FCE        lea     r15, ptr [?_815]                ; 1FCE _ 4C: 8D. 3D, 000083C7(rel)
?_213:
00001FD5        mov     rcx, r15                        ; 1FD5 _ 4C: 89. F9
00001FD8        mov     rdx, rax                        ; 1FD8 _ 48: 89. C2
00001FDB        call    ?_014                           ; 1FDB _ E8, FFFFE411
00001FE0        mov     qword ptr [rbp-40H], rax        ; 1FE0 _ 48: 89. 45, C0
00001FE4        mov     rbx, 0EH                        ; 1FE4 _ 48: BB, 800000000000000E
00001FEE        test    rax, rax                        ; 1FEE _ 48: 85. C0
00001FF1        je      ?_226                           ; 1FF1 _ 0F 84, 0000026A
00001FF7        mov     ecx, dword ptr [rax+2CH]        ; 1FF7 _ 8B. 48, 2C
00001FFA        lea     rsi, ptr [rax+48H]              ; 1FFA _ 48: 8D. 70, 48
00001FFE        mov     rdx, -1                         ; 1FFE _ 48: C7. C2, FFFFFFFF
?_214:
00002005        mov     r13, rsi                        ; 2005 _ 49: 89. F5
00002008        inc     rdx                             ; 2008 _ 48: FF. C2
0000200B        cmp     rdx, rcx                        ; 200B _ 48: 39. CA
0000200E        jnc     ?_213                           ; 200E _ 73, C5
00002010        lea     rsi, ptr [r13+30H]              ; 2010 _ 49: 8D. 75, 30
00002014        mov     r8d, dword ptr [r13-18H]        ; 2014 _ 45: 8B. 45, E8
00002018        test    r8b, 1H                         ; 2018 _ 41: F6. C0, 01
0000201C        jz      ?_214                           ; 201C _ 74, E7
0000201E        mov     rbx, qword ptr [rdi+10H]        ; 201E _ 48: 8B. 5F, 10
00002022        cmp     rbx, qword ptr [r13-10H]        ; 2022 _ 49: 3B. 5D, F0
00002026        jnz     ?_214                           ; 2026 _ 75, DD
00002028        mov     qword ptr [rbp-48H], 0          ; 2028 _ 48: C7. 45, B8, 00000000
00002030        mov     rax, qword ptr [?_889]          ; 2030 _ 48: 8B. 05, 00008C71(rel)
00002037        mov     rax, qword ptr [rax+138H]       ; 2037 _ 48: 8B. 80, 00000138
0000203E        lea     rcx, ptr [rbp-58H]              ; 203E _ 48: 8D. 4D, A8
00002042        test    r8b, 4H                         ; 2042 _ 41: F6. C0, 04
00002046        je      ?_217                           ; 2046 _ 0F 84, 000000C7
0000204C        mov     qword ptr [rsp+20H], rcx        ; 204C _ 48: 89. 4C 24, 20
00002051        lea     rdx, ptr [?_824]                ; 2051 _ 48: 8D. 15, 000083D4(rel)
00002058        lea     r9, ptr [rbp-50H]               ; 2058 _ 4C: 8D. 4D, B0
0000205C        mov     ecx, 2                          ; 205C _ B9, 00000002
00002061        xor     r8d, r8d                        ; 2061 _ 45: 31. C0
00002064        call    rax                             ; 2064 _ FF. D0
00002066        test    rax, rax                        ; 2066 _ 48: 85. C0
00002069        js      ?_216                           ; 2069 _ 78, 78
0000206B        mov     rax, qword ptr [rbp-50H]        ; 206B _ 48: 8B. 45, B0
0000206F        test    rax, rax                        ; 206F _ 48: 85. C0
00002072        jz      ?_216                           ; 2072 _ 74, 6F
00002074        xor     r14d, r14d                      ; 2074 _ 45: 31. F6
00002077        lea     rsi, ptr [?_824]                ; 2077 _ 48: 8D. 35, 000083AE(rel)
0000207E        lea     r15, ptr [rbp-48H]              ; 207E _ 4C: 8D. 7D, B8
00002082        lea     r12, ptr [rbp-60H]              ; 2082 _ 4C: 8D. 65, A0
?_215:
00002086        cmp     r14, rax                        ; 2086 _ 49: 39. C6
00002089        jnc     ?_220                           ; 2089 _ 0F 83, 00000100
0000208F        mov     rax, qword ptr [rbp-58H]        ; 208F _ 48: 8B. 45, A8
00002093        mov     rcx, qword ptr [rax+r14*8]      ; 2093 _ 4A: 8B. 0C F0
00002097        mov     rax, qword ptr [?_889]          ; 2097 _ 48: 8B. 05, 00008C0A(rel)
0000209E        mov     rdx, rsi                        ; 209E _ 48: 89. F2
000020A1        mov     r8, r15                         ; 20A1 _ 4D: 89. F8
000020A4        call    qword ptr [rax+98H]             ; 20A4 _ FF. 90, 00000098
000020AA        test    rax, rax                        ; 20AA _ 48: 85. C0
000020AD        js      ?_220                           ; 20AD _ 0F 88, 000000DC
000020B3        mov     rax, qword ptr [rbp-48H]        ; 20B3 _ 48: 8B. 45, B8
000020B7        mov     rcx, rax                        ; 20B7 _ 48: 89. C1
000020BA        mov     rdx, r12                        ; 20BA _ 4C: 89. E2
000020BD        call    qword ptr [rax+10H]             ; 20BD _ FF. 50, 10
000020C0        mov     rbx, rax                        ; 20C0 _ 48: 89. C3
000020C3        test    rbx, rbx                        ; 20C3 _ 48: 85. DB
000020C6        js      ?_220                           ; 20C6 _ 0F 88, 000000C3
000020CC        mov     rax, qword ptr [rbp-60H]        ; 20CC _ 48: 8B. 45, A0
000020D0        cmp     rax, qword ptr [rdi+10H]        ; 20D0 _ 48: 3B. 47, 10
000020D4        je      ?_221                           ; 20D4 _ 0F 84, 000000ED
000020DA        inc     r14                             ; 20DA _ 49: FF. C6
000020DD        mov     rax, qword ptr [rbp-50H]        ; 20DD _ 48: 8B. 45, B0
000020E1        jmp     ?_215                           ; 20E1 _ EB, A3

?_216:
000020E3        mov     rbx, 0EH                        ; 20E3 _ 48: BB, 800000000000000E
000020ED        mov     rcx, qword ptr [rbp-58H]        ; 20ED _ 48: 8B. 4D, A8
000020F1        test    rcx, rcx                        ; 20F1 _ 48: 85. C9
000020F4        je      ?_226                           ; 20F4 _ 0F 84, 00000167
000020FA        mov     rax, qword ptr [?_889]          ; 20FA _ 48: 8B. 05, 00008BA7(rel)
00002101        call    qword ptr [rax+48H]             ; 2101 _ FF. 50, 48
00002104        mov     rbx, 0EH                        ; 2104 _ 48: BB, 800000000000000E
0000210E        jmp     ?_226                           ; 210E _ E9, 0000014E

?_217:
00002113        mov     qword ptr [rsp+20H], rcx        ; 2113 _ 48: 89. 4C 24, 20
00002118        lea     r9, ptr [rbp-50H]               ; 2118 _ 4C: 8D. 4D, B0
0000211C        mov     ecx, 2                          ; 211C _ B9, 00000002
00002121        mov     rdx, r13                        ; 2121 _ 4C: 89. EA
00002124        xor     r8d, r8d                        ; 2124 _ 45: 31. C0
00002127        call    rax                             ; 2127 _ FF. D0
00002129        test    rax, rax                        ; 2129 _ 48: 85. C0
0000212C        js      ?_216                           ; 212C _ 78, B5
0000212E        mov     rax, qword ptr [rbp-50H]        ; 212E _ 48: 8B. 45, B0
00002132        test    rax, rax                        ; 2132 _ 48: 85. C0
00002135        jz      ?_216                           ; 2135 _ 74, AC
00002137        xor     r14d, r14d                      ; 2137 _ 45: 31. F6
0000213A        lea     rsi, ptr [rbp-48H]              ; 213A _ 48: 8D. 75, B8
0000213E        lea     r15, ptr [rbp-60H]              ; 213E _ 4C: 8D. 7D, A0
00002142        jmp     ?_219                           ; 2142 _ EB, 11

?_218:
00002144        mov     rax, qword ptr [rbp-60H]        ; 2144 _ 48: 8B. 45, A0
00002148        cmp     rax, qword ptr [rdi+10H]        ; 2148 _ 48: 3B. 47, 10
0000214C        jz      ?_221                           ; 214C _ 74, 79
0000214E        inc     r14                             ; 214E _ 49: FF. C6
00002151        mov     rax, qword ptr [rbp-50H]        ; 2151 _ 48: 8B. 45, B0
?_219:
00002155        cmp     r14, rax                        ; 2155 _ 49: 39. C6
00002158        jnc     ?_220                           ; 2158 _ 73, 35
0000215A        mov     rax, qword ptr [rbp-58H]        ; 215A _ 48: 8B. 45, A8
0000215E        mov     rcx, qword ptr [rax+r14*8]      ; 215E _ 4A: 8B. 0C F0
00002162        mov     rax, qword ptr [?_889]          ; 2162 _ 48: 8B. 05, 00008B3F(rel)
00002169        mov     rdx, r13                        ; 2169 _ 4C: 89. EA
0000216C        mov     r8, rsi                         ; 216C _ 49: 89. F0
0000216F        call    qword ptr [rax+98H]             ; 216F _ FF. 90, 00000098
00002175        test    rax, rax                        ; 2175 _ 48: 85. C0
00002178        js      ?_220                           ; 2178 _ 78, 15
0000217A        mov     rax, qword ptr [rbp-48H]        ; 217A _ 48: 8B. 45, B8
0000217E        mov     rcx, rax                        ; 217E _ 48: 89. C1
00002181        mov     rdx, r15                        ; 2181 _ 4C: 89. FA
00002184        call    qword ptr [rax+10H]             ; 2184 _ FF. 50, 10
00002187        mov     rbx, rax                        ; 2187 _ 48: 89. C3
0000218A        test    rbx, rbx                        ; 218A _ 48: 85. DB
0000218D        jns     ?_218                           ; 218D _ 79, B5
?_220:
0000218F        mov     rbx, 0EH                        ; 218F _ 48: BB, 800000000000000E
00002199        mov     rcx, qword ptr [rbp-58H]        ; 2199 _ 48: 8B. 4D, A8
0000219D        test    rcx, rcx                        ; 219D _ 48: 85. C9
000021A0        je      ?_226                           ; 21A0 _ 0F 84, 000000BB
000021A6        mov     rax, qword ptr [?_889]          ; 21A6 _ 48: 8B. 05, 00008AFB(rel)
000021AD        call    qword ptr [rax+48H]             ; 21AD _ FF. 50, 48
000021B0        mov     qword ptr [rbp-58H], 0          ; 21B0 _ 48: C7. 45, A8, 00000000
000021B8        mov     rbx, 0EH                        ; 21B8 _ 48: BB, 800000000000000E
000021C2        jmp     ?_226                           ; 21C2 _ E9, 0000009A

?_221:
000021C7        test    byte ptr [r13-18H], 8H          ; 21C7 _ 41: F6. 45, E8, 08
000021CC        mov     r8d, dword ptr [rbp-64H]        ; 21CC _ 44: 8B. 45, 9C
000021D0        mov     rsi, qword ptr [rbp-70H]        ; 21D0 _ 48: 8B. 75, 90
000021D4        mov     r9, qword ptr [rbp-78H]         ; 21D4 _ 4C: 8B. 4D, 88
000021D8        jz      ?_222                           ; 21D8 _ 74, 0A
000021DA        cmp     byte ptr [rdi+30H], 0           ; 21DA _ 80. 7F, 30, 00
000021DE        jnz     ?_222                           ; 21DE _ 75, 04
000021E0        mov     byte ptr [rdi+30H], 1           ; 21E0 _ C6. 47, 30, 01
?_222:
000021E4        mov     eax, dword ptr [rdi+8H]         ; 21E4 _ 8B. 47, 08
000021E7        cmp     eax, 1                          ; 21E7 _ 83. F8, 01
000021EA        jz      ?_223                           ; 21EA _ 74, 2F
000021EC        test    eax, eax                        ; 21EC _ 85. C0
000021EE        jnz     ?_225                           ; 21EE _ 75, 56
000021F0        mov     rbx, 2H                         ; 21F0 _ 48: BB, 8000000000000002
000021FA        cmp     r8b, 11                         ; 21FA _ 41: 80. F8, 0B
000021FE        jnz     ?_225                           ; 21FE _ 75, 46
00002200        mov     rax, qword ptr [rbp-58H]        ; 2200 _ 48: 8B. 45, A8
00002204        mov     rcx, qword ptr [rax+r14*8]      ; 2204 _ 4A: 8B. 0C F0
00002208        mov     rdx, qword ptr [rbp-48H]        ; 2208 _ 48: 8B. 55, B8
0000220C        mov     qword ptr [rsp+20H], rsi        ; 220C _ 48: 89. 74 24, 20
00002211        mov     r8, rdi                         ; 2211 _ 49: 89. F8
00002214        call    ?_323                           ; 2214 _ E8, 00001460
00002219        jmp     ?_224                           ; 2219 _ EB, 28

?_223:
0000221B        mov     rax, qword ptr [rbp-58H]        ; 221B _ 48: 8B. 45, A8
0000221F        mov     rcx, qword ptr [rax+r14*8]      ; 221F _ 4A: 8B. 0C F0
00002223        mov     rdx, qword ptr [rbp-48H]        ; 2223 _ 48: 8B. 55, B8
00002227        mov     eax, dword ptr [rbp+30H]        ; 2227 _ 8B. 45, 30
0000222A        mov     dword ptr [rsp+30H], eax        ; 222A _ 89. 44 24, 30
0000222E        movzx   eax, r8b                        ; 222E _ 41: 0F B6. C0
00002232        mov     dword ptr [rsp+28H], eax        ; 2232 _ 89. 44 24, 28
00002236        mov     qword ptr [rsp+20H], rsi        ; 2236 _ 48: 89. 74 24, 20
0000223B        mov     r8, rdi                         ; 223B _ 49: 89. F8
0000223E        call    ?_329                           ; 223E _ E8, 00001556
?_224:
00002243        mov     rbx, rax                        ; 2243 _ 48: 89. C3
?_225:
00002246        mov     rcx, qword ptr [rbp-58H]        ; 2246 _ 48: 8B. 4D, A8
0000224A        test    rcx, rcx                        ; 224A _ 48: 85. C9
0000224D        jz      ?_226                           ; 224D _ 74, 12
0000224F        mov     rax, qword ptr [?_889]          ; 224F _ 48: 8B. 05, 00008A52(rel)
00002256        call    qword ptr [rax+48H]             ; 2256 _ FF. 50, 48
00002259        mov     qword ptr [rbp-58H], 0          ; 2259 _ 48: C7. 45, A8, 00000000
?_226:
00002261        mov     rax, rbx                        ; 2261 _ 48: 89. D8
00002264        add     rsp, 120                        ; 2264 _ 48: 83. C4, 78
00002268        pop     rbx                             ; 2268 _ 5B
00002269        pop     rdi                             ; 2269 _ 5F
0000226A        pop     rsi                             ; 226A _ 5E
0000226B        pop     r12                             ; 226B _ 41: 5C
0000226D        pop     r13                             ; 226D _ 41: 5D
0000226F        pop     r14                             ; 226F _ 41: 5E
00002271        pop     r15                             ; 2271 _ 41: 5F
00002273        pop     rbp                             ; 2273 _ 5D
00002274        ret                                     ; 2274 _ C3

?_227   LABEL NEAR
00002275        push    rbp                             ; 2275 _ 55
00002276        mov     rbp, rsp                        ; 2276 _ 48: 89. E5
00002279        push    r15                             ; 2279 _ 41: 57
0000227B        push    r14                             ; 227B _ 41: 56
0000227D        push    r13                             ; 227D _ 41: 55
0000227F        push    r12                             ; 227F _ 41: 54
00002281        push    rsi                             ; 2281 _ 56
00002282        push    rdi                             ; 2282 _ 57
00002283        push    rbx                             ; 2283 _ 53
00002284        sub     rsp, 136                        ; 2284 _ 48: 81. EC, 00000088
0000228B        mov     qword ptr [rbp-70H], r8         ; 228B _ 4C: 89. 45, 90
0000228F        mov     qword ptr [rbp-78H], rdx        ; 228F _ 48: 89. 55, 88
00002293        mov     rbx, qword ptr [rcx+10H]        ; 2293 _ 48: 8B. 59, 10
00002297        mov     qword ptr [rbp-80H], rcx        ; 2297 _ 48: 89. 4D, 80
0000229B        xor     edi, edi                        ; 229B _ 31. FF
0000229D        lea     r12, ptr [rbp-48H]              ; 229D _ 4C: 8D. 65, B8
000022A1        lea     r14, ptr [rbp-60H]              ; 22A1 _ 4C: 8D. 75, A0
?_228:
000022A5        cmp     qword ptr [rbp-70H], 0          ; 22A5 _ 48: 83. 7D, 90, 00
000022AA        je      ?_238                           ; 22AA _ 0F 84, 00000211
000022B0        mov     qword ptr [rbp-40H], 0          ; 22B0 _ 48: C7. 45, C0, 00000000
000022B8        lea     rcx, ptr [?_817]                ; 22B8 _ 48: 8D. 0D, 000080FD(rel)
000022BF        lea     rdx, ptr [rbp-40H]              ; 22BF _ 48: 8D. 55, C0
000022C3        call    ?_004                           ; 22C3 _ E8, FFFFDFC8
000022C8        mov     rdi, rax                        ; 22C8 _ 48: 89. C7
000022CB        test    rdi, rdi                        ; 22CB _ 48: 85. FF
000022CE        js      ?_238                           ; 22CE _ 0F 88, 000001ED
000022D4        mov     rax, qword ptr [rbp-40H]        ; 22D4 _ 48: 8B. 45, C0
?_229:
000022D8        lea     rcx, ptr [?_815]                ; 22D8 _ 48: 8D. 0D, 000080BD(rel)
000022DF        mov     rdx, rax                        ; 22DF _ 48: 89. C2
000022E2        call    ?_014                           ; 22E2 _ E8, FFFFE10A
000022E7        mov     qword ptr [rbp-40H], rax        ; 22E7 _ 48: 89. 45, C0
000022EB        mov     rdi, 0EH                        ; 22EB _ 48: BF, 800000000000000E
000022F5        test    rax, rax                        ; 22F5 _ 48: 85. C0
000022F8        je      ?_238                           ; 22F8 _ 0F 84, 000001C3
000022FE        mov     ecx, dword ptr [rax+2CH]        ; 22FE _ 8B. 48, 2C
00002301        lea     rsi, ptr [rax+48H]              ; 2301 _ 48: 8D. 70, 48
00002305        mov     rdx, -1                         ; 2305 _ 48: C7. C2, FFFFFFFF
?_230:
0000230C        mov     r13, rsi                        ; 230C _ 49: 89. F5
0000230F        inc     rdx                             ; 230F _ 48: FF. C2
00002312        cmp     rdx, rcx                        ; 2312 _ 48: 39. CA
00002315        jnc     ?_229                           ; 2315 _ 73, C1
00002317        lea     rsi, ptr [r13+30H]              ; 2317 _ 49: 8D. 75, 30
0000231B        mov     rdi, qword ptr [r13-10H]        ; 231B _ 49: 8B. 7D, F0
0000231F        cmp     rbx, rdi                        ; 231F _ 48: 39. FB
00002322        jc      ?_230                           ; 2322 _ 72, E8
00002324        add     rdi, qword ptr [r13-8H]         ; 2324 _ 49: 03. 7D, F8
00002328        cmp     rbx, rdi                        ; 2328 _ 48: 39. FB
0000232B        jnc     ?_230                           ; 232B _ 73, DF
0000232D        mov     qword ptr [rbp-48H], 0          ; 232D _ 48: C7. 45, B8, 00000000
00002335        mov     rax, qword ptr [?_889]          ; 2335 _ 48: 8B. 05, 0000896C(rel)
0000233C        mov     rax, qword ptr [rax+138H]       ; 233C _ 48: 8B. 80, 00000138
00002343        mov     edx, dword ptr [r13-18H]        ; 2343 _ 41: 8B. 55, E8
00002347        mov     ecx, edx                        ; 2347 _ 89. D1
00002349        and     ecx, 4H                         ; 2349 _ 83. E1, 04
0000234C        test    dl, 3H                          ; 234C _ F6. C2, 03
0000234F        lea     rdi, ptr [?_824]                ; 234F _ 48: 8D. 3D, 000080D6(rel)
00002356        je      ?_242                           ; 2356 _ 0F 84, 00000214
0000235C        test    ecx, ecx                        ; 235C _ 85. C9
0000235E        je      ?_239                           ; 235E _ 0F 84, 00000174
00002364        lea     rcx, ptr [rbp-58H]              ; 2364 _ 48: 8D. 4D, A8
00002368        mov     qword ptr [rsp+20H], rcx        ; 2368 _ 48: 89. 4C 24, 20
0000236D        mov     ecx, 2                          ; 236D _ B9, 00000002
00002372        mov     rdx, rdi                        ; 2372 _ 48: 89. FA
00002375        xor     r8d, r8d                        ; 2375 _ 45: 31. C0
00002378        lea     r9, ptr [rbp-50H]               ; 2378 _ 4C: 8D. 4D, B0
0000237C        call    rax                             ; 237C _ FF. D0
0000237E        test    rax, rax                        ; 237E _ 48: 85. C0
00002381        js      ?_250                           ; 2381 _ 0F 88, 0000034D
00002387        mov     rax, qword ptr [rbp-50H]        ; 2387 _ 48: 8B. 45, B0
0000238B        test    rax, rax                        ; 238B _ 48: 85. C0
0000238E        je      ?_250                           ; 238E _ 0F 84, 00000340
00002394        xor     esi, esi                        ; 2394 _ 31. F6
?_231:
00002396        cmp     rsi, rax                        ; 2396 _ 48: 39. C6
00002399        jnc     ?_249                           ; 2399 _ 0F 83, 000002FD
0000239F        mov     rax, qword ptr [rbp-58H]        ; 239F _ 48: 8B. 45, A8
000023A3        mov     rcx, qword ptr [rax+rsi*8]      ; 23A3 _ 48: 8B. 0C F0
000023A7        mov     rax, qword ptr [?_889]          ; 23A7 _ 48: 8B. 05, 000088FA(rel)
000023AE        mov     rdx, rdi                        ; 23AE _ 48: 89. FA
000023B1        mov     r8, r12                         ; 23B1 _ 4D: 89. E0
000023B4        call    qword ptr [rax+98H]             ; 23B4 _ FF. 90, 00000098
000023BA        test    rax, rax                        ; 23BA _ 48: 85. C0
000023BD        js      ?_249                           ; 23BD _ 0F 88, 000002D9
000023C3        mov     rax, qword ptr [rbp-48H]        ; 23C3 _ 48: 8B. 45, B8
000023C7        mov     rcx, rax                        ; 23C7 _ 48: 89. C1
000023CA        mov     rdx, r14                        ; 23CA _ 4C: 89. F2
000023CD        call    qword ptr [rax+10H]             ; 23CD _ FF. 50, 10
000023D0        test    rax, rax                        ; 23D0 _ 48: 85. C0
000023D3        js      ?_249                           ; 23D3 _ 0F 88, 000002C3
000023D9        mov     rax, qword ptr [r13-10H]        ; 23D9 _ 49: 8B. 45, F0
000023DD        mov     rcx, qword ptr [rbp-60H]        ; 23DD _ 48: 8B. 4D, A0
000023E1        cmp     rax, rcx                        ; 23E1 _ 48: 39. C8
000023E4        jc      ?_232                           ; 23E4 _ 72, 09
000023E6        add     rcx, qword ptr [rcx+20H]        ; 23E6 _ 48: 03. 49, 20
000023EA        cmp     rax, rcx                        ; 23EA _ 48: 39. C8
000023ED        jc      ?_233                           ; 23ED _ 72, 09
?_232:
000023EF        inc     rsi                             ; 23EF _ 48: FF. C6
000023F2        mov     rax, qword ptr [rbp-50H]        ; 23F2 _ 48: 8B. 45, B0
000023F6        jmp     ?_231                           ; 23F6 _ EB, 9E

?_233:
000023F8        mov     rax, qword ptr [rbp-58H]        ; 23F8 _ 48: 8B. 45, A8
000023FC        mov     r15, qword ptr [rax+rsi*8]      ; 23FC _ 4C: 8B. 3C F0
00002400        mov     qword ptr [rbp-68H], 0          ; 2400 _ 48: C7. 45, 98, 00000000
00002408        mov     rax, qword ptr [rbp-80H]        ; 2408 _ 48: 8B. 45, 80
0000240C        cmp     byte ptr [rax+30H], 0           ; 240C _ 80. 78, 30, 00
00002410        jnz     ?_234                           ; 2410 _ 75, 07
00002412        test    byte ptr [r13-18H], 8H          ; 2412 _ 41: F6. 45, E8, 08
00002417        jz      ?_235                           ; 2417 _ 74, 2A
?_234:
00002419        mov     rax, qword ptr [rbp-48H]        ; 2419 _ 48: 8B. 45, B8
0000241D        mov     qword ptr [rsp+30H], r15        ; 241D _ 4C: 89. 7C 24, 30
00002422        mov     qword ptr [rsp+28H], rax        ; 2422 _ 48: 89. 44 24, 28
00002427        mov     qword ptr [rsp+20H], rbx        ; 2427 _ 48: 89. 5C 24, 20
0000242C        mov     rcx, qword ptr [rbp-78H]        ; 242C _ 48: 8B. 4D, 88
00002430        mov     rdx, qword ptr [rbp-70H]        ; 2430 _ 48: 8B. 55, 90
00002434        lea     r8, ptr [rbp-68H]               ; 2434 _ 4C: 8D. 45, 98
00002438        mov     r9, qword ptr [rbp-80H]         ; 2438 _ 4C: 8B. 4D, 80
0000243C        call    ?_332                           ; 243C _ E8, 000013F3
00002441        jmp     ?_236                           ; 2441 _ EB, 22

?_235:
00002443        mov     rax, qword ptr [rbp-48H]        ; 2443 _ 48: 8B. 45, B8
00002447        mov     qword ptr [rsp+28H], r15        ; 2447 _ 4C: 89. 7C 24, 28
0000244C        mov     qword ptr [rsp+20H], rax        ; 244C _ 48: 89. 44 24, 20
00002451        mov     rcx, qword ptr [rbp-78H]        ; 2451 _ 48: 8B. 4D, 88
00002455        mov     rdx, qword ptr [rbp-70H]        ; 2455 _ 48: 8B. 55, 90
00002459        lea     r8, ptr [rbp-68H]               ; 2459 _ 4C: 8D. 45, 98
0000245D        mov     r9, rbx                         ; 245D _ 49: 89. D9
00002460        call    ?_359                           ; 2460 _ E8, 00001AA9
?_236:
00002465        mov     rdi, rax                        ; 2465 _ 48: 89. C7
00002468        mov     rcx, qword ptr [rbp-58H]        ; 2468 _ 48: 8B. 4D, A8
0000246C        test    rcx, rcx                        ; 246C _ 48: 85. C9
0000246F        jz      ?_237                           ; 246F _ 74, 12
00002471        mov     rax, qword ptr [?_889]          ; 2471 _ 48: 8B. 05, 00008830(rel)
00002478        call    qword ptr [rax+48H]             ; 2478 _ FF. 50, 48
0000247B        mov     qword ptr [rbp-58H], 0          ; 247B _ 48: C7. 45, A8, 00000000
?_237:
00002483        test    rdi, rdi                        ; 2483 _ 48: 85. FF
00002486        js      ?_238                           ; 2486 _ 78, 39
00002488        mov     rsi, qword ptr [rbp-68H]        ; 2488 _ 48: 8B. 75, 98
0000248C        mov     r9, qword ptr [rbp-48H]         ; 248C _ 4C: 8B. 4D, B8
00002490        mov     rax, qword ptr [?_889]          ; 2490 _ 48: 8B. 05, 00008811(rel)
00002497        mov     rcx, r15                        ; 2497 _ 4C: 89. F9
0000249A        lea     rdx, ptr [?_824]                ; 249A _ 48: 8D. 15, 00007F8B(rel)
000024A1        mov     r8, r9                          ; 24A1 _ 4D: 89. C8
000024A4        call    qword ptr [rax+88H]             ; 24A4 _ FF. 90, 00000088
000024AA        mov     rdi, rax                        ; 24AA _ 48: 89. C7
000024AD        add     qword ptr [rbp-78H], rsi        ; 24AD _ 48: 01. 75, 88
000024B1        sub     qword ptr [rbp-70H], rsi        ; 24B1 _ 48: 29. 75, 90
000024B5        add     rbx, rsi                        ; 24B5 _ 48: 01. F3
000024B8        test    rdi, rdi                        ; 24B8 _ 48: 85. FF
000024BB        jns     ?_228                           ; 24BB _ 0F 89, FFFFFDE4
?_238:
000024C1        mov     rax, rdi                        ; 24C1 _ 48: 89. F8
000024C4        add     rsp, 136                        ; 24C4 _ 48: 81. C4, 00000088
000024CB        pop     rbx                             ; 24CB _ 5B
000024CC        pop     rdi                             ; 24CC _ 5F
000024CD        pop     rsi                             ; 24CD _ 5E
000024CE        pop     r12                             ; 24CE _ 41: 5C
000024D0        pop     r13                             ; 24D0 _ 41: 5D
000024D2        pop     r14                             ; 24D2 _ 41: 5E
000024D4        pop     r15                             ; 24D4 _ 41: 5F
000024D6        pop     rbp                             ; 24D6 _ 5D
000024D7        ret                                     ; 24D7 _ C3

?_239:
000024D8        lea     rcx, ptr [rbp-58H]              ; 24D8 _ 48: 8D. 4D, A8
000024DC        mov     qword ptr [rsp+20H], rcx        ; 24DC _ 48: 89. 4C 24, 20
000024E1        mov     ecx, 2                          ; 24E1 _ B9, 00000002
000024E6        mov     rdx, r13                        ; 24E6 _ 4C: 89. EA
000024E9        xor     r8d, r8d                        ; 24E9 _ 45: 31. C0
000024EC        lea     r9, ptr [rbp-50H]               ; 24EC _ 4C: 8D. 4D, B0
000024F0        call    rax                             ; 24F0 _ FF. D0
000024F2        test    rax, rax                        ; 24F2 _ 48: 85. C0
000024F5        js      ?_250                           ; 24F5 _ 0F 88, 000001D9
000024FB        mov     rax, qword ptr [rbp-50H]        ; 24FB _ 48: 8B. 45, B0
000024FF        test    rax, rax                        ; 24FF _ 48: 85. C0
00002502        je      ?_250                           ; 2502 _ 0F 84, 000001CC
00002508        xor     esi, esi                        ; 2508 _ 31. F6
?_240:
0000250A        cmp     rsi, rax                        ; 250A _ 48: 39. C6
0000250D        jnc     ?_249                           ; 250D _ 0F 83, 00000189
00002513        mov     rax, qword ptr [rbp-58H]        ; 2513 _ 48: 8B. 45, A8
00002517        mov     rcx, qword ptr [rax+rsi*8]      ; 2517 _ 48: 8B. 0C F0
0000251B        mov     rax, qword ptr [?_889]          ; 251B _ 48: 8B. 05, 00008786(rel)
00002522        mov     rdx, r13                        ; 2522 _ 4C: 89. EA
00002525        mov     r8, r12                         ; 2525 _ 4D: 89. E0
00002528        call    qword ptr [rax+98H]             ; 2528 _ FF. 90, 00000098
0000252E        test    rax, rax                        ; 252E _ 48: 85. C0
00002531        js      ?_249                           ; 2531 _ 0F 88, 00000165
00002537        mov     rax, qword ptr [rbp-48H]        ; 2537 _ 48: 8B. 45, B8
0000253B        mov     rcx, rax                        ; 253B _ 48: 89. C1
0000253E        mov     rdx, r14                        ; 253E _ 4C: 89. F2
00002541        call    qword ptr [rax+10H]             ; 2541 _ FF. 50, 10
00002544        test    rax, rax                        ; 2544 _ 48: 85. C0
00002547        js      ?_249                           ; 2547 _ 0F 88, 0000014F
0000254D        mov     rax, qword ptr [r13-10H]        ; 254D _ 49: 8B. 45, F0
00002551        mov     rcx, qword ptr [rbp-60H]        ; 2551 _ 48: 8B. 4D, A0
00002555        cmp     rax, rcx                        ; 2555 _ 48: 39. C8
00002558        jc      ?_241                           ; 2558 _ 72, 0D
0000255A        add     rcx, qword ptr [rcx+20H]        ; 255A _ 48: 03. 49, 20
0000255E        cmp     rax, rcx                        ; 255E _ 48: 39. C8
00002561        jc      ?_233                           ; 2561 _ 0F 82, FFFFFE91
?_241:
00002567        inc     rsi                             ; 2567 _ 48: FF. C6
0000256A        mov     rax, qword ptr [rbp-50H]        ; 256A _ 48: 8B. 45, B0
0000256E        jmp     ?_240                           ; 256E _ EB, 9A

?_242:
00002570        test    ecx, ecx                        ; 2570 _ 85. C9
00002572        je      ?_245                           ; 2572 _ 0F 84, 00000098
00002578        lea     rcx, ptr [rbp-58H]              ; 2578 _ 48: 8D. 4D, A8
0000257C        mov     qword ptr [rsp+20H], rcx        ; 257C _ 48: 89. 4C 24, 20
00002581        mov     ecx, 2                          ; 2581 _ B9, 00000002
00002586        mov     rdx, rdi                        ; 2586 _ 48: 89. FA
00002589        xor     r8d, r8d                        ; 2589 _ 45: 31. C0
0000258C        lea     r9, ptr [rbp-50H]               ; 258C _ 4C: 8D. 4D, B0
00002590        call    rax                             ; 2590 _ FF. D0
00002592        test    rax, rax                        ; 2592 _ 48: 85. C0
00002595        js      ?_250                           ; 2595 _ 0F 88, 00000139
0000259B        mov     rax, qword ptr [rbp-50H]        ; 259B _ 48: 8B. 45, B0
0000259F        test    rax, rax                        ; 259F _ 48: 85. C0
000025A2        je      ?_250                           ; 25A2 _ 0F 84, 0000012C
000025A8        xor     esi, esi                        ; 25A8 _ 31. F6
?_243:
000025AA        cmp     rsi, rax                        ; 25AA _ 48: 39. C6
000025AD        jnc     ?_249                           ; 25AD _ 0F 83, 000000E9
000025B3        mov     rax, qword ptr [rbp-58H]        ; 25B3 _ 48: 8B. 45, A8
000025B7        mov     rcx, qword ptr [rax+rsi*8]      ; 25B7 _ 48: 8B. 0C F0
000025BB        mov     rax, qword ptr [?_889]          ; 25BB _ 48: 8B. 05, 000086E6(rel)
000025C2        mov     rdx, rdi                        ; 25C2 _ 48: 89. FA
000025C5        mov     r8, r12                         ; 25C5 _ 4D: 89. E0
000025C8        call    qword ptr [rax+98H]             ; 25C8 _ FF. 90, 00000098
000025CE        test    rax, rax                        ; 25CE _ 48: 85. C0
000025D1        js      ?_249                           ; 25D1 _ 0F 88, 000000C5
000025D7        mov     rax, qword ptr [rbp-48H]        ; 25D7 _ 48: 8B. 45, B8
000025DB        mov     rcx, rax                        ; 25DB _ 48: 89. C1
000025DE        mov     rdx, r14                        ; 25DE _ 4C: 89. F2
000025E1        call    qword ptr [rax+10H]             ; 25E1 _ FF. 50, 10
000025E4        test    rax, rax                        ; 25E4 _ 48: 85. C0
000025E7        js      ?_249                           ; 25E7 _ 0F 88, 000000AF
000025ED        mov     rax, qword ptr [r13-10H]        ; 25ED _ 49: 8B. 45, F0
000025F1        mov     rcx, qword ptr [rbp-60H]        ; 25F1 _ 48: 8B. 4D, A0
000025F5        cmp     rax, rcx                        ; 25F5 _ 48: 39. C8
000025F8        jc      ?_244                           ; 25F8 _ 72, 0D
000025FA        add     rcx, qword ptr [rcx+20H]        ; 25FA _ 48: 03. 49, 20
000025FE        cmp     rax, rcx                        ; 25FE _ 48: 39. C8
00002601        jc      ?_233                           ; 2601 _ 0F 82, FFFFFDF1
?_244:
00002607        inc     rsi                             ; 2607 _ 48: FF. C6
0000260A        mov     rax, qword ptr [rbp-50H]        ; 260A _ 48: 8B. 45, B0
0000260E        jmp     ?_243                           ; 260E _ EB, 9A

?_245:
00002610        lea     rcx, ptr [rbp-58H]              ; 2610 _ 48: 8D. 4D, A8
00002614        mov     qword ptr [rsp+20H], rcx        ; 2614 _ 48: 89. 4C 24, 20
00002619        mov     ecx, 2                          ; 2619 _ B9, 00000002
0000261E        mov     rdx, r13                        ; 261E _ 4C: 89. EA
00002621        xor     r8d, r8d                        ; 2621 _ 45: 31. C0
00002624        lea     r9, ptr [rbp-50H]               ; 2624 _ 4C: 8D. 4D, B0
00002628        call    rax                             ; 2628 _ FF. D0
0000262A        test    rax, rax                        ; 262A _ 48: 85. C0
0000262D        js      ?_250                           ; 262D _ 0F 88, 000000A1
00002633        mov     rax, qword ptr [rbp-50H]        ; 2633 _ 48: 8B. 45, B0
00002637        test    rax, rax                        ; 2637 _ 48: 85. C0
0000263A        je      ?_250                           ; 263A _ 0F 84, 00000094
00002640        xor     esi, esi                        ; 2640 _ 31. F6
00002642        jmp     ?_248                           ; 2642 _ EB, 21

?_246:
00002644        mov     rax, qword ptr [r13-10H]        ; 2644 _ 49: 8B. 45, F0
00002648        mov     rcx, qword ptr [rbp-60H]        ; 2648 _ 48: 8B. 4D, A0
0000264C        cmp     rax, rcx                        ; 264C _ 48: 39. C8
0000264F        jc      ?_247                           ; 264F _ 72, 0D
00002651        add     rcx, qword ptr [rcx+20H]        ; 2651 _ 48: 03. 49, 20
00002655        cmp     rax, rcx                        ; 2655 _ 48: 39. C8
00002658        jc      ?_233                           ; 2658 _ 0F 82, FFFFFD9A
?_247:
0000265E        inc     rsi                             ; 265E _ 48: FF. C6
00002661        mov     rax, qword ptr [rbp-50H]        ; 2661 _ 48: 8B. 45, B0
?_248:
00002665        cmp     rsi, rax                        ; 2665 _ 48: 39. C6
00002668        jnc     ?_249                           ; 2668 _ 73, 32
0000266A        mov     rax, qword ptr [rbp-58H]        ; 266A _ 48: 8B. 45, A8
0000266E        mov     rcx, qword ptr [rax+rsi*8]      ; 266E _ 48: 8B. 0C F0
00002672        mov     rax, qword ptr [?_889]          ; 2672 _ 48: 8B. 05, 0000862F(rel)
00002679        mov     rdx, r13                        ; 2679 _ 4C: 89. EA
0000267C        mov     r8, r12                         ; 267C _ 4D: 89. E0
0000267F        call    qword ptr [rax+98H]             ; 267F _ FF. 90, 00000098
00002685        test    rax, rax                        ; 2685 _ 48: 85. C0
00002688        js      ?_249                           ; 2688 _ 78, 12
0000268A        mov     rax, qword ptr [rbp-48H]        ; 268A _ 48: 8B. 45, B8
0000268E        mov     rcx, rax                        ; 268E _ 48: 89. C1
00002691        mov     rdx, r14                        ; 2691 _ 4C: 89. F2
00002694        call    qword ptr [rax+10H]             ; 2694 _ FF. 50, 10
00002697        test    rax, rax                        ; 2697 _ 48: 85. C0
0000269A        jns     ?_246                           ; 269A _ 79, A8
?_249:
0000269C        mov     rdi, 0EH                        ; 269C _ 48: BF, 800000000000000E
000026A6        mov     rcx, qword ptr [rbp-58H]        ; 26A6 _ 48: 8B. 4D, A8
000026AA        test    rcx, rcx                        ; 26AA _ 48: 85. C9
000026AD        je      ?_238                           ; 26AD _ 0F 84, FFFFFE0E
000026B3        mov     rax, qword ptr [?_889]          ; 26B3 _ 48: 8B. 05, 000085EE(rel)
000026BA        call    qword ptr [rax+48H]             ; 26BA _ FF. 50, 48
000026BD        mov     qword ptr [rbp-58H], 0          ; 26BD _ 48: C7. 45, A8, 00000000
000026C5        mov     rdi, 0EH                        ; 26C5 _ 48: BF, 800000000000000E
000026CF        jmp     ?_238                           ; 26CF _ E9, FFFFFDED

?_250:
000026D4        mov     rdi, 0EH                        ; 26D4 _ 48: BF, 800000000000000E
000026DE        mov     rcx, qword ptr [rbp-58H]        ; 26DE _ 48: 8B. 4D, A8
000026E2        test    rcx, rcx                        ; 26E2 _ 48: 85. C9
000026E5        je      ?_238                           ; 26E5 _ 0F 84, FFFFFDD6
000026EB        mov     rax, qword ptr [?_889]          ; 26EB _ 48: 8B. 05, 000085B6(rel)
000026F2        call    qword ptr [rax+48H]             ; 26F2 _ FF. 50, 48
000026F5        mov     rdi, 0EH                        ; 26F5 _ 48: BF, 800000000000000E
000026FF        jmp     ?_238                           ; 26FF _ E9, FFFFFDBD

?_251   LABEL NEAR
00002704        push    rbp                             ; 2704 _ 55
00002705        mov     rbp, rsp                        ; 2705 _ 48: 89. E5
00002708        push    r15                             ; 2708 _ 41: 57
0000270A        push    r14                             ; 270A _ 41: 56
0000270C        push    rsi                             ; 270C _ 56
0000270D        push    rdi                             ; 270D _ 57
0000270E        push    rbx                             ; 270E _ 53
0000270F        sub     rsp, 40                         ; 270F _ 48: 83. EC, 28
00002713        mov     r14, rcx                        ; 2713 _ 49: 89. CE
00002716        lea     rcx, ptr [?_817]                ; 2716 _ 48: 8D. 0D, 00007C9F(rel)
0000271D        lea     rdx, ptr [rbp-30H]              ; 271D _ 48: 8D. 55, D0
00002721        call    ?_004                           ; 2721 _ E8, FFFFDB6A
00002726        test    rax, rax                        ; 2726 _ 48: 85. C0
00002729        js      ?_254                           ; 2729 _ 0F 88, 000000E2
0000272F        mov     rdx, qword ptr [rbp-30H]        ; 272F _ 48: 8B. 55, D0
00002733        lea     rsi, ptr [?_815]                ; 2733 _ 48: 8D. 35, 00007C62(rel)
0000273A        lea     rdi, ptr [?_836]                ; 273A _ 48: 8D. 3D, 00007DAB(rel)
00002741        jmp     ?_253                           ; 2741 _ EB, 0F

?_252:
00002743        mov     rax, qword ptr [rbp-30H]        ; 2743 _ 48: 8B. 45, D0
00002747        movzx   edx, word ptr [rax+2H]          ; 2747 _ 0F B7. 50, 02
0000274B        add     rdx, rax                        ; 274B _ 48: 01. C2
0000274E        mov     qword ptr [rbp-30H], rdx        ; 274E _ 48: 89. 55, D0
?_253:
00002752        mov     rcx, rsi                        ; 2752 _ 48: 89. F1
00002755        call    ?_014                           ; 2755 _ E8, FFFFDC97
0000275A        mov     rbx, rax                        ; 275A _ 48: 89. C3
0000275D        mov     qword ptr [rbp-30H], rbx        ; 275D _ 48: 89. 5D, D0
00002761        xor     eax, eax                        ; 2761 _ 31. C0
00002763        test    rbx, rbx                        ; 2763 _ 48: 85. DB
00002766        je      ?_254                           ; 2766 _ 0F 84, 000000A5
0000276C        lea     rcx, ptr [rbx+1CH]              ; 276C _ 48: 8D. 4B, 1C
00002770        mov     rdx, rdi                        ; 2770 _ 48: 89. FA
00002773        call    ?_018                           ; 2773 _ E8, FFFFDCC5
00002778        test    al, al                          ; 2778 _ 84. C0
0000277A        jz      ?_252                           ; 277A _ 74, C7
0000277C        mov     rdi, qword ptr [r14+28H]        ; 277C _ 49: 8B. 7E, 28
00002780        mov     r15, qword ptr [rbx+38H]        ; 2780 _ 4C: 8B. 7B, 38
00002784        mov     rbx, qword ptr [rbx+40H]        ; 2784 _ 48: 8B. 5B, 40
00002788        cmp     rbx, rdi                        ; 2788 _ 48: 39. FB
0000278B        sete    cl                              ; 278B _ 0F 94. C1
0000278E        cmp     r15, qword ptr [r14+10H]        ; 278E _ 4D: 3B. 7E, 10
00002792        sete    dl                              ; 2792 _ 0F 94. C2
00002795        xor     eax, eax                        ; 2795 _ 31. C0
00002797        test    cl, dl                          ; 2797 _ 84. D1
00002799        jnz     ?_254                           ; 2799 _ 75, 76
0000279B        cmp     rbx, rdi                        ; 279B _ 48: 39. FB
0000279E        ja      ?_254                           ; 279E _ 77, 71
000027A0        mov     rcx, rdi                        ; 27A0 _ 48: 89. F9
000027A3        call    ?_007                           ; 27A3 _ E8, FFFFDB63
000027A8        mov     rsi, rax                        ; 27A8 _ 48: 89. C6
000027AB        mov     rax, 9H                         ; 27AB _ 48: B8, 8000000000000009
000027B5        test    rsi, rsi                        ; 27B5 _ 48: 85. F6
000027B8        jz      ?_254                           ; 27B8 _ 74, 57
000027BA        mov     rax, qword ptr [?_889]          ; 27BA _ 48: 8B. 05, 000084E7(rel)
000027C1        mov     rcx, rsi                        ; 27C1 _ 48: 89. F1
000027C4        mov     rdx, rdi                        ; 27C4 _ 48: 89. FA
000027C7        mov     r8d, 255                        ; 27C7 _ 41: B8, 000000FF
000027CD        call    qword ptr [rax+168H]            ; 27CD _ FF. 90, 00000168
000027D3        mov     rax, qword ptr [?_889]          ; 27D3 _ 48: 8B. 05, 000084CE(rel)
000027DA        mov     rcx, rsi                        ; 27DA _ 48: 89. F1
000027DD        mov     rdx, r15                        ; 27DD _ 4C: 89. FA
000027E0        mov     r8, rbx                         ; 27E0 _ 49: 89. D8
000027E3        call    qword ptr [rax+160H]            ; 27E3 _ FF. 90, 00000160
000027E9        mov     rcx, r14                        ; 27E9 _ 4C: 89. F1
000027EC        mov     rdx, rsi                        ; 27EC _ 48: 89. F2
000027EF        mov     r8, rdi                         ; 27EF _ 49: 89. F8
000027F2        call    ?_606                           ; 27F2 _ E8, 00003BD0
000027F7        mov     rdi, rax                        ; 27F7 _ 48: 89. C7
000027FA        mov     rax, qword ptr [?_889]          ; 27FA _ 48: 8B. 05, 000084A7(rel)
00002801        mov     rcx, rsi                        ; 2801 _ 48: 89. F1
00002804        call    qword ptr [rax+48H]             ; 2804 _ FF. 50, 48
00002807        mov     rax, rdi                        ; 2807 _ 48: 89. F8
0000280A        sar     rax, 63                         ; 280A _ 48: C1. F8, 3F
0000280E        and     rax, rdi                        ; 280E _ 48: 21. F8
?_254:
00002811        add     rsp, 40                         ; 2811 _ 48: 83. C4, 28
00002815        pop     rbx                             ; 2815 _ 5B
00002816        pop     rdi                             ; 2816 _ 5F
00002817        pop     rsi                             ; 2817 _ 5E
00002818        pop     r14                             ; 2818 _ 41: 5E
0000281A        pop     r15                             ; 281A _ 41: 5F
0000281C        pop     rbp                             ; 281C _ 5D
0000281D        ret                                     ; 281D _ C3

?_255   LABEL NEAR
0000281E        push    rbp                             ; 281E _ 55
0000281F        mov     rbp, rsp                        ; 281F _ 48: 89. E5
00002822        push    r15                             ; 2822 _ 41: 57
00002824        push    r14                             ; 2824 _ 41: 56
00002826        push    r13                             ; 2826 _ 41: 55
00002828        push    r12                             ; 2828 _ 41: 54
0000282A        push    rsi                             ; 282A _ 56
0000282B        push    rdi                             ; 282B _ 57
0000282C        push    rbx                             ; 282C _ 53
0000282D        sub     rsp, 88                         ; 282D _ 48: 83. EC, 58
00002831        mov     r12, rdx                        ; 2831 _ 49: 89. D4
00002834        mov     rbx, rcx                        ; 2834 _ 48: 89. CB
00002837        mov     qword ptr [rbp-40H], 0          ; 2837 _ 48: C7. 45, C0, 00000000
0000283F        mov     qword ptr [rbp-48H], 0          ; 283F _ 48: C7. 45, B8, 00000000
00002847        lea     rdi, ptr [r12+18H]              ; 2847 _ 49: 8D. 7C 24, 18
0000284C        lea     rdx, ptr [?_836]                ; 284C _ 48: 8D. 15, 00007C99(rel)
00002853        mov     rcx, rdi                        ; 2853 _ 48: 89. F9
00002856        call    ?_018                           ; 2856 _ E8, FFFFDBE2
0000285B        test    al, al                          ; 285B _ 84. C0
0000285D        jz      ?_256                           ; 285D _ 74, 10
0000285F        mov     rcx, r12                        ; 285F _ 4C: 89. E1
00002862        call    ?_251                           ; 2862 _ E8, FFFFFE9D
00002867        mov     rsi, rax                        ; 2867 _ 48: 89. C6
0000286A        jmp     ?_269                           ; 286A _ E9, 0000025D

?_256:
0000286F        lea     rdx, ptr [?_837]                ; 286F _ 48: 8D. 15, 00007C86(rel)
00002876        mov     rcx, rdi                        ; 2876 _ 48: 89. F9
00002879        call    ?_018                           ; 2879 _ E8, FFFFDBBF
0000287E        test    al, al                          ; 287E _ 84. C0
00002880        jz      ?_257                           ; 2880 _ 74, 12
00002882        call    ?_620                           ; 2882 _ E8, 00003D70
00002887        cmp     rax, 12                         ; 2887 _ 48: 83. F8, 0C
0000288B        jnz     ?_257                           ; 288B _ 75, 07
0000288D        mov     byte ptr [?_892], 1             ; 288D _ C6. 05, 0000842C(rel), 01
?_257:
00002894        lea     rax, ptr [rbp-50H]              ; 2894 _ 48: 8D. 45, B0
00002898        lea     r13, ptr [rbp-54H]              ; 2898 _ 4C: 8D. 6D, AC
0000289C        mov     qword ptr [rsp+30H], r13        ; 289C _ 4C: 89. 6C 24, 30
000028A1        mov     qword ptr [rsp+28H], rax        ; 28A1 _ 48: 89. 44 24, 28
000028A6        lea     rax, ptr [rbp-49H]              ; 28A6 _ 48: 8D. 45, B7
000028AA        mov     qword ptr [rsp+20H], rax        ; 28AA _ 48: 89. 44 24, 20
000028AF        lea     r14, ptr [rbp-40H]              ; 28AF _ 4C: 8D. 75, C0
000028B3        lea     r15, ptr [rbp-48H]              ; 28B3 _ 4C: 8D. 7D, B8
000028B7        mov     rcx, rbx                        ; 28B7 _ 48: 89. D9
000028BA        mov     rdx, rdi                        ; 28BA _ 48: 89. FA
000028BD        mov     r8, r14                         ; 28BD _ 4D: 89. F0
000028C0        mov     r9, r15                         ; 28C0 _ 4D: 89. F9
000028C3        call    qword ptr [rbx+10H]             ; 28C3 _ FF. 53, 10
000028C6        mov     rsi, rax                        ; 28C6 _ 48: 89. C6
000028C9        test    rsi, rsi                        ; 28C9 _ 48: 85. F6
000028CC        js      ?_269                           ; 28CC _ 0F 88, 000001FA
000028D2        lea     rcx, ptr [?_769]                ; 28D2 _ 48: 8D. 0D, 0000561F(rel)
000028D9        call    ?_121                           ; 28D9 _ E8, FFFFE4F7
000028DE        mov     eax, dword ptr [r12+8H]         ; 28DE _ 41: 8B. 44 24, 08
000028E3        mov     rsi, 2H                         ; 28E3 _ 48: BE, 8000000000000002
000028ED        cmp     rax, 5                          ; 28ED _ 48: 83. F8, 05
000028F1        ja      ?_268                           ; 28F1 _ 0F 87, 000001BA
000028F7        lea     rdx, ptr [?_270]                ; 28F7 _ 48: 8D. 15, 000001E2(rel)
000028FE        movsxd  rcx, dword ptr [rdx+rax*4]      ; 28FE _ 48: 63. 0C 82
00002902        add     rcx, rdx                        ; 2902 _ 48: 01. D1
00002905        jmp     rcx                             ; 2905 _ FF. E1

?_258   LABEL NEAR
00002907        mov     rsi, 2H                         ; 2907 _ 48: BE, 8000000000000002
00002911        cmp     byte ptr [rbp-49H], 11          ; 2911 _ 80. 7D, B7, 0B
00002915        jne     ?_268                           ; 2915 _ 0F 85, 00000196
0000291B        mov     rcx, qword ptr [rbp-40H]        ; 291B _ 48: 8B. 4D, C0
0000291F        test    rcx, rcx                        ; 291F _ 48: 85. C9
00002922        jz      ?_259                           ; 2922 _ 74, 0A
00002924        mov     rax, qword ptr [?_889]          ; 2924 _ 48: 8B. 05, 0000837D(rel)
0000292B        call    qword ptr [rax+48H]             ; 292B _ FF. 50, 48
?_259:
0000292E        mov     qword ptr [rbp-40H], 0          ; 292E _ 48: C7. 45, C0, 00000000
00002936        mov     qword ptr [rbp-48H], 0          ; 2936 _ 48: C7. 45, B8, 00000000
0000293E        mov     qword ptr [rsp+30H], r13        ; 293E _ 4C: 89. 6C 24, 30
00002943        mov     qword ptr [rsp+28H], r15        ; 2943 _ 4C: 89. 7C 24, 28
00002948        mov     qword ptr [rsp+20H], r14        ; 2948 _ 4C: 89. 74 24, 20
0000294D        mov     rcx, rbx                        ; 294D _ 48: 89. D9
00002950        mov     rdx, rdi                        ; 2950 _ 48: 89. FA
00002953        mov     r8d, 23                         ; 2953 _ 41: B8, 00000017
00002959        xor     r9d, r9d                        ; 2959 _ 45: 31. C9
0000295C        call    qword ptr [rbx+18H]             ; 295C _ FF. 53, 18
0000295F        mov     rsi, rax                        ; 295F _ 48: 89. C6
00002962        test    rsi, rsi                        ; 2962 _ 48: 85. F6
00002965        js      ?_268                           ; 2965 _ 0F 88, 00000146

?_260   LABEL NEAR
0000296B        movzx   r9d, byte ptr [rbp-49H]         ; 296B _ 44: 0F B6. 4D, B7
00002970        mov     r8, qword ptr [rbp-48H]         ; 2970 _ 4C: 8B. 45, B8
00002974        mov     rdx, qword ptr [rbp-40H]        ; 2974 _ 48: 8B. 55, C0
00002978        mov     eax, dword ptr [rbp-50H]        ; 2978 _ 8B. 45, B0
0000297B        mov     dword ptr [rsp+20H], eax        ; 297B _ 89. 44 24, 20
0000297F        mov     rcx, r12                        ; 297F _ 4C: 89. E1
00002982        call    ?_212                           ; 2982 _ E8, FFFFF5FD
00002987        jmp     ?_267                           ; 2987 _ E9, 0000010E

?_261   LABEL NEAR
0000298C        mov     rsi, 2H                         ; 298C _ 48: BE, 8000000000000002
00002996        cmp     byte ptr [rbp-49H], 1           ; 2996 _ 80. 7D, B7, 01
0000299A        jne     ?_268                           ; 299A _ 0F 85, 00000111
000029A0        mov     rcx, qword ptr [rbp-40H]        ; 29A0 _ 48: 8B. 4D, C0
000029A4        test    rcx, rcx                        ; 29A4 _ 48: 85. C9
000029A7        jz      ?_262                           ; 29A7 _ 74, 0A
000029A9        mov     rax, qword ptr [?_889]          ; 29A9 _ 48: 8B. 05, 000082F8(rel)
000029B0        call    qword ptr [rax+48H]             ; 29B0 _ FF. 50, 48
?_262:
000029B3        mov     qword ptr [rbp-40H], 0          ; 29B3 _ 48: C7. 45, C0, 00000000
000029BB        mov     qword ptr [rbp-48H], 0          ; 29BB _ 48: C7. 45, B8, 00000000
000029C3        mov     qword ptr [rsp+30H], r13        ; 29C3 _ 4C: 89. 6C 24, 30
000029C8        mov     qword ptr [rsp+28H], r15        ; 29C8 _ 4C: 89. 7C 24, 28
000029CD        mov     qword ptr [rsp+20H], r14        ; 29CD _ 4C: 89. 74 24, 20
000029D2        mov     rcx, rbx                        ; 29D2 _ 48: 89. D9
000029D5        mov     rdx, rdi                        ; 29D5 _ 48: 89. FA
000029D8        mov     r8d, 23                         ; 29D8 _ 41: B8, 00000017
000029DE        xor     r9d, r9d                        ; 29DE _ 45: 31. C9
000029E1        call    qword ptr [rbx+18H]             ; 29E1 _ FF. 53, 18
000029E4        mov     rsi, rax                        ; 29E4 _ 48: 89. C6
000029E7        test    rsi, rsi                        ; 29E7 _ 48: 85. F6
000029EA        js      ?_268                           ; 29EA _ 0F 88, 000000C1
000029F0        mov     r8, qword ptr [rbp-48H]         ; 29F0 _ 4C: 8B. 45, B8
000029F4        mov     rdx, qword ptr [rbp-40H]        ; 29F4 _ 48: 8B. 55, C0
000029F8        mov     rcx, r12                        ; 29F8 _ 4C: 89. E1
000029FB        call    ?_227                           ; 29FB _ E8, FFFFF875
00002A00        jmp     ?_267                           ; 2A00 _ E9, 00000095

?_263   LABEL NEAR
00002A05        mov     rcx, qword ptr [rbp-40H]        ; 2A05 _ 48: 8B. 4D, C0
00002A09        test    rcx, rcx                        ; 2A09 _ 48: 85. C9
00002A0C        jz      ?_264                           ; 2A0C _ 74, 0F
00002A0E        mov     rax, qword ptr [?_889]          ; 2A0E _ 48: 8B. 05, 00008293(rel)
00002A15        call    qword ptr [rax+48H]             ; 2A15 _ FF. 50, 48
00002A18        mov     eax, dword ptr [r12+8H]         ; 2A18 _ 41: 8B. 44 24, 08
?_264:
00002A1D        mov     qword ptr [rbp-40H], 0          ; 2A1D _ 48: C7. 45, C0, 00000000
00002A25        mov     qword ptr [rbp-48H], 0          ; 2A25 _ 48: C7. 45, B8, 00000000
00002A2D        mov     qword ptr [rsp+30H], r13        ; 2A2D _ 4C: 89. 6C 24, 30
00002A32        mov     qword ptr [rsp+28H], r15        ; 2A32 _ 4C: 89. 7C 24, 28
00002A37        mov     qword ptr [rsp+20H], r14        ; 2A37 _ 4C: 89. 74 24, 20
00002A3C        mov     cl, 25                          ; 2A3C _ B1, 19
00002A3E        cmp     eax, 5                          ; 2A3E _ 83. F8, 05
00002A41        jz      ?_265                           ; 2A41 _ 74, 02
00002A43        mov     cl, 23                          ; 2A43 _ B1, 17
?_265:
00002A45        movzx   r8d, cl                         ; 2A45 _ 44: 0F B6. C1
00002A49        mov     rcx, rbx                        ; 2A49 _ 48: 89. D9
00002A4C        mov     rdx, rdi                        ; 2A4C _ 48: 89. FA
00002A4F        xor     r9d, r9d                        ; 2A4F _ 45: 31. C9
00002A52        call    qword ptr [rbx+18H]             ; 2A52 _ FF. 53, 18
00002A55        mov     rsi, rax                        ; 2A55 _ 48: 89. C6
00002A58        test    rsi, rsi                        ; 2A58 _ 48: 85. F6
00002A5B        js      ?_268                           ; 2A5B _ 78, 54
00002A5D        lea     rdx, ptr [?_838]                ; 2A5D _ 48: 8D. 15, 00007AA8(rel)
00002A64        mov     rcx, rdi                        ; 2A64 _ 48: 89. F9
00002A67        call    ?_018                           ; 2A67 _ E8, FFFFD9D1
00002A6C        test    al, al                          ; 2A6C _ 84. C0
00002A6E        jz      ?_266                           ; 2A6E _ 74, 1A
00002A70        call    ?_620                           ; 2A70 _ E8, 00003B82
00002A75        cmp     rax, 12                         ; 2A75 _ 48: 83. F8, 0C
00002A79        jnz     ?_266                           ; 2A79 _ 75, 0F
00002A7B        mov     rcx, qword ptr [rbp-40H]        ; 2A7B _ 48: 8B. 4D, C0
00002A7F        call    ?_629                           ; 2A7F _ E8, 00003C77
00002A84        mov     dword ptr [?_893], eax          ; 2A84 _ 89. 05, 0000823A(rel)
?_266:
00002A8A        mov     r8, qword ptr [rbp-48H]         ; 2A8A _ 4C: 8B. 45, B8
00002A8E        mov     rdx, qword ptr [rbp-40H]        ; 2A8E _ 48: 8B. 55, C0
00002A92        mov     rcx, r12                        ; 2A92 _ 4C: 89. E1
00002A95        call    ?_606                           ; 2A95 _ E8, 0000392D
?_267:
00002A9A        mov     rsi, rax                        ; 2A9A _ 48: 89. C6
00002A9D        test    rsi, rsi                        ; 2A9D _ 48: 85. F6
00002AA0        jns     ?_268                           ; 2AA0 _ 79, 0F
00002AA2        lea     rcx, ptr [?_770]                ; 2AA2 _ 48: 8D. 0D, 00005453(rel)
00002AA9        mov     rdx, rsi                        ; 2AA9 _ 48: 89. F2
00002AAC        call    ?_121                           ; 2AAC _ E8, FFFFE324
?_268:
00002AB1        mov     rcx, qword ptr [rbp-40H]        ; 2AB1 _ 48: 8B. 4D, C0
00002AB5        test    rcx, rcx                        ; 2AB5 _ 48: 85. C9
00002AB8        jz      ?_269                           ; 2AB8 _ 74, 12
00002ABA        mov     rax, qword ptr [?_889]          ; 2ABA _ 48: 8B. 05, 000081E7(rel)
00002AC1        call    qword ptr [rax+48H]             ; 2AC1 _ FF. 50, 48
00002AC4        mov     qword ptr [rbp-40H], 0          ; 2AC4 _ 48: C7. 45, C0, 00000000
?_269:
00002ACC        mov     rax, rsi                        ; 2ACC _ 48: 89. F0
00002ACF        add     rsp, 88                         ; 2ACF _ 48: 83. C4, 58
00002AD3        pop     rbx                             ; 2AD3 _ 5B
00002AD4        pop     rdi                             ; 2AD4 _ 5F
00002AD5        pop     rsi                             ; 2AD5 _ 5E
00002AD6        pop     r12                             ; 2AD6 _ 41: 5C
00002AD8        pop     r13                             ; 2AD8 _ 41: 5D
00002ADA        pop     r14                             ; 2ADA _ 41: 5E
00002ADC        pop     r15                             ; 2ADC _ 41: 5F
00002ADE        pop     rbp                             ; 2ADE _ 5D
00002ADF        ret                                     ; 2ADF _ C3

?_270   label dword                                     ; switch/case jump table
        dd ?_258-?_270                                  ; 2AE0 _ FFFFFE27 dd ?_260-?_270; 2AE4 _ FFFFFE8B dd ?_261-?_270; 2AE8 _ FFFFFEAC dd ?_263-?_270; 2AEC _ FFFFFF25 dd ?_263-?_270; 2AF0 _ FFFFFF25 dd ?_263-?_270; 2AF4 _ FFFFFF25 
; Filling space: 1H
; Filler type: NOP
;       db 90H

00002AF9        push    rbp                             ; 2AF9 _ 55
; Note: No jump seems to point here
00002AFA        mov     rbp, rsp                        ; 2AFA _ 48: 89. E5
00002AFD        push    r14                             ; 2AFD _ 41: 56
00002AFF        push    rsi                             ; 2AFF _ 56
00002B00        push    rdi                             ; 2B00 _ 57
00002B01        push    rbx                             ; 2B01 _ 53
00002B02        sub     rsp, 176                        ; 2B02 _ 48: 81. EC, 000000B0
00002B09        mov     rdi, rcx                        ; 2B09 _ 48: 89. CF
00002B0C        mov     rax, qword ptr [?_772]          ; 2B0C _ 48: 8B. 05, 0000542D(rel)
00002B13        mov     qword ptr [rbp-58H], rax        ; 2B13 _ 48: 89. 45, A8
00002B17        mov     rax, qword ptr [?_771]          ; 2B17 _ 48: 8B. 05, 0000541A(rel)
00002B1E        mov     qword ptr [rbp-60H], rax        ; 2B1E _ 48: 89. 45, A0
00002B22        mov     rax, qword ptr [?_774]          ; 2B22 _ 48: 8B. 05, 00005427(rel)
00002B29        mov     qword ptr [rbp-68H], rax        ; 2B29 _ 48: 89. 45, 98
00002B2D        mov     rax, qword ptr [?_773]          ; 2B2D _ 48: 8B. 05, 00005414(rel)
00002B34        mov     qword ptr [rbp-70H], rax        ; 2B34 _ 48: 89. 45, 90
00002B38        mov     rcx, rdi                        ; 2B38 _ 48: 89. F9
00002B3B        call    ?_002                           ; 2B3B _ E8, FFFFD720
00002B40        mov     rcx, rdi                        ; 2B40 _ 48: 89. F9
00002B43        xor     edx, edx                        ; 2B43 _ 31. D2
00002B45        call    ?_556                           ; 2B45 _ E8, 000031BC
00002B4A        lea     rcx, ptr [?_775]                ; 2B4A _ 48: 8D. 0D, 00005407(rel)
00002B51        call    ?_121                           ; 2B51 _ E8, FFFFE27F
00002B56        call    ?_374                           ; 2B56 _ E8, 000015C7
00002B5B        mov     rsi, 15H                        ; 2B5B _ 48: BE, 8000000000000015
00002B65        test    al, al                          ; 2B65 _ 84. C0
00002B67        je      ?_284                           ; 2B67 _ 0F 84, 000003A7
00002B6D        mov     rax, qword ptr [?_889]          ; 2B6D _ 48: 8B. 05, 00008134(rel)
00002B74        mov     dword ptr [rsp+28H], 2          ; 2B74 _ C7. 44 24, 28, 00000002
00002B7C        mov     qword ptr [rsp+20H], 0          ; 2B7C _ 48: C7. 44 24, 20, 00000000
00002B85        lea     rdx, ptr [?_826]                ; 2B85 _ 48: 8D. 15, 000078C0(rel)
00002B8C        lea     r8, ptr [rbp-28H]               ; 2B8C _ 4C: 8D. 45, D8
00002B90        mov     rcx, rdi                        ; 2B90 _ 48: 89. F9
00002B93        mov     r9, rdi                         ; 2B93 _ 49: 89. F9
00002B96        call    qword ptr [rax+118H]            ; 2B96 _ FF. 90, 00000118
00002B9C        mov     rsi, rax                        ; 2B9C _ 48: 89. C6
00002B9F        test    rsi, rsi                        ; 2B9F _ 48: 85. F6
00002BA2        js      ?_284                           ; 2BA2 _ 0F 88, 0000036C
00002BA8        mov     rax, qword ptr [rbp-28H]        ; 2BA8 _ 48: 8B. 45, D8
00002BAC        mov     rcx, qword ptr [rax+18H]        ; 2BAC _ 48: 8B. 48, 18
00002BB0        mov     rax, qword ptr [?_889]          ; 2BB0 _ 48: 8B. 05, 000080F1(rel)
00002BB7        lea     rdx, ptr [?_823]                ; 2BB7 _ 48: 8D. 15, 0000785E(rel)
00002BBE        lea     r8, ptr [rbp-30H]               ; 2BBE _ 4C: 8D. 45, D0
00002BC2        call    qword ptr [rax+98H]             ; 2BC2 _ FF. 90, 00000098
00002BC8        mov     rsi, 0EH                        ; 2BC8 _ 48: BE, 800000000000000E
00002BD2        test    rax, rax                        ; 2BD2 _ 48: 85. C0
00002BD5        js      ?_284                           ; 2BD5 _ 0F 88, 00000339
00002BDB        mov     rax, qword ptr [rbp-28H]        ; 2BDB _ 48: 8B. 45, D8
00002BDF        mov     rcx, qword ptr [rax+20H]        ; 2BDF _ 48: 8B. 48, 20
00002BE3        call    ?_285                           ; 2BE3 _ E8, 0000033D
00002BE8        mov     rdi, rax                        ; 2BE8 _ 48: 89. C7
00002BEB        mov     rsi, 0EH                        ; 2BEB _ 48: BE, 800000000000000E
00002BF5        jmp     ?_273                           ; 2BF5 _ EB, 20

?_271:
00002BF7        cmp     al, 127                         ; 2BF7 _ 3C, 7F
00002BF9        jnz     ?_272                           ; 2BF9 _ 75, 0A
00002BFB        cmp     byte ptr [rdi+1H], -1           ; 2BFB _ 80. 7F, 01, FF
00002BFF        je      ?_284                           ; 2BFF _ 0F 84, 0000030F
?_272:
00002C05        movzx   ecx, byte ptr [rdi+2H]          ; 2C05 _ 0F B6. 4F, 02
00002C09        movzx   eax, byte ptr [rdi+3H]          ; 2C09 _ 0F B6. 47, 03
00002C0D        shl     rax, 8                          ; 2C0D _ 48: C1. E0, 08
00002C11        or      rax, rcx                        ; 2C11 _ 48: 09. C8
00002C14        add     rdi, rax                        ; 2C14 _ 48: 01. C7
?_273:
00002C17        mov     al, byte ptr [rdi]              ; 2C17 _ 8A. 07
00002C19        and     al, 7FH                         ; 2C19 _ 24, 7F
00002C1B        cmp     al, 4                           ; 2C1B _ 3C, 04
00002C1D        jnz     ?_271                           ; 2C1D _ 75, D8
00002C1F        cmp     byte ptr [rdi+1H], 6            ; 2C1F _ 80. 7F, 01, 06
00002C23        jnz     ?_272                           ; 2C23 _ 75, E0
00002C25        mov     rsi, 0EH                        ; 2C25 _ 48: BE, 800000000000000E
00002C2F        test    rdi, rdi                        ; 2C2F _ 48: 85. FF
00002C32        je      ?_284                           ; 2C32 _ 0F 84, 000002DC
00002C38        mov     qword ptr [rbp-40H], 0          ; 2C38 _ 48: C7. 45, C0, 00000000
00002C40        mov     qword ptr [rbp-48H], 0          ; 2C40 _ 48: C7. 45, B8, 00000000
00002C48        mov     rax, qword ptr [rbp-30H]        ; 2C48 _ 48: 8B. 45, D0
00002C4C        lea     rcx, ptr [rbp-48H]              ; 2C4C _ 48: 8D. 4D, B8
00002C50        lea     r14, ptr [rbp-78H]              ; 2C50 _ 4C: 8D. 75, 88
00002C54        mov     qword ptr [rsp+30H], r14        ; 2C54 _ 4C: 89. 74 24, 30
00002C59        mov     qword ptr [rsp+28H], rcx        ; 2C59 _ 48: 89. 4C 24, 28
00002C5E        lea     rcx, ptr [rbp-40H]              ; 2C5E _ 48: 8D. 4D, C0
00002C62        mov     qword ptr [rsp+20H], rcx        ; 2C62 _ 48: 89. 4C 24, 20
00002C67        add     rdi, 4                          ; 2C67 _ 48: 83. C7, 04
00002C6B        mov     rcx, rax                        ; 2C6B _ 48: 89. C1
00002C6E        mov     rdx, rdi                        ; 2C6E _ 48: 89. FA
00002C71        mov     r8d, 16                         ; 2C71 _ 41: B8, 00000010
00002C77        xor     r9d, r9d                        ; 2C77 _ 45: 31. C9
00002C7A        call    qword ptr [rax+18H]             ; 2C7A _ FF. 50, 18
00002C7D        mov     rsi, rax                        ; 2C7D _ 48: 89. C6
00002C80        test    rsi, rsi                        ; 2C80 _ 48: 85. F6
00002C83        js      ?_284                           ; 2C83 _ 0F 88, 0000028B
00002C89        mov     rax, qword ptr [?_889]          ; 2C89 _ 48: 8B. 05, 00008018(rel)
00002C90        lea     rcx, ptr [?_897]                ; 2C90 _ 48: 8D. 0D, 00008041(rel)
00002C97        mov     rdx, rdi                        ; 2C97 _ 48: 89. FA
00002C9A        mov     r8d, 16                         ; 2C9A _ 41: B8, 00000010
00002CA0        call    qword ptr [rax+160H]            ; 2CA0 _ FF. 90, 00000160
00002CA6        mov     rcx, qword ptr [rbp-40H]        ; 2CA6 _ 48: 8B. 4D, C0
00002CAA        test    rcx, rcx                        ; 2CAA _ 48: 85. C9
00002CAD        jz      ?_274                           ; 2CAD _ 74, 12
00002CAF        mov     rax, qword ptr [?_889]          ; 2CAF _ 48: 8B. 05, 00007FF2(rel)
00002CB6        call    qword ptr [rax+48H]             ; 2CB6 _ FF. 50, 48
00002CB9        mov     qword ptr [rbp-40H], 0          ; 2CB9 _ 48: C7. 45, C0, 00000000
?_274:
00002CC1        mov     qword ptr [rbp-40H], 0          ; 2CC1 _ 48: C7. 45, C0, 00000000
00002CC9        mov     qword ptr [rbp-48H], 0          ; 2CC9 _ 48: C7. 45, B8, 00000000
00002CD1        mov     rax, qword ptr [rbp-30H]        ; 2CD1 _ 48: 8B. 45, D0
00002CD5        mov     qword ptr [rsp+30H], r14        ; 2CD5 _ 4C: 89. 74 24, 30
00002CDA        lea     rdi, ptr [rbp-74H]              ; 2CDA _ 48: 8D. 7D, 8C
00002CDE        mov     qword ptr [rsp+28H], rdi        ; 2CDE _ 48: 89. 7C 24, 28
00002CE3        lea     rbx, ptr [rbp-49H]              ; 2CE3 _ 48: 8D. 5D, B7
00002CE7        mov     qword ptr [rsp+20H], rbx        ; 2CE7 _ 48: 89. 5C 24, 20
00002CEC        lea     rdx, ptr [rbp-60H]              ; 2CEC _ 48: 8D. 55, A0
00002CF0        lea     r8, ptr [rbp-40H]               ; 2CF0 _ 4C: 8D. 45, C0
00002CF4        lea     r9, ptr [rbp-48H]               ; 2CF4 _ 4C: 8D. 4D, B8
00002CF8        mov     rcx, rax                        ; 2CF8 _ 48: 89. C1
00002CFB        call    qword ptr [rax+10H]             ; 2CFB _ FF. 50, 10
00002CFE        mov     rsi, rax                        ; 2CFE _ 48: 89. C6
00002D01        test    rsi, rsi                        ; 2D01 _ 48: 85. F6
00002D04        js      ?_284                           ; 2D04 _ 0F 88, 0000020A
00002D0A        mov     rsi, 0EH                        ; 2D0A _ 48: BE, 800000000000000E
00002D14        cmp     byte ptr [rbp-49H], 1           ; 2D14 _ 80. 7D, B7, 01
00002D18        jne     ?_284                           ; 2D18 _ 0F 85, 000001F6
00002D1E        mov     qword ptr [rbp-80H], 0          ; 2D1E _ 48: C7. 45, 80, 00000000
00002D26        mov     qword ptr [rbp-88H], 0          ; 2D26 _ 48: C7. 85, FFFFFF78, 00000000
00002D31        mov     rdx, qword ptr [rbp-48H]        ; 2D31 _ 48: 8B. 55, B8
00002D35        mov     rcx, qword ptr [rbp-40H]        ; 2D35 _ 48: 8B. 4D, C0
00002D39        lea     rax, ptr [rbp-80H]              ; 2D39 _ 48: 8D. 45, 80
00002D3D        mov     qword ptr [rsp+20H], rax        ; 2D3D _ 48: 89. 44 24, 20
00002D42        lea     r8, ptr [rbp-90H]               ; 2D42 _ 4C: 8D. 85, FFFFFF70
00002D49        lea     r9, ptr [rbp-88H]               ; 2D49 _ 4C: 8D. 8D, FFFFFF78
00002D50        call    ?_532                           ; 2D50 _ E8, 0000284F
00002D55        mov     rsi, rax                        ; 2D55 _ 48: 89. C6
00002D58        mov     rcx, qword ptr [rbp-40H]        ; 2D58 _ 48: 8B. 4D, C0
00002D5C        test    rcx, rcx                        ; 2D5C _ 48: 85. C9
00002D5F        jz      ?_275                           ; 2D5F _ 74, 12
00002D61        mov     rax, qword ptr [?_889]          ; 2D61 _ 48: 8B. 05, 00007F40(rel)
00002D68        call    qword ptr [rax+48H]             ; 2D68 _ FF. 50, 48
00002D6B        mov     qword ptr [rbp-40H], 0          ; 2D6B _ 48: C7. 45, C0, 00000000
?_275:
00002D73        test    rsi, rsi                        ; 2D73 _ 48: 85. F6
00002D76        js      ?_284                           ; 2D76 _ 0F 88, 00000198
00002D7C        call    ?_423                           ; 2D7C _ E8, 00001D64
00002D81        mov     rsi, 19H                        ; 2D81 _ 48: BE, 8000000000000019
00002D8B        cmp     rax, qword ptr [rbp-90H]        ; 2D8B _ 48: 3B. 85, FFFFFF70
00002D92        jc      ?_284                           ; 2D92 _ 0F 82, 0000017C
00002D98        mov     qword ptr [rbp-40H], 0          ; 2D98 _ 48: C7. 45, C0, 00000000
00002DA0        mov     qword ptr [rbp-48H], 0          ; 2DA0 _ 48: C7. 45, B8, 00000000
00002DA8        mov     rax, qword ptr [rbp-30H]        ; 2DA8 _ 48: 8B. 45, D0
00002DAC        mov     qword ptr [rsp+30H], r14        ; 2DAC _ 4C: 89. 74 24, 30
00002DB1        mov     qword ptr [rsp+28H], rdi        ; 2DB1 _ 48: 89. 7C 24, 28
00002DB6        mov     qword ptr [rsp+20H], rbx        ; 2DB6 _ 48: 89. 5C 24, 20
00002DBB        lea     rdx, ptr [rbp-70H]              ; 2DBB _ 48: 8D. 55, 90
00002DBF        lea     r8, ptr [rbp-40H]               ; 2DBF _ 4C: 8D. 45, C0
00002DC3        lea     r9, ptr [rbp-48H]               ; 2DC3 _ 4C: 8D. 4D, B8
00002DC7        mov     rcx, rax                        ; 2DC7 _ 48: 89. C1
00002DCA        call    qword ptr [rax+10H]             ; 2DCA _ FF. 50, 10
00002DCD        mov     rsi, rax                        ; 2DCD _ 48: 89. C6
00002DD0        test    rsi, rsi                        ; 2DD0 _ 48: 85. F6
00002DD3        js      ?_284                           ; 2DD3 _ 0F 88, 0000013B
00002DD9        mov     rsi, 0EH                        ; 2DD9 _ 48: BE, 800000000000000E
00002DE3        cmp     byte ptr [rbp-49H], 1           ; 2DE3 _ 80. 7D, B7, 01
00002DE7        jne     ?_284                           ; 2DE7 _ 0F 85, 00000127
00002DED        mov     qword ptr [rbp-38H], 0          ; 2DED _ 48: C7. 45, C8, 00000000
00002DF5        mov     rdx, qword ptr [rbp-48H]        ; 2DF5 _ 48: 8B. 55, B8
00002DF9        mov     rcx, qword ptr [rbp-40H]        ; 2DF9 _ 48: 8B. 4D, C0
00002DFD        lea     r8, ptr [rbp-38H]               ; 2DFD _ 4C: 8D. 45, C8
00002E01        call    ?_546                           ; 2E01 _ E8, 00002C07
00002E06        mov     rsi, rax                        ; 2E06 _ 48: 89. C6
00002E09        test    rsi, rsi                        ; 2E09 _ 48: 85. F6
00002E0C        jns     ?_276                           ; 2E0C _ 79, 13
00002E0E        mov     rcx, qword ptr [rbp-40H]        ; 2E0E _ 48: 8B. 4D, C0
00002E12        mov     rax, qword ptr [?_889]          ; 2E12 _ 48: 8B. 05, 00007E8F(rel)
00002E19        call    qword ptr [rax+48H]             ; 2E19 _ FF. 50, 48
00002E1C        jmp     ?_284                           ; 2E1C _ E9, 000000F3

?_276:
00002E21        call    ?_405                           ; 2E21 _ E8, 00001948
00002E26        xor     ecx, ecx                        ; 2E26 _ 31. C9
00002E28        mov     rax, qword ptr [rbp-88H]        ; 2E28 _ 48: 8B. 85, FFFFFF78
00002E2F        test    rax, rax                        ; 2E2F _ 48: 85. C0
00002E32        jz      ?_278                           ; 2E32 _ 74, 16
00002E34        mov     rdx, qword ptr [rbp-80H]        ; 2E34 _ 48: 8B. 55, 80
00002E38        add     rdx, 40                         ; 2E38 _ 48: 83. C2, 28
00002E3C        xor     ecx, ecx                        ; 2E3C _ 31. C9
?_277:
00002E3E        add     rcx, qword ptr [rdx]            ; 2E3E _ 48: 03. 0A
00002E41        add     rdx, 104                        ; 2E41 _ 48: 83. C2, 68
00002E45        dec     rax                             ; 2E45 _ 48: FF. C8
00002E48        jnz     ?_277                           ; 2E48 _ 75, F4
?_278:
00002E4A        call    ?_390                           ; 2E4A _ E8, 0000156A
00002E4F        mov     rax, qword ptr [?_889]          ; 2E4F _ 48: 8B. 05, 00007E52(rel)
00002E56        mov     ecx, 16                         ; 2E56 _ B9, 00000010
00002E5B        call    qword ptr [rax+18H]             ; 2E5B _ FF. 50, 18
00002E5E        mov     ecx, 1                          ; 2E5E _ B9, 00000001
00002E63        call    ?_416                           ; 2E63 _ E8, 00001ADD
00002E68        mov     ecx, 1                          ; 2E68 _ B9, 00000001
00002E6D        call    ?_383                           ; 2E6D _ E8, 000013E0
00002E72        call    ?_385                           ; 2E72 _ E8, 00001446
00002E77        call    ?_620                           ; 2E77 _ E8, 0000377B
00002E7C        test    rax, rax                        ; 2E7C _ 48: 85. C0
00002E7F        jnz     ?_279                           ; 2E7F _ 75, 05
00002E81        call    ?_387                           ; 2E81 _ E8, 00001482
?_279:
00002E86        call    ?_389                           ; 2E86 _ E8, 000014F6
00002E8B        call    ?_643                           ; 2E8B _ E8, 00003973
00002E90        xor     edi, edi                        ; 2E90 _ 31. FF
00002E92        mov     rbx, -1                         ; 2E92 _ 48: C7. C3, FFFFFFFF
00002E99        jmp     ?_281                           ; 2E99 _ EB, 1C

?_280:
00002E9B        mov     rdx, qword ptr [rbp-80H]        ; 2E9B _ 48: 8B. 55, 80
00002E9F        add     rdx, rdi                        ; 2E9F _ 48: 01. FA
00002EA2        lea     rdi, ptr [rdi+68H]              ; 2EA2 _ 48: 8D. 7F, 68
00002EA6        mov     rcx, qword ptr [rbp-38H]        ; 2EA6 _ 48: 8B. 4D, C8
00002EAA        call    ?_255                           ; 2EAA _ E8, FFFFF96F
00002EAF        mov     rsi, rax                        ; 2EAF _ 48: 89. C6
00002EB2        test    rsi, rsi                        ; 2EB2 _ 48: 85. F6
00002EB5        js      ?_282                           ; 2EB5 _ 78, 11
?_281:
00002EB7        inc     rbx                             ; 2EB7 _ 48: FF. C3
00002EBA        cmp     rbx, qword ptr [rbp-88H]        ; 2EBA _ 48: 3B. 9D, FFFFFF78
00002EC1        jc      ?_280                           ; 2EC1 _ 72, D8
00002EC3        test    rsi, rsi                        ; 2EC3 _ 48: 85. F6
00002EC6        jns     ?_283                           ; 2EC6 _ 79, 1D
?_282:
00002EC8        mov     rcx, qword ptr [rbp-80H]        ; 2EC8 _ 48: 8B. 4D, 80
00002ECC        test    rcx, rcx                        ; 2ECC _ 48: 85. C9
00002ECF        jz      ?_284                           ; 2ECF _ 74, 43
00002ED1        mov     rax, qword ptr [?_889]          ; 2ED1 _ 48: 8B. 05, 00007DD0(rel)
00002ED8        call    qword ptr [rax+48H]             ; 2ED8 _ FF. 50, 48
00002EDB        mov     qword ptr [rbp-80H], 0          ; 2EDB _ 48: C7. 45, 80, 00000000
00002EE3        jmp     ?_284                           ; 2EE3 _ EB, 2F

?_283:
00002EE5        xor     ecx, ecx                        ; 2EE5 _ 31. C9
00002EE7        call    ?_383                           ; 2EE7 _ E8, 00001366
00002EEC        xor     ecx, ecx                        ; 2EEC _ 31. C9
00002EEE        call    ?_416                           ; 2EEE _ E8, 00001A52
00002EF3        mov     rax, qword ptr [?_889]          ; 2EF3 _ 48: 8B. 05, 00007DAE(rel)
00002EFA        mov     ecx, 1000000                    ; 2EFA _ B9, 000F4240
00002EFF        call    qword ptr [rax+0F8H]            ; 2EFF _ FF. 90, 000000F8
00002F05        call    ?_410                           ; 2F05 _ E8, 00001980
00002F0A        mov     rsi, 15H                        ; 2F0A _ 48: BE, 8000000000000015
?_284:
00002F14        mov     rax, rsi                        ; 2F14 _ 48: 89. F0
00002F17        add     rsp, 176                        ; 2F17 _ 48: 81. C4, 000000B0
00002F1E        pop     rbx                             ; 2F1E _ 5B
00002F1F        pop     rdi                             ; 2F1F _ 5F
00002F20        pop     rsi                             ; 2F20 _ 5E
00002F21        pop     r14                             ; 2F21 _ 41: 5E
00002F23        pop     rbp                             ; 2F23 _ 5D
00002F24        ret                                     ; 2F24 _ C3

?_285   LABEL NEAR
00002F25        push    rbp                             ; 2F25 _ 55
00002F26        mov     rbp, rsp                        ; 2F26 _ 48: 89. E5
00002F29        push    r15                             ; 2F29 _ 41: 57
00002F2B        push    r14                             ; 2F2B _ 41: 56
00002F2D        push    r12                             ; 2F2D _ 41: 54
00002F2F        push    rsi                             ; 2F2F _ 56
00002F30        push    rdi                             ; 2F30 _ 57
00002F31        push    rbx                             ; 2F31 _ 53
00002F32        sub     rsp, 32                         ; 2F32 _ 48: 83. EC, 20
00002F36        mov     r12, rcx                        ; 2F36 _ 49: 89. CC
00002F39        xor     eax, eax                        ; 2F39 _ 31. C0
00002F3B        mov     rdx, r12                        ; 2F3B _ 4C: 89. E2
00002F3E        xor     ebx, ebx                        ; 2F3E _ 31. DB
00002F40        jmp     ?_287                           ; 2F40 _ EB, 03

?_286:
00002F42        add     rdx, rdi                        ; 2F42 _ 48: 01. FA
?_287:
00002F45        movzx   esi, byte ptr [rdx+2H]          ; 2F45 _ 0F B6. 72, 02
00002F49        movzx   edi, byte ptr [rdx+3H]          ; 2F49 _ 0F B6. 7A, 03
00002F4D        shl     rdi, 8                          ; 2F4D _ 48: C1. E7, 08
00002F51        or      rdi, rsi                        ; 2F51 _ 48: 09. F7
00002F54        add     rbx, rdi                        ; 2F54 _ 48: 01. FB
00002F57        mov     rcx, rbx                        ; 2F57 _ 48: 89. D9
00002F5A        and     rcx, 3H                         ; 2F5A _ 48: 83. E1, 03
00002F5E        mov     esi, 4                          ; 2F5E _ BE, 00000004
00002F63        sub     rsi, rcx                        ; 2F63 _ 48: 29. CE
00002F66        mov     rcx, rbx                        ; 2F66 _ 48: 89. D9
00002F69        and     rcx, 3H                         ; 2F69 _ 48: 83. E1, 03
00002F6D        cmove   rsi, rax                        ; 2F6D _ 48: 0F 44. F0
00002F71        mov     r8b, byte ptr [rdx]             ; 2F71 _ 44: 8A. 02
00002F74        add     rbx, rsi                        ; 2F74 _ 48: 01. F3
00002F77        and     r8b, 7FH                        ; 2F77 _ 41: 80. E0, 7F
00002F7B        cmp     r8b, 127                        ; 2F7B _ 41: 80. F8, 7F
00002F7F        jnz     ?_286                           ; 2F7F _ 75, C1
00002F81        cmp     byte ptr [rdx+1H], -1           ; 2F81 _ 80. 7A, 01, FF
00002F85        jnz     ?_286                           ; 2F85 _ 75, BB
00002F87        mov     rcx, rbx                        ; 2F87 _ 48: 89. D9
00002F8A        call    ?_008                           ; 2F8A _ E8, FFFFD3B0
00002F8F        mov     r14, rax                        ; 2F8F _ 49: 89. C6
00002F92        test    r14, r14                        ; 2F92 _ 4D: 85. F6
00002F95        je      ?_290                           ; 2F95 _ 0F 84, 00000086
00002F9B        xor     r15d, r15d                      ; 2F9B _ 45: 31. FF
00002F9E        mov     rbx, r14                        ; 2F9E _ 4C: 89. F3
00002FA1        jmp     ?_289                           ; 2FA1 _ EB, 19

?_288:
00002FA3        add     rbx, rdi                        ; 2FA3 _ 48: 01. FB
00002FA6        movzx   ecx, byte ptr [r12+2H]          ; 2FA6 _ 41: 0F B6. 4C 24, 02
00002FAC        movzx   eax, byte ptr [r12+3H]          ; 2FAC _ 41: 0F B6. 44 24, 03
00002FB2        shl     rax, 8                          ; 2FB2 _ 48: C1. E0, 08
00002FB6        or      rax, rcx                        ; 2FB6 _ 48: 09. C8
00002FB9        add     r12, rax                        ; 2FB9 _ 49: 01. C4
?_289:
00002FBC        movzx   eax, byte ptr [r12+2H]          ; 2FBC _ 41: 0F B6. 44 24, 02
00002FC2        mov     rcx, rax                        ; 2FC2 _ 48: 89. C1
00002FC5        and     rcx, 3H                         ; 2FC5 _ 48: 83. E1, 03
00002FC9        mov     esi, 4                          ; 2FC9 _ BE, 00000004
00002FCE        sub     rsi, rcx                        ; 2FCE _ 48: 29. CE
00002FD1        mov     rcx, rax                        ; 2FD1 _ 48: 89. C1
00002FD4        and     rcx, 3H                         ; 2FD4 _ 48: 83. E1, 03
00002FD8        cmove   rsi, r15                        ; 2FD8 _ 49: 0F 44. F7
00002FDC        movzx   edi, byte ptr [r12+3H]          ; 2FDC _ 41: 0F B6. 7C 24, 03
00002FE2        shl     rdi, 8                          ; 2FE2 _ 48: C1. E7, 08
00002FE6        or      rdi, rax                        ; 2FE6 _ 48: 09. C7
00002FE9        mov     rax, qword ptr [?_889]          ; 2FE9 _ 48: 8B. 05, 00007CB8(rel)
00002FF0        mov     rcx, rbx                        ; 2FF0 _ 48: 89. D9
00002FF3        mov     rdx, r12                        ; 2FF3 _ 4C: 89. E2
00002FF6        mov     r8, rdi                         ; 2FF6 _ 49: 89. F8
00002FF9        call    qword ptr [rax+160H]            ; 2FF9 _ FF. 90, 00000160
00002FFF        add     rdi, rsi                        ; 2FFF _ 48: 01. F7
00003002        mov     byte ptr [rbx+2H], dil          ; 3002 _ 40: 88. 7B, 02
00003006        mov     rax, rdi                        ; 3006 _ 48: 89. F8
00003009        mov     byte ptr [rbx+3H], ah           ; 3009 _ 88. 63, 03
0000300C        or      byte ptr [rbx], 0FFFFFF80H      ; 300C _ 80. 0B, 80
0000300F        mov     al, byte ptr [r12]              ; 300F _ 41: 8A. 04 24
00003013        and     al, 7FH                         ; 3013 _ 24, 7F
00003015        cmp     al, 127                         ; 3015 _ 3C, 7F
00003017        jnz     ?_288                           ; 3017 _ 75, 8A
00003019        cmp     byte ptr [r12+1H], -1           ; 3019 _ 41: 80. 7C 24, 01, FF
0000301F        jnz     ?_288                           ; 301F _ 75, 82
?_290:
00003021        mov     rax, r14                        ; 3021 _ 4C: 89. F0
00003024        add     rsp, 32                         ; 3024 _ 48: 83. C4, 20
00003028        pop     rbx                             ; 3028 _ 5B
00003029        pop     rdi                             ; 3029 _ 5F
0000302A        pop     rsi                             ; 302A _ 5E
0000302B        pop     r12                             ; 302B _ 41: 5C
0000302D        pop     r14                             ; 302D _ 41: 5E
0000302F        pop     r15                             ; 302F _ 41: 5F
00003031        pop     rbp                             ; 3031 _ 5D
00003032        ret                                     ; 3032 _ C3

?_291   LABEL NEAR
00003033        push    rbp                             ; 3033 _ 55
00003034        mov     rbp, rsp                        ; 3034 _ 48: 89. E5
00003037        push    r14                             ; 3037 _ 41: 56
00003039        push    rsi                             ; 3039 _ 56
0000303A        push    rdi                             ; 303A _ 57
0000303B        push    rbx                             ; 303B _ 53
0000303C        sub     rsp, 48                         ; 303C _ 48: 83. EC, 30
00003040        mov     r14, r9                         ; 3040 _ 4D: 89. CE
00003043        mov     rsi, r8                         ; 3043 _ 4C: 89. C6
00003046        mov     rbx, rdx                        ; 3046 _ 48: 89. D3
00003049        mov     rdi, rcx                        ; 3049 _ 48: 89. CF
0000304C        mov     rcx, rdi                        ; 304C _ 48: 89. F9
0000304F        mov     rdx, rbx                        ; 304F _ 48: 89. DA
00003052        mov     r8d, 1                          ; 3052 _ 41: B8, 00000001
00003058        mov     r9, -1                          ; 3058 _ 49: C7. C1, FFFFFFFF
0000305F        call    qword ptr [rdi+30H]             ; 305F _ FF. 57, 30
00003062        test    rax, rax                        ; 3062 _ 48: 85. C0
00003065        js      ?_292                           ; 3065 _ 78, 29
00003067        mov     qword ptr [rbp-28H], rsi        ; 3067 _ 48: 89. 75, D8
0000306B        mov     qword ptr [rsp+20H], r14        ; 306B _ 4C: 89. 74 24, 20
00003070        lea     r9, ptr [rbp-28H]               ; 3070 _ 4C: 8D. 4D, D8
00003074        mov     rcx, rdi                        ; 3074 _ 48: 89. F9
00003077        mov     rdx, rbx                        ; 3077 _ 48: 89. DA
0000307A        xor     r8d, r8d                        ; 307A _ 45: 31. C0
0000307D        call    qword ptr [rdi+28H]             ; 307D _ FF. 57, 28
00003080        test    rax, rax                        ; 3080 _ 48: 85. C0
00003083        js      ?_292                           ; 3083 _ 78, 0B
00003085        mov     rcx, qword ptr [rbp-28H]        ; 3085 _ 48: 8B. 4D, D8
00003089        cmp     rcx, rsi                        ; 3089 _ 48: 39. F1
0000308C        jnz     ?_292                           ; 308C _ 75, 02
0000308E        xor     eax, eax                        ; 308E _ 31. C0
?_292:
00003090        add     rsp, 48                         ; 3090 _ 48: 83. C4, 30
00003094        pop     rbx                             ; 3094 _ 5B
00003095        pop     rdi                             ; 3095 _ 5F
00003096        pop     rsi                             ; 3096 _ 5E
00003097        pop     r14                             ; 3097 _ 41: 5E
00003099        pop     rbp                             ; 3099 _ 5D
0000309A        ret                                     ; 309A _ C3

?_293   LABEL NEAR
0000309B        push    rbp                             ; 309B _ 55
0000309C        mov     rbp, rsp                        ; 309C _ 48: 89. E5
0000309F        push    r15                             ; 309F _ 41: 57
000030A1        push    r14                             ; 30A1 _ 41: 56
000030A3        push    r13                             ; 30A3 _ 41: 55
000030A5        push    r12                             ; 30A5 _ 41: 54
000030A7        push    rsi                             ; 30A7 _ 56
000030A8        push    rdi                             ; 30A8 _ 57
000030A9        push    rbx                             ; 30A9 _ 53
000030AA        sub     rsp, 56                         ; 30AA _ 48: 83. EC, 38
000030AE        mov     r15, r9                         ; 30AE _ 4D: 89. CF
000030B1        mov     rsi, r8                         ; 30B1 _ 4C: 89. C6
000030B4        mov     r13, rdx                        ; 30B4 _ 49: 89. D5
000030B7        mov     rbx, rcx                        ; 30B7 _ 48: 89. CB
000030BA        mov     r9, qword ptr [rbp+38H]         ; 30BA _ 4C: 8B. 4D, 38
000030BE        mov     r12, qword ptr [rbp+30H]        ; 30BE _ 4C: 8B. 65, 30
000030C2        test    rsi, rsi                        ; 30C2 _ 48: 85. F6
000030C5        jnz     ?_294                           ; 30C5 _ 75, 18
000030C7        cmp     r15, r12                        ; 30C7 _ 4D: 39. E7
000030CA        jnz     ?_294                           ; 30CA _ 75, 13
000030CC        mov     rcx, rbx                        ; 30CC _ 48: 89. D9
000030CF        mov     rdx, r13                        ; 30CF _ 4C: 89. EA
000030D2        mov     r8, r12                         ; 30D2 _ 4D: 89. E0
000030D5        call    ?_291                           ; 30D5 _ E8, FFFFFF59
000030DA        mov     r14, rax                        ; 30DA _ 49: 89. C6
000030DD        jmp     ?_296                           ; 30DD _ EB, 7F

?_294:
000030DF        mov     rcx, r12                        ; 30DF _ 4C: 89. E1
000030E2        call    ?_007                           ; 30E2 _ E8, FFFFD224
000030E7        mov     rdi, rax                        ; 30E7 _ 48: 89. C7
000030EA        mov     r14, 9H                         ; 30EA _ 49: BE, 8000000000000009
000030F4        test    rdi, rdi                        ; 30F4 _ 48: 85. FF
000030F7        jz      ?_296                           ; 30F7 _ 74, 65
000030F9        mov     qword ptr [rbp-40H], r12        ; 30F9 _ 4C: 89. 65, C0
000030FD        mov     qword ptr [rsp+20H], rdi        ; 30FD _ 48: 89. 7C 24, 20
00003102        lea     r9, ptr [rbp-40H]               ; 3102 _ 4C: 8D. 4D, C0
00003106        mov     rcx, rbx                        ; 3106 _ 48: 89. D9
00003109        mov     rdx, r13                        ; 3109 _ 4C: 89. EA
0000310C        xor     r8d, r8d                        ; 310C _ 45: 31. C0
0000310F        call    qword ptr [rbx+20H]             ; 310F _ FF. 53, 20
00003112        mov     r14, rax                        ; 3112 _ 49: 89. C6
00003115        mov     rax, qword ptr [?_889]          ; 3115 _ 48: 8B. 05, 00007B8C(rel)
0000311C        test    r14, r14                        ; 311C _ 4D: 85. F6
0000311F        js      ?_295                           ; 311F _ 78, 37
00003121        mov     rcx, qword ptr [rbp-40H]        ; 3121 _ 48: 8B. 4D, C0
00003125        cmp     rcx, r12                        ; 3125 _ 4C: 39. E1
00003128        jnz     ?_295                           ; 3128 _ 75, 2E
0000312A        add     rsi, rdi                        ; 312A _ 48: 01. FE
0000312D        mov     rcx, rsi                        ; 312D _ 48: 89. F1
00003130        mov     rdx, qword ptr [rbp+38H]        ; 3130 _ 48: 8B. 55, 38
00003134        mov     r8, r15                         ; 3134 _ 4D: 89. F8
00003137        call    qword ptr [rax+160H]            ; 3137 _ FF. 90, 00000160
0000313D        mov     rcx, rbx                        ; 313D _ 48: 89. D9
00003140        mov     rdx, r13                        ; 3140 _ 4C: 89. EA
00003143        mov     r8, r12                         ; 3143 _ 4D: 89. E0
00003146        mov     r9, rdi                         ; 3146 _ 49: 89. F9
00003149        call    ?_291                           ; 3149 _ E8, FFFFFEE5
0000314E        mov     r14, rax                        ; 314E _ 49: 89. C6
00003151        mov     rax, qword ptr [?_889]          ; 3151 _ 48: 8B. 05, 00007B50(rel)
?_295:
00003158        mov     rcx, rdi                        ; 3158 _ 48: 89. F9
0000315B        call    qword ptr [rax+48H]             ; 315B _ FF. 50, 48
?_296:
0000315E        mov     rax, r14                        ; 315E _ 4C: 89. F0
00003161        add     rsp, 56                         ; 3161 _ 48: 83. C4, 38
00003165        pop     rbx                             ; 3165 _ 5B
00003166        pop     rdi                             ; 3166 _ 5F
00003167        pop     rsi                             ; 3167 _ 5E
00003168        pop     r12                             ; 3168 _ 41: 5C
0000316A        pop     r13                             ; 316A _ 41: 5D
0000316C        pop     r14                             ; 316C _ 41: 5E
0000316E        pop     r15                             ; 316E _ 41: 5F
00003170        pop     rbp                             ; 3170 _ 5D
00003171        ret                                     ; 3171 _ C3

?_297   LABEL NEAR
00003172        push    rbp                             ; 3172 _ 55
00003173        mov     rbp, rsp                        ; 3173 _ 48: 89. E5
00003176        push    r15                             ; 3176 _ 41: 57
00003178        push    r14                             ; 3178 _ 41: 56
0000317A        push    r13                             ; 317A _ 41: 55
0000317C        push    r12                             ; 317C _ 41: 54
0000317E        push    rsi                             ; 317E _ 56
0000317F        push    rdi                             ; 317F _ 57
00003180        push    rbx                             ; 3180 _ 53
00003181        sub     rsp, 104                        ; 3181 _ 48: 83. EC, 68
00003185        mov     r12, r9                         ; 3185 _ 4D: 89. CC
00003188        mov     rbx, r8                         ; 3188 _ 4C: 89. C3
0000318B        mov     rsi, rdx                        ; 318B _ 48: 89. D6
0000318E        mov     qword ptr [rbp-60H], rcx        ; 318E _ 48: 89. 4D, A0
00003192        mov     rax, qword ptr [rbp+50H]        ; 3192 _ 48: 8B. 45, 50
00003196        mov     byte ptr [rax], 0               ; 3196 _ C6. 00, 00
00003199        mov     qword ptr [rbp-50H], r12        ; 3199 _ 4C: 89. 65, B0
0000319D        lea     rcx, ptr [rbp-50H]              ; 319D _ 48: 8D. 4D, B0
000031A1        mov     rdx, qword ptr [rbp+30H]        ; 31A1 _ 48: 8B. 55, 30
000031A5        lea     rax, ptr [rbp-51H]              ; 31A5 _ 48: 8D. 45, AF
000031A9        mov     qword ptr [rsp+38H], rax        ; 31A9 _ 48: 89. 44 24, 38
000031AE        mov     qword ptr [rsp+30H], rdx        ; 31AE _ 48: 89. 54 24, 30
000031B3        mov     qword ptr [rsp+28H], rcx        ; 31B3 _ 48: 89. 4C 24, 28
000031B8        mov     rax, qword ptr [rbp+48H]        ; 31B8 _ 48: 8B. 45, 48
000031BC        mov     qword ptr [rsp+20H], rax        ; 31BC _ 48: 89. 44 24, 20
000031C1        lea     rdx, ptr [rbp-48H]              ; 31C1 _ 48: 8D. 55, B8
000031C5        mov     rax, qword ptr [rbp+38H]        ; 31C5 _ 48: 8B. 45, 38
000031C9        mov     rdi, qword ptr [rbp+40H]        ; 31C9 _ 48: 8B. 7D, 40
000031CD        mov     rcx, rsi                        ; 31CD _ 48: 89. F1
000031D0        mov     r8, rax                         ; 31D0 _ 49: 89. C0
000031D3        mov     r13, rax                        ; 31D3 _ 49: 89. C5
000031D6        mov     r9, rdi                         ; 31D6 _ 49: 89. F9
000031D9        mov     r14, rdi                        ; 31D9 _ 49: 89. FE
000031DC        call    qword ptr [rsi+28H]             ; 31DC _ FF. 56, 28
000031DF        mov     rdi, rax                        ; 31DF _ 48: 89. C7
000031E2        test    rdi, rdi                        ; 31E2 _ 48: 85. FF
000031E5        jns     ?_300                           ; 31E5 _ 0F 89, 000000C9
000031EB        mov     rax, 0EH                        ; 31EB _ 48: B8, 800000000000000E
000031F5        cmp     rdi, rax                        ; 31F5 _ 48: 39. C7
000031F8        jnz     ?_298                           ; 31F8 _ 75, 0D
000031FA        mov     cl, byte ptr [rbp-51H]          ; 31FA _ 8A. 4D, AF
000031FD        xor     eax, eax                        ; 31FD _ 31. C0
000031FF        test    cl, cl                          ; 31FF _ 84. C9
00003201        jne     ?_301                           ; 3201 _ 0F 85, 0000012B
?_298:
00003207        mov     rax, 15H                        ; 3207 _ 48: B8, 8000000000000015
00003211        mov     rcx, 5H                         ; 3211 _ 48: B9, 8000000000000005
0000321B        cmp     rdi, rcx                        ; 321B _ 48: 39. CF
0000321E        jne     ?_301                           ; 321E _ 0F 85, 0000010E
00003224        mov     rcx, qword ptr [rbp-50H]        ; 3224 _ 48: 8B. 4D, B0
00003228        call    ?_007                           ; 3228 _ E8, FFFFD0DE
0000322D        mov     r15, rax                        ; 322D _ 49: 89. C7
00003230        mov     rax, 9H                         ; 3230 _ 48: B8, 8000000000000009
0000323A        test    r15, r15                        ; 323A _ 4D: 85. FF
0000323D        je      ?_301                           ; 323D _ 0F 84, 000000EF
00003243        lea     rax, ptr [rbp-51H]              ; 3243 _ 48: 8D. 45, AF
00003247        mov     qword ptr [rsp+38H], rax        ; 3247 _ 48: 89. 44 24, 38
0000324C        mov     qword ptr [rsp+30H], r15        ; 324C _ 4C: 89. 7C 24, 30
00003251        lea     rax, ptr [rbp-50H]              ; 3251 _ 48: 8D. 45, B0
00003255        mov     qword ptr [rsp+28H], rax        ; 3255 _ 48: 89. 44 24, 28
0000325A        mov     rax, qword ptr [rbp+48H]        ; 325A _ 48: 8B. 45, 48
0000325E        mov     qword ptr [rsp+20H], rax        ; 325E _ 48: 89. 44 24, 20
00003263        lea     rdx, ptr [rbp-48H]              ; 3263 _ 48: 8D. 55, B8
00003267        mov     rcx, rsi                        ; 3267 _ 48: 89. F1
0000326A        mov     r8, r13                         ; 326A _ 4D: 89. E8
0000326D        mov     r9, r14                         ; 326D _ 4D: 89. F1
00003270        call    qword ptr [rsi+28H]             ; 3270 _ FF. 56, 28
00003273        mov     rdi, rax                        ; 3273 _ 48: 89. C7
00003276        mov     rax, qword ptr [?_889]          ; 3276 _ 48: 8B. 05, 00007A2B(rel)
0000327D        test    rdi, rdi                        ; 327D _ 48: 85. FF
00003280        jns     ?_299                           ; 3280 _ 79, 15
00003282        mov     rcx, r15                        ; 3282 _ 4C: 89. F9
00003285        call    qword ptr [rax+48H]             ; 3285 _ FF. 50, 48
00003288        mov     rax, 15H                        ; 3288 _ 48: B8, 8000000000000015
00003292        jmp     ?_301                           ; 3292 _ E9, 0000009B

?_299:
00003297        mov     rcx, qword ptr [rbp+30H]        ; 3297 _ 48: 8B. 4D, 30
0000329B        mov     rdx, r15                        ; 329B _ 4C: 89. FA
0000329E        mov     r8, r12                         ; 329E _ 4D: 89. E0
000032A1        call    qword ptr [rax+160H]            ; 32A1 _ FF. 90, 00000160
000032A7        mov     rax, qword ptr [?_889]          ; 32A7 _ 48: 8B. 05, 000079FA(rel)
000032AE        mov     rcx, r15                        ; 32AE _ 4C: 89. F9
000032B1        call    qword ptr [rax+48H]             ; 32B1 _ FF. 50, 48
?_300:
000032B4        mov     rax, qword ptr [rbp+50H]        ; 32B4 _ 48: 8B. 45, 50
000032B8        mov     byte ptr [rax], 1               ; 32B8 _ C6. 00, 01
000032BB        lea     rcx, ptr [rbp-48H]              ; 32BB _ 48: 8D. 4D, B8
000032BF        lea     rdx, ptr [?_897]                ; 32BF _ 48: 8D. 15, 00007A12(rel)
000032C6        mov     r8d, 16                         ; 32C6 _ 41: B8, 00000010
000032CC        call    ?_020                           ; 32CC _ E8, FFFFD191
000032D1        mov     rcx, rax                        ; 32D1 _ 48: 89. C1
000032D4        mov     rax, 0EH                        ; 32D4 _ 48: B8, 800000000000000E
000032DE        test    rcx, rcx                        ; 32DE _ 48: 85. C9
000032E1        jnz     ?_301                           ; 32E1 _ 75, 4F
000032E3        add     rbx, 24                         ; 32E3 _ 48: 83. C3, 18
000032E7        mov     rcx, qword ptr [rbp+30H]        ; 32E7 _ 48: 8B. 4D, 30
000032EB        mov     rdx, rbx                        ; 32EB _ 48: 89. DA
000032EE        mov     r8d, 16                         ; 32EE _ 41: B8, 00000010
000032F4        call    ?_020                           ; 32F4 _ E8, FFFFD169
000032F9        mov     rcx, rax                        ; 32F9 _ 48: 89. C1
000032FC        mov     rax, 0EH                        ; 32FC _ 48: B8, 800000000000000E
00003306        test    rcx, rcx                        ; 3306 _ 48: 85. C9
00003309        jnz     ?_301                           ; 3309 _ 75, 27
0000330B        cmp     byte ptr [rbp-51H], 0           ; 330B _ 80. 7D, AF, 00
0000330F        mov     rax, rdi                        ; 330F _ 48: 89. F8
00003312        jnz     ?_301                           ; 3312 _ 75, 1E
00003314        mov     rcx, rsi                        ; 3314 _ 48: 89. F1
00003317        mov     rdx, qword ptr [rbp-60H]        ; 3317 _ 48: 8B. 55, A0
0000331B        call    qword ptr [rsi+18H]             ; 331B _ FF. 56, 18
0000331E        test    rax, rax                        ; 331E _ 48: 85. C0
00003321        jns     ?_301                           ; 3321 _ 79, 0F
00003323        mov     rcx, rsi                        ; 3323 _ 48: 89. F1
00003326        call    qword ptr [rsi+20H]             ; 3326 _ FF. 56, 20
00003329        mov     rax, qword ptr [rbp+50H]        ; 3329 _ 48: 8B. 45, 50
0000332D        mov     byte ptr [rax], 0               ; 332D _ C6. 00, 00
00003330        xor     eax, eax                        ; 3330 _ 31. C0
?_301:
00003332        add     rsp, 104                        ; 3332 _ 48: 83. C4, 68
00003336        pop     rbx                             ; 3336 _ 5B
00003337        pop     rdi                             ; 3337 _ 5F
00003338        pop     rsi                             ; 3338 _ 5E
00003339        pop     r12                             ; 3339 _ 41: 5C
0000333B        pop     r13                             ; 333B _ 41: 5D
0000333D        pop     r14                             ; 333D _ 41: 5E
0000333F        pop     r15                             ; 333F _ 41: 5F
00003341        pop     rbp                             ; 3341 _ 5D
00003342        ret                                     ; 3342 _ C3

?_302   LABEL NEAR
00003343        push    rbp                             ; 3343 _ 55
00003344        mov     rbp, rsp                        ; 3344 _ 48: 89. E5
00003347        push    r15                             ; 3347 _ 41: 57
00003349        push    r14                             ; 3349 _ 41: 56
0000334B        push    r13                             ; 334B _ 41: 55
0000334D        push    r12                             ; 334D _ 41: 54
0000334F        push    rsi                             ; 334F _ 56
00003350        push    rdi                             ; 3350 _ 57
00003351        push    rbx                             ; 3351 _ 53
00003352        sub     rsp, 152                        ; 3352 _ 48: 81. EC, 00000098
00003359        mov     r12, r9                         ; 3359 _ 4D: 89. CC
0000335C        mov     r14, r8                         ; 335C _ 4D: 89. C6
0000335F        mov     qword ptr [rbp-80H], rcx        ; 335F _ 48: 89. 4D, 80
00003363        mov     rcx, 2H                         ; 3363 _ 48: B9, 8000000000000002
0000336D        cmp     dword ptr [r12+8H], 0           ; 336D _ 41: 83. 7C 24, 08, 00
00003373        jne     ?_315                           ; 3373 _ 0F 85, 00000221
00003379        mov     rcx, 2H                         ; 3379 _ 48: B9, 8000000000000002
00003383        cmp     byte ptr [r12+30H], 0           ; 3383 _ 41: 80. 7C 24, 30, 00
00003389        je      ?_315                           ; 3389 _ 0F 84, 0000020B
0000338F        mov     rax, qword ptr [?_889]          ; 338F _ 48: 8B. 05, 00007912(rel)
00003396        lea     rcx, ptr [?_820]                ; 3396 _ 48: 8D. 0D, 0000704F(rel)
0000339D        xor     ebx, ebx                        ; 339D _ 31. DB
0000339F        lea     r8, ptr [rbp-40H]               ; 339F _ 4C: 8D. 45, C0
000033A3        xor     edx, edx                        ; 33A3 _ 31. D2
000033A5        call    qword ptr [rax+140H]            ; 33A5 _ FF. 90, 00000140
000033AB        mov     rcx, 0EH                        ; 33AB _ 48: B9, 800000000000000E
000033B5        test    rax, rax                        ; 33B5 _ 48: 85. C0
000033B8        js      ?_315                           ; 33B8 _ 0F 88, 000001DC
000033BE        mov     rdi, qword ptr [rbp+30H]        ; 33BE _ 48: 8B. 7D, 30
000033C2        lea     rax, ptr [r14+4H]               ; 33C2 _ 49: 8D. 46, 04
000033C6        mov     rsi, rbx                        ; 33C6 _ 48: 89. DE
000033C9        jmp     ?_304                           ; 33C9 _ EB, 0E

?_303:
000033CB        cmp     rbx, rdx                        ; 33CB _ 48: 39. D3
000033CE        cmovc   rbx, rdx                        ; 33CE _ 48: 0F 42. DA
000033D2        add     rsi, rcx                        ; 33D2 _ 48: 01. CE
000033D5        add     rax, 8                          ; 33D5 _ 48: 83. C0, 08
?_304:
000033D9        mov     ecx, dword ptr [rax-4H]         ; 33D9 _ 8B. 48, FC
000033DC        test    rcx, rcx                        ; 33DC _ 48: 85. C9
000033DF        jz      ?_305                           ; 33DF _ 74, 07
000033E1        mov     edx, dword ptr [rax]            ; 33E1 _ 8B. 10
000033E3        test    rdx, rdx                        ; 33E3 _ 48: 85. D2
000033E6        jnz     ?_303                           ; 33E6 _ 75, E3
?_305:
000033E8        mov     rax, qword ptr [rbp-40H]        ; 33E8 _ 48: 8B. 45, C0
000033EC        lea     rdx, ptr [rbp-48H]              ; 33EC _ 48: 8D. 55, B8
000033F0        mov     rcx, rax                        ; 33F0 _ 48: 89. C1
000033F3        call    qword ptr [rax]                 ; 33F3 _ FF. 10
000033F5        mov     rcx, 9H                         ; 33F5 _ 48: B9, 8000000000000009
000033FF        cmp     qword ptr [rbp-48H], rbx        ; 33FF _ 48: 39. 5D, B8
00003403        jc      ?_315                           ; 3403 _ 0F 82, 00000191
00003409        mov     qword ptr [rbp-68H], 0          ; 3409 _ 48: C7. 45, 98, 00000000
00003411        mov     qword ptr [rbp-70H], 0          ; 3411 _ 48: C7. 45, 90, 00000000
00003419        mov     qword ptr [rbp-78H], 0          ; 3419 _ 48: C7. 45, 88, 00000000
00003421        mov     byte ptr [rbp-49H], 0           ; 3421 _ C6. 45, B7, 00
00003425        mov     rdx, qword ptr [rbp-40H]        ; 3425 _ 48: 8B. 55, C0
00003429        lea     rcx, ptr [rbp-60H]              ; 3429 _ 48: 8D. 4D, A0
0000342D        lea     r8, ptr [rbp-68H]               ; 342D _ 4C: 8D. 45, 98
00003431        lea     r9, ptr [rbp-70H]               ; 3431 _ 4C: 8D. 4D, 90
00003435        lea     rbx, ptr [rbp-78H]              ; 3435 _ 48: 8D. 5D, 88
00003439        lea     rax, ptr [rbp-49H]              ; 3439 _ 48: 8D. 45, B7
0000343D        mov     qword ptr [rsp+40H], rax        ; 343D _ 48: 89. 44 24, 40
00003442        mov     qword ptr [rsp+38H], rbx        ; 3442 _ 48: 89. 5C 24, 38
00003447        mov     qword ptr [rsp+30H], r9         ; 3447 _ 4C: 89. 4C 24, 30
0000344C        mov     qword ptr [rsp+28H], r8         ; 344C _ 4C: 89. 44 24, 28
00003451        mov     qword ptr [rsp+20H], rcx        ; 3451 _ 48: 89. 4C 24, 20
00003456        mov     rcx, qword ptr [rbp-80H]        ; 3456 _ 48: 8B. 4D, 80
0000345A        mov     r8, r12                         ; 345A _ 4D: 89. E0
0000345D        mov     r9d, 16                         ; 345D _ 41: B9, 00000010
00003463        call    ?_297                           ; 3463 _ E8, FFFFFD0A
00003468        mov     rcx, 15H                        ; 3468 _ 48: B9, 8000000000000015
00003472        mov     rdx, 0EH                        ; 3472 _ 48: BA, 800000000000000E
0000347C        cmp     rax, rdx                        ; 347C _ 48: 39. D0
0000347F        sete    r8b                             ; 347F _ 41: 0F 94. C0
00003483        mov     r13b, byte ptr [rbp-49H]        ; 3483 _ 44: 8A. 6D, B7
00003487        test    r13b, r13b                      ; 3487 _ 45: 84. ED
0000348A        setne   dl                              ; 348A _ 0F 95. C2
0000348D        test    r8b, dl                         ; 348D _ 41: 84. D0
00003490        jne     ?_315                           ; 3490 _ 0F 85, 00000104
00003496        test    rax, rax                        ; 3496 _ 48: 85. C0
00003499        js      ?_315                           ; 3499 _ 0F 88, 000000FB
0000349F        test    r13b, r13b                      ; 349F _ 45: 84. ED
000034A2        jnz     ?_306                           ; 34A2 _ 75, 26
000034A4        mov     rax, qword ptr [rbp-40H]        ; 34A4 _ 48: 8B. 45, C0
000034A8        lea     rdx, ptr [?_897]                ; 34A8 _ 48: 8D. 15, 00007829(rel)
000034AF        mov     rcx, rax                        ; 34AF _ 48: 89. C1
000034B2        mov     r8d, 16                         ; 34B2 _ 41: B8, 00000010
000034B8        mov     r9, rsi                         ; 34B8 _ 49: 89. F1
000034BB        call    qword ptr [rax+8H]              ; 34BB _ FF. 50, 08
000034BE        test    rax, rax                        ; 34BE _ 48: 85. C0
000034C1        mov     rcx, rax                        ; 34C1 _ 48: 89. C1
000034C4        js      ?_315                           ; 34C4 _ 0F 88, 000000D0
?_306:
000034CA        mov     rcx, qword ptr [r12+18H]        ; 34CA _ 49: 8B. 4C 24, 18
000034CF        mov     rdx, qword ptr [r12+20H]        ; 34CF _ 49: 8B. 54 24, 20
000034D4        mov     qword ptr [rbp-58H], rdx        ; 34D4 _ 48: 89. 55, A8
000034D8        mov     qword ptr [rbp-60H], rcx        ; 34D8 _ 48: 89. 4D, A0
000034DC        add     r14, 4                          ; 34DC _ 49: 83. C6, 04
000034E0        xor     r15d, r15d                      ; 34E0 _ 45: 31. FF
000034E3        jmp     ?_313                           ; 34E3 _ E9, 000000A3

?_307:
000034E8        mov     ebx, dword ptr [r14]            ; 34E8 _ 41: 8B. 1E
000034EB        test    rbx, rbx                        ; 34EB _ 48: 85. DB
000034EE        je      ?_314                           ; 34EE _ 0F 84, 000000A3
000034F4        xor     r12d, r12d                      ; 34F4 _ 45: 31. E4
000034F7        jmp     ?_311                           ; 34F7 _ EB, 3B

?_308:
000034F9        cmp     rdx, rsi                        ; 34F9 _ 48: 39. F2
000034FC        jc      ?_310                           ; 34FC _ 72, 27
?_309:
000034FE        mov     rax, qword ptr [rbp-40H]        ; 34FE _ 48: 8B. 45, C0
00003502        mov     qword ptr [rsp+30H], rdi        ; 3502 _ 48: 89. 7C 24, 30
00003507        mov     rcx, qword ptr [rbp-80H]        ; 3507 _ 48: 8B. 4D, 80
0000350B        mov     qword ptr [rsp+28H], rcx        ; 350B _ 48: 89. 4C 24, 28
00003510        lea     rcx, ptr [rbp-60H]              ; 3510 _ 48: 8D. 4D, A0
00003514        mov     qword ptr [rsp+20H], rcx        ; 3514 _ 48: 89. 4C 24, 20
00003519        mov     rcx, rax                        ; 3519 _ 48: 89. C1
0000351C        xor     r8d, r8d                        ; 351C _ 45: 31. C0
0000351F        mov     r9, rbx                         ; 351F _ 49: 89. D9
00003522        call    qword ptr [rax+10H]             ; 3522 _ FF. 50, 10
?_310:
00003525        test    rax, rax                        ; 3525 _ 48: 85. C0
00003528        js      ?_314                           ; 3528 _ 78, 6D
0000352A        add     rdi, rbx                        ; 352A _ 48: 01. DF
0000352D        mov     ecx, dword ptr [r14-4H]         ; 352D _ 41: 8B. 4E, FC
00003531        inc     r12                             ; 3531 _ 49: FF. C4
?_311:
00003534        lea     rdx, ptr [r15+r12]              ; 3534 _ 4B: 8D. 14 27
00003538        mov     ecx, ecx                        ; 3538 _ 89. C9
0000353A        cmp     r12, rcx                        ; 353A _ 49: 39. CC
0000353D        jnc     ?_312                           ; 353D _ 73, 40
0000353F        test    r13b, r13b                      ; 353F _ 45: 84. ED
00003542        jz      ?_309                           ; 3542 _ 74, BA
00003544        mov     rsi, qword ptr [rbp-68H]        ; 3544 _ 48: 8B. 75, 98
00003548        cmp     rdx, rsi                        ; 3548 _ 48: 39. F2
0000354B        jnz     ?_308                           ; 354B _ 75, AC
0000354D        mov     rcx, 15H                        ; 354D _ 48: B9, 8000000000000015
00003557        cmp     qword ptr [rbp-70H], 0          ; 3557 _ 48: 83. 7D, 90, 00
0000355C        jnz     ?_315                           ; 355C _ 75, 3C
0000355E        mov     rcx, 15H                        ; 355E _ 48: B9, 8000000000000015
00003568        cmp     qword ptr [rbp-78H], rbx        ; 3568 _ 48: 39. 5D, 88
0000356C        jnz     ?_315                           ; 356C _ 75, 2C
0000356E        test    r13b, r13b                      ; 356E _ 45: 84. ED
00003571        setne   cl                              ; 3571 _ 0F 95. C1
00003574        cmp     rdx, rsi                        ; 3574 _ 48: 39. F2
00003577        jnc     ?_309                           ; 3577 _ 73, 85
00003579        test    cl, cl                          ; 3579 _ 84. C9
0000357B        jz      ?_309                           ; 357B _ 74, 81
0000357D        jmp     ?_310                           ; 357D _ EB, A6

?_312:
0000357F        test    rax, rax                        ; 357F _ 48: 85. C0
00003582        js      ?_314                           ; 3582 _ 78, 13
00003584        add     r14, 8                          ; 3584 _ 49: 83. C6, 08
00003588        mov     r15, rdx                        ; 3588 _ 49: 89. D7
?_313:
0000358B        mov     ecx, dword ptr [r14-4H]         ; 358B _ 41: 8B. 4E, FC
0000358F        test    ecx, ecx                        ; 358F _ 85. C9
00003591        jne     ?_307                           ; 3591 _ 0F 85, FFFFFF51
?_314:
00003597        mov     rcx, rax                        ; 3597 _ 48: 89. C1
?_315:
0000359A        mov     rax, rcx                        ; 359A _ 48: 89. C8
0000359D        add     rsp, 152                        ; 359D _ 48: 81. C4, 00000098
000035A4        pop     rbx                             ; 35A4 _ 5B
000035A5        pop     rdi                             ; 35A5 _ 5F
000035A6        pop     rsi                             ; 35A6 _ 5E
000035A7        pop     r12                             ; 35A7 _ 41: 5C
000035A9        pop     r13                             ; 35A9 _ 41: 5D
000035AB        pop     r14                             ; 35AB _ 41: 5E
000035AD        pop     r15                             ; 35AD _ 41: 5F
000035AF        pop     rbp                             ; 35AF _ 5D
000035B0        ret                                     ; 35B0 _ C3

?_316   LABEL NEAR
000035B1        push    rbp                             ; 35B1 _ 55
000035B2        mov     rbp, rsp                        ; 35B2 _ 48: 89. E5
000035B5        push    r15                             ; 35B5 _ 41: 57
000035B7        push    r14                             ; 35B7 _ 41: 56
000035B9        push    r13                             ; 35B9 _ 41: 55
000035BB        push    r12                             ; 35BB _ 41: 54
000035BD        push    rsi                             ; 35BD _ 56
000035BE        push    rdi                             ; 35BE _ 57
000035BF        push    rbx                             ; 35BF _ 53
000035C0        sub     rsp, 56                         ; 35C0 _ 48: 83. EC, 38
000035C4        mov     r15, r9                         ; 35C4 _ 4D: 89. CF
000035C7        mov     r12, r8                         ; 35C7 _ 4D: 89. C4
000035CA        mov     qword ptr [rbp-40H], rdx        ; 35CA _ 48: 89. 55, C0
000035CE        mov     rsi, 2H                         ; 35CE _ 48: BE, 8000000000000002
000035D8        cmp     dword ptr [r15+8H], 0           ; 35D8 _ 41: 83. 7F, 08, 00
000035DD        jne     ?_322                           ; 35DD _ 0F 85, 00000082
000035E3        mov     rsi, 2H                         ; 35E3 _ 48: BE, 8000000000000002
000035ED        cmp     byte ptr [r15+30H], 0           ; 35ED _ 41: 80. 7F, 30, 00
000035F2        jnz     ?_322                           ; 35F2 _ 75, 71
000035F4        mov     rbx, qword ptr [rbp+30H]        ; 35F4 _ 48: 8B. 5D, 30
000035F8        add     r12, 4                          ; 35F8 _ 49: 83. C4, 04
000035FC        xor     esi, esi                        ; 35FC _ 31. F6
000035FE        mov     r13, rsi                        ; 35FE _ 49: 89. F5
00003601        jmp     ?_318                           ; 3601 _ EB, 07

?_317:
00003603        add     r12, 8                          ; 3603 _ 49: 83. C4, 08
00003607        mov     r13, r8                         ; 3607 _ 4D: 89. C5
?_318:
0000360A        mov     eax, dword ptr [r12-4H]         ; 360A _ 41: 8B. 44 24, FC
0000360F        test    eax, eax                        ; 360F _ 85. C0
00003611        jz      ?_321                           ; 3611 _ 74, 46
00003613        mov     edi, dword ptr [r12]            ; 3613 _ 41: 8B. 3C 24
00003617        test    rdi, rdi                        ; 3617 _ 48: 85. FF
0000361A        jz      ?_321                           ; 361A _ 74, 3D
0000361C        xor     r14d, r14d                      ; 361C _ 45: 31. F6
0000361F        jmp     ?_320                           ; 361F _ EB, 27

?_319:
00003621        mov     qword ptr [rsp+20H], rbx        ; 3621 _ 48: 89. 5C 24, 20
00003626        mov     rcx, qword ptr [rbp-40H]        ; 3626 _ 48: 8B. 4D, C0
0000362A        mov     rdx, r15                        ; 362A _ 4C: 89. FA
0000362D        mov     r9, rdi                         ; 362D _ 49: 89. F9
00003630        call    ?_399                           ; 3630 _ E8, 00000F8C
00003635        mov     rsi, rax                        ; 3635 _ 48: 89. C6
00003638        test    rsi, rsi                        ; 3638 _ 48: 85. F6
0000363B        js      ?_321                           ; 363B _ 78, 1C
0000363D        add     rbx, rdi                        ; 363D _ 48: 01. FB
00003640        mov     eax, dword ptr [r12-4H]         ; 3640 _ 41: 8B. 44 24, FC
00003645        inc     r14                             ; 3645 _ 49: FF. C6
?_320:
00003648        lea     r8, ptr [r13+r14]               ; 3648 _ 4F: 8D. 44 35, 00
0000364D        mov     eax, eax                        ; 364D _ 89. C0
0000364F        cmp     r14, rax                        ; 364F _ 49: 39. C6
00003652        jc      ?_319                           ; 3652 _ 72, CD
00003654        test    rsi, rsi                        ; 3654 _ 48: 85. F6
00003657        jns     ?_317                           ; 3657 _ 79, AA
?_321:
00003659        lea     rcx, ptr [?_769]                ; 3659 _ 48: 8D. 0D, 00004898(rel)
00003660        call    ?_121                           ; 3660 _ E8, FFFFD770
?_322:
00003665        mov     rax, rsi                        ; 3665 _ 48: 89. F0
00003668        add     rsp, 56                         ; 3668 _ 48: 83. C4, 38
0000366C        pop     rbx                             ; 366C _ 5B
0000366D        pop     rdi                             ; 366D _ 5F
0000366E        pop     rsi                             ; 366E _ 5E
0000366F        pop     r12                             ; 366F _ 41: 5C
00003671        pop     r13                             ; 3671 _ 41: 5D
00003673        pop     r14                             ; 3673 _ 41: 5E
00003675        pop     r15                             ; 3675 _ 41: 5F
00003677        pop     rbp                             ; 3677 _ 5D
00003678        ret                                     ; 3678 _ C3

?_323   LABEL NEAR
00003679        push    rbp                             ; 3679 _ 55
0000367A        mov     rbp, rsp                        ; 367A _ 48: 89. E5
0000367D        push    r15                             ; 367D _ 41: 57
0000367F        push    r14                             ; 367F _ 41: 56
00003681        push    r12                             ; 3681 _ 41: 54
00003683        push    rsi                             ; 3683 _ 56
00003684        push    rdi                             ; 3684 _ 57
00003685        push    rbx                             ; 3685 _ 53
00003686        sub     rsp, 48                         ; 3686 _ 48: 83. EC, 30
0000368A        mov     r12, r9                         ; 368A _ 4D: 89. CC
0000368D        mov     rdi, r8                         ; 368D _ 4C: 89. C7
00003690        mov     r15, rdx                        ; 3690 _ 49: 89. D7
00003693        mov     r14, rcx                        ; 3693 _ 49: 89. CE
00003696        mov     rsi, 2H                         ; 3696 _ 48: BE, 8000000000000002
000036A0        cmp     dword ptr [rdi+8H], 0           ; 36A0 _ 83. 7F, 08, 00
000036A4        jne     ?_327                           ; 36A4 _ 0F 85, 000000AF
000036AA        mov     rax, qword ptr [rdi+10H]        ; 36AA _ 48: 8B. 47, 10
000036AE        movzx   ecx, word ptr [rax+30H]         ; 36AE _ 0F B7. 48, 30
000036B2        call    ?_007                           ; 36B2 _ E8, FFFFCC54
000036B7        mov     rbx, rax                        ; 36B7 _ 48: 89. C3
000036BA        mov     rsi, 9H                         ; 36BA _ 48: BE, 8000000000000009
000036C4        test    rbx, rbx                        ; 36C4 _ 48: 85. DB
000036C7        je      ?_327                           ; 36C7 _ 0F 84, 0000008C
000036CD        mov     rsi, qword ptr [rbp+30H]        ; 36CD _ 48: 8B. 75, 30
000036D1        mov     rdx, qword ptr [rdi+10H]        ; 36D1 _ 48: 8B. 57, 10
000036D5        movzx   r8d, word ptr [rdx+30H]         ; 36D5 _ 44: 0F B7. 42, 30
000036DA        mov     rax, qword ptr [?_889]          ; 36DA _ 48: 8B. 05, 000075C7(rel)
000036E1        mov     rcx, rbx                        ; 36E1 _ 48: 89. D9
000036E4        call    qword ptr [rax+160H]            ; 36E4 _ FF. 90, 00000160
000036EA        mov     rdx, qword ptr [rbx+20H]        ; 36EA _ 48: 8B. 53, 20
000036EE        cmp     rdx, rsi                        ; 36EE _ 48: 39. F2
000036F1        jz      ?_324                           ; 36F1 _ 74, 19
000036F3        mov     rax, qword ptr [?_889]          ; 36F3 _ 48: 8B. 05, 000075AE(rel)
000036FA        mov     rcx, rbx                        ; 36FA _ 48: 89. D9
000036FD        call    qword ptr [rax+48H]             ; 36FD _ FF. 50, 48
00003700        mov     rsi, 2H                         ; 3700 _ 48: BE, 8000000000000002
0000370A        jmp     ?_327                           ; 370A _ EB, 4D

?_324:
0000370C        mov     rcx, qword ptr [rdi+10H]        ; 370C _ 48: 8B. 4F, 10
00003710        add     rdx, rcx                        ; 3710 _ 48: 01. CA
00003713        call    ?_391                           ; 3713 _ E8, 00000CDC
00003718        lea     r8, ptr [rbx+38H]               ; 3718 _ 4C: 8D. 43, 38
0000371C        cmp     byte ptr [rdi+30H], 0           ; 371C _ 80. 7F, 30, 00
00003720        jz      ?_325                           ; 3720 _ 74, 12
00003722        mov     qword ptr [rsp+20H], r12        ; 3722 _ 4C: 89. 64 24, 20
00003727        mov     rcx, r14                        ; 3727 _ 4C: 89. F1
0000372A        mov     r9, rdi                         ; 372A _ 49: 89. F9
0000372D        call    ?_302                           ; 372D _ E8, FFFFFC11
00003732        jmp     ?_326                           ; 3732 _ EB, 10

?_325:
00003734        mov     qword ptr [rsp+20H], r12        ; 3734 _ 4C: 89. 64 24, 20
00003739        mov     rdx, r15                        ; 3739 _ 4C: 89. FA
0000373C        mov     r9, rdi                         ; 373C _ 49: 89. F9
0000373F        call    ?_316                           ; 373F _ E8, FFFFFE6D
?_326:
00003744        mov     rsi, rax                        ; 3744 _ 48: 89. C6
00003747        mov     rax, qword ptr [?_889]          ; 3747 _ 48: 8B. 05, 0000755A(rel)
0000374E        mov     rcx, rbx                        ; 374E _ 48: 89. D9
00003751        call    qword ptr [rax+48H]             ; 3751 _ FF. 50, 48
00003754        test    rsi, rsi                        ; 3754 _ 48: 85. F6
00003757        jns     ?_328                           ; 3757 _ 79, 12
?_327:
00003759        mov     rax, rsi                        ; 3759 _ 48: 89. F0
0000375C        add     rsp, 48                         ; 375C _ 48: 83. C4, 30
00003760        pop     rbx                             ; 3760 _ 5B
00003761        pop     rdi                             ; 3761 _ 5F
00003762        pop     rsi                             ; 3762 _ 5E
00003763        pop     r12                             ; 3763 _ 41: 5C
00003765        pop     r14                             ; 3765 _ 41: 5E
00003767        pop     r15                             ; 3767 _ 41: 5F
00003769        pop     rbp                             ; 3769 _ 5D
0000376A        ret                                     ; 376A _ C3

?_328:
0000376B        mov     rax, qword ptr [?_889]          ; 376B _ 48: 8B. 05, 00007536(rel)
00003772        mov     rax, qword ptr [rax+88H]        ; 3772 _ 48: 8B. 80, 00000088
00003779        lea     rdx, ptr [?_824]                ; 3779 _ 48: 8D. 15, 00006CAC(rel)
00003780        mov     rcx, r14                        ; 3780 _ 4C: 89. F1
00003783        mov     r8, r15                         ; 3783 _ 4D: 89. F8
00003786        mov     r9, r15                         ; 3786 _ 4D: 89. F9
00003789        add     rsp, 48                         ; 3789 _ 48: 83. C4, 30
0000378D        pop     rbx                             ; 378D _ 5B
0000378E        pop     rdi                             ; 378E _ 5F
0000378F        pop     rsi                             ; 378F _ 5E
00003790        pop     r12                             ; 3790 _ 41: 5C
00003792        pop     r14                             ; 3792 _ 41: 5E
00003794        pop     r15                             ; 3794 _ 41: 5F
00003796        pop     rbp                             ; 3796 _ 5D
00003797        jmp     rax                             ; 3797 _ FF. E0

?_329   LABEL NEAR
00003799        push    rbp                             ; 3799 _ 55
0000379A        mov     rbp, rsp                        ; 379A _ 48: 89. E5
0000379D        push    rsi                             ; 379D _ 56
0000379E        push    rdi                             ; 379E _ 57
0000379F        push    rbx                             ; 379F _ 53
000037A0        sub     rsp, 72                         ; 37A0 _ 48: 83. EC, 48
000037A4        mov     rbx, r9                         ; 37A4 _ 4C: 89. CB
000037A7        mov     rsi, r8                         ; 37A7 _ 4C: 89. C6
000037AA        mov     rax, 2H                         ; 37AA _ 48: B8, 8000000000000002
000037B4        cmp     dword ptr [rsi+8H], 1           ; 37B4 _ 83. 7E, 08, 01
000037B8        jnz     ?_331                           ; 37B8 _ 75, 71
000037BA        mov     rax, qword ptr [?_889]          ; 37BA _ 48: 8B. 05, 000074E7(rel)
000037C1        lea     rdx, ptr [?_823]                ; 37C1 _ 48: 8D. 15, 00006C54(rel)
000037C8        lea     r8, ptr [rbp-20H]               ; 37C8 _ 4C: 8D. 45, E0
000037CC        call    qword ptr [rax+98H]             ; 37CC _ FF. 90, 00000098
000037D2        test    rax, rax                        ; 37D2 _ 48: 85. C0
000037D5        js      ?_331                           ; 37D5 _ 78, 54
000037D7        mov     cl, byte ptr [rbp+38H]          ; 37D7 _ 8A. 4D, 38
000037DA        cmp     cl, 8                           ; 37DA _ 80. F9, 08
000037DD        ja      ?_330                           ; 37DD _ 77, 18
000037DF        movzx   edx, cl                         ; 37DF _ 0F B6. D1
000037E2        mov     rax, 3H                         ; 37E2 _ 48: B8, 8000000000000003
000037EC        mov     edi, 336                        ; 37EC _ BF, 00000150
000037F1        bt      rdi, rdx                        ; 37F1 _ 48: 0F A3. D7
000037F5        jc      ?_331                           ; 37F5 _ 72, 34
?_330:
000037F7        mov     edx, dword ptr [rbp+40H]        ; 37F7 _ 8B. 55, 40
000037FA        mov     rax, qword ptr [rbp+30H]        ; 37FA _ 48: 8B. 45, 30
000037FE        lea     rdi, ptr [rsi+18H]              ; 37FE _ 48: 8D. 7E, 18
00003802        mov     qword ptr [rbp-40H], rdi        ; 3802 _ 48: 89. 7D, C0
00003806        mov     byte ptr [rbp-38H], cl          ; 3806 _ 88. 4D, C8
00003809        mov     dword ptr [rbp-34H], edx        ; 3809 _ 89. 55, CC
0000380C        mov     qword ptr [rbp-30H], rbx        ; 380C _ 48: 89. 5D, D0
00003810        mov     dword ptr [rbp-28H], eax        ; 3810 _ 89. 45, D8
00003813        lea     r9, ptr [rbp-40H]               ; 3813 _ 4C: 8D. 4D, C0
00003817        movzx   r8d, byte ptr [rsi+30H]         ; 3817 _ 44: 0F B6. 46, 30
0000381C        mov     rax, qword ptr [rbp-20H]        ; 381C _ 48: 8B. 45, E0
00003820        mov     rcx, rax                        ; 3820 _ 48: 89. C1
00003823        mov     edx, 1                          ; 3823 _ BA, 00000001
00003828        call    qword ptr [rax+20H]             ; 3828 _ FF. 50, 20
?_331:
0000382B        add     rsp, 72                         ; 382B _ 48: 83. C4, 48
0000382F        pop     rbx                             ; 382F _ 5B
00003830        pop     rdi                             ; 3830 _ 5F
00003831        pop     rsi                             ; 3831 _ 5E
00003832        pop     rbp                             ; 3832 _ 5D
00003833        ret                                     ; 3833 _ C3

?_332   LABEL NEAR
00003834        push    rbp                             ; 3834 _ 55
00003835        mov     rbp, rsp                        ; 3835 _ 48: 89. E5
00003838        push    r15                             ; 3838 _ 41: 57
0000383A        push    r14                             ; 383A _ 41: 56
0000383C        push    r13                             ; 383C _ 41: 55
0000383E        push    r12                             ; 383E _ 41: 54
00003840        push    rsi                             ; 3840 _ 56
00003841        push    rdi                             ; 3841 _ 57
00003842        push    rbx                             ; 3842 _ 53
00003843        sub     rsp, 264                        ; 3843 _ 48: 81. EC, 00000108
0000384A        mov     qword ptr [rbp-0C8H], r9        ; 384A _ 4C: 89. 8D, FFFFFF38
00003851        mov     qword ptr [rbp-0F0H], r8        ; 3851 _ 4C: 89. 85, FFFFFF10
00003858        mov     qword ptr [rbp-0E8H], rdx       ; 3858 _ 48: 89. 95, FFFFFF18
0000385F        mov     qword ptr [rbp-0D0H], rcx       ; 385F _ 48: 89. 8D, FFFFFF30
00003866        lea     rdx, ptr [rbp-40H]              ; 3866 _ 48: 8D. 55, C0
0000386A        mov     rax, qword ptr [rbp+38H]        ; 386A _ 48: 8B. 45, 38
0000386E        mov     rcx, rax                        ; 386E _ 48: 89. C1
00003871        call    qword ptr [rax+10H]             ; 3871 _ FF. 50, 10
00003874        test    rax, rax                        ; 3874 _ 48: 85. C0
00003877        mov     qword ptr [rbp-0C0H], rax       ; 3877 _ 48: 89. 85, FFFFFF40
0000387E        js      ?_357                           ; 387E _ 0F 88, 0000066A
00003884        mov     rsi, qword ptr [rbp+30H]        ; 3884 _ 48: 8B. 75, 30
00003888        mov     rax, 2H                         ; 3888 _ 48: B8, 8000000000000002
00003892        mov     qword ptr [rbp-0C0H], rax       ; 3892 _ 48: 89. 85, FFFFFF40
00003899        mov     rdx, qword ptr [rbp-40H]        ; 3899 _ 48: 8B. 55, C0
0000389D        cmp     rdx, rsi                        ; 389D _ 48: 39. F2
000038A0        ja      ?_357                           ; 38A0 _ 0F 87, 00000648
000038A6        mov     rax, qword ptr [rdx+20H]        ; 38A6 _ 48: 8B. 42, 20
000038AA        add     rax, rdx                        ; 38AA _ 48: 01. D0
000038AD        mov     rcx, 2H                         ; 38AD _ 48: B9, 8000000000000002
000038B7        mov     qword ptr [rbp-0C0H], rcx       ; 38B7 _ 48: 89. 8D, FFFFFF40
000038BE        cmp     rax, rsi                        ; 38BE _ 48: 39. F0
000038C1        jc      ?_357                           ; 38C1 _ 0F 82, 00000627
000038C7        mov     r13, rsi                        ; 38C7 _ 49: 89. F5
000038CA        movzx   ecx, word ptr [rdx+30H]         ; 38CA _ 0F B7. 4A, 30
000038CE        call    ?_010                           ; 38CE _ E8, FFFFCAC1
000038D3        mov     rcx, rax                        ; 38D3 _ 48: 89. C1
000038D6        mov     rax, 9H                         ; 38D6 _ 48: B8, 8000000000000009
000038E0        mov     qword ptr [rbp-0C0H], rax       ; 38E0 _ 48: 89. 85, FFFFFF40
000038E7        test    rcx, rcx                        ; 38E7 _ 48: 85. C9
000038EA        mov     qword ptr [rbp-0E0H], rcx       ; 38EA _ 48: 89. 8D, FFFFFF20
000038F1        je      ?_357                           ; 38F1 _ 0F 84, 000005F7
000038F7        mov     rax, qword ptr [rbp-0E0H]       ; 38F7 _ 48: 8B. 85, FFFFFF20
000038FE        lea     rdx, ptr [rax+3CH]              ; 38FE _ 48: 8D. 50, 3C
00003902        xor     eax, eax                        ; 3902 _ 31. C0
00003904        mov     rbx, qword ptr [rbp-40H]        ; 3904 _ 48: 8B. 5D, C0
00003908        mov     r12, qword ptr [rbp-0E8H]       ; 3908 _ 4C: 8B. A5, FFFFFF18
0000390F        mov     rdi, r13                        ; 390F _ 4C: 89. EF
00003912        mov     qword ptr [rbp-88H], rax        ; 3912 _ 48: 89. 85, FFFFFF78
00003919        mov     qword ptr [rbp-0B8H], 0         ; 3919 _ 48: C7. 85, FFFFFF48, 00000000
00003924        jmp     ?_336                           ; 3924 _ E9, 00000108

?_333:
00003929        mov     qword ptr [rbp-0B0H], rdx       ; 3929 _ 48: 89. 95, FFFFFF50
00003930        mov     r8d, 1                          ; 3930 _ 41: B8, 00000001
00003936        sub     r8, rbx                         ; 3936 _ 49: 29. D8
00003939        mov     rax, rcx                        ; 3939 _ 48: 89. C8
0000393C        not     rax                             ; 393C _ 48: F7. D0
0000393F        mov     qword ptr [rbp-98H], rax        ; 393F _ 48: 89. 85, FFFFFF68
00003946        dec     rbx                             ; 3946 _ 48: FF. CB
00003949        mov     r15, -1                         ; 3949 _ 49: C7. C7, FFFFFFFF
00003950        mov     rsi, rbx                        ; 3950 _ 48: 89. DE
?_334:
00003953        mov     r11, rsi                        ; 3953 _ 49: 89. F3
00003956        mov     rdx, r8                         ; 3956 _ 4C: 89. C2
00003959        lea     rbx, ptr [r11+1H]               ; 3959 _ 49: 8D. 5B, 01
0000395D        inc     r15                             ; 395D _ 49: FF. C7
00003960        cmp     r15, qword ptr [rbp-0A0H]       ; 3960 _ 4C: 3B. BD, FFFFFF60
00003967        jnc     ?_335                           ; 3967 _ 0F 83, 000000B9
0000396D        lea     rsi, ptr [r11+rcx]              ; 396D _ 49: 8D. 34 0B
00003971        mov     r8, rdx                         ; 3971 _ 49: 89. D0
00003974        sub     r8, rcx                         ; 3974 _ 49: 29. C8
00003977        cmp     rdi, rbx                        ; 3977 _ 48: 39. DF
0000397A        mov     qword ptr [rbp-0A8H], rbx       ; 397A _ 48: 89. 9D, FFFFFF58
00003981        jc      ?_334                           ; 3981 _ 72, D0
00003983        lea     rax, ptr [rcx+r11+1H]           ; 3983 _ 4A: 8D. 44 19, 01
00003988        cmp     rdi, rax                        ; 3988 _ 48: 39. C7
0000398B        jnc     ?_334                           ; 398B _ 73, C6
0000398D        mov     qword ptr [rbp-90H], rsi        ; 398D _ 48: 89. B5, FFFFFF70
00003994        mov     rax, r11                        ; 3994 _ 4C: 89. D8
00003997        sub     rax, rdi                        ; 3997 _ 48: 29. F8
0000399A        sub     rax, r12                        ; 399A _ 4C: 29. E0
0000399D        mov     rbx, qword ptr [rbp-98H]        ; 399D _ 48: 8B. 9D, FFFFFF68
000039A4        cmp     rax, rbx                        ; 39A4 _ 48: 39. D8
000039A7        mov     r14, rbx                        ; 39A7 _ 49: 89. DE
000039AA        cmova   r14, rax                        ; 39AA _ 4C: 0F 47. F0
000039AE        lea     rbx, ptr [rdi+r12]              ; 39AE _ 4A: 8D. 1C 27
000039B2        neg     rdi                             ; 39B2 _ 48: F7. DF
000039B5        sub     rdi, r14                        ; 39B5 _ 4C: 29. F7
000039B8        lea     r10, ptr [rbx+r14]              ; 39B8 _ 4E: 8D. 14 33
000039BC        add     r10, rdx                        ; 39BC _ 49: 01. D2
000039BF        add     rdi, r11                        ; 39BF _ 4C: 01. DF
000039C2        mov     r9, r11                         ; 39C2 _ 4D: 89. D9
000039C5        sub     r9, r14                         ; 39C5 _ 4D: 29. F1
000039C8        mov     rsi, qword ptr [rbp-88H]        ; 39C8 _ 48: 8B. B5, FFFFFF78
000039CF        cmp     rsi, rcx                        ; 39CF _ 48: 39. CE
000039D2        cmovc   rsi, rcx                        ; 39D2 _ 48: 0F 42. F1
000039D6        mov     qword ptr [rbp-88H], rsi        ; 39D6 _ 48: 89. B5, FFFFFF78
000039DD        inc     qword ptr [rbp-0B8H]            ; 39DD _ 48: FF. 85, FFFFFF48
000039E4        cmp     rdi, r12                        ; 39E4 _ 4C: 39. E7
000039E7        mov     r12, r10                        ; 39E7 _ 4D: 89. D4
000039EA        mov     rdi, r9                         ; 39EA _ 4C: 89. CF
000039ED        mov     rsi, qword ptr [rbp-90H]        ; 39ED _ 48: 8B. B5, FFFFFF70
000039F4        jne     ?_334                           ; 39F4 _ 0F 85, FFFFFF59
000039FA        not     ecx                             ; 39FA _ F7. D1
000039FC        mov     rsi, 0H                         ; 39FC _ 48: BE, FFFFFFFF00000000
00003A06        or      rcx, rsi                        ; 3A06 _ 48: 09. F1
00003A09        cmp     rax, rcx                        ; 3A09 _ 48: 39. C8
00003A0C        cmova   rcx, rax                        ; 3A0C _ 48: 0F 47. C8
00003A10        sub     r11, rcx                        ; 3A10 _ 49: 29. CB
00003A13        add     rbx, rcx                        ; 3A13 _ 48: 01. CB
00003A16        add     rbx, rdx                        ; 3A16 _ 48: 01. D3
00003A19        mov     r12, rbx                        ; 3A19 _ 49: 89. DC
00003A1C        mov     rdi, r11                        ; 3A1C _ 4C: 89. DF
00003A1F        mov     rbx, qword ptr [rbp-0A8H]       ; 3A1F _ 48: 8B. 9D, FFFFFF58
?_335:
00003A26        mov     rdx, qword ptr [rbp-0B0H]       ; 3A26 _ 48: 8B. 95, FFFFFF50
00003A2D        add     rdx, 8                          ; 3A2D _ 48: 83. C2, 08
?_336:
00003A31        test    r12, r12                        ; 3A31 _ 4D: 85. E4
00003A34        jz      ?_337                           ; 3A34 _ 74, 1A
00003A36        mov     eax, dword ptr [rdx-4H]         ; 3A36 _ 8B. 42, FC
00003A39        test    rax, rax                        ; 3A39 _ 48: 85. C0
00003A3C        mov     qword ptr [rbp-0A0H], rax       ; 3A3C _ 48: 89. 85, FFFFFF60
00003A43        jz      ?_337                           ; 3A43 _ 74, 0B
00003A45        mov     ecx, dword ptr [rdx]            ; 3A45 _ 8B. 0A
00003A47        test    rcx, rcx                        ; 3A47 _ 48: 85. C9
00003A4A        jne     ?_333                           ; 3A4A _ 0F 85, FFFFFED9
?_337:
00003A50        mov     r14, r13                        ; 3A50 _ 4D: 89. EE
00003A53        mov     rax, qword ptr [?_889]          ; 3A53 _ 48: 8B. 05, 0000724E(rel)
00003A5A        lea     rcx, ptr [?_820]                ; 3A5A _ 48: 8D. 0D, 0000698B(rel)
00003A61        lea     r8, ptr [rbp-48H]               ; 3A61 _ 4C: 8D. 45, B8
00003A65        xor     edx, edx                        ; 3A65 _ 31. D2
00003A67        call    qword ptr [rax+140H]            ; 3A67 _ FF. 90, 00000140
00003A6D        test    rax, rax                        ; 3A6D _ 48: 85. C0
00003A70        mov     rbx, qword ptr [rbp-0C8H]       ; 3A70 _ 48: 8B. 9D, FFFFFF38
00003A77        jns     ?_338                           ; 3A77 _ 79, 27
00003A79        mov     rax, qword ptr [?_889]          ; 3A79 _ 48: 8B. 05, 00007228(rel)
00003A80        mov     rcx, qword ptr [rbp-0E0H]       ; 3A80 _ 48: 8B. 8D, FFFFFF20
00003A87        call    qword ptr [rax+48H]             ; 3A87 _ FF. 50, 48
00003A8A        mov     rax, 0EH                        ; 3A8A _ 48: B8, 800000000000000E
00003A94        mov     qword ptr [rbp-0C0H], rax       ; 3A94 _ 48: 89. 85, FFFFFF40
00003A9B        jmp     ?_357                           ; 3A9B _ E9, 0000044E

?_338:
00003AA0        mov     rax, qword ptr [rbp-48H]        ; 3AA0 _ 48: 8B. 45, B8
00003AA4        lea     rdx, ptr [rbp-50H]              ; 3AA4 _ 48: 8D. 55, B0
00003AA8        mov     rcx, rax                        ; 3AA8 _ 48: 89. C1
00003AAB        call    qword ptr [rax]                 ; 3AAB _ FF. 10
00003AAD        mov     rax, qword ptr [rbp-88H]        ; 3AAD _ 48: 8B. 85, FFFFFF78
00003AB4        cmp     qword ptr [rbp-50H], rax        ; 3AB4 _ 48: 39. 45, B0
00003AB8        jnc     ?_339                           ; 3AB8 _ 73, 27
00003ABA        mov     rax, qword ptr [?_889]          ; 3ABA _ 48: 8B. 05, 000071E7(rel)
00003AC1        mov     rcx, qword ptr [rbp-0E0H]       ; 3AC1 _ 48: 8B. 8D, FFFFFF20
00003AC8        call    qword ptr [rax+48H]             ; 3AC8 _ FF. 50, 48
00003ACB        mov     rax, 9H                         ; 3ACB _ 48: B8, 8000000000000009
00003AD5        mov     qword ptr [rbp-0C0H], rax       ; 3AD5 _ 48: 89. 85, FFFFFF40
00003ADC        jmp     ?_357                           ; 3ADC _ E9, 0000040D

?_339:
00003AE1        mov     qword ptr [rbp-70H], 0          ; 3AE1 _ 48: C7. 45, 90, 00000000
00003AE9        mov     qword ptr [rbp-78H], 0          ; 3AE9 _ 48: C7. 45, 88, 00000000
00003AF1        mov     qword ptr [rbp-80H], 0          ; 3AF1 _ 48: C7. 45, 80, 00000000
00003AF9        mov     byte ptr [rbp-51H], 0           ; 3AF9 _ C6. 45, AF, 00
00003AFD        mov     rdx, qword ptr [rbp-48H]        ; 3AFD _ 48: 8B. 55, B8
00003B01        lea     rax, ptr [rbp-68H]              ; 3B01 _ 48: 8D. 45, 98
00003B05        lea     r8, ptr [rbp-70H]               ; 3B05 _ 4C: 8D. 45, 90
00003B09        lea     rcx, ptr [rbp-78H]              ; 3B09 _ 48: 8D. 4D, 88
00003B0D        lea     rsi, ptr [rbp-80H]              ; 3B0D _ 48: 8D. 75, 80
00003B11        lea     rdi, ptr [rbp-51H]              ; 3B11 _ 48: 8D. 7D, AF
00003B15        mov     qword ptr [rsp+40H], rdi        ; 3B15 _ 48: 89. 7C 24, 40
00003B1A        mov     qword ptr [rsp+38H], rsi        ; 3B1A _ 48: 89. 74 24, 38
00003B1F        mov     qword ptr [rsp+30H], rcx        ; 3B1F _ 48: 89. 4C 24, 30
00003B24        mov     qword ptr [rsp+28H], r8         ; 3B24 _ 4C: 89. 44 24, 28
00003B29        mov     qword ptr [rsp+20H], rax        ; 3B29 _ 48: 89. 44 24, 20
00003B2E        mov     rcx, qword ptr [rbp+40H]        ; 3B2E _ 48: 8B. 4D, 40
00003B32        mov     r8, rbx                         ; 3B32 _ 49: 89. D8
00003B35        mov     r9d, 16                         ; 3B35 _ 41: B9, 00000010
00003B3B        call    ?_297                           ; 3B3B _ E8, FFFFF632
00003B40        mov     qword ptr [rbp-0C0H], rax       ; 3B40 _ 48: 89. 85, FFFFFF40
00003B47        mov     al, byte ptr [rbp-51H]          ; 3B47 _ 8A. 45, AF
00003B4A        test    al, al                          ; 3B4A _ 84. C0
00003B4C        mov     byte ptr [rbp-0B0H], al         ; 3B4C _ 88. 85, FFFFFF50
00003B52        jz      ?_341                           ; 3B52 _ 74, 3A
00003B54        mov     rax, 0EH                        ; 3B54 _ 48: B8, 800000000000000E
00003B5E        cmp     qword ptr [rbp-0C0H], rax       ; 3B5E _ 48: 39. 85, FFFFFF40
00003B65        jnz     ?_341                           ; 3B65 _ 75, 27
?_340:
00003B67        mov     rax, qword ptr [?_889]          ; 3B67 _ 48: 8B. 05, 0000713A(rel)
00003B6E        mov     rcx, qword ptr [rbp-0E0H]       ; 3B6E _ 48: 8B. 8D, FFFFFF20
00003B75        call    qword ptr [rax+48H]             ; 3B75 _ FF. 50, 48
00003B78        mov     rax, 15H                        ; 3B78 _ 48: B8, 8000000000000015
00003B82        mov     qword ptr [rbp-0C0H], rax       ; 3B82 _ 48: 89. 85, FFFFFF40
00003B89        jmp     ?_357                           ; 3B89 _ E9, 00000360

?_341:
00003B8E        cmp     qword ptr [rbp-0C0H], 0         ; 3B8E _ 48: 83. BD, FFFFFF40, 00
00003B96        js      ?_340                           ; 3B96 _ 78, CF
00003B98        cmp     byte ptr [rbp-0B0H], 0          ; 3B98 _ 80. BD, FFFFFF50, 00
00003B9F        jnz     ?_342                           ; 3B9F _ 75, 40
00003BA1        mov     rax, qword ptr [rbp-48H]        ; 3BA1 _ 48: 8B. 45, B8
00003BA5        lea     rdx, ptr [?_897]                ; 3BA5 _ 48: 8D. 15, 0000712C(rel)
00003BAC        mov     rcx, rax                        ; 3BAC _ 48: 89. C1
00003BAF        mov     r8d, 16                         ; 3BAF _ 41: B8, 00000010
00003BB5        mov     r9, qword ptr [rbp-0B8H]        ; 3BB5 _ 4C: 8B. 8D, FFFFFF48
00003BBC        call    qword ptr [rax+8H]              ; 3BBC _ FF. 50, 08
00003BBF        test    rax, rax                        ; 3BBF _ 48: 85. C0
00003BC2        mov     qword ptr [rbp-0C0H], rax       ; 3BC2 _ 48: 89. 85, FFFFFF40
00003BC9        jns     ?_342                           ; 3BC9 _ 79, 16
00003BCB        mov     rax, qword ptr [?_889]          ; 3BCB _ 48: 8B. 05, 000070D6(rel)
00003BD2        mov     rcx, qword ptr [rbp-0E0H]       ; 3BD2 _ 48: 8B. 8D, FFFFFF20
00003BD9        call    qword ptr [rax+48H]             ; 3BD9 _ FF. 50, 48
00003BDC        jmp     ?_357                           ; 3BDC _ E9, 0000030D

?_342:
00003BE1        mov     rdx, qword ptr [rbp-40H]        ; 3BE1 _ 48: 8B. 55, C0
00003BE5        mov     rax, qword ptr [rbx+18H]        ; 3BE5 _ 48: 8B. 43, 18
00003BE9        mov     rcx, qword ptr [rbx+20H]        ; 3BE9 _ 48: 8B. 4B, 20
00003BED        mov     qword ptr [rbp-60H], rcx        ; 3BED _ 48: 89. 4D, A0
00003BF1        mov     qword ptr [rbp-68H], rax        ; 3BF1 _ 48: 89. 45, 98
00003BF5        mov     rax, qword ptr [rbp-0E0H]       ; 3BF5 _ 48: 8B. 85, FFFFFF20
00003BFC        lea     rax, ptr [rax+3CH]              ; 3BFC _ 48: 8D. 40, 3C
00003C00        mov     qword ptr [rbp-0B8H], rax       ; 3C00 _ 48: 89. 85, FFFFFF48
00003C07        mov     rsi, qword ptr [rbp-0E8H]       ; 3C07 _ 48: 8B. B5, FFFFFF18
00003C0E        mov     qword ptr [rbp-0C8H], 0         ; 3C0E _ 48: C7. 85, FFFFFF38, 00000000
00003C19        mov     r10, qword ptr [rbp-0D0H]       ; 3C19 _ 4C: 8B. 95, FFFFFF30
00003C20        mov     rbx, r14                        ; 3C20 _ 4C: 89. F3
00003C23        jmp     ?_355                           ; 3C23 _ E9, 0000028B

?_343:
00003C28        mov     rax, qword ptr [rbp-0B8H]       ; 3C28 _ 48: 8B. 85, FFFFFF48
00003C2F        mov     eax, dword ptr [rax-4H]         ; 3C2F _ 8B. 40, FC
00003C32        test    eax, eax                        ; 3C32 _ 85. C0
00003C34        je      ?_356                           ; 3C34 _ 0F 84, 00000284
00003C3A        mov     rcx, qword ptr [rbp-0B8H]       ; 3C3A _ 48: 8B. 8D, FFFFFF48
00003C41        mov     ecx, dword ptr [rcx]            ; 3C41 _ 8B. 09
00003C43        mov     qword ptr [rbp-90H], rcx        ; 3C43 _ 48: 89. 8D, FFFFFF70
00003C4A        test    rcx, rcx                        ; 3C4A _ 48: 85. C9
00003C4D        je      ?_356                           ; 3C4D _ 0F 84, 0000026B
00003C53        mov     rcx, qword ptr [rbp-90H]        ; 3C53 _ 48: 8B. 8D, FFFFFF70
00003C5A        not     rcx                             ; 3C5A _ 48: F7. D1
00003C5D        mov     qword ptr [rbp-0A0H], rcx       ; 3C5D _ 48: 89. 8D, FFFFFF60
00003C64        mov     rdi, 0H                         ; 3C64 _ 48: BF, FFFFFFFF00000000
00003C6E        or      rcx, rdi                        ; 3C6E _ 48: 09. F9
00003C71        mov     qword ptr [rbp-98H], rcx        ; 3C71 _ 48: 89. 8D, FFFFFF68
00003C78        mov     r8, rdx                         ; 3C78 _ 49: 89. D0
00003C7B        neg     r8                              ; 3C7B _ 49: F7. D8
00003C7E        dec     rdx                             ; 3C7E _ 48: FF. CA
00003C81        xor     edi, edi                        ; 3C81 _ 31. FF
00003C83        mov     r14, rdx                        ; 3C83 _ 49: 89. D6
00003C86        mov     qword ptr [rbp-0D8H], rdx       ; 3C86 _ 48: 89. 95, FFFFFF28
00003C8D        jmp     ?_352                           ; 3C8D _ E9, 000001D0

?_344:
00003C92        cmp     rbx, rdx                        ; 3C92 _ 48: 39. D3
00003C95        jc      ?_351                           ; 3C95 _ 0F 82, 000001B7
00003C9B        mov     qword ptr [rbp-88H], rdi        ; 3C9B _ 48: 89. BD, FFFFFF78
00003CA2        mov     rcx, qword ptr [rbp-90H]        ; 3CA2 _ 48: 8B. 8D, FFFFFF70
00003CA9        lea     rcx, ptr [rcx+r14+1H]           ; 3CA9 _ 4A: 8D. 4C 31, 01
00003CAE        cmp     rbx, rcx                        ; 3CAE _ 48: 39. CB
00003CB1        jc      ?_345                           ; 3CB1 _ 72, 0C
00003CB3        mov     rdi, qword ptr [rbp-88H]        ; 3CB3 _ 48: 8B. BD, FFFFFF78
00003CBA        jmp     ?_351                           ; 3CBA _ E9, 00000193

?_345:
00003CBF        mov     qword ptr [rbp-0D0H], rdx       ; 3CBF _ 48: 89. 95, FFFFFF30
00003CC6        cmp     byte ptr [rbp-0B0H], 0          ; 3CC6 _ 80. BD, FFFFFF50, 00
00003CCD        jz      ?_346                           ; 3CCD _ 74, 5F
00003CCF        mov     rax, qword ptr [rbp-70H]        ; 3CCF _ 48: 8B. 45, 90
00003CD3        cmp     r11, rax                        ; 3CD3 _ 49: 39. C3
00003CD6        jne     ?_347                           ; 3CD6 _ 0F 85, 000000D5
00003CDC        lea     rcx, ptr [rbx+r8]               ; 3CDC _ 4A: 8D. 0C 03
00003CE0        cmp     rcx, qword ptr [rbp-78H]        ; 3CE0 _ 48: 3B. 4D, 88
00003CE4        jne     ?_356                           ; 3CE4 _ 0F 85, 000001D4
00003CEA        mov     rcx, r14                        ; 3CEA _ 4C: 89. F1
00003CED        sub     rcx, rbx                        ; 3CED _ 48: 29. D9
00003CF0        sub     rcx, rsi                        ; 3CF0 _ 48: 29. F1
00003CF3        mov     rdx, qword ptr [rbp-98H]        ; 3CF3 _ 48: 8B. 95, FFFFFF68
00003CFA        cmp     rcx, rdx                        ; 3CFA _ 48: 39. D1
00003CFD        cmovbe  rcx, rdx                        ; 3CFD _ 48: 0F 46. CA
00003D01        mov     rdx, rbx                        ; 3D01 _ 48: 89. DA
00003D04        neg     rdx                             ; 3D04 _ 48: F7. DA
00003D07        sub     rdx, rcx                        ; 3D07 _ 48: 29. CA
00003D0A        add     rdx, r14                        ; 3D0A _ 4C: 01. F2
00003D0D        cmp     rdx, qword ptr [rbp-80H]        ; 3D0D _ 48: 3B. 55, 80
00003D11        jne     ?_356                           ; 3D11 _ 0F 85, 000001A7
00003D17        cmp     byte ptr [rbp-0B0H], 0          ; 3D17 _ 80. BD, FFFFFF50, 00
00003D1E        setne   cl                              ; 3D1E _ 0F 95. C1
00003D21        cmp     r11, rax                        ; 3D21 _ 49: 39. C3
00003D24        jnc     ?_346                           ; 3D24 _ 73, 08
00003D26        test    cl, cl                          ; 3D26 _ 84. C9
00003D28        jne     ?_348                           ; 3D28 _ 0F 85, 0000008C
?_346:
00003D2E        mov     rcx, r14                        ; 3D2E _ 4C: 89. F1
00003D31        sub     rcx, rbx                        ; 3D31 _ 48: 29. D9
00003D34        sub     rcx, rsi                        ; 3D34 _ 48: 29. F1
00003D37        mov     r9, rbx                         ; 3D37 _ 49: 89. D9
00003D3A        neg     r9                              ; 3D3A _ 49: F7. D9
00003D3D        mov     rax, qword ptr [rbp-48H]        ; 3D3D _ 48: 8B. 45, B8
00003D41        mov     rdx, qword ptr [rbp-98H]        ; 3D41 _ 48: 8B. 95, FFFFFF68
00003D48        cmp     rcx, rdx                        ; 3D48 _ 48: 39. D1
00003D4B        cmovbe  rcx, rdx                        ; 3D4B _ 48: 0F 46. CA
00003D4F        mov     r15, r9                         ; 3D4F _ 4D: 89. CF
00003D52        sub     r15, rsi                        ; 3D52 _ 49: 29. F7
00003D55        mov     r12, rsi                        ; 3D55 _ 49: 89. F4
00003D58        mov     qword ptr [rsp+30H], r10        ; 3D58 _ 4C: 89. 54 24, 30
00003D5D        mov     r13, r10                        ; 3D5D _ 4D: 89. D5
00003D60        mov     rdx, qword ptr [rbp+40H]        ; 3D60 _ 48: 8B. 55, 40
00003D64        mov     qword ptr [rsp+28H], rdx        ; 3D64 _ 48: 89. 54 24, 28
00003D69        lea     rdx, ptr [rbp-68H]              ; 3D69 _ 48: 8D. 55, 98
00003D6D        mov     qword ptr [rsp+20H], rdx        ; 3D6D _ 48: 89. 54 24, 20
00003D72        sub     r9, rcx                         ; 3D72 _ 49: 29. C9
00003D75        add     r15, r14                        ; 3D75 _ 4D: 01. F7
00003D78        mov     rcx, qword ptr [rbp-0A0H]       ; 3D78 _ 48: 8B. 8D, FFFFFF60
00003D7F        cmp     r15, rcx                        ; 3D7F _ 49: 39. CF
00003D82        cmovbe  r15, rcx                        ; 3D82 _ 4C: 0F 46. F9
00003D86        add     r9, r14                         ; 3D86 _ 4D: 01. F1
00003D89        mov     rsi, r8                         ; 3D89 _ 4C: 89. C6
00003D8C        lea     r8, ptr [rbx+rsi]               ; 3D8C _ 4C: 8D. 04 33
00003D90        mov     rcx, rax                        ; 3D90 _ 48: 89. C1
00003D93        mov     rdx, r11                        ; 3D93 _ 4C: 89. DA
00003D96        mov     qword ptr [rbp-0A8H], r11       ; 3D96 _ 4C: 89. 9D, FFFFFF58
00003D9D        call    qword ptr [rax+10H]             ; 3D9D _ FF. 50, 10
00003DA0        test    rax, rax                        ; 3DA0 _ 48: 85. C0
00003DA3        mov     qword ptr [rbp-0C0H], rax       ; 3DA3 _ 48: 89. 85, FFFFFF40
00003DAA        jns     ?_349                           ; 3DAA _ 79, 58
00003DAC        jmp     ?_358                           ; 3DAC _ E9, 00000158

?_347:
00003DB1        cmp     r11, rax                        ; 3DB1 _ 49: 39. C3
00003DB4        jnc     ?_346                           ; 3DB4 _ 0F 83, FFFFFF74
?_348:
00003DBA        mov     qword ptr [rbp-0A8H], r11       ; 3DBA _ 4C: 89. 9D, FFFFFF58
00003DC1        mov     rcx, r14                        ; 3DC1 _ 4C: 89. F1
00003DC4        sub     rcx, rbx                        ; 3DC4 _ 48: 29. D9
00003DC7        mov     rax, rbx                        ; 3DC7 _ 48: 89. D8
00003DCA        neg     rax                             ; 3DCA _ 48: F7. D8
00003DCD        mov     r15, rax                        ; 3DCD _ 49: 89. C7
00003DD0        sub     r15, rsi                        ; 3DD0 _ 49: 29. F7
00003DD3        add     r15, r14                        ; 3DD3 _ 4D: 01. F7
00003DD6        mov     rdx, qword ptr [rbp-0A0H]       ; 3DD6 _ 48: 8B. 95, FFFFFF60
00003DDD        cmp     r15, rdx                        ; 3DDD _ 49: 39. D7
00003DE0        cmovbe  r15, rdx                        ; 3DE0 _ 4C: 0F 46. FA
00003DE4        sub     rcx, rsi                        ; 3DE4 _ 48: 29. F1
00003DE7        mov     rdx, qword ptr [rbp-98H]        ; 3DE7 _ 48: 8B. 95, FFFFFF68
00003DEE        cmp     rcx, rdx                        ; 3DEE _ 48: 39. D1
00003DF1        cmovbe  rcx, rdx                        ; 3DF1 _ 48: 0F 46. CA
00003DF5        sub     rax, rcx                        ; 3DF5 _ 48: 29. C8
00003DF8        add     rax, r14                        ; 3DF8 _ 4C: 01. F0
00003DFB        mov     rdi, qword ptr [rbp-88H]        ; 3DFB _ 48: 8B. BD, FFFFFF78
00003E02        jmp     ?_350                           ; 3E02 _ EB, 28

?_349:
00003E04        mov     rax, qword ptr [rbp-90H]        ; 3E04 _ 48: 8B. 85, FFFFFF70
00003E0B        mov     rdi, qword ptr [rbp-88H]        ; 3E0B _ 48: 8B. BD, FFFFFF78
00003E12        imul    rax, rdi                        ; 3E12 _ 48: 0F AF. C7
00003E16        add     rax, qword ptr [rbp-0D8H]       ; 3E16 _ 48: 03. 85, FFFFFF28
00003E1D        sub     rax, rbx                        ; 3E1D _ 48: 29. D8
00003E20        sub     rax, r15                        ; 3E20 _ 4C: 29. F8
00003E23        mov     r8, rsi                         ; 3E23 _ 49: 89. F0
00003E26        mov     rsi, r12                        ; 3E26 _ 4C: 89. E6
00003E29        mov     r10, r13                        ; 3E29 _ 4D: 89. EA
?_350:
00003E2C        add     r10, rax                        ; 3E2C _ 49: 01. C2
00003E2F        add     rbx, rsi                        ; 3E2F _ 48: 01. F3
00003E32        add     rbx, r15                        ; 3E32 _ 4C: 01. FB
00003E35        cmp     rsi, rax                        ; 3E35 _ 48: 39. C6
00003E38        jz      ?_353                           ; 3E38 _ 74, 47
00003E3A        mov     rcx, r14                        ; 3E3A _ 4C: 89. F1
00003E3D        sub     rcx, r15                        ; 3E3D _ 4C: 29. F9
00003E40        lea     rsi, ptr [r8+rbx+1H]            ; 3E40 _ 49: 8D. 74 18, 01
00003E45        mov     rax, qword ptr [rbp-0B8H]       ; 3E45 _ 48: 8B. 85, FFFFFF48
00003E4C        mov     eax, dword ptr [rax-4H]         ; 3E4C _ 8B. 40, FC
00003E4F        mov     rbx, rcx                        ; 3E4F _ 48: 89. CB
?_351:
00003E52        mov     rcx, qword ptr [rbp-90H]        ; 3E52 _ 48: 8B. 8D, FFFFFF70
00003E59        add     r14, rcx                        ; 3E59 _ 49: 01. CE
00003E5C        sub     r8, rcx                         ; 3E5C _ 49: 29. C8
00003E5F        inc     rdi                             ; 3E5F _ 48: FF. C7
?_352:
00003E62        mov     rcx, qword ptr [rbp-0C8H]       ; 3E62 _ 48: 8B. 8D, FFFFFF38
00003E69        lea     r11, ptr [rcx+rdi]              ; 3E69 _ 4C: 8D. 1C 39
00003E6D        lea     rdx, ptr [r14+1H]               ; 3E6D _ 49: 8D. 56, 01
00003E71        mov     ecx, eax                        ; 3E71 _ 89. C1
00003E73        cmp     rdi, rcx                        ; 3E73 _ 48: 39. CF
00003E76        jc      ?_344                           ; 3E76 _ 0F 82, FFFFFE16
00003E7C        mov     r14, rbx                        ; 3E7C _ 49: 89. DE
00003E7F        jmp     ?_354                           ; 3E7F _ EB, 16

?_353:
00003E81        sub     r14, r15                        ; 3E81 _ 4D: 29. FE
00003E84        lea     rsi, ptr [r8+rbx+1H]            ; 3E84 _ 49: 8D. 74 18, 01
00003E89        mov     rdx, qword ptr [rbp-0D0H]       ; 3E89 _ 48: 8B. 95, FFFFFF30
00003E90        mov     r11, qword ptr [rbp-0A8H]       ; 3E90 _ 4C: 8B. 9D, FFFFFF58
?_354:
00003E97        cmp     qword ptr [rbp-0C0H], 0         ; 3E97 _ 48: 83. BD, FFFFFF40, 00
00003E9F        js      ?_356                           ; 3E9F _ 78, 1D
00003EA1        add     qword ptr [rbp-0B8H], 8         ; 3EA1 _ 48: 83. 85, FFFFFF48, 08
00003EA9        mov     rbx, r14                        ; 3EA9 _ 4C: 89. F3
00003EAC        mov     qword ptr [rbp-0C8H], r11       ; 3EAC _ 4C: 89. 9D, FFFFFF38
?_355:
00003EB3        test    rsi, rsi                        ; 3EB3 _ 48: 85. F6
00003EB6        jne     ?_343                           ; 3EB6 _ 0F 85, FFFFFD6C
00003EBC        xor     esi, esi                        ; 3EBC _ 31. F6
?_356:
00003EBE        mov     rax, qword ptr [?_889]          ; 3EBE _ 48: 8B. 05, 00006DE3(rel)
00003EC5        mov     rcx, qword ptr [rbp-0E0H]       ; 3EC5 _ 48: 8B. 8D, FFFFFF20
00003ECC        call    qword ptr [rax+48H]             ; 3ECC _ FF. 50, 48
00003ECF        mov     rax, qword ptr [rbp-0E8H]       ; 3ECF _ 48: 8B. 85, FFFFFF18
00003ED6        sub     rax, rsi                        ; 3ED6 _ 48: 29. F0
00003ED9        mov     rcx, qword ptr [rbp-0F0H]       ; 3ED9 _ 48: 8B. 8D, FFFFFF10
00003EE0        mov     qword ptr [rcx], rax            ; 3EE0 _ 48: 89. 01
00003EE3        mov     qword ptr [rbp-0C0H], 0         ; 3EE3 _ 48: C7. 85, FFFFFF40, 00000000
?_357:
00003EEE        mov     rax, qword ptr [rbp-0C0H]       ; 3EEE _ 48: 8B. 85, FFFFFF40
00003EF5        add     rsp, 264                        ; 3EF5 _ 48: 81. C4, 00000108
00003EFC        pop     rbx                             ; 3EFC _ 5B
00003EFD        pop     rdi                             ; 3EFD _ 5F
00003EFE        pop     rsi                             ; 3EFE _ 5E
00003EFF        pop     r12                             ; 3EFF _ 41: 5C
00003F01        pop     r13                             ; 3F01 _ 41: 5D
00003F03        pop     r14                             ; 3F03 _ 41: 5E
00003F05        pop     r15                             ; 3F05 _ 41: 5F
00003F07        pop     rbp                             ; 3F07 _ 5D
00003F08        ret                                     ; 3F08 _ C3

?_358   LABEL NEAR
00003F09        mov     rsi, r12                        ; 3F09 _ 4C: 89. E6
00003F0C        jmp     ?_356                           ; 3F0C _ EB, B0

?_359   LABEL NEAR
00003F0E        push    rbp                             ; 3F0E _ 55
00003F0F        mov     rbp, rsp                        ; 3F0F _ 48: 89. E5
00003F12        push    r15                             ; 3F12 _ 41: 57
00003F14        push    r14                             ; 3F14 _ 41: 56
00003F16        push    r13                             ; 3F16 _ 41: 55
00003F18        push    r12                             ; 3F18 _ 41: 54
00003F1A        push    rsi                             ; 3F1A _ 56
00003F1B        push    rdi                             ; 3F1B _ 57
00003F1C        push    rbx                             ; 3F1C _ 53
00003F1D        sub     rsp, 104                        ; 3F1D _ 48: 83. EC, 68
00003F21        mov     r12, r9                         ; 3F21 _ 4D: 89. CC
00003F24        mov     qword ptr [rbp-70H], r8         ; 3F24 _ 4C: 89. 45, 90
00003F28        mov     rsi, rdx                        ; 3F28 _ 48: 89. D6
00003F2B        mov     r14, rcx                        ; 3F2B _ 49: 89. CE
00003F2E        lea     rdx, ptr [rbp-40H]              ; 3F2E _ 48: 8D. 55, C0
00003F32        mov     rax, qword ptr [rbp+30H]        ; 3F32 _ 48: 8B. 45, 30
00003F36        mov     rcx, rax                        ; 3F36 _ 48: 89. C1
00003F39        call    qword ptr [rax+10H]             ; 3F39 _ FF. 50, 10
00003F3C        test    rax, rax                        ; 3F3C _ 48: 85. C0
00003F3F        js      ?_370                           ; 3F3F _ 0F 88, 0000019E
00003F45        mov     rdi, rax                        ; 3F45 _ 48: 89. C7
00003F48        mov     rax, 2H                         ; 3F48 _ 48: B8, 8000000000000002
00003F52        mov     rdx, qword ptr [rbp-40H]        ; 3F52 _ 48: 8B. 55, C0
00003F56        cmp     rdx, r12                        ; 3F56 _ 4C: 39. E2
00003F59        ja      ?_370                           ; 3F59 _ 0F 87, 00000184
00003F5F        mov     rcx, qword ptr [rdx+20H]        ; 3F5F _ 48: 8B. 4A, 20
00003F63        add     rcx, rdx                        ; 3F63 _ 48: 01. D1
00003F66        mov     rax, 2H                         ; 3F66 _ 48: B8, 8000000000000002
00003F70        cmp     rcx, r12                        ; 3F70 _ 4C: 39. E1
00003F73        jc      ?_370                           ; 3F73 _ 0F 82, 0000016A
00003F79        movzx   ecx, word ptr [rdx+30H]         ; 3F79 _ 0F B7. 4A, 30
00003F7D        call    ?_010                           ; 3F7D _ E8, FFFFC412
00003F82        mov     rcx, rax                        ; 3F82 _ 48: 89. C1
00003F85        mov     rax, 9H                         ; 3F85 _ 48: B8, 8000000000000009
00003F8F        test    rcx, rcx                        ; 3F8F _ 48: 85. C9
00003F92        je      ?_370                           ; 3F92 _ 0F 84, 0000014B
00003F98        lea     rax, ptr [rcx+3CH]              ; 3F98 _ 48: 8D. 41, 3C
00003F9C        mov     qword ptr [rbp-60H], rcx        ; 3F9C _ 48: 89. 4D, A0
00003FA0        mov     qword ptr [rbp-50H], rax        ; 3FA0 _ 48: 89. 45, B0
00003FA4        mov     r9, rsi                         ; 3FA4 _ 49: 89. F1
00003FA7        mov     qword ptr [rbp-68H], rsi        ; 3FA7 _ 48: 89. 75, 98
00003FAB        mov     qword ptr [rbp-58H], 0          ; 3FAB _ 48: C7. 45, A8, 00000000
00003FB3        mov     r8, rdi                         ; 3FB3 _ 49: 89. F8
00003FB6        mov     rdx, r14                        ; 3FB6 _ 4C: 89. F2
00003FB9        jmp     ?_367                           ; 3FB9 _ E9, 000000E0

?_360:
00003FBE        mov     r9, rcx                         ; 3FBE _ 49: 89. C9
00003FC1        mov     r10, rbx                        ; 3FC1 _ 49: 89. DA
00003FC4        jmp     ?_366                           ; 3FC4 _ E9, 000000CC

?_361:
00003FC9        mov     rax, qword ptr [rbp-50H]        ; 3FC9 _ 48: 8B. 45, B0
00003FCD        mov     eax, dword ptr [rax-4H]         ; 3FCD _ 8B. 40, FC
00003FD0        test    eax, eax                        ; 3FD0 _ 85. C0
00003FD2        je      ?_368                           ; 3FD2 _ 0F 84, 000000D4
00003FD8        mov     rcx, qword ptr [rbp-50H]        ; 3FD8 _ 48: 8B. 4D, B0
00003FDC        mov     ecx, dword ptr [rcx]            ; 3FDC _ 8B. 09
00003FDE        mov     qword ptr [rbp-48H], rcx        ; 3FDE _ 48: 89. 4D, B8
00003FE2        test    rcx, rcx                        ; 3FE2 _ 48: 85. C9
00003FE5        je      ?_368                           ; 3FE5 _ 0F 84, 000000C1
00003FEB        xor     esi, esi                        ; 3FEB _ 31. F6
00003FED        jmp     ?_364                           ; 3FED _ EB, 2B

?_362:
00003FEF        mov     rdx, r12                        ; 3FEF _ 4C: 89. E2
00003FF2        add     rdx, r15                        ; 3FF2 _ 4C: 01. FA
00003FF5        mov     rcx, rsi                        ; 3FF5 _ 48: 89. F1
00003FF8        sub     rcx, r15                        ; 3FF8 _ 4C: 29. F9
00003FFB        mov     r12, r14                        ; 3FFB _ 4D: 89. F4
00003FFE        add     r12, r15                        ; 3FFE _ 4D: 01. FC
00004001        cmp     rsi, r15                        ; 4001 _ 4C: 39. FE
00004004        mov     rsi, r13                        ; 4004 _ 4C: 89. EE
00004007        jz      ?_360                           ; 4007 _ 74, B5
00004009        mov     rax, qword ptr [rbp-50H]        ; 4009 _ 48: 8B. 45, B0
0000400D        mov     eax, dword ptr [rax-4H]         ; 400D _ 8B. 40, FC
00004010        mov     r9, rcx                         ; 4010 _ 49: 89. C9
?_363:
00004013        mov     qword ptr [rbp-40H], rdi        ; 4013 _ 48: 89. 7D, C0
00004017        inc     rsi                             ; 4017 _ 48: FF. C6
?_364:
0000401A        mov     rcx, qword ptr [rbp-58H]        ; 401A _ 48: 8B. 4D, A8
0000401E        lea     r10, ptr [rcx+rsi]              ; 401E _ 4C: 8D. 14 31
00004022        mov     ecx, eax                        ; 4022 _ 89. C1
00004024        cmp     rsi, rcx                        ; 4024 _ 48: 39. CE
00004027        jnc     ?_365                           ; 4027 _ 73, 67
00004029        mov     rcx, qword ptr [rbp-40H]        ; 4029 _ 48: 8B. 4D, C0
0000402D        mov     rdi, qword ptr [rbp-48H]        ; 402D _ 48: 8B. 7D, B8
00004031        lea     rdi, ptr [rcx+rdi]              ; 4031 _ 48: 8D. 3C 39
00004035        cmp     r12, rcx                        ; 4035 _ 49: 39. CC
00004038        jc      ?_363                           ; 4038 _ 72, D9
0000403A        cmp     r12, rdi                        ; 403A _ 49: 39. FC
0000403D        jnc     ?_363                           ; 403D _ 73, D4
0000403F        mov     r13, rsi                        ; 403F _ 49: 89. F5
00004042        mov     rsi, qword ptr [rbp-48H]        ; 4042 _ 48: 8B. 75, B8
00004046        mov     qword ptr [rsp+20H], rsi        ; 4046 _ 48: 89. 74 24, 20
0000404B        mov     r8, r12                         ; 404B _ 4D: 89. E0
0000404E        mov     r14, r12                        ; 404E _ 4D: 89. E6
00004051        sub     r8, rcx                         ; 4051 _ 49: 29. C8
00004054        mov     qword ptr [rsp+28H], rdx        ; 4054 _ 48: 89. 54 24, 28
00004059        mov     r12, rdx                        ; 4059 _ 49: 89. D4
0000405C        mov     r15, rsi                        ; 405C _ 49: 89. F7
0000405F        sub     r15, r8                         ; 405F _ 4D: 29. C7
00004062        lea     rax, ptr [r8+r9]                ; 4062 _ 4B: 8D. 04 08
00004066        cmp     rax, rsi                        ; 4066 _ 48: 39. F0
00004069        cmovbe  r15, r9                         ; 4069 _ 4D: 0F 46. F9
0000406D        mov     rsi, r9                         ; 406D _ 4C: 89. CE
00004070        mov     rcx, qword ptr [rbp+30H]        ; 4070 _ 48: 8B. 4D, 30
00004074        mov     rdx, r10                        ; 4074 _ 4C: 89. D2
00004077        mov     rbx, r10                        ; 4077 _ 4C: 89. D3
0000407A        mov     r9, r15                         ; 407A _ 4D: 89. F9
0000407D        call    ?_293                           ; 407D _ E8, FFFFF019
00004082        mov     r8, rax                         ; 4082 _ 49: 89. C0
00004085        test    r8, r8                          ; 4085 _ 4D: 85. C0
00004088        jns     ?_362                           ; 4088 _ 0F 89, FFFFFF61
0000408E        jmp     ?_369                           ; 408E _ EB, 3F

?_365:
00004090        test    r8, r8                          ; 4090 _ 4D: 85. C0
00004093        js      ?_368                           ; 4093 _ 78, 17
?_366:
00004095        add     qword ptr [rbp-50H], 8          ; 4095 _ 48: 83. 45, B0, 08
0000409A        mov     qword ptr [rbp-58H], r10        ; 409A _ 4C: 89. 55, A8
?_367:
0000409E        test    r9, r9                          ; 409E _ 4D: 85. C9
000040A1        jne     ?_361                           ; 40A1 _ 0F 85, FFFFFF22
000040A7        xor     eax, eax                        ; 40A7 _ 31. C0
000040A9        mov     r9, rax                         ; 40A9 _ 49: 89. C1
?_368:
000040AC        mov     rax, qword ptr [?_889]          ; 40AC _ 48: 8B. 05, 00006BF5(rel)
000040B3        mov     rcx, qword ptr [rbp-60H]        ; 40B3 _ 48: 8B. 4D, A0
000040B7        mov     rsi, r9                         ; 40B7 _ 4C: 89. CE
000040BA        call    qword ptr [rax+48H]             ; 40BA _ FF. 50, 48
000040BD        mov     rax, qword ptr [rbp-68H]        ; 40BD _ 48: 8B. 45, 98
000040C1        sub     rax, rsi                        ; 40C1 _ 48: 29. F0
000040C4        mov     rcx, qword ptr [rbp-70H]        ; 40C4 _ 48: 8B. 4D, 90
000040C8        mov     qword ptr [rcx], rax            ; 40C8 _ 48: 89. 01
000040CB        xor     eax, eax                        ; 40CB _ 31. C0
000040CD        jmp     ?_370                           ; 40CD _ EB, 14

?_369:
000040CF        mov     rax, qword ptr [?_889]          ; 40CF _ 48: 8B. 05, 00006BD2(rel)
000040D6        mov     rcx, qword ptr [rbp-60H]        ; 40D6 _ 48: 8B. 4D, A0
000040DA        mov     rsi, r8                         ; 40DA _ 4C: 89. C6
000040DD        call    qword ptr [rax+48H]             ; 40DD _ FF. 50, 48
000040E0        mov     rax, rsi                        ; 40E0 _ 48: 89. F0
?_370:
000040E3        add     rsp, 104                        ; 40E3 _ 48: 83. C4, 68
000040E7        pop     rbx                             ; 40E7 _ 5B
000040E8        pop     rdi                             ; 40E8 _ 5F
000040E9        pop     rsi                             ; 40E9 _ 5E
000040EA        pop     r12                             ; 40EA _ 41: 5C
000040EC        pop     r13                             ; 40EC _ 41: 5D
000040EE        pop     r14                             ; 40EE _ 41: 5E
000040F0        pop     r15                             ; 40F0 _ 41: 5F
000040F2        pop     rbp                             ; 40F2 _ 5D
000040F3        ret                                     ; 40F3 _ C3

?_371   LABEL NEAR
000040F4        cmp     rdx, 1                          ; 40F4 _ 48: 83. FA, 01
000040F8        jz      ?_373                           ; 40F8 _ 74, 27
000040FA        mov     rax, rdx                        ; 40FA _ 48: 89. D0
000040FD        shr     rax, 1                          ; 40FD _ 48: D1. E8
00004100        test    rax, rax                        ; 4100 _ 48: 85. C0
00004103        jz      ?_373                           ; 4103 _ 74, 1C
00004105        lea     rdx, ptr [rdx+rcx-1H]           ; 4105 _ 48: 8D. 54 0A, FF
?_372:
0000410A        mov     r8b, byte ptr [rcx]             ; 410A _ 44: 8A. 01
0000410D        mov     r9b, byte ptr [rdx]             ; 410D _ 44: 8A. 0A
00004110        mov     byte ptr [rcx], r9b             ; 4110 _ 44: 88. 09
00004113        mov     byte ptr [rdx], r8b             ; 4113 _ 44: 88. 02
00004116        inc     rcx                             ; 4116 _ 48: FF. C1
00004119        dec     rdx                             ; 4119 _ 48: FF. CA
0000411C        dec     rax                             ; 411C _ 48: FF. C8
0000411F        jnz     ?_372                           ; 411F _ 75, E9
?_373:
00004121        ret                                     ; 4121 _ C3

?_374   LABEL NEAR
00004122        push    rbp                             ; 4122 _ 55
00004123        mov     rbp, rsp                        ; 4123 _ 48: 89. E5
00004126        push    rbx                             ; 4126 _ 53
00004127        sub     rsp, 40                         ; 4127 _ 48: 83. EC, 28
0000412B        mov     byte ptr [rbp-9H], 0            ; 412B _ C6. 45, F7, 00
0000412F        mov     byte ptr [rbp-0AH], 0           ; 412F _ C6. 45, F6, 00
00004133        lea     r8, ptr [rbp-9H]                ; 4133 _ 4C: 8D. 45, F7
00004137        mov     ecx, 1112438125                 ; 4137 _ B9, 424E756D
0000413C        mov     edx, 1                          ; 413C _ BA, 00000001
00004141        call    ?_380                           ; 4141 _ E8, 0000009A
00004146        test    rax, rax                        ; 4146 _ 48: 85. C0
00004149        jnz     ?_377                           ; 4149 _ 75, 75
0000414B        mov     cl, byte ptr [rbp-9H]           ; 414B _ 8A. 4D, F7
0000414E        test    cl, cl                          ; 414E _ 84. C9
00004150        jz      ?_377                           ; 4150 _ 74, 6E
00004152        lea     r8, ptr [rbp-0AH]               ; 4152 _ 4C: 8D. 45, F6
00004156        mov     ecx, 1112754542                 ; 4156 _ B9, 4253496E
0000415B        mov     edx, 1                          ; 415B _ BA, 00000001
00004160        call    ?_380                           ; 4160 _ E8, 0000007B
00004165        test    rax, rax                        ; 4165 _ 48: 85. C0
00004168        jz      ?_376                           ; 4168 _ 74, 04
?_375:
0000416A        xor     bl, bl                          ; 416A _ 30. DB
0000416C        jmp     ?_378                           ; 416C _ EB, 59

?_376:
0000416E        mov     bl, 1                           ; 416E _ B3, 01
00004170        test    byte ptr [rbp-0AH], 2H          ; 4170 _ F6. 45, F6, 02
00004174        jnz     ?_379                           ; 4174 _ 75, 60
00004176        lea     r8, ptr [rbp-0CH]               ; 4176 _ 4C: 8D. 45, F4
0000417A        mov     ecx, 1110459971                 ; 417A _ B9, 42304643
0000417F        mov     edx, 2                          ; 417F _ BA, 00000002
00004184        call    ?_380                           ; 4184 _ E8, 00000057
00004189        test    rax, rax                        ; 4189 _ 48: 85. C0
0000418C        jnz     ?_375                           ; 418C _ 75, DC
0000418E        lea     r8, ptr [rbp-0EH]               ; 418E _ 4C: 8D. 45, F2
00004192        mov     ecx, 1110463053                 ; 4192 _ B9, 4230524D
00004197        mov     edx, 2                          ; 4197 _ BA, 00000002
0000419C        call    ?_380                           ; 419C _ E8, 0000003F
000041A1        test    rax, rax                        ; 41A1 _ 48: 85. C0
000041A4        jnz     ?_375                           ; 41A4 _ 75, C4
000041A6        movzx   eax, word ptr [rbp-0EH]         ; 41A6 _ 0F B7. 45, F2
000041AA        imul    eax, eax, 100                   ; 41AA _ 6B. C0, 64
000041AD        movzx   ecx, word ptr [rbp-0CH]         ; 41AD _ 0F B7. 4D, F4
000041B1        xor     edx, edx                        ; 41B1 _ 31. D2
000041B3        div     ecx                             ; 41B3 _ F7. F1
000041B5        movzx   eax, al                         ; 41B5 _ 0F B6. C0
000041B8        cmp     eax, 4                          ; 41B8 _ 83. F8, 04
000041BB        seta    bl                              ; 41BB _ 0F 97. C3
000041BE        jmp     ?_379                           ; 41BE _ EB, 16

?_377:
000041C0        mov     bl, 1                           ; 41C0 _ B3, 01
000041C2        test    rax, rax                        ; 41C2 _ 48: 85. C0
000041C5        jz      ?_379                           ; 41C5 _ 74, 0F
?_378:
000041C7        lea     rcx, ptr [?_776]                ; 41C7 _ 48: 8D. 0D, 00003DC6(rel)
000041CE        mov     rdx, rax                        ; 41CE _ 48: 89. C2
000041D1        call    ?_121                           ; 41D1 _ E8, FFFFCBFF
?_379:
000041D6        movzx   eax, bl                         ; 41D6 _ 0F B6. C3
000041D9        add     rsp, 40                         ; 41D9 _ 48: 83. C4, 28
000041DD        pop     rbx                             ; 41DD _ 5B
000041DE        pop     rbp                             ; 41DE _ 5D
000041DF        ret                                     ; 41DF _ C3

?_380   LABEL NEAR
000041E0        push    rbp                             ; 41E0 _ 55
000041E1        mov     rbp, rsp                        ; 41E1 _ 48: 89. E5
000041E4        push    rsi                             ; 41E4 _ 56
000041E5        push    rdi                             ; 41E5 _ 57
000041E6        push    rbx                             ; 41E6 _ 53
000041E7        sub     rsp, 40                         ; 41E7 _ 48: 83. EC, 28
000041EB        mov     rsi, r8                         ; 41EB _ 4C: 89. C6
000041EE        mov     ebx, edx                        ; 41EE _ 89. D3
000041F0        mov     edi, ecx                        ; 41F0 _ 89. CF
000041F2        mov     rax, qword ptr [?_872]          ; 41F2 _ 48: 8B. 05, 00006A3F(rel)
000041F9        test    rax, rax                        ; 41F9 _ 48: 85. C0
000041FC        jnz     ?_381                           ; 41FC _ 75, 29
000041FE        mov     rax, qword ptr [?_889]          ; 41FE _ 48: 8B. 05, 00006AA3(rel)
00004205        lea     rcx, ptr [?_833]                ; 4205 _ 48: 8D. 0D, 000062B0(rel)
0000420C        lea     r8, ptr [?_872]                 ; 420C _ 4C: 8D. 05, 00006A25(rel)
00004213        xor     edx, edx                        ; 4213 _ 31. D2
00004215        call    qword ptr [rax+140H]            ; 4215 _ FF. 90, 00000140
0000421B        test    rax, rax                        ; 421B _ 48: 85. C0
0000421E        jnz     ?_382                           ; 421E _ 75, 29
00004220        mov     rax, qword ptr [?_872]          ; 4220 _ 48: 8B. 05, 00006A11(rel)
?_381:
00004227        movzx   ebx, bl                         ; 4227 _ 0F B6. DB
0000422A        mov     rcx, rax                        ; 422A _ 48: 89. C1
0000422D        mov     edx, edi                        ; 422D _ 89. FA
0000422F        mov     r8d, ebx                        ; 422F _ 41: 89. D8
00004232        mov     r9, rsi                         ; 4232 _ 49: 89. F1
00004235        call    qword ptr [rax+8H]              ; 4235 _ FF. 50, 08
00004238        mov     rdi, rax                        ; 4238 _ 48: 89. C7
0000423B        movzx   edx, bl                         ; 423B _ 0F B6. D3
0000423E        mov     rcx, rsi                        ; 423E _ 48: 89. F1
00004241        call    ?_371                           ; 4241 _ E8, FFFFFEAE
00004246        mov     rax, rdi                        ; 4246 _ 48: 89. F8
?_382:
00004249        add     rsp, 40                         ; 4249 _ 48: 83. C4, 28
0000424D        pop     rbx                             ; 424D _ 5B
0000424E        pop     rdi                             ; 424E _ 5F
0000424F        pop     rsi                             ; 424F _ 5E
00004250        pop     rbp                             ; 4250 _ 5D
00004251        ret                                     ; 4251 _ C3

?_383   LABEL NEAR
00004252        push    rbp                             ; 4252 _ 55
00004253        mov     rbp, rsp                        ; 4253 _ 48: 89. E5
00004256        push    rsi                             ; 4256 _ 56
00004257        sub     rsp, 56                         ; 4257 _ 48: 83. EC, 38
0000425B        test    cl, cl                          ; 425B _ 84. C9
0000425D        setne   byte ptr [rbp-9H]               ; 425D _ 0F 95. 45, F7
00004261        mov     rax, qword ptr [?_889]          ; 4261 _ 48: 8B. 05, 00006A40(rel)
00004268        lea     rcx, ptr [?_832]                ; 4268 _ 48: 8D. 0D, 0000623D(rel)
0000426F        lea     r8, ptr [rbp-18H]               ; 426F _ 4C: 8D. 45, E8
00004273        xor     edx, edx                        ; 4273 _ 31. D2
00004275        call    qword ptr [rax+140H]            ; 4275 _ FF. 90, 00000140
0000427B        test    rax, rax                        ; 427B _ 48: 85. C0
0000427E        js      ?_384                           ; 427E _ 78, 36
00004280        mov     rax, qword ptr [rbp-18H]        ; 4280 _ 48: 8B. 45, E8
00004284        lea     rsi, ptr [rbp-9H]               ; 4284 _ 48: 8D. 75, F7
00004288        mov     rcx, rax                        ; 4288 _ 48: 89. C1
0000428B        mov     rdx, rsi                        ; 428B _ 48: 89. F2
0000428E        mov     r8d, 1                          ; 428E _ 41: B8, 00000001
00004294        mov     r9d, 172                        ; 4294 _ 41: B9, 000000AC
0000429A        call    qword ptr [rax+10H]             ; 429A _ FF. 50, 10
0000429D        mov     rax, qword ptr [rbp-18H]        ; 429D _ 48: 8B. 45, E8
000042A1        mov     rcx, rax                        ; 42A1 _ 48: 89. C1
000042A4        mov     rdx, rsi                        ; 42A4 _ 48: 89. F2
000042A7        mov     r8d, 1                          ; 42A7 _ 41: B8, 00000001
000042AD        mov     r9d, 172                        ; 42AD _ 41: B9, 000000AC
000042B3        call    qword ptr [rax+8H]              ; 42B3 _ FF. 50, 08
?_384:
000042B6        add     rsp, 56                         ; 42B6 _ 48: 83. C4, 38
000042BA        pop     rsi                             ; 42BA _ 5E
000042BB        pop     rbp                             ; 42BB _ 5D
000042BC        ret                                     ; 42BC _ C3

?_385   LABEL NEAR
000042BD        push    rbp                             ; 42BD _ 55
000042BE        mov     rbp, rsp                        ; 42BE _ 48: 89. E5
000042C1        sub     rsp, 48                         ; 42C1 _ 48: 83. EC, 30
000042C5        mov     byte ptr [rbp-1H], 0            ; 42C5 _ C6. 45, FF, 00
000042C9        mov     rax, qword ptr [?_889]          ; 42C9 _ 48: 8B. 05, 000069D8(rel)
000042D0        lea     rcx, ptr [?_832]                ; 42D0 _ 48: 8D. 0D, 000061D5(rel)
000042D7        lea     r8, ptr [rbp-10H]               ; 42D7 _ 4C: 8D. 45, F0
000042DB        xor     edx, edx                        ; 42DB _ 31. D2
000042DD        call    qword ptr [rax+140H]            ; 42DD _ FF. 90, 00000140
000042E3        test    rax, rax                        ; 42E3 _ 48: 85. C0
000042E6        js      ?_386                           ; 42E6 _ 78, 1A
000042E8        mov     rax, qword ptr [rbp-10H]        ; 42E8 _ 48: 8B. 45, F0
000042EC        lea     rdx, ptr [rbp-1H]               ; 42EC _ 48: 8D. 55, FF
000042F0        mov     rcx, rax                        ; 42F0 _ 48: 89. C1
000042F3        mov     r8d, 1                          ; 42F3 _ 41: B8, 00000001
000042F9        mov     r9d, 92                         ; 42F9 _ 41: B9, 0000005C
000042FF        call    qword ptr [rax+10H]             ; 42FF _ FF. 50, 10
?_386:
00004302        add     rsp, 48                         ; 4302 _ 48: 83. C4, 30
00004306        pop     rbp                             ; 4306 _ 5D
00004307        ret                                     ; 4307 _ C3

?_387   LABEL NEAR
00004308        push    rbp                             ; 4308 _ 55
00004309        mov     rbp, rsp                        ; 4309 _ 48: 89. E5
0000430C        push    rsi                             ; 430C _ 56
0000430D        sub     rsp, 56                         ; 430D _ 48: 83. EC, 38
00004311        mov     byte ptr [rbp-11H], 0           ; 4311 _ C6. 45, EF, 00
00004315        mov     rax, qword ptr [?_889]          ; 4315 _ 48: 8B. 05, 0000698C(rel)
0000431C        lea     rcx, ptr [?_821]                ; 431C _ 48: 8D. 0D, 000060D9(rel)
00004323        lea     r8, ptr [rbp-10H]               ; 4323 _ 4C: 8D. 45, F0
00004327        xor     edx, edx                        ; 4327 _ 31. D2
00004329        call    qword ptr [rax+140H]            ; 4329 _ FF. 90, 00000140
0000432F        test    rax, rax                        ; 432F _ 48: 85. C0
00004332        js      ?_388                           ; 4332 _ 78, 46
00004334        mov     byte ptr [rbp-11H], 0           ; 4334 _ C6. 45, EF, 00
00004338        mov     rax, qword ptr [rbp-10H]        ; 4338 _ 48: 8B. 45, F0
0000433C        lea     rsi, ptr [rbp-11H]              ; 433C _ 48: 8D. 75, EF
00004340        mov     qword ptr [rsp+20H], rsi        ; 4340 _ 48: 89. 74 24, 20
00004345        mov     rcx, rax                        ; 4345 _ 48: 89. C1
00004348        xor     edx, edx                        ; 4348 _ 31. D2
0000434A        mov     r8d, 116                        ; 434A _ 41: B8, 00000074
00004350        mov     r9d, 1                          ; 4350 _ 41: B9, 00000001
00004356        call    qword ptr [rax+18H]             ; 4356 _ FF. 50, 18
00004359        mov     byte ptr [rbp-11H], 0           ; 4359 _ C6. 45, EF, 00
0000435D        mov     rax, qword ptr [rbp-10H]        ; 435D _ 48: 8B. 45, F0
00004361        mov     qword ptr [rsp+20H], rsi        ; 4361 _ 48: 89. 74 24, 20
00004366        mov     rcx, rax                        ; 4366 _ 48: 89. C1
00004369        xor     edx, edx                        ; 4369 _ 31. D2
0000436B        mov     r8d, 117                        ; 436B _ 41: B8, 00000075
00004371        mov     r9d, 1                          ; 4371 _ 41: B9, 00000001
00004377        call    qword ptr [rax+18H]             ; 4377 _ FF. 50, 18
?_388:
0000437A        add     rsp, 56                         ; 437A _ 48: 83. C4, 38
0000437E        pop     rsi                             ; 437E _ 5E
0000437F        pop     rbp                             ; 437F _ 5D
00004380        ret                                     ; 4380 _ C3

?_389   LABEL NEAR
00004381        push    rbp                             ; 4381 _ 55
00004382        mov     rbp, rsp                        ; 4382 _ 48: 89. E5
00004385        sub     rsp, 48                         ; 4385 _ 48: 83. EC, 30
00004389        mov     rax, qword ptr [?_890]          ; 4389 _ 48: 8B. 05, 00006920(rel)
00004390        mov     qword ptr [rsp+20H], 0          ; 4390 _ 48: C7. 44 24, 20, 00000000
00004399        lea     rcx, ptr [?_814]                ; 4399 _ 48: 8D. 0D, 00005FE0(rel)
000043A0        lea     rdx, ptr [?_829]                ; 43A0 _ 48: 8D. 15, 000060D5(rel)
000043A7        mov     r8d, 7                          ; 43A7 _ 41: B8, 00000007
000043AD        xor     r9d, r9d                        ; 43AD _ 45: 31. C9
000043B0        call    qword ptr [rax+58H]             ; 43B0 _ FF. 50, 58
000043B3        add     rsp, 48                         ; 43B3 _ 48: 83. C4, 30
000043B7        pop     rbp                             ; 43B7 _ 5D
000043B8        ret                                     ; 43B8 _ C3

?_390   LABEL NEAR
000043B9        push    rbp                             ; 43B9 _ 55
000043BA        mov     rbp, rsp                        ; 43BA _ 48: 89. E5
000043BD        sub     rsp, 32                         ; 43BD _ 48: 83. EC, 20
000043C1        mov     qword ptr [?_868], rcx          ; 43C1 _ 48: 89. 0D, 00006850(rel)
000043C8        mov     rax, qword ptr [?_889]          ; 43C8 _ 48: 8B. 05, 000068D9(rel)
000043CF        lea     rcx, ptr [?_831]                ; 43CF _ 48: 8D. 0D, 000060C6(rel)
000043D6        lea     r8, ptr [?_869]                 ; 43D6 _ 4C: 8D. 05, 00006843(rel)
000043DD        xor     edx, edx                        ; 43DD _ 31. D2
000043DF        call    qword ptr [rax+140H]            ; 43DF _ FF. 90, 00000140
000043E5        xor     ecx, ecx                        ; 43E5 _ 31. C9
000043E7        call    ?_562                           ; 43E7 _ E8, 00001999
000043EC        xor     eax, eax                        ; 43EC _ 31. C0
000043EE        add     rsp, 32                         ; 43EE _ 48: 83. C4, 20
000043F2        pop     rbp                             ; 43F2 _ 5D
000043F3        ret                                     ; 43F3 _ C3

?_391   LABEL NEAR
000043F4        push    rbp                             ; 43F4 _ 55
000043F5        mov     rbp, rsp                        ; 43F5 _ 48: 89. E5
000043F8        push    rsi                             ; 43F8 _ 56
000043F9        push    rdi                             ; 43F9 _ 57
000043FA        sub     rsp, 32                         ; 43FA _ 48: 83. EC, 20
000043FE        mov     rsi, rdx                        ; 43FE _ 48: 89. D6
00004401        mov     rdi, rcx                        ; 4401 _ 48: 89. CF
00004404        lea     rcx, ptr [?_777]                ; 4404 _ 48: 8D. 0D, 00003BD9(rel)
0000440B        call    ?_121                           ; 440B _ E8, FFFFC9C5
00004410        lea     rcx, ptr [?_778]                ; 4410 _ 48: 8D. 0D, 00003C21(rel)
00004417        mov     rdx, rdi                        ; 4417 _ 48: 89. FA
0000441A        call    ?_121                           ; 441A _ E8, FFFFC9B6
0000441F        lea     rcx, ptr [?_779]                ; 441F _ 48: 8D. 0D, 00003C2C(rel)
00004426        mov     rdx, rsi                        ; 4426 _ 48: 89. F2
00004429        call    ?_121                           ; 4429 _ E8, FFFFC9A7
0000442E        lea     rcx, ptr [?_769]                ; 442E _ 48: 8D. 0D, 00003AC3(rel)
00004435        call    ?_121                           ; 4435 _ E8, FFFFC99B
0000443A        xor     eax, eax                        ; 443A _ 31. C0
0000443C        add     rsp, 32                         ; 443C _ 48: 83. C4, 20
00004440        pop     rdi                             ; 4440 _ 5F
00004441        pop     rsi                             ; 4441 _ 5E
00004442        pop     rbp                             ; 4442 _ 5D
00004443        ret                                     ; 4443 _ C3

?_392   LABEL NEAR
00004444        push    rbp                             ; 4444 _ 55
00004445        mov     rbp, rsp                        ; 4445 _ 48: 89. E5
00004448        push    rsi                             ; 4448 _ 56
00004449        push    rdi                             ; 4449 _ 57
0000444A        push    rbx                             ; 444A _ 53
0000444B        sub     rsp, 40                         ; 444B _ 48: 83. EC, 28
0000444F        mov     rdi, rdx                        ; 444F _ 48: 89. D7
00004452        mov     rsi, rcx                        ; 4452 _ 48: 89. CE
00004455        mov     rbx, 6H                         ; 4455 _ 48: BB, 8000000000000006
0000445F        mov     rcx, qword ptr [?_868]          ; 445F _ 48: 8B. 0D, 000067B2(rel)
00004466        test    rcx, rcx                        ; 4466 _ 48: 85. C9
00004469        je      ?_394                           ; 4469 _ 0F 84, 0000008E
0000446F        mov     rax, qword ptr [?_869]          ; 446F _ 48: 8B. 05, 000067AA(rel)
00004476        test    rax, rax                        ; 4476 _ 48: 85. C0
00004479        jz      ?_393                           ; 4479 _ 74, 37
0000447B        mov     ecx, 4                          ; 447B _ B9, 00000004
00004480        xor     edx, edx                        ; 4480 _ 31. D2
00004482        call    qword ptr [rax+8H]              ; 4482 _ FF. 50, 08
00004485        mov     rax, qword ptr [?_889]          ; 4485 _ 48: 8B. 05, 0000681C(rel)
0000448C        mov     ecx, 3000000                    ; 448C _ B9, 002DC6C0
00004491        call    qword ptr [rax+0F8H]            ; 4491 _ FF. 90, 000000F8
00004497        mov     rax, qword ptr [?_869]          ; 4497 _ 48: 8B. 05, 00006782(rel)
0000449E        mov     ecx, 4                          ; 449E _ B9, 00000004
000044A3        mov     edx, 2                          ; 44A3 _ BA, 00000002
000044A8        call    qword ptr [rax+8H]              ; 44A8 _ FF. 50, 08
000044AB        mov     rcx, qword ptr [?_868]          ; 44AB _ 48: 8B. 0D, 00006766(rel)
?_393:
000044B2        add     rdi, qword ptr [?_870]          ; 44B2 _ 48: 03. 3D, 0000676F(rel)
000044B9        mov     qword ptr [?_870], rdi          ; 44B9 _ 48: 89. 3D, 00006768(rel)
000044C0        imul    rax, rdi, 100                   ; 44C0 _ 48: 6B. C7, 64
000044C4        xor     ebx, ebx                        ; 44C4 _ 31. DB
000044C6        xor     edx, edx                        ; 44C6 _ 31. D2
000044C8        div     rcx                             ; 44C8 _ 48: F7. F1
000044CB        imul    rcx, rax, 1000                  ; 44CB _ 48: 69. C8, 000003E8
000044D2        call    ?_562                           ; 44D2 _ E8, 000018AE
000044D7        lea     rcx, ptr [?_780]                ; 44D7 _ 48: 8D. 0D, 00003B8A(rel)
000044DE        call    ?_121                           ; 44DE _ E8, FFFFC8F2
000044E3        lea     rcx, ptr [?_781]                ; 44E3 _ 48: 8D. 0D, 00003BA4(rel)
000044EA        mov     edx, esi                        ; 44EA _ 89. F2
000044EC        call    ?_121                           ; 44EC _ E8, FFFFC8E4
000044F1        lea     rcx, ptr [?_782]                ; 44F1 _ 48: 8D. 0D, 00003BA6(rel)
000044F8        call    ?_121                           ; 44F8 _ E8, FFFFC8D8
?_394:
000044FD        mov     rax, rbx                        ; 44FD _ 48: 89. D8
00004500        add     rsp, 40                         ; 4500 _ 48: 83. C4, 28
00004504        pop     rbx                             ; 4504 _ 5B
00004505        pop     rdi                             ; 4505 _ 5F
00004506        pop     rsi                             ; 4506 _ 5E
00004507        pop     rbp                             ; 4507 _ 5D
00004508        ret                                     ; 4508 _ C3

?_395   LABEL NEAR
00004509        push    rbp                             ; 4509 _ 55
0000450A        mov     rbp, rsp                        ; 450A _ 48: 89. E5
0000450D        push    r15                             ; 450D _ 41: 57
0000450F        push    r14                             ; 450F _ 41: 56
00004511        push    r13                             ; 4511 _ 41: 55
00004513        push    r12                             ; 4513 _ 41: 54
00004515        push    rsi                             ; 4515 _ 56
00004516        push    rdi                             ; 4516 _ 57
00004517        push    rbx                             ; 4517 _ 53
00004518        sub     rsp, 40                         ; 4518 _ 48: 83. EC, 28
0000451C        mov     r14, r9                         ; 451C _ 4D: 89. CE
0000451F        mov     r15, r8                         ; 451F _ 4D: 89. C7
00004522        mov     r12, rdx                        ; 4522 _ 49: 89. D4
00004525        mov     rsi, rcx                        ; 4525 _ 48: 89. CE
00004528        lea     r13, ptr [r12+rsi]              ; 4528 _ 4D: 8D. 2C 34
0000452C        mov     rbx, qword ptr [rbp+30H]        ; 452C _ 48: 8B. 5D, 30
00004530        add     rbx, 80                         ; 4530 _ 48: 83. C3, 50
00004534        mov     rdi, -1                         ; 4534 _ 48: C7. C7, FFFFFFFF
0000453B        jmp     ?_397                           ; 453B _ EB, 4B

?_396:
0000453D        mov     rcx, qword ptr [rbx-8H]         ; 453D _ 48: 8B. 4B, F8
00004541        lea     rbx, ptr [rbx+10H]              ; 4541 _ 48: 8D. 5B, 10
00004545        add     rax, rcx                        ; 4545 _ 48: 01. C8
00004548        cmp     r13, rcx                        ; 4548 _ 49: 39. CD
0000454B        jc      ?_397                           ; 454B _ 72, 3B
0000454D        cmp     rax, rsi                        ; 454D _ 48: 39. F0
00004550        jc      ?_397                           ; 4550 _ 72, 36
00004552        mov     rdx, rcx                        ; 4552 _ 48: 89. CA
00004555        sub     rdx, rsi                        ; 4555 _ 48: 29. F2
00004558        cmp     rcx, rsi                        ; 4558 _ 48: 39. F1
0000455B        mov     ecx, 0                          ; 455B _ B9, 00000000
00004560        cmovc   rdx, rcx                        ; 4560 _ 48: 0F 42. D1
00004564        mov     r8, rax                         ; 4564 _ 49: 89. C0
00004567        sub     r8, rsi                         ; 4567 _ 49: 29. F0
0000456A        cmp     rax, r13                        ; 456A _ 4C: 39. E8
0000456D        cmovnc  r8, r12                         ; 456D _ 4D: 0F 43. C4
00004571        sub     r8, rdx                         ; 4571 _ 49: 29. D0
00004574        lea     rcx, ptr [r15+rdx]              ; 4574 _ 49: 8D. 0C 17
00004578        add     rdx, r14                        ; 4578 _ 4C: 01. F2
0000457B        mov     rax, qword ptr [?_889]          ; 457B _ 48: 8B. 05, 00006726(rel)
00004582        call    qword ptr [rax+160H]            ; 4582 _ FF. 90, 00000160
?_397:
00004588        inc     rdi                             ; 4588 _ 48: FF. C7
0000458B        cmp     rdi, 1                          ; 458B _ 48: 83. FF, 01
0000458F        ja      ?_398                           ; 458F _ 77, 08
00004591        mov     rax, qword ptr [rbx]            ; 4591 _ 48: 8B. 03
00004594        test    rax, rax                        ; 4594 _ 48: 85. C0
00004597        jnz     ?_396                           ; 4597 _ 75, A4
?_398:
00004599        mov     rcx, r14                        ; 4599 _ 4C: 89. F1
0000459C        mov     rdx, r15                        ; 459C _ 4C: 89. FA
0000459F        mov     r8, r12                         ; 459F _ 4D: 89. E0
000045A2        call    ?_020                           ; 45A2 _ E8, FFFFBEBB
000045A7        test    rax, rax                        ; 45A7 _ 48: 85. C0
000045AA        sete    al                              ; 45AA _ 0F 94. C0
000045AD        movzx   eax, al                         ; 45AD _ 0F B6. C0
000045B0        add     rsp, 40                         ; 45B0 _ 48: 83. C4, 28
000045B4        pop     rbx                             ; 45B4 _ 5B
000045B5        pop     rdi                             ; 45B5 _ 5F
000045B6        pop     rsi                             ; 45B6 _ 5E
000045B7        pop     r12                             ; 45B7 _ 41: 5C
000045B9        pop     r13                             ; 45B9 _ 41: 5D
000045BB        pop     r14                             ; 45BB _ 41: 5E
000045BD        pop     r15                             ; 45BD _ 41: 5F
000045BF        pop     rbp                             ; 45BF _ 5D
000045C0        ret                                     ; 45C0 _ C3

?_399   LABEL NEAR
000045C1        push    rbp                             ; 45C1 _ 55
000045C2        mov     rbp, rsp                        ; 45C2 _ 48: 89. E5
000045C5        push    r15                             ; 45C5 _ 41: 57
000045C7        push    r14                             ; 45C7 _ 41: 56
000045C9        push    r13                             ; 45C9 _ 41: 55
000045CB        push    r12                             ; 45CB _ 41: 54
000045CD        push    rsi                             ; 45CD _ 56
000045CE        push    rdi                             ; 45CE _ 57
000045CF        push    rbx                             ; 45CF _ 53
000045D0        sub     rsp, 56                         ; 45D0 _ 48: 83. EC, 38
000045D4        mov     rsi, r9                         ; 45D4 _ 4C: 89. CE
000045D7        mov     r14, r8                         ; 45D7 _ 4D: 89. C6
000045DA        mov     r15, rdx                        ; 45DA _ 49: 89. D7
000045DD        mov     rbx, rcx                        ; 45DD _ 48: 89. CB
000045E0        lea     rdx, ptr [rbp-48H]              ; 45E0 _ 48: 8D. 55, B8
000045E4        mov     rcx, rbx                        ; 45E4 _ 48: 89. D9
000045E7        call    qword ptr [rbx+10H]             ; 45E7 _ FF. 53, 10
000045EA        mov     rdi, rax                        ; 45EA _ 48: 89. C7
000045ED        test    rdi, rdi                        ; 45ED _ 48: 85. FF
000045F0        jne     ?_401                           ; 45F0 _ 0F 85, 000000AE
000045F6        mov     qword ptr [rbp-40H], rsi        ; 45F6 _ 48: 89. 75, C0
000045FA        mov     rcx, rsi                        ; 45FA _ 48: 89. F1
000045FD        call    ?_007                           ; 45FD _ E8, FFFFBD09
00004602        mov     r12, rax                        ; 4602 _ 49: 89. C4
00004605        mov     rdi, 9H                         ; 4605 _ 48: BF, 8000000000000009
0000460F        test    r12, r12                        ; 460F _ 4D: 85. E4
00004612        je      ?_401                           ; 4612 _ 0F 84, 0000008C
00004618        mov     qword ptr [rsp+20H], r12        ; 4618 _ 4C: 89. 64 24, 20
0000461D        lea     r9, ptr [rbp-40H]               ; 461D _ 4C: 8D. 4D, C0
00004621        mov     rcx, rbx                        ; 4621 _ 48: 89. D9
00004624        mov     rdx, r14                        ; 4624 _ 4C: 89. F2
00004627        xor     r8d, r8d                        ; 4627 _ 45: 31. C0
0000462A        call    qword ptr [rbx+20H]             ; 462A _ FF. 53, 20
0000462D        mov     rdi, rax                        ; 462D _ 48: 89. C7
00004630        test    rdi, rdi                        ; 4630 _ 48: 85. FF
00004633        jnz     ?_400                           ; 4633 _ 75, 62
00004635        mov     rdi, 4H                         ; 4635 _ 48: BF, 8000000000000004
0000463F        cmp     qword ptr [rbp-40H], rsi        ; 463F _ 48: 39. 75, C0
00004643        jnz     ?_400                           ; 4643 _ 75, 52
00004645        mov     r13, qword ptr [rbp+30H]        ; 4645 _ 4C: 8B. 6D, 30
00004649        mov     rcx, qword ptr [rbp-48H]        ; 4649 _ 48: 8B. 4D, B8
0000464D        mov     qword ptr [rsp+20H], r15        ; 464D _ 4C: 89. 7C 24, 20
00004652        mov     rdi, rsi                        ; 4652 _ 48: 89. F7
00004655        imul    rdi, r14                        ; 4655 _ 49: 0F AF. FE
00004659        add     rcx, rdi                        ; 4659 _ 48: 01. F9
0000465C        mov     rdx, rsi                        ; 465C _ 48: 89. F2
0000465F        mov     r8, r13                         ; 465F _ 4D: 89. E8
00004662        mov     r9, r12                         ; 4662 _ 4D: 89. E1
00004665        call    ?_395                           ; 4665 _ E8, FFFFFE9F
0000466A        mov     r15b, al                        ; 466A _ 41: 88. C7
0000466D        add     rdi, qword ptr [rbp-48H]        ; 466D _ 48: 03. 7D, B8
00004671        mov     rcx, rdi                        ; 4671 _ 48: 89. F9
00004674        mov     rdx, rsi                        ; 4674 _ 48: 89. F2
00004677        call    ?_392                           ; 4677 _ E8, FFFFFDC8
0000467C        xor     edi, edi                        ; 467C _ 31. FF
0000467E        test    r15b, r15b                      ; 467E _ 45: 84. FF
00004681        jnz     ?_400                           ; 4681 _ 75, 14
00004683        mov     rcx, rbx                        ; 4683 _ 48: 89. D9
00004686        mov     rdx, r14                        ; 4686 _ 4C: 89. F2
00004689        mov     r8, rsi                         ; 4689 _ 49: 89. F0
0000468C        mov     r9, r13                         ; 468C _ 4D: 89. E9
0000468F        call    ?_291                           ; 468F _ E8, FFFFE99F
00004694        mov     rdi, rax                        ; 4694 _ 48: 89. C7
?_400:
00004697        mov     rax, qword ptr [?_889]          ; 4697 _ 48: 8B. 05, 0000660A(rel)
0000469E        mov     rcx, r12                        ; 469E _ 4C: 89. E1
000046A1        call    qword ptr [rax+48H]             ; 46A1 _ FF. 50, 48
?_401:
000046A4        mov     rax, rdi                        ; 46A4 _ 48: 89. F8
000046A7        add     rsp, 56                         ; 46A7 _ 48: 83. C4, 38
000046AB        pop     rbx                             ; 46AB _ 5B
000046AC        pop     rdi                             ; 46AC _ 5F
000046AD        pop     rsi                             ; 46AD _ 5E
000046AE        pop     r12                             ; 46AE _ 41: 5C
000046B0        pop     r13                             ; 46B0 _ 41: 5D
000046B2        pop     r14                             ; 46B2 _ 41: 5E
000046B4        pop     r15                             ; 46B4 _ 41: 5F
000046B6        pop     rbp                             ; 46B6 _ 5D
000046B7        ret                                     ; 46B7 _ C3

?_402   LABEL NEAR
000046B8        push    rbp                             ; 46B8 _ 55
000046B9        mov     rbp, rsp                        ; 46B9 _ 48: 89. E5
000046BC        push    rsi                             ; 46BC _ 56
000046BD        push    rdi                             ; 46BD _ 57
000046BE        push    rbx                             ; 46BE _ 53
000046BF        sub     rsp, 88                         ; 46BF _ 48: 83. EC, 58
000046C3        mov     edi, edx                        ; 46C3 _ 89. D7
000046C5        mov     rbx, rcx                        ; 46C5 _ 48: 89. CB
000046C8        mov     qword ptr [rbp-20H], 0          ; 46C8 _ 48: C7. 45, E0, 00000000
000046D0        mov     rax, qword ptr [?_889]          ; 46D0 _ 48: 8B. 05, 000065D1(rel)
000046D7        lea     rcx, ptr [rbp-28H]              ; 46D7 _ 48: 8D. 4D, D8
000046DB        mov     qword ptr [rsp+20H], rcx        ; 46DB _ 48: 89. 4C 24, 20
000046E0        mov     ecx, 2147483648                 ; 46E0 _ B9, 80000000
000046E5        xor     edx, edx                        ; 46E5 _ 31. D2
000046E7        xor     r8d, r8d                        ; 46E7 _ 45: 31. C0
000046EA        xor     r9d, r9d                        ; 46EA _ 45: 31. C9
000046ED        call    qword ptr [rax+50H]             ; 46ED _ FF. 50, 50
000046F0        mov     rsi, rax                        ; 46F0 _ 48: 89. C6
000046F3        test    rsi, rsi                        ; 46F3 _ 48: 85. F6
000046F6        js      ?_404                           ; 46F6 _ 78, 6A
000046F8        mov     rcx, qword ptr [rbp-28H]        ; 46F8 _ 48: 8B. 4D, D8
000046FC        mov     qword ptr [rbp-40H], rcx        ; 46FC _ 48: 89. 4D, C0
00004700        mov     qword ptr [rbp-38H], rbx        ; 4700 _ 48: 89. 5D, C8
00004704        mov     rax, qword ptr [?_889]          ; 4704 _ 48: 8B. 05, 0000659D(rel)
0000470B        imul    r8d, edi, 10000000              ; 470B _ 44: 69. C7, 00989680
00004712        mov     edx, 2                          ; 4712 _ BA, 00000002
00004717        call    qword ptr [rax+58H]             ; 4717 _ FF. 50, 58
0000471A        mov     rsi, rax                        ; 471A _ 48: 89. C6
0000471D        test    rsi, rsi                        ; 471D _ 48: 85. F6
00004720        js      ?_403                           ; 4720 _ 78, 32
00004722        mov     rax, qword ptr [?_889]          ; 4722 _ 48: 8B. 05, 0000657F(rel)
00004729        lea     rdx, ptr [rbp-40H]              ; 4729 _ 48: 8D. 55, C0
0000472D        lea     r8, ptr [rbp-20H]               ; 472D _ 4C: 8D. 45, E0
00004731        mov     ecx, 2                          ; 4731 _ B9, 00000002
00004736        call    qword ptr [rax+60H]             ; 4736 _ FF. 50, 60
00004739        mov     rsi, rax                        ; 4739 _ 48: 89. C6
0000473C        test    rsi, rsi                        ; 473C _ 48: 85. F6
0000473F        js      ?_403                           ; 473F _ 78, 13
00004741        mov     rax, qword ptr [rbp-20H]        ; 4741 _ 48: 8B. 45, E0
00004745        test    rax, rax                        ; 4745 _ 48: 85. C0
00004748        jnz     ?_403                           ; 4748 _ 75, 0A
0000474A        mov     rsi, 12H                        ; 474A _ 48: BE, 8000000000000012
?_403:
00004754        mov     rcx, qword ptr [rbp-28H]        ; 4754 _ 48: 8B. 4D, D8
00004758        mov     rax, qword ptr [?_889]          ; 4758 _ 48: 8B. 05, 00006549(rel)
0000475F        call    qword ptr [rax+70H]             ; 475F _ FF. 50, 70
?_404:
00004762        mov     rax, rsi                        ; 4762 _ 48: 89. F0
00004765        add     rsp, 88                         ; 4765 _ 48: 83. C4, 58
00004769        pop     rbx                             ; 4769 _ 5B
0000476A        pop     rdi                             ; 476A _ 5F
0000476B        pop     rsi                             ; 476B _ 5E
0000476C        pop     rbp                             ; 476C _ 5D
0000476D        ret                                     ; 476D _ C3

?_405   LABEL NEAR
0000476E        push    rbp                             ; 476E _ 55
0000476F        mov     rbp, rsp                        ; 476F _ 48: 89. E5
00004772        push    rsi                             ; 4772 _ 56
00004773        sub     rsp, 40                         ; 4773 _ 48: 83. EC, 28
00004777        mov     rax, qword ptr [?_889]          ; 4777 _ 48: 8B. 05, 0000652A(rel)
0000477E        lea     rcx, ptr [?_830]                ; 477E _ 48: 8D. 0D, 00005D07(rel)
00004785        lea     r8, ptr [rbp-10H]               ; 4785 _ 4C: 8D. 45, F0
00004789        xor     edx, edx                        ; 4789 _ 31. D2
0000478B        call    qword ptr [rax+140H]            ; 478B _ FF. 90, 00000140
00004791        mov     rsi, rax                        ; 4791 _ 48: 89. C6
00004794        test    rsi, rsi                        ; 4794 _ 48: 85. F6
00004797        js      ?_406                           ; 4797 _ 78, 2F
00004799        mov     rax, qword ptr [rbp-10H]        ; 4799 _ 48: 8B. 45, F0
0000479D        mov     rcx, qword ptr [rax]            ; 479D _ 48: 8B. 08
000047A0        test    rcx, rcx                        ; 47A0 _ 48: 85. C9
000047A3        jz      ?_406                           ; 47A3 _ 74, 23
000047A5        mov     edx, 5                          ; 47A5 _ BA, 00000005
000047AA        call    ?_402                           ; 47AA _ E8, FFFFFF09
000047AF        mov     rsi, rax                        ; 47AF _ 48: 89. C6
000047B2        test    rsi, rsi                        ; 47B2 _ 48: 85. F6
000047B5        js      ?_406                           ; 47B5 _ 78, 11
000047B7        mov     rax, qword ptr [rbp-10H]        ; 47B7 _ 48: 8B. 45, F0
000047BB        mov     rcx, qword ptr [rax]            ; 47BB _ 48: 8B. 08
000047BE        mov     rax, qword ptr [?_889]          ; 47BE _ 48: 8B. 05, 000064E3(rel)
000047C5        call    qword ptr [rax+68H]             ; 47C5 _ FF. 50, 68
?_406:
000047C8        mov     rax, rsi                        ; 47C8 _ 48: 89. F0
000047CB        add     rsp, 40                         ; 47CB _ 48: 83. C4, 28
000047CF        pop     rsi                             ; 47CF _ 5E
000047D0        pop     rbp                             ; 47D0 _ 5D
000047D1        ret                                     ; 47D1 _ C3

?_407   LABEL NEAR
000047D2        push    rbp                             ; 47D2 _ 55
000047D3        mov     rbp, rsp                        ; 47D3 _ 48: 89. E5
000047D6        push    rsi                             ; 47D6 _ 56
000047D7        sub     rsp, 56                         ; 47D7 _ 48: 83. EC, 38
000047DB        mov     esi, ecx                        ; 47DB _ 89. CE
000047DD        mov     byte ptr [rbp-9H], dl           ; 47DD _ 88. 55, F7
000047E0        mov     rax, qword ptr [?_871]          ; 47E0 _ 48: 8B. 05, 00006449(rel)
000047E7        test    rax, rax                        ; 47E7 _ 48: 85. C0
000047EA        jnz     ?_408                           ; 47EA _ 75, 0C
000047EC        call    ?_615                           ; 47EC _ E8, 00001D5B
000047F1        mov     qword ptr [?_871], rax          ; 47F1 _ 48: 89. 05, 00006438(rel)
?_408:
000047F8        lea     rcx, ptr [rbp-9H]               ; 47F8 _ 48: 8D. 4D, F7
000047FC        mov     qword ptr [rsp+20H], rcx        ; 47FC _ 48: 89. 4C 24, 20
00004801        movzx   r8d, si                         ; 4801 _ 44: 0F B7. C6
00004805        mov     rcx, rax                        ; 4805 _ 48: 89. C1
00004808        xor     edx, edx                        ; 4808 _ 31. D2
0000480A        mov     r9d, 1                          ; 480A _ 41: B9, 00000001
00004810        call    qword ptr [rax+30H]             ; 4810 _ FF. 50, 30
00004813        add     rsp, 56                         ; 4813 _ 48: 83. C4, 38
00004817        pop     rsi                             ; 4817 _ 5E
00004818        pop     rbp                             ; 4818 _ 5D
00004819        ret                                     ; 4819 _ C3

?_409   LABEL NEAR
0000481A        push    rbp                             ; 481A _ 55
0000481B        mov     rbp, rsp                        ; 481B _ 48: 89. E5
0000481E        sub     rsp, 32                         ; 481E _ 48: 83. EC, 20
00004822        mov     ecx, 102                        ; 4822 _ B9, 00000066
00004827        mov     edx, 129                        ; 4827 _ BA, 00000081
0000482C        call    ?_407                           ; 482C _ E8, FFFFFFA1
00004831        mov     rax, qword ptr [?_889]          ; 4831 _ 48: 8B. 05, 00006470(rel)
00004838        mov     ecx, 20                         ; 4838 _ B9, 00000014
0000483D        call    qword ptr [rax+0F8H]            ; 483D _ FF. 90, 000000F8
00004843        mov     ecx, 98                         ; 4843 _ B9, 00000062
00004848        mov     edx, 16                         ; 4848 _ BA, 00000010
0000484D        call    ?_407                           ; 484D _ E8, FFFFFF80
00004852        mov     rax, qword ptr [?_889]          ; 4852 _ 48: 8B. 05, 0000644F(rel)
00004859        mov     ecx, 20                         ; 4859 _ B9, 00000014
0000485E        call    qword ptr [rax+0F8H]            ; 485E _ FF. 90, 000000F8
00004864        mov     ecx, 98                         ; 4864 _ B9, 00000062
00004869        mov     edx, 5                          ; 4869 _ BA, 00000005
0000486E        call    ?_407                           ; 486E _ E8, FFFFFF5F
00004873        mov     rax, qword ptr [?_889]          ; 4873 _ 48: 8B. 05, 0000642E(rel)
0000487A        mov     ecx, 20                         ; 487A _ B9, 00000014
0000487F        add     rsp, 32                         ; 487F _ 48: 83. C4, 20
00004883        pop     rbp                             ; 4883 _ 5D
00004884        jmp     qword ptr [rax+0F8H]            ; 4884 _ FF. A0, 000000F8

?_410   LABEL NEAR
0000488A        push    rbp                             ; 488A _ 55
0000488B        mov     rbp, rsp                        ; 488B _ 48: 89. E5
0000488E        sub     rsp, 48                         ; 488E _ 48: 83. EC, 30
00004892        mov     byte ptr [rbp-1H], 1            ; 4892 _ C6. 45, FF, 01
00004896        mov     byte ptr [rbp-2H], 1            ; 4896 _ C6. 45, FE, 01
0000489A        lea     rdx, ptr [rbp-1H]               ; 489A _ 48: 8D. 55, FF
0000489E        mov     ecx, 1194547012                 ; 489E _ B9, 47335744
000048A3        call    ?_413                           ; 48A3 _ E8, 00000039
000048A8        lea     rdx, ptr [rbp-2H]               ; 48A8 _ 48: 8D. 55, FE
000048AC        mov     ecx, 1096110159                 ; 48AC _ B9, 4155504F
000048B1        call    ?_413                           ; 48B1 _ E8, 0000002B
000048B6        test    rax, rax                        ; 48B6 _ 48: 85. C0
000048B9        jns     ?_411                           ; 48B9 _ 79, 04
000048BB        xor     ecx, ecx                        ; 48BB _ 31. C9
000048BD        jmp     ?_412                           ; 48BD _ EB, 0A

?_411:
000048BF        call    ?_409                           ; 48BF _ E8, FFFFFF56
000048C4        mov     ecx, 2                          ; 48C4 _ B9, 00000002
?_412:
000048C9        mov     rax, qword ptr [?_890]          ; 48C9 _ 48: 8B. 05, 000063E0(rel)
000048D0        xor     edx, edx                        ; 48D0 _ 31. D2
000048D2        xor     r8d, r8d                        ; 48D2 _ 45: 31. C0
000048D5        xor     r9d, r9d                        ; 48D5 _ 45: 31. C9
000048D8        call    qword ptr [rax+68H]             ; 48D8 _ FF. 50, 68
000048DB        add     rsp, 48                         ; 48DB _ 48: 83. C4, 30
000048DF        pop     rbp                             ; 48DF _ 5D
000048E0        ret                                     ; 48E0 _ C3

?_413   LABEL NEAR
000048E1        push    rbp                             ; 48E1 _ 55
000048E2        mov     rbp, rsp                        ; 48E2 _ 48: 89. E5
000048E5        push    rsi                             ; 48E5 _ 56
000048E6        push    rdi                             ; 48E6 _ 57
000048E7        sub     rsp, 32                         ; 48E7 _ 48: 83. EC, 20
000048EB        mov     rsi, rdx                        ; 48EB _ 48: 89. D6
000048EE        mov     edi, ecx                        ; 48EE _ 89. CF
000048F0        mov     rcx, qword ptr [?_872]          ; 48F0 _ 48: 8B. 0D, 00006341(rel)
000048F7        test    rcx, rcx                        ; 48F7 _ 48: 85. C9
000048FA        jnz     ?_414                           ; 48FA _ 75, 29
000048FC        mov     rax, qword ptr [?_889]          ; 48FC _ 48: 8B. 05, 000063A5(rel)
00004903        lea     rcx, ptr [?_833]                ; 4903 _ 48: 8D. 0D, 00005BB2(rel)
0000490A        lea     r8, ptr [?_872]                 ; 490A _ 4C: 8D. 05, 00006327(rel)
00004911        xor     edx, edx                        ; 4911 _ 31. D2
00004913        call    qword ptr [rax+140H]            ; 4913 _ FF. 90, 00000140
00004919        test    rax, rax                        ; 4919 _ 48: 85. C0
0000491C        jnz     ?_415                           ; 491C _ 75, 1F
0000491E        mov     rcx, qword ptr [?_872]          ; 491E _ 48: 8B. 0D, 00006313(rel)
?_414:
00004925        mov     rax, qword ptr [rcx+10H]        ; 4925 _ 48: 8B. 41, 10
00004929        mov     edx, edi                        ; 4929 _ 89. FA
0000492B        mov     r8d, 1                          ; 492B _ 41: B8, 00000001
00004931        mov     r9, rsi                         ; 4931 _ 49: 89. F1
00004934        add     rsp, 32                         ; 4934 _ 48: 83. C4, 20
00004938        pop     rdi                             ; 4938 _ 5F
00004939        pop     rsi                             ; 4939 _ 5E
0000493A        pop     rbp                             ; 493A _ 5D
0000493B        jmp     rax                             ; 493B _ FF. E0

?_415:
0000493D        add     rsp, 32                         ; 493D _ 48: 83. C4, 20
00004941        pop     rdi                             ; 4941 _ 5F
00004942        pop     rsi                             ; 4942 _ 5E
00004943        pop     rbp                             ; 4943 _ 5D
00004944        ret                                     ; 4944 _ C3

?_416   LABEL NEAR
00004945        push    rbp                             ; 4945 _ 55
00004946        mov     rbp, rsp                        ; 4946 _ 48: 89. E5
00004949        sub     rsp, 48                         ; 4949 _ 48: 83. EC, 30
0000494D        test    cl, cl                          ; 494D _ 84. C9
0000494F        setne   byte ptr [rbp-1H]               ; 494F _ 0F 95. 45, FF
00004953        lea     rdx, ptr [rbp-1H]               ; 4953 _ 48: 8D. 55, FF
00004957        mov     ecx, 1313820738                 ; 4957 _ B9, 4E4F5042
0000495C        call    ?_413                           ; 495C _ E8, FFFFFF80
00004961        add     rsp, 48                         ; 4961 _ 48: 83. C4, 30
00004965        pop     rbp                             ; 4965 _ 5D
00004966        ret                                     ; 4966 _ C3

?_417   LABEL NEAR
00004967        push    rbp                             ; 4967 _ 55
00004968        mov     rbp, rsp                        ; 4968 _ 48: 89. E5
0000496B        push    r15                             ; 496B _ 41: 57
0000496D        push    r14                             ; 496D _ 41: 56
0000496F        push    rsi                             ; 496F _ 56
00004970        push    rdi                             ; 4970 _ 57
00004971        push    rbx                             ; 4971 _ 53
00004972        sub     rsp, 120                        ; 4972 _ 48: 83. EC, 78
00004976        mov     rax, qword ptr [?_784]          ; 4976 _ 48: 8B. 05, 00003733(rel)
0000497D        mov     qword ptr [rbp-58H], rax        ; 497D _ 48: 89. 45, A8
00004981        mov     rax, qword ptr [?_783]          ; 4981 _ 48: 8B. 05, 00003720(rel)
00004988        mov     qword ptr [rbp-60H], rax        ; 4988 _ 48: 89. 45, A0
0000498C        mov     rax, qword ptr [?_889]          ; 498C _ 48: 8B. 05, 00006315(rel)
00004993        lea     rcx, ptr [?_822]                ; 4993 _ 48: 8D. 0D, 00005A72(rel)
0000499A        xor     esi, esi                        ; 499A _ 31. F6
0000499C        lea     r8, ptr [rbp-40H]               ; 499C _ 4C: 8D. 45, C0
000049A0        xor     edx, edx                        ; 49A0 _ 31. D2
000049A2        call    qword ptr [rax+140H]            ; 49A2 _ FF. 90, 00000140
000049A8        test    rax, rax                        ; 49A8 _ 48: 85. C0
000049AB        js      ?_420                           ; 49AB _ 78, 63
000049AD        mov     qword ptr [rbp-50H], 0          ; 49AD _ 48: C7. 45, B0, 00000000
000049B5        mov     qword ptr [rbp-48H], 0          ; 49B5 _ 48: C7. 45, B8, 00000000
000049BD        lea     r14, ptr [rbp-50H]              ; 49BD _ 4C: 8D. 75, B0
000049C1        lea     r15, ptr [rbp-48H]              ; 49C1 _ 4C: 8D. 7D, B8
000049C5        lea     rdi, ptr [rbp-60H]              ; 49C5 _ 48: 8D. 7D, A0
?_418:
000049C9        mov     rax, qword ptr [rbp-40H]        ; 49C9 _ 48: 8B. 45, C0
000049CD        mov     rcx, rax                        ; 49CD _ 48: 89. C1
000049D0        mov     rdx, r14                        ; 49D0 _ 4C: 89. F2
000049D3        xor     r8d, r8d                        ; 49D3 _ 45: 31. C0
000049D6        mov     r9, r15                         ; 49D6 _ 4D: 89. F9
000049D9        call    qword ptr [rax+8H]              ; 49D9 _ FF. 50, 08
000049DC        mov     rbx, rax                        ; 49DC _ 48: 89. C3
000049DF        mov     rsi, qword ptr [rbp-48H]        ; 49DF _ 48: 8B. 75, B8
000049E3        cmp     qword ptr [rsi+28H], 4          ; 49E3 _ 48: 83. 7E, 28, 04
000049E8        jnz     ?_419                           ; 49E8 _ 75, 16
000049EA        lea     rcx, ptr [rsi+8H]               ; 49EA _ 48: 8D. 4E, 08
000049EE        mov     rdx, rdi                        ; 49EE _ 48: 89. FA
000049F1        call    ?_018                           ; 49F1 _ E8, FFFFBA47
000049F6        test    al, al                          ; 49F6 _ 84. C0
000049F8        jz      ?_419                           ; 49F8 _ 74, 06
000049FA        cmp     dword ptr [rsi+54H], 2          ; 49FA _ 83. 7E, 54, 02
000049FE        jz      ?_421                           ; 49FE _ 74, 20
?_419:
00004A00        xor     esi, esi                        ; 4A00 _ 31. F6
00004A02        test    rbx, rbx                        ; 4A02 _ 48: 85. DB
00004A05        js      ?_420                           ; 4A05 _ 78, 09
00004A07        mov     rax, qword ptr [rbp-50H]        ; 4A07 _ 48: 8B. 45, B0
00004A0B        test    rax, rax                        ; 4A0B _ 48: 85. C0
00004A0E        jnz     ?_418                           ; 4A0E _ 75, B9
?_420:
00004A10        mov     rax, rsi                        ; 4A10 _ 48: 89. F0
00004A13        add     rsp, 120                        ; 4A13 _ 48: 83. C4, 78
00004A17        pop     rbx                             ; 4A17 _ 5B
00004A18        pop     rdi                             ; 4A18 _ 5F
00004A19        pop     rsi                             ; 4A19 _ 5E
00004A1A        pop     r14                             ; 4A1A _ 41: 5E
00004A1C        pop     r15                             ; 4A1C _ 41: 5F
00004A1E        pop     rbp                             ; 4A1E _ 5D
00004A1F        ret                                     ; 4A1F _ C3

?_421:
00004A20        mov     di, word ptr [rsi+5AH]          ; 4A20 _ 66: 8B. 7E, 5A
00004A24        mov     rdx, qword ptr [rbp-48H]        ; 4A24 _ 48: 8B. 55, B8
00004A28        mov     qword ptr [rbp-30H], 0          ; 4A28 _ 48: C7. 45, D0, 00000000
00004A30        add     rdx, 24                         ; 4A30 _ 48: 83. C2, 18
00004A34        lea     rcx, ptr [rbp-30H]              ; 4A34 _ 48: 8D. 4D, D0
00004A38        call    ?_068                           ; 4A38 _ E8, FFFFBE0F
00004A3D        xor     esi, esi                        ; 4A3D _ 31. F6
00004A3F        test    ax, ax                          ; 4A3F _ 66: 85. C0
00004A42        je      ?_422                           ; 4A42 _ 0F 84, 0000008B
00004A48        mov     qword ptr [rbp-38H], 0          ; 4A48 _ 48: C7. 45, C8, 00000000
00004A50        mov     rsi, qword ptr [rbp-30H]        ; 4A50 _ 48: 8B. 75, D0
00004A54        lea     r15, ptr [rbp-38H]              ; 4A54 _ 4C: 8D. 7D, C8
00004A58        mov     qword ptr [rsp+28H], r15        ; 4A58 _ 4C: 89. 7C 24, 28
00004A5D        mov     qword ptr [rsp+30H], 0          ; 4A5D _ 48: C7. 44 24, 30, 00000000
00004A66        mov     qword ptr [rsp+20H], 0          ; 4A66 _ 48: C7. 44 24, 20, 00000000
00004A6F        movzx   ebx, ax                         ; 4A6F _ 0F B7. D8
00004A72        movzx   r14d, di                        ; 4A72 _ 44: 0F B7. F7
00004A76        mov     rcx, rsi                        ; 4A76 _ 48: 89. F1
00004A79        mov     edx, ebx                        ; 4A79 _ 89. DA
00004A7B        mov     r8d, r14d                       ; 4A7B _ 45: 89. F0
00004A7E        xor     r9d, r9d                        ; 4A7E _ 45: 31. C9
00004A81        call    qword ptr [rsi+50H]             ; 4A81 _ FF. 56, 50
00004A84        mov     rcx, qword ptr [rbp-38H]        ; 4A84 _ 48: 8B. 4D, C8
00004A88        call    ?_008                           ; 4A88 _ E8, FFFFB8B2
00004A8D        mov     rdi, rax                        ; 4A8D _ 48: 89. C7
00004A90        xor     esi, esi                        ; 4A90 _ 31. F6
00004A92        test    rdi, rdi                        ; 4A92 _ 48: 85. FF
00004A95        jz      ?_422                           ; 4A95 _ 74, 3C
00004A97        mov     rax, qword ptr [rbp-30H]        ; 4A97 _ 48: 8B. 45, D0
00004A9B        mov     qword ptr [rsp+30H], rdi        ; 4A9B _ 48: 89. 7C 24, 30
00004AA0        mov     qword ptr [rsp+28H], r15        ; 4AA0 _ 4C: 89. 7C 24, 28
00004AA5        mov     qword ptr [rsp+20H], 0          ; 4AA5 _ 48: C7. 44 24, 20, 00000000
00004AAE        mov     rcx, rax                        ; 4AAE _ 48: 89. C1
00004AB1        mov     edx, ebx                        ; 4AB1 _ 89. DA
00004AB3        mov     r8d, r14d                       ; 4AB3 _ 45: 89. F0
00004AB6        xor     r9d, r9d                        ; 4AB6 _ 45: 31. C9
00004AB9        call    qword ptr [rax+50H]             ; 4AB9 _ FF. 50, 50
00004ABC        test    rax, rax                        ; 4ABC _ 48: 85. C0
00004ABF        mov     rsi, rdi                        ; 4ABF _ 48: 89. FE
00004AC2        jz      ?_422                           ; 4AC2 _ 74, 0F
00004AC4        mov     rax, qword ptr [?_889]          ; 4AC4 _ 48: 8B. 05, 000061DD(rel)
00004ACB        mov     rcx, rdi                        ; 4ACB _ 48: 89. F9
00004ACE        call    qword ptr [rax+48H]             ; 4ACE _ FF. 50, 48
00004AD1        xor     esi, esi                        ; 4AD1 _ 31. F6
?_422:
00004AD3        mov     rcx, rsi                        ; 4AD3 _ 48: 89. F1
00004AD6        mov     edx, 32                         ; 4AD6 _ BA, 00000020
00004ADB        call    ?_031                           ; 4ADB _ E8, FFFFB9FF
00004AE0        jmp     ?_420                           ; 4AE0 _ E9, FFFFFF2B

?_423   LABEL NEAR
00004AE5        push    rbp                             ; 4AE5 _ 55
00004AE6        mov     rbp, rsp                        ; 4AE6 _ 48: 89. E5
00004AE9        sub     rsp, 32                         ; 4AE9 _ 48: 83. EC, 20
00004AED        call    ?_417                           ; 4AED _ E8, FFFFFE75
00004AF2        test    rax, rax                        ; 4AF2 _ 48: 85. C0
00004AF5        jnz     ?_424                           ; 4AF5 _ 75, 13
00004AF7        lea     rcx, ptr [?_785]                ; 4AF7 _ 48: 8D. 0D, 000035BA(rel)
00004AFE        call    ?_121                           ; 4AFE _ E8, FFFFC2D2
00004B03        mov     ecx, 666                        ; 4B03 _ B9, 0000029A
00004B08        jmp     ?_427                           ; 4B08 _ EB, 4E

?_424:
00004B0A        cmp     word ptr [rax], 46              ; 4B0A _ 66: 83. 38, 2E
00004B0E        lea     rax, ptr [rax+2H]               ; 4B0E _ 48: 8D. 40, 02
00004B12        jnz     ?_424                           ; 4B12 _ 75, F6
00004B14        xor     edx, edx                        ; 4B14 _ 31. D2
?_425:
00004B16        cmp     word ptr [rax], 46              ; 4B16 _ 66: 83. 38, 2E
00004B1A        lea     rax, ptr [rax+2H]               ; 4B1A _ 48: 8D. 40, 02
00004B1E        jnz     ?_425                           ; 4B1E _ 75, F6
00004B20        mov     r8, -55                         ; 4B20 _ 49: C7. C0, FFFFFFC9
00004B27        mov     r9, rdx                         ; 4B27 _ 49: 89. D1
00004B2A        mov     rcx, rdx                        ; 4B2A _ 48: 89. D1
?_426:
00004B2D        movzx   r11d, word ptr [rax+rdx]        ; 4B2D _ 44: 0F B7. 1C 10
00004B32        cmp     r11, 64                         ; 4B32 _ 49: 83. FB, 40
00004B36        mov     r10, -48                        ; 4B36 _ 49: C7. C2, FFFFFFD0
00004B3D        cmova   r10, r8                         ; 4B3D _ 4D: 0F 47. D0
00004B41        shl     rcx, 4                          ; 4B41 _ 48: C1. E1, 04
00004B45        add     rcx, r11                        ; 4B45 _ 4C: 01. D9
00004B48        add     rcx, r10                        ; 4B48 _ 4C: 01. D1
00004B4B        add     rdx, 2                          ; 4B4B _ 48: 83. C2, 02
00004B4F        inc     r9                              ; 4B4F _ 49: FF. C1
00004B52        cmp     r9, 4                           ; 4B52 _ 49: 83. F9, 04
00004B56        jnz     ?_426                           ; 4B56 _ 75, D5
?_427:
00004B58        mov     rax, rcx                        ; 4B58 _ 48: 89. C8
00004B5B        add     rsp, 32                         ; 4B5B _ 48: 83. C4, 20
00004B5F        pop     rbp                             ; 4B5F _ 5D
00004B60        ret                                     ; 4B60 _ C3

?_428   LABEL NEAR
00004B61        push    rbp                             ; 4B61 _ 55
00004B62        mov     rbp, rsp                        ; 4B62 _ 48: 89. E5
00004B65        push    r14                             ; 4B65 _ 41: 56
00004B67        push    rsi                             ; 4B67 _ 56
00004B68        push    rdi                             ; 4B68 _ 57
00004B69        push    rbx                             ; 4B69 _ 53
00004B6A        sub     rsp, 32                         ; 4B6A _ 48: 83. EC, 20
00004B6E        mov     rdi, r9                         ; 4B6E _ 4C: 89. CF
00004B71        mov     r14, r8                         ; 4B71 _ 4D: 89. C6
00004B74        mov     rsi, rdx                        ; 4B74 _ 48: 89. D6
00004B77        mov     rbx, rcx                        ; 4B77 _ 48: 89. CB
00004B7A        lea     rcx, ptr [rbx+rsi]              ; 4B7A _ 48: 8D. 0C 33
00004B7E        mov     rax, rbx                        ; 4B7E _ 48: 89. D8
00004B81        jmp     ?_430                           ; 4B81 _ EB, 03

?_429:
00004B83        inc     rax                             ; 4B83 _ 48: FF. C0
?_430:
00004B86        cmp     rax, rcx                        ; 4B86 _ 48: 39. C8
00004B89        jnc     ?_431                           ; 4B89 _ 73, 0C
00004B8B        mov     dl, byte ptr [rax]              ; 4B8B _ 8A. 10
00004B8D        cmp     dl, 10                          ; 4B8D _ 80. FA, 0A
00004B90        jz      ?_431                           ; 4B90 _ 74, 05
00004B92        cmp     dl, 13                          ; 4B92 _ 80. FA, 0D
00004B95        jnz     ?_429                           ; 4B95 _ 75, EC
?_431:
00004B97        lea     rcx, ptr [rsi+rbx-1H]           ; 4B97 _ 48: 8D. 4C 1E, FF
00004B9C        cmp     rax, rcx                        ; 4B9C _ 48: 39. C8
00004B9F        jnc     ?_434                           ; 4B9F _ 73, 1D
00004BA1        cmp     byte ptr [rax], 13              ; 4BA1 _ 80. 38, 0D
00004BA4        jnz     ?_432                           ; 4BA4 _ 75, 0D
00004BA6        cmp     byte ptr [rax+1H], 10           ; 4BA6 _ 80. 78, 01, 0A
00004BAA        jnz     ?_432                           ; 4BAA _ 75, 07
00004BAC        mov     esi, 2                          ; 4BAC _ BE, 00000002
00004BB1        jmp     ?_433                           ; 4BB1 _ EB, 05

?_432:
00004BB3        mov     esi, 1                          ; 4BB3 _ BE, 00000001
?_433:
00004BB8        sub     rsi, rbx                        ; 4BB8 _ 48: 29. DE
00004BBB        add     rsi, rax                        ; 4BBB _ 48: 01. C6
?_434:
00004BBE        mov     rdx, qword ptr [rdi]            ; 4BBE _ 48: 8B. 17
00004BC1        cmp     rsi, rdx                        ; 4BC1 _ 48: 39. D6
00004BC4        jbe     ?_435                           ; 4BC4 _ 76, 0F
00004BC6        mov     qword ptr [rdi], rsi            ; 4BC6 _ 48: 89. 37
00004BC9        mov     rax, 5H                         ; 4BC9 _ 48: B8, 8000000000000005
00004BD3        jmp     ?_436                           ; 4BD3 _ EB, 2E

?_435:
00004BD5        mov     rax, qword ptr [?_889]          ; 4BD5 _ 48: 8B. 05, 000060CC(rel)
00004BDC        mov     rcx, r14                        ; 4BDC _ 4C: 89. F1
00004BDF        xor     r8d, r8d                        ; 4BDF _ 45: 31. C0
00004BE2        call    qword ptr [rax+168H]            ; 4BE2 _ FF. 90, 00000168
00004BE8        mov     qword ptr [rdi], rsi            ; 4BE8 _ 48: 89. 37
00004BEB        mov     rax, qword ptr [?_889]          ; 4BEB _ 48: 8B. 05, 000060B6(rel)
00004BF2        mov     rcx, r14                        ; 4BF2 _ 4C: 89. F1
00004BF5        mov     rdx, rbx                        ; 4BF5 _ 48: 89. DA
00004BF8        mov     r8, rsi                         ; 4BF8 _ 49: 89. F0
00004BFB        call    qword ptr [rax+160H]            ; 4BFB _ FF. 90, 00000160
00004C01        xor     eax, eax                        ; 4C01 _ 31. C0
?_436:
00004C03        add     rsp, 32                         ; 4C03 _ 48: 83. C4, 20
00004C07        pop     rbx                             ; 4C07 _ 5B
00004C08        pop     rdi                             ; 4C08 _ 5F
00004C09        pop     rsi                             ; 4C09 _ 5E
00004C0A        pop     r14                             ; 4C0A _ 41: 5E
00004C0C        pop     rbp                             ; 4C0C _ 5D
00004C0D        ret                                     ; 4C0D _ C3

?_437   LABEL NEAR
00004C0E        push    rsi                             ; 4C0E _ 56
00004C0F        mov     r8, rdx                         ; 4C0F _ 49: 89. D0
00004C12        mov     rax, qword ptr [r8]             ; 4C12 _ 49: 8B. 00
00004C15        test    rax, rax                        ; 4C15 _ 48: 85. C0
00004C18        je      ?_446                           ; 4C18 _ 0F 84, 00000099
00004C1E        lea     r10, ptr [rcx+rax-1H]           ; 4C1E _ 4C: 8D. 54 01, FF
00004C23        mov     rax, 2600H                      ; 4C23 _ 48: B8, 0000000100002600
00004C2D        jmp     ?_439                           ; 4C2D _ EB, 13

?_438:
00004C2F        movzx   edx, byte ptr [r10]             ; 4C2F _ 41: 0F B6. 12
00004C33        cmp     rdx, 32                         ; 4C33 _ 48: 83. FA, 20
00004C37        ja      ?_440                           ; 4C37 _ 77, 17
00004C39        bt      rax, rdx                        ; 4C39 _ 48: 0F A3. D0
00004C3D        jnc     ?_440                           ; 4C3D _ 73, 11
00004C3F        dec     r10                             ; 4C3F _ 49: FF. CA
?_439:
00004C42        cmp     r10, rcx                        ; 4C42 _ 49: 39. CA
00004C45        jnc     ?_438                           ; 4C45 _ 73, E8
00004C47        mov     qword ptr [r8], 0               ; 4C47 _ 49: C7. 00, 00000000
00004C4E        jmp     ?_446                           ; 4C4E _ EB, 67

?_440:
00004C50        mov     r9d, 1                          ; 4C50 _ 41: B9, 00000001
00004C56        sub     r9, rcx                         ; 4C56 _ 49: 29. C9
00004C59        add     r9, r10                         ; 4C59 _ 4D: 01. D1
00004C5C        xor     eax, eax                        ; 4C5C _ 31. C0
00004C5E        mov     r11, 2600H                      ; 4C5E _ 49: BB, 0000000100002600
00004C68        jmp     ?_442                           ; 4C68 _ EB, 03

?_441:
00004C6A        inc     rax                             ; 4C6A _ 48: FF. C0
?_442:
00004C6D        lea     rdx, ptr [rcx+rax]              ; 4C6D _ 48: 8D. 14 01
00004C71        cmp     rdx, r10                        ; 4C71 _ 4C: 39. D2
00004C74        ja      ?_443                           ; 4C74 _ 77, 0F
00004C76        movzx   esi, byte ptr [rdx]             ; 4C76 _ 0F B6. 32
00004C79        cmp     rsi, 32                         ; 4C79 _ 48: 83. FE, 20
00004C7D        ja      ?_443                           ; 4C7D _ 77, 06
00004C7F        bt      r11, rsi                        ; 4C7F _ 49: 0F A3. F3
00004C83        jc      ?_441                           ; 4C83 _ 72, E5
?_443:
00004C85        test    rax, rax                        ; 4C85 _ 48: 85. C0
00004C88        jnz     ?_444                           ; 4C88 _ 75, 05
00004C8A        mov     qword ptr [r8], r9              ; 4C8A _ 4D: 89. 08
00004C8D        jmp     ?_446                           ; 4C8D _ EB, 28

?_444:
00004C8F        lea     rax, ptr [r10+1H]               ; 4C8F _ 49: 8D. 42, 01
00004C93        sub     rax, rdx                        ; 4C93 _ 48: 29. D0
00004C96        mov     qword ptr [r8], rax             ; 4C96 _ 49: 89. 00
00004C99        cmp     rdx, r10                        ; 4C99 _ 4C: 39. D2
00004C9C        ja      ?_446                           ; 4C9C _ 77, 19
00004C9E        xor     eax, eax                        ; 4C9E _ 31. C0
?_445:
00004CA0        mov     r8b, byte ptr [rdx+rax]         ; 4CA0 _ 44: 8A. 04 02
00004CA4        mov     byte ptr [rcx], r8b             ; 4CA4 _ 44: 88. 01
00004CA7        lea     r8, ptr [rdx+rax+1H]            ; 4CA7 _ 4C: 8D. 44 02, 01
00004CAC        inc     rax                             ; 4CAC _ 48: FF. C0
00004CAF        inc     rcx                             ; 4CAF _ 48: FF. C1
00004CB2        cmp     r8, r10                         ; 4CB2 _ 4D: 39. D0
00004CB5        jbe     ?_445                           ; 4CB5 _ 76, E9
?_446:
00004CB7        pop     rsi                             ; 4CB7 _ 5E
00004CB8        ret                                     ; 4CB8 _ C3

?_447   LABEL NEAR
00004CB9        push    rbp                             ; 4CB9 _ 55
00004CBA        mov     rbp, rsp                        ; 4CBA _ 48: 89. E5
00004CBD        push    r14                             ; 4CBD _ 41: 56
00004CBF        push    rsi                             ; 4CBF _ 56
00004CC0        push    rdi                             ; 4CC0 _ 57
00004CC1        push    rbx                             ; 4CC1 _ 53
00004CC2        sub     rsp, 32                         ; 4CC2 _ 48: 83. EC, 20
00004CC6        mov     rdi, r8                         ; 4CC6 _ 4C: 89. C7
00004CC9        mov     rsi, rdx                        ; 4CC9 _ 48: 89. D6
00004CCC        mov     r14, rcx                        ; 4CCC _ 49: 89. CE
00004CCF        mov     ecx, 16                         ; 4CCF _ B9, 00000010
00004CD4        call    ?_007                           ; 4CD4 _ E8, FFFFB632
00004CD9        mov     rbx, rax                        ; 4CD9 _ 48: 89. C3
00004CDC        mov     rax, 9H                         ; 4CDC _ 48: B8, 8000000000000009
00004CE6        test    rbx, rbx                        ; 4CE6 _ 48: 85. DB
00004CE9        jz      ?_448                           ; 4CE9 _ 74, 44
00004CEB        mov     rax, qword ptr [rdi]            ; 4CEB _ 48: 8B. 07
00004CEE        mov     qword ptr [rbx+8H], rax         ; 4CEE _ 48: 89. 43, 08
00004CF2        mov     qword ptr [rdi], rbx            ; 4CF2 _ 48: 89. 1F
00004CF5        lea     rcx, ptr [rsi+1H]               ; 4CF5 _ 48: 8D. 4E, 01
00004CF9        call    ?_007                           ; 4CF9 _ E8, FFFFB60D
00004CFE        mov     rcx, rax                        ; 4CFE _ 48: 89. C1
00004D01        mov     qword ptr [rbx], rcx            ; 4D01 _ 48: 89. 0B
00004D04        mov     rax, 9H                         ; 4D04 _ 48: B8, 8000000000000009
00004D0E        test    rcx, rcx                        ; 4D0E _ 48: 85. C9
00004D11        jz      ?_448                           ; 4D11 _ 74, 1C
00004D13        mov     rax, qword ptr [?_889]          ; 4D13 _ 48: 8B. 05, 00005F8E(rel)
00004D1A        mov     rdx, r14                        ; 4D1A _ 4C: 89. F2
00004D1D        mov     r8, rsi                         ; 4D1D _ 49: 89. F0
00004D20        call    qword ptr [rax+160H]            ; 4D20 _ FF. 90, 00000160
00004D26        mov     rax, qword ptr [rbx]            ; 4D26 _ 48: 8B. 03
00004D29        mov     byte ptr [rax+rsi], 0           ; 4D29 _ C6. 04 30, 00
00004D2D        xor     eax, eax                        ; 4D2D _ 31. C0
?_448:
00004D2F        add     rsp, 32                         ; 4D2F _ 48: 83. C4, 20
00004D33        pop     rbx                             ; 4D33 _ 5B
00004D34        pop     rdi                             ; 4D34 _ 5F
00004D35        pop     rsi                             ; 4D35 _ 5E
00004D36        pop     r14                             ; 4D36 _ 41: 5E
00004D38        pop     rbp                             ; 4D38 _ 5D
00004D39        ret                                     ; 4D39 _ C3

?_449   LABEL NEAR
00004D3A        push    rbp                             ; 4D3A _ 55
00004D3B        mov     rbp, rsp                        ; 4D3B _ 48: 89. E5
00004D3E        push    r14                             ; 4D3E _ 41: 56
00004D40        push    rsi                             ; 4D40 _ 56
00004D41        push    rdi                             ; 4D41 _ 57
00004D42        push    rbx                             ; 4D42 _ 53
00004D43        sub     rsp, 48                         ; 4D43 _ 48: 83. EC, 30
00004D47        mov     r14, r8                         ; 4D47 _ 4D: 89. C6
00004D4A        mov     rsi, rcx                        ; 4D4A _ 48: 89. CE
00004D4D        lea     rcx, ptr [rdx+rsi-1H]           ; 4D4D _ 48: 8D. 4C 32, FF
00004D52        xor     eax, eax                        ; 4D52 _ 31. C0
00004D54        cmp     rcx, rsi                        ; 4D54 _ 48: 39. F1
00004D57        jbe     ?_452                           ; 4D57 _ 0F 86, 000000A9
00004D5D        cmp     byte ptr [rcx], 93              ; 4D5D _ 80. 39, 5D
00004D60        jz      ?_451                           ; 4D60 _ 74, 07
00004D62        cmp     rcx, rsi                        ; 4D62 _ 48: 39. F1
00004D65        jbe     ?_451                           ; 4D65 _ 76, 02
?_450:
00004D67        jmp     ?_450                           ; 4D67 _ EB, FE

?_451:
00004D69        add     rdx, -2                         ; 4D69 _ 48: 83. C2, FE
00004D6D        mov     qword ptr [rbp-28H], rdx        ; 4D6D _ 48: 89. 55, D8
00004D71        inc     rsi                             ; 4D71 _ 48: FF. C6
00004D74        lea     rdx, ptr [rbp-28H]              ; 4D74 _ 48: 8D. 55, D8
00004D78        mov     rcx, rsi                        ; 4D78 _ 48: 89. F1
00004D7B        call    ?_437                           ; 4D7B _ E8, FFFFFE8E
00004D80        xor     eax, eax                        ; 4D80 _ 31. C0
00004D82        mov     rbx, qword ptr [rbp-28H]        ; 4D82 _ 48: 8B. 5D, D8
00004D86        test    rbx, rbx                        ; 4D86 _ 48: 85. DB
00004D89        jz      ?_452                           ; 4D89 _ 74, 7B
00004D8B        mov     ecx, 40                         ; 4D8B _ B9, 00000028
00004D90        call    ?_007                           ; 4D90 _ E8, FFFFB576
00004D95        mov     rdi, rax                        ; 4D95 _ 48: 89. C7
00004D98        mov     rax, 9H                         ; 4D98 _ 48: B8, 8000000000000009
00004DA2        test    rdi, rdi                        ; 4DA2 _ 48: 85. FF
00004DA5        jz      ?_452                           ; 4DA5 _ 74, 5F
00004DA7        mov     qword ptr [rdi], 0              ; 4DA7 _ 48: C7. 07, 00000000
00004DAE        mov     qword ptr [rdi+8H], rbx         ; 4DAE _ 48: 89. 5F, 08
00004DB2        mov     qword ptr [rdi+10H], 0          ; 4DB2 _ 48: C7. 47, 10, 00000000
00004DBA        mov     qword ptr [rdi+18H], 0          ; 4DBA _ 48: C7. 47, 18, 00000000
00004DC2        mov     rax, qword ptr [r14]            ; 4DC2 _ 49: 8B. 06
00004DC5        mov     qword ptr [rdi+20H], rax        ; 4DC5 _ 48: 89. 47, 20
00004DC9        mov     qword ptr [r14], rdi            ; 4DC9 _ 49: 89. 3E
00004DCC        lea     rcx, ptr [rbx+1H]               ; 4DCC _ 48: 8D. 4B, 01
00004DD0        call    ?_007                           ; 4DD0 _ E8, FFFFB536
00004DD5        mov     rcx, rax                        ; 4DD5 _ 48: 89. C1
00004DD8        mov     rax, 9H                         ; 4DD8 _ 48: B8, 8000000000000009
00004DE2        mov     qword ptr [rdi], rcx            ; 4DE2 _ 48: 89. 0F
00004DE5        test    rcx, rcx                        ; 4DE5 _ 48: 85. C9
00004DE8        jz      ?_452                           ; 4DE8 _ 74, 1C
00004DEA        mov     rax, qword ptr [?_889]          ; 4DEA _ 48: 8B. 05, 00005EB7(rel)
00004DF1        mov     rdx, rsi                        ; 4DF1 _ 48: 89. F2
00004DF4        mov     r8, rbx                         ; 4DF4 _ 49: 89. D8
00004DF7        call    qword ptr [rax+160H]            ; 4DF7 _ FF. 90, 00000160
00004DFD        mov     rax, qword ptr [rdi]            ; 4DFD _ 48: 8B. 07
00004E00        mov     byte ptr [rax+rbx], 0           ; 4E00 _ C6. 04 18, 00
00004E04        xor     eax, eax                        ; 4E04 _ 31. C0
?_452:
00004E06        add     rsp, 48                         ; 4E06 _ 48: 83. C4, 30
00004E0A        pop     rbx                             ; 4E0A _ 5B
00004E0B        pop     rdi                             ; 4E0B _ 5F
00004E0C        pop     rsi                             ; 4E0C _ 5E
00004E0D        pop     r14                             ; 4E0D _ 41: 5E
00004E0F        pop     rbp                             ; 4E0F _ 5D
00004E10        ret                                     ; 4E10 _ C3

?_453   LABEL NEAR
00004E11        push    rbp                             ; 4E11 _ 55
00004E12        mov     rbp, rsp                        ; 4E12 _ 48: 89. E5
00004E15        push    r15                             ; 4E15 _ 41: 57
00004E17        push    r14                             ; 4E17 _ 41: 56
00004E19        push    r13                             ; 4E19 _ 41: 55
00004E1B        push    r12                             ; 4E1B _ 41: 54
00004E1D        push    rsi                             ; 4E1D _ 56
00004E1E        push    rdi                             ; 4E1E _ 57
00004E1F        push    rbx                             ; 4E1F _ 53
00004E20        sub     rsp, 40                         ; 4E20 _ 48: 83. EC, 28
00004E24        mov     r15, r8                         ; 4E24 _ 4D: 89. C7
00004E27        mov     r14, rcx                        ; 4E27 _ 49: 89. CE
00004E2A        lea     rbx, ptr [rdx+r14-1H]           ; 4E2A _ 4A: 8D. 5C 32, FF
00004E2F        xor     eax, eax                        ; 4E2F _ 31. C0
00004E31        mov     rsi, rax                        ; 4E31 _ 48: 89. C6
00004E34        jmp     ?_455                           ; 4E34 _ EB, 03

?_454:
00004E36        inc     rsi                             ; 4E36 _ 48: FF. C6
?_455:
00004E39        lea     rcx, ptr [r14+rsi]              ; 4E39 _ 49: 8D. 0C 36
00004E3D        cmp     rcx, rbx                        ; 4E3D _ 48: 39. D9
00004E40        ja      ?_459                           ; 4E40 _ 0F 87, 00000177
00004E46        cmp     byte ptr [rcx], 61              ; 4E46 _ 80. 39, 3D
00004E49        jnz     ?_454                           ; 4E49 _ 75, EB
00004E4B        mov     qword ptr [rbp-40H], rsi        ; 4E4B _ 48: 89. 75, C0
00004E4F        lea     rdx, ptr [rbp-40H]              ; 4E4F _ 48: 8D. 55, C0
00004E53        mov     rcx, r14                        ; 4E53 _ 4C: 89. F1
00004E56        call    ?_437                           ; 4E56 _ E8, FFFFFDB3
00004E5B        xor     eax, eax                        ; 4E5B _ 31. C0
00004E5D        mov     rdi, qword ptr [rbp-40H]        ; 4E5D _ 48: 8B. 7D, C0
00004E61        test    rdi, rdi                        ; 4E61 _ 48: 85. FF
00004E64        je      ?_459                           ; 4E64 _ 0F 84, 00000153
00004E6A        mov     r13, qword ptr [r15]            ; 4E6A _ 4D: 8B. 2F
00004E6D        xor     eax, eax                        ; 4E6D _ 31. C0
00004E6F        test    r13, r13                        ; 4E6F _ 4D: 85. ED
00004E72        je      ?_459                           ; 4E72 _ 0F 84, 00000145
00004E78        mov     ecx, 40                         ; 4E78 _ B9, 00000028
00004E7D        call    ?_007                           ; 4E7D _ E8, FFFFB489
00004E82        mov     r12, rax                        ; 4E82 _ 49: 89. C4
00004E85        mov     rax, 9H                         ; 4E85 _ 48: B8, 8000000000000009
00004E8F        test    r12, r12                        ; 4E8F _ 4D: 85. E4
00004E92        je      ?_459                           ; 4E92 _ 0F 84, 00000125
00004E98        mov     qword ptr [r12], 0              ; 4E98 _ 49: C7. 04 24, 00000000
00004EA0        mov     qword ptr [r12+10H], 0          ; 4EA0 _ 49: C7. 44 24, 10, 00000000
00004EA9        mov     qword ptr [r12+18H], 0          ; 4EA9 _ 49: C7. 44 24, 18, 00000000
00004EB2        mov     rax, qword ptr [r13+8H]         ; 4EB2 _ 49: 8B. 45, 08
00004EB6        mov     qword ptr [r12+8H], rax         ; 4EB6 _ 49: 89. 44 24, 08
00004EBB        mov     rax, qword ptr [r15]            ; 4EBB _ 49: 8B. 07
00004EBE        mov     qword ptr [r12+20H], rax        ; 4EBE _ 49: 89. 44 24, 20
00004EC3        mov     qword ptr [r15], r12            ; 4EC3 _ 4D: 89. 27
00004EC6        mov     rcx, qword ptr [r13+8H]         ; 4EC6 _ 49: 8B. 4D, 08
00004ECA        inc     rcx                             ; 4ECA _ 48: FF. C1
00004ECD        call    ?_007                           ; 4ECD _ E8, FFFFB439
00004ED2        mov     rcx, rax                        ; 4ED2 _ 48: 89. C1
00004ED5        mov     rax, 9H                         ; 4ED5 _ 48: B8, 8000000000000009
00004EDF        mov     qword ptr [r12], rcx            ; 4EDF _ 49: 89. 0C 24
00004EE3        test    rcx, rcx                        ; 4EE3 _ 48: 85. C9
00004EE6        je      ?_459                           ; 4EE6 _ 0F 84, 000000D1
00004EEC        mov     rdx, qword ptr [r13]            ; 4EEC _ 49: 8B. 55, 00
00004EF0        mov     r8, qword ptr [r13+8H]          ; 4EF0 _ 4D: 8B. 45, 08
00004EF4        mov     rax, qword ptr [?_889]          ; 4EF4 _ 48: 8B. 05, 00005DAD(rel)
00004EFB        inc     r8                              ; 4EFB _ 49: FF. C0
00004EFE        call    qword ptr [rax+160H]            ; 4EFE _ FF. 90, 00000160
00004F04        lea     rcx, ptr [rdi+1H]               ; 4F04 _ 48: 8D. 4F, 01
00004F08        call    ?_007                           ; 4F08 _ E8, FFFFB3FE
00004F0D        mov     rcx, rax                        ; 4F0D _ 48: 89. C1
00004F10        mov     qword ptr [r12+10H], rcx        ; 4F10 _ 49: 89. 4C 24, 10
00004F15        mov     rax, 9H                         ; 4F15 _ 48: B8, 8000000000000009
00004F1F        test    rcx, rcx                        ; 4F1F _ 48: 85. C9
00004F22        je      ?_459                           ; 4F22 _ 0F 84, 00000095
00004F28        mov     r15, rdi                        ; 4F28 _ 49: 89. FF
00004F2B        lea     rdi, ptr [r14+rsi+1H]           ; 4F2B _ 49: 8D. 7C 36, 01
00004F30        mov     rax, qword ptr [?_889]          ; 4F30 _ 48: 8B. 05, 00005D71(rel)
00004F37        mov     rdx, r14                        ; 4F37 _ 4C: 89. F2
00004F3A        mov     r8, r15                         ; 4F3A _ 4D: 89. F8
00004F3D        call    qword ptr [rax+160H]            ; 4F3D _ FF. 90, 00000160
00004F43        mov     rax, qword ptr [r12+10H]        ; 4F43 _ 49: 8B. 44 24, 10
00004F48        mov     byte ptr [rax+r15], 0           ; 4F48 _ 42: C6. 04 38, 00
00004F4D        lea     rsi, ptr [r14+rsi+1H]           ; 4F4D _ 49: 8D. 74 36, 01
00004F52        jmp     ?_457                           ; 4F52 _ EB, 03

?_456:
00004F54        inc     rdi                             ; 4F54 _ 48: FF. C7
?_457:
00004F57        cmp     rdi, rbx                        ; 4F57 _ 48: 39. DF
00004F5A        ja      ?_458                           ; 4F5A _ 77, 05
00004F5C        cmp     byte ptr [rdi], 35              ; 4F5C _ 80. 3F, 23
00004F5F        jnz     ?_456                           ; 4F5F _ 75, F3
?_458:
00004F61        sub     rdi, rsi                        ; 4F61 _ 48: 29. F7
00004F64        mov     qword ptr [rbp-40H], rdi        ; 4F64 _ 48: 89. 7D, C0
00004F68        lea     rdx, ptr [rbp-40H]              ; 4F68 _ 48: 8D. 55, C0
00004F6C        mov     rcx, rsi                        ; 4F6C _ 48: 89. F1
00004F6F        call    ?_437                           ; 4F6F _ E8, FFFFFC9A
00004F74        xor     eax, eax                        ; 4F74 _ 31. C0
00004F76        mov     rbx, qword ptr [rbp-40H]        ; 4F76 _ 48: 8B. 5D, C0
00004F7A        test    rbx, rbx                        ; 4F7A _ 48: 85. DB
00004F7D        jz      ?_459                           ; 4F7D _ 74, 3E
00004F7F        lea     rcx, ptr [rbx+1H]               ; 4F7F _ 48: 8D. 4B, 01
00004F83        call    ?_007                           ; 4F83 _ E8, FFFFB383
00004F88        mov     rcx, rax                        ; 4F88 _ 48: 89. C1
00004F8B        mov     qword ptr [r12+18H], rcx        ; 4F8B _ 49: 89. 4C 24, 18
00004F90        mov     rax, 9H                         ; 4F90 _ 48: B8, 8000000000000009
00004F9A        test    rcx, rcx                        ; 4F9A _ 48: 85. C9
00004F9D        jz      ?_459                           ; 4F9D _ 74, 1E
00004F9F        mov     rax, qword ptr [?_889]          ; 4F9F _ 48: 8B. 05, 00005D02(rel)
00004FA6        mov     rdx, rsi                        ; 4FA6 _ 48: 89. F2
00004FA9        mov     r8, rbx                         ; 4FA9 _ 49: 89. D8
00004FAC        call    qword ptr [rax+160H]            ; 4FAC _ FF. 90, 00000160
00004FB2        mov     rax, qword ptr [r12+18H]        ; 4FB2 _ 49: 8B. 44 24, 18
00004FB7        mov     byte ptr [rax+rbx], 0           ; 4FB7 _ C6. 04 18, 00
00004FBB        xor     eax, eax                        ; 4FBB _ 31. C0
?_459:
00004FBD        add     rsp, 40                         ; 4FBD _ 48: 83. C4, 28
00004FC1        pop     rbx                             ; 4FC1 _ 5B
00004FC2        pop     rdi                             ; 4FC2 _ 5F
00004FC3        pop     rsi                             ; 4FC3 _ 5E
00004FC4        pop     r12                             ; 4FC4 _ 41: 5C
00004FC6        pop     r13                             ; 4FC6 _ 41: 5D
00004FC8        pop     r14                             ; 4FC8 _ 41: 5E
00004FCA        pop     r15                             ; 4FCA _ 41: 5F
00004FCC        pop     rbp                             ; 4FCC _ 5D
00004FCD        ret                                     ; 4FCD _ C3

?_460   LABEL NEAR
00004FCE        push    rbp                             ; 4FCE _ 55
00004FCF        mov     rbp, rsp                        ; 4FCF _ 48: 89. E5
00004FD2        push    rsi                             ; 4FD2 _ 56
00004FD3        push    rdi                             ; 4FD3 _ 57
00004FD4        push    rbx                             ; 4FD4 _ 53
00004FD5        sub     rsp, 40                         ; 4FD5 _ 48: 83. EC, 28
00004FD9        mov     rsi, rdx                        ; 4FD9 _ 48: 89. D6
00004FDC        mov     rdi, rcx                        ; 4FDC _ 48: 89. CF
00004FDF        test    rdi, rdi                        ; 4FDF _ 48: 85. FF
00004FE2        jnz     ?_465                           ; 4FE2 _ 75, 39
?_461:
00004FE4        test    rsi, rsi                        ; 4FE4 _ 48: 85. F6
00004FE7        jz      ?_464                           ; 4FE7 _ 74, 2B
?_462:
00004FE9        mov     rcx, qword ptr [rsi]            ; 4FE9 _ 48: 8B. 0E
00004FEC        mov     rdi, qword ptr [rsi+8H]         ; 4FEC _ 48: 8B. 7E, 08
00004FF0        test    rcx, rcx                        ; 4FF0 _ 48: 85. C9
00004FF3        jz      ?_463                           ; 4FF3 _ 74, 0A
00004FF5        mov     rax, qword ptr [?_889]          ; 4FF5 _ 48: 8B. 05, 00005CAC(rel)
00004FFC        call    qword ptr [rax+48H]             ; 4FFC _ FF. 50, 48
?_463:
00004FFF        mov     rax, qword ptr [?_889]          ; 4FFF _ 48: 8B. 05, 00005CA2(rel)
00005006        mov     rcx, rsi                        ; 5006 _ 48: 89. F1
00005009        call    qword ptr [rax+48H]             ; 5009 _ FF. 50, 48
0000500C        test    rdi, rdi                        ; 500C _ 48: 85. FF
0000500F        mov     rsi, rdi                        ; 500F _ 48: 89. FE
00005012        jnz     ?_462                           ; 5012 _ 75, D5
?_464:
00005014        add     rsp, 40                         ; 5014 _ 48: 83. C4, 28
00005018        pop     rbx                             ; 5018 _ 5B
00005019        pop     rdi                             ; 5019 _ 5F
0000501A        pop     rsi                             ; 501A _ 5E
0000501B        pop     rbp                             ; 501B _ 5D
0000501C        ret                                     ; 501C _ C3

?_465:
0000501D        mov     rcx, qword ptr [rdi+10H]        ; 501D _ 48: 8B. 4F, 10
00005021        mov     rbx, qword ptr [rdi+20H]        ; 5021 _ 48: 8B. 5F, 20
00005025        test    rcx, rcx                        ; 5025 _ 48: 85. C9
00005028        jz      ?_466                           ; 5028 _ 74, 0A
0000502A        mov     rax, qword ptr [?_889]          ; 502A _ 48: 8B. 05, 00005C77(rel)
00005031        call    qword ptr [rax+48H]             ; 5031 _ FF. 50, 48
?_466:
00005034        mov     rcx, qword ptr [rdi]            ; 5034 _ 48: 8B. 0F
00005037        test    rcx, rcx                        ; 5037 _ 48: 85. C9
0000503A        jz      ?_467                           ; 503A _ 74, 0A
0000503C        mov     rax, qword ptr [?_889]          ; 503C _ 48: 8B. 05, 00005C65(rel)
00005043        call    qword ptr [rax+48H]             ; 5043 _ FF. 50, 48
?_467:
00005046        mov     rcx, qword ptr [rdi+18H]        ; 5046 _ 48: 8B. 4F, 18
0000504A        test    rcx, rcx                        ; 504A _ 48: 85. C9
0000504D        jz      ?_468                           ; 504D _ 74, 0A
0000504F        mov     rax, qword ptr [?_889]          ; 504F _ 48: 8B. 05, 00005C52(rel)
00005056        call    qword ptr [rax+48H]             ; 5056 _ FF. 50, 48
?_468:
00005059        mov     rax, qword ptr [?_889]          ; 5059 _ 48: 8B. 05, 00005C48(rel)
00005060        mov     rcx, rdi                        ; 5060 _ 48: 89. F9
00005063        call    qword ptr [rax+48H]             ; 5063 _ FF. 50, 48
00005066        test    rbx, rbx                        ; 5066 _ 48: 85. DB
00005069        mov     rdi, rbx                        ; 5069 _ 48: 89. DF
0000506C        je      ?_461                           ; 506C _ 0F 84, FFFFFF72
00005072        jmp     ?_465                           ; 5072 _ EB, A9

?_469   LABEL NEAR
00005074        push    rbx                             ; 5074 _ 53
00005075        mov     r10, rdx                        ; 5075 _ 49: 89. D2
00005078        mov     qword ptr [r9], 0               ; 5078 _ 49: C7. 01, 00000000
0000507F        jmp     ?_474                           ; 507F _ EB, 2E

?_470:
00005081        inc     rax                             ; 5081 _ 48: FF. C0
00005084        inc     rdx                             ; 5084 _ 48: FF. C2
?_471:
00005087        mov     r11b, byte ptr [rdx]            ; 5087 _ 44: 8A. 1A
0000508A        mov     bl, byte ptr [rax]              ; 508A _ 8A. 18
0000508C        test    bl, bl                          ; 508C _ 84. DB
0000508E        jz      ?_472                           ; 508E _ 74, 0A
00005090        test    r11b, r11b                      ; 5090 _ 45: 84. DB
00005093        jz      ?_472                           ; 5093 _ 74, 05
00005095        cmp     bl, r11b                        ; 5095 _ 44: 38. DB
00005098        jz      ?_470                           ; 5098 _ 74, E7
?_472:
0000509A        cmp     bl, r11b                        ; 509A _ 44: 38. DB
0000509D        jnz     ?_473                           ; 509D _ 75, 0C
0000509F        mov     rax, qword ptr [rcx+10H]        ; 509F _ 48: 8B. 41, 10
000050A3        test    rax, rax                        ; 50A3 _ 48: 85. C0
000050A6        mov     rdx, r8                         ; 50A6 _ 4C: 89. C2
000050A9        jnz     ?_476                           ; 50A9 _ 75, 21
?_473:
000050AB        mov     rcx, qword ptr [rcx+20H]        ; 50AB _ 48: 8B. 49, 20
?_474:
000050AF        mov     rax, 0EH                        ; 50AF _ 48: B8, 800000000000000E
000050B9        test    rcx, rcx                        ; 50B9 _ 48: 85. C9
000050BC        jz      ?_478                           ; 50BC _ 74, 2F
000050BE        mov     rax, qword ptr [rcx]            ; 50BE _ 48: 8B. 01
000050C1        mov     rdx, r10                        ; 50C1 _ 4C: 89. D2
000050C4        jmp     ?_471                           ; 50C4 _ EB, C1

?_475:
000050C6        inc     rax                             ; 50C6 _ 48: FF. C0
000050C9        inc     rdx                             ; 50C9 _ 48: FF. C2
?_476:
000050CC        mov     r11b, byte ptr [rdx]            ; 50CC _ 44: 8A. 1A
000050CF        mov     bl, byte ptr [rax]              ; 50CF _ 8A. 18
000050D1        test    bl, bl                          ; 50D1 _ 84. DB
000050D3        jz      ?_477                           ; 50D3 _ 74, 0A
000050D5        test    r11b, r11b                      ; 50D5 _ 45: 84. DB
000050D8        jz      ?_477                           ; 50D8 _ 74, 05
000050DA        cmp     bl, r11b                        ; 50DA _ 44: 38. DB
000050DD        jz      ?_475                           ; 50DD _ 74, E7
?_477:
000050DF        cmp     bl, r11b                        ; 50DF _ 44: 38. DB
000050E2        jnz     ?_473                           ; 50E2 _ 75, C7
000050E4        mov     rax, qword ptr [rcx+18H]        ; 50E4 _ 48: 8B. 41, 18
000050E8        mov     qword ptr [r9], rax             ; 50E8 _ 49: 89. 01
000050EB        xor     eax, eax                        ; 50EB _ 31. C0
?_478:
000050ED        pop     rbx                             ; 50ED _ 5B
000050EE        ret                                     ; 50EE _ C3

?_479   LABEL NEAR
000050EF        mov     r8, rcx                         ; 50EF _ 49: 89. C8
000050F2        mov     dl, byte ptr [r8]               ; 50F2 _ 41: 8A. 10
000050F5        jmp     ?_481                           ; 50F5 _ EB, 07

?_480:
000050F7        mov     dl, byte ptr [r8+1H]            ; 50F7 _ 41: 8A. 50, 01
000050FB        inc     r8                              ; 50FB _ 49: FF. C0
?_481:
000050FE        cmp     dl, 32                          ; 50FE _ 80. FA, 20
00005101        jz      ?_480                           ; 5101 _ 74, F4
00005103        mov     eax, 1                          ; 5103 _ B8, 00000001
00005108        jmp     ?_483                           ; 5108 _ EB, 07

?_482:
0000510A        mov     dl, byte ptr [r8+rax]           ; 510A _ 41: 8A. 14 00
0000510E        inc     rax                             ; 510E _ 48: FF. C0
?_483:
00005111        cmp     dl, 120                         ; 5111 _ 80. FA, 78
00005114        jz      ?_484                           ; 5114 _ 74, 0D
00005116        cmp     dl, 88                          ; 5116 _ 80. FA, 58
00005119        jz      ?_484                           ; 5119 _ 74, 08
0000511B        cmp     dl, 48                          ; 511B _ 80. FA, 30
0000511E        jz      ?_482                           ; 511E _ 74, EA
00005120        dec     rax                             ; 5120 _ 48: FF. C8
?_484:
00005123        add     r8, rax                         ; 5123 _ 49: 01. C0
00005126        xor     eax, eax                        ; 5126 _ 31. C0
00005128        jmp     ?_487                           ; 5128 _ EB, 0C

?_485:
0000512A        shl     rax, 4                          ; 512A _ 48: C1. E0, 04
0000512E        lea     rax, ptr [rax+rcx-37H]          ; 512E _ 48: 8D. 44 08, C9
?_486:
00005133        inc     r8                              ; 5133 _ 49: FF. C0
?_487:
00005136        movzx   ecx, byte ptr [r8]              ; 5136 _ 41: 0F B6. 08
0000513A        test    rcx, rcx                        ; 513A _ 48: 85. C9
0000513D        jz      ?_490                           ; 513D _ 74, 34
0000513F        mov     dl, cl                          ; 513F _ 88. CA
00005141        add     dl, -48                         ; 5141 _ 80. C2, D0
00005144        cmp     dl, 9                           ; 5144 _ 80. FA, 09
00005147        ja      ?_488                           ; 5147 _ 77, 0B
00005149        shl     rax, 4                          ; 5149 _ 48: C1. E0, 04
0000514D        lea     rax, ptr [rax+rcx-30H]          ; 514D _ 48: 8D. 44 08, D0
00005152        jmp     ?_486                           ; 5152 _ EB, DF

?_488:
00005154        mov     dl, cl                          ; 5154 _ 88. CA
00005156        add     dl, -97                         ; 5156 _ 80. C2, 9F
00005159        cmp     dl, 5                           ; 5159 _ 80. FA, 05
0000515C        ja      ?_489                           ; 515C _ 77, 0B
0000515E        shl     rax, 4                          ; 515E _ 48: C1. E0, 04
00005162        lea     rax, ptr [rax+rcx-57H]          ; 5162 _ 48: 8D. 44 08, A9
00005167        jmp     ?_486                           ; 5167 _ EB, CA

?_489:
00005169        mov     dl, cl                          ; 5169 _ 88. CA
0000516B        add     dl, -65                         ; 516B _ 80. C2, BF
0000516E        cmp     dl, 5                           ; 516E _ 80. FA, 05
00005171        jbe     ?_485                           ; 5171 _ 76, B7
?_490:
00005173        ret                                     ; 5173 _ C3

?_491   LABEL NEAR
00005174        inc     rcx                             ; 5174 _ 48: FF. C1
00005177        xor     eax, eax                        ; 5177 _ 31. C0
00005179        jmp     ?_493                           ; 5179 _ EB, 03

?_492:
0000517B        inc     rcx                             ; 517B _ 48: FF. C1
?_493:
0000517E        mov     r9b, byte ptr [rcx-1H]          ; 517E _ 44: 8A. 49, FF
00005182        test    r9b, r9b                        ; 5182 _ 45: 84. C9
00005185        jz      ?_496                           ; 5185 _ 74, 4A
00005187        cmp     r9b, 32                         ; 5187 _ 41: 80. F9, 20
0000518B        jz      ?_492                           ; 518B _ 74, EE
0000518D        cmp     r9b, 48                         ; 518D _ 41: 80. F9, 30
00005191        jz      ?_494                           ; 5191 _ 74, 11
00005193        mov     r8b, r9b                        ; 5193 _ 45: 88. C8
00005196        add     r8b, -48                        ; 5196 _ 41: 80. C0, D0
0000519A        xor     eax, eax                        ; 519A _ 31. C0
0000519C        cmp     r8b, 10                         ; 519C _ 41: 80. F8, 0A
000051A0        jc      ?_495                           ; 51A0 _ 72, 11
000051A2        jmp     ?_496                           ; 51A2 _ EB, 2D

?_494:
000051A4        mov     r8b, byte ptr [rcx]             ; 51A4 _ 44: 8A. 01
000051A7        or      r8b, 20H                        ; 51A7 _ 41: 80. C8, 20
000051AB        xor     eax, eax                        ; 51AB _ 31. C0
000051AD        cmp     r8b, 120                        ; 51AD _ 41: 80. F8, 78
000051B1        jz      ?_497                           ; 51B1 _ 74, 1F
?_495:
000051B3        lea     rax, ptr [rax+rax*4]            ; 51B3 _ 48: 8D. 04 80
000051B7        movzx   edx, r9b                        ; 51B7 _ 41: 0F B6. D1
000051BB        lea     rax, ptr [rdx+rax*2-30H]        ; 51BB _ 48: 8D. 44 42, D0
000051C0        mov     r9b, byte ptr [rcx]             ; 51C0 _ 44: 8A. 09
000051C3        inc     rcx                             ; 51C3 _ 48: FF. C1
000051C6        mov     dl, r9b                         ; 51C6 _ 44: 88. CA
000051C9        add     dl, -48                         ; 51C9 _ 80. C2, D0
000051CC        cmp     dl, 10                          ; 51CC _ 80. FA, 0A
000051CF        jc      ?_495                           ; 51CF _ 72, E2
?_496:
000051D1        ret                                     ; 51D1 _ C3

?_497:
000051D2        dec     rcx                             ; 51D2 _ 48: FF. C9
000051D5        jmp     ?_479                           ; 51D5 _ E9, FFFFFF15

?_498   LABEL NEAR
000051DA        push    rbp                             ; 51DA _ 55
000051DB        mov     rbp, rsp                        ; 51DB _ 48: 89. E5
000051DE        push    r15                             ; 51DE _ 41: 57
000051E0        push    r14                             ; 51E0 _ 41: 56
000051E2        push    rsi                             ; 51E2 _ 56
000051E3        push    rdi                             ; 51E3 _ 57
000051E4        push    rbx                             ; 51E4 _ 53
000051E5        sub     rsp, 88                         ; 51E5 _ 48: 83. EC, 58
000051E9        mov     rax, rdx                        ; 51E9 _ 48: 89. D0
000051EC        mov     r15, rcx                        ; 51EC _ 49: 89. CF
000051EF        mov     ebx, 1                          ; 51EF _ BB, 00000001
000051F4        test    rax, rax                        ; 51F4 _ 48: 85. C0
000051F7        js      ?_499                           ; 51F7 _ 78, 05
000051F9        mov     r14, rbx                        ; 51F9 _ 49: 89. DE
000051FC        jmp     ?_500                           ; 51FC _ EB, 10

?_499:
000051FE        mov     byte ptr [r15], 45              ; 51FE _ 41: C6. 07, 2D
00005202        neg     rax                             ; 5202 _ 48: F7. D8
00005205        inc     r15                             ; 5205 _ 49: FF. C7
00005208        mov     r14d, 2                         ; 5208 _ 41: BE, 00000002
?_500:
0000520E        lea     rdi, ptr [rbp-58H]              ; 520E _ 48: 8D. 7D, A8
?_501:
00005212        mov     rcx, rax                        ; 5212 _ 48: 89. C1
00005215        mov     edx, 10                         ; 5215 _ BA, 0000000A
0000521A        mov     r8, rdi                         ; 521A _ 49: 89. F8
0000521D        call    ?_049                           ; 521D _ E8, FFFFB3B4
00005222        mov     cl, byte ptr [rbp-58H]          ; 5222 _ 8A. 4D, A8
00005225        add     cl, 48                          ; 5225 _ 80. C1, 30
00005228        mov     byte ptr [rbp+rbx-50H], cl      ; 5228 _ 88. 4C 1D, B0
0000522C        inc     rbx                             ; 522C _ 48: FF. C3
0000522F        test    rax, rax                        ; 522F _ 48: 85. C0
00005232        jnz     ?_501                           ; 5232 _ 75, DE
00005234        cmp     rbx, 1                          ; 5234 _ 48: 83. FB, 01
00005238        jz      ?_503                           ; 5238 _ 74, 20
0000523A        lea     rax, ptr [rbx-1H]               ; 523A _ 48: 8D. 43, FF
0000523E        mov     rsi, r15                        ; 523E _ 4C: 89. FE
00005241        mov     rdx, rbx                        ; 5241 _ 48: 89. DA
?_502:
00005244        mov     cl, byte ptr [rbp+rdx-51H]      ; 5244 _ 8A. 4C 15, AF
00005248        mov     byte ptr [rsi], cl              ; 5248 _ 88. 0E
0000524A        dec     rdx                             ; 524A _ 48: FF. CA
0000524D        inc     rsi                             ; 524D _ 48: FF. C6
00005250        dec     rax                             ; 5250 _ 48: FF. C8
00005253        jnz     ?_502                           ; 5253 _ 75, EF
00005255        lea     r15, ptr [r15+rbx-1H]           ; 5255 _ 4D: 8D. 7C 1F, FF
?_503:
0000525A        lea     rax, ptr [r14+rbx-2H]           ; 525A _ 49: 8D. 44 1E, FE
0000525F        mov     byte ptr [r15], 0               ; 525F _ 41: C6. 07, 00
00005263        add     rsp, 88                         ; 5263 _ 48: 83. C4, 58
00005267        pop     rbx                             ; 5267 _ 5B
00005268        pop     rdi                             ; 5268 _ 5F
00005269        pop     rsi                             ; 5269 _ 5E
0000526A        pop     r14                             ; 526A _ 41: 5E
0000526C        pop     r15                             ; 526C _ 41: 5F
0000526E        pop     rbp                             ; 526E _ 5D
0000526F        ret                                     ; 526F _ C3

?_504   LABEL NEAR
00005270        push    rbp                             ; 5270 _ 55
00005271        mov     rbp, rsp                        ; 5271 _ 48: 89. E5
00005274        push    rsi                             ; 5274 _ 56
00005275        sub     rsp, 40                         ; 5275 _ 48: 83. EC, 28
00005279        mov     rsi, rcx                        ; 5279 _ 48: 89. CE
0000527C        cmp     byte ptr [rsi], 0               ; 527C _ 80. 3E, 00
0000527F        jz      ?_506                           ; 527F _ 74, 0A
?_505:
00005281        cmp     byte ptr [rsi+1H], 0            ; 5281 _ 80. 7E, 01, 00
00005285        lea     rsi, ptr [rsi+1H]               ; 5285 _ 48: 8D. 76, 01
00005289        jnz     ?_505                           ; 5289 _ 75, F6
?_506:
0000528B        mov     rcx, rsi                        ; 528B _ 48: 89. F1
0000528E        call    ?_498                           ; 528E _ E8, FFFFFF47
00005293        mov     byte ptr [rsi+rax], 0           ; 5293 _ C6. 04 06, 00
00005297        add     rsp, 40                         ; 5297 _ 48: 83. C4, 28
0000529B        pop     rsi                             ; 529B _ 5E
0000529C        pop     rbp                             ; 529C _ 5D
0000529D        ret                                     ; 529D _ C3

?_507   LABEL NEAR
0000529E        push    rbp                             ; 529E _ 55
0000529F        mov     rbp, rsp                        ; 529F _ 48: 89. E5
000052A2        push    r15                             ; 52A2 _ 41: 57
000052A4        push    r14                             ; 52A4 _ 41: 56
000052A6        push    r12                             ; 52A6 _ 41: 54
000052A8        push    rsi                             ; 52A8 _ 56
000052A9        push    rdi                             ; 52A9 _ 57
000052AA        push    rbx                             ; 52AA _ 53
000052AB        sub     rsp, 48                         ; 52AB _ 48: 83. EC, 30
000052AF        mov     r15, rdx                        ; 52AF _ 49: 89. D7
000052B2        mov     rbx, rcx                        ; 52B2 _ 48: 89. CB
000052B5        mov     eax, 1                          ; 52B5 _ B8, 00000001
000052BA        cmp     byte ptr [rbx], 0               ; 52BA _ 80. 3B, 00
000052BD        jnz     ?_508                           ; 52BD _ 75, 05
000052BF        mov     rcx, rax                        ; 52BF _ 48: 89. C1
000052C2        jmp     ?_509                           ; 52C2 _ EB, 0D

?_508:
000052C4        lea     rcx, ptr [rax+1H]               ; 52C4 _ 48: 8D. 48, 01
000052C8        cmp     byte ptr [rbx+rax], 0           ; 52C8 _ 80. 3C 03, 00
000052CC        mov     rax, rcx                        ; 52CC _ 48: 89. C8
000052CF        jnz     ?_508                           ; 52CF _ 75, F3
?_509:
000052D1        call    ?_007                           ; 52D1 _ E8, FFFFB035
000052D6        mov     r12, rax                        ; 52D6 _ 49: 89. C4
000052D9        mov     rax, 9H                         ; 52D9 _ 48: B8, 8000000000000009
000052E3        test    r12, r12                        ; 52E3 _ 4D: 85. E4
000052E6        je      ?_521                           ; 52E6 _ 0F 84, 0000013F
000052EC        mov     rcx, r12                        ; 52EC _ 4C: 89. E1
000052EF        mov     rdx, rbx                        ; 52EF _ 48: 89. DA
000052F2        call    ?_028                           ; 52F2 _ E8, FFFFB1C7
000052F7        mov     ebx, 1                          ; 52F7 _ BB, 00000001
000052FC        jmp     ?_511                           ; 52FC _ EB, 03

?_510:
000052FE        inc     rbx                             ; 52FE _ 48: FF. C3
?_511:
00005301        mov     al, byte ptr [r12+rbx-1H]       ; 5301 _ 41: 8A. 44 1C, FF
00005306        test    al, al                          ; 5306 _ 84. C0
00005308        je      ?_519                           ; 5308 _ 0F 84, 000000F5
0000530E        cmp     al, 45                          ; 530E _ 3C, 2D
00005310        jnz     ?_510                           ; 5310 _ 75, EC
00005312        mov     byte ptr [r12+rbx-1H], 0        ; 5312 _ 41: C6. 44 1C, FF, 00
00005318        mov     rcx, r12                        ; 5318 _ 4C: 89. E1
0000531B        call    ?_479                           ; 531B _ E8, FFFFFDCF
00005320        mov     dword ptr [r15], eax            ; 5320 _ 41: 89. 07
00005323        lea     rcx, ptr [r12+rbx]              ; 5323 _ 49: 8D. 0C 1C
?_512:
00005327        inc     rbx                             ; 5327 _ 48: FF. C3
0000532A        mov     al, byte ptr [r12+rbx-1H]       ; 532A _ 41: 8A. 44 1C, FF
0000532F        test    al, al                          ; 532F _ 84. C0
00005331        je      ?_519                           ; 5331 _ 0F 84, 000000CC
00005337        cmp     al, 45                          ; 5337 _ 3C, 2D
00005339        jnz     ?_512                           ; 5339 _ 75, EC
0000533B        mov     byte ptr [r12+rbx-1H], 0        ; 533B _ 41: C6. 44 1C, FF, 00
00005341        call    ?_479                           ; 5341 _ E8, FFFFFDA9
00005346        mov     word ptr [r15+4H], ax           ; 5346 _ 66 41: 89. 47, 04
0000534B        lea     rcx, ptr [r12+rbx]              ; 534B _ 49: 8D. 0C 1C
0000534F        add     rbx, -2                         ; 534F _ 48: 83. C3, FE
00005353        jmp     ?_514                           ; 5353 _ EB, 03

?_513:
00005355        inc     rbx                             ; 5355 _ 48: FF. C3
?_514:
00005358        mov     al, byte ptr [r12+rbx+2H]       ; 5358 _ 41: 8A. 44 1C, 02
0000535D        test    al, al                          ; 535D _ 84. C0
0000535F        je      ?_519                           ; 535F _ 0F 84, 0000009E
00005365        cmp     al, 45                          ; 5365 _ 3C, 2D
00005367        jnz     ?_513                           ; 5367 _ 75, EC
00005369        mov     byte ptr [r12+rbx+2H], 0        ; 5369 _ 41: C6. 44 1C, 02, 00
0000536F        call    ?_479                           ; 536F _ E8, FFFFFD7B
00005374        mov     word ptr [r15+6H], ax           ; 5374 _ 66 41: 89. 47, 06
00005379        lea     rsi, ptr [r12+rbx+5H]           ; 5379 _ 49: 8D. 74 1C, 05
0000537E        add     rbx, r12                        ; 537E _ 4C: 01. E3
00005381        xor     edi, edi                        ; 5381 _ 31. FF
00005383        lea     r14, ptr [rbp-33H]              ; 5383 _ 4C: 8D. 75, CD
00005387        jmp     ?_516                           ; 5387 _ EB, 2A

?_515:
00005389        test    cl, cl                          ; 5389 _ 84. C9
0000538B        jz      ?_519                           ; 538B _ 74, 76
0000538D        mov     al, byte ptr [rbx+rdi*2+4H]     ; 538D _ 8A. 44 7B, 04
00005391        test    al, al                          ; 5391 _ 84. C0
00005393        jz      ?_519                           ; 5393 _ 74, 6E
00005395        mov     byte ptr [rbp-33H], cl          ; 5395 _ 88. 4D, CD
00005398        mov     byte ptr [rbp-32H], al          ; 5398 _ 88. 45, CE
0000539B        mov     byte ptr [rbp-31H], 0           ; 539B _ C6. 45, CF, 00
0000539F        mov     rcx, r14                        ; 539F _ 4C: 89. F1
000053A2        call    ?_479                           ; 53A2 _ E8, FFFFFD48
000053A7        mov     byte ptr [r15+rdi+8H], al       ; 53A7 _ 41: 88. 44 3F, 08
000053AC        add     rsi, 2                          ; 53AC _ 48: 83. C6, 02
000053B0        inc     rdi                             ; 53B0 _ 48: FF. C7
?_516:
000053B3        mov     cl, byte ptr [rbx+rdi*2+3H]     ; 53B3 _ 8A. 4C 7B, 03
000053B7        cmp     rdi, 1                          ; 53B7 _ 48: 83. FF, 01
000053BB        jbe     ?_515                           ; 53BB _ 76, CC
000053BD        mov     rax, 0EH                        ; 53BD _ 48: B8, 800000000000000E
000053C7        cmp     cl, 45                          ; 53C7 _ 80. F9, 2D
000053CA        jnz     ?_521                           ; 53CA _ 75, 5F
000053CC        lea     rbx, ptr [rbp-33H]              ; 53CC _ 48: 8D. 5D, CD
000053D0        jmp     ?_518                           ; 53D0 _ EB, 1E

?_517:
000053D2        mov     byte ptr [rbp-33H], al          ; 53D2 _ 88. 45, CD
000053D5        mov     byte ptr [rbp-32H], cl          ; 53D5 _ 88. 4D, CE
000053D8        mov     byte ptr [rbp-31H], 0           ; 53D8 _ C6. 45, CF, 00
000053DC        mov     rcx, rbx                        ; 53DC _ 48: 89. D9
000053DF        call    ?_479                           ; 53DF _ E8, FFFFFD0B
000053E4        mov     byte ptr [r15+rdi+8H], al       ; 53E4 _ 41: 88. 44 3F, 08
000053E9        add     rsi, 2                          ; 53E9 _ 48: 83. C6, 02
000053ED        inc     rdi                             ; 53ED _ 48: FF. C7
?_518:
000053F0        cmp     rdi, 7                          ; 53F0 _ 48: 83. FF, 07
000053F4        ja      ?_520                           ; 53F4 _ 77, 26
000053F6        mov     al, byte ptr [rsi-1H]           ; 53F6 _ 8A. 46, FF
000053F9        test    al, al                          ; 53F9 _ 84. C0
000053FB        jz      ?_519                           ; 53FB _ 74, 06
000053FD        mov     cl, byte ptr [rsi]              ; 53FD _ 8A. 0E
000053FF        test    cl, cl                          ; 53FF _ 84. C9
00005401        jnz     ?_517                           ; 5401 _ 75, CF
?_519:
00005403        mov     rax, qword ptr [?_889]          ; 5403 _ 48: 8B. 05, 0000589E(rel)
0000540A        mov     rcx, r12                        ; 540A _ 4C: 89. E1
0000540D        call    qword ptr [rax+48H]             ; 540D _ FF. 50, 48
00005410        mov     rax, 0EH                        ; 5410 _ 48: B8, 800000000000000E
0000541A        jmp     ?_521                           ; 541A _ EB, 0F

?_520:
0000541C        mov     rax, qword ptr [?_889]          ; 541C _ 48: 8B. 05, 00005885(rel)
00005423        mov     rcx, r12                        ; 5423 _ 4C: 89. E1
00005426        call    qword ptr [rax+48H]             ; 5426 _ FF. 50, 48
00005429        xor     eax, eax                        ; 5429 _ 31. C0
?_521:
0000542B        add     rsp, 48                         ; 542B _ 48: 83. C4, 30
0000542F        pop     rbx                             ; 542F _ 5B
00005430        pop     rdi                             ; 5430 _ 5F
00005431        pop     rsi                             ; 5431 _ 5E
00005432        pop     r12                             ; 5432 _ 41: 5C
00005434        pop     r14                             ; 5434 _ 41: 5E
00005436        pop     r15                             ; 5436 _ 41: 5F
00005438        pop     rbp                             ; 5438 _ 5D
00005439        ret                                     ; 5439 _ C3

?_522   LABEL NEAR
0000543A        push    rbp                             ; 543A _ 55
0000543B        mov     rbp, rsp                        ; 543B _ 48: 89. E5
0000543E        push    r15                             ; 543E _ 41: 57
00005440        push    r14                             ; 5440 _ 41: 56
00005442        push    r13                             ; 5442 _ 41: 55
00005444        push    r12                             ; 5444 _ 41: 54
00005446        push    rsi                             ; 5446 _ 56
00005447        push    rdi                             ; 5447 _ 57
00005448        push    rbx                             ; 5448 _ 53
00005449        sub     rsp, 56                         ; 5449 _ 48: 83. EC, 38
0000544D        mov     r12, r8                         ; 544D _ 4D: 89. C4
00005450        mov     r13, rdx                        ; 5450 _ 49: 89. D5
00005453        mov     r15, rcx                        ; 5453 _ 49: 89. CF
00005456        mov     qword ptr [r12], 0              ; 5456 _ 49: C7. 04 24, 00000000
0000545E        mov     qword ptr [r9], 0               ; 545E _ 49: C7. 01, 00000000
00005465        mov     qword ptr [rbp-48H], r9         ; 5465 _ 4C: 89. 4D, B8
00005469        mov     r14d, 512                       ; 5469 _ 41: BE, 00000200
0000546F        mov     ecx, 512                        ; 546F _ B9, 00000200
00005474        call    ?_007                           ; 5474 _ E8, FFFFAE92
00005479        mov     rsi, rax                        ; 5479 _ 48: 89. C6
0000547C        mov     rbx, 9H                         ; 547C _ 48: BB, 8000000000000009
00005486        test    rsi, rsi                        ; 5486 _ 48: 85. F6
00005489        je      ?_530                           ; 5489 _ 0F 84, 000000F3
0000548F        add     r13, r15                        ; 548F _ 4D: 01. FD
00005492        xor     ebx, ebx                        ; 5492 _ 31. DB
?_523:
00005494        cmp     r15, r13                        ; 5494 _ 4D: 39. EF
00005497        jnc     ?_529                           ; 5497 _ 0F 83, 000000D8
0000549D        mov     qword ptr [rbp-40H], r14        ; 549D _ 4C: 89. 75, C0
000054A1        mov     rdx, r13                        ; 54A1 _ 4C: 89. EA
000054A4        sub     rdx, r15                        ; 54A4 _ 4C: 29. FA
000054A7        mov     rcx, r15                        ; 54A7 _ 4C: 89. F9
000054AA        mov     r8, rsi                         ; 54AA _ 49: 89. F0
000054AD        lea     r9, ptr [rbp-40H]               ; 54AD _ 4C: 8D. 4D, C0
000054B1        call    ?_428                           ; 54B1 _ E8, FFFFF6AB
000054B6        mov     rbx, rax                        ; 54B6 _ 48: 89. C3
000054B9        test    rbx, rbx                        ; 54B9 _ 48: 85. DB
000054BC        js      ?_524                           ; 54BC _ 78, 06
000054BE        mov     rdi, qword ptr [rbp-40H]        ; 54BE _ 48: 8B. 7D, C0
000054C2        jmp     ?_525                           ; 54C2 _ EB, 59

?_524:
000054C4        mov     rax, 5H                         ; 54C4 _ 48: B8, 8000000000000005
000054CE        cmp     rbx, rax                        ; 54CE _ 48: 39. C3
000054D1        jne     ?_529                           ; 54D1 _ 0F 85, 0000009E
000054D7        mov     rax, qword ptr [?_889]          ; 54D7 _ 48: 8B. 05, 000057CA(rel)
000054DE        mov     rcx, rsi                        ; 54DE _ 48: 89. F1
000054E1        call    qword ptr [rax+48H]             ; 54E1 _ FF. 50, 48
000054E4        mov     rbx, qword ptr [rbp-40H]        ; 54E4 _ 48: 8B. 5D, C0
000054E8        mov     rcx, rbx                        ; 54E8 _ 48: 89. D9
000054EB        call    ?_007                           ; 54EB _ E8, FFFFAE1B
000054F0        mov     rsi, rax                        ; 54F0 _ 48: 89. C6
000054F3        test    rsi, rsi                        ; 54F3 _ 48: 85. F6
000054F6        je      ?_531                           ; 54F6 _ 0F 84, 0000009A
000054FC        mov     rcx, r15                        ; 54FC _ 4C: 89. F9
000054FF        mov     rdx, rbx                        ; 54FF _ 48: 89. DA
00005502        mov     r8, rsi                         ; 5502 _ 49: 89. F0
00005505        lea     r9, ptr [rbp-40H]               ; 5505 _ 4C: 8D. 4D, C0
00005509        call    ?_428                           ; 5509 _ E8, FFFFF653
0000550E        mov     rbx, rax                        ; 550E _ 48: 89. C3
00005511        test    rbx, rbx                        ; 5511 _ 48: 85. DB
00005514        js      ?_529                           ; 5514 _ 78, 5F
00005516        mov     rdi, qword ptr [rbp-40H]        ; 5516 _ 48: 8B. 7D, C0
0000551A        mov     r14, rdi                        ; 551A _ 49: 89. FE
?_525:
0000551D        mov     rcx, rsi                        ; 551D _ 48: 89. F1
00005520        lea     rdx, ptr [rbp-40H]              ; 5520 _ 48: 8D. 55, C0
00005524        call    ?_437                           ; 5524 _ E8, FFFFF6E5
00005529        add     rdi, r15                        ; 5529 _ 4C: 01. FF
0000552C        mov     rdx, qword ptr [rbp-40H]        ; 552C _ 48: 8B. 55, C0
00005530        test    rdx, rdx                        ; 5530 _ 48: 85. D2
00005533        mov     r15, rdi                        ; 5533 _ 49: 89. FF
00005536        je      ?_523                           ; 5536 _ 0F 84, FFFFFF58
0000553C        mov     al, byte ptr [rsi]              ; 553C _ 8A. 06
0000553E        mov     rcx, rsi                        ; 553E _ 48: 89. F1
00005541        cmp     al, 91                          ; 5541 _ 3C, 5B
00005543        jz      ?_526                           ; 5543 _ 74, 0F
00005545        cmp     al, 35                          ; 5545 _ 3C, 23
00005547        jnz     ?_527                           ; 5547 _ 75, 15
00005549        mov     r8, qword ptr [rbp-48H]         ; 5549 _ 4C: 8B. 45, B8
0000554D        call    ?_447                           ; 554D _ E8, FFFFF767
00005552        jmp     ?_528                           ; 5552 _ EB, 12

?_526:
00005554        mov     r8, r12                         ; 5554 _ 4D: 89. E0
00005557        call    ?_449                           ; 5557 _ E8, FFFFF7DE
0000555C        jmp     ?_528                           ; 555C _ EB, 08

?_527:
0000555E        mov     r8, r12                         ; 555E _ 4D: 89. E0
00005561        call    ?_453                           ; 5561 _ E8, FFFFF8AB
?_528:
00005566        mov     rbx, rax                        ; 5566 _ 48: 89. C3
00005569        test    rbx, rbx                        ; 5569 _ 48: 85. DB
0000556C        mov     r15, rdi                        ; 556C _ 49: 89. FF
0000556F        jns     ?_523                           ; 556F _ 0F 89, FFFFFF1F
?_529:
00005575        mov     rax, qword ptr [?_889]          ; 5575 _ 48: 8B. 05, 0000572C(rel)
0000557C        mov     rcx, rsi                        ; 557C _ 48: 89. F1
0000557F        call    qword ptr [rax+48H]             ; 557F _ FF. 50, 48
?_530:
00005582        mov     rax, rbx                        ; 5582 _ 48: 89. D8
00005585        add     rsp, 56                         ; 5585 _ 48: 83. C4, 38
00005589        pop     rbx                             ; 5589 _ 5B
0000558A        pop     rdi                             ; 558A _ 5F
0000558B        pop     rsi                             ; 558B _ 5E
0000558C        pop     r12                             ; 558C _ 41: 5C
0000558E        pop     r13                             ; 558E _ 41: 5D
00005590        pop     r14                             ; 5590 _ 41: 5E
00005592        pop     r15                             ; 5592 _ 41: 5F
00005594        pop     rbp                             ; 5594 _ 5D
00005595        ret                                     ; 5595 _ C3

?_531:
00005596        mov     rbx, 9H                         ; 5596 _ 48: BB, 8000000000000009
000055A0        xor     esi, esi                        ; 55A0 _ 31. F6
000055A2        jmp     ?_529                           ; 55A2 _ EB, D1

?_532   LABEL NEAR
000055A4        push    rbp                             ; 55A4 _ 55
000055A5        mov     rbp, rsp                        ; 55A5 _ 48: 89. E5
000055A8        push    r15                             ; 55A8 _ 41: 57
000055AA        push    r14                             ; 55AA _ 41: 56
000055AC        push    r13                             ; 55AC _ 41: 55
000055AE        push    r12                             ; 55AE _ 41: 54
000055B0        push    rsi                             ; 55B0 _ 56
000055B1        push    rdi                             ; 55B1 _ 57
000055B2        push    rbx                             ; 55B2 _ 53
000055B3        sub     rsp, 1128                       ; 55B3 _ 48: 81. EC, 00000468
000055BA        mov     qword ptr [rbp-478H], r9        ; 55BA _ 4C: 89. 8D, FFFFFB88
000055C1        mov     rsi, r8                         ; 55C1 _ 4C: 89. C6
000055C4        mov     qword ptr [rbp-448H], 0         ; 55C4 _ 48: C7. 85, FFFFFBB8, 00000000
000055CF        mov     qword ptr [rbp-450H], 0         ; 55CF _ 48: C7. 85, FFFFFBB0, 00000000
000055DA        lea     r8, ptr [rbp-448H]              ; 55DA _ 4C: 8D. 85, FFFFFBB8
000055E1        lea     r9, ptr [rbp-450H]              ; 55E1 _ 4C: 8D. 8D, FFFFFBB0
000055E8        call    ?_522                           ; 55E8 _ E8, FFFFFE4D
000055ED        mov     r15, rax                        ; 55ED _ 49: 89. C7
000055F0        test    r15, r15                        ; 55F0 _ 4D: 85. FF
000055F3        jns     ?_534                           ; 55F3 _ 79, 18
?_533:
000055F5        mov     rdx, qword ptr [rbp-450H]       ; 55F5 _ 48: 8B. 95, FFFFFBB0
000055FC        mov     rcx, qword ptr [rbp-448H]       ; 55FC _ 48: 8B. 8D, FFFFFBB8
00005603        call    ?_460                           ; 5603 _ E8, FFFFF9C6
00005608        jmp     ?_544                           ; 5608 _ E9, 000003CA

?_534:
0000560D        mov     qword ptr [rsi], 0              ; 560D _ 48: C7. 06, 00000000
00005614        mov     rcx, qword ptr [rbp-448H]       ; 5614 _ 48: 8B. 8D, FFFFFBB8
0000561B        lea     rdx, ptr [?_803]                ; 561B _ 48: 8D. 15, 0000324A(rel)
00005622        lea     r8, ptr [?_804]                 ; 5622 _ 4C: 8D. 05, 00003248(rel)
00005629        lea     r9, ptr [rbp-40H]               ; 5629 _ 4C: 8D. 4D, C0
0000562D        call    ?_469                           ; 562D _ E8, FFFFFA42
00005632        test    rax, rax                        ; 5632 _ 48: 85. C0
00005635        js      ?_535                           ; 5635 _ 78, 0C
00005637        mov     rcx, qword ptr [rbp-40H]        ; 5637 _ 48: 8B. 4D, C0
0000563B        call    ?_479                           ; 563B _ E8, FFFFFAAF
00005640        mov     qword ptr [rsi], rax            ; 5640 _ 48: 89. 06
?_535:
00005643        mov     qword ptr [rbp-40H], 0          ; 5643 _ 48: C7. 45, C0, 00000000
0000564B        mov     rcx, qword ptr [rbp-448H]       ; 564B _ 48: 8B. 8D, FFFFFBB8
00005652        lea     rdx, ptr [?_803]                ; 5652 _ 48: 8D. 15, 00003213(rel)
00005659        lea     r8, ptr [?_805]                 ; 5659 _ 4C: 8D. 05, 0000321C(rel)
00005660        lea     r9, ptr [rbp-40H]               ; 5660 _ 4C: 8D. 4D, C0
00005664        call    ?_469                           ; 5664 _ E8, FFFFFA0B
00005669        mov     r15, rax                        ; 5669 _ 49: 89. C7
0000566C        test    r15, r15                        ; 566C _ 4D: 85. FF
0000566F        js      ?_533                           ; 566F _ 78, 84
00005671        mov     rcx, qword ptr [rbp-40H]        ; 5671 _ 48: 8B. 4D, C0
00005675        call    ?_491                           ; 5675 _ E8, FFFFFAFA
0000567A        test    rax, rax                        ; 567A _ 48: 85. C0
0000567D        jnz     ?_536                           ; 567D _ 75, 22
0000567F        mov     rdx, qword ptr [rbp-450H]       ; 567F _ 48: 8B. 95, FFFFFBB0
00005686        mov     rcx, qword ptr [rbp-448H]       ; 5686 _ 48: 8B. 8D, FFFFFBB8
0000568D        call    ?_460                           ; 568D _ E8, FFFFF93C
00005692        mov     r15, 0EH                        ; 5692 _ 49: BF, 800000000000000E
0000569C        jmp     ?_544                           ; 569C _ E9, 00000336

?_536:
000056A1        mov     r12, qword ptr [rbp+30H]        ; 56A1 _ 4C: 8B. 65, 30
000056A5        mov     rcx, qword ptr [rbp-478H]       ; 56A5 _ 48: 8B. 8D, FFFFFB88
000056AC        mov     qword ptr [rcx], rax            ; 56AC _ 48: 89. 01
000056AF        imul    rcx, rax, 104                   ; 56AF _ 48: 6B. C8, 68
000056B3        call    ?_007                           ; 56B3 _ E8, FFFFAC53
000056B8        mov     qword ptr [r12], rax            ; 56B8 _ 49: 89. 04 24
000056BC        test    rax, rax                        ; 56BC _ 48: 85. C0
000056BF        je      ?_545                           ; 56BF _ 0F 84, 00000329
000056C5        xor     esi, esi                        ; 56C5 _ 31. F6
000056C7        lea     r14, ptr [rbp-40H]              ; 56C7 _ 4C: 8D. 75, C0
000056CB        lea     rdi, ptr [rbp-460H]             ; 56CB _ 48: 8D. BD, FFFFFBA0
000056D2        lea     r13, ptr [rbp-440H]             ; 56D2 _ 4C: 8D. AD, FFFFFBC0
000056D9        mov     qword ptr [rbp-468H], 0         ; 56D9 _ 48: C7. 85, FFFFFB98, 00000000
000056E4        jmp     ?_542                           ; 56E4 _ E9, 0000011D

?_537:
000056E9        mov     rcx, qword ptr [rbp-40H]        ; 56E9 _ 48: 8B. 4D, C0
000056ED        call    ?_479                           ; 56ED _ E8, FFFFF9FD
000056F2        mov     rcx, qword ptr [r12]            ; 56F2 _ 49: 8B. 0C 24
000056F6        mov     qword ptr [rcx+rbx+48H], rax    ; 56F6 _ 48: 89. 44 19, 48
000056FB        mov     rcx, r13                        ; 56FB _ 4C: 89. E9
000056FE        mov     rdx, r15                        ; 56FE _ 4C: 89. FA
00005701        call    ?_028                           ; 5701 _ E8, FFFFADB8
00005706        mov     rcx, r13                        ; 5706 _ 4C: 89. E9
00005709        mov     rdx, rsi                        ; 5709 _ 48: 89. F2
0000570C        call    ?_504                           ; 570C _ E8, FFFFFB5F
00005711        mov     rcx, qword ptr [rbp-448H]       ; 5711 _ 48: 8B. 8D, FFFFFBB8
00005718        mov     rdx, rdi                        ; 5718 _ 48: 89. FA
0000571B        mov     r8, r13                         ; 571B _ 4D: 89. E8
0000571E        mov     r9, r14                         ; 571E _ 4D: 89. F1
00005721        call    ?_469                           ; 5721 _ E8, FFFFF94E
00005726        test    rax, rax                        ; 5726 _ 48: 85. C0
00005729        js      ?_538                           ; 5729 _ 78, 12
0000572B        mov     rcx, qword ptr [rbp-40H]        ; 572B _ 48: 8B. 4D, C0
0000572F        call    ?_479                           ; 572F _ E8, FFFFF9BB
00005734        mov     rcx, qword ptr [r12]            ; 5734 _ 49: 8B. 0C 24
00005738        mov     qword ptr [rcx+rbx+50H], rax    ; 5738 _ 48: 89. 44 19, 50
?_538:
0000573D        add     rbx, 16                         ; 573D _ 48: 83. C3, 10
00005741        inc     rsi                             ; 5741 _ 48: FF. C6
?_539:
00005744        cmp     rsi, 1                          ; 5744 _ 48: 83. FE, 01
00005748        ja      ?_540                           ; 5748 _ 77, 4E
0000574A        mov     rcx, r13                        ; 574A _ 4C: 89. E9
0000574D        lea     rdx, ptr [?_811]                ; 574D _ 48: 8D. 15, 00003164(rel)
00005754        call    ?_028                           ; 5754 _ E8, FFFFAD65
00005759        mov     rcx, r13                        ; 5759 _ 4C: 89. E9
0000575C        mov     rdx, rsi                        ; 575C _ 48: 89. F2
0000575F        call    ?_504                           ; 575F _ E8, FFFFFB0C
00005764        mov     rax, qword ptr [r12]            ; 5764 _ 49: 8B. 04 24
00005768        mov     qword ptr [rax+rbx+48H], 0      ; 5768 _ 48: C7. 44 18, 48, 00000000
00005771        mov     qword ptr [rax+rbx+50H], 0      ; 5771 _ 48: C7. 44 18, 50, 00000000
0000577A        mov     rcx, qword ptr [rbp-448H]       ; 577A _ 48: 8B. 8D, FFFFFBB8
00005781        mov     rdx, rdi                        ; 5781 _ 48: 89. FA
00005784        mov     r8, r13                         ; 5784 _ 4D: 89. E8
00005787        mov     r9, r14                         ; 5787 _ 4D: 89. F1
0000578A        call    ?_469                           ; 578A _ E8, FFFFF8E5
0000578F        test    rax, rax                        ; 578F _ 48: 85. C0
00005792        jns     ?_537                           ; 5792 _ 0F 89, FFFFFF51
?_540:
00005798        mov     rcx, qword ptr [rbp-448H]       ; 5798 _ 48: 8B. 8D, FFFFFBB8
0000579F        mov     rdx, rdi                        ; 579F _ 48: 89. FA
000057A2        lea     r8, ptr [?_813]                 ; 57A2 _ 4C: 8D. 05, 00003122(rel)
000057A9        mov     r9, r14                         ; 57A9 _ 4D: 89. F1
000057AC        call    ?_469                           ; 57AC _ E8, FFFFF8C3
000057B1        test    rax, rax                        ; 57B1 _ 48: 85. C0
000057B4        lea     rdi, ptr [rbp-460H]             ; 57B4 _ 48: 8D. BD, FFFFFBA0
000057BB        js      ?_541                           ; 57BB _ 78, 37
000057BD        mov     rcx, qword ptr [rbp-40H]        ; 57BD _ 48: 8B. 4D, C0
000057C1        mov     rdx, rdi                        ; 57C1 _ 48: 89. FA
000057C4        call    ?_507                           ; 57C4 _ E8, FFFFFAD5
000057C9        test    rax, rax                        ; 57C9 _ 48: 85. C0
000057CC        js      ?_541                           ; 57CC _ 78, 26
000057CE        mov     rax, qword ptr [r12]            ; 57CE _ 49: 8B. 04 24
000057D2        mov     rcx, qword ptr [rbp-468H]       ; 57D2 _ 48: 8B. 8D, FFFFFB98
000057D9        lea     rcx, ptr [rax+rcx+34H]          ; 57D9 _ 48: 8D. 4C 08, 34
000057DE        mov     rax, qword ptr [?_889]          ; 57DE _ 48: 8B. 05, 000054C3(rel)
000057E5        mov     rdx, rdi                        ; 57E5 _ 48: 89. FA
000057E8        mov     r8d, 16                         ; 57E8 _ 41: B8, 00000010
000057EE        call    qword ptr [rax+160H]            ; 57EE _ FF. 90, 00000160
?_541:
000057F4        add     qword ptr [rbp-468H], 104       ; 57F4 _ 48: 83. 85, FFFFFB98, 68
000057FC        mov     rsi, qword ptr [rbp-470H]       ; 57FC _ 48: 8B. B5, FFFFFB90
00005803        inc     rsi                             ; 5803 _ 48: FF. C6
?_542:
00005806        mov     rax, qword ptr [rbp-478H]       ; 5806 _ 48: 8B. 85, FFFFFB88
0000580D        cmp     rsi, qword ptr [rax]            ; 580D _ 48: 3B. 30
00005810        jnc     ?_543                           ; 5810 _ 0F 83, 000001AB
00005816        lea     rbx, ptr [rbp-240H]             ; 5816 _ 48: 8D. 9D, FFFFFDC0
0000581D        mov     rcx, rbx                        ; 581D _ 48: 89. D9
00005820        lea     rdx, ptr [?_806]                ; 5820 _ 48: 8D. 15, 00003061(rel)
00005827        call    ?_028                           ; 5827 _ E8, FFFFAC92
0000582C        mov     rcx, rbx                        ; 582C _ 48: 89. D9
0000582F        mov     rdx, rsi                        ; 582F _ 48: 89. F2
00005832        mov     qword ptr [rbp-470H], rsi       ; 5832 _ 48: 89. B5, FFFFFB90
00005839        call    ?_504                           ; 5839 _ E8, FFFFFA32
0000583E        mov     rcx, qword ptr [rbp-448H]       ; 583E _ 48: 8B. 8D, FFFFFBB8
00005845        lea     rdx, ptr [?_803]                ; 5845 _ 48: 8D. 15, 00003020(rel)
0000584C        mov     r8, rbx                         ; 584C _ 49: 89. D8
0000584F        mov     r9, r14                         ; 584F _ 4D: 89. F1
00005852        call    ?_469                           ; 5852 _ E8, FFFFF81D
00005857        mov     r15, rax                        ; 5857 _ 49: 89. C7
0000585A        test    r15, r15                        ; 585A _ 4D: 85. FF
0000585D        mov     rsi, r12                        ; 585D _ 4C: 89. E6
00005860        js      ?_533                           ; 5860 _ 0F 88, FFFFFD8F
00005866        mov     rbx, rdi                        ; 5866 _ 48: 89. FB
00005869        mov     rcx, qword ptr [rbp-448H]       ; 5869 _ 48: 8B. 8D, FFFFFBB8
00005870        mov     rdi, qword ptr [rbp-40H]        ; 5870 _ 48: 8B. 7D, C0
00005874        mov     rdx, rdi                        ; 5874 _ 48: 89. FA
00005877        lea     r8, ptr [?_807]                 ; 5877 _ 4C: 8D. 05, 00003011(rel)
0000587E        mov     r9, r14                         ; 587E _ 4D: 89. F1
00005881        call    ?_469                           ; 5881 _ E8, FFFFF7EE
00005886        mov     r15, rax                        ; 5886 _ 49: 89. C7
00005889        test    r15, r15                        ; 5889 _ 4D: 85. FF
0000588C        js      ?_533                           ; 588C _ 0F 88, FFFFFD63
00005892        mov     rcx, qword ptr [rbp-40H]        ; 5892 _ 48: 8B. 4D, C0
00005896        call    ?_491                           ; 5896 _ E8, FFFFF8D9
0000589B        cmp     rax, 6                          ; 589B _ 48: 83. F8, 06
0000589F        jnc     ?_533                           ; 589F _ 0F 83, FFFFFD50
000058A5        mov     r12, rbx                        ; 58A5 _ 49: 89. DC
000058A8        mov     rcx, qword ptr [rsi]            ; 58A8 _ 48: 8B. 0E
000058AB        mov     rdx, qword ptr [rbp-468H]       ; 58AB _ 48: 8B. 95, FFFFFB98
000058B2        mov     rbx, qword ptr [rbp-470H]       ; 58B2 _ 48: 8B. 9D, FFFFFB90
000058B9        mov     qword ptr [rcx+rdx], rbx        ; 58B9 _ 48: 89. 1C 11
000058BD        mov     dword ptr [rcx+rdx+8H], eax     ; 58BD _ 89. 44 11, 08
000058C1        mov     r9, r14                         ; 58C1 _ 4D: 89. F1
000058C4        mov     r14, rdx                        ; 58C4 _ 49: 89. D6
000058C7        mov     rcx, qword ptr [rbp-448H]       ; 58C7 _ 48: 8B. 8D, FFFFFBB8
000058CE        mov     rdx, rdi                        ; 58CE _ 48: 89. FA
000058D1        lea     r8, ptr [?_808]                 ; 58D1 _ 4C: 8D. 05, 00002FC2(rel)
000058D8        call    ?_469                           ; 58D8 _ E8, FFFFF797
000058DD        mov     r15, rax                        ; 58DD _ 49: 89. C7
000058E0        test    r15, r15                        ; 58E0 _ 4D: 85. FF
000058E3        js      ?_533                           ; 58E3 _ 0F 88, FFFFFD0C
000058E9        mov     rcx, qword ptr [rbp-40H]        ; 58E9 _ 48: 8B. 4D, C0
000058ED        call    ?_479                           ; 58ED _ E8, FFFFF7FD
000058F2        mov     rcx, qword ptr [rsi]            ; 58F2 _ 48: 8B. 0E
000058F5        mov     qword ptr [rcx+r14+10H], rax    ; 58F5 _ 4A: 89. 44 31, 10
000058FA        mov     rcx, qword ptr [rbp-448H]       ; 58FA _ 48: 8B. 8D, FFFFFBB8
00005901        mov     rdx, rdi                        ; 5901 _ 48: 89. FA
00005904        lea     r8, ptr [?_809]                 ; 5904 _ 4C: 8D. 05, 00002F9D(rel)
0000590B        lea     r9, ptr [rbp-40H]               ; 590B _ 4C: 8D. 4D, C0
0000590F        call    ?_469                           ; 590F _ E8, FFFFF760
00005914        mov     r15, rax                        ; 5914 _ 49: 89. C7
00005917        test    r15, r15                        ; 5917 _ 4D: 85. FF
0000591A        mov     rbx, r12                        ; 591A _ 4C: 89. E3
0000591D        js      ?_533                           ; 591D _ 0F 88, FFFFFCD2
00005923        mov     rcx, qword ptr [rbp-40H]        ; 5923 _ 48: 8B. 4D, C0
00005927        mov     rdx, rbx                        ; 5927 _ 48: 89. DA
0000592A        call    ?_507                           ; 592A _ E8, FFFFF96F
0000592F        mov     r15, rax                        ; 592F _ 49: 89. C7
00005932        test    r15, r15                        ; 5932 _ 4D: 85. FF
00005935        js      ?_533                           ; 5935 _ 0F 88, FFFFFCBA
0000593B        mov     rax, qword ptr [rsi]            ; 593B _ 48: 8B. 06
0000593E        lea     rcx, ptr [rax+r14+18H]          ; 593E _ 4A: 8D. 4C 30, 18
00005943        mov     rax, qword ptr [?_889]          ; 5943 _ 48: 8B. 05, 0000535E(rel)
0000594A        mov     rdx, rbx                        ; 594A _ 48: 89. DA
0000594D        mov     r8d, 16                         ; 594D _ 41: B8, 00000010
00005953        call    qword ptr [rax+160H]            ; 5953 _ FF. 90, 00000160
00005959        mov     rax, qword ptr [rsi]            ; 5959 _ 48: 8B. 06
0000595C        mov     rbx, rsi                        ; 595C _ 48: 89. F3
0000595F        mov     byte ptr [rax+r14+30H], 0       ; 595F _ 42: C6. 44 30, 30, 00
00005965        mov     rsi, r14                        ; 5965 _ 4C: 89. F6
00005968        mov     rcx, qword ptr [rbp-448H]       ; 5968 _ 48: 8B. 8D, FFFFFBB8
0000596F        mov     rdx, rdi                        ; 596F _ 48: 89. FA
00005972        lea     r8, ptr [?_810]                 ; 5972 _ 4C: 8D. 05, 00002F38(rel)
00005979        lea     r14, ptr [rbp-40H]              ; 5979 _ 4C: 8D. 75, C0
0000597D        mov     r9, r14                         ; 597D _ 4D: 89. F1
00005980        call    ?_469                           ; 5980 _ E8, FFFFF6EF
00005985        mov     r15, rax                        ; 5985 _ 49: 89. C7
00005988        test    r15, r15                        ; 5988 _ 4D: 85. FF
0000598B        js      ?_533                           ; 598B _ 0F 88, FFFFFC64
00005991        mov     rcx, qword ptr [rbp-40H]        ; 5991 _ 48: 8B. 4D, C0
00005995        call    ?_479                           ; 5995 _ E8, FFFFF755
0000599A        mov     r12, rbx                        ; 599A _ 49: 89. DC
0000599D        mov     rcx, qword ptr [r12]            ; 599D _ 49: 8B. 0C 24
000059A1        mov     rdx, rsi                        ; 59A1 _ 48: 89. F2
000059A4        mov     qword ptr [rcx+rdx+28H], rax    ; 59A4 _ 48: 89. 44 11, 28
000059A9        xor     esi, esi                        ; 59A9 _ 31. F6
000059AB        mov     rbx, rdx                        ; 59AB _ 48: 89. D3
000059AE        mov     qword ptr [rbp-468H], rdx       ; 59AE _ 48: 89. 95, FFFFFB98
000059B5        lea     r15, ptr [?_812]                ; 59B5 _ 4C: 8D. 3D, 00002F06(rel)
000059BC        jmp     ?_539                           ; 59BC _ E9, FFFFFD83

?_543:
000059C1        mov     rdx, qword ptr [rbp-450H]       ; 59C1 _ 48: 8B. 95, FFFFFBB0
000059C8        mov     rcx, qword ptr [rbp-448H]       ; 59C8 _ 48: 8B. 8D, FFFFFBB8
000059CF        call    ?_460                           ; 59CF _ E8, FFFFF5FA
000059D4        xor     r15d, r15d                      ; 59D4 _ 45: 31. FF
?_544:
000059D7        mov     rax, r15                        ; 59D7 _ 4C: 89. F8
000059DA        add     rsp, 1128                       ; 59DA _ 48: 81. C4, 00000468
000059E1        pop     rbx                             ; 59E1 _ 5B
000059E2        pop     rdi                             ; 59E2 _ 5F
000059E3        pop     rsi                             ; 59E3 _ 5E
000059E4        pop     r12                             ; 59E4 _ 41: 5C
000059E6        pop     r13                             ; 59E6 _ 41: 5D
000059E8        pop     r14                             ; 59E8 _ 41: 5E
000059EA        pop     r15                             ; 59EA _ 41: 5F
000059EC        pop     rbp                             ; 59EC _ 5D
000059ED        ret                                     ; 59ED _ C3

?_545:
000059EE        mov     rdx, qword ptr [rbp-450H]       ; 59EE _ 48: 8B. 95, FFFFFBB0
000059F5        mov     rcx, qword ptr [rbp-448H]       ; 59F5 _ 48: 8B. 8D, FFFFFBB8
000059FC        call    ?_460                           ; 59FC _ E8, FFFFF5CD
00005A01        mov     r15, 9H                         ; 5A01 _ 49: BF, 8000000000000009
00005A0B        jmp     ?_544                           ; 5A0B _ EB, CA

?_546   LABEL NEAR
00005A0D        push    rbp                             ; 5A0D _ 55
00005A0E        mov     rbp, rsp                        ; 5A0E _ 48: 89. E5
00005A11        push    rsi                             ; 5A11 _ 56
00005A12        sub     rsp, 40                         ; 5A12 _ 48: 83. EC, 28
00005A16        mov     rsi, r8                         ; 5A16 _ 4C: 89. C6
00005A19        mov     rax, 0AH                        ; 5A19 _ 48: B8, 800000000000000A
00005A23        cmp     qword ptr [rcx+20H], rdx        ; 5A23 _ 48: 39. 51, 20
00005A27        jnz     ?_547                           ; 5A27 _ 75, 2C
00005A29        mov     rax, qword ptr [?_891]          ; 5A29 _ 48: 8B. 05, 00005288(rel)
00005A30        lea     r8, ptr [rbp-10H]               ; 5A30 _ 4C: 8D. 45, F0
00005A34        call    qword ptr [rax+98H]             ; 5A34 _ FF. 90, 00000098
00005A3A        mov     rcx, qword ptr [rbp-10H]        ; 5A3A _ 48: 8B. 4D, F0
00005A3E        mov     rax, qword ptr [?_889]          ; 5A3E _ 48: 8B. 05, 00005263(rel)
00005A45        lea     rdx, ptr [?_823]                ; 5A45 _ 48: 8D. 15, 000049D0(rel)
00005A4C        mov     r8, rsi                         ; 5A4C _ 49: 89. F0
00005A4F        call    qword ptr [rax+98H]             ; 5A4F _ FF. 90, 00000098
?_547:
00005A55        add     rsp, 40                         ; 5A55 _ 48: 83. C4, 28
00005A59        pop     rsi                             ; 5A59 _ 5E
00005A5A        pop     rbp                             ; 5A5A _ 5D
00005A5B        ret                                     ; 5A5B _ C3

?_548   LABEL NEAR
00005A5C        push    rbp                             ; 5A5C _ 55
00005A5D        mov     rbp, rsp                        ; 5A5D _ 48: 89. E5
00005A60        push    rsi                             ; 5A60 _ 56
00005A61        sub     rsp, 56                         ; 5A61 _ 48: 83. EC, 38
00005A65        mov     esi, ecx                        ; 5A65 _ 89. CE
00005A67        mov     qword ptr [rbp-10H], 0          ; 5A67 _ 48: C7. 45, F0, 00000000
00005A6F        mov     rax, qword ptr [?_889]          ; 5A6F _ 48: 8B. 05, 00005232(rel)
00005A76        lea     rcx, ptr [?_818]                ; 5A76 _ 48: 8D. 0D, 0000494F(rel)
00005A7D        lea     r8, ptr [rbp-10H]               ; 5A7D _ 4C: 8D. 45, F0
00005A81        xor     edx, edx                        ; 5A81 _ 31. D2
00005A83        call    qword ptr [rax+140H]            ; 5A83 _ FF. 90, 00000140
00005A89        test    rax, rax                        ; 5A89 _ 48: 85. C0
00005A8C        js      ?_549                           ; 5A8C _ 78, 24
00005A8E        mov     rax, qword ptr [rbp-10H]        ; 5A8E _ 48: 8B. 45, F0
00005A92        lea     rdx, ptr [rbp-14H]              ; 5A92 _ 48: 8D. 55, EC
00005A96        mov     rcx, rax                        ; 5A96 _ 48: 89. C1
00005A99        xor     r8d, r8d                        ; 5A99 _ 45: 31. C0
00005A9C        xor     r9d, r9d                        ; 5A9C _ 45: 31. C9
00005A9F        call    qword ptr [rax]                 ; 5A9F _ FF. 10
00005AA1        cmp     dword ptr [rbp-14H], esi        ; 5AA1 _ 39. 75, EC
00005AA4        jz      ?_549                           ; 5AA4 _ 74, 0C
00005AA6        mov     rax, qword ptr [rbp-10H]        ; 5AA6 _ 48: 8B. 45, F0
00005AAA        mov     rcx, rax                        ; 5AAA _ 48: 89. C1
00005AAD        mov     edx, esi                        ; 5AAD _ 89. F2
00005AAF        call    qword ptr [rax+8H]              ; 5AAF _ FF. 50, 08
?_549:
00005AB2        add     rsp, 56                         ; 5AB2 _ 48: 83. C4, 38
00005AB6        pop     rsi                             ; 5AB6 _ 5E
00005AB7        pop     rbp                             ; 5AB7 _ 5D
00005AB8        ret                                     ; 5AB8 _ C3

?_550   LABEL NEAR
00005AB9        push    rbp                             ; 5AB9 _ 55
00005ABA        mov     rbp, rsp                        ; 5ABA _ 48: 89. E5
00005ABD        push    rsi                             ; 5ABD _ 56
00005ABE        sub     rsp, 120                        ; 5ABE _ 48: 83. EC, 78
00005AC2        mov     qword ptr [rbp-30H], 0          ; 5AC2 _ 48: C7. 45, D0, 00000000
00005ACA        mov     qword ptr [rbp-28H], 0          ; 5ACA _ 48: C7. 45, D8, 00000000
00005AD2        mov     qword ptr [rbp-20H], 0          ; 5AD2 _ 48: C7. 45, E0, 00000000
00005ADA        mov     byte ptr [rbp-49H], 1           ; 5ADA _ C6. 45, B7, 01
00005ADE        call    ?_076                           ; 5ADE _ E8, FFFFAE99
00005AE3        mov     rsi, rax                        ; 5AE3 _ 48: 89. C6
00005AE6        test    rsi, rsi                        ; 5AE6 _ 48: 85. F6
00005AE9        jne     ?_553                           ; 5AE9 _ 0F 85, 000001F1
00005AEF        mov     qword ptr [rbp-48H], 1          ; 5AEF _ 48: C7. 45, B8, 00000001
00005AF7        mov     rax, qword ptr [?_890]          ; 5AF7 _ 48: 8B. 05, 000051B2(rel)
00005AFE        lea     rcx, ptr [rbp-49H]              ; 5AFE _ 48: 8D. 4D, B7
00005B02        mov     qword ptr [rsp+20H], rcx        ; 5B02 _ 48: 89. 4C 24, 20
00005B07        lea     rcx, ptr [?_786]                ; 5B07 _ 48: 8D. 0D, 00002634(rel)
00005B0E        lea     rdx, ptr [?_839]                ; 5B0E _ 48: 8D. 15, 00004A07(rel)
00005B15        lea     r9, ptr [rbp-48H]               ; 5B15 _ 4C: 8D. 4D, B8
00005B19        xor     r8d, r8d                        ; 5B19 _ 45: 31. C0
00005B1C        call    qword ptr [rax+48H]             ; 5B1C _ FF. 50, 48
00005B1F        mov     qword ptr [rbp-10H], 0          ; 5B1F _ 48: C7. 45, F0, 00000000
00005B27        lea     rcx, ptr [?_835]                ; 5B27 _ 48: 8D. 0D, 000049AE(rel)
00005B2E        lea     r8, ptr [rbp-10H]               ; 5B2E _ 4C: 8D. 45, F0
00005B32        mov     rax, qword ptr [?_889]          ; 5B32 _ 48: 8B. 05, 0000516F(rel)
00005B39        xor     edx, edx                        ; 5B39 _ 31. D2
00005B3B        call    qword ptr [rax+140H]            ; 5B3B _ FF. 90, 00000140
00005B41        test    rax, rax                        ; 5B41 _ 48: 85. C0
00005B44        js      ?_551                           ; 5B44 _ 78, 12
00005B46        mov     rax, qword ptr [rbp-10H]        ; 5B46 _ 48: 8B. 45, F0
00005B4A        test    rax, rax                        ; 5B4A _ 48: 85. C0
00005B4D        jz      ?_551                           ; 5B4D _ 74, 09
00005B4F        lea     rcx, ptr [rbp-14H]              ; 5B4F _ 48: 8D. 4D, EC
00005B53        call    qword ptr [rax+8H]              ; 5B53 _ FF. 50, 08
00005B56        jmp     ?_552                           ; 5B56 _ EB, 22

?_551:
00005B58        mov     dword ptr [rsp+20H], 0          ; 5B58 _ C7. 44 24, 20, 00000000
00005B60        lea     rcx, ptr [rbp-14H]              ; 5B60 _ 48: 8D. 4D, EC
00005B64        mov     edx, 191                        ; 5B64 _ BA, 000000BF
00005B69        mov     r8d, 191                        ; 5B69 _ 41: B8, 000000BF
00005B6F        mov     r9d, 191                        ; 5B6F _ 41: B9, 000000BF
00005B75        call    ?_114                           ; 5B75 _ E8, FFFFB15E
?_552:
00005B7A        mov     edx, dword ptr [rbp-14H]        ; 5B7A _ 8B. 55, EC
00005B7D        lea     rcx, ptr [rbp-30H]              ; 5B7D _ 48: 8D. 4D, D0
00005B81        call    ?_097                           ; 5B81 _ E8, FFFFAFEA
00005B86        mov     rsi, rax                        ; 5B86 _ 48: 89. C6
00005B89        test    rsi, rsi                        ; 5B89 _ 48: 85. F6
00005B8C        jne     ?_553                           ; 5B8C _ 0F 85, 0000014E
00005B92        lea     rcx, ptr [?_846]                ; 5B92 _ 48: 8D. 0D, 000049F3(rel)
00005B99        lea     rdx, ptr [rbp-40H]              ; 5B99 _ 48: 8D. 55, C0
00005B9D        call    ?_108                           ; 5B9D _ E8, FFFFB096
00005BA2        mov     rsi, rax                        ; 5BA2 _ 48: 89. C6
00005BA5        test    rsi, rsi                        ; 5BA5 _ 48: 85. F6
00005BA8        jne     ?_553                           ; 5BA8 _ 0F 85, 00000132
00005BAE        mov     rax, qword ptr [rbp-30H]        ; 5BAE _ 48: 8B. 45, D0
00005BB2        mov     edx, dword ptr [rax+0CH]        ; 5BB2 _ 8B. 50, 0C
00005BB5        sub     edx, dword ptr [rbp-3CH]        ; 5BB5 _ 2B. 55, C4
00005BB8        mov     ecx, edx                        ; 5BB8 _ 89. D1
00005BBA        shr     ecx, 31                         ; 5BBA _ C1. E9, 1F
00005BBD        add     ecx, edx                        ; 5BBD _ 01. D1
00005BBF        sar     ecx, 1                          ; 5BBF _ D1. F9
00005BC1        mov     dword ptr [rbp-38H], ecx        ; 5BC1 _ 89. 4D, C8
00005BC4        lea     rcx, ptr [rbp-20H]              ; 5BC4 _ 48: 8D. 4D, E0
00005BC8        lea     rsi, ptr [?_846]                ; 5BC8 _ 48: 8D. 35, 000049BD(rel)
00005BCF        lea     r8, ptr [rbp-38H]               ; 5BCF _ 4C: 8D. 45, C8
00005BD3        mov     edx, dword ptr [rax+8H]         ; 5BD3 _ 8B. 50, 08
00005BD6        sub     edx, dword ptr [rbp-40H]        ; 5BD6 _ 2B. 55, C0
00005BD9        mov     eax, edx                        ; 5BD9 _ 89. D0
00005BDB        shr     eax, 31                         ; 5BDB _ C1. E8, 1F
00005BDE        add     eax, edx                        ; 5BDE _ 01. D0
00005BE0        sar     eax, 1                          ; 5BE0 _ D1. F8
00005BE2        mov     dword ptr [rbp-34H], eax        ; 5BE2 _ 89. 45, CC
00005BE5        mov     rdx, rsi                        ; 5BE5 _ 48: 89. F2
00005BE8        call    ?_084                           ; 5BE8 _ E8, FFFFAEA5
00005BED        mov     rsi, rax                        ; 5BED _ 48: 89. C6
00005BF0        test    rsi, rsi                        ; 5BF0 _ 48: 85. F6
00005BF3        jne     ?_553                           ; 5BF3 _ 0F 85, 000000E7
00005BF9        mov     rdx, qword ptr [rbp-20H]        ; 5BF9 _ 48: 8B. 55, E0
00005BFD        mov     rcx, qword ptr [rbp-30H]        ; 5BFD _ 48: 8B. 4D, D0
00005C01        call    ?_101                           ; 5C01 _ E8, FFFFAFA9
00005C06        mov     rsi, rax                        ; 5C06 _ 48: 89. C6
00005C09        test    rsi, rsi                        ; 5C09 _ 48: 85. F6
00005C0C        jne     ?_553                           ; 5C0C _ 0F 85, 000000CE
00005C12        mov     qword ptr [rbp-20H], 0          ; 5C12 _ 48: C7. 45, E0, 00000000
00005C1A        movzx   eax, byte ptr [rbp-49H]         ; 5C1A _ 0F B6. 45, B7
00005C1E        mov     qword ptr [rsp+20H], 0          ; 5C1E _ 48: C7. 44 24, 20, 00000000
00005C27        imul    edx, eax, 260                   ; 5C27 _ 69. D0, 00000104
00005C2D        lea     rcx, ptr [rbp-28H]              ; 5C2D _ 48: 8D. 4D, D8
00005C31        xor     r8d, r8d                        ; 5C31 _ 45: 31. C0
00005C34        mov     r9d, 100000                     ; 5C34 _ 41: B9, 000186A0
00005C3A        call    ?_123                           ; 5C3A _ E8, FFFFB201
00005C3F        mov     rsi, rax                        ; 5C3F _ 48: 89. C6
00005C42        test    rsi, rsi                        ; 5C42 _ 48: 85. F6
00005C45        jne     ?_553                           ; 5C45 _ 0F 85, 00000095
00005C4B        mov     rax, qword ptr [rbp-30H]        ; 5C4B _ 48: 8B. 45, D0
00005C4F        mov     r8d, dword ptr [rax+0CH]        ; 5C4F _ 44: 8B. 40, 0C
00005C53        mov     rcx, qword ptr [rbp-28H]        ; 5C53 _ 48: 8B. 4D, D8
00005C57        sub     r8d, dword ptr [rcx+38H]        ; 5C57 _ 44: 2B. 41, 38
00005C5B        mov     edx, r8d                        ; 5C5B _ 44: 89. C2
00005C5E        shr     edx, 31                         ; 5C5E _ C1. EA, 1F
00005C61        add     edx, r8d                        ; 5C61 _ 44: 01. C2
00005C64        sar     edx, 1                          ; 5C64 _ D1. FA
00005C66        mov     dword ptr [rbp-38H], edx        ; 5C66 _ 89. 55, C8
00005C69        lea     rdx, ptr [rbp-38H]              ; 5C69 _ 48: 8D. 55, C8
00005C6D        mov     eax, dword ptr [rax+8H]         ; 5C6D _ 8B. 40, 08
00005C70        sub     eax, dword ptr [rcx+34H]        ; 5C70 _ 2B. 41, 34
00005C73        movsxd  rax, eax                        ; 5C73 _ 48: 63. C0
00005C76        imul    rax, rax, 1374389535            ; 5C76 _ 48: 69. C0, 51EB851F
00005C7D        mov     rsi, rax                        ; 5C7D _ 48: 89. C6
00005C80        shr     rsi, 63                         ; 5C80 _ 48: C1. EE, 3F
00005C84        sar     rax, 37                         ; 5C84 _ 48: C1. F8, 25
00005C88        add     eax, esi                        ; 5C88 _ 01. F0
00005C8A        imul    eax, eax, 85                    ; 5C8A _ 6B. C0, 55
00005C8D        mov     dword ptr [rbp-34H], eax        ; 5C8D _ 89. 45, CC
00005C90        call    ?_089                           ; 5C90 _ E8, FFFFAE51
00005C95        mov     rsi, rax                        ; 5C95 _ 48: 89. C6
00005C98        test    rsi, rsi                        ; 5C98 _ 48: 85. F6
00005C9B        jnz     ?_553                           ; 5C9B _ 75, 43
00005C9D        mov     rdx, qword ptr [rbp-28H]        ; 5C9D _ 48: 8B. 55, D8
00005CA1        mov     rcx, qword ptr [rbp-30H]        ; 5CA1 _ 48: 8B. 4D, D0
00005CA5        call    ?_101                           ; 5CA5 _ E8, FFFFAF05
00005CAA        mov     rsi, rax                        ; 5CAA _ 48: 89. C6
00005CAD        test    rsi, rsi                        ; 5CAD _ 48: 85. F6
00005CB0        jnz     ?_553                           ; 5CB0 _ 75, 2E
00005CB2        mov     rax, qword ptr [rbp-28H]        ; 5CB2 _ 48: 8B. 45, D8
00005CB6        mov     qword ptr [?_873], rax          ; 5CB6 _ 48: 89. 05, 00004F83(rel)
00005CBD        mov     qword ptr [rbp-28H], 0          ; 5CBD _ 48: C7. 45, D8, 00000000
00005CC5        mov     rcx, qword ptr [rbp-30H]        ; 5CC5 _ 48: 8B. 4D, D0
00005CC9        call    ?_103                           ; 5CC9 _ E8, FFFFAF02
00005CCE        mov     rsi, rax                        ; 5CCE _ 48: 89. C6
00005CD1        test    rsi, rsi                        ; 5CD1 _ 48: 85. F6
00005CD4        jnz     ?_553                           ; 5CD4 _ 75, 0A
00005CD6        mov     qword ptr [rbp-30H], 0          ; 5CD6 _ 48: C7. 45, D0, 00000000
00005CDE        xor     esi, esi                        ; 5CDE _ 31. F6
?_553:
00005CE0        mov     rcx, qword ptr [rbp-28H]        ; 5CE0 _ 48: 8B. 4D, D8
00005CE4        test    rcx, rcx                        ; 5CE4 _ 48: 85. C9
00005CE7        jz      ?_554                           ; 5CE7 _ 74, 05
00005CE9        call    ?_087                           ; 5CE9 _ E8, FFFFADDA
?_554:
00005CEE        mov     rcx, qword ptr [rbp-30H]        ; 5CEE _ 48: 8B. 4D, D0
00005CF2        test    rcx, rcx                        ; 5CF2 _ 48: 85. C9
00005CF5        jz      ?_555                           ; 5CF5 _ 74, 05
00005CF7        call    ?_099                           ; 5CF7 _ E8, FFFFAE95
?_555:
00005CFC        mov     rax, rsi                        ; 5CFC _ 48: 89. F0
00005CFF        add     rsp, 120                        ; 5CFF _ 48: 83. C4, 78
00005D03        pop     rsi                             ; 5D03 _ 5E
00005D04        pop     rbp                             ; 5D04 _ 5D
00005D05        ret                                     ; 5D05 _ C3

?_556   LABEL NEAR
00005D06        push    rbp                             ; 5D06 _ 55
00005D07        mov     rbp, rsp                        ; 5D07 _ 48: 89. E5
00005D0A        sub     rsp, 48                         ; 5D0A _ 48: 83. EC, 30
00005D0E        test    dl, dl                          ; 5D0E _ 84. D2
00005D10        jz      ?_557                           ; 5D10 _ 74, 0F
00005D12        xor     ecx, ecx                        ; 5D12 _ 31. C9
00005D14        call    ?_548                           ; 5D14 _ E8, FFFFFD43
00005D19        mov     al, byte ptr [?_894]            ; 5D19 _ 8A. 05, 00004FA9(rel)
00005D1F        jmp     ?_561                           ; 5D1F _ EB, 5B

?_557:
00005D21        mov     rax, qword ptr [?_889]          ; 5D21 _ 48: 8B. 05, 00004F80(rel)
00005D28        lea     rdx, ptr [?_849]                ; 5D28 _ 48: 8D. 15, 00004881(rel)
00005D2F        lea     r8, ptr [rbp-8H]                ; 5D2F _ 4C: 8D. 45, F8
00005D33        call    qword ptr [rax+98H]             ; 5D33 _ FF. 90, 00000098
00005D39        test    rax, rax                        ; 5D39 _ 48: 85. C0
00005D3C        jns     ?_559                           ; 5D3C _ 79, 27
00005D3E        call    ?_550                           ; 5D3E _ E8, FFFFFD76
00005D43        test    rax, rax                        ; 5D43 _ 48: 85. C0
00005D46        js      ?_558                           ; 5D46 _ 78, 10
00005D48        mov     ecx, 1                          ; 5D48 _ B9, 00000001
00005D4D        call    ?_548                           ; 5D4D _ E8, FFFFFD0A
00005D52        xor     cl, cl                          ; 5D52 _ 30. C9
00005D54        mov     al, 1                           ; 5D54 _ B0, 01
00005D56        jmp     ?_560                           ; 5D56 _ EB, 18

?_558:
00005D58        xor     ecx, ecx                        ; 5D58 _ 31. C9
00005D5A        call    ?_548                           ; 5D5A _ E8, FFFFFCFD
00005D5F        xor     al, al                          ; 5D5F _ 30. C0
00005D61        mov     cl, al                          ; 5D61 _ 88. C1
00005D63        jmp     ?_560                           ; 5D63 _ EB, 0B

?_559:
00005D65        xor     ecx, ecx                        ; 5D65 _ 31. C9
00005D67        call    ?_548                           ; 5D67 _ E8, FFFFFCF0
00005D6C        mov     cl, 1                           ; 5D6C _ B1, 01
00005D6E        xor     al, al                          ; 5D6E _ 30. C0
?_560:
00005D70        mov     byte ptr [?_895], cl            ; 5D70 _ 88. 0D, 00004F53(rel)
00005D76        mov     byte ptr [?_894], al            ; 5D76 _ 88. 05, 00004F4C(rel)
?_561:
00005D7C        movzx   eax, al                         ; 5D7C _ 0F B6. C0
00005D7F        add     rsp, 48                         ; 5D7F _ 48: 83. C4, 30
00005D83        pop     rbp                             ; 5D83 _ 5D
00005D84        ret                                     ; 5D84 _ C3

?_562   LABEL NEAR
00005D85        test    rcx, rcx                        ; 5D85 _ 48: 85. C9
00005D88        js      ?_563                           ; 5D88 _ 78, 07
00005D8A        mov     qword ptr [?_896], rcx          ; 5D8A _ 48: 89. 0D, 00004F3F(rel)
?_563:
00005D91        cmp     byte ptr [?_894], 0             ; 5D91 _ 80. 3D, 00004F30(rel), 00
00005D98        jz      ?_564                           ; 5D98 _ 74, 0C
00005D9A        mov     rcx, qword ptr [?_873]          ; 5D9A _ 48: 8B. 0D, 00004E9F(rel)
00005DA1        test    rcx, rcx                        ; 5DA1 _ 48: 85. C9
00005DA4        jnz     ?_565                           ; 5DA4 _ 75, 01
?_564:
00005DA6        ret                                     ; 5DA6 _ C3

?_565:
00005DA7        mov     rdx, qword ptr [?_896]          ; 5DA7 _ 48: 8B. 15, 00004F22(rel)
00005DAE        jmp     ?_204                           ; 5DAE _ E9, FFFFC09D

?_566   LABEL NEAR
00005DB3        push    rbp                             ; 5DB3 _ 55
00005DB4        mov     rbp, rsp                        ; 5DB4 _ 48: 89. E5
00005DB7        push    rsi                             ; 5DB7 _ 56
00005DB8        sub     rsp, 72                         ; 5DB8 _ 48: 83. EC, 48
00005DBC        mov     esi, ecx                        ; 5DBC _ 89. CE
00005DBE        mov     rax, qword ptr [?_788]          ; 5DBE _ 48: 8B. 05, 00002397(rel)
; Note: Memory operand is misaligned. Performance penalty
00005DC5        mov     qword ptr [rbp-18H], rax        ; 5DC5 _ 48: 89. 45, E8
00005DC9        mov     rax, qword ptr [?_787]          ; 5DC9 _ 48: 8B. 05, 00002384(rel)
; Note: Memory operand is misaligned. Performance penalty
00005DD0        mov     qword ptr [rbp-20H], rax        ; 5DD0 _ 48: 89. 45, E0
00005DD4        mov     rax, qword ptr [?_889]          ; 5DD4 _ 48: 8B. 05, 00004ECD(rel)
00005DDB        lea     rcx, ptr [rbp-20H]              ; 5DDB _ 48: 8D. 4D, E0
00005DDF        lea     r8, ptr [rbp-28H]               ; 5DDF _ 4C: 8D. 45, D8
00005DE3        xor     edx, edx                        ; 5DE3 _ 31. D2
00005DE5        call    qword ptr [rax+140H]            ; 5DE5 _ FF. 90, 00000140
00005DEB        test    rax, rax                        ; 5DEB _ 48: 85. C0
00005DEE        js      ?_568                           ; 5DEE _ 78, 20
00005DF0        mov     rax, qword ptr [rbp-28H]        ; 5DF0 _ 48: 8B. 45, D8
00005DF4        test    sil, sil                        ; 5DF4 _ 40: 84. F6
00005DF7        jz      ?_567                           ; 5DF7 _ 74, 08
00005DF9        mov     rcx, rax                        ; 5DF9 _ 48: 89. C1
00005DFC        call    qword ptr [rax+8H]              ; 5DFC _ FF. 50, 08
00005DFF        jmp     ?_569                           ; 5DFF _ EB, 20

?_567:
00005E01        lea     rdx, ptr [rbp-0CH]              ; 5E01 _ 48: 8D. 55, F4
00005E05        lea     r8, ptr [rbp-10H]               ; 5E05 _ 4C: 8D. 45, F0
00005E09        mov     rcx, rax                        ; 5E09 _ 48: 89. C1
00005E0C        call    qword ptr [rax]                 ; 5E0C _ FF. 10
00005E0E        jmp     ?_569                           ; 5E0E _ EB, 11

?_568:
00005E10        mov     rcx, 0EH                        ; 5E10 _ 48: B9, 800000000000000E
00005E1A        cmp     rax, rcx                        ; 5E1A _ 48: 39. C8
00005E1D        jnz     ?_569                           ; 5E1D _ 75, 02
00005E1F        xor     eax, eax                        ; 5E1F _ 31. C0
?_569:
00005E21        add     rsp, 72                         ; 5E21 _ 48: 83. C4, 48
00005E25        pop     rsi                             ; 5E25 _ 5E
00005E26        pop     rbp                             ; 5E26 _ 5D
00005E27        ret                                     ; 5E27 _ C3

?_570   LABEL NEAR
00005E28        push    rbp                             ; 5E28 _ 55
00005E29        mov     rbp, rsp                        ; 5E29 _ 48: 89. E5
00005E2C        push    r15                             ; 5E2C _ 41: 57
00005E2E        push    r14                             ; 5E2E _ 41: 56
00005E30        push    r13                             ; 5E30 _ 41: 55
00005E32        push    r12                             ; 5E32 _ 41: 54
00005E34        push    rsi                             ; 5E34 _ 56
00005E35        push    rdi                             ; 5E35 _ 57
00005E36        push    rbx                             ; 5E36 _ 53
00005E37        sub     rsp, 120                        ; 5E37 _ 48: 83. EC, 78
00005E3B        mov     qword ptr [rbp-88H], r8         ; 5E3B _ 4C: 89. 85, FFFFFF78
00005E42        mov     qword ptr [rbp-70H], rdx        ; 5E42 _ 48: 89. 55, 90
00005E46        mov     rax, qword ptr [rcx+10H]        ; 5E46 _ 48: 8B. 41, 10
00005E4A        mov     qword ptr [rbp-68H], rcx        ; 5E4A _ 48: 89. 4D, 98
00005E4E        mov     qword ptr [rbp-40H], rax        ; 5E4E _ 48: 89. 45, C0
00005E52        mov     rax, qword ptr [?_874]          ; 5E52 _ 48: 8B. 05, 00004DEF(rel)
00005E59        test    rax, rax                        ; 5E59 _ 48: 85. C0
00005E5C        jnz     ?_571                           ; 5E5C _ 75, 1F
00005E5E        call    ?_642                           ; 5E5E _ E8, 0000099B
00005E63        mov     qword ptr [?_874], rax          ; 5E63 _ 48: 89. 05, 00004DDE(rel)
00005E6A        mov     rdi, 0EH                        ; 5E6A _ 48: BF, 800000000000000E
00005E74        test    rax, rax                        ; 5E74 _ 48: 85. C0
00005E77        je      ?_581                           ; 5E77 _ 0F 84, 00000218
?_571:
00005E7D        mov     ecx, dword ptr [rax+10H]        ; 5E7D _ 8B. 48, 10
00005E80        mov     qword ptr [rbp-50H], rcx        ; 5E80 _ 48: 89. 4D, B0
00005E84        call    ?_007                           ; 5E84 _ E8, FFFFA482
00005E89        mov     rdi, 9H                         ; 5E89 _ 48: BF, 8000000000000009
00005E93        test    rax, rax                        ; 5E93 _ 48: 85. C0
00005E96        mov     qword ptr [rbp-58H], rax        ; 5E96 _ 48: 89. 45, A8
00005E9A        je      ?_581                           ; 5E9A _ 0F 84, 000001F5
00005EA0        mov     rax, qword ptr [rbp-40H]        ; 5EA0 _ 48: 8B. 45, C0
00005EA4        mov     rcx, qword ptr [rbp-88H]        ; 5EA4 _ 48: 8B. 8D, FFFFFF78
00005EAB        lea     r15, ptr [rcx+rax-1H]           ; 5EAB _ 4C: 8D. 7C 01, FF
00005EB0        mov     qword ptr [rbp-90H], r15        ; 5EB0 _ 4C: 89. BD, FFFFFF70
00005EB7        xor     edi, edi                        ; 5EB7 _ 31. FF
00005EB9        mov     eax, 4294967295                 ; 5EB9 _ B8, FFFFFFFF
00005EBE        cmp     r15, rax                        ; 5EBE _ 49: 39. C7
00005EC1        mov     qword ptr [rbp-60H], rdi        ; 5EC1 _ 48: 89. 7D, A0
00005EC5        jnz     ?_572                           ; 5EC5 _ 75, 5C
00005EC7        mov     qword ptr [rbp-60H], 0          ; 5EC7 _ 48: C7. 45, A0, 00000000
00005ECF        cmp     byte ptr [?_892], 0             ; 5ECF _ 80. 3D, 00004DEA(rel), 00
00005ED6        jz      ?_572                           ; 5ED6 _ 74, 4B
00005ED8        mov     eax, dword ptr [?_893]          ; 5ED8 _ 8B. 05, 00004DE6(rel)
00005EDE        test    eax, eax                        ; 5EDE _ 85. C0
00005EE0        jz      ?_572                           ; 5EE0 _ 74, 41
00005EE2        mov     rax, qword ptr [rbp-68H]        ; 5EE2 _ 48: 8B. 45, 98
00005EE6        lea     rcx, ptr [rax+18H]              ; 5EE6 _ 48: 8D. 48, 18
00005EEA        lea     rdx, ptr [?_837]                ; 5EEA _ 48: 8D. 15, 0000460B(rel)
00005EF1        call    ?_018                           ; 5EF1 _ E8, FFFFA547
00005EF6        mov     qword ptr [rbp-60H], 0          ; 5EF6 _ 48: C7. 45, A0, 00000000
00005EFE        test    al, al                          ; 5EFE _ 84. C0
00005F00        jz      ?_572                           ; 5F00 _ 74, 21
00005F02        mov     eax, dword ptr [?_893]          ; 5F02 _ 8B. 05, 00004DBC(rel)
00005F08        mov     rsi, r15                        ; 5F08 _ 4C: 89. FE
00005F0B        sub     rsi, rax                        ; 5F0B _ 48: 29. C6
00005F0E        inc     rsi                             ; 5F0E _ 48: FF. C6
00005F11        lea     rcx, ptr [?_789]                ; 5F11 _ 48: 8D. 0D, 0000224C(rel)
00005F18        mov     edx, esi                        ; 5F18 _ 89. F2
00005F1A        mov     qword ptr [rbp-60H], rsi        ; 5F1A _ 48: 89. 75, A0
00005F1E        call    ?_121                           ; 5F1E _ E8, FFFFAEB2
?_572:
00005F23        mov     rsi, qword ptr [rbp-50H]        ; 5F23 _ 48: 8B. 75, B0
00005F27        neg     rsi                             ; 5F27 _ 48: F7. DE
00005F2A        and     rsi, qword ptr [rbp-40H]        ; 5F2A _ 48: 23. 75, C0
00005F2E        cmp     rsi, r15                        ; 5F2E _ 4C: 39. FE
00005F31        ja      ?_580                           ; 5F31 _ 0F 87, 00000150
00005F37        mov     rax, qword ptr [rbp-88H]        ; 5F37 _ 48: 8B. 85, FFFFFF78
00005F3E        add     rax, qword ptr [rbp-40H]        ; 5F3E _ 48: 03. 45, C0
00005F42        mov     qword ptr [rbp-88H], rax        ; 5F42 _ 48: 89. 85, FFFFFF78
00005F49        mov     r13, rsi                        ; 5F49 _ 49: 89. F5
00005F4C        neg     r13                             ; 5F4C _ 49: F7. DD
00005F4F        xor     r14d, r14d                      ; 5F4F _ 45: 31. F6
00005F52        mov     byte ptr [rbp-41H], 0           ; 5F52 _ C6. 45, BF, 00
?_573:
00005F56        mov     rax, qword ptr [rbp-88H]        ; 5F56 _ 48: 8B. 85, FFFFFF78
00005F5D        lea     r12, ptr [rax+r13]              ; 5F5D _ 4E: 8D. 24 28
00005F61        mov     rdi, qword ptr [rbp-50H]        ; 5F61 _ 48: 8B. 7D, B0
00005F65        lea     rax, ptr [rdi+rsi]              ; 5F65 _ 48: 8D. 04 37
00005F69        cmp     r15, rax                        ; 5F69 _ 49: 39. C7
00005F6C        mov     qword ptr [rbp-80H], rax        ; 5F6C _ 48: 89. 45, 80
00005F70        cmovnc  r12, rdi                        ; 5F70 _ 4C: 0F 43. E7
00005F74        lea     rax, ptr [r12+rsi]              ; 5F74 _ 49: 8D. 04 34
00005F78        mov     r15, rax                        ; 5F78 _ 49: 89. C7
00005F7B        mov     qword ptr [rbp-78H], rax        ; 5F7B _ 48: 89. 45, 88
00005F7F        mov     rbx, qword ptr [rbp-40H]        ; 5F7F _ 48: 8B. 5D, C0
00005F83        sub     r15, rbx                        ; 5F83 _ 49: 29. DF
00005F86        mov     rcx, rsi                        ; 5F86 _ 48: 89. F1
00005F89        mov     rdx, r15                        ; 5F89 _ 4C: 89. FA
00005F8C        call    ?_392                           ; 5F8C _ E8, FFFFE4B3
00005F91        mov     rax, rbx                        ; 5F91 _ 48: 89. D8
00005F94        sub     rax, r12                        ; 5F94 _ 4C: 29. E0
00005F97        add     rax, rdi                        ; 5F97 _ 48: 01. F8
00005F9A        cmp     rax, rsi                        ; 5F9A _ 48: 39. F0
00005F9D        jnz     ?_575                           ; 5F9D _ 75, 34
00005F9F        cmp     byte ptr [rbp-41H], 0           ; 5F9F _ 80. 7D, BF, 00
00005FA3        jnz     ?_574                           ; 5FA3 _ 75, 19
00005FA5        cmp     rsi, qword ptr [rbp-60H]        ; 5FA5 _ 48: 3B. 75, A0
00005FA9        jc      ?_574                           ; 5FA9 _ 72, 13
00005FAB        mov     al, byte ptr [?_892]            ; 5FAB _ 8A. 05, 00004D0F(rel)
00005FB1        test    al, al                          ; 5FB1 _ 84. C0
00005FB3        jz      ?_574                           ; 5FB3 _ 74, 09
00005FB5        call    ?_637                           ; 5FB5 _ E8, 000007B6
00005FBA        mov     byte ptr [rbp-41H], 1           ; 5FBA _ C6. 45, BF, 01
?_574:
00005FBE        mov     rax, qword ptr [rbp-70H]        ; 5FBE _ 48: 8B. 45, 90
00005FC2        lea     r9, ptr [rax+r14]               ; 5FC2 _ 4E: 8D. 0C 30
00005FC6        mov     rcx, qword ptr [rbp-68H]        ; 5FC6 _ 48: 8B. 4D, 98
00005FCA        mov     rdx, rsi                        ; 5FCA _ 48: 89. F2
00005FCD        mov     r8, qword ptr [rbp-50H]         ; 5FCD _ 4C: 8B. 45, B0
00005FD1        jmp     ?_577                           ; 5FD1 _ EB, 6C

?_575:
00005FD3        mov     rax, qword ptr [?_874]          ; 5FD3 _ 48: 8B. 05, 00004C6E(rel)
00005FDA        mov     rcx, rsi                        ; 5FDA _ 48: 89. F1
00005FDD        mov     rdx, qword ptr [rbp-58H]        ; 5FDD _ 48: 8B. 55, A8
00005FE1        call    qword ptr [rax+28H]             ; 5FE1 _ FF. 50, 28
00005FE4        mov     rdi, rax                        ; 5FE4 _ 48: 89. C7
00005FE7        test    rdi, rdi                        ; 5FE7 _ 48: 85. FF
00005FEA        jnz     ?_578                           ; 5FEA _ 75, 5B
00005FEC        mov     rax, qword ptr [rbp-70H]        ; 5FEC _ 48: 8B. 45, 90
00005FF0        lea     rdx, ptr [rax+r14]              ; 5FF0 _ 4A: 8D. 14 30
00005FF4        mov     rax, qword ptr [rbp-40H]        ; 5FF4 _ 48: 8B. 45, C0
00005FF8        lea     rcx, ptr [r13+rax]              ; 5FF8 _ 49: 8D. 4C 05, 00
00005FFD        add     rcx, qword ptr [rbp-58H]        ; 5FFD _ 48: 03. 4D, A8
00006001        mov     rax, qword ptr [?_889]          ; 6001 _ 48: 8B. 05, 00004CA0(rel)
00006008        mov     r8, r15                         ; 6008 _ 4D: 89. F8
0000600B        call    qword ptr [rax+160H]            ; 600B _ FF. 90, 00000160
00006011        cmp     byte ptr [rbp-41H], 0           ; 6011 _ 80. 7D, BF, 00
00006015        jnz     ?_576                           ; 6015 _ 75, 19
00006017        cmp     rsi, qword ptr [rbp-60H]        ; 6017 _ 48: 3B. 75, A0
0000601B        jc      ?_576                           ; 601B _ 72, 13
0000601D        mov     al, byte ptr [?_892]            ; 601D _ 8A. 05, 00004C9D(rel)
00006023        test    al, al                          ; 6023 _ 84. C0
00006025        jz      ?_576                           ; 6025 _ 74, 09
00006027        call    ?_637                           ; 6027 _ E8, 00000744
0000602C        mov     byte ptr [rbp-41H], 1           ; 602C _ C6. 45, BF, 01
?_576:
00006030        mov     rcx, qword ptr [rbp-68H]        ; 6030 _ 48: 8B. 4D, 98
00006034        mov     rdx, rsi                        ; 6034 _ 48: 89. F2
00006037        mov     r8, qword ptr [rbp-50H]         ; 6037 _ 4C: 8B. 45, B0
0000603B        mov     r9, qword ptr [rbp-58H]         ; 603B _ 4C: 8B. 4D, A8
?_577:
0000603F        call    ?_582                           ; 603F _ E8, 00000065
00006044        mov     rdi, rax                        ; 6044 _ 48: 89. C7
?_578:
00006047        test    rdi, rdi                        ; 6047 _ 48: 85. FF
0000604A        mov     r15, qword ptr [rbp-90H]        ; 604A _ 4C: 8B. BD, FFFFFF70
00006051        jnz     ?_579                           ; 6051 _ 75, 29
00006053        add     r12, r14                        ; 6053 _ 4D: 01. F4
00006056        sub     rsi, qword ptr [rbp-40H]        ; 6056 _ 48: 2B. 75, C0
0000605A        mov     r14, rsi                        ; 605A _ 49: 89. F6
0000605D        add     r14, r12                        ; 605D _ 4D: 01. E6
00006060        sub     r13, qword ptr [rbp-50H]        ; 6060 _ 4C: 2B. 6D, B0
00006064        mov     rax, qword ptr [rbp-80H]        ; 6064 _ 48: 8B. 45, 80
00006068        cmp     rax, r15                        ; 6068 _ 4C: 39. F8
0000606B        mov     rsi, rax                        ; 606B _ 48: 89. C6
0000606E        mov     rax, qword ptr [rbp-78H]        ; 606E _ 48: 8B. 45, 88
00006072        mov     qword ptr [rbp-40H], rax        ; 6072 _ 48: 89. 45, C0
00006076        jbe     ?_573                           ; 6076 _ 0F 86, FFFFFEDA
?_579:
0000607C        cmp     byte ptr [rbp-41H], 0           ; 607C _ 80. 7D, BF, 00
00006080        jz      ?_580                           ; 6080 _ 74, 05
00006082        call    ?_637                           ; 6082 _ E8, 000006E9
?_580:
00006087        mov     rax, qword ptr [?_889]          ; 6087 _ 48: 8B. 05, 00004C1A(rel)
0000608E        mov     rcx, qword ptr [rbp-58H]        ; 608E _ 48: 8B. 4D, A8
00006092        call    qword ptr [rax+48H]             ; 6092 _ FF. 50, 48
?_581:
00006095        mov     rax, rdi                        ; 6095 _ 48: 89. F8
00006098        add     rsp, 120                        ; 6098 _ 48: 83. C4, 78
0000609C        pop     rbx                             ; 609C _ 5B
0000609D        pop     rdi                             ; 609D _ 5F
0000609E        pop     rsi                             ; 609E _ 5E
0000609F        pop     r12                             ; 609F _ 41: 5C
000060A1        pop     r13                             ; 60A1 _ 41: 5D
000060A3        pop     r14                             ; 60A3 _ 41: 5E
000060A5        pop     r15                             ; 60A5 _ 41: 5F
000060A7        pop     rbp                             ; 60A7 _ 5D
000060A8        ret                                     ; 60A8 _ C3

?_582   LABEL NEAR
000060A9        push    rbp                             ; 60A9 _ 55
000060AA        mov     rbp, rsp                        ; 60AA _ 48: 89. E5
000060AD        push    r15                             ; 60AD _ 41: 57
000060AF        push    r14                             ; 60AF _ 41: 56
000060B1        push    rsi                             ; 60B1 _ 56
000060B2        push    rdi                             ; 60B2 _ 57
000060B3        push    rbx                             ; 60B3 _ 53
000060B4        sub     rsp, 40                         ; 60B4 _ 48: 83. EC, 28
000060B8        mov     r15, r9                         ; 60B8 _ 4D: 89. CF
000060BB        mov     rdi, rdx                        ; 60BB _ 48: 89. D7
000060BE        mov     r14, rcx                        ; 60BE _ 49: 89. CE
000060C1        mov     ebx, r8d                        ; 60C1 _ 44: 89. C3
000060C4        mov     rcx, rbx                        ; 60C4 _ 48: 89. D9
000060C7        call    ?_007                           ; 60C7 _ E8, FFFFA23F
000060CC        mov     rsi, rax                        ; 60CC _ 48: 89. C6
000060CF        mov     rax, 9H                         ; 60CF _ 48: B8, 8000000000000009
000060D9        test    rsi, rsi                        ; 60D9 _ 48: 85. F6
000060DC        jz      ?_583                           ; 60DC _ 74, 33
000060DE        mov     rax, qword ptr [?_874]          ; 60DE _ 48: 8B. 05, 00004B63(rel)
000060E5        mov     rcx, rdi                        ; 60E5 _ 48: 89. F9
000060E8        mov     rdx, rsi                        ; 60E8 _ 48: 89. F2
000060EB        call    qword ptr [rax+28H]             ; 60EB _ FF. 50, 28
000060EE        test    rax, rax                        ; 60EE _ 48: 85. C0
000060F1        jnz     ?_583                           ; 60F1 _ 75, 1E
000060F3        mov     qword ptr [rsp+20H], r14        ; 60F3 _ 4C: 89. 74 24, 20
000060F8        mov     rcx, rdi                        ; 60F8 _ 48: 89. F9
000060FB        mov     rdx, rbx                        ; 60FB _ 48: 89. DA
000060FE        mov     r8, r15                         ; 60FE _ 4D: 89. F8
00006101        mov     r9, rsi                         ; 6101 _ 49: 89. F1
00006104        call    ?_395                           ; 6104 _ E8, FFFFE400
00006109        mov     cl, al                          ; 6109 _ 88. C1
0000610B        xor     eax, eax                        ; 610B _ 31. C0
0000610D        test    cl, cl                          ; 610D _ 84. C9
0000610F        jz      ?_584                           ; 610F _ 74, 0D
?_583:
00006111        add     rsp, 40                         ; 6111 _ 48: 83. C4, 28
00006115        pop     rbx                             ; 6115 _ 5B
00006116        pop     rdi                             ; 6116 _ 5F
00006117        pop     rsi                             ; 6117 _ 5E
00006118        pop     r14                             ; 6118 _ 41: 5E
0000611A        pop     r15                             ; 611A _ 41: 5F
0000611C        pop     rbp                             ; 611C _ 5D
0000611D        ret                                     ; 611D _ C3

?_584:
0000611E        mov     ecx, 1                          ; 611E _ B9, 00000001
00006123        call    ?_416                           ; 6123 _ E8, FFFFE81D
00006128        mov     rax, qword ptr [?_874]          ; 6128 _ 48: 8B. 05, 00004B19(rel)
0000612F        mov     rax, qword ptr [rax+40H]        ; 612F _ 48: 8B. 40, 40
00006133        mov     rcx, rdi                        ; 6133 _ 48: 89. F9
00006136        mov     rdx, r15                        ; 6136 _ 4C: 89. FA
00006139        add     rsp, 40                         ; 6139 _ 48: 83. C4, 28
0000613D        pop     rbx                             ; 613D _ 5B
0000613E        pop     rdi                             ; 613E _ 5F
0000613F        pop     rsi                             ; 613F _ 5E
00006140        pop     r14                             ; 6140 _ 41: 5E
00006142        pop     r15                             ; 6142 _ 41: 5F
00006144        pop     rbp                             ; 6144 _ 5D
00006145        jmp     rax                             ; 6145 _ FF. E0

?_585   LABEL NEAR
00006147        push    rbp                             ; 6147 _ 55
00006148        mov     rbp, rsp                        ; 6148 _ 48: 89. E5
0000614B        push    r15                             ; 614B _ 41: 57
0000614D        push    r14                             ; 614D _ 41: 56
0000614F        push    r13                             ; 614F _ 41: 55
00006151        push    r12                             ; 6151 _ 41: 54
00006153        push    rsi                             ; 6153 _ 56
00006154        push    rdi                             ; 6154 _ 57
00006155        push    rbx                             ; 6155 _ 53
00006156        sub     rsp, 40                         ; 6156 _ 48: 83. EC, 28
0000615A        mov     rsi, rdx                        ; 615A _ 48: 89. D6
0000615D        mov     r15, rcx                        ; 615D _ 49: 89. CF
00006160        mov     rcx, qword ptr [?_874]          ; 6160 _ 48: 8B. 0D, 00004AE1(rel)
00006167        test    rcx, rcx                        ; 6167 _ 48: 85. C9
0000616A        jnz     ?_586                           ; 616A _ 75, 16
0000616C        call    ?_642                           ; 616C _ E8, 0000068D
00006171        mov     rcx, rax                        ; 6171 _ 48: 89. C1
00006174        mov     qword ptr [?_874], rcx          ; 6174 _ 48: 89. 0D, 00004ACD(rel)
0000617B        xor     eax, eax                        ; 617B _ 31. C0
0000617D        test    rcx, rcx                        ; 617D _ 48: 85. C9
00006180        jz      ?_590                           ; 6180 _ 74, 7E
?_586:
00006182        mov     r12d, dword ptr [rcx+10H]       ; 6182 _ 44: 8B. 61, 10
00006186        lea     rcx, ptr [r12+rsi]              ; 6186 _ 49: 8D. 0C 34
0000618A        call    ?_007                           ; 618A _ E8, FFFFA17C
0000618F        mov     r13, rax                        ; 618F _ 49: 89. C5
00006192        xor     eax, eax                        ; 6192 _ 31. C0
00006194        test    r13, r13                        ; 6194 _ 4D: 85. ED
00006197        jz      ?_590                           ; 6197 _ 74, 67
00006199        lea     rdi, ptr [r15+rsi-1H]           ; 6199 _ 49: 8D. 7C 37, FF
0000619E        mov     qword ptr [rbp-40H], rsi        ; 619E _ 48: 89. 75, C0
000061A2        mov     rsi, r12                        ; 61A2 _ 4C: 89. E6
000061A5        neg     rsi                             ; 61A5 _ 48: F7. DE
000061A8        and     rsi, r15                        ; 61A8 _ 4C: 21. FE
000061AB        cmp     rsi, rdi                        ; 61AB _ 48: 39. FE
000061AE        ja      ?_588                           ; 61AE _ 77, 2B
000061B0        lea     rbx, ptr [rsi+r12]              ; 61B0 _ 4A: 8D. 1C 26
000061B4        xor     r14d, r14d                      ; 61B4 _ 45: 31. F6
?_587:
000061B7        lea     rcx, ptr [rsi+r14]              ; 61B7 _ 4A: 8D. 0C 36
000061BB        lea     rdx, ptr [r13+r14]              ; 61BB _ 4B: 8D. 54 35, 00
000061C0        mov     rax, qword ptr [?_874]          ; 61C0 _ 48: 8B. 05, 00004A81(rel)
000061C7        call    qword ptr [rax+28H]             ; 61C7 _ FF. 50, 28
000061CA        test    rax, rax                        ; 61CA _ 48: 85. C0
000061CD        jnz     ?_588                           ; 61CD _ 75, 0C
000061CF        lea     rax, ptr [rbx+r14]              ; 61CF _ 4A: 8D. 04 33
000061D3        add     r14, r12                        ; 61D3 _ 4D: 01. E6
000061D6        cmp     rax, rdi                        ; 61D6 _ 48: 39. F8
000061D9        jbe     ?_587                           ; 61D9 _ 76, DC
?_588:
000061DB        cmp     rsi, r15                        ; 61DB _ 4C: 39. FE
000061DE        jz      ?_589                           ; 61DE _ 74, 1D
000061E0        sub     r15, rsi                        ; 61E0 _ 49: 29. F7
000061E3        add     r15, r13                        ; 61E3 _ 4D: 01. EF
000061E6        mov     rax, qword ptr [?_889]          ; 61E6 _ 48: 8B. 05, 00004ABB(rel)
000061ED        mov     rcx, r13                        ; 61ED _ 4C: 89. E9
000061F0        mov     rdx, r15                        ; 61F0 _ 4C: 89. FA
000061F3        mov     r8, qword ptr [rbp-40H]         ; 61F3 _ 4C: 8B. 45, C0
000061F7        call    qword ptr [rax+160H]            ; 61F7 _ FF. 90, 00000160
?_589:
000061FD        mov     rax, r13                        ; 61FD _ 4C: 89. E8
?_590:
00006200        add     rsp, 40                         ; 6200 _ 48: 83. C4, 28
00006204        pop     rbx                             ; 6204 _ 5B
00006205        pop     rdi                             ; 6205 _ 5F
00006206        pop     rsi                             ; 6206 _ 5E
00006207        pop     r12                             ; 6207 _ 41: 5C
00006209        pop     r13                             ; 6209 _ 41: 5D
0000620B        pop     r14                             ; 620B _ 41: 5E
0000620D        pop     r15                             ; 620D _ 41: 5F
0000620F        pop     rbp                             ; 620F _ 5D
00006210        ret                                     ; 6210 _ C3

?_591   LABEL NEAR
00006211        push    rbp                             ; 6211 _ 55
00006212        mov     rbp, rsp                        ; 6212 _ 48: 89. E5
00006215        push    r15                             ; 6215 _ 41: 57
00006217        push    r14                             ; 6217 _ 41: 56
00006219        push    r12                             ; 6219 _ 41: 54
0000621B        push    rsi                             ; 621B _ 56
0000621C        push    rdi                             ; 621C _ 57
0000621D        push    rbx                             ; 621D _ 53
0000621E        sub     rsp, 32                         ; 621E _ 48: 83. EC, 20
00006222        mov     r12, r8                         ; 6222 _ 4D: 89. C4
00006225        mov     r14, rdx                        ; 6225 _ 49: 89. D6
00006228        mov     rbx, rcx                        ; 6228 _ 48: 89. CB
0000622B        mov     rcx, qword ptr [rbx+10H]        ; 622B _ 48: 8B. 4B, 10
0000622F        mov     rdx, r12                        ; 622F _ 4C: 89. E2
00006232        call    ?_585                           ; 6232 _ E8, FFFFFF10
00006237        mov     rdi, rax                        ; 6237 _ 48: 89. C7
0000623A        test    rdi, rdi                        ; 623A _ 48: 85. FF
0000623D        jz      ?_592                           ; 623D _ 74, 31
0000623F        lea     rsi, ptr [rbx+34H]              ; 623F _ 48: 8D. 73, 34
00006243        mov     rcx, r14                        ; 6243 _ 4C: 89. F1
00006246        mov     rdx, rsi                        ; 6246 _ 48: 89. F2
00006249        call    ?_594                           ; 6249 _ E8, 0000005B
0000624E        mov     r15d, eax                       ; 624E _ 41: 89. C7
00006251        mov     rcx, rdi                        ; 6251 _ 48: 89. F9
00006254        mov     rdx, rsi                        ; 6254 _ 48: 89. F2
00006257        call    ?_594                           ; 6257 _ E8, 0000004D
0000625C        mov     esi, eax                        ; 625C _ 89. C6
0000625E        mov     rax, qword ptr [?_889]          ; 625E _ 48: 8B. 05, 00004A43(rel)
00006265        mov     rcx, rdi                        ; 6265 _ 48: 89. F9
00006268        call    qword ptr [rax+48H]             ; 6268 _ FF. 50, 48
0000626B        cmp     r15d, esi                       ; 626B _ 41: 39. F7
0000626E        jnz     ?_593                           ; 626E _ 75, 1D
?_592:
00006270        mov     rcx, qword ptr [rbx+10H]        ; 6270 _ 48: 8B. 4B, 10
00006274        mov     rdx, r12                        ; 6274 _ 4C: 89. E2
00006277        call    ?_392                           ; 6277 _ E8, FFFFE1C8
0000627C        xor     eax, eax                        ; 627C _ 31. C0
0000627E        add     rsp, 32                         ; 627E _ 48: 83. C4, 20
00006282        pop     rbx                             ; 6282 _ 5B
00006283        pop     rdi                             ; 6283 _ 5F
00006284        pop     rsi                             ; 6284 _ 5E
00006285        pop     r12                             ; 6285 _ 41: 5C
00006287        pop     r14                             ; 6287 _ 41: 5E
00006289        pop     r15                             ; 6289 _ 41: 5F
0000628B        pop     rbp                             ; 628B _ 5D
0000628C        ret                                     ; 628C _ C3

?_593:
0000628D        mov     rcx, rbx                        ; 628D _ 48: 89. D9
00006290        mov     rdx, r14                        ; 6290 _ 4C: 89. F2
00006293        mov     r8, r12                         ; 6293 _ 4D: 89. E0
00006296        add     rsp, 32                         ; 6296 _ 48: 83. C4, 20
0000629A        pop     rbx                             ; 629A _ 5B
0000629B        pop     rdi                             ; 629B _ 5F
0000629C        pop     rsi                             ; 629C _ 5E
0000629D        pop     r12                             ; 629D _ 41: 5C
0000629F        pop     r14                             ; 629F _ 41: 5E
000062A1        pop     r15                             ; 62A1 _ 41: 5F
000062A3        pop     rbp                             ; 62A3 _ 5D
000062A4        jmp     ?_570                           ; 62A4 _ E9, FFFFFB7F

?_594   LABEL NEAR
000062A9        push    rbp                             ; 62A9 _ 55
000062AA        mov     rbp, rsp                        ; 62AA _ 48: 89. E5
000062AD        push    r15                             ; 62AD _ 41: 57
000062AF        push    r14                             ; 62AF _ 41: 56
000062B1        push    r12                             ; 62B1 _ 41: 54
000062B3        push    rsi                             ; 62B3 _ 56
000062B4        push    rdi                             ; 62B4 _ 57
000062B5        push    rbx                             ; 62B5 _ 53
000062B6        sub     rsp, 32                         ; 62B6 _ 48: 83. EC, 20
000062BA        mov     r14, rdx                        ; 62BA _ 49: 89. D6
000062BD        mov     rsi, rcx                        ; 62BD _ 48: 89. CE
000062C0        movzx   r15d, word ptr [rsi+30H]        ; 62C0 _ 44: 0F B7. 7E, 30
000062C5        jmp     ?_597                           ; 62C5 _ EB, 14

?_595:
000062C7        mov     ecx, 8                          ; 62C7 _ B9, 00000008
000062CC        sub     ecx, r12d                       ; 62CC _ 44: 29. E1
000062CF        add     ecx, ebx                        ; 62CF _ 01. D9
?_596:
000062D1        xor     r8d, r8d                        ; 62D1 _ 45: 31. C0
000062D4        test    ecx, ecx                        ; 62D4 _ 85. C9
000062D6        jz      ?_602                           ; 62D6 _ 74, 79
000062D8        add     r15d, ecx                       ; 62D8 _ 41: 01. CF
?_597:
000062DB        mov     edi, r15d                       ; 62DB _ 44: 89. FF
000062DE        xor     r8d, r8d                        ; 62DE _ 45: 31. C0
000062E1        cmp     rdi, qword ptr [rsi+20H]        ; 62E1 _ 48: 3B. 7E, 20
000062E5        jnc     ?_602                           ; 62E5 _ 73, 6A
000062E7        mov     r12d, dword ptr [rdi+rsi+14H]   ; 62E7 _ 44: 8B. 64 37, 14
000062EC        mov     ebx, r12d                       ; 62EC _ 44: 89. E3
000062EF        and     ebx, 0FFFFFFH                   ; 62EF _ 81. E3, 00FFFFFF
000062F5        lea     rcx, ptr [rdi+rsi]              ; 62F5 _ 48: 8D. 0C 37
000062F9        mov     rdx, r14                        ; 62F9 _ 4C: 89. F2
000062FC        call    ?_018                           ; 62FC _ E8, FFFFA13C
00006301        test    al, al                          ; 6301 _ 84. C0
00006303        jnz     ?_598                           ; 6303 _ 75, 0A
00006305        and     r12d, 7H                        ; 6305 _ 41: 83. E4, 07
00006309        jnz     ?_595                           ; 6309 _ 75, BC
0000630B        mov     ecx, ebx                        ; 630B _ 89. D9
0000630D        jmp     ?_596                           ; 630D _ EB, C2

?_598:
0000630F        xor     r8d, r8d                        ; 630F _ 45: 31. C0
00006312        test    ebx, ebx                        ; 6312 _ 85. DB
00006314        jz      ?_602                           ; 6314 _ 74, 3B
00006316        lea     rcx, ptr [rsi+rdi+3EH]          ; 6316 _ 48: 8D. 4C 3E, 3E
0000631B        xor     r8d, r8d                        ; 631B _ 45: 31. C0
0000631E        xor     edx, edx                        ; 631E _ 31. D2
?_599:
00006320        lea     rax, ptr [rdx-4H]               ; 6320 _ 48: 8D. 42, FC
00006324        cmp     rax, 2                          ; 6324 _ 48: 83. F8, 02
00006328        jc      ?_601                           ; 6328 _ 72, 1E
0000632A        mov     al, byte ptr [rcx+rdx*2]        ; 632A _ 8A. 04 51
0000632D        mov     r9b, al                         ; 632D _ 41: 88. C1
00006330        add     r9b, -55                        ; 6330 _ 41: 80. C1, C9
00006334        add     al, -48                         ; 6334 _ 04, D0
00006336        cmp     al, 9                           ; 6336 _ 3C, 09
00006338        ja      ?_600                           ; 6338 _ 77, 03
0000633A        mov     r9b, al                         ; 633A _ 41: 88. C1
?_600:
0000633D        movzx   eax, r9b                        ; 633D _ 41: 0F B6. C1
00006341        shl     r8d, 4                          ; 6341 _ 41: C1. E0, 04
00006345        or      r8d, eax                        ; 6345 _ 41: 09. C0
?_601:
00006348        inc     rdx                             ; 6348 _ 48: FF. C2
0000634B        cmp     rdx, 8                          ; 634B _ 48: 83. FA, 08
0000634F        jnz     ?_599                           ; 634F _ 75, CF
?_602:
00006351        mov     eax, r8d                        ; 6351 _ 44: 89. C0
00006354        add     rsp, 32                         ; 6354 _ 48: 83. C4, 20
00006358        pop     rbx                             ; 6358 _ 5B
00006359        pop     rdi                             ; 6359 _ 5F
0000635A        pop     rsi                             ; 635A _ 5E
0000635B        pop     r12                             ; 635B _ 41: 5C
0000635D        pop     r14                             ; 635D _ 41: 5E
0000635F        pop     r15                             ; 635F _ 41: 5F
00006361        pop     rbp                             ; 6361 _ 5D
00006362        ret                                     ; 6362 _ C3

?_603   LABEL NEAR
00006363        push    rbp                             ; 6363 _ 55
00006364        mov     rbp, rsp                        ; 6364 _ 48: 89. E5
00006367        push    r14                             ; 6367 _ 41: 56
00006369        push    rsi                             ; 6369 _ 56
0000636A        push    rdi                             ; 636A _ 57
0000636B        push    rbx                             ; 636B _ 53
0000636C        sub     rsp, 32                         ; 636C _ 48: 83. EC, 20
00006370        mov     r14, r8                         ; 6370 _ 4D: 89. C6
00006373        mov     rdi, rdx                        ; 6373 _ 48: 89. D7
00006376        mov     rbx, rcx                        ; 6376 _ 48: 89. CB
00006379        xor     ecx, ecx                        ; 6379 _ 31. C9
0000637B        call    ?_566                           ; 637B _ E8, FFFFFA33
00006380        mov     rsi, rax                        ; 6380 _ 48: 89. C6
00006383        test    rsi, rsi                        ; 6383 _ 48: 85. F6
00006386        jz      ?_604                           ; 6386 _ 74, 11
00006388        lea     rcx, ptr [?_790]                ; 6388 _ 48: 8D. 0D, 00001E19(rel)
0000638F        mov     rdx, rsi                        ; 638F _ 48: 89. F2
00006392        call    ?_121                           ; 6392 _ E8, FFFFAA3E
00006397        jmp     ?_605                           ; 6397 _ EB, 20

?_604:
00006399        call    ?_627                           ; 6399 _ E8, 00000302
0000639E        mov     rcx, rbx                        ; 639E _ 48: 89. D9
000063A1        mov     rdx, rdi                        ; 63A1 _ 48: 89. FA
000063A4        mov     r8, r14                         ; 63A4 _ 4D: 89. F0
000063A7        call    ?_570                           ; 63A7 _ E8, FFFFFA7C
000063AC        mov     rsi, rax                        ; 63AC _ 48: 89. C6
000063AF        mov     ecx, 1                          ; 63AF _ B9, 00000001
000063B4        call    ?_566                           ; 63B4 _ E8, FFFFF9FA
?_605:
000063B9        mov     rax, rsi                        ; 63B9 _ 48: 89. F0
000063BC        add     rsp, 32                         ; 63BC _ 48: 83. C4, 20
000063C0        pop     rbx                             ; 63C0 _ 5B
000063C1        pop     rdi                             ; 63C1 _ 5F
000063C2        pop     rsi                             ; 63C2 _ 5E
000063C3        pop     r14                             ; 63C3 _ 41: 5E
000063C5        pop     rbp                             ; 63C5 _ 5D
000063C6        ret                                     ; 63C6 _ C3

?_606   LABEL NEAR
000063C7        push    rbp                             ; 63C7 _ 55
000063C8        mov     rbp, rsp                        ; 63C8 _ 48: 89. E5
000063CB        sub     rsp, 32                         ; 63CB _ 48: 83. EC, 20
000063CF        mov     eax, dword ptr [rcx+8H]         ; 63CF _ 8B. 41, 08
000063D2        cmp     eax, 5                          ; 63D2 _ 83. F8, 05
000063D5        jz      ?_608                           ; 63D5 _ 74, 1E
000063D7        cmp     eax, 4                          ; 63D7 _ 83. F8, 04
000063DA        jz      ?_607                           ; 63DA _ 74, 0F
000063DC        cmp     eax, 3                          ; 63DC _ 83. F8, 03
000063DF        jnz     ?_609                           ; 63DF _ 75, 1E
000063E1        add     rsp, 32                         ; 63E1 _ 48: 83. C4, 20
000063E5        pop     rbp                             ; 63E5 _ 5D
000063E6        jmp     ?_570                           ; 63E6 _ E9, FFFFFA3D

?_607:
000063EB        add     rsp, 32                         ; 63EB _ 48: 83. C4, 20
000063EF        pop     rbp                             ; 63EF _ 5D
000063F0        jmp     ?_591                           ; 63F0 _ E9, FFFFFE1C

?_608:
000063F5        add     rsp, 32                         ; 63F5 _ 48: 83. C4, 20
000063F9        pop     rbp                             ; 63F9 _ 5D
000063FA        jmp     ?_603                           ; 63FA _ E9, FFFFFF64

?_609:
000063FF        lea     rcx, ptr [?_791]                ; 63FF _ 48: 8D. 0D, 00001E1C(rel)
00006406        call    ?_121                           ; 6406 _ E8, FFFFA9CA
0000640B        mov     rax, 2H                         ; 640B _ 48: B8, 8000000000000002
00006415        add     rsp, 32                         ; 6415 _ 48: 83. C4, 20
00006419        pop     rbp                             ; 6419 _ 5D
0000641A        ret                                     ; 641A _ C3

0000641B        nop                                     ; 641B _ 90

?_610   LABEL NEAR
0000641C        push    rbp                             ; 641C _ 55
0000641D        mov     rbp, rsp                        ; 641D _ 48: 89. E5
00006420        push    r15                             ; 6420 _ 41: 57
00006422        push    r14                             ; 6422 _ 41: 56
00006424        push    r13                             ; 6424 _ 41: 55
00006426        push    r12                             ; 6426 _ 41: 54
00006428        push    rsi                             ; 6428 _ 56
00006429        push    rdi                             ; 6429 _ 57
0000642A        push    rbx                             ; 642A _ 53
0000642B        sub     rsp, 104                        ; 642B _ 48: 83. EC, 68
0000642F        mov     dword ptr [rbp-74H], 0          ; 642F _ C7. 45, 8C, 00000000
00006436        mov     rax, qword ptr [?_889]          ; 6436 _ 48: 8B. 05, 0000486B(rel)
0000643D        lea     rcx, ptr [rbp-48H]              ; 643D _ 48: 8D. 4D, B8
00006441        mov     qword ptr [rsp+20H], rcx        ; 6441 _ 48: 89. 4C 24, 20
00006446        lea     rdx, ptr [?_827]                ; 6446 _ 48: 8D. 15, 0000400F(rel)
0000644D        xor     ebx, ebx                        ; 644D _ 31. DB
0000644F        lea     r9, ptr [rbp-40H]               ; 644F _ 4C: 8D. 4D, C0
00006453        mov     ecx, 2                          ; 6453 _ B9, 00000002
00006458        xor     r8d, r8d                        ; 6458 _ 45: 31. C0
0000645B        call    qword ptr [rax+138H]            ; 645B _ FF. 90, 00000138
00006461        test    rax, rax                        ; 6461 _ 48: 85. C0
00006464        js      ?_614                           ; 6464 _ 0F 88, 000000CE
0000646A        mov     qword ptr [rbp-50H], 0          ; 646A _ 48: C7. 45, B0, 00000000
00006472        lea     r14, ptr [?_827]                ; 6472 _ 4C: 8D. 35, 00003FE3(rel)
00006479        lea     r15, ptr [rbp-50H]              ; 6479 _ 4C: 8D. 7D, B0
0000647D        lea     r13, ptr [rbp-70H]              ; 647D _ 4C: 8D. 6D, 90
00006481        lea     r12, ptr [rbp-58H]              ; 6481 _ 4C: 8D. 65, A8
00006485        lea     rsi, ptr [rbp-60H]              ; 6485 _ 48: 8D. 75, A0
00006489        lea     rdi, ptr [rbp-68H]              ; 6489 _ 48: 8D. 7D, 98
0000648D        jmp     ?_612                           ; 648D _ EB, 03

?_611:
0000648F        inc     rbx                             ; 648F _ 48: FF. C3
?_612:
00006492        cmp     rbx, qword ptr [rbp-40H]        ; 6492 _ 48: 3B. 5D, C0
00006496        jnc     ?_613                           ; 6496 _ 73, 5D
00006498        mov     rax, qword ptr [rbp-48H]        ; 6498 _ 48: 8B. 45, B8
0000649C        mov     rcx, qword ptr [rax+rbx*8]      ; 649C _ 48: 8B. 0C D8
000064A0        mov     rax, qword ptr [?_889]          ; 64A0 _ 48: 8B. 05, 00004801(rel)
000064A7        mov     rdx, r14                        ; 64A7 _ 4C: 89. F2
000064AA        mov     r8, r15                         ; 64AA _ 4D: 89. F8
000064AD        call    qword ptr [rax+98H]             ; 64AD _ FF. 90, 00000098
000064B3        test    rax, rax                        ; 64B3 _ 48: 85. C0
000064B6        js      ?_611                           ; 64B6 _ 78, D7
000064B8        mov     rax, qword ptr [rbp-50H]        ; 64B8 _ 48: 8B. 45, B0
000064BC        mov     qword ptr [rsp+20H], r13        ; 64BC _ 4C: 89. 6C 24, 20
000064C1        mov     rcx, rax                        ; 64C1 _ 48: 89. C1
000064C4        mov     rdx, r12                        ; 64C4 _ 4C: 89. E2
000064C7        mov     r8, rsi                         ; 64C7 _ 49: 89. F0
000064CA        mov     r9, rdi                         ; 64CA _ 49: 89. F9
000064CD        call    qword ptr [rax+70H]             ; 64CD _ FF. 50, 70
000064D0        test    rax, rax                        ; 64D0 _ 48: 85. C0
000064D3        js      ?_611                           ; 64D3 _ 78, BA
000064D5        mov     rax, qword ptr [rbp-58H]        ; 64D5 _ 48: 8B. 45, A8
000064D9        test    rax, rax                        ; 64D9 _ 48: 85. C0
000064DC        jnz     ?_611                           ; 64DC _ 75, B1
000064DE        mov     rax, qword ptr [rbp-60H]        ; 64DE _ 48: 8B. 45, A0
000064E2        test    rax, rax                        ; 64E2 _ 48: 85. C0
000064E5        jnz     ?_611                           ; 64E5 _ 75, A8
000064E7        cmp     qword ptr [rbp-68H], 31         ; 64E7 _ 48: 83. 7D, 98, 1F
000064EC        jnz     ?_611                           ; 64EC _ 75, A1
000064EE        cmp     qword ptr [rbp-70H], 0          ; 64EE _ 48: 83. 7D, 90, 00
000064F3        jnz     ?_611                           ; 64F3 _ 75, 9A
?_613:
000064F5        mov     rcx, qword ptr [rbp-48H]        ; 64F5 _ 48: 8B. 4D, B8
000064F9        mov     rax, qword ptr [?_889]          ; 64F9 _ 48: 8B. 05, 000047A8(rel)
00006500        call    qword ptr [rax+48H]             ; 6500 _ FF. 50, 48
00006503        mov     rax, qword ptr [rbp-50H]        ; 6503 _ 48: 8B. 45, B0
00006507        test    rax, rax                        ; 6507 _ 48: 85. C0
0000650A        jz      ?_614                           ; 650A _ 74, 2C
0000650C        lea     rcx, ptr [rbp-74H]              ; 650C _ 48: 8D. 4D, 8C
00006510        mov     qword ptr [rsp+20H], rcx        ; 6510 _ 48: 89. 4C 24, 20
00006515        mov     rcx, rax                        ; 6515 _ 48: 89. C1
00006518        mov     edx, 2                          ; 6518 _ BA, 00000002
0000651D        mov     r8d, 240                        ; 651D _ 41: B8, 000000F0
00006523        mov     r9d, 1                          ; 6523 _ 41: B9, 00000001
00006529        call    qword ptr [rax+30H]             ; 6529 _ FF. 50, 30
0000652C        test    rax, rax                        ; 652C _ 48: 85. C0
0000652F        js      ?_614                           ; 652F _ 78, 07
00006531        and     dword ptr [rbp-74H], 0FFFFC000H ; 6531 _ 81. 65, 8C, FFFFC000
?_614:
00006538        mov     eax, dword ptr [rbp-74H]        ; 6538 _ 8B. 45, 8C
0000653B        add     rsp, 104                        ; 653B _ 48: 83. C4, 68
0000653F        pop     rbx                             ; 653F _ 5B
00006540        pop     rdi                             ; 6540 _ 5F
00006541        pop     rsi                             ; 6541 _ 5E
00006542        pop     r12                             ; 6542 _ 41: 5C
00006544        pop     r13                             ; 6544 _ 41: 5D
00006546        pop     r14                             ; 6546 _ 41: 5E
00006548        pop     r15                             ; 6548 _ 41: 5F
0000654A        pop     rbp                             ; 654A _ 5D
0000654B        ret                                     ; 654B _ C3

?_615   LABEL NEAR
0000654C        push    rbp                             ; 654C _ 55
0000654D        mov     rbp, rsp                        ; 654D _ 48: 89. E5
00006550        sub     rsp, 64                         ; 6550 _ 48: 83. EC, 40
00006554        mov     rax, qword ptr [?_875]          ; 6554 _ 48: 8B. 05, 000046F5(rel)
0000655B        test    rax, rax                        ; 655B _ 48: 85. C0
0000655E        jne     ?_619                           ; 655E _ 0F 85, 0000008D
00006564        mov     qword ptr [rbp-10H], 0          ; 6564 _ 48: C7. 45, F0, 00000000
0000656C        mov     rax, qword ptr [?_889]          ; 656C _ 48: 8B. 05, 00004735(rel)
00006573        lea     rcx, ptr [rbp-10H]              ; 6573 _ 48: 8D. 4D, F0
00006577        mov     qword ptr [rsp+20H], rcx        ; 6577 _ 48: 89. 4C 24, 20
0000657C        lea     rdx, ptr [?_828]                ; 657C _ 48: 8D. 15, 00003EE9(rel)
00006583        lea     r9, ptr [rbp-8H]                ; 6583 _ 4C: 8D. 4D, F8
00006587        mov     ecx, 2                          ; 6587 _ B9, 00000002
0000658C        xor     r8d, r8d                        ; 658C _ 45: 31. C0
0000658F        call    qword ptr [rax+138H]            ; 658F _ FF. 90, 00000138
00006595        test    rax, rax                        ; 6595 _ 48: 85. C0
00006598        js      ?_616                           ; 6598 _ 78, 31
0000659A        mov     rax, qword ptr [rbp-8H]         ; 659A _ 48: 8B. 45, F8
0000659E        cmp     rax, 1                          ; 659E _ 48: 83. F8, 01
000065A2        jnz     ?_616                           ; 65A2 _ 75, 27
000065A4        mov     rax, qword ptr [rbp-10H]        ; 65A4 _ 48: 8B. 45, F0
000065A8        mov     rcx, qword ptr [rax]            ; 65A8 _ 48: 8B. 08
000065AB        mov     rax, qword ptr [?_889]          ; 65AB _ 48: 8B. 05, 000046F6(rel)
000065B2        lea     rdx, ptr [?_828]                ; 65B2 _ 48: 8D. 15, 00003EB3(rel)
000065B9        lea     r8, ptr [?_875]                 ; 65B9 _ 4C: 8D. 05, 00004690(rel)
000065C0        call    qword ptr [rax+98H]             ; 65C0 _ FF. 90, 00000098
000065C6        test    rax, rax                        ; 65C6 _ 48: 85. C0
000065C9        jz      ?_617                           ; 65C9 _ 74, 0C
?_616:
000065CB        lea     rcx, ptr [?_792]                ; 65CB _ 48: 8D. 0D, 00001CA6(rel)
000065D2        call    ?_121                           ; 65D2 _ E8, FFFFA7FE
?_617:
000065D7        mov     rcx, qword ptr [rbp-10H]        ; 65D7 _ 48: 8B. 4D, F0
000065DB        test    rcx, rcx                        ; 65DB _ 48: 85. C9
000065DE        jz      ?_618                           ; 65DE _ 74, 0A
000065E0        mov     rax, qword ptr [?_889]          ; 65E0 _ 48: 8B. 05, 000046C1(rel)
000065E7        call    qword ptr [rax+48H]             ; 65E7 _ FF. 50, 48
?_618:
000065EA        mov     rax, qword ptr [?_875]          ; 65EA _ 48: 8B. 05, 0000465F(rel)
?_619:
000065F1        add     rsp, 64                         ; 65F1 _ 48: 83. C4, 40
000065F5        pop     rbp                             ; 65F5 _ 5D
000065F6        ret                                     ; 65F6 _ C3

?_620   LABEL NEAR
000065F7        push    rbp                             ; 65F7 _ 55
000065F8        mov     rbp, rsp                        ; 65F8 _ 48: 89. E5
000065FB        sub     rsp, 48                         ; 65FB _ 48: 83. EC, 30
000065FF        cmp     dword ptr [?_876], 0            ; 65FF _ 83. 3D, 00004652(rel), 00
00006606        jnz     ?_622                           ; 6606 _ 75, 3B
00006608        call    ?_615                           ; 6608 _ E8, FFFFFF3F
0000660D        test    rax, rax                        ; 660D _ 48: 85. C0
00006610        jnz     ?_621                           ; 6610 _ 75, 0E
00006612        lea     rcx, ptr [?_798]                ; 6612 _ 48: 8D. 0D, 00001F33(rel)
00006619        call    ?_121                           ; 6619 _ E8, FFFFA7B7
0000661E        jmp     ?_622                           ; 661E _ EB, 23

?_621:
00006620        lea     rcx, ptr [?_876]                ; 6620 _ 48: 8D. 0D, 00004631(rel)
00006627        mov     qword ptr [rsp+20H], rcx        ; 6627 _ 48: 89. 4C 24, 20
0000662C        mov     rcx, rax                        ; 662C _ 48: 89. C1
0000662F        mov     edx, 2                          ; 662F _ BA, 00000002
00006634        mov     r8d, 2031616                    ; 6634 _ 41: B8, 001F0000
0000663A        mov     r9d, 1                          ; 663A _ 41: B9, 00000001
00006640        call    qword ptr [rax+38H]             ; 6640 _ FF. 50, 38
?_622:
00006643        mov     ecx, dword ptr [?_876]          ; 6643 _ 8B. 0D, 0000460F(rel)
00006649        mov     edx, ecx                        ; 6649 _ 89. CA
0000664B        and     edx, 0F000FFFFH                 ; 664B _ 81. E2, F000FFFF
00006651        xor     eax, eax                        ; 6651 _ 31. C0
00006653        cmp     edx, -1879015291                ; 6653 _ 81. FA, 90008085
00006659        jg      ?_623                           ; 6659 _ 7F, 0A
0000665B        cmp     edx, -2147450746                ; 665B _ 81. FA, 80008086
00006661        jz      ?_625                           ; 6661 _ 74, 2C
00006663        jmp     ?_626                           ; 6663 _ EB, 33

?_623:
00006665        cmp     edx, 268468357                  ; 6665 _ 81. FA, 10008085
0000666B        jg      ?_624                           ; 666B _ 7F, 0A
0000666D        cmp     edx, -1879015290                ; 666D _ 81. FA, 90008086
00006673        jz      ?_625                           ; 6673 _ 74, 1A
00006675        jmp     ?_626                           ; 6675 _ EB, 21

?_624:
00006677        cmp     edx, 268468358                  ; 6677 _ 81. FA, 10008086
0000667D        jz      ?_625                           ; 667D _ 74, 10
0000667F        cmp     edx, 536903814                  ; 667F _ 81. FA, 20008086
00006685        jz      ?_625                           ; 6685 _ 74, 08
00006687        cmp     edx, 805339270                  ; 6687 _ 81. FA, 30008086
0000668D        jnz     ?_626                           ; 668D _ 75, 09
?_625:
0000668F        shr     ecx, 24                         ; 668F _ C1. E9, 18
00006692        and     ecx, 0FH                        ; 6692 _ 83. E1, 0F
00006695        mov     rax, rcx                        ; 6695 _ 48: 89. C8
?_626:
00006698        add     rsp, 48                         ; 6698 _ 48: 83. C4, 30
0000669C        pop     rbp                             ; 669C _ 5D
0000669D        ret                                     ; 669D _ C3

0000669E        nop                                     ; 669E _ 90
0000669F        nop                                     ; 669F _ 90

?_627   LABEL NEAR
000066A0        push    rbp                             ; 66A0 _ 55
000066A1        mov     rbp, rsp                        ; 66A1 _ 48: 89. E5
000066A4        sub     rsp, 48                         ; 66A4 _ 48: 83. EC, 30
000066A8        mov     rax, qword ptr [?_890]          ; 66A8 _ 48: 8B. 05, 00004601(rel)
000066AF        mov     qword ptr [rsp+20H], 0          ; 66AF _ 48: C7. 44 24, 20, 00000000
000066B8        lea     rcx, ptr [?_793]                ; 66B8 _ 48: 8D. 0D, 00001CBB(rel)
000066BF        lea     rdx, ptr [?_829]                ; 66BF _ 48: 8D. 15, 00003DB6(rel)
000066C6        mov     r8d, 7                          ; 66C6 _ 41: B8, 00000007
000066CC        xor     r9d, r9d                        ; 66CC _ 45: 31. C9
000066CF        call    qword ptr [rax+58H]             ; 66CF _ FF. 50, 58
000066D2        mov     rcx, 0EH                        ; 66D2 _ 48: B9, 800000000000000E
000066DC        cmp     rax, rcx                        ; 66DC _ 48: 39. C8
000066DF        jz      ?_628                           ; 66DF _ 74, 14
000066E1        test    rax, rax                        ; 66E1 _ 48: 85. C0
000066E4        jz      ?_628                           ; 66E4 _ 74, 0F
000066E6        lea     rcx, ptr [?_794]                ; 66E6 _ 48: 8D. 0D, 00001CAF(rel)
000066ED        mov     rdx, rax                        ; 66ED _ 48: 89. C2
000066F0        call    ?_121                           ; 66F0 _ E8, FFFFA6E0
?_628:
000066F5        add     rsp, 48                         ; 66F5 _ 48: 83. C4, 30
000066F9        pop     rbp                             ; 66F9 _ 5D
000066FA        ret                                     ; 66FA _ C3

?_629   LABEL NEAR
000066FB        push    rbp                             ; 66FB _ 55
000066FC        mov     rbp, rsp                        ; 66FC _ 48: 89. E5
000066FF        push    rsi                             ; 66FF _ 56
00006700        sub     rsp, 40                         ; 6700 _ 48: 83. EC, 28
00006704        xor     esi, esi                        ; 6704 _ 31. F6
00006706        xor     edx, edx                        ; 6706 _ 31. D2
00006708        call    ?_661                           ; 6708 _ E8, 00000260
0000670D        shr     eax, 29                         ; 670D _ C1. E8, 1D
00006710        cmp     eax, 4                          ; 6710 _ 83. F8, 04
00006713        ja      ?_634                           ; 6713 _ 77, 31
00006715        mov     esi, 65536                      ; 6715 _ BE, 00010000
0000671A        lea     rcx, ptr [?_636]                ; 671A _ 48: 8D. 0D, 0000003B(rel)
00006721        movsxd  rax, dword ptr [rcx+rax*4]      ; 6721 _ 48: 63. 04 81
00006725        add     rax, rcx                        ; 6725 _ 48: 01. C8
00006728        jmp     rax                             ; 6728 _ FF. E0

?_630   LABEL NEAR
0000672A        mov     esi, 131072                     ; 672A _ BE, 00020000
0000672F        jmp     ?_635                           ; 672F _ EB, 21

?_631   LABEL NEAR
00006731        mov     esi, 262144                     ; 6731 _ BE, 00040000
00006736        jmp     ?_635                           ; 6736 _ EB, 1A

?_632   LABEL NEAR
00006738        mov     esi, 524288                     ; 6738 _ BE, 00080000
0000673D        jmp     ?_635                           ; 673D _ EB, 13

?_633   LABEL NEAR
0000673F        mov     esi, 1048576                    ; 673F _ BE, 00100000
00006744        jmp     ?_635                           ; 6744 _ EB, 0C

?_634:
00006746        lea     rcx, ptr [?_795]                ; 6746 _ 48: 8D. 0D, 00001CA9(rel)
0000674D        call    ?_121                           ; 674D _ E8, FFFFA683

?_635   LABEL NEAR
00006752        mov     eax, esi                        ; 6752 _ 89. F0
00006754        add     rsp, 40                         ; 6754 _ 48: 83. C4, 28
00006758        pop     rsi                             ; 6758 _ 5E
00006759        pop     rbp                             ; 6759 _ 5D
0000675A        ret                                     ; 675A _ C3

?_637   LABEL NEAR

; Filling space: 1H
; Filler type: NOP
;       db 90H

ALIGN   4

?_636   label dword                                     ; switch/case jump table
        dd ?_635-?_636                                  ; 675C _ FFFFFFF6 dd ?_630-?_636; 6760 _ FFFFFFCE dd ?_631-?_636; 6764 _ FFFFFFD5 dd ?_632-?_636; 6768 _ FFFFFFDC dd ?_633-?_636; 676C _ FFFFFFE3 00006770pushrbp; 6770 _ 55
00006771        mov     rbp, rsp                        ; 6771 _ 48: 89. E5
00006774        sub     rsp, 32                         ; 6774 _ 48: 83. EC, 20
00006778        call    ?_610                           ; 6778 _ E8, FFFFFC9F
0000677D        add     eax, 13332                      ; 677D _ 05, 00003414
00006782        mov     cl, byte ptr [rax]              ; 6782 _ 8A. 08
00006784        test    cl, 1H                          ; 6784 _ F6. C1, 01
00006787        jz      ?_639                           ; 6787 _ 74, 17
00006789        and     cl, 0FFFFFFFEH                  ; 6789 _ 80. E1, FE
0000678C        mov     byte ptr [rax], cl              ; 678C _ 88. 08
0000678E        lea     rcx, ptr [?_796]                ; 678E _ 48: 8D. 0D, 00001CA1(rel)
?_638:
00006795        call    ?_121                           ; 6795 _ E8, FFFFA63B
0000679A        add     rsp, 32                         ; 679A _ 48: 83. C4, 20
0000679E        pop     rbp                             ; 679E _ 5D
0000679F        ret                                     ; 679F _ C3

?_639:
000067A0        or      cl, 1H                          ; 67A0 _ 80. C9, 01
000067A3        mov     byte ptr [rax], cl              ; 67A3 _ 88. 08
000067A5        lea     rcx, ptr [?_797]                ; 67A5 _ 48: 8D. 0D, 00001D16(rel)
000067AC        jmp     ?_638                           ; 67AC _ EB, E7

?_640   LABEL NEAR
000067AE        push    rbp                             ; 67AE _ 55
000067AF        mov     rbp, rsp                        ; 67AF _ 48: 89. E5
000067B2        sub     rsp, 48                         ; 67B2 _ 48: 83. EC, 30
000067B6        mov     qword ptr [rbp-8H], 0           ; 67B6 _ 48: C7. 45, F8, 00000000
000067BE        mov     rax, qword ptr [?_889]          ; 67BE _ 48: 8B. 05, 000044E3(rel)
000067C5        lea     rcx, ptr [?_850]                ; 67C5 _ 48: 8D. 0D, 00003DF4(rel)
000067CC        lea     r8, ptr [rbp-8H]                ; 67CC _ 4C: 8D. 45, F8
000067D0        xor     edx, edx                        ; 67D0 _ 31. D2
000067D2        call    qword ptr [rax+140H]            ; 67D2 _ FF. 90, 00000140
000067D8        test    rax, rax                        ; 67D8 _ 48: 85. C0
000067DB        jnz     ?_641                           ; 67DB _ 75, 1B
000067DD        mov     r8, qword ptr [rbp-8H]          ; 67DD _ 4C: 8B. 45, F8
000067E1        cmp     dword ptr [r8], 2               ; 67E1 _ 41: 83. 38, 02
000067E5        mov     eax, 0                          ; 67E5 _ B8, 00000000
000067EA        jc      ?_641                           ; 67EA _ 72, 0C
000067EC        mov     rcx, r8                         ; 67EC _ 4C: 89. C1
000067EF        mov     edx, 1                          ; 67EF _ BA, 00000001
000067F4        call    qword ptr [r8+28H]              ; 67F4 _ 41: FF. 50, 28
?_641:
000067F8        add     rsp, 48                         ; 67F8 _ 48: 83. C4, 30
000067FC        pop     rbp                             ; 67FC _ 5D
000067FD        ret                                     ; 67FD _ C3

?_642   LABEL NEAR
000067FE        jmp     ?_644                           ; 67FE _ E9, 00000005
; Note: Immediate operand could be made smaller by sign extension

?_643   LABEL NEAR
00006803        jmp     ?_640                           ; 6803 _ E9, FFFFFFA6
; Note: Immediate operand could be made smaller by sign extension

?_644   LABEL NEAR
00006808        push    rbp                             ; 6808 _ 55
00006809        mov     rbp, rsp                        ; 6809 _ 48: 89. E5
0000680C        sub     rsp, 32                         ; 680C _ 48: 83. EC, 20
00006810        call    ?_664                           ; 6810 _ E8, 00000183
00006815        test    rax, rax                        ; 6815 _ 48: 85. C0
00006818        jnz     ?_645                           ; 6818 _ 75, 14
0000681A        call    ?_692                           ; 681A _ E8, 0000073B
0000681F        test    rax, rax                        ; 681F _ 48: 85. C0
00006822        jnz     ?_645                           ; 6822 _ 75, 0A
00006824        call    ?_715                           ; 6824 _ E8, 00000C79
00006829        test    rax, rax                        ; 6829 _ 48: 85. C0
0000682C        jz      ?_646                           ; 682C _ 74, 06
?_645:
0000682E        add     rsp, 32                         ; 682E _ 48: 83. C4, 20
00006832        pop     rbp                             ; 6832 _ 5D
00006833        ret                                     ; 6833 _ C3

?_646:
00006834        add     rsp, 32                         ; 6834 _ 48: 83. C4, 20
00006838        pop     rbp                             ; 6838 _ 5D
00006839        jmp     ?_734                           ; 6839 _ E9, 000010C7

?_647   LABEL NEAR
0000683E        push    rbp                             ; 683E _ 55
0000683F        mov     rbp, rsp                        ; 683F _ 48: 89. E5
00006842        push    rsi                             ; 6842 _ 56
00006843        sub     rsp, 40                         ; 6843 _ 48: 83. EC, 28
00006847        cmp     dword ptr [?_877], 0            ; 6847 _ 83. 3D, 0000440E(rel), 00
0000684E        jnz     ?_648                           ; 684E _ 75, 2E
00006850        call    ?_610                           ; 6850 _ E8, FFFFFBC7
00006855        mov     esi, eax                        ; 6855 _ 89. C6
00006857        lea     eax, ptr [rsi+3020H]            ; 6857 _ 8D. 86, 00003020
0000685D        mov     dword ptr [?_877], eax          ; 685D _ 89. 05, 000043F9(rel)
00006863        call    ?_620                           ; 6863 _ E8, FFFFFD8F
00006868        add     rax, -9                         ; 6868 _ 48: 83. C0, F7
0000686C        cmp     rax, 5                          ; 686C _ 48: 83. F8, 05
00006870        ja      ?_648                           ; 6870 _ 77, 0C
00006872        add     esi, 14336                      ; 6872 _ 81. C6, 00003800
00006878        mov     dword ptr [?_877], esi          ; 6878 _ 89. 35, 000043DE(rel)
?_648:
0000687E        add     rsp, 40                         ; 687E _ 48: 83. C4, 28
00006882        pop     rsi                             ; 6882 _ 5E
00006883        pop     rbp                             ; 6883 _ 5D
00006884        ret                                     ; 6884 _ C3

?_649   LABEL NEAR
00006885        push    rbp                             ; 6885 _ 55
00006886        mov     rbp, rsp                        ; 6886 _ 48: 89. E5
00006889        push    rsi                             ; 6889 _ 56
0000688A        sub     rsp, 40                         ; 688A _ 48: 83. EC, 28
0000688E        mov     rsi, rcx                        ; 688E _ 48: 89. CE
00006891        call    ?_647                           ; 6891 _ E8, FFFFFFA8
00006896        mov     eax, dword ptr [?_877]          ; 6896 _ 8B. 05, 000043C0(rel)
0000689C        movzx   eax, byte ptr [rax+rsi]         ; 689C _ 0F B6. 04 30
000068A0        add     rsp, 40                         ; 68A0 _ 48: 83. C4, 28
000068A4        pop     rsi                             ; 68A4 _ 5E
000068A5        pop     rbp                             ; 68A5 _ 5D
000068A6        ret                                     ; 68A6 _ C3

?_650   LABEL NEAR
000068A7        push    rbp                             ; 68A7 _ 55
000068A8        mov     rbp, rsp                        ; 68A8 _ 48: 89. E5
000068AB        sub     rsp, 32                         ; 68AB _ 48: 83. EC, 20
000068AF        call    ?_620                           ; 68AF _ E8, FFFFFD43
000068B4        cmp     rax, 8                          ; 68B4 _ 48: 83. F8, 08
000068B8        jnc     ?_651                           ; 68B8 _ 73, 04
000068BA        xor     al, al                          ; 68BA _ 30. C0
000068BC        jmp     ?_652                           ; 68BC _ EB, 14

?_651:
000068BE        call    ?_647                           ; 68BE _ E8, FFFFFF7B
000068C3        mov     eax, dword ptr [?_877]          ; 68C3 _ 8B. 05, 00004393(rel)
000068C9        movzx   eax, word ptr [rax+4H]          ; 68C9 _ 0F B7. 40, 04
000068CD        shr     eax, 14                         ; 68CD _ C1. E8, 0E
000068D0        and     al, 1H                          ; 68D0 _ 24, 01
?_652:
000068D2        movzx   eax, al                         ; 68D2 _ 0F B6. C0
000068D5        add     rsp, 32                         ; 68D5 _ 48: 83. C4, 20
000068D9        pop     rbp                             ; 68D9 _ 5D
000068DA        ret                                     ; 68DA _ C3

?_653   LABEL NEAR
000068DB        push    rbp                             ; 68DB _ 55
000068DC        mov     rbp, rsp                        ; 68DC _ 48: 89. E5
000068DF        push    rsi                             ; 68DF _ 56
000068E0        sub     rsp, 40                         ; 68E0 _ 48: 83. EC, 28
000068E4        call    ?_620                           ; 68E4 _ E8, FFFFFD0E
000068E9        xor     ecx, ecx                        ; 68E9 _ 31. C9
000068EB        test    rax, rax                        ; 68EB _ 48: 85. C0
000068EE        jz      ?_655                           ; 68EE _ 74, 48
000068F0        mov     esi, 96                         ; 68F0 _ BE, 00000060
000068F5        cmp     rax, 7                          ; 68F5 _ 48: 83. F8, 07
000068F9        jz      ?_654                           ; 68F9 _ 74, 0F
000068FB        add     rax, -8                         ; 68FB _ 48: 83. C0, F8
000068FF        cmp     rax, 6                          ; 68FF _ 48: 83. F8, 06
00006903        ja      ?_656                           ; 6903 _ 77, 3D
00006905        mov     esi, 116                        ; 6905 _ BE, 00000074
?_654:
0000690A        call    ?_647                           ; 690A _ E8, FFFFFF2F
0000690F        mov     eax, dword ptr [?_877]          ; 690F _ 8B. 05, 00004347(rel)
00006915        mov     ecx, dword ptr [rax+rsi]        ; 6915 _ 8B. 0C 30
00006918        test    ecx, 7FFFFFFFH                  ; 6918 _ F7. C1, 7FFFFFFF
0000691E        sete    al                              ; 691E _ 0F 94. C0
00006921        test    ecx, ecx                        ; 6921 _ 85. C9
00006923        setns   cl                              ; 6923 _ 0F 99. C1
00006926        xor     edx, edx                        ; 6926 _ 31. D2
00006928        or      cl, al                          ; 6928 _ 08. C1
0000692A        mov     rcx, 8H                         ; 692A _ 48: B9, 8000000000000008
00006934        cmovne  rcx, rdx                        ; 6934 _ 48: 0F 45. CA
?_655:
00006938        mov     rax, rcx                        ; 6938 _ 48: 89. C8
0000693B        add     rsp, 40                         ; 693B _ 48: 83. C4, 28
0000693F        pop     rsi                             ; 693F _ 5E
00006940        pop     rbp                             ; 6940 _ 5D
00006941        ret                                     ; 6941 _ C3

?_656:
00006942        mov     rcx, 0EH                        ; 6942 _ 48: B9, 800000000000000E
0000694C        jmp     ?_655                           ; 694C _ EB, EA

?_657   LABEL NEAR
0000694E        lea     rdx, ptr [?_851]                ; 694E _ 48: 8D. 15, 00003C7B(rel)
00006955        jmp     ?_659                           ; 6955 _ EB, 04

?_658:
00006957        add     rdx, 80                         ; 6957 _ 48: 83. C2, 50
?_659:
0000695B        xor     eax, eax                        ; 695B _ 31. C0
0000695D        cmp     qword ptr [rdx], 0              ; 695D _ 48: 83. 3A, 00
00006961        jz      ?_660                           ; 6961 _ 74, 09
00006963        cmp     word ptr [rdx+8H], cx           ; 6963 _ 66: 39. 4A, 08
00006967        mov     rax, rdx                        ; 6967 _ 48: 89. D0
0000696A        jnz     ?_658                           ; 696A _ 75, EB
?_660:
0000696C        ret                                     ; 696C _ C3

?_661   LABEL NEAR
0000696D        cmp     dword ptr [rcx], 267429210      ; 696D _ 81. 39, 0FF0A55A
00006973        mov     rax, rcx                        ; 6973 _ 48: 89. C8
00006976        jz      ?_662                           ; 6976 _ 74, 0F
00006978        xor     eax, eax                        ; 6978 _ 31. C0
0000697A        cmp     dword ptr [rcx+10H], 267429210  ; 697A _ 81. 79, 10, 0FF0A55A
00006981        jnz     ?_663                           ; 6981 _ 75, 14
00006983        lea     rax, ptr [rcx+10H]              ; 6983 _ 48: 8D. 41, 10
?_662:
00006987        mov     eax, dword ptr [rax+8H]         ; 6987 _ 8B. 40, 08
0000698A        shr     eax, 12                         ; 698A _ C1. E8, 0C
0000698D        and     eax, 0FF0H                      ; 698D _ 25, 00000FF0
00006992        add     eax, edx                        ; 6992 _ 01. D0
00006994        mov     eax, dword ptr [rcx+rax]        ; 6994 _ 8B. 04 01
?_663:
00006997        ret                                     ; 6997 _ C3

?_664   LABEL NEAR
00006998        push    rbp                             ; 6998 _ 55
00006999        mov     rbp, rsp                        ; 6999 _ 48: 89. E5
0000699C        push    rsi                             ; 699C _ 56
0000699D        push    rdi                             ; 699D _ 57
0000699E        sub     rsp, 96                         ; 699E _ 48: 83. EC, 60
000069A2        call    ?_620                           ; 69A2 _ E8, FFFFFC50
000069A7        xor     edi, edi                        ; 69A7 _ 31. FF
000069A9        test    rax, rax                        ; 69A9 _ 48: 85. C0
000069AC        jne     ?_667                           ; 69AC _ 0F 85, 00000138
000069B2        mov     rax, qword ptr [?_889]          ; 69B2 _ 48: 8B. 05, 000042EF(rel)
000069B9        lea     rcx, ptr [?_852]                ; 69B9 _ 48: 8D. 0D, 000041B0(rel)
000069C0        xor     edi, edi                        ; 69C0 _ 31. FF
000069C2        lea     r8, ptr [?_878]                 ; 69C2 _ 4C: 8D. 05, 00004297(rel)
000069C9        xor     edx, edx                        ; 69C9 _ 31. D2
000069CB        call    qword ptr [rax+140H]            ; 69CB _ FF. 90, 00000140
000069D1        test    rax, rax                        ; 69D1 _ 48: 85. C0
000069D4        jne     ?_667                           ; 69D4 _ 0F 85, 00000110
000069DA        mov     rax, qword ptr [?_878]          ; 69DA _ 48: 8B. 05, 0000427F(rel)
000069E1        lea     rcx, ptr [rbp-1CH]              ; 69E1 _ 48: 8D. 4D, E4
000069E5        mov     qword ptr [rsp+40H], rcx        ; 69E5 _ 48: 89. 4C 24, 40
000069EA        mov     dword ptr [rsp+38H], 3          ; 69EA _ C7. 44 24, 38, 00000003
000069F2        mov     dword ptr [rsp+30H], 0          ; 69F2 _ C7. 44 24, 30, 00000000
000069FA        mov     dword ptr [rsp+28H], 0          ; 69FA _ C7. 44 24, 28, 00000000
00006A02        mov     dword ptr [rsp+20H], 0          ; 6A02 _ C7. 44 24, 20, 00000000
00006A0A        mov     rcx, rax                        ; 6A0A _ 48: 89. C1
00006A0D        xor     edx, edx                        ; 6A0D _ 31. D2
00006A0F        xor     r8d, r8d                        ; 6A0F _ 45: 31. C0
00006A12        mov     r9d, 1                          ; 6A12 _ 41: B9, 00000001
00006A18        call    qword ptr [rax+10H]             ; 6A18 _ FF. 50, 10
00006A1B        xor     edi, edi                        ; 6A1B _ 31. FF
00006A1D        test    rax, rax                        ; 6A1D _ 48: 85. C0
00006A20        jne     ?_667                           ; 6A20 _ 0F 85, 000000C4
00006A26        movzx   eax, byte ptr [rbp-1CH]         ; 6A26 _ 0F B6. 45, E4
00006A2A        shl     eax, 8                          ; 6A2A _ C1. E0, 08
00006A2D        movzx   ecx, byte ptr [rbp-1AH]         ; 6A2D _ 0F B6. 4D, E6
00006A31        or      ecx, eax                        ; 6A31 _ 09. C1
00006A33        movzx   ecx, cx                         ; 6A33 _ 0F B7. C9
00006A36        call    ?_657                           ; 6A36 _ E8, FFFFFF13
00006A3B        mov     rsi, rax                        ; 6A3B _ 48: 89. C6
00006A3E        xor     edi, edi                        ; 6A3E _ 31. FF
00006A40        test    rsi, rsi                        ; 6A40 _ 48: 85. F6
00006A43        je      ?_667                           ; 6A43 _ 0F 84, 000000A1
00006A49        mov     eax, dword ptr [rsi+10H]        ; 6A49 _ 8B. 46, 10
00006A4C        mov     dword ptr [?_853], eax          ; 6A4C _ 89. 05, 0000412E(rel)
00006A52        mov     rax, qword ptr [?_889]          ; 6A52 _ 48: 8B. 05, 0000424F(rel)
00006A59        lea     rcx, ptr [?_834]                ; 6A59 _ 48: 8D. 0D, 00003A6C(rel)
00006A60        lea     r8, ptr [rbp-18H]               ; 6A60 _ 4C: 8D. 45, E8
00006A64        xor     edx, edx                        ; 6A64 _ 31. D2
00006A66        call    qword ptr [rax+140H]            ; 6A66 _ FF. 90, 00000140
00006A6C        mov     ecx, 1                          ; 6A6C _ B9, 00000001
00006A71        test    rax, rax                        ; 6A71 _ 48: 85. C0
00006A74        jnz     ?_665                           ; 6A74 _ 75, 17
00006A76        mov     ecx, 1                          ; 6A76 _ B9, 00000001
00006A7B        mov     rax, qword ptr [rbp-18H]        ; 6A7B _ 48: 8B. 45, E8
00006A7F        cmp     dword ptr [rax], 3              ; 6A7F _ 83. 38, 03
00006A82        jc      ?_665                           ; 6A82 _ 72, 09
00006A84        mov     rcx, rax                        ; 6A84 _ 48: 89. C1
00006A87        call    qword ptr [rax+30H]             ; 6A87 _ FF. 50, 30
00006A8A        movzx   ecx, ax                         ; 6A8A _ 0F B7. C8
?_665:
00006A8D        mov     rax, qword ptr [rsi+18H]        ; 6A8D _ 48: 8B. 46, 18
00006A91        cmp     rax, rcx                        ; 6A91 _ 48: 39. C8
00006A94        cmova   rax, rcx                        ; 6A94 _ 48: 0F 47. C1
00006A98        mov     qword ptr [?_854], rax          ; 6A98 _ 48: 89. 05, 000040E9(rel)
00006A9F        cmp     rax, 64                         ; 6A9F _ 48: 83. F8, 40
00006AA3        jnz     ?_666                           ; 6AA3 _ 75, 07
00006AA5        mov     byte ptr [?_879], 1             ; 6AA5 _ C6. 05, 000041BC(rel), 01
?_666:
00006AAC        lea     rax, ptr [?_668]                ; 6AAC _ 48: 8D. 05, 00000042(rel)
00006AB3        mov     qword ptr [rsi+28H], rax        ; 6AB3 _ 48: 89. 46, 28
00006AB7        lea     rax, ptr [?_669]                ; 6AB7 _ 48: 8D. 05, 00000085(rel)
00006ABE        mov     qword ptr [rsi+30H], rax        ; 6ABE _ 48: 89. 46, 30
00006AC2        lea     rax, ptr [?_675]                ; 6AC2 _ 48: 8D. 05, 0000013F(rel)
00006AC9        mov     qword ptr [rsi+38H], rax        ; 6AC9 _ 48: 89. 46, 38
00006ACD        lea     rax, ptr [?_677]                ; 6ACD _ 48: 8D. 05, 000001CD(rel)
00006AD4        mov     qword ptr [rsi+40H], rax        ; 6AD4 _ 48: 89. 46, 40
00006AD8        lea     rax, ptr [?_679]                ; 6AD8 _ 48: 8D. 05, 000001F9(rel)
00006ADF        mov     qword ptr [rsi+48H], rax        ; 6ADF _ 48: 89. 46, 48
00006AE3        and     byte ptr [rsi+20H], 0FFFFFFFEH  ; 6AE3 _ 80. 66, 20, FE
00006AE7        mov     rdi, rsi                        ; 6AE7 _ 48: 89. F7
?_667:
00006AEA        mov     rax, rdi                        ; 6AEA _ 48: 89. F8
00006AED        add     rsp, 96                         ; 6AED _ 48: 83. C4, 60
00006AF1        pop     rdi                             ; 6AF1 _ 5F
00006AF2        pop     rsi                             ; 6AF2 _ 5E
00006AF3        pop     rbp                             ; 6AF3 _ 5D
00006AF4        ret                                     ; 6AF4 _ C3

?_668   LABEL NEAR
00006AF5        push    rbp                             ; 6AF5 _ 55
00006AF6        mov     rbp, rsp                        ; 6AF6 _ 48: 89. E5
00006AF9        sub     rsp, 80                         ; 6AF9 _ 48: 83. EC, 50
00006AFD        mov     rax, qword ptr [?_878]          ; 6AFD _ 48: 8B. 05, 0000415C(rel)
00006B04        mov     r8d, dword ptr [?_853]          ; 6B04 _ 44: 8B. 05, 00004075(rel)
00006B0B        mov     qword ptr [rsp+40H], rdx        ; 6B0B _ 48: 89. 54 24, 40
00006B10        mov     dword ptr [rsp+38H], r8d        ; 6B10 _ 44: 89. 44 24, 38
00006B15        mov     dword ptr [rsp+30H], ecx        ; 6B15 _ 89. 4C 24, 30
00006B19        mov     dword ptr [rsp+28H], 0          ; 6B19 _ C7. 44 24, 28, 00000000
00006B21        mov     dword ptr [rsp+20H], 0          ; 6B21 _ C7. 44 24, 20, 00000000
00006B29        mov     rcx, rax                        ; 6B29 _ 48: 89. C1
00006B2C        mov     edx, 1                          ; 6B2C _ BA, 00000001
00006B31        xor     r8d, r8d                        ; 6B31 _ 45: 31. C0
00006B34        mov     r9d, 1                          ; 6B34 _ 41: B9, 00000001
00006B3A        call    qword ptr [rax+10H]             ; 6B3A _ FF. 50, 10
00006B3D        add     rsp, 80                         ; 6B3D _ 48: 83. C4, 50
00006B41        pop     rbp                             ; 6B41 _ 5D
00006B42        ret                                     ; 6B42 _ C3

?_669   LABEL NEAR
00006B43        push    rbp                             ; 6B43 _ 55
00006B44        mov     rbp, rsp                        ; 6B44 _ 48: 89. E5
00006B47        push    r15                             ; 6B47 _ 41: 57
00006B49        push    r14                             ; 6B49 _ 41: 56
00006B4B        push    rsi                             ; 6B4B _ 56
00006B4C        push    rdi                             ; 6B4C _ 57
00006B4D        push    rbx                             ; 6B4D _ 53
00006B4E        sub     rsp, 40                         ; 6B4E _ 48: 83. EC, 28
00006B52        mov     r15, rdx                        ; 6B52 _ 49: 89. D7
00006B55        mov     rdi, rcx                        ; 6B55 _ 48: 89. CF
00006B58        xor     ecx, ecx                        ; 6B58 _ 31. C9
00006B5A        call    ?_680                           ; 6B5A _ E8, 0000019C
00006B5F        mov     rbx, rax                        ; 6B5F _ 48: 89. C3
00006B62        test    rbx, rbx                        ; 6B62 _ 48: 85. DB
00006B65        js      ?_674                           ; 6B65 _ 0F 88, 0000008D
00006B6B        movzx   r9d, byte ptr [?_879]           ; 6B6B _ 44: 0F B6. 0D, 000040F5(rel)
00006B73        mov     r8d, dword ptr [?_853]          ; 6B73 _ 44: 8B. 05, 00004006(rel)
00006B7A        mov     rcx, rdi                        ; 6B7A _ 48: 89. F9
00006B7D        mov     rdx, r15                        ; 6B7D _ 4C: 89. FA
00006B80        call    ?_688                           ; 6B80 _ E8, 00000304
00006B85        mov     rbx, rax                        ; 6B85 _ 48: 89. C3
00006B88        test    rbx, rbx                        ; 6B88 _ 48: 85. DB
00006B8B        js      ?_674                           ; 6B8B _ 78, 6B
00006B8D        mov     al, byte ptr [?_879]            ; 6B8D _ 8A. 05, 000040D5(rel)
00006B93        test    al, al                          ; 6B93 _ 84. C0
00006B95        jnz     ?_673                           ; 6B95 _ 75, 52
00006B97        mov     r14d, dword ptr [?_853]         ; 6B97 _ 44: 8B. 35, 00003FE2(rel)
00006B9E        call    ?_683                           ; 6B9E _ E8, 00000235
00006BA3        mov     rbx, rax                        ; 6BA3 _ 48: 89. C3
00006BA6        test    rbx, rbx                        ; 6BA6 _ 48: 85. DB
00006BA9        js      ?_674                           ; 6BA9 _ 78, 4D
00006BAB        test    r14d, r14d                      ; 6BAB _ 45: 85. F6
00006BAE        jz      ?_673                           ; 6BAE _ 74, 39
00006BB0        xor     esi, esi                        ; 6BB0 _ 31. F6
?_670:
00006BB2        mov     al, byte ptr [rdi+rsi]          ; 6BB2 _ 8A. 04 37
00006BB5        cmp     al, byte ptr [r15+rsi]          ; 6BB5 _ 41: 3A. 04 37
00006BB9        jz      ?_671                           ; 6BB9 _ 74, 1C
00006BBB        lea     rcx, ptr [rdi+rsi]              ; 6BBB _ 48: 8D. 0C 37
00006BBF        lea     rdx, ptr [r15+rsi]              ; 6BBF _ 49: 8D. 14 37
00006BC3        mov     r8d, 1                          ; 6BC3 _ 41: B8, 00000001
00006BC9        mov     r9d, 1                          ; 6BC9 _ 41: B9, 00000001
00006BCF        call    ?_688                           ; 6BCF _ E8, 000002B5
00006BD4        mov     rbx, rax                        ; 6BD4 _ 48: 89. C3
?_671:
00006BD7        test    rbx, rbx                        ; 6BD7 _ 48: 85. DB
00006BDA        js      ?_672                           ; 6BDA _ 78, 08
00006BDC        inc     rsi                             ; 6BDC _ 48: FF. C6
00006BDF        cmp     rsi, r14                        ; 6BDF _ 4C: 39. F6
00006BE2        jc      ?_670                           ; 6BE2 _ 72, CE
?_672:
00006BE4        test    rbx, rbx                        ; 6BE4 _ 48: 85. DB
00006BE7        js      ?_674                           ; 6BE7 _ 78, 0F
?_673:
00006BE9        mov     ecx, 1                          ; 6BE9 _ B9, 00000001
00006BEE        call    ?_680                           ; 6BEE _ E8, 00000108
00006BF3        call    ?_013                           ; 6BF3 _ E8, FFFF97F6
?_674:
00006BF8        mov     rax, rbx                        ; 6BF8 _ 48: 89. D8
00006BFB        add     rsp, 40                         ; 6BFB _ 48: 83. C4, 28
00006BFF        pop     rbx                             ; 6BFF _ 5B
00006C00        pop     rdi                             ; 6C00 _ 5F
00006C01        pop     rsi                             ; 6C01 _ 5E
00006C02        pop     r14                             ; 6C02 _ 41: 5E
00006C04        pop     r15                             ; 6C04 _ 41: 5F
00006C06        pop     rbp                             ; 6C06 _ 5D
00006C07        ret                                     ; 6C07 _ C3

?_675   LABEL NEAR
00006C08        push    rbp                             ; 6C08 _ 55
00006C09        mov     rbp, rsp                        ; 6C09 _ 48: 89. E5
00006C0C        push    rsi                             ; 6C0C _ 56
00006C0D        push    rdi                             ; 6C0D _ 57
00006C0E        sub     rsp, 80                         ; 6C0E _ 48: 83. EC, 50
00006C12        mov     rsi, rcx                        ; 6C12 _ 48: 89. CE
00006C15        xor     ecx, ecx                        ; 6C15 _ 31. C9
00006C17        call    ?_680                           ; 6C17 _ E8, 000000DF
00006C1C        mov     rdi, rax                        ; 6C1C _ 48: 89. C7
00006C1F        test    rdi, rdi                        ; 6C1F _ 48: 85. FF
00006C22        js      ?_676                           ; 6C22 _ 78, 72
00006C24        cmp     dword ptr [?_853], 4096         ; 6C24 _ 81. 3D, 00003F52(rel), 00001000
00006C2E        setne   cl                              ; 6C2E _ 0F 95. C1
00006C31        mov     rax, qword ptr [?_878]          ; 6C31 _ 48: 8B. 05, 00004028(rel)
00006C38        and     esi, 0FFFFFFH                   ; 6C38 _ 81. E6, 00FFFFFF
00006C3E        mov     dword ptr [rsp+30H], esi        ; 6C3E _ 89. 74 24, 30
00006C42        mov     dword ptr [rsp+20H], 1          ; 6C42 _ C7. 44 24, 20, 00000001
00006C4A        mov     dword ptr [rsp+28H], 0          ; 6C4A _ C7. 44 24, 28, 00000000
00006C52        mov     dword ptr [rsp+38H], 0          ; 6C52 _ C7. 44 24, 38, 00000000
00006C5A        mov     qword ptr [rsp+40H], 0          ; 6C5A _ 48: C7. 44 24, 40, 00000000
00006C63        or      cl, 4H                          ; 6C63 _ 80. C9, 04
00006C66        movzx   edx, cl                         ; 6C66 _ 0F B6. D1
00006C69        mov     rcx, rax                        ; 6C69 _ 48: 89. C1
00006C6C        xor     r8d, r8d                        ; 6C6C _ 45: 31. C0
00006C6F        xor     r9d, r9d                        ; 6C6F _ 45: 31. C9
00006C72        call    qword ptr [rax+10H]             ; 6C72 _ FF. 50, 10
00006C75        mov     rsi, rax                        ; 6C75 _ 48: 89. C6
00006C78        call    ?_683                           ; 6C78 _ E8, 0000015B
00006C7D        mov     rdi, rax                        ; 6C7D _ 48: 89. C7
00006C80        mov     ecx, 1                          ; 6C80 _ B9, 00000001
00006C85        call    ?_680                           ; 6C85 _ E8, 00000071
00006C8A        test    rsi, rsi                        ; 6C8A _ 48: 85. F6
00006C8D        cmovne  rdi, rsi                        ; 6C8D _ 48: 0F 45. FE
00006C91        call    ?_013                           ; 6C91 _ E8, FFFF9758
?_676:
00006C96        mov     rax, rdi                        ; 6C96 _ 48: 89. F8
00006C99        add     rsp, 80                         ; 6C99 _ 48: 83. C4, 50
00006C9D        pop     rdi                             ; 6C9D _ 5F
00006C9E        pop     rsi                             ; 6C9E _ 5E
00006C9F        pop     rbp                             ; 6C9F _ 5D
00006CA0        ret                                     ; 6CA0 _ C3

?_677   LABEL NEAR
00006CA1        push    rbp                             ; 6CA1 _ 55
00006CA2        mov     rbp, rsp                        ; 6CA2 _ 48: 89. E5
00006CA5        push    rsi                             ; 6CA5 _ 56
00006CA6        push    rdi                             ; 6CA6 _ 57
00006CA7        sub     rsp, 32                         ; 6CA7 _ 48: 83. EC, 20
00006CAB        mov     rsi, rdx                        ; 6CAB _ 48: 89. D6
00006CAE        mov     rdi, rcx                        ; 6CAE _ 48: 89. CF
00006CB1        mov     rcx, rdi                        ; 6CB1 _ 48: 89. F9
00006CB4        call    ?_675                           ; 6CB4 _ E8, FFFFFF4F
00006CB9        test    rax, rax                        ; 6CB9 _ 48: 85. C0
00006CBC        jz      ?_678                           ; 6CBC _ 74, 08
00006CBE        add     rsp, 32                         ; 6CBE _ 48: 83. C4, 20
00006CC2        pop     rdi                             ; 6CC2 _ 5F
00006CC3        pop     rsi                             ; 6CC3 _ 5E
00006CC4        pop     rbp                             ; 6CC4 _ 5D
00006CC5        ret                                     ; 6CC5 _ C3

?_678:
00006CC6        mov     rcx, rdi                        ; 6CC6 _ 48: 89. F9
00006CC9        mov     rdx, rsi                        ; 6CC9 _ 48: 89. F2
00006CCC        add     rsp, 32                         ; 6CCC _ 48: 83. C4, 20
00006CD0        pop     rdi                             ; 6CD0 _ 5F
00006CD1        pop     rsi                             ; 6CD1 _ 5E
00006CD2        pop     rbp                             ; 6CD2 _ 5D
00006CD3        jmp     ?_669                           ; 6CD3 _ E9, FFFFFE6B

?_679   LABEL NEAR
00006CD8        mov     dword ptr [?_853], 65536        ; 6CD8 _ C7. 05, 00003E9E(rel), 00010000
00006CE2        mov     qword ptr [?_854], 1            ; 6CE2 _ 48: C7. 05, 00003E9B(rel), 00000001
00006CED        mov     qword ptr [?_878], 0            ; 6CED _ 48: C7. 05, 00003F68(rel), 00000000
00006CF8        xor     eax, eax                        ; 6CF8 _ 31. C0
00006CFA        ret                                     ; 6CFA _ C3

?_680   LABEL NEAR
00006CFB        push    rbp                             ; 6CFB _ 55
00006CFC        mov     rbp, rsp                        ; 6CFC _ 48: 89. E5
00006CFF        push    rsi                             ; 6CFF _ 56
00006D00        sub     rsp, 88                         ; 6D00 _ 48: 83. EC, 58
00006D04        mov     esi, ecx                        ; 6D04 _ 89. CE
00006D06        call    ?_683                           ; 6D06 _ E8, 000000CD
00006D0B        test    rax, rax                        ; 6D0B _ 48: 85. C0
00006D0E        jne     ?_682                           ; 6D0E _ 0F 85, 000000BD
00006D14        mov     al, 28                          ; 6D14 _ B0, 1C
00006D16        test    sil, sil                        ; 6D16 _ 40: 84. F6
00006D19        jnz     ?_681                           ; 6D19 _ 75, 02
00006D1B        xor     al, al                          ; 6D1B _ 30. C0
?_681:
00006D1D        mov     byte ptr [rbp-9H], al           ; 6D1D _ 88. 45, F7
00006D20        mov     rax, qword ptr [?_878]          ; 6D20 _ 48: 8B. 05, 00003F39(rel)
00006D27        lea     rcx, ptr [rbp-9H]               ; 6D27 _ 48: 8D. 4D, F7
00006D2B        mov     qword ptr [rsp+40H], rcx        ; 6D2B _ 48: 89. 4C 24, 40
00006D30        mov     dword ptr [rsp+38H], 1          ; 6D30 _ C7. 44 24, 38, 00000001
00006D38        mov     dword ptr [rsp+30H], 0          ; 6D38 _ C7. 44 24, 30, 00000000
00006D40        mov     dword ptr [rsp+28H], 1          ; 6D40 _ C7. 44 24, 28, 00000001
00006D48        mov     dword ptr [rsp+20H], 1          ; 6D48 _ C7. 44 24, 20, 00000001
00006D50        mov     rcx, rax                        ; 6D50 _ 48: 89. C1
00006D53        mov     edx, 7                          ; 6D53 _ BA, 00000007
00006D58        xor     r8d, r8d                        ; 6D58 _ 45: 31. C0
00006D5B        mov     r9d, 1                          ; 6D5B _ 41: B9, 00000001
00006D61        call    qword ptr [rax+10H]             ; 6D61 _ FF. 50, 10
00006D64        test    rax, rax                        ; 6D64 _ 48: 85. C0
00006D67        js      ?_682                           ; 6D67 _ 78, 68
00006D69        call    ?_683                           ; 6D69 _ E8, 0000006A
00006D6E        test    rax, rax                        ; 6D6E _ 48: 85. C0
00006D71        jnz     ?_682                           ; 6D71 _ 75, 5E
00006D73        mov     rax, qword ptr [?_878]          ; 6D73 _ 48: 8B. 05, 00003EE6(rel)
00006D7A        lea     rcx, ptr [rbp-0AH]              ; 6D7A _ 48: 8D. 4D, F6
00006D7E        mov     qword ptr [rsp+40H], rcx        ; 6D7E _ 48: 89. 4C 24, 40
00006D83        mov     dword ptr [rsp+38H], 1          ; 6D83 _ C7. 44 24, 38, 00000001
00006D8B        mov     dword ptr [rsp+30H], 0          ; 6D8B _ C7. 44 24, 30, 00000000
00006D93        mov     dword ptr [rsp+28H], 0          ; 6D93 _ C7. 44 24, 28, 00000000
00006D9B        mov     dword ptr [rsp+20H], 0          ; 6D9B _ C7. 44 24, 20, 00000000
00006DA3        mov     rcx, rax                        ; 6DA3 _ 48: 89. C1
00006DA6        mov     edx, 2                          ; 6DA6 _ BA, 00000002
00006DAB        xor     r8d, r8d                        ; 6DAB _ 45: 31. C0
00006DAE        mov     r9d, 1                          ; 6DAE _ 41: B9, 00000001
00006DB4        call    qword ptr [rax+10H]             ; 6DB4 _ FF. 50, 10
00006DB7        test    rax, rax                        ; 6DB7 _ 48: 85. C0
00006DBA        js      ?_682                           ; 6DBA _ 78, 15
00006DBC        mov     cl, byte ptr [rbp-9H]           ; 6DBC _ 8A. 4D, F7
00006DBF        xor     cl, byte ptr [rbp-0AH]          ; 6DBF _ 32. 4D, F6
00006DC2        test    cl, 1CH                         ; 6DC2 _ F6. C1, 1C
00006DC5        jz      ?_682                           ; 6DC5 _ 74, 0A
00006DC7        mov     rax, 7H                         ; 6DC7 _ 48: B8, 8000000000000007
?_682:
00006DD1        add     rsp, 88                         ; 6DD1 _ 48: 83. C4, 58
00006DD5        pop     rsi                             ; 6DD5 _ 5E
00006DD6        pop     rbp                             ; 6DD6 _ 5D
00006DD7        ret                                     ; 6DD7 _ C3

?_683   LABEL NEAR
00006DD8        push    rbp                             ; 6DD8 _ 55
00006DD9        mov     rbp, rsp                        ; 6DD9 _ 48: 89. E5
00006DDC        push    rsi                             ; 6DDC _ 56
00006DDD        push    rdi                             ; 6DDD _ 57
00006DDE        push    rbx                             ; 6DDE _ 53
00006DDF        sub     rsp, 88                         ; 6DDF _ 48: 83. EC, 58
00006DE3        mov     byte ptr [rbp-19H], 1           ; 6DE3 _ C6. 45, E7, 01
00006DE7        mov     rsi, 6H                         ; 6DE7 _ 48: BE, 8000000000000006
00006DF1        mov     edi, 4294967295                 ; 6DF1 _ BF, FFFFFFFF
00006DF6        lea     rbx, ptr [rbp-19H]              ; 6DF6 _ 48: 8D. 5D, E7
00006DFA        jmp     ?_685                           ; 6DFA _ EB, 12

?_684:
00006DFC        mov     rax, qword ptr [?_889]          ; 6DFC _ 48: 8B. 05, 00003EA5(rel)
00006E03        mov     ecx, 10                         ; 6E03 _ B9, 0000000A
00006E08        call    qword ptr [rax+0F8H]            ; 6E08 _ FF. 90, 000000F8
?_685:
00006E0E        inc     edi                             ; 6E0E _ FF. C7
00006E10        cmp     edi, 99999                      ; 6E10 _ 81. FF, 0001869F
00006E16        ja      ?_686                           ; 6E16 _ 77, 4E
00006E18        mov     rax, qword ptr [?_878]          ; 6E18 _ 48: 8B. 05, 00003E41(rel)
00006E1F        mov     qword ptr [rsp+40H], rbx        ; 6E1F _ 48: 89. 5C 24, 40
00006E24        mov     dword ptr [rsp+38H], 1          ; 6E24 _ C7. 44 24, 38, 00000001
00006E2C        mov     dword ptr [rsp+30H], 0          ; 6E2C _ C7. 44 24, 30, 00000000
00006E34        mov     dword ptr [rsp+28H], 0          ; 6E34 _ C7. 44 24, 28, 00000000
00006E3C        mov     dword ptr [rsp+20H], 0          ; 6E3C _ C7. 44 24, 20, 00000000
00006E44        mov     rcx, rax                        ; 6E44 _ 48: 89. C1
00006E47        mov     edx, 2                          ; 6E47 _ BA, 00000002
00006E4C        xor     r8d, r8d                        ; 6E4C _ 45: 31. C0
00006E4F        mov     r9d, 1                          ; 6E4F _ 41: B9, 00000001
00006E55        call    qword ptr [rax+10H]             ; 6E55 _ FF. 50, 10
00006E58        mov     rsi, rax                        ; 6E58 _ 48: 89. C6
00006E5B        test    rsi, rsi                        ; 6E5B _ 48: 85. F6
00006E5E        js      ?_687                           ; 6E5E _ 78, 1D
00006E60        test    byte ptr [rbp-19H], 1H          ; 6E60 _ F6. 45, E7, 01
00006E64        jnz     ?_684                           ; 6E64 _ 75, 96
?_686:
00006E66        test    rsi, rsi                        ; 6E66 _ 48: 85. F6
00006E69        jnz     ?_687                           ; 6E69 _ 75, 12
00006E6B        xor     esi, esi                        ; 6E6B _ 31. F6
00006E6D        test    byte ptr [rbp-19H], 1H          ; 6E6D _ F6. 45, E7, 01
00006E71        jz      ?_687                           ; 6E71 _ 74, 0A
00006E73        mov     rsi, 12H                        ; 6E73 _ 48: BE, 8000000000000012
?_687:
00006E7D        mov     rax, rsi                        ; 6E7D _ 48: 89. F0
00006E80        add     rsp, 88                         ; 6E80 _ 48: 83. C4, 58
00006E84        pop     rbx                             ; 6E84 _ 5B
00006E85        pop     rdi                             ; 6E85 _ 5F
00006E86        pop     rsi                             ; 6E86 _ 5E
00006E87        pop     rbp                             ; 6E87 _ 5D
00006E88        ret                                     ; 6E88 _ C3

?_688   LABEL NEAR
00006E89        push    rbp                             ; 6E89 _ 55
00006E8A        mov     rbp, rsp                        ; 6E8A _ 48: 89. E5
00006E8D        push    r15                             ; 6E8D _ 41: 57
00006E8F        push    r14                             ; 6E8F _ 41: 56
00006E91        push    r12                             ; 6E91 _ 41: 54
00006E93        push    rsi                             ; 6E93 _ 56
00006E94        push    rdi                             ; 6E94 _ 57
00006E95        push    rbx                             ; 6E95 _ 53
00006E96        sub     rsp, 80                         ; 6E96 _ 48: 83. EC, 50
00006E9A        mov     esi, r9d                        ; 6E9A _ 44: 89. CE
00006E9D        mov     r14, r8                         ; 6E9D _ 4D: 89. C6
00006EA0        mov     r15, rdx                        ; 6EA0 _ 49: 89. D7
00006EA3        mov     r12, rcx                        ; 6EA3 _ 49: 89. CC
00006EA6        xor     ebx, ebx                        ; 6EA6 _ 31. DB
00006EA8        test    r14, r14                        ; 6EA8 _ 4D: 85. F6
00006EAB        je      ?_691                           ; 6EAB _ 0F 84, 00000097
00006EB1        add     r15, r14                        ; 6EB1 _ 4D: 01. F7
00006EB4        and     r12, 0FFFFFFH                   ; 6EB4 _ 49: 81. E4, 00FFFFFF
00006EBB        add     r12, r14                        ; 6EBB _ 4D: 01. F4
00006EBE        xor     ebx, ebx                        ; 6EBE _ 31. DB
00006EC0        jmp     ?_690                           ; 6EC0 _ EB, 12

?_689:
00006EC2        mov     rax, qword ptr [?_889]          ; 6EC2 _ 48: 8B. 05, 00003DDF(rel)
00006EC9        mov     ecx, 15                         ; 6EC9 _ B9, 0000000F
00006ECE        call    qword ptr [rax+0F8H]            ; 6ECE _ FF. 90, 000000F8
?_690:
00006ED4        test    r14, r14                        ; 6ED4 _ 4D: 85. F6
00006ED7        jz      ?_691                           ; 6ED7 _ 74, 6F
00006ED9        test    rbx, rbx                        ; 6ED9 _ 48: 85. DB
00006EDC        js      ?_691                           ; 6EDC _ 78, 6A
00006EDE        mov     rdi, qword ptr [?_854]          ; 6EDE _ 48: 8B. 3D, 00003CA3(rel)
00006EE5        cmp     r14, rdi                        ; 6EE5 _ 49: 39. FE
00006EE8        cmovbe  rdi, r14                        ; 6EE8 _ 49: 0F 46. FE
00006EEC        sub     r12, rdi                        ; 6EEC _ 49: 29. FC
00006EEF        sub     r15, rdi                        ; 6EEF _ 49: 29. FF
00006EF2        mov     rax, qword ptr [?_878]          ; 6EF2 _ 48: 8B. 05, 00003D67(rel)
00006EF9        mov     qword ptr [rsp+40H], r15        ; 6EF9 _ 4C: 89. 7C 24, 40
00006EFE        mov     dword ptr [rsp+38H], edi        ; 6EFE _ 89. 7C 24, 38
00006F02        mov     dword ptr [rsp+30H], r12d       ; 6F02 _ 44: 89. 64 24, 30
00006F07        mov     dword ptr [rsp+28H], 1          ; 6F07 _ C7. 44 24, 28, 00000001
00006F0F        mov     dword ptr [rsp+20H], 1          ; 6F0F _ C7. 44 24, 20, 00000001
00006F17        mov     rcx, rax                        ; 6F17 _ 48: 89. C1
00006F1A        mov     edx, 6                          ; 6F1A _ BA, 00000006
00006F1F        xor     r8d, r8d                        ; 6F1F _ 45: 31. C0
00006F22        mov     r9d, 1                          ; 6F22 _ 41: B9, 00000001
00006F28        call    qword ptr [rax+10H]             ; 6F28 _ FF. 50, 10
00006F2B        mov     rbx, rax                        ; 6F2B _ 48: 89. C3
00006F2E        test    rbx, rbx                        ; 6F2E _ 48: 85. DB
00006F31        js      ?_691                           ; 6F31 _ 78, 15
00006F33        sub     r14, rdi                        ; 6F33 _ 49: 29. FE
00006F36        test    sil, sil                        ; 6F36 _ 40: 84. F6
00006F39        jz      ?_689                           ; 6F39 _ 74, 87
00006F3B        call    ?_683                           ; 6F3B _ E8, FFFFFE98
00006F40        mov     rbx, rax                        ; 6F40 _ 48: 89. C3
00006F43        test    rbx, rbx                        ; 6F43 _ 48: 85. DB
00006F46        jns     ?_690                           ; 6F46 _ 79, 8C
?_691:
00006F48        mov     rax, rbx                        ; 6F48 _ 48: 89. D8
00006F4B        add     rsp, 80                         ; 6F4B _ 48: 83. C4, 50
00006F4F        pop     rbx                             ; 6F4F _ 5B
00006F50        pop     rdi                             ; 6F50 _ 5F
00006F51        pop     rsi                             ; 6F51 _ 5E
00006F52        pop     r12                             ; 6F52 _ 41: 5C
00006F54        pop     r14                             ; 6F54 _ 41: 5E
00006F56        pop     r15                             ; 6F56 _ 41: 5F
00006F58        pop     rbp                             ; 6F58 _ 5D
00006F59        ret                                     ; 6F59 _ C3

?_692   LABEL NEAR
00006F5A        push    rbp                             ; 6F5A _ 55
00006F5B        mov     rbp, rsp                        ; 6F5B _ 48: 89. E5
00006F5E        push    rsi                             ; 6F5E _ 56
00006F5F        push    rdi                             ; 6F5F _ 57
00006F60        sub     rsp, 80                         ; 6F60 _ 48: 83. EC, 50
00006F64        call    ?_620                           ; 6F64 _ E8, FFFFF68E
00006F69        add     rax, -7                         ; 6F69 _ 48: 83. C0, F9
00006F6D        xor     edi, edi                        ; 6F6D _ 31. FF
00006F6F        cmp     rax, 1                          ; 6F6F _ 48: 83. F8, 01
00006F73        ja      ?_694                           ; 6F73 _ 0F 87, 00000121
00006F79        mov     rax, qword ptr [?_889]          ; 6F79 _ 48: 8B. 05, 00003D28(rel)
00006F80        lea     rcx, ptr [?_855]                ; 6F80 _ 48: 8D. 0D, 00003C09(rel)
00006F87        xor     edi, edi                        ; 6F87 _ 31. FF
00006F89        lea     r8, ptr [?_880]                 ; 6F89 _ 4C: 8D. 05, 00003CE0(rel)
00006F90        xor     edx, edx                        ; 6F90 _ 31. D2
00006F92        call    qword ptr [rax+140H]            ; 6F92 _ FF. 90, 00000140
00006F98        test    rax, rax                        ; 6F98 _ 48: 85. C0
00006F9B        jne     ?_694                           ; 6F9B _ 0F 85, 000000F9
00006FA1        mov     rax, qword ptr [?_880]          ; 6FA1 _ 48: 8B. 05, 00003CC8(rel)
00006FA8        lea     rcx, ptr [rbp-14H]              ; 6FA8 _ 48: 8D. 4D, EC
00006FAC        mov     qword ptr [rsp+40H], rcx        ; 6FAC _ 48: 89. 4C 24, 40
00006FB1        mov     dword ptr [rsp+38H], 3          ; 6FB1 _ C7. 44 24, 38, 00000003
00006FB9        mov     dword ptr [rsp+30H], 0          ; 6FB9 _ C7. 44 24, 30, 00000000
00006FC1        mov     dword ptr [rsp+28H], 0          ; 6FC1 _ C7. 44 24, 28, 00000000
00006FC9        mov     dword ptr [rsp+20H], 0          ; 6FC9 _ C7. 44 24, 20, 00000000
00006FD1        mov     rcx, rax                        ; 6FD1 _ 48: 89. C1
00006FD4        xor     edx, edx                        ; 6FD4 _ 31. D2
00006FD6        xor     r8d, r8d                        ; 6FD6 _ 45: 31. C0
00006FD9        mov     r9d, 1                          ; 6FD9 _ 41: B9, 00000001
00006FDF        call    qword ptr [rax+10H]             ; 6FDF _ FF. 50, 10
00006FE2        xor     edi, edi                        ; 6FE2 _ 31. FF
00006FE4        test    rax, rax                        ; 6FE4 _ 48: 85. C0
00006FE7        jne     ?_694                           ; 6FE7 _ 0F 85, 000000AD
00006FED        movzx   eax, byte ptr [rbp-14H]         ; 6FED _ 0F B6. 45, EC
00006FF1        shl     eax, 8                          ; 6FF1 _ C1. E0, 08
00006FF4        movzx   ecx, byte ptr [rbp-12H]         ; 6FF4 _ 0F B6. 4D, EE
00006FF8        or      ecx, eax                        ; 6FF8 _ 09. C1
00006FFA        movzx   ecx, cx                         ; 6FFA _ 0F B7. C9
00006FFD        call    ?_657                           ; 6FFD _ E8, FFFFF94C
00007002        mov     rsi, rax                        ; 7002 _ 48: 89. C6
00007005        xor     edi, edi                        ; 7005 _ 31. FF
00007007        test    rsi, rsi                        ; 7007 _ 48: 85. F6
0000700A        je      ?_694                           ; 700A _ 0F 84, 0000008A
00007010        mov     ecx, 93                         ; 7010 _ B9, 0000005D
00007015        call    ?_649                           ; 7015 _ E8, FFFFF86B
0000701A        mov     rax, qword ptr [rsi+18H]        ; 701A _ 48: 8B. 46, 18
0000701E        mov     qword ptr [?_856], rax          ; 701E _ 48: 89. 05, 00003B7B(rel)
00007025        call    ?_653                           ; 7025 _ E8, FFFFF8B1
0000702A        test    rax, rax                        ; 702A _ 48: 85. C0
0000702D        setne   byte ptr [?_881]                ; 702D _ 0F 95. 05, 00003C44(rel)
00007034        call    ?_650                           ; 7034 _ E8, FFFFF86E
00007039        lea     r8, ptr [?_706]                 ; 7039 _ 4C: 8D. 05, 0000029E(rel)
00007040        lea     r9, ptr [?_704]                 ; 7040 _ 4C: 8D. 0D, 00000260(rel)
00007047        lea     rdi, ptr [?_702]                ; 7047 _ 48: 8D. 3D, 000001BB(rel)
0000704E        lea     rcx, ptr [?_698]                ; 704E _ 48: 8D. 0D, 000000C1(rel)
00007055        lea     rdx, ptr [?_695]                ; 7055 _ 48: 8D. 15, 00000049(rel)
0000705C        mov     byte ptr [?_882], al            ; 705C _ 88. 05, 00003C17(rel)
00007062        mov     qword ptr [rsi+28H], rdx        ; 7062 _ 48: 89. 56, 28
00007066        mov     qword ptr [rsi+30H], rcx        ; 7066 _ 48: 89. 4E, 30
0000706A        mov     qword ptr [rsi+38H], rdi        ; 706A _ 48: 89. 7E, 38
0000706E        mov     qword ptr [rsi+40H], r9         ; 706E _ 4C: 89. 4E, 40
00007072        mov     qword ptr [rsi+48H], r8         ; 7072 _ 4C: 89. 46, 48
00007076        mov     dword ptr [rsi+10H], 65536      ; 7076 _ C7. 46, 10, 00010000
0000707D        mov     eax, dword ptr [rsi+20H]        ; 707D _ 8B. 46, 20
00007080        mov     ecx, eax                        ; 7080 _ 89. C1
00007082        and     ecx, 0FFFFFFFEH                 ; 7082 _ 83. E1, FE
00007085        mov     dword ptr [rsi+20H], ecx        ; 7085 _ 89. 4E, 20
00007088        cmp     byte ptr [?_881], 0             ; 7088 _ 80. 3D, 00003BE9(rel), 00
0000708F        jz      ?_693                           ; 708F _ 74, 06
00007091        or      eax, 1H                         ; 7091 _ 83. C8, 01
00007094        mov     dword ptr [rsi+20H], eax        ; 7094 _ 89. 46, 20
?_693:
00007097        mov     rdi, rsi                        ; 7097 _ 48: 89. F7
?_694:
0000709A        mov     rax, rdi                        ; 709A _ 48: 89. F8
0000709D        add     rsp, 80                         ; 709D _ 48: 83. C4, 50
000070A1        pop     rdi                             ; 70A1 _ 5F
000070A2        pop     rsi                             ; 70A2 _ 5E
000070A3        pop     rbp                             ; 70A3 _ 5D
000070A4        ret                                     ; 70A4 _ C3

?_695   LABEL NEAR
000070A5        push    rbp                             ; 70A5 _ 55
000070A6        mov     rbp, rsp                        ; 70A6 _ 48: 89. E5
000070A9        push    rsi                             ; 70A9 _ 56
000070AA        push    rdi                             ; 70AA _ 57
000070AB        push    rbx                             ; 70AB _ 53
000070AC        sub     rsp, 72                         ; 70AC _ 48: 83. EC, 48
000070B0        mov     rsi, rdx                        ; 70B0 _ 48: 89. D6
000070B3        mov     rdi, rcx                        ; 70B3 _ 48: 89. CF
000070B6        xor     ebx, ebx                        ; 70B6 _ 31. DB
?_696:
000070B8        lea     rcx, ptr [rsi+rbx]              ; 70B8 _ 48: 8D. 0C 1E
000070BC        mov     rax, qword ptr [?_880]          ; 70BC _ 48: 8B. 05, 00003BAD(rel)
000070C3        mov     qword ptr [rsp+40H], rcx        ; 70C3 _ 48: 89. 4C 24, 40
000070C8        lea     ecx, ptr [rdi+rbx]              ; 70C8 _ 8D. 0C 1F
000070CB        mov     dword ptr [rsp+30H], ecx        ; 70CB _ 89. 4C 24, 30
000070CF        mov     dword ptr [rsp+38H], 64         ; 70CF _ C7. 44 24, 38, 00000040
000070D7        mov     dword ptr [rsp+28H], 0          ; 70D7 _ C7. 44 24, 28, 00000000
000070DF        mov     dword ptr [rsp+20H], 0          ; 70DF _ C7. 44 24, 20, 00000000
000070E7        mov     rcx, rax                        ; 70E7 _ 48: 89. C1
000070EA        mov     edx, 1                          ; 70EA _ BA, 00000001
000070EF        xor     r8d, r8d                        ; 70EF _ 45: 31. C0
000070F2        mov     r9d, 1                          ; 70F2 _ 41: B9, 00000001
000070F8        call    qword ptr [rax+10H]             ; 70F8 _ FF. 50, 10
000070FB        test    rax, rax                        ; 70FB _ 48: 85. C0
000070FE        jnz     ?_697                           ; 70FE _ 75, 0D
00007100        add     rbx, 64                         ; 7100 _ 48: 83. C3, 40
00007104        cmp     rbx, 65536                      ; 7104 _ 48: 81. FB, 00010000
0000710B        jc      ?_696                           ; 710B _ 72, AB
?_697:
0000710D        add     rsp, 72                         ; 710D _ 48: 83. C4, 48
00007111        pop     rbx                             ; 7111 _ 5B
00007112        pop     rdi                             ; 7112 _ 5F
00007113        pop     rsi                             ; 7113 _ 5E
00007114        pop     rbp                             ; 7114 _ 5D
00007115        ret                                     ; 7115 _ C3

?_698   LABEL NEAR
00007116        push    rbp                             ; 7116 _ 55
00007117        mov     rbp, rsp                        ; 7117 _ 48: 89. E5
0000711A        push    r15                             ; 711A _ 41: 57
0000711C        push    r14                             ; 711C _ 41: 56
0000711E        push    r12                             ; 711E _ 41: 54
00007120        push    rsi                             ; 7120 _ 56
00007121        push    rdi                             ; 7121 _ 57
00007122        push    rbx                             ; 7122 _ 53
00007123        sub     rsp, 80                         ; 7123 _ 48: 83. EC, 50
00007127        mov     r14, rdx                        ; 7127 _ 49: 89. D6
0000712A        mov     r15, rcx                        ; 712A _ 49: 89. CF
0000712D        mov     rbx, 8H                         ; 712D _ 48: BB, 8000000000000008
00007137        cmp     byte ptr [?_881], 0             ; 7137 _ 80. 3D, 00003B3A(rel), 00
0000713E        jne     ?_701                           ; 713E _ 0F 85, 000000B3
00007144        xor     ecx, ecx                        ; 7144 _ 31. C9
00007146        call    ?_707                           ; 7146 _ E8, 000001BA
0000714B        mov     rbx, rax                        ; 714B _ 48: 89. C3
0000714E        test    rbx, rbx                        ; 714E _ 48: 85. DB
00007151        js      ?_701                           ; 7151 _ 0F 88, 000000A0
00007157        mov     esi, 65536                      ; 7157 _ BE, 00010000
0000715C        mov     r12, qword ptr [?_856]          ; 715C _ 4C: 8B. 25, 00003A3D(rel)
00007163        cmp     r12, 65536                      ; 7163 _ 49: 81. FC, 00010000
0000716A        cmovnc  r12, rsi                        ; 716A _ 4C: 0F 43. E6
0000716E        and     r15, 0FFFFFFH                   ; 716E _ 49: 81. E7, 00FFFFFF
?_699:
00007175        test    rsi, rsi                        ; 7175 _ 48: 85. F6
00007178        jz      ?_700                           ; 7178 _ 74, 6E
0000717A        test    rbx, rbx                        ; 717A _ 48: 85. DB
0000717D        js      ?_700                           ; 717D _ 78, 69
0000717F        mov     rax, qword ptr [?_880]          ; 717F _ 48: 8B. 05, 00003AEA(rel)
00007186        mov     qword ptr [rsp+40H], r14        ; 7186 _ 4C: 89. 74 24, 40
0000718B        mov     dword ptr [rsp+38H], r12d       ; 718B _ 44: 89. 64 24, 38
00007190        mov     dword ptr [rsp+30H], r15d       ; 7190 _ 44: 89. 7C 24, 30
00007195        mov     dword ptr [rsp+28H], 1          ; 7195 _ C7. 44 24, 28, 00000001
0000719D        mov     dword ptr [rsp+20H], 1          ; 719D _ C7. 44 24, 20, 00000001
000071A5        mov     rcx, rax                        ; 71A5 _ 48: 89. C1
000071A8        mov     edx, 6                          ; 71A8 _ BA, 00000006
000071AD        xor     r8d, r8d                        ; 71AD _ 45: 31. C0
000071B0        mov     r9d, 1                          ; 71B0 _ 41: B9, 00000001
000071B6        call    qword ptr [rax+10H]             ; 71B6 _ FF. 50, 10
000071B9        mov     rbx, rax                        ; 71B9 _ 48: 89. C3
000071BC        test    rbx, rbx                        ; 71BC _ 48: 85. DB
000071BF        js      ?_700                           ; 71BF _ 78, 27
000071C1        sub     rsi, r12                        ; 71C1 _ 4C: 29. E6
000071C4        mov     rdi, qword ptr [?_856]          ; 71C4 _ 48: 8B. 3D, 000039D5(rel)
000071CB        cmp     rsi, rdi                        ; 71CB _ 48: 39. FE
000071CE        cmovbe  rdi, rsi                        ; 71CE _ 48: 0F 46. FE
000071D2        add     r14, r12                        ; 71D2 _ 4D: 01. E6
000071D5        add     r15, r12                        ; 71D5 _ 4D: 01. E7
000071D8        call    ?_710                           ; 71D8 _ E8, 00000205
000071DD        mov     rbx, rax                        ; 71DD _ 48: 89. C3
000071E0        test    rbx, rbx                        ; 71E0 _ 48: 85. DB
000071E3        mov     r12, rdi                        ; 71E3 _ 49: 89. FC
000071E6        jns     ?_699                           ; 71E6 _ 79, 8D
?_700:
000071E8        mov     ecx, 1                          ; 71E8 _ B9, 00000001
000071ED        call    ?_707                           ; 71ED _ E8, 00000113
000071F2        call    ?_013                           ; 71F2 _ E8, FFFF91F7
?_701:
000071F7        mov     rax, rbx                        ; 71F7 _ 48: 89. D8
000071FA        add     rsp, 80                         ; 71FA _ 48: 83. C4, 50
000071FE        pop     rbx                             ; 71FE _ 5B
000071FF        pop     rdi                             ; 71FF _ 5F
00007200        pop     rsi                             ; 7200 _ 5E
00007201        pop     r12                             ; 7201 _ 41: 5C
00007203        pop     r14                             ; 7203 _ 41: 5E
00007205        pop     r15                             ; 7205 _ 41: 5F
00007207        pop     rbp                             ; 7207 _ 5D
00007208        ret                                     ; 7208 _ C3

?_702   LABEL NEAR
00007209        push    rbp                             ; 7209 _ 55
0000720A        mov     rbp, rsp                        ; 720A _ 48: 89. E5
0000720D        push    rsi                             ; 720D _ 56
0000720E        push    rdi                             ; 720E _ 57
0000720F        sub     rsp, 80                         ; 720F _ 48: 83. EC, 50
00007213        mov     rsi, rcx                        ; 7213 _ 48: 89. CE
00007216        mov     rdi, 8H                         ; 7216 _ 48: BF, 8000000000000008
00007220        cmp     byte ptr [?_881], 0             ; 7220 _ 80. 3D, 00003A51(rel), 00
00007227        jnz     ?_703                           ; 7227 _ 75, 73
00007229        xor     ecx, ecx                        ; 7229 _ 31. C9
0000722B        call    ?_707                           ; 722B _ E8, 000000D5
00007230        mov     rdi, rax                        ; 7230 _ 48: 89. C7
00007233        test    rdi, rdi                        ; 7233 _ 48: 85. FF
00007236        js      ?_703                           ; 7236 _ 78, 64
00007238        mov     rax, qword ptr [?_880]          ; 7238 _ 48: 8B. 05, 00003A31(rel)
0000723F        and     esi, 0FFFFFFH                   ; 723F _ 81. E6, 00FFFFFF
00007245        mov     dword ptr [rsp+30H], esi        ; 7245 _ 89. 74 24, 30
00007249        mov     qword ptr [rsp+40H], 0          ; 7249 _ 48: C7. 44 24, 40, 00000000
00007252        mov     dword ptr [rsp+38H], 0          ; 7252 _ C7. 44 24, 38, 00000000
0000725A        mov     dword ptr [rsp+28H], 0          ; 725A _ C7. 44 24, 28, 00000000
00007262        mov     dword ptr [rsp+20H], 1          ; 7262 _ C7. 44 24, 20, 00000001
0000726A        mov     rcx, rax                        ; 726A _ 48: 89. C1
0000726D        mov     edx, 5                          ; 726D _ BA, 00000005
00007272        xor     r8d, r8d                        ; 7272 _ 45: 31. C0
00007275        xor     r9d, r9d                        ; 7275 _ 45: 31. C9
00007278        call    qword ptr [rax+10H]             ; 7278 _ FF. 50, 10
0000727B        mov     rsi, rax                        ; 727B _ 48: 89. C6
0000727E        call    ?_710                           ; 727E _ E8, 0000015F
00007283        mov     rdi, rax                        ; 7283 _ 48: 89. C7
00007286        mov     ecx, 1                          ; 7286 _ B9, 00000001
0000728B        call    ?_707                           ; 728B _ E8, 00000075
00007290        test    rsi, rsi                        ; 7290 _ 48: 85. F6
00007293        cmovne  rdi, rsi                        ; 7293 _ 48: 0F 45. FE
00007297        call    ?_013                           ; 7297 _ E8, FFFF9152
?_703:
0000729C        mov     rax, rdi                        ; 729C _ 48: 89. F8
0000729F        add     rsp, 80                         ; 729F _ 48: 83. C4, 50
000072A3        pop     rdi                             ; 72A3 _ 5F
000072A4        pop     rsi                             ; 72A4 _ 5E
000072A5        pop     rbp                             ; 72A5 _ 5D
000072A6        ret                                     ; 72A6 _ C3

?_704   LABEL NEAR
000072A7        push    rbp                             ; 72A7 _ 55
000072A8        mov     rbp, rsp                        ; 72A8 _ 48: 89. E5
000072AB        push    rsi                             ; 72AB _ 56
000072AC        push    rdi                             ; 72AC _ 57
000072AD        sub     rsp, 32                         ; 72AD _ 48: 83. EC, 20
000072B1        mov     rsi, rdx                        ; 72B1 _ 48: 89. D6
000072B4        mov     rdi, rcx                        ; 72B4 _ 48: 89. CF
000072B7        mov     rcx, rdi                        ; 72B7 _ 48: 89. F9
000072BA        call    ?_702                           ; 72BA _ E8, FFFFFF4A
000072BF        test    rax, rax                        ; 72BF _ 48: 85. C0
000072C2        jz      ?_705                           ; 72C2 _ 74, 08
000072C4        add     rsp, 32                         ; 72C4 _ 48: 83. C4, 20
000072C8        pop     rdi                             ; 72C8 _ 5F
000072C9        pop     rsi                             ; 72C9 _ 5E
000072CA        pop     rbp                             ; 72CA _ 5D
000072CB        ret                                     ; 72CB _ C3

?_705:
000072CC        mov     rcx, rdi                        ; 72CC _ 48: 89. F9
000072CF        mov     rdx, rsi                        ; 72CF _ 48: 89. F2
000072D2        add     rsp, 32                         ; 72D2 _ 48: 83. C4, 20
000072D6        pop     rdi                             ; 72D6 _ 5F
000072D7        pop     rsi                             ; 72D7 _ 5E
000072D8        pop     rbp                             ; 72D8 _ 5D
000072D9        jmp     ?_698                           ; 72D9 _ E9, FFFFFE38

?_706   LABEL NEAR
000072DE        mov     qword ptr [?_856], 1            ; 72DE _ 48: C7. 05, 000038B7(rel), 00000001
000072E9        mov     qword ptr [?_880], 0            ; 72E9 _ 48: C7. 05, 0000397C(rel), 00000000
000072F4        mov     byte ptr [?_882], 0             ; 72F4 _ C6. 05, 0000397E(rel), 00
000072FB        mov     byte ptr [?_881], 0             ; 72FB _ C6. 05, 00003976(rel), 00
00007302        xor     eax, eax                        ; 7302 _ 31. C0
00007304        ret                                     ; 7304 _ C3

?_707   LABEL NEAR
00007305        push    rbp                             ; 7305 _ 55
00007306        mov     rbp, rsp                        ; 7306 _ 48: 89. E5
00007309        push    rsi                             ; 7309 _ 56
0000730A        sub     rsp, 88                         ; 730A _ 48: 83. EC, 58
0000730E        mov     esi, ecx                        ; 730E _ 89. CE
00007310        call    ?_710                           ; 7310 _ E8, 000000CD
00007315        test    rax, rax                        ; 7315 _ 48: 85. C0
00007318        jne     ?_709                           ; 7318 _ 0F 85, 000000BD
0000731E        mov     al, 28                          ; 731E _ B0, 1C
00007320        test    sil, sil                        ; 7320 _ 40: 84. F6
00007323        jnz     ?_708                           ; 7323 _ 75, 02
00007325        xor     al, al                          ; 7325 _ 30. C0
?_708:
00007327        mov     byte ptr [rbp-9H], al           ; 7327 _ 88. 45, F7
0000732A        mov     rax, qword ptr [?_880]          ; 732A _ 48: 8B. 05, 0000393F(rel)
00007331        lea     rcx, ptr [rbp-9H]               ; 7331 _ 48: 8D. 4D, F7
00007335        mov     qword ptr [rsp+40H], rcx        ; 7335 _ 48: 89. 4C 24, 40
0000733A        mov     dword ptr [rsp+38H], 1          ; 733A _ C7. 44 24, 38, 00000001
00007342        mov     dword ptr [rsp+30H], 0          ; 7342 _ C7. 44 24, 30, 00000000
0000734A        mov     dword ptr [rsp+28H], 1          ; 734A _ C7. 44 24, 28, 00000001
00007352        mov     dword ptr [rsp+20H], 1          ; 7352 _ C7. 44 24, 20, 00000001
0000735A        mov     rcx, rax                        ; 735A _ 48: 89. C1
0000735D        mov     edx, 7                          ; 735D _ BA, 00000007
00007362        xor     r8d, r8d                        ; 7362 _ 45: 31. C0
00007365        mov     r9d, 1                          ; 7365 _ 41: B9, 00000001
0000736B        call    qword ptr [rax+10H]             ; 736B _ FF. 50, 10
0000736E        test    rax, rax                        ; 736E _ 48: 85. C0
00007371        js      ?_709                           ; 7371 _ 78, 68
00007373        call    ?_710                           ; 7373 _ E8, 0000006A
00007378        test    rax, rax                        ; 7378 _ 48: 85. C0
0000737B        jnz     ?_709                           ; 737B _ 75, 5E
0000737D        mov     rax, qword ptr [?_880]          ; 737D _ 48: 8B. 05, 000038EC(rel)
00007384        lea     rcx, ptr [rbp-0AH]              ; 7384 _ 48: 8D. 4D, F6
00007388        mov     qword ptr [rsp+40H], rcx        ; 7388 _ 48: 89. 4C 24, 40
0000738D        mov     dword ptr [rsp+38H], 1          ; 738D _ C7. 44 24, 38, 00000001
00007395        mov     dword ptr [rsp+30H], 0          ; 7395 _ C7. 44 24, 30, 00000000
0000739D        mov     dword ptr [rsp+28H], 0          ; 739D _ C7. 44 24, 28, 00000000
000073A5        mov     dword ptr [rsp+20H], 0          ; 73A5 _ C7. 44 24, 20, 00000000
000073AD        mov     rcx, rax                        ; 73AD _ 48: 89. C1
000073B0        mov     edx, 2                          ; 73B0 _ BA, 00000002
000073B5        xor     r8d, r8d                        ; 73B5 _ 45: 31. C0
000073B8        mov     r9d, 1                          ; 73B8 _ 41: B9, 00000001
000073BE        call    qword ptr [rax+10H]             ; 73BE _ FF. 50, 10
000073C1        test    rax, rax                        ; 73C1 _ 48: 85. C0
000073C4        js      ?_709                           ; 73C4 _ 78, 15
000073C6        mov     cl, byte ptr [rbp-9H]           ; 73C6 _ 8A. 4D, F7
000073C9        xor     cl, byte ptr [rbp-0AH]          ; 73C9 _ 32. 4D, F6
000073CC        test    cl, 1CH                         ; 73CC _ F6. C1, 1C
000073CF        jz      ?_709                           ; 73CF _ 74, 0A
000073D1        mov     rax, 7H                         ; 73D1 _ 48: B8, 8000000000000007
?_709:
000073DB        add     rsp, 88                         ; 73DB _ 48: 83. C4, 58
000073DF        pop     rsi                             ; 73DF _ 5E
000073E0        pop     rbp                             ; 73E0 _ 5D
000073E1        ret                                     ; 73E1 _ C3

?_710   LABEL NEAR
000073E2        push    rbp                             ; 73E2 _ 55
000073E3        mov     rbp, rsp                        ; 73E3 _ 48: 89. E5
000073E6        push    rsi                             ; 73E6 _ 56
000073E7        push    rdi                             ; 73E7 _ 57
000073E8        push    rbx                             ; 73E8 _ 53
000073E9        sub     rsp, 88                         ; 73E9 _ 48: 83. EC, 58
000073ED        xor     esi, esi                        ; 73ED _ 31. F6
000073EF        cmp     byte ptr [?_882], 0             ; 73EF _ 80. 3D, 00003883(rel), 00
000073F6        jne     ?_714                           ; 73F6 _ 0F 85, 0000009A
000073FC        mov     byte ptr [rbp-19H], 1           ; 73FC _ C6. 45, E7, 01
00007400        mov     rsi, 6H                         ; 7400 _ 48: BE, 8000000000000006
0000740A        mov     edi, 4294967295                 ; 740A _ BF, FFFFFFFF
0000740F        lea     rbx, ptr [rbp-19H]              ; 740F _ 48: 8D. 5D, E7
00007413        jmp     ?_712                           ; 7413 _ EB, 12

?_711:
00007415        mov     rax, qword ptr [?_889]          ; 7415 _ 48: 8B. 05, 0000388C(rel)
0000741C        mov     ecx, 10                         ; 741C _ B9, 0000000A
00007421        call    qword ptr [rax+0F8H]            ; 7421 _ FF. 90, 000000F8
?_712:
00007427        inc     edi                             ; 7427 _ FF. C7
00007429        cmp     edi, 99999                      ; 7429 _ 81. FF, 0001869F
0000742F        ja      ?_713                           ; 742F _ 77, 4E
00007431        mov     rax, qword ptr [?_880]          ; 7431 _ 48: 8B. 05, 00003838(rel)
00007438        mov     qword ptr [rsp+40H], rbx        ; 7438 _ 48: 89. 5C 24, 40
0000743D        mov     dword ptr [rsp+38H], 1          ; 743D _ C7. 44 24, 38, 00000001
00007445        mov     dword ptr [rsp+30H], 0          ; 7445 _ C7. 44 24, 30, 00000000
0000744D        mov     dword ptr [rsp+28H], 0          ; 744D _ C7. 44 24, 28, 00000000
00007455        mov     dword ptr [rsp+20H], 0          ; 7455 _ C7. 44 24, 20, 00000000
0000745D        mov     rcx, rax                        ; 745D _ 48: 89. C1
00007460        mov     edx, 2                          ; 7460 _ BA, 00000002
00007465        xor     r8d, r8d                        ; 7465 _ 45: 31. C0
00007468        mov     r9d, 1                          ; 7468 _ 41: B9, 00000001
0000746E        call    qword ptr [rax+10H]             ; 746E _ FF. 50, 10
00007471        mov     rsi, rax                        ; 7471 _ 48: 89. C6
00007474        test    rsi, rsi                        ; 7474 _ 48: 85. F6
00007477        js      ?_714                           ; 7477 _ 78, 1D
00007479        test    byte ptr [rbp-19H], 1H          ; 7479 _ F6. 45, E7, 01
0000747D        jnz     ?_711                           ; 747D _ 75, 96
?_713:
0000747F        test    rsi, rsi                        ; 747F _ 48: 85. F6
00007482        jnz     ?_714                           ; 7482 _ 75, 12
00007484        xor     esi, esi                        ; 7484 _ 31. F6
00007486        test    byte ptr [rbp-19H], 1H          ; 7486 _ F6. 45, E7, 01
0000748A        jz      ?_714                           ; 748A _ 74, 0A
0000748C        mov     rsi, 12H                        ; 748C _ 48: BE, 8000000000000012
?_714:
00007496        mov     rax, rsi                        ; 7496 _ 48: 89. F0
00007499        add     rsp, 88                         ; 7499 _ 48: 83. C4, 58
0000749D        pop     rbx                             ; 749D _ 5B
0000749E        pop     rdi                             ; 749E _ 5F
0000749F        pop     rsi                             ; 749F _ 5E
000074A0        pop     rbp                             ; 74A0 _ 5D
000074A1        ret                                     ; 74A1 _ C3

?_715   LABEL NEAR
000074A2        push    rbp                             ; 74A2 _ 55
000074A3        mov     rbp, rsp                        ; 74A3 _ 48: 89. E5
000074A6        push    rsi                             ; 74A6 _ 56
000074A7        push    rdi                             ; 74A7 _ 57
000074A8        sub     rsp, 96                         ; 74A8 _ 48: 83. EC, 60
000074AC        call    ?_620                           ; 74AC _ E8, FFFFF146
000074B1        add     rax, -9                         ; 74B1 _ 48: 83. C0, F7
000074B5        xor     edi, edi                        ; 74B5 _ 31. FF
000074B7        cmp     rax, 1                          ; 74B7 _ 48: 83. F8, 01
000074BB        ja      ?_717                           ; 74BB _ 0F 87, 00000116
000074C1        mov     rax, qword ptr [?_889]          ; 74C1 _ 48: 8B. 05, 000037E0(rel)
000074C8        lea     rcx, ptr [?_857]                ; 74C8 _ 48: 8D. 0D, 000036D9(rel)
000074CF        xor     edi, edi                        ; 74CF _ 31. FF
000074D1        lea     r8, ptr [?_883]                 ; 74D1 _ 4C: 8D. 05, 000037A8(rel)
000074D8        xor     edx, edx                        ; 74D8 _ 31. D2
000074DA        call    qword ptr [rax+140H]            ; 74DA _ FF. 90, 00000140
000074E0        test    rax, rax                        ; 74E0 _ 48: 85. C0
000074E3        jne     ?_717                           ; 74E3 _ 0F 85, 000000EE
000074E9        mov     rax, qword ptr [?_883]          ; 74E9 _ 48: 8B. 05, 00003790(rel)
000074F0        lea     rcx, ptr [rbp-14H]              ; 74F0 _ 48: 8D. 4D, EC
000074F4        mov     qword ptr [rsp+40H], rcx        ; 74F4 _ 48: 89. 4C 24, 40
000074F9        mov     dword ptr [rsp+48H], 0          ; 74F9 _ C7. 44 24, 48, 00000000
00007501        mov     dword ptr [rsp+38H], 3          ; 7501 _ C7. 44 24, 38, 00000003
00007509        mov     qword ptr [rsp+30H], 0          ; 7509 _ 48: C7. 44 24, 30, 00000000
00007512        mov     dword ptr [rsp+28H], 0          ; 7512 _ C7. 44 24, 28, 00000000
0000751A        mov     dword ptr [rsp+20H], 0          ; 751A _ C7. 44 24, 20, 00000000
00007522        mov     rcx, rax                        ; 7522 _ 48: 89. C1
00007525        xor     edx, edx                        ; 7525 _ 31. D2
00007527        xor     r8d, r8d                        ; 7527 _ 45: 31. C0
0000752A        mov     r9d, 1                          ; 752A _ 41: B9, 00000001
00007530        call    qword ptr [rax+10H]             ; 7530 _ FF. 50, 10
00007533        xor     edi, edi                        ; 7533 _ 31. FF
00007535        test    rax, rax                        ; 7535 _ 48: 85. C0
00007538        jne     ?_717                           ; 7538 _ 0F 85, 00000099
0000753E        movzx   eax, byte ptr [rbp-14H]         ; 753E _ 0F B6. 45, EC
00007542        shl     eax, 8                          ; 7542 _ C1. E0, 08
00007545        movzx   ecx, byte ptr [rbp-12H]         ; 7545 _ 0F B6. 4D, EE
00007549        or      ecx, eax                        ; 7549 _ 09. C1
0000754B        movzx   ecx, cx                         ; 754B _ 0F B7. C9
0000754E        call    ?_657                           ; 754E _ E8, FFFFF3FB
00007553        mov     rsi, rax                        ; 7553 _ 48: 89. C6
00007556        xor     edi, edi                        ; 7556 _ 31. FF
00007558        test    rsi, rsi                        ; 7558 _ 48: 85. F6
0000755B        jz      ?_717                           ; 755B _ 74, 7A
0000755D        mov     rax, qword ptr [rsi+18H]        ; 755D _ 48: 8B. 46, 18
00007561        mov     qword ptr [?_858], rax          ; 7561 _ 48: 89. 05, 00003650(rel)
00007568        call    ?_653                           ; 7568 _ E8, FFFFF36E
0000756D        test    rax, rax                        ; 756D _ 48: 85. C0
00007570        setne   byte ptr [?_884]                ; 7570 _ 0F 95. 05, 00003711(rel)
00007577        call    ?_650                           ; 7577 _ E8, FFFFF32B
0000757C        lea     r8, ptr [?_730]                 ; 757C _ 4C: 8D. 05, 00000290(rel)
00007583        lea     rcx, ptr [?_728]                ; 7583 _ 48: 8D. 0D, 00000252(rel)
0000758A        lea     rdx, ptr [?_726]                ; 758A _ 48: 8D. 15, 000001B7(rel)
00007591        lea     rdi, ptr [?_721]                ; 7591 _ 48: 8D. 3D, 000000C5(rel)
00007598        lea     rax, ptr [?_718]                ; 7598 _ 48: 8D. 05, 00000043(rel)
0000759F        mov     qword ptr [rsi+28H], rax        ; 759F _ 48: 89. 46, 28
000075A3        mov     qword ptr [rsi+30H], rdi        ; 75A3 _ 48: 89. 7E, 30
000075A7        mov     qword ptr [rsi+38H], rdx        ; 75A7 _ 48: 89. 56, 38
000075AB        mov     qword ptr [rsi+40H], rcx        ; 75AB _ 48: 89. 4E, 40
000075AF        mov     qword ptr [rsi+48H], r8         ; 75AF _ 4C: 89. 46, 48
000075B3        mov     dword ptr [rsi+10H], 65536      ; 75B3 _ C7. 46, 10, 00010000
000075BA        mov     eax, dword ptr [rsi+20H]        ; 75BA _ 8B. 46, 20
000075BD        mov     ecx, eax                        ; 75BD _ 89. C1
000075BF        and     ecx, 0FFFFFFFEH                 ; 75BF _ 83. E1, FE
000075C2        mov     dword ptr [rsi+20H], ecx        ; 75C2 _ 89. 4E, 20
000075C5        cmp     byte ptr [?_884], 0             ; 75C5 _ 80. 3D, 000036BC(rel), 00
000075CC        jz      ?_716                           ; 75CC _ 74, 06
000075CE        or      eax, 1H                         ; 75CE _ 83. C8, 01
000075D1        mov     dword ptr [rsi+20H], eax        ; 75D1 _ 89. 46, 20
?_716:
000075D4        mov     rdi, rsi                        ; 75D4 _ 48: 89. F7
?_717:
000075D7        mov     rax, rdi                        ; 75D7 _ 48: 89. F8
000075DA        add     rsp, 96                         ; 75DA _ 48: 83. C4, 60
000075DE        pop     rdi                             ; 75DE _ 5F
000075DF        pop     rsi                             ; 75DF _ 5E
000075E0        pop     rbp                             ; 75E0 _ 5D
000075E1        ret                                     ; 75E1 _ C3

?_718   LABEL NEAR
000075E2        push    rbp                             ; 75E2 _ 55
000075E3        mov     rbp, rsp                        ; 75E3 _ 48: 89. E5
000075E6        push    rsi                             ; 75E6 _ 56
000075E7        push    rdi                             ; 75E7 _ 57
000075E8        push    rbx                             ; 75E8 _ 53
000075E9        sub     rsp, 88                         ; 75E9 _ 48: 83. EC, 58
000075ED        mov     rsi, rdx                        ; 75ED _ 48: 89. D6
000075F0        mov     rdi, rcx                        ; 75F0 _ 48: 89. CF
000075F3        xor     ebx, ebx                        ; 75F3 _ 31. DB
?_719:
000075F5        lea     rcx, ptr [rdi+rbx]              ; 75F5 _ 48: 8D. 0C 1F
000075F9        lea     rdx, ptr [rsi+rbx]              ; 75F9 _ 48: 8D. 14 1E
000075FD        mov     rax, qword ptr [?_883]          ; 75FD _ 48: 8B. 05, 0000367C(rel)
00007604        mov     qword ptr [rsp+40H], rdx        ; 7604 _ 48: 89. 54 24, 40
00007609        mov     qword ptr [rsp+30H], rcx        ; 7609 _ 48: 89. 4C 24, 30
0000760E        mov     dword ptr [rsp+48H], 0          ; 760E _ C7. 44 24, 48, 00000000
00007616        mov     dword ptr [rsp+38H], 64         ; 7616 _ C7. 44 24, 38, 00000040
0000761E        mov     dword ptr [rsp+28H], 0          ; 761E _ C7. 44 24, 28, 00000000
00007626        mov     dword ptr [rsp+20H], 0          ; 7626 _ C7. 44 24, 20, 00000000
0000762E        mov     rcx, rax                        ; 762E _ 48: 89. C1
00007631        mov     edx, 4                          ; 7631 _ BA, 00000004
00007636        xor     r8d, r8d                        ; 7636 _ 45: 31. C0
00007639        mov     r9d, 1                          ; 7639 _ 41: B9, 00000001
0000763F        call    qword ptr [rax+10H]             ; 763F _ FF. 50, 10
00007642        test    rax, rax                        ; 7642 _ 48: 85. C0
00007645        jnz     ?_720                           ; 7645 _ 75, 0D
00007647        add     rbx, 64                         ; 7647 _ 48: 83. C3, 40
0000764B        cmp     rbx, 65536                      ; 764B _ 48: 81. FB, 00010000
00007652        jc      ?_719                           ; 7652 _ 72, A1
?_720:
00007654        add     rsp, 88                         ; 7654 _ 48: 83. C4, 58
00007658        pop     rbx                             ; 7658 _ 5B
00007659        pop     rdi                             ; 7659 _ 5F
0000765A        pop     rsi                             ; 765A _ 5E
0000765B        pop     rbp                             ; 765B _ 5D
0000765C        ret                                     ; 765C _ C3

?_721   LABEL NEAR
0000765D        push    rbp                             ; 765D _ 55
0000765E        mov     rbp, rsp                        ; 765E _ 48: 89. E5
00007661        push    r15                             ; 7661 _ 41: 57
00007663        push    r14                             ; 7663 _ 41: 56
00007665        push    rsi                             ; 7665 _ 56
00007666        push    rdi                             ; 7666 _ 57
00007667        push    rbx                             ; 7667 _ 53
00007668        sub     rsp, 88                         ; 7668 _ 48: 83. EC, 58
0000766C        mov     r14, rdx                        ; 766C _ 49: 89. D6
0000766F        mov     r15, rcx                        ; 766F _ 49: 89. CF
00007672        mov     rbx, 8H                         ; 7672 _ 48: BB, 8000000000000008
0000767C        cmp     byte ptr [?_884], 0             ; 767C _ 80. 3D, 00003605(rel), 00
00007683        jne     ?_725                           ; 7683 _ 0F 85, 000000AF
00007689        xor     ecx, ecx                        ; 7689 _ 31. C9
0000768B        call    ?_731                           ; 768B _ E8, 000001A3
00007690        mov     rbx, rax                        ; 7690 _ 48: 89. C3
00007693        test    rbx, rbx                        ; 7693 _ 48: 85. DB
00007696        js      ?_725                           ; 7696 _ 0F 88, 0000009C
0000769C        mov     esi, 65536                      ; 769C _ BE, 00010000
000076A1        mov     rdi, qword ptr [?_858]          ; 76A1 _ 48: 8B. 3D, 00003510(rel)
000076A8        cmp     rdi, 65536                      ; 76A8 _ 48: 81. FF, 00010000
000076AF        cmovnc  rdi, rsi                        ; 76AF _ 48: 0F 43. FE
000076B3        and     r15, 0FFFFFFH                   ; 76B3 _ 49: 81. E7, 00FFFFFF
000076BA        jmp     ?_723                           ; 76BA _ EB, 1A

?_722:
000076BC        sub     rsi, rdi                        ; 76BC _ 48: 29. FE
000076BF        mov     rax, qword ptr [?_858]          ; 76BF _ 48: 8B. 05, 000034F2(rel)
000076C6        cmp     rsi, rax                        ; 76C6 _ 48: 39. C6
000076C9        cmovbe  rax, rsi                        ; 76C9 _ 48: 0F 46. C6
000076CD        add     r14, rdi                        ; 76CD _ 49: 01. FE
000076D0        add     r15, rdi                        ; 76D0 _ 49: 01. FF
000076D3        mov     rdi, rax                        ; 76D3 _ 48: 89. C7
?_723:
000076D6        test    rsi, rsi                        ; 76D6 _ 48: 85. F6
000076D9        jz      ?_724                           ; 76D9 _ 74, 4E
000076DB        test    rbx, rbx                        ; 76DB _ 48: 85. DB
000076DE        js      ?_724                           ; 76DE _ 78, 49
000076E0        mov     rax, qword ptr [?_883]          ; 76E0 _ 48: 8B. 05, 00003599(rel)
000076E7        mov     qword ptr [rsp+40H], r14        ; 76E7 _ 4C: 89. 74 24, 40
000076EC        mov     dword ptr [rsp+38H], edi        ; 76EC _ 89. 7C 24, 38
000076F0        mov     qword ptr [rsp+30H], r15        ; 76F0 _ 4C: 89. 7C 24, 30
000076F5        mov     dword ptr [rsp+48H], 0          ; 76F5 _ C7. 44 24, 48, 00000000
000076FD        mov     dword ptr [rsp+28H], 1          ; 76FD _ C7. 44 24, 28, 00000001
00007705        mov     dword ptr [rsp+20H], 1          ; 7705 _ C7. 44 24, 20, 00000001
0000770D        mov     rcx, rax                        ; 770D _ 48: 89. C1
00007710        mov     edx, 3                          ; 7710 _ BA, 00000003
00007715        xor     r8d, r8d                        ; 7715 _ 45: 31. C0
00007718        mov     r9d, 1                          ; 7718 _ 41: B9, 00000001
0000771E        call    qword ptr [rax+10H]             ; 771E _ FF. 50, 10
00007721        mov     rbx, rax                        ; 7721 _ 48: 89. C3
00007724        test    rbx, rbx                        ; 7724 _ 48: 85. DB
00007727        jns     ?_722                           ; 7727 _ 79, 93
?_724:
00007729        mov     ecx, 1                          ; 7729 _ B9, 00000001
0000772E        call    ?_731                           ; 772E _ E8, 00000100
00007733        call    ?_013                           ; 7733 _ E8, FFFF8CB6
?_725:
00007738        mov     rax, rbx                        ; 7738 _ 48: 89. D8
0000773B        add     rsp, 88                         ; 773B _ 48: 83. C4, 58
0000773F        pop     rbx                             ; 773F _ 5B
00007740        pop     rdi                             ; 7740 _ 5F
00007741        pop     rsi                             ; 7741 _ 5E
00007742        pop     r14                             ; 7742 _ 41: 5E
00007744        pop     r15                             ; 7744 _ 41: 5F
00007746        pop     rbp                             ; 7746 _ 5D
00007747        ret                                     ; 7747 _ C3

?_726   LABEL NEAR
00007748        push    rbp                             ; 7748 _ 55
00007749        mov     rbp, rsp                        ; 7749 _ 48: 89. E5
0000774C        push    rsi                             ; 774C _ 56
0000774D        sub     rsp, 88                         ; 774D _ 48: 83. EC, 58
00007751        mov     rsi, rcx                        ; 7751 _ 48: 89. CE
00007754        mov     rax, 8H                         ; 7754 _ 48: B8, 8000000000000008
0000775E        cmp     byte ptr [?_884], 0             ; 775E _ 80. 3D, 00003523(rel), 00
00007765        jnz     ?_727                           ; 7765 _ 75, 6E
00007767        xor     ecx, ecx                        ; 7767 _ 31. C9
00007769        call    ?_731                           ; 7769 _ E8, 000000C5
0000776E        test    rax, rax                        ; 776E _ 48: 85. C0
00007771        js      ?_727                           ; 7771 _ 78, 62
00007773        mov     rax, qword ptr [?_883]          ; 7773 _ 48: 8B. 05, 00003506(rel)
0000777A        and     rsi, 0FFFFFFH                   ; 777A _ 48: 81. E6, 00FFFFFF
00007781        mov     qword ptr [rsp+30H], rsi        ; 7781 _ 48: 89. 74 24, 30
00007786        mov     dword ptr [rsp+48H], 0          ; 7786 _ C7. 44 24, 48, 00000000
0000778E        mov     qword ptr [rsp+40H], 0          ; 778E _ 48: C7. 44 24, 40, 00000000
00007797        mov     dword ptr [rsp+38H], 0          ; 7797 _ C7. 44 24, 38, 00000000
0000779F        mov     dword ptr [rsp+28H], 0          ; 779F _ C7. 44 24, 28, 00000000
000077A7        mov     dword ptr [rsp+20H], 1          ; 77A7 _ C7. 44 24, 20, 00000001
000077AF        mov     rcx, rax                        ; 77AF _ 48: 89. C1
000077B2        mov     edx, 5                          ; 77B2 _ BA, 00000005
000077B7        xor     r8d, r8d                        ; 77B7 _ 45: 31. C0
000077BA        xor     r9d, r9d                        ; 77BA _ 45: 31. C9
000077BD        call    qword ptr [rax+10H]             ; 77BD _ FF. 50, 10
000077C0        mov     rsi, rax                        ; 77C0 _ 48: 89. C6
000077C3        mov     ecx, 1                          ; 77C3 _ B9, 00000001
000077C8        call    ?_731                           ; 77C8 _ E8, 00000066
000077CD        call    ?_013                           ; 77CD _ E8, FFFF8C1C
000077D2        mov     rax, rsi                        ; 77D2 _ 48: 89. F0
?_727:
000077D5        add     rsp, 88                         ; 77D5 _ 48: 83. C4, 58
000077D9        pop     rsi                             ; 77D9 _ 5E
000077DA        pop     rbp                             ; 77DA _ 5D
000077DB        ret                                     ; 77DB _ C3

?_728   LABEL NEAR
000077DC        push    rbp                             ; 77DC _ 55
000077DD        mov     rbp, rsp                        ; 77DD _ 48: 89. E5
000077E0        push    rsi                             ; 77E0 _ 56
000077E1        push    rdi                             ; 77E1 _ 57
000077E2        sub     rsp, 32                         ; 77E2 _ 48: 83. EC, 20
000077E6        mov     rsi, rdx                        ; 77E6 _ 48: 89. D6
000077E9        mov     rdi, rcx                        ; 77E9 _ 48: 89. CF
000077EC        mov     rcx, rdi                        ; 77EC _ 48: 89. F9
000077EF        call    ?_726                           ; 77EF _ E8, FFFFFF54
000077F4        test    rax, rax                        ; 77F4 _ 48: 85. C0
000077F7        jz      ?_729                           ; 77F7 _ 74, 08
000077F9        add     rsp, 32                         ; 77F9 _ 48: 83. C4, 20
000077FD        pop     rdi                             ; 77FD _ 5F
000077FE        pop     rsi                             ; 77FE _ 5E
000077FF        pop     rbp                             ; 77FF _ 5D
00007800        ret                                     ; 7800 _ C3

?_729:
00007801        mov     rcx, rdi                        ; 7801 _ 48: 89. F9
00007804        mov     rdx, rsi                        ; 7804 _ 48: 89. F2
00007807        add     rsp, 32                         ; 7807 _ 48: 83. C4, 20
0000780B        pop     rdi                             ; 780B _ 5F
0000780C        pop     rsi                             ; 780C _ 5E
0000780D        pop     rbp                             ; 780D _ 5D
0000780E        jmp     ?_721                           ; 780E _ E9, FFFFFE4A

?_730   LABEL NEAR
00007813        mov     qword ptr [?_858], 1            ; 7813 _ 48: C7. 05, 0000339A(rel), 00000001
0000781E        mov     qword ptr [?_883], 0            ; 781E _ 48: C7. 05, 00003457(rel), 00000000
00007829        mov     byte ptr [?_884], 0             ; 7829 _ C6. 05, 00003458(rel), 00
00007830        xor     eax, eax                        ; 7830 _ 31. C0
00007832        ret                                     ; 7832 _ C3

?_731   LABEL NEAR
00007833        push    rbp                             ; 7833 _ 55
00007834        mov     rbp, rsp                        ; 7834 _ 48: 89. E5
00007837        sub     rsp, 96                         ; 7837 _ 48: 83. EC, 60
0000783B        mov     al, 28                          ; 783B _ B0, 1C
0000783D        test    cl, cl                          ; 783D _ 84. C9
0000783F        jnz     ?_732                           ; 783F _ 75, 02
00007841        xor     al, al                          ; 7841 _ 30. C0
?_732:
00007843        mov     byte ptr [rbp-1H], al           ; 7843 _ 88. 45, FF
00007846        mov     rax, qword ptr [?_883]          ; 7846 _ 48: 8B. 05, 00003433(rel)
0000784D        lea     rcx, ptr [rbp-1H]               ; 784D _ 48: 8D. 4D, FF
00007851        mov     qword ptr [rsp+40H], rcx        ; 7851 _ 48: 89. 4C 24, 40
00007856        mov     dword ptr [rsp+48H], 0          ; 7856 _ C7. 44 24, 48, 00000000
0000785E        mov     dword ptr [rsp+38H], 1          ; 785E _ C7. 44 24, 38, 00000001
00007866        mov     qword ptr [rsp+30H], 0          ; 7866 _ 48: C7. 44 24, 30, 00000000
0000786F        mov     dword ptr [rsp+28H], 1          ; 786F _ C7. 44 24, 28, 00000001
00007877        mov     dword ptr [rsp+20H], 1          ; 7877 _ C7. 44 24, 20, 00000001
0000787F        mov     rcx, rax                        ; 787F _ 48: 89. C1
00007882        mov     edx, 2                          ; 7882 _ BA, 00000002
00007887        xor     r8d, r8d                        ; 7887 _ 45: 31. C0
0000788A        mov     r9d, 1                          ; 788A _ 41: B9, 00000001
00007890        call    qword ptr [rax+10H]             ; 7890 _ FF. 50, 10
00007893        test    rax, rax                        ; 7893 _ 48: 85. C0
00007896        js      ?_733                           ; 7896 _ 78, 67
00007898        mov     rax, qword ptr [?_883]          ; 7898 _ 48: 8B. 05, 000033E1(rel)
0000789F        lea     rcx, ptr [rbp-2H]               ; 789F _ 48: 8D. 4D, FE
000078A3        mov     qword ptr [rsp+40H], rcx        ; 78A3 _ 48: 89. 4C 24, 40
000078A8        mov     dword ptr [rsp+48H], 0          ; 78A8 _ C7. 44 24, 48, 00000000
000078B0        mov     dword ptr [rsp+38H], 1          ; 78B0 _ C7. 44 24, 38, 00000001
000078B8        mov     qword ptr [rsp+30H], 0          ; 78B8 _ 48: C7. 44 24, 30, 00000000
000078C1        mov     dword ptr [rsp+28H], 0          ; 78C1 _ C7. 44 24, 28, 00000000
000078C9        mov     dword ptr [rsp+20H], 0          ; 78C9 _ C7. 44 24, 20, 00000000
000078D1        mov     rcx, rax                        ; 78D1 _ 48: 89. C1
000078D4        mov     edx, 6                          ; 78D4 _ BA, 00000006
000078D9        xor     r8d, r8d                        ; 78D9 _ 45: 31. C0
000078DC        mov     r9d, 1                          ; 78DC _ 41: B9, 00000001
000078E2        call    qword ptr [rax+10H]             ; 78E2 _ FF. 50, 10
000078E5        test    rax, rax                        ; 78E5 _ 48: 85. C0
000078E8        js      ?_733                           ; 78E8 _ 78, 15
000078EA        mov     cl, byte ptr [rbp-1H]           ; 78EA _ 8A. 4D, FF
000078ED        xor     cl, byte ptr [rbp-2H]           ; 78ED _ 32. 4D, FE
000078F0        test    cl, 1CH                         ; 78F0 _ F6. C1, 1C
000078F3        jz      ?_733                           ; 78F3 _ 74, 0A
000078F5        mov     rax, 7H                         ; 78F5 _ 48: B8, 8000000000000007
?_733:
000078FF        add     rsp, 96                         ; 78FF _ 48: 83. C4, 60
00007903        pop     rbp                             ; 7903 _ 5D
00007904        ret                                     ; 7904 _ C3

?_734   LABEL NEAR
00007905        push    rbp                             ; 7905 _ 55
00007906        mov     rbp, rsp                        ; 7906 _ 48: 89. E5
00007909        push    rsi                             ; 7909 _ 56
0000790A        push    rdi                             ; 790A _ 57
0000790B        sub     rsp, 96                         ; 790B _ 48: 83. EC, 60
0000790F        call    ?_620                           ; 790F _ E8, FFFFECE3
00007914        add     rax, -11                        ; 7914 _ 48: 83. C0, F5
00007918        xor     esi, esi                        ; 7918 _ 31. F6
0000791A        cmp     rax, 3                          ; 791A _ 48: 83. F8, 03
0000791E        ja      ?_749                           ; 791E _ 0F 87, 00000276
00007924        mov     rax, qword ptr [?_889]          ; 7924 _ 48: 8B. 05, 0000337D(rel)
0000792B        lea     rcx, ptr [?_859]                ; 792B _ 48: 8D. 0D, 0000328E(rel)
00007932        xor     edi, edi                        ; 7932 _ 31. FF
00007934        lea     r8, ptr [?_885]                 ; 7934 _ 4C: 8D. 05, 00003355(rel)
0000793B        mov     rdx, rdi                        ; 793B _ 48: 89. FA
0000793E        call    qword ptr [rax+140H]            ; 793E _ FF. 90, 00000140
00007944        test    rax, rax                        ; 7944 _ 48: 85. C0
00007947        jz      ?_735                           ; 7947 _ 74, 57
00007949        mov     rax, qword ptr [?_889]          ; 7949 _ 48: 8B. 05, 00003358(rel)
00007950        lea     rcx, ptr [?_860]                ; 7950 _ 48: 8D. 0D, 00003279(rel)
00007957        lea     r8, ptr [?_885]                 ; 7957 _ 4C: 8D. 05, 00003332(rel)
0000795E        xor     edx, edx                        ; 795E _ 31. D2
00007960        call    qword ptr [rax+140H]            ; 7960 _ FF. 90, 00000140
00007966        test    rax, rax                        ; 7966 _ 48: 85. C0
00007969        jz      ?_735                           ; 7969 _ 74, 35
0000796B        mov     rax, qword ptr [?_889]          ; 796B _ 48: 8B. 05, 00003336(rel)
00007972        lea     rcx, ptr [?_861]                ; 7972 _ 48: 8D. 0D, 00003267(rel)
00007979        xor     esi, esi                        ; 7979 _ 31. F6
0000797B        lea     r8, ptr [?_885]                 ; 797B _ 4C: 8D. 05, 0000330E(rel)
00007982        xor     edx, edx                        ; 7982 _ 31. D2
00007984        call    qword ptr [rax+140H]            ; 7984 _ FF. 90, 00000140
0000798A        test    rax, rax                        ; 798A _ 48: 85. C0
0000798D        jz      ?_735                           ; 798D _ 74, 11
0000798F        lea     rcx, ptr [?_799]                ; 798F _ 48: 8D. 0D, 00000DD6(rel)
00007996        call    ?_121                           ; 7996 _ E8, FFFF943A
0000799B        jmp     ?_749                           ; 799B _ E9, 000001FA

?_735:
000079A0        mov     byte ptr [?_898], -97           ; 79A0 _ C6. 05, 00003349(rel), 9F
000079A7        mov     byte ptr [?_900], 2             ; 79A7 _ C6. 05, 00003344(rel), 02
000079AE        mov     byte ptr [?_902], 3             ; 79AE _ C6. 05, 0000333F(rel), 03
000079B5        mov     byte ptr [?_904], 1             ; 79B5 _ C6. 05, 0000333A(rel), 01
000079BC        mov     byte ptr [?_906], 5             ; 79BC _ C6. 05, 00003335(rel), 05
000079C3        mov     byte ptr [?_907], -40           ; 79C3 _ C6. 05, 00003330(rel), D8
000079CA        lea     rsi, ptr [?_899]                ; 79CA _ 48: 8D. 35, 00003320(rel)
000079D1        mov     rax, rdi                        ; 79D1 _ 48: 89. F8
000079D4        jmp     ?_737                           ; 79D4 _ EB, 07

?_736:
000079D6        add     rsi, 2                          ; 79D6 _ 48: 83. C6, 02
000079DA        inc     rdi                             ; 79DA _ 48: FF. C7
?_737:
000079DD        cmp     rdi, 5                          ; 79DD _ 48: 83. FF, 05
000079E1        ja      ?_740                           ; 79E1 _ 77, 47
000079E3        movzx   ecx, byte ptr [rsi-1H]          ; 79E3 _ 0F B6. 4E, FF
000079E7        mov     rdx, rsi                        ; 79E7 _ 48: 89. F2
000079EA        call    ?_765                           ; 79EA _ E8, 000004B4
000079EF        test    rax, rax                        ; 79EF _ 48: 85. C0
000079F2        jns     ?_736                           ; 79F2 _ 79, E2
000079F4        cmp     rdi, 5                          ; 79F4 _ 48: 83. FF, 05
000079F8        jnz     ?_741                           ; 79F8 _ 75, 35
000079FA        mov     byte ptr [?_907], 32            ; 79FA _ C6. 05, 000032F9(rel), 20
00007A01        xor     edi, edi                        ; 7A01 _ 31. FF
00007A03        lea     rsi, ptr [?_899]                ; 7A03 _ 48: 8D. 35, 000032E7(rel)
00007A0A        jmp     ?_739                           ; 7A0A _ EB, 18

?_738:
00007A0C        movzx   ecx, byte ptr [rsi-1H]          ; 7A0C _ 0F B6. 4E, FF
00007A10        mov     rdx, rsi                        ; 7A10 _ 48: 89. F2
00007A13        call    ?_765                           ; 7A13 _ E8, 0000048B
00007A18        test    rax, rax                        ; 7A18 _ 48: 85. C0
00007A1B        js      ?_741                           ; 7A1B _ 78, 12
00007A1D        add     rsi, 2                          ; 7A1D _ 48: 83. C6, 02
00007A21        inc     rdi                             ; 7A21 _ 48: FF. C7
?_739:
00007A24        cmp     rdi, 5                          ; 7A24 _ 48: 83. FF, 05
00007A28        jbe     ?_738                           ; 7A28 _ 76, E2
?_740:
00007A2A        test    rax, rax                        ; 7A2A _ 48: 85. C0
00007A2D        jz      ?_742                           ; 7A2D _ 74, 16
?_741:
00007A2F        lea     rcx, ptr [?_800]                ; 7A2F _ 48: 8D. 0D, 00000D74(rel)
00007A36        mov     rdx, rax                        ; 7A36 _ 48: 89. C2
00007A39        call    ?_121                           ; 7A39 _ E8, FFFF9397
00007A3E        xor     esi, esi                        ; 7A3E _ 31. F6
00007A40        jmp     ?_749                           ; 7A40 _ E9, 00000155

?_742:
00007A45        movzx   edx, byte ptr [?_899]           ; 7A45 _ 0F B6. 15, 000032A5(rel)
00007A4C        mov     rax, qword ptr [?_885]          ; 7A4C _ 48: 8B. 05, 0000323D(rel)
00007A53        lea     rcx, ptr [rbp-14H]              ; 7A53 _ 48: 8D. 4D, EC
00007A57        mov     qword ptr [rsp+40H], rcx        ; 7A57 _ 48: 89. 4C 24, 40
00007A5C        mov     dword ptr [rsp+48H], 0          ; 7A5C _ C7. 44 24, 48, 00000000
00007A64        mov     dword ptr [rsp+38H], 3          ; 7A64 _ C7. 44 24, 38, 00000003
00007A6C        mov     qword ptr [rsp+30H], 0          ; 7A6C _ 48: C7. 44 24, 30, 00000000
00007A75        mov     dword ptr [rsp+28H], 0          ; 7A75 _ C7. 44 24, 28, 00000000
00007A7D        mov     dword ptr [rsp+20H], 0          ; 7A7D _ C7. 44 24, 20, 00000000
00007A85        mov     rcx, rax                        ; 7A85 _ 48: 89. C1
00007A88        xor     r8d, r8d                        ; 7A88 _ 45: 31. C0
00007A8B        mov     r9d, 1                          ; 7A8B _ 41: B9, 00000001
00007A91        call    qword ptr [rax+10H]             ; 7A91 _ FF. 50, 10
00007A94        test    rax, rax                        ; 7A94 _ 48: 85. C0
00007A97        js      ?_743                           ; 7A97 _ 78, 05
00007A99        test    rax, rax                        ; 7A99 _ 48: 85. C0
00007A9C        jz      ?_744                           ; 7A9C _ 74, 13
?_743:
00007A9E        lea     rcx, ptr [?_801]                ; 7A9E _ 48: 8D. 0D, 00000D39(rel)
00007AA5        call    ?_121                           ; 7AA5 _ E8, FFFF932B
00007AAA        xor     esi, esi                        ; 7AAA _ 31. F6
00007AAC        jmp     ?_749                           ; 7AAC _ E9, 000000E9

?_744:
00007AB1        movzx   ecx, byte ptr [rbp-14H]         ; 7AB1 _ 0F B6. 4D, EC
00007AB5        shl     ecx, 8                          ; 7AB5 _ C1. E1, 08
00007AB8        movzx   eax, byte ptr [rbp-12H]         ; 7AB8 _ 0F B6. 45, EE
00007ABC        or      eax, ecx                        ; 7ABC _ 09. C8
00007ABE        movzx   edi, ax                         ; 7ABE _ 0F B7. F8
00007AC1        mov     ecx, edi                        ; 7AC1 _ 89. F9
00007AC3        call    ?_657                           ; 7AC3 _ E8, FFFFEE86
00007AC8        mov     rsi, rax                        ; 7AC8 _ 48: 89. C6
00007ACB        test    rsi, rsi                        ; 7ACB _ 48: 85. F6
00007ACE        jnz     ?_745                           ; 7ACE _ 75, 15
00007AD0        lea     rcx, ptr [?_802]                ; 7AD0 _ 48: 8D. 0D, 00000D47(rel)
00007AD7        mov     edx, edi                        ; 7AD7 _ 89. FA
00007AD9        call    ?_121                           ; 7AD9 _ E8, FFFF92F7
00007ADE        xor     esi, esi                        ; 7ADE _ 31. F6
00007AE0        jmp     ?_749                           ; 7AE0 _ E9, 000000B5

?_745:
00007AE5        mov     rax, qword ptr [rsi+18H]        ; 7AE5 _ 48: 8B. 46, 18
00007AE9        mov     qword ptr [?_862], rax          ; 7AE9 _ 48: 89. 05, 00003100(rel)
00007AF0        call    ?_653                           ; 7AF0 _ E8, FFFFEDE6
00007AF5        test    rax, rax                        ; 7AF5 _ 48: 85. C0
00007AF8        setne   byte ptr [?_886]                ; 7AF8 _ 0F 95. 05, 00003199(rel)
00007AFF        call    ?_650                           ; 7AFF _ E8, FFFFEDA3
00007B04        lea     r8, ptr [?_764]                 ; 7B04 _ 4C: 8D. 05, 00000371(rel)
00007B0B        lea     r9, ptr [?_762]                 ; 7B0B _ 4C: 8D. 0D, 00000333(rel)
00007B12        lea     rdi, ptr [?_760]                ; 7B12 _ 48: 8D. 3D, 00000251(rel)
00007B19        lea     rcx, ptr [?_755]                ; 7B19 _ 48: 8D. 0D, 00000121(rel)
00007B20        lea     rdx, ptr [?_750]                ; 7B20 _ 48: 8D. 15, 0000007E(rel)
00007B27        mov     byte ptr [?_887], al            ; 7B27 _ 88. 05, 0000316C(rel)
00007B2D        mov     qword ptr [rsi+28H], rdx        ; 7B2D _ 48: 89. 56, 28
00007B31        mov     qword ptr [rsi+30H], rcx        ; 7B31 _ 48: 89. 4E, 30
00007B35        mov     qword ptr [rsi+38H], rdi        ; 7B35 _ 48: 89. 7E, 38
00007B39        mov     qword ptr [rsi+40H], r9         ; 7B39 _ 4C: 89. 4E, 40
00007B3D        mov     qword ptr [rsi+48H], r8         ; 7B3D _ 4C: 89. 46, 48
00007B41        cmp     byte ptr [?_907], 32            ; 7B41 _ 80. 3D, 000031B2(rel), 20
00007B48        jz      ?_746                           ; 7B48 _ 74, 05
00007B4A        mov     ecx, dword ptr [rsi+10H]        ; 7B4A _ 8B. 4E, 10
00007B4D        jmp     ?_747                           ; 7B4D _ EB, 0C

?_746:
00007B4F        mov     dword ptr [rsi+10H], 4096       ; 7B4F _ C7. 46, 10, 00001000
00007B56        mov     ecx, 4096                       ; 7B56 _ B9, 00001000
?_747:
00007B5B        mov     dword ptr [?_863], ecx          ; 7B5B _ 89. 0D, 00003097(rel)
00007B61        mov     ecx, dword ptr [rsi+0CH]        ; 7B61 _ 8B. 4E, 0C
00007B64        dec     ecx                             ; 7B64 _ FF. C9
00007B66        mov     dword ptr [?_864], ecx          ; 7B66 _ 89. 0D, 00003090(rel)
00007B6C        mov     edx, dword ptr [rsi+20H]        ; 7B6C _ 8B. 56, 20
00007B6F        mov     ecx, edx                        ; 7B6F _ 89. D1
00007B71        and     ecx, 0FFFFFFFEH                 ; 7B71 _ 83. E1, FE
00007B74        mov     dword ptr [rsi+20H], ecx        ; 7B74 _ 89. 4E, 20
00007B77        cmp     byte ptr [?_886], 0             ; 7B77 _ 80. 3D, 0000311A(rel), 00
00007B7E        jz      ?_748                           ; 7B7E _ 74, 08
00007B80        or      edx, 1H                         ; 7B80 _ 83. CA, 01
00007B83        mov     dword ptr [rsi+20H], edx        ; 7B83 _ 89. 56, 20
00007B86        mov     ecx, edx                        ; 7B86 _ 89. D1
?_748:
00007B88        mov     edx, ecx                        ; 7B88 _ 89. CA
00007B8A        and     edx, 0FFFFFFFDH                 ; 7B8A _ 83. E2, FD
00007B8D        mov     dword ptr [rsi+20H], edx        ; 7B8D _ 89. 56, 20
00007B90        test    al, al                          ; 7B90 _ 84. C0
00007B92        jz      ?_749                           ; 7B92 _ 74, 06
00007B94        or      ecx, 2H                         ; 7B94 _ 83. C9, 02
00007B97        mov     dword ptr [rsi+20H], ecx        ; 7B97 _ 89. 4E, 20
?_749:
00007B9A        mov     rax, rsi                        ; 7B9A _ 48: 89. F0
00007B9D        add     rsp, 96                         ; 7B9D _ 48: 83. C4, 60
00007BA1        pop     rdi                             ; 7BA1 _ 5F
00007BA2        pop     rsi                             ; 7BA2 _ 5E
00007BA3        pop     rbp                             ; 7BA3 _ 5D
00007BA4        ret                                     ; 7BA4 _ C3

?_750   LABEL NEAR
00007BA5        push    rbp                             ; 7BA5 _ 55
00007BA6        mov     rbp, rsp                        ; 7BA6 _ 48: 89. E5
00007BA9        push    r14                             ; 7BA9 _ 41: 56
00007BAB        push    rsi                             ; 7BAB _ 56
00007BAC        push    rdi                             ; 7BAC _ 57
00007BAD        push    rbx                             ; 7BAD _ 53
00007BAE        sub     rsp, 80                         ; 7BAE _ 48: 83. EC, 50
00007BB2        mov     r14, rdx                        ; 7BB2 _ 49: 89. D6
00007BB5        mov     edi, dword ptr [?_864]          ; 7BB5 _ 8B. 3D, 00003041(rel)
00007BBB        and     rdi, rcx                        ; 7BBB _ 48: 21. CF
00007BBE        xor     ebx, ebx                        ; 7BBE _ 31. DB
00007BC0        mov     rax, rbx                        ; 7BC0 _ 48: 89. D8
00007BC3        jmp     ?_753                           ; 7BC3 _ EB, 61

?_751:
00007BC5        lea     rcx, ptr [r14+rbx]              ; 7BC5 _ 49: 8D. 0C 1E
00007BC9        lea     rsi, ptr [rdi+rbx]              ; 7BC9 _ 48: 8D. 34 1F
00007BCD        xor     eax, eax                        ; 7BCD _ 31. C0
?_752:
00007BCF        mov     byte ptr [rcx+rax], al          ; 7BCF _ 88. 04 01
00007BD2        inc     rax                             ; 7BD2 _ 48: FF. C0
00007BD5        cmp     rax, 64                         ; 7BD5 _ 48: 83. F8, 40
00007BD9        jnz     ?_752                           ; 7BD9 _ 75, F4
00007BDB        movzx   edx, byte ptr [?_903]           ; 7BDB _ 0F B6. 15, 00003113(rel)
00007BE2        mov     rax, qword ptr [?_885]          ; 7BE2 _ 48: 8B. 05, 000030A7(rel)
00007BE9        mov     qword ptr [rsp+40H], rcx        ; 7BE9 _ 48: 89. 4C 24, 40
00007BEE        mov     qword ptr [rsp+30H], rsi        ; 7BEE _ 48: 89. 74 24, 30
00007BF3        mov     dword ptr [rsp+48H], 0          ; 7BF3 _ C7. 44 24, 48, 00000000
00007BFB        mov     dword ptr [rsp+38H], 64         ; 7BFB _ C7. 44 24, 38, 00000040
00007C03        mov     dword ptr [rsp+28H], 0          ; 7C03 _ C7. 44 24, 28, 00000000
00007C0B        mov     dword ptr [rsp+20H], 0          ; 7C0B _ C7. 44 24, 20, 00000000
00007C13        mov     rcx, rax                        ; 7C13 _ 48: 89. C1
00007C16        xor     r8d, r8d                        ; 7C16 _ 45: 31. C0
00007C19        mov     r9d, 1                          ; 7C19 _ 41: B9, 00000001
00007C1F        call    qword ptr [rax+10H]             ; 7C1F _ FF. 50, 10
00007C22        add     rbx, 64                         ; 7C22 _ 48: 83. C3, 40
?_753:
00007C26        test    rax, rax                        ; 7C26 _ 48: 85. C0
00007C29        jnz     ?_754                           ; 7C29 _ 75, 0B
00007C2B        mov     ecx, dword ptr [?_863]          ; 7C2B _ 8B. 0D, 00002FC7(rel)
00007C31        cmp     rbx, rcx                        ; 7C31 _ 48: 39. CB
00007C34        jc      ?_751                           ; 7C34 _ 72, 8F
?_754:
00007C36        add     rsp, 80                         ; 7C36 _ 48: 83. C4, 50
00007C3A        pop     rbx                             ; 7C3A _ 5B
00007C3B        pop     rdi                             ; 7C3B _ 5F
00007C3C        pop     rsi                             ; 7C3C _ 5E
00007C3D        pop     r14                             ; 7C3D _ 41: 5E
00007C3F        pop     rbp                             ; 7C3F _ 5D
00007C40        ret                                     ; 7C40 _ C3

?_755   LABEL NEAR
00007C41        push    rbp                             ; 7C41 _ 55
00007C42        mov     rbp, rsp                        ; 7C42 _ 48: 89. E5
00007C45        push    r15                             ; 7C45 _ 41: 57
00007C47        push    r14                             ; 7C47 _ 41: 56
00007C49        push    r12                             ; 7C49 _ 41: 54
00007C4B        push    rsi                             ; 7C4B _ 56
00007C4C        push    rdi                             ; 7C4C _ 57
00007C4D        push    rbx                             ; 7C4D _ 53
00007C4E        sub     rsp, 96                         ; 7C4E _ 48: 83. EC, 60
00007C52        mov     r15, rdx                        ; 7C52 _ 49: 89. D7
00007C55        mov     r14, rcx                        ; 7C55 _ 49: 89. CE
00007C58        mov     rdi, 8H                         ; 7C58 _ 48: BF, 8000000000000008
00007C62        cmp     byte ptr [?_886], 0             ; 7C62 _ 80. 3D, 0000302F(rel), 00
00007C69        jne     ?_759                           ; 7C69 _ 0F 85, 000000E9
00007C6F        mov     byte ptr [rbp-31H], 0           ; 7C6F _ C6. 45, CF, 00
00007C73        movzx   edx, byte ptr [?_905]           ; 7C73 _ 0F B6. 15, 0000307D(rel)
00007C7A        mov     rax, qword ptr [?_885]          ; 7C7A _ 48: 8B. 05, 0000300F(rel)
00007C81        lea     rcx, ptr [rbp-31H]              ; 7C81 _ 48: 8D. 4D, CF
00007C85        mov     qword ptr [rsp+40H], rcx        ; 7C85 _ 48: 89. 4C 24, 40
00007C8A        mov     dword ptr [rsp+48H], 0          ; 7C8A _ C7. 44 24, 48, 00000000
00007C92        mov     dword ptr [rsp+38H], 1          ; 7C92 _ C7. 44 24, 38, 00000001
00007C9A        mov     qword ptr [rsp+30H], 0          ; 7C9A _ 48: C7. 44 24, 30, 00000000
00007CA3        mov     dword ptr [rsp+28H], 1          ; 7CA3 _ C7. 44 24, 28, 00000001
00007CAB        mov     dword ptr [rsp+20H], 1          ; 7CAB _ C7. 44 24, 20, 00000001
00007CB3        mov     rcx, rax                        ; 7CB3 _ 48: 89. C1
00007CB6        xor     r8d, r8d                        ; 7CB6 _ 45: 31. C0
00007CB9        mov     r9d, 1                          ; 7CB9 _ 41: B9, 00000001
00007CBF        call    qword ptr [rax+10H]             ; 7CBF _ FF. 50, 10
00007CC2        xor     edi, edi                        ; 7CC2 _ 31. FF
00007CC4        mov     rsi, qword ptr [?_862]          ; 7CC4 _ 48: 8B. 35, 00002F25(rel)
00007CCB        mov     ebx, dword ptr [?_863]          ; 7CCB _ 8B. 1D, 00002F27(rel)
00007CD1        cmp     rbx, rsi                        ; 7CD1 _ 48: 39. F3
00007CD4        cmovbe  rsi, rbx                        ; 7CD4 _ 48: 0F 46. F3
00007CD8        mov     r12d, dword ptr [?_864]         ; 7CD8 _ 44: 8B. 25, 00002F1D(rel)
00007CDF        and     r12, r14                        ; 7CDF _ 4D: 21. F4
00007CE2        jmp     ?_757                           ; 7CE2 _ EB, 1A

?_756:
00007CE4        sub     rbx, rsi                        ; 7CE4 _ 48: 29. F3
00007CE7        mov     rax, qword ptr [?_862]          ; 7CE7 _ 48: 8B. 05, 00002F02(rel)
00007CEE        cmp     rbx, rax                        ; 7CEE _ 48: 39. C3
00007CF1        cmovbe  rax, rbx                        ; 7CF1 _ 48: 0F 46. C3
00007CF5        add     r15, rsi                        ; 7CF5 _ 49: 01. F7
00007CF8        add     r12, rsi                        ; 7CF8 _ 49: 01. F4
00007CFB        mov     rsi, rax                        ; 7CFB _ 48: 89. C6
?_757:
00007CFE        test    rbx, rbx                        ; 7CFE _ 48: 85. DB
00007D01        jz      ?_758                           ; 7D01 _ 74, 50
00007D03        test    rdi, rdi                        ; 7D03 _ 48: 85. FF
00007D06        js      ?_758                           ; 7D06 _ 78, 4B
00007D08        movzx   edx, byte ptr [?_901]           ; 7D08 _ 0F B6. 15, 00002FE4(rel)
00007D0F        mov     rax, qword ptr [?_885]          ; 7D0F _ 48: 8B. 05, 00002F7A(rel)
00007D16        mov     qword ptr [rsp+40H], r15        ; 7D16 _ 4C: 89. 7C 24, 40
00007D1B        mov     dword ptr [rsp+38H], esi        ; 7D1B _ 89. 74 24, 38
00007D1F        mov     qword ptr [rsp+30H], r12        ; 7D1F _ 4C: 89. 64 24, 30
00007D24        mov     dword ptr [rsp+48H], 0          ; 7D24 _ C7. 44 24, 48, 00000000
00007D2C        mov     dword ptr [rsp+28H], 1          ; 7D2C _ C7. 44 24, 28, 00000001
00007D34        mov     dword ptr [rsp+20H], 1          ; 7D34 _ C7. 44 24, 20, 00000001
00007D3C        mov     rcx, rax                        ; 7D3C _ 48: 89. C1
00007D3F        xor     r8d, r8d                        ; 7D3F _ 45: 31. C0
00007D42        mov     r9d, 1                          ; 7D42 _ 41: B9, 00000001
00007D48        call    qword ptr [rax+10H]             ; 7D48 _ FF. 50, 10
00007D4B        mov     rdi, rax                        ; 7D4B _ 48: 89. C7
00007D4E        test    rdi, rdi                        ; 7D4E _ 48: 85. FF
00007D51        jns     ?_756                           ; 7D51 _ 79, 91
?_758:
00007D53        call    ?_013                           ; 7D53 _ E8, FFFF8696
?_759:
00007D58        mov     rax, rdi                        ; 7D58 _ 48: 89. F8
00007D5B        add     rsp, 96                         ; 7D5B _ 48: 83. C4, 60
00007D5F        pop     rbx                             ; 7D5F _ 5B
00007D60        pop     rdi                             ; 7D60 _ 5F
00007D61        pop     rsi                             ; 7D61 _ 5E
00007D62        pop     r12                             ; 7D62 _ 41: 5C
00007D64        pop     r14                             ; 7D64 _ 41: 5E
00007D66        pop     r15                             ; 7D66 _ 41: 5F
00007D68        pop     rbp                             ; 7D68 _ 5D
00007D69        ret                                     ; 7D69 _ C3

?_760   LABEL NEAR
00007D6A        push    rbp                             ; 7D6A _ 55
00007D6B        mov     rbp, rsp                        ; 7D6B _ 48: 89. E5
00007D6E        push    rsi                             ; 7D6E _ 56
00007D6F        push    rdi                             ; 7D6F _ 57
00007D70        sub     rsp, 96                         ; 7D70 _ 48: 83. EC, 60
00007D74        mov     rsi, rcx                        ; 7D74 _ 48: 89. CE
00007D77        mov     rdi, 8H                         ; 7D77 _ 48: BF, 8000000000000008
00007D81        cmp     byte ptr [?_886], 0             ; 7D81 _ 80. 3D, 00002F10(rel), 00
00007D88        jne     ?_761                           ; 7D88 _ 0F 85, 000000AC
00007D8E        mov     byte ptr [rbp-11H], 0           ; 7D8E _ C6. 45, EF, 00
00007D92        movzx   edx, byte ptr [?_905]           ; 7D92 _ 0F B6. 15, 00002F5E(rel)
00007D99        mov     rax, qword ptr [?_885]          ; 7D99 _ 48: 8B. 05, 00002EF0(rel)
00007DA0        lea     rcx, ptr [rbp-11H]              ; 7DA0 _ 48: 8D. 4D, EF
00007DA4        mov     qword ptr [rsp+40H], rcx        ; 7DA4 _ 48: 89. 4C 24, 40
00007DA9        mov     dword ptr [rsp+48H], 0          ; 7DA9 _ C7. 44 24, 48, 00000000
00007DB1        mov     dword ptr [rsp+38H], 1          ; 7DB1 _ C7. 44 24, 38, 00000001
00007DB9        mov     qword ptr [rsp+30H], 0          ; 7DB9 _ 48: C7. 44 24, 30, 00000000
00007DC2        mov     dword ptr [rsp+28H], 1          ; 7DC2 _ C7. 44 24, 28, 00000001
00007DCA        mov     dword ptr [rsp+20H], 1          ; 7DCA _ C7. 44 24, 20, 00000001
00007DD2        mov     rcx, rax                        ; 7DD2 _ 48: 89. C1
00007DD5        xor     r8d, r8d                        ; 7DD5 _ 45: 31. C0
00007DD8        mov     r9d, 1                          ; 7DD8 _ 41: B9, 00000001
00007DDE        call    qword ptr [rax+10H]             ; 7DDE _ FF. 50, 10
00007DE1        mov     ecx, dword ptr [?_864]          ; 7DE1 _ 8B. 0D, 00002E15(rel)
00007DE7        and     rcx, rsi                        ; 7DE7 _ 48: 21. F1
00007DEA        movzx   edx, byte ptr [?_908]           ; 7DEA _ 0F B6. 15, 00002F0A(rel)
00007DF1        mov     rax, qword ptr [?_885]          ; 7DF1 _ 48: 8B. 05, 00002E98(rel)
00007DF8        mov     qword ptr [rsp+30H], rcx        ; 7DF8 _ 48: 89. 4C 24, 30
00007DFD        mov     dword ptr [rsp+48H], 0          ; 7DFD _ C7. 44 24, 48, 00000000
00007E05        mov     qword ptr [rsp+40H], 0          ; 7E05 _ 48: C7. 44 24, 40, 00000000
00007E0E        mov     dword ptr [rsp+38H], 0          ; 7E0E _ C7. 44 24, 38, 00000000
00007E16        mov     dword ptr [rsp+28H], 0          ; 7E16 _ C7. 44 24, 28, 00000000
00007E1E        mov     dword ptr [rsp+20H], 1          ; 7E1E _ C7. 44 24, 20, 00000001
00007E26        mov     rcx, rax                        ; 7E26 _ 48: 89. C1
00007E29        xor     r8d, r8d                        ; 7E29 _ 45: 31. C0
00007E2C        xor     r9d, r9d                        ; 7E2C _ 45: 31. C9
00007E2F        call    qword ptr [rax+10H]             ; 7E2F _ FF. 50, 10
00007E32        mov     rdi, rax                        ; 7E32 _ 48: 89. C7
00007E35        call    ?_013                           ; 7E35 _ E8, FFFF85B4
?_761:
00007E3A        mov     rax, rdi                        ; 7E3A _ 48: 89. F8
00007E3D        add     rsp, 96                         ; 7E3D _ 48: 83. C4, 60
00007E41        pop     rdi                             ; 7E41 _ 5F
00007E42        pop     rsi                             ; 7E42 _ 5E
00007E43        pop     rbp                             ; 7E43 _ 5D
00007E44        ret                                     ; 7E44 _ C3

?_762   LABEL NEAR
00007E45        push    rbp                             ; 7E45 _ 55
00007E46        mov     rbp, rsp                        ; 7E46 _ 48: 89. E5
00007E49        push    rsi                             ; 7E49 _ 56
00007E4A        push    rdi                             ; 7E4A _ 57
00007E4B        sub     rsp, 32                         ; 7E4B _ 48: 83. EC, 20
00007E4F        mov     rsi, rdx                        ; 7E4F _ 48: 89. D6
00007E52        mov     rdi, rcx                        ; 7E52 _ 48: 89. CF
00007E55        mov     rcx, rdi                        ; 7E55 _ 48: 89. F9
00007E58        call    ?_760                           ; 7E58 _ E8, FFFFFF0D
00007E5D        test    rax, rax                        ; 7E5D _ 48: 85. C0
00007E60        jz      ?_763                           ; 7E60 _ 74, 08
00007E62        add     rsp, 32                         ; 7E62 _ 48: 83. C4, 20
00007E66        pop     rdi                             ; 7E66 _ 5F
00007E67        pop     rsi                             ; 7E67 _ 5E
00007E68        pop     rbp                             ; 7E68 _ 5D
00007E69        ret                                     ; 7E69 _ C3

?_763:
00007E6A        mov     rcx, rdi                        ; 7E6A _ 48: 89. F9
00007E6D        mov     rdx, rsi                        ; 7E6D _ 48: 89. F2
00007E70        add     rsp, 32                         ; 7E70 _ 48: 83. C4, 20
00007E74        pop     rdi                             ; 7E74 _ 5F
00007E75        pop     rsi                             ; 7E75 _ 5E
00007E76        pop     rbp                             ; 7E76 _ 5D
00007E77        jmp     ?_755                           ; 7E77 _ E9, FFFFFDC5

?_764   LABEL NEAR
00007E7C        mov     qword ptr [?_862], 1            ; 7E7C _ 48: C7. 05, 00002D69(rel), 00000001
00007E87        mov     qword ptr [?_885], 0            ; 7E87 _ 48: C7. 05, 00002DFE(rel), 00000000
00007E92        mov     byte ptr [?_887], 0             ; 7E92 _ C6. 05, 00002E00(rel), 00
00007E99        mov     byte ptr [?_886], 0             ; 7E99 _ C6. 05, 00002DF8(rel), 00
00007EA0        xor     eax, eax                        ; 7EA0 _ 31. C0
00007EA2        ret                                     ; 7EA2 _ C3

?_765   LABEL NEAR
00007EA3        push    rbp                             ; 7EA3 _ 55
00007EA4        mov     rbp, rsp                        ; 7EA4 _ 48: 89. E5
00007EA7        push    rsi                             ; 7EA7 _ 56
00007EA8        push    rdi                             ; 7EA8 _ 57
00007EA9        push    rbx                             ; 7EA9 _ 53
00007EAA        sub     rsp, 40                         ; 7EAA _ 48: 83. EC, 28
00007EAE        mov     rsi, rdx                        ; 7EAE _ 48: 89. D6
00007EB1        mov     ebx, ecx                        ; 7EB1 _ 89. CB
00007EB3        mov     byte ptr [rsi], 0               ; 7EB3 _ C6. 06, 00
00007EB6        mov     edi, 152                        ; 7EB6 _ BF, 00000098
00007EBB        jmp     ?_767                           ; 7EBB _ EB, 03

?_766:
00007EBD        inc     rdi                             ; 7EBD _ 48: FF. C7
?_767:
00007EC0        lea     ecx, ptr [rdi-98H]              ; 7EC0 _ 8D. 8F, FFFFFF68
00007EC6        mov     rax, 0EH                        ; 7EC6 _ 48: B8, 800000000000000E
00007ED0        cmp     cl, 7                           ; 7ED0 _ 80. F9, 07
00007ED3        ja      ?_768                           ; 7ED3 _ 77, 17
00007ED5        mov     rcx, rdi                        ; 7ED5 _ 48: 89. F9
00007ED8        call    ?_649                           ; 7ED8 _ E8, FFFFE9A8
00007EDD        cmp     al, bl                          ; 7EDD _ 38. D8
00007EDF        jnz     ?_766                           ; 7EDF _ 75, DC
00007EE1        add     edi, -152                       ; 7EE1 _ 81. C7, FFFFFF68
00007EE7        mov     byte ptr [rsi], dil             ; 7EE7 _ 40: 88. 3E
00007EEA        xor     eax, eax                        ; 7EEA _ 31. C0
?_768:
00007EEC        add     rsp, 40                         ; 7EEC _ 48: 83. C4, 28
00007EF0        pop     rbx                             ; 7EF0 _ 5B
00007EF1        pop     rdi                             ; 7EF1 _ 5F
00007EF2        pop     rsi                             ; 7EF2 _ 5E
00007EF3        pop     rbp                             ; 7EF3 _ 5D
00007EF4        ret                                     ; 7EF4 _ C3

_text   ENDS

_data   SEGMENT BYTE 'CODE'                             ; section number 2

_data   ENDS

.reloc  SEGMENT BYTE 'CODE'                             ; section number 3

.reloc  ENDS

.debug  SEGMENT BYTE                                    ; section number 4

        db 00H, 00H, 00H, 00H, 0E9H, 0D7H, 80H, 53H     ; AD40 _ .......S
        db 00H, 00H, 00H, 00H, 02H, 00H, 00H, 00H       ; AD48 _ ........
        db 15H, 00H, 00H, 00H, 5CH, 0ADH, 00H, 00H      ; AD50 _ ....\...
        db 5CH, 0ADH, 00H, 00H, 4DH, 54H, 4FH, 43H      ; AD58 _ \...MTOC
        db 69H, 0FCH, 84H, 0EH, 0CCH, 29H, 6DH, 4CH     ; AD60 _ i....)mL
        db 92H, 0ACH, 6DH, 47H, 69H, 21H, 85H, 0FH      ; AD68 _ ..mGi!..
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; AD70 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; AD78 _ ........

.debug  ENDS

; Error: Symbol ?_815 has a non-existing address. Section: 1 Offset: 0000A15CH
; Error: Symbol ?_816 has a non-existing address. Section: 1 Offset: 0000A16CH
; Error: Symbol ?_817 has a non-existing address. Section: 1 Offset: 0000A17CH
; Error: Symbol ?_818 has a non-existing address. Section: 1 Offset: 0000A18CH
; Error: Symbol ?_819 has a non-existing address. Section: 1 Offset: 0000A19CH
; Error: Symbol ?_820 has a non-existing address. Section: 1 Offset: 0000A1ACH
; Error: Symbol ?_821 has a non-existing address. Section: 1 Offset: 0000A1BCH
; Error: Symbol ?_822 has a non-existing address. Section: 1 Offset: 0000A1CCH
; Error: Symbol ?_823 has a non-existing address. Section: 1 Offset: 0000A1DCH
; Error: Symbol ?_824 has a non-existing address. Section: 1 Offset: 0000A1ECH
; Error: Symbol ?_825 has a non-existing address. Section: 1 Offset: 0000A1FCH
; Error: Symbol ?_826 has a non-existing address. Section: 1 Offset: 0000A20CH
; Error: Symbol ?_827 has a non-existing address. Section: 1 Offset: 0000A21CH
; Error: Symbol ?_828 has a non-existing address. Section: 1 Offset: 0000A22CH
; Error: Symbol ?_829 has a non-existing address. Section: 1 Offset: 0000A23CH
; Error: Symbol ?_830 has a non-existing address. Section: 1 Offset: 0000A24CH
; Error: Symbol ?_831 has a non-existing address. Section: 1 Offset: 0000A25CH
; Error: Symbol ?_832 has a non-existing address. Section: 1 Offset: 0000A26CH
; Error: Symbol ?_833 has a non-existing address. Section: 1 Offset: 0000A27CH
; Error: Symbol ?_834 has a non-existing address. Section: 1 Offset: 0000A28CH
; Error: Symbol ?_835 has a non-existing address. Section: 1 Offset: 0000A29CH
; Error: Symbol ?_836 has a non-existing address. Section: 1 Offset: 0000A2ACH
; Error: Symbol ?_837 has a non-existing address. Section: 1 Offset: 0000A2BCH
; Error: Symbol ?_838 has a non-existing address. Section: 1 Offset: 0000A2CCH
; Error: Symbol ?_839 has a non-existing address. Section: 1 Offset: 0000A2DCH
; Error: Symbol ?_840 has a non-existing address. Section: 1 Offset: 0000A2ECH
; Error: Symbol ?_841 has a non-existing address. Section: 1 Offset: 0000A2FCH
; Error: Symbol ?_842 has a non-existing address. Section: 1 Offset: 0000A30CH
; Error: Symbol ?_843 has a non-existing address. Section: 1 Offset: 0000A31CH
; Error: Symbol ?_844 has a non-existing address. Section: 1 Offset: 0000A32CH
; Error: Symbol ?_845 has a non-existing address. Section: 1 Offset: 0000A33CH
; Error: Symbol ?_846 has a non-existing address. Section: 1 Offset: 0000A34CH
; Error: Symbol ?_847 has a non-existing address. Section: 1 Offset: 0000A35CH
; Error: Symbol ?_848 has a non-existing address. Section: 1 Offset: 0000A360H
; Error: Symbol ?_849 has a non-existing address. Section: 1 Offset: 0000A370H
; Error: Symbol ?_850 has a non-existing address. Section: 1 Offset: 0000A380H
; Error: Symbol ?_851 has a non-existing address. Section: 1 Offset: 0000A390H
; Error: Symbol ?_852 has a non-existing address. Section: 1 Offset: 0000A930H
; Error: Symbol ?_853 has a non-existing address. Section: 1 Offset: 0000A940H
; Error: Symbol ?_854 has a non-existing address. Section: 1 Offset: 0000A948H
; Error: Symbol ?_855 has a non-existing address. Section: 1 Offset: 0000A950H
; Error: Symbol ?_856 has a non-existing address. Section: 1 Offset: 0000A960H
; Error: Symbol ?_857 has a non-existing address. Section: 1 Offset: 0000A968H
; Error: Symbol ?_858 has a non-existing address. Section: 1 Offset: 0000A978H
; Error: Symbol ?_859 has a non-existing address. Section: 1 Offset: 0000A980H
; Error: Symbol ?_860 has a non-existing address. Section: 1 Offset: 0000A990H
; Error: Symbol ?_861 has a non-existing address. Section: 1 Offset: 0000A9A0H
; Error: Symbol ?_862 has a non-existing address. Section: 1 Offset: 0000A9B0H
; Error: Symbol ?_863 has a non-existing address. Section: 1 Offset: 0000A9B8H
; Error: Symbol ?_864 has a non-existing address. Section: 1 Offset: 0000A9BCH
; Error: Symbol ?_865 has a non-existing address. Section: 1 Offset: 0000A9C0H
; Error: Symbol ?_866 has a non-existing address. Section: 1 Offset: 0000A9C8H
; Error: Symbol ?_867 has a non-existing address. Section: 1 Offset: 0000A9D0H
; Error: Symbol ?_868 has a non-existing address. Section: 1 Offset: 0000A9D8H
; Error: Symbol ?_869 has a non-existing address. Section: 1 Offset: 0000A9E0H
; Error: Symbol ?_870 has a non-existing address. Section: 1 Offset: 0000A9E8H
; Error: Symbol ?_871 has a non-existing address. Section: 1 Offset: 0000A9F0H
; Error: Symbol ?_872 has a non-existing address. Section: 1 Offset: 0000A9F8H
; Error: Symbol ?_873 has a non-existing address. Section: 1 Offset: 0000AA00H
; Error: Symbol ?_874 has a non-existing address. Section: 1 Offset: 0000AA08H
; Error: Symbol ?_875 has a non-existing address. Section: 1 Offset: 0000AA10H
; Error: Symbol ?_876 has a non-existing address. Section: 1 Offset: 0000AA18H
; Error: Symbol ?_877 has a non-existing address. Section: 1 Offset: 0000AA1CH
; Error: Symbol ?_878 has a non-existing address. Section: 1 Offset: 0000AA20H
; Error: Symbol ?_879 has a non-existing address. Section: 1 Offset: 0000AA28H
; Error: Symbol ?_880 has a non-existing address. Section: 1 Offset: 0000AA30H
; Error: Symbol ?_881 has a non-existing address. Section: 1 Offset: 0000AA38H
; Error: Symbol ?_882 has a non-existing address. Section: 1 Offset: 0000AA39H
; Error: Symbol ?_883 has a non-existing address. Section: 1 Offset: 0000AA40H
; Error: Symbol ?_884 has a non-existing address. Section: 1 Offset: 0000AA48H
; Error: Symbol ?_885 has a non-existing address. Section: 1 Offset: 0000AA50H
; Error: Symbol ?_886 has a non-existing address. Section: 1 Offset: 0000AA58H
; Error: Symbol ?_887 has a non-existing address. Section: 1 Offset: 0000AA59H
; Error: Symbol ?_888 has a non-existing address. Section: 1 Offset: 0000AA60H
; Error: Symbol ?_889 has a non-existing address. Section: 1 Offset: 0000AA68H
; Error: Symbol ?_890 has a non-existing address. Section: 1 Offset: 0000AA70H
; Error: Symbol ?_891 has a non-existing address. Section: 1 Offset: 0000AA78H
; Error: Symbol ?_892 has a non-existing address. Section: 1 Offset: 0000AA80H
; Error: Symbol ?_893 has a non-existing address. Section: 1 Offset: 0000AA84H
; Error: Symbol ?_894 has a non-existing address. Section: 1 Offset: 0000AA88H
; Error: Symbol ?_895 has a non-existing address. Section: 1 Offset: 0000AA89H
; Error: Symbol ?_896 has a non-existing address. Section: 1 Offset: 0000AA90H
; Error: Symbol ?_897 has a non-existing address. Section: 1 Offset: 0000AA98H
; Error: Symbol ?_898 has a non-existing address. Section: 1 Offset: 0000AAB0H
; Error: Symbol ?_899 has a non-existing address. Section: 1 Offset: 0000AAB1H
; Error: Symbol ?_900 has a non-existing address. Section: 1 Offset: 0000AAB2H
; Error: Symbol ?_901 has a non-existing address. Section: 1 Offset: 0000AAB3H
; Error: Symbol ?_902 has a non-existing address. Section: 1 Offset: 0000AAB4H
; Error: Symbol ?_903 has a non-existing address. Section: 1 Offset: 0000AAB5H
; Error: Symbol ?_904 has a non-existing address. Section: 1 Offset: 0000AAB6H
; Error: Symbol ?_905 has a non-existing address. Section: 1 Offset: 0000AAB7H
; Error: Symbol ?_906 has a non-existing address. Section: 1 Offset: 0000AAB8H
; Error: Symbol ?_907 has a non-existing address. Section: 1 Offset: 0000AABAH
; Error: Symbol ?_908 has a non-existing address. Section: 1 Offset: 0000AABBH

END240 - 260
260 - 290
290 - 30B
30B - 33F
33F - 394
394 - 3EE
3EE - 3F1
3F1 - 43D
43D - 462
462 - 4BE
4BE - 4DF
4DF - 5CE
5CE - 5D6
5D6 - 5F5
5F5 - 838
84C - 97C
97C - A23
A23 - A71
A71 - A92
A92 - AC8
AC8 - AE6
AE6 - B07
B07 - B28
B28 - B4C
B4C - B70
B70 - B91
B91 - BAF
BAF - BD0
BD0 - BEE
BEE - C38
C38 - C6B
C6B - CD8
CD8 - D53
D53 - D74
D74 - DD5
DD5 - E3D
E40 - 10B1
10C0 - 18E5
18F0 - 1CF7
1D00 - 1D81
1D90 - 1E4F
1E50 - 1F84
1F84 - 2275
2275 - 2704
2704 - 281E
281E - 2AE0
2AF9 - 2F25
2F25 - 3033
3033 - 309B
309B - 3172
3172 - 3343
3343 - 35B1
35B1 - 3679
3679 - 3799
3799 - 3834
3834 - 3F09
3F09 - 3F0E
3F0E - 40F4
40F4 - 4122
4122 - 41E0
41E0 - 4252
4252 - 42BD
42BD - 4308
4308 - 4381
4381 - 43B9
43B9 - 43F4
43F4 - 4444
4444 - 4509
4509 - 45C1
45C1 - 46B8
46B8 - 476E
476E - 47D2
47D2 - 481A
481A - 488A
488A - 48E1
48E1 - 4945
4945 - 4967
4967 - 4AE5
4AE5 - 4B61
4B61 - 4C0E
4C0E - 4CB9
4CB9 - 4D3A
4D3A - 4E11
4E11 - 4FCE
4FCE - 5074
5074 - 50EF
50EF - 5174
5174 - 51DA
51DA - 5270
5270 - 529E
529E - 543A
543A - 55A4
55A4 - 5A0D
5A0D - 5A5C
5A5C - 5AB9
5AB9 - 5D06
5D06 - 5D85
5D85 - 5DB3
5DB3 - 5E28
5E28 - 60A9
60A9 - 6147
6147 - 6211
6211 - 62A9
62A9 - 6363
6363 - 63C7
63C7 - 641B
641C - 654C
654C - 65F7
65F7 - 669E
66A0 - 66FB
66FB - 675B
6770 - 67AE
67AE - 67FE
67FE - 6803
6803 - 6808
6808 - 683E
683E - 6885
6885 - 68A7
68A7 - 68DB
68DB - 694E
694E - 696D
696D - 6998
6998 - 6AF5
6AF5 - 6B43
6B43 - 6C08
6C08 - 6CA1
6CA1 - 6CD8
6CD8 - 6CFB
6CFB - 6DD8
6DD8 - 6E89
6E89 - 6F5A
6F5A - 70A5
70A5 - 7116
7116 - 7209
7209 - 72A7
72A7 - 72DE
72DE - 7305
7305 - 73E2
73E2 - 74A2
74A2 - 75E2
75E2 - 765D
765D - 7748
7748 - 77DC
77DC - 7813
7813 - 7833
7833 - 7905
7905 - 7BA5
7BA5 - 7C41
7C41 - 7D6A
7D6A - 7E45
7E45 - 7E7C
7E7C - 7EA3
7EA3 - 7EF5
