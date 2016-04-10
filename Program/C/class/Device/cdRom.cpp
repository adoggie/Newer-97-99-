//---------------------------------------------------------------------------

#include "cdRom.h"

//---------------------------------------------------------------------------

BOOL tCDRom::Open (void)
{

		// Initialize member variables

		m_wDeviceID = 0;

		MCI_OPEN_PARMS OpenParms;
		OpenParms.lpstrDeviceType = (LPCSTR) MCI_DEVTYPE_CD_AUDIO;
		OpenParms.wDeviceID = 0;
		if (mciSendCommand (NULL, MCI_OPEN, MCI_WAIT | MCI_OPEN_TYPE | MCI_OPEN_TYPE_ID | MCI_OPEN_SHAREABLE, (DWORD)(LPVOID) &OpenParms))
			return FALSE;
		m_wDeviceID = OpenParms.wDeviceID;


		// Set the time format to Tracks, Minutes, Seconds, & Frames
		MCI_SET_PARMS SetParms;
		SetParms.dwTimeFormat = MCI_FORMAT_TMSF;
		if (mciSendCommand (m_wDeviceID, MCI_SET, MCI_WAIT | MCI_SET_TIME_FORMAT, (DWORD)(LPVOID) &SetParms)){
			Close ();
			return FALSE;
			}
		mciSendCommand (m_wDeviceID, MCI_SEEK, MCI_SEEK_TO_START, NULL);


	        return TRUE;
}

void tCDRom::Close (void)
{

        mciSendCommand (m_wDeviceID, MCI_CLOSE, MCI_WAIT, NULL);
}





void tCDRom::OpenDoor (void)
{
               Open();
		mciSendCommand (m_wDeviceID, MCI_SET, MCI_SET_DOOR_OPEN, NULL);
                Close();
}

void tCDRom::CloseDoor (void)
{
                Open();
		mciSendCommand (m_wDeviceID, MCI_SET, MCI_SET_DOOR_CLOSED, NULL);
		Close();

}
