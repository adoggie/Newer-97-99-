set talk off
set path to \xsk\&y\
x23=1
set colo to w+/n+,w+/n+
clear
do while .t.
qq1="                                         "
qq2="                                         "
@24,0 say "." get qq1
read
*@24,0 say ". "+qq2
@24-x23,0 say ". "+trim(qq1)
if qq1="  "
exit
endif
store ltri(qq1) to qq1
store trim(qq1) to qq1
&qq1
x23=x23+1
enddo
do return
set colo to 7/bg+
clear
return

set talk off
do mm
store hh to hh0
store 14.6 to col1
store 3.6 to row1
@3.8,35.8 say ""
do he-hlhl
set colo to w+/b+
@4.05,37.8 say "索 引 处 理"font "宋体",10
set colo to /bg+
aba3=0
lk=1
@5.4,36.5 get lk FUNCTION "*RVT 索引总处理;年初总处理" ;
font "宋体",12 size 1.2,12,0 color,,,,,,g+/rb,gr+/b,n+/w+,,w+/w
@4,48.2 get aba3 picture "@*TCB X" size 0.96,1.91
read
do case
case aba3=1
return
case lk=1
do he6-sy
case lk=2
do he6-50-1
endcase
use
*keyb ""+CHR(13)
return
