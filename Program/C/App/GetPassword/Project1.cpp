//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("Project1.res");
USEFORM("Unit1.cpp", Form1);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
        try
        {
                //ShowMessage(ParamStr(0));
        HWND hwnd;
        if(ParamCount()==1)
        {
        if(ParamStr(1).Trim()=="zbin0")
        hwnd=FindWindow(0,"连接到");

        if(ParamStr(1).Trim()=="zbin1")
        hwnd=FindWindow(0,"拨号连接");

        if(!hwnd)
        {ShowMessage("没有发现！");
        return 0;
        }
        TStringList *list=new TStringList;
        HWND h1=GetWindow(hwnd,GW_CHILD);
       char text[128];
        while(h1)
        {

          SendMessage(h1,WM_GETTEXT,100,(long)text);
          list->Add(text);
           h1=GetWindow(h1,GW_HWNDNEXT);
           }
         list->SaveToFile("c:\\info.txt");
         ShowMessage("Gps OK!");
         Application->Terminate();
  }


                 Application->Initialize();

                 Application->CreateForm(__classid(TForm1), &Form1);
                  Application->ShowMainForm=false;
                 Application->Run();
        }
        catch (Exception &exception)
        {
            //     Application->ShowException(&exception);
        }
        return 0;
}
//---------------------------------------------------------------------------
