unit shm_Classes;

interface

uses
   Classes, DB, shf_FormAbstract, Variants, SysUtils,
   Dialogs, shm_Types, ActiveX, Forms;

type

  // ����� �� ����������� ����� �����������
  TFormClass = class of Tfsh_FormAbstract;


  //----------------------------------------------------------------------------
  // ������ �������� ��� ����������� � ��� ��������
  //----------------------------------------------------------------------------
  TFormMapping = class(TObject)
  private
    FFormName  : string;      // �������� �����
    FFormClass : TFormClass;  // ����� �����
    FFormType  : TFormType;   // ��� �����
    FFormID    : TGUID;       // ������������� �����
  public
    constructor CreateExt(AFormName: string; AClassForm: TFormClass; AFormType: TFormType;
                          AFormID: TGUID);

    property    FormName  : string read FFormName write FFormName;
    property    FormClass : TFormClass read FFormClass write FFormClass;
    property    FormType : TFormType read FFormType write FFormType;
    property    FormID : TGUID read FFormID write FFormID;
  end;


  //----------------------------------------------------------------------------
  // ����� Factory ��� �����������
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




  // ������� �������� ����� ����� ������ Factory
  function getFactoryForms : TFactoryForm;
  //�������� �����
  function CreateForm(AParent: Tfsh_FormAbstract; AFormID: TGUID; AQueryDataObject: TObject;
                      AExecParams: TExecFormParamTypes; AFilterParams: TFilterParams): Tfsh_FormAbstract; overload;

  //��������� GUID��
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
//  ���������:  getFactoryForms
//  ����������: ���������/�������� 1 ���������� FactoryForms
//-----------------------------------------------------------------------------
function getFactoryForms : TFactoryForm;
begin
  // ���� FactoryForm �� ������, �� �������
  if not Assigned(FactoryForms) then FactoryForms := TFactoryForm.Create;
  // ���������� ������ �� FactoryForm
  Result := FactoryForms;
end ;


//-----------------------------------------------------------------------------
//  ���������:  CreateForm
//  ����������: ������� ����� ����������
//  ����:       21.02.2006
//-----------------------------------------------------------------------------
function CreateForm(AParent: Tfsh_FormAbstract; AFormID: TGUID; AQueryDataObject: TObject;
                    AExecParams: TExecFormParamTypes; AFilterParams: TFilterParams): Tfsh_FormAbstract;
var
  i: integer;
  NewGUID: TGUID;
begin
  //1. �������� ��� �����
  //2. ������� �����
  //3. ����������� ���������� ��������� ���������� �����
  //4. ������ ��������� ���������
  //5. ������� ����� �������, ���� ����
  //6. ��������� ����� ������, ���� ����

  
  //1. �������� ��� �����
  i := getFactoryForms.FormMappings.IndexOf(GUIDToString(AFormID));

  // If not, then raise an exception
  if i = -1 then
    raise Exception.Create('����� � ��������������� <' +  GUIDToString(AFormID) + '> �� ������� � ������!' ) ;

  //2. ������� �����
  Result:= FactoryForms.Items[i].FormClass.Create(AParent);
  CoCreateGUID(NewGUID);
  Result.FormID:= NewGUID;

  if Assigned(AParent) then
    Result.ParentFormID:= AParent.FormID;

  //3. ����������� ���������� ��������� ���������� �����
  Result.ExecParams:= AExecParams;
  if Assigned(AFilterParams) then
    Result.FilterParams.AssignValues(AFilterParams);
  Result.QueryDataObject:= AQueryDataObject;

  //4. ������ ��������� ���������
  Result.ApplyParams;
end;


//-------------------------------------------------------------
//  ��������� GUID��
//-------------------------------------------------------------
function CompareGUID(GUID1, GUID2: TGUID): boolean;
begin
  Result:= GUIDToString(GUID1) = GUIDToString(GUID2);
end;



//-----------------------------------------------------------------------------
//  ���������:  TFormMapping.CreateExt
//  ����������: �����������  TFormMapping
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
// �����  TFactoryForm
//----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//  ���������:  TFactoryForm.Create
//  ����������: ����������� TFactoryForm
//-----------------------------------------------------------------------------
constructor TFactoryForm.Create;
begin
  inherited ;
  // ������� TSTringList ��� �������� ReportMappings
  FFormMappings := TStringList.Create;
  FFormMappings.Sorted:= True;
end;


//-----------------------------------------------------------------------------
//  ���������:  TFactoryForm.Destroy
//  ����������: ���������� TFactoryForm
//-----------------------------------------------------------------------------
destructor TFactoryForm.Destroy;
var
  i: integer;
