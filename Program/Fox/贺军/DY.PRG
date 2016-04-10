set talk off
do while .t.
store 0 to aba3
store 31 to col1
store 2 to row1
@4,47.5 say ""
do he-hlhl
store 8 to col1
store 0 to row1
@5.6,63.8 say ""
do he-llhh
set colo to /b+
@4.25,59 say okok FONT "ËÎÌå",10 color rgb(255,255,255,,,)
set colo to /w+
@5.6,48.2 say "ÇëÊäÈë&okok:"FONT "ËÎÌå",12 color rgb(0,0,0,,,)
@5.6,63.8 get ghg1 pict "99999.99"FONT "ËÎÌå",12 size 0.85,8
@5.3,72.1 get aba2 FUNCTION "*TH OK" SIZE 1.3,6 ;
FONT"ËÎÌå",12 COLOR RGB(255,255,255,,,,)
@4.2,76.4 get aba3 picture "@*TCB X" size 0.96,1.91
read
if ghg1=0.or.aba3=1.or.aba2=1
exit
endif
enddo
set colo to /bg+
@3,47.5 clear to 10,80
return
