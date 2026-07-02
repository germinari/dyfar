unit uCtaReceber;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  ComCtrls, StdCtrls, ActnList, DbCtrls, Buttons, DBActns, EditBtn, ZDataset,
  ZSqlUpdate, ZSequence, rxtoolbar, rxdbgrid, rxdbdateedit, rxcurredit,
  WAGDBNavigator, ACBrBoleto, RLReport, db, ExtendedNotebook, DBGrids, Menus,
  uRetornoBoleto;

type

  { TfrmCtaReceber }

  TfrmCtaReceber = class(TForm)
    ACBrBoleto1: TACBrBoleto;
    acLocalizar: TAction;
    Action1: TAction;
    Action3: TAction;
    Action4: TAction;
    ActionList1: TActionList;
    BitBtn1: TBitBtn;
    btAplicar: TBitBtn;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    DataSetPost1: TDataSetPost;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    DBDateEdit4: TRxDBDateEdit;
    DBDateEdit5: TRxDBDateEdit;
    DBDateEdit6: TRxDBDateEdit;
    DBEdit1: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBMemo1: TDBMemo;
    dsCtaReceber: TDatasource;
    edCliente: TEdit;
    edConta: TEditButton;
    edRemessa: TEdit;
    ExtendedNotebook1: TExtendedNotebook;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
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
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    qryCtaReceberatrazo: TLongintField;
    qryCtaPagarvconta_debito: TStringField;
    qryCtaReceberbanco: TLongintField;
    qryCtaReceberbanco_negociado: TStringField;
    qryCtaReceberboleto: TLongintField;
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
    qryCtaRecebernosso_numero: TStringField;
    qryCtaReceberobservacao: TMemoField;
    qryCtaReceberorigem: TStringField;
    qryCtaReceberparcela: TLongintField;
    qryCtaReceberremessa: TLongintField;
    qryCtaReceberselecionado: TBooleanField;
    qryCtaRecebertotal_parcelas: TLongintField;
    qryCtaRecebervalor_devido: TFloatField;
    qryCtaRecebervalor_pago: TFloatField;
    qryCtaRecebervconta_credito: TStringField;
    qryCtaRecebervdescricao_credito: TStringField;
    rbEmissao: TRadioButton;
    rbVencto: TRadioButton;
    rbPagamento: TRadioButton;
    rbTodas: TRadioButton;
    rgSituacao: TRadioGroup;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
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
    RLSystemInfo3: TRLSystemInfo;
    RxDBGrid1: TRxDBGrid;
    SpeedButton1: TSpeedButton;
    btJuntasContas: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    btDividirConta: TSpeedButton;
    btBoleto: TSpeedButton;
    btRemessa: TSpeedButton;
    btRemessaRetorno: TSpeedButton;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    qryCtaReceber: TZQuery;
    ZSequence1: TZSequence;
    ZUpdateSQL1: TZUpdateSQL;
    procedure btAplicarClick(Sender: TObject);
    procedure btRemessaRetornoClick(Sender: TObject);
    procedure DateEdit1AcceptDate(Sender: TObject; var ADate: TDateTime;
      var AcceptDate: Boolean);
    procedure dsCtaReceberStateChange(Sender: TObject);
    procedure edContaButtonClick(Sender: TObject);
    procedure ExtendedNotebook1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure qryCtaReceberAfterOpen(DataSet: TDataSet);
    procedure qryCtaReceberCalcFields(DataSet: TDataSet);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: boolean);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1GetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
    procedure RxDBGrid1TitleClick(Column: TColumn);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btJuntasContasClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure btDividirContaClick(Sender: TObject);
    procedure btBoletoClick(Sender: TObject);
    procedure btRemessaClick(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
  private
    procedure IncluiBoleto(const id: Integer);
    { private declarations }
  public
    { public declarations }
    Ordem : String;
    AlternateColor : TColor;
  end; 

var
  frmCtaReceber: TfrmCtaReceber;

implementation

{$R *.lfm}

Uses udbConnect, uCtaReceberQuitar, uRecebimento, sistema_config,
  uCtaReceberMultBaixa, uImprimirBoleto, WagVclUtils, TDIPageControl, uSearch,
  BDSqlUtils, DateUtils, StrUtils, math, uInputFloat, WagStrUtils, uUser,
  ACBrUtil, ACBrBoletoConversao;

{ TfrmCtaReceber }

procedure TfrmCtaReceber.FormResize(Sender: TObject);
begin
  CenterControl(GroupBox2);
  CenterControl(GroupBox3);
end;

procedure TfrmCtaReceber.qryCtaReceberAfterOpen(DataSet: TDataSet);
begin
  qryCtaReceber.DisableControls;
  qryCtaReceber.First;
  CurrencyEdit1.Value := 0;
  CurrencyEdit2.Value := 0;
  While Not qryCtaReceber.Eof do begin
    CurrencyEdit1.Value := CurrencyEdit1.Value + qryCtaRecebervalor_devido.AsCurrency;
    CurrencyEdit2.Value := CurrencyEdit2.Value + qryCtaRecebervalor_pago.AsCurrency;
    qryCtaReceber.Next;
  end;
  qryCtaReceber.EnableControls;
end;

procedure TfrmCtaReceber.qryCtaReceberCalcFields(DataSet: TDataSet);
begin
  qryCtaReceberatrazo.AsInteger :=  0;
  if qryCtaReceberdata_pagamento.IsNull then
     qryCtaReceberatrazo.AsInteger :=  Trunc(qryCtaReceberdata_vencimento.ASDateTime-Date);
end;

procedure TfrmCtaReceber.RLBand2BeforePrint(Sender: TObject; var PrintIt: boolean
  );
begin
  RLBand2.Color:= clWhite;
  if ((qryCtaReceber.RecNo mod 2) > 0 ) then RLBand2.Color:= AlternateColor;
end;

procedure TfrmCtaReceber.RxDBGrid1DblClick(Sender: TObject);
begin
  ExtendedNotebook1.PageIndex:= 1;
end;

procedure TfrmCtaReceber.RxDBGrid1GetCellProps(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor);
begin
  if (Field.FieldName = 'atrazo') and (Field.AsInteger < 0) then
     AFont.Color:=clRed;
end;

procedure TfrmCtaReceber.RxDBGrid1TitleClick(Column: TColumn);
begin
  Column := RxDBGrid1.Columns.Items[Column.Index+1];
  if Column.FieldName = 'atrazo' then exit;
  if pos(Ordem,Column.FieldName) > 0 then
       Ordem := Column.FieldName+' desc'
  else Ordem := Column.FieldName;
  btAplicar.Click;
end;

procedure TfrmCtaReceber.SpeedButton1Click(Sender: TObject);
var ret : Variant;
begin
  ret := ShowSearchModal(dbConnect.ZConnection1,'plano_contas','conta,descricao','id,conta,descricao','conta',true);
  if VarIsBlank(ret) then exit;
  EditTable(qryCtaReceber);
  qryCtaReceberconta_credito.ASString     := ret[0];
  qryCtaRecebervdescricao_credito.ASString:= Format('%s-%s',[ret[1],ret[2]]);
end;

procedure TfrmCtaReceber.btJuntasContasClick(Sender: TObject);
Var i : Integer;
    valor : Double;
    obs : String;
begin
     if RxDBGrid1.SelectedRows.Count = 0 then
        Raise Exception.Create('Selecione as contas.');
     try
       startWait;
       valor := 0;
       obs   := '';
       for i := 0 to RxDBGrid1.SelectedRows.Count -1 do begin
         qryCtaReceber.GotoBookmark( RxDBGrid1.SelectedRows[i] );
         valor += qryCtaRecebervalor_devido.AsCurrency;
         obs   += qryCtaReceberdocumento.ASString + ';' + qryCtaReceberobservacao.AsString+#10;

       end;
       if MessageDlg(Format('Voce que gerar uma nova conta no valor de %.2f',[valor]),mtConfirmation,[mbNo,mbYes],0) <> mrYes then exit;

       SetDecimalSeparator('.');
       qryCtaReceber.GotoBookmark( RxDBGrid1.SelectedRows[0]);
       ExecSql(dbConnect.ZConnection1,'INSERT INTO contas_receber(documento, descricao, data_vencimento, valor_devido,'+
                                   'cliente, parcela, total_parcelas,conta_credito,observacao) '+
                                   'Values(''%s'',''%s'',''%s'',%.2f,%s,%d,%d,%d,''%s'' )',
                                   [qryCtaReceberdocumento.AsString,
                                    qryCtaReceberdescricao.AsString,
                                    DateToStr(qryCtaReceberdata_vencimento.AsDateTime),
                                    valor,
                                    qryCtaRecebercliente.AsString,
                                    1,
                                    1,qryCtaReceberconta_credito.ASInteger,obs]);
       for i := 0 to RxDBGrid1.SelectedRows.Count -1 do begin
         qryCtaReceber.GotoBookmark( RxDBGrid1.SelectedRows[i] );
         ExecSql(dbConnect.ZConnection1,'Delete From contas_receber Where id=%d',[qryCtaReceberid.AsInteger]);
       end;
       RefreshTable( qryCtaReceber );
     finally
       RestoreDecimalSeparator;
       StopWait;
     end;
end;

procedure TfrmCtaReceber.SpeedButton3Click(Sender: TObject);
var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'clientes','id,nome','id,nome','nome',true);
  if VarIsBlank(ret) then exit;
  edCliente.Text := Format('%s-%s',[ret[0],ret[1]]);
