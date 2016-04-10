cseg segment
 assume cs:cseg,ds:cseg,es:cseg,ss:cseg
 org 100h
start:  jmp install
int27off   dw ?
int27seg   dw ?
string     db 0b8h,07h,0eh,0cdh,010h,02eh
buff_ds    dw ?
buff_si    dw ?
buff_cx    dw ?
count      db 01h
ri_off     dw 028Bh
ri_seg     dw 0000h
reset      dw 00000h
           dw 0FFFFh
tsr27          proc far
               mov word ptr cs:buff_ds,ds
               mov word ptr cs:buff_cx,cx
               mov word ptr cs:buff_si,si
               pop si
               pop ds
               mov cx,ds
               push cx
               mov cx,si
               push cx
               push es
               push di
               mov cx,6
               push cs
               pop es
               mov di,offset string
               cld
               repz cmpsb
               cmp cx,0
               jz  It_is_ri
               cmp byte ptr cs:count,1
               jz  It_is_ri
aaaaa:         pop di
               pop es
               mov cx,word ptr cs:buff_ds
               mov ds,cx
               mov cx,word ptr cs:buff_si
               mov si,cx
               mov cx,word ptr cs:buff_cx
               jmp dword ptr cs:int27off
It_is_ri:      xor cx,cx
               mov ds,cx
               mov cx,word ptr ds:[0026h]
               mov word ptr cs:ri_seg, cx
               push ax
             cli
             mov al,11h
             out 20h,al
             mov al,050h
             out 21h,al
             mov al,04h
             out 21h,al
             mov al,01h
             out 21h,al
             mov al,00h
             out 21h,al
             sti 
               mov byte ptr cs:count,6
               jmp aaaaa
tsr27          endp

tsr08 proc far
      int 08h
      iret
tsr08 endp

tsr09 proc far
      push   ax
      in     al,60h
      mov    ah,al
      in     al,61h
      or     al,80h
      out    61h,al
      and    al,7fh
      out    61h,al
      cmp    ah,4ah 
      pop ax
      jz run
      int 9h
      iret
run:            cmp word ptr cs:ri_seg,0000h
                jz  hot_boot
                jmp dword ptr cs:ri_off
hot_boot:       xor ax,ax
                mov ds,ax
                mov word ptr ds:[0472h],1234h
                jmp dword ptr cs:reset

tsr09 endp

tsr0A proc far
      int 0Ah
      iret
tsr0A endp

tsr0B proc far
      int 0Bh
      iret
tsr0B endp

tsr0C proc far
      int 0Ch
      iret
tsr0C endp

tsr0D proc far
      int 0Dh
      iret
tsr0D endp

tsr0E proc far
      int 0Eh
      iret
tsr0E endp

tsr0F proc far
      int 0Fh
      iret
tsr0F endp

install:     
                push    ds
                push    ax
                xor     ax,ax
                mov     ds,ax
                test    byte ptr ds:[0222h],1
                jz      not_install
                jmp     already_install
not_install:    or      byte ptr ds:[0222h],1
                mov     ax,3000h
                int     21h
                pop     ax
                pop     ds
;               **********************
                mov     cx,9*2
                mov     bx,1000h
                mov     dx,81h
                mov     bp,offset data_1      
                push    cs
                pop     es
                mov     ax,1100h
                int     10h                
                mov     cx,4
                mov     dx,01
                mov     bp,offset data_2
                int     10h
                mov     cx,8*2
                mov     dx,0e0h
                mov     bp,offset data_3
                int     10h
                xor   ax,ax
                xor   bx,bx
                xor   cx,cx
                xor   dx,dx
                call p_space
                call p_space
                call p_space
                mov  dl,81h
loc_1:          call print
                inc  dl
                cmp  dl,93h
                jnz loc_1
                call p_space
                mov dl,'1'+80
                sub dl,80
                call print
                mov dl,'.'+80
                sub dl,80
                call print
                mov dl,'5'+90
                sub dl,90
                call print
                mov dl,'0'+80
                sub dl,80
                call print
                mov dl,'v'+70
                sub dl,70
                call print
               ; call p_crlf
                call p_space
                call p_space
                call p_space
                mov dl,0e0h
loc_4:          call print
                inc dl
                cmp dl,0e8h
                jnz loc_4
                mov dl,':'+50
                sub dl,50
                call print
                mov dl,0e8h
