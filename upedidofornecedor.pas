unit uPedidoFornecedor;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  ComCtrls, StdCtrls, DbCtrls, EditBtn, Buttons, LCLType, Menus, ZDataset,
  ZSqlUpdate, rxdbdateedit, rxdbgrid, rxcurredit, rxdbcomb, rxlookup,
  rxctrls, RxSortZeos, WAGDBNavigator, ACBrCEP, RLReport, RLParser, db,
  ZAbstractDataset;

type

  { TfrmPedidoFornecedor }

  TfrmPedidoFornecedor = class(TForm)
    btAplicar: TButton;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    DBDateEdit1: TRxDBDateEdit;
    DBEdit1: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit2: TDBEdit;
    DBMemo1: TDBMemo;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    dsListaPedidos: TDataSource;
    dsPedidoComprasItens: TDatasource;
    dsPedidoCompra: TDatasource;
    DBNavigator1: TDBNavigator;
    edLiquido: TCurrencyEdit;
    edTotal: TCurrencyEdit;
    edDesconto: TCurrencyEdit;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label18: TLabel;
    Impressaonormal: TMenuItem;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    qryPedidoCompradesconto: TFloatField;
    RadioButton3: TRadioButton;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    RLLabel26: TRLLabel;
    RxSortZeos1: TRxSortZeos;
    RxSpeedButton2: TRxSpeedButton;
    SalvaremPDF: TMenuItem;
    mnLocalizarPedido: TMenuItem;
    PageControl1: TPageControl;
    Panel1: TPanel;
    pnCabecalho: TRLPanel;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    qryListaPedidosdata: TDateTimeField;
    qryListaPedidosdt_entrega: TDateField;
    qryListaPedidosfornecedor: TLongintField;
    qryListaPedidosid: TLongintField;
    qryListaPedidosnome: TStringField;
    qryListaPedidosnumero_pedido: TLongintField;
    qryListaPedidosstatus: TLongintField;
    qryListaPedidosvstatus: TStringField;
    qryPedidoCompracontato: TStringField;
    qryPedidoCompradata: TDateTimeField;
    qryPedidoCompradt_entrega: TDateField;
    qryPedidoCompraemail: TStringField;
    qryPedidoCompraforma_pgto: TStringField;
    qryPedidoComprafornecedor: TLongintField;
    qryPedidoCompraid: TLongintField;
    qryPedidoCompranome: TStringField;
    qryPedidoCompranumero_pedido: TLongintField;
    qryPedidoCompraobservacao: TMemoField;
    qryPedidoCompraprazo_pgto: TStringField;
    qryPedidoComprasItenscodigo_produto: TStringField;
    qryPedidoComprasItensdescricao_produto: TStringField;
    qryPedidoComprasItensgiro_30: TFloatField;
    qryPedidoComprasItensid_1: TLongintField;
    qryPedidoComprasItenspreco_compra: TFloatField;
    qryPedidoComprasItensquantidade_estoque: TFloatField;
    qryPedidoComprasItensquant_caixa: TFloatField;
    qryPedidoComprasItenstotal: TFloatField;
    qryPedidoComprasItensunidade: TStringField;
    qryPedidoComprastatus: TLongintField;
    qryPedidoComprasItensdescricao: TStringField;
    qryPedidoComprasItensfornecedor: TLongintField;
    qryPedidoComprasItensid: TLongintField;
    qryPedidoComprasItenspedido_compra: TLongintField;
    qryPedidoComprasItensproduto: TLongintField;
    qryPedidoComprasItensquantidade: TFloatField;
    qryPedidoComprasItensquant_entregue: TFloatField;
    qryPedidoCompratelefone1: TStringField;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    RLDBMemo1: TRLDBMemo;
    RLDBResult1: TRLDBResult;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDraw1: TRLDraw;
    RLExpressionParser1: TRLExpressionParser;
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
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLLabel25: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLPanel2: TRLPanel;
    RLPanel3: TRLPanel;
    RLReport1: TRLReport;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    RxSpeedButton1: TRxSpeedButton;
    ScrollBox1: TScrollBox;
    ScrollBox2: TScrollBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton10: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    qryPedidoCompra: TZQuery;
    qryPedidoComprasItens: TZQuery;
    updPedidoCompra: TZUpdateSQL;
    qryListaPedidos: TZQuery;
    procedure btAplicarClick(Sender: TObject);
    procedure DBEdit11Change(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TDBNavButtonType);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ImpressaonormalClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure qryListaPedidosCalcFields(DataSet: TDataSet);
    procedure qryPedidoComprasItensBeforePost(DataSet: TDataSet);
    procedure qryPedidoComprasItensCalcFields(DataSet: TDataSet);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure RxSpeedButton1Click(Sender: TObject);
    procedure RxSpeedButton2Click(Sender: TObject);
    procedure SalvaremPDFClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
  private
    { private declarations }
    procedure openPedido( id : Integer);
    function  somaPedido:Double;
  public
    { public declarations }
  end;

