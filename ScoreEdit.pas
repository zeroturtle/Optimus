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
  ���� ������� ������ ����
  1. �������� ��� ������ �� 1 �����
  2. � ������� ������ �������� NULL
  3. �������� � ViewDetail Sequence-1 ��� ������ ������ �������
  4. ����������� ���������
}
{
  ����� �������� ������ ����
  1. �������� ��� ������ �� 1 ������
  2. �������� � ViewDetail Sequence+1 ��� ������ ������ �������
  3. � ViewDetail ��������
   // �������� Result_ID� Judge_ID, Monitor ����� �� ResultDetail
   // Sequence ���������� �� ����� ���� Px
   // Point=0, ATime=WorkTime, Error_ID=NULL
  4. � ������� ������� ������� ����� ������
  5. ����������� ���������
}
end.
