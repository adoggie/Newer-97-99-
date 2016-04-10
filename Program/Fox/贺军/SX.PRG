set talk off
set colo to gr/b
aoa1=0
bob1=80
coc1=0
dod1=26
do while .t.
@0,0 clear to 23,aoa1+1
@0,bob1-1 clear to 26,80
@0,0 clear to coc1+1,79
@dod1-1,0 clear to 27.8,80
*do mma
aoa1=aoa1+4
bob1=bob1-4
coc1=coc1+1
dod1=dod1-1
if coc1>10
exit
endif
enddo
