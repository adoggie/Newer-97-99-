 #defi co color rgb(0,0,255,,,) style "bt" font "mingli",12
#defi add2 x1=x1+1.6 
#defi proc1 do draw with  x1,y2,10 ,1.2
#define dd defa 0.00 color ,rgb(255,0,0,230,230,230) size 1,9  pict"@kj9999.99" 

*PUBLIC G
public xb1,zc1,bm1
PUBLIC GH1,XM1,ZC1,BM1,XB1,GZNY1,JX1,FD1,GLT1,FST1,GWT1,XLF1,FT1,SDT1,JB1,SBF1,YLJ1,QTJT1,FZ1,YLF1
PUBLIC GJJ1,DHF1,GTS1,KYLJ1,QTKC1,SS1,SZ1,SJGZ1
PUBLIC FLAG  &&&&用于检测是否要确认保存
public flag2
public xin



flag2=0
flag=0
GH1=0
JX1=0.00
FD1=0.00
GLT1=0.00
FST1=0.00
GWT1=0.00
XLF1=0.00
FT1=0.00
SDT1=0.00
JB1=0.00
SBF1=0.00
YLJ1=0.00
QTJT1=0.00
FZ1=0.00
YLF1=0.00
 GJJ1=0.00
 DHF1=0.00
 GTS1=0.00
 KYLJ1=0.00
 QTKC1=0.00
 SS1=0.00
 SZ1=0.00
 SJGZ1=0.00
xm1=space(8)
xin="男"
bmp="^n "
zcp="^n "
zc1=1
xb1=1




SELE  2   &&&打开 当月数据库 ZG8
*G="ZG"+ALLT(STR(MONTH(DATE())))
*USE &G





****************************************
PUBLIC EXITCODE1
EXITCODE1=0
**sele 2
**use zg
 @ 3,2 SAY "工号:" co
 @2.98,12 get gh1  pictu "@j#k9999" size 1,5  color ,rgb(0,255,0,150,150,150) valid checkgh()
 @ 4.6,2 SAY "姓名:" co
@4.62,11  get xm1 pictu "@kxxxxxxxx"   size 1,9 color ,rgb(0,0,0,150,150,150) style "bt" ;
font "mingli",12
do draw with 2.8,10,8,1.2
do draw with 4.4,10,15,1.55
**public  bmp,zcp

sele 3
*use zcbm

scan all        &&设直下拉条
bmp=bmp+bm+";"
zcp=zcp+zc+";"
endscan
bmp=allt(bmp)
zcp= allt(zcp)

@6.4,2 say "职称:" co

@6.2,10 get zc1 function zcp  SIZE 1,16 color ,,,,,,,,rgb(0,0,0,255,255,255)




@8,12 say "性别:" co
do draw with 8,18.5,3,1.2

@8.1,18.7 say xin co
@ 8,23 get xb1 pict"@*n V" valid  check4() size 1,2 style "b"


@8,2 SAY "部门:" co
bm1=1
@9.6,2 get bm1 function bmp  size 1,24 color ,,,,,,,,rgb(0,0,0,255,255,255)


@14,2 say allt(str(year(date())))+"年"+allt(str(month(date())))+"月 工资实发：" style "b" color rgb(255,0,0,,,)
DO draw with 15.5 ,4,20,1.2


@18,3 get  c1 pict"@*nI  PREV " SIZE 1.5,9 STYLE "B" defa 1

@18,15 get c2 pict "@*n NEW.."  defa 1 size 1.5,9 STYLE "B" valid cont1()

@20,3 get c3  DEFA 1 pict "@*N EXIT" SIZE 1.5,9 STYLE "B"  VALID CHECK5()

@20,15 GET C4  defa 1 PICT  "@*N SAVE" SIZE 1.5,9 STYLE "B"  valid append()&&VALID SAVE()



