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
    Port: Longword;    // номер порта
    Key: word;		     // скан-код нажатой кнопки
    Point: Smallint;   // оценка * 10
    Time: Cardinal;    // время в милисекундах от системного времени
    Err: Array of TErrorRec;  // номер ошибки
  end;
  TArrPoint = array of TPoint;
  
  TUndoPoint = record
    Sequence : integer; // позиция корректировки
    Point : TPoint;
    Chain: Boolean; // главное или техническое (последовательное) изменение
  end;


  TEventType = (FS2=1,FS4=1,FS8=1,VFS=1,SF=2,SF6=3,FFF=4,FFC=5,FFS=6,WSP=7,WSA=7,CP=8,CF=9);
  TEventSet = set of TEventType;
  PLicense = ^TLicense;
  TLicense = packed record
    DateStart, DateEnd: TDateTime;      // дата выдачи и конец лицензии
    Number : String[5];
    Owner : String[127];     // Владелец
    QtyLicense: integer;    // Максимальное количество портов
    EventType : TEventSet;
    Active : boolean;
  end;


const
  CR = #13;
  FSEvents = [FS2,FS4,FS8,VFS,SF,SF6,CF];
  AEEvents = [FFF,FFC,FFS]; //Free,Comp,Sert
  WSCPEvents = [WSP,WSA,CP];
  AllEvents = FSEvents + AEEvents + WSCPEvents;

resourcestring
//  Все надписи в программе
  APPLICATIONCAPTION = 'OPTIMUS';
  APPNAME           = 'Система электронного судейства';
  APPCONTRIB        = 'При поддержке ДЗ Майское (Днепропетровск, Украина)';
  APPVERSIONNUMBER  = 'Версия: %s';
  APPCOPYRIGHT      = 'Автор ©: 2009 - 2022  Александр Ткаченко';
  APPAUTORSITE      = 'optimus.skydive.dp.ua';

// сообщения в журнал работы программы
  FALSESTARTMSG     = '%s Несинхронный запуск таймера Монитор №%d (%s) : %.0f мс';
  CONFIRMMSG        = 'Дождитесь подсчета результата!';
  SAVESCORESMSG     = '%s Запись результатов порта %d (%s)';
  MONITORCOUNTMSG   = '%s Количество подключенных мониторов %d';
  INVITEPORTMSG     = 'Нажмите номер консоли, цифру от 1 до %d';
  MONITORRESMSG     = '%s Monitor# %d hMon: %x HDC: %x Left: %d Top: %d Right: %d Bottom: %d';
  APPCLOSEMSG       = 'Завершить работу программы?';
  KEYPRESSMSG       = '%s порт %d нажал кнопку %d в %f';
  STARTTIMEMSG      = 'Время старта рабочего времени %d';
  CONSACTIVATEDMSG  = 'Keyboard #%d activated';
  CHANGEMODEMSG     = '%s утановлен режим %s для порта %d';
  REVIEWFRAMEMSG    = 'Установлен просмотра фрагмента от %d до %d ';
  REVIEWMSG         = '%s Просмотр №%d';
  PLAYBACKSPEEDMSG  = 'Скорость просмотра %.0f%%';
  CLOSEMSG          = '%s Закончили оценку';
  BREAKMSG          = '%s Досрочный выход';
  PENALTYMSG        = 'Порт %d поставил штраф за невидность отделения';
  EMPTYLISTMSG      = 'Нет доступных записей для просмотра';
  MINPOINTSERRORMSG = 'ВНИМАНИЕ!  Количество оценок меньше допустимого %d';
  PENALTYERRORMSG   = 'ОШИБКА!  Оценка №%d укажите причину нулевой оценки';
  MAXVALUEERRORMSG  = 'ОШИБКА!  Оценка №%d больше допустимого значения %d';
  MAXPENALTYERRORMSG='ОШИБКА!  Оценка №%d Сумма штрафа %.1f больше MAXPENALTY';
  POINTPENALTYERRORMSG='ОШИБКА!  Оценка №%d Сумма штрафа %.1f превышает значение оценки';
  RANGEERRORMSG     = 'ОШИБКА!  Введено неверное значение';
  CONSNUMERRORMSG   = 'Недопустимый номер судейской консоли (%d)';
  ATTANTIONMSG      = 'ВНИМАНИЕ!  Функция не поддерживается';
  LICENSEMSG        = 'Ошибка чтения лицензии';
  LICENSEEXPIREDMSG = 'Используется простроченная лицензия';
  LICENSEUNREGMSG   = 'Нерегистрированная копия';
  LICENSETYPEMSG    = 'Тип отсутствует в списке лицензии';

  CONSOLACTIVE      = 'Пульты активны';
  CONSOLINACTIVE    = 'Пульты выключены';

  RESULTTIME        = 'Время оценки: %.2f сек; Штраф: %.2f';
  CONSOLTITLE       = 'Судейская консоль № %d (%s)';
  REQUESTSTRING     = 'Установленные запросы: ';
  TABLESTRINGS      = 'Фигуры,Оценки,Ошибки'; //названия строк редактора консоли
  ERRORITEM0        = 'Убрать ошибку';
  JUDGINGTITLE      = '%s '+CR+'Тур №%s, команда %s'+CR+'%s';

