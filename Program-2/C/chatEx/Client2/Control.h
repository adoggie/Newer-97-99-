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
#include <CheckLst.hpp>
//#include "GlintText.h"
#include <Dialogs.hpp>
#include "GlintText.h"
#include <ToolWin.hpp>
//---------------------------------------------------------------------------
class TFormMain : public TForm
{
__published:	// IDE-managed Components
    TPanel *Panel1;
    TMemo *memoReturn;
    TPanel *Panel3;
    TLabel *Label2;
    TPanel *Panel4;
    TNMUDP *UdpClient;
    TComboBox *edtMsg;
	tGlintText *gtMail;
	tGlintText *tGlintText1;
	TMainMenu *MainMenu;
	TMenuItem *N1;
	TMenuItem *N2;
	TMenuItem *ItemAbout;
	TMenuItem *ItemSystemInfo;
	TMenuItem *N3;
	TPanel *Panel5;
	TSpeedButton *btnRefreshIp;
	TSpeedButton *btnModifyIp;
	TPanel *Panel2;
	TCheckListBox *clbMan;
	TPanel *Panel6;
	TSplitter *Splitter1;
	TBevel *Bevel3;
	TBitBtn *btnMsgSend;
	TSpeedButton *SpeedButton1;
	TSpeedButton *btnClearContent;
	TMenuItem *N4;
	TMenuItem *ItemSetting;

    void __fastcall FormShow(TObject *Sender);
    void __fastcall clbManClick(TObject *Sender);
    void __fastcall UdpClientDataReceived(TComponent *Sender,
          int NumberBytes, AnsiString FromIP);
    void __fastcall CheckBox1Click(TObject *Sender);
    void __fastcall FormPaint(TObject *Sender);
    void __fastcall btnMinClick(TObject *Sender);
    void __fastcall gtMailClick(TObject *Sender);
    void __fastcall edtMsgDropDown(TObject *Sender);
	void __fastcall tGlintText1Click(TObject *Sender);
	void __fastcall BitBtn1Click(TObject *Sender);
	void __fastcall btnRefreshIpClick(TObject *Sender);
	void __fastcall btnModifyIpClick(TObject *Sender);
	void __fastcall btnMsgSendClick(TObject *Sender);
	void __fastcall SpeedButton1Click(TObject *Sender);
	void __fastcall ItemSystemInfoClick(TObject *Sender);
private:
    AnsiString strHostName;	// User declarations
    AnsiString LocalIP( );
    AnsiString strComputerName;
    void   Init();
    int intStatus;
    void  AddList();
    bool  TestHost() ;
    bool  SendString(AnsiString strSend, AnsiString strRemoteHost);
    void  Alert();

public:		// User declarations
    __fastcall TFormMain(TComponent* Owner);
    void OnRestore(TMessage & msg);
protected:
    BEGIN_MESSAGE_MAP
        VCL_MESSAGE_HANDLER(WM_SYSCOMMAND, TMessage, OnRestore)
    END_MESSAGE_MAP(TForm)


};
//---------------------------------------------------------------------------
extern PACKAGE TFormMain *FormMain;
//---------------------------------------------------------------------------
#endif
