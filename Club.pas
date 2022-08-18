unit Club;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, shf_FormAbstract, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, frxExportPDF, Menus,
  frxClass, frxExportXLS, cxPropertiesStore, frxDBSet, ImgList, ActnList,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  StdCtrls, ExtCtrls, ComCtrls, ToolWin, frxExportHTML, frxExportImage;

type
  TfClub = class(Tfsh_FormAbstract)
    grd_GeneralDBTableView1Column1: TcxGridDBColumn;
    grd_GeneralDBTableView1Column2: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fClub: TfClub;

implementation

uses Unit5, constant;

{$R *.dfm}

procedure TfClub.FormCreate(Sender: TObject);
begin
  FormID := Club_GUID;
  cds_ActiveDataSet := DataMain.tblClub;
  inherited;
end;

end.
