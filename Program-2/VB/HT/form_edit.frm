VERSION 5.00
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.Form form_edit 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   6675
   ClientLeft      =   15
   ClientTop       =   15
   ClientWidth     =   9495
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   6675
   ScaleWidth      =   9495
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Default         =   -1  'True
      Height          =   345
      Left            =   4860
      TabIndex        =   19
      TabStop         =   0   'False
      Top             =   5790
      Width           =   1185
   End
   Begin VB.PictureBox p1 
      ForeColor       =   &H00FF0000&
      Height          =   4080
      Left            =   168
      ScaleHeight     =   4020
      ScaleWidth      =   9360
      TabIndex        =   9
      TabStop         =   0   'False
      Top             =   390
      Width           =   9420
      Begin VB.ListBox list_manager 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Height          =   1830
         Left            =   1200
         TabIndex        =   20
         Top             =   720
         Visible         =   0   'False
         Width           =   3165
      End
      Begin VB.CommandButton Command4 
         Caption         =   "..."
         Height          =   228
         Left            =   4416
         Style           =   1  'Graphical
         TabIndex        =   7
         Top             =   2208
         Width           =   396
      End
      Begin VB.TextBox txt_gcqx 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   1200
         Locked          =   -1  'True
         TabIndex        =   18
         TabStop         =   0   'False
         Top             =   2145
         Width           =   3150
      End
      Begin MSMask.MaskEdBox txt_htzj 
         Height          =   300
         Left            =   1200
         TabIndex        =   4
         Top             =   1110
         Width           =   1605
         _ExtentX        =   2831
         _ExtentY        =   529
         _Version        =   327680
         Appearance      =   0
         BackColor       =   14737632
         ForeColor       =   16711680
         AutoTab         =   -1  'True
         Format          =   "#,##0.00 元;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.CommandButton cmd_save 
         BackColor       =   &H80000009&
         Caption         =   "保存(&S)"
         Height          =   360
         Left            =   4992
         TabIndex        =   8
         Top             =   2112
         Visible         =   0   'False
         Width           =   1020
      End
      Begin VB.ComboBox cbo_manager 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3630
         Style           =   2  'Dropdown List
         TabIndex        =   1
         Top             =   60
         Width           =   1600
      End
      Begin VB.ComboBox cbo_jglx 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         ForeColor       =   &H00FF0000&
         Height          =   300
         ItemData        =   "form_edit.frx":0000
         Left            =   1200
         List            =   "form_edit.frx":0010
         Style           =   2  'Dropdown List
         TabIndex        =   6
         Top             =   1785
         Width           =   1600
      End
      Begin VB.TextBox txt_gcmc 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         ForeColor       =   &H00FF0000&
         Height          =   312
         Left            =   1200
         MaxLength       =   30
         TabIndex        =   2
         Text            =   "txt_gcmc"
         Top             =   420
         Width           =   3156
      End
      Begin MSMask.MaskEdBox txt_jzmj 
         Height          =   300
         Left            =   1200
         TabIndex        =   3
         Top             =   780
         Width           =   1605
         _ExtentX        =   2831
         _ExtentY        =   529
         _Version        =   327680
         Appearance      =   0
         BackColor       =   14737632
         ForeColor       =   16711680
         AutoTab         =   -1  'True
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Format          =   "#,##0.00 平米;(#,##0.00)"
         PromptChar      =   "*"
      End
      Begin MSMask.MaskEdBox txt_htbh 
         Height          =   300
         Left            =   1200
         TabIndex        =   0
         Top             =   90
         Width           =   1170
         _ExtentX        =   2064
         _ExtentY        =   529
         _Version        =   327680
         Appearance      =   0
         BackColor       =   14737632
         ForeColor       =   16711680
         AutoTab         =   -1  'True
         MaxLength       =   9
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Mask            =   "土建-99-999"
         PromptChar      =   "*"
      End
      Begin MSMask.MaskEdBox txt_jszj 
         Height          =   300
         Left            =   1200
         TabIndex        =   5
         Top             =   1440
         Width           =   1605
         _ExtentX        =   2831
         _ExtentY        =   529
         _Version        =   327680
         Appearance      =   0
         BackColor       =   14737632
         ForeColor       =   16711680
         AutoTab         =   -1  'True
         Format          =   "#,##0.00 元;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.Label label_f5 
         AutoSize        =   -1  'True
         Caption         =   "按F5进行工程选择"
         Height          =   180
         Left            =   4590
         TabIndex        =   21
         Top             =   450
         Visible         =   0   'False
         Width           =   1440
      End
      Begin VB.Label Label8 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "工程期限"
         Height          =   180
         Left            =   150
         TabIndex        =   17
         Top             =   2190
         Width           =   720
      End
      Begin VB.Label Label7 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "工程负责人"
         Height          =   180
         Left            =   2640
         TabIndex        =   16
         Top             =   120
         Width           =   900
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "结算造价"
         Height          =   180
         Left            =   150
         TabIndex        =   15
         Top             =   1545
         Width           =   720
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "合同造价"
         Height          =   180
         Left            =   45
         TabIndex        =   14
         Top             =   1080
         Width           =   720
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "结构类型"
         Height          =   180
         Left            =   75
         TabIndex        =   13
         Top             =   1905
         Width           =   720
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "建筑面积"
         Height          =   180
         Left            =   150
         TabIndex        =   12
         Top             =   780
         Width           =   720
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "工程项目名称"
         Height          =   180
         Left            =   75
         TabIndex        =   11
         Top             =   465
         Width           =   1080
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "工程合同编号"
         Height          =   180
         Left            =   75
         TabIndex        =   10
         Top             =   180
         Width           =   1080
      End
   End
