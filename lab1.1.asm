section .data           ; сегмент инициализированных переменных
    ; выводимое сообщение
    ExitMsg db  "Press Enter to Exit",10    
    lenExit equ $-ExitMsg

section .bss            ; сегмент неинициализированных переменных
    InBuf resb 10       ; буфер для вводимой строки
    lenIn equ  $-InBuf 


section .text           ; сегмент кода
global _start

_start:
    ; write
    mov eax, 4          ; системная функция 4 (write)
    mov ebx, 1          ; дескриптор файла stdout=1
    mov ecx, ExitMsg    ; адрес выводимой строки
    mov edx, lenExit    ; длина выводимой строки
    int 80h             ; вызов системной функции

    ; read
    mov eax, 3          ; системная функция 3 (read)
    mov ebx, 0          ; дескриптор файла stdin=0
    mov ecx, InBuf      ; адрес буфера ввода
    mov edx, lenIn      ; размер буфера
    int 80h             ; вызов системной функции

    ; exit
    mov eax, 1          ; системная функция 1 (exit)
    xor ebx, ebx        ; код возврата 0
    int 80h             ; вызов системной функции
