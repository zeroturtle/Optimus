inherited fResult: TfResult
  Left = 650
  Top = 132
  Width = 879
  Height = 576
  Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1082#1086#1084#1072#1085#1076
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ctl_FilterSplitter: TSplitter
    Left = 493
    Height = 485
  end
  inherited ctl_ToolBar: TToolBar
    Width = 863
    object ToolButton2: TToolButton
      Left = 199
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 19
      Style = tbsSeparator
    end
    object ToolButton1: TToolButton
      Left = 207
      Top = 0
      Hint = #1055#1086#1089#1095#1080#1090#1072#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090
      Action = act_Calc
    end
    object ToolButton3: TToolButton
      Left = 232
      Top = 0
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1086#1094#1077#1085#1082#1091
      Action = act_Change
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1086#1094#1077#1085#1082#1091
    end
  end
  inherited ctl_FilterPanel: TPanel
    Left = 498
    Height = 485
    inherited Panel2: TPanel
      Top = 450
    end
    inherited Panel3: TPanel
      Height = 433
    end
  end
  inherited ctl_DataPanel: TPanel
    Width = 493
    Height = 485
    object Splitter1: TSplitter [0]
      Left = 0
      Top = 273
      Width = 493
      Height = 8
      Cursor = crVSplit
      Align = alTop
    end
    inherited grd_General: TcxGrid
      Width = 493
      Height = 273
      Align = alTop
      OnEnter = grd_GeneralEnter
      OnExit = grd_GeneralExit
      inherited grd_GeneralDBTableView1: TcxGridDBTableView
        OptionsView.ShowEditButtons = gsebForFocusedRecord
        object grd_GeneralDBTableView1Column1: TcxGridDBColumn
          DataBinding.FieldName = 'Team_Name'
        end
        object grd_GeneralDBTableView1Column2: TcxGridDBColumn
          Caption = #1058#1091#1088
          DataBinding.FieldName = 'Round'
          MinWidth = 50
        end
        object grd_GeneralDBTableView1Column3: TcxGridDBColumn
          Caption = #1064#1090#1088#1072#1092
          DataBinding.FieldName = 'Penalty_Name'
          Width = 115
        end
        object grd_GeneralDBTableView1Column4: TcxGridDBColumn
          Caption = #1060#1072#1081#1083' '#1074#1080#1076#1077#1086#1079#1072#1087#1080#1089#1080
          DataBinding.FieldName = 'VideoFile'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Width = 137
        end
        object grd_GeneralDBTableView1Column5: TcxGridDBColumn
          Caption = #1054#1094#1077#1085#1082#1072
          DataBinding.FieldName = 'Scores'
        end
        object grd_GeneralDBTableView1Column6: TcxGridDBColumn
          Caption = #1054#1092#1080#1094#1080#1072#1083#1100#1085#1099#1081
          DataBinding.FieldName = 'Sign'
        end
        object grd_GeneralDBTableView1Column7: TcxGridDBColumn
          Caption = #1055#1086#1089#1083#1077#1076#1086#1074#1072#1090#1077#1083#1100#1085#1086#1089#1090#1100
          DataBinding.FieldName = 'Pool_Sequence'
        end
        object grd_GeneralDBTableView1Column8: TcxGridDBColumn
          Caption = #1042#1088#1077#1084#1103' '#1082#1088#1072#1081#1085#1077#1081' '#1086#1094#1077#1085#1082#1080
          DataBinding.FieldName = 'LastTime'
        end
      end
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 281
      Width = 493
      Height = 204
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 1
      object TabSheet1: TTabSheet
        Caption = #1054#1094#1077#1085#1082#1080
        object grdDetail: TcxGrid
          Left = 0
          Top = 0
          Width = 485
          Height = 176
          Align = alClient
          PopupMenu = PopupMenu1
          TabOrder = 0
          OnEnter = grdDetailEnter
          LookAndFeel.NativeStyle = True
          object grdDetailDBTableView1: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = dsDetail
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                FieldName = 'P1'
                Column = grdDetailDBTableView1Column2
              end>
            DataController.Summary.SummaryGroups = <>
            DataController.OnDataChanged = grdDetailDBTableView1DataControllerDataChanged
            OptionsCustomize.ColumnGrouping = False
            OptionsSelection.CellSelect = False
            object grdDetailDBTableView1Column3: TcxGridDBColumn
              Caption = #1057#1090#1072#1078#1077#1088
              DataBinding.FieldName = 'IsTrainee'
            end
            object grdDetailDBTableView1Column1: TcxGridDBColumn
              Caption = #1057#1091#1076#1100#1103
              DataBinding.FieldName = 'Judge'
              Width = 226
            end
            object grdDetailDBTableView1Column2: TcxGridDBColumn
              Caption = #1054#1094#1077#1085#1082#1072' 1'
              DataBinding.FieldName = 'P1'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
            end
            object grdDetailDBTableView1Column4: TcxGridDBColumn
              Caption = #1054#1094#1077#1085#1082#1072' 2'
              DataBinding.FieldName = 'P2'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
            end
            object grdDetailDBTableView1Column5: TcxGridDBColumn
              Caption = #1054#1094#1077#1085#1082#1072' 3'
              DataBinding.FieldName = 'P3'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
            end
            object grdDetailDBTableView1Column6: TcxGridDBColumn
              Caption = #1054#1094#1077#1085#1082#1072' 4'
              DataBinding.FieldName = 'P4'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
            end
            object grdDetailDBTableView1Column7: TcxGridDBColumn
              Caption = #1054#1094#1077#1085#1082#1072' 5'
              DataBinding.FieldName = 'P5'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
            end
            object grdDetailDBTableView1Column8: TcxGridDBColumn
              Caption = #1054#1094#1077#1085#1082#1072' 6'
              DataBinding.FieldName = 'P6'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
            end
            object grdDetailDBTableView1Column9: TcxGridDBColumn
              Caption = #1054#1094#1077#1085#1082#1072' 7'
              DataBinding.FieldName = 'P7'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
            end
            object grdDetailDBTableView1Column10: TcxGridDBColumn
              Caption = #1054#1094#1077#1085#1082#1072' 8'
              DataBinding.FieldName = 'P8'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
            end
            object grdDetailDBTableView1Column11: TcxGridDBColumn
              Caption = #1054#1094#1077#1085#1082#1072' 9'
              DataBinding.FieldName = 'P9'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
            end
            object grdDetailDBTableView1Column12: TcxGridDBColumn
              Caption = #1054#1094#1077#1085#1082#1072' 10'
              DataBinding.FieldName = 'P10'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
            end
            object grdDetailDBTableView1Column13: TcxGridDBColumn
              Caption = #1054#1094#1077#1085#1082#1072' 11'
              DataBinding.FieldName = 'P11'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
            end
            object grdDetailDBTableView1Column14: TcxGridDBColumn
              Caption = #1054#1094#1077#1085#1082#1072' 12'
              DataBinding.FieldName = 'P12'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
            end
            object grdDetailDBTableView1Column15: TcxGridDBColumn
              Caption = #1054#1094#1077#1085#1082#1072' 13'
              DataBinding.FieldName = 'P13'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
            end
            object grdDetailDBTableView1Column16: TcxGridDBColumn
              Caption = #1054#1094#1077#1085#1082#1072' 14'
              DataBinding.FieldName = 'P14'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
            end
            object grdDetailDBTableView1Column17: TcxGridDBColumn
              Caption = #1054#1094#1077#1085#1082#1072' 15'
              DataBinding.FieldName = 'P15'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
            end
            object grdDetailDBTableView1Column18: TcxGridDBColumn
              Caption = #1054#1094#1077#1085#1082#1072' 16'
              DataBinding.FieldName = 'P16'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
            end
            object grdDetailDBTableView1Column19: TcxGridDBColumn
              Caption = #1054#1094#1077#1085#1082#1072' 17'
              DataBinding.FieldName = 'P17'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
            end
            object grdDetailDBTableView1Column20: TcxGridDBColumn
              Caption = #1054#1094#1077#1085#1082#1072' 18'
              DataBinding.FieldName = 'P18'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
            end
            object grdDetailDBTableView1Column21: TcxGridDBColumn
              Caption = #1054#1094#1077#1085#1082#1072' 19'
              DataBinding.FieldName = 'P19'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
            end
            object grdDetailDBTableView1Column22: TcxGridDBColumn
              Caption = #1054#1094#1077#1085#1082#1072' 20'
              DataBinding.FieldName = 'P20'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
            end
            object grdDetailDBTableView1Column23: TcxGridDBColumn
              Caption = #1054#1094#1077#1085#1082#1072' 21'
              DataBinding.FieldName = 'P21'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
            end
            object grdDetailDBTableView1Column24: TcxGridDBColumn
              Caption = #1054#1094#1077#1085#1082#1072' 22'
              DataBinding.FieldName = 'P22'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
            end
            object grdDetailDBTableView1Column25: TcxGridDBColumn
              Caption = #1054#1094#1077#1085#1082#1072' 23'
              DataBinding.FieldName = 'P23'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
            end
            object grdDetailDBTableView1Column26: TcxGridDBColumn
              Caption = #1054#1094#1077#1085#1082#1072' 24'
              DataBinding.FieldName = 'P24'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
            end
            object grdDetailDBTableView1Column27: TcxGridDBColumn
              Caption = #1054#1094#1077#1085#1082#1072' 25'
              DataBinding.FieldName = 'P25'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
            end
            object grdDetailDBTableView1Column28: TcxGridDBColumn
              Caption = #1054#1094#1077#1085#1082#1072' 26'
              DataBinding.FieldName = 'P26'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
            end
            object grdDetailDBTableView1Column29: TcxGridDBColumn
              Caption = #1054#1094#1077#1085#1082#1072' 27'
              DataBinding.FieldName = 'P27'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
            end
            object grdDetailDBTableView1Column30: TcxGridDBColumn
              Caption = #1054#1094#1077#1085#1082#1072' 28'
              DataBinding.FieldName = 'P28'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
            end
            object grdDetailDBTableView1Column31: TcxGridDBColumn
              Caption = #1054#1094#1077#1085#1082#1072' 29'
              DataBinding.FieldName = 'P29'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
            end
            object grdDetailDBTableView1Column32: TcxGridDBColumn
              Caption = #1054#1094#1077#1085#1082#1072' 30'
              DataBinding.FieldName = 'P30'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
            end
            object grdDetailDBTableView1Column33: TcxGridDBColumn
              DataBinding.FieldName = 'T1'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
            end
          end
          object grdDetailBandedTableView1: TcxGridBandedTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            Bands = <
              item
              end>
          end
          object grdDetailBandedTableView2: TcxGridBandedTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            Bands = <
              item
              end>
          end
          object grdDetailLevel1: TcxGridLevel
            GridView = grdDetailDBTableView1
          end
        end
      end
    end
  end
  inherited ctl_ActionList: TActionList
    inherited act_Calc: TAction
      Caption = #1055#1086#1089#1095#1080#1090#1072#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090
      OnExecute = ActionExecute
    end
    object act_Change: TAction
      Tag = 12
      Category = 'DB'
      Caption = 'act_Change'
      ImageIndex = 17
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
        Component = grd_GeneralDBTableView1
        Properties.Strings = (
          'BackgroundBitmaps'
          'DataController'
          'DateTimeHandling'
          'DragMode'
          'FakeComponentLink1'
          'FakeComponentLink2'
          'FakeComponentLink3'
          'FilterBox'
          'Filtering'
          'FilterRow'
          'Name'
          'NavigatorButtons'
          'NewItemRow'
          'OptionsBehavior'
          'OptionsCustomize'
          'OptionsData'
          'OptionsSelection'
          'OptionsView'
          'PopupMenu'
          'Preview'
          'Styles'
          'Synchronization'
          'Tag')
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
      end>
    StorageName = 'Software\Optimus\Result'
  end
  object dsDetail: TDataSource [10]
    DataSet = DataMain.tblResultDetail
    Left = 32
    Top = 248
  end
end
