//---------------------------------------------------------------------------
#ifndef ProgressorH
#define ProgressorH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <Grids.hpp>
#include <Buttons.hpp>
#include <jpeg.hpp>
#include <Dialogs.hpp>


//=======  Include all class
#include "include\tCurProject.cpp"

//======= Include Personal Information Dialog
#include "unit2.h"

//=====Include Printer Select Dialog
#include "unit3.h"
#include "Edit1.h"


//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        TPanel *Panel1;
        TLabel *Label1;
        TButton *btnCreateProject;
        TComboBox *cmbProjectList;
        TPanel *Panel2;
        TLabel *Label2;
        TLabel *Label3;
        TLabel *Label4;
        TProgressBar *StepBar;
        TStringGrid *sgInputArea;
        TBitBtn *btAddSubRange;
        TBitBtn *btDelSubRange;
        TBitBtn *BitBtn1;
        TStaticText *StaticText1;
        TTimer *Timer1;
        TPrintDialog *PrintDialog1;
        TBitBtn *BitBtn2;
        TBitBtn *btDeleteLine;
        TBitBtn *btInsertLine;
        TEdit1 *etTitle;
        TEdit1 *etCorporation;
        TEdit1 *etPrintTime;
        TStaticText *StaticText2;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall btAddSubRangeClick(TObject *Sender);
        void __fastcall btDelSubRangeClick(TObject *Sender);
        void __fastcall sgInputAreaGetEditText(TObject *Sender, int ACol,
          int ARow, AnsiString &Value);
        void __fastcall sgInputAreaSelectCell(TObject *Sender, int ACol,
          int ARow, bool &CanSelect);
        void __fastcall btnCreateProjectClick(TObject *Sender);
        void __fastcall Button3Click(TObject *Sender);
        void __fastcall cmbProjectListClick(TObject *Sender);
        void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
        void __fastcall btDeleteCurProjectClick(TObject *Sender);
        void __fastcall BitBtn2Click(TObject *Sender);
        void __fastcall StaticText1Click(TObject *Sender);
        void __fastcall StaticText1MouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall Timer1Timer(TObject *Sender);
        void __fastcall BitBtn1Click(TObject *Sender);
        void __fastcall btDeleteLineClick(TObject *Sender);
        void __fastcall btInsertLineClick(TObject *Sender);


private:	// User declarations
        tCurProject *m_CurProject;//构建当前工程项目对象
        tProjectList *m_ProjectList; // 罗列默认目录下的工程项目文件  *.prj


public:
        __fastcall TForm1(TComponent* Owner);
protected:
    BEGIN_MESSAGE_MAP
        VCL_MESSAGE_HANDLER(WM_SYSCOMMAND, TMessage, DisableSystemCommandButton)
    END_MESSAGE_MAP(TForm)
    void DisableSystemCommandButton(TMessage msg);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