// Меню судейской консоли
  EDITMENUITEM0     = 'Отменить крайнее изменение';
  EDITMENUITEM1     = 'Показать жеребьевку';
  EDITMENUITEM2     = 'Показать описание ошибок';
  EDITMENUITEM3     = 'Запрос: Дополнительный просмотр';
  EDITMENUITEM4     = 'Запрос: Штраф на оценку';
  EDITMENUITEM5     = 'Сохранить результат';
  EDITMENUITEM6     = 'Поменять оценки с предыдущим просмотром с текущим';

  SCORINGMENUITEM0  = 'Просмотр сначала';
  SCORINGMENUITEM1  = 'Скорость просмотра замедленно ';

  //Выбрать консоль запуска таймера
  FALSENUITEM0      = 'Старт Все консоли';
  FALSENUITEM1      = 'Старт консоль 1';
  FALSENUITEM2      = 'Старт консоль 2';
  FALSENUITEM3      = 'Старт консоль 3';
  FALSENUITEM4      = 'Старт консоль 4';
  FALSENUITEM5      = 'Старт консоль 5';
  FALSENUITEM6      = 'Просмотр сначала';

  CONFIRMMENUITEM0  = 'Повторный просмотр';
  CONFIRMMENUITEM1  = 'Скорость просмотра замедленно ';
  CONFIRMMENUITEM2  = 'Задать начало фрагмента ';
  CONFIRMMENUITEM3  = 'Задать конец фрагмента ';
  CONFIRMMENUITEM4  = 'Просмотр фрагмента';
  CONFIRMMENUITEM5  = 'Редактировать оценки';
  CONFIRMMENUITEM6  = 'Сохранить результаты и завершить';
  CONFIRMMENUITEM7  = 'Показать оценки результата';
  CONFIRMMENUITEM8  = 'Показать время результата';
  CONFIRMMENUITEM9  = 'Показать ошибки результата';

  JUDGECALL0     = 'Нет';
  JUDGECALL1     = 'Повторный просмотр';
  JUDGECALL2     = 'Просмотр фрагмента';
  JUDGECALL3     = 'Штраф оператора';

  
const
  // параметры командной строки
  cmdDatabase = '-database';  //  задает файл БД
  cmdLicense  = '-license';   //  задает файл лицензии
  cmdWallpaper = '-picture';  //  задает фоновую картинку
  cmdLogFile  = '-logfile';   //  задает файл журналирования
  cmdMultiuser = '-multiuser';
  cmdHelp = '-help';
  cmdDatabaseShort = '-d';
  cmdLicenseShort  = '-l';
  cmdWallpaperShort = '-p';
  cmdLogFileShort  = '-f';
  cmdMultiuserShort = '-m';
  cmdHelpShort = '-h';

HELPCONTENT =
  cmdDatabase+'|'+cmdDatabaseShort+'	файл БД'+ CR +
	cmdLicense+'|'+cmdLicenseShort+'		файл лицензии'+ CR +
	cmdWallpaper+'|'+cmdWallpaperShort+'	фоновую картинку'+ CR +
	cmdLogFile+'|'+cmdLogFileShort+'		журнал работы'+ CR +
  cmdMultiuserShort+' многопользовательский режим'+ CR +
	cmdHelp+'|'+cmdHelpShort+'		вывод справки';

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

