return
set talk off
do mm
yx=str((((val(subs(y,3,2))*100+val(m))*100)+val(d)),6)
sele 1
use gzgw
sele 2
use &gg
do while .t.
sele 2
store gw to mgw
sele 1
loca for gw1=mgw
store gw2 to mgw2
sele 2
repl a05 with mgw2
skip
enddo
return
