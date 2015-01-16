object FRM_Comunica: TFRM_Comunica
  Left = 0
  Top = 0
  Width = 1297
  Height = 883
  AutoScroll = True
  BorderIcons = [biSystemMenu]
  Caption = 'Comunica'#231#227'o com a Bomba - TESTE BILL'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object RGDLL: TRadioGroup
    Left = 0
    Top = 0
    Width = 178
    Height = 65
    Caption = ' DLL '
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Company'
      'CUB')
    TabOrder = 0
    OnClick = RGDLLClick
  end
  object PCComunicacao: TPageControl
    Left = 0
    Top = 71
    Width = 178
    Height = 164
    ActivePage = TBSSerial
    TabOrder = 1
    object TBSSerial: TTabSheet
      Caption = 'Porta Serial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      object Label1: TLabel
        Left = 8
        Top = 12
        Width = 54
        Height = 16
        Caption = 'N'#250'mero :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object seNum: TSpinEdit
        Left = 68
        Top = 9
        Width = 99
        Height = 22
        MaxValue = 99
        MinValue = 1
        TabOrder = 0
        Value = 1
      end
      object bAbreFechaSerial: TButton
        Left = 3
        Top = 37
        Width = 164
        Height = 25
        Caption = 'Abre serial'
        TabOrder = 1
        OnClick = bAbreFechaSerialClick
      end
      object bConsultaSerial: TButton
        Left = 3
        Top = 68
        Width = 164
        Height = 25
        Caption = 'Consultar Serial'
        TabOrder = 2
        OnClick = bConsultaSerialClick
      end
      object bAtualizar: TButton
        Left = 3
        Top = 99
        Width = 164
        Height = 25
        Caption = 'Atualiza'
        TabOrder = 3
        OnClick = bAtualizarClick
      end
    end
    object TBSSocket: TTabSheet
      Caption = 'Socket'
      ImageIndex = 1
      object Label38: TLabel
        Left = 3
        Top = 12
        Width = 10
        Height = 13
        Caption = 'IP'
      end
      object edtIP: TEdit
        Left = 19
        Top = 9
        Width = 148
        Height = 21
        TabOrder = 0
        Text = '127.0.0.1'
      end
      object bConectDesc: TButton
        Left = 3
        Top = 37
        Width = 164
        Height = 25
        Caption = 'Conectar'
        TabOrder = 1
        OnClick = bConectDescClick
      end
      object bConsultaSocket: TButton
        Left = 3
        Top = 68
        Width = 164
        Height = 25
        Caption = 'Consultar Socket'
        TabOrder = 2
        OnClick = bConsultaSocketClick
      end
    end
  end
  object gbConsultaEncerrantes: TGroupBox
    Left = 184
    Top = 82
    Width = 290
    Height = 76
    Caption = ' Consulta de Pre'#231'o Encerrado "Encerrante" '
    TabOrder = 3
    object Label25: TLabel
      Left = 14
      Top = 25
      Width = 27
      Height = 13
      Caption = 'Tipo :'
    end
    object cbTipo: TComboBox
      Left = 14
      Top = 40
      Width = 159
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = 'L - Litros'
      Items.Strings = (
        'L - Litros'
        '$ - Dinheiro')
    end
    object bConsultaPF: TButton
      Left = 179
      Top = 40
      Width = 104
      Height = 21
      Caption = 'Envia'
      TabOrder = 1
      OnClick = bConsultaPFClick
    end
  end
  object rgTipoStatus: TRadioGroup
    Left = 0
    Top = 241
    Width = 449
    Height = 73
    Caption = ' Tipo Status Bomba '
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Situa'#231#227'o atual das bombas'
      'Situa'#231#227'o atual dos sensores Identfid')
    TabOrder = 8
  end
  object lbStatus: TListBox
    Left = 0
    Top = 320
    Width = 449
    Height = 291
    Columns = 4
    ItemHeight = 13
    TabOrder = 10
  end
  object rgStatusBomb: TRadioGroup
    Left = 455
    Top = 241
    Width = 448
    Height = 73
    Caption = ' Tipo Status Bomba '
    ItemIndex = 0
    Items.Strings = (
      'Volume que os bicos est'#227'o abastecendo')
    TabOrder = 9
  end
  object lbStatusBomb: TListBox
    Left = 455
    Top = 320
    Width = 448
    Height = 291
    Columns = 4
    ItemHeight = 13
    TabOrder = 11
  end
  object gbInfo: TGroupBox
    Left = 184
    Top = 0
    Width = 290
    Height = 76
    Caption = ' Informa'#231#245'es '
    TabOrder = 2
    object Label24: TLabel
      Left = 14
      Top = 25
      Width = 19
      Height = 13
      Caption = 'Bico'
    end
    object edtBico: TEdit
      Left = 14
      Top = 40
      Width = 45
      Height = 21
      MaxLength = 2
      TabOrder = 0
    end
    object bGerenPosto: TButton
      Left = 179
      Top = 40
      Width = 104
      Height = 21
      Caption = 'Gerenciador Posto'
      TabOrder = 1
      OnClick = bGerenPostoClick
    end
    object bAtivaTimerStatus: TButton
      Left = 179
      Top = 13
      Width = 104
      Height = 21
      Caption = 'Ativar o Status B.'
      TabOrder = 2
      OnClick = bAtivaTimerStatusClick
    end
    object bCadastro: TButton
      Left = 69
      Top = 13
      Width = 104
      Height = 21
      Caption = 'Cadastro'
      TabOrder = 3
      OnClick = bCadastroClick
    end
  end
  object gbOperacao: TGroupBox
    Left = 480
    Top = 82
    Width = 290
    Height = 76
    Caption = ' Modo de opera'#231#227'o '
    TabOrder = 6
    object Label33: TLabel
      Left = 14
      Top = 25
      Width = 31
      Height = 13
      Caption = 'Op'#231#227'o'
    end
    object bOperacao: TButton
      Left = 179
      Top = 40
      Width = 104
      Height = 21
      Caption = 'Envia'
      TabOrder = 0
      OnClick = bOperacaoClick
    end
    object cbOpcaoBLA: TComboBox
      Left = 14
      Top = 40
      Width = 159
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Text = 'Liberar'
      Items.Strings = (
        'Liberar'
        'Autorizar'
        'Bloquear')
    end
  end
  object gbAlteraPreco: TGroupBox
    Left = 184
    Top = 161
    Width = 290
    Height = 76
    Caption = ' Altera Pre'#231'o '
    TabOrder = 4
    object Label28: TLabel
      Left = 14
      Top = 22
      Width = 41
      Height = 13
      Caption = 'Decimais'
    end
    object Label30: TLabel
      Left = 65
      Top = 22
      Width = 27
      Height = 13
      Caption = 'Pre'#231'o'
    end
    object bAlteraPre: TButton
      Left = 179
      Top = 38
      Width = 104
      Height = 21
      Caption = 'Envia'
      TabOrder = 2
      OnClick = bAlteraPreClick
    end
    object edtPreco: TEdit
      Left = 65
      Top = 38
      Width = 108
      Height = 21
      BiDiMode = bdRightToLeft
      MaxLength = 4
      ParentBiDiMode = False
      TabOrder = 1
      Text = '0000'
    end
    object seDecimal: TSpinEdit
      Left = 14
      Top = 38
      Width = 45
      Height = 22
      MaxValue = 3
      MinValue = 2
      TabOrder = 0
      Value = 2
    end
  end
  object gbValorMaxBico: TGroupBox
    Left = 480
    Top = 161
    Width = 290
    Height = 76
    Caption = ' Valor m'#225'x. da pr'#243'x. venda, em um bico '
    TabOrder = 7
    object Label2: TLabel
      Left = 14
      Top = 22
      Width = 139
      Height = 13
      Caption = 'Valor R$  (ex. 1000 = 10,00)'
    end
    object edtPrecoBombaMax: TEdit
      Left = 14
      Top = 38
      Width = 159
      Height = 21
      BiDiMode = bdRightToLeft
      ParentBiDiMode = False
      TabOrder = 0
      Text = '0000'
    end
    object bPararPreco: TButton
      Left = 179
      Top = 38
      Width = 104
      Height = 21
      Caption = 'Envia'
      TabOrder = 1
      OnClick = bPararPrecoClick
    end
  end
  object rgClock: TRadioGroup
    Left = 480
    Top = 0
    Width = 290
    Height = 76
    Caption = ' Ajustar o rel'#243'gio interno do concentrador '
    ItemIndex = 0
    Items.Strings = (
      'Automatico'
      'Selecionar   Dia:           Hora:           Minuto:')
    TabOrder = 5
    OnClick = rgClockClick
  end
  object bSetClock: TButton
    Left = 659
    Top = 21
    Width = 104
    Height = 21
    Caption = 'Envia'
    TabOrder = 12
    OnClick = bSetClockClick
  end
  object edtDia: TEdit
    Left = 583
    Top = 48
    Width = 28
    Height = 21
    Enabled = False
    MaxLength = 2
    TabOrder = 13
    Text = '00'
  end
  object edtHora: TEdit
    Left = 641
    Top = 48
    Width = 28
    Height = 21
    Enabled = False
    MaxLength = 2
    TabOrder = 14
    Text = '00'
  end
  object edtMin: TEdit
    Left = 710
    Top = 48
    Width = 28
    Height = 21
    Enabled = False
    MaxLength = 2
    TabOrder = 15
    Text = '00'
  end
  object gbClockIdentfid: TGroupBox
    Left = 776
    Top = 0
    Width = 290
    Height = 76
    Caption = ' Atualizar o rel'#243'gio do Identfid'#174' '
    TabOrder = 16
    object Label3: TLabel
      Left = 36
      Top = 50
      Width = 19
      Height = 13
      Caption = 'Dia:'
    end
    object Label4: TLabel
      Left = 88
      Top = 50
      Width = 27
      Height = 13
      Caption = 'Hora:'
    end
    object Label5: TLabel
      Left = 149
      Top = 50
      Width = 36
      Height = 13
      Caption = 'Minuto:'
    end
    object edtMinIdent: TEdit
      Left = 187
      Top = 48
      Width = 27
      Height = 21
      MaxLength = 2
      TabOrder = 0
      Text = '00'
    end
    object edtHoraIdent: TEdit
      Left = 117
      Top = 48
      Width = 27
      Height = 21
      MaxLength = 2
      TabOrder = 1
      Text = '00'
    end
    object edtDiaIden: TEdit
      Left = 56
      Top = 48
      Width = 27
      Height = 21
      MaxLength = 2
      TabOrder = 2
      Text = '00'
    end
    object bSetClockIdent: TButton
      Left = 179
      Top = 21
      Width = 104
      Height = 21
      Caption = 'Envia'
      TabOrder = 3
      OnClick = bSetClockIdentClick
    end
  end
  object gbVersao: TGroupBox
    Left = 776
    Top = 82
    Width = 290
    Height = 76
    Caption = ' Vers'#227'o DLL'
    TabOrder = 17
    object mVersao: TMemo
      Left = 2
      Top = 15
      Width = 286
      Height = 59
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object gbLeitura: TGroupBox
    Left = 2
    Top = 613
    Width = 449
    Height = 226
    Caption = ' Leitura do Buffer '
    TabOrder = 18
    object bLeAbastecimento: TButton
      Left = 2
      Top = 161
      Width = 445
      Height = 21
      Align = alBottom
      Caption = 'Le Abastecimento - semelhante a um While.eof'
      TabOrder = 0
      OnClick = bLeAbastecimentoClick
    end
    object bIncrementa: TButton
      Left = 2
      Top = 203
      Width = 445
      Height = 21
      Align = alBottom
      Caption = 'Incrementa'
      TabOrder = 1
      OnClick = bIncrementaClick
    end
    object gEncerrante: TDBGrid
      Left = 2
      Top = 15
      Width = 445
      Height = 146
      Align = alClient
      DataSource = dtsGravaEnce
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object bLeAbFix: TButton
      Left = 2
      Top = 182
      Width = 445
      Height = 21
      Align = alBottom
      Caption = 'Le Abastecimento Fix'
      TabOrder = 3
      OnClick = bLeAbFixClick
    end
  end
  object gbLeituraM: TGroupBox
    Left = 455
    Top = 613
    Width = 448
    Height = 226
    Caption = ' Leitura do Buffer - Memo'
    TabOrder = 19
    object mLeituraBM: TMemo
      Left = 2
      Top = 15
      Width = 444
      Height = 187
      Align = alClient
      ReadOnly = True
      TabOrder = 0
    end
    object Panel1: TPanel
      Left = 2
      Top = 202
      Width = 444
      Height = 22
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object Label6: TLabel
        Left = 8
        Top = 5
        Width = 80
        Height = 13
        Caption = 'Registro "Indice"'
      end
      object edtIndice: TEdit
        Left = 94
        Top = 1
        Width = 35
        Height = 21
        BiDiMode = bdRightToLeft
        MaxLength = 4
        ParentBiDiMode = False
        TabOrder = 0
        Text = '0000'
      end
      object bLeEvento: TButton
        Left = 135
        Top = 1
        Width = 309
        Height = 21
        Caption = 'Le Registro - Abastecimento'
        TabOrder = 1
        OnClick = bLeEventoClick
      end
    end
  end
  object gbLePart: TGroupBox
    Left = 776
    Top = 161
    Width = 290
    Height = 76
    Caption = ' Ler uma parte do abastecimento atual '
    TabOrder = 20
    object Label7: TLabel
      Left = 14
      Top = 22
      Width = 170
      Height = 13
      Caption = 'Op'#231#227'o "NAO ESTA FUNCIONANDO"'
    end
    object bLePart: TButton
      Left = 179
      Top = 38
      Width = 104
      Height = 21
      Caption = 'Envia'
      TabOrder = 0
      OnClick = bLePartClick
    end
    object cbOpcaoPart: TComboBox
      Left = 14
      Top = 38
      Width = 159
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = 'L - Volume abastecido'
      Items.Strings = (
        'L - Volume abastecido'
        'T - Total a pagar'
        'P - Pre'#231'o unit'#225'rio'
        'C - Calend'#225'rio'
        'E - Encerrantes (totalizador)')
    end
  end
  object gbLePPL: TGroupBox
    Left = 907
    Top = 241
    Width = 290
    Height = 73
    Caption = ' Ler o pre'#231'o unit'#225'rio praticado em determinado bico '
    TabOrder = 21
    object bLePPL: TButton
      Left = 179
      Top = 38
      Width = 104
      Height = 21
      Caption = 'Envia'
      TabOrder = 0
      OnClick = bLePPLClick
    end
    object edtLePPL: TEdit
      Left = 14
      Top = 38
      Width = 159
      Height = 21
      BiDiMode = bdRightToLeft
      ParentBiDiMode = False
      ReadOnly = True
      TabOrder = 1
      Text = '0000'
    end
  end
  object TimerStatus: TTimer
    Enabled = False
    OnTimer = TimerStatusTimer
    Left = 290
    Top = 41
  end
  object cdsGravaEnce: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 288
    Top = 672
    Data = {
      2A0100009619E0BD01000000180000000D0000000000030000002A010556616C
      756502000300000000000E546F74616C5F44696E686569726F08000400000000
      000C546F74616C5F4C6974726F73080004000000000002505508000400000000
      000554656D706F0100490000000100055749445448020002000F000543616E61
      6C01004900000001000557494454480200020014000444617461010049000000
      0100055749445448020002000F0004486F726101004900000001000557494454
      48020002000F000753745F46756C6C0100490000000100055749445448020002
      003C0008526567697374726F04000100000000000A456E63657272616E746508
      000400000000000B496E74656772696461646502000300000000000843686563
      6B73756D02000300000000000000}
    object cdsGravaEnceValue: TBooleanField
      FieldName = 'Value'
    end
    object cdsGravaEnceTotal_Dinheiro: TFloatField
      FieldName = 'Total_Dinheiro'
      currency = True
    end
    object cdsGravaEnceTotal_Litros: TFloatField
      FieldName = 'Total_Litros'
    end
    object cdsGravaEncePU: TFloatField
      FieldName = 'PU'
    end
    object cdsGravaEnceTempo: TStringField
      FieldName = 'Tempo'
      Size = 15
    end
    object cdsGravaEnceCanal: TStringField
      FieldName = 'Canal'
    end
    object cdsGravaEnceData: TStringField
      FieldName = 'Data'
      Size = 15
    end
    object cdsGravaEnceHora: TStringField
      FieldName = 'Hora'
      Size = 15
    end
    object cdsGravaEnceSt_Full: TStringField
      FieldName = 'St_Full'
      Size = 60
    end
    object cdsGravaEnceRegistro: TIntegerField
      FieldName = 'Registro'
    end
    object cdsGravaEnceEncerrante: TFloatField
      FieldName = 'Encerrante'
    end
    object cdsGravaEnceIntegridade: TBooleanField
      FieldName = 'Integridade'
    end
    object cdsGravaEnceChecksum: TBooleanField
      FieldName = 'Checksum'
    end
  end
  object dtsGravaEnce: TDataSource
    DataSet = cdsGravaEnce
    Left = 288
    Top = 704
  end
  object cLedPosto: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 256
    Top = 40
  end
end
