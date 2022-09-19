unit Calc;

interface
uses Classes, SysUtils;

type
  TSQLFunc = function : TStringList;
var
  AProc : array[0..7] of TSQLFunc;

implementation

uses constant, Unit5;


// протокол командного зачета
function ProtocolTeam: TStringList;
var i, k : integer;
    s : string[5]; c : char;
begin
(*
  try
    k := DataMain.tblCompetitionRounds.Value;
    if DataMain.tblCompetitionProtoSort.Value then begin s:= 'desc'; c := '>' end else begin s := 'asc'; c := '<' end;

    Result := TStringList.Create;
    with Result do begin
      {------------------------}
      Add('SELECT TOTAL, Team_ID, Guest INTO MEMORY Rank FROM SELECT sum(Scores) AS TOTAL, Team_ID, t.Guest FROM RoundResult rr, Team t WHERE rr.Team_ID=t.Team_ID AND rr.Sign=true AND rr.Competition_ID=:Competition_ID GROUP BY Team_ID, Guest ORDER BY 1 desc;');
      {------------------------}
      Add('SELECT DISTINCT CASE WHEN Guest=False THEN (SELECT count(r1.TOTAL)+1 FROM MEMORY Rank r1 WHERE r1.TOTAL'+c+'r2.Total AND Guest=False) ELSE '''' END AS RANK, p.Name,p.Number,p.Guest,');
      for i := 1 to k do Add(Format('p.R%d,',[i]));
      Add('p.Club_Name, p.average, p.TOTAL FROM MEMORY Rank r2 LEFT JOIN');
      Add('(SELECT t.Team_ID, t.Name, t.Number, t.Guest, c.Club_Name');
      for i := 1 to k do
        Add(Format(', sum(CASE WHEN r.Round_Num=%d THEN Scores END) AS R%d',[i,i]));
      Add(Format(',sum(CASE WHEN r.Round_Num <= %d THEN Scores ELSE 0 END) AS TOTAL',[k]));
      Add(Format(', round(sum(CASE WHEN r.Round_Num <= %d THEN Scores ELSE 0 END)/ count(rr.Round_ID) ,2) AS average',[k]));
//      if DM.tblCompetitionProtoSort.Value then Add(', max(Scores) AS BEST') else Add(', min(Scores) AS BEST');
      Add('FROM RoundResult rr, Team t, Round r, Club c');
      Add('WHERE rr.Sign=true AND rr.Team_ID=t.Team_ID AND r.Round_ID=rr.Round_ID AND r.Disabled=false AND c.Club_ID=t.Club_ID AND t.Competition_ID=:Competition_ID');
      Add('GROUP BY Name, t.Number, t.Guest, t.Team_ID, c.Club_Name) p  ON (p.TOTAL = r2.TOTAL AND r2.Team_ID=p.Team_ID)');
      Add(Format('ORDER BY Total %s',[s]));
      for i:= k downto 1 do
        Add(Format(',R%d %s',[i,s]));
      Add(',t.Guest, t.Number;');
//      SaveToFile('proto.sql');      
    end;
  finally
  end;
  *)
end;

// протокол индивидуального зачета
function ProtocolPersonal: TStringList;
var i, k : integer;
    s : string[5]; c : char;
begin
(*
  try
    k := DataMain.tblCompetitionRounds.Value;
    if DataMain.tblCompetitionProtoSort.Value then begin s:= 'desc'; c := '>' end else begin s := 'asc'; c := '<' end;

    Result := TStringList.Create;
    with Result do begin
      {------------------------}
      Add('SELECT TOTAL, Team_ID, Guest INTO MEMORY Rank FROM SELECT sum(Scores) AS TOTAL, Team_ID, t.Guest FROM RoundResult rr, Team t WHERE rr.Team_ID=t.Team_ID AND rr.Sign=true AND rr.Competition_ID=:Competition_ID GROUP BY Team_ID, Guest ORDER BY 1 desc;');
      {------------------------}
      Add('SELECT DISTINCT CASE WHEN Guest=False THEN (SELECT count(r1.TOTAL)+1 FROM MEMORY Rank r1 WHERE r1.TOTAL'+c+'r2.Total AND Guest=False) ELSE '''' END AS RANK,');
      for i := 1 to k do Add(Format('p.R%d,',[i]));
      Add('pe.Name,ro.Role_Name, p.Role_ID, p.Club_Name, p.TEAM_NAME, p.Number, p.Guest, p.average, p.TOTAL FROM MEMORY Rank r2 LEFT JOIN');
      Add('(SELECT pe.Name, t.Team_ID, t.Name AS TEAM_NAME, t.Number, t.Guest, ro.Role_Name, ro.Role_ID, c.Club_Name');
      for i := 1 to k do
        Add(Format(',sum(CASE WHEN r.Round_Num=%d THEN Scores END) AS R%d',[i,i]));
      Add(Format(',sum(CASE WHEN r.Round_Num <= %d THEN Scores ELSE 0 END) AS TOTAL',[k]));
      Add(Format(', round(sum(CASE WHEN r.Round_Num <= %d THEN Scores ELSE 0 END)/ count(rr.Round_ID) ,2) AS average',[k]));
      Add('FROM RoundResult rr, Team t, Round r, Club c, member m, People pe, Roles ro');
      Add('WHERE t.Team_ID = m.Team_ID AND pe.People_ID = m.People_ID AND ro.Role_ID=m.Role_ID');
      Add('AND rr.Sign=true AND rr.Team_ID=t.Team_ID AND r.Round_ID=rr.Round_ID AND r.Disabled=false AND c.Club_ID=t.Club_ID AND t.Competition_ID=:Competition_ID');
      Add('GROUP BY pe.Name, t.Team_ID, t.Name, t.Number, t.Guest, ro.Role_Name, ro.Role_ID, c.Club_Name) p  ON (p.TOTAL = r2.TOTAL AND r2.Team_ID=p.Team_ID)');
      Add(Format('ORDER BY Total %s',[s]));
      for i:= k downto 1 do
        Add(Format(',R%d %s',[i,s]));
      Add(',t.Guest, t.Number, ro.Role_ID;');
    SaveToFile('protoInd.sql');
    end
  finally
  end;
*)
end;