end;

procedure TfrmCtaReceber.SpeedButton4Click(Sender: TObject);
var ret : Variant;
begin
  ret:= ShowSearchModal(dbConnect.ZConnection1,'clientes','id,nome','id,nome','nome',true);
  if VarIsBlank(ret) then exit;
  EditTable(qryCtaReceber);
  qryCtaReceberdescricao.ASString := ret[1];
  qryCtaRecebercliente.AsString   := ret[0];
end;

procedure TfrmCtaReceber.SpeedButton5Click(Sender: TObject);
Var desconto, juros, vlrpago,vlr : Currency;
    formaPgto : TTipoLancamento;
    data      : TDateTime;
    ncontas   : Integer;
    senha_id, lista_cta  : String;
    bookMark: TBookMark;

begin
  //if not InputQuery('Identificação de usuário','Por favor digite sua senha de identificação.',True,senha_id) then exit;
  //senha_id := ExecSql(dbConnect.ZConnection1,'Select id From empregados Where senha_id=''%s''',[senha_id]);
  //if length(senha_id)=0 then Raise exception.create('Senha de identificação inválida!');
  bookMark :=  qryCtaReceber.GetBookmark;
  qryCtaReceber.DisableControls;
  qryCtaReceber.First;
  ncontas := 0;
  lista_cta := '';
  While Not qryCtaReceber.Eof do begin
    if qryCtaReceberselecionado.AsBoolean then begin
       inc(ncontas);
       AddWithSeparator(lista_cta, qryCtaReceberid.AsString,',');
    end;
    qryCtaReceber.Next;
  end;
  qryCtaReceber.First;
  qryCtaReceber.EnableControls;
  if ncontas > 1 then begin
     //ShowMessageFmt('Selecionadas %d contas : %s',[ncontas,lista_cta]);
     MultBaixaCtaReceber(lista_cta);
     exit;
  end;
  qryCtaReceber.GotoBookmark(bookMark);
  if Not QuitarContaReceber(qryCtaRecebervalor_devido.AsCurrency,desconto, juros, vlrpago,formaPgto,data) then exit;

  try
    vlr     := (vlrpago - juros + desconto);
    ncontas := StrToIntDef(ExecSql(dbConnect.ZConnection1,'Select count(*) From contas_receber Where conta=%d',[qryCtaReceberconta.AsInteger]),1);
    if vlr = qryCtaRecebervalor_devido.AsCurrency then begin
       EditTable(qryCtaReceber);
       qryCtaReceberdata_pagamento.AsDateTime    := data;
       qryCtaRecebervalor_pago.AsCurrency        := vlrpago;
       qryCtaReceberdesconto.AsCurrency          := desconto;
       qryCtaReceberjuros.AsCurrency             := juros;
       PostTable(qryCtaReceber);
       SetDecimalSeparator('.');
       ExecSql(dbConnect.ZConnection1,'INSERT INTO balcao_caixa(conta, historico, valor, loja, tipo_lancamento,balcao_venda,empregado) '+
                                     'VALUES (%s, ''%s'', %.2f, %s, %d, %d,%s)',
                                     ['126',
                                      Format('Recebimento contas a receber (N° %d)',[qryCtaReceberid.AsInteger]),
                                      vlrpago,
                                      getEmpresaPadrao,
                                      formaPgto,0,senha_id]);
       RestoreDecimalSeparator;
       ShowMessage('Conta baixada com sucesso.');
       exit;
    end;
    if (ncontas = 1) or (qryCtaRecebertotal_parcelas.AsInteger = qryCtaReceberparcela.AsInteger) then begin // Só tem uma parcela tem que resolver agora
       //ShowMessage('Parcela unica ou ultima parcela tem que resolver agora');
       if vlr <> qryCtaRecebervalor_devido.AsCurrency then begin
          if MessageDlg('Recebimento de conta','Parcela única, valor devido + juros - desconto deve ser igual ao valor recebido.'#10+
                     'Voce pode dividir esta conta, voce quer dividir ?',
                     mtError,[mbNo,mbYes],0,mbNo) <> mrYes then exit;

       end;
  {     if vlr > qryCtaRecebervalor_devido.AsCurrency then begin
          ShowMessage('parcela unica Valor recebido é maior que o devido');

       end;}
       exit;
    end;
    if vlr < qryCtaRecebervalor_devido.AsCurrency then begin
       if MessageDlg('Recebimento de conta','Valor recebido é menor que valor devido.'#10+
                     'Você quer lançar diferença para próxima parcela ?',mtWarning,[mbYes,mbNo],0,mbNo) <> mrYes then exit;
       vlr := qryCtaRecebervalor_devido.AsCurrency - vlrpago;
       EditTable(qryCtaReceber);
       qryCtaReceberdata_pagamento.AsDateTime := data;
       qryCtaRecebervalor_devido.AsCurrency      := vlrpago;
       qryCtaRecebervalor_pago.AsCurrency        := vlrpago;
       qryCtaReceberdesconto.AsCurrency          := desconto;
       qryCtaReceberjuros.AsCurrency             := juros;
       qryCtaReceberobservacao.AsString       :=  Format('Valor recebido a menor, saldo lançado na próxima parcela.',[vlr])+
                                                  #10 + qryCtaReceberobservacao.AsString;
       PostTable(qryCtaReceber);
       SetDecimalSeparator('.');
       try
         ExecSql(dbConnect.ZConnection1,'Update contas_receber Set valor_devido=valor_devido+%.2f, observacao=''%s'' Where conta=%d and parcela=%d',
                [vlr,
                Format('Valor recebido a menor na parcela anterior, %.2f',[vlr]),
                qryCtaReceberconta.AsInteger,
                qryCtaReceberparcela.AsInteger+1]);
         ExecSql(dbConnect.ZConnection1,'INSERT INTO balcao_caixa(conta, historico, valor, loja, tipo_lancamento,balcao_venda,empregado) '+
                                       'VALUES (%s, ''%s'', %.2f, %s, %d, %d,%s)',
                                       ['126',
                                        Format('Recebimento contas a receber (N° %d)',[qryCtaReceberconta.AsInteger]),
                                        vlrpago,
                                        getEmpresaPadrao,
                                        formaPgto,0,senha_id]);

       finally
         RestoreDecimalSeparator;
       end;

       btAplicar.Click;
       exit;
    end;
    if vlr > qryCtaRecebervalor_devido.AsCurrency then begin
       if MessageDlg('Recebimento de conta','Valor recebido é maior que valor devido.'#10+
                     'Você quer deduzir diferença na próxima parcela ?',mtWarning,[mbYes,mbNo],0,mbNo) <> mrYes then exit;
       vlr := vlrpago - qryCtaRecebervalor_devido.AsCurrency;
       EditTable(qryCtaReceber);
       qryCtaReceberdata_pagamento.AsDateTime := data;
       qryCtaRecebervalor_devido.AsCurrency      := vlrpago;
       qryCtaRecebervalor_pago.AsCurrency        := vlrpago;
       qryCtaReceberdesconto.AsCurrency          := desconto;
       qryCtaReceberjuros.AsCurrency             := juros;
       qryCtaReceberobservacao.AsString       := Format('Valor recebido a maior, %.2f deduzido da próxima parcela.',[vlr])+
                                                 #10 + qryCtaReceberobservacao.AsString;
       PostTable(qryCtaReceber);
       SetDecimalSeparator('.');
       ExecSql(dbConnect.ZConnection1,'Update contas_receber Set valor_devido=valor_devido-%.2f, observacao=''%s'' Where conta=%d and parcela=%d',
               [vlr,
               Format('Valor recebido a maior na parcela anterior, %.2f',[vlr]),
                qryCtaReceberconta.AsInteger,
                qryCtaReceberparcela.AsInteger+1]);
       ExecSql(dbConnect.ZConnection1,'INSERT INTO balcao_caixa(conta, historico, valor, loja, tipo_lancamento,balcao_venda,empregado) '+
                                     'VALUES (%s, ''%s'', %.2f, %s, %d, %d,%s)',
                                     ['126',
                                      Format('Recebimento contas a receber (N° %d)',[qryCtaReceberconta.AsInteger]),
                                      vlrpago,
                                      getEmpresaPadrao,
                                      formaPgto,0,senha_id]);
       RestoreDecimalSeparator;
       btAplicar.Click;
       exit;
    end;
  finally
    RestoreDecimalSeparator;
  end;
