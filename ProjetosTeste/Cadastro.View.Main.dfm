object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object pnlContainer: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 441
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 185
      Height = 441
      Align = alLeft
      Caption = 'Panel1'
      TabOrder = 0
      ExplicitLeft = 224
      ExplicitTop = 200
      ExplicitHeight = 41
    end
    object Panel2: TPanel
      Left = 439
      Top = 0
      Width = 185
      Height = 441
      Align = alRight
      Caption = 'Panel2'
      TabOrder = 1
      ExplicitLeft = 224
      ExplicitTop = 200
      ExplicitHeight = 41
    end
  end
end
