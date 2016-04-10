set talk off
q=" "
store "            " to qq1
store "            " to qq2
do while .t.
set colo to bg+/b+
@2,0 clear to 24,79
set colo to /n
@14,26 clear to 19,55
set colo to bg+/g+,bg+/n+
@13,24 clear to 18,53
@14,25 say "      【 复制文件 】"
@16,25 say "源 文 件.后坠 " get qq1
@17,25 say "目标文件.后坠 " get qq2
read
if qq1="  ".or. qq2="  "
exit
endif
copy file &qq1 to &qq2
@18,25 say "还要吗? (Y/N)" get q
read
if q="n"
exit
endif
enddo
return
