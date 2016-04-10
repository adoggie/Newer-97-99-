set talk off

do while .t.
set colo to n+/bg+,n+/bg
clear
@0,0 clear to 1.2,80
@0,1 TO 0,78.7 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
@0,78.7 TO 1.3,78.7 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@1.3,1 TO 1.3,79 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@0,1 TO 1.3,1 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
use \xsk\&y\fox1-99
nnn=1
xx=0
do while nnn<7                   &&主菜单
store "hh"+ltri(str(nnn,2)) to hh
store "ee"+ltri(str(nnn,2)) to ee
store "jj"+ltri(str(nnn,2)) to jj
store "kk"+ltri(str(nnn,2)) to kk
nn=1
use \xsk\&y\fox1-99
store &hh to &kk
@nn-1,xx+13.84 TO nn+0.3,xx+13.84 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
if xx+14.1<76
@nn-1,xx+13.98 TO nn+0.3,xx+13.98 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
endif
@0+.1,xx+3.5 get &kk FONT"宋体",12 colo rgb(255,255,255,,,,)
@1.4,1.4 to 1.4,78.6 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,,,,)

do while nn<24                  &&子菜单
store "bb"+str(nnn,1)+ltri(str(nn,2)) to bb
store &ee to &bb
@nn+0.4,xx+1.4 to nn+1.7,xx+1.4 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,,,,)
@nn+0.5,xx+1.6 get &bb FONT"宋体",12
@nn+0.4,xx+13.6 to nn+1.7,xx+13.6 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,,,,)
skip
nn=nn+1
enddo

nnn=nnn+1
xx=xx+13
enddo
@nn+0.7,1.4 to nn+0.7,xx+.7 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,,,,)
STORE 0 TO aba
do while .t.
@24.9,62 get aba FUNCTION "*TH 存盘;重输;退出" SIZE 1.5,5 ;
COLOR RGB(255,255,255,,,,)
read
if aba=1.or.aba=2.or.aba=3
exit
endif
enddo
if aba=1.or.aba=3
exit
endif
enddo

set colo to w+/r
@24,0 clear to 24,19
if aba=3
set colo to 7/7
clear
return
endif

nnn=1
nn=nn+1
xx=0
do while nnn<7
store "hh"+ltri(str(nnn,2)) to hh
store "ee"+ltri(str(nnn,2)) to ee
store "jj"+ltri(str(nnn,2)) to jj
store "kk"+ltri(str(nnn,2)) to kk
nn=1
use \xsk\&y\fox1-99
repl &hh with &kk

do while nn<24
store "bb"+str(nnn,1)+ltri(str(nn,2)) to bb
store "cc"+str(nnn,1)+ltri(str(nn,2)) to cc

repl &ee with &bb
skip
nn=nn+1
enddo
nnn=nnn+1
xx=xx+13
enddo

use \xsk\&y\fox1-99
count all to nn1 for subs(ee1,1,12)<>"          "
count all to nn2 for subs(ee2,1,12)<>"          "
count all to nn3 for subs(ee3,1,12)<>"          "
count all to nn4 for subs(ee4,1,12)<>"          "
count all to nn5 for subs(ee5,1,12)<>"          "
count all to nn6 for subs(ee6,1,12)<>"          "
use \xsk\&y\fox1-99
repl uu1 with nn1,uu2 with nn2,uu3 with nn3,;
uu4 with nn4,uu5 with nn5,uu6 with nn6
use
*do xhe-49
return
