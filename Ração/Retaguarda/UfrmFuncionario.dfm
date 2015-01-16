inherited frmCadFuncionario: TfrmCadFuncionario
  Caption = 'Cadastro de Funcion'#225'rios'
  ClientWidth = 735
  ExplicitWidth = 751
  PixelsPerInch = 96
  TextHeight = 13
  inherited pFundo: TPanel
    Width = 735
    ExplicitWidth = 735
    inherited pcGuia: TPageControl
      Width = 735
      ExplicitWidth = 735
      inherited tsGrid: TTabSheet
        ExplicitWidth = 727
        inherited pPesquisa: TPanel
          Width = 727
          Height = 105
          ExplicitWidth = 727
          ExplicitHeight = 105
          object Label2: TLabel
            Left = 8
            Top = 48
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cargo'
          end
          object Label1: TLabel
            Left = 10
            Top = 6
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nome'
          end
          object Label3: TLabel
            Left = 205
            Top = 48
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cidade'
          end
          object edtNome: TEdit
            Left = 8
            Top = 21
            Width = 348
            Height = 21
            Enabled = False
            TabOrder = 0
            OnChange = edtNomeChange
          end
          object RadioGroup1: TRadioGroup
            Left = 425
            Top = 21
            Width = 255
            Height = 64
            Caption = '  Funcion'#225'rio '
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'Ativo'
              'Inativo')
            TabOrder = 1
          end
          object cknome: TCheckBox
            Left = 362
            Top = 23
            Width = 57
            Height = 17
            Caption = 'Todos'
            Checked = True
            State = cbChecked
            TabOrder = 2
            OnClick = cknomeClick
          end
          object ckcargo: TCheckBox
            Left = 151
            Top = 66
            Width = 50
            Height = 17
            Caption = 'Todos'
            Checked = True
            State = cbChecked
            TabOrder = 3
            OnClick = ckcargoClick
          end
          object ckcidade: TCheckBox
            Left = 362
            Top = 66
            Width = 57
            Height = 17
            Caption = 'Todos'
            Checked = True
            State = cbChecked
            TabOrder = 4
            OnClick = ckcidadeClick
          end
          object edtcargo: TDBLookupComboBox
            Left = 8
            Top = 64
            Width = 137
            Height = 21
            Enabled = False
            KeyField = 'ID_CARGO'
            ListField = 'DESCRICAO'
            ListSource = dtsCargo
            TabOrder = 5
          end
          object edtCIdade: TDBLookupComboBox
            Left = 205
            Top = 64
            Width = 151
            Height = 21
            Enabled = False
            KeyField = 'ID_CIDADE'
            ListField = 'DESCRICAO'
            ListSource = Module.dtsCidade
            TabOrder = 6
          end
        end
        inherited gGridPesquisa: TDBGrid
          Top = 105
          Width = 727
          Height = 237
          DataSource = dtsSelect
          ReadOnly = True
          OnCellClick = gGridPesquisaCellClick
          OnDblClick = gGridPesquisaDblClick
          OnKeyPress = gGridPesquisaKeyPress
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ATIVO'
              Title.Caption = 'Ativo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Cargo'
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO1'
              Title.Caption = 'Cidade'
              Width = 180
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CPF'
              Title.Caption = 'CPF.'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RG'
              Title.Caption = 'RG.'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ENDERECO'
              Title.Caption = 'Endere'#231'o'
              Width = 190
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TELEFONE'
              Title.Caption = 'Telefone'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CEP'
              Title.Caption = 'CEP.'
              Width = 90
              Visible = True
            end>
        end
      end
      inherited tsInformacao: TTabSheet
        ExplicitWidth = 727
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 727
          Height = 342
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Label4: TLabel
            Left = 4
            Top = 6
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nome'
          end
          object Label5: TLabel
            Left = 385
            Top = 131
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cargo'
          end
          object Label6: TLabel
            Left = 385
            Top = 89
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Bairro'
          end
          object Label7: TLabel
            Left = 131
            Top = 89
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Endere'#231'o'
          end
          object Label8: TLabel
            Left = 4
            Top = 131
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cidade'
          end
          object Label9: TLabel
            Left = 4
            Top = 89
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'CEP.'
          end
          object Label10: TLabel
            Left = 384
            Top = 48
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Telefone'
          end
          object Label11: TLabel
            Left = 254
            Top = 6
            Width = 85
            Height = 13
            Alignment = taRightJustify
            Caption = 'Data de admiss'#227'o'
          end
          object Label12: TLabel
            Left = 355
            Top = 6
            Width = 85
            Height = 13
            Alignment = taRightJustify
            Caption = 'Data da demiss'#227'o'
          end
          object Label13: TLabel
            Left = 4
            Top = 49
            Width = 18
            Height = 13
            Alignment = taRightJustify
            Caption = 'RG.'
          end
          object Label14: TLabel
            Left = 130
            Top = 49
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'CPF.'
          end
          object Label15: TLabel
            Left = 285
            Top = 131
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Turno'
          end
          object Label16: TLabel
            Left = 513
            Top = 49
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Comiss'#227'o'
          end
          object Label17: TLabel
            Left = 4
            Top = 174
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Observa'#231#227'o'
          end
          object Label18: TLabel
            Left = 256
            Top = 49
            Width = 96
            Height = 13
            Alignment = taRightJustify
            Caption = 'Data de Nascimento'
          end
          object Label19: TLabel
            Left = 230
            Top = 131
            Width = 13
            Height = 13
            Caption = 'UF'
          end
          object DTAdmissao: TDateTimePicker
            Left = 254
            Top = 22
            Width = 95
            Height = 21
            Date = 41442.936708796290000000
            Time = 41442.936708796290000000
            TabOrder = 1
          end
          object DTdemissao: TDateTimePicker
            Left = 355
            Top = 22
            Width = 95
            Height = 21
            Date = 0.936708796289167400
            Time = 0.936708796289167400
            Enabled = False
            TabOrder = 2
          end
          object DT_nasc: TDateTimePicker
            Left = 256
            Top = 64
            Width = 123
            Height = 21
            Date = 41442.936708796290000000
            Time = 41442.936708796290000000
            TabOrder = 6
          end
          object DBLTurno: TDBLookupComboBox
            Left = 285
            Top = 147
            Width = 94
            Height = 21
            KeyField = 'ID_TURNO'
            ListField = 'DESCRICAO'
            ListSource = dtsTurno
            TabOrder = 14
          end
          object DBLCargo: TDBLookupComboBox
            Left = 385
            Top = 147
            Width = 207
            Height = 21
            KeyField = 'ID_CARGO'
            ListField = 'DESCRICAO'
            ListSource = dtsCargo
            TabOrder = 15
          end
          object DBLCidade: TDBLookupComboBox
            Left = 4
            Top = 147
            Width = 220
            Height = 21
            KeyField = 'ID_CIDADE'
            ListField = 'DESCRICAO'
            ListSource = Module.dtsCidade
            TabOrder = 12
          end
          object DBLUF: TDBLookupComboBox
            Left = 230
            Top = 147
            Width = 49
            Height = 21
            KeyField = 'ID_UF'
            ListField = 'ESTADO'
            ListSource = Module.dtsUF
            TabOrder = 13
          end
          object dbeNome: TEdit
            Left = 4
            Top = 22
            Width = 244
            Height = 21
            TabOrder = 0
          end
          object dbeRG: TEdit
            Left = 4
            Top = 64
            Width = 120
            Height = 21
            TabOrder = 4
          end
          object dbeCPF: TEdit
            Left = 130
            Top = 64
            Width = 120
            Height = 21
            TabOrder = 5
          end
          object dbeTelefone: TEdit
            Left = 385
            Top = 64
            Width = 121
            Height = 21
            TabOrder = 7
          end
          object dbeBairro: TEdit
            Left = 385
            Top = 104
            Width = 207
            Height = 21
            TabOrder = 11
          end
          object dbeComissao: TEdit
            Left = 512
            Top = 64
            Width = 80
            Height = 21
            TabOrder = 8
          end
          object mObs: TMemo
            Left = 4
            Top = 193
            Width = 588
            Height = 136
            TabOrder = 16
            OnKeyPress = mObsKeyPress
          end
          object dbeEndereco: TEdit
            Left = 131
            Top = 104
            Width = 248
            Height = 21
            TabOrder = 10
          end
          object dbeCep: TEdit
            Left = 4
            Top = 104
            Width = 121
            Height = 21
            TabOrder = 9
            OnExit = dbeCepExit
          end
          object rgAtivoIna: TRadioGroup
            Left = 456
            Top = 6
            Width = 136
            Height = 37
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'ATIVO'
              'INATIVO')
            TabOrder = 3
            OnClick = rgAtivoInaClick
          end
        end
      end
    end
    inherited PNL_Botoes: TPanel
      Width = 735
      ExplicitWidth = 735
      inherited SPB_Sair: TSpeedButton
        Left = 564
        ExplicitLeft = 564
      end
      inherited btnFiltrar: TImage
        OnClick = btnFiltrarClick
      end
      inherited pSair: TPanel
        Left = 666
        ExplicitLeft = 666
      end
    end
    inherited StatusBar1: TStatusBar
      Width = 735
      ExplicitWidth = 735
    end
  end
  inherited BalloonHint: TBalloonHint
    Left = 696
  end
  object qryTurno: TIBQuery [2]
    Database = Module.IBLOJAHS
    Transaction = Module.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from turno')
    Left = 632
    Top = 248
    object qryTurnoID_TURNO: TIntegerField
      FieldName = 'ID_TURNO'
      Origin = '"TURNO"."ID_TURNO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryTurnoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"TURNO"."DESCRICAO"'
      Size = 60
    end
    object qryTurnoHORAINICIO: TTimeField
      FieldName = 'HORAINICIO'
      Origin = '"TURNO"."HORAINICIO"'
    end
    object qryTurnoHORAFIM: TTimeField
      FieldName = 'HORAFIM'
      Origin = '"TURNO"."HORAFIM"'
    end
  end
  object dtsTurno: TDataSource [3]
    DataSet = qryTurno
    Left = 632
    Top = 296
  end
  object qryCargo: TIBQuery [4]
    Database = Module.IBLOJAHS
    Transaction = Module.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from cargo')
    Left = 688
    Top = 248
    object qryCargoID_CARGO: TIntegerField
      FieldName = 'ID_CARGO'
      Origin = '"CARGO"."ID_CARGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCargoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"CARGO"."DESCRICAO"'
      Size = 60
    end
    object qryCargoTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = '"CARGO"."TIPO"'
      FixedChar = True
      Size = 1
    end
  end
  object dtsCargo: TDataSource [5]
    DataSet = qryCargo
    Left = 688
    Top = 296
  end
  inherited qryGravar: TIBQuery
    Left = 296
    Top = 304
  end
  inherited qrySelect: TIBQuery
    Database = Module.IBLOJAHS
    Transaction = Module.IBTransaction
    SQL.Strings = (
      'SELECT  '
      'F.ID_FUNCIONARIO,'
      'F.NOME,'
      'F.DT_NASCTO,'
      'F.ENDERECO,'
      'F.TELEFONE,'
      'F.ATIVO,'
      'F.ADMISSAO,'
      'F.DEMISSAO,'
      'F.OBSERVACAO,'
      'F.COMISSAO,'
      'F.RG,'
      'F.CPF,'
      'F.CEP,'
      'CRG.DESCRICAO,'
      'CID.DESCRICAO'
      ''
      ''
      'FROM FUNCIONARIO F'
      '  '
      ' INNER JOIN CIDADE CID ON (F.ID_CIDADE = CID.ID_CIDADE)'
      ' INNER JOIN CARGO CRG ON (F.ID_CARGO = CRG.ID_CARGO)'
      ''
      'WHERE 1=1')
    Left = 240
    Top = 304
    object qrySelectNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"FUNCIONARIO"."NOME"'
      Required = True
      Size = 60
    end
    object qrySelectDT_NASCTO: TDateField
      FieldName = 'DT_NASCTO'
      Origin = '"FUNCIONARIO"."DT_NASCTO"'
    end
    object qrySelectENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = '"FUNCIONARIO"."ENDERECO"'
      Size = 60
    end
    object qrySelectTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Origin = '"FUNCIONARIO"."TELEFONE"'
      Size = 15
    end
    object qrySelectATIVO: TIBStringField
      FieldName = 'ATIVO'
      Origin = '"FUNCIONARIO"."ATIVO"'
      FixedChar = True
      Size = 1
    end
    object qrySelectADMISSAO: TDateField
      FieldName = 'ADMISSAO'
      Origin = '"FUNCIONARIO"."ADMISSAO"'
    end
    object qrySelectDEMISSAO: TDateField
      FieldName = 'DEMISSAO'
      Origin = '"FUNCIONARIO"."DEMISSAO"'
    end
    object qrySelectOBSERVACAO: TBlobField
      FieldName = 'OBSERVACAO'
      Origin = '"FUNCIONARIO"."OBSERVACAO"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object qrySelectCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
      Origin = '"FUNCIONARIO"."COMISSAO"'
    end
    object qrySelectRG: TIBStringField
      FieldName = 'RG'
      Origin = '"FUNCIONARIO"."RG"'
      Size = 30
    end
    object qrySelectCPF: TIBStringField
      FieldName = 'CPF'
      Origin = '"FUNCIONARIO"."CPF"'
      Size = 30
    end
    object qrySelectCEP: TIBStringField
      FieldName = 'CEP'
      Origin = '"FUNCIONARIO"."CEP"'
      Size = 10
    end
    object qrySelectDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"CARGO"."DESCRICAO"'
      Size = 60
    end
    object qrySelectDESCRICAO1: TIBStringField
      FieldName = 'DESCRICAO1'
      Origin = '"CIDADE"."DESCRICAO"'
      Required = True
      Size = 30
    end
    object qrySelectID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
      Origin = '"FUNCIONARIO"."ID_FUNCIONARIO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  inherited dtsSelect: TDataSource
    Left = 240
    Top = 352
  end
end
