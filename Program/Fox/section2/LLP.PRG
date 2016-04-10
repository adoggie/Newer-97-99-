set talk off
set echo off
set safe off
set deli off
set dele on
*set colo to
set scoreboard off
set escape on
set delimiter off
set conf off
set cons off
set date ansi
set safety off
*set clock status
*set exclusive off&&ÍøÂç
set status bar off&&¹Ø±Õ×´Ì¬ÐÐ£¨¿ÉÌá¸ßËÙ¶È£©

*define window lpp1 at 0.000,0.000 size 28.000,80.000
*activate window lpp1
modify window screen font "ËÎÌå",11
public y,m,d,aa,bb,cc,dd,kk,gg,hh,ii,tt11
store subs(str(year(date()),4),3,2) to y
*if val(y)>=96
*set path to c:\;c:\dos
*set cons off
*! echo off
*endif
on esca do esc
*on key =315 do help
on key label f1 do help
on key label f2 do help2
on key label f3 do help3
on key label f4 do help4
on key label f5 do help5
*on error do err-1
@0,70 say time()
use fox1-99
*if flock()=.F.&&ÍøÂç
*unlock all
*endif
repl yymmdd with date(),time with time()
store password to ll
store 0 to yy,mm,dd
set colo to gr+/bg+
clear
set colo to g+/7,r+/bg
@6,20 clear to 17,58
@ 6,20 TO 6,58.1 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
@ 6.05,58 TO 17,58 PEN 2,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@17,20 TO 17,58.3 PEN 2,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@ 6,20 TO 17.0,20 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
nq=0
waa=22
w0="¡¾ "
w1="»¶ "
w2="Ó­ "
w3="¹â "
w4="ÁÙ "
w5="±¾ "
w6="Ïµ "
w7="Í³ "
w8="¡¿"
qop=1
do while .t.
wa0=7
wx="w"+str(nq,1)
do case
case qop=1
set colo to r+/7
case qop=2
set colo to gr+/7
case qop=3
set colo to w+/7
case qop=4
set colo to bg+/7
case qop=5
set colo to r+/7
case qop=6
set colo to br+/7
case qop=7
set colo to gr+/7
case qop=8
set colo to g+/7
case qop=9
set colo to r+/7
case qop=10
qop=0
endcase
do while .t.
xn=0
do while xn<=10
@wa0,waa say subs(&wx,1,3)
@wa0,waa say subs(&wx,1,3)
@wa0,waa say subs(&wx,1,3)
xn=xn+1
enddo
wa0=wa0+1
if wa0>=11
exit
endif
@wa0-1,waa say "    "
enddo
nq=nq+1
waa=waa+4
if nq=9
exit
endif
qop=qop+1
enddo
qqa="    ¶«º½Éè±¸ÖÆÔì¹«Ë¾µçÄÔÊÒ±àÖÆ     "
qqb=" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  "
qqc="        HE JUN-V3.0 1998.3         "
qqd="    ÇëÊäÈëÃÜÂë: ********           "
qa=56
qb=52
qc=57
xc=2
do while .t.
set colo to w+/7
@8,qa say subs(qqa,1,xc) FONT"ËÎÌå",12
set colo to r+/7
@11,qa say subs(qqb,1,xc)
set colo to gr+/7
@12,qa say subs(qqc,1,xc)
set colo to n+/7
@14,qa say subs(qqd,1,xc)
qa=qa-2
qb=qb-1
qc=qc-1
xc=xc+2
if qa<22
exit
endif
enddo

