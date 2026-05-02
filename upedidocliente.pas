unit uPedidoCliente;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DBDateTimePicker, RTTICtrls, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, ComCtrls, StdCtrls, DbCtrls, EditBtn, Buttons,
  LCLType, Menus, DBExtCtrls, ZDataset, ZSqlUpdate, ZSequence, rxdbdateedit,
  rxdbgrid, rxcurredit, rxdbcomb, rxlookup, rxmemds, RxDBGridPrintGrid,
  WAGDBNavigator, ACBrCEP, RLReport, RLParser, db, Grids, DBGrids, LMessages;

  const LM_OPEN_PEDIDO = LM_USER + 2;

type
  { TfrmPedidoCliente }
  TWagUnidadefator = class
    fator : Currency;
    preco : Currency;
  end;

  TfrmPedidoCliente = class(TForm)
    ACBrCEP1: TACBrCEP;
    btGerarContas: TSpeedButton;
    btLancarItem: TButton;
    btLancarItem1: TButton;
    Button1: TButton;
//    cbxUnidade: TComboBox;
    cbxUnidade: TComboBox;
    dsRxMemoryData1: TDataSource;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    DBDateEdit1: TDBDateEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit40: TDBEdit;
    DBEdit41: TDBEdit;
    DBMemo1: TDBMemo;
    dsCtaReceber: TDataSource;
    dsListaPedidos: TDataSource;
    dsPedidoVendaItens: TDatasource;
    dsPedidoVenda: TDatasource;
    DBNavigator1: TDBNavigator;
    edConsulta: TLabeledEdit;
    edDesconto: TCurrencyEdit;
    edDescricao: TEditButton;
    edPreco: TCurrencyEdit;
    edProduto: TEditButton;
    edQuantidade: TCurrencyEdit;
    edTotal: TCurrencyEdit;
    edTotalST: TCurrencyEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    Label1: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label2: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label3: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lbDesconto: TLabel;
    lbHideComissao: TLabel;
    lbHideDescontoAuto: TLabel;
    lbUnidade: TStaticText;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    Impressodopedido: TMenuItem;
    mnLocalizarPedido: TMenuItem;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    pnCabecalho: TRLPanel;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    qryCtaReceber: TZQuery;
    qryCtaReceberbanco_negociado: TStringField;
    qryCtaRecebercliente: TLongintField;
    qryCtaReceberconta: TLongintField;
    qryCtaReceberconta_credito: TLongintField;
    qryCtaReceberconta_debito: TLongintField;
    qryCtaReceberdataconta: TDateField;
    qryCtaReceberdata_pagamento: TDateField;
    qryCtaReceberdata_vencimento: TDateField;
    qryCtaReceberdesconto: TFloatField;
    qryCtaReceberdescricao: TStringField;
    qryCtaReceberdocumento: TStringField;
    qryCtaReceberid: TLongintField;
    qryCtaReceberid_nf: TLongintField;
    qryCtaReceberjuros: TFloatField;
    qryCtaReceberobservacao: TMemoField;
    qryCtaReceberparcela: TLongintField;
    qryCtaRecebertotal_parcelas: TLongintField;
    qryCtaRecebervalor_devido: TFloatField;
    qryCtaRecebervalor_pago: TFloatField;
    qryListaPedidoscliente: TLongintField;
    qryListaPedidoscnpj: TStringField;
    qryListaPedidosdata: TDateTimeField;
    qryListaPedidosid: TLongintField;
    qryListaPedidosnome: TStringField;
    qryListaPedidosorigem_pedido: TLongintField;
    qryListaPedidosrepresentante: TLongintField;
    qryListaPedidosscnpj: TStringField;
    qryListaPedidosstatus: TLongintField;
    qryListaPedidostotal: TFloatField;
    qryListaPedidosvorigem: TStringField;
    qryListaPedidosvrepresentante: TStringField;
    qryListaPedidosvstatus: TStringField;
    qryPedidoVendabairro: TStringField;
    qryPedidoVendacep: TStringField;
    qryPedidoVendacidade: TStringField;
    qryPedidoVendacliente: TLongintField;
    qryPedidoVendacnpj: TStringField;
    qryPedidoVendacontato: TStringField;
    qryPedidoVendacrt: TLongintField;
    qryPedidoVendadata: TDateTimeField;
    qryPedidoVendadata_faturamento: TDateField;
    qryPedidoVendaemail: TStringField;
    qryPedidoVendaendereco: TStringField;
    qryPedidoVendaforma_pgto: TStringField;
    qryPedidoVendaid: TLongintField;
    qryPedidoVendaItenscomissao: TFloatField;
    qryPedidoVendaItensdesconto: TFloatField;
    qryPedidoVendaItensdescricao: TStringField;
    qryPedidoVendaItensentregue: TBooleanField;
    qryPedidoVendaItensid: TLongintField;
    qryPedidoVendaItenslocal_estoque: TStringField;
    qryPedidoVendaItenslocal_estoque_grosso: TStringField;
    qryPedidoVendaItenslote: TLongintField;
    qryPedidoVendaItenspedido_venda: TLongintField;
    qryPedidoVendaItenspreco_unitario: TFloatField;
    qryPedidoVendaItenspreco_unitario_liq: TFloatField;
    qryPedidoVendaItensproduto: TLongintField;
    qryPedidoVendaItensquantidade: TFloatField;
    qryPedidoVendaItensquant_estoque: TFloatField;
    qryPedidoVendaItensslote: TStringField;
    qryPedidoVendaItenstotal: TFloatField;
    qryPedidoVendaItensunidade: TStringField;
    qryPedidoVendaItensvlrstTotal: TFloatField;
    qryPedidoVendaItensvlr_flex: TFloatField;
    qryPedidoVendaItensvlr_subst: TFloatField;
    qryPedidoVendanome: TStringField;
    qryPedidoVendanumero_ped_cliente: TStringField;
    qryPedidoVendanum_pedido_remoto: TLongintField;
    qryPedidoVendaobservacao: TMemoField;
    qryPedidoVendaorigem_pedido: TLongintField;
    qryPedidoVendaprazo_pgto: TStringField;
    qryPedidoVendarepresentante: TLongintField;
    qryPedidoVendastatus: TLongintField;
    qryPedidoVendatelefone1: TStringField;
    qryPedidoVendauf: TStringField;
    qryPedidoVendavrepresentante: TStringField;
    RadioGroup1: TRadioGroup;
    RLBand1: TRLBand;
    RLBand10: TRLBand;
    RLBand11: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    RLBand6: TRLBand;
    RLBand7: TRLBand;
    RLBand8: TRLBand;
    RLBand9: TRLBand;
    RLDBMemo1: TRLDBMemo;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
    RLDBText1: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLDBText17: TRLDBText;
    RLDBText18: TRLDBText;
    RLDBText21: TRLDBText;
    RLDBText22: TRLDBText;
    RLDBText23: TRLDBText;
    RLDBText24: TRLDBText;
    RLDBText25: TRLDBText;
    RLDBText26: TRLDBText;
    RLDBText27: TRLDBText;
    RLDBText28: TRLDBText;
    RLDBText29: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText30: TRLDBText;
    RLDBText32: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDraw1: TRLDraw;
    RLDraw10: TRLDraw;
    RLDraw11: TRLDraw;
    RLDraw12: TRLDraw;
    RLDraw13: TRLDraw;
    RLDraw14: TRLDraw;
    RLDraw15: TRLDraw;
    RLDraw16: TRLDraw;
    RLDraw17: TRLDraw;
    RLDraw18: TRLDraw;
    RLDraw19: TRLDraw;
    RLDraw2: TRLDraw;
    RLDraw20: TRLDraw;
    RLDraw21: TRLDraw;
    RLDraw22: TRLDraw;
    RLDraw3: TRLDraw;
    RLDraw4: TRLDraw;
    RLDraw5: TRLDraw;
    RLDraw6: TRLDraw;
    RLDraw7: TRLDraw;
    RLDraw8: TRLDraw;
    RLDraw9: TRLDraw;
    RLExpressionParser1: TRLExpressionParser;
    RLImage1: TRLImage;
    RLLabel1: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLLabel25: TRLLabel;
    RLLabel26: TRLLabel;
    RLLabel27: TRLLabel;
    RLLabel28: TRLLabel;
    RLLabel29: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel30: TRLLabel;
    RLLabel31: TRLLabel;
    RLLabel32: TRLLabel;
    RLLabel33: TRLLabel;
    RLLabel34: TRLLabel;
    RLLabel35: TRLLabel;
    RLLabel36: TRLLabel;
    RLLabel37: TRLLabel;
    RLLabel38: TRLLabel;
    RLLabel39: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel40: TRLLabel;
    RLLabel41: TRLLabel;
    RLLabel42: TRLLabel;
    RLLabel43: TRLLabel;
    RLLabel44: TRLLabel;
    RLLabel45: TRLLabel;
    RLLabel46: TRLLabel;
    RLLabel47: TRLLabel;
    RLLabel48: TRLLabel;
    RLLabel49: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel50: TRLLabel;
    RLLabel51: TRLLabel;
    RLLabel52: TRLLabel;
    RLLabel53: TRLLabel;
    RLLabel54: TRLLabel;
    RLLabel55: TRLLabel;
    RLLabel56: TRLLabel;
    RLLabel57: TRLLabel;
    RLLabel58: TRLLabel;
    RLLabel59: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel60: TRLLabel;
    RLLabel61: TRLLabel;
    RLLabel62: TRLLabel;
    RLLabel63: TRLLabel;
    RLLabel64: TRLLabel;
    RLLabel65: TRLLabel;
    RLLabel66: TRLLabel;
    RLLabel67: TRLLabel;
    RLLabel68: TRLLabel;
    RLLabel69: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel70: TRLLabel;
    RLLabel71: TRLLabel;
    lbCondicao: TRLLabel;
    RLLabel72: TRLLabel;
    RLLabel73: TRLLabel;
    RLLabel74: TRLLabel;
    RLLabel75: TRLLabel;
    RLLabel76: TRLLabel;
    RLLabel77: TRLLabel;
    RLLabel78: TRLLabel;
    RLLabel79: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel80: TRLLabel;
    RLLabel81: TRLLabel;
    RLLabel82: TRLLabel;
    RLLabel83: TRLLabel;
    RLLabel84: TRLLabel;
    RLLabel85: TRLLabel;
    RLLabel9: TRLLabel;
    RLPanel1: TRLPanel;
    RLPanel2: TRLPanel;
    RLPanel3: TRLPanel;
    RLPanel4: TRLPanel;
    RLPanel5: TRLPanel;
    RLPanel8: TRLPanel;
    RLPanel9: TRLPanel;
    RLReport1: TRLReport;
    RLReport2: TRLReport;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RxDBComboBox1: TRxDBComboBox;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    RxMemoryData1: TRxMemoryData;
    RxMemoryData1comissao: TFloatField;
    RxMemoryData1desconto: TFloatField;
    RxMemoryData1descricao: TStringField;
    RxMemoryData1entregue: TBooleanField;
    RxMemoryData1id: TLongintField;
    RxMemoryData1local_estoque: TStringField;
    RxMemoryData1local_estoque_grosso: TStringField;
    RxMemoryData1lote: TLongintField;
    RxMemoryData1pedido_venda: TLongintField;
    RxMemoryData1preco_unitario: TFloatField;
    RxMemoryData1produto: TLongintField;
    RxMemoryData1quantidade: TFloatField;
    RxMemoryData1quant_estoque: TFloatField;
    RxMemoryData1slote: TStringField;
    RxMemoryData1total: TFloatField;
    RxMemoryData1unidade: TStringField;
    RxMemoryData1vlr_flex: TFloatField;
    RxMemoryData1vlr_subst: TFloatField;
    ScrollBox1: TScrollBox;
    ScrollBox2: TScrollBox;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    btDelete: TToolButton;
    qryPedidoVenda: TZQuery;
    qryPedidoVendaItens: TZQuery;
    updPedidoVendaItens: TZUpdateSQL;
    qryListaPedidos: TZQuery;
    updPedidoVenda: TZUpdateSQL;
    ZSequence1: TZSequence;
    ZSequence2: TZSequence;
    procedure btGerarContasClick(Sender: TObject);
    procedure btLancarItem1Click(Sender: TObject);
    procedure btLancarItemClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cbxUnidadeCloseUp(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TDBNavButtonType);
    procedure edDescontoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edDescricaoButtonClick(Sender: TObject);
    procedure edconsultaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edPrecoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure edProdutoButtonClick(Sender: TObject);
    procedure edProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edQuantidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure ImpressodopedidoClick(Sender: TObject);
    procedure mnLocalizarPedidoClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure qryListaPedidosCalcFields(DataSet: TDataSet);
    procedure qryPedidoVendaItensAfterDelete(DataSet: TDataSet);
    procedure qryPedidoVendaItensAfterPost(DataSet: TDataSet);
    procedure qryPedidoVendaItensCalcFields(DataSet: TDataSet);
    procedure qryPedidoVendaNewRecord(DataSet: TDataSet);
    procedure RadioGroup1SelectionChanged(Sender: TObject);
    procedure RLBand10BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLDBText17BeforePrint(Sender: TObject; var Texts: string;
      var PrintIt: Boolean);
    procedure RLDBText29BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLDBText30BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RxDBGrid1GetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure btDeleteClick(Sender: TObject);
    procedure WMOpenPedido(var Message : TLMessage); message LM_OPEN_PEDIDO;
  private
    procedure DevolverTudoParaEstoque(const historico: String);
    function GerarContasReceber: Boolean;
