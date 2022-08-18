object fResults: TfResults
  Left = 476
  Top = 145
  Width = 523
  Height = 586
  Caption = #1042#1074#1086#1076' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1074
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
    Left = 16
    Top = 52
    Width = 45
    Height = 13
    Caption = #1050#1086#1084#1072#1085#1076#1072
  end
  object Label2: TLabel
    Left = 384
    Top = 52
    Width = 30
    Height = 13
    Caption = #1056#1072#1091#1085#1076
  end
  object DBText1: TDBText
    Left = 16
    Top = 16
    Width = 489
    Height = 24
    DataField = 'Name'
    DataSource = DM.dsComp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 88
    Width = 87
    Height = 13
    Caption = #1048#1084#1103' '#1074#1080#1076#1077#1086#1092#1072#1081#1083#1072
  end
  object DBText7: TDBText
    Left = 352
    Top = 120
    Width = 153
    Height = 17
    Alignment = taRightJustify
    DataField = 'Type'
    DataSource = DM.dsComp
  end
  object Label4: TLabel
    Left = 24
    Top = 432
    Width = 84
    Height = 26
    Caption = 'Consensus Time'#13#10'MAXDELAYTIME'
  end
  object Label5: TLabel
    Left = 24
    Top = 472
    Width = 55
    Height = 13
    Caption = 'Point Coef1'
  end
  object Label7: TLabel
    Left = 24
    Top = 488
    Width = 55
    Height = 13
    Caption = 'Point Coef2'
  end
  object Label8: TLabel
    Left = 144
    Top = 432
    Width = 353
    Height = 26
    Caption = 
      #1047#1072#1076#1072#1077#1090' '#1074#1088#1077#1084#1103' '#1079#1072#1076#1077#1088#1078#1082#1080' '#1076#1083#1103'  '#1087#1077#1088#1077#1082#1083#1102#1095#1077#1085#1080#1103' Sequence ,ms'#13#10'('#1046#1076#1077#1090' '#1085#1072#1078#1072 +
      #1090#1080#1103' '#1074#1089#1077#1093' '#1089#1091#1076#1077#1081' '#1076#1086' '#1087#1077#1088#1077#1093#1086#1076#1072' '#1082' '#1086#1094#1077#1085#1082#1077' '#1089#1083#1077#1076#1091#1102#1097#1077#1081' '#1092#1080#1075#1091#1088#1099')'
  end
  object Label9: TLabel
    Left = 144
    Top = 472
    Width = 272
    Height = 13
    Caption = #1055#1088#1080' '#1087#1086#1076#1089#1095#1077#1090#1077' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1072' '#1091#1084#1085#1086#1078#1072#1077#1090#1089#1103' '#1087#1077#1088#1074#1072#1103' '#1086#1094#1077#1085#1082#1072
  end
  object Label10: TLabel
    Left = 136
    Top = 512
    Width = 270
    Height = 26
    Caption = 
      #1087#1088#1086#1076#1086#1083#1078#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100' '#1087#1086#1076#1089#1074#1077#1090#1082#1080' '#1086#1094#1077#1085#1082#1080' '#1085#1072' '#1101#1082#1088#1072#1085#1077', ms'#13#10#1055#1086#1089#1083#1077' '#1085#1072#1078#1072#1090#1080#1103' ' +
      #1082#1085#1086#1087#1082#1080'  '#1085#1072' '#1089#1091#1076#1077#1081#1089#1082#1086#1084' '#1087#1091#1083#1100#1090#1077' '
  end
  object Label11: TLabel
    Left = 24
    Top = 520
    Width = 95
    Height = 13
    Caption = 'FLASHDELAYTIME'
  end
  object cxDBLookupComboBox1: TcxDBLookupComboBox
    Left = 80
    Top = 48
    DataBinding.DataField = 'Team_ID'
    DataBinding.DataSource = DM.dsTeamRound
    Properties.KeyFieldNames = 'Team_ID'
    Properties.ListColumns = <
      item
        FieldName = 'Name'
      end>
    Properties.ListSource = DM.dsTeam
    TabOrder = 0
    Width = 289
  end
  object Button1: TButton
    Left = 183
    Top = 395
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 280
    Top = 394
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 2
  end
  object cxDBButtonEdit1: TcxDBButtonEdit
    Left = 120
    Top = 84
    DataBinding.DataField = 'VideoFile'
    DataBinding.DataSource = DM.dsTeamRound
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 3
    Width = 385
  end
  object cxDBLookupComboBox2: TcxDBLookupComboBox
    Left = 424
    Top = 48
    DataBinding.DataField = 'Round_ID'
    DataBinding.DataSource = DM.dsTeamRound
    Properties.KeyFieldNames = 'Round_ID'
    Properties.ListColumns = <
      item
        FieldName = 'Round_Num'
      end>
    Properties.ListSource = DM.dsRound
    TabOrder = 4
    Width = 73
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 120
    Width = 304
    Height = 233
    DataSource = dsResult
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Judge_ID'
        Title.Caption = #1057#1091#1076#1100#1103
        Width = 157
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Score1'
        Title.Caption = #1054#1094#1077#1085#1082#1072' 1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Score2'
        Title.Caption = #1054#1094#1077#1085#1082#1072' 2'
        Visible = True
      end>
  end
  object Button3: TButton
    Left = 416
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 6
    OnClick = Button3Click
  end
  object qryResult: TABSQuery
    CurrentVersion = '6.02 '
    DatabaseName = 'MEMORY'
    InMemory = True
    ReadOnly = False
    RequestLive = True
    SQL.Strings = (
      'DROP TABLE Result;'
      'CREATE TABLE Result ('
      '  Round_ID INTEGER,'
      '  Judge_ID INTEGER,'
      '  SCORE1 INTEGER,'
      '  SCORE2 INTEGER'
      ');'
      'INSERT INTO Result (Round_ID, Judge_ID, Score1, Score2)  VALUES'
      '(1,1,1,1),(2,2,2,2),(3,3,3,3);'
      ''
      'SELECT * FROM Result;')
    Left = 328
    Top = 152
  end
  object dsResult: TDataSource
    DataSet = qryResult
    Left = 368
    Top = 152
  end
end
