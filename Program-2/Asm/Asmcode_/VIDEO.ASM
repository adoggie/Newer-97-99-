code segment
        assume cs:code,ds:code,es:code
        org 80h
lenth db ?
parm db 1fh dup(?)
        org 100h
start:  push cs
        pop ds
        mov bx,offset lenth
        cmp byte ptr es:[bx],0
        je  noparm
        mov di,offset mess1
compare:mov bx,offset parm
        cmp byte ptr es:[bx],' '
        je  com1
com2:   cmp byte ptr es:[bx],'/'
        je  near ptr yesparm
        mov ah,9
        lea dx,err1
        int 21h
        jmp near ptr exit
com1:   inc bx
        jmp com2
yesparm:inc bx
        cmp byte ptr es:[bx],0dh
        je  done
        mov al,byte ptr es:[bx]
        mov byte ptr ds:[di],al
        inc di
        jmp yesparm
done:   cmp byte ptr mess1,'?'
        je  help
        cmp word ptr mess1,31h
        je  a1
        cmp word ptr mess1,32h
        je  a2
        cmp word ptr mess1,33h
        je  a3
        cmp word ptr mess1,34h
        je  a4
        cmp word ptr mess1,35h
        je  a5
        cmp word ptr mess1,36h
        je  a6
        cmp word ptr mess1,37h
        je  a7
        cmp word ptr mess1,38h
        je  a8
        cmp word ptr mess1,39h
        je  a9
        cmp word ptr mess1,3031h
        je  a10
        cmp word ptr mess1,3131h
        je  a11
        jmp eorro
eorro:  mov ah,9
        lea dx,err1
        int 21h
        jmp exit
a1:      mov ax,0
        int 10h
        mov ah,9
        lea dx,mess2
        int 21h
        lea dx,mess3
        int 21h
        jmp exit
a2:      mov ax,1
        int 10h
        mov ah,9
        lea dx,mess2
        int 21h
        lea dx,mess4
        int 21h
        jmp exit
a3:      mov ax,2
        int 10h
        mov ah,9
        lea dx,mess2
        int 21h
        lea dx,mess5
        int 21h
        jmp exit
a4:      mov ax,3
        int 10h
        mov ah,9
        lea dx,mess2
        int 21h
        lea dx,mess6
        int 21h
        jmp exit
a5:      mov ax,4
        int 10h
        mov ah,9
        lea dx,mess2
        int 21h
        lea dx,mess7
        int 21h
        jmp exit
a6:      mov ax,5
        int 10h
        mov ah,9
        lea dx,mess2
        int 21h
        lea dx,mess8
        int 21h
        jmp exit
a7:      mov ax,6
        int 10h
        mov ah,9
        lea dx,mess2
        int 21h
        lea dx,mess9
        int 21h
        jmp exit
a8:      mov ax,0dh
        int 10h
        mov ah,9
        lea dx,mess2
        int 21h
        lea dx,mess10
        int 21h
        jmp exit
a9:      mov ax,0eh
        int 10h
        mov ah,9
        lea dx,mess2
        int 21h
        lea dx,mess11
        int 21h
        jmp exit
a10:     mov ax,0fh
        int 10h
        mov ah,9
        lea dx,mess2
        int 21h
        lea dx,mess12
        int 21h
        jmp exit
a11:     mov ax,10h
        int 10h
        mov ah,9
        lea dx,mess2
        int 21h
        lea dx,mess13
        int 21h
        jmp exit
help:   mov ah,9
        lea dx,mess2
        int 21h
        lea dx,mess14
        int 21h
        jmp exit
noparm: mov ax,3
        int 10h
        mov ah,9
        lea dx,mess2
        int 21h
        lea dx,mess6
        int 21h
        jmp exit
exit:   mov dl,7
        mov ah,2
        int 21h
        mov ah,4ch
        int 21h
mess1 db 10h dup(0)
err1 db 'The parameter is wrong!',10,13,'Type video/? for help.',10,13,'$'
mess2 db '                    Screen Setup 1.0         95.12.15',10,13
      db '                                                 copyright by SJS',10,13
      db '     This program is a shareware, it can help you setup the screen,',10,13
      db '  when  you meet some  trouble in  bad software demage your screen.',10,13
      db '  Please type video/? for help.If you find any problem,please tell',10,13
      db '  me.My address is: BeiJing Information Technology Institute 93312#',10,13
      db '  SJS.  Postcode:100101.',10,13
      db '  Thank you for use this program.',10,13,'$'
mess3 db '  Now screen is 40*25 B/W mode.',10,13,'$'
mess4 db '  Now screen is 40*25 16 colors mode.',10,13,'$'
mess5 db '  Now screen is 80*25 B/W text mode.',10,13,'$'
mess6 db '  Now screen is 80*25 16 colors text mode.',10,13,'$'
mess7 db '  Now screen is 300*200 4 colors graph mode.',10,13,'$'
mess8 db '  Now screen is 300*200 B/W graph mode.',10,13,'$'
mess9 db '  Now screen is 640*200 B/W graph mode.',10,13,'$'
mess10 db '  Now screen is 300*200 EGA 16 colors graph mode.',10,13,'$'
mess11 db '  Now screen is 640*200 EGA 16 colors graph mode.',10,13,'$'
mess12 db '  Now screen is 640*350 EGA B/W graph mode.',10,13,'$'
mess13 db '  Now screen is 640*350 EGA 64 colors graph mode.',10,13,'$'
mess14 db '  /1--40*25 B/W text mode',10,13
       db '  /2--40*25 16 colors mode',10,13
       db '  /3--80*25 B/W text mode',10,13
       db '  /4--80*25 16 colors text mode',10,13
       db '  /5--300*200 4 colors graph mode',10,13
       db '  /6--300*200 B/W graph mode',10,13
       db '  /7--640*200 B/W graph mode',10,13
       db '  /8--300*200 B/W EGA 16 colors graph mode',10,13
       db '  /9--640*200 EGA 16 colors graph mode.',10,13
       db '  /10--640*350 EGA B/W graph mode',10,13
       db '  /11--640*350 EGA 64 colors graph mode',10,13,'$'
code ends
     end start
