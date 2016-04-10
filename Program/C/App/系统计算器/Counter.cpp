// Counter.cpp: implementation of the CCounter class.
//
//////////////////////////////////////////////////////////////////////
//----计时器：CALC 流逝的时间
//	Start()   开始计时
//	End()     结束计时
//	__int64 GetTime() 得到流逝时间  秒
//////////////////////////////////////////   
//	Author: zbin
//	Time: 2000-05-09
//	API:	
//			QueryPerformanceCounter(LARGE_INTEGER *)
//			QueryPerformanceFrequency(LARGE_INTEGER *)
/////////////////////////////////////////////
#include "stdafx.h"
#include "001.h"
#include "Counter.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CCounter::CCounter()
{
	::QueryPerformanceFrequency(&m_frequency);

}

CCounter::~CCounter()
{

}

void CCounter::Start()
{
	::QueryPerformanceCounter(&m_start);
}

void CCounter::End()
{
	::QueryPerformanceCounter(&m_end);
	m_time =(m_end.QuadPart-m_start.QuadPart)/m_frequency.QuadPart;
}

__int64 CCounter::GetTime()
{
return m_time;
}

void CCounter::Show()
{
CString str;
str.Format("Time is : %d ",m_time);
AfxMessageBox(str);

}
