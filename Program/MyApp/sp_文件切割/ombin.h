#if !defined(AFX_OMBIN_H__07AD22D2_543C_11BD_BD3F_AB092516E40F__INCLUDED_)
#define AFX_OMBIN_H__07AD22D2_543C_11BD_BD3F_AB092516E40F__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// ombin.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// Combin dialog

class Combin : public CDialog
{
// Construction
public:
//	CSpinButtonCtrl UpDown;
CButton _Combin,Delete,Append,Up,Down;
CListBox Files;
	void PostNcDestroy( );
	Combin(CWnd* pParent = NULL);   // standard constructor


	// Dialog Data
	//{{AFX_DATA(Combin)
//	enum { IDD = _UNKNOWN_RESOURCE_ID_ };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(Combin)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	afx_msg void OnCombin();
	afx_msg void OnDelete();
	afx_msg void OnDown();
	afx_msg void OnUp();
	afx_msg void OnSelectChange();
	afx_msg void OnAppend();
	CWnd * p;

	// Generated message map functions
	//{{AFX_MSG(Combin)
	virtual BOOL OnInitDialog();
	afx_msg HBRUSH OnCtlColor(CDC* pDC, CWnd* pWnd, UINT nCtlColor);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_OMBIN_H__07AD22D2_543C_11BD_BD3F_AB092516E40F__INCLUDED_)
