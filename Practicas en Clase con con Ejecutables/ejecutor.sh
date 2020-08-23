#!/bin/bash
if [ $# -eq 1 ]
then
        echo "Compilando y ejecutando...."
        nasm -felf64 $1.asm -o $1.o;
        ld -o $1 $1.o;
        ./$1
else
        echo ".............."
        echo "Error"
fi