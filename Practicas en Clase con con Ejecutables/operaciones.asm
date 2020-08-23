;
section .data
	suma db 'La suma de 4+2 es:',0xA,0xD
	len_suma equ $ - suma

	resta db 0xA,0xD,'La resta de 4-2 es:',0xA,0xD
	len_resta equ $ - resta

    mul_pos db 'La multiplicación de 4*2 es:',0xA,0xD
	len1 equ $ - mul_pos
	
%macro imprimir 2
    mov eax,4
    mov ebx,1
    mov ecx,$1
    mov edx,$2
%endmacro

section .data
	mensaje db 'La suma de 4+2 es',10
	tamano equ $-mensaje

    mensajedos db 10,'La resta de 4-2 es',10
	tamanodos equ $-mensajedos
    
	mensajetres db 10,'La multiplicacion de 4*2 es',10
	longitud equ $-mensajetres

    mensajecuatro db 10,'La division de 4/2 es',10
	longitudos equ $-mensajecuatro

    mensajecinco db 10,'El residuo es',10
    longitutres equ $-mensajecinco

    espacio db '',10
    lonespacio equ $-espacio

section .bss
	suma resb 1
    resta resb 1
    multiplicacion resb 1
    division resb 1
    residuo resb 1

section .text
	global _start

_start:
	
    ; Suma
    mov eax,4
    mov ebx,2
    add eax,ebx
    add eax, '0'        ;Valores convertidos a cadena
    mov [suma],eax

    ; Resta
    mov eax,4
    mov ebx,2
    sub eax,ebx
    add eax, '0'        ;Valores convertidos a cadena
    mov [resta],eax


    ; Multiplicacion
    mov al,4
    mov bh,2 
    mul bh ;  eax = eax * ebx
    add al,'0'
    mov [multiplicacion],al


    ; Division
    mov al,4
    mov bl,2 
    div bl;  eax = eax / ebx
    add al,'0'
    add ah,'0'
    mov [division],al
    mov [residuo],ah


    imprimir mensaje,tamano
    imprimir suma,1

    imprimir mensajedos,tamanodos
    imprimir resta,1

    imprimir mensajetres,longitud
    imprimir multiplicacion,1

    imprimir mensajecuatro,longitudos
    imprimir division,1

    imprimir mensajecinco,longitutres
    imprimir residuo,1
    imprimir espacio,lonespacio

	mov eax,1
	int 80h