const  STATUS_PEDIDO_PENDENTE   = 0;
       STATUS_PEDIDO_ENVIADO    = 1;
       STATUS_PEDIDO_CONFIRMADO = 2;
       STATUS_PEDIDO_PARCIAL    = 3;
       STATUS_PEDIDO_COMPLETO   = 4;

var
  frmPedidoFornecedor: TfrmPedidoFornecedor;

implementation

{$R *.lfm}

Uses udbConnect, sistema_config, WagVclUtils, TDIPageControl, uSearch,
  BDSqlUtils, uSearchList, DateUtils, StrUtils, variants;

{ TfrmPedidoFornecedor }

function PedidoStatus2Str( status : Integer):String;
begin
  case status of
      STATUS_PEDIDO_PENDENTE   : Result := 'Iniciado';
      STATUS_PEDIDO_ENVIADO    : Result := 'Enviado';
      STATUS_PEDIDO_CONFIRMADO : Result := 'Confirmado';
      STATUS_PEDIDO_PARCIAL    : Result := 'Entregue Parcial';
      STATUS_PEDIDO_COMPLETO   : Result := 'Entregue Total';
  end;
end;


procedure TfrmPedidoFornecedor.ToolButton2Click(Sender: TObject);
begin
   ClosePageThisForm(Self);
end;

procedure TfrmPedidoFornecedor.openPedido(id: Integer);
begin
  qryPedidoCompra.Close;
  qryPedidoCompra.ParamByName('id').AsInteger := id;
  OpenTable( qryPedidoCompra );
  qryPedidoComprasItens.Close;
  qryPedidoComprasItens.ParamByName('id').AsInteger        := qryPedidoCompraid.AsInteger;
  qryPedidoComprasItens.ParamByName('fornecedor').AsInteger:= qryPedidoComprafornecedor.AsInteger;
  OpenTable( qryPedidoComprasItens );
  edTotal.Value := somaPedido;
end;

function TfrmPedidoFornecedor.somaPedido: Double;
begin
   //qryPedidoComprasItens.DisableControls;
   qryPedidoComprasItens.First;
   Result := 0;
   while not qryPedidoComprasItens.Eof do
   begin
        Result := Result + qryPedidoComprasItenstotal.AsCurrency;
        qryPedidoComprasItens.Next;
   end;
   qryPedidoComprasItens.First;
   edTotal.Value    := Result;
   edDesconto.Value := CalculaPerc(qryPedidoCompradesconto.AsCurrency, edTotal.Value);
   edLiquido.Value  := edTotal.Value - edDesconto.Value;
   //qryPedidoComprasItens.EnableControls;
end;

procedure TfrmPedidoFornecedor.FormCreate(Sender: TObject);
begin
   dbConnect.setImageForDBNavigator(dbnavigator1);
   DateEdit1.Date := StartOfTheMonth(Date());
   DateEdit2.Date := EndOfTheMonth(Date());
   openPedido(0);
   btAplicar.Click;
end;

procedure TfrmPedidoFornecedor.DBNavigator1Click(Sender: TObject;
  Button: TDBNavButtonType);
var ret : Variant;
begin
  if Button = nbInsert then begin
     ret:= ShowSearchModal(dbConnect.ZConnection1,'fornecedores','id,nome','id,nome','nome',true);
     if VarIsBlank(ret) then begin
        qryPedidoCompra.Cancel;
        Abort;
     end;
     qryPedidoComprafornecedor.AsString:= ret[0];
     qryPedidoCompranome.AsString      := ret[1];
     qryPedidoCompradata.AsDateTime    := Now();
     PostTable(qryPedidoCompra);
     openPedido(LastInsertID(dbConnect.ZConnection1,'pedido_compra_id_seq'));
     PageControl1.ActivePageIndex      := 1;
  end;
end;

