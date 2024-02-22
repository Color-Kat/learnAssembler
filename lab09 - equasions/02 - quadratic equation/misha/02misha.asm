; �������������������������������������������������������������������������
    include \masm32\include\masm32rt.inc
; �������������������������������������������������������������������������

.data
    fio db "������� ������ ����������", 0

    ; ��� ������
    ;aCoef dd 2
    ;bCoef dd 0
    ;cCoef dd 2

    ; ����������� ����� ������
    ;aCoef dd 0
    ;bCoef dd 0
    ;cCoef dd 0

    ; ��������
    ;aCoef dd 0
    ;bCoef dd 2
    ;cCoef dd 4

    ; ���������� 1 ������
    ;aCoef dd 1
    ;bCoef dd -4
    ;cCoef dd 4

    ; ���������� 2 �����
    aCoef dd 3
    bCoef dd -12
    cCoef dd 9
    
    discriminant dd ?
    
.code
start:
    call main
    exit
; �������������������������������������������������������������������������
main proc

    fn MessageBox, 0, addr fio, "���", MB_OK

    .if aCoef == 0 && bCoef == 0 && cCoef != 0
        ; 123 = 0
        fn MessageBox, 0, "��� �������", "�����", MB_OK
        ret
    
    .elseif aCoef == 0 && bCoef == 0 && cCoef == 0
        ; 0 = 0
        fn MessageBox, 0, "���������� ����� ������", "�����", MB_OK
        
        ret
        
    .elseif aCoef == 0
        ; bx + c = 0

        fn MessageBox, 0, "1 ������", "�����", MB_OK

        ; c
        mov eax, cCoef

        ; c/b
        mov ebx, bCoef
        xor edx, edx
        idiv ebx 

        ; -c/b
        mov ebx, -1
        imul ebx
     
        fn MessageBox, 0, str$(eax), "�����", MB_OK

        ret
    .endif	

    ; D = b^2
    mov eax, bCoef
    imul bCoef

    ; ��������� ������������
    mov discriminant, eax

    ; D = 4a
    mov eax, 4
    imul aCoef

    ; D = 4ac
    imul cCoef

    mov edx, discriminant
    sub edx, eax
    mov discriminant, edx

    ; fn MessageBox, 0, str$(discriminant), "������������", MB_OK

    cmp discriminant, 0
    je zero
    jg positive
    jl negative

    negative:
        fn MessageBox, 0, "��� ������", "������� ����������� ���������", MB_OK
        jmp over

    zero:
        fn MessageBox, 0, "1 ������", "������� ����������� ���������", MB_OK

        ; -b
        mov eax, 0
        sub eax, bCoef
      
        ; (-b) / 2
        xor edx, edx
        mov ecx, 2
        idiv ecx

        ; (-b) / 2a
        xor edx, edx
        mov ebx, aCoef
        idiv ebx

        fn MessageBox, 0, str$(eax), "������ 1", MB_OK

        jmp over

    positive:
        fn MessageBox, 0, "2 �����", "������� ����������� ���������", MB_OK

        finit;      �������������� FPU
        fild discriminant;  ������� ����� �� ������
        fsqrt;      �������� ���������� ������
        fist discriminant;  � discriminant ������ �� �������������

        ; ----- x1 -----

        ; -b
        mov eax, 0
        sub eax, bCoef

        ; -b + sqrt(D)
        mov ebx, discriminant
        add eax, ebx

        ; (-b + sqrt(D)) / 2
        xor edx, edx
        mov ebx, 2
        idiv ebx

        ; (-b + sqrt(D)) / 2a
        xor edx, edx
        mov ebx, aCoef
        idiv ebx

        fn MessageBox, 0, str$(eax), "������� 1", MB_OK


        ; ----- x2 -----

        ; -b
        mov eax, 0
        sub eax, bCoef

        ; -b - sqrt(D)
        mov ebx, discriminant
        sub eax, ebx

        ; (-b - sqrt(D)) / 2
        xor edx, edx
        mov ecx, 2
        idiv ecx

        ; (-b - sqrt(D)) / 2a
        xor edx, edx
        mov ebx, aCoef
        idiv ebx

        fn MessageBox, 0, str$(eax), "������� 2", MB_OK

        jmp over

  over:  
    invoke ExitProcess,0    ; �����                              

main endp
; �������������������������������������������������������������������������
end start
