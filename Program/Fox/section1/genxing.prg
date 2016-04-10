 
 set talk off
sele 2
 
 *tmpfile="tmp"
 *copy to &tmpfile
 *dele file &m
 *use &tmpfile
 for i=1 to 12
  n=allt("zg"+allt(str(i)))
  copy to &n
  endfor
  