procedure TfrmPedidoFornecedor.btAplicarClick(Sender: TObject);
Var where : string;
begin
  where := 'Where (0=0)';
  if DateEdit1.Date > NullDate then
     where := Where + Format(' and (data >= ''%s'')',[DateEdit1.Text]);
  if DateEdit2.Date > 0 then
     where := Where + Format(' and (data <= ''%s'')',[DateEdit2.Text]);
  if RadioButton1.Checked then
     where := Where + ' and (pc.numero_pedido is not null)';
  if RadioButton2.Checked then
     where := Where + ' and (pc.numero_pedido is null)';
//  if RadioButton3.Checked then

  qryListaPedidos.close;
  qryListaPedidos.Sql.Text:= 'Select pc.*,f.nome From pedido_compra pc '+
                             'Left Join fornecedores f on f.id=pc.fornecedor '+
                             where +
                             ' Order By data ';
  OpenTable( qryListaPedidos );
end;

procedure TfrmPedidoFornecedor.DBEdit11Change(Sender: TObject);
begin
 //   if key = VK_RETURN then begin
     edDesconto.Value := CalculaPerc(qryPedidoCompradesconto.AsCurrency, edTotal.Value);
     edLiquido.Value  := edTotal.Value - edDesconto.Value;
 // end;
end;

procedure TfrmPedidoFornecedor.FormResize(Sender: TObject);
begin
  CenterControl(GroupBox1);
  CenterControl(GroupBox5);
end;

procedure TfrmPedidoFornecedor.ImpressaonormalClick(Sender: TObject);
Var qry : TZQuery;
begin
  qry := ExecSqlQuery(dbConnect.ZConnection1,'Select * From empresa Where id=%s',[getEmpresaPadrao]);
//  RLLabel1.Caption  := qry.FieldByName('nome').AsString;
  RLLabel23.Caption := qry.FieldByName('nome').AsString;
  RLLabel3.Caption  := qry.FieldByName('logradouro').AsString +' , ' + qry.FieldByName('numero').AsString;
  RLLabel7.Caption  := qry.FieldByName('cidade').AsString +' - ' + qry.FieldByName('uf').AsString + ' CEP '+qry.FieldByName('cep').AsString;
  RLLabel8.Caption  := 'Tel.: ' + qry.FieldByName('fone').AsString;
  RLLabel4.Caption  := 'CNPJ : '+ qry.FieldByName('cnpj').AsString + '    Insc. Estadual.: ' + qry.FieldByName('ie').AsString;
  RLLabel6.Caption  := Format('%.6d',[qryPedidoCompranumero_pedido.AsInteger]);

//  RLLabel22.Caption := Format('Nº Pedido.: %.6d',[qryPedidoCompraid.AsInteger]);
  RLLabel10.Caption := FormatDateTime('dddd, dd "de" mmmm "de" yyyy',qryPedidoCompradata.AsDateTime);
  RLReport1.Title   := Format('pd_compra_%.6d',[qryPedidoCompranumero_pedido.AsInteger]);
  RLLabel6.Caption  := Format('%.6d',[qryPedidoCompranumero_pedido.AsInteger]);
  dbConnect.ConfigReport(RLReport1);

  qryPedidoComprasItens.Filter  := 'quantidade > 0';
  qryPedidoComprasItens.Filtered:= True;
  {Esconde campos de valores}
  RLLabel18.Visible:= False;
  RLLabel19.Visible:= False;
  RLDBText8.Visible:= False;
  RLDBText9.Visible:= False;
  RLLabel12.Visible:= False;
  RLDBResult1.Visible:= False;
  RLLabel22.Visible:= False;
  RLLabel26.Visible:= False;

  //RLLabel14.Align  := faRightOnly;
  //RLDBText1.Align  := faRightOnly;

  RLReport1.Clear;
  RLReport1.PreviewModal;
  qryPedidoComprasItens.Filtered:= False;
end;

procedure TfrmPedidoFornecedor.MenuItem1Click(Sender: TObject);
Var qry : TZQuery;
begin
  qry := ExecSqlQuery(dbConnect.ZConnection1,'Select * From empresa Where id=%s',[getEmpresaPadrao]);
//  RLLabel1.Caption  := qry.FieldByName('nome').AsString;
  RLLabel23.Caption := qry.FieldByName('nome').AsString;
  RLLabel3.Caption  := qry.FieldByName('logradouro').AsString +' , ' + qry.FieldByName('numero').AsString;
  RLLabel7.Caption  := qry.FieldByName('cidade').AsString +' - ' + qry.FieldByName('uf').AsString + ' CEP '+qry.FieldByName('cep').AsString;
  RLLabel8.Caption  := 'Tel.: ' + qry.FieldByName('fone').AsString;
  RLLabel4.Caption  := 'CNPJ : '+ qry.FieldByName('cnpj').AsString + '    Insc. Estadual.: ' + qry.FieldByName('ie').AsString;
  RLLabel6.Caption  := Format('%.6d',[qryPedidoCompranumero_pedido.AsInteger]);

