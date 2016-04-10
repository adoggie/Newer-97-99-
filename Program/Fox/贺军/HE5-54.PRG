set talk off
do mm
do pprint
aba=0
aba3=0
@15.5,28.5 get aba picture "@*CB ty" size 2,6 DEFAULT sele VALID km1()
@5,34.91 get aba3 picture "@*TCB X" size 0.96,1.91 ;
DEFAULT aba3 VALID km1()
read
if aba3=1
return
endif
set colo to /bg+
@3,0 clear to 23,44
use abcd
inde on bmxzh to sy1
tota to abcd1 on bm fiel bm,bmxzh
use abcd1

count to ai
dime a(ai)
dime a1(ai)
FOR I=1 TO ai
use abcd1
go i
store bm to a(i)
store subs(bmxzh,1,1) to a1(i)
ENDF

set colo to /bg+
@3,0 clear to 23,44

store 33 to col1
store 2.3 to row1
@5,10 say ""
do he-hlhl
set colo to /b+
@5.25,19 say "请输入断点部门"FONT "宋体",10 colo rgb(255,255,255,,,)
set colo to /w+
aba4=0
nx=1
aba2=0
@6.45,35.25 get aba2 FUNCTION "*TH OK" SIZE 1.3,7 ;
FONT"宋体",12 COLOR RGB(255,255,255,,,,)
@6.5,10.8 GET nx PICTURE "@^" FROM a SIZE 1,24.2 ;
color,,,,,,g+/rb,r+/b,n+/bg+ ;
DEFAULT nx FONT "宋体",10 STYLE "B" VALID km()
@5.2,40.9 get aba4 picture "@*TCB X" size 0.96,1.91
read
if aba4=1
return
endif

set colo to /bg+
@3,0 clear to 23,44
nx=1
do while nx<=ai
store a(nx) to mbm
use &gg
sort to gzgz on bmxzh/ac,gh/ac for subs(bmxzh,1,1)=a1(nx)
use gzgz
*MODIFY REPORT he5-54.frx
*REPORT FORMAT he5-54.frx ENVIRONMENT PREVIEW
report form he5-54.frx noeject ENVIRONMENT noconsole to print
nx=nx+1
enddo
close data
RETURN

