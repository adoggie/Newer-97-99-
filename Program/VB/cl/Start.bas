Attribute VB_Name = "Start"
Option Explicit

Sub main()
' call LoadAll
EnableEdit = False
'Call test

'Exit Sub
On Error GoTo error
SysPath = App.Path

If Not init Then
GoTo error
End If
Set Systemljlb = SystemDB.OpenRecordset("project_ljlb", dbOpenDynaset)
Set Systemcsdw = SystemDB.OpenRecordset("project_saler", dbOpenDynaset)
Set SystemMen = SystemDB.OpenRecordset("project_men", dbOpenDynaset)
'Set systemys = SystemDB.OpenRecordset("select ys from project_men", dbOpenDynaset)
'Set systemjs = SystemDB.OpenRecordset("select js from project_men", dbOpenDynaset)

Load MDIForm1
MDIForm1.Show
Exit Sub
error:
 MsgBox "ruinning error"
 
End Sub

Public Function init() As Boolean
On Error GoTo error
TmpString = App.Path
TmpString = TmpString & "\system.mdb"
Set SystemDB = DBEngine.Workspaces(0).OpenDatabase(TmpString, False, False)
Set SystemRS = SystemDB.OpenRecordset("system", dbOpenDynaset)
SystemRS.MoveFirst
If Not SystemRS!Value Then
SystemRS.Edit
SystemRS!Value = True
SystemRS.Update
MkDir SysPath & "\" & "Project"
MkDir SysPath & "\" & "Others"
End If

init = True
Return
error:
Select Case Err
Case 3024  ' operat this database ,but can not find this database filename!
MsgBox "no this file exist!"
init = False
End Select
End Function


Public Function IsProjectExist() As Boolean



Set SystemRS = Nothing
Set SystemRS = SystemDB.OpenRecordset("Cur_project", dbOpenDynaset)
If SystemRS.RecordCount = 0 Then
IsProjectExist = False
End If
End Function

Public Sub test()
Set SystemDB = DBEngine.Workspaces(0).OpenDatabase(App.Path & "\system.mdb", False, False)
Set SystemRS = SystemDB.OpenRecordset("project_saler", dbOpenDynaset)
Dim dw As String
dw = "料具类别： "
Dim i As Integer
For i = 0 To 99
SystemRS.Edit
SystemRS!id = i
'SystemRS!Name = dw & Str(i)
SystemRS.Update
SystemRS.MoveNext

Next i
SystemRS.Close
SystemDB.Close
Set SystemRS = Nothing
Set SystemDB = Nothing

End Sub
