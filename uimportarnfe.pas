unit uImportarNFe;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, IniPropStorage, Buttons, EditBtn,
  uTipoNF, ZConnection, ZDataset, ZSqlUpdate, Math, ACBrNFe.Classes,
  rxtooledit, ACBrNFe.XmlReader;

type

  { TfrmImportarNFe }

  TfrmImportarNFe = class(TForm)
   // ACBrNFe1: TACBrNFe;
    btImportar: TButton;
    Button2: TButton;
    Edit1: TEdit;
    FileNameEdit1: TFileNameEdit;
    Image1: TImage;
    Label11: TLabel;
    Label18: TLabel;
    lbNatureza: TLabel;
    lbErro: TLabel;
    Label10: TLabel;
    lbDataEmissao: TLabel;
    lbEmitente: TLabel;
    lbDestinatario: TLabel;
    lbChavenfe: TLabel;
    lbNumero: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbSerie: TLabel;
    lbQuantItens: TLabel;
    lbVlrTotal: TLabel;
    OpenDialog1: TOpenDialog;
    ProgressBar1: TProgressBar;
    qryFornecedorbairro: TStringField;
    qryFornecedorcep: TStringField;
    qryFornecedorcidade: TStringField;
    qryFornecedorcnpj: TStringField;
    qryFornecedorcomplemento: TStringField;
    qryFornecedorcontato: TStringField;
    qryFornecedordatacadastro: TDateField;
    qryFornecedoremail: TStringField;
    qryFornecedorendereco: TStringField;
    qryFornecedorfantasia: TStringField;
    qryFornecedorfax: TStringField;
    qryFornecedorid: TLongintField;
    qryFornecedorinscestadual: TStringField;
    qryFornecedornome: TStringField;
    qryFornecedorobservacao: TMemoField;
    qryFornecedorplano_contas: TLongintField;
    qryFornecedorstatus: TStringField;
    qryFornecedortelefone1: TStringField;
    qryFornecedortelefone2: TStringField;
    qryFornecedoruf: TStringField;
    qryFornecedorwebpage: TStringField;
    qryNFEntrada: TZQuery;
    qryNFEntradabairro: TStringField;
    qryNFEntradabaseicms: TFloatField;
    qryNFEntradabaseicmssub: TFloatField;
    qryNFEntradacep: TStringField;
    qryNFEntradachave_nfe: TStringField;
    qryNFEntradacidade: TStringField;
    qryNFEntradacidadetransp: TStringField;
    qryNFEntradacliente_forn: TLongintField;
    qryNFEntradacnpjcpf: TStringField;
    qryNFEntradacnpjtransp: TStringField;
    qryNFEntradacodtransp: TLongintField;
    qryNFEntradacomplemento: TStringField;
    qryNFEntradacrt: TLongintField;
    qryNFEntradadadosadicionais: TMemoField;
    qryNFEntradadataemissao: TDateField;
    qryNFEntradadataentrada: TDateField;
    qryNFEntradadatahoraentrada: TDateTimeField;
    qryNFEntradadesconto: TFloatField;
    qryNFEntradaendereco: TStringField;
    qryNFEntradaendtransp: TStringField;
    qryNFEntradaespecievol: TStringField;
    qryNFEntradafinalidade_nf: TLongintField;
    qryNFEntradafornecedor: TStringField;
    qryNFEntradafreteconta: TStringField;
    qryNFEntradaid: TLongintField;
    qryNFEntradaietransp: TStringField;
    qryNFEntradainscrestadual: TStringField;
    qryNFEntradainscrestsubtrib: TStringField;
    qryNFEntradalancada: TBooleanField;
    qryNFEntradamarcavol: TStringField;
    qryNFEntradanatop: TStringField;
    qryNFEntradanometransp: TStringField;
    qryNFEntradanumeronf: TLongintField;
    qryNFEntradanumerovol: TStringField;
    qryNFEntradapesobrutovol: TFloatField;
    qryNFEntradapesoliquidovol: TFloatField;
    qryNFEntradaplacaveiculo: TStringField;
    qryNFEntradaquantvolumes: TLongintField;
    qryNFEntradareservadofisco: TMemoField;
    qryNFEntradaserie: TLongintField;
    qryNFEntradatelefone1: TStringField;
    qryNFEntradauf: TStringField;
    qryNFEntradauftransp: TStringField;
    qryNFEntradaufveiculo: TStringField;
    qryNFEntradavalorcofins: TFloatField;
    qryNFEntradavalorfrete: TFloatField;
    qryNFEntradavaloricms: TFloatField;
    qryNFEntradavaloricmssub: TFloatField;
    qryNFEntradavaloripi: TFloatField;
    qryNFEntradavaloroutradesp: TFloatField;
    qryNFEntradavalorpis: TFloatField;
    qryNFEntradavalorseguro: TFloatField;
    qryNFEntradavalortotalnota: TFloatField;
    qryNFEntradavalortotalprodutos: TFloatField;
    qryPreCtaPagarbanco_negociado: TStringField;
    qryPreCtaPagarconta_credito: TLongintField;
    qryPreCtaPagarconta_debito: TLongintField;
    qryPreCtaPagardataconta: TDateField;
    qryPreCtaPagardata_pagamento: TDateField;
    qryPreCtaPagardata_vencimento: TDateField;
    qryPreCtaPagardesconto: TFloatField;
    qryPreCtaPagardescricao: TStringField;
    qryPreCtaPagardocumento: TStringField;
    qryPreCtaPagarfornecedor: TLongintField;
    qryPreCtaPagarid: TLongintField;
    qryPreCtaPagarid_nf: TLongintField;
    qryPreCtaPagarjuros: TFloatField;
    qryPreCtaPagarobservacao: TMemoField;
    qryPreCtaPagarparcela: TLongintField;
    qryPreCtaPagartotal_parcelas: TLongintField;
    qryPreCtaPagarvalor_devido: TFloatField;
    qryPreCtaPagarvalor_pago: TFloatField;
    qryTransportadora: TZReadOnlyQuery;
    qryTransportadorabairro: TStringField;
    qryTransportadoracep: TStringField;
    qryTransportadoracidade: TStringField;
    qryTransportadoracnpj: TStringField;
    qryTransportadoracodtransp: TLongintField;
    qryTransportadoracomplemento: TStringField;
    qryTransportadoracontato: TStringField;
    qryTransportadoradatacadastro: TDateField;
    qryTransportadoraemail: TStringField;
    qryTransportadoraendereco: TStringField;
    qryTransportadorafunccontato: TStringField;
    qryTransportadoraie: TStringField;
    qryTransportadoranometransp: TStringField;
    qryTransportadoraobstransp: TMemoField;
    qryTransportadoratelefone1: TStringField;
    qryTransportadoratelefone2: TStringField;
    qryTransportadorauf: TStringField;
    RxDateEdit1: TRxDateEdit;
    SpeedButton1: TSpeedButton;
    tbItensEntrada: TZQuery;
    QueProduto: TZQuery;
    qryPreCtaPagar: TZQuery;
    qryFornecedor: TZReadOnlyQuery;
    tbItensEntradacest: TStringField;
    tbItensEntradacfop: TStringField;
    tbItensEntradacodificacao_fornecedor: TStringField;
    tbItensEntradacodigo_barras: TStringField;
    tbItensEntradacst_cofins: TLongintField;
    tbItensEntradacst_csosn: TLongintField;
    tbItensEntradacst_ipi: TLongintField;
    tbItensEntradacst_pis: TLongintField;
    tbItensEntradadescricao: TStringField;
    tbItensEntradadescricao_xml: TStringField;
    tbItensEntradaestoque_destino: TStringField;
    tbItensEntradaid: TLongintField;
    tbItensEntradainfadprod: TMemoField;
    tbItensEntradamodbc: TLongintField;
    tbItensEntradamodbcst: TLongintField;
    tbItensEntradancm: TStringField;
    tbItensEntradanfci_opc: TStringField;
    tbItensEntradanfentrada: TLongintField;
    tbItensEntradaorig: TLongintField;
    tbItensEntradapcofins: TFloatField;
    tbItensEntradapicmsst: TFloatField;
    tbItensEntradapipi: TFloatField;
    tbItensEntradapmvast: TFloatField;
    tbItensEntradappis: TFloatField;
    tbItensEntradapredbc: TFloatField;
    tbItensEntradapredbcst: TFloatField;
    tbItensEntradaproduto: TLongintField;
    tbItensEntradap_icms: TFloatField;
    tbItensEntradaquantidade: TFloatField;
    tbItensEntradaquant_estoque: TFloatField;
    tbItensEntradaunidade: TStringField;
    tbItensEntradavalortotal: TFloatField;
    tbItensEntradavalorunitario: TFloatField;
    tbItensEntradavbcicms: TFloatField;
    tbItensEntradavbcipi: TFloatField;
    tbItensEntradavbcst: TFloatField;
    tbItensEntradavbc_cofins: TFloatField;
    tbItensEntradavbc_pis: TFloatField;
    tbItensEntradavcofins: TFloatField;
    tbItensEntradavdesconto: TFloatField;
    tbItensEntradavfrete: TFloatField;
    tbItensEntradavicmsst: TFloatField;
    tbItensEntradavipi: TFloatField;
    tbItensEntradavlr_icms: TFloatField;
    tbItensEntradavlr_unit_estoque: TFloatField;
    tbItensEntradavoutras: TFloatField;
    tbItensEntradavpis: TFloatField;
    tbItensEntradavseguro: TFloatField;
    updItensEntrada: TZUpdateSQL;
    procedure btImportarClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FileNameEdit1AcceptFileName(Sender: TObject; var Value: String);
    procedure FormCreate(Sender: TObject);
  private
    procedure ImportarArquivo(filename : String);

    { private declarations }
    function SetTransportadora(cnpj: String): Boolean;
    function SetFornecedor( cnpj: String):Boolean;
    function LocalizaPeloEAN( codbarras : string):Integer;
    function LocalizaPeloCodForn(  cod_prod, cod_forn: String ):Integer;
    function GetFatorFornecedorToEstoque(const codprod: Integer; out
      fator: currency; out operacao: String): Double;
