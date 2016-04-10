 本人非常热衷于ASM 编程，近日写了一个锁硬盘的小程序HDD3.EXE
通过接管INT 13H 使软盘无法启动访问硬盘。同时，提示信息显示中文。
谨供参考。
 其使用方法：（只可在纯DOS下执行，不可在WINDOWS的DOS环境下执行）
   HDD3.EXE 回车  ：显示HDD3.EXE的使用方法
   HDD3.EXE #i 回车 :安装硬盘锁 其缺省密码为pig
   HDD3.EXE #u 回车 :卸载硬盘锁
   HDD3.EXE #pxxxx 回车 :更改密码值  xxxx 为新的密码
（注：#i #u #p  为关键字 密码最多为10个字苻）   
  列：
     hdd3.exe #p123456789     将启动密码更改为123456789
 
 ；******************************
二：
  TSR 时钟程序 clock.com
   在DOS下输入
        clock 回车  在屏幕右上角显示时间和作者名，同时颜色变化
        clock uninstall  回车  卸载时钟

三：
   两只老虎的乐曲程序
   SOUND。EXE     在DOS下执行
					


					ZBin  张 斌       98.10.10
			     上海市经济管理学院  96'  信息二班	
			e-mail: zbpost@371.net         	