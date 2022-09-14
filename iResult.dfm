inherited fIndResult: TfIndResult
  Left = 691
  Top = 219
  Width = 1057
  Height = 633
  Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1080#1085#1076#1080#1074#1080#1076#1091#1072#1083#1100#1085#1099#1077
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ctl_FilterSplitter: TSplitter
    Left = 671
    Height = 542
  end
  inherited ctl_ToolBar: TToolBar
    Width = 1041
    object ToolButton1: TToolButton
      Left = 199
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 15
      Style = tbsSeparator
    end
    object ToolButton2: TToolButton
      Left = 207
      Top = 0
      Action = act_Calc
    end
  end
  inherited ctl_FilterPanel: TPanel
    Left = 676
    Height = 542
    inherited Panel2: TPanel
      Top = 507
    end
    inherited Panel3: TPanel
      Height = 490
    end
  end
  inherited ctl_DataPanel: TPanel
    Width = 671
    Height = 542
    object Splitter1: TSplitter [0]
      Left = 0
      Top = 393
      Width = 671
      Height = 5
      Cursor = crVSplit
      Align = alTop
    end
    inherited grd_General: TcxGrid
      Width = 671
      Height = 393
      Align = alTop
      OnEnter = grd_GeneralEnter
      OnExit = grd_GeneralExit
      inherited grd_GeneralDBTableView1: TcxGridDBTableView
        object grd_GeneralDBTableView1Column1: TcxGridDBColumn
          Caption = #1054#1092#1080#1094#1080#1072#1083#1100#1085#1099#1081
          DataBinding.FieldName = 'Sign'
          Width = 35
        end
        object grd_GeneralDBTableView1Column2: TcxGridDBColumn
          Caption = #8470' '#1058#1091#1088#1072
          DataBinding.FieldName = 'Round_Num'
        end
        object grd_GeneralDBTableView1Column6: TcxGridDBColumn
          DataBinding.FieldName = 'Task'
        end
        object grd_GeneralDBTableView1Column3: TcxGridDBColumn
          Caption = #1053#1086#1084#1077#1088
          DataBinding.FieldName = 'MemberNumber'
        end
        object grd_GeneralDBTableView1Column4: TcxGridDBColumn
          Caption = #1060#1048#1054' '#1091#1095#1072#1089#1090#1085#1080#1082#1072
          DataBinding.FieldName = 'MemberName'
        end
        object grd_GeneralDBTableView1Column5: TcxGridDBColumn
          Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
          DataBinding.FieldName = 'Scores'
        end
        object grd_GeneralDBTableView1Column7: TcxGridDBColumn
          Caption = #1064#1090#1088#1072#1092
          DataBinding.FieldName = 'Penalty_Name'
        end
        object grd_GeneralDBTableView1Column8: TcxGridDBColumn
          Caption = #1054#1095#1082#1080
          DataBinding.FieldName = 'Rate'
        end
        object grd_GeneralDBTableView1Column9: TcxGridDBColumn
          DataBinding.FieldName = 'Team_ID'
        end
      end
    end
    object grdDetail: TcxGrid
      Left = 0
      Top = 398
      Width = 671
      Height = 144
      Align = alClient
      PopupMenu = PopupMenu1
      TabOrder = 1
      OnEnter = grdDetailEnter
      OnExit = grd_GeneralExit
      object grdDetailDBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsDetail
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        DataController.OnDataChanged = grdDetailDBTableView1DataControllerDataChanged
        object grdDetailDBTableView1Column1: TcxGridDBColumn
          DataBinding.FieldName = 'P1'
          Width = 135
        end
        object grdDetailDBTableView1Column2: TcxGridDBColumn
          DataBinding.FieldName = 'P2'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.NullStyle = nssUnchecked
        end
        object grdDetailDBTableView1Column3: TcxGridDBColumn
          DataBinding.FieldName = 'P3'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.NullStyle = nssUnchecked
        end
        object grdDetailDBTableView1Column4: TcxGridDBColumn
          DataBinding.FieldName = 'P4'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.NullStyle = nssUnchecked
        end
        object grdDetailDBTableView1Column5: TcxGridDBColumn
          DataBinding.FieldName = 'P5'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.NullStyle = nssUnchecked
        end
        object grdDetailDBTableView1Column6: TcxGridDBColumn
          DataBinding.FieldName = 'P6'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.NullStyle = nssUnchecked
        end
        object grdDetailDBTableView1Column7: TcxGridDBColumn
          DataBinding.FieldName = 'P7'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.NullStyle = nssUnchecked
        end
        object grdDetailDBTableView1Column8: TcxGridDBColumn
          DataBinding.FieldName = 'P8'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.NullStyle = nssUnchecked
        end
        object grdDetailDBTableView1Column9: TcxGridDBColumn
          DataBinding.FieldName = 'P9'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.NullStyle = nssUnchecked
        end
        object grdDetailDBTableView1Column10: TcxGridDBColumn
          DataBinding.FieldName = 'P10'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.NullStyle = nssUnchecked
        end
      end
      object grdDetailLevel1: TcxGridLevel
        GridView = grdDetailDBTableView1
      end
    end
  end
  inherited ctl_ActionList: TActionList
    inherited act_Calc: TAction
      OnExecute = ActionExecute
    end
    object act_ChangeRecord: TAction
      Category = 'DB'
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1086#1094#1077#1085#1082#1091
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1086#1094#1077#1085#1082#1091
      ImageIndex = 17
      OnExecute = ActionExecute
    end
  end
  inherited cxPropertiesStore1: TcxPropertiesStore
    Components = <
      item
        Component = fsh_FormAbstract.grd_GeneralDBTableView1
      end>
    StorageName = 'Software\Optimus\iResult'
  end
  object dsDetail: TDataSource
    DataSet = DataMain.tblResultDetail1
    Left = 24
    Top = 248
  end
end
