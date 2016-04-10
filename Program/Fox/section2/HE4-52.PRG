set talk off
set cons on
do mm
USE &gg
set colo to g+/b+
set device to screen
REPL ALL b06 WITH 0
repl all tt with a01+a02+a03+a04+a05+a06+a07+a08+a09+a11+a12+a13+;
a14+a15+a16-b01-b02-b04-b05-b06-b07-c01-c02-c04-q01-q02-q03
REPL ALL b06 WITH ((A01+A03+A04+A05+A15-C01-C02)-1000)*0.05 ;
FOR subs(BM,1,8)<>"退休人员"
REPL ALL b06 WITH 0 FOR b06<0
REPL ALL abc WITH TT-b06
USE
return

SET TALK OFF
CLEAR
USE LIB INDEX LIB
set colo to g+/b+
set device to screen
@10,22 say "正在计算个人调节税,请稍候...."
REPL ALL A16 WITH 0
repl all tt with a01+a02+a03+a04+a05+a06+a07+a08+a09+a10+a11+a12+a13+;
a14+a15+a16-b01-b02-b04-b05-c01-c02-c04
REPL ALL A16 WITH (A01+A03+A04+A05+A15-C01-C02)-1000 FOR BMXZH<>"MA"
REPL ALL A16 WITH A16*0.05*(-1) FOR BMXZH<>"MA"
REPL ALL A16 WITH 0 FOR A16>0
REPL ALL TT WITH TT+A16
USE
clear
set colo to gr+/b+
*@ 10,30 say '个人调节税计算完毕!'
CLEAR
RETU
