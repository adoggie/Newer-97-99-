Attribute VB_Name = "m1"
Public Function CheckChar(item As TextBox) As Boolean
Dim s As String
Dim i, j, counter
counter = 0
Dim buf, slen, char1, char2
buf = "0123456789."
s = Trim(item.Text)
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
item.SelStart = 0
item.SelLength = Len(item.Text)
item.SetFocus
End If
End Function
Public Sub ShowWindows()
Load form_tree
Load form_toolbar
Load form_list
Load form_edit
Load form_printing
End Sub