end;

procedure TfrmCtaReceber.btDividirContaClick(Sender: TObject);
Var i, parcela, parcelas, conta : Integer;
    valor : Double;
    obs : String;
begin
     if Not qryCtaReceberdata_pagamento.IsNull then
        Raise Exception.Create('Conta quitada não pode ser reparcelada.');
     valor := 2;
     if MessageDlg('Voce quer dividir a conta a receber atual ?',mtConfirmation,[mbNo,mbYes],0) <> mrYes then exit;
     if not InputFloat('Quantas parcelas gerar ?','Número de parcelas', valor,0) then exit;
     try
       startWait;
       parcelas := Trunc(valor);
       if parcelas <= 1 then
          Raise Exception.Create('Voce deve dividir em mais de uma parcela.');
       valor    := qryCtaRecebervalor_devido.AsCurrency / parcelas;
       obs      := 'Conta reparcelada em '+DateTostr( Now() );
       conta    := qryCtaReceberconta.AsInteger;
       if qryCtaReceberconta.IsNull then
          conta := ZSequence1.GetNextValue;
       parcela  := StrtoIntDef(ExecSql(dbConnect.ZConnection1,'Select count(*)+1 From contas_receber Where documento=''%s''',[qryCtaReceberdocumento.AsString]),0);
       parcelas := qryCtaRecebertotal_parcelas.AsInteger + (parcelas-1);
       SetDecimalSeparator('.');
       for i := parcelas to parcela do begin
         ExecSql(dbConnect.ZConnection1,'INSERT INTO contas_receber(documento, descricao, data_vencimento, valor_devido,'+
                                     'cliente, parcela, total_parcelas,conta_credito,observacao,conta) '+
                                     'Values(''%s'',''%s'',''%s'',%.2f,%s,%d,%d,%d,''%s'',%d )',
                                     [qryCtaReceberdocumento.AsString,
                                      qryCtaReceberdescricao.AsString,
                                      DateToStr(qryCtaReceberdata_vencimento.AsDateTime+30),
                                      valor,
                                      qryCtaRecebercliente.AsString,
                                      parcela,
                                      parcelas,qryCtaReceberconta_credito.ASInteger,obs,
                                      conta]);
       end;
       RestoreDecimalSeparator;
       ExecSql(dbConnect.ZConnection1,'Update contas_receber Set conta=%d,total_parcelas=%d Where documento=''%s''',
                  [conta,parcela,qryCtaReceberdocumento.AsString]);
       EditTable(qryCtaReceber);
       qryCtaRecebertotal_parcelas.AsInteger := parcelas;
       qryCtaReceberparcela.ASInteger        := Math.IfThen(qryCtaReceberparcela.ASInteger = 0 , 1 , qryCtaReceberparcela.ASInteger );
       qryCtaReceberobservacao.Asstring      := obs + #10 + qryCtaReceberobservacao.AsString;
       qryCtaRecebervalor_devido.AsCurrency  := valor;
       PostTable(qryCtaReceber);
       RefreshTable( qryCtaReceber );
     finally
       RestoreDecimalSeparator;
       StopWait;
     end;
