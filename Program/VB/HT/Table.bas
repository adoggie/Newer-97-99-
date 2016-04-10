Attribute VB_Name = "Table"
Option Explicit
Dim PrintRecord As Integer  '打印记录数
Enum StepMode
Mode1 = 1
mode2 = 2
End Enum
Dim PrintMode As StepMode
Dim StepNumber As Integer
'*****************

Public PrintTableName As String
Public id As Integer   '作为打印页码的参数
Type Unit
T As Single
L As Single
B As Single
r As Single
W As Single
H As Single
Tag As Single
Text As String
fontsize As Integer
fontname As String
End Type

Type RectEx
T As Single
L As Single
B As Single
r As Single
W As Single
H As Single
RowHeight As Single
Cols As Integer
Rows As Integer
col() As Unit  '存放列数
Grid() As Unit
End Type

Public Table  As RectEx
Public TableTitle As Unit
Public TableBzdw As Unit '编制单位
Public TablePage As Unit '页码
Public TableDate As Unit '打印日期
Public TablePageCount As Unit  '共  页


Public SpTop As Single
Public SpLeft As Single
Public SpRight  As Single
Public SpBottom As Single

Public Pages As Integer




Public Sub PrintData()
If Printers.count = 0 Then
MsgBox " 没发现打印机，请安装..", , "打印警告！"
Exit Sub
End If
 

id = 0
Printer.ScaleMode = 1
Printer.Orientation = 2
Printer.PaperSize = 9

SpTop = 1600
SpLeft = 400
SpBottom = 1200
SpRight = 200
'******
 Table.L = SpLeft
 Table.T = SpTop
 Table.r = SpRight
 Table.B = SpBottom
 Table.W = Printer.ScaleWidth - SpLeft - SpRight
 Table.H = Printer.ScaleHeight - SpTop - SpBottom
 Table.RowHeight = 400
 Table.Cols = 8
 '排除 “序号”列
 Table.Rows = Table.H \ Table.RowHeight - 1
 ' 排除标题行
 Table.H = Table.RowHeight * (Table.Rows + 1)
 
 ReDim Table.col(0 To Table.Cols) ' 重新分配 +1 列
 Dim size As Integer
 size = 11
 With Table
 '比列 （百分比)
 .col(0).Tag = 4: .col(0).Text = "序号": .col(0).fontsize = size
 .col(1).Tag = 8: .col(1).Text = "工程编号": .col(1).fontsize = size
 .col(2).Tag = 25: .col(2).Text = "工程项目名称": .col(2).fontsize = size
 .col(3).Tag = 9: .col(3).Text = "建筑面积": .col(3).fontsize = size
 .col(4).Tag = 9: .col(4).Text = "合同造价": .col(4).fontsize = size
 .col(5).Tag = 9: .col(5).Text = "结算造价": .col(5).fontsize = size
 .col(6).Tag = 9: .col(6).Text = "结构类型": .col(6).fontsize = size
 .col(7).Tag = 9: .col(7).Text = "工程负责人": .col(7).fontsize = size
 .col(8).Tag = 18: .col(8).Text = "工程期限": .col(8).fontsize = size
 End With
 Dim i, j
  Dim width
width = 0
 Dim prompt
 For i = 0 To Table.Cols
  Table.col(i).L = width + Table.L
  Table.col(i).W = Table.W * (Table.col(i).Tag / 100)
  Table.col(i).H = Table.RowHeight
  Table.col(i).T = Table.T
  width = width + Table.col(i).W
   Next
 ReDim Table.Grid(Table.Cols, Table.Rows)
'***********

size = 9
 '网格中的数据字体大小
'**********
For i = 0 To Table.Cols
    For j = 0 To Table.Rows
        Table.Grid(i, j).L = Table.col(i).L
        Table.Grid(i, j).W = Table.col(i).W
        Table.Grid(i, j).H = Table.RowHeight
        Table.Grid(i, j).T = Table.T + j * Table.RowHeight
      Table.Grid(i, j).fontsize = size
    Next
 Next
 '*******

 
