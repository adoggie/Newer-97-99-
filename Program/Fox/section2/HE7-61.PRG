set talk off
set colo to w+/b+,gr+/g+
clear
ok=" "
set cons off
@0,0 say "请设制驱动器号( A 或 B )" get ok
read
store "&ok"+":\" to ok
! ECHO OFF
! copy *.dbf &ok
set cons on
wait " 任一键退回 !"
return
