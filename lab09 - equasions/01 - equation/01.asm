; �������������������������������������������������������������������������
    include \masm32\include\masm32rt.inc
; �������������������������������������������������������������������������

.data
    ; ...
.code
start:
    call main
    exit
; �������������������������������������������������������������������������
main proc
 mov ecx, 5 ; �������� �

 ; x^2
 mov eax, ecx  
 mov ebx, ecx 
 mul ebx     

 ; 3x^2
 mov ebx, 3
 mul ebx

 ; 3x^2 + x - 2
 add eax, ecx
 sub eax, 2
        
  fn MessageBox, 0, str$(eax) , "�������� ������� ��� x=5", MB_OK

  invoke ExitProcess,0    ; �����                              

main endp
; �������������������������������������������������������������������������
end start