'Call DrawFrame

'Printer.EndDoc
'Printer.KillDoc

Call PrintTable
systemdb_.Execute "drop table print"


End Sub

Sub PrintTable()
Dim Rs As Recordset
Dim col, row

Dim Timer, xh As Integer '序号
Dim r
Dim rsCount As Integer
id = 0
Set Rs = systemdb_.OpenRecordset("print", dbOpenDynaset)
rsCount = 0
While Not Rs.EOF
rsCount = rsCount + 1
Rs.MoveNext
Wend
'******
'处理form_printing的进度条状态
PrintRecord = rsCount
If PrintRecord < 100 Then
PrintMode = Mode1
Else
StepNumber = Fix(PrintRecord / 100)
PrintMode = mode2
End If


'***************


If rsCount = 0 Then
MsgBox "无此项记录，请重新选择！"

Exit Sub
End If

Timer = 0
xh = 0
Rs.MoveFirst

'**************计算打印页数
Pages = rsCount \ Table.Rows
If (rsCount Mod Table.Rows) <> 0 Then
Pages = Pages + 1
End If
form_printing.lb_pages.Caption = " 共 " & Str(Pages) & " 页"

'***************************************

Dim xxx
xxx = Rs.RecordCount Mod Table.Rows
Rem xh=序号

While Not Rs.EOF
Timer = Timer + 1
xh = xh + 1
Table.Grid(0, Timer).Text = CStr(xh)
Table.Grid(1, Timer).Text = "土建-" & CStr(Rs!htbh)
Table.Grid(2, Timer).Text = CStr(Rs!gcmc)
'**************
If PrintMode = Mode1 Then
form_printing.PrintingBar.Value = xh
ElseIf PrintMode = mode2 Then
form_printing.PrintingBar.Value = Fix(Timer / StepNumber)
End If

'*****************
If Rs!jzmj <> 0 Then
Table.Grid(3, Timer).Text = Format$(Rs!jzmj, "0.00")
Else
Table.Grid(3, Timer).Text = "-----"
End If

If Rs!htzj <> 0 Then
Table.Grid(4, Timer).Text = Format$(Rs!htzj, "0.00")
Else
Table.Grid(4, Timer).Text = "-----"
End If

If Rs!jszj <> 0 Then
Table.Grid(5, Timer).Text = Format$(Rs!jszj, "0.00")
Else
Table.Grid(5, Timer).Text = "-----"
End If

If Len(Trim(Rs!jglx)) = 0 Then
Table.Grid(6, Timer).Text = "-----"
Else
Table.Grid(6, Timer).Text = CStr(Rs!jglx)
End If

If Len(Trim(Rs!manager)) = 0 Then
Table.Grid(7, Timer).Text = "-----"
Else
Table.Grid(7, Timer).Text = CStr(Rs!manager)
End If

If Len(Trim(Rs!gcqx)) = 0 Then
Table.Grid(8, Timer).Text = "-----"
Else
Table.Grid(8, Timer).Text = CStr(Rs!gcqx)
End If

If Timer = Table.Rows Then
Timer = 0
Call DrawFrame
For col = 0 To Table.Cols
For row = 1 To Table.Rows
DrawText Table.Grid(col, row)
Next
Next
If Rs.RecordCount > xh Then
Printer.NewPage
End If


End If
Rs.MoveNext
Wend
Call DrawFrame
For col = 0 To Table.Cols
  For row = 1 To xxx
DrawText Table.Grid(col, row)
Next
Next
form_printing.PrintingBar.Value = 100
Unload form_printing
'MsgBox Pages

Printer.EndDoc
Printer.KillDoc
End Sub

Sub DrawFrame()
Dim col, row
'**** 画行线
For row = 1 To Table.Rows
Printer.Line (Table.L, Table.Grid(0, row).T)- _
             (Table.W + Table.L, Table.Grid(0, row).T)
             
