inherited fClub: TfClub
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1089#1087#1086#1088#1090#1080#1074#1085#1099#1093' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1081
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ctl_DataPanel: TPanel
    inherited grd_General: TcxGrid
      inherited grd_GeneralDBTableView1: TcxGridDBTableView
        object grd_GeneralDBTableView1Column1: TcxGridDBColumn
          DataBinding.FieldName = 'Club_ID'
        end
        object grd_GeneralDBTableView1Column2: TcxGridDBColumn
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'Club_Name'
          Width = 317
        end
      end
    end
  end
  inherited cxPropertiesStore1: TcxPropertiesStore
    Components = <
      item
        Component = fsh_FormAbstract.grd_GeneralDBTableView1
      end>
    StorageName = 'Software\Optimus\Club'
  end
end
