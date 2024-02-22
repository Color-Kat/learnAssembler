; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
    include \masm32\include\masm32rt.inc
; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

.data
    ; ...
.code
start:
    call main
    exit
; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
main proc
 mov ecx, 5 ; чэрўхэшх ╒

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
        
  fn MessageBox, 0, str$(eax) , "╟эрўхэшх ЇєэъЎшш яЁш x=5", MB_OK

  invoke ExitProcess,0    ; ╩юэхЎ                              

main endp
; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
end start
