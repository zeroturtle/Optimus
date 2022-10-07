unit constant;

interface

uses
  Dialogs, Graphics, Classes;

type
  TMode = (mIdle, mReady, mStandby, mScoring, mEdit, mConfirm, mMenu, mFalse, mError, mValue, mEnd);
  
  PErrorRec = ^TErrorRec;
  TErrorRec = record
     ID : word;
     Code: string[3];
     Desc: string[100];
     Value : Single;
     sub : integer;
     Ch  : boolean;
  end;

  TPoint = record
    Port: Longword;    // ����� �����
    Key: word;		     // ����-��� ������� ������
    Point: Smallint;   // ������ * 10
    Time: Cardinal;    // ����� � ������������ �� ���������� �������
    Err: Array of TErrorRec;  // ����� ������
  end;
  TArrPoint = array of TPoint;
  
  TUndoPoint = record
    Sequence : integer; // ������� �������������
    Point : TPoint;
    Chain: Boolean; // ������� ��� ����������� (����������������) ���������
  end;


  TEventType = (FS2=1,FS4=1,FS8=1,VFS=1,SF=2,SF6=3,FFF=4,FFC=5,FFS=6,WSP=7,WSA=7,CP=8,CF=9);
  TEventSet = set of TEventType;
  PLicense = ^TLicense;
  TLicense = packed record
    DateStart, DateEnd: TDateTime;      // ���� ������ � ����� ��������
    Number : String[5];
    Owner : String[127];     // ��������
    QtyLicense: integer;    // ������������ ���������� ������
    EventType : TEventSet;
    Active : boolean;
  end;


const
  CR = #13;
  FSEvents = [FS2,FS4,FS8,VFS,SF,SF6,CF];
  AEvents = [FFF,FFC,FFS]; //Free,Comp,Sert
  WSCPEvents = [WSP,WSA,CP];
  AllEvents = FSEvents + AEvents + WSCPEvents;

resourcestring
//  ��� ������� � ���������
  APPLICATIONCAPTION = 'OPTIMUS';
  APPNAME         = '������� ������������ ���������';
  APPCONTRIB      = '��� ��������� �� ������� (��������������, �������)';
  APPVERSIONNUMBER= '������: %s';
  APPCOPYRIGHT    = '����� �: 2009 - 2022  ��������� ��������';
  APPAUTORSITE    = 'optimus.skydive.dp.ua';

// ��������� � ������ ������ ���������
  FALSESTARTMSG    = '%s ������������ ������ ������� ������� �%d (%s) : %.0f ��';
  CONFIRMMSG       = '��������� �������� ����������!';
  SAVESCORESMSG    = '%s ������ ����������� ����� %d (%s)';
  MONITORCOUNTMSG  = '%s ���������� ������������ ��������� %d';
  INVITEPORTMSG    = '������� ����� �������, ����� �� 1 �� %d';
  MONITORRESMSG    = '%s Monitor# %d hMon: %x HDC: %x Left: %d Top: %d Right: %d Bottom: %d';
  APPCLOSEMSG      = '��������� ������ ���������?';
  KEYPRESSMSG      = '%s ���� %d ����� ������ %d � %f';
  STARTTIMEMSG     = '����� ������ �������� ������� %d';
  CONSACTIVATEDMSG = 'Keyboard #%d activated';
  CHANGEMODEMSG    = '%s ��������� ����� %s ��� ����� %d';
  REVIEWFRAMEMSG   = '���������� ��������� ��������� �� %d �� %d ';
  REVIEWMSG        = '%s �������� �%d';
  PLAYBACKSPEEDMSG = '�������� ��������� %.0f%%';
  CLOSEMSG         = '%s ��������� ������';
  BREAKMSG         = '%s ��������� �����';
  PENALTYMSG       = '���� %d �������� ����� �� ���������� ���������';
  EMPTYLISTMSG     = '��� ��������� ������� ��� ���������';
  MINPOINTSERRORMSG= '��������!  ���������� ������ ������ ����������� %d';
  PENALTYERRORMSG  = '������!  ������ �%d ������� ������� ������� ������';
  MAXVALUEERRORMSG = '������!  ������ �%d ������ ����������� �������� %d';
  MAXPENALTYERRORMSG='������!  ������ �%d ����� ������ %.1f ��������� �������� ������';
  RANGEERRORMSG    = '������!  ������� �������� ��������';  
  CONSNUMERRORMSG  = '������������ ����� ��������� ������� (%d)';
  ATTANTIONMSG     = '��������!  ������� �� ��������������';
  LICENSEMSG       = '������ ������ ��������';
  LICENSEEXPIREDMSG= '������������ ������������� ��������';
  LICENSEUNREGMSG  = '������������������ �����';
  LICENSETYPEMSG   = '��� ����������� � ������ ��������';

  CONSOLACTIVE     = '������ �������';
  CONSOLINACTIVE   = '������ ���������';

  RESULTTIME       = '����� ������: %.2f ���; �����: %.2f';
  CONSOLTITLE      = '��������� ������� � %d (%s)';
  REQUESTSTRING    = '������������� �������: ';
  TABLESTRINGS     = '������,������,������'; //�������� ����� ��������� �������
  ERRORITEM0       = '������ ������';
  JUDGINGTITLE     = '%s '+CR+'��� �%s, ������� %s'+CR+'%s';

