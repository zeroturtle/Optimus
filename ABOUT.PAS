unit About;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, RXCtrls;

type
  TAboutBox = class(TForm)
    OKButton: TButton;
    Bevel1: TBevel;
    ApplicationVersion: TLabel;
    Logo: TImage;
    ApplicationName: TRxLabel;
    Inform: TMemo;
    lbContact: TLabel;
    lbSiteLink: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure lbSiteLinkClick(Sender: TObject);
    procedure lbSiteLinkMouseEnter(Sender: TObject);
    procedure lbSiteLinkMouseLeave(Sender: TObject);
  private
//    procedure GetOSInfo;
//    procedure InitializeCaptions;
  end;

procedure ShowAboutBox;
function AppVersion(const Filename: string):string;

implementation

uses ShellAPI, constant;

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
{
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
}

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

function Dec2Bin(iVal:word): string;
begin
  Result := '';
  while iVal <> 0 do begin
    Result := IntToStr(iVal and 1)+Result;
    iVal := iVal shr 1;
  end;
end;

procedure TAboutBox.FormCreate(Sender: TObject);
begin
  ApplicationName.Caption := APPLICATIONCAPTION;
  ApplicationVersion.Caption := APPNAME+CR+Format(APPVERSIONNUMBER,[AppVersion(Application.ExeName)]);
  with Inform.Lines do begin
//    Add(APPCONTRIB);
    Add(Format('Номер: %s', [License^.Number]));
    Add(Format('Владелец: %s',[License^.Owner]));
    Add(Format('Количество: %d', [License^.QtyLicense]));
    Add(Format('Дисциплины: %s',[Dec2Bin(Convert(License^.EventType))]));
    Add(Format('Срок действия: %s-%s',[DateToStr(License^.DateStart), DateToStr(License^.DateEnd)]));
//    Add(Format('Активность: %s', [BoolToStr(License^.Active,true)]));
  end;
  lbContact.Caption := APPCOPYRIGHT;
  lbSiteLink.Caption := APPAUTORSITE;
end;

procedure TAboutBox.lbSiteLinkClick(Sender: TObject);
begin
  ShellExecute(Application.Handle,PChar('open'),PChar('https://'+APPAUTORSITE),nil,nil,SW_SHOW);
end;

procedure TAboutBox.lbSiteLinkMouseEnter(Sender: TObject);
begin
  (Sender as TLabel).Font.Color := clBlue;
end;

procedure TAboutBox.lbSiteLinkMouseLeave(Sender: TObject);
begin
  (Sender as TLabel).Font.Color := clWindowText;
end;

end.

