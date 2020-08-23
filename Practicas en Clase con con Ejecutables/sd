%macro imprimir 2
    mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

%macro lectura 1
   	mov eax, 3
	mov ebx, 0
	mov ecx, %1
	mov edx, 2
	int 80h
%endmacro

section .data
	msg1		db		10,'-Calculadora-',10,0
	lmsg1		equ		$ - msg1
 
	msg2		db		10,'Numero 1: ',0
	lmsg2		equ		$ - msg2
 
	msg3		db		'Numero 2: ',0
	lmsg3		equ		$ - msg3

	msg4		db		10, '1. Sumar: ',10 ,0
	lmsg4		equ		$ - msg4
	
	msg5		db		10, '2. Resta: ',10 ,0
	lmsg5		equ		$ - msg5
	
	msg6		db		10, '3. Multiplicar: ',10 ,0
	lmsg6		equ		$ - msg6

	msg7		db		10, '4. Dividir: ',10 ,0
	lmsg7		equ		$ - msg7

	msg8		db		10, '5. Salir: ',10 ,0
	lmsg8		equ		$ - msg8

	msg11		db		10, '6. Seleccione la opcion: ',10 ,0
	lmsg11		equ		$ - msg11

	msg9		db		10,'Resultado: ',0
	lmsg9		equ		$ - msg9
 
	msg10		db		10,'Opcion Invalida',10,0
	lmsg10		equ		$ - msg10
 
	nlinea		db		10,10,0
	lnlinea		equ		$ - nlinea
 
section .bss
	opcion:		resb 	2
  	num1:		resb	2
	num2:		resb 	2
	resultado:	resb 	2
 
section .text
 	global _start
 
_start:
	; Imprimimos en pantalla el mensaje 1
	imprimir msg1, lmsg1
 
	; Imprimimos en pantalla el mensaje 2
	imprimir msg2, lmsg2
 
	; Obtenemos el numero 1
    lectura num1
 
	; Imprimimos en pantalla el mensaje 3
	imprimir msg3, lmsg3

 
	;Obtenemos el numero 2
	lectura num2

menu:
 	;********************menu******************
	imprimir msg4, lmsg4
	imprimir msg5, lmsg5
	imprimir msg6, lmsg6
	imprimir msg7, lmsg7
    imprimir msg8, lmsg8

    ;***************mensaje-opcion**************************
  	imprimir msg11, lmsg11

	;************leer-opcion************
    lectura opcion

	mov ah, [opcion]
	sub ah, '0'

	;comparar el valor ingresado por el usuario
	;etiqueta JE = jmp if exits equals
	 	
	cmp ah, 1
	JE sumar
	
	cmp ah, 2
	JE restar

	cmp ah, 3
	JE multiplicar

	cmp ah, 4
	JE dividir

	cmp ah, 5
	JE salir
 
	; Si el valor ingresado no cumple con ninguna de las condiciones anteriores entonces mostramos un mensaje de error y finalizamos
	; la ejecucion del programa
	imprimir msg10, lmsg10
	jmp salir
 
 sumar:
	;Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]
 
	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'
 
	; Sumamos el registro AL y BL
	add al, bl
 
	; Convertimos el resultado de la suma de decimal a ascii
	add al, '0'
 
	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], al
 
	; Imprimimos en pantalla el mensaje 9
	imprimir msg9, lmsg9
 
	; Imprimimos en pantalla el resultado
	imprimir resultado, 1

    jmp menu
 
restar:
	mov al, [num1]
	mov bl, [num2]
 
	sub al, '0'
	sub bl, '0'
 
	sub al, bl
 	add al, '0'
 
	mov [resultado], al
 
	; Imprimimos en pantalla el mensaje 9
	imprimir msg9, lmsg9
 
	; Imprimimos en pantalla el resultado
	imprimir resultado, 2

    jmp menu

 
multiplicar:
 
	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]
 
	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'
 
	; Multiplicamos. AX = AL X BL
	mul bl
 
	; Convertimos el resultado de la resta de decimal a ascii
	add ax, '0'
 
	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], ax
 
	; Imprimimos en pantalla el mensaje 9
	imprimir msg9, lmsg9
 
	; Imprimimos en pantalla el resultado
	imprimir resultado, 1

    jmp menu
 
dividir:
 
	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]
 
	; Igualamos a cero los registros DX y AH
	mov dx, 0
	mov ah, 0
 
	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'
 
	; Division. AL = AX / BL. AX = AH:AL
	div bl
 
	; Convertimos el resultado de la resta de decimal a ascii
	add ax, '0'
 
	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], ax
 
	; Print on screen the message 9
	imprimir msg9, lmsg9
 
	; Imprimimos en pantalla el resultado
	imprimir resultado, 1

    jmp menu
 
salir: 
	;Finalizamos el programa
	mov eax, 1
	mov ebx, 0
	int 80h
