;JOHANNA PATRICIA MONTAÑO GUAMAN 
;SEXTO A
; CUADRADO
section .data
        asteris db '*'
        jump db '',10
        lensalto equ $ - jump
section .text
        global _start
_start:

        mov ax,9
        

saltito: 
        mov cx,9

        dec ax
        push ax
        jmp pantalla        

pantalla:
        dec cx
        push cx  ; push 
        mov eax,4
        mov ebx,1
        mov ecx,asteris
        mov edx,1
        int 80h
        pop cx    ;pop 
        cmp cx,0
        jnz pantalla


        mov eax,4
        mov ebx,1
        mov ecx,jump
        mov edx,lensalto
        int 80h

        pop ax   ; pop 
        cmp ax,0
        jnz saltito
        

salir:
        mov eax,1
        int 80h