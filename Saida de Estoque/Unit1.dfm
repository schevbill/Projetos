object FCadCliente: TFCadCliente
  Left = 627
  Top = 257
  Width = 519
  Height = 372
  Caption = 'Cadastro de Clientes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 503
    Height = 293
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 50
      Width = 42
      Height = 13
      Caption = 'C'#211'DIGO'
    end
    object Label2: TLabel
      Left = 16
      Top = 74
      Width = 32
      Height = 13
      Caption = 'NOME'
    end
    object Label3: TLabel
      Left = 16
      Top = 98
      Width = 60
      Height = 13
      Caption = 'ENDERE'#199'O'
    end
    object Label4: TLabel
      Left = 16
      Top = 122
      Width = 56
      Height = 13
      Caption = 'TELEFONE'
    end
    object DBNavigator1: TDBNavigator
      Left = 0
      Top = 0
      Width = 230
      Height = 25
      DataSource = DataSource1
      TabOrder = 0
      BeforeAction = DBNavigator1BeforeAction
    end
    object DBECODIGO: TDBEdit
      Left = 96
      Top = 49
      Width = 121
      Height = 21
      DataField = 'CODIGO'
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBENOME: TDBEdit
      Left = 96
      Top = 73
      Width = 121
      Height = 21
      DataField = 'NOME'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEENDERECO: TDBEdit
      Left = 96
      Top = 97
      Width = 121
      Height = 21
      DataField = 'ENDERECO'
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBETELEFONE: TDBEdit
      Left = 96
      Top = 121
      Width = 121
      Height = 21
      DataField = 'TELEFONE'
      DataSource = DataSource1
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 293
    Width = 503
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 0
    end
    object Button2: TButton
      Left = 120
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = IBTCADCLIENTE
    Left = 144
    Top = 184
  end
  object IBDCADCLIENTE: TIBDatabase
    DatabaseName = 'D:\Projetos K2\Projetos Delphi\Cadastros Clientes makuko\MAK.GDB'
    Params.Strings = (
      'password=masterkey'
      'lc_ctype=WIN1252'
      'user_name=sysdba')
    LoginPrompt = False
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 96
    Top = 152
  end
  object IBTCADCLIENTE: TIBTable
    Database = IBDCADCLIENTE
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'ENDERECO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'TELEFONE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ID_CLIENTE'
        Attributes = [faRequired]
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY1'
        Fields = 'ID_CLIENTE'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'CADCLIENTE'
    Left = 96
    Top = 184
    object IBTCADCLIENTECODIGO: TSmallintField
      FieldName = 'CODIGO'
      Required = True
    end
    object IBTCADCLIENTENOME: TIBStringField
      FieldName = 'NOME'
      Size = 100
    end
    object IBTCADCLIENTEENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Size = 100
    end
    object IBTCADCLIENTETELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Size = 100
    end
    object IBTCADCLIENTEID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = IBDCADCLIENTE
    AutoStopAction = saNone
    Left = 144
    Top = 152
  end
end
