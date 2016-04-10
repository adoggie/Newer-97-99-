VERSION 5.00
Object = "{48DC3C96-B20F-11D1-A87F-D9394DC38340}#2.6#0"; "FLATBTN2.OCX"
Begin VB.Form Form_selecttime 
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   Begin VB.PictureBox p1 
      BackColor       =   &H00FF0000&
      Height          =   435
      Left            =   0
      ScaleHeight     =   375
      ScaleWidth      =   4095
      TabIndex        =   0
      Top             =   0
      Width           =   4155
      Begin DevPowerFlatBttn.FlatBttn cmd_ok 
         Height          =   270
         Left            =   3480
         TabIndex        =   4
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
         TabIndex        =   3
         Top             =   30
         Width           =   975
      End
      Begin VB.ComboBox cbo_month 
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   1440
         Style           =   2  'Dropdown List
         TabIndex        =   2
         Top             =   30
         Width           =   915
      End
      Begin VB.ComboBox cbo_year 
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   30
         Style           =   2  'Dropdown List
         TabIndex        =   1
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



Private Sub cmd_ok_Click()
Dim time_
time_ = Str(Val(cbo_year.Text)) & Str(Val(cbo_month.Text)) _
& Str(Val(cbo_day.Text))
If SendToTextBox = 1 Then
form_edit.txt_htqx1.Text = Format$(time_, "yyyy年mm月dd日")
Else
form_edit.txt_htqx2.Text = Format$(time_, "yyyy年mm月dd日")
End If
Unload Me
form_edit.Enabled = True
form_tree.Enabled = True
form_list.Enabled = True

'******************************



End Sub

Private Sub Form_Load()
'****************************************
Me.Show
Me.width = p1.width + 5
Me.height = p1.height + 5
'***************************************
'Following Is  Init ComboBox
Dim i
Dim tmp_year, tmp_month, tmp_day
For i = 1980 To 2010
cbo_year.AddItem " " & Str(i) & " 年"

Next
tmp_year = Val(CStr(year(Now)))
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


 
End Sub
