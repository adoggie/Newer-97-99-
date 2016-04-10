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
#include <Db.hpp>
#include <DBClient.hpp>
#include <DBGrids.hpp>
#include <Grids.hpp>
//---------------------------------------------------------------------------
class TFormMain : public TForm
{
__published:	// IDE-managed Components
    TPanel *Panel1;
    TPanel *Panel3;
    TLabel *Label2;
    TPanel *Panel4;
    TNMUDP *UdpClient;
    TComboBox *edtMsg;
	TMainMenu *MainMenu;
	TMenuItem *N1;
	TMenuItem *N2;
	TMenuItem *ItemAbout;
	TMenuItem *ItemSystemInfo;
	TMenuItem *N3;
	TPanel *Panel5;
    TPanel *plIpList;
	TCheckListBox *clbMan;
	TPanel *Panel6;
	TSplitter *Splitter1;
	TBevel *Bevel3;
	TBitBtn *btnMsgSend;
	TSpeedButton *SpeedButton1;
	TSpeedButton *btnClearContent;
	TMenuItem *N4;
	TMenuItem *ItemSetting;
    TMenuItem *ItemInfo;
    TClientDataSet *cds;
    TPanel *Panel7;
    tGlintText *gtMail;
    TPopupMenu *popSel;
    TMenuItem *ItemSelAll;
    TMenuItem *ItemCancelSelAll;
    TListView *lvMsg;
    TSpeedButton *SpeedButton2;
    TSpeedButton *SpeedButton3;
    TSpeedButton *SpeedButton4;
    TSpeedButton *SpeedButton5;

    void __fastcall FormShow(TObject *Sender);
    void __fastcall UdpClientDataReceived(TComponent *Sender,
          int NumberBytes, AnsiString FromIP);
    void __fastcall CheckBox1Click(TObject *Sender);
    void __fastcall FormPaint(TObject *Sender);
    void __fastcall btnMinClick(TObject *Sender);
    void __fastcall gtMailClick(TObject *Sender);
    void __fastcall edtMsgDropDown(TObject *Sender);
	void __fastcall BitBtn1Click(TObject *Sender);
	void __fastcall btnModifyIpClick(TObject *Sender);
	void __fastcall btnMsgSendClick(TObject *Sender);
	void __fastcall SpeedButton1Click(TObject *Sender);
	void __fastcall ItemSystemInfoClick(TObject *Sender);
    void __fastcall ItemSettingClick(TObject *Sender);
    void __fastcall N3Click(TObject *Sender);
    void __fastcall ItemInfoClick(TObject *Sender);
    void __fastcall ItemSelAllClick(TObject *Sender);
    void __fastcall ItemCancelSelAllClick(TObject *Sender);
    void __fastcall SpeedButton2Click(TObject *Sender);
    void __fastcall btnClearContentClick(TObject *Sender);
    void __fastcall ItemAboutClick(TObject *Sender);
    void __fastcall SpeedButton3Click(TObject *Sender);
    void __fastcall FormCreate(TObject *Sender);
private:
    AnsiString strHostName;	// User declarations
    AnsiString LocalIP( );
    AnsiString strComputerName,strLocalLoveName; //--本地用户呢称
    void   Init();
    int intStatus;

    bool  TestHost() ;
    bool  SendString(AnsiString strSend, AnsiString strRemoteHost);
    void  Alert();

    TStringList *lstLoveName;
    TStringList *lstName;
    TStringList *lstComputerName;
    TStringList *lstIp;

public:		// User declarations
    __fastcall TFormMain(TComponent* Owner);
    __fastcall ~TFormMain();
    void OnRestore(TMessage & msg);
public:
    bool bMsgBeep,bSetTopMostByMsg,bShowOnlineUser,bSetTopMost,bShowMore;
    void  AddList();
protected:
    BEGIN_MESSAGE_MAP
        //VCL_MESSAGE_HANDLER(WM_SYSCOMMAND, TMessage, OnRestore)
    END_MESSAGE_MAP(TForm)


};
//---------------------------------------------------------------------------
extern PACKAGE TFormMain *FormMain;
//---------------------------------------------------------------------------
#endif
