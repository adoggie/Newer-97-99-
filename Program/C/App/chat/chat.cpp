//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "chat.h"
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
//if(!OpenDialog1->Execute())
//return;
//int handle=FileOpen(*(OpenDialog1->FileName),fmOpenRead);
TStringList *str=new TStringList;

str->LoadFromFile("chat.txt");
for(int i=0;i<str->Count;i++)
{
 if(str->Strings[i].AnsiPos("´óÍ·")!=0)
 ListBox1->Items->Add(str->Strings[i]);
}        
}
//---------------------------------------------------------------------------
 