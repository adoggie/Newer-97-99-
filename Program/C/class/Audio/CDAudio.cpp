


#include "CDAudio.h"

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CCDAudio::CCDAudio()
{
	// Initialize member variables
	m_bOpened = m_bPaused = m_bPlaying = FALSE;
	m_wDeviceID = 0;
}

CCDAudio::~CCDAudio()
{
	Close ();
}

//////////////////////////////////////////////////////////////////////
// Member Functions
//////////////////////////////////////////////////////////////////////

BOOL CCDAudio::Open (void)
{
	if(!m_bOpened){
		// Initialize member variables
		m_bOpened = m_bPaused = m_bPlaying = FALSE;
		m_wDeviceID = 0;

		// Open the device
		MCI_OPEN_PARMS OpenParms;
		OpenParms.lpstrDeviceType = (LPCSTR) MCI_DEVTYPE_CD_AUDIO;
		OpenParms.wDeviceID = 0;
		if (mciSendCommand (NULL, MCI_OPEN, MCI_WAIT | MCI_OPEN_TYPE | MCI_OPEN_TYPE_ID | MCI_OPEN_SHAREABLE, (DWORD)(LPVOID) &OpenParms))
			return FALSE;
		m_wDeviceID = OpenParms.wDeviceID;
		m_bOpened = TRUE;

		// Set the time format to Tracks, Minutes, Seconds, & Frames
		MCI_SET_PARMS SetParms;
		SetParms.dwTimeFormat = MCI_FORMAT_TMSF;
		if (mciSendCommand (m_wDeviceID, MCI_SET, MCI_WAIT | MCI_SET_TIME_FORMAT, (DWORD)(LPVOID) &SetParms)){
			Close ();
			return FALSE;
			}
		mciSendCommand (m_wDeviceID, MCI_SEEK, MCI_SEEK_TO_START, NULL);
		}

	return TRUE;
}

void CCDAudio::Close (void)
{
	if (m_bOpened){
		// Stop the playing and close the device
		if (m_bPlaying || m_bPaused)
			mciSendCommand (m_wDeviceID, MCI_STOP, NULL, NULL);
		mciSendCommand (m_wDeviceID, MCI_CLOSE, MCI_WAIT, NULL);

		// Clear member variables
		m_bOpened = m_bPaused = m_bPlaying = FALSE;
		m_wDeviceID = 0;
		}
}

BOOL CCDAudio::Play (void)
{
	if (!m_bOpened)
		Open ();

	if (m_bOpened){
		if (!IsAudioTrack (GetCurrentTrack ()))
			return FALSE;
		MCI_PLAY_PARMS PlayParms;
		PlayParms.dwCallback = NULL;
		PlayParms.dwFrom = MCI_MAKE_TMSF (GetCurrentTrack (), GetMinutes (), GetSeconds (), GetFrames ());
		if (mciSendCommand (m_wDeviceID, MCI_PLAY, MCI_FROM, (DWORD)(LPVOID) &PlayParms))
			return FALSE;
		m_bPaused = FALSE;
		m_bPlaying = TRUE;
		return TRUE;
		}

	return FALSE;
}

void CCDAudio::Stop (void)
{
	if (m_bOpened && m_bPlaying){
		mciSendCommand (m_wDeviceID, MCI_STOP, MCI_WAIT, NULL);
		mciSendCommand (m_wDeviceID, MCI_SEEK, MCI_SEEK_TO_START, NULL);
		m_bPlaying = FALSE;
		m_bPaused = FALSE;
		}
}

void CCDAudio::Pause( void )
{
	if (m_bOpened && m_bPlaying){
		// Pause the CD
		MCI_PLAY_PARMS PlayParms;
		if (mciSendCommand (m_wDeviceID, MCI_PAUSE, 0, (DWORD)(LPVOID) &PlayParms))
			return;
		m_bPaused = TRUE;
		}
}

int CCDAudio::GetTotalTracks (void)
{
	if (m_bOpened){
		// Get the number of tracks on the CD
		MCI_STATUS_PARMS StatusParms;
		StatusParms.dwItem = MCI_STATUS_NUMBER_OF_TRACKS;
		if (mciSendCommand (m_wDeviceID, MCI_STATUS, MCI_STATUS_ITEM, (DWORD)(LPVOID) &StatusParms))
			return -1;
		return (int) StatusParms.dwReturn;
		}

	return -1;
}

void CCDAudio::GetTotalLength (int *pnMinutes, int *pnSeconds)
{
	if (m_bOpened){
		MCI_STATUS_PARMS StatusParms;
		StatusParms.dwItem = MCI_STATUS_LENGTH;
		if (mciSendCommand (m_wDeviceID, MCI_STATUS, MCI_WAIT | MCI_STATUS_ITEM, (DWORD)(LPVOID) &StatusParms)){
			*pnMinutes = -1;
			*pnSeconds = -1;
			return;
			}
		*pnMinutes = MCI_MSF_MINUTE (StatusParms.dwReturn);
		*pnSeconds = MCI_MSF_SECOND (StatusParms.dwReturn);
		return;
		}

	*pnMinutes = -1;
	*pnSeconds = -1;
}

