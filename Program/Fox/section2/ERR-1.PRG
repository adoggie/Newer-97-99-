set talk off
do return
set colo to w+/r+
@24,0 clear to 24,80
@24,0 say "出错! 信息为:"+message() font "宋体",12
@24,62 say "《按任一健返回》"font "宋体",12
wait ""
set colo to n+/bg+
clear
*display history
return to master

