;98   z.bin

code segment
        assume cs:code,ds:code
        org 100h

begin:
        jmp install
        d1 db 'z'
        old dd ?
        c db 0
        color db 0
        pag db ?
        line_23 db 10 dup(20h,0)
        line db 'Z',0eh,'B',0eh,'.',0eh,20h,0
        line_24 db 2 dup(20h,0ah,20h,0ah,':',8eh),20h,0ah,20h,0ah
start:
        inc cs:[c]
        cmp byte  ptr cs:[c],8
        je n1
        jmp dword ptr cs:[old]
n1:
        mov byte ptr cs:[c],0
        push ax
        push bx
        push cx
        push dx
        push ds
        push es
        push di
        push si
          
        cmp byte ptr cs:[color],15
        jae n3
        inc cs:[color]
        mov bh,cs:[color]
        mov byte ptr cs:[line+1],bh
        mov byte ptr cs:[line+3],bh
        jmp n4
n3:
        mov byte ptr cs:[color],0
n4:
        mov ah,0fh
        int 10h
        ;     mov ah,3
        ;     int 10h
        ;       push dx
        mov cs:[pag],bh
        mov ax,0b800h
        mov es,ax
        ;       mov ax,4096
        ;      mov bh,pag
        ;      mul bh
            
        ;        mov di,ax
        ;      add di,140
        mov ax,cs
        mov ds,ax
        ;      lea  si,line_23
        cld
        ;      mov cx,20
        ;     rep movsb
        mov ah,2
        int 1ah
        push cx
        mov ah,ch
        mov cl,4
        shr ch,cl
        add ch,30h
        mov byte ptr cs:[line_24],ch
        mov ch,ah
        and ch,0fh
        add ch,30h
        mov byte ptr cs:[line_24+2],ch
        pop bx
        mov ah,bl
        shr bl,cl
        add bl,30h
        mov byte ptr cs:[line_24+6],bl
        and ah,0fh
        add ah,30h
        mov byte ptr cs:[line_24+8],ah
        mov ah,dh
        shr dh,cl
        add dh,30h
        mov byte ptr cs:[line_24+12],dh
        and ah,0fh
        add ah,30h
        mov byte ptr cs:[line_24+14],ah
        mov ax,4096
        mov bh,pag
        mul bh
        mov di,ax
        add di,134
        lea si,line
        mov cx,24
        rep  movsb

        ;     pop dx
        ;     mov bh,pag
        ;     mov ah,2
        ;     int 10h
        pop si
        pop di
        pop es
        pop ds
        pop dx
        pop cx
        pop bx
        pop ax
        iret
install:
        mov ax,351ch
        int 21h
        mov word ptr old,bx
        mov word ptr old+2,es
        mov si,80h
        cmp byte ptr cs:[si],0
        je next
        cmp byte ptr es:[103h],'z'
        jne error
        push ds
        push dx
        push di
        cli
        lea di,old
        mov ds,word ptr es:[di+2]
        mov  dx,word ptr es:[di]
        mov ax,251ch
        int 21h
        sti
        pop di
        pop dx
        pop ds
        mov ah,49h
        int 21h
        jmp eexit
error:
        lea dx, mess
        mov ah,9
        int 21h
eexit:
        mov ah,4ch
        int 21h
next:
        mov ax,251ch
        lea dx,start
        int 21h
        lea dx,install
        int 27h
        mess db '      the TSR program no find!$'

        code ends
        end begin
