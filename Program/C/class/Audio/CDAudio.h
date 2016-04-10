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

	BOOL Open (void); //��ʼ���豸
	void Close (void);//�ر��豸
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
 // ���¿����ڹ����ļ��
	  BOOL IsDriveReady (void);  //�����Ƿ�׼����
	  BOOL IsPlaying (BOOL *);
	  BOOL IsAudioTrack (int); //�Ƿ���CD����

	  void OpenDrive (void);  //��CD-ROM
	  void CloseDrive (void); //�ر�CD-ROM

private:
	BOOL m_bOpened, m_bPaused, m_bPlaying;
	WORD m_wDeviceID;
};

#endif //__CDAUDIO_H__
