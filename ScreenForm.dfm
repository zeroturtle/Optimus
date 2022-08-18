object fJudgeConsol: TfJudgeConsol
  Left = 632
  Top = 54
  Width = 1208
  Height = 878
  Caption = 'fJudgeConsol'
  Color = clDefault
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbInfo: TLabel
    Left = 0
    Top = 0
    Width = 1192
    Height = 177
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Caption = 'lbInfo'
    Color = clDefault
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -32
    Font.Name = 'Arial Black'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
    Transparent = True
    Visible = False
  end
  object pnlDraw: TPanel
    Left = 0
    Top = 698
    Width = 1161
    Height = 232
    BorderWidth = 1
    Caption = #1046#1077#1088#1077#1073#1100#1077#1074#1082#1072' '#1090#1091#1088#1072
    TabOrder = 0
    Visible = False
    object Label4: TLabel
      Left = 2
      Top = 2
      Width = 1157
      Height = 23
      Align = alTop
      AutoSize = False
      Caption = #1046#1077#1088#1077#1073#1100#1077#1074#1082#1072' '#1090#1091#1088#1072
      Color = clBackground
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object DBImage1: TDBImage
      Left = 5
      Top = 26
      Width = 160
      Height = 160
      Ctl3D = False
      DataField = 'Pic1'
      DataSource = DataJudge.dsSequence
      ParentColor = True
      ParentCtl3D = False
      Stretch = True
      TabOrder = 0
      Visible = False
    end
    object DBImage2: TDBImage
      Left = 165
      Top = 26
      Width = 160
      Height = 160
      Color = clBtnFace
      Ctl3D = False
      DataField = 'Pic2'
      DataSource = DataJudge.dsSequence
      ParentCtl3D = False
      Stretch = True
      TabOrder = 1
      Visible = False
    end
    object DBImage3: TDBImage
      Left = 325
      Top = 26
      Width = 160
      Height = 160
      Ctl3D = False
      DataField = 'Pic3'
      DataSource = DataJudge.dsSequence
      ParentColor = True
      ParentCtl3D = False
      Stretch = True
      TabOrder = 2
      Visible = False
    end
    object DBImage4: TDBImage
      Left = 485
      Top = 26
      Width = 160
      Height = 160
      Ctl3D = False
      DataField = 'Pic4'
      DataSource = DataJudge.dsSequence
      ParentColor = True
      ParentCtl3D = False
      Stretch = True
      TabOrder = 3
      Visible = False
    end
    object DBImage5: TDBImage
      Left = 645
      Top = 26
      Width = 160
      Height = 160
      Ctl3D = False
      DataField = 'Pic5'
      DataSource = DataJudge.dsSequence
      ParentColor = True
      ParentCtl3D = False
      Stretch = True
      TabOrder = 4
      Visible = False
    end
    object DBImage6: TDBImage
      Left = 805
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
      Visible = False
    end
    object DBImage7: TDBImage
      Left = 965
      Top = 26
      Width = 160
      Height = 160
      Ctl3D = False
      DataField = 'Pic7'
      DataSource = DataJudge.dsSequence
      ParentColor = True
      ParentCtl3D = False
      Stretch = True
      TabOrder = 6
      Visible = False
    end
    object DBImage8: TDBImage
      Left = 1125
      Top = 26
      Width = 160
      Height = 160
      Ctl3D = False
      DataField = 'Pic8'
      DataSource = DataJudge.dsSequence
      ParentColor = True
      ParentCtl3D = False
      Stretch = True
      TabOrder = 7
      Visible = False
    end
    object DBImage9: TDBImage
      Left = 1285
      Top = 26
      Width = 160
      Height = 160
      Ctl3D = False
      DataField = 'Pic9'
      DataSource = DataJudge.dsSequence
      ParentColor = True
      ParentCtl3D = False
      Stretch = True
      TabOrder = 8
      Visible = False
    end
  end
  object pnlResult: TPanel
    Left = 0
    Top = 280
    Width = 1155
    Height = 409
    BorderWidth = 1
    Caption = 'pnlResult'
    TabOrder = 1
    Visible = False
    object Label3: TLabel
      Left = 2
      Top = 2
      Width = 1151
      Height = 23
      Align = alTop
      AutoSize = False
      Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099
      Color = clBackground
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object DBText1: TDBText
      Left = 2
      Top = 296
      Width = 1151
      Height = 111
      Align = alBottom
      Alignment = taCenter
      DataField = 'Scores'
      DataSource = DataMain.dsTeamRound
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -72
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
    end
    object grdJumpResult: TDBGrid
      Left = 2
      Top = 25
      Width = 1151
      Height = 271
      Align = alClient
      DataSource = DataJudge.dsScore
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -16
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      OnDrawColumnCell = grdJumpResultDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'Port'
          Title.Caption = #8470
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AName'
          Title.Alignment = taCenter
          Title.Caption = #1057#1091#1076#1100#1103
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -19
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 312
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'p1'
          Title.Alignment = taCenter
          Title.Caption = '1'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -19
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 40
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'p2'
          Title.Alignment = taCenter
          Title.Caption = '2'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -19
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 40
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'p3'
          Title.Alignment = taCenter
          Title.Caption = '3'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -19
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 40
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'p4'
          Title.Alignment = taCenter
          Title.Caption = '4'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -19
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 40
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'p5'
          Title.Alignment = taCenter
          Title.Caption = '5'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -19
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 40
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'p6'
          Title.Alignment = taCenter
          Title.Caption = '6'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -19
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 40
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'p7'
          Title.Alignment = taCenter
          Title.Caption = '7'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -19
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 40
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'p8'
          Title.Alignment = taCenter
          Title.Caption = '8'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -19
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 40
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'p9'
          Title.Alignment = taCenter
          Title.Caption = '9'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -19
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 40
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'p10'
          Title.Alignment = taCenter
          Title.Caption = '10'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -19
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 40
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'p11'
          Title.Alignment = taCenter
          Title.Caption = '11'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -19
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 40
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'p12'
          Title.Alignment = taCenter
          Title.Caption = '12'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -19
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 40
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'p13'
          Title.Alignment = taCenter
          Title.Caption = '13'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -19
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 40
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'p14'
          Title.Alignment = taCenter
          Title.Caption = '14'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -19
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 40
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'p15'
          Title.Alignment = taCenter
          Title.Caption = '15'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -19
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 40
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'p16'
          Title.Alignment = taCenter
          Title.Caption = '16'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -19
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 40
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'p17'
          Title.Alignment = taCenter
          Title.Caption = '17'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -19
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 40
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'p18'
          Title.Alignment = taCenter
          Title.Caption = '18'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -19
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 40
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'p19'
          Title.Alignment = taCenter
          Title.Caption = '19'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -19
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 40
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'p20'
          Title.Alignment = taCenter
          Title.Caption = '20'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -19
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 40
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'p21'
          Title.Alignment = taCenter
          Title.Caption = '21'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -19
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 40
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'p22'
          Title.Alignment = taCenter
          Title.Caption = '22'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -19
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 40
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'p23'
          Title.Alignment = taCenter
          Title.Caption = '23'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -19
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 40
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'p24'
          Title.Alignment = taCenter
          Title.Caption = '24'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -19
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 40
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'p25'
          Title.Alignment = taCenter
          Title.Caption = '25'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -19
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 40
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'p26'
          Title.Alignment = taCenter
          Title.Caption = '26'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -19
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 40
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'p27'
          Title.Alignment = taCenter
          Title.Caption = '27'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -19
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 40
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'p28'
          Title.Alignment = taCenter
          Title.Caption = '28'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -19
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 40
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'p29'
          Title.Alignment = taCenter
          Title.Caption = '29'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -19
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 40
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'p30'
          Title.Alignment = taCenter
          Title.Caption = '30'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -19
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 40
          Visible = True
        end>
    end
  end
  object pnlEdit: TPanel
    Left = 0
    Top = 20
    Width = 1155
    Height = 256
    BorderWidth = 1
    Caption = 'pnlEdit'
    TabOrder = 2
    Visible = False
    object Label2: TLabel
      Left = 2
      Top = 2
      Width = 1151
      Height = 23
      Align = alTop
      AutoSize = False
      Caption = #1056#1077#1076#1072#1082#1090#1086#1088' '#1086#1094#1077#1085#1086#1082
      Color = clBackground
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object grdScore: TStringGrid
      Left = 2
      Top = 25
      Width = 1151
      Height = 199
      Align = alClient
      DefaultColWidth = 60
      DefaultRowHeight = 55
      RowCount = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnDrawCell = grdScoreDrawCell
    end
    object StatusBar1: TStatusBar
      Left = 2
      Top = 224
      Width = 1151
      Height = 30
      Panels = <
        item
          Width = 250
        end
        item
          Width = 200
        end
        item
          Width = 200
        end>
    end
  end
  object pnlMenu: TPanel
    Left = 675
    Top = 177
    Width = 480
    Height = 500
    BorderWidth = 1
    Caption = 'pnlMenu'
    TabOrder = 3
    Visible = False
    object lbMenuCaption: TLabel
      Left = 2
      Top = 2
      Width = 476
      Height = 23
      Align = alTop
      AutoSize = False
      Caption = #1044#1086#1089#1090#1091#1087#1085#1099#1077' '#1076#1077#1081#1089#1090#1074#1080#1103
      Color = clBackground
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lvMenu: TListView
      Left = 2
      Top = 25
      Width = 476
      Height = 473
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      Columns = <>
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 0
      ViewStyle = vsReport
    end
  end
  object pnlMessage: TPanel
    Left = 288
    Top = 328
    Width = 865
    Height = 129
    Caption = 'pnlMessage'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Visible = False
  end
end
