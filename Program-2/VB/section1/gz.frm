VERSION 5.00
Begin VB.Form Form1 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "  XX 单位职工当月工资："
   ClientHeight    =   5472
   ClientLeft      =   228
   ClientTop       =   1476
   ClientWidth     =   9108
   DrawMode        =   9  'Not Mask Pen
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5472
   ScaleWidth      =   9108
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox Text29 
      BackColor       =   &H00E0E0E0&
      DataField       =   "gz"
      DataSource      =   "Data2"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00008000&
      Height          =   372
      Left            =   7920
      TabIndex        =   53
      Text            =   "Text29"
      Top             =   4080
      Width           =   1092
   End
   Begin VB.TextBox Text7 
      DataField       =   "bz"
      DataSource      =   "Data2"
      Height          =   1932
      Left            =   6000
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   14
      Text            =   "gz.frx":0000
      Top             =   2040
      Width           =   3012
   End
   Begin VB.Frame Frame3 
      BackColor       =   &H00C0C0C0&
      Height          =   3132
      Left            =   120
      TabIndex        =   13
      Top             =   1320
      Width           =   5772
      Begin VB.Data Data2 
         Caption         =   "Data2"
         Connect         =   "Access"
         DatabaseName    =   ""
         DefaultCursorType=   0  'DefaultCursor
         DefaultType     =   2  'UseODBC
         Exclusive       =   0   'False
         Height          =   375
         Left            =   3840
         Options         =   0
         ReadOnly        =   0   'False
         RecordsetType   =   1  'Dynaset
         RecordSource    =   "9812"
         Top             =   2640
         Visible         =   0   'False
         Width           =   1935
      End
      Begin VB.TextBox Text27 
         DataField       =   "qtkc"
         DataSource      =   "Data2"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   324
         Left            =   4560
         TabIndex        =   52
         Text            =   "Text27"
         Top             =   2160
         Width           =   852
      End
      Begin VB.TextBox Text26 
         DataField       =   "kylj"
         DataSource      =   "Data2"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   324
         Left            =   4560
         TabIndex        =   51
         Text            =   "Text26"
         Top             =   1800
         Width           =   852
      End
      Begin VB.TextBox Text25 
         DataField       =   "gts"
         DataSource      =   "Data2"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   312
         Left            =   4560
         TabIndex        =   50
         Text            =   "Text25"
         Top             =   1440
         Width           =   852
      End
      Begin VB.TextBox Text24 
         DataField       =   "ghf"
         DataSource      =   "Data2"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   312
         Left            =   4560
         TabIndex        =   49
         Text            =   "Text24"
         Top             =   1080
         Width           =   852
      End
      Begin VB.TextBox Text23 
         DataField       =   "dhf"
         DataSource      =   "Data2"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   324
         Left            =   4560
         TabIndex        =   48
         Text            =   "Text23"
         Top             =   720
         Width           =   852
      End
      Begin VB.TextBox Text22 
         DataField       =   "sbf"
         DataSource      =   "Data2"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   324
         Left            =   2760
         TabIndex        =   35
         Text            =   "Text22"
         Top             =   1080
         Width           =   852
      End
      Begin VB.TextBox Text21 
         DataField       =   "ylf"
         DataSource      =   "Data2"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   324
         Left            =   2760
         TabIndex        =   34
         Text            =   "Text21"
         Top             =   2568
         Width           =   852
      End
      Begin VB.TextBox Text20 
         DataField       =   "qtjt"
         DataSource      =   "Data2"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   324
         Left            =   2760
         TabIndex        =   33
         Text            =   "Text20"
         Top             =   1800
         Width           =   852
      End
      Begin VB.TextBox Text19 
         DataField       =   "gjj"
         DataSource      =   "Data2"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   324
         Left            =   4560
         TabIndex        =   32
         Text            =   "Text19"
         Top             =   360
         Width           =   852
      End
      Begin VB.TextBox Text18 
         DataField       =   "fz"
         DataSource      =   "Data2"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   372
         Left            =   2760
         TabIndex        =   31
         Text            =   "Text18"
         Top             =   2160
         Width           =   852
      End
      Begin VB.TextBox Text17 
         DataField       =   "jb"
         DataSource      =   "Data2"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   324
         Left            =   2760
         TabIndex        =   30
         Text            =   "Text17"
         Top             =   720
         Width           =   852
      End
      Begin VB.TextBox Text16 
         DataField       =   "sdt"
         DataSource      =   "Data2"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   324
         Left            =   2760
         TabIndex        =   29
         Text            =   "Text16"
         Top             =   360
         Width           =   852
      End
      Begin VB.TextBox Text15 
         DataField       =   "ft"
         DataSource      =   "Data2"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   324
         Left            =   960
         TabIndex        =   28
         Text            =   "Text15"
         Top             =   2520
         Width           =   852
      End
      Begin VB.TextBox Text14 
         DataField       =   "ylj"
         DataSource      =   "Data2"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   324
         Left            =   2760
         TabIndex        =   27
         Text            =   "Text14"
         Top             =   1440
         Width           =   852
      End
      Begin VB.TextBox Text13 
         DataField       =   "gwt"
         DataSource      =   "Data2"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   324
         Left            =   960
         TabIndex        =   26
         Text            =   "Text13"
         Top             =   1800
         Width           =   852
      End
      Begin VB.TextBox Text12 
         DataField       =   "fst"
         DataSource      =   "Data2"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   324
         Left            =   960
         TabIndex        =   25
         Text            =   "Text12"
         Top             =   1440
         Width           =   852
      End
      Begin VB.TextBox Text11 
         DataField       =   "glt"
         DataSource      =   "Data2"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   324
         Left            =   960
         TabIndex        =   24
         Text            =   "Text11"
         Top             =   1080
         Width           =   852
      End
      Begin VB.TextBox Text10 
         DataField       =   "fd"
         DataSource      =   "Data2"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   324
         Left            =   960
         TabIndex        =   23
         Text            =   "Text10"
         Top             =   720
         Width           =   852
      End
      Begin VB.TextBox Text9 
         DataField       =   "xlf"
         DataSource      =   "Data2"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   324
         Left            =   960
         TabIndex        =   22
         Text            =   "Text9"
         Top             =   2160
         Width           =   852
      End
      Begin VB.TextBox text8 
         DataField       =   "jx"
         DataSource      =   "Data2"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   312
         Left            =   960
         TabIndex        =   21
         Text            =   "Text8"
         Top             =   360
         Width           =   852
      End
      Begin VB.Label Label28 
         AutoSize        =   -1  'True
         Caption         =   "其它扣除"
         ForeColor       =   &H000000FF&
         Height          =   180
         Left            =   3840
         TabIndex        =   62
         Top             =   2280
         Width           =   720
      End
      Begin VB.Label Label27 
         AutoSize        =   -1  'True
         Caption         =   "扣养老金"
         ForeColor       =   &H000000FF&
         Height          =   180
         Left            =   3840
         TabIndex        =   61
         Top             =   1920
         Width           =   720
      End
      Begin VB.Label Label26 
         AutoSize        =   -1  'True
         Caption         =   "个调税"
         ForeColor       =   &H000000FF&
         Height          =   180
         Left            =   3840
         TabIndex        =   60
         Top             =   1560
         Width           =   540
      End
      Begin VB.Label Label25 
         AutoSize        =   -1  'True
         Caption         =   "工会费"
         ForeColor       =   &H000000FF&
         Height          =   180
         Left            =   3840
         TabIndex        =   59
         Top             =   1200
         Width           =   540
      End
      Begin VB.Label Label24 
         AutoSize        =   -1  'True
         Caption         =   "电话费"
         ForeColor       =   &H000000FF&
         Height          =   180
         Left            =   3840
         TabIndex        =   58
         Top             =   840
         Width           =   540
      End
      Begin VB.Label Label23 
         AutoSize        =   -1  'True
         Caption         =   "公基金"
         ForeColor       =   &H000000FF&
         Height          =   180
         Left            =   3840
         TabIndex        =   57
         Top             =   480
         Width           =   540
      End
      Begin VB.Label Label22 
         AutoSize        =   -1  'True
         Caption         =   "医疗费"
         ForeColor       =   &H000000FF&
         Height          =   180
         Left            =   2040
         TabIndex        =   56
         Top             =   2640
         Width           =   540
      End
      Begin VB.Label Label21 
         AutoSize        =   -1  'True
         Caption         =   "房 租"
         ForeColor       =   &H000000FF&
         Height          =   180
         Left            =   2040
         TabIndex        =   55
         Top             =   2280
         Width           =   456
      End
      Begin VB.Label Label19 
         AutoSize        =   -1  'True
         Caption         =   "其他津贴"
         ForeColor       =   &H00C00000&
         Height          =   180
         Left            =   2040
         TabIndex        =   47
         Top             =   1920
         Width           =   720
      End
      Begin VB.Label Label18 
         Caption         =   "养老金"
         ForeColor       =   &H00C00000&
         Height          =   252
         Left            =   2040
         TabIndex        =   46
         Top             =   1560
         Width           =   732
      End
      Begin VB.Label Label17 
         AutoSize        =   -1  'True
         Caption         =   "书报费"
         ForeColor       =   &H00C00000&
         Height          =   180
         Left            =   2040
         TabIndex        =   45
         Top             =   1200
         Width           =   540
      End
      Begin VB.Label Label16 
         AutoSize        =   -1  'True
         Caption         =   "郊 补"
         ForeColor       =   &H00C00000&
         Height          =   180
         Left            =   2040
         TabIndex        =   44
         Top             =   840
         Width           =   456
      End
      Begin VB.Label Label15 
         AutoSize        =   -1  'True
         Caption         =   "水电贴"
         ForeColor       =   &H00C00000&
         Height          =   180
         Left            =   2040
         TabIndex        =   43
         Top             =   480
         Width           =   540
      End
      Begin VB.Label Label14 
         Caption         =   "房 贴"
         ForeColor       =   &H00C00000&
         Height          =   252
         Left            =   240
         TabIndex        =   42
         Top             =   2640
         Width           =   492
      End
      Begin VB.Label Label13 
         AutoSize        =   -1  'True
         Caption         =   "洗理费"
         ForeColor       =   &H00C00000&
         Height          =   180
         Left            =   120
         TabIndex        =   41
         Top             =   2280
         Width           =   540
      End
      Begin VB.Label Label12 
         AutoSize        =   -1  'True
         Caption         =   "岗位贴"
         ForeColor       =   &H00FF0000&
         Height          =   180
         Left            =   120
         TabIndex        =   40
         Top             =   1920
         Width           =   540
      End
      Begin VB.Label Label11 
         AutoSize        =   -1  'True
         Caption         =   "副食贴"
         ForeColor       =   &H00FF0000&
         Height          =   180
         Left            =   120
         TabIndex        =   39
         Top             =   1560
         Width           =   540
      End
      Begin VB.Label Label10 
         AutoSize        =   -1  'True
         Caption         =   "共龄贴"
         ForeColor       =   &H00FF0000&
         Height          =   180
         Left            =   120
         TabIndex        =   38
         Top             =   1200
         Width           =   540
      End
      Begin VB.Label Label9 
         AutoSize        =   -1  'True
         Caption         =   "浮 动"
         ForeColor       =   &H00FF0000&
         Height          =   180
         Left            =   120
         TabIndex        =   37
         Top             =   840
         Width           =   456
      End
      Begin VB.Label Label8 
         Caption         =   "基 薪"
         ForeColor       =   &H00FF0000&
         Height          =   252
         Left            =   120
         TabIndex        =   36
         Top             =   480
         Width           =   732
      End
   End
   Begin VB.PictureBox Picture1 
      Height          =   1812
      Left            =   7440
      ScaleHeight     =   1764
      ScaleWidth      =   1524
      TabIndex        =   8
      Top             =   120
      Width           =   1572
      Begin VB.Image Image1 
         DataField       =   "tp"
         DataSource      =   "Data2"
         Height          =   1812
         Left            =   0
         Stretch         =   -1  'True
         Top             =   0
         Width           =   1572
      End
   End
   Begin VB.Frame Frame2 
      Height          =   1332
      Left            =   120
      TabIndex        =   1
      Top             =   0
      Width           =   7212
      Begin VB.TextBox Text28 
         DataField       =   "zzc"
         DataSource      =   "Data2"
         Height          =   264
         Left            =   6480
         TabIndex        =   66
         Text            =   "Text28"
         Top             =   360
         Visible         =   0   'False
         Width           =   732
      End
      Begin VB.TextBox Text4 
         DataField       =   "zsr"
         DataSource      =   "Data2"
         Height          =   264
         Left            =   5760
         TabIndex        =   65
         Text            =   "Text4"
         Top             =   360
         Visible         =   0   'False
         Width           =   612
      End
      Begin VB.TextBox Text6 
         DataField       =   "bm"
         DataSource      =   "Data2"
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   12
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   372
         Left            =   3960
         TabIndex        =   12
         Text            =   "Text6"
         Top             =   840
         Width           =   3012
      End
      Begin VB.TextBox Text5 
         DataField       =   "zc"
         DataSource      =   "Data2"
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   12
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   372
         Left            =   840
         TabIndex        =   10
         Text            =   "Text5"
         Top             =   840
         Width           =   1932
      End
      Begin VB.TextBox Text3 
         DataField       =   "nl"
         DataSource      =   "Data2"
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   12
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   384
         Left            =   4680
         TabIndex        =   6
         Top             =   240
         Width           =   492
      End
      Begin VB.TextBox Text2 
         DataField       =   "xm"
         DataSource      =   "Data2"
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   12
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   372
         Left            =   2520
         TabIndex        =   4
         Text            =   "Text2"
         Top             =   240
         Width           =   1332
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
         DataField       =   "gh"
         DataSource      =   "Data2"
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   12
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   372
         Left            =   840
         TabIndex        =   2
         Text            =   "Text1"
         Top             =   240
         Width           =   852
      End
      Begin VB.Label Label6 
         Caption         =   "部门"
         Height          =   252
         Left            =   3240
         TabIndex        =   11
         Top             =   960
         Width           =   732
      End
      Begin VB.Label Label5 
         Caption         =   "职称"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   252
         Left            =   240
         TabIndex        =   9
         Top             =   960
         Width           =   492
      End
      Begin VB.Label Label3 
         Caption         =   "年龄"
         Height          =   252
         Left            =   4080
         TabIndex        =   7
         Top             =   360
         Width           =   492
      End
      Begin VB.Label Label2 
         Caption         =   "姓名"
         Height          =   252
         Left            =   1920
         TabIndex        =   5
         Top             =   360
         Width           =   732
      End
      Begin VB.Label Label1 
         Caption         =   " 工号"
         Height          =   252
         Left            =   120
         TabIndex        =   3
         Top             =   360
         Width           =   612
      End
   End
   Begin VB.Frame Frame1 
      Height          =   852
      Left            =   120
      TabIndex        =   0
      Top             =   4440
      Width           =   8892
      Begin VB.CommandButton Command3 
         Caption         =   "保 存"
         Height          =   372
         Left            =   5160
         TabIndex        =   64
         Top             =   360
         Width           =   972
      End
      Begin VB.CommandButton exit 
         Caption         =   "退 出"
         Height          =   372
         Left            =   7680
         TabIndex        =   63
         Top             =   360
         Width           =   972
      End
      Begin VB.CommandButton Command7 
         Caption         =   "上记录"
         Height          =   372
         Left            =   1200
         TabIndex        =   20
         Top             =   360
         Width           =   972
      End
      Begin VB.CommandButton Command6 
         Caption         =   "下记录"
         Height          =   372
         Left            =   2160
         TabIndex        =   19
         Top             =   360
         Width           =   972
      End
      Begin VB.CommandButton Command5 
         Caption         =   "末记录"
         Height          =   372
         Left            =   3120
         TabIndex        =   18
         Top             =   360
         Width           =   972
      End
      Begin VB.CommandButton Command4 
         Caption         =   "首记录"
         Height          =   372
         Left            =   240
         TabIndex        =   17
         Top             =   360
         Width           =   972
      End
      Begin VB.CommandButton Command1 
         Caption         =   "查 找"
         Height          =   372
         Left            =   4080
         TabIndex        =   16
         Top             =   360
         Width           =   1092
      End
   End
   Begin VB.Label Label20 
      AutoSize        =   -1  'True
      Caption         =   "当月工资："
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.8
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   216
      Left            =   6840
      TabIndex        =   54
      Top             =   4200
      Width           =   1152
   End
   Begin VB.Label Label7 
      Caption         =   "备注"
      Height          =   252
      Left            =   6240
      TabIndex        =   15
      Top             =   1800
      Width           =   732
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public findaction As String
Private Sub Command1_Click()

