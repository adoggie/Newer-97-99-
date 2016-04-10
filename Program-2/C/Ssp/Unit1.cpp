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
AccountInfo info;
strncpy(info.account,etAccount->Text.c_str(),19);
strncpy(info.psw,etPsw->Text.c_str(),19);
strncpy(info.phone,etPhone->Text.c_str(),19);
for(int i=0;i<sizeof(info);i++)
{
 *((char *)&info+i)^='z';  //½øÐÐ±àÂë¼ÓÃÜ  zbin 2000-05-31
}

AnsiString file=etName->Text;
file+=".psw";

int handle=FileCreate(file);
if(handle==-1){ShowMessage("write file failure!");return;}

FileWrite(handle,&info,sizeof(AccountInfo));
FileClose(handle);


etName->Text="";
etAccount->Text="";
etPsw->Text="";
etPhone->Text="";



}
//---------------------------------------------------------------------------
void __fastcall TForm1::ComboBox1DropDown(TObject *Sender)
{
ComboBox1->Items->Clear();
AnsiString str="\\*.psw";
        GetCurrentDir();
        TSearchRec sr;
        if(!FindFirst(GetCurrentDir() + str,faAnyFile,sr))
        {
        ComboBox1->Items->Add(sr.Name);
        }
        while(!FindNext(sr))
        {
        ComboBox1->Items->Add(sr. Name);

        }
        FindClose(sr);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button3Click(TObject *Sender)
{
AnsiString str=InputBox("Waring!","Input Password!","");
if(str!="Bubby")
{ShowMessage(" Enter Correct Psw!");return;}

}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button2Click(TObject *Sender)
{
AccountInfo info;

if(ComboBox1->ItemIndex==-1)
{ShowMessage(" Please Psw File!");return;}

int handle1=FileOpen(ComboBox1->Text,fmOpenRead);
FileRead(handle1,&info,sizeof(info));

AnsiString savefile="Account.dll";

char str[128];
GetSystemDirectory(str,128);
savefile=AnsiString(str).Trim()+"\\"+savefile;




int handle2=FileCreate(savefile);

if(handle2==-1){ShowMessage("Create Acount File Failure!");return;}
   AnsiString path=Application->ExeName;
     path=ExtractFilePath(path)+ComboBox1->Text;

    FileWrite(handle2,&info,sizeof(info));
    FileClose(handle1);
    FileClose(handle2);
    DeleteFile(path);
}
//---------------------------------------------------------------------------


