inherited fCompetition: TfCompetition
  Left = 709
  Top = 223
  Width = 1163
  Height = 730
  Caption = #1057#1087#1080#1089#1086#1082' '#1084#1077#1088#1086#1087#1088#1080#1103#1090#1080#1081
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ctl_FilterSplitter: TSplitter
    Left = 777
    Height = 639
  end
  inherited ctl_ToolBar: TToolBar
    Width = 1147
  end
  inherited ctl_FilterPanel: TPanel
    Left = 782
    Height = 639
    inherited Panel2: TPanel
      Top = 604
    end
    inherited Panel3: TPanel
      Height = 587
    end
  end
  inherited ctl_DataPanel: TPanel
    Width = 777
    Height = 639
    object Splitter1: TSplitter [0]
      Left = 0
      Top = 209
      Width = 777
      Height = 8
      Cursor = crVSplit
      Align = alTop
    end
    inherited grd_General: TcxGrid
      Width = 777
      Height = 209
      Align = alTop
      TabOrder = 1
      OnEnter = grd_GeneralEnter
      OnExit = grd_GeneralExit
      inherited grd_GeneralDBTableView1: TcxGridDBTableView
        object grd_GeneralDBTableView1Column2: TcxGridDBColumn
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'Name'
          Width = 151
        end
        object grd_GeneralDBTableView1Column3: TcxGridDBColumn
          Caption = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072
          DataBinding.FieldName = 'Type'
          Width = 74
        end
        object grd_GeneralDBTableView1Column7: TcxGridDBColumn
          Caption = 'Divepool'
          DataBinding.FieldName = 'Pool'
        end
        object grd_GeneralDBTableView1Column4: TcxGridDBColumn
          Caption = #1056#1072#1073#1086#1095#1077#1077' '#1074#1088#1077#1084#1103
          DataBinding.FieldName = 'WorkTime'
          Width = 85
        end
        object grd_GeneralDBTableView1Column5: TcxGridDBColumn
          Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1090#1091#1088#1086#1074
          DataBinding.FieldName = 'Rounds'
          Width = 102
        end
        object grd_GeneralDBTableView1Column1: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
          DataBinding.FieldName = 'DateFrom'
          PropertiesClassName = 'TcxDateEditProperties'
          Width = 88
        end
        object grd_GeneralDBTableView1Column8: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
          DataBinding.FieldName = 'DateTo'
          PropertiesClassName = 'TcxDateEditProperties'
          Width = 82
        end
        object grd_GeneralDBTableView1Column6: TcxGridDBColumn
          Caption = #1052#1077#1089#1090#1086' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103
          DataBinding.FieldName = 'Place'
          Width = 289
        end
      end
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 217
      Width = 777
      Height = 422
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #1056#1072#1091#1085#1076
        object Splitter3: TSplitter
          Left = 0
          Top = 226
          Width = 769
          Height = 8
          Cursor = crVSplit
          Align = alBottom
        end
        object grd_Round: TcxGrid
          Left = 0
          Top = 0
          Width = 769
          Height = 226
          Align = alClient
          PopupMenu = PopupMenu1
          TabOrder = 0
          OnEnter = grd_RoundEnter
          OnExit = grd_GeneralExit
          object grd_RoundDBTableView1: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            NavigatorButtons.First.Visible = True
            NavigatorButtons.PriorPage.Visible = True
            NavigatorButtons.Prior.Visible = True
            NavigatorButtons.Next.Visible = True
            NavigatorButtons.NextPage.Visible = True
            NavigatorButtons.Last.Visible = True
            NavigatorButtons.Insert.Visible = True
            NavigatorButtons.Append.Visible = False
            NavigatorButtons.Delete.Visible = True
            NavigatorButtons.Edit.Visible = True
            NavigatorButtons.Post.Visible = True
            NavigatorButtons.Cancel.Visible = True
            NavigatorButtons.Refresh.Visible = True
            NavigatorButtons.SaveBookmark.Visible = True
            NavigatorButtons.GotoBookmark.Visible = True
            NavigatorButtons.Filter.Visible = True
            OnEditing = grd_RoundDBTableView1Editing
            DataController.DataSource = DataMain.dsRound
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsSelection.CellSelect = False
            object grd_RoundDBTableView1Column1: TcxGridDBColumn
              Caption = #1058#1091#1088' '#8470
              DataBinding.FieldName = 'Round_Num'
            end
            object grd_RoundDBTableView1Column2: TcxGridDBColumn
              Caption = #1060#1080#1075#1091#1088#1099
              DataBinding.FieldName = 'Pool_Sequence_Code'
              Width = 121
            end
            object grd_RoundDBTableView1Column4: TcxGridDBColumn
              Caption = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072
              DataBinding.FieldName = 'TypeName'
              MinWidth = 200
              Width = 200
            end
            object grd_RoundDBTableView1Column3: TcxGridDBColumn
              Caption = #1040#1085#1085#1091#1083#1080#1088#1086#1074#1072#1085
              DataBinding.FieldName = 'Disabled'
              MinWidth = 30
              Width = 80
            end
            object grd_RoundDBTableView1Column5: TcxGridDBColumn
              Caption = #1047#1072#1095#1077#1090
              DataBinding.FieldName = 'EventName'
            end
          end
          object grd_RoundLevel1: TcxGridLevel
            GridView = grd_RoundDBTableView1
          end
        end
        object pnlDraw: TPanel
          Left = 0
          Top = 234
          Width = 769
          Height = 160
          Align = alBottom
          TabOrder = 1
          OnResize = pnlDrawResize
          object DBImage1: TDBImage
            Left = 8
            Top = 0
            Width = 160
            Height = 160
            Ctl3D = False
            DataField = 'Pic1'
            DataSource = DataMain.dsPool
            ParentColor = True
            ParentCtl3D = False
            Stretch = True
            TabOrder = 0
          end
          object DBImage2: TDBImage
            Left = 168
            Top = 0
            Width = 160
            Height = 160
            Ctl3D = False
            DataField = 'Pic2'
            DataSource = DataMain.dsPool
            ParentColor = True
            ParentCtl3D = False
            Stretch = True
            TabOrder = 1
          end
          object DBImage3: TDBImage
            Left = 328
            Top = 0
            Width = 160
            Height = 160
            Ctl3D = False
            DataField = 'Pic3'
            DataSource = DataMain.dsPool
            ParentColor = True
            ParentCtl3D = False
            Stretch = True
            TabOrder = 2
          end
          object DBImage4: TDBImage
            Left = 488
            Top = 0
            Width = 160
            Height = 160
            Ctl3D = False
            DataField = 'Pic4'
            DataSource = DataMain.dsPool
            ParentColor = True
            ParentCtl3D = False
            Stretch = True
            TabOrder = 3
          end
          object DBImage5: TDBImage
            Left = 648
            Top = 0
            Width = 160
            Height = 160
            Ctl3D = False
            DataField = 'Pic5'
            DataSource = DataMain.dsPool
            ParentColor = True
            ParentCtl3D = False
            Stretch = True
            TabOrder = 4
          end
          object DBImage6: TDBImage
            Left = 808
            Top = 0
            Width = 160
            Height = 160
            Ctl3D = False
            DataField = 'Pic6'
            DataSource = DataMain.dsPool
            ParentColor = True
            ParentCtl3D = False
            Stretch = True
            TabOrder = 5
          end
          object DBImage7: TDBImage
            Left = 968
            Top = 0
            Width = 160
            Height = 160
            Ctl3D = False
            DataField = 'Pic7'
            DataSource = DataMain.dsPool
            ParentColor = True
            ParentCtl3D = False
            Stretch = True
            TabOrder = 6
          end
          object DBImage8: TDBImage
            Left = 1128
            Top = 0
            Width = 160
            Height = 160
            Ctl3D = False
            DataField = 'Pic8'
            DataSource = DataMain.dsPool
            ParentColor = True
            ParentCtl3D = False
            Stretch = True
            TabOrder = 7
          end
          object DBImage9: TDBImage
            Left = 1288
            Top = 0
            Width = 160
            Height = 160
            Ctl3D = False
            DataField = 'Pic9'
            DataSource = DataMain.dsPool
            ParentColor = True
            ParentCtl3D = False
            Stretch = True
            TabOrder = 8
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = #1047#1072#1095#1077#1090
        ImageIndex = 1
        object grd_Event: TcxGrid
          Left = 0
          Top = 0
          Width = 769
          Height = 394
          Align = alClient
          PopupMenu = PopupMenu1
          TabOrder = 0
          OnEnter = grd_EventEnter
          OnExit = grd_GeneralExit
          object grd_EventDBTableView1: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = DataMain.dsEvent
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsView.GroupByBox = False
            object grd_EventDBTableView1Column1: TcxGridDBColumn
              DataBinding.FieldName = 'Event_Name'
              MinWidth = 30
              Width = 461
            end
          end
          object grd_EventLevel1: TcxGridLevel
            GridView = grd_EventDBTableView1
          end
        end
      end
    end
  end
  inherited ctl_ActionList: TActionList
    inherited act_Print: TAction
      Visible = True
    end
    inherited act_ExportToExcel: TAction [10]
    end
    inherited act_FormView: TAction [11]
    end
    inherited act_TableProp: TAction [12]
    end
    inherited act_SelectData: TAction [13]
    end
  end
  inherited cxPropertiesStore1: TcxPropertiesStore
    Components = <
      item
        Component = Owner
        Properties.Strings = (
          'Action'
          'ActiveControl'
          'Align'
          'AlphaBlend'
          'AlphaBlendValue'
          'Anchors'
          'AutoScroll'
          'AutoSize'
          'BiDiMode'
          'BorderIcons'
          'BorderStyle'
          'BorderWidth'
          'Caption'
          'ClientHeight'
          'ClientWidth'
          'Color'
          'Constraints'
          'Ctl3D'
          'Cursor'
          'DefaultMonitor'
          'DockSite'
          'DragKind'
          'DragMode'
          'Enabled'
          'Font'
          'FormStyle'
          'Height'
          'HelpContext'
          'HelpFile'
          'HelpKeyword'
          'HelpType'
          'Hint'
          'HorzScrollBar'
          'Icon'
          'KeyPreview'
          'Left'
          'Menu'
          'Name'
          'ObjectMenuItem'
          'OldCreateOrder'
          'ParentBiDiMode'
          'ParentFont'
          'PixelsPerInch'
          'PopupMenu'
          'Position'
          'PrintScale'
          'Scaled'
          'ShowHint'
          'Tag'
          'Top'
          'TransparentColor'
          'TransparentColorValue'
          'UseDockManager'
          'VertScrollBar'
          'Visible'
          'Width'
          'WindowMenu'
          'WindowState')
      end
      item
        Component = grd_GeneralDBTableView1Column2
        Properties.Strings = (
          'AlternateCaption'
          'BestFitMaxWidth'
          'Caption'
          'DataBinding'
          'DateTimeGrouping'
          'FakeComponentLink1'
          'FakeComponentLink2'
          'FakeComponentLink3'
          'FooterAlignmentHorz'
          'GroupIndex'
          'GroupSummaryAlignment'
          'HeaderAlignmentHorz'
          'HeaderAlignmentVert'
          'HeaderGlyph'
          'HeaderGlyphAlignmentHorz'
          'HeaderGlyphAlignmentVert'
          'MinWidth'
          'Name'
          'Options'
          'Properties'
          'PropertiesClassName'
          'RepositoryItem'
          'SortIndex'
          'SortOrder'
          'Styles'
          'Summary'
          'Tag'
          'Visible'
          'VisibleForCustomization'
          'Width')
      end
      item
        Component = grd_GeneralDBTableView1Column3
        Properties.Strings = (
          'AlternateCaption'
          'BestFitMaxWidth'
          'Caption'
          'DataBinding'
          'DateTimeGrouping'
          'FakeComponentLink1'
          'FakeComponentLink2'
          'FakeComponentLink3'
          'FooterAlignmentHorz'
          'GroupIndex'
          'GroupSummaryAlignment'
          'HeaderAlignmentHorz'
          'HeaderAlignmentVert'
          'HeaderGlyph'
          'HeaderGlyphAlignmentHorz'
          'HeaderGlyphAlignmentVert'
          'MinWidth'
          'Name'
          'Options'
          'Properties'
          'PropertiesClassName'
          'RepositoryItem'
          'SortIndex'
          'SortOrder'
          'Styles'
          'Summary'
          'Tag'
          'Visible'
          'VisibleForCustomization'
          'Width')
      end
      item
        Component = grd_GeneralDBTableView1Column4
        Properties.Strings = (
          'AlternateCaption'
          'BestFitMaxWidth'
          'Caption'
          'DataBinding'
          'DateTimeGrouping'
          'FakeComponentLink1'
          'FakeComponentLink2'
          'FakeComponentLink3'
          'FooterAlignmentHorz'
          'GroupIndex'
          'GroupSummaryAlignment'
          'HeaderAlignmentHorz'
          'HeaderAlignmentVert'
          'HeaderGlyph'
          'HeaderGlyphAlignmentHorz'
          'HeaderGlyphAlignmentVert'
          'MinWidth'
          'Name'
          'Options'
          'Properties'
          'PropertiesClassName'
          'RepositoryItem'
          'SortIndex'
          'SortOrder'
          'Styles'
          'Summary'
          'Tag'
          'Visible'
          'VisibleForCustomization'
          'Width')
      end
      item
        Component = grd_GeneralDBTableView1Column5
        Properties.Strings = (
          'AlternateCaption'
          'BestFitMaxWidth'
          'Caption'
          'DataBinding'
          'DateTimeGrouping'
          'FakeComponentLink1'
          'FakeComponentLink2'
          'FakeComponentLink3'
          'FooterAlignmentHorz'
          'GroupIndex'
          'GroupSummaryAlignment'
          'HeaderAlignmentHorz'
          'HeaderAlignmentVert'
          'HeaderGlyph'
          'HeaderGlyphAlignmentHorz'
          'HeaderGlyphAlignmentVert'
          'MinWidth'
          'Name'
          'Options'
          'Properties'
          'PropertiesClassName'
          'RepositoryItem'
          'SortIndex'
          'SortOrder'
          'Styles'
          'Summary'
          'Tag'
          'Visible'
          'VisibleForCustomization'
          'Width')
      end
      item
        Component = grd_RoundDBTableView1Column1
        Properties.Strings = (
          'AlternateCaption'
          'BestFitMaxWidth'
          'Caption'
          'DataBinding'
          'DateTimeGrouping'
          'FakeComponentLink1'
          'FakeComponentLink2'
          'FakeComponentLink3'
          'FooterAlignmentHorz'
          'GroupIndex'
          'GroupSummaryAlignment'
          'HeaderAlignmentHorz'
          'HeaderAlignmentVert'
          'HeaderGlyph'
          'HeaderGlyphAlignmentHorz'
          'HeaderGlyphAlignmentVert'
          'MinWidth'
          'Name'
          'Options'
          'Properties'
          'PropertiesClassName'
          'RepositoryItem'
          'SortIndex'
          'SortOrder'
          'Styles'
          'Summary'
          'Tag'
          'Visible'
          'VisibleForCustomization'
          'Width')
      end
      item
        Component = grd_RoundDBTableView1Column2
        Properties.Strings = (
          'AlternateCaption'
          'BestFitMaxWidth'
          'Caption'
          'DataBinding'
          'DateTimeGrouping'
          'FakeComponentLink1'
          'FakeComponentLink2'
          'FakeComponentLink3'
          'FooterAlignmentHorz'
          'GroupIndex'
          'GroupSummaryAlignment'
          'HeaderAlignmentHorz'
          'HeaderAlignmentVert'
          'HeaderGlyph'
          'HeaderGlyphAlignmentHorz'
          'HeaderGlyphAlignmentVert'
          'MinWidth'
          'Name'
          'Options'
          'Properties'
          'PropertiesClassName'
          'RepositoryItem'
          'SortIndex'
          'SortOrder'
          'Styles'
          'Summary'
          'Tag'
          'Visible'
          'VisibleForCustomization'
          'Width')
      end
      item
        Component = grd_RoundDBTableView1Column4
        Properties.Strings = (
          'AlternateCaption'
          'BestFitMaxWidth'
          'Caption'
          'DataBinding'
          'DateTimeGrouping'
          'FakeComponentLink1'
          'FakeComponentLink2'
          'FakeComponentLink3'
          'FooterAlignmentHorz'
          'GroupIndex'
          'GroupSummaryAlignment'
          'HeaderAlignmentHorz'
          'HeaderAlignmentVert'
          'HeaderGlyph'
          'HeaderGlyphAlignmentHorz'
          'HeaderGlyphAlignmentVert'
          'MinWidth'
          'Name'
          'Options'
          'Properties'
          'PropertiesClassName'
          'RepositoryItem'
          'SortIndex'
          'SortOrder'
          'Styles'
          'Summary'
          'Tag'
          'Visible'
          'VisibleForCustomization'
          'Width')
      end>
    StorageName = 'Software\Optimus\Competition'
  end
  object dlDivePool: TDualListDialog
    Sorted = False
    CancelBtnCaption = #1054#1090#1084#1077#1085#1072
    HelpContext = 0
    Left = 168
    Top = 304
  end
  object qryPoolLeft: TABSQuery
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudbge'
    InMemory = False
    ReadOnly = False
    Left = 136
    Top = 304
  end
  object qryPoolRight: TABSQuery
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudbge'
    InMemory = False
    ReadOnly = True
    Left = 200
    Top = 304
  end
end
