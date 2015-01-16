object FRM_Exportacao: TFRM_Exportacao
  Left = 225
  Top = 162
  BorderStyle = bsDialog
  Caption = 'Gera'#231#227'o dos Arquivos'
  ClientHeight = 204
  ClientWidth = 484
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PNL_Tipos: TPanel
    Left = 0
    Top = 0
    Width = 484
    Height = 125
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 5
    Color = 12615680
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 5
      Top = 5
      Width = 474
      Height = 115
      Align = alClient
      Color = 12615680
      ParentColor = False
      TabOrder = 0
      object CHK_Produtos: TCheckBox
        Left = 5
        Top = 77
        Width = 221
        Height = 17
        Caption = 'Produtos'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        State = cbChecked
        TabOrder = 4
      end
      object CHK_Aliquotas: TCheckBox
        Left = 5
        Top = 9
        Width = 221
        Height = 17
        Caption = 'Aliquotas'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        State = cbChecked
        TabOrder = 0
      end
      object CHK_Clientes: TCheckBox
        Left = 5
        Top = 26
        Width = 221
        Height = 17
        Caption = 'Clientes'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        State = cbChecked
        TabOrder = 1
      end
      object CHK_CondPagto: TCheckBox
        Left = 5
        Top = 43
        Width = 221
        Height = 17
        Caption = 'Cond. Pagto'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        State = cbChecked
        TabOrder = 2
      end
      object CHK_Operadores: TCheckBox
        Left = 5
        Top = 60
        Width = 221
        Height = 17
        Caption = 'Operadores/Usu'#225'rios'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        State = cbChecked
        TabOrder = 3
      end
      object CHK_Vendedores: TCheckBox
        Left = 5
        Top = 94
        Width = 221
        Height = 17
        Caption = 'Vendedores'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        State = cbChecked
        TabOrder = 5
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 125
    Width = 484
    Height = 79
    Align = alBottom
    BevelOuter = bvNone
    Color = 12615680
    TabOrder = 1
    object LBL_Status: TLabel
      Left = 7
      Top = 20
      Width = 473
      Height = 29
      AutoSize = False
      Caption = 'Status...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BTN_Exportar: TButton
      Left = 104
      Top = 52
      Width = 129
      Height = 25
      Caption = '&Exportar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BTN_ExportarClick
    end
    object BTN_Sair: TButton
      Left = 237
      Top = 52
      Width = 129
      Height = 25
      Caption = '&Sair'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BTN_SairClick
    end
    object CHK_CBEMA: TCheckBox
      Left = 10
      Top = -1
      Width = 463
      Height = 17
      Caption = 'Criar / Atualizar c'#243'digo CBEMA'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 2
    end
  end
  object IBQ_Produtos: TIBQuery
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * '
      'from PRODUTOS'
      'order by codigo_id')
    Left = 484
    Top = 12
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
    object IBQ_ProdutosDesUnidade: TStringField
      FieldKind = fkLookup
      FieldName = 'DesUnidade'
      LookupDataSet = FRM_Modulo.IBT_Unidade
      LookupKeyFields = 'CODIGO_ID'
      LookupResultField = 'SIGLA'
      KeyFields = 'UNIDADE'
      Size = 2
      Lookup = True
    end
    object IBQ_ProdutosCBEMA: TLargeintField
      FieldName = 'CBEMA'
      Origin = 'PRODUTOS.CBEMA'
    end
  end
  object DTS_Produtos: TDataSource
    DataSet = IBQ_Produtos
    Left = 512
    Top = 12
  end
  object IBT_Tributar: TIBTable
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
    IndexFieldNames = 'CODIGO_ID'
    MasterFields = 'TRIBUTAR'
    MasterSource = DTS_Produtos
    StoreDefs = True
    TableName = 'TRIBUTAR'
    Left = 540
    Top = 12
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
    end
    object IBT_TributarSITUACAO: TIBStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object IBT_TributarSSITUACAO: TIBStringField
      FieldName = 'SSITUACAO'
      Size = 1
    end
    object IBT_TributarALIQUO: TIBStringField
      FieldName = 'ALIQUO'
      Size = 4
    end
  end
  object IBT_Aliquotas: TIBTable
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TRIBUTAR'
    Left = 484
    Top = 68
    object IBT_AliquotasCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_AliquotasCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Size = 5
    end
    object IBT_AliquotasDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object IBT_AliquotasALIQUOTA: TFloatField
      FieldName = 'ALIQUOTA'
    end
    object IBT_AliquotasSITUACAO: TIBStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object IBT_AliquotasSSITUACAO: TIBStringField
      FieldName = 'SSITUACAO'
      Size = 1
    end
    object IBT_AliquotasALIQUO: TIBStringField
      FieldName = 'ALIQUO'
      Size = 4
    end
  end
  object IBT_Clientes: TIBTable
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'CLIFOR'
    Left = 484
    Top = 40
    object IBT_ClientesCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_ClientesNOMEFANTASIA: TIBStringField
      FieldName = 'NOMEFANTASIA'
      Required = True
      Size = 60
    end
    object IBT_ClientesRAZAOSOCIAL: TIBStringField
      FieldName = 'RAZAOSOCIAL'
      Required = True
      Size = 60
    end
    object IBT_ClientesCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Size = 30
    end
    object IBT_ClientesCPF: TIBStringField
      FieldName = 'CPF'
      Size = 30
    end
    object IBT_ClientesIE: TIBStringField
      FieldName = 'IE'
      Size = 30
    end
    object IBT_ClientesRG: TIBStringField
      FieldName = 'RG'
      Size = 30
    end
    object IBT_ClientesENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object IBT_ClientesBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Size = 60
    end
    object IBT_ClientesCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Size = 60
    end
    object IBT_ClientesTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Size = 30
    end
    object IBT_ClientesFAX: TIBStringField
      FieldName = 'FAX'
      Size = 30
    end
    object IBT_ClientesCONTATO: TIBStringField
      FieldName = 'CONTATO'
      Size = 60
    end
    object IBT_ClientesEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Size = 60
    end
    object IBT_ClientesSITE: TIBStringField
      FieldName = 'SITE'
      Size = 60
    end
    object IBT_ClientesATIVO: TIBStringField
      FieldName = 'ATIVO'
      Size = 1
    end
    object IBT_ClientesCEP: TIBStringField
      FieldName = 'CEP'
      Size = 10
    end
    object IBT_ClientesUF: TIBStringField
      FieldName = 'UF'
      Size = 2
    end
    object IBT_ClientesTIPOCLIFOR: TIBStringField
      FieldName = 'TIPOCLIFOR'
      Size = 1
    end
    object IBT_ClientesMATRICULA: TIBStringField
      FieldName = 'MATRICULA'
      Size = 25
    end
    object IBT_ClientesOBSERVACAO: TBlobField
      FieldName = 'OBSERVACAO'
    end
    object IBT_ClientesSALDO_CASTO: TFloatField
      FieldName = 'SALDO_CASTO'
    end
    object IBT_ClientesSALDO_LIMITE: TFloatField
      FieldName = 'SALDO_LIMITE'
    end
    object IBT_ClientesTRAVAMENSAGEM: TIBStringField
      FieldName = 'TRAVAMENSAGEM'
      Size = 1
    end
    object IBT_ClientesCONTRATO: TIBStringField
      FieldName = 'CONTRATO'
      Size = 1
    end
    object IBT_ClientesDTCADASTRO: TDateField
      FieldName = 'DTCADASTRO'
    end
    object IBT_ClientesCODCONTMATIC: TIBStringField
      FieldName = 'CODCONTMATIC'
    end
    object IBT_ClientesTP_PESSOAL: TIBStringField
      FieldName = 'TP_PESSOAL'
      Size = 1
    end
    object IBT_ClientesCELULAR: TIBStringField
      FieldName = 'CELULAR'
      Size = 30
    end
    object IBT_ClientesDATA_NASC: TDateField
      FieldName = 'DATA_NASC'
    end
  end
  object IBT_Formapagto: TIBTable
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO_ID'
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
      end>
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
    IndexFieldNames = 'CODIGO_ID'
    StoreDefs = True
    TableName = 'FORMAPAGTO'
    Left = 484
    Top = 96
    object IBT_FormapagtoCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_FormapagtoDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
    object IBT_FormapagtoTIPOPAGTO: TIntegerField
      FieldName = 'TIPOPAGTO'
    end
    object IBT_FormapagtoMULTFORM: TIBStringField
      FieldName = 'MULTFORM'
      Size = 1
    end
    object IBT_FormapagtoTEF: TIBStringField
      FieldName = 'TEF'
      Size = 1
    end
    object IBT_FormapagtoTIPO: TIBStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object IBT_FormapagtoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 60
    end
    object IBT_FormapagtoDIAS: TIntegerField
      FieldName = 'DIAS'
    end
    object IBT_FormapagtoQTDTICKET: TIntegerField
      FieldName = 'QTDTICKET'
    end
    object IBT_FormapagtoATIVO: TIBStringField
      FieldName = 'ATIVO'
      Size = 1
    end
    object IBT_FormapagtoACRESCIMO: TFloatField
      FieldName = 'ACRESCIMO'
    end
    object IBT_FormapagtoCORTESIA: TIBStringField
      FieldName = 'CORTESIA'
      Size = 1
    end
    object IBT_FormapagtoDOCVINC: TIBStringField
      FieldName = 'DOCVINC'
      Size = 1
    end
    object IBT_FormapagtoTIPOES: TIBStringField
      FieldName = 'TIPOES'
      Size = 1
    end
  end
  object IBT_FormaParcela: TIBTable
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    IndexFieldNames = 'FORMAPAGTO'
    MasterFields = 'CODIGO_ID'
    MasterSource = DTS_FormaPagto
    TableName = 'FORMAPARCELA'
    Left = 540
    Top = 96
    object IBT_FormaParcelaCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_FormaParcelaFORMAPAGTO: TIntegerField
      FieldName = 'FORMAPAGTO'
      Required = True
    end
    object IBT_FormaParcelaPARCELA: TIntegerField
      FieldName = 'PARCELA'
      Required = True
    end
    object IBT_FormaParcelaDIAS: TIntegerField
      FieldName = 'DIAS'
    end
  end
  object DTS_FormaPagto: TDataSource
    DataSet = IBT_Formapagto
    Left = 512
    Top = 96
  end
  object IBT_Funcionario: TIBTable
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'FUNCIONARIO'
    Left = 484
    Top = 124
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
    object IBT_FuncionarioOBSERVACAO: TBlobField
      FieldName = 'OBSERVACAO'
    end
    object IBT_FuncionarioMOVEL: TIBStringField
      FieldName = 'MOVEL'
      Size = 1
    end
    object IBT_FuncionarioCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
    end
    object IBT_FuncionarioRG: TIBStringField
      FieldName = 'RG'
      Size = 30
    end
    object IBT_FuncionarioCPF: TIBStringField
      FieldName = 'CPF'
      Size = 30
    end
    object IBT_FuncionarioDT_ATESTADO: TDateField
      FieldName = 'DT_ATESTADO'
    end
  end
  object DTS_Funcionario: TDataSource
    DataSet = IBT_Funcionario
    Left = 512
    Top = 124
  end
  object IBT_Usuarios: TIBTable
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    IndexFieldNames = 'FUNCIONARIO'
    MasterFields = 'CODIGO_ID'
    MasterSource = DTS_Funcionario
    TableName = 'USUARIO'
    Left = 540
    Top = 124
    object IBT_UsuariosCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_UsuariosLOGIN: TIBStringField
      FieldName = 'LOGIN'
    end
    object IBT_UsuariosNIVEL: TIntegerField
      FieldName = 'NIVEL'
    end
    object IBT_UsuariosCHPB: TIBStringField
      FieldName = 'CHPB'
    end
    object IBT_UsuariosFUNCIONARIO: TIntegerField
      FieldName = 'FUNCIONARIO'
    end
    object IBT_UsuariosSENHA: TIBStringField
      FieldName = 'SENHA'
      Size = 4
    end
    object IBT_UsuariosARMAZENA: TIBStringField
      FieldName = 'ARMAZENA'
      Size = 4
    end
  end
  object BemaCript: Tcripto
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 456
    Top = 12
  end
  object IBT_TipoPagto: TIBTable
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPOPAGTO'
    Left = 568
    Top = 96
    object IBT_TipoPagtoCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
    end
    object IBT_TipoPagtoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object IBT_TipoPagtoGAVETA: TIBStringField
      FieldName = 'GAVETA'
      Required = True
      Size = 1
    end
    object IBT_TipoPagtoJUROS: TFloatField
      FieldName = 'JUROS'
    end
    object IBT_TipoPagtoNPARCELAS: TIntegerField
      FieldName = 'NPARCELAS'
    end
    object IBT_TipoPagtoINTERDIAS: TIntegerField
      FieldName = 'INTERDIAS'
    end
    object IBT_TipoPagtoPENTRADA: TFloatField
      FieldName = 'PENTRADA'
    end
  end
  object IBT_Produtos: TIBTable
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'PRODUTOS'
    Left = 456
    Top = 40
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
    object IBT_ProdutosCBEMA: TLargeintField
      FieldName = 'CBEMA'
    end
  end
end
