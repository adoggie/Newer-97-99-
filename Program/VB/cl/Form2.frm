VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.2#0"; "COMCTL32.OCX"
Begin VB.Form form_open 
   Caption         =   "OPEN_PROJECT"
   ClientHeight    =   4275
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   9000
   LinkTopic       =   "Form2"
   ScaleHeight     =   4275
   ScaleWidth      =   9000
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command4 
      Caption         =   "添加子工程"
      Enabled         =   0   'False
      Height          =   315
      Left            =   7620
      TabIndex        =   7
      Top             =   90
      Width           =   1035
   End
   Begin VB.CommandButton Command3 
      Caption         =   "打  开"
      Height          =   435
      Left            =   6570
      TabIndex        =   5
      Top             =   3510
      Width           =   1815
   End
   Begin VB.TextBox Text1 
      Height          =   405
      Left            =   1830
      TabIndex        =   3
      Text            =   "Text1"
      Top             =   3480
      Width           =   4125
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Add"
      Height          =   315
      Left            =   6060
      TabIndex        =   2
      Top             =   90
      Width           =   705
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Delete"
      Enabled         =   0   'False
      Height          =   285
      Left            =   6870
      TabIndex        =   1
      Top             =   120
      Width           =   705
   End
   Begin ComctlLib.ListView ListView1 
      Height          =   2655
      Left            =   210
      TabIndex        =   0
      Top             =   450
      Width           =   8625
      _ExtentX        =   15214
      _ExtentY        =   4683
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   327682
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "SELECT PROJECT NAME:"
      Height          =   180
      Left            =   180
      TabIndex        =   6
      Top             =   150
      Width           =   1800
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "工程项目名："
      Height          =   180
      Left            =   600
      TabIndex        =   4
      Top             =   3600
      Width           =   1095
   End
End
Attribute VB_Name = "form_open"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

