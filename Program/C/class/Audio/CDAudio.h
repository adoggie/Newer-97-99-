// CDAudio.h: interface for the CCDAudio class.
//
//////////////////////////////////////////////////////////////////////
#ifndef __CDAUDIO_H__
#define __CDAUDIO_H__

#include "vcl.h"
#include <mmsystem.h>

class CCDAudio  
{
public:
	CCDAudio();
	virtual ~CCDAudio();

	BOOL Open (void); //初始化设备
	void Close (void);//关闭设备
	BOOL Play (void);
	void Stop (void);
	void Pause (void);
	int GetTotalTracks (void);
	int GetCurrentTrack (void);
	void GetTotalLength (int *, int*);
	void GetTrackLength (int, int *, int *);
	int GetMinutes (void);
	int GetSeconds (void);
	int GetFrames (void);
	BOOL SeekTo (int, int, int, int);
        void SkipForward (int);
	void SkipBack (int);

 //---------------------------------------
 // 以下可用于光驱的检测
	  BOOL IsDriveReady (void);  //光驱是否准备好
	  BOOL IsPlaying (BOOL *);
	  BOOL IsAudioTrack (int); //是否是CD音轨

	  void OpenDrive (void);  //打开CD-ROM
	  void CloseDrive (void); //关闭CD-ROM

private:
	BOOL m_bOpened, m_bPaused, m_bPlaying;
	WORD m_wDeviceID;
};

#endif //__CDAUDIO_H__
