set talk off
STORE 0 TO I,SUU
use \xsk\&y\&gg-tp
count to ai for he0<>"        "
if ai=0
set colo to /bg+
clear
return
endif
DIMENSION A(ai)
use \xsk\&y\&gg-tp
FOR I=1 TO ai
go i
store HE0 to a(i)
ENDF
use
STORE 1 TO CHOI1
do while .t.
do sx
*set clock to 26.4,65
set colo to n+/bg+,r+/b+
sele=0
aba=0
@0.7,19.6 get sele picture "@*CB 102" size 2,34 DEFAULT sele VALID mm()
store 33.1 to col1
store 21.9 to row1
@3,20 say ""
do he-hlhl
set colo to r+/b+
@ 3.25,27.4 say "产    品    名    称"FONT "宋体",10 COLOR RGB(255,255,255,,,)
@ 4.3,20.5 GET CHOI1 FROM A FONT "宋体",12 RANGE 1,I FUNCTION "&T" ;
DEFAULT CHOI1 SIZE 18,32 VALID mm() color,n+/bg+,,,,r+/b+
@3.2,51 get aba picture "@*TCB X" size 0.96,1.91
*@3.2,51.1 get aba FUNCTION "*TH X" FONT "宋体",10 ;
*SIZE 1,1 COLOR,r+/b,gr/bg,n+/w
read
if aba=1
exit
endif
STORE CHOI1 TO SUU
set colo to gr+/b+
clear
set clock off
store "t"+ltri(trim(str(choi1,2)))+".bmp" to tp
@0.1,0.5 get sele picture "@*CB \xsk\&y\&tp" size 27.1,59.9 VALID tm()
*do tm
@25.7,66 get aba FUNCTION "*TH 退 出" SIZE 1.3,8 ;
FONT "宋体",12 COLOR,r+/b,gr/bg,n+/w
read
set colo to 7/bg+
clear
enddo
set colo to /bg+
clear
return
