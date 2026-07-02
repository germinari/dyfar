unit uVendaBalcao;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Buttons, IniPropStorage, ComCtrls, Menus, rxdbgrid, rxmemds,
  rxcurredit, RLReport, ACBrECF, ACBrECFVirtualNaoFiscal, ACBrSedex, ACBrNFe,
  ACBrDANFCeFortesFr, ACBrDANFCeFortesFrA4, ZDataset, ZSequence, uIdentificaConsumidor;

type

  { TfrmVendaBalcao }


  TfrmVendaBalcao = class(TForm)
    ACBrNFe1: TACBrNFe;
    ACBrNFeDANFCeFortes1: TACBrNFeDANFCeFortes;
    ACBrNFeDANFCeFortesA4_1: TACBrNFeDANFCeFortesA4;
    btCancelaVenda: TButton;
    edDestinatario: TEdit;
    edCPF: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    lCPF_CNPJ1: TRLLabel;
    MenuItem4: TMenuItem;
    DisponibilidadeSEFAZ: TMenuItem;
    GerarenviarNFCe: TMenuItem;
    MenuItem6: TMenuItem;
    CancelarNFCe: TMenuItem;
    rbPrecoVarejo: TRadioButton;
    rbPrecoAtacado: TRadioButton;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    RLDBMemo1: TRLDBMemo;
    RLDBText2: TRLDBText;
    RLLabel1: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLReport1: TRLReport;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    SpeedButton4: TSpeedButton;
    BitBtn2: TBitBtn;
    btFecharCaixa: TSpeedButton;
    btEntrada: TSpeedButton;
    btSangria: TSpeedButton;
    btOpenVenda: TSpeedButton;
    ckbManterDesconto: TCheckBox;
    Datasource1: TDatasource;
    edCodigo: TEdit;
    edDesconto: TCurrencyEdit;
    edNumVenda: TEdit;
    edData: TEdit;
    edNumNF: TEdit;
    edPreco: TCurrencyEdit;
    edQuant: TCurrencyEdit;
    edTotal: TCurrencyEdit;
    GroupBox1: TGroupBox;
    IniPropStorage1: TIniPropStorage;
    Label1: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbDescricao: TLabel;
    lbMsg: TLabel;
    lbNumItens: TLabel;
    lbTotal: TLabel;
    MenuItem1: TMenuItem;
    VendasdeHoje: TMenuItem;
    Escolherumadata: TMenuItem;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    RxMemoryData1: TRxMemoryData;
    RxMemoryData1desconto: TFloatField;
    RxMemoryData1descricao: TStringField;
    RxMemoryData1item: TLongintField;
    RxMemoryData1loja_estoque: TLongintField;
    RxMemoryData1lote: TLongintField;
    RxMemoryData1preco: TFloatField;
    RxMemoryData1produto: TLongintField;
    RxMemoryData1quantidade: TFloatField;
    RxMemoryData1slote: TStringField;
    RxMemoryData1total: TFloatField;
    SpeedButton2: TSpeedButton;
    btAbrirCaixa: TSpeedButton;
//    SpeedButton4: TSpeedButton;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ZQuery1: TZQuery;
    qryNFCe: TZQuery;
    ZSequence1: TZSequence;
    procedure BitBtn2Click(Sender: TObject);
    procedure btAbrirCaixaClick(Sender: TObject);
    procedure btEntradaClick(Sender: TObject);
    procedure btFecharCaixaClick(Sender: TObject);
    procedure btOpenVendaClick(Sender: TObject);
    procedure btSangriaClick(Sender: TObject);
    procedure btCancelaVendaClick(Sender: TObject);
    procedure ckbManterDescontoClick(Sender: TObject);
    procedure DisponibilidadeSEFAZClick(Sender: TObject);
    procedure edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edDescontoChange(Sender: TObject);
    procedure edDescontoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edQuantChange(Sender: TObject);
    procedure edQuantKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure VendasdeHojeClick(Sender: TObject);
    procedure EscolherumadataClick(Sender: TObject);
    procedure GerarenviarNFCeClick(Sender: TObject);
    procedure rbPrecoVarejoChange(Sender: TObject);
    procedure RxDBGrid1GetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
    procedure RxMemoryData1CalcFields(DataSet: TDataSet);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    function  GerarXMLNFCe(nfce: Integer; ACBrNFe: TACBrNFe): Boolean;
    procedure AutorizarNFCe(id_nfce: Integer);
    procedure LancarPorLote(const produto, empresa: Integer; const quant: Double);
    { private declarations }
  public
    { public declarations }
    conta_credito, conta_vista : String;
    consumidor : TConsumidor;
    procedure MostraListaProdutos;
    procedure ConcluirVenda;
    procedure LocalizarProduto;

    procedure AlterarQuantidade;
    function  Somar:double;
    procedure CancelarItem;
    procedure LancaItem(const quant : Double;const lote : Integer;const slote, empresa : String);

    procedure Limpa;
    procedure ImprimirComprovante( id : Integer);
    procedure ImprimirNFCe( id : Integer);
    function  CaixaEstaAberto:Boolean;
    function  VerificaEstoque(const produto,empresa : Integer; const quant : Double ):Integer;
    function  InformarLoteLancar(const produto,empresa : Integer; const quant : Double ):Double;
    procedure calculaDesconto;
    procedure OpenVenda( id : String);
    function  GerarCtaReceber( Valor : double; cliente, nome : String; id : Integer):Boolean;
    procedure IdentificarConsumidor;
    procedure SaveIdentificacao(id : Integer);
    function  PermiteVendaSemEstoque:Boolean;
  end;


var
  frmVendaBalcao: TfrmVendaBalcao;

implementation

uses LCLType, Printers, ACBrNFeNotasFiscais, pcnConversaoNFe, ACBrNFe.Classes,
  pcnConversao, pcnAuxiliar, ACBrUtil, udbConnect, uGetValor, uRecebimento,
  uRecebFim, uSearch, WagVclUtils, BDSqlUtils, WagStrUtils, uInputDate,
  PrinterTexts, uUser, RLPrinters, uInputFloat, sistema_config, uGerarParcelas,
  strutils, dateutils, math, variants;

{$R *.lfm}

{ TfrmVendaBalcao }

procedure TfrmVendaBalcao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var id_nfce : Integer;
begin
  if (Not Panel4.Enabled) and (key <> VK_F7) then exit;
  Case key of
     VK_F4 : ConcluirVenda;
     VK_F5 : CancelarItem;
     VK_F6 : MostraListaProdutos;
     VK_F7 : ImprimirComprovante( StrToIntDef(edNumVenda.Text, 0) );
     VK_F8 : IdentificarConsumidor;
  end;
end;

procedure TfrmVendaBalcao.VendasdeHojeClick(Sender: TObject);
Var res : Variant;
    sql : String;
begin
  sql := 'Select id,to_char(data,''dd/mm/yyyy HH24:MM'')::::varchar(20) as data, ';
  sql += '(Select sum((quantidade * preco) - ((quantidade * preco)*desconto/100)) From balcao_venda_itens bvi Where balcao_venda=bv.id)::::numeric(10,2) as total ';
  sql += 'From balcao_venda bv ';
  sql += 'Where data::::date = CURRENT_DATE ';
  sql += 'Order by id desc';
  res  := ShowSearchModalSQL(dbConnect.ZConnection1,sql,'id,data,total','id', 'id',true);
  if VarIsBlank(res) then exit;
  PageControl1.ActivePageIndex := 1;
  OpenVenda(res);
end;

procedure TfrmVendaBalcao.EscolherumadataClick(Sender: TObject);
Var data : TDateTime;
    res : Variant;
    sql : String;
begin
     if not InputDate('Selecione uma data',data) then exit;
     sql := 'Select id,to_char(data,''dd/mm/yyyy HH24:MM'')::::varchar(20) as data, ';
     sql += '(Select sum((quantidade * preco) - ((quantidade * preco)*desconto/100)) From balcao_venda_itens bvi Where balcao_venda=bv.id)::::numeric(10,2) as total ';
     sql += 'From balcao_venda bv ';
     sql += Format('Where data::::date=''%s'' ',[DateTostr(data)]);
     sql += 'Order by id desc';
     res  := ShowSearchModalSQL(dbConnect.ZConnection1,sql,'id,data,total','id', 'id',true);
     if VarIsBlank(res) then exit;
     PageControl1.ActivePageIndex := 1;
     OpenVenda(res);
end;

