;Nombre: Johanna Patricia Montaño Guaman 
;Fecha: 22-Junio-2020
;TRABAJO EN CLASE 
;El siguiente Archivo permite realizar las operaciones basicas de manera Dinamica
;****************Utilizamos un MACRO PARA ESCRIBIR *****************
%macro escribir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro
;****************Utilizamos un MACRO PARA LEER **********************
%macro leer 2./
	mov eax,3
	mov ebx,2
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

section .data
;*******************Ingreso del Primer Numero **********************
	mensaje1 db 'Ingrese el primer numero:'
	tam1 equ $ - mensaje1
;*******************Ingreso del Segundo Numero **********************
	mensaje2 db 10,'Ingrese el segundo numero:'
	tam2 equ $ - mensaje2
;******************* IMP Resultado Suma **********************
	mensajeSuma db 10,'El resultado de la suma es: '
	tamSuma equ $ - mensajeSuma
;*******************IMP Resultado Resta **********************
	mensajeResta db 10,'El resultado de la resta es: '
	tamResta equ $ - mensajeResta
;*******************IMP Resultado Multiplicacion**********************
	mensajeMultiplicacion db 10,'El resultado de la multiplicacion es: '
	tamMultiplicacion equ $ - mensajeMultiplicacion
;*******************IMP Resultado DIV **********************
	mensajeDivision db 10,'El resultado de la division es: '
	tamDivision equ $ - mensajeDivision
;*******************IMP Residuo **********************
	mensajeResiduo db 10,"El residuo es: "
	tamResiduo equ $ - mensajeResiduo

	new_line db 10," "

section .bss 
    ;*******************PARA LAS VARIABLES ***************
	n1 resb 1
	n2 resb 1
	suma resb 1
	resta resb 1
	multiplicacion resb 1
	division resb 1
	residuo resb 1

section .text
	global _start
_start:

;****************Ingresamos el primer Numero**************

	escribir mensaje1,tam1
	leer n1,2

;****************Ingresamos el segundo Numero************

	escribir mensaje2,tam2
	leer n2,2

;**************Realizamos la suma*********************

	mov al,[n1]
	mov bl,[n2]
	sub al,'0'
	sub bl,'0'
	add al,bl
	add ax,'0'
	mov [suma],ax

;***************Realizamos la Resta*************

	mov al,[n1]
	mov bl,[n2]
	sub al,'0'
	sub bl,'0'
	sub al,bl
	add ax,'0'
	mov [resta],ax

;****************Realizamos la multiplicacion**********

	mov ax,[n1]
	mov bl,[n2]
	sub ax,'0'
	sub bl,'0'
	mul bl
	add ax,'0'
	mov [multiplicacion],ax

;**************Realizamos la division *******************

	mov al,[n1]
	mov bl,[n2]
	sub ax,'0'
	sub bl,'0'
	div bl

	add al,'0'
	mov [division],al

	add ah,'0'
	mov [residuo],ah


	;***********************suma*******************

	escribir mensajeSuma,tamSuma
	escribir suma,1


	;***********************resta*******************

	escribir mensajeResta,tamResta
	escribir resta,1

	;***********************multiplicacion*******************

	escribir mensajeMultiplicacion,tamMultiplicacion
	escribir multiplicacion,1

	;***********************division*******************

	escribir mensajeDivision,tamDivision
	escribir division,1

	;***********************residuo*******************

	escribir mensajeResiduo,tamResiduo
	escribir residuo,1

	;******************************************

	escribir new_line,1
	mov eax,1
	int 80h
