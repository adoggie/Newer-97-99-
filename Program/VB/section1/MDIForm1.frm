VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.1#0"; "COMCTL32.OCX"
Begin VB.MDIForm MDIForm1 
   BackColor       =   &H8000000C&
   Caption         =   " 工资管理 "
   ClientHeight    =   3084
   ClientLeft      =   132
   ClientTop       =   708
   ClientWidth     =   6828
   Icon            =   "MDIForm1.frx":0000
   LinkTopic       =   "MDIForm1"
   LockControls    =   -1  'True
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin ComctlLib.Toolbar Toolbar1 
      Align           =   1  'Align Top
      Height          =   528
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   6828
      _ExtentX        =   12044
      _ExtentY        =   931
      ButtonWidth     =   995
      ButtonHeight    =   804
      Appearance      =   1
      _Version        =   327680
      BeginProperty Buttons {0713E452-850A-101B-AFC0-4210102A8DA7} 
         NumButtons      =   7
         BeginProperty Button1 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "a1"
            Object.ToolTipText     =   "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
            Object.Tag             =   ""
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button2 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "a2"
            Object.Tag             =   ""
         EndProperty
         BeginProperty Button3 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "a3"
            Object.Tag             =   ""
         EndProperty
         BeginProperty Button4 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "a4"
            Object.Tag             =   ""
         EndProperty
         BeginProperty Button5 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "a5"
            Object.Tag             =   ""
         EndProperty
         BeginProperty Button6 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "a6"
            Object.Tag             =   ""
         EndProperty
         BeginProperty Button7 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Object.Tag             =   ""
         EndProperty
      EndProperty
   End
   Begin ComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   372
      Left            =   0
      TabIndex        =   0
      ToolTipText     =   "I LOVE YOU!!!!!"
      Top             =   2712
      Width           =   6828
      _ExtentX        =   12044
      _ExtentY        =   656
      SimpleText      =   "职工当月工资   添加/修改"
      _Version        =   327680
      BeginProperty Panels {0713E89E-850A-101B-AFC0-4210102A8DA7} 
         NumPanels       =   1
         BeginProperty Panel1 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            TextSave        =   ""
            Object.Tag             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Menu 大幅度 
      Caption         =   "退出系统"
   End
   Begin VB.Menu m1 
      Caption         =   "数据添加"
      Begin VB.Menu a1 
         Caption         =   "录入当月工资"
      End
      Begin VB.Menu a2 
         Caption         =   "-"
      End
      Begin VB.Menu gzk 
         Caption         =   "生成当月工资库"
         Enabled         =   0   'False
      End
      Begin VB.Menu a3 
         Caption         =   "添加 部门"
      End
      Begin VB.Menu a5 
         Caption         =   "添加/修改 职工信息"
      End
      Begin VB.Menu a6 
         Caption         =   "-"
      End
   End
   Begin VB.Menu menu2 
      Caption         =   "数据修改"
      Begin VB.Menu b1 
         Caption         =   "当月工资修改"
         Enabled         =   0   'False
      End
      Begin VB.Menu b2 
         Caption         =   "-"
      End
      Begin VB.Menu b3 
         Caption         =   "部门 修改"
         Enabled         =   0   'False
      End
      Begin VB.Menu b4 
         Caption         =   "职工信息库 修改"
      End
   End
   Begin VB.Menu edit 
      Caption         =   "数据维护"
      Begin VB.Menu backup 
         Caption         =   "备份数据库"
      End
      Begin VB.Menu deldb 
         Caption         =   "删除数据库"
         Enabled         =   0   'False
      End
   End
   Begin VB.Menu FIND 
      Caption         =   "数据查寻"
      Begin VB.Menu FIND1 
         Caption         =   "瀑布式查询职工信息"
      End
      Begin VB.Menu q1 
         Caption         =   "瀑布式查询职工当月工资"
      End
      Begin VB.Menu kk 
         Caption         =   "-"
      End
      Begin VB.Menu FIND2 
         Caption         =   "记录式查询职工信息"
      End
      Begin VB.Menu tt 
         Caption         =   "当月工资记录式查询职工"
      End
      Begin VB.Menu SPACE1 
         Caption         =   "-"
      End
      Begin VB.Menu HFIND 
         Caption         =   "汇总查询"
      End
   End
   Begin VB.Menu dfd 
      Caption         =   "打印操作"
      Begin VB.Menu fff 
         Caption         =   "打印工资单"
      End
   End
   Begin VB.Menu menu1 
      Caption         =   "制作信息"
      Begin VB.Menu gs 
         Caption         =   "感受..."
      End
   End
End
Attribute VB_Name = "MDIForm1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub d_Click()
Form1.Show
End Sub

Private Sub a1_Click()
cur_database = "zgxx"
prompt.cmdappend.Caption = "添 加"
prompt.Labappend.Visible = True
prompt.Labfind.Visible = False
prompt.Show
End Sub

Private Sub a3_Click()
bmtj.Show 1, MDIForm1
End Sub

Private Sub a4_Click()
zctj.Show
End Sub

Private Sub a5_Click()
form2.Show 1, MDIForm1
End Sub

Private Sub a7_Click()
Unload Me
End Sub

Private Sub b1_Click()
Form5.Show 1, MDIForm1

End Sub

Private Sub b4_Click()
form2.Show 1, MDIForm1
End Sub

Private Sub backup_Click()
Form6.Show 1, MDIForm1
End Sub

Private Sub deldb_Click()
Form3.Text1.Visible = False
Form3.Label2.Visible = False
Form3.Show 1, MDIForm1
End Sub

Private Sub dfa_Click()
Unload Me
End Sub

Private Sub FIND1_Click()
Form8.Show 1, MDIForm1
End Sub

Private Sub FIND2_Click()
form2.delete.Enabled = False
form2.append.Enabled = False
form2.edit.Enabled = False
form2.Text1.Enabled = False
form2.Text2.Enabled = False
form2.Text3.Enabled = False
form2.Text6.Enabled = False
form2.Show 1, MDIForm1
End Sub

Private Sub gs_Click()
about.Show 1, MDIForm1
End Sub

Private Sub io_Click()
bmtj.Show 1, MDIForm1
End Sub



Private Sub HFIND_Click()
Form10.Show 1, MDIForm1
End Sub

Private Sub MDIForm_Unload(Cancel As Integer)
Kill App.path & "\tmpfile.mdb"
End Sub

Private Sub q1_Click()
Form9.Show 1, MDIForm1
End Sub

Private Sub tt_Click()
Form1.Command3.Visible = False
findflag = True
prompt.cmdappend.Caption = "查  寻"
prompt.Labappend.Visible = False
prompt.Labfind.Visible = True
prompt.Show

End Sub

Private Sub 大幅度_Click()
Unload Me
End Sub
