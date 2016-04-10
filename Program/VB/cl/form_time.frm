VERSION 5.00
Begin VB.Form form_time 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   1965
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3930
   ControlBox      =   0   'False
   DrawStyle       =   1  'Dash
   LinkTopic       =   "Form2"
   ScaleHeight     =   1965
   ScaleWidth      =   3930
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin cl.changetime changetime1 
      Height          =   1905
      Left            =   -30
      TabIndex        =   0
      Top             =   -90
      Width           =   3645
      _ExtentX        =   6429
      _ExtentY        =   3360
   End
End
Attribute VB_Name = "form_time"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
changetime1.left = 0
changetime1.top = 0
Form1.width = changetime1.width
Form1.height = changetime1.height
End Sub
