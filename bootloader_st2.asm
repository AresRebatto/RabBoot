bits 16
org 0x7E00

jmp start

%include "modules/console.asm"
%include "modules/disk.asm"
%include "modules/memory.asm"
%include "modules/protected_mode.asm"

start:
	cli

    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax

    sti

    mov [boot_drive], dl
    
    mov si, load_message
    call print

    mov cx, 0xA
    mov al, 0x1
    mov si, mem_to_set
    call mem_set
    
    mov si, mem_to_set
    call print




    call halt

halt:
    cli
    .loop:
    	hlt
     	jmp .loop

load_message:
    db "Stage 2 loaded!", 13, 10, 0

boot_drive:
	db 0

mem_to_set:
    times 10 db 0x0
    db 13, 10, 0
