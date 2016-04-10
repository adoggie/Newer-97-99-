VERSION 5.00
Begin VB.Form splash 
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   4290
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5190
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4290
   ScaleWidth      =   5190
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'ÆÁÄ»ÖÐÐÄ
   Begin VB.Timer Timer1 
      Interval        =   3000
      Left            =   1170
      Top             =   1830
   End
   Begin VB.Image img 
      Height          =   3975
      Left            =   -750
      Picture         =   "splash.frx":0000
      Top             =   -30
      Width           =   6000
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
img.Picture = LoadPicture(App.Path & "\ht.jpg")
img.left = 0
img.top = 0
Me.Height = img.Height
Me.Width = img.Width
Me.Show
End Sub

Private Sub img_Click()
Timer1.Enabled = False
Unload Me

End Sub

Private Sub Timer1_Timer()
Timer1.Enabled = False

Unload Me

End Sub
