set talk off
wbb=55
do while .t.
set colo to w+/b+
@7,wbb-1 clear to 15,wbb
xn=0
do while xn<=100
xn=xn+1
enddo
wbb=wbb-2
if wbb<=22
exit
endif
enddo
return