procedure TfrmVendaBalcao.GerarenviarNFCeClick(Sender: TObject);
Var id_nfce : Integer;
begin
   InicializaConfigNFCe( ACBrNFe1, StrToInt(getEmpresaPadrao( meCodigo )) );
   id_nfce := GerarNFCeFromComanda(dbConnect.ZConnection1 , StrToIntDef(edNumVenda.Text, 0), 0);
   GerarXMLNFCe( id_nfce , ACBrNFe1);
   AutorizarNFCe( id_nfce );
   ImprimirNFCe( id_nfce );
end;

procedure TfrmVendaBalcao.rbPrecoVarejoChange(Sender: TObject);
begin
     if Length(edCodigo.text) > 0 then
        LocalizarProduto;
end;

procedure TfrmVendaBalcao.RxDBGrid1GetCellProps(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor);
begin
  if RxMemoryData1loja_estoque.AsString <> getEmpresaPadrao(meCodigo) then
     Background := $00B096CD;
end;

procedure TfrmVendaBalcao.RxMemoryData1CalcFields(DataSet: TDataSet);
Var value : Double;
begin
  value := RxMemoryData1quantidade.AsFloat * RxMemoryData1preco.AsFloat;
  RxMemoryData1total.AsFloat := value - CalculaPerc(RxMemoryData1desconto.Asfloat,value);
end;

procedure TfrmVendaBalcao.SpeedButton2Click(Sender: TObject);
begin
  uUser.ShowDialog(dbConnect.ZConnection1,'Tabelas','TfrmConfig');
end;

procedure TfrmVendaBalcao.SpeedButton4Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmVendaBalcao.btAbrirCaixaClick(Sender: TObject);
Var valor : Double;
    value : String;
begin
  //Open caixa
  if Not obtemValor('Abertura do caixa','Digite o valor de abertura do caixa',valor) then exit;
  if not InputQuery('Identificação de usuário','Por favor digite sua senha de identificação.',True,value) then exit;
  value := ExecSql(dbConnect.ZConnection1,'Select id From empregados Where senha_id=''%s''',[value]);
  if length(value)=0 then Raise exception.create('Senha de identificação inválida!');
  try
     SetDecimalSeparator('.');
     ExecSql(dbConnect.ZConnection1,'INSERT INTO balcao_caixa(historico, valor, loja, tipo_lancamento,balcao_venda) '+
                                        'VALUES (''%s'', %.2f, %s, %d, %d)',
                                        ['Abertura de caixa',
                                         valor,
                                         getEmpresaPadrao,
                                         tlAbertura,0,value]);
     Panel4.Enabled       := CaixaEstaAberto();
     btAbrirCaixa.Enabled := Not Panel4.Enabled;
     btFecharCaixa.Enabled:= Panel4.Enabled;
     lbMsg.Caption := 'Caixa fechado, efetue a abertura para continuar.';
  finally
    RestoreDecimalSeparator;
  end;

end;

procedure TfrmVendaBalcao.BitBtn2Click(Sender: TObject);
begin
  RxMemoryData1.Close;
  PageControl1.ActivePageIndex := 0;
end;

procedure TfrmVendaBalcao.btEntradaClick(Sender: TObject);
Var valor : Double;
    value,historico : String;
begin
  //entrada caixa
  if Not obtemValor('Entrada no caixa','Digite o valor ',valor) then exit;
  if not InputQuery('Historico de entrada','Histórico de entrada.',historico) then exit;

  if not InputQuery('Identificação de usuário','Por favor digite sua senha de identificação.',True,value) then exit;
  value := ExecSql(dbConnect.ZConnection1,'Select id From empregados Where senha_id=''%s''',[value]);
  if length(value)=0 then Raise exception.create('Senha de identificação inválida!');
  try
     SetDecimalSeparator('.');
     ExecSql(dbConnect.ZConnection1,'INSERT INTO balcao_caixa(historico, valor, loja, tipo_lancamento,balcao_venda) '+
                                        'VALUES (''%s'', %.2f, %s, %d, %d)',
                                        ['Entrada no caixa '+historico,
                                         valor,
                                         getEmpresaPadrao,
                                         tlEntrada,0,value]);
  finally
    RestoreDecimalSeparator;
  end;
end;

procedure TfrmVendaBalcao.btFecharCaixaClick(Sender: TObject);
Var valor : Double;
    value,sql : String;
begin
  //Fechar caixa
  if Not obtemValor('Fechamento de caixa','Digite o valor em dinheiro no caixa',valor) then exit;
  if not InputQuery('Identificação de usuário','Por favor digite sua senha de identificação.',True,value) then exit;
  value := ExecSql(dbConnect.ZConnection1,'Select id From empregados Where senha_id=''%s''',[value]);
  if length(value)=0 then Raise exception.create('Senha de identificação inválida!');
  try
     valor := StrToFloatDef(value,0);
     SetDecimalSeparator('.');
     sql := Format('INSERT INTO balcao_caixa(historico, valor, loja, tipo_lancamento,balcao_venda) '+
                                        'VALUES (''%s'', %.2f, %s, %d, %s)',
                                        ['Fechamento de caixa',
                                         valor,
                                         getEmpresaPadrao,
                                         tlFechamento,
                                         value]);
     sHOWmESSAGE(sql);
     ExecSql(dbConnect.ZConnection1,SQL);
     Panel4.Enabled      := CaixaEstaAberto();
     btAbrirCaixa.Enabled:= Not Panel4.Enabled;
  finally
    RestoreDecimalSeparator;
  end;
end;

procedure TfrmVendaBalcao.btOpenVendaClick(Sender: TObject);
begin
  PopupMenu2.Items[4].Enabled := PageControl1.ActivePageIndex=1;
  ShowDropDrownMenuButton(btOpenVenda,PopupMenu2);
end;

procedure TfrmVendaBalcao.btSangriaClick(Sender: TObject);
Var valor : Double;
    value, historico : String;
begin
  //Saida caixa
  if Not obtemValor('Saida do caixa','Digite o valor ',valor) then exit;
  if not InputQuery('Historico de entrada','Histórico de entrada.',historico) then exit;
  if not InputQuery('Identificação de usuário','Por favor digite sua senha de identificação.',True,value) then exit;
  value := ExecSql(dbConnect.ZConnection1,'Select id From empregados Where senha_id=''%s''',[value]);
  if length(value)=0 then Raise exception.create('Senha de identificação inválida!');
  try
     SetDecimalSeparator('.');
     ExecSql(dbConnect.ZConnection1,'INSERT INTO balcao_caixa(historico, valor, loja, tipo_lancamento,balcao_venda) '+
                                        'VALUES (''%s'', %.2f, %s, %d, %d)',
                                        ['Saida do caixa '+historico,
                                         valor,
                                         getEmpresaPadrao,
                                         tlSangria,value]);
  finally
    RestoreDecimalSeparator;
  end;
end;

procedure TfrmVendaBalcao.btCancelaVendaClick(Sender: TObject);
var id : String;
    qry : TZQuery;
    valor : Double;
    sql : String;
    empresa : Integer;
begin
  {Cancelamento de venda do balcao}
  id := edNumVenda.Text;
  if MessageDlg('Voce quer cancelar a venda n° '+id+' ? Contas a receber serão deletadas, itens serão devolvidos ao estoque e sera feito um estorno ao caixa.',mtWarning,[mbYes,mbNo],0) <> mrYes then exit;
  empresa := StrToInt(ExecSql(dbConnect.ZConnection1,'Select empresa from balcao_venda Where id=%s',[id]));
  //devolve itens ao estoque;
  qry := ExecSqlQuery(dbConnect.ZConnection1,'Select * from balcao_venda_itens Where balcao_venda=%s',[id]);
  ExecSql(dbConnect.ZConnection1,'Begin Work');
  try
      while not qry.Eof do begin
          DevolverEstoque(qry.FieldByname('lote').AsInteger, qry.FieldByname('quantidade').AsFloat);
          //--GerarHistoricoMovimento(qry.FieldByname('produto').AsInteger,
          //--                        empresa,
          //--                        'Cancelamento da venda n.'+id,qry.FieldByname('quantidade').AsFloat, 0);
          qry.Next;
      end;
      //Estorna caixa;
      //try
         SetDecimalSeparator('.');
         valor:= StrToFloat(ExecSql(dbConnect.ZConnection1,'Select valor from balcao_caixa Where balcao_venda=%s and tipo_lancamento=2',[id]));
         sql := format('INSERT INTO balcao_caixa(historico, valor, loja, tipo_lancamento,balcao_venda) '+
                                        'VALUES (''%s'', %.2f, %d, %d, %s)',
                                        ['Estono, cacelamendo venda n° '+id,
                                         valor, empresa,TTipoLancamentoToInt(tlSangria),id]);
         ExecSql(dbConnect.ZConnection1,sql);
         RestoreDecimalSeparator;
     { except
        on E : Exception do begin
           RestoreDecimalSeparator;
           ExecSql(dbConnect.ZConnection1,'RollBack');
           ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
           Exit;
        end;
      end;}
      //Cancela contas a receber
      ExecSql(dbConnect.ZConnection1,'Delete From contas_receber Where trim(documento)=''%s''',[id]);
      //1° Invalida ou deleta venda do balcao
      ExecSql(dbConnect.ZConnection1,'Delete From balcao_venda Where id=%s',[id]);
      //ExecSql(dbConnect.ZConnection1,'Delete From balcao_caixa Where balcao_venda=%s',[id]);
      ExecSql(dbConnect.ZConnection1,'Commit');
      ShowMessage('Cancelamento efetuado.');
  except
      RestoreDecimalSeparator;
      ExecSql(dbConnect.ZConnection1,'RollBack');
      Raise;
  end;