Next
'************

'****** 画竖线
For col = 1 To Table.Cols
Printer.Line (Table.col(col).L, Table.T)- _
             (Table.col(col).L, Table.H + Table.T)
             
Next
'************

'******** 画外框线
Printer.DrawWidth = 1
Printer.Line (Table.L, Table.T)-(Table.W + Table.L, Table.T)
Printer.Line (Table.L, Table.T)-(Table.L, Table.H + Table.T)
Printer.Line (Table.L, Table.H + Table.T)-(Table.W + Table.L, Table.H + Table.T)
Printer.Line (Table.W + Table.L, Table.T)-(Table.W + Table.L, Table.H + Table.T)
Printer.DrawWidth = 1
'*******
Dim n
n = 40
Printer.DrawWidth = 3
Printer.Line (Table.L - n, Table.T - n)-(Table.W + n + Table.L, Table.T - n)
Printer.Line (Table.L - n, Table.T - n)-(Table.L - n, Table.H + Table.T + n)
Printer.Line (Table.L - n, Table.H + Table.T + n)-(Table.W + Table.L + n, Table.H + Table.T + n)
Printer.Line (Table.W + Table.L + n, Table.T - n)-(Table.W + n + Table.L, Table.H + Table.T + n)
Printer.DrawWidth = 1

'************

Dim c
'******* 画表格内的标题 “序号---工程编号等等”
Dim tmp As Unit

For c = 0 To Table.Cols
tmp = Table.col(c)
DrawText tmp
Next
'***********
'画标题，表尾，时间，页码
id = id + 1

Call DrawAddition(Pages, id)
'************

End Sub
Sub DrawAddition(pagecount As Integer, page As Integer)

Dim tmp As String
Printer.Font.size = 10
tmp = "共  " & CStr(pagecount) & "  页 "
TablePageCount.L = Table.L + Table.W - 500 - Printer.TextWidth(tmp)
TablePageCount.T = Table.T - 40 - Printer.TextHeight("地方机")
Printer.CurrentX = TablePageCount.L
Printer.CurrentY = TablePageCount.T
Printer.Print tmp
tmp = "编制单位：上海园林工程有限公司-建筑处"
TableBzdw.L = Table.L + 200
TableBzdw.T = Table.T + Table.H + 200
Printer.CurrentX = TableBzdw.L
Printer.CurrentY = TableBzdw.T
Printer.Print tmp
tmp = "第  " & CStr(page) & "  页"
TablePage.L = Table.L + (Table.W - Printer.TextWidth(tmp)) / 2
TablePage.T = Table.T + Table.H + 200
Printer.CurrentX = TablePage.L
Printer.CurrentY = TablePage.T
Printer.Print tmp
tmp = "打印日期: " & Format(Date, "yyyy 年 mm 月 dd 日")
TableDate.L = Table.L + Table.W - Printer.TextWidth(tmp) - 500
TableDate.T = Table.T + Table.H + 200
Printer.CurrentX = TableDate.L
Printer.CurrentY = TableDate.T
Printer.Print tmp
'*******
tmp = "工 程 项 目 列 表"
Printer.Font.size = 20
TableTitle.L = Table.L + (Table.W - Printer.TextWidth(tmp)) / 2
TableTitle.T = Table.T - 250 - Printer.TextHeight(tmp)
Printer.CurrentX = TableTitle.L
Printer.CurrentY = TableTitle.T
Printer.Print tmp

'Printer.PaintPicture Form1.Image1.Picture, 10, 10, Form1.Image1.width, Form1.Image1.Height



Printer.Font.size = 9
End Sub
Sub DrawText(item As Unit)
Printer.Font.size = item.fontsize
Printer.CurrentX = item.L + (item.W - Printer.TextWidth(item.Text)) / 2
Printer.CurrentY = item.T + (item.H - Printer.TextHeight(item.Text)) / 2
Printer.Print item.Text

End Sub
