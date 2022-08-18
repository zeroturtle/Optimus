inherited fPeople: TfPeople
  Left = 378
  Top = 238
  Width = 1034
  Height = 444
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1091#1095#1072#1089#1090#1085#1080#1082#1086#1074
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ctl_FilterSplitter: TSplitter
    Left = 648
    Height = 353
  end
  inherited ctl_ToolBar: TToolBar
    Width = 1018
  end
  inherited ctl_FilterPanel: TPanel
    Left = 653
    Height = 353
    inherited Panel2: TPanel
      Top = 318
    end
    inherited Panel3: TPanel
      Height = 301
    end
  end
  inherited ctl_DataPanel: TPanel
    Width = 648
    Height = 353
    inherited grd_General: TcxGrid
      Width = 648
      Height = 353
      inherited grd_GeneralDBTableView1: TcxGridDBTableView
        object grd_GeneralDBTableView1Column1: TcxGridDBColumn
          Caption = #1060'.'#1048'.'#1054'.'
          DataBinding.FieldName = 'Name'
          MinWidth = 60
          Width = 255
        end
        object grd_GeneralDBTableView1Column2: TcxGridDBColumn
          Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
          DataBinding.FieldName = 'Contact'
          MinWidth = 60
          Width = 255
        end
        object grd_GeneralDBTableView1Column3: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
          DataBinding.FieldName = 'Birthday'
          PropertiesClassName = 'TcxDateEditProperties'
        end
        object grd_GeneralDBTableView1Column4: TcxGridDBColumn
          Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
          DataBinding.FieldName = 'Category'
        end
        object grd_GeneralDBTableView1Column5: TcxGridDBColumn
          Caption = #1057#1077#1088#1080#1092#1080#1082#1072#1090
          DataBinding.FieldName = 'Certificate'
        end
        object grd_GeneralDBTableView1Column6: TcxGridDBColumn
          Caption = #1050#1086#1083'. '#1087#1088#1099#1078#1082#1086#1074
          DataBinding.FieldName = 'Jumps'
        end
        object grd_GeneralDBTableView1Column11: TcxGridDBColumn
          Caption = #1057#1087#1086#1088#1090#1080#1074#1085#1099#1081' '#1082#1083#1091#1073
          DataBinding.FieldName = 'Club_Name'
        end
        object grd_GeneralDBTableView1Column10: TcxGridDBColumn
          Caption = #1056#1077#1075#1080#1086#1085' ('#1075#1086#1088#1086#1076', '#1089#1090#1088#1072#1085#1072')'
          DataBinding.FieldName = 'Location'
        end
        object grd_GeneralDBTableView1Column8: TcxGridDBColumn
          Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          DataBinding.FieldName = 'Remark'
        end
      end
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
      end>
    StorageName = 'Software\Optimus\People'
  end
end
