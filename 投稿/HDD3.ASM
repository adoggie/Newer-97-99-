   ;        ；98'     张斌
     code segment
     assume cs:code,ds:code,es:code
    
 first:
               mov ax,ds
                   mov old_ds,ax
               mov ch,0
               mov cl,byte ptr es:[80h]
              cmp cx,0
              jne xxx
               jmp begin
              xxx:  mov si,81h
               
         loop1:    lodsb
                    cmp al,'#'
                    je m1
                     loop loop1
                    jmp begin
                  m1:
                     lodsb
                  cmp al,'u'
                    jne t1

                 t2:
                     mov ax,cs
                     mov es,ax
                     mov ax,201h
                     mov bx,offset buf
                     mov cx,13h
                     mov dx,80h
                     int 13h
                      cmp byte ptr es:[buf+1fdh],'B'
                      je t3
                  
                      mov ax,cs
                      mov ds,ax
                      lea dx,msg3
                      mov ah,9
                      int 21h
                      jmp exit

                   t3:
                     mov byte ptr es:[buf+1fdh],0
                     mov ax,cs
                     mov es,ax
                   mov ax,301h
                      mov bx,offset buf
                      mov cx,01h
                      mov dx,80h
                      int 13h
                       mov ax,301h
                       mov bx,offset buf
                       mov dx,80h

                      mov cx,13h
                      int 13h

                      mov ax,cs
                      mov ds,ax
                      lea dx,msg4
                      mov ah,9
                      int 21h
                      jmp exit
                      

                 t1:  cmp al,'U'
                     je t2
               ;**********************
                 push ax
                   mov ax,cs
                   mov es,ax
                   mov bx,offset buf
                   mov ax,201h
                   mov cx,21h
                   mov dx,80h
                   int 13h
                    pop ax
                   mov di, offset buf+226
                   
                   mov word ptr cs:[buf+224],0
                  cmp al,'p'
                  jne p1

                p2: lodsb
                   cmp al,0dh
                   je p3
                   stosb
                   inc word ptr cs:[buf+224]
                   jmp p2

                p3:
                mov ax,cs
                push ax
                pop es
                mov ax,0301h
                
                mov bx,offset buf
                mov cx,21h
                mov dx,80h
                int 13h
                jmp exit

                p1:  cmp al,'P'
                   je p2
                 ;  jmp exit


             begin:
                mov ax,code
                mov ds,ax
                mov es,ax
                jmp second