//  RLLabel22.Caption := Format('Nº Pedido.: %.6d',[qryPedidoCompraid.AsInteger]);
  RLLabel10.Caption := FormatDateTime('dddd, dd "de" mmmm "de" yyyy',qryPedidoCompradata.AsDateTime);
  RLReport1.Title   := Format('pd_compra_%.6d',[qryPedidoCompranumero_pedido.AsInteger]);
  dbConnect.ConfigReport(RLReport1);

  qryPedidoComprasItens.Filter  := 'quantidade > 0';
  qryPedidoComprasItens.Filtered:= True;

  {Mostra campos de valores}
  RLLabel18.Visible:= True;
  RLLabel19.Visible:= True;
  RLDBText8.Visible:= True;
  RLDBText9.Visible:= True;
  RLLabel12.Visible:= True;
  RLDBResult1.Visible:= True;
  RLLabel22.Visible:= True;
  RLLabel26.Visible:= True;

  //RLLabel14.Align  := faNone;
  //RLDBText1.Align  := faNone;
  //RLLabel14.Left   := 564;
  //RLDBText1.Left   := 560;


  RLReport1.Clear;
  RLReport1.PreviewModal;
  qryPedidoComprasItens.Filtered:= False;
end;

procedure TfrmPedidoFornecedor.PageControl1Change(Sender: TObject);
begin
   FormResize(nil);
   SpeedButton2.Enabled   := PageControl1.ActivePageIndex = 1;
   RxSpeedButton2.Enabled := PageControl1.ActivePageIndex = 1;
   ToolButton6.Enabled    := PageControl1.ActivePageIndex = 1;
end;

procedure TfrmPedidoFornecedor.qryListaPedidosCalcFields(DataSet: TDataSet);
begin
  qryListaPedidosvstatus.AsString := PedidoStatus2Str(qryListaPedidosstatus.AsInteger);
end;

procedure TfrmPedidoFornecedor.qryPedidoComprasItensBeforePost(DataSet: TDataSet);
Var produto : Integer;
begin
  SetDecimalSeparator('.');
  try
    {Não existe ainda}
    produto := qryPedidoComprasItensid.AsInteger;
    qryPedidoComprasItens.DisableControls;
    if qryPedidoComprasItensid_1.IsNull then begin
       ExecSql(dbConnect.ZConnection1,'INSERT INTO pedido_compra_itens(pedido_compra,produto,quantidade) '+
                                      'VALUES(%d,%d,%.2f)',
                                      [qryPedidoCompraid.AsInteger,
                                       qryPedidoComprasItensid.AsInteger,
                                       qryPedidoComprasItensquantidade.AsCurrency]);
       qryPedidoComprasItens.Cancel;
       RefreshTable( qryPedidoComprasItens );
    end;
    {Já existe atualiza}
    if Not qryPedidoComprasItensid_1.IsNull then begin
       ExecSql(dbConnect.ZConnection1,'Update pedido_compra_itens Set quantidade=%.2f Where id=%d',
                                      [qryPedidoComprasItensquantidade.AsCurrency,
                                       qryPedidoComprasItensid_1.AsInteger]);
       qryPedidoComprasItens.Cancel;
       RefreshTable( qryPedidoComprasItens );
    end;
    somaPedido;
    qryPedidoComprasItens.Locate('id',produto,[]);
  finally
    RestoreDecimalSeparator;
    qryPedidoComprasItens.EnableControls;
    Abort;
  end;
end;

procedure TfrmPedidoFornecedor.qryPedidoComprasItensCalcFields(DataSet: TDataSet
  );
begin
  qryPedidoComprasItenstotal.AsCurrency := qryPedidoComprasItensquantidade.AsCurrency * qryPedidoComprasItenspreco_compra.AsCurrency;
end;

procedure TfrmPedidoFornecedor.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel22.Caption := FormatMoney( edDesconto.Value );
  RLLabel26.Caption := FormatMoney( edLiquido.Value );
end;

procedure TfrmPedidoFornecedor.RxDBGrid2DblClick(Sender: TObject);
begin
   openPedido(qryListaPedidosid.AsInteger);
   PageControl1.ActivePageIndex := 1;
