set talk off
do while .t.
store gg to gok
store dd to dok
STORE 0 TO aba3
do he0-52
if aba3=1
exit
endif
set colo to /b+
@24,60 clear
use \xsk\&y\fox1-99
loca for dd=he0
store name to na
store "        " to ax2
set colo to bg+/7+
@11,56 clear to 20,77
store 21 to col1
store 8 to row1
@11,56 say ""
do he-hlhl
set colo to /b+
@11.2,58.5 say "此类操作员姓名"FONT"宋体",12 color rgb(255,255,255,,,)
set colo to /w+
store 8 to col1
store 0 to row1
@14,67 say ""
do he-llhh
*@13,58 say " 【 修改姓名 】"FONT"宋体",12 color rgb(0,0,0,,,)
@14,58 say "原操作员" FONT"宋体",12 color rgb(0,0,0,,,)
@14,67 say na FONT"宋体",12 color rgb(0,0,0,,,)
store 8 to col1
store 0 to row1
@16,67 say ""
do he-llhh
@16,58 say "新操作员"FONT"宋体",12 color rgb(0,0,0,,,)
@16,67 get ax2 FONT"宋体",12 SIZE 0.85,8 color rgb(0,0,0,,,)
STORE 0 TO aba,aba3
@18,64 get aba FUNCTION "*TH OK" SIZE 1.3,6.8 ;
COLOR RGB(255,255,255,,,,) FONT"宋体",12
@11.2,74.9 get aba3 picture "@*TCB X" size 0.96,1.91 ;
DEFAULT aba3 VALID km1()
read
if ax2="        "
store na to ax2
endif
do case
case aba=1
repl name with ax2
loop
case aba3=1
loop
endcase
enddo
set colo to 7/bg+
@0,0 clear
store gok to gg
store dok to dd
use \xsk\&y\fox1-99
repl yk10 with dd
go 2
repl yk10 with gg
use
return

