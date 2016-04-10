defin window m3  color /3 from 0,0 to 8,32 double font "arial",10
move window m3 center
acti window m3
set color to /3
clea 
set color to /b
@0,0 say " "
@0,0 clea to 1.3,wcol()
@0.2 ,2 say "确认对话框：" color rgb(255,255,255,,,) style "bt" font "mingli",12

@2,3 say  color rgb (255,0,0,,,) ;
style "bt" font "mingli",14 
@5,11 get pb defa 1 pict"@*t 确定" style "bt" size 1.6,8.4 font "mingli",12
read
deac window m3
relea window m3
acti window m2

