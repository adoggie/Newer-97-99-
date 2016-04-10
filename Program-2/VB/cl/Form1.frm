VERSION 5.00
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Begin VB.Form Form1 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Form1"
   ClientHeight    =   5400
   ClientLeft      =   45
   ClientTop       =   270
   ClientWidth     =   9165
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   Moveable        =   0   'False
   ScaleHeight     =   5400
   ScaleWidth      =   9165
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   6930
      Top             =   4380
   End
   Begin cl.UserControl1 UserControl11 
      Height          =   315
      Left            =   480
      TabIndex        =   37
      Top             =   3840
      Width           =   1395
      _extentx        =   2461
      _extenty        =   556
   End
   Begin VB.CommandButton cmd_exit 
      Caption         =   "Exit"
      Height          =   400
      Left            =   5592
      TabIndex        =   35
      Top             =   3816
      Width           =   1000
   End
   Begin VB.CommandButton cmd_del 
      Caption         =   "CurDel"
      Enabled         =   0   'False
      Height          =   400
      Left            =   4512
      TabIndex        =   5
      Top             =   3792
      Width           =   1000
   End
   Begin VB.CommandButton cmd_addnew 
      Caption         =   "AddNew"
      Enabled         =   0   'False
      Height          =   400
      Left            =   3384
      TabIndex        =   6
      Top             =   3792
      Width           =   1000
   End
   Begin VB.ComboBox cbo_gcxm 
      Height          =   300
      Left            =   3744
      Style           =   2  'Dropdown List
      TabIndex        =   8
      Top             =   504
      Width           =   3390
   End
   Begin VB.ComboBox cbo_jz 
      Enabled         =   0   'False
      Height          =   276
      HelpContextID   =   11
      Left            =   3204
      Style           =   2  'Dropdown List
      TabIndex        =   20
      Top             =   3100
      Width           =   1200
   End
   Begin VB.ComboBox cbo_js 
      Enabled         =   0   'False
      Height          =   276
      HelpContextID   =   13
      Left            =   7284
      Style           =   2  'Dropdown List
      TabIndex        =   22
      Top             =   3100
      Width           =   1200
   End
   Begin VB.ComboBox cbo_ys 
      Enabled         =   0   'False
      Height          =   276
      HelpContextID   =   12
      Left            =   5088
      Style           =   2  'Dropdown List
      TabIndex        =   21
      Top             =   3100
      Width           =   1200
   End
   Begin VB.TextBox txt_dj 
      Enabled         =   0   'False
      Height          =   324
      HelpContextID   =   6
      Left            =   4944
      TabIndex        =   15
      Text            =   "dj"
      Top             =   1884
      Width           =   1200
   End
   Begin VB.TextBox txt_yzf 
      Enabled         =   0   'False
      Height          =   324
      HelpContextID   =   7
      Left            =   6150
      TabIndex        =   16
      Text            =   "yzf"
      Top             =   1884
      Width           =   1200
   End
   Begin VB.TextBox txt_je 
      Enabled         =   0   'False
      Height          =   324
      HelpContextID   =   8
      Left            =   7344
      TabIndex        =   17
      Text            =   "je"
      Top             =   1884
      Width           =   1200
   End
   Begin VB.TextBox txt_jsrq 
      Enabled         =   0   'False
      Height          =   324
      HelpContextID   =   10
      Left            =   3744
      Locked          =   -1  'True
      TabIndex        =   19
      Text            =   "jsrq"
      Top             =   2604
      Width           =   1200
   End
   Begin VB.TextBox txt_jhrq 
      Enabled         =   0   'False
      Height          =   324
      HelpContextID   =   9
      Left            =   2520
      Locked          =   -1  'True
      TabIndex        =   18
      Text            =   "jhrq"
      Top             =   2604
      Width           =   1200
   End
   Begin VB.TextBox txt_sssl 
      Enabled         =   0   'False
      Height          =   324
      HelpContextID   =   5
      Left            =   3744
      TabIndex        =   14
      Text            =   "sssl"
      Top             =   1884
      Width           =   1200
   End
   Begin VB.TextBox txt_dgsl 
      Enabled         =   0   'False
      Height          =   324
      HelpContextID   =   4
      Left            =   2520
      TabIndex        =   13
      Text            =   "djsl"
      Top             =   1884
      Width           =   1200
   End
   Begin VB.TextBox txt_dw 
      Enabled         =   0   'False
      Height          =   276
      HelpContextID   =   3
      Left            =   7404
      TabIndex        =   12
      Text            =   "dw"
      Top             =   1200
      Width           =   1116
   End
   Begin VB.TextBox txt_ljmc 
      Enabled         =   0   'False
      Height          =   300
      HelpContextID   =   2
      Left            =   3756
      TabIndex        =   11
      Text            =   "ljmc"
      Top             =   1200
      Width           =   2370
   End
   Begin VB.ListBox lst_ljmc 
      BackColor       =   &H00C0C0C0&
      Enabled         =   0   'False
      Height          =   3120
      Left            =   240
      TabIndex        =   4
      Top             =   696
      Width           =   2064
   End
   Begin VB.ComboBox cbo_ljlb 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9.75
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   3720
      Style           =   2  'Dropdown List
      TabIndex        =   9
      Top             =   840
      Width           =   1820
   End
   Begin VB.ComboBox cbo_csdw 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9.75
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      HelpContextID   =   1
      Left            =   6408
      Style           =   2  'Dropdown List
      TabIndex        =   10
      Top             =   840
      Width           =   2085
   End
   Begin VB.CommandButton cmd_newprj 
      Caption         =   "Newprj"
      Height          =   324
      Left            =   7224
      TabIndex        =   7
      Top             =   480
      Width           =   996
   End
   Begin TabDlg.SSTab SSTab1 
      Height          =   3750
      Left            =   90
      TabIndex        =   36
      Top             =   525
      Width           =   2385
      _ExtentX        =   4207
      _ExtentY        =   6615
      _Version        =   327681
      Tabs            =   1
      TabsPerRow      =   1
      TabHeight       =   2
      TabMaxWidth     =   4145
      TabCaption(0)   =   "现有&料具"
      TabPicture(0)   =   "Form1.frx":0000
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).ControlCount=   0
   End
   Begin VB.Label Label8 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "记帐"
      Height          =   300
      Left            =   2508
      TabIndex        =   34
      Top             =   3100
      Width           =   600
   End
   Begin VB.Label Label9 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "验收"
      Height          =   300
      Left            =   4524
      TabIndex        =   33
      Top             =   3100
      Width           =   540
   End
   Begin VB.Label Label10 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "经手"
      Height          =   300
      Left            =   6384
      TabIndex        =   32
      Top             =   3100
      Width           =   660
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "料 具 名 称"
      Height          =   300
      Left            =   2520
      TabIndex        =   2
      Top             =   1200
      Width           =   1200
   End
   Begin VB.Label lb_ljmc 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "料 具 名 称"
      Height          =   270
      Left            =   120
      TabIndex        =   31
      Top             =   180
      Width           =   1230
   End
   Begin VB.Label lb_dw 
      Alignment       =   2  'Center
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "单 位"
      Height          =   300
      Left            =   6168
      TabIndex        =   3
      Top             =   1200
      Width           =   1200
   End
   Begin VB.Label lb_dgsl 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "订购数量"
      Height          =   300
      Left            =   2520
      TabIndex        =   30
      Top             =   1536
      Width           =   1200
   End
   Begin VB.Label lb_sssl 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "实收数量"
      Height          =   300
      Left            =   3720
      TabIndex        =   29
      Top             =   1536
      Width           =   1200
   End
   Begin VB.Label lb_dj 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "单价"
      Height          =   300
      Left            =   4944
      TabIndex        =   28
      Top             =   1536
      Width           =   1200
   End
   Begin VB.Label lb_yzf 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "运杂费"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   11.25
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   6144
      TabIndex        =   27
      Top             =   1536
      Width           =   1200
   End
   Begin VB.Label lb_je 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "金额"
      Height          =   300
      Left            =   7344
      TabIndex        =   26
      Top             =   1536
      Width           =   1200
   End
   Begin VB.Label lb_ljlb 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "料具类别"
      Height          =   312
      Left            =   2520
      TabIndex        =   1
      Top             =   840
      Width           =   1200
   End
   Begin VB.Label lb_gcxm 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "工程项目"
      Height          =   300
      Left            =   2508
      TabIndex        =   25
      Top             =   504
      Width           =   1200
   End
   Begin VB.Label Label1 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "交货日期"
      Height          =   300
      Left            =   2520
      TabIndex        =   24
      Top             =   2280
      Width           =   1200
   End
   Begin VB.Label Label5 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "承售单位"
      Height          =   312
      Left            =   5544
      TabIndex        =   0
      Top             =   840
      Width           =   876
   End
   Begin VB.Label Label3 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "结算日期"
      Height          =   300
      Left            =   3744
      TabIndex        =   23
      Top             =   2280
      Width           =   1200
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public Adding As Boolean
Public MsgError As String
Public gcxm_name As String
Public action As Boolean
Private Sub EnableControl(bool As Boolean)
lst_ljmc.Enabled = bool
cbo_ljlb.Enabled = bool
cbo_csdw.Enabled = bool
txt_ljmc.Enabled = bool
txt_dgsl.Enabled = bool
txt_sssl.Enabled = bool
txt_dw.Enabled = True
txt_dj.Enabled = bool
txt_yzf.Enabled = bool
txt_je.Enabled = bool
txt_jhrq.Enabled = bool
txt_jsrq.Enabled = bool
cbo_jz.Enabled = bool
cbo_ys.Enabled = bool
cbo_js.Enabled = bool
'cmd_save.Enabled = True

