VERSION 5.00
Object = "{48DC3C96-B20F-11D1-A87F-D9394DC38340}#2.6#0"; "FLATBTN2.OCX"
Begin VB.Form form_toolbar 
   BackColor       =   &H00808000&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   615
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5625
   ForeColor       =   &H00FF0000&
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   Moveable        =   0   'False
   ScaleHeight     =   615
   ScaleWidth      =   5625
   ShowInTaskbar   =   0   'False
   Begin VB.CheckBox AppendNew 
      BackColor       =   &H00808000&
      Caption         =   "新工程"
      Height          =   228
      Left            =   600
      TabIndex        =   2
      Top             =   90
      Width           =   1164
   End
   Begin VB.Timer Timer1 
      Interval        =   200
      Left            =   4728
      Top             =   432
   End
   Begin VB.Data Data1 
      Caption         =   "Data1"
      Connect         =   "Access"
      DatabaseName    =   ""
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   345
      Left            =   3600
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   ""
      Top             =   360
      Visible         =   0   'False
      Width           =   1032
   End
   Begin DevPowerFlatBttn.FlatBttn ChangeTree 
      Height          =   255
      Left            =   45
      TabIndex        =   1
      Top             =   75
      Width           =   345
      _ExtentX        =   609
      _ExtentY        =   450
      BackColor       =   8421376
      Caption         =   ">>"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      TextColor       =   255
      Object.ToolTipText     =   "ChangeTreeListItems"
      MousePointer    =   1
   End
   Begin VB.CheckBox check1 
      Caption         =   "Hide"
      Height          =   276
      Left            =   2550
      TabIndex        =   0
      Top             =   90
      Value           =   1  'Checked
      Visible         =   0   'False
      Width           =   828
   End
   Begin VB.Image Image2 
      Height          =   375
      Left            =   1860
      Stretch         =   -1  'True
      Top             =   150
      Visible         =   0   'False
      Width           =   405
   End
   Begin VB.Image Image1 
      BorderStyle     =   1  'Fixed Single
      DataField       =   "map"
      DataSource      =   "Data1"
      Height          =   276
      Left            =   3432
      Stretch         =   -1  'True
      Top             =   48
      Width           =   1620
   End
End
Attribute VB_Name = "form_toolbar"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public dogmap As Recordset

Private Sub AppendNew_Click()
form_edit.Command1.Default = True
If AppendNew.Value = 1 Then


If form_list.IsListItemSelected Then
'如果选择了某一工程项目，则将form_edit 窗体中显示的
'相应数据保存到数据库
Call form_list.Save

form_list.lv.SelectedItem.SubItems(1) = Trim(runrs1!gcmc)
 form_list.lv.SelectedItem.SubItems(3) = Format(runrs1!jzmj, "0.00 平米")
form_list.lv.SelectedItem.SubItems(4) = Format(runrs1!jszj, "0.00 元")
form_list.lv.SelectedItem.SubItems(5) = Trim(form_edit.cbo_jglx.Text)
form_list.lv.SelectedItem.SubItems(6) = Trim(form_edit.cbo_manager.Text)
form_list.lv.SelectedItem.SubItems(2) = Format(runrs1!htzj, "0.00 元")
CurSelListItemIndex = form_list.lv.SelectedItem.index
form_list.lv.SelectedItem.Selected = False

End If
'********** common

form_edit.txt_htbh.Enabled = True
 Call clear   ' 清空所有的控件内容，准备新数据的输入
            '记录当前ListView中的内容状态
 form_edit.cmd_save.Visible = True
 

Else
form_edit.cmd_save.Visible = False
Call clear
Call restore  '显示在ListView 中被选中项的数据

End If
PreSelListItemIndex = 0

End Sub
Sub restore()
'
End Sub
Sub clear()
form_list.cmd_delete.Enabled = False
With form_edit
.txt_htbh.Text = "土建-**-***"
.txt_gcmc.Text = ""
.txt_jzmj.Text = ""
.txt_htzj.Text = ""
.txt_jszj.Text = ""
.txt_gcqx.Text = ""
.cbo_jglx.ListIndex = -1
.cbo_manager.ListIndex = -1
'.txt_htbh.SetFocus

End With


End Sub

Private Sub ChangeTree_Click()
ChangeTree.Enabled = False
Form_add.Show 1, mdi
End Sub


Private Sub Check1_Click()
Dim resoult As Boolean

If Me.check1.Value = 1 Then
form_edit.Show
Else
form_edit.Hide
End If

End Sub


Private Sub Form_Load()

'gif1.filename = "d:\ht\ct.gif"
Image2.Picture = LoadPicture(App.Path & "\徽标.bmp")

'Set dogmap = systemdb_.OpenRecordset("dogmap")
'Set Data1.Recordset = dogmap
'Data1.Refresh

Me.left = form_tree.width + 4
Me.top = 0
Me.Height = form_tree.Height - form_tree.ScaleHeight + 40
Me.width = mdi.ScaleWidth - Me.left
Me.Show

Image1.left = (form_toolbar.ScaleWidth / 5) * 4 - 800
Image1.top = 30
Image1.Height = form_toolbar.Height - 60
Image1.width = form_toolbar.ScaleWidth - 40 - Image1.left
End Sub

Private Sub new_Click()

End Sub

Private Sub Timer1_Timer()
'Data1.Recordset.MoveNext
'If Data1.Recordset.EOF Then
'Data1.Recordset.MoveFirst
'End If
End Sub
