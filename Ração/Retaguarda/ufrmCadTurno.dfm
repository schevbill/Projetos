inherited frmCadTurno: TfrmCadTurno
  Caption = 'Cadastro de Turno'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pFundo: TPanel
    inherited pcGuia: TPageControl
      inherited tsGrid: TTabSheet
        inherited pPesquisa: TPanel
          Height = 65
          ExplicitHeight = 65
          object Label2: TLabel
            Left = 8
            Top = 8
            Width = 28
            Height = 13
            Caption = 'Turno'
          end
          object edtPescTurno: TEdit
            Left = 8
            Top = 22
            Width = 136
            Height = 21
            Enabled = False
            TabOrder = 0
          end
          object cktodos: TCheckBox
            Left = 150
            Top = 24
            Width = 56
            Height = 17
            Caption = 'Todos'
            Checked = True
            State = cbChecked
            TabOrder = 1
            OnClick = cktodosClick
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
              Title.Caption = 'Turno'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HORAINICIO'
              Title.Caption = 'Hora Inicio'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HORAFIM'
              Title.Caption = 'Hora Final'
              Visible = True
            end>
        end
      end
      inherited tsInformacao: TTabSheet
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 661
          Height = 342
          Align = alClient
          TabOrder = 0
          object Label1: TLabel
            Left = 8
            Top = 16
            Width = 28
            Height = 13
            Caption = 'Turno'
          end
          object Label3: TLabel
            Left = 139
            Top = 16
            Width = 53
            Height = 13
            Caption = 'Hora Inicial'
          end
          object Label4: TLabel
            Left = 225
            Top = 16
            Width = 48
            Height = 13
            Caption = 'Hora Final'
          end
          object edtTurno: TEdit
            Left = 8
            Top = 30
            Width = 125
            Height = 21
            TabOrder = 0
          end
          object dtHrInicial: TDateTimePicker
            Left = 139
            Top = 30
            Width = 80
            Height = 21
            Date = 41471.900351354170000000
            Time = 41471.900351354170000000
            Kind = dtkTime
            TabOrder = 1
          end
          object dtHrFinal: TDateTimePicker
            Left = 225
            Top = 30
            Width = 80
            Height = 21
            Date = 41471.900351354170000000
            Time = 41471.900351354170000000
            Kind = dtkTime
            TabOrder = 2
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
    Left = 448
    Top = 316
  end
  inherited qrySelect: TIBQuery
    Database = Module.IBLOJAHS
    Transaction = Module.IBTransaction
    SQL.Strings = (
      'SELECT * FROM TURNO')
    Left = 384
    Top = 284
    object qrySelectID_TURNO: TIntegerField
      FieldName = 'ID_TURNO'
      Origin = '"TURNO"."ID_TURNO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrySelectDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"TURNO"."DESCRICAO"'
      Size = 60
    end
    object qrySelectHORAINICIO: TTimeField
      FieldName = 'HORAINICIO'
      Origin = '"TURNO"."HORAINICIO"'
    end
    object qrySelectHORAFIM: TTimeField
      FieldName = 'HORAFIM'
      Origin = '"TURNO"."HORAFIM"'
    end
  end
  inherited dtsSelect: TDataSource
    Left = 384
    Top = 332
  end
end
