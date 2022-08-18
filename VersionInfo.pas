unit VersionInfo;

interface

uses
  Windows, Messages, SysUtils, Classes{, Graphics, Controls, Forms, Dialogs};

type
  TVersionInfo = class(TObject)
  private
    FVersionInfo : Pointer;
    FFileName : String;
    FLangCharSet : String;
    function GetCompanyName : String;
    function GetFileDescription : String;
    function GetFileVersion : String;
    function GetInternalName : String;
    function GetLegalCopyright : String;
    function GetOriginalFilename : String;
    function GetProductName : String;
    function GetProductVersion : String;
    function Init: boolean;
    procedure SetFileName(const Value : String);
    procedure Clear;
  public
    constructor Create(sFileName: String);
    destructor Destroy; override;
    function GetValue(const ValueName : String; var Buffer : Pointer) : Boolean;
    function GetLocalValue(const ValueName : String) : String;
    property CompanyName : String read GetCompanyName;
    property FileDescription : String read GetFileDescription;
    property FileVersion : String read GetFileVersion;
    property InternalName : String read GetInternalName;
    property LegalCopyright : String read GetLegalCopyright;
    property OriginalFilename : String read GetOriginalFilename;
    property ProductName : String read GetProductName;
    property ProductVersion : String read GetProductVersion;
    property LangCharSet : String read FLangCharSet;
  published
    property FileName : String read FFileName write SetFileName;
  end;


implementation

constructor TVersionInfo.Create(sFileName: String);
begin
     inherited Create;
     FVersionInfo := nil;
     FFileName := sFileName;
end;

destructor TVersionInfo.Destroy;
begin
     Clear;
     inherited Destroy;
end;

procedure TVersionInfo.Clear;
begin
     if FVersionInfo <> nil then FreeMem(FVersionInfo);
     FVersionInfo := nil;
end;

procedure TVersionInfo.SetFileName(const Value : String);
begin
     Clear;
     FFileName := Value;
end;

function TVersionInfo.Init: boolean;
type T = array [0..1] of WORD;
var Size, Fake : DWORD;
    P : ^T;
begin
     if FVersionInfo <> nil then exit;
     Size := GetFileVersionInfoSize(PChar(FFileName), Fake);
     try
       if Size = 0 then
         raise Exception.Create('Error in detecting VersionInfo size!');
       GetMem(FVersionInfo, Size);
     
        if not GetFileVersionInfo(PChar(FFileName), 0, Size, FVersionInfo) then
           raise Exception.Create('Error in detecting VersionInfo!');
     except
        FreeMem(FVersionInfo);
        FVersionInfo := nil;
        Result:= False;
//        raise;
        Exit;
     end;
     GetValue('\VarFileInfo\Translation', Pointer(P));
     FLangCharSet := Format('%.4x%.4x', [P^[0], P^[1]]);
     Result:= True;
end;

function TVersionInfo.GetValue(const ValueName : String; var Buffer : Pointer) : Boolean;
var Size : UINT;
begin
     if Init then
       Result := VerQueryValue(FVersionInfo, PChar(ValueName), Buffer, Size);
end;

function TVersionInfo.GetLocalValue(const ValueName : String) : String;
var P : Pointer;
begin
     Result := '';
     if Init then
       if GetValue('\StringFileInfo\' + FLangCharSet + '\' + ValueName, P) then
         Result := StrPas(P)
end;

function TVersionInfo.GetCompanyName : String;
begin
     Result := GetLocalValue('CompanyName');
end;

function TVersionInfo.GetFileDescription : String;
begin
     Result := GetLocalValue('FileDescription');
end;

function TVersionInfo.GetFileVersion : String;
begin
     Result := GetLocalValue('FileVersion');
end;

function TVersionInfo.GetInternalName : String;
begin
     Result := GetLocalValue('InternalName');
end;

function TVersionInfo.GetLegalCopyright : String;
begin
     Result := GetLocalValue('LegalCopyright');
end;

function TVersionInfo.GetOriginalFilename : String;
begin
     Result := GetLocalValue('OriginalFilename');
end;

function TVersionInfo.GetProductName : String;
begin
     Result := GetLocalValue('ProductName');
end;

function TVersionInfo.GetProductVersion : String;
begin
     Result := GetLocalValue('ProductVersion');
end;

end.