end;

procedure TfrmVendaBalcao.ckbManterDescontoClick(Sender: TObject);
begin
  edDesconto.SetFocus;
end;

procedure TfrmVendaBalcao.DisponibilidadeSEFAZClick(Sender: TObject);
begin
  InicializaConfigNFCe( ACBrNFe1, StrToInt(getEmpresaPadrao( meCodigo )) );
  ACBrNFe1.Configuracoes.WebServices.Visualizar:= True;
  ACBrNFe1.WebServices.StatusServico.Executar;
end;

procedure TfrmVendaBalcao.edCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
     LocalizarProduto;
  if Key = VK_INSERT then
     MostraListaProdutos;
end;

procedure TfrmVendaBalcao.edDescontoChange(Sender: TObject);
begin
  calculaDesconto;
  //edTotal.Value := edPreco.Value * edQuant.Value;
  //edTotal.Value := edTotal.Value - CalculaPerc(edDesconto.Value , edTotal.Value);
end;

procedure TfrmVendaBalcao.edDescontoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_RETURN then
       edQuant.Setfocus;
end;

procedure TfrmVendaBalcao.edQuantChange(Sender: TObject);
begin
  calculaDesconto;
     //edTotal.Value := edPreco.Value * edQuant.Value;
     //edTotal.Value := edTotal.Value - CalculaPerc(edDesconto.Value , edTotal.Value);
end;

procedure TfrmVendaBalcao.edQuantKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var produto, empresa  : Integer;
    quant : Double;
begin
  if (Key = VK_RETURN) then begin
     produto := StrToInt(ExtractWord(1,lbDescricao.Caption,['-']));
     empresa := StrToInt(getEmpresaPadrao(meCodigo));
     quant   := edQuant.Value;
     LancarPorLote(produto,empresa,quant);
  end;
end;

procedure TfrmVendaBalcao.LancarPorLote(const produto, empresa: Integer; const quant: Double);
Var ret   : Integer;
    qFalta: Double;
begin
  RxMemoryData1.Open;
  ret := VerificaEstoque(produto,empresa, quant );
  Case ret of
     0 : Begin
           //Raise Exception.Create('Estoque esta zerado.');
           if Not PermiteVendaSemEstoque then Begin
             if MessageDlg('Não tenho estoque deste produto nesta loja. voce quer verificar em outra loja?',mtWarning,[mbYes,mbNo],0) = mrYes then begin
                LancarPorLote(produto, getEmpresaPadraoNext(empresa),quant);
             end;
           end else begin
             LancaItem( quant, 0, '', IntToStr(empresa));
             Limpa;
           end;
         end;
     1 : begin
           //Raise Exception.Create('Estoque insuficiente.');
           qFalta := InformarLoteLancar(produto,empresa, quant );
           if MessageDlg('Estoque nesta loja é insuficiente para atender o pedido. Voce quer verificar em outra loja?',mtWarning,[mbYes,mbNo],0) = mrYes then begin
              LancarPorLote(produto, getEmpresaPadraoNext(empresa),qFalta);
           end;
         end;
     2 : Begin
           //Raise Exception.Create('Estoque ok em um lote.');
           InformarLoteLancar(produto,empresa, quant );
           Limpa;
         end;
     3 : Begin
           //Raise Exception.Create('Estoque ok mas em dois lotes.');
           InformarLoteLancar(produto,empresa, quant );
           Limpa;
         end;
  end;
  somar;
end;

function TfrmVendaBalcao.VerificaEstoque(const produto, empresa: Integer; const quant: Double): Integer;
Var qryLotes : TZQuery;
    qEstq, qFalta   : Double;
begin
  qryLotes := ExecSqlQuery(dbConnect.ZConnection1,'Select id,lote,sum(quantidade) as quantidade from produtos_estoque '+
                                                  'Where produto=%d and empresa=%d '+
                                                  'Group by id,data_validade,lote '+
                                                  'Order by id,data_validade,lote ',
                                                  [produto,empresa]);
  qEstq := qryLotes.FieldByName('quantidade').ASfloat;
  //Não tenho estoque nesta loja
  if qryLotes.RecordCount = 0 then begin
     Result := 0;
     Exit;
  end;
  //Tenho estoque nesta loja, mas não o suficiente em só um lote
  if (qryLotes.RecordCount = 1) and (qEstq < quant ) then begin
     Result := 1;
     Exit;
  end;
  //Tenho estoque nesta loja, mas não o suficiente em só um lote
  if (qryLotes.RecordCount = 1) and (qEstq >= quant ) then begin
     Result := 2;
     Exit;
  end;
  //Tenho estoque mas em dois ou mais lotes
  if (qryLotes.RecordCount > 1) then begin
    qEstq := 0;
    While Not qryLotes.Eof do begin
          qEstq := qEstq + qryLotes.FieldByName('quantidade').ASfloat;
          qryLotes.Next;
    end;
    if qEstq >= quant then begin
      Result := 3;
      Exit;
    end;
    if qEstq < quant then begin
      Result := 1;
      Exit;
    end;
  end;

end;

function TfrmVendaBalcao.InformarLoteLancar(const produto, empresa: Integer; const quant: Double):Double;
Var qEstq, qFalta   : Double;
    id_lotes, Where : String;
    res      : Variant;
begin
  qFalta  := quant;
  id_lotes:= '0';

  repeat
    Where:= Format('(empresa=%d) and (produto=%d) and (id Not in (%s)) and (quantidade>0)',[empresa,produto,id_lotes]);
    res  := ShowSearchModal(dbConnect.ZConnection1,'produtos_estoque','lote,quantidade','id,lote,quantidade','lote',True, where );
    if VarIsBlank(res) then Break;
    if res[0] = '' then Break;
    qEstq   := StrToFloat(res[2]);
    AddWithSeparator(id_lotes,res[0],',');
    if qEstq = qFalta then begin
       LancaItem( StrToFloat(res[2]), StrToInt(res[0]), res[1] , IntToStr(empresa));
       qFalta   -= StrToFloat(res[2]);
       Result := qFalta;
       break;
    end;
    if qEstq < qFalta then begin
       LancaItem( StrToFloat(res[2]), StrToInt(res[0]), res[1] , IntToStr(empresa));
       qFalta   -= StrToFloat(res[2]);
       Result := qFalta;
       continue;
    end;
    if qEstq > qFalta then begin
       LancaItem( qFalta , StrToInt(res[0]), res[1] , IntToStr(empresa));
       qFalta   -= StrToFloat(res[2]);
       Result := qFalta;
       break;
    end;
  until qFalta=0;
end;

procedure TfrmVendaBalcao.calculaDesconto;
begin
  edTotal.Value := edPreco.Value * edQuant.Value;
  edTotal.Value := edTotal.Value - CalculaPerc(edDesconto.Value , edTotal.Value);
end;

procedure TfrmVendaBalcao.OpenVenda(id: String);
Var qry : TZQuery;
    Total,vlr : Double;
