//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
#include "dir.cpp"

TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
    : TForm(Owner)
{
    pList=0;
    pList=new TStringList;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::BitBtn1Click(TObject *Sender)
{
    ListBox1->Items->Clear();
    Memo1->Lines->Clear();

    AnsiString path;
    if( Edit2->Text.Trim()=="")
        path=GetCurrentDir();
    else
        path=Edit2->Text.Trim();

 
    if(GetFileList(pList,path, cbType->Text.Trim())==false)  return;

    if(CheckBox1->State==cbChecked)
        pList->Sort();

   TStringList *pTmp=new TStringList;
   for(int i=0;i<pList->Count;i++)
   {
       pTmp->Clear();
       try{
       pTmp->LoadFromFile(pList->Strings[i]);
       if(pTmp->Count!=0)
       {
       if(CheckBox2->State==cbUnchecked)
       ListBox1->Items->Add(  AnsiString(pTmp->Strings[0].Trim()+"        [ "+ExtractFileName(pList->Strings[i])+" ] \t").Trim());
       else
        ListBox1->Items->Add(  AnsiString(" ["+ExtractFileName(pList->Strings[i])+" ] \t").Trim());
       }      }
       catch(...){
       ListBox1->Items->Add(  AnsiString(" ["+ExtractFileName(pList->Strings[i])+" ] \t").Trim());
       continue;}
   }
   delete pTmp;
  // ListBox1->Items->Assign(pList);


}
//---------------------------------------------------------------------------


__fastcall TForm1::~TForm1()
{
    if(  pList==0) return;
    delete pList;
}
void __fastcall TForm1::BitBtn2Click(TObject *Sender)
{
    if(!dlgOpen->Execute()) return;
    {
     Edit2->Text=ExtractFilePath(dlgOpen->FileName);
     BitBtn1Click(NULL);
    }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::ListBox1Click(TObject *Sender)
{
    int SelIndex=ListBox1->ItemIndex;
    try{
    Memo1->Lines->LoadFromFile(pList->Strings[SelIndex]);
    }
    catch(...){
    Memo1->Lines->Clear();
    }
    btnSave->Enabled=true;

}
//---------------------------------------------------------------------------
void __fastcall TForm1::Action1Execute(TObject *Sender)
{
//
}
//---------------------------------------------------------------------------
void __fastcall TForm1::btnSaveClick(TObject *Sender)
{
    int SelIndex=ListBox1->ItemIndex;
   Memo1->Lines->SaveToFile( pList->Strings[SelIndex]);
   
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormShow(TObject *Sender)
{
    cbType->ItemIndex=0;
    Memo1->Lines->Clear();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::cbTypeChange(TObject *Sender)
{
    if(Edit2->Text.Trim()=="")   return;
    BitBtn1Click(0);
    
}
//---------------------------------------------------------------------------

void __fastcall TForm1::CheckBox1Click(TObject *Sender)
{
    if(Edit2->Text.Trim()=="")   return;
    BitBtn1Click(0);

}
//---------------------------------------------------------------------------

void __fastcall TForm1::CheckBox2Click(TObject *Sender)
{
    if(Edit2->Text.Trim()=="")   return;
    BitBtn1Click(0);

}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button1Click(TObject *Sender)
{
  AnsiString strFile=InputBox ("New File","new","default");
  try{
  FileCreate(Edit2->Text.Trim()+strFile+ExtractFileExt(cbType->Text));
  }
  catch(...){}
  if(Edit2->Text.Trim()=="")   return;
  BitBtn1Click(0);
}
//---------------------------------------------------------------------------

