object fSelection: TfSelection
  Left = 1233
  Top = 232
  ActiveControl = Button1
  BorderStyle = bsDialog
  Caption = #1057#1087#1080#1089#1086#1082' '#1084#1077#1088#1086#1087#1088#1080#1103#1090#1080#1081
  ClientHeight = 270
  ClientWidth = 499
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 106
    Top = 227
    Width = 111
    Height = 30
    Caption = #1042#1099#1073#1088#1072#1090#1100
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = Button1Click
  end
  object DBLookupListBox2: TDBLookupListBox
    Left = 0
    Top = 0
    Width = 499
    Height = 212
    Align = alTop
    DataField = 'DateName'
    KeyField = 'Competition_ID'
    ListField = 'DateName'
    ListSource = DataMain.dsComp
    TabOrder = 0
    OnDblClick = Button1Click
  end
  object Button2: TButton
    Left = 280
    Top = 227
    Width = 112
    Height = 30
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1086#1077
    ModalResult = 2
    TabOrder = 2
    OnClick = Button2Click
  end
end
