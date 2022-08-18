unit Unit5;

interface

uses
  SysUtils, Classes, ABSConst, ABSMain, Dialogs, Controls, DB, frxClass,
  frxDBSet, Variants;

type
  TDataMain = class(TDataModule)
    dbJudbge: TABSDatabase;
    tblPool: TABSTable;
    tblRoles: TABSTable;
    tblPeople: TABSTable;
    tblJudge: TABSTable;
    tblTeam: TABSTable;
    dsTeam: TDataSource;
    tblTeamRound: TABSTable;
    dsTeamRound: TDataSource;
    qryCalcResult: TABSQuery;
    dsComp: TDataSource;
    dsJudge: TDataSource;
    tblJudgeJudge_ID: TAutoIncField;
    tblJudgePeople_ID: TIntegerField;
    tblJudgeRole_ID: TIntegerField;
    tblJudgeCompetition_ID: TIntegerField;
    tblRound: TABSTable;
    tblMember: TABSTable;
    tblType: TABSTable;
    tblJudgeName: TStringField;
    tblTeamName: TStringField;
    tblTeamNumber: TStringField;
    tblCountry: TABSTable;
    tblTeamCountry: TStringField;
    tblMemberTeam_ID: TIntegerField;
    tblMemberPeople_ID: TIntegerField;
    tblMemberRole_ID: TIntegerField;
    tblMemberRole: TStringField;
    tblTeamTeam_ID: TAutoIncField;
    tblTeamCountry_ID: TIntegerField;
    tblTeamCompetition_ID: TIntegerField;
    dsRound: TDataSource;
    tblResultDetail: TABSTable;
    tblTeamRoundResult_ID: TAutoIncField;
    tblTeamRoundRound_ID: TIntegerField;
    tblTeamRoundTeam_ID: TIntegerField;
    tblTeamRoundVideoFile: TStringField;
    tblResultDetailResult_ID: TIntegerField;
    tblResultDetailJudge_ID: TIntegerField;
    tblResultDetailJudge: TStringField;
    tblTeamRoundCompetition_ID: TIntegerField;
    tblTeamRoundRound: TStringField;
    tblTeamRoundScores: TFloatField;
    frCompetition: TfrxDBDataset;
    frMembers: TfrxDBDataset;
    qryCompetitors: TABSQuery;
    tblJudgeCategory: TStringField;
    tblPrint: TABSTable;
    dsPrint: TDataSource;
    frTeam: TfrxDBDataset;
    tblResultDetailIsTrainee: TBooleanField;
    tblMemberContact: TStringField;
    tblMemberBirthday: TStringField;
    tblMemberCategory: TStringField;
    tblMemberCertificate: TStringField;
    tblMemberJumps: TIntegerField;
    tblMemberName: TStringField;
    frResultDetail: TfrxDBDataset;
    tblJudgeContact: TStringField;
    tblJudgeBirthday: TStringField;
    tblJudgeCertificate: TStringField;
    frRound: TfrxDBDataset;
    tblJudgeRemark: TStringField;
    frCompetitors: TfrxDBDataset;
    tblCompetition: TABSTable;
    tblCompetitionCompetition_ID: TAutoIncField;
    tblCompetitionName: TStringField;
    tblCompetitionType_ID: TIntegerField;
    tblCompetitionRounds: TSmallintField;
    tblCompetitionWorkTime: TWordField;
    tblCompetitionType: TStringField;
    frJudgeView: TfrxDBDataset;
    frProtokol: TfrxDBDataset;
    tblRoundRound_ID: TAutoIncField;
    tblRoundCompetition_ID: TIntegerField;
    tblRoundRound_Num: TWordField;
    tblRoundPool_Sequence_Code: TStringField;
    tblRoundRound_Type: TIntegerField;
    tblRoundTypeName: TStringField;
    qryCompetition: TABSQuery;
    frPool: TfrxDBDataset;
    qryPool: TABSQuery;
    tblJudgeSort: TIntegerField;
    frJudges: TfrxDBDataset;
    dsPool: TDataSource;
    tblCompetitionPlace: TStringField;
    tblCompetitionDateName: TStringField;
    dsResultDetail: TDataSource;
    tblResultDetailMonitor: TWordField;
    tblResultDetailP1: TFloatField;
    tblResultDetailP2: TFloatField;
    tblResultDetailP3: TFloatField;
    tblResultDetailP4: TFloatField;
    tblResultDetailP5: TFloatField;
    tblResultDetailP6: TFloatField;
    tblResultDetailP7: TFloatField;
    tblResultDetailP8: TFloatField;
    tblResultDetailP9: TFloatField;
    tblResultDetailP10: TFloatField;
    tblResultDetailP11: TFloatField;
    tblResultDetailP12: TFloatField;
    tblResultDetailP13: TFloatField;
    tblResultDetailP14: TFloatField;
    tblResultDetailP15: TFloatField;
    tblResultDetailP16: TFloatField;
    tblResultDetailP17: TFloatField;
    tblResultDetailP18: TFloatField;
    tblResultDetailP19: TFloatField;
    tblResultDetailP20: TFloatField;
    tblResultDetailP21: TFloatField;
    tblResultDetailP22: TFloatField;
    tblResultDetailP23: TFloatField;
    tblResultDetailP24: TFloatField;
    tblResultDetailP25: TFloatField;
    tblResultDetailP26: TFloatField;
    tblResultDetailP27: TFloatField;
    tblResultDetailP28: TFloatField;
    tblResultDetailP29: TFloatField;
    tblResultDetailP30: TFloatField;
    tblJudgeRole_Name: TStringField;
    dsMember: TDataSource;
    frIndVedom: TfrxDBDataset;
    tblJudgePort: TIntegerField;
    tblTeamTeamNameCode: TStringField;
    tblJudgeIsTrainee: TBooleanField;
    tblJudgeCountry_ID: TIntegerField;
    tblJudgeCoumtry_Name: TStringField;
    tblTeamRoundStartTime: TLargeintField;
    tblErrors: TABSTable;
    qryJumpError: TABSQuery;
    frJumpError: TfrxDBDataset;
    dsJumpError: TDataSource;
    frTeamRound: TfrxDBDataset;
    frxErrorDesc: TfrxDBDataset;
    qryErrorDesc: TABSQuery;
    MemPool: TABSTable;
    tblJudgeRating: TFloatField;
    tblTeamGuest: TBooleanField;
    tblTeamRoundJudgeTime: TDateTimeField;
    tblCompetitionMask: TStringField;
    qryCalcRound: TABSQuery;
    tblResultDetailT1: TFloatField;
    tblResultDetailT2: TFloatField;
    tblResultDetailT3: TFloatField;
    tblResultDetailT4: TFloatField;
    tblResultDetailT5: TFloatField;
    tblResultDetailT6: TFloatField;
    tblResultDetailT7: TFloatField;
    tblResultDetailT8: TFloatField;
    tblResultDetailT9: TFloatField;
    tblResultDetailT10: TFloatField;
    tblResultDetailT11: TFloatField;
    tblResultDetailT12: TFloatField;
    tblResultDetailT13: TFloatField;
    tblResultDetailT14: TFloatField;
    tblResultDetailT15: TFloatField;
    tblResultDetailT16: TFloatField;
    tblResultDetailT17: TFloatField;
    tblResultDetailT18: TFloatField;
    tblResultDetailT19: TFloatField;
    tblResultDetailT20: TFloatField;
    tblResultDetailT21: TFloatField;
    tblResultDetailT22: TFloatField;
    tblResultDetailT23: TFloatField;
    tblResultDetailT24: TFloatField;
    tblResultDetailT25: TFloatField;
    tblResultDetailT26: TFloatField;
    tblResultDetailT27: TFloatField;
    tblResultDetailT28: TFloatField;
    tblResultDetailT29: TFloatField;
    tblResultDetailT30: TFloatField;
    tblRoundDisabled: TBooleanField;
    frIndProtokol: TfrxDBDataset;
    frxRoundProtokol: TfrxDBDataset;
    tblMemberNumber: TStringField;
    tblJudgeNickName: TStringField;
    tblCompetitionPool_ID: TIntegerField;
    tblPoolType: TABSTable;
    tblCompetitionPool: TStringField;
    tblTeamRoundPenalty_Name: TStringField;
    tblTeamRoundPenalty_ID: TIntegerField;
    tblResultDetailViews: TIntegerField;
    frShilders: TfrxDBDataset;
    qryGetQuery: TABSQuery;
    qryRoundResult: TABSQuery;
    frRoundResult: TfrxDBDataset;
    tblMemberLocation: TStringField;
    tblMemberAddress: TStringField;
    tblJudgeAddress: TStringField;
    tblJudgeLocation: TStringField;
    tblTeamCountry_Code: TStringField;
    tblPoolPool_Code: TStringField;
    tblPoolName: TStringField;
    tblPoolType_ID: TIntegerField;
    tblPoolImage1: TBlobField;
    tblPoolImage2: TBlobField;
    tblPoolImage3: TBlobField;
    tblPoolPoolName: TStringField;
    tblClub: TABSTable;
    tblPeoplePeople_ID: TAutoIncField;
    tblPeopleName: TStringField;
    tblPeopleAddress: TStringField;
    tblPeopleBirthday: TStringField;
    tblPeopleCategory: TStringField;
    tblPeopleCertificate: TStringField;
    tblPeopleJumps: TIntegerField;
    tblPeopleLocation: TStringField;
    tblPeopleContact: TStringField;
    tblPeopleRemark: TStringField;
    tblPeopleClub_ID: TIntegerField;
    tblPeopleClub_Name: TStringField;
    tblTeamClub_ID: TIntegerField;
    tblTeamClub_Name: TStringField;
    tblTeamRoundComment: TStringField;
    tblCompetitionOptions: TMemoField;
    tblTeamRoundSign: TBooleanField;
    tblCompetitionDateFrom: TDateField;
    tblCompetitionDateTo: TDateField;
    tblCompetitionProtoSort: TBooleanField;
    tblCompetitionPoolTypeName: TStringField;
    tblMemberInsuranceDate: TStringField;
    tblMemberMedicineDate: TStringField;
    tblTeamRoundViewNumber: TSmallintField;
    tblTeamRoundPool_Sequence: TStringField;
    tblCompetitionPoolPrefix: TIntegerField;
    tblRoundFigure1: TStringField;
    tblRoundFigure2: TStringField;
    tblRoundFigure3: TStringField;
    tblRoundFigure4: TStringField;
    tblRoundFigure5: TStringField;
    tblTeamRoundFigure1: TStringField;
    tblTeamRoundFigure2: TStringField;
    tblTeamRoundFigure3: TStringField;
    tblTeamRoundFigure4: TStringField;
    tblTeamRoundFigure5: TStringField;
    tblEvent: TABSTable;
    tblTeamEvent_ID: TIntegerField;
    tblTeamEvent_Name: TStringField;
    dsEvent: TDataSource;
    qryReport: TABSQuery;
    tblStartList: TABSTable;
    dsStartList: TDataSource;
    tblMemberTrainer_ID: TIntegerField;
    tblMemberTrainerName: TStringField;
    dsReport: TDataSource;
    frTeamMembers: TfrxDBDataset;
    tblMemberMember_ID: TIntegerField;
    tblJudgeRole_Group: TStringField;
    tblRoundEvent_ID: TIntegerField;
    tblRoundEventName: TStringField;
    tblEventEvent_ID: TIntegerField;
    tblEventEvent_Name: TStringField;
    tblEventCompetition_ID: TIntegerField;
    tblTeamRoundEvent_ID: TIntegerField;
    tblRoundRound_Title: TStringField;
    tblTeamRoundLastTime: TFloatField;
    tblMemberResult: TABSTable;
    tblMemberResultResult_ID: TAutoIncField;
    tblMemberResultRound_ID: TIntegerField;
    tblMemberResultMember_ID: TIntegerField;
    tblMemberResultRate: TFloatField;
    tblMemberResultCompetition_ID: TIntegerField;
    tblMemberResultSign: TBooleanField;
    tblMemberResultRound_Num: TStringField;
    qryWSCPRound: TABSQuery;
    qryWSCPTask: TABSQuery;
    frWSCPRound: TfrxDBDataset;
    frWSCPExercise: TfrxDBDataset;
    tblTask: TABSTable;
    tblMemberResultExercise: TStringField;
    tblMemberResultScores: TFloatField;
    tblMemberResultTask_ID: TIntegerField;
    tblMemberResultPenalty_ID: TIntegerField;
    qryPenalty: TABSQuery;
    tblMemberResultPenalty_Name: TStringField;
    tblMemberResultMemberName: TStringField;
    tblMemberResultMemberNumber: TStringField;
    qryTeamMembers: TABSQuery;
    dsCompetition: TDataSource;
    tblTeamRoundTask_ID: TIntegerField;
    tblResultDetail1: TABSTable;
    tblResultDetail1Result_ID: TIntegerField;
    dsMemberResult: TDataSource;
    tblMemberResultColumns: TStringField;
    tblTeamRoundTask: TStringField;
    tblTeamRoundColumns: TStringField;
    frMemberDetail: TfrxDBDataset;
    frMemberResult: TfrxDBDataset;
    tblTeamRoundTeamName: TStringField;
    tblResultDetail1P1: TFloatField;
    tblResultDetail1P2: TBooleanField;
    tblResultDetail1P3: TBooleanField;
    tblResultDetail1P4: TBooleanField;
    tblResultDetail1P5: TBooleanField;
    tblResultDetail1P6: TBooleanField;
    tblResultDetail1P7: TBooleanField;
    tblResultDetail1P8: TBooleanField;
    tblResultDetail1P9: TBooleanField;
    tblResultDetail1P10: TBooleanField;
    tblMemberResultTeam_ID: TIntegerField;
    tblMemberResultMemberTeam_ID: TIntegerField;
    procedure tblCompetition2BeforeClose(DataSet: TDataSet);
    procedure tblRoundResultBeforeOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure tblJudgeBeforeOpen(DataSet: TDataSet);
    procedure tblCompetition2DeleteError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure tblCompetition2EditError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure tblCompetition2PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure tblJudgeNewRecord(DataSet: TDataSet);
    procedure tblTeamNewRecord(DataSet: TDataSet);
    procedure tblMemberNewRecord(DataSet: TDataSet);
    procedure tblTeamAfterOpen(DataSet: TDataSet);
    procedure tblTeamRoundAfterOpen(DataSet: TDataSet);
    procedure qryCompetitionBeforeOpen(DataSet: TDataSet);
    procedure tblRoundNewRecord(DataSet: TDataSet);
    procedure tblRoundUpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure tblRoundAfterOpen(DataSet: TDataSet);
    procedure tblCompetitionCalcFields(DataSet: TDataSet);
    procedure tblCompetitionAfterOpen(DataSet: TDataSet);
    procedure tblMemberBeforeOpen(DataSet: TDataSet);
    procedure tblTeamCalcFields(DataSet: TDataSet);
    procedure tblTeamRoundBeforeDelete(DataSet: TDataSet);
    procedure qryJumpErrorBeforeOpen(DataSet: TDataSet);
    procedure qryErrorDesc1BeforeOpen(DataSet: TDataSet);
    procedure MemPoolNewRecord(DataSet: TDataSet);
    procedure qryPoolAfterOpen(DataSet: TDataSet);
    procedure tblErrorsNewRecord(DataSet: TDataSet);
    procedure tblCompetitionBeforeClose(DataSet: TDataSet);
    procedure tblCompetitionNewRecord(DataSet: TDataSet);
    procedure tblRoundBeforeOpen(DataSet: TDataSet);
    procedure tblRoundAfterClose(DataSet: TDataSet);
    procedure tblRoundPool_Sequence_CodeChange(Sender: TField);
    procedure tblTeamRoundPool_SequenceChange(Sender: TField);
    procedure tblEventNewRecord(DataSet: TDataSet);
    procedure tblCompetitionAfterPost(DataSet: TDataSet);
    procedure tblRoundCalcFields(DataSet: TDataSet);
    procedure tblResultDetailBeforeDelete(DataSet: TDataSet);
    procedure tblMemberResultBeforeOpen(DataSet: TDataSet);
    procedure tblMemberResultNewRecord(DataSet: TDataSet);
    procedure tblMemberResultAfterPost(DataSet: TDataSet);
    procedure tblTeamRoundBeforePost(DataSet: TDataSet);
    procedure tblResultDetail1NewRecord(DataSet: TDataSet);
    procedure tblMemberResultBeforeClose(DataSet: TDataSet);
    procedure tblResultDetail1AfterPost(DataSet: TDataSet);
    procedure tblResultDetail1BeforeOpen(DataSet: TDataSet);
    procedure tblMemberResultAfterOpen(DataSet: TDataSet);
    procedure tblResultDetail1AfterClose(DataSet: TDataSet);
    procedure tblMemberResultBeforePost(DataSet: TDataSet);
    procedure tblMemberResultBeforeDelete(DataSet: TDataSet);
    procedure tblResultDetail1AfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataMain: TDataMain;

