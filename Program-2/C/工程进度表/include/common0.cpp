
//---------------------------------------------------------------------------
#ifndef common0.cpp
#define common0.cpp
#include <vcl.h>
#pragma hdrstop



#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>

#include "printers.hpp"
#include "IniFiles.hpp"
#include <Grids.hpp>
//#include "trow.cpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)

typedef enum {LEFT=0,CENTER=1,RIGHT=2,TOP=3,MIDDLE=4,BOTTOM=5} ALIGNMODE;
typedef enum{A2=0,A3=1,A4=2} PRINTPAPER;
typedef ALIGNMODE SIDE;//USEAGE DRAW SEPERATE LINE! < tPROGRESSBAR >

struct PrintInfo{
 bool gqVisible;  //���̹������Ƿ��ӡ
 bool bzVisible; //���̱�ע���Ƿ��ӡ
 bool zgqHasNumber;  //�ܹ����ַ����Ƿ�����ܹ�����ֵ   g
 bool ByStringWidth;  //��Ŀʩ�����ƿ���Ƿ������ַ����ĳ���
 bool EmptyTable;      //��ӡ���Ƿ��ǲ������ݵĿձ�
 bool ProgressBarTopLine;  //�Ƿ�ÿ�����ȸ񶥲��ı�־��

 int  ColsEmptyTable;   //��ӡ�ձ�ĵĽ��Ȳ��ֵ�����
 int DaysEveryRect; //ÿ���ȸ��ʾ����
 int DaysSeperateLine;//�ָ��ߵļ������
 int  Copy;

//============ Section 2;

//---- �������ַ���
AnsiString xh;
AnsiString name;
AnsiString bz;
AnsiString gq;

//bool xhVisible;
//bool nameVisible;
//bool gqVisible;
//bool bzVisble;

int xhWidth;
int nameWidth;
int gqWidth;
int bzWidth;

AnsiString FontName; //������
int FontSize;         //�������С
int RowHeight;        //�и߶�


AnsiString TableTitleFontName;
int TableTitleFontSize;
int TableTitleHeight;





TRect TableRc;

int TotalCols;
int Rows;//���������������������
int Cols;//���ȫ��������������������������
//ALIGNMODE StringAlign;

TStringGrid *sg;



PRINTPAPER PaperType;  //��ӡֽ����
AnsiString PaperTypeStr;

//============
int SeperateLineWidth;
int SeperateLineColor;

int ProgressBarColor;
int ProgressBarThickBottom;
int ProgressBarThickTop;

public:
        void LoadIniInfo(TRect Rc,TStringGrid *Sg); //����ȱʡ��Ϣ
                static int ConvertToPixel(double space); //ת�����׵�����

private:
        void GetPrintPaperType(void);
        void GetTableTitleString(void); //�õ������ַ���
         void SetColWidth(void);//�����п�

        void GetRowCount(void);//����table������������������
         void GetColCount(void); //�õ����ȫ���е�����
        int GetTotalDays(void); //�õ����ļ���Ŀ���������������������

        int GetRecordCount();//�õ�StringGrid �еļ�¼����

        void SetTableTitleInfo(void);//���ñ�������Ϣ���������С
        void SetRowInfo(void);//����ÿһ��¼�е���Ϣ

        int GetColMaxWidth(int col);//�õ�stringgird ��col���ַ���������ӡ���س���
        int GetTextWidth(AnsiString str,AnsiString font,int size);//�õ�ָ���ַ�������С��Ĭ�ϴ�ӡ���ϵĿ��
        void GetProgressBarInfo(void);
private:
//      tRow *pRow;
 //     void CreateRows(void);  //������
public:
    //    PrintInfo(){pRow=NULL;}
     //   ~PrintInfo(){if(pRow!=NULL) delete []pRow;}

       };


