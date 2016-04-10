//---------------------------------------------------------------------------
#ifndef tRowH
#define tRowH
//---------------------------------------------------------------------------

//#include "tProgressbar.h"
#include "ttextrect.h"
   

class BarInfo{
public:
AnsiString caption; //进度条上的施工天数
int start;
int end;



bool visible;  //是否打印

TRect rc;

//BarInfo(){m_info=Info;}

void Draw();
static PrintInfo *m_info;
} ;

 PrintInfo *BarInfo::m_info=NULL;

void BarInfo::Draw()
{

   TPrinter *p=Printer();
   p->Canvas->Brush->Style=bsSolid;
   int top,left,right,bottom;
   left=rc.Left;right=rc.Right;

   top=rc.Top+rc.Height()/10*m_info->ProgressBarThickTop;
   bottom=rc.Bottom-rc.Height()/10*(10-m_info->ProgressBarThickBottom);

//===========================
 //= 画进度条上的标题条=======
 //=========================
  // tTextRect caption(TRect(100,100,500,200),"test","仿宋体",8,CENTER);
  // caption.Draw();
        if( visible){
        tTextRect caption(TRect(rc.Left,rc.Top,rc.Right,top),
        AnsiString(end-start+1)+" 天","仿宋体",8,CENTER);

        caption.Draw2();}

//    delete caption;


        p->Canvas->Brush->Style=bsSolid;

    //   p->Canvas->Brush->Color=clBlack;
        p->Canvas->Brush->Style=bsBDiagonal ;
        p->Canvas->FillRect(TRect(left,top,right,bottom));


}


typedef enum{TITLEROW,NOTITLEROW} ROWTYPE;

class tRow{


public:
        TRect rc;
       PrintInfo *info;
       ROWTYPE type;
       int recordno; //对应的记录行数在StringGrid中

       BarInfo *fillbar;
        int step;//保存几个分段工期
       tTextRect *xh;
       tTextRect *name;
       tTextRect  *gq;
       tTextRect *bz;
       tRect *bar;
public:
        tRow(){xh=0;name=0;gq=0;bz=0;bar=0;fillbar=0;/*如果不为0则打印*/}
        ~tRow(){
        if(fillbar!=0) delete [step]fillbar;

        delete xh;delete name;delete gq;delete bz;delete []bar;}

public:
       void SetRect(ROWTYPE type,PrintInfo *Info,int RecordNo,TPoint &pt);
       void CreateSubItem();
	   AnsiString tRow::GetData(int Row,int Col);
	   int GetGq(int Row);  //得到记录的工期
       int GetSteps(); //得到几个分段工期
       int ConvertStringToInt(AnsiString str);
       void GetBarInfo(BarInfo *barinfo,int step);
       void Draw();
       void DrawDay(int grid,int pertop,int perbottom);
       AnsiString GetData(int Col);
};


