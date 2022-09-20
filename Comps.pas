Unit Comps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, shf_FormAbstract, RxDualList, DB, Grids, DBGrids, ComCtrls,
  ExtCtrls, ImgList, ActnList, Menus, ToolWin, StdCtrls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, ABSMain,
  cxButtonEdit, frxClass, frxDesgn, frxDBSet, cxPropertiesStore, cxBlobEdit,
  frxExportXLS, DBCtrls, cxMemo, frxExportPDF, cxCalendar, frxExportHTML,
  frxExportImage;

type
  TfCompetition = class(Tfsh_FormAbstract)
    Splitter1: TSplitter;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    dlDivePool: TDualListDialog;
    grd_GeneralDBTableView1Column2: TcxGridDBColumn;
    grd_GeneralDBTableView1Column3: TcxGridDBColumn;
    grd_GeneralDBTableView1Column4: TcxGridDBColumn;
    grd_GeneralDBTableView1Column5: TcxGridDBColumn;
    grd_RoundDBTableView1: TcxGridDBTableView;
    grd_RoundLevel1: TcxGridLevel;
    grd_Round: TcxGrid;
    grd_RoundDBTableView1Column1: TcxGridDBColumn;
    grd_RoundDBTableView1Column2: TcxGridDBColumn;
    qryPoolLeft: TABSQuery;
    qryPoolRight: TABSQuery;
    grd_RoundDBTableView1Column4: TcxGridDBColumn;
    grd_GeneralDBTableView1Column1: TcxGridDBColumn;
    Splitter3: TSplitter;
    pnlDraw: TPanel;
    grd_GeneralDBTableView1Column6: TcxGridDBColumn;
    DBImage1: TDBImage;
    DBImage2: TDBImage;
    DBImage3: TDBImage;
    DBImage4: TDBImage;
    DBImage5: TDBImage;
    DBImage6: TDBImage;
    DBImage7: TDBImage;
    DBImage8: TDBImage;
    DBImage9: TDBImage;
    grd_RoundDBTableView1Column3: TcxGridDBColumn;
    grd_GeneralDBTableView1Column7: TcxGridDBColumn;
    grd_GeneralDBTableView1Column8: TcxGridDBColumn;
    TabSheet2: TTabSheet;
    grd_EventDBTableView1: TcxGridDBTableView;
    grd_EventLevel1: TcxGridLevel;
    grd_Event: TcxGrid;
    grd_EventDBTableView1Column1: TcxGridDBColumn;
    grd_RoundDBTableView1Column5: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure grd_GeneralEnter(Sender: TObject);
    procedure grd_GeneralExit(Sender: TObject);
    procedure grd_RoundEnter(Sender: TObject);
    procedure grd_RoundDBTableView1Editing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);
    procedure pnlDrawResize(Sender: TObject);
    procedure grd_EventEnter(Sender: TObject);
  private
    { Private declarations }
    WPath: String;
  public
    { Public declarations }
  end;

var
  fCompetition: TfCompetition;

implementation

uses Unit5, constant;

{$R *.dfm}

procedure TfCompetition.FormCreate(Sender: TObject);
begin
  FormID := Competition_GUID;
  WPath := ExtractFilePath(Application.ExeName);
  cds_ActiveDataSet := DataMain.tblCompetition;
  inherited;
end;

procedure TfCompetition.grd_GeneralEnter(Sender: TObject);
begin
  inherited;
  cds_ActiveDataSet := DataMain.tblCompetition;
  SetActiveGrid(grd_General, true);
end;

procedure TfCompetition.grd_GeneralExit(Sender: TObject);
begin
  inherited;
  SetActiveGrid(TcxGrid(Sender), false);
  cds_ActiveDataSet:= nil;
end;

procedure TfCompetition.grd_RoundEnter(Sender: TObject);
begin
  inherited;
  cds_ActiveDataSet:= DataMain.tblRound;
  SetActiveGrid(grd_Round, true);
end;

procedure TfCompetition.grd_EventEnter(Sender: TObject);
begin
  inherited;
  cds_ActiveDataSet:= DataMain.tblEvent;
  SetActiveGrid(grd_Event, true);
end;

procedure TfCompetition.grd_RoundDBTableView1Editing(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  var AAllow: Boolean);
var
  LeftList, RightList: TStrings;
  j: integer;
begin
  if AItem.Index = 1 then begin
    LeftList := TStringList.Create;
    RightList := TStringList.Create;
    try
      with qryPoolLeft do  begin
        sql.Text := Format('SELECT Pool_Code, Name FROM Pool P LEFT JOIN Competition C ON (C.Pool_ID=P.Pool_ID) WHERE Competition_ID =%d',
                           [DataMain.tblCompetition.FieldByName('Competition_ID').AsInteger]);
        Open;
        while not EOF do begin
          LeftList.Add(FieldByName('Pool_Code').AsString);
          Next;
        end;
        Close;
      end;
      with qryPoolRight do begin
        sql.Text := Format('SELECT * FROM Round WHERE Round_ID = %d',
                           [DataMain.tblRound.FieldByName('Round_ID').AsInteger]);
        Open;
        RightList.DelimitedText := FieldByName('Pool_Sequence_Code').AsString;
        Close;
      end;
      with dlDivePool do begin
        List1 := LeftList;
        List2 := RightList;
        if Execute and not RightList.Equals(List2) then
          with DataMain.tblRound do begin
            Edit;
            FieldByName('Pool_Sequence_Code').AsString :=  List2.CommaText;
            Post;
          end;
      end;
    finally
      LeftList.Free;
      RightList.Free;
    end;
  end;
end;

procedure TfCompetition.pnlDrawResize(Sender: TObject);
var i, W, n : integer;
begin
  inherited;
  // подогнать размер картинок под размер экрана
  n := DataMain.MemPool.FieldByName('CountPic').AsInteger;
  if n > 0 then
    if pnlDraw.Height-23 < pnlDraw.Width div n then
      W := pnlDraw.Height-23
    else
      W := pnlDraw.Width div n;
      
  for i := 1 to 9 do
    with TDBImage(FindComponent('DBImage'+ IntToStr(i))) do
      if i > n then Visible := false
      else begin
         Width := W;
         Height := W;
         Left := W * (i - 1);
         Visible := true;
      end;
  Invalidate;
end;


end.


