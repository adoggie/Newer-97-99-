//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

//#include "tAdditional.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)

 //#include <winuser.h>
 #include "windows.h"
 //#include <vcl/dstring.h>
 #include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <Buttons.hpp>
#include <Dialogs.hpp>

 class tAdditional{
  public:
    bool SetWindowTopMost(HWND hwnd);
    bool DisableMaxButton(HWND hwnd);
    };

bool tAdditional::SetWindowTopMost(HWND hwnd)
{
        RECT rc;
        GetWindowRect(hwnd,&rc);
        SetWindowPos(hwnd,HWND_TOPMOST,rc.left,\
                rc.top,rc.right-rc.left,rc.bottom-rc.top,SWP_SHOWWINDOW);

return true;
}


 bool tAdditional::DisableMaxButton(HWND hwnd)
{
HMENU hmenu=GetSystemMenu(hwnd,false);
//HMENU hsubmenu;
ModifyMenu(hmenu,4,MF_BYPOSITION|MF_GRAYED,0,"哈哈  zbin 1998");

if(!hmenu) return false;

  return true;



       }
//---------------------------------------------------------------
//------------------------------------------
class FileInfo{
public:
char name[MAX_PATH];
int sizeByte;
int  sizeKB;
int sizeMB;

public:
FileInfo(AnsiString str);
 };
 FileInfo::FileInfo(AnsiString str)
 {
 memset(name,0,MAX_PATH);
 strcpy(name,str.c_str());
 int handle=FileOpen(str,fmOpenRead);
 if(handle==-1)
 ShowMessage("open failure");
 
 FileSeek(handle,0,0);
 sizeByte=FileSeek(handle,0,2);
  sizeKB=sizeByte/1024;
  sizeMB=sizeKB/1024;
  FileClose(handle);

 }

class sp{

private:
  bool IsInputDataOK;
  FileInfo *f;
  int m_SpSize;
  AnsiString m_CombineFile;
  TListBox * m_LbFiles;

  AnsiString m_SpFile;
  TComboBox *m_SelectBox;
  TProgressBar *m_StepBar;
  AnsiString m_PieceSize;

  public:
    sp(AnsiString spfile/* 切割的文件名称*/
       ,AnsiString sizepiece/*文件片大小*/,
       TComboBox *select/*大小模式B KB MB*/,
       TProgressBar *bar);
  ~sp(){
  if(f==NULL)
  return;
  delete f;}
    bool RunSp(void);
    bool RunCombine(void);
    sp(AnsiString CombinFile, TListBox * lbFiles, TProgressBar *StepBar);
};







sp::sp(AnsiString spfile/* 切割的文件名称*/
       ,AnsiString sizepiece/*文件片大小*/,
       TComboBox *select/*大小模式B KB MB*/,
       TProgressBar *bar)
{
//
//IsInputDataOK=false;
//f=new FileInfo(spfile);
m_SpFile=spfile;
m_PieceSize=sizepiece;
m_SelectBox=select;
m_StepBar=bar;
IsInputDataOK=true;
f=NULL;
m_SpSize=0;

}


