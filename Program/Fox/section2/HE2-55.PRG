set talk off
do mm
tx=" "
do while .t.
set colo to w+/n
@9,31 say "─"
set colo to w+/b+
@ 9,33 say "─────┐"
@10,33 say "          ↓" 
set colo to /n
@12,36 clear to 18,58
set colo to gr+/bg+,r+/b+,gr+
@11,34 clear to 17,56
yx=str((((val(y)*100)+val(m))*100+val(d)),6)
SELE 4
use &gg-h
store 本日报日期 to yz
set colo to w+/bg+
@12,35 say "上次日报日期: "+"&yz"
set colo to gr+/bg+
@14,35 say "本次输入日期:" get yx
read
ax1="0"
if val(yx)<=val(yz)
@14,35 say "日报已统计,不能修改 !"
@16,35 say " 重新输入吗(Y/N/0)" get ax1
read
if ax1="0"
exit
endif
loop
wait
endif
ax1=" "
@16,35 say "   正确吗?(Y/N/0)" get ax1
read
if ax1<>"n"
exit
endif
enddo
if ax1="0".or.ax1="n".or.ax1="N"
clear
return
endif
*sele 2
*use &gg-d
ts=1
do while .not.eof()
sele 2
use &gg-d
set colo to r+/b+
clear
@0,0 say "序号 型    号      规    格 日  期 料单;
 发    货      单    位 数      量 计划价"
@1,0 say "---- ---------------------- ------ ----;
 ---------------------- ---------- ------"
t=2
ok=0
do while .not.eof()
store subs(t1,1,4) to tt1   &&序号
store subs(t2,1,22) to tt2  &&型号
store t3 to tt3   &&计划价
store t4 to tt4   &&实际单价
store t5 to tt5   &&日期
store t6 to tt6   &&收入数量
store t7 to tt7   &&发出数量
store t8 to tt8   &&实际总价
store subs(t9,1,4) to tt9   &&料单号
store t10 to tt10 &&类别
store subs(t11,1,22) to tt11 &&来自单位
store t12 to tt12 &&库存数量
store t13 to tt13 &&库存金额
store t14 to tt14 &&最高价=库存单价
store t15 to tt15 &&调价
set colo to gr+/b+,w+/bg+
@t,0 prom [&tt1 &tt2 &tt5 &tt9 &tt11 ]+;
str(tt6,10,3)+str(tt3,6,1)
skip
t=t+1

if t>=23.or.eof()
if .not.eof()
@t,0 prom "********************************【 此行为换页 】;
*******************************"
endif
clear type
menu to ts
@2,0 clear to 24,79
if ts<22
clear
exit
endif
if ts=22
ok=ok+21
endif
t=2
@2,0 clear to 24,79
endif