end;

procedure TfrmCtaReceber.btBoletoClick(Sender: TObject);
Var res : Variant;
    boleto_config, id_nf : Integer;
    c: LongInt;
begin
    c := StrToIntDef(ExecSql(dbConnect.ZConnection1,'Select count(*) From boleto_config'),1);
    if c > 1 then
    begin
      res := ShowSearchModal(dbConnect.ZConnection1,'boleto_config','nome','id','nome',True);
      if VarIsBlank(res) then exit;
      boleto_config := res;
    end else
    begin
       boleto_config := StrToIntDef(ExecSql(dbConnect.ZConnection1,'Select id From boleto_config'),1);
    end;
    id_nf := qryCtaReceberid_nf.AsInteger;
    if CompareText(qryCtaReceberorigem.AsString,'Pedido') = 0 then
       id_nf := qryCtaReceberid_nf.AsInteger * -1;
    ShowImprimeBoleto( id_nf, boleto_config , StrToInt(getEmpresaPadrao()) );
    RefreshTable( qryCtaReceber );
end;

procedure TfrmCtaReceber.btRemessaClick(Sender: TObject);
Var p : TBookMark;
    lista, diretorio, sdir : String;
    i, boleto_config, numero_remessa : Integer;
    res : Variant;
    c: LongInt;
