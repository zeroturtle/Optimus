object License_Expired: TLicense_Expired
  Left = 490
  Top = 246
  BorderStyle = bsDialog
  Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1083#1080#1094#1077#1085#1079#1080#1080
  ClientHeight = 269
  ClientWidth = 455
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 57
    Top = 216
    Width = 133
    Height = 35
    Caption = #1055#1088#1086#1076#1086#1083#1078#1080#1090#1100
    ModalResult = 1
    TabOrder = 0
  end
  object Button2: TButton
    Left = 265
    Top = 216
    Width = 133
    Height = 35
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1083#1080#1094#1077#1085#1079#1080#1102
    TabOrder = 1
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 441
    Height = 193
    Color = clWindowFrame
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Licence File|*.lic'
    Left = 224
    Top = 200
  end
end
