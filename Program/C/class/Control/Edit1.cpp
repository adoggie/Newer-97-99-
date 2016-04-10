//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "Edit1.h"
#pragma package(smart_init)
//---------------------------------------------------------------------------
// ValidCtrCheck is used to assure that the components created do not have
// any pure virtual functions.
//

static inline void ValidCtrCheck(TEdit1 *)
{
        new TEdit1(NULL);
}
//---------------------------------------------------------------------------
__fastcall TEdit1::TEdit1(TComponent* Owner)
        : TEdit(Owner)
{
//Color=clBlack;
Font->Color=clRed;
Ctl3D=false;
 Left=100;
 Top=100;
 ParentColor=true;
 BorderStyle=bsNone;
}
//---------------------------------------------------------------------------
namespace Edit1
{
        void __fastcall PACKAGE Register()
        {
                 TComponentClass classes[1] = {__classid(TEdit1)};
                 RegisterComponents("Samples", classes, 0);
        }
}
//---------------------------------------------------------------------------


void TEdit1::OnChar(TMessage msg)
{
 TEdit::Dispatch(&msg);

}


void TEdit1::OnPaint(TMessage msg)
{


TEdit::Dispatch(&msg);
int height=this->Height;
//ShowMessage(Height);
 HDC dc=GetDC(this->Handle);
 HPEN pen=CreatePen(PS_SOLID,1,(COLORREF)clGreen);
 SelectObject(dc,pen);
 POINT pt;
 MoveToEx(dc,0,Height-4,&pt);
 LineTo(dc,Width,Height-4);
 TRect rc(0,0,Width,0);
 //this->Canvas->FillRect(rc();
 DeleteObject(pen);
 ReleaseDC(this->Handle,dc);
    }




void TEdit1::OnErasebk(TMessage msg)
{
  //TEdit::Dispatch(&msg);  //TODO: Add your source code here
}


void TEdit1::Oncreate(TMessage msg)
{

int style=GetWindowLong(this->Handle,GWL_STYLE);
style&=~WS_BORDER;
SetWindowLong(this->Handle,GWL_STYLE,style);
TEdit::Dispatch(&msg);
}

