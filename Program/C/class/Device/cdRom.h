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

	static BOOL Open (void); //��ʼ���豸
	static void Close (void);//�ر��豸


 //---------------------------------------
 // ���¿����ڹ����ļ��


        static  void OpenDoor (void);  //��CD-ROM
        static void CloseDoor (void); //�ر�CD-ROM
        static WORD m_wDeviceID;
};

WORD tCDRom::m_wDeviceID=0;

#endif
