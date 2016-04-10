// spDlg.cpp : implementation file
//

#include "stdafx.h"
#include "sp.h"
#include "spDlg.h"
#include "resource.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CSpDlg dialog


CSpDlg::CSpDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CSpDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CSpDlg)
	

	dlg=NULL;
	ChildVisible=false;
	m_size1 = -1;
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDI_ICON2);
}

void CSpDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CSpDlg)
	DDX_Control(pDX, IDC_EDIT2, m_splitsize);
	DDX_Radio(pDX, IDC_RADIO1, m_size1);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CSpDlg, CDialog)
	//{{AFX_MSG_MAP(CSpDlg)
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_BUTTON1, OnButton1)
	ON_BN_CLICKED(IDC_BUTTON2, OnButton2)
	ON_BN_CLICKED(IDC_BUTTON3, OnButton3)
	ON_WM_CTLCOLOR()
	ON_BN_CLICKED(IDC_RADIO3, OnRadio3)
	ON_BN_CLICKED(IDC_RADIO1, OnRadio1)
	ON_BN_CLICKED(IDC_RADIO2, OnRadio2)
	ON_BN_CLICKED(IDC_BUTTON4, OnButton4)
	ON_WM_MOVE()
ON_BN_CLICKED(IDC_BUTTON5, OnButton5)
	ON_WM_CONTEXTMENU()
	ON_WM_NCHITTEST()
	ON_WM_TIMER()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CSpDlg message handlers

