include \masm32\include\masm32rt.inc

.data
    fio db "������ ��������� �������", 0

    ; ���������� ���������, � �������� 1 ������
    ;aCoef dd 1
    ;bCoef dd -4
    ;cCoef dd 4

    ; ���������� ���������, � �������� 2 �����
    ;aCoef dd 1
    ;bCoef dd -9
    ;cCoef dd 18
    
    ; ���������, � �������� ��� �������
    ;aCoef dd 1
    ;bCoef dd 0
    ;cCoef dd 1

    ; ���������� ����� �������
    ;aCoef dd 0
    ;bCoef dd 0
    ;cCoef dd 0

    ; ��������
    aCoef dd 0
    bCoef dd 3
    cCoef dd 3
    
    D dd ?
.code

start:
    call main
    exit
main proc

    fn MessageBox, 0, addr fio, "���", MB_OK

    .if aCoef  == 0 && bCoef  == 0 && cCoef  != 0
        ; 100 = 0
        fn MessageBox, 0, "��� �������", "�����", MB_OK
        ret
    
    .elseif aCoef  == 0 && bCoef  == 0 && cCoef  == 0
        ; 0 = 0
        fn MessageBox, 0, "���������� ����� �������", "�����", MB_OK
        
        ret
        
    .elseif aCoef  == 0
        ; �������� ���������
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
    
    ; � ��������� ������� - ��� ���������� ���������, ����� ������ ��� ����� ������������

    ; <<<<<<<<<<<<<<<
    ; ������������
    ; b^2
    mov eax, bCoef 
    imul bCoef 

    ; ��������� ������������� ���������
    mov D, eax

    ; 4c
    mov eax, 4
    imul cCoef

    ; 4ac
    imul aCoef 

    mov edx, D
    sub edx, eax
    mov D, edx
    ; <<<<<<<<<<<<<<<

    cmp D, 0
    je oneRoot
    jg twoRoots
    jl noRoots

    noRoots:
        fn MessageBox, 0, "��� ������", "���-�� ������", MB_OK
        jmp over

    oneRoot:
        fn MessageBox, 0, "1 ������", "���-�� ������", MB_OK

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

        fn MessageBox, 0, str$(eax), "�����", MB_OK

        jmp over

    twoRoots:
        fn MessageBox, 0, "2 �����", "���-�� ������", MB_OK

	   ; ������ �� ������������� ����� FPU
        finit
        fild D
        fsqrt
        fist D

	   ; --------------------
        ; ����� ������ ������

        ; -b
        mov eax, 0
        sub eax, bCoef 

        ; -b + sqrt(D)
        mov ebx, D
        add eax, ebx

        ; (-b + sqrt(D)) / 2
        xor edx, edx
        mov ebx, 2
        idiv ebx

        ; (-b + sqrt(D)) / 2a
        xor edx, edx
        mov ebx, aCoef 
        idiv ebx

        fn MessageBox, 0, str$(eax), "������ 1", MB_OK

	   ; --------------------
        ; ����� ������ ������

        ; -b
        mov eax, 0
        sub eax, bCoef 

        ; -b - sqrt(D)
        mov ebx, D
        sub eax, ebx

        ; (-b - sqrt(D)) / 2
        xor edx, edx
        mov ecx, 2
        idiv ecx

        ; (-b - sqrt(D)) / 2a
        xor edx, edx
        mov ebx, aCoef 
        idiv ebx

        fn MessageBox, 0, str$(eax), "������ 2", MB_OK

        jmp over

  over:  
    invoke ExitProcess, 0                        

main endp

end start
