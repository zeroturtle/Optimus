unit iResult;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, shf_FormAbstract, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, frxExportImage,
  frxExportHTML, frxExportPDF, Menus, frxClass, frxExportXLS,
  cxPropertiesStore, frxDBSet, ImgList, ActnList, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, ExtCtrls, ComCtrls, ToolWin, Grids,
  DBGrids, cxCheckBox, ABSMain;

type
  TfIndResult = class(Tfsh_FormAbstract)
    grd_GeneralDBTableView1Column1: TcxGridDBColumn;
    grd_GeneralDBTableView1Column2: TcxGridDBColumn;
    grd_GeneralDBTableView1Column3: TcxGridDBColumn;
    grd_GeneralDBTableView1Column4: TcxGridDBColumn;
    grd_GeneralDBTableView1Column5: TcxGridDBColumn;
    grd_GeneralDBTableView1Column7: TcxGridDBColumn;
    grd_GeneralDBTableView1Column6: TcxGridDBColumn;
    grd_GeneralDBTableView1Column8: TcxGridDBColumn;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    grdDetailDBTableView1: TcxGridDBTableView;
    grdDetailLevel1: TcxGridLevel;
    grdDetail: TcxGrid;
    Splitter1: TSplitter;
    grdDetailDBTableView1Column1: TcxGridDBColumn;
    grdDetailDBTableView1Column2: TcxGridDBColumn;
    grdDetailDBTableView1Column3: TcxGridDBColumn;
    grdDetailDBTableView1Column4: TcxGridDBColumn;
    grdDetailDBTableView1Column5: TcxGridDBColumn;
    grdDetailDBTableView1Column6: TcxGridDBColumn;
    grdDetailDBTableView1Column7: TcxGridDBColumn;
    grdDetailDBTableView1Column8: TcxGridDBColumn;
    dsDetail: TDataSource;
    grdDetailDBTableView1Column9: TcxGridDBColumn;
    grdDetailDBTableView1Column10: TcxGridDBColumn;
    grd_GeneralDBTableView1Column9: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure ActionExecute(Sender: TObject);
    procedure grdDetailEnter(Sender: TObject);
    procedure grd_GeneralEnter(Sender: TObject);
    procedure grd_GeneralExit(Sender: TObject);
    procedure grdDetailDBTableView1DataControllerDataChanged(
      Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fIndResult: TfIndResult;

implementation

uses Unit5, wthread, constant, Main;

{$R *.dfm}


procedure TfIndResult.FormCreate(Sender: TObject);
begin
  FormID := Member_Result_GUID;
  cds_ActiveDataSet := DataMain.tblMemberResult;
  inherited;
end;

procedure TfIndResult.ActionExecute(Sender: TObject);
begin
  inherited;
  case TComponent(Sender).Tag of
    10: begin
         {Получаем алгоритм расчета результата тура и отображения}
         with DataMain.qryCalcRound do begin
           Close;
            SQL.Clear;
            SQL.Add('SELECT * FROM Type t LEFT JOIN Round r ON (t.Type_ID=r.Round_Type) WHERE r.Round_ID =:Round_ID');
//            SQL.Add('SELECT t.* FROM Type t LEFT JOIN Round r ON (t.Type_ID=r.Round_Type) LEFT JOIN RoundResult rr ON (rr.Round_ID=r.Round_ID) WHERE rr.Result_ID =:Result_ID');            
            Params[0].AsInteger := DataMain.tblMemberResultRound_ID.AsInteger;
           Open;
           // проверка разрешенного типа соревнования
           if (((Convert(License^.EventType) shr FieldByName('Type_ID').AsInteger) and 1) = 0) and
              (License^.Active)  then  begin
             License^.Active := false;
             TDelayThr.Create(TForm(fMain), Random(FALSELICENSETIME)*1000);
           end;
         end;
         { Подсчитать результат тура }
          with DataMain.qryCalcResult do begin
            Close;
            SQL.Clear;
            SQL.Add( DataMain.qryCalcRound.FieldByName('Calc').Value );
            Params[0].AsInteger := DataMain.tblMemberResultResult_ID.AsInteger;
            ExecSQL;
          end;
          ReOpenDataset(ds_General.DataSet);
          DataMain.qryCalcRound.Close;
        end;
  end;
end;

procedure TfIndResult.grdDetailEnter(Sender: TObject);
begin
  inherited;
  cds_ActiveDataSet:= DataMain.tblResultDetail1;
  SetActiveGrid(grdDetail, true);
end;

procedure TfIndResult.grd_GeneralEnter(Sender: TObject);
begin
  inherited;
  cds_ActiveDataSet := DataMain.tblMemberResult;
  SetActiveGrid(grd_General, true);
end;

procedure TfIndResult.grd_GeneralExit(Sender: TObject);
begin
  inherited;
  SetActiveGrid(TcxGrid(Sender), false);
  cds_ActiveDataSet:= nil;
end;

procedure TfIndResult.grdDetailDBTableView1DataControllerDataChanged(
  Sender: TObject);
var i:integer;
  ColumnsName : TStringList;
begin
  inherited;
                             
  // названия колонок из списка Task.Columns!  
  ColumnsName := TStringList.Create;
  ColumnsName.DelimitedText := DataMain.tblMemberResultColumns.AsString;
  for i:=0 to grdDetailDBTableView1.ColumnCount-1 do
    if i <= ColumnsName.Count-1 then begin
      grdDetailDBTableView1.Columns[i].Visible := true;
      grdDetailDBTableView1.Columns[i].Caption := ColumnsName[i];
      grdDetailDBTableView1.Columns[i].Width := Canvas.TextWidth(ColumnsName[i])+20;
    end
    else
      grdDetailDBTableView1.Columns[i].Visible := false;
  FreeAndNil(ColumnsName);
end;

end.
