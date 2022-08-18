
unit Pool;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DB, ABSMain, DBCtrls,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxPropertiesStore, cxImage, cxImageComboBox, cxBlobEdit;

type
  Tfd_Pool = class(TForm)
    DataSource1: TDataSource;
    odBlob: TOpenDialog;
    sdBlob: TSaveDialog;
    Label1: TLabel;
    Panel3: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    colCode: TcxGridDBColumn;
    colName: TcxGridDBColumn;
    colImage1: TcxGridDBColumn;
    cxPropertiesStore1: TcxPropertiesStore;
    colImage2: TcxGridDBColumn;
    colImage3: TcxGridDBColumn;
    colPoolName: TcxGridDBColumn;
//    procedure tblPoolAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fd_Pool: Tfd_Pool;

implementation

uses Unit5;

{$R *.dfm}

procedure Tfd_Pool.FormCreate(Sender: TObject);
begin
  DataMain.tblPool.Open;
end;

procedure Tfd_Pool.FormDestroy(Sender: TObject);
begin
  DataMain.tblPool.Close;
end;

procedure Tfd_Pool.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
