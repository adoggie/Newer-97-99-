defin window search from 0,0 to  8,30 Double title "查寻记录对话框：" color rgb(255,,,150,150,150)
move window search center
acti window search
clea
do draw with 4.2,6,8,1.8 in box2
@1,2 say  "工号查寻" color rgb(255,0,0,150,150,150) font "宋体",12;
style "bt" 

@  4.5,7 get gh2 defa 0 pict"@9999"  style "bt" font "mingli",12 ;
color ,rgb(0,255,0,150,150,150);
size 1,5


@3,20 get s1 defa 1 pict"@*t  确定" style "b" font "mingli",12 color rgb(255,0,0,,,); 
size 1.6,8  valid  exit()
@5,20 get s2 defa 1 pict"@*t  取消" style "b" font "mingli",12 color rgb(255,0,0,,,); 
size 1.6,8 valid  cancel()
read cycle
deac window search
rele window search
RETURN
*acti window main


proc exit
clear read 
return

proce  cancel
cancelcode=1
return