End Sub
Private Sub SetComboBoxNull()
cbo_ljlb.ListIndex = -1
cbo_csdw.ListIndex = -1
cbo_jz.ListIndex = -1
cbo_ys.ListIndex = -1
cbo_js.ListIndex = -1

End Sub
Private Sub cbo_gcxm_Click()
If Len(Trim(cbo_gcxm.TEXT)) = 0 Then
Exit Sub             'If not Selected ,Reset  ,Exit it
End If
'****************************
EnableControl (True)     'Set Controls Property :  Enable
'*****************************


cmd_addnew.Enabled = True
Dim i
If Adding Then
            If Len(Trim(txt_ljmc.TEXT)) <> 0 Then
                        If Not UpdateRecord Then        '恢复原先选择的工程项目名
                        For i = 0 To cbo_gcxm.ListCount - 1
                            If cbo_gcxm.List(i) = gcxm_name Then
                         cbo_gcxm.ListIndex = i
                        Exit For
                            End If
                         Next
                        
                        Exit Sub
                        End If
            End If

   
    End If
   
    Timer1.Enabled = False
RunRS.Close: Set RunRS = Nothing
Set RunRS = RunDB.OpenRecordset(Trim(cbo_gcxm.TEXT), dbOpenDynaset)
Timer1.Enabled = True
gcxm_name = Trim(cbo_gcxm.TEXT)

