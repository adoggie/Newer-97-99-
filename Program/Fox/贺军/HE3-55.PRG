set talk off
do mm
do he4-58
do mm
use \xsk\&y\he-ht
inde on a1 to \xsk\&y\sy1
use \xsk\&y\he-ht inde \xsk\&y\sy1
copy to \xsk\&y\ht
use \xsk\&y\ht
sum a11 to ok1
sum a13 to ok2
do while .t.
use \xsk\&y\ht
zx=1
zy=5
xy=1
*MODIFY REPORT he3-55.frx
*REPORT FORMAT c:\xsk\he3-55.frx ENVIRONMENT PREVIEW ;
*for recno()>=zx.and.recno()<zy
do while .t.
set colo to n+/bg+
report form he3-55.frx for recno()>=zx.and.recno()<=zy
store 78.9 to col1
store 23 to row1
@1,0.1 say ""
store 0 to aba,aba1,aba2,aba3
do he-hhhh
set colo to /b+
@1.25,30 say "查  询  全  部  合  同"FONT "宋体",10 COLOR RGB(255,255,255,,,)
set colo to /bg+
store 53.5 to col1
store 0.8 to row1
@22.2,2.5 say ""
do he-llhh
@22.6,4 say "合同总数量:"+str(ok1,7,2) FONT "宋体",12 COLOR RGB(255,255,255,,,)
@22.6,31 say "合同总金额:"+str(ok2,12,2) FONT "宋体",12 COLOR RGB(255,255,255,,,)
@22.2,59.3 get aba2 picture "@*TCB sy" size 1.8,8 ;
DEFAULT aba3 VALID km1()
@22.2,69.3 get aba picture "@*TCB xy" size 1.8,8 ;
DEFAULT aba3 VALID km1()
@2.6,13 get aba1 picture "@*TCB 102b" size 2.3,9 ;
DEFAULT aba3 VALID km1()
@1.2,76.9 get aba3 picture "@*TCB X" size 0.96,1.91 ;
DEFAULT aba3 VALID km1()
read
do case
case aba3=1
exit
case aba1=1
exit
case aba2=1
if zx>=5
store zx-5 to zx
store zy-5 to zy
store xy-1 to xy
endif
loop
endcase
store zx+5 to zx
store zy+5 to zy
store xy+1 to xy
enddo
if aba3=1
exit
endif
enddo
set colo to /bg+
clear
return
