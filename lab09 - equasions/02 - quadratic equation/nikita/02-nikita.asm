include \masm32\include\masm32rt.inc

.data
    fullname db "�������� ������ ������������", 0

    ; ��� ������
    ;aValue  dd 1
    ;bValue  dd 0
    ;cValue  dd 1

    ; ����������� ���-�� �������
    ;aValue  dd 0
    ;bValue  dd 0
    ;cValue  dd 0

    ; ��������
    ;aValue  dd 0
    ;bValue  dd 3
    ;cValue  dd 3

    ; �� 1 ������
    ;aValue dd 1
    ;bValue dd -4
    ;cValue dd 4

    ; �� 2 �����
    aValue dd 1
    bValue dd -9
    cValue dd 18
    
    discriminant dd ?
.code

start:
    call main
    exit

main proc

    fn MessageBox, 0, addr fullname, "���", MB_OK

    ; 123 = 0
    .if aValue  == 0 && bValue  == 0 && cValue  != 0
        fn MessageBox, 0, "0 ������", "�����", MB_OK
        ret
    
    ; 0 = 0
    .elseif aValue  == 0 && bValue  == 0 && cValue  == 0
        fn MessageBox, 0, "���������� ����� �������", "�����", MB_OK
        
        ret
        
    ; bx + c = 0
    .elseif aValue  == 0
        fn MessageBox, 0, "1 ������", "�����", MB_OK

        ; c
        mov eax, cValue 

        ; c/b
        mov ebx, bValue 
        xor edx, edx
        idiv ebx 

        ; -c/b
        mov ebx, -1
        imul ebx
     
        fn MessageBox, 0, str$(eax), "�����", MB_OK

        ret
    .endif	

    ; D = b^2
    mov eax, bValue 
    imul bValue 

    ; ��������� ������������� ���������
    mov discriminant, eax

    ; D = 4a
    mov eax, 4
    imul aValue 

    ; D = 4ac
    imul cValue 

    mov edx, discriminant
    sub edx, eax
    mov discriminant, edx

    cmp discriminant, 0
    je onRoot
    jg twoRoots
    jl noRoots

    noRoots:
        fn MessageBox, 0, "��� ������", "�����", MB_OK
        jmp over

    onRoot:
        fn MessageBox, 0, "1 ������", "�����", MB_OK

        ; -b
        mov eax, 0
        sub eax, bValue 
      
        ; (-b) / 2
        xor edx, edx
        mov ecx, 2
        idiv ecx

        ; (-b) / 2a
        xor edx, edx
        mov ebx, aValue 
        idiv ebx

        fn MessageBox, 0, str$(eax), "������ 1", MB_OK

        jmp over

    positive:
        fn MessageBox, 0, "2 �����", "�����", MB_OK

	   ; ������� ������ ����� FPU
        finit
        fild discriminant
        fsqrt
        fist discriminant

        ; ������ ������

        ; -b
        mov eax, 0
        sub eax, bValue 

        ; -b + sqrt(D)
        mov ebx, discriminant
        add eax, ebx

        ; (-b + sqrt(D)) / 2
        xor edx, edx
        mov ebx, 2
        idiv ebx

        ; (-b + sqrt(D)) / 2a
        xor edx, edx
        mov ebx, aValue 
        idiv ebx

        fn MessageBox, 0, str$(eax), "������ 1", MB_OK


        ; ������ ������

        ; -b
        mov eax, 0
        sub eax, bValue 

        ; -b - sqrt(D)
        mov ebx, discriminant
        sub eax, ebx

        ; (-b - sqrt(D)) / 2
        xor edx, edx
        mov ecx, 2
        idiv ecx

        ; (-b - sqrt(D)) / 2a
        xor edx, edx
        mov ebx, aValue 
        idiv ebx

        fn MessageBox, 0, str$(eax), "������ 2", MB_OK

        jmp over

  over:  
    invoke ExitProcess, 0                        

main endp

end start
