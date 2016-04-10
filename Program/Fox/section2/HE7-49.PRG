set talk off
do he1-57
return
set colo to w+/bg+,n+/w+
@0,0 clear
set colo to n+/w
@0.6,29.1 clear to 26.3,44.7
set colo to w+/bg+
@1,10 say "【 输入产品目录 】"
@0,50 say " 全局数据库变量"
use fox1-99
nnn=1
nn=1
do while nn<26
store "xh"+trim(ltri(str(nn,2))) to xh
store he0 to &xh
@nnn,55 say "gg="+"xhe"+trim(ltri(str(nn,2)))
@0.6,29.1 TO 0.6,44.7 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
@0.95,29.9 TO 0.95,44 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@nnn,30 get &xh
@0.95,44 TO nnn+1,44 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
@0.6,44.7 TO nnn+1.4,44.7 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@0.95,29.9 TO nnn+1,29.9 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@0.6,29.1 TO nnn+1.3,29.1 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
nn=nn+1
nnn=nnn+1
skip
enddo
@ 26,29.9 TO 26,44.1 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
@ 26.3,29.1 TO 26.3,44.7 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
*do while .t.
STORE 0 TO aba
@24.8,46 get aba FUNCTION "*TH 存盘;重输;退出" SIZE 1.5,5 COLOR RGB(255,255,255,,,,)
read

if aba=1.or.aba=3
exit
endif
do sx
enddo
*if aba=1
*exit
*endif
*if aba=2
*loop
*endif
if aba=3
set colo to n+/bg+
clear
return
endif
use fox1-99
store nn to nnn
nn=1
do while nn<nnn
store "xh"+ltri(str(nn,2)) to xh
repl he0 with &xh,he1 with "hy"+chr(96+nn)
skip
nn=nn+1
enddo
USE
do he0-52
return
