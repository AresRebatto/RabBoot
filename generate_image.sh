#!/bin/bash
set -e

nasm -f bin bootloader_st1.asm -o stage1.bin
nasm -f bin bootloader_st2.asm -o stage2.bin

dd if=/dev/zero of=rabboot.img bs=512 count=2880 status=none
dd if=stage1.bin of=rabboot.img bs=512 count=1 conv=notrunc status=none
dd if=stage2.bin of=rabboot.img bs=512 seek=1 conv=notrunc status=none

echo "Immagine rabboot.img creata correttamente."