//    procedure RelancarNota(filename : String);
  public
    { public declarations }
  end;

function ImportarNFe:Integer;

Const VERSAO = '1.0.10';
var
  frmImportarNFe: TfrmImportarNFe;

implementation

{$R *.lfm}

{ TfrmImportarNFe }
                                                           //wagNFe
Uses BDSqlUtils, WagVclUtils, StrUtils, pcnConversao, ACBrUtil, uSearch,
  variants, DisableDefaultDialogError, uEditMemo, ftpsend, IniFiles,
  process, udbConnect, sistema_config, pcnConversaoNFe, DBBlobImage, DateUtils;


function ImportarNFe: Integer;
begin
  with TfrmImportarNFe.Create(Application) do begin
       ShowModal;
       if qryNfEntrada.Active then
          Result := qryNfEntradaid.ASInteger
       else
          Result := 0;
       Free;
  end;
end;

procedure TfrmImportarNFe.btImportarClick(Sender: TObject);
begin
    ImportarArquivo(FileNameEdit1.FileName);
    Close;
end;

procedure TfrmImportarNFe.FileNameEdit1AcceptFileName(Sender: TObject;
  var Value: String);
Var cnpjdest, cnpjemit, cnpjlocal, cod, cod_forn, barras : String;
    i : Integer;
    lista : TStringList;
    nfe: TNFe;
    nfeR: TNFeXmlReader;
