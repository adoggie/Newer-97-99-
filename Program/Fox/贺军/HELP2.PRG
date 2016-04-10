set talk off
push key clear
set colo to n/bg+
store 1 to kp
sele 3
if eof()
pop key
return
endif
tota to \xsk\&y\&gg-00 on t11 fiel t11&& for subs(t11,1,7)="26-98普"
sele 6
use \xsk\&y\&gg-00
count to ai
use \xsk\&y\&gg-00
dime ch(ai)
i=1
do while .not.eof()
store t11 to ch(i)
skip
i=i+1
enddo
*i=1
me=1
store 31 to col1
store 20.8 to row1
@0.5,0.1 say ""
do he-hlhl
set colo to /b+
@0.75,10 say "选 择 单 位"FONT "宋体",10 color rgb(255,255,255,,,)
set colo to /bg+
abx=0
@0.7,29.05 get abx picture "@*TCB X" size 0.96,1.91 ;
DEFAULT aba3 VALID km1()                    &&右上角退出
@1.8,0.6 GET me FROM ch FONT "宋体",12 RANGE 1,I FUNCTION "&T" ;
DEFAULT ne SIZE 17,30 color,n+/bg+,,,,r+/b+
read
set colo to /bg+
@0,0 clear to 24,32
if abx<>1
go me
store t11 to tt11

@12,42 say tt11 FONT "宋体",12&& SIZE 0.85,28
endif
sele 6
use
sele 3
go 1
set colo to n+/bg+
pop key
return

