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

void __fastcall TForm1::btOpenFileClick(TObject *Sender)
{
OpenDialog->Title="选择切割文件";
if(!OpenDialog->Execute())
return;
etFileName->Text=OpenDialog->FileName;


}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
zbin.SetWindowTopMost(this->Handle);
cmbSizeType->ItemIndex=1;

}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormShow(TObject *Sender)
{
//ModifyStyle(
 zbin.DisableMaxButton(this->Handle);
}
//---------------------------------------------------------------------------




void __fastcall TForm1::btAddFilesClick(TObject *Sender)
{
OpenDialog->Title="选择要合并的文件，注意文件的合并顺序！";
OpenDialog->Options<<ofAllowMultiSelect;

if(!OpenDialog->Execute())
return;
for(int i=0;i<OpenDialog->Files->Count;i++)
{
 lbFiles->Items->Add(OpenDialog->Files->Strings[i]);

}

}
//---------------------------------------------------------------------------


void __fastcall TForm1::btSplitClick(TObject *Sender)
{
sp *spFile=new sp(etFileName->Text,etSize->Text,cmbSizeType,StepBar);
spFile->RunSp();

}
//---------------------------------------------------------------------------


void __fastcall TForm1::lbFilesKeyDown(TObject *Sender, WORD &Key,
      TShiftState Shift)
{
 if(Key==VK_DELETE)
 {
 lbFiles->Items->Delete(lbFiles->ItemIndex);
 }
 if(Key==VK_F6  )
 btDownClick(NULL);
 if(Key==VK_F5)
 btUpClick(NULL);
 if(Key==VK_F7)
 lbFiles->Items->Clear();
 }
//---------------------------------------------------------------------------

void __fastcall TForm1::btUpClick(TObject *Sender)
{
//ShowMessage(lbFiles->ItemIndex);
if(lbFiles->ItemIndex==-1) return;
int index=lbFiles->ItemIndex;
if(lbFiles->ItemIndex!=0)
{
lbFiles->Items->Move(index-1,index);
lbFiles->ItemIndex=index-1;
}
}
//---------------------------------------------------------------------------

void __fastcall TForm1::btDownClick(TObject *Sender)
{
if(lbFiles->ItemIndex==-1) return;
int index=lbFiles->ItemIndex;
if(lbFiles->ItemIndex!=lbFiles->Items->Count-1)
{
lbFiles->Items->Move(index+1,index);
lbFiles->ItemIndex=index+1;
}

}
//---------------------------------------------------------------------------


void __fastcall TForm1::btCombineClick(TObject *Sender)
{

if(lbFiles->Items->Count<2)
{ShowMessage("请添加合并文件！");
return;}

if(!SaveDialog1->Execute())
return;
 SendMessage(Handle,WM_PAINT,0,0);
sp *spFile=new sp(SaveDialog1->FileName,lbFiles,StepBar);
spFile->RunCombine();


}
//---------------------------------------------------------------------------

void __fastcall TForm1::etFileNameMouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
//ShowHit

}
//---------------------------------------------------------------------------

void __fastcall TForm1::btFileInfoClick(TObject *Sender)
{
if(Trim(etFileName->Text)=="")
{return;}
 FileInfo *f=new FileInfo(etFileName->Text);
 ShowMessage("文件大小:" + AnsiString(f->sizeByte) +AnsiString("字节"));
 delete f;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Label5MouseMove(TObject *Sender, TShiftState Shift,
      int X, int Y)
{
Timer1->Enabled=true;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Timer1Timer(TObject *Sender)
{
POINT pt;
GetCursorPos(&pt);
RECT rc;
GetWindowRect( Label5->Handle,&rc);
if(PtInRect(&rc,pt))
{
Label5->Font->Color=clRed;

}
else
{Label5->Font->Color=clBlack;
Timer1->Enabled=false;
}
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Label5Click(TObject *Sender)
{
 Form2->ShowModal();

}
//---------------------------------------------------------------------------

