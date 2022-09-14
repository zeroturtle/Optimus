{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
program Optimus;

uses
  Forms,
  Pool in 'Pool.pas' {fd_Pool},
  Main in 'Main.pas' {fMain},
  shf_FormAbstract in 'shf_FormAbstract.pas' {fsh_FormAbstract},
  People in 'People.pas' {fPeople},
  Roles in 'Roles.pas' {fRoles},
  Comps in 'Comps.pas' {fCompetition},
  Result in 'Result.pas' {fResult},
  Print in 'Print.pas' {fPrint},
  Select in 'Select.pas' {fSelection},
  constant in 'constant.pas',
  options in 'options.pas' {fOptions},
  Judges in 'Judges.pas' {fJudge},
  Country in 'Country.pas' {fCountry},
  Team in 'Team.pas' {fTeam},
  About in 'ABOUT.PAS' {AboutBox},
  Unit5 in 'Unit5.pas' {DataMain: TDataModule},
  Splash in 'Splash.pas' {SplashForm},
  XPBase64 in 'XPBase64.pas',
  Error in 'Error.pas' {fError},
  Club in 'Club.pas' {fClub},
  SplashScr in 'SplashScr.pas' {SplashScreen},
  ScreenForm in 'ScreenForm.pas' {fJudgeConsol},
  JCtrl in 'JCtrl.pas' {fJudgeCtrl},
  Settings in 'Settings.pas' {fSettimgs},
  DMJ in 'DMJ.pas' {DataJudge: TDataModule},
  iResult in 'iResult.pas' {fIndResult},
  ScoreEdit in 'ScoreEdit.pas' {fScoreEdit},
  fLicense in 'fLicense.pas' {License_Expired};

{$R *.res}

begin
  Application.Initialize;
  SplashScreen := TSplashScreen.Create(Application);
  SplashScreen.Show;
  SplashScreen.Update;

  Application.Title := 'OPTIMUS';
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TDataMain, DataMain);
  Application.CreateForm(TDataJudge, DataJudge);
  Application.Run;
end.
