unit shm_Types;

interface

uses
   Classes, DB, SysUtils;

type

  // Типы форм приложения
  TFormType = (ftDiction, ftDocList, ftDocInfo, ftReport, ftMaster);

  //типы параметров запуска формы
  TExecFormParamType = (efptMultiSelect, efptShowFiltr, efptDisableFiltr, efptOpenDatasets,
                        efptNewRecord, efptSelectData);
  TExecFormParamTypes = set of TExecFormParamType;

  TParams = DB.TParams;

  //----------------------------------------------------------------------------
  // Класс CollectionItem для хранения параметров фильтрации
  //----------------------------------------------------------------------------
  TFilterParam = class(TCollectionItem)
  private
    FControlName: string;
    FParams: TParams;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
  published
    property ControlName: string read FControlName write FControlName;
    property Params: TParams read FParams write FParams;
  end;


   //----------------------------------------------------------------------------
  // Класс Collection для хранения записей о параметрах фильтрации
  //----------------------------------------------------------------------------
  TFilterParams = class(TCollection)
  private
    FParent: TPersistent;
    function GetItem(Index: Integer): TFilterParam;
    procedure SetItem(Index: Integer; const Value: TFilterParam);
  public
    property Items[Index: Integer]: TFilterParam read GetItem write SetItem; default;
    constructor Create(AParent: TPersistent);
    function Add: TFilterParam;
    function AddFilterParam(AControlName, AParamName: string; AParamValue: Variant): TFilterParam;
    procedure Assign(Source: TPersistent);
    procedure AssignValues(Source: TFilterParams);
  end;




  //----------------------------------------------------------------------------
  // Класс CollectionItem для хранения параметров полей справочников
  //----------------------------------------------------------------------------
  TDictionField = class(TCollectionItem)
  private
    FDBGridName: string;
    FDictionGUID: string;
    FFieldName: string;
    FCallFieldName: string;
    FDictionFieldName: string;
    FExecParams: TExecFormParamTypes;
    FFilterParams: TFilterParams;

  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
  published
    property DBGridName: string read FDBGridName write FDBGridName;
    property DictionGUID: string read FDictionGUID write FDictionGUID;
    property FieldName: string read FFieldName write FFieldName;
    property DictionFieldName: string read FDictionFieldName write FDictionFieldName;
    property CallFieldName: string read FCallFieldName write FCallFieldName;
    property ExecParams: TExecFormParamTypes read FExecParams write FExecParams;
    property FilterParams: TFilterParams read FFilterParams write FFilterParams;
  end;


  //----------------------------------------------------------------------------
  // Класс Collection для хранения записей о параметрах полей справочников
  //----------------------------------------------------------------------------
  TDictionFields = class(TCollection)
  private
    FParent: TPersistent;
    function GetItem(Index: Integer): TDictionField;
    procedure SetItem(Index: Integer; const Value: TDictionField);
  public
    property Items[Index: Integer]: TDictionField read GetItem write SetItem; default;
    constructor Create(AParent: TPersistent);
    function Add: TDictionField;
    function AddDictionField(ADBGridName: string; ADictionGUID: TGUID; ACallFieldName, AFieldName, ADictionFieldName: string;
                             AExecParams: TExecFormParamTypes; AFilterParams: TFilterParams): TDictionField;

    function AddShortDictionField(ADBGridName: string; ADictionGUID: TGUID; ACallFieldName, AFieldName: string): TDictionField;

  end;





implementation


{ TDictionField }
constructor TDictionField.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FFilterParams:= TFilterParams.Create(Collection);
end;

destructor TDictionField.Destroy;
begin
  FFilterParams.Free;
  inherited;
end;

{ TDictionFields }
constructor TDictionFields.Create(AParent: TPersistent);
begin
  inherited Create(TDictionField);
  FParent:= AParent;
end;

function TDictionFields.Add: TDictionField;
begin
  Result := TDictionField(inherited Add)
end;

function TDictionFields.GetItem(Index: Integer): TDictionField;
begin
  Result := TDictionField(inherited GetItem(Index))
end;

procedure TDictionFields.SetItem(Index: Integer;
  const Value: TDictionField);
begin
  inherited SetItem(Index, Value)
end;


//-----------------------------------------------------------------------------
//  Процедура:  TDictionFields.AddDictionField
//  Назначение: добавление информации о поле-справочнике в коллекцию
//  Дата:       16.03.2006
//-----------------------------------------------------------------------------
function TDictionFields.AddDictionField(ADBGridName: string; ADictionGUID: TGUID;
 ACallFieldName, AFieldName, ADictionFieldName: string; AExecParams: TExecFormParamTypes; AFilterParams: TFilterParams): TDictionField;