// ���� ��������� �������
  MAINMENUITEM0    = '�������� ������� ���������';
  MAINMENUITEM1    = '�������� ����������';
  MAINMENUITEM2    = '�������� �������� ������';
  MAINMENUITEM3    = '������: �������� ���������';
  MAINMENUITEM4    = '������: �� ����� ��������� (����� -20)';
  MAINMENUITEM5    = '��������� ���������';
  MAINMENUITEM6    = '�������� ������ � ���������� ���������� � �������';

  SCORINGMENUITEM0  = '�������� �� ����������� ��������';
  SCORINGMENUITEM1  = '�������� �� ����������� ��������';

  CONFIRMMENUITEM0  = '��������� ��������';
  CONFIRMMENUITEM1  = '�������� ���������';
  CONFIRMMENUITEM2  = '�������� ����������';
  CONFIRMMENUITEM3  = '��������� ���������';
  CONFIRMMENUITEM4  = '�������� ������ ����������';
  CONFIRMMENUITEM5  = '�������� ����� ����������';
  CONFIRMMENUITEM6  = '�������� ������ ����������';

  CONTROLMENU0 = '�������� �����';
  CONTROLMENU1 = '������� ������� ������� ������� ';
  CONTROLMENU2 = '������� �������� ��������� ';
  CONTROLMENU3 = '�������� ��������� � ';
  CONTROLMENU4 = '�������� ��������� �� ';
  CONTROLMENU5 = '������������� ������';
  CONTROLMENU6 = '��������� ����������';

  JUDGECALL0     = '���';
  JUDGECALL1     = '��������� ��������';
  JUDGECALL2     = '�������� ���������';
  JUDGECALL3     = '����� ���������';

  
const
  // ��������� ��������� ������
  cmdDatabase = '-database';  //  ������ ���� ��
  cmdLicense  = '-license';   //  ������ ���� ��������
  cmdWallpaper = '-picture';  //  ������ ������� ��������
  cmdLogFile  = '-logfile';   //  ������ ���� ��������������
  cmdMultiuser = '-multiuser';
  cmdHelp = '-help';
  cmdDatabaseShort = '-d';
  cmdLicenseShort  = '-l';
  cmdWallpaperShort = '-p';
  cmdLogFileShort  = '-f';
  cmdMultiuserShort = '-m';
  cmdHelpShort = '-h';

