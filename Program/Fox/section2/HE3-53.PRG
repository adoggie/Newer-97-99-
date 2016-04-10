set talk off
do mm
use \xsk\&y\he-r0
zap
ax1=0
ax2=0
use \xsk\&y\&gg-y
tota to \xsk\&y\he-r0 on a2 fiel a2
use \xsk\&y\he-r0
count to ai
DIMENSION A(ai)
FOR I=1 TO ai
go i
store a2 to A(i)
ENDF
store ai to choi1
*store subb to choi1
do while .t.
ax1=0
store 11 to col1
store 10.1 to row1
@6,45.6 say ""
do he-hlhl
set colo to r+/b+
@6.25,47 say "选择日期"FONT "宋体",10 COLOR RGB(255,255,255,,,)
SET COLO TO /BG+
@ 7.4,46.1 GET CHOI1 FROM A FONT "宋体",12 RANGE 1,I FUNCTION "&T" ;
DEFAULT CHOI1 SIZE 8,10 color,n+/bg+,,,,r+/b+
@6.2,54.5 get ax1 picture "@*TCB X" size 0.96,1.91
*@6.2,54.6 get ax1 FUNCTION "*TH X" SIZE 1,1 ;
*COLOR RGB(255,255,255,,,,)FONT"宋体",10
read
if ax1=1
exit
endif
set colo to /bg+
use \xsk\&y\&gg-y &&日报库
loca for a2=a(choi1)
store a2 to b2
store a3 to b3
store a4 to b4
store a5 to b5
store a6 to b6
store a7 to zb1
store a8 to b8
SKIP
store a3 to x2
store a4 to s2
store a5 to f2
store a7 to zb2
SKIP
store a3 to x3
store a4 to s3
store a5 to f3
store a7 to zb3
store zb1+zb2+zb3 to b7
*MODIFY REPORT he3-53.frx
*REPORT FORMAT c:\xsk\he3-53.frx ENVIRONMENT PREVIEW
report form he3-53.frx

store 76.5 to col1
store 20 to row1
@1,1.5 say ""
aba3=0
do he-hhhh
set colo to /b+
@1.25,32 say "查  询  月  报  表"FONT "宋体",10 COLOR RGB(255,255,255,,,)
set colo to /bg+
@3.5,12.9 get aba3 picture "@*TCB 102b" size 2.2,9 ;
DEFAULT aba3 VALID km1()
@1.2,75.9 get aba3 picture "@*TCB X" size 0.96,1.91 ;
DEFAULT aba3 VALID km1()
read
if aba3=1
exit
endif
enddo
set colo to /bg+
clear
if ax2=1
close data
keyb "" +chr(13)
return
ENDIF
RETURN