na=0
do while na<5
n=0
store " " to a2,ok
store "   " to o
set colo to n+/7
@14,38 say "********"
@ 14,37 TO 14,47 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@ 14,47 TO 15,47 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
@ 15,37 TO 15,47+.1 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)  
@ 14,37 TO 15,37 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
set colo to n+/7
@14,26 say "ÇëÊäÈëÃÜÂë:"
@14,49 say str(na,1) 
@14,51 say "´Î"
do while .t.
set cons off
@14,37.2 say ""
wait to o
set cons on
ok=ok+o
a2=a2+"*"
set colo to r+/7
@14,38 say trim(ltri(a2))
@ 14,37 TO 14,47 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@ 14,47 TO 15,47 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
@ 15,37 TO 15,47 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)  
@ 14,37 TO 15,37+.1 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)                      
n=n+1
if n=8
exit
endif
enddo
do case
case ok<>" &ll"          
@14,22 clear to 14,50 
set colo to n+/7
@14,38 say "ÃÜÂë´í!!"
@ 14,37 TO 14,47 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@ 14,47 TO 15,47 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
@ 15,37 TO 15,47 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)  
@ 14,37 TO 15,37 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
xn=0
do while xn<30000
xn=xn+1
enddo
@14,22 clear to 14,50
na=na+1
ok=" "
a2=" "
loop
case ok=" &ll"
exit
endcase
enddo
if na=5
set colo to w+/n+
clear
you=24
do while .t.
@you,25 say "<< Äã ÊÇ ·Ç ·¨ ÓÃ »§! >>"
you=you-1
if you=6
exit
endif
you1=1
do while you1<300
you1=you1+1
enddo
@you+1,25 say "                        "
enddo
clear all
return
endif
zx="1"
wbb=57
do while .t.
set colo to w+/3+
@6.3,wbb-1 clear to 16.7,57.4&&wbb
*xn=0
*do while xn<=100
*xn=xn+1
*enddo
wbb=wbb-1
if wbb<=22
exit
endif
enddo
store subs(str(year(date()),4),3,2) to yy
store subs(str(mont(date()),2),1,2) to mm
store subs(str(day(date()),2),1,2) to dd
xw1=" =¡ï= CHINA EASTERN AIRLINE =¡ï=     "
xw2="      ~~~~~~~~~~~~~~~~~~~~~          "
xw3="    ¡¾ LONG-HUA DEPARTMENT ¡¿        "
xw7="   ÇëÊäÈëÈÕÆÚ: &yy Äê &mm ÔÂ &dd ÈÕ  "
xq2=2
xwo="                                     "
wbb=22
o1=1
do while .t.
xn=0
do while xn<=5
xn=xn+2
enddo
set colo to w+/7
@6.3,wbb clear to 16.7,wbb+3.4
@ 6.3,20.6 TO 6.3,wbb+3.4 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
@ 16.7,20.6 TO 16.7,wbb+3.4 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
@ 6.3,20.6 TO 16.7,20.6 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
@ 6.4,20.7 TO 6.4,wbb+3.3 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@ 16.6,20.7 TO 16.6,wbb+3.3 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@ 6.4,20.7 TO 16.6,20.7 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
xn=0

if wbb>=22
set colo to bg+/7
@7,22 say subs(xwo,o1,xq2)
@8,22 say subs(xw1,o1,xq2)
@9,22 say subs(xw2,o1,xq2)
@10,22 say subs(xwo,o1,xq2)
set colo to w+/7
@11,22 say subs(xw3,o1,xq2)
@12,22 say subs(xwo,o1,xq2)
@13,22 say subs(xwo,o1,xq2)
set colo to gr+/7
@14,22 say subs(xw7,o1,xq2)
@15,22 say subs(xwo,o1,xq2)
xq2=xq2+1
endif
wbb=wbb+1
if wbb>=55
exit
endif
enddo
@ 6.3,57.4 TO 16.73,57.4 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
@ 6.4,57.3 TO 16.6,57.3 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
do he-ymd
store yy to y
store mm to m
store dd to d
do he0-52
zx=" "
set colo to n+/7
waa=40
wbb=40
qok5=hh1
qok6=hh2
qok7=hh3
qok8=hh4
qok9=hh5
qoka=hh6
qok1="  Ö÷´°¿Ú: "+"&qok5  "+"&qok6  "+"&qok7  ";
+"&qok8  "+"&qok9  "+"&qoka  "+"ÍË³öÏµÍ³©  "
qok4=4
do while .t.
set colo to n+/bg
@1.2,waa-2 clear to 25,waa
@1.2,wbb clear to 25,wbb+2
if waa>=3
set colo to n+/7
@0.1,waa-2 say subs(qok1,waa-1,qok4)
@0,waa-2 TO 0,wbb+2 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,0,0,0)
@1.1,waa-2 clear to 1.2,wbb+2
@1.2,waa-2 TO 1.2,wbb+2 PEN 2,8 STYLE "1" COLOR RGB(0,0,0,255,255,255,)
endif
waa=waa-2
wbb=wbb+2
qok4=qok4+4
if waa<=1
exit
endif
enddo
xl=0
xb=20
q2=11
store 1 to b1,q1,s,smrow,mcol1,mrow1
*****

do while .t.
set colo to n+/7
@0.1,10 say "&qok5  "+"&qok6  "+"&qok7  ";
+"&qok8  "+"&qok9  "+"&qoka  "+"ÍË³öÏµÍ³"FONT"ËÎÌå",12 colo rgb(0,0,0,,,,)