prompt.Show
End Sub

Private Sub Command2_Click()
Data2.Recordset.delete
Data2.Recordset.MoveNext
If Data2.Recordset.EOF Then
Data2.Recordset.MoveLast
End If
End Sub

Private Sub Command3_Click()
With Form1
.Text4 = Val(.text8.Text) + Val(.Text10.Text) + Val(.Text11.Text) + _
Val(.Text12.Text) + Val(.Text13.Text) + Val(.Text9.Text) + Val(.Text15.Text) + _
Val(.Text16.Text) + Val(.Text17.Text) + Val(.Text22.Text) + _
Val(.Text14.Text) + Val(.Text20.Text)
.Text28 = Val(.Text18.Text) + Val(.Text21.Text) + _
Val(.Text19.Text) + Val(.Text23.Text) + Val(.Text24.Text) + _
Val(.Text25.Text) + Val(.Text26.Text) + Val(.Text27.Text)
.Text29 = .Text4 - .Text28
End With
End Sub

Private Sub Command4_Click()
Data2.Recordset.MoveFirst
End Sub

Private Sub Command5_Click()
Data2.Recordset.MoveLast
End Sub

Private Sub Command6_Click()
Data2.Recordset.MoveNext
If Data2.Recordset.EOF Then
Data2.Recordset.MoveLast
End If
End Sub

Private Sub Command7_Click()
Data2.Recordset.MovePrevious
If Data2.Recordset.BOF Then
Data2.Recordset.MoveFirst
End If

End Sub

Private Sub Data2_Validate(Action As Integer, Save As Integer)
Dim Y
If findflag = True Then
 Save = 0
   Data2.UpdateControls
   Exit Sub
   End If
Select Case Action
Case 1, 2, 3, 4, 5, 6, 7
If Save Then
 Y = MsgBox("所做改动确信吗？", vbYesNo, "baby!")
 If Y = vbNo Then
   Save = 0
   Data2.UpdateControls
   End If
  End If
End Select
  End Sub

Private Sub exit_Click()
Unload Me
End Sub

Private Sub Form_Load()
Command3.Visible = True
End Sub

Private Sub Form_Unload(Cancel As Integer)
findflag = False
Form1.Command3.Visible = True
End Sub

