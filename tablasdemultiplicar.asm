;Johanna Patricia Montaño Guaman
;Sexto "A"
;Programa que realiza la tamblas de Multiplicar
;del 1 al 9
%macro pantallita 2
    mov eax,4
    mov ebx,1
    mov ecx,%1
    mov edx,%2
    int 80h
%endmacro
section .data
    ;Mensajitos (REPETICIONES)
    mensajito1 db ' por '
    tam_msj1 equ $-mensajito1
    ;Mensajito (REPETICIONES)
    mensajito2 db ' igual a '
    tam_msj2 equ $-mensajito2
    ;Mensajito (REPETICIONES)
    saltito db 10
    tam_salto equ $-saltito
    ;MSJ TABLAS DE MULT...
    separador db 'TABLAS DE MULTIPLICAR',10
    tam_s equ $-separador

section .bss
  ;variables x,y,z (MUltiplicando,Multiplicador,Resultado)
	x resb 1
    y resb 1
    z resb 2
section .txt
    global _start
_start:
    mov ax,1
    ;EJECUCIONES (Iteraciones) 
Ejec1:
    push ax      ;EJECUTA Ejec1
    push ax
    add ax,'0' ;imp 0
    mov [x],ax
    pantallita separador,tam_s
    ;imprime el separador en la linea de codigo
    pop ax   
    mov cx,1
Ejec2: 
    push cx         ; EJECUTA Ejec2
    push cx             
    add cx,'0'
    mov [y],cx 
    pop cx              ;asigno el valor de a = cx
    push ax             ;guardamos el valor de ax
    mul cx ;  MUL Byte Ptr [CX]. Va a multiplicar el byte que hay en la dirección que marca CX por e
    aam ;ajusta el resultado guardado en AX de multiplicar dos dígitos BCD no empaquetados. 
    add al,'0'
    add ah,'0'
    mov [z+0],ah
    mov [z+1],al
    call terminal       ; llamamos a la fun Terminal
    pop ax              ;asgino a ax
    pop cx          ;---------------Ejec2
    inc cx
    cmp cx,10
    jnz Ejec2
    pop ax         ;----------------Ejec1
    inc ax
    cmp ax,10
    jnz Ejec1
    jmp salir  ;Salto
    
terminal: 
    pantallita x,1
    pantallita mensajito1,tam_msj1
    pantallita y,1
    pantallita mensajito2,tam_msj2
    pantallita z,2
    pantallita saltito,tam_salto
    ret

salir:
    mov eax,1
    int 80h