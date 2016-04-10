Attribute VB_Name = "Doit"
Option Explicit
Public Db As Database
Public Rs As Recordset


Public flag As Integer

Public Sub DrawRect(n As GridUnit)

Dim ii, jj
Dim sc As Integer
sc = 1
'Set go = Printer
If PrintModeNow = preprint_ Then
'Form2.Show
'Form2.Cls
sc = 2

End If
Dim color As Integer
color = 0
If PrintModeNow = preprint_ Then
color = 3
End If

If n.Visible Then
go.Line (n.Pos.l / sc, n.Pos.T / sc)-(n.Pos.R / sc, n.Pos.T / sc), QBColor(color)
If n.LSV Then
go.Line (n.Pos.l / sc, n.Pos.T / sc)-(n.Pos.l / sc, n.Pos.B / sc), QBColor(color)
End If

If n.RSV Then
go.Line (n.Pos.R / sc, n.Pos.T / sc)-(n.Pos.R / sc, n.Pos.B / sc), QBColor(color)
End If

go.Line (n.Pos.l / sc, n.Pos.B / sc)-(n.Pos.R / sc, n.Pos.B / sc), QBColor(color)

If n.PrintMode = TEXT_ Then
go.Font = "ºÚÌå"

go.fontsize = 10
If PrintModeNow = preprint_ Then go.fontsize = 5
go.CurrentY = n.TextPos.T / sc
go.CurrentX = n.TextPos.l / sc
go.Print n.text
End If

If n.PrintMode = PROGRESSBAR_ And n.BlockVisible And PrintModeNow = printing Then

ii = n.Pos.T + Fix(n.Height / 4)
While ii <= n.Pos.T + n.Height * 3 / 4
go.Line (n.Pos.l, ii)-(n.Pos.R, ii)
ii = ii + 10
Wend
End If

If n.PrintMode = PROGRESSBAR_ And n.BlockVisible And PrintModeNow = preprint_ Then

ii = n.Pos.T + Fix(n.Height / 4)
ii = ii / 2
While ii <= n.Pos.T / 2 + n.Height * 3 / 4 / 2
go.Line (n.Pos.l / 2, ii)-(n.Pos.R / 2, ii)
ii = ii + 3
Wend
End If


End If









End Sub

