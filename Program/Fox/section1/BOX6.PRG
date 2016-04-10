 #defi co color rgb(0,0,255,,,) style "bt" font "mingli",12
#defi add2 x1=x1+1.6 
#defi proc1 do draw with  x1,y2,10 ,1.2
#define dd defa 0.00 color ,rgb(0,255,0,150,150,150) size 1,9  pict"@kj9999.99" 

public delecode
delecode=0

flag2=0
flag=0
GH1=gh
JX1=jx
FD1=FD
GLT1=GLT
FST1=FST
GWT1=GWT
XLF1=XLF
FT1=FT
SDT1=SDT
JB1=JB
SBF1=SBF
YLJ1=YLJ
QTJT1=QTJT
FZ1=FZ
YLF1=YLF
 GJJ1=GJJ
 DHF1=DHF
 GTS1=GTS
 KYLJ1=KYLJ
 QTKC1=QTKC
 SS1=SS
 SZ1=SZ
 SJGZ1=SJGZ
xm1=XM

bmp="^n "
zcp="^n "
zc1=ZC
xb1=XB
bm1=BM
IF XB1=0
xin="男"
ELSE
 XIN="女"
 endif





 @ 3,2 SAY "工号:" co
 @2.98,12 get gh1  pictu "@j#k9999" size 1,5  color ,rgb(0,255,0,150,150,150) DISA
 @ 4.6,2 SAY "姓名:" co
@4.62,11  get xm1 pictu "@kxxxxxxxx"   size 1,9 color ,rgb(0,0,0,150,150,150) style "bt" ;
font "mingli",12 
do draw with 2.8,10,8,1.2
do draw with 4.4,10,15,1.55


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

@9.6,2 get bm1 function bmp  size 1,24 color ,,,,,,,,rgb(0,0,0,255,255,255)


@14,2 say allt(str(year(date())))+"年"+allt(str(month(date())))+"月 工资实发：" style "b" color rgb(255,0,0,,,)
DO draw with 15.5 ,4,20,1.2

@15.7,8  say sjgz1 color rgb(0,255,0,150,150,150) size 1,9 style "b"
@17.6,69 SAY SS1 color rgb(0,255,0,150,150,150) size 1,9 style  "b"
@19.2,69 say SZ1 color rgb(0,255,0,150,150,150) size 1,9 style "b"
******************

@18,3 get c2 defa 1 pict "@* DELETE" SIZE 1.8,22 STYLE "BT" VALID D()



@20,3 get c3  DEFA 1 pict "@*N OK" SIZE 1.5,9 STYLE "B"  VALID APPEND()

@20,15 GET C4  defa 1 PICT  "@*N CANCEL" SIZE 1.5,9 STYLE "B"  valid EXIT()



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




sele 1  &&&&&    VERY IMPORTANTE ！！！！！！
********RETURN READY**********




**********following draw box  to be showed ************8
proce draw
para row2,col2,wieth,tall
&&tall=1.2

@row2,col2 to row2,col2+wieth pen 1,8 color rgb(0,0,0,,,) 
@row2+tall,col2 to row2+tall,col2+wieth pen 1,8 color rgb(255,255,255,,,)
@row2,col2 to row2+tall,col2 pen 1,8 color rgb(0,0,0,,,)
@row2,col2+wieth to row2+tall+0.1,col2+wieth pen 1,8 color rgb(255,255,255,,,)
return
****************************************

proce check4

 if xin="男"
 xin="女"
 
 @8.1,18.7 clea to 9.1 ,21.5

 @8.1,18.7 say xin co
else
   xin="男"
   @8.1,18.7 clea to 9.1,21.5


   @8.1,18.7 say xin co
   endif
   return

*********************************




PROC APPEND
SELE 2

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
CLEAR READ

return


  PROC EXIT
  CLEAR  READ
  RETURN
  
  
  PROC D
  
  
  DO WARING
  if delecode=1
  SELE 2
  DELE 
  PACK
  clea read
  return
  endif
  ACTI WINDOW M2
  RETURN
  
  PROCE WARING
  defin window waring from 0,0 to  10,30 Double title "确认对话框：" color /3
move window waring center
acti window waring


@1,2.5 say "当前工号 "+allt(str(gH1)) style "b" font "arial",14 color rgb(255,255,255,,,)
@2.5,3.5 say "是否真的删除？" style "b" font "arial",14 color rgb(255,0,0,,,)

@5,3 get g1 defa 1 pict"@*tH  确定" SIZE 2,6,4 style "bt" valid check8()
@5,12 get g2 defa 1 pict"@*tH  取消" SIZE 2,6,4 style "bt"

READ
 
 deac window waring
 rele window waring

return

proce check8
delecode=1
return
  
  