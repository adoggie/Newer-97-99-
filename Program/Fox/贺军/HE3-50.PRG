set talk off
do mm
use &gg-hz
count to ai
dime a(ai)
dime a1(ai)
FOR I=1 TO Ai
use &gg-hz
go i
store subs(bm,1,8) to ma1
store str(qch,4) to ma2
store (a01+a02+a03+a04+a05+a06+a07+a08+a09+a11+a12+a13+;
a14+a15+a16) to ma3
store str(ma3,12,2) to ma3
store (b01+b02+b04+b05+b06+b07+c01+c02+c04+q01+q02+q03) to ma4
store str(ma4,12,2) to ma4
store (a01+a02+a03+a04+a05+a06+a07+a08+a09+a11+a12+a13+;
a14+a15+a16)-(b01+b02+b04+b05+b06+b07+c01+c02+c04+q01+q02+q03) to ma5
store str(ma5,12,2) to ma5
store "  "+ma1+"   | "+ma2+"   | "+ma3+"   | "+ma4+"   | "+ma5 to a(i)
store allt(bm) to a1(i)
ENDF
use &gg-hz
store ymd to mymd
loca for bm="全 公 司"
store recno() to CHOI1

use
do while .t.
aba3=0
sele=0
store 77.5 to col1
store 19.2 to row1
@4.8,1 say ""
do he-hlhl
set colo to /b+
@5.05,33 say "工资汇总查询"FONT "宋体",10 color rgb(255,255,255,,,)
@6.4,76.4 say mymd FONT "宋体",10 color rgb(255,255,255,,,)
set colo to /w+

@6.25,3 say " 部    门     人  数     应 发 部 分;
      应 扣 部 分      实 发 金 额"FONT "宋体",12 color rgb(0,0,0,,,)
@ 6.2,15.05 TO 7.5,15.05 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@ 6.2,24.05 TO 7.5,24.05 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@ 6.2,41.05 TO 7.5,41.05 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@ 6.2,58.05 TO 7.5,58.05 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@ 6.2,76.1 TO 7.5,76.1 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)

@7.5,1.4 GET CHOI1 FROM A FONT "宋体",12 RANGE 1,I FUNCTION "&T" ;
DEFAULT CHOI1 SIZE 14.58,76.6 VALID mm() color,n+/bg+,,,,r+/b+
@1.65,0.8 get sele picture "@*CB 102gz" size 3,78.2 DEFAULT sele VALID km5()
@5,76.4 get aba3 picture "@*TCB X" size 0.96,1.91 ;
DEFAULT aba3 VALID km1()
read
if aba3=1
exit
endif


store 78 to col1
store 22.5 to row1
@1.7,1 say ""
do he-hlhl
@2.95,37 TO 25.05,37 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@2.95,37.1 TO 25.05,37.1 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
@2.95,37.2 TO 25.05,37.2 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
store 24 to col1
store 0 to row1
@3.5,12 say ""
do he-llhh
store 10.2 to col1
store 0 to row1
@5,12 say ""
do he-llhh
store 10 to col1
store 0 to row1
@3.5,47.2 say ""
do he-llhh
store 10 to col1
store 0 to row1
@4.7,47.2 say ""
do he-llhh
store 10 to col1
store 0 to row1
@5.9,47.2 say ""
do he-llhh
store 10 to col1
store 0 to row1
@7.1,47.2 say ""
do he-llhh
store 10 to col1
store 0 to row1
@8.3,47.2 say ""
do he-llhh
store 10 to col1
store 0 to row1
@9.5,47.2 say ""
do he-llhh
store 10 to col1
store 0 to row1
@10.7,47.2 say ""
do he-llhh
store 10 to col1
store 0 to row1
@11.9,47.2 say ""
do he-llhh
store 10 to col1
store 0 to row1
@13.1,47.2 say ""
do he-llhh
store 10 to col1
store 0 to row1
@14.3,47.2 say ""
do he-llhh
store 10 to col1
store 0 to row1
@15.5,47.2 say ""
do he-llhh
store 10 to col1
store 0 to row1
@16.7,47.2 say ""
do he-llhh
store 10 to col1
store 0 to row1
@17.9,47.2 say ""
do he-llhh
store 10 to col1
store 0 to row1
@19.1,47.2 say ""
do he-llhh
store 10 to col1
store 0 to row1
@20.3,47.2 say ""
do he-llhh
store 10 to col1
store 0 to row1
@23.5,47.2 say ""
do he-llhh