begin
  qry := ExecSqlQuery(dbConnect.ZConnection1,'Select * from balcao_venda where id=%s',[id]);
  edNumVenda.Text:= qry.FieldByName('id').ASString;
  edNumNF.Text   := qry.FieldByName('numero_nf').ASString;
  edData.Text    := qry.FieldByName('data').ASString;

  qryNFCe.Close;
  qryNFCe.ParamByName('id').AsString := edNumVenda.Text;
  OpenTable( qryNFCe );
  edDestinatario.Text := qryNFCe.FieldByName('destinatario').Asstring;
  edCPF.Text          := qryNFCe.FieldByName('cnpjcpf').Asstring;

  qry := ExecSqlQuery(dbConnect.ZConnection1,'Select bvi.*,p.descricao,pe.lote as slote from balcao_venda_itens bvi '+
                                             'Left Join produtos p ON p.id=bvi.produto '+
                                             'Left Join produtos_estoque pe ON  (p.id=pe.produto and pe.id= bvi.lote) '+
                                             'where balcao_venda = %s Order by id desc ',[id]);
  RxMemoryData1.Close;
  RxMemoryData1.Open;
  Total := 0;
  While not qry.eof do begin
    vlr := qry.FieldByName('preco').AsFloat * qry.FieldByName('quantidade').AsFloat;
    vlr := vlr - CalculaPerc(qry.FieldByName('desconto').AsFloat,vlr);
    total += vlr;
    RxMemoryData1.AppendRecord([RxMemoryData1.RecordCount + 1,
                                qry.FieldByName('produto').ASString,
                                qry.FieldByName('descricao').ASString,
                                qry.FieldByName('quantidade').AsFloat,
                                qry.FieldByName('preco').AsFloat,
                                qry.FieldByName('desconto').AsFloat,
                                Nil,qry.FieldByName('lote').AsInteger,
                                qry.FieldByName('slote').AsString,Nil]);
    qry.Next;
  end;
  Label11.Caption := FormatFloat(',0.00',total);
end;

function TfrmVendaBalcao.GerarCtaReceber(Valor: double; cliente, nome: String; id : Integer):Boolean;
Var nParc,i, nConta : Integer;
    dtVcto  : TDateTime;
    parcelas: TStringList;
begin
  parcelas := gerarParcelas(Valor);
  if parcelas.count = 0 then
     Raise Exception.Create('Parcelamento cancelado pelo usuário.');
  nConta := ZSequence1.GetNextValue;
  for i := 0 to parcelas.count-1 do begin
    dtVcto := StrToDate( ExtractWord(1,parcelas[i],[';']) );
    ExecSql(dbConnect.ZConnection1,'INSERT INTO contas_receber(documento, descricao, data_vencimento, valor_devido,'+
                                   'conta_credito, cliente, parcela, total_parcelas, conta) '+
                                   'Values(%d,''%s'',''%s'',%s,%s,%s,%d,%d,%d )',
                                   [id,
                                    nome,
                                    DateToStr(dtVcto),
                                    ExtractWord(2,parcelas[i],[';']),
                                    conta_credito,
                                    cliente,
                                    i,
                                    parcelas.count,
                                    nConta]);
  end;
end;

procedure TfrmVendaBalcao.IdentificarConsumidor;
begin
  consumidor := TConsumidor.create;
  if Not ShowIdentificarConsumidor( consumidor) then
     FreeAndNil(consumidor);
end;

procedure TfrmVendaBalcao.SaveIdentificacao(id: Integer);
Var id_com : Integer;
begin
    ExecSql(dbConnect.ZConnection1,'INSERT INTO consumidor( nome, documento, cep, endereco, numero, cidade, bairro, uf, complemento) '+
                                   'VALUES ( ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'')',
                                   [consumidor.Nome,consumidor.CPF,consumidor.CEP,consumidor.Endereco,consumidor.Numero,
                                    consumidor.cidade,consumidor.bairro,consumidor.uf,consumidor.complemento]);
    id_com := LastInsertID(dbConnect.ZConnection1,'consumidor_id_seq');
    ExecSql(dbConnect.ZConnection1,'Update balcao_venda Set consumidor=%d Where id=%d',[ id_com ,id]);
end;

function TfrmVendaBalcao.PermiteVendaSemEstoque: Boolean;
begin
  Result := True;
end;

procedure TfrmVendaBalcao.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  IniPropStorage1.Save;
end;

procedure TfrmVendaBalcao.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex:= 0;
  IniPropStorage1.IniFileName:= DefaultINFileName;
  IniPropStorage1.IniSection := 'TfrmVendaBalcao';
  IniPropStorage1.Active     := True;
  IniPropStorage1.Restore;
  conta_credito := getSysParametro('CONTA_CREDITO_VENDA_BALCAO');
  conta_vista   := getSysParametro('CONTA_VENDA_VISTA_BALCAO');
  Panel4.Enabled       := CaixaEstaAberto();
  btAbrirCaixa.Enabled := Not Panel4.Enabled;
  btEntrada.Enabled    := Panel4.Enabled;
  btSangria.Enabled    := Panel4.Enabled;
  btFecharCaixa.Enabled:= Panel4.Enabled;

  lbMsg.Caption := IfThen(Panel4.Enabled,'Caixa aberto','Caixa fechado, efetue a abertura para continuar.');
end;

procedure TfrmVendaBalcao.MostraListaProdutos;
Var ret : Variant;
begin
    ret := ShowSearchModal(dbConnect.ZConnection1,'produtos','id,descricao,preco_venda_varejo','id','descricao',false,'ativo=true');
    if VarIsBlank(ret) then exit;
    edCodigo.Text := ret;
    edCodigo.setfocus;
end;

procedure TfrmVendaBalcao.ConcluirVenda;
Var Total, totVenda : Double;
    recebimento : TRecebimento;
    l , id, id_nfce: Integer;
    qParcela : Double;
    vencto : TDateTime;
    res : Variant;
    senha_id : String;
