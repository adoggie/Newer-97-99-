set talk off
set path to \xsk\&y\
x23=1
set colo to w+/n+,w+/n+
clear
do while .t.
qq1="                                         "
qq2="                                         "
@24,0 say "." get qq1
read
*@24,0 say ". "+qq2
@24-x23,0 say ". "+trim(qq1)
if qq1="  "
exit
endif
store ltri(qq1) to qq1
store trim(qq1) to qq1
&qq1
x23=x23+1
enddo
do return
set colo to 7/bg+
clear
return
