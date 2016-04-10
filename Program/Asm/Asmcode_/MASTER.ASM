
   ;get the area table!!!!!!!!!!!!!!!!!!!!!  
   date segment
     buf db 512 dup(0)
        file db 'sector.txt',0
        date ends
        code segment
          assume cs:code,ds:date,es:date
        b:
             push ds
              mov ax,0
              push ax
              mov ax,date
              mov ds,ax
              mov es,ax

        mov ax,201h

         mov bx,offset buf
        mov cx,1
        mov dx,80h
        int 13h
        mov si,offset buf+1beh
        lea  di,buf
        mov cx,4
n1:     push cx
        mov cl,4
        mov ch,10h
       
 n4:       mov bl,byte ptr [si]
             mov bh,2
 n3:       rol bl,cl
        mov al,bl
        and al,0fh
        add al,30h
        cmp al,3ah
        jl n2
        add al,7
 n2:    stosb
        dec bh
        jnz n3
        inc si
        mov byte ptr [di],'h'
        mov byte ptr [di+1],','
        mov byte ptr [di+2],20h
        add di,3
        dec ch
        jnz n4
        mov byte ptr [di],13
        mov byte ptr [di+1],10
        add di,2
        pop cx
        loop n1
     mov ah,3ch
     mov cx,0
     lea dx,file
     int 21h
     mov bx,ax
     lea dx,buf
     mov cx,326
     mov ah,40h
     int 21h
     mov ah,3eh
     int 21h
       mov ah,4ch
       int 21h
       code ends
         end b
