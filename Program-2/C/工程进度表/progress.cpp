//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

USERES("progress.res");
USEFORM("Progressor.cpp", Form1);
USEUNIT("include\tCurProject.cpp");
USEUNIT("include\tInputArea.cpp");
USEFORM("Unit2.cpp", Form2);
USEFORM("Unit3.cpp", Form3);
USEUNIT("include\common.cpp");
USEUNIT("tLine.cpp");
USEUNIT("tRect.cpp");
USEUNIT("tText.cpp");
USEUNIT("tTextRect.cpp");
USEUNIT("include\tTable.cpp");
USEUNIT("tProgressBar.cpp");
USEUNIT("include\tRow.cpp");
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
        try
        {
                 Application->Initialize();
                 Application->CreateForm(__classid(TForm1), &Form1);
                 Application->CreateForm(__classid(TForm3), &Form3);
                 Application->CreateForm(__classid(TForm2), &Form2);
                 Application->Run();
        }
        catch (Exception &exception)
        {
                 Application->ShowException(&exception);
        }
        return 0;
}
//---------------------------------------------------------------------------
