//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("Report1.res");
USEFORM("Unit1.cpp", Form1);
USEFORM("Unit2.cpp", dm); /* TDataModule: DesignClass */
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
        try
        {
                 Application->Initialize();
                 Application->CreateForm(__classid(TForm1), &Form1);
                 Application->CreateForm(__classid(Tdm), &dm);
                 Application->Run();
        }
        catch (Exception &exception)
        {
                 Application->ShowException(&exception);
        }
        return 0;
}
//---------------------------------------------------------------------------
