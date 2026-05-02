unit uNFEntrada;

{$mode objfpc}{$H+}

interface

uses
  Classes, windows, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  ComCtrls, StdCtrls, Buttons, EditBtn, Spin, DbCtrls, WAGDBNavigator, rxdbgrid,
  RxVersInfo, rxdbdateedit, rxdbcurredit, rxctrls, rxlookup, db, memds, process,
  IniFiles, ZDataset, ZSqlUpdate, DBGrids, ExtCtrls, Menus, ActnList,
  TDIPageControl, ACBrNFe, ACBrNFeDANFeRLClass, ACBrMail, ACBrConsultaCNPJ;

type

  { TfrmNFEntrada }

  TfrmNFEntrada = class(TForm)
    ACBrNFe1: TACBrNFe;
    ACBrNFeDANFeRL1: TACBrNFeDANFeRL;
    acClose: TAction;
    acLocalizar: TAction;
    ActionList1: TActionList;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    btAplicar: TBitBtn;
    btDelCta: TSpeedButton;
    btDeletarNota: TSpeedButton;
    btDistribuicaoNFe: TSpeedButton;
    btEditaItem: TBitBtn;
    btNovaCta: TSpeedButton;
    btVerXML: TSpeedButton;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    DBDateEdit2: TRxDBDateEdit;
    DBDateEdit3: TRxDBDateEdit;
    DBEdit1: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBMemo1: TDBMemo;
    DBRadioGroup1: TDBRadioGroup;
    dsCtaPagar: TDatasource;
    dsNotasLista: TDataSource;
    dsItens: TDatasource;
    dsNotas: TDatasource;
    edLimit: TComboBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    ImageList1: TImageList;
    imgLancada: TImage;
    imgPendente: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label4: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MenuItem1: TMenuItem;
    PageControl1: TPageControl;
    PageControl2: TPageControl;
    PopupMenu1: TPopupMenu;
    qryCtaPagarbanco_negociado: TStringField;
    qryCtaPagarconta_credito: TLongintField;
    qryCtaPagarconta_debito: TLongintField;
    qryCtaPagardataconta: TDateField;
    qryCtaPagardata_pagamento: TDateField;
    qryCtaPagardata_vencimento: TDateField;
    qryCtaPagardesconto: TFloatField;
    qryCtaPagardescricao: TStringField;
    qryCtaPagardocumento: TStringField;
    qryCtaPagarfornecedor: TLongintField;
    qryCtaPagarid: TLongintField;
    qryCtaPagarid_nf: TLongintField;
    qryCtaPagarjuros: TFloatField;
    qryCtaPagarobservacao: TMemoField;
    qryCtaPagarparcela: TLongintField;
    qryCtaPagartotal_parcelas: TLongintField;
    qryCtaPagarvalor_devido: TFloatField;
    qryCtaPagarvalor_pago: TFloatField;
    qryItenscest: TStringField;
    qryItenscfop: TStringField;
    qryItenscodificacao_fornecedor: TStringField;
    qryItenscodigo_barras: TStringField;
    qryItenscst_cofins: TLongintField;
    qryItenscst_csosn: TLongintField;
    qryItenscst_ipi: TLongintField;
    qryItenscst_pis: TLongintField;
    qryItensdesconto: TCurrencyField;
    qryItensdescricao: TStringField;
    qryItensdescricao_xml: TStringField;
    qryItensestoque_destino: TStringField;
    qryItensid: TLongintField;
    qryItensinfadprod: TMemoField;
    qryItensmodbc: TLongintField;
    qryItensmodbcst: TLongintField;
    qryItensnao_movimenta_estoque: TBooleanField;
    qryItensncm: TStringField;
    qryItensnfci_opc: TStringField;
    qryItensnfentrada: TLongintField;
    qryItensorig: TLongintField;
    qryItenspcofins: TFloatField;
    qryItenspicmsst: TFloatField;
    qryItenspipi: TFloatField;
    qryItenspmvast: TFloatField;
    qryItensppis: TFloatField;
    qryItenspredbc: TFloatField;
    qryItenspredbcst: TFloatField;
    qryItensproduto: TLongintField;
    qryItensp_icms: TFloatField;
    qryItensquantidade: TFloatField;
    qryItensquant_estoque: TFloatField;
    qryItensunidade: TStringField;
    qryItensvalortotal: TFloatField;
    qryItensvalorunitario: TFloatField;
    qryItensvbcicms: TFloatField;
    qryItensvbcipi: TFloatField;
    qryItensvbcst: TFloatField;
    qryItensvbc_cofins: TFloatField;
    qryItensvbc_pis: TFloatField;
    qryItensvcofins: TFloatField;
    qryItensvdesconto: TFloatField;
    qryItensvfrete: TFloatField;
    qryItensvicmsst: TFloatField;
    qryItensvipi: TFloatField;
    qryItensvlr_icms: TFloatField;
    qryItensvlr_unit_estoque: TFloatField;
    qryItensvoutras: TFloatField;
    qryItensvpis: TFloatField;
    qryItensvseguro: TFloatField;
    qryLotesItens: TZQuery;
    qryLotesItensdata_frabricacao: TDateField;
    qryLotesItensdata_vencimento: TDateField;
    qryLotesItensid: TLongintField;
    qryLotesItenslote: TLongintField;
    qryLotesItensnfentrada_itens: TLongintField;
    qryLotesItensnumerolote: TStringField;
    qryLotesItenspmc: TFloatField;
    qryLotesItensquantidade: TFloatField;
    qryLotesItensquantidade_estoque: TFloatField;
    qryNotas: TZQuery;
    qryNotasbairro: TStringField;
    qryNotasbaseicms: TFloatField;
    qryNotasbaseicmssub: TFloatField;
    qryNotascep: TStringField;
    qryNotaschave_nfe: TStringField;
    qryNotascidade: TStringField;
    qryNotascidadetransp: TStringField;
    qryNotascliente_forn: TLongintField;
    qryNotascnpjcpf: TStringField;
    qryNotascnpjtransp: TStringField;
    qryNotascodtransp: TLongintField;
    qryNotascomplemento: TStringField;
    qryNotascrt: TLongintField;
    qryNotasdadosadicionais: TMemoField;
    qryNotasdataemissao: TDateField;
    qryNotasdataentrada: TDateField;
    qryNotasdatahoraentrada: TDateTimeField;
    qryNotasdesconto: TFloatField;
    qryNotasendereco: TStringField;
    qryNotasendtransp: TStringField;
    qryNotasespecievol: TStringField;
    qryNotasfinalidade_nf: TLongintField;
    qryNotasfornecedor: TStringField;
    qryNotasfreteconta: TStringField;
    qryNotasid: TLongintField;
    qryNotasietransp: TStringField;
    qryNotasinscrestadual: TStringField;
    qryNotasinscrestsubtrib: TStringField;
    qryNotaslancada: TBooleanField;
    qryNotasLista: TZQuery;
    qryNotasListadataemissao: TDateField;
    qryNotasListadataentrada: TDateField;
    qryNotasListafornecedor: TStringField;
    qryNotasListaid: TLongintField;
    qryNotasListalancada: TBooleanField;
    qryNotasListanumeronf: TLongintField;
    qryNotasListavalortotalnota: TFloatField;
    qryNotasmarcavol: TStringField;
    qryNotasnatop: TStringField;
    qryNotasnometransp: TStringField;
    qryNotasnumeronf: TLongintField;
    qryNotasnumerovol: TStringField;
    qryNotaspesobrutovol: TFloatField;
    qryNotaspesoliquidovol: TFloatField;
    qryNotasplacaveiculo: TStringField;
    qryNotasquantvolumes: TLongintField;
    qryNotasreservadofisco: TMemoField;
    qryNotasserie: TLongintField;
    qryNotastelefone1: TStringField;
    qryNotasuf: TStringField;
    qryNotasuftransp: TStringField;
    qryNotasufveiculo: TStringField;
    qryNotasvalorcofins: TFloatField;
    qryNotasvalorfrete: TFloatField;
    qryNotasvaloricms: TFloatField;
    qryNotasvaloricmssub: TFloatField;
    qryNotasvaloripi: TFloatField;
    qryNotasvaloroutradesp: TFloatField;
    qryNotasvalorpis: TFloatField;
    qryNotasvalorseguro: TFloatField;
    qryNotasvalortotalnota: TFloatField;
    qryNotasvalortotalprodutos: TFloatField;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    RxDBGrid3: TRxDBGrid;
    RxVersionInfo1: TRxVersionInfo;
    ScrollBox1: TScrollBox;
    ScrollBox2: TScrollBox;
    ScrollBox3: TScrollBox;
    ScrollBox4: TScrollBox;
    SpeedButton1: TSpeedButton;
    btCancelarLancamento: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    StatusBar1: TStatusBar;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton2: TToolButton;
    btImport: TToolButton;
    ToolButton5: TToolButton;
    qryItens: TZQuery;
    qryCtaPagar: TZQuery;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    updNotas: TZUpdateSQL;
    procedure BitBtn4Click(Sender: TObject);
    procedure btAplicarClick(Sender: TObject);
    procedure btDistribuicaoNFeClick(Sender: TObject);
    procedure btEditaItemClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure btDeletarNotaClick(Sender: TObject);
    procedure btCancelarLancamentoClick(Sender: TObject);
    procedure btDelCtaClick(Sender: TObject);
    procedure btNovaCtaClick(Sender: TObject);
    procedure btVerXMLClick(Sender: TObject);
    procedure dsNotasStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShowHint(Sender: TObject; HintInfo: PHintInfo);
    procedure mnMenuLancarClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
    procedure qryItensCalcFields(DataSet: TDataSet);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1TitleClick(Column: TColumn);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure ToolBar1DblClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure btImportClick(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
  private
    procedure btLancarNota(empresa: String);
    procedure CadastrarProduto();
    function  CalculaCMV(Quant_ent, Valor: Currency; var custCompr: Currency;produto: Integer): Currency;
    procedure LoadNota(const id: Integer);
    procedure LancarContasPagar;
    procedure OpenCtaPagar;
    { private declarations }
  public
    { public declarations }
    Order : string;
    procedure RegistraCodigoFornecedorNoSistema;
    procedure AtualizaEstoqueProduto(const empresa : String);
  end;

//const NOTA_FORNECEDOR  = 0;
//      NOTA_DEVOLUCAO   = 1;
//      NOTA_BONIFICACAO = 2;

var
  frmNFEntrada: TfrmNFEntrada;

implementation

{$R *.lfm}

{ TfrmNFEntrada }
                                         //uTipoNF                       //wagNFe
Uses WagVclUtils, udbConnect, DateUtils, uImportarNFe, uEditItemNFEntrada,
  uNovaCtaPagar, pcnConversao, ftpsend, BDSqlUtils, uSearch,
  uUser, ZAbstractRODataset, Math, strutils, sistema_config, uDistribuicaoNFe,
  ACBrUtil;

procedure TfrmNFEntrada.FormResize(Sender: TObject);
begin
  CenterControl(GroupBox1);
  CenterControl(GroupBox2);
  CenterControl(GroupBox3);
  CenterControl(GroupBox4);
  btDeletarNota.Left := ToolBar1.Width - btDeletarNota.Width;
end;

procedure TfrmNFEntrada.FormShowHint(Sender: TObject; HintInfo: PHintInfo);
begin
     StatusBar1.Panels[0].Text := HintInfo^.HintStr;
end;

procedure TfrmNFEntrada.mnMenuLancarClick(Sender: TObject);
begin
   btLancarNota(IntTostr(TMenuItem(Sender).Tag) );//ExtractWord(1,TMenuItem(Sender).Caption,['-']) );
end;

procedure TfrmNFEntrada.PageControl1Change(Sender: TObject);
begin
    FormResize(Nil);
    if (PageControl1.ActivePageIndex = 1) and (DBEdit1.Text <> qryNotasListaid.AsString) then
       LoadNota(qryNotasListaid.asInteger);
end;

procedure TfrmNFEntrada.PageControl2Change(Sender: TObject);
begin
  FormResize(Nil);
end;

procedure TfrmNFEntrada.qryItensCalcFields(DataSet: TDataSet);
begin
  qryItensdesconto.AsCurrency := PorcentagemDe(qryItensvdesconto.AsCurrency,qryItensvalortotal.AsCurrency);
end;

procedure TfrmNFEntrada.RxDBGrid1DblClick(Sender: TObject);
begin
  StartWait;
  try
    LoadNota(qryNotasListaid.asInteger);
    PageControl1.ActivePageIndex:= 1;
  finally
    Stopwait;
  end;
end;

procedure TfrmNFEntrada.LoadNota(const id : Integer);
begin
  imgLancada.Visible := qryNotaslancada.AsBoolean;
  imgPendente.Visible:= Not qryNotaslancada.AsBoolean;
  btNovaCta.Enabled  := Not qryNotaslancada.AsBoolean;
  btDelCta.Enabled   := Not qryNotaslancada.AsBoolean;
  RxDBGrid3.ReadOnly := qryNotaslancada.AsBoolean;;

  qryNotas.Close;
  qryNotas.ParamByName('id').AsInteger := id;
  OpenTable( qryNotas );
  qryItens.Close;
  //qryItens.ParamByName('id').AsInteger := qryNotasid.AsInteger;
  OpenTable( qryItens );
  OpenCtaPagar();
end;

procedure TfrmNFEntrada.OpenCtaPagar;
begin
  qryCtaPagar.Close;
  qryCtaPagar.Sql.Clear;
  if qryNotaslancada.AsBoolean then begin
     qryCtaPagar.Sql.Add('Select * from contas_pagar Where id_nf= :notafiscal');
     qryCtaPagar.ParamByName('notafiscal').AsInteger := qryNotasid.AsInteger;
  end else begin
     qryCtaPagar.Sql.Add('Select * from pre_contas_pagar Where id_nf= :notafiscal');
     qryCtaPagar.ParamByName('notafiscal').AsInteger := qryNotasid.AsInteger;
  end;
  OpenTable( qryCtaPagar );
end;

procedure TfrmNFEntrada.RegistraCodigoFornecedorNoSistema;
Var c : Integer;
    qryProd : TZQuery;
begin
   //Registrar codigo do produto no fornecedor, no sistema
   //1° verifico se esta cadastrado.
   c := StrToIntDef(ExecSql(dbConnect.ZConnection1,'Select count(*) from fornecedor_produto Where fornecedor=%s and produto=%s',[qryNotascliente_forn.AsString,qryItensproduto.AsString]),0);
   if c <= 0 then begin
      ExecSql(dbConnect.ZConnection1,'INSERT INTO fornecedor_produto(produto, fornecedor, codigo_produto,descricao_produto) '+
                                     'VALUES ( %d, %d, ''%s'',''%s'' )',
                                     [qryItensproduto.AsInteger,
                                      qryNotascliente_forn.ASInteger,
                                      qryItenscodificacao_fornecedor.Asstring,
                                      qryItensdescricao_xml.Asstring]);
   end else begin
      ExecSql(dbConnect.ZConnection1,'Update fornecedor_produto set codigo_produto=''%s'',descricao_produto=''%s'' Where produto=%d and fornecedor=%d',
                                     [qryItenscodificacao_fornecedor.Asstring,
                                      ReplaceStr(qryItensdescricao_xml.AsString,'''',''''''),
                                      qryItensproduto.AsInteger,
                                      qryNotascliente_forn.ASInteger]);
   end;
   {Atualiza campos se estiver vazio}
   qryProd := ExecSqlQuery(dbConnect.ZConnection1,'Select codigo_barras,ncm,cest From produtos where id=%d',[qryItensproduto.AsInteger]);
   if Length(qryProd.FieldByName('codigo_barras').AsString) = 0 then
      ExecSql(dbConnect.ZConnection1,'Update produtos Set codigo_barras=''%s'' Where id=%d',
                                     [qryItenscodigo_barras.Asstring,
                                      qryItensproduto.AsInteger]);

   if Length(qryProd.FieldByName('ncm').AsString) = 0 then
      ExecSql(dbConnect.ZConnection1,'Update produtos Set ncm=''%s'' Where id=%d',
                                     [qryItensncm.Asstring,
                                      qryItensproduto.AsInteger]);

   if Length(qryProd.FieldByName('cest').AsString) = 0 then
      ExecSql(dbConnect.ZConnection1,'Update produtos Set cest=''%s'' Where id=%d',
                                     [DelChars(qryItenscest.Asstring,'.'),
                                      qryItensproduto.AsInteger]);
end;

procedure TfrmNFEntrada.AtualizaEstoqueProduto(const empresa : String);
Var qProd : TZquery;
    id : Integer;
    sQuery : String;
begin
   qProd := ExecSqlQuery(dbConnect.ZConnection1,'Select nao_movimenta_estoque from produtos where id=%d',[qryItensproduto.AsInteger]);
   if qProd.FieldByName('nao_movimenta_estoque').AsBoolean then Exit;
   qryLotesItens.Close;
   qryLotesItens.ParamByName('nfentrada_itens').ASInteger := qryItensid.AsInteger;
   OpenTable( qryLotesItens );

   While Not qryLotesItens.EOF do begin
     {Lote já existe ?}
     id := StrtoIntDef(ExecSql(dbConnect.ZConnection1,'Select id From produtos_estoque Where produto=%d and lower(lote)=''%s'' and empresa=%s',
                                          [qryItensproduto.ASInteger,
                                           LowerCase(qryLotesItensnumerolote.ASString),
                                           empresa]),0);
     //Lote já esta cadastrado, Atualiza
     if id > 0 then begin
          {produto=%s and lower(lote)=''%s'' and empresa=%s'}
         SetDecimalSeparator('.');
         try
            sQuery := Format('Update produtos_estoque Set quantidade=quantidade+%f, '+
                                     'data_validade=%s,data_fabricacao=%s,data_entrada=%s where id=%d',
                                     [qryLotesItensquantidade_estoque.AsCurrency,
                                      ReturnDateOrNull(qryLotesItensdata_vencimento.AsDateTime,True),
                                      ReturnDateOrNull(qryLotesItensdata_frabricacao.AsDateTime,True),
                                      ReturnDateOrNull(Date,True),
                                      id]);
              ExecSql(dbConnect.ZConnection1,sQuery);
          finally
            RestoreDecimalSeparator;
          end;
     end;
     //Lote não esta cadastrado, insere novo
     if id <= 0 then begin
        sQuery  := 'INSERT INTO produtos_estoque (produto,lote,data_entrada,quantidade,data_validade,data_fabricacao,empresa) '+
                          'VALUES (%d,''%s'',%s,%.3f,%s,%s,%s)';
        SetDecimalSeparator('.');
        try
        ExecSql(dbConnect.ZConnection1,sQuery,[qryItensproduto.ASInteger,
                                               LowerCase(qryLotesItensnumerolote.AsString),
                                               'CURRENT_TIMESTAMP',
                                               qryLotesItensquantidade_estoque.AsCurrency,
                                               ReturnDateOrNull( qryLotesItensdata_vencimento.AsDateTime,True),
                                               ReturnDateOrNull(qryLotesItensdata_frabricacao.AsDateTime,True),
                                               empresa ]);
        finally
          RestoreDecimalSeparator;
        end;
        id := LastInsertID(dbConnect.ZConnection1,'produtos_estoque_id_seq');
     end;
     GerarHistoricoMovimento(qryNotasnumeronf.ASInteger,
                             qryItensproduto.ASInteger,
                             id,
                             StrToInt(empresa),
                             OM_NOTA_ENTRADA,
                             qryNotasfornecedor.AsString,
                             qryItensquant_estoque.AsCurrency,0);

     EditTable(qryLotesItens);
     qryLotesItenslote.AsInteger := id;
     PostTable(qryLotesItens);
     qryLotesItens.Next;
   end;
   RestoreDecimalSeparator;
end;

procedure TfrmNFEntrada.LancarContasPagar;
Var  sQuery : string;
begin
  SetDecimalSeparator('.');
  qryCtaPagar.First;
  While not qryCtaPagar.Eof do begin
         sQuery := 'INSERT INTO contas_pagar(id_nf, documento, descricao, data_vencimento,';
         sQuery += 'valor_devido, conta_credito,parcela, total_parcelas,fornecedor) ';
         sQuery += 'VALUES (%d, ''%s'', ''%s'', ''%s'', %.2f, %d, %d, %d, %d )';
         ExecSql(dbConnect.ZConnection1,sQuery,[qryCtaPagarid_nf.ASInteger,
                                                qryCtaPagardocumento.AsString,
                                                LeftStr(qryCtaPagardescricao.Asstring,40),
                                                DateToStr(qryCtaPagardata_vencimento.AsDateTime),
                                                qryCtaPagarvalor_devido.AsCurrency,
                                                83,
                                                qryCtaPagar.RecNo,
                                                qryCtaPagar.RecordCount,
                                                qryCtaPagarfornecedor.AsInteger]);
     qryCtaPagar.Next;
  end;
  RestoreDecimalSeparator;
  ExecSql(dbConnect.ZConnection1,'Delete From pre_contas_pagar Where id_nf=%d',[qryCtaPagarid_nf.ASInteger]);
end;

procedure TfrmNFEntrada.RxDBGrid1TitleClick(Column: TColumn);
begin
  qryNotasLista.SortedFields:= Column.FieldName;
  if RxDBGrid1.SortOrder =  smDown then
     qryNotasLista.SortType := stAscending
  else
     qryNotasLista.SortType := stDescending;

{
  Column := RxDBGrid1.Columns[Column.ID+1];
  if pos(Column.FieldName,order) > 0 then
     Order := 'Order by '+Column.FieldName+' desc'
  else
     Order := 'Order by '+Column.FieldName;
  btAplicar.Click();
  }
end;

procedure TfrmNFEntrada.RxDBGrid2DblClick(Sender: TObject);
begin
   //ShowMessage(qryItenscst_csosn.asstring);
   btEditaItem.Click;
end;


procedure TfrmNFEntrada.SpeedButton2Click(Sender: TObject);
Var res : Variant;
begin
   res := ShowSearchModal(dbConnect.ZConnection1,'transportadora','codtransp,nometransp','codtransp,nometransp,cnpjtransp','nometransp',True);
   if VarIsBlank(res) then exit;
   EditTable(qryNotas);
   qryNotascodtransp.AsString := res[0];
   qryNotasnometransp.AsString:= res[1];
   qryNotascnpjtransp.AsString:= res[2];
end;

procedure TfrmNFEntrada.SpeedButton3Click(Sender: TObject);
Var res : Variant;
begin
  {
   res := ShowSearchModal(dbConnect.ZConnection1,'tipo_movimento','id,descricao','id,descricao','descricao',True);
   if VarIsBlank(res) then exit;
   EditTable(qryNotas);
   qryNotasfinalidade_nf.AsString:= res[0];
   qryNotassfinalidade_nf.AsString:= res[1];
   }
end;

procedure TfrmNFEntrada.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  if Panel.Index = 1 then begin
     uUser.DrawUser(StatusBar.Canvas,Rect,uUser.UsuarioAtual.userApelido,uUser.UsuarioAtual.Admin);
  end;

  if Panel.Index = 2 then begin
      uUser.DrawServidor(StatusBar.Canvas,Rect,dbConnect.ZConnection1.HostName);
  end;

end;

procedure TfrmNFEntrada.ToolBar1DblClick(Sender: TObject);
Var qry,qryIt : TZQuery;
    s , xml: string;
    id : Integer;
begin
{
  dbConnect.ZConnection2.Connect;
  SetDecimalSeparator('.');
  qry := ExecSqlQuery(dbConnect.ZConnection2,'SELECT a.FOR_CODIGO,a.ENF_NOTANUMBER, a.ENF_MODELO_NF, a.ENF_SERIE, '+
                                             'a.ENF_EMISSAO, ENF_ENTRADA, o.OPE_DESCRI,a.FOR_CODIGO,'+
                                             'a.ENF_TIPO_FRETE,a.ENF_VLFRETE, a.ENF_VLSEGURO, a.ENF_DESP_ACES,'+
                                             'a.ENF_BASEICMS, a.ENF_VL_ICMS, a.ENF_VLBASESUBTRIB, a.ENF_VL_SUBTRIB,'+
                                             'a.ENF_TOT_PROD, a.ENF_TOT_NOTA, a.ENF_VL_IPI,a.ENF_CANCELADA, '+
                                             'a.ENF_BASE_IPI,a.ENF_VL_DESCTO,a.ENF_CHAVE_NFE, a.ENF_VLPIS, '+
                                             'a.ENF_VLCOFINS,a.ENF_DADOS_ADICIONAIS, '+
                                             'a.ENF_XML '+
                                             'FROM ENF0001 a '+
                                             'Left Join OPE0000 o on o.OPE_CODIGO=a.OPE_CODIGO',[]);
  //
  while not qry.Eof do begin
      s := DelCharss(qry.FieldByname('ENF_DADOS_ADICIONAIS').AsString,#13#10+'"''');
      ExecSql(dbConnect.ZConnection1,'INSERT INTO nfentrada('+
      'fornecedor,cnpjcpf,endereco,cidade,bairro,cep,complemento,uf,telefone1,inscrestadual,'+
            'numeronf, chave_nfe, serie, datahoraentrada,'+
            'dataemissao, dataentrada, natop, cliente_forn, baseicms, valoricms, baseicmssub, valoricmssub,'+
            'valortotalprodutos, valorfrete, valorseguro, valoroutradesp,'+
            'valoripi, valortotalnota, desconto, valorpis, valorcofins,'+
            'freteconta) '+
            'SELECT nome,cnpj,endereco,cidade,bairro,cep,complemento,uf,telefone1,inscestadual,'+
            '%d,''%s'',%d,''%s'',''%s'',''%s'',''%.40s'',''%s'',%f,%f,%f,'+
            '%f,%f,%f,%f,%f,%f,%f,%f,%f,%f ,''%s'' '+
            'FROM fornecedores Where id=%d',
            [qry.FieldByname('ENF_NOTANUMBER').AsInteger,
             qry.FieldByname('ENF_CHAVE_NFE').AsString,
             qry.FieldByname('ENF_SERIE').AsInteger,
             qry.FieldByname('ENF_ENTRADA').AsString+ ' 00:00:00',
             qry.FieldByname('ENF_EMISSAO').AsString,
             qry.FieldByname('ENF_ENTRADA').AsString,
             qry.FieldByname('OPE_DESCRI').AsString,
             qry.FieldByname('FOR_CODIGO').AsString,
             qry.FieldByname('ENF_BASEICMS').AsCurrency,
             qry.FieldByname('ENF_VL_ICMS').AsCurrency,
             qry.FieldByname('ENF_VLBASESUBTRIB').AsCurrency,
             qry.FieldByname('ENF_VL_SUBTRIB').AsCurrency,
             qry.FieldByname('ENF_TOT_PROD').AsCurrency,
             qry.FieldByname('ENF_VLFRETE').AsCurrency,
             qry.FieldByname('ENF_VLSEGURO').AsCurrency,
             qry.FieldByname('ENF_DESP_ACES').AsCurrency,
             qry.FieldByname('ENF_VL_IPI').AsCurrency,
             qry.FieldByname('ENF_TOT_NOTA').AsCurrency,
             qry.FieldByname('ENF_VL_DESCTO').AsCurrency,
             qry.FieldByname('ENF_VLPIS').AsCurrency,
             qry.FieldByname('ENF_VLCOFINS').AsCurrency,
             qry.FieldByname('ENF_TIPO_FRETE').AsString,
             qry.FieldByname('FOR_CODIGO').AsInteger]);
       id := LastInsertID(dbConnect.ZConnection1,'nfentrada_id_seq');
       xml:= RemoverDeclaracaoXML(qry.FieldByname('ENF_XML').AsString);
       xml:= '<?xml version="1.0" encoding="UTF-8"?>'+ DelCharss(xml,#10#13);
       ImportaXMLToDBFromStr(dbConnect.ZConnection1,'nfentrada_xml','nfentrada',IntTostr(id),'xml_str',xml);
      qryIt := ExecSqlQuery(dbConnect.ZConnection2,'SELECT a.PRD_REFER, '+
                                                 'a.PRD_DESCRI, a.ENF_QTDE, a.ENF_PRECO, a.ENF_CUSTO, '+
                                                 'a.ENF_IPIALIQ, a.ENF_ICMSALIQ, a.ENF_VLSUBST, a.FOR_CODIGO, '+
                                                 'a.ENF_UNIDADE_TRABALHO, a.PRD_CODIGO, a.ENF_ICMS,'+
                                                 'a.ENF_CFOP, a.ENF_IT_VLIPI, a.ENF_IT_BASEIPI, '+
                                                 'a.ENF_IT_DESCTO, a.ENF_IT_BASEICMS, a.ENF_IT_BASESUBTRIB, a.ENF_IT_VALFRETE,'+
                                                 'a.ENF_IT_VLSEGURO, a.ENF_IT_VLDESP_ACES, a.ENF_IT_VLSUBTRIB, a.ENF_IT_ALIQSUBTRIB,'+
                                                 'a.ENF_IT_ALIQPIS,'+
                                                 'a.ENF_IT_VLPIS, a.ENF_IT_ALIQCOFINS, a.ENF_IT_VLCOFINS, a.ENF_CST_PIS,'+
                                                 'a.ENF_BASEPIS, a.ENF_CST_COFINS, a.ENF_BASECOFINS, a.USU_CODIGO, a.PRF_REGISTRO,'+
                                                 'a.REPETICAO_REFER, a.STB_TRIBUTACAO, a.CST_PIS, a.CST_COFINS, a.CST_IPI '+
                                                 'FROM ENF_IT01 a Where ENF_IT_NOTANUMBER=%s',
                                                 [qry.FieldByname('ENF_NOTANUMBER').AsString]);
       while not qryIt.Eof do begin
          ExecSql(dbConnect.ZConnection1,'INSERT INTO nfentrada_itens('+
                'nfentrada, produto, descricao, quantidade,'+
                'quant_estoque,valorunitario, valortotal, vlr_unit_estoque,vdesconto, '+
                'vfrete,vseguro,voutras,cfop, cst_csosn, p_icms, vlr_icms,vbcicms, '+
                'vbcst, picmsst, vicmsst,cst_pis, ppis, vbc_pis, vpis, cst_cofins, pcofins, vbc_cofins,'+
                'vcofins, cst_ipi, pipi, vbcipi, vipi)'+
        'VALUES (%d, %s, ''%s'', %f, %f, %f, %f, %f, %f, %f, %f, %f, ''%s'', %s, %f, %f, %f, %f, %f, %f, %s, %f, %f, %f,'+
                '%s,%f,%f,%f, %s, %f, %f, %f)',
                [id,
                 qryIt.FieldByname('PRD_CODIGO').AsString,
                 qryIt.FieldByname('PRD_DESCRI').AsString,
                 qryIt.FieldByname('ENF_QTDE').AsCurrency,
                 qryIt.FieldByname('ENF_UNIDADE_TRABALHO').AsCurrency,
                 qryIt.FieldByname('ENF_PRECO').AsCurrency,
                 qryIt.FieldByname('ENF_QTDE').AsCurrency * qryIt.FieldByname('ENF_PRECO').AsCurrency,
                 qryIt.FieldByname('ENF_PRECO').AsCurrency,
                 qryIt.FieldByname('ENF_IT_DESCTO').AsCurrency,
                 qryIt.FieldByname('ENF_IT_VALFRETE').AsCurrency,
                 qryIt.FieldByname('ENF_IT_VLSEGURO').AsCurrency,
                 qryIt.FieldByname('ENF_IT_VLDESP_ACES').AsCurrency,
                 qryIt.FieldByname('ENF_CFOP').AsString,
                 qryIt.FieldByname('STB_TRIBUTACAO').AsString,{CST}
                 qryIt.FieldByname('ENF_ICMSALIQ').AsCurrency,
                 qryIt.FieldByname('ENF_ICMS').AsCurrency,
                 qryIt.FieldByname('ENF_IT_BASEICMS').AsCurrency,
                 qryIt.FieldByname('ENF_IT_BASESUBTRIB').AsCurrency,
                 qryIt.FieldByname('ENF_IT_ALIQSUBTRIB').AsCurrency,
                 qryIt.FieldByname('ENF_IT_VLSUBTRIB').AsCurrency,
                 qryIt.FieldByname('CST_PIS').AsString,
                 qryIt.FieldByname('ENF_IT_ALIQPIS').AsCurrency,
                 qryIt.FieldByname('ENF_BASEPIS').AsCurrency,
                 qryIt.FieldByname('ENF_IT_VLPIS').AsCurrency,
                 qryIt.FieldByname('CST_COFINS').AsString,
                 qryIt.FieldByname('ENF_IT_ALIQCOFINS').AsCurrency,
                 qryIt.FieldByname('ENF_BASECOFINS').AsCurrency,
                 qryIt.FieldByname('ENF_IT_VLCOFINS').AsCurrency,
                 qryIt.FieldByname('CST_IPI').AsString,
                 qryIt.FieldByname('ENF_IPIALIQ').AsCurrency,
                 qryIt.FieldByname('ENF_IT_BASEIPI').AsCurrency,
                 qryIt.FieldByname('ENF_IT_VLIPI').AsCurrency
                 ]);

          qryIt.Next;
       end;

       qry.Next;
   end;
  RestoreDecimalSeparator;
  ExecSql(dbConnect.ZConnection1,'SELECT setval(''nfentrada_id_seq'', (Select Max(id) from nfentrada))',[s]);
  ExecSql(dbConnect.ZConnection1,'SELECT setval(''nfentrada_itens_id_seq'', (Select Max(id) from nfentrada_itens))',[s]);
  ShowMessage('Fim');
  }
end;

procedure TfrmNFEntrada.ToolButton2Click(Sender: TObject);
begin
  ClosePageThisForm(Self);
end;

procedure TfrmNFEntrada.btImportClick(Sender: TObject);
Var id : Integer;
begin
  //   ShowSemAcesso(True);
  id := ImportarNFe;
  if id > 0 then begin
     btAplicar.Click;
     RefreshTable( qryNotasLista );
     ////////if not qryNotasLista.Locate('id',id,[]) then begin
     ////////   MessageDlg('Não localizei a nf, tente manualmente.',mtError,[mbOK],0);
     ////////end else begin
     PageControl1.ActivePageIndex := 1;
     LoadNota( id );
     ////////end;
  end;
end;

procedure TfrmNFEntrada.ToolButton5Click(Sender: TObject);
begin
  if qryNotaslancada.AsBoolean then
     Raise Exception.Create('Não pode ser excluida. Esta nota já foi lançada.');
  ConfirmDelete;
  qryNotas.Delete;
  RefreshTable( qryNotas );
  PageControl2.ActivePageIndex:=0;
  PageControl1.ActivePageIndex:=0;
end;

procedure TfrmNFEntrada.ToolButton8Click(Sender: TObject);
begin
    PostTable(dsNotas.DataSet);
end;

procedure TfrmNFEntrada.ToolButton9Click(Sender: TObject);
begin
   btLancarNota(getEmpresaPadrao(meCodigo));
end;

procedure TfrmNFEntrada.FormCreate(Sender: TObject);
var item : TMenuItem;
    s    : String;
begin
  PageControl2.ActivePageIndex:=0;
  PageControl1.ActivePageIndex:=0;
  FormResize(Nil);
  Caption := Caption + ' - @' +RxVersionInfo1.FileVersion;
  DateEdit1.Date := StartOfTheMonth(Date);
  DateEdit2.Date := EndOfTheMonth(Date);
  Order := 'Order by dataentrada desc';
  RxDBGrid1.ReadOnly := (UsuarioAtual.userApelido <> 'admin');

  {Restrições de acesso}
  btImport.Enabled := CheckAcessModulo(dbConnect.ZConnection1,'TfrmNFEntrada','TfrmImportarNFe') = ACESSO_PERMITIDO;

  {Fim Restrições de acesso}


  PopupMenu1.Items.Clear;
  item := TMenuItem.Create(PopupMenu1);
  s := getEmpresaPadrao(meCodigoAbrev,getEmpresaPadrao(meCodigo));
  item.Caption := 'Lança NF,envia estoque para=>'+s;
  item.OnClick := @mnMenuLancarClick;
  item.Tag     := StrToInt(getEmpresaPadrao(meCodigo));
  PopupMenu1.Items.Add(item);

  s := getEmpresaPadrao(meCodigoAbrev,IntTostr(getEmpresaPadraoNext( StrToInt(getEmpresaPadrao(meCodigo)) ) ));
  if length(s) > 0 then begin
    item := TMenuItem.Create(PopupMenu1);
    item.Caption := 'Lança NF,envia estoque para=>'+s;
    item.Tag     := getEmpresaPadraoNext( StrToInt(getEmpresaPadrao(meCodigo)) );
    item.OnClick := @mnMenuLancarClick;
    PopupMenu1.Items.Add(item);
  end;
  btAplicar.Click;
end;

procedure TfrmNFEntrada.btAplicarClick(Sender: TObject);
Var Where, sdata, limite : String;
begin
  Where := '';
  if RadioButton1.Checked then sdata := 'dataentrada'
  else sdata := 'dataemissao';
  Where := Where + Format('Where %s Between ''%s'' and ''%s''',[sdata,DateEdit1.Text,DateEdit2.Text]);
  limite := '';
  if edLimit.Text = '100' then limite := 'Limit 100'
  else if edLimit.Text = '500' then limite := 'Limit 500'
       else if edLimit.Text = '1000' then limite := 'Limit 1000'
            else if edLimit.Text = 'Sem Limite' then limite := ''
                 else limite := 'Limit '+edLimit.Text;
  qryNotasLista.Close;
  qryNotasLista.Sql.Clear;
  qryNotasLista.Sql.Add('Select id,lancada,numeronf,dataentrada,dataemissao,');
  qryNotasLista.Sql.Add('fornecedor,valortotalnota');
  qryNotasLista.Sql.Add('From nfentrada');
  qryNotasLista.Sql.Add(Where);
  qryNotasLista.Sql.Add(Order);
  qryNotasLista.Sql.Add(Limite);
  OpenTable( qryNotasLista );
end;

procedure TfrmNFEntrada.btDistribuicaoNFeClick(Sender: TObject);
begin
  with TfrmDistribuicaoNFe.Create(Self) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfrmNFEntrada.BitBtn4Click(Sender: TObject);
begin
  ConfirmDelete;//('Voce quer deletar o item atual da Nota fiscal ?');
  qryItens.Delete;
  StartWaitSql;
  try
    qryItens.Close;
    OpenTable( qryItens );
  finally
    StopWaitSql;
  end;
end;

procedure TfrmNFEntrada.btEditaItemClick(Sender: TObject);
begin
  if not EditarItem( qryItensid.AsInteger ) then exit;
  StartWaitSql;
  try
    qryItens.Close;
    OpenTable( qryItens );
  finally
    StopWaitSql;
  end;
end;

procedure TfrmNFEntrada.BitBtn5Click(Sender: TObject);
Var res   : Variant;
    //Where : String;
begin
   res := ShowSearchModal(dbConnect.ZConnection1,'nfentrada','dataentrada,numeronf,fornecedor','id','fornecedor','0=0');//,'dataentrada desc');
   if VarIsBlank(res) then exit;
   PageControl1.OnChange := nil;
   LoadNota(res);
   PageControl1.ActivePageIndex := 1;
   PageControl1.OnChange := @PageControl1Change;
end;

procedure TfrmNFEntrada.btDeletarNotaClick(Sender: TObject);
begin
   if qryNotaslancada.AsBoolean then
     Raise Exception.Create('Esta nota ainda esta marcada como lançada no sistema, cancele a nf primeiro ');
   if MessageDlg('Voce quer deletar esta nota fiscal agora ?',mtConfirmation,[mbNo,mbYes],0) <> mrYes then exit;
   qryNotas.Delete;
   qryCtaPagar.Close;
   ShowMessage('Nota eliminada do sistema.');
end;

procedure TfrmNFEntrada.btCancelarLancamentoClick(Sender: TObject);
Var c      : currency;
    //qryMov : TZQuery;
begin
   if MessageDlg('Voce quer cancelar o lançamento desta NF ?',mtConfirmation,[mbNo,mbYes],0) <> mrYes then exit;
   if Not qryNotaslancada.AsBoolean then
     Raise Exception.Create('Esta nota ainda não foi lançada no sistema.');

   // Verificar se todos os itens estão no estoque
   Try
     ExecSql(dbConnect.ZConnection1,'Begin Work');
     StartWait;
     LoadNota(qryNotasListaid.asInteger);
     SetDecimalSeparator('.');
     qryItens.First;
     While Not qryItens.EOF do begin
         qryLotesItens.Close;
         qryLotesItens.ParamByName('nfentrada_itens').ASInteger := qryItensid.AsInteger;
         OpenTable( qryLotesItens );
         if Not qryItensnao_movimenta_estoque.Asboolean then begin
             While Not qryLotesItens.EOF do begin
                   if qryItensestoque_destino.AsString = 'A' then begin

                   end;
                   if qryItensestoque_destino.AsString = 'N' then begin
                      c := StrToCurrDef(ExecSql(dbConnect.ZConnection1,'Select sum(quantidade) From produtos_estoque Where id=%d',[qryLotesItenslote.ASInteger]),0);
                      if c < qryLotesItensquantidade_estoque.AsCurrency then
                        Raise Exception.CreateFmt('O produto %d do lote %s não tem quantidade suficiente no estoque para fazer o estorno.'+#10+
                                                  'Estoque ->  %.3f'+#10+
                                                  'Estorno ->  %.3f',
                                                  [qryItensproduto.AsInteger,
                                                   LowerCase(qryLotesItensnumerolote.AsString),
                                                   c ,
                                                   qryLotesItensquantidade_estoque.AsCurrency]);
                      SetDecimalSeparator('.');
                      try
                      ExecSql(dbConnect.ZConnection1,'Update produtos_estoque SET quantidade=quantidade-%f Where id=%d',
                                 [qryLotesItensquantidade_estoque.AsCurrency,qryLotesItenslote.ASInteger]);
                      finally
                        RestoreDecimalSeparator;
                      end;
                      GerarHistoricoMovimento(qryNotasnumeronf.ASInteger,
                                              qryItensproduto.ASInteger,
                                              qryLotesItenslote.ASInteger,
                                              StrToInt(getEmpresaPadrao()),
                                              OM_NOTA_ENTRADA,
                                              qryNotasfornecedor.AsString,
                                              0,qryItensquant_estoque.AsCurrency);
                   end;
                   qryLotesItens.Next;
             end;
         end;
        qryItens.Next;
     end;
     RestoreDecimalSeparator;
     qryItens.First;
     EditTable(qryNotas);
     qryNotaslancada.AsBoolean := False;
     PostTable(qryNotas);
     ExecSql(dbConnect.ZConnection1,'Commit');
     LoadNota(qryNotasid.asInteger);
     StopWait;
     ShowMessage('Cancelamento de NF executado com sucesso.');
   Except
     RestoreDecimalSeparator;
     ExecSql(dbConnect.ZConnection1,'RollBack');
     StopWait;
     Raise;
   end;


end;

procedure TfrmNFEntrada.btDelCtaClick(Sender: TObject);
begin
  if MessageDlg('Deletar conta selecionada ?',mtConfirmation,[mbNo,mbYes],0) <> mrYes then exit;
  qryCtaPagar.Delete;
  OpenCtaPagar;
end;

procedure TfrmNFEntrada.btLancarNota( empresa : String);
//, id, id_lote, quantEstq qryMov,
Var c : Integer;
    cmv, Vlr_P_CMV,despUnit, custCompr, vlrUnitLiq : Currency;
    preco_venda_varejo,preco_venda_atacado,preco_venda_consignado : Currency;
    sQuery : String;
    qryProd : TZQuery;
    cC : Currency;
begin
  sQuery := getEmpresaPadrao(meCodigo);
  if sQuery <> empresa then begin
    sQuery := getEmpresaPadrao(meAbreviacao,empresa);
    if MessageDlg('Voce quer efetuar o lançamento desta nota agora ? enviando o estoque para loja '+sQuery,mtConfirmation,[mbNo,mbYes],0) <> mrYes then exit;
  end else
    if MessageDlg('Voce quer efetuar o lançamento desta nota agora ?',mtConfirmation,[mbNo,mbYes],0) <> mrYes then exit;
  LoadNota(qryNotasListaid.AsInteger);
  //verificar erros na nota
  CheckRequiredFields([qryNotasnumeronf,qryNotasdataemissao,qryNotascnpjcpf,
                       qryNotasfornecedor,qryNotasuf,qryNotasserie,qryNotasdataentrada]);
  c := StrToIntDef(ExecSql(dbConnect.ZConnection1,'Select count(*) From nfentrada Where numeronf=%d and serie=%d and limpa_cnpj(cnpjcpf)=limpa_cnpj(''%s'') and id <> %d',
                           [qryNotasnumeronf.AsInteger,
                            qryNotasserie.ASInteger,
                            qryNotascnpjcpf.AsString,
                            qryNotasid.AsInteger]),1);
  //Desabilitado para testes

  if c > 0 then
     Raise Exception.Create('Esta nota já esta lancada no sistema.');
  if qryNotaslancada.AsBoolean then
     Raise Exception.Create('Esta nota já esta lancada no sistema.');

  // Verificar erros nos itens
  //OpenTable( qryItens );
  qryItens.First;
  While Not qryItens.EOF do begin
     CheckRequiredFields([qryItenscfop,qryItenscst_csosn,qryItensvalortotal,qryItensvalorunitario,
                          qryItensquantidade,qryItensquant_estoque]);
     cC := StrToCurrDef(ExecSql(dbConnect.ZConnection1,'Select sum(quantidade_estoque) From nfentrada_itens_lotes Where nfentrada_itens=%d',[ qryItensid.AsInteger]),0);
     if cC <> qryItensquant_estoque.AsCurrency then
        Raise Exception.Createfmt('Erro : Quantidades do estoque divergente, para o produto %d. Verifique estoque e lote',[qryItensproduto.ASInteger]);
     qryItens.Next;
  end;
  qryItens.First;
  StartWaitSql;
  ExecSql(dbConnect.ZConnection1,'Begin Work');
  try
    //qryMov := ExecSqlQuery(dbConnect.ZConnection1,'Select * from tipo_movimento Where id=%d',[qryNotasfinalidade_nf.ASInteger]);
    While Not qryItens.EOF do begin
       //CadastrarProduto();
       RegistraCodigoFornecedorNoSistema();
       AtualizaEstoqueProduto(empresa);
       if CFOPVenda(qryItenscfop.AsString) then begin
          despUnit  := (qryItensvfrete.AsCurrency + qryItensvseguro.AsCurrency +qryItensvoutras.AsCurrency)/qryItensquant_estoque.AsCurrency;
          vlrUnitLiq:= (qryItensvalortotal.AsCurrency - qryItensvdesconto.AsCurrency) / qryItensquant_estoque.AsCurrency;
          Vlr_P_CMV := vlrUnitLiq + (qryItensvipi.AsCurrency/qryItensquant_estoque.AsCurrency) - qryItensvlr_icms.AsCurrency + despUnit;
          custCompr := vlrUnitLiq + (qryItensvipi.AsCurrency/qryItensquant_estoque.AsCurrency)+ despUnit +
                      (qryItensvicmsst.AsCurrency/qryItensquant_estoque.AsCurrency);
          cmv       := CalculaCMV(qryItensquant_estoque.AsCurrency,Vlr_P_CMV,custCompr,qryItensproduto.ASInteger);

       end;
       if CFOPDevolucao(qryItenscfop.AsString) then begin
         cmv       := StrToFloatDef(ExecSql(dbConnect.ZConnection1,'Select cmv From produtos Where id = %d',[qryItensproduto.ASInteger]),0);
         custCompr := StrToFloatDef(ExecSql(dbConnect.ZConnection1,'Select coalesce(preco_compra,0) From produtos Where id = %d',[qryItensproduto.ASInteger]),0);
       end;
       if CFOPBonificacao(qryItenscfop.AsString) then begin
         Vlr_P_CMV := qryItensvlr_icms.AsCurrency * -1;
         custCompr := StrToFloatDef(ExecSql(dbConnect.ZConnection1,'Select coalesce(preco_compra,0) From produtos Where id = %d',[qryItensproduto.ASInteger]),0);
         cmv       := CalculaCMV(qryItensquant_estoque.AsCurrency,Vlr_P_CMV,custCompr,qryItensproduto.ASInteger);
       end;
       SetDecimalSeparator('.');
       sQuery := Format('Update produtos set cmv=%.2f,preco_compra=%.2f Where id=%d',
                         [cmv,custCompr,qryItensproduto.ASInteger]);
       ExecSql(dbConnect.ZConnection1, sQuery );
       RestoreDecimalSeparator;
       qryItens.Next;
    end;
    LancarContasPagar();
    EditTable(qryNotas);
    qryNotaslancada.AsBoolean          := True;
    qryNotasdatahoraentrada.ASDateTime := Now();
    PostTable(qryNotas);
    StopWaitSql;
    ExecSql(dbConnect.ZConnection1,'Commit');
    RestoreDecimalSeparator;
    btAplicar.Click;
    ShowMessage('Lançamento efetuado.');
    LoadNota(qryNotasid.AsInteger);
  except
    RestoreDecimalSeparator;
    StopWaitSql;
    ExecSql(dbConnect.ZConnection1,'ROLLBACK');
    raise;
  end;
end;

procedure TfrmNFEntrada.CadastrarProduto();
var
  id: Integer;
begin
  if qryItensproduto.AsInteger <> 0 then exit;
  ExecSql(dbConnect.ZConnection1,'INSERT INTO produtos (descricao, codigo_barras, unidade, observacao, ncm, origem, '+
  'cest, p_pis, cst_pis, p_cofins, cst_cofins ) '+
  'VALUES(''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',%.2f,''%s'',%.2f,''%s'')',
  [qryItensdescricao.Asstring,
   qryItenscodigo_barras.Asstring,
   'un',
   'Cadastrado automatico na entrada',
   qryItensncm.AsString,
   qryItensorig.AsString,
   qryItenscest.Asstring,
   qryItensppis.AsFloat,
   qryItenscst_pis.Asstring,
   qryItenspcofins.AsFloat,
   qryItenscst_cofins.Asstring
  ]);
  id := LastInsertID(dbConnect.ZConnection1,'produtos_id_seq');
////////  INSERT INTO produto_icms_template
////////(produto, uf_destino, cst_csosn, mod_bc, mod_bc_st, p_icms, p_icms_st, p_mva_st, p_red_bc, p_red_bc_st, fcp, p_red_mvs_sn, preco_max_consumidor, cbenef)
////////VALUES(0, '', false, false, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0.00, '');

end;

procedure TfrmNFEntrada.btNovaCtaClick(Sender: TObject);
var documento, sql: String;
    datavcto: TDateTime;
    valor: double;
begin
  if not obtemNovaCtaPagar(documento, datavcto,valor) then exit;
  sql := 'INSERT INTO pre_contas_pagar(id_nf, documento, descricao, fornecedor, dataconta,'+
         'data_vencimento, valor_devido) '+
         'VALUES (%d, ''%s'', ''%s'', %d, ''%s'', ''%s'', %.2f)';
  SetDecimalSeparator;
  try
  ExecSql(dbConnect.ZConnection1,sql,[qryNotasid.AsInteger,
                                      documento,
                                      copy(qryNotasfornecedor.ASString,1,40),
                                      qryNotascliente_forn.AsInteger,
                                      DateToStr(Date),
                                      DateToStr(datavcto),
                                      valor]);
  finally
    RestoreDecimalSeparator;
  end;
  OpenCtaPagar;
end;

procedure TfrmNFEntrada.btVerXMLClick(Sender: TObject);
Var fileName, localfile : String;
begin
  fileName := qryNotaschave_nfe.AsString + '-nfe.xml';
  localfile := NormalDir(GetTempDir) + fileName;
  ExportXMLToFile(dbConnect.ZConnection1,'nfentrada_xml','nfentrada',qryNotasid.AsString,'xml_str',localfile);
  ShellExecute(0,'open',PChar('file://'+localfile),'','',SW_SHOWNORMAL);
end;

procedure TfrmNFEntrada.SpeedButton1Click(Sender: TObject);
Var fileName, localfile : String;
begin
  InicializaConfigNFe(ACBrNFe1, StrToInt(getEmpresaPadrao(meCodigo)));
  fileName := qryNotaschave_nfe.AsString + '-nfe.xml';
  localfile:= NormalDir(GetTempDir) + fileName;
  ExportXMLToFile(dbConnect.ZConnection1,'nfentrada_xml','nfentrada',qryNotasid.AsString,'xml_str',localfile);
  ACBrNFe1.NotasFiscais.Clear;
  ACBrNFe1.NotasFiscais.LoadFromFile(localfile);
  ACBrNFe1.DANFE.Logo          := '';
  ACBrNFe1.DANFE.ExpandeLogoMarca:= False;
  ACBrNFe1.DANFE.MostraPreview:= True;
  ACBrNFe1.DANFE.ImprimirDANFE();
end;

procedure TfrmNFEntrada.dsNotasStateChange(Sender: TObject);
begin
  ToolButton8.Enabled := (dsNotas.DataSet.State in dsEditModes) ;
end;

procedure TfrmNFEntrada.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  CloseAction := caFree;
end;

function TfrmNFEntrada.CalculaCMV(Quant_ent,Valor: Currency;Var custCompr: Currency; produto: Integer): Currency;
Var Valor_Ent,Valor_Est,Novo_CMV,CMV : Currency;
    custValor_Ent,custValor_Est,Novo_cust,cust : Currency;
    Quant_Estoque : Currency;
Begin
    Quant_Estoque := StrToCurrDef(ExecSql(dbConnect.ZConnection1,'Select sum(quantidade) From produtos_estoque Where produto=%d and quantidade > 0',[qryItensproduto.ASInteger]),0);
    CMV           := StrToCurrDef(ExecSql(dbConnect.ZConnection1,'Select cmv From produtos Where id=%d',[qryItensproduto.ASInteger]),0);
    Cust          := StrToCurrDef(ExecSql(dbConnect.ZConnection1,'Select preco_compra From produtos Where id=%d',[qryItensproduto.ASInteger]),0);
    Valor_Ent     := Quant_Ent * Valor;
    Valor_Est     := Quant_Estoque * CMV;
    custValor_Ent := Quant_Ent * custCompr;
    custValor_Est := Quant_Estoque * Cust;
    if CMV = 0 then Quant_Estoque := 0;
    if ((Quant_Ent+Quant_Estoque) = 0 ) then begin
        Novo_CMV  := CMV;
        Novo_cust := cust;
    end else begin
        Novo_CMV  := (Valor_Ent + Valor_Est)/(Quant_Ent+Quant_Estoque);
        Novo_cust := (custValor_Ent + custValor_Est)/(Quant_Ent+Quant_Estoque);
    end;
    if Valor < 0 then
       Novo_CMV   := CMV + Valor;
    //custCompr := Novo_cust;
    Result    := Novo_Cmv;
end;




end.

