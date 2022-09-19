object DataMain: TDataMain
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 256
  Top = 361
  Height = 655
  Width = 730
  object dbJudge: TABSDatabase
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    Exclusive = False
    MaxConnections = 500
    MultiUser = True
    SessionName = 'Default'
    Left = 24
    Top = 8
  end
  object tblPool: TABSTable
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = False
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'idxCodeType'
        Fields = 'Pool_Code;Type_ID'
        Options = [ixUnique]
      end>
    FieldDefs = <
      item
        Name = 'Pool_Code'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Type_ID'
        DataType = ftInteger
      end
      item
        Name = 'Image'
        DataType = ftBlob
      end
      item
        Name = 'Pool_Img2'
        DataType = ftBlob
      end
      item
        Name = 'Pool_Img3'
        DataType = ftBlob
      end>
    TableName = 'Pool'
    Exclusive = False
    Left = 274
    Top = 64
    object tblPoolPool_Code: TStringField
      FieldName = 'Pool_Code'
      Size = 5
    end
    object tblPoolName: TStringField
      FieldName = 'Name'
      Size = 60
    end
    object tblPoolType_ID: TIntegerField
      FieldName = 'Type_ID'
    end
    object tblPoolImage1: TBlobField
      FieldName = 'Image1'
    end
    object tblPoolImage2: TBlobField
      FieldName = 'Image2'
    end
    object tblPoolImage3: TBlobField
      FieldName = 'Image3'
    end
    object tblPoolPoolName: TStringField
      FieldKind = fkLookup
      FieldName = 'PoolName'
      LookupDataSet = tblPoolType
      LookupKeyFields = 'Pool_ID'
      LookupResultField = 'Name'
      KeyFields = 'Type_ID'
      Size = 50
      Lookup = True
    end
  end
  object tblRoles: TABSTable
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = False
    TableName = 'Roles'
    Exclusive = False
    Left = 336
    Top = 112
  end
  object tblPeople: TABSTable
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = False
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'IndexName'
        Fields = 'Name'
      end>
    FieldDefs = <
      item
        Name = 'People_ID'
        DataType = ftAutoInc
      end
      item
        Name = 'Name'
        Attributes = [faRequired]
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Address'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'Birthday'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Category'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Certificate'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Jumps'
        DataType = ftInteger
      end
      item
        Name = 'Location'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'Contact'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Remark'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Club_ID'
        DataType = ftInteger
      end>
    TableName = 'People'
    Exclusive = False
    Left = 24
    Top = 112
    object tblPeoplePeople_ID: TAutoIncField
      FieldName = 'People_ID'
    end
    object tblPeopleName: TStringField
      FieldName = 'Name'
      Required = True
      Size = 100
    end
    object tblPeopleAddress: TStringField
      FieldName = 'Address'
      Size = 150
    end
    object tblPeopleBirthday: TStringField
      FieldName = 'Birthday'
    end
    object tblPeopleCategory: TStringField
      FieldName = 'Category'
    end
    object tblPeopleCertificate: TStringField
      FieldName = 'Certificate'
    end
    object tblPeopleJumps: TIntegerField
      FieldName = 'Jumps'
    end
    object tblPeopleLocation: TStringField
      FieldName = 'Location'
      Size = 150
    end
    object tblPeopleContact: TStringField
      FieldName = 'Contact'
      Size = 200
    end
    object tblPeopleRemark: TStringField
      FieldName = 'Remark'
      Size = 100
    end
    object tblPeopleClub_ID: TIntegerField
      FieldName = 'Club_ID'
    end
    object tblPeopleClub_Name: TStringField
      FieldKind = fkLookup
      FieldName = 'Club_Name'
      LookupDataSet = tblClub
      LookupKeyFields = 'Club_ID'
      LookupResultField = 'Club_Name'
      KeyFields = 'Club_ID'
      Size = 50
      Lookup = True
    end
  end
  object tblJudge: TABSTable
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = False
    Filter = 'Role_ID<10'
    Filtered = True
    BeforeOpen = tblJudgeBeforeOpen
    OnNewRecord = tblJudgeNewRecord
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'idxID'
        Fields = 'Judge_ID'
        Options = [ixPrimary]
      end
      item
        Name = 'idxCompJudge'
        Fields = 'Competition_ID;Judge_ID'
        Options = [ixUnique]
      end>
    IndexName = 'idxCompJudge'
    FieldDefs = <
      item
        Name = 'Judge_ID'
        DataType = ftAutoInc
      end
      item
        Name = 'Competition_ID'
        DataType = ftInteger
      end
      item
        Name = 'People_ID'
        DataType = ftInteger
      end
      item
        Name = 'Role_ID'
        DataType = ftInteger
      end
      item
        Name = 'Coumtry_ID'
        DataType = ftInteger
      end
      item
        Name = 'Sort'
        DataType = ftInteger
      end
      item
        Name = 'Port'
        DataType = ftInteger
      end
      item
        Name = 'IsTrainee'
        DataType = ftBoolean
      end
      item
        Name = 'Code'
        DataType = ftString
        Size = 3
      end>
    TableName = 'Judges'
    Exclusive = False
    MasterFields = 'Competition_ID'
    MasterSource = dsComp
    Left = 24
    Top = 160
    object tblJudgeJudge_ID: TAutoIncField
      FieldName = 'Judge_ID'
    end
    object tblJudgePeople_ID: TIntegerField
      FieldName = 'People_ID'
    end
    object tblJudgeRole_ID: TIntegerField
      FieldName = 'Role_ID'
    end
    object tblJudgeCompetition_ID: TIntegerField
      FieldName = 'Competition_ID'
    end
    object tblJudgeName: TStringField
      DisplayWidth = 40
      FieldKind = fkLookup
      FieldName = 'Name'
      LookupDataSet = tblPeople
      LookupKeyFields = 'People_ID'
      LookupResultField = 'Name'
      KeyFields = 'People_ID'
      Size = 40
      Lookup = True
    end
    object tblJudgeCategory: TStringField
      FieldKind = fkLookup
      FieldName = 'Category'
      LookupDataSet = tblPeople
      LookupKeyFields = 'People_ID'
      LookupResultField = 'Category'
      KeyFields = 'People_ID'
      Lookup = True
    end
    object tblJudgeContact: TStringField
      FieldKind = fkLookup
      FieldName = 'Contact'
      LookupDataSet = tblPeople
      LookupKeyFields = 'People_ID'
      LookupResultField = 'Contact'
      KeyFields = 'People_ID'
      Size = 200
      Lookup = True
    end
    object tblJudgeBirthday: TStringField
      FieldKind = fkLookup
      FieldName = 'Birthday'
      LookupDataSet = tblPeople
      LookupKeyFields = 'People_ID'
      LookupResultField = 'Birthday'
      KeyFields = 'People_ID'
      Lookup = True
    end
    object tblJudgeCertificate: TStringField
      FieldKind = fkLookup
      FieldName = 'Certificate'
      LookupDataSet = tblPeople
      LookupKeyFields = 'People_ID'
      LookupResultField = 'Certificate'
      KeyFields = 'People_ID'
      Lookup = True
    end
    object tblJudgeRemark: TStringField
      FieldKind = fkLookup
      FieldName = 'Remark'
      LookupDataSet = tblPeople
      LookupKeyFields = 'People_ID'
      LookupResultField = 'Remark'
      KeyFields = 'People_ID'
      Lookup = True
    end
    object tblJudgeSort: TIntegerField
      FieldName = 'Sort'
    end
    object tblJudgeRole_Name: TStringField
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'Role_Name'
      LookupDataSet = tblRoles
      LookupKeyFields = 'Role_ID'
      LookupResultField = 'Role_Name'
      KeyFields = 'Role_ID'
      Size = 50
      Lookup = True
    end
    object tblJudgePort: TIntegerField
      FieldName = 'Port'
    end
    object tblJudgeIsTrainee: TBooleanField
      FieldName = 'IsTrainee'
    end
    object tblJudgeCountry_ID: TIntegerField
      FieldName = 'Country_ID'
    end
    object tblJudgeCoumtry_Name: TStringField
      FieldKind = fkLookup
      FieldName = 'Country_Name'
      LookupDataSet = tblCountry
      LookupKeyFields = 'Country_ID'
      LookupResultField = 'Name'
      KeyFields = 'Country_ID'
      Size = 50
      Lookup = True
    end
    object tblJudgeRating: TFloatField
      FieldName = 'Rating'
    end
    object tblJudgeNickName: TStringField
      FieldName = 'NickName'
    end
    object tblJudgeAddress: TStringField
      FieldKind = fkLookup
      FieldName = 'Address'
      LookupDataSet = tblPeople
      LookupKeyFields = 'People_ID'
      LookupResultField = 'Address'
      KeyFields = 'People_ID'
      Size = 150
      Lookup = True
    end
    object tblJudgeLocation: TStringField
      FieldKind = fkLookup
      FieldName = 'Location'
      LookupDataSet = tblPeople
      LookupKeyFields = 'People_ID'
      LookupResultField = 'Location'
      KeyFields = 'People_ID'
      Size = 150
      Lookup = True
    end
    object tblJudgeRole_Group: TStringField
      FieldKind = fkLookup
      FieldName = 'Role_Group'
      LookupDataSet = tblRoles
      LookupKeyFields = 'Role_ID'
      LookupResultField = 'Role_Group'
      KeyFields = 'Role_ID'
      Lookup = True
    end
  end
  object tblTeam: TABSTable
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = False
    AfterOpen = tblTeamAfterOpen
    OnCalcFields = tblTeamCalcFields
    OnNewRecord = tblTeamNewRecord
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'idxID'
        Fields = 'Team_ID'
        Options = [ixPrimary]
      end
      item
        Name = 'idxTeamComp'
        Fields = 'Competition_ID;Team_ID'
        Options = [ixUnique]
      end
      item
        Name = 'idxCompNum'
        Fields = 'Competition_ID;Number'
        Options = [ixUnique]
      end>
    IndexName = 'idxCompNum'
    FieldDefs = <
      item
        Name = 'Team_ID'
        DataType = ftAutoInc
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Country_ID'
        DataType = ftInteger
      end
      item
        Name = 'Competition_ID'
        DataType = ftInteger
      end
      item
        Name = 'Number'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Club_ID'
        DataType = ftInteger
      end
      item
        Name = 'Event_ID'
        DataType = ftInteger
      end
      item
        Name = 'Guest'
        DataType = ftBoolean
      end>
    TableName = 'Team'
    Exclusive = False
    MasterFields = 'Competition_ID'
    MasterSource = dsComp
    Left = 24
    Top = 208
    object tblTeamTeam_ID: TAutoIncField
      FieldName = 'Team_ID'
    end
    object tblTeamName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object tblTeamCountry_ID: TIntegerField
      FieldName = 'Country_ID'
    end
    object tblTeamCompetition_ID: TIntegerField
      FieldName = 'Competition_ID'
    end
    object tblTeamNumber: TStringField
      DisplayWidth = 5
      FieldName = 'Number'
      Size = 5
    end
    object tblTeamCountry: TStringField
      FieldKind = fkLookup
      FieldName = 'Country'
      LookupDataSet = tblCountry
      LookupKeyFields = 'Country_ID'
      LookupResultField = 'Name'
      KeyFields = 'Country_ID'
      Lookup = True
    end
    object tblTeamTeamNameCode: TStringField
      FieldKind = fkCalculated
      FieldName = 'TeamNameCode'
      Size = 100
      Calculated = True
    end
    object tblTeamGuest: TBooleanField
      FieldName = 'Guest'
    end
    object tblTeamCountry_Code: TStringField
      FieldKind = fkLookup
      FieldName = 'Country_Code'
      LookupDataSet = tblCountry
      LookupKeyFields = 'Country_ID'
      LookupResultField = 'Code'
      KeyFields = 'Country_ID'
      Size = 3
      Lookup = True
    end
    object tblTeamClub_ID: TIntegerField
      FieldName = 'Club_ID'
    end
    object tblTeamClub_Name: TStringField
      FieldKind = fkLookup
      FieldName = 'Club_Name'
      LookupDataSet = tblClub
      LookupKeyFields = 'Club_ID'
      LookupResultField = 'Club_Name'
      KeyFields = 'Club_ID'
      Size = 100
      Lookup = True
    end
    object tblTeamEvent_ID: TIntegerField
      FieldName = 'Event_ID'
    end
    object tblTeamEvent_Name: TStringField
      FieldKind = fkLookup
      FieldName = 'Event_Name'
      LookupDataSet = tblEvent
      LookupKeyFields = 'Event_ID'
      LookupResultField = 'Event_Name'
      KeyFields = 'Event_ID'
      Size = 30
      Lookup = True
    end
  end
  object dsTeam: TDataSource
    DataSet = tblTeam
    Left = 88
    Top = 208
  end
  object tblTeamRound: TABSTable
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = False
    AfterOpen = tblTeamRoundAfterOpen
    BeforePost = tblTeamRoundBeforePost
    BeforeDelete = tblTeamRoundBeforeDelete
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'idxID'
        Fields = 'Result_ID'
        Options = [ixPrimary]
      end
      item
        Name = 'idxTeamRound'
        Fields = 'Competition_ID;Round_ID;Team_ID'
        Options = [ixUnique]
      end>
    IndexName = 'idxTeamRound'
    FieldDefs = <
      item
        Name = 'Result_ID'
        DataType = ftAutoInc
      end
      item
        Name = 'Competition_ID'
        DataType = ftInteger
      end
      item
        Name = 'Round_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Task_ID'
        DataType = ftInteger
      end
      item
        Name = 'Member_ID'
        DataType = ftInteger
      end
      item
        Name = 'Team_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'VideoFile'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'Scores'
        DataType = ftFloat
      end
      item
        Name = 'Rate'
        DataType = ftFloat
      end
      item
        Name = 'Penalty_ID'
        DataType = ftInteger
      end
      item
        Name = 'Sign'
        DataType = ftBoolean
      end
      item
        Name = 'ViewID'
        DataType = ftLargeint
      end
      item
        Name = 'ViewNumber'
        DataType = ftWord
      end
      item
        Name = 'StartTime'
        DataType = ftLargeint
      end
      item
        Name = 'LastTime'
        DataType = ftFloat
      end
      item
        Name = 'Template'
        DataType = ftInteger
      end
      item
        Name = 'Comment'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'Figure1'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Figure2'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Figure3'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Figure4'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Figure5'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Pool_Sequence'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'JudgeTime'
        DataType = ftDateTime
      end>
    TableName = 'RoundResult'
    Exclusive = False
    MasterFields = 'Competition_ID'
    MasterSource = dsComp
    Left = 24
    Top = 256
    object tblTeamRoundResult_ID: TAutoIncField
      FieldName = 'Result_ID'
    end
    object tblTeamRoundRound_ID: TIntegerField
      FieldName = 'Round_ID'
    end
    object tblTeamRoundTeam_ID: TIntegerField
      FieldName = 'Team_ID'
    end
    object tblTeamRoundVideoFile: TStringField
      FieldName = 'VideoFile'
      Size = 100
    end
    object tblTeamRoundTeamName: TStringField
      FieldKind = fkLookup
      FieldName = 'Team_Name'
      LookupDataSet = tblTeam
      LookupKeyFields = 'Team_ID'
      LookupResultField = 'TeamNameCode'
      KeyFields = 'Team_ID'
      Size = 50
      Lookup = True
    end
    object tblTeamRoundCompetition_ID: TIntegerField
      FieldName = 'Competition_ID'
    end
    object tblTeamRoundRound: TStringField
      FieldKind = fkLookup
      FieldName = 'Round'
      LookupDataSet = tblRound
      LookupKeyFields = 'Round_ID'
      LookupResultField = 'Round_Num'
      KeyFields = 'Round_ID'
      Lookup = True
    end
    object tblTeamRoundScores: TFloatField
      FieldName = 'Scores'
    end
    object tblTeamRoundStartTime: TLargeintField
      FieldName = 'StartTime'
    end
    object tblTeamRoundJudgeTime: TDateTimeField
      FieldName = 'JudgeTime'
    end
    object tblTeamRoundLastTime: TFloatField
      FieldName = 'LastTime'
    end
    object tblTeamRoundPenalty_ID: TIntegerField
      FieldName = 'Penalty_ID'
    end
    object tblTeamRoundPenalty_Name: TStringField
      FieldKind = fkLookup
      FieldName = 'Penalty_Name'
      LookupDataSet = qryPenalty
      LookupKeyFields = 'Penalty_ID'
      LookupResultField = 'Name'
      KeyFields = 'Penalty_ID'
      Size = 50
      Lookup = True
    end
    object tblTeamRoundSign: TBooleanField
      FieldName = 'Sign'
    end
    object tblTeamRoundViewNumber: TSmallintField
      FieldName = 'ViewNumber'
    end
    object tblTeamRoundPool_Sequence: TStringField
      FieldName = 'Pool_Sequence'
      OnChange = tblTeamRoundPool_SequenceChange
      Size = 10
    end
    object tblTeamRoundFigure1: TStringField
      FieldName = 'Figure1'
      Size = 2
    end
    object tblTeamRoundFigure2: TStringField
      FieldName = 'Figure2'
      Size = 2
    end
    object tblTeamRoundFigure3: TStringField
      FieldName = 'Figure3'
      Size = 2
    end
    object tblTeamRoundFigure4: TStringField
      FieldName = 'Figure4'
      Size = 2
    end
    object tblTeamRoundFigure5: TStringField
      FieldName = 'Figure5'
      Size = 2
    end
    object tblTeamRoundEvent_ID: TIntegerField
      FieldKind = fkLookup
      FieldName = 'Event_ID'
      LookupDataSet = tblRound
      LookupKeyFields = 'Round_ID'
      LookupResultField = 'Event_ID'
      KeyFields = 'Round_ID'
      Lookup = True
    end
    object tblTeamRoundTask_ID: TIntegerField
      FieldName = 'Task_ID'
    end
    object tblTeamRoundTask: TStringField
      FieldKind = fkLookup
      FieldName = 'Task'
      LookupDataSet = tblTask
      LookupKeyFields = 'Task_ID'
      LookupResultField = 'Task_Name'
      KeyFields = 'Task_ID'
      Lookup = True
    end
    object tblTeamRoundColumns: TStringField
      FieldKind = fkLookup
      FieldName = 'Columns'
      LookupDataSet = tblTask
      LookupKeyFields = 'Task_ID'
      LookupResultField = 'Columns'
      KeyFields = 'Task_ID'
      Size = 255
      Lookup = True
    end
  end
  object dsTeamRound: TDataSource
    DataSet = tblTeamRound
    Left = 88
    Top = 256
  end
  object dsComp: TDataSource
    DataSet = tblCompetition
    Left = 88
    Top = 64
  end
  object dsJudge: TDataSource
    DataSet = tblJudge
    Left = 88
    Top = 160
  end
  object tblRound: TABSTable
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = False
    BeforeOpen = tblRoundBeforeOpen
    AfterClose = tblRoundAfterClose
    AfterPost = tblRoundAfterPost
    OnCalcFields = tblRoundCalcFields
    OnNewRecord = tblRoundNewRecord
    OnUpdateRecord = tblRoundUpdateRecord
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'idxID'
        Fields = 'Round_ID'
        Options = [ixPrimary]
      end
      item
        Name = 'idxRoundComp'
        Fields = 'Competition_ID;Round_ID;Event_ID'
        Options = [ixUnique]
      end>
    IndexFieldNames = 'Competition_ID'
    FieldDefs = <
      item
        Name = 'Round_ID'
        DataType = ftAutoInc
      end
      item
        Name = 'Competition_ID'
        DataType = ftInteger
      end
      item
        Name = 'Round_Num'
        DataType = ftWord
      end
      item
        Name = 'Figure1'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Figure2'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Figure3'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Figure4'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Figure5'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Pool_Sequence_Code'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Round_Type'
        DataType = ftInteger
      end
      item
        Name = 'Disabled'
        DataType = ftBoolean
      end
      item
        Name = 'Event_ID'
        DataType = ftInteger
      end>
    TableName = 'Round'
    Exclusive = False
    MasterFields = 'Competition_ID'
    MasterSource = dsComp
    Left = 24
    Top = 304
    object tblRoundRound_ID: TAutoIncField
      FieldName = 'Round_ID'
    end
    object tblRoundCompetition_ID: TIntegerField
      FieldName = 'Competition_ID'
    end
    object tblRoundRound_Num: TWordField
      FieldName = 'Round_Num'
    end
    object tblRoundPool_Sequence_Code: TStringField
      FieldName = 'Pool_Sequence_Code'
      OnChange = tblRoundPool_Sequence_CodeChange
    end
    object tblRoundRound_Type: TIntegerField
      FieldName = 'Round_Type'
    end
    object tblRoundTypeName: TStringField
      FieldKind = fkLookup
      FieldName = 'TypeName'
      LookupDataSet = tblType
      LookupKeyFields = 'Type_ID'
      LookupResultField = 'Name'
      KeyFields = 'Round_Type'
      Size = 200
      Lookup = True
    end
    object tblRoundEvent_ID: TIntegerField
      FieldName = 'Event_ID'
    end
    object tblRoundEventName: TStringField
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'EventName'
      LookupDataSet = tblEvent
      LookupKeyFields = 'Event_ID'
      LookupResultField = 'Event_Name'
      KeyFields = 'Event_ID'
      Size = 50
      Lookup = True
    end
    object tblRoundDisabled: TBooleanField
      FieldName = 'Disabled'
    end
    object tblRoundFigure1: TStringField
      FieldName = 'Figure1'
      Size = 2
    end
    object tblRoundFigure2: TStringField
      FieldName = 'Figure2'
      Size = 2
    end
    object tblRoundFigure3: TStringField
      FieldName = 'Figure3'
      Size = 2
    end
    object tblRoundFigure4: TStringField
      FieldName = 'Figure4'
      Size = 2
    end
    object tblRoundFigure5: TStringField
      FieldName = 'Figure5'
      Size = 2
    end
    object tblRoundRound_Title: TStringField
      FieldKind = fkCalculated
      FieldName = 'Round_Title'
      Calculated = True
    end
  end
  object tblMember: TABSTable
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = False
    BeforeOpen = tblMemberBeforeOpen
    OnNewRecord = tblMemberNewRecord
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'idxTeamPeople'
        Fields = 'Team_ID;People_ID;Role_ID'
        Options = [ixUnique]
      end
      item
        Name = 'idxPeopleRole'
        Fields = 'People_ID;Role_ID;Team_ID'
        Options = [ixUnique]
      end>
    IndexName = 'idxTeamPeople'
    FieldDefs = <
      item
        Name = 'Team_ID'
        DataType = ftInteger
      end
      item
        Name = 'People_ID'
        DataType = ftInteger
      end
      item
        Name = 'Role_ID'
        DataType = ftInteger
      end>
    TableName = 'Member'
    Exclusive = False
    MasterFields = 'Team_ID'
    MasterSource = dsTeam
    Left = 24
    Top = 352
    object tblMemberTeam_ID: TIntegerField
      FieldName = 'Team_ID'
    end
    object tblMemberPeople_ID: TIntegerField
      FieldName = 'People_ID'
    end
    object tblMemberRole_ID: TIntegerField
      FieldName = 'Role_ID'
    end
    object tblMemberName: TStringField
      DisplayWidth = 150
      FieldKind = fkLookup
      FieldName = 'Name'
      LookupDataSet = tblPeople
      LookupKeyFields = 'People_ID'
      LookupResultField = 'Name'
      KeyFields = 'People_ID'
      Size = 150
      Lookup = True
    end
    object tblMemberRole: TStringField
      FieldKind = fkLookup
      FieldName = 'Role'
      LookupDataSet = tblRoles
      LookupKeyFields = 'Role_ID'
      LookupResultField = 'Role_Name'
      KeyFields = 'Role_ID'
      Lookup = True
    end
    object tblMemberContact: TStringField
      DisplayWidth = 250
      FieldKind = fkLookup
      FieldName = 'Contact'
      LookupDataSet = tblPeople
      LookupKeyFields = 'People_ID'
      LookupResultField = 'Contact'
      KeyFields = 'People_ID'
      Size = 250
      Lookup = True
    end
    object tblMemberBirthday: TStringField
      FieldKind = fkLookup
      FieldName = 'Birthday'
      LookupDataSet = tblPeople
      LookupKeyFields = 'People_ID'
      LookupResultField = 'Birthday'
      KeyFields = 'People_ID'
      Lookup = True
    end
    object tblMemberCategory: TStringField
      FieldKind = fkLookup
      FieldName = 'Category'
      LookupDataSet = tblPeople
      LookupKeyFields = 'People_ID'
      LookupResultField = 'Category'
      KeyFields = 'People_ID'
      Lookup = True
    end
    object tblMemberCertificate: TStringField
      FieldKind = fkLookup
      FieldName = 'Certificate'
      LookupDataSet = tblPeople
      LookupKeyFields = 'People_ID'
      LookupResultField = 'Certificate'
      KeyFields = 'People_ID'
      Lookup = True
    end
    object tblMemberJumps: TIntegerField
      FieldKind = fkLookup
      FieldName = 'Jumps'
      LookupDataSet = tblPeople
      LookupKeyFields = 'People_ID'
      LookupResultField = 'Jumps'
      KeyFields = 'People_ID'
      Lookup = True
    end
    object tblMemberNumber: TStringField
      FieldName = 'Number'
      Size = 5
    end
    object tblMemberLocation: TStringField
      FieldKind = fkLookup
      FieldName = 'Location'
      LookupDataSet = tblPeople
      LookupKeyFields = 'People_ID'
      LookupResultField = 'Location'
      KeyFields = 'People_ID'
      Size = 100
      Lookup = True
    end
    object tblMemberAddress: TStringField
      FieldKind = fkLookup
      FieldName = 'Address'
      LookupDataSet = tblPeople
      LookupKeyFields = 'People_ID'
      LookupResultField = 'Address'
      KeyFields = 'People_ID'
      Lookup = True
    end
    object tblMemberInsuranceDate: TStringField
      FieldName = 'InsuranceDate'
    end
    object tblMemberMedicineDate: TStringField
      FieldName = 'MedicineDate'
    end
    object tblMemberTrainer_ID: TIntegerField
      FieldName = 'Trainer_ID'
    end
    object tblMemberTrainerName: TStringField
      FieldKind = fkLookup
      FieldName = 'TrainerName'
      LookupDataSet = tblPeople
      LookupKeyFields = 'People_ID'
      LookupResultField = 'Name'
      KeyFields = 'Trainer_ID'
      Size = 150
      Lookup = True
    end
    object tblMemberMember_ID: TIntegerField
      FieldName = 'Member_ID'
    end
  end
  object tblType: TABSTable
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = False
    IndexName = 'idxID'
    TableName = 'Type'
    Exclusive = False
    Left = 152
    Top = 64
  end
  object tblCountry: TABSTable
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = False
    TableName = 'Country'
    Exclusive = False
    Left = 280
    Top = 112
  end
  object dsRound: TDataSource
    DataSet = tblRound
    Left = 88
    Top = 304
  end
  object tblResultDetail: TABSTable
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = False
    BeforeDelete = tblResultDetailBeforeDelete
    StoreDefs = True
    IndexFieldNames = 'Result_ID'
    FieldDefs = <
      item
        Name = 'Result_ID'
        DataType = ftInteger
      end
      item
        Name = 'Views'
        DataType = ftSmallint
      end
      item
        Name = 'IsTrainee'
        DataType = ftBoolean
      end
      item
        Name = 'Judge_ID'
        DataType = ftInteger
      end
      item
        Name = 'Monitor'
        DataType = ftInteger
      end
      item
        Name = 'p1'
        DataType = ftFloat
      end
      item
        Name = 'p2'
        DataType = ftFloat
      end
      item
        Name = 'p3'
        DataType = ftFloat
      end
      item
        Name = 'p4'
        DataType = ftFloat
      end
      item
        Name = 'p5'
        DataType = ftFloat
      end
      item
        Name = 'p6'
        DataType = ftFloat
      end
      item
        Name = 'p7'
        DataType = ftFloat
      end
      item
        Name = 'p8'
        DataType = ftFloat
      end
      item
        Name = 'p9'
        DataType = ftFloat
      end
      item
        Name = 'p10'
        DataType = ftFloat
      end
      item
        Name = 'p11'
        DataType = ftFloat
      end
      item
        Name = 'p12'
        DataType = ftFloat
      end
      item
        Name = 'p13'
        DataType = ftFloat
      end
      item
        Name = 'p14'
        DataType = ftFloat
      end
      item
        Name = 'p15'
        DataType = ftFloat
      end
      item
        Name = 'p16'
        DataType = ftFloat
      end
      item
        Name = 'p17'
        DataType = ftFloat
      end
      item
        Name = 'p18'
        DataType = ftFloat
      end
      item
        Name = 'p19'
        DataType = ftFloat
      end
      item
        Name = 'p20'
        DataType = ftFloat
      end
      item
        Name = 'p21'
        DataType = ftFloat
      end
      item
        Name = 'p22'
        DataType = ftFloat
      end
      item
        Name = 'p23'
        DataType = ftFloat
      end
      item
        Name = 'p24'
        DataType = ftFloat
      end
      item
        Name = 'p25'
        DataType = ftFloat
      end
      item
        Name = 'p26'
        DataType = ftFloat
      end
      item
        Name = 'p27'
        DataType = ftFloat
      end
      item
        Name = 'p28'
        DataType = ftFloat
      end
      item
        Name = 'p29'
        DataType = ftFloat
      end
      item
        Name = 'p30'
        DataType = ftFloat
      end
      item
        Name = 'T1'
        DataType = ftFloat
      end
      item
        Name = 'T2'
        DataType = ftFloat
      end
      item
        Name = 'T3'
        DataType = ftFloat
      end
      item
        Name = 'T4'
        DataType = ftFloat
      end
      item
        Name = 'T5'
        DataType = ftFloat
      end
      item
        Name = 'T6'
        DataType = ftFloat
      end
      item
        Name = 'T7'
        DataType = ftFloat
      end
      item
        Name = 'T8'
        DataType = ftFloat
      end
      item
        Name = 'T9'
        DataType = ftFloat
      end
      item
        Name = 'T10'
        DataType = ftFloat
      end
      item
        Name = 'T11'
        DataType = ftFloat
      end
      item
        Name = 'T12'
        DataType = ftFloat
      end
      item
        Name = 'T13'
        DataType = ftFloat
      end
      item
        Name = 'T14'
        DataType = ftFloat
      end
      item
        Name = 'T15'
        DataType = ftFloat
      end
      item
        Name = 'T16'
        DataType = ftFloat
      end
      item
        Name = 'T17'
        DataType = ftFloat
      end
      item
        Name = 'T18'
        DataType = ftFloat
      end
      item
        Name = 'T19'
        DataType = ftFloat
      end
      item
        Name = 'T20'
        DataType = ftFloat
      end
      item
        Name = 'T21'
        DataType = ftFloat
      end
      item
        Name = 'T22'
        DataType = ftFloat
      end
      item
        Name = 'T23'
        DataType = ftFloat
      end
      item
        Name = 'T24'
        DataType = ftFloat
      end
      item
        Name = 'T25'
        DataType = ftFloat
      end
      item
        Name = 'T26'
        DataType = ftFloat
      end
      item
        Name = 'T27'
        DataType = ftFloat
      end
      item
        Name = 'T28'
        DataType = ftFloat
      end
      item
        Name = 'T29'
        DataType = ftFloat
      end
      item
        Name = 'T30'
        DataType = ftFloat
      end>
    TableName = 'ResultDetail'
    Exclusive = False
    MasterFields = 'Result_ID'
    MasterSource = dsTeamRound
    Left = 232
    Top = 256
    object tblResultDetailResult_ID: TIntegerField
      FieldName = 'Result_ID'
    end
    object tblResultDetailIsTrainee: TBooleanField
      FieldName = 'IsTrainee'
    end
    object tblResultDetailJudge_ID: TIntegerField
      FieldName = 'Judge_ID'
    end
    object tblResultDetailJudge: TStringField
      DisplayWidth = 55
      FieldKind = fkLookup
      FieldName = 'Judge'
      LookupDataSet = tblJudge
      LookupKeyFields = 'Judge_ID'
      LookupResultField = 'Name'
      KeyFields = 'Judge_ID'
      Size = 55
      Lookup = True
    end
    object tblResultDetailMonitor: TWordField
      FieldName = 'Monitor'
    end
    object tblResultDetailP1: TFloatField
      FieldName = 'P1'
    end
    object tblResultDetailP2: TFloatField
      FieldName = 'P2'
    end
    object tblResultDetailP3: TFloatField
      FieldName = 'P3'
    end
    object tblResultDetailP4: TFloatField
      FieldName = 'P4'
    end
    object tblResultDetailP5: TFloatField
      FieldName = 'P5'
    end
    object tblResultDetailP6: TFloatField
      FieldName = 'P6'
    end
    object tblResultDetailP7: TFloatField
      FieldName = 'P7'
    end
    object tblResultDetailP8: TFloatField
      FieldName = 'P8'
    end
    object tblResultDetailP9: TFloatField
      FieldName = 'P9'
    end
    object tblResultDetailP10: TFloatField
      FieldName = 'P10'
    end
    object tblResultDetailP11: TFloatField
      FieldName = 'P11'
    end
    object tblResultDetailP12: TFloatField
      FieldName = 'P12'
    end
    object tblResultDetailP13: TFloatField
      FieldName = 'P13'
    end
    object tblResultDetailP14: TFloatField
      FieldName = 'P14'
    end
    object tblResultDetailP15: TFloatField
      FieldName = 'P15'
    end
    object tblResultDetailP16: TFloatField
      FieldName = 'P16'
    end
    object tblResultDetailP17: TFloatField
      FieldName = 'P17'
    end
    object tblResultDetailP18: TFloatField
      FieldName = 'P18'
    end
    object tblResultDetailP19: TFloatField
      FieldName = 'P19'
    end
    object tblResultDetailP20: TFloatField
      FieldName = 'P20'
    end
    object tblResultDetailP21: TFloatField
      FieldName = 'P21'
    end
    object tblResultDetailP22: TFloatField
      FieldName = 'P22'
    end
    object tblResultDetailP23: TFloatField
      FieldName = 'P23'
    end
    object tblResultDetailP24: TFloatField
      FieldName = 'P24'
    end
    object tblResultDetailP25: TFloatField
      FieldName = 'P25'
    end
    object tblResultDetailP26: TFloatField
      FieldName = 'P26'
    end
    object tblResultDetailP27: TFloatField
      FieldName = 'P27'
    end
    object tblResultDetailP28: TFloatField
      FieldName = 'P28'
    end
    object tblResultDetailP29: TFloatField
      FieldName = 'P29'
    end
    object tblResultDetailP30: TFloatField
      FieldName = 'P30'
    end
    object tblResultDetailT1: TFloatField
      FieldName = 'T1'
    end
    object tblResultDetailT2: TFloatField
      FieldName = 'T2'
    end
    object tblResultDetailT3: TFloatField
      FieldName = 'T3'
    end
    object tblResultDetailT4: TFloatField
      FieldName = 'T4'
    end
    object tblResultDetailT5: TFloatField
      FieldName = 'T5'
    end
    object tblResultDetailT6: TFloatField
      FieldName = 'T6'
    end
    object tblResultDetailT7: TFloatField
      FieldName = 'T7'
    end
    object tblResultDetailT8: TFloatField
      FieldName = 'T8'
    end
    object tblResultDetailT9: TFloatField
      FieldName = 'T9'
    end
    object tblResultDetailT10: TFloatField
      FieldName = 'T10'
    end
    object tblResultDetailT11: TFloatField
      FieldName = 'T11'
    end
    object tblResultDetailT12: TFloatField
      FieldName = 'T12'
    end
    object tblResultDetailT13: TFloatField
      FieldName = 'T13'
    end
    object tblResultDetailT14: TFloatField
      FieldName = 'T14'
    end
    object tblResultDetailT15: TFloatField
      FieldName = 'T15'
    end
    object tblResultDetailT16: TFloatField
      FieldName = 'T16'
    end
    object tblResultDetailT17: TFloatField
      FieldName = 'T17'
    end
    object tblResultDetailT18: TFloatField
      FieldName = 'T18'
    end
    object tblResultDetailT19: TFloatField
      FieldName = 'T19'
    end
    object tblResultDetailT20: TFloatField
      FieldName = 'T20'
    end
    object tblResultDetailT21: TFloatField
      FieldName = 'T21'
    end
    object tblResultDetailT22: TFloatField
      FieldName = 'T22'
    end
    object tblResultDetailT23: TFloatField
      FieldName = 'T23'
    end
    object tblResultDetailT24: TFloatField
      FieldName = 'T24'
    end
    object tblResultDetailT25: TFloatField
      FieldName = 'T25'
    end
    object tblResultDetailT26: TFloatField
      FieldName = 'T26'
    end
    object tblResultDetailT27: TFloatField
      FieldName = 'T27'
    end
    object tblResultDetailT28: TFloatField
      FieldName = 'T28'
    end
    object tblResultDetailT29: TFloatField
      FieldName = 'T29'
    end
    object tblResultDetailT30: TFloatField
      FieldName = 'T30'
    end
  end
  object frCompetition: TfrxDBDataset
    UserName = 'frCompetition'
    CloseDataSource = False
    DataSet = qryCompetition
    BCDToCurrency = False
    Left = 648
    Top = 56
  end
  object frMembers: TfrxDBDataset
    UserName = 'frMembers'
    CloseDataSource = False
    DataSet = tblMember
    BCDToCurrency = False
    Left = 152
    Top = 352
  end
  object qryCompetitors: TABSQuery
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = True
    DataSource = dsComp
    SQL.Strings = (
      ''
      
        'SELECT te.Team_ID, te.Competition_ID, te.Name TeamName, te.Numbe' +
        'r, te.Guest, co.Name Country,'
      
        '  cl.Club_Name, pe.Name MemberName, pe.Category, pe.Certificate,' +
        ' pe.Address, pe.Jumps, pe.Birthday,'
      
        '  ro.Role_Name, ro.Role_ID, me.Member_ID, me.Number MemberNumber' +
        ', me.InsuranceDate'
      'FROM Team te LEFT JOIN Member me ON (te.Team_ID=me.Team_ID)'
      'LEFT JOIN Club cl ON (cl.Club_ID=te.Club_ID)'
      'LEFT JOIN Country co ON (co.Country_ID=te.Country_ID)'
      'LEFT JOIN  People pe ON (me.People_ID=pe.People_ID)'
      'LEFT JOIN Roles ro ON (ro.Role_ID=me.Role_ID)'
      'WHERE te.Competition_ID= :Competition_ID'
      'ORDER BY te.Number, ro.Role_ID, pe.Name asc')
    Left = 568
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Competition_ID'
        ParamType = ptUnknown
        Size = 4
      end>
  end
  object tblPrint: TABSTable
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = False
    Filtered = True
    StoreDefs = True
    FieldDefs = <
      item
        Name = 'Print_ID'
        DataType = ftAutoInc
      end
      item
        Name = 'Print_Name'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Print_Template'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Print_Form'
        DataType = ftGuid
        Size = 38
      end>
    TableName = 'PrintForm'
    Exclusive = False
    Left = 466
    Top = 56
  end
  object dsPrint: TDataSource
    DataSet = tblPrint
    Left = 514
    Top = 56
  end
  object frTeam: TfrxDBDataset
    UserName = 'frTeam'
    CloseDataSource = False
    DataSet = tblTeam
    BCDToCurrency = False
    Left = 152
    Top = 208
  end
  object frResultDetail: TfrxDBDataset
    UserName = 'frResultDetail'
    CloseDataSource = False
    DataSet = tblResultDetail
    BCDToCurrency = False
    Left = 344
    Top = 256
  end
  object frRound: TfrxDBDataset
    UserName = 'frRound'
    CloseDataSource = False
    DataSet = tblRound
    BCDToCurrency = False
    Left = 152
    Top = 304
  end
  object frCompetitors: TfrxDBDataset
    UserName = 'frCompetitors'
    CloseDataSource = False
    DataSet = qryCompetitors
    BCDToCurrency = False
    Left = 648
    Top = 104
  end
  object tblCompetition: TABSTable
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = False
    Filtered = True
    AfterOpen = tblCompetitionAfterOpen
    BeforeClose = tblCompetitionBeforeClose
    AfterPost = tblCompetitionAfterPost
    OnCalcFields = tblCompetitionCalcFields
    OnNewRecord = tblCompetitionNewRecord
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'idxID'
        Fields = 'Competition_ID'
        Options = [ixPrimary]
      end>
    IndexName = 'idxID'
    FieldDefs = <
      item
        Name = 'Competition_ID'
        DataType = ftAutoInc
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'Type_ID'
        DataType = ftInteger
      end
      item
        Name = 'Pool_ID'
        DataType = ftInteger
      end
      item
        Name = 'Rounds'
        DataType = ftSmallint
      end
      item
        Name = 'WorkTime'
        DataType = ftWord
      end
      item
        Name = 'Place'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'Options'
        DataType = ftMemo
      end
      item
        Name = 'DateFrom'
        DataType = ftDate
      end
      item
        Name = 'DateTo'
        DataType = ftDate
      end>
    TableName = 'Competition'
    Exclusive = False
    Left = 24
    Top = 64
    object tblCompetitionCompetition_ID: TAutoIncField
      FieldName = 'Competition_ID'
    end
    object tblCompetitionName: TStringField
      FieldName = 'Name'
      Size = 300
    end
    object tblCompetitionType_ID: TIntegerField
      FieldName = 'Type_ID'
    end
    object tblCompetitionRounds: TSmallintField
      FieldName = 'Rounds'
    end
    object tblCompetitionWorkTime: TWordField
      FieldName = 'WorkTime'
    end
    object tblCompetitionType: TStringField
      FieldKind = fkLookup
      FieldName = 'Type'
      LookupDataSet = tblType
      LookupKeyFields = 'Type_ID'
      LookupResultField = 'Name'
      KeyFields = 'Type_ID'
      Size = 50
      Lookup = True
    end
    object tblCompetitionPlace: TStringField
      FieldName = 'Place'
      Size = 250
    end
    object tblCompetitionDateName: TStringField
      DisplayWidth = 220
      FieldKind = fkCalculated
      FieldName = 'DateName'
      Size = 100
      Calculated = True
    end
    object tblCompetitionMask: TStringField
      FieldKind = fkLookup
      FieldName = 'Mask'
      LookupDataSet = tblType
      LookupKeyFields = 'Type_ID'
      LookupResultField = 'Mask'
      KeyFields = 'Type_ID'
      Size = 40
      Lookup = True
    end
    object tblCompetitionPool_ID: TIntegerField
      FieldName = 'Pool_ID'
    end
    object tblCompetitionPool: TStringField
      FieldKind = fkLookup
      FieldName = 'Pool'
      LookupDataSet = tblPoolType
      LookupKeyFields = 'Pool_ID'
      LookupResultField = 'Name'
      KeyFields = 'Pool_ID'
      Size = 40
      Lookup = True
    end
    object tblCompetitionOptions: TMemoField
      FieldName = 'Options'
      BlobType = ftMemo
    end
    object tblCompetitionDateFrom: TDateField
      FieldName = 'DateFrom'
    end
    object tblCompetitionDateTo: TDateField
      FieldName = 'DateTo'
    end
    object tblCompetitionProtoSort: TBooleanField
      FieldKind = fkLookup
      FieldName = 'ProtoSort'
      LookupDataSet = tblType
      LookupKeyFields = 'Type_ID'
      LookupResultField = 'Proto'
      KeyFields = 'Type_ID'
      Lookup = True
    end
    object tblCompetitionPoolTypeName: TStringField
      FieldKind = fkLookup
      FieldName = 'PoolTypeName'
      LookupDataSet = tblPoolType
      LookupKeyFields = 'Pool_ID'
      LookupResultField = 'ShortName'
      KeyFields = 'Pool_ID'
      Size = 5
      Lookup = True
    end
    object tblCompetitionPoolPrefix: TIntegerField
      FieldKind = fkLookup
      FieldName = 'PoolPrefix'
      LookupDataSet = tblPoolType
      LookupKeyFields = 'Pool_ID'
      LookupResultField = 'Prefix'
      KeyFields = 'Pool_ID'
      Lookup = True
    end
  end
  object frJudgeView: TfrxDBDataset
    UserName = 'frJudgeView'
    CloseDataSource = False
    DataSet = qryReport
    BCDToCurrency = False
    Left = 648
    Top = 256
  end
  object frProtokol: TfrxDBDataset
    UserName = 'frProtokol'
    CloseDataSource = False
    DataSet = qryReport
    BCDToCurrency = False
    Left = 648
    Top = 304
  end
  object qryCompetition: TABSQuery
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = True
    DataSource = dsComp
    Left = 568
    Top = 56
  end
  object frPool: TfrxDBDataset
    UserName = 'frPool'
    CloseDataSource = False
    DataSet = MemPool
    BCDToCurrency = False
    Left = 650
    Top = 8
  end
  object qryPool: TABSQuery
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = True
    AfterOpen = qryPoolAfterOpen
    DataSource = dsRound
    SQL.Strings = (
      'SELECT Image1,Image2,Image3,'
      'case when Figure1=Pool_Code then 1'
      'when Figure2=Pool_Code then 2'
      'when Figure3=Pool_Code then 3'
      'when Figure4=Pool_Code then 4'
      'when Figure5=Pool_Code then 5 end as IMG,'
      'r.Pool_Sequence_Code as Pool_Sequence'
      'FROM pool p, round r, Competition c'
      'WHERE c.Pool_ID=p.Type_ID  AND c.Competition_ID=r.Competition_ID'
      'AND IMG>0 AND r.Round_ID=:Round_ID'
      'order by IMG')
    Left = 514
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Round_ID'
        ParamType = ptUnknown
      end>
  end
  object frJudges: TfrxDBDataset
    UserName = 'frJudges'
    CloseDataSource = False
    DataSet = tblJudge
    BCDToCurrency = False
    Left = 152
    Top = 160
  end
  object dsPool: TDataSource
    DataSet = MemPool
    Left = 610
    Top = 8
  end
  object dsResultDetail: TDataSource
    DataSet = tblResultDetail
    Left = 288
    Top = 256
  end
  object dsMember: TDataSource
    DataSet = tblMember
    Left = 88
    Top = 352
  end
  object frIndVedom: TfrxDBDataset
    UserName = 'frIndVedom'
    CloseDataSource = False
    DataSet = qryReport
    BCDToCurrency = False
    Left = 648
    Top = 352
  end
  object tblErrors: TABSTable
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = False
    OnNewRecord = tblErrorsNewRecord
    IndexFieldNames = 'Type_ID'
    TableName = 'Errors'
    Exclusive = False
    MasterFields = 'Round_Type'
    MasterSource = dsRound
    Left = 218
    Top = 112
  end
  object qryJumpError: TABSQuery
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = False
    BeforeOpen = qryJumpErrorBeforeOpen
    SQL.Strings = (
      ''
      'SELECT re.Port as Port, p.Name AS Name, '
      'sum(CASE WHEN FigureNum='#39'0'#39' THEN Error_ID END) ERR1,'
      'sum(CASE WHEN FigureNum='#39'1'#39' THEN Error_ID END) ERR2,'
      'sum(CASE WHEN FigureNum='#39'2'#39' THEN Error_ID END) ERR3,'
      'sum(CASE WHEN FigureNum='#39'3'#39' THEN Error_ID END) ERR4,'
      'sum(CASE WHEN FigureNum='#39'4'#39' THEN Error_ID END) ERR5,'
      'sum(CASE WHEN FigureNum='#39'5'#39' THEN Error_ID END) ERR6,'
      'sum(CASE WHEN FigureNum='#39'6'#39' THEN Error_ID END) ERR7,'
      'sum(CASE WHEN FigureNum='#39'7'#39' THEN Error_ID END) ERR8,'
      'sum(CASE WHEN FigureNum='#39'8'#39' THEN Error_ID END) ERR9,'
      'sum(CASE WHEN FigureNum='#39'9'#39' THEN Error_ID END) ERR10,'
      'sum(CASE WHEN FigureNum='#39'10'#39' THEN Error_ID END) ERR11,'
      'sum(CASE WHEN FigureNum='#39'11'#39' THEN Error_ID END) ERR12,'
      'sum(CASE WHEN FigureNum='#39'12'#39' THEN Error_ID END) ERR13,'
      'sum(CASE WHEN FigureNum='#39'13'#39' THEN Error_ID END) ERR14,'
      'sum(CASE WHEN FigureNum='#39'14'#39' THEN Error_ID END) ERR15,'
      'sum(CASE WHEN FigureNum='#39'15'#39' THEN Error_ID END) ERR16,'
      'sum(CASE WHEN FigureNum='#39'16'#39' THEN Error_ID END) ERR17,'
      'sum(CASE WHEN FigureNum='#39'17'#39' THEN Error_ID END) ERR18,'
      'sum(CASE WHEN FigureNum='#39'18'#39' THEN Error_ID END) ERR19,'
      'sum(CASE WHEN FigureNum='#39'19'#39' THEN Error_ID END) ERR20,'
      'sum(CASE WHEN FigureNum='#39'20'#39' THEN Error_ID END) ERR21,'
      'sum(CASE WHEN FigureNum='#39'21'#39' THEN Error_ID END) ERR22,'
      'sum(CASE WHEN FigureNum='#39'22'#39' THEN Error_ID END) ERR23,'
      'sum(CASE WHEN FigureNum='#39'23'#39' THEN Error_ID END) ERR24,'
      'sum(CASE WHEN FigureNum='#39'24'#39' THEN Error_ID END) ERR25,'
      'sum(CASE WHEN FigureNum='#39'25'#39' THEN Error_ID END) ERR26,'
      'sum(CASE WHEN FigureNum='#39'26'#39' THEN Error_ID END) ERR27,'
      'sum(CASE WHEN FigureNum='#39'27'#39' THEN Error_ID END) ERR28,'
      'sum(CASE WHEN FigureNum='#39'28'#39' THEN Error_ID END) ERR29,'
      'sum(CASE WHEN FigureNum='#39'29'#39' THEN Error_ID END) ERR30'
      'FROM RoundError re, Judges j, People p'
      'WHERE j.Port=(re.Port+1) AND j.People_ID=p.People_ID'
      'AND j.Competition_ID=:Competition_ID'
      'AND re.Result_ID= :BBB'
      'GROUP BY Port, Name')
    Left = 200
    Top = 512
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Competition_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BBB'
        ParamType = ptUnknown
      end>
  end
  object frJumpError: TfrxDBDataset
    UserName = 'frJumpError'
    CloseDataSource = False
    DataSet = qryJumpError
    BCDToCurrency = False
    Left = 312
    Top = 512
  end
  object dsJumpError: TDataSource
    DataSet = qryJumpError
    Left = 256
    Top = 512
  end
  object frTeamRound: TfrxDBDataset
    RangeBegin = rbCurrent
    RangeEnd = reCurrent
    UserName = 'frTeamRound'
    CloseDataSource = False
    DataSet = tblTeamRound
    BCDToCurrency = False
    Left = 152
    Top = 256
  end
  object frxErrorDesc: TfrxDBDataset
    UserName = 'frxErrorDesc'
    CloseDataSource = False
    DataSet = qryErrorDesc
    BCDToCurrency = False
    Left = 648
    Top = 152
  end
  object qryErrorDesc: TABSQuery
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = False
    DataSource = dsTeamRound
    SQL.Strings = (
      'SELECT SQV as Sequence, Description, max(CNT)  FROM'
      
        '  (SELECT Result_ID, Sequence+1 SQV,  Error_ID, count(vd.Error_I' +
        'D) CNT'
      '  FROM ViewDetail vd  WHERE Result_ID= :Result_ID'
      '  GROUP BY Result_ID, Sequence, Error_ID) a'
      '  LEFT JOIN Errors e ON e.Error_ID=a.Error_ID'
      'GROUP BY  SQV, Description'
      
        'HAVING max(CNT)  >= (SELECT cast(count(Monitor) float)/2 FROM Re' +
        'sultDetail WHERE Result_ID= :Result_ID) '
      'ORDER BY 1')
    Left = 568
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Result_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Result_ID'
        ParamType = ptUnknown
      end>
  end
  object MemPool: TABSTable
    CurrentVersion = '7.90 '
    DatabaseName = 'MEMORY'
    InMemory = True
    ReadOnly = False
    OnNewRecord = MemPoolNewRecord
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'ID_idx'
        Fields = 'Round_ID'
      end>
    IndexFieldNames = 'Round_ID'
    FieldDefs = <
      item
        Name = 'Round_ID'
        DataType = ftInteger
      end
      item
        Name = 'Pic1'
        DataType = ftBlob
      end
      item
        Name = 'Pic2'
        DataType = ftBlob
      end
      item
        Name = 'Pic3'
        DataType = ftBlob
      end
      item
        Name = 'Pic4'
        DataType = ftBlob
      end
      item
        Name = 'Pic5'
        DataType = ftBlob
      end
      item
        Name = 'Pic6'
        DataType = ftBlob
      end
      item
        Name = 'Pic7'
        DataType = ftBlob
      end
      item
        Name = 'Pic8'
        DataType = ftBlob
      end
      item
        Name = 'Pic9'
        DataType = ftBlob
      end
      item
        Name = 'Pool_ID'
        DataType = ftInteger
      end
      item
        Name = 'CountPic'
        DataType = ftInteger
      end
      item
        Name = 'Pool_Sequence'
        DataType = ftString
        Size = 20
      end>
    TableName = 'Pool'
    Exclusive = False
    MasterFields = 'Round_ID'
    MasterSource = dsRound
    Left = 570
    Top = 8
  end
  object frIndProtokol: TfrxDBDataset
    UserName = 'frIndProtokol'
    CloseDataSource = False
    DataSet = qryReport
    BCDToCurrency = False
    Left = 568
    Top = 256
  end
  object frxRoundProtokol: TfrxDBDataset
    UserName = 'frRoundProtokol'
    CloseDataSource = False
    DataSet = qryReport
    BCDToCurrency = False
    Left = 568
    Top = 304
  end
  object tblPoolType: TABSTable
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = False
    TableName = 'PoolType'
    Exclusive = False
    Left = 216
    Top = 64
  end
  object frShilders: TfrxDBDataset
    UserName = 'frShilders'
    CloseDataSource = False
    DataSet = qryReport
    BCDToCurrency = False
    Left = 568
    Top = 352
  end
  object qryGetQuery: TABSQuery
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = True
    BeforeOpen = qryCompetitionBeforeOpen
    DataSource = dsComp
    SQL.Strings = (
      'SELECT q.* '
      'FROM Queries q, Competition c '
      'WHERE (c.Type_ID=q.Type_ID OR q.Type_ID IS NULL)'
      'AND c.Competition_ID = :Competition_ID')
    Left = 392
    Top = 305
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Competition_ID'
        ParamType = ptUnknown
      end>
  end
  object qryRoundResult: TABSQuery
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = False
    DataSource = dsTeamRound
    Left = 568
    Top = 208
  end
  object frRoundResult: TfrxDBDataset
    UserName = 'frRoundResult'
    CloseDataSource = False
    DataSet = qryRoundResult
    BCDToCurrency = False
    Left = 648
    Top = 208
  end
  object tblClub: TABSTable
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = False
    TableName = 'Club'
    Exclusive = False
    Left = 88
    Top = 112
  end
  object tblEvent: TABSTable
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = False
    OnNewRecord = tblEventNewRecord
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'IdxEvent'
        Fields = 'Competition_ID;Event_ID'
        Options = [ixUnique]
      end>
    IndexName = 'IdxEvent'
    FieldDefs = <
      item
        Name = 'Event_ID'
        DataType = ftAutoInc
      end
      item
        Name = 'Event_Name'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Competition_ID'
        DataType = ftInteger
      end>
    TableName = 'Event'
    Exclusive = False
    MasterFields = 'Competition_ID'
    MasterSource = dsComp
    Left = 24
    Top = 408
    object tblEventEvent_ID: TIntegerField
      FieldName = 'Event_ID'
    end
    object tblEventEvent_Name: TStringField
      FieldName = 'Event_Name'
      Size = 50
    end
    object tblEventCompetition_ID: TIntegerField
      FieldName = 'Competition_ID'
    end
  end
  object dsEvent: TDataSource
    DataSet = tblEvent
    Left = 88
    Top = 408
  end
  object qryReport: TABSQuery
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = False
    BeforeOpen = qryCompetitionBeforeOpen
    Left = 448
    Top = 304
  end
  object tblStartList: TABSTable
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = False
    TableName = 'StartList'
    Exclusive = False
    MasterFields = 'Result_ID'
    MasterSource = dsTeamRound
    Left = 24
    Top = 464
  end
  object dsStartList: TDataSource
    DataSet = tblStartList
    Left = 88
    Top = 464
  end
  object dsReport: TDataSource
    DataSet = qryReport
    Left = 504
    Top = 304
  end
  object frTeamMembers: TfrxDBDataset
    UserName = 'frTeamMembers'
    CloseDataSource = False
    DataSet = qryTeamMembers
    BCDToCurrency = False
    Left = 648
    Top = 464
  end
  object tblMemberResult: TABSTable
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = False
    BeforeOpen = tblMemberResultBeforeOpen
    AfterOpen = tblMemberResultAfterOpen
    BeforeClose = tblMemberResultBeforeClose
    BeforePost = tblMemberResultBeforePost
    AfterPost = tblMemberResultAfterPost
    BeforeDelete = tblMemberResultBeforeDelete
    OnNewRecord = tblMemberResultNewRecord
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'idxID'
        Fields = 'Result_ID'
        Options = [ixPrimary]
      end
      item
        Name = 'idxTeamRound'
        Fields = 'Competition_ID;Round_ID;Team_ID;Member_ID;Task_ID'
        Options = [ixUnique]
      end>
    IndexName = 'idxTeamRound'
    FieldDefs = <
      item
        Name = 'Result_ID'
        DataType = ftAutoInc
      end
      item
        Name = 'Competition_ID'
        DataType = ftInteger
      end
      item
        Name = 'Round_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Task_ID'
        DataType = ftInteger
      end
      item
        Name = 'Member_ID'
        DataType = ftInteger
      end
      item
        Name = 'Team_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'VideoFile'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'Scores'
        DataType = ftFloat
      end
      item
        Name = 'Rate'
        DataType = ftFloat
      end
      item
        Name = 'Penalty_ID'
        DataType = ftInteger
      end
      item
        Name = 'Sign'
        DataType = ftBoolean
      end
      item
        Name = 'ViewID'
        DataType = ftLargeint
      end
      item
        Name = 'ViewNumber'
        DataType = ftWord
      end
      item
        Name = 'StartTime'
        DataType = ftLargeint
      end
      item
        Name = 'LastTime'
        DataType = ftFloat
      end
      item
        Name = 'Template'
        DataType = ftInteger
      end
      item
        Name = 'Comment'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'Figure1'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Figure2'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Figure3'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Figure4'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Figure5'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Pool_Sequence'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'JudgeTime'
        DataType = ftDateTime
      end>
    TableName = 'RoundResult'
    Exclusive = False
    MasterFields = 'Competition_ID'
    MasterSource = dsComp
    Left = 392
    Top = 512
    object tblMemberResultResult_ID: TAutoIncField
      FieldName = 'Result_ID'
    end
    object tblMemberResultRound_ID: TIntegerField
      FieldName = 'Round_ID'
    end
    object tblMemberResultMember_ID: TIntegerField
      FieldName = 'Member_ID'
    end
    object tblMemberResultExercise: TStringField
      FieldKind = fkLookup
      FieldName = 'Task'
      LookupDataSet = tblTask
      LookupKeyFields = 'Task_ID'
      LookupResultField = 'Task_Name'
      KeyFields = 'Task_ID'
      Size = 30
      Lookup = True
    end
    object tblMemberResultMemberNumber: TStringField
      FieldKind = fkLookup
      FieldName = 'MemberNumber'
      LookupDataSet = qryCompetitors
      LookupKeyFields = 'Member_ID'
      LookupResultField = 'MemberNumber'
      KeyFields = 'Member_ID'
      Size = 5
      Lookup = True
    end
    object tblMemberResultMemberName: TStringField
      FieldKind = fkLookup
      FieldName = 'MemberName'
      LookupDataSet = qryCompetitors
      LookupKeyFields = 'Member_ID'
      LookupResultField = 'MemberName'
      KeyFields = 'Member_ID'
      Size = 100
      Lookup = True
    end
    object tblMemberResultScores: TFloatField
      FieldName = 'Scores'
    end
    object tblMemberResultRate: TFloatField
      FieldName = 'Rate'
    end
    object tblMemberResultCompetition_ID: TIntegerField
      FieldName = 'Competition_ID'
    end
    object tblMemberResultSign: TBooleanField
      FieldName = 'Sign'
    end
    object tblMemberResultRound_Num: TStringField
      FieldKind = fkLookup
      FieldName = 'Round_Num'
      LookupDataSet = tblRound
      LookupKeyFields = 'Round_ID'
      LookupResultField = 'Round_Num'
      KeyFields = 'Round_ID'
      Size = 5
      Lookup = True
    end
    object tblMemberResultTask_ID: TIntegerField
      FieldName = 'Task_ID'
    end
    object tblMemberResultPenalty_ID: TIntegerField
      FieldName = 'Penalty_ID'
    end
    object tblMemberResultPenalty_Name: TStringField
      FieldKind = fkLookup
      FieldName = 'Penalty_Name'
      LookupDataSet = qryPenalty
      LookupKeyFields = 'Penalty_ID'
      LookupResultField = 'Name'
      KeyFields = 'Penalty_ID'
      Size = 50
      Lookup = True
    end
    object tblMemberResultColumns: TStringField
      FieldKind = fkLookup
      FieldName = 'Columns'
      LookupDataSet = tblTask
      LookupKeyFields = 'Task_ID'
      LookupResultField = 'Columns'
      KeyFields = 'Task_ID'
      Size = 255
      Lookup = True
    end
    object tblMemberResultTeam_ID: TIntegerField
      FieldName = 'Team_ID'
    end
    object tblMemberResultMemberTeam_ID: TIntegerField
      FieldKind = fkLookup
      FieldName = 'MemberTeam_ID'
      LookupDataSet = qryCompetitors
      LookupKeyFields = 'Member_ID'
      LookupResultField = 'Team_ID'
      KeyFields = 'Member_ID'
      Lookup = True
    end
  end
  object qryWSCPRound: TABSQuery
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = False
    DataSource = dsComp
    SQL.Strings = (
      '-- '#1087#1088#1086#1090#1086#1082#1086#1083' '#1087#1086' '#1090#1091#1088#1072#1084
      
        'select me.Number,pe.Name, Event_Name, cl.Club_Name,pe.Certificat' +
        'e,'
      '  sum(case Task_ID when 1 then ws.Scores  else 0 end) v1,'
      '  sum(case Task_ID when 2 then ws.Scores else 0 end) v2, '
      '  sum(case Task_ID when 3 then ws.Scores else 0 end) v3,'
      '  sum(case Task_ID when 1 then rate else 0 end) r1,'
      '  sum(case Task_ID when 2 then rate else 0 end) r2, '
      '  sum(case Task_ID when 3 then rate else 0 end) r3,'
      '  Round_Num'
      
        'from RoundResult ws LEFT JOIN Round ro ON ro.Round_ID=ws.Round_I' +
        'D'
      '  LEFT JOIN Member me ON me.Member_ID=ws.Member_ID'
      '  LEFT JOIN People pe ON pe.People_ID=me.People_ID'
      '  LEFT JOIN Team te ON te.Team_ID=me.Team_ID'
      '  LEFT JOIN Event ev ON te.Event_ID=ev.Event_ID'
      '  LEFT JOIN Club cl ON cl.Club_ID=te.Club_ID'
      '  LEFT JOIN Penalty pt ON pt.Penalty_ID=ws.Penalty_ID'
      'WHERE ws.Sign=true AND ro.Disabled=false AND '
      
        '  te.Competition_ID=ws.Competition_ID AND ws.Competition_ID= :Co' +
        'mpetition_ID'
      
        'GROUP BY Round_Num,pe.Name,me.Number,Event_Name, cl.Club_Name,pe' +
        '.Certificate'
      'ORDER BY Round_Num,Event_Name,me.Number;')
    Left = 576
    Top = 512
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Competition_ID'
        ParamType = ptUnknown
      end>
  end
  object qryWSCPTask: TABSQuery
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = False
    DataSource = dsComp
    SQL.Strings = (
      '-- '#1087#1088#1086#1090#1086#1082#1086#1083' '#1087#1086' '#1079#1072#1076#1072#1085#1080#1103#1084
      
        'select me.Number,pe.Name, Event_Name, cl.Club_Name,pe.Certificat' +
        'e,'
      '  sum(case Round_Num when 1 then ws.Scores else 0 end) v1,'
      '  sum(case Round_Num when 2 then ws.Scores else 0 end) v2,'
      '  sum(case Round_Num when 3 then ws.Scores else 0 end) v3,'
      '  sum(case Round_Num when 1 then rate else 0 end) t1,'
      '  sum(case Round_Num when 2 then rate else 0 end) t2,'
      '  sum(case Round_Num when 3 then rate else 0 end) t3,'
      ' Task_ID,Task_Name,'
      '  AVG(rate) Total '
      
        'FROM RoundResult ws LEFT JOIN Round ro ON ro.Round_ID=ws.Round_I' +
        'D'
      '  LEFT JOIN Member me ON me.Member_ID=ws.Member_ID'
      '  LEFT JOIN People pe ON pe.People_ID=me.People_ID'
      '  LEFT JOIN Team te ON te.Team_ID=me.Team_ID'
      '  LEFT JOIN Event ev ON te.Event_ID=ev.Event_ID'
      '  LEFT JOIN Club cl ON cl.Club_ID=te.Club_ID'
      '  LEFT JOIN Task ta ON ta.Task_ID=ws.Task_ID'
      '  LEFT JOIN Penalty pt ON pt.Penalty_ID=ws.Penalty_ID'
      'WHERE te.Competition_ID=ws.Competition_ID '
      '  AND ws.Sign=true AND ro.Disabled=false'
      '  AND ta.Type_ID=ro.Round_Type'
      '  AND ws.Competition_ID=  :Competition_ID'
      
        'group by pe.Name,me.Number,Event_Name,cl.Club_Name,Task_ID,Task_' +
        'Name,pe.Certificate'
      'order by Task_ID,Total desc,Event_Name;'
      '')
    Left = 576
    Top = 560
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Competition_ID'
        ParamType = ptUnknown
      end>
  end
  object frWSCPRound: TfrxDBDataset
    UserName = 'frWSCPRound'
    CloseDataSource = False
    DataSet = qryWSCPRound
    BCDToCurrency = False
    Left = 648
    Top = 512
  end
  object frWSCPExercise: TfrxDBDataset
    UserName = 'frWSCPExercise'
    CloseDataSource = False
    DataSet = qryWSCPTask
    BCDToCurrency = False
    Left = 648
    Top = 560
  end
  object tblTask: TABSTable
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = False
    IndexFieldNames = 'Type_ID'
    TableName = 'Task'
    Exclusive = False
    MasterFields = 'Type_ID'
    MasterSource = dsComp
    Left = 152
    Top = 112
  end
  object qryPenalty: TABSQuery
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = True
    DataSource = dsComp
    SQL.Strings = (
      
        'SELECT * FROM Penalty pe WHERE pe.Type_ID=:Type_ID OR Type_ID IS' +
        ' NULL')
    Left = 464
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Type_ID'
        ParamType = ptUnknown
        Size = 4
      end>
  end
  object qryTeamMembers: TABSQuery
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = True
    BeforeOpen = qryCompetitionBeforeOpen
    DataSource = dsReport
    SQL.Strings = (
      ''
      
        'SELECT te.Team_ID, te.Name TeamName, te.Number, te.Guest, co.Nam' +
        'e Country,'
      
        '  cl.Club_Name, pe.Name MemberName, pe.Category, pe.Certificate,' +
        ' pe.Address, pe.Jumps, pe.Birthday,'
      
        '  ro.Role_Name, ro.Role_ID, me.Member_ID, me.Number MemberNumber' +
        ', me.InsuranceDate'
      'FROM Team te LEFT JOIN Member me ON (te.Team_ID=me.Team_ID)'
      'LEFT JOIN Club cl ON (cl.Club_ID=te.Club_ID)'
      'LEFT JOIN Country co ON (co.Country_ID=te.Country_ID)'
      'LEFT JOIN  People pe ON (me.People_ID=pe.People_ID)'
      'LEFT JOIN Roles ro ON (ro.Role_ID=me.Role_ID)'
      
        'WHERE te.Competition_ID= :Competition_ID AND  (te.Team_ID=:Team_' +
        'ID OR :Team_ID IS NULL) '
      'ORDER BY te.Number, ro.Role_ID, pe.Name asc')
    Left = 576
    Top = 464
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Competition_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Team_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Team_ID'
        ParamType = ptUnknown
      end>
  end
  object dsCompetition: TDataSource
    DataSet = qryCompetition
    Left = 608
    Top = 56
  end
  object tblResultDetail1: TABSTable
    CurrentVersion = '7.90 '
    DatabaseName = 'MEMORY'
    InMemory = True
    ReadOnly = False
    BeforeOpen = tblResultDetail1BeforeOpen
    AfterClose = tblResultDetail1AfterClose
    AfterPost = tblResultDetail1AfterPost
    AfterDelete = tblResultDetail1AfterDelete
    OnNewRecord = tblResultDetail1NewRecord
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'idxRoundJudge'
        Fields = 'Result_ID;Judge_ID'
        Options = [ixUnique]
      end>
    IndexFieldNames = 'Result_ID'
    FieldDefs = <
      item
        Name = 'Result_ID'
        DataType = ftInteger
      end
      item
        Name = 'Views'
        DataType = ftSmallint
      end
      item
        Name = 'IsTrainee'
        DataType = ftBoolean
      end
      item
        Name = 'Judge_ID'
        DataType = ftInteger
      end
      item
        Name = 'Monitor'
        DataType = ftInteger
      end
      item
        Name = 'p1'
        DataType = ftFloat
      end
      item
        Name = 'p2'
        DataType = ftFloat
      end
      item
        Name = 'p3'
        DataType = ftFloat
      end
      item
        Name = 'p4'
        DataType = ftFloat
      end
      item
        Name = 'p5'
        DataType = ftFloat
      end
      item
        Name = 'p6'
        DataType = ftFloat
      end
      item
        Name = 'p7'
        DataType = ftFloat
      end
      item
        Name = 'p8'
        DataType = ftFloat
      end
      item
        Name = 'p9'
        DataType = ftFloat
      end
      item
        Name = 'p10'
        DataType = ftFloat
      end
      item
        Name = 'p11'
        DataType = ftFloat
      end
      item
        Name = 'p12'
        DataType = ftFloat
      end
      item
        Name = 'p13'
        DataType = ftFloat
      end
      item
        Name = 'p14'
        DataType = ftFloat
      end
      item
        Name = 'p15'
        DataType = ftFloat
      end
      item
        Name = 'p16'
        DataType = ftFloat
      end
      item
        Name = 'p17'
        DataType = ftFloat
      end
      item
        Name = 'p18'
        DataType = ftFloat
      end
      item
        Name = 'p19'
        DataType = ftFloat
      end
      item
        Name = 'p20'
        DataType = ftFloat
      end
      item
        Name = 'p21'
        DataType = ftFloat
      end
      item
        Name = 'p22'
        DataType = ftFloat
      end
      item
        Name = 'p23'
        DataType = ftFloat
      end
      item
        Name = 'p24'
        DataType = ftFloat
      end
      item
        Name = 'p25'
        DataType = ftFloat
      end
      item
        Name = 'p26'
        DataType = ftFloat
      end
      item
        Name = 'p27'
        DataType = ftFloat
      end
      item
        Name = 'p28'
        DataType = ftFloat
      end
      item
        Name = 'p29'
        DataType = ftFloat
      end
      item
        Name = 'p30'
        DataType = ftFloat
      end
      item
        Name = 'T1'
        DataType = ftFloat
      end
      item
        Name = 'T2'
        DataType = ftFloat
      end
      item
        Name = 'T3'
        DataType = ftFloat
      end
      item
        Name = 'T4'
        DataType = ftFloat
      end
      item
        Name = 'T5'
        DataType = ftFloat
      end
      item
        Name = 'T6'
        DataType = ftFloat
      end
      item
        Name = 'T7'
        DataType = ftFloat
      end
      item
        Name = 'T8'
        DataType = ftFloat
      end
      item
        Name = 'T9'
        DataType = ftFloat
      end
      item
        Name = 'T10'
        DataType = ftFloat
      end
      item
        Name = 'T11'
        DataType = ftFloat
      end
      item
        Name = 'T12'
        DataType = ftFloat
      end
      item
        Name = 'T13'
        DataType = ftFloat
      end
      item
        Name = 'T14'
        DataType = ftFloat
      end
      item
        Name = 'T15'
        DataType = ftFloat
      end
      item
        Name = 'T16'
        DataType = ftFloat
      end
      item
        Name = 'T17'
        DataType = ftFloat
      end
      item
        Name = 'T18'
        DataType = ftFloat
      end
      item
        Name = 'T19'
        DataType = ftFloat
      end
      item
        Name = 'T20'
        DataType = ftFloat
      end
      item
        Name = 'T21'
        DataType = ftFloat
      end
      item
        Name = 'T22'
        DataType = ftFloat
      end
      item
        Name = 'T23'
        DataType = ftFloat
      end
      item
        Name = 'T24'
        DataType = ftFloat
      end
      item
        Name = 'T25'
        DataType = ftFloat
      end
      item
        Name = 'T26'
        DataType = ftFloat
      end
      item
        Name = 'T27'
        DataType = ftFloat
      end
      item
        Name = 'T28'
        DataType = ftFloat
      end
      item
        Name = 'T29'
        DataType = ftFloat
      end
      item
        Name = 'T30'
        DataType = ftFloat
      end>
    TableName = 'MemResultDetail'
    Exclusive = False
    MasterFields = 'Result_ID'
    MasterSource = dsMemberResult
    Left = 392
    Top = 560
    object tblResultDetail1Result_ID: TIntegerField
      FieldName = 'Result_ID'
    end
    object tblResultDetail1P1: TFloatField
      FieldName = 'P1'
    end
    object tblResultDetail1P2: TBooleanField
      FieldName = 'P2'
    end
    object tblResultDetail1P3: TBooleanField
      FieldName = 'P3'
    end
    object tblResultDetail1P4: TBooleanField
      FieldName = 'P4'
    end
    object tblResultDetail1P5: TBooleanField
      FieldName = 'P5'
    end
    object tblResultDetail1P6: TBooleanField
      FieldName = 'P6'
    end
    object tblResultDetail1P7: TBooleanField
      FieldName = 'P7'
    end
    object tblResultDetail1P8: TBooleanField
      FieldName = 'P8'
    end
    object tblResultDetail1P9: TBooleanField
      FieldName = 'P9'
    end
    object tblResultDetail1P10: TBooleanField
      FieldName = 'P10'
    end
  end
  object dsMemberResult: TDataSource
    DataSet = tblMemberResult
    Left = 448
    Top = 512
  end
  object frMemberDetail: TfrxDBDataset
    UserName = 'frMemberDetail'
    CloseDataSource = False
    DataSet = tblResultDetail1
    BCDToCurrency = False
    Left = 504
    Top = 560
  end
  object frMemberResult: TfrxDBDataset
    RangeBegin = rbCurrent
    RangeEnd = reCurrent
    UserName = 'frMemberResult'
    CloseDataSource = False
    DataSet = tblMemberResult
    BCDToCurrency = False
    Left = 504
    Top = 512
  end
  object qryCalcResult: TABSQuery
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = False
    Left = 24
    Top = 520
  end
end
