inherited fJudge: TfJudge
  Left = 1004
  Top = 118
  Caption = 'C'#1091#1076#1100#1080
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ctl_ToolBar: TToolBar
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
      Action = act_Rating
    end
  end
  inherited ctl_DataPanel: TPanel
    inherited grd_General: TcxGrid
      inherited grd_GeneralDBTableView1: TcxGridDBTableView
        object grd_GeneralDBTableView1Column1: TcxGridDBColumn
          Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
          DataBinding.FieldName = 'Sort'
        end
        object grd_GeneralDBTableView1Column2: TcxGridDBColumn
          Caption = #1060'.'#1048'.'#1054'. '#1089#1091#1076#1100#1080
          DataBinding.FieldName = 'Name'
          Width = 297
        end
        object grd_GeneralDBTableView1Column3: TcxGridDBColumn
          Caption = #1056#1086#1083#1100
          DataBinding.FieldName = 'Role_Name'
        end
        object grd_GeneralDBTableView1Column6: TcxGridDBColumn
          Caption = #1057#1090#1088#1072#1085#1072
          DataBinding.FieldName = 'Country_Name'
        end
        object grd_GeneralDBTableView1Column4: TcxGridDBColumn
          Caption = #8470' '#1055#1091#1083#1100#1090#1072
          DataBinding.FieldName = 'Port'
        end
        object grd_GeneralDBTableView1Column5: TcxGridDBColumn
          Caption = #1057#1090#1072#1078#1077#1088
          DataBinding.FieldName = 'IsTrainee'
        end
        object grd_GeneralDBTableView1Column7: TcxGridDBColumn
          Caption = #1055#1088#1086#1079#1074#1080#1097#1077
          DataBinding.FieldName = 'NickName'
        end
        object grd_GeneralDBTableView1Column8: TcxGridDBColumn
          Caption = #1056#1077#1081#1090#1080#1085#1075
          DataBinding.FieldName = 'Rating'
        end
      end
    end
  end
  inherited ctl_ActionList: TActionList
    object act_Rating: TAction
      Tag = 11
      Caption = #1055#1086#1089#1095#1080#1090#1072#1090#1100' '#1088#1077#1081#1090#1080#1085#1075
      ImageIndex = 17
      OnExecute = ActionExecute
    end
  end
  inherited cxPropertiesStore1: TcxPropertiesStore
    Components = <
      item
        Component = fsh_FormAbstract.grd_GeneralDBTableView1
      end>
    StorageName = 'Software\Optimus\Judges'
  end
end
