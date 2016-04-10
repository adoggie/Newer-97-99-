//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop


#include "Control.h"
#include "connect.h"
#include "sysdm.h"
#include "define.cpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFormMain *FormMain;
//---------------------------------------------------------------------------
__fastcall TFormMain::TFormMain(TComponent* Owner)
    : TForm(Owner)
{
    RemoteHost="";

}
//---------------------------------------------------------------------------




void TFormMain::ShowRemoteHost(void)
{
    StatusBar1->Panels->Items[0]->Text=RemoteHost;
}

//------------------------------------------------------------------------------

void __fastcall TFormMain::edtMsgKeyDown(TObject *Sender, WORD &Key,
      TShiftState Shift)
{
    /* 发送消息条到客户机器上，弹出消息框 */
    if(Key == VK_RETURN &&RemoteHost=="")
   {
        ShowMessage("no host found!");
        return;
   }

    if(Key == VK_RETURN && RemoteHost!="")
    {
    DM->SendString( edtMsg->Text.c_str(),RemoteHost);
    return;
    }
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::btnSendMsgClick(TObject *Sender)
{
    DM->SendString(AnsiString(PROMPT),RemoteHost); //远程机上弹出对话框
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::N4Click(TObject *Sender)
{
    FormConnect=new TFormConnect(this);
    FormConnect->ShowModal();

}
//---------------------------------------------------------------------------


void __fastcall TFormMain::FormKeyDown(TObject *Sender, WORD &Key,
      TShiftState Shift)
{
    if(Key == VK_RETURN)
    {
        SelectNext(ActiveControl,true,true);
    }
}
//---------------------------------------------------------------------------






void __fastcall TFormMain::BitBtn1Click(TObject *Sender)
{
    DM->SendString(AnsiString(SHUTDOWN),RemoteHost);
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::BitBtn2Click(TObject *Sender)
{
    DM->SendString(AnsiString(REBOOT),RemoteHost);
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::BitBtn3Click(TObject *Sender)
{
    DM->SendString(AnsiString(DISABLE_SYSTEM_KEY),RemoteHost);
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::BitBtn7Click(TObject *Sender)
{
    DM->SendString(AnsiString(LOCKSCREEN),RemoteHost);
    BitBtn9->Enabled=true;
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::BitBtn4Click(TObject *Sender)
{
    DM->SendString(AnsiString( CLOSEWINDOW),RemoteHost);
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::BitBtn5Click(TObject *Sender)
{
    DM->SendString(AnsiString(CLIENTDRAW0),RemoteHost);
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::BitBtn6Click(TObject *Sender)
{
    DM->SendString(AnsiString(CLIENTVALID),RemoteHost);
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::BitBtn8Click(TObject *Sender)
{
    DM->SendString(AnsiString(UNLOCKSCREEN),RemoteHost);
    BitBtn9->Enabled=false;
}
//---------------------------------------------------------------------------


void __fastcall TFormMain::BitBtn9Click(TObject *Sender)
{
    DM->SendString(AnsiString(LOCKSCREENSTRING),RemoteHost);
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::BitBtn10Click(TObject *Sender)
{
  DM->SendString(AnsiString(ENABLE_SYSTEM_KEY),RemoteHost);
}
//---------------------------------------------------------------------------



void __fastcall TFormMain::BitBtn12Click(TObject *Sender)
{
    DM->SendString(AnsiString(CLIENTCLOSE),RemoteHost);
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::BitBtn11Click(TObject *Sender)
{
   DM->SendString(AnsiString(RUNEXE),RemoteHost);
}
//---------------------------------------------------------------------------

