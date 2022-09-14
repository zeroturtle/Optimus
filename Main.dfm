object fMain: TfMain
  Left = 1158
  Top = 129
  Width = 667
  Height = 345
  Color = clBtnShadow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDefault
  WindowMenu = Arrange
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnPaint = FormPaint
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 268
    Width = 651
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 150
      end
      item
        Width = 200
      end
      item
        Width = 100
      end
      item
        Width = 100
      end
      item
        Width = 100
      end
      item
        Width = 100
      end
      item
        Width = 100
      end>
  end
  object HistoryListBox: TMemo
    Left = 269
    Top = 0
    Width = 382
    Height = 268
    Align = alRight
    Lines.Strings = (
      'HistoryListBox')
    TabOrder = 1
    Visible = False
  end
  object MainMenu1: TMainMenu
    Left = 16
    Top = 24
    object OPTIMUS: TMenuItem
      Caption = 'OPTIMUS'
      object N8: TMenuItem
        Caption = #1057#1091#1076#1077#1081#1089#1090#1074#1086
        Enabled = False
        OnClick = N8Click
      end
      object N19: TMenuItem
        Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1082#1086#1084#1072#1085#1076
        OnClick = ChecklistClick
      end
      object N18: TMenuItem
        Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1083#1080#1095#1085#1099#1077
        OnClick = N18Click
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object N9: TMenuItem
        Caption = #1055#1077#1095#1072#1090#1100' '#1086#1090#1095#1077#1090#1086#1074
        ShortCut = 16464
        OnClick = N9Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Exit: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        ShortCut = 32856
        OnClick = ExitClick
      end
    end
    object Dictionary: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      object Competition: TMenuItem
        Caption = #1052#1077#1088#1086#1087#1088#1080#1103#1090#1080#1103
        OnClick = CompetitionClick
      end
      object N11: TMenuItem
        Caption = #1050#1086#1084#1072#1085#1076#1099
        OnClick = N11Click
      end
      object N14: TMenuItem
        Caption = #1057#1091#1076#1100#1080
        OnClick = N14Click
      end
      object N15: TMenuItem
        Caption = '-'
      end
      object People: TMenuItem
        Caption = #1059#1095#1072#1089#1090#1085#1080#1082#1080
        OnClick = PeopleClick
      end
      object N17: TMenuItem
        Caption = #1057#1087#1086#1088#1090#1080#1074#1085#1099#1077' '#1082#1083#1091#1073#1099
        OnClick = N17Click
      end
      object Pool: TMenuItem
        Caption = #1060#1080#1075#1091#1088#1099
        OnClick = PoolClick
      end
      object Roles: TMenuItem
        Caption = #1056#1086#1083#1080
        OnClick = RolesClick
      end
      object N16: TMenuItem
        Caption = #1057#1090#1088#1072#1085#1099
        OnClick = N16Click
      end
      object N13: TMenuItem
        Caption = #1055#1088#1080#1095#1080#1085#1099' '#1096#1090#1088#1072#1092#1086#1074
        OnClick = N13Click
      end
    end
    object Service: TMenuItem
      Caption = #1057#1077#1088#1074#1080#1089
      object N3: TMenuItem
        Caption = #1057#1084#1077#1085#1080#1090#1100' '#1089#1086#1088#1077#1074#1085#1086#1074#1072#1085#1080#1077
        OnClick = FormShow
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object N10: TMenuItem
        Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1087#1091#1083#1100#1090#1099
        ShortCut = 114
        OnClick = N10Click
      end
      object Log: TMenuItem
        Caption = #1046#1091#1088#1085#1072#1083' '#1088#1072#1073#1086#1090
        ShortCut = 115
        OnClick = LogClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object N12: TMenuItem
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
        ShortCut = 113
        OnClick = N12Click
      end
    end
    object Window: TMenuItem
      Caption = #1054#1082#1085#1072
      object Title: TMenuItem
        Caption = #1056#1072#1089#1087#1086#1083#1086#1078#1080#1090#1100
        OnClick = TitleClick
      end
      object Arrange: TMenuItem
        Caption = #1059#1087#1086#1088#1103#1076#1086#1095#1080#1090#1100
        OnClick = ArrangeClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object CloseAll: TMenuItem
        Caption = #1047#1072#1082#1088#1099#1090#1100' '#1074#1089#1077
        OnClick = CloseAllClick
      end
    end
    object N6: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      object OneScore1: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
        OnClick = OneScore1Click
      end
    end
  end
  object IdTrivialFTPServer1: TIdTrivialFTPServer
    BroadcastEnabled = True
    Bindings = <
      item
        IP = '127.0.0.1'
        Port = 69
      end>
    DefaultPort = 69
    OnReadFile = IdTrivialFTPServer1ReadFile
    OnWriteFile = IdTrivialFTPServer1WriteFile
    OnTransferComplete = IdTrivialFTPServer1TransferComplete
    Left = 57
    Top = 25
  end
end
