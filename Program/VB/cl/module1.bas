Attribute VB_Name = "DefinSystemValue"
Option Explicit
Public CurRunDBName As String
Public CurRunDBPath As String  '当前运行数据库的路径名称

Public Systemljlb As Recordset
Public Systemcsdw As Recordset

Public SystemDB As Database
Public RunDB As Database
Public SystemRS As Recordset
Public RunRS As Recordset

Public SystemMen As Recordset


Public SysPath As String
Public TmpString  As String
Public TmpInt As Integer
Public EnableEdit As Boolean

Public curprj_select  As Boolean   'init value is falease
Public ljlb_select As Boolean
Public csdw_select As Boolean

Public Const NUMBERT = 1
Public Const TEXT = 0










Public Sub AppendProject(project As String)
Dim name As String
name = App.Path & "\project\" & project
MkDir name
FileCopy App.Path & "\client.mdb", name & "\" & project & ".mdb"

CurRunDBPath = name & "\" & project & ".mdb"

Set RunDB = DBEngine.Workspaces(0).OpenDatabase(name & "\" & project & ".mdb")



End Sub
