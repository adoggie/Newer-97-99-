VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Object = "{48DC3C96-B20F-11D1-A87F-D9394DC38340}#2.6#0"; "FLATBTN2.OCX"
Begin VB.Form form_list 
   BorderStyle     =   0  'None
   Caption         =   "Form1"
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
   Begin VB.Timer Timer1 
      Interval        =   100
      Left            =   3780
      Top             =   1320
   End
   Begin DevPowerFlatBttn.FlatBttn cmd_del 
      Height          =   330
      Left            =   1980
      TabIndex        =   3
      Top             =   90
      Width           =   930
      _ExtentX        =   1640
      _ExtentY        =   582
      AlignCaption    =   4
      AutoSize        =   0   'False
      Enabled         =   0   'False
      Caption         =   "删 除 地方"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "楷体_GB2312"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      TextColor       =   -2147483630
      Object.ToolTipText     =   ""
      MousePointer    =   1
   End
   Begin DevPowerFlatBttn.FlatBttn cmd2 
      Height          =   330
      Left            =   900
      TabIndex        =   2
      Top             =   90
      Width           =   840
      _ExtentX        =   1482
      _ExtentY        =   582
      AlignCaption    =   4
      AutoSize        =   0   'False
      Caption         =   "Close"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   8.25
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      TextColor       =   -2147483630
      Object.ToolTipText     =   ""
      MousePointer    =   1
   End
   Begin DevPowerFlatBttn.FlatBttn cmd1 
      Height          =   315
      Left            =   90
      TabIndex        =   1
      Top             =   90
      Width           =   765
      _ExtentX        =   1349
      _ExtentY        =   556
      AlignCaption    =   4
      AlignPicture    =   4
      AutoSize        =   0   'False
      PlaySounds      =   0   'False
      Caption         =   "Extend"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   8.25
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      TextColor       =   -2147483630
      Object.ToolTipText     =   ""
      MousePointer    =   1
   End
   Begin ComctlLib.ListView lv 
      Height          =   2325
      Left            =   30
      TabIndex        =   0
      Top             =   480
      Width           =   3585
      _ExtentX        =   6324
      _ExtentY        =   4101
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      _Version        =   327682
      ForeColor       =   16711680
      BackColor       =   12632256
      BorderStyle     =   1
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
      NumItems        =   0
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

runrs.FindFirst "gcmc='" & Trim(CurSelectItem.SubItems(1)) & "'"

If runrs.NoMatch Then
MsgBox "fatol error In Delete Record,Cannot finde the record"
Exit Sub
End If
runrs.Delete
lv.ListItems.Remove CurSelectItem.Key

Call form_edit.Clear

Set CurSelectItem = Nothing

End Sub

Private Sub cmd_del_MouseMove(ByVal Button As Integer, ByVal Shift As Integer, ByVal X As Single, ByVal Y As Single)
Timer1.Enabled = False
cmd_del.TextColor = RGB(255, 0, 0)
End Sub

Private Sub cmd1_Click()
Me.height = form_tree.height
Me.lv.height = Me.height - lv.top
form_edit.Visible = False
cmd1.Enabled = False
cmd2.Enabled = True

End Sub

Private Sub cmd1_MouseMove(ByVal Button As Integer, ByVal Shift As Integer, ByVal X As Single, ByVal Y As Single)
Timer1.Enabled = False
cmd1.TextColor = RGB(255, 0, 0)

End Sub

Private Sub cmd2_Click()
Me.height = ((mdi.height - mdi.toolbar.height - mdi.sb.height) / 7) * 4
lv.height = Me.height - lv.top
form_edit.Visible = True
cmd2.Enabled = False
cmd1.Enabled = True

End Sub

Private Sub cmd2_MouseMove(ByVal Button As Integer, ByVal Shift As Integer, ByVal X As Single, ByVal Y As Single)
Timer1.Enabled = False
cmd2.TextColor = RGB(255, 0, 0)
End Sub

Private Sub Form_Load()
'cmd_del.Picture = LoadResPicture(135, 0)
lv.MouseIcon = LoadResPicture(154, 2)
ItemSelected = False
If Not TreeVisible Then
MsgBox "can then tree windows not load"
Exit Sub
End If
ListVisible = True


With form_list
.left = form_tree.width
.top = 0
.width = mdi.width - form_tree.width - 150
.height = ((mdi.height - mdi.toolbar.height - mdi.sb.height) / 7) * 4
'*******************
.lv.left = 0
.lv.top = form_tree.Tree_year.top
.lv.width = .width
.lv.height = .height - .lv.top
End With
Me.Show
Call SetHeader

End Sub
Private Sub SetHeader()
Dim w
w = lv.width - 100
Set Header = lv.ColumnHeaders.Add(, "bh", "合同编号", w / 8)
Set Header = lv.ColumnHeaders.Add(, , "合同工程名称", (w / 8) * 2)
Set Header = lv.ColumnHeaders.Add(, , "合同造价(元)", w / 8)
Set Header = lv.ColumnHeaders.Add(, , "建筑面积(平米)", w / 8)
Set Header = lv.ColumnHeaders.Add(, , "结算造价(元)", w / 8)
Set Header = lv.ColumnHeaders.Add(, , "结构类型", w / 8)


End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Timer1.Enabled = True
End Sub

Private Sub lv_ItemClick(ByVal item As ComctlLib.ListItem)
Dim r As Recordset
Dim j As ListItem

 Set j = item
Set CurSelectItem = j

ItemSelected = True
cmd_del.Enabled = True
With form_edit
.txt_htbh.Text = Trim(item.Text)
.txt_gcmc.Text = Trim(item.SubItems(1))
.cbo_jglx.Text = Trim(item.SubItems(5))
.txt_jzmj.Text = Trim(item.SubItems(3))
.txt_htzj.Text = Trim(item.SubItems(2))
.txt_jszj.Text = Trim(item.SubItems(4))

Set r = systemdb_.OpenRecordset("select * from run where htbh='" & Trim(item.Text) & "'", dbOpenDynaset)

r.FindFirst "gcmc='" & Trim(item.SubItems(1)) & "'"
.txt_bz.Text = Trim(r!bz)
.cbo_zrr.Text = Trim(r!zrr)
.txt_htqx1.Text = Trim(r!htqx1)
.txt_htqx2.Text = Trim(r!htqx2)
.cmd_save.Enabled = True
End With
r.Close
Set r = Nothing

End Sub

Private Sub Timer1_Timer()
cmd1.TextColor = RGB(0, 0, 0)
cmd2.TextColor = RGB(0, 0, 0)
cmd_del.TextColor = RGB(0, 0, 0)

End Sub
