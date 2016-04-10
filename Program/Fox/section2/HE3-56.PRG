set talk off
do mm
yx=str((((val(subs(y,3,2))*100+val(m))*100)+val(d)),6)
USE \xsk\&y\he-ht                &&合同库
tota to \xsk\&y\hth on a1 fiel a1
use \xsk\&y\hth
count to Ai FOR a1<>"        "
dime a(ai)
use \xsk\&y\hth
FOR I=1 TO Ai
go i
store a1 to a(i)
ENDF
store 30 to col1
store 2.3 to row1
@10,43 say ""
do he-hhhh
store spac(16) to xh1
store 0 to ht1,ht2,ht3
set colo to r+/b+
@10.20,49 say "请 输 入 合 同 编 号" FONT "宋体",10 COLOR RGB(255,255,255,,,)
store 0 to aba2,aba3
abc=1
set colo to n+/bg+
@11.5,43.5 GET abc PICTURE "@^" FROM a SIZE 0.7,20.7 ;
color,,,,,,g+/rb,r+/b,n+/bg+ ;
DEFAULT abc FONT "宋体",10 STYLE "B" VALID km()
@11.5,65 get ht1 FUNCTION "*TH OK" SIZE 1.3,7 ;
FONT"宋体",12 COLOR RGB(255,255,255,,,,)
@10.2,70.9 get ht3 picture "@*TCB X" size 0.96,1.91
READ
if ht3=1
return
endif
hth1=1
set colo to /bg+
@2,0 clear to 5,80
store 78.7 to col1
store 21 to row1
@2.3,0.2 say ""
do he-hlhl
store 28.1 to col1
store 0.2 to row1
@6.5,8.4 say ""
do he-llhh
store 28.1 to col1
store 0.2 to row1
@8.2,8.4 say ""
do he-llhh
store 28.1 to col1
store 0.2 to row1
@6.5,48.9 say ""
do he-llhh


set colo to /b+
@2.55,31.5 say "输 入 完 成 情 况"FONT "宋体",10 ;
COLOR RGB(255,255,255,,,)

set colo to /w+
store spac(30) to gf,xf
@6.5,1 say "供  方:"FONT "宋体",12 ;
COLOR RGB(0,0,0,,,)
@8.2,1 say "需  方:"FONT "宋体",12 ;
COLOR RGB(0,0,0,,,)
@6.5,39.5 say "鉴定地点:"FONT "宋体",12 ;
COLOR RGB(0,0,0,,,)
@8.2,39.5 say "鉴定时间:"FONT "宋体",12 ;
COLOR RGB(0,0,0,,,)
@8.2,54 say "年"FONT "宋体",12 COLOR RGB(0,0,0,,,)
@8.2,61 say "月"FONT "宋体",12 COLOR RGB(0,0,0,,,)
@8.2,68 say "日"FONT "宋体",12 COLOR RGB(0,0,0,,,)
@ 11.75,0.6 TO 11.75,78.7 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,,,)
@ 11.8,0.5 TO 11.8,78.7 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,,,)
set colo to /bg+
@11.9,0.6 clear to 20.75,78.7

@ 14.75,0.6 TO 14.75,78.7 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,,,)
@ 14.8,0.5 TO 14.8,78.7 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,,,)
@ 16.25,0.6 TO 16.25,78.7 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,,,)
@ 16.3,0.5 TO 16.3,78.7 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,,,)

@ 14.9,4.25 TO 16.25,4.25 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,,,)
@ 14.8,4.15 TO 16.25,4.15 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,,,)
@ 14.9,31.65 TO 16.25,31.65 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,,,)
@ 14.8,31.5 TO 16.25,31.5 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,,,)
@ 14.9,49.6 TO 16.25,49.6 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,,,)
@ 14.8,49.5 TO 16.25,49.5 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,,,)
@ 14.9,54.1 TO 16.25,54.1 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,,,)
@ 14.8,54.0 TO 16.25,54.0 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,,,)
@ 14.9,61.6 TO 16.25,61.6 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,,,)
@ 14.8,61.5 TO 16.25,61.5 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,,,)
@ 14.9,71.1 TO 16.25,71.1 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,,,)
@ 14.8,71.0 TO 16.25,71.0 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,,,)
@ 20.7,0.6 TO 20.7,78.7 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,,,)
@ 20.75,0.5 TO 20.75,78.7 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,,,)
store spac(28) to gfb,gfd,gft
store 17.4 to col1
store 0 to row1
@17,32 say ""
do he-llhh
store 4 to col1
store 0 to row1
@17,50 say ""
do he-llhh
store 7 to col1
store 0 to row1
@17,54.5 say ""
do he-llhh
store 9 to col1
store 0 to row1
@17,62 say ""
do he-llhh
store 7 to col1
store 0 to row1
@17,71.5 say ""
do he-llhh
store 27 to col1
store 0 to row1
@17,4.5 say ""
do he-llhh
store 3 to col1
store 0 to row1
@17,0.9 say ""
do he-llhh
store 4 to col1
store 0 to row1
@8.2,49.4 say ""
do he-llhh
store 2 to col1
store 0 to row1
@8.2,58.5 say ""
do he-llhh
store 2 to col1
store 0 to row1
@8.2,65.5 say ""
do he-llhh
store 26.3 to col1
store 0.6 to row1
@4.2,25.5 say ""
do he-llhh
aba=1
use \xsk\&y\he-ht               &&合同库
store a(abc) to xh1
loca for a1=xh1
store recno()-1 to oki
count to ai for a1=xh1
DIMENSION wcok(ai)
use \xsk\&y\he-ht
FOR I=1 TO ai
okok=oki+i
go okok
store wc to wcok(i)
ENDF
********************************
do while .t.
use \xsk\&y\he-ht               &&合同库
loca for a1=xh1
store wc to lk  &&合同完成情况
store a1 to aa1  &&合同编号
store a2 to aa2  &&供方
store a3 to aa3  &&需方
store a4 to aa4  &&签定地点
store a5 to aa5  &&签定时间
store a6 to aa6  &&产品名称
store a8 to aa8  &&型号规格
store a10 to aa10&&单位
store a11 to aa11&&数量
store a12 to aa12&&单价
store a13 to aa13&&总金额
store a15 to aa15&&提货时间
store anx to nx
store subs(aa5,1,4) to hy
store subs(aa5,5,2) to hm
store subs(aa5,7,2) to hd
sum a13 to hj for anx=nx.and.a1=xh1
use \xsk\&y\he-ht               &&合同库
loca for a1=xh1
nnx=1
store recno() to nok
store recno() to cok

