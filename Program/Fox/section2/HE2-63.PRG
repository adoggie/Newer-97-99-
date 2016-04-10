set talk off
ok=1
do while .t.
do case
case ok=1
use hya
case ok=2
use hyb
case ok=3
use hyc
case ok=4
use hyd
case ok=5
use hye
case ok=6
use hyf
case ok=7
use hyg
case ok=8
exit
endcase
dele all for subs(t1,1,2)="30"
pack
ok=ok+1
enddo
return

