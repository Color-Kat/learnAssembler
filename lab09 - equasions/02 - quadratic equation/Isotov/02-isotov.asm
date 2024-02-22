include \masm32\include\masm32rt.inc

.data
    fio db "Изотов Владислав Юрьевич", 0

    ; Квадратное уравнение, у которого 1 корень
    ;aCoef dd 1
    ;bCoef dd -4
    ;cCoef dd 4

    ; Квадратное уравнение, у которого 2 корня
    ;aCoef dd 1
    ;bCoef dd -9
    ;cCoef dd 18
    
    ; Уравнение, у которого нет решений
    ;aCoef dd 1
    ;bCoef dd 0
    ;cCoef dd 1

    ; Бесконечно много решений
    ;aCoef dd 0
    ;bCoef dd 0
    ;cCoef dd 0

    ; Линейное
    aCoef dd 0
    bCoef dd 3
    cCoef dd 3
    
    D dd ?
.code

start:
    call main
    exit
main proc

    fn MessageBox, 0, addr fio, "ФИО", MB_OK

    .if aCoef  == 0 && bCoef  == 0 && cCoef  != 0
        ; 100 = 0
        fn MessageBox, 0, "Нет решений", "Ответ", MB_OK
        ret
    
    .elseif aCoef  == 0 && bCoef  == 0 && cCoef  == 0
        ; 0 = 0
        fn MessageBox, 0, "Бесконечно много решений", "Ответ", MB_OK
        
        ret
        
    .elseif aCoef  == 0
        ; Линейное уравнение
        fn MessageBox, 0, "1 Корень", "Ответ", MB_OK

        ; c
        mov eax, cCoef 

        ; c/b
        mov ebx, bCoef 
        xor edx, edx
        idiv ebx 

        ; -c/b
        mov ebx, -1
        imul ebx
     
        fn MessageBox, 0, str$(eax), "Ответ", MB_OK

        ret
    .endif	
    
    ; В остальных случайх - это квадратное уравнение, будем решать его через дискирминант

    ; <<<<<<<<<<<<<<<
    ; Дискриминант
    ; b^2
    mov eax, bCoef 
    imul bCoef 

    ; Сохраняем промежуточный результат
    mov D, eax

    ; 4c
    mov eax, 4
    imul cCoef

    ; 4ac
    imul aCoef 

    mov edx, D
    sub edx, eax
    mov D, edx
    ; <<<<<<<<<<<<<<<

    cmp D, 0
    je oneRoot
    jg twoRoots
    jl noRoots

    noRoots:
        fn MessageBox, 0, "Нет корней", "Кол-во корней", MB_OK
        jmp over

    oneRoot:
        fn MessageBox, 0, "1 корень", "Кол-во корней", MB_OK

        ; -b
        mov eax, 0
        sub eax, bCoef 
      
        ; (-b) / 2
        xor edx, edx
        mov ecx, 2
        idiv ecx

        ; (-b) / 2a
        xor edx, edx
        mov ebx, aCoef 
        idiv ebx

        fn MessageBox, 0, str$(eax), "Ответ", MB_OK

        jmp over

    twoRoots:
        fn MessageBox, 0, "2 корня", "Кол-во корней", MB_OK

	   ; Корень из дискриминанта через FPU
        finit
        fild D
        fsqrt
        fist D

	   ; --------------------
        ; Найдём первый корень

        ; -b
        mov eax, 0
        sub eax, bCoef 

        ; -b + sqrt(D)
        mov ebx, D
        add eax, ebx

        ; (-b + sqrt(D)) / 2
        xor edx, edx
        mov ebx, 2
        idiv ebx

        ; (-b + sqrt(D)) / 2a
        xor edx, edx
        mov ebx, aCoef 
        idiv ebx

        fn MessageBox, 0, str$(eax), "Корень 1", MB_OK

	   ; --------------------
        ; Найдём второй корень

        ; -b
        mov eax, 0
        sub eax, bCoef 

        ; -b - sqrt(D)
        mov ebx, D
        sub eax, ebx

        ; (-b - sqrt(D)) / 2
        xor edx, edx
        mov ecx, 2
        idiv ecx

        ; (-b - sqrt(D)) / 2a
        xor edx, edx
        mov ebx, aCoef 
        idiv ebx

        fn MessageBox, 0, str$(eax), "Корень 2", MB_OK

        jmp over

  over:  
    invoke ExitProcess, 0                        

main endp

end start
