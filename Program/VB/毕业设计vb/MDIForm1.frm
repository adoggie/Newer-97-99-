VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.1#0"; "COMCTL32.OCX"
Begin VB.MDIForm MDIForm1 
   BackColor       =   &H8000000C&
   Caption         =   " ���ʹ��� "
   ClientHeight    =   3084
   ClientLeft      =   132
   ClientTop       =   708
   ClientWidth     =   6828
   Icon            =   "MDIForm1.frx":0000
   LinkTopic       =   "MDIForm1"
   LockControls    =   -1  'True
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin ComctlLib.Toolbar Toolbar1 
      Align           =   1  'Align Top
      Height          =   528
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   6828
      _ExtentX        =   12044
      _ExtentY        =   931
      ButtonWidth     =   995
      ButtonHeight    =   804
      Appearance      =   1
      _Version        =   327680
      BeginProperty Buttons {0713E452-850A-101B-AFC0-4210102A8DA7} 
         NumButtons      =   7
         BeginProperty Button1 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "a1"
            Object.ToolTipText     =   "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
            Object.Tag             =   ""
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button2 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "a2"
            Object.Tag             =   ""
         EndProperty
         BeginProperty Button3 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "a3"
            Object.Tag             =   ""
         EndProperty
         BeginProperty Button4 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "a4"
            Object.Tag             =   ""
         EndProperty
         BeginProperty Button5 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "a5"
            Object.Tag             =   ""
         EndProperty
         BeginProperty Button6 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "a6"
            Object.Tag             =   ""
         EndProperty
         BeginProperty Button7 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Object.Tag             =   ""
         EndProperty
      EndProperty
   End
   Begin ComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   372
      Left            =   0
      TabIndex        =   0
      ToolTipText     =   "I LOVE YOU!!!!!"
      Top             =   2712
      Width           =   6828
      _ExtentX        =   12044
      _ExtentY        =   656
      SimpleText      =   "ְ�����¹���   ���/�޸�"
      _Version        =   327680
      BeginProperty Panels {0713E89E-850A-101B-AFC0-4210102A8DA7} 
         NumPanels       =   1
         BeginProperty Panel1 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            TextSave        =   ""
            Object.Tag             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Menu ����� 
      Caption         =   "�˳�ϵͳ"
   End
   Begin VB.Menu m1 
      Caption         =   "�������"
      Begin VB.Menu a1 
         Caption         =   "¼�뵱�¹���"
      End
      Begin VB.Menu a2 
         Caption         =   "-"
      End
      Begin VB.Menu gzk 
         Caption         =   "���ɵ��¹��ʿ�"
         Enabled         =   0   'False
      End
      Begin VB.Menu a3 
         Caption         =   "��� ����"
      End
      Begin VB.Menu a5 
         Caption         =   "���/�޸� ְ����Ϣ"
      End
      Begin VB.Menu a6 
         Caption         =   "-"
      End
   End
   Begin VB.Menu menu2 
      Caption         =   "�����޸�"
      Begin VB.Menu b1 
         Caption         =   "���¹����޸�"
         Enabled         =   0   'False
      End
      Begin VB.Menu b2 
         Caption         =   "-"
      End
      Begin VB.Menu b3 
         Caption         =   "���� �޸�"
         Enabled         =   0   'False
      End
      Begin VB.Menu b4 
         Caption         =   "ְ����Ϣ�� �޸�"
      End
   End
   Begin VB.Menu edit 
      Caption         =   "����ά��"
      Begin VB.Menu backup 
         Caption         =   "�������ݿ�"
      End
      Begin VB.Menu deldb 
         Caption         =   "ɾ�����ݿ�"
         Enabled         =   0   'False
      End
   End
   Begin VB.Menu FIND 
      Caption         =   "���ݲ�Ѱ"
      Begin VB.Menu FIND1 
         Caption         =   "�ٲ�ʽ��ѯְ����Ϣ"
      End
      Begin VB.Menu q1 
         Caption         =   "�ٲ�ʽ��ѯְ�����¹���"
      End
      Begin VB.Menu kk 
         Caption         =   "-"
      End
      Begin VB.Menu FIND2 
         Caption         =   "��¼ʽ��ѯְ����Ϣ"
      End
      Begin VB.Menu tt 
         Caption         =   "���¹��ʼ�¼ʽ��ѯְ��"
      End
      Begin VB.Menu SPACE1 
         Caption         =   "-"
      End
      Begin VB.Menu HFIND 
         Caption         =   "���ܲ�ѯ"
      End
   End
   Begin VB.Menu dfd 
      Caption         =   "��ӡ����"
      Begin VB.Menu fff 
         Caption         =   "��ӡ���ʵ�"
      End
   End
   Begin VB.Menu menu1 
      Caption         =   "������Ϣ"
      Begin VB.Menu gs 
         Caption         =   "����..."
      End
   End
End
Attribute VB_Name = "MDIForm1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub d_Click()
Form1.Show
End Sub

Private Sub a1_Click()
cur_database = "zgxx"
prompt.cmdappend.Caption = "�� ��"
prompt.Labappend.Visible = True
prompt.Labfind.Visible = False
prompt.Show
End Sub

Private Sub a3_Click()
bmtj.Show 1, MDIForm1
End Sub

Private Sub a4_Click()
zctj.Show
End Sub

Private Sub a5_Click()
form2.Show 1, MDIForm1
End Sub

Private Sub a7_Click()
Unload Me
End Sub

Private Sub b1_Click()
Form5.Show 1, MDIForm1

End Sub

Private Sub b4_Click()
form2.Show 1, MDIForm1
End Sub

Private Sub backup_Click()
Form6.Show 1, MDIForm1
End Sub

Private Sub deldb_Click()
Form3.Text1.Visible = False
Form3.Label2.Visible = False
Form3.Show 1, MDIForm1
End Sub

Private Sub dfa_Click()
Unload Me
End Sub

Private Sub FIND1_Click()
Form8.Show 1, MDIForm1
End Sub

Private Sub FIND2_Click()
form2.delete.Enabled = False
form2.append.Enabled = False
form2.edit.Enabled = False
form2.Text1.Enabled = False
form2.Text2.Enabled = False
form2.Text3.Enabled = False
form2.Text6.Enabled = False
form2.Show 1, MDIForm1
End Sub

Private Sub gs_Click()
about.Show 1, MDIForm1
End Sub

Private Sub io_Click()
bmtj.Show 1, MDIForm1
End Sub



Private Sub HFIND_Click()
Form10.Show 1, MDIForm1
End Sub

Private Sub MDIForm_Unload(Cancel As Integer)
Kill App.path & "\tmpfile.mdb"
End Sub

Private Sub q1_Click()
Form9.Show 1, MDIForm1
End Sub

Private Sub tt_Click()
Form1.Command3.Visible = False
findflag = True
prompt.cmdappend.Caption = "��  Ѱ"
prompt.Labappend.Visible = False
prompt.Labfind.Visible = True
prompt.Show

End Sub

Private Sub �����_Click()
Unload Me
End Sub