procedure Explode(var a: array of string; Border, S: string);

implementation

uses constant;

{$R *.dfm}

procedure Explode(var a: array of string; Border, S: string);
var
   S2: string;
   i: Integer;
begin
   i  := 0;
   S2 := S + Border;
   repeat
     a[i] := Copy(S2, 0,Pos(Border, S2) - 1);
     Delete(S2, 1,Length(a[i] + Border));
     Inc(i);
   until S2 = '';
end;

procedure TDataMain.tblCompetition2BeforeClose(DataSet: TDataSet);
begin
  tblTeam.Close;
  tblPool.Close;
  tblJudge.Close;
end;

procedure TDataMain.tblRoundResultBeforeOpen(DataSet: TDataSet);
begin
  tblTeamRound.Open;
end;

procedure TDataMain.DataModuleCreate(Sender: TObject);
begin
  dbJudbge.DatabaseFileName := DATABASEFILE;
//  dbJudbge.MultiUser := True;
  try
    dbJudbge.Open;
  except
    Halt(1);
  end;
end;

procedure TDataMain.DataModuleDestroy(Sender: TObject);
begin
  dbJudbge.Close;
end;

procedure TDataMain.tblJudgeBeforeOpen(DataSet: TDataSet);
begin
  tblPeople.Open;
