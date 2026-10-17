
bits 16
org 0x7E00

start:
    xor ax, ax
    mov ds, ax
    mov si, message

.print:
    lodsb
    test al, al
    jz .halt

    mov ah, 0x0E
    mov bx, 0x0007
    int 0x10
    jmp .print

.halt:
    cli
    hlt
    jmp .halt

message:
    db "Stage 2 loaded!", 0