begin
     if not InputQuery('Identificação de usuário','Por favor digite sua senha de identificação.',True,senha_id) then exit;
     senha_id := ExecSql(dbConnect.ZConnection1,'Select id From empregados Where senha_id=''%s''',[senha_id]);
     if length(senha_id)=0 then Raise exception.create('Senha de identificação inválida!');

     recebimento:= TRecebimento.Create;
     Total      := Somar;
     totVenda   := Total;
     if Not obtemValorRecebimento( Total, recebimento ) then exit;
     if recebimento.Credito > 0 then begin
       qParcela := 1;
       if Not InputFloat('Pagamento com Cartão de crédito','Digite número de parcelas',qParcela) then
          Raise Exception.Create('Recebimento cancelado. Quantidade de parcelas é obrigatório.');
     end;
     try
       ExecSql(dbConnect.ZConnection1,'Begin Work');
       ExecSql(dbConnect.ZConnection1,'INSERT INTO balcao_venda(data,empregado,empresa) VALUES (Now(),%s,%s)',[senha_id,getEmpresaPadrao(meCodigo)]);
       id := LastInsertID(dbConnect.ZConnection1,'balcao_venda_id_seq');
       if recebimento.desconto > 0 then begin
         RxMemoryData1.First;
         While Not RxMemoryData1.Eof do begin
           RxMemoryData1.Edit;
           RxMemoryData1desconto.ASFloat := recebimento.desconto;
           RxMemoryData1.Post;
           RxMemoryData1.Next;
         end;
       end;

       RxMemoryData1.First;
       SetDecimalSeparator('.');
       While Not RxMemoryData1.Eof do begin
         if RxMemoryData1loja_estoque.AsString = getEmpresaPadrao(meCodigo) then begin
            //--GerarHistoricoMovimento(RxMemoryData1produto.AsInteger,RxMemoryData1loja_estoque.AsInteger,'Venda no balcao N. '+IntTostr(id),0.0,RxMemoryData1quantidade.AsFloat);
            BaixarEstoque(RxMemoryData1lote.AsInteger,RxMemoryData1quantidade.AsFloat);
         end;
         ExecSql(dbConnect.ZConnection1,'INSERT INTO balcao_venda_itens(balcao_venda, produto, quantidade, preco, desconto,lote,empresa) '+
                                        'VALUES (%d, %d, %.3f, %.2f, %.2f, %d, %s)',
                                        [id, RxMemoryData1produto.AsInteger, RxMemoryData1quantidade.AsFloat,
                                         RxMemoryData1preco.ASFloat,RxMemoryData1desconto.Asfloat,
                                         RxMemoryData1lote.AsInteger,
                                         getEmpresaPadrao(meCodigo)]);
         RxMemoryData1.Next;
       end;
       //Se pagamento com conta receber
       if recebimento.Carteira > 0 then begin
          res := ShowSearchModal(dbConnect.ZConnection1,'clientes','id,nome','id,nome','nome');
          if VarIsBlank(res) then
             Raise Exception.Create('Para venda em conta corrente é obrigatória a identificação de um cliente.');
          GerarCtaReceber(recebimento.Carteira,res[0],res[1],id );
          ExecSql(dbConnect.ZConnection1,'Update balcao_venda Set cliente=%s Where id=%d',[res[0],id]);
          ExecSql(dbConnect.ZConnection1,'INSERT INTO balcao_caixa(conta, historico, valor, loja, tipo_lancamento,balcao_venda,empregado) '+
                                         'VALUES (%s, ''%s'', %.2f, %s, %d, %d, %s)',
                                         [conta_vista,
                                         'Venda de balcao Conta corrente',
                                          recebimento.Carteira,
                                          getEmpresaPadrao,
                                          tlCarteira,id,senha_id]);
       end else begin;
             //Se pagamento com cartao de credito lança no contas a pagar
             if recebimento.Credito > 0 then begin
               for l := 1 to trunc(qParcela) do begin //CONTA_CREDITO_VENDA_BALCAO
                   vencto := IncDay(Date, 30 * l);
                   ExecSql(dbConnect.ZConnection1,'INSERT INTO contas_receber(documento, descricao, data_vencimento, valor_devido,'+
                                                  'conta_credito, cliente, parcela, total_parcelas) '+
                                                  'Values(%d,''%s'',''%s'',%.2f,%s,%d,%d,%d )',
                                                  [id,
                                                   'Venda de balcao com cartao de credito',
                                                   DateToStr(vencto),
                                                   recebimento.Credito / trunc(qParcela),
                                                   conta_credito,
                                                   0,
                                                   l,
                                                   trunc(qParcela)]);
               end;
             end;
             if recebimento.Total > 0 then
                ExecSql(dbConnect.ZConnection1,'INSERT INTO balcao_caixa(conta, historico, valor, loja, tipo_lancamento,balcao_venda,empregado) '+
                                              'VALUES (%s, ''%s'', %.2f, %s, %d, %d,%s)',
                                              [conta_vista,
                                               Format('Venda de balcao (N° %d)',[id]),
                                               totVenda- CalculaPerc(recebimento.desconto,totVenda),
                                               getEmpresaPadrao,
                                               tlTotal,id,senha_id]);
             if recebimento.Dinheiro > 0 then
                ExecSql(dbConnect.ZConnection1,'INSERT INTO balcao_caixa(conta, historico, valor, loja, tipo_lancamento,balcao_venda,empregado) '+
                                          'VALUES (%s, ''%s'', %.2f, %s, %d, %d,%s)',
                                          [conta_vista,
                                           'Venda de balcao com pgto em Dinheiro',
                                           recebimento.Dinheiro,
                                           getEmpresaPadrao,
                                           tlDinheiro,id,senha_id]);
             if recebimento.Debito > 0 then
                ExecSql(dbConnect.ZConnection1,'INSERT INTO balcao_caixa(conta, historico, valor, loja, tipo_lancamento,balcao_venda,empregado) '+
                                            'VALUES (%s, ''%s'', %.2f, %s, %d, %d,%s)',
                                            [conta_vista,
                                             'Venda de balcao com pgto em Cartão Débito',
                                             recebimento.Debito,
                                             getEmpresaPadrao,
                                             tlDebito,id,senha_id]);
             if recebimento.Credito > 0 then
                  ExecSql(dbConnect.ZConnection1,'INSERT INTO balcao_caixa(conta, historico, valor, loja, tipo_lancamento,balcao_venda,empregado) '+
                                              'VALUES (%s, ''%s'', %.2f, %s, %d, %d,%s)',
                                              [conta_vista,
                                               Format('Venda de balcao com pgto em Cartão Crédito %d parcelas',[trunc(qParcela)]),
                                               recebimento.Credito,
                                               getEmpresaPadrao,
                                               tlCredito,id,senha_id]);
             if recebimento.Troco > 0 then
                ExecSql(dbConnect.ZConnection1,'INSERT INTO balcao_caixa(conta, historico, valor, loja, tipo_lancamento,balcao_venda,empregado) '+
                                              'VALUES (%s, ''%s'', %.2f, %s, %d, %d,%s)',
                                              [conta_vista,
                                               'Venda de balcao Troco',
                                               recebimento.Troco,
                                               getEmpresaPadrao,
                                               tlTroco,id,senha_id]);
             if recebimento.Carteira > 0 then
                ExecSql(dbConnect.ZConnection1,'INSERT INTO balcao_caixa(conta, historico, valor, loja, tipo_lancamento,balcao_venda,empregado) '+
                                              'VALUES (%s, ''%s'', %.2f, %s, %d, %d)',
                                              [conta_vista,
                                               'Venda de balcao Conta corrente',
                                               recebimento.Carteira,
                                               getEmpresaPadrao,
                                               tlCarteira,id,senha_id]);
             if recebimento.Cheque > 0 then
                  ExecSql(dbConnect.ZConnection1,'INSERT INTO balcao_caixa(conta, historico, valor, loja, tipo_lancamento,balcao_venda,empregado) '+
                                                'VALUES (%s, ''%s'', %.2f, %s, %d, %d)',
                                                [conta_vista,
                                                 'Venda de balcao Cheque',
                                                 recebimento.Cheque,
                                                 getEmpresaPadrao,
                                                 tlCheque,id,senha_id]);
       end;
       ExecSql(dbConnect.ZConnection1,'Commit');
       //if Not ReadBolDefaultIni( 'configuracoes', 'ckbNaoImprimeTicket_Checked',False) then
       //   ImprimirComprovante( id );
       if Not ReadBolDefaultIni( 'configuracoes', 'ckbNaoImprimeTicket_Checked',False) then begin
          InicializaConfigNFCe( ACBrNFe1, StrToInt(getEmpresaPadrao( meCodigo )) );
          if consumidor <> nil then
             SaveIdentificacao(id);
           InicializaConfigNFCe( ACBrNFe1, StrToInt(getEmpresaPadrao( meCodigo )) );
          id_nfce := GerarNFCeFromComanda(dbConnect.ZConnection1,id, 0);
          GerarXMLNFCe( id_nfce , ACBrNFe1);
          AutorizarNFCe( id_nfce );
          ImprimirNFCe( id_nfce );
       end;

       RxMemoryData1.Close;
       RxMemoryData1.Open;
       FreeAndNil(Consumidor);
       ckbManterDesconto.Checked := True;
       Limpa;
       lbTotal.Caption := '0,00';
       PageControl1.PageIndex := 0;
       edCodigo.setfocus;
       RestoreDecimalSeparator;
     Except
       RestoreDecimalSeparator;
       ExecSql(dbConnect.ZConnection1,'RollBack');
       Raise;
     end;
end;

procedure TfrmVendaBalcao.LocalizarProduto;
var Query : TZQuery;
begin
  Query := ExecSqlQuery(dbConnect.ZConnection1,'Select * from produtos where codigo_barras=''%s'' and ativo=true',[edCodigo.Text]);
  if Query.Eof and Query.Bof then
     Query := ExecSqlQuery(dbConnect.ZConnection1,'Select * from produtos where id=%s and ativo=true',[edCodigo.Text]);
  if Query.Eof and Query.Bof then
     Raise exception.Create('Produto não encontrado.');
  edCodigo.Text       := Query.fieldByName('codigo_barras').AsString;
  lbDescricao.Caption := Query.fieldByName('id').AsString+'-'+Query.fieldByName('descricao').AsString;
  if rbPrecoVarejo.Checked then
     edPreco.Value       := Query.fieldByName('preco_venda_varejo').AsFloat;
  if rbPrecoAtacado.Checked then
     edPreco.Value       := Query.fieldByName('preco_venda_atacado').AsFloat;
  if ckbManterDesconto.Checked then
     edQuant.SetFocus
  else
     edDesconto.SetFocus;
  calculaDesconto;
end;

procedure TfrmVendaBalcao.AlterarQuantidade;
begin

end;

function TfrmVendaBalcao.Somar: double;
Var arTotal : TArDouble;
begin
    arTotal:= TotalizarColunas(RxMemoryData1,[6]);
    Result := arTotal[0];
    lbTotal.Caption:= FormatMoney(Result);
end;

procedure TfrmVendaBalcao.CancelarItem;
Var item : Double;
begin
    if not InputFloat('Cancela item','Digite o n° do item',item,0,RxMemoryData1.RecordCount) then exit;
    if not RxMemoryData1.Locate('item',item,[]) then exit;
    RxMemoryData1.Delete;

