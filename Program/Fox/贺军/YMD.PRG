set talk off
set cons on
do mm
set colo to /b
do while .t.
store 25 to col1
store 6 to row1
@10,11 say ""
do he-hlhl
store 8 to col1
store 0 to row1
@12,26.5 say ""
do he-llhh
store 8 to col1
store 0 to row1
@13.5,26.5 say ""
do he-llhh
set colo to /b+
@10.25,18 say "统计银行盘片"FONT"宋体",10 COLOR RGB(255,255,255,,,)
set colo to /w+
ax1=0
@12,12.5 say "输入年.月.日:"FONT"宋体",12 COLOR RGB(0,0,0,,,)
@12,26.5 get yxmxdx FONT"宋体",12 COLOR RGB(0,0,0,,,)size 0.85,8
@13.5,12.5 say "输入单位编号:"FONT"宋体",12 COLOR RGB(0,0,0,,,)
@13.5,26.5 get tad FONT"宋体",12 COLOR RGB(0,0,0,,,)size 0.85,8
@15,19.5 get ax1 FUNCTION "*TH OK" SIZE 1.3,8 ;
FONT"宋体",12 COLOR RGB(255,255,255,,,,)
@10.2,33.9 get aba3 picture "@*TCB X" size 0.96,1.91
read
if ax1=1.or.aba3=1
exit
endif
enddo
do mm
return
