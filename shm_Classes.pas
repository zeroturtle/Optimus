unit shm_Classes;

interface

uses
   Classes, DB, shf_FormAbstract, Variants, SysUtils,
   Dialogs, shm_Types, ActiveX, Forms;

type

  // Сылка на абстрактный класс справочника
  TFormClass = class of Tfsh_FormAbstract;


  //----------------------------------------------------------------------------
  // Объект хранящий тип справочника и его название
  //----------------------------------------------------------------------------
  TFormMapping = class(TObject)
  private
    FFormName  : string;      // название формы
    FFormClass : TFormClass;  // класс формы
    FFormType  : TFormType;   // тип формы
    FFormID    : TGUID;       // идентификатор формы
  public
    constructor CreateExt(AFormName: string; AClassForm: TFormClass; AFormType: TFormType;
                          AFormID: TGUID);

    property    FormName  : string read FFormName write FFormName;
    property    FormClass : TFormClass read FFormClass write FFormClass;
    property    FormType : TFormType read FFormType write FFormType;
    property    FormID : TGUID read FFormID write FFormID;
  end;


  //----------------------------------------------------------------------------
  // Класс Factory для справочиков
  //----------------------------------------------------------------------------
  TFactoryForm = class(TObject)
  private
    FFormMappings: TStringList;
  protected
    function GetItem(Index: Integer): TFormMapping;
  public
    constructor Create;
    Destructor  Destroy; override ;
    Procedure   RegisterForm(AFormName: string; AClassForm: TFormClass; AFormType: TFormType;
                             AFormID: TGUID);
    function    GetForm(AFormID: TGUID; AExecParams: TExecFormParamTypes; AFilterParams: TParams): Tfsh_FormAbstract;
    function    GetFormByName(AFormName: string; AExecParams: TExecFormParamTypes; AFilterParams: TParams): Tfsh_FormAbstract;
    function    GetFormID(AFormName: string): TGUID;
    function    GetFormIDByClass(AFormClass : TFormClass): TGUID;
    property    FormMappings: TStringList read FFormMappings write FFormMappings;
    property    Items[Index: Integer]: TFormMapping read GetItem;
  end;




  // Функция создания одной копии класса Factory
  function getFactoryForms : TFactoryForm;
  //создание формы
  function CreateForm(AParent: Tfsh_FormAbstract; AFormID: TGUID; AQueryDataObject: TObject;
                      AExecParams: TExecFormParamTypes; AFilterParams: TFilterParams): Tfsh_FormAbstract; overload;

  //сравнение GUIDов
  function CompareGUID(GUID1, GUID2: TGUID): boolean;


const
  DictionEP: TExecFormParamTypes = [efptMultiSelect, efptOpenDatasets];
  DocListEP: TExecFormParamTypes = [efptShowFiltr];
  DocInfoEP: TExecFormParamTypes = [efptDisableFiltr, efptOpenDatasets];

  GUID_NULL: TGUID = '{00000000-0000-0000-0000-000000000000}';
  NULL_GUID: TGUID = '{00000000-0000-0000-0000-000000000000}';


var
  FactoryForms : TFactoryForm;

implementation

uses shfm_ValueFrameDiction;


//-----------------------------------------------------------------------------
//  Процедура:  getFactoryForms
//  Назначение: получение/создание 1 экземпляра FactoryForms
//-----------------------------------------------------------------------------
function getFactoryForms : TFactoryForm;
begin
  // Если FactoryForm не создан, то создаем
  if not Assigned(FactoryForms) then FactoryForms := TFactoryForm.Create;
  // Возвращаем ссылку на FactoryForm
  Result := FactoryForms;
end ;


//-----------------------------------------------------------------------------
//  Процедура:  CreateForm
//  Назначение: создает форму приложения
//  Дата:       21.02.2006
//-----------------------------------------------------------------------------
function CreateForm(AParent: Tfsh_FormAbstract; AFormID: TGUID; AQueryDataObject: TObject;
                    AExecParams: TExecFormParamTypes; AFilterParams: TFilterParams): Tfsh_FormAbstract;
