//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "OptSetting.h"
#include "Control.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFormSetting *FormSetting;
//---------------------------------------------------------------------------
__fastcall TFormSetting::TFormSetting(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFormSetting::BitBtn1Click(TObject *Sender)
{
    FormMain->bSetTopMostByMsg=   cbxSetTopByMsg->Checked;
    FormMain->bShowOnlineUser=    cbxShowOnlineUser->Checked;
    FormMain->bSetTopMost=        cbxSetTop->Checked;
    FormMain->bShowMore=          cbxShowMore->Checked;
    FormMain->bMsgBeep=           cbxBeep->Checked;
    Close();
}
//---------------------------------------------------------------------------

void __fastcall TFormSetting::FormShow(TObject *Sender)
{
    cbxSetTopByMsg->Checked=FormMain->bSetTopMostByMsg;
    cbxShowOnlineUser->Checked=FormMain->bShowOnlineUser    ;
    cbxSetTop->Checked=FormMain->bSetTopMost;
    cbxShowMore->Checked=FormMain->bShowMore;
    cbxBeep->Checked=FormMain->bMsgBeep;

}
//---------------------------------------------------------------------------

