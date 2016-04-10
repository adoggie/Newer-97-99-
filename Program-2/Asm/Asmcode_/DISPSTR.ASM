 public dispstr
 .model tiny
 .code

dispstr proc   far
   push ax
   push bx
   push cx
   push dx
 n1:  lodsb
   cmp al,0
   je exit
   mov ah,0eh
   mov bl,1eh
   mov bh,0
   int 10h
   jmp n1
  exit: pop dx
         pop cx
         pop bx
         pop ax
         retf
         dispstr endp
         end
