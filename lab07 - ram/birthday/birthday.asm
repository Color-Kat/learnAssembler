include \masm32\include\masm32rt.inc
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

.data

my_name db '����', 0                ; �� ��� (0 - ����� ������, ��� ���� ������ "����" �� ����� ��������� "����00F")
birthday_number dd 200518           ; ��� �������� + ����� � ������
birthday dd ?                       ; ���� ��������
birthday_date db '06 �������', 0    ; ���� � ����� ��������

.code
start:
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
main proc

    mov birthday, 6

    fn MessageBox, 0, ADDR my_name, "���", MB_OK

    fn MessageBox, 0, str$(birthday_number), "�� + ����� � ������", MB_OK

    fn MessageBox, 0, str$(birthday), "���� ��������", MB_OK

    fn MessageBox, 0, ADDR birthday_date, "���� ��������, ����� ��������", MB_OK

    invoke ExitProcess, 0

main endp
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
end start