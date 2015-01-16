inherited frmCadCargo: TfrmCadCargo
  Caption = 'Cadastro de Cargos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pFundo: TPanel
    inherited pcGuia: TPageControl
      inherited tsGrid: TTabSheet
        inherited pPesquisa: TPanel
          Height = 65
          ExplicitHeight = 65
          object Label3: TLabel
            Left = 8
            Top = 9
            Width = 29
            Height = 13
            Caption = 'Cargo'
          end
          object EDTPESCARGO: TEdit
            Left = 8
            Top = 24
            Width = 121
            Height = 21
            Enabled = False
            TabOrder = 0
          end
          object CKTODOS: TCheckBox
            Left = 135
            Top = 26
            Width = 97
            Height = 17
            Caption = 'Todos'
            Checked = True
            State = cbChecked
            TabOrder = 1
            OnClick = CKTODOSClick
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
              FieldName = 'DESCRICAO'
              Title.Caption = 'Cargo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Title.Caption = 'Tipo'
              Visible = True
            end>
        end
      end
      inherited tsInformacao: TTabSheet
        object pFundoCargo: TPanel
          Left = 0
          Top = 0
          Width = 661
          Height = 342
          Align = alClient
          TabOrder = 0
          object Label1: TLabel
            Left = 8
            Top = 9
            Width = 29
            Height = 13
            Caption = 'Cargo'
          end
          object Label2: TLabel
            Left = 135
            Top = 9
            Width = 20
            Height = 13
            Caption = 'Tipo'
          end
          object EdtCargo: TEdit
            Left = 8
            Top = 24
            Width = 121
            Height = 21
            TabOrder = 0
          end
          object EdtTipo: TEdit
            Left = 135
            Top = 24
            Width = 121
            Height = 21
            TabOrder = 1
          end
        end
      end
    end
    inherited PNL_Botoes: TPanel
      inherited btnExcluir: TImage
        Left = 96
        ExplicitLeft = 96
      end
      inherited btnFiltrar: TImage
        OnClick = btnFiltrarClick
      end
    end
  end
  inherited qryGravar: TIBQuery
    Database = Module.IBLOJAHS
    Transaction = Module.IBTransaction
    Left = 448
    Top = 272
  end
  inherited qrySelect: TIBQuery
    Database = Module.IBLOJAHS
    Transaction = Module.IBTransaction
    SQL.Strings = (
      'SELECT * FROM CARGO')
    Left = 368
    Top = 272
    object qrySelectID_CARGO: TIntegerField
      FieldName = 'ID_CARGO'
      Origin = '"CARGO"."ID_CARGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrySelectDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"CARGO"."DESCRICAO"'
      Size = 60
    end
    object qrySelectTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = '"CARGO"."TIPO"'
      FixedChar = True
      Size = 1
    end
  end
  inherited dtsSelect: TDataSource
    Left = 368
    Top = 320
  end
end
