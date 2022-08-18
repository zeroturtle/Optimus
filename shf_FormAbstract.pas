unit shf_FormAbstract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ADODB, Buttons, Menus, ComCtrls, ToolWin,
  ImgList, StdActns, ActnList, DBGrids, DBClient, shm_Types, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  frxClass, frxDBSet, cxPropertiesStore, frxExportXLS, frxExportPDF,
  frxExportHTML, frxExportImage;

type
  Tfsh_FormAbstract = class(TForm)
    MainMenu1: TMainMenu;
    ctl_ActionList: TActionList;
    act_Preview: TAction;
    act_Print: TAction;
    act_Post: TAction;
    act_Undo: TAction;
    act_Update: TAction;
    act_Filter: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    ctl_ImageList: TImageList;
    ctl_ToolBar: TToolBar;
    ToolButton13: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    act_Add: TAction;
    act_Edit: TAction;
    act_Del: TAction;
    act_GridView: TAction;
    act_FormView: TAction;
    act_TableProp: TAction;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    actGridView1: TMenuItem;
    actFormView1: TMenuItem;
    ToolButton4: TToolButton;
    act_SelectData: TAction;
    N12: TMenuItem;
    N14: TMenuItem;
    act_ExportToExcel: TAction;
    actExportToExcel1: TMenuItem;
    act_SelectAll: TAction;
    act_UnSelectAll: TAction;
    act_InvertSelection: TAction;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    ctl_FilterPanel: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    btn_SetFilter: TButton;
    Panel3: TPanel;
    ctl_FilterSplitter: TSplitter;
    ctl_DataPanel: TPanel;
    grd_GeneralDBTableView1: TcxGridDBTableView;
    grd_GeneralLevel1: TcxGridLevel;
    grd_General: TcxGrid;
    ds_General: TDataSource;
    act_Calc: TAction;
    fr_General: TfrxDBDataset;
    cxPropertiesStore1: TcxPropertiesStore;
    frxXLSExport1: TfrxXLSExport;
    ToolButton21: TToolButton;
    PopupMenu1: TPopupMenu;
    N11: TMenuItem;
    N13: TMenuItem;
    N15: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    Excel1: TMenuItem;
    frxPDFExport1: TfrxPDFExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxBMPExport1: TfrxBMPExport;
    frxJPEGExport1: TfrxJPEGExport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ActionExecute(Sender: TObject);
    procedure ActionUpdate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    FExecParams: TExecFormParamTypes;
    FFilterParams: TFilterParams;
    procedure cds_ActiveDataSetBeforeEdit(DataSet: TDataSet);
    procedure cds_ActiveDataSetAfterPost(DataSet: TDataSet);
//    procedure cds_ActiveDataSetAfterCancel(DataSet: TDataSet);
//    procedure cds_GeneralBeforeInsert(DataSet: TDataSet);
  public
    FormID: TGUID;
    cds_ActiveDataSet: TDataSet;
    grd_ActiveGrid: TcxGrid;
    DictionFields: TDictionFields;
    procedure ReOpenDataset(DataSet: TDataSet);
    procedure SetActiveGrid(ADBGrid:TcxGrid; IsActive: boolean);
    procedure AssignGridButtons(ADBGrid: TcxGrid);
  end;

var
  fsh_FormAbstract: Tfsh_FormAbstract;

implementation

uses constant;

{$R *.dfm}

procedure Tfsh_FormAbstract.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  cds_ActiveDataSet.Close;
  Action := caFree;
end;

procedure Tfsh_FormAbstract.ActionExecute(Sender: TObject);
begin
  case TComponent(Sender).Tag of
    1: begin cds_ActiveDataSet.Insert;
    cds_ActiveDataSetBeforeEdit(cds_ActiveDataSet); end;
    2: begin cds_ActiveDataSet.Edit; cds_ActiveDataSetBeforeEdit(cds_ActiveDataSet); end;
    3: if (MessageBox(0, 'Удалить запись?', 'Удаление', MB_ICONQUESTION or MB_YESNO) = IDYES) then
       cds_ActiveDataSet.Delete;
    4: begin cds_ActiveDataSet.Post; cds_ActiveDataSetAfterPost(cds_ActiveDataSet); end;
    5: begin cds_ActiveDataSet.Cancel; cds_ActiveDataSetAfterPost(cds_ActiveDataSet); end;
    6: begin ReOpenDataset(cds_ActiveDataSet); cds_ActiveDataSetAfterPost(cds_ActiveDataSet); end;
    7: ;//PrintForm(cds_ActiveDataSet);
    8: if act_Filter.Checked then
       begin
         ctl_FilterSplitter.Visible:= false;
         ctl_FilterPanel.Visible:= false;
         act_Filter.Checked:= not act_Filter.Checked;
       end else begin
         ctl_FilterPanel.Visible:= true;
         ctl_FilterSplitter.Visible:= true;
         act_Filter.Checked:= not act_Filter.Checked;
       end;
{    21: grd_ActiveGrid.FullExpand;
    22: grd_ActiveGrid.FullCollapse; }
  end;
end;

