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
x1=1
store 23 to col1
store 4.5 to row1
@5,20 say ""
do he-hlhl
store 4 to col1
store 0 to row1
@7,37 say ""
do he-llhh
set colo to /b+
@5.25,26 say "连接断点设制"FONT "宋体",10 colo rgb(255,255,255,,,)
set colo to /w+
aba4=0
aba2=0
@7,22 say "请输入断点页数:"FONT "宋体",12 colo rgb(0,0,0,,,)
@7,37 get x1 FONT "宋体",12 size 0.85,4
@8.5,26.7 get aba2 FUNCTION "*TH OK" SIZE 1.3,9 ;
FONT"宋体",12 COLOR RGB(255,255,255,,,,)
@5.2,40.9 get aba4 picture "@*TCB X" size 0.96,1.91
read
if aba4=1
return
endif
set colo to /bg+
@3,0 clear to 23,44
use &gg
sort to gzgz on bmxzh/ac,gh/ac
use gzgz
*MODIFY REPORT he5-49.frx
*REPORT FORMAT he5-49.frx ENVIRONMENT PREVIEW for recno()>6*(x1-1)
report form he5-49.frx noeject ENVIRONMENT noconsole ;
to print for recno()>6*(x1-1)
close data
RETURN

