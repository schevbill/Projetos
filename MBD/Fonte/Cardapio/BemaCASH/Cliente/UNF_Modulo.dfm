object FRM_Modulo: TFRM_Modulo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 257
  Top = 162
  Height = 721
  Width = 973
  object DataBaseIB: TIBDatabase
    DatabaseName = '192.168.1.3:M:\DB\Cardapio\ARCOIRIS.GDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=sysdbambd')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    AllowStreamedConnected = False
    Left = 25
    Top = 13
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = DataBaseIB
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 91
    Top = 13
  end
  object IBT_Usuario: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    AfterDelete = IBT_UsuarioAfterDelete
    AfterInsert = IBT_UsuarioAfterInsert
    AfterPost = IBT_UsuarioAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'LOGIN'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NIVEL'
        DataType = ftInteger
      end
      item
        Name = 'CHPB'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'FUNCIONARIO'
        DataType = ftInteger
      end
      item
        Name = 'SENHA'
        DataType = ftString
        Size = 4
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY35'
        Fields = 'CODIGO_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'IDX_ASSOCIADO_CODIGOAMIGA'
        Fields = 'CODIGO_AMIGA'
        Options = [ixUnique]
      end
      item
        Name = 'IDX_ASSOCIADO_INSCRICAO'
        Fields = 'INSCRICAO'
        Options = [ixUnique]
      end
      item
        Name = 'IDX_ASSOCIADO_NOME'
        Fields = 'NOME'
      end
      item
        Name = 'IDX_ASSOCIADO_PLANOUNIMED'
        Fields = 'PLANOUNIMED'
      end
      item
        Name = 'IDX_ASSOCIADO_PLANOCOLETIVO'
        Fields = 'PLANOCOLETIVO'
      end
      item
        Name = 'RDB$FOREIGN75'
        Fields = 'TIPOTITULO'
      end
      item
        Name = 'RDB$FOREIGN83'
        Fields = 'POSTOGRADUACAO'
      end
      item
        Name = 'RDB$FOREIGN84'
        Fields = 'CATEGORIA'
      end
      item
        Name = 'RDB$FOREIGN85'
        Fields = 'FORCA'
      end
      item
        Name = 'RDB$FOREIGN86'
        Fields = 'ESTADOCIVIL'
      end
      item
        Name = 'RDB$FOREIGN87'
        Fields = 'BANCOPAGTO'
      end
      item
        Name = 'RDB$FOREIGN88'
        Fields = 'AMIGA'
      end
      item
        Name = 'RDB$FOREIGN89'
        Fields = 'LOCALPAGTO'
      end
      item
        Name = 'RDB$FOREIGN90'
        Fields = 'RESPONSAVEL'
      end
      item
        Name = 'RDB$FOREIGN116'
        Fields = 'TIPOPLANO'
      end>
    StoreDefs = True
    TableName = 'USUARIO'
    Left = 690
    Top = 7
    object IBT_UsuarioCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
    end
    object IBT_UsuarioLOGIN: TIBStringField
      FieldName = 'LOGIN'
    end
    object IBT_UsuarioSENHA: TIBStringField
      FieldName = 'SENHA'
      Size = 4
    end
    object IBT_UsuarioNIVEL: TIntegerField
      FieldName = 'NIVEL'
    end
    object IBT_UsuarioCHPB: TIBStringField
      FieldName = 'CHPB'
    end
    object IBT_UsuarioFUNCIONARIO: TIntegerField
      FieldName = 'FUNCIONARIO'
    end
    object IBT_UsuarioDesFuncioanrio: TStringField
      DisplayLabel = 'Funcionario'
      FieldKind = fkLookup
      FieldName = 'DesFuncioanrio'
      LookupDataSet = IBT_Funcionario
      LookupKeyFields = 'CODIGO_ID'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'FUNCIONARIO'
      Size = 60
      Lookup = True
    end
  end
  object DTS_Usuario: TDataSource
    DataSet = IBT_Usuario
    Left = 690
    Top = 51
  end
  object IBT_Modulos: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    AfterDelete = IBT_ModulosAfterDelete
    AfterInsert = IBT_ModulosAfterInsert
    AfterPost = IBT_ModulosAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO_ID'
        DataType = ftInteger
      end
      item
        Name = 'MODULO'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'MOD_NAME'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'BOT_NAME'
        DataType = ftString
        Size = 120
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY35'
        Fields = 'CODIGO_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'IDX_ASSOCIADO_CODIGOAMIGA'
        Fields = 'CODIGO_AMIGA'
        Options = [ixUnique]
      end
      item
        Name = 'IDX_ASSOCIADO_INSCRICAO'
        Fields = 'INSCRICAO'
        Options = [ixUnique]
      end
      item
        Name = 'IDX_ASSOCIADO_NOME'
        Fields = 'NOME'
      end
      item
        Name = 'IDX_ASSOCIADO_PLANOUNIMED'
        Fields = 'PLANOUNIMED'
      end
      item
        Name = 'IDX_ASSOCIADO_PLANOCOLETIVO'
        Fields = 'PLANOCOLETIVO'
      end
      item
        Name = 'RDB$FOREIGN75'
        Fields = 'TIPOTITULO'
      end
      item
        Name = 'RDB$FOREIGN83'
        Fields = 'POSTOGRADUACAO'
      end
      item
        Name = 'RDB$FOREIGN84'
        Fields = 'CATEGORIA'
      end
      item
        Name = 'RDB$FOREIGN85'
        Fields = 'FORCA'
      end
      item
        Name = 'RDB$FOREIGN86'
        Fields = 'ESTADOCIVIL'
      end
      item
        Name = 'RDB$FOREIGN87'
        Fields = 'BANCOPAGTO'
      end
      item
        Name = 'RDB$FOREIGN88'
        Fields = 'AMIGA'
      end
      item
        Name = 'RDB$FOREIGN89'
        Fields = 'LOCALPAGTO'
      end
      item
        Name = 'RDB$FOREIGN90'
        Fields = 'RESPONSAVEL'
      end
      item
        Name = 'RDB$FOREIGN116'
        Fields = 'TIPOPLANO'
      end>
    StoreDefs = True
    TableName = 'MODULO'
    Left = 763
    Top = 7
    object IBT_ModulosCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
    end
    object IBT_ModulosMODULO: TIBStringField
      DisplayLabel = 'M'#243'dulo'
      FieldName = 'MODULO'
      Size = 120
    end
    object IBT_ModulosMOD_NAME: TIBStringField
      DisplayLabel = 'Nome do Menu'
      FieldName = 'MOD_NAME'
      Size = 120
    end
    object IBT_ModulosBOT_NAME: TIBStringField
      DisplayLabel = 'Nome do Bot'#227'o'
      FieldName = 'BOT_NAME'
      Size = 120
    end
  end
  object DTS_Modulos: TDataSource
    DataSet = IBT_Modulos
    Left = 763
    Top = 51
  end
  object IBT_Nivel: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    AfterDelete = IBT_NivelAfterDelete
    AfterInsert = IBT_NivelAfterInsert
    AfterPost = IBT_NivelAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NIVEL'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY35'
        Fields = 'CODIGO_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'IDX_ASSOCIADO_CODIGOAMIGA'
        Fields = 'CODIGO_AMIGA'
        Options = [ixUnique]
      end
      item
        Name = 'IDX_ASSOCIADO_INSCRICAO'
        Fields = 'INSCRICAO'
        Options = [ixUnique]
      end
      item
        Name = 'IDX_ASSOCIADO_NOME'
        Fields = 'NOME'
      end
      item
        Name = 'IDX_ASSOCIADO_PLANOUNIMED'
        Fields = 'PLANOUNIMED'
      end
      item
        Name = 'IDX_ASSOCIADO_PLANOCOLETIVO'
        Fields = 'PLANOCOLETIVO'
      end
      item
        Name = 'RDB$FOREIGN75'
        Fields = 'TIPOTITULO'
      end
      item
        Name = 'RDB$FOREIGN83'
        Fields = 'POSTOGRADUACAO'
      end
      item
        Name = 'RDB$FOREIGN84'
        Fields = 'CATEGORIA'
      end
      item
        Name = 'RDB$FOREIGN85'
        Fields = 'FORCA'
      end
      item
        Name = 'RDB$FOREIGN86'
        Fields = 'ESTADOCIVIL'
      end
      item
        Name = 'RDB$FOREIGN87'
        Fields = 'BANCOPAGTO'
      end
      item
        Name = 'RDB$FOREIGN88'
        Fields = 'AMIGA'
      end
      item
        Name = 'RDB$FOREIGN89'
        Fields = 'LOCALPAGTO'
      end
      item
        Name = 'RDB$FOREIGN90'
        Fields = 'RESPONSAVEL'
      end
      item
        Name = 'RDB$FOREIGN116'
        Fields = 'TIPOPLANO'
      end>
    StoreDefs = True
    TableName = 'NIVEL'
    Left = 763
    Top = 103
    object IBT_NivelCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
    end
    object IBT_NivelNIVEL: TIBStringField
      FieldName = 'NIVEL'
      Size = 60
    end
  end
  object DTS_Nivel: TDataSource
    DataSet = IBT_Nivel
    Left = 763
    Top = 147
  end
  object IBT_Permissao: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    AfterDelete = IBT_PermissaoAfterDelete
    AfterInsert = IBT_PermissaoAfterInsert
    AfterPost = IBT_PermissaoAfterPost
    OnCalcFields = IBT_PermissaoCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO_ID'
        DataType = ftInteger
      end
      item
        Name = 'NIVEL'
        DataType = ftInteger
      end
      item
        Name = 'MODULO'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'MOD_NAME'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'BOT_NAME'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'PERMISSAO'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'CHPB'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY86'
        Fields = 'CODIGO_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN88'
        Fields = 'NIVEL'
      end>
    IndexFieldNames = 'NIVEL'
    MasterFields = 'CODIGO_ID'
    MasterSource = DTS_Nivel
    StoreDefs = True
    TableName = 'PERMISSAO'
    Left = 690
    Top = 103
    object IBT_PermissaoCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
    end
    object IBT_PermissaoNIVEL: TIntegerField
      FieldName = 'NIVEL'
    end
    object IBT_PermissaoMODULO: TIBStringField
      DisplayLabel = 'Modulo'
      FieldName = 'MODULO'
      Size = 120
    end
    object IBT_PermissaoMOD_NAME: TIBStringField
      FieldName = 'MOD_NAME'
      Size = 120
    end
    object IBT_PermissaoBOT_NAME: TIBStringField
      FieldName = 'BOT_NAME'
      Size = 120
    end
    object IBT_PermissaoPERMISSAO: TIBStringField
      DisplayLabel = 'P'
      FieldName = 'PERMISSAO'
      Size = 6
    end
    object IBT_PermissaoCHPB: TIBStringField
      FieldName = 'CHPB'
    end
    object IBT_PermissaoDesModulo: TStringField
      DisplayLabel = 'M'#243'dulo'
      FieldKind = fkCalculated
      FieldName = 'DesModulo'
      Size = 60
      Calculated = True
    end
    object IBT_PermissaoDesPermissao: TStringField
      DisplayLabel = 'P'
      FieldKind = fkCalculated
      FieldName = 'DesPermissao'
      Size = 60
      Calculated = True
    end
  end
  object DTS_Permissao: TDataSource
    DataSet = IBT_Permissao
    Left = 690
    Top = 147
  end
  object IBT_UsuNivel: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    AfterDelete = IBT_UsuNivelAfterDelete
    AfterInsert = IBT_UsuNivelAfterInsert
    AfterPost = IBT_UsuNivelAfterPost
    OnCalcFields = IBT_UsuNivelCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'LOGIN'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NIVEL'
        DataType = ftInteger
      end
      item
        Name = 'CHPB'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'FUNCIONARIO'
        DataType = ftInteger
      end
      item
        Name = 'SENHA'
        DataType = ftString
        Size = 4
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY21'
        Fields = 'CODIGO_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN22'
        Fields = 'NIVEL'
      end
      item
        Name = 'IDX_USUARIO_FUNCIONARIO'
        Fields = 'FUNCIONARIO'
        Options = [ixUnique]
      end>
    IndexFieldNames = 'NIVEL'
    MasterFields = 'CODIGO_ID'
    MasterSource = DTS_Nivel
    StoreDefs = True
    TableName = 'USUARIO'
    Left = 729
    Top = 199
    object IBT_UsuNivelCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
    end
    object IBT_UsuNivelLOGIN: TIBStringField
      FieldName = 'LOGIN'
    end
    object IBT_UsuNivelSENHA: TIBStringField
      FieldName = 'SENHA'
    end
    object IBT_UsuNivelNIVEL: TIntegerField
      FieldName = 'NIVEL'
    end
    object IBT_UsuNivelCHPB: TIBStringField
      FieldName = 'CHPB'
    end
    object IBT_UsuNivelFUNCIONARIO: TIntegerField
      FieldName = 'FUNCIONARIO'
    end
    object IBT_UsuNivelDesLogin: TStringField
      DisplayLabel = 'Login'
      FieldKind = fkCalculated
      FieldName = 'DesLogin'
      Size = 60
      Calculated = True
    end
    object IBT_UsuNivelDesFuncioanio: TStringField
      DisplayLabel = 'Funcioanio'
      FieldKind = fkLookup
      FieldName = 'DesFuncioanio'
      LookupDataSet = IBT_Funcionario
      LookupKeyFields = 'CODIGO_ID'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'FUNCIONARIO'
      Size = 60
      Lookup = True
    end
  end
  object DTS_UsuNivel: TDataSource
    DataSet = IBQ_USuNivel
    Left = 729
    Top = 242
  end
  object IBT_Funcionario: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    AfterDelete = IBT_FuncionarioAfterDelete
    AfterInsert = IBT_FuncionarioAfterInsert
    AfterPost = IBT_FuncionarioAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'PONTOVENDA'
        DataType = ftInteger
      end
      item
        Name = 'DT_NASCTO'
        DataType = ftDate
      end
      item
        Name = 'ENDERECO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'BAIRRO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'TELEFONE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ATIVO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ADMISSAO'
        DataType = ftDate
      end
      item
        Name = 'DEMISSAO'
        DataType = ftDate
      end
      item
        Name = 'turno'
        DataType = ftInteger
      end
      item
        Name = 'CARGO'
        DataType = ftInteger
      end
      item
        Name = 'STATUS'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'OBSERVACAO'
        DataType = ftBlob
        Size = 8
      end
      item
        Name = 'MOVEL'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'COMISSAO'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY4'
        Fields = 'CODIGO_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN41'
        Fields = 'CARGO'
      end
      item
        Name = 'RDB$FOREIGN42'
        Fields = 'PONTOVENDA'
      end
      item
        Name = 'RDB$FOREIGN44'
        Fields = 'turno'
      end
      item
        Name = 'IDX_FUNCIONARIO_DESCRICAO'
        Fields = 'DESCRICAO'
      end>
    StoreDefs = True
    TableName = 'FUNCIONARIO'
    Left = 608
    Top = 4
    object IBT_FuncionarioCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_FuncionarioDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object IBT_FuncionarioPONTOVENDA: TIntegerField
      FieldName = 'PONTOVENDA'
    end
    object IBT_FuncionarioDT_NASCTO: TDateField
      FieldName = 'DT_NASCTO'
    end
    object IBT_FuncionarioENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object IBT_FuncionarioBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object IBT_FuncionarioCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object IBT_FuncionarioTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Size = 15
    end
    object IBT_FuncionarioATIVO: TIBStringField
      FieldName = 'ATIVO'
      Size = 1
    end
    object IBT_FuncionarioADMISSAO: TDateField
      FieldName = 'ADMISSAO'
    end
    object IBT_FuncionarioDEMISSAO: TDateField
      FieldName = 'DEMISSAO'
    end
    object IBT_Funcionarioturno: TIntegerField
      FieldName = 'turno'
    end
    object IBT_FuncionarioCARGO: TIntegerField
      FieldName = 'CARGO'
    end
    object IBT_FuncionarioSTATUS: TIBStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object IBT_FuncionarioDescPeriodo: TStringField
      FieldKind = fkLookup
      FieldName = 'DescPeriodo'
      LookupDataSet = IBT_Turno
      LookupKeyFields = 'CODIGO_ID'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'turno'
      Size = 60
      Lookup = True
    end
    object IBT_FuncionarioDescTurno: TStringField
      FieldKind = fkLookup
      FieldName = 'DescTurno'
      LookupDataSet = IBT_Turno
      LookupKeyFields = 'CODIGO_ID'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'turno'
      Size = 60
      Lookup = True
    end
    object IBT_FuncionarioOBSERVACAO: TBlobField
      FieldName = 'OBSERVACAO'
      Size = 8
    end
    object IBT_FuncionarioMOVEL: TIBStringField
      FieldName = 'MOVEL'
      Size = 1
    end
    object IBT_FuncionarioCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
    end
  end
  object DTS_Funcionario: TDataSource
    DataSet = IBT_Funcionario
    Left = 608
    Top = 50
  end
  object IBT_Cargo: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    AfterDelete = IBT_CargoAfterDelete
    AfterInsert = IBT_CargoAfterInsert
    AfterPost = IBT_CargoAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY1'
        Fields = 'CODIGO_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'IDX_CLIFOR_CNPJ_RG'
        Fields = 'CNPJ_RG'
      end
      item
        Name = 'IDX_CLIFOR_NOMEFANTASIA'
        Fields = 'NOMEFANTASIA'
      end
      item
        Name = 'IDX_CLIFOR_RAZAOSOCIAL'
        Fields = 'RAZAOSOCIAL'
      end>
    StoreDefs = True
    TableName = 'CARGO'
    Left = 20
    Top = 76
    object IBT_CargoCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_CargoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object IBT_CargoTIPO: TIBStringField
      FieldName = 'TIPO'
      Size = 1
    end
  end
  object DTS_Cargo: TDataSource
    DataSet = IBT_Cargo
    Left = 20
    Top = 122
  end
  object IBT_Config: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    AfterDelete = IBT_ConfigAfterDelete
    AfterInsert = IBT_ConfigAfterInsert
    AfterPost = IBT_ConfigAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'IMPRESSORA'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'PORT_IMPRI'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'MOVEL'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'MODELO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'GUILHOTINA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'EXPTICKET'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY56'
        Fields = 'CODIGO_ID'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'CONFIG'
    Left = 88
    Top = 76
    object IBT_ConfigCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_ConfigIMPRESSORA: TIBStringField
      FieldName = 'IMPRESSORA'
      Size = 60
    end
    object IBT_ConfigPORT_IMPRI: TIBStringField
      FieldName = 'PORT_IMPRI'
      Size = 120
    end
    object IBT_ConfigMOVEL: TIBStringField
      FieldName = 'MOVEL'
      Required = True
      Size = 1
    end
    object IBT_ConfigMODELO: TIBStringField
      FieldName = 'MODELO'
    end
    object IBT_ConfigGUILHOTINA: TIBStringField
      FieldName = 'GUILHOTINA'
      Size = 1
    end
    object IBT_ConfigEXPTICKET: TIBStringField
      FieldName = 'EXPTICKET'
      Size = 1
    end
  end
  object DTS_Config: TDataSource
    DataSet = IBT_Config
    Left = 88
    Top = 122
  end
  object IBT_Ficha: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    AfterDelete = IBT_FichaAfterDelete
    AfterInsert = IBT_FichaAfterInsert
    AfterPost = IBT_FichaAfterPost
    OnCalcFields = IBT_FichaCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'FICHA'
        DataType = ftInteger
      end
      item
        Name = 'SEQUENCIA'
        DataType = ftInteger
      end
      item
        Name = 'STATUS'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ATIVO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CONSULTA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TRAVA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DIGITO'
        DataType = ftSmallint
      end
      item
        Name = 'TP_FICHA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'OPERADOR'
        DataType = ftInteger
      end
      item
        Name = 'PRODUCAO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'QUARTO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TAXA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'MOVEL'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'FINALIZADA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'XFICHA'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 5
      end>
    IndexDefs = <
      item
        Name = 'IDX_FICHA_ATIVO'
        Fields = 'ATIVO'
      end
      item
        Name = 'IDX_FICHA_STATUS'
        Fields = 'STATUS'
      end
      item
        Name = 'IDX_FICHA_SEQUENCIA'
        Fields = 'SEQUENCIA'
      end
      item
        Name = 'IDX_FICHA_FICHASEQ'
        Fields = 'FICHA;SEQUENCIA'
      end
      item
        Name = 'IDX_FICHA_FICHA'
        Fields = 'FICHA'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$PRIMARY26'
        Fields = 'CODIGO_ID'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'FICHA'
    Left = 160
    Top = 76
    object IBT_FichaCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_FichaFICHA: TIntegerField
      FieldName = 'FICHA'
    end
    object IBT_FichaSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
    end
    object IBT_FichaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object IBT_FichaATIVO: TIBStringField
      FieldName = 'ATIVO'
      Size = 1
    end
    object IBT_FichaCONSULTA: TIBStringField
      FieldName = 'CONSULTA'
      Size = 1
    end
    object IBT_FichaDescFicha: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescFicha'
      Size = 5
      Calculated = True
    end
    object IBT_FichaTRAVA: TIBStringField
      FieldName = 'TRAVA'
      Required = True
      Size = 1
    end
    object IBT_FichaDIGITO: TSmallintField
      FieldName = 'DIGITO'
    end
    object IBT_FichaTP_FICHA: TIBStringField
      FieldName = 'TP_FICHA'
      Size = 1
    end
    object IBT_FichaOPERADOR: TIntegerField
      FieldName = 'OPERADOR'
    end
    object IBT_FichaPRODUCAO: TIBStringField
      FieldName = 'PRODUCAO'
      Required = True
      Size = 1
    end
    object IBT_FichaQUARTO: TIBStringField
      FieldName = 'QUARTO'
      Size = 1
    end
    object IBT_FichaFINALIZADA: TIBStringField
      FieldName = 'FINALIZADA'
      Size = 1
    end
  end
  object DTS_Ficha: TDataSource
    DataSet = IBT_Ficha
    Left = 160
    Top = 122
  end
  object IBT_FormaPagto: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    AfterDelete = IBT_FormaPagtoAfterDelete
    AfterInsert = IBT_FormaPagtoAfterInsert
    AfterPost = IBT_FormaPagtoAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCONTO'
        DataType = ftFloat
      end
      item
        Name = 'TIPOPAGTO'
        DataType = ftInteger
      end
      item
        Name = 'MULTFORM'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TEF'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DESCRICAO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'DIAS'
        DataType = ftInteger
      end
      item
        Name = 'QTDTICKET'
        DataType = ftInteger
      end
      item
        Name = 'ATIVO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ACRESCIMO'
        DataType = ftFloat
      end
      item
        Name = 'CORTESIA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DOCVINC'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TIPOES'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'PERMISSAO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'MULTA'
        DataType = ftFloat
      end
      item
        Name = 'JUROSDIAS'
        DataType = ftFloat
      end
      item
        Name = 'CARENCIA'
        DataType = ftInteger
      end>
    Filter = 'ATIVO='#39'S'#39
    Filtered = True
    IndexDefs = <
      item
        Name = 'RDB$FOREIGN45'
        Fields = 'TIPOPAGTO'
      end
      item
        Name = 'IDX_FORMAPAGTO_DESCRICAO'
        Fields = 'DESCRICAO'
      end
      item
        Name = 'RDB$PRIMARY27'
        Fields = 'CODIGO_ID'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'FORMAPAGTO'
    Left = 236
    Top = 76
    object IBT_FormaPagtoCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_FormaPagtoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object IBT_FormaPagtoDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      DisplayFormat = '###,###,##0.00'
    end
    object IBT_FormaPagtoTIPOPAGTO: TIntegerField
      FieldName = 'TIPOPAGTO'
    end
    object IBT_FormaPagtoMULTFORM: TIBStringField
      FieldName = 'MULTFORM'
      Size = 1
    end
    object IBT_FormaPagtoTEF: TIBStringField
      FieldName = 'TEF'
      Size = 1
    end
    object IBT_FormaPagtoTIPO: TIBStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object IBT_FormaPagtoDIAS: TIntegerField
      FieldName = 'DIAS'
    end
    object IBT_FormaPagtoQTDTICKET: TIntegerField
      FieldName = 'QTDTICKET'
    end
    object IBT_FormaPagtoATIVO: TIBStringField
      FieldName = 'ATIVO'
      Size = 1
    end
    object IBT_FormaPagtoACRESCIMO: TFloatField
      FieldName = 'ACRESCIMO'
    end
    object IBT_FormaPagtoCORTESIA: TIBStringField
      FieldName = 'CORTESIA'
      Size = 1
    end
    object IBT_FormaPagtoDOCVINC: TIBStringField
      FieldName = 'DOCVINC'
      Size = 1
    end
    object IBT_FormaPagtoTIPOES: TIBStringField
      FieldName = 'TIPOES'
      Size = 1
    end
    object IBT_FormaPagtoPERMISSAO: TIBStringField
      FieldName = 'PERMISSAO'
      Size = 1
    end
    object IBT_FormaPagtoMULTA: TFloatField
      FieldName = 'MULTA'
    end
    object IBT_FormaPagtoJUROSDIAS: TFloatField
      FieldName = 'JUROSDIAS'
    end
    object IBT_FormaPagtoCARENCIA: TIntegerField
      FieldName = 'CARENCIA'
    end
  end
  object DTS_FormaPagto: TDataSource
    DataSet = IBT_FormaPagto
    Left = 236
    Top = 122
  end
  object IBT_Grupo: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    AfterDelete = IBT_GrupoAfterDelete
    AfterInsert = IBT_GrupoAfterInsert
    AfterPost = IBT_GrupoAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'GRUPO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY1'
        Fields = 'CODIGO_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'IDX_CLIFOR_CNPJ_RG'
        Fields = 'CNPJ_RG'
      end
      item
        Name = 'IDX_CLIFOR_NOMEFANTASIA'
        Fields = 'NOMEFANTASIA'
      end
      item
        Name = 'IDX_CLIFOR_RAZAOSOCIAL'
        Fields = 'RAZAOSOCIAL'
      end>
    StoreDefs = True
    TableName = 'GRUPO'
    Left = 316
    Top = 76
    object IBT_GrupoCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_GrupoGRUPO: TIBStringField
      FieldName = 'GRUPO'
      Size = 10
    end
    object IBT_GrupoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  object DTS_Grupo: TDataSource
    DataSet = IBT_Grupo
    Left = 316
    Top = 122
  end
  object IBT_MesaFecha: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    AfterDelete = IBT_MesaFechaAfterDelete
    AfterInsert = IBT_MesaFechaAfterInsert
    AfterPost = IBT_MesaFechaAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'MESA'
        DataType = ftInteger
      end
      item
        Name = 'SEQUENCIA'
        DataType = ftInteger
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'TROCO'
        DataType = ftFloat
      end
      item
        Name = 'TIPO_PAGTO'
        DataType = ftInteger
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
        Name = 'OPERADOR'
        DataType = ftInteger
      end
      item
        Name = 'DESCONTO'
        DataType = ftFloat
      end
      item
        Name = 'CANCELADO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'PONTOVENDA'
        DataType = ftInteger
      end
      item
        Name = 'SEQ_FISCAL'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NUM_CAIXA'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'COK'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'MESAFECHA'
        DataType = ftInteger
      end
      item
        Name = 'SEQFECHA'
        DataType = ftInteger
      end
      item
        Name = 'TEMPO'
        Attributes = [faReadonly]
        DataType = ftDateTime
      end
      item
        Name = 'OPCANCEL'
        DataType = ftInteger
      end
      item
        Name = 'CLIENTE'
        DataType = ftInteger
      end
      item
        Name = 'VAL_DESCONTOI'
        DataType = ftFloat
      end
      item
        Name = 'VAL_ACRESCIMOI'
        DataType = ftFloat
      end
      item
        Name = 'VAL_TAXAI'
        DataType = ftFloat
      end
      item
        Name = 'CAT_CNPJ'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CAT_NOME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'CAT_ENDERECO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'NUMSERIEIMPRESSORA'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CORTESIA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TURNO'
        DataType = ftInteger
      end
      item
        Name = 'IMPRESSO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'PESSOAS'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'RDB$FOREIGN52'
        Fields = 'TIPO_PAGTO'
      end
      item
        Name = 'RDB$FOREIGN54'
        Fields = 'OPERADOR'
      end
      item
        Name = 'RDB$FOREIGN55'
        Fields = 'PONTOVENDA'
      end
      item
        Name = 'IDX_MESAFECHA_CANCELADO'
        Fields = 'CANCELADO'
      end
      item
        Name = 'IDX_MESAFECHA_DATAPAGTO'
        Fields = 'DATA_PAGTO'
      end
      item
        Name = 'IDX_MESAFECHA_HORAPAGTO'
        Fields = 'HORA_PAGTO'
      end
      item
        Name = 'IDX_MESAFECHA_MESASEQ'
        Fields = 'MESA;SEQUENCIA'
      end
      item
        Name = 'IDX_MESAFECHA_MESASEQFEC'
        Fields = 'MESAFECHA;SEQFECHA'
      end
      item
        Name = 'RDB$PRIMARY35'
        Fields = 'CODIGO_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN145'
        Fields = 'CLIENTE'
      end>
    StoreDefs = True
    TableName = 'MESAFECHA'
    Left = 390
    Top = 76
    object IBT_MesaFechaCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_MesaFechaMESA: TIntegerField
      FieldName = 'MESA'
    end
    object IBT_MesaFechaSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
    end
    object IBT_MesaFechaVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object IBT_MesaFechaTROCO: TFloatField
      FieldName = 'TROCO'
    end
    object IBT_MesaFechaTIPO_PAGTO: TIntegerField
      FieldName = 'TIPO_PAGTO'
    end
    object IBT_MesaFechaHORA_PAGTO: TIBStringField
      FieldName = 'HORA_PAGTO'
      Size = 5
    end
    object IBT_MesaFechaDATA_PAGTO: TDateField
      FieldName = 'DATA_PAGTO'
    end
    object IBT_MesaFechaOPERADOR: TIntegerField
      FieldName = 'OPERADOR'
    end
    object IBT_MesaFechaDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
    object IBT_MesaFechaCANCELADO: TIBStringField
      FieldName = 'CANCELADO'
      Size = 1
    end
    object IBT_MesaFechaPONTOVENDA: TIntegerField
      FieldName = 'PONTOVENDA'
    end
    object IBT_MesaFechaSEQ_FISCAL: TIBStringField
      FieldName = 'SEQ_FISCAL'
      Size = 15
    end
    object IBT_MesaFechaNUM_CAIXA: TIBStringField
      FieldName = 'NUM_CAIXA'
      Size = 15
    end
    object IBT_MesaFechaCOK: TIBStringField
      FieldName = 'COK'
      Size = 1
    end
    object IBT_MesaFechaMESAFECHA: TIntegerField
      FieldName = 'MESAFECHA'
    end
    object IBT_MesaFechaSEQFECHA: TIntegerField
      FieldName = 'SEQFECHA'
    end
    object IBT_MesaFechaTEMPO: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO'
      ReadOnly = True
    end
    object IBT_MesaFechaOPCANCEL: TIntegerField
      FieldName = 'OPCANCEL'
    end
    object IBT_MesaFechaCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object IBT_MesaFechaVAL_DESCONTOI: TFloatField
      FieldName = 'VAL_DESCONTOI'
    end
    object IBT_MesaFechaVAL_ACRESCIMOI: TFloatField
      FieldName = 'VAL_ACRESCIMOI'
    end
    object IBT_MesaFechaVAL_TAXAI: TFloatField
      FieldName = 'VAL_TAXAI'
    end
    object IBT_MesaFechaCAT_CNPJ: TIBStringField
      FieldName = 'CAT_CNPJ'
      Size = 30
    end
    object IBT_MesaFechaCAT_NOME: TIBStringField
      FieldName = 'CAT_NOME'
      Size = 100
    end
    object IBT_MesaFechaCAT_ENDERECO: TIBStringField
      FieldName = 'CAT_ENDERECO'
      Size = 100
    end
    object IBT_MesaFechaNUMSERIEIMPRESSORA: TIBStringField
      FieldName = 'NUMSERIEIMPRESSORA'
      Size = 30
    end
    object IBT_MesaFechaCORTESIA: TIBStringField
      FieldName = 'CORTESIA'
      Size = 1
    end
    object IBT_MesaFechaTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object IBT_MesaFechaIMPRESSO: TIBStringField
      FieldName = 'IMPRESSO'
      Size = 1
    end
    object IBT_MesaFechaPESSOAS: TIntegerField
      FieldName = 'PESSOAS'
    end
  end
  object DTS_MesaFecha: TDataSource
    DataSet = IBT_MesaFecha
    Left = 390
    Top = 122
  end
  object IBT_MesaItem: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    AfterDelete = IBT_MesaItemAfterDelete
    AfterInsert = IBT_MesaItemAfterInsert
    AfterPost = IBT_MesaItemAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'MESA'
        DataType = ftInteger
      end
      item
        Name = 'SEQUENCIA'
        DataType = ftInteger
      end
      item
        Name = 'GARCOM'
        DataType = ftInteger
      end
      item
        Name = 'PRODUTO'
        DataType = ftInteger
      end
      item
        Name = 'QUANTIDADE'
        DataType = ftFloat
      end
      item
        Name = 'CANCELADA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'IMP_REMOTA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'PONTOVENDA'
        DataType = ftInteger
      end
      item
        Name = 'HORA'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'DATE'
        DataType = ftDate
      end
      item
        Name = 'MESAFECHA'
        DataType = ftInteger
      end
      item
        Name = 'SEQFECHA'
        DataType = ftInteger
      end
      item
        Name = 'GRUPO'
        DataType = ftInteger
      end
      item
        Name = 'PRC_UNITARIO'
        DataType = ftFloat
      end
      item
        Name = 'BALANCA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'HO'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'TEMPO'
        Attributes = [faReadonly]
        DataType = ftDateTime
      end
      item
        Name = 'OPCANCEL'
        DataType = ftInteger
      end
      item
        Name = 'ALIQUOTA'
        DataType = ftInteger
      end
      item
        Name = 'DATA_INICIO'
        DataType = ftDate
      end
      item
        Name = 'DATA_FINAL'
        DataType = ftDate
      end
      item
        Name = 'HORA_INICIO'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'HORA_FINAL'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'TEMPO_INICIAL'
        Attributes = [faReadonly]
        DataType = ftDateTime
      end
      item
        Name = 'TEMPO_FINAL'
        Attributes = [faReadonly]
        DataType = ftDateTime
      end
      item
        Name = 'DESCONTO'
        DataType = ftFloat
      end
      item
        Name = 'FINALIZADA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'OBS'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'IMP_DIARIA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'IMP_CONTINT'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'IMP_CANCELINT'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CLIENTEDIARIA'
        DataType = ftInteger
      end
      item
        Name = 'ACRESCIMO'
        DataType = ftFloat
      end
      item
        Name = 'TAXA'
        DataType = ftFloat
      end
      item
        Name = 'VAL_TAXA'
        Attributes = [faReadonly]
        DataType = ftFloat
      end
      item
        Name = 'VAL_DESCONTO'
        Attributes = [faReadonly]
        DataType = ftFloat
      end
      item
        Name = 'VAL_ACRESCIMO'
        Attributes = [faReadonly]
        DataType = ftFloat
      end
      item
        Name = 'VAL_PRODUTO'
        Attributes = [faReadonly]
        DataType = ftFloat
      end
      item
        Name = 'ALIQUO'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'PIS'
        DataType = ftFloat
      end
      item
        Name = 'COFINS'
        DataType = ftFloat
      end
      item
        Name = 'ICMS'
        DataType = ftFloat
      end
      item
        Name = 'COMISSAOPR'
        DataType = ftFloat
      end
      item
        Name = 'COMISSAOFU'
        DataType = ftFloat
      end
      item
        Name = 'COMISPRSN'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CORTESIA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TURNO'
        DataType = ftInteger
      end
      item
        Name = 'STATUSCONT'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'REDUCAO'
        DataType = ftFloat
      end
      item
        Name = 'OBSERVACAO'
        DataType = ftMemo
      end
      item
        Name = 'COMPLEMENTO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'POSICAO'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'LIGACOMP'
        DataType = ftInteger
      end
      item
        Name = 'NIVEL_ISENTO'
        DataType = ftInteger
      end
      item
        Name = 'IMPRESSO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'PESSOAS'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'RDB$FOREIGN49'
        Fields = 'PRODUTO'
      end
      item
        Name = 'RDB$FOREIGN50'
        Fields = 'PONTOVENDA'
      end
      item
        Name = 'RDB$FOREIGN47'
        Fields = 'GARCOM'
      end
      item
        Name = 'RDB$FOREIGN60'
        Fields = 'GRUPO'
      end
      item
        Name = 'IDX_MESAITEM_CANCELADA'
        Fields = 'CANCELADA'
      end
      item
        Name = 'IDX_MESAITEM_DATE'
        Fields = 'DATE'
      end
      item
        Name = 'RDB$PRIMARY34'
        Fields = 'CODIGO_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'IDX_MESAITEM_HORA'
        Fields = 'HORA'
      end
      item
        Name = 'IDX_MESAITEM_MESASEQ'
        Fields = 'MESA;SEQUENCIA'
      end
      item
        Name = 'IDX_MESAITEM_MESASEQFEC'
        Fields = 'MESAFECHA;SEQFECHA'
      end>
    StoreDefs = True
    TableName = 'MESAITEM'
    Left = 470
    Top = 76
    object IBT_MesaItemCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_MesaItemMESA: TIntegerField
      FieldName = 'MESA'
    end
    object IBT_MesaItemSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
    end
    object IBT_MesaItemGARCOM: TIntegerField
      FieldName = 'GARCOM'
    end
    object IBT_MesaItemPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
    end
    object IBT_MesaItemQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object IBT_MesaItemCANCELADA: TIBStringField
      FieldName = 'CANCELADA'
      Size = 1
    end
    object IBT_MesaItemIMP_REMOTA: TIBStringField
      FieldName = 'IMP_REMOTA'
      Size = 1
    end
    object IBT_MesaItemPONTOVENDA: TIntegerField
      FieldName = 'PONTOVENDA'
    end
    object IBT_MesaItemHORA: TIBStringField
      FieldName = 'HORA'
      Size = 5
    end
    object IBT_MesaItemDATE: TDateField
      FieldName = 'DATE'
    end
    object IBT_MesaItemMESAFECHA: TIntegerField
      FieldName = 'MESAFECHA'
    end
    object IBT_MesaItemSEQFECHA: TIntegerField
      FieldName = 'SEQFECHA'
    end
    object IBT_MesaItemGRUPO: TIntegerField
      FieldName = 'GRUPO'
    end
    object IBT_MesaItemPRC_UNITARIO: TFloatField
      FieldName = 'PRC_UNITARIO'
    end
    object IBT_MesaItemBALANCA: TIBStringField
      FieldName = 'BALANCA'
      Size = 1
    end
    object IBT_MesaItemHO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'HO'
      ReadOnly = True
      Size = 2
    end
    object IBT_MesaItemTEMPO: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO'
      ReadOnly = True
    end
    object IBT_MesaItemOPCANCEL: TIntegerField
      FieldName = 'OPCANCEL'
    end
    object IBT_MesaItemALIQUOTA: TIntegerField
      FieldName = 'ALIQUOTA'
    end
    object IBT_MesaItemDATA_INICIO: TDateField
      FieldName = 'DATA_INICIO'
    end
    object IBT_MesaItemDATA_FINAL: TDateField
      FieldName = 'DATA_FINAL'
    end
    object IBT_MesaItemHORA_INICIO: TIBStringField
      FieldName = 'HORA_INICIO'
      Size = 5
    end
    object IBT_MesaItemHORA_FINAL: TIBStringField
      FieldName = 'HORA_FINAL'
      Size = 5
    end
    object IBT_MesaItemTEMPO_INICIAL: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO_INICIAL'
      ReadOnly = True
    end
    object IBT_MesaItemTEMPO_FINAL: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO_FINAL'
      ReadOnly = True
    end
    object IBT_MesaItemDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
    object IBT_MesaItemFINALIZADA: TIBStringField
      FieldName = 'FINALIZADA'
      Size = 1
    end
    object IBT_MesaItemCLIENTEDIARIA: TIntegerField
      FieldName = 'CLIENTEDIARIA'
    end
    object IBT_MesaItemOBS: TIBStringField
      FieldName = 'OBS'
      Size = 255
    end
    object IBT_MesaItemIMP_DIARIA: TIBStringField
      FieldName = 'IMP_DIARIA'
      Size = 1
    end
    object IBT_MesaItemIMP_CONTINT: TIBStringField
      FieldName = 'IMP_CONTINT'
      Size = 1
    end
    object IBT_MesaItemIMP_CANCELINT: TIBStringField
      FieldName = 'IMP_CANCELINT'
      Size = 1
    end
    object IBT_MesaItemACRESCIMO: TFloatField
      FieldName = 'ACRESCIMO'
    end
    object IBT_MesaItemTAXA: TFloatField
      FieldName = 'TAXA'
    end
    object IBT_MesaItemVAL_DESCONTO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_DESCONTO'
      ReadOnly = True
    end
    object IBT_MesaItemVAL_ACRESCIMO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_ACRESCIMO'
      ReadOnly = True
    end
    object IBT_MesaItemVAL_TAXA: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_TAXA'
      ReadOnly = True
    end
    object IBT_MesaItemVAL_PRODUTO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_PRODUTO'
      ReadOnly = True
    end
    object IBT_MesaItemALIQUO: TIBStringField
      FieldName = 'ALIQUO'
      Size = 4
    end
    object IBT_MesaItemPIS: TFloatField
      FieldName = 'PIS'
    end
    object IBT_MesaItemCOFINS: TFloatField
      FieldName = 'COFINS'
    end
    object IBT_MesaItemICMS: TFloatField
      FieldName = 'ICMS'
    end
    object IBT_MesaItemCOMISSAOPR: TFloatField
      FieldName = 'COMISSAOPR'
    end
    object IBT_MesaItemCOMISSAOFU: TFloatField
      FieldName = 'COMISSAOFU'
    end
    object IBT_MesaItemCOMISPRSN: TIBStringField
      FieldName = 'COMISPRSN'
      Size = 1
    end
    object IBT_MesaItemCORTESIA: TIBStringField
      FieldName = 'CORTESIA'
      Size = 1
    end
    object IBT_MesaItemTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object IBT_MesaItemOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 8
    end
    object IBT_MesaItemSTATUSCONT: TIBStringField
      FieldName = 'STATUSCONT'
      Size = 1
    end
    object IBT_MesaItemREDUCAO: TFloatField
      FieldName = 'REDUCAO'
    end
    object IBT_MesaItemCOMPLEMENTO: TIBStringField
      FieldName = 'COMPLEMENTO'
      Size = 1
    end
    object IBT_MesaItemPOSICAO: TIBStringField
      FieldName = 'POSICAO'
      Size = 5
    end
    object IBT_MesaItemLIGACOMP: TIntegerField
      FieldName = 'LIGACOMP'
    end
    object IBT_MesaItemNIVEL_ISENTO: TIntegerField
      FieldName = 'NIVEL_ISENTO'
    end
    object IBT_MesaItemIMPRESSO: TIBStringField
      FieldName = 'IMPRESSO'
      Size = 1
    end
    object IBT_MesaItemPESSOAS: TIntegerField
      FieldName = 'PESSOAS'
    end
  end
  object DTS_MesaItem: TDataSource
    DataSet = IBT_MesaItem
    Left = 470
    Top = 122
  end
  object IBT_Periodo: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    AfterDelete = IBT_PeriodoAfterDelete
    AfterInsert = IBT_PeriodoAfterInsert
    AfterPost = IBT_PeriodoAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'HORAINICIO'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'HORAFIM'
        DataType = ftString
        Size = 5
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY1'
        Fields = 'CODIGO_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'IDX_CLIFOR_CNPJ_RG'
        Fields = 'CNPJ_RG'
      end
      item
        Name = 'IDX_CLIFOR_NOMEFANTASIA'
        Fields = 'NOMEFANTASIA'
      end
      item
        Name = 'IDX_CLIFOR_RAZAOSOCIAL'
        Fields = 'RAZAOSOCIAL'
      end>
    StoreDefs = True
    TableName = 'PERIODO'
    Left = 20
    Top = 184
    object IBT_PeriodoCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_PeriodoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object IBT_PeriodoHORAINICIO: TIBStringField
      FieldName = 'HORAINICIO'
      Size = 5
    end
    object IBT_PeriodoHORAFIM: TIBStringField
      FieldName = 'HORAFIM'
      Size = 5
    end
  end
  object DTS_Periodo: TDataSource
    DataSet = IBT_Periodo
    Left = 20
    Top = 230
  end
  object IBT_PontoVenda: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    AfterDelete = IBT_PontoVendaAfterDelete
    AfterInsert = IBT_PontoVendaAfterInsert
    AfterPost = IBT_PontoVendaAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY1'
        Fields = 'CODIGO_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'IDX_CLIFOR_CNPJ_RG'
        Fields = 'CNPJ_RG'
      end
      item
        Name = 'IDX_CLIFOR_NOMEFANTASIA'
        Fields = 'NOMEFANTASIA'
      end
      item
        Name = 'IDX_CLIFOR_RAZAOSOCIAL'
        Fields = 'RAZAOSOCIAL'
      end>
    StoreDefs = True
    TableName = 'PONTOVENDA'
    Left = 89
    Top = 184
    object IBT_PontoVendaCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_PontoVendaDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  object DTS_PontoVenda: TDataSource
    DataSet = IBT_PontoVenda
    Left = 89
    Top = 230
  end
  object IBT_Produtos: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    AutoCalcFields = False
    AfterDelete = IBT_ProdutosAfterDelete
    AfterInsert = IBT_ProdutosAfterInsert
    AfterPost = IBT_ProdutosAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PRODUTO'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PRECO'
        DataType = ftFloat
      end
      item
        Name = 'PRECOCUSTO'
        DataType = ftFloat
      end
      item
        Name = 'GRUPO'
        DataType = ftInteger
      end
      item
        Name = 'ICMS_SN'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TRIBUTAR'
        DataType = ftInteger
      end
      item
        Name = 'BALANCA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TARA'
        DataType = ftFloat
      end
      item
        Name = 'UNIDADE'
        DataType = ftInteger
      end
      item
        Name = 'ATIVO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'COMANDA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'LOCAL_IMP'
        DataType = ftInteger
      end
      item
        Name = 'DESCONTO'
        DataType = ftFloat
      end
      item
        Name = 'ACRESCIMO'
        DataType = ftFloat
      end
      item
        Name = 'PROD_MTN'
        DataType = ftInteger
      end
      item
        Name = 'ESTOQUE'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ESTNEGATIVO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ESTOQUE_FISICO'
        DataType = ftFloat
      end
      item
        Name = 'ESTOQUE_VIRTUAL'
        DataType = ftFloat
      end
      item
        Name = 'ESTOQUEMIN'
        DataType = ftFloat
      end
      item
        Name = 'ESTOQUEMAX'
        DataType = ftFloat
      end
      item
        Name = 'TEMPO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 5
      end
      item
        Name = 'DIA_PROD'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'IMP_PERS'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'VALSALDOENT'
        DataType = ftFloat
      end
      item
        Name = 'QTDSALDOENT'
        DataType = ftFloat
      end
      item
        Name = 'TAXA'
        DataType = ftFloat
      end
      item
        Name = 'TAXA_SN'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'LUCRO'
        DataType = ftFloat
      end
      item
        Name = 'MOVEL'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'PIS'
        DataType = ftFloat
      end
      item
        Name = 'REDUCAOICMS'
        DataType = ftFloat
      end
      item
        Name = 'COFINS'
        DataType = ftFloat
      end
      item
        Name = 'ICMS'
        DataType = ftFloat
      end
      item
        Name = 'TRIBUTAR_ANTIGO'
        DataType = ftInteger
      end
      item
        Name = 'TRIBUTAR_FORA_ANTIGO'
        DataType = ftInteger
      end
      item
        Name = 'PRECO_AGREGADO'
        DataType = ftFloat
      end
      item
        Name = 'TRIBUTAR_FORA'
        DataType = ftInteger
      end
      item
        Name = 'CST'
        DataType = ftInteger
      end
      item
        Name = 'COMISSAO'
        DataType = ftFloat
      end
      item
        Name = 'COMISPRSN'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ITEMDATASUL'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'CLASSFISC_DATASUL'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'NATOPERACAO_DATASUL'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'UNITEM_DATASUL'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'UNFAMI_DATASUL'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CODTRIB_DATASUL'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'PERREDUCAOICMS_DATASUL'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'NIVEL_ISENTO'
        DataType = ftInteger
      end
      item
        Name = 'OBSFRENTE'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NCM'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'BXCARTELA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'MONTAR'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ESTLISTA_SN'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ST_ICMSE'
        DataType = ftInteger
      end
      item
        Name = 'ST_ICMSS'
        DataType = ftInteger
      end
      item
        Name = 'ST_IPI'
        DataType = ftInteger
      end
      item
        Name = 'ST_PIS'
        DataType = ftInteger
      end
      item
        Name = 'ST_COFINS'
        DataType = ftInteger
      end
      item
        Name = 'ICMSS'
        DataType = ftFloat
      end
      item
        Name = 'REDS'
        DataType = ftFloat
      end
      item
        Name = 'IPI'
        DataType = ftFloat
      end
      item
        Name = 'CODSERVICO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ISSQN'
        DataType = ftFloat
      end
      item
        Name = 'CF'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'EXTIPI'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'MODALIDADEBC'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CBEMA'
        DataType = ftLargeint
      end
      item
        Name = 'ABC_LETRA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ABC_PERCENTUAL'
        DataType = ftFloat
      end
      item
        Name = 'ABC'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ABC_DATAI'
        DataType = ftDate
      end
      item
        Name = 'ABC_DATAF'
        DataType = ftDate
      end
      item
        Name = 'ABC_PERCTOTAL'
        DataType = ftFloat
      end
      item
        Name = 'TICKETBARRASS_N'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CAMINHOTK'
        DataType = ftInteger
      end
      item
        Name = 'TICKETS_N'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ORIGEM'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'GTIN'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'PRECOPROMOCIONAL'
        DataType = ftFloat
      end
      item
        Name = 'FIM_PROMOCAO'
        DataType = ftDate
      end
      item
        Name = 'TMP_VALIDADE'
        DataType = ftInteger
      end
      item
        Name = 'TIPOITEMATIV'
        DataType = ftInteger
      end
      item
        Name = 'NAT_REC'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'AUTO_CALC_DIA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'OPCAOIMP'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ST_PIS_ENTRADA'
        DataType = ftInteger
      end
      item
        Name = 'PIS_ENTRADA'
        DataType = ftFloat
      end
      item
        Name = 'ST_COFINS_ENTRADA'
        DataType = ftInteger
      end
      item
        Name = 'COFINS_ENTRADA'
        DataType = ftFloat
      end>
    Filter = 'DIA_PROD = '#39'P'#39' and  ATIVO='#39'S'#39
    Filtered = True
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY29'
        Fields = 'CODIGO_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN36'
        Fields = 'TRIBUTAR'
      end
      item
        Name = 'RDB$FOREIGN37'
        Fields = 'UNIDADE'
      end
      item
        Name = 'RDB$FOREIGN38'
        Fields = 'GRUPO'
      end
      item
        Name = 'IDX_PRODUTO_ATIVO'
        Fields = 'ATIVO'
      end
      item
        Name = 'IDX_PRODUTO_BALANCA'
        Fields = 'BALANCA'
      end
      item
        Name = 'IDX_PRODUTO_COMANDA'
        Fields = 'COMANDA'
      end
      item
        Name = 'IDX_PRODUTO_DESCRICAO'
        Fields = 'DESCRICAO'
      end
      item
        Name = 'IDX_PRODUTO_PRODUTO'
        Fields = 'PRODUTO'
      end
      item
        Name = 'RDB$FOREIGN57'
        Fields = 'LOCAL_IMP'
      end
      item
        Name = 'IDX_PRODUTOS_PRODUNIQ'
        Fields = 'PRODUTO'
        Options = [ixUnique]
      end
      item
        Name = 'IDX_PRODUTOS_DESCRICAO'
        Fields = 'DESCRICAO'
      end
      item
        Name = 'IDX_PRODUTO_PRODUTOS'
        Fields = 'PRODUTO'
        Options = [ixUnique]
      end>
    IndexName = 'IDX_PRODUTO_PRODUTOS'
    StoreDefs = True
    TableName = 'PRODUTOS'
    Left = 160
    Top = 184
    object IBT_ProdutosCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_ProdutosPRODUTO: TIBStringField
      FieldName = 'PRODUTO'
      Size = 13
    end
    object IBT_ProdutosDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object IBT_ProdutosPRECO: TFloatField
      FieldName = 'PRECO'
      currency = True
    end
    object IBT_ProdutosPRECOCUSTO: TFloatField
      FieldName = 'PRECOCUSTO'
      currency = True
    end
    object IBT_ProdutosGRUPO: TIntegerField
      FieldName = 'GRUPO'
    end
    object IBT_ProdutosICMS_SN: TIBStringField
      FieldName = 'ICMS_SN'
      Size = 1
    end
    object IBT_ProdutosTRIBUTAR: TIntegerField
      FieldName = 'TRIBUTAR'
    end
    object IBT_ProdutosBALANCA: TIBStringField
      FieldName = 'BALANCA'
      Size = 1
    end
    object IBT_ProdutosTARA: TFloatField
      FieldName = 'TARA'
      DisplayFormat = '###,###,##0.00'
    end
    object IBT_ProdutosUNIDADE: TIntegerField
      FieldName = 'UNIDADE'
    end
    object IBT_ProdutosATIVO: TIBStringField
      FieldName = 'ATIVO'
      Size = 1
    end
    object IBT_ProdutosCOMANDA: TIBStringField
      FieldName = 'COMANDA'
      Size = 1
    end
    object IBT_ProdutosLOCAL_IMP: TIntegerField
      FieldName = 'LOCAL_IMP'
    end
    object IBT_ProdutosDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
    object IBT_ProdutosACRESCIMO: TFloatField
      FieldName = 'ACRESCIMO'
    end
    object IBT_ProdutosPROD_MTN: TIntegerField
      FieldName = 'PROD_MTN'
    end
    object IBT_ProdutosESTOQUE: TIBStringField
      FieldName = 'ESTOQUE'
      Size = 1
    end
    object IBT_ProdutosESTNEGATIVO: TIBStringField
      FieldName = 'ESTNEGATIVO'
      Size = 1
    end
    object IBT_ProdutosESTOQUE_FISICO: TFloatField
      FieldName = 'ESTOQUE_FISICO'
    end
    object IBT_ProdutosESTOQUE_VIRTUAL: TFloatField
      FieldName = 'ESTOQUE_VIRTUAL'
    end
    object IBT_ProdutosDescLocalImp: TStringField
      FieldKind = fkLookup
      FieldName = 'DescLocalImp'
      LookupDataSet = IBT_Config
      LookupKeyFields = 'CODIGO_ID'
      LookupResultField = 'PORT_IMPRI'
      KeyFields = 'LOCAL_IMP'
      Size = 60
      Lookup = True
    end
    object IBT_ProdutosESTOQUEMIN: TFloatField
      FieldName = 'ESTOQUEMIN'
    end
    object IBT_ProdutosESTOQUEMAX: TFloatField
      FieldName = 'ESTOQUEMAX'
    end
    object IBT_ProdutosTEMPO: TIBStringField
      FieldName = 'TEMPO'
      Required = True
      Size = 5
    end
    object IBT_ProdutosDIA_PROD: TIBStringField
      FieldName = 'DIA_PROD'
      Size = 1
    end
    object IBT_ProdutosIMP_PERS: TIBStringField
      FieldName = 'IMP_PERS'
      Size = 1
    end
    object IBT_ProdutosVALSALDOENT: TFloatField
      FieldName = 'VALSALDOENT'
    end
    object IBT_ProdutosQTDSALDOENT: TFloatField
      FieldName = 'QTDSALDOENT'
    end
    object IBT_ProdutosTAXA: TFloatField
      FieldName = 'TAXA'
    end
    object IBT_ProdutosTAXA_SN: TIBStringField
      FieldName = 'TAXA_SN'
      Size = 1
    end
    object IBT_ProdutosLUCRO: TFloatField
      FieldName = 'LUCRO'
    end
    object IBT_ProdutosMOVEL: TIBStringField
      FieldName = 'MOVEL'
      Size = 1
    end
    object IBT_ProdutosPIS: TFloatField
      FieldName = 'PIS'
    end
    object IBT_ProdutosREDUCAOICMS: TFloatField
      FieldName = 'REDUCAOICMS'
    end
    object IBT_ProdutosCOFINS: TFloatField
      FieldName = 'COFINS'
    end
    object IBT_ProdutosICMS: TFloatField
      FieldName = 'ICMS'
    end
    object IBT_ProdutosTRIBUTAR_ANTIGO: TIntegerField
      FieldName = 'TRIBUTAR_ANTIGO'
    end
    object IBT_ProdutosTRIBUTAR_FORA_ANTIGO: TIntegerField
      FieldName = 'TRIBUTAR_FORA_ANTIGO'
    end
    object IBT_ProdutosPRECO_AGREGADO: TFloatField
      FieldName = 'PRECO_AGREGADO'
    end
    object IBT_ProdutosTRIBUTAR_FORA: TIntegerField
      FieldName = 'TRIBUTAR_FORA'
    end
    object IBT_ProdutosCST: TIntegerField
      FieldName = 'CST'
    end
    object IBT_ProdutosCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
    end
    object IBT_ProdutosCOMISPRSN: TIBStringField
      FieldName = 'COMISPRSN'
      Size = 1
    end
    object IBT_ProdutosITEMDATASUL: TIBStringField
      FieldName = 'ITEMDATASUL'
      Size = 16
    end
    object IBT_ProdutosCLASSFISC_DATASUL: TIBStringField
      FieldName = 'CLASSFISC_DATASUL'
      Size = 12
    end
    object IBT_ProdutosNATOPERACAO_DATASUL: TIBStringField
      FieldName = 'NATOPERACAO_DATASUL'
      Size = 8
    end
    object IBT_ProdutosUNITEM_DATASUL: TIBStringField
      FieldName = 'UNITEM_DATASUL'
      Size = 2
    end
    object IBT_ProdutosUNFAMI_DATASUL: TIBStringField
      FieldName = 'UNFAMI_DATASUL'
      Size = 2
    end
    object IBT_ProdutosCODTRIB_DATASUL: TIBStringField
      FieldName = 'CODTRIB_DATASUL'
      Size = 2
    end
    object IBT_ProdutosPERREDUCAOICMS_DATASUL: TIBStringField
      FieldName = 'PERREDUCAOICMS_DATASUL'
      Size = 7
    end
    object IBT_ProdutosNIVEL_ISENTO: TIntegerField
      FieldName = 'NIVEL_ISENTO'
    end
    object IBT_ProdutosOBSFRENTE: TIBStringField
      FieldName = 'OBSFRENTE'
      Size = 1
    end
    object IBT_ProdutosNCM: TIBStringField
      FieldName = 'NCM'
      Size = 8
    end
    object IBT_ProdutosBXCARTELA: TIBStringField
      FieldName = 'BXCARTELA'
      Size = 1
    end
    object IBT_ProdutosMONTAR: TIBStringField
      FieldName = 'MONTAR'
      Size = 1
    end
    object IBT_ProdutosTIPO: TIBStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object IBT_ProdutosESTLISTA_SN: TIBStringField
      FieldName = 'ESTLISTA_SN'
      Size = 1
    end
    object IBT_ProdutosST_ICMSE: TIntegerField
      FieldName = 'ST_ICMSE'
    end
    object IBT_ProdutosST_ICMSS: TIntegerField
      FieldName = 'ST_ICMSS'
    end
    object IBT_ProdutosST_IPI: TIntegerField
      FieldName = 'ST_IPI'
    end
    object IBT_ProdutosST_PIS: TIntegerField
      FieldName = 'ST_PIS'
    end
    object IBT_ProdutosST_COFINS: TIntegerField
      FieldName = 'ST_COFINS'
    end
    object IBT_ProdutosICMSS: TFloatField
      FieldName = 'ICMSS'
    end
    object IBT_ProdutosREDS: TFloatField
      FieldName = 'REDS'
    end
    object IBT_ProdutosIPI: TFloatField
      FieldName = 'IPI'
    end
    object IBT_ProdutosCODSERVICO: TIBStringField
      FieldName = 'CODSERVICO'
    end
    object IBT_ProdutosISSQN: TFloatField
      FieldName = 'ISSQN'
    end
    object IBT_ProdutosCF: TIBStringField
      FieldName = 'CF'
    end
    object IBT_ProdutosEXTIPI: TIBStringField
      FieldName = 'EXTIPI'
      Size = 5
    end
    object IBT_ProdutosMODALIDADEBC: TIBStringField
      FieldName = 'MODALIDADEBC'
      Size = 1
    end
    object IBT_ProdutosCBEMA: TLargeintField
      FieldName = 'CBEMA'
    end
    object IBT_ProdutosABC_LETRA: TIBStringField
      FieldName = 'ABC_LETRA'
      Size = 1
    end
    object IBT_ProdutosABC_PERCENTUAL: TFloatField
      FieldName = 'ABC_PERCENTUAL'
    end
    object IBT_ProdutosABC: TIBStringField
      FieldName = 'ABC'
      Size = 1
    end
    object IBT_ProdutosABC_DATAI: TDateField
      FieldName = 'ABC_DATAI'
    end
    object IBT_ProdutosABC_DATAF: TDateField
      FieldName = 'ABC_DATAF'
    end
    object IBT_ProdutosABC_PERCTOTAL: TFloatField
      FieldName = 'ABC_PERCTOTAL'
    end
    object IBT_ProdutosTICKETBARRASS_N: TIBStringField
      FieldName = 'TICKETBARRASS_N'
      Size = 1
    end
    object IBT_ProdutosCAMINHOTK: TIntegerField
      FieldName = 'CAMINHOTK'
    end
    object IBT_ProdutosTICKETS_N: TIBStringField
      FieldName = 'TICKETS_N'
      Size = 1
    end
    object IBT_ProdutosORIGEM: TIBStringField
      FieldName = 'ORIGEM'
      Size = 4
    end
    object IBT_ProdutosGTIN: TIBStringField
      FieldName = 'GTIN'
      Size = 14
    end
    object IBT_ProdutosPRECOPROMOCIONAL: TFloatField
      FieldName = 'PRECOPROMOCIONAL'
    end
    object IBT_ProdutosFIM_PROMOCAO: TDateField
      FieldName = 'FIM_PROMOCAO'
    end
    object IBT_ProdutosTMP_VALIDADE: TIntegerField
      FieldName = 'TMP_VALIDADE'
    end
    object IBT_ProdutosTIPOITEMATIV: TIntegerField
      FieldName = 'TIPOITEMATIV'
    end
    object IBT_ProdutosNAT_REC: TIBStringField
      FieldName = 'NAT_REC'
      Size = 3
    end
    object IBT_ProdutosAUTO_CALC_DIA: TIBStringField
      FieldName = 'AUTO_CALC_DIA'
      Size = 1
    end
    object IBT_ProdutosOPCAOIMP: TIBStringField
      FieldName = 'OPCAOIMP'
      Size = 1
    end
    object IBT_ProdutosST_PIS_ENTRADA: TIntegerField
      FieldName = 'ST_PIS_ENTRADA'
    end
    object IBT_ProdutosPIS_ENTRADA: TFloatField
      FieldName = 'PIS_ENTRADA'
    end
    object IBT_ProdutosST_COFINS_ENTRADA: TIntegerField
      FieldName = 'ST_COFINS_ENTRADA'
    end
    object IBT_ProdutosCOFINS_ENTRADA: TFloatField
      FieldName = 'COFINS_ENTRADA'
    end
  end
  object DTS_Produtos: TDataSource
    DataSet = IBT_Produtos
    Left = 160
    Top = 230
  end
  object IBT_TipoPagto: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    AfterDelete = IBT_TipoPagtoAfterDelete
    AfterInsert = IBT_TipoPagtoAfterInsert
    AfterPost = IBT_TipoPagtoAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'GAVETA'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY1'
        Fields = 'CODIGO_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'IDX_CLIFOR_CNPJ_RG'
        Fields = 'CNPJ_RG'
      end
      item
        Name = 'IDX_CLIFOR_NOMEFANTASIA'
        Fields = 'NOMEFANTASIA'
      end
      item
        Name = 'IDX_CLIFOR_RAZAOSOCIAL'
        Fields = 'RAZAOSOCIAL'
      end>
    StoreDefs = True
    TableName = 'TIPOPAGTO'
    Left = 236
    Top = 184
    object IBT_TipoPagtoCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_TipoPagtoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object IBT_TipoPagtoGAVETA: TIBStringField
      FieldName = 'GAVETA'
      Size = 1
    end
  end
  object DTS_TipoPagto: TDataSource
    DataSet = IBT_TipoPagto
    Left = 236
    Top = 230
  end
  object IBT_Tributar: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    AfterDelete = IBT_TributarAfterDelete
    AfterInsert = IBT_TributarAfterInsert
    AfterPost = IBT_TributarAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CODIGO'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'ALIQUOTA'
        DataType = ftFloat
      end
      item
        Name = 'SITUACAO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'SSITUACAO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ALIQUO'
        DataType = ftString
        Size = 4
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY23'
        Fields = 'CODIGO_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'IDX_TRIBUTAR_CODIGO'
        Fields = 'CODIGO'
      end
      item
        Name = 'IDX_TRIBUTAR_DESCRICAO'
        Fields = 'DESCRICAO'
      end
      item
        Name = 'IDX_TRIBUTAR_SITUACAO'
        Fields = 'SITUACAO'
      end>
    StoreDefs = True
    TableName = 'TRIBUTAR'
    Left = 314
    Top = 184
    object IBT_TributarCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_TributarCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Size = 5
    end
    object IBT_TributarDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object IBT_TributarALIQUOTA: TFloatField
      FieldName = 'ALIQUOTA'
      DisplayFormat = '###,###,##0.00'
    end
    object IBT_TributarSITUACAO: TIBStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
  end
  object DTS_Tributar: TDataSource
    DataSet = IBT_Tributar
    Left = 314
    Top = 230
  end
  object IBT_Turno: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    AfterDelete = IBT_TurnoAfterDelete
    AfterInsert = IBT_TurnoAfterInsert
    AfterPost = IBT_TurnoAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'HORAINICIO'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'HORAFIM'
        DataType = ftString
        Size = 5
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY32'
        Fields = 'CODIGO_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'IDX_TURNO_DESCRICAO'
        Fields = 'DESCRICAO'
      end
      item
        Name = 'IDX_TURNO_HORAINICIO'
        Fields = 'HORAINICIO'
      end
      item
        Name = 'IDX_TURNO_HORAFIM'
        Fields = 'HORAFIM'
      end>
    StoreDefs = True
    TableName = 'TURNO'
    Left = 391
    Top = 184
    object IBT_TurnoCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_TurnoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object IBT_TurnoHORAINICIO: TIBStringField
      FieldName = 'HORAINICIO'
      Size = 5
    end
    object IBT_TurnoHORAFIM: TIBStringField
      FieldName = 'HORAFIM'
      Size = 5
    end
  end
  object DTS_Turno: TDataSource
    DataSet = IBT_Turno
    Left = 391
    Top = 230
  end
  object IBT_Unidade: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    AfterDelete = IBT_UnidadeAfterDelete
    AfterInsert = IBT_UnidadeAfterInsert
    AfterPost = IBT_UnidadeAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'SIGLA'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY1'
        Fields = 'CODIGO_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'IDX_CLIFOR_CNPJ_RG'
        Fields = 'CNPJ_RG'
      end
      item
        Name = 'IDX_CLIFOR_NOMEFANTASIA'
        Fields = 'NOMEFANTASIA'
      end
      item
        Name = 'IDX_CLIFOR_RAZAOSOCIAL'
        Fields = 'RAZAOSOCIAL'
      end>
    StoreDefs = True
    TableName = 'UNIDADE'
    Left = 475
    Top = 184
    object IBT_UnidadeCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_UnidadeSIGLA: TIBStringField
      FieldName = 'SIGLA'
      Size = 5
    end
    object IBT_UnidadeDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  object DTS_Unidade: TDataSource
    DataSet = IBT_Unidade
    Left = 475
    Top = 230
  end
  object DataBaseIBF: TIBDatabase
    DatabaseName = 'D:\SVN\.DB\Cardapio\ARCOFecha.GDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=sysdbambd')
    LoginPrompt = False
    DefaultTransaction = IBTransactionF
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    AllowStreamedConnected = False
    Left = 24
    Top = 484
  end
  object IBTransactionF: TIBTransaction
    Active = False
    DefaultDatabase = DataBaseIBF
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 23
    Top = 532
  end
  object IBQ_MesaItem: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from MESAITEM')
    Left = 520
    Top = 32
  end
  object IBQ_USuNivel: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    OnCalcFields = IBQ_USuNivelCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DTS_Nivel
    SQL.Strings = (
      'Select * '
      'from usuario usu, funcionario fun'
      'where (usu.funcionario = fun.codigo_id)'
      'and (usu.nivel = :codigo_id)'
      'order by fun.descricao')
    Left = 668
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO_ID'
        ParamType = ptUnknown
        Size = 4
      end>
    object IBQ_USuNivelCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'USUARIO.CODIGO_ID'
      Required = True
    end
    object IBQ_USuNivelLOGIN: TIBStringField
      FieldName = 'LOGIN'
      Origin = 'USUARIO.LOGIN'
    end
    object IBQ_USuNivelNIVEL: TIntegerField
      FieldName = 'NIVEL'
      Origin = 'USUARIO.NIVEL'
    end
    object IBQ_USuNivelCHPB: TIBStringField
      FieldName = 'CHPB'
      Origin = 'USUARIO.CHPB'
    end
    object IBQ_USuNivelFUNCIONARIO: TIntegerField
      FieldName = 'FUNCIONARIO'
      Origin = 'USUARIO.FUNCIONARIO'
    end
    object IBQ_USuNivelSENHA: TIBStringField
      FieldName = 'SENHA'
      Origin = 'USUARIO.SENHA'
      Size = 4
    end
    object IBQ_USuNivelCODIGO_ID1: TIntegerField
      FieldName = 'CODIGO_ID1'
      Origin = 'FUNCIONARIO.CODIGO_ID'
      Required = True
    end
    object IBQ_USuNivelDESCRICAO: TIBStringField
      DisplayLabel = 'Funcionario'
      FieldName = 'DESCRICAO'
      Origin = 'FUNCIONARIO.DESCRICAO'
      Size = 60
    end
    object IBQ_USuNivelPONTOVENDA: TIntegerField
      FieldName = 'PONTOVENDA'
      Origin = 'FUNCIONARIO.PONTOVENDA'
    end
    object IBQ_USuNivelDT_NASCTO: TDateField
      FieldName = 'DT_NASCTO'
      Origin = 'FUNCIONARIO.DT_NASCTO'
    end
    object IBQ_USuNivelENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = 'FUNCIONARIO.ENDERECO'
      Size = 60
    end
    object IBQ_USuNivelBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = 'FUNCIONARIO.BAIRRO'
      Size = 30
    end
    object IBQ_USuNivelCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = 'FUNCIONARIO.CIDADE'
      Size = 30
    end
    object IBQ_USuNivelTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Origin = 'FUNCIONARIO.TELEFONE'
      Size = 15
    end
    object IBQ_USuNivelATIVO: TIBStringField
      FieldName = 'ATIVO'
      Origin = 'FUNCIONARIO.ATIVO'
      Required = True
      Size = 1
    end
    object IBQ_USuNivelADMISSAO: TDateField
      FieldName = 'ADMISSAO'
      Origin = 'FUNCIONARIO.ADMISSAO'
    end
    object IBQ_USuNivelDEMISSAO: TDateField
      FieldName = 'DEMISSAO'
      Origin = 'FUNCIONARIO.DEMISSAO'
    end
    object IBQ_USuNivelturno: TIntegerField
      FieldName = 'turno'
      Origin = 'FUNCIONARIO.turno'
    end
    object IBQ_USuNivelCARGO: TIntegerField
      FieldName = 'CARGO'
      Origin = 'FUNCIONARIO.CARGO'
    end
    object IBQ_USuNivelSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'FUNCIONARIO.STATUS'
      Size = 1
    end
    object IBQ_USuNivelDesLogin: TStringField
      DisplayLabel = 'Login'
      FieldKind = fkCalculated
      FieldName = 'DesLogin'
      Size = 60
      Calculated = True
    end
  end
  object IBTransaction_Commit: TIBTransaction
    Active = False
    DefaultDatabase = DataBaseIB
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 184
    Top = 13
  end
  object IBQ_DTSystem: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select cast('#39'NOW'#39' as Date) as Data_Ser, cast('#39'NOW'#39' as Time) as H' +
        'ora_Ser'
      'from RDB$DATABASE;')
    Left = 672
    Top = 288
    object IBQ_DTSystemDATA_SER: TDateField
      FieldName = 'DATA_SER'
      Required = True
    end
    object IBQ_DTSystemHORA_SER: TTimeField
      FieldName = 'HORA_SER'
      Required = True
    end
  end
  object DataBaseIBO: TIBDatabase
    DatabaseName = 'D:\SVN\.DB\Cardapio\ARCOOLD.GDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=sysdbambd')
    LoginPrompt = False
    DefaultTransaction = IBTransactionO
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    AllowStreamedConnected = False
    Left = 128
    Top = 514
  end
  object IBTransactionO: TIBTransaction
    Active = False
    DefaultDatabase = DataBaseIBO
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 135
    Top = 566
  end
  object IBT_ConfFirma: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    AfterDelete = IBT_ConfigAfterDelete
    AfterInsert = IBT_ConfigAfterInsert
    AfterPost = IBT_ConfigAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
      end
      item
        Name = 'ATIVO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'RELFECHA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 50
      end>
    Filter = 'Ativo='#39'S'#39
    Filtered = True
    StoreDefs = True
    TableName = 'CONFFIRMA'
    Left = 576
    Top = 292
    object IBT_ConfFirmaCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object IBT_ConfFirmaATIVO: TIBStringField
      FieldName = 'ATIVO'
      Size = 1
    end
    object IBT_ConfFirmaRELFECHA: TIBStringField
      FieldName = 'RELFECHA'
      Size = 1
    end
    object IBT_ConfFirmaDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
  end
  object DTS_ConfFirma: TDataSource
    DataSet = IBT_ConfFirma
    Left = 576
    Top = 338
  end
  object IBT_MesaCond: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    AfterDelete = IBT_MesaItemAfterDelete
    AfterInsert = IBT_MesaItemAfterInsert
    AfterPost = IBT_MesaItemAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'MESA'
        DataType = ftInteger
      end
      item
        Name = 'SEQUENCIA'
        DataType = ftInteger
      end
      item
        Name = 'TIPO_PAGTO'
        DataType = ftInteger
      end
      item
        Name = 'TOTAL'
        DataType = ftFloat
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
        Name = 'MESAFECHA'
        DataType = ftInteger
      end
      item
        Name = 'SEQFECHA'
        DataType = ftInteger
      end
      item
        Name = 'TEMPO'
        Attributes = [faReadonly]
        DataType = ftDateTime
      end
      item
        Name = 'FECHA'
        DataType = ftDate
      end
      item
        Name = 'DEVEDOR'
        DataType = ftFloat
      end
      item
        Name = 'CORTESIA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TURNO'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY1'
        Fields = 'CODIGO_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'IDX_CLIFOR_CNPJ_RG'
        Fields = 'CNPJ_RG'
      end
      item
        Name = 'IDX_CLIFOR_NOMEFANTASIA'
        Fields = 'NOMEFANTASIA'
      end
      item
        Name = 'IDX_CLIFOR_RAZAOSOCIAL'
        Fields = 'RAZAOSOCIAL'
      end>
    StoreDefs = True
    TableName = 'MESACOND'
    Left = 550
    Top = 76
    object IBT_MesaCondCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_MesaCondMESA: TIntegerField
      FieldName = 'MESA'
    end
    object IBT_MesaCondSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
    end
    object IBT_MesaCondTIPO_PAGTO: TIntegerField
      FieldName = 'TIPO_PAGTO'
    end
    object IBT_MesaCondTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object IBT_MesaCondHORA_PAGTO: TIBStringField
      FieldName = 'HORA_PAGTO'
      Size = 5
    end
    object IBT_MesaCondDATA_PAGTO: TDateField
      FieldName = 'DATA_PAGTO'
    end
    object IBT_MesaCondMESAFECHA: TIntegerField
      FieldName = 'MESAFECHA'
    end
    object IBT_MesaCondSEQFECHA: TIntegerField
      FieldName = 'SEQFECHA'
    end
    object IBT_MesaCondTEMPO: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO'
      ReadOnly = True
    end
    object IBT_MesaCondFECHA: TDateField
      FieldName = 'FECHA'
    end
    object IBT_MesaCondDEVEDOR: TFloatField
      FieldName = 'DEVEDOR'
    end
    object IBT_MesaCondCORTESIA: TIBStringField
      FieldName = 'CORTESIA'
      Size = 1
    end
    object IBT_MesaCondTURNO: TIntegerField
      FieldName = 'TURNO'
    end
  end
  object DTS_MesaCond: TDataSource
    DataSet = IBT_MesaCond
    Left = 550
    Top = 122
  end
  object DTS_Parametros: TDataSource
    DataSet = IBT_Parametros
    Left = 316
    Top = 338
  end
  object IBQ_GravaProd: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select *   from PRODUTOS')
    Left = 660
    Top = 360
    object IBQ_GravaProdCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'PRODUTOS.CODIGO_ID'
      Required = True
    end
    object IBQ_GravaProdPRODUTO: TIBStringField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTOS.PRODUTO'
      Size = 13
    end
    object IBQ_GravaProdDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'PRODUTOS.DESCRICAO'
      Size = 50
    end
    object IBQ_GravaProdPRECO: TFloatField
      FieldName = 'PRECO'
      Origin = 'PRODUTOS.PRECO'
    end
    object IBQ_GravaProdPRECOCUSTO: TFloatField
      FieldName = 'PRECOCUSTO'
      Origin = 'PRODUTOS.PRECOCUSTO'
    end
    object IBQ_GravaProdGRUPO: TIntegerField
      FieldName = 'GRUPO'
      Origin = 'PRODUTOS.GRUPO'
    end
    object IBQ_GravaProdICMS_SN: TIBStringField
      FieldName = 'ICMS_SN'
      Origin = 'PRODUTOS.ICMS_SN'
      Required = True
      Size = 1
    end
    object IBQ_GravaProdTRIBUTAR: TIntegerField
      FieldName = 'TRIBUTAR'
      Origin = 'PRODUTOS.TRIBUTAR'
    end
    object IBQ_GravaProdBALANCA: TIBStringField
      FieldName = 'BALANCA'
      Origin = 'PRODUTOS.BALANCA'
      Required = True
      Size = 1
    end
    object IBQ_GravaProdTARA: TFloatField
      FieldName = 'TARA'
      Origin = 'PRODUTOS.TARA'
    end
    object IBQ_GravaProdUNIDADE: TIntegerField
      FieldName = 'UNIDADE'
      Origin = 'PRODUTOS.UNIDADE'
    end
    object IBQ_GravaProdATIVO: TIBStringField
      FieldName = 'ATIVO'
      Origin = 'PRODUTOS.ATIVO'
      Required = True
      Size = 1
    end
    object IBQ_GravaProdCOMANDA: TIBStringField
      FieldName = 'COMANDA'
      Origin = 'PRODUTOS.COMANDA'
      Required = True
      Size = 1
    end
    object IBQ_GravaProdLOCAL_IMP: TIntegerField
      FieldName = 'LOCAL_IMP'
      Origin = 'PRODUTOS.LOCAL_IMP'
    end
    object IBQ_GravaProdDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      Origin = 'PRODUTOS.DESCONTO'
    end
    object IBQ_GravaProdACRESCIMO: TFloatField
      FieldName = 'ACRESCIMO'
      Origin = 'PRODUTOS.ACRESCIMO'
    end
    object IBQ_GravaProdPROD_MTN: TIntegerField
      FieldName = 'PROD_MTN'
      Origin = 'PRODUTOS.PROD_MTN'
    end
    object IBQ_GravaProdESTOQUE: TIBStringField
      FieldName = 'ESTOQUE'
      Origin = 'PRODUTOS.ESTOQUE'
      Size = 1
    end
    object IBQ_GravaProdESTNEGATIVO: TIBStringField
      FieldName = 'ESTNEGATIVO'
      Origin = 'PRODUTOS.ESTNEGATIVO'
      Size = 1
    end
    object IBQ_GravaProdESTOQUE_FISICO: TFloatField
      FieldName = 'ESTOQUE_FISICO'
      Origin = 'PRODUTOS.ESTOQUE_FISICO'
    end
    object IBQ_GravaProdESTOQUE_VIRTUAL: TFloatField
      FieldName = 'ESTOQUE_VIRTUAL'
      Origin = 'PRODUTOS.ESTOQUE_VIRTUAL'
    end
    object IBQ_GravaProdVALSALDOENT: TFloatField
      FieldName = 'VALSALDOENT'
      Origin = 'PRODUTOS.VALSALDOENT'
    end
    object IBQ_GravaProdQTDSALDOENT: TFloatField
      FieldName = 'QTDSALDOENT'
      Origin = 'PRODUTOS.QTDSALDOENT'
    end
  end
  object IBQ_GraEstProd: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select *  from PRODUTOS')
    Left = 660
    Top = 372
  end
  object IBT_MovEstoque: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    AfterDelete = IBT_CargoAfterDelete
    AfterInsert = IBT_CargoAfterInsert
    AfterPost = IBT_CargoAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PRODUTOS'
        DataType = ftInteger
      end
      item
        Name = 'CLIFOR'
        DataType = ftInteger
      end
      item
        Name = 'HISTORICO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'VALENTRADA'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'QTDENTRADA'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'VALSAIDA'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'QTDSAIDA'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'VALSALDO'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'QTDSALDO'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'CENTROCUSTO'
        DataType = ftInteger
      end
      item
        Name = 'DATA'
        DataType = ftDateTime
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY92'
        Fields = 'NUMERO_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN93'
        Fields = 'CENTROCUSTO'
      end
      item
        Name = 'RDB$FOREIGN94'
        Fields = 'CLIFOR'
      end
      item
        Name = 'RDB$FOREIGN95'
        Fields = 'MATPRIMA'
      end
      item
        Name = 'IDX_MOVTOSTQ_DATA'
        Fields = 'DATA'
      end>
    StoreDefs = True
    TableName = 'MOVTOSTQ'
    Left = 608
    Top = 420
    object IBT_MovEstoqueCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_MovEstoquePRODUTOS: TIntegerField
      FieldName = 'PRODUTOS'
    end
    object IBT_MovEstoqueCLIFOR: TIntegerField
      FieldName = 'CLIFOR'
    end
    object IBT_MovEstoqueHISTORICO: TIBStringField
      FieldName = 'HISTORICO'
      Required = True
      Size = 60
    end
    object IBT_MovEstoqueVALENTRADA: TFloatField
      FieldName = 'VALENTRADA'
      Required = True
    end
    object IBT_MovEstoqueQTDENTRADA: TFloatField
      FieldName = 'QTDENTRADA'
      Required = True
    end
    object IBT_MovEstoqueVALSAIDA: TFloatField
      FieldName = 'VALSAIDA'
      Required = True
    end
    object IBT_MovEstoqueQTDSAIDA: TFloatField
      FieldName = 'QTDSAIDA'
      Required = True
    end
    object IBT_MovEstoqueVALSALDO: TFloatField
      FieldName = 'VALSALDO'
      Required = True
    end
    object IBT_MovEstoqueQTDSALDO: TFloatField
      FieldName = 'QTDSALDO'
      Required = True
    end
    object IBT_MovEstoqueCENTROCUSTO: TIntegerField
      FieldName = 'CENTROCUSTO'
    end
    object IBT_MovEstoqueDATA: TDateTimeField
      FieldName = 'DATA'
    end
  end
  object DTS_MovEstoque: TDataSource
    DataSet = IBT_MovEstoque
    Left = 608
    Top = 472
  end
  object IBQ_EstGravar: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from MOVTOSTQ')
    Left = 715
    Top = 416
    object IBQ_EstGravarCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'MOVTOSTQ.CODIGO_ID'
      Required = True
    end
    object IBQ_EstGravarPRODUTOS: TIntegerField
      FieldName = 'PRODUTOS'
      Origin = 'MOVTOSTQ.PRODUTOS'
    end
    object IBQ_EstGravarCLIFOR: TIntegerField
      FieldName = 'CLIFOR'
      Origin = 'MOVTOSTQ.CLIFOR'
    end
    object IBQ_EstGravarHISTORICO: TIBStringField
      FieldName = 'HISTORICO'
      Origin = 'MOVTOSTQ.HISTORICO'
      Required = True
      Size = 60
    end
    object IBQ_EstGravarVALENTRADA: TFloatField
      FieldName = 'VALENTRADA'
      Origin = 'MOVTOSTQ.VALENTRADA'
      Required = True
    end
    object IBQ_EstGravarQTDENTRADA: TFloatField
      FieldName = 'QTDENTRADA'
      Origin = 'MOVTOSTQ.QTDENTRADA'
      Required = True
    end
    object IBQ_EstGravarVALSAIDA: TFloatField
      FieldName = 'VALSAIDA'
      Origin = 'MOVTOSTQ.VALSAIDA'
      Required = True
    end
    object IBQ_EstGravarQTDSAIDA: TFloatField
      FieldName = 'QTDSAIDA'
      Origin = 'MOVTOSTQ.QTDSAIDA'
      Required = True
    end
    object IBQ_EstGravarVALSALDO: TFloatField
      FieldName = 'VALSALDO'
      Origin = 'MOVTOSTQ.VALSALDO'
      Required = True
    end
    object IBQ_EstGravarQTDSALDO: TFloatField
      FieldName = 'QTDSALDO'
      Origin = 'MOVTOSTQ.QTDSALDO'
      Required = True
    end
    object IBQ_EstGravarCENTROCUSTO: TIntegerField
      FieldName = 'CENTROCUSTO'
      Origin = 'MOVTOSTQ.CENTROCUSTO'
    end
    object IBQ_EstGravarDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'MOVTOSTQ.DATA'
    end
  end
  object IBQ_CalEstoque: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    OnCalcFields = IBQ_CalEstoqueCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from MOVTOSTQ')
    Left = 715
    Top = 472
    object IBQ_CalEstoqueCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'MOVTOSTQ.CODIGO_ID'
      Required = True
    end
    object IBQ_CalEstoquePRODUTOS: TIntegerField
      FieldName = 'PRODUTOS'
      Origin = 'MOVTOSTQ.PRODUTOS'
    end
    object IBQ_CalEstoqueCLIFOR: TIntegerField
      FieldName = 'CLIFOR'
      Origin = 'MOVTOSTQ.CLIFOR'
    end
    object IBQ_CalEstoqueHISTORICO: TIBStringField
      FieldName = 'HISTORICO'
      Origin = 'MOVTOSTQ.HISTORICO'
      Required = True
      Size = 60
    end
    object IBQ_CalEstoqueVALENTRADA: TFloatField
      FieldName = 'VALENTRADA'
      Origin = 'MOVTOSTQ.VALENTRADA'
      Required = True
    end
    object IBQ_CalEstoqueQTDENTRADA: TFloatField
      FieldName = 'QTDENTRADA'
      Origin = 'MOVTOSTQ.QTDENTRADA'
      Required = True
    end
    object IBQ_CalEstoqueVALSAIDA: TFloatField
      FieldName = 'VALSAIDA'
      Origin = 'MOVTOSTQ.VALSAIDA'
      Required = True
    end
    object IBQ_CalEstoqueQTDSAIDA: TFloatField
      FieldName = 'QTDSAIDA'
      Origin = 'MOVTOSTQ.QTDSAIDA'
      Required = True
    end
    object IBQ_CalEstoqueVALSALDO: TFloatField
      FieldName = 'VALSALDO'
      Origin = 'MOVTOSTQ.VALSALDO'
      Required = True
    end
    object IBQ_CalEstoqueQTDSALDO: TFloatField
      FieldName = 'QTDSALDO'
      Origin = 'MOVTOSTQ.QTDSALDO'
      Required = True
    end
    object IBQ_CalEstoqueCENTROCUSTO: TIntegerField
      FieldName = 'CENTROCUSTO'
      Origin = 'MOVTOSTQ.CENTROCUSTO'
    end
    object IBQ_CalEstoquecPreMedio: TCurrencyField
      DisplayLabel = 'Pre. Med.'
      FieldKind = fkCalculated
      FieldName = 'cPreMedio'
      Calculated = True
    end
    object IBQ_CalEstoqueDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'MOVTOSTQ.DATA'
    end
  end
  object CDS_OVariasFormas: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Cond'
        DataType = ftInteger
      end
      item
        Name = 'Valor'
        DataType = ftFloat
      end
      item
        Name = 'Flag'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'Devedor'
        DataType = ftFloat
      end
      item
        Name = 'TEF'
        DataType = ftInteger
      end
      item
        Name = 'DifTef'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 402
    Top = 310
    Data = {
      790000009619E0BD010000001800000006000000000003000000790004436F6E
      6404000100000000000556616C6F72080004000000000004466C616701004900
      0000010005574944544802000200FA000744657665646F720800040000000000
      0354454604000100000000000644696654656608000400000000000000}
    object CDS_OVariasFormasCond: TIntegerField
      FieldName = 'Cond'
    end
    object CDS_OVariasFormasValor: TFloatField
      FieldName = 'Valor'
    end
    object CDS_OVariasFormasFlag: TStringField
      FieldName = 'Flag'
      Size = 250
    end
    object CDS_OVariasFormasDevedor: TFloatField
      FieldName = 'Devedor'
    end
    object CDS_OVariasFormasTEF: TIntegerField
      FieldName = 'TEF'
    end
    object CDS_OVariasFormasDifTef: TFloatField
      FieldName = 'DifTef'
    end
  end
  object CDS_VariasFormas: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Cond'
        DataType = ftInteger
      end
      item
        Name = 'Valor'
        DataType = ftFloat
      end
      item
        Name = 'Flag'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'Devedor'
        DataType = ftFloat
      end
      item
        Name = 'TEF'
        DataType = ftInteger
      end
      item
        Name = 'DifTef'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 494
    Top = 310
    Data = {
      790000009619E0BD010000001800000006000000000003000000790004436F6E
      6404000100000000000556616C6F72080004000000000004466C616701004900
      0000010005574944544802000200FA000744657665646F720800040000000000
      0354454604000100000000000644696654656608000400000000000000}
    object CDS_VariasFormasCond: TIntegerField
      FieldName = 'Cond'
    end
    object CDS_VariasFormasValor: TFloatField
      FieldName = 'Valor'
      currency = True
    end
    object CDS_VariasFormasFlag: TStringField
      FieldName = 'Flag'
      Size = 250
    end
    object CDS_VariasFormasDevedor: TFloatField
      FieldName = 'Devedor'
      currency = True
    end
    object CDS_VariasFormasTEF: TIntegerField
      FieldName = 'TEF'
    end
    object CDS_VariasFormasDifTef: TFloatField
      FieldName = 'DifTef'
    end
  end
  object DTS_VariasFormas: TDataSource
    DataSet = CDS_VariasFormas
    Left = 494
    Top = 362
  end
  object DTS_OVariasFormas: TDataSource
    DataSet = CDS_OVariasFormas
    Left = 402
    Top = 362
  end
  object IBT_Cliente: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    AfterDelete = IBT_PeriodoAfterDelete
    AfterInsert = IBT_PeriodoAfterInsert
    AfterPost = IBT_PeriodoAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NOMEFANTASIA'
        Attributes = [faRequired]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'RAZAOSOCIAL'
        Attributes = [faRequired]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CNPJ'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CPF'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IE'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RG'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ENDERECO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'BAIRRO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'TELEFONE'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'FAX'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CONTATO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'SITE'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'ATIVO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'UF'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'TIPOCLIFOR'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'MATRICULA'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'OBSERVACAO'
        DataType = ftBlob
      end
      item
        Name = 'SALDO_CASTO'
        DataType = ftFloat
      end
      item
        Name = 'SALDO_LIMITE'
        DataType = ftFloat
      end
      item
        Name = 'TRAVAMENSAGEM'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CONTRATO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DTCADASTRO'
        DataType = ftDate
      end
      item
        Name = 'CODCONTMATIC'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'TP_PESSOAL'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CELULAR'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DATA_NASC'
        DataType = ftDate
      end>
    Filter = 'ATIVO='#39'S'#39
    Filtered = True
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY67'
        Fields = 'CODIGO_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'IDX_CLIFOR_NOMEFANTASIA'
        Fields = 'NOMEFANTASIA'
      end>
    StoreDefs = True
    TableName = 'CLIFOR'
    Left = 548
    Top = 184
    object IBT_ClienteCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_ClienteNOMEFANTASIA: TIBStringField
      FieldName = 'NOMEFANTASIA'
      Required = True
      Size = 60
    end
    object IBT_ClienteRAZAOSOCIAL: TIBStringField
      FieldName = 'RAZAOSOCIAL'
      Required = True
      Size = 60
    end
    object IBT_ClienteCNPJ: TIBStringField
      FieldName = 'CNPJ'
      EditMask = '##\.###\.###\/####\-##;0;_'
      Size = 30
    end
    object IBT_ClienteCPF: TIBStringField
      FieldName = 'CPF'
      EditMask = '###\.###\.###\-##;0;_'
      Size = 30
    end
    object IBT_ClienteIE: TIBStringField
      FieldName = 'IE'
      Size = 30
    end
    object IBT_ClienteRG: TIBStringField
      FieldName = 'RG'
      Size = 30
    end
    object IBT_ClienteENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object IBT_ClienteBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Size = 60
    end
    object IBT_ClienteCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Size = 60
    end
    object IBT_ClienteTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Size = 30
    end
    object IBT_ClienteFAX: TIBStringField
      FieldName = 'FAX'
      Size = 30
    end
    object IBT_ClienteCONTATO: TIBStringField
      FieldName = 'CONTATO'
      Size = 60
    end
    object IBT_ClienteEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Size = 60
    end
    object IBT_ClienteSITE: TIBStringField
      FieldName = 'SITE'
      Size = 60
    end
    object IBT_ClienteATIVO: TIBStringField
      FieldName = 'ATIVO'
      Size = 1
    end
    object IBT_ClienteCEP: TIBStringField
      FieldName = 'CEP'
      EditMask = '#####\-###;1;_'
      Size = 10
    end
    object IBT_ClienteUF: TIBStringField
      FieldName = 'UF'
      Size = 2
    end
    object IBT_ClienteTIPOCLIFOR: TIBStringField
      FieldName = 'TIPOCLIFOR'
      Size = 1
    end
    object IBT_ClienteMATRICULA: TIBStringField
      FieldName = 'MATRICULA'
      Size = 25
    end
    object IBT_ClienteOBSERVACAO: TBlobField
      FieldName = 'OBSERVACAO'
    end
    object IBT_ClienteSALDO_CASTO: TFloatField
      FieldName = 'SALDO_CASTO'
    end
    object IBT_ClienteSALDO_LIMITE: TFloatField
      FieldName = 'SALDO_LIMITE'
    end
    object IBT_ClienteTRAVAMENSAGEM: TIBStringField
      FieldName = 'TRAVAMENSAGEM'
      Size = 1
    end
    object IBT_ClienteCONTRATO: TIBStringField
      FieldName = 'CONTRATO'
      Size = 1
    end
    object IBT_ClienteDTCADASTRO: TDateField
      FieldName = 'DTCADASTRO'
    end
    object IBT_ClienteCELULAR: TIBStringField
      FieldName = 'CELULAR'
      Size = 30
    end
    object IBT_ClienteDATA_NASC: TDateField
      FieldName = 'DATA_NASC'
      EditMask = '##/##/####;1;_'
    end
  end
  object DTS_Cliente: TDataSource
    DataSet = IBT_Cliente
    Left = 548
    Top = 230
  end
  object IBQ_CxList: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CxMovto')
    Left = 696
    Top = 339
    object IBQ_CxListNUMERO_ID: TIntegerField
      FieldName = 'NUMERO_ID'
      Origin = 'CXMOVTO.NUMERO_ID'
      Required = True
    end
    object IBQ_CxListCAIXA: TIntegerField
      FieldName = 'CAIXA'
      Origin = 'CXMOVTO.CAIXA'
    end
    object IBQ_CxListDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'CXMOVTO.DATA'
    end
    object IBQ_CxListHISTORICO: TMemoField
      FieldName = 'HISTORICO'
      Origin = 'CXMOVTO.HISTORICO'
      BlobType = ftMemo
      Size = 8
    end
    object IBQ_CxListCONTA: TIntegerField
      FieldName = 'CONTA'
      Origin = 'CXMOVTO.CONTA'
    end
    object IBQ_CxListSUBCONTA: TIntegerField
      FieldName = 'SUBCONTA'
      Origin = 'CXMOVTO.SUBCONTA'
    end
    object IBQ_CxListDEBCRED: TIBStringField
      FieldName = 'DEBCRED'
      Origin = 'CXMOVTO.DEBCRED'
      Required = True
      Size = 1
    end
    object IBQ_CxListVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'CXMOVTO.VALOR'
    end
    object IBQ_CxListSALDO: TFloatField
      FieldName = 'SALDO'
      Origin = 'CXMOVTO.SALDO'
    end
    object IBQ_CxListCLIFOR: TIntegerField
      FieldName = 'CLIFOR'
      Origin = 'CXMOVTO.CLIFOR'
    end
    object IBQ_CxListDOCUMENTO: TIBStringField
      FieldName = 'DOCUMENTO'
      Origin = 'CXMOVTO.DOCUMENTO'
      Size = 30
    end
    object IBQ_CxListTIPO_DES: TIBStringField
      FieldName = 'TIPO_DES'
      Origin = 'CXMOVTO.TIPO_DES'
      Size = 3
    end
    object IBQ_CxListTIPO_ORI: TIBStringField
      FieldName = 'TIPO_ORI'
      Origin = 'CXMOVTO.TIPO_ORI'
      Size = 3
    end
    object IBQ_CxListCODE_ORI: TIntegerField
      FieldName = 'CODE_ORI'
      Origin = 'CXMOVTO.CODE_ORI'
    end
  end
  object IBQ_Grava: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CxMovto')
    Left = 752
    Top = 335
    object IntegerField18: TIntegerField
      FieldName = 'NUMERO_ID'
      Origin = 'CXMOVTO.NUMERO_ID'
      Required = True
    end
    object IBQ_GravarCAIXA: TIntegerField
      FieldName = 'CAIXA'
      Origin = 'CXMOVTO.CAIXA'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DATA'
      Origin = 'CXMOVTO.DATA'
    end
    object MemoField1: TMemoField
      FieldName = 'HISTORICO'
      Origin = 'CXMOVTO.HISTORICO'
      BlobType = ftMemo
      Size = 8
    end
    object IntegerField19: TIntegerField
      FieldName = 'CONTA'
      Origin = 'CXMOVTO.CONTA'
    end
    object IntegerField20: TIntegerField
      FieldName = 'SUBCONTA'
      Origin = 'CXMOVTO.SUBCONTA'
    end
    object IBStringField22: TIBStringField
      FieldName = 'DEBCRED'
      Origin = 'CXMOVTO.DEBCRED'
      Required = True
      Size = 1
    end
    object FloatField6: TFloatField
      FieldName = 'VALOR'
      Origin = 'CXMOVTO.VALOR'
    end
    object FloatField7: TFloatField
      FieldName = 'SALDO'
      Origin = 'CXMOVTO.SALDO'
    end
    object IntegerField21: TIntegerField
      FieldName = 'CLIFOR'
      Origin = 'CXMOVTO.CLIFOR'
    end
    object IBStringField23: TIBStringField
      FieldName = 'DOCUMENTO'
      Origin = 'CXMOVTO.DOCUMENTO'
      Size = 30
    end
  end
  object IBT_MovtoDiaria: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    AfterDelete = IBT_PeriodoAfterDelete
    AfterInsert = IBT_PeriodoAfterInsert
    AfterPost = IBT_PeriodoAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DIARIA'
        DataType = ftInteger
      end
      item
        Name = 'MESA'
        DataType = ftInteger
      end
      item
        Name = 'SEQUENCIA'
        DataType = ftInteger
      end
      item
        Name = 'DATA_INICIO'
        DataType = ftDate
      end
      item
        Name = 'DATA_FINAL'
        DataType = ftDate
      end
      item
        Name = 'HORA_INICIO'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'HORA_FINAL'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'TEMPO_INICIAL'
        Attributes = [faReadonly]
        DataType = ftDateTime
      end
      item
        Name = 'TEMPO_FINAL'
        Attributes = [faReadonly]
        DataType = ftDateTime
      end
      item
        Name = 'GARCOM'
        DataType = ftInteger
      end
      item
        Name = 'QTDEDIARIA'
        DataType = ftInteger
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO'
        DataType = ftFloat
      end
      item
        Name = 'FINALIZADA'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY141'
        Fields = 'CODIGO_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN142'
        Fields = 'GARCOM'
      end
      item
        Name = 'RDB$FOREIGN143'
        Fields = 'DIARIA'
      end
      item
        Name = 'IDX_MOVTODIARIA_MS'
        Fields = 'MESA;SEQUENCIA'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'MOVTODIARIA'
    Left = 92
    Top = 382
    object IBT_MovtoDiariaCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_MovtoDiariaDIARIA: TIntegerField
      FieldName = 'DIARIA'
    end
    object IBT_MovtoDiariaMESA: TIntegerField
      FieldName = 'MESA'
    end
    object IBT_MovtoDiariaSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
    end
    object IBT_MovtoDiariaDATA_INICIO: TDateField
      FieldName = 'DATA_INICIO'
    end
    object IBT_MovtoDiariaDATA_FINAL: TDateField
      FieldName = 'DATA_FINAL'
    end
    object IBT_MovtoDiariaHORA_INICIO: TIBStringField
      FieldName = 'HORA_INICIO'
      Size = 5
    end
    object IBT_MovtoDiariaHORA_FINAL: TIBStringField
      FieldName = 'HORA_FINAL'
      Size = 5
    end
    object IBT_MovtoDiariaTEMPO_INICIAL: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO_INICIAL'
      ReadOnly = True
    end
    object IBT_MovtoDiariaTEMPO_FINAL: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO_FINAL'
      ReadOnly = True
    end
    object IBT_MovtoDiariaGARCOM: TIntegerField
      FieldName = 'GARCOM'
    end
    object IBT_MovtoDiariaQTDEDIARIA: TIntegerField
      FieldName = 'QTDEDIARIA'
    end
    object IBT_MovtoDiariaVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object IBT_MovtoDiariaDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
    object IBT_MovtoDiariaFINALIZADA: TIBStringField
      FieldName = 'FINALIZADA'
      Required = True
      Size = 1
    end
  end
  object DTS_MovtoDiaria: TDataSource
    DataSet = IBT_MovtoDiaria
    Left = 100
    Top = 428
  end
  object IBT_Diaria: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    AfterDelete = IBT_ConfigAfterDelete
    AfterInsert = IBT_ConfigAfterInsert
    AfterPost = IBT_ConfigAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PRODUTO'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PRECO'
        DataType = ftFloat
      end
      item
        Name = 'PRECOCUSTO'
        DataType = ftFloat
      end
      item
        Name = 'GRUPO'
        DataType = ftInteger
      end
      item
        Name = 'ICMS_SN'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TRIBUTAR'
        DataType = ftInteger
      end
      item
        Name = 'BALANCA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TARA'
        DataType = ftFloat
      end
      item
        Name = 'UNIDADE'
        DataType = ftInteger
      end
      item
        Name = 'ATIVO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'COMANDA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'LOCAL_IMP'
        DataType = ftInteger
      end
      item
        Name = 'DESCONTO'
        DataType = ftFloat
      end
      item
        Name = 'ACRESCIMO'
        DataType = ftFloat
      end
      item
        Name = 'PROD_MTN'
        DataType = ftInteger
      end
      item
        Name = 'ESTOQUE'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ESTNEGATIVO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ESTOQUE_FISICO'
        DataType = ftFloat
      end
      item
        Name = 'ESTOQUE_VIRTUAL'
        DataType = ftFloat
      end
      item
        Name = 'ESTOQUEMIN'
        DataType = ftFloat
      end
      item
        Name = 'ESTOQUEMAX'
        DataType = ftFloat
      end
      item
        Name = 'TEMPO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 5
      end
      item
        Name = 'DIA_PROD'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'IMP_PERS'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'VALSALDOENT'
        DataType = ftFloat
      end
      item
        Name = 'QTDSALDOENT'
        DataType = ftFloat
      end
      item
        Name = 'TAXA'
        DataType = ftFloat
      end
      item
        Name = 'TAXA_SN'
        DataType = ftString
        Size = 1
      end>
    Filter = 'DIA_PROD = '#39'D'#39
    Filtered = True
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY29'
        Fields = 'CODIGO_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN36'
        Fields = 'TRIBUTAR'
      end
      item
        Name = 'RDB$FOREIGN37'
        Fields = 'UNIDADE'
      end
      item
        Name = 'RDB$FOREIGN38'
        Fields = 'GRUPO'
      end
      item
        Name = 'IDX_PRODUTO_ATIVO'
        Fields = 'ATIVO'
      end
      item
        Name = 'IDX_PRODUTO_BALANCA'
        Fields = 'BALANCA'
      end
      item
        Name = 'IDX_PRODUTO_COMANDA'
        Fields = 'COMANDA'
      end
      item
        Name = 'IDX_PRODUTO_DESCRICAO'
        Fields = 'DESCRICAO'
      end
      item
        Name = 'IDX_PRODUTO_PRODUTO'
        Fields = 'PRODUTO'
      end
      item
        Name = 'RDB$FOREIGN57'
        Fields = 'LOCAL_IMP'
      end
      item
        Name = 'IDX_PRODUTOS_PRODUNIQ'
        Fields = 'PRODUTO'
        Options = [ixUnique]
      end
      item
        Name = 'IDX_PRODUTOS_DESCRICAO'
        Fields = 'DESCRICAO'
      end
      item
        Name = 'IDX_PRODUTO_PRODUTOS'
        Fields = 'PRODUTO'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'PRODUTOS'
    Left = 92
    Top = 284
    object IBT_DiariaCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_DiariaPRODUTO: TIBStringField
      FieldName = 'PRODUTO'
      Size = 13
    end
    object IBT_DiariaDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object IBT_DiariaPRECO: TFloatField
      FieldName = 'PRECO'
      DisplayFormat = '###,###,###0.00'
    end
    object IBT_DiariaPRECOCUSTO: TFloatField
      FieldName = 'PRECOCUSTO'
      DisplayFormat = '###,###,###0.00'
    end
    object IBT_DiariaGRUPO: TIntegerField
      FieldName = 'GRUPO'
    end
    object IBT_DiariaICMS_SN: TIBStringField
      FieldName = 'ICMS_SN'
      Size = 1
    end
    object IBT_DiariaTRIBUTAR: TIntegerField
      FieldName = 'TRIBUTAR'
    end
    object IBT_DiariaBALANCA: TIBStringField
      FieldName = 'BALANCA'
      Size = 1
    end
    object IBT_DiariaTARA: TFloatField
      FieldName = 'TARA'
    end
    object IBT_DiariaUNIDADE: TIntegerField
      FieldName = 'UNIDADE'
    end
    object IBT_DiariaATIVO: TIBStringField
      FieldName = 'ATIVO'
      Size = 1
    end
    object IBT_DiariaCOMANDA: TIBStringField
      FieldName = 'COMANDA'
      Size = 1
    end
    object IBT_DiariaLOCAL_IMP: TIntegerField
      FieldName = 'LOCAL_IMP'
    end
    object IBT_DiariaDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      DisplayFormat = '###,###,###0.00'
    end
    object IBT_DiariaACRESCIMO: TFloatField
      FieldName = 'ACRESCIMO'
      DisplayFormat = '###,###,###0.00'
    end
    object IBT_DiariaPROD_MTN: TIntegerField
      FieldName = 'PROD_MTN'
    end
    object IBT_DiariaESTOQUE: TIBStringField
      FieldName = 'ESTOQUE'
      Size = 1
    end
    object IBT_DiariaESTNEGATIVO: TIBStringField
      FieldName = 'ESTNEGATIVO'
      Size = 1
    end
    object IBT_DiariaESTOQUE_FISICO: TFloatField
      FieldName = 'ESTOQUE_FISICO'
    end
    object IBT_DiariaESTOQUE_VIRTUAL: TFloatField
      FieldName = 'ESTOQUE_VIRTUAL'
    end
    object IBT_DiariaESTOQUEMIN: TFloatField
      FieldName = 'ESTOQUEMIN'
    end
    object IBT_DiariaESTOQUEMAX: TFloatField
      FieldName = 'ESTOQUEMAX'
    end
    object IBT_DiariaTEMPO: TIBStringField
      FieldName = 'TEMPO'
      Required = True
      Size = 5
    end
    object IBT_DiariaDIA_PROD: TIBStringField
      FieldName = 'DIA_PROD'
      Size = 1
    end
    object IBT_DiariaIMP_PERS: TIBStringField
      FieldName = 'IMP_PERS'
      Size = 1
    end
    object IBT_DiariaVALSALDOENT: TFloatField
      FieldName = 'VALSALDOENT'
    end
    object IBT_DiariaQTDSALDOENT: TFloatField
      FieldName = 'QTDSALDOENT'
    end
    object IBT_DiariaTAXA: TFloatField
      FieldName = 'TAXA'
    end
    object IBT_DiariaTAXA_SN: TIBStringField
      FieldName = 'TAXA_SN'
      Size = 1
    end
  end
  object DTS_Diaria: TDataSource
    DataSet = IBT_Diaria
    Left = 92
    Top = 330
  end
  object IBQ_MovtoDiaria: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from MOVTODIARIA')
    Left = 364
    Top = 20
    object IBQ_MovtoDiariaCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'MOVTODIARIA.CODIGO_ID'
      Required = True
    end
    object IBQ_MovtoDiariaDIARIA: TIntegerField
      FieldName = 'DIARIA'
      Origin = 'MOVTODIARIA.DIARIA'
    end
    object IBQ_MovtoDiariaMESA: TIntegerField
      FieldName = 'MESA'
      Origin = 'MOVTODIARIA.MESA'
    end
    object IBQ_MovtoDiariaSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'MOVTODIARIA.SEQUENCIA'
    end
    object IBQ_MovtoDiariaDATA_INICIO: TDateField
      FieldName = 'DATA_INICIO'
      Origin = 'MOVTODIARIA.DATA_INICIO'
    end
    object IBQ_MovtoDiariaDATA_FINAL: TDateField
      FieldName = 'DATA_FINAL'
      Origin = 'MOVTODIARIA.DATA_FINAL'
    end
    object IBQ_MovtoDiariaHORA_INICIO: TIBStringField
      FieldName = 'HORA_INICIO'
      Origin = 'MOVTODIARIA.HORA_INICIO'
      Size = 5
    end
    object IBQ_MovtoDiariaHORA_FINAL: TIBStringField
      FieldName = 'HORA_FINAL'
      Origin = 'MOVTODIARIA.HORA_FINAL'
      Size = 5
    end
    object IBQ_MovtoDiariaTEMPO_INICIAL: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO_INICIAL'
      Origin = 'MOVTODIARIA.TEMPO_INICIAL'
      ReadOnly = True
    end
    object IBQ_MovtoDiariaTEMPO_FINAL: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO_FINAL'
      Origin = 'MOVTODIARIA.TEMPO_FINAL'
      ReadOnly = True
    end
    object IBQ_MovtoDiariaGARCOM: TIntegerField
      FieldName = 'GARCOM'
      Origin = 'MOVTODIARIA.GARCOM'
    end
    object IBQ_MovtoDiariaQTDEDIARIA: TIntegerField
      FieldName = 'QTDEDIARIA'
      Origin = 'MOVTODIARIA.QTDEDIARIA'
    end
    object IBQ_MovtoDiariaVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'MOVTODIARIA.VALOR'
    end
    object IBQ_MovtoDiariaDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      Origin = 'MOVTODIARIA.DESCONTO'
    end
    object IBQ_MovtoDiariaFINALIZADA: TIBStringField
      FieldName = 'FINALIZADA'
      Origin = 'MOVTODIARIA.FINALIZADA'
      Required = True
      Size = 1
    end
    object IBQ_MovtoDiariaDescDiaria: TStringField
      FieldKind = fkLookup
      FieldName = 'DescDiaria'
      LookupDataSet = IBT_Diaria
      LookupKeyFields = 'CODIGO_ID'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'DIARIA'
      Size = 50
      Lookup = True
    end
  end
  object IBT_ContaParam: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    AfterDelete = IBT_UnidadeAfterDelete
    AfterInsert = IBT_UnidadeAfterInsert
    AfterPost = IBT_UnidadeAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NOME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'SIGLA'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ATIVO'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY79'
        Fields = 'CODIGO_ID'
        Options = [ixPrimary, ixUnique]
      end>
    IndexFieldNames = 'NOME'
    StoreDefs = True
    TableName = 'CONTA'
    Left = 267
    Top = 448
    object IBT_ContaParamCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_ContaParamNOME: TIBStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object IBT_ContaParamSIGLA: TIBStringField
      FieldName = 'SIGLA'
      Size = 15
    end
  end
  object DTS_ContaParam: TDataSource
    DataSet = IBT_ContaParam
    Left = 267
    Top = 494
  end
  object DTS_SubContaParam: TDataSource
    DataSet = IBT_SubContaParam
    Left = 328
    Top = 494
  end
  object IBT_SubContaParam: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    AfterDelete = IBT_ConfigAfterDelete
    AfterInsert = IBT_ConfigAfterInsert
    AfterPost = IBT_ConfigAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NOME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'SIGLA'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CONTA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ATIVO'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY80'
        Fields = 'CODIGO_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN81'
        Fields = 'CONTA'
      end>
    IndexFieldNames = 'CONTA;NOME'
    MasterFields = 'CODIGO_ID'
    MasterSource = DTS_ContaParam
    StoreDefs = True
    TableName = 'SUBCONTA'
    Left = 328
    Top = 448
    object IBT_SubContaParamCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_SubContaParamNOME: TIBStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object IBT_SubContaParamSIGLA: TIBStringField
      FieldName = 'SIGLA'
      Size = 15
    end
    object IBT_SubContaParamCONTA: TIntegerField
      FieldName = 'CONTA'
      Required = True
    end
  end
  object DTS_CaixaParam: TDataSource
    DataSet = IBT_CaixaParam
    Left = 213
    Top = 497
  end
  object IBT_CaixaParam: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'NUMERO_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CAIXA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY15'
        Fields = 'NUMERO_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'IDX_CAIXA_CAIXA'
        Fields = 'CAIXA'
        Options = [ixUnique]
      end
      item
        Name = 'IDX_CAIXA_DESCRICAO'
        Fields = 'DESCRICAO'
        Options = [ixUnique]
      end>
    IndexName = 'IDX_CAIXA_DESCRICAO'
    StoreDefs = True
    TableName = 'CAIXA'
    Left = 213
    Top = 448
    object IBT_CaixaParamNUMERO_ID: TIntegerField
      FieldName = 'NUMERO_ID'
    end
    object IBT_CaixaParamCAIXA: TIntegerField
      FieldName = 'CAIXA'
    end
    object IBT_CaixaParamDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  object IBQ_MovEstoque: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from MOVTOSTQ')
    Left = 516
    Top = 424
  end
  object DTQ_MovEstoque: TDataSource
    DataSet = IBQ_MovEstoque
    Left = 516
    Top = 472
  end
  object IBT_Parametros: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DT_INICIAL'
        DataType = ftInteger
      end
      item
        Name = 'DT_FINAL'
        DataType = ftInteger
      end
      item
        Name = 'HR_INICIAL'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'HR_FINAL'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'PERIODO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DT_INICIALM'
        DataType = ftInteger
      end
      item
        Name = 'DT_FINALM'
        DataType = ftInteger
      end
      item
        Name = 'MONTANA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CONTA'
        DataType = ftInteger
      end
      item
        Name = 'SUBCONTA'
        DataType = ftInteger
      end
      item
        Name = 'CENTROCUSTO'
        DataType = ftInteger
      end
      item
        Name = 'FRENTECLIFOR'
        DataType = ftInteger
      end
      item
        Name = 'CAIXA'
        DataType = ftInteger
      end
      item
        Name = 'DIFCONTA'
        DataType = ftInteger
      end
      item
        Name = 'DIFSUBCONTA'
        DataType = ftInteger
      end
      item
        Name = 'PCONTA'
        DataType = ftInteger
      end
      item
        Name = 'PSUBCONTA'
        DataType = ftInteger
      end
      item
        Name = 'ECONTA'
        DataType = ftInteger
      end
      item
        Name = 'ESUBCONTA'
        DataType = ftInteger
      end
      item
        Name = 'GRUPODIARIA'
        DataType = ftInteger
      end
      item
        Name = 'FRENTEAVULSO'
        DataType = ftInteger
      end
      item
        Name = 'PORTA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PORC_ESTOQUE'
        DataType = ftFloat
      end
      item
        Name = 'MODOPERMISSAO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ENTREGA_CALCULO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ENTREGA_COZINHA'
        DataType = ftInteger
      end
      item
        Name = 'ENTREGA_PACOTE'
        DataType = ftInteger
      end
      item
        Name = 'TERMDIA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'FECHACAIXA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TIKETMSG'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'TIKETMSG2'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'TIKETMSG3'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'TIKETMSG4'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'TICKETPERSONA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'RECEBIDO_AUTO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'FIRMA'
        DataType = ftInteger
      end
      item
        Name = 'SFIRMA'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'MSG_COMANDA'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CLIENTEPERSO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'FRENTEFUNC'
        DataType = ftInteger
      end
      item
        Name = 'VIAS'
        DataType = ftInteger
      end
      item
        Name = 'NUMLINHAS'
        DataType = ftInteger
      end
      item
        Name = 'NFENTRADAIMP'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TEMPOINATIVO'
        DataType = ftInteger
      end
      item
        Name = 'ACIONABALANCA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TRVFICHAFINAL'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'FORMAPAGTO'
        DataType = ftInteger
      end
      item
        Name = 'QTD_ITENS_MONT_FRENTE'
        DataType = ftInteger
      end
      item
        Name = 'NDFICHA'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'RDB$FOREIGN103'
        Fields = 'CONTA'
      end
      item
        Name = 'RDB$FOREIGN104'
        Fields = 'SUBCONTA'
      end
      item
        Name = 'RDB$FOREIGN113'
        Fields = 'CENTROCUSTO'
      end>
    StoreDefs = True
    TableName = 'PARAMETROS'
    Left = 316
    Top = 296
    object IBT_ParametrosCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_ParametrosDT_INICIAL: TIntegerField
      FieldName = 'DT_INICIAL'
    end
    object IBT_ParametrosDT_FINAL: TIntegerField
      FieldName = 'DT_FINAL'
    end
    object IBT_ParametrosHR_INICIAL: TIBStringField
      FieldName = 'HR_INICIAL'
      Size = 5
    end
    object IBT_ParametrosHR_FINAL: TIBStringField
      FieldName = 'HR_FINAL'
      Size = 5
    end
    object IBT_ParametrosPERIODO: TIBStringField
      FieldName = 'PERIODO'
      Size = 1
    end
    object IBT_ParametrosDT_INICIALM: TIntegerField
      FieldName = 'DT_INICIALM'
    end
    object IBT_ParametrosDT_FINALM: TIntegerField
      FieldName = 'DT_FINALM'
    end
    object IBT_ParametrosMONTANA: TIBStringField
      FieldName = 'MONTANA'
      Size = 1
    end
    object IBT_ParametrosCONTA: TIntegerField
      FieldName = 'CONTA'
    end
    object IBT_ParametrosSUBCONTA: TIntegerField
      FieldName = 'SUBCONTA'
    end
    object IBT_ParametrosCENTROCUSTO: TIntegerField
      FieldName = 'CENTROCUSTO'
    end
    object IBT_ParametrosFRENTECLIFOR: TIntegerField
      FieldName = 'FRENTECLIFOR'
    end
    object IBT_ParametrosCAIXA: TIntegerField
      FieldName = 'CAIXA'
    end
    object IBT_ParametrosDIFCONTA: TIntegerField
      FieldName = 'DIFCONTA'
    end
    object IBT_ParametrosDIFSUBCONTA: TIntegerField
      FieldName = 'DIFSUBCONTA'
    end
    object IBT_ParametrosPCONTA: TIntegerField
      FieldName = 'PCONTA'
    end
    object IBT_ParametrosPSUBCONTA: TIntegerField
      FieldName = 'PSUBCONTA'
    end
    object IBT_ParametrosECONTA: TIntegerField
      FieldName = 'ECONTA'
    end
    object IBT_ParametrosESUBCONTA: TIntegerField
      FieldName = 'ESUBCONTA'
    end
    object IBT_ParametrosGRUPODIARIA: TIntegerField
      FieldName = 'GRUPODIARIA'
    end
    object IBT_ParametrosFRENTEAVULSO: TIntegerField
      FieldName = 'FRENTEAVULSO'
    end
    object IBT_ParametrosPORTA: TIBStringField
      FieldName = 'PORTA'
      Size = 10
    end
    object IBT_ParametrosPORC_ESTOQUE: TFloatField
      FieldName = 'PORC_ESTOQUE'
    end
    object IBT_ParametrosMODOPERMISSAO: TIBStringField
      FieldName = 'MODOPERMISSAO'
      Size = 1
    end
    object IBT_ParametrosENTREGA_CALCULO: TIBStringField
      FieldName = 'ENTREGA_CALCULO'
      Size = 1
    end
    object IBT_ParametrosENTREGA_COZINHA: TIntegerField
      FieldName = 'ENTREGA_COZINHA'
    end
    object IBT_ParametrosENTREGA_PACOTE: TIntegerField
      FieldName = 'ENTREGA_PACOTE'
    end
    object IBT_ParametrosTERMDIA: TIBStringField
      FieldName = 'TERMDIA'
      Size = 1
    end
    object IBT_ParametrosFECHACAIXA: TIBStringField
      FieldName = 'FECHACAIXA'
      Size = 1
    end
    object IBT_ParametrosTIKETMSG: TIBStringField
      FieldName = 'TIKETMSG'
      Size = 40
    end
    object IBT_ParametrosTIKETMSG2: TIBStringField
      FieldName = 'TIKETMSG2'
      Size = 40
    end
    object IBT_ParametrosTIKETMSG3: TIBStringField
      FieldName = 'TIKETMSG3'
      Size = 40
    end
    object IBT_ParametrosTIKETMSG4: TIBStringField
      FieldName = 'TIKETMSG4'
      Size = 40
    end
    object IBT_ParametrosTICKETPERSONA: TIBStringField
      FieldName = 'TICKETPERSONA'
      Size = 1
    end
    object IBT_ParametrosRECEBIDO_AUTO: TIBStringField
      FieldName = 'RECEBIDO_AUTO'
      Size = 1
    end
    object IBT_ParametrosMSG_COMANDA: TIBStringField
      FieldName = 'MSG_COMANDA'
      Size = 60
    end
    object IBT_ParametrosCLIENTEPERSO: TIBStringField
      FieldName = 'CLIENTEPERSO'
      Size = 1
    end
    object IBT_ParametrosFRENTEFUNC: TIntegerField
      FieldName = 'FRENTEFUNC'
    end
    object IBT_ParametrosVIAS: TIntegerField
      FieldName = 'VIAS'
    end
    object IBT_ParametrosNUMLINHAS: TIntegerField
      FieldName = 'NUMLINHAS'
    end
    object IBT_ParametrosNFENTRADAIMP: TIBStringField
      FieldName = 'NFENTRADAIMP'
      Size = 1
    end
    object IBT_ParametrosFIRMA: TIntegerField
      FieldName = 'FIRMA'
    end
    object IBT_ParametrosSFIRMA: TIBStringField
      FieldName = 'SFIRMA'
      Size = 30
    end
    object IBT_ParametrosTEMPOINATIVO: TIntegerField
      FieldName = 'TEMPOINATIVO'
    end
    object IBT_ParametrosACIONABALANCA: TIBStringField
      FieldName = 'ACIONABALANCA'
      Size = 1
    end
    object IBT_ParametrosTRVFICHAFINAL: TIBStringField
      FieldName = 'TRVFICHAFINAL'
      Size = 1
    end
    object IBT_ParametrosFORMAPAGTO: TIntegerField
      FieldName = 'FORMAPAGTO'
    end
    object IBT_ParametrosQTD_ITENS_MONT_FRENTE: TIntegerField
      FieldName = 'QTD_ITENS_MONT_FRENTE'
    end
    object IBT_ParametrosNDFICHA: TIntegerField
      FieldName = 'NDFICHA'
    end
  end
  object IBQ_PesFichas: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    AutoCalcFields = False
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from FICHA')
    Left = 20
    Top = 400
    object IBQ_PesFichasCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'FICHA.CODIGO_ID'
      Required = True
    end
    object IBQ_PesFichasFICHA: TIntegerField
      FieldName = 'FICHA'
      Origin = 'FICHA.FICHA'
    end
    object IBQ_PesFichasSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'FICHA.SEQUENCIA'
    end
    object IBQ_PesFichasSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'FICHA.STATUS'
      Size = 1
    end
    object IBQ_PesFichasATIVO: TIBStringField
      FieldName = 'ATIVO'
      Origin = 'FICHA.ATIVO'
      Required = True
      Size = 1
    end
    object IBQ_PesFichasCONSULTA: TIBStringField
      FieldName = 'CONSULTA'
      Origin = 'FICHA.CONSULTA'
      Required = True
      Size = 1
    end
    object IBQ_PesFichasTRAVA: TIBStringField
      FieldName = 'TRAVA'
      Origin = 'FICHA.TRAVA'
      Required = True
      Size = 1
    end
    object IBQ_PesFichasDIGITO: TSmallintField
      FieldName = 'DIGITO'
      Origin = 'FICHA.DIGITO'
    end
    object IBQ_PesFichasTP_FICHA: TIBStringField
      FieldName = 'TP_FICHA'
      Origin = 'FICHA.TP_FICHA'
      Size = 1
    end
    object IBQ_PesFichasOPERADOR: TIntegerField
      FieldName = 'OPERADOR'
      Origin = 'FICHA.OPERADOR'
    end
    object IBQ_PesFichasPRODUCAO: TIBStringField
      FieldName = 'PRODUCAO'
      Origin = 'FICHA.PRODUCAO'
      Required = True
      Size = 1
    end
  end
  object IBQ_FuncSaldo: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CLIFOR')
    Left = 344
    Top = 544
  end
  object MDM_Cardapio: TmdMailSlot
    Server = '.'
    Slot = 'Cardapio'
    OnMessageAvail = MDM_CardapioMessageAvail
    Left = 280
    Top = 9
  end
  object IBQ_ModulosFrente: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from MODULOFRENTE')
    Left = 448
    Top = 504
    object IBQ_ModulosFrenteCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'MODULOFRENTE.CODIGO_ID'
      Required = True
    end
    object IBQ_ModulosFrenteMODULO: TIBStringField
      FieldName = 'MODULO'
      Origin = 'MODULOFRENTE.MODULO'
      Size = 120
    end
    object IBQ_ModulosFrenteMOD_NAME: TIBStringField
      FieldName = 'MOD_NAME'
      Origin = 'MODULOFRENTE.MOD_NAME'
      Size = 120
    end
    object IBQ_ModulosFrenteBOT_NAME: TIBStringField
      FieldName = 'BOT_NAME'
      Origin = 'MODULOFRENTE.BOT_NAME'
      Size = 120
    end
  end
  object IBQ_AtualizaModulosFrente: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from MODULOFRENTE')
    Left = 448
    Top = 548
    object IBQ_AtualizaModulosFrenteCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'MODULOFRENTE.CODIGO_ID'
      Required = True
    end
    object IBQ_AtualizaModulosFrenteMODULO: TIBStringField
      FieldName = 'MODULO'
      Origin = 'MODULOFRENTE.MODULO'
      Size = 120
    end
    object IBQ_AtualizaModulosFrenteMOD_NAME: TIBStringField
      FieldName = 'MOD_NAME'
      Origin = 'MODULOFRENTE.MOD_NAME'
      Size = 120
    end
    object IBQ_AtualizaModulosFrenteBOT_NAME: TIBStringField
      FieldName = 'BOT_NAME'
      Origin = 'MODULOFRENTE.BOT_NAME'
      Size = 120
    end
  end
  object IBQ_PermissaoFrente: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    OnCalcFields = IBQ_PermissaoFrenteCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from PERMISSAOFRENTE')
    Left = 608
    Top = 528
    object IBQ_PermissaoFrenteCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'PERMISSAOFRENTE.CODIGO_ID'
      Required = True
    end
    object IBQ_PermissaoFrenteNIVEL: TIntegerField
      FieldName = 'NIVEL'
      Origin = 'PERMISSAOFRENTE.NIVEL'
    end
    object IBQ_PermissaoFrenteMODULO: TIBStringField
      FieldName = 'MODULO'
      Origin = 'PERMISSAOFRENTE.MODULO'
      Size = 120
    end
    object IBQ_PermissaoFrenteMOD_NAME: TIBStringField
      FieldName = 'MOD_NAME'
      Origin = 'PERMISSAOFRENTE.MOD_NAME'
      Size = 120
    end
    object IBQ_PermissaoFrenteBOT_NAME: TIBStringField
      FieldName = 'BOT_NAME'
      Origin = 'PERMISSAOFRENTE.BOT_NAME'
      Size = 120
    end
    object IBQ_PermissaoFrentePERMISSAO: TIBStringField
      FieldName = 'PERMISSAO'
      Origin = 'PERMISSAOFRENTE.PERMISSAO'
      Size = 6
    end
    object IBQ_PermissaoFrenteCHPB: TIBStringField
      FieldName = 'CHPB'
      Origin = 'PERMISSAOFRENTE.CHPB'
    end
    object IBQ_PermissaoFrenteDesPermissao: TStringField
      DisplayLabel = 'P'
      FieldKind = fkCalculated
      FieldName = 'DesPermissao'
      Size = 60
      Calculated = True
    end
    object IBQ_PermissaoFrenteDesModulo: TStringField
      DisplayLabel = 'M'#243'dulo'
      FieldKind = fkCalculated
      FieldName = 'DesModulo'
      Size = 60
      Calculated = True
    end
  end
  object IBT_ContaAtivos: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    AfterDelete = IBT_UnidadeAfterDelete
    AfterInsert = IBT_UnidadeAfterInsert
    AfterPost = IBT_UnidadeAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NOME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'SIGLA'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ATIVO'
        DataType = ftString
        Size = 1
      end>
    Filter = 'ATIVO='#39'S'#39
    Filtered = True
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY79'
        Fields = 'CODIGO_ID'
        Options = [ixPrimary, ixUnique]
      end>
    IndexFieldNames = 'NOME'
    StoreDefs = True
    TableName = 'CONTA'
    Left = 167
    Top = 312
    object IBT_ContaAtivosCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_ContaAtivosNOME: TIBStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object IBT_ContaAtivosSIGLA: TIBStringField
      FieldName = 'SIGLA'
      Size = 15
    end
    object IBT_ContaAtivosATIVO: TIBStringField
      FieldName = 'ATIVO'
      Size = 1
    end
  end
  object DTS_ContaAtivos: TDataSource
    DataSet = IBT_ContaAtivos
    Left = 167
    Top = 358
  end
  object IBT_SubContaAtivos: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    AfterDelete = IBT_ConfigAfterDelete
    AfterInsert = IBT_ConfigAfterInsert
    AfterPost = IBT_ConfigAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NOME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'SIGLA'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CONTA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ATIVO'
        DataType = ftString
        Size = 1
      end>
    Filter = 'ATIVO='#39'S'#39
    Filtered = True
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY80'
        Fields = 'CODIGO_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN81'
        Fields = 'CONTA'
      end>
    IndexFieldNames = 'CONTA;NOME'
    MasterFields = 'CODIGO_ID'
    MasterSource = DTS_ContaAtivos
    StoreDefs = True
    TableName = 'SUBCONTA'
    Left = 228
    Top = 312
    object IBT_SubContaAtivosCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_SubContaAtivosNOME: TIBStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object IBT_SubContaAtivosSIGLA: TIBStringField
      FieldName = 'SIGLA'
      Size = 15
    end
    object IBT_SubContaAtivosCONTA: TIntegerField
      FieldName = 'CONTA'
      Required = True
    end
    object IBT_SubContaAtivosATIVO: TIBStringField
      FieldName = 'ATIVO'
      Size = 1
    end
  end
  object DTS_SubContaAtivos: TDataSource
    DataSet = IBT_SubContaAtivos
    Left = 228
    Top = 358
  end
  object IBT_ClienteAtivos: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    AfterDelete = IBT_PeriodoAfterDelete
    AfterInsert = IBT_PeriodoAfterInsert
    AfterPost = IBT_PeriodoAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NOMEFANTASIA'
        Attributes = [faRequired]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'RAZAOSOCIAL'
        Attributes = [faRequired]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CNPJ'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CPF'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IE'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RG'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ENDERECO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'BAIRRO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'TELEFONE'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'FAX'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CONTATO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'SITE'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'ATIVO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'UF'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'TIPOCLIFOR'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'MATRICULA'
        DataType = ftString
        Size = 25
      end>
    Filter = 'ATIVO='#39'S'#39
    Filtered = True
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY67'
        Fields = 'CODIGO_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'IDX_CLIFOR_NOMEFANTASIA'
        Fields = 'NOMEFANTASIA'
      end>
    StoreDefs = True
    TableName = 'CLIFOR'
    Left = 608
    Top = 184
    object IBT_ClienteAtivosCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_ClienteAtivosNOMEFANTASIA: TIBStringField
      FieldName = 'NOMEFANTASIA'
      Required = True
      Size = 60
    end
    object IBT_ClienteAtivosRAZAOSOCIAL: TIBStringField
      FieldName = 'RAZAOSOCIAL'
      Required = True
      Size = 60
    end
    object IBT_ClienteAtivosCNPJ: TIBStringField
      FieldName = 'CNPJ'
      EditMask = '##\.###\.###\/####\-##;0;_'
      Size = 30
    end
    object IBT_ClienteAtivosCPF: TIBStringField
      FieldName = 'CPF'
      EditMask = '###\.###\.###\-##;0;_'
      Size = 30
    end
    object IBT_ClienteAtivosIE: TIBStringField
      FieldName = 'IE'
      Size = 30
    end
    object IBT_ClienteAtivosRG: TIBStringField
      FieldName = 'RG'
      Size = 30
    end
    object IBT_ClienteAtivosENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object IBT_ClienteAtivosBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Size = 60
    end
    object IBT_ClienteAtivosCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Size = 60
    end
    object IBT_ClienteAtivosTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Size = 30
    end
    object IBT_ClienteAtivosFAX: TIBStringField
      FieldName = 'FAX'
      Size = 30
    end
    object IBT_ClienteAtivosCONTATO: TIBStringField
      FieldName = 'CONTATO'
      Size = 60
    end
    object IBT_ClienteAtivosEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Size = 60
    end
    object IBT_ClienteAtivosSITE: TIBStringField
      FieldName = 'SITE'
      Size = 60
    end
    object IBT_ClienteAtivosATIVO: TIBStringField
      FieldName = 'ATIVO'
      Size = 1
    end
    object IBT_ClienteAtivosCEP: TIBStringField
      FieldName = 'CEP'
      EditMask = '#####\-###;1;_'
      Size = 10
    end
    object IBT_ClienteAtivosUF: TIBStringField
      FieldName = 'UF'
      Size = 2
    end
    object IBT_ClienteAtivosTIPOCLIFOR: TIBStringField
      FieldName = 'TIPOCLIFOR'
      Size = 1
    end
    object IBT_ClienteAtivosMATRICULA: TIBStringField
      FieldName = 'MATRICULA'
      Size = 25
    end
  end
  object DTS_ClienteAtivos: TDataSource
    DataSet = IBT_ClienteAtivos
    Left = 608
    Top = 230
  end
  object IBQ_NumTef: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select gen_id(GEN_NUMTEF_PK,1) as NTEF'
      'from rdb$database')
    Left = 348
    Top = 612
    object IBQ_NumTefNTEF: TLargeintField
      FieldName = 'NTEF'
      Required = True
    end
  end
  object IBQ_TempTEF: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * '
      'from TEMPTEF'
      'where (NUM_MAQ = :p_Maquina)'
      'order by NUM_TEF')
    Left = 420
    Top = 612
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_Maquina'
        ParamType = ptUnknown
      end>
    object IBQ_TempTEFNUM_MAQ: TIntegerField
      FieldName = 'NUM_MAQ'
      Origin = 'TEMPTEF.NUM_MAQ'
    end
    object IBQ_TempTEFNUM_TEF: TIntegerField
      FieldName = 'NUM_TEF'
      Origin = 'TEMPTEF.NUM_TEF'
    end
    object IBQ_TempTEFNUM_COO: TIntegerField
      FieldName = 'NUM_COO'
      Origin = 'TEMPTEF.NUM_COO'
    end
    object IBQ_TempTEFVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'TEMPTEF.VALOR'
    end
    object IBQ_TempTEFCONFIRMADO: TIBStringField
      FieldName = 'CONFIRMADO'
      Origin = 'TEMPTEF.CONFIRMADO'
      Size = 1
    end
    object IBQ_TempTEFBUFFER: TMemoField
      FieldName = 'BUFFER'
      Origin = 'TEMPTEF.BUFFER'
      BlobType = ftMemo
      Size = 8
    end
  end
  object IBT_TempTEF: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    AutoCalcFields = False
    AfterDelete = IBT_TempTEFAfterDelete
    AfterPost = IBT_TempTEFAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'NUM_MAQ'
        DataType = ftInteger
      end
      item
        Name = 'NUM_TEF'
        DataType = ftInteger
      end
      item
        Name = 'NUM_COO'
        DataType = ftInteger
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'CONFIRMADO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'BUFFER'
        DataType = ftMemo
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY23'
        Fields = 'CODIGO_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'IDX_CONDPAGTO_DESCRICAO'
        Fields = 'DESCRICAO'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'TEMPTEF'
    Left = 476
    Top = 598
    object IBT_TempTEFNUM_MAQ: TIntegerField
      FieldName = 'NUM_MAQ'
    end
    object IBT_TempTEFNUM_TEF: TIntegerField
      FieldName = 'NUM_TEF'
    end
    object IBT_TempTEFNUM_COO: TIntegerField
      FieldName = 'NUM_COO'
    end
    object IBT_TempTEFVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object IBT_TempTEFCONFIRMADO: TIBStringField
      FieldName = 'CONFIRMADO'
      Size = 1
    end
    object IBT_TempTEFBUFFER: TMemoField
      FieldName = 'BUFFER'
      BlobType = ftMemo
    end
  end
  object DTS_TempTEF: TDataSource
    DataSet = IBT_TempTEF
    Left = 480
    Top = 641
  end
  object IBT_TempTefADM: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    AutoCalcFields = False
    AfterDelete = IBT_TempTefADMAfterDelete
    AfterPost = IBT_TempTefADMAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'NUM_MAQ'
        DataType = ftInteger
      end
      item
        Name = 'BUFFER'
        DataType = ftMemo
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY23'
        Fields = 'CODIGO_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'IDX_CONDPAGTO_DESCRICAO'
        Fields = 'DESCRICAO'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'TEMPTEFADM'
    Left = 564
    Top = 598
    object IBT_TempTefADMNUM_MAQ: TIntegerField
      FieldName = 'NUM_MAQ'
    end
    object IBT_TempTefADMBUFFER: TMemoField
      FieldName = 'BUFFER'
      BlobType = ftMemo
    end
  end
  object DTS_TempTefADM: TDataSource
    DataSet = IBT_TempTefADM
    Left = 568
    Top = 641
  end
  object IBQ_Busca: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * '
      'from TEMPTEF'
      'order by NUM_TEF')
    Left = 644
    Top = 596
    object IBQ_BuscaNUM_MAQ: TIntegerField
      FieldName = 'NUM_MAQ'
      Origin = 'TEMPTEF.NUM_MAQ'
    end
    object IBQ_BuscaNUM_TEF: TIntegerField
      FieldName = 'NUM_TEF'
      Origin = 'TEMPTEF.NUM_TEF'
    end
    object IBQ_BuscaNUM_COO: TIntegerField
      FieldName = 'NUM_COO'
      Origin = 'TEMPTEF.NUM_COO'
    end
    object IBQ_BuscaVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'TEMPTEF.VALOR'
    end
    object IBQ_BuscaCONFIRMADO: TIBStringField
      FieldName = 'CONFIRMADO'
      Origin = 'TEMPTEF.CONFIRMADO'
      Size = 1
    end
    object IBQ_BuscaBUFFER: TMemoField
      FieldName = 'BUFFER'
      Origin = 'TEMPTEF.BUFFER'
      BlobType = ftMemo
      Size = 8
    end
  end
  object IBT_Complemento: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'COMPLEMENTO'
    Left = 854
    Top = 4
    object IBT_ComplementoCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_ComplementoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 150
    end
    object IBT_ComplementoMOVEL: TIBStringField
      FieldName = 'MOVEL'
      Size = 1
    end
    object IBT_ComplementoATIVO: TIBStringField
      FieldName = 'ATIVO'
      Size = 1
    end
  end
  object DTS_Complemento: TDataSource
    DataSet = IBT_Complemento
    Left = 854
    Top = 48
  end
  object IBT_MesaComp: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    AfterDelete = IBT_MesaItemAfterDelete
    AfterInsert = IBT_MesaItemAfterInsert
    AfterPost = IBT_MesaItemAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PRODUTO'
        DataType = ftInteger
      end
      item
        Name = 'COMP'
        DataType = ftInteger
      end
      item
        Name = 'CS'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'FICHA'
        DataType = ftInteger
      end
      item
        Name = 'FSEQUENCIA'
        DataType = ftInteger
      end
      item
        Name = 'FINALIZADO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'LIGACOMP'
        DataType = ftInteger
      end
      item
        Name = 'CANCELADA'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'PK_MESACOMP'
        Fields = 'CODIGO_ID'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'MESACOMP'
    Left = 618
    Top = 100
    object IBT_MesaCompCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_MesaCompPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
    end
    object IBT_MesaCompCOMP: TIntegerField
      FieldName = 'COMP'
    end
    object IBT_MesaCompCS: TIBStringField
      FieldName = 'CS'
      Size = 1
    end
    object IBT_MesaCompFICHA: TIntegerField
      FieldName = 'FICHA'
    end
    object IBT_MesaCompFSEQUENCIA: TIntegerField
      FieldName = 'FSEQUENCIA'
    end
    object IBT_MesaCompFINALIZADO: TIBStringField
      FieldName = 'FINALIZADO'
      Size = 1
    end
    object IBT_MesaCompLIGACOMP: TIntegerField
      FieldName = 'LIGACOMP'
    end
    object IBT_MesaCompCANCELADA: TIBStringField
      FieldName = 'CANCELADA'
      Size = 1
    end
  end
  object DTS_MesaComp: TDataSource
    DataSet = IBT_MesaComp
    Left = 618
    Top = 146
  end
  object IBQ_DadosECF: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from DADOSECF')
    Left = 860
    Top = 345
  end
  object IBQ_VerMesa: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from MESAITEM')
    Left = 856
    Top = 584
    object IBQ_VerMesaCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'MESAITEM.CODIGO_ID'
      Required = True
    end
    object IBQ_VerMesaMESA: TIntegerField
      FieldName = 'MESA'
      Origin = 'MESAITEM.MESA'
    end
    object IBQ_VerMesaSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'MESAITEM.SEQUENCIA'
    end
    object IBQ_VerMesaGARCOM: TIntegerField
      FieldName = 'GARCOM'
      Origin = 'MESAITEM.GARCOM'
    end
    object IBQ_VerMesaPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'MESAITEM.PRODUTO'
    end
    object IBQ_VerMesaQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      Origin = 'MESAITEM.QUANTIDADE'
    end
    object IBQ_VerMesaCANCELADA: TIBStringField
      FieldName = 'CANCELADA'
      Origin = 'MESAITEM.CANCELADA'
      Required = True
      Size = 1
    end
    object IBQ_VerMesaIMP_REMOTA: TIBStringField
      FieldName = 'IMP_REMOTA'
      Origin = 'MESAITEM.IMP_REMOTA'
      Required = True
      Size = 1
    end
    object IBQ_VerMesaPONTOVENDA: TIntegerField
      FieldName = 'PONTOVENDA'
      Origin = 'MESAITEM.PONTOVENDA'
    end
    object IBQ_VerMesaHORA: TIBStringField
      FieldName = 'HORA'
      Origin = 'MESAITEM.HORA'
      Size = 5
    end
    object IBQ_VerMesaDATE: TDateField
      FieldName = 'DATE'
      Origin = 'MESAITEM.DATE'
    end
    object IBQ_VerMesaMESAFECHA: TIntegerField
      FieldName = 'MESAFECHA'
      Origin = 'MESAITEM.MESAFECHA'
    end
    object IBQ_VerMesaSEQFECHA: TIntegerField
      FieldName = 'SEQFECHA'
      Origin = 'MESAITEM.SEQFECHA'
    end
    object IBQ_VerMesaGRUPO: TIntegerField
      FieldName = 'GRUPO'
      Origin = 'MESAITEM.GRUPO'
    end
    object IBQ_VerMesaPRC_UNITARIO: TFloatField
      FieldName = 'PRC_UNITARIO'
      Origin = 'MESAITEM.PRC_UNITARIO'
    end
    object IBQ_VerMesaBALANCA: TIBStringField
      FieldName = 'BALANCA'
      Origin = 'MESAITEM.BALANCA'
      Required = True
      Size = 1
    end
    object IBQ_VerMesaHO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'HO'
      Origin = 'MESAITEM.HO'
      ReadOnly = True
      Size = 2
    end
    object IBQ_VerMesaTEMPO: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO'
      Origin = 'MESAITEM.TEMPO'
      ReadOnly = True
    end
    object IBQ_VerMesaOPCANCEL: TIntegerField
      FieldName = 'OPCANCEL'
      Origin = 'MESAITEM.OPCANCEL'
    end
    object IBQ_VerMesaALIQUOTA: TIntegerField
      FieldName = 'ALIQUOTA'
      Origin = 'MESAITEM.ALIQUOTA'
    end
    object IBQ_VerMesaDATA_INICIO: TDateField
      FieldName = 'DATA_INICIO'
      Origin = 'MESAITEM.DATA_INICIO'
    end
    object IBQ_VerMesaDATA_FINAL: TDateField
      FieldName = 'DATA_FINAL'
      Origin = 'MESAITEM.DATA_FINAL'
    end
    object IBQ_VerMesaHORA_INICIO: TIBStringField
      FieldName = 'HORA_INICIO'
      Origin = 'MESAITEM.HORA_INICIO'
      Size = 5
    end
    object IBQ_VerMesaHORA_FINAL: TIBStringField
      FieldName = 'HORA_FINAL'
      Origin = 'MESAITEM.HORA_FINAL'
      Size = 5
    end
    object IBQ_VerMesaTEMPO_INICIAL: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO_INICIAL'
      Origin = 'MESAITEM.TEMPO_INICIAL'
      ReadOnly = True
    end
    object IBQ_VerMesaTEMPO_FINAL: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO_FINAL'
      Origin = 'MESAITEM.TEMPO_FINAL'
      ReadOnly = True
    end
    object IBQ_VerMesaDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      Origin = 'MESAITEM.DESCONTO'
    end
    object IBQ_VerMesaFINALIZADA: TIBStringField
      FieldName = 'FINALIZADA'
      Origin = 'MESAITEM.FINALIZADA'
      Required = True
      Size = 1
    end
    object IBQ_VerMesaOBS: TIBStringField
      FieldName = 'OBS'
      Origin = 'MESAITEM.OBS'
      Size = 255
    end
    object IBQ_VerMesaIMP_DIARIA: TIBStringField
      FieldName = 'IMP_DIARIA'
      Origin = 'MESAITEM.IMP_DIARIA'
      Size = 1
    end
    object IBQ_VerMesaIMP_CONTINT: TIBStringField
      FieldName = 'IMP_CONTINT'
      Origin = 'MESAITEM.IMP_CONTINT'
      Size = 1
    end
    object IBQ_VerMesaIMP_CANCELINT: TIBStringField
      FieldName = 'IMP_CANCELINT'
      Origin = 'MESAITEM.IMP_CANCELINT'
      Size = 1
    end
    object IBQ_VerMesaCLIENTEDIARIA: TIntegerField
      FieldName = 'CLIENTEDIARIA'
      Origin = 'MESAITEM.CLIENTEDIARIA'
    end
    object IBQ_VerMesaACRESCIMO: TFloatField
      FieldName = 'ACRESCIMO'
      Origin = 'MESAITEM.ACRESCIMO'
    end
    object IBQ_VerMesaTAXA: TFloatField
      FieldName = 'TAXA'
      Origin = 'MESAITEM.TAXA'
    end
    object IBQ_VerMesaVAL_TAXA: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_TAXA'
      Origin = 'MESAITEM.VAL_TAXA'
      ReadOnly = True
    end
    object IBQ_VerMesaVAL_DESCONTO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_DESCONTO'
      Origin = 'MESAITEM.VAL_DESCONTO'
      ReadOnly = True
    end
    object IBQ_VerMesaVAL_ACRESCIMO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_ACRESCIMO'
      Origin = 'MESAITEM.VAL_ACRESCIMO'
      ReadOnly = True
    end
    object IBQ_VerMesaVAL_PRODUTO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_PRODUTO'
      Origin = 'MESAITEM.VAL_PRODUTO'
      ReadOnly = True
    end
    object IBQ_VerMesaALIQUO: TIBStringField
      FieldName = 'ALIQUO'
      Origin = 'MESAITEM.ALIQUO'
      Size = 4
    end
    object IBQ_VerMesaPIS: TFloatField
      FieldName = 'PIS'
      Origin = 'MESAITEM.PIS'
    end
    object IBQ_VerMesaCOFINS: TFloatField
      FieldName = 'COFINS'
      Origin = 'MESAITEM.COFINS'
    end
    object IBQ_VerMesaICMS: TFloatField
      FieldName = 'ICMS'
      Origin = 'MESAITEM.ICMS'
    end
    object IBQ_VerMesaCOMISSAOPR: TFloatField
      FieldName = 'COMISSAOPR'
      Origin = 'MESAITEM.COMISSAOPR'
    end
    object IBQ_VerMesaCOMISSAOFU: TFloatField
      FieldName = 'COMISSAOFU'
      Origin = 'MESAITEM.COMISSAOFU'
    end
    object IBQ_VerMesaCOMISPRSN: TIBStringField
      FieldName = 'COMISPRSN'
      Origin = 'MESAITEM.COMISPRSN'
      Size = 1
    end
    object IBQ_VerMesaCORTESIA: TIBStringField
      FieldName = 'CORTESIA'
      Origin = 'MESAITEM.CORTESIA'
      Size = 1
    end
    object IBQ_VerMesaTURNO: TIntegerField
      FieldName = 'TURNO'
      Origin = 'MESAITEM.TURNO'
    end
    object IBQ_VerMesaSTATUSCONT: TIBStringField
      FieldName = 'STATUSCONT'
      Origin = 'MESAITEM.STATUSCONT'
      Size = 1
    end
    object IBQ_VerMesaREDUCAO: TFloatField
      FieldName = 'REDUCAO'
      Origin = 'MESAITEM.REDUCAO'
    end
    object IBQ_VerMesaOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'MESAITEM.OBSERVACAO'
      BlobType = ftMemo
      Size = 8
    end
    object IBQ_VerMesaCOMPLEMENTO: TIBStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'MESAITEM.COMPLEMENTO'
      Required = True
      Size = 1
    end
    object IBQ_VerMesaPOSICAO: TIBStringField
      FieldName = 'POSICAO'
      Origin = 'MESAITEM.POSICAO'
      Size = 5
    end
    object IBQ_VerMesaLIGACOMP: TIntegerField
      FieldName = 'LIGACOMP'
      Origin = 'MESAITEM.LIGACOMP'
    end
    object IBQ_VerMesaNIVEL_ISENTO: TIntegerField
      FieldName = 'NIVEL_ISENTO'
      Origin = 'MESAITEM.NIVEL_ISENTO'
    end
    object IBQ_VerMesaIMPRESSO: TIBStringField
      FieldName = 'IMPRESSO'
      Origin = 'MESAITEM.IMPRESSO'
      Size = 1
    end
    object IBQ_VerMesaPESSOAS: TIntegerField
      FieldName = 'PESSOAS'
      Origin = 'MESAITEM.PESSOAS'
    end
  end
  object IBT_ProdLista: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PRODUTO'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PRECO'
        DataType = ftFloat
      end
      item
        Name = 'PRECOCUSTO'
        DataType = ftFloat
      end
      item
        Name = 'GRUPO'
        DataType = ftInteger
      end
      item
        Name = 'ICMS_SN'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TRIBUTAR'
        DataType = ftInteger
      end
      item
        Name = 'BALANCA'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TARA'
        DataType = ftFloat
      end
      item
        Name = 'UNIDADE'
        DataType = ftInteger
      end
      item
        Name = 'ATIVO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'COMANDA'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'LOCAL_IMP'
        DataType = ftInteger
      end
      item
        Name = 'DESCONTO'
        DataType = ftFloat
      end
      item
        Name = 'ACRESCIMO'
        DataType = ftFloat
      end
      item
        Name = 'PROD_MTN'
        DataType = ftInteger
      end
      item
        Name = 'ESTOQUE'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ESTNEGATIVO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ESTOQUE_FISICO'
        DataType = ftFloat
      end
      item
        Name = 'ESTOQUE_VIRTUAL'
        DataType = ftFloat
      end
      item
        Name = 'ESTOQUEMIN'
        DataType = ftFloat
      end
      item
        Name = 'ESTOQUEMAX'
        DataType = ftFloat
      end
      item
        Name = 'TEMPO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 5
      end
      item
        Name = 'DIA_PROD'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'IMP_PERS'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'VALSALDOENT'
        DataType = ftFloat
      end
      item
        Name = 'QTDSALDOENT'
        DataType = ftFloat
      end
      item
        Name = 'TAXA'
        DataType = ftFloat
      end
      item
        Name = 'TAXA_SN'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'LUCRO'
        DataType = ftFloat
      end
      item
        Name = 'MOVEL'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'PIS'
        DataType = ftFloat
      end
      item
        Name = 'REDUCAOICMS'
        DataType = ftFloat
      end
      item
        Name = 'COFINS'
        DataType = ftFloat
      end
      item
        Name = 'ICMS'
        DataType = ftFloat
      end
      item
        Name = 'TRIBUTAR_ANTIGO'
        DataType = ftInteger
      end
      item
        Name = 'TRIBUTAR_FORA_ANTIGO'
        DataType = ftInteger
      end
      item
        Name = 'PRECO_AGREGADO'
        DataType = ftFloat
      end
      item
        Name = 'TRIBUTAR_FORA'
        DataType = ftInteger
      end
      item
        Name = 'CST'
        DataType = ftInteger
      end
      item
        Name = 'COMISSAO'
        DataType = ftFloat
      end
      item
        Name = 'COMISPRSN'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ITEMDATASUL'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'CLASSFISC_DATASUL'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'NATOPERACAO_DATASUL'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'UNITEM_DATASUL'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'UNFAMI_DATASUL'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CODTRIB_DATASUL'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'PERREDUCAOICMS_DATASUL'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'NIVEL_ISENTO'
        DataType = ftInteger
      end
      item
        Name = 'OBSFRENTE'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NCM'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'BXCARTELA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'MONTAR'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ESTLISTA_SN'
        DataType = ftString
        Size = 1
      end>
    Filter = 'TIPO='#39'M'#39' or TIPO='#39'A'#39
    Filtered = True
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY29'
        Fields = 'CODIGO_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN36'
        Fields = 'TRIBUTAR'
      end
      item
        Name = 'RDB$FOREIGN37'
        Fields = 'UNIDADE'
      end
      item
        Name = 'RDB$FOREIGN38'
        Fields = 'GRUPO'
      end
      item
        Name = 'IDX_PRODUTO_ATIVO'
        Fields = 'ATIVO'
      end
      item
        Name = 'IDX_PRODUTO_BALANCA'
        Fields = 'BALANCA'
      end
      item
        Name = 'IDX_PRODUTO_COMANDA'
        Fields = 'COMANDA'
      end
      item
        Name = 'IDX_PRODUTO_DESCRICAO'
        Fields = 'DESCRICAO'
      end
      item
        Name = 'IDX_PRODUTO_PRODUTO'
        Fields = 'PRODUTO'
      end
      item
        Name = 'RDB$FOREIGN57'
        Fields = 'LOCAL_IMP'
      end
      item
        Name = 'IDX_PRODUTOS_PRODUNIQ'
        Fields = 'PRODUTO'
        Options = [ixUnique]
      end
      item
        Name = 'IDX_PRODUTOS_DESCRICAO'
        Fields = 'DESCRICAO'
      end
      item
        Name = 'IDX_PRODUTO_PRODUTOS'
        Fields = 'PRODUTO'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'PRODUTOS'
    Left = 864
    Top = 101
    object IBT_ProdListaDesUnidade: TStringField
      FieldKind = fkLookup
      FieldName = 'DesUnidade'
      LookupDataSet = IBT_Unidade
      LookupKeyFields = 'CODIGO_ID'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'UNIDADE'
      Size = 50
      Lookup = True
    end
    object IBT_ProdListaCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_ProdListaPRODUTO: TIBStringField
      FieldName = 'PRODUTO'
      Size = 13
    end
    object IBT_ProdListaDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object IBT_ProdListaPRECO: TFloatField
      FieldName = 'PRECO'
    end
    object IBT_ProdListaPRECOCUSTO: TFloatField
      FieldName = 'PRECOCUSTO'
    end
    object IBT_ProdListaGRUPO: TIntegerField
      FieldName = 'GRUPO'
    end
    object IBT_ProdListaICMS_SN: TIBStringField
      FieldName = 'ICMS_SN'
      Size = 1
    end
    object IBT_ProdListaTRIBUTAR: TIntegerField
      FieldName = 'TRIBUTAR'
    end
    object IBT_ProdListaBALANCA: TIBStringField
      FieldName = 'BALANCA'
      Size = 1
    end
    object IBT_ProdListaTARA: TFloatField
      FieldName = 'TARA'
    end
    object IBT_ProdListaUNIDADE: TIntegerField
      FieldName = 'UNIDADE'
    end
    object IBT_ProdListaATIVO: TIBStringField
      FieldName = 'ATIVO'
      Size = 1
    end
    object IBT_ProdListaCOMANDA: TIBStringField
      FieldName = 'COMANDA'
      Size = 1
    end
    object IBT_ProdListaLOCAL_IMP: TIntegerField
      FieldName = 'LOCAL_IMP'
    end
    object IBT_ProdListaDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
    object IBT_ProdListaACRESCIMO: TFloatField
      FieldName = 'ACRESCIMO'
    end
    object IBT_ProdListaPROD_MTN: TIntegerField
      FieldName = 'PROD_MTN'
    end
    object IBT_ProdListaESTOQUE: TIBStringField
      FieldName = 'ESTOQUE'
      Size = 1
    end
    object IBT_ProdListaESTNEGATIVO: TIBStringField
      FieldName = 'ESTNEGATIVO'
      Size = 1
    end
    object IBT_ProdListaESTOQUE_FISICO: TFloatField
      FieldName = 'ESTOQUE_FISICO'
    end
    object IBT_ProdListaESTOQUE_VIRTUAL: TFloatField
      FieldName = 'ESTOQUE_VIRTUAL'
    end
    object IBT_ProdListaESTOQUEMIN: TFloatField
      FieldName = 'ESTOQUEMIN'
    end
    object IBT_ProdListaESTOQUEMAX: TFloatField
      FieldName = 'ESTOQUEMAX'
    end
    object IBT_ProdListaTEMPO: TIBStringField
      FieldName = 'TEMPO'
      Required = True
      Size = 5
    end
    object IBT_ProdListaDIA_PROD: TIBStringField
      FieldName = 'DIA_PROD'
      Size = 1
    end
    object IBT_ProdListaIMP_PERS: TIBStringField
      FieldName = 'IMP_PERS'
      Size = 1
    end
    object IBT_ProdListaVALSALDOENT: TFloatField
      FieldName = 'VALSALDOENT'
    end
    object IBT_ProdListaQTDSALDOENT: TFloatField
      FieldName = 'QTDSALDOENT'
    end
    object IBT_ProdListaTAXA: TFloatField
      FieldName = 'TAXA'
    end
    object IBT_ProdListaTAXA_SN: TIBStringField
      FieldName = 'TAXA_SN'
      Size = 1
    end
    object IBT_ProdListaLUCRO: TFloatField
      FieldName = 'LUCRO'
    end
    object IBT_ProdListaMOVEL: TIBStringField
      FieldName = 'MOVEL'
      Size = 1
    end
    object IBT_ProdListaPIS: TFloatField
      FieldName = 'PIS'
    end
    object IBT_ProdListaREDUCAOICMS: TFloatField
      FieldName = 'REDUCAOICMS'
    end
    object IBT_ProdListaCOFINS: TFloatField
      FieldName = 'COFINS'
    end
    object IBT_ProdListaICMS: TFloatField
      FieldName = 'ICMS'
    end
    object IBT_ProdListaTRIBUTAR_ANTIGO: TIntegerField
      FieldName = 'TRIBUTAR_ANTIGO'
    end
    object IBT_ProdListaTRIBUTAR_FORA_ANTIGO: TIntegerField
      FieldName = 'TRIBUTAR_FORA_ANTIGO'
    end
    object IBT_ProdListaPRECO_AGREGADO: TFloatField
      FieldName = 'PRECO_AGREGADO'
    end
    object IBT_ProdListaTRIBUTAR_FORA: TIntegerField
      FieldName = 'TRIBUTAR_FORA'
    end
    object IBT_ProdListaCST: TIntegerField
      FieldName = 'CST'
    end
    object IBT_ProdListaCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
    end
    object IBT_ProdListaCOMISPRSN: TIBStringField
      FieldName = 'COMISPRSN'
      Size = 1
    end
    object IBT_ProdListaITEMDATASUL: TIBStringField
      FieldName = 'ITEMDATASUL'
      Size = 16
    end
    object IBT_ProdListaCLASSFISC_DATASUL: TIBStringField
      FieldName = 'CLASSFISC_DATASUL'
      Size = 12
    end
    object IBT_ProdListaNATOPERACAO_DATASUL: TIBStringField
      FieldName = 'NATOPERACAO_DATASUL'
      Size = 8
    end
    object IBT_ProdListaUNITEM_DATASUL: TIBStringField
      FieldName = 'UNITEM_DATASUL'
      Size = 2
    end
    object IBT_ProdListaUNFAMI_DATASUL: TIBStringField
      FieldName = 'UNFAMI_DATASUL'
      Size = 2
    end
    object IBT_ProdListaCODTRIB_DATASUL: TIBStringField
      FieldName = 'CODTRIB_DATASUL'
      Size = 2
    end
    object IBT_ProdListaPERREDUCAOICMS_DATASUL: TIBStringField
      FieldName = 'PERREDUCAOICMS_DATASUL'
      Size = 7
    end
    object IBT_ProdListaNIVEL_ISENTO: TIntegerField
      FieldName = 'NIVEL_ISENTO'
    end
    object IBT_ProdListaOBSFRENTE: TIBStringField
      FieldName = 'OBSFRENTE'
      Size = 1
    end
    object IBT_ProdListaNCM: TIBStringField
      FieldName = 'NCM'
      Size = 8
    end
    object IBT_ProdListaBXCARTELA: TIBStringField
      FieldName = 'BXCARTELA'
      Size = 1
    end
    object IBT_ProdListaMONTAR: TIBStringField
      FieldName = 'MONTAR'
      Size = 1
    end
    object IBT_ProdListaTIPO: TIBStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object IBT_ProdListaESTLISTA_SN: TIBStringField
      FieldName = 'ESTLISTA_SN'
      Size = 1
    end
  end
  object DTS_ProdLista: TDataSource
    DataSet = IBT_ProdLista
    Left = 860
    Top = 144
  end
  object IBQ_ProEst: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from PRODUTOS')
    Left = 860
    Top = 196
    object IBQ_ProEstCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'PRODUTOS.CODIGO_ID'
      Required = True
    end
    object IBQ_ProEstPRODUTO: TIBStringField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTOS.PRODUTO'
      Size = 13
    end
    object IBQ_ProEstDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'PRODUTOS.DESCRICAO'
      Size = 50
    end
    object IBQ_ProEstPRECO: TFloatField
      FieldName = 'PRECO'
      Origin = 'PRODUTOS.PRECO'
    end
    object IBQ_ProEstPRECOCUSTO: TFloatField
      FieldName = 'PRECOCUSTO'
      Origin = 'PRODUTOS.PRECOCUSTO'
    end
    object IBQ_ProEstGRUPO: TIntegerField
      FieldName = 'GRUPO'
      Origin = 'PRODUTOS.GRUPO'
    end
    object IBQ_ProEstICMS_SN: TIBStringField
      FieldName = 'ICMS_SN'
      Origin = 'PRODUTOS.ICMS_SN'
      Required = True
      Size = 1
    end
    object IBQ_ProEstTRIBUTAR: TIntegerField
      FieldName = 'TRIBUTAR'
      Origin = 'PRODUTOS.TRIBUTAR'
    end
    object IBQ_ProEstBALANCA: TIBStringField
      FieldName = 'BALANCA'
      Origin = 'PRODUTOS.BALANCA'
      Required = True
      Size = 1
    end
    object IBQ_ProEstTARA: TFloatField
      FieldName = 'TARA'
      Origin = 'PRODUTOS.TARA'
    end
    object IBQ_ProEstUNIDADE: TIntegerField
      FieldName = 'UNIDADE'
      Origin = 'PRODUTOS.UNIDADE'
    end
    object IBQ_ProEstATIVO: TIBStringField
      FieldName = 'ATIVO'
      Origin = 'PRODUTOS.ATIVO'
      Required = True
      Size = 1
    end
    object IBQ_ProEstCOMANDA: TIBStringField
      FieldName = 'COMANDA'
      Origin = 'PRODUTOS.COMANDA'
      Required = True
      Size = 1
    end
    object IBQ_ProEstLOCAL_IMP: TIntegerField
      FieldName = 'LOCAL_IMP'
      Origin = 'PRODUTOS.LOCAL_IMP'
    end
    object IBQ_ProEstDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      Origin = 'PRODUTOS.DESCONTO'
    end
    object IBQ_ProEstACRESCIMO: TFloatField
      FieldName = 'ACRESCIMO'
      Origin = 'PRODUTOS.ACRESCIMO'
    end
    object IBQ_ProEstPROD_MTN: TIntegerField
      FieldName = 'PROD_MTN'
      Origin = 'PRODUTOS.PROD_MTN'
    end
    object IBQ_ProEstESTOQUE: TIBStringField
      FieldName = 'ESTOQUE'
      Origin = 'PRODUTOS.ESTOQUE'
      Size = 1
    end
    object IBQ_ProEstESTNEGATIVO: TIBStringField
      FieldName = 'ESTNEGATIVO'
      Origin = 'PRODUTOS.ESTNEGATIVO'
      Size = 1
    end
    object IBQ_ProEstESTOQUE_FISICO: TFloatField
      FieldName = 'ESTOQUE_FISICO'
      Origin = 'PRODUTOS.ESTOQUE_FISICO'
    end
    object IBQ_ProEstESTOQUE_VIRTUAL: TFloatField
      FieldName = 'ESTOQUE_VIRTUAL'
      Origin = 'PRODUTOS.ESTOQUE_VIRTUAL'
    end
    object IBQ_ProEstESTOQUEMIN: TFloatField
      FieldName = 'ESTOQUEMIN'
      Origin = 'PRODUTOS.ESTOQUEMIN'
    end
    object IBQ_ProEstESTOQUEMAX: TFloatField
      FieldName = 'ESTOQUEMAX'
      Origin = 'PRODUTOS.ESTOQUEMAX'
    end
    object IBQ_ProEstTEMPO: TIBStringField
      FieldName = 'TEMPO'
      Origin = 'PRODUTOS.TEMPO'
      Required = True
      Size = 5
    end
    object IBQ_ProEstDIA_PROD: TIBStringField
      FieldName = 'DIA_PROD'
      Origin = 'PRODUTOS.DIA_PROD'
      Required = True
      Size = 1
    end
    object IBQ_ProEstIMP_PERS: TIBStringField
      FieldName = 'IMP_PERS'
      Origin = 'PRODUTOS.IMP_PERS'
      Required = True
      Size = 1
    end
    object IBQ_ProEstVALSALDOENT: TFloatField
      FieldName = 'VALSALDOENT'
      Origin = 'PRODUTOS.VALSALDOENT'
    end
    object IBQ_ProEstQTDSALDOENT: TFloatField
      FieldName = 'QTDSALDOENT'
      Origin = 'PRODUTOS.QTDSALDOENT'
    end
    object IBQ_ProEstTAXA: TFloatField
      FieldName = 'TAXA'
      Origin = 'PRODUTOS.TAXA'
    end
    object IBQ_ProEstTAXA_SN: TIBStringField
      FieldName = 'TAXA_SN'
      Origin = 'PRODUTOS.TAXA_SN'
      Size = 1
    end
    object IBQ_ProEstLUCRO: TFloatField
      FieldName = 'LUCRO'
      Origin = 'PRODUTOS.LUCRO'
    end
    object IBQ_ProEstMOVEL: TIBStringField
      FieldName = 'MOVEL'
      Origin = 'PRODUTOS.MOVEL'
      Size = 1
    end
    object IBQ_ProEstPIS: TFloatField
      FieldName = 'PIS'
      Origin = 'PRODUTOS.PIS'
    end
    object IBQ_ProEstREDUCAOICMS: TFloatField
      FieldName = 'REDUCAOICMS'
      Origin = 'PRODUTOS.REDUCAOICMS'
    end
    object IBQ_ProEstCOFINS: TFloatField
      FieldName = 'COFINS'
      Origin = 'PRODUTOS.COFINS'
    end
    object IBQ_ProEstICMS: TFloatField
      FieldName = 'ICMS'
      Origin = 'PRODUTOS.ICMS'
    end
    object IBQ_ProEstTRIBUTAR_ANTIGO: TIntegerField
      FieldName = 'TRIBUTAR_ANTIGO'
      Origin = 'PRODUTOS.TRIBUTAR_ANTIGO'
    end
    object IBQ_ProEstTRIBUTAR_FORA_ANTIGO: TIntegerField
      FieldName = 'TRIBUTAR_FORA_ANTIGO'
      Origin = 'PRODUTOS.TRIBUTAR_FORA_ANTIGO'
    end
    object IBQ_ProEstPRECO_AGREGADO: TFloatField
      FieldName = 'PRECO_AGREGADO'
      Origin = 'PRODUTOS.PRECO_AGREGADO'
    end
    object IBQ_ProEstTRIBUTAR_FORA: TIntegerField
      FieldName = 'TRIBUTAR_FORA'
      Origin = 'PRODUTOS.TRIBUTAR_FORA'
    end
    object IBQ_ProEstCST: TIntegerField
      FieldName = 'CST'
      Origin = 'PRODUTOS.CST'
    end
    object IBQ_ProEstCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
      Origin = 'PRODUTOS.COMISSAO'
    end
    object IBQ_ProEstCOMISPRSN: TIBStringField
      FieldName = 'COMISPRSN'
      Origin = 'PRODUTOS.COMISPRSN'
      Size = 1
    end
    object IBQ_ProEstITEMDATASUL: TIBStringField
      FieldName = 'ITEMDATASUL'
      Origin = 'PRODUTOS.ITEMDATASUL'
      Size = 16
    end
    object IBQ_ProEstCLASSFISC_DATASUL: TIBStringField
      FieldName = 'CLASSFISC_DATASUL'
      Origin = 'PRODUTOS.CLASSFISC_DATASUL'
      Size = 12
    end
    object IBQ_ProEstNATOPERACAO_DATASUL: TIBStringField
      FieldName = 'NATOPERACAO_DATASUL'
      Origin = 'PRODUTOS.NATOPERACAO_DATASUL'
      Size = 8
    end
    object IBQ_ProEstUNITEM_DATASUL: TIBStringField
      FieldName = 'UNITEM_DATASUL'
      Origin = 'PRODUTOS.UNITEM_DATASUL'
      Size = 2
    end
    object IBQ_ProEstUNFAMI_DATASUL: TIBStringField
      FieldName = 'UNFAMI_DATASUL'
      Origin = 'PRODUTOS.UNFAMI_DATASUL'
      Size = 2
    end
    object IBQ_ProEstCODTRIB_DATASUL: TIBStringField
      FieldName = 'CODTRIB_DATASUL'
      Origin = 'PRODUTOS.CODTRIB_DATASUL'
      Size = 2
    end
    object IBQ_ProEstPERREDUCAOICMS_DATASUL: TIBStringField
      FieldName = 'PERREDUCAOICMS_DATASUL'
      Origin = 'PRODUTOS.PERREDUCAOICMS_DATASUL'
      Size = 7
    end
    object IBQ_ProEstNIVEL_ISENTO: TIntegerField
      FieldName = 'NIVEL_ISENTO'
      Origin = 'PRODUTOS.NIVEL_ISENTO'
    end
    object IBQ_ProEstOBSFRENTE: TIBStringField
      FieldName = 'OBSFRENTE'
      Origin = 'PRODUTOS.OBSFRENTE'
      Required = True
      Size = 1
    end
    object IBQ_ProEstNCM: TIBStringField
      FieldName = 'NCM'
      Origin = 'PRODUTOS.NCM'
      Size = 8
    end
    object IBQ_ProEstBXCARTELA: TIBStringField
      FieldName = 'BXCARTELA'
      Origin = 'PRODUTOS.BXCARTELA'
      Size = 1
    end
    object IBQ_ProEstMONTAR: TIBStringField
      FieldName = 'MONTAR'
      Origin = 'PRODUTOS.MONTAR'
      Size = 1
    end
    object IBQ_ProEstTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = 'PRODUTOS.TIPO'
      Size = 1
    end
    object IBQ_ProEstESTLISTA_SN: TIBStringField
      FieldName = 'ESTLISTA_SN'
      Origin = 'PRODUTOS.ESTLISTA_SN'
      Size = 1
    end
  end
  object DTS_ProEst: TDataSource
    DataSet = IBQ_ProEst
    Left = 860
    Top = 240
  end
  object IBQ_LisEst: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DTS_ProEst
    SQL.Strings = (
      'select * '
      'from LISTA'
      'where PRODUTO =  :CODIGO_ID')
    Left = 860
    Top = 288
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO_ID'
        ParamType = ptUnknown
        Size = 4
      end>
    object IBQ_LisEstCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'LISTA.CODIGO_ID'
      Required = True
    end
    object IBQ_LisEstPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'LISTA.PRODUTO'
      Required = True
    end
    object IBQ_LisEstMATERIAL: TIntegerField
      FieldName = 'MATERIAL'
      Origin = 'LISTA.MATERIAL'
      Required = True
    end
    object IBQ_LisEstQTD: TFloatField
      FieldName = 'QTD'
      Origin = 'LISTA.QTD'
      Required = True
    end
    object IBQ_LisEstPRECOCUSTO: TFloatField
      FieldName = 'PRECOCUSTO'
      Origin = 'LISTA.PRECOCUSTO'
    end
    object IBQ_LisEstBAIXAR: TIBStringField
      FieldName = 'BAIXAR'
      Origin = 'LISTA.BAIXAR'
      Size = 1
    end
    object IBQ_LisEstPRECO: TFloatField
      FieldName = 'PRECO'
      Origin = 'LISTA.PRECO'
    end
    object IBQ_LisEstUNIDADE: TIntegerField
      FieldName = 'UNIDADE'
      Origin = 'LISTA.UNIDADE'
    end
  end
  object IBQ_FunUse: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select fc.descricao,'
      '          us.codigo_id ,'
      '          us.login'
      'from funcionario fc'
      'inner join usuario us on (fc.codigo_id = us.funcionario)'
      'order by 1')
    Left = 864
    Top = 416
    object IBQ_FunUseDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'FUNCIONARIO.DESCRICAO'
      Size = 60
    end
    object IBQ_FunUseCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'USUARIO.CODIGO_ID'
      Required = True
    end
    object IBQ_FunUseLOGIN: TIBStringField
      FieldName = 'LOGIN'
      Origin = 'USUARIO.LOGIN'
    end
  end
  object DTS_FunUse: TDataSource
    DataSet = IBQ_FunUse
    Left = 864
    Top = 464
  end
end
