
     code segment
     assume cs:code,ds:code,es:code
     first:
                mov ax,code
                mov ds,ax
                mov es,ax
                jmp second
         
    v1:          cli
                 mov ax,0
                 mov ss,ax
                 mov ds,ax
                 mov es,ax
                 mov sp,7c00h
                 sti
                 mov si,7c00h
                 mov di,600h
                 mov cx,512
                 cld
                 rep movsb
                 db 0eah
                 dw v2-v1+600h,0000h
        
    v2:
        
                 mov si,600h+1beh
                 mov dx,[si]
                 mov cx,[si+2]
                 mov bx,7c00h
                 mov ax,0201h
                 int 13h
                 ;**********
                mov ah,6
                mov al,0
                mov bh,7eh
                mov ch,10
                mov cl,16
                mov dh,17
                mov dl,50
                int 10h
        
                mov ah,6
                mov al,0
                mov ch,11
                mov cl,18
                mov bh,1eh
                mov dh,16
                mov dl,48
                int 10h
        
                mov ah,2
                mov bh,0
                mov dh,12
                mov dl,19
                int 10h
        
                mov si,600h+(m1-v1)
  n0:           lodsb
                cmp al,0
                je n1
                mov ah,0eh
                mov bh,13
                int 10h
                jmp n0

	n1:             
                mov ah,2
                mov bh,0
                mov dh,15
                mov dl,24
                int 10h

                mov si,600h+(m2-v1)
   	n2:     lodsb
                cmp al,0
                je n3
                mov ah,0eh
                mov bh,14
                int 10h
                jmp n2

  	n3:     mov ah,1
                or ch,10h
                int 10h

       ; following getchar
 	
	nv4:    mov di,600h+(bf-v1)
                mov si,di
  	nv1:    mov ah,0
                int 16h
                cmp al,0dh
                je nv2
                stosb
                jmp nv1
   	nv2:    sub di,si
                cmp di,3
                je nv3
                jmp nv4
   	nv3:
                mov   di,600h+(key-v1)
                mov si,600h+(bf-v1)
                cld
                mov cx,3
                repe cmpsb
                je boot
                jmp nv4

 	boot:
                db 0eah
                dw 7c00h,0

             m1 db 'PREE THE PASSWORD!',0
             m2 db 'PASSWORD:',0
             bf db 20 dup(?)
            key db '123'

      v3:
          fill equ 1beh-(v3-v1)
                db fill dup (0)
     hdd_area   db 40h dup (0)
                dw 0aa55h
  second:
               mov ax,0201h
               mov cx,1
               mov bx,offset buf
               mov dx,80h
               int 13h
               mov si,offset buf+1beh
               mov di,offset hdd_area
               mov cx,40h
               cld
               rep movsb

               mov ax,301h
               mov bx,offset v1
               mov cx,1
               mov dx,80h
               int 13h
               mov ah,4ch
               int 21h
             buf db 512 dup(?)
             code ends
              end first


