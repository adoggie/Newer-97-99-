set talk off
do mm
store 29 to col1
store 3.8 to row1
@10,10 say ""
do he-hlhl
set colo to /b+
@10.25,20 say "复制银行盘片"font "宋体",10 colo rgb(255,255,255,,,)
set colo to /w+
ab="A"
aba=0
aba2=0
@11.8,10.5 say "《将软盘插入..》"font "宋体",10 colo rgb(0,0,0,,,)
@11.8,30.8 say "a"font "宋体",12 colo rgb(0,0,0,,,)
@11.8,37.2 say "b"font "宋体",12 colo rgb(0,0,0,,,)
@11.8,26.5 get aba2 picture "@*BH a;b" size 1,4,2.5 ;
DEFAULT sele VALID copy()
@10.2,36.9 get aba3 picture "@*TCB X" size 0.96,1.91
read
endif
if aba3=1
return
endif

do case
case aba2=1
ab="a"
case aba2=2
ab="b"
endcase
@13.2,14 say "          ";
font "宋体",12 colo rgb(,,,255,255,255)
@13.2,34.3 say str(50,3)+"％"font "宋体",10 colo rgb(0,0,0,,,)

use slfgtf
copy to slfgtf all type sdf
use bbbb
copy to aaaaa all fiel name,z3,z5
use aaaaa
copy to bbbb all type sdf
copy file slfgtf.txt to &ab:\slfgtf

nx=1
do while .t.
@13.2,11 say "0％"font "宋体",10 colo rgb(0,0,0,,,)                        
set colo to r+/w+
@13.2,14 say "                    ";
font "宋体",12 colo rgb(,,,255,255,255)
@13.2,34.3 say str(50+nx,3)+"％"font "宋体",10 colo rgb(0,0,0,,,)
nx=nx+1
if nx=50
nxx=1
do while nxx<=100
@13.2,34.3 say str(50+nx,3)+"％"font "宋体",10 colo rgb(0,0,0,,,)
nxx=nxx+1
enddo
exit
endif
enddo
do mm
return

