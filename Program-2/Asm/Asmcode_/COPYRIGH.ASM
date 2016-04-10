    public show
    .model tiny
    .code
     
  show proc far
  begin: jmp start

copyright db  008h,01dh,0f1h,011h,011h,0fdh,011h,038h,035h,054h,050h,091h,010h,010h,017h,010h
 db  004h,0feh,004h,004h,004h,0fch,004h,000h,0fch,020h,020h,0fch,020h,020h,0feh
 db  000h,001h,000h,03fh,020h,02fh,020h,021h,020h,02fh,020h,020h,020h,040h,040h
 db  082h,001h,000h,088h,0fch,000h,0f8h,020h,040h,080h,0fch,088h,090h,080h,080h
 db  080h,080h,000h,001h,021h,011h,011h,001h,002h,0f4h,013h,011h,011h,010h,010h
 db  014h,018h,013h,00ch,0f0h,010h,010h,010h,010h,00eh,000h,0f8h,008h,010h,090h
 db  0a0h,040h,0b0h,00eh,004h,000h,020h,010h,010h,000h,000h,0f7h,010h,010h,010h
 db  010h,012h,014h,018h,010h,000h,040h,040h,040h,040h,040h,044h,0feh,040h,040h
 db  040h,040h,040h,040h,040h,040h,040h,000h,000h,000h,000h,000h,000h,000h,000h
 db  000h,030h,030h,000h,030h,030h,000h,000h,000h,000h,000h,000h,000h,000h,000h
 db  000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
 db  000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
 db  000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,009h,0fdh,009h,009h
 db  009h,079h,041h,047h,041h,079h,009h,009h,009h,009h,051h,021h,000h,008h,008h
 db  010h,020h,040h,004h,0feh,040h,040h,020h,020h,010h,04eh,084h,000h,000h,020h
 db  011h,000h,0fch,00bh,048h,028h,029h,011h,029h,025h,045h,081h,003h,000h,010h
 db  010h,0f4h,012h,010h,0feh,010h,050h,050h,070h,050h,048h,048h,06ah,086h,002h
 db  000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
 db  000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
 db  000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
 db  000h,000h,000h,000h,000h,018h,038h,078h,018h,018h,018h,018h,018h,018h,07eh
 db  000h,000h,000h,000h,000h,000h,07ch,0c6h,0c6h,0c6h,07eh,006h,006h,006h,00ch
 db  078h,000h,000h,000h,000h,000h,000h,07ch,0c6h,0c6h,0c6h,07eh,006h,006h,006h
 db  00ch,078h,000h,000h,000h,000h,000h,000h,07ch,0c6h,0c6h,0c6h,07ch,0c6h,0c6h
 db  0c6h,0c6h,07ch,000h,000h,000h,000h
  cur_pos dw 0
    start:
           mov ax,cs
           mov es,ax
           lea bp,copyright
           mov ax,1100h
           mov cx,23
           mov bh,16
           mov bl,0
           mov dx,0d0h
          int 10h
          mov ah,0fh
          int 10h

          mov ah,3
          int 10h
          mov word ptr cs:[cur_pos],dx
          mov cx,23
          mov al,0d0h

       rx: mov ah,09h
             mov bl,0ah
            
         int 10h
         inc al
         mov ah,2
         inc cs:[cur_pos]
         mov dx,word  ptr cs:[cur_pos]
         
         int 10h
         loop rx
         mov ah,0eh
         mov bx,0
         mov al,0
         int 10h
       
       retf
     show endp

          end




        
