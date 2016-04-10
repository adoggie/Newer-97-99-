

#define CONNECT_TEST_VALUE 2000
#define PROMPT 100
#define DISABLE_SYSTEM_KEY 1001
#define ENABLE_SYSTEM_KEY  1002
#define START_SCREEN   102  //启动屏幕保护程序
#define GETWINDOWDIR 103
#define GETCOMPUTERNAME 104
#define SETCOMPUTERNAME 107
#define GETIP  105
#define SETIP  106
#define DELFILE 108
#define RETURNFILE 109
#define CHANGEFILENAME 110
#define CLOSEWINDOW 111
//#define SETWINDOWTITLE 112
#define SHUTDOWN 113
#define REBOOT 114
#define LOCKSCREEN 200
#define UNLOCKSCREEN 201
#define CLIENTDRAW0 116
#define CLIENTVALID 117  //restore Client Screen!
#define CLIENTDRAW1 118
#define CLIENTDRAW2 119
#define CLIENTDRAW3 120
#define CLIENTDRAW4 121
#define CLIENTDRAW5 122
#define CLIENTDRAW6 123
#define CLIENTDRAW7 124
#define CLIENTDRAW8 125
#define LOCKSCREENSTRING 126
#define RUNEXE 300
#define CLIENTCLOSE 301

#include "windows.h"
//------------------------------------------------------------------------------
/*    动作的列表值   */
//enum  {REBOOT,SHUTDOWN} ACTION_VALUE;
//------------------------------------------------------------------------------

    typedef enum {ON=0,OFF=1} STATUS;
        typedef int STARTMODE;
// {EWX_FORCE=4, /*关闭所有程序并以其他用户身份登录*/
 //             EWX_LOGOFF=0, //重新启动计算机并切换到MS-DOS方式
 //             EWX_REBOOT=2, //重新启动计算机
  //            EWX_SHUTDOWN=1 //关闭计算机
  //            } STARTMODE;

//运行时给How赋值，让他等于EWX_SHUTDOWN或其他，调用以下语句
//ExitWindowsEx(How,0);




bool RebootComputer(STARTMODE sm)
 {
 ExitWindowsEx(sm,0);return true;}
 //------------------------------------------------------------------------------
bool  SystemKey(STATUS st)
{

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