end;

procedure TDataMain.tblCompetition2DeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
   Action:=daAbort;
   if (E is EABSEngineError) then
        case (EABSEngineError(E).ErrorCode) of
          ABS_ERR_RECORD_LOCKED:
           begin
           if MessageDlg('The record is locked. '+
                         'Do you want to try to delete this record again?',
                          mtWarning,[mbYes,mbNo],0)=mrYes then
              Action:=daRetry;
           end;
          ABS_ERR_TABLE_LOCKED:
           begin
           if MessageDlg('The table is locked. '+
                         'Do you want to try to delete this record again?',
                          mtWarning,[mbYes,mbNo],0)=mrYes then
              Action:=daRetry;
           end;
          ABS_ERR_DELETE_RECORD_MODIFIED:
           begin
             MessageDlg('The record you are trying to delete has been modified by another user. '+
                        'The table will now be refreshed. If you want to delete this record, try again.',
                        mtWarning,[mbOk],0);
             DataSet.Refresh;
           end;
          ABS_ERR_DELETE_RECORD_DELETED:
           begin
             MessageDlg('The record you are trying to delete has been deleted by another user '+
                        'The table will now be refreshed',
                        mtWarning,[mbOk],0);
             DataSet.Refresh;
           end
      else
         MessageDlg(E.Message,mtError,[mbOK],0);
       end
   else
      MessageDlg(E.Message,mtError,[mbOK],0);
