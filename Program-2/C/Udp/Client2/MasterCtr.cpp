//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("MasterCtr.res");
USEFORM("Control.cpp", FormMain);
USEFORM("sysdm.cpp", DM); /* TDataModule: DesignClass */
USEFORM("connect.cpp", FormConnect);
USEUNIT("define.cpp");
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
    try
    {
         Application->Initialize();
         Application->CreateForm(__classid(TFormMain), &FormMain);
         Application->CreateForm(__classid(TDM), &DM);
         Application->CreateForm(__classid(TFormConnect), &FormConnect);
         Application->Run();
    }
    catch (Exception &exception)
    {
         Application->ShowException(&exception);
    }
    return 0;
}
//---------------------------------------------------------------------------
