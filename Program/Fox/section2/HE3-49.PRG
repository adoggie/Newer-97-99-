set talk off
do mm
select 1
use &gg
inde on bm to sy
use &gg inde sy
select 3
use abcd
count to ai
sort to abcd1 on bm/ac,xz/ac
dime a(ai)
dime a1(ai)
dime a2(ai)
dime a3(ai)
FOR I=1 TO ai
use abcd1
go i
store subs(bm,1,8)+"_"+allt(xz) to a(i)
store bmxzh to a1(i)
store subs(bmxzh,1,1) to a2(i)
store sxh to a3(i)
ENDF
select 1
gh1=0
store 0 to aba1,aba2,aba3
store 28 to col1
store 2 to row1
@4,43 say ""
do he-hlhl
store 4 to col1
store 0 to row1
@5.6,56 say ""
do he-llhh
set colo to /b+
@4.25,51 say "人 员 查 询"FONT "宋体",10 color rgb(255,255,255,,,)
set colo to /w+
@5.6,44.5 say "请输入工号:"FONT "宋体",12 color rgb(0,0,0,,,)
@5.6,56 get gh1 pict "9999"FONT "宋体",12 size 0.85,4
@5.3,61.6 get aba2 FUNCTION "*TH OK" SIZE 1.3,9 ;
FONT"宋体",12 COLOR RGB(255,255,255,,,,)

@4.2,68.9 get aba3 picture "@*TCB X" size 0.96,1.91
read
if gh1=0.or.aba3=1
return
endif
sele 1
loca for gh=gh1
if eof()
SET COLO TO  W/R
@4.25,51 say "查无此人 !"FONT "宋体",12 color rgb(0,0,0,,,)
mx=0
do while mx<300
mx=mx+1
enddo
return
endif
do while .t.
SET COLO TO /BG
store bm to mbmxzh
sele 3
loca for subs(bm,1,8)+"_"+allt(xz)=allt(mbmxzh)
store recno() to aba1
sele 1
store xm to mxm
store gh to gh1
store bmh to mbmh
store zhang to mzhang
store year to myear
store month to mmonth
store a01 to ma01
store a02 to ma02
store a03 to ma03
store a04 to ma04
store a05 to ma05
store a06 to ma06
store a07 to ma07
store a08 to ma08
store a09 to ma09
store a10 to ma10
store a11 to ma11
store a12 to ma12
store a13 to ma13
store a14 to ma14
store a15 to ma15
store a16 to ma16
store b01 to mb01
store b02 to mb02
store b04 to mb04
store b05 to mb05
store b06 to mb06
store b07 to mb07
store c01 to mc01
store c02 to mc02
store c04 to mc04
store abc to sf
store q01 to mq01
store q02 to mq02
store q03 to mq03

