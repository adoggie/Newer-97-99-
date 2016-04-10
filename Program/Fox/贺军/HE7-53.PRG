set talk off
do return
qq1="            "
qq2="            "  
set colo to w+/b+
@2,0 clear to 24,79
set colo to /n
@12,21 clear to 17,50
set colo to bg+/g+,bg+/n+
@11,19 clear to 16,48
do while .t.
@12,20 say "      【 改文件名 】"
@14,20 say "源 文 件.扩展名" get qq1
@15,20 say "目标文件.扩展名" get qq2
read
if qq1="  ".or.qq2="  "
exit
endif
rena &qq1 to &qq2
enddo
return
