//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
//strList=new TStringList();

}
//---------------------------------------------------------------------------

bool CALLBACK myproc(HWND hwnd,LPARAM lparam)
{
 char str[100];
 //TStringList * strList=(TStringList *)lparam;
 GetWindowText(hwnd,str,100) ;
 //((TListBox *)lparam)->Items->Add(AnsiString(str));
 AnsiString s(str);
 s.Trim();
 if(s=="Callus95")
 {

 SetWindowPos(Form1->Handle,HWND_TOPMOST,0,0,500,600,SWP_SHOWWINDOW);

 //ShowMessage("no runv");
 // SendMessage(hwnd,WM_CLOSE,0,0);
  }
 return true;
}
void __fastcall TForm1::Timer1Timer(TObject *Sender)
{
//strList=new TStringList();

EnumWindows((WNDENUMPROC)myproc,(LPARAM)Timer1);

//delete strList;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button1Click(TObject *Sender)
{
//Timer1->Enabled=false;
//ListBox1->Items=strList;
Timer1->Enabled=false;
Timer2->Enabled=true;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button2Click(TObject *Sender)
{
ShowMessage("»Ø´ð´íÎó£¡");

}
//---------------------------------------------------------------------------
void __fastcall TForm1::Timer2Timer(TObject *Sender)
{
HWND hwnd=FindWindow(0,"Callus95");
 if(!hwnd)
 {
  Timer2->Enabled=false;
  Timer1->Enabled=true;

 }
}
//---------------------------------------------------------------------------
