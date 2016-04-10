TForm1TFormBase//---------------------------------------------------------------------------
#ifndef Unit3H
#define Unit3H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "Unit2.h"
#include <ExtCtrls.hpp>
#include <jpeg.hpp>
//---------------------------------------------------------------------------
class TFormLog : public TForm1
{
__published:	// IDE-managed Components
	TBevel *Bevel2;
	TBevel *Bevel1;
	TBevel *Bevel3;
	TLabel *Label2;
	TLabel *Label3;
	TBevel *Bevel4;
	TBevel *Bevel5;
	void __fastcall Timer1Timer(TObject *Sender);
private:	// User declarations
public:		// User declarations
    __fastcall TFormLog(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormLog *FormLog;
//---------------------------------------------------------------------------
#endif
