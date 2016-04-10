v equ 64h

cseg segment
  assume cs:cseg,ds:cseg,es:cseg,ss:cseg
  org 100h
start: jmp install
tsr:push ax
    push bx
    mov ah,0bh
f1 equ $+1
    mov bx,0001h
    int 10h
    pop bx
    pop ax
f2 equ $+1
    jmp far ptr $-10eh

already_install:pop ds
                pop ax
                cli
                push ax
                push ds
                push es
                push si
                push di
                mov ax,0
                mov ds,ax
                and  byte ptr ds:[0222h],11111101b
                mov es,ax
                mov si,04FCh
                mov di,00A0h
                lodsw 
                stosw
                lodsw
                stosw
               ; mov cx,8h
               ; mov ax,0000
               ; mov di,04f0h
               ; rep stosw
                pop di
                pop si
                pop es
                pop ds
                pop ax
                push si
                push di
                mov  si,offset mesg2
                mov  di,offset mesg2
                call restore
                pop  di
                pop  si
                mov  dx,offset mesg2
                call print
                push ax
                push bx
                mov ax,0b00h
                mov bx,0000h
                int 10h
                pop bx
                pop ax
                mov ax,4cffh
                int 21h

install: 
         push ax
         push ds
         xor ax,ax
         mov ds,ax
         test byte ptr ds:[0222h],10b
         jnz already_install
         or   byte ptr ds:[0222h],10b
         pop ds
         pop ax
         mov al,byte ptr ds:[80h]
         cmp al,0
         jz  scanexit
         add al,80h
         xor ah,ah
         mov bx,ax
         mov al,byte ptr ds:[bx]
         cmp al,39h
         jbe con2
         sub al,27h
con2:    sub al,30h
         mov byte ptr cs:[f1],al
scanexit:cli
         mov ax,3528h
         int 21h
         mov word ptr cs:[f2],bx
         mov word ptr cs:[f2+2],es
         mov ax,0
         mov es,ax
         mov di,04f0h
         push cs
         pop  ds
         mov si,offset tsr
         mov cx,10h
         rep movsb
         mov ax,0
         mov ds,ax
         mov dx,4f0h
         mov ax,2528h
         int 21h
         push si
         push di
         mov  si,offset mesg1
         mov  di,offset mesg1
         call restore 
         pop  di  
         pop  si
         mov  dx,offset mesg1
         call print
         mov ax,4c00h
         int 21h

restore: push cs
         push cs
         pop  ds
         pop  es
loc_8:   lodsb 
         cmp al,24h
         jnz loc_7
         ret 
loc_7:   sub al,v
         stosb
         jmp loc_8
print:   push cs
         pop  ds
         push  ax
         mov ax,0900h
         int 21h
         pop   ax
         ret


mesg1    db ' '+v,' '+v,' '+v,' '+v,'C'+v,'o'+v,'p'+v,'y'+v,'r'+v,'i'+v,'g'+v,'h'+v,'t'+v,' '+v,'b'+v,'y'+v,' '+v,' '+v,'L'+v
         db 'Z'+v,'F'+v,' '+v,' '+v,'i'+v,'n'+v,' '+v,'1'+v,'9'+v,'9'+v,'5'+v,'/'+v,'8'+v,' '+v,'.'+v,' '+v,' '+v,' '+v,' '+v
         db 'S'+v,'h'+v,'a'+v,'r'+v,'e'+v,'w'+v,'a'+v,'r'+v,'e'+v,' '+v,'U'+v,'n'+v,'t'+v,'i'+v,'t'+v,'l'+v,'y'+v,0ah+v,0dh+v
         db ' '+v,' '+v,'V'+v,'e'+v,'r'+v,'s'+v,'i'+v,'o'+v,'n'+v,':'+v,' '+v,'1'+v,'.'+v,'0'+v,'0'+v,'v'+v,' '+v,' '+v,'T'+v
         db 'e'+v,'l'+v,':'+v,' '+v,'8'+v,'8'+v,'3'+v,'3'+v,'0'+v,'6'+v,'5'+v,'.'+v,' '+v,' '+v,'T'+v,'h'+v,'a'+v,'n'+v,'k'+v
         db ' '+v,'y'+v,'o'+v,'u'+v,' '+v,'f'+v,'o'+v,'r'+v,' '+v,'y'+v,'o'+v,'u'+v,'r'+v,' '+v,'u'+v,'s'+v,'e'+v,'.'+v,'.'+v
         db '.'+v,0dh+v,0ah+v,24h     
mesg2    db ' '+v,'O'+v,'k'+v,' '+v,'!'+v,' '+v,' '+v,'a'+v,'l'+v,'r'+v,'e'+v,'a'+v,'d'+v,'y'+v,' '+v,'k'+v,'i'+v,'l'+v,'l'+v
         db 'e'+v,'d'+v,' '+v,'b'+v,'y'+v,' '+v,'m'+v,'y'+v,'s'+v,'e'+v,'l'+v,'f'+v,0dh+v,0ah+v,24h           

cseg ends
  end start