void CCDAudio::GetTrackLength (int nTrack, int *pnMinutes, int *pnSeconds)
{
	if (m_bOpened){
		MCI_STATUS_PARMS StatusParms;
		StatusParms.dwItem = MCI_STATUS_LENGTH;
		StatusParms.dwTrack = (DWORD) nTrack;
		if (mciSendCommand (m_wDeviceID, MCI_STATUS, MCI_WAIT | MCI_STATUS_ITEM | MCI_TRACK, (DWORD)(LPVOID) &StatusParms)){
			*pnMinutes = -1;
			*pnSeconds = -1;
			return;
			}
		*pnMinutes = MCI_MSF_MINUTE (StatusParms.dwReturn);
		*pnSeconds = MCI_MSF_SECOND (StatusParms.dwReturn);
		return;
		}

	*pnMinutes = -1;
	*pnSeconds = -1;
}

int CCDAudio::GetCurrentTrack (void)
{
	if (m_bOpened){
		// Save the current position
		MCI_STATUS_PARMS StatusParms;
		StatusParms.dwItem = MCI_STATUS_POSITION;
		if (mciSendCommand (m_wDeviceID, MCI_STATUS, MCI_WAIT | MCI_STATUS_ITEM, (DWORD)(LPVOID) &StatusParms))
			return -1;
		return MCI_TMSF_TRACK (StatusParms.dwReturn);
		}

	return -1;
}

int CCDAudio::GetMinutes (void)
{
	if (m_bOpened){
		// Save the current position
		MCI_STATUS_PARMS StatusParms;
		StatusParms.dwItem = MCI_STATUS_POSITION;
		if (mciSendCommand (m_wDeviceID, MCI_STATUS, MCI_WAIT | MCI_STATUS_ITEM, (DWORD)(LPVOID) &StatusParms))
			return -1;
		return MCI_TMSF_MINUTE (StatusParms.dwReturn);
		}

	return -1;
}

int CCDAudio::GetSeconds (void)
{
	if (m_bOpened){
		// Save the current position
		MCI_STATUS_PARMS StatusParms;
		StatusParms.dwItem = MCI_STATUS_POSITION;
		if (mciSendCommand (m_wDeviceID, MCI_STATUS, MCI_WAIT | MCI_STATUS_ITEM, (DWORD)(LPVOID) &StatusParms))
			return -1;
		return MCI_TMSF_SECOND (StatusParms.dwReturn);
		}

	return -1;
}

int CCDAudio::GetFrames (void)
{
	if (m_bOpened){
		// Save the current position
		MCI_STATUS_PARMS StatusParms;
		StatusParms.dwItem = MCI_STATUS_POSITION;
		if (mciSendCommand (m_wDeviceID, MCI_STATUS, MCI_WAIT | MCI_STATUS_ITEM, (DWORD)(LPVOID) &StatusParms))
			return -1;
		return MCI_TMSF_FRAME (StatusParms.dwReturn);
		}

	return -1;
}

BOOL CCDAudio::IsDriveReady (void)
{
	if (m_bOpened){
		// See if the CD is ready and the drive is closed
		MCI_STATUS_PARMS StatusParms;
		StatusParms.dwItem = MCI_STATUS_MODE;
		if (mciSendCommand (m_wDeviceID, MCI_STATUS, MCI_STATUS_ITEM, (DWORD)(LPVOID) &StatusParms))
			return FALSE;
		if (StatusParms.dwReturn == MCI_MODE_NOT_READY || StatusParms.dwReturn == MCI_MODE_OPEN)
			return FALSE;
		// See if there is media in the drive
		StatusParms.dwItem = MCI_STATUS_MEDIA_PRESENT;
		if (mciSendCommand (m_wDeviceID, MCI_STATUS, MCI_STATUS_ITEM, (DWORD)(LPVOID) &StatusParms))
			return FALSE;
		return (BOOL) StatusParms.dwReturn;
		}

	return FALSE;
}

BOOL CCDAudio::IsAudioTrack (int nTrack)
{
	if (m_bOpened){
		// See if this track is an audio track
		MCI_STATUS_PARMS StatusParms;
		StatusParms.dwItem = MCI_CDA_STATUS_TYPE_TRACK;
		StatusParms.dwTrack = nTrack;
		if (mciSendCommand (m_wDeviceID, MCI_STATUS, MCI_STATUS_ITEM | MCI_TRACK, (DWORD)(LPVOID) &StatusParms))
			return FALSE;
		if (StatusParms.dwReturn == MCI_CDA_TRACK_AUDIO)
			return TRUE;
		}

	return FALSE;
}

