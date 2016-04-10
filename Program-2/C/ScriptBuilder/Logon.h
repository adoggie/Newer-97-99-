//---------------------------------------------------------------------------

#ifndef LogonH
#define LogonH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
//---------------------------------------------------------------------------
class TFormLogon : public TForm
{
__published:	// IDE-managed Components
    TLabel *Label1;
    TLabel *Label2;
    TEdit *edtUser;
    TEdit *edtPassword;
    TButton *Button1;
    TButton *Button2;
    void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
    __fastcall TFormLogon(TComponent* Owner);
    bool GetParams(TStrings * Params);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormLogon *FormLogon;
//---------------------------------------------------------------------------
#endif
