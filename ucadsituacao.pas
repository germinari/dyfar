unit ucadSituacao;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  DbCtrls, ComCtrls,  Buttons, ZDataset, rxdbgrid, db;

type

  { TfrmcadSituacao }

  TfrmcadSituacao = class(TForm)
    Datasource1: TDatasource;
    DBNavigator1: TDBNavigator;
    Panel1: TPanel;
    RxDBGrid1: TRxDBGrid;
    SpeedButton1: TSpeedButton;
    ZQuery1: TZQuery;
    ZQuery1descricao: TStringField;
    ZQuery1id: TLongintField;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ZQuery1BeforeDelete(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  frmcadSituacao: TfrmcadSituacao;

implementation

{$R *.lfm}

Uses udbConnect, WagVclUtils, uSearch , BDSqlUtils;

{ TfrmcadSituacao }

procedure TfrmcadSituacao.FormCreate(Sender: TObject);
begin
  OpenTable( ZQuery1 );
end;

procedure TfrmcadSituacao.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmcadSituacao.ZQuery1BeforeDelete(DataSet: TDataSet);
begin
  ConfirmDelete;
end;


initialization
  RegisterClass(TfrmcadSituacao);



end.

