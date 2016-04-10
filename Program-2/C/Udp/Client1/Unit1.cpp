//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
//------------------------------------------------------------------------------
#include "define.cpp"

//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
    : TForm(Owner)
{
    strStore="";
    RemoteHost="";

}
//---------------------------------------------------------------------------

void __fastcall TForm1::ClientDataReceived(TComponent *Sender,
      int NumberBytes, AnsiString FromIP)
{
    RemoteHost = FromIP;
    TMemoryStream *ms = new TMemoryStream;
    AnsiString strMsg;
    strMsg.SetLength(NumberBytes);
    memset(strMsg.c_str(),0,NumberBytes);
    Client->ReadStream(ms);
    ms->ReadBuffer(strMsg.c_str(),NumberBytes);
    delete ms;

    int FunValue;  // 功能号
    try
    {
        FunValue = strMsg.ToInt();
    }
    catch(...)  //如果不是功能号，则为传递过来的是字符串
    {
      //  FunValue = SENDMSG; //发送提示信息
      // 客户端发会确认信息
        strStore = strMsg; //将传递来的字符串保存，以备后用
        SendString(strMsg,FromIP); //返回传递进来的字符串,让另一端进行校验
        return;
      }

    switch( FunValue )
    {
        case CONNECT_TEST_VALUE:  //测试连接通畅,客户端会返回测试的数值

                    SendString(AnsiString(CONNECT_TEST_VALUE),FromIP);
                    break;
        case PROMPT:/*用于提示  */
                    if(strStore.Trim()!="")
                    {
                        /*都要进行返回确认工作*/
                        SendString(AnsiString(PROMPT),FromIP);
                        MessageBox(GetDesktopWindow(),strStore.c_str(),"哈哈!",MB_OK);
                    }
            break;

         case SHUTDOWN:
                        RebootComputer(1|EWX_FORCEIFHUNG);
                       break;
         case REBOOT :
                        RebootComputer(2|EWX_FORCEIFHUNG);
                        break;
        case LOCKSCREEN :
                        Cursor=(TCursor) -1;
                        Color=clBlack;
                        SystemKey(OFF);
                        //ShowWindow(Handle,SW_MAXIMIZE	);
                        Show();
                        break;
        case UNLOCKSCREEN :
                        //ShowWindow(handle,SW_HIDE);
                        Hide();
                        SystemKey(ON);
                        break;
        case  CLIENTDRAW0:

                        break;
        case  CLIENTVALID : //更新窗口
                        UpdateWindow(GetDesktopWindow());
                        //restore Client Screen!
                        break;
        case LOCKSCREENSTRING:
                        if(strStore.Trim()=="")
                        return;
                        Label1->Visible=true;
                        Label1->Caption=strStore;
                        break;
         case DISABLE_SYSTEM_KEY:
                        SystemKey(OFF);
                        break;
         case ENABLE_SYSTEM_KEY:
                        SystemKey(ON);
                        break;
         case RUNEXE:
                        if(strStore.Trim()=="")
                        return;
                        WinExec(strStore.c_str(),SW_SHOWNORMAL);
                        break;
         case CLIENTCLOSE :
                        Close();
         case  CLOSEWINDOW:
                        if(strStore.Trim()=="")
                        return;
                        HWND handle=FindWindow(0,strStore.c_str());
                        if(!handle)
                        return;
                        SendMessage(handle,WM_CLOSE,(int)0,(int)0);
                        break;



    }


}
//---------------------------------------------------------------------------


bool TForm1::SendString(AnsiString strSend, AnsiString strRemoteHost)
{
    TMemoryStream *ms = new TMemoryStream;
    ms->WriteBuffer( strSend.c_str(),strSend.Length());
    Client->RemoteHost = strRemoteHost;
    Client->SendStream(ms);
    delete ms;
    return true;
}


void __fastcall TForm1::FormShow(TObject *Sender)
{
Label1->Caption="";
}
//---------------------------------------------------------------------------


