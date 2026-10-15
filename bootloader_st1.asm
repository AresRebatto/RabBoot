BITS 16
ORG 0x7C00

main:
	;cleaning
	cli

	xor ax, ax
	mov ds, ax
	mov es, ax,
	mov ss, ax
	mov sp, 0x7C00

	cld 
	sti

 	mov [boot_drive], dl

    ; Verifica il supporto alle estensioni BIOS
    mov ah, 0x41
    mov bx, 0x55AA
    mov dl, [boot_drive]
    int 0x13
    jc error
    
    ; Il resto del codice qui
   
boot_drive:
    db 0
	