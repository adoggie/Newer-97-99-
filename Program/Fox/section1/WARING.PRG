#defi w color rgb(255,255,255,,,) 
#defi b color rgb(60,60,60,,,)
proc waring
para typecode,color
row2=9
col2=32
wieth=32
tall=8

*@ row2,col2 clea to row2+tall+0.4,col2+wieth+0.6
*
*@row2,col2 to row2,col2+wieth pen 2,8  w
**@row2+tall,col2 to row2+tall,col2+wieth pen 2,8  b
*@row2,col2 to row2+tall,col2 pen 2,8 w
*@row2,col2+wieth to row2+tall+0.1,col2+wieth pen 2,8 b

*dig="确认对话框：        "

*@row2+0.5 ,col2+1 say dig   style "bt" font "mingli",14;
*color rgb(255,255,255,0,0,255)
*@row2+1.8,col2+0.2 to row2+1.8,col2+31.9 pen 2 ,8 color rgb(0,80,80,,,)
*@row2+2,col2+0.2 to row2+2,col2+31.95 pen 2 ,8 color rgb(230,230,230,,,)

do case 
case typecode=0 && record not exist!
@ row2,col2 clea to row2+tall+0.4,col2+wieth+0.6

@row2,col2 to row2,col2+wieth pen 2,8  w
@row2+tall,col2 to row2+tall,col2+wieth pen 2,8  b
@row2,col2 to row2+tall,col2 pen 2,8 w
@row2,col2+wieth to row2+tall+0.1,col2+wieth pen 2,8 b

dig="确认对话框：            "

@row2+0.4 ,col2+0.4 say dig   style "bt" font "mingli",14;
color rgb(255,255,255,0,0,255)

 @row2+1.8,col2+0.2 to row2+1.8,col2+31.9 pen 2 ,8 color rgb(30,30,30,,,)
@row2+2,col2+0.2 to row2+2,col2+31.95 pen 2 ,8 color rgb(230,230,230,,,)

@row2+3,col2+2 say   "记录不存在！！"  color rgb(255,0,0,150,150,150) font "mingli",14;
style "bt" 
@row2+5.4,col2+10 get g1 defa 1 pict"@*tH  确定" SIZE 1.8,8 style "bt" font "minglli",12
read 
set color to /3
@ row2,col2 clea to row2+tall+0.4,col2+wieth+0.6
  @10,40 say "工作区域" font "arial",40 color  rgb(0,0,255,255,255,255,) style "bi"



case  typecode=1
row2=9
col2=20
wieth=32
tall=8

@ row2,col2 clea to row2+tall+0.4,col2+wieth+0.6

@row2,col2 to row2,col2+wieth pen 2,8  w
@row2+tall,col2 to row2+tall,col2+wieth pen 2,8  b
@row2,col2 to row2+tall,col2 pen 2,8 w
@row2,col2+wieth to row2+tall+0.1,col2+wieth pen 2,8 b

dig="确认对话框：        "

@row2+0.5 ,col2+1 say dig   style "bt" font "mingli",14;
color rgb(0,255,0,0,0,255)
@row2+1.8,col2+0.2 to row2+1.8,col2+31.9 pen 2 ,8 color rgb(0,80,80,,,)
@row2+2,col2+0.2 to row2+2,col2+31.95 pen 2 ,8 color rgb(230,230,230,,,)


@row2+3,col2+2 say   "工号重名!!!!"  color rgb(255,0,0,150,150,150) font "mingli",14;
style "bt" 
@row2+5.4,col2+10 get g1 defa 1 pict"@*tH  确定" SIZE 1.8,8 style "bt" font "minglli",12
read 
@ row2,col2 clea to row2+tall+0.4,col2+wieth+0.6
endcase


RETURN