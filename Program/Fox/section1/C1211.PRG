 #defi co color rgb(0,0,255,,,) style "bt" font "mingli",12
#defi add2 x1=x1+1.6 
#defi proc1 do draw with  x1,y2,10 ,1.2
#define dd  color ,rgb(0,255,0,150,150,150) size 1,9  pict"@kj9999.99" disa



xin="男"
bmp="^n "
zcp="^n "
zc1=1
xb1=1









****************************************
**sele 2
**use zg
 @ 3,2 SAY "工号:" co
 @2.98,12 get gh  pictu "@j#k9999" size 1,5  color ,rgb(0,255,0,150,150,150) disa
 @ 4.6,2 SAY "姓名:" co
@4.62,11  get xm pictu "@kxxxxxxxx"   size 1,9 color ,rgb(0,0,0,150,150,150) style "bt" ;
font "mingli",12 disab
do draw with 2.8,10,8,1.2
do draw with 4.4,10,15,1.55
xb2=xb
if xb2=0
xin2="男"
else
 xin2="女"
 endif
zc2=zc

bm2=bm
sele 3

go zc2

@6.4,2 say "职称:" co
do draw with 6.4,9.8,16,1.4 
@6.6,10 clea to 7.6 ,24   
@6.6,10 say  zc SIZE 1,15 style "b"




@8,12 say "性别:" co
do draw with 8,18.5,3,1.2

@8.1,18.7 say xin2 co


@8,2 SAY "部门:" co
do draw with 9.5,1.6 ,24,1.4
go bm2
@9.6,2 clea to 10.6,22 
@9.6,2 say bm   size 1,24 style "bt" 


******

@18,3 get  c1 pict"@*n  PREV " SIZE 1.5,9 STYLE "B" defa 1 valid pageup()

@18,15 get c2 pict "@*n NEXT.."  defa 1 size 1.5,9 STYLE "B" valid nextrecord()

@20,3 get c3  DEFA 1 pict "@*N EXIT" SIZE 1.5,21 STYLE "B"  VALID exit()



sele 2 &&当月数据
@14,2 say allt(str(year(date())))+"年"+allt(str(month(date())))+"月 工资实发：" style "b" color rgb(255,0,0,,,)
DO draw with 15.5 ,4,20,1.2
@15.7,8  say sjgz color rgb(0,255,0,150,150,150) size 1,9 style "b"

@17.6,69 SAY  ss color rgb(0,255,0,150,150,150) size 1,9 style  "b"
@19.2,69 say sz color rgb(0,255,0,150,150,150) size 1,9 style "b"

x1=3 
y1=28
x2=3
y2=40
@x1,y1 say "基薪：" co
proc1
@x1+0.1 ,y2+0.5 get jx  dd 
add2
@x1,y1 say "浮动:" co
proc1
@x1+0.1 ,y2+0.5  get fd dd
add2
@x1,y1 say "工龄贴：" co
proc1
@x1+0.1 ,y2+0.5 get glt dd
add2
@x1,y1 say "副食贴:" co
proc1
@x1+0.1 ,y2+0.5 get fst dd
add2
@x1,y1 say "岗位贴:" co
proc1
@x1+0.1 ,y2+0.5 get gwt dd
add2
@x1,y1 say "洗理费:" co
proc1
@x1+0.1 ,y2+0.5 get xlf dd 
add2
@x1,y1 say " 房贴:" co &&
proc1
@x1+0.1 ,y2+0.5 get ft dd
add2
@x1,y1 say "水电贴:" co
proc1
@x1+0.1 ,y2+0.5 get sdt dd
add2
@x1,y1 say "郊补:" co
proc1
@x1+0.1 ,y2+0.5 get jb  dd
add2
@x1,y1 say "书报费:" co
proc1
@x1+0.1 ,y2+0.5 get sbf dd
add2
@x1,y1 say "养老金:" co
proc1
@x1+0.1 ,y2+0.5 get ylj dd
add2
@x1,y1 say "其它津贴:" co
proc1
@x1+0.1 ,y2+0.5 get qtjt dd
x1=3
y1=56
y2=68
@x1,y1 say "房租:" co
proc1
@x1+0.1 ,y2+0.5 get fz dd
add2
@x1,y1 say "医疗费:" co
proc1
@x1+0.1 ,y2+0.5 get ylf dd
add2
@x1,y1 say "公基金:" co
proc1
@x1+0.1 ,y2+0.5 get gjj dd
add2
@x1,y1 say "电话费:" co
proc1
@x1+0.1 ,y2+0.5 get dhf dd
add2
@x1,y1 say "工会费:" co
proc1
@x1+0.1 ,y2+0.5 get ghf dd
add2
@x1,y1 say "个调税:" co
proc1
@x1+0.1 ,y2+0.5 get gts dd
add2
@x1,y1 say "扣养老金:" co
proc1
@x1+0.1 ,y2+0.5 get kylj dd
add2
@x1,y1 say "其它扣除:" co
proc1
@x1+0.1 ,y2+0.5 get qtkc dd
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
RETURN



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


proc exit
exitcode1=1
clea read
return





proc nextrecord
skip
if  eof()


go top
endif
ACTI WINDOW M2

 @8.1,18.7 clea to 9.1,21.5

 clea read

return 



proc pageup
skip -1

if  bof()

go bottom
endif
ACTI WINDOW M2

 @8.1,18.7 clea to 9.1,21.5
clea read


return