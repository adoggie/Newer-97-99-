VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Object = "{48DC3C96-B20F-11D1-A87F-D9394DC38340}#2.6#0"; "FLATBTN2.OCX"
Begin VB.Form form_tree 
   BackColor       =   &H00808000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "   年项目合同"
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
   Begin DevPowerFlatBttn.FlatBttn cmd_create 
      Height          =   390
      Left            =   330
      TabIndex        =   3
      Top             =   90
      Width           =   705
      _ExtentX        =   1244
      _ExtentY        =   688
      AlignCaption    =   4
      AutoSize        =   0   'False
      BackColor       =   16744576
      Caption         =   "新建的确 "
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "楷体_GB2312"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      HighlightColor  =   16777215
      TextColor       =   16777215
      Object.ToolTipText     =   ""
      MousePointer    =   1
   End
   Begin DevPowerFlatBttn.FlatBttn cmd_del 
      Height          =   390
      Left            =   1170
      TabIndex        =   2
      Top             =   90
      Width           =   750
      _ExtentX        =   1323
      _ExtentY        =   688
      AlignCaption    =   4
      AutoSize        =   0   'False
      Enabled         =   0   'False
      BackColor       =   16761024
      Caption         =   "删除的的"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "楷体_GB2312"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      HighlightColor  =   16777215
      MaskColor       =   16744576
      TextColor       =   16777215
      Object.ToolTipText     =   ""
      MousePointer    =   1
   End
   Begin ht.time time1 
      Height          =   375
      Left            =   2250
      TabIndex        =   1
      Top             =   3450
      Width           =   1365
      _ExtentX        =   2408
      _ExtentY        =   661
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   5
      Left            =   420
      Top             =   3330
   End
   Begin ComctlLib.TreeView Tree_year 
      Height          =   2745
      Left            =   60
      TabIndex        =   0
      Top             =   600
      Width           =   2415
      _ExtentX        =   4260
      _ExtentY        =   4842
      _Version        =   327682
      HideSelection   =   0   'False
      Indentation     =   353
      LabelEdit       =   1
      Sorted          =   -1  'True
      Style           =   7
      Appearance      =   1
      MousePointer    =   99
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "楷体_GB2312"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin ComctlLib.ImageList img_tree 
      Left            =   1440
      Top             =   3270
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   32
      ImageHeight     =   32
      MaskColor       =   12632256
      _Version        =   327682
      BeginProperty Images {0713E8C2-850A-101B-AFC0-4210102A8DA7} 
         NumListImages   =   2
         BeginProperty ListImage1 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "Form1.frx":000C
            Key             =   "ht"
         EndProperty
         BeginProperty ListImage2 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "Form1.frx":0326
            Key             =   "open"
         EndProperty
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



Private Sub cmd_del_Click()
form_list.lv.ListItems.Clear
Call form_edit.Clear
cmd_del.Enabled = False
Dim rs As Recordset
Set rs = systemdb_.OpenRecordset("select * from ht_list where IsExist=true", dbOpenDynaset)
Do While Not rs.EOF
If Trim(CurSelectYear) = Trim(rs!year) Then
rs.Edit
rs!IsExist = False
rs.Update
Exit Do
End If
rs.MoveNext
Loop
rs.Close

Call showHT
Call DelYearHT  '具体的删除当前合同的所有记录，在其他数据库之中
CurSelectYear = "title"
Call form_edit.Clear

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
TreeVisible = True
Me.Picture = LoadResPicture(147, 0)
Set cmd_create.Picture = LoadResPicture(147, 0)
Set cmd_del.Picture = LoadResPicture(147, 0)
cmd_del.Transparent = True
'cmd1.Picture = LoadResPicture(129, 0)
Me.Icon = LoadResPicture(137, 1)
Tree_year.MouseIcon = LoadResPicture(140, 2)
With form_tree
.Show
.width = mdi.width / 5
.left = 0
.top = 0
.height = mdi.sb.top - mdi.toolbar.height - 60
'**********************

.Tree_year.left = 30
.Tree_year.width = .width - 160
.Tree_year.height = .height - 2600
.time1.top = .height - 1600
.time1.left = (.width - time1.width) / 2

'*************************
'.cmd1.Left = .Tree_year.Left
'.cmd1.Width = .Tree_year.Width
'***************

End With
DisableCloseButton (Me.hwnd)
Call showHT     '显示存在的年合同列表
End Sub
Public Sub showHT()
Dim k As String
Tree_year.ImageList = mdi.image
Tree_year.Nodes.Clear
Set runCurDispYear = Nothing
Set runCurDispYear = systemdb_.OpenRecordset("select  *  from ht_list where IsExist=true", dbOpenDynaset)
Dim Node As Node
k = "title"
Set Node = Tree_year.Nodes.Add(, , k, "历年项目合同", "ht")


While Not runCurDispYear.EOF

k = Trim(runCurDispYear!year)
Set Node = Tree_year.Nodes.Add("title", tvwChild, k, runCurDispYear!Name, "close", "open")

runCurDispYear.MoveNext
Wend

Set Node = Tree_year.Nodes(1)

Node.Expanded = True
CurSelectYear = "title"
End Sub
Private Sub Timer1_Timer()
If Tree_year.height > 2000 Then
Tree_year.height = Tree_year.height - 10

End If

End Sub


Public Sub SetNull()
With form_edit
.txt_htbh.Text = "                      "
.txt_gcmc.Text = "                  "
.cbo_jglx.Text = "                  "
.txt_jzmj.Text = "                       "
.txt_htzj.Text = "                      "
.txt_jszj.Text = "                       "
.txt_htqx1.Text = "                       "
.txt_htqx2.Text = "                         "
.txt_bz.Text = "                                "
.cbo_zrr.Text = "                            "
End With

End Sub
Private Sub Tree_year_NodeClick(ByVal Node As ComctlLib.Node)
form_list.cmd_del.Enabled = False
ItemSelected = False
If Node.Key = "title" Then
cmd_del.Enabled = False      '禁止删除年合同
form_edit.cmd_add.Enabled = False
form_list.cmd_del.Enabled = False
form_edit.cmd_save.Enabled = False
Call SetNull    'Set form_edit  control=NULL
form_list.lv.ListItems.Clear    '删除 ListView Control content
CurSelectYear = Node.Key
Exit Sub
Else
cmd_del.Enabled = True    'Enable To Delete Year 合同

form_edit.cmd_add.Enabled = True
form_edit.cmd_save.Enabled = False
End If
Set runrs = Nothing
Set runrs = systemdb_.OpenRecordset("select * from run where year='" & Trim(Node.Key) & "'", dbOpenDynaset)
                            
                            '打开属于当年的合同记录
Call AppendToListView     '填充ListView  显示当年合同
CurSelectYear = Node.Key
Call form_edit.Clear
'MsgBox Node.Text & Node.Key
End Sub
Private Sub AppendToListView() '显示当年合同
form_list.lv.ListItems.Clear
Dim item As ListItem

'runrs.MoveFirst
While Not runrs.EOF
Set item = form_list.lv.ListItems.Add(, Trim(runrs!gcmc) & "1976-12-16", Trim(runrs!htbh))
item.SubItems(1) = Trim(runrs!gcmc)
item.SubItems(2) = Format(runrs!htzj, "0.00 元")
item.SubItems(3) = Format(runrs!jzmj, "0.00 平米")

item.SubItems(4) = Format(runrs!jszj, "0.00 元")

item.SubItems(5) = Trim(runrs!jglx)
runrs.MoveNext
Wend

End Sub