lst_ljmc.Clear
If RunRS.RecordCount = 0 Then
RunRS.AddNew
Adding = True
cmd_del.Enabled = False
Call SetComboBoxNull       '清组合框内的内容
    Call SetNull                            'If recordNumber=0 so ,don't list the 料具名称
Exit Sub
End If

While Not RunRS.EOF
lst_ljmc.AddItem RunRS!ljmc
RunRS.MoveNext
Wend                          'Append Recorder to ListBox
RunRS.MoveFirst
Call ShowCurRecord
action = False
lst_ljmc.ListIndex = 0
action = True
RunRS.Edit
cmd_del.Enabled = True
End Sub
Private Sub ShowCurRecord()   'Useage :  显示当前记录
'******************************
txt_ljmc.TEXT = RunRS!ljmc
txt_dw.TEXT = RunRS!dw
txt_dgsl.TEXT = Format(RunRS!dgsl, "0.000")
txt_sssl.TEXT = Format(RunRS!sssl, "0.000")
txt_dj.TEXT = Format(RunRS!dj, "0.00")
txt_yzf.TEXT = Format(RunRS!yzf, "0.00")
txt_je.TEXT = Format(RunRS!je, "0.00")
txt_jhrq.TEXT = Format(RunRS!jhrq, "mm-dd-yyyy")
txt_jsrq.TEXT = Format(RunRS!jsrq, "mm-dd-yyyy")
'*************************************
Dim i As Integer
Dim tmp As Integer
For i = 0 To cbo_ljlb.ListCount - 1
If Trim(cbo_ljlb.List(i)) = Trim(RunRS!ljlb) Then
tmp = i
Exit For
End If
Next
cbo_ljlb.ListIndex = i

