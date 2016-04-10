set talk off
do return
*clear all
set colo to bg+/b+
@2,0 clear to 24,79
set colo to /n
@12,26 clear to 16,58
set colo to bg+/g+
@11,24 clear to 15,56
qq1="            "
@12,25 say "         【 删除文件 】"
@14,25 say "删除文件名.扩展名" get qq1
read
if qq1="  "
return
endif
eras &qq1
return