//    function CalcularST(const produto, uf: String; const preco, desconto: Double): Double;
    { private declarations }
    procedure openPedido( id : Integer);
    procedure SetCliente(const id: String);
    function  somaPedido:Double;
    procedure loadProduto( produto : String);
    procedure OpenListaDePedidos;
    procedure updateComboboxUnidade(produto : String; preco : Currency);
  public
    { public declarations }
    procedure ExternOpenPedido( pedido : Integer);
  end;

const  ORIG_PEDIDO_LOJA       = 0;
       ORIG_PEDIDO_SMARTFONE  = 1;
       ORIG_PEDIDO_WEB        = 2;

const  STATUS_PEDIDO_PENDENTE = 0;
       STATUS_PEDIDO_NOTA     = 1;
       STATUS_PEDIDO_CANCELADO= 2;



var
  frmPedidoCliente: TfrmPedidoCliente;

implementation

{$R *.lfm}

Uses udbConnect, sistema_config, uGerarCtaReceber, WagVclUtils, TDIPageControl,
  uSearch, BDSqlUtils, ACBrUtil, maskutils, math, ZAbstractRODataset, DateUtils,
  StrUtils;


function PedidoStatus2Str( status : Integer):String;
begin
  case status of
     STATUS_PEDIDO_PENDENTE  : Result := 'Pendente';
     STATUS_PEDIDO_NOTA      : Result := 'Nota Fiscal';
     STATUS_PEDIDO_CANCELADO : Result := 'Cancelado';
  end;