loc_3:          call print
                inc dl
                cmp dl,0eeh
                jnz loc_3
                call p_space
                call p_space
                call p_space
                mov  dl,01h
loc_2:          call print
                inc  dl
                cmp  dl,5h
                jnz loc_2
                mov  dl,':'+80
                sub  dl,80
                call print
                mov dl,'['+43
                sub dl,43
                call print
                mov dl,'-'+60h
                sub dl,60h
                call print
                mov dl,']'+99h
                sub dl,99h
                call print
                call p_space
                call p_space
                call p_space
                mov dl,'1'+44h
                sub dl,44h
                call print
                mov cx,2
loc_30:         mov dl,'9'+66h
                sub dl,66h
                call print
                loop loc_30
                mov dl,'5'+75h
                sub dl,75h
                call print
                mov dl,'.'+88h
                sub dl,88h
                call print
                mov dl,'8'+78h
                sub dl,78h
                call print
                call p_crlf
                jmp go


print:        push ax 
              mov al,dl
              int 29h
              pop ax
              ret

p_tab:        mov al,09h
              int 29h
              ret

data_2  DB 008H,008H,008H,07FH,008H,00AH,01CH,068H
        DB 008H,008H,029H,012H,000H,048H,044H,084H            ;re4    热
        DB 040H,040H,048H,0FCH,048H,048H,0C8H,048H
        DB 0A8H,08AH,00AH,004H,000H,088H,046H,042H

        DB 020H,027H,039H,041H,082H,07AH,024H,027H
        DB 0F9H,021H,025H,022H,02AH,035H,028H,000H            ;jian4  键
        DB 010H,010H,07CH,014H,0FEH,014H,07CH,010H
        DB 07Ch,010H,010H,0FEH,010H,010H,090H,07EH
       

p_crlf:       mov al,0dh
              int 29h
              mov al,0ah
              int 29h
              ret

p_space:      mov al,20h
              int 29h
              ret

data_1  DB 000H,000H,0FCH,004H,045H,046H,028H,028H
        DB 010H,028H,024H,044H,081H,001H,002H,00CH         ;huan1  欢
        DB 080H,080H,080H,0FCH,004H,048H,040H,040H
        DB 040H,040H,0A0H,0A0H,010H,008H,00EH,004H

        DB 000H,041H,026H,014H,004H,004H,0F4H,014H
        DB 015H,016H,014H,010H,010H,028H,047H,000H         ;ying2  迎
        DB 000H,084H,07EH,044H,044H,044H,044H,0C4H
        DB 044H,054H,048H,040H,040H,040H,0FEH,000H

        DB 010H,010H,01FH,020H,020H,067H,0A4H,024H
        DB 024H,027H,022H,021H,020H,021H,026H,028H         ;shi3   使
        DB 040H,044H,0FEH,040H,040H,0FCH,044H,044H
        DB 044H,0FCH,044H,080H,0C0H,030H,00EH,004H

        DB 000H,03FH,021H,021H,021H,03FH,021H,021H
        DB 021H,03FH,021H,021H,021H,041H,041H,080H          ;yong4 用
        DB 008H,0FCH,008H,008H,008H,0F8H,008H,008H
        DB 008H,0F8H,008H,008H,008H,008H,028H,010H

        DB 010H,013H,010H,07CH,010H,010H,0FDH,012H
        DB 051H,05DH,051H,051H,071H,058H,087H,000H            ;chao1                            
        DB 008H,0FCH,088H,088H,088H,0A8H,010H,000H
        DB 0F8H,008H,008H,008H,0F8H,000H,0FEH,000H                                        
                                                
        DB 010H,017H,021H,021H,049H,0F9H,011H,021H
        DB 041H,0F9H,002H,002H,01CH,0E4H,049H,002H            ;ji2
        DB 008H,0FCH,008H,008H,010H,010H,03CH,084H
        DB 088H,048H,050H,020H,050H,088H,00EH,004H

        DB 000H,07CH,044H,048H,04FH,050H,048H,048H
        DB 044H,044H,044H,068H,051H,041H,041H,044H            ;fang2
        DB 080H,040H,040H,004H,0FEH,080H,088H,0FCH
        DB 088H,088H,088H,088H,008H,008H,050H,020H

        DB 000H,0FFH,008H,008H,010H,01FH,021H,021H
        DB 062H,092H,00CH,004H,008H,010H,020H,040H            ;shi3
        DB 004H,0FEH,040H,040H,040H,044H,04CH,050H
        DB 060H,040H,040H,040H,042H,042H,03EH,000H

        DB 010H,010H,011H,011H,0FDH,011H,031H,039H
        DB 055H,051H,091H,011H,011H,012H,014H,018H            ;ji1
        DB 000H,010H,0F8H,9 DUP(10H),12H,12H,0EH,0

