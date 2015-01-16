inherited frmCadUsuario: TfrmCadUsuario
  Caption = 'Cadastro de Usu'#225'rios'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pFundo: TPanel
    inherited pcGuia: TPageControl
      ActivePage = tsInformacao
      inherited tsGrid: TTabSheet
        inherited pPesquisa: TPanel
          Height = 57
          ExplicitHeight = 57
          object Label5: TLabel
            Left = 8
            Top = 6
            Width = 55
            Height = 13
            Caption = 'Funcion'#225'rio'
          end
          object edtpescUsuario: TEdit
            Left = 8
            Top = 19
            Width = 129
            Height = 21
            Enabled = False
            TabOrder = 0
          end
          object ckTodos: TCheckBox
            Left = 143
            Top = 21
            Width = 50
            Height = 17
            Caption = 'Todos'
            Checked = True
            State = cbChecked
            TabOrder = 1
            OnClick = ckTodosClick
          end
        end
        inherited gGridPesquisa: TDBGrid
          Top = 57
          Height = 285
          DataSource = dtsSelect
          OnCellClick = gGridPesquisaCellClick
          OnDblClick = gGridPesquisaDblClick
          OnKeyPress = gGridPesquisaKeyPress
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_USUARIO'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'LOGIN'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'SENHA'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ID_FUNCIONARIO'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Funcion'#225'rio'
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
            Top = 61
            Width = 36
            Height = 13
            Caption = 'Usu'#225'rio'
          end
          object Label2: TLabel
            Left = 8
            Top = 101
            Width = 30
            Height = 13
            Caption = 'Senha'
          end
          object Label3: TLabel
            Left = 135
            Top = 101
            Width = 76
            Height = 13
            Caption = 'Confirma Senha'
          end
          object Label4: TLabel
            Left = 8
            Top = 18
            Width = 55
            Height = 13
            Caption = 'Funcion'#225'rio'
          end
          object edtUsuario: TEdit
            Left = 8
            Top = 74
            Width = 250
            Height = 21
            CharCase = ecLowerCase
            TabOrder = 1
          end
          object edtSenha: TEdit
            Left = 8
            Top = 116
            Width = 121
            Height = 21
            MaxLength = 4
            PasswordChar = '*'
            TabOrder = 2
          end
          object edtConfSenha: TEdit
            Left = 135
            Top = 116
            Width = 123
            Height = 21
            MaxLength = 4
            PasswordChar = '*'
            TabOrder = 3
          end
          object DBLFUNCIONARIO: TDBLookupComboBox
            Left = 8
            Top = 32
            Width = 250
            Height = 21
            KeyField = 'ID_FUNCIONARIO'
            ListField = 'NOME'
            ListSource = dtsFuncionario
            TabOrder = 0
          end
          object chkExibirSenha: TCheckBox
            Left = 264
            Top = 118
            Width = 49
            Height = 17
            Caption = 'Exibir'
            TabOrder = 4
            OnClick = chkExibirSenhaClick
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
    SQL.Strings = (
      'SELECT * FROM USUARIO')
    Left = 496
    Top = 320
  end
  inherited qrySelect: TIBQuery
    Database = Module.IBLOJAHS
    Transaction = Module.IBTransaction
    SQL.Strings = (
      'SELECT U.ID_FUNCIONARIO,'
      'U.ID_USUARIO,'
      'U.LOGIN,'
      'U.SENHA,'
      'F.NOME'
      'FROM USUARIO U'
      
        'INNER JOIN FUNCIONARIO F ON (F.ID_FUNCIONARIO = U.ID_FUNCIONARIO' +
        ')'
      'WHERE (1 = 1)')
    Left = 432
    Top = 288
    object qrySelectID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = '"USUARIO"."ID_USUARIO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrySelectLOGIN: TIBStringField
      FieldName = 'LOGIN'
      Origin = '"USUARIO"."LOGIN"'
      Required = True
    end
    object qrySelectSENHA: TIBStringField
      FieldName = 'SENHA'
      Origin = '"USUARIO"."SENHA"'
      Required = True
      Size = 4
    end
    object qrySelectID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
      Origin = '"USUARIO"."ID_FUNCIONARIO"'
      Required = True
    end
    object qrySelectNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"FUNCIONARIO"."NOME"'
      Required = True
      Size = 60
    end
  end
  inherited dtsSelect: TDataSource
    Left = 432
    Top = 336
  end
  object qryFuncionario: TIBQuery [5]
    Database = Module.IBLOJAHS
    Transaction = Module.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'Select * from Funcionario'
      ''
      'where (1=1)')
    Left = 568
    Top = 288
    object qryFuncionarioID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
      Origin = '"FUNCIONARIO"."ID_FUNCIONARIO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryFuncionarioNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"FUNCIONARIO"."NOME"'
      Required = True
      Size = 60
    end
    object qryFuncionarioDT_NASCTO: TDateField
      FieldName = 'DT_NASCTO'
      Origin = '"FUNCIONARIO"."DT_NASCTO"'
    end
    object qryFuncionarioENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = '"FUNCIONARIO"."ENDERECO"'
      Size = 60
    end
    object qryFuncionarioBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = '"FUNCIONARIO"."BAIRRO"'
      Size = 30
    end
    object qryFuncionarioID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
      Origin = '"FUNCIONARIO"."ID_CIDADE"'
    end
    object qryFuncionarioID_UF: TIntegerField
      FieldName = 'ID_UF'
      Origin = '"FUNCIONARIO"."ID_UF"'
    end
    object qryFuncionarioTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Origin = '"FUNCIONARIO"."TELEFONE"'
      Size = 15
    end
    object qryFuncionarioATIVO: TIBStringField
      FieldName = 'ATIVO'
      Origin = '"FUNCIONARIO"."ATIVO"'
      FixedChar = True
      Size = 1
    end
    object qryFuncionarioADMISSAO: TDateField
      FieldName = 'ADMISSAO'
      Origin = '"FUNCIONARIO"."ADMISSAO"'
    end
    object qryFuncionarioDEMISSAO: TDateField
      FieldName = 'DEMISSAO'
      Origin = '"FUNCIONARIO"."DEMISSAO"'
    end
    object qryFuncionarioID_TURNO: TIntegerField
      FieldName = 'ID_TURNO'
      Origin = '"FUNCIONARIO"."ID_TURNO"'
    end
    object qryFuncionarioID_CARGO: TIntegerField
      FieldName = 'ID_CARGO'
      Origin = '"FUNCIONARIO"."ID_CARGO"'
    end
    object qryFuncionarioOBSERVACAO: TBlobField
      FieldName = 'OBSERVACAO'
      Origin = '"FUNCIONARIO"."OBSERVACAO"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object qryFuncionarioCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
      Origin = '"FUNCIONARIO"."COMISSAO"'
    end
    object qryFuncionarioRG: TIBStringField
      FieldName = 'RG'
      Origin = '"FUNCIONARIO"."RG"'
      Size = 30
    end
    object qryFuncionarioCPF: TIBStringField
      FieldName = 'CPF'
      Origin = '"FUNCIONARIO"."CPF"'
      Size = 30
    end
    object qryFuncionarioCEP: TIBStringField
      FieldName = 'CEP'
      Origin = '"FUNCIONARIO"."CEP"'
      Size = 10
    end
  end
  object dtsFuncionario: TDataSource [6]
    DataSet = qryFuncionario
    Left = 568
    Top = 344
  end
end
