VERSION 5.00
Object = "{28D47522-CF84-11D1-834C-00A0249F0C28}#1.0#0"; "GIF89.DLL"
Begin VB.Form Form_add 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "修改显示列表"
   ClientHeight    =   3210
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6345
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3210
   ScaleWidth      =   6345
   StartUpPosition =   1  'CenterOwner
   Visible         =   0   'False
   Begin GIF89LibCtl.Gif89a gif1 
      Height          =   888
      Left            =   408
      OleObjectBlob   =   "AddHT.frx":0000
      TabIndex        =   12
      Top             =   672
      Width           =   888
   End
   Begin VB.TextBox Text 
      Height          =   345
      Left            =   1500
      MaxLength       =   20
      TabIndex        =   5
      Top             =   2664
      Width           =   3012
   End
   Begin VB.ListBox List3 
      BackColor       =   &H8000000A&
      ForeColor       =   &H000000FF&
      Height          =   60
      Left            =   4050
      Style           =   1  'Checkbox
      TabIndex        =   9
      TabStop         =   0   'False
      Tag             =   "manager"
      Top             =   1380
      Width           =   675
   End
   Begin VB.ListBox List2 
      BackColor       =   &H8000000A&
      ForeColor       =   &H000000FF&
      Height          =   60
      Left            =   5220
      Style           =   1  'Checkbox
      TabIndex        =   8
      TabStop         =   0   'False
      Tag             =   "class"
      Top             =   1290
      Width           =   645
   End
   Begin VB.CommandButton Exit 
      Caption         =   "退 出"
      Height          =   360
      Left            =   288
      TabIndex        =   7
      Top             =   1632
      Width           =   930
   End
   Begin VB.OptionButton op_manager 
      Caption         =   "显示工程负责人合同"
      Height          =   276
      Left            =   1530
      TabIndex        =   3
      Top             =   1230
      Width           =   2124
   End
   Begin VB.OptionButton op_class 
      Caption         =   "显示工程结构类型合同"
      Height          =   276
      Left            =   1530
      TabIndex        =   2
      Top             =   780
      Width           =   2148
   End
   Begin VB.OptionButton op_year 
      Caption         =   "显示年工程合同"
      Height          =   276
      Left            =   1530
      TabIndex        =   1
      Top             =   360
      Width           =   1764
   End
   Begin VB.ListBox List1 
      BackColor       =   &H8000000A&
      ForeColor       =   &H000000FF&
      Height          =   1740
      ItemData        =   "AddHT.frx":0042
      Left            =   3816
      List            =   "AddHT.frx":0044
      Style           =   1  'Checkbox
      TabIndex        =   0
      TabStop         =   0   'False
      Tag             =   "year"
      Top             =   240
      Width           =   2292
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00C0C0C0&
      Height          =   2316
      Left            =   1488
      TabIndex        =   10
      Top             =   0
      Width           =   4785
      Begin VB.CheckBox chk_change 
         Caption         =   " 更 改"
         Height          =   375
         Left            =   504
         TabIndex        =   4
         Top             =   1752
         Width           =   915
      End
   End
   Begin VB.Frame Frame2 
      BackColor       =   &H00C0C0C0&
      Height          =   615
      Left            =   96
      TabIndex        =   11
      Top             =   2520
      Width           =   6225
      Begin VB.CommandButton cmd_change 
         Caption         =   "确定"
         Default         =   -1  'True
         Height          =   324
         Left            =   4560
         TabIndex        =   6
         Top             =   192
         Width           =   1548
      End
   End
   Begin VB.Line Line1 
      Visible         =   0   'False
      X1              =   1260
      X2              =   1350
      Y1              =   2268
      Y2              =   2388
   End
   Begin VB.Line Line2 
      Visible         =   0   'False
      X1              =   6120
      X2              =   6330
      Y1              =   3108
      Y2              =   3168
   End
End
Attribute VB_Name = "Form_add"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public rs1 As Recordset
Public rs2 As Recordset
Public rs3 As Recordset
Dim node As node
Dim flag  As Boolean

Public Filling As Boolean

Private Sub chk_change_Click()
If chk_change.Value = 1 Then
Me.Height = Me.Height - Me.ScaleHeight + Line2.Y2
Else
Me.Height = Me.Height - Me.ScaleHeight + Line1.Y2
End If
End Sub

Private Sub cmd_change_Click()
Dim i
If op_class.Value = True Then
    If List2.ListIndex = -1 Then
        MsgBox "请选择一项工程类型"
    Exit Sub
    Else
  
        For i = 0 To List2.ListCount - 1
            If List2.List(i) = Trim(SubChar(Text.Text, " ")) Then
            MsgBox "此工程类型已存在"
            Text.SetFocus
            Exit Sub
            End If
        Next
    List2.List(List2.ListIndex) = Trim(SubChar(Text.Text, " "))
    End If
End If


If op_manager.Value = True Then
  If List3.ListIndex = -1 Then
  MsgBox "请选择一工程责任人"
  Exit Sub
  Else
   
   For i = 0 To List3.ListCount - 1
  If List3.List(i) = Trim(SubChar(Text.Text, " ")) Then
  MsgBox "此工程管理人员已存在"
  Text.SetFocus
    
  Exit Sub
  End If
  Next
  List3.List(List3.ListIndex) = Trim(SubChar(Text.Text, " "))
