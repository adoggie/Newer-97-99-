Attribute VB_Name = "Val"
'*************************

Public ProgressBarHeight As Integer  '�������߶�
Public ProgressBarColor As Integer '��������ɫ
Public WorkDateRange As Integer  '�ܹ���
Public UintRange As Integer 'ÿ��Ԫ��ʩ������

'******************************
Public TotalUint As Integer '�����������ڵĵ�Ԫ������
Public GroupGrid() As GridUnit '�����������ڵĵ�Ԫ������
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
Col1Text = "���"
Col2Text = "����ʩ����Ŀ����"
Col3Text = "����"
Col4Text = "��ע"



ReDim ContentGrid(ContentRows, ContentCols)
ReDim GroupGrid(1 To GroupGridCols, 1 To GroupGridrows)



End Sub
