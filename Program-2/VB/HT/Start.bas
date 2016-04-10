Attribute VB_Name = "Start"
Sub zbin()
Set rs1 = systemdb_.OpenRecordset("tree", dbOpenDynaset)
Dim n As Integer
Dim tmp As String
While Not rs1.EOF
rs1.Edit
'rs1.SQL = Trim("select * from run where jglx='" & Trim(rs1!Name) & "'")
rs1.sql = Trim("NO TAG")


rs1.Update
rs1.MoveNext

Wend









End Sub
Sub main()
Load splash

SetWindowPos splash.hwnd, -1, 0, 0, splash.width, splash.Height, &H2 Or &H1

TreeVisible = False: ListVisible = False: EditVisible = False
Set systemdb_ = DBEngine.Workspaces(0).OpenDatabase(App.Path & "\" & "system_.mdb")
Set ProjectClassTableRs = systemdb_.OpenRecordset("projectclass", dbOpenDynaset)
Set ManagerTableRs = systemdb_.OpenRecordset("select * from managers order by name", dbOpenDynaset)
Set RunTableRs = systemdb_.OpenRecordset("run", dbOpenDynaset)
ChildClicked = False
' Call zbin
'Call Init
CurSelectYear = "title"
'Load mdi
mdi.Show

End Sub
Private Sub Init()
Set runCurDispYear = systemdb_.OpenRecordset("run", dbOpenDynaset)
Dim i As Integer

Dim Rs As Recordset

Set Rs = systemdb_.OpenRecordset("run", dbOpenDynaset)
While Not Rs.EOF
Rs.Edit
Dim Y, m, d, tmp
Y = Year(CDate(Rs!htqx1))
m = Month(CDate(Rs!htqx1))
d = Day(CDate(Rs!htqx1))

tmp = Mid$(Y, 3, 2) & "/" & m & "/" & d
Y = Year(CDate(Rs!htqx2))
m = Month(CDate(Rs!htqx2))
d = Day(CDate(Rs!htqx2))
tmp = tmp & "-" & Mid$(Y, 3, 2) & "/" & m & "/" & d
Rs!bz = "19" & Mid$(Trim(Rs!htbh), 4, 2) & "年工程合同"
'rs!qx = tmp
Rs.Update
Rs.MoveNext
Wend


End Sub
