;This is a protect screen's programm.
;Thank you for your reading.



cseg segment 
      assume cs:cseg,ds:cseg,es:cseg,ss:cseg
      org 100h


start:          jmp  install
int09off        dw 0000h
int09seg        dw 0000h 
int21off        dw 0000h
int21seg        dw 0000h

tsr            proc  far
               cmp   ax,0fedch
               jz  carry_ax  
               push    ax
               push    bx
               in      al, 60h
               cmp     al, 4fh ; [Gray End] pressed?
               jnz return
               jmp close 

carry_ax:      mov ax,3333h
               iret


return:        pop  bx
               pop  ax
               jmp  dword ptr cs:int09off
               
close:         
               cli
               in al,21h
               push ax
               mov al,0ffh
               out 21h,al
               sti
               mov ax,1201h
               mov bx,0036h
               int 10h
               cli
               
wait1:         in al,60h
               cmp  al,0cfh
               jz comp
               jmp wait1

comp:          in al,60h
               cmp al,4fh
               jz open
               jmp comp

open:          
               pop ax
               out 21h,al
               sti
               mov ax,1200h
               mov bx,0036h
               int 10h
               
               jmp return
               
              
tsr endp

forbid          proc    far
                push    ax
                sti
                cmp     ax, 3509h
                jz      liv09
                cmp     ax, 3521h
                jz      liv21
                cmp     ax, 2509h
                jz      siv09
                cmp     ax, 2521h
                jz      siv21
                pop     ax
                jmp     dword ptr cs:int21off
liv09:          mov     ax, word ptr cs:int09seg
                push    ax
                pop     es
                mov     ax, word ptr cs:int09off
                push    ax
                pop     bx
                jmp     away 
liv21:          mov     ax, word ptr cs:int21seg
                push    ax
                pop     es
                mov     ax, word ptr cs:int21off
                push    ax
                pop     bx
                jmp     away
siv09:          mov     word ptr cs:int09off, dx
                mov     word ptr cs:int09seg, ds
                jmp     away
siv21:          mov     word ptr cs:int21off, dx
                mov     word ptr cs:int21seg, ds
                jmp     away
away:           pop     ax
                iret
forbid          endp

install:        
                   
                   mov ax,0fedch
                   int 9h
                   cmp ax,3333h
                   jz  warning
                   jmp go
                                                

warning:          mov ax,0003h
                  int 10h
                  call p_crlf
                  call p_crlf
                  call p_crlf
                  call p_tab
                  push cs
                  pop ds
                  mov dx,offset message
                  mov ax,0900h
                  int 21h
                  call p_crlf
                  mov ax,4cffh
                  int 21h



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
                                                        
        DB 000H,03FH,020H,020H,03FH,022H,021H,02FH
        DB 022H,022H,03FH,022H,022H,042H,084H,008H            ;ping2  屏
        DB 008H,0FCH,008H,008H,0F8H,020H,040H,0FCH
        DB 020H,020H,0FEH,020H,020H,020H,020H,020H                                        
                                                
        DB 004H,07FH,004H,01FH,010H,01FH,010H,01FH
        DB 004H,0FFH,011H,03FH,0D1H,011H,011H,001H            ;mu4   幕                         
        DB 040H,0FCH,040H,0F0H,010H,0F0H,010H,0F0H
        DB 000H,0FEH,010H,0F8H,016H,050H,020H,000H                                        
                                                
        DB 008H,00BH,00AH,012H,012H,033H,032H,050H
        DB 09FH,010H,010H,011H,012H,014H,018H,010H            ;bao3  保                          
        DB 008H,0FCH,008H,008H,008H,0F8H,040H,044H
        DB 0FEH,040H,0E0H,050H,048H,04EH,044H,040H                                        
                                                
        DB 010H,010H,010H,013H,0FEH,012H,016H,01BH            ;hu4   护
        DB 032H,0D2H,012H,012H,012H,014H,054H,028H                                        
        DB 080H,060H,024H,0FEH,004H,004H,004H,0FCH
        DB 004H,7 DUP(0)                                        
                                                
        DB 001H,011H,009H,07FH,040H,08FH,008H,00FH
        DB 001H,01FH,011H,011H,011H,011H,001H,001H            ;chang2 常                           
        DB 000H,010H,020H,0FEH,002H,0E4H,020H,0E0H
        DB 000H,0F0H,010H,010H,050H,020H,000H,000H                                        
                                                
        DB 008H,0FCH,008H,04BH,048H,048H,048H,048H
        DB 07DH,004H,004H,01CH,0E4H,044H,017H,008H            ;zhu4   驻
        DB 040H,020H,024H,0FEH,020H,020H,020H,020H
        DB 0FCH,020H,020H,020H,020H,024H,0FEH,000H 

        DB 008H,01CH,0F0H,010H,010H,0FEH,010H,038H
        DB 034H,054H,052H,090H,010H,010H,010H,010H           ;cheng2 程
        DB 004H,0FEH,084H,084H,084H,0FCH,084H,000H
        DB 0FCH,010H,010H,07CH,010H,010H,0FEH,000H

        DB 000H,000H,000H,000H,0FFH,000H,000H,03EH
        DB 008H,008H,008H,008H,00FH,070H,020H,000H           ;shi4   式
        DB 080H,0A0H,090H,084H,0FEH,080H,080H,080H
        DB 080H,040H,040H,020H,022H,012H,00AH,004H

                
                
