object fd_Pool: Tfd_Pool
  Left = 966
  Top = 213
  BorderStyle = bsSingle
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1092#1080#1075#1091#1088
  ClientHeight = 501
  ClientWidth = 827
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 827
    Height = 501
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel3'
    TabOrder = 0
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 827
      Height = 24
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = #1057#1087#1080#1089#1086#1082' '#1092#1080#1075#1091#1088
    end
    object cxGrid1: TcxGrid
      Left = 0
      Top = 24
      Width = 827
      Height = 477
      Align = alClient
      TabOrder = 0
      object cxGrid1DBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = DataSource1
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.Navigator = True
        object colCode: TcxGridDBColumn
          Caption = #1050#1086#1076
          DataBinding.FieldName = 'Pool_Code'
          Width = 46
        end
        object colName: TcxGridDBColumn
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'Name'
          MinWidth = 60
          Width = 244
        end
        object colPoolName: TcxGridDBColumn
          Caption = 'DivePool'
          DataBinding.FieldName = 'PoolName'
          MinWidth = 50
        end
        object colImage1: TcxGridDBColumn
          Caption = #1060#1080#1075#1091#1088#1072' 1'
          DataBinding.FieldName = 'Image1'
          PropertiesClassName = 'TcxBlobEditProperties'
          Properties.BlobEditKind = bekPict
        end
        object colImage2: TcxGridDBColumn
          DataBinding.FieldName = 'Image2'
          PropertiesClassName = 'TcxBlobEditProperties'
          Properties.BlobEditKind = bekPict
        end
        object colImage3: TcxGridDBColumn
          DataBinding.FieldName = 'Image3'
          PropertiesClassName = 'TcxBlobEditProperties'
          Properties.BlobEditKind = bekPict
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = DataMain.tblPool
    Left = 112
    Top = 80
  end
  object odBlob: TOpenDialog
    Filter = 'BMP (*.bmp)|*.bmp|All file (*.*)|*.*'
    Options = [ofReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 187
    Top = 81
  end
  object sdBlob: TSaveDialog
    Filter = 'BMP (*.bmp)|*.bmp|All files (*.*)|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 219
    Top = 81
  end
  object cxPropertiesStore1: TcxPropertiesStore
    Components = <
      item
        Component = colCode
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
        Component = colName
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
    StorageName = 'Software\Optimus\Pool'
    StorageType = stRegistry
    Left = 256
    Top = 80
  end
end
