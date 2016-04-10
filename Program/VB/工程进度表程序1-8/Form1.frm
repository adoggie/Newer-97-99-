VERSION 5.00
Begin VB.Form Form1 
   BackColor       =   &H00C0C0C0&
   Caption         =   "Form1"
   ClientHeight    =   6072
   ClientLeft      =   48
   ClientTop       =   336
   ClientWidth     =   7728
   LinkTopic       =   "Form1"
   ScaleHeight     =   6072
   ScaleWidth      =   7728
   StartUpPosition =   3  '窗口缺省
   Begin VB.CommandButton Command2 
      Caption         =   "show"
      Height          =   525
      Left            =   3360
      TabIndex        =   25
      Top             =   4350
      Width           =   1245
   End
   Begin VB.ListBox lst_gcxm 
      Height          =   1848
      Left            =   300
      TabIndex        =   24
      Top             =   3660
      Width           =   2025
   End
   Begin VB.CommandButton Command4 
      Caption         =   "saveproject"
      Height          =   435
      Left            =   3240
      TabIndex        =   23
      Top             =   2160
      Width           =   1155
   End
   Begin VB.Frame Frame3 
      Caption         =   "打印从属的字段："
      Height          =   885
      Left            =   4500
      TabIndex        =   20
      Top             =   960
      Width           =   2175
      Begin VB.CheckBox chk_gq 
         Caption         =   "工期"
         Height          =   255
         Left            =   240
         TabIndex        =   22
         Top             =   240
         Value           =   1  'Checked
         Width           =   1215
      End
      Begin VB.CheckBox chk_bz 
         Caption         =   "备注"
         Height          =   285
         Left            =   240
         TabIndex        =   21
         Top             =   540
         Value           =   1  'Checked
         Width           =   1185
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "标识天数"
      Height          =   825
      Left            =   4500
      TabIndex        =   17
      Top             =   90
      Width           =   2145
      Begin VB.OptionButton opt_5 
         Caption         =   "5  天"
         Height          =   195
         Left            =   390
         TabIndex        =   19
         Top             =   270
         Value           =   -1  'True
         Width           =   1185
      End
      Begin VB.OptionButton opt_10 
         Caption         =   "10 天"
         Height          =   225
         Left            =   390
         TabIndex        =   18
         Top             =   570
         Width           =   1215
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "打印风格"
      Height          =   1275
      Left            =   4500
      TabIndex        =   14
      Top             =   1890
      Width           =   2175
      Begin VB.OptionButton opt_style1 
         Caption         =   "扩展型（包括空记录，共 40 行）"
         Height          =   435
         Left            =   150
         TabIndex        =   16
         Top             =   240
         Value           =   -1  'True
         Width           =   1755
      End
      Begin VB.OptionButton opt_style2 
         Caption         =   "紧凑型（有多少则打印多少）"
         Height          =   525
         Left            =   180
         TabIndex        =   15
         Top             =   660
         Width           =   1875
      End
   End
   Begin VB.CommandButton Command1 
      Caption         =   "打印.."
      Height          =   540
      Left            =   480
      TabIndex        =   13
      Top             =   2670
      Width           =   1035
   End
   Begin VB.CommandButton printing 
      Caption         =   "打印预览.."
      Height          =   555
      Left            =   1830
      TabIndex        =   12
      Top             =   2670
      Width           =   1245
   End
   Begin VB.TextBox txt_caption 
      Height          =   264
      Left            =   240
      TabIndex        =   11
      Text            =   "虹桥花园工程进度表"
      Top             =   2280
      Width           =   2652
   End
   Begin VB.TextBox txt_date 
      Height          =   264
      Left            =   1200
      TabIndex        =   9
      Text            =   "1999-12-1"
      Top             =   1680
      Width           =   1755
   End
   Begin VB.TextBox txt_company 
      Height          =   264
      Left            =   1230
      TabIndex        =   7
      Text            =   "上海园林工程有限公司"
      Top             =   1350
      Width           =   1995
   End
   Begin VB.TextBox txt_zgq 
      Height          =   264
      Left            =   1410
      TabIndex        =   3
      Text            =   "100"
      Top             =   384
      Width           =   795
   End
   Begin VB.ComboBox cbo_papertype 
      Enabled         =   0   'False
      Height          =   300
      Left            =   1410
      Style           =   2  'Dropdown List
      TabIndex        =   0
      Top             =   48
      Width           =   2220
   End
   Begin VB.TextBox txt_unit 
      Height          =   276
      Left            =   2370
      TabIndex        =   5
      Text            =   "1"
      Top             =   696
      Width           =   900
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "选择打印的进度表"
      Height          =   180
      Left            =   150
      TabIndex        =   26
      Top             =   3450
      Width           =   1440
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      Caption         =   "进度表标题："
      Height          =   180
      Index           =   1
      Left            =   225
      TabIndex        =   10
      Top             =   2040
      Width           =   1095
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      Caption         =   "编制日期："
      Height          =   180
      Index           =   0
      Left            =   255
      TabIndex        =   8
      Top             =   1710
      Width           =   930
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      Caption         =   "编制单位："
      Height          =   180
      Left            =   255
      TabIndex        =   6
      Top             =   1380
      Width           =   930
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      Caption         =   "每进度单元格的施工天数"
      Height          =   180
      Left            =   255
      TabIndex        =   4
      Top             =   750
      Width           =   2010
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      Caption         =   "总工期（天）"
      Height          =   180
      Left            =   255
      TabIndex        =   2
      Top             =   435
      Width           =   1095
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      Caption         =   "纸张大小"
      Height          =   180
      Left            =   255
      TabIndex        =   1
      Top             =   120
      Width           =   735
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
'Form2.Show
PrintModeNow = printing_
Set go = Printer

