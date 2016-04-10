//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "connect.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFormConnect *FormConnect;
//---------------------------------------------------------------------------
#include "sysdm.h"
#include "define.cpp"
__fastcall TFormConnect::TFormConnect(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TFormConnect::FormShow(TObject *Sender)
{
    Memo1->Lines->Clear();
    edtRemoteHost->Text="";

}
//---------------------------------------------------------------------------
void __fastcall TFormConnect::btnConnectClick(TObject *Sender)
{

    TMemoryStream *ms=new TMemoryStream;
    AnsiString strMsg = AnsiString( CONNECT_TEST_VALUE );
    ms->WriteBuffer(strMsg.c_str(),strMsg.Length());
    DM->Master->RemoteHost = edtRemoteHost->Text.Trim();
    DM->Master->SendStream(ms);
    delete ms;

}
//---------------------------------------------------------------------------

void __fastcall TFormConnect::FormKeyDown(TObject *Sender, WORD &Key,
      TShiftState Shift)
{
    if(Key == VK_RETURN)
    {
        SelectNext(ActiveControl,true,true);
    }
    
}
//---------------------------------------------------------------------------