begin
  c := StrToIntDef(ExecSql(dbConnect.ZConnection1,'Select count(*) From boleto_config'),1);
  if c > 1 then
  begin
    res := ShowSearchModal(dbConnect.ZConnection1,'boleto_config','nome','id','nome',True);
    if VarIsBlank(res) then exit;
    boleto_config := res;
  end else
  begin
     boleto_config := StrToIntDef(ExecSql(dbConnect.ZConnection1,'Select id From boleto_config'),1);
  end;

  if MessageDlg('Você quer gerar uma remessa das contas selecionadas ?', mtConfirmation,mbYesNo,0) <> mrYes then exit;

  p := qryCtaReceber.GetBookmark;
  qryCtaReceber.DisableControls;
  try
    ExecSql(dbConnect.ZConnection1,'Begin work');
    lista := '';
    qryCtaReceber.First;
    While Not qryCtaReceber.EOF do begin
      if qryCtaReceberselecionado.AsBoolean then begin
         if Length( qryCtaRecebernosso_numero.AsString )=0 then
            Raise Exception.Create('Uma conta selecionada não possui boleto, remessa não pode ser criada.');
         AddWithSeparator(lista,qryCtaReceberid.AsString,',');
      end;
      qryCtaReceber.Next;
    end;
    if Length(lista)= 0 then
       Raise Exception.Create('Nenhuma conta selecionada.');
    InicializaConfigBoleto(ACBrBoleto1,boleto_config, StrToInt(getEmpresaPadrao()));

    ACBrBoleto1.ListadeBoletos.Clear;
    for i := 1 to WordCount(lista,[',']) do begin
       IncluiBoleto( StrToInt( ExtractWord(i,lista,[','])));
    end;

    sdir := ReadStringINI(ConfigRecord.FileNamePath,'boleto','DirArqRemessa',DocumentDir());
    if not SelectDirectory('Onde salvar a remessa ?', sdir , diretorio) then exit;
    SaveStringIni(ConfigRecord.FileNamePath,'boleto','DirArqRemessa',diretorio);

    numero_remessa := StrToIntDef(ExecSql(dbConnect.ZConnection1,'Select max( coalesce(numero_remessa,0) ) +1 From boleto_remessa Where boleto_config=%d',[boleto_config]),1);
    ExecSql(dbConnect.ZConnection1,'INSERT INTO boleto_remessa(usuario,numero_remessa,boleto_config) '+
                                   'VALUES (''%s'', %d, %d)',
                                   [ UsuarioAtual.userApelido,
                                     numero_remessa,
                                     boleto_config]);
    ACBrBoleto1.DirArqRemessa := diretorio;

    {Bradesco}
    ACBrBoleto1.NomeArqRemessa:= Format('CB%.2d%.2d%.2d.REM',[MonthOf(Date),DayOf(Date) , numero_remessa]);
    //ACBrBoleto1.NomeArqRemessa:= Format('remessa_%s_%.4d.txt',[ACBrBoleto1.Banco.Nome, numero_remessa]);
    ACBrBoleto1.LayoutRemessa := c400;
    ACBrBoleto1.GerarRemessa( numero_remessa );
    ExecSql(dbConnect.ZConnection1,'Update boleto SET remessa=%d Where id in (Select boleto From boleto_contas_receber Where contas_receber in (%s))',[numero_remessa, lista]);
    ExecSql(dbConnect.ZConnection1,'Commit');
    RefreshTable( qryCtaReceber );
    qryCtaReceber.EnableControls;
    ShowMessage('Remessa gerada com sucesso.');
  Except
    ExecSql(dbConnect.ZConnection1,'Rollback');
    Raise;
  end;
