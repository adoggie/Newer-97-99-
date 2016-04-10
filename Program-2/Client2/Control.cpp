//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
#include "Control.h"


#include "define.cpp"
#include "shellapi.h"
#include "OptSetting.h"
#include "User.h"
#include "Registry.hpp"
#include "logo.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "GlintText"
#pragma link "GlintText"
#pragma resource "*.dfm"
TFormMain *FormMain;
//---------------------------------------------------------------------------
__fastcall TFormMain::TFormMain(TComponent* Owner)
	: TForm(Owner)
{
	strHostName="zbin";
	intStatus=-1;

    bSetTopMostByMsg=true;     //--消息到时将窗体推到最前
    bShowOnlineUser=true;      //--显示在线用户
    bSetTopMost=true;          //--将窗体放在最前
    bShowMore=true;            //--显示男语
    bMsgBeep=true;              //--声音响应

    lstLoveName=new TStringList;
    lstName=new TStringList;
    lstComputerName=new TStringList;
    lstIp=new TStringList;
    strLocalLoveName="";
}

__fastcall TFormMain::~TFormMain()
{
    delete lstLoveName;
    delete lstName;
    delete lstComputerName;
    delete lstIp;

}

//---------------------------------------------------------------------------

void __fastcall TFormMain::FormShow(TObject *Sender)
{
//--对WINNT无效
    try{
    TRegistry *rg=new TRegistry;
    rg->RootKey=( HKEY ) 0x80000002;  //--到HKEY_LOCAL_MECHINE\\
    rg->OpenKey("\\Software\\Microsoft\\Windows\\CurrentVersion\\Run",true);
    rg->WriteString("Chat Dodo",Application->ExeName);
    rg->CloseKey();
    delete rg;
    }
    catch(...){}

	Init();
    lvMsg->Items->Clear();
}
//---------------------------------------------------------------------------
void  TFormMain::Init()
{
    AnsiString ComputerName;
    ComputerName.SetLength(MAX_PATH);
	memset(ComputerName.c_str() ,0,MAX_PATH );
	DWORD size=MAX_PATH;
	GetComputerName(ComputerName.c_str(),&size);
	ComputerName=ComputerName.Trim();
	strComputerName=ComputerName;
	AnsiString strIP=LocalIP() ;
	AddList();
}

bool   TFormMain::TestHost()
{
	if(strHostName.Trim()=="") return false;
	intStatus=0;
	SendString("test",strHostName);
	AddList();

	return true;

}
//-----------------------bool TFormMain::SendString(AnsiString strSend, AnsiString strRemoteHost)-----------------------------

bool TFormMain::SendString(AnsiString strSend, AnsiString strRemoteHost)
 {

	TMemoryStream *ms = new TMemoryStream;
	try{
	ms->WriteBuffer( strSend.c_str(),strSend.Length());
	UdpClient->RemoteHost = strRemoteHost;
	UdpClient->SendStream(ms);
	//delete ms;
	}
	catch(...)
	{

	}
	delete ms;
	return true;
}

//---------------------------------------------------------------------------
AnsiString TFormMain::LocalIP( )
{
	typedef struct
	{
		PInAddr IP[10];
	} TaPInAddr;

	AnsiString strLocalIP = "";
	PHostEnt phe;
	TaPInAddr* pptr;
	WSADATA GInitData;
	char Buffer[63];
	int i = 0;

	WSAStartup(0x101, &GInitData);
	gethostname(Buffer, 64);
	phe = gethostbyname(Buffer);
	if (phe == NULL) return strLocalIP;
	pptr = (TaPInAddr*)(phe->h_addr_list);

	while (pptr->IP[i] != NULL)
	{
		strLocalIP = StrPas(inet_ntoa(*(pptr->IP[i])));
		i++;
	}

	WSACleanup();
	return strLocalIP;
}


void TFormMain::AddList()
{
    cds->Close();
    cds->FileName=ExtractFilePath(Application->ExeName)+"User.cds";
    cds->Open();

    lstLoveName->Clear();
    lstName->Clear();
    lstComputerName->Clear();
    lstIp->Clear();
    clbMan->Items->Clear();
    bool bOnce=true;
    while(!cds->Eof)
    {
        clbMan->Items->Add(cds->FieldByName("OTHERNAME")->AsString);
        lstName->Add(cds->FieldByName("NAME")->AsString);
        lstLoveName->Add(cds->FieldByName("OTHERNAME")->AsString);
        lstComputerName->Add(cds->FieldByName("COMPUTERNAME")->AsString);
        lstIp->Add(cds->FieldByName("IP")->AsString);

        //--设置本地呢称
        if(bOnce)
        {
        if(strComputerName.UpperCase().Trim()==cds->FieldByName("COMPUTERNAME")->AsString.Trim().UpperCase()&&\
            cds->FieldByName("OTHERNAME")->AsString.Trim()!="") //-- 如果机器名称和数据库中的计算机名称相同则取同一记录的名称子段
            {
                strLocalLoveName=cds->FieldByName("OTHERNAME")->AsString.Trim();
                bOnce=false;
            }
        else
            strLocalLoveName=strComputerName;

        }
        cds->Next();
    }
    cds->Close();
}


