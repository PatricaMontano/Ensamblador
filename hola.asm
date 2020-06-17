;Practica 1
;Primera vez utilizando NASM 
;Fecha=1 de Junio del 2020 
section .data
    mensaje db "Mi primera vez en NASM"; Constante mensaje de un byte en memoria 
    tamano equ $-mensaje // equ = calcularemos el tamaño que tendra el mensaje 

section .text ;empezamos el segmento de codigo
    global _start 
    _start:
        ;imprimir el mensaje
        mov eax,4 ; se mueve el valor de 4 al registro eax
        mov ebx,1 ; se muebe  el valor de 1 al registro ebx
        mov ecx,mensaje ;se mueve el valor de mensaje al registro ecx
        mov edx,tamano ;se mueve el valor del tam al registro edx
        int 80H  ;interrupcion=>EL SO toma el control del ensamblado. Envia una señal al SO para ejecutar una subrutina(operacion o funcion)
        
        mov eax,1      ; salida, system_exit
        mov ebx, 0     ; si el retorno es 0 (200 en la web) ok
        int 80H