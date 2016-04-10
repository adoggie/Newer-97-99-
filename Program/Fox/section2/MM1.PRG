set talk off
set echo off
set dele on
set scoreboard off
set escape on
set delimiter off
set conf off
set cons off
set date ansi
set safety off
*set exclusive off&&网络
set status bar off&&关闭状态行（可提高速度）
*set sysmenu to &&关闭系统菜单
*set colo to n+/n+
*clear
define window lpp1 at 0.000,0.000 size 28.000,80.000 ;
font "宋体",10 style "Bold"
activate window lpp1
*modify window screen font "宋体",12
public y,m,d,aa,bb,cc,dd,kk,gg,hh,ii,tt11,name
store str(year(date()),4) to y
*if val(y)>=96
*set path to c:\;c:\dos
*set cons off
*! echo off
*endif
on esca do esc
*on key =315 do help
on key label f1 do help2
on key label f2 do help3
on key label f3 do help4
on key label f4 do help5
on error do err-1
return
