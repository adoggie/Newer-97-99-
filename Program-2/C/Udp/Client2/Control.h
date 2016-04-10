//---------------------------------------------------------------------------
#ifndef ControlH
#define ControlH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <NMUDP.hpp>
#include <Buttons.hpp>
#include <ExtCtrls.hpp>
#include <ComCtrls.hpp>
#include <Menus.hpp>
//---------------------------------------------------------------------------
class TFormMain : public TForm
{
__published:	// IDE-managed Components
    TPanel *Panel1;
    TStatusBar *StatusBar1;
    TEdit *edtMsg;
    TLabel *Label2;
    TButton *btnSendMsg;
    TMainMenu *MainMenu1;
    TMenuItem *N1;
    TMenuItem *N2;
    TMenuItem *N3;
    TMenuItem *N4;
    TMenuItem *N5;
    TMenuItem *N6;
    TMenuItem *N7;
    TMenuItem *N8;
    TMenuItem *ScreenDraw11;
    TMenuItem *ScreenDraw21;
    TMenuItem *ScreenDraw31;
    TMenuItem *ScreenDraw41;
    TBitBtn *BitBtn1;
    TBitBtn *BitBtn2;
    TBitBtn *BitBtn3;
    TBitBtn *BitBtn4;
    TBitBtn *BitBtn5;
    TBitBtn *BitBtn6;
    TBitBtn *BitBtn7;
    TBitBtn *BitBtn8;
    TBitBtn *BitBtn9;
    TBitBtn *BitBtn10;
    TBitBtn *BitBtn11;
    TBitBtn *BitBtn12;
    TBitBtn *BitBtn13;
    void __fastcall edtMsgKeyDown(TObject *Sender, WORD &Key,
          TShiftState Shift);
    void __fastcall btnSendMsgClick(TObject *Sender);
    void __fastcall N4Click(TObject *Sender);
    void __fastcall FormKeyDown(TObject *Sender, WORD &Key,
          TShiftState Shift);
    void __fastcall BitBtn1Click(TObject *Sender);
    void __fastcall BitBtn2Click(TObject *Sender);
    void __fastcall BitBtn3Click(TObject *Sender);
    void __fastcall BitBtn7Click(TObject *Sender);
    void __fastcall BitBtn4Click(TObject *Sender);
    void __fastcall BitBtn5Click(TObject *Sender);
    void __fastcall BitBtn6Click(TObject *Sender);
    void __fastcall BitBtn8Click(TObject *Sender);
    void __fastcall BitBtn9Click(TObject *Sender);
    void __fastcall BitBtn10Click(TObject *Sender);
    void __fastcall BitBtn12Click(TObject *Sender);
    void __fastcall BitBtn11Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
    __fastcall TFormMain(TComponent* Owner);
    AnsiString RemoteHost;
    void ShowRemoteHost(void);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormMain *FormMain;
//---------------------------------------------------------------------------
#endif