end;

function PedidoOrigem2Str( origem : Integer):String;
begin
  case origem of
     ORIG_PEDIDO_LOJA     : Result := 'Loja';
     ORIG_PEDIDO_SMARTFONE: Result := 'SmartPhone';
     ORIG_PEDIDO_WEB      : Result := 'Internet';
  end;
end;

{ TfrmPedidoCliente }

procedure TfrmPedidoCliente.DevolverTudoParaEstoque(const historico : String);
begin
  qryPedidoVendaItens.First;
  While Not qryPedidoVendaItens.Eof do begin
    if qryPedidoVendaItensquantidade.AsCurrency > 0 then begin
      DevolverEstoque(qryPedidoVendaItenslote.AsInteger,qryPedidoVendaItensquant_estoque.AsCurrency);
      GerarHistoricoMovimento(qryPedidoVendaItenspedido_venda.AsInteger,
                              qryPedidoVendaItensproduto.AsInteger,
                              qryPedidoVendaItenslote.AsInteger,1,
                              OM_PEDIDO,historico,qryPedidoVendaItensquant_estoque.AsCurrency,0);
    end;
    qryPedidoVendaItens.Next;
  end;
end;


procedure TfrmPedidoCliente.ToolButton2Click(Sender: TObject);
begin
   ClosePageThisForm(Self);
end;

procedure TfrmPedidoCliente.btDeleteClick(Sender: TObject);
begin
  if MessageDlg('Você quer deletar o pedido '+qryPedidoVendaid.AsString+' agora ?',mtConfirmation,[mbNo,mbYes],0) <> mrYes then Exit;

  if MessageDlg('Devolver os itens deste pedido para o estoque ?',mtConfirmation,[mbNo,mbYes],0) = mrYes then Begin
    DevolverTudoParaEstoque('Cancelamento Pedido');
  end;
  qryPedidoVenda.Delete;
  openPedido(0);
  PageControl1.ActivePageIndex:= 0;

end;

procedure TfrmPedidoCliente.WMOpenPedido(var Message: TLMessage);
begin
  ShowMessage('open');
end;

procedure TfrmPedidoCliente.openPedido(id: Integer);
begin
  qryPedidoVenda.Close;
  qryPedidoVenda.ParamByName('id').AsInteger := id;
  OpenTable( qryPedidoVenda );
  qryPedidoVendaItens.Close;
  qryPedidoVendaItens.ParamByName('id').AsInteger := id;
  OpenTable( qryPedidoVendaItens );
  edTotal.Value := somaPedido;
end;

function TfrmPedidoCliente.somaPedido: Double;
begin
   qryPedidoVendaItens.First;
   Result := 0;
   edTotalST.Value := 0.00;
   while not qryPedidoVendaItens.Eof do
   begin
      if qryPedidoVendaItenstotal.AsCurrency > 0 then begin
        Result := Result + qryPedidoVendaItenstotal.AsCurrency;
        edTotalST.Value  := edTotalST.Value + qryPedidoVendaItensvlrstTotal.AsCurrency;//(qryPedidoVendaItensvlr_subst.AsCurrency*qryPedidoVendaItensquantidade.AsCurrency);
      end;
      qryPedidoVendaItens.Next;
   end;
   qryPedidoVendaItens.First;
   edTotal.Value  := Result;
end;

procedure TfrmPedidoCliente.loadProduto(produto: String);
Var sResult,sql, sTabPreco : String;
    iTabPreco : Integer;
    qry : TZQuery;
