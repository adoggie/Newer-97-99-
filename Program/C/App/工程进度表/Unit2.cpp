//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "Unit2.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm2 *Form2;
//---------------------------------------------------------------------------
__fastcall TForm2::TForm2(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TForm2::FormClick(TObject *Sender)
{
//Hide();
}
//---------------------------------------------------------------------------
void __fastcall TForm2::Button1Click(TObject *Sender)
{
SendMessage(Handle,WM_CLOSE,0,0);        
}
//---------------------------------------------------------------------------
void __fastcall TForm2::FormCreate(TObject *Sender)
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

