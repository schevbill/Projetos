object Module: TModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 266
  Width = 508
  object IBLOJAHS: TIBDatabase
    DatabaseName = 'D:\BASE_DESENVOLVIMENTO\LOJAHS.GDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=htsys')
    LoginPrompt = False
    DefaultTransaction = IBTransaction
    ServerType = 'IBServer'
    Left = 24
    Top = 8
  end
  object IBTransaction: TIBTransaction
    DefaultDatabase = IBLOJAHS
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 88
    Top = 8
  end
  object qryUF: TIBQuery
    Database = IBLOJAHS
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from UF')
    Left = 24
    Top = 56
    object qryUFID_UF: TIntegerField
      FieldName = 'ID_UF'
      Origin = '"UF"."ID_UF"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryUFESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = '"UF"."ESTADO"'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryUFCODIGO_IBGE: TIntegerField
      FieldName = 'CODIGO_IBGE'
      Origin = '"UF"."CODIGO_IBGE"'
    end
  end
  object dtsUF: TDataSource
    DataSet = qryUF
    Left = 24
    Top = 104
  end
  object qryCidade: TIBQuery
    Database = IBLOJAHS
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from Cidade')
    Left = 64
    Top = 56
    object qryCidadeID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
      Origin = '"CIDADE"."ID_CIDADE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCidadeDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"CIDADE"."DESCRICAO"'
      Required = True
      Size = 30
    end
    object qryCidadeCODIGO_IBGE: TIntegerField
      FieldName = 'CODIGO_IBGE'
      Origin = '"CIDADE"."CODIGO_IBGE"'
      Required = True
    end
    object qryCidadeID_UF: TIntegerField
      FieldName = 'ID_UF'
      Origin = '"CIDADE"."ID_UF"'
      Required = True
    end
  end
  object dtsCidade: TDataSource
    DataSet = qryCidade
    Left = 64
    Top = 104
  end
end
