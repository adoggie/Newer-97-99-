
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
 bool gqVisible;  //工程工期列是否打印
 bool bzVisible; //工程备注列是否打印
 bool zgqHasNumber;  //总工期字符串是否包括总工期数值   g
 bool ByStringWidth;  //项目施工名称宽度是否依赖字符串的长度
 bool EmptyTable;      //打印的是否是不带数据的空表
 bool ProgressBarTopLine;  //是否画每个进度格顶部的标志线

 int  ColsEmptyTable;   //打印空表的的进度部分的列数
 int DaysEveryRect; //每进度格表示天数
 int DaysSeperateLine;//分隔线的间距天数
 int  Copy;

//============ Section 2;

//---- 表格标题字符串
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

AnsiString FontName; //行字体
int FontSize;         //行字体大小
int RowHeight;        //行高度


AnsiString TableTitleFontName;
int TableTitleFontSize;
int TableTitleHeight;





TRect TableRc;

int TotalCols;
int Rows;//表的行数，不包括标题条
int Cols;//表的全部列数包括进度条及隐含的列
//ALIGNMODE StringAlign;

TStringGrid *sg;



PRINTPAPER PaperType;  //打印纸类型
AnsiString PaperTypeStr;

//============
int SeperateLineWidth;
int SeperateLineColor;

int ProgressBarColor;
int ProgressBarThickBottom;
int ProgressBarThickTop;

public:
        void LoadIniInfo(TRect Rc,TStringGrid *Sg); //调入缺省信息
                static int ConvertToPixel(double space); //转化厘米到像素

private:
        void GetPrintPaperType(void);
        void GetTableTitleString(void); //得到标题字符窜
         void SetColWidth(void);//设置列宽

        void GetRowCount(void);//设置table行数，不包括标题条
         void GetColCount(void); //得到表的全部列的总数
        int GetTotalDays(void); //得到最后的及最的竣工日来定义表的最终列数

        int GetRecordCount();//得到StringGrid 中的记录行数

        void SetTableTitleInfo(void);//设置标题条信息包括字体大小
        void SetRowInfo(void);//设置每一记录行的信息

        int GetColMaxWidth(int col);//得到stringgird 中col列字符串的最大打印像素长度
        int GetTextWidth(AnsiString str,AnsiString font,int size);//得到指定字符串，大小在默认打印机上的宽度
        void GetProgressBarInfo(void);
private:
//      tRow *pRow;
 //     void CreateRows(void);  //创建行
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
   Cols+=4;  //表格总的列数=进度格+文本列
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

        TableTitleFontName=f->ReadString(PaperTypeStr,"TableTitleFontName","黑体");
        TableTitleFontSize=f->ReadInteger(PaperTypeStr,"TableTitleFontSize",10);
        TableTitleHeight=ConvertToPixel(f->ReadFloat(PaperTypeStr,"TableTitleHeight",1.0));

}

void PrintInfo::SetRowInfo(void)
{


        TIniFile *f=new TIniFile(ExtractFilePath(ParamStr(0)) +"system.ini");
        FontName=f->ReadString(PaperTypeStr,"TableContentFontName","仿宋体");
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
         _nameWidth=GetColMaxWidth(1);// //得到施工项目字符串的打印长度 unit :pixel

          nameWidth=_nameWidth> nameWidth?_nameWidth: nameWidth;
          nameWidth+=ConvertToPixel(1.00); // //施工项目字符串两端留0.5cm

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
        int Records=GetRecordCount();//得到记录总数
        Rows=Records>IniRows?Records:IniRows; //打印行数（出去标题条）

}

void PrintInfo::GetTableTitleString(void)
{
TIniFile *f=new TIniFile(ExtractFilePath(ParamStr(0)) +"system.ini");
xh=f->ReadString("Common","xh","序号");
name=f->ReadString("Common","name","工程施工项目");
gq=f->ReadString("Common","gq","工期");
bz=f->ReadString("Common","bz","备注");



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

void PrintInfo::LoadIniInfo(TRect Rc,TStringGrid *Sg) //调入缺省信息
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

       将当前目录下的工程项目文件添加到下拉列表框中

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
        系统类的一些函数
==========================      */

        typedef enum {ON=0,OFF=1} STATUS;
        typedef int STARTMODE;
// {EWX_FORCE=4, /*关闭所有程序并以其他用户身份登录*/
 //             EWX_LOGOFF=0, //重新启动计算机并切换到MS-DOS方式
 //             EWX_REBOOT=2, //重新启动计算机
  //            EWX_SHUTDOWN=1 //关闭计算机
  //            } STARTMODE;

//运行时给How赋值，让他等于EWX_SHUTDOWN或其他，调用以下语句
//ExitWindowsEx(How,0);


class tInfo{
public:
        //设置系统键是否可用，如 alt+ctrl+del 等
        static bool SystemKey(STATUS st);
        //关闭、从新登陆、重起计算机
        bool RebootComputer(STARTMODE sm){ExitWindowsEx(sm,0);return true;}
        //判断当前鼠标是否在某控件的上方
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

     得到打印机当前设置和将系统安装的所有打印机
     填充入下拉列表框


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



 #endif