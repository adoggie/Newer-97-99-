VERSION 5.00
Begin VB.Form form4 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "我要查询"
   ClientHeight    =   2304
   ClientLeft      =   48
   ClientTop       =   336
   ClientWidth     =   4788
   LinkTopic       =   "Form3"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2304
   ScaleWidth      =   4788
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton Command2 
      Caption         =   "取  消"
      Height          =   372
      Left            =   2760
      TabIndex        =   3
      Top             =   1800
      Width           =   972
   End
   Begin VB.CommandButton Command1 
      Caption         =   "确  定"
      Default         =   -1  'True
      Height          =   372
      Left            =   1080
      TabIndex        =   2
      Top             =   1800
      Width           =   972
   End
   Begin VB.TextBox Text1 
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   14.4
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   1200
      TabIndex        =   1
      Top             =   1080
      Width           =   2295
   End
   Begin VB.Frame Frame1 
      Caption         =   "查询类型："
      Height          =   732
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4572
      Begin VB.OptionButton Opt 
         Caption         =   "姓名查询"
         Height          =   255
         Index           =   1
         Left            =   2520
         TabIndex        =   7
         Top             =   240
         Width           =   1815
      End
      Begin VB.OptionButton Opt 
         Caption         =   "工 号 查询"
         Height          =   255
         Index           =   0
         Left            =   840
         TabIndex        =   6
         Top             =   240
         Value           =   -1  'True
         Width           =   1215
      End
   End
   Begin VB.Label labxm 
      Caption         =   "姓 名"
      Height          =   252
      Left            =   480
      TabIndex        =   5
      Top             =   1200
      Visible         =   0   'False
      Width           =   732
   End
   Begin VB.Label Labgh 
      Caption         =   "工 号"
      Height          =   252
      Left            =   600
      TabIndex        =   4
      Top             =   1200
      Width           =   732
   End
End
Attribute VB_Name = "form4"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim findcode As Integer
Private Sub Command1_Click()
Dim gh, xm, book
book = form2.Data1.Recordset.Bookmark
Select Case findcode
Case ghfind
gh = "gh=" & "'" & Trim(Text1.Text) & "'"
form2.Data1.Recordset.FindFirst gh
If form2.Data1.Recordset.NoMatch Then
   MsgBox "无此职工信息！", vbOKOnly, "笨蛋 你有毛病啊！"
    form2.Data1.Recordset.Bookmark = book
Text1.Text = ""
Exit Sub
End If
Case xmfind
xm = "xm=" & "'" & Trim(Text1.Text) & "'"
form2.Data1.Recordset.FindFirst xm
If form2.Data1.Recordset.NoMatch Then
   MsgBox "无此职工信息！", vbOKOnly, "笨蛋 你有毛病啊！"
  form2.Data1.Recordset.Bookmark = book
Text1.Text = ""
Exit Sub
End If
End Select
Unload Me
End Sub
Private Sub Command2_Click()
Unload Me
End Sub

Private Sub Form_Load()
Labgh.Visible = False
findcode = ghfind
End Sub


Private Sub Opt_Click(Index As Integer)
Select Case Index
  Case 0
    Opt(1).Value = False
    Labgh.Visible = True
     labxm.Visible = False
findcode = ghfind
  Case 1
findcode = xmfind
  Opt(0).Value = False
 Labgh.Visible = False
  labxm.Visible = True
  End Select
  Text1.SetFocus
End Sub
