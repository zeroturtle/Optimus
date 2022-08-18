inherited fCountry: TfCountry
  Left = 227
  Top = 192
  Caption = #1057#1090#1088#1072#1085#1099
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ctl_DataPanel: TPanel
    inherited grd_General: TcxGrid
      inherited grd_GeneralDBTableView1: TcxGridDBTableView
        object grd_GeneralDBTableView1Column1: TcxGridDBColumn
          Caption = #1050#1086#1076
          DataBinding.FieldName = 'Code'
        end
        object grd_GeneralDBTableView1Column2: TcxGridDBColumn
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'Name'
        end
        object coFlag: TcxGridDBColumn
          Caption = #1048#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077
          DataBinding.FieldName = 'Flag'
          PropertiesClassName = 'TcxBlobEditProperties'
          Properties.BlobEditKind = bekPict
        end
      end
    end
  end
  inherited cxPropertiesStore1: TcxPropertiesStore
    Components = <
      item
        Component = fsh_FormAbstract.grd_GeneralDBTableView1
      end>
    StorageName = 'Software\Optimus\Country'
  end
end
