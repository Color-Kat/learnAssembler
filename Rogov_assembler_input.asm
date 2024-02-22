include\masm32\include\masm32rt.inc 	; подключение файла библ. функций
;<<<<<<<<<<<<<<<<<<<<<<<<<<
.data
 varl DD ?	 ; место для переменной длины DD
.code
start:
    call main
    inkey
    exit
;<<<<<<<<<<<<<<<<<<<<<<<<<<
main proc
 mov varl, sval(input("Enter a number: "))
 mov eax, 10 	; мой порядковый номер по журналу - 10
 add eax, varl 	; Складываем
 print str$(eax)
 
main endp
end start


