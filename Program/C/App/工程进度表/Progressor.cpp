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

AnsiString NewProjectName=InputBox("","输入新工程文件名,不要带扩展名","");
if(NewProjectName=="")
return;
AnsiString str;
int Handle;
try{
//---------------
 str=ChangeFileExt(NewProjectName,".prj");

if(FileExists(str))
{ShowMessage("已经有同名的项目文件存在！");
return;}
Handle=FileCreate(str);
if(Handle==-1)
{
ShowMessage("文件创建出错，请输入合法的文件名！");
return;}
//-----------------------
FileClose(Handle);
 }
 catch(...)
 {
 ShowMessage("请输入合法的文件名称！");
 return;
 }
m_CurProject->SaveToFile(""); //保存当前工程信息到文件

//清空当前所有控件的数据，设置为默认值
m_CurProject->CloseProject();

m_CurProject->m_ProjectInfo.m_ProjectName=str;
cmbProjectList->Items->Add(str);
cmbProjectList->ItemIndex=cmbProjectList->Items->Count-1;


//cmbProjectList->Add(NewProjectName);
//将初始化后的项目内容写入新建立的工程数据文件
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
//保存当前操作的工程，
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

        m_CurProject->SaveToFile(""); //保存当前工程信息到文件
        TPrinter *p=Printer();

//        ProjectInfo::CheckInputAreaData(sgInputArea,m_CurProject->m_InputArea->m_nRange);

        if(tPrintInfo::GetPrinterCount()==0)
        {ShowMessage("没有可用的打印机！请添加！");
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




