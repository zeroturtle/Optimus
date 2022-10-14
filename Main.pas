unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, StdCtrls, cxControls, CnRawInput, cxContainer,
  cxEdit, cxLabel, frxClass, frxCross, ExtCtrls, DateUtils,
  IdBaseComponent, IdComponent, IdUDPBase, IdUDPServer, IdTrivialFTPServer;

type
  TfMain = class(TForm)
    MainMenu1: TMainMenu;
    OPTIMUS: TMenuItem;
    Dictionary: TMenuItem;
    Pool: TMenuItem;
    Roles: TMenuItem;
    People: TMenuItem;
    StatusBar1: TStatusBar;
    N6: TMenuItem;
    OneScore1: TMenuItem;
    Window: TMenuItem;
    Title: TMenuItem;
    Arrange: TMenuItem;
    Competition: TMenuItem;
    Exit: TMenuItem;
    HistoryListBox: TMemo;
    Log: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N9: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    CloseAll: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N10: TMenuItem;
    N12: TMenuItem;
    Service: TMenuItem;
    N11: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N13: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    IdTrivialFTPServer1: TIdTrivialFTPServer;
    procedure PoolClick(Sender: TObject);
    procedure TitleClick(Sender: TObject);
    procedure ArrangeClick(Sender: TObject);
    procedure RolesClick(Sender: TObject);
    procedure PeopleClick(Sender: TObject);
    procedure CompetitionClick(Sender: TObject);
    procedure ExitClick(Sender: TObject);
    procedure LogClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ChecklistClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure CloseAllClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure OneScore1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N13Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure IdTrivialFTPServer1ReadFile(Sender: TObject;
      var FileName: String; const PeerInfo: TPeerInfo;
      var GrantAccess: Boolean; var AStream: TStream;
      var FreeStreamOnComplete: Boolean);
    procedure IdTrivialFTPServer1WriteFile(Sender: TObject;
      var FileName: String; const PeerInfo: TPeerInfo;
      var GrantAccess: Boolean; var AStream: TStream;
      var FreeStreamOnComplete: Boolean);
    procedure IdTrivialFTPServer1TransferComplete(Sender: TObject;
      const Success: Boolean; const PeerInfo: TPeerInfo; AStream: TStream;
      const WriteOperation: Boolean);
  private
    { Private declarations }
    TFTPPath : String;    
    procedure RawKeyDown(Sender: TObject; Key: Word; FromKeyBoard: THandle);
    procedure RawKeyUp(Sender: TObject; Key: Word; FromKeyBoard: THandle);
    function OpenForm(FormID: TGUID): boolean;
  public
    FormID : TGUID;
    { Public declarations }
  end;

  TMonInfo = record
    h:  THandle;
    dc: HDC;
    r:  TRect;
  end;


var
  fMain: TfMain;
  R: TCnRawKeyBoard;            // это переменная для клавиатуры
  MonList: array of TMonInfo;


implementation
uses Pool, Roles, People, Comps, Result, Print, Select, Jpeg, StrUtils,
     constant, shf_FormAbstract, options, Team, Country, Judges,
  wthread, About, Splash, XPBase64, Error, Club, Unit5, SplashScr, JCtrl,
  ScreenForm, iResult, fLicense;

{$R *.dfm}

  
procedure TfMain.TitleClick(Sender: TObject);
begin
  Tile;
end;

procedure TfMain.ArrangeClick(Sender: TObject);
begin
  ArrangeIcons;
end;

procedure TfMain.PoolClick(Sender: TObject);
begin
  Tfd_Pool.Create(Self);
end;

procedure TfMain.RolesClick(Sender: TObject);
begin
  if OpenForm(Role_GUID) then TfRoles.Create(Self);
end;

procedure TfMain.PeopleClick(Sender: TObject);
begin
  if OpenForm(People_GUID) then TfPeople.Create(Self);
end;

procedure TfMain.CompetitionClick(Sender: TObject);
begin
  if OpenForm(Competition_GUID) then TfCompetition.Create(Self);
end;

procedure TfMain.ChecklistClick(Sender: TObject);
var atom : integer;
begin
  if OpenForm(Result_GUID) then TfResult.Create(Self);
{
  if (GlobalFindAtom('THIS_IS_SOME_OBSCUREE_TEXT') = 0) or CanJudge then begin
    atom := GlobalAddAtom('THIS_IS_SOME_OBSCUREE_TEXT');
      if OpenForm(Result_GUID) then TfResult.Create(Self);
  end
  else begin
    ShowMessage('This programm will start only once'+ CR+LF +
      'for next start reboot windows please, or...' + CR+LF +
      'REGISTER PROGRAM !!');
    Close;
  end;
}
end;

function CompareGUID(GUID1, GUID2: TGUID): boolean;
begin
  Result:= GUIDToString(GUID1) = GUIDToString(GUID2);
end;

function TfMain.OpenForm;
var i: Integer;
begin
  Result := true;
  For i := 0 To fMain.MDIChildCount - 1 do
    if (GUIDToString(Tfsh_FormAbstract(fMain.MDIChildren[i]).FormID)= GUIDToString(FormID)) or
       (GUIDToString(TfJudgeCtrl(fMain.MDIChildren[i]).FormID)= GUIDToString(FormID)) then begin
      fMain.MDIChildren[i].Show; Result := false; break;
    end;
end;

procedure TfMain.ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfMain.LogClick(Sender: TObject);
begin
  Log.Checked := not Log.Checked;
  HistoryListBox.Visible := Log.Checked;
end;

procedure TfMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (MessageDlg(APPCLOSEMSG, mtConfirmation, [mbYes,mbNo], 0) = mrYes) then
    CanClose := true
  else
    CanClose := False;
end;

procedure TfMain.FormShow(Sender: TObject);
var i : byte;
begin
  CloseAllClick(Sender);
  with TfSelection.Create(Self) do
    try
      if ShowModal = mrOk then begin
        // выбранное соревнование принадлежит списку
        N18.Enabled := ((Convert(WSCPEvents) shr DataMain.tblCompetition.FieldByName('Type_ID').AsInteger and 1) = 1) and License^.Active;
        N19.Enabled := ((Convert(FSEvents+AEEvents) shr DataMain.tblCompetition.FieldByName('Type_ID').AsInteger and 1) = 1) and License^.Active;
      end
      else begin
        // если не выбрано соревнование
        N18.Enabled := false;
        N19.Enabled := false;
      end;
    finally
      Free;
    end;

  Caption := Format('%s - "%s"',[APPLICATIONCAPTION, DataMain.tblCompetitionName.AsString]);
  SetLength( PortState, MAXPORTS );
    // TFTP
  if USEFTP and DirectoryExists(VIDEODIRECTORY) then begin
    IdTrivialFTPServer1.ThreadedEvent := USEFTP;
    IdTrivialFTPServer1.Active := USEFTP;
    { Set the path to where the files will be stored/retreived }
    TFTPPath := IncludeTrailingPathDelimiter(VIDEODIRECTORY);
  end;

  if OpenForm(Competition_GUID) then TfCompetition.Create(Self);
end;

{
function StreamToString(Stream:TStream): string;
var ms: TMemoryStream;
begin
  Result := '';
  ms := TMemoryStream.Create;
  try
    ms.LoadFromStream(Stream);
    SetString(Result, PChar(ms.memory), ms.size);
  finally
    ms.Free;
  end;
end;
}

procedure TfMain.FormCreate(Sender: TObject);
var i: integer;
   S : TFileStream;
   sz, skip: dword;
   RS : String;
   Flags: dword;

  jp:TJpegImage;
begin
// считываем параметры командной строки
  DATABASEFILE := ChangeFileExt(ParamStr(0), '.abs');  // имя файла БД по умолчанию
  LicenseFile := ChangeFileExt(ParamStr(0), '.lic');   // файл лицензии
  PicFileName := ChangeFileExt(ParamStr(0), '.jpg');   // фоновая картинка на главной форме
  LogFileName := ChangeFileExt(ParamStr(0), '.log');   // название лог-файла
//  MultiuserDBMode := false;                            // требуется покупка AD
  i := 1;
  while i <= ParamCount do begin
    case AnsiIndexStr(LowerCase(ParamStr(i)),
                          [cmdDatabase, cmdDatabaseShort, cmdLicense, cmdLicenseShort,
                           cmdWallpaper, cmdWallpaperShort, cmdLogFile, cmdLogFileShort,
                           cmdMultiuser, cmdMultiuserShort, cmdHelp, cmdHelpShort]) of
      0,1: if ParamStr(i+1) <> '' then DATABASEFILE := ParamStr(i+1); //'.abs'
      2,3: if ParamStr(i+1) <> '' then LicenseFile := ParamStr(i+1);  //'.lic'
      4,5: if ParamStr(i+1) <> '' then PicFileName := ParamStr(i+1);  //'.jpg'
      6,7: if ParamStr(i+1) <> '' then LogFileName := ParamStr(i+1);  //'.log'
      8,9: MultiuserDBMode := true;
      10,11: begin ShowMessage(HELPCONTENT);
                   Application.Terminate;
             end; // Показать справку после запуска
      else ;
    end;
    inc(i);
  end;

//*****************************
// Создаем лицензию
//*****************************
  GetMem(License, SizeOf(TLicense));
  try
    // читаем лицензию из файла
    S := TFileStream.Create(LicenseFile,fmOpenRead);
    sz := S.Size;
    SetLength(RS, sz);
    S.Read(pointer(RS)^,sz);
    CryptStringToBinary(pointer(RS), Length(RS), Flags, pointer(License), sz, skip, Flags);
    S.Free;
    License^.Active := (CompareDateTime(Now, License^.DateStart) >= 0) and
                       (CompareDateTime(License^.DateEnd, Now) >= 0);
    // простроченная дата лицензии
    if not License^.Active then
      if ShowLicenseDlg(License) then begin
        HistoryListBox.Lines.Add(LICENSEEXPIREDMSG);
      end;
  except
    if ShowLicenseDlg(License) then begin
      HistoryListBox.Lines.Add(LICENSEMSG);
    end;
  end;
  MAXPORTS := License^.QtyLicense;

  FormID := Main_GUID;
  Caption := APPLICATIONCAPTION;
  StatusBar1.Panels[0].Text := Format(APPVERSIONNUMBER,[AppVersion(Application.ExeName)]);

  // загружаем фоновую картинку на главной форме
  if FileExists(PicFileName) then
    try
      jp := TJpegImage.Create;
      jp.LoadFromFile(PicFileName);
      BackgoundPic := TBitmap.Create;
      BackgoundPic.Assign(jp);
      jp.Free;
    except
      on EInvalidGraphic do
          BackgoundPic.Free;
    end;

  HistoryListBox.Lines.Add(Format(MONITORCOUNTMSG, [DateTimeToStr(Now),Screen.MonitorCount]));
  for i := 0 to High(MonList) do   // прочитать разрешение всех подключенных экранов
    with MonList[i] do
      HistoryListBox.Lines.Add(Format(MONITORRESMSG, [DateTimeToStr(Now),i,h,dc,r.Left,r.Top,r.Right,r.Bottom]));

  R := TCnRawKeyBoard.Create(Self);
  R.OnRawKeyDown := RawKeyDown;
  R.OnRawKeyUp := RawKeyUp;
  CanJudge := false;
end;

procedure TfMain.N9Click(Sender: TObject);
begin
  try
    fPrint := TfPrint.Create(MainMenu1);
    if fPrint.ShowModal = mrOK then begin
    end;
  finally
     fPrint.Free;
  end;
end;

procedure TfMain.CloseAllClick(Sender: TObject);
var i: integer;
begin
  for i:= 0 to MdiChildCount - 1 do
    MDIChildren[i].Close;
end;

procedure TfMain.FormDestroy(Sender: TObject);
begin
  R.Free;
  BackgoundPic.Free;
  Finalize( PortState );
  FreeMem(License);
end;


procedure TfMain.RawKeyDown(Sender: TObject; Key: Word; FromKeyBoard: THandle);
var i, L : integer;
begin
  if CanJudge then
    CodeAction(GetScanCode(FromKeyBoard, Key))
  else
    //активация клавиатур консолей
    if (Key in [VK_NUMPAD1..VK_NUMPAD5]) then
      if (Key-VK_NUMPAD0 > MAXPORTS) then
        TInfoThr.Create(fMain, Format(CONSNUMERRORMSG,[Key-VK_NUMPAD0]))
      else
        if (PortState[Key-VK_NUMPAD1].KeyBoard = 0) then begin
          PortState[Key-VK_NUMPAD1].KeyBoard := FromKeyBoard;
          ChangeMode(Key-VK_NUMPAD1, mIdle);
          // закрыть форму приглашения активации
          FreeAndNil(PortState[Key-VK_NUMPAD1].Form);
          // вывести номер на экран консоли
          with TSplashForm.Create(Self) do begin
            if Screen.MonitorCount > 1 then begin
               L := 0; i := 0;
               repeat L := L + Screen.Monitors[i].Width; inc(i); until i >= FIRSTJUDGEMONITORNUM+Key-VK_NUMPAD1;
               Left := L;
            end
            else
               Left := 0;
            Label1.Caption :=  IntToStr(Key-VK_NUMPAD0); //номер пульта
          end;
          HistoryListBox.Lines.Add(Format(CONSACTIVATEDMSG,[Key-VK_NUMPAD1]));
        end;
end;

procedure TfMain.RawKeyUp(Sender: TObject; Key: Word; FromKeyBoard: THandle);
begin
  ;
end;

procedure TfMain.N10Click(Sender: TObject);
var i, j, L : integer;
    W: integer;
begin
  with (Sender as TMenuItem) do begin
    Checked := not Checked;
    R.Enabled := Checked;
    N8.Enabled := Checked;
    if Checked then begin
      StatusBar1.Panels[1].Text := CONSOLACTIVE;
      for i:= 0 to High(PortState) do begin
        PortState[i].KeyBoard := 0;
        //вывести форму форму приглашения активации
        PortState[i].Form := TForm.Create(Self);
        with PortState[i].Form do begin
          with TLabel.Create(PortState[i].Form) do begin
            Parent := PortState[i].Form;
            Caption := Format(INVITEPORTMSG,[MAXPORTS]);
            Font.Size := 19;
            Top := 15;
            Left := 30;
            W := Canvas.TextWidth(Caption) + Left + 26;
          end;
          with TBevel.Create(PortState[i].Form) do begin
            Parent := PortState[i].Form;
            Left := 8;
            Top := 8;
            Width := W - 16;
            Height := 44;
          end;
          BorderStyle := bsNone;
          Left :=  - 150;
          Height := 60;
          if Screen.MonitorCount > 1 then begin
             L := 0;
             for j := 0 to FIRSTJUDGEMONITORNUM+i do
               L := L + Screen.Monitors[j].Width;
             Left := L;
             Top := Screen.Monitors[FIRSTJUDGEMONITORNUM+i].Height div 2;
          end
          else begin
            Left := Screen.Monitors[0].Width div 2 - W div 2;
            Top := Screen.Monitors[0].Height div 2;
          end;
          Width := W;
          Show;
        end;
        //--------------
      end;
    end
    else begin
      StatusBar1.Panels[1].Text := CONSOLINACTIVE;
        // закрыть форму приглашения активации
      for i:= 0 to High(PortState) do
        FreeAndNil(PortState[i].Form);
    end;
  end;
end;

procedure TfMain.N8Click(Sender: TObject);
begin
  if OpenForm(Scoring_GUID) then fJudgeCtrl := TfJudgeCtrl.Create(Self);
end;

procedure TfMain.N12Click(Sender: TObject);
begin
  try
    fOptions := TfOptions.Create(Self);
    fOptions.ShowModal;
  finally
    fOptions.Free;
  end;
  if USEFTP and DirectoryExists(VIDEODIRECTORY) then begin
    // TFTP
    IdTrivialFTPServer1.ThreadedEvent := USEFTP;
    IdTrivialFTPServer1.Active := USEFTP;
    { Set the path to where the files will be stored/retreived }
    TFTPPath := IncludeTrailingPathDelimiter(VIDEODIRECTORY);
    // -TFTP
  end;
  SetLength( PortState, MAXPORTS );
end;

procedure TfMain.N11Click(Sender: TObject);
begin
  if OpenForm(Team_GUID) then TfTeam.Create(Self);
end;

procedure TfMain.N14Click(Sender: TObject);
begin
  if OpenForm(Judge_GUID) then TfJudge.Create(Self);
end;

procedure TfMain.N16Click(Sender: TObject);
begin
  if OpenForm(Country_GUID) then TfCountry.Create(Self);
end;

procedure TfMain.OneScore1Click(Sender: TObject);
begin
  About.ShowAboutBox;
end;

procedure TfMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  I: Integer;
  Stream: TFileStream;
begin
  // на всякий случай отключаем монитор и FTP
  IdTrivialFTPServer1.ThreadedEvent := false;
  IdTrivialFTPServer1.Active := false;

  with fMain do
    for I := MDIChildCount-1 downto 0 do
      MDIChildren[I].Close;
  try

    if FileExists(LogFileName) then begin
      Stream := TFileStream.Create(LogFileName, fmOpenReadWrite);
      Stream.Seek(0, soFromEnd );
    end
    else
      Stream := TFileStream.Create(LogFileName, fmCreate);
    HistoryListBox.Lines.SaveToStream(Stream);
  finally
    FreeAndNil(Stream);
  end;
end;

procedure TfMain.N13Click(Sender: TObject);
begin
  if OpenForm(Error_GUID) then TfError.Create(Self);
end;

procedure TfMain.N17Click(Sender: TObject);
begin
  if OpenForm(Club_GUID) then TfClub.Create(Self);
end;

procedure TfMain.N18Click(Sender: TObject);
begin
  if OpenForm(Member_Result_GUID) then TfIndResult.Create(Self);
end;

procedure TfMain.FormPaint(Sender: TObject);
begin
  Canvas.StretchDraw(rect(0, 0, ClientWidth, ClientHeight), BackgoundPic); // выводим вписанным в квадрат
end;

procedure TfMain.FormResize(Sender: TObject);
begin
  Invalidate;
end;

function EnumDisplayMonitors(dc: HDC; rect: PRect; EnumProc: pointer; lData: LPARAM): BOOL; stdcall; external user32;
function MonitorEnumProc(hMonitor: THandle; hdcMonitor: HDC; lprcMonitor: DWORD; dwData: LPARAM): BOOL; stdcall;
type PRect = ^TRect;
var c: integer;
begin
  c := High(MonList)+1; SetLength(MonList, c+1);
  MonList[c].h := hMonitor;
  MonList[c].dc := hdcMonitor;
  MonList[c].r := PRect(lprcMonitor)^;
  result := true;
end;

procedure TfMain.IdTrivialFTPServer1ReadFile(Sender: TObject;
  var FileName: String; const PeerInfo: TPeerInfo;
  var GrantAccess: Boolean; var AStream: TStream;
  var FreeStreamOnComplete: Boolean);
Var
   FS : TFileStream;
begin
     FreeStreamOnComplete := True;
     Try
        { Convert UNIX style filenames to WINDOWS style }
        While Pos('/',Filename) <> 0 do Filename[Pos('/',Filename)] := '\';
        { Assure that the filename DOES NOT CONTAIN any path information }
        Filename := ExtractFileName( Filename );
        { Check if file exists }
        If FileExists( TFTPPath+Filename ) then
        Begin
          { Open file in READ ONLY mode }
          FS := TFileStream.Create( TFTPPath+Filename,
                                    fmOpenRead OR fmShareDenyWrite );
          { Assign stream to variable }
          AStream := FS;
          { Set parameters }
          GrantAccess := True;
        End Else
        Begin
          GrantAccess := False;
        End;
     Except
        { On errors, deny access }
        GrantAccess := False;
        If Assigned(FS) then FreeAndNil( FS );
     End;
end;

procedure TfMain.IdTrivialFTPServer1WriteFile(Sender: TObject;
  var FileName: String; const PeerInfo: TPeerInfo;
  var GrantAccess: Boolean; var AStream: TStream;
  var FreeStreamOnComplete: Boolean);
Var
   FS : TFileStream;
begin
     Try
        { Convert UNIX style filenames to WINDOWS style }
        While Pos('/',Filename) <> 0 do Filename[Pos('/',Filename)] := '\';
        { Assure that the filename DOES NOT CONTAIN any path information }
        Filename := ExtractFileName( Filename );
        { Open file in WRITE ONLY mode }
        FS := TFileStream.Create( TFTPPath+Filename,
                                  fmCreate OR fmShareExclusive );
        { Copy all the data }
        AStream := FS;
        { Set parameters }
        FreeStreamOnComplete := True;
        GrantAccess := True;
     Except
        { On errors, deny access }
        GrantAccess := False;
        If Assigned(FS) then FreeAndNil( FS );
     End;
end;

procedure TfMain.IdTrivialFTPServer1TransferComplete(Sender: TObject;
  const Success: Boolean; const PeerInfo: TPeerInfo; AStream: TStream;
  const WriteOperation: Boolean);
begin
     // Success = TRUE if the read/write operation was successfull
     // WriteOperation = TRUE if the client SENT a file to the server
     Try
        { Close the FileStream }
        If Assigned(AStream) then FreeAndNil(AStream);
     Except
     End;
end;
//---------- TFTP -------------


initialization
//  EnumDisplayMonitors(0, nil, Addr(MonitorEnumProc), 0);
end.

