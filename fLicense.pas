unit fLicense;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, constant;

type
  TLicense_Expired = class(TForm)
    Button1: TButton;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    Memo1: TMemo;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    NewLicense : PLicense;
    procedure ReadLicense(FileName: string; var ALicense:PLicense);
    procedure SaveLicense(FileName: string; var ALicense:PLicense);
    procedure ShowLicense;
  public
    { Public declarations }
  end;

var
  License_Expired: TLicense_Expired;

function ShowLicenseDlg(var ALicense:PLicense): BOOL;

implementation

{$R *.dfm}

uses XPBase64, DateUtils;

function ShowLicenseDlg;
begin
  with TLicense_Expired.Create(Application) do
    try
      NewLicense^ := ALicense^;
      if ShowModal=mrOK then begin
        SaveLicense(LicenseFile,NewLicense);
        ALicense^ := NewLicense^;
      end;
    finally
      Free;
    end;
end;

procedure TLicense_Expired.ReadLicense;
var
  S : TFileStream;
  sz, skip: dword;
  RS : String;
  Flags: dword;
begin
  S := TFileStream.Create(FileName,fmOpenRead);
  try
    Flags := CRYPT_STRING_BASE64REQUESTHEADER;
    sz := S.Size;
    SetLength(RS, sz);
    S.Read(pointer(RS)^,sz);
    CryptStringToBinary(pointer(RS), Length(RS), Flags, pointer(NewLicense), sz, skip, Flags);
    ALicense^.Active := (CompareDateTime(Now, NewLicense^.DateStart) >= 0) and
                        (CompareDateTime(NewLicense^.DateEnd, Now) >= 0);
  except
    ALicense^.Active := false;
  end;
  S.Free;
end;

procedure TLicense_Expired.SaveLicense;
var
  S : TFileStream;
  sz, skip: dword;
  RS : String;
  Flags: dword;
begin
  // сохранить в файл
  try
    Flags := CRYPT_STRING_BASE64REQUESTHEADER;  
    S := TFileStream.Create(FileName, fmCreate);
    CryptBinaryToString(pointer(NewLicense), SizeOf(NewLicense^), Flags, nil, sz);
    SetLength(RS, sz);
    CryptBinaryToString(pointer(NewLicense), SizeOf(NewLicense^), Flags, pointer(RS), sz);
    S.Write(pointer(RS)^,sz);
  finally
    S.Free;
  end;
end;

procedure TLicense_Expired.Button2Click(Sender: TObject);
begin
  if OpenDialog1.Execute then begin
    try
      ReadLicense(OpenDialog1.FileName, NewLicense);
      ShowLicense;
    finally
    end;
  end;
end;

procedure TLicense_Expired.ShowLicense;
begin
  with Memo1.Lines do begin
    Clear;
    Add(Format('Номер: %s', [NewLicense^.Number]));
    Add(Format('Владелец: %s',[NewLicense^.Owner]));
    Add(Format('Количество: %d', [NewLicense^.QtyLicense]));
    Add(Format('Дисциплины: %d',[Convert(NewLicense^.EventType)]));
    Add(Format('Срок действия: %s-%s',[DateToStr(NewLicense^.DateStart), DateToStr(NewLicense^.DateEnd)]));
    Add(Format('Активность: %s', [BoolToStr(NewLicense^.Active,true)]));
  end;
end;

procedure TLicense_Expired.FormShow(Sender: TObject);
begin
  ShowLicense;
end;

procedure TLicense_Expired.FormCreate(Sender: TObject);
begin
  GetMem(NewLicense, SizeOf(TLicense));
end;

procedure TLicense_Expired.FormDestroy(Sender: TObject);
begin
  FreeMem(NewLicense);
end;

end.
