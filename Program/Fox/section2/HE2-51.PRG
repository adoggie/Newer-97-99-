set talk off
do mm
use gzdy
count to ai
dime a(ai)
dime a1(ai)
dime a2(ai)
FOR I=1 TO Ai
use gzdy
go i
store pl1 to a(i)  &&名称
store q1 to a1(i)  &&字段
store allt(gs) to a2(i)  &&公式
ENDF
set colo to n+/bg+,r+/b+
*@4.2,27.6 get sele picture "@*CB 102a" size 1.6,20.1 DEFAULT sele VALID km1()
store 13.1 to col1
store 8.3 to row1
@4,33 say ""
do he-hlhl
aba1=1
aba4=0
do while .t.
set colo to /b+
@4.25,35.5 say "批量修改"FONT "宋体",10 ;
colo rgb(255,255,255,,,)
set colo to /w+
@5.3,33.5 GET aba1 FROM A FONT "宋体",12 RANGE 1,I FUNCTION "&T" ;
DEFAULT aba1 SIZE 6.5,12.1 color,n+/bg+,,,,r+/b+
@4.2,44.05 get aba4 picture "@*TCB X" size 0.96,1.91 ;
DEFAULT aba3 VALID km1()
read
if aba4=1
exit
endif

store a(aba1) to okok   &&名称
store a1(aba1) to q1m   &&字段名
store a2(aba1) to gsm   &&公式
*********************   &&自动套用公式选择
store 2 to ags          
if empty(gsm)=.t.
store 1 to ags          
endif
********************
use &gg
store &a1(aba1) to ghg1 &&库中原有的数据送出
store 0 to aba2
do gzdy
if aba2=1.and.ags=1                      &&不用公式计算批量
repl all &q1m with ghg1 for subs(bm,1,8)<>"退休人员"
endif
if ags=2.and.aba2=1.and.empty(gsm)=.f.   &&用公式计算批量
repl all &q1m with &gsm
endif
sum &q1m to ghg2
use gzdy
loca for pl1=okok
repl sj with ghg2
enddo
do mm
set clock off
return

