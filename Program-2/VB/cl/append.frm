VERSION 5.00
Begin VB.Form append 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Form3"
   ClientHeight    =   1452
   ClientLeft      =   36
   ClientTop       =   264
   ClientWidth     =   6600
   ControlBox      =   0   'False
   LinkTopic       =   "Form3"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1452
   ScaleWidth      =   6600
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton ok 
      Caption         =   "ok"
      Height          =   324
      Left            =   240
      TabIndex        =   5
      Top             =   1008
      Width           =   3204
   End
   Begin VB.ListBox cur_project 
      Height          =   948
      Left            =   3600
      TabIndex        =   2
      Top             =   432
      Width           =   2916
   End
   Begin VB.CommandButton add 
      Caption         =   "发送 >"
      Default         =   -1  'True
      Height          =   324
      Left            =   2736
      TabIndex        =   1
      Top             =   456
      Width           =   756
   End
   Begin VB.TextBox Text1 
      Height          =   324
      Left            =   288
      TabIndex        =   0
      Top             =   456
      Width           =   2292
   End
   Begin VB.Label Label2 
      Caption         =   "新项目名称："
      Height          =   252
      Left            =   216
      TabIndex        =   4
      Top             =   72
      Width           =   1044
   End
   Begin VB.Label Label1 
      Caption         =   "现有具体项目："
      Height          =   228
      Left            =   3120
      TabIndex        =   3
      Top             =   96
      Width           =   1956
   End
End
Attribute VB_Name = "append"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public flag



Private Sub add_Click()
If Len(Trim(Text1.Text)) = 0 Then
Exit Sub
End If
RunRS.FindFirst "name='" & Trim(Text1.Text) & "'"
If RunRS.NoMatch Then
GoTo add
End If

MsgBox "The project have exist.."
Text1.Text = ""
Text1.SetFocus
Exit Sub
add:
cur_project.AddItem Trim(Text1.Text)
'Set RunRS = RunDB.OpenRecordset("gcmc", dbOpenDynaset)
RunRS.AddNew
RunRS!name = Trim(Text1.Text)
RunRS.Update
Text1.Text = ""
Text1.SetFocus




End Sub

Private Sub Form_Load()

Set RunRS = RunDB.OpenRecordset("gcmc", dbOpenDynaset)
If RunRS.RecordCount = 0 Then
Exit Sub
End If
While Not RunRS.EOF
cur_project.AddItem RunRS!name
cur_project.ItemData(cur_project.NewIndex) = 1976

RunRS.MoveNext
Wend


End Sub

Private Sub ok_Click()
Call creategcxm
Form1.Show
Unload Me

End Sub
Private Sub creategcxm()
Dim count As Integer
Dim i
Dim rs As Recordset
Dim tmpGcmc
Dim sql
count = cur_project.ListCount
For i = 0 To count - 1
If cur_project.ItemData(i) <> 1976 Then
tmpGcmc = Trim(cur_project.List(i))
'Set rs = RunDB.OpenRecordset("run", dbOpenDynaset)
sql = "select * into " & tmpGcmc & " from run"
RunDB.Execute sql
End If
Next

End Sub
