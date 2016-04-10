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
#include <ActnList.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
    TPanel *Panel1;
    TPanel *Panel2;
    TBitBtn *BitBtn1;
    TEdit *Edit1;
    TEdit *Edit2;
    TBitBtn *BitBtn2;
    TOpenDialog *dlgOpen;
    TMemo *Memo1;
    TListBox *ListBox1;
    TSplitter *Splitter1;
    TBitBtn *btnSave;
    TCheckBox *CheckBox1;
    TComboBox *cbType;
    TCheckBox *CheckBox2;
    TButton *Button1;
    void __fastcall BitBtn1Click(TObject *Sender);
    void __fastcall BitBtn2Click(TObject *Sender);
    void __fastcall ListBox1Click(TObject *Sender);
    void __fastcall Action1Execute(TObject *Sender);
    void __fastcall btnSaveClick(TObject *Sender);
    void __fastcall FormShow(TObject *Sender);
    void __fastcall cbTypeChange(TObject *Sender);
    void __fastcall CheckBox1Click(TObject *Sender);
    void __fastcall CheckBox2Click(TObject *Sender);
    void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
TStringList *pList;
public:		// User declarations
    __fastcall TForm1(TComponent* Owner);
    __fastcall ~TForm1();
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
