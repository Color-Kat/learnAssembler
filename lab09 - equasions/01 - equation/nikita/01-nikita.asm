; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
    include \masm32\include\masm32rt.inc
; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
.data

    xVal dd 11
    yVal dd 7

.code
start:
    call main
    exit

main proc
    ; x^3
    mov eax, xVal
    mov ebx, xVal
    imul ebx
    imul ebx

    mov ecx, eax

    ; -2xy
    mov eax, xVal
    mov ebx, -2
    imul ebx
    mov ebx, yVal
    imul ebx

    add ecx, eax  

    ; 7x^2
    mov eax, xVal
    mov ebx, xVal
    imul ebx
    mov ebx, 7
    imul ebx

    ; ╬ЄтхЄ
    add ecx, eax
    fn MessageBox, 0, str$(ecx) , "╟эрўхэшх ЇєэъЎшш яЁш x=11; y = 7", MB_OK

    invoke ExitProcess, 0                            
main endp
end start
