//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "tWindow.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)



void CenterWindow(HWND Me)
{

RECT rc;
int x=GetSystemMetrics(SM_CXSCREEN);
int y=GetSystemMetrics(SM_CYSCREEN);
GetWindowRect(Me,&rc);
TRect m_rc(rc);
SetWindowPos(Me,HWND_NOTOPMOST,(x-m_rc.Width())/2,(y-m_rc.Height())/2,m_rc.Width(),m_rc.Height(),SWP_SHOWWINDOW);

}

void SetWindowTopMost(HWND Me)
{
RECT rc;
GetWindowRect(Me,&rc);
SetWidnowPos(Me,HWND_TOPMOST,rc.Left,rc.Top,rc.Width(),rc.Height(),SWP_SHOWWINDOW);


}