@1.1,1 clear to 1.2,79.2
@0.1,78 clear to 1.2,79.2
@1.2,9.1 TO 1.2,79.2 PEN 2,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@0.1,1 say " Ö÷´°¿Ú: "FONT"ËÎÌå",12 colo rgb(255,255,255,,,,)
sele=0
@0.01,1.06 get sele picture "@*CB »Õ.bmp" size 1.3,8
@1.2,1 TO 1.2,9.1 PEN 2,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@0,1 TO 0,9.1 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
@0,9.1 TO 0,79 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
@0,79 TO 1.2,79 PEN 2,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@0,9 TO 1.2,9 PEN 2,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@0,9.1 TO 1.2,9.1 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
@1.2,9.1 TO 1.2,79.2 PEN 2,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@0,1 TO 1.2,1 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
store 0 to ncol1
do while ncol1+13.6<69
@0,ncol1+18.9 to 1.2,ncol1+18.9 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,,,,)
@0,ncol1+19 to 1.2,ncol1+19 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
ncol1=ncol1+10
enddo
hh=1
set color to n+/7,r+/7
@26.3,0 clear
use fox1-99
store yk10 to ykyk
@26.4,1 say "µ±Ç°¹ÜÀí:"FONT"ËÎÌå",12 colo rgb(0,0,0,,,,)
@26.4,55 say "µ±Ç°ÈÕÆÚ:"FONT"ËÎÌå",12 colo rgb(0,0,0,,,,)
set colo to w+/7
@26.4,65 say "&y "+"Äê"+"&m "+"ÔÂ"+"&d "+"ÈÕ"
@26.4,10.2 say ykyk   &&subs(ykyk,1,20)
@26.3,0 TO 26.3,79.9 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
@26.3,79.8 TO 27.5,79.8 PEN 2,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@27.4,0 TO 27.4,79.9 PEN 2,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@26.3,0 TO 27.4,0 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
@26.3,10 TO 27.4,10 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@26.3,10.1 TO 27.4,10.1 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
@26.3,54 TO 27.4,54 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@26.3,54.1 TO 27.4,54.1 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
@26.3,64 TO 27.4,64 PEN 1,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@26.3,64.1 TO 27.4,64.1 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
set colo to gr+/bg+
do while .t.
set colo to w+/bg+,w+/7
@2,0 clear to 26,80
set colo to w+/r+
store "hh"+str(b1,1) to hh
@0.1,b1*10 say &hh FONT"ËÎÌå",12 &&·´ÏÔµ±Ç°Ö÷²Ëµ¥Ãû(ºì)
if q2=10 .and. b1<>7 &&À­ÏÂµ±Ç°²Ëµ¥
store "uu"+str(b1,1) to uu
store "ee"+str(b1,1) to ee
set color to w+/7,r+/b
@2,b1*10-3 clear to &uu+4,b1*10+11
@2,b1*10-3 TO 2,b1*10+11 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
@2,b1*10+11 TO &uu+4,b1*10+11 PEN 1.5,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@ &uu+4,b1*10-3 TO &uu+4,b1*10+11.1 PEN 1.5,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@2,b1*10-3 TO &uu+4,b1*10-3 PEN 1,8 STYLE "1" COLOR RGB(255,255,255,255,255,255)
@2.21,b1*10+11.1 TO &uu+4.23,b1*10+11.1 PEN 3,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
@ &uu+4.05,b1*10-3+.4 TO &uu+4.05,b1*10+11.44 PEN 4,8 STYLE "1" COLOR RGB(0,0,0,0,0,0)
hh=1
do while &ee<>"          " &&ÏÔÊ¾×Ó²Ëµ¥
@hh+2,b1*10-2 say &ee
hh=hh+1
skip
enddo
use fox1-99
store &uu to xl &&×Ó²Ëµ¥³¤¶È
store b1*10-2 to xb &&×Ó²Ëµ¥ÁÐÎ»
endif
do while .t.
store "ee"+str(b1,1) to ss
go s
if q2=10 .and. b1<>7 &&×Ó²Ëµ¥ÉÏ¹âÌõ
@s+2,xb get &ss
store s to smrow
set colo to r+/bg+
@s+2,xb-4 say " ¡ï"
endif
key=inkey(0,"m")

