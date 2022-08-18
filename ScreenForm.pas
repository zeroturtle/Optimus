unit ScreenForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  constant, Dialogs, ExtCtrls, StdCtrls, ComCtrls, DBCtrls, Grids, DBGrids, DB;

type
  TfJudgeConsol = class(TForm)
    pnlDraw: TPanel;
    DBImage1: TDBImage;
    DBImage2: TDBImage;
    DBImage3: TDBImage;
    DBImage4: TDBImage;
    DBImage5: TDBImage;
    DBImage6: TDBImage;
    DBImage7: TDBImage;           
    DBImage8: TDBImage;
    DBImage9: TDBImage;
    grdJumpResult: TDBGrid;
    lbInfo: TLabel;
    pnlResult: TPanel;
    pnlEdit: TPanel;
    pnlMenu: TPanel;
    grdScore: TStringGrid;
    lvMenu: TListView;
    lbMenuCaption: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    StatusBar1: TStatusBar;
    DBText1: TDBText;
    pnlMessage: TPanel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdScoreDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormPaint(Sender: TObject);
    procedure grdJumpResultDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    { Private declarations }
    A: array of String;
  public
    { Public declarations }
    PortNum : Integer;
    PANELSVISIBLE : byte;
  end;
                          
  TPort = record
    KeyBoard: THandle;  // номер USB-устройства
    Name: string;       // имя порта, используется при отображении результата
    Mode: TMode;        // текущий режим порта
    Sequence: Integer;  // текущее значение количества оценок
    IsTrain: boolean;   // стажеры не в счет ?!
    JudgeCall: byte;    // устаревшее, не используется
    PredMode: TMode;
    Form : TForm;   //TfJudgeConsol;
    Scores, PScores :   TArrPoint;  //оценки судейства
{
    case ActionForm: TActionForm of
      Score:(
                IsTrain: boolean;   // стажеры не в счет ?!
                Form : TfJudgeConsol;
                Scores, PScores :   TArrPoint;  //оценки судейства
            );
      Test: (
              CanTest : BOOL;
              Form : TTestForm;
              Answer: array of TKeys; //ответы пульта
            );
}            
  end;

  
var
  fJudgeConsol: TfJudgeConsol;
  PortState : array of TPort; // текущее состояние каждого судейской консоли

implementation

uses Unit5, DMJ;

{$R *.dfm}

procedure TfJudgeConsol.FormCreate(Sender: TObject);
var i:integer;
  ColumnsName : TStringList;
begin
  PANELSVISIBLE := Modes[mIdle].PANELS;
  with grdScore do begin
    ColCount := MAXPOINTS+1;
    RowCount := 3;
  end;
  SetLength(A, 3);// инициализация массива сколько сохранять просмотров

  ColumnsName := TStringList.Create;
  ColumnsName.CommaText := DataMain.tblTask.FieldByName('Columns').AsString;
  // названия колонок из списка Task.Columns!
  for i:=0 to ColumnsName.Count-1 do begin
    grdJumpResult.Columns[i+2].Title.Caption := ColumnsName[i];
    grdJumpResult.Columns[i+2].Width := Canvas.TextWidth(ColumnsName[i])+12;
  end;
  FreeAndNil(ColumnsName);

end;

procedure TfJudgeConsol.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SetLength(A, 0);
end;

procedure TfJudgeConsol.FormShow(Sender: TObject);
var i, L : integer;
begin
//**********************************
// form position
  Top := 0;
  if Screen.MonitorCount > 1 then begin
    L := 0; i := 0;
    repeat L := L + Screen.Monitors[i].Width; inc(i); until i >= FIRSTJUDGEMONITORNUM + PortNum;
    Left := L;
    Width := Screen.Monitors[FIRSTJUDGEMONITORNUM + PortNum].Width;
    Height := Screen.Monitors[FIRSTJUDGEMONITORNUM + PortNum].Height;
  end
  else begin
    Left := 0;
    Width := Screen.Monitors[0].Width;
    Height := Screen.Monitors[0].Height;
  end;
  Caption := Format(CONSOLTITLE,[PortNum, PortState[PortNum].Name]);
