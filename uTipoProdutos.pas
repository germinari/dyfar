unit uTipoProdutos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls,
  ExtCtrls, DbCtrls, DBGrids, udbConnect, sistema_config, db, ZDataset;

type

  { TfrmTipoProdutos }

  TfrmTipoProdutos = class(TForm)
    dsPai: TDatasource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    dsFilho: TDatasource;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    qryFilho: TZQuery;
    qryFilhoclassificacao: TStringField;
    qryFilhoid: TLongintField;
    qryFilhonome: TStringField;
    qryFilhopai: TLongintField;
    qryFilhoprazo_medio: TLongintField;
    qryPaiclassificacao: TStringField;
    qryPaiid: TLongintField;
    qryPainome: TStringField;
    qryPaipai: TLongintField;
    qryPaiprazo_medio: TLongintField;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    qryPai: TZQuery;
    procedure FormCreate(Sender: TObject);
    procedure qryFilhoNewRecord(DataSet: TDataSet);
    procedure ToolButton2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmTipoProdutos: TfrmTipoProdutos;

implementation

uses BDSqlUtils;

{$R *.lfm}

{ TfrmTipoProdutos }

procedure TfrmTipoProdutos.ToolButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmTipoProdutos.FormCreate(Sender: TObject);
begin
  OpenTable( qryPai );
  OpenTable( qryFilho );
end;

procedure TfrmTipoProdutos.qryFilhoNewRecord(DataSet: TDataSet);
begin
   qryFilhopai.AsInteger := qryPaiid.AsInteger;
end;

initialization

RegisterClass(TfrmTipoProdutos);

end.

