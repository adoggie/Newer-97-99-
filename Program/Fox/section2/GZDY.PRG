set talk off
do while .t.
store 0 to aba3
store 30.5 to col1
store 4 to row1
@4,48 say ""
do he-hlhl
store 8 to col1
store 0 to row1
@5.6,64.5 say ""
do he-llhh
aba3=0
set colo to /b+
@4.25,59 say okok FONT "宋体",10 color rgb(255,255,255,,,)
set colo to /w+
@5.6,48.7 say "请输入&okok:"FONT "宋体",12 color rgb(0,0,0,,,)
@5.6,64.5 get ghg1 pict "99999.99"FONT "宋体",12 size 0.85,8
@5.45,72.7 get aba2 FUNCTION "*TH OK" SIZE 1.2,5.5 ;
FONT"宋体",12 COLOR RGB(255,255,255,,,,)
@4.2,76.4 get aba3 picture "@*TCB X" size 0.96,1.91
store 26 to col1
store 0.4 to row1
@7.1,50.4 say ""
do he-llhh
@7.3,51.1 get ags FUNCTION "*RVNH 不选用公式;要选用公式" ;
font "宋体",10 size 1,12,2 color,,,,,,g+/rb,gr+/b,n+/w+,,w+/w
read
if ghg1=0.or.aba3=1.or.aba2=1.or.ags=1
exit
endif
enddo
set colo to /bg+
@3,47.5 clear to 10,80
return
