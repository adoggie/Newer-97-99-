//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
#include "Control.h"
#include "connect.h"
#include "sysdm.h"
#include "define.cpp"
#include "shellapi.h"
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
}
//---------------------------------------------------------------------------



#include "unit2.h"
#include "unit3.h"
void __fastcall TFormMain::FormShow(TObject *Sender)
{
	Form1=new TForm1(this);
	Form3=new TForm3(this);
	Form3->ShowModal();
	Init();
	HWND Me=Handle;
	RECT rc;
	/*
	int x=GetSystemMetrics(SM_CXSCREEN);
	int y=GetSystemMetrics(SM_CYSCREEN);
	GetWindowRect(Me,&rc);
	TRect m_rc(rc);
   */
   //	SetWindowPos(Me,HWND_TOPMOST,(x-m_rc.Width())/2,(y-m_rc.Height())/2,m_rc.Width(),m_rc.Height(),SWP_SHOWWINDOW);

  memoReturn->Lines->Clear();
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

//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------

void TFormMain::AddList()
{
  AnsiString strFile=ExtractFilePath(Application->ExeName)+"ip.txt";

  TStringList *listFile=new TStringList;
  try{
  listFile->LoadFromFile(strFile);
  }
  catch(...) {return;}
  AnsiString strTmp;
  AnsiString strSub1,strSub2;
    clbMan->Items->Clear();
    clbMan->Items->Add("所有人");
    for(int i=0;i<listFile->Count;i++)
    {
      if(listFile->Strings[i].Trim()=="") continue;
      strTmp=listFile->Strings[i].Trim();
      int intPos=strTmp.AnsiPos(" ");
      if(intPos==0) continue;
      strSub1=strTmp.SubString(1,intPos-1);
      strSub2=strTmp.SubString(intPos,strTmp.Length());

      clbMan->Items->Add(strSub1+"  "+strSub2);

    }
}




void __fastcall TFormMain::clbManClick(TObject *Sender)
{
    if(clbMan->Checked[0])
    for(int i=1;i<clbMan->Items->Count;i++)
    {
        clbMan->Checked[i]=clbMan->Checked[0];
    }

}
//---------------------------------------------------------------------------

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

    strMsg=strMsg.Trim();

    if(strMsg.Length()<strFlag.Length())
        {
        memoReturn->Lines->Add(strMsg);
        SendString(strFlag+strComputerName ,FromIP);
        Alert();
        }
    if(strMsg.SubString(1,strFlag.Length())==strFlag)
        memoReturn->Lines->Add(strMsg.SubString(strFlag.Length()+1,strMsg.Length()-strFlag.Length())+\
                                AnsiString("   ")+ FromIP+"  接受到消息！");

    else
        {
        memoReturn->Lines->Add(strMsg);
        SendString(strFlag+strComputerName ,FromIP);
        Alert();
        }
        }
        catch(...)
        {}


}
void TFormMain::Alert()
{
 // SendMessage(Handle,WM_SYSCOMMAND,SC_MAXIMIZE,0);
    ShowWindow(Handle,SW_RESTORE );
    SetFocus();
    HWND Me=Handle;
    RECT rc;
	int x=GetSystemMetrics(SM_CXSCREEN);
	int y=GetSystemMetrics(SM_CYSCREEN);
	GetWindowRect(Me,&rc);
	TRect m_rc(rc);
    if(CheckBox3->State==cbChecked)
    {
    SetWindowPos(Me,HWND_TOPMOST,(x-m_rc.Width())/2,(y-m_rc.Height())/2,m_rc.Width(),m_rc.Height(),SWP_SHOWWINDOW);
    SetWindowPos(Me,HWND_NOTOPMOST,(x-m_rc.Width())/2,(y-m_rc.Height())/2,m_rc.Width(),m_rc.Height(),SWP_SHOWWINDOW);
    SetFocus();
    }


   //	SetWindowPos(Me,HWND_TOPMOST,(x-m_rc.Width())/2,(y-m_rc.Height())/2,m_rc.Width(),m_rc.Height(),SWP_SHOWWINDOW);
   // CheckBox1->Checked=true;

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
    if(CheckBox1->State==cbChecked)
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
    CheckBox1->Checked=true;
    TForm::Dispatch(&msg);
    
}


void __fastcall TFormMain::FormPaint(TObject *Sender)
{
 CheckBox1->Checked=true;
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
   edtMsg->Items->LoadFromFile("info.txt");
   }
   catch(...)
   {return;}
}
//---------------------------------------------------------------------------


void __fastcall TFormMain::tGlintText1Click(TObject *Sender)
{
	ShowMessage("选择修改IP表，将用户名称和主机名称或IP地址添加，再刷新IP表！");	
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::BitBtn1Click(TObject *Sender)
{
	memoReturn->Lines->Clear();
}
//---------------------------------------------------------------------------


void __fastcall TFormMain::btnRefreshIpClick(TObject *Sender)
{
    AddList();	
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
    ShowMessage("Empty Msg!");
    edtMsg->SetFocus();
        edtMsg->SelectAll();
    return;
    }
    AnsiString strTmp;
    AnsiString strSub1,strSub2;
    for(int i=1;i<clbMan->Items->Count;i++)
    {
        if(!clbMan->Checked[i]) continue;
        strTmp=clbMan->Items->Strings[i].Trim();
        int intPos=strTmp.AnsiPos(" ");

        strSub1=strTmp.SubString(1,intPos-1).Trim();
        strSub2=strTmp.SubString(intPos,strTmp.Length()).Trim();

        if(CheckBox4->State==cbChecked	)
        {
        memoReturn->Lines->Add("["+strComputerName+"] 对 ["+strSub1+"] 说: "+edtMsg->Text.Trim() );
        }
        SendString( strComputerName+ AnsiString(" 说: ")+edtMsg->Text.Trim()  , strSub2);
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


