set talk off
qq2="C:\>"
qq3="C:"
qq4=""
set colo to w+/n+,w+/n+
clear
do while .t.
do while .t.
qq1="                              "
@24,0 say "&qq2" get qq1
read
do case
case subs(qq1,2,1)=":"
store uppe(subs(qq1,1,2)) to qq3
store "&qq3\>" to qq2
case subs(qq1,1,3)="cd\"
store uppe(trim(subs(qq1,4,8))) to qq4
store "&qq3\&qq4>" to qq2
case subs(qq1,2,1)<>":".and. subs(qq1,1,3)<>"cd\"
exit
endcase
enddo
set path to &qq3\&qq4
if qq1="  "
exit
endif
set colo to w+/n+,w+/n+
clear
! &qq3
! cd\&qq4
! &qq1
*? sys(2003) &&当前工作目录名称
enddo
*do 1-sl
return