x1=3 
y1=28
x2=3
y2=40
@x1,y1 say "基薪：" co
proc1
@x1+0.1 ,y2+0.5 get jx1 dd 
add2
@x1,y1 say "浮动:" co
proc1
@x1+0.1 ,y2+0.5  get fd1 dd
add2
@x1,y1 say "工龄贴：" co
proc1
@x1+0.1 ,y2+0.5 get glt1 dd
add2
@x1,y1 say "副食贴:" co
proc1
@x1+0.1 ,y2+0.5 get fst1 dd
add2
@x1,y1 say "岗位贴:" co
proc1
@x1+0.1 ,y2+0.5 get gwt1 dd
add2
@x1,y1 say "洗理费:" co
proc1
@x1+0.1 ,y2+0.5 get xlf1 dd 
add2
@x1,y1 say " 房贴:" co &&
proc1
@x1+0.1 ,y2+0.5 get ft1 dd
add2
@x1,y1 say "水电贴:" co
proc1
@x1+0.1 ,y2+0.5 get sdt1 dd
add2
@x1,y1 say "郊补:" co
proc1
@x1+0.1 ,y2+0.5 get jb1  dd
add2
@x1,y1 say "书报费:" co
proc1
@x1+0.1 ,y2+0.5 get sbf1 dd
add2
@x1,y1 say "养老金:" co
proc1
@x1+0.1 ,y2+0.5 get ylj1 dd
add2
@x1,y1 say "其它津贴:" co
proc1
@x1+0.1 ,y2+0.5 get qtjt1 dd
x1=3
y1=56
y2=68
@x1,y1 say "房租:" co
proc1
@x1+0.1 ,y2+0.5 get fz1 dd
add2
@x1,y1 say "医疗费:" co
proc1
@x1+0.1 ,y2+0.5 get ylf1 dd
add2
@x1,y1 say "公基金:" co
proc1
@x1+0.1 ,y2+0.5 get gjj1 dd
add2
@x1,y1 say "电话费:" co
proc1
@x1+0.1 ,y2+0.5 get dhf1 dd
add2
@x1,y1 say "工会费:" co
proc1
@x1+0.1 ,y2+0.5 get ghf1 dd
add2
@x1,y1 say "个调税:" co
proc1
@x1+0.1 ,y2+0.5 get gts1 dd
add2
@x1,y1 say "扣养老金:" co
proc1
@x1+0.1 ,y2+0.5 get kylj1 dd
add2
@x1,y1 say "其它扣除:" co
proc1
@x1+0.1 ,y2+0.5 get qtkc1 dd
add2
add2

@x1,y1 say "总计收入:" co

************@x1+0.1,y2+0.5 get  sf1 dd 
do draw  with x1,y2 ,12,1.2
add2

@x1,y1 say "总计支出:" co

***********@x1+0.1,y2+0.5 get sz1 dd
do draw  with x1,y2 ,12,1.2

************VERY IMPORTANT I LIKE!*****************
read  CYCLE  


*************END END END END FUCK YOU*************




sele 1
********RETURN READY**********


*?jx
*wait


**********following draw box  to be showed ************8
proce draw
para row2,col2,wieth,tall
&&tall=1.2

@row2,col2 to row2,col2+wieth pen 1,8 color rgb(0,0,0,,,) 
@row2+tall,col2 to row2+tall,col2+wieth pen 1,8 color rgb(255,255,255,,,)
@row2,col2 to row2+tall,col2 pen 1,8 color rgb(0,0,0,,,)
@row2,col2+wieth to row2+tall+0.1,col2+wieth pen 1,8 color rgb(255,255,255,,,)
return

proce check4
**?xin
 if xin="男"
 xin="女"
 
 @8.1,18.7 clea to 9.1 ,21.5

 @8.1,18.7 say xin co
else
   xin="男"
   @8.1,18.7 clea to 9.1,21.5
** @8.1,18.7 say xin co

   @8.1,18.7 say xin co
   endif
   return

FUNCTION CHECK5
EXITCODE1=1
*******************DO APPEND
if flag=0

if gh1=0
bg=1
CLEAR READ

RETURN .T.
endif
****************
#defi w color rgb(255,255,255,,,) 
#defi b color rgb(60,60,60,,,)

row2=9
col2=32
wieth=32
tall=8
@ row2,col2 clea to row2+tall+0.4,col2+wieth+0.6

