VERSION 5.00
Begin VB.Form bmtj 
   Caption         =   "部门添加"
   ClientHeight    =   3456
   ClientLeft      =   2352
   ClientTop       =   2436
   ClientWidth     =   5616
   LinkTopic       =   "Form3"
   LockControls    =   -1  'True
   ScaleHeight     =   3456
   ScaleWidth      =   5616
   StartUpPosition =   1  'CenterOwner
   Begin VB.Frame Frame1 
      Height          =   2892
      Left            =   120
      TabIndex        =   7
      Top             =   480
      Width           =   2532
      Begin VB.ListBox List1 
         Height          =   2388
         Left            =   120
         TabIndex        =   8
         Top             =   240
         Width           =   2292
      End
   End
   Begin VB.TextBox Text2 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.8
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000C0&
      Height          =   264
      Left            =   1560
      TabIndex        =   6
      Top             =   120
      Width           =   372
   End
   Begin VB.CommandButton Command3 
      Caption         =   "退 出"
      Height          =   492
      Left            =   3480
      TabIndex        =   5
      Top             =   2640
      Width           =   1452
   End
   Begin VB.CommandButton Command2 
      Caption         =   "删 除"
      Height          =   492
      Left            =   3480
      TabIndex        =   3
      Top             =   1920
      Width           =   1452
   End
   Begin VB.CommandButton Command1 
      Caption         =   "添 加"
      Default         =   -1  'True
      Height          =   492
      Left            =   3480
      TabIndex        =   2
      Top             =   1320
      Width           =   1452
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
      Height          =   372
      Left            =   3120
      TabIndex        =   1
      Top             =   840
      Width           =   2172
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "部门"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   2880
      TabIndex        =   4
      Top             =   480
      Width           =   516
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      Caption         =   "现有部门："
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   0
      TabIndex        =   0
      Top             =   120
      Width           =   1284
   End
End
Attribute VB_Name = "bmtj"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim rs As Recordset: Dim dd As Database
Private Sub Command1_Click()
If Trim(Text1.Text) = "" Then
MsgBox "请输入部门名称！", vbOKOnly, " 笨 蛋！"
Text1.SetFocus
Exit Sub
End If
Command2.Enabled = True
tmp = Text1.Text
tmp = Trim(tmp)
If tmp = "" Then
MsgBox "must enter the name", vbOKOnly, "fuck you"
Exit Sub
Else
With rs
.AddNew
!bm = Trim(Text1.Text)
List1.AddItem !bm
List1.Refresh
.Update
End With
Text2.Text = rs.RecordCount
Text1.Text = ""
End If
End Sub
Private Sub Command2_Click()
msg = "bm=" & "'" & Trim(List1.Text) & "' "
rs.FindFirst msg
If rs.NoMatch Then
MsgBox "must select the item?", vbOKOnly, "fuck you"
Exit Sub
End If
rs.Delete
rs.MoveFirst
List1.Clear
Do While Not rs.EOF
List1.AddItem rs("bm")
rs.MoveNext
Loop
Text2.Text = rs.RecordCount
End Sub
Private Sub Command3_Click()
Unload Me
End Sub
Private Sub Form_Load()
Set dd = OpenDatabase(path, False)
Set rs = dd.OpenRecordset("select bm from bm", dbOpenDynaset)
Do While Not rs.EOF
List1.AddItem rs("bm")
rs.MoveNext
Loop
Text2.Text = rs.RecordCount
If rs.RecordCount = 0 Then Command2.Enabled = False
End Sub

