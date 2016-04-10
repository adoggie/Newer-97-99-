//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("MasterCtr.res");
USEFORM("Control.cpp", FormMain);
USEUNIT("define.cpp");
USEFORM("Unit2.cpp", Form1);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
    try
    {
          
        CreateMutex(NULL, true, "ScreenSaver");
        if(GetLastError()==ERROR_ALREADY_EXISTS)
         Application->Terminate();
         Application->Initialize();
         Application->CreateForm(__classid(TFormMain), &FormMain);
         Application->Run();
    }
    catch (Exception &exception)
    {
         Application->ShowException(&exception);
    }
    return 0;
}
//---------------------------------------------------------------------------
