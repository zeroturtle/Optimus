unit Settings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StdCtrls, Mask, RxToolEdit, RXDBCtrl, DBCtrls, Dialogs, DB, ABSMain;

type
  TfSettimgs = class(TForm)
    btnOK: TButton;
    btnCancel: TButton;
    OpenDialog1: TOpenDialog;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    RxDBComboEdit1: TRxDBComboEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure RxDBComboEdit1ButtonClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    VideoFile : string;
    Team, Round: string;
    RID : Integer;
  end;

var
  fSettimgs: TfSettimgs;

implementation

uses Unit5, constant;

{$R *.dfm}

procedure TfSettimgs.FormCreate(Sender: TObject);
begin
  with DataMain.tblTeamRound do begin
    Open;
    Insert;
  end;

  // open dialog setting
  OpenDialog1.Options := CDialogOptions;
  OpenDialog1.Filter := CDialogFilter;
end;

procedure TfSettimgs.RxDBComboEdit1ButtonClick(Sender: TObject);
begin
  with OpenDialog1 do begin
    InitialDir := VIDEODIRECTORY;
    if Execute then begin
      VideoFile := FileName;
      DataMain.tblTeamRoundVideoFile.Value := ExtractFileName(VideoFile);
    end;
  end;
end;

procedure TfSettimgs.btnOKClick(Sender: TObject);
begin
  with DataMain do begin
    tblTeamRoundVideoFile.AsString := ExtractFileName(VideoFile);
    tblTeamRoundPool_Sequence.AsString := tblRoundPool_Sequence_Code.Value;
    tblTeamRound.Post;
    RID := tblTeamRound.LastAutoincValue('Result_ID');
    Team := tblTeamRoundTeamName.Value;
    Round:= tblTeamRoundRound.Value;
//  INSERT INTO StartList SELECT LastAutoinc(RoundResult,Result_ID), me.Member_ID from Member me where Team_ID=:Team_ID
//  'INSERT INTO StartList SELECT %d, me.Member_ID FROM Member me WHERE Team_ID=%d', [RID,Team])
  end;
end;

procedure TfSettimgs.btnCancelClick(Sender: TObject);
begin
   DataMain.tblTeamRound.Cancel;
end;

end.
