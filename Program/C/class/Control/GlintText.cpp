//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "GlintText.h"
#pragma package(smart_init)
//---------------------------------------------------------------------------
// ValidCtrCheck is used to assure that the components created do not have
// any pure virtual functions.
//

static inline void ValidCtrCheck(tGlintText *)
{
        new tGlintText(NULL);
}
//---------------------------------------------------------------------------
__fastcall tGlintText::tGlintText(TComponent* Owner)
        : TStaticText(Owner)
{
      m_glintcolor=clGreen;
      m_defaultcolor=Font->Color;
      Caption="GlintText_Example";
      Parent=(TWinControl *)Owner;

      IsUrl=false;

}
//---------------------------------------------------------------------------
namespace Glinttext
{
        void __fastcall PACKAGE Register()
        {
                 TComponentClass classes[1] = {__classid(tGlintText)};
                 RegisterComponents("zbin0", classes, 0);
        }
}
//---------------------------------------------------------------------------

void CALLBACK tGlintText::_OnTimer(HWND hwnd,UINT msg,UINT id,DWORD past)
{


        RECT Rc;
        POINT CursorPt ;
        GetCursorPos(&CursorPt);
        GetWindowRect( tGlintText::m_handle->Handle ,&Rc);
        if(!PtInRect(&Rc,CursorPt))
        {
        tGlintText::m_handle->Font->Color=tGlintText::m_handle->m_defaultcolor;
        KillTimer(hwnd,id);
        }
}

void tGlintText::OnMouseMoveOver(TMessage & msg)
{
        SetTimer(Handle,1,100,(TIMERPROC)_OnTimer);
        Font->Color=m_glintcolor;
        m_handle=this;
}



void tGlintText::OnLButtonUp(TMessage & msg)
{
        //Link To Internet
        IsUrl=true;
        if(IsUrl)
        {
        //ShowMessage(Caption);
        ShellExecute(Handle,"open",Caption.c_str(),NULL,NULL,SW_SHOWNORMAL);
        }
        TStaticText::Dispatch(&msg);

}