@row2,col2 to row2,col2+wieth pen 2,8  w
@row2+tall,col2 to row2+tall,col2+wieth pen 2,8  b
@row2,col2 to row2+tall,col2 pen 2,8 w
@row2,col2+wieth to row2+tall+0.1,col2+wieth pen 2,8 b

dig="确认对话框：            "

@row2+0.25 ,col2+0.4 say dig   style "b" font "mingli",14;
color rgb(255,255,255,0,0,255)
@row2+1.8,col2+6 SAY "工号： "+allt(str(gh1)) style "b" font "arial",14 color rgb(255,255,255,,,)


@row2+4,col2+2 say  "要保存此项记录吗？" color rgb(255,0,0,,,) font "宋体",12;
style "b" 


@row2+3.8,col2+2 say "要保存此项记录吗？" style "b" font "arial",14 color rgb(255,0,0,,,)
@row2+5.6,col2+4 get g1 defa 1 pict"@*tH \<YES ;\<NO" SIZE 1.4,6,4 style "bt" font "mingli",12
READ

@ row2,col2 clea to row2+tall+0.4,col2+wieth+0.6
  @10,40 say "工作区域" font "arial",40 color  rgb(0,0,255,255,255,255,) style "bi"



**************


if g1=1
DEAC WINDOW YN
&&rele window YN
ACTI WINDOW M2

DO APPEND
deac window yn
endif
endif
bg=1
CLEAR READ

RETURN .T.

FUNCTION SAVE
DO APPEND

RETURN .T.


PROC APPEND

flag=1  &&&FLAG=1 说明当前记录已SAVE ，当EXIT 时不出现确认框，



SELE 2
if flag2=0 && 之前没保存过 当FLAG2=0 添加一条记录，之后马上FLAG2=1 修改在当前记录
            &&在继续添加时回到初始直
append blank
flag2=1  &&&当FLAG2=1 时  仍为当前记录时 不追加空记录
endif
REPL GH WITH GH1
REPL xm WITH xm1
REPL XB WITH XB1
REPL BM WITH BM1
REPL ZC WITH ZC1
REPL JX WITH JX1
repl fd with fd1
repl glt with glt1
repl fst with fst1
repl gwt with gwt1
repl xlf with xlf1
repl ft with ft1
repl sdt with sdt1
repl jb with jb1
repl sbf with sbf1
repl ylj with ylj1
repl qtjt with qtjt1
repl fz with fz1
repl ylf with ylf1
repl gjj with gjj1
repl dhf with dhf1
repl ghf with ghf1
repl gts with gts1
repl kylj with kylj1
repl qtkc with qtkc1
ss1=jx1+fd1+glt1+fst1+gwt1+xlf1+ft1+sdt1+jb1+sbf1+ylj1+qtjt1
sz1=fz1+ylf1+gjj1+dhf1+ghf1+gts1+kylj1+qtkc1
sjgz1=ss1-sz1
repl ss with ss1
repl sz with sz1
repl sjgz with sjgz1
@17.6,69 SAY  ss1 color rgb(0,255,0,150,150,150) size 1,9 style  "b"
@19.2,69 say sz1 color rgb(0,255,0,150,150,150) size 1,9 style "b"
@15.7,8  say sjgz1 color rgb(0,255,0,150,150,150) size 1,9 style "b"
if xin="男"
repl xb with 0
else 
  repl xb with 1
  endif  
return

proc cont1
if flag2=0 &&&说明如果当前记录没 SAVE 则 追加保存
do append
else   &&如果当前记录保存过
  flag2=0
  endif
ACTI WINDOW M2
@17.6,69 SAY  0.00 color rgb(0,255,0,150,150,150) size 1,9 style  "b"
@19.2,69 say 0.00 color rgb(0,255,0,150,150,150) size 1,9 style "b"
@15.7,8  say space(8) color rgb(0,255,0,150,150,150) size 1,9 style "b"
 @8.1,18.7 clea to 9.1,21.5

 clea read

return 



func checkgh
sele 2
  loca for gh=gh1

  if foun()=.t.
  do waring in waring with 1,0
 clear read
 endif
 return
  
  
  
  