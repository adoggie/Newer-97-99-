VERSION 5.00
Object = "{48DC3C96-B20F-11D1-A87F-D9394DC38340}#2.6#0"; "FLATBTN2.OCX"
Object = "{00025600-0000-0000-C000-000000000046}#4.6#0"; "CRYSTL32.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Begin VB.Form form_print 
   Caption         =   "Form1"
   ClientHeight    =   3930
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7425
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   3930
   ScaleWidth      =   7425
   StartUpPosition =   1  '所有者中心
   Begin Crystal.CrystalReport cr 
      Left            =   5880
      Top             =   1680
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   262150
      Destination     =   1
      WindowControlBox=   -1  'True
      WindowMaxButton =   -1  'True
      WindowMinButton =   -1  'True
   End
   Begin TabDlg.SSTab SSTab1 
      Height          =   3735
      Left            =   150
      TabIndex        =   0
      Top             =   150
      Width           =   7125
      _ExtentX        =   12568
      _ExtentY        =   6588
      _Version        =   393216
      Tabs            =   2
      Tab             =   1
      TabsPerRow      =   2
      TabHeight       =   520
      ForeColor       =   16711680
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "楷体_GB2312"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      TabCaption(0)   =   "年合同打印"
      TabPicture(0)   =   "form_print.frx":0000
      Tab(0).ControlEnabled=   0   'False
      Tab(0).Control(0)=   "Timer1"
      Tab(0).Control(1)=   "cmd_print"
      Tab(0).Control(2)=   "Frame2"
      Tab(0).Control(3)=   "Frame1"
      Tab(0).ControlCount=   4
      TabCaption(1)   =   "条件打印"
      TabPicture(1)   =   "form_print.frx":001C
      Tab(1).ControlEnabled=   -1  'True
      Tab(1).Control(0)=   "Frame4"
      Tab(1).Control(0).Enabled=   0   'False
      Tab(1).Control(1)=   "cbo_tj1"
      Tab(1).Control(1).Enabled=   0   'False
      Tab(1).Control(2)=   "cbo_for"
      Tab(1).Control(2).Enabled=   0   'False
      Tab(1).Control(3)=   "cbo_tj2"
      Tab(1).Control(3).Enabled=   0   'False
      Tab(1).Control(4)=   "pt"
      Tab(1).Control(4).Enabled=   0   'False
      Tab(1).ControlCount=   5
      Begin VB.CommandButton pt 
         Caption         =   "Printing"
         Height          =   615
         Left            =   4620
         TabIndex        =   10
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
         Left            =   4530
         TabIndex        =   8
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
         Left            =   2910
         Style           =   2  'Dropdown List
         TabIndex        =   7
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
         Left            =   780
         Style           =   2  'Dropdown List
         TabIndex        =   6
         Top             =   1200
         Width           =   1755
      End
      Begin VB.Timer Timer1 
         Interval        =   100
         Left            =   -73800
         Top             =   3120
      End
      Begin DevPowerFlatBttn.FlatBttn cmd_print 
         Height          =   375
         Left            =   -69750
         TabIndex        =   5
         Top             =   2640
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
      Begin VB.Frame Frame2 
         Caption         =   "可供打印的合同年份"
         Height          =   2025
         Left            =   -74850
         TabIndex        =   3
         Top             =   450
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
            Height          =   1680
            Left            =   210
            Sorted          =   -1  'True
            Style           =   1  'Checkbox
            TabIndex        =   4
            Top             =   240
            Width           =   6375
         End
      End
      Begin VB.Frame Frame1 
         Height          =   555
         Left            =   -74820
         TabIndex        =   1
         Top             =   2550
         Width           =   4665
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
         Left            =   420
         TabIndex        =   9
         Top             =   780
         Width           =   6195
      End
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
   cbo_for.Clear
   cbo_for.AddItem " 等 于"
cbo_for.ListIndex = 0
cbo_tj2.Clear
If JglxRs.RecordCount = 0 Then
Exit Sub
End If
JglxRs.MoveFirst
While Not JglxRs.EOF
cbo_tj2.AddItem JglxRs!Name
JglxRs.MoveNext
Wend
Case 1
cbo_for.Clear
 cbo_for.AddItem " 等 于"
cbo_for.ListIndex = 0
cbo_tj2.Clear
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

Private Sub cmd_print_Click()
cr.PrintFileName = App.Path & "\system_.mdb"
cr.ReportFileName = App.Path & "\zbin2.rpt"
Dim i
For i = 0 To list_year.ListCount - 1
If list_year.Selected(i) = True Then
cr.SelectionFormula = "{run.year}='" & left(list_year.List(i), 4) & "year" & "'"
cr.PrintReport
End If
Next


End Sub

Private Sub cmd_print_MouseMove(ByVal Button As Integer, ByVal Shift As Integer, ByVal X As Single, ByVal Y As Single)
Timer1.Enabled = False
cmd_print.TextColor = RGB(255, 0, 0)
End Sub

Private Sub Form_Load()
'DisableCloseButton (Me.hwnd)
Set ZrrRs = systemdb_.OpenRecordset("zrr", dbOpenDynaset)
Set JglxRs = systemdb_.OpenRecordset("jglx", dbOpenDynaset)


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
PrintRs.FindFirst "year='" & Trim(YearRs!year) & "'"
If PrintRs.NoMatch Then
GoTo next_
End If
list_year.AddItem Trim(left(PrintRs!year, 4) & " 年工程合同")
next_:
YearRs.MoveNext
Wend

End Sub


Private Sub pt_Click()
If Len(Trim(cbo_tj1.Text)) = 0 Or Len(Trim(cbo_tj2.Text)) = 0 Then
MsgBox "Error! Please Select Object!!!!"
Exit Sub
End If
Select Case Trim(cbo_tj1.Text)
Case "结构类型"
cr.SelectionFormula = "{run.jglx}='" & Trim(cbo_tj2.Text) & "'"
Case "责任人"
cr.SelectionFormula = "{run.zrr}='" & Trim(cbo_tj2.Text) & "'"
End Select
cr.PrintFileName = App.Path & "\system_.mdb"
cr.ReportFileName = App.Path & "\zbin3.rpt"
cr.PrintReport

End Sub

Private Sub SSTab1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Timer1.Enabled = True
End Sub

Private Sub Timer1_Timer()
cmd_print.TextColor = RGB(0, 0, 0)
ck_all.ForeColor = RGB(0, 0, 0)

End Sub
