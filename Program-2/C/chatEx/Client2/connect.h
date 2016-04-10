//---------------------------------------------------------------------------
#ifndef connectH
#define connectH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Buttons.hpp>
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TFormConnect : public TForm
{
__published:	// IDE-managed Components
    TPanel *Panel1;
    TLabel *Label1;
    TBitBtn *btnConnect;
    TMemo *Memo1;
    TBevel *Bevel1;
    TComboBox *edtRemoteHost;
    void __fastcall FormShow(TObject *Sender);
    void __fastcall btnConnectClick(TObject *Sender);
    void __fastcall FormKeyDown(TObject *Sender, WORD &Key,
          TShiftState Shift);
private:	// User declarations
public:		// User declarations
    __fastcall TFormConnect(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormConnect *FormConnect;
//---------------------------------------------------------------------------
#endif

