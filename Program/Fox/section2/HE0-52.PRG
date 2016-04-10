set talk off
do sx
STORE 0 TO I,aba3
use he0-52
store yk10 to choi1
count to ai
DIMENSION A(ai)
FOR I=1 TO ai
go i
store he0 to a(i)
ENDF
set colo to n+/bg+,r+/b+
store 0 to aba3,sele
@4.1,27.6 get sele picture "@*CB 102a" size 1.7,20.1 DEFAULT sele VALID km1()
store 19.1 to col1
store 4.7 to row1
@6,28 say ""
do he-hlhl
set colo to /b+
@6.25,32.5 say "请选择管理"FONT "宋体",10 ;
colo rgb(255,255,255,,,)
@ 7.3,28.5 GET CHOI1 FROM A FONT "宋体",12 RANGE 1,I FUNCTION "&T" ;
DEFAULT CHOI1 SIZE 3.5,18.1 color,n+/bg+,,,,r+/b+
@6.2,45.05 get aba3 picture "@*TCB X" size 0.96,1.91 ;
DEFAULT aba3 VALID km1()
read
if aba3=1
return
endif
use he0-52
repl yk10 with choi1
use
do case
case choi1=1
store a(choi1) to dd
gg="gza"+allt(m)
oo="fox1-99"
use &oo
repl bb1 with b1,qq2 with q2,ss with s,xxl with xl,;
xxb with xb,yek with key
store he0 to xhe
store name to name
repl yk10 with dd
go 2
repl yk10 with gg
go 3
repl yk10 with str(choi1,2)
go 1
case choi1=2
store a(choi1) to dd
gg="gza"+allt(m)
oo="fox2-99"
use &oo
repl bb1 with b1,qq2 with q2,ss with s,xxl with xl,;
xxb with xb,yek with key
store he0 to xhe
store name to name
repl yk10 with dd
go 2
repl yk10 with gg
go 3
repl yk10 with str(choi1,2)
go 1
case choi1>=3
store a(choi1) to dd
gg="gz"+chr(96+choi1)+allt(m)
oo="fox3-99"
use &oo
repl bb1 with b1,qq2 with q2,ss with s,xxl with xl,;
xxb with xb,yek with key
store he0 to xhe
store name to name
repl yk10 with dd
go 2
repl yk10 with gg
go 3
repl yk10 with str(choi1,2)
go 1
endcase
set clock off
return