begin
   if Not ClientePodeAdquirir(qryPedidoVendacliente.AsString, produto) then
      Raise Exception.Create('Este cliente não pode adquirir este tipo de produto.');
   iTabPreco := StrToIntDef(ExecSql(dbConnect.ZConnection1,'Select coalesce(tabela_preco,2) From clientes Where id=%d',[qryPedidoVendacliente.AsInteger]),1);
   case iTabPreco of
      1 : sTabPreco := 'preco_venda_varejo';
      2 : sTabPreco := 'preco_venda_atacado';
      3 : sTabPreco := 'preco_venda_consignado';
   end;
{
   iTabPreco := StrToIntDef(ExecSql(dbConnect.ZConnection1,'Select coalesce(tabela_preco,2) From clientes Where id=%d',[qryPedidoVendacliente.AsInteger]),1);
   case iTabPreco of
      1 : sTabPreco := 'margem_lucro_varejo';
      2 : sTabPreco := 'margem_lucro_atacado';
      3 : sTabPreco := 'margem_lucro_consignado';
   end;

sql := Format('Select id,descricao, (preco_compra + (preco_compra * %s /100))::numeric(10,2) ,unidade, '+
              '(SELECT sum(quantidade) FROM produtos_estoque Where quantidade > 0 and produto=p.id) as quantidade '+
              'From produtos p '+
              'Where id=%s and ativo=true',
              [sTabPreco,produto]);
}
   sql := Format('Select id,descricao, %s as preco ,unidade, comissao,desconto_automatico, '+
                 '(SELECT sum(quantidade) FROM produtos_estoque Where quantidade > 0 and produto=p.id) as quantidade, '+
                 'desconto_ate ' +
                 'From produtos p '+
                 'Where id=%s and ativo=true',
                 [sTabPreco,produto]);
   qry := ExecSqlQuery(dbConnect.ZConnection1,sql);
   {cbxUnidade}
   updateComboboxUnidade( edProduto.Text,qry.FieldByName('preco').AsCurrency );
   edProduto.Text    := produto;
   //sResult           := ExecSqlResultListaEx(dbConnect.ZConnection1,sql,False,';');
   edDescricao.Text  := qry.FieldByName('descricao').AsString;//  ExtractWord(2,sResult,[';']);
   edQuantidade.Value:= 1;
   edPreco.Value     := qry.FieldByName('preco').AsCurrency;//StrToFloatDef(ExtractWord(3,sResult,[';']),0);
   Label11.Caption   := qry.FieldByName('quantidade').AsString;//ExtractWord(5,sResult,[';']);
   lbDesconto.Caption:= 'Desc. ' + FormatCurr('0.## %',qry.FieldByName('desconto_ate').AsCurrency);
   edDesconto.Value  :=  0.00;
   if qry.FieldByName('desconto_automatico').AsBoolean then begin
     edDesconto.Value  := qry.FieldByName('desconto_ate').AsCurrency;
   end;
   lbHideComissao.Caption := FormatMoney(qry.FieldByName('comissao').AsCurrency);
   lbHideDescontoAuto.Caption :=  BooleanToStr(qry.FieldByName('desconto_automatico').AsBoolean);
   edQuantidade.SetFocus;
end;

procedure TfrmPedidoCliente.OpenListaDePedidos;
Var sql, where : String;
begin
   StartWait;
   try
      if RadioGroup1.ItemIndex = 0 then begin
        {Lista de pedidos pendentes}
        where := 'pv.status=0 ';
      end;
      if (RadioGroup1.ItemIndex = 1) and (Length(edconsulta.Text) > 0) then begin
        {Lista de pedidos Consulta}
        where := Format('pv.id in (%s) ',[edconsulta.Text]);
      end;
      if (RadioGroup1.ItemIndex = 1) and (Length(edconsulta.Text) <= 0) then begin
        {Consulta de pedidos por data}
        where := FormatSqlDateCond('pv.data',DateEdit1.Date,DateEdit2.Date) ;//Format('pv.id in (%s) ',[edconsulta.Text]);
      end;

      sql := 'SELECT pv.id, pv.data, cliente, c.nome, cnpj, pv.origem_pedido, pv.status, pv.representante, ';
      sql += 'e.nome as vrepresentante, ';
      sql += 'coalesce((Select sum(preco_unitario*quantidade - (preco_unitario*quantidade * desconto/100)+vlr_subst*quantidade) from pedido_venda_itens i Where i.pedido_venda=pv.id),0.00) as total ';
      sql += 'FROM pedido_venda pv ';
      sql += 'left join clientes c on c.id=pv.cliente ';
      sql += 'left join empregados e on e.id=pv.representante ';
      sql += 'Where ' + where + ' ';
      sql += 'Order by data ';
      qryListaPedidos.Close;
      qryListaPedidos.SQL.clear;
      qryListaPedidos.sql.Text:= sql;
      OpenTable( qryListaPedidos );
      openPedido(0);
   finally
     StopWait;
   end;
end;

procedure TfrmPedidoCliente.updateComboboxUnidade(produto: String;
  preco: Currency);
var qry : TZQuery;
    WagUnidadefator : TWagUnidadefator;
begin
  qry := ExecSqlQuery(dbConnect.ZConnection1,'Select nome,fator From ('+
                                                  'Select 1 as i,unidade as nome,fator From produto_unidade Where produto=%s '+
                                                  'Union '+
                                                  'Select 0 as i,unidade,1 From produtos Where id=%s '+
                                                  'Order by i) as tab',[produto,produto]);
  cbxUnidade.Items.Clear;
  while not qry.eof do begin
     WagUnidadefator := TWagUnidadefator.Create;
     WagUnidadefator.fator:= qry.FieldByName('fator').AsCurrency;
     WagUnidadefator.preco:= preco;
     cbxUnidade.AddItem(qry.FieldByName('nome').AsString,WagUnidadefator);
     qry.Next;
  end;
  cbxUnidade.ItemIndex:= 0;
end;

procedure TfrmPedidoCliente.ExternOpenPedido(pedido: Integer);
begin
  StartWaitSql;
  try
    openPedido(pedido);
    PageControl1.ActivePageIndex:= 1;
    CenterControl(GroupBox1);
  finally
    StopWaitSql;
  end;
end;

procedure TfrmPedidoCliente.FormCreate(Sender: TObject);
begin
   dbConnect.setImageForDBNavigator(dbnavigator1);
   OpenListaDePedidos;
end;

procedure TfrmPedidoCliente.DBNavigator1Click(Sender: TObject;
  Button: TDBNavButtonType);
var ret : Variant;
begin
  if Button = nbInsert then begin
     ret:= ShowSearchModal(dbConnect.ZConnection1,'clientes','id,nome,fantasia,cnpj','id,nome','fantasia',true);
     if VarIsBlank(ret) then begin
        qryPedidoVenda.Cancel;
        Abort;
     end;
     SetCliente( ret[0] );
     qryPedidoVendadata.AsDateTime:= Now();
     PageControl1.ActivePageIndex := 1;
  end;
end;

procedure TfrmPedidoCliente.SetCliente( const id : String);
var
  qCli: TZQuery;
