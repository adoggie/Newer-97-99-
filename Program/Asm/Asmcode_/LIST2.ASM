

   date segment
    buf1 db 512 dup(?)
    buf2 db 64 dup (64 dup (20h))
    buf3 db 13,10
   file db 'master',0
    flag dw 0
    date ends
    code segment
     assume cs:code,ds:date,es:date
      set_p macro 
       mov ah,42h
       mov al,2
       mov cx,0
       mov dx,0
       mov bx,flag
       int 21h
    endm
      start: push ds
              mov ax,0
              push ax
              mov ax,date
              mov ds,ax
              mov es,ax
              ;********
       mov ax,0201h
       lea bx,buf1
       mov cx,0021h
       mov dx,0080h
       int 13h
       ;*****************
       mov cx,512
       mov di,0
       mov si,2
 n0:  push cx
     mov ch,2
      mov bx,0
      mov bl,buf1[di]
 n1: mov dx,flag
     cmp dx,0
     jnz n2
      mov cl,12
      mov dx,1
      mov flag,dx

 n4:     rol bx,cl
         mov al,bl
         and al,0fh
         add al,30h
         cmp al,3ah
         jl n3
         add al,07h
    n3:    cmp dx,0
            je n5
              mov buf2[si],al
              jmp n6
          n5: mov buf2[si+1],al
          n6:dec ch
             jnz n1
             inc di
             add si,4
             pop cx
             loop n0
          jmp n7
     n2:  mov cl,4
         mov dx,0
         mov flag,dx
         jmp n4
   n7:  lea dx,file
         mov cx,0
         mov ah,3ch
         int 21h
         mov flag,ax
       ;**************
         mov cx,64
         lea dx,buf2
     n8: push cx
         push dx
         mov cx,64
        mov bx,flag
         mov ah,40h
        int 21h
        set_p
        lea dx,buf3
        mov cx,2
        mov ah,40h
        mov bx,flag
        int 21h
        set_p
        pop dx
       add dx,64
       pop cx
       loop n8
       mov ah,3eh
        mov bx,flag
        int 21h
exit:   mov ah,4ch
     int 21h

     code ends
           end start
