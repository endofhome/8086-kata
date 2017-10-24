org 0x100               ; nasm instruction - binary file program origin 
mov ah, 0x02            ; write character to stdout
mov dl, '4'             ; character to write
int 0x21                ; call interrupt handler 0x21
mov si, number          ; set si to number adress
mov dl,  [si+1]         ; load value pointed by si +1
int 0x21                ; call interrupt handler 0x21

mov ax, 0x4c00          ; exit to shell with AL error code
int 0x21            

number:                 ; label - can be translated by compiler to address
	db '42',0,0x13      ; raw data
