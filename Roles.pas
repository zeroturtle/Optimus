unit Roles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, shf_FormAbstract, DB, Grids, DBGrids, ImgList, ActnList, Menus,
  ComCtrls, ToolWin, StdCtrls, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  frxClass, frxDBSet, cxPropertiesStore, frxExportXLS, frxExportPDF,
  frxExportImage, frxExportHTML;

type
  TfRoles = class(Tfsh_FormAbstract)
    grd_GeneralDBTableView1Column1: TcxGridDBColumn;
    grd_GeneralDBTableView1Column2: TcxGridDBColumn;
    grd_GeneralDBTableView1Column3: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRoles: TfRoles;

implementation

uses Unit5, constant;

{$R *.dfm}

procedure TfRoles.FormCreate(Sender: TObject);
begin
  FormID := Role_GUID;
  cds_ActiveDataSet := DataMain.tblRoles;
  inherited;
end;

end.
