 v equ 87

cseg segment
  assume cs:cseg,ds:cseg,es:cseg,ds:cseg
  org 100h
start: jmp run

b1     db 00
b2     db '*',0
b3     db '\',0,7 dup(0)
b4     db '..',0
b5     db 8 dup(0)
b6     db 0
b7     db 0

count  db 0
len    dw ?

t1     db 0
t2     db 0
c1     db 0

new_point   dw ?
old_point   dw ?

file_name2  db 'C:\'
f3          equ $
            db 'C_DISK.TRE',0

mesg1       db 'C'+v,'o'+v,'p'+v,'y'+v,'r'+v,'i'+v,'g'+v,'h'+v,'t'+v,' '+v,'('+v,'c'+v,')'+v,' '+v,'b'+v,'y'+v,' '+v,' '+v,'L'+v,'i'+v,' '+v
            db 'Z'+v,'a'+v,'n'+v,' '+v,'F'+v,'e'+v,'n'+v,'g'+v,' '+v,' '+v,'i'+v,'n'+v,' '+v,'1'+v,'9'+v,'9'+v,'5'+v,'/'+v,'8'+v,'.'+v,' '+v
            db ' '+v,'V'+v,'e'+v,'r'+v,'s'+v,'i'+v,'o'+v,'n'+v,':'+v,' '+v,'1'+v,'.'+v,'1'+v,'0'+v,0dh+v,0ah+v,24h    

mesg2       db 0ah,0dh,'  Change the directory to '
dddddd      db 'C',':','\'
bbbbbb      db 70 dup(?)
path_count  db 0
aaaaa       db 0
buffer      db 372 dup (0)
buffer1     db 8 dup(0)
no_use      db 5 dup(0)

mesg3       db 0ah,0dh,'   Usage:  FD  <directory name>  [/R] ',0ah,0dh                         
            db 0ah,0dh,'   /R : Reread the current disk directory if needed',0ah,0dh,24h

mesg4       db 0ah,0dh,'  Directory what you wanted was NOT found !!!',0ah,0dh,24h

                                                              

run:  mov ah,30h             ;no use     
      int 21h                ;no use
      xor  ax,ax             ;no use
      call restore 
      mov  dx,offset mesg1
      call print
      call get_zero3
      push ax
      push bx
      push cx
      push dx
      push si
      push di
      mov al,byte ptr ds:[80h]
      cmp al,0
      jnz con17 
con18:jmp error
con17:mov si,81h
      mov di,offset b5
con13:lodsb
      cmp al,20h
      jz  con13
      cmp al,0dh
      jz  con18
      cmp al,'/'
      jz  con18
      cmp al,'.'
      jz  con36
con14:cmp byte ptr cs:count,8
      jz  con40
      stosb
      inc byte ptr cs:count
con40:lodsb
      cmp al,0dh
      jz  con20
      cmp al,'/'
      jz  con15
      cmp al,20h
      jnz con14
con16:lodsb
      cmp al,0dh
      jz  con20
      cmp al,'/'
      jz  con15
      cmp al,20h
      jz  con16
      jmp error
con15:lodsb
      cmp al,'r'
      jz  con19
      cmp al,'R'
      jz  con19
      jmp error
con20:jmp open_file

con36:call return      
      mov ax,4c03h
      int 21h
get_zero3:
      push ax
      push cx
      push di
      mov  di,offset table
      mov  cx,2000h
      mov  ax,0000
      cld  
      rep  stosw
      pop  di
      pop  cx
      pop  ax
      ret

      
con19:
         pop di
         pop si
         pop dx
         pop cx           
         pop bx
         pop ax
         call get_cur_disk
         call tree
         jmp  scan_tree
         
open_file: 
         pop di
         pop si
         pop dx
         pop cx
         pop bx
         pop ax
         call get_cur_disk
      mov dl,byte ptr cs:dddddd
      mov byte ptr ds:[f3],dl
      push ax 
      push bx
      push cx
      push dx
      mov  dx,offset file_name2
      mov  ax,3d00h
      int  21h
      jc   con22
      mov  bx,ax
      mov  ax,3f00h
      mov  dx,offset table
      mov  cx,0ffffh
      int  21h
      mov  word ptr cs:len,ax
      mov  ax,3e00h
      int  21h
      pop  dx
      pop  cx
      pop  bx
      pop  ax
      jmp  scan_tree  
      
con22:push si
      push di
      jmp con19
      
      
get_cur_disk:
         push ax 
         mov  ax,1900h
         int  21h
         add  al,41h
         mov  byte ptr cs:dddddd,al
         pop  ax
         ret

SCAN_TREE:
         push ax
         push cx
         mov  ax,offset table
         mov  cx,word ptr cs:len
         add  ax,cx
         mov  word ptr cs:old_point,ax
         pop  cx
         pop  ax
         call get_zero1
         call get_path
         call get_point
         call change_big

con33:   mov  di,word ptr cs:new_point
         inc  di
         mov  si,offset b5
         mov  cl,byte ptr cs:count
         xor  ch,ch
         cld
         rep  cmpsb
         jnz  con34
         call oooo
         jmp  ok
