//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Child.h"
#include "Main.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFormChild *FormChild;
//---------------------------------------------------------------------------
__fastcall TFormChild::TFormChild(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFormChild::FormClose(TObject *Sender,
      TCloseAction &Action)
{
	Action=caFree;
    FormMain->DelChildForm(this);
    FormMain->SetDelFormChild(this);
    if(FormMain->MDIChildCount==1)
    {
        FormMain->SetDelFormChild(NULL);
        FormMain->cbFileList->Items->Clear();

    }
     FormMain->btnSave->Enabled=false;
}
//---------------------------------------------------------------------------
void __fastcall TFormChild::ItemNewClick(TObject *Sender)
{
	FormMain->ItemNewClick(NULL);
}
//---------------------------------------------------------------------------
void __fastcall TFormChild::FormCreate(TObject *Sender)
{
    strProjectName="";
    strFileName="";
    bCloseAll=false;
    UpdateInfo();
}
//------------------------------------------------------------------------------------
void TFormChild::UpdateInfo()  //���µ�ǰ�����ļ����� & �ı䵱ǰ�����ļ��б��ڴ���ɵ��е���ʾ
{
	if(strFileName=="")
		this->Caption=AnsiString("�¹��� ")+ AnsiString(FormMain->MDIChildCount);
    else
		this->Caption=strFileName;
    FormMain->SetWindowList(this); //���òʵ�
}
//---------------------------------------------------------------------------
void __fastcall TFormChild::ItemCloseClick(TObject *Sender)
{
	Close();
}
//---------------------------------------------------------------------------
void __fastcall TFormChild::ItemCloseAllClick(TObject *Sender)
{
	FormMain->CloseAll();
    bCloseAll=true;
}
//---------------------------------------------------------------------------
void __fastcall TFormChild::ItemOpenClick(TObject *Sender)
{
	FormMain->ItemOpenClick(NULL);
}
//---------------------------------------------------------------------------
void TFormChild::LoadInfo(void)
{

}
//------------------------------------------------------------------------------------
void __fastcall TFormChild::FormActivate(TObject *Sender)
{
    FormMain->btnSave->Enabled=!bCloseAll;
    bCloseAll=!bCloseAll;
    FormMain->SetWindowList(this);
}
//---------------------------------------------------------------------------
void TFormChild::OnWindow(TMessage & msg)
{
//

}
//------------------------------------------------------------------------------------
void TFormChild::SetWindowList()
{
}
//------------------------------------------------------------------------------



