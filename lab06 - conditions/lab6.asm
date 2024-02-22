; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
    include \masm32\include\masm32rt.inc
; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
.code
start:
    call main
    inkey
    exit
; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
main proc
    mov eax, 666

    cmp eax, 228
    
    je equal 
    jg bigger 
    jl smaller 

    equal:
        fn MessageBox,0,"╨ртэ√","хчєы№ЄрЄ",MB_OK
        jmp over

    bigger:
         fn MessageBox,0,"╧хЁтюх ўшёыю сюы№°х","хчєы№ЄрЄ",MB_OK
        jmp over

    smaller:
         fn MessageBox,0,"┬ЄюЁюх ўшёыю сюы№°х","хчєы№ЄрЄ",MB_OK
        jmp over


    over:
      invoke ExitProcess,0                                     ; bye


main endp
; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
end start
