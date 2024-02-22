include \masm32\include\masm32rt.inc
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

.data

my_name db 'Влад', 0                ; Моё имя (0 - конец строки, без нуля вместо "Влад" на экран выводится "Влад00F")
birthday_number dd 200518           ; год рождения + номер в группе
birthday dd ?                       ; День рождения
birthday_date db '06 декабря', 0    ; День и месяц рождения

.code
start:
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
main proc

    mov birthday, 6

    fn MessageBox, 0, ADDR my_name, "Имя", MB_OK

    fn MessageBox, 0, str$(birthday_number), "ДР + номер в группе", MB_OK

    fn MessageBox, 0, str$(birthday), "День рождения", MB_OK

    fn MessageBox, 0, ADDR birthday_date, "День рождения, месяц рождения", MB_OK

    invoke ExitProcess, 0

main endp
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
end start