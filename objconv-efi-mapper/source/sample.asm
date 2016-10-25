call    ?_374
mov     rsi, 15H
test    al, al
je      ?_284
mov     rax, qword ptr [?_889]
mov     dword ptr [rsp+28H], 2
mov     qword ptr [rsp+20H], 0
lea     rdx, ptr [?_826]
lea     r8, ptr [rbp-28H]
mov     rcx, rdi
mov     r9, rdi
call    qword ptr [rax+118H]
mov     rsi, rax
test    rsi, rsi
js      ?_284
mov     rax, qword ptr [rbp-28H]