end;

procedure TfrmCtaReceber.ToolButton11Click(Sender: TObject);
begin
  PostTable(qryCtaReceber);
end;

procedure TfrmCtaReceber.ToolButton12Click(Sender: TObject);
begin
  AlternateColor := ReadIntDefaultIni('configuracoes','ColorButton1_ButtonColor',clWhite);
  RLLabel1.Caption:= Application.Title;
  if ExtendedNotebook1.PageIndex = 0 then begin
    RLLabel2.Caption := Format('Periodo de %s a %s',[DateEdit1.Text,DateEdit2.Text]);
    RLReport1.PreviewModal;

  end;
end;

procedure TfrmCtaReceber.FormCreate(Sender: TObject);
begin
  OpenTable( qryCtaReceber );
  ordem := 'data_vencimento';
  DateEdit1.Date := StartOfTheMonth(Date);
  DateEdit2.Date := EndOfTheMonth(Date);
end;

procedure TfrmCtaReceber.btAplicarClick(Sender: TObject);
Var Where,s : String;
begin
  StartWait;
  try
    Where := ' Where (0=0) ';
    if rbEmissao.Checked then
       Where += Format(' and cr.dataconta Between ''%s'' and ''%s''',[DateEdit1.Text,DateEdit2.Text]);
    if rbVencto.Checked then
       Where += Format(' and cr.data_vencimento Between ''%s'' and ''%s''',[DateEdit1.Text,DateEdit2.Text]);
    if rbPagamento.Checked then
       Where += Format(' and cr.data_pagamento Between ''%s'' and ''%s''',[DateEdit1.Text,DateEdit2.Text]);

    if Length(edCliente.Text) > 0 then
         Where  += Format(' and (cr.descricao like ''%%%s%%'')',[ExtractWord(WordCount(edCliente.Text,['-']),edCliente.Text,['-'])]);
    if Length(edConta.Text) > 0 then
       Where  += Format(' and (pc.conta like ''%s%%'')',[ExtractWord(1,edConta.Text,['-']) ]);
    if Length(edRemessa.Text) > 0 then
       Where  += Format(' and (b.remessa = %s)',[edRemessa.Text]);

    Case rgSituacao.ItemIndex of
       1 : Where += Format(' and (cr.data_vencimento < ''%s'' and cr.data_pagamento is null)',[DateToStr(Date)]);
       2 : Where += ' and (cr.data_pagamento is not null)';
    end;

    qryCtaReceber.close;
    qryCtaReceber.Sql.clear;
    qryCtaReceber.Sql.Add('SELECT (conta_credito||''-''||pc.descricao)::::varchar(80) as vdescricao_credito,');
    qryCtaReceber.Sql.Add('       pc.conta as vconta_credito,cr.origem,');
    qryCtaReceber.Sql.Add('       cr.id, id_nf, documento, cr.descricao, dataconta, cr.data_vencimento,');
    qryCtaReceber.Sql.Add('       data_pagamento, valor_devido, desconto, juros, valor_pago, observacao,');
    qryCtaReceber.Sql.Add('       conta_credito, conta_debito, banco_negociado, cr.parcela, cr.total_parcelas,');
    qryCtaReceber.Sql.Add('       cliente,cr.conta, false as selecionado, b.id as boleto,b.nosso_numero,b.remessa,b.banco');
    qryCtaReceber.Sql.Add('  FROM contas_receber cr');
    qryCtaReceber.Sql.Add('  Left Join boleto_contas_receber bc ON bc.contas_receber=cr.id');
    qryCtaReceber.Sql.Add('  Left Join boleto                b  ON b.id=bc.boleto');
    qryCtaReceber.Sql.Add('  Left Join plano_contas pc ON cr.conta_credito=pc.id');
    qryCtaReceber.Sql.Add(Where);
    //qryCtaReceber.Sql.Add('Order by '+ordem);
    OpenTable( qryCtaReceber );
    qryCtaReceber.First;
  finally
    StopWait;
  end;
