unit ucadgrupoprod;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  DbCtrls, ComCtrls, Buttons, ZDataset, rxdbgrid, db;

type

  { Tfrmcadgrupoprod }

  Tfrmcadgrupoprod = class(TForm)
    Datasource1: TDatasource;
    DBNavigator1: TDBNavigator;
    Panel1: TPanel;
    RxDBGrid1: TRxDBGrid;
    SpeedButton1: TSpeedButton;
    ZQuery1: TZQuery;
    ZQuery1id: TLongintField;
    ZQuery1nome: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ZQuery1BeforeDelete(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  frmcadgrupoprod: Tfrmcadgrupoprod;

implementation

{$R *.lfm}

Uses udbConnect, WagVclUtils, uSearch , BDSqlUtils;

{ Tfrmcadgrupoprod }

procedure Tfrmcadgrupoprod.FormCreate(Sender: TObject);
begin
  OpenTable( ZQuery1 );
end;

procedure Tfrmcadgrupoprod.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrmcadgrupoprod.ZQuery1BeforeDelete(DataSet: TDataSet);
begin
    ConfirmDelete;
end;


initialization
  RegisterClass(Tfrmcadgrupoprod);


end.

