set talk off
push key clear
set colo to n/bg+
store 1 to kp
sele 3
if eof()
pop key
return
endif
tota to \xsk\&y\&gg-00 on t2 fiel t2
sele 6
use \xsk\&y\&gg-00
count to ai
use \xsk\&y\&gg-00
dime ch(ai)
i=1
do while .not.eof()
store t2 to ch(i)
skip
i=i+1
enddo

me=1
store 21.2 to col1
store 20 to row1
@0.5,5.1 say ""
do he-hhll
set colo to n+/bg+,r+/b
@0.7,5.6 GET me FROM ch FONT "ËÎÌו",12 RANGE 1,I FUNCTION "&T" ;
DEFAULT ne SIZE 12,20 color,w+/7+,r+/b+
read
@0,0 clear to 24,32
go me
store t2 to tt2
@4,42 say tt2 FONT "ËÎÌו",12&& SIZE 0.85,28
sele 6
use
sele 3
go 1
set colo to gr+/b+,n+/w
pop key
return

