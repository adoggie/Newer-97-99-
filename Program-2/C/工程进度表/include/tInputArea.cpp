//---------------------------------------------------------------------------

#include "include\common.cpp"


class tInputArea{
public:
TStringGrid *m_sg;
   int m_nRange;           // n个分段的工期
    void DrawTitle(void);
        //==== 得到 [ ] 中的数据
        AnsiString GetSubString(AnsiString str ,wchar_t begin, wchar_t end, int indexString);//工程项目的不连续性,n个分段的工期
public:
        tInputArea(TStringGrid * sg);
        void  AddSubRange(int nRange=1);
        void DelSubRange(void);
        void DrawIndex(void);
        tInputArea(TStringGrid * sgInputArea, ProjectInfo * info);
        bool LoadFromProject(ProjectInfo * info);
        bool StringToStringList(AnsiString str, TStrings * strList,int cols);  //添加子工期，分段工期


};


tInputArea::tInputArea(TStringGrid * sg)
{
        m_nRange=1;
        m_sg=sg;
//m_sg->RowCount=101;
        for(int i=0;i<m_sg->RowCount;i++)
        {
        m_sg->Rows[i]->Clear();
//m_sg->Cells[0][i]="   "+ AnsiString(i);
        }
        DrawTitle();
        DrawIndex();


}

tInputArea::tInputArea(TStringGrid * sgInputArea, ProjectInfo * info)
{
         m_sg=sgInputArea;
         m_nRange=1;

         //DrawTitle();

        LoadFromProject(info);
         DrawIndex();
}


bool tInputArea::LoadFromProject(ProjectInfo * info)
{ //进来的info->m_StrList已经过滤，无NULL的字符串
 TStringList *StrList=info->m_StrList;
 int index=StrList->IndexOf(AnsiString("[Body]"));
 //++index;
 int RecordCount /*包括标题条*/=StrList->Count-index-1;
 ++index;

//--------  Fill it!
 for(int i=0;i<RecordCount;i++)
 { m_sg->Rows[i]->Clear();
  StringToStringList(StrList->Strings[index+i],m_sg->Rows[i],info->Cols);
                      /* 文件之中的记录*/
 }
return true;
}

 bool tInputArea::StringToStringList(AnsiString str, TStrings * strList,int cols)
{
 for(int i=0;i<cols;i++)
 {
  strList->Strings[i]=(GetSubString(str,'[',']',i));
 }
return true;
}



AnsiString tInputArea::GetSubString(AnsiString str,wchar_t begin, wchar_t end,
                                     int indexString)
{



 int count=-1;
 int m_b,m_e;
 int i;
WideString m_str(str);
m_str.Delete(0,1);
for(i=0;/*i<m_str.Length()*/;i++)
{
 if(m_str[i]==begin)
 {
  count++;
  if(count==indexString)
  {m_b=i;break;}
        }

        }
//----------------
count=-1;

for(i=0;/*i<m_str.Length()*/;i++)
{
 if(m_str[i]==end)
 {
  count++;
  if(count==indexString)
  {m_e=i;break;}
        }

  }
if(m_b>m_e) {ShowMessage("文件记录出错！");return "";}
 //------------
  if((m_e-m_b)==1)  // "[ "  and   "]"相邻中间无字符
  return " ";


AnsiString value=WideCharToString(m_str.SubString(++m_b,m_e-m_b-1));
// ShowMessage(AnsiString(--m_b)+ " " +AnsiString(m_e)+ "  "+value);
 return value;

  }

void tInputArea::AddSubRange(int nRange)
{

        bool IsNull;

     int  Cols=m_sg->ColCount;

      int Rows=m_sg->RowCount;
        if(Cols==5)
        goto step2;
        IsNull=false;
                for(int i=1;i<Rows;i++)
                 {
                  if(m_sg->Cells[Cols-1][i].Trim()!="")
                  { IsNull=false;
                  break;}
                  IsNull=true;
                  }
        if(IsNull==true)
        {
        ShowMessage("已存在空的列！");
         return ;
         }

step2:         
 for(int i=0;i<nRange;i++)
 {
 m_sg->ColCount++;
 m_sg->Cells[m_sg->ColCount-1][0]=AnsiString("开工日")+AnsiString( ++m_nRange);
 m_sg->ColCount++;
 m_sg->Cells[m_sg->ColCount-1][0]=AnsiString("竣工日")+AnsiString( m_nRange);
 }

 }


void tInputArea::DelSubRange(void)
{
   
    if(m_sg->ColCount==5)
    {ShowMessage("至少保留一段工期 ！");
    return ;}

    m_nRange--;
    m_sg->ColCount-=2;

}


void tInputArea::DrawIndex(void)
{
 m_sg->RowCount=101;
for(int i=1;i<m_sg->RowCount+1;i++)
{

m_sg->Cells[0][i]="   "+ AnsiString(i);
}
}


void tInputArea::DrawTitle(void)
{
  m_sg->ColCount=5;
m_sg->Cells[0][0]=AnsiString("编号");
m_sg->Cells[1][0]=AnsiString("工程施工项目名称");
m_sg->Cells[2][0]=AnsiString("开工日")+AnsiString(m_nRange);
m_sg->Cells[3][0]=AnsiString("竣工日")+AnsiString(m_nRange);
m_sg->Cells[4][0]=AnsiString("工程备注信息");

}












