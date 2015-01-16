object frmMain: TfrmMain
  Left = 375
  Top = 8
  Width = 991
  Height = 720
  Caption = 'Tra'#231'ando rotas utilizando diretamente a API do Google Maps'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object web: TWebBrowser
    Left = 0
    Top = 41
    Width = 790
    Height = 622
    Align = alClient
    TabOrder = 0
    OnStatusTextChange = webStatusTextChange
    OnProgressChange = webProgressChange
    ControlData = {
      4C000000A6510000494000000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 975
    Height = 41
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 3
      Top = 8
      Width = 3
      Height = 13
    end
    object Label2: TLabel
      Left = 3
      Top = 0
      Width = 14
      Height = 13
      Caption = 'De'
    end
    object Label3: TLabel
      Left = 219
      Top = 0
      Width = 16
      Height = 13
      Caption = 'At'#233
    end
    object Label4: TLabel
      Left = 528
      Top = 16
      Width = 74
      Height = 13
      Caption = 'Dist'#226'ncia Total:'
    end
    object edEnd1: TEdit
      Left = 3
      Top = 16
      Width = 209
      Height = 21
      TabOrder = 0
      Text = 'BALSAS, MA'
    end
    object Button1: TButton
      Left = 435
      Top = 16
      Width = 75
      Height = 22
      Caption = 'ok'
      TabOrder = 2
      OnClick = Button1Click
    end
    object edEnd2: TEdit
      Left = 219
      Top = 16
      Width = 209
      Height = 21
      TabOrder = 1
      Text = 'IMPERATRIZ, MA'
    end
    object edDistancia: TEdit
      Left = 608
      Top = 16
      Width = 73
      Height = 21
      TabOrder = 3
    end
    object BitBtn1: TBitBtn
      Left = 688
      Top = 16
      Width = 75
      Height = 22
      Caption = 'Pega total'
      TabOrder = 4
      TabStop = False
      OnClick = BitBtn1Click
    end
    object Button2: TButton
      Left = 776
      Top = 16
      Width = 75
      Height = 25
      Caption = 'listbox'
      TabOrder = 5
      OnClick = Button2Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 663
    Width = 975
    Height = 19
    Panels = <
      item
        Width = 500
      end
      item
        Width = 100
      end
      item
        Width = 50
      end
      item
        Width = 50
      end>
  end
  object ProgressBar1: TProgressBar
    Left = 336
    Top = 320
    Width = 150
    Height = 17
    TabOrder = 3
  end
  object Panel2: TPanel
    Left = 790
    Top = 41
    Width = 185
    Height = 622
    Align = alRight
    Caption = 'Panel2'
    TabOrder = 4
    object ListBox1: TListBox
      Left = 1
      Top = 1
      Width = 183
      Height = 280
      Align = alTop
      Ctl3D = False
      ItemHeight = 13
      ParentCtl3D = False
      TabOrder = 0
    end
    object re1: TRichEdit
      Left = 0
      Top = 296
      Width = 185
      Height = 305
      Lines.Strings = (
        're1')
      TabOrder = 1
    end
  end
end
