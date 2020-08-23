%macro imprimir 1
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,1
	int 80h
%endmacro 
section .data
        asterisco db '*'
        salto db 10
section .bss
section .text
    global _start

_start:
    mov ecx,8
    mov ebx,1
l1:
    push ecx
    push ebx
    imprimir salto;IMPRIME NUEVA LINEA
    pop ecx
    push ecx

l2:
    push ecx
    ;*************
    imprimir asterisco
    pop ecx
    loop l2;Generando el salto a L2, ecx -1
    ;FINALIZA LA COLumnA
    pop ebx
    pop ecx
    inc ebx
    loop l1;
    mov eax , 1
    int 80h