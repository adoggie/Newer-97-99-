set talk off
do mm
use &gg-h
brow
return


do while .t.
set colo to w+/n
@3,51 say "─"
set colo to w+/b+
@3,53 say "─────┐"
@4,53 say "          │"
@5,53 say "          │"
@6,53 say "          ↓" 
set colo to /n
@8,56 clear to 14,78
set colo to gr+/bg+,r+/b+,gr+
@7,54 clear to 13,76
yx=str((((val(y)*100)+val(m))*100+val(d)),6)
use hy
store 本日报日期 to yz
set colo to w+/bg+
@ 8,55 say "上次日报日期: "+"&yz"
set colo to gr+/bg+
@10,55 say "输入数据日期:" get yx
read
ax1="0"
if yx<=yz
@10,55 say "日报已统计,数据不能修改"
@12,55 say " 重新输入吗(Y/N/0)" get ax1
read
if ax1="0"
exit
endif
loop
endif
ax1=" "
@12,55 say "   正确吗?(Y/N/0)" get ax1
read
if ax1<>"n"
exit
endif
enddo
if ax1="0"
clear
return
endif
use &gg-d
loca for t5=yx
if t5<>yx
return
endif
store recn() to ok
do while .t.
go ok
set colo to r+/b+
clear
@0,0 say "序号 型   号   规   格 日  期 料单号 类别;
 发   货   单   位 数      量 实际单价"
@1,0 say "---- ----------------- ------ ------ ----;
 ----------------- ---------- --------"
t=2
do while .not.eof()
set colo to gr+/b+,w+/bg+
store subs(t1,1,4) to tt1    &&序号
store subs(t2,1,17) to tt2   &&型号
store t3 to tt3              &&平均价
store str(t4,8,2) to tt4     &&实际单价
store subs(t5,1,6) to tt5    &&日期
store str(t6,10,2) to tt6    &&收入数量
store t7 to tt7              &&发出数量
store t8 to tt8              &&实际总价
store subs(t9,1,6) to tt9    &&料单号
store subs(t10,1,4) to tt10  &&类别
store subs(t11,1,17) to tt11 &&来自单位
store t12 to tt12            &&库存数量
store t13 to tt13            &&库存金额
store t14 to tt14            &&最高价=库存单价
store 0.00 to tt15            &&调价
@t,0 prom tt1+" &tt2"+" &tt5"+" &tt9";
+" &tt10"+" &tt11"+" &tt6"+" &tt4"
skip
t=t+1
if t>=23 .or. eof()
clear type
ts=1
menu to ts
wait "要修改吗?(Y/N/0)     ( 任一键换页 )" to ro
@2,0 clear to 24,79
if ro="y".or. ro="0"
exit
endif
t=2
@2,0 clear to 24,79
endif
enddo
go ok+ts-1
do while .T.
do ls-s
set colo to w+/g
@ 1,36 say tt1        &&序号
@ 2,36 say tt2        &&型号
@ 4,36 get tt5        &&日期
@ 6,36 get tt9        &&料单号
@ 8,36 get tt10       &&类别
@10,36 get tt11       &&来自单位
@12,36 get tt6  pict "9999999.99"      &&数量
@14,36 get tt4  pict "9999999.99"      &&实际单价
@14,60 say tt8  pict "9999999.99"      &&实际总价
@17,36 say tt14 pict "9999999.99"      &&库存单价
@19,36 say tt12 pict "999999999.99"    &&库存量
@21,36 say tt3  pict "9999999.99"      &&库平均价
@23,36 say tt13 pict "999999999.99"    &&库存金额
read
store tt13 to tx0
store val(str(tt6*tt4,10,2)) to tt8            &&实际总价
store ((tt6*tt4)+(tt3*tt12))/(tt6+tt12) to tt3 &&平均价
store val(str(tt3,10,2)) to tt3
store tt12+tt6 to tt12                       &&增加后库存量
store val(str(tt12*tt3,12,2)) to tt13        &&变化后库存金额
store tt13-(tt8+tx0) to tt15                 &&差价
store val(str(tt15,8,2)) to tt15
if tt14<=tt4
store tt4 to tt14
endif
@14,60 say tt8 pict "9999999.99"    &&实际总价
@17,36 say tt14 pict "9999999.99"   &&新库存单价
set colo to r+/bg+
@17,60 say tt15  pict "99999.99"   &&差价
@19,60 say tt12 pict "9999999.99"  &&增加后库存量
@21,60 say tt3 pict "9999999.99"  &&平均价
@23,60 say tt13 pict "999999999.99"&&库存金额
ss=" "
set colo to w+/g+
@22,0 clear to 24,20
@23,2 say '正确吗? (Y/N/0)' get ss
read
do case
case ss="0"
exit
case ss="n"
loop
case ss<>'n'
use &gg
loca for t1=tt1
repl t3 with tt3,t4 with tt4,;
t12 with tt12,t13 with tt13,t14 with tt14,t15 with t15+tt15
use &gg-1
loca for 
repl t1 with xh1,t2 with tt2,t3 with tt3,t4 with tt4,;
t5 with tt5,t6 with tt6,t8 with tt8,t9 with tt9,;
t10 with tt10,t11 with tt11,t12 with tt12,t13 with tt13,;
t14 with tt14,t15 with tt15
sele 4
use hy
repl 本库存总额 with 本库存总额+(tt8+tt15)
exit
endcase
enddo
if ss="0"
exit
endif
set colo to g+/gr+
@22,0 clear to 24,20
ss=" "
@23,2 say '继续吗? (Y/N)  ' get ss
read
if ss="n".or.ss="N"
exit
endif
enddo
close data
return