end;

procedure TDataMain.tblCompetition2EditError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
   Action:=daAbort;
   if (E is EABSEngineError) then
        case (EABSEngineError(E).ErrorCode) of
          ABS_ERR_RECORD_LOCKED:
           begin
             if MessageDlg('The record you are trying to edit is locked. '+
                           'Do you want to try again?',
                           mtWarning,[mbYes,mbNo],0)=mrYes then
                Action:=daRetry;
           end;
          ABS_ERR_TABLE_LOCKED:
           begin
             if MessageDlg('The table you are trying to edit is locked. '+
                           'Do you want to try again?',
                           mtWarning,[mbYes,mbNo],0)=mrYes then
                Action:=daRetry;
           end;
          ABS_ERR_UPDATE_RECORD_MODIFIED:
           begin
             MessageDlg('The record you are trying to edit has been modified by another user. '+
                        'The table will now be refreshed',
                        mtWarning,[mbOk],0);
             DataSet.Refresh;
             Action:=daRetry;
           end;
          ABS_ERR_UPDATE_RECORD_DELETED:
           begin
             MessageDlg('The record you are trying to edit has been deleted by another user '+
                        'The table will now be refreshed',
                        mtWarning,[mbOk],0);
             DataSet.Refresh;
             Action:=daRetry;
           end
        else
          MessageDlg(E.Message,mtError,[mbOK],0);
        end
   else
      MessageDlg(E.Message,mtError,[mbOK],0);
