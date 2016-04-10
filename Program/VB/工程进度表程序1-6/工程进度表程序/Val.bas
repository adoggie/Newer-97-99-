Attribute VB_Name = "Val"
'*************************

Public ProgressBarHeight As Integer  '进度条高度
Public ProgressBarColor As Integer '进度条颜色
Public WorkDateRange As Integer  '总工期
Public UintRange As Integer '每单元格施工天数

'******************************
Public TotalUint As Integer '进度条区域内的单元格总数
Public GroupGrid() As GridUnit '进度条区域内的单元格数组
Public GroupGridCols As Integer
Public GroupGridrows As Integer
'************************
Public Table As GridUnit
'***************************
Public ContentGrid() As GridUnit
Public ContentCols As Integer
Public ContentRows As Integer

Public Col1Text As String
Public Col2Text As String
Public Col3Text As String
Public Col4Text As String

'+++++++++++++++++++++++++++++++
Sub Init()
Printer.Orientation = 2
Printer.PaperSize = 8 '=A3    9=A4
Col1Text = "序号"
Col2Text = "工程施工项目名称"
Col3Text = "工期"
Col4Text = "备注"



ReDim ContentGrid(ContentRows, ContentCols)
ReDim GroupGrid(1 To GroupGridCols, 1 To GroupGridrows)



End Sub
