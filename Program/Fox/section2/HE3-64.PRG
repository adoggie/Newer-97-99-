set talk off
use \xsk\&y\&gg-r
inde on a2 to ra2
total to ok on a2
use \xsk\&y\ok
ax1=2
set colo to gr+/bg+
@2,0 clear
@ax1,30 say "已经统计过的月报时间"FONT"宋体",12
ax1=3
set colo to w+/bg+
do while .not.eof()
@ax1,34 say subs(a2,1,2)+"年"+subs(a2,3,2)+"月"+subs(a2,5,2)+"日" FONT"宋体",12
skip
if ax1>=23.or.eof()
set colo to r+/bg+
@24,33 say "按任一键.继续..."FONT"宋体",12
wait ""
@3,0 clear
set colo to w+/b+
ax1=3
loop
endif
ax1=ax1+1
enddo
return

