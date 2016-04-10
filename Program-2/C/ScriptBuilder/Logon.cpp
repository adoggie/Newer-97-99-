//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Logon.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFormLogon *FormLogon;
//---------------------------------------------------------------------------
__fastcall TFormLogon::TFormLogon(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------


bool TFormLogon::GetParams(TStrings * Params)
{
    //
    Params->Clear();
    Params->Add("USER NAME=" +edtUser->Text);
    Params->Add("PASSWORD="+edtPassword->Text);
    return true;
}

void __fastcall TFormLogon::Button1Click(TObject *Sender)
{
//ShowMessage("ok");
}
//---------------------------------------------------------------------------

