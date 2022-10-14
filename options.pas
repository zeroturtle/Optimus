{$J+}
unit options;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DBCtrls, dbcgrids, cxCheckBox, Dialogs, StdCtrls, ExtCtrls,
  Mask, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxSpinEdit,
  RxToolEdit, cxGraphics, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxDBEdit, cxCalendar, ComCtrls;

type
  TfOptions = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    OpenDialog1: TOpenDialog;
    cxSpinEdit3: TcxSpinEdit;
    DirectoryEdit1: TDirectoryEdit;
    Panel3: TPanel;
    btnOK: TButton;
    btmConcel: TButton;
    Label6: TLabel;
    cxSpinEdit4: TcxSpinEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label2: TLabel;
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    CheckBox1: TCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label5: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    cxDBDateEdit2: TcxDBDateEdit;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBSpinEdit1: TcxDBSpinEdit;
    cxDBSpinEdit2: TcxDBSpinEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    cxDBLookupComboBox3: TcxDBLookupComboBox;
    Label19: TLabel;
    cxSpinEdit7: TcxSpinEdit;
    cxSpinEdit1: TcxSpinEdit;
    cxSpinEdit2: TcxSpinEdit;
    procedure Panel1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure RxDBComboEdit1ButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure DirectoryEdit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fOptions: TfOptions;


implementation

uses constant, Unit5;

{$R *.dfm}

procedure TfOptions.Panel1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept:= Source is TLabel;
end;

procedure TfOptions.RxDBComboEdit1ButtonClick(Sender: TObject);
begin
  if OpenDialog1.Execute then begin

  end;
end;

// устанавливаем значения Controls из текущих переменных 
procedure TfOptions.FormCreate(Sender: TObject);
begin
  cxSpinEdit1.Value := MAXPORTS;
  cxSpinEdit2.Value := PLAYBACKSPEED;
  cxSpinEdit3.Value := CONCENSUSTIME;
  cxSpinEdit4.Value := _PUSHPROTECTPERIOD;
  CheckBox1.Checked := USEFTP;
  if VIEWSCREEN then RadioGroup1.ItemIndex := 1 else RadioGroup1.ItemIndex := 0;
  cxSpinEdit7.Value := FIRSTJUDGEMONITORNUM;
  DirectoryEdit1.Text := VIDEODIRECTORY;
end;

procedure TfOptions.btnOKClick(Sender: TObject);
begin
  // не позволять запускать больше портов чем в лицензии
  if (cxSpinEdit1.Value>License^.QtyLicense) or (cxSpinEdit1.Value<1) then
    MAXPORTS := License^.QtyLicense
  else
    MAXPORTS := cxSpinEdit1.Value;
  PLAYBACKSPEED := cxSpinEdit2.Value;
  CONCENSUSTIME := cxSpinEdit3.Value;
  VIDEODIRECTORY := DirectoryEdit1.Text;
  VIEWSCREEN := RadioGroup1.ItemIndex = 1;
  if VIEWSCREEN then FIRSTJUDGEMONITORNUM := cxSpinEdit7.Value else FIRSTJUDGEMONITORNUM := 2;
  USEFTP := CheckBox1.Checked;
  with DataMain.tblCompetition do begin
    Edit;
    FieldByName('Options').AsString := SetOptions;
    Post;
  end;
end;

// параменты по умолчанию
procedure TfOptions.Button1Click(Sender: TObject);
begin
  DefaultOptions;
  FormCreate(Sender);
end;

procedure TfOptions.RadioGroup1Click(Sender: TObject);
begin
  cxSpinEdit7.Enabled := RadioGroup1.ItemIndex = 1;
end;

procedure TfOptions.DirectoryEdit1Exit(Sender: TObject);
begin
  with DirectoryEdit1 do
  if Text[length(Text)] <> '\' then
    Text := Text+'\';
end;

end.
