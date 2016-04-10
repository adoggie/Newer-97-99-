on error
**on error do command



public flag
flag=0
do while .t.
 store space(58) to string
 acti window main
@srows()-2,22 say  ".." color rgb(0,255,0,,,) font "arial",12

@srows()-2,26 get string  color ,rgb(255,0,0,255,255,255) font "arial",12  style "b"
read 

long=len(allt(string))
** st="modi comm "+allt(string)
 if long=0
 exit
endif


&string

enddo
acti window main
sd=space(64)
@srows()-2,22 get sd color ,3/3 font "arial",12 style "b"
clea get 

 on error



RETURN