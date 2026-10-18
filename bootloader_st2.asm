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


    mov si, load_message
    call print



    call halt

halt:
    cli
    .loop:
    	hlt
     	jmp .loop

load_message:
    db "Stage 2 loaded!", 13, 10, 0
