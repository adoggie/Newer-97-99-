set cursor off
cancelcode=0
gh2=0
xingming=space(8)
if locatecode=1
do search1
if cancelcode=1
return
endif
else
do search2
if cancelcode=1
return
endif
endif
do cexist
set cursor on