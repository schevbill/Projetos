object FPrincipal: TFPrincipal
  Left = 339
  Top = 197
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Gest'#227'o de Materiais'
  ClientHeight = 331
  ClientWidth = 861
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 312
    Width = 861
    Height = 19
    BiDiMode = bdRightToLeftReadingOnly
    Panels = <
      item
        Alignment = taCenter
        Width = 150
      end
      item
        Alignment = taCenter
        BiDiMode = bdRightToLeftReadingOnly
        ParentBiDiMode = False
        Width = 100
      end
      item
        Alignment = taCenter
        Width = 80
      end
      item
        Width = 40
      end>
    ParentBiDiMode = False
  end
  object MainMenu1: TMainMenu
    Left = 152
    Top = 8
    object CadastroClientes1: TMenuItem
      Caption = '&Cadastros'
      object Clientes1: TMenuItem
        Caption = '&Pacientes'
        OnClick = Clientes1Click
      end
      object Produtos1: TMenuItem
        Caption = '&Material'
        OnClick = Produtos1Click
      end
      object Usurios1: TMenuItem
        Caption = '&Usu'#225'rios'
        OnClick = Usurios1Click
      end
      object Sair1: TMenuItem
        Caption = '&Sair'
        OnClick = Sair1Click
      end
    end
    object OF1: TMenuItem
      Caption = '&Lan'#231'amentos'
      object BuscarOF1: TMenuItem
        Caption = 'L&an'#231'amento de Material'
        OnClick = BuscarOF1Click
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object otalMensal1: TMenuItem
        Caption = 'Gerencial Mensal'
        OnClick = otalMensal1Click
      end
    end
  end
  object XPManifest1: TXPManifest
    Left = 624
    Top = 64
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 16
    Top = 36
  end
end
