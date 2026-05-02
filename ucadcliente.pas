unit uCadCliente;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, DBDateTimePicker, Forms, Controls,
  Graphics, Dialogs, StdCtrls, ExtCtrls, ComCtrls, DbCtrls, Buttons, ActnList,
  DBActns, ZDataset, ZSqlUpdate, WAGDBNavigator, RLReport, RLParser, rxdbdateedit,
  rxlookup, rxdbcomb, rxmemds, rxtoolbar, rxdbgrid, db, TDIPageControl, EditBtn,
  Menus, CheckLst, ACBrValidador, ACBrCEP, LMessages, LCLType, DBExtCtrls;

type
  TTipoProduto = class
    id   : Integer;
    nome : String;
  end;

  { TfrmCadCliente }

  TfrmCadCliente = class(TForm)
    ACBrCEP1: TACBrCEP;
    acLocalizar: TAction;
    acClose: TAction;
    ActionList1: TActionList;
    Bevel1: TBevel;
    Bevel2: TBevel;
    btAddFoto: TSpeedButton;
    btDelfoto: TSpeedButton;
    btSalvarImagem: TSpeedButton;
    CheckListBox1: TCheckListBox;
    DBDateEdit1: TRxDBDateEdit;
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
    DBEdit24: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBMemo1: TDBMemo;
    DividerBevel1: TDividerBevel;
    DividerBevel2: TDividerBevel;
    dsCtaCliente: TDataSource;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit25: TDBEdit;
    DBNavigator2: TDBNavigator;
    DBNavigator3: TDBNavigator;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    dsContatos: TDatasource;
    DBNavigator1: TDBNavigator;
    dsClientes: TDatasource;
    dsDocumentos: TDataSource;
    dsProdutosCliente: TDataSource;
    dsRepresentantes: TDataSource;
    dsProdutos: TDatasource;
    GroupBox1: TGroupBox;
    GroupBox10: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
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
    Label21: TLabel;
    Label22: TLabel;
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
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    Clientecomdocumentacao: TMenuItem;
    mnSomenteInativos: TMenuItem;
    MenuItem6: TMenuItem;
    mnSomenteAtivos: TMenuItem;
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    PageControl2: TPageControl;
    PopupMenu1: TPopupMenu;
    qryClientesatividade: TLongintField;
    qryClientesbairro: TStringField;
    qryClientescep: TStringField;
    qryClientescidade: TStringField;
    qryClientescidade_ibge: TLongintField;
    qryClientescliente_grupo: TLongintField;
    qryClientescnae: TStringField;
    qryClientescnpj: TStringField;
    qryClientescomplemento: TStringField;
    qryClientescontato: TStringField;
    qryClientescrt: TLongintField;
    qryClientesdatacadastro: TDateField;
    qryClientesdata_lic_sanitaria: TDateField;
    qryClientesemail: TStringField;
    qryClientesendereco: TStringField;
    qryClientesentrega_bairro: TStringField;
    qryClientesentrega_cep: TStringField;
    qryClientesentrega_cidade: TStringField;
    qryClientesentrega_cnpjcpf: TStringField;
    qryClientesentrega_complemento: TStringField;
    qryClientesentrega_endereco: TStringField;
    qryClientesentrega_uf: TStringField;
    qryClientesfantasia: TStringField;
    qryClientesfax: TStringField;
    qryClientesid: TLongintField;
    qryClientesinscestadual: TStringField;
    qryClienteslimite_credito: TFloatField;
    qryClientesnome: TStringField;
    qryClientesobservacao: TMemoField;
    qryClientesplano_contas: TLongintField;
    qryClientesprazo_pagamento: TStringField;
    qryClientesstatus: TStringField;
    qryClientestelefone1: TStringField;
    qryClientestelefone2: TStringField;
    qryClientestabela_preco: TLongintField;
    qryClientestipo_estabelecimento: TLongintField;
    qryClientestransportadora: TLongintField;
    qryClientesuf: TStringField;
    qryClientesvatividade: TStringField;
    qryClientesvcliente_grupo: TStringField;
    qryClientesvtipo_estabelecimento: TStringField;
    qryClientesvtransportadora: TStringField;
    qryClienteswebpage: TStringField;
    qryCtaClienteorigem: TStringField;
    qryDocumentos: TZQuery;
    qryProdutosCliente: TZQuery;
    qryCtaClientebanco_negociado: TStringField;
    qryCtaClientecliente: TLongintField;
    qryCtaClienteconta: TLongintField;
    qryCtaClienteconta_credito: TLongintField;
    qryCtaClienteconta_debito: TLongintField;
    qryCtaClientedataconta: TDateField;
    qryCtaClientedata_pagamento: TDateField;
    qryCtaClientedata_vencimento: TDateField;
    qryCtaClientedesconto: TFloatField;
    qryCtaClientedescricao: TStringField;
    qryCtaClientedocumento: TStringField;
    qryCtaClienteid: TLongintField;
    qryCtaClienteid_nf: TLongintField;
    qryCtaClientejuros: TFloatField;
    qryCtaClienteobservacao: TMemoField;
    qryCtaClienteparcela: TLongintField;
    qryCtaClientetotal_parcelas: TLongintField;
    qryCtaClientevalor_devido: TFloatField;
    qryCtaClientevalor_pago: TFloatField;
    qryProdutosClientedescricao: TStringField;
    qryProdutosClienteproduto: TLongintField;
    qryProdutosClientequantidade: TFloatField;
    qryProdutosClientevalortotal: TFloatField;
    qryRepresentantes: TZQuery;
    qryContatoscliente: TLongintField;
    qryContatosdata_nascimento: TDateField;
    qryContatosfuncao: TStringField;
    qryContatosid: TLongintField;
    qryContatosnome: TStringField;
    qryCtaReceber: TZQuery;
    qryCtaReceberatrazo: TLongintField;
    qryCtaReceberbanco_negociado: TStringField;
    qryCtaRecebercliente: TLongintField;
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
    qryCtaRecebervconta_credito: TStringField;
    qryCtaRecebervdescricao_credito: TStringField;
    qryProdutosbalcao_venda: TLongintField;
    qryProdutosdata: TDateTimeField;
    qryProdutosdesconto: TFloatField;
    qryProdutosdescricao: TStringField;
    qryProdutosempresa: TLongintField;
    qryProdutosid: TLongintField;
    qryProdutoslote: TLongintField;
    qryProdutospreco: TFloatField;
    qryProdutosproduto: TLongintField;
    qryProdutosquantidade: TFloatField;
    qryProdutosvtotal: TFloatField;
    qryRepresentantescliente: TLongintField;
    qryRepresentantesdata_cadastro: TDateField;
    qryRepresentantesrepresentante: TLongintField;
    qryRepresentantesvrepresentante: TStringField;
    RxDBComboBox1: TRxDBComboBox;
    RxDBComboBox2: TRxDBComboBox;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    RxDBGrid3: TRxDBGrid;
    RxDBGrid4: TRxDBGrid;
    RxDBGrid5: TRxDBGrid;
    ScrollBox1: TScrollBox;
    SpeedButton1: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton21: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    WAGDBNavigator1: TWAGDBNavigator;
    qryClientes: TZQuery;
    qryContatos: TZQuery;
    updClientes: TZUpdateSQL;
    qryProdutos: TZReadOnlyQuery;
    updRepresentantes: TZUpdateSQL;
    qryCtaCliente: TZQuery;
    procedure acLocalizarExecute(Sender: TObject);
    procedure btAddFotoClick(Sender: TObject);
    procedure btDelfotoClick(Sender: TObject);
    procedure btSalvarImagemClick(Sender: TObject);
    procedure CheckListBox1ClickCheck(Sender: TObject);
    procedure ClientecomdocumentacaoClick(Sender: TObject);
    procedure DBDateEdit1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShortCut(var Msg: TLMKey; var Handled: Boolean);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure mnSomenteAtivosClick(Sender: TObject);
    procedure mnSomenteInativosClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure qryClientesAfterPost(DataSet: TDataSet);
    procedure qryClientesBeforePost(DataSet: TDataSet);
    procedure qryClientesinscestadualValidate(Sender: TField);
    procedure qryClientesNewRecord(DataSet: TDataSet);
    procedure qryContatosAfterInsert(DataSet: TDataSet);
    procedure qryProdutosCalcFields(DataSet: TDataSet);
    procedure qryRepresentantesNewRecord(DataSet: TDataSet);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure WAGDBNavigator1AfterScroll(Sender: TObject);
  private
    { private declarations }
    AltRestricaoTipoProduto : Boolean;
    procedure LoadTipoProduto;
  public
    { public declarations }
    procedure OpenCliente( KeyValue : Integer);
  end; 

