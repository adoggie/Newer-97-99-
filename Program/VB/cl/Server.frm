VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3675
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5580
   LinkTopic       =   "Form1"
   ScaleHeight     =   3675
   ScaleWidth      =   5580
   StartUpPosition =   3  'Windows Default
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
Dim handle
handle = GetSystemMenu(Me.hwnd, 0)
Dim n

n = ModifyMenu(handle, 6, MF_BYPOSITION Or MF_DISABLED, 1234, "  ")

End Sub