End
Attribute VB_Name = "form_edit"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim s() As String
Dim count_ As Integer, r As Integer
Dim list_manager_visible As Boolean



Private Sub cmd_add_Click()
RunRs.FindFirst "gcmc='" & Trim(txt_gcmc.Text) & "'"

If Not RunRs.NoMatch Then
MsgBox "此工程合同已存在！", , "Error !"
Exit Sub
End If

Dim Y, m, d, tmp
'********************  Append To Database
With RunRs
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
!Year = Trim(CurSelectYear)
'***********************

Y = Year(CDate(Trim(txt_htqx1.Text)))
m = Month(CDate(Trim(txt_htqx1.Text)))
d = Day(CDate(Trim(txt_htqx1.Text)))

tmp = Mid$(Y, 3, 2) & "/" & m & "/" & d
Y = Year(CDate(txt_htqx2))
m = Month(CDate(txt_htqx2))
d = Day(CDate(txt_htqx2))
tmp = tmp & "-" & Mid$(Y, 3, 2) & "/" & m & "/" & d

!qx = tmp
.Update
End With

'***********************  Following Append To ListView Control
Dim item As ListItem
RunRs.Bookmark = RunRs.LastModified
Set item = form_list.lv.ListItems.Add(, Trim(RunRs!gcmc) & "1976-12-16", Trim(RunRs!htbh))
item.SubItems(1) = Trim(RunRs!gcmc)
item.SubItems(2) = Format(RunRs!htzj, "0.00 元")
item.SubItems(3) = Format(RunRs!jzmj, "0.00 平米")

item.SubItems(4) = Format(RunRs!jszj, "0.00 元")

item.SubItems(5) = Trim(RunRs!jglx)
'********************



'Call clear
If ItemSelected = False Then
Exit Sub
Else
CurSelectItem.Selected = False
ItemSelected = False
End If


End Sub

Private Sub cmd_clear_Click()
'Call clear
End Sub

Private Sub cbo_jglx_KeyPress(K As Integer)
If K = 13 Then
SendKeys "{tab}"
End If
End Sub

Private Sub cbo_manager_KeyPress(K As Integer)
If K = 13 Then
SendKeys "{tab}"
End If
'MsgBox K

End Sub

Public Sub cmd_save_Click()
Dim htbh_
Dim i, j
If form_toolbar.AppendNew = 0 Then
MsgBox "can not add new record!"
Exit Sub
End If
Command1.Default = True
'***************  以下便是增加新的记录
If txt_htbh.Text = "土建-**-***" Then
MsgBox "请填写合同编号"
txt_htbh.SetFocus
Exit Sub
End If
If Len(Trim(txt_gcmc.Text)) = 0 Then
MsgBox "请输入工程名称"
txt_gcmc.SetFocus
Exit Sub
End If
Result = MsgBox("是否真的要添加？", vbYesNo)
If Result = vbNo Then
Exit Sub
End If
htbh_ = right(txt_htbh.Text, 6)
RunTableRs.FindFirst "htbh='" & htbh_ & "'"
If RunTableRs.NoMatch Then
RunTableRs.AddNew
RunTableRs!htbh = htbh_
RunTableRs!gcmc = Trim(txt_gcmc.Text)
RunTableRs!jzmj = CSng(Val(txt_jzmj.Text))
RunTableRs!htzj = CCur(Val(txt_htzj.Text))
RunTableRs!jszj = CCur(Val(txt_jszj.Text))
RunTableRs!jglx = Trim(cbo_jglx.Text)
RunTableRs!manager = Trim(cbo_manager.Text)
RunTableRs!gcqx = Trim(txt_gcqx.Text)
If Val(left(htbh_, 2)) < 80 Then
RunTableRs!Year = Val("20" & left(htbh_, 2))
Else
RunTableRs!Year = Val("19" & left(htbh_, 2))
End If

