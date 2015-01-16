object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 130
  ClientWidth = 307
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 39
    Top = 24
    Width = 243
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 39
    Top = 51
    Width = 75
    Height = 25
    Caption = 'Crypt'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 120
    Top = 51
    Width = 75
    Height = 25
    Caption = 'DesCrypt'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 39
    Top = 82
    Width = 156
    Height = 25
    Caption = 'Outra Crypt e DesCrypt'
    TabOrder = 3
    OnClick = Button3Click
  end
end