store 76 to col1
store 21.5 to row1
@1.7,2 say ""
do he-hlhl
@2.95,37 TO 24.05,37 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@2.95,37.1 TO 24.05,37.1 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
@2.95,37.2 TO 24.05,37.2 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
store 4 to col1
store 0 to row1
@3.5,14 say ""
do he-llhh
store 8 to col1
store 0 to row1
@5,14 say ""
do he-llhh
store 12 to col1
store 0 to row1
@6.5,14 say ""
do he-llhh
store 8 to col1
store 0 to row1
@3.5,48 say ""
do he-llhh
store 8 to col1
store 0 to row1
@4.7,48 say ""
do he-llhh
store 8 to col1
store 0 to row1
@5.9,48 say ""
do he-llhh
store 8 to col1
store 0 to row1
@7.1,48 say ""
do he-llhh
store 8 to col1
store 0 to row1
@8.3,48 say ""
do he-llhh
store 8 to col1
store 0 to row1
@9.5,48 say ""
do he-llhh
store 8 to col1
store 0 to row1
@10.7,48 say ""
do he-llhh
store 8 to col1
store 0 to row1
@11.9,48 say ""
do he-llhh
store 8 to col1
store 0 to row1
@13.1,48 say ""
do he-llhh
store 8 to col1
store 0 to row1
@14.3,48 say ""
do he-llhh
store 8 to col1
store 0 to row1
@15.5,48 say ""
do he-llhh
store 8 to col1
store 0 to row1
@16.7,48 say ""
do he-llhh
store 8 to col1
store 0 to row1
@17.9,48 say ""
do he-llhh
store 8 to col1
store 0 to row1
@19.1,48 say ""
do he-llhh
store 8 to col1
store 0 to row1
@20.3,48 say ""
do he-llhh
store 8 to col1
store 0 to row1
@22.5,48 say ""
do he-llhh
store 8 to col1
store 0 to row1
@3.5,68 say ""
do he-llhh
store 8 to col1
store 0 to row1
@4.7,68 say ""
do he-llhh
store 8 to col1
store 0 to row1
@5.9,68 say ""
do he-llhh
store 8 to col1
store 0 to row1
@7.1,68 say ""
do he-llhh
store 8 to col1
store 0 to row1
@8.3,68 say ""
do he-llhh
store 8 to col1
store 0 to row1
@9.5,68 say ""
do he-llhh
store 8 to col1
store 0 to row1
@10.7,68 say ""
do he-llhh
store 8 to col1
store 0 to row1
@11.9,68 say ""
do he-llhh
store 8 to col1
store 0 to row1
@13.1,68 say ""
do he-llhh
store 8 to col1
store 0 to row1
@14.3,68 say ""
do he-llhh
store 8 to col1
store 0 to row1
@15.5,68 say ""
do he-llhh
store 8 to col1
store 0 to row1
@16.7,68 say ""
do he-llhh
store 8 to col1
store 0 to row1
@17.9,68 say ""
do he-llhh
store 8 to col1
store 0 to row1
@19.1,68 say ""
do he-llhh
store 8 to col1
store 0 to row1
@20.3,68 say ""
do he-llhh
store 8 to col1
store 0 to row1
@22.5,68 say ""
do he-llhh
store 22 to col1
store 0 to row1
@8,14 say ""
do he-llhh
store 0 to aba2,aba3,sr,kq
set colo to g+/b
@ 1.95,31 say " 人   员   查   询 "FONT "宋体",10 color rgb(255,255,255,,,)
set colo to /w+
@3.5,4 say "工    号:"FONT "宋体",12 color rgb(0,0,0,,,)
@3.5,14 say str(gh1,4) FONT "宋体",12 color rgb(255,255,255,,,)
@5,4 say "姓    名:"FONT "宋体",12 color rgb(0,0,0,,,)
@5,14 say mxm FONT "宋体",12 color rgb(255,255,255,,,)
@6.5,4 say "账    号:"FONT "宋体",12 color rgb(0,0,0,,,)
@6.5,14 say mzhang FONT "宋体",12 color rgb(255,255,255,,,)
@8,4 say '部    门:'FONT "宋体",12 color rgb(0,0,0,,,)
@8,14 say a(aba1) FONT "宋体",12 color rgb(255,255,255,,,)
*@ 12,11 say '单    位:'+C->xz+'_'+mxzh
@9.5,4 say '工作年月:'FONT "宋体",12 color rgb(0,0,0,,,)
@9.5,14.5 say '  年   月'FONT "宋体",12 color rgb(0,0,0,,,)
store 2 to col1
store 0 to row1
@9.5,14 say ""
do he-llhh
store 2 to col1
store 0 to row1
@9.5,19 say ""
do he-llhh
@9.5,14 say str(myear,2) FONT "宋体",12 color rgb(255,255,255,,,)
@9.5,19 say str(mmonth,2) FONT "宋体",12 color rgb(255,255,255,,,)
@3.5,38 say '基    薪:'FONT "宋体",12 color rgb(0,0,0,,,)
@3.5,48 say str(ma01,8,2) FONT "宋体",12 color rgb(255,255,255,,,)
@4.7,38 say '浮    动:'FONT "宋体",12 color rgb(0,0,0,,,)
@4.7,48 say str(ma02,8,2) FONT "宋体",12 color rgb(255,255,255,,,)
@5.9,38 say '工 龄 贴:'FONT "宋体",12 color rgb(0,0,0,,,)
@5.9,48 say str(ma04,8,2) FONT "宋体",12 color rgb(255,255,255,,,)
@7.1,38 say '副 食 贴:'FONT "宋体",12 color rgb(0,0,0,,,)
@7.1,48 say str(ma03,8,2) FONT "宋体",12 color rgb(255,255,255,,,)
@8.3,38 say '岗 位 贴:'FONT "宋体",12 color rgb(0,0,0,,,)
@8.3,48 say str(ma05,8,2) FONT "宋体",12 color rgb(255,255,255,,,)
@9.5,38 say '洗 理 费:'FONT "宋体",12 color rgb(0,0,0,,,)
@9.5,48 say str(ma06,8,2) FONT "宋体",12 color rgb(255,255,255,,,)
@10.7,38 say '房    贴:'FONT "宋体",12 color rgb(0,0,0,,,)
@10.7,48 say str(ma07,8,2) FONT "宋体",12 color rgb(255,255,255,,,)
@11.9,38 say '水 电 贴:'FONT "宋体",12 color rgb(0,0,0,,,)
@11.9,48 say str(ma08,8,2) FONT "宋体",12 color rgb(255,255,255,,,)
@13.1,38 say '独 生 费:'FONT "宋体",12 color rgb(0,0,0,,,)
@13.1,48 say str(ma09,8,2) FONT "宋体",12 color rgb(255,255,255,,,)
@14.3,38 say '郊    补:'FONT "宋体",12 color rgb(0,0,0,,,)
@14.3,48 say str(ma11,8,2) FONT "宋体",12 color rgb(255,255,255,,,)
@15.5,38 say '书 报 费:'FONT "宋体",12 color rgb(0,0,0,,,)
@15.5,48 say str(ma12,8,2) FONT "宋体",12 color rgb(255,255,255,,,)
@16.7,38 say '交 通 费:'FONT "宋体",12 color rgb(0,0,0,,,)
@16.7,48 say str(ma13,8,2) FONT "宋体",12 color rgb(255,255,255,,,)
@17.9,38 say '小 修 贴:'FONT "宋体",12 color rgb(0,0,0,,,)
@17.9,48 say str(ma14,8,2) FONT "宋体",12 color rgb(255,255,255,,,)
@19.1,38 say '补养老金:'FONT "宋体",12 color rgb(0,0,0,,,)
@19.1,48 say str(ma15,8,2) FONT "宋体",12 color rgb(255,255,255,,,)
@20.3,38 say '其它津贴:'FONT "宋体",12 color rgb(0,0,0,,,)
@20.3,48 say str(ma16,8,2) FONT "宋体",12 color rgb(255,255,255,,,)
store ma01+ma02+ma03+ma04+ma05+ma06+ma07+ma08+ma09;
+ma11+ma12+ma13+ma14+ma15+ma16 to sr
set colo to g+/w+
@22.5,38 say "发出小计:"FONT "宋体",12
@22.5,48 say str(sr,8,2) FONT "宋体",12