Begin
     qCli := ExecSqlQuery(dbConnect.ZConnection1,'Select nome,uf, email, telefone1, contato, '+
                                                 'prazo_pagamento '+
                                                 'from clientes Where id=%s',
                                                 [id]);
     qryPedidoVendacliente.Asstring       := id;
     qryPedidoVendanome.Asstring          := qCli.FieldByName('nome').AsString;
     qryPedidoVendauf.Asstring            := qCli.FieldByName('uf').AsString;
     qryPedidoVendaemail.Asstring         := qCli.FieldByName('email').AsString;
     qryPedidoVendatelefone1.Asstring     := qCli.FieldByName('telefone1').AsString;
     qryPedidoVendacontato.Asstring       := qCli.FieldByName('contato').AsString;
     qryPedidoVendaforma_pgto.AsString    := 'BOLETO ITAU';//qCli.FieldByName('forma_pgto').AsString;
     qryPedidoVendaprazo_pgto.AsString    := qCli.FieldByName('prazo_pagamento').AsString;
     qryPedidoVendarepresentante.AsString := ExecSql(dbConnect.ZConnection1,'Select representante From cliente_representante Where cliente=%s Order by data_cadastro Limit 1',[id]);
end;

procedure TfrmPedidoCliente.SpeedButton1Click(Sender: TObject);
var ret : Variant;
begin
   ret:= ShowSearchModal(dbConnect.ZConnection1,'clientes','id,nome','id,nome','nome',true);
   if VarIsBlank(ret) then begin
      qryPedidoVenda.Cancel;
      Abort;
   end;
   EditTable(qryPedidoVenda);
   SetCliente( ret[0] );
end;


procedure TfrmPedidoCliente.edDescontoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then begin
     edPreco.SetFocus;
  end;
end;

procedure TfrmPedidoCliente.edDescricaoButtonClick(Sender: TObject);
var ret : Variant;
begin
  //select * from produtos_select where ativo=true
    ret:= ShowSearchModal(dbConnect.ZConnection1,'produtos_select','id,descricao,quantidade','id,descricao,quantidade','descricao',true,'ativo=true');
    if VarIsBlank(ret) then exit;
    edProduto.Text   := ret[0];
    edDescricao.Text := ret[1];
    loadProduto(edProduto.Text);
    edQuantidade.Value:= 1;
    Label11.caption   := ret[2];
    edQuantidade.SetFocus;
end;

procedure TfrmPedidoCliente.edconsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
     OpenListaDePedidos;
end;

procedure TfrmPedidoCliente.edPrecoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then begin
     btLancarItem.SetFocus;
  end;
end;

procedure TfrmPedidoCliente.edProdutoButtonClick(Sender: TObject);
var ret : Variant;
begin
  //select * from produtos_select where ativo=true
    ret:= ShowSearchModal(dbConnect.ZConnection1,'produtos_select','id,descricao,quantidade','id,descricao,quantidade','descricao',true,'ativo=true');
    if VarIsBlank(ret) then exit;
    edProduto.Text   := ret[0];
    edDescricao.Text := ret[1];
    loadProduto(edProduto.Text);
    edQuantidade.Value:= 1;
    edDesconto.Value  := 0;
    Label11.caption   := ret[2];
    edQuantidade.SetFocus;
end;

procedure TfrmPedidoCliente.edProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then begin
     loadProduto(edProduto.Text);
  end;
end;

procedure TfrmPedidoCliente.edQuantidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then begin
     edDesconto.SetFocus;
  end;
end;

procedure TfrmPedidoCliente.btLancarItemClick(Sender: TObject);
Var lotes : TStringList;
    i, idlote : Integer;
    quant,bcst, qfator : Double;
    linha : String;
begin
  PostTable(qryPedidoVenda);
  try
      qfator:= StrtoFloatDef(ExecSql(dbConnect.ZConnection1 ,'Select fator From produto_unidade Where produto=%s and unidade ilike ''%s''',[edProduto.Text, cbxUnidade.Text]),1);
      lotes := obtemProdutoPorLote( edProduto.Text, edQuantidade.Value * qfator );
      for i := 0 to lotes.Count-1 do begin
        linha := lotes[i];
        idlote:= StrToInt(  ExtractWord(POR_LOTE_ID   ,linha,[';']));
        quant := StrToFloat(ExtractWord(POR_LOTE_QUANT,linha,[';']));

        qryPedidoVendaItens.Append;
        qryPedidoVendaItenspedido_venda.AsInteger    := qryPedidoVendaid.AsInteger;
        qryPedidoVendaItensproduto.AsString          := edProduto.Text;
        qryPedidoVendaItensdescricao.AsString        := edDescricao.Text;
        qryPedidoVendaItensquantidade.AsCurrency     := quant/qfator;// edQuantidade.Value;
        qryPedidoVendaItensquant_estoque.AsCurrency  := quant;//edQuantidade.Value;
        qryPedidoVendaItensentregue.AsBoolean        := False;
        qryPedidoVendaItenslote.AsInteger            := idlote;
        qryPedidoVendaItensunidade.AsString          := cbxUnidade.Text;

        qryPedidoVendaItenspreco_unitario.AsCurrency := edPreco.Value - CalculaPerc(edDesconto.Value,edPreco.Value);
        qryPedidoVendaItenspreco_unitario.AsCurrency := qryPedidoVendaItenspreco_unitario.AsCurrency;
        qryPedidoVendaItensdesconto.AsCurrency       := 0.00;//edDesconto.Value;
        qryPedidoVendaItensvlr_subst.AsCurrency      := 0.00;
        {Se crt do cliente}
        if qryPedidoVendacrt.AsInteger > 0 then begin
          qryPedidoVendaItensvlr_subst.AsCurrency      := CalcularST(qryPedidoVendaItensproduto.AsString,//edProduto.Text,
                                                                     qryPedidoVendauf.AsString,
                                                                     (qryPedidoVendacrt.AsInteger = 1),
                                                                     qryPedidoVendaItenspreco_unitario.AsCurrency,//edPreco.Value,
                                                                     qryPedidoVendaItensdesconto.AsCurrency,
                                                                     bcst);
        end;

        qryPedidoVendaItenscomissao.AsCurrency       := StrToCurrDef(lbHideComissao.Caption,0.00);

        PostTable(qryPedidoVendaItens);

        BaixarEstoque(idlote, qryPedidoVendaItensquant_estoque.AsCurrency );
        GerarHistoricoMovimento(qryPedidoVendaid.AsInteger,
                                qryPedidoVendaItensproduto.AsInteger,
                                idlote,1,
                                OM_PEDIDO,
                                qryPedidoVendanome.AsString,
                                0, quant);
      end;
      if lotes.Count = 0 then
         Raise Exception.Create('Não há estoque para atender o pedido.');
      edProduto.Text    := '';
      edDescricao.Text  := '';
      edQuantidade.Value:= 1;
      edDesconto.Value  := 0;
      edPreco.Value     := 0;
      edProduto.SetFocus;
      RefreshTable( qryPedidoVendaItens );
  finally
  end;
