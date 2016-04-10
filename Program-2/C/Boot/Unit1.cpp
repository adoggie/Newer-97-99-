//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Timer1Timer(TObject *Sender)
{
    CreateMutex(0,true,"flag");
    if(GetLastError()==ERROR_ALREADY_EXISTS)
    return;
if(FileExists("Server.exe"))
{

    WinExec("server.exe",SW_NORMAL);
}
}
//---------------------------------------------------------------------------
 
