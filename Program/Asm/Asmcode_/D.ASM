.model tiny
.code

         begin:
         mov ax,cs
         mov ds,ax
         mov es,ax

         jmp next
         next:
          mov ax,0
          mov es,ax
          mov ax,word ptr es:[13h*4]
          mov word ptr cs:[f],ax
           mov ax,word ptr es:[13h*4+2]
           mov word ptr cs:[f+2],ax
           mov ax,cs
           mov word ptr es:[13h*4+2],ax
           lea dx,set
           mov word ptr es:[13h*4],dx
           int 13h
         set:
            mov ax,1111h
            jmp dword ptr cs:[f]
         f dw 0,0

            ;jmp cs:[f]
            mov ah ,4ch
            int 21h
            end begin
