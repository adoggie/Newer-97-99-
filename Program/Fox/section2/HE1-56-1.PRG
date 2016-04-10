set talk off
set colo to n+/bg+
*clear
store int(val(y)) to y
store int(val(m)) to m
store int(val(d)) to d
store 31 to col1
store 0.9 to row1
@23.6,48 say ""
do he-hhh

@24,49 say "修改日期:"FONT "宋体",12 COLOR RGB(0,0,0,,,)
@24,63 say "年"FONT "宋体",12 COLOR RGB(0,0,0,,,)
@24,70 say "月"FONT "宋体",12 COLOR RGB(0,0,0,,,)
@24,77 say "日"FONT "宋体",12 COLOR RGB(0,0,0,,,)

@ 24,58.4 get y spinner 1,1,99 FONT "Courier",12 ;
size 1.2,2 COLOR,,,,,w+/n+,r+/bg+,gr+/g+
@ 24,65.5 get m spinner 1,1,12 FONT "Courier",12 ;
size 1.2,2 COLOR SCHEME(1) 
@ 24,72.5 get d spinner 1,1,31 FONT "Courier",12 ;
size 1.2,2 COLOR SCHEME(1) 
read
store str(y,2) to y
store str(m,2) to m
store str(d,2) to d
return