var
  frmCadCliente: TfrmCadCliente;

implementation

{$R *.lfm}

Uses udbConnect, uCadSimples, sistema_config, usendmsgcgm, uConsultaCadastro,
  uPedidoCliente, umain, WagVclUtils, BDSqlUtils, uSearch, Variants, strutils,
  LCLIntf, waggoogleapi, ACBrUtil;

{ TfrmCadCliente }

procedure TfrmCadCliente.FormResize(Sender: TObject);
begin
  CenterControl(GroupBox3);
  CenterControl(GroupBox2);
  CenterControl(GroupBox7);
  CenterControl(GroupBox9);
end;

procedure TfrmCadCliente.FormShortCut(var Msg: TLMKey; var Handled: Boolean);
begin
  if msg.CharCode = VK_F2 then begin
     MenuItem1.Click;
     Handled := True;
  end;
  if msg.CharCode = VK_F3 then begin
     MenuItem2.Click;
     Handled := True;
  end;
  if msg.CharCode = VK_F4 then begin
     MenuItem3.Click;
     Handled := True;
  end;
end;

procedure TfrmCadCliente.MenuItem1Click(Sender: TObject);
var ret : Variant;
begin
  ret := ShowSearchModal(dbConnect.ZConnection1,'clientes','id,nome','id','id',true,WAGDBNavigator1.Where);
  if VarIsBlank(ret) then exit;
  WAGDBNavigator1.KeyValue:= ret;
