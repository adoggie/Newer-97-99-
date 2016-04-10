// ombin.cpp : implementation file
//

#include "stdafx.h"
#include "sp.h"
#include "ombin.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// Combin dialog


Combin::Combin(CWnd* pParent /*=NULL*/)
//	: CDialog(Combin::IDD, pParent)
{
	//{{AFX_DATA_INIT(Combin)
	p=pParent;// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void Combin::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(Combin)
		// NOTE: thlassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(Combin, CDialog)
	//{{AFX_MSG_MAP(Combin)
	ON_WM_CTLCOLOR()
ON_COMMAND(IDC_APPEND,OnAppend)
ON_LBN_SELCHANGE(IDC_FILES,OnSelectChange)
ON_COMMAND(IDC_UP,OnUp)
ON_COMMAND(IDC_DOWN,OnDown)
ON_COMMAND(IDC_DELETE,OnDelete)
ON_COMMAND(IDC_COMBIN,OnCombin)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// Combin message handlers

BOOL Combin::OnInitDialog() 
{
	CDialog::OnInitDialog();
CRect rc;
p->GetWindowRect(&rc);
CRect rcme;
GetWindowRect(&rcme);
//p->ClientToScreen(&rc);
p->MoveWindow(rc.left,rc.top-rcme.Height(),rc.Width(),rc.Height(),true);
p->GetWindowRect(&rc);
GetWindowRect(&rcme);
MoveWindow(rc.left,rc.top+rc.Height()-2,rc.Width(),rcme.Height(),true);


_Combin.SubclassDlgItem(IDC_COMBIN,this);
Delete.SubclassDlgItem(IDC_DELETE,this);
Append.SubclassDlgItem(IDC_APPEND,this);
Up.SubclassDlgItem(IDC_UP,this);
Down.SubclassDlgItem(IDC_DOWN,this);
Files.SubclassDlgItem(IDC_FILES,this);


_Combin.EnableWindow(0);
Delete.EnableWindow(0);
Up.EnableWindow(0);
Down.EnableWindow(0);
	// TODO: Add extra initialization here
	
	return 0;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void Combin::PostNcDestroy()
{
delete this;
}

HBRUSH Combin::OnCtlColor(CDC* pDC, CWnd* pWnd, UINT nCtlColor) 
{
	HBRUSH hbr = CDialog::OnCtlColor(pDC, pWnd, nCtlColor);
		hbr=::CreateSolidBrush(RGB(0,145,128));
  //	pDC->SetBkMode(TRANSPARENT);	
	if(nCtlColor==CTLCOLOR_DLG)
	{
	hbr=::CreateSolidBrush(RGB(0,145,128));
  	pDC->SetBkMode(TRANSPARENT);	
	}
	if(nCtlColor==CTLCOLOR_LISTBOX)
	{	hbr=::CreateSolidBrush(RGB(0,0,0));
pDC->SetTextColor(RGB(0,255,255));
  	pDC->SetBkMode(TRANSPARENT);	
	}
	// TODO: Return a different brush if the default is not desired
	return hbr;
}

void Combin::OnAppend()
{
CFileDialog *dlg=new CFileDialog(true);
dlg->m_ofn.lpstrTitle="选择添加合并的文件!";
dlg->m_ofn.Flags|=OFN_ALLOWMULTISELECT;
char *file=new char [500];
memset(file,' ',500);
dlg->m_ofn.lpstrFile=file;
dlg->m_ofn.nMaxFile=500;


if(dlg->DoModal()==IDCANCEL)
{
//AfxMessageBox("run");
delete dlg;
delete file;
	return;
}


CString s[50];
int i=0,j;
POSITION pos;
pos=dlg->GetStartPosition();

while(pos)
{
	s[i]=dlg->GetNextPathName(pos);
i++;
}
if(i!=0)
{
	_Combin.EnableWindow(1);
}
else
{return;}

for(j=0;j<i;j++)
{
Files.AddString((LPCTSTR)s[j]);

}
delete file;
delete dlg;

}

void Combin::OnSelectChange()
{
//AfxMessageBox("djkf");
int ListCount=Files.GetCount();
const int End=(ListCount-1);
if(Files.GetCurSel()==0)
{
		Up.EnableWindow(0);
		if(ListCount!=1)
			Down.EnableWindow(1);
		else
			Down.EnableWindow(0);
}
else if(Files.GetCurSel()==End)
{Down.EnableWindow(0);
Up.EnableWindow(1);}

else
{			Down.EnableWindow(1);	
Up.EnableWindow(1);
}
		Delete.EnableWindow(1);
		_Combin.EnableWindow(1);



}

void Combin::OnUp()
{
	CString up,down,cur;
	int now=Files.GetCurSel();
	Files.GetText(now,cur);
Files.InsertString(now-1,(LPCTSTR)cur);
Files.SetCurSel(now-1);
	Files.DeleteString(now+1);
	int ListCount=Files.GetCount();

now=Files.GetCurSel();
if(now==0)
{	Up.EnableWindow(0);
	Down.EnableWindow(1);
}

if(now==0 && ListCount==1)
{ 
//	Up.EnableWindow(0);
	Down.EnableWindow(0);
}
OnSelectChange();
}
void Combin::OnDown()
{
	CString up,down,cur;
	int now=Files.GetCurSel();
	Files.GetText(now+1,down);

Files.InsertString(now,(LPCTSTR)down);
Files.SetCurSel(now+1);
	Files.DeleteString(now+2);
	int ListCount=Files.GetCount();
OnSelectChange();
}
void Combin::OnDelete()
{
	int ListCount=Files.GetCount();
int now=Files.GetCurSel();
Files.DeleteString(Files.GetCurSel());
if(now==(ListCount-1))
{
Files.SetCurSel(--now);
}
else if(now<(ListCount-1))
{
Files.SetCurSel(now);
}
OnSelectChange();
ListCount=Files.GetCount();
if(ListCount==0)
{
	Up.EnableWindow(0);
	Down.EnableWindow(0);
	_Combin.EnableWindow(0);
}


}

void Combin::OnCombin()
{


	CFileDialog *Save=new CFileDialog(false);
Save->m_ofn.lpstrTitle="输入合并成的文件名称";
if(Save->DoModal()==IDCANCEL)
{
end:
	delete Save;

	return;
}
CString SaveFile=Save->GetPathName();

int ListCount=Files.GetCount();
int i,j;
CString *s=new CString[100];
CString g;
for(i=0;i<ListCount;i++)
{
	Files.GetText(i,(s[i]));
	g+=s[i];
}
//AfxMessageBox(g);
//delete []s;
//return;

CFile *To=new CFile();
CFile *From;
if(!To->Open((LPCTSTR)SaveFile,CFile::modeCreate|CFile::modeWrite|CFile::typeBinary))
{
AfxMessageBox("文件创建出错！");
goto end;

}
char *buf=NULL;
long pos=0;
To->SeekToBegin();
CString Alert;
for(j=0;j<ListCount;j++)
{
	From=new CFile();
	if(!From->Open((LPCTSTR)s[j],CFile::modeRead|CFile::typeBinary))
	{
		Alert+=s[j]+"文件读取出错";
	delete []s;
if(buf)
 delete []buf;
		goto end;
	}
	buf=new char[From->GetLength()];
	From->SeekToBegin();
	From->ReadHuge(buf,From->GetLength());
//	From->Close;
//	delete From;
	
	To->Seek(pos,CFile::begin);
	To->WriteHuge(buf,From->GetLength());
	pos+=From->GetLength();

	From->Close();
	delete From;
	From=NULL;
	delete []buf;buf=NULL;
}
To->Close();
delete To;
delete []s;
AfxMessageBox("合并文件成功！");





}
