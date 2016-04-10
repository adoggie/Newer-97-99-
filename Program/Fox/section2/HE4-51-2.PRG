set talk off
do while .t.
do mm
mn="  "
set colo to gr+/n
@10,60 clear to 16,75
set colo to gr+/rb
@9,58 clear to 15,73
@10,60 say "小类编号:" get mn
read
if mn="  ".or.mn="00"
do cl-aff
return
endif
use &gg
sum t13 to a13 for subs(t1,1,2)=mn
set colo to w+/rb
@12,58 say str(a13,12,2)+"元"
mn1="N"
set colo to gr+/rb
@14,59 say "还要吗?(Y/N)" get mn1
read
if mn1="n".or.mn1="N"
exit
endif
enddo
return


x=1
@x,30 say "    东航飞机维修基地龙华地面设备部"
x=x+2
@x,32 say "      === 仓库小类名细表 ==="
@x+1,32 say "          --------------"
@x+2,32 say "     日 期: &y 年 &m 月 &d 日"
x=x+3
dbx="└───┴─────────────┴─────;
┴─────┴─────┴──────┴──────┘"
dby="├───┼─────────────┼─────;
┼─────┼─────┼──────┼──────┤"
use xl
xok=1
do while .not.eof()
@x,0 say ykyk
@x,93 say "第"+str(xok,3)+" 页"
x=x+1
@x,0 say "┌───┬─────────────┬─────;
┬─────┬─────┬──────┬──────┐"
x=x+1
@x,0 say "│序  号│  型    号     规     格  │ 计划单价 ;
│ 实际单价 │ 收发日期 │  结余数量  │  结存金额  │"
x=x+1
@x,0 say dby
x=x+1
do while .not.eof()
@x,0 say "│"+t1
@x,8 say "│"+t2
@x,36 say "│"+str(t3,10,1)
@x,48 say "│"+str(t4,10,2)
@x,60 say "│"+t5
@x,72 say "│"+str(t12,12,3)
@x,86 say "│"+str(t13,12,2)
@x,100 say "│"
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
enddo
use xl
sum t12,t13 to ok12,ok13
@x+2,40 say "库存数量:"+str(ok12,12,3)
@x+3,40 say "库存金额:"+str(ok13,12,2)
@x+5,40 say "       "
? CHR(28)+"^K1"
set cons on
do mm
return

