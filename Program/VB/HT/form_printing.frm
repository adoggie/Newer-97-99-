VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Object = "{28D47522-CF84-11D1-834C-00A0249F0C28}#1.0#0"; "GIF89.DLL"
Begin VB.Form form_printing 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "打印数据传送中...."
   ClientHeight    =   900
   ClientLeft      =   30
   ClientTop       =   330
   ClientWidth     =   4950
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   900
   ScaleWidth      =   4950
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  '屏幕中心
   Begin ComctlLib.ProgressBar PrintingBar 
      Height          =   270
      Left            =   930
      TabIndex        =   0
      Top             =   360
      Width           =   3855
      _ExtentX        =   6800
      _ExtentY        =   476
      _Version        =   327682
      Appearance      =   0
   End
   Begin GIF89LibCtl.Gif89a printing 
      Height          =   492
      Left            =   120
      OleObjectBlob   =   "form_printing.frx":0000
      TabIndex        =   1
      Top             =   144
      Width           =   564
   End
   Begin VB.Label lb_pages 
      Caption         =   "Label1"
      Height          =   252
      Left            =   792
      TabIndex        =   2
      Top             =   72
      Width           =   1572
   End
End
Attribute VB_Name = "form_printing"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
printing.filename = App.Path & "\pt.gif"
DisableCloseButton (Me.hwnd)
End Sub