HELPCONTENT =
  cmdDatabase+'|'+cmdDatabaseShort+'	���� ��'+ CR +
	cmdLicense+'|'+cmdLicenseShort+'		���� ��������'+ CR +
	cmdWallpaper+'|'+cmdWallpaperShort+'	������� ��������'+ CR +
	cmdLogFile+'|'+cmdLogFileShort+'		������ ������'+ CR +
  cmdMultiuserShort+' ��������������������� �����'+ CR +
	cmdHelp+'|'+cmdHelpShort+'		����� �������';

  Competition_GUID: TGUID = '{37AFF2B2-DE48-4A0A-9336-3A100EB6B3E9}';
  Event_GUID: TGUID       = '{AC34B158-6BD7-439E-AFBD-0578D82C91E2}';
  People_GUID: TGUID      = '{17ED19AF-1966-4575-83A2-CC6C9B02633D}';
  Result_GUID: TGUID      = '{784F5F53-EA77-4B28-A415-8D94E6490058}';
  Role_GUID: TGUID        = '{1C8FF658-B61C-4D4D-B687-338693429F39}';
  Print_GUID: TGUID       = '{224052B3-7633-4028-BD58-E9967B63EEF3}';
  Main_GUID: TGUID        = '{566C343F-9402-47D6-9E6E-B5E403E2EECB}';
  Judge_GUID: TGUID       = '{5A64A362-E416-4359-801A-5EB502A1BB20}';
  Country_GUID: TGUID     = '{A8B6547A-CB24-4CBF-900D-83A8D1461552}';
  Team_GUID: TGUID        = '{19486A0F-CAB4-4B08-81F6-FD233B6C0F17}';
  Error_GUID: TGUID       = '{3CC96BC8-7F74-41C4-8803-A93D1BA79072}';
  Club_GUID: TGUID        = '{919A5CA8-5806-4BCF-A533-ADA0813990BA}';
  Scoring_GUID: TGUID     = '{90CD2088-BEA7-4843-A89C-86945F4FAFC3}';
  Test_GUID: TGUID        = '{785A3693-BAA9-4E88-AB24-6DBF92D279DE}';
  Member_Result_GUID:TGUID= '{4E8A69A3-AB9D-4FCB-9B70-6C80C344409F}';

  CLibAVPath = 'LibAV';
  LICENSE_KEY = 'FSYBBHFV-NQRZRXXH-JINDPXNQ-DFTPXZQH-IYVYQZCT';

  CDialogOptions = [ofHideReadOnly, ofFileMustExist, ofEnableSizing];
  CPictureFiles = '*.BMP;*.GIF;*.JPEG;*.JPG;*.PNG;';
  CAudioFiles = '*.AAC;*.AC3;*.APE;*.DTS;*.FLAC;*.M4A;*.MKA;*.MP2;*.MP3;' +
      '*.MPA;*.MPC;*.OFR;*.OGG;*.RA;*.TTA;*.WAV;*.WMA;';
  CVideoFiles = '*.3GP;*.ASF;*.AVI;*.AVM;*.AVS;*.DAT;*.FLV;*.MKV;*.MOV;' +
      '*.MP4;*.MPEG;*.MPG;*.NSV;*.OGM;*.RM;*.RMVB;*.TP;*.TS;*.VOB;*.WMV;';
  CDialogFilter =
      'Video/Audio/Picture Files|' + CVideoFiles + CAudioFiles + CPictureFiles +
      '|Video Files|' + CVideoFiles +
      '|Audio Files|' + CAudioFiles +
      '|Picture Files|' + CPictureFiles +
      '|All Files|*.*';

// �������� �� ���������
  DEFAULT_EVENTNAME = '����� �����';

  _FLASHDELAYTIME = 200;      //����������������� ��������� ������ , ms
  _MODEDELAYTIME  = 2000;     //����� �������� ������������ ������
  _SPLASHFORMTIME = 3000;     //����� 3 �������
  _PUSHPROTECTPERIOD = 200;   // ������ � ������� ����������� ������� ������� ������, ��
  _CONCENSUSTIME  = 150;      // �������� ������������ Sequence ,ms
//  _MAXVALUE       = 1;        // ���������� ������ ��� ����� ���������.
//  _MAXPENALTY     = 0;        // ������������ �����
  _PLAYBACKSPEED  = 50;       // �������� ������������ ���������
  _BEEPQUANTITY   = 6;        // ���������� beep
  _VIEWSCREEN     = false;    // ���������� ����� �� ������� ��������
  _USEFTP         = false;    // ����� �� �������������� FTP ������
  _VIDEODIRECTORY = '.\video\';
  _DEFAULTTFTPIP  = '127.0.0.1';

  PAUSETIME        = 5; // ������������ ����-����� �������� ������� ������, ���
  PAUSECONFIRM     = 1; // �������� �������� ����� ����� ��������� �����������, ��

  TASKMENULIST   : array[0..6] of String = (MAINMENUITEM0,MAINMENUITEM1,MAINMENUITEM2,MAINMENUITEM3,
                               MAINMENUITEM4,MAINMENUITEM5,MAINMENUITEM6);
  CONFIRMMENULIST: array[0..3] of String  =(CONFIRMMENUITEM0,CONFIRMMENUITEM1,CONFIRMMENUITEM2,CONFIRMMENUITEM3);
  SCORINGMENULIST: array[0..1] of String  =(SCORINGMENUITEM0, SCORINGMENUITEM1);