For i = 0 To cbo_csdw.ListCount - 1
If Trim(cbo_csdw.List(i)) = Trim(RunRS!csdw) Then
tmp = i
Exit For
End If

Next i


cbo_csdw.ListIndex = i

For i = 0 To cbo_jz.ListCount - 1
If Trim(cbo_jz.List(i)) = Trim(RunRS!jz) Then
tmp = i
Exit For
End If
Next
cbo_jz.ListIndex = i

For i = 0 To cbo_ys.ListCount - 1
If Trim(cbo_ys.List(i)) = Trim(RunRS!ys) Then
tmp = i
Exit For
End If
Next
cbo_ys.ListIndex = i

For i = 0 To cbo_js.ListCount - 1
If Trim(cbo_js.List(i)) = Trim(RunRS!js) Then
tmp = i
Exit For
End If
Next
cbo_js.ListIndex = i

End Sub

Private Sub SetNull()


txt_ljmc.TEXT = "                                     "
txt_dw.TEXT = "                                        "
txt_dgsl.TEXT = "0.00"
txt_sssl.TEXT = " 0.00"
txt_dj.TEXT = " 0.00"
txt_yzf.TEXT = " 0.00"
txt_je.TEXT = "0.00"
txt_jhrq.TEXT = Format(Date, "mm/dd/yyyy")
txt_jsrq.TEXT = Format(Date, "mm/dd/yyyy")
'If nessary then Clear the combo box content

Rem cbo_ljlb.ListIndex = -1
'cbo_csdw.ListIndex = -1
'cbo_jz.ListIndex = -1
'cbo_ys.ListIndex = -1
'cbo_js.ListIndex = -1


End Sub
Private Function CheckChar(item As TextBox) As Boolean
Dim s As String
Dim i, j, counter
counter = 0
Dim buf, slen, char1, char2
buf = "0123456789."
s = Trim(item.TEXT)
slen = Len(s) ' As counter
For i = 1 To slen
char1 = Mid(s, i, 1)
    For j = 1 To 11
    char2 = Mid(buf, j, 1)
    If char1 = char2 Then
   counter = counter + 1
    Exit For
    End If
    Next
Next
If slen = counter Then
CheckChar = True
Else
CheckChar = False
MsgError = "Invalidate number in textbox.."
item.SelStart = 0
item.SelLength = Len(item.TEXT)
item.SetFocus
End If
End Function
Private Function CheckTextbox(item As TextBox) As Boolean

If Len(Trim(item.TEXT)) = 0 Then
CheckTextbox = False
MsgError = "the Textbox  cannot NULL"
item.SelStart = 0
item.SelLength = Len(item.TEXT)
item.SetFocus
Exit Function
End If
CheckTextbox = True

End Function

Private Function CheckComboBox(item As ComboBox) As Boolean
If Len(Trim(item.TEXT)) = 0 Then
CheckComboBox = False
item.SetFocus
MsgError = MsgError & "combox can not space"
Exit Function
End If
CheckComboBox = True
End Function

Private Function IsInputOK() As Boolean   'if NULL
If Not CheckTextbox(txt_ljmc) Or _
Not CheckTextbox(txt_dw) Or _
Not CheckTextbox(txt_dgsl) Or _
Not CheckTextbox(txt_sssl) Or _
Not CheckTextbox(txt_dj) Or _
Not CheckTextbox(txt_yzf) Or _
Not CheckTextbox(txt_je) Or _
Not CheckComboBox(cbo_js) Or _
Not CheckComboBox(cbo_ys) Or _
Not CheckComboBox(cbo_jz) Or _
Not CheckComboBox(cbo_ljlb) Or _
Not CheckComboBox(cbo_csdw) Then

IsInputOK = False
Exit Function
End If
IsInputOK = True

End Function




Private Sub cmd_addnew_Click()  'Append Records

MsgError = ""
If Not UpdateRecord Then
Exit Sub
End If
  
  ''如果输入的内容合法，Append it
 ' MsgBox "tessst"
  If Adding Then
lst_ljmc.AddItem Trim(txt_ljmc.TEXT)
End If
RunRS.AddNew
Call SetNull
Adding = True
'Call SetNull
action = False
lst_ljmc.ListIndex = -1
action = True
cmd_del.Enabled = False
End Sub

