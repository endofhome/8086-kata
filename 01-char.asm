
    org 0x100               ; nasm instruction - binary file program origin

    mov cx, 18
    mov dh, 0

looper:
    push cx
    xor cx, cx
    inc dh

    call cmp_fizz
    jne not_print_fizz
    call print_fizz
    inc cx

not_print_fizz:
    call cmp_buzz
    jne not_print_buzz
    call print_buzz
    jmp print_new_line

not_print_buzz:
    cmp cx, 0
    jne print_new_line
	call print_number

print_new_line:
    mov ah, 0x02            ; write character to stdout
    mov dl, 10              ; character to write
    int 0x21                ; call interrupt handler 0x21

    pop cx
    loop looper

    mov ax, 0x4c00          ; exit to shell with AL error code
    int 0x21


print_number:
    push dx
    xor ax, ax
	mov al, dh				; are we looking at a number greater than 10?
    mov bl, 10
    div bl
    mov dl, al
    call print_digit
    mov dl, ah
    call print_digit
    pop dx
    ret

print_digit:
    push ax
    add dl, '0'				; increment by ascii 0
    mov ah, 0x02            ; write character to stdout
    int 0x21                ; call interrupt handler 0x21
    pop ax
	ret 

cmp_fizz:
    xor ax, ax
    mov al, dh				; are we looking at a number greater than 10?
    mov bl, 3
    div bl
    cmp ah, 0
    ret

cmp_buzz:
    xor ax, ax
    mov al, dh				; are we looking at a number greater than 10?
    mov bl, 5
    div bl
    cmp ah, 0
    ret

print_fizz:
    push dx
    mov dl, 'F'
    call print_a_char
    pop dx
    ret

print_buzz:
    push dx
    mov dl, 'B'
    call print_a_char
    pop dx
    ret

; expects 'dl'
print_a_char:
    push ax
    mov ah, 0x02            ; write character to stdout
    int 0x21                ; call interrupt handler 0x21
    pop ax
	ret

number:                 ; label - can be translated by compiler to address
	db '42',0,0x13      ; raw data




;    mov ah, 0x02            ; write character to stdout
;    mov dl, '4'             ; character to write
;    int 0x21                ; call interrupt handler 0x21
;
;    mov si, number          ; set si to number adress
;    mov dl,  [si+1]         ; load value pointed by si +1
;    int 0x21                ; call interrupt handler 0x21

;Example:
;MOV AX, 203   ; AX = 00CBh
;MOV BL, 4
;DIV BL        ; AL = 50 (32h), AH = 3
;RET