// ������� �����
  JC_NONE      = $00;   //������
  JC_REPEAT    = $01;
  JC_FRAME     = $02;
  JC_EXIT      = $04;
  JudgeCalls : array[0..3] of record Num: byte; Name: String; S:String[1]; end =
    ((Num:JC_NONE;   Name:JUDGECALL0; S:'-'),
     (Num:JC_REPEAT; Name:JUDGECALL1; S:'R'),
     (Num:JC_FRAME;  Name:JUDGECALL2; S:'F'),
     (Num:JC_EXIT;   Name:JUDGECALL3; S:'E'));

// ������ (grids) ��������� �������
  PNL_NONE     = $00;
  PNL_INFO     = $01;
  PNL_RESULT   = $02;
  PNL_EDITOR   = $04;
  PNL_DRAW     = $08;
  PNL_MESSAGE  = $10;
  PNL_MENU     = $20;
  Modes: array[TMode] of record
    Name : string[10];  // �������� ������
    PANELS : Word;
  end = (            
    (Name : '��������';  PANELS : PNL_INFO),
    (Name : '�����';     PANELS : PNL_INFO or PNL_DRAW),
    (Name : '��������';  PANELS : PNL_NONE),
    (Name : '������';    PANELS : PNL_NONE),
    (Name : '���������'; PANELS : PNL_INFO or PNL_EDITOR or PNL_DRAW),
    (Name : '������';    PANELS : PNL_INFO or PNL_RESULT),
    (Name : '����';      PANELS : PNL_NONE),
    (Name : '����������'; PANELS : PNL_INFO or PNL_MESSAGE),
    (Name : '������';    PANELS : PNL_NONE),
    (Name : '������';      PANELS : PNL_NONE),
    (Name : '�����';     PANELS : PNL_NONE));


var
  ActiveForm : TGUID;
  CanJudge : boolean;

  DATABASEFILE : string;
  LicenseFile : string;
  PicFileName : string;
  LogFileName : string;
  MultiuserDBMode : boolean;
  REPORTDIRECTORY : string = '.\Reports\';

  MAXPOINTS : integer = 1;     //����� ������ ������� ����� ���������
  MINPOINTS : integer = 0;     //����� ������ ������� �������� ��� ������ 
  MAXPORTS : integer = 1;      //���������� ������
  TYPEID   : integer;
  CONCENSUSTIME : integer = _CONCENSUSTIME;
  MAXVALUE : integer;
  MAXPENALTY : integer;
  PLAYBACKSPEED : integer = _PLAYBACKSPEED;
  VIEWSCREEN : boolean = _VIEWSCREEN;
  VIDEODIRECTORY : string = _VIDEODIRECTORY;    // ������� �������� �����
  DEFAULTTFTPIP : string = _DEFAULTTFTPIP;
  USEFTP : boolean = _USEFTP;
  FIRSTJUDGEMONITORNUM : integer = 2;   // ����������� ���������
                                        // 0 - ��� ����� ����������
                                        // 1 - ���������
                                        // 2..n - �������� �����
  CurrentMode: TMode;         // ������� ����� ������ �������
  StartTime : Int64;          // ����� ������ ���������
  License : PLicense;
  OptionsList : TStringList;
  BackgoundPic : TBitmap;
  
function GetString(const Index: integer) : string;
function Convert(Value: TEventSet) : word;


implementation

uses Windows;

// ������ ������ �� �������� ���������
function GetString(const Index: integer) : string;
var
  buffer : array[0..255] of char;
  ls : integer;
begin
  Result := '';
  ls := LoadString(hInstance, Index,  buffer, sizeof(buffer));
  if ls <> 0 then Result := buffer;
end;


function Convert;
var ASet: TEventSet;
DataConvert: Cardinal absolute ASet;
begin
  ASet := Value;
  Result := DataConvert;
end;


end.
