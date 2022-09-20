unit JCtrl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, FFBasePlay, FFLog, FFBaseComponent, FFPlay,
  Math, SyncObjs, CnRawInput, ABSTypes, ABSMain, DB, cxLookAndFeelPainters,
  cxControls, cxContainer, cxEdit, cxGroupBox, cxCheckGroup, FFUtils, libavformat,
  constant, Grids, DBGrids, ToolWin, Buttons, ScreenForm, DBCtrls,
  RxDualList, RxNotify, DirWatch, IdBaseComponent, IdComponent, IdUDPBase,
  IdUDPServer, IdTrivialFTPServer, RxSplit, Menus;

type
  TTextPanel = class(TPanel);
  TInfoThr = class(TThread)
  private
    O : TTextPanel;
    DelayTime : Integer;
    procedure Hide;
  protected
    procedure Execute; override;
  public
    constructor Create(F: TForm; Msg : String);
  end;

  TUndoPoint = record
    Position : integer; // позиция корректировки
    Point : TPoint;
    Chain: BOOL; // главное или техническое (последовательное) изменение
  end;

  TfJudgeCtrl = class(TForm)
    cbSpeed: TCheckBox;
    GroupBox3: TGroupBox;
    Timer1: TTimer;
    lbPoint1: TLabel;
    lbPoint2: TLabel;
    lbPoint3: TLabel;
    lbPoint4: TLabel;
    lbPoint5: TLabel;
    FFLogger1: TFFLogger;
    FFPlayer: TFFPlayer;
    grdList: TDBGrid;
    pnlPerview: TPanel;
    pnlOptions: TPanel;
    lbTime: TLabel;
    Label2: TLabel;
    lbView: TLabel;
    btnScoringFirst: TBitBtn;
    btnPlay: TBitBtn;
    btnEdit: TBitBtn;
    btnSave: TBitBtn;
    grdTime: TDBGrid;
    grdError: TDBGrid;
    grdScore: TDBGrid;
    DBText1: TDBText;
    Panel3: TPanel;
    Button1: TButton;
    Button2: TButton;
    dlDivePool: TDualListDialog;
    pnlDraw: TPanel;
    Label4: TLabel;
    DBImage1: TDBImage;
    DBImage2: TDBImage;
    DBImage3: TDBImage;
    DBImage4: TDBImage;
    DBImage5: TDBImage;
    DBImage6: TDBImage;
    DBImage7: TDBImage;
    DBImage8: TDBImage;
    DBImage9: TDBImage;
    btnPause: TBitBtn;
    chkVerticalFlip: TCheckBox;
    DirectoryWatch1: TDirectoryWatch;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel1: TPanel;
    Label7: TLabel;
    StartTimerPorts: TComboBox;
    btnScoringMore: TBitBtn;
    Splitter1: TSplitter;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label8: TLabel;
    Label9: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FFPlayerVideoHook(Sender: TObject; ABitmap: TBitmap;
      const APTS: Int64; var AUpdate: Boolean);
    procedure FFPlayerPosition(Sender: TObject; const APTS: Int64);
    procedure FFPlayerState(Sender: TObject; AState: TPlayState);
    procedure FFPlayerFileOpen(Sender: TObject; const ADuration: Int64;
      AFrameWidth, AFrameHeight: Integer; var AScreenWidth,
      AScreenHeight: Integer);
    procedure FFLogger1Log(Sender: TObject; AThreadID: Integer;
      ALogLevel: TLogLevel; const ALogMsg: String);
    procedure Timer1Timer(Sender: TObject);
    procedure StartTimerPortsClick(Sender: TObject);
    procedure btnCaptureClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnScoringFirstClick(Sender: TObject);
    procedure btnPlayClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnPauseClick(Sender: TObject);
    procedure chkVerticalFlipClick(Sender: TObject);
    procedure DirectoryWatch1Change(Sender: TObject);
    procedure btnScoringMoreClick(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
    FDuration: Int64;
    FTrackChanging: Boolean;
    FScreenControl: TWinControl;
    FLock: TCriticalSection;
    FRect: TRect;
    DesktopCanvas: TCanvas;
    procedure HighLight(Scan: TPoint; ScreenOptions: TScreenOption = soPortNum);
    procedure ModeAction(AMode: TMode);
    procedure LabelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MakeBreakpoint;
    procedure ClearBreakpoint;
    function GetScreenHandle: HWND;
  public
    { Public declarations }
    FormID: TGUID;
    FBrightness: Integer;
    FContrast: Integer;
    FSaturation: Integer;
    FHue: Integer;
  end;

  PErrorRec = ^TErrorRec;
  TErrorRec = record
     ID : integer;
     Code: string[6];
     NV: boolean;
  end;

  TIntObj = class
    private
      FI: Int64;
    public
      property I: Int64 Read FI;
      constructor Create(IValue:Int64);
  end;
var
  fJudgeCtrl: TfJudgeCtrl;


procedure CodeAction(Code: TPoint); forward;
function GetScanCode(Port:Integer; Key: Cardinal): TPoint; forward;
procedure ChangeMode(Port: Integer; AMode: TMode);

implementation

uses wthread, Unit5, Main, MyUtils, ShellAPI, Settings, DMJ, Variants;

{$R *.dfm}

var Part :BOOL; //показывает просматр фрагмента или полный

{$IF Defined(VER140) OR Defined(VER150)} // Delphi 6, 7
type
  TCriticalSectionEx = class(TCriticalSection)
  public
    function TryEnter: Boolean;
  end;

function TCriticalSectionEx.TryEnter: Boolean;
begin
  Result := TryEnterCriticalSection(FSection);
end;
{$IFEND}

var
  Undo : array of array of TUndoPoint;// изменения внесенные редактором
  Log : TStrings;               // журнал работы программы

  MAXTIME : byte;               // Максимальное рабочее времяю, s
  POINTMASK : string;           // Маска для результатов подсчета результата
  ROUNDID : Integer;            // ID раунда команды
  TeamName, RoundName, VideoFileName: string;
  ErrorList : TStrings;
  View: byte; // номер просмотра
  ViewID : Cardinal;
  StartPort : byte;       // номер консоли для старта рабочего времени
  CurrentVideoPosition : Int64;
  VideoPartStart, VideoPartEnd : Int64;
  InJudging : BOOL;          // отображать отсчет таймера
  DelayTime : integer;

  COLUMNSNAME : TStringList;
  err : PErrorRec;
  NVErrorNumber: string[6];  // номер ошибки NV
  BeepCount : byte;

  
// процедура перестановки двух переменных
procedure SwapVars1(var u, v; Size: Integer);
var
  x: Pointer;
begin
  GetMem(x, Size);
  try
    System.move(u, x^, Size);
    System.move(v, u, Size);
    System.move(x^, v, Size);
  finally
    FreeMem(x);
  end;
end;

procedure SwapVars2(var Source, Dest; Size: Integer);
begin
  asm
     push edi
     push esi
     mov esi,Source
     mov edi,Dest
     mov ecx,Size
     cld
 @1:
     mov al,[edi]
     xchg [esi],al
     inc si
     stosb
     loop @1
     pop esi
     pop edi
  end;
end;

procedure SaveUndo( Scan: TPoint; P : integer; C : BOOL = true);
var rs : integer;
begin
  rs := Length(Undo[Scan.Port]) + 1;
  SetLength(Undo[Scan.Port], rs);
  with Undo[Scan.Port][rs-1] do begin
    Point := PortState[Scan.Port].Scores[P];
    Position := P;
    Chain := C;
  end;
end;

function NewPoint(PortNum:Integer; T:Cardinal=0): TPoint;
begin
  with Result do begin
    Port := PortNum; Key := 0; Point := 0; Time := T; Err := StringOfChar(' ', 6);
  end;
end;

// Смена режим порта
procedure ChangeMode(Port: Integer; AMode: TMode);
begin
   with PortState[Port] do begin
     PredMode := Mode;
     Mode := AMode;
   end;
  with fMain do begin
    HistoryListBox.Lines.Add(Format(CHANGEMODEMSG, [DateTimeToStr(Now), Modes[AMode].Name, Port]));
    StatusBar1.Panels[Port+3].Text := Format('%d. %s',[Port+1, Modes[AMode].Name]);
  end;
end;

procedure InitMode(AMode: TMode);
var i: Integer;
begin
  for i := 0 to MAXPORTS-1 do ChangeMode(i, AMode);
  CurrentMode := AMode;
  fJudgeCtrl.ModeAction(AMode);
end;

procedure PrevMode( Scan: TPoint );
begin
  if Ord(PortState[Scan.Port].Mode) > Ord(mIdle) then
    ChangeMode(Scan.Port, Pred(PortState[Scan.Port].Mode));
end;
procedure NextMode( Scan: TPoint );
begin
  if Ord(PortState[Scan.Port].Mode) < Ord(mEnd) then
    ChangeMode(Scan.Port, Succ(PortState[Scan.Port].Mode));
end;

procedure Left( Scan: TPoint );
begin
  if PortState[Scan.Port].Sequence > 0 then
    dec( PortState[Scan.Port].Sequence );
end;
procedure Right( Scan: TPoint);
begin
  if PortState[Scan.Port].Sequence < MAXPOINTS-1 then
    inc( PortState[Scan.Port].Sequence );
end;

// удаление оценки
procedure Delete( Scan: TPoint );
var
  i : Integer;
begin
  with PortState[Scan.Port] do begin
    for i := Sequence to MAXPOINTS do begin
      SaveUndo( Scores[i], i, (i = Sequence));   // Save UNDO Scores
      Scores[i] := Scores[i+1];        // Move Scores point
    end;
    Scores[MAXPOINTS] := NewPoint(Scan.Port);
  end;
end;

//вставка оценки
procedure Insert(Scan: TPoint);
var i: Integer;
begin
  with PortState[Scan.Port] do begin
    // Save UNDO Scores
    for i := Sequence to MAXPOINTS do
       SaveUndo( Scores[i], i, (i = Sequence));
    // Move Scores point
    for i := MAXPOINTS downto Sequence do
      if i <= Length(POINTMASK) then
        Scores[i] := Scores[i-1]
      else break;
    Scores[Sequence] := NewPoint(Scan.Port, StartTime+MAXTIME*1000000);
  end;
end;

// сброс к началу просмотра
procedure Reset;
var i, j : integer;
    APoint : TPoint;
begin
 // очищаем все оценки текущего просмотра
  for i := 0 to High(PortState) do begin
    APoint := NewPoint(i);
    with PortState[i] do begin
      Sequence := 0;
      JudgeCall := JC_NONE;
      for j := 0 to High(Scores) do Scores[j] := APoint;
    end;
  end;
  if View = 1 then begin
    StartTime := 0;
    InJudging := false;
  end;
  InitMode(mStandby);
end;

//подсветка нажатой кнопки на экране
procedure TfJudgeCtrl.HighLight;
var
  L: TLabel;
begin
   if (PortState[Scan.Port].Mode in [mReady, mStandby, mScoring, mEdit]) then begin
     L := TLabel(FindComponent('lbPoint'+IntToStr(Scan.Port+1)));
     case ScreenOptions of
        soPortNum   : L.Caption := IntToStr(Scan.Port+1);
        soAsterisk  : L.Caption := '*';
        soScorePoint: L.Caption := Format('%.1f',[PortState[Scan.Port].Scores[PortState[Scan.Port].Sequence].Point/10]);
        soModeName  : L.Caption := Modes[PortState[Scan.Port].Mode].Name;
     end;
     TWaitThr.Create(L, Modes[PortState[Scan.Port].Mode].Color);
   end;
end;

// определяем момент запуска рабочего времени
// как среднее время всех нажатых кнопок
function SetStartTime : BOOL;
var i, q: Integer;
  Sum : Int64;
begin
  Result := true;  Sum := 0; q:= 0;

  for i := 0 to High(PortState) do
    if ((PortState[i].Scores[0].Time <> 0) {and (PortState[i].Scores[0].Time <> MAXTIME)})
      and((StartPort = 0) or (i = StartPort)) then begin
        Sum := Sum + PortState[i].Scores[0].Time;
        inc(q);
    end;
  StartTime := Trunc(Sum/q);  // уст. время старта

  // опред. чтобы время старта каждого пульта было меньше среднего арфм. времени старта
  for i := 0 to High(PortState) do
    if ((StartPort = 0) or (i = StartPort)) and
       (abs(StartTime-PortState[i].Scores[0].Time)/1000 > CONCENSUSTIME) then begin
      Result := false; break;
    end;
end;

// определяем что все пульты запустили таймер
function StartPortCheck(Position: byte; Code: integer = 0) : BOOL;
var i, q: Integer;
begin
  q := MAXPORTS;
  if (StartPort = 0) then begin
    for i := 0 to MAXPORTS-1 do
      if (PortState[i].Scores[Position].Time <> 0) and (PortState[i].Scores[Position].Key = Code) then
        dec(q);
  end
  else
    if (PortState[StartPort-1].Scores[Position].Time <> 0) and (PortState[StartPort-1].Scores[Position].Key = Code) then
      q := 0;
  Result := q = 0;
end;

function GetPointString(Position: integer; var S: TArrPoint) : ShortString;
var R : Single;
begin
  if (Position <= MAXPOINTS) and (S[Position].Time > 0) then begin
      case POINTMASK[Position+1] of
      'P': R := S[Position].Point/10;
      'T': R := (S[Position].Time-StartTime)/1000000;
      else
         R := 0;
      end;
      Result := FloatToStr(RoundTo(R,-2));
  end
  else Result := ' ';
end;

{--------------------------------------
      Обработка переключения режимов
---------------------------------------}

procedure ModeStandby;
begin
  if StartPortCheck(0, VK_RETURN) then begin
    if not SetStartTime then InitMode(mFalse)
    else InitMode(mScoring);
  end;
end;

procedure ModeEdit(CurrentPort: Integer);
var i: integer;
    S: ShortString;
begin
 with PortState[CurrentPort] do begin
    with TfJudgeConsol(Form).grdScore do begin  // заполняем результаты каждого пульта в отдельное окно
      for i := 0 to RowCount-1 do  Rows[i].Clear;
      Cols[0].CommaText := TABLESTRINGS;

      for i := 0 to MAXPOINTS-1 do
        if (Scores[i].Time <> 0) or (PScores[i].Time <> 0) then
          if i <= ColumnsName.Count then
            Cols[i+1].CommaText := Format('"%s","%s|%s","%s|%s"',  //'"%s","%.2f|%.2f","%s|%s"',
              [COLUMNSNAME[i],GetPointString(i,Scores),GetPointString(i,PScores),Scores[i].Err,PScores[i].Err]);
    end;
    // Изменяем запросы судей
    with TfJudgeConsol(Form) do begin
      S := '';
      for i := Low(JudgeCalls) to High(JudgeCalls) do
        if JudgeCall and JudgeCalls[i].Num <> 0 then
          S := S + JudgeCalls[i].S;
      if S = '' then S := JudgeCalls[0].Name;
      StatusBar1.Panels[1].Text := REQUESTSTRING + S;
    end;
  end;
end;

// обработка нажатий меню
procedure ModeMenu(CurrentPort: Integer);
var i : integer;
begin
  with TfJudgeConsol(PortState[CurrentPort].Form) do begin
    if PortState[CurrentPort].Mode = mMenu then begin
      with pnlMenu do Visible := not Visible;
      if pnlMenu.Visible then begin
        lvMenu.Clear;
        // заполняем список
        case CurrentMode of
        mEdit:
          for i := Low(TASKMENULIST) to High(TASKMENULIST) do
            lvMenu.AddItem(Format('%d. %s',[i,TASKMENULIST[i]]),nil);
        mFalse,mReady, mStandby:
          for i := Low(SCORINGMENULIST) to High(SCORINGMENULIST) do
           lvMenu.AddItem(Format('%d. %s',[i,SCORINGMENULIST[i]]),nil);
        mConfirm:
          for i := Low(CONFIRMMENULIST) to High(CONFIRMMENULIST) do
           lvMenu.AddItem(Format('%d. %s',[i,CONFIRMMENULIST[i]]),nil);
        end;
        lvMenu.ViewStyle := vsList;
      end;
    end;
  end;
end;

procedure ModeError(CurrentPort: Integer);
var i : integer;
begin
  with TfJudgeConsol(PortState[CurrentPort].Form) do begin
    if PortState[CurrentPort].Mode = mError then begin
      with pnlMenu do Visible := not Visible;
      if pnlMenu.Visible then begin
        lvMenu.Clear;
        // заполняем список
        for i := 0 to ErrorList.Count-1 do
          lvMenu.AddItem(Format('%d. %s',[i,ErrorList[i]]),nil);
        lvMenu.ViewStyle := vsList;
        //ListView_SetColumnWidth(lvMenu.Handle, -1, LVSCW_AUTOSIZE); //Выравнивание колонок ListView по содержимому
      end;
    end;
    grdScore.Refresh;
  end
end;

procedure ModeConfirm(CurrentPort: Integer);
var i: integer;
  L : BOOL;
begin
  L := true;
  with TfJudgeConsol(PortState[CurrentPort].Form) do begin
    PANELSVISIBLE := Modes[PortState[CurrentPort].Mode].PANELS;
    Refresh;
  end;
  for i := 0 to High(PortState) do
    if PortState[i].Mode <> mConfirm then begin L := false; break; end;
  //выполнить только когда все пульты подтвердят оценки
  if L and (CurrentMode <> mConfirm) then begin
    InitMode(mConfirm);
  end;
end;

{---------------------------------------}

function CheckError(Scan: TPoint):BOOL ;
var i : integer;
begin
  Result := true;
  for i := 0 to MAXPOINTS do
    if (PortState[Scan.Port].Scores[i].Time > 0) then begin
       if (PortState[Scan.Port].Scores[i].Point = 0) and
          (Trim(PortState[Scan.Port].Scores[i].Err) = '') then begin
          Result := false; break;
       end;
    end
    else break;
end;

// определяем ErrorID
function getErrorID(Code:string): Variant;
var i : integer;
begin
  Result := NULL;
  for i := 0 to ErrorList.Count-1 do
    if (ErrorList.Objects[i] <> nil) and (PErrorRec(ErrorList.Objects[i]).Code = Code) then begin
      Result := PErrorRec(ErrorList.Objects[i]).ID;
      break;
    end;
end;

function SaveScores(Scan: TPoint) : shortint;
var
  i : Integer;
  Point, Time : real;
begin
// 0. просмотр фрагмента - удаляем прошлый просмотр
  if Part then
    ReOpenDataset(DataJudge.qryList);
    
// 1.проверить чтобы общее количество оценок было не меньше MINPOINTS
  if (PortState[Scan.Port].Scores[MINPOINTS-1].Time <= 0) then begin //не поставлена
      TInfoThr.Create(PortState[Scan.Port].Form,Format(MINPOINTSERRORMSG,[MINPOINTS]));
      Result := -2; exit; end;

// 2.проверим чтобы оценка не превышали MAXVALUE
  for i := 0 to MAXPOINTS do
    if PortState[Scan.Port].Scores[i].Point > MAXVALUE*10 then begin
      TInfoThr.Create(PortState[Scan.Port].Form,Format(MAXVALUEERRORMSG,[MAXVALUE]));
      Result := -1; exit; end;

//3. сохранить оценки в БД
  Result := 0; //  Result возвращает количество сохраненных оценок
  for i := 0 to MAXPOINTS do begin
    if (PortState[Scan.Port].Scores[i].Time > 0) then begin
        // запоминаем балы
        Point := RoundTo(PortState[Scan.Port].Scores[i].Point/10, -2);
        // запоминаем время оценки
        if (PortState[Scan.Port].Scores[i].Time-StartTime) / 1000000 <= MAXTIME then
             Time := (PortState[Scan.Port].Scores[i].Time-StartTime) / 1000000
        else Time := MAXTIME;  //если поставили в льготное время

        // добавляем оценку в базу
        //!! Как узнать Judge_ID монитора
        DataJudge.tblViewDetail.AppendRecord([ROUNDID,Scan.Port,i,Point,Time,getErrorID(Trim(PortState[Scan.Port].Scores[i].Err))]);
        inc(Result);
    end
    else break;
  end;
  Log.Add(Format(SAVESCORESMSG,[DateTimeToStr(Now),Scan.Port,PortState[Scan.Port].Name]));
end;

procedure ScoringMenuAction(Code: TPoint);
begin
  case Code.Key of
    VK_NUMPAD0: begin
      PortState[Code.Port].JudgeCall := PortState[Code.Port].JudgeCall xor JC_REPEAT;
      Reset; end;
    VK_NUMPAD1: begin
      PortState[Code.Port].JudgeCall := PortState[Code.Port].JudgeCall xor JC_REPEAT;
      Reset;
      end;
    else TInfoThr.Create(PortState[Code.Port].Form,ATTANTIONMSG);
  end;
end;

// обработка меню подтверждения
procedure ConfirmMenuAction(Code: TPoint);
begin
  with fJudgeCtrl do
    case Code.Key of
      VK_NUMPAD0: //запустить просмотр
        begin
          btnPlayClick(nil);
        end;
      VK_NUMPAD1: //Выбор консоль запуска таймера
        begin
          StartPort := StrToInt(InputBox('Выбор консоль запуска таймера','Укажите номер (0-все)','0'));
          //StartTimerPorts.ItemIndex := StartPort;
        end;
      VK_NUMPAD2: //Указать скорость просмотра
        begin
          // как менять значение скорости для каждого тура?!
          case StrToInt(InputBox('Скорость просмотра','Укажите значение 100 полная, 50-90 замедленно','100')) of
            100:    cbSpeed.Checked := false;
            50..90: cbSpeed.Checked := true;
            else    cbSpeed.Checked := false;
          end;
        end;
      VK_NUMPAD3: //выбрать начало фрагмента
        begin
        //ComboBox1.Items.Objects[ComboBox1.ItemIndex]).I
        end;
      VK_NUMPAD4: //выбрать конец фрагмента
        begin
        //ComboBox1.Items.Objects[ComboBox2.ItemIndex]).I
        end;
      VK_NUMPAD5: //редактировать оценки
        begin
          btnEditClick(nil);
        end;
      VK_NUMPAD6: //сохранить результат и выйти
        begin
          btnSaveClick(nil);
        end;
      else TInfoThr.Create(PortState[Code.Port].Form,ATTANTIONMSG);
    end;
end;

// обработка меню ошибок
procedure ErrorMenuAction(Code: TPoint);
begin
  with PortState[Code.Port] do
  if (Scores[Sequence].Point <= 0)
      and (ErrorList.Count > Code.Key-VK_NUMPAD0) then
   case Code.Key of
      VK_NUMPAD1..VK_NUMPAD9:
      	Scores[Sequence].Err :=
           PErrorRec(ErrorList.Objects[Code.Key-VK_NUMPAD0]).Code;
      else TInfoThr.Create(PortState[Code.Port].Form,ATTANTIONMSG);
    end;
end;

// обработка меню управления,  согласно массива TASKMENU
procedure EditMenuAction(Code: TPoint);
var rs : integer;
begin
  case Code.Key of
    VK_NUMPAD0: begin  // вернуть крайнее изменение (Undo)
                rs := Length(Undo[Code.Port]);
                repeat
                  if rs > 0 then begin
                    PortState[Code.Port].Scores[Undo[Code.Port][rs-1].Position] := Undo[Code.Port][rs-1].Point;
                    dec(rs);
                    if Undo[Code.Port][rs].Chain then break;
                  end
                until rs = 0;
                SetLength(Undo[Code.Port], rs);
              end;
    VK_NUMPAD1: begin  //показать жеребьевку
                if CurrentMode in [mEdit, mFalse, mError] then
                   with TfJudgeConsol(PortState[Code.Port].Form) do
                     PANELSVISIBLE := PANELSVISIBLE xor JC_DRAW;
              end;
    VK_NUMPAD2: begin //Отделение по оператору (штраф -20)
                 PortState[Code.Port].JudgeCall := PortState[Code.Port].JudgeCall xor JC_EXIT;
                 Log.Add(Format(PENALTYMSG,[Code.Port]));
               end;
    VK_NUMPAD3: begin //Запрос просмотра фрагмента по № фигуры
                 PortState[Code.Port].JudgeCall := PortState[Code.Port].JudgeCall xor JC_FRAME;
                 Log.Add(Format(REVIEWFRAMEMSG,[Code.Port, PortState[Code.Port].Sequence+1, 0]));
              end;
    VK_NUMPAD4: begin  //Пропуск фигуры
                 with PortState[Code.Port] do begin
                   Scores[Sequence].Point := MAXPENALTY*10;
                   // код пропуска определить и вставить
                   Scores[Sequence].Err := '4';
                 end;
              end;
    VK_NUMPAD5:   // сохранить результат
                if CheckError(Code) then begin  // проверим ошибки перед сохранением
                   if SaveScores(Code) >= 0 then begin
                     ChangeMode(Code.Port, mConfirm);
                     with TfJudgeConsol(PortState[Code.Port].Form) do
                       PANELSVISIBLE := PANELSVISIBLE or JC_MESSAGE;   // Вывести ЖДИТЕ!!!
                   end
                end
                else TInfoThr.Create(PortState[Code.Port].Form,PENALTYERRORMSG);
    VK_NUMPAD6: begin  //Скопировать оценки предыдущего просмотра в текущий
                  for rs := 0 to MAXPOINTS do
                    with PortState[Code.Port] do SwapVars2(Scores[rs], PScores[rs], SizeOf(TPoint));
                  SetLength(Undo[Code.Port], 0);
                end;
    else TInfoThr.Create(PortState[Code.Port].Form,ATTANTIONMSG);
  end; //case
end;

// добавляем оценку к списку
procedure AddDigit(Scan: TPoint; N:Shortint);
begin
  if (PortState[Scan.Port].Mode in [mReady, mStandby, mScoring, mEdit]) then begin
    if (N >= 0) then  begin
      with PortState[Scan.Port] do begin
        Scan.Point := (Scores[Sequence].Point * 10 + N) mod 100;
        if Scores[Sequence].Point = 10 then Scan.Point := 100;
      end
    end
    else
      Scan.Point := N;

    if (CurrentMode in [mEdit]) then begin
      with PortState[Scan.Port] do begin
        Scan.Time := Scores[Sequence].Time;
        SaveUndo(Scan, Sequence);  // сохранить изменение
      end;
    end;

    with PortState[Scan.Port] do Scores[Sequence] := Scan;
    // подсветка нажатия кнопки пульта
    if (PortState[Scan.Port].Mode in [mStandby, mReady, mScoring]) then
      fJudgeCtrl.HighLight(Scan, soPortNum);
  end;
end;

{-------------------------------------------------
 Время блокирования дребезга нажатия кнопок при судействе
 если между нажатиями меньше _PUSHPROTECTPERIOD - не считать
---------------------------------------------------}
function ProtectTime(Code: TPoint) : BOOL;
begin
  with PortState[Code.Port] do
    if (Sequence > 0) and (CurrentMode in [mScoring]) then
      Result := (Code.Time - Scores[Sequence-1].Time)/1000 >= _PUSHPROTECTPERIOD
    else
      Result := true;
end;


// Выполняем при нажатой кнопки.
procedure CodeAction(Code: TPoint);
begin
  if (Code.Port < MAXPORTS) then begin
    case PortState[Code.Port].Mode of
      mMenu, mError: begin
          with TfJudgeConsol(PortState[Code.Port].Form) do
            with pnlMenu do begin
              Visible := not Visible;
              if Visible then lvMenu.ViewStyle := vsList
              else lvMenu.ViewStyle := vsReport;
            end;
            ChangeMode(Code.Port, PortState[Code.Port].PredMode);
            if PortState[Code.Port].PredMode = mError then
                 ErrorMenuAction(Code)
            else case PortState[Code.Port].Mode of
                   mEdit: EditMenuAction(Code);
                   mConfirm: ConfirmMenuAction(Code);
                   mReady, mStandby, mScoring, mFalse: ScoringMenuAction(Code);
                   else ;
                 end;
         end;
    else // во всех случаях
      if ProtectTime(Code) then // исключая дребезг контактов
       case Code.Key of
       VK_RETURN : begin
                     case CurrentMode of
                       mStandby: AddDigit(Code, 0);
                       mScoring: begin AddDigit(Code, 10); Right(Code) end;
                       mConfirm: SendMessage(TfJudgeConsol(PortState[Code.Port].Form).grdJumpResult.Handle, WM_HSCROLL, SB_PAGERIGHT, 0);
                       mEdit: Right(Code);
                       else ;
                     end;
                   end;
       VK_NUMPAD0: begin
                      case  CurrentMode of
                        mScoring: begin AddDigit(Code, 0); Right(Code); end;
                        else AddDigit(Code, 0);
                      end;
                   end;
       VK_NUMPAD1..VK_NUMPAD9: begin
                    if (CurrentMode in [mScoring]) then AddDigit(Code, (Code.Key-VK_NUMPAD0)*10)
                    else AddDigit(Code, Code.Key-VK_NUMPAD0)
                  end;
       VK_ADD    : case CurrentMode of
                       mEdit: Left(Code);
                       mConfirm: SendMessage(TfJudgeConsol(PortState[Code.Port].Form).grdJumpResult.Handle, WM_HSCROLL, SB_PAGELEFT, 0);
                      else ;
                   end;
       VK_BACK   : begin
                      case CurrentMode of
                      mEdit, mConfirm: ChangeMode(Code.Port, mMenu);
                      mReady, mStandby, mScoring, mFalse:
                        if (StartPort = 0) or (Code.Port = StartPort) then Reset;
                      else ;
                     end;
                   end;
       VK_DECIMAL: begin AddDigit(Code, 0);     //Перепрыжка (НВ)
                     with PortState[Code.Port] do begin
                       Scores[Sequence].Err := NVErrorNumber;
                       JudgeCall := JudgeCall or JC_NV;
                       if (CurrentMode in [mScoring]) then Right(Code);
                     end;
                   end;
       VK_DIVIDE : begin if CurrentMode in [mEdit] then Insert(Code) end;
       VK_MULTIPLY:begin if CurrentMode in [mEdit] then Delete(Code) end;
       VK_SUBTRACT:begin if CurrentMode in [mEdit] then ChangeMode(Code.Port, mError); end;
       VK_UP     : begin InitMode(mEnd);  end;
       else ; // другие кнопки игнорировать
      end;  //case
    end; //case
    Log.Add(Format(KEYPRESSMSG, [DateTimeToStr(Now),Code.Port, Code.Key, (Code.Time-StartTime)/1000000]));

    case PortState[Code.Port].Mode of //выполнить процедуру каждый раз
      mStandby: ModeStandby;
      mEdit: ModeEdit(Code.Port);
      mConfirm: ModeConfirm(Code.Port);
      mMenu: ModeMenu(Code.Port);
      mError:ModeError(Code.Port);
      else ; //mIdle, mReady, mScoring, mFalse, mEnd
    end;
  end;
end;

// определяем клавиатуру с которой нажата кнопка
function GetScanCode(Port:Integer; Key: Cardinal): TPoint;
var Scan: TPoint;
    i: Integer;
begin
  for i:=0 to MAXPORTS-1 do
    if PortState[i].KeyBoard = Port then begin
      Scan.Port := i;
      Scan.Point := 0;
      Scan.Key := Key;
      Scan.Time := CurrentVideoPosition; //фиксируем время нажатия кнопки   FFPlayer.CurrentPTS
      Scan.Err := StringOfChar(' ', 6);
      break;
    end;
  Result := Scan;
end;


// меняет все запятые в строке на минусы
function ChChar(S : string) : string;
begin
  { Convert spaces to zeros }
  while Pos(',', S) > 0 do
    S[Pos(',', S)] := '-';
  Result := S;
end;

//**********************************************
constructor TInfoThr.Create;
var W: integer;
begin
  O := TTextPanel.Create(F);
  with O do begin
    Parent := F;
    Caption := Msg;
    Font.Size := 12;
    Canvas.Font.Assign(Font);
    W := Canvas.TextWidth(Caption) + 32;
    Top := 300;
    Left := F.Width div 2 - W div 2;
    Width := W;
    Height := 60;
    with TBevel.Create(O) do begin
      Parent := O;
      Left := 8;
      Top := 8;
      Width := W - 16;
      Height := 44;
    end
  end;
  DelayTime := 3000;
  FreeOnTerminate := True;
  inherited Create(False);
end;
procedure TInfoThr.Execute;
begin
  Sleep(DelayTime);
  WaitForSingleObject(Handle, WAIT_TIMEOUT);
  Synchronize(Hide);
end;
procedure TInfoThr.Hide;
begin
  O.Free;
end;
//***********************************************

// Выполняется при переключения режима
procedure TfJudgeCtrl.ModeAction(AMode: TMode);
var i, j : integer;
    L : TLabel;
    S, R: string;
    T : TRect;
begin
  fMain.StatusBar1.Panels[2].Text := Format('Режим: %s',[Modes[AMode].Name]);;
  case AMode of
  mReady: begin
      CanJudge := true;
      InJudging := false;
      SetLength(Undo, MAXPORTS, 0);
      DesktopCanvas := TCanvas.Create;

      for i := 0 to High(PortState) do
        with PortState[i] do begin
          SetLength( Scores, MAXPOINTS+1 );   // Инициализация массива оценок
          SetLength( PScores, MAXPOINTS+1 );  // Оценки предыдущего просмотра
          TfJudgeConsol(Form).PANELSVISIBLE := Modes[CurrentMode].PANELS;
          Form.Refresh;
        end;
    end;
  mStandby: begin
      PageControl1.ActivePage := TabSheet2;
      CanJudge := not Part;
      BeepCount := _BEEPQUANTITY;
      lbView.Caption := IntToStr(View);
      if DataMain.tblCompetitionProtoSort.Value then
        lbTime.Caption := IntToStr(0)
      else  // Обратный таймер
        lbTime.Caption := Format('%2.1f',[SimpleRoundTo(MAXTIME, -1)]);

      for i := 0 to High(PortState) do
        with TfJudgeConsol(PortState[i].Form) do begin
          if VIEWSCREEN then  PANELSVISIBLE := Modes[CurrentMode].PANELS
          else PANELSVISIBLE := Modes[mReady].PANELS;
          // подсветка активных пультов
          if (StartPort = 0) or (i = StartPort) then HighLight(NewPoint(i));
          Refresh;
        end;

    // задаем скорость просмотра
    // первый раз просмотр на обычной скорости
      if (View <= 1) or not cbSpeed.Checked then begin
        FFPlayer.PlaybackSpeed := 1.0;
        FFPlayer.SyncType := stAudio;
      end
      else begin
        FFPlayer.PlaybackSpeed := PLAYBACKSPEED / 100;
        FFPlayer.SyncType := stExternal;
      end;
      Log.Add(Format(PLAYBACKSPEEDMSG, [FFPlayer.PlaybackSpeed*100]));
      Log.Add(Format(REVIEWMSG,[DateTimeToStr(Now), View]));

      //  Start  видео
      FFPlayer.Seek(VideoPartStart);
    end;
  mScoring: begin
      Log.Add(Format(STARTTIMEMSG, [StartTime]));
      if not Part then
          // обнулить оценку старте рабочего времени)
          // если это просмотр фрагмента то обнулять не нельзя!!!
        for i := 0 to High(PortState) do begin
          PortState[i].Sequence := 0;
          PortState[i].Scores[0] := NewPoint(i);
        end;
      if not InJudging then begin
        InJudging := true;
        VideoPartEnd := StartTime + MAXTIME * 1000000;
      end;
    end;
  mEdit: begin
      InJudging := false;
      CanJudge := true;      
      for i := 0 to High(PortState) do begin
        // поставить минимальное количество оценок
        for j := PortState[i].Sequence to MINPOINTS-1 do
          if (PortState[i].Scores[j].Time = 0) then begin
            PortState[i].Scores[j] := NewPoint(i, StartTime+MAXTIME*1000000);
          end;
        // обновить название текущего режима
        with TfJudgeConsol(PortState[i].Form) do begin
          PANELSVISIBLE := Modes[CurrentMode].PANELS;
          Refresh;
        end;
      end;
    end;
  mConfirm: begin
      { Записать результаты каждого пульта в MEMORY ResultDetail}
      DataJudge.qryResultViewDetail.ExecSQL;

      with DataMain do begin
        //Подсчитать результат тура - результат записывается в RoundResult !!!
        qryCalcResult.ExecSQL;
{        with tblTeamRound do
          if Locate('Result_ID',ROUNDID,[]) then begin
            Edit;
            FieldByName('StartTime').AsInteger  := StartTime;
//            FieldByName('ViewNumber').AsInteger := View;
            Post;
          end;
}
        ReOpenDataset(tblTeamRound);
      end;

      {вывести ведомость оценок на экран}
      with DataJudge do begin
        with qryScore do begin
          Close;
          Open;
        end;
        with qryTime do begin
          Close;
          Open;
        end;
        with qryError do begin
          Close;
          Open;
        end;
      end;

{ // установить ширину колонок по содержимому Caption
    for j := 0 to MAXPOINTS+1 do begin
      with grdScore.Columns[j] do Width := Canvas.TextWidth(Title.Caption)+12;
      with grdError.Columns[j] do Width := Canvas.TextWidth(Title.Caption)+12;
      with grdTime.Columns[j] do Width := Canvas.TextWidth(Title.Caption)+12;
    end;
}
{    // это типа AutoSizeCol !!!
    for i := 0 to High(AForms) do begin
      for j := 2 to MAXPOINTS+1 do
        with AForms[i] do
          grdJumpResult.Columns[j].Width := grdJumpResult.Canvas.TextWidth(Text);
    end; }

{     // Запоминаем запросы от судей.
      // А нужны ли они нам ?!  и поле Remark в RoundResult удалится.
      S := '';
      for i := 0 to High(AForms) do begin
        R := '';
        for j := 0 to High(JudgeCalls) do
          if PortState[i].JudgeCall and JudgeCalls[j].Num <> 0 then begin
            R := R + JudgeCalls[j].S;
            S := S + Format('М%d-%s'+CR,[i+1, JudgeCalls[j].Name]);
          end;
        TLabel(FindComponent('lbPoint'+IntToStr(i+1))).Caption := R;
      end;
      with DM.tblTeamRound do begin
        S := FieldByName('Comment').AsString + S;
        Edit;
        FieldByName('Comment').AsString := S;
        Post;
      end;
}
      for i := 0 to High(PortState) do
        with TfJudgeConsol(PortState[i].Form) do begin
          pnlMessage.Visible := false;    // закрыть надпись ЖДИТЕ!!!
          PANELSVISIBLE := Modes[CurrentMode].PANELS;
          Refresh;
        end;
      // вывести оценки на трекбар
      ClearBreakpoint;
      MakeBreakpoint;
      PageControl1.ActivePage := TabSheet3;
    end;
  mFalse: begin
      InJudging := false;
      StartTime := 0;
      FFPlayer.Pause;
      for i := 0 to High(PortState) do
        with TfJudgeConsol(PortState[i].Form) do begin
          PANELSVISIBLE := Modes[CurrentMode].PANELS;
          Refresh;
        end;
        L := TLabel(FindComponent('lbPoint'+IntToStr(i+1)));
        if (abs(StartTime-PortState[i].Scores[0].Time)/1000 > CONCENSUSTIME) then begin
          L.Color := Modes[CurrentMode].Color.clStart;
          L.Caption := Format('%.0f',[(PortState[i].Scores[0].Time-StartTime)/1000]);
          Log.Add(Format(FALSESTARTMSG,[DateTimeToStr(Now),i+1,PortState[i].Name, (PortState[i].Scores[0].Time-StartTime)/1000]));
        end
        else L.Color := Modes[CurrentMode].Color.clEnd;
    end;
  mEnd:  begin
      CanJudge := false;
      InJudging := false;
      View := 0;
      cbSpeed.Checked := false;
      FFPlayer.Stop(true);
      ClearBreakpoint;
      for i := 0 to High(PortState) do begin
        with PortState[i] do begin
          Form.Free;
          Form := nil;
          SetLength( Scores, 0 );
          SetLength( PScores, 0 );
          Sequence := 0;
          JudgeCall := JC_NONE;
        end;
      end;

      // перерисовать большой экран
      if not VIEWSCREEN and (Screen.MonitorCount > 1) then begin
        if DesktopCanvas <> nil then FreeAndNil(DesktopCanvas);
        with Screen.Monitors[1] do  T := Rect(Left, Top, Width, Height);
        InvalidateRect(0, @T, false);
      end;
      
      with DataJudge do begin
        qryScore.Close;
        qryTime.Close;
        qryError.Close;
      end;
      Log.Add(Format(BREAKMSG,[DateTimeToStr(Now)]));
      PageControl1.ActivePage := TabSheet1;      
    end;
  else ; //для режимов mIdle, mMenu, mError - ниче не делать!
  end;
end;

// whether mouse is down
function IsMouseDown: Boolean;
begin
  if GetSystemMetrics(SM_SWAPBUTTON) <> 0 then
    Result := GetAsyncKeyState(VK_RBUTTON) and $8000 <> 0
  else
    Result := GetAsyncKeyState(VK_LBUTTON) and $8000 <> 0;
end;

// find wincontrol of form by name
function FindWinControl(AForm: TForm; const AName: string): TWinControl;
var
  I: Integer;
begin
  for I := 0 to AForm.ControlCount - 1 do
  begin
    if (AForm.Controls[I] is TWinControl) and (AForm.Controls[I].Name = AName) then
    begin
      Result := TWinControl(AForm.Controls[I]);
      Exit;
    end;
  end;
  Result := nil;
end;

function TfJudgeCtrl.GetScreenHandle: HWND;
begin
  // wincontrol used for render video
  Result := GetDesktopHandle;
end;

procedure TfJudgeCtrl.FormCreate(Sender: TObject);
var i : integer;
begin
  FormID := Scoring_GUID;
  Log := fMain.HistoryListBox.Lines;
  DataJudge.qryList.Open;

  // по количеству консолей
  with StartTimerPorts.Items do begin
    Clear;
    Add('Все консоли');
    for i := Low(PortState) to High(PortState) do
      Add(Format('%d консоль',[i+1]));
  end;
  StartTimerPorts.ItemIndex := 0;

  // колонки таблицы оценок, зависит от типа соревнований
  ColumnsName := TStringList.Create;
  // считываем названия консолей
  with DataMain.tblJudge do begin
    First;
    while (not EOF) do begin
      if (FieldByName('Port').AsInteger in [1..9]) and (FieldByName('Port').AsInteger <= MAXPORTS) then begin
         if (FieldByName('NickName').IsNull) or (Trim(FieldByName('NickName').AsString)='') then
           PortState[FieldByName('Port').AsInteger - 1].Name := FieldByName('Name').AsString
         else PortState[FieldByName('Port').AsInteger - 1].Name := FieldByName('NickName').AsString;
      end;
      Next;
    end
  end;

  // получить список меню ошибок
  ErrorList := TStringList.Create;
  with DataMain.tblErrors do begin
    Open; First;
    ErrorList.Add(Format('%s',[ERRORITEM0]));
    while not EOF do begin
      New(err);
      err.ID := Fields[0].AsInteger;
      err.Code := Fields[1].AsString;
      err.NV := err.Code = 'NV';
      ErrorList.AddObject(Fields[2].AsString, TObject(err));
      if err.NV then NVErrorNumber := err.Code;
      Next;
    end;
    Close;
  end;

  // Load dynamic link libraries
  if not FFPlayer.AVLibLoaded then
  begin
    if not FFPlayer.LoadAVLib(ExePath + CLibAVPath) then
    begin
      Log.Add(Format('%s %s',[DateTimeToStr(Now),FFPlayer.LastErrMsg]));
      Exit;
    end;
  end;

// initial options FFMPEG
  FFPlayer.SetLicenseKey(LICENSE_KEY);
  FFPlayer.VideoFilters := 'yadif';

  // equalizer ???
  FBrightness := 0;
  FContrast := 0;
  FSaturation := 1;
  FHue := 0;

{$IF Defined(VER140) OR Defined(VER150)} // Delphi 6, 7
  FLock := TCriticalSectionEx.Create;
{$ELSE}
  FLock := TCriticalSection.Create;
{$IFEND}
  FRect.Left := 0;
  FRect.Top := 0;
  FRect.Right := -1;
  FRect.Bottom := -1;

  // Initial default value
  View := 0; CurrentMode := mIdle;
  with DirectoryWatch1 do begin Directory := VIDEODIRECTORY; Active := true; end;

  btnScoringFirst.Enabled := not DataJudge.qryList.IsEmpty;
end;


procedure TfJudgeCtrl.FormDestroy(Sender: TObject);
var i: integer;
begin
  FreeAndNil(ColumnsName);
  // удаляем связные записи причин ошибок
  for i := 0 to ErrorList.Count-1 do
    Dispose(PErrorRec(ErrorList.Objects[i]));
  FreeAndNil(ErrorList);
  for i := 0 to High(PortState) do
    with PortState[i] do begin
      Finalize( Scores );
      Finalize( PScores );
    end;
  FLock.Free;
end;

procedure TfJudgeCtrl.FormClose(Sender: TObject; var Action: TCloseAction);
var i: integer;
begin
  with DataJudge do begin
    qryList.Close;
    tblViewDetail.EmptyTable;
    tblResultDetail.EmptyTable;
  end;
  InitMode(mEnd);

  DirectoryWatch1.Active := false;

  fJudgeCtrl := nil;
  Action := caFree;
end;

procedure TfJudgeCtrl.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  with FFPlayer do begin
    // Clear the event handlers
    OnPosition := nil;
    OnState := nil;
    OnFrameHook := nil;
    OnVideoHook := nil;
    OnAudioHook := nil;
  end;
  FFLogger.OnLog := nil;
end;


//******************************************************
// maximize or normal form
{$IF Defined(VER140) OR Defined(VER150) OR Defined(VER170)} // Delphi 6, 7, 2005
procedure GetBorderStyles(AForm: TCustomForm; ABorderStyle: TFormBorderStyle;
  var Style, ExStyle, ClassStyle: Cardinal);
begin
  // Clear existing border styles
  Style := Style and not (WS_POPUP or WS_CAPTION or WS_BORDER or WS_THICKFRAME or WS_DLGFRAME or DS_MODALFRAME);
  ExStyle := ExStyle and not (WS_EX_DLGMODALFRAME or WS_EX_WINDOWEDGE or WS_EX_TOOLWINDOW);
  ClassStyle := ClassStyle and not (CS_SAVEBITS or CS_BYTEALIGNWINDOW);

  // Set new border styles
  case ABorderStyle of
    bsNone:
      if (AForm.Parent = nil) and (AForm.ParentWindow = 0) then
        Style := Style or WS_POPUP;
    bsSingle, bsToolWindow:
      Style := Style or (WS_CAPTION or WS_BORDER);
    bsSizeable, bsSizeToolWin:
      Style := Style or (WS_CAPTION or WS_THICKFRAME);
    bsDialog:
      begin
        Style := Style or WS_POPUP or WS_CAPTION;
        ExStyle := ExStyle or WS_EX_DLGMODALFRAME or WS_EX_WINDOWEDGE;
        if not NewStyleControls then
          Style := Style or WS_DLGFRAME or DS_MODALFRAME;
        ClassStyle := ClassStyle or CS_DBLCLKS or CS_SAVEBITS or CS_BYTEALIGNWINDOW;
      end;
  end;
  if ABorderStyle in [bsToolWindow, bsSizeToolWin] then
    ExStyle := ExStyle or WS_EX_TOOLWINDOW;
end;

procedure GetBorderIconStyles(AForm: TCustomForm; ABorderStyle: TFormBorderStyle;
  var Style, ExStyle: Cardinal);
var
  LIcons: TBorderIcons;
begin
  // Clear existing border icon styles
  Style := Style and not (WS_MINIMIZEBOX or WS_MAXIMIZEBOX or WS_SYSMENU);
  ExStyle := ExStyle and not WS_EX_CONTEXTHELP;

  // Adjust icons based on border style
  LIcons := TForm(AForm).BorderIcons;
  case ABorderStyle of
    bsNone: LIcons := [];
    bsDialog: LIcons := LIcons * [biSystemMenu, biHelp];
    bsToolWindow,
    bsSizeToolWin: LIcons := LIcons * [biSystemMenu];
  end;

  // Set border icon styles
  if ABorderStyle in [bsSingle, bsSizeable, bsNone] then
  begin
    if biMinimize in LIcons then Style := Style or WS_MINIMIZEBOX;
    if biMaximize in LIcons then Style := Style or WS_MAXIMIZEBOX;
  end;
  if biSystemMenu in LIcons then Style := Style or WS_SYSMENU;
  if biHelp in LIcons then ExStyle := ExStyle or WS_EX_CONTEXTHELP;
end;
procedure SetBorderStyle(AForm: TCustomForm; ABorderStyle: TFormBorderStyle);
var
  LStyle, LExStyle, LClassStyle: Cardinal;
  LIcon: HICON;
begin
  LStyle := GetWindowLong(AForm.Handle, GWL_STYLE);
  LExStyle := GetWindowLong(AForm.Handle, GWL_EXSTYLE);
  LClassStyle := GetClassLong(AForm.Handle, GCL_STYLE);

  GetBorderStyles(AForm, ABorderStyle, LStyle, LExStyle, LClassStyle);
  GetBorderIconStyles(AForm, ABorderStyle, LStyle, LExStyle);

  SetWindowLong(AForm.Handle, GWL_STYLE, LStyle);
  SetWindowLong(AForm.Handle, GWL_EXSTYLE, LExStyle);
  SetClassLong(AForm.Handle, GCL_STYLE, LClassStyle);

  // Update icon on window frame
  if NewStyleControls then
    if ABorderStyle <> bsDialog then
    begin
      LIcon := TForm(AForm).Icon.Handle;
      if LIcon = 0 then LIcon := Application.Icon.Handle;
      if LIcon = 0 then LIcon := LoadIcon(0, IDI_APPLICATION);
      SendMessage(AForm.Handle, WM_SETICON, ICON_BIG, LIcon);
    end
    else
      SendMessage(AForm.Handle, WM_SETICON, ICON_BIG, 0);

  // Reset system menu based on new border style
  GetSystemMenu(AForm.Handle, True);
  AForm.Perform(WM_NCCREATE, 0, 0);

  SetWindowPos(AForm.Handle, 0, 0, 0, 0, 0, SWP_FRAMECHANGED or SWP_NOMOVE or
    SWP_NOZORDER or SWP_NOSIZE or SWP_NOACTIVATE);
  AForm.Invalidate;
end;
procedure SetStayOnTop(AHandle: HWND; AStayOnTop: Boolean);
const
  HWND_STYLE: array[Boolean] of HWND = (HWND_NOTOPMOST, HWND_TOPMOST);
begin
  SetWindowPos(AHandle, HWND_STYLE[AStayOnTop], 0, 0, 0, 0,
    SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE or SWP_NOOWNERZORDER);
end;
{$IFEND}

procedure MaxOrNormalForm(AForm: TForm; AMax: Boolean; AWS: TWindowState);
begin
  if AMax then
  begin
{$IF Defined(VER140) OR Defined(VER150) OR Defined(VER170)} // Delphi 6, 7, 2005
    SetStayOnTop(AForm.Handle, True);
    SetBorderStyle(AForm, bsNone);
{$ELSE}
    AForm.FormStyle := fsStayOnTop;
    AForm.BorderStyle := bsNone;
{$IFEND}
    if AForm.WindowState <> wsMaximized then
      AForm.WindowState := wsMaximized
    else
    begin
      ShowWindow(AForm.Handle, SW_SHOWNORMAL);
      ShowWindow(AForm.Handle, SW_SHOWMAXIMIZED);
    end;
  end
  else
  begin
    AForm.WindowState := AWS;
{$IF Defined(VER140) OR Defined(VER150) OR Defined(VER170)} // Delphi 6, 7, 2005
    SetStayOnTop(AForm.Handle, False);
    SetBorderStyle(AForm, bsSizeable);
{$ELSE}
    AForm.FormStyle := fsNormal;
    AForm.BorderStyle := bsSizeable;
{$IFEND}
  end;
end;

// return desktop handle
function enumUserWindowsCB(ahwnd: HWND; lParam: LPARAM): BOOL; stdcall;
var
  wflags: Longint;
  sndWnd: HWND;
  targetWnd: HWND;
  resultHwnd: PLongWord;
begin
  wflags := GetWindowLong(ahwnd, GWL_STYLE);
  if (wflags and WS_VISIBLE) <> 0 then
  begin
    sndWnd := FindWindowEx(ahwnd, 0, 'SHELLDLL_DefView', nil);
    if sndWnd <> 0 then
    begin
      targetWnd := FindWindowEx(sndWnd, 0, 'SysListView32', 'FolderView');
      if targetWnd <> 0 then
      begin
        resultHwnd := PLongWord(lParam);
        resultHwnd^ := targetWnd;
        Result := False;
        Exit;
      end;
    end;
  end;
  Result := True;
end;
function GetDesktopHandle: HWND;
begin
  // works under Windows XP or classic theme under Windows Vista/7
  Result := FindWindow('ProgMan', nil);    {Do not Localize}
  if Result <> 0 then
  begin
    Result := GetWindow(Result, GW_CHILD);
    if Result <> 0 then
    begin
      Result := GetWindow(Result, GW_CHILD);
      if Result <> 0 then
        Exit;
    end;
  end;
  // works under Vista/7
  EnumWindows(@enumUserWindowsCB, Integer(@Result));
end;
{********************************************************}

type
  // audio level thread
  TLevelThread = class(TThread)
  private
    FEvent: TEvent;
    FLeftBar: TProgressBar;
    FRightBar: TProgressBar;
    FLeft: Integer;
    FRight: Integer;
  protected
    procedure Execute; override;
  public
    constructor Create(ALeftBar, ARightBar: TProgressBar);
    destructor Destroy; override;
    procedure Update(ALeft, ARight: Integer);
  end;

constructor TLevelThread.Create(ALeftBar, ARightBar: TProgressBar);
begin
  inherited Create(False);
  Self.FreeOnTerminate := True;
  FEvent := TEvent.Create(nil, True, False, '');
  FLeftBar := ALeftBar;
  FRightBar := ARightBar;
  FLeft := 0;
  FRight := 0;
end;

destructor TLevelThread.Destroy;
begin
  FEvent.Free;
end;

procedure TLevelThread.Execute;
begin
  while not Self.Terminated do
  begin
    FLeftBar.Position := Round(100 * FLeft / $8000); // $8000 -> 32768, max value of signed 16 bits
    FRightBar.Position := Round(100 * FRight / $8000);
    FEvent.ResetEvent;
    while FEvent.WaitFor(10) = wrTimeout do
      if Self.Terminated then
        Break;
  end;
end;

procedure TLevelThread.Update(ALeft, ARight: Integer);
begin
  FLeft := ALeft;
  FRight := ARight;
  FEvent.SetEvent;
end;

var
  FLevelThread: TLevelThread = nil;
{********************************************************}

procedure TfJudgeCtrl.FFPlayerVideoHook(Sender: TObject; ABitmap: TBitmap;
  const APTS: Int64; var AUpdate: Boolean);
var i : integer;
   DC: HDC;
begin
  if VIEWSCREEN then begin
    AUpdate := false;
    for i := 0 to High(PortState) do  begin // на AForms[0] выводит сам FFmpeg
       DC := GetDC(PortState[i].Form.Handle);
       SetStretchBltMode(DC, STRETCH_DELETESCANS);
       StretchBlt(DC, 0, 0, PortState[i].Form.Width, PortState[i].Form.Height,
           ABitmap.Canvas.Handle, 0, 0, ABitmap.Width, ABitmap.Height, SRCCOPY);
       ReleaseDC(PortState[i].Form.Handle, DC);
    end;
  end
  else
    try
      AUpdate := false;
      DC:= GetDC(0);
      DesktopCanvas.Handle := DC;
      SetStretchBltMode(DC, STRETCH_DELETESCANS);
      with Screen.Monitors[1] do
        StretchBlt(DC, Left, Top, Width, Height,
           ABitmap.Canvas.Handle, 0, 0, ABitmap.Width, ABitmap.Height, SRCCOPY);
    finally
      ReleaseDC(0, DC);
    end;
end;

function DurationToStr(ADuration: Int64): string;
var
  hours, mins, secs, us: Integer;
begin
  if ADuration <> AV_NOPTS_VALUE then
  begin
    secs := (ADuration + 5000) div AV_TIME_BASE;
    us := (ADuration + 5000) mod AV_TIME_BASE;
    mins := secs div 60;
    secs := secs mod 60;
    hours := mins div 60;
    mins := mins mod 60;
    Result := Format('%.2d:%.2d:%.2d.%.3d',
                    [hours, mins, secs, (1000 * us) div AV_TIME_BASE]);
  end
  else
    Result := 'N/A';
end;

procedure TfJudgeCtrl.FFPlayerPosition(Sender: TObject;
  const APTS: Int64);
var TimeLeft : real;
begin
  CurrentVideoPosition := APTS;
  if InJudging and ( APTS > 0 ) then begin
    TimeLeft := (APTS - StartTime) / 1000000;
   // звук об окончании рабочего времени
    if MAXTIME-TimeLeft <= BeepCount then  //_BEEPQUANTITY
        if MAXTIME-TimeLeft <= BeepCount-1 then begin
          dec(BeepCount);
          if (BeepCount > 0) then MessageBeep(MB_ICONWARNING);
//          else MessageBeep(MB_OK); //крайний звук другой!
        end;

    if (APTS >= StartTime) and (TimeLeft <= MAXTIME) then
      if DataMain.tblCompetitionProtoSort.Value then
        lbTime.Caption := Format('%2.1f',[SimpleRoundTo(TimeLeft, -1)])
      else  // desc
        lbTime.Caption := Format('%2.1f',[SimpleRoundTo(MAXTIME-TimeLeft, -1)])
  end;

  // остановить просмотр если конец файла или достигли конечного маркера
  if ((APTS >= VideoPartEnd) or (APTS = FDuration)) then begin
    MessageBeep(MB_OK); // озвучиваем конец просмотра
    DelayTime := 0;
    Timer1.Enabled := true;
    FFPlayer.Pause;
  end;

  // включение таймера при повторном просмотре (без запуска).
  if (APTS >= StartTime) and (View > 1) and (CurrentMode = mStandby) then begin
      InJudging := true;
      InitMode(mScoring);
  end;
end;

procedure TfJudgeCtrl.FFPlayerState(Sender: TObject;  AState: TPlayState);
const
  CPlayState: array[TPlayState] of string = ('Play', 'Pause', 'Resume', 'Step', 'Stop', 'End');
begin
  // show state
  Log.Add(Format('%s %s',[DateTimeToStr(Now),CPlayState[AState]]));

  case AState of
    psPlay, psResume:
begin
{$IF Defined(VER140) OR Defined(VER150) OR Defined(VER170)} // Delphi 6, 7, 2005
        SetStayOnTop(Self.Handle, True);
{$ELSE}
        Self.FormStyle := fsStayOnTop;
{$IFEND}
end;
    psPause, psStep:
begin
{$IF Defined(VER140) OR Defined(VER150) OR Defined(VER170)} // Delphi 6, 7, 2005
      SetStayOnTop(Self.Handle, False);
{$ELSE}
      Self.FormStyle := fsNormal;
{$IFEND}
end;
    psStop:
      begin
{$IF Defined(VER140) OR Defined(VER150) OR Defined(VER170)} // Delphi 6, 7, 2005
        SetStayOnTop(Self.Handle, False);
{$ELSE}
        Self.FormStyle := fsNormal;
{$IFEND}
        // repaint the screen to the original appearance
        if HWND(FFPlayer.ScreenHandle) <> 0 then
        begin
          PostMessage(FFPlayer.ScreenHandle, CM_INVALIDATE, 0, 0);
          UpdateWindow(FFPlayer.ScreenHandle);
        end;
        Timer1.Enabled := false;
      end;
    psEnd:
      begin
        FFPlayer.Stop;
      end;
  end;
end;


procedure TfJudgeCtrl.FFPlayerFileOpen(Sender: TObject;
  const ADuration: Int64; AFrameWidth, AFrameHeight: Integer;
  var AScreenWidth, AScreenHeight: Integer);
var
  aspect_ratio: Single;
  P: PAVStream;
begin
  // show media file info
  Log.Add(Format('%s %s',[DateTimeToStr(Now),FFPlayer.Decoder.FileInfoText]));

  // aspect ratio
  if FFPlayer.VideoStreamIndex >= 0 then
  begin
    P := PPtrIdx(FFPlayer.Decoder.FileHandle.streams, 0);
    with P.codec^ do
    begin
      if (sample_aspect_ratio.num <> 0) and (sample_aspect_ratio.den <> 0) then
        aspect_ratio := sample_aspect_ratio.num / sample_aspect_ratio.den
      else
        aspect_ratio := 1.0;
      aspect_ratio := aspect_ratio * width / height;
    end;
    Log.Add(Format('%s aspect ratio: %f',[DateTimeToStr(Now),aspect_ratio]));
  end;

  // show information
  Log.Add(Format('%s duration: %f, frame size: %dx%d',
    [DateTimeToStr(Now), ADuration / 1000, AFrameWidth, AFrameHeight]));

  // tell player the screen size
  if Assigned(FScreenControl) then
  begin
    // win control
    AScreenWidth := FScreenControl.Width;
    AScreenHeight := FScreenControl.Height;
  end
  else
  begin
    // desktop
    AScreenWidth := Screen.DesktopWidth;
    AScreenHeight := Screen.DesktopHeight;
  end;

  // duration of media file
  FDuration := ADuration;
  FTrackChanging := False;
end;

procedure TfJudgeCtrl.FFLogger1Log(Sender: TObject; AThreadID: Integer;
  ALogLevel: TLogLevel; const ALogMsg: String);
begin
  Log.Add(DateTimeToStr(Now)+' #' + IntToStr(AThreadID) + '.' + IntToStr(Ord(ALogLevel)) + ': ' + ALogMsg);
end;

procedure TfJudgeCtrl.Timer1Timer(Sender: TObject);
begin
  inc( DelayTime );
  if (DelayTime >= PAUSETIME) then begin
    Timer1.Enabled := false;
    InitMode(mEdit);
  end;
{ //нужен ли отсчет 15сек за который должны высказаться несогласные?
  case CurrentMode of
  mConfirm: begin
    lbTime.Caption := IntToStr(PAUSECONFIRM - DelayTime);
    if (DelayTime >= PAUSECONFIRM) then begin // ждать принятия решения PAUSECONFIRM секунд
      Timer1.Enabled := false;
    end;
  end;
  mScoring:
    if (DelayTime >= PAUSETIME) then begin
      InitMode(mEdit);
      Timer1.Enabled := false;
    end;
  else begin end;
  end;
}
end;


// capture video frame
procedure TfJudgeCtrl.btnCaptureClick(Sender: TObject);
var
  BMP: TBitmap;
  FileName: string;
begin
{ uses JPEG;
  BMP := TBitmap.Create;
  try
    BMP.Assign(FFPlayer.CurrentFrame);
    FileName := IntToStr(FFPlayer.CurrentPos)+'.jpg';
    if BMP.Width > 0 then begin
          with TJPEGImage.Create do
          try
            Assign(BMP);
            SaveToFile(FileName)
          finally
            Free;
          end;
    end;
  finally
    BMP.Free;
  end;
}
end;


{******************************************
  Перетягивание индикаторов фрагмента
******************************************}
procedure TfJudgeCtrl.LabelMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    TLabel(Sender).BeginDrag(True);
end;

{*******************************************
  Обработка кнопок управления
*******************************************}
// запускаем оценку первый раз
procedure TfJudgeCtrl.btnScoringFirstClick(Sender: TObject);
var i, j: integer;
begin
  // можно просто btnScoringFirst.Enabled := DataJudge.qryList.IsEmpty;
  if DataJudge.qryList.IsEmpty then begin
    TInfoThr.Create(fMain, EMPTYLISTMSG);
    Exit;
  end;

  MAXTIME := DataMain.tblCompetitionWorkTime.Value;
  with DataJudge do begin
    ROUNDID := qryList.FieldByName('Result_ID').AsInteger;
    TeamName := qryList.FieldByName('TeamName').AsString;
    RoundName:= qryList.FieldByName('Round_Num').AsString;
    VideoFileName := VIDEODIRECTORY+qryList.FieldByName('VideoFile').AsString;
  end;
  with TABSQuery.Create(Self) do begin
    try
      DatabaseName :=  'dbJudge';
      SQL.Add('SELECT t.Type_ID, t.Name, t.ShortName, t.Mask, t.Proto, tsk.Columns, tsk.MQP');
      SQL.Add('FROM RoundResult rr LEFT JOIN Round r ON (rr.Round_ID=r.Round_ID)');
      SQL.Add('LEFT JOIN Type t ON (t.Type_ID=r.Round_Type) LEFT JOIN Task tsk ON (tsk.Type_ID=r.Round_Type)');
      SQL.Add('WHERE rr.Result_ID =:Result_ID');
      Params[0].AsInteger := ROUNDID;
      Open;
      POINTMASK := FieldByName('Mask').Value;
      MAXPOINTS := Length(POINTMASK);
      MINPOINTS := FieldByName('MQP').Value;
      ColumnsName.CommaText := FieldByName('Columns').AsString;
      Close;
      // проверка разрешенного типа соревнования
      if (((Convert(License^.EventType) shr FieldByName('Type_ID').AsInteger) and 1) = 0) then begin
        ShowMessage(LICENSETYPEMSG);
      {  Randomize;
        fCopyright := TfCopyright.Create(Self);
        TDelayThr.Create(TForm(fCopyright), Random(FALSELICENSETIME)*1000);
        fCopyright.ShowModal;
        fCopyright.Free;}
      end;
    finally
      Free;
    end;
  end;

   { Запрос рассчета результат тура }
    //для Points=14, Times=15, Errors=16, Calc=17
    with DataMain.qryCalcResult do begin
      SQL.Clear;
      if DataMain.qryGetQuery.Locate('Query_ID',17,[]) then
         SQL.Add( DataMain.qryGetQuery.FieldByName('Query_SQL').Value );
      Params[0].AsInteger := ROUNDID;
    end;

  {запросы ведомостей оценок, времени и ошибок}
    with DataJudge.qryScore do begin
      SQL.Clear;
      if DataMain.qryGetQuery.Locate('Query_ID',14,[]) then
         SQL.Add( DataMain.qryGetQuery.FieldByName('Query_SQL').Value );
      for j := 0 to ParamCount-1 do Params[j].AsInteger := ROUNDID;
    end;
    with DataJudge.qryTime do begin
      SQL.Clear;
      if DataMain.qryGetQuery.Locate('Query_ID',15,[]) then
         SQL.Add( DataMain.qryGetQuery.FieldByName('Query_SQL').Value );
      for j := 0 to ParamCount-1 do Params[j].AsInteger := ROUNDID;
    end;
    with DataJudge.qryError do begin
      SQL.Clear;
      if DataMain.qryGetQuery.Locate('Query_ID',16,[]) then
         SQL.Add( DataMain.qryGetQuery.FieldByName('Query_SQL').Value );
      for j := 0 to ParamCount-1 do Params[j].AsInteger := ROUNDID;
    end;

  for i := 0 to High(PortState) do begin
    // Показывает состояние только подключенные консолей
    TLabel(FindComponent('lbPoint'+IntToStr(i+1))).Visible := true;
    with PortState[i] do
      if Form = nil then begin
        Form := TfJudgeConsol.Create(Self);
        with TfJudgeConsol(Form) do begin
          lbInfo.Caption := Format(JUDGINGTITLE, [DataMain.tblCompetitionName.Value,
            RoundName, TeamName, ChChar(DataMain.tblRoundPool_Sequence_Code.AsString)]);
//              for j := 2 to grdJumpResult.Columns.Count-1 do
//                grdJumpResult.Columns[i].Title.Caption := ColumnsName[i-2];
          PortNum := i;
          Show;
        end;
      end;
  end;

  // заставляем TScreen обновить списки
  Screen.MonitorFromWindow(0, mdNull);  // зачем это надо?!
  StartPort := StartTimerPorts.ItemIndex;
  InitMode(mReady);

   // try to open and play media file, render on the custom window specified by handle
  if FFPlayer.Open(VideoFileName, pnlPerview.Handle, false) then begin
    Part := false;   // флаг просмотра фрагмента
    DirectoryWatch1.Active := false;
    inc(View);  //Счетчик просмотров

    VideoPartStart := 0;
    VideoPartEnd := FDuration;
    Log.Add(Format(REVIEWFRAMEMSG,[VideoPartStart,VideoPartEnd]));    
    Reset;
  end
  else
    Log.Add(FFPlayer.LastErrMsg);
end;

// повторный просмотр
procedure TfJudgeCtrl.btnScoringMoreClick(Sender: TObject);
var i, j: integer;
begin
  for j := 0 to High(PortState) do      // сохранить предыдущий просмотр
    for i := 0 to MAXPOINTS do
      SwapVars2(PortState[j].Scores[i], PortState[j].PScores[i], SizeOf(TPoint));

   // try to open and play media file, render on the custom window specified by handle
  if FFPlayer.Open(VideoFileName, pnlPerview.Handle, false) then begin
    Part := false;   // флаг просмотра фрагмента
    DirectoryWatch1.Active := false;
    inc(View);  //Счетчик просмотров

    VideoPartStart := StartTime - PAUSETIME * 1000000;
    if VideoPartStart < 0 then VideoPartStart := 0;

    VideoPartEnd := StartTime + MAXTIME * 1000000;
    if VideoPartEnd > FDuration then VideoPartEnd := FDuration;
    Log.Add(Format(REVIEWFRAMEMSG,[VideoPartStart,VideoPartEnd]));
    Reset;
  end
  else
    Log.Add(FFPlayer.LastErrMsg);
end;

// смотрим фрагмент
procedure TfJudgeCtrl.btnPlayClick(Sender: TObject);
begin
   // try to open and play media file, render on the custom window specified by handle
  if FFPlayer.Open(VideoFileName, pnlPerview.Handle, false) then begin
    Part := true;
    DirectoryWatch1.Active := false;
    inc(View);  //Счетчик просмотров

    VideoPartStart := TIntObj(ComboBox1.Items.Objects[ComboBox1.ItemIndex]).I;
    VideoPartEnd := TIntObj(ComboBox2.Items.Objects[ComboBox2.ItemIndex]).I;

    Log.Add(Format(REVIEWFRAMEMSG,[VideoPartStart,VideoPartEnd]));
    InitMode(mStandby);
  end
  else
    Log.Add(FFPlayer.LastErrMsg);
end;

// кнопка пауза
procedure TfJudgeCtrl.btnPauseClick(Sender: TObject);
begin
  FFPlayer.TogglePause;
end;

// редактируем снова
procedure TfJudgeCtrl.btnEditClick(Sender: TObject);
begin
  InitMode(mEdit);
  ReOpenDataset(DataJudge.qryList);
end;

// выходим
procedure TfJudgeCtrl.btnSaveClick(Sender: TObject);
begin
   {сохранить результат из Memory в базу}
  with TABSQuery.Create(Self) do begin
    SQL.Add('INSERT INTO ViewDetail SELECT v.*, jr.Judge_ID FROM MEMORY ViewDetail v ');
    SQL.Add('LEFT JOIN (SELECT Result_ID, Judge_ID, Port-1 Monitor, IsTrainee FROM RoundResult r, Judges j ');
    SQL.Add(' WHERE Port IS NOT NULL AND r.Competition_ID=j.Competition_ID  AND r.Result_ID=:Result_ID) jr ON (v.Monitor=jr.Monitor);');
    SQL.Add('INSERT INTO ResultDetail SELECT * FROM MEMORY ResultDetail;');
    SQL.Add('DELETE FROM MEMORY ViewDetail; DELETE FROM MEMORY ResultDetail;');
    SQL.Add('UPDATE RoundResult rr SET JudgeTime=Now,ViewNumber =:ViewNumber, StartTime = :StartTime WHERE rr.Result_ID=:Result_ID');
    DatabaseName := 'dbJudge';
    DataSource := DataMain.dsComp;
    Params[0].AsInteger := ROUNDID;
    Params[1].AsInteger := View;
    Params[2].AsInteger := StartTime;
    Params[3].AsInteger := ROUNDID;
    ExecSQL;
    Free;
  end;

  Log.Add(Format(CLOSEMSG,[DateTimeToStr(Now)]));
  ReOpenDataset(DataJudge.qryList);
  btnScoringFirst.Enabled := not DataJudge.qryList.IsEmpty;
  InitMode(mEnd);
  DirectoryWatch1.Active := true;
end;

constructor TIntObj.Create;
begin
  inherited Create;
  FI := IValue;
end;

procedure TfJudgeCtrl.ClearBreakpoint;
var i : integer;
begin
  // удаляем все метки
  with ComboBox1 do begin
    for i := 0 to Items.Count-1 do
      Items.Objects[i].Free;
    Clear;
  end;
  ComboBox2.Clear;
  // Items.Objects одни для обоих ComboBox 
end;

procedure TfJudgeCtrl.MakeBreakpoint;
var i : integer;
  MyList: TStrings;
begin
  MyList := TStringList.Create;
  MyList.AddObject('Начало Видео',TIntObj.Create(0));
  MyList.AddObject('Старт Раб.Времени',TIntObj.Create(StartTime));
  MyList.AddObject('Стоп Раб.Времени',TIntObj.Create(StartTime + MAXTIME * 1000000));
  MyList.AddObject('Конец Видео',TIntObj.Create(FDuration));
  with DataJudge.qryTime do begin
    Last;
    for i:= 2 to FieldCount-2 do
      if Fields[i].IsNull then
        continue  
      else
        MyList.AddObject(Format('%d Формация',[i-1]), TIntObj.Create(StartTime+Round(Fields[i].Value) * 1000000));
  end;
  ComboBox1.Items.AddStrings(MyList);
  ComboBox1.ItemIndex := 1;
  ComboBox2.Items.AddStrings(MyList);
  ComboBox2.ItemIndex := 2;
  MyList.Free;
end;

procedure TfJudgeCtrl.StartTimerPortsClick(Sender: TObject);
begin
  StartPort := StartTimerPorts.ItemIndex;
end;

procedure TfJudgeCtrl.Button1Click(Sender: TObject);
begin
  try
    fSettimgs := TfSettimgs.Create(Self);
    if (fSettimgs.ShowModal = mrOK) then 
      ReOpenDataset(DataJudge.qryList);
  finally
    btnScoringFirst.Enabled := not DataJudge.qryList.IsEmpty;
    fSettimgs.Free;
  end;
end;

procedure TfJudgeCtrl.Button2Click(Sender: TObject);
begin
  try
    with dlDivePool do begin
      List1.DelimitedText := DataJudge.qryList.FieldByName('Pool_Sequence').AsString;
      List2.Clear;
      if Execute and (List1.Count=0) then
        with DataMain.tblTeamRound do begin
          Open;
          if Locate('Result_ID',DataJudge.qryList.FieldByName('Result_ID').AsInteger,[]) then begin
            Edit;
            FieldByName('Pool_Sequence').AsString := List2.CommaText;
            Post;
          end;
        end;
    end
  finally
    ReOpenDataset(DataJudge.qryList);
  end;
end;

procedure TfJudgeCtrl.Button3Click(Sender: TObject);
var i : integer;
begin
(*
  // показать панель Draw на всех консолях ?!
  for i := 0 to High(PortState) do
    if PortState[i].Form <> nil then //только при судействе
      with TfJudgeConsol(PortState[i].Form) do begin
        PANELSVISIBLE := PANELSVISIBLE xor JC_DRAW;
        Refresh;
      end
    else begin {надо создавать консоли и выводить} end;
*)
end;

procedure TfJudgeCtrl.chkVerticalFlipClick(Sender: TObject);
begin
  // toggle enable/disable vertical flip
  FFPlayer.VerticalFlip := chkVerticalFlip.Checked;
end;

procedure TfJudgeCtrl.DirectoryWatch1Change(Sender: TObject);
begin
  ReOpenDataset(DataJudge.qryList);
  btnScoringFirst.Enabled := not DataJudge.qryList.IsEmpty;
end;


procedure TfJudgeCtrl.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  btnScoringFirst.Enabled := not DataJudge.qryList.IsEmpty;
end;

procedure TfJudgeCtrl.ComboBox1Change(Sender: TObject);
begin
  Log.Add(Format('Установлен начало фрагмента %d',
    [TIntObj(ComboBox1.Items.Objects[ComboBox1.ItemIndex]).I]));
end;

procedure TfJudgeCtrl.ComboBox2Change(Sender: TObject);
begin
  Log.Add(Format('Установлен конец фрагмента %d',
    [TIntObj(ComboBox1.Items.Objects[ComboBox2.ItemIndex]).I]));
end;

procedure TfJudgeCtrl.N1Click(Sender: TObject);
begin
  ComboBox1.ItemIndex := TDBGrid(Sender).SelectedIndex+2;
end;

procedure TfJudgeCtrl.N2Click(Sender: TObject);
begin
  ComboBox2.ItemIndex := TDBGrid(Sender).SelectedIndex+2;
end;

end.

