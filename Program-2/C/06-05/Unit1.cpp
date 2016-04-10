//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
#include "Window.h"
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

 AnsiString strFind=ListBox1->Items->Strings[ListBox1->ItemIndex];

 HWND Handle=FindWindow(0,strFind.Trim().c_str());

	if(!Handle) {ShowMessage("not find!"); return;}
    HWND Me=Handle;
    OpenIcon(Me);
  	RECT rc;
	GetWindowRect(Me,&rc);
	SetWindowPos(Me,HWND_TOPMOST,rc.left,rc.top,rc.right-rc.left,rc.bottom-rc.top,SWP_SHOWWINDOW);
}


//---------------------------------------------------------------------------



BOOL CALLBACK MyBackProc( HWND hwnd,long lparam)
{
    char strTitle[125];
    GetWindowText(hwnd,strTitle,125);
    AnsiString strTmp=AnsiString(strTitle).Trim();
    if(strTmp=="")
        return true;
    ((TListBox *)lparam)->Items->Add(strTitle);

 return true;
}
void __fastcall TForm1::FormShow(TObject *Sender)
{
    ListBox1->Items->Clear();
    EnumWindows((WNDENUMPROC)MyBackProc,(long)this->ListBox1);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button3Click(TObject *Sender)
{
        ListBox1->Items->Clear();
    EnumWindows((WNDENUMPROC)MyBackProc,(long)this->ListBox1);
}
//---------------------------------------------------------------------------


void TForm1::OnNcHit(TMessage & msg)
{
    TForm::Dispatch(&msg);

    if(msg.Result ==HTCLIENT)
     msg.Result = HTCAPTION;

}


void __fastcall TForm1::FormMouseDown(TObject *Sender, TMouseButton Button,
      TShiftState Shift, int X, int Y)
{
// ShowMessage("down");
  //SendMessage(Handle,WM_NCLBUTTONDOWN,HTCAPTION,(long)0);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button2Click(TObject *Sender)
{
Close();        
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button4Click(TObject *Sender)
{
MinimizeAllWindows();
    
}
//---------------------------------------------------------------------------

