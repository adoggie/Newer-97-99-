set talk off
do mm
do pprint
aba=0
aba3=0
@15.5,28.5 get aba picture "@*CB ty" size 2,6 DEFAULT sele VALID km1()
@5,34.91 get aba3 picture "@*TCB X" size 0.96,1.91 ;
DEFAULT aba3 VALID km1()
read
if aba3=1
return
endif
set colo to /bg+
@3,0 clear to 23,44
do while .t.
store 0 to aba3,aba2,gh1
store 30 to col1
store 2 to row1
@4,8 say ""
do he-hlhl
store 4 to col1
store 0 to row1
@5.6,23.2 say ""
do he-llhh
set colo to /b+
@4.25,19 say "按工号打印" FONT "宋体",10 color rgb(255,255,255,,,)
set colo to /w+
@5.6,9.7 say "请输入工号:"FONT "宋体",12 color rgb(0,0,0,,,)
@5.6,23.2 get gh1 pict "9999"FONT "宋体",12 size 0.85,4
@5.3,28.6 get aba2 FUNCTION "*TH OK" SIZE 1.3,9 ;
FONT"宋体",12 COLOR RGB(255,255,255,,,,)
@4.2,35.9 get aba3 picture "@*TCB X" size 0.96,1.91
read
if gh1=0.or.aba3=1.or.aba2=1
exit
endif
enddo
set colo to /bg+
@3,7.5 clear to 10,40
if gh1=0.or.aba3=1
return
endif

use &gg
inde on gh to sy for gh=gh1
use &gg inde sy

*MODIFY REPORT he5-52.frx
*REPORT FORMAT he5-52.frx ENVIRONMENT PREVIEW
report form he5-52.frx noeject ENVIRONMENT noconsole to print
close data
RETURN

