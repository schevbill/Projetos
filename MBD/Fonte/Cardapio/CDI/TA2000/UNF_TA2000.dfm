object FRM_TA2000: TFRM_TA2000
  Left = 379
  Top = 177
  Width = 574
  Height = 242
  Caption = 'CDI'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object v: TImage
    Left = 0
    Top = 0
    Width = 566
    Height = 215
    Align = alClient
    AutoSize = True
    Stretch = True
    Transparent = True
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
    Left = 358
  end
  object DataBaseIB: TIBDatabase
    DatabaseName = 'C:\SVN\Cardapio\CDI\DB\CDI.GDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=sysdbambd')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    AllowStreamedConnected = False
    Left = 386
  end
  object IBQ_Gravar: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 414
  end
  object ZConnection: TZConnection
    Protocol = 'mysql-5'
    HostName = '186.202.13.3'
    Port = 3306
    Database = 'mbd9'
    User = 'mbd9'
    Password = 'masterkey'
    Catalog = 'mbd9'
    ReadOnly = True
    SQLHourGlass = True
    Left = 4
    Top = 4
  end
  object ZQRY_Cliente: TZQuery
    Connection = ZConnection
    CachedUpdates = True
    SQL.Strings = (
      'select *'
      'from CLIFOR')
    Params = <>
    Left = 4
    Top = 32
    object ZQRY_ClienteCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object ZQRY_ClienteNOMEFANTASIA: TStringField
      FieldName = 'NOMEFANTASIA'
      Size = 60
    end
    object ZQRY_ClienteRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object ZQRY_ClienteCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 30
    end
    object ZQRY_ClienteCPF: TStringField
      FieldName = 'CPF'
      Size = 30
    end
    object ZQRY_ClienteIE: TStringField
      FieldName = 'IE'
      Size = 30
    end
    object ZQRY_ClienteRG: TStringField
      FieldName = 'RG'
      Size = 30
    end
    object ZQRY_ClienteENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object ZQRY_ClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 60
    end
    object ZQRY_ClienteCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 60
    end
    object ZQRY_ClienteTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 30
    end
    object ZQRY_ClienteFAX: TStringField
      FieldName = 'FAX'
      Size = 30
    end
    object ZQRY_ClienteCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 60
    end
    object ZQRY_ClienteSITE: TStringField
      FieldName = 'SITE'
      Size = 60
    end
    object ZQRY_ClienteATIVO: TStringField
      FieldName = 'ATIVO'
      Size = 1
    end
    object ZQRY_ClienteCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object ZQRY_ClienteUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object ZQRY_ClienteTIPOCLIFOR: TStringField
      FieldName = 'TIPOCLIFOR'
      Size = 1
    end
    object ZQRY_ClienteMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 25
    end
    object ZQRY_ClienteOBSERVACAO: TBlobField
      FieldName = 'OBSERVACAO'
    end
    object ZQRY_ClienteSALDO_CASTO: TFloatField
      FieldName = 'SALDO_CASTO'
    end
    object ZQRY_ClienteSALDO_LIMITE: TFloatField
      FieldName = 'SALDO_LIMITE'
    end
    object ZQRY_ClienteTRAVAMENSAGEM: TStringField
      FieldName = 'TRAVAMENSAGEM'
      Size = 1
    end
    object ZQRY_ClienteCONTRATO: TStringField
      FieldName = 'CONTRATO'
      Size = 1
    end
    object ZQRY_ClienteDTCADASTRO: TDateField
      FieldName = 'DTCADASTRO'
    end
    object ZQRY_ClienteCODCONTMATIC: TStringField
      FieldName = 'CODCONTMATIC'
    end
    object ZQRY_ClienteTP_PESSOAL: TStringField
      FieldName = 'TP_PESSOAL'
      Size = 1
    end
    object ZQRY_ClienteCELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 30
    end
    object ZQRY_ClienteDATA_NASC: TDateField
      FieldName = 'DATA_NASC'
    end
    object ZQRY_ClienteCONVENIO: TIntegerField
      FieldName = 'CONVENIO'
    end
    object ZQRY_ClienteDT_VENCFINANCLI: TIntegerField
      FieldName = 'DT_VENCFINANCLI'
    end
    object ZQRY_ClientePAIS: TStringField
      FieldName = 'PAIS'
      Size = 60
    end
    object ZQRY_ClienteBACEN: TStringField
      FieldName = 'BACEN'
      Size = 4
    end
    object ZQRY_ClienteNUMEROCASA: TStringField
      FieldName = 'NUMEROCASA'
      Size = 30
    end
    object ZQRY_ClienteCOD_IBGE_CIDADE: TStringField
      FieldName = 'COD_IBGE_CIDADE'
      Size = 7
    end
    object ZQRY_ClienteSUFRAMA: TStringField
      FieldName = 'SUFRAMA'
      Size = 15
    end
    object ZQRY_ClienteTEL_DELIVERY: TStringField
      FieldName = 'TEL_DELIVERY'
      Size = 30
    end
    object ZQRY_ClienteMENSALISTAS_N: TStringField
      FieldName = 'MENSALISTAS_N'
      Size = 1
    end
    object ZQRY_ClienteDT_ALTERACAO: TDateField
      FieldName = 'DT_ALTERACAO'
    end
    object ZQRY_ClienteSEXO: TStringField
      FieldName = 'SEXO'
      Size = 1
    end
    object ZQRY_ClienteDATA_MODIF: TDateField
      FieldName = 'DATA_MODIF'
    end
    object ZQRY_ClienteEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 60
    end
  end
  object IBT_Clientes: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 358
    Top = 32
  end
  object IBT_Parametros: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'PARAMETROS'
    Left = 386
    Top = 32
    object IBT_ParametrosCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_ParametrosHOST: TIBStringField
      FieldName = 'HOST'
      Size = 255
    end
    object IBT_ParametrosPORTA: TIntegerField
      FieldName = 'PORTA'
    end
    object IBT_ParametrosDATABASE: TIBStringField
      FieldName = 'DATABASE'
      Size = 255
    end
    object IBT_ParametrosLOGIN: TIBStringField
      FieldName = 'LOGIN'
      Size = 32
    end
    object IBT_ParametrosSENHA: TIBStringField
      FieldName = 'SENHA'
      Size = 32
    end
    object IBT_ParametrosPONTOVENDA: TIntegerField
      FieldName = 'PONTOVENDA'
    end
    object IBT_ParametrosPDDESCRICAO: TIBStringField
      FieldName = 'PDDESCRICAO'
      Size = 255
    end
    object IBT_ParametrosPDCHAVE: TIBStringField
      FieldName = 'PDCHAVE'
      Size = 32
    end
  end
  object CDS_Ingresso: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Evento'
        DataType = ftInteger
      end
      item
        Name = 'Lote'
        DataType = ftInteger
      end
      item
        Name = 'CPF'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'Sexo'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'QTD'
        DataType = ftFloat
      end
      item
        Name = 'Total'
        DataType = ftFloat
      end
      item
        Name = 'NumIngresso'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Data'
        DataType = ftTimeStamp
      end
      item
        Name = 'cLote'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 360
    Top = 64
    Data = {
      D40000009619E0BD020000001800000009000000000003000000D40006457665
      6E746F0400010000000000044C6F746504000100000000000343504601004900
      00000100055749445448020002000D00045365786F0100490000000100055749
      44544802000200020003515444080004000000000005546F74616C0800040000
      0000000B4E756D496E67726573736F0100490000000100055749445448020002
      001400044461746110001100000001000753554254595045020049000A00466F
      726D61747465640005634C6F746504000100000000000000}
    object CDS_IngressoEvento: TIntegerField
      FieldName = 'Evento'
    end
    object CDS_IngressoLote: TIntegerField
      FieldName = 'Lote'
    end
    object CDS_IngressoCPF: TStringField
      FieldName = 'CPF'
      Size = 13
    end
    object CDS_IngressoSexo: TStringField
      FieldName = 'Sexo'
      Size = 2
    end
    object CDS_IngressoQTD: TFloatField
      FieldName = 'QTD'
    end
    object CDS_IngressoTotal: TFloatField
      FieldName = 'Total'
    end
    object CDS_IngressoNumIngresso: TStringField
      FieldName = 'NumIngresso'
    end
    object CDS_IngressoData: TSQLTimeStampField
      FieldName = 'Data'
    end
    object CDS_IngressocLote: TIntegerField
      FieldName = 'cLote'
    end
  end
  object IBQ_Evento: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from EVENTO')
    Left = 388
    Top = 64
    object IBQ_EventoCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'EVENTO.CODIGO_ID'
      Required = True
    end
    object IBQ_EventoCIDMASTER: TIntegerField
      FieldName = 'CIDMASTER'
      Origin = 'EVENTO.CIDMASTER'
    end
    object IBQ_EventoCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'EVENTO.CODIGO'
      Size = 6
    end
    object IBQ_EventoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'EVENTO.DESCRICAO'
      Size = 255
    end
    object IBQ_EventoDT_ATUALIZA: TDateField
      FieldName = 'DT_ATUALIZA'
      Origin = 'EVENTO.DT_ATUALIZA'
    end
    object IBQ_EventoDATA_SHOW: TDateField
      FieldName = 'DATA_SHOW'
      Origin = 'EVENTO.DATA_SHOW'
    end
    object IBQ_EventoTOTAL_INGR_F: TIntegerField
      FieldName = 'TOTAL_INGR_F'
      Origin = 'EVENTO.TOTAL_INGR_F'
    end
    object IBQ_EventoTOTAL_INGR_M: TIntegerField
      FieldName = 'TOTAL_INGR_M'
      Origin = 'EVENTO.TOTAL_INGR_M'
    end
    object IBQ_EventoMSG_LIVRE: TIBStringField
      FieldName = 'MSG_LIVRE'
      Origin = 'EVENTO.MSG_LIVRE'
      Size = 150
    end
    object IBQ_EventoATIVO_SN: TIBStringField
      FieldName = 'ATIVO_SN'
      Origin = 'EVENTO.ATIVO_SN'
      Size = 1
    end
    object IBQ_EventoOBS: TIBStringField
      FieldName = 'OBS'
      Origin = 'EVENTO.OBS'
      Size = 40
    end
    object IBQ_EventoTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = 'EVENTO.TIPO'
    end
  end
  object IBQ_Lote: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from LOTE'
      'Where EVENTO = :CIDMASTER')
    Left = 416
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CIDMASTER'
        ParamType = ptUnknown
      end>
    object IBQ_LoteCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'LOTE.CODIGO_ID'
      Required = True
    end
    object IBQ_LoteCDIMESTRE: TIntegerField
      FieldName = 'CDIMESTRE'
      Origin = 'LOTE.CDIMESTRE'
    end
    object IBQ_LotePONTOVENDA: TIntegerField
      FieldName = 'PONTOVENDA'
      Origin = 'LOTE.PONTOVENDA'
    end
    object IBQ_LoteDT_ATUALIZA: TDateField
      FieldName = 'DT_ATUALIZA'
      Origin = 'LOTE.DT_ATUALIZA'
    end
    object IBQ_LoteDT_INICIO: TDateField
      FieldName = 'DT_INICIO'
      Origin = 'LOTE.DT_INICIO'
    end
    object IBQ_LoteDT_FIM: TDateField
      FieldName = 'DT_FIM'
      Origin = 'LOTE.DT_FIM'
    end
    object IBQ_LoteNUM_ING_M: TIntegerField
      FieldName = 'NUM_ING_M'
      Origin = 'LOTE.NUM_ING_M'
    end
    object IBQ_LoteNUM_ING_F: TIntegerField
      FieldName = 'NUM_ING_F'
      Origin = 'LOTE.NUM_ING_F'
    end
    object IBQ_LoteVAL_ING_M: TFloatField
      FieldName = 'VAL_ING_M'
      Origin = 'LOTE.VAL_ING_M'
    end
    object IBQ_LoteVAL_ING_F: TFloatField
      FieldName = 'VAL_ING_F'
      Origin = 'LOTE.VAL_ING_F'
    end
    object IBQ_LoteVEN_ING_M: TIntegerField
      FieldName = 'VEN_ING_M'
      Origin = 'LOTE.VEN_ING_M'
    end
    object IBQ_LoteVEN_ING_F: TIntegerField
      FieldName = 'VEN_ING_F'
      Origin = 'LOTE.VEN_ING_F'
    end
    object IBQ_LoteEVENTO: TIntegerField
      FieldName = 'EVENTO'
      Origin = 'LOTE.EVENTO'
    end
    object IBQ_LoteCLOTE: TIntegerField
      FieldName = 'CLOTE'
      Origin = 'LOTE.CLOTE'
    end
    object IBQ_LoteUNIFICADO: TIBStringField
      FieldName = 'UNIFICADO'
      Origin = 'LOTE.UNIFICADO'
      Size = 1
    end
    object IBQ_LoteALLPDV: TIBStringField
      FieldName = 'ALLPDV'
      Origin = 'LOTE.ALLPDV'
      Size = 1
    end
  end
  object ZQRY_Evento: TZQuery
    Connection = ZConnection
    CachedUpdates = True
    SQL.Strings = (
      'select *'
      'from EVENTO')
    Params = <>
    Left = 4
    Top = 60
    object ZQRY_EventoCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object ZQRY_EventoCIDMASTER: TIntegerField
      FieldName = 'CIDMASTER'
    end
    object ZQRY_EventoCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 6
    end
    object ZQRY_EventoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 255
    end
    object ZQRY_EventoDT_ATUALIZA: TDateField
      FieldName = 'DT_ATUALIZA'
    end
    object ZQRY_EventoDATA_SHOW: TDateField
      FieldName = 'DATA_SHOW'
    end
    object ZQRY_EventoTOTAL_INGR_F: TIntegerField
      FieldName = 'TOTAL_INGR_F'
    end
    object ZQRY_EventoTOTAL_INGR_M: TIntegerField
      FieldName = 'TOTAL_INGR_M'
    end
    object ZQRY_EventoMSG_LIVRE: TStringField
      FieldName = 'MSG_LIVRE'
      Size = 150
    end
    object ZQRY_EventoATIVO_SN: TStringField
      FieldName = 'ATIVO_SN'
      Size = 1
    end
    object ZQRY_EventoOBS: TStringField
      FieldName = 'OBS'
      Size = 40
    end
    object ZQRY_EventoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
    end
  end
  object ZQRY_Lote: TZQuery
    Connection = ZConnection
    CachedUpdates = True
    SQL.Strings = (
      'select *'
      'from LOTE')
    Params = <>
    Left = 4
    Top = 88
    object ZQRY_LoteCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object ZQRY_LoteCDIMESTRE: TIntegerField
      FieldName = 'CDIMESTRE'
    end
    object ZQRY_LotePONTOVENDA: TIntegerField
      FieldName = 'PONTOVENDA'
    end
    object ZQRY_LoteDT_ATUALIZA: TDateField
      FieldName = 'DT_ATUALIZA'
    end
    object ZQRY_LoteDT_INICIO: TDateField
      FieldName = 'DT_INICIO'
    end
    object ZQRY_LoteDT_FIM: TDateField
      FieldName = 'DT_FIM'
    end
    object ZQRY_LoteNUM_ING_M: TIntegerField
      FieldName = 'NUM_ING_M'
    end
    object ZQRY_LoteNUM_ING_F: TIntegerField
      FieldName = 'NUM_ING_F'
    end
    object ZQRY_LoteVAL_ING_M: TFloatField
      FieldName = 'VAL_ING_M'
    end
    object ZQRY_LoteVAL_ING_F: TFloatField
      FieldName = 'VAL_ING_F'
    end
    object ZQRY_LoteVEN_ING_M: TIntegerField
      FieldName = 'VEN_ING_M'
    end
    object ZQRY_LoteVEN_ING_F: TIntegerField
      FieldName = 'VEN_ING_F'
    end
    object ZQRY_LoteEVENTO: TIntegerField
      FieldName = 'EVENTO'
    end
    object ZQRY_LoteCLOTE: TIntegerField
      FieldName = 'CLOTE'
      Required = True
    end
    object ZQRY_LoteUNIFICADO: TStringField
      FieldName = 'UNIFICADO'
      Size = 1
    end
    object ZQRY_LoteALLPDV: TStringField
      FieldName = 'ALLPDV'
      Size = 1
    end
  end
  object IBQ_Pesquisa: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 443
  end
  object ZQRY_Versao: TZQuery
    Connection = ZConnection
    CachedUpdates = True
    SQL.Strings = (
      'select *'
      'from VERSAO')
    Params = <>
    Left = 4
    Top = 116
    object ZQRY_VersaoPONTOVENDA: TIntegerField
      FieldName = 'PONTOVENDA'
    end
    object ZQRY_VersaoCLIFOR: TDateTimeField
      FieldName = 'CLIFOR'
      Required = True
    end
    object ZQRY_VersaoEVENTO: TDateTimeField
      FieldName = 'EVENTO'
      Required = True
    end
    object ZQRY_VersaoLOTE: TDateTimeField
      FieldName = 'LOTE'
      Required = True
    end
  end
  object IBQ_Clientes: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from VCLIENTES')
    Left = 444
    Top = 64
    object IBQ_ClientesCNPJ: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'CNPJ'
      Origin = 'VCLIENTES.CNPJ'
      ReadOnly = True
      Size = 30
    end
    object IBQ_ClientesCPF: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'CPF'
      Origin = 'VCLIENTES.CPF'
      ReadOnly = True
      Size = 30
    end
    object IBQ_ClientesIE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'IE'
      Origin = 'VCLIENTES.IE'
      ReadOnly = True
      Size = 30
    end
    object IBQ_ClientesRG: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'RG'
      Origin = 'VCLIENTES.RG'
      ReadOnly = True
      Size = 30
    end
    object IBQ_ClientesNOMEFANTASIA: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'NOMEFANTASIA'
      Origin = 'VCLIENTES.NOMEFANTASIA'
      ReadOnly = True
      Size = 60
    end
    object IBQ_ClientesRAZAOSOCIAL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'RAZAOSOCIAL'
      Origin = 'VCLIENTES.RAZAOSOCIAL'
      ReadOnly = True
      Size = 60
    end
    object IBQ_ClientesEMAIL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'EMAIL'
      Origin = 'VCLIENTES.EMAIL'
      ReadOnly = True
      Size = 60
    end
    object IBQ_ClientesCELULAR: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'CELULAR'
      Origin = 'VCLIENTES.CELULAR'
      ReadOnly = True
      Size = 30
    end
    object IBQ_ClientesCIDADE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'CIDADE'
      Origin = 'VCLIENTES.CIDADE'
      ReadOnly = True
      Size = 60
    end
    object IBQ_ClientesSEXO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'SEXO'
      Origin = 'VCLIENTES.SEXO'
      ReadOnly = True
      Size = 1
    end
  end
  object IBT_Ingresso: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'INGRESSO'
    Left = 413
    Top = 32
    object IBT_IngressoCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_IngressoPONTOVENDA: TIntegerField
      FieldName = 'PONTOVENDA'
    end
    object IBT_IngressoEVENTO: TIntegerField
      FieldName = 'EVENTO'
    end
    object IBT_IngressoLOTE: TIntegerField
      FieldName = 'LOTE'
    end
    object IBT_IngressoDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object IBT_IngressoNUMINGRESSO: TIBStringField
      FieldName = 'NUMINGRESSO'
      Size = 32
    end
    object IBT_IngressoCPF: TIBStringField
      FieldName = 'CPF'
      Size = 30
    end
    object IBT_IngressoCHAVE: TIBStringField
      FieldName = 'CHAVE'
      Size = 32
    end
    object IBT_IngressoVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object IBT_IngressoQTD: TFloatField
      FieldName = 'QTD'
    end
    object IBT_IngressoDT_ENVIO: TDateTimeField
      FieldName = 'DT_ENVIO'
    end
    object IBT_IngressoSEXO: TIBStringField
      FieldName = 'SEXO'
      Size = 1
    end
    object IBT_IngressoCINGRESSO: TIntegerField
      FieldName = 'CINGRESSO'
    end
  end
  object IBQ_cIngresso: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select max(cIngresso) as cIngresso '
      'from ingresso')
    Left = 472
    Top = 64
    object IBQ_cIngressoCINGRESSO: TIntegerField
      FieldName = 'CINGRESSO'
    end
  end
  object ZQRY_Gravar: TZQuery
    Connection = ZConnection
    CachedUpdates = True
    SQL.Strings = (
      'select *'
      'from CLIFOR')
    Params = <>
    Left = 32
    Top = 4
    object IntegerField1: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'NOMEFANTASIA'
      Size = 60
    end
    object StringField2: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object StringField3: TStringField
      FieldName = 'CNPJ'
      Size = 30
    end
    object StringField4: TStringField
      FieldName = 'CPF'
      Size = 30
    end
    object StringField5: TStringField
      FieldName = 'IE'
      Size = 30
    end
    object StringField6: TStringField
      FieldName = 'RG'
      Size = 30
    end
    object StringField7: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object StringField8: TStringField
      FieldName = 'BAIRRO'
      Size = 60
    end
    object StringField9: TStringField
      FieldName = 'CIDADE'
      Size = 60
    end
    object StringField10: TStringField
      FieldName = 'TELEFONE'
      Size = 30
    end
    object StringField11: TStringField
      FieldName = 'FAX'
      Size = 30
    end
    object StringField12: TStringField
      FieldName = 'CONTATO'
      Size = 60
    end
    object StringField13: TStringField
      FieldName = 'EMAIL'
      Size = 60
    end
    object StringField14: TStringField
      FieldName = 'SITE'
      Size = 60
    end
    object StringField15: TStringField
      FieldName = 'ATIVO'
      Size = 1
    end
    object StringField16: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object StringField17: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object StringField18: TStringField
      FieldName = 'TIPOCLIFOR'
      Size = 1
    end
    object StringField19: TStringField
      FieldName = 'MATRICULA'
      Size = 25
    end
    object BlobField1: TBlobField
      FieldName = 'OBSERVACAO'
    end
    object FloatField1: TFloatField
      FieldName = 'SALDO_CASTO'
    end
    object FloatField2: TFloatField
      FieldName = 'SALDO_LIMITE'
    end
    object StringField20: TStringField
      FieldName = 'TRAVAMENSAGEM'
      Size = 1
    end
    object StringField21: TStringField
      FieldName = 'CONTRATO'
      Size = 1
    end
    object DateField1: TDateField
      FieldName = 'DTCADASTRO'
    end
    object StringField22: TStringField
      FieldName = 'CODCONTMATIC'
    end
    object StringField23: TStringField
      FieldName = 'TP_PESSOAL'
      Size = 1
    end
    object StringField24: TStringField
      FieldName = 'CELULAR'
      Size = 30
    end
    object DateField2: TDateField
      FieldName = 'DATA_NASC'
    end
    object IntegerField2: TIntegerField
      FieldName = 'CONVENIO'
    end
    object IntegerField3: TIntegerField
      FieldName = 'DT_VENCFINANCLI'
    end
    object StringField25: TStringField
      FieldName = 'PAIS'
      Size = 60
    end
    object StringField26: TStringField
      FieldName = 'BACEN'
      Size = 4
    end
    object StringField27: TStringField
      FieldName = 'NUMEROCASA'
      Size = 30
    end
    object StringField28: TStringField
      FieldName = 'COD_IBGE_CIDADE'
      Size = 7
    end
    object StringField29: TStringField
      FieldName = 'SUFRAMA'
      Size = 15
    end
    object StringField30: TStringField
      FieldName = 'TEL_DELIVERY'
      Size = 30
    end
    object StringField31: TStringField
      FieldName = 'MENSALISTAS_N'
      Size = 1
    end
    object DateField3: TDateField
      FieldName = 'DT_ALTERACAO'
    end
    object StringField32: TStringField
      FieldName = 'SEXO'
      Size = 1
    end
  end
  object IBQ_ImpIgresso: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from ingresso')
    Left = 388
    Top = 92
    object IBQ_ImpIgressoCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'INGRESSO.CODIGO_ID'
      Required = True
    end
    object IBQ_ImpIgressoPONTOVENDA: TIntegerField
      FieldName = 'PONTOVENDA'
      Origin = 'INGRESSO.PONTOVENDA'
    end
    object IBQ_ImpIgressoEVENTO: TIntegerField
      FieldName = 'EVENTO'
      Origin = 'INGRESSO.EVENTO'
    end
    object IBQ_ImpIgressoLOTE: TIntegerField
      FieldName = 'LOTE'
      Origin = 'INGRESSO.LOTE'
    end
    object IBQ_ImpIgressoDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'INGRESSO.DATA'
    end
    object IBQ_ImpIgressoNUMINGRESSO: TIBStringField
      FieldName = 'NUMINGRESSO'
      Origin = 'INGRESSO.NUMINGRESSO'
      Size = 32
    end
    object IBQ_ImpIgressoCPF: TIBStringField
      FieldName = 'CPF'
      Origin = 'INGRESSO.CPF'
      Size = 30
    end
    object IBQ_ImpIgressoCHAVE: TIBStringField
      FieldName = 'CHAVE'
      Origin = 'INGRESSO.CHAVE'
      Size = 32
    end
    object IBQ_ImpIgressoVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'INGRESSO.VALOR'
    end
    object IBQ_ImpIgressoQTD: TFloatField
      FieldName = 'QTD'
      Origin = 'INGRESSO.QTD'
    end
    object IBQ_ImpIgressoDT_ENVIO: TDateTimeField
      FieldName = 'DT_ENVIO'
      Origin = 'INGRESSO.DT_ENVIO'
    end
    object IBQ_ImpIgressoSEXO: TIBStringField
      FieldName = 'SEXO'
      Origin = 'INGRESSO.SEXO'
      Size = 1
    end
    object IBQ_ImpIgressoCINGRESSO: TIntegerField
      FieldName = 'CINGRESSO'
      Origin = 'INGRESSO.CINGRESSO'
    end
    object IBQ_ImpIgressonome_cli: TStringField
      FieldKind = fkLookup
      FieldName = 'nome_cli'
      LookupDataSet = IBT_Cliente
      LookupKeyFields = 'CPF'
      LookupResultField = 'NOMEFANTASIA'
      KeyFields = 'CPF'
      Size = 120
      Lookup = True
    end
  end
  object IBT_Evento: TIBTable
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
        Name = 'CIDMASTER'
        DataType = ftInteger
      end
      item
        Name = 'CODIGO'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'DT_ATUALIZA'
        DataType = ftDate
      end
      item
        Name = 'DATA_SHOW'
        DataType = ftDate
      end
      item
        Name = 'TOTAL_INGR_F'
        DataType = ftInteger
      end
      item
        Name = 'TOTAL_INGR_M'
        DataType = ftInteger
      end
      item
        Name = 'MSG_LIVRE'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'ATIVO_SN'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'OBS'
        DataType = ftString
        Size = 40
      end>
    StoreDefs = True
    TableName = 'EVENTO'
    Left = 444
    Top = 92
    object IBT_EventoCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object IBT_EventoCIDMASTER: TIntegerField
      FieldName = 'CIDMASTER'
    end
    object IBT_EventoCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Size = 6
    end
    object IBT_EventoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 255
    end
    object IBT_EventoDT_ATUALIZA: TDateField
      FieldName = 'DT_ATUALIZA'
    end
  end
  object IBT_Cliente: TIBTable
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'CLIFOR'
    Left = 416
    Top = 92
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
      Size = 30
    end
    object IBT_ClienteCPF: TIBStringField
      FieldName = 'CPF'
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
    object IBT_ClienteCODCONTMATIC: TIBStringField
      FieldName = 'CODCONTMATIC'
    end
    object IBT_ClienteTP_PESSOAL: TIBStringField
      FieldName = 'TP_PESSOAL'
      Size = 1
    end
    object IBT_ClienteCELULAR: TIBStringField
      FieldName = 'CELULAR'
      Size = 30
    end
    object IBT_ClienteDATA_NASC: TDateField
      FieldName = 'DATA_NASC'
    end
    object IBT_ClienteCONVENIO: TIntegerField
      FieldName = 'CONVENIO'
    end
    object IBT_ClienteDT_VENCFINANCLI: TIntegerField
      FieldName = 'DT_VENCFINANCLI'
    end
    object IBT_ClientePAIS: TIBStringField
      FieldName = 'PAIS'
      Size = 60
    end
    object IBT_ClienteBACEN: TIBStringField
      FieldName = 'BACEN'
      Size = 4
    end
    object IBT_ClienteNUMEROCASA: TIBStringField
      FieldName = 'NUMEROCASA'
      Size = 30
    end
    object IBT_ClienteCOD_IBGE_CIDADE: TIBStringField
      FieldName = 'COD_IBGE_CIDADE'
      Size = 7
    end
    object IBT_ClienteSUFRAMA: TIBStringField
      FieldName = 'SUFRAMA'
      Size = 15
    end
    object IBT_ClienteTEL_DELIVERY: TIBStringField
      FieldName = 'TEL_DELIVERY'
      Size = 30
    end
    object IBT_ClienteMENSALISTAS_N: TIBStringField
      FieldName = 'MENSALISTAS_N'
      Size = 1
    end
    object IBT_ClienteDT_ALTERACAO: TDateField
      FieldName = 'DT_ALTERACAO'
    end
    object IBT_ClienteSEXO: TIBStringField
      FieldName = 'SEXO'
      Size = 1
    end
  end
  object TRM_Focar: TTimer
    OnTimer = TRM_FocarTimer
    Left = 4
    Top = 144
  end
  object ZQRY_PontoVenda: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'select * from PONTOVENDA')
    Params = <>
    Left = 32
    Top = 32
    object ZQRY_PontoVendaCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Required = True
    end
    object ZQRY_PontoVendaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
  end
  object IBQ_Ingressos: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select evento,lote,sexo,count(qtd) QTD,valor from ingresso'
      'group by evento,lote,sexo,Valor')
    Left = 389
    Top = 120
    object IBQ_IngressosEVENTO: TIntegerField
      FieldName = 'EVENTO'
      Origin = 'INGRESSO.EVENTO'
    end
    object IBQ_IngressosSEXO: TIBStringField
      FieldName = 'SEXO'
      Origin = 'INGRESSO.SEXO'
      Size = 1
    end
    object IBQ_IngressosVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'INGRESSO.VALOR'
    end
    object IBQ_IngressosdesEvento: TStringField
      FieldKind = fkLookup
      FieldName = 'desEvento'
      LookupDataSet = IBQ_Evento
      LookupKeyFields = 'CODIGO_ID'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'EVENTO'
      Size = 100
      Lookup = True
    end
    object IBQ_IngressosLOTE: TIntegerField
      FieldName = 'LOTE'
      Origin = 'INGRESSO.LOTE'
    end
    object IBQ_IngressosQTD: TIntegerField
      FieldName = 'QTD'
      Required = True
    end
  end
  object IBQ_CountIngresso: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select count(*) from INGRESSO')
    Left = 444
    Top = 120
    object IBQ_CountIngressoCOUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
  object ZQL_CountIng: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'select count(*) from INGRESSO')
    Params = <>
    Left = 32
    Top = 59
    object ZQL_CountIngcount: TLargeintField
      FieldName = 'count(*)'
      ReadOnly = True
    end
  end
  object ZQRY_ING: TZQuery
    Connection = ZConnection
    SQL.Strings = (
      'select sum(qtd) as tot_vend, sexo'
      'from INGRESSO'
      'where 1=1'
      'and evento = 1'
      'and lote = 1'
      'group by sexo')
    Params = <>
    Left = 32
    Top = 88
    object ZQRY_INGtot_vend: TFloatField
      FieldName = 'tot_vend'
      ReadOnly = True
    end
    object ZQRY_INGsexo: TStringField
      FieldName = 'sexo'
      Required = True
      Size = 1
    end
  end
  object IBQ_ING: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select Evento, Lote'
      'from INGRESSO'
      'where 1=1'
      ''
      'group by Evento, Lote')
    Left = 500
    Top = 64
    object IBQ_INGEVENTO: TIntegerField
      FieldName = 'EVENTO'
      Origin = 'INGRESSO.EVENTO'
    end
    object IBQ_INGLOTE: TIntegerField
      FieldName = 'LOTE'
      Origin = 'INGRESSO.LOTE'
    end
  end
  object IBQ_SumLote: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select sum(NUM_ING_F-VEN_ING_F) tot_F,sum(NUM_ING_M-VEN_ING_M) t' +
        'ot_M  from lote'
      'where evento = 1'
      'and ((pontovenda = 2) or (allpdv = '#39'S'#39'))'
      
        'and (((NUM_ING_F-VEN_ING_F) > 0) and ((NUM_ING_M-VEN_ING_M) > 0)' +
        ')')
    Left = 528
    Top = 64
    object IBQ_SumLoteTOT_F: TLargeintField
      FieldName = 'TOT_F'
    end
    object IBQ_SumLoteTOT_M: TLargeintField
      FieldName = 'TOT_M'
    end
  end
  object IBQ_CountIngCPF: TIBQuery
    Database = DataBaseIB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select count(*) from INGRESSO')
    Left = 476
    Top = 120
    object IBQ_CountIngCPFCOUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
end
