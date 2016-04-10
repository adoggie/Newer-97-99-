//---------------------------------------------------------------------------
#ifndef Unit3H
#define Unit3H
//---------------------------------------------------------------------------
#include <Forms.hpp>
#include <Buttons.hpp>
#include <ExtCtrls.hpp>
#include "include\common.cpp"
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Dialogs.hpp>
//---------------------------------------------------------------------------
class TForm3 : public TForm
{
__published:	// IDE-managed Components
        TGroupBox *GroupBox1;
        TComboBox *cmbPrintSelect;
        TStaticText *StaticText1;
        TStaticText *StaticText2;
        TComboBox *cmbPaperSelect;
        TGroupBox *GroupBox2;
        TCheckBox *ckGcbz;
        TCheckBox *ckNumber;
        TCheckBox *ckWidthByString;
        TStaticText *StaticText3;
        TStaticText *StaticText4;
        TStaticText *StaticText5;
        TBitBtn *btPrint;
        TBitBtn *BitBtn3;
        TCheckBox *ckPrintOrientation;
        TEdit *etDays;
        TEdit *etFlagDays;
        TPrinterSetupDialog *PrintSetup;
        TCheckBox *ckEmptyTable;
        TEdit *etCols;
        TLabel *Label1;
        TCheckBox *ckGq;
        TCheckBox *ckBarLine;
        TEdit *Edit1;
        TLabel *Label2;
        void __fastcall cmbPrintSelectDropDown(TObject *Sender);
        void __fastcall btPrintClick(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
        void __fastcall ckEmptyTableClick(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        //ProjectInfo *info;//用于传递选择打印机等参数
        PrintInfo Info;
        bool Visible;
        __fastcall TForm3(TComponent* Owner);


        };
//---------------------------------------------------------------------------
extern PACKAGE TForm3 *Form3;
//---------------------------------------------------------------------------
#endif
