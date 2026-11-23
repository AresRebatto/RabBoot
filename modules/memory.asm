; Copia n byte (specificati in cx) dalla memoria DS:SI a ES:SI
mem_copy:
    
    push ax
    push bx
    push cx

    mov bx, 0x0

    .loop:
        lodsb
    
        mov [si+bx], al
        
        inc bx

        dec cx
        cmp cx, 0x0
        je .end_copy
        
        jmp .loop  

    .end_copy:
        pop cx
        pop bx
        pop ax
        ret

; Scrive n byte (specificati in cx) con valore specificato in al a partire da DS:SI
mem_set:
    
    push bx

    mov bx, 0x0
   
    .loop:

    mov [di+bx], al

    inc bx
    cmp bx, cx 
    jl .loop
    
    pop bx
    ret
