; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
    include \masm32\include\masm32rt.inc
; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
.data

    x dd 2 ; ╟эрўхэшх x

.code
start:
    call main
    exit

main proc
    ; x^4
    mov eax, x
    mov ebx, x
    imul ebx
    imul ebx
    imul ebx

    mov ecx, eax

    add ecx, x
    sub ecx, 6

    fn MessageBox, 0, str$(ecx) , "╟эрўхэшх ЇєэъЎшш яЁш x=2", MB_OK

    invoke ExitProcess, 0                            
main endp
end start
