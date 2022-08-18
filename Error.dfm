inherited fError: TfError
  Left = 995
  Top = 121
  Caption = #1055#1088#1080#1095#1080#1085#1099' '#1086#1096#1080#1073#1086#1082
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ctl_DataPanel: TPanel
    inherited grd_General: TcxGrid
      inherited grd_GeneralDBTableView1: TcxGridDBTableView
        object grd_GeneralDBTableView1Column1: TcxGridDBColumn
          Caption = #1050#1086#1076' '#1086#1096#1080#1073#1082#1080
          DataBinding.FieldName = 'Code'
          MinWidth = 10
          Width = 82
        end
        object grd_GeneralDBTableView1Column2: TcxGridDBColumn
          Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1087#1088#1080#1095#1080#1085#1099' '#1096#1090#1088#1072#1092#1072
          DataBinding.FieldName = 'Description'
          MinWidth = 60
          Width = 351
        end
      end
    end
  end
  inherited cxPropertiesStore1: TcxPropertiesStore
    Components = <
      item
        Component = fsh_FormAbstract.grd_GeneralDBTableView1
      end>
    StorageName = 'Software\Optimus\Errors'
  end
end