end;

procedure TfrmVendaBalcao.LancaItem(const quant: Double; const lote: Integer;
  const slote, empresa: String);
begin
  if quant = 0 then
     Raise Exception.Create('Erro : Quantidade esta zerada.');
  RxMemoryData1.AppendRecord([RxMemoryData1.RecordCount +1,
                              ExtractWord(1,lbDescricao.Caption,['-']),
                              ExtractWord(2,lbDescricao.Caption,['-']),
                              quant,
                              edPreco.Value,
                              0,
                              Nil,
                              lote,
                              slote,
                              empresa]);
end;

procedure TfrmVendaBalcao.Limpa;
Begin
   edTotal.Value       := 0;
   edCodigo.Text       := '';
   edPreco.Value       := 0;
   edQuant.Value       := 1;
   if Not ckbManterDesconto.Checked then edDesconto.Value := 0;
   lbDescricao.Caption := '';
   edCodigo.SetFocus;;
end;

procedure TfrmVendaBalcao.ImprimirComprovante(id: Integer);
begin
  if PageControl1.ActivePageIndex = 1 then begin
     ImprimirNFCe( StrToInt(edNumNF.Text) );
  end;
end;

function TfrmVendaBalcao.CaixaEstaAberto: Boolean;
var Query : TZQuery;
    sql   : String;
begin
  Result:= True;
  Sql   := 'Select * From balcao_caixa ';
  Sql   += 'Where tipo_lancamento in (1,8) and cast(data as date) = CURRENT_DATE and loja=%s ';
  Sql   += 'Order by id desc';
  Query := ExecSqlQuery(dbConnect.ZConnection1,Sql,[ getEmpresaPadrao(meCodigo)]);
  Result := (Query.FieldByName('tipo_lancamento').AsInteger = 1);
end;

function TfrmVendaBalcao.GerarXMLNFCe(nfce: Integer; ACBrNFe: TACBrNFe): Boolean;
Var itens     : TDetCollectionItem;
    nItem     : Integer;
    ok        : Boolean;
    totTrib, totNota, totProd, totDesconto : Currency;
    nf : NotaFiscal;
    qryNf, qryItensNf,qryEmpresa : TZQuery;
begin
  Result := False;
  StartWait;
  try
     SetDecimalSeparator;
     ACBrNFe.NotasFiscais.Clear;
     nf := ACBrNFe.NotasFiscais.Add;
     qryEmpresa := ExecSqlQuery(dbConnect.ZConnection1,'Select * From empresa Where id=%s Order by id desc',[getEmpresaPadrao(meCodigo)]);
     qryNf      := ExecSqlQuery(dbConnect.ZConnection1,'Select * From nfce Where id=%d',[ nfce ]);
     qryItensNf := ExecSqlQuery(dbConnect.ZConnection1,'Select * From nfce_itens Where nfce=%d Order by id',[ nfce ]);

     {IDE}

     nf.NFe.Ide.cUF       := 41;
     nf.NFe.Ide.cNF       := nfce;
     nf.NFe.Ide.natOp     := qryNf.FieldByname('descrnatoper').AsString;

     nf.NFe.Ide.indPag    := ipVista;//ipVista, ipPrazo, ipOutras
     nf.NFe.Ide.modelo    := 65;
     nf.NFe.Ide.serie     := 1;
     nf.NFe.Ide.nNF       := qryNf.FieldByname('numeroctlform').AsInteger;
     nf.NFe.Ide.dEmi      := Now();//qryNf.FieldByname('dataemissao').AsDateTime;
     nf.NFe.Ide.dSaiEnt   := Now();//qryNf.FieldByname('datasaida').AsDateTime;
     nf.NFe.Ide.tpNF      := StrToTpNF(ok,IfThen(qryNf.FieldByname('entradasaida').AsString='E','0','1'));//   tnSaida;//TpcnTipoNFe (tnEntrada, tnSaida);
     nf.NFe.Ide.cMunFG    := 4106902; //getCodigoMun(qryEmpresa.FieldByname('uf').AsString,qryEmpresa.FieldByname('cidade').AsString);//4106902; // Curitiba//IntToStr(nf.NFe.Ide.
     nf.NFe.Ide.idDest    := doInterna;//(doInterna, doInterestadual, doExterior);
     //nfe.NFe.Ide.NFref     := Nil;
     nf.NFe.Ide.tpImp     := tiNFCe;//(tiSemGeracao, tiRetrato, tiPaisagem, tiSimplificado,
                                       //tiNFCe, tiMsgEletronica, tiNFCeA4);
     nf.NFe.Ide.tpEmis    := ACBrNFe.Configuracoes.Geral.FormaEmissao;//teNormal;//(teNormal, teContingencia, teSCAN, teDPEC, teFSDA, teSVCAN, teSVCRS, teSVCSP, teOffLine);
     if nf.NFe.Ide.tpEmis <> teNormal then begin
        nf.NFe.Ide.dhCont := qryEmpresa.FieldByname('nfe_datahora_contingencia').AsDateTime;
        nf.NFe.Ide.xJust  := qryEmpresa.FieldByname('nfe_motivo_contingencia').AsString;
     end;
     //nfe.NFe.Ide.cDV       := automatico;
     nf.NFe.Ide.tpAmb     := ACBrNFe.Configuracoes.WebServices.Ambiente;
     //taHomologacao;//TpcnTipoAmbiente = (taProducao, taHomologacao);
     nf.NFe.Ide.finNFe    := fnNormal;//TpcnFinalidadeNFe = fnNormal, fnComplementar, fnAjuste, fnDevolucao
     nf.NFe.Ide.procEmi   := peAplicativoContribuinte;//TpcnProcessoEmissao = (peAplicativoContribuinte, peAvulsaFisco, peAvulsaContribuinte, peContribuinteAplicativoF
     nf.NFe.Ide.verProc   := dbConnect.RxVersionInfo1.FileVersion;
     nf.NFe.Ide.indFinal  := cfConsumidorFinal;//(cfNao, cfConsumidorFinal);
     nf.NFe.Ide.indPres   := pcPresencial;//(pcNao, pcPresencial, pcInternet, pcTeleatendimento, pcEntregaDomicilio, pcOutros);
    {Emit}
     nf.NFe.Emit.CNPJCPF          := qryEmpresa.FieldByname('cnpj').AsString;
     nf.NFe.Emit.xNome            := qryEmpresa.FieldByname('nome').AsString;
     nf.NFe.Emit.xFant            := qryEmpresa.FieldByname('fantasia').AsString;
     nf.NFe.Emit.EnderEmit.xLgr   := qryEmpresa.FieldByname('logradouro').AsString;
     nf.NFe.Emit.EnderEmit.nro    := qryEmpresa.FieldByname('numero').AsString;
     nf.NFe.Emit.EnderEmit.xCpl   := qryEmpresa.FieldByname('complemento').AsString;
     nf.NFe.Emit.EnderEmit.xBairro:= qryEmpresa.FieldByname('bairro').AsString;
     nf.NFe.Emit.EnderEmit.cMun   := 4106902; //getCodigoMun(qryEmpresa.FieldByname('uf').AsString,qryEmpresa.FieldByname('cidade').AsString);
     nf.NFe.Emit.EnderEmit.xMun   := qryEmpresa.FieldByname('cidade').AsString;
     nf.NFe.Emit.EnderEmit.UF     := qryEmpresa.FieldByname('uf').AsString;
     nf.NFe.Emit.EnderEmit.CEP    := qryEmpresa.FieldByname('cep').AsInteger;
     nf.NFe.Emit.EnderEmit.fone   := qryEmpresa.FieldByname('fone').AsString;

     nf.NFe.Emit.IE       := qryEmpresa.FieldByname('ie').AsString;
     // nao pode nf.NFe.Emit.IEST     := qryNf.FieldByname('inscrestsubtrib').AsString;
     nf.NFe.Emit.IM       := '';
     nf.NFe.Emit.CNAE     := '';
     nf.NFe.Emit.CRT      := StrToCRT(ok,qryEmpresa.FieldByname('crt').AsString);

     {Dest}
     if qryNf.FieldByname('cliente').AsInteger <> 0 then begin
       nf.NFe.Dest.CNPJCPF          := qryNf.FieldByname('cnpjcpf').AsString;
       nf.NFe.Dest.xNome            := qryNf.FieldByname('destinatario').AsString;
       nf.NFe.Dest.EnderDest.xLgr   := ExtractWord(1,qryNf.FieldByname('endereco').AsString,[',']);
       nf.NFe.Dest.EnderDest.nro    := ExtractWord(2,qryNf.FieldByname('endereco').AsString,[',']);
       nf.NFe.Dest.EnderDest.xCpl   := qryNf.FieldByname('complemento').AsString;
       nf.NFe.Dest.EnderDest.xBairro:= qryNf.FieldByname('bairro').AsString;
       nf.NFe.Dest.EnderDest.cMun   := 4106902; //getCodigoMun(qryNf.FieldByname('uf').AsString,qryNf.FieldByname('cidade').AsString);
       nf.NFe.Dest.EnderDest.xMun   := qryNf.FieldByname('cidade').AsString;
       nf.NFe.Dest.EnderDest.UF     := qryNf.FieldByname('uf').AsString;
       if Length(TrimSet(qryNf.FieldByname('cep').AsString,['.',' ','-'])) > 0 then
          nf.NFe.Dest.EnderDest.CEP := qryNf.FieldByname('cep').AsInteger;
       nf.NFe.Dest.EnderDest.fone   := '';
       nf.NFe.Dest.indIEDest        := inNaoContribuinte
     end;

     nItem := 1;
     qryItensNf.First;
     totDesconto := 0;
     totTrib     := 0;
     totNota     := 0;
     totProd     := 0;
     While not qryItensNf.Eof do begin
         itens := nf.NFe.Det.Add;
         itens.Prod.nItem := nItem;
         itens.Prod.cProd := AddChar('0',qryItensNf.FieldByname('produto').AsString,4);
         itens.Prod.cEAN  := '';
         if (qryItensNf.RecNo = 1) and (ACBrNFe.Configuracoes.WebServices.Ambiente=taHomologacao) then
            itens.Prod.xProd := 'NOTA FISCAL EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL'
         else
            itens.Prod.xProd := qryItensNf.FieldByname('descricao').AsString;
         itens.Prod.NCM   := DelChars(DelChars(qryItensNf.FieldByname('ncm').AsString,'.'),'-');
         if Length(Trim(itens.Prod.NCM)) = 0 then
            itens.Prod.NCM := '19022000';
         itens.Prod.EXTIPI:= '';
         itens.Prod.CFOP  := qryItensNf.FieldByname('cfop').AsString;//qryItensNf.FieldByname('cfop_item.AsString;
         itens.Prod.uCom  := qryItensNf.FieldByname('unidade').AsString;//'und';//LowerCase(qryItensNf.FieldByname('unidade').AsString);
         itens.Prod.qCom  := qryItensNf.FieldByname('quantidade').AsCurrency;
         itens.Prod.vUnCom:= qryItensNf.FieldByname('preco_unit').AsCurrency;
         itens.Prod.vProd := RoundABNT(qryItensNf.FieldByname('preco_unit').ASCurrency * qryItensNf.FieldByname('quantidade').ASFloat,-2);
         itens.Prod.cEANTrib:= '';
         itens.Prod.uTrib := qryItensNf.FieldByname('unidade').AsString;
         itens.Prod.qTrib := qryItensNf.FieldByname('quantidade').AsCurrency;
         itens.Prod.vUnTrib:=qryItensNf.FieldByname('preco_unit').AsCurrency;
         itens.Prod.vDesc := RoundABNT(qryItensNf.FieldByname('vlr_desconto').AsCurrency,-2);
         itens.Imposto.ICMS.orig     := StrToOrig(ok,qryItensNf.FieldByname('origem').AsString);
         itens.Imposto.ICMS.CSOSN    := StrToCSOSNIcms(ok,qryItensNf.FieldByname('csosn').AsString);
         itens.Imposto.ICMS.vBC      := qryItensNf.FieldByname('basecalculo').AsCurrency;
         itens.Imposto.ICMS.pICMS    := qryItensNf.FieldByname('aliquotaicms').AsCurrency;
         itens.Imposto.ICMS.vICMS    := qryItensNf.FieldByname('vlr_icms').AsCurrency;
         itens.Imposto.vTotTrib      := RoundTo( getvTotTrib( itens.Prod.NCM, itens.Prod.vProd ), -2 );
         {Totais}
         totTrib                     += itens.Imposto.vTotTrib;
         totDesconto                 += itens.Prod.vDesc;
         totProd                     += itens.Prod.vProd;
         totNota                     += itens.Prod.vProd - itens.Prod.vDesc;
         qryItensNf.Next;
         inc(nItem);
     End;
     with nf.NFe.Total.ICMSTot do begin
          vProd   := RoundABNT(totProd,-2);
          vDesc   := RoundABNT(totDesconto,-2);
          vNF     := RoundABNT(totNota,-2);
          vTotTrib:= totTrib;
     end;
     nf.NFe.Transp.modFrete := mfSemFrete;
     with nf.NFe.pag.Add do begin
         tPag := fpDinheiro;//(fpDinheiro, fpCheque, fpCartaoCredito, fpCartaoDebito, fpCreditoLoja,
                             //fpValeAlimentacao, fpValeRefeicao, fpValePresente, fpValeCombustivel,
                             //fpOutro);
         vPag := totNota;

     end;
     Result := True;
  finally
    RestoreDecimalSeparator;
    StopWait;
  end;