@3.5,58 say '房    租:'FONT "宋体",12 color rgb(0,0,0,,,)
@3.5,68 say str(mb01,8,2) FONT "宋体",12 color rgb(255,255,255,,,)
@4.7,58 say '医 疗 费:'FONT "宋体",12 color rgb(0,0,0,,,)
@4.7,68 say str(mb04,8,2) FONT "宋体",12 color rgb(255,255,255,,,)
@5.9,58 say '储蓄每月:'FONT "宋体",12 color rgb(0,0,0,,,)
@5.9,68 say str(mb05,8,2) FONT "宋体",12 color rgb(255,255,255,,,)
@7.1,58 say '扣养老金:'FONT "宋体",12 color rgb(0,0,0,,,)
@7.1,68 say str(mc01,8,2) FONT "宋体",12 color rgb(255,255,255,,,)
@8.3,58 say '公 积 金:'FONT "宋体",12 color rgb(0,0,0,,,)
@8.3,68 say str(mc02,8,2) FONT "宋体",12 color rgb(255,255,255,,,)
@9.5,58 say '电 话 费:'FONT "宋体",12 color rgb(0,0,0,,,)
@9.5,68 say str(mc04,8,2) FONT "宋体",12 color rgb(255,255,255,,,)
@10.7,58 say '工 会 费:'FONT "宋体",12 color rgb(0,0,0,,,)
@10.7,68 say str(mb02,8,2) FONT "宋体",12 color rgb(255,255,255,,,)
@11.9,58 say '病 事 假:'FONT "宋体",12 color rgb(0,0,0,,,)
*@11,9,68 say str(mb01,8,2) FONT "宋体",12 color rgb(255,255,255,,,)
@13.1,58 say "个 调 税:"FONT "宋体",12 color rgb(0,0,0,,,)
@13.1,68 say str(mb06,8,2) FONT "宋体",12 color rgb(255,255,255,,,)
@14.3,58 say "其它扣除:"FONT "宋体",12 color rgb(0,0,0,,,)
@14.3,68 say str(mb07,8,2) FONT "宋体",12 color rgb(255,255,255,,,)
@15.5,58 say "当月信息1"FONT "宋体",12 color rgb(0,0,0,,,)
@15.5,68 say str(mq01,8,2) FONT "宋体",12 color rgb(255,255,255,,,)
@16.7,58 say "当月信息2"FONT "宋体",12 color rgb(0,0,0,,,)
@16.7,68 say str(mq02,8,2) FONT "宋体",12 color rgb(255,255,255,,,)
@17.9,58 say "当月信息3"FONT "宋体",12 color rgb(0,0,0,,,)
@17.9,68 say str(mq03,8,2) FONT "宋体",12 color rgb(255,255,255,,,)
store mb01+mb02+mb04+mb05+mc01+mc02+mc04+mb06+mb07+mq01+mq02+mq03 to kq
set colo to r+/w+
@22.5,58 say "扣除小计:"FONT "宋体",12
@22.5,68 say str(kq,8,2) FONT "宋体",12
store sr-kq to sf
set colo to g+/w+
store 8 to col1
store 0 to row1
@13,14 say ""
do he-llhh
@13,4 say "工资实发:"FONT "宋体",12
@13,14 say str(sf,8,2) FONT "宋体",12
@19.5,8.5 get aba2 picture "@*BH sy;xy" size 1.9,8,2.5 ;
DEFAULT sele VALID km()
*@22,8.6 get aba2 FUNCTION "*TH OK" SIZE 1.3,9 ;
*FONT"宋体",12 COLOR RGB(255,255,255,,,,)
@1.9,75.9 get aba3 picture "@*TCB X" size 0.96,1.91
read
if aba3=1
exit
endif
do case
case aba2=1
sele 1
skip -1
loop
case aba2=2
sele 1
skip
loop
endcase
enddo
close data
if aba2=1
keyb "" +chr(13)
endif
set colo to /bg+
clear
return