enddo
go ts+ok
store t1 to tt1   &&序号
store t2 to tt2   &&型号
store t3 to tt3  &&计划价
store t4 to tt4   &&实际单价
store t5 to tt5   &&日期
store t6 to tt6   &&收入数量
store t7 to tt7   &&发出数量
store t8 to tt8,ok8 &&实际总价
store t9 to tt9   &&料单号
store t10 to tt10 &&类别
store t11 to tt11 &&来自单位
store t12 to tt12 &&库存数量
store t16 to tt13 &&库存金额
store t14 to tt14 &&原计划价
store t15 to tt15,ok15 &&调价
store t16 to tt16 &&原库存金额
store subs(tt9,1,1) to tx9
do while .T.
do ls-&tx9
set colo to w+/g
@ 1,36 get tt1    &&序号
@ 2,36 get tt2    &&型号
@ 4,36 get tt5    &&日期
@ 6,36 get tt9    &&料单号
@ 8,36 get tt10   &&类别
@10,36 get tt11   &&来自单位
@12,36 get tt6  pict "999999.999"      &&数量
@14,36 get tt3  pict "99999999.9"      &&计划单价
@14,60 get tt4  pict "9999999.99"      &&实际单价
store tt12-tt6 to tt12
@17,36 say tt8  pict "9999999.99"      &&实际总价
@19,36 say tt12 pict "99999999.999"    &&原库存量
@21,36 say tt14  pict "9999999.9"       &&原计划价
@23,36 say tt16 pict "999999999.99"    &&库存金额
read
do case
case subs(tt9,1,1)="A"
store tt13 to tx0                            &&原库存金额
store roun(tt6*tt3,2) to tt8          &&实际总价
store tt12+tt6 to tt12                       &&增加后库存量
store roun(tt12*tt3,2) to tt13        &&变化后库存金额
store tt13-(tx0+tt8) to tt15                 &&差价
store roun(tt15,2) to tt15
set colo to r+/bg+
@17,36 say tt8 pict "9999999.99"      &&实际总价
@17,60 say tt15  pict "9999999.99"    &&差价
@19,60 say tt12 pict "99999999.999"   &&增加后库存量
@21,60 say tt3 pict "99999999.9"      &&新计划价
@23,60 say tt13 pict "999999999.99"   &&现库存金额
tx="1"
sele 4
use &gg-h
repl 本库存总额 with 本库存总额-ok8+tt8-ok15+tt15,;
本月总额 with 本月总额-ok8+tt8-ok15+tt15 
case subs(tt9,1,1)="B"
store roun(tt6*tt3,2) to tt8    &&退料总价
store tt12+tt6 to tt12                 &&增加后库存量
store roun(tt3*tt12,2) to tt13  &&变化后库存金额
set colo to r+/bg+
@17,36 say tt8 pict "9999999.99"       &&退料总价
@19,60 say tt12 pict "99999999.999"    &&增加后库存量
@21,60 say tt3 pict "99999999.9"       &&计划价
@23,60 say tt13 pict "999999999.99"    &&现库存金额
tx="2"
tt15=0
sele 4
use &gg-h
repl 本库存总额 with 本库存总额-ok8+tt8+tt15,;
本月总额 with 本月总额-ok8+tt8+tt15 
case subs(tt9,1,1)="C"
store roun(tt6*tt3,2) to tt8    &&退料总价
store tt12+tt6 to tt12                 &&增加后库存量
store roun(tt3*tt12,2) to tt13  &&变化后库存金额
set colo to r+/bg+
@17,36 say tt8 pict "9999999.99"       &&退料总价
@19,60 say tt12 pict "99999999.999"    &&增加后库存量
@21,60 say tt3 pict "99999999.9"       &&计划价
@23,60 say tt13 pict "999999999.99"    &&现库存金额
tx="3"
tt15=0
sele 4
use &gg-h
repl 本库存总额 with 本库存总额-ok8+tt8+tt15,;
本月总额 with 本月总额-ok8+tt8+tt15 
case subs(tt9,1,1)="D"
store roun(tt6*tt3,2) to tt8    &&发出总价
store tt12-tt6 to tt12                 &&减少后库存量
store roun(tt12*tt3,2) to tt13  &&变化后库存金额
set colo to r+/bg+
@17,36 say tt8 pict "9999999.99"        &&发出总价
@19,60 say tt12 pict "99999999.999"     &&减少后库存量
@21,60 say tt3 pict "99999999.9"        &&计划价
@23,60 say tt13 pict "999999999.99"     &&现库存金额
tx="4"
tt15=0
sele 4
use &gg-h
repl 本库存总额 with 本库存总额+ok8-tt8+tt15,;
本月总额 with 本月总额+ok8-tt8+tt15 
case subs(tt9,1,1)="E"
store roun(tt6*tt3,2) to tt8    &&发出总价
store tt12-tt6 to tt12                 &&减少后库存量
store roun(tt12*tt3,2) to tt13  &&变化后库存金额
set colo to r+/bg+
@17,36 say tt8 pict "9999999.99"        &&发出总价
@19,60 say tt12 pict "99999999.999"     &&减少后库存量
@21,60 say tt3 pict "99999999.9"        &&计划价
@23,60 say tt13 pict "999999999.99"     &&现库存金额
tx="5"
tt15=0
sele 4
use &gg-h
repl 本库存总额 with 本库存总额+ok8-tt8+tt15,;
本月总额 with 本月总额+ok8-tt8+tt15 
case subs(tt9,1,1)="F"
store roun(tt6*tt3,2) to tt8    &&发出总价
store tt12-tt6 to tt12                 &&减少后库存量
store roun(tt12*tt3,2) to tt13  &&变化后库存金额
set colo to r+/bg+
@17,36 say tt8 pict "9999999.99"        &&发出总价
@19,60 say tt12 pict "99999999.999"     &&减少后库存量
@21,60 say tt3 pict "99999999.9"        &&计划价
@23,60 say tt13 pict "999999999.99"     &&现库存金额
tx="6"
tt15=0
sele 4
use &gg-h
repl 本库存总额 with 本库存总额+ok8-tt8+tt15,;
本月总额 with 本月总额+ok8-tt8+tt15 
endcase
ss=" "
set colo to w+/g+
@22,0 clear to 24,20
@23,2 say '正确吗? (Y/N/0)' get ss
read
do case
case ss="0"
exit
case ss="n".or.ss="N".or.tx=" "
loop
case ss='y'.or.ss="Y"
sele 1
use &gg
loca for t1=tt1
repl t3 with tt3,t4 with tt4,;
t12 with tt12,t13 with tt13,t15 with t15+tt15
sele 2
repl t1 with tt1,t2 with tt2,t3 with tt3,t4 with tt4,;
t5 with tt5,t6 with tt6,t7 with 0,t8 with tt8,t9 with tt9,;
t10 with tt10,t11 with tt11,t12 with tt12,t13 with tt13,;
t15 with tt15
sele 3
use &gg-&tx
loca for t1=tt1.and.t2=tt2.and.t5=tt5
repl t1 with tt1,t2 with tt2,t3 with tt3,t4 with tt4,;
t5 with tt5,t6 with tt6,t8 with tt8,t9 with tt9,;
t10 with tt10,t11 with tt11,t12 with tt12,t13 with tt13,;
t15 with tt15
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