end;

procedure TfrmPedidoCliente.Button1Click(Sender: TObject);
begin
  RadioGroup1SelectionChanged(Sender);
end;

procedure TfrmPedidoCliente.cbxUnidadeCloseUp(Sender: TObject);
begin
   edPreco.Value := TWagUnidadefator(cbxUnidade.Items.Objects[cbxUnidade.ItemIndex]).fator *
                    TWagUnidadefator(cbxUnidade.Items.Objects[cbxUnidade.ItemIndex]).preco;
end;

procedure TfrmPedidoCliente.FormResize(Sender: TObject);
begin
  CenterControl(GroupBox1);
  CenterControl(GroupBox5);
end;

procedure TfrmPedidoCliente.MenuItem1Click(Sender: TObject);
Var qry : TZQuery;
begin
  StartWait;
  try
    if PageControl1.ActivePageIndex = 0 then
       openPedido( qryListaPedidosid.AsInteger );
    qry := ExecSqlQuery(dbConnect.ZConnection1,'Select * From empresa Where id=%s',[getEmpresaPadrao]);
    RLLabel1.Caption  := qry.FieldByName('nome').AsString;
    RLLabel3.Caption  := qry.FieldByName('logradouro').AsString +' , ' + qry.FieldByName('numero').AsString;
    RLLabel7.Caption  := qry.FieldByName('cidade').AsString +' - ' + qry.FieldByName('uf').AsString + ' CEP '+qry.FieldByName('cep').AsString;
    RLLabel8.Caption  := 'Tel.: ' + qry.FieldByName('fone').AsString;
    RLLabel4.Caption  := 'CNPJ : '+ qry.FieldByName('cnpj').AsString + '    Insc. Estadual.: ' + qry.FieldByName('ie').AsString;
    RLLabel6.Caption  := Format('%.6d',[qryPedidoVendaid.AsInteger]);
    RLBand4.Enabled   := False;
    RLLabel23.Caption := qry.FieldByName('nome').AsString;
    RLLabel22.Caption := Format('Nº Pedido.: %.6d',[qryPedidoVendaid.AsInteger]);
    RLLabel10.Caption := FormatDateTime('dddd, dd "de" mmmm "de" yyyy',qryPedidoVendadata.AsDateTime);
    RLReport1.Title   := Format('pd_vendaa_%.6d',[qryPedidoVendaid.AsInteger]);
    dbConnect.ConfigReport(RLReport1);
    qryPedidoVendaItens.SortedFields := 'local_estoque';
    qryPedidoVendaItens.SortType     := stAscending;
    StopWait;
    RLReport1.PreviewModal;
    qryPedidoVendaItens.SortedFields := 'id';
    qryPedidoVendaItens.SortType     := stDescending;
  finally
    StopWait;
  end;
end;

procedure TfrmPedidoCliente.ImpressodopedidoClick(Sender: TObject);
Var qry : TZQuery;
  i: Integer;
  id: LongInt;
begin
  StartWait;
  try
    if qryPedidoVendaid.IsNull then
       Raise exception.Create('Voce tem que salvar o pedido para pode imprimi-lo.');
    id := qryPedidoVendaid.AsInteger;
    PostTable(qryPedidoVenda);
    openPedido( id );
    //if PageControl1.ActivePageIndex = 0 then
    //   openPedido( qryListaPedidosid.AsInteger )
    //else
    //   RefreshTable( qryPedidoVenda );

    qry := ExecSqlQuery(dbConnect.ZConnection1,'Select * From empresa Where id=%s',[getEmpresaPadrao]);
    RLLabel64.Caption := FormatMaskText(MASK_CNPJ ,qry.FieldByName('cnpj').AsString);
    RLLabel65.Caption := qry.FieldByName('ie').AsString;
    RLLabel66.Caption := qry.FieldByName('logradouro').AsString +' , ' + qry.FieldByName('numero').AsString;
    RLLabel67.Caption := qry.FieldByName('bairro').AsString;
    RLLabel68.Caption := qry.FieldByName('cidade').AsString;
    RLLabel69.Caption := FormatMaskText('00000\-009;0;',qry.FieldByName('cep').AsString);
    RLLabel70.Caption := FormatMaskText('\(00\) 0000\-0009;0;',qry.FieldByName('fone').AsString)+' (41) 3024-4838';
    RLLabel71.Caption := qry.FieldByName('smtpusuario').AsString+' - '+qry.FieldByName('webpage').AsString;

    RLLabel6.Caption  := Format('%.6d',[qryPedidoVendaid.AsInteger]);
    RLBand4.Enabled   := False;
    RLLabel23.Caption := qry.FieldByName('nome').AsString;
    RLLabel22.Caption := Format('Nº Pedido.: %.6d',[qryPedidoVendaid.AsInteger]);
    RLLabel10.Caption := FormatDateTime('dddd, dd "de" mmmm "de" yyyy',qryPedidoVendadata.AsDateTime);
    RLReport1.Title   := Format('pd_vendaa_%.6d',[qryPedidoVendaid.AsInteger]);
    lbCondicao.Caption:= qryPedidoVendaprazo_pgto.AsString;
    RLLabel13.Caption := FormatDateTime('dd/mm/yyyy',qryPedidoVendadata.AsDateTime);
    //DateToStr( obtemDataFromCondicao( qryPedidoVendaprazo_pgto.AsString , qryPedidoVendadata.AsDateTime ));

    RLLabel85.Caption := 'RECEBEBOS DE '+qry.FieldByName('nome').AsString+' OS PRODUTOS DO PEDIDO INDICADO AO LADO';
    dbConnect.ConfigReport(RLReport1);
    qryPedidoVendaItens.SortedFields := 'local_estoque';
    qryPedidoVendaItens.SortType     := stAscending;
    qryPedidoVendaItens.First;
    RxMemoryData1.EmptyTable;
    RxMemoryData1.LoadFromDataSet(qryPedidoVendaItens,qryPedidoVendaItens.RecordCount,lmAppend);
    for i := 1 to 10 - qryPedidoVendaItens.RecordCount do
    begin
       RxMemoryData1.Append;
       RxMemoryData1.Post;
    end;
    StopWait;
    RLReport2.PreviewModal;
    qryPedidoVendaItens.SortedFields := 'id';
    qryPedidoVendaItens.SortType     := stDescending;
  finally
    StopWait;
  end;
end;

procedure TfrmPedidoCliente.mnLocalizarPedidoClick(Sender: TObject);
var ret : Variant;
    sql : String;
