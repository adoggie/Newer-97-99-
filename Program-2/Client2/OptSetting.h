//---------------------------------------------------------------------------
#ifndef OptSettingH
#define OptSettingH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Buttons.hpp>
//---------------------------------------------------------------------------
class TFormSetting : public TForm
{
__published:	// IDE-managed Components
    TGroupBox *gbOption;
    TCheckBox *cbxShowMore;
    TCheckBox *cbxSetTop;
    TCheckBox *cbxShowOnlineUser;
    TCheckBox *cbxSetTopByMsg;
    TBitBtn *BitBtn1;
    TCheckBox *cbxBeep;
    void __fastcall BitBtn1Click(TObject *Sender);
    void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TFormSetting(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormSetting *FormSetting;
//---------------------------------------------------------------------------
#endif
