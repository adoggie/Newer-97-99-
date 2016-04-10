VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.1#0"; "COMDLG32.OCX"
Begin VB.Form form2 
   BorderStyle     =   5  'Sizable ToolWindow
   Caption         =   " 职 工 信 息"
   ClientHeight    =   5532
   ClientLeft      =   816
   ClientTop       =   1236
   ClientWidth     =   8016
   LinkTopic       =   "Form2"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5532
   ScaleWidth      =   8016
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox Text7 
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.8
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   324
      Left            =   960
      TabIndex        =   27
      Text            =   "Text7"
      Top             =   3840
      Width           =   492
   End
   Begin VB.PictureBox Picture2 
      Height          =   2892
      Left            =   120
      ScaleHeight     =   2844
      ScaleWidth      =   1764
      TabIndex        =   25
      Top             =   600
      Width           =   1812
      Begin VB.Image Image2 
         Height          =   2892
         Left            =   0
         Stretch         =   -1  'True
         Top             =   0
         Width           =   1812
      End
   End
   Begin MSComDlg.CommonDialog dlg 
      Left            =   2400
      Top             =   1680
      _ExtentX        =   699
      _ExtentY        =   699
      _Version        =   327680
   End
   Begin VB.Data Data1 
      Caption         =   "Data1"
      Connect         =   "Access"
      DatabaseName    =   ""
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   372
      Left            =   2160
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   ""
      Top             =   2400
      Visible         =   0   'False
      Width           =   1452
   End
   Begin VB.Frame Frame2 
      Caption         =   "个人档案："
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4440
      Left            =   2040
      TabIndex        =   1
      Top             =   120
      Width           =   5892
      Begin VB.CommandButton pp 
         Caption         =   "添加图片"
         Height          =   252
         Left            =   4200
         TabIndex        =   24
         Top             =   2280
         Visible         =   0   'False
         Width           =   1332
      End
      Begin VB.PictureBox Picture1 
         Height          =   1932
         Left            =   4080
         ScaleHeight     =   1884
         ScaleWidth      =   1524
         TabIndex        =   23
         Top             =   240
         Width           =   1572
         Begin VB.Image Image1 
            DataField       =   "tp"
            DataSource      =   "Data1"
            Height          =   1932
            Left            =   0
            Stretch         =   -1  'True
            Top             =   0
            Width           =   1572
         End
      End
      Begin VB.TextBox Text5 
         DataField       =   "bm"
         DataSource      =   "Data1"
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   12
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   372
         Left            =   840
         TabIndex        =   21
         Text            =   "Text5"
         Top             =   1920
         Width           =   2772
      End
      Begin VB.TextBox Text4 
         DataField       =   "zc"
         DataSource      =   "Data1"
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   12
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   372
         Left            =   840
         TabIndex        =   20
         Text            =   "Text4"
         Top             =   1440
         Width           =   2772
      End
      Begin VB.ComboBox Combo2 
         Height          =   276
         ItemData        =   "Form2.frx":0000
         Left            =   840
         List            =   "Form2.frx":0002
         TabIndex        =   19
         Top             =   1920
         Visible         =   0   'False
         Width           =   2772
      End
      Begin VB.ComboBox Combo1 
         Height          =   276
         Left            =   840
         TabIndex        =   18
         Top             =   1440
         Visible         =   0   'False
         Width           =   2772
      End
      Begin VB.TextBox Text6 
         DataField       =   "jl"
         DataSource      =   "Data1"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1692
         Left            =   240
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   15
         Text            =   "Form2.frx":0004
         Top             =   2640
         Width           =   5172
      End
      Begin VB.TextBox Text3 
         DataField       =   "nl"
         DataSource      =   "Data1"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   372
         Left            =   3000
         TabIndex        =   7
         Top             =   840
         Width           =   612
      End
      Begin VB.TextBox Text2 
         DataField       =   "xm"
         DataSource      =   "Data1"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   12
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   372
         Left            =   840
         TabIndex        =   4
         Text            =   "Text2"
         Top             =   840
         Width           =   1332
      End
      Begin VB.TextBox Text1 
         DataField       =   "gh"
         DataSource      =   "Data1"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   372
         Left            =   840
         TabIndex        =   2
         Text            =   "Text1"
         Top             =   360
         Width           =   972
      End
      Begin VB.Label Label8 
         AutoSize        =   -1  'True
         Caption         =   "简 历："
         Height          =   180
         Left            =   240
         TabIndex        =   16
         Top             =   2400
         Width           =   636
      End
      Begin VB.Label Label7 
         AutoSize        =   -1  'True
         Caption         =   "部门"
         Height          =   180
         Left            =   240
         TabIndex        =   9
         Top             =   2040
         Width           =   360
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         Caption         =   "职称"
         Height          =   180
         Left            =   240
         TabIndex        =   8
         Top             =   1560
         Width           =   360
      End
      Begin VB.Label Label5 
         Caption         =   "年龄"
         Height          =   252
         Left            =   2400
         TabIndex        =   6
         Top             =   960
         Width           =   372
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "姓名"
         Height          =   180
         Left            =   240
         TabIndex        =   5
         Top             =   960
         Width           =   360
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         Caption         =   "工号"
         Height          =   180
         Left            =   240
         TabIndex        =   3
         Top             =   480
         Width           =   360
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "操作"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   852
      Left            =   120
      TabIndex        =   0
      Top             =   4560
      Width           =   7812
      Begin VB.CommandButton nnext 
         Caption         =   "下记录"
         Height          =   492
         Left            =   1080
         TabIndex        =   22
         Top             =   240
         Width           =   972
      End
      Begin VB.CommandButton eexit 
         Caption         =   "退 出"
         Height          =   492
         Left            =   6840
         TabIndex        =   17
         Top             =   240
         Width           =   852
      End
      Begin VB.CommandButton find 
         Caption         =   "查 找"
         Height          =   492
         Left            =   5520
         TabIndex        =   14
         Top             =   240
         Width           =   1212
      End
      Begin VB.CommandButton append 
         Caption         =   "添 加"
         Height          =   492
         Left            =   4440
         TabIndex        =   13
         Top             =   240
         Width           =   1092
      End
      Begin VB.CommandButton delete 
         Caption         =   "删 除"
         Height          =   492
         Left            =   3360
         TabIndex        =   12
         Top             =   240
         Width           =   1092
      End
      Begin VB.CommandButton edit 
         Caption         =   "修 改"
         Height          =   492
         Left            =   2280
         TabIndex        =   11
         Top             =   240
         Width           =   1092
      End
      Begin VB.CommandButton prev 
         Caption         =   "上记录"
         Height          =   492
         Left            =   120
         TabIndex        =   10
         Top             =   240
         Width           =   972
      End
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   " 记录总数"
      Height          =   180
      Left            =   0
      TabIndex        =   26
      Top             =   3960
      Width           =   816
   End