end;

procedure TDataMain.tblCompetition2PostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
   Action:=daAbort;
   if (E is EABSEngineError) then
      begin
      if (EABSEngineError(E).ErrorCode = ABS_ERR_CONSTRAINT_VIOLATED) then
         MessageDlg(EABSEngineError(E).ErrorMessage+
                    '. Please change the record to make the constraint satisfied '+
                    'and re-post the record.',mtError,[mbOK],0)
      else if (EABSEngineError(E).ErrorCode = ABS_ERR_TABLE_LOCKED) then
         begin
         if MessageDlg('The table is locked. '+
                       'Do you want to try to post this record again?',
                        mtWarning,[mbYes,mbNo],0)=mrYes then
            Action:=daRetry;
         end
      else
         MessageDlg(E.Message,mtError,[mbOK],0);
       end
   else
      MessageDlg(E.Message,mtError,[mbOK],0);
end;

procedure TDataMain.tblJudgeNewRecord(DataSet: TDataSet);
begin
  tblJudgeCompetition_ID.Value := tblCompetition.FieldByName('Competition_ID').AsInteger;  //tblCompetitionCompetition_ID.Value;
end;

procedure TDataMain.tblTeamNewRecord(DataSet: TDataSet);
begin
  tblTeamCompetition_ID.Value := tblCompetition.FieldByName('Competition_ID').AsInteger;//tblCompetitionCompetition_ID.Value;
  tblTeamNumber.Value := Format('%d%.2u',[tblCompetitionPoolPrefix.Value, tblTeam.RecordCount+1]);
  tblTeamEvent_ID.Value := tblEventEvent_ID.Value;
end;

procedure TDataMain.tblMemberNewRecord(DataSet: TDataSet);
begin
  tblMemberTeam_ID.Value := tblTeamTeam_ID.Value;
  tblMemberNumber.Value := Format('%s%d',[tblTeamNumber.Value, tblMember.RecordCount+1]);
end;

procedure TDataMain.tblTeamAfterOpen(DataSet: TDataSet);
begin
  tblMember.Open;
end;
                                           
procedure TDataMain.tblTeamRoundAfterOpen(DataSet: TDataSet);
begin
  tblResultDetail.Open;
  qryPenalty.Open;
