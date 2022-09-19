object License_Expired: TLicense_Expired
  Left = 490
  Top = 246
  BorderStyle = bsDialog
  Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1083#1080#1094#1077#1085#1079#1080#1080
  ClientHeight = 272
  ClientWidth = 366
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 39
    Top = 56
    Width = 280
    Height = 112
    Caption = 
      #1055#1088#1077#1080#1084#1091#1097#1077#1089#1090#1074#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080':'#13#10#13#10'  * '#1055#1086#1076#1087#1080#1089#1082#1072' '#1085#1072' '#1085#1086#1074#1086#1089#1090#1080';'#13#10'  * 5 '#1089#1091#1076 +
      #1077#1081#1089#1082#1080#1093' '#1082#1086#1085#1089#1086#1083#1077#1081';'#13#10'  * '#1044#1086#1089#1090#1091#1087' '#1082#1086' '#1089#1077#1088#1074#1080#1089#1085#1099#1084' '#1084#1086#1076#1091#1083#1103#1084';'#13#10'  * '#1056#1072#1079#1088#1077#1096#1077#1085 +
      #1099' '#1042#1089#1077' '#1090#1080#1087#1099' '#1084#1077#1088#1086#1087#1088#1080#1103#1090#1080#1081';'#13#10'  * '#1055#1088#1080#1086#1088#1080#1090#1077#1090#1085#1086#1077' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1074#1077#1088#1089#1080#1081
    Color = clWindow
    ParentColor = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 112
    Top = 182
    Width = 145
    Height = 33
    Alignment = taCenter
    AutoSize = False
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1083#1080#1094#1077#1085#1079#1080#1102
    Color = clGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
    Visible = False
    OnClick = Label2Click
    OnMouseEnter = Label2MouseEnter
    OnMouseLeave = Label2MouseLeave
  end
  object Label3: TLabel
    Left = 40
    Top = 16
    Width = 48
    Height = 16
    Caption = 'Label3'
  end
  object Button1: TButton
    Left = 118
    Top = 224
    Width = 133
    Height = 35
    Caption = #1055#1088#1086#1076#1086#1083#1078#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 0
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Licence File|*.lic'
    Left = 256
    Top = 8
  end
end
