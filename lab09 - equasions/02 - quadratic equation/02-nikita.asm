; �������������������������������������������������������������������������
    include \masm32\include\masm32rt.inc
; �������������������������������������������������������������������������

.data
    my_name db "����� ��������� ������������", 0

    ; ��� ������
    avar dd 1
    bvar dd 0
    cvar dd 1

    ; ����������� ���-�� �������
    ;avar dd 0
    ;bvar dd 0
    ;cvar dd 0

    ; ��������
    ;avar dd 0
    ;bvar dd 3
    ;cvar dd 3

    ; ���������� 1 ������
    ;avar dd 1
    ;bvar dd -6
    ;cvar dd 9

    ; ���������� 2 �����
    ;avar dd 1
    ;bvar dd -5
    ;cvar dd 6
    
    dvar dd ?
    
    result1 dd ?
    result2 dd ?
.code
start:
    call main
    exit
; �������������������������������������������������������������������������
main proc

    fn MessageBox, 0, addr my_name, "���", MB_OK

    ; �� ���������� ���������
    .if avar == 0 && bvar == 0 && cvar != 0
        ; 123 = 0
        fn MessageBox, 0, "��� ������� (0 ������)", "�����", MB_OK
        ret
    
    .elseif avar == 0 && bvar == 0 && cvar == 0
        ; 0 = 0
        fn MessageBox, 0, "���������� ����� �������", "�����", MB_OK
        
        ret
        
    .elseif avar == 0
        ; bx + c = 0

        fn MessageBox, 0, "1 ������", "�����", MB_OK

        ; c
        mov eax, cvar

        ; c/b
        mov ebx, bvar
        xor edx, edx
        idiv ebx 

        ; -c/b
        mov ebx, -1
        imul ebx
     
        fn MessageBox, 0, str$(eax), "�����", MB_OK

        ret
    .endif	

    ; D = b^2
    mov eax, bvar
    imul bvar

    ; ��������� ������������� ���������
    mov dvar, eax

    ; D = 4a
    mov eax, 4
    imul avar

    ; D = 4ac
    imul cvar

    mov edx, dvar
    sub edx, eax
    mov dvar, edx
    ; � dvar �������� ������������ 

    fn MessageBox, 0, str$(dvar), "������������", MB_OK

    cmp dvar, 0
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
        sub eax, bvar
      
        ; (-b) / 2
        xor edx, edx
        mov ecx, 2
        idiv ecx

        ; (-b) / 2a
        xor edx, edx
        mov ebx, avar
        idiv ebx

        fn MessageBox, 0, str$(eax), "������ 1", MB_OK

        jmp over

    positive:
        fn MessageBox, 0, "2 �����", "������� ����������� ���������", MB_OK

        finit;      �������������� FPU
        fild dvar;  ������� ����� �� ������
        fsqrt;      �������� ���������� ������
        fist dvar;  � dvar ������ �� �������������

        ; <<<<< x1 <<<<<

        ; -b
        mov eax, 0
        sub eax, bvar

        ; -b + sqrt(D)
        mov ebx, dvar
        add eax, ebx

        ; (-b + sqrt(D)) / 2
        xor edx, edx
        mov ebx, 2
        idiv ebx

        ; (-b + sqrt(D)) / 2a
        xor edx, edx
        mov ebx, avar
        idiv ebx

        fn MessageBox, 0, str$(eax), "������� 1", MB_OK


        ; <<<<< x2 <<<<<

        ; -b
        mov eax, 0
        sub eax, bvar

        ; -b - sqrt(D)
        mov ebx, dvar
        sub eax, ebx

        ; (-b - sqrt(D)) / 2
        xor edx, edx
        mov ecx, 2
        idiv ecx

        ; (-b - sqrt(D)) / 2a
        xor edx, edx
        mov ebx, avar
        idiv ebx

        fn MessageBox, 0, str$(eax), "������� 2", MB_OK

        jmp over

  over:  
    invoke ExitProcess,0    ; �����                              

main endp
; �������������������������������������������������������������������������
end start
