; �������������������������������������������������������������������������
    include \masm32\include\masm32rt.inc
; �������������������������������������������������������������������������

.data
    fio db "��������� ������ ���������", 0

    ; 1 ������
    ;aval dd 1
    ;bval dd -4
    ;cval dd 4

    ; 2 �����
    ;aval dd 1
    ;bval dd -6
    ;cval dd 8
    
    ; ��� ������
    ;aval dd 732
    ;bval dd 0
    ;cval dd 732

    ; ����������� ���-�� ������
    aval dd 0
    bval dd 0
    cval dd 0

    
    discriminant dd ?
    
.code
start:
    call main
    exit
; �������������������������������������������������������������������������
main proc

    fn MessageBox, 0, addr fio, "���", MB_OK

    ; ��� ������� 123 = 0
    .if aval == 0 && bval == 0 && cval != 0
        fn MessageBox, 0, "��� �������", "�����", MB_OK
        ret
    
    ; ����������� ���-�� ������ 0 = 0
    .elseif aval == 0 && bval == 0 && cval == 0
        fn MessageBox, 0, "����������� ���-�� ������", "�����", MB_OK
        
        ret
        
    ; bx + c = 0
    .elseif aval == 0
       
        fn MessageBox, 0, "1 ������", "�����", MB_OK

        ; c
        mov eax, cval

        ; c/b
        mov ebx, bval
        xor edx, edx
        idiv ebx 

        ; -c/b
        mov ebx, -1
        imul ebx
     
        fn MessageBox, 0, str$(eax), "�����", MB_OK

        ret
    .endif	

    ; D = b^2
    mov eax, bval
    imul bval

    mov discriminant, eax

    ; D = 4ac
    mov eax, 4
    imul aval
    imul cval

    mov edx, discriminant
    sub edx, eax
    mov discriminant, edx

    ; fn MessageBox, 0, str$(discriminant), "������������", MB_OK

    cmp discriminant, 0
    je zero
    jg plus
    jl minus

    minus:
        fn MessageBox, 0, "��� ������", "������� �� ��", MB_OK
        jmp over

    zero:
        fn MessageBox, 0, "1 ������", "������� �� ��", MB_OK

        ; -b
        mov eax, 0
        sub eax, bval
      
        ; (-b) / 2
        xor edx, edx
        mov ecx, 2
        idiv ecx

        ; (-b) / 2a
        xor edx, edx
        mov ebx, aval
        idiv ebx

        fn MessageBox, 0, str$(eax), "������ 1", MB_OK

        jmp over

    plus:
        fn MessageBox, 0, "2 �����", "������� �� ��", MB_OK

        finit			;  �������������� FPU
        fild discriminant  ;  ������� ����� �� ������
        fsqrt              ;  �������� ���������� ������
        fist discriminant  ;  ���������� � discriminant ������ �� �������������

        ; x1

        ; -b
        mov eax, 0
        sub eax, bval

        ; -b + sqrt(D)
        mov ebx, discriminant
        add eax, ebx

        ; (-b + sqrt(D)) / 2
        xor edx, edx
        mov ebx, 2
        idiv ebx

        ; (-b + sqrt(D)) / 2a
        xor edx, edx
        mov ebx, aval
        idiv ebx

        fn MessageBox, 0, str$(eax), "������� 1", MB_OK

        ; x2

        ; -b
        mov eax, 0
        sub eax, bval

        ; -b - sqrt(D)
        mov ebx, discriminant
        sub eax, ebx

        ; (-b - sqrt(D)) / 2
        xor edx, edx
        mov ecx, 2
        idiv ecx

        ; (-b - sqrt(D)) / 2a
        xor edx, edx
        mov ebx, aval
        idiv ebx

        fn MessageBox, 0, str$(eax), "������� 2", MB_OK

        jmp over

  over:  
    invoke ExitProcess,0    ; �����                              

main endp
; �������������������������������������������������������������������������
end start
