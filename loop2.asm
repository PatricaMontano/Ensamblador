;Programa que imprime un cubo con caracteres y un triangulo invertido 
; JOHANNA MONTAÑO GUAMAN 
;PARA PASAR DE CUBO A TRIANGULO SE COMENTO LA LINEA A CAMBIAR 

%macro pantallita 1
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

    mov rcx, 10  ; cambiar a rxc por arq 32
    mov rbx, 10

l1:
    push rcx
    mov ebx, ecx
    push rbx
    pantallita salito
    pop rbx
    mov ebx, ebx
    push rbx

l2:
    push rcx
    pantallita mensajito
    pop rcx
    loop l2

    pop rcx
    pop rbx
    ;cambiar de cubo a triangulo 
    mov ebx, ecx
    loop l1

salir:
    mov eax, 1
    int 80h