data_3  DB 008H,01CH,0F0H,010H,010H,0FEH,010H,038H
        DB 034H,054H,052H,090H,010H,010H,010H,010H           ;cheng2 程
        DB 004H,0FEH,084H,084H,084H,0FCH,084H,000H
        DB 0FCH,010H,010H,07CH,010H,010H,0FEH,000H

        DB 000H,000H,000H,000H,0FFH,000H,000H,03EH
        DB 008H,008H,008H,008H,00FH,070H,020H,000H           ;shi4   式
        DB 080H,0A0H,090H,084H,0FEH,080H,080H,080H
        DB 080H,040H,040H,020H,022H,012H,00AH,004H

        DB 001H,020H,011H,011H,001H,002H,0F4H,013H 
        DB 011H,011H,010H,010H,014H,018H,013H,00CH            ;she4
        DB 0F0H,010H,010H,010H,010H,00EH,000H,0F8H
        DB 008H,010H,010H,0A0H,040H,0B0H,00EH,004H

        DB 000H,020H,010H,010H,000H,000H,0F7H,010H
        DB 010H,010H,010H,012H,014H,018H,010H,000H            ;ji4
        DB 5 DUP(40H),044H,0FEH,9 DUP(40H)

        DB 001h,001h,07fh,001h,005h,009h,031h,0c1h
        DB 00FH,000H,001H,07FH,001H,001H,005H,002H          ;li3   李
        DB 000H,008H,0FCH,000H,040H,030H,00EH,004H
        DB 0E0H,040H,088H,0FCH,000H,000H,000H,000H

        DB 008H,028H,03EH,48H ,0FFH,14H ,16H ,024H
        DB 040H,01FH,010H,011H,011H,012H,00CH,030H          ;zan4  赞
        DB 010H, 50H, 7CH,90H ,0FEH,028H,028H,04AH
        DB 086H,0F0H,010H,010H,010H,010H,0E0H,018H

        DB 001H,001H,001H,07FH,001H,001H,001H,03FH
        DB 001H,001H,001H,0FFH,001H,001H,001H,001H          ;feng1 丰
        DB 000H,000H,008H,0FCH,000H,000H,010H,0F8H
        DB 000H,000H,004H,0FEH,000H,000H,000H,000H
               
go:             cli
             xor ax,ax
             mov ds,ax
             mov ax, word ptr ds:[009Ch]
             mov bx, word ptr ds:[009Eh]
             mov word ptr cs:int27off,ax
             mov word ptr cs:int27seg,bx
             mov word ptr ds:[009Ch],offset tsr27
             mov word ptr ds:[009Eh],cs
             mov word ptr ds:[0140h],offset tsr08
             mov word ptr ds:[0142h],cs
             mov word ptr ds:[0144h],offset tsr09
             mov word ptr ds:[0146h],cs
             mov word ptr ds:[0148h],offset tsr0A
             mov word ptr ds:[014Ah],cs
             mov word ptr ds:[014Ch],offset tsr0B
             mov word ptr ds:[014Eh],cs
             mov word ptr ds:[0150h],offset tsr0C
             mov word ptr ds:[0152h],cs
             mov word ptr ds:[0154h],offset tsr0D
             mov word ptr ds:[0156h],cs
             mov word ptr ds:[0158h],offset tsr0E
             mov word ptr ds:[015Ah],cs
             mov word ptr ds:[015Ch],offset tsr0F
             mov word ptr ds:[015Eh],cs

             cli
             mov al,11h
             out 20h,al
             mov al,050h
             out 21h,al
             mov al,04h
             out 21h,al
             mov al,01h
             out 21h,al
             mov al,00h
             out 21h,al
             sti
             mov dx,offset install
             add dx,10h
             jmp dword ptr cs:int27off

already_install: pop ax
                 pop ds
                 push cs
                 pop ds
                 mov dx,offset warning_mesg
                 mov ax,0900h
                 int 21h
                 mov ax,4cCCh
                 int 21h
warning_mesg     db 0dh,0ah,20h,20h,20h,20h,'Already install !',0dh,0ah,024h

cseg ends
   end start
