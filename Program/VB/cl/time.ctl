VERSION 5.00
Begin VB.UserControl UserControl1 
   ClientHeight    =   345
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   1380
   ScaleHeight     =   345
   ScaleWidth      =   1380
   Begin VB.TextBox Text1 
      Height          =   315
      Left            =   30
      TabIndex        =   0
      Text            =   "Text1"
      Top             =   30
      Width           =   1335
   End
   Begin VB.Timer Timer1 
      Interval        =   1000
      Left            =   660
      Top             =   0
   End
End
Attribute VB_Name = "UserControl1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Private Sub Timer1_Timer()

Text1.TEXT = "   " & time
End Sub

Private Sub UserControl_Initialize()
'Timer1.Enabled = True
End Sub
