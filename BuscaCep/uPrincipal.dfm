object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Busca CEP - UNISAL - EDSON - PAULO'
  ClientHeight = 342
  ClientWidth = 593
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 145
    Top = 8
    Width = 55
    Height = 13
    Caption = 'Logradouro'
  end
  object Label2: TLabel
    Left = 272
    Top = 8
    Width = 28
    Height = 13
    Caption = 'Bairro'
  end
  object Label3: TLabel
    Left = 526
    Top = 8
    Width = 13
    Height = 13
    Caption = 'UF'
  end
  object Label4: TLabel
    Left = 18
    Top = 8
    Width = 19
    Height = 13
    Caption = 'CEP'
  end
  object Label5: TLabel
    Left = 399
    Top = 8
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  object Label6: TLabel
    Left = 18
    Top = 56
    Width = 93
    Height = 13
    Caption = 'Endere'#231'o Completo'
  end
  object eLogradouro: TEdit
    Left = 145
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 1
    OnEnter = eLogradouroEnter
  end
  object eBairro: TEdit
    Left = 272
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object eUF: TEdit
    Left = 526
    Top = 24
    Width = 47
    Height = 21
    TabOrder = 4
  end
  object btnImportar: TBitBtn
    Left = 18
    Top = 99
    Width = 75
    Height = 25
    Caption = '&Importar'
    TabOrder = 6
    OnClick = btnImportarClick
  end
  object mCEP: TMemo
    Left = 18
    Top = 71
    Width = 555
    Height = 22
    ReadOnly = True
    TabOrder = 5
  end
  object eCidade: TEdit
    Left = 399
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object Keyboard: TTouchKeyboard
    Left = 18
    Top = 144
    Width = 555
    Height = 180
    GradientEnd = clSilver
    GradientStart = clGray
    Layout = 'Standard'
  end
  object eCEP2: TEdit
    Left = 18
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
    OnEnter = eCEP21Enter
  end
  object HTTPRIO: THTTPRIO
    HTTPWebNode.UseUTF8InHeader = True
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    HTTPWebNode.WebNodeOptions = []
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 136
    Top = 95
  end
end
