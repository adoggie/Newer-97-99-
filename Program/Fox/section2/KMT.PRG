set talk off
store a(hth1) to aa6
store b(hth1) to aa8
store c(hth1) to aa10
store ad(hth1) to aa12

@17.05,32 say aa8 font "宋体",10 COLOR RGB(0,0,0,,,) &&型号规格
@17.05,50 say aa10 FONT "宋体",10 COLOR RGB(0,0,0,,,)&&单位
@17.05,62 say str(aa12,10,2) FONT "宋体",10 COLOR RGB(0,0,0,,,)&&单价
store aa11*aa12 to zaa1
@19.2,54 say "总价:"+str(zaa1,12,2) FONT "宋体",12 &&COLOR RGB(0,0,0,,,)
return
