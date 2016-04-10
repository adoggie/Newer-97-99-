Attribute VB_Name = "share"
Public SystemPath As String
Public systemdb_ As Database
Public RunRs  As Recordset
Public runrs1 As Recordset
Public ItemSelected As Boolean
'Public image As ImageList
Public SendToTextBox As Integer    'txt_htzq1  and txt_htqx2
Public ProjectClassTableRs As Recordset  '工程结构类型记录集 table: ProjectClass
Public ManagerTableRs As Recordset       '工程负责人类型记录集 Table: Managers
Public RunTableRs As Recordset
Public CurSelListItem As ListItem
Public PreSelListItemIndex As Integer
Public CurSelListItemIndex As Integer
Public ChildClicked As Boolean