end;

procedure TfrmCtaReceber.btRemessaRetornoClick(Sender: TObject);
Var boleto_config : Integer;
    res : Variant;
    c: LongInt;
begin
  c := StrToIntDef(ExecSql(dbConnect.ZConnection1,'Select count(*) From boleto_config'),1);
  if c > 1 then
  begin
    res := ShowSearchModal(dbConnect.ZConnection1,'boleto_config','nome','id','nome',True);
    if VarIsBlank(res) then exit;
    boleto_config := res;
  end else
  begin
     boleto_config := StrToIntDef(ExecSql(dbConnect.ZConnection1,'Select id From boleto_config'),1);
  end;
  InicializaConfigBoleto(ACBrBoleto1,boleto_config, StrToInt(getEmpresaPadrao()));
  ShowRetornoBoleto( ACBrBoleto1 );
end;

procedure TfrmCtaReceber.DateEdit1AcceptDate(Sender: TObject;
  var ADate: TDateTime; var AcceptDate: Boolean);
begin
   AcceptDate := True;
   DateEdit2.date := EndOfTheMonth(ADate);
end;

procedure TfrmCtaReceber.dsCtaReceberStateChange(Sender: TObject);
begin
  ToolButton11.Enabled := qryCtaReceber.State in dsEditModes;
end;

procedure TfrmCtaReceber.edContaButtonClick(Sender: TObject);
var ret : Variant;
    filtro: String;
begin
  filtro := '(conta like ''1.%'')';
  ret:= ShowSearchModal(dbConnect.ZConnection1,'plano_contas','conta,descricao','conta,descricao','conta',true,filtro);
  if VarIsBlank(ret) then exit;
  edConta.Text:= Format('%s-%s',[ret[0],ret[1]]); ;
end;

procedure TfrmCtaReceber.ExtendedNotebook1Change(Sender: TObject);
begin
  CenterControl(GroupBox2);
  CenterControl(GroupBox3);
end;

procedure TfrmCtaReceber.ToolButton1Click(Sender: TObject);
begin
    ClosePageThisForm(Self);
end;