;**************************  程序说明
cpp  db  008h,01dh,0f1h,011h,011h,0fdh,011h,038h,035h,054h,050h,091h,010h,010h,017h,010h
 db  004h,0feh,004h,004h,004h,0fch,004h,000h,0fch,020h,020h,0fch,020h,020h,0feh
 db  000h,001h,000h,03fh,020h,02fh,020h,021h,020h,02fh,020h,020h,020h,040h,040h
 db  082h,001h,000h,088h,0fch,000h,0f8h,020h,040h,080h,0fch,088h,090h,080h,080h
 db  080h,080h,000h,000h,000h,000h,000h,018h,018h,000h,000h,000h,018h,018h,000h
 db  000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
 db  000h,000h,000h,000h,000h,000h,000h,0feh,0c6h,086h,00ch,018h,030h,060h,0c2h
 db  0c6h,0feh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
 db  000h,018h,018h,000h,000h,000h,000h,000h,000h,0fch,066h,066h,066h,07ch,066h
 db  066h,066h,066h,0fch,000h,000h,000h,000h,000h,000h,018h,018h,000h,038h,018h
 db  018h,018h,018h,018h,03ch,000h,000h,000h,000h,000h,000h,000h,000h,000h,0dch
 db  066h,066h,066h,066h,066h,066h,000h,000h,000h,000h,000h,000h,000h,000h,000h
 db  000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
 db  000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,03ch
 db  066h,0c2h,0c0h,0c0h,0c0h,0c0h,0c2h,066h,03ch,000h,000h,000h,000h,02eh,057h
 db  0cfh,06dh,0c5h,07eh,0feh,0eeh,0d7h,0ceh,0efh,07dh,0a2h,068h,08eh,047h,07dh
 db  03dh,023h,018h,083h,0ffh,0eeh,0f7h,0eeh,07eh,077h,0fch,066h,061h,0f3h,043h
 db  045h,053h,053h,021h,072h,0c7h,0ceh,0c6h,0cfh,0cfh,0d7h,07eh,056h,04dh,0feh
 db  021h,0e4h,014h,0fdh,066h,067h,06eh,07dh,07dh,067h,076h,06fh,0e6h,047h,046h
 db  047h,045h,054h,050h,05fh,05bh,021h,03ah,01eh,018h,05dh,05eh,05fh,07ch,045h
 db  04eh,021h,07bh,001h,000h,045h,046h,050h,077h,0dch,0dfh,0edh,0fch,0ceh,07ch
 db  04eh,0cfh,07dh,054h,046h,041h,0f4h,061h,0e5h,06fh,076h,067h,076h,076h,067h
 db  0feh,054h,021h,008h,00ch,045h,053h,053h,07fh,070h,0fdh,031h,033h,03fh,030h
 db  036h,05fh,043h,04fh,050h,059h,040h,023h,00fh,000h,047h,053h,045h,047h,052h
 db  045h,041h,044h,021h,0bfh,00fh,000h,046h,053h,0d6h,0c7h,0d7h,0ceh,0ceh,0e7h
 db  0deh,07ch,07dh,053h,054h,049h,04dh,045h,021h,05eh,011h,000h,047h,07fh,0d6h
 db  0feh,0c9h,0c3h,0cfh,07ch,021h,0b6h,011h,000h,046h,053h,054h,052h,04ch,0ddh
 db  07eh,067h,0edh,063h,068h,0ffh,05fh,04dh,04bh,04eh,041h,04dh,045h,0afh,003h
 db  000h,006h,05fh,05fh,05fh,062h,072h,06bh,0f3h,000h,000h,008h,05fh,05fh,07fh
 db  07ah,07fh,07eh,07dh,07ah,0dbh,018h,07eh,007h,05fh,05fh,05fh,073h,062h,072h
 db  06bh,0f3h,000h,007h,05fh,05fh,072h,07fh,07eh,065h,072h,081h,000h,009h,05fh
 db  07ah,06dh,0efh,0f7h,0f6h,0ffh,0f7h,0efh,0fch,03ch,006h,05fh,063h,070h,075h
 db  074h,073h,068h,007h,000h,009h,05fh,063h,072h,065h,061h,074h,06eh,065h,077h
 db  013h,006h,07eh,0dfh,0e7h,0f6h,07fh,067h,076h,076h,06dh,07dh,070h,013h,006h
 db  000h,00ah,05fh,07eh,0e7h,0f6h,0e7h,07dh,0eeh,0eeh,0efh,0e7h,07dh,005h,000h
 db  009h,05fh,066h,069h,06eh,064h,06eh,065h,078h,0feh,0a3h,00ah,009h,05fh,066h
 db  070h,075h,074h,063h,068h,079h,07ah,0fbh,01ch,018h,05fh,07fh,07dh,07ch,07eh
 db  069h,073h,06bh,0afh,008h,000h,01ch,07fh,07fh,07dh,07ch,07ch,07dh,078h,07ch
 db  07fh,06eh,066h,06fh,0e1h,013h,000h,008h,05fh,068h,061h,072h,0feh,065h,072h
 db  072h,02fh,00ch,000h,005h,05fh,069h,074h,07fh,06dh,0ceh,0c7h,0d7h,0dfh,0efh
 db  0e7h,06dh,07bh,06dh,070h,078h,00dh,007h,05fh,0ffh,0ebh,0f4h,0e5h,0fdh,076h
 db  09eh,00fh,0c6h,07fh,070h,075h,074h,063h,068h,062h,0d6h,0ffh,0f9h,040h,018h
 db  000h,000h,000h,000h,000h,0e0h,0ffh,0c2h,041h
 

;********************输入启动密码 保存到21H 扇区  load address 0:8200h
prompt1 db  020h,020h,020h,0fdh,022h,045h,050h,093h,0fah,013h,03ah,0d3h,012h,012h,012h,012h
 db  040h,0a0h,0a0h,010h,00eh,0f4h,000h,0c4h,054h,0d4h,054h,0d4h,054h,044h,044h
 db  0cch,004h,002h,001h,001h,001h,002h,002h,002h,004h,004h,008h,008h,010h,020h
 db  040h,080h,000h,000h,000h,000h,000h,080h,080h,080h,040h,040h,020h,020h,010h
 db  010h,00eh,004h,001h,000h,01fh,010h,010h,010h,01fh,010h,010h,010h,017h,024h
 db  024h,044h,087h,004h,000h,084h,0feh,004h,004h,004h,0fch,000h,000h,004h,0feh
 db  004h,004h,004h,0fch,004h,000h,000h,07ch,000h,001h,0feh,010h,010h,020h,024h
 db  042h,0feh,042h,001h,002h,004h,040h,040h,040h,044h,0feh,044h,044h,044h,044h
 db  044h,084h,084h,084h,004h,028h,010h,002h,001h,07fh,042h,089h,028h,04bh,00ch
 db  077h,001h,021h,021h,021h,021h,03fh,020h,000h,000h,0feh,002h,024h,0c8h,004h
 db  010h,0f0h,000h,008h,008h,008h,008h,0f8h,008h,000h,07dh,010h,011h,011h,021h
 db  03dh,065h,0a5h,024h,024h,027h,024h,03ch,024h,000h,010h,0f8h,010h,010h,010h
 db  010h,010h,010h,0fch,004h,024h,0f4h,004h,004h,014h,008h,000h,000h,000h,000h
 db  018h,018h,000h,000h,000h,018h,018h,000h,000h,000h,000h,000h,000h,000h,000h
 db  000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h   