end;

procedure TfrmCadCliente.MenuItem2Click(Sender: TObject);
var ret : Variant;
begin
  ret := ShowSearchModal(dbConnect.ZConnection1,'clientes','id,nome','id','nome',true,WAGDBNavigator1.Where);
  if VarIsBlank(ret) then exit;
  WAGDBNavigator1.KeyValue:= ret;
end;

procedure TfrmCadCliente.MenuItem3Click(Sender: TObject);
var ret : Variant;
begin
  ret := ShowSearchModal(dbConnect.ZConnection1,'clientes','id,cnpj,nome','id','cnpj',true);
  if VarIsBlank(ret) then exit;
  WAGDBNavigator1.KeyValue:= ret;

end;

procedure TfrmCadCliente.mnSomenteAtivosClick(Sender: TObject);
begin
  //mnSomenteAtivos.Checked:= Not mnSomenteAtivos.Checked;
  if mnSomenteAtivos.Checked then
     WAGDBNavigator1.Where := 'status ilike ''ATIVO'''
  else
     WAGDBNavigator1.Where := 'status ilike ''INATIVO''';
  WAGDBNavigator1.Refresh;
end;

procedure TfrmCadCliente.mnSomenteInativosClick(Sender: TObject);
begin
  //mnSomenteAtivos.Checked:= Not mnSomenteAtivos.Checked;
  if mnSomenteAtivos.Checked then
     WAGDBNavigator1.Where := 'status ilike ''ATIVO'''
  else
     WAGDBNavigator1.Where := 'status ilike ''INATIVO''';
  WAGDBNavigator1.Refresh;
end;

procedure TfrmCadCliente.PageControl1Change(Sender: TObject);
begin
  FormResize(Nil);
  qryRepresentantes.Close;
  OpenTable( qryRepresentantes );
  qryDocumentos.Close;
  OpenTable( qryDocumentos );
  qryCtaCliente.Close;
  OpenTable( qryCtaCliente );
  qryProdutosCliente.close;
  OpenTable( qryProdutosCliente );
end;

procedure TfrmCadCliente.qryClientesAfterPost(DataSet: TDataSet);
Var i : Integer;
    TipoProduto : TTipoProduto;
begin
    if AltRestricaoTipoProduto then begin
       ExecSql(dbConnect.ZConnection1,'Delete From cliente_tipo_produto Where cliente=%d',[qryClientesid.AsInteger]);
       for i := 0 to CheckListBox1.Count -1 do begin
          if Not CheckListBox1.Checked[i] then begin
             TipoProduto := TTipoProduto(CheckListBox1.Items.Objects[i]);
             ExecSql(dbConnect.ZConnection1,'Insert Into cliente_tipo_produto(cliente,tipo_produto) Values(%d,%d)',[qryClientesid.AsInteger, TipoProduto.id]);
          end;
       end;

    end;
    AltRestricaoTipoProduto := False;

    i := qryClientesid.AsInteger;
    WAGDBNavigator1.Refresh;
    WAGDBNavigator1.KeyValue := i;
    WAGDBNavigator1AfterScroll(Nil);
end;

procedure TfrmCadCliente.qryClientesBeforePost(DataSet: TDataSet);
Var SendMSGCGM : TSendMSGCGM;
begin
    if CheckFieldAlterou([qryClientesdata_lic_sanitaria,qryClientestipo_estabelecimento,
                          qryClientesprazo_pagamento,qryClientesemail ]) then begin
       StartWait;
       try

         SendMSGCGM := TSendMSGCGM.Create;
         SendMSGCGM.Representante:= qryRepresentantesrepresentante.AsInteger;
         SendMSGCGM.Mensagem     := Format('{''cli'':%d}',[qryClientesid.AsInteger]);
         SendMSGCGM.Title        := MESSAGE_CLIENTE;
         SendMSGCGM.URL          := getSysParametro('URL_MESSAGE_SMARTPHONE');
         SendMSGCGM.Start;
       finally
         StopWait;
       end;
    end;

