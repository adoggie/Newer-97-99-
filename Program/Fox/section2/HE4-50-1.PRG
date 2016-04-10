set talk off
do mm-1
sele 1
use &gg
inde on bmxzh to sy-1
use &gg inde sy-1
sele 2
use bbbb
zap
a4=0
sele 1
do while .not.eof()
sele 1
store rtri(ltri(str(gh,4))) to a1
store xm to a2
store abc to a3
store rtri(ltri(str(int(a3),4))) to aaa3
store rtri(ltri(str(((a3-int(a3))*100),2))) to aaa4
do case
case len(aaa4)=2
store aaa3+aaa4 to aa3
case len(aaa4)=1
store aaa3+"0"+aaa4 to aa3
case len(aaa4)=" "
store aaa3+"00" to aa3
endcase
do while .t.
if len(aa3)=7
exit
endif
store "0"+aa3 to aa3
enddo
do while .t.
if len(a1)=4
exit
endif
store "0"+a1 to a1
enddo
store zhang to azh
a4=a4+1
store str(a4,5) to aa4
do while .t.
if len(rtri(ltri(aa4)))=5
exit
endif
store "0"+rtri(ltri(aa4)) to aa4
enddo
sele 2
appe blan
repl no with a1,name with a2,z3 with aa4,;
z5 with azh,tt with aa3
sele 1
skip
enddo
return

