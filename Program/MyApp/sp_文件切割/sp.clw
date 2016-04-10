; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CSpDlg
LastTemplate=CDialog
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "sp.h"

ClassCount=3
Class1=CSpApp
Class2=CSpDlg

ResourceCount=3
Resource1=IDR_MAINFRAME
Class3=Combin
Resource2=IDD_SP_DIALOG
Resource3=IDD_DIALOG1

[CLS:CSpApp]
Type=0
HeaderFile=sp.h
ImplementationFile=sp.cpp
Filter=N

[CLS:CSpDlg]
Type=0
HeaderFile=spDlg.h
ImplementationFile=spDlg.cpp
Filter=D
BaseClass=CDialog
VirtualFilter=dWC
LastObject=CSpDlg



[DLG:IDD_SP_DIALOG]
Type=1
Class=CSpDlg
ControlCount=13
Control1=IDC_EDIT1,edit,1350633608
Control2=IDC_BUTTON1,button,1342275584
Control3=IDC_BUTTON2,button,1342275584
Control4=IDC_STATIC,static,1342308352
Control5=IDC_BUTTON3,button,1342275584
Control6=IDC_RADIO1,button,1342341129
Control7=IDC_RADIO2,button,1342210057
Control8=IDC_RADIO3,button,1342210057
Control9=IDC_STATIC,button,1342177287
Control10=IDC_EDIT2,edit,1350639616
Control11=IDC_STATIC,static,1342308352
Control12=IDC_BUTTON4,button,1342275584
Control13=IDC_BUTTON5,button,1073807360

[CLS:Combin]
Type=0
HeaderFile=ombin.h
ImplementationFile=ombin.cpp
BaseClass=CDialog
Filter=D
VirtualFilter=dWC
LastObject=Combin

[DLG:IDD_DIALOG1]
Type=1
Class=?
ControlCount=6
Control1=IDC_FILES,listbox,1344340225
Control2=IDC_COMBIN,button,1342275584
Control3=IDC_UP,button,1342275584
Control4=IDC_DOWN,button,1342275584
Control5=IDC_DELETE,button,1342275584
Control6=IDC_APPEND,button,1342275585

