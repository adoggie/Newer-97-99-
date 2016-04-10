//---------------------------------------------------------------------------
#ifndef Edit1H
#define Edit1H
//---------------------------------------------------------------------------
#include <SysUtils.hpp>
#include <Controls.hpp>
#include <Classes.hpp>
#include <Forms.hpp>
#include <StdCtrls.hpp>
//---------------------------------------------------------------------------
class PACKAGE TEdit1 : public TEdit
{
private:
protected:
    BEGIN_MESSAGE_MAP
        VCL_MESSAGE_HANDLER(WM_CHAR, TMessage, OnChar)
        VCL_MESSAGE_HANDLER(WM_PAINT, TMessage, OnPaint)
        VCL_MESSAGE_HANDLER(WM_ERASEBKGND, TMessage, OnErasebk)
        VCL_MESSAGE_HANDLER(WM_CREATE, TMessage, Oncreate)

    END_MESSAGE_MAP(TEdit)
    void OnChar(TMessage msg);
    void OnPaint(TMessage msg);
    void OnErasebk(TMessage msg);
    void Oncreate(TMessage msg);
 
public:
        __fastcall TEdit1(TComponent* Owner);
__published:
};
//---------------------------------------------------------------------------
#endif
