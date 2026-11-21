; Input:
;   DS:SI = Disk Address Packet
;   DL    = BIOS drive number
;
; Output:
;   AH = 0: success
;   AH = 1: error
;
disk_read_sector:
    push si
    push dx

    ; Check EDD support
    mov ah, 0x41
    mov bx, 0x55AA
    int 0x13
    jc .edd_error

    cmp bx, 0xAA55
    jne .edd_error

    test cx, 1
    jz .edd_error

    ; Restore inputs before reading
    pop dx
    pop si

    ; Preserve inputs across disk read
    push si
    push dx

    ; Read sectors using DAP
    mov ah, 0x42
    int 0x13

    pop dx
    pop si
    jc .read_error

    xor ah, ah
    ret

.edd_error:
    pop dx
    pop si

.read_error:
    mov ah, 1
    stc
    ret


; Input:
;   DL = BIOS drive number
;
; Output:
;   CF = BIOS status
;   AH = BIOS error code if CF=1
;
disk_reset:
    mov ah, 0x00
    int 0x13
    ret
