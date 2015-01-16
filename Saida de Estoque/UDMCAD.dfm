object DMCAD: TDMCAD
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 457
  Width = 631
  object IBDCADCLIENTE: TIBDatabase
    DatabaseName = 
      'localhost:D:\Projetos K2\Projetos Delphi\Projetos Hightech\branc' +
      'hes\Saida de Estoque\dados\SAIDAESTOQUE25.GDB'
    Params.Strings = (
      'password=masterkey'
      'lc_ctype=WIN1252'
      'user_name=sysdba')
    LoginPrompt = False
    ServerType = 'IBServer'
    Left = 96
    Top = 16
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = IBDCADCLIENTE
    Left = 96
    Top = 64
  end
  object CadItem: TIBDataSet
    Database = IBDCADCLIENTE
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from ESTOQUE'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  DESCRICAO = :OLD_DESCRICAO and'
      '  ID_ITEM = :OLD_ID_ITEM and'
      '  ITEM = :OLD_ITEM and'
      '  QUANTIDADE = :OLD_QUANTIDADE')
    InsertSQL.Strings = (
      'insert into ESTOQUE'
      '  (CODIGO, DESCRICAO, ID_ITEM, ITEM, QUANTIDADE)'
      'values'
      '  (:CODIGO, :DESCRICAO, :ID_ITEM, :ITEM, :QUANTIDADE)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  ITEM,'
      '  ID_ITEM,'
      '  QUANTIDADE,'
      '  DESCRICAO'
      'from ESTOQUE '
      'where'
      '  CODIGO = :CODIGO and'
      '  DESCRICAO = :DESCRICAO and'
      '  ID_ITEM = :ID_ITEM and'
      '  ITEM = :ITEM and'
      '  QUANTIDADE = :QUANTIDADE')
    SelectSQL.Strings = (
      'SELECT '
      'CODIGO,'
      'DESCRICAO,'
      'ID_ITEM,'
      'ITEM,'
      'DATA_CADASTRO'
      'FROM ESTOQUE'
      ''
      'ORDER BY ITEM')
    ModifySQL.Strings = (
      'update ESTOQUE'
      'set'
      '  CODIGO = :CODIGO,'
      '  DESCRICAO = :DESCRICAO,'
      '  ID_ITEM = :ID_ITEM,'
      '  ITEM = :ITEM,'
      '  QUANTIDADE = :QUANTIDADE'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  DESCRICAO = :OLD_DESCRICAO and'
      '  ID_ITEM = :OLD_ID_ITEM and'
      '  ITEM = :OLD_ITEM and'
      '  QUANTIDADE = :OLD_QUANTIDADE')
    ParamCheck = True
    UniDirectional = False
    GeneratorField.Field = 'ID_ITEM'
    GeneratorField.Generator = 'NEW_GENERATOR'
    Left = 96
    Top = 120
    object CadItemCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"ESTOQUE"."CODIGO"'
      Required = True
    end
    object CadItemDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"ESTOQUE"."DESCRICAO"'
      Size = 120
    end
    object CadItemID_ITEM: TIntegerField
      FieldName = 'ID_ITEM'
      Origin = '"ESTOQUE"."ID_ITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CadItemITEM: TIBStringField
      FieldName = 'ITEM'
      Origin = '"ESTOQUE"."ITEM"'
      Size = 60
    end
    object CadItemDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = '"ESTOQUE"."DATA_CADASTRO"'
    end
  end
  object DTSitem: TDataSource
    DataSet = CadItem
    Left = 96
    Top = 168
  end
  object CADPACIENTE: TIBDataSet
    Database = IBDCADCLIENTE
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CADPACIENTE'
      'where'
      '  CODIGO_SUS = :OLD_CODIGO_SUS and'
      '  ENDERECO = :OLD_ENDERECO and'
      '  ID_PACIENTE = :OLD_ID_PACIENTE and'
      '  NOME = :OLD_NOME and'
      '  RESPONSAVEL = :OLD_RESPONSAVEL and'
      '  RG = :OLD_RG and'
      '  TELEFONE = :OLD_TELEFONE and'
      '  TELEFONE_RESP = :OLD_TELEFONE_RESP and'
      '  TIPO = :OLD_TIPO')
    InsertSQL.Strings = (
      'insert into CADPACIENTE'
      
        '  (CODIGO_SUS, ENDERECO, ID_PACIENTE, NOME, RESPONSAVEL, RG, TEL' +
        'EFONE, '
      '   TELEFONE_RESP, TIPO)'
      'values'
      
        '  (:CODIGO_SUS, :ENDERECO, :ID_PACIENTE, :NOME, :RESPONSAVEL, :R' +
        'G, :TELEFONE, '
      '   :TELEFONE_RESP, :TIPO)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO_SUS,'
      '  NOME,'
      '  RG,'
      '  TIPO,'
      '  RESPONSAVEL,'
      '  TELEFONE_RESP,'
      '  ENDERECO,'
      '  ID_PACIENTE,'
      '  TELEFONE'
      'from CADPACIENTE '
      'where'
      '  CODIGO_SUS = :CODIGO_SUS and'
      '  ENDERECO = :ENDERECO and'
      '  ID_PACIENTE = :ID_PACIENTE and'
      '  NOME = :NOME and'
      '  RESPONSAVEL = :RESPONSAVEL and'
      '  RG = :RG and'
      '  TELEFONE = :TELEFONE and'
      '  TELEFONE_RESP = :TELEFONE_RESP and'
      '  TIPO = :TIPO')
    SelectSQL.Strings = (
      'select'
      'CODIGO_SUS,'
      'ENDERECO,'
      'ID_PACIENTE,'
      'NOME,'
      'RESPONSAVEL,'
      'RG,'
      'TELEFONE,'
      'TELEFONE_RESP,'
      'DATA_CADASTRO'
      'from CADPACIENTE'
      ''
      'ORDER BY Nome')
    ModifySQL.Strings = (
      'update CADPACIENTE'
      'set'
      '  CODIGO_SUS = :CODIGO_SUS,'
      '  ENDERECO = :ENDERECO,'
      '  ID_PACIENTE = :ID_PACIENTE,'
      '  NOME = :NOME,'
      '  RESPONSAVEL = :RESPONSAVEL,'
      '  RG = :RG,'
      '  TELEFONE = :TELEFONE,'
      '  TELEFONE_RESP = :TELEFONE_RESP,'
      '  TIPO = :TIPO'
      'where'
      '  CODIGO_SUS = :OLD_CODIGO_SUS and'
      '  ENDERECO = :OLD_ENDERECO and'
      '  ID_PACIENTE = :OLD_ID_PACIENTE and'
      '  NOME = :OLD_NOME and'
      '  RESPONSAVEL = :OLD_RESPONSAVEL and'
      '  RG = :OLD_RG and'
      '  TELEFONE = :OLD_TELEFONE and'
      '  TELEFONE_RESP = :OLD_TELEFONE_RESP and'
      '  TIPO = :OLD_TIPO')
    ParamCheck = True
    UniDirectional = False
    GeneratorField.Field = 'ID_PACIENTE'
    GeneratorField.Generator = 'GEN_CADPACIENTE'
    Left = 16
    Top = 120
    object CADPACIENTECODIGO_SUS: TIntegerField
      FieldName = 'CODIGO_SUS'
      Origin = '"CADPACIENTE"."CODIGO_SUS"'
      Required = True
    end
    object CADPACIENTEENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = '"CADPACIENTE"."ENDERECO"'
      Size = 100
    end
    object CADPACIENTEID_PACIENTE: TIntegerField
      FieldName = 'ID_PACIENTE'
      Origin = '"CADPACIENTE"."ID_PACIENTE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CADPACIENTENOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"CADPACIENTE"."NOME"'
      Size = 60
    end
    object CADPACIENTERESPONSAVEL: TIBStringField
      FieldName = 'RESPONSAVEL'
      Origin = '"CADPACIENTE"."RESPONSAVEL"'
      Size = 30
    end
    object CADPACIENTERG: TIntegerField
      FieldName = 'RG'
      Origin = '"CADPACIENTE"."RG"'
    end
    object CADPACIENTETELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Origin = '"CADPACIENTE"."TELEFONE"'
      Size = 15
    end
    object CADPACIENTETELEFONE_RESP: TIBStringField
      FieldName = 'TELEFONE_RESP'
      Origin = '"CADPACIENTE"."TELEFONE_RESP"'
      Size = 15
    end
    object CADPACIENTEDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = '"CADPACIENTE"."DATA_CADASTRO"'
    end
  end
  object DTSPaciente: TDataSource
    DataSet = CADPACIENTE
    Left = 16
    Top = 168
  end
  object USUARIOS: TIBDataSet
    Database = IBDCADCLIENTE
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from USUARIOS'
      'where'
      '  ID_USUARIO = :OLD_ID_USUARIO and'
      '  NOME = :OLD_NOME and'
      '  SENHA = :OLD_SENHA and'
      '  USUARIO = :OLD_USUARIO')
    InsertSQL.Strings = (
      'insert into USUARIOS'
      '  (ID_USUARIO, NOME, SENHA, USUARIO)'
      'values'
      '  (:ID_USUARIO, :NOME, :SENHA, :USUARIO)')
    RefreshSQL.Strings = (
      'Select '
      '  USUARIO,'
      '  NOME,'
      '  SENHA,'
      '  ID_USUARIO'
      'from USUARIOS '
      'where'
      '  ID_USUARIO = :ID_USUARIO and'
      '  NOME = :NOME and'
      '  SENHA = :SENHA and'
      '  USUARIO = :USUARIO')
    SelectSQL.Strings = (
      'select ID_USUARIO,'
      'NOME,'
      'SENHA,'
      'USUARIO'
      ' from USUARIOS'
      ''
      'order by USUARIO')
    ModifySQL.Strings = (
      'update USUARIOS'
      'set'
      '  ID_USUARIO = :ID_USUARIO,'
      '  NOME = :NOME,'
      '  SENHA = :SENHA,'
      '  USUARIO = :USUARIO'
      'where'
      '  ID_USUARIO = :OLD_ID_USUARIO and'
      '  NOME = :OLD_NOME and'
      '  SENHA = :OLD_SENHA and'
      '  USUARIO = :OLD_USUARIO')
    ParamCheck = True
    UniDirectional = False
    GeneratorField.Field = 'ID_USUARIO'
    GeneratorField.Generator = 'GEN_USUARIO'
    Left = 160
    Top = 120
    object USUARIOSID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = '"USUARIOS"."ID_USUARIO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object USUARIOSNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"USUARIOS"."NOME"'
      Required = True
      Size = 60
    end
    object USUARIOSSENHA: TIBStringField
      FieldName = 'SENHA'
      Origin = '"USUARIOS"."SENHA"'
      Size = 6
    end
    object USUARIOSUSUARIO: TIBStringField
      FieldName = 'USUARIO'
      Origin = '"USUARIOS"."USUARIO"'
      Required = True
      Size = 15
    end
  end
  object DTSUsuario: TDataSource
    DataSet = USUARIOS
    Left = 160
    Top = 168
  end
  object DTSLancMaterial: TDataSource
    Left = 240
    Top = 168
  end
  object PesquisaPaciente: TIBDataSet
    Database = IBDCADCLIENTE
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CADPACIENTE'
      'where'
      '  CODIGO_SUS = :OLD_CODIGO_SUS and'
      '  ENDERECO = :OLD_ENDERECO and'
      '  ID_PACIENTE = :OLD_ID_PACIENTE and'
      '  NOME = :OLD_NOME and'
      '  RESPONSAVEL = :OLD_RESPONSAVEL and'
      '  RG = :OLD_RG and'
      '  TELEFONE = :OLD_TELEFONE and'
      '  TELEFONE_RESP = :OLD_TELEFONE_RESP and'
      '  TIPO = :OLD_TIPO')
    InsertSQL.Strings = (
      'insert into CADPACIENTE'
      
        '  (CODIGO_SUS, ENDERECO, ID_PACIENTE, NOME, RESPONSAVEL, RG, TEL' +
        'EFONE, '
      '   TELEFONE_RESP, TIPO)'
      'values'
      
        '  (:CODIGO_SUS, :ENDERECO, :ID_PACIENTE, :NOME, :RESPONSAVEL, :R' +
        'G, :TELEFONE, '
      '   :TELEFONE_RESP, :TIPO)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO_SUS,'
      '  NOME,'
      '  RG,'
      '  TIPO,'
      '  RESPONSAVEL,'
      '  TELEFONE_RESP,'
      '  ENDERECO,'
      '  ID_PACIENTE,'
      '  TELEFONE'
      'from CADPACIENTE '
      'where'
      '  CODIGO_SUS = :CODIGO_SUS and'
      '  ENDERECO = :ENDERECO and'
      '  ID_PACIENTE = :ID_PACIENTE and'
      '  NOME = :NOME and'
      '  RESPONSAVEL = :RESPONSAVEL and'
      '  RG = :RG and'
      '  TELEFONE = :TELEFONE and'
      '  TELEFONE_RESP = :TELEFONE_RESP and'
      '  TIPO = :TIPO')
    SelectSQL.Strings = (
      'SELECT '
      'CODIGO_SUS,'
      'ENDERECO,'
      'ID_PACIENTE,'
      'NOME,'
      'RESPONSAVEL,'
      'RG,'
      'TELEFONE,'
      'TELEFONE_RESP,'
      'TIPO'
      ''
      'FROM CADPACIENTE'
      '')
    ModifySQL.Strings = (
      'update CADPACIENTE'
      'set'
      '  CODIGO_SUS = :CODIGO_SUS,'
      '  ENDERECO = :ENDERECO,'
      '  ID_PACIENTE = :ID_PACIENTE,'
      '  NOME = :NOME,'
      '  RESPONSAVEL = :RESPONSAVEL,'
      '  RG = :RG,'
      '  TELEFONE = :TELEFONE,'
      '  TELEFONE_RESP = :TELEFONE_RESP,'
      '  TIPO = :TIPO'
      'where'
      '  CODIGO_SUS = :OLD_CODIGO_SUS and'
      '  ENDERECO = :OLD_ENDERECO and'
      '  ID_PACIENTE = :OLD_ID_PACIENTE and'
      '  NOME = :OLD_NOME and'
      '  RESPONSAVEL = :OLD_RESPONSAVEL and'
      '  RG = :OLD_RG and'
      '  TELEFONE = :OLD_TELEFONE and'
      '  TELEFONE_RESP = :OLD_TELEFONE_RESP and'
      '  TIPO = :OLD_TIPO')
    ParamCheck = True
    UniDirectional = False
    Left = 208
    Top = 232
    object PesquisaPacienteCODIGO_SUS: TIntegerField
      FieldName = 'CODIGO_SUS'
      Origin = '"CADPACIENTE"."CODIGO_SUS"'
      Required = True
    end
    object PesquisaPacienteENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = '"CADPACIENTE"."ENDERECO"'
      Size = 100
    end
    object PesquisaPacienteID_PACIENTE: TIntegerField
      FieldName = 'ID_PACIENTE'
      Origin = '"CADPACIENTE"."ID_PACIENTE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object PesquisaPacienteNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"CADPACIENTE"."NOME"'
      Size = 60
    end
    object PesquisaPacienteRESPONSAVEL: TIBStringField
      FieldName = 'RESPONSAVEL'
      Origin = '"CADPACIENTE"."RESPONSAVEL"'
      Size = 30
    end
    object PesquisaPacienteRG: TIntegerField
      FieldName = 'RG'
      Origin = '"CADPACIENTE"."RG"'
    end
    object PesquisaPacienteTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Origin = '"CADPACIENTE"."TELEFONE"'
      Size = 15
    end
    object PesquisaPacienteTELEFONE_RESP: TIBStringField
      FieldName = 'TELEFONE_RESP'
      Origin = '"CADPACIENTE"."TELEFONE_RESP"'
      Size = 15
    end
    object PesquisaPacienteTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = '"CADPACIENTE"."TIPO"'
      Size = 30
    end
  end
  object DTSPesquisa1: TDataSource
    DataSet = PesquisaPaciente
    Left = 200
    Top = 280
  end
  object PesquisaMaterial: TIBDataSet
    Database = IBDCADCLIENTE
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from ESTOQUE'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  DESCRICAO = :OLD_DESCRICAO and'
      '  ID_ITEM = :OLD_ID_ITEM and'
      '  ITEM = :OLD_ITEM')
    InsertSQL.Strings = (
      'insert into ESTOQUE'
      '  (CODIGO, DESCRICAO, ID_ITEM, ITEM)'
      'values'
      '  (:CODIGO, :DESCRICAO, :ID_ITEM, :ITEM)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  ITEM,'
      '  ID_ITEM,'
      '  QUANTIDADE,'
      '  DESCRICAO'
      'from ESTOQUE '
      'where'
      '  CODIGO = :CODIGO and'
      '  DESCRICAO = :DESCRICAO and'
      '  ID_ITEM = :ID_ITEM and'
      '  ITEM = :ITEM')
    SelectSQL.Strings = (
      'select'
      'CODIGO,'
      'DESCRICAO,'
      'ID_ITEM,'
      'ITEM'
      'from ESTOQUE'
      ''
      'order by ITEM')
    ModifySQL.Strings = (
      'update ESTOQUE'
      'set'
      '  CODIGO = :CODIGO,'
      '  DESCRICAO = :DESCRICAO,'
      '  ID_ITEM = :ID_ITEM,'
      '  ITEM = :ITEM'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  DESCRICAO = :OLD_DESCRICAO and'
      '  ID_ITEM = :OLD_ID_ITEM and'
      '  ITEM = :OLD_ITEM')
    ParamCheck = True
    UniDirectional = False
    Left = 280
    Top = 232
    object PesquisaMaterialCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"ESTOQUE"."CODIGO"'
      Required = True
    end
    object PesquisaMaterialDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"ESTOQUE"."DESCRICAO"'
      Size = 120
    end
    object PesquisaMaterialID_ITEM: TIntegerField
      FieldName = 'ID_ITEM'
      Origin = '"ESTOQUE"."ID_ITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object PesquisaMaterialITEM: TIBStringField
      FieldName = 'ITEM'
      Origin = '"ESTOQUE"."ITEM"'
      Size = 60
    end
  end
  object DTSPesquisa2: TDataSource
    DataSet = PesquisaMaterial
    Left = 280
    Top = 280
  end
  object LancMaterial: TIBDataSet
    Database = IBDCADCLIENTE
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from SAIDAESTOQUE'
      'where'
      '  DATA_SAIDA = :OLD_DATA_SAIDA and'
      '  ID_ITEM = :OLD_ID_ITEM and'
      '  ID_PACIENTE = :OLD_ID_PACIENTE and'
      '  ID_SAIDAESTOQUE = :OLD_ID_SAIDAESTOQUE and'
      '  QUANTIDADE = :OLD_QUANTIDADE and'
      '  USUARIO = :OLD_USUARIO')
    InsertSQL.Strings = (
      'insert into SAIDAESTOQUE'
      
        '  (DATA_SAIDA, ID_ITEM, ID_PACIENTE, ID_SAIDAESTOQUE, QUANTIDADE' +
        ', USUARIO)'
      'values'
      
        '  (:DATA_SAIDA, :ID_ITEM, :ID_PACIENTE, :ID_SAIDAESTOQUE, :QUANT' +
        'IDADE, '
      '   :USUARIO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_SAIDAESTOQUE,'
      '  ID_PACIENTE,'
      '  ID_ITEM,'
      '  USUARIO,'
      '  QUANTIDADE,'
      '  DATA_SAIDA'
      'from SAIDAESTOQUE '
      'where'
      '  DATA_SAIDA = :DATA_SAIDA and'
      '  ID_ITEM = :ID_ITEM and'
      '  ID_PACIENTE = :ID_PACIENTE and'
      '  ID_SAIDAESTOQUE = :ID_SAIDAESTOQUE and'
      '  QUANTIDADE = :QUANTIDADE and'
      '  USUARIO = :USUARIO')
    SelectSQL.Strings = (
      
        'select DATA_SAIDA, ID_ITEM, ID_PACIENTE, ID_SAIDAESTOQUE, QUANTI' +
        'DADE, USUARIO from SAIDAESTOQUE')
    ModifySQL.Strings = (
      'update SAIDAESTOQUE'
      'set'
      '  DATA_SAIDA = :DATA_SAIDA,'
      '  ID_ITEM = :ID_ITEM,'
      '  ID_PACIENTE = :ID_PACIENTE,'
      '  ID_SAIDAESTOQUE = :ID_SAIDAESTOQUE,'
      '  QUANTIDADE = :QUANTIDADE,'
      '  USUARIO = :USUARIO'
      'where'
      '  DATA_SAIDA = :OLD_DATA_SAIDA and'
      '  ID_ITEM = :OLD_ID_ITEM and'
      '  ID_PACIENTE = :OLD_ID_PACIENTE and'
      '  ID_SAIDAESTOQUE = :OLD_ID_SAIDAESTOQUE and'
      '  QUANTIDADE = :OLD_QUANTIDADE and'
      '  USUARIO = :OLD_USUARIO')
    ParamCheck = True
    UniDirectional = False
    GeneratorField.Field = 'ID_SAIDAESTOQUE'
    GeneratorField.Generator = 'GEN_LANCMATERIAL'
    Left = 240
    Top = 120
    object LancMaterialDATA_SAIDA: TDateField
      FieldName = 'DATA_SAIDA'
      Origin = '"SAIDAESTOQUE"."DATA_SAIDA"'
      Required = True
    end
    object LancMaterialID_ITEM: TIntegerField
      FieldName = 'ID_ITEM'
      Origin = '"SAIDAESTOQUE"."ID_ITEM"'
      Required = True
    end
    object LancMaterialID_PACIENTE: TIntegerField
      FieldName = 'ID_PACIENTE'
      Origin = '"SAIDAESTOQUE"."ID_PACIENTE"'
      Required = True
    end
    object LancMaterialID_SAIDAESTOQUE: TIntegerField
      FieldName = 'ID_SAIDAESTOQUE'
      Origin = '"SAIDAESTOQUE"."ID_SAIDAESTOQUE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object LancMaterialQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = '"SAIDAESTOQUE"."QUANTIDADE"'
      Required = True
    end
    object LancMaterialUSUARIO: TIBStringField
      FieldName = 'USUARIO'
      Origin = '"SAIDAESTOQUE"."USUARIO"'
      Size = 30
    end
  end
  object DTSPesquisa3: TDataSource
    DataSet = PesquisaLancamento
    Left = 384
    Top = 280
  end
  object PesquisaLancamento: TIBDataSet
    Database = IBDCADCLIENTE
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'Select'
      'SE.DATA_SAIDA,'
      'SE.ID_ITEM,'
      'SE.ID_PACIENTE,'
      'SE.ID_SAIDAESTOQUE,'
      'SE.QUANTIDADE,'
      'SE.USUARIO,'
      'ES.item,'
      'ES.descricao,'
      'CP.nome,'
      'CP.CODIGO_SUS'
      ''
      ''
      'from saidaestoque SE'
      ''
      'Left join estoque ES on (se.id_item = es.id_item)'
      'Left join cadpaciente CP on (SE.id_paciente = '
      ''
      'CP.id_paciente) ')
    ParamCheck = True
    UniDirectional = False
    Left = 384
    Top = 232
    object PesquisaLancamentoDATA_SAIDA: TDateField
      FieldName = 'DATA_SAIDA'
      Origin = '"SAIDAESTOQUE"."DATA_SAIDA"'
      Required = True
    end
    object PesquisaLancamentoID_ITEM: TIntegerField
      FieldName = 'ID_ITEM'
      Origin = '"SAIDAESTOQUE"."ID_ITEM"'
      Required = True
    end
    object PesquisaLancamentoID_PACIENTE: TIntegerField
      FieldName = 'ID_PACIENTE'
      Origin = '"SAIDAESTOQUE"."ID_PACIENTE"'
      Required = True
    end
    object PesquisaLancamentoID_SAIDAESTOQUE: TIntegerField
      FieldName = 'ID_SAIDAESTOQUE'
      Origin = '"SAIDAESTOQUE"."ID_SAIDAESTOQUE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object PesquisaLancamentoQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = '"SAIDAESTOQUE"."QUANTIDADE"'
      Required = True
    end
    object PesquisaLancamentoUSUARIO: TIBStringField
      FieldName = 'USUARIO'
      Origin = '"SAIDAESTOQUE"."USUARIO"'
      Size = 30
    end
    object PesquisaLancamentoITEM: TIBStringField
      FieldName = 'ITEM'
      Origin = '"ESTOQUE"."ITEM"'
      Size = 60
    end
    object PesquisaLancamentoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"ESTOQUE"."DESCRICAO"'
      Size = 120
    end
    object PesquisaLancamentoNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"CADPACIENTE"."NOME"'
      Size = 60
    end
    object PesquisaLancamentoCODIGO_SUS: TIntegerField
      FieldName = 'CODIGO_SUS'
      Origin = '"CADPACIENTE"."CODIGO_SUS"'
    end
  end
  object frxReport: TfrxReport
    Version = '4.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41424.665497777800000000
    ReportOptions.LastChange = 41434.757137002300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      'Fechar:String;'
      ''
      
        '//Variaveis de Arquivo INI                                      ' +
        '                 '
      'sNomeUsuario, sCaminhoIni : String;'
      'sArquivo : TiniFile;  '
      '  '
      
        '//Variaveis de Filtro                                           ' +
        '    '
      'sPalavra : String;    '
      ''
      
        '//Vari'#225'veis do Relatorio                                        ' +
        '          '
      'rSaldo : Real;                               '
      'iTemp: Integer;                                                 '
      'sTituloNF, sTituloNFE: String;  '
      ''
      ''
      'procedure btOKOnClick(Sender: TfrxComponent);'
      'begin'
      '  PAGE1.VISIBLE := FALSE;'
      '  page2.visible := false;'
      ''
      '  //Agrupamento'
      '  if cbagrupa.text ='#39'Paciente'#39' then'
      
        '   page1.visible := true;                                       ' +
        '           '
      '  if cbagrupa.text = '#39'Material'#39' then'
      '    page2.visible := true;      '
      '    '
      
        '  //fim do agrupamento                                          ' +
        '        '
      '  '
      '  //ORDENA'#199#195'O'
      ''
      '  if (cbcod.checked = true) then'
      '  begin              '
      '    QLancMaterial.SQL.STRINGS[19] := '#39'ORDER BY SE.DATA_SAIDA'#39';'
      
        '    QLanctotal.SQL.STRINGS[14] := '#39'ORDER BY SE.DATA_SAIDA'#39';     ' +
        '   '
      '    memo6.text  :='#39'Data de Sa'#237'da'#39';'
      '    Memo17.text :='#39'Data de Sa'#237'da'#39';                    '
      '  end;'
      '    '
      '  if (cbmat.checked = true) then'
      '  begin              '
      '    QLancMaterial.SQL.STRINGS[19] := '#39'ORDER BY ES.ITEM'#39';'
      '    QLanctotal.SQL.STRINGS[14] := '#39'ORDER BY ES.ITEM'#39';        '
      '    memo6.text  :='#39'Material'#39';'
      '    Memo17.text :='#39'Material'#39';                          '
      '  end;                    '
      '  '
      '  '
      '  btok.tag :=2;'
      '  Fechar:='#39'1'#39';        '
      'end;'
      ''
      ''
      ''
      'procedure btCancelarOnClick(Sender: TfrxComponent);'
      'begin'
      '  fechar :='#39'2'#39';                             '
      'end;'
      ''
      'procedure frxReportOnStopReport(Sender: TfrxComponent);'
      'begin'
      ''
      '    if ( btok.tag <> 2 ) then Fechar := '#39'2'#39';'
      'end;    '
      ''
      'begin'
      ''
      'end.')
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 440
    Top = 32
    Datasets = <
      item
        DataSet = frxReport.QLancMaterial
        DataSetName = 'QLANCMATERIAL'
      end
      item
        DataSet = frxReport.QLancTotal
        DataSetName = 'QLancTotal'
      end
      item
        DataSet = frxReport.QLANCMATERIAL2
        DataSetName = 'QLANCMATERIAL2'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
      object QLancMaterial: TfrxDBXQuery
        UserName = 'QLANCMATERIAL'
        CloseDataSource = True
        FieldAliases.Strings = (
          'QUANTIDADE=QUANTIDADE'
          'DATA_SAIDA=DATA_SAIDA'
          'ID_SAIDAESTOQUE=ID_SAIDAESTOQUE'
          'ITEM=ITEM'
          'DESCRICAO=DESCRICAO'
          'NOME=NOME'
          'CODIGO_SUS=CODIGO_SUS')
        BCDToCurrency = False
        IgnoreDupParams = False
        Params = <
          item
            Name = 'DTINICIAL'
            DataType = ftDate
            Expression = 'DTINICIAL.DATE'
          end
          item
            Name = 'DTFINAL'
            DataType = ftDate
            Expression = 'DTFINAL.DATE'
          end>
        SQL.Strings = (
          'Select'
          'sum(se.QUANTIDADE) as QUANTIDADE,'
          'SE.DATA_SAIDA,'
          'SE.ID_SAIDAESTOQUE,'
          'ES.item,'
          'ES.descricao,'
          'CP.nome,'
          'CP.CODIGO_SUS'
          ''
          ''
          'from saidaestoque SE'
          ''
          'Left join estoque ES on (se.id_item = es.id_item)'
          'Left join cadpaciente CP on (SE.id_paciente =CP.id_paciente)'
          ''
          
            'WHERE (SE.DATA_SAIDA BETWEEN :DTINICIAL AND :DTFINAL)           ' +
            '        '
          ''
          ''
          
            'group by SE.DATA_SAIDA,SE.ID_SAIDAESTOQUE, ES.item, ES.descricao' +
            ',CP.nome,CP.CODIGO_SUS    '
          '/*LINHA 19*/                    ')
        pLeft = 80
        pTop = 64
        Parameters = <
          item
            Name = 'DTINICIAL'
            DataType = ftDate
            Expression = 'DTINICIAL.DATE'
          end
          item
            Name = 'DTFINAL'
            DataType = ftDate
            Expression = 'DTFINAL.DATE'
          end>
      end
      object QLancTotal: TfrxDBXQuery
        UserName = 'QLancTotal'
        CloseDataSource = True
        FieldAliases.Strings = (
          'QUANTIDADE=QUANTIDADE'
          'ITEM=ITEM'
          'DESCRICAO=DESCRICAO'
          'DATA_SAIDA=DATA_SAIDA')
        BCDToCurrency = False
        IgnoreDupParams = False
        Params = <
          item
            Name = 'DTINICIAL'
            DataType = ftDate
            Expression = 'dtinicial.date'
          end
          item
            Name = 'DTFINAL'
            DataType = ftDate
            Expression = 'dtfinal.date'
          end>
        SQL.Strings = (
          'Select'
          'sum(se.QUANTIDADE) as QUANTIDADE,'
          'ES.item,'
          'ES.descricao,  '
          'se.data_saida                          '
          'from saidaestoque SE'
          ''
          'Left join estoque ES on (se.id_item = es.id_item)'
          'Left join cadpaciente CP on (SE.id_paciente =CP.id_paciente)'
          ''
          
            'WHERE (SE.DATA_SAIDA BETWEEN :DTINICIAL AND :DTFINAL)           ' +
            '        '
          ''
          ''
          
            'group by  ES.item, ES.descricao,se.data_saida                   ' +
            '                           '
          '/*LINHA 14*/  ')
        pLeft = 276
        pTop = 64
        Parameters = <
          item
            Name = 'DTINICIAL'
            DataType = ftDate
            Expression = 'dtinicial.date'
          end
          item
            Name = 'DTFINAL'
            DataType = ftDate
            Expression = 'dtfinal.date'
          end>
      end
      object QLANCMATERIAL2: TfrxDBXQuery
        UserName = 'QLANCMATERIAL2'
        CloseDataSource = True
        FieldAliases.Strings = (
          'QUANTIDADE=QUANTIDADE'
          'ITEM=ITEM'
          'DESCRICAO=DESCRICAO'
          'DATA_SAIDA=DATA_SAIDA')
        BCDToCurrency = False
        IgnoreDupParams = False
        Params = <
          item
            Name = 'ID_SAIDAESTOQUE'
            DataType = ftInteger
            Expression = '<QLANCMATERIAL."ID_SAIDAESTOQUE">'
          end>
        SQL.Strings = (
          'Select'
          'sum(se.QUANTIDADE) as QUANTIDADE,'
          'ES.item,'
          'ES.descricao,'
          'SE.DATA_SAIDA                            '
          ''
          ''
          ''
          'from saidaestoque SE'
          ''
          'Left join estoque ES on (se.id_item = es.id_item)'
          'Left join cadpaciente CP on (SE.id_paciente =CP.id_paciente)'
          ''
          
            'WHERE (SE.ID_SAIDAESTOQUE = :ID_SAIDAESTOQUE)                   ' +
            '            '
          ''
          ''
          
            'group by ES.item, ES.descricao,SE.DATA_SAIDA                    ' +
            '            '
          '/*LINHA 22*/  ')
        pLeft = 80
        pTop = 116
        Parameters = <
          item
            Name = 'ID_SAIDAESTOQUE'
            DataType = ftInteger
            Expression = '<QLANCMATERIAL."ID_SAIDAESTOQUE">'
          end>
      end
    end
    object Page1: TfrxReportPage
      Visible = False
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        Height = 136.063070240000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo34: TfrxMemoView
          Top = 15.118120000000000000
          Width = 226.771507090000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Relat'#243'rio Gerencial Mensal')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line10: TfrxLineView
          Left = 3.779530000000000000
          Top = 41.574803150000000000
          Width = 718.110236220000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Picture1: TfrxPictureView
          Align = baRight
          Left = 604.724873230000000000
          Width = 113.385826770000000000
          Height = 34.015748030000000000
          ShowHint = False
          Center = True
          DataField = 'LOGOTIPO'
          DataSetName = 'EMPRESA'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo35: TfrxMemoView
          Top = 41.574830000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8W = (
            'Per'#237'odo de: [dtinicial.date] a [dtfinal.date]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Top = 79.472480000000000000
          Width = 75.590226540000000000
          Height = 18.897637800000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8W = (
            'Ordenado por:')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 75.590600000000000000
          Top = 79.472480000000000000
          Width = 75.590226540000000000
          Height = 18.897637800000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Top = 60.031540000000000000
          Width = 75.590226540000000000
          Height = 18.897637800000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8W = (
            'Agrupado por:')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 75.590600000000000000
          Top = 60.031540000000000000
          Width = 75.590226540000000000
          Height = 18.897637800000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8W = (
            'Paciente')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 374.173470000000000000
          Top = 120.944960000000000000
          Width = 181.417288660000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataSet = frxReport.QLancMaterial
          DataSetName = 'QLANCMATERIAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data Sa'#237'da Material')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Top = 120.944960000000000000
          Width = 128.504020000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataSet = frxReport.QLancMaterial
          DataSetName = 'QLANCMATERIAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'C'#243'digo SUS.')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 136.063080000000000000
          Top = 120.944960000000000000
          Width = 234.330708660000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome Paciente')
          ParentFont = False
        end
        object Line11: TfrxLineView
          Top = 120.944960000000000000
          Width = 718.110236220000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo36: TfrxMemoView
          Align = baRight
          Left = 532.913730000000000000
          Top = 60.472480000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSetName = 'EMPRESA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Emitido em: [Date]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 15.118120000000000000
        Top = 260.787570000000000000
        Width = 718.110700000000000000
        DataSet = frxReport.QLancMaterial
        DataSetName = 'QLANCMATERIAL'
        RowCount = 0
        object Memo1: TfrxMemoView
          Width = 128.504020000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'CODIGO_SUS'
          DataSet = frxReport.QLancMaterial
          DataSetName = 'QLANCMATERIAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[QLANCMATERIAL."CODIGO_SUS"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 136.063080000000000000
          Width = 234.330860000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'NOME'
          DataSet = frxReport.QLancMaterial
          DataSetName = 'QLANCMATERIAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[QLANCMATERIAL."NOME"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 374.173470000000000000
          Width = 181.417440000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'DATA_SAIDA'
          DataSet = frxReport.QLancMaterial
          DataSetName = 'QLANCMATERIAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[QLANCMATERIAL."DATA_SAIDA"]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Top = 15.118120000000000000
          Width = 718.110236220000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 419.527830000000000000
        Width = 718.110700000000000000
        object Memo52: TfrxMemoView
          Align = baRight
          Left = 672.756369290000000000
          Top = 0.000002440000002935
          Width = 45.354330710000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]/[TotalPages#]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          Align = baLeft
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8W = (
            'Hightech System -  Gest'#227'o de Materiais')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          Align = baRight
          Left = 631.181539290000000000
          Top = 0.000002440000002935
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'g.:')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object Header1: TfrxHeader
        Height = 22.677165350000000000
        Top = 215.433210000000000000
        Width = 718.110700000000000000
        object Memo5: TfrxMemoView
          Left = 66.000000000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frxReport.QLancMaterial
          DataSetName = 'QLANCMATERIAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8W = (
            'Material')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 202.063080000000000000
          Width = 234.330708660000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frxReport.QLancMaterial
          DataSetName = 'QLANCMATERIAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8W = (
            'Descri'#231#227'o')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 563.149970000000000000
          Width = 120.944808660000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frxReport.QLancMaterial
          DataSetName = 'QLANCMATERIAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Quantidade')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Width = 718.110236220000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Line4: TfrxLineView
          Top = 18.897650000000000000
          Width = 718.110236220000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
      end
      object Footer1: TfrxFooter
        Height = 22.677180000000000000
        Top = 336.378170000000000000
        Width = 718.110700000000000000
      end
      object DetailData1: TfrxDetailData
        Height = 15.118120000000000000
        Top = 298.582870000000000000
        Width = 718.110700000000000000
        DataSet = frxReport.QLANCMATERIAL2
        DataSetName = 'QLANCMATERIAL2'
        RowCount = 0
        object Memo7: TfrxMemoView
          Left = 66.000000000000000000
          Width = 128.504020000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'ITEM'
          DataSet = frxReport.QLANCMATERIAL2
          DataSetName = 'QLANCMATERIAL2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8W = (
            '[QLANCMATERIAL2."ITEM"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 202.063080000000000000
          Width = 234.330860000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'DESCRICAO'
          DataSet = frxReport.QLANCMATERIAL2
          DataSetName = 'QLANCMATERIAL2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8W = (
            '[QLANCMATERIAL2."DESCRICAO"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 563.149970000000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'QUANTIDADE'
          DataSet = frxReport.QLANCMATERIAL2
          DataSetName = 'QLANCMATERIAL2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[QLANCMATERIAL2."QUANTIDADE"]')
          ParentFont = False
        end
        object Line8: TfrxLineView
          Top = 15.118120000000000000
          Width = 718.110236220000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
      end
    end
    object DialogPage1: TfrxDialogPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      BorderStyle = bsDialog
      Caption = 'Relat'#243'rio Gerencial Mensal'
      Height = 204.000000000000000000
      ClientHeight = 166.000000000000000000
      Left = 454.000000000000000000
      Top = 151.000000000000000000
      Width = 476.000000000000000000
      ClientWidth = 460.000000000000000000
      object GroupBox1: TfrxGroupBoxControl
        Left = 308.000000000000000000
        Top = 4.000000000000000000
        Width = 97.000000000000000000
        Height = 55.000000000000000000
        ShowHint = True
        Caption = 'Ordenado por:'
        Color = clBtnFace
        object cbcod: TfrxRadioButtonControl
          Left = 8.000000000000000000
          Top = 13.000000000000000000
          Width = 75.000000000000000000
          Height = 17.000000000000000000
          ShowHint = True
          Caption = 'Data Sa'#237'da'
          TabStop = False
          Color = clBtnFace
        end
        object cbMat: TfrxRadioButtonControl
          Left = 8.000000000000000000
          Top = 32.000000000000000000
          Width = 75.000000000000000000
          Height = 17.000000000000000000
          ShowHint = True
          Caption = 'Material'
          Checked = True
          Color = clBtnFace
        end
      end
      object btOK: TfrxButtonControl
        Left = 303.000000000000000000
        Top = 123.000000000000000000
        Width = 75.000000000000000000
        Height = 25.000000000000000000
        ShowHint = True
        Caption = 'OK'
        ModalResult = 1
        OnClick = 'btOKOnClick'
      end
      object btCancelar: TfrxButtonControl
        Left = 387.000000000000000000
        Top = 123.000000000000000000
        Width = 75.000000000000000000
        Height = 25.000000000000000000
        ShowHint = True
        Caption = 'Cancelar'
        ModalResult = 2
        OnClick = 'btCancelarOnClick'
      end
      object GroupBox2: TfrxGroupBoxControl
        Left = 16.000000000000000000
        Top = 4.000000000000000000
        Width = 280.000000000000000000
        Height = 55.000000000000000000
        ShowHint = True
        Caption = 'Agrupamento'
        Color = clBtnFace
        object cbagrupa: TfrxComboBoxControl
          Left = 134.000000000000000000
          Top = 21.000000000000000000
          Width = 80.000000000000000000
          Height = 21.000000000000000000
          ShowHint = True
          Color = clWindow
          Items.Strings = (
            'Paciente'
            'Material')
          Style = csOwnerDrawFixed
          Text = 'Paciente'
          ItemIndex = 0
        end
        object Label3: TfrxLabelControl
          Left = 62.000000000000000000
          Top = 24.000000000000000000
          Width = 70.000000000000000000
          Height = 13.000000000000000000
          ShowHint = True
          Alignment = taRightJustify
          Caption = 'Agrupado por:'
          Color = clBtnFace
        end
      end
      object GroupBox3: TfrxGroupBoxControl
        Left = 20.000000000000000000
        Top = 68.000000000000000000
        Width = 280.000000000000000000
        Height = 81.000000000000000000
        ShowHint = True
        Caption = 'Periodo'
        Color = clBtnFace
        object DTINICIAL: TfrxDateEditControl
          Left = 29.000000000000000000
          Top = 32.000000000000000000
          Width = 95.000000000000000000
          Height = 21.000000000000000000
          ShowHint = True
          Color = clWindow
          Date = 41424.676576099490000000
          Time = 41424.676576099490000000
          WeekNumbers = False
        end
        object DTFINAL: TfrxDateEditControl
          Left = 153.000000000000000000
          Top = 32.000000000000000000
          Width = 95.000000000000000000
          Height = 21.000000000000000000
          ShowHint = True
          Color = clWindow
          Date = 41424.676576099490000000
          Time = 41424.676576099490000000
          WeekNumbers = False
        end
        object Label1: TfrxLabelControl
          Left = 9.000000000000000000
          Top = 36.000000000000000000
          Width = 17.000000000000000000
          Height = 13.000000000000000000
          ShowHint = True
          Alignment = taRightJustify
          Caption = 'De:'
          Color = clBtnFace
        end
        object Label2: TfrxLabelControl
          Left = 141.000000000000000000
          Top = 36.000000000000000000
          Width = 10.000000000000000000
          Height = 13.000000000000000000
          ShowHint = True
          Alignment = taRightJustify
          Caption = #224':'
          Color = clBtnFace
        end
      end
    end
    object Page2: TfrxReportPage
      Visible = False
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader2: TfrxPageHeader
        Height = 136.062992130000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo14: TfrxMemoView
          Top = 15.118120000000000000
          Width = 226.771507090000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Relat'#243'rio Gerencial Mensal')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line3: TfrxLineView
          Left = 3.779530000000000000
          Top = 41.574803150000000000
          Width = 718.110236220000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Picture2: TfrxPictureView
          Align = baRight
          Left = 604.724873230000000000
          Width = 113.385826770000000000
          Height = 34.015748030000000000
          ShowHint = False
          Center = True
          DataField = 'LOGOTIPO'
          DataSetName = 'EMPRESA'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo15: TfrxMemoView
          Top = 41.574830000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8W = (
            'Per'#237'odo de: [dtinicial.date] a [dtfinal.date]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Top = 79.370078740000000000
          Width = 75.590226540000000000
          Height = 18.897637800000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8W = (
            'Ordenado por:')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 75.590600000000000000
          Top = 79.370078740000000000
          Width = 75.590226540000000000
          Height = 18.897637800000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Top = 60.472480000000000000
          Width = 75.590226540000000000
          Height = 18.897637800000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8W = (
            'Agrupado por:')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 75.590600000000000000
          Top = 60.472480000000000000
          Width = 75.590226540000000000
          Height = 18.897637800000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8W = (
            'Material')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Top = 120.944960000000000000
          Width = 128.504020000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataSet = frxReport.QLancMaterial
          DataSetName = 'QLANCMATERIAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Material')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 136.063080000000000000
          Top = 120.944960000000000000
          Width = 400.629921260000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataSet = frxReport.QLancMaterial
          DataSetName = 'QLANCMATERIAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Descri'#231#227'o')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 546.149970000000000000
          Top = 120.944960000000000000
          Width = 120.944808660000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataSet = frxReport.QLancMaterial
          DataSetName = 'QLANCMATERIAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Quantidade')
          ParentFont = False
        end
        object Line5: TfrxLineView
          Top = 120.944960000000000000
          Width = 718.110236220000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Line6: TfrxLineView
          Top = 136.063080000000000000
          Width = 718.110236220000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo31: TfrxMemoView
          Align = baRight
          Left = 532.913730000000000000
          Top = 60.472480000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSetName = 'EMPRESA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Emitido em: [Date]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object PageFooter2: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 291.023810000000000000
        Width = 718.110700000000000000
        object Memo18: TfrxMemoView
          Align = baRight
          Left = 672.756369290000000000
          Top = 0.000002440000002935
          Width = 45.354330710000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]/[TotalPages#]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Align = baLeft
          Width = 226.771653540000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8W = (
            'Hightech System -  Gest'#227'o de Materiais')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Align = baRight
          Left = 631.181539289999900000
          Top = 0.000002440000002935
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'g.:')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object MasterData3: TfrxMasterData
        Height = 15.118120000000000000
        Top = 215.433210000000000000
        Width = 718.110700000000000000
        DataSet = frxReport.QLancTotal
        DataSetName = 'QLancTotal'
        RowCount = 0
        object Memo25: TfrxMemoView
          Width = 128.504020000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'ITEM'
          DataSet = frxReport.QLancTotal
          DataSetName = 'QLancTotal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8W = (
            '[QLancTotal."ITEM"]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 136.063080000000000000
          Width = 400.630180000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'DESCRICAO'
          DataSet = frxReport.QLancTotal
          DataSetName = 'QLancTotal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8W = (
            '[QLancTotal."DESCRICAO"]')
          ParentFont = False
        end
        object Line7: TfrxLineView
          Top = 15.118120000000010000
          Width = 718.110236220000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo27: TfrxMemoView
          Left = 546.141732280000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          ShowHint = False
          DataField = 'QUANTIDADE'
          DataSet = frxReport.QLancTotal
          DataSetName = 'QLancTotal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[QLancTotal."QUANTIDADE"]')
          ParentFont = False
        end
      end
    end
  end
  object SQLConnection1: TSQLConnection
    ConnectionName = 'IBConnection'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver170.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=17.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver170.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=17.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      
        'Database=LOCALHOST:D:\Projetos K2\Projetos Delphi\Projetos Hight' +
        'ech\branches\Saida de Estoque\dados\SAIDAESTOQUE25.GDB'
      'User_Name=sysdba'
      'Password=htsys'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'SQLDialect=3'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'TrimChar=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'RoleName=RoleName'
      'ServerCharSet='
      'Trim Char=False')
    Connected = True
    Left = 392
    Top = 32
  end
  object frxDBXComponents1: TfrxDBXComponents
    DefaultDatabase = SQLConnection1
    Left = 392
    Top = 80
  end
  object frxDialogControls1: TfrxDialogControls
    Left = 480
    Top = 80
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    Left = 392
    Top = 128
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PictureType = gpPNG
    Wysiwyg = True
    Creator = 'FastReport'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    AutoSize = False
    Left = 424
    Top = 128
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ExportEMF = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 456
    Top = 128
  end
end
