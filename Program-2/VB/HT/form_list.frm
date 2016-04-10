VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Begin VB.Form form_list 
   BackColor       =   &H00808000&
   BorderStyle     =   0  'None
   ClientHeight    =   3195
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MDIChild        =   -1  'True
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton cmd_print 
      Height          =   345
      Left            =   4128
      Picture         =   "form_list.frx":0000
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   810
      Width           =   375
   End
   Begin VB.CommandButton cmd_delete 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   7.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   4140
      Picture         =   "form_list.frx":0554
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   390
      Width           =   384
   End
   Begin ComctlLib.ListView lv 
      Height          =   2265
      Left            =   360
      TabIndex        =   0
      Top             =   330
      Width           =   3360
      _ExtentX        =   5927
      _ExtentY        =   3995
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      _Version        =   327682
      ForeColor       =   65535
      BackColor       =   8421376
      BorderStyle     =   1
      Appearance      =   1
      MousePointer    =   99
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      NumItems        =   0
   End
   Begin VB.Label Label1 
      BackColor       =   &H00808080&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H0000FFFF&
      Height          =   264
      Left            =   600
      TabIndex        =   2
      Top             =   2880
      Width           =   1908
   End
End
Attribute VB_Name = "form_list"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public Header As ColumnHeader

Private Sub cmd_del_Click()
Dim tmp As ListItem
cmd_del.Enabled = False
ItemSelected = False

'MsgBox CurSelectItem.Text

RunRs.FindFirst "gcmc='" & Trim(CurSelectItem.SubItems(1)) & "'"

If RunRs.NoMatch Then
MsgBox "fatol error In Delete Record,Cannot finde the record"
Exit Sub
End If
RunRs.Delete
lv.ListItems.Remove CurSelectItem.Key

'Call form_edit.clear

Set CurSelectItem = Nothing

End Sub

Private Sub cmd_del_MouseMove(ByVal Button As Integer, ByVal Shift As Integer, ByVal X As Single, ByVal Y As Single)
Timer1.Enabled = False
cmd_del.TextColor = RGB(255, 0, 0)
End Sub

Private Sub cmd1_Click()
Me.Height = form_tree.Height
Me.lv.Height = Me.Height - lv.top
form_edit.Visible = False
cmd1.Enabled = False
cmd2.Enabled = True

End Sub

Private Sub cmd1_MouseMove(ByVal Button As Integer, ByVal Shift As Integer, ByVal X As Single, ByVal Y As Single)
Timer1.Enabled = False
cmd1.TextColor = RGB(255, 0, 0)

End Sub

Private Sub cmd2_Click()
Me.Height = ((mdi.Height - mdi.toolbar.Height - mdi.sb.Height) / 7) * 4
lv.Height = Me.Height - lv.top
form_edit.Visible = True
cmd2.Enabled = False
cmd1.Enabled = True

End Sub

Private Sub cmd2_MouseMove(ByVal Button As Integer, ByVal Shift As Integer, ByVal X As Single, ByVal Y As Single)
Timer1.Enabled = False
cmd2.TextColor = RGB(255, 0, 0)
End Sub

Sub FillListView(node As node)  '其实此参数没有起到作用
lv.ListItems.clear
Dim item As ListItem
While Not runrs1.EOF
Set item = form_list.lv.ListItems.Add(, Trim(runrs1!gcmc) & Trim(runrs1!htbh), "土建-" & Trim(runrs1!htbh))
item.Tag = Trim(runrs1!htbh)
item.SubItems(1) = Trim(runrs1!gcmc)
If runrs1!htzj = 0 Then
item.SubItems(2) = "-----"
Else
item.SubItems(2) = Format(runrs1!htzj, "0.00")
End If

If runrs1!jzmj = 0 Then
item.SubItems(3) = "-----"
Else
item.SubItems(3) = Format(runrs1!jzmj, "0.00")
End If

