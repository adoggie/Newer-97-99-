VERSION 5.00
Object = "{48DC3C96-B20F-11D1-A87F-D9394DC38340}#2.6#0"; "FLATBTN2.OCX"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form about 
   BackColor       =   &H00808000&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   3765
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7230
   ControlBox      =   0   'False
   DrawWidth       =   3
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3765
   ScaleWidth      =   7230
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  '所有者中心
   Begin VB.PictureBox Picture1 
      BackColor       =   &H00C0C0C0&
      Height          =   3615
      Left            =   60
      ScaleHeight     =   3555
      ScaleWidth      =   7005
      TabIndex        =   0
      Top             =   60
      Width           =   7065
      Begin DevPowerFlatBttn.FlatBttn cmd_ok 
         Height          =   525
         Left            =   5040
         TabIndex        =   4
         Top             =   2910
         Width           =   1545
         _ExtentX        =   2725
         _ExtentY        =   926
         AlignCaption    =   4
         AutoSize        =   0   'False
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
         Interval        =   200
         Left            =   2310
         Top             =   1170
      End
      Begin VB.Data Data1 
         Caption         =   "Data1"
         Connect         =   "Access"
         DatabaseName    =   ""
         DefaultCursorType=   0  'DefaultCursor
         DefaultType     =   2  'UseODBC
         Exclusive       =   0   'False
         Height          =   345
         Left            =   2970
         Options         =   0
         ReadOnly        =   0   'False
         RecordsetType   =   1  'Dynaset
         RecordSource    =   ""
         Top             =   1440
         Visible         =   0   'False
         Width           =   1140
      End
      Begin RichTextLib.RichTextBox readme 
         Height          =   2025
         Left            =   1380
         TabIndex        =   3
         TabStop         =   0   'False
         Top             =   660
         Width           =   5535
         _ExtentX        =   9763
         _ExtentY        =   3572
         _Version        =   393217
         Enabled         =   0   'False
         ReadOnly        =   -1  'True
         TextRTF         =   $"about.frx":0000
      End
      Begin VB.Label Label3 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "Readme!!"
         BeginProperty Font 
            Name            =   "ScriptS"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   555
         Left            =   810
         TabIndex        =   5
         Top             =   90
         Width           =   2025
      End
      Begin VB.Image Image1 
         BorderStyle     =   1  'Fixed Single
         DataField       =   "map"
         DataSource      =   "Data1"
         Height          =   525
         Left            =   4260
         Stretch         =   -1  'True
         Top             =   90
         Width           =   2625
      End
      Begin VB.Label Label2 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "上海园林工程有限公司 建筑处"
         BeginProperty Font 
            Name            =   "楷体_GB2312"
            Size            =   12
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   345
         Left            =   30
         TabIndex        =   2
         Top             =   3210
         Width           =   4305
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Programming：  Z.Bin    99-7-28 Ver 1.0"
         BeginProperty Font 
            Name            =   "ScriptC"
            Size            =   15
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   495
         Left            =   30
         TabIndex        =   1
         Top             =   2700
         Width           =   4305
      End
      Begin VB.Image p1 
         BorderStyle     =   1  'Fixed Single
         Height          =   1605
         Left            =   120
         Stretch         =   -1  'True
         Top             =   780
         Width           =   1155
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
readme.LoadFile App.Path & "\readme.txt", 1

'Set cmd_ok.Picture = LoadResPicture(151, 0)
'Picture1.Picture = LoadResPicture(151, 0)
'Set cmd_ok.Picture = Picture1.Picture
Set dogmap = systemdb_.OpenRecordset("dogmap")
Set Data1.Recordset = dogmap
Data1.Refresh

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