Private Sub cmd_del_Click()
Dim name
Dim i
Dim tmp_listindex

If Not Adding Then
tmp_listindex = lst_ljmc.ListIndex
lst_ljmc.RemoveItem lst_ljmc.ListIndex
action = False
lst_ljmc.ListIndex = -1
action = True
RunRS.Delete
RunRS.MoveNext
If RunRS.EOF Then
RunRS.MoveLast
End If
If RunRS.RecordCount = 0 Then
cmd_del.Enabled = False
Adding = True
RunRS.AddNew
Else
Call ShowCurRecord
Adding = False
End If

Else
Call SetNull
Call SetComboBoxNull
'Call comboboxnull
Adding = True
End If





End Sub
Private Sub AddNew()  '**********************

End Sub

Private Function UpdateRecord() As Boolean
If Not IsInputOK Then
MsgBox MsgError
UpdateRecord = False
Exit Function
End If

RunRS!ljmc = Trim(txt_ljmc)
RunRS!dw = Trim(txt_dw)
If Not CheckChar(txt_dgsl) Or _
Not CheckChar(txt_sssl) Or _
Not CheckChar(txt_dj) Or _
Not CheckChar(txt_yzf) Or _
Not CheckChar(txt_je) Then
MsgBox MsgError
UpdateRecord = False
Exit Function
End If


RunRS!dgsl = CSng(Trim(txt_dgsl))
RunRS!sssl = CSng(Trim(txt_sssl))
RunRS!dj = CCur(Trim(txt_dj))
RunRS!yzf = CCur(Trim(txt_yzf))
RunRS!je = CCur(Trim(txt_je))
RunRS!jhrq = CDate(Trim(txt_jhrq))
RunRS!jsrq = CDate(Trim(txt_jsrq))
RunRS!ljlb = Trim(cbo_ljlb.TEXT)
RunRS!csdw = Trim(cbo_csdw.TEXT)
RunRS!jz = Trim(cbo_jz.TEXT)
RunRS!ys = Trim(cbo_ys.TEXT)
RunRS!js = Trim(cbo_js.TEXT)
Dim today
today = Now
RunRS!scrq = Date
RunRS!scsj = time
RunRS.Update
UpdateRecord = True
End Function

Private Sub cmd_exit_Click()
Static flag As Integer
Dim i
If Adding Then
        If Len(Trim(txt_ljmc.TEXT)) <> 0 Then
            i = MsgBox("保存此记录吗?", vbYesNo)
                    If i = vbYes Then
                             If Not UpdateRecord Then
                                Exit Sub
                                End If
                    End If
        End If
GoTo end_:
Else
                    If Not UpdateRecord Then
                        Exit Sub
                     End If
 End If
 
end_:
RunRS.Close
RunDB.Close
Timer1.Enabled = False

Unload Me
End Sub



Private Sub Form_Load()
action = False
DisableCloseButton (Me.hwnd)
Adding = False
'Call SetNull  'Set Control's Contend is NULL
Call SetSpace

Me.width = 9500: Me.height = 5000
Call init



End Sub
Private Sub SetSpace()
txt_ljmc.TEXT = "                                     "
txt_dw.TEXT = "                                        "
txt_dgsl.TEXT = "                                   "
txt_sssl.TEXT = "                                 "
txt_dj.TEXT = "                          "
txt_yzf.TEXT = "                         "
txt_je.TEXT = "                             "
txt_jhrq.TEXT = "                                  "
txt_jsrq.TEXT = "                                  "
'If nessary then Clear the combo box content

 cbo_ljlb.ListIndex = -1
cbo_csdw.ListIndex = -1
cbo_jz.ListIndex = -1
cbo_ys.ListIndex = -1
cbo_js.ListIndex = -1
End Sub
Private Sub init()
Set RunRS = Nothing
Set RunRS = RunDB.OpenRecordset("gcmc", dbOpenDynaset)
While Not RunRS.EOF
Me.cbo_gcxm.AddItem RunRS!name
RunRS.MoveNext
Wend  '*******调入当前所有的工程项目名称
If RunRS.RecordCount <> 0 Then
RunRS.MoveFirst
End If

