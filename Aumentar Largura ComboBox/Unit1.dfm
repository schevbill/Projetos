object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 300
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ComboBox1: TComboBox
    Left = 280
    Top = 112
    Width = 145
    Height = 26
    AutoDropDown = True
    AutoCloseUp = True
    Style = csOwnerDrawFixed
    DropDownCount = 80
    ImeMode = imClose
    ItemHeight = 20
    TabOrder = 0
    OnEnter = ComboBox1Enter
    Items.Strings = (
      'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbb'
      '2222222222222222222222222222222223333333333333')
  end
end