begin
  Result:= Add;
  Result.FDBGridName:= ADBGridName;
  Result.FDictionGUID:= GUIDToString(ADictionGUID);
  Result.FFieldName:= AFieldName;
  Result.FDictionFieldName:= ADictionFieldName;
  Result.CallFieldName:= ACallFieldName;
  Result.FExecParams:= AExecParams;
  Result.FFilterParams.Assign(AFilterParams);
end;

//-----------------------------------------------------------------------------
//  Процедура:  TDictionFields.AddShortDictionField
//  Назначение: сокращенный метод добавления поля в коллекцию
//  Дата:       16.03.2006
//-----------------------------------------------------------------------------
function TDictionFields.AddShortDictionField(ADBGridName: string;
  ADictionGUID: TGUID; ACallFieldName, AFieldName: string): TDictionField;
begin
  Result:= Add;
  Result.FDBGridName:= ADBGridName;
  Result.FDictionGUID:= GUIDToString(ADictionGUID);
  Result.FFieldName:= AFieldName;
  Result.FDictionFieldName:= AFieldName;
  Result.CallFieldName:= ACallFieldName;
  Result.FExecParams:= [efptOpenDatasets, efptSelectData];
  Result.FFilterParams:= nil;

end;

{ TFilterParam }
constructor TFilterParam.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FParams:= TParams.Create(self);
end;

destructor TFilterParam.Destroy;
begin
  FParams.Free;
  inherited;
end;

{ TFilterParams }
function TFilterParams.Add: TFilterParam;
begin
  Result := TFilterParam(inherited Add);
end;

function TFilterParams.AddFilterParam(AControlName, AParamName: string;
                                      AParamValue: Variant): TFilterParam;
var
  i: integer;
  Param : TParam;
begin
  Result := nil;

  //находим FilterParam компоеннта AControlName
  for i := 0 to Count - 1 do
  begin
    Result := TFilterParam(inherited Items[i]);
    if AnsiCompareText(Result.ControlName, AControlName) = 0 then
      Break
    else
      Result := nil;
  end;

  //если не нашли параметр - добавляем в коллекцию
  if not Assigned(Result) then
    Result:= Add;

  Result.FControlName:= AControlName;

  Param := TParam.Create(Result.Params, ptUnknown);


  Param.Name := AParamName;
  Param.Value := AParamValue;
  Result.Params.AddParam(Param);

end;

//-----------------------------------------------------------------------------
//  Процедура:  TFilterParams.Assign
//  Назначение: процедура копирует параметры
//  Дата:       17.03.2006
//-----------------------------------------------------------------------------
procedure TFilterParams.Assign(Source: TPersistent);
var
  i: integer;
  FP: TFilterParam;
begin
  if (Source is TFilterParams) then
  begin
    Self.Clear;
    for i:= 0 to (Source as TFilterParams).Count - 1 do
    begin
      FP:= Self.Add;
      FP.FControlName:= (Source as TFilterParams)[i].FControlName;
      FP.FParams.Assign((Source as TFilterParams)[i].FParams);
    end;
  end else
    raise Exception.Create('Класс не является списком параметров фильтрации.');

end;

//-----------------------------------------------------------------------------
//  Процедура:  TFilterParams.AssignValues
//  Назначение: процедура копирует значения параметров
//  Дата:       17.03.2006
//-----------------------------------------------------------------------------
procedure TFilterParams.AssignValues(Source: TFilterParams);
var
  i, j: integer;
  FP: TFilterParam;
begin
  if (Source is TFilterParams) then
  begin

    for i:= 0 to (Source as TFilterParams).Count - 1 do
    begin
      //находим FilterParam компонента, которому копируются значения
      for j:= 0 to Self.Count - 1 do
      begin

        FP := TFilterParam(inherited Items[j]);
        if AnsiCompareText(FP.ControlName, (Source as TFilterParams)[i].ControlName) = 0 then
          Break
        else
          FP := nil;
      end;

      //если нашли параметр
      if Assigned(FP) then
        FP.Params.AssignValues((Source as TFilterParams)[i].Params);

    end;

  end else
    raise Exception.Create('Класс не является списком параметров фильтрации.');

end;





constructor TFilterParams.Create(AParent: TPersistent);
begin
  inherited Create(TFilterParam);
  FParent:= AParent;
end;

function TFilterParams.GetItem(Index: Integer): TFilterParam;
begin
  Result := TFilterParam(inherited GetItem(Index));
end;

procedure TFilterParams.SetItem(Index: Integer; const Value: TFilterParam);
begin
  inherited SetItem(Index, Value);
end;



end.
 