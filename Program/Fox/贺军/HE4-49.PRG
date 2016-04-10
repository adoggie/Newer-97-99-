set talk off
do mm
do he4-49-0
do mm
use &gg
store ymd to mymd
yx=y+mymd
yxx=str(year(date()),4)+subs(str(mont(date())+101,3),2,2)
if yx<>yxx
@24,52 say "不能汇总! 请检查日期.";
FONT "宋体",14 style "Bold" color rgb(0,0,0,,,)
wait ""
return
endif
************1: 个调税
USE &gg
set colo to g+/b+
set device to screen
REPL ALL b06 WITH 0
repl all tt with a01+a02+a03+a04+a05+a06+a07+a08+a09+a11+a12+a13+;
a14+a15+a16-b01-b02-b04-b05-b07-c01-c02-c04-q01-q02-q03
REPL ALL b06 WITH ((A01+A03+A04+A05+A15-C01-C02)-1000)*0.05 ;
FOR subs(BM,1,8)<>"退休人员"
REPL ALL b06 WITH 0 FOR b06<0
REPL ALL abc WITH TT-b06
USE
************2:汇总处理
use &gg-hz
zap
use abcd
inde on bmxzh to sy
use abcd inde sy
tota to abcd1 on subs(bm,3,6) fiel bm,bmxzh
use &gg
store ymd to mymd
store subs(bmxzh,1,1) to mbmxzh
sum qch,a01,a02,a03,a04,a05,a06,a07,a08,a09,a10,a11,a12,a13,;
a14,a15,a16,b01,b02,b04,b05,b06,b07,c01,c02,c04,abc,q01,q02,q03 ;
to aqch,aa01,aa02,aa03,aa04,aa05,aa06,aa07,aa08,aa09,aa10,;
aa11,aa12,aa13,aa14,aa15,aa16,ab01,ab02,ab04,ab05,ab06,ab07,ac01,;
ac02,ac04,aabc,aq01,aq02,aq03 ;
for subs(bm,3,4)="支部".and.sxh<>"4"
*****
use &gg-hz
appe blan
repl bm with "公司管理",ymd with mymd,xm with "公司管理",bmxzh with mbmxzh
repl qch with aqch,a01 with aa01,a02 with aa02,;
a03 with aa03,a04 with aa04,a05 with aa05,a06 with aa06,;
a07 with aa07,a08 with aa08,a09 with aa09,a10 with aa10,;
a11 with aa11,a12 with aa12,a13 with aa13,a14 with aa14,;
a15 with aa15,a16 with aa16,b01 with ab01,b02 with ab02,;
b04 with ab04,b05 with ab05,b06 with ab06,b07 with ab07,;
c01 with ac01,c02 with ac02,c04 with ac04,abc with aabc,;
q01 with aq01,q02 with aq02,q03 with aq03

use &gg
sum qch,a01,a02,a03,a04,a05,a06,a07,a08,a09,a10,a11,a12,a13,;
a14,a15,a16,b01,b02,b04,b05,b06,b07,c01,c02,c04,abc,q01,q02,q03 ;
to aqch,aa01,aa02,aa03,aa04,aa05,aa06,aa07,aa08,aa09,aa10,;
aa11,aa12,aa13,aa14,aa15,aa16,ab01,ab02,ab04,ab05,ab06,ab07,ac01,;
ac02,ac04,aabc,aq01,aq02,aq03 for sxh="4"
*****
use &gg-hz
appe blan
repl bm with "销售人员",xm with "销售科",bmxzh with mbmxzh
repl qch with aqch,a01 with aa01,a02 with aa02,;
a03 with aa03,a04 with aa04,a05 with aa05,a06 with aa06,;
a07 with aa07,a08 with aa08,a09 with aa09,a10 with aa10,;
a11 with aa11,a12 with aa12,a13 with aa13,a14 with aa14,;
a15 with aa15,a16 with aa16,b01 with ab01,b02 with ab02,;
b04 with ab04,b05 with ab05,b06 with ab06,b07 with ab07,;
c01 with ac01,c02 with ac02,c04 with ac04,abc with aabc,;
q01 with aq01,q02 with aq02,q03 with aq03
use

