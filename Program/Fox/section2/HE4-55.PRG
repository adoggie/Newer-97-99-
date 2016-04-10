set talk off
set cons on
do mm
store dd to dok
store gg to gok
aba3=0
do hex-52
if aba3=1
return
endif
do while .t.
yx=str((((val(subs(y,3,2))*100)+val(m))*100+val(d)),6)
set colo to /b+
*@24,60 clear
use \xsk\&y\&gg-h
store a4 to yz
store a3 to ax0 
store a2 to ax1
if ax0=ax1.and.yx=yz
@10,57 say "【 料单数据没有输入 】"FONT"宋体",12
wait ""
loop
endif
store 22.6 to col1
store 6.6 to row1
@7.3,55.3 say ""
do he-hhll
store 6 to col1
store 0 to row1
@8,70 say ""
do he-llhh
store 6 to col1
store 0 to row1
@10,70 say ""
do he-llhh
set colo to w+/7
@ 8,57 say "上次日报日期"FONT"宋体",12
@ 8,70 say "&yz"FONT"宋体",12
set colo to gr+/7
@10,57 say "本次日报日期"FONT"宋体",12
@10,70 get yx FONT"宋体",12 size 0.85,6
aba=1
@12.3,57 get aba FUNCTION "*TH 确定;退出" SIZE 1.5,9.2 ;
COLOR RGB(255,255,255,,,,)FONT"宋体",12
read
if yx<=yz
@8,57 say "日期输入错误"FONT"宋体",12 COLOR RGB(0,0,0,,,)
@10,57 say "本日报已统计"FONT"宋体",12 COLOR RGB(0,0,0,,,)
wait ""
exit
endif
if aba=2
exit
endif

use \xsk\&y\r-r &&日报临时库
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
aa3="D.发货单"
case ax1=4
exit
endcase
store str(ax1,1) to ax
use \xsk\&y\&gg-&ax
inde on t5 to &gg-xt5 for (val(subs(t5,1,4))>val(subs(yz,1,4));
.and.val(t5)<=val(yx));
.or.(val(subs(t5,1,4))=val(subs(yz,1,4));
.and.val(subs(t5,5,2))>val(subs(yz,5,2));
.and.val(t5)<=val(yx))

store t10 to aa1        &&类别
store yx to aa2         &&日期
sum t8,t15 to aa5,aa7   &&本日金额,调整金额
count to aa4            &&次数
use \xsk\&y\&gg-h
store a3 to aa6 &&上日库存金额
store a2 to aa8
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
*store subs(ykyk,6,2) to k
*store subs(ykyk,8,2) to i
*store subs(ykyk,10,2) to o
*store subs(ykyk,12,2) to j
@ 3,1 say "┏━┳━━━┳━━━━┳━┳━━━━━;
┳━━━━━━┳━━━━┳━━━━━━┓"FONT"宋体",12
@ 4,1 say "┃类┃填  单┃收    发┃次┃本      月;
┃  上    日  ┃调    整┃  本    日  ┃"FONT"宋体",12
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
@13,1 say "┃  ┃┃┃┃;
┃┃┃┃"FONT"宋体",12
@14,1 say "┃  ┃┣━━━━╋━╋━━━━━;
┫┃┃┃"FONT"宋体",12
@15,1 say "┃  ┃      ┃        ┃  ┃          ;
┃            ┃      ┃            ┃"FONT"宋体",12
@16,1 say "┗━┻━━━┻━━━━┻━┻━━━━━;
┻━━━━━━┻━━━━┻━━━━━━┛"FONT"宋体",12