begin
   sql := 'Select pv.id,cliente,c.nome from pedido_venda pv '+
          'Left Join clientes c on c.id=pv.cliente '+
          'Order by c.nome ';
   ret:= ShowSearchModalSQL(dbConnect.ZConnection1,sql,'id,nome','id','nome', false);
   if VarIsBlank(ret) then exit;
   StartWaitSql;
   try
     openPedido(ret);
     PageControl1.ActivePageIndex:= 1;
   finally
     StopWaitSql;
   end;
end;

procedure TfrmPedidoCliente.PageControl1Change(Sender: TObject);
begin
   FormResize(nil);
   btDelete.Enabled:= PageControl1.ActivePageIndex = 1;
   if PageControl1.ActivePageIndex = 0 then
      Button1.Click;
end;

procedure TfrmPedidoCliente.qryListaPedidosCalcFields(DataSet: TDataSet);
Var txt : String;
begin
  qryListaPedidosvstatus.AsString := PedidoStatus2Str(qryListaPedidosstatus.AsInteger);
  qryListaPedidosvorigem.AsString := PedidoOrigem2Str(qryListaPedidosorigem_pedido.AsInteger);

  //txt := DelCharss(qryListaPedidoscnpj.AsString,'./-');
  qryListaPedidosscnpj.AsString := OnlyNumber(qryListaPedidoscnpj.AsString);
  if length(txt) = 11 then
      qryListaPedidosscnpj.AsString := FormatMaskText('000\.000\.000\-00;0;',txt);
  if length(txt) = 14 then
      qryListaPedidosscnpj.AsString := FormatMaskText('00\.000\.000\/0000\-00;0;',txt);

end;

procedure TfrmPedidoCliente.qryPedidoVendaItensAfterDelete(DataSet: TDataSet);
begin
  edTotal.Value := somaPedido;
end;

procedure TfrmPedidoCliente.qryPedidoVendaItensAfterPost(DataSet: TDataSet);
begin
  edTotal.Value := somaPedido;
end;

procedure TfrmPedidoCliente.qryPedidoVendaItensCalcFields(DataSet: TDataSet);
begin
  qryPedidoVendaItenspreco_unitario_liq.AsCurrency := qryPedidoVendaItenspreco_unitario.AsCurrency - (qryPedidoVendaItenspreco_unitario.AsCurrency * qryPedidoVendaItensdesconto.AsCurrency / 100);
  if qryPedidoVendaItensquantidade.AsCurrency < 0 then begin
    qryPedidoVendaItensvlrstTotal.AsCurrency         := 0.00;
    qryPedidoVendaItenstotal.AsCurrency              := 0.00;
  end else begin
    qryPedidoVendaItensvlrstTotal.AsCurrency         := qryPedidoVendaItensvlr_subst.AsCurrency * qryPedidoVendaItensquantidade.AsCurrency;
    qryPedidoVendaItenstotal.AsCurrency              := (qryPedidoVendaItenspreco_unitario_liq.AsCurrency * qryPedidoVendaItensquantidade.AsCurrency) +
                                                      qryPedidoVendaItensvlrstTotal.AsCurrency;
  end;

end;

procedure TfrmPedidoCliente.qryPedidoVendaNewRecord(DataSet: TDataSet);
begin
  qryPedidoVendaorigem_pedido.AsInteger:= ORIG_PEDIDO_LOJA;
  qryPedidoVendastatus.AsInteger       := STATUS_PEDIDO_PENDENTE;
  qryPedidoVendadata.AsDateTime        := Now();
  qryPedidoVendanumero_ped_cliente.AsString := '';
end;

procedure TfrmPedidoCliente.RadioGroup1SelectionChanged(Sender: TObject);
begin
   StartWait;
   try
     Panel2.Visible:= RadioGroup1.ItemIndex=1;
     if RadioGroup1.ItemIndex = 0 then
        OpenListaDePedidos
     else begin
        if (DateEdit1.Date <> NullDate) and (DateEdit2.Date <> NullDate) then
           OpenListaDePedidos
        else
           edconsulta.SetFocus;
     end;
   finally
     StopWait;
   end;
end;

procedure TfrmPedidoCliente.RLBand10BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
Var qryCta : TZQuery;
  idx: Integer;
begin
  RLLabel73.Caption := '';
  RLLabel75.Caption := '';
  RLLabel77.Caption := '';
  RLLabel79.Caption := '';
  RLLabel81.Caption := '';

  RLLabel72.Caption := '';
  RLLabel74.Caption := '';
  RLLabel76.Caption := '';
  RLLabel78.Caption := '';
  RLLabel80.Caption := '';
  qryCta:= ExecSqlQuery(dbConnect.ZConnection1,'Select * from contas_receber Where origem=''PEDIDO'' and id_nf=%d',[qryPedidoVendaid.AsInteger]);
  idx := 72;
  While not qryCta.Eof do
  begin
    TRLLabel( FindComponent(Format('RLLabel%d',[idx])) ).Caption := Format('%dº Parcela %s',[qryCta.FieldByName('parcela').AsInteger,qryCta.FieldByName('data_vencimento').AsString]);
    //TRLLabel( FindComponent(Format('RLLabel%d',[idx])) ).Caption := qryCta.FieldByName('data_vencimento').AsString;
    inc(idx);
//    TRLLabel( FindComponent(Format('RLLabel%d',[idx])) ).Caption := Format('R$ %.2f %s',[qryCta.FieldByName('valor_devido').AsCurrency,qryCta.FieldByName('data_vencimento').AsString]);
    TRLLabel( FindComponent(Format('RLLabel%d',[idx])) ).Caption := Format('R$ %.2f ',[qryCta.FieldByName('valor_devido').AsCurrency]);
    inc(idx);
    qryCta.Next;
  end;

end;

procedure TfrmPedidoCliente.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
   PrintIt := True;
   RLBand2.Color:= clWhite;
   if qryPedidoVendaItens.RecNo mod 2 >0 then
      RLBand2.Color:= clSilver;
end;

procedure TfrmPedidoCliente.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel35.caption := 'Quantidade de itens unicos.: '+
  ExecSql(dbConnect.ZConnection1,'Select count(*) From (Select produto,count(*) '+
                                 'From pedido_venda_itens '+
                                 'Where pedido_venda=%d '+
                                 'Group by produto) as tab',
                                 [qryPedidoVendaid.AsInteger]);
end;

procedure TfrmPedidoCliente.RLDBText17BeforePrint(Sender: TObject;
  var Texts: string; var PrintIt: Boolean);
