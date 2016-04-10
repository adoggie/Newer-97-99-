set talk off
set echo off
set safe off
set deli off
set dele on
set colo to
set scoreboard off
set escape on
set delimiter off
set conf off
set cons off
set date ansi
set safety off
set stat off
*set exclusive off&&网络
public y,m,d,aa,bb,cc,dd,kk,gg,hh,ii,tt11
store subs(str(year(date()),4),3,2) to y
*if val(y)>=99
*set path to c:\;c:\dos
*set cons off
*! echo off
*endif
on esca do esc
on key =315 do help
on error do err-1
@0,70 say time()
use fox1-99
*if flock()=.F.&&网络
*unlock all
*endif
repl yymmdd with date(),time with time()
store password to ll
store 0 to yy,mm,dd
set colo to gr/w
clear
set colo to /n
@7,22 clear to 18,60
set colo to g+/br+,r+/bg
@6,20 clear to 17,58
nq=0
waa=22
w0="【 "
w1="欢 "
w2="迎 "
w3="光 "
w4="临 "
w5="本 "
w6="系 "
w7="统 "
w8="】"
qop=1
do while .t.
wa0=6
wx="w"+str(nq,1)
do case
case qop=1
set colo to r+/br+
case qop=2
set colo to gr+/br+
case qop=3
set colo to w+/br+
case qop=4
set colo to bg+/br+
case qop=5
set colo to r+/br+
case qop=6
set colo to br+/br+
case qop=7
set colo to gr+/br+
case qop=8
set colo to g+/br+
case qop=9
set colo to r+/br+
case qop=10
qop=0
endcase
do while .t.
xn=0
do while xn<=10
xn=xn+1
@wa0,waa say subs(&wx,1,3)
@wa0,waa say subs(&wx,1,3)
@wa0,waa say subs(&wx,1,3)
@wa0,waa say subs(&wx,1,3)
@wa0,waa say subs(&wx,1,3)
@wa0,waa say subs(&wx,1,3)
enddo
wa0=wa0+1
if wa0>=11
exit
endif
@wa0-1,waa say "    "
enddo
nq=nq+1
waa=waa+4
if nq=9
exit
endif
qop=qop+1
enddo
qqa="   东航维修基地设备部电脑室编制  "
qqb=" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  "
qqc="        HE JUN-V2.0 1998.3  "
qa=56
qb=52
qc=57
xc=2
do while .t.
set colo to w+/br+
@8,qa say subs(qqa,1,xc)
set colo to r+/br+
@11,qa say subs(qqb,1,xc)
set colo to gr+/br+
@12,qa say subs(qqc,1,xc)
qa=qa-2
qb=qb-1
qc=qc-1
xc=xc+2
if qa<22
exit
endif
enddo
nnnn=1
do while .t.
do case
case nnnn=1
o2=""
okk1="set colo to w+/w+"
okk2="set colo to gr+/b+"
case nnnn=2
o2="◇"
okk1="set colo to w+/w+"
okk2="set colo to gr+/b+"
case nnnn=3
exit
endcase
n=1
do while .t. &&闪灯
xn=0
do while xn<2000
xn=xn+1
enddo
do case
case n=1
op3=20
op0=6
ok="op3=op3+2"
okk="op3>56"
case n=2
op3=56
op0=6
ok="op0=op0+1"
okk="op0>16"
case n=3
op3=56
op0=16
ok="op3=op3-2"
okk="op3<20"
case n=4
op3=20
op0=16
ok="op0=op0-1"
okk="op0<6"
case n=5
exit
endcase
do while .t.
set cons on
&okk1
@op0,op3 say o2
&okk2
@op0,op3 say o2
&ok
if &okk
exit
endif
enddo
n=n+1
enddo
nnnn=nnnn+1
enddo
na=0
do while na<5
n=0
store " " to a2,ok
store "   " to o
set colo to r+/br+
@14,38 say "********"
set colo to bg+/br+
@14,26 say "请输入密码:"
@14,49 say str(na,1) 
@14,51 say "次"
do while .t.
set cons off
@14,37 say " "
wait to o
set cons on
ok=ok+o
a2=a2+"*"
@14,37 say a2                      
n=n+1
if n=8
exit
endif
enddo
do case
case ok<>" &ll"          
@14,22 clear to 14,50 
set colo to r+/br+
@14,29 say "<< 密  码  错 ! ! ! >>  "
xn=0
do while xn<2000
xn=xn+1
enddo
@14,22 clear to 14,50
na=na+1
ok=" "
a2=" "
loop
case ok=" &ll"
exit
endcase
enddo
if na=5
set colo to w+/n
clear
you=24
do while .t.
@you,25 say "<< 你 是 非 法 用 户! >>"
you=you-1
if you=6
exit
endif
you1=1
do while you1<1300
you1=you1+1
enddo
@you+1,25 say "                        "
enddo
clear all
return
endif
zx="1"
wbb=56
do while .t.
set colo to w+/b+
@7,wbb-1 clear to 16,wbb
xn=0
do while xn<=100
xn=xn+1
enddo
wbb=wbb-1
if wbb<=22
exit
endif
enddo
store subs(str(year(date()),4),3,2) to yy
store subs(str(mont(date()),2),1,2) to mm
store subs(str(day(date()),2),1,2) to dd
xw1=" =★= CHINA EASTERN AIRLINE =★=   "
xw2="      ~~~~~~~~~~~~~~~~~~~~~        "
xw3="    【 LONG-HUA DEPARTMENT 】      "
xw7="   请输入日期: &yy 年 &mm 月 &dd 日  "
xq2=2
xwo="                                   "
wbb=22
o1=1
do while .t.
set colo to w+/gr
@7,wbb clear to 16,wbb+1
if wbb>=22
set colo to bg+/gr
@7,22 say subs(xwo,o1,xq2)
@8,22 say subs(xw1,o1,xq2)
@9,22 say subs(xw2,o1,xq2)
@10,22 say subs(xwo,o1,xq2)
set colo to w+/gr
@11,22 say subs(xw3,o1,xq2)
@12,22 say subs(xwo,o1,xq2)
@13,22 say subs(xwo,o1,xq2)
set colo to gr+/gr
@14,22 say subs(xw7,o1,xq2)
@15,22 say subs(xwo,o1,xq2)
xn=0
do while xn<=20
xn=xn+2
enddo
xq2=xq2+1
endif
wbb=wbb+1
if wbb>=55
exit
endif
enddo
@14,37 get yy
@14,43 get mm
@14,49 get dd
read
store yy to y
store mm to m
store dd to d
do he0-52
zx=" "
set colo to gr+/b
waa=40
wbb=40
qok5=hh1
qok6=hh2
qok7=hh3
qok8=hh4
qok9=hh5
qoka=hh6
qok1="┃主窗口: "+"&qok5  "+"&qok6  "+"&qok7  ";
+"&qok8  "+"&qok9  "+"&qoka  "+"退出系统┃"
qok2="┗━━━━━━━━━━━━━━━━━━━;
━━━━━━━━━━━━━━━━━━━┛"
qok4=4
do while .t.
@0,waa-2 clear to 27,waa
@0,wbb clear to 27,wbb+2
set colo to bg+/b+
@0,waa-2 say subs(qok1,waa-1,qok4)
set colo to gr+/b+
@1,waa-2 say subs(qok2,waa-1,qok4)
waa=waa-2
wbb=wbb+2
qok4=qok4+4
if waa<=0
exit
endif
enddo
xl=0
xb=20
b1=1
q2=11
s=1
do while .t.
set colo to bg+/b+
@2,0 clear
@0,10 say "&qok5  "+"&qok6  "+"&qok7  ";
+"&qok8  "+"&qok9  "+"&qoka  "+"退出系统"
set colo to gr+/b+
@0,0 say "┃主窗口: "
@0,78 say "┃"
@1,0 say "┗━━━━━━━━━━━━━━━━━━━;
━━━━━━━━━━━━━━━━━━━┛"
hh=1
*use fox1-99
*do while hh<8 &&显示ALL主菜单name
*store "hh"+str(hh,1) to jj
*@0,hh*10 say &jj
*hh=hh+1
*enddo
*set color to r+/b+,r+/b+
use fox1-99
store yk10 to ykyk
@25,59 say "当前日期:"
@25,0 say "当前管理:"
@25,34 say "移动键为:"
set colo to g+/b+
@25,68 say "&y"+"年"+"&m"+"月"+"&d"+"日"
@25,9 say subs(ykyk,1,20)
@25,43 say "→ ↓ ↑ ←"
set colo to r+/b+,r+/b+
do while .t.
set colo to w+/b+
@2,0 clear to 23,80
set colo to w+/r+
store "hh"+str(b1,1) to hh
@0,b1*10 say &hh &&反显当前主菜单名(红)
if q2=10 .and. b1<>7 &&拉下当前菜单
store "uu"+str(b1,1) to uu
store "ee"+str(b1,1) to ee
set colo to /n
@3,b1*10-1 clear to &uu+5,b1*10+13
set color to w/g+,r+/b+
@2,b1*10-3 clear to &uu+4,b1*10+11
hh=1
do while &ee<>"          " &&显示子菜单
@hh+2,b1*10-2 say &ee
hh=hh+1
skip
enddo
use fox1-99
store &uu to xl &&子菜单长度
store b1*10-2 to xb &&子菜单显示列位
endif
do while .t.
store "ee"+str(b1,1) to ss
go s
if q2=10 .and. b1<>7 &&产生光条
@s+2,xb get &ss
set colo to w+/b+
@s+2,xb-3 say "★"
endif
key=inkey(0)
set colo to w+/g+
do case
case key=24 .and. q2=11 &&第一次下拉
exit
case key=24 .and. q2=10 .and. b1<>7 &&光条下拉后擦除当前光条
go s
set colo to /b+
@s+2,xb-3 say "  "
set colo to w+/g+
@s+2,xb say &ss &&
skip
store s+1 to s
if s>xl .or. eof()
s=1
exit
endif
case key=5 .and. s>=1 .and. b1<>7 &&光条上拉擦除当前光条
set colo to /b+
@s+2,xb-3 say "  "
set colo to w+/g+
@s+2,xb say &ss &&
skip-1
store s-1 to s
if s=0 .or. eof()
s=1
exit
endif
case key<>24
exit
endcase
enddo
clear gets
store b1 to q1
do case
case key=4 && →
s=1
b1=b1+1
if b1>7
b1=1
endif
case key=5 && ↑
q2=11
case key=24 .or. (key=13 .and. b1<>7 .and. q2=11) &&↓and 回车
q2=10
case key=19 &&←
s=1
b1=b1-1
if b1=0
b1=7
endif
case (key>40.and.q2=10).or.(key=13.and.q2=10.and.b1<>7)
if key=13
key=key+35+s
endif
store str(b1,1) to bx
store "he"+"&bx-"+str(key,2) to ky
if key>=49 .and. key<=68
use fox1-99
repl bb1 with b1,qq2 with q2,ss with s,xxl with xl,;
xxb with xb,yek with key
use
do &ky
use fox1-99
store bb1 to b1
store qq2 to q2
store ss to s
store xxl to xl
store xxb to xb
store yek to key
exit
endif
case key=13 .and. b1=7 &&回车 and 在退出位置
exit
endcase
set colo to bg+/b+
use fox1-99
store "hh"+str(q1,1) to hh
@0,q1*10 say &hh &&显示主菜单
enddo
if key=13 .and. b1=7 &&回车 and 在退出位置
exit
endif
enddo
set colo to w/n
waa=0
wbb=79
do while .t.
@0,waa clear to 25,waa+1
@0,wbb-1 clear to 25,wbb
waa=waa+1
wbb=wbb-1
if waa=40
exit
endif
enddo
clear all
set colo to gr+/n+
ab1="*=*=* 欢迎您再次使用本系统 *=*=* "
ab2="      ~~~~~~~~~~~~~~~~~~~~ "
ab3="             再  见 ! "
ac=79
ad=1
do while ac>22
@10,ac say subs(ab1,1,ad)
@11,ac say subs(ab2,1,ad)
@13,ac say subs(ab3,1,ad)
ac=ac-1
ad=ad+1
enddo
set talk on
return
