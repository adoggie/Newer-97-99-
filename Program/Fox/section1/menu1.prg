
public wincode
public editcode



public fs
public stat
public a,p1,p2,p3,p4,p5,p6
public xx,yy
public pop1,pop2
xx=wcols()
yy=wrows()
public yn
defin window yn from 0,0 to  8,32 Double  color /3 font "arial",10
move window yn center

*******************
mess1="   此 ：用于新数据的     创建，添加   "+ space(44);
+"注意：   工号输入不可为0 ，为 0 则自动删除 ！"
mess2="bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb;
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"
mess3="ccccc"
mess4="dddd"
mess5="eeeee"
mess6="fffff"

defin window message from 0,0 to yy-3.6,30 double  in window main color rgb(,,,128,128,128);
font "arial",10
****************

*defin window  waring from 0,0 to 8,32 Double  color /3 font "arial",10
*move window  waring center

***********************
defin window m2 from 0,0 to yy-3.6,xx-21.5 double  in window main color rgb(,,,128,128,128);
font "arial",10
 &&rgb(,,,0,128,128)  窗口大小 23。3     83。3
************

sele 1
use d1
SELE  2   &&&打开 当月数据库 ZG8
G="ZG"+ALLT(STR(MONTH(DATE())))
USE &G
&&INDE ON GH TAG GH ASCE
sele 3
use zcbm


sele 1


************



d=srows()-4
a=1
stat=0
#define s from 4,24 to d,50  margin  color ,rgb(255,0,0,230,230,230),,,rgb(,,,0,0,0),rgb(0,0,255,0,255,0)   &&font "mingli",12
 
#defin s2  *on exit popup 

public m1
defin popup p1 prompt field ee1  s  
 on select popup p1 do check3 with bar(),"j1"
defi popup p2 prompt field ee2 s 
 on select popup p2 do check3 with bar(),"j2"
defin popup p3 prompt field ee3 s 
 on select popup p3 do check3 with bar(),"j3"
defi popup p4 prompt field ee4 s 
 on select popup p4 do check3 with bar(),"j4"
defi popup p5 prompt field ee5 s 
 on select popup p5 do check3 with bar(),"j5"
defi popup p6 prompt field ee6 s 
 on select popup p6 do check3 with bar(),"j6"


go top



******************************************************************
*****************************************************************
on key label  esc do check1 
s2 p1 do cc
s2 p2 do cc 
s2 p3 do cc
s2 p4 do cc
s2 p5 do cc
s2 p6 do cc

p=allt("@*vn " +hh1+";"+hh2+";"+hh3+";"+hh4+";"+hh5+";"+hh6+";"+hh7)
set clock to srows()-2,2 

  @10,40 say "工作区域" font "arial",40 color  rgb(0,0,255,255,255,255,) style "bi"
pp=2.1/27.3
@5,0.5 get a defa 1 pict p size wrows()*pp,14.2 valid check2( )  style "b"  font "arial",12 color ,,,,rgb(255,255,255,,,)

read  cycle                    &&&&&&&接受 GET 控件
 
set clock off

       do exit


*********************************
*********************************

proce check1
  stat=0
**@3.8,23.5 to srow()-3.6 ,50.8 pen 4,8 color rgb(11,87,117,,,)&&&& 对弹出菜单的修拭！！！！！！
sele 1
deac popup all  

return



**************************
***************************
function check2
 **@3.8,23.5 to srow()-3.6 ,50.8 pen 4,8 color rgb(255,255,255,,,)  
 && 对弹出菜单的修拭！！！！！！
 @10,40 say "工作区域" font "arial",40 color  rgb(0,0,255,255,255,255,) style "bi"
@srow()-3.5 ,22 to srow()-3.5,scols() pen 6,8  color 3/
 &&修复窗口window m2 的下划线
SELE 1

do case
   case a=7  
clea read

return .t.
**************************************************************
case a=1

do movemess with mess1 in box7
acti window main
***************
acti popu p1 
 
 do delmess
*******************

 do case 
   case stat=1   
    do movem2
  
   case stat=2
     do genxing
   case stat=3
     do creat1
    case stat=4
     
    
    sele 1
 
 endcase   
  deac window m2
  @srow()-3.5 ,22 to srow()-3.5,scols() pen 6,8  color 3/

  acti window main
stat=0
**************************************
case a=2
do movemess with mess2 in box7
acti window main
acti popup p2
 do delmess
  do case
    case stat=1
    do b1
    case stat=2
    do b2
    case stat=4
 do b4 
  **otherwise   
 **do jmp
  endcase
stat=0



 deac window m2
  acti window main

**************************************
case a=3
do movemess with mess3 in box7
acti window main
acti popup p3
do delmess
do case 
  case  stat=1
   do c1
  
   case stat=2  
  do  c2
  case stat=3
    do c3
 ** other
  ** do jmp
  endcase
 deac window m2
  acti window main

stat=0
************
case a=4
do movemess with mess4 in box7
acti window main
acti popup p4
do delmess
   do case
   case stat=1
      do d1
      case stat=2
 ** other
  **do jmp
  endcase
acti window main
stat=0

******************************
case a=5
do movemess with mess5 in box7
acti window main
acti popup p5
do delmess
stat=0

**************************
case a=6
do movemess with mess6 in box7
acti window main
acti popup p6
  do delmess
  
         do case
         case stat=1
            do command
         
         case stat=2
            run /n readme.exe
    **    other
      **   do jmp
         endcase 



stat=0
endcase
***___________--------------
return .t.

*****************************
**************************


proce check3 
para bar ,j
do case 
**************
case j="j1"
     stat=bar
    do empty
         
case j="j2"
    stat=bar
   do empty
   
 case j="j3"
      stat=bar
      do empty
     
 case j="j4"
     stat=bar
     do empty
         
 case j="j5"
     stat=bar
     do empty
      
 case j="j6"
          stat=bar
       
      do empty 
       
 
   endcase  
  return
              
                     
           ** proce hide
            **  @3.8,23.5 to srow()-3.6 ,50.8 pen 4,8 color rgb(11,87,117,,,)
         **return