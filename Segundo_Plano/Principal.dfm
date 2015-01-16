object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'frmPrincipal'
  ClientHeight = 121
  ClientWidth = 246
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Timer: TTimer
    Interval = 5000
    OnTimer = TimerTimer
    Left = 32
    Top = 16
  end
  object cLedCommerce: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=Led#Wa4e$;Persist Security Info=Fal' +
      'se;User ID=sa;Data Source=CPD09\LEDWARE'
    DefaultDatabase = 'LEDC0001'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 72
    Top = 16
  end
  object PopupMenu1: TPopupMenu
    Left = 72
    Top = 56
    object Close1: TMenuItem
      Caption = 'Close'
      OnClick = Close1Click
    end
  end
end
