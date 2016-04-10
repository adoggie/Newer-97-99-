set talk off
do mm
store 36.6 to col1
store 10.6 to row1
@8.3,42.3 say ""
do he-hlhl
store 0 to aba,aba3
store 1 to lk
set colo to r+/b+
@8.55,54 say "查询年度合同统计"FONT"宋体",10 COLOR RGB(255,255,255,,,,)
set colo to w+/7

store 1998 to ym1
store 1 to mm1
store 1 to dm1
store floor(val(y)) to ym2
store floor(val(m)) to mm2
store floor(val(d)) to dm2
@10,43 say "合同起始日期:"FONT"宋体",12
@10,62 say "年     月     日"FONT"宋体",12 COLOR RGB(255,255,255,,,,)
@10,56 get ym1 spinner 1,1997,2005 FONT "宋体",12 ;
size 1.2,4 COLOR,,,,,w+/n+,r+/bg+,gr+/g+
@10,65 get mm1 spinner 1,1,12 FONT "宋体",12 ;
size 1.2,2 COLOR,,,,,w+/n+,r+/bg+,gr+/g+
@10,72 get dm1 spinner 1,1,31 FONT "宋体",12 ;
size 1.2,2 COLOR,,,,,w+/n+,r+/bg+,gr+/g+
@12,43 say "合同终止日期:"FONT"宋体",12
@12,62 say "年     月     日"FONT"宋体",12 COLOR RGB(255,255,255,,,,)
@12,56 get ym2 spinner 1,1997,2005 FONT "宋体",12 ;
size 1.2,4 COLOR,,,,,w+/n+,r+/bg+,gr+/g+
@12,65 get mm2 spinner 1,1,12 FONT "宋体",12 ;
size 1.2,2 COLOR,,,,,w+/n+,r+/bg+,gr+/g+
@12,72 get dm2 spinner 1,1,31 FONT "宋体",12 ;
size 1.2,2 COLOR,,,,,w+/n+,r+/bg+,gr+/g+

@8.5,76.8 get aba3 picture "@*TCB X" size 0.96,1.91 ;
DEFAULT aba3 VALID km1()
@14,52 get lk FUNCTION "*RV 已经完成合同;尚未完成合同;年度所有合同" ;
font "宋体",12 size 1,12,0 color,,,,,,g+/rb,gr+/b,n+/w+,,w+/w
@18,55 get aba FUNCTION "*TH 确定" SIZE 1.3,10 ;
COLOR RGB(255,255,255,,,,)FONT"宋体",12
read
if aba3=1
return
endif
store str(ym1,4)+subs(str(mm1+100,3),2,2)+subs(str(dm1+100,3),2,2) to yx1
store str(ym2,4)+subs(str(mm2+100,3),2,2)+subs(str(dm2+100,3),2,2) to yx
*do he4-58
do mm
set colo to /bg+
clear
use \xsk\&y\he-ht
do case
case lk=1
inde on a1 to \xsk\&y\sy1 for (a15>=yx1.and.a15<=yx).and.wc=1
use \xsk\&y\he-ht inde \xsk\&y\sy1
copy to \xsk\&y\ht
use \xsk\&y\ht
sum a11 to ok1
sum a13 to ok2
case lk=2
inde on a1 to \xsk\&y\sy1 for (a15>=yx1.and.a15<=yx).and.wc=0
use \xsk\&y\he-ht inde \xsk\&y\sy1
copy to \xsk\&y\ht
use \xsk\&y\ht
sum a11 to ok1
sum a13 to ok2
case lk=3
inde on a1 to \xsk\&y\sy1 for (a15>=yx1.and.a15<=yx)
use \xsk\&y\he-ht inde \xsk\&y\sy1
copy to \xsk\&y\ht
use \xsk\&y\ht
sum a11 to ok1
sum a13 to ok2
endcase

do while .t.
use \xsk\&y\ht
zx=1
zy=5
xy=1
*MODIFY REPORT he3-57.frx
*REPORT FORMAT c:\xsk\he3-57.frx ENVIRONMENT PREVIEW ;
*for recno()>=zx.and.recno()<zy.and.subs(a15,1,4)=yx
do while .t.
set colo to n+/bg+
report form he3-57.frx for recno()>=zx.and.recno()<=zy&&.and.subs(a15,1,4)=yx
store 78.9 to col1
store 23 to row1
@1,0.1 say ""
store 0 to aba,aba1,aba2,aba3
do he-hhhh
set colo to /b+
@1.25,34 say "查  询  合  同"FONT "宋体",10 COLOR RGB(255,255,255,,,)
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
