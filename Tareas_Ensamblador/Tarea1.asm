;Tarea 1 de lenguaje de Ensamblador
;Nombre: Johanna Patricia Montaño Guaman 
;;
;========>Estamos definiendo una instrucion cuyo nombre es "imprimir", el mismo tiene dos parametos <===========================
%macro imprimir 2 ;
	mov eax,4	;=>Dentro del Registro eax almacenamos 4 , esto se indica en la funcion sys_write
	mov ebx,1	;=>Nuestra unidad de salida ( salida estandar = 1 ) , pantalla
	mov ecx,%1 	;=>Nos señala el area de la memoria en donde estan los caracteres que se imprimiran
	mov edx,%2	;=>Muestra el numero de caracteres maximos a mostrar 
	int 80H		;=>indicamos una interupcion en cualquier distribucion basada en linux 
%endmacro
;===============>Estamos definiendo una instrucion cuyo nombre es "leer", el mismo tiene dos parametos <=========================
%macro leer 2 ;
    mov eax,3	;=>En el registro eax definimos 3 , esto se indica en la  funcion sys_read
    mov ebx,0	;=>unidad de salida ||( 0 = entrada estandar)
    mov ecx,%1 	;=>Apunta a un área de memoria donde se dejarán los caracteres obtenidos
    mov edx,%2	;=>Nos Muestra el numero de caracteres maximos a mostrar 

; =>ecx,modo de acceso
; =>edx, permisos
section .bss;=>Definimos el inicio de la seccion de variables  <========================================
	auxiliar resb 30	;=>Recervaremos en la  memoria 30 bytes para la variable auxiliar
	auxiliarb resb 30	;=>Recervaremos en la 30 bytes para la variable auxiliarb
	auxiliarc resb 30	;=>Recervaremos en la 30 bytes para la variable auxiliarc


section .data; =>Definimos el inicio de la seccion constantes  <========================================
	msg db 0x1b ,"       " ;=>Para contener al dato existen 6 espacios 
	lenmsg equ $-msg	;=>En la variable msg almacenamos  el tamaño de los datos 



	salto db " ",10 	;=>en una variable almacenamos un salto  de linea <========================================
	lensalto equ $-salto;=>la variable salto almacena el tamaño de datos 




section .text;=>Definimos el inicio de la seccion de codigo  <========================================
    global _start    ;=>exportar simbolos dentro del codigo

_start:;=> incializa el programa  <========================================
	
	mov ecx,9 ;= el registro de proposito general ecx pone el valor 9 

	mov al,0; =>se copiara a la porcion de la memoria en que este ubicado el 0
	mov [auxiliar],al ;=>se mueve el  auxiliar al espacio que reservamos en memoria

cicloI:
	push ecx 	;=>Sacamos los valores de la pila a los registros 
	mov ecx,9	;=> Colocamos  el valor 9 en el registro ecx

	mov al,0	;=>indica que se copiara a la porcion de la memoria en que este ubicado el 0
	mov [auxiliarb],al ;=>movemos el auxiliarb al espacio que reservamos en memoria

	cicloJ:
		push ecx ;=>el valor de ecx  se incluye a la pila


		call imprimir0al9 ;=>se llama al proceso  imprimir0al19 
		

	;	imprimir msg2,lenmsg2
    ;
	fincicloJ:
		mov al,[auxiliarb] ;=>al espacio que habiamos reservado le movemos el auxiliar 
		inc al ;=>al registro al incrementamos 1 
		mov [auxiliarb],al ; => el valor del registro se coloca en la variable auxiliarb

		pop ecx  ;=Enviamos el ultimo valor almacenado en la pila a ecx
		loop cicloJ ;=> disminuimos  cx en 1 y se repite el cicloJ mientras cx siempre y cuando sea  diferente de 0
		
	;imprimir salto,lensalto

fincicloI:
	mov al,[auxiliar] ;=>movemos el auxiliar al espacio que reservamos en memoria
	inc al;=>al registro al incrementamos 1 
	mov [auxiliar],al; =>pone el valor del registro al en la variable auxiliarb

	pop ecx ;=>transfiere el ultimo valor almacenado en la pila a ecx
	loop cicloI;=>disminuimos cx en 1 y repite cicloI mientras cx sea diferente de 0
	

salir:
	mov eax, 1;=>guardamos 1 en el registro eax, lo que indica la funcion sys_exit
	int 80H; => indicamos una interupcion en cualquier distribucionn basada en linux 

imprimir0al9: ; <========================================
	
	mov ebx,"[" ;=>guardamos  "[" en el registro ebx
	mov [msg+1], ebx ;=>almacena ebx en la variable msg que se encuentra en la posicion 1 

	mov bl,[auxiliar];=>guardamoos el valor de auxiliar en el registro bl
	add bl,'0';=> se transforma en cadena
	mov [msg+2], bl ;=>almacena bl en la variable msg en la que se encuentra en la posicion 2 


	mov ebx," ;=>almacena ";" en el registro ebx
	mov [msg+3], ebx ; =>almacena ebx en la variable msg en la posicion 3

	
	mov bl,[auxiliarb];=>guardamos el valor de auxiliarb en el registro bl
	add bl,'0'; =>se transforma en cadena
	mov [msg+4],bl; =>almacena bl en la variable msg en la posicion 4

	mov ebx,"fJ" ;almacena "fJ" en el registro ebx
	mov [msg+5], ebx; almacena ebx en la variable msg que se encuentra en la  posicion 5

	imprimir msg,lenmsg ;llamos a imprimir y enviamos los parametros "msg" y "lenmsg"

	ret ; le estamos diciendo que nos retorne el call