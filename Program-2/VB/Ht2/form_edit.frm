VERSION 5.00
Object = "{48DC3C96-B20F-11D1-A87F-D9394DC38340}#2.6#0"; "FLATBTN2.OCX"
Begin VB.Form form_edit 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Form1"
   ClientHeight    =   2790
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   11055
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   2790
   ScaleWidth      =   11055
   ShowInTaskbar   =   0   'False
   Begin DevPowerFlatBttn.FlatBttn cmd_clear 
      Height          =   360
      Left            =   6900
      TabIndex        =   22
      Top             =   900
      Width           =   915
      _ExtentX        =   1614
      _ExtentY        =   635
      AlignCaption    =   4
      AutoSize        =   0   'False
      PlaySounds      =   0   'False
      BackColor       =   12640511
      Caption         =   "清 除得分发"
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
   Begin DevPowerFlatBttn.FlatBttn cmd_save 
      Height          =   360
      Left            =   6900
      TabIndex        =   21
      Top             =   510
      Width           =   915
      _ExtentX        =   1614
      _ExtentY        =   635
      AlignCaption    =   4
      AutoSize        =   0   'False
      BackColor       =   12640511
      Caption         =   "保 存得分"
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
   Begin DevPowerFlatBttn.FlatBttn cmd_add 
      Default         =   -1  'True
      Height          =   360
      Left            =   6900
      TabIndex        =   20
      Top             =   120
      Width           =   915
      _ExtentX        =   1614
      _ExtentY        =   635
      AlignCaption    =   4
      AutoSize        =   0   'False
      BackColor       =   12640511
      Caption         =   "添 加大幅 "
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
   Begin VB.ComboBox cbo_zrr 
      BeginProperty Font 
         Name            =   "楷体_GB2312"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   360
      Left            =   1000
      Sorted          =   -1  'True
      TabIndex        =   19
      Text            =   "cbo_zrr"
      Top             =   1590
      Width           =   1650
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   200
      Left            =   6570
      Top             =   630
   End
   Begin VB.TextBox txt_bz 
      Height          =   525
      Left            =   3510
      TabIndex        =   16
      Text            =   "bz"
      Top             =   1620
      Width           =   4095
   End
   Begin VB.TextBox txt_htqx2 
      BeginProperty Font 
         Name            =   "楷体_GB2312"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C00000&
      Height          =   360
      Left            =   3300
      Locked          =   -1  'True
      TabIndex        =   14
      Text            =   "txt_htqx2"
      ToolTipText     =   "请单击右键!"
      Top             =   1200
      Width           =   1935
   End
   Begin VB.TextBox txt_htqx1 
      BeginProperty Font 
         Name            =   "楷体_GB2312"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   360
      Left            =   1000
      Locked          =   -1  'True
      TabIndex        =   13
      Text            =   "txt_htqx1"
      ToolTipText     =   "请单击右键!"
      Top             =   1200
      Width           =   1860
   End
   Begin VB.TextBox txt_jszj 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "楷体_GB2312"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   360
      Left            =   3800
      TabIndex        =   11
      Text            =   "txt_jszj"
      Top             =   780
      Width           =   2025
   End
   Begin VB.TextBox txt_htzj 
      BeginProperty Font 
         Name            =   "楷体_GB2312"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   360
      Left            =   1000
      TabIndex        =   9
      Text            =   "txt_htzj"
      Top             =   810
      Width           =   1700
   End
   Begin VB.TextBox txt_jzmj 
      BeginProperty Font 
         Name            =   "楷体_GB2312"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   360
      Left            =   3800
      TabIndex        =   7
      Text            =   "txt_jzmj"
      Top             =   420
      Width           =   2025
   End
   Begin VB.ComboBox cbo_jglx 
      BeginProperty Font 
         Name            =   "楷体_GB2312"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   360
      Left            =   1000
      Sorted          =   -1  'True
      TabIndex        =   5
      Text            =   "cbo_jglx"
      Top             =   450
      Width           =   1700
   End
   Begin VB.TextBox txt_gcmc 
      BeginProperty Font 
         Name            =   "楷体_GB2312"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   315
      Left            =   3800
      TabIndex        =   3
      Text            =   "txt_gcmc"
      Top             =   100
      Width           =   2865
   End
   Begin VB.TextBox txt_htbh 
      BeginProperty Font 
         Name            =   "楷体_GB2312"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   360
      Left            =   1000
      TabIndex        =   1
      Text            =   "txt_htbh"
      Top             =   75
      Width           =   1700
   End
   Begin VB.Label lb_zrr 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BorderStyle     =   1  'Fixed Single
      Caption         =   "责任人"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   60
      TabIndex        =   18
      Top             =   1620
      Width           =   885
   End
   Begin VB.Label lb_bz 
      AutoSize        =   -1  'True
      BorderStyle     =   1  'Fixed Single
      Caption         =   "备注"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   2910
      TabIndex        =   17
      Top             =   1620
      Width           =   480
   End
   Begin VB.Label lb_htqx2 
      AutoSize        =   -1  'True
      BorderStyle     =   1  'Fixed Single
      Caption         =   "至"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   2970
      TabIndex        =   15
      Top             =   1230
      Width           =   270
   End
   Begin VB.Label lb_htqx1 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BorderStyle     =   1  'Fixed Single
      Caption         =   "合同期限"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   45
      TabIndex        =   12
      Top             =   1230
      Width           =   915
   End
   Begin VB.Label lb_jszj 
      AutoSize        =   -1  'True
      BorderStyle     =   1  'Fixed Single
      Caption         =   "结算造价"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   2850
      TabIndex        =   10
      Top             =   840
      Width           =   900
   End
   Begin VB.Label lb_htzj 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BorderStyle     =   1  'Fixed Single
      Caption         =   "合同造价"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   45
      TabIndex        =   8
      Top             =   870
      Width           =   915
   End
   Begin VB.Label lb_jzmj 
      AutoSize        =   -1  'True
      BorderStyle     =   1  'Fixed Single
      Caption         =   "建筑面积"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   2850
      TabIndex        =   6
      Top             =   510
      Width           =   900
   End
   Begin VB.Label lb_jglx 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BorderStyle     =   1  'Fixed Single
      Caption         =   "结构类型"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   45
      TabIndex        =   4
      Top             =   480
      Width           =   915
   End
   Begin VB.Label lb_gcmc 
      AutoSize        =   -1  'True
      BorderStyle     =   1  'Fixed Single
      Caption         =   "工程名称"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   2850
      TabIndex        =   2
      Top             =   105
      Width           =   900
   End
   Begin VB.Label lb_htbh 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BorderStyle     =   1  'Fixed Single
      Caption         =   "合同编号"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   45
      TabIndex        =   0
      Top             =   150
      Width           =   915
   End
