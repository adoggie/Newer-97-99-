Attribute VB_Name = "Module1"
Public findflag As Boolean
Public appendflag As Boolean
Public pbfindcode As Boolean
Public ghfind
Public xmfind
Public appendcode As Boolean
Public ff As Integer
Public findstring  As String
Public dlk
Public pass1 As String
Public cur_database As String
Public fuck
Public cc As String
Public path As String
Public path2 As String
Public findcode
Public flag2
Public flag3
Sub main()
Dim db  As Database
Dim ws1 As Workspace
Dim dba As Database
Dim rca As Recordset
appendflag = False
findflag = False
appendcode = False
ghfind = 0
xmfind = 1
pbfindcode = False
ff = 0
fuck = "±¿µ°£¡"
path = App.path & "\gzk.mdb"
path2 = App.path & "\gzk"
FileCopy path, App.path & "\tmpfile.mdb"
MDIForm1.Show
End Sub


