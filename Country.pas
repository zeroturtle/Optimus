unit Country;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, shf_FormAbstract, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, Menus, frxClass,
  frxExportXLS, cxPropertiesStore, frxDBSet, ImgList, ActnList,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  StdCtrls, ExtCtrls, ComCtrls, ToolWin, frxExportPDF, cxBlobEdit,
  frxExportImage, frxExportHTML;

type
  TfCountry = class(Tfsh_FormAbstract)
    grd_GeneralDBTableView1Column1: TcxGridDBColumn;
    grd_GeneralDBTableView1Column2: TcxGridDBColumn;
    coFlag: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCountry: TfCountry;

implementation

uses Unit5, constant;

{$R *.dfm}

procedure TfCountry.FormCreate(Sender: TObject);
begin
  FormID := Country_GUID;
  cds_ActiveDataSet := DataMain.tblCountry;
  inherited;
end;

end.
