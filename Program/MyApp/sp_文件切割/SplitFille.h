// SplitFile.h: interface for the SplitFile class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_SplitFile_H__FE080741_63FC_11BE_AB82_5254AB122F77__INCLUDED_)
#define AFX_SplitFile_H__FE080741_63FC_11BE_AB82_5254AB122F77__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

class SplitFile  
{
public:
	CFile * GetFile();
	static int Count;
	char * GetFileName();
	 SplitFile(char *Name);
	SplitFile();
	virtual ~SplitFile();
/////////////
	/////////
private:
CFile *f;
char *FileName;
long OpenMode;

BOOL Successful;
long Size;

private:
	void ModifyName();
	void Modify_(int len);

};

#endif // !defined(AFX_SplitFile_H__FE080741_63FC_11BE_AB82_5254AB122F77__INCLUDED_)
