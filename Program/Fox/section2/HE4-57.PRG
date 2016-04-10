set talk off
do mm
yx=str(((val(subs(y,3,2))*100)+val(m)),4)
store 22.6 to col1
store 4.6 to row1
@8.3,10.3 say ""
do he-hlhl
store 0 to aba,aba3
set colo to r+/b+
@8.55,15 say "收 发 存 月 报"FONT"宋体",10 COLOR RGB(255,255,255,,,,)
set colo to w+/7
@10,12 say "输入统计日期:"FONT"宋体",12
*@10,70 get yx FONT"宋体",12 size 0.85,4
store floor(val(yx)) to ym
@10,26 get ym spinner 1,9801,9912 FONT "宋体",12 ;
size 1.2,4 COLOR,,,,,w+/n+,r+/bg+,gr+/g+
@8.5,30.8 get aba3 picture "@*TCB X" size 0.96,1.91 ;
DEFAULT aba3 VALID km1()
@12,17 get aba FUNCTION "*TH 确定" SIZE 1.3,9.2 ;
COLOR RGB(255,255,255,,,,)FONT"宋体",12
read
if aba3=1
return
endif
store str(ym,4) to yx
use \xsk\&y\&gg-1
loca for t5=yx
if eof()
set colo to r+/b+
@8.55,12 say "本月数据没输入...退出!"FONT"宋体",10
wait ""
return
endif
use \xsk\&y\&gg-cpml
repl all ycjc with 0,rkby with 0,rklj with 0,fcby with 0,;
fclj with 0,ymjc with 0
use \xsk\&y\&gg-123
zap
use \xsk\&y\&gg-1
inde on t1+t5 to syt1 for subs(t5,1,4)<=yx
tota to \xsk\&y\&gg-123 on t1 fiel t1,t6  &&入库累计
sele 2
use \xsk\&y\&gg-123
do while .not.eof()
store t1 to cp
store t6 to ym6
sele 3
use \xsk\&y\&gg-cpml
loca for he0=cp
repl rklj with ym6
sele 2
skip
enddo
do mm
use \xsk\&y\&gg-3
inde on t1+t5 to syt1 for subs(t5,1,4)<=yx
tota to \xsk\&y\&gg-123 on t1 fiel t1,t6  &&发出累计
sele 2
use \xsk\&y\&gg-123
do while .not.eof()
store t1 to cp
store t6 to ym6
sele 3
use \xsk\&y\&gg-cpml
loca for he0=cp
repl fclj with ym6
sele 2
skip
enddo
do mm
use \xsk\&y\&gg-1
inde on t1+t5 to syt1 for subs(t5,1,4)=yx
tota to \xsk\&y\&gg-123 on t1 fiel t1,t6  &&入库本月
sele 2
use \xsk\&y\&gg-123
do while .not.eof()
store t1 to cp
store t6 to ym6
sele 3
use \xsk\&y\&gg-cpml
loca for he0=cp
repl rkby with ym6
sele 2
skip
enddo
do mm
use \xsk\&y\&gg-3
inde on t1+t5 to syt1 for subs(t5,1,4)=yx
tota to \xsk\&y\&gg-123 on t1 fiel t1,t6  &&发出本月
sele 2
use \xsk\&y\&gg-123
do while .not.eof()
store t1 to cp
store t6 to ym6
sele 3
use \xsk\&y\&gg-cpml
loca for he0=cp
repl fcby with ym6
sele 2
skip
enddo
do mm
use \xsk\&y\&gg-cpml
repl ymd with yx
repl all ymjc with rklj-fclj,ycjc with ymjc-rkby+fcby
set colo to /bg+
@3,0 clear to 25,35
return