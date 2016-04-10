*SET COLOR TO 
*@1,22 say " "
**@0.5,22 clea to 1.5,wcols()-30 
@1,28 say "     部 门        人 数   实际收入   实际支出   工资总计" style "b" font "mingli",12 COLOR RGB (255,0,0,0,0,255) 
DO DRAW WITH 0.6,26,72,1.8 IN BOX2

sele 3
calc cnt() to n
dime a[n,2]   &&n : bm   second :total man!
dime sz[n,2]  && n:bm    second: total sfgz
dime ss[n,2]
dime sj[n,2]
dime zj[4]
for i=1 to n
a[i,1]=i
sz[i,1]=i
ss[i,1]=i
sj[i,1]=i
endfor
sele 2
for i=1 to n
calc cnt() for bm=i to x
a[i,2]=x
calc sum(ss) for bm=i to x1
ss[i,2]=x1
calc sum(sz) for bm=i to x2
sz[i,2]=x2
calc sum(sjgz) for bm=i to x3
sj[i,2]=x3
****************
endfor
calc cnt() to n1
calc sum(sz) to n2
calc sum(ss) to n3
calc sum(sjgz) to n4
zj[1]=n1
zj[2]=n3
zj[3]=n2
zj[4]=n4


dime fido[n+1]
sele 3
for i=1 to n
go i
fido[i]=bm
fido[i]=fido[i]+"|"+PADC(str(a[i,2],10),14," ")+"|"+PADC(str(ss[i,2],10,2),14," ")+"|"+PADC(str(sz[i,2],10,2),14," ")+"|"+PADC(str(sj[i,2],10,2),14," ")
endfor
fido[N+1]=PADR("TOTAL:",11," ")+"|"+PADL(str(ZJ[1],10),14," ")+"|"+PADL(str(ZJ[2],10,2),14," ")+"|"+PADL(str(ZJ[3],10,2),14," ")+"|"+PADL(str(ZJ[4],10,2),14," ")

@2.5,26 get zz defa 1 from fido size 16,54;
font "arial",12 style "bt";
color ,rgb(255,255,255,0,111,111)
@0.9 ,wcols()-12 get f defa 1 pictu "@* X" VALID DOEXIT() STYLE "B";
FONT "MINGLI",12 SIZE 1,2
read  CYCLE


PROC DOEXIT
SET COLOR TO 
@2,22 SAY "  "

CLEA READ
@0.2 ,22 CLEA TO WROW()-3,WCOL()-4
RETURN


