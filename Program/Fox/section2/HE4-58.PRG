set talk off
do mm
sele 1
use \xsk\&y\he-ht
repl all a14 with 0.00,nm with 1
use \xsk\&y\he-ht
total to \xsk\&y\ht on a1 fiel a1,a11,a12,a13,nm
sele 2
use \xsk\&y\ht
store a1 to oa1
store a11 to oa11
store a12 to oa12
store a13 to oa13
store nm to nm1
sele 2
use \xsk\&y\ht
do while .not.eof()
sele 2
store a1 to aa1
store a13 to aa13
store nm to nm1
sele 1
use \xsk\&y\he-ht
loca for a1=aa1
repl hth with a1,a14 with aa13
repl all anx with nm1 for a1=aa1
sele 2
skip
enddo
return