End
Attribute VB_Name = "form_edit"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim s() As String
Dim count_ As Integer, r As Integer




Private Sub cmd_add_Click()
runrs.FindFirst "gcmc='" & Trim(txt_gcmc.Text) & "'"

If Not runrs.NoMatch Then
MsgBox "此工程合同已存在！", , "Error !"
Exit Sub
End If

Dim Y, m, d, tmp
'********************  Append To Database
With runrs
.AddNew
!htbh = Trim(txt_htbh.Text)
!gcmc = Trim(txt_gcmc.Text)
!jglx = Trim(cbo_jglx.Text)
!jzmj = CSng(Val(txt_jzmj))
!htzj = CCur(Val(txt_htzj.Text))
!jszj = CCur(Val(txt_jszj.Text))
!htqx1 = Trim(txt_htqx1.Text)
!htqx2 = Trim(txt_htqx2.Text)
!bz = Trim(txt_bz.Text)
!zrr = Trim(cbo_zrr.Text)
!year = Trim(CurSelectYear)
'***********************

Y = year(CDate(Trim(txt_htqx1.Text)))
m = Month(CDate(Trim(txt_htqx1.Text)))
d = Day(CDate(Trim(txt_htqx1.Text)))

tmp = Mid$(Y, 3, 2) & "/" & m & "/" & d
Y = year(CDate(txt_htqx2))
m = Month(CDate(txt_htqx2))
d = Day(CDate(txt_htqx2))
tmp = tmp & "-" & Mid$(Y, 3, 2) & "/" & m & "/" & d

!qx = tmp
.Update
End With