use &gg-d
do while .not.eof()
store t1 to tt1   &&序号
store t2 to tt2   &&型号
store t14 to tt3  &&计划价
store t4 to tt4   &&实际单价
store t5 to tt5   &&日期
store t6 to tt6   &&收入数量
store t7 to tt7   &&发出数量
store t8 to tt8   &&实际总价
store t9 to tt9   &&料单号
store t10 to tt10 &&类别
store t11 to tt11 &&来自单位
store t12 to tt12 &&库存数量
store t16 to tt13 &&库存金额
store t14 to tt14 &&原计划价
store t15 to tt15 &&调价
store t16 to tt16 &&原库存金额

store tt13 to tx0                            &&原库存金额
store val(str(tt6*tt3,10,2)) to tt8          &&实际总价
store tt12+tt6 to tt12                       &&增加后库存量
store val(str(tt12*tt3,12,2)) to tt13        &&变化后库存金额
store tt13-(tx0+tt8) to tt15                 &&差价
store val(str(tt15,8,2)) to tt15
set colo to r+/bg+
@17,36 say tt8 pict "9999999.99"      &&实际总价
@17,60 say tt15  pict "9999999.99"    &&差价
@19,60 say tt12 pict "99999999.999"   &&增加后库存量
@21,60 say tt3 pict "99999999.9"      &&新计划价
@23,60 say tt13 pict "999999999.99"   &&现库存金额
ss=" "
set colo to w+/g+
@22,0 clear to 24,20
@23,2 say '正确吗? (Y/N/0)' get ss
read
do case
case ss="0"
exit
case ss="n".or.ss="N"
loop
case ss='y'.or.ss="Y"
sele 1
use &gg
loca for t1=tt1
repl t3 with tt3,t4 with tt4,;
t12 with tt12,t13 with tt13,t15 with t15+tt15
sele 2
repl t1 with xh1,t2 with tt2,t3 with tt3,t4 with tt4,;
t5 with tt5,t6 with tt6,t7 with 0,t8 with tt8,t9 with tt9,;
t10 with tt10,t11 with tt11,t12 with tt12,t13 with tt13,;
t15 with tt15
sele 3
use &gg-1
loca for t1=tt1
repl t1 with tt1,t2 with tt2,t3 with tt3,t4 with tt4,;
t5 with tt5,t6 with tt6,t8 with tt8,t9 with tt9,;
t10 with tt10,t11 with tt11,t12 with tt12,t13 with tt13,;
t15 with tt15
sele 4
use &gg-h
repl 本库存总额 with 本库存总额+tt8+tt15,;
本月总额 with 本月总额+tt8+tt15 
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