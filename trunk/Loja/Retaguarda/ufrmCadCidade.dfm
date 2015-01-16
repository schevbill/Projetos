inherited frmCadCidade: TfrmCadCidade
  Caption = 'Cadastro de Munic'#237'pio'
  ExplicitWidth = 685
  ExplicitHeight = 465
  PixelsPerInch = 96
  TextHeight = 13
  inherited pFundo: TPanel
    inherited pcGuia: TPageControl
      ActivePage = tsInformacao
      inherited tsGrid: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 661
        ExplicitHeight = 342
        inherited pPesquisa: TPanel
          Height = 65
          ExplicitHeight = 65
          object Label1: TLabel
            Left = 8
            Top = 8
            Width = 33
            Height = 13
            Caption = 'Cidade'
          end
          object cbxTodos: TCheckBox
            Left = 219
            Top = 25
            Width = 66
            Height = 17
            Caption = 'Todos'
            Checked = True
            State = cbChecked
            TabOrder = 0
            OnClick = cbxTodosClick
          end
          object edtCidade: TEdit
            Left = 8
            Top = 24
            Width = 205
            Height = 21
            Enabled = False
            TabOrder = 1
            OnChange = edtCidadeChange
          end
        end
        inherited gGridPesquisa: TDBGrid
          Top = 65
          Height = 277
          DataSource = dtsSelect
          OnCellClick = gGridPesquisaCellClick
          OnDblClick = gGridPesquisaDblClick
          OnKeyPress = gGridPesquisaKeyPress
          Columns = <
            item
              Expanded = False
              FieldName = 'ESTADO'
              Title.Caption = 'UF'
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Cidade'
              Width = 443
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO_IBGE'
              Title.Caption = 'C'#243'digo IBGE'
              Width = 150
              Visible = True
            end>
        end
      end
      inherited tsInformacao: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 661
        ExplicitHeight = 342
        object pFundoCad: TPanel
          Left = 0
          Top = 0
          Width = 661
          Height = 342
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Label2: TLabel
            Left = 8
            Top = 10
            Width = 33
            Height = 13
            Caption = 'Cidade'
          end
          object Label3: TLabel
            Left = 8
            Top = 53
            Width = 59
            Height = 13
            Caption = 'C'#243'digo IBGE'
          end
          object Label4: TLabel
            Left = 135
            Top = 53
            Width = 13
            Height = 13
            Caption = 'UF'
          end
          object dblcUF: TDBLookupComboBox
            Left = 135
            Top = 69
            Width = 114
            Height = 21
            KeyField = 'ID_UF'
            ListField = 'ESTADO'
            ListSource = Module.dtsUF
            TabOrder = 2
          end
          object edtCodIbge: TEdit
            Left = 8
            Top = 69
            Width = 120
            Height = 21
            TabOrder = 1
          end
          object edtDescCidade: TEdit
            Left = 8
            Top = 26
            Width = 244
            Height = 21
            TabOrder = 0
          end
        end
      end
    end
    inherited PNL_Botoes: TPanel
      inherited btnFiltrar: TImage
        OnClick = btnFiltrarClick
      end
    end
  end
  inherited qryGravar: TIBQuery
    Left = 456
    Top = 256
  end
  inherited qrySelect: TIBQuery
    Database = Module.IBLOJAHS
    Transaction = Module.IBTransaction
    SQL.Strings = (
      'SELECT'
      'CID.ID_CIDADE,'
      'CID.descricao, '
      'CID.CODIGO_IBGE,'
      'U.ESTADO'
      'FROM CIDADE CID'
      ''
      'INNER JOIN UF U ON (CID.id_uf = U.ID_UF)')
    Left = 400
    Top = 256
    object qrySelectID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
      Origin = '"CIDADE"."ID_CIDADE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrySelectDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"CIDADE"."DESCRICAO"'
      Required = True
      Size = 30
    end
    object qrySelectCODIGO_IBGE: TIntegerField
      FieldName = 'CODIGO_IBGE'
      Origin = '"CIDADE"."CODIGO_IBGE"'
      Required = True
    end
    object qrySelectESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = '"UF"."ESTADO"'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  inherited dtsSelect: TDataSource
    Left = 400
    Top = 304
  end
  object dtsFiltro: TDataSource [5]
    Left = 464
    Top = 72
  end
  object QRYFILTRO: TIBQuery [6]
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 408
    Top = 72
  end
end
