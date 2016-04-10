// Counter.h: interface for the CCounter class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_COUNTER_H__763F9ED0_AA67_11D2_87ED_5254AB1691D0__INCLUDED_)
#define AFX_COUNTER_H__763F9ED0_AA67_11D2_87ED_5254AB1691D0__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CCounter  
{
public:
	void Show(void);
	__int64 GetTime(void);

	void End(void);
	void Start(void);
	CCounter();
	virtual ~CCounter();
	
private:
	LARGE_INTEGER m_end;
	LARGE_INTEGER m_start;
	LARGE_INTEGER m_frequency;
	__int64 m_time;

};

#endif // !defined(AFX_COUNTER_H__763F9ED0_AA67_11D2_87ED_5254AB1691D0__INCLUDED_)
