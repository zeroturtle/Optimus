unit ScoreEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, Mask;

type
  TfScoreEdit = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Button1: TButton;
    Button2: TButton;
    DBText1: TDBText;
    DBText2: TDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fScoreEdit: TfScoreEdit;

implementation

uses Unit5;

{$R *.dfm}

{
  Чтоб удалить оценку надо
  1. Сдвинуть все оценки на 1 влево
  2. В крайнюю оценку записать NULL
  3. поменять в ViewDetail Sequence-1 для оценок больше текущей
  4. пересчитать результат
}
{
  Чтобы добавить оценку надо
  1. сдвинуть все оценки на 1 вправо
  2. поменять в ViewDetail Sequence+1 для оценок больше текущей
  3. В ViewDetail вставить
   // Значения Result_IDб Judge_ID, Monitor брать из ResultDetail
   // Sequence определить по имени поля Px
   // Point=0, ATime=WorkTime, Error_ID=NULL
  4. в текущую позицию вписать новую оценку
  5. пересчитать результат
}
end.
