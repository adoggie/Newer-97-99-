VERSION 5.00
Object = "{00028C01-0000-0000-0000-000000000046}#1.0#0"; "DBGRID32.OCX"
Begin VB.Form Form9 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "瀑布式定义查询"
   ClientHeight    =   4200
   ClientLeft      =   36
   ClientTop       =   324
   ClientWidth     =   8880
   LinkTopic       =   "Form9"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4200
   ScaleWidth      =   8880
   StartUpPosition =   1  'CenterOwner
   Begin VB.OptionButton Opt 
      Caption         =   "当月工资"
      Height          =   252
      Index           =   2
      Left            =   2760
      TabIndex        =   5
      Top             =   3360
      Width           =   972
   End
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   6720
      Top             =   1680
   End
   Begin VB.OptionButton Opt 
      Caption         =   "姓名"
      Height          =   492
      Index           =   1
      Left            =   2040
      TabIndex        =   3
      Top             =   3240
      Width           =   612
   End
   Begin VB.OptionButton Opt 
      Caption         =   "工号"
      Height          =   252
      Index           =   0
      Left            =   1320
      TabIndex        =   2
      Top             =   3360
      Value           =   -1  'True
      Width           =   1092
   End
   Begin VB.Data Data1 
      Align           =   2  'Align Bottom
      Caption         =   "Data1"
      Connect         =   "Access"
      DatabaseName    =   ""
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   384
      Left            =   0
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   ""
      Top             =   3816
      Width           =   8880
   End
   Begin MSDBGrid.DBGrid DBGrid1 
      Bindings        =   "Form9.frx":0000
      Height          =   3012
      Left            =   120
      OleObjectBlob   =   "Form9.frx":0010
      TabIndex        =   0
      Top             =   120
      Width           =   8652
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "瀑布式查寻方式不能修改，改也没用！"
      ForeColor       =   &H00C000C0&
      Height          =   180
      Left            =   8280
      TabIndex        =   4
      Top             =   3360
      Width           =   3060
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "排序显示方式"
      Height          =   180
      Left            =   120
      TabIndex        =   1
      Top             =   3360
      Width           =   1080
   End
End
Attribute VB_Name = "Form9"
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
Data1.RecordSource = "select gh as [工  号 ],xm as [姓  名],zsr  as [总计月收入], zzc as [总计月支出],  gz as [当月工资] from  zgxx  order by gh"
Data1.Refresh
End Sub

Private Sub Form_Unload(Cancel As Integer)
Timer1.Enabled = False
End Sub

Private Sub Opt_Click(Index As Integer)
Select Case Index
Case 0
      Data1.RecordSource = "select gh as [工  号 ],xm as [姓  名],zsr  as [总计月收入], zzc  as [总计月支出],  gz as [当月工资] from  zgxx  order by gh"
Case 1
      Data1.RecordSource = "select gh as [工  号 ],xm as [姓  名],zsr  as [总计月收入], zzc  as [总计月支出],  gz as [当月工资] from  zgxx order by xm"
Case 2
    Data1.RecordSource = "select gh as [工  号 ],xm as [姓  名],zsr  as [总计月收入], zzc  as [总计月支出],  gz as [当月工资] from  zgxx order by gz"
End Select
Data1.Refresh
DBGrid1.Refresh
End Sub

Private Sub Timer1_Timer()
Static f As Boolean
If f = False Then
Label2.Left = Label2.Left - 20
If Label2.Left < (Form9.Width / 3) Then
f = True
End If
End If
If f = True Then
Label2.Left = Label2.Left + 20
If Label2.Left > Form9.Width - Label2.Width Then
f = False
End If
End If
End Sub
