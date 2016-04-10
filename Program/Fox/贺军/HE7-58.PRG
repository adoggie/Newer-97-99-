set talk off
set colo to w+/b+,gr+/g+
clear
ok=" "
set cons off
@0,0 say "读驱动器 ( A 或 B )." get ok
read
store "&ok"+":/p" to ok
! ECHO OFF
! dir &ok
set cons on
wait " 任一键退回 !"
return
