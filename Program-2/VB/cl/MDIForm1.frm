VERSION 5.00
Begin VB.MDIForm MDIForm1 
   AutoShowChildren=   0   'False
   BackColor       =   &H8000000C&
   Caption         =   "MDIForm1"
   ClientHeight    =   3930
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   5805
   LinkTopic       =   "MDIForm1"
   Moveable        =   0   'False
   ScrollBars      =   0   'False
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin VB.PictureBox p1 
      Align           =   1  'Align Top
      Height          =   408
      Index           =   0
      Left            =   0
      ScaleHeight     =   345
      ScaleWidth      =   5745
      TabIndex        =   2
      Top             =   0
      Width           =   5808
      Begin VB.CommandButton time 
         Caption         =   "Command1"
         Height          =   285
         Left            =   2910
         TabIndex        =   5
         Top             =   60
         Width           =   1035
      End
      Begin VB.CommandButton cmd_openprj 
         Caption         =   "Openprj"
         Height          =   310
         Left            =   1608
         TabIndex        =   4
         Top             =   24
         Width           =   996
      End
      Begin VB.CommandButton cmd_Newprj 
         Caption         =   "NewPrj"
         Height          =   280
         Left            =   192
         TabIndex        =   3
         Top             =   48
         Width           =   720
      End
   End
   Begin VB.PictureBox Picture2 
      Align           =   2  'Align Bottom
      Height          =   370
      Left            =   0
      ScaleHeight     =   315
      ScaleWidth      =   5745
      TabIndex        =   0
      Top             =   3552
      Width           =   5808
   End
   Begin VB.PictureBox Picture1 
      Align           =   1  'Align Top
      Height          =   0
      Left            =   0
      ScaleHeight     =   0
      ScaleWidth      =   5805
      TabIndex        =   1
      Top             =   408
      Width           =   5808
   End
   Begin VB.Menu file 
      Caption         =   "file"
      Begin VB.Menu exit 
         Caption         =   "Exit"
         Shortcut        =   ^X
      End
   End
End
Attribute VB_Name = "MDIForm1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub cmd_Newprj_Click()
'p1(0).Enabled = False
newprj_form.Show 0, MDIForm1

End Sub

Private Sub exit_Click()
Unload Me

End Sub

Private Sub MDIForm_Load()
DisableCloseButton (Me.hwnd)

End Sub

Private Sub time_Click()
formtime.Show
End Sub
