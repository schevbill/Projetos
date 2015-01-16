object FCadProduto: TFCadProduto
  Left = 464
  Top = 279
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cadastro de Material'
  ClientHeight = 362
  ClientWidth = 734
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 734
    Height = 321
    Align = alClient
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 732
      Height = 319
      ActivePage = TabSheet2
      Align = alClient
      TabOrder = 0
      OnChange = PageControl1Change
      object TabSheet1: TTabSheet
        Caption = 'Cadastro Material'
        object Label2: TLabel
          Left = 42
          Top = 26
          Width = 36
          Height = 13
          Alignment = taRightJustify
          Caption = 'C'#243'digo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label1: TLabel
          Left = 38
          Top = 57
          Width = 40
          Height = 13
          Alignment = taRightJustify
          Caption = 'Material:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 27
          Top = 89
          Width = 51
          Height = 13
          Alignment = taRightJustify
          Caption = 'Descri'#231#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 7
          Top = 119
          Width = 71
          Height = 13
          Alignment = taRightJustify
          Caption = 'Data Cadastro:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBCodigo: TDBEdit
          Left = 80
          Top = 21
          Width = 70
          Height = 21
          DataField = 'CODIGO'
          DataSource = DMCAD.DTSitem
          Enabled = False
          TabOrder = 0
        end
        object DBProduto: TDBEdit
          Left = 80
          Top = 53
          Width = 200
          Height = 21
          DataField = 'ITEM'
          DataSource = DMCAD.DTSitem
          Enabled = False
          TabOrder = 1
        end
        object DBComplemento: TDBEdit
          Left = 80
          Top = 85
          Width = 300
          Height = 21
          DataField = 'DESCRICAO'
          DataSource = DMCAD.DTSitem
          Enabled = False
          TabOrder = 2
        end
        object DBNavigator1: TDBNavigator
          Left = 0
          Top = 272
          Width = 220
          Height = 18
          DataSource = DMCAD.DTSitem
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          TabOrder = 3
        end
        object DTCadastro: TDateTimePicker
          Left = 80
          Top = 116
          Width = 97
          Height = 21
          Date = 0.548407835653051700
          Time = 0.548407835653051700
          Enabled = False
          TabOrder = 4
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Procurar Material'
        ImageIndex = 1
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 724
          Height = 55
          Align = alTop
          TabOrder = 0
          object Label6: TLabel
            Left = 50
            Top = 5
            Width = 61
            Height = 13
            Caption = 'C'#243'digo MAT.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label5: TLabel
            Left = 3
            Top = 20
            Width = 45
            Height = 13
            Caption = 'Procurar:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label7: TLabel
            Left = 125
            Top = 5
            Width = 83
            Height = 13
            Caption = 'Nome do Material'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edtCODIGO: TMaskEdit
            Left = 48
            Top = 18
            Width = 60
            Height = 21
            TabOrder = 0
            Text = ''
          end
          object edtNome: TMaskEdit
            Left = 124
            Top = 18
            Width = 200
            Height = 21
            TabOrder = 1
            Text = ''
          end
          object BtnFiltrar: TBitBtn
            Left = 640
            Top = 16
            Width = 70
            Height = 25
            Caption = 'Filtrar'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              0800000000000001000000000000000000000001000000010000FF00FF008C6B
              6C0087707000AE877C000D7FA9006F7C88006D7C94001F7ECE000E80AA001180
              A7001081AB00048CB900078DBC000B8DBA000C8DBA00088EBC001285B0007882
              95006092BD005EA8BE000A91C1000F9DCE002087DE0011A7D10030BCDC001F89
              E00059A9DC0044BADD004ABFE00057AEF4004DB1F90049B2FF004EB7FF0057B1
              F60050B6FE0022D7FC0024D7FF0024D8FD0039D7FB0035D8FD004BC6DC0046C6
              E40048D5EE0075D3E90058E9FD006FE6FF0070E6FF0071F9FE007BFFFF008683
              88008B8697008F989B00969594009C919000AD858000AD868500AB939500A49E
              9900B1979400B5A09F008AA5AD00CAA08C00CDAC9300C2A69A00F3BE8000C6AE
              A000CFB7A100D3BBA200F4C88E00F5CB9A00F5D09C00F8D09800DAC5B700E4CC
              A900EFD2A900ECD1AC00F6DAAB00F5DEB500F5E1B600F9E1B100FEEAB900FFF2
              BA00A1C6C8008DE6FA0081F8FE008CFAFD008DFCFE0097FCFD009BFBFD00B8ED
              F600A7FFFF00AAFFFE00ADFFFE00B6F6FF00B1FCFD00B4FFFF00ECDDCC00E8DD
              D600FFF7C600FCF5CD00FCF7D100FAF6D600FFFBD500FEFED600F7F2D900FEFF
              D900FFFEDD00C6F5FF00C6FEFF00D2FFFF00FEF7E000FBFCE100FDFFE100FFFF
              E400E3FEFF00F9F6F200FFFFF400F1FBFC00F5FFFE00FBFFFF00000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000605000004080408080A000000000011191A000B2A23272D
              531B080000001116201D0B552C23272E531C1509003207201D000F552C23272B
              3A3F41030112202000000F552C252938606771684236200000000B5F5D6B3B61
              74676A67513D000000000B59181735716A676A63474B360000000F282C23396A
              6A6A6A4C404D360000000B552C2534656A654F455049360000000B552C251343
              6247446E7336000000000B552C25263C3E4B4E483636000000000F55542F3057
              523331020000000000000B77766D5F5C5C5C2F08000000000000001476726C5C
              5A58100000000000000000000F0F0B0F0F0F0000000000000000}
            ParentFont = False
            TabOrder = 2
            OnClick = BtnFiltrarClick
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 56
          Width = 724
          Height = 210
          Align = alCustom
          TabOrder = 1
          object DBGrid1: TDBGrid
            Left = 1
            Top = 1
            Width = 722
            Height = 208
            Align = alClient
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = DBGrid1DblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'CODIGO'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Title.Caption = 'C'#243'digo'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ITEM'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Title.Caption = 'Material'
                Width = 250
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCRICAO'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Title.Caption = 'Descri'#231#227'o'
                Width = 300
                Visible = True
              end>
          end
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 321
    Width = 734
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnNovo: TBitBtn
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Novo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
        0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
        33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object BtnAlterar: TBitBtn
      Left = 96
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Alterar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      OnClick = BtnAlterarClick
    end
    object BtnApagar: TBitBtn
      Left = 184
      Top = 8
      Width = 75
      Height = 25
      Caption = 'A&pagar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777777777777777777777700000000007777770FFFFFFFF07777770FFFFFFF
        F077771F0F888888F077711F0F85BFB8F0777711F11BFBF8F077777151788888
        F077777511FFFFFFF07775111F1FFF00007771570FF1FF0F077777770FFFFF00
        7777777700000007777777777777777777777777777777777777}
      ParentFont = False
      TabOrder = 2
      OnClick = BtnApagarClick
    end
    object BtnGravar: TBitBtn
      Left = 524
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Gravar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 3
      OnClick = BtnGravarClick
    end
    object BtnCancelar: TBitBtn
      Left = 605
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 4
      OnClick = BtnCancelarClick
    end
  end
end
