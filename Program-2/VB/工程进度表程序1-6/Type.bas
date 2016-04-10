Attribute VB_Name = "Type"
'
'
'******** 1999-12-22  Author : Z.Bin  *********
'                I Love To Do It!
'
'
'

Type Txt
x As Integer
y As Integer
text As String
fontsize As Integer
fontname As String
End Type
 

Type Range    'Record UnitRange
From As Integer
To As Integer
End Type


'*************************

'*************************

Sub DrawAddtion() '
Dim tmp As Variant
If PrintModeNow = preprint_ Then
Set tmp = Form2
End If
If PrintModeNow = printing Then
Set tmp = Printer
End If


tmp.Font = 10
If PrintModeNow = preprint_ Then
tmp.Font = 5
End If
tmp.fontname = "黑体"

Company.x = Table.Pos.l
Company.y = Table.Pos.B + 100
Company.text = "编制单位： " & Form1.txt_company
tmp.CurrentX = Company.x
tmp.CurrentY = Company.y

If PrintModeNow = preprint_ Then
tmp.CurrentX = Company.x / 2
tmp.CurrentY = Company.y / 2
End If

tmp.Print Company.text

PrintDate.text = "编制日期:  " & Trim(Form1.txt_date)
PrintDate.x = Company.x + tmp.TextWidth(Company.text) + 800
PrintDate.y = Company.y


tmp.CurrentX = PrintDate.x
tmp.CurrentY = PrintDate.y
If PrintModeNow = preprint_ Then
tmp.CurrentX = PrintDate.x / 2
tmp.CurrentY = PrintDate.y / 2
End If

tmp.Print PrintDate.text



TotalRange.text = "总工期： " & Trim(Form1.txt_zgq) & " 天"
TotalRange.x = Table.Pos.R - tmp.TextWidth(TotalRange.text)
TotalRange.y = Table.Pos.T - tmp.TextHeight(TotalRange.text) - 50
tmp.CurrentX = TotalRange.x
tmp.CurrentY = TotalRange.y

If PrintModeNow = preprint_ Then

TotalRange.x = Table.Pos.R / 2 - tmp.TextWidth(TotalRange.text)
tmp.CurrentX = TotalRange.x

tmp.CurrentY = Table.Pos.T / 2 - tmp.TextHeight(TotalRange.text) / 2 - 50
End If
tmp.Print TotalRange.text

tmp.fontsize = 24



tmp.Font = "隶书"
Caption.text = Form1.txt_caption
Caption.x = (Table.Width - tmp.TextWidth(Caption.text)) / 2 + Table.Pos.l
Caption.y = Table.Pos.T - tmp.TextHeight(Caption.text) - 200
tmp.CurrentX = Caption.x
tmp.CurrentY = Caption.y
If PrintModeNow = preprint_ Then
tmp.fontsize = 12
tmp.CurrentX = Caption.x / 2
tmp.CurrentY = Caption.y / 2

End If
tmp.Print Caption.text



End Sub
Sub Start()

Call step1
Call Init
End Sub
'********
Sub Init()

'++++++++++++++++++++++++++++++++++++++
'设置行高
'++++++++++++++++++++++
'+++++++++++++++++++++++++++++++++++++++++++++++++
Dim i As Integer
Dim j As Integer
'+++++++++++++ 确定有几列
'+++++++++++++++++++++++
block = 40
ReDim ContentGrid(ContentRows, 1 To 4)
ReDim ProgressRange(1 To ContentRows + 10, 1 To block)
' Block :每一条记录中进度条可能包括多段  最多的段
'remember to Clear the progressrange().from and to ="0"
For i = 1 To ContentRows
    For j = 1 To block
    ProgressRange(i, j).From = 0
    ProgressRange(i, j).To = 0
    Next
Next