end;

//It's "auto-sizing" of a column
procedure AutoSizeCol(Grid: TStringGrid; Column: integer);
var
  i, W, WMax: integer;
begin
  WMax := 20;
  for i := 0 to (Grid.RowCount - 1) do begin
    W := Grid.Canvas.TextWidth(Grid.Cells[Column, i]);
    if W > WMax then
      WMax := W;
  end;
  Grid.ColWidths[Column] := WMax + 5;
end;

procedure TfJudgeConsol.grdJumpResultDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
//  AutoSizeCol(TStringGrid(Sender), DataCol);
  with grdJumpResult do begin
    if DataSource.DataSet.FieldByName('R').AsInteger = 100 then
      Canvas.Brush.Color := clYellow
    else if grdJumpResult.DataSource.DataSet.FieldByName('R').AsInteger > 0 then
      Canvas.Brush.Color := clLime;
    DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfJudgeConsol.grdScoreDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var EditLine: integer;
    H, L, i : Integer;
    WidthVisibleColumns : integer;
begin
//  AutoSizeCol(TStringGrid(Sender), ACol);
  with PortState[PortNum] do
  StatusBar1.Panels[0].Text := Format(RESULTTIME, [Sequence+1,
       (Scores[Sequence].Time-StartTime)/1000000]);
//  StatusBar1.Panels[2].Text := Modes[PortState[PortNum].Mode].Name;

  if PortState[PortNum].Mode = mError then EditLine := 2 else EditLine := 1;
  with Sender as TStringGrid do
    if not ( gdfixed In State ) and (PortState[PortNum].Mode in [mEdit, mError]) then begin

       if ((ACol = PortState[PortNum].Sequence+1) and (ARow = EditLine)) then
         Canvas.Brush.Color := clRed
       else if ((PortState[PortNum].Scores[ACol-1].Point = 0) and (Trim(PortState[PortNum].Scores[ACol-1].Err) = '')
           and (PortState[PortNum].Scores[ACol-1].Time <> 0)) and (ARow = 2) then
             Canvas.Brush.Color := clYellow // непоставленную причину ошибки выделяем желтым
       else Canvas.Brush.Color := clSilver;
      Canvas.FillRect(Rect);
      if Length(Cells[ACol, ARow]) > 0 then
        with Canvas do begin
          Explode(A, '|', Cells[ACol, ARow]);

          L := Rect.Right - Rect.Left;
          Font.Color := clBlack;
          Font.Style := [fsBold];
          Font.Size := 18;
          TextOut(Rect.Left + (L - TextWidth(A[0])) div 2, Rect.Top, A[0]); // Оценка текущего просмотра
          H := TextHeight(A[0]);

          if A[0] <> A[1] then Brush.Color := clYellow;
          Font.Style := [];
          Font.Size := 12;
          TextOut(Rect.Left, Rect.Top+H, A[1]); // Оценка предыдущего просмотра
        end;
    end;

  with grdScore do
    if PortState[PortNum].Sequence < LeftCol then  //влево
      LeftCol := PortState[PortNum].Sequence + 1
    else begin
      WidthVisibleColumns := ColWidths[0];
      for i := LeftCol to PortState[PortNum].Sequence + 2 do
        inc(WidthVisibleColumns, ColWidths[I]);
      if WidthVisibleColumns > GridWidth then
        LeftCol := PortState[PortNum].Sequence + 2 - VisibleColCount;      
    end;
end;

procedure TfJudgeConsol.FormPaint(Sender: TObject);
var i, n : integer;
    W, H, R : integer;
    Ratio : real;
    IMG : TPicture;
begin
// Фоновая картинка
  Canvas.StretchDraw(rect(8, 8, ClientWidth - 8, ClientHeight - 8), BackgoundPic);

