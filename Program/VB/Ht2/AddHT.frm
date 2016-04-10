VERSION 5.00
Begin VB.Form Form_add 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "选择添加合同年份"
   ClientHeight    =   1095
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4575
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   1095
   ScaleWidth      =   4575
   StartUpPosition =   1  '所有者中心
   Visible         =   0   'False
   Begin VB.CommandButton cmd_add 
      Caption         =   "Add"
      Enabled         =   0   'False
      Height          =   315
      Left            =   1530
      TabIndex        =   1
      Top             =   660
      Width           =   2355
   End
   Begin VB.ComboBox cbo_year 
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C00000&
      Height          =   330
      Left            =   1290
      Style           =   2  'Dropdown List
      TabIndex        =   0
      Top             =   150
      Width           =   2955
   End
   Begin VB.Image p1 
      BorderStyle     =   1  'Fixed Single
      Height          =   645
      Left            =   210
      Stretch         =   -1  'True
      Top             =   210
      Width           =   735
   End
End
Attribute VB_Name = "Form_add"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cbo_year_Click()
If Trim(cbo_year.Text) = "请选择添加的合同年份" Then
cmd_add.Enabled = False
Exit Sub
Else
cmd_add.Enabled = True
End If


End Sub
Private Sub AddToTree()
Call form_tree.showHT
form_tree.Tree_year.Refresh

End Sub
Private Sub cmd_add_Click()
'MsgBox cbo_year.Text


Dim i
For i = 0 To cbo_year.ListCount - 1
If Trim(cbo_year.Text) = Trim(cbo_year.List(i)) Then
t$ = "name='" & Trim(cbo_year.Text) & "'"
runHtList.FindFirst t$

If runHtList.NoMatch Then
MsgBox "not found!"
cmd_add.Enabled = False
Exit Sub
End If
cbo_year.RemoveItem i
runHtList.Edit
runHtList!IsExist = True
runHtList.Update
Exit For
End If
Next
'删除组合框中已选的年合同和设置数据库记录已存在
'************************************************
'*****************************   重置初始状态
Call AddToTree                    ' 将年合同添加到TreeView 控件
'*****************************
cmd_add.Enabled = False
cbo_year.ListIndex = 0
End Sub

Private Sub Form_Load()
Me.Icon = LoadResPicture(156, 1)
Me.Picture = LoadResPicture(151, 0)
p1.Picture = LoadResPicture(133, 0)
' DisableCloseButton (Me.hwnd)
 Set runHtList = systemdb_.OpenRecordset("select  *  from ht_list where IsExist=false", _
 dbOpenDynaset)
 cbo_year.AddItem "请选择添加的合同年份"
 
 While Not runHtList.EOF
 cbo_year.AddItem runHtList!Name
 runHtList.MoveNext
 Wend
 cbo_year.ListIndex = 0

 
 
End Sub

Private Sub Form_Unload(Cancel As Integer)

form_tree.Tree_year.Nodes.item(CurSelectYear).Selected = True

runHtList.Close

End Sub
