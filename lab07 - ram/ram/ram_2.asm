;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
include \masm32\include\masm32rt.inc
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
.data

name db 'Âëàä'
birthday_number dd 200518
birthday dd ?
birthday_date db '06, 12'

.code
start:
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
main proc

    mov birthday, 2005

    fn MessageBox,0,str$(name),"Èìÿ",MB_OK
    fn MessageBox,0,str$(birthday_number)


    invoke ExitProcess, 0
main endp
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
end start