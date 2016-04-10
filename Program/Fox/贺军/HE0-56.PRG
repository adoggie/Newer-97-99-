set talk off
set colo to n+/bg+
*clear
store int(val(y)) to y
store int(val(m)) to m
store int(val(d)) to d
store 33 to col1
store 0.9 to row1
@23.6,46 say ""
do he-hhh
aba=1
@24,63 say "年"FONT "宋体",12 COLOR RGB(0,0,0,,,)
@24,70 say "月"FONT "宋体",12 COLOR RGB(0,0,0,,,)
@24,77 say "日"FONT "宋体",12 COLOR RGB(0,0,0,,,)
@ 24,56.4 get y spinner 1,1,2008 FONT "Courier",12 ;
size 1.2,4 color,,,,g+/rb,w+/r,n/w,,,w+/b
@ 24,65.5 get m spinner 1,1,12 FONT "Courier",12 ;
size 1.2,2 COLOR SCHEME(1) 
@ 24,72.5 get d spinner 1,1,31 FONT "Courier",12 ;
size 1.2,2 COLOR SCHEME(1)

@23.8,46 get aba FUNCTION "*TH 修改日期:";
FONT "宋体",12 SIZE 1.3,9 COLOR RGB(0,0,0,,,)
read
if y<1998.or.y>2000
y=1998
endif
store str(y,4) to y
store str(m,2) to m
store str(d,2) to d
store subs(gg,1,3)+allt(m) to gg
return

