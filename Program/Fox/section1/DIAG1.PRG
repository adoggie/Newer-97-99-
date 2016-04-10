********pass gong hao***********

clea all
clea
number=10
defi window win1 from 1,1 to 9,20  double title "password:" 
move window  win1  center

acti wind win1
set color to b/w
clea
@0,0 to 0,scols() pen 2,8 color rgb(255,255,255,255,255,255)
@0,0 to srows(),0 pen 2,8 color rgb (255,255,255,0,0,0)
@1.6,0 to 1.6,scols() pen 2,8 color rgb (0,0,0,0,0,0)
&&@srows()-0.2,0 to srows()-0.2,scols()-0.2 pen 2,8 color rgb(0,0,0,0,0,0)
@1.8,0 to 1.8,scols() pen 2,8 color rgb (255,255,255,0,0,0)
@3,1 say "  ‰»Î±‡∫≈ :" color  rgb(0,0,0,255,255,255) size 1.4,10


@5.2,1 get number spin 1,0,1000 pict "@kitb" size 1.2,6

@5,10 get  n defa 0 pict"@*h »∑∂®"  size 1.5,7
read  
if number<>1234

 clea 
 @2,2 say " √‹¬Î¥ÌŒÛ!" font "arial",14 style "b" color rgb(255,0,0,192,192,192)
 wait
 do exit
 endif
deac window all
relea window all


