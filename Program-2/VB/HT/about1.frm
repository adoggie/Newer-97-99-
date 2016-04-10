VERSION 5.00
Object = "{48DC3C96-B20F-11D1-A87F-D9394DC38340}#2.6#0"; "FLATBTN2.OCX"
Begin VB.Form about 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   2550
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4950
   ControlBox      =   0   'False
   DrawWidth       =   3
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2550
   ScaleWidth      =   4950
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   2364
      Left            =   24
      ScaleHeight     =   2340
      ScaleWidth      =   4815
      TabIndex        =   0
      Top             =   30
      Width           =   4848
      Begin DevPowerFlatBttn.FlatBttn cmd_ok 
         Height          =   315
         Left            =   3480
         TabIndex        =   3
         Top             =   1890
         Width           =   1065
         _ExtentX        =   1879
         _ExtentY        =   556
         AlignCaption    =   4
         AutoSize        =   0   'False
         BackColor       =   16777215
         Caption         =   "O K"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "@System"
            Size            =   12
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         TextColor       =   65280
         Object.ToolTipText     =   ""
         MousePointer    =   1
      End
      Begin VB.Timer Timer1 
         Enabled         =   0   'False
         Interval        =   200
         Left            =   2670
         Top             =   1020
      End
      Begin VB.Data Data1 
         Caption         =   "Data1"
         Connect         =   "Access"
         DatabaseName    =   ""
         DefaultCursorType=   0  'DefaultCursor
         DefaultType     =   2  'UseODBC
         Exclusive       =   0   'False
         Height          =   345
         Left            =   3570
         Options         =   0
         ReadOnly        =   0   'False
         RecordsetType   =   1  'Dynaset
         RecordSource    =   ""
         Top             =   960
         Visible         =   0   'False
         Width           =   1140
      End
      Begin VB.Image Image2 
         Height          =   615
         Left            =   3870
         Stretch         =   -1  'True
         Top             =   60
         Width           =   885
      End
      Begin VB.Image Image1 
         Appearance      =   0  'Flat
         DataField       =   "map"
         DataSource      =   "Data1"
         Height          =   390
         Left            =   90
         Stretch         =   -1  'True
         Top             =   90
         Width           =   2100
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         Caption         =   "上海园林工程有限公司 建筑处"
         Height          =   180
         Left            =   180
         TabIndex        =   2
         Top             =   2070
         Width           =   2430
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         Caption         =   " Z.Bin    99-7-28 "
         ForeColor       =   &H00404040&
         Height          =   180
         Left            =   345
         TabIndex        =   1
         Top             =   1830
         Width           =   1620
      End
      Begin VB.Image p1 
         Height          =   1230
         Left            =   120
         Stretch         =   -1  'True
         Top             =   540
         Width           =   855
      End
   End
End
Attribute VB_Name = "about"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim dogmap As Recordset



Private Sub cmd_ok_Click()
Unload Me
'mdi.Show
End Sub

Private Sub Form_Load()
Image2.Picture = LoadPicture(App.Path & "\徽标.bmp")

Picture1.left = 0
Picture1.top = 0
Me.width = Picture1.width
Me.Height = Picture1.Height
'readme.LoadFile App.Path & "\readme.txt", 1

'Set cmd_ok.Picture = LoadResPicture(151, 0)
'Picture1.Picture = LoadResPicture(151, 0)
'Set cmd_ok.Picture = Picture1.Picture
'Set dogmap = systemdb_.OpenRecordset("dogmap")
'Set Data1.Recordset = dogmap
'Data1.Refresh

'Me.Picture = LoadResPicture(151, 0)
p1.Picture = LoadResPicture(153, 0)
End Sub





Private Sub Image1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = 1 Then
If (Timer1.Interval - 30) < 0 Then
Timer1.Interval = 0
Else
Timer1.Interval = Timer1.Interval - 30
End If

Else
Timer1.Interval = Timer1.Interval + 30
End If

End Sub

Private Sub Timer1_Timer()
Data1.Recordset.MoveNext
If Data1.Recordset.EOF Then
Data1.Recordset.MoveFirst
End If

End Sub
