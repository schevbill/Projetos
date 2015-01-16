object FRM_Frente: TFRM_Frente
  OldCreateOrder = False
  Left = 257
  Top = 169
  Height = 430
  Width = 673
  object TRM_ATivacao: TTimer
    Enabled = False
    Interval = 60000
    Left = 28
    Top = 8
  end
  object IBQ_PesProduto: TIBQuery
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from produtos')
    UniDirectional = True
    Left = 28
    Top = 64
    object IBQ_PesProdutoDescLocalImp: TStringField
      FieldKind = fkLookup
      FieldName = 'DescLocalImp'
      LookupDataSet = FRM_Modulo.IBT_Config
      LookupKeyFields = 'CODIGO_ID'
      LookupResultField = 'PORT_IMPRI'
      KeyFields = 'LOCAL_IMP'
      Size = 60
      Lookup = True
    end
    object IBQ_PesProdutoCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'PRODUTOS.CODIGO_ID'
      Required = True
    end
    object IBQ_PesProdutoPRODUTO: TIBStringField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTOS.PRODUTO'
      Size = 13
    end
    object IBQ_PesProdutoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'PRODUTOS.DESCRICAO'
      Size = 50
    end
    object IBQ_PesProdutoPRECO: TFloatField
      FieldName = 'PRECO'
      Origin = 'PRODUTOS.PRECO'
    end
    object IBQ_PesProdutoPRECOCUSTO: TFloatField
      FieldName = 'PRECOCUSTO'
      Origin = 'PRODUTOS.PRECOCUSTO'
    end
    object IBQ_PesProdutoGRUPO: TIntegerField
      FieldName = 'GRUPO'
      Origin = 'PRODUTOS.GRUPO'
    end
    object IBQ_PesProdutoICMS_SN: TIBStringField
      FieldName = 'ICMS_SN'
      Origin = 'PRODUTOS.ICMS_SN'
      Required = True
      Size = 1
    end
    object IBQ_PesProdutoTRIBUTAR: TIntegerField
      FieldName = 'TRIBUTAR'
      Origin = 'PRODUTOS.TRIBUTAR'
    end
    object IBQ_PesProdutoBALANCA: TIBStringField
      FieldName = 'BALANCA'
      Origin = 'PRODUTOS.BALANCA'
      Required = True
      Size = 1
    end
    object IBQ_PesProdutoTARA: TFloatField
      FieldName = 'TARA'
      Origin = 'PRODUTOS.TARA'
    end
    object IBQ_PesProdutoUNIDADE: TIntegerField
      FieldName = 'UNIDADE'
      Origin = 'PRODUTOS.UNIDADE'
    end
    object IBQ_PesProdutoATIVO: TIBStringField
      FieldName = 'ATIVO'
      Origin = 'PRODUTOS.ATIVO'
      Required = True
      Size = 1
    end
    object IBQ_PesProdutoCOMANDA: TIBStringField
      FieldName = 'COMANDA'
      Origin = 'PRODUTOS.COMANDA'
      Required = True
      Size = 1
    end
    object IBQ_PesProdutoLOCAL_IMP: TIntegerField
      FieldName = 'LOCAL_IMP'
      Origin = 'PRODUTOS.LOCAL_IMP'
    end
    object IBQ_PesProdutoDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      Origin = 'PRODUTOS.DESCONTO'
    end
    object IBQ_PesProdutoACRESCIMO: TFloatField
      FieldName = 'ACRESCIMO'
      Origin = 'PRODUTOS.ACRESCIMO'
    end
    object IBQ_PesProdutoPROD_MTN: TIntegerField
      FieldName = 'PROD_MTN'
      Origin = 'PRODUTOS.PROD_MTN'
    end
    object IBQ_PesProdutoESTOQUE: TIBStringField
      FieldName = 'ESTOQUE'
      Origin = 'PRODUTOS.ESTOQUE'
      Size = 1
    end
    object IBQ_PesProdutoESTNEGATIVO: TIBStringField
      FieldName = 'ESTNEGATIVO'
      Origin = 'PRODUTOS.ESTNEGATIVO'
      Size = 1
    end
    object IBQ_PesProdutoESTOQUE_FISICO: TFloatField
      FieldName = 'ESTOQUE_FISICO'
      Origin = 'PRODUTOS.ESTOQUE_FISICO'
    end
    object IBQ_PesProdutoESTOQUE_VIRTUAL: TFloatField
      FieldName = 'ESTOQUE_VIRTUAL'
      Origin = 'PRODUTOS.ESTOQUE_VIRTUAL'
    end
    object IBQ_PesProdutoESTOQUEMIN: TFloatField
      FieldName = 'ESTOQUEMIN'
      Origin = 'PRODUTOS.ESTOQUEMIN'
    end
    object IBQ_PesProdutoESTOQUEMAX: TFloatField
      FieldName = 'ESTOQUEMAX'
      Origin = 'PRODUTOS.ESTOQUEMAX'
    end
    object IBQ_PesProdutoTEMPO: TIBStringField
      FieldName = 'TEMPO'
      Origin = 'PRODUTOS.TEMPO'
      Required = True
      Size = 5
    end
    object IBQ_PesProdutoDIA_PROD: TIBStringField
      FieldName = 'DIA_PROD'
      Origin = 'PRODUTOS.DIA_PROD'
      Required = True
      Size = 1
    end
    object IBQ_PesProdutoIMP_PERS: TIBStringField
      FieldName = 'IMP_PERS'
      Origin = 'PRODUTOS.IMP_PERS'
      Required = True
      Size = 1
    end
    object IBQ_PesProdutoVALSALDOENT: TFloatField
      FieldName = 'VALSALDOENT'
      Origin = 'PRODUTOS.VALSALDOENT'
    end
    object IBQ_PesProdutoQTDSALDOENT: TFloatField
      FieldName = 'QTDSALDOENT'
      Origin = 'PRODUTOS.QTDSALDOENT'
    end
    object IBQ_PesProdutoTAXA: TFloatField
      FieldName = 'TAXA'
      Origin = 'PRODUTOS.TAXA'
    end
    object IBQ_PesProdutoTAXA_SN: TIBStringField
      FieldName = 'TAXA_SN'
      Origin = 'PRODUTOS.TAXA_SN'
      Size = 1
    end
    object IBQ_PesProdutoLUCRO: TFloatField
      FieldName = 'LUCRO'
      Origin = 'PRODUTOS.LUCRO'
    end
    object IBQ_PesProdutoMOVEL: TIBStringField
      FieldName = 'MOVEL'
      Origin = 'PRODUTOS.MOVEL'
      Size = 1
    end
    object IBQ_PesProdutoPIS: TFloatField
      FieldName = 'PIS'
      Origin = 'PRODUTOS.PIS'
    end
    object IBQ_PesProdutoREDUCAOICMS: TFloatField
      FieldName = 'REDUCAOICMS'
      Origin = 'PRODUTOS.REDUCAOICMS'
    end
    object IBQ_PesProdutoCOFINS: TFloatField
      FieldName = 'COFINS'
      Origin = 'PRODUTOS.COFINS'
    end
    object IBQ_PesProdutoICMS: TFloatField
      FieldName = 'ICMS'
      Origin = 'PRODUTOS.ICMS'
    end
    object IBQ_PesProdutoTRIBUTAR_ANTIGO: TIntegerField
      FieldName = 'TRIBUTAR_ANTIGO'
      Origin = 'PRODUTOS.TRIBUTAR_ANTIGO'
    end
    object IBQ_PesProdutoTRIBUTAR_FORA_ANTIGO: TIntegerField
      FieldName = 'TRIBUTAR_FORA_ANTIGO'
      Origin = 'PRODUTOS.TRIBUTAR_FORA_ANTIGO'
    end
    object IBQ_PesProdutoPRECO_AGREGADO: TFloatField
      FieldName = 'PRECO_AGREGADO'
      Origin = 'PRODUTOS.PRECO_AGREGADO'
    end
    object IBQ_PesProdutoTRIBUTAR_FORA: TIntegerField
      FieldName = 'TRIBUTAR_FORA'
      Origin = 'PRODUTOS.TRIBUTAR_FORA'
    end
    object IBQ_PesProdutoCST: TIntegerField
      FieldName = 'CST'
      Origin = 'PRODUTOS.CST'
    end
    object IBQ_PesProdutoCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
      Origin = 'PRODUTOS.COMISSAO'
    end
    object IBQ_PesProdutoCOMISPRSN: TIBStringField
      FieldName = 'COMISPRSN'
      Origin = 'PRODUTOS.COMISPRSN'
      Size = 1
    end
    object IBQ_PesProdutoITEMDATASUL: TIBStringField
      FieldName = 'ITEMDATASUL'
      Origin = 'PRODUTOS.ITEMDATASUL'
      Size = 16
    end
    object IBQ_PesProdutoCLASSFISC_DATASUL: TIBStringField
      FieldName = 'CLASSFISC_DATASUL'
      Origin = 'PRODUTOS.CLASSFISC_DATASUL'
      Size = 12
    end
    object IBQ_PesProdutoNATOPERACAO_DATASUL: TIBStringField
      FieldName = 'NATOPERACAO_DATASUL'
      Origin = 'PRODUTOS.NATOPERACAO_DATASUL'
      Size = 8
    end
    object IBQ_PesProdutoUNITEM_DATASUL: TIBStringField
      FieldName = 'UNITEM_DATASUL'
      Origin = 'PRODUTOS.UNITEM_DATASUL'
      Size = 2
    end
    object IBQ_PesProdutoUNFAMI_DATASUL: TIBStringField
      FieldName = 'UNFAMI_DATASUL'
      Origin = 'PRODUTOS.UNFAMI_DATASUL'
      Size = 2
    end
    object IBQ_PesProdutoCODTRIB_DATASUL: TIBStringField
      FieldName = 'CODTRIB_DATASUL'
      Origin = 'PRODUTOS.CODTRIB_DATASUL'
      Size = 2
    end
    object IBQ_PesProdutoPERREDUCAOICMS_DATASUL: TIBStringField
      FieldName = 'PERREDUCAOICMS_DATASUL'
      Origin = 'PRODUTOS.PERREDUCAOICMS_DATASUL'
      Size = 7
    end
    object IBQ_PesProdutoNIVEL_ISENTO: TIntegerField
      FieldName = 'NIVEL_ISENTO'
      Origin = 'PRODUTOS.NIVEL_ISENTO'
    end
    object IBQ_PesProdutoOBSFRENTE: TIBStringField
      FieldName = 'OBSFRENTE'
      Origin = 'PRODUTOS.OBSFRENTE'
      Required = True
      Size = 1
    end
    object IBQ_PesProdutoNCM: TIBStringField
      FieldName = 'NCM'
      Origin = 'PRODUTOS.NCM'
      Size = 8
    end
    object IBQ_PesProdutoBXCARTELA: TIBStringField
      FieldName = 'BXCARTELA'
      Origin = 'PRODUTOS.BXCARTELA'
      Size = 1
    end
    object IBQ_PesProdutoMONTAR: TIBStringField
      FieldName = 'MONTAR'
      Origin = 'PRODUTOS.MONTAR'
      Size = 1
    end
    object IBQ_PesProdutoTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = 'PRODUTOS.TIPO'
      Size = 1
    end
    object IBQ_PesProdutoESTLISTA_SN: TIBStringField
      FieldName = 'ESTLISTA_SN'
      Origin = 'PRODUTOS.ESTLISTA_SN'
      Size = 1
    end
    object IBQ_PesProdutoST_ICMSE: TIntegerField
      FieldName = 'ST_ICMSE'
      Origin = 'PRODUTOS.ST_ICMSE'
    end
    object IBQ_PesProdutoST_ICMSS: TIntegerField
      FieldName = 'ST_ICMSS'
      Origin = 'PRODUTOS.ST_ICMSS'
    end
    object IBQ_PesProdutoST_IPI: TIntegerField
      FieldName = 'ST_IPI'
      Origin = 'PRODUTOS.ST_IPI'
    end
    object IBQ_PesProdutoST_PIS: TIntegerField
      FieldName = 'ST_PIS'
      Origin = 'PRODUTOS.ST_PIS'
    end
    object IBQ_PesProdutoST_COFINS: TIntegerField
      FieldName = 'ST_COFINS'
      Origin = 'PRODUTOS.ST_COFINS'
    end
    object IBQ_PesProdutoICMSS: TFloatField
      FieldName = 'ICMSS'
      Origin = 'PRODUTOS.ICMSS'
    end
    object IBQ_PesProdutoREDS: TFloatField
      FieldName = 'REDS'
      Origin = 'PRODUTOS.REDS'
    end
    object IBQ_PesProdutoIPI: TFloatField
      FieldName = 'IPI'
      Origin = 'PRODUTOS.IPI'
    end
    object IBQ_PesProdutoCODSERVICO: TIBStringField
      FieldName = 'CODSERVICO'
      Origin = 'PRODUTOS.CODSERVICO'
    end
    object IBQ_PesProdutoISSQN: TFloatField
      FieldName = 'ISSQN'
      Origin = 'PRODUTOS.ISSQN'
    end
    object IBQ_PesProdutoCF: TIBStringField
      FieldName = 'CF'
      Origin = 'PRODUTOS.CF'
    end
    object IBQ_PesProdutoEXTIPI: TIBStringField
      FieldName = 'EXTIPI'
      Origin = 'PRODUTOS.EXTIPI'
      Size = 5
    end
    object IBQ_PesProdutoMODALIDADEBC: TIBStringField
      FieldName = 'MODALIDADEBC'
      Origin = 'PRODUTOS.MODALIDADEBC'
      Size = 1
    end
  end
  object HTTPReqResp_CEP: THTTPReqResp
    Agent = 'Borland SOAP 1.1'
    UseUTF8InHeader = False
    InvokeOptions = [soIgnoreInvalidCerts]
    Left = 192
    Top = 8
  end
  object IBQ_Obs2: TIBQuery
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select codigo_id, sequencia, Produto, Observacao from mesaitem'
      'where sequencia = sequencia '
      'and produto = produto'
      'and codigo_id = codigo_id')
    Left = 104
    Top = 64
    object IBQ_Obs2CODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'MESAITEM.CODIGO_ID'
      Required = True
    end
    object IBQ_Obs2SEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'MESAITEM.SEQUENCIA'
    end
    object IBQ_Obs2PRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'MESAITEM.PRODUTO'
    end
    object IBQ_Obs2OBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'MESAITEM.OBSERVACAO'
      BlobType = ftMemo
      Size = 8
    end
  end
  object IBQ_Obs: TIBQuery
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select sequencia, Produto, Observacao from mesaitem'
      'where sequencia = sequencia '
      'and produto = produto')
    Left = 192
    Top = 64
    object IBQ_ObsSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'MESAITEM.SEQUENCIA'
    end
    object IBQ_ObsPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'MESAITEM.PRODUTO'
    end
    object IBQ_ObsOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'MESAITEM.OBSERVACAO'
      BlobType = ftMemo
      Size = 8
    end
  end
  object IBQ_PISCOFINS: TIBQuery
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 296
    Top = 64
  end
  object Timer: TTimer
    Interval = 1
    Left = 104
    Top = 8
  end
  object IBQ_Sequencia: TIBQuery
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select gen_id(GEN_SEQUENCIA_PK,1) as XCod_ID'
      'from rdb$database')
    Left = 580
    Top = 64
    object IBQ_SequenciaXCOD_ID: TLargeintField
      FieldName = 'XCOD_ID'
      Required = True
    end
  end
  object IBT_Produtos: TIBTable
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
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
      end>
    Filter = 'ATIVO='#39'S'#39
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
    Left = 501
    Top = 64
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
      Required = True
      Size = 5
    end
    object IBT_ProdutosDIA_PROD: TIBStringField
      FieldName = 'DIA_PROD'
      Required = True
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
  end
  object IBQ_PesMesaItem: TIBQuery
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from mesaitem')
    Left = 408
    Top = 64
    object IBQ_PesMesaItemCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'MESAITEM.CODIGO_ID'
      Required = True
    end
    object IBQ_PesMesaItemMESA: TIntegerField
      FieldName = 'MESA'
      Origin = 'MESAITEM.MESA'
    end
    object IBQ_PesMesaItemSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'MESAITEM.SEQUENCIA'
    end
    object IBQ_PesMesaItemGARCOM: TIntegerField
      FieldName = 'GARCOM'
      Origin = 'MESAITEM.GARCOM'
    end
    object IBQ_PesMesaItemPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'MESAITEM.PRODUTO'
    end
    object IBQ_PesMesaItemQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      Origin = 'MESAITEM.QUANTIDADE'
    end
    object IBQ_PesMesaItemCANCELADA: TIBStringField
      FieldName = 'CANCELADA'
      Origin = 'MESAITEM.CANCELADA'
      Required = True
      Size = 1
    end
    object IBQ_PesMesaItemIMP_REMOTA: TIBStringField
      FieldName = 'IMP_REMOTA'
      Origin = 'MESAITEM.IMP_REMOTA'
      Required = True
      Size = 1
    end
    object IBQ_PesMesaItemPONTOVENDA: TIntegerField
      FieldName = 'PONTOVENDA'
      Origin = 'MESAITEM.PONTOVENDA'
    end
    object IBQ_PesMesaItemHORA: TIBStringField
      FieldName = 'HORA'
      Origin = 'MESAITEM.HORA'
      Size = 5
    end
    object IBQ_PesMesaItemDATE: TDateField
      FieldName = 'DATE'
      Origin = 'MESAITEM.DATE'
    end
    object IBQ_PesMesaItemMESAFECHA: TIntegerField
      FieldName = 'MESAFECHA'
      Origin = 'MESAITEM.MESAFECHA'
    end
    object IBQ_PesMesaItemSEQFECHA: TIntegerField
      FieldName = 'SEQFECHA'
      Origin = 'MESAITEM.SEQFECHA'
    end
    object IBQ_PesMesaItemGRUPO: TIntegerField
      FieldName = 'GRUPO'
      Origin = 'MESAITEM.GRUPO'
    end
    object IBQ_PesMesaItemPRC_UNITARIO: TFloatField
      FieldName = 'PRC_UNITARIO'
      Origin = 'MESAITEM.PRC_UNITARIO'
    end
    object IBQ_PesMesaItemBALANCA: TIBStringField
      FieldName = 'BALANCA'
      Origin = 'MESAITEM.BALANCA'
      Required = True
      Size = 1
    end
    object IBQ_PesMesaItemHO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'HO'
      Origin = 'MESAITEM.HO'
      ReadOnly = True
      Size = 2
    end
    object IBQ_PesMesaItemTEMPO: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO'
      Origin = 'MESAITEM.TEMPO'
      ReadOnly = True
    end
    object IBQ_PesMesaItemOPCANCEL: TIntegerField
      FieldName = 'OPCANCEL'
      Origin = 'MESAITEM.OPCANCEL'
    end
    object IBQ_PesMesaItemALIQUOTA: TIntegerField
      FieldName = 'ALIQUOTA'
      Origin = 'MESAITEM.ALIQUOTA'
    end
    object IBQ_PesMesaItemDATA_INICIO: TDateField
      FieldName = 'DATA_INICIO'
      Origin = 'MESAITEM.DATA_INICIO'
    end
    object IBQ_PesMesaItemDATA_FINAL: TDateField
      FieldName = 'DATA_FINAL'
      Origin = 'MESAITEM.DATA_FINAL'
    end
    object IBQ_PesMesaItemHORA_INICIO: TIBStringField
      FieldName = 'HORA_INICIO'
      Origin = 'MESAITEM.HORA_INICIO'
      Size = 5
    end
    object IBQ_PesMesaItemHORA_FINAL: TIBStringField
      FieldName = 'HORA_FINAL'
      Origin = 'MESAITEM.HORA_FINAL'
      Size = 5
    end
    object IBQ_PesMesaItemTEMPO_INICIAL: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO_INICIAL'
      Origin = 'MESAITEM.TEMPO_INICIAL'
      ReadOnly = True
    end
    object IBQ_PesMesaItemTEMPO_FINAL: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO_FINAL'
      Origin = 'MESAITEM.TEMPO_FINAL'
      ReadOnly = True
    end
    object IBQ_PesMesaItemDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      Origin = 'MESAITEM.DESCONTO'
    end
    object IBQ_PesMesaItemFINALIZADA: TIBStringField
      FieldName = 'FINALIZADA'
      Origin = 'MESAITEM.FINALIZADA'
      Required = True
      Size = 1
    end
    object IBQ_PesMesaItemOBS: TIBStringField
      FieldName = 'OBS'
      Origin = 'MESAITEM.OBS'
      Size = 255
    end
    object IBQ_PesMesaItemIMP_DIARIA: TIBStringField
      FieldName = 'IMP_DIARIA'
      Origin = 'MESAITEM.IMP_DIARIA'
      Size = 1
    end
    object IBQ_PesMesaItemIMP_CONTINT: TIBStringField
      FieldName = 'IMP_CONTINT'
      Origin = 'MESAITEM.IMP_CONTINT'
      Size = 1
    end
    object IBQ_PesMesaItemIMP_CANCELINT: TIBStringField
      FieldName = 'IMP_CANCELINT'
      Origin = 'MESAITEM.IMP_CANCELINT'
      Size = 1
    end
    object IBQ_PesMesaItemCLIENTEDIARIA: TIntegerField
      FieldName = 'CLIENTEDIARIA'
      Origin = 'MESAITEM.CLIENTEDIARIA'
    end
    object IBQ_PesMesaItemACRESCIMO: TFloatField
      FieldName = 'ACRESCIMO'
      Origin = 'MESAITEM.ACRESCIMO'
    end
    object IBQ_PesMesaItemTAXA: TFloatField
      FieldName = 'TAXA'
      Origin = 'MESAITEM.TAXA'
    end
    object IBQ_PesMesaItemVAL_DESCONTO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_DESCONTO'
      Origin = 'MESAITEM.VAL_DESCONTO'
      ReadOnly = True
    end
    object IBQ_PesMesaItemVAL_ACRESCIMO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_ACRESCIMO'
      Origin = 'MESAITEM.VAL_ACRESCIMO'
      ReadOnly = True
    end
    object IBQ_PesMesaItemVAL_TAXA: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_TAXA'
      Origin = 'MESAITEM.VAL_TAXA'
      ReadOnly = True
    end
    object IBQ_PesMesaItemVAL_PRODUTO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_PRODUTO'
      Origin = 'MESAITEM.VAL_PRODUTO'
      ReadOnly = True
    end
    object IBQ_PesMesaItemOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'MESAITEM.OBSERVACAO'
      BlobType = ftMemo
      Size = 8
    end
  end
  object IBQ_PesCancela: TIBQuery
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from MESAITEM')
    Left = 104
    Top = 132
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
  object IBQ_CondPagtoDesAcre: TIBQuery
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 28
    Top = 132
  end
  object IBQ_Pagamento: TIBQuery
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 296
    Top = 132
  end
  object DTQ_Pesquisa: TDataSource
    DataSet = IBQ_Pesquisa
    Left = 408
    Top = 132
  end
  object IBQ_Pesquisa: TIBQuery
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 501
    Top = 132
  end
  object IBQ_Grava: TIBQuery
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction_Commit
    BufferChunks = 1000
    CachedUpdates = False
    Left = 192
    Top = 132
  end
  object IBQ_TKTSequencia: TIBQuery
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select gen_id(GEN_TKTSEQUENCIA_PK,1) as XCod_ID'
      'from rdb$database')
    Left = 28
    Top = 198
    object IBQ_TKTSequenciaXCOD_ID: TLargeintField
      FieldName = 'XCOD_ID'
      Required = True
    end
  end
  object IBQ_VerFichaFinaliz: TIBQuery
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select max(tempo_final) as FINALIZADO, count(codigo_id) as conta' +
        'dor'
      'from mesaitem'
      'where 1=1'
      'and (MESA = :FICHA)'
      'and (SEQUENCIA = :SEQUENCIA)'
      'and ((cancelada = '#39'N'#39') or (cancelada is null))'
      'and (mesafecha is null)')
    Left = 296
    Top = 198
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FICHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEQUENCIA'
        ParamType = ptUnknown
      end>
    object IBQ_VerFichaFinalizFINALIZADO: TDateTimeField
      FieldName = 'FINALIZADO'
    end
    object IBQ_VerFichaFinalizCONTADOR: TIntegerField
      FieldName = 'CONTADOR'
      Required = True
    end
  end
  object IBQ_AbreFichaFinaliz: TIBQuery
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from FICHA')
    Left = 192
    Top = 198
    object IBQ_AbreFichaFinalizCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'FICHA.CODIGO_ID'
      Required = True
    end
    object IBQ_AbreFichaFinalizFICHA: TIntegerField
      FieldName = 'FICHA'
      Origin = 'FICHA.FICHA'
    end
    object IBQ_AbreFichaFinalizSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'FICHA.SEQUENCIA'
    end
    object IBQ_AbreFichaFinalizSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'FICHA.STATUS'
      Size = 1
    end
    object IBQ_AbreFichaFinalizATIVO: TIBStringField
      FieldName = 'ATIVO'
      Origin = 'FICHA.ATIVO'
      Required = True
      Size = 1
    end
    object IBQ_AbreFichaFinalizCONSULTA: TIBStringField
      FieldName = 'CONSULTA'
      Origin = 'FICHA.CONSULTA'
      Required = True
      Size = 1
    end
    object IBQ_AbreFichaFinalizTRAVA: TIBStringField
      FieldName = 'TRAVA'
      Origin = 'FICHA.TRAVA'
      Required = True
      Size = 1
    end
    object IBQ_AbreFichaFinalizDIGITO: TSmallintField
      FieldName = 'DIGITO'
      Origin = 'FICHA.DIGITO'
    end
    object IBQ_AbreFichaFinalizTP_FICHA: TIBStringField
      FieldName = 'TP_FICHA'
      Origin = 'FICHA.TP_FICHA'
      Size = 1
    end
    object IBQ_AbreFichaFinalizOPERADOR: TIntegerField
      FieldName = 'OPERADOR'
      Origin = 'FICHA.OPERADOR'
    end
    object IBQ_AbreFichaFinalizPRODUCAO: TIBStringField
      FieldName = 'PRODUCAO'
      Origin = 'FICHA.PRODUCAO'
      Required = True
      Size = 1
    end
    object IBQ_AbreFichaFinalizQUARTO: TIBStringField
      FieldName = 'QUARTO'
      Origin = 'FICHA.QUARTO'
      Size = 1
    end
  end
  object IBQ_VerERROFichas: TIBQuery
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from FICHA')
    Left = 408
    Top = 198
  end
  object IBQ_PesqPeriodo: TIBQuery
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select func.DESCRICAO as OPERADOR, tur.DESCRICAO as TURNO'
      'from FUNCIONARIO func'
      '   inner join TURNO tur on (func."turno" = tur.CODIGO_ID)'
      'where UPPER(func.DESCRICAO) = '#39'SILVIA'#39
      '')
    Left = 104
    Top = 198
    object IBQ_PesqPeriodoOPERADOR: TIBStringField
      FieldName = 'OPERADOR'
      Origin = 'FUNCIONARIO.DESCRICAO'
      Size = 60
    end
    object IBQ_PesqPeriodoTURNO: TIBStringField
      FieldName = 'TURNO'
      Origin = 'TURNO.DESCRICAO'
      Size = 60
    end
  end
  object IBQ_CUITEM: TIBQuery
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select item.*, fecha.* from mesaitem item'
      
        'inner join mesafecha fecha on ((item.mesafecha = fecha.mesa) and' +
        ' (item.seqfecha = fecha.sequencia))'
      'where (1=1)')
    Left = 501
    Top = 198
    object IBQ_CUITEMCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'MESAITEM.CODIGO_ID'
      Required = True
    end
    object IBQ_CUITEMMESA: TIntegerField
      FieldName = 'MESA'
      Origin = 'MESAITEM.MESA'
    end
    object IBQ_CUITEMSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'MESAITEM.SEQUENCIA'
    end
    object IBQ_CUITEMGARCOM: TIntegerField
      FieldName = 'GARCOM'
      Origin = 'MESAITEM.GARCOM'
    end
    object IBQ_CUITEMPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'MESAITEM.PRODUTO'
    end
    object IBQ_CUITEMQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      Origin = 'MESAITEM.QUANTIDADE'
    end
    object IBQ_CUITEMCANCELADA: TIBStringField
      FieldName = 'CANCELADA'
      Origin = 'MESAITEM.CANCELADA'
      Required = True
      Size = 1
    end
    object IBQ_CUITEMIMP_REMOTA: TIBStringField
      FieldName = 'IMP_REMOTA'
      Origin = 'MESAITEM.IMP_REMOTA'
      Required = True
      Size = 1
    end
    object IBQ_CUITEMPONTOVENDA: TIntegerField
      FieldName = 'PONTOVENDA'
      Origin = 'MESAITEM.PONTOVENDA'
    end
    object IBQ_CUITEMHORA: TIBStringField
      FieldName = 'HORA'
      Origin = 'MESAITEM.HORA'
      Size = 5
    end
    object IBQ_CUITEMDATE: TDateField
      FieldName = 'DATE'
      Origin = 'MESAITEM.DATE'
    end
    object IBQ_CUITEMMESAFECHA: TIntegerField
      FieldName = 'MESAFECHA'
      Origin = 'MESAITEM.MESAFECHA'
    end
    object IBQ_CUITEMSEQFECHA: TIntegerField
      FieldName = 'SEQFECHA'
      Origin = 'MESAITEM.SEQFECHA'
    end
    object IBQ_CUITEMGRUPO: TIntegerField
      FieldName = 'GRUPO'
      Origin = 'MESAITEM.GRUPO'
    end
    object IBQ_CUITEMPRC_UNITARIO: TFloatField
      FieldName = 'PRC_UNITARIO'
      Origin = 'MESAITEM.PRC_UNITARIO'
    end
    object IBQ_CUITEMBALANCA: TIBStringField
      FieldName = 'BALANCA'
      Origin = 'MESAITEM.BALANCA'
      Required = True
      Size = 1
    end
    object IBQ_CUITEMHO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'HO'
      Origin = 'MESAITEM.HO'
      ReadOnly = True
      Size = 2
    end
    object IBQ_CUITEMTEMPO: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO'
      Origin = 'MESAITEM.TEMPO'
      ReadOnly = True
    end
    object IBQ_CUITEMOPCANCEL: TIntegerField
      FieldName = 'OPCANCEL'
      Origin = 'MESAITEM.OPCANCEL'
    end
    object IBQ_CUITEMALIQUOTA: TIntegerField
      FieldName = 'ALIQUOTA'
      Origin = 'MESAITEM.ALIQUOTA'
    end
    object IBQ_CUITEMDATA_INICIO: TDateField
      FieldName = 'DATA_INICIO'
      Origin = 'MESAITEM.DATA_INICIO'
    end
    object IBQ_CUITEMDATA_FINAL: TDateField
      FieldName = 'DATA_FINAL'
      Origin = 'MESAITEM.DATA_FINAL'
    end
    object IBQ_CUITEMHORA_INICIO: TIBStringField
      FieldName = 'HORA_INICIO'
      Origin = 'MESAITEM.HORA_INICIO'
      Size = 5
    end
    object IBQ_CUITEMHORA_FINAL: TIBStringField
      FieldName = 'HORA_FINAL'
      Origin = 'MESAITEM.HORA_FINAL'
      Size = 5
    end
    object IBQ_CUITEMTEMPO_INICIAL: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO_INICIAL'
      Origin = 'MESAITEM.TEMPO_INICIAL'
      ReadOnly = True
    end
    object IBQ_CUITEMTEMPO_FINAL: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO_FINAL'
      Origin = 'MESAITEM.TEMPO_FINAL'
      ReadOnly = True
    end
    object IBQ_CUITEMDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      Origin = 'MESAITEM.DESCONTO'
    end
    object IBQ_CUITEMFINALIZADA: TIBStringField
      FieldName = 'FINALIZADA'
      Origin = 'MESAITEM.FINALIZADA'
      Required = True
      Size = 1
    end
    object IBQ_CUITEMOBS: TIBStringField
      FieldName = 'OBS'
      Origin = 'MESAITEM.OBS'
      Size = 255
    end
    object IBQ_CUITEMIMP_DIARIA: TIBStringField
      FieldName = 'IMP_DIARIA'
      Origin = 'MESAITEM.IMP_DIARIA'
      Size = 1
    end
    object IBQ_CUITEMIMP_CONTINT: TIBStringField
      FieldName = 'IMP_CONTINT'
      Origin = 'MESAITEM.IMP_CONTINT'
      Size = 1
    end
    object IBQ_CUITEMIMP_CANCELINT: TIBStringField
      FieldName = 'IMP_CANCELINT'
      Origin = 'MESAITEM.IMP_CANCELINT'
      Size = 1
    end
    object IBQ_CUITEMCLIENTEDIARIA: TIntegerField
      FieldName = 'CLIENTEDIARIA'
      Origin = 'MESAITEM.CLIENTEDIARIA'
    end
    object IBQ_CUITEMACRESCIMO: TFloatField
      FieldName = 'ACRESCIMO'
      Origin = 'MESAITEM.ACRESCIMO'
    end
    object IBQ_CUITEMTAXA: TFloatField
      FieldName = 'TAXA'
      Origin = 'MESAITEM.TAXA'
    end
    object IBQ_CUITEMVAL_TAXA: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_TAXA'
      Origin = 'MESAITEM.VAL_TAXA'
      ReadOnly = True
    end
    object IBQ_CUITEMVAL_DESCONTO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_DESCONTO'
      Origin = 'MESAITEM.VAL_DESCONTO'
      ReadOnly = True
    end
    object IBQ_CUITEMVAL_ACRESCIMO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_ACRESCIMO'
      Origin = 'MESAITEM.VAL_ACRESCIMO'
      ReadOnly = True
    end
    object IBQ_CUITEMVAL_PRODUTO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_PRODUTO'
      Origin = 'MESAITEM.VAL_PRODUTO'
      ReadOnly = True
    end
    object IBQ_CUITEMALIQUO: TIBStringField
      FieldName = 'ALIQUO'
      Origin = 'MESAITEM.ALIQUO'
      Size = 4
    end
    object IBQ_CUITEMPIS: TFloatField
      FieldName = 'PIS'
      Origin = 'MESAITEM.PIS'
    end
    object IBQ_CUITEMCOFINS: TFloatField
      FieldName = 'COFINS'
      Origin = 'MESAITEM.COFINS'
    end
    object IBQ_CUITEMICMS: TFloatField
      FieldName = 'ICMS'
      Origin = 'MESAITEM.ICMS'
    end
    object IBQ_CUITEMCOMISSAOPR: TFloatField
      FieldName = 'COMISSAOPR'
      Origin = 'MESAITEM.COMISSAOPR'
    end
    object IBQ_CUITEMCOMISSAOFU: TFloatField
      FieldName = 'COMISSAOFU'
      Origin = 'MESAITEM.COMISSAOFU'
    end
    object IBQ_CUITEMCOMISPRSN: TIBStringField
      FieldName = 'COMISPRSN'
      Origin = 'MESAITEM.COMISPRSN'
      Size = 1
    end
    object IBQ_CUITEMCORTESIA: TIBStringField
      FieldName = 'CORTESIA'
      Origin = 'MESAITEM.CORTESIA'
      Size = 1
    end
    object IBQ_CUITEMTURNO: TIntegerField
      FieldName = 'TURNO'
      Origin = 'MESAITEM.TURNO'
    end
    object IBQ_CUITEMSTATUSCONT: TIBStringField
      FieldName = 'STATUSCONT'
      Origin = 'MESAITEM.STATUSCONT'
      Size = 1
    end
    object IBQ_CUITEMREDUCAO: TFloatField
      FieldName = 'REDUCAO'
      Origin = 'MESAITEM.REDUCAO'
    end
    object IBQ_CUITEMOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'MESAITEM.OBSERVACAO'
      BlobType = ftMemo
      Size = 8
    end
    object IBQ_CUITEMCOMPLEMENTO: TIBStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'MESAITEM.COMPLEMENTO'
      Required = True
      Size = 1
    end
    object IBQ_CUITEMPOSICAO: TIBStringField
      FieldName = 'POSICAO'
      Origin = 'MESAITEM.POSICAO'
      Size = 5
    end
    object IBQ_CUITEMLIGACOMP: TIntegerField
      FieldName = 'LIGACOMP'
      Origin = 'MESAITEM.LIGACOMP'
    end
    object IBQ_CUITEMNIVEL_ISENTO: TIntegerField
      FieldName = 'NIVEL_ISENTO'
      Origin = 'MESAITEM.NIVEL_ISENTO'
    end
    object IBQ_CUITEMIMPRESSO: TIBStringField
      FieldName = 'IMPRESSO'
      Origin = 'MESAITEM.IMPRESSO'
      Size = 1
    end
    object IBQ_CUITEMPESSOAS: TIntegerField
      FieldName = 'PESSOAS'
      Origin = 'MESAITEM.PESSOAS'
    end
    object IBQ_CUITEMCODIGO_ID1: TIntegerField
      FieldName = 'CODIGO_ID1'
      Origin = 'MESAFECHA.CODIGO_ID'
      Required = True
    end
    object IBQ_CUITEMMESA1: TIntegerField
      FieldName = 'MESA1'
      Origin = 'MESAFECHA.MESA'
    end
    object IBQ_CUITEMSEQUENCIA1: TIntegerField
      FieldName = 'SEQUENCIA1'
      Origin = 'MESAFECHA.SEQUENCIA'
    end
    object IBQ_CUITEMVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'MESAFECHA.VALOR'
    end
    object IBQ_CUITEMTROCO: TFloatField
      FieldName = 'TROCO'
      Origin = 'MESAFECHA.TROCO'
    end
    object IBQ_CUITEMTIPO_PAGTO: TIntegerField
      FieldName = 'TIPO_PAGTO'
      Origin = 'MESAFECHA.TIPO_PAGTO'
    end
    object IBQ_CUITEMHORA_PAGTO: TIBStringField
      FieldName = 'HORA_PAGTO'
      Origin = 'MESAFECHA.HORA_PAGTO'
      Size = 5
    end
    object IBQ_CUITEMDATA_PAGTO: TDateField
      FieldName = 'DATA_PAGTO'
      Origin = 'MESAFECHA.DATA_PAGTO'
    end
    object IBQ_CUITEMOPERADOR: TIntegerField
      FieldName = 'OPERADOR'
      Origin = 'MESAFECHA.OPERADOR'
    end
    object IBQ_CUITEMDESCONTO1: TFloatField
      FieldName = 'DESCONTO1'
      Origin = 'MESAFECHA.DESCONTO'
    end
    object IBQ_CUITEMCANCELADO: TIBStringField
      FieldName = 'CANCELADO'
      Origin = 'MESAFECHA.CANCELADO'
      Required = True
      Size = 1
    end
    object IBQ_CUITEMPONTOVENDA1: TIntegerField
      FieldName = 'PONTOVENDA1'
      Origin = 'MESAFECHA.PONTOVENDA'
    end
    object IBQ_CUITEMSEQ_FISCAL: TIBStringField
      FieldName = 'SEQ_FISCAL'
      Origin = 'MESAFECHA.SEQ_FISCAL'
      Size = 15
    end
    object IBQ_CUITEMNUM_CAIXA: TIBStringField
      FieldName = 'NUM_CAIXA'
      Origin = 'MESAFECHA.NUM_CAIXA'
      Size = 15
    end
    object IBQ_CUITEMCOK: TIBStringField
      FieldName = 'COK'
      Origin = 'MESAFECHA.COK'
      Required = True
      Size = 1
    end
    object IBQ_CUITEMMESAFECHA1: TIntegerField
      FieldName = 'MESAFECHA1'
      Origin = 'MESAFECHA.MESAFECHA'
    end
    object IBQ_CUITEMSEQFECHA1: TIntegerField
      FieldName = 'SEQFECHA1'
      Origin = 'MESAFECHA.SEQFECHA'
    end
    object IBQ_CUITEMTEMPO1: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO1'
      Origin = 'MESAFECHA.TEMPO'
      ReadOnly = True
    end
    object IBQ_CUITEMOPCANCEL1: TIntegerField
      FieldName = 'OPCANCEL1'
      Origin = 'MESAFECHA.OPCANCEL'
    end
    object IBQ_CUITEMCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      Origin = 'MESAFECHA.CLIENTE'
    end
    object IBQ_CUITEMVAL_DESCONTOI: TFloatField
      FieldName = 'VAL_DESCONTOI'
      Origin = 'MESAFECHA.VAL_DESCONTOI'
    end
    object IBQ_CUITEMVAL_ACRESCIMOI: TFloatField
      FieldName = 'VAL_ACRESCIMOI'
      Origin = 'MESAFECHA.VAL_ACRESCIMOI'
    end
    object IBQ_CUITEMVAL_TAXAI: TFloatField
      FieldName = 'VAL_TAXAI'
      Origin = 'MESAFECHA.VAL_TAXAI'
    end
    object IBQ_CUITEMCAT_CNPJ: TIBStringField
      FieldName = 'CAT_CNPJ'
      Origin = 'MESAFECHA.CAT_CNPJ'
      Size = 30
    end
    object IBQ_CUITEMCAT_NOME: TIBStringField
      FieldName = 'CAT_NOME'
      Origin = 'MESAFECHA.CAT_NOME'
      Size = 100
    end
    object IBQ_CUITEMCAT_ENDERECO: TIBStringField
      FieldName = 'CAT_ENDERECO'
      Origin = 'MESAFECHA.CAT_ENDERECO'
      Size = 100
    end
    object IBQ_CUITEMNUMSERIEIMPRESSORA: TIBStringField
      FieldName = 'NUMSERIEIMPRESSORA'
      Origin = 'MESAFECHA.NUMSERIEIMPRESSORA'
      Size = 30
    end
    object IBQ_CUITEMCORTESIA1: TIBStringField
      FieldName = 'CORTESIA1'
      Origin = 'MESAFECHA.CORTESIA'
      Size = 1
    end
    object IBQ_CUITEMTURNO1: TIntegerField
      FieldName = 'TURNO1'
      Origin = 'MESAFECHA.TURNO'
    end
    object IBQ_CUITEMIMPRESSO1: TIBStringField
      FieldName = 'IMPRESSO1'
      Origin = 'MESAFECHA.IMPRESSO'
      Size = 1
    end
    object IBQ_CUITEMPESSOAS1: TIntegerField
      FieldName = 'PESSOAS1'
      Origin = 'MESAFECHA.PESSOAS'
    end
    object IBQ_CUITEMDescProduto: TStringField
      FieldKind = fkLookup
      FieldName = 'DescProduto'
      LookupDataSet = FRM_Modulo.IBT_Produtos
      LookupKeyFields = 'CODIGO_ID'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'PRODUTO'
      Size = 60
      Lookup = True
    end
  end
end
