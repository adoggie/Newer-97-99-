//---------------------------------------------------------------------------
#ifndef UserH
#define UserH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Buttons.hpp>
#include <Db.hpp>
#include <DBClient.hpp>
#include <DBGrids.hpp>
#include <ExtCtrls.hpp>
#include <Grids.hpp>
#include <DBCtrls.hpp>
#include <Dialogs.hpp>
//---------------------------------------------------------------------------
class TFormUserInfo : public TForm
{
__published:	// IDE-managed Components
    TPanel *Panel1;
    TPanel *Panel2;
    TBitBtn *btnOk;
    TBitBtn *btnCancel;
    TDBGrid *dg;
    TDataSource *ds;
    TClientDataSet *cds;
    TDBNavigator *DBNavigator1;
    TLabel *Label1;
    void __fastcall FormShow(TObject *Sender);
    void __fastcall btnOkClick(TObject *Sender);
    void __fastcall btnCancelClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
    __fastcall TFormUserInfo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormUserInfo *FormUserInfo;
//---------------------------------------------------------------------------
#endif
