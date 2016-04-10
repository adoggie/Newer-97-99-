
         pop  ax
         ret



dos_int: 
         pushf
         call dword ptr cs:int21off
         ret


install:   
         mov ax,3000h
         int 21h
         push ax
         push bx
         push cx
         push dx
         push ds
         xor ax,ax
         mov ds,ax
         test byte ptr ds:[0222h],100b
         jnz already_install
         or   byte ptr ds:[0222h],100b
         pop ds
         pop dx
         pop cx
         pop bx
         pop ax
         call restore
         call print
         mov ax,5100h
         int 21h
         mov word ptr cs:psp_address,bx
         mov ax,3521h
         int 21h
         mov word ptr cs:int21off,bx
         mov word ptr cs:int21seg,es
         push cs
         pop  ds
         mov  dx,offset tsr21
         mov  ax,2521h
         int  21h
         mov  dx,offset install
         inc  dx
         int  27h
already_install:
         and  byte ptr ds:[0222h],11111011b
         mov  bx,word ptr ds:[0086h]
         mov  es,bx  
         mov  dx,word ptr es:int21seg
         mov  ds,dx
         mov  dx,word ptr es:int21off
         mov  ax,2521h
         int  21h
         mov  es,word ptr es:psp_address
         mov  ax,4900h
         int  21h
         pop  ds
         pop  dx
         pop  cx
         pop  bx
         pop  ax
         mov  ax,0900h
         mov  dx,offset mesg2
         push cs
         pop  ds
         int  21h
         mov  ax,4cffh
         int  21h

restore: 
         push ax
         push si
         push di
         push cs
         push cs
         pop  ds
         pop  es
         mov  si,offset mesg1
         mov  di,si
con11:    lodsb
         cmp  al,24h
         jz  con7 
         sub  al,v
         stosb
         jmp con11
con7:    mov  si,offset file_name 
         mov  di,si
con9:    lodsb
         cmp  al,0
         jz  con8
         sub  al,v
         stosb
         jmp con9
con8:    pop  di
         pop  si
         pop  ax
         ret
print:   
         push ax
         push dx
         push cs
         pop  ds
         mov  ax,0900h
         mov  dx,offset mesg1
         int  21h
         pop  dx
         pop  ax
         ret


mesg1    db 'C'+v,'o'+v,'p'+v,'y'+v,'r'+v,'i'+v,'g'+v,'h'+v,'t'+v,' '+v,'('+v,'c'+v,')'+v,' '+v,'b'+v,'y'+v,' '+v,' '+v,'L'+v,'Z'+v,'F'+v
         db ' '+v,' '+v,'i'+v,'n'+v,' '+v,'1'+v,'9'+v,'9'+v,'5'+v,'/'+v,'9'+v,' '+v,'.'+v,' '+v,'V'+v,'e'+v,'r'+v,'s'+v,'i'+v,'o'+v,'n'+v
         db ':'+v,' '+v,'1'+v,'.'+v,'0'+v,'0'+v,0ah+v,0dh+v,0ah+v,0dh+v
         db 'A'+v,'l'+v,'l'+v,' '+v,'t'+v,'h'+v,'e'+v,' '+v,'f'+v,'i'+v,'l'+v,'e'+v,'n'+v,'a'+v,'m'+v,'e'+v,' '+v,'w'+v,'i'+v,'l'+v,'l'+v
         db ' '+v,'s'+v,'a'+v,'v'+v,'e'+v,' '+v,'i'+v,'n'+v,' '+v,' '+v,'"'+v,' '+v,'L'+v,'Z'+v,'F'+v,'_'+v,'L'+v,'Z'+v,'F'+v,'.'+v,'L'+v
         db 'Z'+v,'F'+v,' '+v,'"'+v,0ah+v,0dh+v 
         db 'Y'+v,'o'+v,'u'+v,' '+v,'c'+v,'a'+v,'n'+v,' '+v,'"'+v,' '+v,'T'+v,'Y'+v,'P'+v,'E'+v,' '+v,'"'+v,' '+v,'t'+v,'h'+v,'i'+v,'s'+v
         db ' '+v,'f'+v,'i'+v,'l'+v,'e'+v,' '+v,'f'+v,'o'+v,'r'+v,' '+v,'n'+v,'e'+v,'e'+v,'d'+v,'e'+v,'d'+v,0ah+v,0dh+v,24h 
mesg2    db 'Thank you for your use .',0ah,0dh
         db 'Already remove from memory.',0ah,0dh,0ah,0dh
         db 'Good lucky ...',0ah,0dh,24h


cseg  ends
   end start

         
