unit uGerenciamentoFlex;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, memds, FileUtil, Forms, Controls, Graphics, Dialogs,
  ComCtrls, DbCtrls, StdCtrls, EditBtn, Buttons, WAGDBNavigator, ZDataset,
  rxdbgrid, rxmemds, Grids, DBGrids;

type

  { TfrmGerenciamentoFlex }

  TfrmGerenciamentoFlex = class(TForm)
    Button1: TButton;
    dsCtaCorrente: TDataSource;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    DBText1: TDBText;
    dsListaRep: TDataSource;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    ImageList1: TImageList;
    Label1: TLabel;
    mdCtaCorrentecredito: TFloatField;
    mdCtaCorrentedebito: TFloatField;
    mdCtaCorrentedh_movimento: TDateTimeField;
    mdCtaCorrentehistorico: TStringField;
    mdCtaCorrenteid: TLongintField;
    mdCtaCorrentenfsaida: TLongintField;
    mdCtaCorrenterepresentante: TLongintField;
    MemDataset1: TMemDataset;
    PageControl1: TPageControl;
    qryCtaCorrentecredito: TFloatField;
    qryCtaCorrentedebito: TFloatField;
    qryCtaCorrentedh_movimento: TDateTimeField;
    qryCtaCorrentehistorico: TStringField;
    qryCtaCorrenteid: TLongintField;
    qryCtaCorrentenfsaida: TLongintField;
    qryCtaCorrentenumeroctlform: TLongintField;
    qryCtaCorrenterepresentante: TLongintField;
    qryListaRepconnected: TBooleanField;
    qryListaRepdh_registro: TDateTimeField;
    qryListaRepid: TLongintField;
    qryListaRepnome: TStringField;
    qryListaRepsaldo: TFloatField;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    btSendMsg: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    qryListaRep: TZQuery;
    qryCtaCorrente: TZQuery;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    procedure btSendMsgClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ToolBar1DblClick(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    procedure LoadRepresentante( const Repid : Integer );
  end;

var
  frmGerenciamentoFlex: TfrmGerenciamentoFlex;

implementation

uses sistema_config, uLancaFlex, udbConnect, WagVclUtils, BDSqlUtils, dateutils;

{$R *.lfm}

{ TfrmGerenciamentoFlex }

procedure TfrmGerenciamentoFlex.ToolButton12Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmGerenciamentoFlex.ToolButton3Click(Sender: TObject);
Var qry : TZQuery;
begin
   qry := ExecSqlQuery(dbConnect.ZConnection1,'SELECT id, nome_arquivo, arquivo, dh_backup '+
                       'FROM sys_backup_smartphone Where nome_arquivo ilike ''storage_%d_%%.sqlite'' '+
                       'Order by dh_backup desc '+
                       'Limit 1',[qryListaRepid.asInteger]);
   ExportFileFromServer(dbConnect.ZConnection1,qry.FieldByName('arquivo').AsInteger,
                        GetTempDir + qry.FieldByName('nome_arquivo').AsString);
   ShowMessage(GetTempDir + qry.FieldByName('nome_arquivo').AsString);
{Select *
from sys_backup_smartphone
Where nome_arquivo ilike 'storage_9_%.sqlite'
Order by dh_backup desc
Limit 1}
end;

procedure TfrmGerenciamentoFlex.LoadRepresentante(const Repid: Integer);
Var saldo : Currency;
begin

  qryCtaCorrente.Close;
  OpenTable( qryCtaCorrente );
  MemDataset1.Close;
  MemDataset1.Clear(False);
  OpenTable( MemDataset1 );
  saldo :=  StrToCurrDef(ExecSql(dbConnect.ZConnection1,'Select sum(credito-debito) From conta_corrente_flex '+
                                 'Where representante=%d and dh_movimento::date < ''%s'' ',
                                 [qryListaRepid.asInteger,
                                  DateEdit1.Text]),0.00);

  MemDataset1.AppendRecord([nil,
                            nil,
                            qryCtaCorrenterepresentante,
                            qryCtaCorrentedh_movimento,
                            'Saldo anterior',
                            0.00,
                            0.00,
                            saldo]);
  MemDataset1.DisableControls;
  while Not qryCtaCorrente.Eof do begin
    saldo := saldo + qryCtaCorrentecredito.AsCurrency - qryCtaCorrentedebito.AsCurrency;
    MemDataset1.AppendRecord([qryCtaCorrenteid,
                              qryCtaCorrentenfsaida,
                              qryCtaCorrenterepresentante,
                              qryCtaCorrentedh_movimento,
                              qryCtaCorrentehistorico,
                              qryCtaCorrentecredito,
                              qryCtaCorrentedebito,
                              saldo,
                              qryCtaCorrentenumeroctlform]);
    qryCtaCorrente.Next;
  end;
  MemDataset1.EnableControls;
end;

procedure TfrmGerenciamentoFlex.FormCreate(Sender: TObject);
begin
  OpenTable( qryListaRep );
  DateEdit1.Date := StartOfTheMonth(Date);
  DateEdit2.Date := EndOfTheMonth(Date);
end;

procedure TfrmGerenciamentoFlex.RxDBGrid1DblClick(Sender: TObject);
begin
  StartWait;
  try
    LoadRepresentante( qryListaRepid.AsInteger );
    PageControl1.ActivePageIndex:= 1;
  finally
    StopWait;
  end;
end;

procedure TfrmGerenciamentoFlex.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  RxDBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  if Column.Index = 0 then begin
     ImageList1.Draw(RxDBGrid1.Canvas,Rect.Left,Rect.Top,qryListaRepconnected.AsInteger);
  end;
end;

procedure TfrmGerenciamentoFlex.SpeedButton1Click(Sender: TObject);
Var historico: String;
    valor : Currency;
begin
  if not lancamentoFlex(qryListaRepnome.AsString,historico,valor) then exit;
  SetDecimalSeparator('.');
  try
  ExecSql(dbConnect.ZConnection1,'INSERT INTO conta_corrente_flex(representante,'+
                                 'historico, credito) '+
                                 'VALUES(%d, ''%s'', %.3f) ',
                                 [qryListaRepid.AsInteger,
                                  historico,
                                  valor]);
  finally
    RestoreDecimalSeparator;
  end;
  LoadRepresentante(qryListaRepid.AsInteger);
  sendMenssageToSmatPhoneThread( qryListaRepid.asInteger, '{ped:0}','MESSAGE_PEDIDO_FATURADO');
end;

procedure TfrmGerenciamentoFlex.SpeedButton2Click(Sender: TObject);
Var historico: String;
    valor : Currency;
begin
  if not lancamentoFlex(qryListaRepnome.AsString,historico,valor) then exit;
  SetDecimalSeparator('.');
  try
  ExecSql(dbConnect.ZConnection1,'INSERT INTO conta_corrente_flex(representante,'+
                                 'historico, debito) '+
                                 'VALUES(%d, ''%s'', %.3f) ',
                                 [qryListaRepid.AsInteger,
                                  historico,
                                  valor]);

  finally
    RestoreDecimalSeparator;
  end;
  LoadRepresentante( qryListaRepid.AsInteger );
  sendMenssageToSmatPhoneThread( qryListaRepid.asInteger, '{ped:0}','MESSAGE_PEDIDO_FATURADO');
end;

procedure TfrmGerenciamentoFlex.ToolBar1DblClick(Sender: TObject);
Var title : String;
begin
  title := 'MESSAGE_BACKUP_BD';
//  title := 'MESSAGE_PEDIDO_FATURADO';
  if sendMenssageToSmatPhone( qryListaRepid.asInteger, '{ped:0}',title) then
     ShowMessage('Mensagem MESSAGE_BACKUP_BD enviada.');
end;

procedure TfrmGerenciamentoFlex.btSendMsgClick(Sender: TObject);
Var msg : String;
begin
  if not InputQuery('Mensagem','Digite a mensagem.',msg) then  exit;
  if sendMenssageToSmatPhone( qryListaRepid.asInteger, msg,'DyFar', 'com.walg.listas.Mensagem') then
     ShowMessage('Mensagem enviada.');
end;

initialization
 RegisterClass(TfrmGerenciamentoFlex);
end.

