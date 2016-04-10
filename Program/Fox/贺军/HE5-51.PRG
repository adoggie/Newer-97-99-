set talk off
do mm
do pprint
aba=0
aba3=0
@15.5,28.5 get aba picture "@*CB ty" size 2,6 DEFAULT sele VALID km1()
@5,34.91 get aba3 picture "@*TCB X" size 0.96,1.91 ;
DEFAULT aba3 VALID km1()
read
if aba3=1
return
endif
set colo to /bg+
@3,0 clear to 23,44
use &gg-hz
copy to &gg-ht
use &gg-ht
*MODIFY REPORT he5-51.frx
*REPORT FORMAT he5-51.frx ENVIRONMENT PREVIEW
report form he5-51.frx noeject ENVIRONMENT noconsole to print
*MODIFY REPORT he5-51-2.frx
report form he5-51-2.frx noeject ENVIRONMENT noconsole to print
return
*********
use &gg
store ymd to mymd
inde on bm+bmxzh to sy for xm<>"     "
use &gg inde sy
tota to &gg-hp on sxh fiel qch,a01,a02,a03,a04,a05,a06,a07,a08,a09,a10,a11,a12,a13,;
a14,a15,a16,b01,b02,b04,b05,b06,b07,c01,c02,c04,abc,q01,q02,q03
use &gg-hp
inde on bmxzh to sy
use &gg-hp inde sy
repl all bm with "公司管理" for subs(bm,3,4)="支部";
.and.sxh<>"4"
repl all bm with "销售人员",bmxzh with "P" for sxh="4"
repl all bm with "管理人员" for (subs(bmxzh,1,1)<>"A".and.subs(bmxzh,1,1)<>"B");
.and.sxh="2"
repl all bm with "生产人员" for (subs(bmxzh,1,1)<>"A".and.subs(bmxzh,1,1)<>"B");
.and.sxh="3"
repl all bm with "退休人员" for (subs(bmxzh,1,1)<>"A".and.subs(bmxzh,1,1)<>"B");
.and.sxh="5"
use &gg-hp inde sy
tota to &gg-ht on subs(bm,1,8) fiel qch,a01,a02,a03,a04,a05,a06,a07,a08,a09,a10,a11,a12,a13,;
a14,a15,a16,b01,b02,b04,b05,b06,b07,c01,c02,c04,abc,q01,q02,q03


use &gg-ht
copy to &gg-hj
use &gg-hj
tota to &gg-hk on subs(bmxzh,1,1) fiel qch,a01,a02,a03,a04,a05,a06,;
a07,a08,a09,a10,a11,a12,a13,a14,a15,a16,b01,b02,b04,b05,b06,b07,c01,;
c02,c04,abc,q01,q02,q03


use &gg-hk    &&全公司汇总(不包括退休人员)
sum qch,a01,a02,a03,a04,a05,a06,a07,a08,a09,a10,a11,a12,a13,;
a14,a15,a16,b01,b02,b04,b05,b06,b07,c01,c02,c04,abc,q01,q02,q03 ;
to aqch,aa01,aa02,aa03,aa04,aa05,aa06,aa07,aa08,aa09,aa10,aa11,;
aa12,aa13,aa14,aa15,aa16,ab01,ab02,ab04,ab05,ab06,ab07,ac01,ac02,;
ac04,aabc,aq01,aq02,aq03 for bm<>"退休人员"

do mm
sele 3
use &gg-hk
sele 1
use abcd
sele 2
use &gg-ht
do while .not.eof()
store bmxzh to mbmxzh
if bm="管理人员"
insert before blank
repl bmxzh with mbmxzh
sele 1
use abcd
loca for bmxzh=mbmxzh
store bm to mbm

