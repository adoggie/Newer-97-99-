deac  window all


set color to
close all
clea all
clea


&&&&&&  为了使行列可方便计算 ： 设定全部窗口相同的字体！！！！！ 
clea all

set talk off
set sysmenu to 

*set color to /3
clea
set statu bar off
***do diag1

modi window screen

modi window screen  title "                           ***********     工资管理      *********            Z.BIN  98.8"  ;
font "arial",10

&&modi window screen
defin window main from 0,0 to srows(),scols() double font "arial",10 

move window main center
acti window main
set color to /3
clear
on key label f3 do exit
clear

set decimals to 2


do line1
*do s1
do  menu1
*do exit