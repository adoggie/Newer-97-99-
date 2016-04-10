//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "sysdm.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TDM *DM;
//------------------------------------------------------------------------------
#include "connect.h"
#include "control.h"
#include "define.cpp"
//---------------------------------------------------------------------------
__fastcall TDM::TDM(TComponent* Owner)
    : TDataModule(Owner)
{
    LastSendMsg="";

}
//---------------------------------------------------------------------------
void __fastcall TDM::MasterDataReceived(TComponent *Sender,
      int NumberBytes, AnsiString FromIP)
{
    TMemoryStream *ms = new TMemoryStream;
    AnsiString strMsg;
    strMsg.SetLength(NumberBytes);
    memset(strMsg.c_str(),0,NumberBytes);
    Master->ReadStream(ms);
    ms->ReadBuffer(strMsg.c_str(),NumberBytes);
    delete ms;

    int FunValue;  // 功能号
    try
    {
        FunValue = strMsg.ToInt();
    }
    catch(...)
    {
      //  FunValue = SENDMSG; //发送提示信息
      // 客户端发会确认信息
      //发送消息时，编辑框中的消息字符串

      /* 判断回传的字符串与编辑框中发送给客户端的消息是否一致？ */
      if( FormMain->edtMsg->Text.Trim()==strMsg.Trim())
      {
         FormMain->StatusBar1->Panels->Items[1]->Text="信息成功传送到客户机上存储！请选择操作！";
        /*
        MessageBox(FormMain->Handle,\
        "信息成功传送到客户机上存储！请选择操作！",\
        "Happy!",MB_OK);
        */
        return;
      }
    }
    switch( FunValue )
    {
        case CONNECT_TEST_VALUE:  //测试连接通畅,客户端会返回测试的数值
                FormConnect->Memo1->Lines->Add ( " 连接到 " + FromIP + "  成功.. "\
                                            + Date().DateTimeString());
                FormMain->RemoteHost=FromIP;
                FormMain->ShowRemoteHost(); // 状态栏中显示客户机IP
            break;
       case PROMPT:
                FormMain->StatusBar1->Panels->Items[1]->Text="客户机已成功执行消息框提示！";
               /* MessageBox(FormMain->Handle,\
                "客户机已成功执行消息框提示！",\
                "Happy!",MB_OK);
               */
                break;
        default: ;

    }


}
//---------------------------------------------------------------------------


bool TDM::SendString(AnsiString strSend, AnsiString strRemoteHost)
{
   TMemoryStream *ms = new TMemoryStream;
    ms->WriteBuffer( strSend.c_str(),strSend.Length());
    Master->RemoteHost = strRemoteHost;
    Master->SendStream(ms);
    delete ms;
    return true;
}