RunTableRs.Update
Else
MsgBox "此工程编号记录已存在,请重输编号", vbInformation Or vbOKOnly, "警告!"
txt_htbh.SetFocus
Exit Sub

End If
form_toolbar.clear
txt_htbh.SetFocus
'If form_list.lv.ListItems.count = 0 Then
'GoTo step1
'Else
'MsgBox "enable visible"

'form_list.lv.ListItems(form_list.lv.ListItems.count).EnsureVisible
'End If
'step1:

'*******************
'**************

Dim node As node
Dim flag  As Boolean
Dim n As node
flag = False
For Each n In form_tree.ProjectList.Nodes
If n.Selected = True Then
flag = True
Exit For
End If
Next

If flag = False Then
Exit Sub
End If
Set runrs1 = Nothing
Set node = form_tree.ProjectList.SelectedItem
If node.Tag = "NO TAG" Then
Exit Sub
End If

Set runrs1 = systemdb_.OpenRecordset(node.Tag, dbOpenDynaset)
 form_list.FillListView node



End Sub


Public Sub Command1_Click()
SendKeys "{tab}"
End Sub

Private Sub Command2_Click()
'SendKeys "{tab}"
On Error GoTo error

MsgBox form_list.lv.SelectedItem.Text


error:

End Sub



Private Sub Command4_Click()
Form_selecttime.left = form_edit.left + 1000
Form_selecttime.top = form_edit.top + form_edit.txt_gcqx.top + form_edit.txt_gcqx.Height + 20
Form_selecttime.Show
SetWindowPos Form_selecttime.hwnd, -1, 0, 0, Form_selecttime.width, Form_selecttime.Height, &H2 Or &H1

'
End Sub

Private Sub Form_Load()
list_manager_visible = False
Me.left = form_toolbar.left
Me.width = form_toolbar.width
Me.top = form_toolbar.Height
Me.Height = form_list.top - form_toolbar.Height
'*****************
Me.Show
p1.left = 10
p1.top = 4
p1.width = Me.width - 20
p1.Height = Me.Height - 10
p1.Picture = LoadResPicture(149, 0)

form_toolbar.check1.Value = 1
form_toolbar.AppendNew.Value = 1

Dim p, i
p = "用于添加、修改当年工程项目合同。。。。。。99'  Z.Bin"
Dim L
L = Len(p)
count_ = L
ReDim s(L + 1) As String
For i = 1 To L
s(i) = left(p, i)
Next
r = 1

'*******************
Call Fill_Jglx_Manager





End Sub

Sub Fill_Jglx_Manager()
Dim tmp
tmp = cbo_jglx.Text
cbo_jglx.clear
If Len(Trim(tmp)) <> 0 Then
cbo_jglx.AddItem tmp     '添加原先选择的一项
cbo_jglx.ListIndex = 0   '选择第一项

End If
ProjectClassTableRs.MoveFirst
While Not ProjectClassTableRs.EOF
If ProjectClassTableRs!IsKilled = False Then

If ProjectClassTableRs!Name = Trim(tmp) Then
GoTo step1   '如果要添加进去的一项与第一项相同，则不添加
End If
cbo_jglx.AddItem Trim(ProjectClassTableRs!Name)
End If
step1:
ProjectClassTableRs.MoveNext
Wend


tmp = cbo_manager.Text
cbo_manager.clear
If Len(Trim(tmp)) <> 0 Then
cbo_manager.AddItem tmp     '添加原先选择的一项
cbo_manager.ListIndex = 0
End If
ManagerTableRs.MoveFirst
While Not ManagerTableRs.EOF
If ManagerTableRs!IsKilled = False Then
If ManagerTableRs!Name = Trim(tmp) Then
GoTo step2   '如果要添加进去的一项与第一项相同，则不添加
End If

cbo_manager.AddItem Trim(ManagerTableRs!Name)
End If
step2:
ManagerTableRs.MoveNext
Wend


End Sub

