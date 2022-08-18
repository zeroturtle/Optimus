object fOptions: TfOptions
  Left = 486
  Top = 139
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 413
  ClientWidth = 448
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 16
    Top = 170
    Width = 112
    Height = 26
    Caption = #1050#1072#1090#1072#1083#1086#1075' '#1074#1080#1076#1077#1086#1092#1072#1081#1083#1086#1074#13#10'Videofile Directory'
  end
  object Label1: TLabel
    Left = 16
    Top = 12
    Width = 110
    Height = 26
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1082#1086#1085#1089#1086#1083#1077#1081#13#10'Judges Qty'
  end
  object Label10: TLabel
    Left = 224
    Top = 209
    Width = 115
    Height = 26
    Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1099#1081' '#1096#1090#1088#1072#1092#13#10'Maximum Penalty'
  end
  object Label9: TLabel
    Left = 16
    Top = 216
    Width = 116
    Height = 13
    Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1086#1094#1077#1085#1082#1072
  end
  object Label8: TLabel
    Left = 304
    Top = 136
    Width = 88
    Height = 13
    Caption = '('#1092#1080#1082#1089#1080#1088#1086#1074#1072#1085#1085#1099#1081')'
  end
  object Label7: TLabel
    Left = 304
    Top = 96
    Width = 88
    Height = 13
    Caption = '('#1092#1080#1082#1089#1080#1088#1086#1074#1072#1085#1085#1099#1081')'
  end
  object Label6: TLabel
    Left = 16
    Top = 129
    Width = 137
    Height = 26
    Caption = #1055#1077#1088#1080#1086#1076' '#1079#1072#1076#1077#1088#1078#1082#1080' '#1085#1072#1078#1072#1090#1080#1103#13#10'Push Protect Period, ms'
  end
  object Label3: TLabel
    Left = 16
    Top = 89
    Width = 127
    Height = 26
    Caption = #1047#1072#1076#1077#1088#1078#1082#1072' '#1089#1088#1072#1073#1072#1090#1099#1074#1072#1085#1080#1103#13#10'Consensus Time, ms'
  end
  object Label2: TLabel
    Left = 16
    Top = 51
    Width = 182
    Height = 26
    Caption = #1057#1082#1086#1088#1086#1089#1090#1100' '#1079#1072#1084#1077#1076#1083#1077#1085#1085#1086#1075#1086' '#1087#1088#1086#1089#1084#1086#1090#1088#1072#13#10'Playback Speed'
  end
  object Label19: TLabel
    Left = 176
    Top = 336
    Width = 221
    Height = 13
    Caption = '('#1090#1088#1077#1073#1091#1077#1090#1089#1103' '#1076#1083#1103' '#1088#1072#1073#1086#1090#1099'  Vanguard  '#1080'  Zodiak)'
  end
  object Panel3: TPanel
    Left = 0
    Top = 376
    Width = 448
    Height = 37
    Align = alBottom
    TabOrder = 0
    object btnOK: TButton
      Left = 115
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btmConcel: TButton
      Left = 211
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
    object Button1: TButton
      Left = 336
      Top = 8
      Width = 91
      Height = 25
      Caption = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object PageControl1: TPageControl
    Left = 512
    Top = 8
    Width = 449
    Height = 408
    ActivePage = TabSheet2
    TabOrder = 1
    Visible = False
    object TabSheet1: TTabSheet
      Caption = #1054#1089#1085#1086#1074#1085#1099#1077
      object Label5: TLabel
        Left = 16
        Top = 36
        Width = 50
        Height = 13
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      end
      object Label11: TLabel
        Left = 16
        Top = 71
        Width = 94
        Height = 13
        Caption = #1058#1080#1087' '#1089#1086#1088#1077#1074#1085#1086#1074#1072#1085#1080#1081
      end
      object Label12: TLabel
        Left = 16
        Top = 106
        Width = 44
        Height = 13
        Caption = #1044#1072#1081#1074#1087#1091#1083
      end
      object Label13: TLabel
        Left = 16
        Top = 246
        Width = 90
        Height = 13
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1090#1091#1088#1086#1074
      end
      object Label14: TLabel
        Left = 16
        Top = 281
        Width = 77
        Height = 13
        Caption = #1056#1072#1073#1086#1095#1077#1077' '#1074#1088#1077#1084#1103
      end
      object Label15: TLabel
        Left = 16
        Top = 141
        Width = 95
        Height = 13
        Caption = #1052#1077#1089#1090#1086' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103
      end
      object Label16: TLabel
        Left = 16
        Top = 176
        Width = 46
        Height = 13
        Caption = 'DateFrom'
      end
      object Label17: TLabel
        Left = 16
        Top = 211
        Width = 36
        Height = 13
        Caption = 'DateTo'
      end
      object Label18: TLabel
        Left = 16
        Top = 316
        Width = 41
        Height = 13
        Caption = 'Task_ID'
      end
      object cxDBDateEdit1: TcxDBDateEdit
        Left = 128
        Top = 172
        TabOrder = 0
        Width = 121
      end
      object cxDBDateEdit2: TcxDBDateEdit
        Left = 128
        Top = 207
        TabOrder = 1
        Width = 121
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 128
        Top = 32
        TabOrder = 2
        Width = 300
      end
      object cxDBSpinEdit1: TcxDBSpinEdit
        Left = 128
        Top = 242
        TabOrder = 3
        Width = 121
      end
      object cxDBSpinEdit2: TcxDBSpinEdit
        Left = 128
        Top = 277
        TabOrder = 4
        Width = 121
      end
      object cxDBTextEdit3: TcxDBTextEdit
        Left = 128
        Top = 137
        TabOrder = 5
        Width = 300
      end
      object cxDBLookupComboBox1: TcxDBLookupComboBox
        Left = 128
        Top = 67
        Properties.ListColumns = <>
        TabOrder = 6
        Width = 300
      end
      object cxDBLookupComboBox2: TcxDBLookupComboBox
        Left = 128
        Top = 102
        Properties.ListColumns = <>
        TabOrder = 7
        Width = 300
      end
      object cxDBLookupComboBox3: TcxDBLookupComboBox
        Left = 128
        Top = 312
        Properties.ListColumns = <>
        TabOrder = 8
        Width = 300
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
      ImageIndex = 1
    end
  end
  object cxSpinEdit6: TcxSpinEdit
    Left = 352
    Top = 212
    Properties.MaxValue = -1.000000000000000000
    Properties.MinValue = -3.000000000000000000
    TabOrder = 2
    Value = -1
    Width = 65
  end
  object cxSpinEdit5: TcxSpinEdit
    Left = 144
    Top = 212
    Properties.MaxValue = 10.000000000000000000
    Properties.MinValue = 1.000000000000000000
    TabOrder = 3
    Value = 10
    Width = 65
  end
  object cxSpinEdit4: TcxSpinEdit
    Left = 216
    Top = 132
    Enabled = False
    Properties.Increment = 100.000000000000000000
    Properties.MaxValue = 1000.000000000000000000
    TabOrder = 4
    Value = 200
    Width = 73
  end
  object DirectoryEdit1: TDirectoryEdit
    Left = 144
    Top = 173
    Width = 281
    Height = 21
    Hint = #1055#1091#1090#1100' '#1076#1086#1083#1078#1077#1085' '#1086#1082#1072#1085#1095#1080#1074#1072#1090#1100#1089#1103' '#1089#1080#1084#1074#1086#1083#1086#1084' "\"'
    NumGlyphs = 1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object cxSpinEdit3: TcxSpinEdit
    Left = 216
    Top = 92
    Enabled = False
    Properties.Increment = 100.000000000000000000
    Properties.MaxValue = 1000.000000000000000000
    TabOrder = 6
    Value = 150
    Width = 73
  end
  object cxSpinEdit1: TcxSpinEdit
    Left = 216
    Top = 15
    Properties.MaxValue = 5.000000000000000000
    Properties.MinValue = 1.000000000000000000
    TabOrder = 7
    Value = 1
    Width = 73
  end
  object cxSpinEdit2: TcxSpinEdit
    Left = 216
    Top = 54
    Properties.MaxValue = 90.000000000000000000
    Properties.MinValue = 50.000000000000000000
    TabOrder = 8
    Value = 70
    Width = 73
  end
  object RadioGroup1: TRadioGroup
    Left = 16
    Top = 246
    Width = 409
    Height = 73
    Caption = ' '#1055#1088#1086#1089#1084#1086#1090#1088' '#1074#1080#1076#1077#1086'  (Screen Control) '
    Items.Strings = (
      #1053#1072' '#1075#1083#1072#1074#1085#1086#1084' '#1086#1082#1085#1077'  (Main Window)'
      #1053#1072' '#1101#1082#1088#1072#1085#1072#1093' '#1082#1086#1085#1089#1086#1083#1077#1081' (Judges Consol)')
    TabOrder = 9
    OnClick = RadioGroup1Click
  end
  object CheckBox1: TCheckBox
    Left = 16
    Top = 336
    Width = 161
    Height = 17
    Caption = #1042#1082#1083#1102#1095#1080#1090#1100' TFTP'
    TabOrder = 10
    WordWrap = True
  end
  object cxSpinEdit7: TcxSpinEdit
    Left = 328
    Top = 288
    Enabled = False
    TabOrder = 11
    Value = 1
    Width = 65
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'avi'
    Left = 393
    Top = 40
  end
end
