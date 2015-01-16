object FRM_Entrega: TFRM_Entrega
  Left = 223
  Top = 73
  BorderStyle = bsDialog
  Caption = 'Entrega'
  ClientHeight = 604
  ClientWidth = 788
  Color = 12615680
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PNL_Entrega: TPanel
    Left = 0
    Top = 0
    Width = 788
    Height = 604
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 5
    Color = 12615680
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 5
      Top = 5
      Width = 778
      Height = 307
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 11
        Width = 61
        Height = 13
        Caption = 'Telefone:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 16
        Top = 80
        Width = 41
        Height = 13
        Caption = 'Nome:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 172
        Top = 117
        Width = 65
        Height = 13
        Caption = 'Endere'#231'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 16
        Top = 154
        Width = 44
        Height = 13
        Caption = 'Bairro:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 315
        Top = 154
        Width = 48
        Height = 13
        Caption = 'Cidade:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 16
        Top = 229
        Width = 66
        Height = 13
        Caption = 'Ponto Ref:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 700
        Top = 17
        Width = 66
        Height = 18
        Caption = 'Pedido:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SPB_Sair: TSpeedButton
        Left = 648
        Top = 216
        Width = 118
        Height = 28
        Caption = '&Sair'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
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
        Left = 648
        Top = 175
        Width = 118
        Height = 28
        Caption = '&Confirma'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Glyph.Data = {
          0E060000424D0E06000000000000360000002800000016000000160000000100
          180000000000D8050000B0070000B00700000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2CF0FF00
          FFFF00FF04040404040404040404040404040404040404040404040404040404
          0404040404040404040404040404040404040404040404040404FF00FFFF00FF
          CC16FF00FF3366666699996699996699994D4D4D333333333333333333333333
          333333333333333333333333B2B2B2B2B2B2B2B2B23333330066660066660404
          04FF00FFDDDDFF00FF3366666699996699996699994D4D4D4D4D4D4D4D4D3333
          33333333333333333333333333333333CCCCCCB2B2B2B2B2B233333300666600
          6666040404FF00FF3800FF00FF3366666699996699996699994D4D4D4D4D4D4D
          4D4D333333333333333333333333333333333333CCCCCCB2B2B2B2B2B2333333
          006666006666040404FF00FFD600FF00FF3366666699996699996699994D4D4D
          4D4D4D4D4D4D4D4D4D4D4D4D333333333333333333333333CCCCCCCCCCCCB2B2
          B2333333006666006666040404FF00FF3168FF00FF33666699CCCC6699996699
          994D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D333333CCCCCCCC
          CCCCB2B2B2333333006666006666040404FF00FF6F63FF00FF33666666999999
          CCCC6699994D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
          4D4D4D4D4D4D4D4D4D333333006666006666040404FF00FFCD92FF00FF336666
          99CCCC66999999CCCC6699996699996699996699996699996699996699996699
          99669999006666669999006666669999006666006666040404FF00FF8B37FF00
          FF33666666999999CCCC66999999CCCC99CCCC66999966999966999966999966
          9999669999669999669999669999669999336666669999006666040404FF00FF
          8007FF00FF33666699CCCC99CCCC99CCCC336666336666336666336666336666
          3366663366663366663366663366663366663366663366663366666699990404
          04FF00FFFF00FF00FF33666699CCCC99CCCC669999CCFFFFCCFFFFCCFFFF99FF
          FF99FFFF99FFFF99FFFF99FFFF99FFFF99FFFF99FFFF99FFFF33666666999933
          6666040404FF00FFFF00FF00FF336666CCFFFF99CCCC669999FFFFFFCCFFFFCC
          FFFFCCFFFFCCFFFF99FFFF99FFFF99FFFF99FFFF99FFFF99FFFF99FFFF336666
          336666669999040404FF00FF9400FF00FF336666CCFFFF99CCCC669999FFFFFF
          FFFFFFCCFFFFCCFFFFCCFFFFCCFFFFCCFFFF99FFFF99FFFF99FFFF99FFFF99FF
          FF336666669999006666040404FF00FF6600FF00FF336666CCFFFF99CCCC6699
          99FFFFFFFFFFFFFFFFFFFFFFFFCCFFFFCCFFFFCCFFFFCCFFFF99FFFF99FFFF99
          FFFF99FFFF336666669999669999040404FF00FF6600FF00FF336666CCFFFFCC
          FFFF669999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCFFFFCCFFFFCCFFFFCCFFFF
          99FFFF99FFFF99FFFF336666669999006666040404FF00FF9900FF00FF336666
          FFFFFFCCFFFF669999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCFFFFCCFF
          FFCCFFFFCCFFFF99FFFF99FFFF336666669999669999040404FF00FF9900FF00
          FF336666FFFFFFCCFFFF669999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFCCFFFFCCFFFFCCFFFFCCFFFF99FFFF336666669999669999040404FF00FF
          CC00FF00FF336666FFFFFFFFFFFF669999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFCCFFFFCCFFFFCCFFFF99FFFF3366663366663366660404
          04FF00FFCC00FF00FF33666699CCCCFFFFFF6699996699666699666699666699
          66669966669966669966669966669966669966669966669966336666C0C0C0FF
          FFFF040404FF00FFCC00FF00FF33666633666633666666999966996666996666
          9966669966669966669966669966669966669966669966669966669966336666
          336666336666040404FF00FFFF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00}
        Margin = 5
        ParentFont = False
        OnClick = SPB_ConfirmaClick
      end
      object Label12: TLabel
        Left = 464
        Top = 80
        Width = 61
        Height = 13
        Caption = 'Telefone:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 164
        Top = 11
        Width = 49
        Height = 13
        Caption = 'Cliente:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SPB_Manutencao: TSpeedButton
        Left = 648
        Top = 147
        Width = 118
        Height = 28
        Caption = 'ma&Nuten'#231#227'o'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
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
        Left = 208
        Top = 267
        Width = 77
        Height = 13
        Caption = 'Entregador:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 16
        Top = 268
        Width = 76
        Height = 13
        Caption = 'DT Entrega:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 111
        Top = 268
        Width = 76
        Height = 13
        Caption = 'HR Entrega:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SPB_Clientes: TSpeedButton
        Left = 648
        Top = 91
        Width = 118
        Height = 28
        Caption = 'C&Lientes'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Glyph.Data = {
          0E060000424D0E06000000000000360000002800000016000000160000000100
          180000000000D8050000B0070000B00700000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2CF0FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          CC16FF00FF040404040404040404040404040404040404040404040404040404
          040404040404040404040404040404040404040404040404040404040404FF00
          FFFF00FFDDDDFF00FF868686C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0868686040404868686C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C004
          0404FF00FFFF00FF3800FF00FF868686E3E3E3E3E3E399FFFFE3E3E399FFFF99
          999904040404040439393904040404040499999999FFFF99999999FFFF999999
          C0C0C0040404FF00FFFF00FFD600FF00FF868686E3E3E3040404040404040404
          040404040404C0C0C0C0C0C0393939C0C0C0C0C0C00404040404040404040404
          04040404040404040404040404FF00FF3168FF00FF868686E3E3E3868686C0C0
          C0C0C0C0C0C0C0C0C0C0E3E3E3999999393939999999E3E3E3C0C0C0C0C0C0C0
          C0C0C0C0C0040404FFCC33FFCC33040404FF00FF6F63FF00FF868686E3E3E386
          868699FFFFFFFFFF99FFFFE3E3E3800000800000393939C0C0C099FFFFFFFFFF
          99FFFFFFFFFFC0C0C0040404FFFF99FFCC33040404FF00FFCD92FF00FF868686
          E3E3E3868686FFFFFFFF9933800000800000E3E3E3999999393939999999FFFF
          FF99FFFFFFFFFF99FFFFC0C0C0040404CC6633CC6633040404FF00FF8B37FF00
          FF868686E3E3E386868699FFFFFFFFFF99FFFFE3E3E399FFFFC0C0C0393939C0
          C0C099FFFFFFFFFF99FFFFFFFFFFC0C0C004040499FFFF99FFFF040404FF00FF
          8007FF00FF868686E3E3E3868686FFFFFF99FFFFFFFFFF99FFFFE3E3E3999999
          39393980000080000099FFFFFFFFFF99FFFFC0C0C0040404FFFFFF99FFFF0404
          04FF00FFFF00FF00FF868686E3E3E3868686FFFFFFFFFFFF99FFFFE3E3E38000
          00800000393939C0C0C099FFFFFF0000FF0000FF9933C0C0C00404043399CC33
          99CC040404FF00FFFF00FF00FF868686E3E3E3868686FFFFFFFF9933FF0000FF
          0000E3E3E3999999393939999999FFFFFF99FFFFFFFFFF99FFFFC0C0C0040404
          C0C0C0C0C0C0040404FF00FF9400FF00FF868686E3E3E3868686FFFFFFFFFFFF
          FFFFFFE3E3E3FFFFFFC0C0C0393939800000800000FFFFFF99FFFFFFFFFFC0C0
          C0040404FFFFFFC0C0C0040404FF00FF6600FF00FF868686E3E3E3868686FFFF
          FFFFFFFFFFFFFFFFFFFFFF0000FF0000393939999999FFFFFFFF6633FF6633FF
          9933C0C0C0040404000099000099040404FF00FF6600FF00FF868686E3E3E386
          8686FFFFFFFF9933FF9933FF6633FFFFFF999999393939C0C0C0FFFFFFFFFFFF
          99FFFFFFFFFFC0C0C00404043300FF3300FF040404FF00FF9900FF00FF868686
          E3E3E3868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0393939C0C0C0FFFF
          FFFFFFFFFFFFFF99FFFFC0C0C00404046666FF3300FF040404FF00FF9900FF00
          FF868686868686868686FFFFFFFFFFFFFFFFFFFFFFFF868686868686FF00FF86
          8686868686FFFFFFFFFFFFFFFFFFC0C0C0040404868686868686040404FF00FF
          CC00FF00FFFF00FFFF00FF868686868686868686868686868686FF00FFFF00FF
          FF00FFFF00FFFF00FF868686868686868686868686868686FF00FFFF00FFFF00
          FFFF00FFCC00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFCC00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00}
        Margin = 5
        ParentFont = False
        OnClick = SPB_ClientesClick
      end
      object Label19: TLabel
        Left = 16
        Top = 116
        Width = 28
        Height = 13
        Caption = 'CEP:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SPB_AtualizarClientes: TSpeedButton
        Left = 648
        Top = 119
        Width = 118
        Height = 28
        Caption = 'a&Tualizar C.'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
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
        Margin = 5
        ParentFont = False
        OnClick = SPB_AtualizarClientesClick
      end
      object Label21: TLabel
        Left = 528
        Top = 117
        Width = 55
        Height = 13
        Caption = 'Numero:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label22: TLabel
        Left = 16
        Top = 191
        Width = 64
        Height = 13
        Caption = 'Conv'#234'nio:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EDT_Nome: TEdit
        Left = 16
        Top = 92
        Width = 440
        Height = 21
        TabOrder = 4
      end
      object EDT_Endereco: TEdit
        Left = 172
        Top = 129
        Width = 349
        Height = 21
        TabOrder = 8
      end
      object EDT_Bairro: TEdit
        Left = 16
        Top = 166
        Width = 292
        Height = 21
        TabOrder = 10
      end
      object EDT_Cidade: TEdit
        Left = 315
        Top = 166
        Width = 292
        Height = 21
        TabOrder = 11
      end
      object EDT_Ponto: TEdit
        Left = 16
        Top = 241
        Width = 591
        Height = 21
        TabOrder = 12
      end
      object EDT_Pedido: TEdit
        Left = 648
        Top = 37
        Width = 119
        Height = 32
        Color = 14352122
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 18
      end
      object QRShape1: TQRShape
        Left = 640
        Top = 13
        Width = 1
        Height = 285
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          754.0625
          1693.33333333333
          34.3958333333333
          2.64583333333333)
        Pen.Color = clWhite
        Shape = qrsVertLine
      end
      object EDT_Telefone: TEdit
        Left = 464
        Top = 92
        Width = 144
        Height = 21
        TabOrder = 5
      end
      object QRShape2: TQRShape
        Left = 17
        Top = 78
        Width = 590
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.64583333333333
          44.9791666666667
          206.375
          1561.04166666667)
        Pen.Color = clWhite
        Shape = qrsHorLine
      end
      object DBLC_Cliente: TDBLookupComboBox
        Left = 164
        Top = 23
        Width = 424
        Height = 21
        Color = 14352122
        KeyField = 'CODIGO_ID'
        ListField = 'NOMEFANTASIA'
        ListSource = DTS_Cliente
        TabOrder = 1
        OnEnter = DBLC_ClienteEnter
        OnExit = DBLC_ClienteExit
      end
      object BTN_BuscaDados: TButton
        Left = 589
        Top = 24
        Width = 19
        Height = 19
        Caption = '...'
        TabOrder = 3
        OnClick = BTN_BuscaDadosClick
      end
      object CHK_Cliente: TCheckBox
        Left = 536
        Top = 282
        Width = 72
        Height = 17
        Caption = 'Cliente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 17
      end
      object DBLC_Entregador: TDBLookupComboBox
        Left = 208
        Top = 280
        Width = 249
        Height = 21
        Color = 14352122
        KeyField = 'CODIGO_ID'
        ListField = 'DESCRICAO'
        ListSource = FRM_Modulo.DTS_Funcionario
        TabOrder = 15
        OnEnter = DBLC_ClienteEnter
        OnExit = DBLC_ClienteExit
      end
      object CHK_Baixa: TCheckBox
        Left = 470
        Top = 285
        Width = 63
        Height = 17
        Caption = 'Baixa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 16
      end
      object EDT_HREntrega: TEdit
        Left = 111
        Top = 280
        Width = 90
        Height = 21
        TabOrder = 14
      end
      object DTP_DTEntrega: TDateTimePicker
        Left = 16
        Top = 280
        Width = 89
        Height = 21
        CalAlignment = dtaLeft
        Date = 38841.7056510417
        Time = 38841.7056510417
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 13
      end
      object EDT_CEP: TEdit
        Left = 16
        Top = 128
        Width = 127
        Height = 21
        TabOrder = 6
      end
      object BTN_BuscaCEP: TBitBtn
        Left = 145
        Top = 129
        Width = 21
        Height = 21
        Caption = '...'
        TabOrder = 7
        OnClick = BTN_BuscaCEPClick
      end
      object DBLC_End: TDBLookupComboBox
        Left = 16
        Top = 50
        Width = 572
        Height = 21
        Color = 14352122
        KeyField = 'CODIGO_ID'
        ListField = 'ENDERECO'
        ListSource = DTS_Cliente
        TabOrder = 2
        OnExit = DBLC_EndExit
      end
      object EDT_Telefone1: TEdit
        Left = 16
        Top = 24
        Width = 129
        Height = 21
        Color = 14352122
        TabOrder = 0
        OnExit = EDT_Telefone1Exit
      end
      object EDT_Numero: TEdit
        Left = 528
        Top = 129
        Width = 79
        Height = 21
        TabOrder = 9
      end
    end
    object GroupBox2: TGroupBox
      Left = 5
      Top = 312
      Width = 778
      Height = 176
      Align = alTop
      TabOrder = 1
      object Label8: TLabel
        Left = 90
        Top = 7
        Width = 55
        Height = 13
        Caption = 'Produto:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 378
        Top = 7
        Width = 30
        Height = 13
        Caption = 'QTD:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 4
        Top = 43
        Width = 41
        Height = 13
        Caption = 'Pre'#231'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 475
        Top = 7
        Width = 81
        Height = 13
        Caption = 'Observa'#231#227'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 4
        Top = 7
        Width = 48
        Height = 13
        Caption = 'Codigo:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 90
        Top = 43
        Width = 37
        Height = 13
        Caption = 'Total:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label20: TLabel
        Left = 651
        Top = 103
        Width = 78
        Height = 13
        Caption = 'Qtd Peda'#231'os:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBLC_Produto: TDBLookupComboBox
        Left = 90
        Top = 20
        Width = 285
        Height = 21
        KeyField = 'CODIGO_ID'
        ListField = 'DESCRICAO'
        ListSource = DTS_Produtos1
        TabOrder = 4
        OnEnter = DBLC_ProdutoEnter
        OnExit = DBLC_ProdutoExit
      end
      object EDT_Quantidade: TEdit
        Left = 378
        Top = 20
        Width = 95
        Height = 21
        TabOrder = 1
        OnChange = EDT_QuantidadeChange
        OnExit = EDT_QuantidadeExit
      end
      object EDT_Preco: TEdit
        Left = 4
        Top = 56
        Width = 83
        Height = 21
        TabOrder = 5
        OnChange = EDT_QuantidadeChange
        OnExit = EDT_PrecoExit
      end
      object MMO_OBS: TMemo
        Left = 474
        Top = 20
        Width = 161
        Height = 63
        TabOrder = 7
        OnExit = MMO_OBSExit
      end
      object BTN_Incluir: TButton
        Left = 651
        Top = 11
        Width = 114
        Height = 22
        Caption = '&Incluir'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = BTN_IncluirClick
      end
      object BTN_Limpar: TButton
        Left = 651
        Top = 55
        Width = 114
        Height = 22
        Caption = '&Limpar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        OnClick = BTN_LimparClick
      end
      object BTN_Excluir: TButton
        Left = 651
        Top = 33
        Width = 114
        Height = 22
        Caption = '&Excluir'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnClick = BTN_ExcluirClick
      end
      object EDT_Codigo: TEdit
        Left = 4
        Top = 20
        Width = 83
        Height = 21
        TabOrder = 0
        OnChange = EDT_CodigoChange
        OnExit = EDT_CodigoExit
      end
      object EDT_Total: TEdit
        Left = 90
        Top = 56
        Width = 155
        Height = 21
        Enabled = False
        TabOrder = 11
      end
      object BTN_Item: TButton
        Left = 651
        Top = 147
        Width = 114
        Height = 22
        Caption = '&Agrupar Itens'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        OnClick = BTN_ItemClick
      end
      object DBG_Temp: TDBGrid
        Left = 4
        Top = 84
        Width = 630
        Height = 86
        Color = clCream
        DataSource = DTS_ProdutosMontar
        FixedColor = 12615680
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        PopupMenu = PPP_MPizza
        TabOrder = 12
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'Verdana'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'Descricao'
            Width = 289
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Quantidade'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Preco'
            Width = 149
            Visible = True
          end>
      end
      object RDG_Montar: TRadioGroup
        Left = 252
        Top = 42
        Width = 221
        Height = 43
        Caption = ' M o n t a r  '
        Columns = 2
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ItemIndex = 0
        Items.Strings = (
          'Sim C\Pre'#231'o'
          'N'#227'o'
          'Sim S\Pre'#231'o')
        ParentFont = False
        TabOrder = 6
        OnExit = RDG_MontarExit
      end
      object QRShape3: TQRShape
        Left = 640
        Top = 13
        Width = 1
        Height = 153
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          404.8125
          1693.33333333333
          34.3958333333333
          2.64583333333333)
        Pen.Color = clWhite
        Shape = qrsVertLine
      end
      object BTN_Montar: TButton
        Left = 651
        Top = 125
        Width = 114
        Height = 22
        Caption = '&Montar ( + )'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = BTN_MontarClick
      end
      object EDT_Pedacos: TEdit
        Left = 731
        Top = 100
        Width = 33
        Height = 21
        TabOrder = 14
        Text = '1'
      end
    end
    object Panel1: TPanel
      Left = 5
      Top = 582
      Width = 778
      Height = 17
      Align = alBottom
      BevelOuter = bvNone
      Color = 12615680
      TabOrder = 2
      object LBL_SubTotal: TLabel
        Left = 0
        Top = 0
        Width = 778
        Height = 17
        Align = alClient
        Alignment = taRightJustify
        Caption = 'Sub-Total.: R$ 0,00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object DBG_Itens: TDBGrid
      Left = 5
      Top = 488
      Width = 778
      Height = 88
      Align = alTop
      Color = clCream
      DataSource = DTS_Produtos
      FixedColor = 12615680
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgMultiSelect]
      ParentFont = False
      TabOrder = 3
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWhite
      TitleFont.Height = -11
      TitleFont.Name = 'Verdana'
      TitleFont.Style = [fsBold]
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
          Width = 79
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
          Width = 294
          Visible = True
        end>
    end
    object DBLC_Convenio: TDBLookupComboBox
      Left = 21
      Top = 209
      Width = 591
      Height = 21
      KeyField = 'CODIGO_ID'
      ListField = 'NOMEEMPRESA'
      ListSource = DTS_Convenio
      TabOrder = 4
    end
  end
  object SkinData1: TSkinData
    Active = False
    DisableTag = 99
    SkinControls = [xcMainMenu, xcPopupMenu, xcToolbar, xcControlbar, xcCombo, xcCheckBox, xcRadioButton, xcProgress, xcScrollbar, xcEdit, xcButton, xcBitBtn, xcSpeedButton, xcPanel, xcGroupBox, xcStatusBar, xcTab]
    Options = [xoPreview, xoToolbarBK, xoCaptionButtonHint]
    Skin3rd.Strings = (
      'TCategoryButtons=scrollbar'
      'TPngSpeedbutton=pngspeedbutton'
      'TPngBitBtn=pngbitbtn'
      'TVirtualStringTree=scrollbar'
      'TVirtualDrawTree=scrollbar'
      'TTBXDockablePanel=Panel'
      'TAdvPanelGroup=scrollbar'
      'TComboboxex=combobox'
      'TRxSpeedButton=speedbutton'
      'THTMLViewer=scrollbar'
      'TDBCtrlGrid=scrollbar'
      'TfrSpeedButton=speedbutton'
      'TfrTBButton=speedbutton'
      'TControlBar=Panel'
      'TTBDock=Panel'
      'TTBToolbar=Panel'
      'TImageEnMView=scrollbar'
      'TImageEnView=scrollbar'
      'TAdvMemo=scrollbar'
      'TDBAdvMemo=scrollbar'
      'TcxDBLookupComboBox=combobox'
      'TcxDBComboBox=combobox'
      'TcxDBDateEdit=combobox'
      'TcxDBImageComboBox=combobox'
      'TcxDBCalcEdit=combobox'
      'TcxDBBlobEdit=combobox'
      'TcxDBPopupEdit=combobox'
      'TcxDBFontNameComboBox=combobox'
      'TcxDBShellComboBox=combobox'
      'TRxLookupEdit=combobox'
      'TRxDBLookupCombo=combobox'
      'TRzGroup=panel'
      'TRzButton=button'
      'TRzBitbtn=bitbtn'
      'TRzMenuButton=menubtn'
      'TRzCheckGroup=CheckGroup'
      'TRzRadioGroup=Radiogroup'
      'TRzButtonEdit=Edit'
      'TRzDBRadioGroup=Radiogroup'
      'TRzDBRadioButton=Radiobutton'
      'TRzDateTimeEdit=combobox'
      'TRzColorEdit=combobox'
      'TRzDateTimePicker=combobox'
      'TRzDBDateTimeEdit=combobox'
      'TRzDbColorEdit=combobox'
      'TRzDBDateTimePicker=combobox'
      'TLMDButton=bitbtn'
      'TLMDGroupBox=Groupbox'
      'TDBCheckboxEh=Checkbox'
      'TDBCheckboxEh=Checkbox'
      'TLMDCHECKBOX=Checkbox'
      'TLMDDBCHECKBOX=Checkbox'
      'TLMDRadiobutton=Radiobutton'
      'TLMDCalculator=panel'
      'TLMDGROUPBOX=Panel'
      'TLMDSIMPLEPANEL=Panel'
      'TLMDDBCalendar=Panel'
      'TLMDButtonPanel=Panel'
      'TLMDLMDCalculator=Panel'
      'TLMDHeaderPanel=Panel'
      'TLMDTechnicalLine=Panel'
      'TLMDLMDClock=Panel'
      'TLMDTrackbar=panel'
      'TLMDListCombobox=combobox'
      'TLMDCheckListCombobox=combobox'
      'TLMDHeaderListCombobox=combobox'
      'TLMDImageCombobox=combobox'
      'TLMDColorCombobox=combobox'
      'TLMDFontCombobox=combobox'
      'TLMDFontSizeCombobox=combobox'
      'TLMDFontSizeCombobox=combobox'
      'TLMDPrinterCombobox=combobox'
      'TLMDDriveCombobox=combobox'
      'TLMDCalculatorComboBox=combobox'
      'TLMDTrackBarComboBox=combobox'
      'TLMDCalendarComboBox=combobox'
      'TLMDTreeComboBox=combobox'
      'TLMDRADIOGROUP=radiogroup'
      'TLMDCheckGroup=CheckGroup'
      'TLMDDBRADIOGROUP=radiogroup'
      'TLMDDBCheckGroup=CheckGroup'
      'TLMDCalculatorEdit=edit'
      'TLMDEDIT=Edit'
      'TLMDMASKEDIT=Edit'
      'TLMDBROWSEEDIT=Edit'
      'TLMDEXTSPINEDIT=Edit'
      'TLMDCALENDAREDIT=Edit'
      'TLMDFILEOPENEDIT=Edit'
      'TLMDFILESAVEEDIT=Edit'
      'TLMDCOLOREDIT=Edit'
      'TLMDDBEDIT=Edit'
      'TLMDDBMASKEDIT=Edit'
      'TLMDDBEXTSPINEDIT=Edit'
      'TLMDDBSPINEDIT=Edit'
      'TLMDDBEDITDBLookup=Edit'
      'TLMDEDITDBLookup=Edit'
      'TDBLookupCombobox=Combobox'
      'TWWDBCombobox=Combobox'
      'TWWDBLookupCombo=Combobox'
      'TWWDBCombobox=Combobox'
      'TWWKeyCombo=Combobox'
      'TWWTempKeyCombo=combobox'
      'TWWDBDateTimePicker=Combobox'
      'TWWRADIOGROUP=radiogroup'
      'TWWDBEDIT=Edit'
      'TcxButton=bitbtn'
      'TcxDBRadioGroup=radiogroup'
      'TcxRadioGroup=radiogroup'
      'TcxGroupbox=groupbox'
      'TOVCPICTUREFIELD=Edit'
      'TOVCDBPICTUREFIELD=Edit'
      'TOVCSLIDEREDIT=Edit'
      'TOVCDBSLIDEREDIT=Edit'
      'TOVCSIMPLEFIELD=Edit'
      'TOVCDBSIMPLEFIELD=Edit'
      'TO32DBFLEXEDIT=Edit'
      'TOVCNUMERICFIELD=Edit'
      'TOVCDBNUMERICFIELD=Edit')
    SkinFile = 
      '\\Titan\desenv\desenv0\proj6\Fornecedora\PreVenda\Skin\mxskin34.' +
      'skn'
    SkinStore = '(none)'
    SkinFormtype = sfMainform
    Version = '5.40.07.15'
    MenuUpdate = True
    MenuMerge = False
    Left = 48
    Top = 477
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
    Left = 20
    Top = 449
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
    Left = 48
    Top = 449
  end
  object DTS_Cliente: TDataSource
    DataSet = IBQ_Cliente
    Left = 695
    Top = 28
  end
  object IBQ_Cliente: TIBTable
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'CLIFOR'
    Left = 723
    Top = 28
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
    object IBQ_ClienteOBSERVACAO: TBlobField
      FieldName = 'OBSERVACAO'
    end
    object IBQ_ClienteNUMEROCASA: TIBStringField
      FieldName = 'NUMEROCASA'
      Size = 30
    end
    object IBQ_ClienteTEL_DELIVERY: TIBStringField
      FieldName = 'TEL_DELIVERY'
      Size = 30
    end
    object IBQ_ClienteMENSALISTAS_N: TIBStringField
      FieldName = 'MENSALISTAS_N'
      Size = 1
    end
    object IBQ_ClienteCONVENIO: TIntegerField
      FieldName = 'CONVENIO'
    end
  end
  object IBT_Produtos1: TIBTable
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'PRODUTOS'
    Left = 723
    Top = 56
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
    object IBT_Produtos1MONTAR: TIBStringField
      FieldName = 'MONTAR'
      Size = 1
    end
  end
  object DTS_Produtos1: TDataSource
    DataSet = IBT_Produtos1
    Left = 695
    Top = 56
  end
  object IBQ_Gravar: TIBQuery
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 667
    Top = 28
  end
  object IBQ_NumPedido: TIBQuery
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select gen_id(GEN_ENTREGA_PK,1) as XCod_ID'
      'from rdb$database')
    Left = 667
    Top = 56
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
      end
      item
        Name = 'OBS1'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'OBS'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 20
    Top = 477
    Data = {
      CC0000009619E0BD010000001800000008000000000003000000CC000750726F
      6475746F04000100000000000944657363726963616F01004900000001000557
      49445448020002003C000A5175616E7469646164650800040000000000055072
      65636F08000400000000000A507265636F546F74616C08000400000001000753
      5542545950450200490006004D6F6E6579000249440400010000000000044F42
      53310100490000000100055749445448020002003C00034F4253010049000000
      0100055749445448020002003C000000}
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
    object CDS_ProdutosMeioOBS1: TStringField
      FieldName = 'OBS1'
      Size = 60
    end
    object CDS_ProdutosMeioOBS: TStringField
      FieldName = 'OBS'
      Size = 60
    end
  end
  object CDS_ProdutosMontar: TClientDataSet
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
    Left = 24
    Top = 357
    Data = {
      AC0000009619E0BD010000001800000007000000000003000000AC000750726F
      6475746F04000100000000000944657363726963616F02004900000001000557
      4944544802000200E7030A5175616E7469646164650800040000000000055072
      65636F0800040000000000034F425304004B0000000100075355425459504502
      00490005005465787400044F4253310100490000000100055749445448020002
      003C0002494404000100000000000000}
    object CDS_ProdutosMontarProduto: TIntegerField
      FieldName = 'Produto'
    end
    object CDS_ProdutosMontarDescricao: TStringField
      FieldName = 'Descricao'
      Size = 999
    end
    object CDS_ProdutosMontarQuantidade: TFloatField
      FieldName = 'Quantidade'
      DisplayFormat = '###,###,###0.00'
    end
    object CDS_ProdutosMontarPreco: TFloatField
      FieldName = 'Preco'
      currency = True
    end
    object CDS_ProdutosMontarOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
    end
    object CDS_ProdutosMontarOBS1: TStringField
      FieldName = 'OBS1'
      Size = 60
    end
    object CDS_ProdutosMontarID: TIntegerField
      FieldName = 'ID'
    end
  end
  object DTS_ProdutosMontar: TDataSource
    DataSet = CDS_ProdutosMontar
    Left = 52
    Top = 357
  end
  object PPP_MPizza: TPopupMenu
    Left = 24
    Top = 384
    object Deletar1: TMenuItem
      Caption = 'Deletar'
      OnClick = Deletar1Click
    end
    object Limpar1: TMenuItem
      Caption = 'Limpar'
      OnClick = Limpar1Click
    end
  end
  object IBQ_Aniver: TIBQuery
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CLIFOR')
    Left = 639
    Top = 28
    object IBQ_AniverCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'CLIFOR.CODIGO_ID'
      Required = True
    end
    object IBQ_AniverNOMEFANTASIA: TIBStringField
      FieldName = 'NOMEFANTASIA'
      Origin = 'CLIFOR.NOMEFANTASIA'
      Required = True
      Size = 60
    end
    object IBQ_AniverRAZAOSOCIAL: TIBStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'CLIFOR.RAZAOSOCIAL'
      Required = True
      Size = 60
    end
    object IBQ_AniverCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = 'CLIFOR.CNPJ'
      Size = 30
    end
    object IBQ_AniverCPF: TIBStringField
      FieldName = 'CPF'
      Origin = 'CLIFOR.CPF'
      Size = 30
    end
    object IBQ_AniverIE: TIBStringField
      FieldName = 'IE'
      Origin = 'CLIFOR.IE'
      Size = 30
    end
    object IBQ_AniverRG: TIBStringField
      FieldName = 'RG'
      Origin = 'CLIFOR.RG'
      Size = 30
    end
    object IBQ_AniverENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = 'CLIFOR.ENDERECO'
      Size = 60
    end
    object IBQ_AniverBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = 'CLIFOR.BAIRRO'
      Size = 60
    end
    object IBQ_AniverCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = 'CLIFOR.CIDADE'
      Size = 60
    end
    object IBQ_AniverTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Origin = 'CLIFOR.TELEFONE'
      Size = 30
    end
    object IBQ_AniverFAX: TIBStringField
      FieldName = 'FAX'
      Origin = 'CLIFOR.FAX'
      Size = 30
    end
    object IBQ_AniverCONTATO: TIBStringField
      FieldName = 'CONTATO'
      Origin = 'CLIFOR.CONTATO'
      Size = 60
    end
    object IBQ_AniverEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'CLIFOR.EMAIL'
      Size = 60
    end
    object IBQ_AniverSITE: TIBStringField
      FieldName = 'SITE'
      Origin = 'CLIFOR.SITE'
      Size = 60
    end
    object IBQ_AniverATIVO: TIBStringField
      FieldName = 'ATIVO'
      Origin = 'CLIFOR.ATIVO'
      Required = True
      Size = 1
    end
    object IBQ_AniverCEP: TIBStringField
      FieldName = 'CEP'
      Origin = 'CLIFOR.CEP'
      Size = 10
    end
    object IBQ_AniverUF: TIBStringField
      FieldName = 'UF'
      Origin = 'CLIFOR.UF'
      Size = 2
    end
    object IBQ_AniverTIPOCLIFOR: TIBStringField
      FieldName = 'TIPOCLIFOR'
      Origin = 'CLIFOR.TIPOCLIFOR'
      Required = True
      Size = 1
    end
    object IBQ_AniverMATRICULA: TIBStringField
      FieldName = 'MATRICULA'
      Origin = 'CLIFOR.MATRICULA'
      Size = 25
    end
    object IBQ_AniverTP_PESSOAL: TIBStringField
      FieldName = 'TP_PESSOAL'
      Origin = 'CLIFOR.TP_PESSOAL'
      Size = 1
    end
    object IBQ_AniverCELULAR: TIBStringField
      FieldName = 'CELULAR'
      Origin = 'CLIFOR.CELULAR'
      Size = 30
    end
    object IBQ_AniverDATA_NASC: TDateField
      FieldName = 'DATA_NASC'
      Origin = 'CLIFOR.DATA_NASC'
    end
    object IBQ_AniverTEL_DELIVERY: TIBStringField
      FieldName = 'TEL_DELIVERY'
      Origin = 'CLIFOR.TEL_DELIVERY'
      Size = 30
    end
    object IBQ_AniverNUMEROCASA: TIBStringField
      FieldName = 'NUMEROCASA'
      Origin = 'CLIFOR.NUMEROCASA'
      Size = 30
    end
    object IBQ_AniverMENSALISTAS_N: TIBStringField
      FieldName = 'MENSALISTAS_N'
      Origin = 'CLIFOR.MENSALISTAS_N'
      Size = 1
    end
  end
  object IBQ_GravaCond: TIBQuery
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 152
    Top = 360
  end
  object DTS_CondPagto: TDataSource
    Left = 120
    Top = 392
  end
  object IBQ_DelCondPagto: TIBQuery
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 152
    Top = 392
  end
  object IBQ_VoltaNumPedido: TIBQuery
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select gen_id(GEN_ENTREGA_PK,0) as XVolta_ID'
      'from rdb$database')
    Left = 639
    Top = 56
    object IBQ_VoltaNumPedidoXVOLTA_ID: TLargeintField
      FieldName = 'XVOLTA_ID'
      Required = True
    end
  end
  object CDS_Entrega: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Nome'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'ID_Cliente'
        DataType = ftInteger
      end
      item
        Name = 'ID_Pedido'
        DataType = ftInteger
      end
      item
        Name = 'COK'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Seq_Fiscal'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 432
    Top = 397
    Data = {
      830000009619E0BD0100000018000000050000000000030000008300044E6F6D
      650100490000000100055749445448020002003C000A49445F436C69656E7465
      04000100000000000949445F50656469646F040001000000000003434F4B0100
      4900000001000557494454480200020001000A5365715F46697363616C040001
      00000000000000}
    object CDS_EntregaNome: TStringField
      FieldName = 'Nome'
      Size = 60
    end
    object CDS_EntregaID_Cliente: TIntegerField
      FieldName = 'ID_Cliente'
    end
    object CDS_EntregaID_Pedido: TIntegerField
      FieldName = 'ID_Pedido'
    end
    object CDS_EntregaCOK: TStringField
      FieldName = 'COK'
      Size = 1
    end
    object CDS_EntregaSeq_Fiscal: TIntegerField
      FieldName = 'Seq_Fiscal'
    end
  end
  object CDS_Item: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_Entrega'
        DataType = ftInteger
      end
      item
        Name = 'ID_Prod'
        DataType = ftInteger
      end
      item
        Name = 'Qtd'
        DataType = ftFloat
      end
      item
        Name = 'Preco'
        DataType = ftFloat
      end
      item
        Name = 'Desconto'
        DataType = ftFloat
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 999
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 404
    Top = 396
    Data = {
      860000009619E0BD01000000180000000600000000000300000086000A49445F
      456E747265676104000100000000000749445F50726F64040001000000000003
      517464080004000000000005507265636F080004000000000008446573636F6E
      746F08000400000000000944657363726963616F020049000000010005574944
      544802000200E7030000}
    object CDS_ItemID_Entrega: TIntegerField
      FieldName = 'ID_Entrega'
    end
    object CDS_ItemID_Prod: TIntegerField
      FieldName = 'ID_Prod'
    end
    object CDS_ItemQtd: TFloatField
      FieldName = 'Qtd'
    end
    object CDS_ItemPreco: TFloatField
      FieldName = 'Preco'
    end
    object CDS_ItemDesconto: TFloatField
      FieldName = 'Desconto'
    end
    object CDS_ItemDescricao: TStringField
      FieldName = 'Descricao'
      Size = 999
    end
  end
  object CDS_CondPagto: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_ENTREGA'
        DataType = ftInteger
      end
      item
        Name = 'TIPO_PAGTO'
        DataType = ftInteger
      end
      item
        Name = 'TOTAL'
        DataType = ftCurrency
      end
      item
        Name = 'HORA_PAGTO'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'DATA_PAGTO'
        DataType = ftDate
      end
      item
        Name = 'DEVEDOR'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 120
    Top = 360
    Data = {
      B80000009619E0BD010000001800000006000000000003000000B8000A49445F
      454E545245474104000100000000000A5449504F5F504147544F040001000000
      000005544F54414C080004000000010007535542545950450200490006004D6F
      6E6579000A484F52415F504147544F0100490000000100055749445448020002
      0005000A444154415F504147544F04000600000000000744455645444F520800
      04000000010007535542545950450200490006004D6F6E6579000000}
    object CDS_CondPagtoID_ENTREGA: TIntegerField
      FieldName = 'ID_ENTREGA'
    end
    object CDS_CondPagtoTIPO_PAGTO: TIntegerField
      FieldName = 'TIPO_PAGTO'
    end
    object CDS_CondPagtoTOTAL: TCurrencyField
      FieldName = 'TOTAL'
    end
    object CDS_CondPagtoHORA_PAGTO: TStringField
      FieldName = 'HORA_PAGTO'
      Size = 5
    end
    object CDS_CondPagtoDATA_PAGTO: TDateField
      FieldName = 'DATA_PAGTO'
    end
    object CDS_CondPagtoDEVEDOR: TCurrencyField
      FieldName = 'DEVEDOR'
    end
  end
  object IBQ_GeraCodi: TIBQuery
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select gen_id(GEN_ENTREGA_PK,0) as XCod_ID'
      'from rdb$database;')
    Left = 695
    Top = 84
    object IBQ_GeraCodiXCOD_ID: TLargeintField
      FieldName = 'XCOD_ID'
      Required = True
    end
  end
  object IBQ_Convenio: TIBQuery
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DTS_Cliente
    SQL.Strings = (
      'select * from CONVENIO')
    Left = 639
    Top = 84
  end
  object DTS_Convenio: TDataSource
    DataSet = IBQ_Convenio
    Left = 667
    Top = 84
  end
end
