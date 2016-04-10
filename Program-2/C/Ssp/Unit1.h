//---------------------------------------------------------------------------
#ifndef Unit1H
#define Unit1H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
struct AccountInfo{
 char account[20];
 char psw[20];
 char phone[20];
 AccountInfo(){memset(account,'\0', 20);
                memset(psw,'\0', 20);
                memset(phone,'\0', 20);}

} ;
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        TEdit *etAccount;
        TEdit *etPsw;
        TEdit *etName;
        TBevel *Bevel1;
        TButton *Button1;
        TEdit *etPhone;
        TLabel *Label1;
        TLabel *Label2;
        TLabel *Label3;
        TBevel *Bevel2;
        TComboBox *ComboBox1;
        TButton *Button2;
        TButton *Button3;
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall ComboBox1DropDown(TObject *Sender);
        void __fastcall Button3Click(TObject *Sender);
        void __fastcall Button2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
