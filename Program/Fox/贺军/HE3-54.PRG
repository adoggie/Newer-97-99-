set talk off
STORE 0 TO I,SUU
clear
use \xsk\&y\&gg-cpml
count to ai for he0<>"        "
if ai=0
set colo to /bg+
clear
return
endif
DIMENSION A(ai)
use \xsk\&y\&gg-cpml
store subs(ymd,3,2) to dmy
FOR I=1 TO ai
go i
store subs(HE0,1,29)+"|"+subs(xh,1,16)+"|"+dw+"|"+str(ycjc,3)+;
"|"+str(rkby,3)+"|"+str(rklj,3)+"|"+str(fcby,3)+;
"|"+str(fclj,3)+"|"+str(ymjc,3) to a(i)
ENDF
use
STORE 1 TO CHOI1
do while .t.
*do sx
*set clock to 26,0
set colo to n+/bg+,r+/b+
sele=0
aba=0
store 78.7 to col1
store 22.4 to row1
@1.3,0.2 say ""
do he-hlhl
set colo to /b+
@1.55,30 say "查 询 收 发 存 月 报 表"FONT "宋体",10 ;
COLOR RGB(255,255,255,,,)
set colo to w+/bg+
@2.6,0.7 clear to 6,76.7
@3.9,0.7 say "     产    品    名    称      型  号  规  格  ;
单位     "FONT "宋体",12 COLOR RGB(0,0,0,,,)
@2.8,52.5 say "月初 入  库  发  出 月末";
FONT "宋体",12 COLOR RGB(0,0,0,,,)
@4.5,52.5 say "结存本月累计本月累计结存";
FONT "宋体",12 COLOR RGB(0,0,0,,,)
set colo to /b+
@2.6,76.8 say "月"FONT "宋体",12 COLOR RGB(255,255,255,,,)
@3.6,76.8 say "份"FONT "宋体",12 COLOR RGB(255,255,255,,,)
@4.6,76.8 say "  "FONT "宋体",12
@4.8,76.8 say dmy FONT "宋体",12 COLOR RGB(255,255,255,,,)
@ 4.1,56.5 TO 4.1,72.2 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@ 4.2,56.5 TO 4.2,72.2 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)

@ 2.6,30.2 TO 5.9,30.2 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@ 2.5,30.4 TO 5.9,30.4 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
@ 2.6,47.2 TO 5.9,47.2 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@ 2.5,47.4 TO 5.9,47.4 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
@ 2.6,52.2 TO 5.9,52.2 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@ 2.5,52.4 TO 5.9,52.4 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
@ 2.6,56.2 TO 5.9,56.2 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@ 2.5,56.4 TO 5.9,56.4 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)

@ 4.3,60.2 TO 5.9,60.2 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@ 4.2,60.4 TO 5.9,60.4 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
@ 2.6,64.2 TO 5.9,64.2 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@ 2.6,64.4 TO 5.9,64.4 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
@ 4.3,68.2 TO 5.9,68.2 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@ 4.2,68.4 TO 5.9,68.4 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
@ 2.6,72.2 TO 5.9,72.2 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@ 2.6,72.4 TO 5.9,72.4 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
@ 2.6,76.5 TO 5.9,76.5 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@ 2.6,76.6 TO 5.9,76.6 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)

@ 5.8,0.6 TO 5.8,78.6 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@ 5.9,0.6 TO 5.9,78.6 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)

aba3=0
@ 6,0.6 GET CHOI1 FROM A FONT "宋体",12 RANGE 1,I FUNCTION "&T" ;
DEFAULT CHOI1 SIZE 15.5,77.8 VALID mm() color,n+/bg+,,,,r+/b+
@1.5,76.9 get aba3 picture "@*TCB X" size 0.96,1.91
*@1.5,77 get aba FUNCTION "*TH X" FONT "宋体",10 ;
*SIZE 1,1 COLOR,r+/b,gr/bg,n+/w
read
if aba3=1
exit
endif
STORE CHOI1 TO SUU
set colo to gr+/b+
clear
*set clock off
*store "t"+ltri(trim(str(choi1,2)))+".bmp" to tp
*@0.1,0.5 get sele picture "@*CB \xsk\&y\&tp" size 27.1,59.9 VALID tm()
*do tm
*@25.7,66 get aba FUNCTION "*TH 退 出" SIZE 1.3,8 ;
*FONT "宋体",12 COLOR,r+/b,gr/bg,n+/w
*read
set colo to 7/bg+
clear
enddo
set colo to /bg+
clear
return

