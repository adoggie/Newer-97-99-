//---------------------------------------------------------------------------
#ifndef GlintTextH
#define GlintTextH
//---------------------------------------------------------------------------
#include <SysUtils.hpp>
#include <Controls.hpp>
#include <Classes.hpp>
#include <Forms.hpp>
#include <StdCtrls.hpp>
//---------------------------------------------------------------------------
class PACKAGE tGlintText : public TStaticText
{
private:
        TColor m_glintcolor;
        TColor m_defaultcolor;
        static tGlintText *m_handle;
        bool IsUrl;
protected:

    BEGIN_MESSAGE_MAP
        VCL_MESSAGE_HANDLER(WM_MOUSEMOVE, TMessage, OnMouseMoveOver)
        VCL_MESSAGE_HANDLER(WM_LBUTTONUP, TMessage, OnLButtonUp)
    END_MESSAGE_MAP(TStaticText)
      static void CALLBACK _OnTimer(HWND,UINT,UINT ,DWORD);

public:
        __fastcall tGlintText(TComponent* Owner);
        void OnMouseMoveOver(TMessage & msg);
    void OnLButtonUp(TMessage & msg);

__published:




};
tGlintText* tGlintText::m_handle=NULL;
//---------------------------------------------------------------------------
#endif