begin
  FileNameEdit1.Text    := Value;
  lbErro.Visible        := False;
  btImportar.Enabled    := False;

  nfe  := TNFe.Create;
  nfeR := TNFeXmlReader.Create(nfe);
  nfeR.CarregarArquivo(Value);
  nfeR.LerXml;

  lbNumero.Caption      := Format('%.9d',[NFe.Ide.nNF]);
  lbSerie.Caption       := Format('%.3d',[NFe.Ide.serie]);
  lbNatureza.Caption    := NFe.Ide.natOp;
  lbEmitente.Caption    := NFe.Emit.xNome;
  lbDestinatario.Caption:= NFe.Dest.xNome;
  lbVlrTotal.Caption    := FormatMoney(NFe.Total.ICMSTot.vNF);
  lbDataEmissao.Caption := DateToStr(NFe.Ide.dEmi);
  lbQuantItens.Caption  := Format('%.3d',[NFe.Det.Count]);
  lbChavenfe.Caption    := OnlyNumber(NFe.infNFe.ID);
  RxDateEdit1.Date      := date;

  cnpjdest := NFe.Dest.CNPJCPF;
  cnpjemit := NFe.Emit.CNPJCPF;

  cnpjlocal  := ExecSql(dbConnect.ZConnection1,'Select limpa_cnpj(cnpj) from empresa where id=%s',[getEmpresaPadrao(meCodigo)]);
  if cnpjdest <> cnpjlocal then begin
     if Messagedlg(Format('O destinatario desta nota não é %s, você quer continuar com a entrada?',[getEmpresaPadrao(meNome)]),mtConfirmation,[mbNo,mbYes],0) <> mrYes then begin
       lbErro.Caption:= 'Erro: Destinatário não é '+getEmpresaPadrao(meNome);
       lbErro.Visible:= True;
     end;
  end;

  cod := ExecSql(dbConnect.ZConnection1,'Select chave_nfe from nfentrada where chave_nfe=''%s''',[lbChavenfe.Caption]);
  i := StrToIntdef(ExecSql(dbConnect.ZConnection1,'Select count(*) From nfentrada Where numeronf=%d and limpa_cnpj(cnpjcpf)=''%s'' and serie=%d',
                   [NFe.Ide.nNF,
                    NFe.Emit.CNPJCPF,
                    NFe.Ide.serie]),0);

  if (i > 0) or (length(cod) > 0 ) then begin
    lbErro.Caption    := 'Erro: NF já existe no sistema';
    lbErro.Visible    := True;
    btImportar.Enabled:= False;
    exit;
  end;

  lista   := TStringList.Create;
  cod_forn:= ExecSql(dbConnect.ZConnection1,'Select id from fornecedores where limpa_cnpj(cnpj)=limpa_cnpj(''%s'')',[cnpjemit]);
  if StrToIntDef(cod_forn,0) = 0  then
     lista.Add('Fornecedor não cadastrado');
  for i := 0 to NFe.Det.Count-1 do begin
      cod   := NFe.Det.Items[i].Prod.cProd;
      barras:= NFe.Det.Items[i].Prod.cEAN;
      if (LocalizaPeloCodForn(cod,cod_forn) <= 0) then
        if (LocalizaPeloEAN(barras) <= 0) then
            lista.Add(Format('Item %d não localizado %s, EAN = %s',[i + 1,NFe.Det.Items[i].Prod.xProd,NFe.Det.Items[i].Prod.cEAN]));
  end;

  if lista.Count > 0 then
     EditarMemo('Divergência de produtos',lista,False);
  btImportar.Enabled:= True;