void tRow::DrawDay(int grid,int pertop,int perbottom)
{  int per=info->TableTitleHeight/10;
   AnsiString str=grid+1;
   tLine line;

   line.m_pts=TPoint(bar[grid].m_rc.Right,bar[grid].m_rc.Bottom);
   line.m_pte=TPoint(bar[grid].m_rc.Right,bar[grid].m_rc.Bottom-per*(10-perbottom));
   line.OutToPrinter();

   int dis=PrintInfo::ConvertToPixel(0.5);
   tTextRect day(TRect(bar[grid].m_rc.Right-dis,bar[grid].m_rc.Top+per*pertop,
                        bar[grid].m_rc.Right+dis,bar[grid].m_rc.Bottom-per*(10-perbottom)),
                        str,"仿宋体",10,CENTER);
   day.Draw2();

}
void tRow::Draw()
{

 xh->Draw();
 name->Draw();
 gq->Draw();
 bz->Draw();


        tRect Rc(rc);
       Rc.m_top->m_style=psDot;
       Rc.m_bottom->m_style=psDot;
        Rc.Draw();
//==================2000-06-04==Draw Seperate Line Days==
        if(type==TITLEROW)
        {
        for(int i=0;i<info->Cols-4;i++)
        {
        if((i+1)%(info->DaysSeperateLine)==0&&i!=0)
        {
             DrawDay(i,5,8);
        }
        }

        return;
        }


        if(fillbar==NULL)
        return;


for(int i=0;i<info->Cols-4;i++)
 {
 if((i+1)%(info->DaysSeperateLine)==0)
 { bar[i].m_bottom->m_visible=false;  ;
   bar[i].m_left->m_visible=false;
   bar[i].m_top->m_visible=false;
 bar[i].Draw();
 }
 }

  for(int i=0;i<step;i++)
{
 fillbar[i].Draw();
}


}
int  tRow::GetGq(int Row)
{
  int Cols=info->sg->ColCount;
  //int Rows=sg->RowCount;
  int gq;
  //int min ,max;
  if(info->sg->Cells[3][recordno].Trim()=="")
	  gq=0;
  else
	  gq=info->sg->Cells[3][recordno].ToInt()-info->sg->Cells[2][recordno].ToInt();
  if(Cols<=5)
  {return gq;}

  return 0;  //如果有分段子工期则 工期字符为空

}