sele 1
use abcd1
go 2
sele 2
use &gg
sele 3
use &gg-hz
**********************从修动科开始
do while .not.eof()
sele 1
store bm to mbm
store subs(bm,1,8) to mbmh
store subs(bmxzh,1,1) to mbmxzh
sele 2
sum qch,a01,a02,a03,a04,a05,a06,a07,a08,a09,a10,a11,a12,a13,;
a14,a15,a16,b01,b02,b04,b05,b06,b07,c01,c02,c04,abc,q01,q02,q03 ;
to aqch,aa01,aa02,aa03,aa04,aa05,aa06,aa07,aa08,aa09,aa10,;
aa11,aa12,aa13,aa14,aa15,aa16,ab01,ab02,ab04,ab05,ab06,ab07,ac01,;
ac02,ac04,aabc,aq01,aq02,aq03 for allt(subs(bm,1,8))=allt(mbm)
sele 3
appe blan
repl bm with mbm,xm with mbmh,bmxzh with mbmxzh       &&部门
repl qch with aqch,a01 with aa01,a02 with aa02,;
a03 with aa03,a04 with aa04,a05 with aa05,a06 with aa06,;
a07 with aa07,a08 with aa08,a09 with aa09,a10 with aa10,;
a11 with aa11,a12 with aa12,a13 with aa13,a14 with aa14,;
a15 with aa15,a16 with aa16,b01 with ab01,b02 with ab02,;
b04 with ab04,b05 with ab05,b06 with ab06,b07 with ab07,;
c01 with ac01,c02 with ac02,c04 with ac04,abc with aabc,;
q01 with aq01,q02 with aq02,q03 with aq03

