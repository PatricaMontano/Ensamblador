;Johanna Patricia Montaño Guaman 
; Fecha 13 de Julio del 2020
; Patrictica pasar a macros el ejercicio 
%macro imprimir 2
mov eax, 4
mov ebx, 1
mov ecx, %1
mov edx, %2
int 80h
;---------------------------------cambiamos a macros

%endmacro 
section .data
	msg1		db		10,'-Calculadora-',10,0
	lmsg1		equ		$ - msg1
 
	msg2		db		10,'Ingrese Numero 1: ',0
	lmsg2		equ		$ - msg2
 
	msg3		db		'Ingrese Numero 2: ',0
	lmsg3		equ		$ - msg3

	msg4		db		10,'1.Suma',0
	lmsg4		equ		$ - msg4

	msg5		db		10,'2.Resta',0
	lmsg5		equ		$ - msg5

	msg6		db		10,'3.Multiplicacion',0
	lmsg6		equ		$ - msg6

	msg7		db		10,'4.Division',0
	lmsg7		equ		$ - msg7

	msg8		db		10,'Seleccione la Operacion',10
	lmsg8		equ		$ - msg8

	msg9		db		10,'Resultado de la Operacion: ',0
	lmsg9		equ		$ - msg9
 
	msg10		db		10,'Opcion Invalida !!!!!!!',0
	lmsg10		equ		$ - msg10

	msg11		db		10,'5.Salir',0
	lmsg11		equ		$ - msg11
 
	nlinea		db		10,'Hasta Luego',10,0
	lnlinea		equ		$ - nlinea

	separador	db		10,'*****************',0
	tams		equ		$ - separador
 
section .bss
	opcion:     resb    2
  	num1:		resb	2
	num2:		resb 	2
	resultado:	resb 	2
 
section .text
 	global _start
 
_start:
;-------------------------------------EJERCICIO CALCULADORA INFINITA
	; Imprimimos el mensaje principal
	imprimir msg1,lmsg1

	; Imprimimos en pantalla el mensaje 1
	imprimir msg2,lmsg2
	; Obtenemos el numero 1
	mov eax, 3
	mov ebx, 0
	mov ecx, num1
	mov edx, 2
	int 80h
	; Imprimimos en pantalla el mensaje 2
	imprimir msg3,lmsg3
	; Obtenemos el numero 2
	mov eax, 3
	mov ebx, 0
	mov ecx, num2
	mov edx, 2
	int 80h
 
menu: 
	;************Mensajes del Menu*************
	imprimir separador,tams
	;***********************
	imprimir msg4,lmsg4
		;***********************
	imprimir msg5,lmsg5
		;***********************
	imprimir msg6,lmsg6
		;***********************
	imprimir msg7,lmsg7
		;***********************
	imprimir msg11,lmsg11
		;***********************
	imprimir separador,tams
	;************Mensaje de Opcion*************
	imprimir msg8,lmsg8

	mov eax, 3
	mov ebx, 0
	mov ecx, opcion
	mov edx, 2
	int 80h

	mov ah,[opcion]
	sub ah,'0'

	;***********************************************
	;**************Comparar********************
	;Compara el valor ingresado x el usuario para saber que operacion realizar
	;JE=jmp (condicional if exist iqual , salta cuando de los 2 operandos son iguales,ZF=1,CF=0)
	cmp ah,1
	je sumar

	cmp ah,2
	je restar

	cmp ah,3
	je multiplicar

	cmp ah,4
	je dividir

	cmp ah,5
	je salir
 
	; Si el valor ingresado no cumple con ninguna de las condiciones anteriores entonces mostramos un mensaje de error y finalizamos
	; la ejecucion del programa
	imprimir msg10,lmsg10
	jmp menu
 
 sumar:
	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]
 
	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'
 
	; Sumamos el registro AL y BL
	add al, bl
;	aaa
 
	; Convertimos el resultado de la suma de decimal a ascii
	add al, '0'
 
	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], al
 
	; Imprimimos en pantalla el mensaje 9
	imprimir msg9,lmsg9
	; Imprimimos en pantalla el resultado
	imprimir resultado,2
 
	jmp menu

 
restar:
	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]
 
	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'
 
	; Restamos el registro AL y BL
	sub al, bl
 
	; Convertimos el resultado de la resta de decimal a ascii
	add al, '0'
 
	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], al
 
	; Imprimimos en pantalla el mensaje 9
	imprimir msg9,lmsg9
	; Imprimimos en pantalla el resultado
	imprimir resultado,2
 
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
	imprimir msg9,lmsg9
	; Imprimimos en pantalla el resultado
	imprimir resultado,2
 
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
 
	; Imprimimos en pantalla el mensaje 9
	imprimir msg9,lmsg9
	; Imprimimos en pantalla el resultado
	imprimir resultado,2
 
	jmp menu

 
salir:
	; Imprimimos en pantalla dos nuevas lineas
	imprimir nlinea,lnlinea
 
	; Finalizamos el programa
	mov eax, 1
	mov ebx, 0
	int 80h