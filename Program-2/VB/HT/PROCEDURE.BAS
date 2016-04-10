Attribute VB_Name = "Procedure"
Option Explicit


Public Sub DisableCloseButton(hwnd As Long)
Dim hMenu
hMenu = GetSystemMenu(hwnd, 0)
Dim n

n = ModifyMenu(hMenu, 6, MF_BYPOSITION Or MF_DISABLED, 1234, "  ")
n = ModifyMenu(hMenu, 3, MF_BYPOSITION Or MF_DISABLED, 1234, "  ")
n = ModifyMenu(hMenu, 1, MF_BYPOSITION Or MF_DISABLED, 1234, "  ")
n = ModifyMenu(hMenu, 0, MF_BYPOSITION Or MF_DISABLED, 1234, "  ")

End Sub

'8************* 用于在一字符串中删除一字符
Public Function SubChar(string_ As Variant, char_ As Variant) As String
Dim Result As String
Dim len_ As Integer
Dim i
For i = 1 To Len(string_)
If Mid(string_, i, 1) <> " " Then
Result = Result & Mid(string_, i, 1)
End If
SubChar = Result

Next


End Function