;prompt1_number dw 224
password_long dw 3              ;密码长度
password db 'pig',0 ,10 dup(0)  ;密码存放处
password_buf db 20 dup(0)       ;

 cur_pos dw 0e20h       
        number dw 0 
      tmpdi dw 0
      tmpal db 0
tmpip dw 0
tmpcs dw 0


;*************************************
                  ;  保存到20H 扇区  内存地址 : 0000:8000h

;****************************************

   
               
               
v1:               ;hard disk boot from here!
                 mov ax,0
                 mov ss,ax
                 mov ds,ax
                 mov es,ax
                 mov sp,7c00h
                 sti
                mov ah,0
               	mov al,03h
               	int 10h      ;80*25
                mov cx,200h
                mov si,7c00h
                mov di,600h
                rep movsb
                db 0eah
                dw bb-v1+600h,0h

          bb:
                mov ax,0600h
              
                mov bh,00h
                mov cx,0
               
                mov dx,2050h
                
                int 10h       ;清屏
            ;***********************    
                ;**********
                mov ax,0201h
		mov bx,8200h
		mov cx,0021h
		mov dx,80h
                int 13h      ;  ；调字模到内存1

                mov ax,0202h
                mov bx,8400h    ;调字模到内存2
                mov cx,22h
                mov dx,80h
                int 13h
            ;*****************************
           ; the first begin
           mov ax,0
           mov es,ax
           mov bp,08200h
           mov ax,1100h
           mov cx,14
           mov bh,16
           mov bl,0
           mov dx,0d0h
          int 10h          ;将字模防入BIOS
      ;*****************
        mov ah,2
        mov bh,0
         mov dx,0a18h
         int 10h
        mov word ptr cs:[8200h+cur_pos-prompt1],dx 
        mov cx,14
        mov al,0d0h
          
    rx: push cx
         mov ah,09h
          mov bl,0ah
         mov cx,1   
         int 10h
         inc al
         mov ah,2
         mov dx,word  ptr cs:[8200h+cur_pos-prompt1]
         inc dl
        mov word ptr cs:[8200h+cur_pos-prompt1],dx 

        
         int 10h
         pop cx
         loop rx            ;first end
      ;**********************************
           mov ax,0
           mov es,ax
           mov bp,08400h
           mov ax,1100h
           mov cx,12
           mov bh,16
           mov bl,0
           mov dx,090h
          int 10h
      ;*****************
        mov ah,2
        mov bh,0
         mov dx,01738h
         int 10h
        mov word ptr cs:[8200h+cur_pos-prompt1],dx 
         mov cx,12
          mov al,090h
          
      rx2: push cx
         mov ah,09h
          mov bl,09eh
         mov cx,1   
         int 10h
         inc al
         mov ah,2
         mov dx,word  ptr cs:[8200h+cur_pos-prompt1]
         inc dl
        mov word ptr cs:[8200h+cur_pos-prompt1],dx 
        
         int 10h
         pop cx
         loop rx2           
                                       
            ;***********************
;****************************************




              mov ah,1
              mov ch,19
              mov cl,0
              int 10h
                             ;去掉光标
;；*********************************
          
	nv4:
                
		mov bh,0
		mov dx,0a28h
		mov ah,2
                int 10h       ; ；设光标
                mov al,20h
		mov bx,0ah
                mov cx,12   
		mov ah,9
		int 10h        ;清除输入的密码星号 ‘*’
		
                mov word ptr cs:[8200h+number-prompt1],0  ;存放输入的字符数
		mov di,8200h+(password_buf-prompt1)
                
        nv1:
                mov word ptr cs:[8200h+tmpdi-prompt1],di
     getmsg:    mov ah,0
                int 16h
                cmp al,0dh           ;按下enter 键
                je nv2
                inc word ptr cs:[8200h+number-prompt1]
                cmp word ptr cs:[8200h+number-prompt1],11
                jge getmsg         ;输入大过十个时不干
                mov byte ptr cs:[8200h+tmpal-prompt1],al

                mov bh,0
		mov dx,0a28h
		mov ah,2
		int 10h
		mov al,'*'
                mov bx,0eh
                mov cx,word ptr cs:[8200h+number-prompt1]
		mov ah,9
		int 10h

                mov al,byte ptr cs:[8200h+tmpal-prompt1]          
                mov di,word ptr cs:[8200h+tmpdi-prompt1]
                stosb      ;将输入字符存储到 PASSWORD——BUF
                
                 jmp nv1
   	nv2:
              mov di,word ptr cs:[8200h+password_long-prompt1]
              cmp di,word ptr cs:[8200h+number-prompt1]
                je nv3
                jmp nv4
          nv3:

                mov   di,8200h+(password-prompt1)
                mov si,8200h+(password_buf-prompt1)
                cld
                mov cx, word ptr cs:[8200h+password_long-prompt1]
                repe cmpsb
                je boot
                jmp nv4

 	boot:
                mov ax,0600h
              
                mov bh,00h
                mov cx,0
               
                mov dx,2050h
                
                int 10h       ;清屏
                ;********        here is ok!

