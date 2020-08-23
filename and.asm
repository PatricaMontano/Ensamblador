section .data 
	par db 'Numero par'
	len1 equ $ -par
	impar db 'Numero impar'
	len2 equ $ -impar
	msj1 db 'Ingrese un numero',0xA,0xD
	long1 equ $ -msj1
	
	

section .bss
	n1 resb 2

section .text
	global _start
_start:


;Imprimir el mensaje 1
	mov eax, 4
	mov ebx, 1
	mov ecx, msj1
	mov edx, long1
	int 80h  ;Es una interrupcion del sistema que llama al kernel

	;Leer numero 1
	mov eax, 3
	mov ebx, 2 
	mov ecx, n1
	mov edx, 2 
	int 0x80
	;------------------------
	mov ax, [n1]
	and ax, 1
	jz mensaje_par
	mov eax, 4
	mov ebx, 1
	mov ecx, impar
	mov edx, len2
	int 80h

	call salir
;----------------

mensaje_par: 
	mov eax,4
	mov ebx,1
	mov ecx, par
	mov edx, len1
	int 80h

	call salir
;------------------
salir:
	mov eax, 1
	int 0x80








	;EL OPERADOR OR A NIVEL DE BIT DEVUELVE 1 SI ALGUN BIT HAY 1 Y SOLO ES 0 SI LOS DOS SON 0