'Then  Fill  in the correct value !
      
            
 
        For j = 0 To ContentRows
            For i = 1 To 4
             ContentGrid(j, i).Visible = True
           If i = 4 Or i = 3 Then
         ContentGrid(j, i).Visible = Cols(i).Visible
         End If
         
            ContentGrid(j, i).BSV = True
            ContentGrid(j, i).TSV = True
            ContentGrid(j, i).LSV = True
            ContentGrid(j, i).RSV = True
            If j = 0 Then
            ContentGrid(j, i).Height = TitleHeight
            Else
            ContentGrid(j, i).Height = LineHeight
            End If
         
            ContentGrid(j, i).PrintMode = TEXT_
            ContentGrid(j, i).TextAlign = CENTER_
            ContentGrid(j, i).TextFontSize = 10
            ContentGrid(j, i).TextHeight = Printer.TextHeight("djf")
            ContentGrid(j, i).Width = Cols(i).Width
            If j = 0 Then
            ContentGrid(j, i).text = Cols(i).text
            Else
            ContentGrid(j, i).text = ""
            End If
            
            
            If j <> 0 And i = 1 Then
            ContentGrid(j, i).text = Str(j)
            End If
            
            
            If i = 1 Then
            ContentGrid(j, i).Pos.l = Table.Pos.l
            Else
            ContentGrid(j, i).Pos.l = ContentGrid(j, i - 1).Pos.R
            End If
            '===========
            If i <> 1 Then
            If ContentGrid(j, i - 1).Visible = False Then
            ContentGrid(j, i).Pos.l = ContentGrid(j, i - 2).Pos.R
            End If
            End If
            
            '===========
            
            
            If j = 0 Then
            ContentGrid(j, i).Pos.T = Table.Pos.T
            Else
            ContentGrid(j, i).Pos.T = ContentGrid(j - 1, i).Pos.B
            End If
            
            
            Printer.fontsize = 10
            ContentGrid(j, i).Pos.R = ContentGrid(j, i).Pos.l + Cols(i).Width
            ContentGrid(j, i).Pos.B = ContentGrid(j, i).Pos.T + ContentGrid(j, i).Height
          ContentGrid(j, i).TextPos.l = (ContentGrid(j, i).Width - Printer.TextWidth(Trim(ContentGrid(j, i).text))) / 2 + ContentGrid(j, i).Pos.l
          ContentGrid(j, i).TextPos.T = (ContentGrid(j, i).Height - Printer.TextHeight(ContentGrid(j, i).text)) / 2 + ContentGrid(j, i).Pos.T
         If i = 2 Then
               ContentGrid(j, i).TextPos.l = ContentGrid(j, i).Pos.l + 100
    End If
    
          If j = 0 And i = 1 Then
          ContentGrid(j, i).TextPos.l = 50 + ContentGrid(j, i).Pos.l
        End If

           'DrawRect ContentGrid(j, i)
           'contentgrid(j,
        
        
         
            Next
       
    
        Next

'++++++++++++++++++++
  Dim StarX As Integer, StartY As Integer
  Dim GroupWidth As Integer '进度条区域的宽度
  Dim GridWidth As Integer   '进度条每一格的宽度
 ContentCols = 4
rp2:
 If Cols(ContentCols).Visible = False Then
 ContentCols = ContentCols - 1
 GoTo rp2
 End If
 
  StarX = ContentGrid(1, ContentCols).Pos.R
  StarY = ContentGrid(1, 1).Pos.T
  GroupWidth = Table.Width - StarX
  
  GridWidth = GroupWidth / WorkDateRange '每格的宽度
   
  
  GroupGridrows = ContentRows
  GroupGridCols = WorkDateRange
 
  
  ReDim GroupGrid(1 To GroupGridrows, 1 To GroupGridCols)
        Dim k As Integer, l As Integer

  For j = 1 To GroupGridrows
            For i = 1 To GroupGridCols
            GroupGrid(j, i).BSV = True
            GroupGrid(j, i).TSV = True
            GroupGrid(j, i).LSV = False
            GroupGrid(j, i).RSV = False
            If i Mod UnitRange = 0 Then
            GroupGrid(j, i).RSV = True
     
          
            End If
           ' If i Mod UnitRange = 1 Then
            '   GroupGrid(j, i).LSV = False
            '   End If
               
            GroupGrid(j, i).Height = LineHeight
            GroupGrid(j, i).PrintMode = PROGRESSBAR_
            GroupGrid(j, i).Pos.l = (i - 1) * GridWidth + StarX
            GroupGrid(j, i).Pos.R = i * GridWidth + StarX
            GroupGrid(j, i).Pos.T = ContentGrid(j, 1).Pos.T
            GroupGrid(j, i).Pos.B = ContentGrid(j, 1).Pos.B
            GroupGrid(j, i).Width = GridWidth
            GroupGrid(j, i).Visible = True
            GroupGrid(j, i).BlockVisible = False
            GroupGrid(j, i).Height = LineHeight
            Next
Next
'=========================
Rs.MoveFirst
j = 1
Dim y
While Not Rs.EOF And j <= ContentRows

If IsNull(Rs!name) Then
ContentGrid(j, 2).text = ""
Else
ContentGrid(j, 2).text = Rs!name
End If
If IsNull(Rs!Gq) Then
ContentGrid(j, 3).text = ""
Else
ContentGrid(j, 3).text = Rs!Gq
End If
If IsNull(Rs!Bz) Then
ContentGrid(j, 4).text = ""
Else
ContentGrid(j, 4).text = Rs!Bz
End If
If IsNull(Rs!From) Or IsNull(Rs!To) Then
GoTo step4
End If
If Rs!From <= 0 Or Rs!From > WorkDateRange Or Rs!To <= 0 Or Rs!To > WorkDateRange Then
GoTo step4
End If
For y = Rs!From To Rs!To
GroupGrid(j, y).BlockVisible = True
Next

step4:
j = j + 1
Rs.MoveNext

Wend



For y = 0 To ContentRows
 For i = 1 To 4
 DrawRect ContentGrid(y, i)

 Next
 
