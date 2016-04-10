set talk off
do mm
yx=str((val(subs(y,3,2))*100+val(m))*100+val(d),6)
sele 1
use &gg-xl
zap
sele 2
use &gg
inde on subs(t1,1,2) to sy1
use &gg inde sy1
aok=0
aok1=0
bok=1
do while .not.eof()
sele 2
store subs(t1,1,2) to ok1
store t12+aok1 to aok1
store t13+aok to aok
store bok+1 to bok
skip
if ok1<>subs(t1,1,2).and..not.eof()
sele 1
appe blan
repl t1 with ok1,t5 with yx,t12 with bok-1,t13 with aok;
,t16 with aok1
aok1=0
aok=0
bok=1
endif
enddo
sele 1
appe blan
repl t1 with ok1,t5 with yx,t12 with bok-1,t13 with aok;
,t16 with aok1
use &gg-xl
do cl-aff
mt=12
mn=6
set colo to /n
@6,11 clear to 23,70
set colo to n/w+
@5,9 clear to 22,68
*@21,36 say t5
do while .not.eof()
set colo to gr+/w+
@mn+0,mt say "小类号     小 类 资 金"
@mn+1,mt say "======     ==========="
mn=8
set colo to n/w+
do while .not.eof()
@mn,mt+2 say t1
@mn,mt+10 say t13
skip
if mn>=21
mn=6
mt=43
exit
endif
mn=mn+1
enddo
enddo
sele 1
use &gg-xl
store t5 to tt5
sum t12,t13,t16 to tt12,tt13,tt16
set colo to gr+/w
@18,44 say "卡片总数:"+str(tt12,12)
@19,44 say "库存数量:"+str(tt16,12,3)
@20,44 say "库存金额:"+str(tt13,12,2)
@21,44 say "统计日期:      "+tt5
wait ""
do mm
return

