-----------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "Unit3.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Unit2"
#pragma resource "*.dfm"
TFormLog *FormLog;
//---------------------------------------------------------------------------
__fastcall TFormLog::TFormLog(TComponent* Owner)
    : TForm1(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFormLog::Timer1Timer(TObject *Sender)
{
	Close();
}
//---------------------------------------------------------------------------

