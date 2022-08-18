inherited fTeam: TfTeam
  Left = 641
  Top = 118
  Width = 1153
  Height = 546
  Caption = #1050#1086#1084#1072#1085#1076#1099
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ctl_FilterSplitter: TSplitter
    Left = 767
    Height = 455
  end
  inherited ctl_ToolBar: TToolBar
    Width = 1137
  end
  inherited ctl_FilterPanel: TPanel
    Left = 772
    Height = 455
    inherited Panel2: TPanel
      Top = 420
    end
    inherited Panel3: TPanel
      Height = 403
    end
  end
  inherited ctl_DataPanel: TPanel
    Width = 767
    Height = 455
    object Splitter1: TSplitter [0]
      Left = 0
      Top = 217
      Width = 767
      Height = 8
      Cursor = crVSplit
      Align = alTop
    end
    inherited grd_General: TcxGrid
      Width = 767
      Height = 217
      Align = alTop
      OnEnter = grd_GeneralEnter
      inherited grd_GeneralDBTableView1: TcxGridDBTableView
        object grd_GeneralDBTableView1Column4: TcxGridDBColumn
          Caption = #1043#1086#1089#1090#1080
          DataBinding.FieldName = 'Guest'
        end
        object grd_GeneralDBTableView1Column1: TcxGridDBColumn
          Caption = #1053#1086#1084#1077#1088
          DataBinding.FieldName = 'Number'
        end
        object grd_GeneralDBTableView1Column2: TcxGridDBColumn
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1082#1086#1084#1072#1085#1076#1099
          DataBinding.FieldName = 'Name'
          Width = 220
        end
        object grd_GeneralDBTableView1Column6: TcxGridDBColumn
          Caption = #1057#1087#1086#1088#1090#1080#1074#1085#1099#1081' '#1082#1083#1091#1073
          DataBinding.FieldName = 'Club_Name'
          Width = 312
        end
        object grd_GeneralDBTableView1Column5: TcxGridDBColumn
          Caption = #1047#1072#1095#1077#1090
          DataBinding.FieldName = 'Event_Name'
          MinWidth = 30
        end
        object grd_GeneralDBTableView1Column3: TcxGridDBColumn
          Caption = #1057#1090#1088#1072#1085#1072
          DataBinding.FieldName = 'Country'
          Width = 100
        end
      end
    end
    object grdDetail: TcxGrid
      Left = 0
      Top = 225
      Width = 767
      Height = 230
      Align = alClient
      PopupMenu = PopupMenu1
      TabOrder = 1
      OnEnter = grdDetailEnter
      object cxGridDBTableView1: TcxGridDBTableView
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
        DataController.DataSource = dsDetail
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.IncSearch = True
        OptionsSelection.CellSelect = False
        object cxGridDBTableView1Column4: TcxGridDBColumn
          Caption = #1053#1086#1084#1077#1088
          DataBinding.FieldName = 'Number'
          Width = 43
        end
        object cxGridDBTableView1Column1: TcxGridDBColumn
          Caption = #1060#1048#1054' '#1091#1095#1072#1089#1090#1085#1080#1082#1072
          DataBinding.FieldName = 'Name'
          Width = 425
        end
        object cxGridDBTableView1Column2: TcxGridDBColumn
          Caption = #1056#1086#1083#1100
          DataBinding.FieldName = 'Role'
        end
        object cxGridDBTableView1Column7: TcxGridDBColumn
          Caption = #1058#1088#1077#1085#1077#1088
          DataBinding.FieldName = 'TrainerName'
          Width = 402
        end
        object cxGridDBTableView1Column5: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1042#1051#1050
          DataBinding.FieldName = 'MedicineDate'
          PropertiesClassName = 'TcxDateEditProperties'
        end
        object cxGridDBTableView1Column6: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1089#1090#1088#1072#1093#1086#1074#1082#1080
          DataBinding.FieldName = 'InsuranceDate'
          PropertiesClassName = 'TcxDateEditProperties'
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
  end
  inherited cxPropertiesStore1: TcxPropertiesStore
    Components = <
      item
        Component = fsh_FormAbstract.grd_GeneralDBTableView1
      end>
    StorageName = 'Software\Optimus\Team'
  end
  object dsDetail: TDataSource
    DataSet = DataMain.tblMember
    Left = 16
    Top = 256
  end
end
