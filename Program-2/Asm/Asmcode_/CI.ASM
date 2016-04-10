cr equ 0dh+77h
lf equ 0ah+77h
v  equ 77h
cseg segment
   assume cs:cseg,ds:cseg,es:cseg,ss:cseg
   org 100h


start:
      mov ah,30h
      int 21h
      call restore
      int 12h
      cmp  ax,280h
      jz   con1
      cmp  ax,27fh   
      jz   con1
      mov  byte ptr cs:count,1
con1: mov  bx,0040h
      mul  bx
      push ax
      mov  bx,ax
      push cs 
      pop  ax
      sub  bx,ax
      dec  ax
      mov  ds,ax
      mov  ax,word ptr ds:[0003]
      sub  bx,ax
      pop  ax
      push ax
      push bx
      pushf
      call work_out
      call print
      popf
      pop  bx
      pop  ax
      jnz   warning
loc_5:
      cmp  byte ptr cs:count,1
      jz   warning
      push cs
      pop  ds
      cld
      mov  bx,000bh
      mov  si,offset mesg1
loc_1:mov  cx,0001h
      lodsb
      cmp al,0
      jz  exit
      sub al,v
      mov ah,9h
      int 10h
      mov ah,03h
      int 10h
      inc dl
      mov ah,02h
      int 10h
      jmp loc_1
aaaa  db 3 dup(?)
count db 0
exit :mov dl,0ah
      mov ah,02h 
      int 21h
      mov dl,0dh
      int 21h
      mov ax,4c12h
      int 21h
warning:
      cmp  bx,0001h
      jz   loc_5
      push cs
      pop  ds
      cld
      mov  bx,0084h
      mov  si,offset mesg2
loc_2:mov  cx,0001h
      lodsb
      cmp al,0
      jz  exit
      sub al,v
      mov ah,9h
      int 10h
      mov ah,03h
      int 10h
      inc dl
      mov ah,02h
      int 10h
      jmp loc_2
print: 
       push cs
       pop  ds
       mov dx,offset mesg
       mov ax,0900h
       int 21h
       ret
restore: push cs
         push cs
         pop  ds
         pop  es
         mov  si,offset mesg
         mov  di,offset mesg
loc_8:   lodsb 
         cmp al,24h
         jnz loc_7
         ret 
loc_7:   sub al,v
         stosb
         jmp loc_8
work_out:
         sub ax,bx
         mov cl,6
         shr ax,cl
         mov si,0ah
         push cs
         pop  ds
         mov  bx,offset mesg
         mov  cx,0003h
loc_4:   xor  dx,dx
         div  si
         or   dl,30h
         mov  byte ptr ds:[bx+205],dl
         dec  bx
         loop loc_4
         ret
mesg    db lf,cr
        db ' '+v,' '+v,' '+v,'C'+v,'o'+v,'p'+v,'y'+v,'r'+v,'i'+v,'g'+v,'h'+v,'t'+v,' '+v,'('+v,'c'+v,')'+v,' '+v,'b'+v,'y'+v,' '+v,' '+v,'L'+v,'Z'+v,'F'+v,' '+v,' '+v
        db 'i'+v,'n'+v,' '+v,'1'+v,'9'+v,'9'+v,'5'+v,'/'+v,'8'+v,'.'+v,' '+v,' '+v,'V'+v,'e'+v,'r'+v,'s'+v,'i'+v,'o'+v,'n'+v,' '+v,'1'+v,'.'+v,'2'+v,'0'+v,'v'+v,lf,cr
        db ' '+v,' '+v,' '+v,' '+v,' '+v,' '+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v
        db '-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,' '+v,' '+v,' '+v,lf,cr
        db ' '+v,' '+v,' '+v,' '+v,' '+v,' '+v,' '+v,' '+v,'T'+v,'o'+v,'t'+v,'a'+v,'l'+v,' '+v,'m'+v,'e'+v,'m'+v,'o'+v,'r'+v,'y'+v,' '+v,'r'+v,'e'+v,'p'+v,'o'+v,'r'+v,'t'+v
        db 'e'+v,'d'+v,' '+v,'b'+v,'y'+v,' '+v,'D'+v,'O'+v,'S'+v,':'+v,' '+v,' '+v,' '+v,' '+v,' '+v,'6'+v,'4'+v,'0'+v,'K'+v,' '+v,' '+v,' '+v,' '+v,' '+v,lf,cr
        db ' '+v,' '+v,' '+v,' '+v,' '+v,' '+v,' '+v,' '+v,'N'+v,'o'+v,'w'+v,' '+v,'m'+v,'e'+v,'m'+v,'o'+v,'r'+v,'y'+v,' '+v,'r'+v,'e'+v,'p'+v,'o'+v,'r'+v,'t'+v,'e'+v
        db 'd'+v,' '+v,'b'+v,'y'+v,' '+v,'c'+v,'h'+v,'e'+v,'c'+v,'k'+v,':'+v,' '+v,' '+v,' '+v,' '+v,' '+v,'6'+v,'4'+v,'0'+v,'K'+v,' '+v,' '+v,' '+v,' '+v,' '+v,' '+v,lf,cr
        db ' '+v,' '+v,' '+v,' '+v,' '+v,' '+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v
        db '-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,'-'+v,' '+v,' '+v,' '+v,lf,cr
        db ' '+v,' '+v,' '+v,' '+v,' '+v,' '+v,' '+v,' '+v,'A'+v,'b'+v,'o'+v,'u'+v,'t'+v,' '+v,'y'+v,'o'+v,'u'+v,'r'+v,' '+v,'c'+v,'o'+v,'m'+v,'p'+v,'u'+v,'t'+v,'e'+v
        db 'r'+v,' '+v,'s'+v,'i'+v,'u'+v,'a'+v,'t'+v,'i'+v,'o'+v,'n'+v,':'+v,' '+v,' '+v,' '+v,24h  
mesg1   db 'N'+v,'o'+v,' '+v,'v'+v,'i'+v,'r'+v,'u'+v,'s'+v,0
mesg2   db ' '+v,'d'+v,'a'+v,'n'+v,'g'+v,'e'+v,'r'+v,' '+v,'!'+v,' '+v,0

cseg ends
   end start