Private Sub Timer1_Timer()
If r > count_ Then
r = 1
End If
Me.Caption = s(r)
r = r + 1

End Sub




Private Sub Text1_KeyPress(KeyAscii As Integer)
If K = 13 Then
SendKeys "{tab}"
End If
End Sub

Private Sub gcqx_Change()

End Sub





Private Sub list_manager_Click()
txt_gcmc.Text = list_manager.List(list_manager.ListIndex)
End Sub




Private Sub list_manager_LostFocus()
'txt_gcmc.SetFocus
list_manager.Visible = False
End Sub

Private Sub txt_gcmc_GotFocus()

label_f5.Visible = True

End Sub

Private Sub txt_gcmc_KeyDown(K As Integer, Shift As Integer)
If K = vbKeyF5 Then
list_manager_visible = Not list_manager_visible
list_manager.clear
'*************




If Len(Trim(cbo_manager.Text)) <> 0 Then
Dim rs_ As Recordset
Set rs_ = systemdb_.OpenRecordset("select gcmc from run where manager='" & Trim(cbo_manager.Text) & "' order by gcmc" _
, dbOpenDynaset)
    
        If rs_.RecordCount = 0 Then
         
           ' MsgBox "此管理人员的工程项目名"
           Exit Sub
        End If


While Not rs_.EOF
list_manager.AddItem rs_!gcmc
rs_.MoveNext
Wend
list_manager.Visible = True

list_manager.SetFocus

End If

'*************
'list_manager.Visible = True

End If

End Sub

Private Sub txt_gcmc_LostFocus()
label_f5.Visible = False
End Sub

Private Sub txt_htbh_GotFocus()
txt_htbh.SelStart = 0
txt_htbh.SelLength = Len(txt_htbh.Text)
End Sub

Private Sub SetSelect(item As TextBox)
item.SelStart = 0
item.SelLength = Len(item.Text)

End Sub


Private Sub txt_htbh_ValidationError(InvalidText As String, StartPosition As Integer)
MsgBox "输入合同编号有误！"

txt_htbh.SetFocus

'txt_htbh.Text = ""


End Sub


Private Sub SetTimeFormShow(index As Integer, item As TextBox, X, Y)
Form_selecttime.Show
With Form_selecttime
.left = form_edit.left + item.left + X
.top = form_edit.top + item.top + Y + 200 - .Height
End With
form_edit.Enabled = False
form_tree.Enabled = False
form_list.Enabled = False


End Sub





Private Sub txt_jzmj_KeyPress(K As Integer)
If K = 13 Then
SendKeys "{tab}"
End If

End Sub

Public Sub ShowSelListItem(item As ListItem)
Dim SelectIndex As Integer
cmd_save.Visible = False
SelectIndex = -2

runrs1.FindFirst "htbh='" & item.Tag & "'"
txt_htbh.Text = "土建-" & runrs1!htbh
txt_gcmc.Text = Trim(runrs1!gcmc)
txt_jzmj.Text = CStr(runrs1!jzmj)
txt_htzj.Text = CStr(runrs1!htzj)
txt_jszj.Text = CStr(runrs1!jszj)
txt_gcqx.Text = runrs1!gcqx

'********************
cbo_jglx.clear
ProjectClassTableRs.MoveFirst
While Not ProjectClassTableRs.EOF
If ProjectClassTableRs!IsKilled = False Then
cbo_jglx.AddItem ProjectClassTableRs!Name   '将结构类型添加到列表框

If runrs1!jglx = ProjectClassTableRs!Name Then
SelectIndex = cbo_jglx.NewIndex
End If
End If
ProjectClassTableRs.MoveNext
Wend
If SelectIndex = -2 Then
cbo_jglx.AddItem runrs1!jglx
SelectIndex = cbo_jglx.NewIndex
End If
cbo_jglx.ListIndex = SelectIndex
'*****************
cbo_manager.clear
SelectIndex = -2
ManagerTableRs.MoveFirst
While Not ManagerTableRs.EOF
If ManagerTableRs!IsKilled = False Then
cbo_manager.AddItem ManagerTableRs!Name   '将结构类型添加到列表框

If runrs1!manager = ManagerTableRs!Name Then
SelectIndex = cbo_manager.NewIndex
End If
End If
ManagerTableRs.MoveNext
Wend
If SelectIndex = -2 Then
cbo_manager.AddItem runrs1!manager
SelectIndex = cbo_manager.NewIndex
End If
cbo_manager.ListIndex = SelectIndex
End Sub
'************************