sele 2
sum qch,a01,a02,a03,a04,a05,a06,a07,a08,a09,a10,a11,a12,a13,;
a14,a15,a16,b01,b02,b04,b05,b06,b07,c01,c02,c04,abc,q01,q02,q03 ;
to aqch,aa01,aa02,aa03,aa04,aa05,aa06,aa07,aa08,aa09,aa10,;
aa11,aa12,aa13,aa14,aa15,aa16,ab01,ab02,ab04,ab05,ab06,ab07,ac01,;
ac02,ac04,aabc,aq01,aq02,aq03 for sxh="2".and.allt(subs(bm,1,8))=allt(mbm)
if aqch<>0
sele 3
appe blan
repl bm with "管理人员",xm with mbmh&&,bmxzh with mbmxzh
repl qch with aqch,a01 with aa01,a02 with aa02,;
a03 with aa03,a04 with aa04,a05 with aa05,a06 with aa06,;
a07 with aa07,a08 with aa08,a09 with aa09,a10 with aa10,;
a11 with aa11,a12 with aa12,a13 with aa13,a14 with aa14,;
a15 with aa15,a16 with aa16,b01 with ab01,b02 with ab02,;
b04 with ab04,b05 with ab05,b06 with ab06,b07 with ab07,;
c01 with ac01,c02 with ac02,c04 with ac04,abc with aabc,;
q01 with aq01,q02 with aq02,q03 with aq03
endif
sele 2
sum qch,a01,a02,a03,a04,a05,a06,a07,a08,a09,a10,a11,a12,a13,;
a14,a15,a16,b01,b02,b04,b05,b06,b07,c01,c02,c04,abc,q01,q02,q03 ;
to aqch,aa01,aa02,aa03,aa04,aa05,aa06,aa07,aa08,aa09,aa10,;
aa11,aa12,aa13,aa14,aa15,aa16,ab01,ab02,ab04,ab05,ab06,ab07,ac01,;
ac02,ac04,aabc,aq01,aq02,aq03 for sxh="3".and.allt(subs(bm,1,8))=allt(mbm)
if aqch<>0
sele 3
appe blan
repl bm with "生产人员",xm with mbmh&&,bmxzh with mbmxzh
repl qch with aqch,a01 with aa01,a02 with aa02,;
a03 with aa03,a04 with aa04,a05 with aa05,a06 with aa06,;
a07 with aa07,a08 with aa08,a09 with aa09,a10 with aa10,;
a11 with aa11,a12 with aa12,a13 with aa13,a14 with aa14,;
a15 with aa15,a16 with aa16,b01 with ab01,b02 with ab02,;
b04 with ab04,b05 with ab05,b06 with ab06,b07 with ab07,;
c01 with ac01,c02 with ac02,c04 with ac04,abc with aabc,;
q01 with aq01,q02 with aq02,q03 with aq03
endif
sele 1
skip
enddo
***************** 全公司汇总(不包括退休人员)
sele 3
sum qch,a01,a02,a03,a04,a05,a06,a07,a08,a09,a10,a11,a12,a13,;
a14,a15,a16,b01,b02,b04,b05,b06,b07,c01,c02,c04,abc,q01,q02,q03 ;
to aqch,aa01,aa02,aa03,aa04,aa05,aa06,aa07,aa08,aa09,aa10,aa11,;
aa12,aa13,aa14,aa15,aa16,ab01,ab02,ab04,ab05,ab06,ab07,ac01,ac02,;
ac04,aabc,aq01,aq02,aq03 for bm<>"退休人员".and.bmxzh<>"  "
appe blan
repl bm with "全 公 司",xm with "全 公 司"
repl qch with aqch,a01 with aa01,a02 with aa02,;
a03 with aa03,a04 with aa04,a05 with aa05,a06 with aa06,;
a07 with aa07,a08 with aa08,a09 with aa09,a10 with aa10,;
a11 with aa11,a12 with aa12,a13 with aa13,a14 with aa14,;
a15 with aa15,a16 with aa16,b01 with ab01,b02 with ab02,;
b04 with ab04,b05 with ab05,b06 with ab06,b07 with ab07,;
c01 with ac01,c02 with ac02,c04 with ac04,abc with aabc,;
q01 with aq01,q02 with aq02,q03 with aq03

sum qch,a01,a02,a03,a04,a05,a06,a07,a08,a09,a10,a11,a12,a13,;
a14,a15,a16,b01,b02,b04,b05,b06,b07,c01,c02,c04,abc,q01,q02,q03 ;
to aqch,aa01,aa02,aa03,aa04,aa05,aa06,aa07,aa08,aa09,aa10,aa11,;
aa12,aa13,aa14,aa15,aa16,ab01,ab02,ab04,ab05,ab06,ab07,ac01,ac02,;
ac04,aabc,aq01,aq02,aq03 for bm="公司管理"
appe blan
repl bm with "公司管理",xm with "全 公 司"
repl qch with aqch,a01 with aa01,a02 with aa02,;
a03 with aa03,a04 with aa04,a05 with aa05,a06 with aa06,;
a07 with aa07,a08 with aa08,a09 with aa09,a10 with aa10,;
a11 with aa11,a12 with aa12,a13 with aa13,a14 with aa14,;
a15 with aa15,a16 with aa16,b01 with ab01,b02 with ab02,;
b04 with ab04,b05 with ab05,b06 with ab06,b07 with ab07,;
c01 with ac01,c02 with ac02,c04 with ac04,abc with aabc,;
q01 with aq01,q02 with aq02,q03 with aq03