void __fastcall TFormMain::UdpClientDataReceived(TComponent *Sender,
      int NumberBytes, AnsiString FromIP)
{

    AnsiString strFlag="@i live &";
    TMemoryStream *ms = new TMemoryStream;
    AnsiString strMsg;
    strMsg.SetLength(NumberBytes);
   if (NumberBytes==-1) return;

   try{
    memset(strMsg.c_str(),0,NumberBytes);
    UdpClient->ReadStream(ms);
    ms->ReadBuffer(strMsg.c_str(),NumberBytes);
    delete ms;
        }
    catch(...)
    {}

    strMsg=strMsg.Trim(); //--消息体
    TListItem *pItem;

    int nPos;
    if(strMsg.AnsiPos(strFlag)==0)  //--
    {
        nPos=strMsg.AnsiPos("|<>|");
        if(nPos==0) return; //--不是指定消息类型

        pItem=lvMsg->Items->Add();
        lvMsg->Scroll(0,40);

        nPos=strMsg.AnsiPos("^");//--消息源的机器名称
        pItem->Caption=strMsg.SubString(1,nPos-1);  //--Msg From
        //pItem->SubItems->Add(strMsg.SubString(1,nPos-1));
        pItem->SubItems->Add("本机");
        nPos=strMsg.AnsiPos("|<>|");
        pItem->SubItems->Add(strMsg.SubString(nPos+4,strMsg.Length()-nPos-3));
        pItem->SubItems->Add(Now().DateTimeString());
        SendString(/*pItem->Caption*/ strLocalLoveName+strFlag  ,FromIP);
        Alert();
    }
    else
    {
        if(bShowMore)
        {
            nPos=strMsg.AnsiPos(strFlag);
            pItem=lvMsg->Items->Add();
            lvMsg->Scroll(0,40);
            pItem->Caption="";
            pItem->SubItems->Add("");
            pItem->SubItems->Add(strMsg.SubString(1,nPos-1)+ "收到消息");
        }
    }


}
void TFormMain::Alert()
{
 // SendMessage(Handle,WM_SYSCOMMAND,SC_MAXIMIZE,0);
    HWND Me=Handle;
    RECT rc;
    GetWindowRect(Me,&rc);
    if(bSetTopMostByMsg)
    {
        if(!BringWindowToTop(this->Handle));
            BringWindowToTop(this->Handle);
        //SetWindowPos(Me,HWND_TOPMOST,rc.left,rc.top,rc.right-rc.left,rc.bottom-rc.top,SWP_SHOWWINDOW);
        //SetWindowPos(Me,HWND_NOTOPMOST,rc.left,rc.top,rc.right-rc.left,rc.bottom-rc.top,SWP_SHOWWINDOW);
    }
    if(bMsgBeep)
        MessageBeep(0xFFFFFFFF);
    FlashWindow(this->Handle,true);
/*
    ShowWindow(Handle,SW_RESTORE );
    SetFocus();
	int x=GetSystemMetrics(SM_CXSCREEN);
	int y=GetSystemMetrics(SM_CYSCREEN);
	GetWindowRect(Me,&rc);
	TRect m_rc(rc);
    if(bSetTopMostByMsg)
    {
        SetWindowPos(Me,HWND_TOPMOST,(x-m_rc.Width())/2,(y-m_rc.Height())/2,m_rc.Width(),m_rc.Height(),SWP_SHOWWINDOW);
        SetWindowPos(Me,HWND_NOTOPMOST,(x-m_rc.Width())/2,(y-m_rc.Height())/2,m_rc.Width(),m_rc.Height(),SWP_SHOWWINDOW);
        SetFocus();
    }
  */
}
//---------------------------------------------------------------------------



void __fastcall TFormMain::CheckBox1Click(TObject *Sender)
{
    HWND Me=Handle;
    RECT rc;
	int x=GetSystemMetrics(SM_CXSCREEN);
	int y=GetSystemMetrics(SM_CYSCREEN);
	GetWindowRect(Me,&rc);
	TRect m_rc(rc);
    if(bSetTopMostByMsg)
	SetWindowPos(Me,HWND_TOPMOST,(x-m_rc.Width())/2,(y-m_rc.Height())/2,m_rc.Width(),m_rc.Height(),SWP_SHOWWINDOW);
    else
    {
    SetWindowPos(Me,HWND_NOTOPMOST,(x-m_rc.Width())/2,(y-m_rc.Height())/2,m_rc.Width(),m_rc.Height(),SWP_SHOWWINDOW);
    //SendMessage(Handle,WM_SYSCOMMAND,SC_MINIMIZE,0);
    }

}
//---------------------------------------------------------------------------


 



void TFormMain::OnRestore(TMessage & msg)
{
    if(msg.WParamLo==SC_RESTORE)
        bSetTopMostByMsg=true;
    TForm::Dispatch(&msg);
    
}


