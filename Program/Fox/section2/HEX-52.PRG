set talk off
*do sx
*set clock to 26.4,0

STORE 0 TO I,CHOI1
use \xsk\&y\FOX1-99
count to ai for he0<>"        "
if ai=0
use \xsk\&y\fox1-99
dd="  "
gg="xsa"
return
endif
go 3
store val(yk10) to subb
DIMENSION A(ai)
use \xsk\&y\FOX1-99
FOR I=1 TO ai
go i
store HE0 to a(i)
ENDF
set colo to n+/bg+,r+/b+
store 0 to aba3,sele
store 21.1 to col1
store 11.2 to row1
@6,12 say ""
do he-hlhl
@3.75,11.6 get sele picture "@*CB 102a" size 2,22.1 DEFAULT sele VALID km1()
set colo to /b+
@6.25,16 say "请 选 择 类 型"FONT "宋体",10 ;
colo rgb(255,255,255,,,)
store subb to choi1
@ 7.3,12.6 GET CHOI1 FROM A FONT "宋体",12 RANGE 1,I FUNCTION "&T" ;
DEFAULT CHOI1 SIZE 9,20 color,n+/bg+,,,,r+/b+
@6.2,31.05 get aba3 picture "@*TCB X" size 0.96,1.91 ;
DEFAULT aba3 VALID km1()
read
if aba3=1
return
endif
use \xsk\&y\fox1-99
go choi1
store he0 to xhe
store name to name
dd="&xhe "
gg="xs"+chr(96+choi1)
set clock off
return
