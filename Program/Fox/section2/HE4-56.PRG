set talk off
do mm
store dd to dok
store gg to gok
aba3=0
do hex-52
if aba3=1
return
endif
do while .t.
yx=str(((val(subs(y,3,2))*100)+val(m)),4)
*set colo to /b+
*@24,60 clear
use \xsk\&y\&gg-h
store a7 to yz
store a6 to ax0 
store a5 to ax1
if ax0=ax1.and.yz=subs(yx,1,4)
@10,57 say "【 本月数据没有输入 】"FONT"宋体",12
wait ""
loop
endif
store 22.6 to col1
store 6.6 to row1
@7.3,55.3 say ""
do he-hhll
store 4 to col1
store 0 to row1
@8,71 say ""
do he-llhh
store 4 to col1
store 0 to row1
@10,71 say ""
do he-llhh
set colo to w+/7+
@ 8,57 say "上次月报日期:"FONT"宋体",12
@ 8,71 say yz FONT"宋体",12
set colo to gr+/7+
@10,57 say "本次月报日期:"FONT"宋体",12
@10,71 get yx FONT"宋体",12 size 0.85,4
aba=1
@12.3,57 get aba FUNCTION "*TH 确定;退出" SIZE 1.5,9.2 ;
COLOR RGB(255,255,255,,,,)FONT"宋体",12
read
if yx<=yz
@8,57 say "日期输入错误"FONT"宋体",12
@11,57 say "本月报已统计"FONT"宋体",12
wait ""
exit
endif



if aba=2
exit
endif

