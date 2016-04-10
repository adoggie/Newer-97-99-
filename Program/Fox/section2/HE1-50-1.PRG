set talk off
do mm
yx=str((((val(y)*100+val(m))*100)+val(d)),6)
sele 1
use &gg inde &ggt1      &&基本卡片库
sele 2
use &gg-d inde &gg-dt1  &&动态卡片库
sele 3
use &gg-2               &&退料单库
sele 4
use &gg-h
store 本日报日期 to ax1
if val(yx)<=val(ax1)
return
endif
do while .T.
set colo to gr+/b
clear
@ 6,24 say '┌──────┬───┐'
@ 7,24 say '│请输入编号: │      │'
@ 8,24 say '└──────┴───┘'
xh1="      "
@ 7,40 get xh1 pict 'XXXXXX'
read
if xh1="     "
exit
endif
sele 1
use &gg inde &ggt1   &&基本卡片库
seek trim(ltri(xh1))
if eof()
@14,24 say '没有此编号,请重输'
mx=0
do while mx<1000
mx=mx+1
enddo
loop
endif
do while .T.
sele 1
store spac(6) to tt1     &&序号
store t2 to tt2          &&型号*
store t3 to tt3          &&平均价
store 0.00 to tt4        &&实际单价
store yx to tt5          &&日期
store 0.00 to tt6        &&收入数量
store 0.00 to tt7        &&发出数量
store 0.00 to tt8        &&实际总价
store spac(6) to tt9     &&料单号
store spac(4) to tt10    &&类别
store spac(22) to tt11   &&来自单位
store t12 to tt12        &&库存数量
store t13 to tt13        &&库存金额
store t14 to tt14        &&最高价=库存单价
store 0.00 to tt15       &&调价
do ls-t
set colo to w+/g
@ 1,36 say xh1        &&序号
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
store tt12+tt6 to tt12                         &&增加后库存量
store val(str(tt12*tt3,12,2)) to tt13          &&变化后库存金额
store tt13-(tt8+tx0) to tt15                   &&差价
store val(str(tt15,8,2)) to tt15
if tt14<=tt4
store tt4 to tt14
endif
@14,60 say tt8 pict "9999999.99"    &&实际总价
@17,36 say tt14 pict "9999999.99"   &&新库存单价
set colo to r+/bg+
@17,60 say tt15  pict "99999.99"    &&差价
@19,60 say tt12 pict "9999999.99"   &&增加后库存量
@21,60 say tt3 pict "9999999.99"    &&平均价
@23,60 say tt13 pict "999999999.99" &&库存金额
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
sele 1
repl t3 with tt3,t4 with tt4,;
t12 with tt12,t13 with tt13,t14 with tt14,t15 with t15+tt15
sele 2
appe blan
repl t1 with xh1,t2 with tt2,t3 with tt3,t4 with tt4,;
t5 with tt5,t6 with tt6,t7 with 0,t8 with tt8,t9 with tt9,;
t10 with tt10,t11 with tt11,t12 with tt12,t13 with tt13,;
t14 with tt14,t15 with tt15
sele 3
appe blan
repl t1 with xh1,t2 with tt2,t3 with tt3,t4 with tt4,;
t5 with tt5,t6 with tt6,t8 with tt8,t9 with tt9,;
t10 with tt10,t11 with tt11,t12 with tt12,t13 with tt13,;
t14 with tt14,t15 with tt15
sele 4
use &gg-h
repl 本库存总额 with 本库存总额+(tt8+tt15),;
本月总额 with 本月总额+(tt8+tt15)
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