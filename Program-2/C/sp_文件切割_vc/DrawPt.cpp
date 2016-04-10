// DrawPt.cpp: implementation of the CDrawPt class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "sp.h"
#include "DrawPt.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////
CDrawPt::CDrawPt(CWnd *p)
{
	m_screen.left=m_screen.top=0;
	m_screen.right=::GetSystemMetrics(SM_CXSCREEN);
	m_screen.bottom=::GetSystemMetrics(SM_CYSCREEN);
	 parent=p;
	desk=CWnd::GetDesktopWindow();
DeskDC=desk->GetDC();

}

CDrawPt::~CDrawPt()
{

}

void CDrawPt::Draw()
{
	m_r=rand() % 4;
	m_pt.x=rand() % m_screen.Width();
	m_pt.y=rand() % m_screen.Height();
	m_color=RGB(rand() %255,rand() %255,rand() % 255);
	
	m_area.top=m_pt.y-m_r;
	m_area.left=m_pt.x-m_r;
	m_area.bottom=m_pt.y+m_r;
	m_area.right=m_pt.x+m_r;

if(( (CSpDlg *)parent)->m_rc.PtInRect(m_pt))
	return;
	CBrush br(m_color);
//	CClientDC dc(desk);
/*
	m_area.top=0;
m_area.left=0;
m_area.bottom=200;
m_area.right=300;
*/
  HDC d=::GetDC(0);
CDC *dc=CDC::FromHandle(d);

dc->FillRect(&m_area,&br);
//		AfxMessageBox("tim12212e");

	

}
