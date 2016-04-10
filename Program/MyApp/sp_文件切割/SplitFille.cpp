// SplitFile.cpp: implementation of the SplitFile class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "sp.h"
#include "SplitFille.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

int SplitFile::Count=0;

SplitFile::SplitFile()
{

}

SplitFile::~SplitFile()
{

}

SplitFile::SplitFile(char * Name)
{

int len=strlen(Name);
len++; //v包括回车符号
FileName=new char[len];
//len=strlen(FileName);
strncpy(FileName,Name,len);
ModifyName();
///**********  Open Files and Create it! *************//
OpenMode=CFile::modeCreate|CFile::typeBinary;
f=new CFile();
/*
if(!f->Open((LPCTSTR)FileName,OpenMode))
{
	AfxMessageBox(FileName);
	AfxMessageBox("File Creating Failed!");
	delete f;
	return;
}
//Count++;//统计
*/
//////////////////////////////////////////////////


}

void SplitFile::ModifyName()
{
int i,j;
int len;
for(i=0;i< strlen(FileName);i++)
{
	if(FileName[i]=='.')
	{
		len=i+4;
		Modify_(len);
		return;
	}
}
len=i+4;
Modify_(len);
return;

}

void SplitFile::Modify_(int len)
{
	char buf[3];
char *Name=new  char[ len+1];
Name[len]='\0';
//memset(Name,' ',len);
strncpy(Name,FileName,strlen(FileName));
delete FileName;
FileName=Name;
FileName[len-4]='.';
itoa(Count,buf,10);
if(Count<10)
{
	    FileName[len-3]='0';
		FileName[len-2]='0';
		FileName[len-1]=buf[0];
}	
else if(Count >=10 && Count<100)
{FileName[len-3]='0';
		FileName[len-2]=buf[0];
		FileName[len-1]=buf[1];
}
else if(Count >=100)
{
	FileName[len-3]=buf[0];
		FileName[len-2]=buf[1];
		FileName[len-1]=buf[2];
}


return;


}

char * SplitFile::GetFileName()
{
return FileName;

}

CFile * SplitFile::GetFile()
{
return f;

}
