//----------------------------------------------------------------------------
#ifndef Unit4H
#define Unit4H
//----------------------------------------------------------------------------
#include <vcl\ExtCtrls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Quickrpt.hpp>
#include <vcl\Dialogs.hpp>
#include <vcl\Forms.hpp>
#include <vcl\Controls.hpp>
#include <vcl\Graphics.hpp>
#include <vcl\Classes.hpp>
#include <vcl\SysUtils.hpp>
#include <vcl\Messages.hpp>
#include <vcl\Windows.hpp>
#include <vcl\System.hpp>
#include <Db.hpp>
#include <DBTables.hpp>
#include <Qrctrls.hpp>
#include <QuickRpt.hpp>
//----------------------------------------------------------------------------
class TQRListForm : public TQuickRep
{
__published:
	TTable *MasterTable;
	TQRBand *DetailBand1;
	TQRBand *PageFooterBand1;
	TQRBand *TitleBand1;
	TQRBand *ColumnHeaderBand1;
	TQRSysData *QRSysData1;
	TQRLabel *QRLabel1;
	TQRLabel *QRLabel2;
	TQRSysData *QRSysData2;
private:
public:
	virtual __fastcall TQRListForm(TComponent* AOwner);
};
//----------------------------------------------------------------------------
extern PACKAGE TQRListForm *QRListForm;
//----------------------------------------------------------------------------
#endif    
