VERSION 5.00
Object = "{00028C01-0000-0000-0000-000000000046}#1.0#0"; "DBGRID32.OCX"
Begin VB.Form Form10 
   ClientHeight    =   3936
   ClientLeft      =   48
   ClientTop       =   336
   ClientWidth     =   9144
   LinkTopic       =   "Form10"
   ScaleHeight     =   3936
   ScaleWidth      =   9144
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox Text2 
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000002&
      Height          =   372
      Left            =   3000
      TabIndex        =   2
      Text            =   "Text2"
      Top             =   3120
      Width           =   1692
   End
   Begin VB.TextBox Text1 
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000002&
      Height          =   372
      Left            =   480
      TabIndex        =   1
      Text            =   "全公司："
      Top             =   3120
      Width           =   1212
   End
   Begin VB.Data Data1 
      Align           =   2  'Align Bottom
      Caption         =   "Data1"
      Connect         =   "Access"
      DatabaseName    =   ""
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   372
      Left            =   0
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   ""
      Top             =   3564
      Width           =   9144
   End
   Begin MSDBGrid.DBGrid DBGrid1 
      Bindings        =   "Form10.frx":0000
      Height          =   2892
      Left            =   120
      OleObjectBlob   =   "Form10.frx":0010
      TabIndex        =   0
      Top             =   120
      Width           =   8892
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "实际支出"
      Height          =   180
      Left            =   1920
      TabIndex        =   3
      Top             =   3240
      Width           =   720
   End
End
Attribute VB_Name = "Form10"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Data1_Validate(Action As Integer, Save As Integer)
Save = 0
Data1.UpdateControls
End Sub


Private Sub Form_Load()
Dim s As Recordset
Dim f As Database
Data1.DatabaseName = path
Data1.RecordSource = "select bm as [部门],count(*) as [人数],sum(zzc) as [应扣总数],sum(zsr) as [应发总数],sum(gz) as [工资实发] from zgxx group by bm"
Data1.Refresh
Set f = OpenDatabase(path, False, False)
Set s = f.OpenRecordset("select sum(gz) as tgz from zgxx", dbOpenDynaset)
Text2.Text = s("tgz")
End Sub
