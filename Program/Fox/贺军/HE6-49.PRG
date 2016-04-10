set talk off
*set colo to w+/7,r+/b
set colo to w/br+
@4,61 clear to 23,73
@ 4,61 TO 4,73 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
@ 4,73 TO 23,73 PEN 2,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@ 23,61 TO 23,73+.2 PEN 2,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@ 4,61 TO 23,61 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255) 
@5,62 prom "1.前菜单名."
@6,62 prom "2.后菜单名."
@7,62 prom "3.修改密码."
@8,62 prom "4.复制文件."
@9,62 prom "5.改文件名."
@10,62 prom "6.删除文件."
@11,62 prom "7.设制路经."
@12,62 prom "8.DOS 操作."
@13,62 prom "9.FOX 操作."
@14,62 prom "A.读驱动器."
@15,62 prom "B.备份 *.*."
@16,62 prom "C.备份.PRG."
@17,62 prom "D.备份.DBF."
@18,62 prom "E.计 算 器."
@19,62 prom "F.金山 WPS."
@20,62 prom "G.执行TOOL."
@21,62 prom "0.退    出."
clear type
menu to ii
if ii>0
store ii+48 to nnx
store "he7-"+str(nnx,2) to hee
if ii=17
ii=1
return
endif
do &hee
endif
*keyb ""+chr(13)
return
