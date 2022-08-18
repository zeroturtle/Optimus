unit ResForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, DBCtrls, StdCtrls, cxSpinEdit, cxDBEdit, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Mask, ToolEdit,
  RXDBCtrl, DB, ABSMain, cxButtonEdit, Grids, DBGrids;

type
  TfResults = class(TForm)
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    DBText1: TDBText;
    Button1: TButton;
    Button2: TButton;
    Label3: TLabel;
    DBText7: TDBText;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    cxDBButtonEdit1: TcxDBButtonEdit;
    qryResult: TABSQuery;
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    DBGrid1: TDBGrid;
    dsResult: TDataSource;
    Button3: TButton;
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fResults: TfResults;

implementation

uses Unit5;

{$R *.dfm}

procedure TfResults.Button3Click(Sender: TObject);
begin
  qryResult.Open;
end;

end.
