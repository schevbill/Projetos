object FRM_Modulo: TFRM_Modulo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 227
  Top = 166
  Height = 486
  Width = 828
  object DataBaseIB: TIBDatabase
    Connected = True
    DatabaseName = 'D:\SVN\.DB\Cardapio\ARCOIRIS.GDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=sysdbambd')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    AllowStreamedConnected = False
    Left = 24
    Top = 9
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
    Top = 9
  end
  object IBT_Usuario: TIBTable
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
    Left = 634
    Top = 78
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
    Left = 634
    Top = 122
  end
  object IBT_Modulos: TIBTable
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
    Left = 707
    Top = 78
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
    Left = 707
    Top = 122
  end
  object IBT_Nivel: TIBTable
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
    Left = 634
    Top = 186
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
    Left = 634
    Top = 230
  end
  object IBT_Permissao: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    AfterDelete = IBT_CargoAfterDelete
    AfterInsert = IBT_CargoAfterInsert
    AfterPost = IBT_CargoAfterPost
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
    Left = 555
    Top = 186
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
    Left = 555
    Top = 230
  end
  object IBT_UsuNivel: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    AfterDelete = IBT_CargoAfterDelete
    AfterInsert = IBT_CargoAfterInsert
    AfterPost = IBT_CargoAfterPost
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
        Name = 'SENHA'
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
    IndexFieldNames = 'NIVEL'
    MasterFields = 'CODIGO_ID'
    MasterSource = DTS_Nivel
    StoreDefs = True
    TableName = 'USUARIO'
    Left = 707
    Top = 186
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
    DataSet = IBT_UsuNivel
    Left = 707
    Top = 229
  end
  object IBT_Funcionario: TIBTable
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
    TableName = 'FUNCIONARIO'
    Left = 555
    Top = 77
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
  end
  object DTS_Funcionario: TDataSource
    DataSet = IBT_Funcionario
    Left = 555
    Top = 123
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
    Left = 24
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
    Left = 24
    Top = 122
  end
  object IBT_Config: TIBTable
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
    Left = 91
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
    Left = 91
    Top = 122
  end
  object IBT_FormaPagto: TIBTable
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
        Name = 'DESCONTO'
        DataType = ftFloat
      end
      item
        Name = 'TIPOPAGTO'
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
  end
  object DTS_FormaPagto: TDataSource
    DataSet = IBT_FormaPagto
    Left = 236
    Top = 122
  end
  object IBT_Grupo: TIBTable
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
  end
  object DTS_MesaFecha: TDataSource
    DataSet = IBT_MesaFecha
    Left = 390
    Top = 122
  end
  object IBT_MesaItem: TIBTable
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
  end
  object DTS_MesaItem: TDataSource
    DataSet = IBT_MesaItem
    Left = 470
    Top = 122
  end
  object IBT_Periodo: TIBTable
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
    Left = 24
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
    Left = 24
    Top = 230
  end
  object IBT_PontoVenda: TIBTable
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
    Left = 91
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
    Left = 91
    Top = 230
  end
  object IBT_Produtos: TIBTable
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
      end>
    Filter = 'ATIVO='#39'S'#39
    Filtered = True
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
    object IBT_ProdutosDesPortaImpressora: TStringField
      FieldKind = fkLookup
      FieldName = 'DesPortaImpressora'
      LookupDataSet = IBT_Config
      LookupKeyFields = 'CODIGO_ID'
      LookupResultField = 'PORT_IMPRI'
      KeyFields = 'LOCAL_IMP'
      Size = 60
      Lookup = True
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
  end
  object DTS_Produtos: TDataSource
    DataSet = IBT_Produtos
    Left = 160
    Top = 230
  end
  object IBT_TipoPagto: TIBTable
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
    TableName = 'TRIBUTAR'
    Left = 316
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
    Left = 316
    Top = 230
  end
  object IBT_Turno: TIBTable
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
    TableName = 'TURNO'
    Left = 390
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
    Left = 390
    Top = 230
  end
  object IBT_Unidade: TIBTable
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
    Left = 470
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
    Left = 470
    Top = 230
  end
  object DataBaseIBF: TIBDatabase
    DatabaseName = '192.168.1.5:/db/SIAC/SIAC.GDB'
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
    Top = 356
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
    Left = 91
    Top = 356
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
    Left = 24
    Top = 308
    object IBQ_DTSystemDATA_SER: TDateField
      FieldName = 'DATA_SER'
      Required = True
    end
    object IBQ_DTSystemHORA_SER: TTimeField
      FieldName = 'HORA_SER'
      Required = True
    end
  end
  object DTS_Terminal: TDataSource
    DataSet = IBT_Terminal
    Left = 716
    Top = 346
  end
  object IBT_Terminal: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'IP'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IMP_LOCAL'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'IMP_TIPO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'IMPRESSORA'
        DataType = ftString
        Size = 30
      end>
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
    TableName = 'TERMINAL'
    Left = 716
    Top = 300
    object IBT_TerminalIP: TIBStringField
      FieldName = 'IP'
      Size = 30
    end
    object IBT_TerminalIMP_LOCAL: TIBStringField
      FieldName = 'IMP_LOCAL'
      Size = 1
    end
    object IBT_TerminalIMP_TIPO: TIBStringField
      FieldName = 'IMP_TIPO'
      Size = 1
    end
    object IBT_TerminalIMPRESSORA: TIBStringField
      FieldName = 'IMPRESSORA'
      Size = 30
    end
  end
  object IBT_Parametros: TIBTable
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
    Left = 164
    Top = 76
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
  object DTS_Parametros: TDataSource
    DataSet = IBT_Parametros
    Left = 164
    Top = 122
  end
end
