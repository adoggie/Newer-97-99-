
#ifndef common.cpp
#define common.cpp

#include "tTextRect.h"
#include "tProgressBar.h"
//#include "tInputArea.cpp"
 #include "trow.h"
#include "include\common0.cpp"
//---------------------------------------------------------------------------




class ProjectInfo{

public:
//============ Project Input and Output Data =======
//member
        AnsiString m_etTitle;
        TFont   *m_ftTitle;
        AnsiString m_etCorporation;
        TFont *m_ftCorporation;
        AnsiString m_etPrintTime;
        TFont *m_PrintTime;

        AnsiString m_ProjectName;// Full Path File;
        TStringList *m_StrList;//Record Each  Step of Project!
        int Cols;//记录列

public:
///============ Print Data Area================

        bool NowPrint; //是否现在可打印

        bool IsMemoVisible;
        bool IsMemoAreaVisible;
        bool HasNumber;
        bool IsGridWidthByString;

        int EveryGridDays;
        int SeperateLineDays;

        int nPrinter;// As use printing Which printer

        int PrinterLogicPixels;//Print Paper Pixels
        int PrinterPaperWidth;
        int PrinterPaperHeight;

        TPrinter *p;  //Current Select Printer Object
        TStringGrid *sgRecords; // All Data in TSTringGrid Control
        TProgressBar *StepBar;

public:

        PRINTPAPER Paper;
        double TopSpace;
        double LeftSpace;
        double BottomSpace;
        double RightSpace;


        double SeperateLineWidth;
        int SeperateLineColor;
        int ProgressBarThick;
        int ProgressBarColor;
        int ProgressBarAlign;
//======= Fix Parameter about Col's Width  Unit: pixels
        double xhColWidth;
        double nameColWidth;
        double gqColWidth;
        double bzColWidth;
        double progressColsWidth;

        int DefaultRows;

        int TitleStringFontSize;
        AnsiString TitleStringFontName;

        int TableTitleFontSize;
        AnsiString TableTitleFontName;

        int TableContentFontSize;
        AnsiString TableContentFontName;

        TRect PrintArea;
        PrintInfo m_info;
public:
        bool Print(PrintInfo Info,TStringGrid *sg,TProgressBar *bar);
        bool PreparePrintData(void);
        static bool CheckInputAreaData(TStringGrid *sg,int &nRange);
//-------Verify Input String in StringGrid's cells
        static AnsiString CheckInvalidChar(AnsiString &str);
        int GetTotalDays(void) ;
//--------   将厘米转换成打印机的像素
   //     int ConvertToPixel(double space);
//得到字符串高度及宽度
        int GetTextHeight(AnsiString String,AnsiString FontName,int FontSize);      //得到文本（字符串）高度
        int GetTextWidth(AnsiString String,AnsiString FontName,int FontSize);      //得到文本（字符串）高度
        int CreateRows(PrintInfo *info)  ;
void DrawTable(TRect &rc)  ;
public :
        tRow *pRows;
public:

        ProjectInfo();
        ~ProjectInfo(){if(pRows!=NULL) delete []pRows;}
        void SetDefault(void);
//ProjectInfo(

};


int ProjectInfo::GetTextHeight(AnsiString String,AnsiString FontName,int FontSize)
{

 TPrinter *p=Printer();
 p->Canvas->Font->Name=FontName;
 p->Canvas->Font->Size=FontSize;
 return p->Canvas->TextHeight(String);

}

//===================================
//==================================
int ProjectInfo::GetTextWidth(AnsiString String,AnsiString FontName,int FontSize)
{

 TPrinter *p=Printer();
 p->Canvas->Font->Name=FontName;
 p->Canvas->Font->Size=FontSize;
 return p->Canvas->TextWidth(String);

}


