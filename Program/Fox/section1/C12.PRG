

sele 2


loca for gh=gh2
if found()=.f.

defin window waring from 0,0 to  10,30 Double title "确认对话框：" color /3
move window waring center
acti window waring
@2,2 say "记录不存在！！" style "b" font "arial",14 color rgb(255,0,0,,,)
@5,8 get g1 defa 1 pict"@*tH  确定" SIZE 2,6,4 style "bt"
READ
 deac window waring
 rele window waring
return
endif
k=recn()
go k
do c121
RETURN