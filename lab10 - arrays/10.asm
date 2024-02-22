; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
    include \masm32\include\masm32rt.inc
; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

.data
    array db 12 dup(?)
    i dd ?
    positiveSum dd ?
    negativeCount dd ?

    tmp dd ?
.code
start:                        
    call main
    exit
; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
main proc

    mov ecx, 12

    inputArrayElements:
        mov i, ecx ; ╚эфхъё Ўшъыр
        xor eax, eax ; юўш∙рхь ЁхушёЄЁ
        mov eax, sval(input("Enter a number: ")) ; ┬тюф чэрўхэш  шч ъюэёюыш т ЁхушёЄЁ
        mov ecx, i ; ёюїЁрэ хь шэфхъё т ecx

        ; ╟ряшё√трхь т eax Єхъє∙шщ ¤ыхьхэЄ
        mov array[ecx], al 
        mov al, array[ecx]

        ; ╤Ёртэштрхь ё 0
        cmp eax, 0
        jg positive
        jl negative

        negative:
            inc negativeCount
            jmp over
        positive:
            add positiveSum, eax
            jmp over
    
        over:
            loop inputArrayElements

    ; ╨хчєы№ЄрЄ
    print " ", 13, 10
    print str$(positiveSum), " - the sum of the positive entered numbers.", 13, 10
    print str$(negativeCount), " - the count of the negative entered numbers.", 13, 10


main endp
; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
end start
