Attribute VB_Name = "Start"
Sub main()
splash.Show


SetWindowPos splash.hwnd, -1, 0, 0, splash.width, splash.height, &H2 Or &H1

TreeVisible = False: ListVisible = False: EditVisible = False
Set systemdb_ = DBEngine.Workspaces(0).OpenDatabase(App.Path & "\" & "system_.mdb")

'Call Init
CurSelectYear = "title"
'Load mdi
'mdi.Show

End Sub
Private Sub Init()
Set runCurDispYear = systemdb_.OpenRecordset("run", dbOpenDynaset)
Dim i As Integer

Dim rs As Recordset

Set rs = systemdb_.OpenRecordset("run", dbOpenDynaset)
While Not rs.EOF
rs.Edit
Dim Y, m, d, tmp
Y = year(CDate(rs!htqx1))
m = Month(CDate(rs!htqx1))
d = Day(CDate(rs!htqx1))

tmp = Mid$(Y, 3, 2) & "/" & m & "/" & d
Y = year(CDate(rs!htqx2))
m = Month(CDate(rs!htqx2))
d = Day(CDate(rs!htqx2))
tmp = tmp & "-" & Mid$(Y, 3, 2) & "/" & m & "/" & d
rs!bz = "19" & Mid$(Trim(rs!htbh), 4, 2) & "年工程合同"
'rs!qx = tmp
rs.Update
rs.MoveNext
Wend


End Sub
