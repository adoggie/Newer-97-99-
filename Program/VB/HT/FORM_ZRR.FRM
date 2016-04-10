VERSION 5.00
Object = "{48DC3C96-B20F-11D1-A87F-D9394DC38340}#2.6#0"; "FLATBTN2.OCX"
Begin VB.Form form_zrr 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   3660
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5865
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   3660
   ScaleWidth      =   5865
   StartUpPosition =   1  '所有者中心
   Begin DevPowerFlatBttn.FlatBttn cmd_ok 
      Height          =   390
      Left            =   4110
      TabIndex        =   9
      Top             =   3090
      Width           =   1290
      _ExtentX        =   2275
      _ExtentY        =   688
      AlignCaption    =   4
      AutoSize        =   0   'False
      Caption         =   "  确 定   "
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "楷体_GB2312"
         Size            =   14.25
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      TextColor       =   -2147483630
      Object.ToolTipText     =   ""
      MousePointer    =   1
   End
   Begin VB.TextBox Text2 
      BeginProperty Font 
         Name            =   "楷体_GB2312"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   405
      Left            =   840
      TabIndex        =   8
      Top             =   3060
      Width           =   2805
   End
   Begin DevPowerFlatBttn.FlatBttn cmd_replace 
      Height          =   345
      Left            =   60
      TabIndex        =   7
      Top             =   2430
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   609
      AlignCaption    =   4
      AutoSize        =   0   'False
      Enabled         =   0   'False
      Caption         =   "替换的确"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "楷体_GB2312"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      TextColor       =   -2147483630
      Object.ToolTipText     =   ""
      MousePointer    =   1
   End
   Begin VB.Timer Timer1 
      Interval        =   100
      Left            =   90
      Top             =   1560
   End
   Begin VB.TextBox Text1 
      BeginProperty Font 
         Name            =   "楷体_GB2312"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   405
      Left            =   810
      TabIndex        =   5
      Top             =   2370
      Width           =   2805
   End
   Begin DevPowerFlatBttn.FlatBttn cmd_del 
      Height          =   375
      Left            =   4860
      TabIndex        =   4
      Top             =   2400
      Width           =   885
      _ExtentX        =   1561
      _ExtentY        =   661
      AlignCaption    =   4
      AutoSize        =   0   'False
      Caption         =   "删 除   "
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "楷体_GB2312"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      TextColor       =   -2147483630
      Object.ToolTipText     =   ""
      MousePointer    =   1
   End
   Begin DevPowerFlatBttn.FlatBttn cmd_add 
      Default         =   -1  'True
      Height          =   375
      Left            =   3720
      TabIndex        =   3
      Top             =   2400
      Width           =   975
      _ExtentX        =   1720
      _ExtentY        =   661
      AlignCaption    =   4
      AutoSize        =   0   'False
      Caption         =   "添  加  "
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "楷体_GB2312"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      TextColor       =   -2147483630
      Object.ToolTipText     =   ""
      MousePointer    =   1
   End
   Begin DevPowerFlatBttn.FlatBttn cmd_htlx 
      Height          =   375
      Left            =   2580
      TabIndex        =   1
      Top             =   150
      Width           =   1515
      _ExtentX        =   2672
      _ExtentY        =   661
      Style           =   1
      AlignCaption    =   4
      AutoSize        =   0   'False
      Caption         =   "合同类型    &h  "
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "楷体_GB2312"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      TextColor       =   -2147483630
      Object.ToolTipText     =   ""
      MousePointer    =   1
   End
   Begin VB.ListBox List 
      BackColor       =   &H00FFFFFF&
      Columns         =   2
      BeginProperty Font 
         Name            =   "楷体_GB2312"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   1500
      Left            =   210
      Sorted          =   -1  'True
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   570
      Width           =   5475
   End
   Begin DevPowerFlatBttn.FlatBttn cmd_zrr 
      Height          =   375
      Left            =   4170
      TabIndex        =   2
      Top             =   150
      Width           =   1545
      _ExtentX        =   2725
      _ExtentY        =   661
      Style           =   1
      AlignCaption    =   4
      AutoSize        =   0   'False
      Caption         =   " 工程负责人   kjf "
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "楷体_GB2312"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      TextColor       =   -2147483630
      Object.ToolTipText     =   ""
      MousePointer    =   1
   End
   Begin VB.Frame Frame1 
      Height          =   2355
      Left            =   30
      TabIndex        =   6
      Top             =   -60
      Width           =   5775
   End
   Begin VB.Line l2 
      Visible         =   0   'False
      X1              =   30
      X2              =   5820
      Y1              =   3630
      Y2              =   3630
   End
   Begin VB.Line l1 
      Visible         =   0   'False
      X1              =   60
      X2              =   5790
      Y1              =   2940
      Y2              =   2970
   End