void __fastcall TFormMain::FormPaint(TObject *Sender)
{
// CheckBox1->Checked=true;
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::btnMinClick(TObject *Sender)
{
  SendMessage(Handle,WM_SYSCOMMAND,SC_MINIMIZE,0);
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::gtMailClick(TObject *Sender)
{
	ShellExecute(0,"open",AnsiString("MailTo:"+gtMail->Caption).c_str(),0,0,SW_NORMAL);
}
//---------------------------------------------------------------------------


void __fastcall TFormMain::edtMsgDropDown(TObject *Sender)
{

   edtMsg->Items->Clear();
   try{
   edtMsg->Items->LoadFromFile(ExtractFilePath(Application->ExeName)+"info.txt");
   }
   catch(...)
   {return;}
}
//---------------------------------------------------------------------------



void __fastcall TFormMain::BitBtn1Click(TObject *Sender)
{
	//memoReturn->Lines->Clear();
    lvMsg->Items->Clear();
}
//---------------------------------------------------------------------------



void __fastcall TFormMain::btnModifyIpClick(TObject *Sender)
{
WinExec("NotePad.exe ip.txt",SW_SHOWNORMAL);
}
//---------------------------------------------------------------------------


void __fastcall TFormMain::btnMsgSendClick(TObject *Sender)
{
    if(edtMsg->Text.Trim()=="")
    {
        ShowMessage("你是哑巴吗？");
        edtMsg->SetFocus();
        edtMsg->SelectAll();
        return;
    }
    AnsiString strFrom,strTo,strToIp;
    strFrom=strLocalLoveName;
    TListItem *pItem;
    for(int i=0;i<clbMan->Items->Count;i++)
    {
        if(!clbMan->Checked[i]) continue;
        strTo=clbMan->Items->Strings[i].Trim();
        pItem=lvMsg->Items->Add();
        lvMsg->Scroll(0,40);
        if(true /*bShowMore*/)
        {
            pItem->Caption=strFrom;

            pItem->SubItems->Add(strTo);
            pItem->SubItems->Add(edtMsg->Text.Trim());
            pItem->SubItems->Add(Now().DateTimeString());
        }
        strToIp=lstComputerName->Strings[i].Trim();
        if(strToIp=="")
            strToIp=lstIp->Strings[i].Trim();
        if(strToIp=="")
        {strToIp="NullComputer";}
        else
            SendString( strFrom+"^"+ AnsiString("|<>|")+edtMsg->Text.Trim()  , strToIp);

    }
    edtMsg->SetFocus();
    edtMsg->SelectAll();

}
//---------------------------------------------------------------------------

void __fastcall TFormMain::SpeedButton1Click(TObject *Sender)
{
	WinExec("NotePad.exe info.txt",SW_SHOWNORMAL);
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ItemSystemInfoClick(TObject *Sender)
{
	ShellAbout(this->Handle,"Chat 局域聊天程序","Dodo love you!",Application->Icon->Handle);
}
//---------------------------------------------------------------------------


void __fastcall TFormMain::ItemSettingClick(TObject *Sender)
{
    bool bSave=bSetTopMostByMsg;
    bSetTopMostByMsg=false;
    TFormSetting *pForm=new TFormSetting(NULL);
    pForm->ShowModal();
    delete pForm;
    bSetTopMostByMsg=bSave;

}
//---------------------------------------------------------------------------

void __fastcall TFormMain::N3Click(TObject *Sender)
{
    Close();

}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ItemInfoClick(TObject *Sender)
{
    bool bSave=bSetTopMostByMsg;
    bSetTopMostByMsg=false;
    TFormUserInfo *pForm=new TFormUserInfo(NULL);
    pForm->ShowModal();
    delete pForm;
    bSetTopMostByMsg=bSave;
}
//---------------------------------------------------------------------------





void __fastcall TFormMain::ItemSelAllClick(TObject *Sender)
{
    for(int i=0;i<clbMan->Items->Count;i++)
    {
        clbMan->Checked[i]=true;
    }

}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ItemCancelSelAllClick(TObject *Sender)
{
    for(int i=0;i<clbMan->Items->Count;i++)
    {
        clbMan->Checked[i]=false;
    }
}
//---------------------------------------------------------------------------


void __fastcall TFormMain::SpeedButton2Click(TObject *Sender)
{
	ShowMessage("选择修改IP表，将用户名称和主机名称或IP地址添加，再刷新IP表！");
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::btnClearContentClick(TObject *Sender)
{
    lvMsg->Items->Clear();
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ItemAboutClick(TObject *Sender)
{
    ShowMessage("Last Modify:  2001.03.03  Dodo\nLover:\tTable Of In My Hart\nDo YOu Love Me?\nCopyright@ Zbin 2001\n");
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::SpeedButton3Click(TObject *Sender)
{
        if(plIpList->Visible)
            plIpList->Visible=false;
        else
            plIpList->Visible=true;
}

//---------------------------------------------------------------------------

void __fastcall TFormMain::FormCreate(TObject *Sender)
{
    TFormLog *pForm=new TFormLog(NULL);
    pForm->ShowModal();
    delete pForm;
}
//---------------------------------------------------------------------------


