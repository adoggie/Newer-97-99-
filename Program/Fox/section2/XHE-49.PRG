set talk off
do while .t.
set colo to r+/b+,w+/b+
@0,0 clear
use fox1-99
nnn=1
xx=3
@0,32 say "【 菜单文件名 】"
@1,xx say "┏━━━━━┳━━━━━┳━━━━━┳;
━━━━━┳━━━━━┳━━━━━┓ "
@3,xx say "┣━━━━━╋━━━━━╋━━━━━╋;
━━━━━╋━━━━━╋━━━━━┫"
do while nnn<7                           
set colo to r+/b+
store "hh"+ltri(str(nnn,2)) to hh
store "ee"+ltri(str(nnn,2)) to ee
store "jj"+ltri(str(nnn,2)) to jj
store "kk"+ltri(str(nnn,2)) to kk
nn=3
nm=49
use fox1-99
store &hh to &kk
@2,xx say "┃ "+&kk
@2,xx+12 say "┃"
do while nn<25
set colo to r+/b+
store "he"+str(nnn,1)+"-"+ltri(str(nm,2)) to bb
store "ee"+str(nnn,1) to ee
@nn+1,xx say "┃"
@nn+1,xx+12 say "┃"
if &ee<>"           "
set colo to w+/b+
@nn+1,xx+4 say bb
endif
skip
nn=nn+1
nm=nm+1
enddo
nnn=nnn+1
xx=xx+12
enddo
@25,3 say "┗━━━━━┻━━━━━┻━━━━━┻;
━━━━━┻━━━━━┻━━━━━┛"
wait ""
set colo to 7/7
clear
exit
enddo
return
