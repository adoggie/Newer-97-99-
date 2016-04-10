return
set talk off
do kmswin with 7,38,12,51,"gr+/n","gr+/w"  
@ 8,39 prom "1.金山 W P S"
@ 9,39 prom "2.中文 UCDOS"
@10,39 prom "3.中文 213 H"
@11,39 prom "4.默  认  值"
clear type
sys=1
menu to sys
do case
case sys=1
copy file puc1.prg to prt1.prg
copy file puc2.prg to prt2.prg
case sys=2
copy file ucdos1.prg to prt1.prg
copy file ucdos2.prg to prt2.prg
case sys=3
copy file 213(x)1.prg to prt1.prg
copy file 213(x)2.prg to prt2.prg
case sys=4
copy file mrz1.prg to prt1
copy file mrz2.prg to prt2
endcase
return