'***********************  Following Append To ListView Control
Dim item As ListItem
runrs.Bookmark = runrs.LastModified
Set item = form_list.lv.ListItems.Add(, Trim(runrs!gcmc) & "1976-12-16", Trim(runrs!htbh))
item.SubItems(1) = Trim(runrs!gcmc)
item.SubItems(2) = Format(runrs!htzj, "0.00 元")
item.SubItems(3) = Format(runrs!jzmj, "0.00 平米")

item.SubItems(4) = Format(runrs!jszj, "0.00 元")

item.SubItems(5) = Trim(runrs!jglx)
'********************



Call Clear
If ItemSelected = False Then
Exit Sub
Else
CurSelectItem.Selected = False
ItemSelected = False
End If


End Sub

Private Sub cmd_clear_Click()
Call Clear
End Sub

Private Sub cmd_save_Click()
runrs.FindFirst "gcmc='" & Trim(CurSelectItem.SubItems(1)) & "'"
Dim Y, m, d
With runrs
.Edit
!htbh = Trim(txt_htbh.Text)
!gcmc = Trim(txt_gcmc.Text)
!jglx = Trim(cbo_jglx.Text)
!jzmj = CSng(Val(txt_jzmj))
!htzj = CCur(Val(txt_htzj.Text))
!jszj = CCur(Val(txt_jszj.Text))
!htqx1 = Trim(txt_htqx1.Text)
!htqx2 = Trim(txt_htqx2.Text)
!bz = Trim(txt_bz.Text)
!zrr = Trim(cbo_zrr.Text)
!year = Trim(CurSelectYear)

Y = year(CDate(Trim(txt_htqx1.Text)))
m = Month(CDate(Trim(txt_htqx1.Text)))
d = Day(CDate(Trim(txt_htqx1.Text)))
tmp = Mid$(Y, 3, 2) & "/" & m & "/" & d
Y = year(CDate(txt_htqx2))
m = Month(CDate(txt_htqx2))
d = Day(CDate(txt_htqx2))
tmp = tmp & "-" & Mid$(Y, 3, 2) & "/" & m & "/" & d
!qx = tmp
.Update
End With

'*************
'**********


'**********
'*******************
runrs.Bookmark = runrs.LastModified

CurSelectItem.Text = Trim(txt_htbh.Text)
CurSelectItem.SubItems(1) = Trim(runrs!gcmc)
CurSelectItem.SubItems(2) = Format(runrs!htzj, "0.00 元")
CurSelectItem.SubItems(3) = Format(runrs!jzmj, "0.00 平米")

CurSelectItem.SubItems(4) = Format(runrs!jszj, "0.00 元")

CurSelectItem.SubItems(5) = Trim(runrs!jglx)
'********************



'Call Clear

End Sub

Private Sub Form_Activate()
form_list.cmd2.Enabled = False
End Sub
Private Sub SetControlPos()
Dim top As Integer, left As Integer
Dim width, height
lb_htbh.top = 100: lb_htbh.left = 100
top = lb_htbh.top: left = lb_htbh.left
'*********************
width = cbo_jglx.width: height = cbo_jglx.height
txt_htbh.width = width: txt_htbh.height = height
txt_gcmc.width = width: txt_gcmc.height = height
txt_jzmj.width = width: txt_jzmj.height = height
txt_htzj.width = width: txt_htzj.height = height
txt_jszj.width = width: txt_jszj.height = height
txt_htqx1.width = width: txt_htqx1.height = height
txt_htqx2.width = width: txt_htqx2.height = height
cbo_zrr.width = width
'************************

End Sub

Private Sub Form_Load()
cmd_save.Enabled = False
cmd_add.Enabled = False

Me.Picture = LoadResPicture(149, 0)
Dim p, i
p = "用于添加、修改当年工程项目合同。。。。。。99'  Z.Bin"
Dim l
l = Len(p)
count_ = l
ReDim s(l + 1) As String
For i = 1 To l
s(i) = left(p, i)
Next
r = 1
Timer1.Enabled = True


Me.left = form_list.left
Me.width = form_list.width
Me.top = form_list.top + form_list.height + 15
Me.height = form_tree.height - form_list.height - 15
'*****************
Me.Show


'**************************
'Call SetControlPos

Call LoadJglx
Call LoadZrr

'Call Clear
Call form_tree.SetNull

form_tree.Tree_year.SetFocus