End If
End If

  
End Sub

Private Sub Exit_Click()  '退出执行代码
Finish rs1, List1
Finish rs2, List2
Finish rs3, List3
rs1.Close
rs2.Close
rs3.Close
form_tree.ShowProjectList
form_edit.Fill_Jglx_Manager
'********** 99-11-25

If flag = False Then '是否form_tree窗体中的项目列表中选择
GoTo end_
End If
Set runrs1 = Nothing
'Set node = form_tree.ProjectList.SelectedItem
If node.Tag = "NO TAG" Then
GoTo end_
End If

Set runrs1 = systemdb_.OpenRecordset(node.Tag, dbOpenDynaset)
 form_list.FillListView node

end_:
'**********
form_toolbar.ChangeTree.Enabled = True
Unload Me
End Sub

Sub Finish(Rs As Recordset, List As ListBox)
Dim count As Integer
Rs.MoveFirst
count = 0
While Not Rs.EOF
Rs.Edit
Rs!IsKilled = Not List.Selected(count)

Select Case List.Tag
Case "class"
Rs!sql = Trim("select * from run where jglx='" & Trim(List.List(count)) & "'")
systemdb_.Execute "update run set jglx='" & Trim(List.List(count)) & "' where jglx='" & Rs!Name & "'"

Case "manager"
Rs!sql = Trim("Select * from run where manager='" & Trim(List.List(count)) & "'")
systemdb_.Execute "update run set manager='" & Trim(List.List(count)) & "' where manager='" & Rs!Name & "'"
End Select
Rs!Name = Trim(List.List(count))
'删除记录中出现的空格

Rs.Update


count = count + 1
Rs.MoveNext
Wend


End Sub

Private Sub Form_Load()
Dim n As node
flag = False
For Each n In form_tree.ProjectList.Nodes
If n.Selected = True Then
flag = True
Exit For
End If
Next
If flag Then
Set node = form_tree.ProjectList.SelectedItem
End If

'gif1.filename = App.Path & "\ct.gif"
Set rs1 = systemdb_.OpenRecordset("years", dbOpenDynaset)
Set rs2 = systemdb_.OpenRecordset("projectclass", dbOpenDynaset)
Set rs3 = systemdb_.OpenRecordset("managers", dbOpenDynaset)
'Me.Icon = LoadResPicture(156, 1)
'Me.Picture = LoadResPicture(151, 0)
DisableCloseButton (Me.hwnd)
FillList rs1, List1
FillList rs2, List2
FillList rs3, List3  '填充叁各列表框
 List2.left = List1.left
List3.left = List1.left
 List2.top = List1.top
List3.top = List1.top
List2.width = List1.width
List3.width = List1.width
 List2.Height = List1.Height
List3.Height = List1.Height
op_year.Value = True
Me.Height = Me.Height - Me.ScaleHeight + Line1.Y2


End Sub





Private Sub List2_Click()
If Filling Then
Exit Sub
End If
Text.Text = List2.List(List2.ListIndex)
Text.SetFocus
Text.SelStart = 0
Text.SelLength = Len(Text.Text)
End Sub


Private Sub List3_Click()
If Filling Then
Exit Sub
End If
Text.Text = List3.List(List3.ListIndex)
Text.SetFocus
Text.SelStart = 0
Text.SelLength = Len(Text.Text)
End Sub

Private Sub op_year_Click()
List1.Visible = True
List2.Visible = False
List3.Visible = False
chk_change.Enabled = False
Me.Height = Me.Height - Me.ScaleHeight + Line1.Y2

End Sub
Private Sub op_class_Click()
List1.Visible = False
List3.Visible = False
List2.Visible = True
chk_change.Enabled = True
If chk_change.Value = 1 Then
Me.Height = Me.Height - Me.ScaleHeight + Line2.Y2
End If
If List2.ListIndex = -1 Then
Text.Text = ""
Exit Sub
End If
Text.Text = List2.List(List2.ListIndex)
Text.SetFocus
Text.SelStart = 0
Text.SelLength = Len(Text.Text)
End Sub
Private Sub op_manager_Click()
List1.Visible = False
List2.Visible = False
List3.Visible = True
chk_change.Enabled = True
If chk_change.Value = 1 Then
Me.Height = Me.Height - Me.ScaleHeight + Line2.Y2

End If
If List3.ListIndex = -1 Then
Text.Text = ""
Exit Sub
End If
Text.Text = List3.List(List3.ListIndex)
Text.SetFocus
Text.SelStart = 0
Text.SelLength = Len(Text.Text)
End Sub


Sub FillList(Rs As Recordset, ItemList As ListBox)
Filling = True
ItemList.clear
Rs.MoveFirst
While Not Rs.EOF
ItemList.AddItem Rs!Name
ItemList.Selected(ItemList.NewIndex) = Not Rs!IsKilled

Rs.MoveNext
Wend
ItemList.TopIndex = 0
Filling = False
End Sub

Private Sub Text_GotFocus()
Text.SelStart = 0
Text.SelLength = Len(Text.Text)

End Sub

Private Sub Text_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = 13 Then
SendKeys "{enter}"
End If

End Sub