var
  i: integer;
  NewGUID: TGUID;
begin
  //1. получаем тип формы
  //2. создаем форму
  //3. присваиваем переданные параметры параметрам формы
  //4. парсим переданые параметры
  //5. создаем форму фильтра, если надо
  //6. открываем набор данных, если надо

  
  //1. получаем тип формы
  i := getFactoryForms.FormMappings.IndexOf(GUIDToString(AFormID));

  // If not, then raise an exception
  if i = -1 then
    raise Exception.Create('Форма с идентификатором <' +  GUIDToString(AFormID) + '> не найдена в списке!' ) ;

  //2. создаем форму
  Result:= FactoryForms.Items[i].FormClass.Create(AParent);
  CoCreateGUID(NewGUID);
  Result.FormID:= NewGUID;

  if Assigned(AParent) then
    Result.ParentFormID:= AParent.FormID;

  //3. присваиваем переданные параметры параметрам формы
  Result.ExecParams:= AExecParams;
  if Assigned(AFilterParams) then
    Result.FilterParams.AssignValues(AFilterParams);
  Result.QueryDataObject:= AQueryDataObject;

  //4. парсим переданые параметры
  Result.ApplyParams;
end;


//-------------------------------------------------------------
//  сравнение GUIDов
//-------------------------------------------------------------
function CompareGUID(GUID1, GUID2: TGUID): boolean;
begin
  Result:= GUIDToString(GUID1) = GUIDToString(GUID2);
end;



//-----------------------------------------------------------------------------
//  Процедура:  TFormMapping.CreateExt
//  Назначение: конструктор  TFormMapping
//-----------------------------------------------------------------------------
constructor TFormMapping.CreateExt(AFormName: string; AClassForm: TFormClass; AFormType: TFormType;
                                   AFormID: TGUID);
begin
  Create;
  FormName  := AFormName;
  FormClass := AClassForm;
  FormType  := AFormType;
  FormID    := AFormID;
end;


//----------------------------------------------------------------------------
// класс  TFactoryForm
//----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//  Процедура:  TFactoryForm.Create
//  Назначение: конструктор TFactoryForm
//-----------------------------------------------------------------------------
constructor TFactoryForm.Create;
begin
  inherited ;
  // Создаем TSTringList для хранения ReportMappings
  FFormMappings := TStringList.Create;
  FFormMappings.Sorted:= True;
end;


//-----------------------------------------------------------------------------
//  Процедура:  TFactoryForm.Destroy
//  Назначение: деструктор TFactoryForm
//-----------------------------------------------------------------------------
destructor TFactoryForm.Destroy;
var
  i: integer;
begin
  // Сканируем FFormMappings и освобождаем ассоциированные объекты
  for i := 0 to FFormMappings.Count - 1 do
    TObject(FFormMappings.Objects[i]).Free;
  // Free FReportMappings
  FFormMappings.Free;
  // Call inherited
  inherited;
end;

function TFactoryForm.GetItem(Index: Integer): TFormMapping;
begin
  Result := TFormMapping(FFormMappings.Objects[Index]);
end;


//-----------------------------------------------------------------------------
//  Процедура:  TFactoryForm.RegisterForm
//  Назначение: регистрация формы в Factory
//-----------------------------------------------------------------------------
procedure TFactoryForm.RegisterForm(AFormName: string; AClassForm: TFormClass;
                                    AFormType: TFormType; AFormID: TGUID);
var
  i: integer ;
  lFormMapping : TFormMapping ;
begin

  // Проверяем есть ли справочник с данным идентификатором
  i := FFormMappings.IndexOf(GUIDToString(AFormID));

  // Если такая форма есть, сообщаем об ошибке.
  if i <> -1 then begin
    MessageDlg('Форма <' + AFormName + '> уже зарегистрирована в системе.', mtInformation, [mbOK], 0 ) ;
    Exit ;
  end ;

  // создаем FormMapping object
  lFormMapping := TFormMapping.CreateExt(AFormName, AClassForm, AFormType, AFormID);

  // Добавляем AFormID, и FormMapping в список справочников
  FFormMappings.AddObject(GUIDToString(AFormID), lFormMapping);

