Attribute VB_Name = "Procedure"
Option Explicit


Public Sub DisableCloseButton(hwnd As Long)
Dim hMenu
hMenu = GetSystemMenu(hwnd, 0)
Dim n

n = ModifyMenu(hMenu, 6, MF_BYPOSITION Or MF_DISABLED, 1234, "  ")
n = ModifyMenu(hMenu, 3, MF_BYPOSITION Or MF_DISABLED, 1234, "  ")
'n = ModifyMenu(hMenu, 4, MF_BYPOSITION Or MF_DISABLED, 1234, "  ")
n = ModifyMenu(hMenu, 0, MF_BYPOSITION Or MF_DISABLED, 1234, "  ")

End Sub
