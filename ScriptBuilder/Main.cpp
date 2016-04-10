//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Main.h"
//#include "Wait.h"


//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFormMain *FormMain;
//---------------------------------------------------------------------------
__fastcall TFormMain::TFormMain(TComponent* Owner)
    : TForm(Owner)
{
    bLocal=false;
    nActive=-1;
    strViewTitle="-- 表视图: ";
    strTableTitle="-- 表结构: ";
    strStoreProcTitle="-- 存储过程: ";
    strIndexTitle="-- 表索引: ";
    strTriggerTitle="-- 触发器：";
    strSequenceTitle="-- 序列: ";
    }
//---------------------------------------------------------------------------

void __fastcall TFormMain::FormCreate(TObject *Sender)
{
    InitCtrl();
	InitAlias();  //初始别名列表
}
//---------------------------------------------------------------------------
void TFormMain::InitAlias(void)
{
 	//Session->Open();
    Session->GetAliasNames( cbAlias->Items);
    cbAlias->ItemIndex=-1;
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::cbAliasClick(TObject *Sender)
{
	LoadInfo();
    InitValue();

}
//---------------------------------------------------------------------------

void TFormMain::LoadInfo()
{

	// 问题：如何判断是本地数据库还是网络SQL-SERVER数据库
    TStringList *lstTable=new TStringList;
    TStringList *lstStoreProc=new TStringList;
    TStringList *lstView=new TStringList;
    TQuery *QryTmp=new TQuery(NULL);
    try{
	clbTables->Items->Clear();
    clbStoreProcs->Items->Clear();
    clbViews->Items->Clear();
    lbTableInfo->Caption="";
    lbStoreProcInfo->Caption="";
    lbViewInfo->Caption="";
    lbTriggerInfo->Caption="";
    lbSequenceInfo->Caption="";

    DBConnect->Close();
    AnsiString strDBName=cbAlias->Items->Strings[cbAlias->ItemIndex];
    DBConnect->AliasName=strDBName ;
    DBConnect->DatabaseName  = "bb";
    DBConnect->LoginPrompt=true;
    DBConnect->KeepConnection=true;
    DBConnect->Open();

    //测试是否为ORACLE数据库
    QryTmp->Close();
    QryTmp->DatabaseName=DBConnect->DatabaseName;
    QryTmp->SQL->Text="SELECT SYSDATE FROM DUAL";
    QryTmp->Open();

    // 是否是本地还是`网络数据库
    bLocal=!DBConnect->IsSQLBased;
    // 表
    if(bLocal){
        clbTables->Items=lstTable;
    }
    else{
        QryTmp->Close();
        QryTmp->DatabaseName=DBConnect->DatabaseName;
        QryTmp->SQL->Text="SELECT TABLE_NAME FROM SYS.USER_ALL_TABLES GROUP BY TABLE_NAME";
        QryTmp->Open();
        lstTable->Clear();
        while (!QryTmp->Eof){
            lstTable->Add(QryTmp->FieldByName("TABLE_NAME")->AsString);
            QryTmp->Next();
        }
       clbTables->Items=lstTable;
    }
    delete lstTable;

   	for(int i=0;i<clbTables->Items->Count;i++)
    {
     	clbTables->Checked[i]=true;
    }
    lbTableInfo->Caption=AnsiString(clbTables->Items->Count);

    if(bLocal)  return;     //  没有其他的数据可操作的了

/*---------------------------------*/    // 存储过程
    QryStoreProc->Close();
    QryStoreProc->DatabaseName=DBConnect->DatabaseName;
    QryStoreProc->SQL->Text="Select NAME From SYS.USER_SOURCE GROUP BY NAME";
    QryStoreProc->Open();
    while(!QryStoreProc->Eof)    {
        lstStoreProc->Add(QryStoreProc->FieldByName("NAME")->AsString);
        QryStoreProc->Next();
    }
    clbStoreProcs->Items=lstStoreProc;
    delete lstStoreProc;
   	for(int i=0;i<clbStoreProcs->Items->Count;i++)   {
     	clbStoreProcs->Checked[i]=true;
    }
    lbStoreProcInfo->Caption=AnsiString(clbStoreProcs->Items->Count);

/*---------------------------------*/    //  视图
    QryView->Close();
    QryView->DatabaseName=DBConnect->DatabaseName;
    QryView->SQL->Text="Select VIEW_NAME,TEXT From SYS.USER_VIEWS";
    QryView->Open();
    while(!QryView->Eof)
    {
        lstView->Add(QryView->FieldByName("VIEW_NAME")->AsString);
        QryView->Next();
    }
    clbViews->Items=lstView;
    delete lstView;

   	for(int i=0;i<clbViews->Items->Count;i++)
    {
     	clbViews->Checked[i]=true;
    }
    lbViewInfo->Caption=AnsiString(clbViews->Items->Count);

/*---------------------------------*/  //触发器
    QryTmp->Close();
    QryTmp->SQL->Text="SELECT TRIGGER_NAME,DESCRIPTION,TRIGGER_BODY FROM SYS.USER_TRIGGERS";
    QryTmp->Open();
    clbTriggers->Items->Clear();
    if(!QryTmp->IsEmpty())
    {
        while(!QryTmp->Eof)
        {
            clbTriggers->Items->Add(QryTmp->FieldByName("TRIGGER_NAME")->AsString);
            QryTmp->Next();
        }
    }
    for(int i=0;i<clbTriggers->Items->Count;i++)
    {
     	clbTriggers->Checked[i]=true;
    }
    lbTriggerInfo->Caption=clbTriggers->Items->Count;

/*---------------------------------*/  //序列
    QryTmp->Close();
    QryTmp->SQL->Text="SELECT * FROM SYS.USER_SEQUENCES ORDER BY SEQUENCE_NAME";
    QryTmp->Open();
    clbSqs->Items->Clear();
    if(!QryTmp->IsEmpty())
    {
        while(!QryTmp->Eof)
        {
            clbSqs->Items->Add(QryTmp->FieldByName("SEQUENCE_NAME")->AsString);
            QryTmp->Next();
        }
    }
    for(int i=0;i<clbSqs->Items->Count;i++)
    {
     	clbSqs->Checked[i]=true;
    }

    lbSequenceInfo->Caption=clbSqs->Items->Count;

    delete QryTmp;
    }
    catch(...)
    {
Error:
        if(lstTable) delete lstTable;
        if(lstStoreProc) delete lstStoreProc;
        if(lstView) delete lstView;
        if(QryTmp) delete QryTmp;

        ShowMessage("数据初始化失败, 检测是否连接的是Oracle数据库 或 用户和密码输入是否正确");
        cbAlias->ItemIndex=-1;
        return;
    }
}

//---------------------------------------------------------------------------
// 初始化界面控件行为
void TFormMain::InitCtrl(void)
{
    lbTableInfo->Caption="";
    lbStoreProcInfo->Caption="";
    lbViewInfo->Caption="";
    lbTriggerInfo->Caption="";
    lbSequenceInfo->Caption="";

    btStruct->Down=false;
    btRecord->Down=false;
    btStoreProc->Down=false;
    btView->Down=false;
    btTrigger->Down=false;
    btSq->Down=false;
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::PopMenuPopup(TObject *Sender)
{

    ItemSelectAll->Visible=true;
    ItemSelectNone->Visible=true;
    ItemExport->Visible=true;
    ItemExport->Enabled=false;

    ItemSp1->Visible=true;
    ItemSp2->Visible=true;

    ItemOpenAs->Visible=true;
    ItemOpenAs->Enabled=false;

    if(AnsiString(PopMenu->PopupComponent->ClassName()).Trim()=="TCheckListBox")
    {
        if(((TCheckListBox*) PopMenu->PopupComponent)->Items->Count==0)
        {
            ItemSelectAll->Visible=false;
            ItemSelectNone->Visible=false;
            ItemExport->Visible=false;
            ItemSp1->Visible=false;
            ItemSp2->Visible=false;
            ItemOpenAs->Visible=false;
            return;
        }
    }
    else
    {
        ItemOpenAs->Enabled=true;
        ItemExport->Enabled=true;
    }
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ItemSelectAllClick(TObject *Sender)
{
    if(AnsiString(PopMenu->PopupComponent->ClassName()).Trim()=="TCheckListBox")
    {
        TCheckListBox *Tmp=(TCheckListBox*) PopMenu->PopupComponent;
        for(int i=0;i<Tmp->Items->Count;i++)
        {
            Tmp->Checked[i]=true;
        }
        return;
    }
    Memo1->SelectAll();
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ItemSelectNoneClick(TObject *Sender)
{
    if(AnsiString(PopMenu->PopupComponent->ClassName()).Trim()=="TCheckListBox")
    {
        TCheckListBox *Tmp=(TCheckListBox*) PopMenu->PopupComponent;
        for(int i=0;i<Tmp->Items->Count;i++)
        {
            Tmp->Checked[i]=false;
        }
         return;
    }
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::clbTablesDblClick(TObject *Sender)
{
    int Index=clbTables->ItemIndex;
    AnsiString strSelTable=clbTables->Items->Strings[Index];
    QryData->Close();
    QryData->DatabaseName= DBConnect->DatabaseName;
    QryData->SQL->Text="Select * From "+ strSelTable;
    DBGrid->Hint="表 "+strSelTable;
    QryData->Open();
}
//---------------------------------------------------------------------------

void TFormMain::InitValue(void)
{
    //如果当前没有数据连接则返回
    if(cbAlias->ItemIndex<0||bLocal)    return;

    switch(nActive)
    {
        case ALIAS:
                    break;
        case TABLES:
                    ShowTables();
                    break;
        case STOREPROCS:
                    ShowStoreProcs();
                    break;
        case VIEWS:
                    ShowViews();
                    break;
        case TRIGGERS:
                    ShowTriggers();
                    break;
        case SEQUENCES:
                    ShowSequences();
                    break;
        default:;
    }

}

void TFormMain::ShowTables(void)
{
    Memo1->Lines->Clear();
    bool bStruct=btStruct->Down;
    bool bRecord=btRecord->Down;
    TQuery *QryTmpRecord=new TQuery(NULL);
    QryTmpRecord->DatabaseName=DBConnect->DatabaseName;
    TQuery *QryTmp=new TQuery(NULL);
    QryTmp->DatabaseName=DBConnect->DatabaseName;
    TQuery *QryPk=new TQuery(NULL);  //主键 SYS_USER_CONSTRAINT
    QryPk->DatabaseName=DBConnect->DatabaseName;
    TQuery *QryPkCol=new TQuery(NULL);  //主键  SYS_USER_CONS_COLUMNS
    QryPkCol->DatabaseName=DBConnect->DatabaseName;


    AnsiString strTable,strSQL;
    AnsiString strColumn,strType,strPrecision,strScale ;
    AnsiString Value;
    //bool bNullAble=false;
    AnsiString strNullAble; //SYS_USER_TAB_COLUMNS.NULLABLE   "N / Y "
    AnsiString strDefault;  // 缺省值  SYS_USER_TAB_COLUMNS.DEFAULT_LENGTH  为空则无缺省值
    AnsiString strPkName;  //表主键
    TStringList *lstTmpColumn=new TStringList;
    TStringList *lstTmpType=new TStringList;

    if(bStruct)
    {
        Memo1->Lines->Add("-- 以下为表结构： ");
        for(int i=0;i<clbTables->Items->Count;i++)
        {
            if(clbTables->Checked[i] )
            {
                strTable=clbTables->Items->Strings[i];
                QryTmp->Close();
                QryTmp->SQL->Text="Select * From SYS.USER_TAB_COLUMNS Where TABLE_NAME= '" + strTable+ "'";
                QryTmp->Open();

                if(QryTmp->IsEmpty())   continue;

                strSQL="CREATE TABLE " +strTable +" ( ";
                while (!QryTmp->Eof)
                {
                    strColumn= QryTmp->FieldByName("COLUMN_NAME")->AsString+" ";
                    strType=QryTmp->FieldByName("DATA_TYPE")->AsString+" ";
                    strPrecision="("+QryTmp->FieldByName("DATA_LENGTH")->AsString;
                    strScale=QryTmp->FieldByName("DATA_SCALE")->AsString ;
                    strNullAble=QryTmp->FieldByName("NULLABLE")->AsString ;
                    if(strScale!="")
                        strScale="," +strScale;
                    strScale+=") ";

                    if(strNullAble.Trim().UpperCase()=="N")     //判断是否可为空
                        strScale+=" NOT NULL ";
                    else
                    {
                        if(QryTmp->FieldByName("DEFAULT_LENGTH")->AsString.Trim()!="")
                        {
                            strDefault=QryTmp->FieldByName("DATA_DEFAULT")->AsString;
                            //if(strType.UpperCase().Trim()=="VARCHAR2"||strType.UpperCase().Trim()=="CHAR")
                            //    strDefault="'" + strDefault +"'";
                            strScale+=" DEFAULT " +strDefault;
                        }
                    }
                    strScale+=" , ";

                    if(strType.UpperCase().Trim()=="DATE")  //如果是日期型，则没有字段定义参数
                    {
                        strPrecision="";
                        strScale=" , ";
                    }
                    strSQL+= strColumn +strType + strPrecision+strScale;
                    QryTmp->Next();
                }

                strSQL=strSQL.Trim().SubString(1,strSQL.Trim().Length()-1);

//------------------------------------------------------------------------------
                QryPk->Close();
                QryPk->SQL->Text="SELECT C.COLUMN_NAME,A.CONSTRAINT_NAME FROM SYS.USER_CONS_COLUMNS A,SYS.USER_CONSTRAINTS B,SYS.USER_TAB_COLUMNS C \
                                    WHERE \
                                    B.CONSTRAINT_TYPE='P' AND \
                                    A.CONSTRAINT_NAME=B.CONSTRAINT_NAME AND \
                                    A.POSITION=C.COLUMN_ID AND \
                                    B.TABLE_NAME=C.TABLE_NAME AND\
                                    C.TABLE_NAME='"+strTable+"' ORDER BY C.COLUMN_ID ";
                QryPk->Open();
                strPkName="";
                if(!QryPk->IsEmpty())
                {
                    //int i=QryPk->RecordCount;
                    strSQL+=", CONSTRAINT " + QryPk->FieldByName("CONSTRAINT_NAME")->AsString+ " PRIMARY KEY (";
                    while (!QryPk->Eof)
                    {
                        strPkName+=QryPk->FieldByName("COLUMN_NAME")->AsString+",";
                        QryPk->Next();
                    }
                    strPkName=strPkName.Trim();
                    strPkName=strPkName.SubString(1,strPkName.Length()-1);
                    strPkName+=") ";

                }
//------------------------------------------------------------------------------
                strSQL+=strPkName;
                strSQL+=");" ;
                Memo1->Lines->Add(strTableTitle+strTable);
                Memo1->Lines->Add(strSQL);
//Add Indexes------------------------------------------------------------------------------
                QryTmp->Close();
                QryTmp->SQL->Text="SELECT A.INDEX_NAME,A.UNIQUENESS,B.COLUMN_NAME ,A.TABLE_NAME\
                                    FROM SYS.USER_INDEXES A,SYS.USER_IND_COLUMNS B\
                                    WHERE A.INDEX_NAME=B.INDEX_NAME AND  A.TABLE_NAME='"+strTable +"' \
                                    ORDER BY B.COLUMN_POSITION";
                QryTmp->Open();
                AnsiString strIndexCol="";
                AnsiString strIndexName="";
                if(!QryTmp->IsEmpty())
                {
                    strIndexName=QryTmp->FieldByName("INDEX_NAME")->AsString;
                    while(!QryTmp->Eof)
                    {
                        if(QryTmp->FieldByName("INDEX_NAME")->AsString!=strIndexName)
                        {
                            strSQL=" CREATE ";
                            if(QryTmp->FieldByName("UNIQUENESS")->AsString.Trim()=="UNIQUE")
                                strSQL+=" UNIQUE ";
                            strSQL+=" INDEX "+strIndexName+ " ON "+QryTmp->FieldByName("TABLE_NAME")->AsString;
                            strIndexCol=strIndexCol.Trim().SubString(1,strIndexCol.Trim().Length()-1);  // Rid " , "
                            strSQL+=" ( "+strIndexCol+ " ); ";
                            Memo1->Lines->Add(strIndexTitle);
                            Memo1->Lines->Add(strSQL);
                            //New Index-Name
                            strIndexName=QryTmp->FieldByName("INDEX_NAME")->AsString;
                            strIndexCol="";
                        }
                        strIndexCol+=QryTmp->FieldByName("COLUMN_NAME")->AsString+",";
                        QryTmp->Next();
                    }
                    strSQL=" CREATE ";
                    if(QryTmp->FieldByName("UNIQUENESS")->AsString.Trim()=="UNIQUE")
                        strSQL+=" UNIQUE ";
                    strSQL+=" INDEX "+strIndexName+ " ON "+QryTmp->FieldByName("TABLE_NAME")->AsString;
                    strIndexCol=strIndexCol.Trim().SubString(1,strIndexCol.Trim().Length()-1);  // Rid " , "
                    strSQL+=" ( "+strIndexCol+ " );";
                    Memo1->Lines->Add(strIndexTitle);
                    Memo1->Lines->Add(strSQL);
                }
//------------------------------------------------------------------------------
            }
        }
    Memo1->Lines->Add("  ");
    }

    if(bRecord)
    {
        Memo1->Lines->Add("-- 以下为表记录： ");

        for(int i=0;i<clbTables->Items->Count;i++)
        {
            if(clbTables->Checked[i])
            {
                strTable=clbTables->Items->Strings[i];
                QryTmp->Close();
                QryTmp->SQL->Text="Select * From SYS.USER_TAB_COLUMNS Where TABLE_NAME= '" + strTable+ "'";
                QryTmp->Open();

                if(QryTmp->IsEmpty())   continue;

                strSQL="INSERT INTO " +strTable +" ( ";
                lstTmpColumn->Clear();
                lstTmpType->Clear();
                while (!QryTmp->Eof)
                {
                    strColumn= QryTmp->FieldByName("COLUMN_NAME")->AsString;
                    lstTmpColumn->Add(strColumn);//Add To List
                    lstTmpType->Add( QryTmp->FieldByName("DATA_TYPE")->AsString);
                    strSQL+= strColumn+",";
                    QryTmp->Next();
                }

                strSQL=strSQL.SubString(1,strSQL.Trim().Length()-1)+")";
                strSQL+=" VALUES(";
                AnsiString strStore=strSQL;

                QryTmpRecord->Close();
                QryTmpRecord->SQL->Text="Select * From "+ strTable;
                QryTmpRecord->Open();
                Memo1->Lines->Add("-- 表记录:"+strTable);
                if(QryTmpRecord->IsEmpty()) continue;
                while(!QryTmpRecord->Eof)
                {
                    for(int i=0;i<lstTmpColumn->Count;i++)
                    {
                        strType=lstTmpType->Strings[i];
                        strType=strType.UpperCase();
                        Value=QryTmpRecord->FieldByName(lstTmpColumn->Strings[i])->AsString;
                        Value=Value.UpperCase();
                        if( strType=="NUMBER")
                        {
                            if(Value=="")
                                Value="NULL";
                        }
                        else if(strType=="FLOAT")
                        {
                            if(Value=="")
                                Value="NULL";
                        }

                        else if(strType=="VARCHAR2")
                        {
                            if(Value=="")
                                Value="NULL";
                            else
                                Value="'"+Value+"'";
                        }
			else if(strType=="CHAR")
                        {
                            if(Value=="")
                                Value="NULL";
                            else
                                Value="'"+Value+"'";
                        }
                        else if(strType=="DATE")
                        {
                            if(Value=="")
                                Value="NULL";
                            else
                            {
                                TDateTime  dt(Value);
                                Value=dt.FormatString( "MM-DD-YYYY");
                                Value="TO_DATE('"+Value+"','MM-DD-YYYY')";
                            }
                        }
                        else if(strType=="BOOLEAN")
                        {
                            ;
                        }
                        strSQL+=Value+",";
                    }
                    strSQL=strSQL.SubString(1,strSQL.Length()-1)+");";
                    Memo1->Lines->Add(strSQL);
                    strSQL=strStore;
                    QryTmpRecord->Next();
                }
//------------------------------------------------------------------------------

            }
        }
    }
    delete QryPkCol;
    delete QryPk;
    delete QryTmpRecord;
    delete lstTmpColumn;
    delete lstTmpType;
    delete QryTmp;
}
void __fastcall TFormMain::tsTableShow(TObject *Sender)
{
    nActive=TABLES;
    InitValue();
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::tsAliaShow(TObject *Sender)
{
    nActive=ALIAS;
    InitValue();
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::tsViewShow(TObject *Sender)
{
    nActive=VIEWS;
    InitValue();
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::tsStoreProcShow(TObject *Sender)
{
    nActive=STOREPROCS;
    InitValue();
}

//------------------------------------------------------------------------------

void __fastcall TFormMain::tsTriggerShow(TObject *Sender)
{
//  触发器
    nActive=TRIGGERS;
    InitValue();
}

//---------------------------------------------------------------------------
void __fastcall TFormMain::btStructClick(TObject *Sender)
{
    SetMenuItemStatus();
    if(nActive!=TABLES)   return;
    InitValue();

}
//---------------------------------------------------------------------------

void __fastcall TFormMain::btRecordClick(TObject *Sender)
{
    SetMenuItemStatus();
    if(nActive!=TABLES)   return;
    InitValue();

}
//---------------------------------------------------------------------------

void __fastcall TFormMain::btStoreProcClick(TObject *Sender)
{
    SetMenuItemStatus();
    if(nActive!=STOREPROCS)   return;
    InitValue();
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::btViewClick(TObject *Sender)
{
    SetMenuItemStatus();
    if(nActive!=VIEWS)   return;
    InitValue();
}
//---------------------------------------------------------------------------


void TFormMain::ShowStoreProcs(void)
{
	AnsiString strStoreProc;
	AnsiString strSQLStoreProc;

	bool bStoreProc=btStoreProc->Down;
	if(!bStoreProc)
	{
		Memo1->Lines->Clear();
		return;
	}
	TQuery *QryTmpRecord=new TQuery(NULL);
	QryTmpRecord->DatabaseName=DBConnect->DatabaseName;

	Memo1->Lines->Clear();
	Memo1->Lines->Add("-- 以下为存储过程： ");

	bool bHead; // 决定是否加上前缀 CREATE OR REPLACE
	for(int i=0;i<clbStoreProcs->Items->Count;i++)
	{
		if(clbStoreProcs->Checked[i] )
		{
			QryTmpRecord->Close();   // 必须排序
			QryTmpRecord->SQL->Text="SELECT NAME,LINE,TEXT FROM SYS.USER_SOURCE WHERE NAME='"+ clbStoreProcs->Items->Strings[i].Trim()+"' ORDER BY LINE";
			QryTmpRecord->Open();
			strStoreProc=QryTmpRecord->FieldByName("NAME")->AsString;
			Memo1->Lines->Add(strStoreProcTitle+ strStoreProc);
			bHead=true;
			while(!QryTmpRecord->Eof)
			{
				strSQLStoreProc=QryTmpRecord->FieldByName("TEXT")->AsString;

				if(strSQLStoreProc.Trim()!="")
				{
                    strSQLStoreProc=strSQLStoreProc.Trim().SubString(1,strSQLStoreProc.Length()-1);
                    if(bHead)
                    {
                        Memo1->Lines->Add("CREATE OR REPLACE " + strSQLStoreProc );
                        bHead=false;
                    }
                    else
                        Memo1->Lines->Add(strSQLStoreProc );
                }
                QryTmpRecord->Next();
            }

        }
        Memo1->Lines->Strings[Memo1->Lines->Count-1]+=";";  // 加上结束符号
        Memo1->Lines->Add("");  // 加上空行
    }
        delete QryTmpRecord;
}

void TFormMain::ShowViews(void)
{
    AnsiString strView;
    AnsiString strSQLView;
    Memo1->Lines->Clear();
    bool bView=btView->Down;
    if(!bView)  return;

    TQuery *QryTmpRecord=new TQuery(NULL);
    QryTmpRecord->DatabaseName=DBConnect->DatabaseName;
    TQuery *QryTmp=new TQuery(NULL);
    QryTmp->DatabaseName=DBConnect->DatabaseName;

    QryTmpRecord->SQL->Text="SELECT VIEW_NAME,TEXT FROM SYS.USER_VIEWS ORDER BY VIEW_NAME";
    QryTmpRecord->Open();
    if(QryTmpRecord->IsEmpty())
    goto End;

    Memo1->Lines->Clear();
    Memo1->Lines->Add("-- 以下为表视图： ");

    for(int i=0;i<clbViews->Items->Count;i++)
    {
        strView=QryTmpRecord->FieldByName("VIEW_NAME")->AsString;
        strSQLView=QryTmpRecord->FieldByName("TEXT")->AsString;
        if(clbViews->Checked[i] )
        {
            Memo1->Lines->Add(strViewTitle+ strView);
            Memo1->Lines->Add("CREATE OR REPLACE VIEW " + strView.UpperCase()+" AS "+  strSQLView+";");
        }
        QryTmpRecord->Next();
    }

End:
        delete QryTmpRecord;
        delete QryTmp;
}

void __fastcall TFormMain::clbViewsDblClick(TObject *Sender)
{
    int Index=clbViews->ItemIndex;
    AnsiString strSelView=clbViews->Items->Strings[Index];
    QryData->Close();
    QryData->DatabaseName= DBConnect->DatabaseName;
    QryData->SQL->Text="Select * From "+ strSelView;
    DBGrid->Hint="视图 "+strSelView;
    QryData->Open();

}
//---------------------------------------------------------------------------


void __fastcall TFormMain::clbTablesClickCheck(TObject *Sender)
{
    int Index=clbTables->ItemIndex;
    if(clbTables->Checked[Index])
        InitValue();    
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::clbViewsClickCheck(TObject *Sender)
{
   int Index=clbViews->ItemIndex;
    if(clbViews->Checked[Index])
        InitValue();
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::clbStoreProcsClickCheck(TObject *Sender)
{
    int Index=clbStoreProcs->ItemIndex;
    if(clbStoreProcs->Checked[Index])
        InitValue();
}
//---------------------------------------------------------------------------


void __fastcall TFormMain::ItemOpenAsClick(TObject *Sender)
{
    if(AnsiString(PopMenu->PopupComponent->ClassName()).Trim()=="TCheckListBox")
    {

        return;
    }
    AnsiString strTmpFile="c:\\tmp";
    if(FileExists(strTmpFile))
    DeleteFile(strTmpFile);
    Memo1->Lines->SaveToFile(strTmpFile);
    WinExec(AnsiString("notepad.exe " + strTmpFile).c_str(),SW_MAXIMIZE);

}
//---------------------------------------------------------------------------

void __fastcall TFormMain::Help1Click(TObject *Sender)
{

    ShowMessage("Name:\tScriptBuilder \nBuilder:\t\tZBin \nTime:\t\t11/1/2000") ;
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ItemExportClick(TObject *Sender)
{
    if(!dlgSave->Execute()) return;
    try
    {
        Memo1->Lines->SaveToFile(dlgSave->FileName);
    }
    catch(...)
    {
        ShowMessage("导出文件错误！");
    }

}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ItemStructClick(TObject *Sender)
{
    if(ItemStruct->Checked)
        ItemStruct->Checked=false;
    else
        ItemStruct->Checked=true;
    btStruct->Down=ItemStruct->Checked;
    if(nActive!=TABLES)   return;
    InitValue();    
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ItemRecordClick(TObject *Sender)
{
    if(ItemRecord->Checked)
        ItemRecord->Checked=false;
    else
        ItemRecord->Checked=true;
    btRecord->Down=ItemRecord->Checked;
    if(nActive!=TABLES)   return;
    InitValue();    
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ItemStoreProcClick(TObject *Sender)
{
    if(ItemStoreProc->Checked)
        ItemStoreProc->Checked=false;
    else
        ItemStoreProc->Checked=true;
    btStoreProc->Down=ItemStoreProc->Checked;
    if(nActive!=STOREPROCS)   return;
    InitValue();    
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ItemViewClick(TObject *Sender)
{
    if(ItemView->Checked)
        ItemView->Checked=false;
    else
        ItemView->Checked=true;
    btView->Down=ItemView->Checked;
    if(nActive!=VIEWS)   return;
    InitValue();    
}
//---------------------------------------------------------------------------


void TFormMain::SetMenuItemStatus(void)
{
    ItemStruct->Checked=btStruct->Down;
    ItemRecord->Checked=btRecord->Down;
    ItemStoreProc->Checked=btStoreProc->Down;
    ItemView->Checked=btView->Down;
    ItemTrigger->Checked=btTrigger->Down;
    ItemSq->Checked=btSq->Down;
}
void __fastcall TFormMain::N3Click(TObject *Sender)
{
    Application->Terminate();
}
//---------------------------------------------------------------------------



void __fastcall TFormMain::Memo1Enter(TObject *Sender)
{
    ItemExportMain->Enabled=true;
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::Memo1Exit(TObject *Sender)
{
    ItemExportMain->Enabled=false;
}
//---------------------------------------------------------------------------


void TFormMain::ShowTriggers(void)
{

    Memo1->Lines->Clear();
    bool bTrigger=btTrigger->Down;
    if(!bTrigger)  return;

    TQuery * QryTmp=new TQuery(NULL);
    QryTmp->DatabaseName=DBConnect->DatabaseName;
    AnsiString strTrigger="";
    AnsiString strSQL="";

    AnsiString strTmp;
    for(int i=0;i<clbTriggers->Items->Count;i++)
    {
        if(!clbTriggers->Checked[i])  continue;
        strTrigger=clbTriggers->Items->Strings[i];
        QryTmp->Close();
        QryTmp->SQL->Text="SELECT DESCRIPTION,TRIGGER_BODY,TRIGGER_NAME \
                            FROM SYS.USER_TRIGGERS\
                            WHERE TRIGGER_NAME='"+ strTrigger.Trim()+ "'";
        QryTmp->Open();
        strTmp= QryTmp->FieldByName("TRIGGER_BODY")->AsString;
        strTmp=strTmp.SubString(1,strTmp.Length()-3);
        strSQL="CREATE OR REPLACE TRIGGER "  +QryTmp->FieldByName("DESCRIPTION")->AsString+ " "+strTmp;

        Memo1->Lines->Add(strTriggerTitle +QryTmp->FieldByName("TRIGGER_NAME")->AsString);
        Memo1->Lines->Add(strSQL);

        //RidChar(strTmp,Memo1->Lines);  //删除回车符号

    }

    delete QryTmp;

}
void __fastcall TFormMain::ItemTriggerClick(TObject *Sender)
{
    if(ItemTrigger->Checked)
        ItemTrigger->Checked=false;
    else
        ItemTrigger->Checked=true;
    btTrigger->Down=ItemTrigger->Checked;
    if(nActive!=TRIGGERS)   return;    
    InitValue();    
}
//---------------------------------------------------------------------------


void __fastcall TFormMain::btTriggerClick(TObject *Sender)
{
    SetMenuItemStatus();
    if(nActive!=TRIGGERS)   return;
    InitValue();
}
//---------------------------------------------------------------------------



void __fastcall TFormMain::clbTriggersClickCheck(TObject *Sender)
{
//
   int Index=clbTriggers->ItemIndex;
    if(clbTriggers->Checked[Index])
        InitValue();

}
//---------------------------------------------------------------------------


//  删除回车符号,插入字符串
void TFormMain::RidChar(AnsiString String,TStrings * lstMemo)
{
    AnsiString strTmp;
    char * pChar;
    char *pStart,*pEnd;

    pStart=String.c_str();
    for(int i=0;i<String.Length();i++)
    {
        pChar=String.c_str()+i;
        if(*(pChar+i)=='\n')
        {
            if(pChar>pStart)
            {
                strTmp.SetLength(pChar-pStart);
                strncpy(strTmp.c_str(),pStart,pChar-pStart);
                lstMemo->Add(strTmp);
            }
            pStart=pChar;
        }
    }


}
void __fastcall TFormMain::ItemSqClick(TObject *Sender)
{
    if(ItemSq->Checked)
        ItemSq->Checked=false;
    else
        ItemSq->Checked=true;
    btSq->Down=ItemSq->Checked;
    if(nActive!=SEQUENCES)   return;
    InitValue();
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::btSqClick(TObject *Sender)
{
    SetMenuItemStatus();
    if(nActive!=SEQUENCES)   return;
    InitValue();
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::tsSqShow(TObject *Sender)
{
//  序列号
    nActive=SEQUENCES;
    InitValue();

}
//---------------------------------------------------------------------------


void TFormMain::ShowSequences(void)
{
    //序列
    Memo1->Lines->Clear();
    AnsiString strSq,strSQL;
    bool bSq=btSq->Down;
    if(!bSq)  return;

    TQuery *QryTmp=new TQuery(NULL);
    QryTmp->DatabaseName=DBConnect->DatabaseName;
    QryTmp->SQL->Text="SELECT * FROM SYS.USER_SEQUENCES ORDER BY SEQUENCE_NAME";
    QryTmp->Open();

    Memo1->Lines->Clear();
    Memo1->Lines->Add("-- 以下为序列： ");

    for(int i=0;i<clbSqs->Items->Count;i++)
    {
        if(clbSqs->Checked[i] )
        {
            strSq=QryTmp->FieldByName("SEQUENCE_NAME")->AsString;
            Memo1->Lines->Add(strSequenceTitle+ strSq);
            strSQL="CREATE SEQUENCE ";
            strSQL+=strSq;
            strSQL+=" START WITH "+QryTmp->FieldByName("LAST_NUMBER")->AsString;
            strSQL+=" INCREMENT  BY "+QryTmp->FieldByName("INCREMENT_BY")->AsString;
            strSQL+=" MAXVALUE " +QryTmp->FieldByName("MAX_VALUE")->AsString;
            strSQL+=" MINVALUE " +QryTmp->FieldByName("MIN_VALUE")->AsString;
            strSQL+= QryTmp->FieldByName("CYCLE_FLAG")->AsString.Trim().UpperCase()=="Y" ? " CYCLE ":" NOCYCLE ";
            strSQL+=" CACHE "+QryTmp->FieldByName("CACHE_SIZE")->AsString;
            strSQL+=QryTmp->FieldByName("ORDER_FLAG")->AsString.Trim().UpperCase()=="Y" ? " ORDER ":" NOORDER ";
            strSQL+=";";
            Memo1->Lines->Add( strSQL);
        }
        QryTmp->Next();
    }

        delete QryTmp;
}

void __fastcall TFormMain::clbSqsClickCheck(TObject *Sender)
{
    InitValue();
}
//---------------------------------------------------------------------------



