object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object btnMultiThreading: TButton
    Left = 104
    Top = 152
    Width = 75
    Height = 25
    Caption = 'btnMultiThreading'
    TabOrder = 0
    OnClick = btnMultiThreadingClick
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=js_lib'
      'User_Name=activeone'
      'Password=M@st3rk3y'
      'Server=obadiah'
      'DriverID=MySQL')
    ConnectedStoredUsage = []
    LoginPrompt = False
    Left = 32
    Top = 40
  end
end
