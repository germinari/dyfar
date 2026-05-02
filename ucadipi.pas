unit uCadIPI;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls,
  DbCtrls, StdCtrls, rxdbgrid, rxdbcomb, ZDataset;

type

  { TfrmCadIPI }

  TfrmCadIPI = class(TForm)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    dsIPI: TDataSource;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    qryIPIcalculo: TStringField;
    qryIPIcl_enq: TStringField;
    qryIPIcnpj_prod: TStringField;
    qryIPIcst: TLongintField;
    qryIPIc_enq: TStringField;
    qryIPIc_selo: TStringField;
    qryIPIid: TLongintField;
    qryIPInome: TStringField;
    qryIPIp_ipi: TFloatField;
    qryIPIq_selo: TLongintField;
    qryIPIq_unid: TFloatField;
    RxDBComboBox1: TRxDBComboBox;
    RxDBGrid1: TRxDBGrid;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    qryIPI: TZQuery;
    procedure FormCreate(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmCadIPI: TfrmCadIPI;

implementation

uses udbConnect, sistema_config, BDSqlUtils;

{$R *.lfm}

{ TfrmCadIPI }

procedure TfrmCadIPI.ToolButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadIPI.FormCreate(Sender: TObject);
begin
  OpenTable( qryIPI );
end;

initialization
  RegisterClass(TfrmCadIPI);
end.