do while .t.
store wcok(nnx) to lk
go nok
@6.5,8.5 edit aa2 size 1,28,0.000 nomodify scroll tab font "宋体",12 COLOR RGB(0,0,0,,,)
@8.2,8.5 edit aa3 size 1,28,0.000 nomodify scroll tab font "宋体",12 COLOR RGB(0,0,0,,,)
@6.5,49 edit aa4 size 1,28,0.000 nomodify scroll tab font "宋体",12 COLOR RGB(0,0,0,,,)
@8.2,49.4 say hy FONT "宋体",12 COLOR RGB(0,0,0,,,)
@8.2,58.5 say hm FONT "宋体",12 COLOR RGB(0,0,0,,,)
@8.2,65.5 say hd FONT "宋体",12 COLOR RGB(0,0,0,,,)
set colo to g+/bg+
@4.2,25.5 clear to 5.8,51.9
@4.5,26 say "合同编号:"+aa1 FONT "宋体",12 COLOR RGB(255,255,255,,,)
do case
case lk=1
@15.1,0.8 say "完成"FONT "宋体",10 COLOR RGB(255,255,255,,,)
case lk=0
@15.1,0.8 say "未完"FONT "宋体",10 COLOR RGB(255,255,255,,,)
endcase
@15.1,11 say "产   品   名   称"FONT "宋体",10 COLOR RGB(255,255,255,,,)
@15.1,35 say "型  号  规  格"FONT "宋体",10 COLOR RGB(255,255,255,,,)
@15.1,50.5 say "单位"FONT "宋体",10 COLOR RGB(255,255,255,,,)
@15.1,56 say "数 量"FONT "宋体",10 COLOR RGB(255,255,255,,,)
@15.1,63 say "单    价"FONT "宋体",10 COLOR RGB(255,255,255,,,)
@15.1,72 say "提货时间"FONT "宋体",10 COLOR RGB(255,255,255,,,)

@17.05,5 say a6 FONT "宋体",10 color rgb(0,0,0,,,)
@17.05,32 say a8 font "宋体",10 COLOR RGB(0,0,0,,,) &&型号规格
@17.05,50 say a10 FONT "宋体",10 COLOR RGB(0,0,0,,,)&&单位
@17.05,54.5 say a11 FONT "宋体",10 COLOR RGB(0,0,0,,,) &&数量
@17.05,62 say str(a12,10,2) FONT "宋体",10 COLOR RGB(0,0,0,,,)&&单价
@17.05,71.5 say a15 FONT "宋体",10 COLOR RGB(0,0,0,,,) &&提货时间
@19.2,54 say "总价:"+str(a13,11,2) FONT "宋体",12 &&COLOR RGB(0,0,0,,,)
set colo to /w+
@22,54 say "合计:"+str(hj,11,2)FONT "宋体",12 COLOR RGB(255,255,255,,,)
set colo to g+/bg+

store 0 to aba0,aba3

@16.75,1.5 get lk FUNCTION "*RVT \\" VALID lk();
font "宋体",12 size 1.2,1,0 color rgb(0,0,0,,,)&&color,,,,,,g+/rb,gr+/b,n+/w+,,w+/w

@13.5,71.5 say "共"+str(nx,2)+" 项" FONT "宋体",12 &&COLOR RGB(0,0,0,,,)
@13.5,1 say "序号:"+str(nnx,2) FONT "宋体",12 &&COLOR RGB(0,0,0,,,)
@21.5,31 get aba0 picture "@*BH sy;xy" size 1.7,7,2.5 DEFAULT sele VALID km()
@2.5,76.9 get aba3 picture "@*TCB X" size 0.96,1.91
read
do case
case aba3=1
exit
case aba0=1
store nok-1 to nok
nnx=nnx-1
if nnx<1
nnx=1
store cok to nok
endif
case aba0=2
store nok+1 to nok
nnx=nnx+1
if nnx>nx
nnx=1
store cok to nok
endif
endcase
enddo
if aba3=1
exit
endif
enddo
if aba3=1
return
endif

set colo to /bg+
clear
return
