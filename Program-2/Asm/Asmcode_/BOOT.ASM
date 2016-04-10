
      code segment
       assume cs:code,ds:code,es:code
            
       begin:

                cli
                mov ax,0
                mov ds,ax
                mov es,ax
                mov ss,ax
                mov sp,7c00h
                sti
              mov di,0600h
              mov si,7c00h
              cld
              mov cx,512
              rep movsb
              db 0eah
              dw offset n0 +0600h,0000h
        n0:     mov si,600h+1beh
          ;      mov bl,4
          n1:      cmp byte ptr [si],80h
                je save
              ;  cmp byte ptr [si],0
             ;   lea di,mess1
             ;   jne error
              ;  add si,10h
              ;  dec bl
              ;  jne n1
               int 18h
         save:  mov dx,word ptr [si]
               mov cx,word ptr [si+2]
               mov bp,si

       ; n2:       add si,10h
       ;        dec bl
        ;       jz read
         ;      cmp byte ptr [si],0
         ;      je n2
          ;     lea di,area_error
        ;  error:    mov si,di
         ;    err1:   lodsb
          ;         cmp al,0
           ;        je death
            ;       push si
             ;      mov bx,07h
              ;     mov ah,0eh
              ;     int 10h
              ;     pop si
             ;      jmp err1
            ; death: jmp $

          read:  mov ah,06h
                 mov al,0
                 mov bh,7
                 mov ch,1
                 mov cl,1
                 mov dh,23
                 mov dl,78
                 int 10h
                 mov ah,06h
                 mov al,0
                 mov bh,1
                 mov ch,2
                 mov cl,2
                 mov dh,22
                 mov dl,77
                 int 10h
                mov di,bp
                lea bp,mess1
                mov cx,ll
                 mov dh,10

                 mov dl,20
                 mov bh,0
                 mov al,1
                 mov bl,0eh
                 int 10h
                 mov bp,di
            next1:  mov ah,0
                   int 16h
                   cmp ah,51h
                   je next2
                   jmp $
     next2:     mov ax,0201h
                mov bx,7c00h
                int 13h
                mov si,bp
                db 0eah
                dw 7c00h,00000h
                
       mess1 db 'PRESS PASS-KEY',13,10 ,'                         MADE BY Z.Bin',13,10
         ll equ $-mess1 
      tail:
             num equ 1beh-(tail-begin)
      g   db num dup (0)
 w   db 80h,01h,01h,00h,06h,3Fh,7Fh,7Ch,3Fh,00h,00h,00h,81h,70h,17h,00h
 e   db  00h,00h,41h,7Dh,05h,3Fh,0BFh,0F9h,0C0h,70h,17h,00h,0C0h,70h,17h,00h
 r    db  00h,00h,81h,0FAh,06h,3Fh,0FFh,29h,80h,0E1h,2Eh,00h,00h,0F4h,02h,00h
t    db  00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
   dw 0aa55h
    code ends
       end begin
    
            

