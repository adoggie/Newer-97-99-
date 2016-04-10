//---------------------------------------------------------------------------

#ifndef MainH
#define MainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <Menus.hpp>
#include <ToolWin.hpp>

#include "Child.h"
#include <Dialogs.hpp>
#include <ExtCtrls.hpp>
#include <Buttons.hpp>
#include <ImgList.hpp>
//---------------------------------------------------------------------------
class TFormMain : public TForm
{
__published:	// IDE-managed Components
	TCoolBar *CoolBar1;
	TMainMenu *MainMenu;
	TMenuItem *N1;
	TMenuItem *N2;
	TMenuItem *ItemNew;
	TMenuItem *ItemOpen;
	TMenuItem *N5;
	TMenuItem *ItemExit;
	TMenuItem *ItemTopic;
	TMenuItem *N8;
	TMenuItem *ItemAbout;
	TMenuItem *N10;
	TMenuItem *ItemSetupPrinter;
	TStatusBar *stbar;
	TOpenDialog *OpenDlg;
	TTimer *SysTime;
	TToolBar *ToolBar1;
	TSpeedButton *SpeedButton1;
	TSpeedButton *SpeedButton2;
	TSpeedButton *SpeedButton3;
	TSpeedButton *btnSave;
	TSpeedButton *SpeedButton5;
	TImageList *ImageList1;
	TToolButton *ToolButton3;
	TSaveDialog *SaveDlg;
    TComboBox *cbFileList;
	void __fastcall ItemNewClick(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
	void __fastcall ItemOpenClick(TObject *Sender);
	void __fastcall ItemAboutClick(TObject *Sender);
	void __fastcall ItemExitClick(TObject *Sender);
	void __fastcall SysTimeTimer(TObject *Sender);
	void __fastcall btnSaveClick(TObject *Sender);
    void __fastcall cbFileListChange(TObject *Sender);
private:	// User declarations
    TList 	*f_ChildList;  //子窗体的指针链表
    TFormChild *f_ActiveForm;
	void OnWindow(TMessage & msg);
    TFormChild *f_DelFormChild;
public:
    void    SetDelFormChild(TFormChild * FormChild){f_DelFormChild=FormChild;};
    TFormChild * GetDelFormChild(void)  {return f_DelFormChild;}

	void	AddChildForm(TFormChild *Form);
   	void	DelChildForm(TFormChild *Form);
    int 	GetMaxChild(void);
    void 	CloseAll(void);
    void	SetActiveForm(TFormChild * Me);
    TFormChild * GetActiveForm(void) { return f_ActiveForm;}
	TList *	GetWindowList(void) {	return f_ChildList; }  //得到所有子窗体的子针列表
public:		// User declarations
	__fastcall TFormMain(TComponent* Owner);
	__fastcall ~TFormMain();
    void 	SetWindowList(TFormChild * ActiveChild,bool Flag=false);  //列出当前所有打开的工程项目
protected:
	BEGIN_MESSAGE_MAP
		VCL_MESSAGE_HANDLER(WM_COMMAND, TMessage, OnWindow)
	END_MESSAGE_MAP(TForm)
};
//---------------------------------------------------------------------------
extern PACKAGE TFormMain *FormMain;
//---------------------------------------------------------------------------
#endif
