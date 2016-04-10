set talk off
set colo to r+/b+
@0.1,63.7 say "图片介绍" font "宋体",18 style "Bold"
use \xsk\&y\&gg-tp
store "t"+ltri(trim(str(choi1,2))) to tok
store ltri(trim(subs(&tok,1,30))) to tk
skip
*go 2
kt=" "
if subs(&tok,1,1)<>"*"
store tk+ltri(trim(subs(&tok,1,30))) to tk
*store " "+"tk" to tk
skip
endif
store (59.9-2.05*len(alltrim(tk)))/2 to nx

@0.8,nx-1 say ltri(trim(subs(tk,2,29))) ;
font "宋体",26 style "Bold" COLOR RGB(0,0,0,255,255,255) 

skip
*go 3
*if kt<>" "
*go 4
*endif

nok=0
zok=""
if subs(&tok,1,1)<>"*"
store len(alltrim(&tok)) to nok
store ltri(trim(&tok)) to zok
endif
skip -1
*go 2
*if kt<>" "
*go 3
*endif
store (59.9-1*(len(alltrim(&tok))+nok))/2 to nx
@25,nx-1 say ltri(trim(subs(&tok+zok,2,50))) font "宋体",12 ;
style "Bold" COLOR RGB(,,,255,255,255)
set colo to gr+/b
skip
*go 3
*if kt<>" "
*go 4
*endif
if subs(&tok,1,1)<>"*"
skip
endif
xok=2
do while &tok<>"            "
nx2=1
lok=""
store lok+subs(&tok,2,29) to lok
skip
do while subs(&tok,1,1)<>"*".and.&tok<>"          "
lok=lok+subs(&tok,2,18)
skip
enddo
store len(alltrim(lok)) to nx1
@xok,61.1 say subs(lok,nx2,18) font "宋体",12
do while nx1>18
xok=xok+1
if xok>=24
abe=0
@25.7,66 get abe FUNCTION "*TH 下一页" FONT "宋体",12 ;
SIZE 1.3,8 COLOR,r+/b,gr/bg,n+/w
read
@3,61 clear to 25.7,80
xok=2
endif
nx2=nx2+18
@xok,61.1 say subs(lok,nx2,18) font "宋体",12
nx1=nx1-18
enddo
@ xok+1.3,61 TO xok+1.3,79.3 PEN 2,8 STYLE "1" COLOR RGB(255,255,255,,,)
xok=xok+2
if xok>=24
abe=0
@25.7,66 get abe FUNCTION "*TH 下一页" FONT "宋体",12 ;
SIZE 1.3,8 COLOR,r+/b,gr/bg,n+/w
read
@3,61 clear to 25.7,80
xok=2
endif
enddo
abc=0
abd=0
@25,61 clear to 28,80
@25.7,61 get abc FUNCTION "*TH 其它数据" FONT "宋体",12 ;
SIZE 1.3,10 COLOR,r+/b,gr/bg,n+/w
@25.7,71.5 get abd FUNCTION "*TH 返  回" FONT "宋体",12 ;
SIZE 1.3,8 COLOR,r+/b,gr/bg,n+/w
read
do case
case abc=1
@0,61 clear to 28,80
store "tt"+ltri(trim(str(choi1,2)))+".bmp" to pt
@0.1,0.5 get sele picture "@*CB &pt" size 27.1,59.9 VALID pm()
read
@0,61 clear
show get aba
case abd=1
@0,61 clear
show get aba
endcase
return
