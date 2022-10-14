unit Select;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, StdCtrls, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxDBEdit, cxButtonEdit, Menus, cxLookAndFeelPainters,
  cxButtons, cxListBox, DBCtrls;

type
  TfSelection = class(TForm)
    Button1: TButton;
    DBLookupListBox2: TDBLookupListBox;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSelection: TfSelection;


implementation

uses Unit5, constant, Main, wthread, DB;

{$R *.dfm}


procedure TfSelection.Button1Click(Sender: TObject);
var i : integer;
    O : TStringList;
begin
  with DataMain.tblCompetition do begin
    Filter := 'Competition_ID='+IntToStr(FieldByName('Competition_ID').AsInteger);
    Filtered := true;
    if (((Convert(License^.EventType) shr FieldByName('Type_ID').AsInteger) and 1) = 0) then
        ShowMessage(LICENSETYPEMSG);
    try
      O := TStringList.Create;
      with O do begin
        CommaText := FieldByName('Options').AsString;
        for i := 0 to Count-1 do
          case i of
            0: if StrToInt(Strings[i]) > License^.QtyLicense then MAXPORTS := License^.QtyLicense
               else MAXPORTS := StrToInt(Strings[i]);
            1: PLAYBACKSPEED := StrToInt(Strings[i]);
            2: CONCENSUSTIME := StrToInt(Strings[i]);
            3: ;//PUSHPROTECTPERIOD := StrToInt(Strings[i]);
            4: VIDEODIRECTORY := Strings[i];
            5: begin
                 VIEWSCREEN := StrToBool(Strings[i]);
                 if VIEWSCREEN then
                    FIRSTJUDGEMONITORNUM := 1
                 else
                    FIRSTJUDGEMONITORNUM := 2;
               end;
            6: USEFTP := StrToBool(Strings[i]);
            else ;
          end;
      end;
    except
      Filter := '';
      Filtered := false;
      DefaultOptions;
    end;
    O.Free;    
  end;
//  ChDir(VIDEODIRECTORY); //сменить текущий каталог 
end;

procedure TfSelection.Button2Click(Sender: TObject);
begin
  with DataMain.tblCompetition do begin
    Filter := '';
    Filtered := false;
  end;
  DefaultOptions;
end;

procedure TfSelection.FormShow(Sender: TObject);
var i: integer;
begin
  // закрыть все окна
  for i:= 0 to MdiChildCount - 1 do
    MDIChildren[i].Close;

  with DataMain.tblCompetition do begin
    Filtered := false;
    Open;
    Button1.Enabled := RecordCount <> 0;
  end;
  SendMessage(DBLookupListBox2.Handle, WM_VSCROLL, SB_BOTTOM, 0);
end;

procedure TfSelection.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Bmk: TBookMark;
  Tmp: TDataSetNotifyEvent;
begin
 Screen.Cursor:= crHourGlass;
  with DataMain.tblCompetition do
  begin
    Bmk:= GetBookmark;
    Tmp:= AfterScroll;
    AfterScroll:= nil;
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
      AfterScroll:= Tmp;
      FreeBookmark(Bmk);
      Screen.Cursor:= crDefault;
    end;
  end;
end;

end.
