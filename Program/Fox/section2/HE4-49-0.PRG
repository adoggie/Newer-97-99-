set talk off
do mm
sele 1
use abcd
sele 2
use &gg
nx=1
do while .not.eof()
@3,38 say "正在汇总...."FONT "宋体",12 color rgb(0,0,0,,,)
sele 2
store bmxzh to ok
sele 1
loca for bmxzh=ok
store subs(bm,1,8)+"_"+allt(xz) to ok3
store sxh to msxh
sele 2
repl bm with ok3,sxh with msxh
skip
nx=nx+1
enddo
return