end;

procedure TfrmVendaBalcao.AutorizarNFCe( id_nfce : Integer);
Var sourceFile, destFile, path : String;
    chave_nfe, recibo, status_nfe : String;
Begin
   ACBrNFe1.NotasFiscais.GerarNFe;
   sourceFile := obtemPathSistemaNFCe(tpsTmp ) + OnlyNumber(ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID) + '-nfe.xml';
   ACBrNFe1.NotasFiscais[0].GravarXML;
   StartWait;
   try
      if ACBrNFe1.Configuracoes.Geral.FormaEmissao = teNormal then begin
         ACBrNFe1.Enviar(id_nfce,false,True);
         if ACBrNFe1.NotasFiscais[0].Confirmada then begin
             chave_nfe := ACBrNFe1.NotasFiscais[0].NFe.procNFe.chNFe;
             recibo    := ACBrNFe1.NotasFiscais[0].NFe.procNFe.nProt;
             status_nfe:= 'NFCe Autorizada';
             path      := obtemPathSistemaNFCe(tpsXMLAnoMes, ACBrNFe1.NotasFiscais[0].NFe.Ide.dEmi );
             destFile  := obtemPathSistemaNFCe(tpsXMLAnoMes, ACBrNFe1.NotasFiscais[0].NFe.Ide.dEmi ) +
                           ExtractFileName(sourceFile);
             if FileExists( sourceFile ) then
                CopyFile(sourceFile, destFile);
             if FileExists( destFile ) then
                DeleteFile( sourceFile );
             ExecSql(dbConnect.ZConnection1,'Update nfce Set chave_nfe=''%s'', status_nfe=%s,'+
                                            'numero_recibo=%s Where id=%d',
                                            [chave_nfe,StatusNFe2Str( snfAutorizada ),recibo,id_nfce]);
             ImportaXMLToDBFromStr(dbConnect.ZConnection1,'nfce_xml','nfce',IntToStr(id_nfce),'xml_str',ACBrNFe1.NotasFiscais[0].XML);
         end else
             Raise Exception.Create(ACBrNFe1.NotasFiscais[0].Msg);

      end else begin
          chave_nfe := ACBrNFe1.NotasFiscais[0].NFe.procNFe.chNFe;
          recibo    := ACBrNFe1.NotasFiscais[0].NFe.procNFe.nProt;
          status_nfe:= 'NFCe OffLine';
          ExecSql(dbConnect.ZConnection1,'Update nfce Set chave_nfe=''%s'', status_nfe=''%s'','+
                                         'numero_recibo=%s Where id=%d',
                                         [chave_nfe,StatusNFe2Str( snfContingencia ),recibo,id_nfce]);
          destFile   := obtemPathSistemaNFCe(tpsXMLAnoMes, ACBrNFe1.NotasFiscais[0].NFe.Ide.dEmi ) +
                        ExtractFileName(sourceFile);
          CopyFile(sourceFile,destFile);
          if FileExists(destFile) then
             DeleteFile(sourceFile);
          ImportaXMLToDBFromStr(dbConnect.ZConnection1,'nfce_xml','nfce',IntTostr(id_nfce),'xml_str',ACBrNFe1.NotasFiscais[0].XML);
      end;
      StopWait;
  except
    StopWait;
    Raise;
  end;
