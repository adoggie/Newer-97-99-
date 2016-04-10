;细胞问题解决方案
date segment
       sum dw 0
       s7 dw ?
       s6 dw ?
       s5 dw ?
       s3 dw ?
       s4 dw ?
       buf1 db  103 dup (20h)
       buf2 db 100 dup (310 dup(20h))
       buf3 db 100 dup (20h)
       s1 dw ?
       s2 dw ?
       flag1 db 100
       flag2 db 10
       file db 'input.txt',0
       handle dw ?
       leth dw ?
       date ends
 code segment
   assume cs:code,ds:date,es:date
  main proc far
 ;  *******************
    push ds
     mov ax,0
      push ax
      mov ax,date
      mov ds,ax
      mov es,ax
;*************************
       mov ah,3dh      
        lea dx,file
        mov al,0
        int 21h
     mov handle,ax
     mov bx,ax
     mov ah,42h
     mov al,2
     mov cx,0
     mov dx,0
    int 21h

     mov leth,ax
     mov ah,42h
    mov al,0
    mov cx,0                                      
    mov dx,0
    int 21h

     mov ah,3fh       
     mov cx,leth
     mov bx,handle
     lea dx,buf2
     int 21h

       lea di,buf2
   a2: cmp byte ptr [di],30h
       jg a1               
       inc di
       jmp a2
   a1:  mov s1,di         
   a3: inc di
       cmp byte ptr [di],20h
       jne  a3
        mov cx,di
        sub cx,s1
        call sec
        mov dx,s4
       mov s3,dx

        add di,2
        mov s1,di
   a8:  inc di
        cmp byte ptr [di],30h
        jge a8
        mov cx,di
        sub cx,s1
        call sec

         mov ah,3eh
         mov bx,handle
         int 21h
         ;************
       mov ax,s3
       mov bx,s4
       mul bx
       mov s5,ax
       mov si,0
       mov cx,s3
   n2: push cx
       mov cx,s4
   n1: cmp byte ptr [di],30h
       jge n0
       inc di
       jmp n1
  n0:  mov bl,byte ptr [di]
       mov buf2[si],bl
       inc si
       inc di
       loop n1
       mov buf2[si],0
       mov buf2[si+1],0
       add si,2
       pop cx
       loop n2
       mov cx,s4
       inc cx
 n3:    mov buf2[si],0
        inc si
        loop n3
        mov cx,s5
       lea di,buf2
  n4:  mov s7,di
       cmp byte ptr [di],30h
       jb c0
       jmp c1
  c0:  inc di
       jmp n4
  c1:  cmp byte ptr [di],30h
       ja n5
  n8:  mov di,s7
       inc di
       loop n4
       jmp next
   n5: mov bx,s4
       add bx,2
       mov si,0ffffh
       push si
   n6:  mov byte ptr [di],30h
        mov s6,di
        sub di,bx
        push di
        mov di,s6
        dec di
        push di
        mov di,s6
        add di,bx
        push di
        mov di,s6
        inc di
        push di
   n7:
       pop di
       cmp di,0ffffh
       je n9
       cmp byte ptr [di],30h
       jg n6
       jmp n7
   n9: mov si,1
       add sum,si
       jmp n8

  next: mov bx,sum
       call disp
       mov ah,4ch
       int 21h
    main endp

    sec proc near
        cmp cx,3
        je a4
        cmp cx,2
        je  a5
        mov al,byte ptr [di-1]
        sub al,30h
        mov ah,0
        mov bx,ax
   a6:  mov s4,bx
        jmp a7
   a4: mov bx,100
       jmp a6
  a5: mov al,byte ptr [di-2]
      sub al,30h
      mov dl,10
      mul dl
      mov bx,ax
      mov al,byte ptr [di-1]
      sub al,30h
      mov ah,0
      add bx,ax
      jmp a6
 a7:  ret
     sec endp

    disp proc near
         mov cx,10000
         call clu
         mov cx,1000
         call clu
         mov cx,100
         call clu
         mov cx,10
         call clu
         mov cx,1
         call clu
          ret
         disp endp
  clu proc near
      mov ax,bx
      mov dx,0
      div cx
      mov bx,dx
      mov dl,al
      add dl,30h
      cmp dl,30h
      je f1
      jmp f2
  f1: ret
  f2: mov ah,02h
      int 21h
      ret
      clu endp
             code ends
                end main


