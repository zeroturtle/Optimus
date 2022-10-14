object DataJudge: TDataJudge
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 198
  Top = 157
  Height = 259
  Width = 406
  object tblViewDetail: TABSTable
    CurrentVersion = '7.90 '
    DatabaseName = 'MEMORY'
    InMemory = True
    ReadOnly = False
    StoreDefs = True
    FieldDefs = <
      item
        Name = 'Result_ID'
        DataType = ftInteger
      end
      item
        Name = 'Monitor'
        DataType = ftInteger
      end
      item
        Name = 'Sequence'
        DataType = ftInteger
      end
      item
        Name = 'Point'
        DataType = ftFloat
      end
      item
        Name = 'ATime'
        DataType = ftFloat
      end
      item
        Name = 'Error_ID'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Error_Code'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Error_Value'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Judge_ID'
        DataType = ftInteger
      end>
    TableName = 'ViewDetail'
    Exclusive = False
    Left = 24
    Top = 16
  end
  object tblResultDetail: TABSTable
    CurrentVersion = '7.90 '
    DatabaseName = 'MEMORY'
    InMemory = True
    ReadOnly = False
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'idxRoundJudge'
        Fields = 'Result_ID, Judge_ID'
      end>
    FieldDefs = <
      item
        Name = 'Result_ID'
        DataType = ftInteger
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
    Left = 96
    Top = 16
  end
  object qryResultViewDetail: TABSQuery
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = False
    DataSource = dsList
    SQL.Strings = (
      '-- '#1087#1077#1088#1077#1085#1086#1089#1080#1084' '#1086#1094#1077#1085#1082#1080' '#1080#1079' ViewDetail '#1074' '#1086#1076#1085#1091' '#1089#1090#1088#1086#1082#1091' ResultDetail'
      'DELETE FROM MEMORY ResultDetail;'
      ''
      'INSERT INTO MEMORY ResultDetail'
      
        'SELECT distinct jr.Result_ID, jr.IsTrainee, jr.Judge_ID, jr.Moni' +
        'tor,'
      'avg(case sequence when 0 then point-E1 else null end) as p1,'
      'avg(case sequence when 1 then point-E2 else null end) as p2,'
      'avg(case sequence when 2 then point-E3 else null end) as p3,'
      'avg(case sequence when 3 then point-E4 else null end) as p4,'
      'avg(case sequence when 4 then point-E5 else null end) as p5,'
      'avg(case sequence when 5 then point-E6 else null end) as p6,'
      'avg(case sequence when 6 then point-E7 else null end) as p7,'
      'avg(case sequence when 7 then point-E8 else null end)  as p8,'
      'avg(case sequence when 8 then point-E9 else null end)  as p9,'
      'avg(case sequence when 9 then point-E10 else null end)  as p10,'
      'avg(case sequence when 10 then point-E11 else null end) as p11,'
      'avg(case sequence when 11 then point-E12 else null end) as p12,'
      'avg(case sequence when 12 then point-E13 else null end) as p13,'
      'avg(case sequence when 13 then point-E14 else null end) as p14,'
      'avg(case sequence when 14 then point-E15 else null end) as p15,'
      'avg(case sequence when 15 then point-E16 else null end) as p16,'
      'avg(case sequence when 16 then point-E17 else null end) as p17,'
      'avg(case sequence when 17 then point-E18 else null end) as p18,'
      'avg(case sequence when 18 then point-E19 else null end) as p19,'
      'avg(case sequence when 19 then point-E20 else null end) as p20,'
      'avg(case sequence when 20 then point-E21 else null end) as p21,'
      'avg(case sequence when 21 then point-E22 else null end) as p22,'
      'avg(case sequence when 22 then point-E23 else null end) as p23,'
      'avg(case sequence when 23 then point-E24 else null end) as p24,'
      'avg(case sequence when 24 then point-E25 else null end) as p25,'
      'avg(case sequence when 25 then point-E26 else null end) as p26,'
      'avg(case sequence when 26 then point-E27 else null end) as p27,'
      'avg(case sequence when 27 then point-E28 else null end) as p28,'
      'avg(case sequence when 28 then point-E29 else null end) as p29,'
      'avg(case sequence when 29 then point-E30 else null end) as p30'
      ','
      'avg(case sequence when 0 then ATime else null end) as T1,'
      'avg(case sequence when 1 then ATime else null end) as T2,'
      'avg(case sequence when 2 then ATime else null end) as T3,'
      'avg(case sequence when 3 then ATime else null end) as T4,'
      'avg(case sequence when 4 then ATime else null end) as T5,'
      'avg(case sequence when 5 then ATime else null end) as T6,'
      'avg(case sequence when 6 then ATime else null end) as T7,'
      'avg(case sequence when 7 then ATime else null end) as T8,'
      'avg(case sequence when 8 then ATime else null end) as T9,'
      'avg(case sequence when 9 then ATime else null end) as T10,'
      'avg(case sequence when 10 then ATime else null end) as T11,'
      'avg(case sequence when 11 then ATime else null end) as T12,'
      'avg(case sequence when 12 then ATime else null end) as T13,'
      'avg(case sequence when 13 then ATime else null end) as T14,'
      'avg(case sequence when 14 then ATime else null end) as T15,'
      'avg(case sequence when 15 then ATime else null end) as T16,'
      'avg(case sequence when 16 then ATime else null end) as T17,'
      'avg(case sequence when 17 then ATime else null end) as T18,'
      'avg(case sequence when 18 then ATime else null end) as T19,'
      'avg(case sequence when 19 then ATime else null end) as T20,'
      'avg(case sequence when 20 then ATime else null end) as T21,'
      'avg(case sequence when 21 then ATime else null end) as T22,'
      'avg(case sequence when 22 then ATime else null end) as T23,'
      'avg(case sequence when 23 then ATime else null end) as T24,'
      'avg(case sequence when 24 then ATime else null end) as T25,'
      'avg(case sequence when 25 then ATime else null end) as T26,'
      'avg(case sequence when 26 then ATime else null end) as T27,'
      'avg(case sequence when 27 then ATime else null end) as T28,'
      'avg(case sequence when 28 then ATime else null end) as T29,'
      'avg(case sequence when 29 then ATime else null end) as T30'
      'FROM'
      
        '  (SELECT Result_ID, j.Judge_ID, j.Port-1 Monitor, IsTrainee FRO' +
        'M RoundResult r, Judges j'
      '   -- '#1074#1089#1077' '#1089#1091#1076#1100#1080' '#1089#1086#1088#1077#1074#1085#1086#1074#1072#1085#1080#1103' '#1095#1090#1086' '#1085#1072' '#1084#1086#1085#1080#1090#1086#1088#1072#1093
      
        '   WHERE Port is not null AND r.Competition_ID=j.Competition_ID ' +
        ' AND r.Result_ID=:Result_ID'
      '  ) jr'
      '  LEFT JOIN MEMORY ViewDetail vd ON (vd.Monitor=jr.Monitor)'
      '  LEFT JOIN ('
      '    SELECT Monitor,'
      '      SUM(CASE Sequence WHEN 0 THEN [Value] ELSE 0 END) E1,'
      '      SUM(CASE Sequence WHEN 1 THEN [Value] ELSE 0 END) E2,'
      '      SUM(CASE Sequence WHEN 2 THEN [Value] ELSE 0 END) E3,'
      '      SUM(CASE Sequence WHEN 3 THEN [Value] ELSE 0 END) E4,'
      '      SUM(CASE Sequence WHEN 4 THEN [Value] ELSE 0 END) E5,'
      '      SUM(CASE Sequence WHEN 5 THEN [Value] ELSE 0 END) E6,'
      '      SUM(CASE Sequence WHEN 6 THEN [Value] ELSE 0 END) E7,'
      '      SUM(CASE Sequence WHEN 7 THEN [Value] ELSE 0 END) E8,'
      '      SUM(CASE Sequence WHEN 8 THEN [Value] ELSE 0 END) E9,'
      '      SUM(CASE Sequence WHEN 9 THEN [Value] ELSE 0 END) E10,'
      '      SUM(CASE Sequence WHEN 10 THEN [Value] ELSE 0 END) E11,'
      '      SUM(CASE Sequence WHEN 11 THEN [Value] ELSE 0 END) E12,'
      '      SUM(CASE Sequence WHEN 12 THEN [Value] ELSE 0 END) E13,'
      '      SUM(CASE Sequence WHEN 13 THEN [Value] ELSE 0 END) E14,'
      '      SUM(CASE Sequence WHEN 14 THEN [Value] ELSE 0 END) E15,'
      '      SUM(CASE Sequence WHEN 15 THEN [Value] ELSE 0 END) E16,'
      '      SUM(CASE Sequence WHEN 16 THEN [Value] ELSE 0 END) E17,'
      '      SUM(CASE Sequence WHEN 17 THEN [Value] ELSE 0 END) E18,'
      '      SUM(CASE Sequence WHEN 18 THEN [Value] ELSE 0 END) E19,'
      '      SUM(CASE Sequence WHEN 19 THEN [Value] ELSE 0 END) E20,'
      '      SUM(CASE Sequence WHEN 20 THEN [Value] ELSE 0 END) E21,'
      '      SUM(CASE Sequence WHEN 21 THEN [Value] ELSE 0 END) E22,'
      '      SUM(CASE Sequence WHEN 22 THEN [Value] ELSE 0 END) E23,'
      '      SUM(CASE Sequence WHEN 23 THEN [Value] ELSE 0 END) E24,'
      '      SUM(CASE Sequence WHEN 24 THEN [Value] ELSE 0 END) E25,'
      '      SUM(CASE Sequence WHEN 25 THEN [Value] ELSE 0 END) E26,'
      '      SUM(CASE Sequence WHEN 26 THEN [Value] ELSE 0 END) E27,'
      '      SUM(CASE Sequence WHEN 27 THEN [Value] ELSE 0 END) E28,'
      '      SUM(CASE Sequence WHEN 28 THEN [Value] ELSE 0 END) E29,'
      '      SUM(CASE Sequence WHEN 29 THEN [Value] ELSE 0 END) E30'
      '    FROM MEMORY ViewError ve'
      '    GROUP BY Monitor'
      '  ) err ON  err.Monitor=vd.Monitor'
      'GROUP BY jr.Result_ID, jr.IsTrainee, jr.Judge_ID, jr.Monitor'
      ''
      '')
    Left = 240
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Result_ID'
        ParamType = ptUnknown
      end>
  end
  object qryList: TABSQuery
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = False
    BeforeOpen = qryListBeforeOpen
    BeforeClose = qryListBeforeClose
    AfterScroll = qryListAfterScroll
    DataSource = DataMain.dsComp
    SQL.Strings = (
      
        'SELECT rr.*, r.Round_Num, r.Round_Type, t.Number+'#39' -  '#39'+t.Name a' +
        's TeamName, rr.Pool_Sequence, e.Event_Name'
      
        'FROM Team t, RoundResult rr, Round r LEFT JOIN Event e ON (e.Eve' +
        'nt_ID=r.Event_ID)'
      
        'WHERE rr.Team_ID=t.Team_ID AND r.Round_ID=rr.Round_ID AND rr.Vid' +
        'eoFile IS NOT NULL AND rr.Competition_ID=:Competition_ID'
      
        'AND not EXISTS (SELECT * FROM ResultDetail rd WHERE rr.Result_ID' +
        '=rd.Result_ID)')
    Left = 232
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Competition_ID'
        ParamType = ptUnknown
      end>
  end
  object dsList: TDataSource
    DataSet = qryList
    Left = 232
    Top = 160
  end
  object qryScore: TABSQuery
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = False
    DataSource = dsList
    Left = 16
    Top = 104
  end
  object qryTime: TABSQuery
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = False
    DataSource = dsList
    Left = 80
    Top = 104
  end
  object qryError: TABSQuery
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = False
    DataSource = dsList
    Left = 144
    Top = 104
  end
  object dsScore: TDataSource
    DataSet = qryScore
    Left = 16
    Top = 160
  end
  object dsTime: TDataSource
    DataSet = qryTime
    Left = 80
    Top = 160
  end
  object dsError: TDataSource
    DataSet = qryError
    Left = 144
    Top = 160
  end
  object tblSequence: TABSTable
    CurrentVersion = '7.90 '
    DatabaseName = 'MEMORY'
    InMemory = True
    ReadOnly = False
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
    TableName = 'Sequence'
    Exclusive = False
    MasterFields = 'Round_ID'
    Left = 306
    Top = 104
  end
  object dsSequence: TDataSource
    DataSet = tblSequence
    Left = 304
    Top = 160
  end
  object qrySequence: TABSQuery
    CurrentVersion = '7.90 '
    DatabaseName = 'dbJudge'
    InMemory = False
    ReadOnly = False
    AfterOpen = qrySequenceAfterOpen
    DataSource = dsList
    SQL.Strings = (
      'select Pool_Code,Image1,Image2,Image3,'
      'case when Figure1=Pool_Code then 1'
      'when Figure2=Pool_Code then 2'
      'when Figure3=Pool_Code then 3'
      'when Figure4=Pool_Code then 4'
      'when Figure5=Pool_Code then 5 end as IMG,'
      'r.Pool_Sequence_Code as Pool_Sequence'
      'from RoundResult rr, round r, Competition c, pool p'
      
        'where c.Competition_ID=r.Competition_ID AND r.Round_ID=rr.Round_' +
        'ID AND rr.Result_ID=:Result_ID'
      'AND c.Pool_ID=p.Pool_ID AND IMG>0'
      'order by IMG')
    Left = 304
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Result_ID'
        ParamType = ptUnknown
      end>
  end
  object tblViewError: TABSTable
    CurrentVersion = '7.90 '
    DatabaseName = 'MEMORY'
    InMemory = True
    ReadOnly = False
    StoreDefs = True
    FieldDefs = <
      item
        Name = 'Result_ID'
        DataType = ftInteger
      end
      item
        Name = 'Monitor'
        DataType = ftSmallint
      end
      item
        Name = 'Sequence'
        DataType = ftSmallint
      end
      item
        Name = 'Error_ID'
        DataType = ftInteger
      end
      item
        Name = 'Value'
        DataType = ftFloat
      end>
    TableName = 'ViewError'
    Exclusive = False
    Left = 168
    Top = 16
  end
end
