//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "logo.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFormLog *FormLog;
//---------------------------------------------------------------------------
__fastcall TFormLog::TFormLog(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFormLog::Timer1Timer(TObject *Sender)
{
    Close();    
}
//---------------------------------------------------------------------------