// протокол судей
function JudgesView: TStringList;
var i, k : integer;
begin
(*  try
    Result := TStringList.Create;
    with Result do begin
      Add('SELECT j.sort, p.Name, p.Address, p.Birthday, p.Remark, p.Category, p.Certificate, j.Role_ID, r.Role_Name, j.IsTrainee');
      k := DataMain.tblCompetitionRounds.Value;
      for i := 1 to k do
        Add(Format(',sum((CASE WHEN r.Round_Num=''%d'' THEN 1 ELSE 0 END)) as R%d',[i,i]));
      Add(', count(rd.Judge_ID) cnt, j.Rating');
      Add('FROM ResultDetail rd, Judges j, People p, Roles r');
      Add('WHERE r.Role_ID=j.Role_ID');
      Add('AND j.Judge_ID=rd.Judge_ID AND p.People_ID=j.People_ID');
      Add('AND j.Competition_ID=:Competition_ID');
      Add('GROUP BY j.sort, p.Name, p.Address, p.Birthday, p.Remark, p.Category,');
      Add(' p.Certificate, j.Role_ID, r.Role_Name, j.Rating');
      Add('ORDER BY 1');
    SaveToFile('judges.sql');
    end
  finally
  end;
*)
end;

function PersonalVedomost: TStringList;
var i : integer;
begin
(*  try
     {ѕолучаем количество оценок тура}
      with DataMain.qryCalcRound do begin
         Close;
          SQL.Clear;
          SQL.Add('SELECT max(Length(MASK)) AS MAXPOINTS FROM Type t LEFT JOIN Round r ON (t.Type_ID=r.Round_Type) WHERE r.Competition_ID=:Competition_ID');
          Params[0].AsInteger := DataMain.tblCompetition.FieldByName('Competition_ID').AsInteger;
          Open;
          MAXPOINTS := FieldByName('MAXPOINTS').AsInteger;
      end;

      Result := TStringList.Create;
      with Result do begin
        Add('SELECT p.Name, r.Round_Num');
        for i := 1 to MAXPOINTS do
          Add(Format(',CASE WHEN avg(coalesce(P%d,0))>.5 THEN 1 ELSE CASE WHEN avg(coalesce(P%d,0))<-.5 THEN %d ELSE CASE WHEN sum(T%d)>0 THEN 0 ELSE NULL END END END AS R%d',[i,i,MAXPENALTY,i,i]));
        Add(',rr.Scores FROM Team t, member m, People p, resultdetail rd, RoundResult rr, Round r');
        Add('WHERE t.Team_ID = m.Team_ID AND p.People_ID = m.People_ID');
        Add('AND IsTrainee=false AND rd.Result_ID=rr.Result_ID AND r.Round_ID=rr.Round_ID AND rr.Team_ID=t.Team_ID');
        Add('AND rr.Sign=true AND t.Competition_ID=:Competition_ID');
        Add('GROUP BY p.Name, r.Round_Num, rr.Scores');
    SaveToFile('persved.sql');        
      end
    finally
//      SQLstring.Free;
    end;
*)
end;

