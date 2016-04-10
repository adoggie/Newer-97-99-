set talk off
do mm
set colo to w+/b+
@6,25 say "┌──────────"
@7,25 say "↓" 
set colo to /n
@9,17 clear to 14,39
set colo to gr+/bg+,r+/b+,gr+
@8,15 clear to 13,37
yx=str((((val(y)*100)+val(m))*100+val(d)),6)
use &gg-h
store 本日报日期 to yp
use
do while .t.
@9,16 say "料单开始日期:" get yp
@10,16 say "料单结束日期:" get yx
read
ax1=" "
@12,16 say "   正确吗?(Y/N/0)" get ax1
read
if ax1<>"n"
exit
endif
enddo
if ax1="0"
return
endif
mnb=" "
do pprint
@15,27 get mnb
read
if mnb="0"
do cl-aff
return
endif
set cons on
zw=8
@6,11 clear to 16,28
mnb=" "
zzw=1
store dd to okd
store gg to okg
store 1 to nx
do he0
if nx=100
return
endif
do print
use &gg-1
inde on t5 to sy1 for val(t5)>=val(yp).and.val(t5)<=val(yx)
x=1
do prt1
@x,44 say "    东航飞机维修基地龙华地面设备部"
x=x+2
do prt2
@x,46 say "      === 收料单名细表 ==="
@x+1,46 say "          ------------"
@x+2,46 say "     日期: &y 年 &m 月 &d 日"
x=x+3
dbx="└───┴─────────────;
┴─────────────┴─────┴─────;
┴─────┴──────┴──────┘"
dby="├───┼─────────────;
┼─────────────┼─────┼─────;
┼─────┼──────┼──────┤"
use &gg-1 inde sy1
xok=1
do while .not.eof()
@x,0 say dd
@x,121 say "第"+str(xok,3)+" 页"
x=x+1
@x,0 say "┌───┬─────────────;
┬─────────────┬─────┬─────;
┬─────┬──────┬──────┐"
x=x+1
@x,0 say "│序  号│  型    号     规     格  ;
│  发    货     单     位  │ 计划单价 │ 实际单价 ;
│ 收发日期 │  数    量  │  总    价  │"
x=x+1
@x,0 say dby
x=x+1
do while .not.eof()
@x,0 say "│"+t1
@x,8 say "│"+t2
@x,36 say "│"+t11
@x,64 say "│"+str(t3,10,1)
@x,76 say "│"+str(t4,10,2)
@x,88 say "│"+t5
@x,100 say "│"+str(t6,12,3)
@x,114 say "│"+str(t8,12,2)
@x,128 say "│"
x=x+1
skip
if x>70.or.eof()
exit
endif
@x,0 say dby
x=x+1
enddo
@x,0 say dbx
if .not.eof()
x=0
endif
xok=xok+1
