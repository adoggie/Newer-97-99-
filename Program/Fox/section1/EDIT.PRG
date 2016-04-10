



move window  m2 to 0.5,scols()
i=xx  &&xx 大概为最大列数
acti window m2
clea 


col1=wcols( )
row1=wrow( )
*********************************
******
@0.2,0.2 to row1-0.2,0.2 pen 2,8 color rgb(50,50,50,,,)
  @row1-0.2 ,0.2 to row1-0.2,col1-0.2 pen 2,8 color rgb(230,230,230,,,)    
@0.1 ,0.2 to 0.1 ,col1 pen 2,8 color rgb(50,50,50,,,)

@0.1,col1-0.2 to row1-0.2,col1-0.2 pen 2,8 color rgb(250,250,250,,,)

@1.9,0.2 to 1.9 ,col1 pen 2,8 color rgb(230,230,220,,,)
@2,0.2 to 2,col1 pen 2,8 color rgb(0,0,0,,,)
&&&&&窗口M2 大小： 23----83
public fs  &&&&用于窗口标题
store "《 职工财务收支状况 》" to fs
fs=fs+"   之   记录修改"     
**************************

****************************
@0.5,26 say fs color rgb (255,0,0,,,) font "arial",12


***********************************************************
@2.1,26 to wrow(),26 pen 2,8 color rgb(230,230,230,,,)  && 中间的分隔线
@2.1,26.3 to wrow(),26.3 pen 2,8 color rgb(30,30,30,,,)  && 中间的分隔线
**********************************************************



do while .t.   &&&&&&d第一次进入窗口添加
 if i>=21
  i=i-1
  
 move    window m2 to 0.5,i
  
else
    exit
   endif
  enddo
acti wind main
@srow()-3.5 ,22 to srow()-3.5,scols() pen 6,8  color rgb(0,0,0,,,)
** the line use for 装 阴影线

@srow()-2,21 say  "DELETE:" STYLE "B" COLOR RGB(255,0,0,,,) font "arial",12
@srow()-2,33 say  "删除当前记录.." STYLE "B" COLOR RGB(255,255,255,,,) font "arial",12
@srow()-2,53 say  "OK:" STYLE "B" COLOR RGB(255,0,0,,,) font "arial",12
@SROW()-2,60 SAY  "保存当前记录.." color rgb(255,255,255,,,) font "arial",12
@srow()-2 ,77 say "CANCEL:" STYLE "B" COLOR RGB(255,0,0,,,) font "arial",12
@SROW()-2,88 SAY "退出并不保存.." color rgb(255,255,255,,,) font "arial",12





acti window m2
do box6


********* follow is clea the window m2************
*************************************************
acti window main
 @srow()-3.5 ,22 to srow()-1,scols() pen 6,8  color 3/
 &&修复窗口window m2 的下划线
for i=21 to xx step 2
  move window m2 to 0,i
  endfor
@srow()-2,21 say space(124)  style  "b" font "arial",12 
&&&请除下标说明  
*************************************************************


 @srow()-3.5 ,22 to srow()-1,scols() pen 6,8  color 3/3