use \xsk\&y\r-r
sum a7 to as7 &&六种料单调价相加
use \xsk\&y\r-r
set colo to w+/bg+
@7,7 say a2 FONT"宋体",12
@7,41 say str(a6,12,2) FONT"宋体",12
@7,56 say str(as7,7,2) FONT"宋体",12
@7,65 say str(a8,12,2) FONT"宋体",12
store 7 to xl
ax1=0
do while .not.eof()
set colo to w+/bg+
@xl,15 say a3 FONT"宋体",12
@xl,25 say str(a4,3) FONT"宋体",12
@xl,29 say a5 FONT"宋体",12
ax1=ax1+a5
if xl=9
xl=xl+2
set colo to r+/bg+
@xl,15 say "收入小计"FONT"宋体",12
@xl,29 say str(ax1,10,2) FONT"宋体",12&&前三项相加显示
store ax1 to ax0       &&前三项保存
ax1=0
endif
skip
xl=xl+2
enddo
set colo to r+/bg+,gr+/bg+
@xl,15 say "发出小计"FONT"宋体",12
@xl,29 say str(ax1,10,2) FONT"宋体",12&&后三项相加显示
use \xsk\&y\r-r
az=0.00
sele 6
use \xsk\&y\&gg
sum t13 to aok
use
use \xsk\&y\r-r
store aok-((a6+ax0-ax1)+as7) to aaok
store (a6+ax0-ax1)+as7-a8 to az
store aaok+a8 to abok
if aaok<>0.00
store as7+aaok to as7
store a8+aaok to qa8
@7,56 say str(as7,7,2) FONT"宋体",12
@7,65 say str(qa8,12,2) FONT"宋体",12
*store aaok+az to az
endif
store 27 to col1
store 0 to row1
@20,26 say ""
do he-hhh
set colo to g+/bg+
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
assa=" "
asas="            " 

if as7<>0
do while .t.
set colo to w+/bg+
@9,46 clear to 13,71
@10,48 say "调价原因:"FONT"宋体",12
@10,58 get asas FONT"宋体",12
read
@12,52 say "正确吗?(Y/N/0)" get assa FONT"宋体",12
read
if assa="y".or.assa="Y".or.assa="0"
exit
endif
enddo
endif

if assa="0"
exit
endif
use \xsk\&y\&gg-h
store a2 to ax1
repl a3 with ax1+aaok
repl a2 with ax1+aaok
repl a5 with ax1+aaok
repl a4 with yx
sele 6
*? &ax
*wait
store "4" to ax
use \xsk\&y\&gg-&ax
inde on t5 to &gg-xt5 for (val(subs(t5,1,4))>val(subs(yz,1,4));
.and.val(t5)<=val(yx));
.or.(val(subs(t5,3,2))=val(subs(yz,3,2));
.and.val(subs(t5,5,2))>val(subs(yz,5,2));
.and.val(t5)<=val(yx))


do while .not.eof()
store t1 to aa1 &&卡片号
store t2 to aa2 &&名称
store t3 to aa3 &&现计划单价
store t4 to aa4 &&
store t5 to aa5 &&日期
store t6 to aa6 &&数量
store t8 to aa8 &&原结存金额
store t9 to aa9
store t10 to aa10
store t11 to aa11
store t12 to aa12
store t13 to aa13
store t14 to aa14
store t15 to aa15
store t16 to aa16
sele 5
use \xsk\&y\&gg-t
repl t1 with aa1,t2 with aa2,t3 with aa3,t4 with aa4,;
t5 with aa5,t6 with aa6,t8 with aa8,t9 with aa9
repl t10 with aa10,t11 with aa11,t12 with aa12,t13 with aa13,;
t14 with aa14,t15 with aa15,t16 with aa16,bz with asas
sele 6
skip
enddo

sele 5
use \xsk\&y\&gg-t
appe blan
repl t1 with "日  报",t5 with yx,t15 with as7+az+aaok,;
bz with asas
do mm
sele 1
use \xsk\&y\&gg-r
sele 2
use \xsk\&y\r-r

go 3
repl a7 with aaok
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
store a8+aaok to aa8
sele 1

appe blan
repl a1 with aa1,a2 with aa2,a3 with aa3,a4 with aa4,;
a5 with aa5,a6 with aa6,a7 with aa7,a8 with aa8,bz with asas
sele 2
skip
enddo
do mm
use \xsk\&y\&gg-d
zap
enddo
set colo to /bg+
clear
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