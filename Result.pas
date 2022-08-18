unit Result;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, shf_FormAbstract, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, frxClass, frxDBSet, ImgList,
  ActnList, Menus, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  StdCtrls, ExtCtrls, ComCtrls, ToolWin, cxLookAndFeels,
  cxGridBandedTableView, cxSpinEdit, cxCheckBox, cxPropertiesStore,
  frxExportXLS, frxExportPDF, cxButtonEdit, frxExportHTML, frxExportImage;

type
  TfResult = class(Tfsh_FormAbstract)
    Splitter1: TSplitter;
    grdDetailDBTableView1: TcxGridDBTableView;
    grdDetail: TcxGrid;
    dsDetail: TDataSource;
    grd_GeneralDBTableView1Column4: TcxGridDBColumn;
    grd_GeneralDBTableView1Column5: TcxGridDBColumn;
    grdDetailDBTableView1Column1: TcxGridDBColumn;
    grdDetailDBTableView1Column2: TcxGridDBColumn;
    grd_GeneralDBTableView1Column2: TcxGridDBColumn;
    grdDetailDBTableView1Column3: TcxGridDBColumn;
    grdDetailDBTableView1Column4: TcxGridDBColumn;
    grdDetailDBTableView1Column5: TcxGridDBColumn;
    grdDetailDBTableView1Column6: TcxGridDBColumn;
    grdDetailDBTableView1Column7: TcxGridDBColumn;
    grdDetailDBTableView1Column8: TcxGridDBColumn;
    grdDetailDBTableView1Column9: TcxGridDBColumn;
    grdDetailDBTableView1Column10: TcxGridDBColumn;
    grdDetailDBTableView1Column11: TcxGridDBColumn;
    grdDetailDBTableView1Column12: TcxGridDBColumn;
    grdDetailBandedTableView1: TcxGridBandedTableView;
    grdDetailBandedTableView2: TcxGridBandedTableView;
    grdDetailLevel1: TcxGridLevel;
    ToolButton1: TToolButton;
    grdDetailDBTableView1Column13: TcxGridDBColumn;
    grdDetailDBTableView1Column14: TcxGridDBColumn;
    grdDetailDBTableView1Column15: TcxGridDBColumn;
    grdDetailDBTableView1Column16: TcxGridDBColumn;
    grdDetailDBTableView1Column17: TcxGridDBColumn;
    grdDetailDBTableView1Column18: TcxGridDBColumn;
    grdDetailDBTableView1Column19: TcxGridDBColumn;
    grdDetailDBTableView1Column20: TcxGridDBColumn;
    grdDetailDBTableView1Column21: TcxGridDBColumn;
    grdDetailDBTableView1Column22: TcxGridDBColumn;
    grdDetailDBTableView1Column23: TcxGridDBColumn;
    grdDetailDBTableView1Column24: TcxGridDBColumn;
    grdDetailDBTableView1Column25: TcxGridDBColumn;
    grdDetailDBTableView1Column26: TcxGridDBColumn;
    grdDetailDBTableView1Column27: TcxGridDBColumn;
    grdDetailDBTableView1Column28: TcxGridDBColumn;
    grdDetailDBTableView1Column29: TcxGridDBColumn;
    grdDetailDBTableView1Column30: TcxGridDBColumn;
    grdDetailDBTableView1Column31: TcxGridDBColumn;
    grdDetailDBTableView1Column32: TcxGridDBColumn;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    grd_GeneralDBTableView1Column3: TcxGridDBColumn;
    grd_GeneralDBTableView1Column6: TcxGridDBColumn;
    grd_GeneralDBTableView1Column7: TcxGridDBColumn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    grd_GeneralDBTableView1Column8: TcxGridDBColumn;
    grdDetailDBTableView1Column33: TcxGridDBColumn;
    grd_GeneralDBTableView1Column1: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure grdDetailEnter(Sender: TObject);
    procedure grd_GeneralExit(Sender: TObject);
    procedure grd_GeneralEnter(Sender: TObject);
    procedure ActionExecute(Sender: TObject);
    procedure grdDetailDBTableView1DataControllerDataChanged(
      Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fResult: TfResult;

implementation

uses Unit5, Comps, wthread, constant, Main;

{$R *.dfm}

procedure TfResult.FormCreate(Sender: TObject);
begin
  FormID := Result_GUID;
  cds_ActiveDataSet := DataMain.tblTeamRound;

  inherited;  
end;

procedure TfResult.grdDetailEnter(Sender: TObject);
begin
  inherited;
  cds_ActiveDataSet:= DataMain.tblResultDetail;
  SetActiveGrid(grdDetail, true);
end;

procedure TfResult.grd_GeneralExit(Sender: TObject);
begin
  inherited;
  SetActiveGrid(TcxGrid(Sender), false);
  cds_ActiveDataSet:= nil;
end;

procedure TfResult.grd_GeneralEnter(Sender: TObject);
begin
  inherited;
  cds_ActiveDataSet := DataMain.tblTeamRound;
  SetActiveGrid(grd_General, true);
end;

procedure TfResult.ActionExecute(Sender: TObject);
begin
  inherited;
  case TComponent(Sender).Tag of
    10: begin
         {Получаем алгоритм расчета результата тура и отображения}
         with DataMain.qryCalcRound do begin
           Close;
            SQL.Clear;
            SQL.Add('SELECT t.* FROM Type t LEFT JOIN Round r ON (t.Type_ID=r.Round_Type) LEFT JOIN RoundResult rr ON (rr.Round_ID=r.Round_ID) WHERE rr.Result_ID =:Result_ID');
            Params[0].AsInteger := DataMain.tblTeamRoundResult_ID.AsInteger;
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
            SQL.DelimitedText := StringReplace(SQL.DelimitedText,'MEMORY','',[rfReplaceAll,rfIgnoreCase]);
            Params[0].AsInteger := DataMain.tblTeamRoundResult_ID.AsInteger;
            ExecSQL;
          end;
          ReOpenDataset(ds_General.DataSet);
          DataMain.qryCalcRound.Close;
        end;
  end;
end;

procedure TfResult.grdDetailDBTableView1DataControllerDataChanged(
  Sender: TObject);
var i:integer;
  ColumnsName : TStringList;
begin
  inherited;

  // названия колонок из списка Task.Columns!
  ColumnsName := TStringList.Create;
  ColumnsName.CommaText := DataMain.tblTeamRoundColumns.AsString;
  for i:=0 to grdDetailDBTableView1.ColumnCount-1 do
    if i <= ColumnsName.Count-1 then begin
      grdDetailDBTableView1.Columns[i].Visible := true;    
      grdDetailDBTableView1.Columns[i+2].Caption := ColumnsName[i];
      grdDetailDBTableView1.Columns[i+2].Width := Canvas.TextWidth(ColumnsName[i])+20;
    end
    else
      grdDetailDBTableView1.Columns[i].Visible := false;
  FreeAndNil(ColumnsName);
end;

end.
