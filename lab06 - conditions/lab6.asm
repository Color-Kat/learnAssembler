; �������������������������������������������������������������������������
    include \masm32\include\masm32rt.inc
; �������������������������������������������������������������������������
.code
start:
    call main
    inkey
    exit
; �������������������������������������������������������������������������
main proc
    mov eax, 666

    cmp eax, 228
    
    je equal 
    jg bigger 
    jl smaller 

    equal:
        fn MessageBox,0,"�����","��������",MB_OK
        jmp over

    bigger:
         fn MessageBox,0,"������ ����� ������","��������",MB_OK
        jmp over

    smaller:
         fn MessageBox,0,"������ ����� ������","��������",MB_OK
        jmp over


    over:
      invoke ExitProcess,0                                     ; bye


main endp
; �������������������������������������������������������������������������
end start
