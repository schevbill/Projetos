object FOrdemServico: TFOrdemServico
  Left = 443
  Top = 280
  Width = 709
  Height = 379
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Ordem de Servi'#231'os'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 272
    Width = 693
    Height = 69
    Align = alBottom
    TabOrder = 0
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 693
    Height = 272
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Cadastrar O.F'
    end
    object TabSheet2: TTabSheet
      Caption = 'Procurar O.F'
      ImageIndex = 1
    end
  end
end