begin
  //if Length(Texts) > 0 then
     //Texts := FormatMaskText('\(00\) 0000\-0009;0;', Texts)
end;

procedure TfrmPedidoCliente.RLDBText29BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  AText := IfThen(AText = '0,00','',AText);
end;

procedure TfrmPedidoCliente.RLDBText30BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  AText := IfThen(AText = '0,00','',AText);
end;

procedure TfrmPedidoCliente.RxDBGrid1GetCellProps(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor);
begin
  if qryPedidoVendaItensquantidade.AsCurrency < 0 then
     Background := clRed;
  if qryPedidoVendaItensvlrstTotal.AsCurrency < 0 then
     Background := clYellow;
end;

procedure TfrmPedidoCliente.RxDBGrid2DblClick(Sender: TObject);
begin
  StartWaitSql;
  try
    openPedido(qryListaPedidosid.AsInteger);
    PageControl1.ActivePageIndex:= 1;
    CenterControl(GroupBox1);
  finally
    StopWaitSql;
  end;
end;

procedure TfrmPedidoCliente.SpeedButton3Click(Sender: TObject);
var ret : Variant;
begin
   ret:= ShowSearchModal(dbConnect.ZConnection1,'empregados','id,nome','id,nome','nome',true,'funcao=''REPRESENTANTE''');
   if VarIsBlank(ret) then exit;
   EditTable(qryPedidoVenda);
   qryPedidoVendarepresentante.AsString := ret[0];
   qryPedidoVendavrepresentante.AsString:= ret[1];
end;

procedure TfrmPedidoCliente.SpeedButton4Click(Sender: TObject);
Var res : Variant;
begin
   res := ShowSearchModal(dbConnect.ZConnection1,'tabela_forma_pagamento','nome','nome','nome',True);
   if VarIsBlank(res) then exit;
   EditTable(qryPedidoVenda);
   qryPedidoVendaforma_pgto.AsString:= res;
end;

procedure TfrmPedidoCliente.SpeedButton5Click(Sender: TObject);
Var res : Variant;
begin
   res:= ShowSearchModal(dbConnect.ZConnection1, 'tabela_prazo_pagamento', 'prazo', 'prazo', 'prazo', true);
   if VarIsBlank(res) then exit;
   EditTable( qryPedidoVenda );
   qryPedidoVendaprazo_pgto.AsString := res;
end;

procedure TfrmPedidoCliente.btLancarItem1Click(Sender: TObject);
begin
  ConfirmDelete;
  if qryPedidoVendaItensquantidade.AsCurrency > 0 then begin
    DevolverEstoque(qryPedidoVendaItenslote.AsInteger,qryPedidoVendaItensquant_estoque.AsCurrency);
    GerarHistoricoMovimento(qryPedidoVendaid.AsInteger,qryPedidoVendaItensproduto.AsInteger,qryPedidoVendaItenslote.AsInteger,1,
                            OM_PEDIDO,qryPedidoVendanome.AsString,qryPedidoVendaItensquant_estoque.AsCurrency, 0);
  end;
  qryPedidoVendaItens.Delete;
end;

procedure TfrmPedidoCliente.btGerarContasClick(Sender: TObject);
begin
  if GerarContasReceber then
     ShowMessage('Contas a receber geradas com sucesso.');
end;

function TfrmPedidoCliente.GerarContasReceber: Boolean;
Var geraconta : String;
    conta, r : Integer;
begin
  Result := False;
  PostTable( qryPedidoVenda );
  geraconta := ExecSql(dbConnect.ZConnection1,'Select gera_conta From tabela_forma_pagamento Where nome=''%s''',[qryPedidoVendaforma_pgto.AsString]);
  if Not StrToBoolDef(geraconta, False) then Exit;
  with TfrmGerarCtaReceber.Create( Self ) do
  begin
      OpenPedidoVenda(qryPedidoVendaid.AsInteger);
      ShowModal;
      if ModalResult = mrCancel then begin
         Free;
         Exit;
      end;
      ExecSql(dbConnect.ZConnection1,'Delete From contas_receber Where id_nf=%d  and origem ilike ''PEDIDO''',[qryPedidoVendaid.AsInteger]);
      mdCtaTemp.First;
      qryCtaReceber.close;
      OpenTable( qryCtaReceber );
      conta := ifthen(mdCtaTemp.RecordCount=1,125,3);
      While Not mdCtaTemp.Eof do begin
          qryCtaReceber.Append;
          qryCtaReceberid_nf.AsInteger         := qryPedidoVendaid.AsInteger;
          qryCtaReceberparcela.AsInteger       := mdCtaTempparcela.AsInteger;
          qryCtaRecebertotal_parcelas.AsInteger:= mdCtaTemp.RecordCount;
          qryCtaRecebercliente.AsInteger       := qryPedidoVendacliente.AsInteger;
          r := mdCtaTemp.recno;
          r := rgImposto.ItemIndex;
          if ((mdCtaTemp.recno=1) and (rgImposto.ItemIndex=2)) then
             qryCtaReceberdocumento.AsString   := Format('%.9d-%s',[qryPedidoVendaid.AsInteger,
                                                                    'ST'])
          else begin
             if mdCtaTemp.RecordCount > 1 then
                qryCtaReceberdocumento.AsString:= Format('%.9d-%s',[qryPedidoVendaid.AsInteger,
                                                                    Char(64+mdCtaTempparcela.AsInteger)])
             else
                qryCtaReceberdocumento.AsString:= Format('%.9d',[qryPedidoVendaid.AsInteger]);

          end;
          qryCtaReceberdescricao.AsString      := qryPedidoVendanome.AsString;
          qryCtaReceberconta.AsInteger         := conta;
          qryCtaReceberconta_credito.AsInteger := conta;
          //qryCtaReceberconta_debito.AsInteger  := 0;
          qryCtaReceberdataconta.AsDateTime    := Date();
          qryCtaRecebervalor_devido.AsCurrency    := mdCtaTempvalor.AsCurrency;
          qryCtaReceberdata_vencimento.AsDateTime := mdCtaTempdtvcto.AsDateTime;
          qryCtaReceberdesconto.AsCurrency        := 0.00;
          qryCtaReceberjuros.AsCurrency           := 0.00;
          qryCtaRecebervalor_pago.AsCurrency      := 0.00;
          qryCtaReceber.Post;
          mdCtaTemp.Next;
      end;
      Result := True;
      EditTable(qryPedidoVenda);
      qryPedidoVendastatus.AsString := '3';
      PostTable(qryPedidoVenda);
  end;
end;



end.

