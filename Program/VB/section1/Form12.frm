VERSION 5.00
Begin VB.Form Form6 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "备份当月数据库"
   ClientHeight    =   2016
   ClientLeft      =   36
   ClientTop       =   324
   ClientWidth     =   4200
   LinkTopic       =   "Form6"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2016
   ScaleWidth      =   4200
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton Command2 
      Caption         =   "取 消"
      Height          =   372
      Left            =   2640
      TabIndex        =   3
      Top             =   1320
      Width           =   972
   End
   Begin VB.CommandButton Command1 
      Caption         =   "确 定"
      Default         =   -1  'True
      Height          =   372
      Left            =   840
      TabIndex        =   2
      Top             =   1320
      Width           =   972
   End
   Begin VB.TextBox Text1 
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.8
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000002&
      Height          =   372
      Left            =   960
      TabIndex        =   0
      Top             =   600
      Width           =   2652
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "文件路径："
      Height          =   180
      Left            =   120
      TabIndex        =   1
      Top             =   720
      Width           =   900
   End
End
Attribute VB_Name = "Form6"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()

On Error GoTo n
If Trim(Text1.Text) = "" Then
MsgBox "请输入文件名！", vbOKOnly, "fuck you"
Exit Sub
End If
FileCopy App.path & "\tmpfile.mdb", Trim(Text1.Text)
Unload Me
n:
Text1.Text = ""
End Sub

Private Sub Command2_Click()
Unload Me
End Sub


