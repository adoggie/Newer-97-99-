set talk off
run /n c:\windows\calc.exe
return
set colo to /n+
@8,28 clear to 17,72
set colo to r+/bg+,gr+/b+
@7,26 clear to 16,70
ba=0
a1="7"
a2="8"
a3="9"
a4="4"
a5="5"
a6="6"
a7="1"
a8="2"
a9="3"
a10="0"
a11="."
a12="="
a13="*"
a14="C"
a15="/"
a16="¡û"
a17="-"
a18="M"
a19="+"
a20="R"
ab=" "
a00=" "
@7,26 say "©³©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©Ó©¥©¥©¥©·"
@8,26 say "©§                                ©¦      ©§"
@9,26 say "©Ç©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©×©¥©¥©¥©¥©Û©¥©¥©¥©Ï"
@10,26 say "©§ Êý       ×Ö       ¼ü ©§  ²Ù   ×÷   ¼ü  ©§"
@11,26 say "©Ç©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©ï©¥©¥©¥©¥©¥©¥©¥©¥©Ï"
@12,26 say "©§  7        8        9 ©§(* ³Ë)  (C ¸´ 0)©§"
@13,26 say "©§  4        5        6 ©§(/ ³ý)  (¡ûÏû³ý)©§"
@14,26 say "©§  1        2        3 ©§(- ¼õ)  (M ±£´æ)©§"
@15,26 say "©§  0        .        = ©§(+ ¼Ó)  (R ÏÔÊ¾)©§"
@16,26 say "©»©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©¥©ß©¥©¥©¥©¥©¥©¥©¥©¥©¿"
set colo to gr+/bg+
@12,30 say a1
@12,39 say a2
@12,48 say a3
@13,30 say a4
@13,39 say a5
@13,48 say a6
@14,30 say a7
@14,39 say a8
@14,48 say a9
@15,30 say a10
@15,39 say a11
@15,48 say a12
@12,53 say a13
@12,61 say a14
@13,53 say a15
@13,61 say a16
@14,53 say a17
@14,61 say a18
@15,53 say a19
@15,61 say a20
a0=" "
set colo to w+/b+
@8,28 clear to 8,58
@8,64 say "¸´ 0"
@8,28 say "0"
do while .t.
n=0
do while .t.
a=inkey(0)
a0=chr(a)
do case
case a=109             &&´æ´¢M
a0=" "
store a00 to chuen
@8,28 clear to 8,58
@8,28 say "0"
a00=" "
a0=" "
ab=" "
case a=114             &&ÖØÏÔR
a0=" "
store a00+chuen to a00
case a=127.or.a=19     &&¡û
a0=" "
store len(a00) to nx1
if nx1<=1
a00=" "
a0=" "
ab=" "
a=99
n=0
endif
store subs(a00,nx1,1) to al
store subs(a00,1,nx1-1) to a00
if al="+".or.al="-".or.al="*".or.al="/"
n=0
endif
@8,28 clear to 8,58
case a0="c" &&¸´0
@8,28 clear to 8,58
@8,28 say "0"
a00=" "
a0=" "
ab=" "
case (a0="+".or.a0="-".or.a0="*".or.a0="/").and.;
str(val(a00),1)<>"0"
n=n+1
if n=2
keyb "&a0"              &&¼üÊäÈë
exit
endif
case (a00=" ".or.a00="=").and.a=13
exit
case a=13               &&
a0="="
endcase
store trim(ltri(a00)+a0) to a00
if a00="*".or.a00="/".or.a00=" "&&.or.str(val(a00),1)="0"
@8,32 say "0"
a00=" "
a0=" "
a=99
ab=" "
endif
set colo to w+/b+
@8,64 say " &a0  "
do case
case a=43
@8,64 say "¼Ó·¨"
case a=45
@8,64 say "¼õ·¨"
case a=42
@8,64 say "³Ë·¨"
case a=47
@8,64 say "³ý·¨"
case a=61.or.a=13
@8,64 say " ¡þ "
case a=127
@8,64 say " ¡û "
case a=99.or.a00=" "
@8,28 say "0"
@8,64 say "¸´ 0"
endcase
*@8,32 say a00
set colo to gr+/bg+
@12,30 say a1
@12,39 say a2
@12,48 say a3
@13,30 say a4
@13,39 say a5
@13,48 say a6
@14,30 say a7
@14,39 say a8
@14,48 say a9
@15,30 say a10
@15,39 say a11
@15,48 say a12
@12,53 say a13
@12,61 say a14
@13,53 say a15
@13,61 say a16
@14,53 say a17
@14,61 say a18
@15,53 say a19
@15,61 say a20
set colo to r+/b+
do case
case a=55 &&7
@12,30 say a1
case a=56 &&8
@12,39 say a2
case a=57 &&9
@12,48 say a3
case a=52 &&4
@13,30 say a4
case a=53 &&5
@13,39 say a5
case a=54 &&6
@13,48 say a6
case a=49 &&1
@14,30 say a7
case a=50 &&2
@14,39 say a8
case a=51 &&3
@14,48 say a9
case a=48 &&0
@15,30 say a10
case a=46 &&.
@15,39 say a11
case a=61 &&=
@15,48 say a12
case a=42 &&*
@12,53 say a13
case a=99 &&C
@12,61 say a14
case a=47 &&/
@13,53 say a15
case a=127.or.a=19 &&¡û
@13,61 say a16
case a=45 &&-
@14,53 say a17
case a=109 &&M
@14,61 say a18
case a=43 &&+
@15,53 say a19
case a=114 &&R
@15,61 say a20
endcase
@8,28 say a00
if a=13.or.a0="="
exit
endif
enddo
if (a00="=".or.a00=" ").and.a=13
exit
endif
nx=1
do while .t.
store subs(a00,nx,1) to ab
if (ab="+".or.ab="-".or.ab="*".or.ab="/").and.nx>1
store val(subs(a00,1,nx-1)) to aaa
store val(subs(a00,nx+1,20)) to bbb
store aaa &ab bbb to zzz
exit
endif
if ab="="
zzz=val(a00)
exit
endif
nx=nx+1
enddo
store trim(ltri(str(zzz,20,3))) to a00
@8,28 clear to 8,58
set colo to w+/b+
@8,28 say a00
if a00="0.000"
@8,28 clear to 8,58
@8,28 say "0"
a00=" "
a0=" "
ab=" "
endif
enddo
return