sum qch,a01,a02,a03,a04,a05,a06,a07,a08,a09,a10,a11,a12,a13,;
a14,a15,a16,b01,b02,b04,b05,b06,b07,c01,c02,c04,abc,q01,q02,q03 ;
to aqch,aa01,aa02,aa03,aa04,aa05,aa06,aa07,aa08,aa09,aa10,aa11,;
aa12,aa13,aa14,aa15,aa16,ab01,ab02,ab04,ab05,ab06,ab07,ac01,ac02,;
ac04,aabc,aq01,aq02,aq03 for bm="管理人员"
appe blan
repl bm with "管理人员",xm with "全 公 司"
repl qch with aqch,a01 with aa01,a02 with aa02,;
a03 with aa03,a04 with aa04,a05 with aa05,a06 with aa06,;
a07 with aa07,a08 with aa08,a09 with aa09,a10 with aa10,;
a11 with aa11,a12 with aa12,a13 with aa13,a14 with aa14,;
a15 with aa15,a16 with aa16,b01 with ab01,b02 with ab02,;
b04 with ab04,b05 with ab05,b06 with ab06,b07 with ab07,;
c01 with ac01,c02 with ac02,c04 with ac04,abc with aabc,;
q01 with aq01,q02 with aq02,q03 with aq03

sum qch,a01,a02,a03,a04,a05,a06,a07,a08,a09,a10,a11,a12,a13,;
a14,a15,a16,b01,b02,b04,b05,b06,b07,c01,c02,c04,abc,q01,q02,q03 ;
to aqch,aa01,aa02,aa03,aa04,aa05,aa06,aa07,aa08,aa09,aa10,aa11,;
aa12,aa13,aa14,aa15,aa16,ab01,ab02,ab04,ab05,ab06,ab07,ac01,ac02,;
ac04,aabc,aq01,aq02,aq03 for bm="生产人员"
appe blan
repl bm with "生产人员",xm with "全 公 司"
repl qch with aqch,a01 with aa01,a02 with aa02,;
a03 with aa03,a04 with aa04,a05 with aa05,a06 with aa06,;
a07 with aa07,a08 with aa08,a09 with aa09,a10 with aa10,;
a11 with aa11,a12 with aa12,a13 with aa13,a14 with aa14,;
a15 with aa15,a16 with aa16,b01 with ab01,b02 with ab02,;
b04 with ab04,b05 with ab05,b06 with ab06,b07 with ab07,;
c01 with ac01,c02 with ac02,c04 with ac04,abc with aabc,;
q01 with aq01,q02 with aq02,q03 with aq03

sum qch,a01,a02,a03,a04,a05,a06,a07,a08,a09,a10,a11,a12,a13,;
a14,a15,a16,b01,b02,b04,b05,b06,b07,c01,c02,c04,abc,q01,q02,q03 ;
to aqch,aa01,aa02,aa03,aa04,aa05,aa06,aa07,aa08,aa09,aa10,aa11,;
aa12,aa13,aa14,aa15,aa16,ab01,ab02,ab04,ab05,ab06,ab07,ac01,ac02,;
ac04,aabc,aq01,aq02,aq03 for bm="销售人员"
appe blan
repl bm with "销售人员",xm with "全 公 司"
repl qch with aqch,a01 with aa01,a02 with aa02,;
a03 with aa03,a04 with aa04,a05 with aa05,a06 with aa06,;
a07 with aa07,a08 with aa08,a09 with aa09,a10 with aa10,;
a11 with aa11,a12 with aa12,a13 with aa13,a14 with aa14,;
a15 with aa15,a16 with aa16,b01 with ab01,b02 with ab02,;
b04 with ab04,b05 with ab05,b06 with ab06,b07 with ab07,;
c01 with ac01,c02 with ac02,c04 with ac04,abc with aabc,;
q01 with aq01,q02 with aq02,q03 with aq03
do mm
*************复制下月数据库
store val(subs(gg,4,2)) to okc
store allt(str(okc+1,2)) to okd,okc
if okd="13"
store "1" to okd
endif
store "gza"+okd to okk
store subs(str((val(okd)+100),3),2,2) to okc
use &gg
copy to &okk
use &okk
repl all ymd with okc
use
return