End
Attribute VB_Name = "form_zrr"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim Action As Integer
Dim JglxRs As Recordset
Dim ZrrRs As Recordset



Private Sub cmd_add_Click()

If Len(Trim(Text1.Text)) = 0 Then
MsgBox "You Must Enter An ValidateData !"
Exit Sub
End If
List.AddItem Trim(Text1.Text)
Select Case Action
Case 1
JglxRs.AddNew
JglxRs!Name = Trim(Text1.Text)
JglxRs.Update
Case 2
ZrrRs.AddNew
ZrrRs!Name = Trim(Text1.Text)
ZrrRs.Update
End Select
Text1.Text = " "

End Sub

Private Sub cmd_add_MouseMove(ByVal Button As Integer, ByVal Shift As Integer, ByVal X As Single, ByVal Y As Single)
Timer1.Enabled = False
cmd_add.TextColor = RGB(255, 0, 0)

End Sub

Private Sub cmd_del_Click()
Text1.Text = ""
Select Case Action
Case 1
    JglxRs.FindFirst "name='" & Trim(List.List(List.ListIndex)) & "'"
    JglxRs.Delete
Case 2
    ZrrRs.FindFirst "name='" & Trim(List.List(List.ListIndex)) & "'"
    ZrrRs.Delete
End Select
Dim index_
index_ = List.ListIndex
List.RemoveItem List.ListIndex
List.ListIndex = index_ - 1

End Sub

Private Sub cmd_del_MouseMove(ByVal Button As Integer, ByVal Shift As Integer, ByVal X As Single, ByVal Y As Single)
Timer1.Enabled = False
cmd_del.TextColor = RGB(255, 0, 0)

End Sub

Private Sub cmd_htlx_Click()
cmd_htlx.TextColor = RGB(255, 0, 0)
cmd_zrr.TextColor = RGB(0, 0, 0)

cmd_add.Enabled = True
cmd_del.Enabled = False
Text1.Text = " "
Action = 1
cmd_zrr.Checked = False
List.Clear
If JglxRs.RecordCount <> 0 Then
JglxRs.MoveFirst
End If
While Not JglxRs.EOF
List.AddItem Trim(JglxRs!Name)
JglxRs.MoveNext
Wend

End Sub

Private Sub cmd_replace_Click()
cmd_del.Enabled = False
cmd_add.Enabled = False

End Sub

Private Sub cmd_zrr_Click()
cmd_zrr.TextColor = RGB(255, 0, 0)
cmd_htlx.TextColor = RGB(0, 0, 0)

cmd_add.Enabled = True

Text1.Text = " "
cmd_del.Enabled = False
Action = 2
cmd_htlx.Checked = False
List.Clear
If ZrrRs.RecordCount <> 0 Then
ZrrRs.MoveFirst
End If
While Not ZrrRs.EOF
List.AddItem Trim(ZrrRs!Name)
ZrrRs.MoveNext

Wend
End Sub

Private Sub Form_Load()
'cmd_htlx.Checked = True
SendKeys "%h"
Me.height = l1.Y1 + 300

Text1.SelStart = 0
Action = 0
cmd_add.Enabled = False
cmd_del.Enabled = False
Set JglxRs = systemdb_.OpenRecordset("jglx", dbOpenDynaset)
Set ZrrRs = systemdb_.OpenRecordset("zrr", dbOpenDynaset)

End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Timer1.Enabled = True
End Sub

Private Sub Form_Unload(Cancel As Integer)

JglxRs.Close
ZrrRs.Close
Dim tmp1, tmp2
tmp1 = form_edit.cbo_jglx.Text
tmp2 = form_edit.cbo_zrr.Text
Call form_edit.LoadJglx
Call form_edit.LoadZrr
 form_edit.cbo_jglx.Text = tmp1
form_edit.cbo_zrr.Text = tmp2
End Sub

Private Sub List_Click()
cmd_del.Enabled = True
Text1.Text = List.List(List.ListIndex)
cmd_replace.Enabled = True
End Sub

Private Sub Timer1_Timer()
cmd_add.TextColor = RGB(0, 0, 0)
cmd_del.TextColor = RGB(0, 0, 0)

End Sub