bool sp::RunSp(void)
{
m_SpSize=0;
  if(Trim(m_SpFile)=="")
  {ShowMessage("请选择切割的文件！");
  return false;
  }
  if(!FileExists(m_SpFile))
   {ShowMessage("File  " +m_SpFile+"不存在!");
    return false;}
//  ShowMessage(m_SpFile);


 f=new FileInfo(m_SpFile);
//-------------------
 AnsiString str="0123456789.";
 int i=0;
 for(;i<m_PieceSize.Length();i++)
 {
  if(str.AnsiPos(m_PieceSize.SubString(i,1))==0)
  {

   ShowMessage("切割的文件片大小输入有误，只能为数值型。");
   goto Error2;
   }
  }
  //-------------------------
  m_SpSize= m_PieceSize.ToInt();
  if(m_SpSize==0)
{  ShowMessage("不能为零!");
  return false;
   }
 switch(m_SelectBox->ItemIndex)
 {
  case 0:/* BYTE*/
        if(m_SpSize>f->sizeByte)
        {goto InputError;}

        break;
  case 1:/*KB*/
        if(m_SpSize>f->sizeKB)
        {goto InputError;}
        m_SpSize*=1024;
        break;
  case 2:/* MB */
        if(m_SpSize>f->sizeMB)
        {goto InputError;}
        m_SpSize*=1024*1024;

        break;

  default: break;
  InputError:
  ShowMessage("文件片大小大于切割文件的大小，非法");
 // ShowMessage(AnsiString(m_SpSize) +"   "+ AnsiString(f->sizeByte));
  Error2:
  return false;
}
// ShowMessage(m_SpSize);
// return false;
 //-------- Run split it!

 int BlockFile;
 if(f->sizeByte%m_SpSize!=0)
        BlockFile=(int)f->sizeByte/m_SpSize+1;
  else
         BlockFile=(int)f->sizeByte/m_SpSize;


//ShowMessage(BlockFile);
//return false;

str=f->name; Trim(str);
TStringList *strList=new TStringList;
AnsiString ExtName=".";
int *FileHandles=new int[BlockFile];

int FileHandle=FileOpen(AnsiString(f->name),fmOpenRead);
if(FileHandle==-1)
{
ShowMessage("读文件错误");
return false;
}


//return false;

for(i=0;i<BlockFile;i++)
{

ExtName=i;

if(i<10)
ExtName="00" + ExtName;
if(i<100 && i>10)
ExtName="0" + ExtName;
 ExtName="."+ExtName;
str=ChangeFileExt(str,ExtName);
//ShowMessage(str);
//return false;
FileHandles[i]=FileCreate(str);
strList->Add(str);
str=f->name; Trim(str);
}

//for(i=0;i<strList->Count;i++)
//str+=strList->Strings[i]+"\n";

//ShowMessage(str);

//FileClose(FileHandle);
//return false;
/*if(m_SpSize>=1024*1024)
{Buf=new char[1024*1024];
BlockSize=1024*1024;
}
else
{
*/
//Buf=new char[1];
//BlockSize=m_SpSize;
char *Buf=new char[m_SpSize];int ReadSize=1;

m_StepBar->Min=0;
m_StepBar->Max=BlockFile;
m_StepBar->Position=0;
m_StepBar->Smooth=true;
m_StepBar->Step=ReadSize;

int WhichFileHandle=0;

for(i=0;i<BlockFile-1;i++)
{
FileRead(FileHandle,Buf,m_SpSize);
FileWrite(FileHandles[i],Buf,m_SpSize);
FileClose(FileHandles[i]);
m_StepBar->StepIt();
}
if(f->sizeByte %m_SpSize!=0)
{
FileRead(FileHandle,Buf,f->sizeByte %m_SpSize);
FileWrite(FileHandles[i],Buf,f->sizeByte %m_SpSize);
FileClose(FileHandles[i]);
m_StepBar->StepIt();
}

/*for(i=1;i<=f->sizeByte;i++)
{

FileRead(FileHandle,Buf,ReadSize);
FileWrite(FileHandles[WhichFileHandle],Buf,ReadSize);
FileSeek(FileHandles[WhichFileHandle],1,1);
m_StepBar->StepIt();
if(i%m_SpSize==0)
{
FileClose(FileHandles[WhichFileHandle]);
WhichFileHandle++;

}
}
*/
FileClose(FileHandles[WhichFileHandle]);
m_StepBar->Position=0;

//for(i=0;i<strList->Count;i++)
//str=strList->Strings[i]+"\n";

ShowMessage("分割文件成功！\n" );

 delete Buf;
 FileClose(FileHandle);

  return true;
}


bool sp::RunCombine(void)
{
    int CombineFileHandle=FileCreate(m_CombineFile);
    int FileHandle;
    char *Buf;
    m_StepBar->Min=0;
    m_StepBar->Max=m_LbFiles->Items->Count;
    m_StepBar->Position=0;
    m_StepBar->Step=1;
    for(int i=0;i<m_LbFiles->Items->Count;i++)
    {
     f=new FileInfo(m_LbFiles->Items->Strings[i]);
     Buf=new char[f->sizeByte];
     FileHandle=FileOpen(m_LbFiles->Items->Strings[i],fmOpenRead);
     FileRead(FileHandle,Buf,f->sizeByte);
     FileClose(FileHandle);
     FileWrite(CombineFileHandle,Buf,f->sizeByte);
     FileSeek(CombineFileHandle,0,2);
     m_StepBar->StepIt();
     delete  []Buf;
     delete f;

    }
    FileClose(CombineFileHandle);
    m_StepBar->Position=0;
    ShowMessage("文件合并成功！");

    return true;
}


sp::sp(AnsiString CombineFile, TListBox * lbFiles, TProgressBar *StepBar)
{
 m_CombineFile=CombineFile;
 m_LbFiles=lbFiles;
 m_StepBar=StepBar;
}

