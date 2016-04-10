// DrawPt.h: interface for the CDrawPt class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_DRAWPT_H__B5A4CF61_3ECE_11C6_8911_5254AB122F77__INCLUDED_)
#define AFX_DRAWPT_H__B5A4CF61_3ECE_11C6_8911_5254AB122F77__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
#include "spdlg.h"
class CDrawPt  
{
public:
	CWnd * parent;
	 CWnd *desk;
	void Draw();
	CDrawPt(CWnd *p);
	virtual ~CDrawPt();
CPoint m_pt;
int m_r;
CDC *DeskDC;
	CRect m_area;
COLORREF m_color;
protected:
	CRect m_screen;
};

#endif // !defined(AFX_DRAWPT_H__B5A4CF61_3ECE_11C6_8911_5254AB122F77__INCLUDED_)