store 10 to col1
store 0 to row1
@3.5,67.9 say ""
do he-llhh
store 10 to col1
store 0 to row1
@4.7,67.9 say ""
do he-llhh
store 10 to col1
store 0 to row1
@5.9,67.9 say ""
do he-llhh
store 10 to col1
store 0 to row1
@7.1,67.9 say ""
do he-llhh
store 10 to col1
store 0 to row1
@8.3,67.9 say ""
do he-llhh
store 10 to col1
store 0 to row1
@9.5,67.9 say ""
do he-llhh
store 10 to col1
store 0 to row1
@10.7,67.9 say ""
do he-llhh
store 10 to col1
store 0 to row1
@11.9,67.9 say ""
do he-llhh
store 10 to col1
store 0 to row1
@13.1,67.9 say ""
do he-llhh
store 10 to col1
store 0 to row1
@14.3,67.9 say ""
do he-llhh
store 10 to col1
store 0 to row1
@15.5,67.9 say ""
do he-llhh
store 10 to col1
store 0 to row1
@16.7,67.9 say ""
do he-llhh
store 10 to col1
store 0 to row1
@17.9,67.9 say ""
do he-llhh
store 10 to col1
store 0 to row1
@19.1,67.9 say ""
do he-llhh
store 10 to col1
store 0 to row1
@20.3,67.9 say ""
do he-llhh
store 10 to col1
store 0 to row1
@23.5,67.9 say ""
do he-llhh
store 0 to aba4
use &gg-hz
go choi1
do while .t.
store 0 to aba2,aba3,sr,kq
set colo to g+/b
@ 1.95,31 say " 汇   总   查   询 "FONT "宋体",10 color rgb(255,255,255,,,)
set colo to /w+
@3.5,2 say "部    门:"FONT "宋体",12 color rgb(0,0,0,,,)
@5,2 say "人    数:"FONT "宋体",12 color rgb(0,0,0,,,)
@6.5,2 say "日    期:"FONT "宋体",12 color rgb(0,0,0,,,)
@6.5,12 say "   年   月"FONT "宋体",12 color rgb(0,0,0,,,)
store 2 to col1
store 0 to row1
@6.5,12 say ""
do he-llhh
store 2 to col1
store 0 to row1
@6.5,17 say ""
do he-llhh
@6.5,12 say subs(y,3,2)FONT "宋体",12 color rgb(255,255,255,,,)
@6.5,17 say mymd FONT "宋体",12 color rgb(255,255,255,,,)
@3.5,12 say subs(xm,1,8)+"_"+subs(bm,1,8) FONT "宋体",12 color rgb(255,255,255,,,)
@5,14 say str(qch,6) FONT "宋体",12 color rgb(255,255,255,,,)
@3.5,38 say '基    薪:'FONT "宋体",12 color rgb(0,0,0,,,)
@3.5,47.2 say str(a01,10,2) FONT "宋体",12 color rgb(255,255,255,,,)
@4.7,38 say '浮    动:'FONT "宋体",12 color rgb(0,0,0,,,)
@4.7,47.2 say str(a02,10,2) FONT "宋体",12 color rgb(255,255,255,,,)
@5.9,38 say '工 龄 贴:'FONT "宋体",12 color rgb(0,0,0,,,)
@5.9,47.2 say str(a04,10,2) FONT "宋体",12 color rgb(255,255,255,,,)
@7.1,38 say '副 食 贴:'FONT "宋体",12 color rgb(0,0,0,,,)
@7.1,47.2 say str(a03,10,2) FONT "宋体",12 color rgb(255,255,255,,,)
@8.3,38 say '岗 位 贴:'FONT "宋体",12 color rgb(0,0,0,,,)
@8.3,47.2 say str(a05,10,2) FONT "宋体",12 color rgb(255,255,255,,,)
@9.5,38 say '洗 理 费:'FONT "宋体",12 color rgb(0,0,0,,,)
@9.5,47.2 say str(a06,10,2) FONT "宋体",12 color rgb(255,255,255,,,)
@10.7,38 say '房    贴:'FONT "宋体",12 color rgb(0,0,0,,,)
@10.7,47.2 say str(a07,10,2) FONT "宋体",12 color rgb(255,255,255,,,)
@11.9,38 say '水 电 贴:'FONT "宋体",12 color rgb(0,0,0,,,)
@11.9,47.2 say str(a08,10,2) FONT "宋体",12 color rgb(255,255,255,,,)
@13.1,38 say '独 生 费:'FONT "宋体",12 color rgb(0,0,0,,,)
@13.1,47.2 say str(a09,10,2) FONT "宋体",12 color rgb(255,255,255,,,)
@14.3,38 say '郊    补:'FONT "宋体",12 color rgb(0,0,0,,,)
@14.3,47.2 say str(a11,10,2) FONT "宋体",12 color rgb(255,255,255,,,)
@15.5,38 say '书 报 费:'FONT "宋体",12 color rgb(0,0,0,,,)
@15.5,47.2 say str(a12,10,2) FONT "宋体",12 color rgb(255,255,255,,,)
@16.7,38 say '交 通 费:'FONT "宋体",12 color rgb(0,0,0,,,)
@16.7,47.2 say str(a13,10,2) FONT "宋体",12 color rgb(255,255,255,,,)
@17.9,38 say '小 修 贴:'FONT "宋体",12 color rgb(0,0,0,,,)
@17.9,47.2 say str(a14,10,2) FONT "宋体",12 color rgb(255,255,255,,,)
@19.1,38 say '补养老金:'FONT "宋体",12 color rgb(0,0,0,,,)
@19.1,47.2 say str(a15,10,2) FONT "宋体",12 color rgb(255,255,255,,,)
@20.3,38 say '其它津贴:'FONT "宋体",12 color rgb(0,0,0,,,)
@20.3,47.2 say str(a16,10,2) FONT "宋体",12 color rgb(255,255,255,,,)
store a01+a02+a03+a04+a05+a06+a07+a08+a09;
+a11+a12+a13+a14+a15+a16 to sr
set colo to g+/w+
@23.5,38 say "发出合计:"FONT "宋体",12
@23.5,47.2 say str(sr,10,2) FONT "宋体",12