If runrs1!jszj = 0 Then
item.SubItems(4) = "-----"
Else
item.SubItems(4) = Format(runrs1!jszj, "0.00")
End If

If Len(Trim(runrs1!jglx)) = 0 Then
item.SubItems(5) = "-----"
Else
item.SubItems(5) = Trim(runrs1!jglx)
End If

If Len(Trim(runrs1!manager)) = 0 Then
item.SubItems(6) = "-----"
Else
item.SubItems(6) = Trim(runrs1!manager)
End If

runrs1.MoveNext
Wend
Label1.Caption = "Total: " & Str(runrs1.RecordCount) & " 条记录"
End Sub

Private Sub cmd_delete_Click()
Dim item_ As ListItem
Dim index As Integer

Set item_ = lv.SelectedItem
index = item_.index
lv.ListItems.Remove item_.index
runrs1.FindFirst "htbh='" & right(Trim(item_.Text), 6) & "'"

If runrs1.NoMatch Then
MsgBox "找不到此记录！"
Exit Sub
End If
runrs1.Delete
Call form_toolbar.clear

'**************
Label1.Caption = "Total: " & Str(runrs1.RecordCount) & " 条记录"
If lv.ListItems.count = 0 Then
Exit Sub
End If
PreSelListItemIndex = 0
If lv.ListItems.count < index Then
lv.ListItems(lv.ListItems.count).Selected = True
Me.lv_ItemClick lv.SelectedItem
Exit Sub
End If
lv.ListItems(index).Selected = True
Me.lv_ItemClick lv.SelectedItem

Me.lv.SetFocus
End Sub

Private Sub cmd_print_Click()

Dim node As node
Dim flag As Boolean
flag = False
For Each node In form_tree.ProjectList.Nodes
If node.Selected = True Then
flag = True
Exit For
End If
Next
If flag = False Then
Exit Sub
End If

Dim sql As String
sql = node.Tag
If sql = "NO TAG" Then
MsgBox "无符合要求的记录可被打印！", , "数据打印 "
Exit Sub
End If

sql = left(sql, 9) & " into print " & right(sql, Len(sql) - 9)

systemdb_.Execute sql
form_printing.Show , mdi
SetWindowPos form_printing.hwnd, -1, 0, 0, form_printing.width, form_printing.Height, &H2 Or &H1

'Exit Sub
Call PrintData

End Sub

Private Sub Form_Load()


With form_list
.left = 0
.top = form_tree.Height + 4
.width = mdi.ScaleWidth
.Height = mdi.ScaleHeight - form_tree.Height - 8
'*******************
.lv.left = 100
.lv.top = 100
.lv.width = .ScaleWidth - 600
.lv.Height = .ScaleHeight - .lv.top - 100 - Label1.Height
.cmd_delete.left = .ScaleWidth - ((600 - cmd_delete.width) / 2 + cmd_delete.width)
.cmd_print.left = .cmd_delete.left
.Label1.left = .lv.left
.Label1.top = lv.top + lv.Height + 10



End With

Me.Show
Call SetHeader
Dim rc As Rect
rc.left = Me.left
rc.top = Me.top
rc.bottom = Me.top + Me.Height
rc.right = Me.width
Dim resoult
resoult = DrawEdge(Me.hdc, rc, BF_RECT, EDGE_RAISED)
End Sub
Private Sub SetHeader()
Dim W

W = lv.width - 100

Set Header = lv.ColumnHeaders.Add(, "bh", "合同编号", W / 10 - 50)
Set Header = lv.ColumnHeaders.Add(, , "合同工程名称", (W / 10) * 2 + 200)
Set Header = lv.ColumnHeaders.Add(, , "合同造价", W / 10, lvwColumnRight)
Set Header = lv.ColumnHeaders.Add(, , "建筑面积", W / 10 - 200, lvwColumnRight)
Set Header = lv.ColumnHeaders.Add(, , "结算造价", W / 10 - 50, lvwColumnRight)
 Set Header = lv.ColumnHeaders.Add(, , "结构类型", W / 10 - 200, lvwColumnCenter)
 Set Header = lv.ColumnHeaders.Add(, , "负责人", W / 10 - 200, lvwColumnCenter)


