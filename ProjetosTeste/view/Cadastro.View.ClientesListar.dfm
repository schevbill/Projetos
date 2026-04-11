object fmClienteListar: TfmClienteListar
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsSingle
  Caption = 'fmClienteListar'
  ClientHeight = 307
  ClientWidth = 463
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 463
    Height = 307
    Align = alClient
    TabOrder = 0
    object pnlButton: TPanel
      Left = 1
      Top = 242
      Width = 461
      Height = 64
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object btnNovo: TButton
        Left = 30
        Top = 24
        Width = 75
        Height = 25
        Caption = 'Novo'
        TabOrder = 0
        OnClick = btnNovoClick
      end
      object btnEditar: TButton
        Left = 111
        Top = 24
        Width = 75
        Height = 25
        Caption = 'Editar'
        TabOrder = 1
      end
      object btnExcluir: TButton
        Left = 192
        Top = 24
        Width = 75
        Height = 25
        Caption = 'Excluir'
        TabOrder = 2
      end
    end
    object DBGrid: TDBGrid
      Left = 1
      Top = 1
      Width = 461
      Height = 241
      Align = alClient
      DataSource = dtsCliente
      Options = [dgTitles, dgColLines, dgRowLines, dgRowSelect, dgTitleHotTrack]
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
  object dtsCliente: TDataSource
    Left = 192
    Top = 56
  end
end
