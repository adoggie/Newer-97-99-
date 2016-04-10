set talk off
do mm
store gg to okg
store dd to okd
zw=1
ttza=0
ttzb=0
use \xsk\&y\fox1-99
count to ai for he0<>"        "
DIMENSION A(ai)
FOR I=1 TO ai
use \xsk\&y\fox1-99
go i
store he0 to aok1
gg="xs"+chr(96+i)
use \xsk\&y\&gg
count all to aok2 for t1<>"        "
use \xsk\&y\&gg
sum t13 to aok3
store aok1+"|"+str(aok2,12,2)+"| "+str(aok3,12,2) to a(i)
ENDF
use
@2,0 clear to 25,80
store 50.2 to col1
store 8.8 to row1
@6,12 say ""
do he-hhhh
set colo to /b+
@6.22,27.5 say "查 询 各 类 库 存 金 额"FONT "宋体",10 color rgb(255,255,255,,,)
set colo to /bg+
@7.6,15.5 say "类  型  名  称      卡片数量    库 存 金 额";
FONT "宋体",12 color rgb(0,0,0,,,)
@ 7.3,33.16 TO 8.95,33.16 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@ 7.3,33.26 TO 8.95,33.26 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
@ 7.3,46.17 TO 8.95,46.17 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@ 7.3,46.27 TO 8.95,46.27 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
@ 7.3,59.9 TO 8.95,59.9 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@ 7.3,60 TO 8.95,60 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
@ 7.29,12.38 TO 7.29,59.8 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@ 8.9,12.38 TO 8.9,62 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
@ 8.95,12.38 TO 8.95,61.9 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
STORE 1 TO aba
aba3=0
@ 9,12.5 GET aba FROM A FONT "宋体",12 RANGE 1,I FUNCTION "&T" ;
DEFAULT CHOI1 SIZE 5.5,49.2 VALID mm() color,n+/bg+,,,,r+/b+
@6.2,60.15 get aba3 picture "@*TCB X" size 0.96,1.91
read
store okg to gg
store okd to dd
return