use \xsk\&y\r-r &&月报临时库
zap
ax1=1
axz=0
do while .t.
do case
case ax1=1
aa3="A.入库单"
case ax1=2
aa3="B.退料单"
case ax1=3
aa3="D.发库单"
case ax1=4
exit
endcase
store str(ax1,1) to ax
use \xsk\&y\&gg-&ax
inde on t5 to &gg-xt5 for val(subs(t5,1,4))>;
val(subs(yz,1,4)).and.val(subs(t5,1,4))<=val(yx)
store t10 to aa1        &&类别
store yx to aa2         &&日期
sum t8,t15 to aa5,aa7   &&本月金额,调整金额
count to aa4            &&次数
use \xsk\&y\&gg-h
store a6 to aa6 &&上月库存金额
store a5 to aa8
use \xsk\&y\r-r
appe blan
repl a1 with aa1,a2 with aa2,a3 with aa3,a4 with aa4,;
a5 with aa5,a6 with aa6,a7 with aa7,a8 with aa8
ax1=ax1+1
enddo
set colo to n+/b+
clear
STORE 78 TO COL1
STORE 13 TO ROW1
@3,1 SAY ""
DO HE-HHHH
@ 3,1 say "┏━┳━━━┳━━━━┳━┳━━━━━;
┳━━━━━━┳━━━━┳━━━━━━┓"FONT"宋体",12
@ 4,1 say "┃类┃月  报┃收    发┃次┃本      月;
┃  上    月  ┃调    整┃  本    月  ┃"FONT"宋体",12
@ 5,1 say "┃别┃日  期┃凭    证┃数┃金      额;
┃  库存总额  ┃金  额┃  库存金额  ┃"FONT"宋体",12
@ 6,1 say "┣━╋━━━╋━━━━╋━╋━━━━━;
╋━━━━━━╋━━━━╋━━━━━━┫"FONT"宋体",12
@ 7,1 say "┃  ┃      ┃        ┃  ┃          ;
┃            ┃      ┃            ┃"FONT"宋体",12
@ 8,1 say "┃  ┃      ┣━━━━╋━╋━━━━━;
┫            ┃      ┃          ┃"FONT"宋体",12
@ 9,1 say "┃  ┃      ┃        ┃  ┃          ;
┃            ┃      ┃            ┃"FONT"宋体",12
@10,1 say "┃  ┃      ┣━━━━╋━╋━━━━━;
┫            ┃      ┃            ┃"FONT"宋体",12
@11,1 say "┃  ┃      ┃        ┃  ┃          ;
┃            ┃      ┃            ┃"FONT"宋体",12
@12,1 say "┃  ┃      ┣━━━━╋━╋━━━━━;
┫            ┃      ┃            ┃"FONT"宋体",12
@13,1 say "┃┃┃        ┃┃;
┃┃┃┃"FONT"宋体",12
@14,1 say "┃┃┣━━━━╋━╋━━━━━;
┫┃┃┃"FONT"宋体",12
@15,1 say "┃  ┃      ┃        ┃  ┃          ;
┃            ┃      ┃            ┃"FONT"宋体",12
@16,1 say "┗━┻━━━┻━━━━┻━┻━━━━━;
┻━━━━━━┻━━━━┻━━━━━━┛"FONT"宋体",12
use \xsk\&y\r-r
sum a7 to as7 &&六种料单调价相加
use \xsk\&y\r-r
set colo to w+/bg+
@7,8 say a2 FONT"宋体",12
@7,43 say str(a6,10,2) FONT"宋体",12
@7,56 say str(as7,7,2) FONT"宋体",12
@7,66 say str(a8,10,2) FONT"宋体",12
store 7 to xl
ax1=0
do while .not.eof()
set colo to w+/bg+
@xl,15 say a3 FONT"宋体",12
@xl,25 say str(a4,2) FONT"宋体",12
@xl,29 say a5 FONT"宋体",12
ax1=ax1+a5
if xl=9
xl=xl+2
set colo to r+/bg+
@xl,15 say "小    计" FONT"宋体",12
@xl,29 say str(ax1,10,2) FONT"宋体",12&&前三项相加显示
store ax1 to ax0         &&前三项保存
ax1=0
endif
skip
xl=xl+2
enddo
set colo to r+/bg+,gr+/bg+
@xl,15 say "小    计"FONT"宋体",12
@xl,29 say str(ax1,10,2) FONT"宋体",12&&后三项相加显示
use \xsk\&y\r-r
store (a6+ax0-ax1)+as7-a8 to az
store 27 to col1
store 0 to row1
@20,26 say ""
do he-hhh
@20,26 say "【 最后运算结果 】="+str(az,8,2) FONT"宋体",12
if az>0.1.or.az<-0.1
set colo to w+/bg+
store 27 to col1
store 0 to row1
@22.8,26 say ""
do he-hhh


@22.8,30 say "错 误!!!  任一键退出"FONT"宋体",12
wait ""
@24,0 CLEAR TO 26.3,80
exit
endif
aba=2
@22.5,30 get aba FUNCTION "*TH 确定;退出" SIZE 1.5,9.2 ;
COLOR RGB(255,255,255,,,,)FONT"宋体",10
read
if aba=2
exit
endif
use \xsk\&y\&gg-h
store a5 to ax1
repl a6 with ax1
repl a7 with yx
*use \xsk\&y\&gg-yt
*repl t1 with yx,t2 with as7,t3 with az,t5 with as7+az
do mm
sele 1
use \xsk\&y\&gg-y
sele 2
use \xsk\&y\r-r
do while .not.eof()
sele 2
store a1 to aa1
store a2 to aa2
store a3 to aa3
store a4 to aa4
store a5 to aa5
store a6 to aa6
store a7 to aa7
store a8 to aa8
sele 1
appe blan
repl a1 with aa1,a2 with aa2,a3 with aa3,a4 with aa4,;
a5 with aa5,a6 with aa6,a7 with aa7,a8 with aa8
sele 2
skip
enddo
enddo
do mm
store dok to dd
store gok to gg
use \xsk\&y\fox1-99
repl yk10 with dd
go 2
repl yk10 with gg
use
if aba3<>1
close data
keyb "" +chr(13)
endif
return