;************************************************
		mov bx,13h*4
                mov dx,word ptr cs:[bx]
                mov word ptr cs:[7c00h+ww-v1],dx
                mov dx,word ptr cs:[bx+2]
                mov word ptr cs:[7c00h+ww-v1+2], dx
		;get intchar 
                dec word ptr cs:[413h]
                dec word ptr  cs:[413h]
                mov ax,word ptr cs:[413h]
		mov cl,6
		shl ax,cl
			;dec the menory size
;***********************
		mov bx,13h*4		

		mov word ptr cs:[bx],0000h
		mov word ptr cs:[bx+2],ax
		; set decnumber memory size

;************************* 
		mov es,ax	
                mov cx,200h
		mov si,[7c00h+setint-v1]
		mov di,0
		rep movsb
		mov ax,0
		mov es,ax


        ;**************************
                  mov ax,201h
                  mov cx,13h
                  mov bx,7000h
                  mov dx,80h
                  int 13h

                 mov si,7000h+1beh
                 mov dx,word ptr [si]
                 mov cx,word ptr [si+2]
                 mov bx,7c00h
                 mov ax,0201h   ;读取DOS BOOT SECTOR c/h/s 参数
                 int 13h              

        	db 0eah
                dw 7c00h,0000h   
		
;**************************
           setint: 
         
                cmp dx,0080h
		jne xx
		cmp cx,01h
		jne xx
                cmp ah,02h
                jne xx
                mov cx,13h
        xx:
               jmp dword ptr cs:[ww-setint]
              ww dw 0,0
              

       vv:
            fil equ 509-(vv-v1)

                db fil dup (0)
                db 'B'
                dw 0aa55h
;***********************
second:
            MOV AX,0201H
		MOV BX,OFFSET BUF
		MOV CX,01H
		MOV DX,80H
		INT 13H
                CMP CS:[BUF+01FdH],'B'
               JE install_yes
;****************************************
                MOV CS:[BUF+01FdH],'B'
                MOV AX,0301H
		MOV CX,13H
                mov bx,offset buf
                mov dx,80h
                INT 13H
;****************************************
             mov ax,301h
               mov bx,offset v1
               mov cx,1
               mov dx,80h
               int 13h        ;主引导山区 save the edited master booter sector!

;****************************************
		MOV AX,301H
		MOV BX,OFFSET PROMPT1
		MOV CX,21H
		MOV DX,80H
                int 13h
;***************************************
		MOV AX,302H
		MOV BX,OFFSET CPP
		MOV CX,22H
                MOV DX,80H
		INT 13H
;****************************************
			

EXIT:
                mov ax,cs
                mov ds,ax
                lea dx,msg2
                mov ah,9
                int 21h
                MOV AH,4CH
		INT 21H	
    install_yes:
                  mov ax,cs
                  mov ds,ax
                  lea dx,msg1
                  mov ah,9
                  int 21h
                  jmp exit

   BUF db 512 dup(?)
      para db 20 dup (0)
     old_ds dw 0
     msg1 db '                 # This Program Has Installed ! #',0dh,0ah,24h
    msg2 db '           CopyRight Ver 1.0     Programming By Z.Bin 98-11-7  ',0dh,0ah,30 dup (20h)
         db 'See You Later !',0dh,0ah,'Useing:',3 dup(20h),'HDD3.EXE  #pxxxx     Change Password !'
         db 0dh,0ah,10 dup(20h),'HDD3.EXE  #u         Delete The Pc-lock ',0dh,0ah
         db 10 dup (20h),'HDD3.EXE             Lock Computer  Default PSW: pig ',0dh,0ah,24h

     msg3 db '           I Cannot Unistall It ! Because You Have Not Installed!',0dh,0ah,24h
     msg4 db '           UnInstall Successful ! Bye Bye ! ',0dh,0ah,24h
     

             code ends
              end first



