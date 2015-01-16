object FRM_MSE: TFRM_MSE
  Left = 224
  Top = 162
  BorderStyle = bsDialog
  Caption = 'MSE...'
  ClientHeight = 217
  ClientWidth = 657
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 198
    Width = 657
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object MNM_Lista: TMemo
    Left = 0
    Top = 0
    Width = 657
    Height = 198
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
  end
  object PPP_Principal: TPopupMenu
    Left = 626
    Top = 2
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
  object TRM_EscutarPedido: TTimer
    Interval = 100
    OnTimer = TRM_EscutarPedidoTimer
    Left = 2
    Top = 2
  end
  object DataBaseIB: TIBDatabase
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
    Left = 626
    Top = 30
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
    Left = 598
    Top = 30
  end
  object IBQ_Ficha: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select *'
      'from ficha')
    Left = 626
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
  object IBQ_Mesaitem: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select *'
      'from Mesaitem')
    Left = 597
    Top = 60
    object IBQ_MesaitemCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'MESAITEM.CODIGO_ID'
      Required = True
    end
    object IBQ_MesaitemMESA: TIntegerField
      FieldName = 'MESA'
      Origin = 'MESAITEM.MESA'
    end
    object IBQ_MesaitemSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'MESAITEM.SEQUENCIA'
    end
    object IBQ_MesaitemGARCOM: TIntegerField
      FieldName = 'GARCOM'
      Origin = 'MESAITEM.GARCOM'
    end
    object IBQ_MesaitemPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'MESAITEM.PRODUTO'
    end
    object IBQ_MesaitemQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      Origin = 'MESAITEM.QUANTIDADE'
    end
    object IBQ_MesaitemCANCELADA: TIBStringField
      FieldName = 'CANCELADA'
      Origin = 'MESAITEM.CANCELADA'
      Required = True
      Size = 1
    end
    object IBQ_MesaitemIMP_REMOTA: TIBStringField
      FieldName = 'IMP_REMOTA'
      Origin = 'MESAITEM.IMP_REMOTA'
      Required = True
      Size = 1
    end
    object IBQ_MesaitemPONTOVENDA: TIntegerField
      FieldName = 'PONTOVENDA'
      Origin = 'MESAITEM.PONTOVENDA'
    end
    object IBQ_MesaitemHORA: TIBStringField
      FieldName = 'HORA'
      Origin = 'MESAITEM.HORA'
      Size = 5
    end
    object IBQ_MesaitemDATE: TDateField
      FieldName = 'DATE'
      Origin = 'MESAITEM.DATE'
    end
    object IBQ_MesaitemMESAFECHA: TIntegerField
      FieldName = 'MESAFECHA'
      Origin = 'MESAITEM.MESAFECHA'
    end
    object IBQ_MesaitemSEQFECHA: TIntegerField
      FieldName = 'SEQFECHA'
      Origin = 'MESAITEM.SEQFECHA'
    end
    object IBQ_MesaitemGRUPO: TIntegerField
      FieldName = 'GRUPO'
      Origin = 'MESAITEM.GRUPO'
    end
    object IBQ_MesaitemPRC_UNITARIO: TFloatField
      FieldName = 'PRC_UNITARIO'
      Origin = 'MESAITEM.PRC_UNITARIO'
    end
    object IBQ_MesaitemBALANCA: TIBStringField
      FieldName = 'BALANCA'
      Origin = 'MESAITEM.BALANCA'
      Required = True
      Size = 1
    end
    object IBQ_MesaitemHO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'HO'
      Origin = 'MESAITEM.HO'
      ReadOnly = True
      Size = 2
    end
    object IBQ_MesaitemTEMPO: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO'
      Origin = 'MESAITEM.TEMPO'
      ReadOnly = True
    end
    object IBQ_MesaitemOPCANCEL: TIntegerField
      FieldName = 'OPCANCEL'
      Origin = 'MESAITEM.OPCANCEL'
    end
    object IBQ_MesaitemALIQUOTA: TIntegerField
      FieldName = 'ALIQUOTA'
      Origin = 'MESAITEM.ALIQUOTA'
    end
    object IBQ_MesaitemDATA_INICIO: TDateField
      FieldName = 'DATA_INICIO'
      Origin = 'MESAITEM.DATA_INICIO'
    end
    object IBQ_MesaitemDATA_FINAL: TDateField
      FieldName = 'DATA_FINAL'
      Origin = 'MESAITEM.DATA_FINAL'
    end
    object IBQ_MesaitemHORA_INICIO: TIBStringField
      FieldName = 'HORA_INICIO'
      Origin = 'MESAITEM.HORA_INICIO'
      Size = 5
    end
    object IBQ_MesaitemHORA_FINAL: TIBStringField
      FieldName = 'HORA_FINAL'
      Origin = 'MESAITEM.HORA_FINAL'
      Size = 5
    end
    object IBQ_MesaitemTEMPO_INICIAL: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO_INICIAL'
      Origin = 'MESAITEM.TEMPO_INICIAL'
      ReadOnly = True
    end
    object IBQ_MesaitemTEMPO_FINAL: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO_FINAL'
      Origin = 'MESAITEM.TEMPO_FINAL'
      ReadOnly = True
    end
    object IBQ_MesaitemDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      Origin = 'MESAITEM.DESCONTO'
    end
    object IBQ_MesaitemFINALIZADA: TIBStringField
      FieldName = 'FINALIZADA'
      Origin = 'MESAITEM.FINALIZADA'
      Required = True
      Size = 1
    end
    object IBQ_MesaitemOBS: TIBStringField
      FieldName = 'OBS'
      Origin = 'MESAITEM.OBS'
      Size = 255
    end
    object IBQ_MesaitemIMP_DIARIA: TIBStringField
      FieldName = 'IMP_DIARIA'
      Origin = 'MESAITEM.IMP_DIARIA'
      Size = 1
    end
    object IBQ_MesaitemIMP_CONTINT: TIBStringField
      FieldName = 'IMP_CONTINT'
      Origin = 'MESAITEM.IMP_CONTINT'
      Size = 1
    end
    object IBQ_MesaitemIMP_CANCELINT: TIBStringField
      FieldName = 'IMP_CANCELINT'
      Origin = 'MESAITEM.IMP_CANCELINT'
      Size = 1
    end
    object IBQ_MesaitemCLIENTEDIARIA: TIntegerField
      FieldName = 'CLIENTEDIARIA'
      Origin = 'MESAITEM.CLIENTEDIARIA'
    end
    object IBQ_MesaitemACRESCIMO: TFloatField
      FieldName = 'ACRESCIMO'
      Origin = 'MESAITEM.ACRESCIMO'
    end
    object IBQ_MesaitemTAXA: TFloatField
      FieldName = 'TAXA'
      Origin = 'MESAITEM.TAXA'
    end
    object IBQ_MesaitemVAL_TAXA: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_TAXA'
      Origin = 'MESAITEM.VAL_TAXA'
      ReadOnly = True
    end
    object IBQ_MesaitemVAL_DESCONTO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_DESCONTO'
      Origin = 'MESAITEM.VAL_DESCONTO'
      ReadOnly = True
    end
    object IBQ_MesaitemVAL_ACRESCIMO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_ACRESCIMO'
      Origin = 'MESAITEM.VAL_ACRESCIMO'
      ReadOnly = True
    end
    object IBQ_MesaitemVAL_PRODUTO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_PRODUTO'
      Origin = 'MESAITEM.VAL_PRODUTO'
      ReadOnly = True
    end
    object IBQ_MesaitemALIQUO: TIBStringField
      FieldName = 'ALIQUO'
      Origin = 'MESAITEM.ALIQUO'
      Size = 4
    end
    object IBQ_MesaitemPIS: TFloatField
      FieldName = 'PIS'
      Origin = 'MESAITEM.PIS'
    end
    object IBQ_MesaitemCOFINS: TFloatField
      FieldName = 'COFINS'
      Origin = 'MESAITEM.COFINS'
    end
    object IBQ_MesaitemICMS: TFloatField
      FieldName = 'ICMS'
      Origin = 'MESAITEM.ICMS'
    end
    object IBQ_MesaitemCOMISSAOPR: TFloatField
      FieldName = 'COMISSAOPR'
      Origin = 'MESAITEM.COMISSAOPR'
    end
    object IBQ_MesaitemCOMISSAOFU: TFloatField
      FieldName = 'COMISSAOFU'
      Origin = 'MESAITEM.COMISSAOFU'
    end
    object IBQ_MesaitemCOMISPRSN: TIBStringField
      FieldName = 'COMISPRSN'
      Origin = 'MESAITEM.COMISPRSN'
      Size = 1
    end
    object IBQ_MesaitemCORTESIA: TIBStringField
      FieldName = 'CORTESIA'
      Origin = 'MESAITEM.CORTESIA'
      Size = 1
    end
    object IBQ_MesaitemTURNO: TIntegerField
      FieldName = 'TURNO'
      Origin = 'MESAITEM.TURNO'
    end
    object IBQ_MesaitemSTATUSCONT: TIBStringField
      FieldName = 'STATUSCONT'
      Origin = 'MESAITEM.STATUSCONT'
      Size = 1
    end
    object IBQ_MesaitemREDUCAO: TFloatField
      FieldName = 'REDUCAO'
      Origin = 'MESAITEM.REDUCAO'
    end
    object IBQ_MesaitemOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'MESAITEM.OBSERVACAO'
      BlobType = ftMemo
      Size = 8
    end
    object IBQ_MesaitemCOMPLEMENTO: TIBStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'MESAITEM.COMPLEMENTO'
      Required = True
      Size = 1
    end
    object IBQ_MesaitemPOSICAO: TIBStringField
      FieldName = 'POSICAO'
      Origin = 'MESAITEM.POSICAO'
      Size = 5
    end
    object IBQ_MesaitemLIGACOMP: TIntegerField
      FieldName = 'LIGACOMP'
      Origin = 'MESAITEM.LIGACOMP'
    end
    object IBQ_MesaitemNIVEL_ISENTO: TIntegerField
      FieldName = 'NIVEL_ISENTO'
      Origin = 'MESAITEM.NIVEL_ISENTO'
    end
    object IBQ_MesaitemIMPRESSO: TIBStringField
      FieldName = 'IMPRESSO'
      Origin = 'MESAITEM.IMPRESSO'
      Size = 1
    end
    object IBQ_MesaitemPESSOAS: TIntegerField
      FieldName = 'PESSOAS'
      Origin = 'MESAITEM.PESSOAS'
    end
    object IBQ_MesaitemTAXA_MEM: TFloatField
      FieldName = 'TAXA_MEM'
      Origin = 'MESAITEM.TAXA_MEM'
    end
  end
  object IBQ_Bemacash: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from BEMACASH')
    Left = 32
    Top = 2
    object IBQ_BemacashCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'BEMACASH.CODIGO_ID'
      Required = True
    end
    object IBQ_BemacashDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'BEMACASH.DESCRICAO'
      Size = 60
    end
    object IBQ_BemacashORIGEM: TIBStringField
      FieldName = 'ORIGEM'
      Origin = 'BEMACASH.ORIGEM'
      Required = True
      Size = 5
    end
    object IBQ_BemacashID_ORIGEM: TIntegerField
      FieldName = 'ID_ORIGEM'
      Origin = 'BEMACASH.ID_ORIGEM'
      Required = True
    end
    object IBQ_BemacashREF1: TIBStringField
      FieldName = 'REF1'
      Origin = 'BEMACASH.REF1'
      Size = 60
    end
    object IBQ_BemacashREF2: TIBStringField
      FieldName = 'REF2'
      Origin = 'BEMACASH.REF2'
      Size = 60
    end
  end
  object IBQ_ExBemacash: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 32
    Top = 30
  end
  object DTS_Mesaitem: TDataSource
    DataSet = IBQ_Mesaitem
    Left = 568
    Top = 60
  end
  object IBQ_Produtos: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DTS_Mesaitem
    SQL.Strings = (
      'Select *'
      'From produtos'
      'where (Codigo_ID = :Produto)')
    Left = 540
    Top = 60
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Produto'
        ParamType = ptUnknown
      end>
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
    object IBQ_ProdutosCBEMA: TLargeintField
      FieldName = 'CBEMA'
      Origin = 'PRODUTOS.CBEMA'
    end
  end
  object IBQ_SFicha: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select *'
      'from ficha')
    Left = 508
    object IBQ_SFichaCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'FICHA.CODIGO_ID'
      Required = True
    end
    object IBQ_SFichaFICHA: TIntegerField
      FieldName = 'FICHA'
      Origin = 'FICHA.FICHA'
    end
    object IBQ_SFichaSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'FICHA.SEQUENCIA'
    end
    object IBQ_SFichaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'FICHA.STATUS'
      Size = 1
    end
    object IBQ_SFichaATIVO: TIBStringField
      FieldName = 'ATIVO'
      Origin = 'FICHA.ATIVO'
      Required = True
      Size = 1
    end
    object IBQ_SFichaCONSULTA: TIBStringField
      FieldName = 'CONSULTA'
      Origin = 'FICHA.CONSULTA'
      Required = True
      Size = 1
    end
    object IBQ_SFichaTRAVA: TIBStringField
      FieldName = 'TRAVA'
      Origin = 'FICHA.TRAVA'
      Required = True
      Size = 1
    end
    object IBQ_SFichaDIGITO: TSmallintField
      FieldName = 'DIGITO'
      Origin = 'FICHA.DIGITO'
    end
    object IBQ_SFichaTP_FICHA: TIBStringField
      FieldName = 'TP_FICHA'
      Origin = 'FICHA.TP_FICHA'
      Size = 1
    end
    object IBQ_SFichaOPERADOR: TIntegerField
      FieldName = 'OPERADOR'
      Origin = 'FICHA.OPERADOR'
    end
    object IBQ_SFichaPRODUCAO: TIBStringField
      FieldName = 'PRODUCAO'
      Origin = 'FICHA.PRODUCAO'
      Required = True
      Size = 1
    end
    object IBQ_SFichaQUARTO: TIBStringField
      FieldName = 'QUARTO'
      Origin = 'FICHA.QUARTO'
      Size = 1
    end
    object IBQ_SFichaTAXA: TIBStringField
      FieldName = 'TAXA'
      Origin = 'FICHA.TAXA'
      Size = 1
    end
    object IBQ_SFichaMOVEL: TIBStringField
      FieldName = 'MOVEL'
      Origin = 'FICHA.MOVEL'
      Size = 1
    end
    object IBQ_SFichaFINALIZADA: TIBStringField
      FieldName = 'FINALIZADA'
      Origin = 'FICHA.FINALIZADA'
      Size = 1
    end
    object IBQ_SFichaXFICHA: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'XFICHA'
      Origin = 'FICHA.XFICHA'
      ReadOnly = True
      Size = 5
    end
    object IBQ_SFichaIDFICHA: TIBStringField
      FieldName = 'IDFICHA'
      Origin = 'FICHA.IDFICHA'
      Size = 255
    end
    object IBQ_SFichaGARCOM: TIntegerField
      FieldName = 'GARCOM'
      Origin = 'FICHA.GARCOM'
    end
    object IBQ_SFichaFECHANDO: TIBStringField
      FieldName = 'FECHANDO'
      Origin = 'FICHA.FECHANDO'
      Size = 1
    end
  end
end
