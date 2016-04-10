Attribute VB_Name = "Module1"
Option Explicit
Enum PrintMode
printing = 100
preprint_ = 101
OTHER = 0
End Enum

Type Rect
l As Integer 'left
T As Integer 'top
R As Integer 'right
B As Integer 'bottom
End Type

Enum AlignMode
LEFT_ = 0  '文本靠左侧
CENTER_ = 1
RIGHT_ = 2
End Enum

Enum DrawMode
TEXT_ = 0   '单元格内为文本
PROGRESSBAR_ = 1 '单元格内为进度条
OTHER_ = 2 ' NULL
End Enum

Type GridUnit

Pos As Rect  '单元格坐标位置
Width As Integer '宽度
Height As Integer '高度
PrintMode As DrawMode '单元格内打印模式  文字 或 进度条 或 无
LSV As Boolean '单元格左面线是否可见，可见则打印出来 在设置每单元格的施工天数时使用
RSV As Boolean '
TSV As Boolean '
BSV As Boolean '
TextFontSize As Integer ' 单元格内文本的字体大小
text As String '单元格内文本内容
TextAlign As AlignMode '单元格内文本排列方式
TextPos As Rect '单元格内文本起始位置
TextWidth As Integer '文本宽度
TextHeight As Integer
Visible As Boolean
BlockVisible As Boolean
End Type

Type Col
text As String
Width As Integer
Per As Integer
Visible As Boolean
End Type

 

 
 Public Caption As Txt
 Public Project As Txt
 Public Company As Txt
 Public PrintDate  As Txt
 Public TotalRange As Txt
Public ProgressRange() As Range
'*************************

Public ProgressBarHeight As Integer  '进度条高度
Public ProgressBarColor As Integer '进度条颜色
Public WorkDateRange As Integer  '总工期
Public UnitRange As Integer '每单元格施工天数

'******************************
'*****************************
Public TotalUint As Integer '进度条区域内的单元格总数
Public GroupGrid() As GridUnit '进度条区域内的单元格数组
Public GroupGridCols As Integer
Public GroupGridrows As Integer
'************************
Public Table As GridUnit
'***************************
Public block As Integer
Public ContentGrid() As GridUnit
Public ContentCols As Integer
Public ContentRows As Integer

Public Cols(1 To 4) As Col

'+++++++++++++++++++++++++++
Public spt As Integer  '表离打印纸顶部的距离
Public spl As Integer
Public spb As Integer
Public spr As Integer
'+++++++++++++++++++++++++++++++
Public LineHeight As Integer  '每行的高度
Public CaptionHeight As Integer
Public TitleHeight As Integer

'+++++++++++++++++++++++++++++++
Public Records As Integer '记录总数
'+++++++++++++
Public PrintModeNow As PrintMode
Public go As Variant
