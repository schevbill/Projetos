object FRM_MSP: TFRM_MSP
  Left = 226
  Top = 161
  Width = 672
  Height = 257
  Caption = 'MSP...'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object MNM_Lista: TMemo
    Left = 0
    Top = 0
    Width = 656
    Height = 200
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 200
    Width = 656
    Height = 19
    Panels = <>
    SimplePanel = False
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
    Left = 600
    Top = 29
  end
  object DataBaseIB: TIBDatabase
    DatabaseName = '192.168.1.3:M:\db\Cardapio\ARCOIRIS.GDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=sysdbambd')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    AllowStreamedConnected = False
    Left = 628
    Top = 29
  end
  object PPP_Principal: TPopupMenu
    Left = 628
    Top = 1
    object Sair1: TMenuItem
      Caption = 'Sair'
    end
  end
  object TRM_ProcessarPedido: TTimer
    OnTimer = TRM_ProcessarPedidoTimer
    Left = 1
    Top = 1
  end
  object IBQ_Funcionario: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select *'
      'from funcionario')
    Left = 571
    Top = 60
    object IBQ_FuncionarioCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'FUNCIONARIO.CODIGO_ID'
      Required = True
    end
    object IBQ_FuncionarioDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'FUNCIONARIO.DESCRICAO'
      Size = 60
    end
    object IBQ_FuncionarioPONTOVENDA: TIntegerField
      FieldName = 'PONTOVENDA'
      Origin = 'FUNCIONARIO.PONTOVENDA'
    end
    object IBQ_FuncionarioDT_NASCTO: TDateField
      FieldName = 'DT_NASCTO'
      Origin = 'FUNCIONARIO.DT_NASCTO'
    end
    object IBQ_FuncionarioENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = 'FUNCIONARIO.ENDERECO'
      Size = 60
    end
    object IBQ_FuncionarioBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = 'FUNCIONARIO.BAIRRO'
      Size = 30
    end
    object IBQ_FuncionarioCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = 'FUNCIONARIO.CIDADE'
      Size = 30
    end
    object IBQ_FuncionarioTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Origin = 'FUNCIONARIO.TELEFONE'
      Size = 15
    end
    object IBQ_FuncionarioATIVO: TIBStringField
      FieldName = 'ATIVO'
      Origin = 'FUNCIONARIO.ATIVO'
      Required = True
      Size = 1
    end
    object IBQ_FuncionarioADMISSAO: TDateField
      FieldName = 'ADMISSAO'
      Origin = 'FUNCIONARIO.ADMISSAO'
    end
    object IBQ_FuncionarioDEMISSAO: TDateField
      FieldName = 'DEMISSAO'
      Origin = 'FUNCIONARIO.DEMISSAO'
    end
    object IBQ_Funcionarioturno: TIntegerField
      FieldName = 'turno'
      Origin = 'FUNCIONARIO.turno'
    end
    object IBQ_FuncionarioCARGO: TIntegerField
      FieldName = 'CARGO'
      Origin = 'FUNCIONARIO.CARGO'
    end
    object IBQ_FuncionarioSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'FUNCIONARIO.STATUS'
      Size = 1
    end
    object IBQ_FuncionarioOBSERVACAO: TBlobField
      FieldName = 'OBSERVACAO'
      Origin = 'FUNCIONARIO.OBSERVACAO'
      Size = 8
    end
    object IBQ_FuncionarioMOVEL: TIBStringField
      FieldName = 'MOVEL'
      Origin = 'FUNCIONARIO.MOVEL'
      Size = 1
    end
    object IBQ_FuncionarioCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
      Origin = 'FUNCIONARIO.COMISSAO'
    end
    object IBQ_FuncionarioRG: TIBStringField
      FieldName = 'RG'
      Origin = 'FUNCIONARIO.RG'
      Size = 30
    end
    object IBQ_FuncionarioCPF: TIBStringField
      FieldName = 'CPF'
      Origin = 'FUNCIONARIO.CPF'
      Size = 30
    end
    object IBQ_FuncionarioDT_ATESTADO: TDateField
      FieldName = 'DT_ATESTADO'
      Origin = 'FUNCIONARIO.DT_ATESTADO'
    end
  end
  object DTS_Funcionario: TDataSource
    DataSet = IBQ_Funcionario
    Left = 599
    Top = 60
  end
  object IBQ_FunFicha: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DTS_Funcionario
    SQL.Strings = (
      'select *'
      'from ficha'
      'where (operador = :CODIGO_ID)')
    Left = 627
    Top = 60
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODIGO_ID'
        ParamType = ptUnknown
      end>
    object IBQ_FunFichaCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'FICHA.CODIGO_ID'
      Required = True
    end
    object IBQ_FunFichaFICHA: TIntegerField
      FieldName = 'FICHA'
      Origin = 'FICHA.FICHA'
    end
    object IBQ_FunFichaSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'FICHA.SEQUENCIA'
    end
    object IBQ_FunFichaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'FICHA.STATUS'
      Size = 1
    end
    object IBQ_FunFichaATIVO: TIBStringField
      FieldName = 'ATIVO'
      Origin = 'FICHA.ATIVO'
      Required = True
      Size = 1
    end
    object IBQ_FunFichaCONSULTA: TIBStringField
      FieldName = 'CONSULTA'
      Origin = 'FICHA.CONSULTA'
      Required = True
      Size = 1
    end
    object IBQ_FunFichaTRAVA: TIBStringField
      FieldName = 'TRAVA'
      Origin = 'FICHA.TRAVA'
      Required = True
      Size = 1
    end
    object IBQ_FunFichaDIGITO: TSmallintField
      FieldName = 'DIGITO'
      Origin = 'FICHA.DIGITO'
    end
    object IBQ_FunFichaTP_FICHA: TIBStringField
      FieldName = 'TP_FICHA'
      Origin = 'FICHA.TP_FICHA'
      Size = 1
    end
    object IBQ_FunFichaOPERADOR: TIntegerField
      FieldName = 'OPERADOR'
      Origin = 'FICHA.OPERADOR'
    end
    object IBQ_FunFichaPRODUCAO: TIBStringField
      FieldName = 'PRODUCAO'
      Origin = 'FICHA.PRODUCAO'
      Required = True
      Size = 1
    end
    object IBQ_FunFichaQUARTO: TIBStringField
      FieldName = 'QUARTO'
      Origin = 'FICHA.QUARTO'
      Size = 1
    end
    object IBQ_FunFichaTAXA: TIBStringField
      FieldName = 'TAXA'
      Origin = 'FICHA.TAXA'
      Size = 1
    end
    object IBQ_FunFichaMOVEL: TIBStringField
      FieldName = 'MOVEL'
      Origin = 'FICHA.MOVEL'
      Size = 1
    end
    object IBQ_FunFichaFINALIZADA: TIBStringField
      FieldName = 'FINALIZADA'
      Origin = 'FICHA.FINALIZADA'
      Size = 1
    end
    object IBQ_FunFichaXFICHA: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'XFICHA'
      Origin = 'FICHA.XFICHA'
      ReadOnly = True
      Size = 5
    end
    object IBQ_FunFichaIDFICHA: TIBStringField
      FieldName = 'IDFICHA'
      Origin = 'FICHA.IDFICHA'
      Size = 255
    end
    object IBQ_FunFichaGARCOM: TIntegerField
      FieldName = 'GARCOM'
      Origin = 'FICHA.GARCOM'
    end
    object IBQ_FunFichaFECHANDO: TIBStringField
      FieldName = 'FECHANDO'
      Origin = 'FICHA.FECHANDO'
      Size = 1
    end
  end
  object IBQ_Sequencia: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select gen_id(GEN_SEQUENCIA_PK,1) as XCod_ID'
      'from rdb$database')
    Left = 540
    Top = 60
    object IBQ_SequenciaXCOD_ID: TLargeintField
      FieldName = 'XCOD_ID'
      Required = True
    end
  end
  object IBQ_Gravar: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 552
  end
  object IBQ_Produtos: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from PRODUTOS')
    Left = 571
    Top = 89
    object IBQ_ProdutosCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'PRODUTOS.CODIGO_ID'
      Required = True
    end
    object IBQ_ProdutosPRODUTO: TIBStringField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTOS.PRODUTO'
      Size = 13
    end
    object IBQ_ProdutosDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'PRODUTOS.DESCRICAO'
      Size = 50
    end
    object IBQ_ProdutosPRECO: TFloatField
      FieldName = 'PRECO'
      Origin = 'PRODUTOS.PRECO'
    end
    object IBQ_ProdutosPRECOCUSTO: TFloatField
      FieldName = 'PRECOCUSTO'
      Origin = 'PRODUTOS.PRECOCUSTO'
    end
    object IBQ_ProdutosGRUPO: TIntegerField
      FieldName = 'GRUPO'
      Origin = 'PRODUTOS.GRUPO'
    end
    object IBQ_ProdutosICMS_SN: TIBStringField
      FieldName = 'ICMS_SN'
      Origin = 'PRODUTOS.ICMS_SN'
      Required = True
      Size = 1
    end
    object IBQ_ProdutosTRIBUTAR: TIntegerField
      FieldName = 'TRIBUTAR'
      Origin = 'PRODUTOS.TRIBUTAR'
    end
    object IBQ_ProdutosBALANCA: TIBStringField
      FieldName = 'BALANCA'
      Origin = 'PRODUTOS.BALANCA'
      Required = True
      Size = 1
    end
    object IBQ_ProdutosTARA: TFloatField
      FieldName = 'TARA'
      Origin = 'PRODUTOS.TARA'
    end
    object IBQ_ProdutosUNIDADE: TIntegerField
      FieldName = 'UNIDADE'
      Origin = 'PRODUTOS.UNIDADE'
    end
    object IBQ_ProdutosATIVO: TIBStringField
      FieldName = 'ATIVO'
      Origin = 'PRODUTOS.ATIVO'
      Required = True
      Size = 1
    end
    object IBQ_ProdutosCOMANDA: TIBStringField
      FieldName = 'COMANDA'
      Origin = 'PRODUTOS.COMANDA'
      Required = True
      Size = 1
    end
    object IBQ_ProdutosLOCAL_IMP: TIntegerField
      FieldName = 'LOCAL_IMP'
      Origin = 'PRODUTOS.LOCAL_IMP'
    end
    object IBQ_ProdutosDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      Origin = 'PRODUTOS.DESCONTO'
    end
    object IBQ_ProdutosACRESCIMO: TFloatField
      FieldName = 'ACRESCIMO'
      Origin = 'PRODUTOS.ACRESCIMO'
    end
    object IBQ_ProdutosPROD_MTN: TIntegerField
      FieldName = 'PROD_MTN'
      Origin = 'PRODUTOS.PROD_MTN'
    end
    object IBQ_ProdutosESTOQUE: TIBStringField
      FieldName = 'ESTOQUE'
      Origin = 'PRODUTOS.ESTOQUE'
      Size = 1
    end
    object IBQ_ProdutosESTNEGATIVO: TIBStringField
      FieldName = 'ESTNEGATIVO'
      Origin = 'PRODUTOS.ESTNEGATIVO'
      Size = 1
    end
    object IBQ_ProdutosESTOQUE_FISICO: TFloatField
      FieldName = 'ESTOQUE_FISICO'
      Origin = 'PRODUTOS.ESTOQUE_FISICO'
    end
    object IBQ_ProdutosESTOQUE_VIRTUAL: TFloatField
      FieldName = 'ESTOQUE_VIRTUAL'
      Origin = 'PRODUTOS.ESTOQUE_VIRTUAL'
    end
    object IBQ_ProdutosESTOQUEMIN: TFloatField
      FieldName = 'ESTOQUEMIN'
      Origin = 'PRODUTOS.ESTOQUEMIN'
    end
    object IBQ_ProdutosESTOQUEMAX: TFloatField
      FieldName = 'ESTOQUEMAX'
      Origin = 'PRODUTOS.ESTOQUEMAX'
    end
    object IBQ_ProdutosTEMPO: TIBStringField
      FieldName = 'TEMPO'
      Origin = 'PRODUTOS.TEMPO'
      Required = True
      Size = 5
    end
    object IBQ_ProdutosDIA_PROD: TIBStringField
      FieldName = 'DIA_PROD'
      Origin = 'PRODUTOS.DIA_PROD'
      Required = True
      Size = 1
    end
    object IBQ_ProdutosIMP_PERS: TIBStringField
      FieldName = 'IMP_PERS'
      Origin = 'PRODUTOS.IMP_PERS'
      Required = True
      Size = 1
    end
    object IBQ_ProdutosVALSALDOENT: TFloatField
      FieldName = 'VALSALDOENT'
      Origin = 'PRODUTOS.VALSALDOENT'
    end
    object IBQ_ProdutosQTDSALDOENT: TFloatField
      FieldName = 'QTDSALDOENT'
      Origin = 'PRODUTOS.QTDSALDOENT'
    end
    object IBQ_ProdutosTAXA: TFloatField
      FieldName = 'TAXA'
      Origin = 'PRODUTOS.TAXA'
    end
    object IBQ_ProdutosTAXA_SN: TIBStringField
      FieldName = 'TAXA_SN'
      Origin = 'PRODUTOS.TAXA_SN'
      Size = 1
    end
    object IBQ_ProdutosLUCRO: TFloatField
      FieldName = 'LUCRO'
      Origin = 'PRODUTOS.LUCRO'
    end
    object IBQ_ProdutosMOVEL: TIBStringField
      FieldName = 'MOVEL'
      Origin = 'PRODUTOS.MOVEL'
      Size = 1
    end
    object IBQ_ProdutosPIS: TFloatField
      FieldName = 'PIS'
      Origin = 'PRODUTOS.PIS'
    end
    object IBQ_ProdutosREDUCAOICMS: TFloatField
      FieldName = 'REDUCAOICMS'
      Origin = 'PRODUTOS.REDUCAOICMS'
    end
    object IBQ_ProdutosCOFINS: TFloatField
      FieldName = 'COFINS'
      Origin = 'PRODUTOS.COFINS'
    end
    object IBQ_ProdutosICMS: TFloatField
      FieldName = 'ICMS'
      Origin = 'PRODUTOS.ICMS'
    end
    object IBQ_ProdutosTRIBUTAR_ANTIGO: TIntegerField
      FieldName = 'TRIBUTAR_ANTIGO'
      Origin = 'PRODUTOS.TRIBUTAR_ANTIGO'
    end
    object IBQ_ProdutosTRIBUTAR_FORA_ANTIGO: TIntegerField
      FieldName = 'TRIBUTAR_FORA_ANTIGO'
      Origin = 'PRODUTOS.TRIBUTAR_FORA_ANTIGO'
    end
    object IBQ_ProdutosPRECO_AGREGADO: TFloatField
      FieldName = 'PRECO_AGREGADO'
      Origin = 'PRODUTOS.PRECO_AGREGADO'
    end
    object IBQ_ProdutosTRIBUTAR_FORA: TIntegerField
      FieldName = 'TRIBUTAR_FORA'
      Origin = 'PRODUTOS.TRIBUTAR_FORA'
    end
    object IBQ_ProdutosCST: TIntegerField
      FieldName = 'CST'
      Origin = 'PRODUTOS.CST'
    end
    object IBQ_ProdutosCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
      Origin = 'PRODUTOS.COMISSAO'
    end
    object IBQ_ProdutosCOMISPRSN: TIBStringField
      FieldName = 'COMISPRSN'
      Origin = 'PRODUTOS.COMISPRSN'
      Size = 1
    end
    object IBQ_ProdutosITEMDATASUL: TIBStringField
      FieldName = 'ITEMDATASUL'
      Origin = 'PRODUTOS.ITEMDATASUL'
      Size = 16
    end
    object IBQ_ProdutosCLASSFISC_DATASUL: TIBStringField
      FieldName = 'CLASSFISC_DATASUL'
      Origin = 'PRODUTOS.CLASSFISC_DATASUL'
      Size = 12
    end
    object IBQ_ProdutosNATOPERACAO_DATASUL: TIBStringField
      FieldName = 'NATOPERACAO_DATASUL'
      Origin = 'PRODUTOS.NATOPERACAO_DATASUL'
      Size = 8
    end
    object IBQ_ProdutosUNITEM_DATASUL: TIBStringField
      FieldName = 'UNITEM_DATASUL'
      Origin = 'PRODUTOS.UNITEM_DATASUL'
      Size = 2
    end
    object IBQ_ProdutosUNFAMI_DATASUL: TIBStringField
      FieldName = 'UNFAMI_DATASUL'
      Origin = 'PRODUTOS.UNFAMI_DATASUL'
      Size = 2
    end
    object IBQ_ProdutosCODTRIB_DATASUL: TIBStringField
      FieldName = 'CODTRIB_DATASUL'
      Origin = 'PRODUTOS.CODTRIB_DATASUL'
      Size = 2
    end
    object IBQ_ProdutosPERREDUCAOICMS_DATASUL: TIBStringField
      FieldName = 'PERREDUCAOICMS_DATASUL'
      Origin = 'PRODUTOS.PERREDUCAOICMS_DATASUL'
      Size = 7
    end
    object IBQ_ProdutosNIVEL_ISENTO: TIntegerField
      FieldName = 'NIVEL_ISENTO'
      Origin = 'PRODUTOS.NIVEL_ISENTO'
    end
    object IBQ_ProdutosOBSFRENTE: TIBStringField
      FieldName = 'OBSFRENTE'
      Origin = 'PRODUTOS.OBSFRENTE'
      Required = True
      Size = 1
    end
    object IBQ_ProdutosNCM: TIBStringField
      FieldName = 'NCM'
      Origin = 'PRODUTOS.NCM'
      Size = 8
    end
    object IBQ_ProdutosBXCARTELA: TIBStringField
      FieldName = 'BXCARTELA'
      Origin = 'PRODUTOS.BXCARTELA'
      Size = 1
    end
    object IBQ_ProdutosMONTAR: TIBStringField
      FieldName = 'MONTAR'
      Origin = 'PRODUTOS.MONTAR'
      Size = 1
    end
    object IBQ_ProdutosTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = 'PRODUTOS.TIPO'
      Size = 1
    end
    object IBQ_ProdutosESTLISTA_SN: TIBStringField
      FieldName = 'ESTLISTA_SN'
      Origin = 'PRODUTOS.ESTLISTA_SN'
      Size = 1
    end
    object IBQ_ProdutosST_ICMSE: TIntegerField
      FieldName = 'ST_ICMSE'
      Origin = 'PRODUTOS.ST_ICMSE'
    end
    object IBQ_ProdutosST_ICMSS: TIntegerField
      FieldName = 'ST_ICMSS'
      Origin = 'PRODUTOS.ST_ICMSS'
    end
    object IBQ_ProdutosST_IPI: TIntegerField
      FieldName = 'ST_IPI'
      Origin = 'PRODUTOS.ST_IPI'
    end
    object IBQ_ProdutosST_PIS: TIntegerField
      FieldName = 'ST_PIS'
      Origin = 'PRODUTOS.ST_PIS'
    end
    object IBQ_ProdutosST_COFINS: TIntegerField
      FieldName = 'ST_COFINS'
      Origin = 'PRODUTOS.ST_COFINS'
    end
    object IBQ_ProdutosICMSS: TFloatField
      FieldName = 'ICMSS'
      Origin = 'PRODUTOS.ICMSS'
    end
    object IBQ_ProdutosREDS: TFloatField
      FieldName = 'REDS'
      Origin = 'PRODUTOS.REDS'
    end
    object IBQ_ProdutosIPI: TFloatField
      FieldName = 'IPI'
      Origin = 'PRODUTOS.IPI'
    end
    object IBQ_ProdutosCODSERVICO: TIBStringField
      FieldName = 'CODSERVICO'
      Origin = 'PRODUTOS.CODSERVICO'
    end
    object IBQ_ProdutosISSQN: TFloatField
      FieldName = 'ISSQN'
      Origin = 'PRODUTOS.ISSQN'
    end
    object IBQ_ProdutosCF: TIBStringField
      FieldName = 'CF'
      Origin = 'PRODUTOS.CF'
    end
    object IBQ_ProdutosEXTIPI: TIBStringField
      FieldName = 'EXTIPI'
      Origin = 'PRODUTOS.EXTIPI'
      Size = 5
    end
    object IBQ_ProdutosMODALIDADEBC: TIBStringField
      FieldName = 'MODALIDADEBC'
      Origin = 'PRODUTOS.MODALIDADEBC'
      Size = 1
    end
  end
  object DTS_Produtos: TDataSource
    DataSet = IBQ_Produtos
    Left = 599
    Top = 89
  end
  object IBT_Aliquota: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    IndexFieldNames = 'CODIGO_ID'
    MasterFields = 'TRIBUTAR'
    MasterSource = DTS_Produtos
    TableName = 'TRIBUTAR'
    Left = 627
    Top = 89
    object IBT_AliquotaCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
    end
    object IBT_AliquotaCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Size = 5
    end
    object IBT_AliquotaDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object IBT_AliquotaALIQUOTA: TFloatField
      FieldName = 'ALIQUOTA'
    end
    object IBT_AliquotaSITUACAO: TIBStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object IBT_AliquotaSSITUACAO: TIBStringField
      FieldName = 'SSITUACAO'
      Size = 1
    end
    object IBT_AliquotaALIQUO: TIBStringField
      FieldName = 'ALIQUO'
      Size = 4
    end
  end
  object IBQ_FormaPagto: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from FORMAPAGTO')
    Left = 571
    Top = 118
    object IBQ_FormaPagtoCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'FORMAPAGTO.CODIGO_ID'
      Required = True
    end
    object IBQ_FormaPagtoDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      Origin = 'FORMAPAGTO.DESCONTO'
    end
    object IBQ_FormaPagtoTIPOPAGTO: TIntegerField
      FieldName = 'TIPOPAGTO'
      Origin = 'FORMAPAGTO.TIPOPAGTO'
    end
    object IBQ_FormaPagtoMULTFORM: TIBStringField
      FieldName = 'MULTFORM'
      Origin = 'FORMAPAGTO.MULTFORM'
      FixedChar = True
      Size = 1
    end
    object IBQ_FormaPagtoTEF: TIBStringField
      FieldName = 'TEF'
      Origin = 'FORMAPAGTO.TEF'
      Size = 1
    end
    object IBQ_FormaPagtoTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = 'FORMAPAGTO.TIPO'
      Size = 1
    end
    object IBQ_FormaPagtoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'FORMAPAGTO.DESCRICAO'
      Required = True
      Size = 60
    end
    object IBQ_FormaPagtoDIAS: TIntegerField
      FieldName = 'DIAS'
      Origin = 'FORMAPAGTO.DIAS'
    end
    object IBQ_FormaPagtoQTDTICKET: TIntegerField
      FieldName = 'QTDTICKET'
      Origin = 'FORMAPAGTO.QTDTICKET'
    end
    object IBQ_FormaPagtoATIVO: TIBStringField
      FieldName = 'ATIVO'
      Origin = 'FORMAPAGTO.ATIVO'
      Size = 1
    end
    object IBQ_FormaPagtoACRESCIMO: TFloatField
      FieldName = 'ACRESCIMO'
      Origin = 'FORMAPAGTO.ACRESCIMO'
    end
    object IBQ_FormaPagtoCORTESIA: TIBStringField
      FieldName = 'CORTESIA'
      Origin = 'FORMAPAGTO.CORTESIA'
      Size = 1
    end
    object IBQ_FormaPagtoDOCVINC: TIBStringField
      FieldName = 'DOCVINC'
      Origin = 'FORMAPAGTO.DOCVINC'
      Size = 1
    end
  end
  object DTS_FormaPagto: TDataSource
    DataSet = IBQ_FormaPagto
    Left = 599
    Top = 118
  end
  object IBQ_ProEst: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from PRODUTOS')
    Left = 32
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
    Left = 32
    Top = 28
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
    Left = 32
    Top = 58
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
  object IBQ_MovEstoque: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from MOVTOSTQ')
    Left = 60
  end
  object DTQ_MovEstoque: TDataSource
    DataSet = IBQ_MovEstoque
    Left = 60
    Top = 28
  end
  object IBT_MovEstoque: TIBTable
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
    Left = 88
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
    Left = 88
    Top = 28
  end
  object IBQ_EstGravar: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from MOVTOSTQ')
    Left = 115
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
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from MOVTOSTQ')
    Left = 115
    Top = 28
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
  object IBQ_GravaProd: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select *   from PRODUTOS')
    Left = 143
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
    Left = 143
    Top = 28
  end
  object IBQ_Ficha: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from FICHA')
    Left = 508
    Top = 60
    object IBQ_FichaCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'FICHA.CODIGO_ID'
      Required = True
    end
    object IBQ_FichaFICHA: TIntegerField
      FieldName = 'FICHA'
      Origin = 'FICHA.FICHA'
    end
    object IBQ_FichaSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'FICHA.SEQUENCIA'
    end
    object IBQ_FichaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'FICHA.STATUS'
      Size = 1
    end
    object IBQ_FichaATIVO: TIBStringField
      FieldName = 'ATIVO'
      Origin = 'FICHA.ATIVO'
      Required = True
      Size = 1
    end
    object IBQ_FichaCONSULTA: TIBStringField
      FieldName = 'CONSULTA'
      Origin = 'FICHA.CONSULTA'
      Required = True
      Size = 1
    end
    object IBQ_FichaTRAVA: TIBStringField
      FieldName = 'TRAVA'
      Origin = 'FICHA.TRAVA'
      Required = True
      Size = 1
    end
    object IBQ_FichaDIGITO: TSmallintField
      FieldName = 'DIGITO'
      Origin = 'FICHA.DIGITO'
    end
    object IBQ_FichaTP_FICHA: TIBStringField
      FieldName = 'TP_FICHA'
      Origin = 'FICHA.TP_FICHA'
      Size = 1
    end
    object IBQ_FichaOPERADOR: TIntegerField
      FieldName = 'OPERADOR'
      Origin = 'FICHA.OPERADOR'
    end
    object IBQ_FichaPRODUCAO: TIBStringField
      FieldName = 'PRODUCAO'
      Origin = 'FICHA.PRODUCAO'
      Required = True
      Size = 1
    end
    object IBQ_FichaQUARTO: TIBStringField
      FieldName = 'QUARTO'
      Origin = 'FICHA.QUARTO'
      Size = 1
    end
    object IBQ_FichaTAXA: TIBStringField
      FieldName = 'TAXA'
      Origin = 'FICHA.TAXA'
      Size = 1
    end
    object IBQ_FichaMOVEL: TIBStringField
      FieldName = 'MOVEL'
      Origin = 'FICHA.MOVEL'
      Size = 1
    end
    object IBQ_FichaFINALIZADA: TIBStringField
      FieldName = 'FINALIZADA'
      Origin = 'FICHA.FINALIZADA'
      Size = 1
    end
    object IBQ_FichaXFICHA: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'XFICHA'
      Origin = 'FICHA.XFICHA'
      ReadOnly = True
      Size = 5
    end
    object IBQ_FichaIDFICHA: TIBStringField
      FieldName = 'IDFICHA'
      Origin = 'FICHA.IDFICHA'
      Size = 255
    end
    object IBQ_FichaGARCOM: TIntegerField
      FieldName = 'GARCOM'
      Origin = 'FICHA.GARCOM'
    end
    object IBQ_FichaFECHANDO: TIBStringField
      FieldName = 'FECHANDO'
      Origin = 'FICHA.FECHANDO'
      Size = 1
    end
  end
  object IBQ_Pesquisa: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select *'
      'From MesaFecha')
    Left = 515
  end
  object IBQ_PesCancela: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from MESAITEM')
    Left = 487
    object IBQ_PesCancelaCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'MESAITEM.CODIGO_ID'
      Required = True
    end
    object IBQ_PesCancelaMESA: TIntegerField
      FieldName = 'MESA'
      Origin = 'MESAITEM.MESA'
    end
    object IBQ_PesCancelaSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'MESAITEM.SEQUENCIA'
    end
    object IBQ_PesCancelaGARCOM: TIntegerField
      FieldName = 'GARCOM'
      Origin = 'MESAITEM.GARCOM'
    end
    object IBQ_PesCancelaPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'MESAITEM.PRODUTO'
    end
    object IBQ_PesCancelaQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      Origin = 'MESAITEM.QUANTIDADE'
    end
    object IBQ_PesCancelaCANCELADA: TIBStringField
      FieldName = 'CANCELADA'
      Origin = 'MESAITEM.CANCELADA'
      Required = True
      Size = 1
    end
    object IBQ_PesCancelaIMP_REMOTA: TIBStringField
      FieldName = 'IMP_REMOTA'
      Origin = 'MESAITEM.IMP_REMOTA'
      Required = True
      Size = 1
    end
    object IBQ_PesCancelaPONTOVENDA: TIntegerField
      FieldName = 'PONTOVENDA'
      Origin = 'MESAITEM.PONTOVENDA'
    end
    object IBQ_PesCancelaHORA: TIBStringField
      FieldName = 'HORA'
      Origin = 'MESAITEM.HORA'
      Size = 5
    end
    object IBQ_PesCancelaDATE: TDateField
      FieldName = 'DATE'
      Origin = 'MESAITEM.DATE'
    end
    object IBQ_PesCancelaMESAFECHA: TIntegerField
      FieldName = 'MESAFECHA'
      Origin = 'MESAITEM.MESAFECHA'
    end
    object IBQ_PesCancelaSEQFECHA: TIntegerField
      FieldName = 'SEQFECHA'
      Origin = 'MESAITEM.SEQFECHA'
    end
    object IBQ_PesCancelaGRUPO: TIntegerField
      FieldName = 'GRUPO'
      Origin = 'MESAITEM.GRUPO'
    end
    object IBQ_PesCancelaPRC_UNITARIO: TFloatField
      FieldName = 'PRC_UNITARIO'
      Origin = 'MESAITEM.PRC_UNITARIO'
    end
    object IBQ_PesCancelaBALANCA: TIBStringField
      FieldName = 'BALANCA'
      Origin = 'MESAITEM.BALANCA'
      Required = True
      Size = 1
    end
    object IBQ_PesCancelaHO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'HO'
      Origin = 'MESAITEM.HO'
      ReadOnly = True
      Size = 2
    end
    object IBQ_PesCancelaTEMPO: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO'
      Origin = 'MESAITEM.TEMPO'
      ReadOnly = True
    end
    object IBQ_PesCancelaOPCANCEL: TIntegerField
      FieldName = 'OPCANCEL'
      Origin = 'MESAITEM.OPCANCEL'
    end
    object IBQ_PesCancelaALIQUOTA: TIntegerField
      FieldName = 'ALIQUOTA'
      Origin = 'MESAITEM.ALIQUOTA'
    end
    object IBQ_PesCancelaDATA_INICIO: TDateField
      FieldName = 'DATA_INICIO'
      Origin = 'MESAITEM.DATA_INICIO'
    end
    object IBQ_PesCancelaDATA_FINAL: TDateField
      FieldName = 'DATA_FINAL'
      Origin = 'MESAITEM.DATA_FINAL'
    end
    object IBQ_PesCancelaHORA_INICIO: TIBStringField
      FieldName = 'HORA_INICIO'
      Origin = 'MESAITEM.HORA_INICIO'
      Size = 5
    end
    object IBQ_PesCancelaHORA_FINAL: TIBStringField
      FieldName = 'HORA_FINAL'
      Origin = 'MESAITEM.HORA_FINAL'
      Size = 5
    end
    object IBQ_PesCancelaTEMPO_INICIAL: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO_INICIAL'
      Origin = 'MESAITEM.TEMPO_INICIAL'
      ReadOnly = True
    end
    object IBQ_PesCancelaTEMPO_FINAL: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO_FINAL'
      Origin = 'MESAITEM.TEMPO_FINAL'
      ReadOnly = True
    end
    object IBQ_PesCancelaDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      Origin = 'MESAITEM.DESCONTO'
    end
    object IBQ_PesCancelaFINALIZADA: TIBStringField
      FieldName = 'FINALIZADA'
      Origin = 'MESAITEM.FINALIZADA'
      Required = True
      Size = 1
    end
    object IBQ_PesCancelaOBS: TIBStringField
      FieldName = 'OBS'
      Origin = 'MESAITEM.OBS'
      Size = 255
    end
    object IBQ_PesCancelaIMP_DIARIA: TIBStringField
      FieldName = 'IMP_DIARIA'
      Origin = 'MESAITEM.IMP_DIARIA'
      Size = 1
    end
    object IBQ_PesCancelaIMP_CONTINT: TIBStringField
      FieldName = 'IMP_CONTINT'
      Origin = 'MESAITEM.IMP_CONTINT'
      Size = 1
    end
    object IBQ_PesCancelaIMP_CANCELINT: TIBStringField
      FieldName = 'IMP_CANCELINT'
      Origin = 'MESAITEM.IMP_CANCELINT'
      Size = 1
    end
    object IBQ_PesCancelaCLIENTEDIARIA: TIntegerField
      FieldName = 'CLIENTEDIARIA'
      Origin = 'MESAITEM.CLIENTEDIARIA'
    end
    object IBQ_PesCancelaACRESCIMO: TFloatField
      FieldName = 'ACRESCIMO'
      Origin = 'MESAITEM.ACRESCIMO'
    end
    object IBQ_PesCancelaTAXA: TFloatField
      FieldName = 'TAXA'
      Origin = 'MESAITEM.TAXA'
    end
    object IBQ_PesCancelaVAL_DESCONTO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_DESCONTO'
      Origin = 'MESAITEM.VAL_DESCONTO'
      ReadOnly = True
    end
    object IBQ_PesCancelaVAL_ACRESCIMO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_ACRESCIMO'
      Origin = 'MESAITEM.VAL_ACRESCIMO'
      ReadOnly = True
    end
    object IBQ_PesCancelaVAL_TAXA: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_TAXA'
      Origin = 'MESAITEM.VAL_TAXA'
      ReadOnly = True
    end
    object IBQ_PesCancelaVAL_PRODUTO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_PRODUTO'
      Origin = 'MESAITEM.VAL_PRODUTO'
      ReadOnly = True
    end
  end
  object IBT_Produtos: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'PRODUTOS'
    Left = 460
    object IBT_ProdutosCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
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
    end
    object IBT_ProdutosPRECOCUSTO: TFloatField
      FieldName = 'PRECOCUSTO'
    end
    object IBT_ProdutosGRUPO: TIntegerField
      FieldName = 'GRUPO'
    end
    object IBT_ProdutosICMS_SN: TIBStringField
      FieldName = 'ICMS_SN'
      Required = True
      Size = 1
    end
    object IBT_ProdutosTRIBUTAR: TIntegerField
      FieldName = 'TRIBUTAR'
    end
    object IBT_ProdutosBALANCA: TIBStringField
      FieldName = 'BALANCA'
      Required = True
      Size = 1
    end
    object IBT_ProdutosTARA: TFloatField
      FieldName = 'TARA'
    end
    object IBT_ProdutosUNIDADE: TIntegerField
      FieldName = 'UNIDADE'
    end
    object IBT_ProdutosATIVO: TIBStringField
      FieldName = 'ATIVO'
      Required = True
      Size = 1
    end
    object IBT_ProdutosCOMANDA: TIBStringField
      FieldName = 'COMANDA'
      Required = True
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
    object IBT_ProdutosESTOQUEMIN: TFloatField
      FieldName = 'ESTOQUEMIN'
    end
    object IBT_ProdutosESTOQUEMAX: TFloatField
      FieldName = 'ESTOQUEMAX'
    end
    object IBT_ProdutosTEMPO: TIBStringField
      FieldName = 'TEMPO'
      Size = 5
    end
    object IBT_ProdutosDIA_PROD: TIBStringField
      FieldName = 'DIA_PROD'
      Required = True
      Size = 1
    end
    object IBT_ProdutosIMP_PERS: TIBStringField
      FieldName = 'IMP_PERS'
      Required = True
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
      Required = True
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
  end
  object cnnSqlServer: TADOConnection
    CommandTimeout = 180
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=masterkey;Persist Security Info=Tru' +
      'e;User ID=sa;Initial Catalog=DBBEMACASH;Data Source=AUXILIAR\SQL' +
      'EXPRESS;Use Procedure for Prepare=1;Auto Translate=True;Packet S' +
      'ize=4096;Workstation ID=AUXILIAR;Use Encryption for Data=False;'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 12
    Top = 136
  end
  object ADOQ_NFC: TADOQuery
    Connection = cnnSqlServer
    CommandTimeout = 180
    DataSource = DTS_NF
    Parameters = <
      item
        Name = 'NUMNOTA'
        Attributes = [paSigned]
        DataType = ftBCD
        Precision = 6
        Size = 19
        Value = Null
      end
      item
        Name = 'SERIE'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 3
        Value = Null
      end>
    SQL.Strings = (
      'SELECT NFC.*'
      'FROM OFF_LANCAMENTOS_CAIXA NFC'
      'where (NFC.NUMNOT = :NUMNOTA) and (NFC.SERIE = :SERIE)')
    Left = 44
    Top = 164
    object ADOQ_NFCFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object ADOQ_NFCNUMNOT: TIntegerField
      FieldName = 'NUMNOT'
    end
    object ADOQ_NFCSERIE: TStringField
      FieldName = 'SERIE'
      Size = 3
    end
    object ADOQ_NFCNUMLAN: TIntegerField
      FieldName = 'NUMLAN'
    end
    object ADOQ_NFCDATENT: TDateTimeField
      FieldName = 'DATENT'
    end
    object ADOQ_NFCNUMCXA: TIntegerField
      FieldName = 'NUMCXA'
    end
    object ADOQ_NFCNUMPED: TBCDField
      FieldName = 'NUMPED'
      Precision = 12
      Size = 0
    end
    object ADOQ_NFCTIPOPED: TIntegerField
      FieldName = 'TIPOPED'
    end
    object ADOQ_NFCTPNOTA: TIntegerField
      FieldName = 'TPNOTA'
    end
    object ADOQ_NFCNUMPRC: TIntegerField
      FieldName = 'NUMPRC'
    end
    object ADOQ_NFCDATREF: TDateTimeField
      FieldName = 'DATREF'
    end
    object ADOQ_NFCNUMMOV: TIntegerField
      FieldName = 'NUMMOV'
    end
    object ADOQ_NFCCODOPER: TBCDField
      FieldName = 'CODOPER'
      Precision = 10
      Size = 0
    end
    object ADOQ_NFCCLALAN: TDateTimeField
      FieldName = 'CLALAN'
    end
    object ADOQ_NFCCODEVE: TIntegerField
      FieldName = 'CODEVE'
    end
    object ADOQ_NFCVALLAN: TBCDField
      FieldName = 'VALLAN'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFCCCUSTO: TIntegerField
      FieldName = 'CCUSTO'
    end
    object ADOQ_NFCNUMBCO: TIntegerField
      FieldName = 'NUMBCO'
    end
    object ADOQ_NFCNUMAGE: TIntegerField
      FieldName = 'NUMAGE'
    end
    object ADOQ_NFCNUMCTA: TBCDField
      FieldName = 'NUMCTA'
      Precision = 10
      Size = 0
    end
    object ADOQ_NFCNUMCHQ: TBCDField
      FieldName = 'NUMCHQ'
      Precision = 10
      Size = 0
    end
    object ADOQ_NFCCODCON: TIntegerField
      FieldName = 'CODCON'
    end
    object ADOQ_NFCNUMORP: TStringField
      FieldName = 'NUMORP'
      Size = 8
    end
    object ADOQ_NFCINDCAR: TStringField
      FieldName = 'INDCAR'
      FixedChar = True
      Size = 1
    end
    object ADOQ_NFCCONDPGTO: TStringField
      FieldName = 'CONDPGTO'
      Size = 3
    end
    object ADOQ_NFCFORMA: TStringField
      FieldName = 'FORMA'
      Size = 4
    end
    object ADOQ_NFCCODPLA: TIntegerField
      FieldName = 'CODPLA'
    end
    object ADOQ_NFCNUMGRP: TIntegerField
      FieldName = 'NUMGRP'
    end
    object ADOQ_NFCNUMCOT: TIntegerField
      FieldName = 'NUMCOT'
    end
    object ADOQ_NFCDATDEP: TDateTimeField
      FieldName = 'DATDEP'
    end
    object ADOQ_NFCNUMAUT: TBCDField
      FieldName = 'NUMAUT'
      Precision = 10
      Size = 0
    end
    object ADOQ_NFCFILORI: TIntegerField
      FieldName = 'FILORI'
    end
    object ADOQ_NFCMOVORI: TIntegerField
      FieldName = 'MOVORI'
    end
    object ADOQ_NFCFILDES: TIntegerField
      FieldName = 'FILDES'
    end
    object ADOQ_NFCCXADES: TIntegerField
      FieldName = 'CXADES'
    end
    object ADOQ_NFCALTTES: TStringField
      FieldName = 'ALTTES'
      FixedChar = True
      Size = 1
    end
    object ADOQ_NFCLOTCOT: TIntegerField
      FieldName = 'LOTCOT'
    end
    object ADOQ_NFCDATCOT: TDateTimeField
      FieldName = 'DATCOT'
    end
    object ADOQ_NFCCODCLI: TBCDField
      FieldName = 'CODCLI'
      Precision = 15
      Size = 0
    end
    object ADOQ_NFCNUMTIT: TIntegerField
      FieldName = 'NUMTIT'
    end
    object ADOQ_NFCDESTIT: TStringField
      FieldName = 'DESTIT'
      Size = 3
    end
    object ADOQ_NFCFILPED: TIntegerField
      FieldName = 'FILPED'
    end
    object ADOQ_NFCCODORI: TIntegerField
      FieldName = 'CODORI'
    end
    object ADOQ_NFCTRANF: TIntegerField
      FieldName = 'TRANF'
    end
    object ADOQ_NFCBORCHQ: TIntegerField
      FieldName = 'BORCHQ'
    end
    object ADOQ_NFCDEPCHQ: TStringField
      FieldName = 'DEPCHQ'
      FixedChar = True
      Size = 1
    end
    object ADOQ_NFCOBSLAN: TStringField
      FieldName = 'OBSLAN'
      Size = 70
    end
    object ADOQ_NFCDATEXC: TDateTimeField
      FieldName = 'DATEXC'
    end
    object ADOQ_NFCSITCXA: TIntegerField
      FieldName = 'SITCXA'
    end
    object ADOQ_NFCVALREAL: TBCDField
      FieldName = 'VALREAL'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFCSTATUS: TIntegerField
      FieldName = 'STATUS'
    end
    object ADOQ_NFCNUMCARTAO: TStringField
      FieldName = 'NUMCARTAO'
    end
    object ADOQ_NFCVALIDCARTAO: TStringField
      FieldName = 'VALIDCARTAO'
      Size = 6
    end
    object ADOQ_NFCFILNOT: TIntegerField
      FieldName = 'FILNOT'
    end
    object ADOQ_NFCDTVCTO: TDateTimeField
      FieldName = 'DTVCTO'
    end
    object ADOQ_NFCFLFINANC: TStringField
      FieldName = 'FLFINANC'
      FixedChar = True
      Size = 1
    end
    object ADOQ_NFCINTEGRACRC: TStringField
      FieldName = 'INTEGRACRC'
      FixedChar = True
      Size = 1
    end
    object ADOQ_NFCNUMDEPOSIDENT: TIntegerField
      FieldName = 'NUMDEPOSIDENT'
    end
    object ADOQ_NFCNUMBOLETO: TStringField
      FieldName = 'NUMBOLETO'
      Size = 13
    end
    object ADOQ_NFCVLJUROSREAL: TBCDField
      FieldName = 'VLJUROSREAL'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFCVLMULTAREAL: TBCDField
      FieldName = 'VLMULTAREAL'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFCVLTOTAL: TBCDField
      FieldName = 'VLTOTAL'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFCVLPREVISTO: TBCDField
      FieldName = 'VLPREVISTO'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFCDTPAGTO: TDateTimeField
      FieldName = 'DTPAGTO'
    end
    object ADOQ_NFCPMULTAPREV: TBCDField
      FieldName = 'PMULTAPREV'
      Precision = 12
      Size = 9
    end
    object ADOQ_NFCPJUROSPREV: TBCDField
      FieldName = 'PJUROSPREV'
      Precision = 12
      Size = 9
    end
    object ADOQ_NFCCODUSERLIB: TIntegerField
      FieldName = 'CODUSERLIB'
    end
    object ADOQ_NFCVLJUROSPREV: TBCDField
      FieldName = 'VLJUROSPREV'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFCVLMULTAPREV: TBCDField
      FieldName = 'VLMULTAPREV'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFCNUMCONTRA: TBCDField
      FieldName = 'NUMCONTRA'
      Precision = 12
      Size = 0
    end
    object ADOQ_NFCDIGCONTRA: TIntegerField
      FieldName = 'DIGCONTRA'
    end
    object ADOQ_NFCFLOPERAUTOM: TStringField
      FieldName = 'FLOPERAUTOM'
      FixedChar = True
      Size = 1
    end
    object ADOQ_NFCVLJUROS: TBCDField
      FieldName = 'VLJUROS'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFCVLMULTA: TBCDField
      FieldName = 'VLMULTA'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFCVLDESCCARNE: TBCDField
      FieldName = 'VLDESCCARNE'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFCNUMPRCCOB: TIntegerField
      FieldName = 'NUMPRCCOB'
    end
    object ADOQ_NFCNUMDOC: TBCDField
      FieldName = 'NUMDOC'
      Precision = 13
      Size = 0
    end
    object ADOQ_NFCHISTCTACONTAB: TStringField
      FieldName = 'HISTCTACONTAB'
      Size = 80
    end
    object ADOQ_NFCCTACONTAB: TBCDField
      FieldName = 'CTACONTAB'
      Precision = 12
      Size = 0
    end
    object ADOQ_NFCFLDEBCRED: TStringField
      FieldName = 'FLDEBCRED'
      FixedChar = True
      Size = 1
    end
    object ADOQ_NFCNUMCONTRAFIN: TIntegerField
      FieldName = 'NUMCONTRAFIN'
    end
    object ADOQ_NFCDIGCONTRAFIN: TIntegerField
      FieldName = 'DIGCONTRAFIN'
    end
    object ADOQ_NFCFLGERAER: TStringField
      FieldName = 'FLGERAER'
      FixedChar = True
      Size = 1
    end
    object ADOQ_NFCRG: TStringField
      FieldName = 'RG'
      Size = 15
    end
    object ADOQ_NFCCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 50
    end
    object ADOQ_NFCCODCHQ: TStringField
      FieldName = 'CODCHQ'
      Size = 30
    end
    object ADOQ_NFCTAXADM: TBCDField
      FieldName = 'TAXADM'
      Precision = 7
    end
    object ADOQ_NFCCODFUNC: TBCDField
      FieldName = 'CODFUNC'
      Precision = 11
      Size = 0
    end
    object ADOQ_NFCCODREC: TIntegerField
      FieldName = 'CODREC'
    end
    object ADOQ_NFCNUMAUTENTIC: TBCDField
      FieldName = 'NUMAUTENTIC'
      Precision = 20
      Size = 0
    end
    object ADOQ_NFCCODCONVENIO: TIntegerField
      FieldName = 'CODCONVENIO'
    end
    object ADOQ_NFCCODPORT: TIntegerField
      FieldName = 'CODPORT'
    end
    object ADOQ_NFCIDENTPROC: TStringField
      FieldName = 'IDENTPROC'
      Size = 100
    end
    object ADOQ_NFCNUMAUTCHQ: TStringField
      FieldName = 'NUMAUTCHQ'
      Size = 27
    end
    object ADOQ_NFCCODEMPR: TIntegerField
      FieldName = 'CODEMPR'
    end
    object ADOQ_NFCFLFISCAL: TStringField
      FieldName = 'FLFISCAL'
      FixedChar = True
      Size = 1
    end
    object ADOQ_NFCCODORIGCRC: TIntegerField
      FieldName = 'CODORIGCRC'
    end
    object ADOQ_NFCTPCLICRC: TStringField
      FieldName = 'TPCLICRC'
      FixedChar = True
      Size = 1
    end
    object ADOQ_NFCFLRECONC: TStringField
      FieldName = 'FLRECONC'
      FixedChar = True
      Size = 1
    end
    object ADOQ_NFCCODOPERRECONC: TBCDField
      FieldName = 'CODOPERRECONC'
      Precision = 10
      Size = 0
    end
    object ADOQ_NFCNUMCXARECONC: TIntegerField
      FieldName = 'NUMCXARECONC'
    end
    object ADOQ_NFCNUMMOVRECONC: TIntegerField
      FieldName = 'NUMMOVRECONC'
    end
    object ADOQ_NFCNRRECRECEB: TBCDField
      FieldName = 'NRRECRECEB'
      Precision = 12
      Size = 0
    end
    object ADOQ_NFCSEQSANGRIA: TIntegerField
      FieldName = 'SEQSANGRIA'
    end
    object ADOQ_NFCCGCCPF: TBCDField
      FieldName = 'CGCCPF'
      Precision = 15
      Size = 0
    end
    object ADOQ_NFCCODOPERCENTRAL: TBCDField
      FieldName = 'CODOPERCENTRAL'
      Precision = 10
      Size = 0
    end
    object ADOQ_NFCNCC: TBCDField
      FieldName = 'NCC'
      Precision = 16
      Size = 0
    end
    object ADOQ_NFCFLOUTROSRECEB: TStringField
      FieldName = 'FLOUTROSRECEB'
      FixedChar = True
      Size = 1
    end
    object ADOQ_NFCFLREPLICA: TStringField
      FieldName = 'FLREPLICA'
      FixedChar = True
      Size = 1
    end
    object ADOQ_NFCFLINT: TStringField
      FieldName = 'FLINT'
      FixedChar = True
      Size = 1
    end
    object ADOQ_NFCNUMAUTORIZACAO: TStringField
      FieldName = 'NUMAUTORIZACAO'
      Size = 10
    end
    object ADOQ_NFCDTEXPORTACAO: TDateTimeField
      FieldName = 'DTEXPORTACAO'
    end
    object ADOQ_NFCVLTROCO: TBCDField
      FieldName = 'VLTROCO'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFCFLENTRADA: TStringField
      FieldName = 'FLENTRADA'
      FixedChar = True
      Size = 1
    end
    object ADOQ_NFCFLLISTCHEQ: TStringField
      FieldName = 'FLLISTCHEQ'
      FixedChar = True
      Size = 1
    end
    object ADOQ_NFCCODTPSEGUR: TIntegerField
      FieldName = 'CODTPSEGUR'
    end
    object ADOQ_NFCNRMULTRECEB: TIntegerField
      FieldName = 'NRMULTRECEB'
    end
    object ADOQ_NFCCODFILCRC: TIntegerField
      FieldName = 'CODFILCRC'
    end
    object ADOQ_NFCVLTAC: TBCDField
      FieldName = 'VLTAC'
      Precision = 17
    end
    object ADOQ_NFCNUMDOCCONV: TStringField
      FieldName = 'NUMDOCCONV'
      Size = 15
    end
    object ADOQ_NFCQTPRCFIN: TIntegerField
      FieldName = 'QTPRCFIN'
    end
    object ADOQ_NFCFINALIZA: TStringField
      FieldName = 'FINALIZA'
      Size = 1
    end
    object ADOQ_NFCNUMCCF: TIntegerField
      FieldName = 'NUMCCF'
    end
    object ADOQ_NFCNUMGNF: TIntegerField
      FieldName = 'NUMGNF'
    end
    object ADOQ_NFCTIPOMOVPDV: TStringField
      FieldName = 'TIPOMOVPDV'
      FixedChar = True
      Size = 2
    end
    object ADOQ_NFCNUMDAV: TBCDField
      FieldName = 'NUMDAV'
      Precision = 13
      Size = 0
    end
  end
  object DTS_NFC: TDataSource
    DataSet = ADOQ_NFC
    Left = 72
    Top = 164
  end
  object ADOQ_NFI: TADOQuery
    Connection = cnnSqlServer
    CommandTimeout = 180
    DataSource = DTS_NF
    Parameters = <
      item
        Name = 'NUMNOTA'
        Attributes = [paSigned]
        DataType = ftBCD
        Precision = 6
        Size = 19
        Value = Null
      end
      item
        Name = 'SERIE'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 3
        Value = Null
      end>
    SQL.Strings = (
      'SELECT NFI.*'
      'FROM OFF_ITENS_NF_SAIDA NFI'
      'where (NFI.NUMNOTA = :NUMNOTA) and (NFI.SERIE = :SERIE)  ')
    Left = 44
    Top = 136
    object ADOQ_NFITPNOTA: TIntegerField
      FieldName = 'TPNOTA'
    end
    object ADOQ_NFINUMNOTA: TIntegerField
      FieldName = 'NUMNOTA'
    end
    object ADOQ_NFISERIE: TStringField
      FieldName = 'SERIE'
      Size = 3
    end
    object ADOQ_NFIDTNOTA: TDateTimeField
      FieldName = 'DTNOTA'
    end
    object ADOQ_NFICODPROD: TBCDField
      FieldName = 'CODPROD'
      Precision = 10
      Size = 0
    end
    object ADOQ_NFIITEM: TIntegerField
      FieldName = 'ITEM'
    end
    object ADOQ_NFIQTCOMP: TBCDField
      FieldName = 'QTCOMP'
      Precision = 9
      Size = 3
    end
    object ADOQ_NFIPRECOUNIT: TBCDField
      FieldName = 'PRECOUNIT'
      Precision = 17
    end
    object ADOQ_NFIALIQICM: TBCDField
      FieldName = 'ALIQICM'
      Precision = 4
      Size = 2
    end
    object ADOQ_NFIALIQICMSUB: TBCDField
      FieldName = 'ALIQICMSUB'
      Precision = 7
    end
    object ADOQ_NFIALIQICMRED: TBCDField
      FieldName = 'ALIQICMRED'
      Precision = 7
    end
    object ADOQ_NFIVLIPI: TBCDField
      FieldName = 'VLIPI'
      Precision = 15
    end
    object ADOQ_NFIPORCIPI: TBCDField
      FieldName = 'PORCIPI'
      Precision = 4
      Size = 2
    end
    object ADOQ_NFICODEMBAL: TIntegerField
      FieldName = 'CODEMBAL'
    end
    object ADOQ_NFIDPI: TBCDField
      FieldName = 'DPI'
      Precision = 11
      Size = 9
    end
    object ADOQ_NFIDESCCOMPLE: TStringField
      FieldName = 'DESCCOMPLE'
      Size = 36
    end
    object ADOQ_NFISTATUS: TIntegerField
      FieldName = 'STATUS'
    end
    object ADOQ_NFINUMPEDVEN: TBCDField
      FieldName = 'NUMPEDVEN'
      Precision = 12
      Size = 0
    end
    object ADOQ_NFICODCLI: TBCDField
      FieldName = 'CODCLI'
      Precision = 15
      Size = 0
    end
    object ADOQ_NFIPRECJUR: TBCDField
      FieldName = 'PRECJUR'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFIQTDEVOL: TBCDField
      FieldName = 'QTDEVOL'
      Precision = 9
      Size = 3
    end
    object ADOQ_NFIPRECOUNITLIQ: TBCDField
      FieldName = 'PRECOUNITLIQ'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFIVLSUPINF: TBCDField
      FieldName = 'VLSUPINF'
      Precision = 8
      Size = 2
    end
    object ADOQ_NFICMUP: TBCDField
      FieldName = 'CMUP'
      Precision = 15
    end
    object ADOQ_NFIMEDGER: TBCDField
      FieldName = 'MEDGER'
      Precision = 15
    end
    object ADOQ_NFIHRHORA: TDateTimeField
      FieldName = 'HRHORA'
    end
    object ADOQ_NFICODSITPROD: TStringField
      FieldName = 'CODSITPROD'
      FixedChar = True
      Size = 2
    end
    object ADOQ_NFIALIQICMSUBUF: TBCDField
      FieldName = 'ALIQICMSUBUF'
      Precision = 7
    end
    object ADOQ_NFIQTESTOQUE: TBCDField
      FieldName = 'QTESTOQUE'
      Precision = 9
      Size = 3
    end
    object ADOQ_NFIVLDESCITEM: TBCDField
      FieldName = 'VLDESCITEM'
      Precision = 15
      Size = 5
    end
    object ADOQ_NFIVLDESCITEMRAT: TBCDField
      FieldName = 'VLDESCITEMRAT'
      Precision = 15
      Size = 5
    end
    object ADOQ_NFICODPROM: TBCDField
      FieldName = 'CODPROM'
      Precision = 12
      Size = 0
    end
    object ADOQ_NFIQTEMB: TIntegerField
      FieldName = 'QTEMB'
    end
    object ADOQ_NFIVLBASEICMSF: TBCDField
      FieldName = 'VLBASEICMSF'
      Precision = 20
      Size = 9
    end
    object ADOQ_NFIVLISENTOF: TBCDField
      FieldName = 'VLISENTOF'
      Precision = 20
      Size = 9
    end
    object ADOQ_NFIVLNTRIBUTF: TBCDField
      FieldName = 'VLNTRIBUTF'
      Precision = 20
      Size = 9
    end
    object ADOQ_NFIVLOUTRASF: TBCDField
      FieldName = 'VLOUTRASF'
      Precision = 20
      Size = 9
    end
    object ADOQ_NFIVLICMF: TBCDField
      FieldName = 'VLICMF'
      Precision = 20
      Size = 9
    end
    object ADOQ_NFIVLBASEICMSSUBF: TBCDField
      FieldName = 'VLBASEICMSSUBF'
      Precision = 20
      Size = 9
    end
    object ADOQ_NFIVLICMRETF: TBCDField
      FieldName = 'VLICMRETF'
      Precision = 20
      Size = 9
    end
    object ADOQ_NFIVLDESPACES: TBCDField
      FieldName = 'VLDESPACES'
      Precision = 15
    end
    object ADOQ_NFIVLOUTDESP: TBCDField
      FieldName = 'VLOUTDESP'
      Precision = 15
    end
    object ADOQ_NFICODITPRODKIT: TBCDField
      FieldName = 'CODITPRODKIT'
      Precision = 10
      Size = 0
    end
    object ADOQ_NFICODVENDR: TBCDField
      FieldName = 'CODVENDR'
      Precision = 10
      Size = 0
    end
    object ADOQ_NFINUMRECEITA: TStringField
      FieldName = 'NUMRECEITA'
      Size = 12
    end
    object ADOQ_NFIDTRECEITA: TDateTimeField
      FieldName = 'DTRECEITA'
    end
    object ADOQ_NFICODPRESCRITOR: TBCDField
      FieldName = 'CODPRESCRITOR'
      Precision = 15
      Size = 0
    end
    object ADOQ_NFIQTPRESCRITA: TBCDField
      FieldName = 'QTPRESCRITA'
      Precision = 9
      Size = 3
    end
    object ADOQ_NFIVLISS: TBCDField
      FieldName = 'VLISS'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFITPPRESCRITOR: TIntegerField
      FieldName = 'TPPRESCRITOR'
    end
    object ADOQ_NFIUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 2
    end
    object ADOQ_NFICTF: TIntegerField
      FieldName = 'CTF'
    end
    object ADOQ_NFIFLREPLICA: TStringField
      FieldName = 'FLREPLICA'
      FixedChar = True
      Size = 1
    end
    object ADOQ_NFIFLINT: TStringField
      FieldName = 'FLINT'
      FixedChar = True
      Size = 1
    end
    object ADOQ_NFICODDESPMONTAG: TIntegerField
      FieldName = 'CODDESPMONTAG'
    end
    object ADOQ_NFIFILORIG: TIntegerField
      FieldName = 'FILORIG'
    end
    object ADOQ_NFIFILPED: TIntegerField
      FieldName = 'FILPED'
    end
    object ADOQ_NFIVLMONTAGEM: TBCDField
      FieldName = 'VLMONTAGEM'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFIFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object ADOQ_NFIVLCOMISSAO: TBCDField
      FieldName = 'VLCOMISSAO'
      Precision = 17
    end
    object ADOQ_NFIVLTOTITEM: TBCDField
      FieldName = 'VLTOTITEM'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFIFLBUSCATRIBUT: TStringField
      FieldName = 'FLBUSCATRIBUT'
      FixedChar = True
      Size = 1
    end
    object ADOQ_NFIVLDESPFIN: TBCDField
      FieldName = 'VLDESPFIN'
      Precision = 17
      Size = 7
    end
    object ADOQ_NFIVLFRETERAT: TBCDField
      FieldName = 'VLFRETERAT'
      Precision = 15
    end
    object ADOQ_NFIVLSEGURO: TBCDField
      FieldName = 'VLSEGURO'
      Precision = 17
      Size = 7
    end
    object ADOQ_NFIVLTOTIPI: TBCDField
      FieldName = 'VLTOTIPI'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFIVLJUROS: TBCDField
      FieldName = 'VLJUROS'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFIVLJUROSFIN: TBCDField
      FieldName = 'VLJUROSFIN'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFIPRECOORIG: TBCDField
      FieldName = 'PRECOORIG'
      Precision = 17
    end
    object ADOQ_NFICODJUST: TStringField
      FieldName = 'CODJUST'
      FixedChar = True
      Size = 2
    end
    object ADOQ_NFIITPEDITEM: TIntegerField
      FieldName = 'ITPEDITEM'
    end
    object ADOQ_NFITIPOPED: TIntegerField
      FieldName = 'TIPOPED'
    end
    object ADOQ_NFICONVERSAO: TBCDField
      FieldName = 'CONVERSAO'
      Precision = 11
      Size = 6
    end
    object ADOQ_NFIVLDESCFRETE: TBCDField
      FieldName = 'VLDESCFRETE'
      Precision = 17
    end
    object ADOQ_NFIVLFRETE: TBCDField
      FieldName = 'VLFRETE'
      Precision = 17
    end
    object ADOQ_NFIQTVENDAKIT: TBCDField
      FieldName = 'QTVENDAKIT'
      Precision = 9
      Size = 3
    end
    object ADOQ_NFIVLBASEICMORIGREPI: TBCDField
      FieldName = 'VLBASEICMORIGREPI'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFIVLICMORIGREPI: TBCDField
      FieldName = 'VLICMORIGREPI'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFIVLICMREPI: TBCDField
      FieldName = 'VLICMREPI'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFICODOCORRPRECO: TStringField
      FieldName = 'CODOCORRPRECO'
      Size = 2
    end
    object ADOQ_NFIPRECOLISTA: TBCDField
      FieldName = 'PRECOLISTA'
      Precision = 17
    end
    object ADOQ_NFIPOSICAOCUPOM: TIntegerField
      FieldName = 'POSICAOCUPOM'
    end
    object ADOQ_NFIFLMDVCOMPSUSP: TStringField
      FieldName = 'FLMDVCOMPSUSP'
      FixedChar = True
      Size = 1
    end
    object ADOQ_NFIFLMDVLOCAL: TStringField
      FieldName = 'FLMDVLOCAL'
      FixedChar = True
      Size = 1
    end
    object ADOQ_NFIFLMDVPROMOCAO: TStringField
      FieldName = 'FLMDVPROMOCAO'
      FixedChar = True
      Size = 1
    end
    object ADOQ_NFIFLRUPTURAMINQT: TStringField
      FieldName = 'FLRUPTURAMINQT'
      FixedChar = True
      Size = 1
    end
    object ADOQ_NFIFLRUPTURAVDZERO: TStringField
      FieldName = 'FLRUPTURAVDZERO'
      FixedChar = True
      Size = 1
    end
    object ADOQ_NFIVLTAC: TBCDField
      FieldName = 'VLTAC'
      Precision = 17
    end
    object ADOQ_NFINLOTE: TIntegerField
      FieldName = 'NLOTE'
    end
    object ADOQ_NFIVLBASEIPI: TBCDField
      FieldName = 'VLBASEIPI'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFIVLISENTOIPI: TBCDField
      FieldName = 'VLISENTOIPI'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFIVLOUTRASIPI: TBCDField
      FieldName = 'VLOUTRASIPI'
      Precision = 17
    end
    object ADOQ_NFIVLTOTBASEIPI: TBCDField
      FieldName = 'VLTOTBASEIPI'
      Precision = 17
    end
    object ADOQ_NFINUMCCF: TIntegerField
      FieldName = 'NUMCCF'
    end
    object ADOQ_NFICODTOTPARCIMPR: TStringField
      FieldName = 'CODTOTPARCIMPR'
      Size = 8
    end
    object ADOQ_NFINUMDAV: TBCDField
      FieldName = 'NUMDAV'
      Precision = 13
      Size = 0
    end
    object ADOQ_NFIVLBASEICMSSUB: TBCDField
      FieldName = 'VLBASEICMSSUB'
      Precision = 16
      Size = 2
    end
    object ADOQ_NFINrSerie: TStringField
      FieldName = 'NrSerie'
      Size = 30
    end
  end
  object DTS_NFI: TDataSource
    DataSet = ADOQ_NFI
    Left = 72
    Top = 136
  end
  object ADOQ_NF: TADOQuery
    Connection = cnnSqlServer
    CommandTimeout = 180
    Parameters = <
      item
        Name = 'pNUMNOTA'
        Attributes = [paSigned]
        DataType = ftBCD
        Precision = 6
        Size = 19
        Value = Null
      end
      item
        Name = 'pSERIE'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 3
        Value = Null
      end>
    SQL.Strings = (
      'SELECT NF.*'
      'FROM OFF_NF_SAIDA NF'
      'where (NF.NUMNOTA = :pNUMNOTA) and (NF.SERIE = :pSERIE)')
    Left = 45
    Top = 108
    object ADOQ_NFFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object ADOQ_NFTPNOTA: TIntegerField
      FieldName = 'TPNOTA'
    end
    object ADOQ_NFNUMNOTA: TIntegerField
      FieldName = 'NUMNOTA'
    end
    object ADOQ_NFSERIE: TStringField
      FieldName = 'SERIE'
      Size = 3
    end
    object ADOQ_NFDTNOTA: TDateTimeField
      FieldName = 'DTNOTA'
    end
    object ADOQ_NFDTEMISSAO: TDateTimeField
      FieldName = 'DTEMISSAO'
    end
    object ADOQ_NFDTPEDIDO: TDateTimeField
      FieldName = 'DTPEDIDO'
    end
    object ADOQ_NFDTCANCEL: TDateTimeField
      FieldName = 'DTCANCEL'
    end
    object ADOQ_NFDTENTREGA: TDateTimeField
      FieldName = 'DTENTREGA'
    end
    object ADOQ_NFCONDPGTO: TStringField
      FieldName = 'CONDPGTO'
      Size = 3
    end
    object ADOQ_NFESTADO: TStringField
      FieldName = 'ESTADO'
      FixedChar = True
      Size = 2
    end
    object ADOQ_NFCODNATOP: TIntegerField
      FieldName = 'CODNATOP'
    end
    object ADOQ_NFNUMPEDVEN: TBCDField
      FieldName = 'NUMPEDVEN'
      Precision = 12
      Size = 0
    end
    object ADOQ_NFCODCLI: TBCDField
      FieldName = 'CODCLI'
      Precision = 15
      Size = 0
    end
    object ADOQ_NFCODVENDR: TBCDField
      FieldName = 'CODVENDR'
      Precision = 10
      Size = 0
    end
    object ADOQ_NFNUMCXA: TIntegerField
      FieldName = 'NUMCXA'
    end
    object ADOQ_NFLOCAL: TIntegerField
      FieldName = 'LOCAL'
    end
    object ADOQ_NFPESO: TBCDField
      FieldName = 'PESO'
      Precision = 12
      Size = 3
    end
    object ADOQ_NFOBS: TStringField
      FieldName = 'OBS'
      Size = 255
    end
    object ADOQ_NFVLDESCONTO: TBCDField
      FieldName = 'VLDESCONTO'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFVLDESPFIN: TBCDField
      FieldName = 'VLDESPFIN'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFVLMERCAD: TBCDField
      FieldName = 'VLMERCAD'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFVLSEGURO: TBCDField
      FieldName = 'VLSEGURO'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFSTATUS: TIntegerField
      FieldName = 'STATUS'
    end
    object ADOQ_NFVLTOTAL: TBCDField
      FieldName = 'VLTOTAL'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFPESOLIQ: TBCDField
      FieldName = 'PESOLIQ'
      Precision = 12
      Size = 3
    end
    object ADOQ_NFHRHORA: TDateTimeField
      FieldName = 'HRHORA'
    end
    object ADOQ_NFHRDURACAO: TIntegerField
      FieldName = 'HRDURACAO'
    end
    object ADOQ_NFVLJUROSFIN: TBCDField
      FieldName = 'VLJUROSFIN'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFPJUROS: TBCDField
      FieldName = 'PJUROS'
      Precision = 12
      Size = 9
    end
    object ADOQ_NFDTATUEST: TDateTimeField
      FieldName = 'DTATUEST'
    end
    object ADOQ_NFFLATUEST: TStringField
      FieldName = 'FLATUEST'
      FixedChar = True
      Size = 1
    end
    object ADOQ_NFDTNOTAPDV: TDateTimeField
      FieldName = 'DTNOTAPDV'
    end
    object ADOQ_NFFLNOTAPDV: TStringField
      FieldName = 'FLNOTAPDV'
      FixedChar = True
      Size = 1
    end
    object ADOQ_NFNUMNOTAPDV: TIntegerField
      FieldName = 'NUMNOTAPDV'
    end
    object ADOQ_NFNUMPDV: TIntegerField
      FieldName = 'NUMPDV'
    end
    object ADOQ_NFSERIEPDV: TStringField
      FieldName = 'SERIEPDV'
      Size = 3
    end
    object ADOQ_NFTPNOTAPDV: TIntegerField
      FieldName = 'TPNOTAPDV'
    end
    object ADOQ_NFQTPRC: TIntegerField
      FieldName = 'QTPRC'
    end
    object ADOQ_NFVLPRC: TBCDField
      FieldName = 'VLPRC'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFOBSFISCAL: TStringField
      FieldName = 'OBSFISCAL'
      Size = 150
    end
    object ADOQ_NFDTLIBPED: TDateTimeField
      FieldName = 'DTLIBPED'
    end
    object ADOQ_NFDTEXPORTACAO: TDateTimeField
      FieldName = 'DTEXPORTACAO'
    end
    object ADOQ_NFFLCUPOM: TStringField
      FieldName = 'FLCUPOM'
      FixedChar = True
      Size = 1
    end
    object ADOQ_NFVLBASEICMS: TBCDField
      FieldName = 'VLBASEICMS'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFVLICMS: TBCDField
      FieldName = 'VLICMS'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFVLBASEICMSSUB: TBCDField
      FieldName = 'VLBASEICMSSUB'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFVLICMSSUB: TBCDField
      FieldName = 'VLICMSSUB'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFVLFRETE: TBCDField
      FieldName = 'VLFRETE'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFVLOUTDESP: TBCDField
      FieldName = 'VLOUTDESP'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFVLIPI: TBCDField
      FieldName = 'VLIPI'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFFLNFMANUAL: TStringField
      FieldName = 'FLNFMANUAL'
      FixedChar = True
      Size = 1
    end
    object ADOQ_NFFLREPLICA: TStringField
      FieldName = 'FLREPLICA'
      FixedChar = True
      Size = 1
    end
    object ADOQ_NFFLINT: TStringField
      FieldName = 'FLINT'
      FixedChar = True
      Size = 1
    end
    object ADOQ_NFENDCOB: TIntegerField
      FieldName = 'ENDCOB'
    end
    object ADOQ_NFENDENT: TIntegerField
      FieldName = 'ENDENT'
    end
    object ADOQ_NFFILPED: TIntegerField
      FieldName = 'FILPED'
    end
    object ADOQ_NFIDENTPROC: TStringField
      FieldName = 'IDENTPROC'
      Size = 250
    end
    object ADOQ_NFPRACA: TIntegerField
      FieldName = 'PRACA'
    end
    object ADOQ_NFTIPOPED: TIntegerField
      FieldName = 'TIPOPED'
    end
    object ADOQ_NFVLMONTAGEM: TBCDField
      FieldName = 'VLMONTAGEM'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFCG: TBCDField
      FieldName = 'CG'
      Precision = 15
    end
    object ADOQ_NFCMG: TBCDField
      FieldName = 'CMG'
      Precision = 15
    end
    object ADOQ_NFFLOFFLINE: TStringField
      FieldName = 'FLOFFLINE'
      FixedChar = True
      Size = 1
    end
    object ADOQ_NFNRSERIEECF: TStringField
      FieldName = 'NRSERIEECF'
    end
    object ADOQ_NFFLIPISUB: TStringField
      FieldName = 'FLIPISUB'
      FixedChar = True
      Size = 1
    end
    object ADOQ_NFFLIPIICMS: TStringField
      FieldName = 'FLIPIICMS'
      FixedChar = True
      Size = 1
    end
    object ADOQ_NFNUMPEDPRINC: TBCDField
      FieldName = 'NUMPEDPRINC'
      Precision = 12
      Size = 0
    end
    object ADOQ_NFCODCONVENIO: TIntegerField
      FieldName = 'CODCONVENIO'
    end
    object ADOQ_NFCODFUNC: TBCDField
      FieldName = 'CODFUNC'
      Precision = 11
      Size = 0
    end
    object ADOQ_NFFLMULTIREC: TStringField
      FieldName = 'FLMULTIREC'
      FixedChar = True
      Size = 1
    end
    object ADOQ_NFVLJUROS: TBCDField
      FieldName = 'VLJUROS'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFVLISS: TBCDField
      FieldName = 'VLISS'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFFLSEGURO: TStringField
      FieldName = 'FLSEGURO'
      FixedChar = True
      Size = 1
    end
    object ADOQ_NFVLENTRADA: TBCDField
      FieldName = 'VLENTRADA'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFCODSUPCANCEL: TIntegerField
      FieldName = 'CODSUPCANCEL'
    end
    object ADOQ_NFCODOPER: TBCDField
      FieldName = 'CODOPER'
      Precision = 10
      Size = 0
    end
    object ADOQ_NFNUMCONTRAFIN: TIntegerField
      FieldName = 'NUMCONTRAFIN'
    end
    object ADOQ_NFCODNATOPCOMPL: TIntegerField
      FieldName = 'CODNATOPCOMPL'
    end
    object ADOQ_NFCODNATOPDIF: TIntegerField
      FieldName = 'CODNATOPDIF'
    end
    object ADOQ_NFCODNATOPDIFCOMPL: TIntegerField
      FieldName = 'CODNATOPDIFCOMPL'
    end
    object ADOQ_NFVLBASEICMORIGREPI: TBCDField
      FieldName = 'VLBASEICMORIGREPI'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFVLICMORIGREPI: TBCDField
      FieldName = 'VLICMORIGREPI'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFVLICMREPI: TBCDField
      FieldName = 'VLICMREPI'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFNRMULTRECEB: TIntegerField
      FieldName = 'NRMULTRECEB'
    end
    object ADOQ_NFMODELONF: TIntegerField
      FieldName = 'MODELONF'
    end
    object ADOQ_NFVLTAC: TBCDField
      FieldName = 'VLTAC'
      Precision = 17
    end
    object ADOQ_NFCARENCIA: TIntegerField
      FieldName = 'CARENCIA'
    end
    object ADOQ_NFVLTARBANCARIA: TBCDField
      FieldName = 'VLTARBANCARIA'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFCEP: TIntegerField
      FieldName = 'CEP'
    end
    object ADOQ_NFCODSUPLIBBLOQUEIO: TIntegerField
      FieldName = 'CODSUPLIBBLOQUEIO'
    end
    object ADOQ_NFDTLIBBLOQUEIO: TDateTimeField
      FieldName = 'DTLIBBLOQUEIO'
    end
    object ADOQ_NFHRLIBBLOQUEIO: TDateTimeField
      FieldName = 'HRLIBBLOQUEIO'
    end
    object ADOQ_NFOBSFINANCEIRO: TStringField
      FieldName = 'OBSFINANCEIRO'
      Size = 100
    end
    object ADOQ_NFTPBLOQUEADO: TStringField
      FieldName = 'TPBLOQUEADO'
      Size = 1
    end
    object ADOQ_NFTOTCUPOMPROMOCIONAL: TIntegerField
      FieldName = 'TOTCUPOMPROMOCIONAL'
    end
    object ADOQ_NFCODSUPLIBCITER: TIntegerField
      FieldName = 'CODSUPLIBCITER'
    end
    object ADOQ_NFVLBASEIPI: TBCDField
      FieldName = 'VLBASEIPI'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFVLISENTOIPI: TBCDField
      FieldName = 'VLISENTOIPI'
      Precision = 15
      Size = 2
    end
    object ADOQ_NFVLOUTRASIPI: TBCDField
      FieldName = 'VLOUTRASIPI'
      Precision = 17
    end
    object ADOQ_NFCGCCPF: TBCDField
      FieldName = 'CGCCPF'
      Precision = 15
      Size = 0
    end
    object ADOQ_NFCEP_VIKAN: TIntegerField
      FieldName = 'CEP_VIKAN'
    end
    object ADOQ_NFSEXO_VIKAN: TIntegerField
      FieldName = 'SEXO_VIKAN'
    end
    object ADOQ_NFNUMCCF: TIntegerField
      FieldName = 'NUMCCF'
    end
    object ADOQ_NFNUMDAV: TBCDField
      FieldName = 'NUMDAV'
      Precision = 13
      Size = 0
    end
    object ADOQ_NFIE: TStringField
      FieldName = 'IE'
      Size = 15
    end
  end
  object DTS_NF: TDataSource
    DataSet = ADOQ_NF
    Left = 73
    Top = 108
  end
end
