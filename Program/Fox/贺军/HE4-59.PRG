set talk off
do mm
set colo to gr+/b
@12,15 say "…‘  µ»....."
sele 1
use fox1-99
do while .t.
sele 1
if he0<>"   "
store he1 to ok
sele 2
use &ok
do while .not.eof()
store roun(t12/lte,1) to llte
if lte<>0
repl kgl with llte
endif
skip
enddo
sele 1
skip
if he0="     "
exit
endif
loop
enddo
return
 ç