BOOL CSpDlg::OnInitDialog()
{
	CDialog::OnInitDialog();
	CenterWindow();
//	::SetWindowPos(GetSafeHwnd(),HWND_TOPMOST,0,0,-1,-1, SWP_SHOWWINDOW );
SetTimer(10,1,0);

	GetWindowRect(&m_rc);
 	m_rc.left=m_rc.top=0;




Init();
	//SetDlgItemText(IDC_RICHEDIT1,s);

CMenu *menu=GetSystemMenu(0);
//PlaySound((LPCTSTR)MAKEINTRESOURCE(IDR_WAVE1),0,0X40004|0X1 );

menu->ModifyMenu(3,MF_BYPOSITION|MF_DISABLED,0,"ZBin.. ");

menu->ModifyMenu(4,MF_BYPOSITION|MF_DISABLED,0,"ZBin.. ");
menu->ModifyMenu(5,MF_BYPOSITION|MF_DISABLED,0," ZBin..");
menu->ModifyMenu(6,MF_BYPOSITION|MF_DISABLED,0," ZBin..");

 	SetIcon(m_hIcon, TRUE);			// Set big icon
 	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CSpDlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CSpDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CSpDlg::OnButton1() 
{
static char BASED_CODE  s[]="all(*.*)\0*.*\0book(*.txt)\0*.txt\0\0"	;

CFileDialog *file=new CFileDialog(1);
file->m_ofn.lpstrFilter=s;

file->DoModal();
CString s1;
s1=file->GetPathName();
SetDlgItemText(IDC_EDIT1,(LPCTSTR)s1);	
}

void CSpDlg::OnButton2() 
{
CString filename;
long filesize,blocksize=SplitSize,blocks,lastblocksize;
//buffer=0x10000
int i,j;

		GetDlgItemText(IDC_EDIT1,filename);
	filename.TrimLeft();
	filename.TrimRight(); 
	 if(filename.GetLength()==0)
	 {
		 AfxMessageBox("请选择进行切割的文件!");
		 return;
	 }
if( ((CButton *)GetDlgItem(IDC_RADIO3))->GetCheck()==1)
{
	SplitSize=GetDlgItemInt(IDC_EDIT2);
	if(SplitSize>=1024)
	{AfxMessageBox("文件切割块太大");
((CButton *)GetDlgItem(IDC_EDIT2))->SetWindowText("");

((CButton *)GetDlgItem(IDC_EDIT2))->SetFocus();
	return;
	}
	if(SplitSize==0)
	{AfxMessageBox("文件切割块不能为 0 !");
	((CButton *)GetDlgItem(IDC_EDIT2))->SetWindowText("");

	((CButton *)GetDlgItem(IDC_EDIT2))->SetFocus();
	return;
	}
SplitSize*=1024;
blocksize=SplitSize;
}



//ds[0]=new SplitFile("d:\\123");

//CString dsname[100];
//CFile ds[100];

//////////////


	CFile *_SplitFile=new CFile;
	if(!_SplitFile->Open((LPCTSTR)filename,CFile::modeRead|CFile::typeBinary))
	{
		AfxMessageBox("文件打开失败!");
		return ;
	}
	filesize=_SplitFile->GetLength();
	if(filesize==0 ||filesize<=blocksize)
	{
	AfxMessageBox("文件尺寸太小");
	_SplitFile->Close();
	delete _SplitFile;
	return;
	}

blocks=(int)filesize / blocksize;
lastblocksize=filesize-blocksize*blocks;
if(lastblocksize!=0)
{

	blocks++;

}

int len=filename.GetLength();
int at=filename.Find('.');
if( at==-1)  // 文件无扩展名称
{ len+=4;}
else
{
	len=at+4;
}
//filename.GetBufferSetLength(len);
char b[2];
long sk=0;
_SplitFile->SeekToBegin();
char *buf=new char[blocksize];

for(i=0;i<blocks-1;i++)
{

 ds[i]=new SplitFile(filename.GetBuffer(filename.GetLength()));

 if(!ds[i]->GetFile()->Open((LPCTSTR)ds[i]->GetFileName(),CFile::modeCreate|CFile::modeWrite|CFile::typeBinary))
{
	AfxMessageBox("Create file failed");
	return ;
}
 SplitFile::Count++;
 ds[i]->GetFile()->SeekToBegin();


_SplitFile->ReadHuge(buf,blocksize);
sk+=blocksize;
_SplitFile->Seek(sk,CFile::begin);
ds[i]->GetFile()->WriteHuge(buf,blocksize);
//ds[i].SeekToEnd();

ds[i]->GetFile()->Close();

}
	
if(filesize % blocksize==0)
{ _SplitFile->Close();
return ;

}
//lastblocksize=10 % 3;
ds[i]=new SplitFile(filename.GetBuffer(filename.GetLength()));



if(!ds[i]->GetFile()->Open((LPCTSTR)ds[i]->GetFileName(),CFile::modeCreate|CFile::modeWrite|CFile::typeBinary))
{
	AfxMessageBox("文件创建失败!");
	return ;
}
ds[i]->GetFile()->SeekToBegin();

_SplitFile->ReadHuge(buf,lastblocksize);

ds[i]->GetFile()->WriteHuge(buf,lastblocksize);
ds[i]->GetFile()->Close();
_SplitFile->Close();

CString tmp=" 切割有如下文件:\n";

for (j=0;j<=i;j++)
{
tmp+=ds[j]->GetFileName();
tmp+='\n';
}
SplitFile::Count=0;
AfxMessageBox(  tmp);

}

void CSpDlg::OnButton3() 
{
//	PlaySound((LPCTSTR)MAKEINTRESOURCE(IDR_WAVE1),0,0X40004|0X1 );

	AfxMessageBox("\nComplete! Thank You For Use It!\n\n1999-12-7    Z.Bin \nE-Mail:zbpost@371.net");

DestroyWindow();
	
}

HBRUSH CSpDlg::OnCtlColor(CDC* pDC, CWnd* pWnd, UINT nCtlColor) 
{
	HBRUSH hbr = CDialog::OnCtlColor(pDC, pWnd, nCtlColor);
	
	UINT id=pWnd->GetDlgCtrlID();
	if( nCtlColor==CTLCOLOR_EDIT  && id==IDC_EDIT2)
	{
		pDC->SetBkMode(TRANSPARENT);
		
		hbr=::CreateSolidBrush(RGB(255,0,0));
	}
	if(nCtlColor==CTLCOLOR_MSGBOX)
	{  		hbr=::CreateSolidBrush(RGB(255,0,255));
	}
	if(nCtlColor==CTLCOLOR_DLG )
	{  		hbr=::CreateSolidBrush(RGB(0,145,128));
	}
     	pDC->SetBkMode(TRANSPARENT);
			
	hbr=::CreateSolidBrush(RGB(0,145,128));
	return hbr;
}

void CSpDlg::Init()
{
((CButton *)GetDlgItem(IDC_RADIO1))->SetCheck(1);
//((CEdit *)GetDlgItem(IDC_EDIT2))->EnableWindow(false);
OnRadio1();

}

void CSpDlg::OnRadio3() 
{
((CEdit *)GetDlgItem(IDC_EDIT2))->EnableWindow(1);
	
}

void CSpDlg::OnRadio1() 
{
((CEdit *)GetDlgItem(IDC_EDIT2))->EnableWindow(false);	
SplitSize=(int)1024*1024*1.2;
//CString s;
//s.Format("%d",SplitSize);

//AfxMessageBox(s);
}

void CSpDlg::OnRadio2() 
{
((CEdit *)GetDlgItem(IDC_EDIT2))->EnableWindow(false);	
SplitSize=(int)1024*1024;
}

void CSpDlg::OnContextMenu(CWnd*, CPoint point)
{


		
}

void CSpDlg::OnButton4() 
{

if(!ChildVisible)
{
	ChildVisible=!ChildVisible;
dlg=new Combin(this);
dlg->Create(IDD_DIALOG1,this);
dlg->ShowWindow(SW_SHOWNORMAL);
SetDlgItemText(IDC_BUTTON4,"<<");
return;
}
if(ChildVisible)
{
	ChildVisible=!ChildVisible;
CenterWindow();
dlg->DestroyWindow();
SetDlgItemText(IDC_BUTTON4,">>");
//delete dlg;
dlg=NULL;
}
	
}

void CSpDlg::OnMove(int x, int y) 
{
	CDialog::OnMove(x, y);
if(!dlg	)
return ;
CRect rc;
GetWindowRect(&rc);
CRect rcme;
dlg->GetWindowRect(&rcme);
//MoveWindow(rc.left,rc.top-rc.Height(),rc.Width(),rc.Height(),true);

dlg->MoveWindow(rc.left,rc.top+rc.Height()-2,rc.Width(),rcme.Height(),true);
	
}

void CSpDlg::OnButton5() 
{
CRect CRc,WRc;
GetWindowRect(&WRc);	

GetClientRect(&CRc);
CString s;
s.Format("%d,%d,%d,%d",WRc.left,WRc.top,WRc.right,WRc.bottom);
s.Format("%d,%d,%d,%d",CRc.left,CRc.top,CRc.right,CRc.bottom);

AfxMessageBox(s);


}

UINT CSpDlg::OnNcHitTest(CPoint point)
{
return HTCAPTION;

}

void CSpDlg::OnTimer(UINT nIDEvent) 
{
	CDrawPt pt(this);
//	AfxMessageBox("time");
	pt.Draw();
	CDialog::OnTimer(nIDEvent);
}