end;

procedure TDataMain.qryCompetitionBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TABSQuery).Params[0].AsInteger := tblCompetition.FieldByName('Competition_ID').AsInteger;
end;

procedure TDataMain.tblRoundNewRecord(DataSet: TDataSet);
begin
//  tblRoundCompetition_ID.AsInteger := tblCompetition.FieldByName('Competition_ID').AsInteger;
  tblRoundRound_Type.AsInteger := tblCompetition.FieldByName('Type_ID').AsInteger;
  tblRoundRound_Num.AsInteger := tblRound.RecordCount + 1;
end;

procedure TDataMain.tblRoundUpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
  tblRoundAfterOpen(DataSet);
end;

procedure TDataMain.tblRoundAfterOpen(DataSet: TDataSet);
begin
  tblEvent.Open;
  qryPool.Open;
end;

procedure TDataMain.tblCompetitionCalcFields(DataSet: TDataSet);
begin
// для выбора мероприятия из списка
  tblCompetitionDateName.Value := Format('"%s" [%s]:  %s-%s',
    [tblCompetitionName.Value, tblCompetitionPoolTypeName.Value,
    DateToStr(tblCompetitionDateFrom.Value), DateToStr(tblCompetitionDateTo.Value)]);
end;

procedure TDataMain.tblCompetitionAfterOpen(DataSet: TDataSet);
begin
  tblJudge.Open;
  tblTeam.Open;
  tblType.Open;
  tblRound.Open;
  qryGetQuery.Open;
  tblTask.Open;
end;

procedure TDataMain.tblMemberBeforeOpen(DataSet: TDataSet);
begin
   tblPeople.Open;
   tblRoles.Open;
end;

procedure TDataMain.tblTeamCalcFields(DataSet: TDataSet);
begin
  tblTeamTeamNameCode.Value := Format('%s - "%s"',[tblTeamNumber.Value,tblTeamName.Value]);
end;

procedure TDataMain.tblTeamRoundBeforeDelete(DataSet: TDataSet);
var j: Integer;
    Q: TABSQuery;
begin
  try
    Q := TABSQuery.Create(Self);
    Q.DatabaseName :=  'dbJudbge';
  {удалить предыдущий результат чтоб начать судить повторно}
    with Q do begin
      SQL.Clear;
      SQL.Add('DELETE FROM RoundError WHERE Result_ID=:FFF; DELETE FROM resultdetail rd  WHERE rd.Result_ID=:CCC; DELETE FROM ViewDetail WHERE Result_ID=:DDD');
      Prepare;
      for j := 0 to ParamCount-1 do Params[j].AsInteger := DataSet.FieldByName('Result_ID').AsInteger;
      ExecSQL;
    end;
  finally
    Q.Free;
  end;
end;

procedure TDataMain.qryJumpErrorBeforeOpen(DataSet: TDataSet);
begin
  with (DataSet as TabsQuery) do begin
    Params[0].AsInteger := tblCompetition.FieldByName('Competition_ID').AsInteger;
    Params[1].AsInteger := tblTeamRound.FieldByName('Result_ID').AsInteger;
  end;
end;

procedure TDataMain.qryErrorDesc1BeforeOpen(DataSet: TDataSet);
var i : integer;
begin
  with (DataSet as TAbsQuery) do
    for i := 0 to Params.Count - 1 do
      Params[i].AsInteger := tblTeamRound.FieldByName('Result_ID').AsInteger;
end;

procedure TDataMain.MemPoolNewRecord(DataSet: TDataSet);
begin
  MemPool.FieldByName('Round_ID').AsInteger := tblRound.FieldByName('Round_ID').AsInteger;
  MemPool.FieldByName('Pool_Sequence').AsString := tblRound.FieldByName('Pool_Sequence_Code').AsString;
end;

procedure TDataMain.qryPoolAfterOpen(DataSet: TDataSet);
var i, j : integer;
    StreamBlob: TStream;
begin
  j := 0;
  with MemPool do begin
    Close;
    EmptyTable;
    Open;
    if not Locate('Round_ID',tblRound.FieldByName('Round_ID').AsInteger,[]) then begin
      Append;
      qryPool.First;
      while not qryPool.Eof do  begin
        for i := 1 to 3 do
          if (not qryPool.FieldByName('Image'+IntToStr(i)).IsNull) then begin
              inc(j);
              try
                StreamBlob := qryPool.CreateBlobStream(qryPool.FieldByName('Image'+IntToStr(i)),bmRead);
                with MemPool.CreateBlobStream(MemPool.FieldByName('Pic'+IntToStr(j)),bmWrite) do
                  try
                    CopyFrom(StreamBlob,StreamBlob.Size);
                  finally
                    Free;
                  end;
              finally
                StreamBlob.Free;
              end;
          end;
          qryPool.Next;
      end;
      FieldByName('CountPic').AsInteger := j;
      Post;
    end;
  end;
