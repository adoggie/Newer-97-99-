//---------------------------------------------------------------------------
#ifndef cdRomH
#define cdRomH


#include "vcl.h"
#include <mmsystem.h>

class tCDRom
{
public:
	tCDRom(){}
	virtual ~tCDRom()=0;

	static BOOL Open (void); //初始化设备
	static void Close (void);//关闭设备


 //---------------------------------------
 // 以下可用于光驱的检测


        static  void OpenDoor (void);  //打开CD-ROM
        static void CloseDoor (void); //关闭CD-ROM
        static WORD m_wDeviceID;
};

WORD tCDRom::m_wDeviceID=0;

#endif
