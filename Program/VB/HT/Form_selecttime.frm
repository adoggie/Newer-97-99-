VERSION 5.00
Object = "{48DC3C96-B20F-11D1-A87F-D9394DC38340}#2.6#0"; "FLATBTN2.OCX"
Begin VB.Form Form_selecttime 
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   1305
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4230
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1305
   ScaleWidth      =   4230
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  '所有者中心
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Default         =   -1  'True
      Height          =   252
      Left            =   1824
      TabIndex        =   5
      TabStop         =   0   'False
      Top             =   864
      Width           =   1068
   End
   Begin VB.PictureBox p1 
      BackColor       =   &H00808080&
      Height          =   435
      Left            =   0
      ScaleHeight     =   375
      ScaleWidth      =   4095
      TabIndex        =   4
      TabStop         =   0   'False
      Top             =   0
      Width           =   4155
      Begin DevPowerFlatBttn.FlatBttn cmd_ok 
         Height          =   270
         Left            =   3480
         TabIndex        =   3
         Top             =   60
         Width           =   570
         _ExtentX        =   1005
         _ExtentY        =   476
         AlignCaption    =   4
         AutoSize        =   0   'False
         BackColor       =   16711680
         Caption         =   "OK"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "@宋体"
            Size            =   9.75
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         ShadowColor     =   -2147483640
         TextColor       =   65535
         Object.ToolTipText     =   ""
         MousePointer    =   1
      End
      Begin VB.ComboBox cbo_day 
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   2430
         Style           =   2  'Dropdown List
         TabIndex        =   2
         Top             =   30
         Width           =   975
      End
      Begin VB.ComboBox cbo_month 
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   1440
         Style           =   2  'Dropdown List
         TabIndex        =   1
         Top             =   30
         Width           =   915
      End
      Begin VB.ComboBox cbo_year 
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   30
         Style           =   2  'Dropdown List
         TabIndex        =   0
         Top             =   30
         Width           =   1335
      End
   End
End
Attribute VB_Name = "Form_selecttime"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim ct As Integer
 Dim tmp(3) As String

Private Sub cmd_ok_Click()
 Dim time_

 time_ = Str(Val(cbo_year.Text)) & Str(Val(cbo_month.Text)) _
 & Str(Val(cbo_day.Text))

form_edit.txt_gcqx.Text = Format$(time_, "yyyy年mm月dd日-")
tmp(ct) = Trim(Format$(time_, "yyyy年mm月dd日"))
ct = ct + 1
If ct = 2 Then
form_edit.txt_gcqx.Text = tmp(0) & "-" & tmp(1)
'Call form_edit.Command1_Click
form_edit.cmd_save.Default = True
Unload Me
End If
SendKeys "{tab}"


'******************************



End Sub

Private Sub Command1_Click()
SendKeys "{tab}"
End Sub

Private Sub Form_Load()
ct = 0
'****************************************

Me.Show
Me.width = p1.width + 5
Me.Height = p1.Height + 5
'***************************************
'Following Is  Init ComboBox
Dim i
Dim tmp_year, tmp_month, tmp_day
For i = 1980 To 2010
cbo_year.AddItem " " & Str(i) & " 年"

Next
tmp_year = Val(CStr(Year(Now)))
For i = 0 To cbo_year.ListCount - 1
If Val(cbo_year.List(i)) = tmp_year Then
cbo_year.ListIndex = i
Exit For
End If
Next
 
 
 For i = 1 To 12
 cbo_month.AddItem " " & Format$(Str(i), "00 月")
 Next
tmp_month = Val(CStr(Month(Now)))


cbo_month.ListIndex = tmp_month - 1

 For i = 1 To 31
 cbo_day.AddItem " " & Format$(Str(i), "00 日")
 Next
' Dim tmp
tmp_day = Val(CStr(Day(Now)))

cbo_day.ListIndex = tmp_day - 1
cbo_year.SetFocus


 
End Sub