Next

For y = 1 To ContentRows

For i = 1 To WorkDateRange
 
DrawRect GroupGrid(y, i)
Next
Next

'++++++++++ In here ,Now Perpair to Set Attrib to   "PrintMode=PROGRESSBARMODE"
    For i = 1 To block
        If ProgressRange(j, i).From <> 0 And ProgressRange(j, i).To <> 0 Then
           For k = ProgressRange(j, i).From To _
                   ProgressRange(j, i).To
                  GroupGrid(j, k).PrintMode = PROGRESSBAR_
            Next
        End If
    Next
           
  

'++++++++++++++++++++++++++++++++++++
Table.Pos.R = GroupGrid(1, GroupGridCols).Pos.R
Table.Pos.B = GroupGrid(GroupGridrows, 1).Pos.B
   DrawRect Table
'++++++++++++++++++++++++++++++++++++++++++++++++
Dim Separate As Integer
Dim h As Integer, w As Integer
'************
If PrintModeNow = printing Then
        If Form1.opt_10.Value = True Then
        Separate = 10
            Else
            Separate = 5
            End If
                For i = 1 To WorkDateRange
            If i <> WorkDateRange And i Mod Separate = 0 Then
            Printer.Line (GroupGrid(1, i).Pos.R, GroupGrid(1, i).Pos.T)- _
        (GroupGrid(1, i).Pos.R, GroupGrid(1, i).Pos.T - 80)
            h = Printer.TextHeight(Str(i))
        w = Printer.TextWidth(Str(i))
            Printer.CurrentX = GroupGrid(1, i).Pos.R - w / 2 - 30
                Printer.CurrentY = GroupGrid(1, i).Pos.T - 80 - h
                Printer.Print Str(i)


        

            End If
                    Next

End If
'************

Call DrawAddtion
If PrintModeNow = printing Then
 Printer.EndDoc
 End If
 
  Exit Sub
'Call PrintTable




End Sub


Sub step1()
Printer.Orientation = 2
Printer.PaperSize = 8 '=A3    9=A4
'++++++++++++++++++++++++++
'Call Test

'++++++++++++++++++++++
LineHeight = 300 'twip
TitleHeight = 500
CaptionHeight = 1000 '打印标题高度

spt = 1000 + CaptionHeight
spl = 1000
spr = 200
spb = 400
block = 20
If Form1.opt_style1.Value Then
ContentRows = 40
Else
ContentRows = Records
End If

Dim h
h = Fix(CInt(Form1.txt_zgq) / 10)
If CInt(Form1.txt_zgq) Mod 10 <> 0 Then
h = h + 1
End If

WorkDateRange = h * 10
   UnitRange = CInt(Form1.txt_unit)
   


rp:
If (ContentRows * LineHeight + TitleHeight + spt) > (Printer.ScaleHeight - spb) Then
LineHeight = LineHeight - 2
GoTo rp
End If

'MsgBox LineHeight
'Exit Sub

'++++++++++++++++++++++++++
'+++++++++++++++++++++++++

With Table.Pos
.T = spt
.l = spl
.R = Printer.ScaleWidth - spr
'***********
'If PrintModeNow = preprint_ Then
'.R = Form2.ScaleWidth - 50
'End If
'************
.B = ContentRows * LineHeight + TitleHeight + spb
End With
Table.Width = Table.Pos.R - Table.Pos.l
Table.Height = Table.Pos.B - Table.Pos.T

With Table.Pos
.T = (Printer.ScaleHeight - Table.Height) / 2
.l = spl
.R = Printer.ScaleWidth - spr
'***********
'If PrintModeNow = preprint_ Then
'.T = (Form2.ScaleHeight - Table.Height) / 2
'.R = Form2.ScaleWidth - 50
'End If
'***********
.B = .T + Table.Height
End With
Table.BSV = True
Table.LSV = True
Table.TSV = True
Table.RSV = True
Table.PrintMode = OTHER_
Table.Visible = True
'++++++++++++++++++++
'+++++++++++++++++

Cols(1).text = "序号"
Cols(1).Per = 3 ' 4% Width in Paper
Cols(1).Visible = True

Cols(1).Width = Fix(Table.Width / 100 * Cols(1).Per)
Cols(2).text = "工程施工项目名称"
Cols(2).Per = 11
Cols(2).Visible = True
Cols(2).Width = Fix(Table.Width / 100 * Cols(2).Per)
Cols(3).text = "工期"
Cols(3).Per = 4
Cols(3).Visible = True
Cols(3).Width = Fix(Cols(3).Per / 100 * Table.Width)
Cols(4).text = "备注"
Cols(4).Per = 7
Cols(4).Visible = True
Cols(4).Width = Fix(Table.Width / 100 * Cols(4).Per)

Cols(3).Visible = Form1.chk_gq.Value
Cols(4).Visible = Form1.chk_bz.Value




End Sub