void PrintInfo::GetProgressBarInfo(void)
{

  TIniFile *f=new TIniFile(ExtractFilePath(ParamStr(0)) +"system.ini");
  SeperateLineWidth=ConvertToPixel(f->ReadFloat("ProgressBarSection","SeperateLineWidth",0.05));

    switch(f->ReadInteger("ProgressBarSection" ,"SeperateLineColor",0))
  {
  case 0:
           SeperateLineColor=clBlack;
           break;
  case 1:
                SeperateLineColor=clRed;
                break;
  case 2:
                SeperateLineColor=clGreen;
                break;
  case 3:
                SeperateLineColor=clBlue;
                break;
  default:   ;
  }

  ProgressBarColor=clBlack;
  ProgressBarThickTop=f->ReadInteger("ProgressBarSection","ProgressBarThickTop",6);
  ProgressBarThickBottom=f->ReadInteger("ProgressBarSection","ProgressBarThickBottom",8);





}

int PrintInfo::GetTotalDays(void)
{
TStringGrid *sgRecords=sg;
int Cols=sgRecords->ColCount;
int max=0;//int value;
int i,j;
for(i=1;i<sgRecords->RowCount;i++)
{
        if(sgRecords->Cells[3][i].Trim()!="")
                {
                if(sgRecords->Cells[3][i].ToInt()>max)
                max=sgRecords->Cells[3][i].ToInt();
                }
       if(Cols>5)
       {
                for(j=1;j<=(Cols-5)/2;j++)
                {
                 if(sgRecords->Cells[4+j*2][i].Trim()!="")
                 {
                        if(sgRecords->Cells[4+j*2][i].ToInt()>max)
                        max=sgRecords->Cells[4+j*2][i].ToInt();
                 }
                }
       }

}

return max;
}


void PrintInfo::GetColCount(void)
{
   if(EmptyTable)
   {Cols=ColsEmptyTable;//if Table=null,then Cols is special value!
    goto end;}

   Cols=GetTotalDays();
   if(Cols<10)
   {Cols==10;goto end; }

   if(Cols%10==0&&Cols!=0)
   {Cols=Cols;goto end;}

   if(Cols%10!=0)
   {Cols=((int)Cols/10)*10+10;}

   end:
   Cols+=4;  //����ܵ�����=���ȸ�+�ı���
   }


 int PrintInfo::GetTextWidth(AnsiString str,AnsiString font,int size)
 {
    TPrinter *p=Printer();
 p->Canvas->Font->Name=font;
 p->Canvas->Font->Size=size;
 return p->Canvas->TextWidth(str);


 }
int PrintInfo::GetColMaxWidth(int col)
{
     int max=-1;
     int i;
     int count;
    // int Rows=sg->RowCount;
     for(i=1;i<=Rows;i++)
     {

      if(GetTextWidth(sg->Cells[col][i].Trim(),FontName,FontSize)>max)
      { max=GetTextWidth(sg->Cells[col][i].Trim(),FontName,FontSize); count=i;}

     }

     return GetTextWidth(sg->Cells[col][count].Trim(),FontName,FontSize);

}


int PrintInfo::ConvertToPixel(double space)
{
        const float cat=2.54;

        TPrinter *p=Printer();//Set Default Printer From Select List

        int PrinterLogicPixel;
        PrinterLogicPixel=GetDeviceCaps(p->Handle,LOGPIXELSX);

        return (int)PrinterLogicPixel/cat*space;
}



void PrintInfo::SetTableTitleInfo(void)
{
        TIniFile *f=new TIniFile(ExtractFilePath(ParamStr(0)) +"system.ini");

        TableTitleFontName=f->ReadString(PaperTypeStr,"TableTitleFontName","����");
        TableTitleFontSize=f->ReadInteger(PaperTypeStr,"TableTitleFontSize",10);
        TableTitleHeight=ConvertToPixel(f->ReadFloat(PaperTypeStr,"TableTitleHeight",1.0));

}

