// Counter.cpp: implementation of the CCounter class.
//
//////////////////////////////////////////////////////////////////////
//----��ʱ����CALC ���ŵ�ʱ��
//	Start()   ��ʼ��ʱ
//	End()     ������ʱ
//	__int64 GetTime() �õ�����ʱ��  ��
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
