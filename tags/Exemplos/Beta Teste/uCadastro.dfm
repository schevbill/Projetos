object FRMCadastro: TFRMCadastro
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'CADASTRO DE TANQUE / BOMBA / BICO'
  ClientHeight = 398
  ClientWidth = 372
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pcAbas: TPageControl
    Left = 0
    Top = 0
    Width = 372
    Height = 336
    ActivePage = tsTanque
    Align = alClient
    MultiLine = True
    TabOrder = 0
    ExplicitHeight = 368
    object tsTanque: TTabSheet
      Caption = ' T A N Q U E '
      ExplicitHeight = 317
      object Label1: TLabel
        Left = 11
        Top = 7
        Width = 66
        Height = 13
        Caption = 'Nome Tanque'
      end
      object Label2: TLabel
        Left = 11
        Top = 50
        Width = 58
        Height = 13
        Caption = 'Combust'#237'vel'
      end
      object Label3: TLabel
        Left = 11
        Top = 93
        Width = 76
        Height = 13
        Caption = 'Unidade Medida'
      end
      object Label4: TLabel
        Left = 177
        Top = 93
        Width = 56
        Height = 13
        Caption = 'Capacidade'
      end
      object Label5: TLabel
        Left = 13
        Top = 135
        Width = 39
        Height = 13
        Caption = 'Estoque'
      end
      object Label6: TLabel
        Left = 177
        Top = 135
        Width = 153
        Height = 13
        Caption = 'Falta para completar no Tanque'
      end
      object Label7: TLabel
        Left = 11
        Top = 178
        Width = 30
        Height = 13
        Caption = 'Lastro'
      end
      object Label8: TLabel
        Left = 177
        Top = 178
        Width = 90
        Height = 13
        Caption = 'Codigo Automa'#231#227'o'
      end
      object Label9: TLabel
        Left = 11
        Top = 221
        Width = 76
        Height = 13
        Caption = 'Data Instala'#231#227'o'
      end
      object Label10: TLabel
        Left = 177
        Top = 221
        Width = 81
        Height = 13
        Caption = 'Turno Instala'#231#227'o'
      end
      object Label11: TLabel
        Left = 11
        Top = 264
        Width = 68
        Height = 13
        Caption = 'Data Exclus'#227'o'
      end
      object Label12: TLabel
        Left = 177
        Top = 264
        Width = 73
        Height = 13
        Caption = 'Turno Exclus'#227'o'
      end
      object edtCodAutomacao: TEdit
        Left = 177
        Top = 194
        Width = 162
        Height = 21
        TabOrder = 7
      end
      object edtLastro: TEdit
        Left = 11
        Top = 194
        Width = 160
        Height = 21
        TabOrder = 6
      end
      object edtDescricao: TEdit
        Left = 11
        Top = 23
        Width = 328
        Height = 21
        TabOrder = 0
      end
      object cbProduto: TDBLookupComboBox
        Left = 11
        Top = 66
        Width = 328
        Height = 21
        KeyField = 'XCD_INT_PRODUTO'
        ListField = 'XDESCRICAO'
        ListSource = dtsProd
        TabOrder = 1
      end
      object edtFaltaComp: TEdit
        Left = 177
        Top = 151
        Width = 162
        Height = 21
        TabOrder = 5
      end
      object edtStqTanq: TEdit
        Left = 11
        Top = 151
        Width = 160
        Height = 21
        TabOrder = 4
      end
      object Edit2: TEdit
        Left = 177
        Top = 108
        Width = 162
        Height = 21
        TabOrder = 3
      end
      object cbUnidade: TDBLookupComboBox
        Left = 11
        Top = 108
        Width = 160
        Height = 21
        KeyField = 'XCD_INT_UNIDADE'
        ListField = 'SiglaDesc'
        ListSource = dtsUND
        TabOrder = 2
      end
      object cbTurnoInstal: TDBLookupComboBox
        Left = 177
        Top = 237
        Width = 162
        Height = 21
        KeyField = 'XCD_INT_TURNO'
        ListField = 'XDESCRICAO'
        ListSource = dtsTurno
        TabOrder = 9
      end
      object dtDataInstal: TDateTimePicker
        Left = 11
        Top = 237
        Width = 160
        Height = 21
        Date = 41208.587355659720000000
        Time = 41208.587355659720000000
        TabOrder = 8
      end
      object dtDataExc: TDateTimePicker
        Left = 11
        Top = 280
        Width = 160
        Height = 21
        Date = 41208.594558252310000000
        Time = 41208.594558252310000000
        TabOrder = 10
      end
      object cbTurnoExc: TDBLookupComboBox
        Left = 177
        Top = 280
        Width = 162
        Height = 21
        KeyField = 'XCD_INT_TURNO'
        ListField = 'XDESCRICAO'
        ListSource = dtsTurno
        TabOrder = 11
      end
    end
    object tsBomba: TTabSheet
      Caption = ' B O M B A '
      ImageIndex = 1
      ExplicitHeight = 317
    end
    object tsBico: TTabSheet
      Caption = ' B I C O '
      ImageIndex = 2
      ExplicitHeight = 317
    end
  end
  object pButon: TPanel
    Left = 0
    Top = 336
    Width = 372
    Height = 62
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 339
    object bSair: TButton
      Left = 292
      Top = 4
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 0
      OnClick = bSairClick
    end
    object bNovo: TButton
      Left = 5
      Top = 4
      Width = 65
      Height = 25
      Caption = '&Novo'
      TabOrder = 1
      OnClick = bNovoClick
    end
    object bEditar: TButton
      Left = 77
      Top = 4
      Width = 65
      Height = 25
      Caption = '&Editar'
      TabOrder = 2
      OnClick = bEditarClick
    end
    object bSalvar: TButton
      Left = 149
      Top = 4
      Width = 65
      Height = 25
      Caption = 'Salvar'
      Enabled = False
      TabOrder = 3
      OnClick = bSalvarClick
    end
    object bCancelar: TButton
      Left = 221
      Top = 4
      Width = 65
      Height = 25
      Caption = 'Cancelar'
      Enabled = False
      TabOrder = 4
      OnClick = bCancelarClick
    end
    object Button1: TButton
      Left = 17
      Top = 35
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 5
    end
    object Button2: TButton
      Left = 98
      Top = 35
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 6
    end
    object Button3: TButton
      Left = 179
      Top = 35
      Width = 75
      Height = 25
      Caption = 'Button3'
      TabOrder = 7
    end
    object Button4: TButton
      Left = 260
      Top = 35
      Width = 75
      Height = 25
      Caption = 'Button4'
      TabOrder = 8
    end
  end
  object qryGravar: TADOQuery
    Connection = FRM_Comunica.cLedPosto
    Parameters = <>
    Left = 296
    Top = 32
  end
  object qryProd: TADOQuery
    Connection = FRM_Comunica.cLedPosto
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT XCD_INT_PRODUTO, XDESCRICAO FROM LEDC0001.DBO.TB_PRODUTOS')
    Left = 264
    Top = 32
    object qryProdXCD_INT_PRODUTO: TAutoIncField
      FieldName = 'XCD_INT_PRODUTO'
      ReadOnly = True
    end
    object qryProdXDESCRICAO: TStringField
      FieldName = 'XDESCRICAO'
      Size = 150
    end
  end
  object dtsProd: TDataSource
    DataSet = qryProd
    Left = 264
    Top = 64
  end
  object qryUND: TADOQuery
    Connection = FRM_Comunica.cLedPosto
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT XCD_INT_UNIDADE, '
      '             XABREV + '#39' - '#39' + XDESCRICAO AS SiglaDesc '
      'FROM LEDC0001.DBO.tb_un_med_produto')
    Left = 232
    Top = 32
    object qryUNDXCD_INT_UNIDADE: TAutoIncField
      FieldName = 'XCD_INT_UNIDADE'
      ReadOnly = True
    end
    object qryUNDSiglaDesc: TStringField
      FieldName = 'SiglaDesc'
      ReadOnly = True
      Size = 30
    end
  end
  object dtsUND: TDataSource
    DataSet = qryUND
    Left = 232
    Top = 64
  end
  object qryTurno: TADOQuery
    Connection = FRM_Comunica.cLedPosto
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT XCD_INT_TURNO, XDESCRICAO FROM LEDC0001.DBO.TB_TURNO')
    Left = 200
    Top = 32
    object qryTurnoXCD_INT_TURNO: TAutoIncField
      FieldName = 'XCD_INT_TURNO'
      ReadOnly = True
    end
    object qryTurnoXDESCRICAO: TStringField
      FieldName = 'XDESCRICAO'
      Size = 30
    end
  end
  object dtsTurno: TDataSource
    DataSet = qryTurno
    Left = 200
    Top = 64
  end
end
