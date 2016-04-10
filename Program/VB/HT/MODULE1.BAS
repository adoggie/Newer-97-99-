Attribute VB_Name = "Module1"
Public Const MF_BYPOSITION = &H400&
Public Const MF_DISABLED = &H2&

Declare Function GetSystemMenu Lib "user32" (ByVal hwnd As Long, ByVal bRevert As Long) As Long
Declare Function ModifyMenu Lib "user32" Alias "ModifyMenuA" (ByVal hMenu As Long, _
ByVal nPosition As Long, ByVal wFlags As Long, ByVal wIDNewItem As Long, ByVal lpString As Any) As Long



Public Function CheckChar(Item As TextBox) As Boolean
Dim s As String
Dim i, j, counter
counter = 0
Dim buf, slen, char1, char2
buf = "0123456789."
s = Trim(Item.Text)
slen = Len(s) ' As counter
For i = 1 To slen
char1 = Mid(s, i, 1)
    For j = 1 To 11
    char2 = Mid(buf, j, 1)
    If char1 = char2 Then
   counter = counter + 1
    Exit For
    End If
    Next
Next
If slen = counter Then
CheckChar = True
Else
CheckChar = False
MsgError = "Invalidate number in textbox.."
Item.SelStart = 0
Item.SelLength = Len(Item.Text)
Item.SetFocus
End If
End Function
Public Sub ShowWindows()
Load form_tree
Load form_list
Load form_edit

End Sub


Option Explicit


Public Sub DisableCloseButton(hwnd As Long)
Dim hMenu
hMenu = GetSystemMenu(hwnd, 0)
Dim n

n = ModifyMenu(hMenu, 6, MF_BYPOSITION Or MF_DISABLED, 1234, "  ")
n = ModifyMenu(hMenu, 3, MF_BYPOSITION Or MF_DISABLED, 1234, "  ")
n = ModifyMenu(hMenu, 4, MF_BYPOSITION Or MF_DISABLED, 1234, "  ")
n = ModifyMenu(hMenu, 0, MF_BYPOSITION Or MF_DISABLED, 1234, "  ")

End Sub


Public TreeVisible As Boolean
Public ListVisible As Boolean
Public EditVisible As Boolean
Public SystemPath As String
Public SystemDb As Database
Public RunCurDispYear As Recordset
Public Runrs  As Recordset
Public RunHtList As Recordset
Public CurSelectYear As String
Public CurSelectItem As ListItem
Public ItemSelected As Boolean

Public image As ImageList


