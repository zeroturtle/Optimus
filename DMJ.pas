unit DMJ;

interface

uses
  SysUtils, Classes, ABSMain, DB;

type
  TDataJudge = class(TDataModule)
    tblViewDetail: TABSTable;
    tblResultDetail: TABSTable;
    qryResultViewDetail: TABSQuery;
    qryList: TABSQuery;
    dsList: TDataSource;
    qryScore: TABSQuery;
    qryTime: TABSQuery;
    qryError: TABSQuery;
    dsScore: TDataSource;
    dsTime: TDataSource;
    dsError: TDataSource;
    tblSequence: TABSTable;
    dsSequence: TDataSource;
    qrySequence: TABSQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure qrySequenceAfterOpen(DataSet: TDataSet);
    procedure qryListAfterScroll(DataSet: TDataSet);
    procedure qryListBeforeClose(DataSet: TDataSet);
    procedure qryListBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataJudge: TDataJudge;

implementation

uses Unit5;

{$R *.dfm}

procedure TDataJudge.DataModuleCreate(Sender: TObject);
begin
  tblViewDetail.CreateTable;
  tblResultDetail.CreateTable;
  tblSequence.CreateTable;
end;

procedure TDataJudge.DataModuleDestroy(Sender: TObject);
begin
  tblViewDetail.DeleteTable;
  tblResultDetail.DeleteTable;
  tblSequence.DeleteTable;
end;

procedure TDataJudge.qrySequenceAfterOpen(DataSet: TDataSet);
var i, j : integer;
    StreamBlob: TStream;
begin
  j := 0;
  with tblSequence do begin
    Close;
    EmptyTable;
    Open;
    if not Locate('Round_ID',qryList.FieldByName('Round_ID').AsInteger,[]) then begin
      Append;
      DataSet.First;
      while not DataSet.Eof do  begin
        for i := 1 to 3 do
          if (not DataSet.FieldByName('Image'+IntToStr(i)).IsNull) then begin
              inc(j);
              try
                StreamBlob := DataSet.CreateBlobStream(DataSet.FieldByName('Image'+IntToStr(i)),bmRead);
                with tblSequence.CreateBlobStream(tblSequence.FieldByName('Pic'+IntToStr(j)),bmWrite) do
                  try
                    CopyFrom(StreamBlob,StreamBlob.Size);
                  finally
                    Free;
                  end;
              finally
                StreamBlob.Free;
              end;
          end;
          DataSet.Next;
      end;
      FieldByName('CountPic').AsInteger := j;
      Post;
    end;
  end;
end;

procedure TDataJudge.qryListAfterScroll(DataSet: TDataSet);
begin
  DataJudge.qrySequence.Open;
end;

procedure TDataJudge.qryListBeforeClose(DataSet: TDataSet);
begin
    tblViewDetail.Close;
    tblResultDetail.Close;
end;

procedure TDataJudge.qryListBeforeOpen(DataSet: TDataSet);
begin
// удалить предыдущие результаты
    tblViewDetail.EmptyTable;
    tblResultDetail.EmptyTable;

    tblViewDetail.Open;
    tblResultDetail.Open;
end;

end.
