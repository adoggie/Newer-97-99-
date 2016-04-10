set talk off
do mm
store 29 to col1
store 3.8 to row1
@10,10 say ""
do he-hlhl
set colo to /b+
@10.25,20 say "备份当月数据"font "宋体",10 colo rgb(255,255,255,,,)
set colo to /w+
ab="A"
aba=0
aba2=0
aba3=0
@11.8,11 say "《将软盘插入..》"font "宋体",10 colo rgb(0,0,0,,,)
@11.8,29.8 say "a"font "宋体",12 colo rgb(0,0,0,,,)
@11.8,36.2 say "b"font "宋体",12 colo rgb(0,0,0,,,)

@11.8,25.5 get aba2 picture "@*BH a;b" size 1,4,2.5 ;
DEFAULT sele VALID copy()
@10.2,36.9 get aba3 picture "@*TCB X" VALID km1() size 0.96,1.91
read

if aba3=1
close data
close all
return
endif
do case
case aba2=1
ab="a"
case aba2=2
ab="b"
endcase
store 20 to col1
store 0 to row1
@13.2,14 say ""
do he-llhh
nx=1
nxy=1
@13.2,11 say "0％"font "宋体",10 colo rgb(0,0,0,,,)
set colo to r+/w+
@13.2,34.3 say str(20,3)+"％"font "宋体",10 colo rgb(0,0,0,,,)
do while .t.
do case
case nx=1
okc="gzdy.dbf"
copy file &okc to &ab:\&okc
store 20 to nxy
@13.2,14 say "     "font "宋体",12 colo rgb(,,,255,255,255)
case nx=2
okc="gzpl.dbf"
copy file &okc to &ab:\&okc
store 50 to nxy
@13.2,14 say "         "font "宋体",12 colo rgb(,,,255,255,255)
case nx=3
okc="gzgw.dbf"
copy file &okc to &ab:\&okc
store 70 to nxy
@13.2,14 say "              "font "宋体",12 colo rgb(,,,255,255,255)
case nx=4
okc="&gg"+".dbf"
copy file &okc to &ab:\&okc
store 80 to nxy
@13.2,14 say "                 "font "宋体",12 colo rgb(,,,255,255,255)
case nx=5
okc="abcd.dbf"
copy file &okc to &ab:\&okc
store 90 to nxy
@13.2,14 say "                   "font "宋体",12 colo rgb(,,,255,255,255)
case nx=6
okc="fox1-99.dbf"
copy file &okc to &ab:\&okc
store 100 to nxy
@13.2,14 say "                    "font "宋体",12 colo rgb(,,,255,255,255)
case nx=7
exit
endcase
nxx=1
do while nxx<=100
@13.2,34.3 say str(nxy,3)+"％"font "宋体",10 colo rgb(0,0,0,,,)
nxx=nxx+1
enddo
close data
close all
nx=nx+1
enddo
do mm
return