end;

procedure TfrmCadCliente.qryClientesinscestadualValidate(Sender: TField);
begin
  if Length(ValidarIE(qryClientesinscestadual.AsString,qryClientesuf.AsString)) > 0 then
     MessageDlg('Validação','Inscrição estadual não é valida. Verifique !',mtError,[mbOK],0);
end;

procedure TfrmCadCliente.qryClientesNewRecord(DataSet: TDataSet);
Var cnpj : String;
    i : Integer;
begin
{
   if not InputQuery('Novo cadastro','Digite o CNPJ ou CPF',cnpj) then Abort;
   cnpj := DelCharss(cnpj,'/.-');
   i := StrToIntDef(ExecSql(dbConnect.ZConnection1,'Select id From clientes Where replace(replace(replace(cnpj,''.'',''''),''/'',''''),''-'','''')=''%s''',[cnpj]),0);
   if i > 0 then begin
      qryClientes.Cancel;
      WAGDBNavigator1.KeyValue:= i;
      Abort;
   end;
   if Length(ValidarCNPJouCPF(cnpj)) > 0 then
      Raise Exception.Create('CNPJ ou CPF com erro.');
   if Length(cnpj) > 12 then
      qryClientescnpj.AsString := FormatarDocumento(docCNPJ,cnpj)
   else
      qryClientescnpj.AsString := FormatarDocumento(docCPF,cnpj);
}
   //Valores default
   qryClientesdatacadastro.AsDatetime := now();
   qryClientesstatus.AsString         := 'ATIVO';
end;

procedure TfrmCadCliente.qryContatosAfterInsert(DataSet: TDataSet);
begin
  qryContatoscliente.AsInteger := qryClientesid.AsInteger;
end;

procedure TfrmCadCliente.qryProdutosCalcFields(DataSet: TDataSet);
begin
  qryProdutosvtotal.Asfloat := qryProdutosquantidade.AsFloat * qryProdutospreco.AsFloat;
end;

procedure TfrmCadCliente.qryRepresentantesNewRecord(DataSet: TDataSet);
var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'empregados','nome','id,nome','nome',true,'funcao in (''REPRESENTANTE'',''SUPERVISOR'')');
  if VarIsBlank(ret) then begin
    qryRepresentantes.Cancel;
    exit;
  end;
  qryRepresentantescliente.AsInteger := qryClientesid.AsInteger;
  qryRepresentantesrepresentante.AsString := ret[0];
  qryRepresentantesvrepresentante.AsString:= ret[1];
  qryRepresentantesdata_cadastro.AsDateTime:= date();
  qryRepresentantes.Post;
end;

procedure TfrmCadCliente.RxDBGrid2DblClick(Sender: TObject);
Var pedido : Integer;
    form : TForm;
begin
  {Localizar e abrir o pedido}
  if qryCtaClienteorigem.AsString = 'NFSAIDA' then
  begin
     pedido := StrToIntDef(ExecSql(dbConnect.ZConnection1,'Select numero_pedio_online From nfsaida Where id=%d',[qryCtaClienteid_nf.AsInteger]),0);
  end else
     pedido := qryCtaClienteid_nf.AsInteger;

  TfrmMain(FindForm(TfrmMain)).TDIPageControl1.CreatePageForm(TfrmPedidoCliente,'Pedido do cliente',21);
  form := FindForm(TfrmPedidoCliente);
  TfrmPedidoCliente(form).ExternOpenPedido(pedido);
end;

procedure TfrmCadCliente.SpeedButton10Click(Sender: TObject);
var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'clientes_grupo','nome','id,nome','nome',true);
  if VarIsBlank(ret) then exit;
  EditTable(qryClientes);
  qryClientescliente_grupo.AsString := ret[0];
  qryClientesvcliente_grupo.AsString:= ret[1];
end;

procedure TfrmCadCliente.SpeedButton11Click(Sender: TObject);
begin
  ShowCadastro('Cadastro de Atividades','atividade',['Código','Descrição'],['id','nome'],[True,False],'id');
end;

procedure TfrmCadCliente.SpeedButton12Click(Sender: TObject);
begin
    ShowCadastro('Cadastro de tipo de estabelecimento','tipo_estabelecimento',['Código','Descrição'],['id','nome'],[True,False],'id');
end;

procedure TfrmCadCliente.SpeedButton13Click(Sender: TObject);
begin
  ShowCadastro('Cadastro de grupo de clientes','clientes_grupo',['Código','Descrição'],['id','nome'],[True,False],'id');

end;

procedure TfrmCadCliente.SpeedButton14Click(Sender: TObject);
var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'transportadora','id,nome','id,nome','nome',true);
  if VarIsBlank(ret) then exit;
  EditTable(qryClientes);
  qryClientestransportadora.AsString := ret[0];
  qryClientesvtransportadora.AsString:= ret[1];
