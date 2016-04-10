move window  m2 to 0.5,scols()
i=xx
acti window m2
clea 
&&?wrow()
&&?wcols()

col1=wcols( )
row1=wrow( )

@0.2,0.2 to row1-0.2,0.2 pen 2,8 color rgb(50,50,50,,,)
  @row1-0.2 ,0.2 to row1-0.2,col1-0.2 pen 2,8 color rgb(230,230,230,,,)    
@0.1 ,0.2 to 0.1 ,col1 pen 2,8 color rgb(50,50,50,,,)

@0.1,col1-0.2 to row1-0.2,col1-0.2 pen 2,8 color rgb(250,250,250,,,)












do while .t.
 if i>=21
  i=i-1
  
 move    window m2 to 0.5,i
  
else
    exit
   endif
  enddo
acti wind main
@srow()-3.5 ,22 to srow()-3.5,scols() pen 6,8  color rgb(30,30,30,,,)
** the line use for 装 阴影线

acti window main
 @srow()-3.5 ,22 to srow()-3.5,scols() pen 6,8  color rgb(11,87,117,,,)
 &&修复窗口window main 的下划线



