VERSION 5.00
Object = "{00028C01-0000-0000-0000-000000000046}#1.0#0"; "DBGRID32.OCX"
Begin VB.Form Form8 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "瀑布式定义查询"
   ClientHeight    =   4344
   ClientLeft      =   36
   ClientTop       =   324
   ClientWidth     =   9144
   LinkTopic       =   "Form8"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4344
   ScaleWidth      =   9144
   StartUpPosition =   1  'CenterOwner
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
      ForeColor       =   &H00FF0000&
      Height          =   288
      Left            =   8400
      TabIndex        =   8
      Text            =   "Text1"
      Top             =   3600
      Width           =   372
   End
   Begin VB.OptionButton Opt 
      Caption         =   "年龄"
      Height          =   348
      Index           =   4
      Left            =   4920
      TabIndex        =   7
      Top             =   3624
      Width           =   612
   End
   Begin VB.OptionButton Opt 
      Caption         =   "职称"
      Height          =   372
      Index           =   3
      Left            =   3720
      TabIndex        =   6
      Top             =   3600
      Width           =   732
   End
   Begin VB.OptionButton Opt 
      Caption         =   "部门"
      Height          =   372
      Index           =   2
      Left            =   6000
      TabIndex        =   5
      Top             =   3600
      Width           =   732
   End
   Begin VB.OptionButton Opt 
      Caption         =   "姓名"
      Height          =   372
      Index           =   1
      Left            =   2640
      TabIndex        =   4
      Top             =   3600
      Width           =   612
   End
   Begin VB.OptionButton Opt 
      Caption         =   "工号"
      Height          =   372
      Index           =   0
      Left            =   1560
      TabIndex        =   3
      Top             =   3600
      Value           =   -1  'True
      Width           =   732
   End
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   4200
      Top             =   3600
   End
   Begin MSDBGrid.DBGrid DBGrid1 
      Bindings        =   "Form8.frx":0000
      Height          =   3132
      Left            =   120
      OleObjectBlob   =   "Form8.frx":0010
      TabIndex        =   0
      Top             =   360
      Width           =   8892
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
      Top             =   3972
      Width           =   9144
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "TOTAL:"
      ForeColor       =   &H00004000&
      Height          =   180
      Left            =   7680
      TabIndex        =   9
      Top             =   3720
      Width           =   576
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "排序显示方式："
      Height          =   180
      Left            =   120
      TabIndex        =   2
      Top             =   3600
      Width           =   1260
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "瀑布式查寻方式不能修改，改也没用！"
      ForeColor       =   &H000000FF&
      Height          =   180
      Left            =   5640
      TabIndex        =   1
      Top             =   120
      Width           =   3060
   End
End
Attribute VB_Name = "Form8"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Data1_Reposition()
Data1.Caption = "当前第      " & (Data1.Recordset.AbsolutePosition + 1) & "     记录"

End Sub

Private Sub Data1_Validate(Action As Integer, Save As Integer)
Save = 0
Data1.UpdateControls
End Sub

Private Sub Form_Load()
Data1.DatabaseName = path
Data1.RecordSource = "select gh as 工号,xm as 姓名,nl as 年龄,zc as 职称,bm as 部门 from zgxx  order by  gh"
Data1.Refresh
Text1.Text = Data1.Recordset.RecordCount
End Sub

Private Sub Form_Unload(Cancel As Integer)
Timer1.Enabled = False
End Sub

Private Sub Opt_Click(Index As Integer)
Select Case Index
Case 0
    Data1.RecordSource = "select gh as 工号,xm as 姓名,nl as 年龄,zc as 职称,bm as 部门 from zgxx  order by  gh"
Case 1
Data1.RecordSource = "select gh as 工号,xm as 姓名,nl as 年龄,zc as 职称,bm as 部门 from zgxx  order by  xm"
Case 2
Data1.RecordSource = "select gh as 工号,xm as 姓名,nl as 年龄,zc as 职称,bm as 部门 from zgxx  order by  bm"
Case 3
Data1.RecordSource = "select gh as 工号,xm as 姓名,nl as 年龄,zc as 职称,bm as 部门 from zgxx  order by  zc"
Case 4
Data1.RecordSource = "select gh as 工号,xm as 姓名,nl as 年龄,zc as 职称,bm as 部门 from zgxx  order by  nl"
End Select
Data1.Refresh
DBGrid1.Refresh
End Sub

Private Sub Timer1_Timer()
Label1.Left = Label1.Left - 20
If Label1.Left < -Label1.Width - 100 Then
Label1.Left = Form8.Width
End If
End Sub
