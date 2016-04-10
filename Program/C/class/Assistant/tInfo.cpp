//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "tInfo.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)


/*========================
        系统类的一些函数
==========================      */

        typedef enum {ON=0,OFF=1} STATUS;
        typedef int STARTMODE;
// {EWX_FORCE=4, /*关闭所有程序并以其他用户身份登录*/
 //             EWX_LOGOFF=0, //重新启动计算机并切换到MS-DOS方式
 //             EWX_REBOOT=2, //重新启动计算机
  //            EWX_SHUTDOWN=1 //关闭计算机
  //            } STARTMODE;

//运行时给How赋值，让他等于EWX_SHUTDOWN或其他，调用以下语句
//ExitWindowsEx(How,0);


class tInfo{
public:
        //设置系统键是否可用，如 alt+ctrl+del 等
        static bool SystemKey(STATUS st);
        //关闭、从新登陆、重起计算机
        bool RebootComputer(STARTMODE sm){ExitWindowsEx(sm,0);return true;}
        //判断当前鼠标是否在某控件的上方
            };



bool tInfo::SystemKey(STATUS st)
{
//int temp;
        switch(st)
        {
        case OFF:
        SystemParametersInfo(SPI_SCREENSAVERRUNNING,1,(PVOID)0,0);
        break;
        case ON:
        SystemParametersInfo(SPI_SCREENSAVERRUNNING  ,0,(PVOID)0,0);
        break;
        default:;
        }

        return true;

}


bool IsCursorInControl(/*HWND parent,*/ TWinControl *control)
{
        POINT pt;
        GetCursorPos(&pt);
        RECT rc;
        GetWindowRect( control->Handle,&rc);
        if(PtInRect(&rc,pt))
        return true;
        else
        return false;
}




/*==================================

       将当前目录下的文件添加到下拉列表框中

====================================*/


void LoadFileToComboBox(TComboBox *Box,AnsiString Str)
{

        GetCurrentDir();
        TSearchRec sr;
        if(!FindFirst(GetCurrentDir() +"\\"+Str,faAnyFile,sr))
        {
        Box->Items->Add(sr.Name);
        }
        while(!FindNext(sr))
        {
        Box->Items->Add(sr. Name);

        }
        FindClose(sr);


}