do case
case key=151.and.(mcol()>=10.and.mcol()<=18).and.mrow()<1
store 1 to b1
store 1 to s
store 10 to q2
case key=151.and.(mcol()>=20.and.mcol()<=28).and.mrow()<1
store 2 to b1
store 1 to s
store 10 to q2
case key=151.and.(mcol()>=30.and.mcol()<=38).and.mrow()<1
store 3 to b1
store 1 to s
store 10 to q2
case key=151.and.(mcol()>=40.and.mcol()<=48).and.mrow()<1
store 4 to b1
store 1 to s
store 10 to q2
case key=151.and.(mcol()>=50.and.mcol()<=58).and.mrow()<1
store 5 to b1
store 1 to s
store 10 to q2
case key=151.and.(mcol()>=60.and.mcol()<=68).and.mrow()<1
store 6 to b1
store 1 to s
store 10 to q2
case key=151.and.(mcol()>=70.and.mcol()<=78).and.mrow()<1
store 7 to b1
store 1 to s
store 11 to q2

case key=151.and.(mcol()>=0.and.mcol()<=10).and.mrow()>25&&Ñ¡ÔñÄ¿Â¼
clear gets
use fox1-99
repl bb1 with b1,qq2 with q2,ss with s,xxl with xl,;
xxb with xb,yek with key
use
store 100 to mcol1
store 100 to mrow1
do he0-52
use fox1-99
store bb1 to b1
store qq2 to q2
store ss to s
store xxl to xl
store xxb to xb
store yek to key
exit

case key=151.and.(mcol()>=55.and.mcol()<=64).and.mrow()>25&&ÐÞ¸ÄÈÕÆÚ
clear gets
use fox1-99
repl bb1 with b1,qq2 with q2,ss with s,xxl with xl,;
xxb with xb,yek with key
use
store 100 to mcol1
store 100 to mrow1
do he1-56
use fox1-99
store bb1 to b1
store qq2 to q2
store ss to s
store xxl to xl
store xxb to xb
store yek to key
exit

case key=151.and.q2=10.and.(mcol()>8.and.mcol()<20).and.b1=1;
.and.mrow()<=xl+3.and.mrow()>=3
store val(subs(str(mrow(),4,2),1,2))-2 to s
case key=151.and.q2=10.and.(mcol()>18.and.mcol()<30).and.b1=2;
.and.mrow()<=xl+3.and.mrow()>=3
store val(subs(str(mrow(),4,2),1,2))-2 to s
case key=151.and.q2=10.and.(mcol()>28.and.mcol()<40).and.b1=3;
.and.mrow()<=xl+3.and.mrow()>=3
store val(subs(str(mrow(),4,2),1,2))-2 to s
case key=151.and.q2=10.and.(mcol()>38.and.mcol()<50).and.b1=4;
.and.mrow()<=xl+3.and.mrow()>=3
store val(subs(str(mrow(),4,2),1,2))-2 to s
case key=151.and.q2=10.and.(mcol()>48.and.mcol()<60).and.b1=5;
.and.mrow()<=xl+3.and.mrow()>=3
store val(subs(str(mrow(),4,2),1,2))-2 to s
case key=151.and.q2=10.and.(mcol()>58.and.mcol()<70).and.b1=6;
.and.mrow()<=xl+3.and.mrow()>=3
store val(subs(str(mrow(),4,2),1,2))-2 to s
case key=151.and.q2=10.and.(mcol()>70.and.mcol()<77);
.and.mrow()<=xl+3.and.mrow()>=3
store val(subs(str(mrow(),4,2),1,2))-2 to s
endcase
set colo to w+/bg+
do case
case (key=24.and.q2=11).or.(key=151.and.q2=11.and.;
mcol()>b1*10-2.and.mcol()<b1*10+10.and.mrow()>=1.and.mrow()<25)&&µÚÒ»´ÎÏÂÀ­
exit
case (key=24 .and. q2=10 .and. b1<>7);
.or.(key=151.and.mcol()>b1*10-2.and.mcol()<b1*10+10;
.and.q2=10.and.b1<>7.and.mrow()>s.and.mrow()>=1.and.;
mrow()<25)&&¹âÌõÏÂÀ­ºó²Á³ýµ±Ç°¹âÌõ
do case
case key=24
go s
set colo to 7/bg+
@s+2,xb-4 say "   "
set colo to w+/7
@s+2,xb say &ss &&¼üÅÌÏòÏÂ²Áµô¡°ºì¡±
store s+1 to s
case key=151
set colo to 7/bg+
@smrow+2,xb-4 say "   "
set colo to w+/7
@smrow+2,xb say &ss && mouseÏòÏÂ²Áµô¡°ºì¡±
endcase
go s
if s>xl .or. eof()
s=1
exit
endif
case (key=5.and.s>=1 .and. b1<>7).or.;
(key=151.and.s>=1.and.b1<>7.and.mrow()<s;
.and.mcol()>b1*10-2.and.mcol()<b1*10+10.and.;
mrow()<s.and.mrow()>=1.and.mrow()<25)&&¹âÌõÉÏÀ­²Á³ýµ±Ç°¹âÌõ
do case
case key=5.and.s>=1 .and. b1<>7
set colo to 7/bg+
@s+2,xb-4 say "   "
set colo to w+/7
@s+2,xb say &ss &&¼üÅÌÏòÉÏ²Áµô¡°ºì¡±
store s-1 to s
case key=151
set colo to 7/bg+
@smrow+2,xb-4 say "   "
set colo to w+/7
@smrow+2,xb say &ss &&mouseÏòÉÏ²Áµô¡°ºì¡±
endcase
if s>=1
go s
endif
if s=0 .or. eof()
s=1
exit
endif
case key<>24&&.and.
exit
endcase
if key=151
exit    &&*******************
endif
enddo
clear gets
*? mrow(),mcol()
*wait ""
*****
do case
case key=151.and.(mcol1=100.and.mrow1=100)
store 1 to mrow1,mcol1
exit
case key<>151
store b1 to q1
endcase

