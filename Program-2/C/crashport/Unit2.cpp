//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "Unit2.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#include "unit1.h"

bool SendString(AnsiString strSend, AnsiString strRemoteHost)
 {

    TMemoryStream *ms = new TMemoryStream;
    try{
    ms->WriteBuffer( strSend.c_str(),strSend.Length());
    Form1->UdpClient->RemoteHost = strRemoteHost;
    Form1->UdpClient->SendStream(ms);
    //delete ms;
    }
    catch(...)
    {

    }
    delete ms;
    return true;
}



void __fastcall MyThread::Execute()
{

   for(;;)
   {
     SendString("fuck you","192.168.2.157");
   }

}

