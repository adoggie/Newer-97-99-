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
LEFT_ = 0  '�ı������
CENTER_ = 1
RIGHT_ = 2
End Enum

Enum DrawMode
TEXT_ = 0   '��Ԫ����Ϊ�ı�
PROGRESSBAR_ = 1 '��Ԫ����Ϊ������
OTHER_ = 2 ' NULL
End Enum

Type GridUnit

Pos As Rect  '��Ԫ������λ��
Width As Integer '���
Height As Integer '�߶�
PrintMode As DrawMode '��Ԫ���ڴ�ӡģʽ  ���� �� ������ �� ��
LSV As Boolean '��Ԫ���������Ƿ�ɼ����ɼ����ӡ���� ������ÿ��Ԫ���ʩ������ʱʹ��
RSV As Boolean '
TSV As Boolean '
BSV As Boolean '
TextFontSize As Integer ' ��Ԫ�����ı��������С
text As String '��Ԫ�����ı�����
TextAlign As AlignMode '��Ԫ�����ı����з�ʽ
TextPos As Rect '��Ԫ�����ı���ʼλ��
TextWidth As Integer '�ı����
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

Public ProgressBarHeight As Integer  '�������߶�
Public ProgressBarColor As Integer '��������ɫ
Public WorkDateRange As Integer  '�ܹ���
Public UnitRange As Integer 'ÿ��Ԫ��ʩ������

'******************************
'*****************************
Public TotalUint As Integer '�����������ڵĵ�Ԫ������
Public GroupGrid() As GridUnit '�����������ڵĵ�Ԫ������
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
Public spt As Integer  '�����ӡֽ�����ľ���
Public spl As Integer
Public spb As Integer
Public spr As Integer
'+++++++++++++++++++++++++++++++
Public LineHeight As Integer  'ÿ�еĸ߶�
Public CaptionHeight As Integer
Public TitleHeight As Integer

'+++++++++++++++++++++++++++++++
Public Records As Integer '��¼����
'+++++++++++++
Public PrintModeNow As PrintMode
Public go As Variant
