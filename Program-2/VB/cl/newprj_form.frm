VERSION 5.00
Begin VB.Form newprj_form 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Form3"
   ClientHeight    =   1800
   ClientLeft      =   30
   ClientTop       =   270
   ClientWidth     =   5385
   LinkTopic       =   "Form3"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1800
   ScaleWidth      =   5385
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command1 
      Caption         =   "del_system_curprj"
      Height          =   444
      Left            =   552
      TabIndex        =   3
      Top             =   1248
      Width           =   2244
   End
   Begin VB.CommandButton ok 
      Caption         =   "ok"
      Default         =   -1  'True
      Height          =   324
      Left            =   3312
      TabIndex        =   1
      Top             =   1008
      Width           =   876
   End
   Begin VB.TextBox txt_newprj 
      Height          =   324
      Left            =   1032
      TabIndex        =   0
      Top             =   528
      Width           =   2532
   End
   Begin VB.Label Label1 
      Caption         =   "newproject"
      Height          =   300
      Left            =   140
      TabIndex        =   2
      Top             =   60
      Width           =   1000
   End
End
Attribute VB_Name = "newprj_form"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Set SystemRS = Nothing
Set SystemRS = SystemDB.OpenRecordset("cur_project", dbOpenDynaset)
While Not SystemRS.EOF
SystemRS.Delete
SystemRS.MoveNext
Wend

Unload Me
End Sub

Private Sub ok_Click()
If Len(Trim(txt_newprj.TEXT)) = 0 Then
MsgBox "enter the project name"
txt_newprj.SetFocus
Exit Sub
End If

Set SystemRS = Nothing
Set SystemRS = SystemDB.OpenRecordset("cur_project", dbOpenDynaset)
SystemRS.FindFirst "projectname=" & "'" & Trim(txt_newprj.TEXT) & "'"
If Not SystemRS.NoMatch Then
MsgBox "此工程已存在"
txt_newprj.SelStart = 0
txt_newprj.SelLength = Len(txt_newprj.TEXT)
txt_newprj.SetFocus
Exit Sub
End If




Call AppendProject(Trim(txt_newprj.TEXT)) '拷贝client.mdb 到当前工程目录下
SystemRS.AddNew
SystemRS!ProjectName = Trim(txt_newprj.TEXT)
SystemRS!ProjectPath = CurRunDBPath
SystemRS.Update
CurRunDBName = Trim(txt_newprj.TEXT)       'now running database name


Me.Hide
MDIForm1.p1(0).Enabled = True
append.Show , MDIForm1

Unload Me

End Sub