End
Attribute VB_Name = "form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim db1 As Database
Dim rs(1) As Recordset
Dim check1


Private Sub append_Click()
Data1.Recordset.AddNew
Text1.SetFocus
Text4.Visible = False
Text5.Visible = False
Combo1.Visible = True
Combo2.Visible = True
Combo1.Text = ""
Combo2.Text = ""
pp.Visible = True
End Sub

Private Sub Combo1_Click()
Text4.Text = Combo1.Text
End Sub

Private Sub Combo2_Click()
Text5.Text = Combo2.Text
End Sub

Private Sub Command1_Click()
Data1.UpdateControls
End Sub

Private Sub Data1_Reposition()
Combo1.Text = Text4.Text
Combo2.Text = Text5.Text
Text7.Text = Data1.Recordset.RecordCount
End Sub

Private Sub Data1_Validate(Action As Integer, Save As Integer)
Dim msg
Text4.Text = Combo1.Text
Text5.Text = Combo2.Text
Combo1.Visible = False
Combo2.Visible = False
Text4.Visible = True
Text5.Visible = True
pp.Visible = False
Select Case Action
Case 1, 2, 3, 4, 5, 11
If Save Then
msg = MsgBox("当前记录已被修改！ 要保存吗？", vbYesNo)
   If msg = vbNo Then
             Save = 0
    End If
