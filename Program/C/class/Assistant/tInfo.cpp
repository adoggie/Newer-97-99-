//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "tInfo.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)


/*========================
        ϵͳ���һЩ����
==========================      */

        typedef enum {ON=0,OFF=1} STATUS;
        typedef int STARTMODE;
// {EWX_FORCE=4, /*�ر����г����������û���ݵ�¼*/
 //             EWX_LOGOFF=0, //����������������л���MS-DOS��ʽ
 //             EWX_REBOOT=2, //�������������
  //            EWX_SHUTDOWN=1 //�رռ����
  //            } STARTMODE;

//����ʱ��How��ֵ����������EWX_SHUTDOWN�������������������
//ExitWindowsEx(How,0);


class tInfo{
public:
        //����ϵͳ���Ƿ���ã��� alt+ctrl+del ��
        static bool SystemKey(STATUS st);
        //�رա����µ�½����������
        bool RebootComputer(STARTMODE sm){ExitWindowsEx(sm,0);return true;}
        //�жϵ�ǰ����Ƿ���ĳ�ؼ����Ϸ�
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

       ����ǰĿ¼�µ��ļ���ӵ������б����

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

