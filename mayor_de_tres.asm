section .data
	msj1 db 'Primer valor mayor', 0xA, 0xD
	len1 equ $-msj1
	msj2 db 'Segundo mayor',0xA, 0xD
	len2 equ $-msj2
	msj3 db 'Tercer mayor',0xA, 0xD
	len3 equ $-msj3
	msjIngreso1 db 'Ingrese primer numero', 0xA, 0xD
	lenIngreso1 equ $-msjIngreso1
	msjIngreso2 db 'Ingrese segundo numero', 0xA, 0xD
	lenIngreso2 equ $-msjIngreso2
	msjIngreso3 db 'Ingrese tercer numero', 0xA, 0xD
	lenIngreso3 equ $-msjIngreso3
	
section .bss
	nIngresado1 resb 2
	nIngresado2 resb 2
	nIngresado3 resb 2

section .text
	global _start
_start:
	
	jmp imprimir_numeros
	
guardarNumeros:

	mov ax,[nIngresado1]
	mov bx,[nIngresado2]
	mov cx,[nIngresado3]
	cmp ax,bx
	jg comparacionAx
	jmp comparacionBx


comparacionAx:
	cmp ax,cx
	jg PrimeroMayor
	jmp TerceroMayor

comparacionBx:
	cmp cx,bx
	jp SegundoMayor
	jmp TerceroMayor

PrimeroMayor:
	mov eax,4
	mov ebx,1
	mov ecx, msj1
	mov edx, len1
	int 80h
	jmp salir

SegundoMayor:
	mov eax,4
	mov ebx,1
	mov ecx, msj2
	mov edx, len2
	int 80h
	jmp salir

TerceroMayor:
	mov eax,4
	mov ebx,1
	mov ecx, msj3
	mov edx, len3
	int 80h
	jmp salir

salir:
	mov eax,1
	int 0x80





imprimir_numeros:
	;Imprimir Primer ingreso
	mov eax, 4
	mov ebx, 1
	mov ecx, msjIngreso1
	mov edx, lenIngreso1
	int 80h  ;Es una interrupcion del sistema que llama al kernel

	;Leer primer numero
	mov eax, 3
	mov ebx, 2 
	mov ecx, nIngresado1
	mov edx, 2 
	int 0x80

	;Imprimir Segundo ingreso
	mov eax, 4
	mov ebx, 1
	mov ecx, msjIngreso2
	mov edx, lenIngreso2
	int 80h  ;Es una interrupcion del sistema que llama al kernel

	;Leer segundo numero
	mov eax, 3
	mov ebx, 2 
	mov ecx, nIngresado2
	mov edx, 2 
	int 0x80

	;Imprimir tercer ingreso
	mov eax, 4
	mov ebx, 1
	mov ecx, msjIngreso3
	mov edx, lenIngreso3
	int 80h  ;Es una interrupcion del sistema que llama al kernel

	;Leer tercer numero
	mov eax, 3
	mov ebx, 2 
	mov ecx, nIngresado3
	mov edx, 2 
	int 0x80

	jmp guardarNumeros