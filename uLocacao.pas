unit uLocacao;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, ShellApi, FileUtil, Forms, Controls, Graphics, Dialogs,
  DBGrids, ComCtrls, StdCtrls, DbCtrls, Buttons, ExtCtrls, ExtDlgs, rxdbdateedit,
  rxdbgrid, ZDataset, ZSqlUpdate, Grids, Menus;

type

  { TfrmLocacao }

  TfrmLocacao = class(TForm)
    btAddComprovante: TBitBtn;
    btDelComprovante: TBitBtn;
    btLancamentos: TBitBtn;
    btLancamentos1: TBitBtn;
    dsLocacaoComprovantes: TDatasource;
    dsEstqLocacao: TDatasource;
    DBDateEdit1: TRXDBDateEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBGrid2: TDBGrid;
    DBNavigator1: TDBNavigator;
    dsLocacao: TDatasource;
    DBEdit1: TDBEdit;
    DBGrid1: TDBGrid;
    dsLocacaoItens: TDatasource;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MenuItem1: TMenuItem;
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    PopupMenu1: TPopupMenu;
    qryEstqLocacaodata_entrada: TDateTimeField;
    qryEstqLocacaodescricao: TStringField;
    qryEstqLocacaoempresa: TLongintField;
    qryEstqLocacaoid: TLongintField;
    qryEstqLocacaolocado: TFloatField;
    qryEstqLocacaolocalizacao: TStringField;
    qryEstqLocacaolote: TStringField;
    qryEstqLocacaopreco: TFloatField;
    qryEstqLocacaoproduto: TLongintField;
    qryEstqLocacaoproduto_estoque: TLongintField;
    qryEstqLocacaoquantidade: TFloatField;
    qryLocacaoComprovantesdescricao: TStringField;
    qryLocacaoComprovantesid: TLongintField;
    qryLocacaoComprovantesitem: TLongintField;
    qryLocacaoComprovanteslocacao: TLongintField;
    qryLocacaoComprovantestipo_arquivo: TStringField;
    qryLocacaoItens: TZQuery;
    qryLocacaobairro: TStringField;
    qryLocacaocep: TStringField;
    qryLocacaocidade: TStringField;
    qryLocacaocomplemento: TStringField;
    qryLocacaocpf: TStringField;
    qryLocacaodata: TDateField;
    qryLocacaodata_termino: TDateField;
    qryLocacaoemail: TStringField;
    qryLocacaoendereco: TStringField;
    qryLocacaoid: TLongintField;
    qryLocacaoItensdata_inicio: TDateField;
    qryLocacaoItensdata_termino: TDateField;
    qryLocacaoItensdescricao: TStringField;
    qryLocacaoItensid: TLongintField;
    qryLocacaoItenslancado: TBooleanField;
    qryLocacaoItenslocacao: TLongintField;
    qryLocacaoItenspgto_antecipado: TBooleanField;
    qryLocacaoItensproduto: TLongintField;
    qryLocacaoItensquantidade: TFloatField;
    qryLocacaoItenssituacao: TLongintField;
    qryLocacaoItensvalor: TFloatField;
    qryLocacaonome: TStringField;
    qryLocacaoobservacao: TMemoField;
    qryLocacaoreg: TStringField;
    qryLocacaotelefone1: TStringField;
    qryLocacaotelefone2: TStringField;
    qryLocacaouf: TStringField;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    SpeedButton1: TSpeedButton;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    qryLocacao: TZQuery;
    qryEstqLocacao: TZQuery;
    qryLocacaoComprovantes: TZQuery;
    ToolButton5: TToolButton;
    updLocacaoItens: TZUpdateSQL;
    updEstqLocacao: TZUpdateSQL;
    procedure btAddComprovanteClick(Sender: TObject);
    procedure btDelComprovanteClick(Sender: TObject);
    procedure btLancamentos1Click(Sender: TObject);
    procedure btLancamentosClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TDBNavButtonType
      );
    procedure FormCreate(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure qryLocacaoAfterOpen(DataSet: TDataSet);
    procedure qryLocacaoAfterScroll(DataSet: TDataSet);
    procedure qryLocacaoItensAfterPost(DataSet: TDataSet);
    procedure qryLocacaoItensBeforeDelete(DataSet: TDataSet);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
  private
    procedure OpenComprovante;
    procedure ReceberLocacao( Total : Double);
    { private declarations }
  public
    { public declarations }
    function SomarItens( NotLancOnly : Boolean = False):Double;
  end;

var
  frmLocacao: TfrmLocacao;

implementation

uses sistema_config, udbConnect, uLocacaoAddItem, uRecebimento, uInputFloat,
  process, uWagCEP, BDSqlUtils, WagVclUtils, uUser, ftpsend, dateutils;

{$R *.lfm}

{ TfrmLocacao }

procedure TfrmLocacao.ToolButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmLocacao.ToolButton5Click(Sender: TObject);
begin
   PostTable(qryLocacao);
end;

procedure TfrmLocacao.qryLocacaoAfterOpen(DataSet: TDataSet);
begin
  OpenTable( qryLocacaoItens );
  OpenTable( qryLocacaoComprovantes );
end;

procedure TfrmLocacao.qryLocacaoAfterScroll(DataSet: TDataSet);
Var vlr : Double;
begin
  vlr := SomarItens;
  Label16.caption := FormatMoney(vlr);
  btLancamentos.Enabled:= SomarItens(True) > 0;
end;

procedure TfrmLocacao.qryLocacaoItensAfterPost(DataSet: TDataSet);
Var vlr : Double;
begin
  vlr := SomarItens;
  Label16.caption := FormatMoney(vlr);
  btLancamentos.Enabled:= SomarItens(True) > 0;
end;

procedure TfrmLocacao.qryLocacaoItensBeforeDelete(DataSet: TDataSet);
Var vlr : Double;
begin
  vlr := SomarItens;
  Label16.caption := FormatMoney(vlr);
  btLancamentos.Enabled:= SomarItens(True) > 0;
end;

procedure TfrmLocacao.RxDBGrid2DblClick(Sender: TObject);
begin
  OpenComprovante;
end;

procedure TfrmLocacao.SpeedButton1Click(Sender: TObject);
Var WagCEP : TWagCEP;
begin
  try
     StartWait;
     WagCEP := TWagCEP.Create;
     WagCEP.CEP:= DBEdit1.Text;
     WagCEP.Execute;
     qryLocacaoendereco.AsString := WagCEP.logradouro;
     qryLocacaobairro.AsString   := WagCEP.bairro;
     qryLocacaocidade.AsString   := WagCEP.cidade;
     qryLocacaouf.AsString       := WagCEP.uf;
  finally
    StopWait;
  end;
end;

procedure TfrmLocacao.ToolButton1Click(Sender: TObject);
begin
  PageControl1.PageIndex:= 1;
  DBEdit3.SetFocus;
  qryLocacao.append;
  qryLocacaodata.AsDateTime := Date;
end;

procedure TfrmLocacao.FormCreate(Sender: TObject);
begin
  OpenTable( qryLocacao );
end;

procedure TfrmLocacao.MenuItem1Click(Sender: TObject);
Var quant : Double;
begin
  if MessageDlg('Voce que devolver a quantidade não locada para o estoque de origem ?',mtConfirmation,[mbNo,mbYes],0) <> mrYes Then Exit;
  try
     ExecSql(dbConnect.ZConnection1,'Begin Work');
    SetDecimalSeparator;
    quant := qryEstqLocacaoquantidade.AsFloat-qryEstqLocacaolocado.AsFloat;
    ExecSql(dbConnect.ZConnection1,'Update produtos_estoque Set quantidade=quantidade+%.3f '+
                                   'Where id=%d',[quant,qryEstqLocacaoproduto_estoque.AsInteger]);
    ExecSql(dbConnect.ZConnection1,'Update produtos_locacao Set quantidade=quantidade-%.3f '+
                                   'Where id=%d',[quant,qryEstqLocacaoid.AsInteger]);
    ExecSql(dbConnect.ZConnection1,'Delete From produtos_locacao Where quantidade <= 0 ');
    ExecSql(dbConnect.ZConnection1,'Commit');
    qryEstqLocacao.Close;
    OpenTable( qryEstqLocacao );

  finally
    RestoreDecimalSeparator;
    ExecSql(dbConnect.ZConnection1,'RollBack');
  end;
end;

procedure TfrmLocacao.btAddComprovanteClick(Sender: TObject);
Var ext, filename, caminho, nome : String;
    oid : Integer;
begin
  PostTable(qryLocacao);
  if not OpenDialog1.Execute then exit;

  if not InputQuery('Novo comprovante','O que é este comprovante ?',nome) then exit;

  ext     := ExtractFileExt(OpenDialog1.FileName);
  caminho := ExtractShortPathNameUTF8(OpenDialog1.FileName);
  filename:= DelCharss(ExtractFileName(OpenDialog1.FileName),#32);

  oid := importFileToServer(dbConnect.ZConnection1, OpenDialog1.FileName);
  ExecSql(dbConnect.ZConnection1,'INSERT INTO locacao_comprovantes(locacao, descricao,tipo_arquivo ,item) '+
                                 'VALUES (%d, ''%s'',''%s'', %d );',
                                 [qryLocacaoid.AsInteger,
                                  nome,
                                  ext,
                                  oid]);

{
  SaveFileToServidor(caminho,'servidor/sistema/tmp/'+FileName);
  ExecSql(dbConnect.ZConnection1,'INSERT INTO locacao_comprovantes(locacao, descricao,tipo_arquivo ,item) '+
                                 'VALUES (%d, ''%s'',''%s'',lo_import(''%s'') );',
                                 [qryLocacaoid.AsInteger,
                                  nome,
                                  ext,
                                  '/home/medicatto/servidor/sistema/tmp/'+FileName]);
}
  RefreshTable( qryLocacaoComprovantes );
end;

procedure TfrmLocacao.btDelComprovanteClick(Sender: TObject);
begin
  PostTable(qryLocacao);
  ConfirmDelete;
  ExecSql(dbConnect.ZConnection1,'Select lo_unlink(item) From locacao_comprovantes Where locacao=%d',[qryLocacaoid.AsInteger]);
  qryLocacaoComprovantes.Delete;
end;

procedure TfrmLocacao.btLancamentos1Click(Sender: TObject);
Begin
  if MessageDlg('Voce que devolver a quantidade não locada para o estoque de não locados ?',mtConfirmation,[mbNo,mbYes],0) <> mrYes Then Exit;
  try
    ExecSql(dbConnect.ZConnection1,'Update locacao_itens Set situacao=0 Where locacao=%d',[qryLocacaoid.AsInteger]);
    qryLocacaoItens.Close;
    OpenTable( qryLocacaoItens );
    qryEstqLocacao.Close;
    OpenTable( qryEstqLocacao );
  finally
  end;
end;

procedure TfrmLocacao.btLancamentosClick(Sender: TObject);
Var total : Double;
begin
  qryLocacaoItens.DisableControls;
  qryLocacaoItens.First;
  total := 0;
  While not qryLocacaoItens.Eof do begin
     if (Not qryLocacaoItenslancado.AsBoolean) then begin
         total += (qryLocacaoItensvalor.ASFloat * qryLocacaoItensquantidade.ASFloat);
     end;
     qryLocacaoItens.Next;
  end;
  qryLocacaoItens.First;
  qryLocacaoItens.EnableControls;
  if total > 0 then
     ReceberLocacao(total);
  ExecSql(dbConnect.ZConnection1,'Update  locacao_itens Set lancado=true Where locacao=%d',[qryLocacaoid.AsInteger]);

  qryLocacaoItens.Close;
  OpenTable( qryLocacaoItens );

end;

procedure TfrmLocacao.DBGrid1DblClick(Sender: TObject);
begin
  PageControl1.PageIndex:= 1;
end;

procedure TfrmLocacao.DBNavigator1BeforeAction(Sender: TObject;
  Button: TDBNavButtonType);
var ret : Variant;
    produto : Integer;
    dtini,dtfim : TDateTime;
    descricao : String;
    quant, valor : Double;
    pgto_antecipado : boolean;
begin
  PostTable(qryLocacao);
  if Button = nbEdit then begin
      if uUser.CheckAcessModulo(dbConnect.ZConnection1,'TfrmLocacao','Inserir') <> ACESSO_PERMITIDO then
         Raise Exception.Create(uUser.MSGNOTACESSO);
      produto  := qryLocacaoItensproduto.AsInteger;
      descricao:= qryLocacaoItensdescricao.AsString;
      dtini    := qryLocacaoItensdata_inicio.AsDateTime;
      dtfim    := qryLocacaoItensdata_termino.AsDateTime;
      quant    := qryLocacaoItensquantidade.AsFloat;
      valor    := qryLocacaoItensvalor.AsFloat;
      pgto_antecipado := qryLocacaoItenspgto_antecipado.AsBoolean;
      if Not ShowLocacaoItem(produto,dtini,dtfim,quant,valor,pgto_antecipado,descricao)  then begin
         qryLocacaoItens.Cancel;
         AbortSilent;
      end;

      EditTable(qryLocacaoItens);
      qryLocacaoItenslocacao.AsInteger      := qryLocacaoid.AsInteger;
      qryLocacaoItensproduto.AsInteger      := produto;
      qryLocacaoItensdescricao.AsString     := descricao;
      qryLocacaoItensdata_inicio.AsDateTime := dtini;
      qryLocacaoItensdata_termino.AsDateTime:= dtfim;
      qryLocacaoItensquantidade.AsFloat     := quant;
      qryLocacaoItenssituacao.AsInteger     := 0;
      qryLocacaoItensvalor.AsFloat          := valor;
      qryLocacaoItenspgto_antecipado.AsBoolean:= pgto_antecipado;
      PostTable(qryLocacaoItens);
      RefreshTable( qryLocacaoItens );
      AbortSilent;
  end;
  if Button = nbInsert then begin
      if uUser.CheckAcessModulo(dbConnect.ZConnection1,'TfrmLocacao','Inserir') <> ACESSO_PERMITIDO then
       Raise Exception.Create(uUser.MSGNOTACESSO);
      produto  := 0;
      descricao:= '';
      dtini    := Date;
      dtfim    := Date;
      quant    := 1;
      valor    := 0;
      pgto_antecipado := True;
      if Not ShowLocacaoItem(produto,dtini,dtfim,quant,valor,pgto_antecipado,descricao)  then begin
         qryLocacaoItens.Cancel;
         AbortSilent;
      end;

      qryLocacaoItens.Append;
      qryLocacaoItenslocacao.AsInteger      := qryLocacaoid.AsInteger;
      qryLocacaoItensproduto.AsInteger      := produto;
      qryLocacaoItensdescricao.AsString     := descricao;
      qryLocacaoItensdata_inicio.AsDateTime := dtini;
      qryLocacaoItensdata_termino.AsDateTime:= dtfim;
      qryLocacaoItensquantidade.AsFloat     := quant;
      qryLocacaoItenssituacao.AsInteger     := 0;
      qryLocacaoItensvalor.AsFloat          := valor;
      qryLocacaoItenspgto_antecipado.AsBoolean:= pgto_antecipado;
      PostTable(qryLocacaoItens);
      RefreshTable( qryLocacaoItens );
      AbortSilent;
  end;

end;

procedure TfrmLocacao.OpenComprovante;
var outputstring,filename : String;
    //qry : TZQuery;
begin
  PostTable(qryLocacao);
  //qry      := ExecSqlQuery(dbConnect.ZConnection1,'Select * from locacao_comprovantes Where locacao=%d',[qryLocacaoid.AsInteger]);
  filename := qryLocacaoComprovantesitem.AsString+qryLocacaoComprovantestipo_arquivo.AsString;

  ExecSql(dbConnect.ZConnection1,'Select lo_export(locacao_comprovantes.item, ''/tmp/%s'') From locacao_comprovantes Where id=%d',
                                 [filename,qryLocacaoComprovantesid.AsInteger]);
  GetFileFromServidor(GetTempDir(True)+filename,'/tmp/'+filename);
  ShellExecute(Handle, PChar('open'), PChar(GetTempDir(True)+filename), nil,  nil, 1);
end;

function TfrmLocacao.SomarItens(NotLancOnly: Boolean): Double;
Var total : Double;
begin
  qryLocacaoItens.DisableControls;
  qryLocacaoItens.First;
  total := 0;
  While not qryLocacaoItens.Eof do begin
     if NotLancOnly then Begin
        if (Not qryLocacaoItenslancado.AsBoolean) and (qryLocacaoItenssituacao.AsInteger = 0) then
           total += (qryLocacaoItensvalor.ASFloat * qryLocacaoItensquantidade.ASFloat);
     end else
        total += (qryLocacaoItensvalor.ASFloat * qryLocacaoItensquantidade.ASFloat);
     qryLocacaoItens.Next;
  end;
  qryLocacaoItens.First;
  qryLocacaoItens.EnableControls;
  Result := total;
end;


procedure TfrmLocacao.PageControl1Change(Sender: TObject);
begin
  qryEstqLocacao.Close;
  OpenTable( qryEstqLocacao );
end;

procedure TfrmLocacao.ReceberLocacao( Total : Double);
Var totVenda : Double;
    recebimento : TRecebimento;
    l , id: Integer;
    qParcela : Double;
    vencto : TDateTime;
    res : Variant;
    senha_id : String;
    conta_credito, conta_vista : String;
begin
     if not InputQuery('Identificação de usuário','Por favor digite sua senha de identificação.',True,senha_id) then exit;
     senha_id := ExecSql(dbConnect.ZConnection1,'Select id From empregados Where senha_id=''%s''',[senha_id]);
     if length(senha_id)=0 then Raise exception.create('Senha de identificação inválida!');

     recebimento:= TRecebimento.Create;
     id := qryLocacaoid.AsInteger;
     totVenda   := Total;
     if Not obtemValorRecebimento( Total, recebimento ) then exit;
     if recebimento.Credito > 0 then begin
       qParcela := 1;
       if Not InputFloat('Pagamento com Cartão de crédito','Digite número de parcelas',qParcela) then
          Raise Exception.Create('Recebimento cancelado. Quantidade de parcelas é obrigatório.');
     end;
     conta_credito := getSysParametro('CONTA_CREDITO_VENDA_BALCAO');
     conta_vista   := getSysParametro('CONTA_VENDA_VISTA_BALCAO');
     SetDecimalSeparator;
     try
       ExecSql(dbConnect.ZConnection1,'Begin Work');
{
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
            GerarHistoricoMovimento(RxMemoryData1produto.AsInteger,RxMemoryData1loja_estoque.AsInteger,'Venda no balcao N. '+IntTostr(id),0.0,RxMemoryData1quantidade.AsFloat);
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
}
       //Se pagamento com conta receber
       {
       if recebimento.Carteira > 0 then begin
          res := ShowSearchModal(dbConnect.ZConnection1,'clientes','id,nome','id,nome','nome');
          if VarIsBlank(res) then
             Raise Exception.Create('Para venda em conta corrente é obrigatória a identificação de um cliente.');
          GerarCtaReceber(recebimento.Carteira,res[0],res[1],id );
       end else begin;
       }
             //Se pagamento com cartao de credito lança no contas a pagar
             if recebimento.Credito > 0 then begin
               for l := 1 to trunc(qParcela) do begin //CONTA_CREDITO_VENDA_BALCAO
                   vencto := IncDay(Date, 30 * l);
                   ExecSql(dbConnect.ZConnection1,'INSERT INTO contas_receber(documento, descricao, data_vencimento, valor_devido,'+
                                                  'conta_credito, cliente, parcela, total_parcelas) '+
                                                  'Values(%d,''%s'',''%s'',%.2f,%s,%d,%d,%d )',
                                                  [id,
                                                   Format('Locação (N° %d)',[id]),
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
                                               Format('Recebimento de Locação (N° %d)',[id]),
                                               totVenda- CalculaPerc(recebimento.desconto,totVenda),
                                               getEmpresaPadrao,
                                               tlTotal,id,senha_id]);
             if recebimento.Dinheiro > 0 then
                ExecSql(dbConnect.ZConnection1,'INSERT INTO balcao_caixa(conta, historico, valor, loja, tipo_lancamento,balcao_venda,empregado) '+
                                          'VALUES (%s, ''%s'', %.2f, %s, %d, %d,%s)',
                                          [conta_vista,
                                           Format('Recebimento de Locação pgto em Dinheiro (N° %d)',[id]),
                                           recebimento.Dinheiro,
                                           getEmpresaPadrao,
                                           tlDinheiro,id,senha_id]);
             if recebimento.Debito > 0 then
                ExecSql(dbConnect.ZConnection1,'INSERT INTO balcao_caixa(conta, historico, valor, loja, tipo_lancamento,balcao_venda,empregado) '+
                                            'VALUES (%s, ''%s'', %.2f, %s, %d, %d,%s)',
                                            [conta_vista,
                                             Format('Recebimento de Locação pgto Cartão Débito (N° %d)',[id]),
                                             recebimento.Debito,
                                             getEmpresaPadrao,
                                             tlDebito,id,senha_id]);
             if recebimento.Credito > 0 then
                  ExecSql(dbConnect.ZConnection1,'INSERT INTO balcao_caixa(conta, historico, valor, loja, tipo_lancamento,balcao_venda,empregado) '+
                                              'VALUES (%s, ''%s'', %.2f, %s, %d, %d,%s)',
                                              [conta_vista,
                                               Format('Locação(N° %d) pgto em Cartão Crédito %d parcelas',[id,trunc(qParcela)]),
                                               recebimento.Credito,
                                               getEmpresaPadrao,
                                               tlCredito,id,senha_id]);
             if recebimento.Troco > 0 then
                ExecSql(dbConnect.ZConnection1,'INSERT INTO balcao_caixa(conta, historico, valor, loja, tipo_lancamento,balcao_venda,empregado) '+
                                              'VALUES (%s, ''%s'', %.2f, %s, %d, %d,%s)',
                                              [conta_vista,
                                               Format('Locação Troco (N° %d)',[id]),
                                               recebimento.Troco,
                                               getEmpresaPadrao,
                                               tlTroco,id,senha_id]);
             if recebimento.Carteira > 0 then
                ExecSql(dbConnect.ZConnection1,'INSERT INTO balcao_caixa(conta, historico, valor, loja, tipo_lancamento,balcao_venda,empregado) '+
                                              'VALUES (%s, ''%s'', %.2f, %s, %d, %d)',
                                              [conta_vista,
                                               Format('Locação Conta corrente (N° %d)',[id]),
                                               recebimento.Carteira,
                                               getEmpresaPadrao,
                                               tlCarteira,id,senha_id]);
       //end;
       ExecSql(dbConnect.ZConnection1,'Commit');
       RestoreDecimalSeparator;
     Except
       RestoreDecimalSeparator;
       ExecSql(dbConnect.ZConnection1,'RollBack');
       Raise;
     end;
end;

initialization
  RegisterClass(TfrmLocacao);



end.

