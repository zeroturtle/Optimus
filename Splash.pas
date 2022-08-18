unit Splash;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, StdCtrls, Forms;

type
  TSplashForm = class(TForm)
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SplashForm: TSplashForm;

implementation

uses wthread, constant;

{$R *.dfm}

procedure TSplashForm.FormCreate(Sender: TObject);
begin
  TDelayThr.Create(TForm(Sender), _SPLASHFORMTIME);
end;

end.
