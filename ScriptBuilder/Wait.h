//---------------------------------------------------------------------------

#ifndef WaitH
#define WaitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include <ImgList.hpp>
//---------------------------------------------------------------------------
class TFormWait : public TForm
{
__published:	// IDE-managed Components
    TBevel *Bevel1;
    TLabel *Label1;
private:	// User declarations
public:		// User declarations
    __fastcall TFormWait(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormWait *FormWait;
//---------------------------------------------------------------------------
#endif