end;




//-----------------------------------------------------------------------------
//  Процедура:  TFactoryForm.GetForm
//  Назначение: получение конкретной формы по идентификатору
//-----------------------------------------------------------------------------
function TFactoryForm.GetForm(AFormID: TGUID; AExecParams: TExecFormParamTypes; AFilterParams: TParams): Tfsh_FormAbstract;
var
  i : integer ;
begin

  // Есть ли в списке форма
  i := FFormMappings.IndexOf(GUIDToString(AFormID));

  // If not, then raise an exception
  if i = -1 then
    raise Exception.Create('Форма с идентификатором <' +  GUIDToString(AFormID) + '> не найдена в списке!' ) ;

  // Вызываем функцию справочника
//  Result := FactoryForms.Items[i].FormClass.Instance(AExecParams, AFilterParams);

  Result.BringToFront;
end ;


//-----------------------------------------------------------------------------
//  Процедура:  TFactoryForm.GetFormByName
//  Назначение: получение конкретной формы по ее имени
//-----------------------------------------------------------------------------
function TFactoryForm.GetFormByName(AFormName: string; AExecParams: TExecFormParamTypes; AFilterParams: TParams): Tfsh_FormAbstract;
var
  i, j : integer;
begin

  // Есть ли в списке форма?
  i := -1;
  for j:= 0 to FFormMappings.Count - 1 do
    if FactoryForms.Items[j].FormName = AFormName then
    begin
      i:= j;
      Break;
    end;

  // If not, then raise an exception
  if i = -1 then
    raise Exception.Create('Форма <' +  AFormName + '> не найдена в списке!' ) ;

  // Вызываем функцию формы
//  Result := FactoryForms.Items[i].FormClass.Instance(AExecParams, AFilterParams);

  Result.BringToFront;
end ;


//-----------------------------------------------------------------------------
//  Процедура:  TFactoryForm.GetFormID
//  Назначение: получает ID формы по имени
//  Дата:       21.02.2006
//-----------------------------------------------------------------------------
function  TFactoryForm.GetFormID(AFormName: string): TGUID;
var
  i, j : integer;
begin
  Result:= GUID_NULL;

  // Есть ли в списке форма?
  i := -1;
  for j:= 0 to FFormMappings.Count - 1 do
    if FactoryForms.Items[j].FormName = AFormName then
    begin
      i:= j;
      Break;
    end;

  // If not, then raise an exception
  if i = -1 then
    raise Exception.Create('Форма <' +  AFormName + '> не найдена в списке!' )
  else
    Result:= FactoryForms.Items[i].FFormID;
end ;


function TFactoryForm.GetFormIDByClass(AFormClass: TFormClass): TGUID;
var
  i, j : integer;
begin
  Result:= GUID_NULL;

  // Есть ли в списке форма?
  i := -1;
  for j:= 0 to FFormMappings.Count - 1 do
    if FactoryForms.Items[j].FormClass = AFormClass then
    begin
      i:= j;
      Break;
    end;

  // If not, then raise an exception
  if i = -1 then
    raise Exception.Create('Форма <' +  AFormClass.ClassName + '> не найдена в списке!' )
  else
    Result:= FactoryForms.Items[i].FFormID;
end;





//-------------------------------------------------------------
//преобразует VarArray в TParams
//-------------------------------------------------------------
function VariantToParams(AParams: Variant): TParams;
var
  i: integer;
  Param: TParam;
  v: Variant;
begin
  Result := TParams.Create;
  if not VarIsNull(AParams) then
    for i := 0 to VarArrayHighBound(AParams, 1) do begin
      v := AParams[i];
      Param := TParam.Create(Result, ptUnknown);
      Param.Name := v[0];
      Param.Value := v[1];
      Result.AddParam(Param);
    end;
end;










initialization
  // Call the function getFactoryForm, to create an instance of TFactoryForm.
  getFactoryForms;

finalization
  // Free FactoryForm
  FactoryForms.Free;

end.                        
