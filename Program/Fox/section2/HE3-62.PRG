set talk off
do sx
*set clock to 26.4,0
STORE 0 TO I,CHOI1
use \xsk\&y\&gg-cpml
count to ai for he0<>"        "
if ai=0
use \xsk\&y\&gg-cpml
dd="  "
gg="xs1"
return
endif
go 3
store val(yk10) to subb
DIMENSION A(ai)
use \xsk\&y\&gg-cpml
FOR I=1 TO ai
go i
store HE0 to a(i)
ENDF
set colo to n+/bg+,r+/b+
sele=0
@0.6,19.6 get sele picture "@*CB 102" size 2,34 DEFAULT sele VALID km1()
store 33.1 to col1
store 22.1 to row1
@3,20 say ""
do he-hhll
store subb to choi1
@ 3.2,20.5 GET CHOI1 FROM A FONT "ËÎÌו",12 RANGE 1,I FUNCTION "&T" ;
DEFAULT CHOI1 SIZE 19,32 color,n+/bg+,,,,r+/b+
read
*use \xsk\&y\&gg-cpml
*go choi1
*store he0 to xhe
*dd="&xhe "
*gg="xs"+ltri(trim(str(choi1,2)))
use \xsk\&y\&gg-cpml
*repl yk10 with dd
go 3
repl yk10 with str(choi1,2)
go 1
set clock off
set colo to /bg+
clear
return