//===  得到总工期天数
int ProjectInfo::GetTotalDays(void)
{
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


bool ProjectInfo::Print(PrintInfo Info,TStringGrid *sg,TProgressBar *bar)
{
   sgRecords=sg;
   StepBar=bar;
   m_info=Info;  //Save PrintSetup Information;
//   tRow *Row;
   PreparePrintData(); // Load another Information;

for(int page=0;page<1;page++)
{
     //   Printer()->NewPage(); //Print Multi Pages!

//======  Draw Title ======= As 标题  置中 height=标题实际文字高度

        tText Title(Line(PrintArea,TOP),m_etTitle,TitleStringFontName,TitleStringFontSize,CENTER);
     Title.Draw();

//=============================
//========== 画总工期天数 ===========
  AnsiString Days="   ";

   if(Info.EmptyTable!=true&&Info.zgqHasNumber==true)
   Days=AnsiString(GetTotalDays());          //如果标明要打印实际工期天数

   tText Zgq(   Line(Title.m_rc,BOTTOM),
                AnsiString("总工期") + " " +Days+ " " +AnsiString("天"),
                TableContentFontName,TableContentFontSize,RIGHT);

    Zgq.SetRect(TRect(Zgq.m_rc.Left,Zgq.m_rc.Top-ConvertToPixel(0.3),
                Zgq.m_rc.Right,Zgq.m_rc.Bottom-ConvertToPixel(0.3)));
    Zgq.SetStringPos();
    Zgq.Draw();

//===================================================
//============画页脚 打印日期 && 编制单位

int StringHeight=GetTextHeight(m_etCorporation,TableContentFontName,TableContentFontSize);
   tText Corporation(Line(TRect(PrintArea.Left,PrintArea.Bottom-StringHeight,
                        PrintArea.Right,PrintArea.Bottom-StringHeight),TOP),
                        "编制单位："+m_etCorporation,TableContentFontName,
                        TableContentFontSize,LEFT);

   Corporation.Draw();

   tText PrintTime(Line(TRect(PrintArea.Left,PrintArea.Bottom-StringHeight,
                        PrintArea.Right,PrintArea.Bottom-StringHeight),TOP),
                        "打印日期:"+m_etPrintTime ,TableContentFontName,
                        TableContentFontSize,CENTER);

   PrintTime.Draw();

//=================================================
//================ 打印表格部分  上下缩进0.1 cm======
//=====================================================

tRect rc(TRect(PrintArea.Left,Zgq.m_rc.Bottom+ConvertToPixel(0.1),
                PrintArea.Right,PrintArea.Bottom-StringHeight-ConvertToPixel(0.1)));
DrawTable(rc.m_rc);
rc.Draw();

   }

//   delete []Row;
   return true;


   }

void ProjectInfo::DrawTable(TRect &Rc)
{  TRect rc=Rc;
  m_info.LoadIniInfo(rc,sgRecords);
  CreateRows(&m_info);

}

int ProjectInfo::CreateRows(PrintInfo *info)
{
   if(pRows!=NULL)
   delete []pRows;
   pRows=new tRow[m_info.Rows+1];

   TPoint pt;
   pRows[0].SetRect(TITLEROW,info,0,pt);
   pRows[0].CreateSubItem();
   int i;
   for(i=1;i<=m_info.Rows;i++)
   {
   pRows[i].SetRect(NOTITLEROW,info,i,pt);
   pRows[i].CreateSubItem();
   }
 // pRows[0].Draw();
// return true;

 for(i=0;i<m_info.Rows+1;i++)
 {
  pRows[i].Draw();
 }
 tRect rc(pRows[0].rc);
 rc.Draw();
return true;

}



bool ProjectInfo::PreparePrintData(void)
{
        const float cat=2.54;
        int Width;/*,Height;*/
        p=Printer();//Set Default Printer From Select List


        PrinterLogicPixels=GetDeviceCaps(p->Handle,LOGPIXELSX);
        PrinterPaperWidth=GetDeviceCaps(p->Handle,PHYSICALWIDTH);
        PrinterPaperHeight=GetDeviceCaps(p->Handle,PHYSICALHEIGHT);

        Width=(int)PrinterPaperWidth/PrinterLogicPixels * cat;
    //  Height=(int)PrinterPaperHeight/PrinterLogicPixels * cat;
        if(Width<30)
        { Paper=A4;}
        else
        { Paper=A3;}

//==========  Begin Load Information From System.ini=========
// TIniFile
       TIniFile *Info=new TIniFile(ExtractFilePath(ParamStr(0)) +"system.ini");
       AnsiString name=Info->FileName;
       AnsiString Section;
       switch(Paper)
       {
        case A2:
                Section="A4" ;
                break;
        case A3:
                Section="A3";
                break;

        case A4:
                Section="A4";
                break;

        default:Section="A4";
        }
        TopSpace=Info->ReadFloat(Section,AnsiString("TopSpace"),1);
        LeftSpace=Info->ReadFloat(Section,"LeftSpace",1);
        BottomSpace=Info->ReadFloat(Section,"BottomSpace",1);
        RightSpace=Info->ReadFloat(Section,"RightSpace",1);

        DefaultRows=Info->ReadInteger(Section,"DefaultRows",25);

        TitleStringFontSize=Info->ReadInteger(Section,"TitleStringFontSize",20);
        TitleStringFontName=Info->ReadString(Section,"TitleStringFontName","隶书");

        TableTitleFontSize=Info->ReadInteger(Section,"TableTitleFontSize",10);
        TableTitleFontName=Info->ReadString(Section,"TableTitleFontName","仿宋");

        TableContentFontSize=Info->ReadInteger(Section,"TableContentFontSize",10);
        TableContentFontName=Info->ReadString(Section,"TableContentFontName","仿宋");

        xhColWidth=Info->ReadFloat(Section,"xhColWidth",1.00);
        nameColWidth=Info->ReadFloat(Section,"nameColWidth",4.00);
        gqColWidth=Info->ReadFloat(Section,"gqColWidth",1.00);
        bzColWidth=Info->ReadFloat(Section,"bzColWidth",2.0);

        SeperateLineWidth=Info->ReadFloat("ProgressBarSection","SeperateLineWidth",0.05);
        tProgressBar::m_linewidth=SeperateLineWidth/2;

        SeperateLineColor=Info->ReadInteger("ProgressBarSection","SeperateLineColor",clBlack);
        switch(SeperateLineColor)
        {
         case 0:SeperateLineColor=clBlack;
                break;
        case 1: SeperateLineColor=clRed;
                break;
        case 2: SeperateLineColor=clGreen;
                break;
        case 3: SeperateLineColor=clBlue;
                break;
        default:SeperateLineColor=clBlack;
        }
        tProgressBar::m_seperatelinecolor=SeperateLineColor;


        ProgressBarThick=Info->ReadInteger("ProgressBarSection","ProgressBarThick",1976);

        ProgressBarColor=Info->ReadInteger("ProgressBarSection","ProgressBarColor",1976);
        ProgressBarAlign=Info->ReadInteger("ProgressBarSection","ProgressBarAlign",1976);


//=======  define Print Paper Area=======================
        LeftSpace=PrinterLogicPixels/cat*LeftSpace;
        TopSpace = PrinterLogicPixels/cat*TopSpace;
        RightSpace=PrinterLogicPixels/cat*RightSpace;
        BottomSpace=PrinterLogicPixels/cat *BottomSpace;

        xhColWidth=PrinterLogicPixels/cat*xhColWidth;
        nameColWidth=PrinterLogicPixels/cat*nameColWidth;
        gqColWidth=PrinterLogicPixels/cat*gqColWidth;
        bzColWidth=PrinterLogicPixels/cat*bzColWidth;

//======== Set Print Area===========
        PrintArea= TRect(LeftSpace,TopSpace,
                                p->PageWidth-(int)RightSpace ,
                                p->PageHeight-(int)BottomSpace);


//     ShowMessage(AnsiString(Paper));
/*      ShowMessage(AnsiString(PrinterLogicPixels) + " "+
      AnsiString(PrinterPaperWidth)+ " "+
      AnsiString(PrinterPaperHeight));
       ShowMessage(AnsiString(p->PageWidth));*/

       return true;
}


ProjectInfo::ProjectInfo()
{
        
       pRows=NULL;
        m_StrList=NULL;
        SetDefault(); }


void ProjectInfo::SetDefault(void)
{
//p=NULL;
NowPrint=false;

if(m_StrList!=NULL)
  delete m_StrList;
 m_etTitle=" 工程施工进度表" ;
 m_etCorporation="上海市园林工程有限公司";
 m_etPrintTime="2000-05-10";
 m_ProjectName="";

}

AnsiString  ProjectInfo::CheckInvalidChar(AnsiString &str)
{
AnsiString s=str.Trim();
AnsiString ValidChar="01234567";
AnsiString tmp;
for(int i=0;i<s.Length();i++)
{
      tmp=s.SubString(i,1);

        if(ValidChar.AnsiPos(tmp)==0)
        {
                  
         return str="";
        }
}
return s;

}

bool ProjectInfo::CheckInputAreaData(TStringGrid *sg,int &nRange)
{
int Rows,Cols;
Rows=sg->RowCount;
Cols=sg->ColCount;
int i,j;

//======= 开工日1，竣工日1中是否有不合法的字符
//======== 不合法则删除本单元格中的内容，如果开，竣工任何一
//======单元格为空，则全部为空

for(i=1;i<Rows;i++)
{

   sg->Cells[2][i]=CheckInvalidChar(sg->Cells[2][i]);
   sg->Cells[3][i]= CheckInvalidChar(sg->Cells[3][i]);
  if(sg->Cells[2][i].Trim()=="" ||sg->Cells[3][i].Trim()==""||
  sg->Cells[3][i].ToInt()<sg->Cells[2][i].ToInt()||
        sg->Cells[2][i].ToInt()==0)
  {
  sg->Cells[2][i]="";
  sg->Cells[3][i]="";}
}

if(Cols>5)
{

  for(i=1;i<Rows;i++)
  {
        for(j=5;j<Cols;)
        {
        sg->Cells[j][i]=CheckInvalidChar(sg->Cells[j][i]);
        sg->Cells[j+1][i]=CheckInvalidChar(sg->Cells[j+1][i]);

        if(sg->Cells[j][i].Trim()=="" ||sg->Cells[j+1][i].Trim()==""||
        sg->Cells[j+1][i].ToInt()<sg->Cells[j][i].ToInt()||
        sg->Cells[j][i].ToInt()==0)
        {
        sg->Cells[j][i]="";
        sg->Cells[j+1][i]="";}

        j+=2;
        }
  }

 }
 ////===== to del NULL cols;删除空列
      bool IsNull;

      Cols=sg->ColCount;
      if(Cols==5)
        return true;
        
        IsNull=false;
                for(i=1;i<Rows;i++)
                 {
                  if(sg->Cells[Cols-1][i].Trim()!="")
                  { IsNull=false;
                  break;}
                  IsNull=true;
                  }
        if(IsNull==true)
        {
          sg->ColCount=Cols-2;
          nRange--;
         }


 return true;
  }


#endif