end;

procedure TfrmCadCliente.SpeedButton16Click(Sender: TObject);
var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'unidade_federacao','sigla,nome','sigla','nome',true);
  if VarIsBlank(ret) then exit;
  EditTable(qryClientes);
  qryClientesentrega_uf.ASString := ret;
end;

procedure TfrmCadCliente.SpeedButton17Click(Sender: TObject);
Var s   : String;
begin
    if ACBrCEP1.BuscarPorCEP(qryClientesentrega_cep.AsString) > 0 then begin
      EditTable(qryClientes);
      qryClientesentrega_endereco.AsString := ACBrCEP1.Enderecos[0].Tipo_Logradouro+' '+ ACBrCEP1.Enderecos[0].Logradouro;
      qryClientesentrega_cidade.AsString   := ACBrCEP1.Enderecos[0].Municipio;
      qryClientesentrega_uf.AsString       := ACBrCEP1.Enderecos[0].UF;
      qryClientesentrega_bairro.AsString   := ACBrCEP1.Enderecos[0].Bairro;
      exit;
    end;
    MessageDlg('Não foi possível localizar o CEP',mtError,[mbOk],0);
end;

procedure TfrmCadCliente.SpeedButton18Click(Sender: TObject);
var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'tabela_prazo_pagamento','prazo','prazo','prazo',true);
  if VarIsBlank(ret) then exit;
  EditTable(qryClientes);
  qryClientesprazo_pagamento.AsString := ret;
end;

procedure TfrmCadCliente.SpeedButton1Click(Sender: TObject);
var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'situacao_cadastro','descricao','descricao','descricao',true);
  if VarIsBlank(ret) then exit;
  EditTable(qryClientes);
  qryClientesstatus.AsString := ret;
end;

procedure TfrmCadCliente.SpeedButton2Click(Sender: TObject);
var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'cidades','nome,nome_uf','nome','nome',true,'sigla='+ QuotedStr(qryClientesuf.AsString));
  if VarIsBlank(ret) then exit;
  EditTable(qryClientes);
  qryClientescidade.AsString := ret;
end;

procedure TfrmCadCliente.SpeedButton3Click(Sender: TObject);
Var GoogleMaps : TGoogleMaps;
begin
     GoogleMaps := TGoogleMaps.Create;
     GoogleMaps.Endereco := ExtractWord(1,qryClientesendereco.AsString,[',']);;
     GoogleMaps.Numero   := ExtractWord(2,qryClientesendereco.AsString,[',']);;
     GoogleMaps.Cidade   := qryClientescidade.AsString;
     GoogleMaps.Uf       := qryClientesuf.AsString;
     GoogleMaps.Cep      := qryClientescep.AsString;
     GoogleMaps.Navegador:= nvDefault ;//'firefox.exe -new-tab ';
     GoogleMaps.Execute;
end;

procedure TfrmCadCliente.SpeedButton4Click(Sender: TObject);
var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'unidade_federacao','sigla,nome','sigla','nome',true);
  if VarIsBlank(ret) then exit;
  EditTable(qryClientes);
  qryClientesuf.ASString := ret;
end;

procedure TfrmCadCliente.SpeedButton5Click(Sender: TObject);
Var s   : String;
begin
    if ACBrCEP1.BuscarPorCEP(qryClientescep.AsString) > 0 then begin
      EditTable(qryClientes);
      qryClientesendereco.AsString := ACBrCEP1.Enderecos[0].Tipo_Logradouro+' '+ ACBrCEP1.Enderecos[0].Logradouro;
      qryClientescidade.AsString   := ACBrCEP1.Enderecos[0].Municipio;
      qryClientesuf.AsString       := ACBrCEP1.Enderecos[0].UF;
      qryClientesbairro.AsString   := ACBrCEP1.Enderecos[0].Bairro;
      exit;
    end;
    MessageDlg('Não foi possível localizar o CEP',mtError,[mbOk],0);
end;

procedure TfrmCadCliente.SpeedButton8Click(Sender: TObject);
var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'atividade','id,nome','id,nome','nome',true);
  if VarIsBlank(ret) then exit;
  EditTable(qryClientes);
  qryClientesatividade.AsString := ret[0];
  qryClientesvatividade.AsString:= ret[1];
end;

procedure TfrmCadCliente.SpeedButton9Click(Sender: TObject);
var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'tipo_estabelecimento','id,nome','id,nome','nome',true);
  if VarIsBlank(ret) then exit;
  EditTable(qryClientes);
  qryClientestipo_estabelecimento.AsString := ret[0];
  qryClientesvtipo_estabelecimento.AsString:= ret[1];
