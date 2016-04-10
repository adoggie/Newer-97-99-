VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Begin VB.MDIForm mdi 
   AutoShowChildren=   0   'False
   BackColor       =   &H8000000C&
   Caption         =   "工程合同管理"
   ClientHeight    =   4335
   ClientLeft      =   165
   ClientTop       =   450
   ClientWidth     =   6660
   LinkTopic       =   "MDIForm1"
   Moveable        =   0   'False
   ScrollBars      =   0   'False
   StartUpPosition =   1  '所有者中心
   WindowState     =   2  'Maximized
   Begin VB.PictureBox sb 
      Align           =   2  'Align Bottom
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   345
      Left            =   0
      ScaleHeight     =   345
      ScaleWidth      =   6660
      TabIndex        =   1
      Top             =   3990
      Width           =   6660
   End
   Begin VB.PictureBox toolbar 
      Align           =   1  'Align Top
      Height          =   465
      Left            =   0
      ScaleHeight     =   405
      ScaleWidth      =   6600
      TabIndex        =   0
      Top             =   0
      Width           =   6660
   End
   Begin ComctlLib.ImageList image 
      Left            =   1680
      Top             =   1410
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      MaskColor       =   12632256
      _Version        =   327682
   End
   Begin VB.Menu system 
      Caption         =   "系 统(&S)"
      Begin VB.Menu q1 
         Caption         =   "退出合同管理"
      End
   End
   Begin VB.Menu Append 
      Caption         =   "添 加(&A)"
      Begin VB.Menu appendprj 
         Caption         =   "添加年工程项目"
      End
      Begin VB.Menu qqqq 
         Caption         =   "-"
      End
      Begin VB.Menu AppendOther 
         Caption         =   "添加工程附属数据..."
      End
      Begin VB.Menu fdsfd 
         Caption         =   "-"
      End
      Begin VB.Menu appendword 
         Caption         =   "添加常用单词"
      End
   End
   Begin VB.Menu search 
      Caption         =   "查 询(&S)"
      Begin VB.Menu serchall 
         Caption         =   "查询全部合同记录"
      End
      Begin VB.Menu serchfor 
         Caption         =   "条件查询合同记录"
      End
      Begin VB.Menu seperator 
         Caption         =   "-"
      End
   End
   Begin VB.Menu print 
      Caption         =   "数据打印(&P)"
      Begin VB.Menu print1 
         Caption         =   "打印年工程合同"
      End
      Begin VB.Menu pinter2 
         Caption         =   "打印全部合同"
      End
      Begin VB.Menu sds 
         Caption         =   "-"
      End
      Begin VB.Menu print3 
         Caption         =   "条件打印工程合同"
      End
   End
   Begin VB.Menu topic 
      Caption         =   "主 题(&T)"
      Begin VB.Menu maker 
         Caption         =   "制 作"
      End
   End
End
Attribute VB_Name = "mdi"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub AppendOther_Click()
form_zrr.Show 1, mdi
End Sub

Private Sub appendprj_Click()
 Call form_tree.cmd_create_Click
End Sub

Private Sub maker_Click()
'mdi.Hide

about.Show 1, mdi
End Sub

Private Sub MDIForm_Load()


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





'form_tree.Tree_year.Height = form_tree.Height - form_tree.Tree_year.Top
End Sub

Private Sub print1_Click()
form_print.Show 1, mdi
End Sub

Private Sub q1_Click()
Unload Me
End Sub


