; �������������������������������������������������������������������������
    include \masm32\include\masm32rt.inc
; �������������������������������������������������������������������������
.data

    x1 dd 4
    x2 dd 2
    x3 dd 3

.code
start:
    call main
    exit

main proc

    ; x1 * x2
    mov eax, x1
    mov ebx, x2
    imul ebx
    mov ecx, eax ; ��������� ������������� ��������

    ; x1 * x3
    mov eax, x1
    mov ebx, x3
    imul ebx
    add ecx, eax ; ����������

    ; x2 * x3
    mov eax, x2
    mov ebx, x3
    imul ebx
    add ecx, eax

    ; �����
    fn MessageBox, 0, str$(ecx) , "�������� �������", MB_OK

    invoke ExitProcess, 0                            
main endp
end start
