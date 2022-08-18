
 unit wthread;

interface

uses
  Classes, Windows, Graphics, StdCtrls, Forms, constant;

type

//Wait thread declaration
  TWaitThr = class(TThread)
  private
    O: TLabel;
    DelayTime : Integer;
    procedure UpdateLabel;//this just sets the label's caption
  protected
    Colors : TColorPair;
    procedure Execute; override;
  public
    constructor Create(L: TLabel; Cl: TColorPair; FLASH: integer = _FLASHDELAYTIME);
  end;

  TDelayThr = class(TThread)
  private
    O: TForm;
    DelayTime : Integer;
    procedure CloseForm;//this just sets the label's caption
  protected
    procedure Execute; override;
  public
    constructor Create(var F: TForm; T: integer);
  end;

implementation

procedure TWaitThr.UpdateLabel;
begin
  O.Color := Colors.clEnd;
//  O.Caption := '';
end;

constructor TWaitThr.Create;
begin
  O := L;
  Colors := Cl;
  DelayTime := FLASH;
  O.Color := Colors.clStart;  
  FreeOnTerminate := True;
  inherited Create(False);
end;

procedure TWaitThr.Execute;
begin
  Sleep(DelayTime);
  WaitForSingleObject(Handle, WAIT_TIMEOUT);
  Synchronize(UpdateLabel);
end;

constructor TDelayThr.Create(var F: TForm; T: integer);
begin
  O := F;
  DelayTime := T;
  FreeOnTerminate := True;
  inherited Create(False);
end;

procedure TDelayThr.Execute;
begin
  Sleep(DelayTime);
  WaitForSingleObject(Handle, WAIT_TIMEOUT);
  Synchronize(CloseForm);
end;

procedure TDelayThr.CloseForm;
begin
  O.Close;
end;


end.
