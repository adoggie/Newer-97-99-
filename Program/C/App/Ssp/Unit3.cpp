//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "Unit3.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm2 *Form2;
//---------------------------------------------------------------------------
__fastcall TForm2::TForm2(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TForm2::Button1Click(TObject *Sender)
{
  AnsiString savefile="Account.dll";
  char str[128];
GetSystemDirectory(str,128);
savefile=AnsiString(str).Trim()+"\\"+savefile;

if(!FileExists(savefile))
{
  ShowMessage("本计算机无密码帐号可用！"); Application->Terminate();}

AccountInfo info;

 int handle=FileOpen(savefile,fmOpenRead) ;
   if(handle==-1)
   { ShowMessage("Open Account File Failure!");return;}

   FileSeek(handle,0,0);
 
   FileRead(handle,&info,sizeof(info)) ;

  FileClose(handle);
   for(int i=0;i<sizeof(info);i++)
{
 *((char *)&info+i)^='z';  //进行编码加密  zbin 2000-05-31
}

//===================================
//===================================

AnsiString Account=info.account;
AnsiString Psw=info.psw;
AnsiString Phone=info.phone;

HWND hwnd=FindWindow(0,"连接到");
if(!hwnd)
{ShowMessage("请启动拨号连接程序!");return;}

HWND h1;
h1=GetWindow(hwnd,GW_CHILD);
int style;
int inc=0;
while(h1)
{
 style=GetWindowLong(h1,GWL_STYLE);
 if( style==0x50010080)
 { ++inc;
 
 BringWindowToTop(hwnd);
 if(inc==1)
 {
  SendMessage(h1,EM_SETPASSWORDCHAR,'@',0);
  BringWindowToTop(hwnd);
 SendMessage(h1,WM_SETTEXT,0,(long)Account.c_str());}
 else
 SendMessage(h1,WM_SETTEXT,0,(long)Phone.c_str());
 }

   if( style==0x500100a0)
  {
   SendMessage(h1,WM_SETTEXT,0,(long)Psw.c_str());

  }


 h1=GetWindow(h1,GW_HWNDNEXT);


}


}
//---------------------------------------------------------------------------
void __fastcall TForm2::SpeedButton1Click(TObject *Sender)
{
AnsiString str=InputBox("Waring!","Password","");
if(str!="lost1976")
{
ShowMessage("You Have No Limit!");return; }

Form1->ShowModal();
}
//---------------------------------------------------------------------------
