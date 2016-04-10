VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Begin VB.MDIForm mdi 
   AutoShowChildren=   0   'False
   BackColor       =   &H8000000C&
   Caption         =   "工程合同管理   Ver 1.0  "
   ClientHeight    =   4332
   ClientLeft      =   168
   ClientTop       =   456
   ClientWidth     =   7200
   LinkTopic       =   "MDIForm1"
   Moveable        =   0   'False
   ScrollBars      =   0   'False
   StartUpPosition =   1  'CenterOwner
   WindowState     =   2  'Maximized
   Begin VB.PictureBox sb 
      Align           =   2  'Align Bottom
      Appearance      =   0  'Flat
      BackColor       =   &H00808080&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   0
      Left            =   0
      ScaleHeight     =   0
      ScaleWidth      =   7200
      TabIndex        =   1
      Top             =   4332
      Width           =   7200
   End
   Begin VB.PictureBox toolbar 
      Align           =   1  'Align Top
      BackColor       =   &H00808080&
      Height          =   36
      Left            =   0
      ScaleHeight     =   36
      ScaleWidth      =   7200
      TabIndex        =   0
      Top             =   0
      Width           =   7200
   End
   Begin ComctlLib.ImageList image 
      Left            =   1380
      Top             =   1440
      _ExtentX        =   995
      _ExtentY        =   995
      BackColor       =   -2147483643
      MaskColor       =   12632256
      _Version        =   327682
   End
   Begin VB.Menu system 
      Caption         =   "系 统  "
      Begin VB.Menu q1 
         Caption         =   "退出合同管理"
      End
   End
   Begin VB.Menu a1 
      Caption         =   "操  作"
      Begin VB.Menu a2 
         Caption         =   "修改工程信息"
      End
      Begin VB.Menu fdsfd 
         Caption         =   "-"
      End
      Begin VB.Menu appendword 
         Caption         =   "添加常用单词"
      End
      Begin VB.Menu search 
         Caption         =   "-"
      End
      Begin VB.Menu serchall 
         Caption         =   "显示全部工程"
         Enabled         =   0   'False
      End
      Begin VB.Menu showyear 
         Caption         =   "显示年工程"
      End
      Begin VB.Menu ee3 
         Caption         =   "显示工程（以结构类型分类）"
      End
      Begin VB.Menu e4 
         Caption         =   "显示工程（以工程负责人分类）"
      End
      Begin VB.Menu seperator 
         Caption         =   "-"
      End
   End
   Begin VB.Menu print 
      Caption         =   "数据打印(&P)"
      Begin VB.Menu p 
         Caption         =   "printing"
      End
      Begin VB.Menu sds 
         Caption         =   "-"
      End
   End
   Begin VB.Menu topic 
      Caption         =   "帮 助"
      Begin VB.Menu maker 
         Caption         =   "-"
      End
      Begin VB.Menu y6y 
         Caption         =   "说明"
      End
   End
   Begin VB.Menu cccc 
      Caption         =   "系统工具"
      Begin VB.Menu calc 
         Caption         =   "计算器 (&C)"
         Shortcut        =   ^C
      End
   End
End
Attribute VB_Name = "mdi"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False



Private Sub appendprj_Click()
 Call form_tree.cmd_create_Click
End Sub

Private Sub a2_Click()
form_toolbar.ChangeTree.Enabled = False
Form_add.Show 1, mdi
End Sub

Private Sub calc_Click()
Dim hwnd  As Long
Dim n
Shell "calc.exe", vbNormalFocus
hwnd = FindWindow("scicalc", "计算器")
n = SetWindowText(hwnd, "工程管理----'99 计算器")
SetWindowPos hwnd, -1, 0, 0, 0, 0, &H2 Or &H1


End Sub

Private Sub e4_Click()
form_tree.ProjectList_NodeClick form_tree.ProjectList.Nodes("ProjectManager")
form_tree.ProjectList.Nodes("ProjectManager").Selected = True
form_tree.ProjectList.Nodes("ProjectManager").Expanded = True
End Sub

Private Sub ee3_Click()
form_tree.ProjectList_NodeClick form_tree.ProjectList.Nodes("ProjectClass")
form_tree.ProjectList.Nodes("ProjectClass").Selected = True
form_tree.ProjectList.Nodes("ProjectClass").Expanded = True
End Sub

Private Sub maker_Click()
'mdi.Hide

about.Show 1, mdi
End Sub

Private Sub MDIForm_Load()
'SetWindowPos Me.hwnd, -1, 0, 0, Me.width, Me.Height, &H2 Or &H1


DisableCloseButton (Me.hwnd)
Me.Icon = LoadResPicture(141, 1)
image.ListImages.Add , "ht", LoadResPicture(144, 0)
image.ListImages.Add , "close", LoadResPicture(138, 1)
image.ListImages.Add , "open", LoadResPicture(139, 1)
image.ListImages.Add , "mdi_icon", LoadResPicture(129, 0)
image.ListImages.Add , "add_icon", LoadResPicture(132, 0)
image.ListImages.Add , "tree_icon", LoadResPicture(144, 0)
image.ListImages.Add , "watu", LoadResPicture(135, 0)
image.ListImages.Add , "zbin", LoadResPicture(153, 0)

 'image.ListImages.Add , "watu", LoadResPicture(135, 0)

Call ShowWindows
form_tree.SetFocus
Dim n
n = SetCaretPos(200, 200)



'form_tree.Tree_year.Height = form_tree.Height - form_tree.Tree_year.Top
End Sub

Private Sub print1_Click()
form_print.Show 1, mdi
End Sub

Private Sub p_Click()
form_print.Show 1, mdi
End Sub

Private Sub q1_Click()
Unload Me
End Sub


Private Sub showyear_Click()

form_tree.ProjectList_NodeClick form_tree.ProjectList.Nodes("ProjectYear")
form_tree.ProjectList.Nodes("ProjectYear").Selected = True
form_tree.ProjectList.Nodes("ProjectYear").Expanded = True
End Sub

Private Sub y6y_Click()
about.Show 1
End Sub
