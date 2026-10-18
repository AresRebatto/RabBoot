print:
	;salvataggio stato precedente
	push ax
	push bx
	push si

	.next:
	    lodsb
	    test al, al
	    jz .end

	    mov ah, 0x0E
	    mov bx, 0x0007
	    int 0x10
	    jmp .next
	.end:
		pop si
		pop bx
		pop ax
		ret

print_hex_digit:

	push ax
	push bx

    and al, 0x0F
    cmp al, 9
    jbe .numeric

    add al, 'A' - 10
    jmp .print

	.numeric:
    	add al, '0'

    .print:
	    mov ah, 0x0E
	    mov bx, 0x0007
	    int 0x10

		pop bx
		pop ax
	    ret