procedure TfrmCtaReceber.ToolButton3Click(Sender: TObject);
Var Sql : String;
begin
  if MessageDlg('Voce que criar uma copia da conta atual ?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then exit;
  sql := 'Insert into contas_receber (id_nf, documento, descricao, dataconta, data_vencimento, '+
         '     data_pagamento, valor_devido, desconto, juros, valor_pago, observacao, '+
         '     conta_credito, conta_debito, banco_negociado, cliente, parcela, '+
         '     total_parcelas) '+
         'SELECT id_nf, documento, descricao, dataconta, data_vencimento, '+
         '     data_pagamento, valor_devido, desconto, juros, valor_pago, observacao, '+
         '     conta_credito, conta_debito, banco_negociado, cliente, parcela, '+
         '     total_parcelas '+
         'FROM contas_receber Where id=%d';
  ExecSql(dbConnect.ZConnection1,sql,[qryCtaReceberid.AsInteger]);
  btAplicar.Click;
end;

procedure TfrmCtaReceber.ToolButton5Click(Sender: TObject);
begin
  ExtendedNotebook1.PageIndex:= 1;
  qryCtaReceber.Append;
  qryCtaReceberdataconta.ASDateTime := Date;
  DBEdit2.SetFocus;
end;

procedure TfrmCtaReceber.ToolButton6Click(Sender: TObject);
begin
  EditTable(qryCtaReceber);
end;

procedure TfrmCtaReceber.ToolButton9Click(Sender: TObject);
Var i : Integer;
    ncontas: Integer;
    lista_cta: String;
begin
  qryCtaReceber.DisableControls;
  qryCtaReceber.First;
  ncontas   := 0;
  lista_cta := '';
  While Not qryCtaReceber.Eof do begin
    if qryCtaReceberselecionado.AsBoolean then begin
       inc(ncontas);
       AddWithSeparator(lista_cta, qryCtaReceberid.AsString,',');
    end;
    qryCtaReceber.Next;
  end;
  qryCtaReceber.First;
  qryCtaReceber.EnableControls;
  if length(lista_cta) = 0 then
     Raise Exception.Create('Selecione uma conta.');
  ConfirmDelete;
  ExecSql(dbConnect.ZConnection1,'Delete From contas_receber Where id in (%s)',[lista_cta]);
  btAplicar.Click();
end;

procedure TfrmCtaReceber.IncluiBoleto( const id : Integer ) ;
var
  Titulo    : TACBrTitulo;
  qryBol, qrySac: TZQuery;
begin
   qryBol := ExecSqlQuery(dbConnect.ZConnection1,'Select * from boleto Where id=(Select boleto From boleto_contas_receber where contas_receber=%d)',[id]);
   qrySac := ExecSqlQuery(dbConnect.ZConnection1,'Select * from clientes c Where c.id=(Select cliente From contas_receber Where id=%d)',[id]);

   Titulo := ACBrBoleto1.CriarTituloNaLista;
   with Titulo do
   begin
      Vencimento        := qryBol.FieldByName('data_vencimento').AsDateTime;//edtVencimento.Date;
      DataDocumento     := qryBol.FieldByName('data_documento').AsDateTime;
      NumeroDocumento   := qryBol.FieldByName('numero_documento').AsString;
      EspecieDoc        := qryBol.FieldByName('especie_doc').AsString;
      if StrToInt(IfThen(qryBol.FieldByName('aceite').AsBoolean,'0','1'))  = 0 then
         Aceite := atSim
      else
         Aceite := atNao;
      Carteira          := qryBol.FieldByName('carteira').AsString;
      DataProcessamento := Now;
      NossoNumero       := qryBol.FieldByName('nosso_numero').AsString;
      ValorDocumento    := qryBol.FieldByName('valor_boleto').AsCurrency;
      {Cliente}
      Sacado.NomeSacado := TiraAcentos(qrySac.FieldByName('nome').AsString);//edtNome.Text;
      Sacado.CNPJCPF    := OnlyNumber(qrySac.FieldByName('cnpj').AsString);//OnlyNumber(edtCPFCNPJ.Text);
      Sacado.Logradouro := TiraAcentos(ExtractWord(1,qrySac.FieldByName('endereco').AsString,[',']));//edtEndereco.Text;
      Sacado.Numero     := ExtractWord(2,qrySac.FieldByName('nome').AsString,[',']);//edtNumero.Text;
      Sacado.Bairro     := TiraAcentos(qrySac.FieldByName('bairro').AsString);//edtBairro.Text;
      Sacado.Cidade     := TiraAcentos(qrySac.FieldByName('cidade').AsString);//edtCidade.Text;
      Sacado.UF         := qrySac.FieldByName('uf').AsString;//edtUF.Text;
      Sacado.CEP        := OnlyNumber(qrySac.FieldByName('cep').AsString);//OnlyNumber(edtCEP.Text);
      if Length(Sacado.CNPJCPF) > 11 then
        Sacado.Pessoa     := pJuridica
      else
        Sacado.Pessoa     := pFisica;//pFisica,pJuridica,pOutras

      {Valores}
      ValorAbatimento   := 0.00;//StrToCurrDef(edtValorAbatimento.Text,0);
      LocalPagamento    := TiraAcentos(qryBol.FieldByName('local_pagamento').AsString);//edtLocalPag.Text;
      ValorDesconto     := 0.00;//StrToCurrDef(edtValorDesconto.Text,0);
      DataMoraJuros     := qryBol.FieldByName('data_multa').AsDateTime;
      ValorMoraJuros    := qryBol.FieldByName('valor_mora').AsCurrency;
      DataDesconto      := 0;//edtDataDesconto.Date;
      DataAbatimento    := 0;//edtDataAbatimento.Date;
      DataProtesto      := 0;//edtDataProtesto.Date;

      //PercentualMulta   := qryBol.FieldByName('multa_porcento').AsCurrency;//StrToCurrDef(edtMulta.Text,0);

      Mensagem.Text     := TiraAcentos(qryBol.FieldByName('instrucoes').AsString);//memMensagem.Text;
      OcorrenciaOriginal.Tipo := toRemessaRegistrar;
      Instrucao1        := ACBrUtil.PadRight(trim(qryBol.FieldByName('instrucao1').AsString),2,'0');
      Instrucao2        := ACBrUtil.PadRight(trim(qryBol.FieldByName('instrucao2').AsString),2,'0');
      TotalParcelas     := qryBol.FieldByName('tot_parcelas').AsInteger;
      Parcela           := qryBol.FieldByName('parcela').AsInteger;
   end;
end;

end.