sele 3
loca for subs(bmxzh,1,2)=subs(mbmxzh,1,2)
store qch to mqch
store a01 to ma01
store a02 to ma02
store a03 to ma03
store a04 to ma04
store a05 to ma05
store a06 to ma06
store a07 to ma07
store a08 to ma08
store a09 to ma09
store a10 to ma10
store a11 to ma11
store a12 to ma12
store a13 to ma13
store a14 to ma14
store a15 to ma15
store a16 to ma16
store b01 to mb01
store b02 to mb02
store b04 to mb04
store b05 to mb05
store b06 to mb06
store b07 to mb07
store c01 to mc01
store c02 to mc02
store c04 to mc04
store abc to mabc
store q01 to mq01
store q02 to mq02
store q03 to mq03
sele 2
repl bm with mbm,ymd with mymd
repl qch with mqch,a01 with ma01,a02 with ma02,;
a03 with ma03,a04 with ma04,a05 with ma05,a06 with ma06,;
a07 with ma07,a08 with ma08,a09 with ma09,a10 with ma10

repl a11 with ma11,a12 with ma12,a13 with ma13,a14 with ma14,;
a15 with ma15,a16 with ma16,b01 with mb01,b02 with mb02,;
b04 with mb04,b05 with mb05,b06 with mb06,b07 with mb07,c01 with mc01,;
c02 with mc02,c04 with mc04,abc with mabc,q01 with mq01,;
q02 with mq02,q03 with mq03
skip
endif
skip
enddo
do mm
use &gg-ht
appe blan
repl bm with "全公司"
repl qch with aqch,a01 with aa01,a02 with aa02,;
a03 with aa03,a04 with aa04,a05 with aa05,a06 with aa06,;
a07 with aa07,a08 with aa08,a09 with aa09,a10 with aa10,;
a11 with aa11,a12 with aa12,a13 with aa13,a14 with aa14,;
a15 with aa15,a16 with aa16,b01 with ab01,b02 with ab02,;
b04 with ab04,b05 with ab05,b06 with ab06,b07 with ab07,c01 with ac01,;
c02 with ac02,c04 with ac04,abc with aabc,q01 with aq01,;
q02 with aq02,q03 with aq03

use &gg-ht
sum qch,a01,a02,a03,a04,a05,a06,a07,a08,a09,a10,a11,a12,a13,;
a14,a15,a16,b01,b02,b04,b05,b06,b07,c01,c02,c04,abc,q01,q02,q03 ;
to aqch,aa01,aa02,aa03,aa04,aa05,aa06,aa07,aa08,aa09,aa10,;
aa11,aa12,aa13,aa14,aa15,aa16,ab01,ab02,ab04,ab05,ab06,ab07,ac01,;
ac02,ac04,aabc,aq01,aq02,aq03 for bm="公司管理"
appe blan
repl bm with "公司管理"
repl qch with aqch,a01 with aa01,a02 with aa02,;
a03 with aa03,a04 with aa04,a05 with aa05,a06 with aa06,;
a07 with aa07,a08 with aa08,a09 with aa09,a10 with aa10,;
a11 with aa11,a12 with aa12,a13 with aa13,a14 with aa14,;
a15 with aa15,a16 with aa16,b01 with ab01,b02 with ab02,;
b04 with ab04,b05 with ab05,b06 with ab06,b07 with ab07,c01 with ac01,;
c02 with ac02,c04 with ac04,abc with aabc,q01 with aq01,;
q02 with aq02,q03 with aq03

use &gg-ht
sum qch,a01,a02,a03,a04,a05,a06,a07,a08,a09,a10,a11,a12,a13,;
a14,a15,a16,b01,b02,b04,b05,b06,b07,c01,c02,c04,abc,q01,q02,q03 ;
to aqch,aa01,aa02,aa03,aa04,aa05,aa06,aa07,aa08,aa09,aa10,;
aa11,aa12,aa13,aa14,aa15,aa16,ab01,ab02,ab04,ab05,ab06,ab07,ac01,;
ac02,ac04,aabc,aq01,aq02,aq03 for bm="管理人员"
appe blan
repl bm with "管理人员"
repl qch with aqch,a01 with aa01,a02 with aa02,;
a03 with aa03,a04 with aa04,a05 with aa05,a06 with aa06,;
a07 with aa07,a08 with aa08,a09 with aa09,a10 with aa10,;
a11 with aa11,a12 with aa12,a13 with aa13,a14 with aa14,;
a15 with aa15,a16 with aa16,b01 with ab01,b02 with ab02,;
b04 with ab04,b05 with ab05,b06 with ab06,b07 with ab07,c01 with ac01,;
c02 with ac02,c04 with ac04,abc with aabc,q01 with aq01,;
q02 with aq02,q03 with aq03