// значения по умолчанию
  DEFAULT_EVENTNAME = 'Общий зачет';

  _FLASHDELAYTIME = 200;      //продолжительность подсветки оценки , ms
  _MODEDELAYTIME  = 2000;     //Время задержки переключения экрана
  _SPLASHFORMTIME = 3000;     //ждать 3 секунды
  _PUSHPROTECTPERIOD = 200;   // Период в который блокируется двойное нажатие кнопок, мс
  _CONCENSUSTIME  = 150;      // задержка переключения Sequence ,ms
  _PLAYBACKSPEED  = 50;       // Скорость замедленного просмотра
  _BEEPQUANTITY   = 6;        // Количество beep
  _VIEWSCREEN     = false;    // показывать видео на экранах консолей
  _USEFTP         = false;    // будет ли использоваться FTP сервер
  _VIDEODIRECTORY = '.\video\';
  _DEFAULTTFTPIP  = '127.0.0.1';
  _PAUSETIME        = 5; // длительность стоп-кадра ожидания крайней оценки, сек
  _PAUSECONFIRM     = 1; // ожидание запросов судей после оглашения результатов, мс

// Запросы судей
  JC_NONE      = $00;   //ничего
  JC_REPEAT    = $01;
  JC_FRAME     = $02;
  JC_EXIT      = $04;
  JudgeCalls : array[0..3] of record Num: byte; Name: String; S:String[1]; end =
    ((Num:JC_NONE;   Name:JUDGECALL0; S:'-'),
     (Num:JC_REPEAT; Name:JUDGECALL1; S:'R'),
     (Num:JC_FRAME;  Name:JUDGECALL2; S:'F'),
     (Num:JC_EXIT;   Name:JUDGECALL3; S:'E'));

// Панели (grids) судейской консоли
  PNL_NONE     = $00;
  PNL_INFO     = $01;
  PNL_RESULT   = $02;
  PNL_EDITOR   = $04;
  PNL_DRAW     = $08;
  PNL_MESSAGE  = $10;
  PNL_MENU     = $20;
  Modes: array[TMode] of record
    Name : string[10];  // название режима
    PANELS : Word;
  end = (            
    (Name : 'Ожидание';  PANELS : PNL_INFO),
    (Name : 'Готов';     PANELS : PNL_INFO or PNL_DRAW),
    (Name : 'Просмотр';  PANELS : PNL_NONE),
    (Name : 'Оценка';    PANELS : PNL_NONE),
    (Name : 'Коррекция'; PANELS : PNL_INFO or PNL_EDITOR or PNL_DRAW),
    (Name : 'Запись';    PANELS : PNL_INFO or PNL_RESULT),
    (Name : 'Меню';      PANELS : PNL_NONE),
    (Name : 'Фальшстарт'; PANELS : PNL_INFO or PNL_MESSAGE),
    (Name : 'Ошибки';    PANELS : PNL_NONE),
    (Name : 'Штрафы';      PANELS : PNL_NONE),
    (Name : 'Конец';     PANELS : PNL_NONE));


var
  ActiveForm : TGUID;
  CanJudge : boolean;

  DATABASEFILE : string;
  LicenseFile : string;
  PicFileName : string;
  LogFileName : string;
  MultiuserDBMode : boolean;
  BackgoundPic : TBitmap;      // фоновая картинка для консолей 
  CurrentMode: TMode;          // текущий режим работы системы
  StartTime : Int64;           // время начала судейства
  License : PLicense;


  REPORTDIRECTORY : string = '.\Reports\';
  MAXPOINTS : integer = 1;     //Число оценок которое можно запомнить
  MINPOINTS : integer = 0;     //Число оценок которое ставится при старте
  MAXPORTS : integer = 1;      //Количество портов
  TYPEID   : integer;
  CONCENSUSTIME : integer;
  MAXVALUE : integer;          // наибольшая оценка что можно поставить.
  MAXPENALTY : integer;        // максимальный штраф
  PLAYBACKSPEED : integer;
  VIEWSCREEN : boolean;
  VIDEODIRECTORY : string;     // каталог хранения видео
  DEFAULTTFTPIP : string;
  USEFTP : boolean;
  FIRSTJUDGEMONITORNUM : integer;   // подключение мониторов
                                        // 0 - это экран компьютера
                                        // 1 - телевизор
                                        // 2..n - мониторы судей



function GetString(const Index: integer) : string;
function Convert(Value: TEventSet) : word;


implementation

uses Windows;

// читаем строки из ресурсов программы
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
