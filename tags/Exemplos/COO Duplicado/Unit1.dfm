object FrmDuplicidadeC460: TFrmDuplicidadeC460
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Duplicidade C460'
  ClientHeight = 472
  ClientWidth = 627
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 13
    Width = 108
    Height = 13
    Caption = 'Nome do Computador:'
  end
  object Label2: TLabel
    Left = 135
    Top = 13
    Width = 57
    Height = 13
    Caption = 'Data Inicial:'
  end
  object Label3: TLabel
    Left = 238
    Top = 13
    Width = 52
    Height = 13
    Caption = 'Data Final:'
  end
  object Label4: TLabel
    Left = 8
    Top = 59
    Width = 101
    Height = 13
    Caption = 'Lista COO Duplicado:'
  end
  object Label5: TLabel
    Left = 159
    Top = 59
    Width = 90
    Height = 13
    Caption = 'Lista VENDAS ECF:'
  end
  object Label6: TLabel
    Left = 159
    Top = 234
    Width = 118
    Height = 13
    Caption = 'Lista VENDAS ECF ITENS'
  end
  object btnGerar: TButton
    Left = 8
    Top = 409
    Width = 300
    Height = 55
    Caption = '&Gerar'
    Enabled = False
    TabOrder = 0
    OnClick = btnGerarClick
  end
  object ProgressBar1: TProgressBar
    Left = 135
    Top = 78
    Width = 18
    Height = 325
    Orientation = pbVertical
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object mDuplicador: TMemo
    Left = 8
    Top = 78
    Width = 121
    Height = 325
    Ctl3D = False
    ParentCtl3D = False
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object btnConectar: TButton
    Left = 341
    Top = 8
    Width = 277
    Height = 64
    Caption = '&Conectar'
    TabOrder = 3
    OnClick = btnConectarClick
  end
  object edtNomePC: TEdit
    Left = 8
    Top = 32
    Width = 121
    Height = 19
    CharCase = ecUpperCase
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 4
  end
  object DtInicial: TDateTimePicker
    Left = 135
    Top = 32
    Width = 97
    Height = 21
    Date = 41334.548387488420000000
    Time = 41334.548387488420000000
    TabOrder = 5
  end
  object DtFinal: TDateTimePicker
    Left = 238
    Top = 32
    Width = 97
    Height = 21
    Date = 41364.548503356480000000
    Time = 41364.548503356480000000
    TabOrder = 6
  end
  object gVenda: TDBGrid
    Left = 159
    Top = 78
    Width = 459
    Height = 150
    Ctl3D = False
    DataSource = dtsVenda
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawDataCell = gVendaDrawDataCell
  end
  object gItem: TDBGrid
    Left = 159
    Top = 253
    Width = 459
    Height = 150
    Ctl3D = False
    DataSource = dtsItem
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnSair: TButton
    Left = 314
    Top = 409
    Width = 304
    Height = 55
    Caption = '&Sair'
    TabOrder = 9
    OnClick = btnSairClick
  end
  object Connection: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 512
    Top = 104
  end
  object qry: TADOQuery
    Connection = Connection
    Parameters = <>
    Left = 576
    Top = 104
  end
  object qry2: TADOQuery
    Connection = Connection
    Parameters = <>
    Left = 544
    Top = 104
  end
  object qryDel_Desativa: TADOQuery
    Connection = Connection
    Parameters = <>
    Left = 544
    Top = 136
  end
  object QrySelecao: TADOQuery
    Connection = Connection
    Parameters = <>
    Left = 576
    Top = 136
  end
  object dtsVenda: TDataSource
    Left = 576
    Top = 168
  end
  object dtsItem: TDataSource
    Left = 512
    Top = 168
  end
  object qryItem: TADOQuery
    Connection = Connection
    Parameters = <>
    Left = 512
    Top = 136
  end
  object qrySel_Item: TADOQuery
    Connection = Connection
    Parameters = <>
    Left = 544
    Top = 168
  end
end
