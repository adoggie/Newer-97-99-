on key
y=scols()
y2=int(y/2)-8
*defin window end from 1,1 to 10,20 double title "-- Ð» Ð» --"
for i=0 to scols() step 2
move window main to 0,i
endfor
deac window main
*move window end to 10,y
*acti window end
*set color to /w
*clea 
*@4 ,2 say "ÔÙ¼û.." font "arial",14 style "b" color rgb(255,0,0,,,)
*do while .t.
*if y2=y
*exit 
*endif
*y=y-1
*move window end to 12,y
*enddo
*wait
deac popu all
relea popu all
deac window all
relea window all
clea all
set sysmenu to defa
modi window screen
set color to
set esca off
set clock  off
clea
return