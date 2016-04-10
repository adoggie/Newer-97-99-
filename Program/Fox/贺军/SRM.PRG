set talk off
if subs(mbmxzh,1,8)<>"退休人员"
*store roun((((val(subs(str(year(date()),4),3,2))-myear)+1)*12),2) to ma04
store roun(((ma01+ma04+ma05)*0.005),2) to mb02
store roun((((ma01+ma03+ma04+ma05+ma15-mC01-mC02)-1000)*0.05),2) to mb06 &&个调税
endif
if mb06<0
store 0 to mb06
endif
store ma01+ma02+ma03+ma04+ma05+ma06+ma07+ma08+ma09;
+ma11+ma12+ma13+ma14+ma15+ma16 to sr                           &&收入
store mb01+mb02+mb04+mb05+mb06+mb07+mc01+mc02+mc04+mq01;
+mq02+mq03 to kq                                               &&扣去

*@5.9,48 say str(ma04,8,2) FONT "宋体",12 color rgb(0,0,0,,,)
@10.7,68 say str(mb02,8,2) FONT "宋体",12 color rgb(0,0,0,,,)
@22.5,48 say str(sr,8,2) FONT "宋体",12
@22.5,68 say str(kq,8,2) FONT "宋体",12
@13.1,68 say str(mb06,8,2) FONT "宋体",12
store sr-kq to sf                                              &&实发
@13,14 say str(sf,8,2) FONT "宋体",12
return
