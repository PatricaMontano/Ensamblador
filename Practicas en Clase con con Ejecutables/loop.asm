%macro impirmir 1
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, 1
	int 80h
%endmacro

section .data
    msg db '*',10
    salto db 10,' '

section .text
    global _start
_start:

    mov rcx, 10
    mov rbx, 10

l1:
    push rcx
    mov ebx, ecx
    push rbx
    impirmir salto
    pop rbx
    mov ecx, ebx
    push rbx

l2:
    push rcx
    impirmir msg
    pop rcx
    loop l2

    pop rcx
    pop rbx
    mov ecx, ebx
    loop l1

salir:
    mov eax, 1
    int 80h