go:             mov     cx,24
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

                mov     cx,28
                mov     dx,0e0h
                mov     bp,offset data_3
                int     10h

                xor   ax,ax
                xor   bx,bx
                xor   cx,cx
                xor   dx,dx

                call p_crlf
                call p_tab
                mov  dl,81h
loc_1:          call print
                inc  dl
                cmp  dl,99h
                jnz loc_1
                call p_crlf
                call p_tab
                mov  dl,01h
loc_2:          call print
                inc  dl
                cmp  dl,5h
                jnz loc_2
                mov  dl,':'+80
                sub  dl,80
                call print
                call p_space
                mov dl,'1'+80
                sub dl,80
                call print
                mov dl,'.'+80
                sub dl,80
                call print
                mov dl,'5'+80
                sub dl,80
                call print
                mov dl,'0'+80
                sub dl,80
                call print
                call p_crlf
                call p_tab
                mov dl,0e0h
loc_3:          call print
                inc dl
                cmp dl,0eah
                jnz loc_3
                mov dl,':'+80
                sub dl,80
                call print
                call p_space
                mov dl,0eah
loc_4:          call print
                inc dl
                cmp dl,0f0h
                jnz loc_4
                call p_crlf
                call p_tab
                mov dl,0f0h
loc_5:          call print
                inc dl
                cmp dl,0f8h
                jnz loc_5
                mov dl,':'+80
                sub dl,80
                call print
                call p_space
                call pt_88
                call pt_88
                call pt_33
                call pt_33
                mov dl,'0'+80
                sub dl,80
                call print
                mov dl,'6'+80
                sub dl,80
                call print
                mov dl,'5'+80
                sub dl,80
                call print
                call p_crlf
                call p_tab
                mov dl,0f8h
loc_6:          call print
                inc dl
                cmp dl,0fch
                jnz loc_6
                mov dl,':'+40
                sub dl,40
                call print
                call p_space
                mov dl,'['+43
                sub dl,43
                call print
                mov dl,'E'+60h
                sub dl,60h
                call print
                mov dl,'n'+61h
                sub dl,61h
                call print
                mov dl,'d'+62h
                sub dl,62h
                call print
                mov dl,']'+99h
                sub dl,99h
                call print
                mov cx,3
loc_7:          mov dl,09h
                call print
                loop loc_7
                call p_crlf
                
               
               
               mov     ax, 0000h
               mov     ds, ax
               mov     ax, word ptr ds:[0024h]
               mov     word ptr cs:int09off, ax
               mov     ax, word ptr ds:[0026h]
               jmp    con_1
               
pt_88:         mov dl,'8'+90h
               sub dl,90h
               call print
               ret


data_2  DB 002H,012H,012H,012H,012H,01FH,010H,010H
        DB 01EH,012H,012H,012H,012H,013H,022H,002H           ;ban3   版
        DB 002H,007H,078H,040H,040H,07FH,041H,061H
        DB 052H,052H,054H,088H,088H,014H,023H,0C1H

        DB 001H,001H,001H,001H,07FH,005H,005H,005H
        DB 009H,009H,011H,02FH,0C1H,001H,001H,001H          ;ben3  本
        DB 000H,000H,000H,008H,0FCH,040H,040H,040H
        DB 020H,020H,010H,0EEH,004H,000H,000H,000H

con_1:         mov     word ptr cs:int09seg, ax
               mov     word ptr ds:[0024h], offset tsr
               mov     word ptr ds:[0026h], seg    tsr
               mov     ax, word ptr ds:[0084h]
               jmp    con_2

pt_33:         mov dl,'3'+49h
               sub dl,49h
               call print
               ret

