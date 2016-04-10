

public exitcode1   &&bg 用于检测是否选择了EXIT 按钮
exitcode1=0
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
public fw &&&&用于窗口标题
store "《 职工财务收支状况 》" to fw
fw=fw+"   之   记录查询"     
***@0.5,26 say fw color rgb (255,0,0,,,) font "arial",12


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
@srow()-3.5 ,22 to srow()-3.5,scols() pen 6,8  color rgb(30,30,30,,,)
** the line use for 装 阴影线

@SROW()-2,22 SAY "PREV:" STYLE "B" COLOR RGB(255,0,0,,,) font "arial",12
@SROW()-2,30 SAY "记录上卷.." color rgb(255,255,255,,,)  font "arial",12
@srow()-2,44 say  "NEXT:" STYLE "B" COLOR RGB(255,0,0,,,) font "arial",12
@SROW()-2,53 SAY  "记录下卷.." color rgb(255,255,255,,,) font "arial",12
@srow()-2 ,72 say "EXIT:" STYLE "B" COLOR RGB(255,0,0,,,) font "arial",12
@SROW()-2,79 SAY "退出查询.." color rgb(255,255,255,,,) font "arial",12

acti window m2
do  while .t. &&&此循环用于记录继续添加之用
acti window m2
do c1211
if exitcode1=1    &&bg 用于检测是否选择了EXIT 按钮
exit
endif

acti window main
 @srow()-3.5 ,22 to srow()-3.5,scols() pen 6,8  color rgb(11,87,117,,,)
 &&修复窗口window m2 的下划线
for i=21 to xx step 2
  move window m2 to 0,i
  endfor
@srow()-2,22 say space(120)  style  "b" font "arial",12 
for i=1 to 1000
endfor
acti window main
i=xx

do while .t.
 if i>=21
  i=i-1
  
 move    window m2 to 0.5,i
  
else
    exit
   endif
  enddo
acti wind main
@srow()-3.5 ,22 to srow()-3.5,scols() pen 6,8  color rgb(30,30,30,,,)
&&此线作为WINDOW M2 的下划阴影线	


@SROW()-2,22 SAY "PREV:" STYLE "B" COLOR RGB(255,0,0,,,) font "arial",12
@SROW()-2,30 SAY "记录上卷.." color rgb(255,255,255,,,)  font "arial",12
@srow()-2,44 say  "NEXT:" STYLE "B" COLOR RGB(255,0,0,,,) font "arial",12
@SROW()-2,53 SAY  "记录下卷.." color rgb(255,255,255,,,) font "arial",12
@srow()-2 ,72 say "EXIT:" STYLE "B" COLOR RGB(255,0,0,,,) font "arial",12
@SROW()-2,79 SAY "退出查询.." color rgb(255,255,255,,,) font "arial",12

*@SROW()-2,22 SAY "NEW:" STYLE "B" COLOR RGB(255,0,0,,,) font "arial",12
*@SROW()-2,30 SAY "继续添加.." color rgb(255,255,255,,,)  font "arial",12
*@srow()-2,44 say  "SAVE:" STYLE "B" COLOR RGB(255,0,0,,,) font "arial",12
*@SROW()-2,53 SAY  "保存当前记录.." color rgb(255,255,255,,,) font "arial",12
*@srow()-2 ,72 say "EXIT:" STYLE "B" COLOR RGB(255,0,0,,,) font "arial",12
*@SROW()-2,79 SAY "退出之前注薏保存" color rgb(255,255,255,,,) font "arial",12


enddo


&&wait ""      &&window   






********* follow is clea the window m2************
*************************************************
acti window main
 @srow()-3.5 ,22 to srow()-3.5,scols() pen 6,8  color rgb(11,87,117,,,)
 &&修复窗口window m2 的下划线
for i=21 to xx step 2
  move window m2 to 0,i
  endfor
@srow()-2,22 say space(120)  style  "b" font "arial",12 
&&&请除下标说明  
*************************************************************


RETURN