end;

procedure TfrmCadCliente.ToolButton12Click(Sender: TObject);
begin
     ClosePageThisForm(Self);
end;

procedure TfrmCadCliente.ToolButton4Click(Sender: TObject);
Var value, AXML : string;
begin
  DeleteFile( GetTempDir(false) + '/consulta-cliente.xml');
  with TfrmConsultaCadastro.Create(Application) do
  begin
     edCNPJ.Text := qryClientescnpj.AsString;
     edUF.Text   := qryClientesuf.AsString;
     btConsultar.Click;
     ShowModal;
     if ModalResult = mrOK then begin
        AXML := LeFileToString(GetTempDir(false) + '/consulta-cliente.xml');
        EditTable(qryClientes);
        qryClientesnome.AsString        := LerTagXML( AXML, 'xNome');
        qryClientesinscestadual.AsString:= LerTagXML( AXML, 'IE');
        qryClientescnpj.AsString        := LerTagXML( AXML, 'CNPJ');
        qryClientesuf.AsString          := UpperCase(LerTagXML( AXML, 'UF'));
        qryClientescnae.AsString        := LerTagXML( AXML, 'CNAE');
        qryClientesendereco.AsString    := UpperCase(LerTagXML( AXML, 'xLgr')) + ',' + UpperCase(LerTagXML( AXML, 'nro'));
        qryClientesbairro.AsString      := UpperCase(LerTagXML( AXML, 'xBairro'));
        qryClientescidade.AsString      := UpperCase(LerTagXML( AXML, 'xMun'));
        qryClientescep.AsString         := UpperCase(LerTagXML( AXML, 'CEP'));
        qryClientescomplemento.AsString := UpperCase(LerTagXML( AXML, 'xCpl'));
        value := UpperCase( LerTagXML( AXML, 'xCpl') );
        qryClientescrt.AsString         := IfThen( Pos('SIMPLES',value) > 0 ,'1','3');
        qryClientescrt.AsString         := IfThen( Pos('NORMAL',value) > 0 ,'3','1');
        qryClientescrt.AsString         := IfThen( Length(value) = 0 ,'-1','1');
     end;
     Free;
  end;
end;

procedure TfrmCadCliente.ToolButton8Click(Sender: TObject);
begin
  ConfirmDelete('Você esta prestes a apagar o cliente atual. Voce quer continuar?');
  qryClientes.Delete;
  WAGDBNavigator1.Refresh;
  WAGDBNavigator1.First;
end;

procedure TfrmCadCliente.WAGDBNavigator1AfterScroll(Sender: TObject);
begin
  OpenCliente(WAGDBNavigator1.KeyValue);
end;

procedure TfrmCadCliente.OpenCliente(KeyValue: Integer);
begin
  qryClientes.Close;
  qryClientes.ParamByName('id').AsInteger := KeyValue;
  OpenTable( qryClientes );
  qryContatos.Close;
  qryContatos.ParamByName('id').AsInteger := KeyValue;
  OpenTable( qryContatos );
  qryProdutos.Close;
  OpenTable( qryProdutos );
  LoadTipoProduto;
end;

procedure TfrmCadCliente.acLocalizarExecute(Sender: TObject);
begin
  MenuItem1.Click;
end;

procedure TfrmCadCliente.btAddFotoClick(Sender: TObject);
Var descricao,extensao : String;
    oid : Integer;
begin
  if Not OpenDialog1.Execute Then exit;
  if not InputQuery('Descrição do documento','Descrição até 80 caracteres',descricao) then exit;
  StartWait;
  try
    oid := ImportFileToServer(dbConnect.ZConnection1,OpenDialog1.FileName);
    ExecSql(dbConnect.ZConnection1,'INSERT INTO cliente_documento('+
                                   'cliente, descricao, extensao, documento) '+
                                   'VALUES (%d, ''%s'', ''%s'', %d)',
                                   [qryClientesid.AsInteger,
                                    descricao,
                                    ExtractFileExt(OpenDialog1.FileName),
                                    oid]);
    RefreshTable( qryDocumentos );
  finally
    StopWait;
  end;
end;

procedure TfrmCadCliente.btDelfotoClick(Sender: TObject);
begin
  ConfirmDelete;
  StartWait;
  try
    deleteFileFromServer(dbConnect.ZConnection1,qryDocumentos.FieldByName('documento').AsInteger);
    qryDocumentos.Delete;
  finally
    StopWait;
  end;
end;

