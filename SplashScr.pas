unit SplashScr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls;

type
  TSplashScreen = class(TForm)
    lbCredential: TLabel;
    Logo: TImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SplashScreen: TSplashScreen;

implementation

uses constant, About;
{$R *.dfm}


procedure TSplashScreen.FormCreate(Sender: TObject);
begin
  lbCredential.Caption := APPLICATIONCAPTION + ' ' + Format(APPVERSIONNUMBER,[AppVersion(Application.ExeName)])
          + CR + APPNAME + CR + APPCOPYRIGHT;
end;

end.
