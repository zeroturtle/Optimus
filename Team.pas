unit Team;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, shf_FormAbstract, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, Menus, frxClass,
  frxExportXLS, cxPropertiesStore, frxDBSet, ImgList, ActnList,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  StdCtrls, ExtCtrls, ComCtrls, ToolWin, frxExportPDF, cxCalendar,
  frxExportHTML, frxExportImage;

type
  TfTeam = class(Tfsh_FormAbstract)
    grdDetail: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    Splitter1: TSplitter;
    grd_GeneralDBTableView1Column1: TcxGridDBColumn;
    grd_GeneralDBTableView1Column2: TcxGridDBColumn;
    grd_GeneralDBTableView1Column3: TcxGridDBColumn;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    dsDetail: TDataSource;
    grd_GeneralDBTableView1Column4: TcxGridDBColumn;
    cxGridDBTableView1Column4: TcxGridDBColumn;
    grd_GeneralDBTableView1Column6: TcxGridDBColumn;
    cxGridDBTableView1Column5: TcxGridDBColumn;
    cxGridDBTableView1Column6: TcxGridDBColumn;
    grd_GeneralDBTableView1Column5: TcxGridDBColumn;
    cxGridDBTableView1Column7: TcxGridDBColumn;
    procedure grd_GeneralEnter(Sender: TObject);
    procedure grdDetailEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTeam: TfTeam;

implementation

uses Unit5, constant;

{$R *.dfm}

procedure TfTeam.grd_GeneralEnter(Sender: TObject);
begin
  inherited;
  cds_ActiveDataSet := DataMain.tblTeam;
  SetActiveGrid(grd_General, true);
end;

procedure TfTeam.grdDetailEnter(Sender: TObject);
begin
  inherited;
  cds_ActiveDataSet:= DataMain.tblMember;
  SetActiveGrid(grdDetail, true);
end;

procedure TfTeam.FormCreate(Sender: TObject);
begin
  FormID := Team_GUID;
  cds_ActiveDataSet := DataMain.tblTeam;
  inherited;
end;

end.
