inherited frmCadClifor: TfrmCadClifor
  Align = alCustom
  Caption = 'Cadastro de Clientes / Fornecedor'
  ClientHeight = 593
  ClientWidth = 702
  ExplicitWidth = 718
  ExplicitHeight = 631
  PixelsPerInch = 96
  TextHeight = 13
  inherited pFundo: TPanel
    Width = 702
    Height = 593
    ExplicitWidth = 702
    ExplicitHeight = 593
    inherited pcGuia: TPageControl
      Width = 702
      Height = 536
      ActivePage = tsInformacao
      OnChange = pcGuiaChange
      ExplicitWidth = 702
      ExplicitHeight = 536
      inherited tsGrid: TTabSheet
        ExplicitWidth = 694
        ExplicitHeight = 508
        inherited pPesquisa: TPanel
          Width = 694
          ExplicitWidth = 694
          object Label4: TLabel
            Left = 0
            Top = 53
            Width = 27
            Height = 13
            Caption = 'Nome'
          end
          object Label6: TLabel
            Left = 225
            Top = 53
            Width = 35
            Height = 13
            Caption = 'Apelido'
          end
          object Label12: TLabel
            Left = 448
            Top = 54
            Width = 19
            Height = 13
            Caption = 'CPF'
          end
          object edtNomeRazao: TEdit
            Left = 0
            Top = 68
            Width = 160
            Height = 21
            Enabled = False
            TabOrder = 0
            OnChange = edtNomeRazaoChange
          end
          object PesquisaPFPJ: TRadioGroup
            Left = 0
            Top = 0
            Width = 233
            Height = 47
            Caption = 'Tipo'
            Columns = 3
            ItemIndex = 1
            Items.Strings = (
              'Ambos'
              'Cliente'
              'Fornecedor')
            TabOrder = 1
            OnClick = PesquisaPFPJClick
            OnEnter = PesquisaPFPJEnter
            OnExit = PesquisaPFPJExit
          end
          object edtApelidoFantasia: TEdit
            Left = 225
            Top = 68
            Width = 160
            Height = 21
            Enabled = False
            TabOrder = 2
            OnChange = edtApelidoFantasiaChange
          end
          object ckNome_razao: TCheckBox
            Left = 166
            Top = 70
            Width = 53
            Height = 17
            Caption = 'Todos'
            Checked = True
            State = cbChecked
            TabOrder = 3
            OnClick = ckNome_razaoClick
          end
          object ckApelidoFantasia: TCheckBox
            Left = 391
            Top = 70
            Width = 51
            Height = 17
            Caption = 'Todos'
            Checked = True
            State = cbChecked
            TabOrder = 4
            OnClick = ckApelidoFantasiaClick
          end
          object edtCPFCNPJ: TEdit
            Left = 448
            Top = 68
            Width = 160
            Height = 21
            Enabled = False
            TabOrder = 5
            OnChange = edtCPFCNPJChange
          end
          object ckCPFCNPJ: TCheckBox
            Left = 614
            Top = 70
            Width = 53
            Height = 17
            Caption = 'Todos'
            Checked = True
            State = cbChecked
            TabOrder = 6
            OnClick = ckCPFCNPJClick
          end
          object RadioGroup4: TRadioGroup
            Left = 239
            Top = 0
            Width = 125
            Height = 47
            Caption = 'Ativo'
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'Ativo'
              'Inativo')
            TabOrder = 7
            OnClick = RadioGroup4Click
            OnEnter = RadioGroup4Enter
            OnExit = RadioGroup4Exit
          end
          object RadioGroup6: TRadioGroup
            Left = 370
            Top = 0
            Width = 127
            Height = 47
            Caption = 'Tipo Pessoa'
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'F'#237'sica'
              'Jur'#237'dica')
            TabOrder = 8
          end
        end
        inherited gGridPesquisa: TDBGrid
          Width = 694
          Height = 387
          DataSource = dtsSelect
          OnCellClick = gGridPesquisaCellClick
          OnDblClick = gGridPesquisaDblClick
          OnKeyPress = gGridPesquisaKeyPress
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'TIPOCLIFOR'
              Title.Caption = 'Tipo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RAZAOSOCIAL'
              Title.Caption = 'Nome'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMEFANTASIA'
              Title.Caption = 'Apelido'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CPF'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CNPJ'
              Visible = False
            end
            item
              Expanded = False
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'IE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RG'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IM'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ENDERECO'
              Title.Caption = 'Endere'#231'o'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BAIRRO'
              Title.Caption = 'Bairro'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_CLIFOR'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'NOMEFANTASIA'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'RAZAOSOCIAL'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'CNPJ'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'CPF'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'CIDADE'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'UF'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'TELEFONE'
              Title.Caption = 'Telefone'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FAX'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CELULAR'
              Title.Caption = 'Celular'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PAIS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUMEROCASA'
              Title.Caption = 'N'#250'mero'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONTATO'
              Title.Caption = 'Contato'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMAIL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SITE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ATIVO'
              Title.Caption = 'Ativo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CEP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACAO'
              Title.Caption = 'Observa'#231#227'o'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTCADASTRO'
              Title.Caption = 'Data Cadastro'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_NASC'
              Title.Caption = 'Data Nascimento'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_IBGE_CIDADE'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'SUFRAMA'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'SEXO'
              Visible = True
            end>
        end
      end
      inherited tsInformacao: TTabSheet
        ExplicitWidth = 694
        ExplicitHeight = 508
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 694
          Height = 508
          Align = alClient
          TabOrder = 0
          object Label1: TLabel
            Left = 250
            Top = 12
            Width = 27
            Height = 13
            Caption = 'Nome'
          end
          object Label2: TLabel
            Left = 456
            Top = 12
            Width = 35
            Height = 13
            Caption = 'Apelido'
          end
          object Label3: TLabel
            Left = 278
            Top = 51
            Width = 25
            Height = 13
            Caption = 'CNPJ'
          end
          object Label5: TLabel
            Left = 420
            Top = 51
            Width = 87
            Height = 13
            Caption = 'Inscri'#231#227'o Estadual'
          end
          object Label7: TLabel
            Left = 556
            Top = 51
            Width = 89
            Height = 13
            Caption = 'Inscri'#231#227'o Municipal'
          end
          object Label8: TLabel
            Left = 129
            Top = 93
            Width = 45
            Height = 13
            Caption = 'Endere'#231'o'
          end
          object Label9: TLabel
            Left = 432
            Top = 92
            Width = 28
            Height = 13
            Caption = 'Bairro'
          end
          object Label11: TLabel
            Left = 3
            Top = 133
            Width = 33
            Height = 13
            Caption = 'Cidade'
          end
          object Label10: TLabel
            Left = 260
            Top = 132
            Width = 13
            Height = 13
            Caption = 'UF'
          end
          object Label13: TLabel
            Left = 130
            Top = 173
            Width = 42
            Height = 13
            Caption = 'Telefone'
          end
          object Label14: TLabel
            Left = 257
            Top = 175
            Width = 18
            Height = 13
            Caption = 'Fax'
          end
          object Label15: TLabel
            Left = 3
            Top = 175
            Width = 33
            Height = 13
            Caption = 'Celular'
          end
          object Label16: TLabel
            Left = 315
            Top = 132
            Width = 19
            Height = 13
            Caption = 'Pa'#237's'
          end
          object Label17: TLabel
            Left = 618
            Top = 93
            Width = 37
            Height = 13
            Caption = 'N'#250'mero'
          end
          object Label18: TLabel
            Left = 387
            Top = 173
            Width = 39
            Height = 13
            Caption = 'Contato'
          end
          object Label19: TLabel
            Left = 317
            Top = 215
            Width = 24
            Height = 13
            Caption = 'Email'
          end
          object Label20: TLabel
            Left = 2
            Top = 215
            Width = 18
            Height = 13
            Caption = 'Site'
          end
          object Label21: TLabel
            Left = 3
            Top = 93
            Width = 19
            Height = 13
            Caption = 'CEP'
          end
          object Label22: TLabel
            Left = 0
            Top = 300
            Width = 58
            Height = 13
            Caption = 'Observa'#231#227'o'
          end
          object Label23: TLabel
            Left = 3
            Top = 259
            Width = 70
            Height = 13
            Caption = 'Data Cadastro'
          end
          object Label24: TLabel
            Left = 407
            Top = 132
            Width = 81
            Height = 13
            Caption = 'Data Nascimento'
          end
          object Label25: TLabel
            Left = 154
            Top = 133
            Width = 59
            Height = 13
            Caption = 'C'#243'digo IBGE'
          end
          object Label26: TLabel
            Left = 592
            Top = 215
            Width = 40
            Height = 13
            Caption = 'Suframa'
          end
          object edtRazaoSocia_nome: TEdit
            Left = 250
            Top = 25
            Width = 200
            Height = 21
            TabOrder = 1
          end
          object edtNfantasia_apelido: TEdit
            Left = 456
            Top = 25
            Width = 222
            Height = 21
            TabOrder = 2
          end
          object EdtCNPJ_CPF: TEdit
            Left = 278
            Top = 65
            Width = 136
            Height = 21
            TabOrder = 5
            OnExit = EdtCNPJ_CPFExit
          end
          object RGTipo: TRadioGroup
            Left = 4
            Top = 14
            Width = 240
            Height = 35
            Caption = 'Tipo'
            Columns = 3
            ItemIndex = 1
            Items.Strings = (
              'Ambos'
              'Cliente'
              'Fornecedor')
            TabOrder = 0
            OnClick = RGTipoClick
            OnEnter = RGTipoEnter
            OnExit = RGTipoExit
          end
          object edtIM: TEdit
            Left = 556
            Top = 65
            Width = 120
            Height = 21
            TabOrder = 7
          end
          object edtEndereco: TEdit
            Left = 129
            Top = 107
            Width = 297
            Height = 21
            TabOrder = 9
          end
          object EDTBairro: TEdit
            Left = 432
            Top = 107
            Width = 180
            Height = 21
            TabOrder = 10
          end
          object DBLUF: TDBLookupComboBox
            Left = 260
            Top = 147
            Width = 49
            Height = 21
            KeyField = 'ID_UF'
            ListField = 'ESTADO'
            ListSource = Module.dtsUF
            TabOrder = 14
          end
          object edtTelefone: TEdit
            Left = 130
            Top = 189
            Width = 121
            Height = 21
            TabOrder = 19
          end
          object EDTFax: TEdit
            Left = 257
            Top = 189
            Width = 121
            Height = 21
            TabOrder = 20
          end
          object EDTCelular: TEdit
            Left = 3
            Top = 189
            Width = 121
            Height = 21
            TabOrder = 18
          end
          object edtPais: TEdit
            Left = 315
            Top = 146
            Width = 86
            Height = 21
            TabOrder = 15
          end
          object EDTNumero: TEdit
            Left = 618
            Top = 107
            Width = 58
            Height = 21
            TabOrder = 11
          end
          object edtContato: TEdit
            Left = 384
            Top = 189
            Width = 294
            Height = 21
            TabOrder = 22
          end
          object edtSite: TEdit
            Left = 2
            Top = 229
            Width = 309
            Height = 21
            TabOrder = 21
          end
          object rgClienteTipo: TRadioGroup
            Left = 2
            Top = 55
            Width = 122
            Height = 34
            Caption = 'Cliente Ativo'
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'Ativo'
              'Inativo')
            TabOrder = 3
          end
          object EDTCEP: TEdit
            Left = 3
            Top = 107
            Width = 120
            Height = 21
            TabOrder = 8
            OnExit = EDTCEPExit
          end
          object mObservacao: TMemo
            Left = 0
            Top = 319
            Width = 676
            Height = 170
            TabOrder = 26
          end
          object DT_Cadastro: TDateTimePicker
            Left = 3
            Top = 273
            Width = 123
            Height = 21
            Date = 41442.936708796290000000
            Time = 41442.936708796290000000
            TabOrder = 25
          end
          object DT_Nascimento: TDateTimePicker
            Left = 407
            Top = 147
            Width = 123
            Height = 21
            Date = 41442.936708796290000000
            Time = 41442.936708796290000000
            TabOrder = 16
          end
          object edtIBGE: TEdit
            Left = 154
            Top = 147
            Width = 100
            Height = 21
            TabOrder = 13
          end
          object edtSuframa: TEdit
            Left = 592
            Top = 229
            Width = 84
            Height = 21
            TabOrder = 24
          end
          object rgSexo: TRadioGroup
            Left = 536
            Top = 137
            Width = 142
            Height = 34
            Caption = 'Sexo'
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'Masculino'
              'Feminino')
            TabOrder = 17
          end
          object edtIE_RG: TEdit
            Left = 420
            Top = 65
            Width = 130
            Height = 21
            TabOrder = 6
          end
          object dblCidade: TDBLookupComboBox
            Left = 3
            Top = 147
            Width = 145
            Height = 21
            KeyField = 'ID_CIDADE'
            ListField = 'DESCRICAO'
            ListSource = Module.dtsCidade
            TabOrder = 12
          end
          object edtEmail: TEdit
            Left = 317
            Top = 229
            Width = 269
            Height = 21
            TabOrder = 23
          end
          object rgTipoPessoa: TRadioGroup
            Left = 130
            Top = 55
            Width = 143
            Height = 34
            Caption = 'Tipo Pessoa'
            Columns = 2
            ItemIndex = 1
            Items.Strings = (
              'F'#237'sica'
              'Jur'#237'dica')
            TabOrder = 4
            OnClick = rgTipoPessoaClick
            OnEnter = rgTipoPessoaEnter
            OnExit = rgTipoPessoaExit
          end
        end
      end
    end
    inherited PNL_Botoes: TPanel
      Width = 702
      ExplicitWidth = 702
      inherited SPB_Sair: TSpeedButton
        Left = 531
        ExplicitLeft = 671
      end
      inherited btnFiltrar: TImage
        OnClick = btnFiltrarClick
      end
      inherited pSair: TPanel
        Left = 633
        ExplicitLeft = 633
      end
    end
    inherited StatusBar1: TStatusBar
      Top = 574
      Width = 702
      ExplicitTop = 574
      ExplicitWidth = 702
    end
  end
  inherited BalloonHint: TBalloonHint
    Left = 584
    Top = 368
  end
  inherited qryGravar: TIBQuery
    Left = 584
    Top = 416
  end
  inherited qrySelect: TIBQuery
    Database = Module.IBLOJAHS
    Transaction = Module.IBTransaction
    SQL.Strings = (
      'SELECT * FROM CLIFOR'
      ''
      'WHERE 1=1')
    Left = 520
    Top = 384
    object qrySelectID_CLIFOR: TIntegerField
      FieldName = 'ID_CLIFOR'
      Origin = '"CLIFOR"."ID_CLIFOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrySelectNOMEFANTASIA: TIBStringField
      FieldName = 'NOMEFANTASIA'
      Origin = '"CLIFOR"."NOMEFANTASIA"'
      Size = 60
    end
    object qrySelectRAZAOSOCIAL: TIBStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = '"CLIFOR"."RAZAOSOCIAL"'
      Required = True
      Size = 60
    end
    object qrySelectCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = '"CLIFOR"."CNPJ"'
      EditMask = '00000-999;0;_'
      Size = 30
    end
    object qrySelectCPF: TIBStringField
      FieldName = 'CPF'
      Origin = '"CLIFOR"."CPF"'
      EditMask = '00000-999;0;_'
      Size = 30
    end
    object qrySelectIE: TIBStringField
      FieldName = 'IE'
      Origin = '"CLIFOR"."IE"'
      EditMask = '999.999.999.999;0;_'
      Size = 30
    end
    object qrySelectRG: TIBStringField
      FieldName = 'RG'
      Origin = '"CLIFOR"."RG"'
      EditMask = '00.000.000-99;0;_'
      Size = 30
    end
    object qrySelectIM: TIBStringField
      FieldName = 'IM'
      Origin = '"CLIFOR"."IM"'
      EditMask = '99999999;0;_'
      Size = 30
    end
    object qrySelectENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = '"CLIFOR"."ENDERECO"'
      Size = 60
    end
    object qrySelectBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = '"CLIFOR"."BAIRRO"'
      Size = 60
    end
    object qrySelectCIDADE: TIntegerField
      FieldName = 'CIDADE'
      Origin = '"CLIFOR"."CIDADE"'
    end
    object qrySelectUF: TIntegerField
      FieldName = 'UF'
      Origin = '"CLIFOR"."UF"'
    end
    object qrySelectTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Origin = '"CLIFOR"."TELEFONE"'
      EditMask = '!\(99\)0000-0000;0;_'
      Size = 30
    end
    object qrySelectFAX: TIBStringField
      FieldName = 'FAX'
      Origin = '"CLIFOR"."FAX"'
      EditMask = '!\(99\)0000-0000;0;_'
      Size = 30
    end
    object qrySelectCELULAR: TIBStringField
      FieldName = 'CELULAR'
      Origin = '"CLIFOR"."CELULAR"'
      EditMask = '!\(99\)00000-0000;0;_'
      Size = 30
    end
    object qrySelectPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = '"CLIFOR"."PAIS"'
      Size = 60
    end
    object qrySelectNUMEROCASA: TIBStringField
      FieldName = 'NUMEROCASA'
      Origin = '"CLIFOR"."NUMEROCASA"'
      Size = 30
    end
    object qrySelectCONTATO: TIBStringField
      FieldName = 'CONTATO'
      Origin = '"CLIFOR"."CONTATO"'
      Size = 60
    end
    object qrySelectEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = '"CLIFOR"."EMAIL"'
      Size = 60
    end
    object qrySelectSITE: TIBStringField
      FieldName = 'SITE'
      Origin = '"CLIFOR"."SITE"'
      Size = 60
    end
    object qrySelectATIVO: TIBStringField
      FieldName = 'ATIVO'
      Origin = '"CLIFOR"."ATIVO"'
      FixedChar = True
      Size = 1
    end
    object qrySelectCEP: TIBStringField
      FieldName = 'CEP'
      Origin = '"CLIFOR"."CEP"'
      EditMask = '00000-999;0;_'
      Size = 10
    end
    object qrySelectTIPOCLIFOR: TIBStringField
      FieldName = 'TIPOCLIFOR'
      Origin = '"CLIFOR"."TIPOCLIFOR"'
      Required = True
      Size = 1
    end
    object qrySelectOBSERVACAO: TBlobField
      FieldName = 'OBSERVACAO'
      Origin = '"CLIFOR"."OBSERVACAO"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object qrySelectDTCADASTRO: TDateField
      FieldName = 'DTCADASTRO'
      Origin = '"CLIFOR"."DTCADASTRO"'
    end
    object qrySelectDATA_NASC: TDateField
      FieldName = 'DATA_NASC'
      Origin = '"CLIFOR"."DATA_NASC"'
    end
    object qrySelectCOD_IBGE_CIDADE: TIBStringField
      FieldName = 'COD_IBGE_CIDADE'
      Origin = '"CLIFOR"."COD_IBGE_CIDADE"'
      Size = 7
    end
    object qrySelectSUFRAMA: TIBStringField
      FieldName = 'SUFRAMA'
      Origin = '"CLIFOR"."SUFRAMA"'
      Size = 15
    end
    object qrySelectSEXO: TIBStringField
      FieldName = 'SEXO'
      Origin = '"CLIFOR"."SEXO"'
      FixedChar = True
      Size = 1
    end
    object qrySelectTIPODOC: TIBStringField
      FieldName = 'TIPODOC'
      Origin = '"CLIFOR"."TIPODOC"'
      Required = True
      Size = 1
    end
  end
  inherited dtsSelect: TDataSource
    Left = 520
    Top = 432
  end
end
