proc movemess
para mess
set cursor off
move window  message to 0.5,scols()

acti window message

clea

@0,0 say " "
@0,0 clea to 2,wcol()
dd="说明解释框：   "
@0.2 ,0.2 say dd color rgb(255,255,255,0,0,255) style "b" font "arial",18
********************

********************

@ 2.2,0.1 to 2.2,wcol() pen 2,8 color rgb(0,0,0,,,)

@2.3,0.1 to 2.3 ,wcol() pen 2,8 color rgb(255,255,255,,,)
*et color to /3
@4,1 say mess color rgb(255,0,0,,,) style "bt" font "mingli",12

i=xx
do while .t.   &&&&&&d第一次进入窗口添加
 if i>=(xx-3.6-26)
  i=i-1
  
 move    window message to 0.5,i
  
else
    exit
   endif
  enddo
  set cursor on
  return