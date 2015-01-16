object FRM_Entrega2: TFRM_Entrega2
  Left = 229
  Top = 161
  BorderStyle = bsDialog
  Caption = 'Entrega'
  ClientHeight = 561
  ClientWidth = 787
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PNL_Entrega: TPanel
    Left = 0
    Top = 0
    Width = 787
    Height = 561
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 5
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 5
      Top = 5
      Width = 777
      Height = 295
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 15
        Width = 66
        Height = 16
        Caption = 'Telefone:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 16
        Top = 61
        Width = 40
        Height = 16
        Caption = 'Nome:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 172
        Top = 98
        Width = 62
        Height = 16
        Caption = 'Endere'#231'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 16
        Top = 135
        Width = 39
        Height = 16
        Caption = 'Bairro:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 315
        Top = 135
        Width = 47
        Height = 16
        Caption = 'Cidade:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 16
        Top = 173
        Width = 62
        Height = 16
        Caption = 'Ponto Ref:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 711
        Top = 16
        Width = 60
        Height = 20
        Caption = 'Pedido:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SPB_Sair: TSpeedButton
        Left = 652
        Top = 255
        Width = 120
        Height = 28
        Caption = '&Sair'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        Glyph.Data = {
          0E060000424D0E06000000000000360000002800000016000000160000000100
          180000000000D8050000B0070000B00700000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2CF0FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          CC16FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFDDDDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF040404040404040404FF00FFFF00FFFF
          00FFFF00FFFF00FF3800FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF66993399FF3399CC33040404
          FF00FFFF00FFFF00FFFF00FFD600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF66993399FF3399CC
          33040404FF00FFFF00FFFF00FFFF00FF3168FF00FFFF00FF0404040404040404
          04040404040404040404040404040404040404FF00FFFF00FFFF00FFFF00FF66
          993399FF3399CC33040404FF00FFFF00FFFF00FF6F63FF00FFFF00FF66993399
          CC3399CC3399CC3399CC3399CC3399CC33040404FF00FFFF00FFFF00FFFF00FF
          FF00FF66993399FF3399CC33040404FF00FFFF00FFFF00FFCD92FF00FFFF00FF
          66993399FFCC99FF3399FF3399FF3399CC33040404FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF66993399FF3399CC33040404FF00FFFF00FF8B37FF00
          FFFF00FF669933FFFFFF99FFCC99FF3399CC33040404FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF66993399FF3399CC33040404FF00FFFF00FF
          8007FF00FFFF00FF66993399FFCCFFFFFF99FFCC99FF3399CC33040404FF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF66993399FF3399CC33040404FF00
          FFFF00FFFF00FF00FFFF00FF669933FFFFFF99FFCC04040499FF3399FF3399CC
          33040404FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF66993399FF3399CC3304
          0404FF00FFFF00FFFF00FF00FFFF00FF66993399FFCC040404FF00FF66993399
          FF3399FF3399CC33040404040404FF00FFFF00FFFF00FFFF00FF66993399FF33
          99CC33040404FF00FFFF00FF9400FF00FFFF00FF669933040404FF00FFFF00FF
          FF00FF66993399FF3399FF3399CC3399CC3304040404040404040404040499CC
          3399FF3399CC33040404FF00FFFF00FF6600FF00FFFF00FF669933FF00FFFF00
          FFFF00FFFF00FFFF00FF66993366993399FF3399FF3399CC3399CC3399CC3399
          CC3399FF3399CC33040404FF00FFFF00FFFF00FF6600FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF66993366993399FF3399FF33
          99FF3399FF3399FF33040404FF00FFFF00FFFF00FFFF00FF9900FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6699
          33669933669933669933669933FF00FFFF00FFFF00FFFF00FFFF00FF9900FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          CC00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFCC00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFCC00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00}
        Margin = 5
        ParentFont = False
        OnClick = SPB_SairClick
      end
      object SPB_Confirma: TSpeedButton
        Left = 652
        Top = 223
        Width = 120
        Height = 28
        Caption = '&Confirma'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        Glyph.Data = {
          0E060000424D0E06000000000000360000002800000016000000160000000100
          180000000000D8050000B0070000B00700000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2CF0FF00
          FFFF00FF000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          CC16FF00FF868686E3E3E3969696000000FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFDDDDFF00FFFF00FF868686E3E3E3969696000000FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF3800FF00FFFF00FFFF00FF868686E3E3E3969696000000FF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFD600FF00FFFF00FFFF00FFFF00FF868686E3E3E3
          969696000000FF00FF000000000000000000FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF3168FF00FFFF00FFFF00FFFF00FFFF00
          FF868686E3E3E3969696000000969696969696969696000000FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6F63FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF808080000000969696C0C0C0C0C0C0C0C0C0969696000000
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCD92FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF000000969696C0C0C0C0C0C0C0C0C0808080C0C0
          C0969696000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8B37FF00
          FFFF00FFFF00FFFF00FFFF00FF868686969696C0C0C0C0C0C0C0C0C0808080C0
          C0C0C0C0C0000000969696000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          8007FF00FFFF00FFFF00FFFF00FFFF00FF868686FFFFFFE3E3E3C0C0C0808080
          C0C0C0C0C0C0000000E3E3E3C0C0C0969696000000FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FF00FFFF00FFFF00FFFF00FFFF00FF868686FFFFFFE3E3E38080
          80C0C0C0C0C0C0000000E3E3E3C0C0C0808080C0C0C0969696000000FF00FFFF
          00FFFF00FFFF00FFFF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF868686FF
          FFFFE3E3E3C0C0C0000000E3E3E3C0C0C0808080C0C0C0C0C0C0969696000000
          FF00FFFF00FFFF00FFFF00FF9400FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF868686FFFFFF000000E3E3E3C0C0C0808080C0C0C0C0C0C0C0C0C09696
          96000000FF00FFFF00FFFF00FFFF00FF6600FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF868686FFFFFFE3E3E3808080C0C0C0C0C0C0C0C0C096
          9696000000FF00FFFF00FFFF00FFFF00FFFF00FF6600FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF868686FFFFFFE3E3E3E3E3E3C0C0C0
          969696000000969696000000FF00FFFF00FFFF00FFFF00FF9900FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF868686FFFFFFFFFF
          FF969696000000868686E3E3E3969696000000FF00FFFF00FFFF00FF9900FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF86
          8686868686868686FF00FFFF00FF868686E3E3E3969696000000FF00FFFF00FF
          CC00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF868686E3E3E39696960000
          00FF00FFCC00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF868686E3
          E3E3000000FF00FFCC00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF868686FF00FFFF00FFFF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00}
        Margin = 5
        ParentFont = False
        OnClick = SPB_ConfirmaClick
      end
      object Label12: TLabel
        Left = 464
        Top = 61
        Width = 57
        Height = 16
        Caption = 'Telefone:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 164
        Top = 15
        Width = 52
        Height = 16
        Caption = 'Cliente:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SPB_Manutencao: TSpeedButton
        Left = 652
        Top = 195
        Width = 120
        Height = 28
        Caption = '&Manuten'#231#227'o'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        Glyph.Data = {
          0E060000424D0E06000000000000360000002800000016000000160000000100
          180000000000D8050000B0070000B00700000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2CF0FF00
          FFFF00FF000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          CC16FF00FF868686E3E3E3969696000000FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFDDDDFF00FFFF00FF868686E3E3E3969696000000FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF3800FF00FFFF00FFFF00FF868686E3E3E3969696000000FF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFD600FF00FFFF00FFFF00FFFF00FF868686E3E3E3
          969696000000FF00FF000000000000000000FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF3168FF00FFFF00FFFF00FFFF00FFFF00
          FF868686E3E3E3969696000000969696969696969696000000FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6F63FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF808080000000969696C0C0C0C0C0C0C0C0C0969696000000
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCD92FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF000000969696C0C0C0C0C0C0C0C0C0808080C0C0
          C0969696000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8B37FF00
          FFFF00FFFF00FFFF00FFFF00FF868686969696C0C0C0C0C0C0C0C0C0808080C0
          C0C0C0C0C0000000969696000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          8007FF00FFFF00FFFF00FFFF00FFFF00FF868686FFFFFFE3E3E3C0C0C0808080
          C0C0C0C0C0C0000000E3E3E3C0C0C0969696000000FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FF00FFFF00FFFF00FFFF00FFFF00FF868686FFFFFFE3E3E38080
          80C0C0C0C0C0C0000000E3E3E3C0C0C0808080C0C0C0969696000000FF00FFFF
          00FFFF00FFFF00FFFF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF868686FF
          FFFFE3E3E3C0C0C0000000E3E3E3C0C0C0808080C0C0C0C0C0C0969696000000
          FF00FFFF00FFFF00FFFF00FF9400FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF868686FFFFFF000000E3E3E3C0C0C0808080C0C0C0C0C0C0C0C0C09696
          96000000FF00FFFF00FFFF00FFFF00FF6600FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF868686FFFFFFE3E3E3808080C0C0C0C0C0C0C0C0C096
          9696000000FF00FFFF00FFFF00FFFF00FFFF00FF6600FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF868686FFFFFFE3E3E3E3E3E3C0C0C0
          969696000000969696000000FF00FFFF00FFFF00FFFF00FF9900FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF868686FFFFFFFFFF
          FF969696000000868686E3E3E3969696000000FF00FFFF00FFFF00FF9900FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF86
          8686868686868686FF00FFFF00FF868686E3E3E3969696000000FF00FFFF00FF
          CC00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF868686E3E3E39696960000
          00FF00FFCC00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF868686E3
          E3E3000000FF00FFCC00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF868686FF00FFFF00FFFF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00}
        Margin = 5
        ParentFont = False
        OnClick = SPB_ManutencaoClick
      end
      object Label15: TLabel
        Left = 16
        Top = 250
        Width = 81
        Height = 16
        Caption = 'Entregador:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 16
        Top = 211
        Width = 72
        Height = 16
        Caption = 'DT Entrega:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label17: TLabel
        Left = 279
        Top = 211
        Width = 73
        Height = 16
        Caption = 'HR Entrega:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object SPB_Clientes: TSpeedButton
        Left = 652
        Top = 167
        Width = 120
        Height = 28
        Caption = 'C&Lientes'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        Glyph.Data = {
          0E060000424D0E06000000000000360000002800000016000000160000000100
          180000000000D8050000B0070000B00700000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2CF0FF00
          FFFF00FF000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          CC16FF00FF868686E3E3E3969696000000FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFDDDDFF00FFFF00FF868686E3E3E3969696000000FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF3800FF00FFFF00FFFF00FF868686E3E3E3969696000000FF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFD600FF00FFFF00FFFF00FFFF00FF868686E3E3E3
          969696000000FF00FF000000000000000000FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF3168FF00FFFF00FFFF00FFFF00FFFF00
          FF868686E3E3E3969696000000969696969696969696000000FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6F63FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF808080000000969696C0C0C0C0C0C0C0C0C0969696000000
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCD92FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF000000969696C0C0C0C0C0C0C0C0C0808080C0C0
          C0969696000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8B37FF00
          FFFF00FFFF00FFFF00FFFF00FF868686969696C0C0C0C0C0C0C0C0C0808080C0
          C0C0C0C0C0000000969696000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          8007FF00FFFF00FFFF00FFFF00FFFF00FF868686FFFFFFE3E3E3C0C0C0808080
          C0C0C0C0C0C0000000E3E3E3C0C0C0969696000000FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FF00FFFF00FFFF00FFFF00FFFF00FF868686FFFFFFE3E3E38080
          80C0C0C0C0C0C0000000E3E3E3C0C0C0808080C0C0C0969696000000FF00FFFF
          00FFFF00FFFF00FFFF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF868686FF
          FFFFE3E3E3C0C0C0000000E3E3E3C0C0C0808080C0C0C0C0C0C0969696000000
          FF00FFFF00FFFF00FFFF00FF9400FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF868686FFFFFF000000E3E3E3C0C0C0808080C0C0C0C0C0C0C0C0C09696
          96000000FF00FFFF00FFFF00FFFF00FF6600FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF868686FFFFFFE3E3E3808080C0C0C0C0C0C0C0C0C096
          9696000000FF00FFFF00FFFF00FFFF00FFFF00FF6600FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF868686FFFFFFE3E3E3E3E3E3C0C0C0
          969696000000969696000000FF00FFFF00FFFF00FFFF00FF9900FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF868686FFFFFFFFFF
          FF969696000000868686E3E3E3969696000000FF00FFFF00FFFF00FF9900FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF86
          8686868686868686FF00FFFF00FF868686E3E3E3969696000000FF00FFFF00FF
          CC00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF868686E3E3E39696960000
          00FF00FFCC00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF868686E3
          E3E3000000FF00FFCC00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF868686FF00FFFF00FFFF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00}
        Margin = 5
        ParentFont = False
        OnClick = SPB_ClientesClick
      end
      object Label19: TLabel
        Left = 16
        Top = 97
        Width = 33
        Height = 16
        Caption = 'CEP.:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object EDT_Nome: TEdit
        Left = 16
        Top = 76
        Width = 440
        Height = 21
        TabOrder = 3
      end
      object EDT_Endereco: TEdit
        Left = 172
        Top = 113
        Width = 434
        Height = 21
        TabOrder = 7
      end
      object EDT_Bairro: TEdit
        Left = 16
        Top = 150
        Width = 292
        Height = 21
        TabOrder = 8
      end
      object EDT_Cidade: TEdit
        Left = 315
        Top = 150
        Width = 292
        Height = 21
        TabOrder = 9
      end
      object EDT_Ponto: TEdit
        Left = 16
        Top = 188
        Width = 591
        Height = 21
        TabOrder = 10
      end
      object EDT_Pedido: TEdit
        Left = 650
        Top = 37
        Width = 121
        Height = 32
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 11
      end
      object QRShape1: TQRShape
        Left = 646
        Top = 13
        Width = 1
        Height = 277
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          732.895833333333
          1709.20833333333
          34.3958333333333
          2.64583333333333)
        Shape = qrsVertLine
      end
      object EDT_Telefone: TEdit
        Left = 464
        Top = 76
        Width = 141
        Height = 21
        TabOrder = 4
      end
      object QRShape2: TQRShape
        Left = 17
        Top = 56
        Width = 623
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.64583333333333
          44.9791666666667
          148.166666666667
          1648.35416666667)
        Shape = qrsHorLine
      end
      object DBLC_Telefone: TDBLookupComboBox
        Left = 16
        Top = 30
        Width = 145
        Height = 21
        KeyField = 'CODIGO_ID'
        ListField = 'TELEFONE'
        ListSource = DTS_Cliente
        TabOrder = 0
        OnExit = DBLC_TelefoneExit
      end
      object DBLC_Cliente: TDBLookupComboBox
        Left = 184
        Top = 30
        Width = 425
        Height = 21
        KeyField = 'CODIGO_ID'
        ListField = 'NOMEFANTASIA'
        ListSource = DTS_Cliente
        TabOrder = 1
        OnEnter = DBLC_ClienteEnter
        OnExit = DBLC_ClienteExit
      end
      object BTN_BuscaDados: TButton
        Left = 617
        Top = 31
        Width = 19
        Height = 19
        Caption = '...'
        TabOrder = 2
        OnClick = BTN_BuscaDadosClick
      end
      object CHK_Cliente: TCheckBox
        Left = 544
        Top = 226
        Width = 61
        Height = 17
        Caption = 'Cliente'
        TabOrder = 14
      end
      object DBLC_Entregador: TDBLookupComboBox
        Left = 16
        Top = 264
        Width = 521
        Height = 21
        KeyField = 'CODIGO_ID'
        ListField = 'DESCRICAO'
        ListSource = FRM_Modulo.DTS_Funcionario
        TabOrder = 15
        OnEnter = DBLC_ClienteEnter
        OnExit = DBLC_ClienteExit
      end
      object CHK_Baixa: TCheckBox
        Left = 544
        Top = 266
        Width = 61
        Height = 17
        Caption = 'Baixa'
        TabOrder = 16
      end
      object EDT_HREntrega: TEdit
        Left = 279
        Top = 226
        Width = 256
        Height = 21
        TabOrder = 13
      end
      object DTP_DTEntrega: TDateTimePicker
        Left = 16
        Top = 226
        Width = 255
        Height = 21
        CalAlignment = dtaLeft
        Date = 38841.7056510417
        Time = 38841.7056510417
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 12
      end
      object BTN_Atualizar: TBitBtn
        Left = 165
        Top = 29
        Width = 19
        Height = 23
        TabOrder = 19
        OnClick = BTN_AtualizarClick
        Glyph.Data = {
          0E060000424D0E06000000000000360000002800000016000000160000000100
          180000000000D8050000B0070000B00700000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2CF0FF00
          FFFF00FFFF00FF00000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000FF00FFFF00FF
          CC16FF00FFFF00FFFF00FF7F7F7FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCF
          CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCF000000FF00
          FFFF00FFDDDDFF00FFFF00FFFF00FF7F7F7FFFFFFFFFFFFF90FFFFFFFFFF90FF
          FFFFFFFF90FFFFFFFFFF90FFFFFFFFFF90FFFFFFFFFF90FFFFFFFFFFCFCFCF00
          0000FF00FFFF00FF3800FF00FFFF00FFFF00FF7F7F7FFFFFFF90FFFFFFFFFF90
          FFFFFFFFFF90FFFFFFFFFF00902FFFFFFF90FFFFFFFFFF90FFFFFFFFFF90FFFF
          CFCFCF000000FF00FFFF00FFD600FF00FFFF00FFFF00FF7F7F7FFFFFFFFFFFFF
          90FFFFFFFFFF90FFFFFFFFFF00902F00902FFFFFFFFFFFFF90FFFFFFFFFF90FF
          FFFFFFFFCFCFCF000000FF00FFFF00FF3168FF00FFFF00FFFF00FF7F7F7FFFFF
          FF90FFFFFFFFFF90FFFFFFFFFF00902F00902F00902F00902F00902FFFFFFF90
          FFFFFFFFFF90FFFFCFCFCF000000FF00FFFF00FF6F63FF00FFFF00FFFF00FF7F
          7F7FFFFFFFFFFFFF90FFFFFFFFFF90FFFFFFFFFF00902F00902FFFFFFF609000
          606000FFFFFF90FFFFFFFFFFCFCFCF000000FF00FFFF00FFCD92FF00FFFF00FF
          FF00FF7F7F7FFFFFFFFFFFFFFFFFFF90FFFFFFFFFF90FFFFFFFFFF00902FFFFF
          FFFFFFFF60600090FFFFFFFFFF90FFFFCFCFCF000000FF00FFFF00FF8B37FF00
          FFFF00FFFF00FF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF90FFFFFFFFFF90FFFFFF
          FFFF90FFFFFFFFFF606000FFFFFF90FFFFFFFFFFCFCFCF000000FF00FFFF00FF
          8007FF00FFFF00FFFF00FF7F7F7FFFFFFF90FFFFFFFFFF90FFFF60600090FFFF
          FFFFFF90FFFFFFFFFF90FFFFFFFFFF90FFFFFFFFFF90FFFFCFCFCF000000FF00
          FFFF00FFFF00FF00FFFF00FFFF00FF7F7F7FFFFFFFFFFFFF90FFFFFFFFFF6060
          00FFFFFFFFFFFF00902FFFFFFFFFFFFF90FFFFFFFFFF90FFFFFFFFFFCFCFCF00
          0000FF00FFFF00FFFF00FF00FFFF00FFFF00FF7F7F7FFFFFFF90FFFFFFFFFF90
          FFFF606000609000FFFFFF00902F00902FFFFFFFFFFFFF90FFFFFFFFFF90FFFF
          CFCFCF000000FF00FFFF00FF9400FF00FFFF00FFFF00FF7F7F7FFFFFFFFFFFFF
          90FFFFFFFFFFFFFFFF00902F00902F00902F00902F00902F90FFFFFFFFFF90FF
          FFFFFFFFCFCFCF000000FF00FFFF00FF6600FF00FFFF00FFFF00FF7F7F7FFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00902F00902FFFFFFFFFFFFF90
          FFFFCFCFCFCFCFCFCFCFCF000000FF00FFFF00FF6600FF00FFFF00FFFF00FF7F
          7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF90FFFF00902FFFFFFFFFFFFF
          90FFFF000000000000000000000000000000FF00FFFF00FF9900FF00FFFF00FF
          FF00FF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF90FFFFFFFF
          FF90FFFFFFFFFF7F7F7FFFFFFFFFFFFF000000FF00FFFF00FFFF00FF9900FF00
          FFFF00FFFF00FF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF90FFFFFFFFFFFFFFFF7F7F7FFFFFFF000000FF00FFFF00FFFF00FFFF00FF
          CC00FF00FFFF00FFFF00FF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F000000FF00FFFF00FFFF00FFFF00
          FFFF00FFCC00FF00FFFF00FFFF00FF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFCC00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00}
      end
      object EDT_CEP: TEdit
        Left = 16
        Top = 112
        Width = 127
        Height = 21
        TabOrder = 5
      end
      object BTN_BuscaCEP: TBitBtn
        Left = 144
        Top = 112
        Width = 21
        Height = 21
        Caption = '...'
        TabOrder = 6
        OnClick = BTN_BuscaCEPClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 5
      Top = 300
      Width = 777
      Height = 121
      Align = alTop
      TabOrder = 1
      object Label8: TLabel
        Left = 102
        Top = 13
        Width = 50
        Height = 16
        Caption = 'Produto:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 366
        Top = 13
        Width = 73
        Height = 16
        Caption = 'Quantidade:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 444
        Top = 13
        Width = 39
        Height = 16
        Caption = 'Pre'#231'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 15
        Top = 56
        Width = 78
        Height = 16
        Caption = 'Observa'#231#227'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 16
        Top = 13
        Width = 47
        Height = 16
        Caption = 'Codigo:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label18: TLabel
        Left = 530
        Top = 13
        Width = 34
        Height = 16
        Caption = 'Total:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBLC_Produto: TDBLookupComboBox
        Left = 102
        Top = 28
        Width = 262
        Height = 21
        KeyField = 'CODIGO_ID'
        ListField = 'DESCRICAO'
        ListSource = DTS_Produtos1
        TabOrder = 1
        OnEnter = DBLC_ProdutoEnter
        OnExit = DBLC_ProdutoExit
      end
      object EDT_Quantidade: TEdit
        Left = 366
        Top = 28
        Width = 74
        Height = 21
        TabOrder = 2
        OnChange = EDT_QuantidadeChange
      end
      object EDT_Preco: TEdit
        Left = 444
        Top = 28
        Width = 83
        Height = 21
        TabOrder = 3
        OnChange = EDT_QuantidadeChange
      end
      object MMO_OBS: TMemo
        Left = 15
        Top = 70
        Width = 595
        Height = 41
        TabOrder = 4
      end
      object BTN_Incluir: TButton
        Left = 684
        Top = 38
        Width = 82
        Height = 25
        Caption = '&Incluir'
        TabOrder = 5
        OnClick = BTN_IncluirClick
      end
      object BTN_Limpar: TButton
        Left = 684
        Top = 88
        Width = 82
        Height = 25
        Caption = '&Limpar'
        TabOrder = 6
        OnClick = BTN_LimparClick
      end
      object BTN_Excluir: TButton
        Left = 684
        Top = 63
        Width = 82
        Height = 25
        Caption = '&Excluir'
        TabOrder = 7
        OnClick = BTN_ExcluirClick
      end
      object EDT_Codigo: TEdit
        Left = 16
        Top = 28
        Width = 83
        Height = 21
        TabOrder = 0
        OnChange = EDT_CodigoChange
      end
      object EDT_Total: TEdit
        Left = 530
        Top = 28
        Width = 80
        Height = 21
        Enabled = False
        TabOrder = 8
      end
      object BTN_Item: TButton
        Left = 684
        Top = 13
        Width = 82
        Height = 25
        Caption = '&Agrupar Itens'
        TabOrder = 9
        OnClick = BTN_ItemClick
      end
    end
    object Panel1: TPanel
      Left = 5
      Top = 539
      Width = 777
      Height = 17
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object LBL_SubTotal: TLabel
        Left = 0
        Top = 0
        Width = 777
        Height = 17
        Align = alClient
        Alignment = taRightJustify
        Caption = 'Sub-Total.: R$ 0,00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object DBGrid1: TDBGrid
      Left = 5
      Top = 421
      Width = 777
      Height = 118
      Align = alClient
      DataSource = DTS_Produtos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Descricao'
          Width = 224
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Quantidade'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Preco'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TotalProd'
          Title.Caption = 'Total'
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBS1'
          Width = 304
          Visible = True
        end>
    end
  end
  object SkinData1: TSkinData
    Active = False
    DisableTag = 99
    SkinControls = [xcMainMenu, xcPopupMenu, xcToolbar, xcControlbar, xcCombo, xcCheckBox, xcRadioButton, xcProgress, xcScrollbar, xcEdit, xcButton, xcBitBtn, xcSpeedButton, xcPanel, xcGroupBox, xcStatusBar, xcTab]
    SkinFile = 
      '\\Titan\desenv\desenv0\proj6\Fornecedora\PreVenda\Skin\mxskin34.' +
      'skn'
    SkinStore = '(none)'
    SkinFormtype = sfMainform
    Left = 416
    Top = 249
    SkinStream = {00000000}
  end
  object CDS_Produtos: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Produto'
        DataType = ftInteger
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 999
      end
      item
        Name = 'Quantidade'
        DataType = ftFloat
      end
      item
        Name = 'Preco'
        DataType = ftFloat
      end
      item
        Name = 'OBS'
        DataType = ftMemo
      end
      item
        Name = 'OBS1'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'ID'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnCalcFields = CDS_ProdutosCalcFields
    Left = 472
    Top = 249
    Data = {
      AC0000009619E0BD010000001800000007000000000003000000AC000750726F
      6475746F04000100000000000944657363726963616F02004900000001000557
      4944544802000200E7030A5175616E7469646164650800040000000000055072
      65636F0800040000000000034F425304004B0000000100075355425459504502
      00490005005465787400044F4253310100490000000100055749445448020002
      003C0002494404000100000000000000}
    object CDS_ProdutosProduto: TIntegerField
      FieldName = 'Produto'
    end
    object CDS_ProdutosDescricao: TStringField
      FieldName = 'Descricao'
      Size = 999
    end
    object CDS_ProdutosQuantidade: TFloatField
      FieldName = 'Quantidade'
      DisplayFormat = '###,###,###0.00'
    end
    object CDS_ProdutosPreco: TFloatField
      FieldName = 'Preco'
      currency = True
    end
    object CDS_ProdutosOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
    end
    object CDS_ProdutosOBS1: TStringField
      DisplayLabel = 'OBS'
      FieldName = 'OBS1'
      Size = 60
    end
    object CDS_ProdutosTotalProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalProd'
      currency = True
      Calculated = True
    end
    object CDS_ProdutosID: TIntegerField
      FieldName = 'ID'
    end
  end
  object DTS_Produtos: TDataSource
    DataSet = CDS_Produtos
    Left = 444
    Top = 249
  end
  object DTS_Cliente: TDataSource
    DataSet = IBQ_Cliente
    Left = 696
    Top = 92
  end
  object IBQ_Cliente: TIBTable
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'CLIFOR'
    Left = 724
    Top = 92
    object IBQ_ClienteCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBQ_ClienteNOMEFANTASIA: TIBStringField
      FieldName = 'NOMEFANTASIA'
      Required = True
      Size = 60
    end
    object IBQ_ClienteRAZAOSOCIAL: TIBStringField
      FieldName = 'RAZAOSOCIAL'
      Required = True
      Size = 60
    end
    object IBQ_ClienteCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Size = 30
    end
    object IBQ_ClienteCPF: TIBStringField
      FieldName = 'CPF'
      Size = 30
    end
    object IBQ_ClienteIE: TIBStringField
      FieldName = 'IE'
      Size = 30
    end
    object IBQ_ClienteRG: TIBStringField
      FieldName = 'RG'
      Size = 30
    end
    object IBQ_ClienteENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object IBQ_ClienteBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Size = 60
    end
    object IBQ_ClienteCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Size = 60
    end
    object IBQ_ClienteTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Size = 30
    end
    object IBQ_ClienteFAX: TIBStringField
      FieldName = 'FAX'
      Size = 30
    end
    object IBQ_ClienteCONTATO: TIBStringField
      FieldName = 'CONTATO'
      Size = 60
    end
    object IBQ_ClienteEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Size = 60
    end
    object IBQ_ClienteSITE: TIBStringField
      FieldName = 'SITE'
      Size = 60
    end
    object IBQ_ClienteATIVO: TIBStringField
      FieldName = 'ATIVO'
      Size = 1
    end
    object IBQ_ClienteCEP: TIBStringField
      FieldName = 'CEP'
      Size = 10
    end
    object IBQ_ClienteUF: TIBStringField
      FieldName = 'UF'
      Size = 2
    end
    object IBQ_ClienteTIPOCLIFOR: TIBStringField
      FieldName = 'TIPOCLIFOR'
      Size = 1
    end
    object IBQ_ClienteMATRICULA: TIBStringField
      FieldName = 'MATRICULA'
      Size = 25
    end
  end
  object IBT_Produtos1: TIBTable
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'PRODUTOS'
    Left = 724
    Top = 124
    object IBT_Produtos1CODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_Produtos1PRODUTO: TIBStringField
      FieldName = 'PRODUTO'
      Size = 13
    end
    object IBT_Produtos1DESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object IBT_Produtos1PRECO: TFloatField
      FieldName = 'PRECO'
    end
    object IBT_Produtos1PRECOCUSTO: TFloatField
      FieldName = 'PRECOCUSTO'
    end
    object IBT_Produtos1GRUPO: TIntegerField
      FieldName = 'GRUPO'
    end
    object IBT_Produtos1ICMS_SN: TIBStringField
      FieldName = 'ICMS_SN'
      Size = 1
    end
    object IBT_Produtos1TRIBUTAR: TIntegerField
      FieldName = 'TRIBUTAR'
    end
    object IBT_Produtos1BALANCA: TIBStringField
      FieldName = 'BALANCA'
      Size = 1
    end
    object IBT_Produtos1TARA: TFloatField
      FieldName = 'TARA'
    end
    object IBT_Produtos1UNIDADE: TIntegerField
      FieldName = 'UNIDADE'
    end
    object IBT_Produtos1ATIVO: TIBStringField
      FieldName = 'ATIVO'
      Size = 1
    end
    object IBT_Produtos1COMANDA: TIBStringField
      FieldName = 'COMANDA'
      Size = 1
    end
    object IBT_Produtos1LOCAL_IMP: TIntegerField
      FieldName = 'LOCAL_IMP'
    end
    object IBT_Produtos1DESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
    object IBT_Produtos1ACRESCIMO: TFloatField
      FieldName = 'ACRESCIMO'
    end
    object IBT_Produtos1PROD_MTN: TIntegerField
      FieldName = 'PROD_MTN'
    end
    object IBT_Produtos1ESTOQUE: TIBStringField
      FieldName = 'ESTOQUE'
      Size = 1
    end
    object IBT_Produtos1ESTNEGATIVO: TIBStringField
      FieldName = 'ESTNEGATIVO'
      Size = 1
    end
    object IBT_Produtos1ESTOQUE_FISICO: TFloatField
      FieldName = 'ESTOQUE_FISICO'
    end
    object IBT_Produtos1ESTOQUE_VIRTUAL: TFloatField
      FieldName = 'ESTOQUE_VIRTUAL'
    end
    object IBT_Produtos1ESTOQUEMIN: TFloatField
      FieldName = 'ESTOQUEMIN'
    end
    object IBT_Produtos1ESTOQUEMAX: TFloatField
      FieldName = 'ESTOQUEMAX'
    end
    object IBT_Produtos1TEMPO: TIBStringField
      FieldName = 'TEMPO'
      Required = True
      Size = 5
    end
    object IBT_Produtos1DIA_PROD: TIBStringField
      FieldName = 'DIA_PROD'
      Size = 1
    end
  end
  object DTS_Produtos1: TDataSource
    DataSet = IBT_Produtos1
    Left = 696
    Top = 124
  end
  object IBQ_Gravar: TIBQuery
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 664
    Top = 92
  end
  object IBQ_NumPedido: TIBQuery
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select gen_id(GEN_ENTREGA_PK,1) as XCod_ID'
      'from rdb$database')
    Left = 664
    Top = 120
    object IBQ_NumPedidoXCOD_ID: TLargeintField
      FieldName = 'XCOD_ID'
      Required = True
    end
  end
  object CDS_ProdutosMeio: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Produto'
        DataType = ftInteger
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Quantidade'
        DataType = ftFloat
      end
      item
        Name = 'Preco'
        DataType = ftFloat
      end
      item
        Name = 'PrecoTotal'
        DataType = ftCurrency
      end
      item
        Name = 'ID'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 471
    Top = 221
    Data = {
      9B0000009619E0BD0100000018000000060000000000030000009B000750726F
      6475746F04000100000000000944657363726963616F01004900000001000557
      49445448020002003C000A5175616E7469646164650800040000000000055072
      65636F08000400000000000A507265636F546F74616C08000400000001000753
      5542545950450200490006004D6F6E65790002494404000100000000000000}
    object CDS_ProdutosMeioProduto: TIntegerField
      FieldName = 'Produto'
    end
    object CDS_ProdutosMeioDescricao: TStringField
      FieldName = 'Descricao'
      Size = 60
    end
    object CDS_ProdutosMeioQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object CDS_ProdutosMeioPreco: TFloatField
      FieldName = 'Preco'
    end
    object CDS_ProdutosMeioPrecoTotal: TCurrencyField
      FieldName = 'PrecoTotal'
    end
    object CDS_ProdutosMeioID: TIntegerField
      FieldName = 'ID'
    end
  end
end
