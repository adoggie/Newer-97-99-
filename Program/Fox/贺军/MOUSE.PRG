do while .t.
clear
a=inkey(0,"m")
? a,mrow(),mcol()
wait ""
if mrow()=0
exit
endif
enddo