oooo:    
         push bx
         push ax
         mov  bx,word ptr cs:new_point
         mov  al,byte ptr ds:[bx]
         xor  ah,ah
         mov  bx,9
         mul  bx
         dec  ax
         mov  byte ptr cs:path_count,al
         pop  ax
         pop  bx
         ret

con34:   add  word ptr cs:new_point,9
         mov  cx,word ptr cs:new_point
         cmp  cx,word ptr cs:old_point
         ja   not_fount
         jmp  con33
not_fount:
         cmp  byte ptr cs:c1,1
         jnz  con91
         mov  dx,offset mesg4
         call print
         mov  ax,4cffh
         int  21h
con91:   mov  byte ptr cs:c1,1
         mov  ax,offset table
         mov  word ptr cs:new_point,ax
         jmp  con33

ok:
         mov   bx,word ptr cs:new_point
         mov   al,byte ptr ds:[bx]
         xor   ah,ah
         push  ax
         inc   bx
         mov   si,bx
         mov   cx,offset buffer
         mov   dx,9
         mul   dx
         sub   ax,9
         add   ax,cx
         mov   di,ax
         dec   di
         mov   al,'\'
         stosb
         mov   cx,8
         cld  
         rep   movsb
         pop   ax   
         cmp   al,01
         jz    con37
         mov   bx,word ptr cs:new_point
         dec   al
con38:   sub   bx,9
         cmp   al,byte ptr ds:[bx]
         jnz   con38
         mov   word ptr cs:new_point,bx
         jmp   ok
con37:   
         call  do_path
         mov   dx,offset dddddd
         mov   ax,3b00h
         int   21h
         jnc   con51 
         jmp   not_fount
con51:   mov   ax,offset bbbbbb
         mov   bl,byte ptr cs:b6
         xor   bh,bh
         add   bx,ax
         mov   byte ptr ds:[bx],0ah
         mov   byte ptr ds:[bx+1],0dh
         mov   byte ptr ds:[bx+2],24h
         mov   dx,offset mesg2
         call  print
         mov   ax,4c00h
         int   21h
         
do_path:  mov di,offset bbbbbb 
          mov si,offset buffer
          mov cl,byte ptr cs:path_count
          xor ch,ch
con46:    lodsb
          cmp al,0
          jz  con45
          stosb
          inc byte ptr cs:b6
con45:    loop con46
          ret
           
         
change_big:
         push cs
         push cs
         pop  ds
         pop  es
         mov  si,offset b5
         mov  di,si
         mov  cx,9
con41:   dec  cx
         cmp  cx,0
         jz   con43
         lodsb
         cmp  al,61h
         jb   con61
         cmp  al,7ah
         jbe con42
         stosb
         jmp con41 
con42:   sub  al,20h
         stosb
         jmp con41
con43:   ret
con61:   stosb
         jmp con41
         
error:   
         pop di
         pop si
         pop dx
         pop cx  
         pop bx
         pop ax
         mov dx,offset mesg3
         call print
         mov ax,4c01h
         int 21h
restore: push cs
         push cs
         pop  ds
         pop  es
         mov  si,offset mesg1
         mov  di,offset mesg1
loc_8:   lodsb 
         cmp al,24h
         jnz loc_7
         ret 
loc_7:   sub al,v
         stosb
         jmp loc_8
print:   push cs      
         pop  ds
         mov  ax,0900h
         int  21h
         ret

get_zero1: 
         mov di,offset buffer
         mov ax,0000
         mov cx,380
         cld
         rep stosb
         ret
get_path: 
         mov si,offset buffer
         mov ax,4700h
         mov dx,0000
         int 21h
         lodsb
         cmp al,0
         jnz con70
         mov byte ptr cs:t1,0
con72:   ret
con70:   cmp al,'\'
         jnz con71
         inc byte ptr cs:t1
con71:   lodsb
         cmp al,0
         jz  con90
         cmp al,'\'
         jnz con71
         inc byte ptr cs:t1
         jmp con71
con90:   inc byte ptr cs:t1
         jmp con72

get_point:
         mov ax,offset table
         mov word ptr cs:new_point,ax
         cmp byte ptr cs:t1,0
         jz  con73
con82:   call load_path
         inc byte ptr cs:t2
         call scan_path
         mov al,byte ptr cs:t2
         cmp al,byte ptr cs:t1
         jz  con93
         call get_zero2
         jmp con82
con93:   
         add  word ptr cs:new_point,9
           
con73:   ret

get_zero2:
         mov di,offset buffer1 
         mov cx,8
         mov ax,0000
         cld
         rep stosb
         ret
load_path:
         mov di,offset buffer1
con75:   mov si,offset buffer
         lodsb
         cmp al,'\'
         jz  con74
         cmp al,0
         jz  con74
         stosb 
         call toward_one
         jmp con75
con74:   call toward_one
         ret
toward_one:
         push di
         mov  si,offset buffer
         mov  di,si
         inc  si
con81:   lodsb
         cmp al,0
         jz con80
         stosb
         jmp con81
con80:   stosb
         pop  di
         ret
