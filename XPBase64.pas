{
Конвертировать в/из Base64 можно встроенными средствами Windows.
Данная возможность поддерживается в WindowsXP и выше.
}

unit XPBase64;
 
interface
 
uses Windows;
 
const
  crypt32 = 'crypt32.dll';
 
  // Flags:
  CRYPT_STRING_BASE64HEADER = 0;
  // Base64, with certificate beginning and ending headers
  CRYPT_STRING_BASE64 = 1;
  // Base64, without headers
  CRYPT_STRING_BINARY = 2;
  // Pure binary copy
  CRYPT_STRING_BASE64REQUESTHEADER = 3;
  // Base64, with request beginning and ending headers
  CRYPT_STRING_HEX = 4;
  // Hexadecimal only
  CRYPT_STRING_HEXASCII= 5;
  // Hexadecimal, with ASCII character display
  CRYPT_STRING_BASE64X509CRLHEADER = 9;
  // Base64, with X.509 CRL beginning and ending headers
  CRYPT_STRING_HEXADDR = 10;
  // Hexadecimal, with address display
  CRYPT_STRING_HEXASCIIADDR = 11;
  // Hexadecimal, with ASCII character and address display
  CRYPT_STRING_HEXRAW = 12;
  // A raw hex string.
 
function ToBase64(s: string; Flags: dword = CRYPT_STRING_BASE64REQUESTHEADER): string;
function FromBase64(s: string; Flags: dword = CRYPT_STRING_BASE64REQUESTHEADER): string;
 
function CryptStringToBinary(pszString: PChar; cchString: dword; dwFlags: dword;
         pbBinary: pointer; var pcbBinary: dword; var pdwSkip: dword;
         var pdwFlags: dword): boolean; stdcall;
 
function CryptBinaryToString(pbBinary: pointer; cbBinary: dword; dwFlags: dword;
         pszString: PChar; var pcchString: dword): boolean; stdcall;
 
function CryptStringToBinaryA(pszString: PChar; cchString: dword; dwFlags: dword;
         pbBinary: pointer; var pcbBinary: dword; var pdwSkip: dword;
         var pdwFlags: dword): boolean; stdcall;
 
function CryptBinaryToStringA(pbBinary: pointer; cbBinary: dword; dwFlags: dword;
         pszString: PChar; var pcchString: dword): boolean; stdcall;
 
function CryptStringToBinaryW(pszString: PWideChar; cchString: dword; dwFlags: dword;
         pbBinary: pointer; var pcbBinary: dword; var pdwSkip: dword;
         var pdwFlags: dword): boolean; stdcall;
 
function CryptBinaryToStringW(pbBinary: pointer; cbBinary: dword; dwFlags: dword;
         pszString: PWideChar; var pcchString: dword): boolean; stdcall;
 
implementation
 
function CryptStringToBinary; external crypt32 name 'CryptStringToBinaryA';
function CryptBinaryToString; external crypt32 name 'CryptBinaryToStringA';
function CryptStringToBinaryA; external crypt32 name 'CryptStringToBinaryA';
function CryptBinaryToStringA; external crypt32 name 'CryptBinaryToStringA';
function CryptStringToBinaryW; external crypt32 name 'CryptStringToBinaryW';
function CryptBinaryToStringW; external crypt32 name 'CryptBinaryToStringW';
 
function ToBase64(s: string; Flags: dword = CRYPT_STRING_BASE64REQUESTHEADER): string;
var sz: dword;
begin
  CryptBinaryToString(pointer(s), Length(s), Flags, nil, sz);
  SetLength(result, sz);
  CryptBinaryToString(pointer(s), Length(s), Flags, pointer(result), sz);
end;
 
function FromBase64(s: string; Flags: dword = CRYPT_STRING_BASE64REQUESTHEADER): string;
var sz, skip: dword;
begin
  CryptStringToBinary(pointer(s), Length(s), Flags, nil, sz, skip, Flags);
  SetLength(result, sz);
  CryptStringToBinary(pointer(s), Length(s), Flags, pointer(result), sz, skip, Flags);
end;
 
end.

