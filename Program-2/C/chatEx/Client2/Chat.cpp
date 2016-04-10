//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("Chat.res");
USEFORM("Control.cpp", FormMain);
USEUNIT("define.cpp");
USEFORM("Unit2.cpp", Form1);
USEFORM("Unit3.cpp", Form3);
USEFORM("OptSetting.cpp", Form4);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
    try
    {
          
		//CreateMutex(NULL, true, "ScreenSaver");
		//if(GetLastError()==ERROR_ALREADY_EXISTS)
		 //Application->Terminate();
		Application->Initialize();
		Application->CreateForm(__classid(TFormMain), &FormMain);
		Application->CreateForm(__classid(TForm3), &Form3);
		Application->CreateForm(__classid(TForm4), &Form4);
		Application->Run();
    }
    catch (Exception &exception)
    {
         Application->ShowException(&exception);
    }
    return 0;
}
//---------------------------------------------------------------------------
