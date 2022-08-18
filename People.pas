unit People;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, shf_FormAbstract, ImgList, ActnList, Menus, ComCtrls, ToolWin,
  DB, Grids, DBGrids, StdCtrls, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxNavigator,
  cxDBNavigator, frxClass, frxDBSet, cxPropertiesStore, frxExportXLS,
  frxExportPDF, cxCalendar, frxExportHTML, frxExportImage;

type
  TfPeople = class(Tfsh_FormAbstract)
    grd_GeneralDBTableView1Column1: TcxGridDBColumn;
    grd_GeneralDBTableView1Column2: TcxGridDBColumn;
    grd_GeneralDBTableView1Column3: TcxGridDBColumn;
    grd_GeneralDBTableView1Column4: TcxGridDBColumn;
    grd_GeneralDBTableView1Column5: TcxGridDBColumn;
    grd_GeneralDBTableView1Column6: TcxGridDBColumn;
    grd_GeneralDBTableView1Column8: TcxGridDBColumn;
    grd_GeneralDBTableView1Column10: TcxGridDBColumn;
    grd_GeneralDBTableView1Column11: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPeople: TfPeople;

implementation

uses Unit5, constant;

{$R *.dfm}

procedure TfPeople.FormCreate(Sender: TObject);
begin
  FormID := People_GUID;
  cds_ActiveDataSet := DataMain.tblPeople;
  inherited;
end;                            

end.