AnsiString tRow::GetData(int Col)
{

	switch(Col)
	{
	case 0://序号
		return info->sg->Cells[0][recordno].Trim();
	       //	break;
	case 1://工程项目编号
		return info->sg->Cells[1][recordno].Trim();
	      ////	break;
	case 2: //工期  需要计算
		if( GetGq(recordno)==0)
			return "";
		return GetGq(recordno);
	     //	break;
	case 3://备注
		return info->sg->Cells[4][recordno].Trim();
	      //	break;
	default:;
	}
	return "";


}
//----2000-05-27   ---14;30
void tRow::CreateSubItem()
{
 if(type==TITLEROW)
{ xh=new tTextRect(TRect(rc.Left,rc.Top,
        info->xhWidth+rc.Left,rc.Bottom),
        info->xh,info->TableTitleFontName,info->TableTitleFontSize,CENTER);


  name=new tTextRect(TRect(xh->m_rc.Right,xh->m_rc.Top,
		info->nameWidth+xh->m_rc.Right,xh->m_rc.Bottom),
		info->name,info->TableTitleFontName,info->TableTitleFontSize,CENTER);

  gq=new tTextRect(TRect(name->m_rc.Right,name->m_rc.Top,
		info->gqWidth+name->m_rc.Right,name->m_rc.Bottom),
		info->gq,info->TableTitleFontName,info->TableTitleFontSize,CENTER);

	bz=new tTextRect(TRect(gq->m_rc.Right,gq->m_rc.Top,
		info->bzWidth+gq->m_rc.Right,gq->m_rc.Bottom),
		info->bz,info->TableTitleFontName,info->TableTitleFontSize,CENTER);

 }

 //===== 从StringGrid 中获得数据 ===数据记录部分的列的填充
 if(type==NOTITLEROW)
 {
  xh=new tTextRect(TRect(rc.Left,rc.Top,
        info->xhWidth+rc.Left,rc.Bottom),
        GetData(0),info->FontName,info->FontSize,CENTER);


  name=new tTextRect(TRect(xh->m_rc.Right,xh->m_rc.Top,
		info->nameWidth+xh->m_rc.Right,xh->m_rc.Bottom),
		GetData(1),info->FontName,info->FontSize,LEFT);

  gq=new tTextRect(TRect(name->m_rc.Right,name->m_rc.Top,
		info->gqWidth+name->m_rc.Right,name->m_rc.Bottom),
		GetData(2),info->FontName,info->FontSize,CENTER);

  bz=new tTextRect(TRect(gq->m_rc.Right,gq->m_rc.Top,
		info->bzWidth+gq->m_rc.Right,gq->m_rc.Bottom),
		GetData(3),info->FontName,info->FontSize,CENTER);


 }
int BarCols=info->Cols-4;
 bar=new tRect[BarCols];


 if(BarCols>=info->TableRc.Right-bz->m_rc.Right)
 {ShowMessage("输入的工期数值太大无法对进度格进行分列！");Application->Terminate();}
 if(BarCols==0)
 {ShowMessage("输入的工期数值0对进度格无法进行分列！请选择打印空表");Application->Terminate();}

 //==if Select EmptyTable then..

 if(info->EmptyTable)
 BarCols=info->ColsEmptyTable;

 //==============================


 int space=(info->TableRc.Right-bz->m_rc.Right)%BarCols;

 bz->Offset(space,0);
 gq->Offset(space,0);
 name->IncX(space);

int ProgressBarWidth=(info->TableRc.Right-bz->m_rc.Right)/BarCols;
for(int i=0;i<BarCols;i++)
{
  bar[i].m_rc.Left=bz->m_rc.Right+ProgressBarWidth*i;
  bar[i].m_rc.Top=rc.Top;
  bar[i].m_rc.Right=bar[i].m_rc.Left+ProgressBarWidth;
  bar[i].m_rc.Bottom=rc.Bottom;
  //bar[1].SetRect(TRect(bar[i].m_rc.Left,bar[i].m_rc.Top,
  //              bar[i].m_rc.Right,bar[i].m_rc.Bottom)) ;
  bar[i].CreateLine();
  }
//======设置进度条的宽度几高度
//===get seperate color and width
 if(type==TITLEROW)
 return;
   step=GetSteps();//得到分段工期

 BarInfo::m_info=info;

//=====================

 if(info->EmptyTable)
 return;
//========================

 fillbar=new BarInfo[step];

 for(int i=0;i<step;i++)
 {
  GetBarInfo(&fillbar[i],i);
  if(fillbar[i].visible)
  {fillbar[i].rc.Left=bar[fillbar[i].start-1].m_rc.Left;
   fillbar[i].rc.Top=rc.Top;
   fillbar[i].rc.Bottom=rc.Bottom;
   fillbar[i].rc.Right=bar[fillbar[i].end-1].m_rc.right;

   }
 }




 }


 int tRow::ConvertStringToInt(AnsiString str)
 {
  if(str.Trim()=="")
  return 0;
  return str.ToInt();

 }

 void tRow::GetBarInfo(BarInfo *barinfo,int step)
{
   if(step==0)
   {barinfo->start=ConvertStringToInt(info->sg->Cells[2][recordno]);
    barinfo->end=ConvertStringToInt(info->sg->Cells[3][recordno]);

    }
    else
    {
    barinfo->start=ConvertStringToInt(info->sg->Cells[4+step*2-1][recordno]);
    barinfo->end=ConvertStringToInt(info->sg->Cells[4+step*2][recordno]);

    }
    if(barinfo->start==0||barinfo->end==0)
    barinfo->visible=false;
    else
    barinfo->visible=true;



 }

 int tRow::GetSteps()
 {
  int step=(info->sg->ColCount-5)/2;
  return step+1;

 }
void tRow::SetRect(ROWTYPE Type,PrintInfo *Info,int RecordNo,TPoint &pt)
{
  info=Info;
  recordno=RecordNo;
  type=Type;
    int space=Info->TableRc.Height()-Info->TableTitleHeight-Info->RowHeight*Info->Rows;

  switch(type)
  {
   case  TITLEROW:

    
   rc=TRect(Info->TableRc.Left,Info->TableRc.Top,\
                                Info->TableRc.Right,Info->TableRc.Top+Info->TableTitleHeight+space);

                  pt.x=rc.Left;
                  pt.y=rc.Bottom; //设置下一行的顶点
   break;

   case  NOTITLEROW:
                rc=TRect(pt.x,pt.y,Info->TableRc.Right,pt.y+Info->RowHeight);

                pt.x=rc.Left;
                pt.y=rc.Bottom;
   break;

   default:;

  }


}

 #endif
