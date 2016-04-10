return
set talk off
do while .t.
store 29 to col1
store 6 to row1
@15,4 say ""
do he-hhll
set colo to r+/bg+
*@17,1 say "┌"
xm=22.4
do while xm<=24.4
@xm,4 say "│"FONT"宋体",12 COLOR RGB(0,0,0,,,,)
xm=xm+1
enddo
@25.2,4 say "↓"FONT"宋体",12 COLOR RGB(0,0,0,,,,)
store subs(str(&y,4),3,2) to yp
set colo to r+/7
@16,5 say "警告:"FONT"宋体",12
store 7.9 to col1
store 0 to row1
@16,10 say ""
do he-hhh
@16,10 say "当前管理"FONT"宋体",12 COLOR RGB(0,0,0,,,,)
@16,18.4 say "必须在新项目上"FONT"宋体",12 COLOR RGB(0,0,0,,,,)
@17.3,10 say "否则将删除数据库中的所"FONT"宋体",12 COLOR RGB(0,0,0,,,,)
@18.6,10 say "有数据!"FONT"宋体",12 COLOR RGB(0,0,0,,,,)
aba=2
@20,11 get aba FUNCTION "*TH 退出;确定" SIZE 1.3,7 COLOR RGB(255,255,255,,,,);
FONT"宋体",12
read
if aba=1.or.aba=2
exit
endif
enddo

if aba=1
return
endif
use \xsk\&y\fox1-99
*do while .t.
*do he0-52
set path to \xsk\&y
store "&gg"+".dbf" to og
copy file he-0.dbf to \xsk\&y\&gg-0.dbf
copy file he.dbf to \xsk\&y\&og
copy file he-t.dbf to \xsk\&y\&gg-t.dbf
copy file he-00.dbf to \xsk\&y\&gg-00.dbf
copy file he-4-00.dbf to \xsk\&y\&gg-4-00.dbf
copy file he-y.dbf to \xsk\&y\&gg-y.dbf
copy file he-xl.dbf to \xsk\&y\&gg-xl.dbf
copy file he-h.dbf to \xsk\&y\&gg-h.dbf
copy file he-r.dbf to \xsk\&y\&gg-r.dbf
copy file he-d.dbf to \xsk\&y\&gg-d.dbf
copy file he-r-r.dbf to \xsk\&y\r-r.dbf
*copy file he-cpml.dbf to \xsk\&y\&gg-cpml.dbf
*copy file he-tp.dbf to \xsk\&y\&gg-tp.dbf
copy file he-123.dbf to \xsk\&y\&gg-123.dbf
copy file he-sss.dbf to \xsk\&y\&gg-sss.dbf
copy file he-ht.dbf to \xsk\&y\he-ht.dbf
axx=0
do while axx<=3
store "he"+"-"+trim(ltri(str(axx,2)))+".dbf" to xh
store "&gg"+"-"+trim(ltri(str(axx,2)))+".dbf" to xg
copy file &xh to \xsk\&y\&xg
axx=axx+1
enddo
use \xsk\&y\&gg
sum t13 to ax1
use \xsk\&y\&gg-h
zap
use \xsk\&y\&gg-h
appe blan
repl a1 with dd,a2 with ax1,a3 with ax1,;
a4 with "&yp"+"01"+"01",a5 with ax1,;
a6 with ax1,a7 with "&yp"+"00"
ax1=1
do while ax1<=3
ax=str(ax1,1)
use \xsk\&y\&gg-&ax &&檫六种料单库
zap
ax1=ax1+1
enddo
use \xsk\&y\&gg-d &&檫动态库
zap
use \xsk\&y\&gg-t &&檫调价库
zap
use \xsk\&y\&gg-r &&檫日报库
zap
use \xsk\&y\&gg-y &&擦月报库
zap
do mm
*enddo
return

