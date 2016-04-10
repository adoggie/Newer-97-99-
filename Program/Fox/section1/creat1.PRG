  sele 10
  use zg
  &&month=allt(str(month(date())))
 && month="zg"+month
  for i=1 to 12
  month=allt("zg"+allt(str(i)))
  copy to &month
  endfor
  use
  
  