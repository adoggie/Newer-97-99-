object FormLogon: TFormLogon
  Left = 241
  Top = 165
  ActiveControl = edtUser
  BorderStyle = bsToolWindow
  Caption = '登 陆'
  ClientHeight = 119
  ClientWidth = 264
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 29
    Width = 41
    Height = 13
    AutoSize = False
    Caption = '用 户'
  end
  object Label2: TLabel
    Left = 12
    Top = 60
    Width = 41
    Height = 13
    AutoSize = False
    Caption = '密 码'
  end
  object edtUser: TEdit
    Left = 60
    Top = 24
    Width = 185
    Height = 21
    ImeName = '中文 (简体) - 智能 ABC'
    TabOrder = 0
  end
  object edtPassword: TEdit
    Left = 60
    Top = 56
    Width = 185
    Height = 21
    ImeName = '中文 (简体) - 智能 ABC'
    TabOrder = 1
  end
  object Button1: TButton
    Left = 120
    Top = 88
    Width = 57
    Height = 25
    Caption = '确 定'
    Default = True
    ModalResult = 1
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 184
    Top = 88
    Width = 57
    Height = 25
    Caption = '取 消'
    ModalResult = 2
    TabOrder = 3
  end
end
