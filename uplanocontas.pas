unit uPlanoContas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls,
  DbCtrls, ZDataset, rxdbgrid, db;

type

  { TfrmPlanoContas }

  TfrmPlanoContas = class(TForm)
    DBNavigator1: TDBNavigator;
    dsPlanoContas: TDatasource;
    qryPlanoContasconta: TStringField;
    qryPlanoContasdescricao: TStringField;
    qryPlanoContasid: TLongintField;
    qryPlanoContassaldo_inicial: TFloatField;
    RxDBGrid1: TRxDBGrid;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    qryPlanoContas: TZQuery;
    procedure FormCreate(Sender: TObject);
    procedure qryPlanoContasBeforeDelete(DataSet: TDataSet);
    procedure ToolButton2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  frmPlanoContas: TfrmPlanoContas;

implementation

{$R *.lfm}

Uses udbConnect, WagVclUtils, BDSqlUtils, uSearch;

{ TfrmPlanoContas }

procedure TfrmPlanoContas.FormCreate(Sender: TObject);
begin
  OpenTable( qryPlanoContas );
end;

procedure TfrmPlanoContas.qryPlanoContasBeforeDelete(DataSet: TDataSet);
begin
  if Length(qryPlanoContasconta.AsString) = 1 then
     Raise Exception.Create('Esta conta não pode ser deletada.');
end;

procedure TfrmPlanoContas.ToolButton2Click(Sender: TObject);
begin
  Close;
end;


initialization
  RegisterClass(TfrmPlanoContas);



end.

