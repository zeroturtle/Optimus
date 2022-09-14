object fScoreEdit: TfScoreEdit
  Left = 780
  Top = 132
  Width = 300
  Height = 280
  Caption = #1056#1077#1076#1072#1082#1090#1086#1088' '#1086#1094#1077#1085#1086#1082
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 56
    Width = 38
    Height = 13
    Caption = #1054#1094#1077#1085#1082#1072
  end
  object Label2: TLabel
    Left = 24
    Top = 104
    Width = 33
    Height = 13
    Caption = #1042#1088#1077#1084#1103
  end
  object Label3: TLabel
    Left = 24
    Top = 152
    Width = 40
    Height = 13
    Caption = #1054#1096#1080#1073#1082#1072
  end
  object DBText1: TDBText
    Left = 24
    Top = 24
    Width = 65
    Height = 17
    DataField = 'Judge_ID'
    DataSource = DataMain.dsResultDetail
  end
  object DBText2: TDBText
    Left = 176
    Top = 24
    Width = 65
    Height = 17
    DataField = 'Monitor'
    DataSource = DataMain.dsResultDetail
  end
  object DBEdit1: TDBEdit
    Left = 24
    Top = 72
    Width = 121
    Height = 21
    DataField = 'P1'
    DataSource = DataMain.dsResultDetail
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 24
    Top = 120
    Width = 121
    Height = 21
    DataField = 'T1'
    DataSource = DataMain.dsResultDetail
    TabOrder = 1
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 24
    Top = 168
    Width = 217
    Height = 21
    DataSource = DataMain.dsResultDetail
    TabOrder = 2
  end
  object Button1: TButton
    Left = 48
    Top = 208
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 152
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
  end
end
