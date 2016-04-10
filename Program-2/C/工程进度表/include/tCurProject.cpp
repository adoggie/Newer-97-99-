//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop


#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>

#include "tInputArea.cpp"
#pragma package(smart_init)




 //包装窗口上的控件
class tCurProject {

private:
    TEdit *m_etTitle;
    TEdit *m_etCorporation;
    TEdit *m_etPrintTime;
    TStringGrid *m_sgInputArea;
    TProgressBar *m_StepBar;
public:
    tInputArea *m_InputArea;     //建立一个网格输入内容类
    ProjectInfo m_ProjectInfo;   //包含一个当前项目信息的对象


public:

    tCurProject(TEdit *etTitle,TEdit *etCorporation
                ,TEdit *etPrintTime,TStringGrid *sgInputArea,
                TProgressBar *pb);

public:

    bool VerifyProjectFile(AnsiString file); //校验文件是否合法
    AnsiString GetValue(AnsiString str);    //在str中找 "="右边的值

    void LoadDefaultInfo(void);   //调入初始化信息到当前控件
    void CloseProject(void);     //关闭当前工程
    void SaveProject(void);
//---------- 调入工程项目文件到当前
    bool LoadProject(AnsiString project);
    ~tCurProject();
    bool SaveToFile(AnsiString str);

};

 tCurProject::~tCurProject()
{
 if(m_InputArea!=NULL)
 delete m_InputArea;

}
tCurProject::tCurProject(
                TEdit *etTitle,TEdit *etCorporation
                ,TEdit *etPrintTime,TStringGrid *sgInputArea,
                TProgressBar *pb)
{
 m_InputArea=NULL;
 m_etTitle=etTitle;
 m_etCorporation=etCorporation;
 m_etPrintTime=etPrintTime;
 m_sgInputArea=sgInputArea;
 m_StepBar=pb;
 LoadDefaultInfo();

}


void tCurProject::LoadDefaultInfo(void)
{
 m_etTitle->Text=m_ProjectInfo.m_etTitle;
 m_etCorporation->Text=m_ProjectInfo.m_etCorporation;
 m_etPrintTime->Text=m_ProjectInfo.m_etPrintTime;
 m_StepBar->Position=0;

 if(m_InputArea!=NULL)
 delete m_InputArea;
 m_InputArea=new tInputArea(m_sgInputArea);

}

void tCurProject::CloseProject(void)
{
m_ProjectInfo.SetDefault();
LoadDefaultInfo();

}
//-----------------


bool tCurProject::SaveToFile(AnsiString strFileName)
{
if(strFileName=="" && m_ProjectInfo.m_ProjectName=="")
return true;
AnsiString Ext="\\.prj";
m_ProjectInfo.m_etTitle=m_etTitle->Text.Trim();
m_ProjectInfo.m_etCorporation=m_etCorporation->Text.Trim();
m_ProjectInfo.m_etPrintTime=m_etPrintTime->Text.Trim();
m_ProjectInfo.Cols=m_sgInputArea->ColCount;


//m_ProjectInfo.m_ProjectName +=Ext;
/////////////////////////////
////////////////////////////
TStringList *strList=new TStringList();
strList->Add("[Cx-2 studio zbin 2000]");
strList->Add("[Head]");
strList->Add("Title="+m_ProjectInfo.m_etTitle);
strList->Add("Corporation=" + m_ProjectInfo.m_etCorporation);
strList->Add("PrintTime=" + m_ProjectInfo.m_etPrintTime);
strList->Add("Cols=" + AnsiString(m_ProjectInfo.Cols));
strList->Add("[Body]");
int i,j;
AnsiString str;
for(i=0;i<m_sgInputArea->RowCount;i++)
{
//strList->Add("");
 for(j=0;j<m_sgInputArea->ColCount;j++)
 {
 str+="["+ AnsiString(m_sgInputArea->Cells[j][i])+"]";


 }
 strList->Add(str);
 str="";
 }

 AnsiString SaveName;
 if(strFileName=="") /*save to Current File*/
SaveName=m_ProjectInfo.m_ProjectName;
else
SaveName= strFileName;
//if(FileExists(SaveName))
//DeleteFile(SaveName);
//ShowMessage(SaveName);
//SaveName="ddd.prj";
if(FileExists(SaveName))
DeleteFile(SaveName);

strList->SaveToFile(SaveName);
 delete strList;
 return true;
}

