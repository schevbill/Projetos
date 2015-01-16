object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'XML'
  ClientHeight = 44
  ClientWidth = 335
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 48
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Teste XML'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 129
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 210
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Sat XML'
    TabOrder = 2
    OnClick = Button3Click
  end
  object XMLDocument2: TXMLDocument
    Left = 8
    Top = 8
    DOMVendorDesc = 'MSXML'
  end
end