End Sub



'************************
'************************
'************
Sub Save()
Dim htbh_ As String
htbh_ = right(form_edit.txt_htbh.Text, 6)
runrs1.FindFirst "htbh='" & htbh_ & "'"
If Not runrs1.NoMatch Then
runrs1.Edit
'********
With form_edit
runrs1!gcmc = Trim(.txt_gcmc.Text)
runrs1!jzmj = CSng(Val(.txt_jzmj.Text))
runrs1!htzj = CCur(Val(.txt_htzj.Text))
runrs1!jszj = CCur(Val(.txt_jszj.Text))
runrs1!jglx = Trim(.cbo_jglx.Text)
runrs1!manager = Trim(.cbo_manager.Text)
runrs1!gcqx = Trim(.txt_gcqx.Text)
If Val(left(htbh_, 2)) < 80 Then
runrs1!Year = Val("20" & left(htbh_, 2))
Else
runrs1!Year = Val("19" & left(htbh_, 2))
End If
End With
runrs1.Update
'*********
End If

End Sub
Public Sub lv_ItemClick(ByVal item As ComctlLib.ListItem)
Dim htbh_  As String
form_edit.txt_htbh.Enabled = False
form_toolbar.AppendNew.Value = 0
cmd_delete.Enabled = True
form_edit.Command1.Default = True
If PreSelListItemIndex <> 0 Then
'保存上一记录（包括被更改的）
htbh_ = right(form_edit.txt_htbh.Text, 6)
runrs1.FindFirst "htbh='" & htbh_ & "'"
If Not runrs1.NoMatch Then
runrs1.Edit
'********
With form_edit
runrs1!gcmc = Trim(.txt_gcmc.Text)
runrs1!jzmj = CSng(Val(.txt_jzmj.Text))
runrs1!htzj = CCur(Val(.txt_htzj.Text))
runrs1!jszj = CCur(Val(.txt_jszj.Text))
runrs1!jglx = Trim(.cbo_jglx.Text)
runrs1!manager = Trim(.cbo_manager.Text)
runrs1!gcqx = Trim(.txt_gcqx.Text)
If Val(left(htbh_, 2)) < 80 Then
runrs1!Year = Val("20" & left(htbh_, 2))
Else
runrs1!Year = Val("19" & left(htbh_, 2))
End If
End With
runrs1.Update
'*********
lv.ListItems(PreSelListItemIndex).SubItems(1) = Trim(runrs1!gcmc)
lv.ListItems(PreSelListItemIndex).SubItems(2) = Format(runrs1!htzj, "0.00")
lv.ListItems(PreSelListItemIndex).SubItems(3) = Format(runrs1!jzmj, "0.00")

lv.ListItems(PreSelListItemIndex).SubItems(4) = Format(runrs1!jszj, "0.00")

lv.ListItems(PreSelListItemIndex).SubItems(5) = Trim(form_edit.cbo_jglx.Text)
lv.ListItems(PreSelListItemIndex).SubItems(6) = Trim(form_edit.cbo_manager.Text)
End If

End If
PreSelListItemIndex = item.index
  form_edit.ShowSelListItem item
'MsgBox Str(Item.index)

End Sub

Public Function IsListItemSelected() As Boolean
Dim item As ListItem
For Each item In lv.ListItems
If item.Selected = True Then
IsListItemSelected = True
Exit Function
End If
Next

End Function

Private Sub lv_KeyDown(KeyCode As Integer, Shift As Integer)

If KeyCode = vbKeyDelete And IsListItemSelected = True Then
'MsgBox "delete it"
Call cmd_delete_Click
End If

End Sub

