set talk off
? choi1
wait

nx=1
use fox1-99
if he0=" "
dd=" "
gg=" "
use fox1-99
repl yk10 with dd
go 2
repl yk10 with gg
go 1
return
endif

do while he0<>" "
store "xhe"+trim(ltri(str(nx,2))) to xhe
store he0 to &xhe
skip
nx=nx+1
enddo
store nx to xn

xq=1
xw=1


do while xw<nx
store "xhe"+trim(ltri(str(xw,2))) to xhe
@xq,30 clear to xq+1,44
@xq,30 prom &xhe
xq=xq+1
xw=xw+1
enddo
zw=1
menu to zw
store "xhe"+trim(ltri(str(zw,2))) to xhe
store &xhe to xhe
dd="¡¾ &xhe ¡¿"
gg="xs"+chr(96+zw)
use fox1-99
repl yk10 with dd
go 2
repl yk10 with gg
go 1
return
