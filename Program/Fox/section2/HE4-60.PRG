set talk off
do mm

MODIFY REPORT he5-53.frx
REPORT FORMAT c:\xsk\he5-53.frx ENVIRONMENT PREVIEW
report form he5-53.frx noeject ENVIRONMENT noconsole to print for he0<>"        "
return


*use &gg-2 inde sy1
*sum t6,t8,t12,t13 to ok6,ok8,ok12,ok13
*@x+2,48 say "数    量:"+str(ok6,10,3)
*@x+3,48 say "总    价:"+str(ok8,10,2)
*@x+5,48 say "库存数量:"+str(ok12,12,3)
*@x+6,48 say "库存金额:"+str(ok13,12,2)
*@x+7,40 say "       "
*set cons on
*do mm
*return

