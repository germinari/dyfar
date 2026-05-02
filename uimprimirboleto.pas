unit uImprimirBoleto;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LR_Class, LResources, Forms, Controls, Graphics,
  Dialogs, StdCtrls, EditBtn, ACBrBoleto, ACBrBoletoFCFortesFr, ExtCtrls,
  MaskEdit, Buttons, Menus, rxcurredit, rxdbcomb, ZDataset, ACBrUtil, ACBrMail;

type


  { TfrmImprimirBoleto }

  TDuplicata = class
     id_conta  : Integer;
     documento : String;
     id_boleto : Integer;
  end;

  TfrmImprimirBoleto = class ( TForm )
     ACBrBoleto1: TACBrBoleto;
     ACBrBoletoFCFortes1 : TACBrBoletoFCFortes ;
     btnImprimir: TButton;
     Button1: TButton;
     Fechar: TButton;
     Button4: TButton;
     cbxDuplicatas: TComboBox;
     cbxSomenteAtual: TCheckBox;
     edtDataDoc: TDateEdit;
     edtLocalPag: TEdit;
     edtMulta: TCurrencyEdit;
     edtValorDoc: TCurrencyEdit;
     edtCEP: TMaskEdit;
     edtCPFCNPJ: TEdit;
     edtEmail: TEdit;
     edtUF: TEdit;
     edtCidade: TEdit;
     edtBairro: TEdit;
     edtComplemento: TEdit;
     edtNumero: TEdit;
     edtEndereco: TEdit;
     edtNome: TEdit;
     edtNumeroDoc: TEdit;
     edtVencimento: TDateEdit;
     GroupBox1: TGroupBox;
     GroupBox2: TGroupBox;
     GroupBox4: TGroupBox;
     Label1: TLabel;
     Label11: TLabel;
     Label13: TLabel;
     Label14: TLabel;
     Label16: TLabel;
     Label17: TLabel;
     Label18: TLabel;
     Label19: TLabel;
     Label2: TLabel;
     Label20: TLabel;
     Label21: TLabel;
     Label22: TLabel;
     Label23: TLabel;
     Label3: TLabel;
     Label31: TLabel;
     Label4: TLabel;
     Label5: TLabel;
     Label6: TLabel;
     memMensagem: TMemo;
     Panel2: TPanel;
     procedure ACBrBoletoFCFortes1ObterLogo(const PictureLogo: TPicture;
       const NumeroBanco: Integer);
     procedure btnIncluiBoletoClick ( Sender: TObject ) ;
     procedure btnImprimirClick ( Sender: TObject ) ;
     procedure cbxDuplicatasChange(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
     qryBol, qryCta, qryCli, qryBolCfg, qryNF : TZQuery;
     function  CriarNovoBoleto: Integer;

     procedure carregarBoleto( const id : Integer );
     procedure carregarConfigBoleto(const id_cfg_bol, empresa : Integer);
     procedure carregaNotaFiscal( const id : Integer);
     procedure carregaContaReceber( const id_conta : Integer);
     procedure carregarCliente( const id : Integer);
     function  CalcularValorMulta:Currency;

  end;

function ShowImprimeBoleto( const id_nf, id_cfg_bol, empresa : Integer ):Boolean;

var
  frmImprimirBoleto: TfrmImprimirBoleto;

implementation

Uses typinfo, math, udbConnect, sistema_config, strutils, BDSqlUtils,
  WagVclUtils, uEnviarEmail, ACBrBoletoConversao, LazFileUtils;

function ShowImprimeBoleto( const id_nf, id_cfg_bol, empresa : Integer ): Boolean;
begin
  with TfrmImprimirBoleto.Create(Application) do begin
     carregarConfigBoleto(id_cfg_bol, empresa);
     carregaNotaFiscal( id_nf );
     cbxDuplicatasChange(Nil);
     carregarCliente( qryNF.FieldByName('codcliente').AsInteger );
     ShowModal;
     Free;
  end;
end;

{$R *.lfm}

{ TfrmImprimirBoleto }

procedure TfrmImprimirBoleto.btnImprimirClick ( Sender: TObject ) ;
Var i, ini, fim : Integer;
Var Duplicata : TDuplicata;
    diretorio, sdir , msg, s: String;
    SL: TStringList;
    qry: TZQuery;
begin
  if Sender = Button1 then begin
    sdir := ReadStringINI(ConfigRecord.FileNamePath,'boleto','DirBoleto',DocumentDir());
    if not SelectDirectory('Onde salvar o boleto ?', sdir , diretorio) then exit;
    SaveStringIni(ConfigRecord.FileNamePath,'boleto','DirBoleto',diretorio);
  end;

  ACBrBoleto1.ListadeBoletos.Clear;
  ini := IfThen(cbxSomenteAtual.Checked, cbxDuplicatas.ItemIndex,0);
  fim := IfThen(cbxSomenteAtual.Checked, cbxDuplicatas.ItemIndex, cbxDuplicatas.Items.Count -1 );
  for i := ini to fim  do begin
     Duplicata := cbxDuplicatas.Items.Objects[i] as TDuplicata;
     if Duplicata.id_boleto > 0 then begin
        carregaContaReceber( Duplicata.id_conta );
        carregarBoleto(Duplicata.id_boleto)
     end else begin
        carregaContaReceber( Duplicata.id_conta );
        Duplicata.id_boleto := CriarNovoBoleto;
        ExecSql(dbConnect.ZConnection1,'INSERT INTO boleto_contas_receber(boleto,contas_receber) '+
                                       'VALUES (%d, %d)',
                                       [Duplicata.id_boleto,
                                        Duplicata.id_conta]);
     end;
     btnIncluiBoletoClick(nil);
  end;

  if Sender = Button1 then begin
     ACBrBoleto1.ACBrBoletoFC.NomeArquivo := PathWithDelim( diretorio ) + 'boleto_'+ ReplaceStr(cbxDuplicatas.Text,'/','_') + '.pdf';
     ACBrBoleto1.GerarPDF;
  end;
  if Sender = btnImprimir then begin
     dbConnect.ConfigReport(Nil);
     ACBrBoleto1.Imprimir;
  end;
  if Sender = Button4 then begin
     dbConnect.ConfigReport(Nil);
     ACBrBoleto1.ACBrBoletoFC.NomeArquivo := GetTempDir + 'boleto_'+ ReplaceStr(cbxDuplicatas.Text,'/','_') + '.pdf';
     ACBrBoleto1.GerarPDF;
     qry := ExecSqlQuery(dbConnect.ZConnection1,'Select * from empresa Where id=%s',[getEmpresaPadrao]);
     msg := 'Segue anexo boletos';
     msg += #10#13;
     msg += '-------------------------'#10#13;
     msg += qry.FieldByName('nome').AsString+#10#13;
     s := FormatMaskText('(99) 9999-9999;0;_',qry.FieldByName('fone').AsString);
     msg += 'Fone '+s+#10#13;
     EnviarEmail(getSmtpConfig,edtEmail.Text,'Boletos Makromed',msg,ACBrBoleto1.ACBrBoletoFC.NomeArquivo );
  end;
end;

procedure TfrmImprimirBoleto.carregarBoleto( const id : Integer );
begin
   qryBol := ExecSqlQuery(dbConnect.ZConnection1,'Select * from boleto Where id=%d',[id]);
   if qryBol.Eof and qryBol.bof then exit;
   edtVencimento.Date       := qryBol.FieldByName('data_vencimento').AsDateTime;
   edtDataDoc.Date          := qryBol.FieldByName('data_documento').AsDateTime;
   edtNumeroDoc.Text        := qryBol.FieldByName('numero_documento').AsString;
   //edtEspecieDoc.Text       := qryBol.FieldByName('especie_doc').AsString;
   //cbxAceite.ItemIndex      := StrToInt(IfThen(qryBol.FieldByName('aceite').AsBoolean,'0','1'));
   //edtCarteira.Text         := qryBol.FieldByName('carteira').AsString;
   //edtNossoNro.Text         := qryBol.FieldByName('nosso_numero').AsString;

   edtLocalPag.Text         := qryBol.FieldByName('local_pagamento').AsString;// + ACBrBoleto1.Banco.Nome;
   edtValorDoc.Value        := qryBol.FieldByName('valor_boleto').AsCurrency;
   //edtValorAbatimento.Value := qryBol.FieldByName('valor_abatimento').AsCurrency;
   //edtMoraJuros.Value       := qryBol.FieldByName('valor_mora').AsCurrency;
   //edtValorDesconto.Value   := qryBol.FieldByName('valor_desconto').AsCurrency;
   //edtValorAbatimento.Value := qryBol.FieldByName('valor_abatimento').AsCurrency;
   edtMulta.Value           := qryBol.FieldByName('multa_porcento').AsCurrency;
   //edtDataMora.Date         := qryBol.FieldByName('data_multa').AsDateTime;
   //edtDataDesconto.Date     := qryBol.FieldByName('data_desconto').AsDateTime;
   //edtDataAbatimento.Date   := qryBol.FieldByName('data_abatimento').AsDateTime;
   //edtDataProtesto.Date     := qryBol.FieldByName('data_protesto').AsDateTime;
   memMensagem.Text         := qryBol.FieldByName('instrucoes').AsString;
   //edtInstrucoes1.Text      := ACBrUtil.PadRight(trim(qryBol.FieldByName('instrucao1').AsString),2,'0');
   //edtInstrucoes2.Text      := ACBrUtil.PadRight(trim(qryBol.FieldByName('instrucao2').AsString),2,'0');

end;

procedure TfrmImprimirBoleto.carregaContaReceber( const id_conta : Integer);
begin
  qryCta := ExecSqlQuery(dbConnect.ZConnection1,'Select * From contas_receber Where id=%d',[id_conta]);
  edtNumeroDoc.Text   := Format('%.6d',[qryNF.FieldByName('numeroctlform').AsInteger]);
  edtValorDoc.Value   := qryCta.FieldByName('valor_devido').AsCurrency;
  edtVencimento.Date  := qryCta.FieldByName('data_vencimento').AsDateTime;
  edtDataDoc.Date     := qryCta.FieldByName('dataconta').AsDateTime;
end;

procedure TfrmImprimirBoleto.carregarCliente( const id : Integer);
begin
  qryCli   := ExecSqlQuery(dbConnect.ZConnection1,'Select * from clientes Where id=%d',[id]);
  {Sacado}
  edtNome.Text             := qryCli.FieldByName('nome').AsString;
  edtCPFCNPJ.Text          := OnlyNumber(qryCli.FieldByName('cnpj').AsString);
  edtEndereco.Text         := ExtractWord(1,qryCli.FieldByName('endereco').AsString,[',']);
  edtNumero.Text           := ExtractWord(2,qryCli.FieldByName('endereco').AsString,[',']);
  edtBairro.Text           := qryCli.FieldByName('bairro').AsString;
  edtCidade.Text           := qryCli.FieldByName('cidade').AsString;
  edtUF.Text               := qryCli.FieldByName('uf').AsString;
  edtCEP.Text              := OnlyNumber(qryCli.FieldByName('cep').AsString);
  edtEmail.Text            := qryCli.FieldByName('email').AsString;
end;

function TfrmImprimirBoleto.CalcularValorMulta: Currency;
begin
  Result := CalculaPerc(edtMulta.Value, edtValorDoc.Value)/30;
  if (edtMulta.Value > 0) and (Result = 0) then
     Result := 0.01;
end;

procedure TfrmImprimirBoleto.carregarConfigBoleto(const id_cfg_bol, empresa : Integer);
begin
  {Configurar o boleto}
  qryBolCfg             := InicializaConfigBoleto(ACBrBoleto1, id_cfg_bol, empresa );
  edtMulta.Value        := qryBolCfg.FieldByName('multa_mora').AsCurrency;
  edtLocalPag.Text      := qryBolCfg.FieldByName('local_pagamento').AsString;
  memMensagem.Lines.Text:= qryBolCfg.FieldByName('orientacoes').AsString;
end;

function  TfrmImprimirBoleto.CriarNovoBoleto:Integer;
begin
  qryBol := ExecSqlQuery(dbConnect.ZConnection1,'Select * from boleto Where id=%d',[0]);
  qryBol.Append;
  qryBol.FieldByName('banco').AsInteger            := qryBolCfg.FieldByName('banco').AsInteger;
  qryBol.FieldByName('local_pagamento').AsString   := qryBolCfg.FieldByName('local_pagamento').AsString;
  qryBol.FieldByName('especie_doc').AsString       := qryBolCfg.FieldByName('especie_doc').AsString;
  qryBol.FieldByName('especie_moeda').AsString     := qryBolCfg.FieldByName('especie_moeda').AsString;
  qryBol.FieldByName('aceite').AsBoolean           := qryBolCfg.FieldByName('aceite').AsBoolean;
  qryBol.FieldByName('carteira').AsString          := qryBolCfg.FieldByName('carteira').AsString;
  qryBol.FieldByName('instrucoes').AsString        := qryBolCfg.FieldByName('orientacoes').AsString;
  qryBol.FieldByName('instrucao1').AsString        := qryBolCfg.FieldByName('instrucao1').AsString;
  qryBol.FieldByName('instrucao2').AsString        := qryBolCfg.FieldByName('instrucao2').AsString;
  qryBol.FieldByName('numero_documento').AsString  := qryCta.FieldByName('documento').AsString;
  qryBol.FieldByName('layout').AsInteger           := qryBolCfg.FieldByName('layout').AsInteger;
  qryBol.FieldByName('remessa').AsInteger          := 0;
  qryBol.FieldByName('data_documento').AsDateTime  := edtDataDoc.Date;

  qryBol.FieldByName('nosso_numero').AsInteger     := StrToIntDef(ExecSql(dbConnect.ZConnection1,'Select coalesce(max(nosso_numero::integer),0) +1 From boleto Where banco=%d',[qryBolCfg.FieldByName('banco').AsInteger]),1);
  qryBol.FieldByName('valor_desconto').AsCurrency  := 0.00;//qryBolCfg.FieldByName('valor_desconto').AsCurrency;
  qryBol.FieldByName('valor_abatimento').AsCurrency:= 0.00;//qryBolCfg.FieldByName('valor_abatimento').AsCurrency;
  qryBol.FieldByName('multa_porcento').AsCurrency  := 0.00;//.FieldByName('multa_mora').AsCurrency;
  qryBol.FieldByName('valor_mora').AsCurrency      := 0.00;
  if edtMulta.Value > 0 then
  begin
     qryBol.FieldByName('valor_mora').AsCurrency     := CalcularValorMulta();//qryBolCfg.FieldByName('valor_mora').AsCurrency;
     qryBol.FieldByName('multa_porcento').AsCurrency := edtMulta.Value;
  end;

  qryBol.FieldByName('data_emissao').AsDateTime    := date();
  qryBol.FieldByName('data_vencimento').AsDateTime := edtVencimento.Date;// qryCta.FieldByName('data_vencimento').AsDateTime;
  qryBol.FieldByName('data_multa').AsDateTime      := edtVencimento.Date + 1;//qryCta.FieldByName('data_vencimento').AsDateTime + 1;
  qryBol.FieldByName('data_desconto').AsDateTime   := 0;
  qryBol.FieldByName('data_abatimento').AsDateTime := 0;
  qryBol.FieldByName('data_protesto').AsDateTime   := 0;
  qryBol.FieldByName('valor_boleto').AsCurrency    := edtValorDoc.Value;//.FieldByName('valor_devido').AsCurrency;

  qryBol.FieldByName('parcela').AsInteger          := qryCta.FieldByName('parcela').AsInteger;
  qryBol.FieldByName('tot_parcelas').AsInteger     := qryCta.FieldByName('total_parcelas').AsInteger;

  qryBol.Post;
  Result := LastInsertID(dbConnect.ZConnection1,'boleto_id_seq');
end;

procedure TfrmImprimirBoleto.carregaNotaFiscal( const id : Integer);
Var Duplicatas : TDuplicata;
  qryCtas : TZQuery;
begin
  if id < 0 then
     qryNF   := ExecSqlQuery(dbConnect.ZConnection1,'Select id, cliente as codcliente, id as numeroctlform from pedido_venda Where id=%d',[Abs(id)])
  else
     qryNF   := ExecSqlQuery(dbConnect.ZConnection1,'Select id, codcliente, numeroctlform from nfsaida Where id=%d',[id]);
  qryCtas := ExecSqlQuery(dbConnect.ZConnection1,'Select cr.id,cr.documento,bc.boleto From contas_receber cr '+
                                                 'Left Join boleto_contas_receber bc ON bc.contas_receber=cr.id '+
                                                 'Where cr.id_nf=%d '+
                                                 'Order by cr.id',[Abs(id)]);
  cbxDuplicatas.Clear;
  while not qryCtas.Eof do begin
    Duplicatas := TDuplicata.Create;
    Duplicatas.id_conta := qryCtas.FieldByName('id').AsInteger;
    Duplicatas.documento:= qryCtas.FieldByName('documento').AsString;
    Duplicatas.id_boleto:= qryCtas.FieldByName('boleto').AsInteger;
    cbxDuplicatas.AddItem(qryCtas.FieldByName('documento').AsString,Duplicatas);
    qryCtas.Next;
  end;
  cbxDuplicatas.ItemIndex:= 0;
  qryCtas.Close;
  qryCtas.Free;
end;

procedure TfrmImprimirBoleto.btnIncluiBoletoClick ( Sender: TObject ) ;
var
  Titulo    : TACBrTitulo;
begin
   Titulo := ACBrBoleto1.CriarTituloNaLista;
   with Titulo do
   begin
      Vencimento        := qryBol.FieldByName('data_vencimento').AsDateTime;//edtVencimento.Date;
      DataDocumento     := edtDataDoc.Date;
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
      Sacado.NomeSacado := edtNome.Text;
      Sacado.CNPJCPF    := OnlyNumber(edtCPFCNPJ.Text);
      Sacado.Logradouro := edtEndereco.Text;
      Sacado.Numero     := edtNumero.Text;
      Sacado.Bairro     := edtBairro.Text;
      Sacado.Cidade     := edtCidade.Text;
      Sacado.UF         := edtUF.Text;
      Sacado.CEP        := OnlyNumber(edtCEP.Text);
      if Length(Sacado.CNPJCPF) > 11 then
        Sacado.Pessoa     := pJuridica
      else
        Sacado.Pessoa     := pFisica;//pFisica,pJuridica,pOutras
      {Valores}
      ValorAbatimento   := 0.00;//StrToCurrDef(edtValorAbatimento.Text,0);
      LocalPagamento    := edtLocalPag.Text;
      ValorDesconto     := 0.00;//StrToCurrDef(edtValorDesconto.Text,0);
      ValorMoraJuros    := CalcularValorMulta;//StrToCurrDef(edtMoraJuros.Text,0);
      DataMoraJuros     := qryBol.FieldByName('data_multa').AsDateTime;//edtVencimento.Date;//edtDataMora.Date;
      DataDesconto      := 0;//edtDataDesconto.Date;
      DataAbatimento    := 0;//edtDataAbatimento.Date;
      DataProtesto      := 0;//edtDataProtesto.Date;
      //PercentualMulta   := StrToCurrDef(edtMulta.Text,0);
      Mensagem.Text     := memMensagem.Text;
      OcorrenciaOriginal.Tipo  := toRemessaRegistrar;
      Instrucao1        := ACBrUtil.PadRight(trim(qryBol.FieldByName('instrucao1').AsString),2,'0');
      Instrucao2        := ACBrUtil.PadRight(trim(qryBol.FieldByName('instrucao2').AsString),2,'0');
      Parcela           := qryCta.FieldByName('parcela').AsInteger;
      TotalParcelas     := qryCta.FieldByName('total_parcelas').AsInteger;
   end;
end;

procedure TfrmImprimirBoleto.ACBrBoletoFCFortes1ObterLogo(
  const PictureLogo: TPicture; const NumeroBanco: Integer);
var path : String;
begin
  path := obtemPathSistemaNFe(tpsImagens ) + 'colorido/' + Format('%.3d.bmp',[NumeroBanco]);
  path := GetForcedPathDelims(path);
  PictureLogo.LoadFromFile( path );
end;

procedure TfrmImprimirBoleto.cbxDuplicatasChange(Sender: TObject);
Var Duplicata : TDuplicata;
begin
  Duplicata := cbxDuplicatas.Items.Objects[cbxDuplicatas.ItemIndex] as TDuplicata;
  carregaContaReceber( Duplicata.id_conta );
  if Duplicata.id_boleto > 0 then
     carregarBoleto(Duplicata.id_boleto);
end;

initialization

RegisterClass(TfrmImprimirBoleto);

end.

