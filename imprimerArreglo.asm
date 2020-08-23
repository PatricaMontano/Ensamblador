segment .data
        arreglo  db 3,2,0,7,5
        len_arreglo equ $-arreglo
segment .bss
         numero resb 1 
segment .text
        global _start

_start:
       mov esi, arreglo ;mover tam a esi
       mov edi, 0       ; edi

imprimir:
       mov al,[esi]
       add al, 'O'
       mov [numero],al
       
       add esi, 1 
       add edi, 1 
       mov ecx, numero
       mov edx, 1
       int 0x80

       cmp edi, len_arreglo ; cmp se activa el carry
                            ; cmp 4. 3 desactiva el carry y zero
                            ; se desactiva carry y se activa cerp 
                            ;se ejecuta cuando carry esta activado
        jb imprimir         ; se ejecuta cuando la bandera carry esta activada

salir:
    mov eax, 1 
    int 0x80