// отобразить панели согласно текущего режима.
  if VIEWSCREEN then  PANELSVISIBLE := Modes[PortState[PortNum].Mode].PANELS;
  lbInfo.Visible    := (PANELSVISIBLE and JC_INFO) <> 0;
  pnlResult.Visible := (PANELSVISIBLE and JC_RESULT) <> 0;
  pnlEdit.Visible   := (PANELSVISIBLE and JC_EDITOR) <> 0;
  pnlDraw.Visible   := ((PANELSVISIBLE and JC_DRAW) <> 0); //and (not VIEWSCREEN);

//********************************************
// menu panel
  pnlMenu.Left := Width - pnlMenu.Width - 10;
  pnlMenu.Top := lbInfo.Height;

//********************************************
// edit panel
  if pnlEdit.Visible then begin
    pnlEdit.Width := Width;
    pnlEdit.Top := lbInfo.Height + 10;
    grdScore.Invalidate;
  end;


//********************************************
// Result panel
  if pnlResult.Visible then begin
    pnlResult.Width := Width;
    pnlResult.Top := lbInfo.Height + 10;
    grdJumpResult.Height := 30 * (MAXPORTS + 2 ); // количество строк результатов
  end;

//********************************************
// draw panel
  if pnlDraw.Visible then begin
    pnlDraw.Width := Width;
    if pnlEdit.Visible then
      pnlDraw.Top := lbInfo.Height + pnlEdit.Height + 10
    else
      pnlDraw.Top := lbInfo.Height + 10;
//    pnlDraw.Height := Height - pnlDraw.Top - Label4.Height*2;
  end;

//********************************************
// message panel
  with pnlMessage do begin
    case PortState[PortNum].Mode of
      mFalse:
        if (abs(StartTime-PortState[PortNum].Scores[0].Time)/1000 > CONCENSUSTIME)then begin
           PANELSVISIBLE := PANELSVISIBLE or JC_MESSAGE;
           Caption := Format(FALSESTARTMSG,['',PortNum+1,PortState[PortNum].Name, (PortState[PortNum].Scores[0].Time-StartTime)/1000]);
        end;
      mConfirm:
        if (CurrentMode <> mConfirm) then begin
           PANELSVISIBLE := PANELSVISIBLE or JC_MESSAGE;
           Caption := CONFIRMMSG;
        end;
      else Visible := false;
    end;
    Visible := (PANELSVISIBLE and JC_MESSAGE) <> 0;
  end;

//**********************
  // подогнать размер картинок под размер экрана
  n := DataMain.MemPool.FieldByName('CountPic').AsInteger;

  IMG := TPicture.Create;
  IMG.Assign(TDBImage(FindComponent('DBImage1')).Picture);
  if n > 0 then ratio := IMG.Width / IMG.Height
  else ratio := 1;
  IMG.Free;

  if n > 0 then W := pnlDraw.Width div n;
  if W - 23 > pnlDraw.Height then
    pnlDraw.Height := Height - pnlDraw.Top
  else pnlDraw.Height := W + 23;

  if Round(W / ratio) > pnlDraw.Height then begin
    H := pnlDraw.Height;
    W := Round(H * ratio);
    R := (pnlDraw.Width - W * n) div (n + 1);
  end
  else begin
    H := Round(W / ratio);
    R := 0;
  end;

  for i := 1 to 9 do
    with TDBImage(FindComponent('DBImage'+ IntToStr(i))) do
      if i > n then Visible := false
      else begin
        Height := H;
        Width := W;
        Left := W * (i - 1) + R * i;
        Visible := true;
      end;
//***********************

  // подчеркнем нужную картинку
{  if pnlDraw.Visible then begin
    c := TControlCanvas.Create;
    c.Control := pnlDraw;
    c.Pen.Color := clYellow;
    c.Pen.Width := 5;
    c.MoveTo(DBImage1.Width * (PortState[PortNum].Sequence mod 9), DBImage1.Top + DBImage1.Height + 10);
    c.LineTo(DBImage1.Width * ((PortState[PortNum].Sequence + 1) mod 9), DBImage1.Top + DBImage1.Height + 10);
    c.Free;
  end;}
end;

end.


