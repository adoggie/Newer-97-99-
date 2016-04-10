set talk off
set cons on
set colo to /bg+,r+/b+
@3,0 clear to 20,40
nx=1
use fox1-99
repl yk10 with dd
go 2
repl yk10 with gg
go 4
STORE VAL(YK10) TO ZW
USE FOX1-99
i=0
use FOX1-99
count to ai
DIMENSION A(ai)
use FOX1-99
FOR I=1 TO ai
go i
store HE0 to a(i)
ENDF
store 41.2 to col1
store 20.9 to row1
@3,1 say ""
do he-hhll
@ 3.2,1.5 GET zw FROM A FONT "ËÎÌו",12 RANGE 1,I FUNCTION "&T" ;
DEFAULT zw SIZE 18,40 color,n+/7,r+/b+
read
use fox1-99
go zw
if he0="      "
return
endif
store he0 to dd
store "xs"+trim(ltri(str(zw,2))) to gg
USE FOX1-99
GO 4
REPL YK10 WITH STR(ZW,2)
USE
return
