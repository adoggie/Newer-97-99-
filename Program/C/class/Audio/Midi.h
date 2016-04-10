//---------------------------------------------------------------------------
#ifndef MidiH
#define MidiH
//---------------------------------------------------------------------------
//fndef MIDIH
//efine MIDIH

class CMidi
{
public:
	CMidi();
	virtual ~CMidi();

	int GetDevices (void);
	BOOL Open (AnsiString FileName);
	void Close (void);
	BOOL Play (void);
	void Stop (void);
	void Pause (void);
	void GetTotalLength (int *, int*);
	int GetMinutes (void);
	int GetSeconds (void);
	BOOL IsPlaying (BOOL *);
	BOOL SeekTo (int, int);
	void SkipForward (int);
	void SkipBack (int);
	int GetDivisionType (void);
	int GetTempo (void);
	void SetTempo (int);
	
private:
	BOOL m_bOpened, m_bPaused, m_bPlaying;
	WORD m_wDeviceID;
};

#endif //__MIDI_H__
 
 