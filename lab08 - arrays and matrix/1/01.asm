; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
    include \masm32\include\masm32rt.inc
; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

.data
    ; my_fullname db "Rogov Vladislav Vladimirovich", 0    ; ╘╚╬
    
    my_name_first db "V",0
    my_name db "ladislav",0

    my_lastname_first db "R",0
    my_lastname db "ogov",0

    my_patronymic_first db "V",0
    my_patronymic db "ladimirovitch",0

    newline db 10, 13, 0 
    space_delemiter db " ",0
    asterisk_delimiter db "*",0
    
    answer_1 db 100 dup(?)
    answer_2 db 1 dup(?)
    answer_3 db 1 dup(?)
    answer_4 db 100 dup(?)
    answer db 100 dup(?)
.code
start:

    ; <<<<< Answer 1 <<<<<
    ; Name
    push offset my_name_first
    push offset answer_1
    call szCatStr

    push offset my_name
    push offset answer_1
    call szCatStr

    ; Space
    push offset space_delemiter
    push offset answer_1
    call szCatStr

    ; Lastname
    push offset my_lastname_first
    push offset answer_1
    call szCatStr

    push offset my_lastname
    push offset answer_1
    call szCatStr

    ; Space
    push offset space_delemiter
    push offset answer_1
    call szCatStr

    ; Patronymic
    push offset my_patronymic_first
    push offset answer_1
    call szCatStr

    push offset my_patronymic
    push offset answer_1
    call szCatStr
    ; <<<<<<<<<<<<<<<<<<<<<<

    ; Add answer 1 to answer
    push offset answer_1
    push offset answer
    call szCatStr

    ; Add new line
    push offset newline
    push offset answer
    call szCatStr

    ; <<<<< Answer 2 <<<<<
    push offset my_name_first
    push offset answer
    call szCatStr
    ; <<<<<<<<<<<<<<<<<<<<

    ; Add new line
    push offset newline
    push offset answer
    call szCatStr

    ; <<<<< Answer 3 <<<<<
    push offset my_patronymic_first
    push offset answer
    call szCatStr
    ; <<<<<<<<<<<<<<<<<<<<

    ; Add new line
    push offset newline
    push offset answer
    call szCatStr

    ; <<<<< Answer 4 <<<<<
     ; Name
    push offset my_name_first
    push offset answer_4
    call szCatStr

    push offset my_name
    push offset answer_4
    call szCatStr

    ; Asteriks
    push offset asterisk_delimiter
    push offset answer_4
    call szCatStr

    ; Lastname
    push offset my_lastname_first
    push offset answer_4
    call szCatStr

    push offset my_lastname
    push offset answer_4
    call szCatStr

    ; Asteriks
    push offset asterisk_delimiter
    push offset answer_4
    call szCatStr

    ; Patronymic
    push offset my_patronymic_first
    push offset answer_4
    call szCatStr

    push offset my_patronymic
    push offset answer_4
    call szCatStr
    ; <<<<<<<<<<<<<<<<<<<<

    ; Add answer 4 to answer
    push offset answer_4
    push offset answer
    call szCatStr

    ; Add new line
    push offset newline
    push offset answer
    call szCatStr

    ; <<<<< Display full answer <<<<<
    push offset answer 
    call StdOut

; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
end start
    