function ProtocolRound: TStringList;
var i : integer;
begin
(*  try
     {ѕолучаем количество оценок тура}
      with DataMain.qryCalcRound do begin
         Close;
          SQL.Clear;
          SQL.Add('SELECT max(Length(MASK)) AS MAXPOINTS FROM Type t LEFT JOIN Round r ON (t.Type_ID=r.Round_Type) WHERE r.Competition_ID=:Competition_ID');
          Params[0].AsInteger := DataMain.tblCompetition.FieldByName('Competition_ID').AsInteger;
          Open;
          MAXPOINTS := FieldByName('MAXPOINTS').AsInteger;
      end;

    Result := TStringList.Create;
    with Result do begin
      Add('SELECT Round_Num, Pool_Sequence_Code, t.Name, t.Number, Scores, Comment');
      for i := 1 to MAXPOINTS do
        Add(Format(',(CASE WHEN avg(coalesce(P%d,0))>.5 THEN 1 ELSE CASE WHEN avg(coalesce(P%d,0))<-.5 THEN %d ELSE CASE WHEN sum(T%d)>0 THEN 0 ELSE NULL END END END) AS R%d',[i,i,MAXPENALTY,i,i]));
      Add('FROM ResultDetail rd, RoundResult rr, Team t, Round r,');
      Add('(SELECT count(Port) as QTY, r1.Round_ID');
      Add('FROM Judges j1 LEFT JOIN Round r1 ON (j1.Competition_ID=r1.Competition_ID)');
      Add('WHERE Port is not null AND (IsTrainee=false OR IsTrainee is null)');
      Add('GROUP BY Round_ID) j');
      Add('WHERE (IsTrainee=false OR IsTrainee is null)');
      Add('AND rd.Result_ID=rr.Result_ID AND rr.Team_ID=t.Team_ID AND r.Round_ID=rr.Round_ID');
      Add('AND j.Round_ID=rr.Round_ID AND rr.Competition_ID=:Competition_ID');
      Add('GROUP BY Round_Num, Pool_Sequence_Code, t.Name, t.Number, Scores, Comment');
      Add('ORDER BY Round_Num, t.Number');
    SaveToFile('protoround.sql');
    end
  finally
  end; *)
end;


function Shilders: TStringList;
begin
{  try
    Result := TStringList.Create;
    with Result do begin
      Add('SELECT t.Number, t.Name as Team_Name, r.Round_Num, c.Name as Competition_Name');
      Add('FROM Team t, Round r, Competition c');
      Add('WHERE t.Competition_ID=r.Competition_ID AND c.Competition_ID=t.Competition_ID');
      Add('AND t.Competition_ID=:Competition_ID');
    SaveToFile('shilds.sql');
    end
  finally
  end;    }
end;

// расчет рейтинга судьи
function JudgeRating: TStringList;
var i : integer;
    s : string;
begin
    try
     {ѕолучаем количество оценок тура}
      with DataMain.qryCalcRound do begin
         Close;
          SQL.Clear;
          SQL.Add('SELECT max(Length(MASK)) AS MAXPOINTS FROM Type t LEFT JOIN Round r ON (t.Type_ID=r.Round_Type) WHERE r.Competition_ID=:Competition_ID');
          Params[0].AsInteger := DataMain.tblCompetition.FieldByName('Competition_ID').AsInteger;
          Open;
          MAXPOINTS := FieldByName('MAXPOINTS').AsInteger;
      end;

  // Ёто SQL-запрос дл€ рейтинга судей по соревнованию
    Result := TStringList.Create;
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
      // сколько оценок поставил судь€
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
end;


function RoundResult: TStringList;
begin
  try
    Result := TStringList.Create;
    with Result do begin
      with DataMain.qryCalcResult do begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM Type t LEFT JOIN Round r ON (t.Type_ID=r.Round_Type) LEFT JOIN RoundResult rr ON (rr.Round_ID=r.Round_ID) WHERE rr.Result_ID =:Result_ID');
        Params[0].AsInteger := DataMain.tblTeamRoundResult_ID.AsInteger;
        Open;
        Add( FieldByName('Points').AsString );
        DelimitedText := StringReplace(DelimitedText,'MEMORY','',[rfReplaceAll,rfIgnoreCase]);
        Close;
      end;
    end
  finally
  end;
end;


begin
  AProc[0] := nil;
  AProc[1] := nil;
  AProc[2] := JudgeRating;
  AProc[3] := nil;
  AProc[4] := nil;
  AProc[5] := nil;
  AProc[6] := nil;
  AProc[7] := RoundResult;
end.