begin
  // ��������� FFormMappings � ����������� ��������������� �������
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
//  ���������:  TFactoryForm.RegisterForm
//  ����������: ����������� ����� � Factory
//-----------------------------------------------------------------------------
procedure TFactoryForm.RegisterForm(AFormName: string; AClassForm: TFormClass;
                                    AFormType: TFormType; AFormID: TGUID);
var
  i: integer ;
  lFormMapping : TFormMapping ;
begin

  // ��������� ���� �� ���������� � ������ ���������������
  i := FFormMappings.IndexOf(GUIDToString(AFormID));

  // ���� ����� ����� ����, �������� �� ������.
  if i <> -1 then begin
    MessageDlg('����� <' + AFormName + '> ��� ���������������� � �������.', mtInformation, [mbOK], 0 ) ;
    Exit ;
  end ;

  // ������� FormMapping object
  lFormMapping := TFormMapping.CreateExt(AFormName, AClassForm, AFormType, AFormID);

  // ��������� AFormID, � FormMapping � ������ ������������
  FFormMappings.AddObject(GUIDToString(AFormID), lFormMapping);

end;




//-----------------------------------------------------------------------------
//  ���������:  TFactoryForm.GetForm
//  ����������: ��������� ���������� ����� �� ��������������
//-----------------------------------------------------------------------------
function TFactoryForm.GetForm(AFormID: TGUID; AExecParams: TExecFormParamTypes; AFilterParams: TParams): Tfsh_FormAbstract;
var
  i : integer ;
begin

  // ���� �� � ������ �����
  i := FFormMappings.IndexOf(GUIDToString(AFormID));

  // If not, then raise an exception
  if i = -1 then
    raise Exception.Create('����� � ��������������� <' +  GUIDToString(AFormID) + '> �� ������� � ������!' ) ;

  // �������� ������� �����������
//  Result := FactoryForms.Items[i].FormClass.Instance(AExecParams, AFilterParams);

  Result.BringToFront;
end ;


//-----------------------------------------------------------------------------
//  ���������:  TFactoryForm.GetFormByName
//  ����������: ��������� ���������� ����� �� �� �����
//-----------------------------------------------------------------------------
function TFactoryForm.GetFormByName(AFormName: string; AExecParams: TExecFormParamTypes; AFilterParams: TParams): Tfsh_FormAbstract;
var
  i, j : integer;
begin

  // ���� �� � ������ �����?
  i := -1;
  for j:= 0 to FFormMappings.Count - 1 do
    if FactoryForms.Items[j].FormName = AFormName then
    begin
      i:= j;
      Break;
    end;

  // If not, then raise an exception
  if i = -1 then
    raise Exception.Create('����� <' +  AFormName + '> �� ������� � ������!' ) ;

  // �������� ������� �����
//  Result := FactoryForms.Items[i].FormClass.Instance(AExecParams, AFilterParams);

  Result.BringToFront;
end ;


//-----------------------------------------------------------------------------
//  ���������:  TFactoryForm.GetFormID
//  ����������: �������� ID ����� �� �����
//  ����:       21.02.2006
//-----------------------------------------------------------------------------
function  TFactoryForm.GetFormID(AFormName: string): TGUID;
var
  i, j : integer;
begin
  Result:= GUID_NULL;

  // ���� �� � ������ �����?
  i := -1;
  for j:= 0 to FFormMappings.Count - 1 do
    if FactoryForms.Items[j].FormName = AFormName then
    begin
      i:= j;
      Break;
    end;

  // If not, then raise an exception
  if i = -1 then
    raise Exception.Create('����� <' +  AFormName + '> �� ������� � ������!' )
  else
    Result:= FactoryForms.Items[i].FFormID;
end ;


function TFactoryForm.GetFormIDByClass(AFormClass: TFormClass): TGUID;
var
  i, j : integer;
begin
  Result:= GUID_NULL;

  // ���� �� � ������ �����?
  i := -1;
  for j:= 0 to FFormMappings.Count - 1 do
    if FactoryForms.Items[j].FormClass = AFormClass then
    begin
      i:= j;
      Break;
    end;

  // If not, then raise an exception
  if i = -1 then
    raise Exception.Create('����� <' +  AFormClass.ClassName + '> �� ������� � ������!' )
  else
    Result:= FactoryForms.Items[i].FFormID;
end;





//-------------------------------------------------------------
//����������� VarArray � TParams
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
