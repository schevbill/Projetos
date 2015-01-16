object frmMain: TfrmMain
  Left = 200
  Top = 189
  Caption = 'Visualizador de C'#243'digo Fonte de Sites'
  ClientHeight = 714
  ClientWidth = 881
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object WebBrowser1: TWebBrowser
    Left = 0
    Top = 66
    Width = 425
    Height = 648
    Align = alLeft
    TabOrder = 0
    ExplicitHeight = 488
    ControlData = {
      4C000000ED2B0000F94200000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object MemoCodFonte: TMemo
    Left = 431
    Top = 66
    Width = 450
    Height = 648
    ScrollBars = ssBoth
    TabOrder = 1
    WordWrap = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 881
    Height = 66
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 7
      Top = 12
      Width = 49
      Height = 13
      Caption = 'Endere'#231'o:'
    end
    object edtUrl: TEdit
      Left = 64
      Top = 8
      Width = 777
      Height = 21
      TabOrder = 0
      Text = 'http://www.'
    end
    object btnNavegar: TButton
      Left = 0
      Top = 35
      Width = 425
      Height = 25
      Caption = 'Navegar'
      TabOrder = 1
      OnClick = btnNavegarClick
    end
    object btnExibirCod: TButton
      Left = 431
      Top = 35
      Width = 450
      Height = 25
      Caption = 'Exibir C'#243'digo Fonte'
      Enabled = False
      TabOrder = 2
      OnClick = btnExibirCodClick
    end
  end
end