void PrintInfo::SetRowInfo(void)
{


        TIniFile *f=new TIniFile(ExtractFilePath(ParamStr(0)) +"system.ini");
        FontName=f->ReadString(PaperTypeStr,"TableContentFontName","������");
        FontSize=f->ReadInteger(PaperTypeStr,"TableContentFontSize",10);

        RowHeight=(int)(TableRc.Height()-TableTitleHeight)/Rows;


}
void PrintInfo::SetColWidth(void)
{
         TIniFile *f=new TIniFile(ExtractFilePath(ParamStr(0)) +"system.ini");
         xhWidth=ConvertToPixel(f->ReadFloat(PaperTypeStr,"xhWidth",1));
         gqWidth=ConvertToPixel(f->ReadFloat(PaperTypeStr,"gqWidth",1));
         bzWidth=ConvertToPixel(f->ReadFloat(PaperTypeStr,"bzWidth",2));
         nameWidth=ConvertToPixel(f->ReadFloat(PaperTypeStr,"nameWidth",4));

         if(!gqVisible)
         gqWidth=0;
         if(!bzVisible)
         bzWidth=0;
//        int _xhWidth=GetStringWidth(Info->xh,TableTitleFontName,FontSize);
  //      int _nameWidth=GetSringWidth(Info->name,FontName,FontSize);
   //     int _gqWidth=GetStringWidth(Info->gq,FontName,FontSize);
 //       int _bzWidht=GetSringWidth(Info->bz,FontName,FontSize);

//        Info->xhWidth=

        int _nameWidth;
        if(ByStringWidth)
        {
         _nameWidth=GetColMaxWidth(1);// //�õ�ʩ����Ŀ�ַ����Ĵ�ӡ���� unit :pixel

          nameWidth=_nameWidth> nameWidth?_nameWidth: nameWidth;
          nameWidth+=ConvertToPixel(1.00); // //ʩ����Ŀ�ַ���������0.5cm

        }

}

int PrintInfo::GetRecordCount()
{
       // int Rows=sg->RowCount;
        int i,count;
        count=0;
        for(i=sg->RowCount-1;i>=1;i--)
        {

        if(sg->Cells[1][i].Trim()!="")
         {count=i; break;}

        }

        return count;

}

void PrintInfo::GetRowCount(void)
{
        TIniFile *f=new TIniFile(ExtractFilePath(ParamStr(0)) +"system.ini");
        int IniRows=f->ReadInteger(PaperTypeStr,"DefaultRows",25);
        int Records=GetRecordCount();//�õ���¼����
        Rows=Records>IniRows?Records:IniRows; //��ӡ��������ȥ��������

}

void PrintInfo::GetTableTitleString(void)
{
TIniFile *f=new TIniFile(ExtractFilePath(ParamStr(0)) +"system.ini");
xh=f->ReadString("Common","xh","���");
name=f->ReadString("Common","name","����ʩ����Ŀ");
gq=f->ReadString("Common","gq","����");
bz=f->ReadString("Common","bz","��ע");



}
void PrintInfo::GetPrintPaperType()
{
        const float cat=2.54;
        int Width;/*,Height;*/
        TPrinter *p=Printer();//Set Default Printer From Select List
        int  PrinterLogicPixels,PrinterPaperWidth/*,PrinterPaperHeight*/;
        PrinterLogicPixels=GetDeviceCaps(p->Handle,LOGPIXELSX);
        PrinterPaperWidth=GetDeviceCaps(p->Handle,PHYSICALWIDTH);
  //      PrinterPaperHeight=GetDeviceCaps(p->Handle,PHYSICALHEIGHT);

        Width=(int)PrinterPaperWidth/PrinterLogicPixels * cat;
    //  Height=(int)PrinterPaperHeight/PrinterLogicPixels * cat;
        if(Width<30)
        { PaperType=A4;PaperTypeStr="A4";}
        else
        { PaperType=A3;PaperTypeStr="A3";}
}

void PrintInfo::LoadIniInfo(TRect Rc,TStringGrid *Sg) //����ȱʡ��Ϣ
{       sg=Sg;
        TableRc=Rc;
        GetPrintPaperType();
        GetTableTitleString();
        GetRowCount();
        GetColCount();
        SetTableTitleInfo();
        SetRowInfo();
        SetColWidth();
        GetProgressBarInfo();



}
/*==================================

       ����ǰĿ¼�µĹ�����Ŀ�ļ���ӵ������б����

====================================*/

