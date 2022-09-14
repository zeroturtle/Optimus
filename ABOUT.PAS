unit About;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, RXCtrls;

type
  TAboutBox = class(TForm)
    OKButton: TButton;
    Bevel1: TBevel;
    SKUName: TLabel;
    PhysMem: TLabel;
    OS: TLabel;
    Label3: TLabel;
    Logo: TImage;
    ApplicationName: TRxLabel;
    Inform: TMemo;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure GetOSInfo;
    procedure InitializeCaptions;
  end;

procedure ShowAboutBox;
function AppVersion(const Filename: string):string;

implementation

uses ShellAPI, constant, fLicense;

{$R *.DFM}

procedure ShowAboutBox;
begin
  with TAboutBox.Create(Application) do
    try
      Logo.Picture.Icon := Application.Icon;
      ShowModal;
    finally
      Free;
    end;
end;

procedure TAboutBox.GetOSInfo;
var
  Platform: string;
  BuildNumber: Integer;
begin
  case Win32Platform of
    VER_PLATFORM_WIN32_WINDOWS:
      begin
        Platform := 'Windows 95';
        BuildNumber := Win32BuildNumber and $0000FFFF;
      end;
    VER_PLATFORM_WIN32_NT:
      begin
        Platform := 'Windows NT';
        BuildNumber := Win32BuildNumber;
      end;
      else begin
        Platform := 'Windows';
        BuildNumber := 0;
      end;
  end;
  if (Win32Platform = VER_PLATFORM_WIN32_WINDOWS) or
    (Win32Platform = VER_PLATFORM_WIN32_NT) then begin
    if Win32CSDVersion = '' then
      OS.Caption := Format('%s %d.%d (Build %d)', [Platform, Win32MajorVersion,
        Win32MinorVersion, BuildNumber])
    else
      OS.Caption := Format('%s %d.%d (Build %d: %s)', [Platform, Win32MajorVersion,
        Win32MinorVersion, BuildNumber, Win32CSDVersion]);
  end
  else
    OS.Caption := Format('%s %d.%d', [Platform, Win32MajorVersion,
      Win32MinorVersion])
end;

function AppVersion(const Filename: string):string;
var dwHandle: THandle;
    dwSize: DWORD;
    lpData, lpData2: Pointer;
    uiSize: UINT;
begin
  Result := '';
  dwSize := GetFileVersionInfoSize(PChar(FileName), dwSize);
  if dwSize <> 0 then
  begin
    GetMem(lpData, dwSize);
    if GetFileVersionInfo(PChar(FileName), dwHandle, dwSize, lpData) then
      begin
        uiSize := Sizeof(TVSFixedFileInfo);
        VerQueryValue(lpData, '\', lpData2, uiSize);
        with PVSFixedFileInfo(lpData2)^ do
          Result := Format('%d.%02d.%02d.%02d', [HiWord(dwProductVersionMS), LoWord(dwProductVersionMS),HiWord(dwProductVersionLS), LoWord(dwProductVersionLS)]);
      end;
    FreeMem(lpData, dwSize);
  end;
end;

procedure TAboutBox.InitializeCaptions;
var
  MS: TMemoryStatus;
begin
  GetOSInfo;
  MS.dwLength := SizeOf(TMemoryStatus);
  GlobalMemoryStatus(MS);
  ApplicationName.Caption := APPLICATIONCAPTION;
  SKUName.Caption := APPNAME;
  PhysMem.Caption := FormatFloat('#,###" KB"', MS.dwTotalPhys div 1024);
  with Inform.Lines do begin
    Add(Format(APPVERSIONNUMBER,[AppVersion(Application.ExeName)]));
    Add(APPCOPYRIGHT);
    Add(APPCONTRIB);
    Add('');
    Add('');    
    Add(Format('Лицензия №: %s',[License^.Number]));
    Add(Format('Срок действия: %s - %s',[DateToStr(License^.DateStart), DateToStr(License^.DateEnd)]));
    Add(Format('Владелец: %s',[License^.Owner]));
  end;
end;

procedure TAboutBox.FormCreate(Sender: TObject);
begin
  InitializeCaptions;
end;

procedure TAboutBox.Button1Click(Sender: TObject);
begin
  ShowLicenseDlg(License);
end;

end.

