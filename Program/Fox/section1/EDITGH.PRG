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

dig="查找对话框:              "

@row2+0.25 ,col2+0.4 say dig   style "b" font "mingli",14;
color rgb(255,255,255,0,0,255)
do draw with row2+4.2,col2+6.4,9.2,2 in box2
@row2+2,col2+2 say  "输入待修改之工号" color rgb(255,0,0,,,) font "宋体",12;
style "b" 
@ row2+4.5,col2+7 get gh3 defa 0 pict"@k9999"  style "bt" font "mingli",14 ;
color ,rgb(0,255,0,150,150,150);
size 1,5


@row2+3.8,col2+20 get s1 defa 1 pict"@*t  确定" style "b" font "mingli",12 color rgb(255,0,0,,,); 
size 1.6,8  valid  exit()
@row2+5.6,col2+20 get s2 defa 1 pict"@*t  取消" style "b" font "mingli",12 color rgb(255,0,0,,,); 
size 1.6,8 valid  cancel()

read cycle
@ row2,col2 clea to row2+tall+0.4,col2+wieth+0.6
  @10,40 say "工作区域" font "arial",40 color  rgb(0,0,255,255,255,255,) style "bi"



************************************
***************************************
***************************************
RETURN

proc exit
clear read 
return

proce  cancel
cancelcode2=1
return