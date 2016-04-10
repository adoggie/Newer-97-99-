set talk off
set cons off
tad="4960003"
do ymd
do mm
use bbbb
sum val(subs(tt,1,5))+val(subs(tt,6,2))/100 to bbbz
count to bbbs
store ltri(str(int(bbbz),7)) to bbbz1
store ltri(str(((bbbz-int(bbbz))*100),2)) to bbbz2
if len(bbbz2)=1
store bbbz2+"0" to bbbz2
endif
store bbbz1+bbbz2 to bbbz
store ltri(str(bbbs,5)) to bbbs
do while .t.

if len(bbbz)=11
exit
endif
store "000"+bbbz to bbbz
enddo
do while .t.
if len(bbbs)=5
exit
endif
store "0"+bbbs to bbbs
enddo
do mm
sele 1
use slfgtf
zap
appe blan
repl e1 with "F"+" &tad"+" &yxmxdx"+" &bbbs"+" &bbbz"+" 0"
sele 2
use bbbb
do while .not.eof()
sele 2
store z5 to v5
store tt to v6
sele 1
appe blan
repl e1 with "&v5"+" &v6"
sele 2
skip
enddo
return

