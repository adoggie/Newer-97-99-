  public toten
  .model tiny
  .code
  toten proc   far
  begin :  jmp start
        flag db 0
  start:
      push dx
      push si
      mov si,10000
      mov dx,0
      mov cx,5

   h:   div si
      cmp ax,0
      je n2
      jmp n3
    n2:  cmp flag,0

      je n1
    
  n3:   mov flag ,1


  add al,30h
      mov ah,0eh
      mov bh,0
      mov bl,1eh
      int 10h
    n1:  mov ax,dx
      mov dx,0
      push ax
      push dx
      mov ax,si
      mov bx,10
      div bx
      mov si,ax
      pop dx
      pop ax
      loop h
     pop si
     pop dx
     retf
    
    toten endp
    end begin
