include\masm32\include\masm32rt.inc 	; ����������� ����� ����. �������
;<<<<<<<<<<<<<<<<<<<<<<<<<<
.data
 varl DD ?	 ; ����� ��� ���������� ����� DD
.code
start:
    call main
    inkey
    exit
;<<<<<<<<<<<<<<<<<<<<<<<<<<
main proc
 mov varl, sval(input("Enter a number: "))
 mov eax, 10 	; ��� ���������� ����� �� ������� - 10
 add eax, varl 	; ����������
 print str$(eax)
 
main endp
end start


