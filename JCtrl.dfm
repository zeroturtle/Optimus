object fJudgeCtrl: TfJudgeCtrl
  Left = 568
  Top = 123
  Width = 1280
  Height = 748
  Caption = #1050#1086#1085#1089#1086#1083#1100' '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 684
    Width = 1264
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1264
    Height = 684
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    TabStop = False
    OnChanging = PageControl1Changing
    object TabSheet1: TTabSheet
      Caption = #1057#1087#1080#1089#1086#1082
      TabVisible = False
      object Label1: TLabel
        Left = 0
        Top = 0
        Width = 1256
        Height = 13
        Align = alTop
        Caption = #1042#1048#1044#1045#1054' '#1044#1051#1071' '#1054#1062#1045#1053#1050#1048
      end
      object Panel3: TPanel
        Left = 0
        Top = 604
        Width = 1256
        Height = 70
        Align = alBottom
        BevelOuter = bvNone
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 0
        object Label7: TLabel
          Left = 24
          Top = 16
          Width = 125
          Height = 13
          Caption = #1057#1090#1072#1088#1090' '#1088#1072#1073#1086#1095#1077#1075#1086' '#1074#1088#1077#1084#1077#1085#1080
        end
        object Button1: TButton
          Left = 800
          Top = 16
          Width = 110
          Height = 40
          Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1074#1080#1076#1077#1086
          TabOrder = 0
          OnClick = Button1Click
        end
        object Button2: TButton
          Left = 932
          Top = 16
          Width = 110
          Height = 40
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1086#1089#1083#1076
          TabOrder = 1
          OnClick = Button2Click
        end
        object btnScoringFirst: TBitBtn
          Left = 224
          Top = 16
          Width = 121
          Height = 40
          Caption = #1055#1088#1086#1089#1084#1086#1090#1088
          Enabled = False
          TabOrder = 2
          OnClick = btnScoringFirstClick
        end
        object StartTimerPorts: TComboBox
          Left = 24
          Top = 32
          Width = 177
          Height = 21
          ItemHeight = 13
          TabOrder = 3
        end
        object Button3: TButton
          Left = 1068
          Top = 16
          Width = 110
          Height = 40
          Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1086#1089#1083#1076
          TabOrder = 4
          OnClick = Button3Click
        end
      end
      object grdList: TDBGrid
        Left = 0
        Top = 13
        Width = 1256
        Height = 591
        Align = alClient
        DataSource = DataJudge.dsList
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Round_Num'
            Title.Caption = #8470' '#1058#1091#1088#1072
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TeamName'
            Title.Caption = #1050#1086#1084#1072#1085#1076#1072
            Width = 385
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Event_Name'
            Title.Caption = #1047#1072#1095#1077#1090
            Width = 237
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Pool_Sequence'
            Title.Caption = #1055#1086#1089#1083#1077#1076#1086#1074#1072#1090#1077#1083#1100#1085#1086#1089#1090#1100
            Width = 111
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      ImageIndex = 1
      TabVisible = False
      object pnlPerview: TPanel
        Left = 0
        Top = 0
        Width = 1256
        Height = 419
        Align = alClient
        Caption = 'pnlPerview'
        TabOrder = 0
      end
      object pnlOptions: TPanel
        Left = 0
        Top = 419
        Width = 1256
        Height = 70
        Align = alBottom
        TabOrder = 1
        object lbTime: TLabel
          Left = 1136
          Top = 1
          Width = 119
          Height = 68
          Align = alRight
          Alignment = taCenter
          AutoSize = False
          Caption = '00.00'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -43
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
        end
        object Label2: TLabel
          Left = 13
          Top = 34
          Width = 65
          Height = 13
          Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#8470
        end
        object lbView: TLabel
          Left = 85
          Top = 34
          Width = 31
          Height = 13
          Caption = 'lbView'
        end
        object btnPause: TBitBtn
          Left = 136
          Top = 16
          Width = 121
          Height = 40
          Caption = #1055#1072#1091#1079#1072
          TabOrder = 0
          TabStop = False
          OnClick = btnPauseClick
        end
        object chkVerticalFlip: TCheckBox
          Left = 272
          Top = 32
          Width = 81
          Height = 17
          Hint = #1055#1077#1088#1077#1074#1077#1088#1085#1091#1090#1100' '#1074#1080#1076#1077#1086' '#1085#1072' 180'
          TabStop = False
          Caption = 'VerticalFlip'
          TabOrder = 1
          OnClick = chkVerticalFlipClick
        end
        object BitBtn1: TBitBtn
          Tag = 5
          Left = 352
          Top = 16
          Width = 121
          Height = 40
          Caption = '5'#1089#1077#1082' >>'
          TabOrder = 2
          TabStop = False
          OnClick = BitBtn1Click
        end
        object BitBtn2: TBitBtn
          Tag = 15
          Left = 488
          Top = 16
          Width = 121
          Height = 40
          Caption = '15'#1089#1077#1082' >>'
          TabOrder = 3
          TabStop = False
          OnClick = BitBtn1Click
        end
        object BitBtn3: TBitBtn
          Tag = -5
          Left = 624
          Top = 16
          Width = 121
          Height = 40
          Caption = '<< 5'#1089#1077#1082
          TabOrder = 4
          TabStop = False
          OnClick = BitBtn1Click
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1054#1094#1077#1085#1082#1080
      ImageIndex = 2
      TabVisible = False
      object DBText1: TDBText
        Left = 0
        Top = 495
        Width = 303
        Height = 90
        Align = alTop
        Alignment = taCenter
        AutoSize = True
        DataField = 'Scores'
        DataSource = DataMain.dsTeamRound
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -64
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 0
        Top = 0
        Width = 46
        Height = 13
        Align = alTop
        Caption = #1054#1062#1045#1053#1050#1048
      end
      object Label5: TLabel
        Left = 0
        Top = 330
        Width = 51
        Height = 13
        Align = alTop
        Caption = #1064#1058#1056#1040#1060#1067
      end
      object Label6: TLabel
        Left = 0
        Top = 165
        Width = 38
        Height = 13
        Align = alTop
        Caption = #1042#1056#1045#1052#1071
      end
      object grdScore: TDBGrid
        Left = 0
        Top = 13
        Width = 1256
        Height = 152
        Align = alTop
        DataSource = DataJudge.dsScore
        PopupMenu = PopupMenu1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object grdError: TDBGrid
        Left = 0
        Top = 178
        Width = 1256
        Height = 152
        Align = alTop
        DataSource = DataJudge.dsTime
        PopupMenu = PopupMenu1
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object grdTime: TDBGrid
        Left = 0
        Top = 343
        Width = 1256
        Height = 152
        Align = alTop
        DataSource = DataJudge.dsError
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object Panel1: TPanel
        Left = 0
        Top = 604
        Width = 1256
        Height = 70
        Align = alBottom
        TabOrder = 3
        object Label8: TLabel
          Left = 448
          Top = 16
          Width = 78
          Height = 13
          Caption = #1053#1072#1095'.'#1092#1088#1072#1075#1084#1077#1085#1090#1072
        end
        object Label9: TLabel
          Left = 608
          Top = 16
          Width = 78
          Height = 13
          Caption = #1050#1086#1085'.'#1092#1088#1072#1075#1084#1077#1085#1090#1072
        end
        object btnPlay: TBitBtn
          Left = 312
          Top = 16
          Width = 118
          Height = 40
          Caption = #1060#1088#1072#1075#1084#1077#1085#1090
          TabOrder = 0
          OnClick = btnPlayClick
        end
        object btnSave: TBitBtn
          Left = 896
          Top = 16
          Width = 121
          Height = 40
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
          TabOrder = 1
          OnClick = btnSaveClick
        end
        object btnEdit: TBitBtn
          Left = 760
          Top = 16
          Width = 121
          Height = 40
          Caption = #1056#1077#1076#1072#1082#1090#1086#1088
          TabOrder = 2
          OnClick = btnEditClick
        end
        object cbSpeed: TCheckBox
          Left = 13
          Top = 27
          Width = 148
          Height = 17
          Caption = #1047#1072#1084#1077#1076#1083#1077#1085#1085#1099#1081' '#1087#1088#1086#1089#1084#1086#1090#1088
          TabOrder = 3
        end
        object btnScoringMore: TBitBtn
          Left = 176
          Top = 16
          Width = 121
          Height = 40
          Caption = #1055#1088#1086#1089#1084#1086#1090#1088
          TabOrder = 4
          OnClick = btnScoringMoreClick
        end
        object ComboBox1: TComboBox
          Left = 448
          Top = 34
          Width = 137
          Height = 21
          ItemHeight = 0
          TabOrder = 5
          Text = #1053#1072#1095#1072#1083#1086' '#1056#1072#1073'.'#1042#1088#1077#1084#1077#1085#1080
          OnChange = ComboBox1Change
        end
        object ComboBox2: TComboBox
          Left = 608
          Top = 34
          Width = 137
          Height = 21
          ItemHeight = 0
          TabOrder = 6
          Text = #1050#1086#1085#1077#1094' '#1056#1072#1073'.'#1042#1088#1077#1084#1077#1085#1080
          OnChange = ComboBox2Change
        end
      end
    end
  end
  object pnlDraw: TPanel
    Left = 0
    Top = 687
    Width = 1264
    Height = 23
    Align = alBottom
    BorderWidth = 1
    Caption = #1046#1077#1088#1077#1073#1100#1077#1074#1082#1072' '#1090#1091#1088#1072
    TabOrder = 1
    object Label4: TLabel
      Left = 2
      Top = 2
      Width = 1260
      Height = 23
      Align = alTop
      AutoSize = False
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      OnClick = Label4Click
    end
    object DBImage2: TDBImage
      Left = 160
      Top = 25
      Width = 160
      Height = 160
      Color = clBtnFace
      Ctl3D = False
      DataField = 'Pic2'
      DataSource = DataJudge.dsSequence
      ParentCtl3D = False
      Stretch = True
      TabOrder = 0
    end
    object DBImage9: TDBImage
      Left = 1281
      Top = 26
      Width = 160
      Height = 160
      Ctl3D = False
      DataField = 'Pic9'
      DataSource = DataJudge.dsSequence
      ParentColor = True
      ParentCtl3D = False
      Stretch = True
      TabOrder = 1
    end
    object DBImage3: TDBImage
      Left = 321
      Top = 25
      Width = 160
      Height = 160
      Ctl3D = False
      DataField = 'Pic3'
      DataSource = DataJudge.dsSequence
      ParentColor = True
      ParentCtl3D = False
      Stretch = True
      TabOrder = 2
    end
    object DBImage8: TDBImage
      Left = 1121
      Top = 26
      Width = 160
      Height = 160
      Ctl3D = False
      DataField = 'Pic8'
      DataSource = DataJudge.dsSequence
      ParentColor = True
      ParentCtl3D = False
      Stretch = True
      TabOrder = 3
    end
    object DBImage7: TDBImage
      Left = 961
      Top = 26
      Width = 160
      Height = 160
      Ctl3D = False
      DataField = 'Pic7'
      DataSource = DataJudge.dsSequence
      ParentColor = True
      ParentCtl3D = False
      Stretch = True
      TabOrder = 4
    end
    object DBImage6: TDBImage
      Left = 801
      Top = 26
      Width = 160
      Height = 160
      Ctl3D = False
      DataField = 'Pic6'
      DataSource = DataJudge.dsSequence
      ParentColor = True
      ParentCtl3D = False
      Stretch = True
      TabOrder = 5
    end
    object DBImage5: TDBImage
      Left = 641
      Top = 26
      Width = 160
      Height = 160
      Ctl3D = False
      DataField = 'Pic5'
      DataSource = DataJudge.dsSequence
      ParentColor = True
      ParentCtl3D = False
      Stretch = True
      TabOrder = 6
    end
    object DBImage4: TDBImage
      Left = 481
      Top = 26
      Width = 160
      Height = 160
      Ctl3D = False
      DataField = 'Pic4'
      DataSource = DataJudge.dsSequence
      ParentColor = True
      ParentCtl3D = False
      Stretch = True
      TabOrder = 7
    end
    object DBImage1: TDBImage
      Left = 0
      Top = 25
      Width = 160
      Height = 160
      Ctl3D = False
      DataField = 'Pic1'
      DataSource = DataJudge.dsSequence
      ParentColor = True
      ParentCtl3D = False
      Stretch = True
      TabOrder = 8
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 264
    Top = 64
  end
  object FFLogger1: TFFLogger
    Left = 308
    Top = 64
  end
  object FFPlayer: TFFPlayer
    OnFileOpen = FFPlayerFileOpen
    OnPosition = FFPlayerPosition
    OnState = FFPlayerState
    OnVideoHook = FFPlayerVideoHook
    DisableAudio = True
    VideoHook = True
    Left = 352
    Top = 64
  end
  object dlDivePool: TDualListDialog
    Sorted = False
    Title = #1046#1077#1088#1077#1073#1100#1077#1074#1082#1072' '#1090#1091#1088#1072
    Label1Caption = #1057#1087#1080#1089#1086#1082' '#1092#1086#1088#1084#1072#1094#1080#1081
    Label2Caption = #1060#1086#1088#1084#1072#1094#1080#1080' '#1090#1091#1088#1072
    HelpContext = 0
    Left = 185
    Top = 65
  end
  object DirectoryWatch1: TDirectoryWatch
    Directory = 'C:\'
    NotifyFilters = [nfFilename, nfLastWrite]
    WatchSubDirs = False
    Active = False
    OnChange = DirectoryWatch1Change
    Left = 225
    Top = 65
  end
  object PopupMenu1: TPopupMenu
    Left = 404
    Top = 64
    object N1: TMenuItem
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1082#1072#1082' '#1085#1072#1095#1072#1083#1086' '#1092#1088#1072#1075#1084#1077#1085#1090#1072
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1082#1072#1082' '#1082#1086#1085#1077#1094' '#1092#1088#1072#1075#1084#1077#1085#1090#1072
      OnClick = N2Click
    end
  end
end
