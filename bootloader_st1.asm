
bits 16
org 0x7C00

start:
    ; Normalizza CS:IP
    jmp 0x0000:main

main:
    ; Inizializza i segmenti
    cli
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7A00
    cld
    sti

    ; Conserva il drive da cui siamo partiti
    mov [boot_drive], dl

    ; Verifica il supporto alle estensioni BIOS
    mov ah, 0x41
    mov bx, 0x55AA
    mov dl, [boot_drive]
    int 0x13
    jc error

    cmp bx, 0xAA55
    jne error

    test cx, 1
    jz error

    ; Carica un settore: LBA 1 al fisico 0x7E00
    mov si, dap
    mov dl, [boot_drive]
    mov ah, 0x42
    int 0x13
    jc error

    ; Trasferisce il controllo allo Stage 2
    jmp 0x0000:0x7E00

error:
    ; Messaggio di errore tramite BIOS
    xor ax, ax
    mov ds, ax
    mov si, error_msg

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

boot_drive:
    db 0

align 4

dap:
    db 0x10        ; Dimensione del DAP: 16 byte
    db 0           ; Riservato
    dw 1           ; Settori da leggere
    dw 0x7E00      ; Offset destinazione
    dw 0x0000      ; Segmento destinazione
    dq 1           ; LBA iniziale: settore 1

error_msg:
    db "Stage 1: disk error", 0


times 510 - ($ - $$) db 0
dw 0xAA55
