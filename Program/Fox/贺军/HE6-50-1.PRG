set talk off
do mm
*@7,38 clear to 15,52
store 14 to col1
store 8 to row1
@6.5,37 say ""
do he-hlhl
set colo to /b+
@6.7,38.5 say "年 初 清 理"FONT"宋体",10 color rgb(255,255,255,,,)
set colo to /w+
@ 8,38 say "   注  意"FONT"宋体",12 color rgb(0,0,0,,,)
@10,38 say "除卡片库月报"FONT"宋体",12 color rgb(0,0,0,,,)
@11,38 say "库存在其它库"FONT"宋体",12 color rgb(0,0,0,,,)
@12,38 say "全部被清除。"FONT"宋体",12 color rgb(0,0,0,,,)
ax1=0
aba3=0
@13.5,40 get ax1 FUNCTION "*TH OK" SIZE 1.3,9 ;
FONT"宋体",12 COLOR RGB(255,255,255,,,,)
@6.7,48.85 get aba3 picture "@*TCB X" size 0.96,1.91
read
if aba3=1
return
endif
@7,38 clear to 15,52
@10,39 say "   稍  等..."FONT"宋体",12
store gg to ggx
axx=1
sele 3
use \xsk\&y\fox1-99
do while .not.eof()
sele 3
store "hy"+chr(96+axx) to gg
ax0=yk10
if he0="  "
store ggx to gg
exit
endif
sele 1
use \xsk\&y\&gg
sum t13 to ax1
use \xsk\&y\&gg-h
zap
use \xsk\&y\&gg-h
appe blan
repl 本库存总额 with ax1,上库存总额 with ax1,;
本日报日期 with "&y"+"01"+"01",本月总额 with ax1,;
上月总额 with ax1,本月报日期 with "00"+"00"
ax1=1
do while ax1<=3
ax=str(ax1,1)
use \xsk\&y\&gg-&ax &&檫六种料单库
zap
ax1=ax1+1
enddo
use \xsk\&y\&gg-d &&檫动态库
zap
use \xsk\&y\&gg-t &&檫调价库
zap
use \xsk\&y\&gg-r &&檫日报库
zap
use \xsk\&y\&gg-y &&变换月报库
zap 
sele 3
skip 
axx=axx+1
enddo
do mm
return

