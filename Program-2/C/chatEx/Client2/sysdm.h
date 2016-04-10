//---------------------------------------------------------------------------
#ifndef sysdmH
#define sysdmH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <NMUDP.hpp>
//---------------------------------------------------------------------------
class TDM : public TDataModule
{
__published:	// IDE-managed Components
    TNMUDP *Master;
    void __fastcall MasterDataReceived(TComponent *Sender, int NumberBytes,
          AnsiString FromIP);
private:	// User declarations
public:		// User declarations
    __fastcall TDM(TComponent* Owner);
    AnsiString LastSendMsg;
    bool SendString(AnsiString strSend, AnsiString strRemoteHost);
};
//---------------------------------------------------------------------------
extern PACKAGE TDM *DM;
//---------------------------------------------------------------------------
#endif

