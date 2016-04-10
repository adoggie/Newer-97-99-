//////////////////////////////////////////////////////////////////////
//
// ShellBrowser.cpp: implementation of the CShellBrowser class.
//


#include "DirDlg.h"



tDirDlg::tDirDlg( HWND hParent, AnsiString  strTitle)
{
	m_hwnd = NULL;
	SetOwner(hParent);

        m_bi.lpszTitle = strTitle.c_str();
        m_bi.ulFlags=BIF_RETURNONLYFSDIRS|BIF_STATUSTEXT;
        m_bi.pidlRoot=NULL;
	m_bi.lpfn = BrowseCallbackProc;
	m_bi.lParam=(long)this; //他的值将在CallBack函数的lData参数中取出
	m_bi.pszDisplayName ="";
}


//////////////////////////////////////////////////////////////////////
//
// Implementation
//

void tDirDlg::SetOwner(const HWND hwndOwner)
{
	if (m_hwnd != NULL)
		return;

	m_bi.hwndOwner = hwndOwner;

}

AnsiString  tDirDlg::GetPath()
{


	LPITEMIDLIST pidl;
	if (SHBrowseForFolder(&m_bi) != NULL)
	{
		LPMALLOC pMalloc;
		//Retrieve a pointer to the shell's IMalloc interface
		if (SUCCEEDED(SHGetMalloc(&pMalloc)))
		{
			// free the PIDL that SHBrowseForFolder returned to us.
			pMalloc->Free(pidl);
			// release the shell's IMalloc interface
			(void)pMalloc->Release();
		}

        return m_strPath;
	}

        return AnsiString("NOSELECT");

}

long PrevProc;
LRESULT CALLBACK zbin(HWND hwnd,UINT msg,WPARAM wParam,LPARAM lParam)
{
  if(msg==WM_COMMAND)
  { ShowMessage("commadn");
   if(HIWORD(wParam)==IDCANCEL)
   {
    tDirDlg::m_strPath="";

   }
  }
        return DefWindowProc(hwnd,msg,wParam,lParam);
  // return CallWindowProc(PrevProc,hwnd,msg,wParam,lParam);
        return 0;
}

void tDirDlg::OnInit()
{
        SetWindowText(m_hwnd,"选择目录  -->zbin");
        //PrevProc=SetWindowLong(m_hwnd,GWL_WNDPROC,(long)zbin);
}

void tDirDlg::OnSelChanged(  LPITEMIDLIST pidl)
{
SHGetPathFromIDList(pidl,m_szSelected);
m_strPath=m_szSelected;
SetStatusText(m_strPath);
}

void tDirDlg::EnableOK( bool bEnable)
{
	if (m_hwnd == NULL)
		return;

(void)SendMessage(m_hwnd, BFFM_ENABLEOK, static_cast<WPARAM>(bEnable), NULL);
}




void tDirDlg::SetStatusText(AnsiString & strText)
{
	if (m_hwnd == NULL)
		return;
(void)SendMessage(m_hwnd, BFFM_SETSTATUSTEXT, NULL, (long)strText.c_str());
}

int __stdcall tDirDlg::BrowseCallbackProc(HWND hwnd, UINT uMsg, LPARAM lParam, LPARAM lpData)
{
	tDirDlg* pbff =(tDirDlg*)lpData;
	pbff->m_hwnd = hwnd;
	if (uMsg == BFFM_INITIALIZED)
		pbff->OnInit();
	else if (uMsg == BFFM_SELCHANGED)
		pbff->OnSelChanged((LPITEMIDLIST)lParam);
                //the item identifier list for the newly selected folder

	return 0;
}