end;

procedure TfrmImportarNFe.FormCreate(Sender: TObject);
begin
  lbNumero.Caption      := '00000000';
  lbSerie.Caption       := '000';
  lbNatureza.Caption    := '';
  lbEmitente.Caption    := '';
  lbDestinatario.Caption:= '';
  lbVlrTotal.Caption    := '0,00';
  lbDataEmissao.Caption := '';
  lbQuantItens.Caption  := '000';
  lbChavenfe.Caption    := '';
  RxDateEdit1.Date      := date;
  FileNameEdit1.InitialDir:= HomeDir;
end;

procedure TfrmImportarNFe.ImportarArquivo(filename : String);
//const cnpjcgm = '85017994000101'; oid
var cnpjdest, cnpjemit, where, s1,s2,pastaDest,cod: String;
    nItens, i, cod_item : Integer;
    res : Variant;
    qEmb, fator : Currency;
    operacao : String;
    //vDesc, , vlr_unit : Currency;
    pDesc : Currency;
    cnpjLocal , xml: String;
    c : Char;
    dtv,dtf : TDateTime;
    nfe: TNFe;
    nfeR: TNFeXmlReader;
begin
  ProgressBar1.Position:= 0;
  ProgressBar1.Max     := 20;

  ProgressBar1.Position:= 2;
  nfe  := TNFe.Create;
  nfeR := TNFeXmlReader.Create(nfe);
  nfeR.CarregarArquivo(FileName);
  nfeR.LerXml;
  ProgressBar1.Position:= 5;
  StartWait;
  try
    ExecSql(dbConnect.ZConnection1,'Begin Work');
    cnpjLocal  := ExecSql(dbConnect.ZConnection1,'Select limpa_cnpj(cnpj) from empresa where id=%s',[getEmpresaPadrao(meCodigo)]);
    qryNfEntrada.Close;
    OpenTable( qryNfEntrada );
    qryNfEntrada.Append;
    qryNfEntradafinalidade_nf.ASInteger:= 2;
    qryNfEntradanumeronf.ASInteger     := NFe.Ide.nNF;
    qryNFEntradanatop.AsString         := LeftStr(NFe.Ide.natOp,40);
    qryNfEntradadataemissao.AsDateTime := NFe.Ide.dEmi;
    qryNfEntradadataentrada.AsDateTime := Date;
    qryNfEntradaserie.AsInteger        := NFe.Ide.serie;
    qryNfEntradachave_nfe.AsString     := OnlyNumber(NFe.infNFe.ID);
    ProgressBar1.Position:= 7;
    cod := ExecSql(dbConnect.ZConnection1,'Select id from fornecedores where limpa_cnpj(cnpj)=''%s''',[NFe.Emit.CNPJCPF]);
    qryNfEntradacliente_forn.AsString := cod;
    if not SetFornecedor( NFe.Emit.CNPJCPF ) then begin
       Raise Exception.Create('Não localizado o fornecedor. Não é possível importar nota.');
{
        qryNfEntradafornecedor.AsString := NFe.Emit.xNome;
        qryNfEntradaendereco.AsString   := NFe.Emit.EnderEmit.xLgr+', '+NFe.Emit.EnderEmit.nro;
        qryNfEntradacidade.AsString     := NFe.Emit.EnderEmit.xMun;
        qryNfEntradabairro.AsString     := NFe.Emit.EnderEmit.xBairro;
        qryNfEntradacep.AsString        := IntToStr(NFe.Emit.EnderEmit.CEP);
        qryNfEntradacomplemento.AsString:= NFe.Emit.EnderEmit.xCpl;
        qryNfEntradauf.AsString         := NFe.Emit.EnderEmit.UF;
        qryNfEntradatelefone1.AsString  := NFe.Emit.EnderEmit.fone;
        qryNfEntradainscrestadual.AsString:= NFe.Emit.IE;
        }
    end;
    qryNFEntradacrt.AsString            := CRTToStr(NFe.Emit.CRT);
    qryNfEntradainscrestsubtrib.AsString:= NFe.Emit.IEST;
    ProgressBar1.Position:= 8;
    qryNfEntradabaseicms.AsCurrency     := NFe.Total.ICMSTot.vBC;
    qryNfEntradavaloricms.AsCurrency    := NFe.Total.ICMSTot.vICMS;
    qryNfEntradabaseicmssub.AsCurrency  := NFe.Total.ICMSTot.vBCST;
    qryNfEntradavaloricmssub.AsCurrency := NFe.Total.ICMSTot.vST;
    qryNfEntradavalortotalprodutos.AsCurrency := NFe.Total.ICMSTot.vProd;
    qryNfEntradavalorfrete.AsCurrency   := NFe.Total.ICMSTot.vFrete;
    qryNfEntradavalorseguro.AsCurrency  := NFe.Total.ICMSTot.vSeg;
    qryNfEntradavaloroutradesp.AsCurrency := NFe.Total.ICMSTot.vOutro;
    qryNfEntradavaloripi.AsCurrency       := NFe.Total.ICMSTot.vIPI;
    qryNFEntradavalorpis.AsCurrency       := NFe.Total.ICMSTot.vPIS;
    qryNFEntradavalorcofins.AsCurrency    := NFe.Total.ICMSTot.vCOFINS;
    qryNfEntradavalortotalnota.AsCurrency := NFe.Total.ICMSTot.vNF;

    ProgressBar1.Position:= 9;
    if not SetTransportadora(NFe.Transp.Transporta.CNPJCPF) then begin
       qryNfEntradacodtransp.ASInteger  := 0;
       qryNfEntradanometransp.AsString  := LeftStr(NFe.Transp.Transporta.xNome,80);
       qryNfEntradacnpjtransp.AsString  := NFe.Transp.Transporta.CNPJCPF;
       qryNfEntradaendtransp.AsString   := NFe.Transp.Transporta.xEnder;
       qryNfEntradacidadetransp.AsString:= Copy(NFe.Transp.Transporta.xMun,1,40);
       qryNfEntradauftransp.AsString    := NFe.Transp.Transporta.UF;
       qryNFEntradaietransp.AsString    := NFe.Transp.Transporta.IE;
    end;
    ProgressBar1.Position:= 10;
    qryNfEntradafreteconta.AsString   := modFreteToStr(NFe.Transp.modFrete);
    qryNfEntradaplacaveiculo.AsString := NFe.Transp.veicTransp.placa;
    qryNfEntradaufveiculo.AsString    := NFe.Transp.veicTransp.UF;

    if NFe.Transp.Vol.Count > 0 then begin
      qryNfEntradaquantvolumes.ASInteger   := NFe.Transp.Vol.Items[0].qVol;//NFe.Transp.Vol.Count;
      qryNfEntradaespecievol.AsString      := NFe.Transp.Vol.Items[0].esp;
      qryNfEntradamarcavol.AsString        := NFe.Transp.Vol.Items[0].marca;
      qryNfEntradanumerovol.AsString       := NFe.Transp.Vol.Items[0].nVol;
      qryNfEntradapesobrutovol.AsCurrency  := NFe.Transp.Vol.Items[0].pesoB;
      qryNfEntradapesoliquidovol.AsCurrency:= NFe.Transp.Vol.Items[0].pesoL;
    end;
    ProgressBar1.Position:= 11;

    qryNfEntradadadosadicionais.AsString:= NFe.InfAdic.infCpl;
    qryNfEntradareservadofisco.AsString := NFe.InfAdic.infAdFisco;
    qryNfEntradalancada.AsBoolean       := False;
    qryNfEntradadesconto.AsCurrency     := 0;

    PostTable(qryNfEntrada);
    ProgressBar1.Position:= 12;
    tbItensEntrada.Close;
    OpenTable( tbItensEntrada );

    for nItens := 0 to NFe.Det.Count-1 do begin
        cod_item := LocalizaPeloEAN(NFe.Det.Items[nItens].Prod.cEAN);
        if cod_item = 0 then
         cod_item := LocalizaPeloCodForn(NFe.Det.Items[nItens].Prod.cProd,qryNfEntradacliente_forn.AsString);
        if cod_item = 0 then begin
           ShowMessageFmt('Produto "%s" não foi encontrado no cadastro. Necessário entrada manual.',[NFe.Det.Items[nItens].Prod.xProd]);
           Titulo := NFe.Det.Items[nItens].Prod.xProd;
           res := ShowSearchWindowModalValue(dbConnect.ZConnection1,'produtos','codigo_barras,id,descricao',
                                            'id','descricao',NFe.Det.Items[nItens].Prod.xProd,'0=0','0=0',False);
           if VarIsNull(Res) then Begin
              if MessageDlg('Você não definiu um item da nota. Você quer continuar a importação desta Nota ?',mtConfirmation,[mbNo,mbYes],0) = mrYes then
               begin
                 Continue;
                 //res := 0;
               end
              else Break;//Raise Exception.Create('Importação abortada');
           end;
           cod_item := res;
        end;

        QueProduto.Close;
        QueProduto.ParamByName('id').AsInteger := cod_item;
        OpenTable( QueProduto );

        tbItensEntrada.Append;
        tbItensEntradanfentrada.AsInteger     := qryNfEntradaid.ASInteger;
        tbItensEntradacodificacao_fornecedor.ASstring := NFe.Det.Items[nItens].Prod.cProd;
        tbItensEntradacodigo_barras.ASstring  := NFe.Det.Items[nItens].Prod.cEAN;
        tbItensEntradaproduto.AsInteger       := QueProduto.FieldByName('id').AsInteger;
        tbItensEntradadescricao.AsString      := QueProduto.FieldByName('descricao').AsString;
        tbItensEntradadescricao_xml.AsString  := NFe.Det.Items[nItens].Prod.xProd;
        tbItensEntradaestoque_destino.AsString:= 'N';
        tbItensEntradainfadprod.AsString      := NFe.Det.Items[nItens].Prod.xProd +
                                                 NFe.Det.Items[nItens].infAdProd;

        tbItensEntradaquantidade.AsCurrency   := NFe.Det.Items[nItens].Prod.qCom;
        qEmb := GetFatorFornecedorToEstoque(QueProduto.FieldByName('id').AsInteger, fator, operacao );
        if operacao = '*' then
           tbItensEntradaquant_estoque.AsCurrency := (tbItensEntradaquantidade.AsCurrency * qEmb);
        if operacao = '/' then
           tbItensEntradaquant_estoque.AsCurrency := (tbItensEntradaquantidade.AsCurrency / qEmb);

        tbItensEntradaunidade.AsString        := NFe.Det.Items[nItens].Prod.uCom;
        tbItensEntradancm.AsString            := NFe.Det.Items[nItens].Prod.NCM;
        tbItensEntradacest.AsString            := NFe.Det.Items[nItens].Prod.CEST;
        tbItensEntradavdesconto.AsCurrency    := NFe.Det.Items[nItens].Prod.vDesc;
        pDesc := NFe.Det.Items[nItens].Prod.vDesc * 100 / (NFe.Det.Items[nItens].Prod.vProd);
        tbItensEntradavdesconto.AsCurrency       := NFe.Det.Items[nItens].Prod.vDesc;//SimpleRoundTo(pDesc);
        tbItensEntradavalortotal.AsCurrency      := NFe.Det.Items[nItens].Prod.vProd;
        tbItensEntradavalorunitario.AsCurrency   := NFe.Det.Items[nItens].Prod.vUnCom;
        tbItensEntradavlr_unit_estoque.AsCurrency:= NFe.Det.Items[nItens].Prod.vProd/tbItensEntradaquant_estoque.AsCurrency;
        tbItensEntradacfop.AsString              := NFe.Det.Items[nItens].Prod.CFOP;
        tbItensEntradanfci_opc.AsString          := NFe.Det.Items[nItens].Prod.nFCI;
        {ICMS}
        if NFe.Emit.CRT = crtSimplesNacional then begin//, crtSimplesExcessoReceita, crtRegimeNormal
           tbItensEntradaorig.AsString           := OrigToStr(NFe.Det.Items[nItens].Imposto.ICMS.orig);
           tbItensEntradacst_csosn.AsString      := CSOSNIcmsToStr(NFe.Det.Items[nItens].Imposto.ICMS.CSOSN);
           tbItensEntradap_icms.AsCurrency       := NFe.Det.Items[nItens].Imposto.ICMS.pCredSN;
           tbItensEntradavlr_icms.AsCurrency     := NFe.Det.Items[nItens].Imposto.ICMS.vCredICMSSN/tbItensEntradaquant_estoque.AsInteger;
        end else begin
           tbItensEntradaorig.AsString           := OrigToStr(NFe.Det.Items[nItens].Imposto.ICMS.orig);
           tbItensEntradacst_csosn.AsString      := CSTICMSToStr(NFe.Det.Items[nItens].Imposto.ICMS.CST);
           tbItensEntradap_icms.AsCurrency       := NFe.Det.Items[nItens].Imposto.ICMS.pICMS;
           tbItensEntradavlr_icms.AsCurrency     := NFe.Det.Items[nItens].Imposto.ICMS.vICMS/tbItensEntradaquant_estoque.AsInteger;
       end;
       tbItensEntradavbcicms.AsCurrency          := NFe.Det.Items[nItens].Imposto.ICMS.vBC;
       tbItensEntradapredbc.AsCurrency           := NFe.Det.Items[nItens].Imposto.ICMS.pRedBC;
       tbItensEntradamodbc.AsString              := modBCToStr(NFe.Det.Items[nItens].Imposto.ICMS.modBC);
       {ST}
       tbItensEntradavbcst.AsCurrency            := NFe.Det.Items[nItens].Imposto.ICMS.vBCST;
       tbItensEntradamodbcst.AsString            := modBCSTToStr(NFe.Det.Items[nItens].Imposto.ICMS.modBCST);
       tbItensEntradapicmsst.AsCurrency          := NFe.Det.Items[nItens].Imposto.ICMS.pICMSST;
       tbItensEntradapmvast.AsCurrency           := NFe.Det.Items[nItens].Imposto.ICMS.pMVAST;
       tbItensEntradapredbcst.AsCurrency         := NFe.Det.Items[nItens].Imposto.ICMS.pRedBCST;
       tbItensEntradavicmsst.AsCurrency          := NFe.Det.Items[nItens].Imposto.ICMS.vICMSST;

       {IPI}
       tbItensEntradacst_ipi.AsString            := CSTIPIToStr(NFe.Det.Items[nItens].Imposto.IPI.CST);
       tbItensEntradavbcipi.AsCurrency           := NFe.Det.Items[nItens].Imposto.IPI.vBC;
       tbItensEntradapipi.AsCurrency             := NFe.Det.Items[nItens].Imposto.IPI.pIPI;
       tbItensEntradavipi.AsCurrency             := NFe.Det.Items[nItens].Imposto.IPI.vIPI;
       {Cofins}
       tbItensEntradacst_cofins.AsString         := CSTCOFINSToStr(NFe.Det.Items[nItens].Imposto.COFINS.CST);
       tbItensEntradavbc_cofins.AsCurrency       := NFe.Det.Items[nItens].Imposto.COFINS.vBC;
       tbItensEntradapcofins.AsCurrency          := NFe.Det.Items[nItens].Imposto.COFINS.pCOFINS;
       tbItensEntradavcofins.AsCurrency          := NFe.Det.Items[nItens].Imposto.COFINS.vCOFINS;
       {PIS}
       tbItensEntradacst_pis.AsString            := CSTPISToStr(NFe.Det.Items[nItens].Imposto.PIS.CST);
       tbItensEntradavbc_pis.AsCurrency          := NFe.Det.Items[nItens].Imposto.PIS.vBC;
       tbItensEntradappis.AsCurrency             := NFe.Det.Items[nItens].Imposto.PIS.pPIS;
       tbItensEntradavpis.AsCurrency             := NFe.Det.Items[nItens].Imposto.PIS.vPIS;
       PostTable(tbItensEntrada);
       SetDecimalSeparator('.');
       try
           if NFe.Det.Items[nItens].Prod.med.Count = 0 then begin
              ExecSql(dbConnect.ZConnection1,'INSERT INTO nfentrada_itens_lotes(nfentrada_itens,'+
                                             'quantidade,quantidade_estoque) '+
                                             'VALUES (%d, %f, %f)',
                                   [LastInsertID(dbConnect.ZConnection1,'nfentrada_itens_id_seq'),
                                    NFe.Det.Items[nItens].Prod.qCom,
                                    tbItensEntradaquant_estoque.AsCurrency]);
           end;
           {INSERT INTO nfentrada_itens_lotes(
            id, nfentrada_itens, numerolote, quantidade, quantidade_estoque,
            pmc, data_frabricacao, data_vencimento, lote)}
           for i := 0 to NFe.Det.Items[nItens].Prod.med.Count -1 do begin
               dtv := NFe.Det.Items[nItens].Prod.med.Items[i].dVal;
               dtf := NFe.Det.Items[nItens].Prod.med.Items[i].dFab;
               if (dtf = 0) and (dtv <> 0) then
                   dtf := IncMonth(dtv, QueProduto.FieldByName('prazo_validade').AsInteger * -1)
               else if (dtf <> 0) and (dtv = 0) then
                       dtv := IncMonth(dtf, QueProduto.FieldByName('prazo_validade').AsInteger);

               ExecSql(dbConnect.ZConnection1,'INSERT INTO nfentrada_itens_lotes(nfentrada_itens, numerolote, '+
                                              'quantidade, quantidade_estoque, pmc,data_vencimento,data_frabricacao) '+
                                     'VALUES (%d, ''%s'', %f, %f, ''%.2f'', ''%s'', ''%s'')',
                                     [LastInsertID(dbConnect.ZConnection1,'nfentrada_itens_id_seq'),
                                      NFe.Det.Items[nItens].Prod.med.Items[i].nLote,
                                      NFe.Det.Items[nItens].Prod.med.Items[i].qLote,
                                      NFe.Det.Items[nItens].Prod.med.Items[i].qLote * qEmb,
                                      NFe.Det.Items[nItens].Prod.med.Items[i].vPMC,
                                      DateToStr(dtv),
                                      DateToStr(dtf)
                                      ]);
           end;
       finally
           RestoreDecimalSeparator;
       end;
    end;
    ProgressBar1.Position:= 15;
    //NFe.Cobr.Fat.
    qryPreCtaPagar.Close;
    qryPreCtaPagar.ParamByName('id').AsInteger := qryNfEntradaid.ASInteger;
    OpenTable( qryPreCtaPagar );
    //Lançamento de contas a pagar
    for i := 0 to NFe.Cobr.Dup.Count -1 do begin
        qryPreCtaPagar.Append;
        qryPreCtaPagarid_nf.AsInteger           := qryNfEntradaid.AsInteger;
        qryPreCtaPagarfornecedor.AsInteger      := qryNfEntradacliente_forn.AsInteger;
        qryPreCtaPagardescricao.AsString        := qryNfEntradafornecedor.AsString;
        qryPreCtaPagardocumento.AsString        := NFe.Cobr.Dup.Items[i].nDup;
        qryPreCtaPagardataconta.AsDateTime      := Date;
        qryPreCtaPagardata_vencimento.AsDateTime:= NFe.Cobr.Dup.Items[i].dVenc;
        qryPreCtaPagarvalor_devido.AsCurrency   := NFe.Cobr.Dup.Items[i].vDup;
        qryPreCtaPagar.Post;
    end;
    ProgressBar1.Position:= 20;
    StopWait;
    ExecSql(dbConnect.ZConnection1,'Commit');
    xml:= RemoverDeclaracaoXML(LeFileToString(FileNameEdit1.FileName));
    xml:= '<?xml version="1.0" encoding="UTF-8"?>'+ DelCharss(xml,#10#13);
    ImportaXMLToDBFromStr(dbConnect.ZConnection1,'nfentrada_xml','nfentrada',qryNfEntradaid.AsString,'xml_str',xml);
    ShowMessage('Importação concluida.');
  Except
    RestoreDecimalSeparator;
    ExecSql(dbConnect.ZConnection1,'Rollback');
    StopWait;
    raise;
  end;
end;

procedure TfrmImportarNFe.Button2Click(Sender: TObject);
begin
  Close;
end;

function TfrmImportarNFe.SetFornecedor( cnpj : String ): Boolean;
begin
    qryFornecedor.Close;
    qryFornecedor.Sql.Clear;
    qryFornecedor.Sql.Add('Select * from fornecedores ');
    qryFornecedor.Sql.add(Format('Where limpa_cnpj(cnpj)=limpa_cnpj(''%s'')',[cnpj]));
    OpenTable( qryFornecedor );
    if qryFornecedor.Eof and qryFornecedor.Bof then Begin
      Result := False;
      Exit;
    end;
    qryNfEntradacliente_forn.AsInteger:= qryFornecedorid.AsInteger;
    qryNfEntradafornecedor.AsString   := Copy(qryFornecedornome.AsString,1,40);
    qryNfEntradaendereco.AsString     := Copy(qryFornecedorendereco.AsString,1,40);
    qryNfEntradacidade.AsString       := Copy(qryFornecedorcidade.AsString,1,40);
    qryNfEntradabairro.AsString       := qryFornecedorbairro.AsString;
    qryNfEntradacep.AsString          := qryFornecedorcep.AsString;
    qryNfEntradacomplemento.AsString  := Copy(qryFornecedorcomplemento.AsString,1,40);
    qryNfEntradauf.AsString           := qryFornecedoruf.AsString;
    qryNfEntradatelefone1.AsString    := qryFornecedortelefone1.AsString;
    qryNfEntradainscrestadual.AsString:= qryFornecedorinscestadual.AsString;
    qryNfEntradacnpjcpf.AsString      := qryFornecedorcnpj.AsString;
    Result := True;
    //ShowMessageFmt('%d %d %s',[qryNfEntradacliente_forn.AsInteger,qryFornecedorid.AsInteger,cnpj]);
end;

function TfrmImportarNFe.LocalizaPeloEAN(codbarras: string): Integer;
begin
  if Length(codbarras) = 0 then Result := 0
  else
     Result := StrToIntDef(ExecSql(dbConnect.ZConnection1,'Select coalesce(id,0) From produtos Where codigo_barras=''%s'' and ativo=True',[codbarras]),0);
end;

function TfrmImportarNFe.LocalizaPeloCodForn( cod_prod, cod_forn: string ): Integer;
begin
  if Length(cod_forn) = 0 then Result := 0
  else
     Result := StrToIntDef(ExecSql(dbConnect.ZConnection1,'Select coalesce(fp.produto,0) From fornecedor_produto fp '+
                                                          'Left Join produtos p ON p.id=fp.produto and ativo=True '+
                                                          'Where fp.codigo_produto=''%s'' and fp.fornecedor=%s ',
                                                          [cod_prod,cod_forn]),0);

end;

function TfrmImportarNFe.GetFatorFornecedorToEstoque( const codprod: Integer; out fator : currency; out operacao : String): Double;
Var qry : TZQuery;
begin
  qry     := ExecSqlQuery(dbConnect.ZConnection1,'Select coalesce(quant_caixa,1) as quant_caixa, quant_caixa_operacao From produtos Where id=%d',[codprod]);
  Result  := Max(qry.FieldByName('quant_caixa').AsFloat,1);
  fator   := Max(qry.FieldByName('quant_caixa').AsFloat,1);
  operacao:= ifthen( Length(qry.FieldByName('quant_caixa_operacao').AsString)=0,'*',qry.FieldByName('quant_caixa_operacao').AsString);
end;
function TfrmImportarNFe.SetTransportadora( cnpj : String): Boolean;
Begin
    Result := False;
    Exit;

    qryTransportadora.Close;
    qryTransportadora.ParamByName('cnpj').Asstring := cnpj;
    OpenTable( qryTransportadora );
    if qryTransportadora.Eof and qryTransportadora.Bof then Begin
    //  MessageDlg('Não foi possível localizar a transportadora.',mtWarning,[mbOk],0);
      Result := False;
      Exit;
    end;
    qryNfEntradacodtransp.ASInteger  := qryTransportadoracodtransp.ASInteger;
    qryNfEntradanometransp.AsString  := qryTransportadoranometransp.AsString;
    qryNfEntradacnpjtransp.AsString  := qryTransportadoracnpj.AsString;
    qryNfEntradaendtransp.AsString   := qryTransportadoraendereco.AsString;
    qryNfEntradacidadetransp.AsString:= qryTransportadoracidade.AsString;
    qryNfEntradauftransp.AsString    := qryTransportadorauf.AsString;
    qryNFEntradaietransp.AsString    := qryTransportadoraie.AsString;
end;


initialization
//  {$I uimportarnfe.lrs}
  TDisableDefaultDialogError.Register;
end.