con_2:         mov     word ptr cs:int21off, ax
               mov     ax, word ptr ds:[0086h]
               mov     word ptr cs:int21seg, ax
               jmp con_3

print:        mov ah,02 
              int 21h
              ret

p_tab:        mov dl,09h
              call print
              ret

data_3  DB 008H,01CH,0F0H,010H,010H,0FEH,010H,038H
        DB 034H,054H,052H,090H,010H,010H,010H,010H           ;cheng2 程
        DB 004H,0FEH,084H,084H,084H,0FCH,084H,000H
        DB 0FCH,010H,010H,07CH,010H,010H,0FEH,000H

        DB 000H,000H,000H,000H,0FFH,000H,000H,03EH
        DB 008H,008H,008H,008H,00FH,070H,020H,000H           ;shi4   式
        DB 080H,0A0H,090H,084H,0FEH,080H,080H,080H
        DB 080H,040H,040H,020H,022H,012H,00AH,004H
                                                
        DB 000H,07FH,008H,008H,008H,008H,008H,0FFH
        DB 008H,008H,008H,008H,010H,010H,020H,040H            ;kai1  开                          
        DB 008H,0FEH,020H,020H,020H,020H,024H,0FEH                                        
        DB 8 DUP(20H)
                                                
        DB 001H,011H,011H,021H,03FH,002H,002H,007H
        DB 004H,00AH,00AH,001H,020H,041H,006H,018H                                        
        DB 000H,020H,010H,000H,0FCH,000H,000H,0F0H            ;fa1   发                         
        DB 010H,020H,020H,040H,0C0H,020H,01EH,008H

        DB 002H,002H,03FH,002H,002H,0FFH,001H,002H
        DB 00FH,018H,028H,04FH,088H,008H,00FH,008H
        DB 000H,010H,0E0H,020H,044H,0FEH,000H,000H            ;ze3   者
        DB 0F0H,010H,010H,0F0H,010H,010H,0F0H,010H                                        

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
        
        DB 001H,0FEH,024H,024H,03DH,024H,024H,024H
        DB 03DH,024H,024H,024H,03EH,0E4H,005H,006H            ;lian2  联                          
        DB 004H,0CCH,050H,000H,0FCH,020H,020H,024H
        DB 0FEH,020H,020H,050H,050H,088H,00EH,004H

        DB 000H,07FH,002H,004H,008H,03FH,001H,006H
        DB 018H,03FH,011H,001H,011H,021H,045H,002H            ;xi4    系
        DB 038H,0C0H,000H,020H,040H,080H,000H,020H
        DB 010H,0F8H,00FH,000H,010H,008H,008H,000H

        DB 002H,002H,002H,002H,07FH,042H,042H,07FH
        DB 042H,042H,07FH,042H,002H,002H,002H,001H            ;dian4  电
        DB 000H,000H,000H,010H,0F8H,010H,010H,0F0H
        DB 010H,010H,0F0H,010H,004H,004H,004H,0FCH

        DB 000H,040H,033H,010H,000H,000H,0F7H,010H
        DB 010H,010H,013H,012H,016H,01AH,013H,002H            ;hua4   话
        DB 010H,038H,0C0H,040H,040H,044H,0FEH,040H
        DB 040H,048H,0FCH,008H,008H,008H,0F8H,008H
        
        DB 008H,008H,008H,07FH,008H,00AH,01CH,068H
        DB 008H,008H,029H,012H,000H,048H,044H,084H            ;re4    热
        DB 040H,040H,048H,0FCH,048H,048H,0C8H,048H
        DB 0A8H,08AH,00AH,004H,000H,088H,046H,042H

        DB 020H,027H,039H,041H,082H,07AH,024H,027H
        DB 0F9H,021H,025H,022H,02AH,035H,028H,000H            ;jian4  键
        DB 010H,010H,07CH,014H,0FEH,014H,07CH,010H
        DB 07Ch,010H,010H,0FEH,010H,010H,090H,07EH
               
con_3:         mov     word ptr ds:[0084h], offset forbid
               mov     word ptr ds:[0086h], seg    forbid
               jmp con_4

message       db 'ptsr.exe already install!        Good lucky...',07h,24h


p_crlf:       mov dl,0dh
              call print
              mov dl,0ah
              call print
              ret
               
con_4:          sti
               mov     dx,offset install 
               mov     cl,4
               add     dx,0fh
               shr     dx,cl
               add     dx,10h
               mov     ax, 3100h
               int     21h


p_space:      mov dl,20h
              call print
              ret




cseg ends
           end start
