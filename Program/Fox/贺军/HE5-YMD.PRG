set colo to w+/b+
@3,25 say "┌──────────"
@4,25 say "│"
@5,25 say "│"
@6,25 say "↓" 
set colo to /n
@8,17 clear to 13,39
set colo to gr+/bg+,r+/b+,gr+
@7,15 clear to 12,37
yx=str((((val(y)*100)+val(m))*100+val(d)),6)
use &gg-h
store 本日报日期 to yp
use
do while .t.
@8,16 say "料单开始日期:" get yp
@9,16 say "料单结束日期:" get yx
read
ax1=" "
@11,16 say "   正确吗?(Y/N/0)" get ax1
read
if ax1<>"n"
exit
endif
enddo
if ax1="0"
return
endif