BOOL CCDAudio::IsPlaying (BOOL *pbPaused)
{
	*pbPaused = m_bPaused;

	return m_bPlaying;
}

BOOL CCDAudio::SeekTo (int nTrack, int nMinute, int nSecond, int nFrame)
{
	if (m_bOpened){
		MCI_SEEK_PARMS SeekParms;
		SeekParms.dwTo = MCI_MAKE_TMSF (nTrack, nMinute, nSecond, nFrame);
		if (m_bPlaying && !m_bPaused)
			mciSendCommand (m_wDeviceID, MCI_PAUSE, 0, NULL);
		if (mciSendCommand (m_wDeviceID, MCI_SEEK, MCI_TO | MCI_WAIT, (DWORD)(LPVOID) &SeekParms))
			return FALSE;
		if (m_bPlaying && !m_bPaused)
			Play ();
		return TRUE;
		}

	return FALSE;
}

void CCDAudio::SkipForward (int nSeconds)
{
	if (m_bOpened){
		// Change format to milliseconds
		MCI_SET_PARMS SetParms;
		SetParms.dwTimeFormat = MCI_FORMAT_MILLISECONDS;
		mciSendCommand (m_wDeviceID, MCI_SET, MCI_WAIT | MCI_SET_TIME_FORMAT, (DWORD)(LPVOID) &SetParms);
		// Get the current position
		MCI_STATUS_PARMS StatusParms;
		DWORD dwPos;
		StatusParms.dwItem = MCI_STATUS_POSITION;
		mciSendCommand (m_wDeviceID, MCI_STATUS, MCI_WAIT | MCI_STATUS_ITEM, (DWORD)(LPVOID) &StatusParms);
		dwPos = StatusParms.dwReturn;
		// Skip forward n milliseconds
		dwPos += (DWORD) nSeconds * 1000;
		// Pause & seek to
		MCI_SEEK_PARMS SeekParms;
		SeekParms.dwTo = dwPos;
		if (m_bPlaying && !m_bPaused)
			mciSendCommand (m_wDeviceID, MCI_PAUSE, 0, NULL);
		mciSendCommand (m_wDeviceID, MCI_SEEK, MCI_TO | MCI_WAIT, (DWORD)(LPVOID) &SeekParms);
		// Change format back to track, minutes, seconds
		SetParms.dwTimeFormat = MCI_FORMAT_TMSF;
		mciSendCommand (m_wDeviceID, MCI_SET, MCI_WAIT | MCI_SET_TIME_FORMAT, (DWORD)(LPVOID) &SetParms);
		// Restart the audio
		if (m_bPlaying && !m_bPaused)
			Play ();
		}
}

void CCDAudio::SkipBack (int nSeconds)
{
	if (m_bOpened){
		// Change format to milliseconds
		MCI_SET_PARMS SetParms;
		SetParms.dwTimeFormat = MCI_FORMAT_MILLISECONDS;
		mciSendCommand (m_wDeviceID, MCI_SET, MCI_WAIT | MCI_SET_TIME_FORMAT, (DWORD)(LPVOID) &SetParms);
		// Get the current position
		MCI_STATUS_PARMS StatusParms;
		DWORD dwPos;
		StatusParms.dwItem = MCI_STATUS_POSITION;
		mciSendCommand (m_wDeviceID, MCI_STATUS, MCI_WAIT | MCI_STATUS_ITEM, (DWORD)(LPVOID) &StatusParms);
		dwPos = StatusParms.dwReturn;
		// Skip forward n milliseconds
		dwPos -= (DWORD) nSeconds * 1000;
		// Pause & seek to
		MCI_SEEK_PARMS SeekParms;
		SeekParms.dwTo = dwPos;
		if (m_bPlaying && !m_bPaused)
			mciSendCommand (m_wDeviceID, MCI_PAUSE, 0, NULL);
		mciSendCommand (m_wDeviceID, MCI_SEEK, MCI_TO | MCI_WAIT, (DWORD)(LPVOID) &SeekParms);
		// Change format back to track, minutes, seconds
		SetParms.dwTimeFormat = MCI_FORMAT_TMSF;
		mciSendCommand (m_wDeviceID, MCI_SET, MCI_WAIT | MCI_SET_TIME_FORMAT, (DWORD)(LPVOID) &SetParms);
		// Restart the audio
		if (m_bPlaying && !m_bPaused)
			Play ();
		}
}

void CCDAudio::OpenDrive (void)
{
	if (m_bOpened){
		Stop ();
		mciSendCommand (m_wDeviceID, MCI_SET, MCI_SET_DOOR_OPEN, NULL);
		}
}

void CCDAudio::CloseDrive (void)
{
	if (m_bOpened){
		mciSendCommand (m_wDeviceID, MCI_SET, MCI_SET_DOOR_CLOSED, NULL);
		Stop ();
		}	
}