While Not Systemljlb.EOF
cbo_ljlb.AddItem Systemljlb!name
Systemljlb.MoveNext
Wend
If Systemljlb.RecordCount <> 0 Then
Systemljlb.MoveFirst
End If
                 'Load All 料具类别，
While Not Systemcsdw.EOF
cbo_csdw.AddItem Systemcsdw!company
Systemcsdw.MoveNext
Wend
            'Load All  承售单位

If Systemcsdw.RecordCount <> 0 Then
Systemcsdw.MoveFirst
End If


While Not SystemMen.EOF   'Load All 操作人员
If Len(Trim(SystemMen!jz)) <> 0 Then
cbo_jz.AddItem SystemMen!jz
End If
If Len(Trim(SystemMen!ys)) <> 0 Then

cbo_ys.AddItem SystemMen!ys
End If
If Len(Trim(SystemMen!js)) <> 0 Then
cbo_js.AddItem SystemMen!js
End If
SystemMen.MoveNext
Wend
If SystemMen.RecordCount <> 0 Then
SystemMen.MoveFirst
End If

End Sub




Private Sub lst_ljmc_Click()
Dim name
If Not action Then
Exit Sub
End If
If Adding Then
If Len(Trim(txt_ljmc.TEXT)) = 0 Then

GoTo second
Else
lst_ljmc.AddItem Trim(txt_ljmc.TEXT)
End If
End If
If Not UpdateRecord Then
Adding = True
Exit Sub
End If

second:
Adding = False
name = Trim(lst_ljmc.List(lst_ljmc.ListIndex))
RunRS.FindFirst "ljmc='" & name & "'"
Call ShowCurRecord
RunRS.Edit

End Sub

Private Sub Timer1_Timer()
If RunRS.RecordCount = 0 Then
cmd_del.Enabled = False
Else
cmd_del.Enabled = True
End If

End Sub

Private Sub txt_dgsl_GotFocus()
txt_dgsl.SelStart = 0
txt_dgsl.SelLength = Len(txt_dgsl.TEXT)
End Sub



Private Sub txt_dgsl_LostFocus()
txt_dgsl.TEXT = Format(txt_dgsl.TEXT, "0.00")

End Sub

Private Sub txt_dj_GotFocus()
txt_dj.SelStart = 0
txt_dj.SelLength = Len(txt_dj.TEXT)
End Sub

Private Sub txt_dj_LostFocus()
txt_dj.TEXT = Format(txt_dj.TEXT, "0.00")

End Sub

Private Sub txt_dw_GotFocus()
txt_dw.SelStart = 0
txt_dw.SelLength = Len(txt_dw.TEXT)
End Sub

Private Sub txt_je_GotFocus()
txt_je.SelStart = 0
txt_je.SelLength = Len(txt_je.TEXT)

End Sub

Private Sub txt_je_LostFocus()
txt_je.TEXT = Format(txt_je.TEXT, "0.00")

End Sub

Private Sub SetTime(item As TextBox, b As Integer, X As Single, Y As Single)
If b = 2 Then
Me.Enabled = False
Load formtime
formtime.left = item.left + X
formtime.top = item.top + Y
formtime.Show 0, MDIForm1

End If

End Sub
Private Sub txt_jsrq_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
MsgBox X & " : " & Y

SetTime txt_jsrq, Button, X, Y

End Sub
Private Sub txt_jhrq_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
SetTime txt_jhrq, Button, X, Y
End Sub

Private Sub txt_ljmc_GotFocus()
 txt_ljmc.SelStart = 0
txt_ljmc.SelLength = Len(txt_ljmc.TEXT)

 End Sub

Private Sub txt_sssl_GotFocus()
 txt_sssl.SelStart = 0
txt_sssl.SelLength = Len(txt_sssl.TEXT)

End Sub

Private Sub txt_sssl_LostFocus()
txt_sssl.TEXT = Format(txt_sssl.TEXT, "0.00")

End Sub

Private Sub txt_yzf_GotFocus()
txt_yzf.SelStart = 0
txt_yzf.SelLength = Len(txt_yzf.TEXT)
End Sub

Private Sub txt_yzf_LostFocus()
txt_yzf.TEXT = Format(txt_yzf.TEXT, "0.00")

End Sub

Private Sub UpDown1_Change()

End Sub
