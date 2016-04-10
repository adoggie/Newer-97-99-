
#ifndef DIRDLG_H
#define DIRDLG_H

#include <vcl.h>
#include <memory>
#include <shlobj.h>

//////////////////////////////////////////////////////////////////////
//
// CShellBrowser
//

class tDirDlg
{
public:

	tDirDlg(  HWND hParent,  AnsiString  strTitle);
	~tDirDlg() {};

        AnsiString GetPath();
	//
	// Set the handle of the owner window for the dialog box.
	//
	void SetOwner(  HWND hwndOwner);
        static AnsiString  m_strPath;
	//


protected:
	virtual void OnInit() ;

        void OnSelChanged(const LPITEMIDLIST pidl) ;


	void EnableOK(const bool bEnable);


	void SetStatusText( AnsiString & strText) ;

private:
	static int __stdcall BrowseCallbackProc(HWND hwnd, UINT uMsg, LPARAM lParam, LPARAM lpData);
	BROWSEINFO m_bi;
	char m_szSelected[MAX_PATH];

	HWND m_hwnd;  //--->为目录选择窗口句柄
};

AnsiString tDirDlg::m_strPath="";

#endif // __SHELLBROWSER_H__
