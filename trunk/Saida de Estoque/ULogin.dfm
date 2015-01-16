object FLogin: TFLogin
  Left = 898
  Top = 387
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Login'
  ClientHeight = 216
  ClientWidth = 308
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 308
    Height = 164
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 55
      Top = 53
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Usu'#225'rio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 63
      Top = 85
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nome:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 60
      Top = 116
      Width = 34
      Height = 13
      Alignment = taRightJustify
      Caption = 'Senha:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edtUsuario: TEdit
      Left = 97
      Top = 49
      Width = 121
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnExit = edtusuarioExit
    end
    object edtNome: TEdit
      Left = 97
      Top = 81
      Width = 121
      Height = 21
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edtSenha: TEdit
      Left = 97
      Top = 113
      Width = 121
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 2
      OnKeyPress = edtSenhaKeyPress
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 164
    Width = 308
    Height = 52
    Align = alBottom
    TabOrder = 1
    object btnSair: TBitBtn
      Left = 193
      Top = 14
      Width = 75
      Height = 25
      Caption = '&Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FF0955A10857A60557AA0655A70954A00954A0FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0872DD0362C3006CDB0877E711
        7DEA0877E70069DD005DC70654A50654A5FF00FFFF00FFFF00FFFF00FFFF00FF
        0F6BC90872DD3E99F591C4F9D6E9FDEEF7FFE4F1FFB0D4FB59A5F50570E5035A
        B70B5095FF00FFFF00FFFF00FF1278E0127CE870B4F9F6FAFEFFFFFFEEF6FDD3
        E6FBE2EEFDFFFFFFFFFFFFAED2FA0E78ED025AB60653A2FF00FFFF00FF1278E0
        6DB2F9FEFEFFE9F3FD1E7FF00D73ED1474EB066BE90C6FE889B9F4E6F0FDB0D5
        FA0970E60653A2FF00FF0B70D53695F4E8F3FEFFFFFF89BAF48FC0F92A86F110
        75EE1275EC1E79EC84B5F489BAF4FFFFFF58A5F5005EC70858AB137AE371B5FB
        FFFFFFB2D7FC278CF992C4FBDAEAFD318BF3388DF2D7E8FC87B8F50D71EAE6F0
        FDB3D7FB016BDE0858AB1F85ECA2CFFDFFFFFF419EFD3495FB298DF992C5FBE6
        F1FEE5F1FD88BCF71075EE0B70EBB4D2F8E6F3FF0E7BE9065AB02F8FF1B7DAFD
        FFFFFF419FFF3196FE3094FC469EFCF1F8FEF1F8FE3892F5187DF11378EF9FC9
        F7F0F8FF1A82EC055CB53693F0B8DAFEFFFFFF59ACFF3499FF55A9FEE8F3FF85
        BFFD83BDFCE7F2FE4498F61A7FF2D3E6FCD9EBFE117DE9095CB22689EDAFD6FD
        FFFFFFC3E1FF4AA4FFEDF6FF81C0FF3296FE2E93FC7BBAFDEBF5FE59A5F8E9F3
        FE99C9FA0773E10958ABFF00FF3994F0F1F8FFFBFDFF78BBFF61AFFF3499FF34
        99FF3398FF3095FD68B0FCF4FAFFF5FAFE49A0F7076ACEFF00FFFF00FF3994F0
        CDE6FFF6FAFFFBFDFFC1DFFF58ABFF43A0FF49A3FF84C1FEFBFDFFFFFFFF78B9
        F9137BE6076ACEFF00FFFF00FFFF00FF64ACF6D4EAFFF9FCFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFE7F3FE77B8FA1D85ED0D6DD0FF00FFFF00FFFF00FFFF00FF
        FF00FF459AF0A7D2FCD8ECFFE2F1FFE4F1FED1E7FE9DCDFD4DA2F7177FE8177F
        E8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3B94F061ABF665
        ADF7489EF42286EC127AE4FF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentFont = False
      TabOrder = 1
      OnClick = btnSairClick
    end
    object btnEntrar: TBitBtn
      Left = 41
      Top = 14
      Width = 75
      Height = 25
      Caption = '&Entrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FF002400002400002100001900001600001600FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004D01004D011F642253845468
        956B608A60356236062D06001600001600FF00FFFF00FFFF00FFFF00FFFF00FF
        005F0218751DA4CBA7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9E5D94B754D001C
        00001801FF00FFFF00FFFF00FF006C0325882BE2F0E3FFFFFFE5EFE68CB28E64
        9065729772BDCFBDFFFFFFFFFFFF6A8F6A001D00001A00FF00FFFF00FF0C8213
        D8EED9FFFFFF82B68608500A023903023102002C01022D023C6A3CEFF4EFFFFF
        FF4B754C001A00FF00FF00830472C277FFFFFF9CCC9E065D09074C0978A37A0A
        430A033503012F020028013D6C3EFFFFFFDCE6DC063206002800078E0FC9EACA
        FFFFFF208A270C660F0A5C0DFFFFFFAAC7AB114F12033A04033403002F01BFD1
        C0FFFFFF366B38002800189820EEF8EFD5EFD81082160F75130E6C11EEF6EFFF
        FFFFC4DAC529692B044105033703739975FFFFFF63966500360031A638FFFFFF
        BFE6C2148B19138418117B16EEF6EEFFFFFFFFFFFFB4D1B5074E090646076291
        64FFFFFF6DA3700041003DAD45FFFFFEE9F7EA17961D16911C14891AEFF7EFFF
        FFFFB6D8B7247A280A5E0D0652088CB68FFFFFFF57985A0045002EA636EBF7ED
        FFFFFF3BAC4118981E16951CFBFEFC9ED3A118841D1077140E6E120D6610E5EF
        E5FFFFFF237927004500FF00FFB6E2BAFFFFFFCCEBCE1D9C2418981E77C77D19
        951E168C1B1387180C780F86BF89FFFFFFABD4AF015E03FF00FFFF00FF50B656
        F8FCF8FFFFFFCEEBCF3AAC4118981E17981D13951A249C2B9CD3A0FFFFFFE5F3
        E51A8420015E03FF00FFFF00FFFF00FF83CC89FCFEFCFFFFFFFFFFFFE6F6E7BC
        E5C0CFEDD3FFFFFFFFFFFFD5EDD727982E006F02FF00FFFF00FFFF00FFFF00FF
        FF00FF6FC576D5EFD8FFFFFFFFFFFFFFFFFFFFFFFFF3FAF396D59C15971D006F
        02FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5BBC6268C26E8CD09296
        D59977C77D3FAD470B9213FF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentFont = False
      TabOrder = 0
      OnClick = btnEntrarClick
    end
  end
  object PUSUARIO: TIBQuery
    Database = DMCAD.IBDCADCLIENTE
    Transaction = DMCAD.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DMCAD.DTSUsuario
    ParamCheck = True
    SQL.Strings = (
      'select '
      'ID_USUARIO,'
      'NOME,'
      'SENHA,'
      'USUARIO'
      ' from USUARIOS'
      '')
    Left = 248
    Top = 16
    object PUSUARIOID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = '"USUARIOS"."ID_USUARIO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object PUSUARIONOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"USUARIOS"."NOME"'
      Required = True
      Size = 60
    end
    object PUSUARIOSENHA: TIBStringField
      FieldName = 'SENHA'
      Origin = '"USUARIOS"."SENHA"'
      Size = 6
    end
    object PUSUARIOUSUARIO: TIBStringField
      FieldName = 'USUARIO'
      Origin = '"USUARIOS"."USUARIO"'
      Required = True
      Size = 15
    end
  end
end