If lst_gcxm.ListIndex = -1 Then
MsgBox "选择一工程进度表 "
Exit Sub
End If
Dim name As String
name = Trim(lst_gcxm.List(lst_gcxm.ListIndex))
Set Rs = Nothing

Set Rs = Db.OpenRecordset(name, dbOpenDynaset)
Records = 0
While Not Rs.EOF


Records = Records + 1
Rs.MoveNext
Wend

Call Start


End Sub

Private Sub Command2_Click()
Dim count As Integer
lst_gcxm.Clear
 Db.TableDefs.Refresh
count = Db.TableDefs.count
Dim i As Integer, j As Integer
Dim tables(100) As String
For i = 0 To count - 1
If LCase(Trim(Db.TableDefs(i).name)) = "info" _
Or LCase(Trim(Db.TableDefs(i).name)) = "msysaces" _
Or LCase(Trim(Db.TableDefs(i).name)) Like "msysobjects" _
Or LCase(Trim(Db.TableDefs(i).name)) Like "msysqueries" _
Or LCase(Trim(Db.TableDefs(i).name)) Like "msysrelationships" _
Or LCase(Trim(Db.TableDefs(i).name)) Like "msysm*" Then


Else
lst_gcxm.AddItem Trim(Db.TableDefs(i).name)
End If
Next
End Sub

Private Sub Form_Load()
Set Db = DBEngine.Workspaces(0).OpenDatabase(App.Path & "\sys_.mdb")
Call Command2_Click

'Set Rs = Db.OpenRecordset("Table", dbOpenDynaset)

cbo_papertype.AddItem "A3 大小 自动进纸"
cbo_papertype.AddItem "A4 大小 自动进纸"
cbo_papertype.text = cbo_papertype.List(0)

End Sub

Private Sub VScroll3_Change()

End Sub

Private Sub VScroll3_Scroll()

End Sub

Private Sub printing_Click()
If lst_gcxm.ListIndex = -1 Then
MsgBox "选择一工程进度表 "
Exit Sub
End If

PrintModeNow = preprint_
Set go = Form2
Form2.Show
Form2.Cls

Dim name As String
name = Trim(lst_gcxm.List(lst_gcxm.ListIndex))
Set Rs = Nothing

Set Rs = Db.OpenRecordset(name, dbOpenDynaset)
Records = 0
While Not Rs.EOF


Records = Records + 1
Rs.MoveNext
Wend

Call Start

End Sub