//----------------------
void tCurProject::SaveProject(void)
{
 AnsiString FileName=m_ProjectInfo.m_ProjectName;
 int Handle;
 if(FileName=="")
 {
 // Prompt Enter the File Name to Save it!
 FileName=InputBox("Enter the File Name","Are you Sure?","");
 if(FileName=="")
 return;
 Handle=FileCreate(FileName);
 if(Handle==-1)
 {
 ShowMessage("文件存盘出错，请检查你输入的文件名！");
 return;}
 //SaveToFile(FileName);
 }
 // or if ok then  save information to file!
 // 2000-05-19 24:00 over!

 }
bool tCurProject::LoadProject(AnsiString project)
{
 if(m_InputArea!=NULL)
 delete m_InputArea;
 if(!VerifyProjectFile(project))
 {
 ShowMessage("文件校验不能通过！");
 return false;}
 //----------  填充控件内容
 m_etTitle->Text=m_ProjectInfo.m_etTitle;
 m_etCorporation->Text=m_ProjectInfo.m_etCorporation;
 m_etPrintTime->Text=m_ProjectInfo.m_etPrintTime;
 //---- set cols
 m_sgInputArea->ColCount=m_ProjectInfo.Cols;
 //-----调用 tInputArea's construct function,load project information!
 if(m_InputArea!=NULL)
 delete m_InputArea;
 m_InputArea=new tInputArea(m_sgInputArea,&m_ProjectInfo);
 return true;
}

 //--注意：文本文件（NOTEPAD.EXE 生成的文件在
 //--每一行头有一个"\0" 换行符，必须切除
bool tCurProject::VerifyProjectFile(AnsiString file)
{
  if( !FileExists(file))
  {
  ShowMessage(" 工程文件 " + file + AnsiString("  不存在！"));
  return false;}
  TStringList *strList=new TStringList();
  strList->LoadFromFile(file);
  if(strList->Count==0)
 return false;

 //------------------  除掉字符串前后空格
  for(int i=0;i<strList->Count;)
  {

   if(Trim(strList->Strings[i])=="")
   {strList->Delete(i);
    i=0;
    continue;}

    i++;
    }
    for(int i=0;i<strList->Count;i++)
   {

  strList->Strings[i].Trim();
  // strList->Strings[i].Delete(0,3);
     }
//------------------------------
   if(strList->Strings[0]!= "[Cx-2 studio zbin 2000]")
   {
   ShowMessage(" 工程文件 " + file + AnsiString("  不是合法的进度项目文件！"));
   return false;
   }
 //-----------------------------
 //---------------------------------
  m_ProjectInfo.m_ProjectName=file;
  m_ProjectInfo.m_StrList=strList;//工程项目信息调入ProjectInfo

  m_ProjectInfo.m_etTitle=GetValue(strList->Strings[2]);
  m_ProjectInfo.m_etCorporation=GetValue(strList->Strings[3]);
  m_ProjectInfo.m_etPrintTime=GetValue(strList->Strings[4]);
  m_ProjectInfo.Cols=GetValue(strList->Strings[5]).ToInt();

  return true;

}

//得到项目文件中的参数‘=’号右边的值
AnsiString tCurProject::GetValue(AnsiString str)
{
  int index=str.AnsiPos(AnsiString("="));
  if(index==0)
  {ShowMessage("参数" + str +"错误");return AnsiString("0");}
  return Trim(str.SubString(index+1,str.Length()-index));

}