@3.5,58.7 say '房    租:'FONT "宋体",12 color rgb(0,0,0,,,)
@3.5,67.9 say str(b01,10,2) FONT "宋体",12 color rgb(255,255,255,,,)
@4.7,58.7 say '医 疗 费:'FONT "宋体",12 color rgb(0,0,0,,,)
@4.7,67.9 say str(b04,10,2) FONT "宋体",12 color rgb(255,255,255,,,)
@5.9,58.7 say '储蓄每月:'FONT "宋体",12 color rgb(0,0,0,,,)
@5.9,67.9 say str(b05,10,2) FONT "宋体",12 color rgb(255,255,255,,,)
@7.1,58.7 say '扣养老金:'FONT "宋体",12 color rgb(0,0,0,,,)
@7.1,67.9 say str(c01,10,2) FONT "宋体",12 color rgb(255,255,255,,,)
@8.3,58.7 say '公 积 金:'FONT "宋体",12 color rgb(0,0,0,,,)
@8.3,67.9 say str(c02,10,2) FONT "宋体",12 color rgb(255,255,255,,,)
@9.5,58.7 say '电 话 费:'FONT "宋体",12 color rgb(0,0,0,,,)
@9.5,67.9 say str(c04,10,2) FONT "宋体",12 color rgb(255,255,255,,,)
@10.7,58.7 say '工 会 费:'FONT "宋体",12 color rgb(0,0,0,,,)
@10.7,67.9 say str(b02,10,2) FONT "宋体",12 color rgb(255,255,255,,,)
@11.9,58.7 say '病 事 假:'FONT "宋体",12 color rgb(0,0,0,,,)
*@11,9,67.9 say str(b01,10,2) FONT "宋体",12 color rgb(255,255,255,,,)
@13.1,58.7 say "个 调 税:"FONT "宋体",12 color rgb(0,0,0,,,)
@13.1,67.9 say str(b06,10,2) FONT "宋体",12 color rgb(255,255,255,,,)
@14.3,58.7 say "其它扣除:"FONT "宋体",12 color rgb(0,0,0,,,)
@14.3,67.9 say str(b07,10,2) FONT "宋体",12 color rgb(255,255,255,,,)
@15.5,58.7 say "当月信息1"FONT "宋体",12 color rgb(0,0,0,,,)
@15.5,67.9 say str(q01,10,2) FONT "宋体",12 color rgb(255,255,255,,,)
@16.7,58.7 say "当月信息2"FONT "宋体",12 color rgb(0,0,0,,,)
@16.7,67.9 say str(q02,10,2) FONT "宋体",12 color rgb(255,255,255,,,)
@17.9,58.7 say "当月信息3"FONT "宋体",12 color rgb(0,0,0,,,)
@17.9,67.9 say str(q03,10,2) FONT "宋体",12 color rgb(255,255,255,,,)
store b01+b02+b04+b05+c01+c02+c04+b06+b07+q01+q02+q03 to kq
set colo to g+/w+
@23.5,58 say "扣除合计:"FONT "宋体",12
@23.5,67.9 say str(kq,10,2) FONT "宋体",12
store sr-kq to sf
set colo to g+/w+
store 10 to col1
store 0 to row1
@13,12 say ""
do he-llhh
@13,2 say "工资实发:"FONT "宋体",12
@13,12 say str(sf,10,2) FONT "宋体",12
@19.5,8.5 get aba2 picture "@*BH sy;xy" size 1.9,8,2.5 ;
DEFAULT sele VALID km()
@1.9,76.9 get aba4 picture "@*TCB X" size 0.96,1.91
read

do case
case aba4=1
exit
case aba2=1
skip -1
if recno()=1
go ai
endif
loop
case aba2=2
skip
if eof()
go choi1
endif
loop
endcase

enddo
if aba3=1
exit
endif
set colo to /bg+
@1.5,0 clear to 25,80
enddo






set colo to /bg+
clear
return

