object fSettimgs: TfSettimgs
  Left = 496
  Top = 125
  BorderStyle = bsDialog
  Caption = #1059#1089#1090#1072#1085#1086#1074#1082#1080' '#1089#1091#1076#1077#1081#1089#1090#1074#1072
  ClientHeight = 188
  ClientWidth = 427
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 16
    Top = 108
    Width = 87
    Height = 13
    Caption = #1048#1084#1103' '#1074#1080#1076#1077#1086#1092#1072#1081#1083#1072
  end
  object Label5: TLabel
    Left = 16
    Top = 67
    Width = 35
    Height = 13
    Caption = #1058#1091#1088'  '#8470
  end
  object Label4: TLabel
    Left = 16
    Top = 26
    Width = 45
    Height = 13
    Caption = #1050#1086#1084#1072#1085#1076#1072
  end
  object btnOK: TButton
    Left = 120
    Top = 154
    Width = 75
    Height = 25
    Caption = #1054#1050
    ModalResult = 1
    TabOrder = 0
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 216
    Top = 154
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 112
    Top = 61
    Width = 289
    Height = 21
    DataField = 'Round_ID'
    DataSource = DataMain.dsTeamRound
    KeyField = 'Round_ID'
    ListField = 'Round_Title'
    ListSource = DataMain.dsRound
    TabOrder = 2
  end
  object RxDBComboEdit1: TRxDBComboEdit
    Left = 112
    Top = 103
    Width = 289
    Height = 21
    DataField = 'VideoFile'
    DataSource = DataMain.dsTeamRound
    NumGlyphs = 1
    TabOrder = 3
    OnButtonClick = RxDBComboEdit1ButtonClick
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 112
    Top = 20
    Width = 289
    Height = 21
    DataField = 'Team_ID'
    DataSource = DataMain.dsTeamRound
    KeyField = 'Team_ID'
    ListField = 'TeamNameCode'
    ListSource = DataMain.dsTeam
    TabOrder = 4
  end
  object OpenDialog1: TOpenDialog
    Left = 376
    Top = 144
  end
end
