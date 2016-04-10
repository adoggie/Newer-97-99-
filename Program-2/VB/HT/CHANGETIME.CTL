VERSION 5.00
Object = "{8E27C92E-1264-101C-8A2F-040224009C02}#7.0#0"; "MSCAL.OCX"
Begin VB.UserControl ct 
   ClientHeight    =   1860
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3735
   ScaleHeight     =   1860
   ScaleWidth      =   3735
   Begin VB.CommandButton ok 
      Caption         =   "ok"
      Height          =   285
      Left            =   2430
      TabIndex        =   3
      Top             =   1440
      Width           =   1065
   End
   Begin VB.ComboBox cbo_month 
      Height          =   300
      Left            =   1500
      TabIndex        =   2
      Text            =   "Combo2"
      Top             =   1440
      Width           =   885
   End
   Begin VB.ComboBox cbo_year 
      Height          =   300
      Left            =   90
      TabIndex        =   1
      Text            =   "Combo1"
      Top             =   1440
      Width           =   1305
   End
   Begin MSACAL.Calendar Calendar1 
      Height          =   1665
      Left            =   -60
      TabIndex        =   0
      Top             =   -120
      Width           =   3615
      _Version        =   524288
      _ExtentX        =   6376
      _ExtentY        =   2937
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
      ShowDays        =   -1  'True
      ShowHorizontalGrid=   -1  'True
      ShowTitle       =   0   'False
      ShowVerticalGrid=   -1  'True
      TitleFontColor  =   10485760
      ValueIsNull     =   0   'False
      BeginProperty DayFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   8.25
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty GridFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
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
      Height          =   1725
      Left            =   60
      ScaleHeight     =   1665
      ScaleWidth      =   3555
      TabIndex        =   4
      Top             =   60
      Width           =   3615
   End
End
Attribute VB_Name = "ct"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Private Sub ok_Click()
Unload Form_time
End Sub

Private Sub UserControl_Initialize()
Dim year As Integer
Dim month As Integer
For year = 1990 To 2010
cbo_year.AddItem Trim(Str(year)) & "年"
Next

For month = 1 To 12
cbo_month.AddItem Format(Trim(Str(month)), "00 月")
Next

End Sub
