 date segment
  freq dw 2 dup (262,294,330,262)
  dw 2 dup (330,350,392)
   dw 2 dup (392,440,392,349,330,262)
   dw 2 dup(330,294,262),0ffffh
  time dw 8 dup(500)
      dw 2 dup (500,500,1000)
      dw 2 dup(250,250,250,250,500,500)
      dw 2 dup (500,500,1000)
      date ends
   code segment
    assume cs:code,ds:date
    begin:  push ds
            mov ax,0
            push ax
            mov ax,date
            mov ds,ax
            ;**************************
        lea si,freq
        lea bp,time
      n0: mov ah,0bh
          int 21h
       cmp al,0ffh
       je exit
      mov di,[si]
      cmp di,0ffffh
         je n8

         mov bx,ds:[bp]
        call s_sound
        add si,2
        add bp,2
        jmp n0
 n8: lea si,freq
    lea bp,time
    jmp n0
  exit:mov ah,4ch
        int 21h
        s_sound proc near
           push  bp
           push si

        mov al,0b6h
        out 43h,al
        mov dx,12h
        mov ax,533h*896
        div di
        out 42h,al
        mov al,ah
        out 42h,al
       in al,61h
       mov ah,al
       or al,3
       out 61h,al
        
    n1:  mov cx,2801h
       n2: loop n2
    
       dec bx
       jnz n1
       mov al,ah
       out 61h,al
       pop si
       pop bp
        ret
       s_sound endp
        code ends
         end begin