do case
case key=4.or.;
(key=151.and.mrow()<1.and.mcol()>q1*10.and.mcol()<70)&& ¡ú
if key=4
s=1
b1=b1+1
if b1>7.and.key=4
b1=1
endif
endif

case key=5.or.(key=151.and.mrow()<1;
.and.mcol()>1.and.mcol()<10.and.q2=10) && ¡üµ½µ×·µ»Ø
q2=11

case key=24 .or. (key=13 .and. b1<>7 .and. q2=11);
.or.(key=151.and.mcol()>b1*10-2.and.mcol()<b1*10+10;
.and.q2=11.and.mrow()>25) &&¡ýand »Ø³µ
q2=10

case key=19.or.;
(key=151.and.mrow()<1.and.mcol()<q1*10.and.mcol()<70)&&¡û
if key=19
s=1
b1=b1-1
endif
if b1=0
b1=7
endif

case (key=13.and.q2=10.and.b1<>7).or.;
(key=151.and.mrow()>=3.and.mcol()<70.and.q2=10.and.b1<>7)&&Ö´ÐÐ×Ó³ÌÐò
set colo to r+/b+
@s+2,xb say &ss
set colo to r+/bg+
@s+2,xb-4 say " ¡ï"
do case
case key=13    &&¼üÅÌ¿ØÖÆ
key=key+35+s
case key=151   &&MOUSE¿ØÖÆ
key=48+s
endcase
store str(b1,1) to bx
store "he"+"&bx-"+str(key,2) to ky
if (key>=49 .and. key<=68)
use fox1-99
repl bb1 with b1,qq2 with q2,ss with s,xxl with xl,;
xxb with xb,yek with key
use
do &ky
set clock off
use fox1-99
store bb1 to b1
store qq2 to q2
store ss to s
store xxl to xl
store xxb to xb
store yek to key
exit
endif

case (key=13.and.b1=7).or.(key=151.and.mcol()>70;
.and.mcol()<77.and.mrow()>25.and.mrow()<1)&&»Ø³µ and ÔÚÍË³öÎ»ÖÃ
exit
endcase
set colo to n+/w+
use fox1-99
store "hh"+str(q1,1) to hh
@0.1,q1*10 say &hh && FONT"ËÎÌå",12 colo rgb(0,0,0,,,)&&²Á³ýµ±Ç°²Ëµ¥
*if key=151
store b1 to q1
*endif
enddo

if (key=13.and.b1=7).or.(key=151.and.mcol()>70;
.and.mcol()<77.and.mrow()>25.and.mrow()<1) &&»Ø³µ and ÔÚÍË³öÎ»ÖÃ
exit
endif
enddo
*****
set colo to w/n+
waa=0
wbb=79
do while .t.
@0,waa clear to 27,waa+1
@0,wbb-1 clear to 27,wbb
waa=waa+1
wbb=wbb-1
if waa=40
exit
endif
enddo
clear all
set colo to gr+/n+
clear
ab1="*=*=* »¶Ó­ÄúÔÙ´ÎÊ¹ÓÃ±¾ÏµÍ³ *=*=* "
ab2="      ~~~~~~~~~~~~~~~~~~~~ "
ab3="             ÔÙ  ¼û ! "
ac=79
ad=1
do while ac>22
@10,ac say subs(ab1,1,ad)
@11,ac say subs(ab2,1,ad)
@13,ac say subs(ab3,1,ad)
ac=ac-1
ad=ad+1
enddo
set talk on
return