use &gg-ht
sum qch,a01,a02,a03,a04,a05,a06,a07,a08,a09,a10,a11,a12,a13,;
a14,a15,a16,b01,b02,b04,b05,b06,b07,c01,c02,c04,abc,q01,q02,q03 ;
to aqch,aa01,aa02,aa03,aa04,aa05,aa06,aa07,aa08,aa09,aa10,;
aa11,aa12,aa13,aa14,aa15,aa16,ab01,ab02,ab04,ab05,ab06,ab07,ac01,;
ac02,ac04,aabc,aq01,aq02,aq03 for bm="生产人员"
appe blan
repl bm with "生产人员"
repl qch with aqch,a01 with aa01,a02 with aa02,;
a03 with aa03,a04 with aa04,a05 with aa05,a06 with aa06,;
a07 with aa07,a08 with aa08,a09 with aa09,a10 with aa10,;
a11 with aa11,a12 with aa12,a13 with aa13,a14 with aa14,;
a15 with aa15,a16 with aa16,b01 with ab01,b02 with ab02,;
b04 with ab04,b05 with ab05,b06 with ab06,b07 with ab07,c01 with ac01,;
c02 with ac02,c04 with ac04,abc with aabc,q01 with aq01,;
q02 with aq02,q03 with aq03

use &gg-ht
sum qch,a01,a02,a03,a04,a05,a06,a07,a08,a09,a10,a11,a12,a13,;
a14,a15,a16,b01,b02,b04,b05,b06,b07,c01,c02,c04,abc,q01,q02,q03 ;
to aqch,aa01,aa02,aa03,aa04,aa05,aa06,aa07,aa08,aa09,aa10,;
aa11,aa12,aa13,aa14,aa15,aa16,ab01,ab02,ab04,ab05,ab06,ab07,ac01,;
ac02,ac04,aabc,aq01,aq02,aq03 for bm="销售人员"
appe blan
repl bm with "销售人员"
repl qch with aqch,a01 with aa01,a02 with aa02,;
a03 with aa03,a04 with aa04,a05 with aa05,a06 with aa06,;
a07 with aa07,a08 with aa08,a09 with aa09,a10 with aa10,;
a11 with aa11,a12 with aa12,a13 with aa13,a14 with aa14,;
a15 with aa15,a16 with aa16,b01 with ab01,b02 with ab02,;
b04 with ab04,b05 with ab05,b06 with ab06,b07 with ab07,c01 with ac01,;
c02 with ac02,c04 with ac04,abc with aabc,q01 with aq01,;
q02 with aq02,q03 with aq03

*use &gg-ht
*sum qch,a01,a02,a03,a04,a05,a06,a07,a08,a09,a10,a11,a12,a13,;
*a14,a15,a16,b01,b02,b04,b05,c01,c02,c04,abc to aqch,aa01,aa02,;
*aa03,aa04,aa05,aa06,aa07,aa08,aa09,aa10,aa11,aa12,aa13,;
*aa14,aa15,aa16,ab01,ab02,ab04,ab05,ac01,ac02,ac04,aabc ;
*for bm="退休人员"
*appe blan
*repl bm with "退休人员"
*repl qch with aqch,a01 with aa01,a02 with aa02,;
*a03 with aa03,a04 with aa04,a05 with aa05,a06 with aa06,;
*a07 with aa07,a08 with aa08,a09 with aa09,a10 with aa10,;
*a11 with aa11,a12 with aa12,a13 with aa13,a14 with aa14,;
*a15 with aa15,a16 with aa16,b01 with ab01,b02 with ab02,;
*b04 with ab04,b05 with ab05,c01 with ac01,c02 with ac02,;
*c04 with ac04,abc with aabc
