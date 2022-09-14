unit Judges;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, shf_FormAbstract, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, Menus, frxClass,
  frxExportXLS, cxPropertiesStore, frxDBSet, ImgList, ActnList,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  StdCtrls, ExtCtrls, ComCtrls, ToolWin, frxExportPDF, frxExportImage,
  frxExportHTML;

type
  TfJudge = class(Tfsh_FormAbstract)
    grd_GeneralDBTableView1Column1: TcxGridDBColumn;
    grd_GeneralDBTableView1Column2: TcxGridDBColumn;
    grd_GeneralDBTableView1Column3: TcxGridDBColumn;
    grd_GeneralDBTableView1Column4: TcxGridDBColumn;
    grd_GeneralDBTableView1Column5: TcxGridDBColumn;
    grd_GeneralDBTableView1Column6: TcxGridDBColumn;
    grd_GeneralDBTableView1Column8: TcxGridDBColumn;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    act_Rating: TAction;
    grd_GeneralDBTableView1Column7: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure ActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fJudge: TfJudge;

implementation

uses Unit5, constant;

{$R *.dfm}

procedure TfJudge.FormCreate(Sender: TObject);
begin
  FormID := Judge_GUID;
  cds_ActiveDataSet := DataMain.tblJudge;
  inherited;
end;


// расчет рейтинга судьи
function JudgeRating: TStringList;
var i : integer;
    s : string;
begin
(*
  Result := TStringList.Create;
    try
     {Получаем количество оценок тура}
      with DataMain.qryCalcRound do begin
         Close;
          SQL.Clear;
          SQL.Add('SELECT max(Length(MASK)) AS MAXPOINTS FROM Type t LEFT JOIN Round r ON (t.Type_ID=r.Round_Type) WHERE r.Competition_ID=:Competition_ID');
          Params[0].AsInteger := DataMain.tblCompetition.FieldByName('Competition_ID').AsInteger;
          Open;
          MAXPOINTS := FieldByName('MAXPOINTS').AsInteger;
      end;

  // Это SQL-запрос для рейтинга судей по соревнованию
    with Result do begin
      Add('SELECT A.Judge_ID, AVG(ROUND(');
      for i := 1 to MAXPOINTS do begin
        s := '';
        s := s + Format('CASE WHEN (A.P%d=B.R%d) THEN 1 ELSE 0 END',[i,i]);
        if i < MAXPOINTS then s := s + ' + '
        else s := s + ',0) / C.Num)*100 AS Rating';
        Add(s);
      end;
      Add('FROM (SELECT j.Judge_ID, p.Name, rd.Result_ID, rd.Monitor');
      s := '';
      for i := 1 to MAXPOINTS do
         s := s + Format(', P%d',[i]);
      Add(s);
      Add('FROM resultdetail rd, Judges j, People p');
      Add('WHERE j.People_ID=p.People_ID AND rd.Judge_ID=j.Judge_ID) A,');
      //расчет итоговой оценки каждой фигуры тура
      Add('(SELECT rr.Result_ID');
      for i := 1 to MAXPOINTS do
        Add(Format(',(CASE WHEN avg(coalesce(P%d,0))>=.5 THEN 1 ELSE CASE WHEN avg(coalesce(P%d,0))<-.5 THEN %d ELSE CASE WHEN sum(T%d)>0 THEN 0 ELSE NULL END END END) AS R%d',[i,i,MAXPENALTY,i,i]));
      Add('FROM ResultDetail rd, RoundResult rr, Team t, Round r,');
      Add('(SELECT count(Port) as QTY, r1.Round_ID');
      Add('FROM Judges j1 LEFT JOIN Round r1 ON (j1.Competition_ID=r1.Competition_ID)');
      Add('WHERE Port is not null AND (IsTrainee=false OR IsTrainee is null)');
      Add('GROUP BY Round_ID) j');
      Add('WHERE (IsTrainee=false OR IsTrainee is null)');
      Add('AND rd.Result_ID=rr.Result_ID AND rr.Team_ID=t.Team_ID AND r.Round_ID=rr.Round_ID');
      Add('AND j.Round_ID=rr.Round_ID');
      Add('group by  rr.Result_ID)B,');
      // сколько оценок поставил судья
      Add('(SELECT Result_ID, Monitor, max(Sequence)+1 AS Num FROM ViewDetail GROUP BY Result_ID, Monitor) C,');
      // все туры команд
      Add('(SELECT Result_ID, Template FROM RoundResult WHERE Competition_ID=:Competition_ID) D');
      Add('WHERE A.Result_ID = B.Result_ID AND A.Result_ID = C.Result_ID AND A.Monitor = C.Monitor AND A.Result_ID = case when D.Template is null then D.Round_ID else D.Template end');
      Add('GROUP BY A.Judge_ID');
    SaveToFile('judgerating.sql');
    end
    finally
//      SQLstring.Free;
    end;
*)
end;

procedure TfJudge.ActionExecute(Sender: TObject);
begin
  inherited;
  case TComponent(Sender).Tag of
    11: begin
      // пересчитать рейтинг судьи
{      with DataMain.qryCalcResult do begin
        Close;
        SQL.Assign(JudgeRating); //JudgeRating;
        Params[0].AsInteger := DataMain.tblCompetitionCompetition_ID.Value;
        Open;
        DataMain.tblJudge.DisableControls;
        DataMain.tblJudge.First;
        while not EOF do begin
          if DataMain.tblJudge.Locate('Judge_ID',FieldByName('Judge_ID').AsInteger,[]) then begin
            DataMain.tblJudge.Edit;
            DataMain.tblJudgeRating.Value := FieldByName('Rating').AsFloat;
            DataMain.tblJudge.Post;
          end;
          Next;
        end;
        DataMain.tblJudge.EnableControls;
      end;
      ReOpenDataset(ds_General.DataSet);
}
    end;
  end;
end;

end.
