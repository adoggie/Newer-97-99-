//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "Progressor.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Edit1"
#pragma resource "*.dfm"

TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
m_CurProject=NULL;
m_ProjectList=NULL;
}
//---------------------------------------------------------------------------




void __fastcall TForm1::FormCreate(TObject *Sender)
{
m_ProjectList=new tProjectList(cmbProjectList);
m_CurProject=new tCurProject(etTitle,etCorporation,etPrintTime,sgInputArea,StepBar);
//this->BoundsRect=TRect(this->BoundsRect.left,this->BoundsRect.top,
//                        Panel1->BoundsRect.right,Panel1->BoundsRect.bottom);

this->ClientHeight=this->Panel1->Height;

RECT rc;
RECT desktoprc;
int x=GetSystemMetrics(SM_CXSCREEN);
int y=GetSystemMetrics(SM_CYSCREEN);

GetWindowRect(this->Handle,&rc);
TRect m_rc(rc);

SetWindowPos(this->Handle,HWND_TOPMOST,(x-m_rc.Width())/2,(y-m_rc.Height())/2,
                                        this->Width,
                                      this->Height,SWP_SHOWWINDOW);


}
//---------------------------------------------------------------------------

void __fastcall TForm1::btAddSubRangeClick(TObject *Sender)
{
m_CurProject->m_InputArea->AddSubRange();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::btDelSubRangeClick(TObject *Sender)
{
m_CurProject->m_InputArea->DelSubRange();
}
//---------------------------------------------------------------------------





void __fastcall TForm1::sgInputAreaGetEditText(TObject *Sender, int ACol,
      int ARow, AnsiString &Value)
{
//ShowMessage("getedit");
}
//---------------------------------------------------------------------------


void __fastcall TForm1::sgInputAreaSelectCell(TObject *Sender, int ACol,
      int ARow, bool &CanSelect)
{
//ShowMessage("select cell");
//sgInputArea->Cells[0][ARow]="   "+AnsiString(++ARow);
m_CurProject->m_InputArea->DrawIndex();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::btnCreateProjectClick(TObject *Sender)
{
//m_cmbPorjectList->ItemIndex=-1;

AnsiString NewProjectName=InputBox("","�����¹����ļ���,��Ҫ����չ��","");
if(NewProjectName=="")
return;
AnsiString str;
int Handle;
try{
//---------------
 str=ChangeFileExt(NewProjectName,".prj");

if(FileExists(str))
{ShowMessage("�Ѿ���ͬ������Ŀ�ļ����ڣ�");
return;}
Handle=FileCreate(str);
if(Handle==-1)
{
ShowMessage("�ļ���������������Ϸ����ļ�����");
return;}
//-----------------------
FileClose(Handle);
 }
 catch(...)
 {
 ShowMessage("������Ϸ����ļ����ƣ�");
 return;
 }
m_CurProject->SaveToFile(""); //���浱ǰ������Ϣ���ļ�

//��յ�ǰ���пؼ������ݣ�����ΪĬ��ֵ
m_CurProject->CloseProject();

m_CurProject->m_ProjectInfo.m_ProjectName=str;
cmbProjectList->Items->Add(str);
cmbProjectList->ItemIndex=cmbProjectList->Items->Count-1;


//cmbProjectList->Add(NewProjectName);
//����ʼ�������Ŀ����д���½����Ĺ��������ļ�
m_CurProject->SaveToFile("");
 //
BitBtn1->Enabled=true;
sgInputArea->Enabled=true;
sgInputArea->Visible=true;
this->ClientHeight=Panel2->Top+Panel2->Height;

RECT rc;
RECT desktoprc;
int x=GetSystemMetrics(SM_CXSCREEN);
int y=GetSystemMetrics(SM_CYSCREEN);

GetWindowRect(this->Handle,&rc);
TRect m_rc(rc);

SetWindowPos(this->Handle,HWND_TOPMOST,(x-m_rc.Width())/2,(y-m_rc.Height())/2,
                                        this->Width,
                                      this->Height,SWP_SHOWWINDOW);
                                       
}
//---------------------------------------------------------------------------


void __fastcall TForm1::Button3Click(TObject *Sender)
{
//ShowMessage(sgInputArea->Rows[0]->Count);
//ShowMessage(sgInputArea->Rows[1]->Count);
m_CurProject->SaveToFile("1111.prj");
}
//---------------------------------------------------------------------------



void TForm1::DisableSystemCommandButton(TMessage msg)
{
   if(msg.WParam==SC_MAXIMIZE)
{

   ShowMessage("cannot max window!");
   return ;}

   TForm::Dispatch(&msg);

   }

void __fastcall TForm1::cmbProjectListClick(TObject *Sender)
{
//ShowMessage("you click me!");
//���浱ǰ�����Ĺ��̣�
//m_CurProject->SaveProject();
m_CurProject->SaveToFile("");
AnsiString ProjectName=cmbProjectList->Items->Strings[cmbProjectList->ItemIndex];

m_CurProject->LoadProject(ProjectName);
BitBtn1->Enabled=true;
sgInputArea->Enabled=true;
sgInputArea->Visible=true;
this->ClientHeight=Panel2->Top+Panel2->Height;

RECT rc;
RECT desktoprc;
int x=GetSystemMetrics(SM_CXSCREEN);
int y=GetSystemMetrics(SM_CYSCREEN);

GetWindowRect(this->Handle,&rc);
TRect m_rc(rc);

SetWindowPos(this->Handle,HWND_TOPMOST,(x-m_rc.Width())/2,(y-m_rc.Height())/2,
                                        this->Width,
                                      this->Height,SWP_SHOWWINDOW);
                                       

}
//---------------------------------------------------------------------------

void __fastcall TForm1::FormClose(TObject *Sender, TCloseAction &Action)
{
m_CurProject->SaveToFile("");        
}
//---------------------------------------------------------------------------


void __fastcall TForm1::btDeleteCurProjectClick(TObject *Sender)
{
ShowMessage("Sorry! i love you! You Cannot Delete It!");        
}
//---------------------------------------------------------------------------

void __fastcall TForm1::BitBtn2Click(TObject *Sender)
{
ShowMessage("Print Preview no Effect!\n \
             I have no more time!");

}
//---------------------------------------------------------------------------

void __fastcall TForm1::StaticText1Click(TObject *Sender)
{
Form2->ShowModal();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::StaticText1MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
Timer1->Enabled=true;        
}
//---------------------------------------------------------------------------


void __fastcall TForm1::Timer1Timer(TObject *Sender)
{
if(tInfo::IsCursorInControl(StaticText1))
{StaticText1->Font->Color=clRed;
}
else
{StaticText1->Font->Color=clBlue;Timer1->Enabled=false;}

}
//---------------------------------------------------------------------------




void __fastcall TForm1::BitBtn1Click(TObject *Sender)
{

        m_CurProject->SaveToFile(""); //���浱ǰ������Ϣ���ļ�
        TPrinter *p=Printer();

//        ProjectInfo::CheckInputAreaData(sgInputArea,m_CurProject->m_InputArea->m_nRange);

        if(tPrintInfo::GetPrinterCount()==0)
        {ShowMessage("û�п��õĴ�ӡ��������ӣ�");
        return;}


      Form3->ShowModal();  //Show PrintSetup Dialog!
        if(Form3->Visible)
        return;


      Application->ProcessMessages();


   //-------else printing

        p->Orientation=poLandscape ; //Set Orientation paper
        p->BeginDoc();
        m_CurProject->m_ProjectInfo.Print(Form3->Info,sgInputArea,StepBar);
       p->EndDoc();

}
//---------------------------------------------------------------------------

void __fastcall TForm1::btDeleteLineClick(TObject *Sender)
{


//==========  Remove Line
int Cols=sgInputArea->ColCount;
  int Rows=sgInputArea->RowCount;
  int i,j;
  int SelRow=sgInputArea->Row;


  for( i=SelRow;i<Rows;i++)
  {
   for(j=1;j<Cols;j++)
    {
    sgInputArea->Cells[j][i]=sgInputArea->Cells[j][i+1];                                                                                                                                                
    }
  }
  for(j=1;j<Cols;j++)
  {
   sgInputArea->Cells[j][Rows-1]="";
   }





}
//---------------------------------------------------------------------------

void __fastcall TForm1::btInsertLineClick(TObject *Sender)
{
//========  Insert Line
  int Cols=sgInputArea->ColCount;
  int Rows=sgInputArea->RowCount;
  int i,j;
  int SelRow=sgInputArea->Row;


  for( i=Rows-2;i>=SelRow;i--)
  {
   for(j=1;j<Cols;j++)
    {
    sgInputArea->Cells[j][i+1]=sgInputArea->Cells[j][i];
    }
  }
  for(j=1;j<Cols;j++)
  {
   sgInputArea->Cells[j][SelRow]="";
   }

}
//---------------------------------------------------------------------------




