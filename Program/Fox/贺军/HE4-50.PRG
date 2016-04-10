set talk off
do mm
store subs(str(year(date()),4),3,2) to yx
store ltri(subs(str(mont(date()),2),1,2)) to mx
store ltri(subs(str(day(date()),2),1,2)) to dx
if len(mx)=1
store "0"+mx to mx
endif
if len(dx)=1
store "0"+dx to dx
endif
yxmxdx=yx+mx+dx
do while .t.
lk=1
aba3=0
store 16 to col1
store 3.6 to row1
@4,16 say ""
do he-hlhl
set colo to /b+
@4.25,18 say "银行盘片处理"font "宋体",10 colo rgb(255,255,255,,,)
@5.6,18.2 get lk FUNCTION "*RVT 统计处理;复制盘片" ;
font "宋体",12 size 1,12,0 color,,,,,,g+/rb,gr+/b,n+/w+,,w+/w
@4.2,29.9 get aba3 picture "@*TCB X" size 0.96,1.91
read
do case
case aba3=1
exit
case lk=1
do he4-50-1
do he4-50-2
*case lk=2
*do he4-50-3
case lk=2
do he4-50-3
exit
endcase
set colo to /bg+
@9,0 clear to 18,40
enddo
set colo to /bg+
clear
return