procedure Tfsh_FormAbstract.ActionUpdate(Sender: TObject);
begin
  case TComponent(Sender).Tag of
    1: act_Add.Enabled:= Assigned(cds_ActiveDataSet) and cds_ActiveDataSet.Active and not (cds_ActiveDataSet.State in [dsInsert, dsEdit]) and
                    (grd_GeneralDBTableView1.OptionsData.Inserting);
    2: act_Edit.Enabled:= Assigned(cds_ActiveDataSet) and cds_ActiveDataSet.Active and not (cds_ActiveDataSet.State in [dsInsert, dsEdit]) and
                    (cds_ActiveDataSet.RecordCount > 0) and (grd_GeneralDBTableView1.OptionsData.Editing);

    3: act_Del.Enabled:= Assigned(cds_ActiveDataSet) and cds_ActiveDataSet.Active and not (cds_ActiveDataSet.State in [dsInsert, dsEdit]) and
                    (cds_ActiveDataSet.RecordCount > 0) and (grd_GeneralDBTableView1.OptionsData.Deleting);

    4: act_Post.Enabled:= Assigned(cds_ActiveDataSet) and cds_ActiveDataSet.Active and (cds_ActiveDataSet.State in [dsInsert, dsEdit]);
    5: act_Undo.Enabled:= Assigned(cds_ActiveDataSet) and cds_ActiveDataSet.Active and (cds_ActiveDataSet.State in [dsInsert, dsEdit]);
    7: act_Print.Enabled := true;
  end;
end;

procedure Tfsh_FormAbstract.ReOpenDataset(DataSet: TDataSet);
var
  Bmk: TBookMark;
  Tmp: TDataSetNotifyEvent;
begin
  Screen.Cursor:= crHourGlass;
  with DataSet do
  begin
    Bmk:= GetBookmark;
    Tmp:= DataSet.AfterScroll;
    DataSet.AfterScroll:= nil;
    DisableControls;
    Close;
    try
      Open;
      try
        GotoBookmark(Bmk);
      except
      end;
    finally
      EnableControls;
      DataSet.AfterScroll:= Tmp;
      FreeBookmark(Bmk);
      Screen.Cursor:= crDefault;
    end;
  end;
end;

procedure Tfsh_FormAbstract.FormCreate(Sender: TObject);
begin
  cds_ActiveDataSet.Open;
  ds_General.DataSet := cds_ActiveDataSet;
  SetActiveGrid(grd_General, true);
  DictionFields:= TDictionFields.Create(self);
  AssignGridButtons(grd_General);
  ActiveForm := FormID;
end;

procedure Tfsh_FormAbstract.SetActiveGrid(ADBGrid: TcxGrid; IsActive: boolean);
begin
  if not Assigned(ADBGrid) then Exit;
  if IsActive then
  begin
    grd_ActiveGrid := ADBGrid;
{    ADBGrid.HeaderFont.Color := clNavy;
    ADBGrid.BandFont.Color := clNavy;
    ADBGrid.HideSelectionColor := clHighlight;}
  end else
  begin
{    ADBGrid.HeaderFont.Color := clGray;
    ADBGrid.BandFont.Color := clGray;
    ADBGrid.HideSelectionColor := clGray;}
    grd_ActiveGrid:= nil;
  end;
end;

procedure Tfsh_FormAbstract.AssignGridButtons(ADBGrid: TcxGrid);
var
  AGridView: TcxCustomGridView;
begin
  AGridView := ADBGrid.Views[0];
end;

procedure Tfsh_FormAbstract.FormDestroy(Sender: TObject);
begin
  DictionFields.Free;
end;

procedure Tfsh_FormAbstract.cds_ActiveDataSetBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  if not DataSet.Active then exit;
  if Assigned(grd_ActiveGrid) then
 with  TcxGridDBTableView(grd_ActiveGrid.Levels[0].GridView) do begin
    OptionsBehavior.IncSearch := false;
    OptionsSelection.CellSelect := true;
  end;
end;

procedure Tfsh_FormAbstract.cds_ActiveDataSetAfterPost(DataSet: TDataSet);
begin
  inherited;
  if Assigned(grd_ActiveGrid)  then
  with  TcxGridDBTableView(grd_ActiveGrid.Levels[0].GridView) do begin
    OptionsBehavior.IncSearch := true;
    OptionsSelection.CellSelect := false;
  end;
end;

{
procedure Tfsh_FormAbstract.cds_GeneralBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if not DataSet.Active then exit;
  if Assigned(grd_ActiveGrid) then
  with  TcxGridDBTableView(grd_ActiveGrid.Levels[0].GridView) do begin
    OptionsBehavior.IncSearch := false;
    OptionsData.Editing := true;
    OptionsSelection.CellSelect := true;
  end;
end;

procedure Tfsh_FormAbstract.cds_ActiveDataSetAfterCancel(DataSet: TDataSet);
begin
  inherited;
  if Assigned(grd_ActiveGrid) then
  with  TcxGridDBTableView(grd_ActiveGrid.Levels[0].GridView) do begin
    OptionsBehavior.IncSearch := true;
    OptionsData.Editing := false;
    OptionsSelection.CellSelect := false;
  end;
end;
}

procedure Tfsh_FormAbstract.FormActivate(Sender: TObject);
begin
  ActiveForm := FormID;
end;

end.
