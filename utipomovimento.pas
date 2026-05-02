unit uTipoMovimento;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DbCtrls, DBGrids, Buttons, ComCtrls, ZDataset, rxdbcomb;

type

  { TfrmTipoMovimento }

  TfrmTipoMovimento = class(TForm)
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    dsTipoMovimento: TDatasource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    qryTipoMovimento: TZQuery;
    qryTipoMovimentoatualiza_estoque: TBooleanField;
    qryTipoMovimentocalcula_icms: TBooleanField;
    qryTipoMovimentocalcula_st: TBooleanField;
    qryTipoMovimentocfop_normal_estado: TStringField;
    qryTipoMovimentocfop_normal_outro_estado: TStringField;
    qryTipoMovimentocfop_st_estado: TStringField;
    qryTipoMovimentocfop_st_outro_estado: TStringField;
    qryTipoMovimentodescricao: TStringField;
    qryTipoMovimentodestino_estoque: TLongintField;
    qryTipoMovimentoentrada_saida: TStringField;
    qryTipoMovimentogera_faturamento: TBooleanField;
    qryTipoMovimentoid: TLongintField;
    qryTipoMovimentoorigem_preco: TLongintField;
    RxDBComboBox1: TRxDBComboBox;
    RxDBComboBox2: TRxDBComboBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmTipoMovimento: TfrmTipoMovimento;

implementation

uses udbConnect, uSearch, variants, varutils, WagVclUtils, BDSqlUtils;
{$R *.lfm}

{ TfrmTipoMovimento }

procedure TfrmTipoMovimento.FormCreate(Sender: TObject);
begin
  OpenTable( qryTipoMovimento );
end;

procedure TfrmTipoMovimento.SpeedButton1Click(Sender: TObject);
Var res : variant;
begin
    res := ShowSearchModal(dbConnect.ZConnection1,'cfop_data','cfop,descricao','cfop','descricao',True);
    if VarIsBlank(res) then Exit;
    EditTable(qryTipoMovimento);
    qryTipoMovimentocfop_normal_estado.AsString := res;
end;

procedure TfrmTipoMovimento.SpeedButton2Click(Sender: TObject);
Var res : variant;
begin
    res := ShowSearchModal(dbConnect.ZConnection1,'cfop_data','cfop,descricao','cfop','descricao',True);
    if VarIsBlank(res) then Exit;
    EditTable(qryTipoMovimento);
    qryTipoMovimentocfop_normal_outro_estado.AsString := res;
end;

procedure TfrmTipoMovimento.SpeedButton3Click(Sender: TObject);
Var res : variant;
begin
    res := ShowSearchModal(dbConnect.ZConnection1,'cfop_data','cfop,descricao','cfop','descricao',True);
    if VarIsBlank(res) then Exit;
    EditTable(qryTipoMovimento);
    qryTipoMovimentocfop_st_estado.AsString := res;
end;

procedure TfrmTipoMovimento.SpeedButton4Click(Sender: TObject);
Var res : variant;
begin
    res := ShowSearchModal(dbConnect.ZConnection1,'cfop_data','cfop,descricao','cfop','descricao',True);
    if VarIsBlank(res) then Exit;
    EditTable(qryTipoMovimento);
    qryTipoMovimentocfop_st_outro_estado.AsString := res;
end;


initialization
  RegisterClass(TfrmTipoMovimento);


end.

