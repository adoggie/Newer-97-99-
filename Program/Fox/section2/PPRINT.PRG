set talk off
xw1="                "
xw2="    请准备好打印"
xw3="                "
xw4="机和打印纸，打开"
xw5="                "
xw6="打印机开关，调整"
xw7="                "
xw8="好纸张，按键即可"
xw9="                "
xw10="打印。          "
xw11="                "
x=6.2
x1=1
set colo to n+/bg+
@3,0 clear to 22,44.5
store 18.3 to col1
store 12.3 to row1
@4.8,18.7 say ""
do he-hlhl
set colo to /b+
@5.05,23.2 say "打印前准备"FONT "宋体",10 ;
color rgb(255,255,255,,,)
do while .t.
store "xw"+ltri(str(x1,2)) to xy
set colo to gr+/w,gr+/r+
@x,20 say subs(&xy,1,22) FONT "宋体",12
x=x+1
x1=x1+1
if x1>=12
exit
endif
enddo
return
