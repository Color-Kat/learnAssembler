; �������������������������������������������������������������������������
    include \masm32\include\masm32rt.inc
; �������������������������������������������������������������������������

.data
   array     dd 1,2,3,4,5,6,7,8,9,10,11,12
.code
start:
    call main
    exit
; �������������������������������������������������������������������������
main proc

    LOCAL sum : DWORD

    mov esi, offset array ; ����� ������ �������

    ; 1
    mov eax, [esi+1*4] ; ���� 0-�� ������� �������
    add sum, eax ; ������� ������� ������� � ���������� sum

    ; 3
    mov eax, [esi+3*4] ; ���� 3-�� ������� �������
    add sum, eax ; ������� ������� ������� � ���������� sum

    ; 8
    mov eax, [esi+8*4] ; ���� 3-�� ������� �������
    add sum, eax ; ������� ������� ������� � ���������� sum
    
    fn MessageBox, 0, str$(sum), "����� 3� ��������� �������", MB_OK

    invoke ExitProcess,0    ; �����                              

main endp
; �������������������������������������������������������������������������
end start
