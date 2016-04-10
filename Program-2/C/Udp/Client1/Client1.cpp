//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("Client1.res");
USEFORM("Unit1.cpp", Form1);
USEUNIT("define.cpp");
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
    try
    {
         Application->Initialize();
         Application->CreateForm(__classid(TForm1), &Form1);
         Application->ShowMainForm=false;
         Application->Run();
    }
    catch (Exception &exception)
    {
         Application->ShowException(&exception);
    }
    return 0;
}
//---------------------------------------------------------------------------
