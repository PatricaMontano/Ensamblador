;Johanna Patricia Montaño Guaman
;Lunes 3 de agosto del 2020

%macro pantalla 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro
section .data

	msj db "Multiplicar",10
	tam equ $-msj

	mensajito db "a * b = c ",10
	tam_mensaje equ $ - mensajito
	
	msj2 db " x "
	len2 equ $-msj2
	
	msj3 db " = "
	len3 equ $-msj3
	
	msj4 db "|||"
	len4 equ $-msj4
	
	espacio db 10
	tam_esp equ $-espacio
	
section .bss
	numero rest 2
	presentarN1 rest 2
	presentarN2 rest 2
	respuesta rest 2
	aux rest 2
	x rest 2

section .text
	global _start
	
_start:
	pantalla msj, tam
	mov al, 1
	mov [aux], al
	mov ecx, 0
	
principal:
	cmp ecx,3
	jz bucle
	inc ecx
	push ecx
	mov [numero], ecx
	jmp imp
	
imp:
	mov al, [numero]
	mov [presentarN1], al
	mov cl, [aux]
	mul cl
	
	mov [numero], al
	mov ah, [presentarN1]
	add ax, '00'
	add cx, '00'
	mov [presentarN1], ah
	mov [presentarN2], cl
	pantalla presentarN1, 1
	pantalla msj2, len2
	pantalla presentarN2, 1
	pantalla msj3, len3
	mov eax, 48
	add [numero], eax 
	pantalla numero, 2
	pantalla msj4, len4
	pop ecx
	jmp principal

bucle: 
	pantalla espacio, tam_esp
	mov ebx, [aux]
	inc ebx
	mov [aux], ebx
	mov ecx, 0
	cmp ebx, 6
	jb principal
	
salir:
	mov eax, 1
	mov ebx, 0
	int 80h