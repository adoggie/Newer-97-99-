//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "User.h"
#include "Control.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFormUserInfo *FormUserInfo;
//---------------------------------------------------------------------------
__fastcall TFormUserInfo::TFormUserInfo(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFormUserInfo::FormShow(TObject *Sender)
{
    try{
        cds->FileName=ExtractFilePath(Application->ExeName)+"User.cds";
        cds->ReadOnly=false;
        cds->Open();

        }
    catch(...)
    {
        //ShowMessage('用户信息文件不存在！');
    }
}
//---------------------------------------------------------------------------

void __fastcall TFormUserInfo::btnOkClick(TObject *Sender)
{
    //cds->ApplyUpdates(-1);
    cds->Close();
    FormMain->AddList();
    Close();
}
//---------------------------------------------------------------------------

void __fastcall TFormUserInfo::btnCancelClick(TObject *Sender)
{
    Close();    
}
//---------------------------------------------------------------------------


