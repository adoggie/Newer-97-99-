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
    TMemoryStream *ms=new TMemoryStream;
    ms->WriteBuffer(Edit1->Text.c_str(),Edit1->Text.Length());
    Client2->RemoteHost=Edit2->Text;
    Client2->SendStream(ms);
    delete ms;
    
}
//---------------------------------------------------------------------------
 