procedure TfrmCadCliente.btSalvarImagemClick(Sender: TObject);
Var filename : String;
begin
  StartWait;
  try
    if Not qryDocumentos.FieldByName('visualizado').Asboolean then begin
       sendMenssageToSmatPhone(qryRepresentantesrepresentante.AsInteger,
                               Format('{''cli'':%d}',[qryClientesid.AsInteger]),
                               MESSAGE_CLIENTE
                               );
    end;
    EditTable(qryDocumentos);
    qryDocumentos.FieldByName('visualizado').Asboolean := True;
    PostTable(qryDocumentos);
    filename := ChangeFileExt(GetTempFilename(GetTempDir,'walg_'),qryDocumentos.FieldByName('extensao').AsString);
    ExportFileFromServer(dbConnect.ZConnection1,qryDocumentos.FieldByName('documento').AsInteger,filename);
    OpenURL(filename);
  finally
    StopWait;
  end;
end;

procedure TfrmCadCliente.CheckListBox1ClickCheck(Sender: TObject);
begin
  EditTable(qryClientes);
  AltRestricaoTipoProduto := True;
end;

procedure TfrmCadCliente.ClientecomdocumentacaoClick(Sender: TObject);
var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'clientes','id,nome','id','nome',true,'id in (Select cliente From cliente_documento Where visualizado=False)');
  if VarIsBlank(ret) then exit;
  OpenCliente( ret );
end;

procedure TfrmCadCliente.DBDateEdit1Click(Sender: TObject);
begin
   EditTable(qryClientes);
end;

procedure TfrmCadCliente.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
   CloseAction := caFree;
end;

procedure TfrmCadCliente.FormCreate(Sender: TObject);
begin
  dbConnect.setImageForDBNavigator(dbnavigator1);
  WAGDBNavigator1.Open;
end;

procedure TfrmCadCliente.LoadTipoProduto;
Var qry, qryC : TZQuery;
    i : integer;
    TipoProduto : TTipoProduto;
begin
  AltRestricaoTipoProduto := False;
  CheckListBox1.Items.Clear;

  qry := ExecSqlQuery(dbConnect.ZConnection1,'Select * from produto_tipo_produto Order by id');
  qryC:= ExecSqlQuery(dbConnect.ZConnection1,'Select tipo_produto from cliente_tipo_produto Where cliente=%d Order by tipo_produto',[qryClientesid.AsInteger]);
  while Not qry.Eof do begin
        TipoProduto := TTipoProduto.Create;
        TipoProduto.id  := qry.FieldByName('id').AsInteger;
        TipoProduto.nome:= qry.FieldByName('nome').AsString;
        i := CheckListBox1.Items.AddObject(qry.FieldByName('nome').AsString,TipoProduto);
        CheckListBox1.Checked[i] := Not qryC.Locate('tipo_produto',qry.FieldByName('id').AsInteger,[]);
        qry.Next;
  end;
end;


end.

