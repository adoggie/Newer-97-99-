VERSION 5.00
Object = "{48DC3C96-B20F-11D1-A87F-D9394DC38340}#2.6#0"; "FLATBTN2.OCX"
Begin VB.Form form_print 
   Caption         =   "打印工程合同"
   ClientHeight    =   3525
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7425
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   3525
   ScaleWidth      =   7425
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton pt 
      Caption         =   "Printing"
      Height          =   615
      Left            =   -70380
      TabIndex        =   9
      Top             =   2640
      Width           =   1215
   End
   Begin VB.ComboBox cbo_tj2 
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   -70470
      TabIndex        =   7
      Top             =   1200
      Width           =   1635
   End
   Begin VB.ComboBox cbo_for 
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   -72090
      Style           =   2  'Dropdown List
      TabIndex        =   6
      Top             =   1200
      Width           =   1245
   End
   Begin VB.ComboBox cbo_tj1 
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   -74220
      Style           =   2  'Dropdown List
      TabIndex        =   5
      Top             =   1200
      Width           =   1755
   End
   Begin VB.Timer Timer1 
      Interval        =   100
      Left            =   1230
      Top             =   2820
   End
   Begin VB.Frame Frame2 
      Caption         =   "可供打印的合同年份"
      Height          =   1725
      Left            =   150
      TabIndex        =   3
      Top             =   360
      Width           =   6795
      Begin VB.ListBox list_year 
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
         Height          =   1410
         Left            =   210
         Sorted          =   -1  'True
         Style           =   1  'Checkbox
         TabIndex        =   4
         Top             =   210
         Width           =   6375
      End
   End
   Begin VB.Frame Frame1 
      Height          =   495
      Left            =   150
      TabIndex        =   1
      Top             =   2130
      Width           =   2415
      Begin VB.CheckBox ck_all 
         Caption         =   "打印全部合同"
         BeginProperty Font 
            Name            =   "楷体_GB2312"
            Size            =   12
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Left            =   390
         TabIndex        =   2
         Top             =   120
         Width           =   1785
      End
   End
   Begin VB.Frame Frame4 
      Height          =   1035
      Left            =   -74580
      TabIndex        =   8
      Top             =   780
      Width           =   6195
   End
   Begin DevPowerFlatBttn.FlatBttn cmd_print 
      Height          =   375
      Left            =   5490
      TabIndex        =   0
      Top             =   3060
      Width           =   1545
      _ExtentX        =   2725
      _ExtentY        =   661
      AlignCaption    =   4
      AutoSize        =   0   'False
      Caption         =   "开始打印ccv "
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
End
Attribute VB_Name = "form_print"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim YearRs As Recordset
Dim PrintRs As Recordset
Dim ZrrRs As Recordset
Dim JglxRs As Recordset

Private Sub cbo_tj1_Click()
If Len(Trim(cbo_tj1.Text)) = 0 Then
Exit Sub
End If
Select Case cbo_tj1.ItemData(cbo_tj1.ListIndex)
Case 0
   cbo_for.clear
   cbo_for.AddItem " 等 于"
cbo_for.ListIndex = 0
cbo_tj2.clear
If JglxRs.RecordCount = 0 Then
Exit Sub
End If
JglxRs.MoveFirst
While Not JglxRs.EOF
cbo_tj2.AddItem JglxRs!Name
JglxRs.MoveNext
Wend
Case 1
cbo_for.clear
 cbo_for.AddItem " 等 于"
cbo_for.ListIndex = 0
cbo_tj2.clear
If ZrrRs.RecordCount = 0 Then
Exit Sub
End If
ZrrRs.MoveFirst
While Not ZrrRs.EOF
cbo_tj2.AddItem ZrrRs!Name
ZrrRs.MoveNext
Wend
End Select


   
End Sub

Private Sub ck_all_Click()
Dim i
If ck_all.Value = 1 Then
For i = 0 To list_year.ListCount - 1
list_year.Selected(i) = True
Next
Else
For i = 0 To list_year.ListCount - 1
list_year.Selected(i) = False
Next
End If

End Sub

Private Sub ck_all_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Timer1.Enabled = False
ck_all.ForeColor = RGB(255, 0, 0)

End Sub

Private Sub cmd_print_MouseMove(ByVal Button As Integer, ByVal Shift As Integer, ByVal X As Single, ByVal Y As Single)
Timer1.Enabled = False
cmd_print.TextColor = RGB(255, 0, 0)
End Sub

Private Sub Form_Load()


cbo_tj1.AddItem "结构类型"
cbo_tj1.ItemData(cbo_tj1.NewIndex) = 0
cbo_tj1.AddItem "责任人"
cbo_tj1.ItemData(cbo_tj1.NewIndex) = 1

'cbo_tj1.AddItem "建筑面积"
'cbo_tj1.ItemData(cbo_tj1.NewIndex) = 2
'cbo_tj1.AddItem "合同造价"
'cbo_tj1.ItemData(cbo_tj1.NewIndex) = 3
'cbo_tj1.AddItem "结算造价"
'cbo_tj1.ItemData(cbo_tj1.NewIndex) = 4

'**********************************
'cbo_for.AddItem ">"
'cbo_for.AddItem ">="
'cbo_for.AddItem "="
'cbo_for.AddItem "<"
'cbo_for.AddItem "<="







'****************************************
Dim i
 While Not ZrrRs.EOF
cbo_tj2.AddItem Trim(ZrrRs!Name)
ZrrRs.MoveNext
Wend


Set YearRs = systemdb_.OpenRecordset("select * from ht_list  ", dbOpenDynaset)
Set PrintRs = systemdb_.OpenRecordset("run", dbOpenDynaset)
While Not YearRs.EOF
PrintRs.FindFirst "year='" & Trim(YearRs!Year) & "'"
If PrintRs.NoMatch Then
GoTo next_
End If
list_year.AddItem Trim(left(PrintRs!Year, 4) & " 年工程合同")
next_:
YearRs.MoveNext
Wend

End Sub


Private Sub SSTab1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Timer1.Enabled = True
End Sub

Private Sub Timer1_Timer()
cmd_print.TextColor = RGB(0, 0, 0)
ck_all.ForeColor = RGB(0, 0, 0)

End Sub
