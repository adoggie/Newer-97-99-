//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "tPrinter.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)


/*===================================
     �õ���ӡ����ǰ���úͽ�ϵͳ��װ�����д�ӡ��
     ����������б��
========================================*/


bool LoadPrinterToComboBox(TComboBox *box)
{
         TPrinter *p=Printer();
        if(p->Printers->Count==0)
        {
         ShowMessage("no printer Exist!");
        return false;
        }
         box->Items->Clear();
         box->Items=p->Printers;

        return true;
 }


        int GetPrinterCount(void)
        {
                TPrinter *p=Printer();
                return p->Printers->Count;
        }


//=================================================
//--------   ������ת���ɴ�ӡ��������
//     int ConvertToPixel(double space);
//==================================================
 int ConvertToPixel(double space)
{
        const float cat=2.54;

        TPrinter *p=Printer();//Set Default Printer From Select List

        int PrinterLogicPixel;
        PrinterLogicPixel=GetDeviceCaps(p->Handle,LOGPIXELSX);

     //   PrinterPaperWidth=GetDeviceCaps(p->Handle,PHYSICALWIDTH);
      //  PrinterPaperHeight=GetDeviceCaps(p->Handle,PHYSICALHEIGHT);
      return (int)PrinterLogicPixel/cat*space;



 }



