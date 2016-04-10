//---------------------------------------------------------------------------

#ifndef MainH
#define MainH
//#include "Wait.h"
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Db.hpp>
#include <DBTables.hpp>
#include <Menus.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <CheckLst.hpp>
#include <Buttons.hpp>
#include <ImgList.hpp>
#include <DBGrids.hpp>
#include <Grids.hpp>
#include <DBCtrls.hpp>
#include <Dialogs.hpp>
//---------------------------------------------------------------------------
typedef enum {ALIAS=0,TABLES=1,STOREPROCS=2,VIEWS=3,TRIGGERS=4,SEQUENCES} ACTIVEPAGE;

//------------------------------------------------------------------------------
/*
class TMyThread :public TThread
{

public:
    __fastcall TMyThread(bool bExecute);
    void __fastcall Execute(void);
    void __fastcall Terminate(void);
};
void __fastcall TMyThread::Execute(void)
{

}
__fastcall TMyThread::TMyThread(bool bExecute):TThread(bExecute)
{
    FormWait=new TFormWait(NULL);
    FormWait->Show();
}
void __fastcall TMyThread::Terminate(void)
{
    FormWait->Close();
    delete FormWait;
    this->TThread::Terminate();

}
*/
//------------------------------------------------------------------------------

class TFormMain : public TForm
{
__published:	// IDE-managed Components
    TMainMenu *MainMenu1;
    TMenuItem *File1;
    TMenuItem *Edit1;
    TMenuItem *Help1;
    TMenuItem *Import1;
    TMenuItem *ItemExportMain;
    TPanel *Panel1;
    TPanel *Panel2;
    TPanel *Panel3;
	TPageControl *pcAll;
    TTabSheet *tsTable;
    TTabSheet *tsStoreProc;
    TTabSheet *tsView;
    TPanel *Panel4;
    TSplitter *Splitter1;
    TPanel *Panel5;
    TPanel *Panel6;
    TCheckListBox *clbTables;
    TPanel *Panel7;
    TCheckListBox *clbStoreProcs;
    TPanel *Panel8;
    TCheckListBox *clbViews;
    TTabSheet *tsAlia;
    TPanel *Panel9;
	TComboBox *cbAlias;
    TGroupBox *GroupBox1;
    TLabel *Label1;
    TLabel *Label2;
    TLabel *Label3;
    TLabel *Label4;
    TMenuItem *N1;
	TDatabase *DBConnect;
	TSession *Session;
    TSpeedButton *btStruct;
    TSpeedButton *btRecord;
	TImageList *ImgList;
	TLabel *lbTableInfo;
	TLabel *lbStoreProcInfo;
	TLabel *lbViewInfo;
	TPopupMenu *PopMenu;
	TMenuItem *ItemSelectAll;
	TMenuItem *ItemSelectNone;
	TMenuItem *ItemSp1;
	TMenuItem *ItemExport;
	TStoredProc *StoredProc1;
	TBitBtn *BitBtn1;
	TBitBtn *BitBtn2;
    TDBGrid *DBGrid;
    TQuery *QryData;
    TDataSource *ds;
    TQuery *QryTable;
    TQuery *QryStoreProc;
    TQuery *QryView;
    TSpeedButton *btStoreProc;
    TSpeedButton *btView;
    TRichEdit *Memo1;
    TSplitter *Splitter2;
    TMenuItem *ItemOpenAs;
    TMenuItem *ItemSp2;
    TSaveDialog *dlgSave;
    TMenuItem *N2;
    TMenuItem *N3;
    TMenuItem *View1;
    TMenuItem *ItemStruct;
    TMenuItem *ItemRecord;
    TMenuItem *ItemStoreProc;
    TMenuItem *ItemView;
    TTabSheet *tsTrigger;
    TPanel *Panel10;
    TCheckListBox *clbTriggers;
    TSpeedButton *btTrigger;
    TMenuItem *ItemTrigger;
    TTabSheet *tsSq;
    TPanel *Panel11;
    TCheckListBox *clbSqs;
    TSpeedButton *btSq;
    TMenuItem *ItemSq;
    TLabel *Label5;
    TLabel *Label6;
    TLabel *lbTriggerInfo;
    TLabel *lbSequenceInfo;
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall cbAliasClick(TObject *Sender);
	void __fastcall PopMenuPopup(TObject *Sender);
	void __fastcall ItemSelectAllClick(TObject *Sender);
	void __fastcall ItemSelectNoneClick(TObject *Sender);
    void __fastcall clbTablesDblClick(TObject *Sender);
    void __fastcall tsTableShow(TObject *Sender);
    void __fastcall tsAliaShow(TObject *Sender);
    void __fastcall tsViewShow(TObject *Sender);
    void __fastcall tsStoreProcShow(TObject *Sender);
    void __fastcall btStructClick(TObject *Sender);
    void __fastcall btRecordClick(TObject *Sender);
    void __fastcall btStoreProcClick(TObject *Sender);
    void __fastcall btViewClick(TObject *Sender);
    void __fastcall clbViewsDblClick(TObject *Sender);
    void __fastcall clbTablesClickCheck(TObject *Sender);
    void __fastcall clbViewsClickCheck(TObject *Sender);
    void __fastcall clbStoreProcsClickCheck(TObject *Sender);
    void __fastcall ItemOpenAsClick(TObject *Sender);
    void __fastcall Help1Click(TObject *Sender);
    void __fastcall ItemExportClick(TObject *Sender);
    void __fastcall ItemStructClick(TObject *Sender);
    void __fastcall ItemRecordClick(TObject *Sender);
    void __fastcall ItemStoreProcClick(TObject *Sender);
    void __fastcall ItemViewClick(TObject *Sender);
    void __fastcall N3Click(TObject *Sender);
    void __fastcall Memo1Enter(TObject *Sender);
    void __fastcall Memo1Exit(TObject *Sender);
    void __fastcall tsTriggerShow(TObject *Sender);
    void __fastcall ItemTriggerClick(TObject *Sender);
    void __fastcall btTriggerClick(TObject *Sender);
    void __fastcall clbTriggersClickCheck(TObject *Sender);
    void __fastcall ItemSqClick(TObject *Sender);
    void __fastcall btSqClick(TObject *Sender);
    void __fastcall tsSqShow(TObject *Sender);
    void __fastcall clbSqsClickCheck(TObject *Sender);
private:	// User declarations
    bool bLocal;
    void ShowTables(void);
    int nActive;
    AnsiString strViewTitle;
    AnsiString strTableTitle;
    AnsiString strStoreProcTitle;
    AnsiString strIndexTitle;
    AnsiString strTriggerTitle;
    AnsiString strSequenceTitle;
    void SetMenuItemStatus(void);
    void ShowTriggers(void);
    void RidChar(AnsiString String,TStrings * lstMemo);
    void ShowSequences(void);
public:		// User declarations
    __fastcall TFormMain(TComponent* Owner);
	void InitAlias(void);
	void LoadInfo();
	void InitCtrl(void);
    void InitValue(void);
    void OnCommand(TMessage & msg);
    void ShowStoreProcs(void);
    void ShowViews(void);
protected:
};
//---------------------------------------------------------------------------
extern PACKAGE TFormMain *FormMain;
//---------------------------------------------------------------------------
#endif
