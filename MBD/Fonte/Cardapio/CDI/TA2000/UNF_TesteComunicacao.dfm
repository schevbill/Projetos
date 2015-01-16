object FRM_TesteComunicacao: TFRM_TesteComunicacao
  Left = 217
  Top = 162
  BorderStyle = bsDialog
  Caption = 'Teste Comunica'#231#227'o'
  ClientHeight = 98
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 56
    Height = 15
    Caption = 'Comando:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 48
    Width = 49
    Height = 15
    Caption = 'Retorno:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object EDT_Comando: TEdit
    Left = 16
    Top = 22
    Width = 309
    Height = 21
    PopupMenu = PopupMenu1
    TabOrder = 0
  end
  object BNT_Enviar: TButton
    Left = 332
    Top = 16
    Width = 75
    Height = 69
    Caption = 'Enviar'
    TabOrder = 1
    OnClick = BNT_EnviarClick
  end
  object EDT_Retorno: TEdit
    Left = 16
    Top = 62
    Width = 309
    Height = 21
    TabOrder = 2
  end
  object PopupMenu1: TPopupMenu
    Left = 380
    Top = 16
    object Limpar1: TMenuItem
      Caption = 'Limpar'
      OnClick = Limpar1Click
    end
    object Imprimir1: TMenuItem
      Caption = 'Imprimir'
      OnClick = Imprimir1Click
    end
    object Entrada1: TMenuItem
      Caption = 'Entrada'
      OnClick = Entrada1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Encerrar1: TMenuItem
      Caption = 'Encerrar'
      OnClick = Encerrar1Click
    end
  end
end
