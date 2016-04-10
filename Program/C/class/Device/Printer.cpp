//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "tPrinter.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)


/*===================================
     得到打印机当前设置和将系统安装的所有打印机
     填充入下拉列表框
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
//--------   将厘米转换成打印机的像素
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