end;

procedure TfrmPedidoFornecedor.RxSpeedButton1Click(Sender: TObject);
begin
  if PageControl1.ActivePageIndex <> 1 then
     Raise Exception.Create('Abra o pedido para poder excluí-lo.');
  ConfirmDelete;
  qryPedidoCompra.Delete;
  RefreshTable( qryListaPedidos );
  PageControl1.ActivePageIndex:= 0;
  openPedido(0);
end;

procedure TfrmPedidoFornecedor.RxSpeedButton2Click(Sender: TObject);
Var res : Variant;
begin
  res := ShowSearchLista( ['Iniciado','Enviado','Confirmado','Entregue Parcial','Entregue Total'] ,'Alterar status do pedido',True);
  if VarIsNull(res) then exit;
  EditTable(qryPedidoCompra);
  qryPedidoComprastatus.AsString := res;
  PostTable(qryPedidoCompra);
  RefreshTable( qryListaPedidos );
end;

procedure TfrmPedidoFornecedor.SalvaremPDFClick(Sender: TObject);
Var qry : TZQuery;
  diretorio: String;
begin
  qry := ExecSqlQuery(dbConnect.ZConnection1,'Select * From empresa Where id=%s',[getEmpresaPadrao]);
//  RLLabel1.Caption  := qry.FieldByName('nome').AsString;
  RLLabel23.Caption := qry.FieldByName('nome').AsString;
  RLLabel3.Caption  := qry.FieldByName('logradouro').AsString +' , ' + qry.FieldByName('numero').AsString;
  RLLabel7.Caption  := qry.FieldByName('cidade').AsString +' - ' + qry.FieldByName('uf').AsString + ' CEP '+qry.FieldByName('cep').AsString;
  RLLabel8.Caption  := 'Tel.: ' + qry.FieldByName('fone').AsString;
  RLLabel4.Caption  := 'CNPJ : '+ qry.FieldByName('cnpj').AsString + '    Insc. Estadual.: ' + qry.FieldByName('ie').AsString;
  RLLabel6.Caption  := Format('%.6d',[qryPedidoCompranumero_pedido.AsInteger]);

//  RLLabel22.Caption := Format('Nº Pedido.: %.6d',[qryPedidoCompraid.AsInteger]);
  RLLabel10.Caption := FormatDateTime('dddd, dd "de" mmmm "de" yyyy',qryPedidoCompradata.AsDateTime);
  RLReport1.Title   := Format('pd_compra_%.6d',[qryPedidoCompranumero_pedido.AsInteger]);
  dbConnect.ConfigReport(RLReport1);

  qryPedidoComprasItens.Filter  := 'quantidade > 0';
  qryPedidoComprasItens.Filtered:= True;

  {Mostra campos de valores}
  RLLabel18.Visible:= True;
  RLLabel19.Visible:= True;
  RLDBText8.Visible:= True;
  RLDBText9.Visible:= True;
  RLLabel12.Visible:= True;
  RLDBResult1.Visible:= True;
  RLLabel22.Visible:= True;
  RLLabel26.Visible:= True;


  //RLLabel14.Align  := faNone;
  //RLDBText1.Align  := faNone;
  //RLLabel14.Left   := 564;
  //RLDBText1.Left   := 560;


  RLReport1.Clear;
  //RLReport1.PreviewModal;
  if not SelectDirectory('Selecione uma pasta...',HomeDir, diretorio ) then exit;

  RLReport1.SaveToFile(NormalDir(diretorio) + Format('pedido_compra_%.4d.pdf',[qryPedidoCompranumero_pedido.AsInteger]));
  qryPedidoComprasItens.Filtered:= False;
end;

procedure TfrmPedidoFornecedor.SpeedButton2Click(Sender: TObject);
begin
  if Not qryPedidoCompranumero_pedido.IsNull then
     Raise Exception.create('Este pedido já esta salvo.');
  if Messagedlg('Você quer salvar este pedido ao fornecedor?',mtConfirmation,[mbNo,mbYes],0) <> mrYes then exit;
  PostTable(qryPedidoCompra);
  ExecSql(dbConnect.ZConnection1,'Update pedido_compra Set numero_pedido=(Select coalesce(max(numero_pedido),0)+5 from pedido_compra) Where id=%d',[qryPedidoCompraid.AsInteger]);
  RefreshTable( qryPedidoCompra );
  RefreshTable( qryListaPedidos );
end;

end.

