include zb
 extrn dispstr:far
extrn curset:far
extrn strlen:far
extrn toten :far
.model tiny
date segment
 s db 'aaaaaaaaaaaaaaaaaaaaaaaaaa',0
 date ends
 code segment
 assume cs:code,ds:code
 begin: mov ax,date
         mov ds,ax
         lea si,s
         call  strlen
         
         call toten
         mov dh,10
         mov dl,45
         call curset
         lea si,s

        call dispstr
         mov ah,0
         int 16h
         cls
         mov dh,23
         mov dl,1
         call curset
         mov ah,4ch
         int 21h
         code ends
         end begin

