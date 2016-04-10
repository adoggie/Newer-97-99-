//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "Unit3.h"
#include "printers.hpp"

//---------------------------------------------------------------------------
#pragma package(smart_init)

#pragma resource "*.dfm"
TForm3 *Form3;

 
//---------------------------------------------------------------------------
__fastcall TForm3::TForm3(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------







void __fastcall TForm3::cmbPrintSelectDropDown(TObject *Sender)
{
 cmbPrintSelect->Items->Clear();
 if(PrintSetup->Execute()==false)
 {
   return;
 }
 cmbPrintSelect->Items->Add(Printer()->Printers->Strings[Printer()->PrinterIndex]);
 cmbPrintSelect->ItemIndex=0;

 }
//---------------------------------------------------------------------------

void __fastcall TForm3::btPrintClick(TObject *Sender)
{
if(  cmbPrintSelect->ItemIndex==-1)
{ShowMessage("No Printer Select ! Try it!");
return;}


//info->nPrinter=cmbPrintSelect->ItemIndex;
//info->Paper=(PRINTPAPER)cmbPaperSelect->ItemIndex;


Info.gqVisible= ckGq->Checked;
Info.zgqHasNumber=ckNumber->Checked;
Info.bzVisible=ckGcbz->Checked;
Info.ByStringWidth=ckWidthByString->Checked;
Info.EmptyTable=ckEmptyTable->Checked;
Info.ProgressBarTopLine=ckBarLine->Checked;
try{
Info.ColsEmptyTable=etCols->Text.ToInt();
Info.DaysEveryRect=etDays->Text.ToInt();
Info.DaysSeperateLine=etFlagDays->Text.ToInt();
Info.Copy=Edit1->Text.ToInt();
Info.ColsEmptyTable=etCols->Text.ToInt()+4;
}
catch(...)
{
ShowMessage("输入数据有错误！请检查！ ");
Application->Terminate();
return;
}

Visible=false;
Close();
}
//---------------------------------------------------------------------------


void __fastcall TForm3::FormShow(TObject *Sender)
{
cmbPrintSelect->ItemIndex=-1;
cmbPaperSelect->ItemIndex=2;
Visible=true;
}
//---------------------------------------------------------------------------



void __fastcall TForm3::ckEmptyTableClick(TObject *Sender)
{


 etCols->Enabled=ckEmptyTable->Checked;


}
//---------------------------------------------------------------------------



void __fastcall TForm3::FormCreate(TObject *Sender)
{
RECT rc;
RECT desktoprc;
int x=GetSystemMetrics(SM_CXSCREEN);
int y=GetSystemMetrics(SM_CYSCREEN);

GetWindowRect(this->Handle,&rc);
TRect m_rc(rc);

SetWindowPos(this->Handle,HWND_NOTOPMOST,(x-m_rc.Width())/2,(y-m_rc.Height())/2,
                                        this->Width,
                                      this->Height,SWP_NOREDRAW	);
                                               
}
//---------------------------------------------------------------------------

