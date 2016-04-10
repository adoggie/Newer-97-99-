VERSION 5.00
Begin VB.Form about 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "关于 制作"
   ClientHeight    =   3120
   ClientLeft      =   2340
   ClientTop       =   1932
   ClientWidth     =   5736
   ClipControls    =   0   'False
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2148.041
   ScaleMode       =   0  'User
   ScaleWidth      =   5380.766
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   600
      Top             =   1920
   End
   Begin VB.TextBox Text1 
      Height          =   1812
      Left            =   360
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   2
      Text            =   "about.frx":0000
      Top             =   240
      Width           =   5052
   End
   Begin VB.CommandButton cmdOK 
      Cancel          =   -1  'True
      Caption         =   "确定"
      Default         =   -1  'True
      Height          =   345
      Left            =   3960
      TabIndex        =   0
      Top             =   2640
      Width           =   1500
   End
   Begin VB.Label Label1 
      Caption         =   "96' 信息二班   张 斌"
      ForeColor       =   &H000000C0&
      Height          =   252
      Left            =   3360
      TabIndex        =   3
      Top             =   2160
      Width           =   1932
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00808080&
      BorderStyle     =   6  'Inside Solid
      Index           =   1
      X1              =   84.426
      X2              =   5309.473
      Y1              =   1687.451
      Y2              =   1687.451
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      BorderWidth     =   2
      Index           =   0
      X1              =   98.497
      X2              =   5309.473
      Y1              =   1697.779
      Y2              =   1697.779
   End
   Begin VB.Label lblVersion 
      Caption         =   "版本 1.234567890       98-10-7"
      Height          =   228
      Left            =   240
      TabIndex        =   1
      Top             =   2640
      Width           =   3012
   End
End
Attribute VB_Name = "about"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdOK_Click()
Unload Me
End Sub

Private Sub Timer1_Timer()
Label1.Left = Label1.Left - 30
If Label1.Left < -2000 Then
Label1.Left = about.Width
End If
End Sub
