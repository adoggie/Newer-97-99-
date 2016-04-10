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

try{
dt=StrToTime(Edit1->Text);
}
catch(/*EConvertError &e*/...)
{
ShowMessage("error"/*e.Message)*/);
return;
}

ProgressBar1->Min=0;

ProgressBar1->Step=1;
ProgressBar1->Position=0;


unsigned short hour,minute,second,mm;
TDateTime tmp=Now();
 tmp.DecodeTime(&hour,&minute,&second,&mm);
int  begin=hour*60*60+minute*60+second;
  dt.DecodeTime(&hour,&minute,&second,&mm);
 int end=hour*60*60+minute*60+second;
 int pass;
 if( end<begin)
  pass=60*60*12-begin+end;
else
pass=end-begin;

ProgressBar1->Max=pass;

Timer1->Enabled=true;

}
//---------------------------------------------------------------------------

void __fastcall TForm1::Timer1Timer(TObject *Sender)
{
 
ProgressBar1->StepIt();
if(ProgressBar1->Position==ProgressBar1->Max)
{
 Timer1->Enabled=false;
try{
WinExec(Edit2->Text.c_str(),SW_SHOWNORMAL);
}
catch(...)
{
 ShowMessage("²ÎÊý´íÎó£¡");
}
ProgressBar1->Position=0;
 
}
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Timer2Timer(TObject *Sender)
{
TDateTime d=Now();
unsigned short h,m,s,mm;
d.DecodeTime(&h,&m,&s,&mm);
StaticText1->Caption=AnsiString(h)+":"+AnsiString(m)+":"+AnsiString(s);

}
//---------------------------------------------------------------------------
