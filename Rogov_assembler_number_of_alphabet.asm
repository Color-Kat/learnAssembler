;������, ��� ����������� ��� ���������
.const
;������, ��� ����������� ����������, ��� ������� �����-�� ��������
.data
    poryadk DD 13
    antibukva DD 13
;.data?

.code
start: ;� ����� ����� ���������� ��� ���������
; �������������������������������������������������������������������������
main proc
    mov eax 18
    mov ecx 10
    add eax, ecx
    
main endp
; �������������������������������������������������������������������������
end start ;� ����� ����� ������������� ��� ���������

