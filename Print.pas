unit Print;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Grids, DBGrids, Dialogs, RXDBCtrl, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxNavigator, cxDBNavigator, cxButtonEdit, ComCtrls, ShlObj,
  cxShellCommon, cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxShellComboBox, Mask, RxToolEdit, frxCross, frxClass, frxDesgn,
  frxADOComponents, frxGradient;

type
  TfPrint = class(TForm)
    btnCancel: TButton;
    grd_GeneralDBTableView1: TcxGridDBTableView;
    grd_GeneralLevel1: TcxGridLevel;
    grd_General: TcxGrid;
    grd_GeneralDBTableView1Column3: TcxGridDBColumn;
    Panel1: TPanel;
    Panel2: TPanel;
    btnPreview: TButton;
    btnEdit: TButton;
    frxPrint: TfrxReport;
    btnAdd: TButton;
    btnDelete: TButton;
    frxDesigner1: TfrxDesigner;
    frxADOComponents1: TfrxADOComponents;
    frxGradientObject1: TfrxGradientObject;
    btnPrint: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure frxPrintBeginDoc(Sender: TObject);
    procedure frxPrintEndDoc(Sender: TObject);
  private
    { Private declarations }
    grd_ActiveGrid: TcxGrid;
    ActiveDataSet: TDataSet;
    procedure ActiveDataSetBeforeEdit(DataSet: TDataSet);
    procedure ActiveDataSetAfterPost(DataSet: TDataSet);
    procedure SetActiveGrid(ADBGrid:TcxGrid; IsActive: boolean);
    function getStringPixelWidth(Str: string; const uFont: TFont): integer;
  public
    { Public declarations }
    FormID: TGUID;
  end;

var
  fPrint: TfPrint;

implementation

uses Variants, Unit5, constant, ABSMain, StrUtils, frxDBSet;

{$R *.dfm}


function TfPrint.getStringPixelWidth(Str: string; const uFont: TFont): integer;
var
  DC : HDC;
  size : TSize;
  SaveFont : hFont;
begin
  result := -1;
  DC := GetDC(0);
  SaveFont := SelectObject(DC, uFont.Handle);
  try
    if GetTextExtentPoint(DC, PChar(Str), Length(Str), size) then result := size.cx;
  finally
    SelectObject(DC, SaveFont);
    ReleaseDC(0, DC);
  end;
end;

procedure TfPrint.FormCreate(Sender: TObject);
begin
  FormID := Print_GUID;
  SetActiveGrid(grd_General, true);
  ActiveDataSet := DataMain.tblPrint;
  ActiveDataSet.Filter := Format('Print_Form=''%s''',[GUIDToString(ActiveForm)]);
  ActiveDataSet.BeforeEdit := ActiveDataSetBeforeEdit;
  ActiveDataSet.AfterPost := ActiveDataSetAfterPost;
  ActiveDataSet.BeforeInsert := ActiveDataSetBeforeEdit;
  ActiveDataSet.Open;
end;

procedure TfPrint.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ActiveDataSet.Close;
end;

procedure TfPrint.btnPreviewClick(Sender: TObject);
begin
  with frxPrint do begin
    if not FileExists(ExtractFilePath(ParamStr(0))+REPORTDIRECTORY + DataMain.tblPrint.FieldByName('Print_Template').AsString) then
      raise Exception.Create('В папке печатных форм не найден файл : ' + DataMain.tblPrint.FieldByName('Print_Template').AsString)
    else begin
      LoadFromFile(ExtractFilePath(ParamStr(0))+REPORTDIRECTORY + DataMain.tblPrint.FieldByName('Print_Template').AsString);
      if (Sender as TButton).Tag = 1 then ShowReport()
      else Print();
    end;
  end;
end;

procedure TfPrint.btnEditClick(Sender: TObject);
begin
  with frxPrint do begin
    if not FileExists(ExtractFilePath(ParamStr(0))+REPORTDIRECTORY + DataMain.tblPrint.FieldByName('Print_Template').AsString) then
      raise Exception.Create('В папке печатных форм не найден файл : ' + DataMain.tblPrint.FieldByName('Print_Template').AsString)
    else begin
      LoadFromFile(ExtractFilePath(ParamStr(0))+REPORTDIRECTORY + DataMain.tblPrint.FieldByName('Print_Template').AsString);
      DesignReport();
    end;
  end;
end;

procedure TfPrint.btnAddClick(Sender: TObject);
var OpenDlg : TOpenDialog;
begin
  ActiveDataSet.Insert;
  OpenDlg := TOpenDialog.Create(Self);
  with OpenDlg do begin
    Filter := 'FastReport files (*.fr3)|*.fr3';
    InitialDir := 'Reports';
    try
      if Execute then begin
        ActiveDataSet.Edit;
        ActiveDataSet.FieldByName('Print_Template').AsVariant := ExtractFileName(FileName);
        ActiveDataSet.FieldByName('Print_Form').AsString := GUIDToString(ActiveForm);
      end
    finally
      Free;
    end;
  end;
end;

procedure TfPrint.btnDeleteClick(Sender: TObject);
begin
  ActiveDataSet.Delete;
end;

procedure TfPrint.ActiveDataSetBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  if not DataSet.Active then exit;
  if Assigned(grd_ActiveGrid) then
 with  TcxGridDBTableView(grd_ActiveGrid.Levels[0].GridView) do begin
    OptionsBehavior.IncSearch := false;
    OptionsSelection.CellSelect := true;
  end;
end;

procedure TfPrint.ActiveDataSetAfterPost(DataSet: TDataSet);
begin
  inherited;
  if Assigned(grd_ActiveGrid)  then
  with  TcxGridDBTableView(grd_ActiveGrid.Levels[0].GridView) do begin
    OptionsBehavior.IncSearch := true;
    OptionsSelection.CellSelect := false;
  end;
end;

procedure TfPrint.SetActiveGrid(ADBGrid: TcxGrid; IsActive: boolean);
begin
  if not Assigned(ADBGrid) then Exit;
  if IsActive then
  begin
    grd_ActiveGrid := ADBGrid;
  end else
  begin
    grd_ActiveGrid:= nil;
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

procedure TfPrint.frxPrintBeginDoc(Sender: TObject);
var i: Integer;
  Memo: TfrxMemoView;
  Band: TfrxBand;
  Query_ID: Shortint;
  s : string;
begin
// добавляем строку для рекламы
  Band := frxPrint.FindObject('PageFooter1') as TfrxBand;

  // выводим владельца лицензии
  Memo := TfrxMemoView.Create(Band);
  Memo.CreateUniqueName;
  Memo.Text := APPLICATIONCAPTION + ' © 2022 ' +License^.Owner;
  Memo.Font.Size := 8;
  Memo.HAlign := haLeft;
  Memo.SetBounds(0,0,Band.Width-20,Band.Height);
//  Memo.SetBounds(0, 0, getStringPixelWidth(Memo.Text,Memo.Font), Band.Height);


//------------------------------------------------------
// переоткрыть все наборы данных перед открытием отчетов
//------------------------------------------------------
  for i := 1 to frxPrint.DataSets.Count do begin
    case ANSIIndexStr(frxPrint.DataSets.Items[i-1].DataSetName,
           ['frIndProtokol','frProtokol','frJudgeView','frShilders',
           'frRoundProtokol','frIndVedom','frRoundResult','frCompetition']) of
      0: Query_ID := 2;
      1: Query_ID := 4;
      2: Query_ID := 5;
      3: Query_ID := 6;
      4: Query_ID := 7;
      5: Query_ID := 8;
      7: Query_ID := 9;
      9: Query_ID := 12;
      else Query_ID := -1;
    end;
    if Query_ID >= 0 then
        if DataMain.qryGetQuery.Locate('Query_ID',Query_ID,[]) then
          with TABSQuery(TfrxDBDataset(frxPrint.DataSets.Items[i-1].DataSet).Dataset) do begin
            Close;
            SQL.Clear;
            SQL.Add( DataMain.qryGetQuery.FieldByName('Query_SQL').Value );
          end;

    frxPrint.DataSets.Items[i-1].DataSet.Open;
  end;
end;


procedure TfPrint.frxPrintEndDoc(Sender: TObject);
var i : integer;
begin
//  for i := 1 to frxPrint.DataSets.Count do
//    frxPrint.DataSets.Items[i-1].DataSet.Close;
end;

initialization

end.
