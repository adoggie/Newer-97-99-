//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop


#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>

#include "tInputArea.cpp"
#pragma package(smart_init)




 //��װ�����ϵĿؼ�
class tCurProject {

private:
    TEdit *m_etTitle;
    TEdit *m_etCorporation;
    TEdit *m_etPrintTime;
    TStringGrid *m_sgInputArea;
    TProgressBar *m_StepBar;
public:
    tInputArea *m_InputArea;     //����һ����������������
    ProjectInfo m_ProjectInfo;   //����һ����ǰ��Ŀ��Ϣ�Ķ���


public:

    tCurProject(TEdit *etTitle,TEdit *etCorporation
                ,TEdit *etPrintTime,TStringGrid *sgInputArea,
                TProgressBar *pb);

public:

    bool VerifyProjectFile(AnsiString file); //У���ļ��Ƿ�Ϸ�
    AnsiString GetValue(AnsiString str);    //��str���� "="�ұߵ�ֵ

    void LoadDefaultInfo(void);   //�����ʼ����Ϣ����ǰ�ؼ�
    void CloseProject(void);     //�رյ�ǰ����
    void SaveProject(void);
//---------- ���빤����Ŀ�ļ�����ǰ
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
 ShowMessage("�ļ����̳���������������ļ�����");
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
 ShowMessage("�ļ�У�鲻��ͨ����");
 return false;}
 //----------  ���ؼ�����
 m_etTitle->Text=m_ProjectInfo.m_etTitle;
 m_etCorporation->Text=m_ProjectInfo.m_etCorporation;
 m_etPrintTime->Text=m_ProjectInfo.m_etPrintTime;
 //---- set cols
 m_sgInputArea->ColCount=m_ProjectInfo.Cols;
 //-----���� tInputArea's construct function,load project information!
 if(m_InputArea!=NULL)
 delete m_InputArea;
 m_InputArea=new tInputArea(m_sgInputArea,&m_ProjectInfo);
 return true;
}

 //--ע�⣺�ı��ļ���NOTEPAD.EXE ���ɵ��ļ���
 //--ÿһ��ͷ��һ��"\0" ���з��������г�
bool tCurProject::VerifyProjectFile(AnsiString file)
{
  if( !FileExists(file))
  {
  ShowMessage(" �����ļ� " + file + AnsiString("  �����ڣ�"));
  return false;}
  TStringList *strList=new TStringList();
  strList->LoadFromFile(file);
  if(strList->Count==0)
 return false;

 //------------------  �����ַ���ǰ��ո�
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
   ShowMessage(" �����ļ� " + file + AnsiString("  ���ǺϷ��Ľ�����Ŀ�ļ���"));
   return false;
   }
 //-----------------------------
 //---------------------------------
  m_ProjectInfo.m_ProjectName=file;
  m_ProjectInfo.m_StrList=strList;//������Ŀ��Ϣ����ProjectInfo

  m_ProjectInfo.m_etTitle=GetValue(strList->Strings[2]);
  m_ProjectInfo.m_etCorporation=GetValue(strList->Strings[3]);
  m_ProjectInfo.m_etPrintTime=GetValue(strList->Strings[4]);
  m_ProjectInfo.Cols=GetValue(strList->Strings[5]).ToInt();

  return true;

}

//�õ���Ŀ�ļ��еĲ�����=�����ұߵ�ֵ
AnsiString tCurProject::GetValue(AnsiString str)
{
  int index=str.AnsiPos(AnsiString("="));
  if(index==0)
  {ShowMessage("����" + str +"����");return AnsiString("0");}
  return Trim(str.SubString(index+1,str.Length()-index));

}






