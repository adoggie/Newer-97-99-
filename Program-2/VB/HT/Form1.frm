VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Begin VB.Form form_tree 
   BackColor       =   &H00808000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "工程项目合同"
   ClientHeight    =   3990
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3885
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   3990
   ScaleWidth      =   3885
   Begin VB.Timer Timer1 
      Interval        =   500
      Left            =   3240
      Top             =   1200
   End
   Begin ComctlLib.TreeView ProjectList 
      Height          =   2532
      Left            =   192
      TabIndex        =   0
      Top             =   528
      Width           =   2724
      _ExtentX        =   4789
      _ExtentY        =   4471
      _Version        =   327682
      HideSelection   =   0   'False
      Indentation     =   353
      LabelEdit       =   1
      LineStyle       =   1
      Style           =   7
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
End
Attribute VB_Name = "form_tree"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Public Sub cmd_create_Click()
Form_add.Show 1, mdi
End Sub




Private Sub DelYearHT()

End Sub

Private Sub cmd1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = 1 Then
Timer1.Enabled = True
End If

End Sub

Private Sub cmd1_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = 1 Then
Timer1.Enabled = False
End If

End Sub

Private Sub Form_Load()
Me.Icon = LoadResPicture(137, 1)
DisableCloseButton (Me.hwnd)
Show
width = (mdi.ScaleWidth / 5) * 2 - 100
left = 0
top = 0
Height = mdi.ScaleHeight / 2

'************
With ProjectList
.left = 40
.top = 40
.width = form_tree.ScaleWidth - 80

.Height = form_tree.ScaleHeight - 80
.ImageList = mdi.image

.SetFocus
Call ShowProjectList
End With



End Sub
Sub ShowProjectList()
ProjectList.Nodes.clear
Set RunRs = Nothing
Set RunRs = systemdb_.OpenRecordset("tree", dbOpenDynaset)
Call SetRelation
Set RunRs = systemdb_.OpenRecordset("select * from ProjectClass order by name", dbOpenDynaset)
Call SetRelation
Set RunRs = systemdb_.OpenRecordset("select * from Years order by name", dbOpenDynaset)
Call SetRelation
Set RunRs = systemdb_.OpenRecordset("select * from  Managers  order by name", dbOpenDynaset)
Call SetRelation
ProjectList.Nodes("ProjectRoot").Expanded = True
End Sub
Sub SetRelation()
While Not RunRs.EOF
If RunRs!IsKilled Then
GoTo step1
End If

If RunRs!IsRoot Then
Set node = ProjectList.Nodes.Add(, , RunRs!Key, RunRs!Name, "close", "open")

Else
T = RunRs!parentkey
Set node = ProjectList.Nodes.Add(T, 4, RunRs!Key, RunRs!Name, "close", "open")

End If
node.Tag = RunRs!sql

step1:

RunRs.MoveNext
Wend
Set RunRs = Nothing

End Sub



Private Sub Tree_year_NodeClick(ByVal node As ComctlLib.node)
'form_list.cmd_del.Enabled = False
ItemSelected = False
If node.Key = "title" Then
cmd_del.Enabled = False      '禁止删除年合同
'form_edit.cmd_add.Enabled = False
'form_list.cmd_del.Enabled = False
form_edit.cmd_save.Enabled = False
'Call SetNull    'Set form_edit  control=NULL
form_list.lv.ListItems.clear    '删除 ListView Control content
CurSelectYear = node.Key
Exit Sub
Else
cmd_del.Enabled = True    'Enable To Delete Year 合同

'form_edit.cmd_add.Enabled = True
form_edit.cmd_save.Enabled = False
End If
Set RunRs = Nothing
Set RunRs = systemdb_.OpenRecordset("select * from run where year='" & Trim(node.Key) & "'", dbOpenDynaset)
                            
                            '打开属于当年的合同记录
Call AppendToListView     '填充ListView  显示当年合同
CurSelectYear = node.Key
'Call form_edit.clear
'MsgBox Node.Text & Node.Key
End Sub
Private Sub AppendToListView() '显示当年合同
form_list.lv.ListItems.clear
Dim item As ListItem

'runrs.MoveFirst
While Not RunRs.EOF
Set item = form_list.lv.ListItems.Add(, Trim(RunRs!gcmc) & "1976-12-16", Trim(RunRs!htbh))
item.SubItems(1) = Trim(RunRs!gcmc)
item.SubItems(2) = Format(RunRs!htzj, "0.00 元")
item.SubItems(3) = Format(RunRs!jzmj, "0.00 平米")

item.SubItems(4) = Format(RunRs!jszj, "0.00 元")

item.SubItems(5) = Trim(RunRs!jglx)
RunRs.MoveNext
Wend

End Sub

Public Sub ProjectList_NodeClick(ByVal node As ComctlLib.node)
form_edit.Command1.Default = True
PreSelListItemIndex = 0
form_list.cmd_delete.Enabled = False
If form_list.IsListItemSelected Then
'如果选择了某一工程项目，则将form_edit 窗体中显示的
'相应数据保存到数据库
'CurSelListItemIndex = form_list.lv.SelectedItem.index
Call form_list.Save
End If
 
form_toolbar.AppendNew.Value = 1
If node.Tag = "NO TAG" Then
If form_list.lv.ListItems.count = 0 Then
Exit Sub
End If
form_list.lv.ListItems.clear
Exit Sub
End If

Set runrs1 = Nothing
Set runrs1 = systemdb_.OpenRecordset(node.Tag, dbOpenDynaset)


Call form_list.FillListView(node)   '填充ListView 控件，显示过滤的记录数据。。

End Sub

Private Sub Timer1_Timer()
Me.Caption = "工程项目合同" & Space(8) & Format(time, "h:m:S ")

End Sub
