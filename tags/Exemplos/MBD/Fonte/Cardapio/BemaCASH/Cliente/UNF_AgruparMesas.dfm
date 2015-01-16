object FRM_AgruparMesas: TFRM_AgruparMesas
  Left = 256
  Top = 162
  BorderStyle = bsDialog
  Caption = 'Agrupar Mesas'
  ClientHeight = 313
  ClientWidth = 374
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PNL_Topo: TPanel
    Left = 0
    Top = 0
    Width = 374
    Height = 60
    Align = alTop
    BevelOuter = bvNone
    Color = 12615680
    TabOrder = 0
    object Label1: TLabel
      Left = 11
      Top = 7
      Width = 123
      Height = 18
      Caption = 'Ficha / Mesa :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EDT_Mesa: TEdit
      Left = 11
      Top = 27
      Width = 353
      Height = 32
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyPress = EDT_MesaKeyPress
    end
  end
  object PNL_Lista: TPanel
    Left = 0
    Top = 60
    Width = 374
    Height = 220
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 10
    Color = 12615680
    TabOrder = 1
    object MNM_Mesas: TMemo
      Left = 10
      Top = 10
      Width = 354
      Height = 200
      Align = alClient
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 280
    Width = 374
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    Color = 12615680
    TabOrder = 2
    object BTN_Agrupar: TButton
      Left = 52
      Top = 5
      Width = 109
      Height = 25
      Caption = 'Agrupar (&+)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BTN_AgruparClick
    end
    object BTN_Sair: TButton
      Left = 200
      Top = 5
      Width = 109
      Height = 25
      Caption = 'Sair (&-)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BTN_SairClick
    end
  end
  object CDS_Mesa: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Ficha'
        DataType = ftInteger
      end
      item
        Name = 'Sequencia'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 12
    Top = 72
    Data = {
      3A0000009619E0BD0100000018000000020000000000030000003A0005466963
      686104000100000000000953657175656E63696104000100000000000000}
    object CDS_MesaFicha: TIntegerField
      FieldName = 'Ficha'
    end
    object CDS_MesaSequencia: TIntegerField
      FieldName = 'Sequencia'
    end
  end
  object IBQ_FichaTransf: TIBQuery
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * '
      'from Ficha'
      'where (Quarto = '#39'S'#39')')
    Left = 45
    Top = 75
    object IBQ_FichaTransfCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'FICHA.CODIGO_ID'
      Required = True
    end
    object IBQ_FichaTransfFICHA: TIntegerField
      FieldName = 'FICHA'
      Origin = 'FICHA.FICHA'
    end
    object IBQ_FichaTransfSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'FICHA.SEQUENCIA'
    end
    object IBQ_FichaTransfSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'FICHA.STATUS'
      Size = 1
    end
    object IBQ_FichaTransfATIVO: TIBStringField
      FieldName = 'ATIVO'
      Origin = 'FICHA.ATIVO'
      Required = True
      Size = 1
    end
    object IBQ_FichaTransfCONSULTA: TIBStringField
      FieldName = 'CONSULTA'
      Origin = 'FICHA.CONSULTA'
      Required = True
      Size = 1
    end
    object IBQ_FichaTransfTRAVA: TIBStringField
      FieldName = 'TRAVA'
      Origin = 'FICHA.TRAVA'
      Required = True
      Size = 1
    end
    object IBQ_FichaTransfDIGITO: TSmallintField
      FieldName = 'DIGITO'
      Origin = 'FICHA.DIGITO'
    end
    object IBQ_FichaTransfTP_FICHA: TIBStringField
      FieldName = 'TP_FICHA'
      Origin = 'FICHA.TP_FICHA'
      Size = 1
    end
    object IBQ_FichaTransfOPERADOR: TIntegerField
      FieldName = 'OPERADOR'
      Origin = 'FICHA.OPERADOR'
    end
    object IBQ_FichaTransfPRODUCAO: TIBStringField
      FieldName = 'PRODUCAO'
      Origin = 'FICHA.PRODUCAO'
      Required = True
      Size = 1
    end
  end
  object IBQ_FichaTransf_: TIBQuery
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from Ficha'
      'Where (Quarto = '#39'S'#39')')
    Left = 73
    Top = 75
    object IBQ_FichaTransf_CODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'FICHA.CODIGO_ID'
      Required = True
    end
    object IBQ_FichaTransf_FICHA: TIntegerField
      FieldName = 'FICHA'
      Origin = 'FICHA.FICHA'
    end
    object IBQ_FichaTransf_SEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'FICHA.SEQUENCIA'
    end
    object IBQ_FichaTransf_STATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'FICHA.STATUS'
      Size = 1
    end
    object IBQ_FichaTransf_ATIVO: TIBStringField
      FieldName = 'ATIVO'
      Origin = 'FICHA.ATIVO'
      Required = True
      Size = 1
    end
    object IBQ_FichaTransf_CONSULTA: TIBStringField
      FieldName = 'CONSULTA'
      Origin = 'FICHA.CONSULTA'
      Required = True
      Size = 1
    end
    object IBQ_FichaTransf_TRAVA: TIBStringField
      FieldName = 'TRAVA'
      Origin = 'FICHA.TRAVA'
      Required = True
      Size = 1
    end
    object IBQ_FichaTransf_DIGITO: TSmallintField
      FieldName = 'DIGITO'
      Origin = 'FICHA.DIGITO'
    end
    object IBQ_FichaTransf_TP_FICHA: TIBStringField
      FieldName = 'TP_FICHA'
      Origin = 'FICHA.TP_FICHA'
      Size = 1
    end
    object IBQ_FichaTransf_OPERADOR: TIntegerField
      FieldName = 'OPERADOR'
      Origin = 'FICHA.OPERADOR'
    end
    object IBQ_FichaTransf_PRODUCAO: TIBStringField
      FieldName = 'PRODUCAO'
      Origin = 'FICHA.PRODUCAO'
      Required = True
      Size = 1
    end
    object IBQ_FichaTransf_QUARTO: TIBStringField
      FieldName = 'QUARTO'
      Origin = 'FICHA.QUARTO'
      Size = 1
    end
    object IBQ_FichaTransf_TAXA: TIBStringField
      FieldName = 'TAXA'
      Origin = 'FICHA.TAXA'
      Size = 1
    end
  end
  object IBQ_BFichaDestino: TIBQuery
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from Mesaitem')
    Left = 73
    Top = 103
    object IBQ_BFichaDestinoCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'MESAITEM.CODIGO_ID'
      Required = True
    end
    object IBQ_BFichaDestinoMESA: TIntegerField
      FieldName = 'MESA'
      Origin = 'MESAITEM.MESA'
    end
    object IBQ_BFichaDestinoSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'MESAITEM.SEQUENCIA'
    end
    object IBQ_BFichaDestinoGARCOM: TIntegerField
      FieldName = 'GARCOM'
      Origin = 'MESAITEM.GARCOM'
    end
    object IBQ_BFichaDestinoPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'MESAITEM.PRODUTO'
    end
    object IBQ_BFichaDestinoQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      Origin = 'MESAITEM.QUANTIDADE'
    end
    object IBQ_BFichaDestinoCANCELADA: TIBStringField
      FieldName = 'CANCELADA'
      Origin = 'MESAITEM.CANCELADA'
      Required = True
      Size = 1
    end
    object IBQ_BFichaDestinoIMP_REMOTA: TIBStringField
      FieldName = 'IMP_REMOTA'
      Origin = 'MESAITEM.IMP_REMOTA'
      Required = True
      Size = 1
    end
    object IBQ_BFichaDestinoPONTOVENDA: TIntegerField
      FieldName = 'PONTOVENDA'
      Origin = 'MESAITEM.PONTOVENDA'
    end
    object IBQ_BFichaDestinoHORA: TIBStringField
      FieldName = 'HORA'
      Origin = 'MESAITEM.HORA'
      Size = 5
    end
    object IBQ_BFichaDestinoDATE: TDateField
      FieldName = 'DATE'
      Origin = 'MESAITEM.DATE'
    end
    object IBQ_BFichaDestinoMESAFECHA: TIntegerField
      FieldName = 'MESAFECHA'
      Origin = 'MESAITEM.MESAFECHA'
    end
    object IBQ_BFichaDestinoSEQFECHA: TIntegerField
      FieldName = 'SEQFECHA'
      Origin = 'MESAITEM.SEQFECHA'
    end
    object IBQ_BFichaDestinoGRUPO: TIntegerField
      FieldName = 'GRUPO'
      Origin = 'MESAITEM.GRUPO'
    end
    object IBQ_BFichaDestinoPRC_UNITARIO: TFloatField
      FieldName = 'PRC_UNITARIO'
      Origin = 'MESAITEM.PRC_UNITARIO'
    end
    object IBQ_BFichaDestinoBALANCA: TIBStringField
      FieldName = 'BALANCA'
      Origin = 'MESAITEM.BALANCA'
      Required = True
      Size = 1
    end
    object IBQ_BFichaDestinoHO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'HO'
      Origin = 'MESAITEM.HO'
      ReadOnly = True
      Size = 2
    end
    object IBQ_BFichaDestinoTEMPO: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO'
      Origin = 'MESAITEM.TEMPO'
      ReadOnly = True
    end
    object IBQ_BFichaDestinoOPCANCEL: TIntegerField
      FieldName = 'OPCANCEL'
      Origin = 'MESAITEM.OPCANCEL'
    end
    object IBQ_BFichaDestinoALIQUOTA: TIntegerField
      FieldName = 'ALIQUOTA'
      Origin = 'MESAITEM.ALIQUOTA'
    end
    object IBQ_BFichaDestinoDATA_INICIO: TDateField
      FieldName = 'DATA_INICIO'
      Origin = 'MESAITEM.DATA_INICIO'
    end
    object IBQ_BFichaDestinoDATA_FINAL: TDateField
      FieldName = 'DATA_FINAL'
      Origin = 'MESAITEM.DATA_FINAL'
    end
    object IBQ_BFichaDestinoHORA_INICIO: TIBStringField
      FieldName = 'HORA_INICIO'
      Origin = 'MESAITEM.HORA_INICIO'
      Size = 5
    end
    object IBQ_BFichaDestinoHORA_FINAL: TIBStringField
      FieldName = 'HORA_FINAL'
      Origin = 'MESAITEM.HORA_FINAL'
      Size = 5
    end
    object IBQ_BFichaDestinoTEMPO_INICIAL: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO_INICIAL'
      Origin = 'MESAITEM.TEMPO_INICIAL'
      ReadOnly = True
    end
    object IBQ_BFichaDestinoTEMPO_FINAL: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO_FINAL'
      Origin = 'MESAITEM.TEMPO_FINAL'
      ReadOnly = True
    end
    object IBQ_BFichaDestinoDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      Origin = 'MESAITEM.DESCONTO'
    end
    object IBQ_BFichaDestinoFINALIZADA: TIBStringField
      FieldName = 'FINALIZADA'
      Origin = 'MESAITEM.FINALIZADA'
      Required = True
      Size = 1
    end
    object IBQ_BFichaDestinoOBS: TIBStringField
      FieldName = 'OBS'
      Origin = 'MESAITEM.OBS'
      Size = 255
    end
    object IBQ_BFichaDestinoIMP_DIARIA: TIBStringField
      FieldName = 'IMP_DIARIA'
      Origin = 'MESAITEM.IMP_DIARIA'
      Size = 1
    end
    object IBQ_BFichaDestinoIMP_CONTINT: TIBStringField
      FieldName = 'IMP_CONTINT'
      Origin = 'MESAITEM.IMP_CONTINT'
      Size = 1
    end
    object IBQ_BFichaDestinoIMP_CANCELINT: TIBStringField
      FieldName = 'IMP_CANCELINT'
      Origin = 'MESAITEM.IMP_CANCELINT'
      Size = 1
    end
    object IBQ_BFichaDestinoCLIENTEDIARIA: TIntegerField
      FieldName = 'CLIENTEDIARIA'
      Origin = 'MESAITEM.CLIENTEDIARIA'
    end
    object IBQ_BFichaDestinoACRESCIMO: TFloatField
      FieldName = 'ACRESCIMO'
      Origin = 'MESAITEM.ACRESCIMO'
    end
    object IBQ_BFichaDestinoTAXA: TFloatField
      FieldName = 'TAXA'
      Origin = 'MESAITEM.TAXA'
    end
    object IBQ_BFichaDestinoVAL_TAXA: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_TAXA'
      Origin = 'MESAITEM.VAL_TAXA'
      ReadOnly = True
    end
    object IBQ_BFichaDestinoVAL_DESCONTO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_DESCONTO'
      Origin = 'MESAITEM.VAL_DESCONTO'
      ReadOnly = True
    end
    object IBQ_BFichaDestinoVAL_ACRESCIMO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_ACRESCIMO'
      Origin = 'MESAITEM.VAL_ACRESCIMO'
      ReadOnly = True
    end
    object IBQ_BFichaDestinoVAL_PRODUTO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_PRODUTO'
      Origin = 'MESAITEM.VAL_PRODUTO'
      ReadOnly = True
    end
  end
  object IBQ_ItensDiariaTrans: TIBQuery
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from MESAITEM')
    Left = 59
    Top = 115
    object IBQ_ItensDiariaTransCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'MESAITEM.CODIGO_ID'
      Required = True
    end
    object IBQ_ItensDiariaTransMESA: TIntegerField
      FieldName = 'MESA'
      Origin = 'MESAITEM.MESA'
    end
    object IBQ_ItensDiariaTransSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'MESAITEM.SEQUENCIA'
    end
    object IBQ_ItensDiariaTransGARCOM: TIntegerField
      FieldName = 'GARCOM'
      Origin = 'MESAITEM.GARCOM'
    end
    object IBQ_ItensDiariaTransPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'MESAITEM.PRODUTO'
    end
    object IBQ_ItensDiariaTransQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      Origin = 'MESAITEM.QUANTIDADE'
    end
    object IBQ_ItensDiariaTransCANCELADA: TIBStringField
      FieldName = 'CANCELADA'
      Origin = 'MESAITEM.CANCELADA'
      Required = True
      Size = 1
    end
    object IBQ_ItensDiariaTransIMP_REMOTA: TIBStringField
      FieldName = 'IMP_REMOTA'
      Origin = 'MESAITEM.IMP_REMOTA'
      Required = True
      Size = 1
    end
    object IBQ_ItensDiariaTransPONTOVENDA: TIntegerField
      FieldName = 'PONTOVENDA'
      Origin = 'MESAITEM.PONTOVENDA'
    end
    object IBQ_ItensDiariaTransHORA: TIBStringField
      FieldName = 'HORA'
      Origin = 'MESAITEM.HORA'
      Size = 5
    end
    object IBQ_ItensDiariaTransDATE: TDateField
      FieldName = 'DATE'
      Origin = 'MESAITEM.DATE'
    end
    object IBQ_ItensDiariaTransMESAFECHA: TIntegerField
      FieldName = 'MESAFECHA'
      Origin = 'MESAITEM.MESAFECHA'
    end
    object IBQ_ItensDiariaTransSEQFECHA: TIntegerField
      FieldName = 'SEQFECHA'
      Origin = 'MESAITEM.SEQFECHA'
    end
    object IBQ_ItensDiariaTransGRUPO: TIntegerField
      FieldName = 'GRUPO'
      Origin = 'MESAITEM.GRUPO'
    end
    object IBQ_ItensDiariaTransPRC_UNITARIO: TFloatField
      FieldName = 'PRC_UNITARIO'
      Origin = 'MESAITEM.PRC_UNITARIO'
    end
    object IBQ_ItensDiariaTransBALANCA: TIBStringField
      FieldName = 'BALANCA'
      Origin = 'MESAITEM.BALANCA'
      Required = True
      Size = 1
    end
    object IBQ_ItensDiariaTransHO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'HO'
      Origin = 'MESAITEM.HO'
      ReadOnly = True
      Size = 2
    end
    object IBQ_ItensDiariaTransTEMPO: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO'
      Origin = 'MESAITEM.TEMPO'
      ReadOnly = True
    end
    object IBQ_ItensDiariaTransOPCANCEL: TIntegerField
      FieldName = 'OPCANCEL'
      Origin = 'MESAITEM.OPCANCEL'
    end
    object IBQ_ItensDiariaTransALIQUOTA: TIntegerField
      FieldName = 'ALIQUOTA'
      Origin = 'MESAITEM.ALIQUOTA'
    end
    object IBQ_ItensDiariaTransDATA_INICIO: TDateField
      FieldName = 'DATA_INICIO'
      Origin = 'MESAITEM.DATA_INICIO'
    end
    object IBQ_ItensDiariaTransDATA_FINAL: TDateField
      FieldName = 'DATA_FINAL'
      Origin = 'MESAITEM.DATA_FINAL'
    end
    object IBQ_ItensDiariaTransHORA_INICIO: TIBStringField
      FieldName = 'HORA_INICIO'
      Origin = 'MESAITEM.HORA_INICIO'
      Size = 5
    end
    object IBQ_ItensDiariaTransHORA_FINAL: TIBStringField
      FieldName = 'HORA_FINAL'
      Origin = 'MESAITEM.HORA_FINAL'
      Size = 5
    end
    object IBQ_ItensDiariaTransTEMPO_INICIAL: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO_INICIAL'
      Origin = 'MESAITEM.TEMPO_INICIAL'
      ReadOnly = True
    end
    object IBQ_ItensDiariaTransTEMPO_FINAL: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO_FINAL'
      Origin = 'MESAITEM.TEMPO_FINAL'
      ReadOnly = True
    end
    object IBQ_ItensDiariaTransDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      Origin = 'MESAITEM.DESCONTO'
    end
    object IBQ_ItensDiariaTransFINALIZADA: TIBStringField
      FieldName = 'FINALIZADA'
      Origin = 'MESAITEM.FINALIZADA'
      Required = True
      Size = 1
    end
    object IBQ_ItensDiariaTransOBS: TIBStringField
      FieldName = 'OBS'
      Origin = 'MESAITEM.OBS'
      Size = 255
    end
    object IBQ_ItensDiariaTransIMP_DIARIA: TIBStringField
      FieldName = 'IMP_DIARIA'
      Origin = 'MESAITEM.IMP_DIARIA'
      Size = 1
    end
    object IBQ_ItensDiariaTransIMP_CONTINT: TIBStringField
      FieldName = 'IMP_CONTINT'
      Origin = 'MESAITEM.IMP_CONTINT'
      Size = 1
    end
    object IBQ_ItensDiariaTransIMP_CANCELINT: TIBStringField
      FieldName = 'IMP_CANCELINT'
      Origin = 'MESAITEM.IMP_CANCELINT'
      Size = 1
    end
    object IBQ_ItensDiariaTransCLIENTEDIARIA: TIntegerField
      FieldName = 'CLIENTEDIARIA'
      Origin = 'MESAITEM.CLIENTEDIARIA'
    end
    object IBQ_ItensDiariaTransACRESCIMO: TFloatField
      FieldName = 'ACRESCIMO'
      Origin = 'MESAITEM.ACRESCIMO'
    end
    object IBQ_ItensDiariaTransTAXA: TFloatField
      FieldName = 'TAXA'
      Origin = 'MESAITEM.TAXA'
    end
    object IBQ_ItensDiariaTransVAL_TAXA: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_TAXA'
      Origin = 'MESAITEM.VAL_TAXA'
      ReadOnly = True
    end
    object IBQ_ItensDiariaTransVAL_DESCONTO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_DESCONTO'
      Origin = 'MESAITEM.VAL_DESCONTO'
      ReadOnly = True
    end
    object IBQ_ItensDiariaTransVAL_ACRESCIMO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_ACRESCIMO'
      Origin = 'MESAITEM.VAL_ACRESCIMO'
      ReadOnly = True
    end
    object IBQ_ItensDiariaTransVAL_PRODUTO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_PRODUTO'
      Origin = 'MESAITEM.VAL_PRODUTO'
      ReadOnly = True
    end
  end
  object IBQ_BFichaOrigem: TIBQuery
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from Mesaitem')
    Left = 45
    Top = 103
    object IBQ_BFichaOrigemCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'MESAITEM.CODIGO_ID'
      Required = True
    end
    object IBQ_BFichaOrigemMESA: TIntegerField
      FieldName = 'MESA'
      Origin = 'MESAITEM.MESA'
    end
    object IBQ_BFichaOrigemSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'MESAITEM.SEQUENCIA'
    end
    object IBQ_BFichaOrigemGARCOM: TIntegerField
      FieldName = 'GARCOM'
      Origin = 'MESAITEM.GARCOM'
    end
    object IBQ_BFichaOrigemPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'MESAITEM.PRODUTO'
    end
    object IBQ_BFichaOrigemQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      Origin = 'MESAITEM.QUANTIDADE'
    end
    object IBQ_BFichaOrigemCANCELADA: TIBStringField
      FieldName = 'CANCELADA'
      Origin = 'MESAITEM.CANCELADA'
      Required = True
      Size = 1
    end
    object IBQ_BFichaOrigemIMP_REMOTA: TIBStringField
      FieldName = 'IMP_REMOTA'
      Origin = 'MESAITEM.IMP_REMOTA'
      Required = True
      Size = 1
    end
    object IBQ_BFichaOrigemPONTOVENDA: TIntegerField
      FieldName = 'PONTOVENDA'
      Origin = 'MESAITEM.PONTOVENDA'
    end
    object IBQ_BFichaOrigemHORA: TIBStringField
      FieldName = 'HORA'
      Origin = 'MESAITEM.HORA'
      Size = 5
    end
    object IBQ_BFichaOrigemDATE: TDateField
      FieldName = 'DATE'
      Origin = 'MESAITEM.DATE'
    end
    object IBQ_BFichaOrigemMESAFECHA: TIntegerField
      FieldName = 'MESAFECHA'
      Origin = 'MESAITEM.MESAFECHA'
    end
    object IBQ_BFichaOrigemSEQFECHA: TIntegerField
      FieldName = 'SEQFECHA'
      Origin = 'MESAITEM.SEQFECHA'
    end
    object IBQ_BFichaOrigemGRUPO: TIntegerField
      FieldName = 'GRUPO'
      Origin = 'MESAITEM.GRUPO'
    end
    object IBQ_BFichaOrigemPRC_UNITARIO: TFloatField
      FieldName = 'PRC_UNITARIO'
      Origin = 'MESAITEM.PRC_UNITARIO'
    end
    object IBQ_BFichaOrigemBALANCA: TIBStringField
      FieldName = 'BALANCA'
      Origin = 'MESAITEM.BALANCA'
      Required = True
      Size = 1
    end
    object IBQ_BFichaOrigemHO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'HO'
      Origin = 'MESAITEM.HO'
      ReadOnly = True
      Size = 2
    end
    object IBQ_BFichaOrigemTEMPO: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO'
      Origin = 'MESAITEM.TEMPO'
      ReadOnly = True
    end
    object IBQ_BFichaOrigemOPCANCEL: TIntegerField
      FieldName = 'OPCANCEL'
      Origin = 'MESAITEM.OPCANCEL'
    end
    object IBQ_BFichaOrigemALIQUOTA: TIntegerField
      FieldName = 'ALIQUOTA'
      Origin = 'MESAITEM.ALIQUOTA'
    end
    object IBQ_BFichaOrigemDATA_INICIO: TDateField
      FieldName = 'DATA_INICIO'
      Origin = 'MESAITEM.DATA_INICIO'
    end
    object IBQ_BFichaOrigemDATA_FINAL: TDateField
      FieldName = 'DATA_FINAL'
      Origin = 'MESAITEM.DATA_FINAL'
    end
    object IBQ_BFichaOrigemHORA_INICIO: TIBStringField
      FieldName = 'HORA_INICIO'
      Origin = 'MESAITEM.HORA_INICIO'
      Size = 5
    end
    object IBQ_BFichaOrigemHORA_FINAL: TIBStringField
      FieldName = 'HORA_FINAL'
      Origin = 'MESAITEM.HORA_FINAL'
      Size = 5
    end
    object IBQ_BFichaOrigemTEMPO_INICIAL: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO_INICIAL'
      Origin = 'MESAITEM.TEMPO_INICIAL'
      ReadOnly = True
    end
    object IBQ_BFichaOrigemTEMPO_FINAL: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO_FINAL'
      Origin = 'MESAITEM.TEMPO_FINAL'
      ReadOnly = True
    end
    object IBQ_BFichaOrigemDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      Origin = 'MESAITEM.DESCONTO'
    end
    object IBQ_BFichaOrigemFINALIZADA: TIBStringField
      FieldName = 'FINALIZADA'
      Origin = 'MESAITEM.FINALIZADA'
      Required = True
      Size = 1
    end
    object IBQ_BFichaOrigemOBS: TIBStringField
      FieldName = 'OBS'
      Origin = 'MESAITEM.OBS'
      Size = 255
    end
    object IBQ_BFichaOrigemIMP_DIARIA: TIBStringField
      FieldName = 'IMP_DIARIA'
      Origin = 'MESAITEM.IMP_DIARIA'
      Size = 1
    end
    object IBQ_BFichaOrigemIMP_CONTINT: TIBStringField
      FieldName = 'IMP_CONTINT'
      Origin = 'MESAITEM.IMP_CONTINT'
      Size = 1
    end
    object IBQ_BFichaOrigemIMP_CANCELINT: TIBStringField
      FieldName = 'IMP_CANCELINT'
      Origin = 'MESAITEM.IMP_CANCELINT'
      Size = 1
    end
    object IBQ_BFichaOrigemCLIENTEDIARIA: TIntegerField
      FieldName = 'CLIENTEDIARIA'
      Origin = 'MESAITEM.CLIENTEDIARIA'
    end
    object IBQ_BFichaOrigemACRESCIMO: TFloatField
      FieldName = 'ACRESCIMO'
      Origin = 'MESAITEM.ACRESCIMO'
    end
    object IBQ_BFichaOrigemTAXA: TFloatField
      FieldName = 'TAXA'
      Origin = 'MESAITEM.TAXA'
    end
    object IBQ_BFichaOrigemVAL_TAXA: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_TAXA'
      Origin = 'MESAITEM.VAL_TAXA'
      ReadOnly = True
    end
    object IBQ_BFichaOrigemVAL_DESCONTO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_DESCONTO'
      Origin = 'MESAITEM.VAL_DESCONTO'
      ReadOnly = True
    end
    object IBQ_BFichaOrigemVAL_ACRESCIMO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_ACRESCIMO'
      Origin = 'MESAITEM.VAL_ACRESCIMO'
      ReadOnly = True
    end
    object IBQ_BFichaOrigemVAL_PRODUTO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_PRODUTO'
      Origin = 'MESAITEM.VAL_PRODUTO'
      ReadOnly = True
    end
  end
  object IBQ_MesaItem: TIBQuery
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * '
      'from MESAITEM ITEM, PRODUTOS PROD'
      'where (ITEM.MESA = :FICHA)'
      'and (ITEM.SEQUENCIA = :SEQUENCIA)'
      'and (PROD.DIA_PROD = '#39'P'#39')')
    Left = 53
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'FICHA'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'SEQUENCIA'
        ParamType = ptUnknown
        Size = 4
      end>
    object IBQ_MesaItemCODIGO_ID: TIntegerField
      FieldName = 'CODIGO_ID'
      Origin = 'MESAITEM.CODIGO_ID'
      Required = True
    end
    object IBQ_MesaItemMESA: TIntegerField
      FieldName = 'MESA'
      Origin = 'MESAITEM.MESA'
    end
    object IBQ_MesaItemSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'MESAITEM.SEQUENCIA'
    end
    object IBQ_MesaItemGARCOM: TIntegerField
      FieldName = 'GARCOM'
      Origin = 'MESAITEM.GARCOM'
    end
    object IBQ_MesaItemPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'MESAITEM.PRODUTO'
    end
    object IBQ_MesaItemQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      Origin = 'MESAITEM.QUANTIDADE'
    end
    object IBQ_MesaItemCANCELADA: TIBStringField
      FieldName = 'CANCELADA'
      Origin = 'MESAITEM.CANCELADA'
      Required = True
      Size = 1
    end
    object IBQ_MesaItemIMP_REMOTA: TIBStringField
      FieldName = 'IMP_REMOTA'
      Origin = 'MESAITEM.IMP_REMOTA'
      Required = True
      Size = 1
    end
    object IBQ_MesaItemPONTOVENDA: TIntegerField
      FieldName = 'PONTOVENDA'
      Origin = 'MESAITEM.PONTOVENDA'
    end
    object IBQ_MesaItemHORA: TIBStringField
      FieldName = 'HORA'
      Origin = 'MESAITEM.HORA'
      Size = 5
    end
    object IBQ_MesaItemDATE: TDateField
      FieldName = 'DATE'
      Origin = 'MESAITEM.DATE'
    end
    object IBQ_MesaItemMESAFECHA: TIntegerField
      FieldName = 'MESAFECHA'
      Origin = 'MESAITEM.MESAFECHA'
    end
    object IBQ_MesaItemSEQFECHA: TIntegerField
      FieldName = 'SEQFECHA'
      Origin = 'MESAITEM.SEQFECHA'
    end
    object IBQ_MesaItemGRUPO: TIntegerField
      FieldName = 'GRUPO'
      Origin = 'MESAITEM.GRUPO'
    end
    object IBQ_MesaItemPRC_UNITARIO: TFloatField
      FieldName = 'PRC_UNITARIO'
      Origin = 'MESAITEM.PRC_UNITARIO'
      DisplayFormat = '###,###,###0.00'
    end
    object IBQ_MesaItemBALANCA: TIBStringField
      FieldName = 'BALANCA'
      Origin = 'MESAITEM.BALANCA'
      Required = True
      Size = 1
    end
    object IBQ_MesaItemHO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'HO'
      Origin = 'MESAITEM.HO'
      ReadOnly = True
      Size = 2
    end
    object IBQ_MesaItemTEMPO: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO'
      Origin = 'MESAITEM.TEMPO'
      ReadOnly = True
    end
    object IBQ_MesaItemOPCANCEL: TIntegerField
      FieldName = 'OPCANCEL'
      Origin = 'MESAITEM.OPCANCEL'
    end
    object IBQ_MesaItemALIQUOTA: TIntegerField
      FieldName = 'ALIQUOTA'
      Origin = 'MESAITEM.ALIQUOTA'
    end
    object IBQ_MesaItemDATA_INICIO: TDateField
      FieldName = 'DATA_INICIO'
      Origin = 'MESAITEM.DATA_INICIO'
    end
    object IBQ_MesaItemDATA_FINAL: TDateField
      FieldName = 'DATA_FINAL'
      Origin = 'MESAITEM.DATA_FINAL'
    end
    object IBQ_MesaItemHORA_INICIO: TIBStringField
      FieldName = 'HORA_INICIO'
      Origin = 'MESAITEM.HORA_INICIO'
      Size = 5
    end
    object IBQ_MesaItemHORA_FINAL: TIBStringField
      FieldName = 'HORA_FINAL'
      Origin = 'MESAITEM.HORA_FINAL'
      Size = 5
    end
    object IBQ_MesaItemTEMPO_INICIAL: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO_INICIAL'
      Origin = 'MESAITEM.TEMPO_INICIAL'
      ReadOnly = True
    end
    object IBQ_MesaItemTEMPO_FINAL: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TEMPO_FINAL'
      Origin = 'MESAITEM.TEMPO_FINAL'
      ReadOnly = True
    end
    object IBQ_MesaItemDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      Origin = 'MESAITEM.DESCONTO'
    end
    object IBQ_MesaItemFINALIZADA: TIBStringField
      FieldName = 'FINALIZADA'
      Origin = 'MESAITEM.FINALIZADA'
      Required = True
      Size = 1
    end
    object IBQ_MesaItemCODIGO_ID1: TIntegerField
      FieldName = 'CODIGO_ID1'
      Origin = 'PRODUTOS.CODIGO_ID'
      Required = True
    end
    object IBQ_MesaItemPRODUTO1: TIBStringField
      FieldName = 'PRODUTO1'
      Origin = 'PRODUTOS.PRODUTO'
      Size = 13
    end
    object IBQ_MesaItemDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'PRODUTOS.DESCRICAO'
      Size = 50
    end
    object IBQ_MesaItemPRECO: TFloatField
      FieldName = 'PRECO'
      Origin = 'PRODUTOS.PRECO'
    end
    object IBQ_MesaItemPRECOCUSTO: TFloatField
      FieldName = 'PRECOCUSTO'
      Origin = 'PRODUTOS.PRECOCUSTO'
    end
    object IBQ_MesaItemGRUPO1: TIntegerField
      FieldName = 'GRUPO1'
      Origin = 'PRODUTOS.GRUPO'
    end
    object IBQ_MesaItemICMS_SN: TIBStringField
      FieldName = 'ICMS_SN'
      Origin = 'PRODUTOS.ICMS_SN'
      Required = True
      Size = 1
    end
    object IBQ_MesaItemTRIBUTAR: TIntegerField
      FieldName = 'TRIBUTAR'
      Origin = 'PRODUTOS.TRIBUTAR'
    end
    object IBQ_MesaItemBALANCA1: TIBStringField
      FieldName = 'BALANCA1'
      Origin = 'PRODUTOS.BALANCA'
      Required = True
      Size = 1
    end
    object IBQ_MesaItemTARA: TFloatField
      FieldName = 'TARA'
      Origin = 'PRODUTOS.TARA'
    end
    object IBQ_MesaItemUNIDADE: TIntegerField
      FieldName = 'UNIDADE'
      Origin = 'PRODUTOS.UNIDADE'
    end
    object IBQ_MesaItemATIVO: TIBStringField
      FieldName = 'ATIVO'
      Origin = 'PRODUTOS.ATIVO'
      Required = True
      Size = 1
    end
    object IBQ_MesaItemCOMANDA: TIBStringField
      FieldName = 'COMANDA'
      Origin = 'PRODUTOS.COMANDA'
      Required = True
      Size = 1
    end
    object IBQ_MesaItemLOCAL_IMP: TIntegerField
      FieldName = 'LOCAL_IMP'
      Origin = 'PRODUTOS.LOCAL_IMP'
    end
    object IBQ_MesaItemDESCONTO1: TFloatField
      FieldName = 'DESCONTO1'
      Origin = 'PRODUTOS.DESCONTO'
    end
    object IBQ_MesaItemACRESCIMO: TFloatField
      FieldName = 'ACRESCIMO'
      Origin = 'PRODUTOS.ACRESCIMO'
    end
    object IBQ_MesaItemPROD_MTN: TIntegerField
      FieldName = 'PROD_MTN'
      Origin = 'PRODUTOS.PROD_MTN'
    end
    object IBQ_MesaItemESTOQUE: TIBStringField
      FieldName = 'ESTOQUE'
      Origin = 'PRODUTOS.ESTOQUE'
      Size = 1
    end
    object IBQ_MesaItemESTNEGATIVO: TIBStringField
      FieldName = 'ESTNEGATIVO'
      Origin = 'PRODUTOS.ESTNEGATIVO'
      Size = 1
    end
    object IBQ_MesaItemESTOQUE_FISICO: TFloatField
      FieldName = 'ESTOQUE_FISICO'
      Origin = 'PRODUTOS.ESTOQUE_FISICO'
    end
    object IBQ_MesaItemESTOQUE_VIRTUAL: TFloatField
      FieldName = 'ESTOQUE_VIRTUAL'
      Origin = 'PRODUTOS.ESTOQUE_VIRTUAL'
    end
    object IBQ_MesaItemESTOQUEMIN: TFloatField
      FieldName = 'ESTOQUEMIN'
      Origin = 'PRODUTOS.ESTOQUEMIN'
    end
    object IBQ_MesaItemESTOQUEMAX: TFloatField
      FieldName = 'ESTOQUEMAX'
      Origin = 'PRODUTOS.ESTOQUEMAX'
    end
    object IBQ_MesaItemTEMPO1: TIBStringField
      FieldName = 'TEMPO1'
      Origin = 'PRODUTOS.TEMPO'
      Required = True
      Size = 5
    end
    object IBQ_MesaItemDIA_PROD: TIBStringField
      FieldName = 'DIA_PROD'
      Origin = 'PRODUTOS.DIA_PROD'
      Required = True
      Size = 1
    end
    object IBQ_MesaItemTotal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total'
      DisplayFormat = '###,###,###0.00'
      Calculated = True
    end
    object IBQ_MesaItemDescGarcom: TStringField
      FieldKind = fkLookup
      FieldName = 'DescGarcom'
      LookupDataSet = FRM_Modulo.IBT_Funcionario
      LookupKeyFields = 'CODIGO_ID'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'GARCOM'
      Size = 60
      Lookup = True
    end
    object IBQ_MesaItemOBS: TIBStringField
      FieldName = 'OBS'
      Origin = 'MESAITEM.OBS'
      Size = 255
    end
    object IBQ_MesaItemIMP_DIARIA: TIBStringField
      FieldName = 'IMP_DIARIA'
      Origin = 'MESAITEM.IMP_DIARIA'
      Size = 1
    end
    object IBQ_MesaItemIMP_CONTINT: TIBStringField
      FieldName = 'IMP_CONTINT'
      Origin = 'MESAITEM.IMP_CONTINT'
      Size = 1
    end
    object IBQ_MesaItemIMP_CANCELINT: TIBStringField
      FieldName = 'IMP_CANCELINT'
      Origin = 'MESAITEM.IMP_CANCELINT'
      Size = 1
    end
    object IBQ_MesaItemCLIENTEDIARIA: TIntegerField
      FieldName = 'CLIENTEDIARIA'
      Origin = 'MESAITEM.CLIENTEDIARIA'
    end
    object IBQ_MesaItemTAXA: TFloatField
      FieldName = 'TAXA'
      Origin = 'MESAITEM.TAXA'
    end
    object IBQ_MesaItemVAL_DESCONTO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_DESCONTO'
      Origin = 'MESAITEM.VAL_DESCONTO'
      ReadOnly = True
    end
    object IBQ_MesaItemVAL_ACRESCIMO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_ACRESCIMO'
      Origin = 'MESAITEM.VAL_ACRESCIMO'
      ReadOnly = True
    end
    object IBQ_MesaItemVAL_TAXA: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_TAXA'
      Origin = 'MESAITEM.VAL_TAXA'
      ReadOnly = True
    end
    object IBQ_MesaItemVAL_PRODUTO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VAL_PRODUTO'
      Origin = 'MESAITEM.VAL_PRODUTO'
      ReadOnly = True
    end
    object IBQ_MesaItemACRESCIMO1: TFloatField
      FieldName = 'ACRESCIMO1'
      Origin = 'PRODUTOS.ACRESCIMO'
    end
    object IBQ_MesaItemIMP_PERS: TIBStringField
      FieldName = 'IMP_PERS'
      Origin = 'PRODUTOS.IMP_PERS'
      Required = True
      Size = 1
    end
    object IBQ_MesaItemVALSALDOENT: TFloatField
      FieldName = 'VALSALDOENT'
      Origin = 'PRODUTOS.VALSALDOENT'
    end
    object IBQ_MesaItemQTDSALDOENT: TFloatField
      FieldName = 'QTDSALDOENT'
      Origin = 'PRODUTOS.QTDSALDOENT'
    end
    object IBQ_MesaItemTAXA1: TFloatField
      FieldName = 'TAXA1'
      Origin = 'PRODUTOS.TAXA'
    end
    object IBQ_MesaItemTAXA_SN: TIBStringField
      FieldName = 'TAXA_SN'
      Origin = 'PRODUTOS.TAXA_SN'
      Size = 1
    end
  end
  object DTQ_MesaItem: TDataSource
    Left = 53
    Top = 220
  end
  object IBT_Ficha: TIBTable
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
    Filter = 'MOVEL='#39'S'#39
    Filtered = True
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
      end
      item
        Name = 'IDX_FICHA_MOVEL'
        Fields = 'MOVEL'
      end>
    IndexFieldNames = 'CODIGO_ID'
    MasterFields = 'CODIGO_ID'
    StoreDefs = True
    TableName = 'FICHA'
    Left = 113
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
    object IBT_FichaTRAVA: TIBStringField
      FieldName = 'TRAVA'
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
      Size = 1
    end
    object IBT_FichaQUARTO: TIBStringField
      FieldName = 'QUARTO'
      Size = 1
    end
    object IBT_FichaTAXA: TIBStringField
      FieldName = 'TAXA'
      Size = 1
    end
    object IBT_FichaMOVEL: TIBStringField
      FieldName = 'MOVEL'
      Size = 1
    end
    object IBT_FichaFINALIZADA: TIBStringField
      FieldName = 'FINALIZADA'
      Size = 1
    end
    object IBT_FichaXFICHA: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'XFICHA'
      ReadOnly = True
      Size = 5
    end
  end
  object DTS_Ficha: TDataSource
    DataSet = IBT_Ficha
    Left = 113
    Top = 104
  end
  object IBQ_VerERROFichas: TIBQuery
    Database = FRM_Modulo.DataBaseIB
    Transaction = FRM_Modulo.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from FICHA')
    Left = 152
    Top = 76
  end
end
