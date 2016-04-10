VERSION 5.00
Begin VB.Form Form3 
   Caption         =   "Form3"
   ClientHeight    =   4935
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7485
   LinkTopic       =   "Form3"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   4935
   ScaleWidth      =   7485
   WindowState     =   2  'Maximized
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "金额"
      Height          =   270
      Left            =   690
      TabIndex        =   11
      Top             =   3060
      Width           =   750
   End
   Begin VB.Label Label4 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "交货日期"
      Height          =   285
      Left            =   720
      TabIndex        =   10
      Top             =   3420
      Width           =   975
   End
   Begin VB.Label Label2 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "结算日期"
      Height          =   270
      Left            =   720
      TabIndex        =   9
      Top             =   3780
      Width           =   975
   End
   Begin VB.Label lb_ljmc 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "料 具 名 称"
      Height          =   240
      Left            =   120
      TabIndex        =   8
      Top             =   510
      Width           =   2385
   End
   Begin VB.Label lb_dw 
      Alignment       =   2  'Center
      BackColor       =   &H00808000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "单 位"
      Height          =   270
      Left            =   3900
      TabIndex        =   7
      Top             =   570
      Width           =   1050
   End
   Begin VB.Label lb_dgsl 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "订购数量"
      Height          =   270
      Left            =   630
      TabIndex        =   6
      Top             =   1470
      Width           =   870
   End
   Begin VB.Label lb_sssl 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "实收数量"
      Height          =   270
      Left            =   630
      TabIndex        =   5
      Top             =   1890
      Width           =   900
   End
   Begin VB.Label lb_dj 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "单价"
      Height          =   270
      Left            =   630
      TabIndex        =   4
      Top             =   2250
      Width           =   900
   End
   Begin VB.Label lb_yzf 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "运杂费"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9.75
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   690
      TabIndex        =   3
      Top             =   2610
      Width           =   750
   End
   Begin VB.Label lb_je 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "金额"
      Height          =   270
      Left            =   6330
      TabIndex        =   2
      Top             =   570
      Width           =   750
   End
   Begin VB.Label Label1 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "交货日期"
      Height          =   285
      Left            =   7140
      TabIndex        =   1
      Top             =   570
      Width           =   975
   End
   Begin VB.Label Label3 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "结算日期"
      Height          =   270
      Left            =   8175
      TabIndex        =   0
      Top             =   570
      Width           =   975
   End
End
Attribute VB_Name = "Form3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

