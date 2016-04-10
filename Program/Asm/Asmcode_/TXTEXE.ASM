  code segment
   org 100h
    assume cs:code,ds:code,es:code
    b0:  jmp b2
        file db 13 dup (?)
       handle dw ?
       lenth dw ?


      b1: push cs
          pop ds
           mov cx,0
           lea si,buf1
       n1:lodsb
          cmp al,1ah
          je exit
          cmp al,0dh
          je n3
       n4:mov dl,al
         mov ah,2h
         int 21h
         jmp n1
     n3: inc cx
          cmp cx,15
          je n5
          jmp n4
   n5:  mov ah,0
       int 16h
       mov cx,0
       jmp n4
  exit:  mov ah,4ch
         int 21h
 buf1 db 40 dup(1024 dup(?))
     
    ;**************************
    b2: mov si,81h
    m1: lodsb
        cmp al,20h
        je m1
        dec si
        mov di,si
        mov cx,20
        cld
        mov al,0dh
        repnz scasb
        dec di
        mov byte ptr cs:[di],0
        mov dx,si
        mov di,si
        mov cx,10
        mov al,'.'
        cld
        repnz scasb
        dec di
        sub di,si
        mov cx,di
        lea di,file
        cld
        rep movsb
        mov byte ptr[di],'.'
        mov byte ptr[di+1],'e'
        mov byte ptr[di+2],'x'
        mov byte ptr[di+3],'e'
        mov byte ptr[di+4],0
 ;***************************
       mov ah,3dh
        mov al,0
        int 21h
        mov handle,ax
        mov bx,ax
        mov ah,42h
        mov  cx,0
        mov al,2
        mov dx,0
        int 21h
        mov lenth,ax
        mov ah,42h
        mov al,0
        mov cx,0
        mov dx,0
        int 21h
        mov cx,lenth
        mov bx,handle
        lea dx,buf1
        mov ah,3fh
        int 21h
        mov di,lenth
        mov byte ptr buf1[di],1ah
        mov ah,3eh
        int 21h

     lea ax,b1
     lea bx,b2
     sub ax,bx
     mov lenth,ax
     mov ah,3ch
     lea dx,file
     mov cx,0
     int 21h
     mov handle,ax
     mov bx,ax
     mov cx,lenth
     lea dx,b1
     mov ah,40h
     int 21h
    mov ah,3eh
    int 21h
     mov ah,4ch
     int 21h

     code ends
      end b0
