unit Error;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, shf_FormAbstract, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, frxExportPDF, Menus,
  frxClass, frxExportXLS, cxPropertiesStore, frxDBSet, ImgList, ActnList,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  StdCtrls, ExtCtrls, ComCtrls, ToolWin, frxExportImage, frxExportHTML;

type
  TfError = class(Tfsh_FormAbstract)
    grd_GeneralDBTableView1Column1: TcxGridDBColumn;
    grd_GeneralDBTableView1Column2: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fError: TfError;

implementation

uses Unit5, constant;

{$R *.dfm}

procedure TfError.FormCreate(Sender: TObject);
begin
  FormID := Error_GUID;
  cds_ActiveDataSet := DataMain.tblErrors;
  inherited;
end;

end.