object DBDateEdit1: TRxDBDateEdit
  Left = 819
  Height = 23
  Top = 0
  Width = 125
  ButtonWidth = 23
  DialogTitle = 'Select a Date'
  Enabled = False
  Glyph.Data = {
    76060000424D7606000000000000360000002800000014000000140000000100
    2000000000004006000064000000640000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    00000000000000000000000000000000000000000000C9C2BB26C6C3BD55C6C3
    BD55C6C3BD55C6C3BD55C6C3BD55C6C3BD55C6C3BD55C6C3BD55C6C3BD55C6C3
    BD55C6C3BD55C6C3BD55C7C0BA25000000000000000000000000000000000000
    0000C5C1BD3AD4D0CBFCDDDAD5FFDEDBD6FFDEDBD6FFDEDBD6FFDEDBD6FFDEDB
    D6FFDEDBD6FFDEDBD6FFDEDBD6FFDEDBD6FFDEDBD6FFDDDAD5FFD4D1CBFCC4C4
    BB3900000000000000000000000000000000DBD8D3A5F1F0ECFFF1F0ECFFF1F0
    ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0
    ECFFF1F0ECFFF1F0ECFFF1F0ECFFDBD8D1A40000000000000000000000000000
    0000E2E1DDBFF1F0ECFFD4D0CBFFD4D0CBFFE6E4DFFFCECBC5FFE6E4DFFFD4D0
    CBFFD4D0CBFFE6E4DFFFCECBC5FFE6E4DFFFD4D0CBFFD4D0CBFFF1F0ECFFE2E1
    DDBF00000000000000000000000000000000E3E0DBC0F1F0ECFFD4D0CBFFD4D0
    CBFFE6E4DFFFCECBC5FFE6E4DFFFD4D0CBFFD4D0CBFFE6E4DFFFCECBC5FFE6E4
    DFFFD4D0CBFFD4D0CBFFF1F0ECFFE3E0DBC00000000000000000000000000000
    0000E3E0DBC0F1F0ECFFE6E4DFFFE6E4DFFFEDEBE7FFE3E1DCFFEDEBE7FFE6E4
    DFFFE6E4DFFFEDEBE7FFE3E1DCFFEDEBE7FFE6E4DFFFE6E4DFFFF1F0ECFFE3E0
    DBC000000000000000000000000000000000E3E0DBC0F1F0ECFFCECBC5FFCECB
    C5FFE3E1DCFFC7C3BDFFE3E1DCFFCECBC5FFCECBC5FFE3E1DCFFC7C3BDFFE3E1
    DCFFCECBC5FFCECBC5FFF1F0ECFFE3E0DBC00000000000000000000000000000
    0000E3E0DBC0F1F0ECFFE6E4DFFFE6E4DFFFEDEBE7FFE3E1DCFFEDEBE7FFE6E4
    DFFFE6E4DFFFEDEBE7FFE3E1DCFFEDEBE7FFE6E4DFFFE6E4DFFFF1F0ECFFE3E0
    DBC000000000000000000000000000000000E3E0DBC0F1F0ECFFD4D0CBFFD4D0
    CBFFE6E4DFFFCECBC5FFE6E4DFFFD4D0CBFFD4D0CBFFE6E4DFFFCECBC5FFE6E4
    DFFFD4D0CBFFD4D0CBFFF1F0ECFFE3E0DBC00000000000000000000000000000
    0000E3E0DBC0F1F0ECFFD4D0CBFFD4D0CBFFE6E4DFFFCECBC5FFE6E4DFFFD4D0
    CBFFD4D0CBFFE6E4DFFFCECBC5FFE6E4DFFFD4D0CBFFD4D0CBFFF1F0ECFFE3E0
    DBC000000000000000000000000000000000E3E0DBC0F1F0ECFFF1F0ECFFF1F0
    ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0
    ECFFF1F0ECFFF1F0ECFFF1F0ECFFE3E0DBC00000000000000000000000000000
    0000ACAFDFD19099E9FF9099E9FF9099E9FF9099E9FF9099E9FF9099E9FF9099
    E9FF9099E9FF9099E9FF9099E9FF9099E9FF9099E9FF9099E9FF9099E9FFACAF
    DFD100000000000000000000000000000000828AE1E03C4CE7FF3C4CE7FF3C4C
    E7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4C
    E7FF3C4CE7FF3C4CE7FF3C4CE7FF828AE1E00000000000000000000000000000
    0000828AE1E03B4CE6FF3040CDFF3040CDFF3B4CE6FF3C4CE7FF3C4CE7FF3C4C
    E7FF3C4CE7FF3C4CE7FF3C4CE7FF3B4CE6FF3040CDFF3040CDFF3B4CE6FF828A
    E1E000000000000000000000000000000000818AE3D73948DFFF8E90BEFF8D8F
    BFFF3848E0FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3948
    DFFF8C8FBEFF8B8FBEFF3848E0FF818AE4D60000000000000000000000000000
    0000878EE8863C4BE7FFAEADC1FFAEADC1FF3C4CE7FF3C4CE7FF3C4CE7FF3C4C
    E7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4BE7FFAEADC1FFAEADC1FF3C4CE7FF878E
    E7840000000000000000000000000000000000000000878EE886BCBAC2F3BCBA
    C2F37B85E9B67B85E9B67B85E9B67B85E9B67B85E9B67B85E9B67B85E9B67B85
    E9B6BCBAC2F3BCBAC2F3858EE984000000000000000000000000000000000000
    00000000000000000000C7C3BCBCC7C3BDBB0000000000000000000000000000
    000000000000000000000000000000000000C6C3BCBDC7C3BCBC000000000000
    0000000000000000000000000000000000000000000000000000C6C6C609BFBF
    BF08000000000000000000000000000000000000000000000000000000000000
    0000C6C6C609C6C6C60900000000000000000000000000000000
  }
  MaxLength = 10
  PasswordChar = #0
  PopupColor = clWindow
  TabOrder = 1
  Text = '  /  /    '
  OnClick = DBDateEdit1Click
  DataField = 'datacadastro'
  DataSource = dsClientes
end



{ Conta corrente de produtos
Select i.produto,p.descricao,sum(i.quantidade) as quantidade,sum(i.preco_unitario-(i.preco_unitario * i.desconto/100)) as valortotal
from pedido_venda_itens i
Left Join produtos p ON p.id=i.produto
Left Join pedido_venda pv ON pv.id=i.pedido_venda
Where pv.cliente = 1 and pv.status in (1, 3)
Group by i.produto,p.descricao
Order by valortotal desc

Select pv.*,nf.numeroctlform,nf.dataemissao,nf.valortotalprodutos
from pedido_venda pv
left join nfsaida nf on (nf.numero_pedio_online=pv.id and nf.cancelada=false)
Where pv.cliente = 1 and pv.status in (1, 3)
}
