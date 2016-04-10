VERSION 5.00
Begin VB.Form splash 
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   5595
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   8115
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5595
   ScaleWidth      =   8115
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'ÆÁÄ»ÖÐÐÄ
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   2
      Left            =   1140
      Top             =   1830
   End
   Begin VB.Image img 
      Height          =   2085
      Left            =   420
      Stretch         =   -1  'True
      Top             =   570
      Width           =   3345
   End
End
Attribute VB_Name = "splash"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Activate()

Timer1.Enabled = True
End Sub

Private Sub Form_Load()
img.Picture = LoadPicture(App.Path & "\ht.gif")

img.left = 0
img.top = 0
img.height = Me.height
img.width = Me.width

End Sub

Private Sub Timer1_Timer()
Timer1.Enabled = False
mdi.Show
Unload Me

End Sub
