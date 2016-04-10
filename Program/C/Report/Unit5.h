//----------------------------------------------------------------------------
#ifndef Unit5H
#define Unit5H
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
class TQRLabelForm : public TForm
{
__published:
	TQuickRep *QuickRep1;
        TTable *Master1Table;
	TQRBand *DetailBand1;
	TQRLabel *QRLabel2;
        TTable *Table1;
        TQRDBText *QRDBText1;
private:
public:
	virtual __fastcall TQRLabelForm(TComponent* AOwner);
};
//----------------------------------------------------------------------------
extern PACKAGE TQRLabelForm *QRLabelForm;
//----------------------------------------------------------------------------
#endif    
