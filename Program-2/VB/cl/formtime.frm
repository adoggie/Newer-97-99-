VERSION 5.00
Object = "{8E27C92E-1264-101C-8A2F-040224009C02}#7.0#0"; "MSCAL.OCX"
Begin VB.Form formtime 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   1920
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   2295
   LinkTopic       =   "Form2"
   ScaleHeight     =   1920
   ScaleWidth      =   2295
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin MSACAL.Calendar Calendar1 
      Height          =   1605
      Left            =   -30
      TabIndex        =   0
      Top             =   -60
      Width           =   2325
      _Version        =   524288
      _ExtentX        =   4101
      _ExtentY        =   2831
      _StockProps     =   1
      BackColor       =   -2147483633
      Year            =   1980
      Month           =   1
      Day             =   1
      DayLength       =   1
      MonthLength     =   0
      DayFontColor    =   0
      FirstDay        =   1
      GridCellEffect  =   2
      GridFontColor   =   10485760
      GridLinesColor  =   -2147483632
      ShowDateSelectors=   0   'False
      ShowDays        =   0   'False
      ShowHorizontalGrid=   -1  'True
      ShowTitle       =   0   'False
      ShowVerticalGrid=   -1  'True
      TitleFontColor  =   10485760
      ValueIsNull     =   0   'False
      BeginProperty DayFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "ËÎÌו"
         Size            =   8.25
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty GridFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "ËÎÌו"
         Size            =   8.25
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty TitleFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "System"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.PictureBox p1 
      Height          =   1875
      Left            =   0
      ScaleHeight     =   1815
      ScaleWidth      =   2205
      TabIndex        =   1
      Top             =   0
      Width           =   2265
      Begin VB.CommandButton Command1 
         Caption         =   "ok"
         Height          =   225
         Left            =   1830
         TabIndex        =   4
         Top             =   1560
         Width           =   315
      End
      Begin VB.ComboBox Combo1 
         Height          =   300
         Left            =   0
         TabIndex        =   2
         Text            =   "Combo1"
         Top             =   1500
         Width           =   1005
      End
      Begin VB.ComboBox Combo2 
         Height          =   300
         Left            =   1020
         TabIndex        =   3
         Text            =   "Combo2"
         Top             =   1500
         Width           =   765
      End
   End
End
Attribute VB_Name = "formtime"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Unload Me
Form1.Enabled = True
End Sub

Private Sub Form_Load()

Me.width = p1.width
Me.height = p1.height
End Sub