End If
  End Select
  
End Sub

Private Sub delete_Click()
Dim msg
msg = MsgBox("确定删除本记录吗？", vbYesNo, "mess")
If msg = vbNo Then
Exit Sub
Else
Data1.Recordset.delete
Data1.Recordset.MoveNext
If Data1.Recordset.EOF Then Data1.Recordset.MoveLast
End If
End Sub

Private Sub exit_Click()
Unload Me
End Sub

Private Sub edit_Click()
Text4.Visible = False
Text5.Visible = False
Combo1.Text = Text4.Text
Combo2.Text = Text5.Text
Combo1.Visible = True
Combo2.Visible = True
pp.Visible = True
End Sub

Private Sub eexit_Click()
Unload Me
End Sub

Private Sub find_Click()
form4.Show 1, MDIForm1
End Sub

Private Sub Form_Load()
Image2.Picture = LoadPicture(App.path & "\win95.bmp")
Data1.DatabaseName = path
Data1.RecordSource = "zgxx"
Data1.Refresh
Set db1 = OpenDatabase(path, False, False)
Set rs(0) = db1.OpenRecordset("select bm from bm", dbOpenDynaset)
Set rs(1) = db1.OpenRecordset("select zc from zc", dbOpenDynaset)
Do While Not rs(0).EOF
Combo2.AddItem rs(0)("bm")
rs(0).MoveNext
Loop
Do While Not rs(1).EOF
Combo1.AddItem rs(1)("zc")
rs(1).MoveNext
Loop
If Data1.Recordset.RecordCount = 0 Then
MsgBox "数据库为空，请先进行添加!", vbOKOnly
Data1.Recordset.AddNew
Else
Data1.Recordset.MoveFirst
End If
End Sub

Private Sub next_Click()


End Sub

Private Sub Form_Unload(Cancel As Integer)
form2.delete.Enabled = True
form2.append.Enabled = True
form2.edit.Enabled = True
form2.Text1.Enabled = True
form2.Text2.Enabled = True
form2.Text3.Enabled = True
form2.Text6.Enabled = True
End Sub

Private Sub nnext_Click()
Data1.Recordset.MoveNext
If Data1.Recordset.EOF Then
Data1.Recordset.MoveLast
End If
End Sub

Private Sub ok_Click()
Dim msg
ok.Visible = False
prev.Visible = True
nnext.Visible = True
edit.Visible = True
append.Visible = True
delete.Visible = True
find.Visible = True
eexit.Visible = True
'Data1.Recordset.edit
Data1.Recordset.Update
Data1.Recordset.MoveLast
End Sub

Private Sub pp_Click()
On Error GoTo n
dlg.ShowOpen
dlg.Filter = "*.bmp ,*.jpg ....."
Image1.Picture = LoadPicture(dlg.filename)
n:
Image1.DataChanged = True
End Sub

Private Sub prev_Click()
Data1.Recordset.MovePrevious
If Data1.Recordset.BOF Then
Data1.Recordset.MoveFirst
End If
End Sub


Private Sub save_Click()
prev.Enabled = True
nnext.Enabled = True
edit.Enabled = True
delete.Enabled = True
append.Enabled = True
find.Enabled = True
eexit.Enabled = True
Combo1.Visible = False
Combo2.Visible = False
Text4.Visible = True
Text5.Visible = True
Text4.Text = Combo1.Text
Text5.Text = Combo2.Text
Save.Visible = False
Cancel.Visible = False
End Sub