scan_path:
         mov ax,word ptr cs:new_point
         mov si,ax
con77:   lodsb
         cmp al,byte ptr cs:t2
         jz  con76
         add word ptr cs:new_point,9
         mov si,word ptr cs:new_point
         cmp si,word ptr cs:old_point
         jb  con77
         mov ax,offset table
         mov word ptr cs:new_point,ax
         mov al,byte ptr cs:t1
         mov byte ptr cs:t2,al
con78:   ret
con76:   dec si
         mov word ptr cs:new_point,si
         inc si
         mov di,offset buffer1
         mov cx,8
         cld
         rep cmpsb
         jz  con78
         mov si,word ptr cs:new_point
         add si,9
         jmp con77

TREE:        
      
      push ax
      mov  ax,offset table
      mov  word ptr cs:new_point,ax
      mov  word ptr cs:old_point,ax
      pop  ax
      call enter
      call first
      jnc  con1 
      jmp  close_file
con1: 
      call save_fcbs
      call put_b3
      call put_table
      call enter
      call first
      jc  con4
      jmp con1

con4: call return
      call load_fcbs
      call second
      jc close_file 
      jmp con1
      
close_file: 
      cmp byte ptr cs:b1,01h
      jnz con4
      mov dl,byte ptr cs:dddddd
      mov byte ptr ds:[f3],dl
      mov dx,offset file_name2
      mov ax,3c00h
      mov cx,0002h
      int 21h
      mov bx,ax
      mov ax,4000h
      mov dx,word ptr cs:old_point
      mov cx,word ptr cs:new_point
      sub cx,dx
      mov word ptr cs:len,cx
      int 21h
      mov ax,3e00h
      int 21h
      ret

save_fcbs: 
      push ax
      push bx
      push cx
      push dx
      push si
      push di
      push ds
      push es
      mov  ax,0038
      mov  cl,byte ptr cs:b1
      xor  ch,ch
      mul  cx
      sub  ax,38
      mov  bx,offset buffer
      add  ax,bx
      mov  di,ax
      mov  si,0080h
      push cs
      push cs
      pop  ds
      pop  es
      mov  cx,38
      cld
      rep  movsb
      pop  es
      pop  ds
      pop  di
      pop  si
      pop  dx
      pop  cx
      pop  bx
      pop  ax
      ret
load_fcbs:
      push ax
      push bx
      push cx
      push dx
      push si
      push di
      push ds
      push es
      mov  ax,0038
      mov  cl,byte ptr cs:b1
      xor  ch,ch
      mul  cx
      sub  ax,38
      mov  bx,offset buffer
      add  ax,bx
      mov  si,ax
      mov  di,0080h
      push cs
      push cs
      pop  ds
      pop  es
      mov  cx,38
      cld
      rep  movsb
      pop  es
      pop  ds
      pop  di
      pop  si
      pop  dx
      pop  cx
      pop  bx
      pop  ax
      ret
      

put_b3:
      push ax
      push cx
      push si
      push di
      push ds
      push es
      push cs
      push cs
      pop  ds
      pop  es
      mov  si,009eh
      mov  di,offset b3
      mov  cx,0009
con2: lodsb  
      stosb
      dec  cx
      cmp al,0
      jnz   con2
      jcxz  con3
con26:stosb
      dec  cx
      cmp  cx,0
      jnz  con26 
con3: pop  es
      pop  ds
      pop  di
      pop  si
      pop  cx
      pop  ax
      ret 

put_table:
      push ax
      push cx
      push si
      push di
      mov  si,offset b3
      mov  di,word ptr cs:new_point
      mov  al,byte ptr cs:b1
      stosb 
      mov cx,8 
      cld
      rep movsb
      mov  word ptr cs:new_point,di
      pop  di
      pop  si
      pop  cx
      pop  ax
      ret
enter: 
      push ax
      push dx
      mov  ax,3b00h       ;change the directory
      push cs
      pop  ds
      mov  dx,offset b3
      int  21h
      inc  byte ptr cs:b1
      pop  dx
      pop  ax
      ret
return:
      push ax
      push dx
      mov  ax,3b00h
      push cs
      pop  ds
      mov  dx,offset b4
      int  21h
      dec  byte ptr cs:b1
      pop  dx
      pop  ax
      ret
first:      
      push ax
      push cx
      push dx
      mov  ax,4e00h
      mov  cx,0016h
      mov  dx,offset b2
      int  21h
con6: jc   con5
      and  byte ptr ds:[0095h],10h
      jnz  con7  
con8: mov  ax,4f00h
      int  21h
      jmp  con6
con7: cmp  byte ptr ds:[009eh],'.'
      jz   con8
con5: pop  dx
      pop  cx
      pop  ax
      ret
second:
      push ax
      push cx
      push dx
con9: mov  ax,4f00h
      mov  dx,0080h
      int  21h
      jc   con10
      and  byte ptr ds:[0095h],10h
      jz   con9
      cmp  byte ptr ds:[009eh],'.'
      jz   con9
con10:pop  dx
      pop  cx
      pop  ax
      ret
       


table  db 3 dup(0)  


cseg ends
    end start


