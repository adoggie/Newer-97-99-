VERSION 5.00
Begin VB.UserControl time 
   ClientHeight    =   330
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   1350
   ScaleHeight     =   330
   ScaleWidth      =   1350
   Begin VB.TextBox Text1 
      Height          =   315
      Left            =   0
      TabIndex        =   0
      Text            =   "Text1"
      Top             =   0
      Width           =   1335
   End
   Begin VB.Timer Timer1 
      Interval        =   1000
      Left            =   660
      Top             =   0
   End
End
Attribute VB_Name = "time"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Private Sub Timer1_Timer()

Text1.Text = "   " & time
End Sub

Private Sub UserControl_Initialize()
'Timer1.Enabled = True
End Sub