end;

procedure TfrmVendaBalcao.ImprimirNFCe(id: Integer);
Var xml, simp : Ansistring;
begin
  InicializaConfigNFCe( ACBrNFe1, StrToInt(getEmpresaPadrao( meCodigo )) );
  simp := obtemImpressoraNFCe;
  ACBrNFe1.DANFE := ACBrNFeDANFCeFortes1;
  if obtemTipoImpressao <> '1' then
     ACBrNFe1.DANFE := ACBrNFeDANFCeFortesA4_1;
  xml := ExportXMLToString(dbConnect.ZConnection1,'nfce_xml','nfce',IntToStr(id),'xml_str');
  ACBrNFe1.NotasFiscais.Clear;
  ACBrNFe1.NotasFiscais.LoadFromString(xml);
  ACBrNFe1.DANFE.MostraPreview := True;
  ACBrNFe1.NotasFiscais.Imprimir;
end;




initialization
 RegisterClass(TfrmVendaBalcao);

end.

{procedure TfrmVendaBalcao.ImprimirComprovante(id: Integer);
const alDir       = 47;
      linhasAfter = 5;
var sTemp, sporta: String;
    Written, i, h, y, w: Integer;
    qryB, qryI, qryC,qryE : TZQuery;
    total, desconto, vlr : Double;
    prn : TPrinterText;
begin
  qryE := ExecSqlQuery(dbConnect.ZConnection1,'Select * from empresa Where id=%s',[getEmpresaPadrao(meCodigo)]);
  sTemp := getImpressoraTicket;
  RLPrinter.PrinterName := sTemp;
  RLLabel3.Caption := 'CNPJ '+qryE.FieldByName('cnpj').ASString;
  RLLabel4.Caption := qryE.FieldByName('logradouro').ASString+','+qryE.FieldByName('numero').ASString;
  RLReport1.Print;
  exit;
  StartWait;
  try
      qryB := ExecSqlQuery(dbConnect.ZConnection1,'Select * from balcao_venda Where id=%d',[id]);
      sTemp := getImpressoraTicket;
      prn := TPrinterText.CreateForImp(sTemp);
      prn.BeginDoc('Impressao do cupom '+qryB.FieldByName('id').AsString);
      prn.selectEmphasized(true);
      prn.printText(0,getEmpresaPadrao(meNome,qryB.FieldByName('empresa').AsString));
      prn.selectEmphasized(false);
      prn.newLine;
      prn.selectEmphasized(true);
      sTemp := 'Loja - '+getEmpresaPadrao(meAbreviacao, qryB.FieldByName('empresa').AsString );//getEmpresaPadrao(meCodigo)+#10;
      prn.printText(0,sTemp);
      prn.newLine;
      sTemp := 'CNPJ '+ExecSql(dbConnect.ZConnection1,'Select cnpj from empresa Where id=%s',[getEmpresaPadrao(meCodigo)]);
      prn.printText(0,sTemp);
      prn.selectEmphasized(false);
      prn.newLine;

      sTemp := 'Data  '+qryB.FieldByName('data').AsString;
      prn.printText(0,sTemp);
      sTemp := 'Recibo N. '+AddChar('0',qryB.FieldByName('id').AsString,5);
      prn.printText(33,sTemp);
      prn.newLine;
      prn.selectEmphasized(true);
      prn.printText(0,'Nao tem valor fiscal');
      prn.selectEmphasized(false);
      prn.newLine;

      sTemp := 'It. Codigo    Descricao           Quant. V.Total';
      prn.printText(0,sTemp);
      prn.newLine;

      qryI := ExecSqlQuery(dbConnect.ZConnection1,'Select distinct bvi.*,simple_unaccent(p.descricao) as descricao,e.lote,p.codigo_barras '+
                                                  'from balcao_venda_itens bvi '+
                                                  'Left Join produtos p ON p.id=bvi.produto '+
                                                  'Left Join produtos_estoque e ON (e.produto=bvi.produto and bvi.lote=e.id) '+
                                                  'Where balcao_venda=%d '+
                                                  'Order by bvi.id',[id]);
      qryI.First;
      i := 1;
      total := 0;
      desconto := 0;
      prn.selectComprimido;
      While not qryI.Eof do begin
        sTemp := AddChar('0',IntTostr(i),3)+' ';
        sTemp += AddChar('0',qryI.FieldByName('codigo_barras').AsString,14)+' ';
        sTemp += AddCharR(#32,Copy(qryI.FieldByName('descricao').AsString,1,40) ,40)+' ';
        prn.printText(0,sTemp);
        prn.newLine;

        sTemp := AddChar(#32,qryI.FieldByName('quantidade').AsString,7)+' ';
        vlr   := qryI.FieldByName('quantidade').AsFloat * qryI.FieldByName('preco').AsFloat;
        sTemp += AddChar(#32,FormatMoney(vlr),6)+' ';

        prn.printText(0,sTemp);
        prn.newLine;

        total += vlr;
        desconto += CalculaPerc(qryI.FieldByName('desconto').AsFloat,vlr);

        qryI.Next;
        inc(i);
      end;
      prn.enviaComando(#27+'P');
      prn.printLinha(35,40);

      sTemp := 'Total parcial';
      prn.printText(0,sTemp);
      sTemp := FormatMoney(total);
      prn.printRightText(alDir,sTemp);
      prn.newLine;

      prn.printText(0,'Desconto');
      prn.printRightText(alDir,FormatMoney(desconto));
      prn.newLine;

      {Pagamento}
    //(tlAbertura=1,tlTotal,tlDinheiro 3 ,tlDebito,tlCredito,tlCarteira,tlTroco,tlFechamento,tlSangria,tlEntrada, tlCheque);
      qryC := ExecSqlQuery(dbConnect.ZConnection1,'Select * from balcao_caixa Where balcao_venda=%d and tipo_lancamento in (3,4,5,10)',[id]);
      While not qryC.Eof do begin
          if qryC.FieldByName('tipo_lancamento').AsInteger = Ord(tlDinheiro) then
             sTemp := 'Dinheiro';
          if qryC.FieldByName('tipo_lancamento').AsInteger = Ord(tlDebito) then
             sTemp := 'Debito';
          if qryC.FieldByName('tipo_lancamento').AsInteger = Ord(tlCredito) then
             sTemp := 'Credito';
          if qryC.FieldByName('tipo_lancamento').AsInteger = Ord(tlCarteira) then
             sTemp := 'Conta corrente';
          if qryC.FieldByName('tipo_lancamento').AsInteger = Ord(tlCheque) then
             sTemp := 'Cheque';

          prn.printText(0,sTemp);
          prn.printRightText(alDir,FormatMoney(qryC.FieldByName('valor').AsFloat));
          prn.newLine;
          qryC.Next;
      end;
      qryC := ExecSqlQuery(dbConnect.ZConnection1,'Select * from balcao_caixa Where balcao_venda=%d and tipo_lancamento=7',[id]);
      sTemp := FormatMoney(0);
      if qryC.RecordCount > 0 then begin
        sTemp := FormatMoney(qryC.FieldByName('valor').AsFloat);
      end;
      prn.printText(0,'Troco');
      prn.printRightText(alDir,sTemp);
      prn.newLine;

      prn.printText(0,'Total');
      prn.printRightText(alDir,FormatMoney(total-desconto));
      prn.newLine;

      prn.printText(0,'Vendedor '+getApelidoVendedor(qryB.FieldByName('empregado').AsInteger));
      if consumidor <> nil then begin
         prn.newLine;
         prn.printText(0,'Nome: '+consumidor.Nome);
         prn.newLine;
         prn.printText(0,'Doc.: '+consumidor.CPF);
         prn.newLine;
         prn.printText(0,'End.: '+consumidor.Endereco+' N.:'+consumidor.Numero);
         prn.newLine;
         prn.printText(0,'Cid.: '+consumidor.cidade+' Uf.:'+consumidor.uf);
         prn.newLine;
         prn.printText(0,'Bairro: '+consumidor.bairro+' CEP.:'+consumidor.CEP);
         prn.newLine;
         prn.printText(0,'Doc.: '+consumidor.complemento);
         SaveIdentificacao(id);
      end;
      prn.newLine(linhasAfter);

      //Corte do papel
      prn.enviaComando(#27+'m');
      prn.EndDoc;
      prn.print;
  finally
    //consumidor.Free;
    StopWait;
  end;
end;
}
