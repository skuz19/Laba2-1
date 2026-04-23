section .data
    msg1 db "Введите количество чисел:", 10   ; строка приглашения для ввода количества чисел + \n
    len1 equ $ - msg1                         ; вычисляем длину строки msg1

    msg2 db "Введите числа:", 10              ; строка приглашения для ввода чисел
    len2 equ $ - msg2                         ; длина строки msg2

    msg3 db "Сумма цифр: "                    ; строка перед выводом результата
    len3 equ $ - msg3                         ; длина строки msg3

section .bss
    buffer resb 128       ; буфер для хранения вводимой строки (128 байт)
    sum resq 1            ; переменная для хранения суммы (64-bit)

section .text
    global _start         ; объявляем точку входа

_start:

    ; ===== вывод "Введите количество чисел" =====
    mov rax, 1            ; syscall write (номер 1)
    mov rdi, 1            ; файловый дескриптор stdout (1)
    mov rsi, msg1         ; адрес строки
    mov rdx, len1         ; длина строки
    syscall               ; вызываем ядро

    ; ===== чтение N (значение не используем) =====
    mov rax, 0            ; syscall read (номер 0)
    mov rdi, 0            ; stdin (0)
    mov rsi, buffer       ; буфер для ввода
    mov rdx, 128          ; максимум читаем 128 байт
    syscall               ; читаем ввод

    ; ===== вывод "Введите числа" =====
    mov rax, 1            ; syscall write
    mov rdi, 1            ; stdout
    mov rsi, msg2         ; адрес строки
    mov rdx, len2         ; длина
    syscall               ; вывод

    ; ===== чтение строки с числами =====
    mov rax, 0            ; syscall read
    mov rdi, 0            ; stdin
    mov rsi, buffer       ; буфер
    mov rdx, 128          ; максимум байт
    syscall               ; читаем строку

    ; ===== добавляем конец строки =====
    mov rcx, rax          ; rcx = количество реально введённых байт
    mov rsi, buffer       ; rsi указывает на начало буфера
    add rsi, rcx          ; смещаемся к концу введённой строки
    mov byte [rsi], 0     ; записываем '\0' — признак конца строки

    mov qword [sum], 0    ; sum = 0 (обнуляем сумму)
    mov rsi, buffer       ; rsi будет указателем для обхода строки

; ===== цикл обработки чисел =====
next_number:
    xor rax, rax          ; rax = 0 (будем собирать текущее число)

; ===== разбор цифр числа =====
parse_digits:
    mov bl, [rsi]         ; читаем текущий символ строки

    cmp bl, 0             ; если конец строки
    je process_number     ; перейти к обработке числа

    cmp bl, ' '           ; если пробел (разделитель)
    je process_number     ; число закончилось

    cmp bl, 10            ; если символ новой строки '\n'
    je process_number     ; число закончилось

    sub bl, '0'           ; преобразуем ASCII → цифра
    imul rax, rax, 10     ; rax = rax * 10 (сдвиг разряда)
    add rax, rbx          ; добавляем цифру к числу

    inc rsi               ; переходим к следующему символу
    jmp parse_digits      ; продолжаем разбор числа

; ===== обработка одного числа =====
process_number:
    mov rbx, rax          ; rbx = текущее число

digit_loop:
    cmp rbx, 0            ; если число стало 0
    je next_token         ; переходим к следующему числу

    mov rax, rbx          ; rax = число
    xor rdx, rdx          ; очищаем rdx перед делением
    mov rcx, 10           ; делитель = 10
    div rcx               ; rax = число / 10, rdx = остаток (цифра)

    mov r8, rdx           ; r8 = текущая цифра

    ; --- проверка digit % 3 ---
    mov rax, r8           ; rax = digit
    xor rdx, rdx          ; очищаем rdx
    mov rcx, 3            ; делитель = 3
    div rcx               ; rdx = digit % 3

    cmp rdx, 0            ; если остаток не 0
    jne skip_add          ; пропускаем

    add [sum], r8         ; sum += digit

skip_add:
    mov rax, rbx          ; rax = число
    xor rdx, rdx          ; очищаем rdx
    mov rcx, 10           ; делитель = 10
    div rcx               ; rax = число / 10

    mov rbx, rax          ; обновляем число
    jmp digit_loop        ; продолжаем разбор цифр

; ===== переход к следующему числу =====
next_token:
    inc rsi               ; пропускаем пробел
    cmp byte [rsi], 0     ; если не конец строки
    jne next_number       ; обрабатываем следующее число

; ===== вывод результата =====
print:

    mov rax, 1            ; syscall write
    mov rdi, 1            ; stdout
    mov rsi, msg3         ; текст "Сумма цифр: "
    mov rdx, len3         ; длина
    syscall               ; вывод

    ; --- преобразование числа в строку ---
    mov rax, [sum]        ; rax = значение суммы
    mov rbx, 10           ; делитель
    mov rcx, buffer       ; используем buffer для записи строки
    add rcx, 127          ; переходим в конец буфера
    mov byte [rcx], 10    ; добавляем '\n'
    dec rcx               ; смещаемся назад

convert:
    xor rdx, rdx          ; очищаем rdx
    div rbx               ; rax = rax/10, rdx = остаток (цифра)
    add dl, '0'           ; переводим цифру в ASCII
    mov [rcx], dl         ; записываем символ
    dec rcx               ; сдвигаемся влево
    cmp rax, 0            ; если число не закончилось
    jne convert           ; продолжаем

    inc rcx               ; rcx указывает на начало строки числа

    ; --- вывод числа ---
    mov rax, 1            ; syscall write
    mov rdi, 1            ; stdout
    mov rsi, rcx          ; адрес строки
    mov rdx, buffer       ; конец буфера
    add rdx, 128
    sub rdx, rcx          ; длина = конец - начало
    syscall               ; вывод

    ; ===== завершение программы =====
    mov rax, 60           ; syscall exit
    xor rdi, rdi          ; код возврата 0
    syscall               ; завершение
