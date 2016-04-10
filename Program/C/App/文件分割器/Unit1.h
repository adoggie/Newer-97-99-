//---------------------------------------------------------------------------
#ifndef Unit1H
#define Unit1H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <Buttons.hpp>
#include <Dialogs.hpp>
#include "tadditional.cpp"
#include "unit2.h"
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        TPanel *Panel2;
        TProgressBar *StepBar;
        TPanel *Panel1;
        TListBox *lbFiles;
        TPanel *Panel3;
        TLabel *Label1;
        TEdit *etFileName;
        TStaticText *StaticText1;
        TBitBtn *btOpenFile;
        TEdit *etSize;
        TBitBtn *btFileInfo;
        TComboBox *cmbSizeType;
        TBitBtn *btSplit;
        TOpenDialog *OpenDialog;
        TBitBtn *btCombine;
        TBitBtn *btUp;
        TBitBtn *btDown;
        TLabel *Label2;
        TLabel *Label3;
        TLabel *Label4;
        TBitBtn *btAddFiles;
        TSaveDialog *SaveDialog1;
        TTimer *Timer1;
        TStaticText *Label5;
        void __fastcall btOpenFileClick(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
        void __fastcall btAddFilesClick(TObject *Sender);
      //  void __fastcall etSizeKeyPress(TObject *Sender, char &Key);
       // void __fastcall etSizeEnter(TObject *Sender);
      //  void __fastcall etSizeExit(TObject *Sender);
        void __fastcall btSplitClick(TObject *Sender);
        void __fastcall lbFilesKeyDown(TObject *Sender, WORD &Key,
          TShiftState Shift);
        void __fastcall btUpClick(TObject *Sender);
        void __fastcall btDownClick(TObject *Sender);
        void __fastcall btCombineClick(TObject *Sender);
        void __fastcall etFileNameMouseMove(TObject *Sender,
          TShiftState Shift, int X, int Y);
        void __fastcall btFileInfoClick(TObject *Sender);
        void __fastcall Label5MouseMove(TObject *Sender, TShiftState Shift,
          int X, int Y);
        void __fastcall Timer1Timer(TObject *Sender);
        void __fastcall Label5Click(TObject *Sender);
private:	// User declarations
        tAdditional zbin;
        bool etSizeInputOK;
public:		// User declarations
        __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
