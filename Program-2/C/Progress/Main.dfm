object FormMain: TFormMain
  Left = 160
  Top = 111
  Width = 580
  Height = 370
  BorderWidth = 2
  Caption = '工程管理系列  - 工程进度表打印'
  Color = clMenu
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 568
    Height = 37
    AutoSize = True
    Bands = <
      item
        Break = False
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 33
        Width = 457
      end
      item
        Break = False
        ImageIndex = -1
        Width = 105
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 444
      Height = 33
      ButtonHeight = 27
      ButtonWidth = 33
      Caption = 'ToolBar1'
      TabOrder = 0
      object SpeedButton2: TSpeedButton
        Left = 0
        Top = 2
        Width = 29
        Height = 27
        Hint = '新建工程项目'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
          333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
          0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
          0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
          33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
          B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
          3BB33773333773333773B333333B3333333B7333333733333337}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = ItemNewClick
      end
      object SpeedButton3: TSpeedButton
        Left = 29
        Top = 2
        Width = 36
        Height = 27
        Hint = '打开已有项目'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555555FFFFFFFFFF55555000000000055555577777777775F55500B8B8B8B8
          B05555775F555555575F550F0B8B8B8B8B05557F75F555555575550BF0B8B8B8
          B8B0557F575FFFFFFFF7550FBF0000000000557F557777777777500BFBFBFBFB
          0555577F555555557F550B0FBFBFBFBF05557F7F555555FF75550F0BFBFBF000
          55557F75F555577755550BF0BFBF0B0555557F575FFF757F55550FB700007F05
          55557F557777557F55550BFBFBFBFB0555557F555555557F55550FBFBFBFBF05
          55557FFFFFFFFF7555550000000000555555777777777755555550FBFB055555
          5555575FFF755555555557000075555555555577775555555555}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = ItemOpenClick
      end
      object btnSave: TSpeedButton
        Left = 65
        Top = 2
        Width = 30
        Height = 27
        Enabled = False
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
          7700333333337777777733333333008088003333333377F73377333333330088
          88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
          000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
          FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
          99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
        OnClick = btnSaveClick
      end
      object SpeedButton5: TSpeedButton
        Left = 95
        Top = 2
        Width = 32
        Height = 27
      end
      object SpeedButton1: TSpeedButton
        Left = 127
        Top = 2
        Width = 30
        Height = 27
      end
      object ToolButton3: TToolButton
        Left = 157
        Top = 2
        Width = 90
        Caption = 'ToolButton3'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object cbFileList: TComboBox
        Left = 247
        Top = 2
        Width = 188
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnChange = cbFileListChange
      end
    end
  end
  object stbar: TStatusBar
    Left = 0
    Top = 297
    Width = 568
    Height = 23
    Panels = <
      item
        Text = 'Status'
        Width = 400
      end
      item
        Alignment = taCenter
        Width = 50
      end>
    SimplePanel = False
  end
  object MainMenu: TMainMenu
    Left = 408
    Top = 12
    object N1: TMenuItem
      Caption = '文 件(&F)'
      object ItemNew: TMenuItem
        Caption = '新建工程'
        ShortCut = 16462
        OnClick = ItemNewClick
      end
      object ItemOpen: TMenuItem
        Caption = '打开工程...'
        ShortCut = 16463
        OnClick = ItemOpenClick
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object ItemSetupPrinter: TMenuItem
        Caption = '打印机设置'
        ShortCut = 16464
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object ItemExit: TMenuItem
        Caption = '退 出'
        ShortCut = 16472
        OnClick = ItemExitClick
      end
    end
    object N2: TMenuItem
      Caption = '帮 助 (&H)'
      object ItemTopic: TMenuItem
        Caption = '主 题'
        ShortCut = 112
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object ItemAbout: TMenuItem
        Caption = '关于...'
        ShortCut = 16449
        OnClick = ItemAboutClick
      end
    end
  end
  object OpenDlg: TOpenDialog
    DefaultExt = 'prj'
    Filter = '工程进度文件(*.prj)|*.prj'
    Left = 436
    Top = 12
  end
  object SysTime: TTimer
    OnTimer = SysTimeTimer
    Left = 466
    Top = 10
  end
  object ImageList1: TImageList
    Left = 488
    Top = 4
  end
  object SaveDlg: TSaveDialog
    Filter = '工程进度文件(*.prj)|*.prj'
    Left = 440
    Top = 40
  end
end
