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

    int FunValue;  // ���ܺ�
    try
    {
        FunValue = strMsg.ToInt();
    }
    catch(...)
    {
      //  FunValue = SENDMSG; //������ʾ��Ϣ
      // �ͻ��˷���ȷ����Ϣ
      //������Ϣʱ���༭���е���Ϣ�ַ���

      /* �жϻش����ַ�����༭���з��͸��ͻ��˵���Ϣ�Ƿ�һ�£� */
      if( FormMain->edtMsg->Text.Trim()==strMsg.Trim())
      {
         FormMain->StatusBar1->Panels->Items[1]->Text="��Ϣ�ɹ����͵��ͻ����ϴ洢����ѡ�������";
        /*
        MessageBox(FormMain->Handle,\
        "��Ϣ�ɹ����͵��ͻ����ϴ洢����ѡ�������",\
        "Happy!",MB_OK);
        */
        return;
      }
    }
    switch( FunValue )
    {
        case CONNECT_TEST_VALUE:  //��������ͨ��,�ͻ��˻᷵�ز��Ե���ֵ
                FormConnect->Memo1->Lines->Add ( " ���ӵ� " + FromIP + "  �ɹ�.. "\
                                            + Date().DateTimeString());
                FormMain->RemoteHost=FromIP;
                FormMain->ShowRemoteHost(); // ״̬������ʾ�ͻ���IP
            break;
       case PROMPT:
                FormMain->StatusBar1->Panels->Items[1]->Text="�ͻ����ѳɹ�ִ����Ϣ����ʾ��";
               /* MessageBox(FormMain->Handle,\
                "�ͻ����ѳɹ�ִ����Ϣ����ʾ��",\
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