end;

procedure TDataMain.tblErrorsNewRecord(DataSet: TDataSet);
begin
  tblErrors.FieldByName('Code').AsString := Format('%d',[tblErrors.RecordCount + 1]);
  tblErrors.FieldByName('Type_ID').AsInteger := tblCompetitionType_ID.Value;
end;

procedure TDataMain.tblCompetitionBeforeClose(DataSet: TDataSet);
begin

// закрыть все что связано с отчетами
  qryCompetition.Close;
  qryCompetitors.Close;
  qryRoundResult.Close;
  qryReport.Close;

// закрыть все что было открыто вместе с таблицей
  tblJudge.Close;
  tblTeam.Close;
  tblType.Close;
  tblRound.Close;
  tblTask.Close;  
  qryGetQuery.Close;
end;

procedure TDataMain.tblCompetitionNewRecord(DataSet: TDataSet);
begin
  with OptionsList do begin
    Clear;
    Add(IntToStr(MAXPORTS));
    Add(IntToStr(_PLAYBACKSPEED));
    Add(IntToStr(_CONCENSUSTIME));
    Add(IntToStr(_PUSHPROTECTPERIOD));
    Add(_VIDEODIRECTORY);
    Add(IntToStr(_MAXVALUE));
    Add(IntToStr(_MAXPENALTY));
    Add(BoolToStr(_VIEWSCREEN,true));
    Add(BoolToStr(_USEFTP,true));
    DataMain.tblCompetition.FieldByName('Options').AsString := CommaText;
  end;
end;

procedure TDataMain.tblRoundBeforeOpen(DataSet: TDataSet);
begin
  MemPool.CreateTable;
end;

procedure TDataMain.tblRoundAfterClose(DataSet: TDataSet);
begin
  MemPool.DeleteTable;
  tblEvent.Close;
end;

procedure TDataMain.tblRoundPool_Sequence_CodeChange(Sender: TField);
var Figures: TStringList;
    i: integer;
begin
  try
    Figures := TStringList.Create;
    with tblRound do begin
      Figures.DelimitedText := tblRoundPool_Sequence_Code.Value;
      for i:=1 to 5 do
        if i<=Figures.Count then
          FieldByName('Figure'+IntToStr(i)).AsString := Figures[i-1]
        else
          FieldByName('Figure'+IntToStr(i)).AsString := '';
    end;
  finally
    Figures.Free;
  end;
end;

procedure TDataMain.tblTeamRoundPool_SequenceChange(Sender: TField);
var Figures: TStringList;
    i: integer;
begin
  try
    Figures := TStringList.Create;
    with tblTeamRound do begin
      Figures.DelimitedText := tblTeamRoundPool_Sequence.Value;
      for i:=1 to 5 do
        if i<=Figures.Count then
          FieldByName('Figure'+IntToStr(i)).AsString := Figures[i-1]
        else
          FieldByName('Figure'+IntToStr(i)).AsString := '';
    end;
  finally
    Figures.Free;
  end;
end;

procedure TDataMain.tblEventNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('Competition_ID').AsInteger := tblCompetition.FieldByName('Competition_ID').AsInteger;
end;

procedure TDataMain.tblCompetitionAfterPost(DataSet: TDataSet);
var Competition_ID: Integer;
begin
  // создать зачет по умолчанию
  if tblEvent.IsEmpty then begin
    Competition_ID := DataMain.tblCompetition.LastAutoincValue('Competition_ID');
    tblEvent.InsertRecord([NULL, DEFAULT_EVENTNAME, Competition_ID]);
  end;
end;

procedure TDataMain.tblRoundCalcFields(DataSet: TDataSet);
begin
  tblRoundRound_Title.Value := Format('%s (%s)',[tblRoundRound_Num.AsString,tblRoundEventName.AsString]);
end;

procedure TDataMain.tblResultDetailBeforeDelete(DataSet: TDataSet);
var j: Integer;
    Q: TABSQuery;
begin
  try
    Q := TABSQuery.Create(Self);
    Q.DatabaseName :=  'dbJudbge';
  {удалить предыдущий результат чтоб начать судить повторно}
    with Q do begin
      SQL.Clear;
      SQL.Add('DELETE FROM ViewDetail WHERE Result_ID=:DDD AND Monitor=:AAA');
      Prepare;
      Params[0].AsInteger := DataSet.FieldByName('Result_ID').AsInteger;
      Params[1].AsInteger := DataSet.FieldByName('Monitor').AsInteger;
      ExecSQL;
    end;
  finally
    Q.Free;
  end;