class tProjectList{
public:
        TComboBox *m_List;
private:
        void LoadProjects(void);
public:
        tProjectList(TComboBox *box);
public:
};

tProjectList::tProjectList(TComboBox *box)
{
        m_List=box;
        LoadProjects();
}


void tProjectList::LoadProjects(void)
{
        AnsiString str="\\*.prj";
        GetCurrentDir();
        TSearchRec sr;
        if(!FindFirst(GetCurrentDir() + str,faAnyFile,sr))
        {
        m_List->Items->Add(sr.Name);
        }
        while(!FindNext(sr))
        {
        m_List->Items->Add(sr. Name);

        }
        FindClose(sr);


}


/*========================
        ϵͳ���һЩ����
==========================      */

        typedef enum {ON=0,OFF=1} STATUS;
        typedef int STARTMODE;
// {EWX_FORCE=4, /*�ر����г����������û���ݵ�¼*/
 //             EWX_LOGOFF=0, //����������������л���MS-DOS��ʽ
 //             EWX_REBOOT=2, //�������������
  //            EWX_SHUTDOWN=1 //�رռ����
  //            } STARTMODE;

//����ʱ��How��ֵ����������EWX_SHUTDOWN�������������������
//ExitWindowsEx(How,0);


class tInfo{
public:
        //����ϵͳ���Ƿ���ã��� alt+ctrl+del ��
        static bool SystemKey(STATUS st);
        //�رա����µ�½����������
        bool RebootComputer(STARTMODE sm){ExitWindowsEx(sm,0);return true;}
        //�жϵ�ǰ����Ƿ���ĳ�ؼ����Ϸ�
        static bool IsCursorInControl(/*HWND parent,*/ TWinControl *control);
        };



bool tInfo::SystemKey(STATUS st)
{
//int temp;
        switch(st)
        {
        case OFF:
        SystemParametersInfo(SPI_SCREENSAVERRUNNING,1,(PVOID)0,0);
        break;
        case ON:
        SystemParametersInfo(SPI_SCREENSAVERRUNNING  ,0,(PVOID)0,0);
        break;
        default:;
}

        return true;

}


bool tInfo::IsCursorInControl(/*HWND parent,*/ TWinControl *control)
{
        POINT pt;
        GetCursorPos(&pt);
        RECT rc;
        GetWindowRect( control->Handle,&rc);
        if(PtInRect(&rc,pt))
        return true;
        else
        return false;
}


/*===================================

     �õ���ӡ����ǰ���úͽ�ϵͳ��װ�����д�ӡ��
     ����������б��


========================================*/
class tPrintInfo{
        TPrinter *nPrinter;
public:
//--------  Set Printer of System to TComboBox
        static bool FillPrinterToComboBox(TComboBox *box);
//-----------  Get Pirnters
        static   int GetPrinterCount(void);
 };

bool tPrintInfo::FillPrinterToComboBox(TComboBox *box)
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

int tPrintInfo::GetPrinterCount(void)
{
        TPrinter *p=Printer();
        return p->Printers->Count;
}


//============= Line==========
 struct Line{
 TPoint sp;
 TPoint ep;
 Line(TPoint pt1,TPoint pt2):sp(pt1),ep(pt2){}
 Line(TRect rc,ALIGNMODE align)
                {
                if(align==TOP)
                {
                sp.x=rc.Left;sp.y=rc.Top;
                ep.x=rc.Right;ep.y=sp.y;}
                if(align==BOTTOM)
                {sp.x=rc.Left;sp.y=rc.Bottom;
                ep.x=rc.Right;ep.y=rc.Bottom;}
                }
 Line(){}
 //Line(Line &line){sp=line.sp;ep=line.ep}
 int Width(void){ return (ep.x-sp.x);}
 };

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



 #endif