; �������������������������������������������������������������������������
    include \masm32\include\masm32rt.inc
; �������������������������������������������������������������������������

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
; �������������������������������������������������������������������������
main proc

    mov ecx, 12

    inputArrayElements:
        mov i, ecx ; ������ �����
        xor eax, eax ; ������� �������
        mov eax, sval(input("Enter a number: ")) ; ���� �������� �� ������� � �������
        mov ecx, i ; ��������� ������ � ecx

        ; ���������� � eax ������� �������
        mov array[ecx], al 
        mov al, array[ecx]

        ; ���������� � 0
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

    ; ���������
    print " ", 13, 10
    print str$(positiveSum), " - the sum of the positive entered numbers.", 13, 10
    print str$(negativeCount), " - the count of the negative entered numbers.", 13, 10


main endp
; �������������������������������������������������������������������������
end start