end;

procedure TDataMain.tblMemberResultBeforeOpen(DataSet: TDataSet);
begin
  qryCompetitors.Open;
end;

procedure TDataMain.tblMemberResultNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('Competition_ID').AsInteger := tblCompetition.FieldByName('Competition_ID').AsInteger;  //tblMemberResultCompetition_ID
end;

procedure TDataMain.tblMemberResultAfterPost(DataSet: TDataSet);
begin
{
  // пересчитать Rate для всех значений
  UPDATE wscp u SET rate=round((Score*100/(select max(Score) from wscp i where i.round_id= e.round_id AND i.Competition_ID=u.Competition_ID)),2)
  WHERE Competition_ID=:Competition_ID;
}
end;

procedure TDataMain.tblTeamRoundBeforePost(DataSet: TDataSet);
begin
//  tblTeamRoundPool_Sequence.Value := tblRoundPool_Sequence_Code.Value;
end;

procedure TDataMain.tblResultDetail1NewRecord(DataSet: TDataSet);
var i: integer;
begin
  tblResultDetail1Result_ID.Value := tblMemberResultResult_ID.Value;
  for i := 1 to tblTask.FieldByName('MQP').AsInteger do
    DataSet.FieldByName('P'+IntToStr(i)).Value := NULL;
end;

procedure TDataMain.tblMemberResultAfterOpen(DataSet: TDataSet);
begin
  tblResultDetail1.Open;
end;

procedure TDataMain.tblMemberResultBeforeClose(DataSet: TDataSet);
begin
  tblResultDetail1.Close;
end;

procedure TDataMain.tblResultDetail1AfterPost(DataSet: TDataSet);
var i : integer;
begin
  tblMemberResult.Edit;
  tblMemberResultScores.Value := tblResultDetail1P1.Value;
  tblMemberResultSign.Value := false;
  tblMemberResult.Post;

// скопировать данные из Memory_ResultDetail в ResultDetail
  with tblResultDetail do begin
    Open;
    if Locate('Result_ID',tblMemberResultResult_ID.Value,[]) then Edit
    else Insert;
    for i := 0 to tblResultDetail1.Fields.Count-1 do
      case tblResultDetail1.Fields[i].DataType of
        ftInteger: FieldByName(tblResultDetail1.Fields[i].FieldName).AsInteger := tblResultDetail1.Fields[i].Value;
        ftFloat  : FieldByName(tblResultDetail1.Fields[i].FieldName).AsFloat := tblResultDetail1.Fields[i].Value;
        ftBoolean:
          if tblResultDetail1.Fields[i].AsBoolean then
            FieldByName(tblResultDetail1.Fields[i].FieldName).Value := 1.0  //в БД все поля оценок float
          else FieldByName(tblResultDetail1.Fields[i].FieldName).AsVariant := NULL;
      end;
    Post;
    Close;
  end;
end;

// таблица судейских оценок - виртуальная
// создается в памяти каждый раз при октрытии
// и очищается после закрытия окна
procedure TDataMain.tblResultDetail1BeforeOpen(DataSet: TDataSet);
var i: integer;
begin
  with TABSQuery.Create(Self) do begin
    SQL.Add('SELECT Result_ID, P1');
    for i := 2 to 10 do  // tblTask.FieldByName('MQP').AsInteger do
      SQL.Add(Format(',CASE WHEN P%d=1 THEN True ELSE False END P%d',[i,i]));
    SQL.Add('INTO MEMORY MemResultDetail FROM ResultDetail');
    SQL.Add('WHERE Result_ID IN (SELECT Result_ID FROM RoundResult WHERE Competition_ID = :Competition_ID);');
    SQL.Add('create unique index UniqueName ON MEMORY MemResultDetail (Result_ID)');
    DatabaseName := 'dbJudbge';
    DataSource := DataMain.dsComp;
    ExecSQL;
    Free;
  end;
end;

procedure TDataMain.tblResultDetail1AfterClose(DataSet: TDataSet);
begin
  tblResultDetail1.EmptyTable;
end;

procedure TDataMain.tblMemberResultBeforePost(DataSet: TDataSet);
begin
// т.к. Team_ID not null берем из lookup поля Competitors
  tblMemberResultTeam_ID.Value := tblMemberResultMemberTeam_ID.Value;
end;

procedure TDataMain.tblMemberResultBeforeDelete(DataSet: TDataSet);
begin
  tblResultDetail1AfterDelete(DataSet);
end;

procedure TDataMain.tblResultDetail1AfterDelete(DataSet: TDataSet);
begin
  with tblResultDetail do begin
    Open;
    if Locate('Result_ID',tblMemberResultResult_ID.Value,[]) then 
      Delete;
    Close;
  end;
end;

end.


