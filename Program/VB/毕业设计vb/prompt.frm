VERSION 5.00
Begin VB.Form prompt 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "职工当月工资   "
   ClientHeight    =   2556
   ClientLeft      =   2724
   ClientTop       =   2784
   ClientWidth     =   3768
   LinkTopic       =   "Form6"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2556
   ScaleWidth      =   3768
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame2 
      Height          =   852
      Left            =   1560
      TabIndex        =   5
      Top             =   1560
      Width           =   2172
      Begin VB.CommandButton Command2 
         Caption         =   "取 消"
         Height          =   468
         Left            =   1200
         TabIndex        =   7
         Top             =   240
         Width           =   852
      End
      Begin VB.CommandButton cmdappend 
         Caption         =   "添 加 "
         Height          =   492
         Left            =   120
         TabIndex        =   6
         Top             =   240
         Width           =   852
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "已有职工"
      Height          =   2412
      Left            =   120
      TabIndex        =   3
      Top             =   0
      Width           =   1332
      Begin VB.ListBox List1 
         Height          =   2028
         Left            =   120
         TabIndex        =   4
         Top             =   240
         Width           =   1092
      End
   End
   Begin VB.TextBox Text1 
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   15.6
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C00000&
      Height          =   372
      Left            =   1800
      TabIndex        =   0
      Top             =   840
      Width           =   1572
   End
   Begin VB.Label Labfind 
      Caption         =   "输入查找职工工号："
      Height          =   252
      Left            =   1680
      TabIndex        =   2
      Top             =   360
      Visible         =   0   'False
      Width           =   1692
   End
   Begin VB.Label Labappend 
      AutoSize        =   -1  'True
      Caption         =   "输入添加职工工号："
      Height          =   180
      Left            =   1680
      TabIndex        =   1
      Top             =   360
      Width           =   1620
   End
End
Attribute VB_Name = "prompt"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub cmdappend_Click()
Dim code
Dim book
Form1.Data2.DatabaseName = path
Form1.Data2.RecordSource = "select  * from  zgxx order by gh"
Form1.Data2.Refresh
If Trim(Text1.Text) = "" Then
MsgBox "the code is empty, retry!", vbOKOnly
Exit Sub
End If
code = "gh=" & "'" & Trim(Text1.Text) & "'"
Form1.Data2.Recordset.FindFirst code
If Form1.Data2.Recordset.NoMatch Then
MsgBox "此职工不存在!，你必须添加此职工信息", vbOKOnly, fuck
Text1.Text = ""
Exit Sub
End If
Form1.Show
Unload Me
End Sub

Private Sub Command2_Click()
Unload Me
End Sub


Private Sub Form_Load()
Dim db As Database
Dim rc As Recordset
Set db = OpenDatabase(path, False, True)
Set rc = db.OpenRecordset("select gh from zgxx order by gh ", dbOpenDynaset)
List1.Clear
Do While Not rc.EOF
If Not Trim(rc("gh")) = "" Then
List1.AddItem rc("gh")
End If
rc.MoveNext
Loop
End Sub

Private Sub List1_Click()
Text1.Text = List1.Text
End Sub
