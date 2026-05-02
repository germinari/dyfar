unit uProducao;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  ComCtrls, StdCtrls, DbCtrls, DBExtCtrls, EditBtn, Buttons, Menus, rxdbgrid,
  rxdbdateedit, ZDataset, TDIPageControl;

type

  { TfrmProducao }

  TfrmProducao = class(TForm)
    btAplicar: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBMemo1: TDBMemo;
    DBText1: TDBText;
    DBText2: TDBText;
    dsListaOrdem: TDataSource;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    dsOrdemProducao: TDataSource;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    PageControl1: TPageControl;
    PageControl2: TPageControl;
    PopupMenu1: TPopupMenu;
    qryOrdemProducao: TZQuery;
    qryListaOrdemdata_emissao: TDateTimeField;
    qryListaOrdemdata_finalizacao: TDateTimeField;
    qryListaOrdemdescricao: TStringField;
    qryListaOrdemid: TLongintField;
    qryListaOrdemlote_producao: TStringField;
    qryListaOrdemproduto: TLongintField;
    qryListaOrdemquant_prevista: TFloatField;
    qryListaOrdemquant_realizada: TFloatField;
    qryListaOrdemstatus: TLongintField;
    qryOrdemProducaodata_emissao: TDateTimeField;
    qryOrdemProducaodata_finalizacao: TDateTimeField;
    qryOrdemProducaodescricao: TStringField;
    qryOrdemProducaoid: TLongintField;
    qryOrdemProducaolote_producao: TStringField;
    qryOrdemProducaoproduto: TLongintField;
    qryOrdemProducaoquant_prevista: TFloatField;
    qryOrdemProducaoquant_realizada: TFloatField;
    qryOrdemProducaostatus: TLongintField;
    RxDBDateEdit1: TRxDBDateEdit;
    RxDBDateEdit2: TRxDBDateEdit;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    RxDBGrid3: TRxDBGrid;
    SpeedButton1: TSpeedButton;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    qryListaOrdem: TZQuery;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    procedure btAplicarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
  private
    { private declarations }
    procedure OpenOrdem( id : Integer);
  public
    { public declarations }
  end; 

var
  frmProducao: TfrmProducao;

implementation

uses udbConnect, WagVclUtils, uSearch, BDSqlUtils;

{$R *.lfm}

{ TfrmProducao }



procedure TfrmProducao.ToolButton2Click(Sender: TObject);
begin
  ClosePageThisForm(Self);
end;

procedure TfrmProducao.ToolButton4Click(Sender: TObject);
var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'produtos','id,descricao','id,descricao','descricao','tipo_produto_interno IN (1,2)','0=0',true);
  if VarIsBlank(ret) then exit;

  PageControl1.ActivePageIndex:= 1;
end;

procedure TfrmProducao.OpenOrdem(id: Integer);
begin
  qryOrdemProducao.Close;
  qryOrdemProducao.ParamByName('id').AsInteger := id;
  OpenTable( qryOrdemProducao );
end;

procedure TfrmProducao.FormResize(Sender: TObject);
begin
  CenterControl(GroupBox1);
  CenterControl(GroupBox2);
  CenterControl(GroupBox3);
end;

procedure TfrmProducao.btAplicarClick(Sender: TObject);
begin
  qryListaOrdem.Close;
  qryListaOrdem.ParamByName('dtini').AsDateTime := DateEdit1.Date;
  qryListaOrdem.ParamByName('dtfim').AsDateTime := DateEdit2.Date;
  OpenTable( qryListaOrdem );
end;

procedure TfrmProducao.PageControl1Change(Sender: TObject);
begin
  FormResize(nil);
end;

procedure TfrmProducao.PageControl2Change(Sender: TObject);
begin
  FormResize(nil);
end;

procedure TfrmProducao.RxDBGrid2DblClick(Sender: TObject);
begin
  OpenOrdem( qryListaOrdemid.AsInteger );
  PageControl1.ActivePageIndex:= 1;
  PageControl2.ActivePageIndex:= 0;
end;

end.

