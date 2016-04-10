.model tiny
.code
 begin :
         jmp next
      buf db   512 dup (0)
         file db 't.com',0
         next:
            mov ax,cs
            mov es,ax
            mov ds,ax
            mov ax,201h
            lea bx,buf
            mov cx,1
            mov dx,80h
            int 13h
            lea dx,file
            mov cx,0
            mov ah,3ch
            int 21h
            mov bx,ax
            lea dx,buf
            mov cx,200h
            mov ah,40h
            int 21h



            mov ah,4ch
            int 21h
            end begin
