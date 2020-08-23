;TABLAS DE MULTIPLICAR 
;Por Johanna Patricia Montaño Guaman
; Realize un programa que imprima las tamblas de multiplicar hasta el 9 

%macro pantallita 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro
section .data
	msj db "TABLITA JOHANNA",10
	tam equ $-msj

	mensaje db "a * b = c ",10
	tam_mensaje equ $ - mensaje
	
	msj2 db " x "
	len2 equ $-msj2
	
	msj3 db " = "
	len3 equ $-msj3
	
	msj4 db " ### "
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
	pantallita msj, tam
	mov al, 1
	mov [aux], al
	mov ecx, 0
	
principal:
	cmp ecx,9 ;5
	jz bucle
	inc ecx
	push rcx
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
	pantallita presentarN1, 1
	pantallita msj2, len2
	pantallita presentarN2, 1
	pantallita msj3, len3
	mov eax, 48
	add [numero], eax 
	pantallita numero, 2
	pantallita msj4, len4
	pop rcx
	jmp principal

bucle: 
	pantallita espacio, tam_esp
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
