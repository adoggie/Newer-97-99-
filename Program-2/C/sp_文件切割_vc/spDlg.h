// spDlg.h : header file
//

#if !defined(AFX_SPDLG_H__1E233449_5437_11BD_BD57_CD2055293E02__INCLUDED_)
#define AFX_SPDLG_H__1E233449_5437_11BD_BD57_CD2055293E02__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
//#include <mmsystem.h>
#include "splitfille.h"
/////////////////////////////////////////////////////////////////////////////
// CSpDlg dialog
//#include <mmsystem.h>
#include "ombin.h"
#include "drawpt.h"
class CSpDlg : public CDialog
{
// Construction
public:
	BOOL ChildVisible;
	Combin *dlg;

	CSpDlg(CWnd* pParent=NULL  );	// standard constructor
   SplitFile *ds[100];
CRect m_rc;
long SplitSize;
// Dialog Data
	//{{AFX_DATA(CSpDlg)
	enum { IDD = IDD_SP_DIALOG };
	CEdit	m_splitsize;
	int		m_size1;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSpDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	afx_msg UINT OnNcHitTest( CPoint point );
	afx_msg void OnContextMenu(CWnd*, CPoint point);
	void Init();
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CSpDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnButton1();
	afx_msg void OnButton2();
	afx_msg void OnButton3();
	afx_msg HBRUSH OnCtlColor(CDC* pDC, CWnd* pWnd, UINT nCtlColor);
	afx_msg void OnRadio3();
	afx_msg void OnRadio1();
	afx_msg void OnRadio2();
	afx_msg void OnButton4();
	afx_msg void OnMove(int x, int y);
	afx_msg void OnButton5();
	afx_msg void OnTimer(UINT nIDEvent);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SPDLG_H__1E233449_5437_11BD_BD57_CD2055293E02__INCLUDED_)
