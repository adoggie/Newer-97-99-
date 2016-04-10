mousecode=1
acti window  waring
set color to /3
clea
set color to /b
@0,0 say " "
@0,0 clea to 1.3,wcol()
@0.2 ,2 say "确认对话框：" color rgb(255,255,255,,,) style "bt" font "mingli",12



@2.8,2 say   "此功能目前不可用！"  color rgb(255,0,0,150,150,150) font "mingli",14;
style "bt" 

@5,10 get g1 defa 1 pict"@*tH  确定" SIZE 1.6,8 style "bt" font "minglli",12

read 
deac window  waring
mousecode=0
RETURN