If Me.width - txt_bz.width < 300 Then
txt_bz.Visible = False
Exit Sub
End If

txt_bz.width = Me.width - txt_bz.left - 200
txt_bz.height = Me.height - txt_bz.top - 500
End Sub

Public Sub LoadZrr()
Dim rs As Recordset
cbo_zrr.Clear
Set rs = systemdb_.OpenRecordset("zrr", dbOpenDynaset)
If rs.RecordCount <> 0 Then
rs.MoveFirst
End If
While Not rs.EOF
cbo_zrr.AddItem Trim(rs!Name)
rs.MoveNext
Wend
rs.Close
End Sub

Public Sub LoadJglx()
Dim rs As Recordset
cbo_jglx.Clear
Set rs = systemdb_.OpenRecordset("jglx", dbOpenDynaset)
If rs.RecordCount <> 0 Then
rs.MoveFirst
End If
While Not rs.EOF
cbo_jglx.AddItem Trim(rs!Name)
rs.MoveNext
Wend
rs.Close

End Sub
Private Sub Form_Unload(Cancel As Integer)
Timer1.Enabled = False
End Sub

Private Sub Label3_Click()

End Sub

Private Sub Timer1_Timer()
If r > count_ Then
r = 1
End If
Me.Caption = s(r)
r = r + 1

End Sub

Public Sub Clear()
Dim year
Dim rs As Recordset
Dim bh
If Not CurSelectYear = "title" Then
year = Mid$(Trim(CurSelectYear), 3, 2)
bh = Format$(runrs.RecordCount + 1, "000")
Else
year = "00"
bh = "000"
End If
txt_htbh = "土建-" & year & "-" & bh
txt_gcmc = "                                      "
cbo_jglx.ListIndex = -1
txt_jzmj.Text = "000000.00 平方米"
txt_htzj.Text = "0000000.00 元"
txt_jszj.Text = "0000000.00 元"
txt_htqx1.Text = Format$(Now, "yyyy年mm月dd日")
txt_htqx2.Text = Format$(Now, "yyyy年mm月dd日")
txt_bz.Text = " "
cbo_jglx.Text = "                        "
cbo_zrr.Text = "                        "

End Sub



Private Sub txt_bz_GotFocus()
Call SetSelect(txt_bz)

End Sub

Private Sub txt_gcmc_GotFocus()
Call SetSelect(txt_gcmc)

End Sub

Private Sub txt_htbh_GotFocus()
'Call SetSelect(txt_htbh)
txt_htbh.SelStart = Len(txt_htbh.Text) - 3
txt_htbh.SelLength = 3

End Sub

Private Sub SetSelect(item As TextBox)
item.SelStart = 0
item.SelLength = Len(item.Text)

End Sub


Private Sub txt_htqx1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = 2 Then
 SendToTextBox = 1

Call SetTimeFormShow(1, txt_htqx1, X, Y)

End If

End Sub

Private Sub SetTimeFormShow(index As Integer, item As TextBox, X, Y)
Form_selecttime.Show
With Form_selecttime
.left = form_edit.left + item.left + X
.top = form_edit.top + item.top + Y + 200 - .height
End With
form_edit.Enabled = False
form_tree.Enabled = False
form_list.Enabled = False


End Sub

Private Sub txt_htqx2_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = 2 Then
 SendToTextBox = 2


Call SetTimeFormShow(2, txt_htqx2, X, Y)

End If
End Sub

Private Sub txt_htzj_GotFocus()
Call SetSelect(txt_htzj)

End Sub

Private Sub txt_htzj_LostFocus()
Dim t
t = Val(txt_htzj.Text)
txt_htzj.Text = Format(t, "0.00元")
End Sub



Private Sub txt_jszj_GotFocus()
Call SetSelect(txt_jszj)

End Sub

Private Sub txt_jszj_LostFocus()
Dim t
t = Val(txt_jszj.Text)
txt_jszj.Text = Format(t, " 0.00元")
End Sub

Private Sub txt_jzmj_GotFocus()
Call SetSelect(txt_jzmj)

End Sub

Private Sub txt_jzmj_LostFocus()
Dim t
t = Val(txt_jzmj.Text)
txt_jzmj.Text = Format(t, " 0.00平方米")

End Sub






